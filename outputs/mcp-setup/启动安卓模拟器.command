#!/bin/zsh
export ANDROID_SDK_ROOT=/Users/mountainwalkeralliance/Library/Android/sdk
exec "$ANDROID_SDK_ROOT/emulator/emulator" -avd OnePiece_Client_API30 -no-snapshot -no-boot-anim
