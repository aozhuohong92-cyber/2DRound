#!/bin/sh
# Close this AVD before running. Keep user data; bypass incompatible GPU/snapshots.
set -eu
sdk_root="${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}"
exec "$sdk_root/emulator/emulator" -avd "${1:-OnePiece_Client_API30}" \
  -gpu swiftshader -no-snapshot -netdelay none -netspeed full
