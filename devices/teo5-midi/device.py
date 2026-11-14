"""TEO-5 MIDI device definition: name + 8 encoders (label = short name, MIDI CC)."""
NAME = "TEO-5 MIDI"

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
