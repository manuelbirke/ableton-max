# OB-X8 – Max for Live MIDI Effect

This device has 8 absolute encoders (0–127). Each one has a fixed label, parameter name and MIDI CC number.

| # | Label / short name | MIDI CC |
|---|--------------------|---------|
| 1 | Cutoff     | 33 |
| 2 | Resonance  | 34 |
| 3 | OSC1       | 25 |
| 4 | OSC2       | 26 |
| 5 | Noise      | 29 |
| 6 | Volume     | 7  |
| 7 | Modulation | 31 |
| 8 | Vintage    | 3  |

Layout: 2 rows of 4 encoders (row 1: Cutoff, Resonance, OSC1, OSC2; row 2: Noise, Volume, Modulation, Vintage).

The parameter long name and short name both match the label. Push shows these names because they're part of the device file from the start.

## Files
- `dist/OB-X8.amxd`: the device. Drop this into Live.
- `dist/OB-X8.maxpat`: the same patcher as plain Max JSON.
- `device.py`: the device name and the 8 `(label, CC)` pairs. To change labels or CCs, edit this file and rebuild.
- `generate_device.py`: builds both files using the shared builder in `lib/cc_encoders.py`.
- `verify_device.py`: runs static checks on the container, the patch cords, the names and the CC signal path.

## Build
You need Python 3.8 or newer. Only the standard library is used, and neither Max nor Live has to be installed. From the repository root:

```sh
python3 build.py ob-x8
```

This writes `dist/OB-X8.amxd` and `.maxpat`, then runs `verify_device.py`. You can also run the two scripts directly from this folder:

```sh
python3 generate_device.py && python3 verify_device.py
```

## Install
1. Copy `OB-X8.amxd` to
   `<User Library>/Presets/MIDI Effects/Max MIDI Effect/`
   (by default this is `~/Music/Ableton/User Library/...` on macOS or `Documents\Ableton\User Library\...` on Windows).
2. In Live, find it in the Browser under *Max for Live → Max MIDI Effect*. Drag it onto a MIDI track. You can also drag the .amxd file straight onto a track.
3. Set the track's **MIDI To** to your OB-X8 or other destination, along with the channel you want.

## Usage
- Turning a dial sends `CC <n> <value>`, where the value runs from 0 to 127. Each encoder shows only its name and its current value; there are no CC labels on the device.
- **No output on load:** every encoder goes through `[change] -> [gate]`. The gates stay closed until 250 ms after `[live.thisdevice]` reports the device has loaded. Values Live restores when the device or Set loads are therefore not sent. After that, a message goes out only when an encoder's value actually changes; repeated identical values are dropped.
- **MIDI channel:** there is no channel control. The device sends status `0xB0` through `midiout`. Live passes the output through the track, so the track's MIDI routing decides where it goes. Incoming MIDI passes through unchanged.
- The dials can be automated and are saved with the Live Set.

## Not verified (no Ableton Live or Max here)
- The device has **not been opened in Live or Max**. What was checked: the container header, valid JSON, every patch cord pointing at an existing inlet or outlet, the 8 names and CC numbers, the load gate and change filter in every encoder's path, and the layout fitting the 169 px device height.
- The load gate (no MIDI sent on load) was checked only by the patch structure, not in Live. If Live ever restores values later than 250 ms after load on a slow machine, increase `LOAD_DELAY_MS` in `lib/cc_encoders.py` (this affects all encoder devices).
- Recommended: open the device in the Max editor, check it, then **Save** it (or **Freeze** it before sharing) so Max writes the file in its own native format.
