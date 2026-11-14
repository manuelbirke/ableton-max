# ableton-max

A collection of Ableton **Max for Live** devices.

Each device is built from a small Python script. The script writes the `.amxd` file (and a plain `.maxpat` copy), so the patch is plain, reviewable code, and you can rebuild it without opening Max. The built devices are committed too, so you can download and use them right away.

## Devices

| Device | Type | Description |
|--------|------|-------------|
| [TEO-5 MIDI](devices/teo5-midi/) | MIDI Effect | 8 absolute encoders (2 × 4) sending fixed MIDI CCs to the TEO-5. Nothing is sent on load; values go out only when they change. |

## Repository layout

```
ableton-max/
├── build.py              # build + verify all devices (or selected ones)
├── lib/
│   └── amxd.py           # shared .amxd container writer/reader
└── devices/
    └── <device-name>/
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
python3 build.py teo5-midi    # build and verify one device
python3 build.py --list       # list available devices
```

Each built device ends up in `devices/<device-name>/dist/`. `build.py` exits with a non-zero status if any build or verification fails.

## Install a device in Live

1. Copy the `.amxd` file from `devices/<device-name>/dist/` into your User Library, e.g. `<User Library>/Presets/MIDI Effects/Max MIDI Effect/` for MIDI effects. You can also drag the file straight onto a track.
2. See the device's own README for routing and usage.

## Adding a new device

1. Create `devices/<device-name>/` (lowercase, dashes).
2. Add a `generate_device.py` that builds the patcher dict and calls `lib.amxd.write_device(patcher, out_dir, name, device_type)`. `device_type` is `"midi"`, `"audio"` or `"instrument"`. Add the repo root to `sys.path` the same way `devices/teo5-midi/generate_device.py` does.
3. Optional: add a `verify_device.py` that reads the result with `lib.amxd.read_amxd(path)` and asserts whatever matters for that device.
4. Add a `README.md` for the device and a row to the table above.
5. Run `python3 build.py <device-name>` and commit the source and `dist/` together.

## Note on verification

The build scripts check device files statically: the container format, the patch cords and the device-specific logic. They don't run Max or Live. Open a new device in Live (or the Max editor) at least once before relying on it.
