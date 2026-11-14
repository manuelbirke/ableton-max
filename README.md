# TEO-5 MIDI – Max for Live MIDI Effect

This device has 8 absolute encoders (0–127). Each one has a fixed label, parameter name and MIDI CC number.

| # | Label / short name | MIDI CC |
|---|--------------------|---------|
| 1 | Cutoff     | 33 |
| 2 | Resonance  | 34 |
| 3 | Filter     | 35 |
| 4 | Reverb     | 24 |
| 5 | Effects    | 33 |
| 6 | Volume     | 7  |
| 7 | Distortion | 67 |
| 8 | Vintage    | 37 |

Note: Cutoff and Effects both send CC 33, exactly as specified.

The parameter long name and short name both match the label. Push shows these names because they're part of the device file from the start.

## Files
- `dist/TEO-5 MIDI.amxd`: the device. Drop this into Live.
- `dist/TEO-5 MIDI.maxpat`: the same patcher as plain Max JSON.
- `generate_device.py`: rebuilds both files (`python3 generate_device.py`). To change labels or CCs, edit the `ENCODERS` list at the top.
- `verify_device.py`: runs static checks on the container, the patch cords, the names and the CC signal path.

## Install
1. Copy `TEO-5 MIDI.amxd` to
   `<User Library>/Presets/MIDI Effects/Max MIDI Effect/`
   (by default this is `~/Music/Ableton/User Library/...` on macOS or `Documents\Ableton\User Library\...` on Windows).
2. In Live, find it in the Browser under *Max for Live → Max MIDI Effect*. Drag it onto a MIDI track. You can also drag the .amxd file straight onto a track.
3. Set the track's **MIDI To** to your TEO-5 or other destination, along with the channel you want.

## Usage
- Turning a dial sends `CC <n> <value>`, where the value runs from 0 to 127.
- **MIDI channel:** there is no channel control. The device sends status `0xB0` through `midiout`. Live passes the output through the track, so the track's MIDI routing decides where it goes. Incoming MIDI passes through unchanged.
- The dials can be automated and are saved with the Live Set.

## Not verified (no Ableton Live or Max here)
- The device has **not been opened in Live or Max**. What was checked: the container header, valid JSON, every patch cord pointing at an existing inlet or outlet, the 8 names and CC numbers, and the layout fitting the 169 px device height.
- When a Set loads, Live restores each dial and may send its stored CC value once.
- Recommended: open the device in the Max editor, check it, then **Save** it (or **Freeze** it before sharing) so Max writes the file in its own native format.
