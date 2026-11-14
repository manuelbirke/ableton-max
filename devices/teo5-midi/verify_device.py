#!/usr/bin/env python3
"""Static checks for dist/TEO-5 MIDI.amxd (no Max/Live required)."""
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path[:0] = [str(HERE.parents[1]), str(HERE)]  # repo root, this device
from device import ENCODERS, NAME  # noqa: E402
from lib.cc_encoders import verify  # noqa: E402

if __name__ == "__main__":
    verify(NAME, ENCODERS, HERE)
