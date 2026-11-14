# ableton-max

A collection of Ableton **Max for Live** devices.

Each device is built from a small Python script. The script writes the `.amxd` file (and a plain `.maxpat` copy), so the patch is plain, reviewable code, and you can rebuild it without opening Max. The built devices are committed too, so you can download and use them right away.

## Devices

| Device | Type | Description |
|--------|------|-------------|
| [OB-X8 MIDI](devices/ob-x8-midi/) | MIDI Effect | 8 absolute encoders (2 × 4) sending fixed MIDI CCs to the OB-X8. Nothing is sent on load; values go out only when they change. |
| [TEO-5 MIDI](devices/teo5-midi/) | MIDI Effect | 8 absolute encoders (2 × 4) sending fixed MIDI CCs to the TEO-5. Nothing is sent on load; values go out only when they change. |

## Repository layout

```
ableton-max/
├── build.py              # build + verify all devices (or selected ones)
├── dist/                 # all built .amxd devices in one place (committed)
├── lib/
│   ├── amxd.py           # shared .amxd container writer/reader
│   └── cc_encoders.py    # shared builder + verifier for 8-encoder CC devices
└── devices/
    └── <device-name>/
        ├── device.py            # (encoder devices) name + 8 (label, CC) pairs
        ├── generate_device.py   # builds dist/<Name>.amxd + .maxpat
        ├── verify_device.py     # static checks (optional, recommended)
        ├── README.md            # what the device does, how to use it
        └── dist/                # built device files (committed)
```

## Build

You need **Python 3.8+**. Only the standard library is used, so there is nothing to install, and Max and Live aren't needed to build.

```sh
git clone https://github.com/manuelbirke/ableton-max.git
cd ableton-max

python3 build.py              # build and verify every device
python3 build.py ob-x8-midi   # build and verify one device
python3 build.py --list       # list available devices
```

Each built device ends up in `devices/<device-name>/dist/`. When you build all devices and every build succeeds, `build.py` also copies all `.amxd` files into the top-level [`dist/`](dist/) folder. Old `.amxd` files there are removed first, so renamed or deleted devices don't linger. Building selected devices, or a run with a failed build, leaves `dist/` unchanged. `build.py` exits with a non-zero status if any build or verification fails.

## Install a device in Live

1. Copy the `.amxd` file from the top-level [`dist/`](dist/) folder (or `devices/<device-name>/dist/`) into your User Library, e.g. `<User Library>/Presets/MIDI Effects/Max MIDI Effect/` for MIDI effects. You can also drag the file straight onto a track.
2. See the device's own README for routing and usage.

## Adding a new device

**Another 8-encoder CC device** (same layout and behavior as TEO-5 MIDI / OB-X8 MIDI):

1. Copy an existing device folder, e.g. `cp -r devices/ob-x8-midi devices/<device-name>` (lowercase, dashes), and delete the copied `dist/`.
2. In `device.py`, set `NAME` and the 8 `(label, CC)` pairs in `ENCODERS`.
3. In `generate_device.py`, `verify_device.py` and `README.md`, replace the old device name.
4. Add a row to the table above.
5. Run `python3 build.py` (all devices, so the top-level `dist/` is updated too) and commit the source and both `dist/` folders together.

**A different kind of device:**

1. Create `devices/<device-name>/` with a `generate_device.py` that builds the patcher dict and calls `lib.amxd.write_device(patcher, out_dir, name, device_type)`. `device_type` is `"midi"`, `"audio"` or `"instrument"`. Add the repo root to `sys.path` as the existing devices do.
2. Optional: add a `verify_device.py` that reads the result with `lib.amxd.read_amxd(path)` and asserts whatever matters for that device.
3. Add a `README.md`, a row in the table above, then build and commit as above.

Changes to `lib/cc_encoders.py` affect every encoder device. Rebuild all of them with `python3 build.py` and commit the updated `dist/` folders.

## License

[Apache License 2.0](LICENSE)

## Note on verification

The build scripts check device files statically: the container format, the patch cords and the device-specific logic. They don't run Max or Live. Open a new device in Live (or the Max editor) at least once before relying on it.
