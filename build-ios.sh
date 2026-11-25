#!/bin/bash
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "ERROR: Build requires macOS with Xcode Command Line Tools and the iPhoneOS SDK." >&2
  exit 1
fi
SDK="$(xcrun --sdk iphoneos --show-sdk-path)"
OUT="$(cd "$(dirname "$0")" && pwd)/build"
mkdir -p "$OUT"
xcrun --sdk iphoneos clang \
  -arch arm64 -isysroot "$SDK" -miphoneos-version-min=15.0 \
  -dynamiclib -fPIC -fvisibility=hidden \
  "$(dirname "$0")/vrasgfx_ios_probe.c" \
  -Wl,-install_name,@rpath/libvrasgfx_ios_probe.dylib \
  -o "$OUT/libvrasgfx_ios_probe.dylib"
echo "Built: $OUT/libvrasgfx_ios_probe.dylib"
echo "Next: embed in the app bundle, ensure it is signed with the app, then verify the load path."
