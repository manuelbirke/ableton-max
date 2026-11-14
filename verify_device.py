#!/usr/bin/env python3
"""Static checks for the generated TEO-5 MIDI .amxd (no Max/Live required)."""
import json
import struct
import sys
from pathlib import Path

EXPECTED = [("Cutoff", 33), ("Resonance", 34), ("Filter", 35), ("Reverb", 24),
            ("Effects", 33), ("Volume", 7), ("Distortion", 67), ("Vintage", 37)]

path = Path(__file__).resolve().parent / "dist" / "TEO-5 MIDI.amxd"
data = path.read_bytes()

assert data[:4] == b"ampf" and struct.unpack("<I", data[4:8])[0] == 4
assert data[8:12] == b"mmmm", "device type must be MIDI effect"
assert data[12:16] == b"meta"
mlen = struct.unpack("<I", data[16:20])[0]
off = 20 + mlen
assert data[off:off + 4] == b"ptch"
plen = struct.unpack("<I", data[off + 4:off + 8])[0]
payload = data[off + 8:]
assert len(payload) == plen, "ptch length mismatch"
p = json.loads(payload.rstrip(b"\x00").decode("utf-8"))["patcher"]

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
               key=lambda b: b["presentation_rect"][0])
assert len(dials) == 8

for b in boxes.values():
    if b.get("presentation"):
        x, y, w, h = b["presentation_rect"]
        assert y + h <= 169 and x + w <= p["devicewidth"], b["id"]


def outs(src, outlet):
    return [l["patchline"]["destination"] for l in p["lines"]
            if l["patchline"]["source"] == [src, outlet]]


comments = {b["text"] for b in boxes.values() if b["maxclass"] == "live.comment"}
for n, (d, (label, cc)) in enumerate(zip(dials, EXPECTED), 1):
    v = d["saved_attribute_attributes"]["valueof"]
    assert v["parameter_longname"] == v["parameter_shortname"] == label, v
    assert v["parameter_type"] == 1 and v["parameter_mmin"] == 0 and v["parameter_mmax"] == 127
    assert label in comments and f"CC {cc}" in comments
    trig = outs(d["id"], 0)[0][0]
    pack_id = outs(trig, 1)[0][0]
    assert outs(trig, 1) == [[pack_id, 2]] and outs(trig, 0) == [[pack_id, 0]]
    assert boxes[pack_id]["text"] == f"pack 176 {cc} 0", boxes[pack_id]["text"]
    it = outs(pack_id, 0)[0][0]
    assert boxes[outs(it, 0)[0][0]]["text"] == "midiout"
    print(f"Encoder {n}: label/short name '{label}' -> sends [0xB0, {cc}, 0-127]")

print(f"OK: {len(boxes)} boxes, {len(p['lines'])} lines, {len(data)} bytes")
sys.exit(0)
