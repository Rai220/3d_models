"""Build editable P1S projects, then reload and slice those exact files."""
from pathlib import Path
import json, subprocess, zipfile, xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parents[1]
PROFILES=Path('/Applications/BambuStudio.app/Contents/Resources/profiles/BBL')
APP='/Applications/BambuStudio.app/Contents/MacOS/BambuStudio'

def resolved(category,name,trail=()):
    assert name not in trail
    files=list((PROFILES/category).rglob(name+'.json'))
    assert len(files)==1,(name,files)
    src=json.loads(files[0].read_text())
    out=resolved(category,src['inherits'],trail+(name,)) if src.get('inherits') else {}
    for inc in src.get('include',[]): out.update(resolved(category,inc,trail+(name,)))
    out.update(src); out.pop('include',None); out['inherits']=''
    return out

def run(args,cwd,log):
    with log.open('w') as f:
        result=subprocess.run([APP,*args],cwd=cwd,stdout=f,stderr=subprocess.STDOUT)
    assert result.returncode==0, (result.returncode,str(log))

