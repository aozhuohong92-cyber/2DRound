"""Bundle owned Lua modules into the proven main entry, avoiding custom require path ambiguity."""
from pathlib import Path
import json

def bundle(project, resources):
    from generate_skills import generate
    generate()
    parts = ['-- Generated; edit src/*.lua instead.\n']
    names = []
    for path in sorted((project / 'src/offline').glob('*.lua')):
        name = 'offline.' + path.stem
        names.append(name)
        parts.append('package.preload[' + json.dumps(name) + '] = function(...)\n' + path.read_text() + '\nend\n')
    paths = '{' + ','.join(json.dumps(name, ensure_ascii=False) for name in sorted(resources)) + '}'
    parts.append('package.preload["offline.asset_paths"] = function() return ' + paths + ' end\n')
    parts.append((project / 'src/main.lua').read_text())
    return ''.join(parts).encode('utf-8'), names
