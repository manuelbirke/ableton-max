// bake_labels.js - writes a copy of this device in which every encoder's
// parameter short name (what Push and Live display) is the current label.
//
// Live reads parameter names only when a device is loaded, so names cannot be
// changed on a running device. This script writes a new .amxd with the names
// (and the current CC numbers) built in; load that copy and Push shows them.
//
// Messages:  label <n> <text...>   cc <n> <number>   bake <path>
// Outlet 0:  status text (for [prepend set] -> [comment])

autowatch = 1;
inlets = 1;
outlets = 1;

var NUM = 8;
var labels = [];
var ccs = [];

function label(n) {
    var a = arrayfromargs(arguments);
    var text = a.slice(1).join(" ").replace(/^\s+|\s+$/g, "");
    if (n >= 1 && n <= NUM) labels[n - 1] = text;
}

function cc(n, v) {
    if (n >= 1 && n <= NUM) ccs[n - 1] = Math.max(0, Math.min(127, Math.round(v)));
}

function status(msg) {
    post("CC Encoders: " + msg + "\n");
    outlet(0, msg);
}

// ------------------------------------------------------------ byte helpers
function readAll(path) {
    var f = new File(path, "read");
    if (!f.isopen) throw "cannot open " + path;
    var out = [], chunk, i;
    f.position = 0;
    while (f.position < f.eof) {
        chunk = f.readbytes(Math.min(4096, f.eof - f.position));
        if (!chunk || !chunk.length) break;
        for (i = 0; i < chunk.length; i++) out.push(chunk[i] & 255);
    }
    f.close();
    return out;
}

function writeAll(path, bytes) {
    var f = new File(path, "write");
    if (!f.isopen) throw "cannot write " + path;
    f.position = 0;
    f.eof = 0;
    for (var i = 0; i < bytes.length; i += 4096) f.writebytes(bytes.slice(i, i + 4096));
    f.eof = bytes.length;
    f.close();
}

function tag(b, at) { return String.fromCharCode(b[at], b[at + 1], b[at + 2], b[at + 3]); }
function u32(b, at) { return (b[at] | (b[at + 1] << 8) | (b[at + 2] << 16) | (b[at + 3] << 24)) >>> 0; }
function u32bytes(v) { return [v & 255, (v >>> 8) & 255, (v >>> 16) & 255, (v >>> 24) & 255]; }

function bytesToString(b) {           // UTF-8 bytes -> JS string
    var s = "";
    for (var i = 0; i < b.length; i += 4096)
        s += String.fromCharCode.apply(null, b.slice(i, i + 4096));
    return decodeURIComponent(escape(s));
}

function stringToBytes(str) {         // JS string -> UTF-8 bytes
    var s = unescape(encodeURIComponent(str)), out = [];
    for (var i = 0; i < s.length; i++) out.push(s.charCodeAt(i));
    return out;
}

// ------------------------------------------------------------ patch edit
function nameFor(n) { return labels[n - 1] || ("Enc " + n); }

function applyNames(p) {
    var boxes = p.boxes, i, b, m, vn, dials = 0;
    for (i = 0; i < boxes.length; i++) {          // labels not received yet -> saved text
        b = boxes[i].box;
        if (b.maxclass === "textedit" && (m = /^label_text_(\d+)$/.exec(b.varname || "")))
            if (labels[+m[1] - 1] === undefined) labels[+m[1] - 1] = b.text;
    }
    for (i = 0; i < boxes.length; i++) {
        b = boxes[i].box;
        vn = b.varname || "";
        if (b.maxclass === "live.dial" && (m = /^Encoder (\d+)$/.exec(vn))) {
            b.saved_attribute_attributes.valueof.parameter_shortname = nameFor(+m[1]);
            dials++;
        } else if (b.maxclass === "textedit" && (m = /^label_text_(\d+)$/.exec(vn))) {
            b.text = nameFor(+m[1]);
        } else if (b.maxclass === "newobj" && (m = /^label(\d+)$/.exec(vn))) {
            b.restore = [nameFor(+m[1])];
        } else if (b.maxclass === "live.numbox" && (m = /^CC# (\d+)$/.exec(vn))) {
            if (ccs[+m[1] - 1] !== undefined)
                b.saved_attribute_attributes.valueof.parameter_initial = [ccs[+m[1] - 1]];
        }
    }
    // Patches saved by the Max editor also keep a "parameters" table:
    // { "obj-12": ["Encoder 1", "Enc 1", 0], ... } - keep it in sync.
    if (p.parameters) {
        for (var k in p.parameters) {
            var e = p.parameters[k];
            if (Object.prototype.toString.call(e) === "[object Array]" && typeof e[0] === "string" && (m = /^Encoder (\d+)$/.exec(e[0])))
                e[1] = nameFor(+m[1]);
        }
    }
    return dials;
}

function rebuild(src) {
    if (tag(src, 0) !== "ampf") throw "not an .amxd file";
    var pos = 0, head = [], payload = null, tail = [];
    while (pos + 8 <= src.length) {
        var t = tag(src, pos), len = u32(src, pos + 4);
        if (t === "ptch") {
            payload = src.slice(pos + 8, pos + 8 + len);
            tail = src.slice(pos + 8 + len);
            break;
        }
        head = head.concat(src.slice(pos, pos + 8 + len));
        pos += 8 + len;
    }
    if (!payload) throw "no patcher chunk found";
    if (tag(payload, 0) === "mx@c")
        throw "this device is frozen - use the unfrozen device to save a named copy";

    var doc = JSON.parse(bytesToString(payload).replace(/[\u0000\s]+$/, ""));
    if (applyNames(doc.patcher) !== NUM) throw "encoder dials not found in device";
    var body = stringToBytes(JSON.stringify(doc, null, "\t")).concat([10, 0]);
    return head.concat([112, 116, 99, 104], u32bytes(body.length), body, tail);   // "ptch"
}

function bake() {
    try {
        var path = arrayfromargs(arguments).join(" ");
        if (!path) throw "no file chosen";
        if (!/\.amxd$/i.test(path)) path += ".amxd";
        var self = this.patcher.filepath;
        if (!self) throw "cannot locate this device's file";
        if (self === path) throw "choose a new file name (the running device cannot be overwritten)";
        writeAll(path, rebuild(readAll(self)));
        status("Saved " + path.replace(/^.*[\/:]/, "") + " - load it to see the names on Push");
    } catch (e) {
        status("Error: " + e);
    }
}
