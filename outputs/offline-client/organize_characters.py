"""Build a human-readable character library from local, data-only config literals."""
from pathlib import Path
import ast, hashlib, json, os, re, shutil
from prepare_assets import ROOT, resolve, SPINE, dependencies
CONFIG = ROOT / 'outputs/lua-restored-paths/ePoCrKQkWA3vpiOwu2oNfOh02MOeNheW'
DEST = ROOT / 'assets/characters/路飞'
ACTION_NAMES = {'stand2':'01_待机_stand2', 'action1':'02_普攻_action1', 'action2':'03_Jet枪分段_action2',
                'hurt':'04_受击_hurt', 'run':'05_移动_run', 'action9':'06_二档_action9'}

def literal(text):
    # Convert positional Lua array braces to Python list syntax outside string literals.
    chars=[]; quote=None; escaped=False
    for c in text:
        if quote:
            chars.append(c)
            if escaped: escaped=False
            elif c=='\\': escaped=True
            elif c==quote: quote=None
        elif c in ('"', "'"): quote=c; chars.append(c)
        else: chars.append({'{':'[','}':']'}.get(c,c))
    return ast.literal_eval(''.join(chars))

def extract():
    source=CONFIG/'skill_data1.lua'; text=source.read_text()
    skills={}; effects={}
    skill_fields=['bid','name','owner','group','next_id','level','is_normal_skill','cd','type','fit_combat_type','best_target','target','count','effect_list','add_attr','hallows_atk','des','open_desc','skill_desc','icon','is_play_sound','skill_type','passive_skill_show','buff_des','power','target_multi','fire_cd','client_lev']
    effect_fields=['bid','group','target_type','effect_type','action_list','anime_res','anime_user_atk','bact_effect_list','act_effect_list','area_effect_list','hit_effect_list','hurt_effect_list','trc_effect_list','shake_id','ready_sound','attack_sound','hit_sound','is_play_hit_sound','effect_desc','hit_action','act_hurt_type','is_move_map','is_must_die','shout_trick','split_hurt','play_stand']
    for line_no,line in enumerate(text.splitlines(),1):
        m=re.match(r'\s*\[(520\d+)(?:\.0)?\] = (".*"),?$',line)
        if not m: continue
        data=literal(json.loads(m[2])); id=int(m[1])
        fields=skill_fields if len(m[1])==6 else effect_fields
        assert len(fields)==len(data),(id,len(data))
        entry=dict(zip(fields,data));entry['source']={'file':str(source.relative_to(ROOT)), 'line':line_no, 'raw':line.strip()}
        (skills if len(m[1])==6 else effects)[id]=entry
    return skills,effects

def save(path,obj):
    path.parent.mkdir(parents=True,exist_ok=True);path.write_text(json.dumps(obj,ensure_ascii=False,indent=2))

def main():
    skills,effects=extract();manifest=[]
    for action,folder in ACTION_NAMES.items():
        target=DEST/'动作'/folder;target.mkdir(parents=True,exist_ok=True)
        assets=[]
        for ext in ('skel','atlas','png'):
            logical=SPINE+action+'.'+ext;p=resolve(logical);dst=target/(action+'.'+ext)
            shutil.copy2(p,dst)
            digest=hashlib.sha256(p.read_bytes()).hexdigest()
            assert hashlib.sha256(dst.read_bytes()).hexdigest()==digest
            assets.append({'file':dst.name,'logical_path':logical,'original_file':str(p.relative_to(ROOT)),'sha256':digest})
        animations=['action1','action2','action3','action4','action5'] if action=='action2' else [action]
        row={'action_file':action,'folder':str(target.relative_to(ROOT)),'animation_names_from_config':animations,
             'device_verified_animation_names':[action] if action!='action9' else [],
             'verification_note':'Device preview verified only the named loop, not complete skill timing.','assets':assets}
        save(target/'动作说明.json',row);manifest.append(row)
        evidence=ROOT/'outputs/offline-client/device-acceptance'
        for i in range(2):
            shot=evidence/f'{action}-{i}.png'
            if shot.exists():shutil.copy2(shot,target/f'真机预览-{i}.png')
    group_names={52000:'普通攻击',52010:'Jet枪',52020:'橡胶果实',52030:'二档',52040:'jet鞭'}
    table=['| 技能 | ID（初级） | 动作文件 → 动画名 | 状态 |','|---|---|---|---|']
    for group,name in group_names.items():
        levels=[v for _,v in sorted(skills.items()) if v['group']==group]
        assert levels
        folder=DEST/'技能'/f'{group}_{name}';folder.mkdir(parents=True,exist_ok=True)
        used=set()
        for skill in levels:
            skill['effects']=[effects[id] for id in skill['effect_list']]
            for effect in skill['effects']:
                act=effect['anime_res'];anim=effect['anime_user_atk']
                if act:
                    assert act in ACTION_NAMES,act
                    effect['organized_action_path']='../../动作/'+ACTION_NAMES[act]
                    effect['device_verified']=act!='action9' and anim==act
                    used.add(act)
        save(folder/'技能配置与动作映射.json',{'levels':levels,'status':'config_extracted_skill_orchestration_pending',
            'warning':'Config descriptions are not evidence that combat rules, damage or effects have been implemented.'})
        for act in sorted(used):
            link=folder/('动作资源_'+act)
            if not link.exists() and not link.is_symlink():link.symlink_to('../../动作/'+ACTION_NAMES[act],target_is_directory=True)
        flow='；'.join(f"{e['anime_res']}.skel → {e['anime_user_atk']}" for e in levels[0]['effects'] if e['anime_res']) or '无独立攻击动画（被动属性/效果）'
        table.append(f"| {levels[0]['name']} | {levels[0]['bid']} | {flow} | 配置已匹配；完整技能待实现 |")
        (folder/'说明.md').write_text(f"# {levels[0]['name']}\n\n{levels[0]['des']}\n\n初级技能 ID：{levels[0]['bid']}。\n\n动作映射：{flow}。\n\n详细配置、各等级、效果 ID、音效引用、原文件和行号见本目录 JSON。属性、状态、伤害、音效与特效演出均尚未作为完整技能验收。\n")
    presentation=ROOT/'outputs/offline-client/skill-presentation.json'
    if presentation.exists():
        plans=json.loads(presentation.read_text());vfx={};sounds=set()
        for plan in plans.values():
            for step in plan['steps']:
                for spec in step.get('caster_effects',[])+step.get('hit_effects',[]):vfx[spec['id']]=spec
                sounds.update(step[k] for k in ('ready_sound','attack_sound','hit_sound') if step[k])
        for id,spec in vfx.items():
            folder=DEST/'特效'/f"{id}_{spec['model']}";folder.mkdir(parents=True,exist_ok=True)
            rows=[]
            pending=[f"v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/{spec['model']}/{spec['file']}.{ext}" for ext in ('skel','atlas')]
            seen=set()
            while pending:
                logical=pending.pop(0)
                if logical in seen:continue
                seen.add(logical)
                src=resolve(logical);dst=folder/Path(logical).name;shutil.copy2(src,dst)
                rows.append({'logical_path':logical,'source':str(src.relative_to(ROOT)),'sha256':hashlib.sha256(dst.read_bytes()).hexdigest()})
                pending.extend(dependencies(logical,src.read_bytes()))
            save(folder/'特效说明.json',{'config':spec,'assets':rows,'status':'local_integration_device_pending','source':'skill_data.lua'})
        sound_rows=[]
        for name in sorted(sounds):
            logical='sound/battle/'+name+'.mp3';src=resolve(logical)
            folder=DEST/'音效';folder.mkdir(parents=True,exist_ok=True);dst=folder/(name+'.mp3');shutil.copy2(src,dst)
            sound_rows.append({'file':dst.name,'logical_path':logical,'source':str(src.relative_to(ROOT)),'sha256':hashlib.sha256(dst.read_bytes()).hexdigest()})
        save(DEST/'音效/音效索引.json',sound_rows)
        save(DEST/'演出接入状态.json',{'plans':plans,'status':'local_tests_passed_device_pending','combat_rules_implemented':False,
            'notes':['Sequences use completion callbacks and attack events, with a logged completion fallback.', 'Hit effects use a fixed demo target; exact original positioning and timing still need comparison.']})
    partner=CONFIG/'partner_data.lua'
    matches=[{'line':i,'text':s} for i,s in enumerate(partner.read_text().splitlines(),1) if '["20510_5"]' in s]
    save(DEST/'角色档案.json',{'name':'路飞','partner_id':20510,'model_id':'H30104','variant':'基础路飞；其他形态另建目录',
        'mapping_source':str(partner.relative_to(ROOT)),'mapping_lines':matches,'actions':manifest})
    (DEST/'README.md').write_text('# 路飞 · 20510 · H30104\n\n动作目录包含实际 skel/atlas/png 文件和原始哈希映射，不必到 HASH 目录翻找。PNG 是动画图集，动作名与骨骼动画名见各目录 JSON。所有资源均从原包复制并核对 SHA-256；编辑副本不会修改原包。\n\n## 技能对应表\n\n'+'\n'.join(table)+'\n\nJet.枪的 action2.skel 含五段 action1～action5；当前“技能”预览只验证了内部 action2 循环，不能等同完整五连击。二档 action9 已收录但未真机验收。被动技能不强行对应一个攻击动画。\n\n真机截图放在各动作目录；连续录屏及完整日志在验收目录链接中。技能 JSON 保留原始配置行与行号，便于回溯。\n')
    link=DEST/'验收记录'
    if not link.exists():link.symlink_to('../../offline-client/device-acceptance',target_is_directory=True)
    base=DEST.parent
    (base/'README.md').write_text('# 角色资源目录\n\n- [路飞（20510 / H30104）](路飞/README.md)\n\n## 后续统一规则\n\n每个角色独立目录；不同形态/皮肤按名称和模型编号区分。目录固定包含角色档案、动作、技能、验收记录。动作内保存 skel/atlas/png、动画名、原路径和校验值；技能内保存技能 ID、等级、动作分段、效果与音效引用。明确标记“配置匹配”“文件存在”“单动作真机通过”“完整技能通过”，不得相互替代。未知依赖进入待确认清单，不凭技能名推测动作。\n\n生成路飞目录：`python3 outputs/offline-client/organize_characters.py`。本目录为原资源整理副本；后续手工修改请在开发工程内进行，以免重新生成时覆盖。\n')
    (DEST/'README.md').write_text((DEST/'README.md').read_text()+'\n## 演出开发更新\n\n普通攻击、Jet.枪五段、二档的事件播放器与3套特效、5个音效已接入本地工程，通过本地测试，尚未设备复测。查看演出接入状态.json、特效/、音效/。以上真机状态仍仅指旧版五个预览动作；不代表新演出或战斗规则已验收。\n')
    print('Organized',len(manifest),'action sets and',len(skills),'skill levels at',DEST)
if __name__=='__main__':main()
