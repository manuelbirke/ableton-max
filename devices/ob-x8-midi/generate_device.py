#!/usr/bin/env python3
"""Build dist/OB-X8 MIDI.amxd + .maxpat. Edit device.py to change labels/CCs."""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE.parents[1]), str(HERE)]  # repo root, this device
from device import ENCODERS, NAME  # noqa: E402
from lib.cc_encoders import generate  # noqa: E402

if __name__ == "__main__":
    generate(NAME, ENCODERS, HERE)
