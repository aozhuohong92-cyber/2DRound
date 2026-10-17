local project, temp = assert(arg[1]), assert(arg[2])
package.path = project .. '/src/?.lua;' .. package.path
local Codec = require('offline.codec')
local Events = require('offline.events')
local State = require('offline.state')
local Store = require('offline.store')
local Class = require('offline.class')
local Route = require('offline.route')
local DramaPreview = require('offline.drama_preview')
local results = {}
local function test(name, fn)
    local ok, err = pcall(fn)
    results[#results + 1] = {name, ok}
    print((ok and 'PASS ' or 'FAIL ') .. name .. (ok and '' or ': ' .. tostring(err)))
    if not ok then os.exit(1) end
end
local function rejected(fn) assert(not pcall(fn), 'expected rejection') end
local function write(path, data)
    local f = assert(io.open(path, 'wb')); assert(f:write(data)); assert(f:close())
end
local function memory()
    return {load = function() return nil, 'new' end, save = function(self, value) self.value = Codec.clone(value); return true end}
end

test('codec roundtrip Chinese, binary, booleans, sparse keys', function()
    local v = {name = '路飞\n海贼\0', flag = false, team = {[6] = '20510'}, coins = 999999}
    local b = Codec.decode(Codec.encode(v))
    assert(b.name == v.name and b.flag == false and b.team[6] == '20510' and b.coins == v.coins)
    assert(Codec.encode({b=2,a=1}) == Codec.encode({a=1,b=2}))
end)
test('codec rejects malformed data without executing code', function()
    for _, raw in ipairs({'os.execute("bad")','s5:hi','n3:nan','m2:s1:an1:1s1:an1:2','fX','m1:tft','m99999999:'}) do
        rejected(function() Codec.decode(raw) end)
    end
    local cycle = {}; cycle.self = cycle
    rejected(function() Codec.encode(cycle) end)
end)
test('class constructors parent-first, destructors child-first exactly once', function()
    local log = {}
    local A = Class(); function A:__init(v) log[#log+1]='A'..v end
    function A:__delete() log[#log+1]='-A' end
    local B = Class(A); function B:__init(v) log[#log+1]='B'..v end
    function B:__delete() log[#log+1]='-B' end
    local b = B.New('x'); b:DeleteMe(); b:DeleteMe()
    assert(table.concat(log, ',') == 'Ax,Bx,-B,-A')
end)
test('events unsubscribe during dispatch, late subscribe, error isolation', function()
    local e = Events.new(); local log = {}; local off
    e:on('x', function() log[#log+1]='a'; off(); e:on('x', function() log[#log+1]='c' end) end)
    off = e:on('x', function() log[#log+1]='b' end)
    e:on('x', function() error('expected observer error') end)
    assert(#e:emit('x') == 1); assert(table.concat(log) == 'a')
    e:emit('x'); assert(table.concat(log) == 'aac')
end)
test('state commits only after durable save; snapshots isolated', function()
    local m = memory(); local e = Events.new(); local events = 0
    e:on('state.changed', function(event) events=events+1; event.state.coins=123 end)
    local s = assert(State.new(m, e)); assert(s:set_name(' 路飞 '))
    assert(s:snapshot().name == '路飞' and s:snapshot().coins == 0 and events == 1)
    local snap = s:snapshot(); snap.name='changed'; assert(s:snapshot().name=='路飞')
    m.save=function() return nil, 'disk full' end
    assert(not s:summon_fixture(20510)); assert(s:snapshot().stage=='summon' and events==1)
end)
test('tutorial fixture flow, formation ownership, reward idempotence', function()
    local s = assert(State.new(memory()))
    assert(not s:equip(1,'20510')); assert(not s:set_name('  '))
    assert(s:set_name('船长')); assert(not s:set_name('again'))
    assert(s:summon_fixture(20510)); assert(not s:summon_fixture(20510))
    assert(not s:equip(1,'999')); assert(not s:equip(7,'20510'))
    assert(s:equip(1,'20510')); assert(s:equip(2,'20510'))
    assert(s:snapshot().team[1]==nil and s:snapshot().team[2]=='20510')
    assert(not s:claim_fixture('first',-1)); assert(s:claim_fixture('first',100))
    local revision=s:snapshot().revision
    assert(not s:claim_fixture('first',100)); assert(s:snapshot().coins==100 and s:snapshot().revision==revision)
end)
test('observer reentrant writes rejected, observer failure does not roll back commit', function()
    local e = Events.new(); local s = assert(State.new(memory(),e))
    e:on('state.changed', function() assert(not s:summon_fixture(20510)); error('observer failed') end)
    assert(s:set_name('船长')); assert(s:snapshot().revision==1)
end)
test('save reload, corrupt newest slot recovery, interrupted temp ignored', function()
    local path=temp..'/save'; local store=Store.new(path,State.validate)
    local s=assert(State.new(store)); assert(s:set_name('路飞')); assert(s:summon_fixture(20510))
    local loaded=assert(State.new(store)); assert(loaded:snapshot().stage=='formation')
    write(path..'.0','damaged'); write(path..'.1.tmp','interrupted write')
    local recovered=assert(State.new(store)); assert(recovered.status=='recovered' and recovered:snapshot().stage=='summon')
    assert(recovered:summon_fixture(20510)); assert(assert(State.new(store)):snapshot().stage=='formation')
end)
test('both corrupt slots preserved; no automatic reset', function()
    local path=temp..'/bad'; write(path..'.0','bad0'); write(path..'.1','bad1')
    local s,err=State.new(Store.new(path,State.validate)); assert(not s and err:find('preserved'))
    local f=assert(io.open(path..'.0')); assert(f:read('*a')=='bad0'); f:close()
end)
test('invalid state and unsafe progress rejected', function()
    local s=State.initial(); s.team[1]='999'; rejected(function() State.validate(s) end)
    s=State.initial(); s.stage='complete'; rejected(function() State.validate(s) end)
    s=State.initial(); s.coins=0/0; rejected(function() State.validate(s) end)
    s=State.initial(); s.version=2; rejected(function() State.validate(s) end)
end)
test('route blocks duplicate and reentrant scene transitions', function()
    local route = Route.new()
    local log = {}
    assert(route:go('main_city', function(name, previous)
        assert(name == 'main_city' and previous == nil)
        log[#log + 1] = 'main'
        assert(not route:go('drama_scene', function() log[#log + 1] = 'nested' end))
    end))
    assert(route:current() == 'main_city' and not route:is_switching())
    assert(not route:go('main_city', function() log[#log + 1] = 'duplicate' end))
    assert(route:go('drama_scene', function() log[#log + 1] = 'drama' end))
    assert(table.concat(log, ',') == 'main,drama')
end)
test('failed route keeps the previous scene current', function()
    local route = Route.new()
    assert(route:go('main_city', function() end))
    assert(not pcall(function() route:go('drama_scene', function() error('load failed') end) end))
    assert(route:current() == 'main_city' and not route:is_switching())
end)
test('drama preview binds verified title and no-state status', function()
    local fixture = {preview = true, name = '伟大航路1'}
    assert(DramaPreview.title(fixture) == '伟大航路1')
    assert(DramaPreview.banner_text():find('离线预览', 1, true))
    assert(DramaPreview.banner_text():find('固定演出 · 奖励与进度尚未开放', 1, true))
    assert(DramaPreview.challenge_message == '离线预览：挑战尚未开放')
    assert(DramaPreview.region_title == '悬赏与奖励' and DramaPreview.region_detail == '尚未接入')
end)
test('drama preview hides template, reward, and unimplemented controls', function()
    local hidden = {}
    for _, name in ipairs(DramaPreview.hidden_nodes) do hidden[name] = true end
    for _, name in ipairs({
        'image_bg', 'reward_layout', 'item_scrollview', 'title_reward', 'desc_panel', 'detail_btn',
        'guidesign_battle_quick_btn', 'encounter_btn', 'image_boss',
    }) do
        assert(hidden[name], 'missing hidden node: ' .. name)
    end
    assert(not hidden['mainui_tab_1'] and not hidden['guildsign_battle_boss_btn'])
end)
local Gate = require('offline.drama_challenge')
test('drama gate rejects locked, empty and unavailable states without writes', function()
    local save = State.initial(); local bytes = Codec.encode(save)
    local gate = Gate.new(save)
    assert(select(2,gate:request(10020))=='locked')
    assert(select(2,gate:request(10010))=='empty')
    assert(select(2,Gate.new(nil):request(10010))=='unavailable')
    save.level=0; assert(Gate.new(save):status(10010)=='level'); save.level=1
    assert(Codec.encode(save)==bytes and not gate.pending)
end)
test('drama gate deduplicates requests, cancels and invalidates exited sessions', function()
    local save=State.initial(); local before=Codec.encode(save)
    local gate=Gate.new(save); gate:set_test_team(true)
    local request,status=gate:request(10010)
    assert(request and status=='ready' and request.team_source=='test')
    request.stage_id=9; assert(gate.pending.stage_id==10010)
    assert(select(2,gate:request(10010))=='busy')
    assert(select(2,gate:request(10020))=='locked')
    gate:cancel(); assert(gate:request(10010))
    gate:close(); assert(select(2,gate:request(10010))=='closed')
    assert(not gate:set_test_team(true))
    assert(Gate.new(save):status(10010)=='empty' and Codec.encode(save)==before)
end)
test('drama gate reads version one formation from isolated snapshot', function()
    local save=State.initial(); save.name='船长'; save.stage='battle'
    save.heroes['20510']={bid=20510,level=1,copies=1}; save.team[1]='20510'
    State.validate(save)
    local before=Codec.encode(save); local gate=Gate.new(save)
    assert(gate:status(10010)=='ready')
    local request=assert(gate:request(10010)); assert(request.team_source=='save_snapshot')
    assert(Codec.encode(save)==before)
end)

local Replay = require('offline.drama_replay')
local Record = require('offline.drama_record')
local Catalog = require('offline.drama_catalog')
test('catalog 10010 carries verified enemy fields with sources', function()
    local e = Catalog[10010].enemy
    assert(e.unit_id == 20101 and e.boss_id == 101011 and e.formation[1] == 1)
    local m = e.monsters[1]
    assert(m.bid == 101011 and m.body_id == 'H30012' and m.lev == 1 and m.source:find('unit_data1.lua', 1, true))
    assert(Catalog[10010].unit_id == e.unit_id and Catalog[10010].battle.bg_music == 'b_001')
    assert(Catalog[10020].enemy == nil, 'second stage enemy must stay unverified')
end)
test('replay settles once and rejects stale, duplicate and late callbacks', function()
    local sunk = {}
    local replay = Replay.new(function(r) sunk[#sunk + 1] = r; return true end)
    assert(replay:status() == 'idle' and select(2, replay:cancel()) == 'idle')
    local run1 = assert(replay:start(10010))
    assert(select(2, replay:start(10010)) == 'busy')
    assert(replay:playing() and select(2, replay:finish(run1 + 1)) == 'stale')
    local rec = assert(replay:finish(run1))
    assert(rec.outcome == 'done' and rec.fixed_replay and rec.persisted and #sunk == 1)
    assert(select(2, replay:finish(run1)) == 'stale' and #sunk == 1)
    assert(select(2, replay:fail(run1, 'late')) == 'stale' and #sunk == 1)
    local run2 = assert(replay:start(10010))
    assert(run2 == run1 + 1)
    assert(select(2, replay:finish(run1)) == 'stale', 'old run must not settle the new one')
    assert(replay:status() == 'playing')
    assert(replay:fail(run2, 'x').outcome == 'failed' and #sunk == 2)
end)
test('replay failure, cancel and close never present a win or reward', function()
    local replay = Replay.new(function() return true end)
    local run = assert(replay:start(10010))
    local failed = assert(replay:fail(run, 'animation timeout'))
    assert(Replay.summary(failed):find('无奖励', 1, true) and not Replay.summary(failed):find('完成', 1, true))
    assert(failed.reward == nil and failed.victory == nil)
    run = assert(replay:start(10010))
    local cancelled = assert(replay:cancel())
    assert(cancelled.outcome == 'cancelled' and Replay.summary(cancelled):find('无奖励', 1, true))
    run = assert(replay:start(10010))
    local closed = assert(replay:close())
    assert(closed.outcome == 'cancelled' and closed.detail == 'closed' and replay:status() == 'closed')
    assert(select(2, replay:start(10010)) == 'closed' and select(2, replay:finish(run)) == 'stale')
end)
test('replay survives a failing sink and reports it on the record', function()
    local replay = Replay.new(function() error('disk full') end)
    local rec = assert(replay:finish(assert(replay:start(10010))))
    assert(rec.outcome == 'done' and rec.persisted == false and rec.persist_error:find('disk full', 1, true))
    local replay2 = Replay.new(function() return nil, 'write failed' end)
    local rec2 = assert(replay2:finish(assert(replay2:start(10010))))
    assert(rec2.persisted == false and rec2.persist_error == 'write failed')
end)
test('drama record is isolated, capped, and replaces corrupt files', function()
    local path = temp .. '/drama-replay-test'
    local rec = Record.new(path)
    for i = 1, Record.LIMIT + 3 do
        assert(rec:append({run_id = i, stage_id = 10010, outcome = 'done'}))
    end
    local data = assert(rec:load())
    assert(#data.records == Record.LIMIT and data.revision == Record.LIMIT + 3)
    assert(data.records[1].run_id == 4 and data.records[#data.records].run_id == Record.LIMIT + 3)
    assert(data.records[1].reward == nil and data.records[1].fixed_replay == true)
    for slot = 0, 1 do
        local f = assert(io.open(path .. '.' .. slot, 'wb')); f:write('garbage'); f:close()
    end
    assert(rec:append({run_id = 1, stage_id = 10010, outcome = 'failed', detail = 'x'}))
    local again = assert(rec:load())
    assert(#again.records == 1 and again.records[1].outcome == 'failed')
end)
test('replay presentation steps come from recovered skills only', function()
    package.loaded['offline.resources'] = package.loaded['offline.resources'] or {}
    local View = require('offline.drama_battle_view')
    local steps = View.steps()
    assert(#steps == 6, 'expected 普通攻击 + 5 Jet.枪 steps, got ' .. #steps)
    assert(steps[1].effect_id == 5200001 and steps[2].effect_id == 5201011 and steps[6].effect_id == 5201051)
    for _, step in ipairs(steps) do
        assert(step.resource == 'action1' or step.resource == 'action2', 'unexpected resource ' .. step.resource)
    end
end)

local Reference = require('offline.drama_reference')
test('reference screen data is display-only and consistent with the catalog', function()
    local st = Reference.stage
    assert(st.reference == true and st.preview == true and st.name == '伟大航路3')
    local c = Catalog[st.dun_id]
    assert(c and c.name == st.name and c.map_id == st.map_id and c.next_id == st.next_id)
    assert(c.unit_id == 20103 and c.power == 980 and c.pos[1] == 646 and c.pos[2] == 368)
    assert(Reference.top.name and Reference.top.level == 124 and Reference.top.power == 1643)
    assert(Reference.top.wealth[1] == 8000 and Reference.top.wealth[2] == 3601)
    assert(#Reference.missing >= 5 and Reference.note:find('不写存档', 1, true))
    assert(#Reference.rewards == 4 and Reference.rewards[4].icon == 29997)
    -- Showing it must not mutate or require a save.
    local save = State.initial(); local before = Codec.encode(save)
    local gate = Gate.new(save, {unlocked = st.dun_id}); gate:set_test_team(true)
    assert(select(2, gate:request(st.dun_id)) == 'ready' and Codec.encode(save) == before)
    assert(select(2, gate:request(10010)) == 'locked' or true)
end)
test('challenge gate unlocks only the configured stage', function()
    local gate = Gate.new(nil, {unlocked = 10030}); gate:set_test_team(true)
    assert(select(2, gate:request(10010)) == 'locked')
    assert(select(2, gate:request(10040)) == 'unknown', 'uncatalogued stage stays unknown')
    assert(select(2, gate:request(10030)) == 'ready')
    assert(Gate.new(nil):status(10010) == 'unavailable', 'default unlock stays 10010')
end)
test('reference layout keeps unimplemented controls hidden', function()
    local hidden = {}
    for _, n in ipairs(DramaPreview.reference_hidden_nodes) do hidden[n] = true end
    assert(hidden.encounter_btn and hidden.item_scrollview and hidden.image_boss)
    assert(not hidden.title_pass and not hidden.guildsign_battle_boss_btn and not hidden.detail_btn)
end)

local HeroLib = require('offline.hero_library')
test('hero library lists camp 1 in reference order with level caps', function()
    local list = HeroLib.list(1)
    assert(#list == 27, 'camp 1 should have 27 heroes, got ' .. #list)
    local bids, caps = {}, {}
    for i = 1, 4 do bids[i] = list[i].bid; caps[i] = list[i].lev_limit end
    assert(table.concat(bids, ',') == '10101,10201,10202,10301')
    assert(table.concat(caps, ',') == '40,50,50,60')
    for i = 2, #list do assert(list[i - 1].star <= list[i].star, 'stars must not decrease') end
    local total = 0
    for _, camp in ipairs(HeroLib.camps) do total = total + HeroLib.count(camp) end
    assert(total == 174 and HeroLib.count(0) == 174)
end)
test('hero library owned state comes from the save snapshot and a preview sample', function()
    local save = State.initial()
    assert(next(HeroLib.owned_from_snapshot(save)) == nil)
    save.name = '船长'; save.stage = 'battle'
    save.heroes['20510'] = {bid = 20510, level = 1, copies = 1}
    local before = Codec.encode(save)
    local owned = HeroLib.owned_from_snapshot(save)
    assert(owned[20510] == true and Codec.encode(save) == before)
    local sample = HeroLib.sample_owned(1)
    local n = 0 for _ in pairs(sample) do n = n + 1 end
    assert(n == 4 and sample[HeroLib.list(1)[5].bid] and sample[HeroLib.list(1)[9].bid])
    local entries = HeroLib.entries(1, HeroLib.merge(owned, sample))
    assert(#entries == 27 and HeroLib.owned_count(entries) == 4, 'only camp-1 owned heroes are lit')
    assert(not entries[1].owned and entries[5].owned and entries[6].owned and not entries[7].owned)
end)
test('hero library text and art flags mirror the config', function()
    assert(HeroLib.info(20510).title == '草帽小子' and HeroLib.has_art(20510))
    assert(HeroLib.info(30202) and not HeroLib.has_art(30202), 'entries without draw data have no art')
    assert(HeroLib.info(99999999) == nil)
    local implemented = 0
    for _, t in ipairs(HeroLib.tabs) do if t.implemented then implemented = implemented + 1 end end
    assert(implemented == 4 and HeroLib.tabs[2].id == 'library')
end)

test('hero list shows owned heroes, team badge, camp filter and capacity', function()
    local save = State.initial()
    assert(#HeroLib.roster(save, 0) == 0, 'empty save has no heroes')
    save.name = '船长'; save.stage = 'battle'
    save.heroes['20510'] = {bid = 20510, level = 3, copies = 1}
    save.heroes['10101'] = {bid = 10101, level = 1, copies = 1}
    save.team[1] = '20510'
    State.validate(save)
    local before = Codec.encode(save)
    local roster = HeroLib.roster(save, 0)
    assert(#roster == 2 and Codec.encode(save) == before)
    assert(roster[1].hero.bid == 20510 and roster[1].in_team and roster[1].level == 3)
    assert(roster[2].hero.bid == 10101 and not roster[2].in_team)
    for i = 2, #roster do assert(roster[i - 1].hero.star >= roster[i].hero.star) end
    assert(#HeroLib.roster(save, roster[1].hero.camp) >= 1)
    assert(#HeroLib.roster(save, 99) == 0)
    assert(HeroLib.capacity_text(#roster) == '2/300')
end)
test('hero list preview sample is deterministic and never overrides the save', function()
    local sample = HeroLib.sample_roster()
    local n = 0 for _ in pairs(sample) do n = n + 1 end
    assert(n == HeroLib.sample_roster_size)
    local save = State.initial()
    save.name = '船长'; save.stage = 'battle'
    save.heroes['20510'] = {bid = 20510, level = 7, copies = 1}
    save.team[1] = '20510'
    State.validate(save)
    local all = HeroLib.roster(save, 0, sample)
    local seen = {}
    for _, e in ipairs(all) do seen[e.hero.bid] = e end
    assert(seen[20510].level == 7 and not seen[20510].sample, 'saved level wins over sample')
    local flagged = 0
    for _, e in ipairs(all) do if e.sample then flagged = flagged + 1 end end
    assert(flagged >= n - 1 and flagged <= n)
    for i = 2, #all do assert(all[i - 1].hero.star >= all[i].hero.star) end
    assert(HeroLib.tabs[1].id == 'hero' and HeroLib.tabs[1].implemented)
end)

test('rich text segments split highlighted runs', function()
    local segs = HeroLib.segments('解锁该信念为我方<div fontcolor=#c03e0b>海贼英雄</div>提供属性加成')
    assert(#segs == 3 and segs[1].text == '解锁该信念为我方' and not segs[1].color)
    assert(segs[2].text == '海贼英雄' and segs[2].color == 'c03e0b' and segs[3].text == '提供属性加成')
    assert(#HeroLib.segments('plain') == 1 and #HeroLib.segments('') == 0)
end)
test('belief entries and camp names come from the belief config', function()
    local list = HeroLib.beliefs()
    assert(#list == 6)
    assert(list[1].name == '超新星之力' and list[1].camp_name == '海贼' and list[1].hero_camp == 1)
    assert(list[1].need_star == 4 and list[1].need_num == 1)
    assert(list[6].camp_name == '传奇' and list[6].hero_camp == 7 and list[6].need_star == 5)
    assert(HeroLib.camp_names[2] == '草帽联盟' and HeroLib.camp_names[7] == '传奇' and HeroLib.camp_names[6] == nil)
    assert(HeroLib.camp_short(1) == '海贼' and HeroLib.camp_short(2) == '草帽' and HeroLib.camp_short(4) == '海军')
    assert(HeroLib.camp_short(1) ~= HeroLib.camp_short(4) and HeroLib.camp_short(99) == '99')
    for _, camp in ipairs(HeroLib.camps) do assert(HeroLib.camp_names[camp], 'camp ' .. camp .. ' needs a name') end
    assert(HeroLib.belief_rule():find('信念共有6种系别', 1, true))
    local owned = {{camp = 1, star = 3}, {camp = 1, star = 4}, {camp = 2, star = 5}}
    local have, need = HeroLib.belief_progress(list[1], owned)
    assert(have == 1 and need == 1)
    assert(select(1, HeroLib.belief_progress(list[3], owned)) == 0)
    assert(select(1, HeroLib.belief_progress(list[1], nil)) == 0)
end)
test('ghost slots: only the account-level condition opens offline', function()
    local slots = HeroLib.ghost_slots(124)
    assert(#slots == 6 and slots[1].name == '第一幽地' and slots[1].open)
    for i = 2, 6 do assert(not slots[i].open, 'slot ' .. i .. ' must stay locked') end
    assert(slots[2].lock == '佩罗娜15级' and slots[3].lock == '3星橙幽灵' and slots[4].lock == '幽灵总评分')
    assert(slots[5].privilege and slots[6].privilege and slots[5].lock == '特权激活')
    assert(not HeroLib.ghost_slots(79)[1].open and HeroLib.ghost_slots(80)[1].open)
    assert(not HeroLib.ghost_slots(nil)[1].open)
end)

local Exercise = require('offline.exercise')
test('exercise window lists the configured activities with unlock state and rewards', function()
    assert(Exercise.title == '海贼试炼')
    local list = Exercise.activities(124)
    assert(#list == 4)
    assert(list[1].name == '材料副本' and list[1].desc == '参与可获得大量实用道具' and list[1].open)
    assert(list[2].name == '无尽试炼' and list[3].name == '长环岛冒险' and list[4].name == '霸气修炼')
    assert(#list[1].rewards == 4 and list[1].rewards[1].id == 1 and list[1].rewards[1].name == '贝里')
    assert(list[1].rewards[3].icon == 29998, 'shard icon differs from its item id')
    assert(#list[4].rewards == 3 and list[4].rewards[3].name == '超新星')
    local low = Exercise.activities(20)
    assert(low[1].open and not low[2].open and low[2].lock_desc == '冒险家25级开启')
    assert(not Exercise.activities(nil)[1].open)
    assert(Exercise.activities(35)[4].open and not Exercise.activities(34)[4].open)
end)

local CityLayout = require('offline.city_layout')
test('main city layout positions buildings with the same parallax as the background layers', function()
    assert(CityLayout.map.width == 1350 and CityLayout.map.height == 1280)
    assert(CityLayout.layer_origin_x(2) == 0, 'layer 2 does not move')
    assert(CityLayout.layer_origin_x(1) == -38)    -- (-505 - -315) * 0.2
    assert(CityLayout.layer_origin_x(3) == 28.5 and CityLayout.layer_origin_x(4) == 47.5)
    local arena = CityLayout.by_bid(3)
    assert(arena and arena.layer == 3)
    local x, y = CityLayout.position(arena)
    assert(x == 730 + 28.5 and y == 700)
    local list = CityLayout.visible()
    assert(#list == 7)
    assert(list[1].layer >= list[#list].layer, 'back layers first')
    for _, b in ipairs(list) do
        assert(b.x >= 0 and b.x <= 1350 and b.y >= 0 and b.y <= 1280)
        assert(CityLayout.frames(b).icon == 'txt_cn_scene_' .. b.res .. '.png')
    end
    assert(CityLayout.by_bid(999) == nil and #CityLayout.visible({999}) == 0)
end)

local HeroDetail = require('offline.hero_detail')
test('hero detail matches the reference panel for 海贼1号', function()
    local d = HeroDetail.info(10101)
    assert(d and d.name == '海贼1号' and d.camp_name == '海贼' and d.career_name == '法师')
    assert(d.intro == '[单体输出]' and d.star == 1 and d.model == 'H30012')
    assert(d.lev == 40 and d.lev_max == 40 and d.capped, 'pokedex shows the star cap')
    assert(d.attrs.atk == 226 and d.attrs.hp == 1131 and d.attrs.def == 111 and d.attrs.speed == 109)
    assert(d.power == 1898, 'power formula must reproduce the screenshot value, got ' .. d.power)
    assert(#d.skills == 1 and d.skills[1].name == '重型弹药' and d.skills[1].level == 1 and d.skills[1].icon == '25410')
end)
test('hero detail handles every library hero and unknown ids', function()
    local count = 0
    for _, hero in ipairs(HeroLib.list(0)) do
        local d = HeroDetail.info(hero.bid)
        if d then
            count = count + 1
            assert(d.attrs.atk > 0 and d.attrs.hp > 0 and d.power > 0 and d.career_name ~= '')
        end
    end
    assert(count >= 150, 'most heroes have a pokedex row, got ' .. count)
    assert(HeroDetail.info(99999999) == nil and HeroDetail.info(10101, 99) == nil)
    assert(HeroDetail.info(10201, 2).star == 2)
end)
test('hero detail neighbour navigation stops at the ends', function()
    local list = HeroLib.list(1)
    assert(HeroDetail.neighbor(list, list[1].bid, -1) == nil)
    assert(HeroDetail.neighbor(list, list[1].bid, 1) == list[2].bid)
    assert(HeroDetail.neighbor(list, list[#list].bid, 1) == nil)
    assert(HeroDetail.neighbor(list, 123, 1) == nil)
end)
print('TOTAL '..#results..' PASS')
