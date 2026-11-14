#!/usr/bin/env python3
"""Generate the "TEO-5 MIDI" Max for Live MIDI Effect (.amxd + .maxpat).

8 absolute encoders with fixed labels, parameter names and CC numbers.

Signal flow per encoder:
    [live.dial <Label>] -> [change] -> [gate 1 0] -> [t b i]
        -> [pack 176 <cc> 0] -> [iter] -> [midiout]

All gates start closed and open 250 ms after [live.thisdevice] signals that the
device has loaded, so values restored at load are never sent. [change] drops
repeated values, so a message goes out only when an encoder's value changes.

Status byte 176 (0xB0) = Control Change on channel 1. In a MIDI Effect, Live
routes the device output through the track, so the track's MIDI To routing /
channel determines where the message ends up. Incoming MIDI passes through
via [midiin] -> [midiout].
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))  # repo root
from lib.amxd import write_device  # noqa: E402

DEVICE_NAME = "TEO-5 MIDI"

# (label = parameter long name = parameter short name, MIDI CC number)
ENCODERS = [
    ("Cutoff", 33),
    ("Resonance", 34),
    ("Filter", 35),
    ("Reverb", 24),
    ("Effects", 19),
    ("Volume", 7),
    ("Distortion", 67),
    ("Vintage", 37),
]

COLS = 4                        # encoders per presentation row (2 rows of 4)
COL_W = 84                      # presentation column width (px)
ROW_H = 82                      # presentation row height (px)
DEVICE_W = 8 + COLS * COL_W
OUT_DIR = Path(__file__).resolve().parent / "dist"

FG = [0.88, 0.88, 0.88, 1.0]
DIM = [0.6, 0.6, 0.6, 1.0]
ACCENT = [1.0, 0.71, 0.196, 1.0]

boxes, lines = [], []
_next_id = [0]


def add_box(**box):
    _next_id[0] += 1
    box.setdefault("id", f"obj-{_next_id[0]}")
    boxes.append({"box": box})
    return box["id"]


def newobj(text, rect, ninlets, noutlets, outlettype=None):
    return add_box(maxclass="newobj", text=text, patching_rect=rect,
                   numinlets=ninlets, numoutlets=noutlets,
                   outlettype=outlettype if outlettype is not None else [""] * noutlets)


def comment(text, rect, prect, color, size, face=0):
    return add_box(maxclass="live.comment", text=text, patching_rect=rect,
                   presentation=1, presentation_rect=prect,
                   numinlets=1, numoutlets=0, outlettype=[],
                   fontsize=size, fontface=face, textjustification=1, textcolor=color)


def connect(src, src_out, dst, dst_in):
    lines.append({"patchline": {"source": [src, src_out], "destination": [dst, dst_in]}})


# ---------------------------------------------------------------- MIDI thru
midiin = newobj("midiin", [20, 20, 45, 22], 1, 1, ["int"])
midiout = newobj("midiout", [20, 400, 55, 22], 1, 0, [])
connect(midiin, 0, midiout, 0)

# ---------------------------------------------------------------- load gate
# Live restores/initializes dial values while the device loads. The gates stay
# closed until 250 ms after [live.thisdevice] reports the device is loaded.
thisdev = newobj("live.thisdevice", [1250, 20, 90, 22], 1, 3, ["bang", "int", "int"])
delay = newobj("delay 250", [1250, 50, 60, 22], 2, 1, ["bang"])
open_gate = newobj("t 1", [1250, 80, 30, 22], 1, 1, ["int"])
connect(thisdev, 0, delay, 0)
connect(delay, 0, open_gate, 0)

# ---------------------------------------------------------------- encoders
for i, (label, cc) in enumerate(ENCODERS):
    px = 100 + i * 140             # patching x
    row, col = divmod(i, COLS)
    vx = 8 + col * COL_W            # presentation x
    y0 = 4 + row * ROW_H            # presentation row top

    comment(label, [px, 60, 64, 18], [vx - 2, y0, COL_W - 4, 16], FG, 10.0, 1)

    dial = add_box(
        maxclass="live.dial", varname=label,
        patching_rect=[px, 90, 44, 48], presentation=1,
        presentation_rect=[vx + (COL_W - 8 - 48) / 2, y0 + 18, 48, 54],
        numinlets=1, numoutlets=2, outlettype=["", "float"],
        parameter_enable=1, showname=0, shownumber=1,
        activedialcolor=ACCENT,
        saved_attribute_attributes={"valueof": {
            "parameter_longname": label,
            "parameter_shortname": label,  # shown on Push
            "parameter_type": 1,           # int
            "parameter_mmin": 0.0,
            "parameter_mmax": 127.0,
            "parameter_initial_enable": 0,  # don't force a value on load
            "parameter_initial": [0],
            "parameter_unitstyle": 0,      # Int
        }},
    )

    # only changed values pass; nothing passes until the load gate opens
    chg = newobj("change", [px, 150, 50, 22], 1, 3, ["", "int", "int"])
    gate = newobj("gate 1 0", [px, 180, 50, 22], 2, 1, [""])
    connect(dial, 0, chg, 0)
    connect(chg, 0, gate, 1)
    connect(open_gate, 0, gate, 0)

    # CC message: 176 (0xB0) <cc> <value>
    trig = newobj("t b i", [px, 220, 40, 22], 1, 2, ["bang", "int"])
    pack = newobj(f"pack 176 {cc} 0", [px, 250, 90, 22], 3, 1)
    it = newobj("iter", [px, 280, 34, 22], 1, 1, ["int"])
    connect(gate, 0, trig, 0)
    connect(trig, 1, pack, 2)        # value first (right-to-left order)
    connect(trig, 0, pack, 0)        # then bang -> output list
    connect(pack, 0, it, 0)
    connect(it, 0, midiout, 0)

patcher = {
    "patcher": {
        "fileversion": 1,
        "appversion": {"major": 8, "minor": 5, "revision": 5,
                       "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [100.0, 100.0, 1300.0, 520.0],
        "openrect": [0.0, 0.0, float(DEVICE_W), 169.0],
        "bglocked": 0,
        "openinpresentation": 1,
        "default_fontsize": 10.0,
        "default_fontface": 0,
        "default_fontname": "Arial Bold",
        "gridonopen": 1,
        "gridsize": [8.0, 8.0],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 2,
        "toolbarvisible": 1,
        "boxanimatetime": 500,
        "enablehscroll": 1,
        "enablevscroll": 1,
        "devicewidth": float(DEVICE_W),
        "description": "TEO-5 MIDI: 8 absolute encoders sending fixed MIDI CCs",
        "digest": "",
        "tags": "",
        "style": "",
        "subpatcher_template": "",
        "assistshowspatchername": 0,
        "boxes": boxes,
        "lines": lines,
        "dependency_cache": [],
        "latency": 0,
        "is_mpe": 0,
        "external_mpe_tuning_enabled": 0,
        "minimum_live_version": "",
        "minimum_max_version": "",
        "platform_compatibility": 0,
        "autosave": 0,
    }
}


def main():
    write_device(patcher, OUT_DIR, DEVICE_NAME, device_type="midi")
    print(f"wrote {len(boxes)} boxes, {len(lines)} lines -> {OUT_DIR}")


if __name__ == "__main__":
    main()
