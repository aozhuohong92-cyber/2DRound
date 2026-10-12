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
    assert(DramaPreview.banner_text():find('演出、奖励与进度尚未开放', 1, true))
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
print('TOTAL '..#results..' PASS')
