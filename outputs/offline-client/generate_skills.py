"""Extract the small presentation subset; raw references remain in the character library."""
import json, re
from pathlib import Path
from organize_characters import extract, CONFIG
PROJ=Path(__file__).resolve().parent

def lua(v):
    if isinstance(v,bool):return 'true' if v else 'false'
    if isinstance(v,(int,float)):return str(v)
    if isinstance(v,str):return json.dumps(v,ensure_ascii=False)
    if isinstance(v,list):return '{'+','.join(lua(x) for x in v)+'}'
    return '{'+','.join('['+lua(k)+']='+lua(x) for k,x in v.items())+'}'

def generate():
    skills,effects=extract();result={}
    visual_text=(CONFIG/'skill_data.lua').read_text()
    visuals={}
    for id in [20223,20224,15611]:
        match=re.search(r'\['+str(id)+r'\] = \{(.*?)\n\t\}',visual_text,re.S)
        assert match,id
        fields={}
        for key,raw in re.findall(r'(\w+) = ("[^"\n]*"|-?[\d.]+)',match[1]):
            fields[key]=json.loads(raw)
        visuals[id]={'id':id,'model':fields['res_up'],'file':'action','animation':fields['up_action_name'] or 'action',
            'x':fields['x_fix'],'y':fields['y_fix'],'scale':fields['scale']/1000,
            'source_line':visual_text[:match.start()].count('\n')+1}

    for id in [520001,520101,520301]:
        skill=skills[id];steps=[]
        for eid in skill['effect_list']:
            e=effects[eid]
            if not e['anime_res']:continue
            steps.append({'effect_id':eid,'resource':e['anime_res'],'animation':e['anime_user_atk'],
                'hit':e['hit_action']=='hurt','ready_sound':e['ready_sound'],'attack_sound':e['attack_sound'],
                'hit_sound':e['hit_sound'],'caster_effects':[visuals[x] for x in e['bact_effect_list']],
                'hit_effects':[visuals[x] for x in e['hit_effect_list']]})
        result[id]={'name':skill['name'],'steps':steps}
    (PROJ/'src/offline/luffy_skills.lua').write_text('-- Generated from skill_data1.lua; presentation subset only.\nreturn '+lua(result)+'\n')
    (PROJ/'skill-presentation.json').write_text(json.dumps(result,ensure_ascii=False,indent=2))
    return result
if __name__=='__main__':generate()
