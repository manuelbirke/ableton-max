"""Shared builder + static verifier for "8 fixed CC encoders" MIDI Effects.

Each device supplies a name and a list of (label, cc) pairs. The label is used
as the on-device label, the parameter long name and the parameter short name
(shown on Push).

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

Presentation: 2 rows of 4 encoders, fits Live's 169 px device height.
"""
from pathlib import Path

from lib.amxd import read_amxd, write_device

COLS = 4                        # encoders per presentation row (2 rows of 4)
COL_W = 84                      # presentation column width (px)
ROW_H = 82                      # presentation row height (px)
DEVICE_W = 8 + COLS * COL_W
DEVICE_H = 169
LOAD_DELAY_MS = 250

FG = [0.88, 0.88, 0.88, 1.0]
ACCENT = [1.0, 0.71, 0.196, 1.0]


def _check_encoders(encoders):
    assert len(encoders) == 8, "exactly 8 encoders (2 rows of 4)"
    labels = [label for label, _ in encoders]
    assert len(set(labels)) == 8, f"labels must be unique: {labels}"
    for label, cc in encoders:
        assert label and isinstance(label, str), label
        assert isinstance(cc, int) and 0 <= cc <= 127, f"{label}: CC {cc} out of range"


def build_patcher(name, encoders):
    """Return the patcher dict for an 8-encoder CC device."""
    _check_encoders(encoders)
    boxes, lines = [], []
    next_id = [0]

    def add_box(**box):
        next_id[0] += 1
        box.setdefault("id", f"obj-{next_id[0]}")
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

    # MIDI thru
    midiin = newobj("midiin", [20, 20, 45, 22], 1, 1, ["int"])
    midiout = newobj("midiout", [20, 400, 55, 22], 1, 0, [])
    connect(midiin, 0, midiout, 0)

    # load gate
    thisdev = newobj("live.thisdevice", [1250, 20, 90, 22], 1, 3, ["bang", "int", "int"])
    delay = newobj(f"delay {LOAD_DELAY_MS}", [1250, 50, 60, 22], 2, 1, ["bang"])
    open_gate = newobj("t 1", [1250, 80, 30, 22], 1, 1, ["int"])
    connect(thisdev, 0, delay, 0)
    connect(delay, 0, open_gate, 0)

    # encoders
    for i, (label, cc) in enumerate(encoders):
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

    return {
        "patcher": {
            "fileversion": 1,
            "appversion": {"major": 8, "minor": 5, "revision": 5,
                           "architecture": "x64", "modernui": 1},
            "classnamespace": "box",
            "rect": [100.0, 100.0, 1300.0, 520.0],
            "openrect": [0.0, 0.0, float(DEVICE_W), float(DEVICE_H)],
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
            "description": f"{name}: 8 absolute encoders sending fixed MIDI CCs",
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


def generate(name, encoders, device_dir):
    """Build dist/<name>.amxd + .maxpat inside device_dir."""
    patcher = build_patcher(name, encoders)
    out_dir = Path(device_dir) / "dist"
    write_device(patcher, out_dir, name, device_type="midi")
    p = patcher["patcher"]
    print(f"wrote {len(p['boxes'])} boxes, {len(p['lines'])} lines -> {out_dir}")


def verify(name, encoders, device_dir):
    """Static checks of dist/<name>.amxd against the expected encoders.

    Raises AssertionError on any mismatch.
    """
    _check_encoders(encoders)
    path = Path(device_dir) / "dist" / f"{name}.amxd"
    dtype, p, data = read_amxd(path)
    assert dtype == b"mmmm", "device type must be MIDI effect"

    boxes = {b["box"]["id"]: b["box"] for b in p["boxes"]}
    for l in p["lines"]:
        (s, so), (d, di) = l["patchline"]["source"], l["patchline"]["destination"]
        assert so < boxes[s]["numoutlets"], f"bad outlet {s}:{so}"
        assert di < boxes[d]["numinlets"], f"bad inlet {d}:{di}"

    # no editable or dynamic parts
    for b in boxes.values():
        assert b["maxclass"] in ("newobj", "live.dial", "live.comment"), b["maxclass"]
        assert not b.get("text", "").startswith(("js", "pattr", "prepend")), b["text"]

    params = [b for b in boxes.values() if b.get("parameter_enable")]
    assert len(params) == 8, len(params)
    dials = sorted((b for b in boxes.values() if b["maxclass"] == "live.dial"),
                   key=lambda b: (b["presentation_rect"][1], b["presentation_rect"][0]))
    assert len(dials) == 8

    # layout: 2 rows of 4 dials, first 4 (sorted) in the top row
    rows = {}
    for d in dials:
        rows.setdefault(d["presentation_rect"][1], []).append(d)
    assert len(rows) == 2 and all(len(r) == 4 for r in rows.values()), \
        {y: len(r) for y, r in rows.items()}
    top_y = min(rows)
    assert all(d["presentation_rect"][1] == top_y for d in dials[:4])
    assert all(d["presentation_rect"][1] > top_y for d in dials[4:])

    for b in boxes.values():
        if b.get("presentation"):
            x, y, w, h = b["presentation_rect"]
            assert y + h <= DEVICE_H and x + w <= p["devicewidth"], b["id"]

    def outs(src, outlet):
        return [l["patchline"]["destination"] for l in p["lines"]
                if l["patchline"]["source"] == [src, outlet]]

    def by_text(text):
        return [b["id"] for b in boxes.values() if b.get("text") == text]

    comments = {b["text"] for b in boxes.values() if b["maxclass"] == "live.comment"}
    assert not any(c.startswith("CC ") for c in comments), "no CC labels on the device"
    assert comments == {label for label, _ in encoders}, comments

    # load gate: live.thisdevice -> delay -> t 1 -> left inlet of all 8 gates
    (thisdev,) = by_text("live.thisdevice")
    (delay,) = by_text(f"delay {LOAD_DELAY_MS}")
    (open_gate,) = by_text("t 1")
    assert outs(thisdev, 0) == [[delay, 0]] and outs(delay, 0) == [[open_gate, 0]]
    gates = by_text("gate 1 0")
    assert len(gates) == 8
    assert sorted(outs(open_gate, 0)) == sorted([g, 0] for g in gates)
    # the only way into midiout: midiin (thru) and the 8 iter objects behind the gates
    (midiout,) = by_text("midiout")
    into_midiout = [l["patchline"]["source"][0] for l in p["lines"]
                    if l["patchline"]["destination"][0] == midiout]
    assert sorted(boxes[s]["text"] for s in into_midiout) == ["iter"] * 8 + ["midiin"]

    for n, (d, (label, cc)) in enumerate(zip(dials, encoders), 1):
        v = d["saved_attribute_attributes"]["valueof"]
        assert v["parameter_longname"] == v["parameter_shortname"] == label, v
        assert v["parameter_type"] == 1 and v["parameter_mmin"] == 0 and v["parameter_mmax"] == 127
        assert v["parameter_initial_enable"] == 0, "no forced initial value"
        # dial -> change -> gate (right inlet) -> t b i ; no other dial connections
        assert outs(d["id"], 1) == [] and len(outs(d["id"], 0)) == 1
        chg = outs(d["id"], 0)[0][0]
        assert boxes[chg]["text"] == "change" and outs(chg, 1) == outs(chg, 2) == []
        assert len(outs(chg, 0)) == 1 and outs(chg, 0)[0][1] == 1
        gate = outs(chg, 0)[0][0]
        assert gate in gates and len(outs(gate, 0)) == 1
        trig = outs(gate, 0)[0][0]
        assert boxes[trig]["text"] == "t b i"
        pack_id = outs(trig, 1)[0][0]
        assert outs(trig, 1) == [[pack_id, 2]] and outs(trig, 0) == [[pack_id, 0]]
        assert boxes[pack_id]["text"] == f"pack 176 {cc} 0", boxes[pack_id]["text"]
        it = outs(pack_id, 0)[0][0]
        assert boxes[outs(it, 0)[0][0]]["text"] == "midiout"
        print(f"Encoder {n}: '{label}' -> change -> gate -> [0xB0, {cc}, 0-127]")

    lowest = max(b["presentation_rect"][1] + b["presentation_rect"][3]
                 for b in boxes.values() if b.get("presentation"))
    print(f"Layout: width {p['devicewidth']:.0f}px, lowest element ends at "
          f"{lowest:.0f}px (max {DEVICE_H})")
    print(f"OK: {name}: {len(boxes)} boxes, {len(p['lines'])} lines, {len(data)} bytes")
