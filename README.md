# CC Encoders 8 – Max for Live MIDI Effect

This device has 8 absolute encoders. Each one has a label you can edit, its own CC number (0–127), and sends values from 0 to 127.

## Files
- `dist/CC Encoders 8.amxd`: the device. Drop this into Live.
- `dist/CC Encoders 8.maxpat`: the same patcher as plain Max JSON.
- `generate_device.py`: rebuilds both files (`python3 generate_device.py`).
- `verify_device.py`: runs static checks on the container, the patch cords, the parameters and the CC signal path.

## Install
1. Copy `CC Encoders 8.amxd` to
   `<User Library>/Presets/MIDI Effects/Max MIDI Effect/`
   (by default this is `~/Music/Ableton/User Library/...` on macOS or `Documents\Ableton\User Library\...` on Windows).
2. In Live, find it in the Browser under *Max for Live → Max MIDI Effect*. Drag it onto a MIDI track. You can also drag the .amxd file straight onto a track.
3. Set the track's **MIDI To** to your hardware or plugin, along with the channel you want.

## Usage
- **Label:** click the text field at the top of a column, type a name, then press **Enter**.
- **Dial:** turning it sends `CC <n> <value>`, where the value runs from 0 to 127.
- **CC#:** sets the CC number for that column. Defaults are 20–27.
- **MIDI channel:** there is no channel control. The device builds raw bytes with status `0xB0` and sends them through `midiout`. Live passes the output through the track, so the track's MIDI routing decides where it goes. Incoming MIDI passes through unchanged.
- **Saving:** the dials ("Encoder 1–8") can be automated and are saved with the Live Set. The CC numbers ("CC# 1–8") are saved but are not automatable. The labels are stored in hidden blob parameters (`pattr` in parameter mode, "Label 1–8"), so they are saved with the Set too.

## Encoder names on Push

Push shows each dial's **short name**. There are two ways to set it:

1. **Live rename (built in, best effort):** when you edit a label, the device sends `_parameter_shortname <label>` to that dial (and sends it again when the Set loads). This always updates the name inside Max. Whether Live and Push pick it up while the device is running is **not guaranteed**: Live reads parameter names when the device loads, and Cycling '74 doesn't support `_parameter_shortname`. If Push doesn't update, try selecting another track and coming back, or reloading the Set.
2. **Baked-in names (reliable):** generate a copy of the device with your labels set as the short names when it's built:
   ```
   python3 generate_device.py --labels "Cutoff,Reso,Drive,Attack,Decay,Sustain,Release,Mix"
   ```
   This writes `dist/CC Encoders 8 - <labels>.amxd`. Use `--name "My Synth CCs"` to choose the file name. Leave a slot empty to keep `Enc N`. Push shows these names because they're present when the device loads.

   You can also do this without the script: open the device in the Max editor, set each dial's *Short Name* in the Inspector, and save.

The parameter long names stay `Encoder 1–8`, so existing automation and MIDI mappings keep working.

Another option: put the device in a MIDI Effect Rack, map the dials to Macros, and rename the Macros. Push shows Macro names.

## Not verified (no Ableton Live or Max here)
- The device has **not been opened in Live or Max**. What was checked: the container header (`ampf`/`mmmm`/`meta`/`ptch`), valid JSON, every patch cord pointing at an existing inlet or outlet, 24 unique parameter names, and the layout fitting the 169 px device height.
- Two behaviours are unconfirmed and should be tested first: label persistence through the blob `pattr`, and whether Live rewrites the `0xB0` channel to the track's output channel. If Live sends on channel 1 regardless of routing, set the channel on the receiving instrument or device.
- When a Set loads, Live restores each dial and may send its stored CC value once.
- Recommended: open the device in the Max editor (the edit button on the device), check it, then **Save** it. You can also **Freeze** it before sharing. Max will then write the file in its own native format.
