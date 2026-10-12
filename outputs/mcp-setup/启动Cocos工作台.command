#!/bin/zsh
# Resolve the project root from this script's location so it works on any machine.
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
exec /Applications/Cocos/Creator/3.8.8/CocosCreator.app/Contents/MacOS/CocosCreator --project "$ROOT/outputs/cocos-mcp-workbench"
