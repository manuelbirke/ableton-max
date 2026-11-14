"""Shared helpers for writing and reading Max for Live .amxd containers.

Container layout (little-endian uint32 lengths):
  'ampf' len=4 <device type>     mmmm = MIDI effect, aaaa = audio effect,
                                 iiii = instrument
  'meta' len=4 00 00 00 00
  'ptch' len=N <patcher JSON + "\\n\\0">
"""
import json
import struct
from pathlib import Path

DEVICE_TYPES = {"midi": b"mmmm", "audio": b"aaaa", "instrument": b"iiii"}


def build_amxd(patcher_json: bytes, device_type: str = "midi") -> bytes:
    """Wrap patcher JSON in the .amxd container."""
    payload = patcher_json + b"\n\x00"
    return (b"ampf" + struct.pack("<I", 4) + DEVICE_TYPES[device_type]
            + b"meta" + struct.pack("<I", 4) + b"\x00\x00\x00\x00"
            + b"ptch" + struct.pack("<I", len(payload)) + payload)


def write_device(patcher: dict, out_dir: Path, name: str, device_type: str = "midi"):
    """Write <name>.maxpat and <name>.amxd into out_dir."""
    out_dir.mkdir(parents=True, exist_ok=True)
    patcher["patcher"]["amxdtype"] = int.from_bytes(DEVICE_TYPES[device_type], "big")
    text = json.dumps(patcher, indent="\t")
    (out_dir / f"{name}.maxpat").write_text(text, encoding="utf-8")
    (out_dir / f"{name}.amxd").write_bytes(build_amxd(text.encode("utf-8"), device_type))


def read_amxd(path: Path):
    """Parse an .amxd file. Returns (device_type_bytes, patcher_dict, raw_bytes).

    Raises AssertionError if the container is malformed.
    """
    data = Path(path).read_bytes()
    assert data[:4] == b"ampf" and struct.unpack("<I", data[4:8])[0] == 4, "bad ampf header"
    dtype = data[8:12]
    assert data[12:16] == b"meta", "missing meta chunk"
    mlen = struct.unpack("<I", data[16:20])[0]
    off = 20 + mlen
    assert data[off:off + 4] == b"ptch", "missing ptch chunk"
    plen = struct.unpack("<I", data[off + 4:off + 8])[0]
    payload = data[off + 8:]
    assert len(payload) == plen, "ptch length mismatch"
    patcher = json.loads(payload.rstrip(b"\x00").decode("utf-8"))["patcher"]
    return dtype, patcher, data
