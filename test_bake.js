// Node harness: runs bake_labels.js against dist/CC Encoders 8.amxd using a
// minimal emulation of Max's js globals (File, post, outlet, arrayfromargs).
const fs = require("fs"), path = require("path"), vm = require("vm"), assert = require("assert");

const SRC = path.join(__dirname, "dist", "CC Encoders 8.amxd");
const OUT = path.join(__dirname, "dist", "_test_copy.amxd");

class File {
    constructor(p, access) {
        this.p = p; this.access = access || "read"; this.position = 0;
        this.buf = this.access === "read" ? fs.readFileSync(p) : Buffer.alloc(0);
        this.isopen = true;
    }
    get eof() { return this.buf.length; }
    set eof(n) { const b = Buffer.alloc(n); this.buf.copy(b, 0, 0, Math.min(n, this.buf.length)); this.buf = b; }
    readbytes(n) {
        assert(n <= 4096, "chunk too big");
        const a = Array.from(this.buf.subarray(this.position, this.position + n));
        this.position += a.length; return a;
    }
    writebytes(arr) {
        const add = Buffer.from(arr), end = this.position + add.length;
        if (end > this.buf.length) this.eof = end;
        add.copy(this.buf, this.position); this.position = end;
    }
    close() { if (this.access !== "read") fs.writeFileSync(this.p, this.buf); this.isopen = false; }
}

const outs = [];
const ctx = {
    File, post: s => process.stdout.write("[post] " + s), outlet: (i, m) => outs.push(m),
    arrayfromargs: a => Array.prototype.slice.call(a),
    escape, unescape, JSON, Math, String,
};
vm.createContext(ctx);
vm.runInContext(fs.readFileSync(path.join(__dirname, "bake_labels.js"), "utf8"), ctx);
ctx.patcher = { filepath: SRC };
const call = (fn, ...a) => ctx[fn].apply(ctx, a);

// messages as the patch sends them
call("label", 1, "Cutoff");
call("label", 2, "Reso", "Q");          // multi-word label arrives as several atoms
call("label", 3, "Drüve");               // non-ASCII
call("cc", 1, 74); call("cc", 2, 71.4); call("cc", 8, 200);
call("bake", OUT.replace(/\.amxd$/, ""));   // no extension -> gets .amxd

function parse(file) {
    const d = fs.readFileSync(file);
    assert.strictEqual(d.subarray(0, 4).toString(), "ampf");
    assert.strictEqual(d.subarray(8, 12).toString(), "mmmm");
    const at = d.indexOf("ptch"), len = d.readUInt32LE(at + 4);
    assert.strictEqual(at + 8 + len, d.length, "ptch length must match");
    return JSON.parse(d.subarray(at + 8).toString("utf8").replace(/[\0\s]+$/, "")).patcher;
}
const p = parse(OUT), orig = parse(SRC);
const by = vn => p.boxes.map(b => b.box).find(b => b.varname === vn);
const expect = ["Cutoff", "Reso Q", "Drüve", "Enc 4", "Enc 5", "Enc 6", "Enc 7", "Enc 8"];
expect.forEach((name, i) => {
    const n = i + 1;
    assert.strictEqual(by(`Encoder ${n}`).saved_attribute_attributes.valueof.parameter_shortname, name);
    assert.strictEqual(by(`Encoder ${n}`).saved_attribute_attributes.valueof.parameter_longname, `Encoder ${n}`);
    assert.strictEqual(by(`label_text_${n}`).text, name);
    assert.deepStrictEqual(by(`label${n}`).restore, [name]);
});
const cc = n => by(`CC# ${n}`).saved_attribute_attributes.valueof.parameter_initial[0];
assert.deepStrictEqual([cc(1), cc(2), cc(3), cc(8)], [74, 71, 22, 127]);
assert.strictEqual(p.boxes.length, orig.boxes.length);
assert.strictEqual(p.lines.length, orig.lines.length);
assert(/^Saved _test_copy\.amxd/.test(outs.at(-1)), outs.at(-1));

// error paths
call("bake", SRC); assert(/^Error: choose a new file name/.test(outs.at(-1)), outs.at(-1));
ctx.patcher = { filepath: "" }; call("bake", OUT); assert(/^Error: cannot locate/.test(outs.at(-1)));

// "parameters" table written by the Max editor is kept in sync
const withTable = JSON.parse(JSON.stringify(orig));
withTable.parameters = { "obj-x": ["Encoder 1", "Enc 1", 0], "obj-y": ["CC# 1", "CC1", 0] };
const body = Buffer.concat([Buffer.from(JSON.stringify({ patcher: withTable })), Buffer.from("\n\0")]);
const hdr = Buffer.from("ampf\x04\0\0\0mmmmmeta\x04\0\0\0\0\0\0\0ptch", "latin1");
const lenb = Buffer.alloc(4); lenb.writeUInt32LE(body.length);
const SRC2 = path.join(__dirname, "dist", "_test_src2.amxd");
fs.writeFileSync(SRC2, Buffer.concat([hdr, lenb, body]));
ctx.patcher = { filepath: SRC2 }; call("bake", OUT);
assert.deepStrictEqual(parse(OUT).parameters["obj-x"], ["Encoder 1", "Cutoff", 0]);
assert.deepStrictEqual(parse(OUT).parameters["obj-y"], ["CC# 1", "CC1", 0]);

// frozen device is refused
const frozen = Buffer.concat([hdr, Buffer.from([8, 0, 0, 0]), Buffer.from("mx@c\0\0\0\0")]);
fs.writeFileSync(SRC2, frozen); call("bake", OUT);
assert(/frozen/.test(outs.at(-1)), outs.at(-1));

[OUT, SRC2].forEach(f => fs.existsSync(f) && fs.unlinkSync(f));
console.log("ALL BAKE TESTS PASSED");
