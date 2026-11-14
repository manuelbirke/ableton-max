#!/usr/bin/env python3
"""Generate the "CC Encoders 8" Max for Live MIDI Effect (.amxd + .maxpat).

Signal flow per encoder N (1..8):
    [live.dial Encoder N] -> [t b i] -> [pack 176 <cc> <value>] -> [iter] -> [midiout]
    [live.numbox CC# N]   ----------------^ (middle inlet sets the CC number)
    [textedit] -> [route text] -> [tosymbol] -> [pattr labelN (blob parameter)]
    [pattr labelN] -> [prepend set] -> [textedit]   (restores the label on load)

Status byte 176 (0xB0) = Control Change on channel 1. In a MIDI Effect, Live
routes the device output through the track, so the track's MIDI To routing /
channel determines where the message ends up. Incoming MIDI is passed through
via [midiin] -> [midiout].
"""
import json
import struct
from pathlib import Path

NUM_ENCODERS = 8
DEFAULT_CC_START = 20          # CC 20..27 are "undefined" in the MIDI spec
COL_W = 68                      # presentation column width (px)
DEVICE_W = 8 + NUM_ENCODERS * COL_W
OUT_DIR = Path(__file__).resolve().parent / "dist"
DEVICE_NAME = "CC Encoders 8"

FG = [0.88, 0.88, 0.88, 1.0]
FIELD_BG = [0.17, 0.17, 0.17, 1.0]
ACCENT = [1.0, 0.71, 0.196, 1.0]

boxes, lines = [], []
_next_id = [0]


def new_id():
    _next_id[0] += 1
    return f"obj-{_next_id[0]}"


def add_box(**box):
    box.setdefault("id", new_id())
    boxes.append({"box": box})
    return box["id"]


def newobj(text, rect, ninlets, noutlets, outlettype=None, **extra):
    return add_box(maxclass="newobj", text=text, patching_rect=rect,
                   numinlets=ninlets, numoutlets=noutlets,
                   outlettype=outlettype if outlettype is not None else [""] * noutlets,
                   **extra)


def connect(src, src_out, dst, dst_in):
    lines.append({"patchline": {"source": [src, src_out], "destination": [dst, dst_in]}})


# ---------------------------------------------------------------- MIDI thru
midiin = newobj("midiin", [20, 20, 45, 22], 1, 1, ["int"])
midiout = newobj("midiout", [20, 520, 55, 22], 1, 0, [])
connect(midiin, 0, midiout, 0)

# ---------------------------------------------------------------- encoders
for i in range(NUM_ENCODERS):
    n = i + 1
    px = 100 + i * 160             # patching x
    vx = 8 + i * COL_W              # presentation x
    default_cc = DEFAULT_CC_START + i

    # -- label (editable, persisted through a blob pattr parameter)
    label = add_box(
        maxclass="textedit", varname=f"label_text_{n}",
        patching_rect=[px, 60, 64, 20], presentation=1,
        presentation_rect=[vx, 6, COL_W - 8, 18],
        numinlets=1, numoutlets=4, outlettype=["", "int", "", ""],
        text=f"Enc {n}", keymode=1, lines=1, wordwrap=0, tabmode=0,
        fontsize=10.0, fontface=1, textjustification=1,
        bgcolor=FIELD_BG, textcolor=FG, bordercolor=[0.3, 0.3, 0.3, 1.0],
        border=1.0, rounded=3.0,
        hint=f"Click, type a label for encoder {n}, press Enter",
    )
    route_text = newobj("route text", [px, 90, 60, 22], 2, 2)
    to_sym = newobj("tosymbol", [px, 118, 58, 22], 1, 1)
    pattr = newobj(
        f"pattr label{n}", [px, 146, 80, 22], 1, 3, ["", "", ""],
        varname=f"label{n}", parameter_enable=1,
        restore=[f"Enc {n}"],
        saved_attribute_attributes={"valueof": {
            "parameter_longname": f"Label {n}",
            "parameter_shortname": f"Label {n}",
            "parameter_type": 3,          # blob: stored with the Live set
            "parameter_invisible": 1,     # stored only, not automatable
        }},
    )
    prepend_set = newobj("prepend set", [px + 70, 90, 72, 22], 1, 1)
    connect(label, 0, route_text, 0)
    connect(route_text, 0, to_sym, 0)
    connect(to_sym, 0, pattr, 0)
    connect(pattr, 0, prepend_set, 0)
    connect(prepend_set, 0, label, 0)

    # -- encoder dial (absolute 0..127, integer, automatable)
    dial = add_box(
        maxclass="live.dial", varname=f"Encoder {n}",
        patching_rect=[px, 200, 44, 48], presentation=1,
        presentation_rect=[vx + (COL_W - 8 - 44) / 2, 28, 44, 48],
        numinlets=1, numoutlets=2, outlettype=["", "float"],
        parameter_enable=1, showname=0, shownumber=1,
        activedialcolor=ACCENT,
        saved_attribute_attributes={"valueof": {
            "parameter_longname": f"Encoder {n}",
            "parameter_shortname": f"Enc {n}",
            "parameter_type": 1,          # int
            "parameter_mmin": 0.0,
            "parameter_mmax": 127.0,
            "parameter_initial_enable": 1,
            "parameter_initial": [0],
            "parameter_unitstyle": 0,     # Int
        }},
    )

    # -- CC number selector
    cc_label = add_box(
        maxclass="live.comment", text="CC#",
        patching_rect=[px + 60, 260, 30, 18], presentation=1,
        presentation_rect=[vx, 84, 26, 18],
        numinlets=1, numoutlets=0, outlettype=[], fontsize=9.0,
        textjustification=0,
    )
    cc_box = add_box(
        maxclass="live.numbox", varname=f"CC# {n}",
        patching_rect=[px + 60, 280, 40, 15], presentation=1,
        presentation_rect=[vx + 26, 85, COL_W - 8 - 26, 15],
        numinlets=1, numoutlets=2, outlettype=["", "float"],
        parameter_enable=1,
        saved_attribute_attributes={"valueof": {
            "parameter_longname": f"CC# {n}",
            "parameter_shortname": f"CC{n}",
            "parameter_type": 1,
            "parameter_mmin": 0.0,
            "parameter_mmax": 127.0,
            "parameter_initial_enable": 1,
            "parameter_initial": [default_cc],
            "parameter_unitstyle": 0,
            "parameter_invisible": 1,     # stored, not shown as automation lane
        }},
    )

    # -- CC message assembly: 176 (0xB0) <cc> <value>
    trig = newobj("t b i", [px, 320, 40, 22], 1, 2, ["bang", "int"])
    pack = newobj(f"pack 176 {default_cc} 0", [px, 380, 90, 22], 3, 1)
    it = newobj("iter", [px, 420, 34, 22], 1, 1, ["int"])
    connect(dial, 0, trig, 0)
    connect(trig, 1, pack, 2)        # value first (right-to-left order)
    connect(trig, 0, pack, 0)        # then bang -> output list
    connect(cc_box, 0, pack, 1)      # CC number (cold inlet, no output)
    connect(pack, 0, it, 0)
    connect(it, 0, midiout, 0)

# footer note in the device UI
add_box(maxclass="live.comment",
        text="Label: click + Enter.  Output: CC on the track's MIDI routing/channel",
        patching_rect=[20, 600, 380, 18], presentation=1,
        presentation_rect=[8, 140, DEVICE_W - 16, 18],
        numinlets=1, numoutlets=0, outlettype=[], fontsize=9.0)

patcher = {
    "patcher": {
        "fileversion": 1,
        "appversion": {"major": 8, "minor": 5, "revision": 5,
                       "architecture": "x64", "modernui": 1},
        "classnamespace": "box",
        "rect": [100.0, 100.0, 1450.0, 680.0],
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
        "description": "8 absolute encoders sending MIDI CC with editable labels and per-encoder CC numbers",
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


def build_amxd(patcher_json: bytes) -> bytes:
    """Wrap patcher JSON in the .amxd container.

    Layout (little-endian uint32 lengths):
      'ampf' len=4 'mmmm'            -> device type: mmmm = MIDI effect
      'meta' len=4 00 00 00 00
      'ptch' len=N <patcher JSON + NUL>
    """
    payload = patcher_json + b"\n\x00"
    return (b"ampf" + struct.pack("<I", 4) + b"mmmm"
            + b"meta" + struct.pack("<I", 4) + b"\x00\x00\x00\x00"
            + b"ptch" + struct.pack("<I", len(payload)) + payload)


def main():
    OUT_DIR.mkdir(exist_ok=True)
    patcher["patcher"]["amxdtype"] = int.from_bytes(b"mmmm", "big")
    text = json.dumps(patcher, indent="\t")
    (OUT_DIR / f"{DEVICE_NAME}.maxpat").write_text(text, encoding="utf-8")
    (OUT_DIR / f"{DEVICE_NAME}.amxd").write_bytes(build_amxd(text.encode("utf-8")))
    print(f"wrote {len(boxes)} boxes, {len(lines)} lines -> {OUT_DIR}")


if __name__ == "__main__":
    main()
