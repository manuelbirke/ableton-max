#!/usr/bin/env python3
"""Static checks for the generated TEO-5 MIDI .amxd (no Max/Live required)."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))  # repo root
from lib.amxd import read_amxd  # noqa: E402

EXPECTED = [("Cutoff", 33), ("Resonance", 34), ("Filter", 35), ("Reverb", 24),
            ("Effects", 19), ("Volume", 7), ("Distortion", 67), ("Vintage", 37)]

path = Path(__file__).resolve().parent / "dist" / "TEO-5 MIDI.amxd"
dtype, p, data = read_amxd(path)
assert dtype == b"mmmm", "device type must be MIDI effect"

boxes = {b["box"]["id"]: b["box"] for b in p["boxes"]}
for l in p["lines"]:
    (s, so), (d, di) = l["patchline"]["source"], l["patchline"]["destination"]
    assert so < boxes[s]["numoutlets"], f"bad outlet {s}:{so}"
    assert di < boxes[d]["numinlets"], f"bad inlet {d}:{di}"

# no editable or dynamic parts left
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
assert len(rows) == 2 and all(len(r) == 4 for r in rows.values()), {y: len(r) for y, r in rows.items()}
top_y = min(rows)
assert all(d["presentation_rect"][1] == top_y for d in dials[:4]), "first 4 dials must be in the top row"
assert all(d["presentation_rect"][1] > top_y for d in dials[4:])

for b in boxes.values():
    if b.get("presentation"):
        x, y, w, h = b["presentation_rect"]
        assert y + h <= 169 and x + w <= p["devicewidth"], b["id"]


def outs(src, outlet):
    return [l["patchline"]["destination"] for l in p["lines"]
            if l["patchline"]["source"] == [src, outlet]]


def by_text(text):
    return [b["id"] for b in boxes.values() if b.get("text") == text]


comments = {b["text"] for b in boxes.values() if b["maxclass"] == "live.comment"}
assert not any(c.startswith("CC ") for c in comments), "CC labels must be removed"
assert comments == {label for label, _ in EXPECTED}, comments

# load gate: live.thisdevice -> delay 250 -> t 1 -> left inlet of all 8 gates
(thisdev,) = by_text("live.thisdevice")
(delay,) = by_text("delay 250")
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

for n, (d, (label, cc)) in enumerate(zip(dials, EXPECTED), 1):
    v = d["saved_attribute_attributes"]["valueof"]
    assert v["parameter_longname"] == v["parameter_shortname"] == label, v
    assert v["parameter_type"] == 1 and v["parameter_mmin"] == 0 and v["parameter_mmax"] == 127
    assert v["parameter_initial_enable"] == 0, "no forced initial value"
    assert label in comments
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
print(f"Layout: width {p['devicewidth']:.0f}px, lowest element ends at {lowest:.0f}px (max 169)")

print(f"OK: {len(boxes)} boxes, {len(p['lines'])} lines, {len(data)} bytes")
sys.exit(0)
