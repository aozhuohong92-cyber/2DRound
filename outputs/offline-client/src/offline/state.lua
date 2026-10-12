-- Handwritten offline domain layer; balances/rewards are local fixtures, not server rules.
local Codec = require('offline.codec')
local State = {}
State.__index = State
local stages = {name = true, summon = true, formation = true, battle = true, complete = true}
local function integer(n, low, high)
    return type(n) == 'number' and n == math.floor(n) and n >= low and n <= high
end
function State.initial()
    return {version = 1, revision = 0, name = '', stage = 'name', coins = 0,
        level = 1, chapter = 1, heroes = {}, team = {}, claims = {}}
end
function State.validate(s)
    assert(type(s) == 'table' and s.version == 1, 'unsupported save version')
    assert(integer(s.revision, 0, 2147483647), 'invalid revision')
    assert(type(s.name) == 'string' and #s.name <= 48 and not s.name:find('%c'), 'invalid name')
    assert(stages[s.stage], 'invalid tutorial stage')
    assert(integer(s.coins, 0, 2147483647), 'invalid coins')
    assert(integer(s.level, 1, 10000) and integer(s.chapter, 1, 100000), 'invalid progress')
    assert(type(s.heroes) == 'table' and type(s.team) == 'table' and type(s.claims) == 'table', 'invalid collections')
    local count = 0
    for id, hero in pairs(s.heroes) do
        count = count + 1
        assert(type(id) == 'string' and id:match('^%d+$') and type(hero) == 'table', 'invalid hero')
        assert(integer(hero.bid, 1, 999999) and tostring(hero.bid) == id, 'invalid hero id')
        assert(integer(hero.level, 1, 10000) and integer(hero.copies, 1, 100000), 'invalid hero stats')
    end
    assert(count <= 1000, 'hero limit')
    local occupied = {}
    for slot, id in pairs(s.team) do
        assert(integer(slot, 1, 6) and s.heroes[id] and not occupied[id], 'invalid formation')
        occupied[id] = true
    end
    count = 0
    for id, flag in pairs(s.claims) do
        count = count + 1
        assert(type(id) == 'string' and #id > 0 and #id <= 96 and flag == true, 'invalid reward claim')
    end
    assert(count <= 10000, 'claim limit')
    if s.stage ~= 'name' then assert(s.name ~= '', 'name required') end
    if s.stage == 'formation' or s.stage == 'battle' or s.stage == 'complete' then
        assert(next(s.heroes), 'hero required')
    end
    if s.stage == 'battle' or s.stage == 'complete' then assert(next(s.team), 'team required') end
    return true
end
function State.new(store, events)
    local data, status, errors = store:load()
    if status == 'corrupt' then return nil, 'Existing saves are unreadable; preserved without overwriting.' end
    data = data or State.initial()
    State.validate(data)
    return setmetatable({_data = data, store = store, events = events, status = status, busy = false}, State)
end
function State:snapshot() return Codec.clone(self._data) end
function State:transaction(reason, update)
    if self.busy then return nil, 'nested transaction' end
    self.busy = true
    local ok, value = pcall(function()
        local next_state = self:snapshot()
        update(next_state)
        next_state.revision = next_state.revision + 1
        State.validate(next_state)
        local saved, err = self.store:save(next_state)
        assert(saved, err)
        self._data = next_state
        -- Keep busy until observers finish so notifications preserve commit order.
        if self.events then self.events:emit('state.changed', {reason = reason, state = self:snapshot()}) end
        return self:snapshot()
    end)
    self.busy = false
    if not ok then return nil, tostring(value) end
    return value
end
function State:set_name(name)
    return self:transaction('name', function(s)
        assert(s.stage == 'name', 'name step already completed')
        assert(type(name) == 'string', 'invalid name')
        name = name:match('^%s*(.-)%s*$')
        assert(name ~= '', 'name required')
        s.name = name; s.stage = 'summon'
    end)
end
function State:summon_fixture(bid)
    return self:transaction('summon.fixture', function(s)
        assert(s.stage == 'summon' and integer(bid, 1, 999999), 'invalid summon step')
        s.heroes[tostring(bid)] = {bid = bid, level = 1, copies = 1}
        s.stage = 'formation'
    end)
end
function State:equip(slot, id)
    return self:transaction('formation', function(s)
        assert(s.stage == 'formation' or s.stage == 'battle', 'invalid formation step')
        assert(integer(slot, 1, 6) and type(id) == 'string' and s.heroes[id], 'hero not owned or invalid slot')
        for position, hero in pairs(s.team) do if hero == id then s.team[position] = nil end end
        s.team[slot] = id; s.stage = 'battle'
    end)
end
function State:claim_fixture(id, coins)
    return self:transaction('reward.fixture', function(s)
        assert(s.stage == 'battle', 'battle required')
        assert(type(id) == 'string' and #id > 0 and #id <= 96 and not s.claims[id], 'reward already claimed or invalid id')
        assert(integer(coins, 0, 2147483647), 'invalid reward')
        s.coins = s.coins + coins; s.claims[id] = true; s.stage = 'complete'
    end)
end
return State
