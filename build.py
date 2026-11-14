#!/usr/bin/env python3
"""Build and verify Max for Live devices in this repository.

Every folder in devices/ that contains a generate_device.py is a device.
If it also has a verify_device.py, that runs right after the build.

When all devices are built and every build succeeds, the .amxd files are
collected into the top-level dist/ folder (old .amxd files there are removed
first, so renamed or deleted devices don't linger). Building selected devices
leaves dist/ untouched.

Usage:
    python3 build.py              # build + verify all devices
    python3 build.py teo5-midi    # build + verify selected devices
    python3 build.py --list       # list available devices
"""
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DEVICES_DIR = ROOT / "devices"
COMMON_DIST = ROOT / "dist"


def find_devices():
    return sorted(d for d in DEVICES_DIR.iterdir()
                  if d.is_dir() and (d / "generate_device.py").is_file())


def run(script: Path) -> bool:
    print(f"$ python3 {script.relative_to(DEVICES_DIR.parent)}")
    return subprocess.run([sys.executable, str(script)], cwd=script.parent).returncode == 0


def collect(devices):
    """Copy every device's dist/*.amxd into the common dist/ folder."""
    COMMON_DIST.mkdir(exist_ok=True)
    for old in COMMON_DIST.glob("*.amxd"):
        old.unlink()
    copied = []
    for d in devices:
        for amxd in sorted((d / "dist").glob("*.amxd")):
            target = COMMON_DIST / amxd.name
            if target.exists():
                raise SystemExit(f"duplicate device file name: {amxd.name}")
            shutil.copy2(amxd, target)
            copied.append(amxd.name)
    print(f"\ncollected {len(copied)} device(s) in {COMMON_DIST.relative_to(ROOT)}/: "
          f"{', '.join(copied)}")


def main(argv):
    devices = find_devices()
    if "--list" in argv:
        for d in devices:
            print(d.name)
        return 0

    if argv:
        by_name = {d.name: d for d in devices}
        unknown = [a for a in argv if a not in by_name]
        if unknown:
            print(f"unknown device(s): {', '.join(unknown)}; available: "
                  f"{', '.join(by_name) or '(none)'}", file=sys.stderr)
            return 2
        devices = [by_name[a] for a in argv]

    failed = []
    for d in devices:
        print(f"== {d.name}")
        ok = run(d / "generate_device.py")
        if ok and (d / "verify_device.py").is_file():
            ok = run(d / "verify_device.py")
        if not ok:
            failed.append(d.name)

    print(f"\n{len(devices) - len(failed)}/{len(devices)} device(s) built OK")
    if failed:
        print(f"FAILED: {', '.join(failed)}", file=sys.stderr)
        if not argv:
            print("dist/ not updated because of failed builds", file=sys.stderr)
        return 1
    if not argv:
        collect(devices)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
