#!/bin/zsh
# Resolve the project root from this script's real location (symlink-safe) so it works on any machine.
ROOT="$(cd "${0:A:h}/../.." && pwd -P)"
exec /Applications/Cocos/Creator/3.8.8/CocosCreator.app/Contents/MacOS/CocosCreator --project "$ROOT/outputs/cocos-mcp-workbench"
