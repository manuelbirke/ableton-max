#!/usr/bin/env python3
"""Static checks for the generated .amxd (no Max/Live required)."""
import json
import struct
import sys
from pathlib import Path

path = Path(__file__).resolve().parent / "dist" / "CC Encoders 8.amxd"
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

params = [b["saved_attribute_attributes"]["valueof"]["parameter_longname"]
          for b in boxes.values() if b.get("parameter_enable")]
assert len(params) == len(set(params)) == 25, params
dials = [b for b in boxes.values() if b["maxclass"] == "live.dial"]
assert len(dials) == 8
for d in dials:
    v = d["saved_attribute_attributes"]["valueof"]
    assert v["parameter_type"] == 1 and v["parameter_mmin"] == 0 and v["parameter_mmax"] == 127

# presentation must fit Live's 169 px device height
for b in boxes.values():
    if b.get("presentation"):
        x, y, w, h = b["presentation_rect"]
        assert y + h <= 169 and x + w <= p["devicewidth"], b["id"]


# simulate the CC path for each encoder: dial -> t b i -> pack -> iter -> midiout
def outs(src, outlet):
    return [(l["patchline"]["destination"]) for l in p["lines"]
            if l["patchline"]["source"] == [src, outlet]]


for d in dials:
    trig = outs(d["id"], 0)[0][0]
    order = sorted(outs(trig, 0) + outs(trig, 1))
    pack_id = outs(trig, 1)[0][0]
    assert outs(trig, 1) == [[pack_id, 2]] and outs(trig, 0) == [[pack_id, 0]]
    status, cc, _ = boxes[pack_id]["text"].split()[1:]
    assert status == "176"
    it = outs(pack_id, 0)[0][0]
    assert boxes[outs(it, 0)[0][0]]["text"] == "midiout"
    print(f"{d['varname']}: sends [0xB0, {cc} (default, set by CC# box), value 0-127]")

    # label pattr -> [prepend label N] -> [js bake_labels.js]; no runtime rename hack
    n = d["varname"].split()[-1]
    pattr_id = next(b["id"] for b in boxes.values() if b.get("varname") == f"label{n}")
    js_id = next(b["id"] for b in boxes.values() if b.get("text") == "js bake_labels.js")
    fwd = [dst for dst, _ in outs(pattr_id, 0) if boxes[dst]["text"] == f"prepend label {n}"]
    assert len(fwd) == 1 and outs(fwd[0], 0) == [[js_id, 0]], f"label->js path {n}"
    assert not any(b.get("text", "").startswith("prepend _parameter") for b in boxes.values())
    label = next(b for b in boxes.values() if b.get("varname") == f"label_text_{n}")
    assert d["saved_attribute_attributes"]["valueof"]["parameter_shortname"] == label["text"]

print(f"OK: {len(boxes)} boxes, {len(p['lines'])} lines, {len(data)} bytes")
sys.exit(0)
