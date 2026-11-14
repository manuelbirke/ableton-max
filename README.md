# CC Encoders 8 – Max for Live MIDI Effect

This device has 8 absolute encoders. Each one has a label you can edit, its own CC number (0–127), and sends values from 0 to 127.

## Files
- `dist/CC Encoders 8.amxd`: the device. Drop this into Live.
- `dist/bake_labels.js`: script used by the **Save copy with these names** button. Keep it in the same folder as the .amxd.
- `dist/CC Encoders 8.maxpat`: the same patcher as plain Max JSON.
- `test_bake.js`: Node test for the save-copy script (`node test_bake.js`).
- `generate_device.py`: rebuilds both files (`python3 generate_device.py`).
- `verify_device.py`: runs static checks on the container, the patch cords, the parameters and the CC signal path.

## Install
1. Copy `CC Encoders 8.amxd` **and** `bake_labels.js` to
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

Push shows each dial's **short name**. Live reads parameter names **only when a device loads**, so renaming a dial on a running device doesn't reach Push. Earlier versions tried this with `_parameter_shortname`; it didn't work, so it's been removed. Instead, the names are written into a new copy of the device:

1. **In the device (no tools needed):**
   1. Type your labels and set the CC numbers.
   2. Click **Save copy with these names** and choose a new file name. Save it in `User Library/Presets/MIDI Effects/Max MIDI Effect/` so it shows up in Live's browser.
   3. Load the new copy onto the track and delete the old one. Push now shows your labels, and the CC numbers are kept.
   4. The status text next to the button shows the result or an error. Errors are also printed to the Max console.

   Requirements: `bake_labels.js` must be in the same folder as the device, and the device must **not be frozen**.
2. **From the command line:** build a copy with the names set:
   ```
   python3 generate_device.py --labels "Cutoff,Reso,Drive,Attack,Decay,Sustain,Release,Mix"
   ```
   This writes `dist/CC Encoders 8 - <labels>.amxd`. Use `--name "My Synth CCs"` to choose the file name. Leave a slot empty to keep `Enc N`.

   You can also do this without the script: open the device in the Max editor, set each dial's *Short Name* in the Inspector, and save.

The parameter long names stay `Encoder 1–8` in every copy. Automation and MIDI mappings belong to the device instance, though, so redo them on the new copy. Set your names before you automate.

**Not verified in Live:** the button relies on Max's `savedialog` and the JS `File` object, plus `this.patcher.filepath` returning the device's .amxd path. The script logic was tested in Node against the real generated device; it hasn't run inside Max/Live.

Another option: put the device in a MIDI Effect Rack, map the dials to Macros, and rename the Macros. Push shows Macro names.

## Not verified (no Ableton Live or Max here)
- The device has **not been opened in Live or Max**. What was checked: the container header (`ampf`/`mmmm`/`meta`/`ptch`), valid JSON, every patch cord pointing at an existing inlet or outlet, 24 unique parameter names, and the layout fitting the 169 px device height.
- Two behaviours are unconfirmed and should be tested first: label persistence through the blob `pattr`, and whether Live rewrites the `0xB0` channel to the track's output channel. If Live sends on channel 1 regardless of routing, set the channel on the receiving instrument or device.
- When a Set loads, Live restores each dial and may send its stored CC value once.
- Recommended: open the device in the Max editor (the edit button on the device), check it, then **Save** it. You can also **Freeze** it before sharing. Max will then write the file in its own native format.
