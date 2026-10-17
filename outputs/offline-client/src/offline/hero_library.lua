-- Hero library (图鉴) logic: filtering, ordering and owned/unowned state.
-- Engine-free so it can be unit-tested. Data comes from hero_data.lua
-- (generated from partner_data.lua). Nothing here writes the save.
local Data = require('offline.hero_data')
local Extra = require('offline.hero_extra_data')
local M = {}

-- camp_type values present in data_partner_base; their display names are not recovered.
M.camps = {1, 2, 3, 4, 5, 7}
M.default_camp = 1

-- Tabs of the hero window (reference screenshot): all four are implemented (ghost and belief
-- pages are config-driven, with placeholder art).
M.tabs = {
    {id = 'hero', name = '英雄', implemented = true},
    {id = 'library', name = '图鉴', implemented = true},
    {id = 'ghost', name = '幽灵', implemented = true},
    {id = 'belief', name = '信念', implemented = true},
}

-- Original HeroLibraryMainWindow.updateHeroList sorts by {type, init_star, camp, sort_order}
-- with flags false/true/false/false, but the decompiled flag semantics disagree with the
-- reference screenshot (stars ascend there). The screenshot order is used: star asc,
-- then type, show_order, bid.
local function before(a, b)
    if a.star ~= b.star then return a.star < b.star end
    if a.type ~= b.type then return a.type < b.type end
    if a.show_order ~= b.show_order then return a.show_order < b.show_order end
    return a.bid < b.bid
end

function M.list(camp)
    local out = {}
    for _, hero in pairs(Data.heroes) do
        if camp == nil or camp == 0 or hero.camp == camp then
            out[#out + 1] = hero
        end
    end
    table.sort(out, before)
    return out
end

function M.count(camp) return #M.list(camp) end

function M.hero(bid) return Data.heroes[bid] end

-- Owned set from a state snapshot (State.initial().heroes is keyed by string bid).
function M.owned_from_snapshot(snapshot)
    local owned = {}
    if type(snapshot) == 'table' and type(snapshot.heroes) == 'table' then
        for key in pairs(snapshot.heroes) do
            local bid = tonumber(key)
            if bid then owned[bid] = true end
        end
    end
    return owned
end

-- Preview-only sample so lit/grey states are visible with an empty save: the 5th, 6th, 8th
-- and 9th hero of the default camp, matching the reference screenshot. Never saved.
M.sample_positions = {5, 6, 8, 9}
function M.sample_owned(camp)
    local owned, list = {}, M.list(camp or M.default_camp)
    for _, index in ipairs(M.sample_positions) do
        if list[index] then owned[list[index].bid] = true end
    end
    return owned
end

function M.merge(...)
    local out = {}
    for _, set in ipairs({...}) do
        for bid in pairs(set) do out[bid] = true end
    end
    return out
end

-- Entries for one camp: {hero=..., owned=bool}.
function M.entries(camp, owned)
    local entries = {}
    for _, hero in ipairs(M.list(camp)) do
        entries[#entries + 1] = {hero = hero, owned = owned and owned[hero.bid] == true or false}
    end
    return entries
end

function M.owned_count(entries)
    local n = 0
    for _, e in ipairs(entries) do if e.owned then n = n + 1 end end
    return n
end

-- Library text; has_art mirrors "draw_offset non-empty and scale > 0" in the config.
function M.info(bid) return Data.library[bid] end
function M.has_art(bid)
    local info = Data.library[bid]
    return info ~= nil and info.has_art == true
end

-- ---------------------------------------------------------------------------
-- Hero list (英雄 tab): the heroes the player owns.
-- ---------------------------------------------------------------------------

-- Capacity text in the reference screenshot is "23/300"; the original reads it from the
-- hero-bag config (HeroModel:getHeroMaxCount), which is not recovered here.
M.capacity = 300
M.sample_roster_size = 23

-- Preview-only sample roster so the page is not empty with a fresh save: the 23 highest
-- star heroes (ties by bid). Never written to the save, and not the screenshot account.
function M.sample_roster()
    local list = M.list(0)
    table.sort(list, function(a, b)
        if a.star ~= b.star then return a.star > b.star end
        return a.bid < b.bid
    end)
    local out = {}
    for i = 1, math.min(M.sample_roster_size, #list) do out[list[i].bid] = true end
    return out
end

-- Owned heroes for the list. `snapshot` is a state snapshot (heroes keyed by string bid,
-- team = {slot -> string bid}); `extra` is an optional bid set (preview sample).
-- Order: star desc, level desc, bid asc (approximation of the reference; the original
-- hero-bag sorter is not verified).
function M.roster(snapshot, camp, extra)
    local data, in_team = {}, {}
    if type(snapshot) == 'table' then
        for _, bid in pairs(type(snapshot.team) == 'table' and snapshot.team or {}) do
            local n = tonumber(bid)
            if n then in_team[n] = true end
        end
        for key, row in pairs(type(snapshot.heroes) == 'table' and snapshot.heroes or {}) do
            local bid = tonumber(key)
            if bid and Data.heroes[bid] then
                data[bid] = {level = type(row) == 'table' and row.level or 1}
            end
        end
    end
    for bid in pairs(extra or {}) do
        if Data.heroes[bid] and not data[bid] then data[bid] = {level = 1, sample = true} end
    end
    local out = {}
    for bid, row in pairs(data) do
        local hero = Data.heroes[bid]
        if camp == nil or camp == 0 or hero.camp == camp then
            out[#out + 1] = {hero = hero, level = row.level or 1, in_team = in_team[bid] == true,
                             sample = row.sample == true}
        end
    end
    table.sort(out, function(a, b)
        if a.hero.star ~= b.hero.star then return a.hero.star > b.hero.star end
        if a.level ~= b.level then return a.level > b.level end
        return a.hero.bid < b.hero.bid
    end)
    return out
end

function M.capacity_text(count)
    return string.format('%d/%d', count, M.capacity)
end

-- ---------------------------------------------------------------------------
-- Rich text: "<div fontcolor=#RRGGBB>x</div>" runs, as used by the original configs.
-- ---------------------------------------------------------------------------
function M.segments(text)
    local out, pos = {}, 1
    text = tostring(text or '')
    while true do
        local a, b, hex = text:find('<div fontcolor=#(%x+)>', pos)
        if not a then break end
        if a > pos then out[#out + 1] = {text = text:sub(pos, a - 1)} end
        local c, d = text:find('</div>', b + 1, true)
        local inner = text:sub(b + 1, (c or #text + 1) - 1)
        out[#out + 1] = {text = inner, color = hex}
        pos = (d or #text) + 1
    end
    if pos <= #text then out[#out + 1] = {text = text:sub(pos)} end
    return out
end

-- ---------------------------------------------------------------------------
-- Belief (信念, halidom): one entry per camp. Camp names come from the highlighted
-- word of each entry's lock_desc ("...我方<海贼>英雄...").
-- ---------------------------------------------------------------------------
M.belief_count = 6    -- the screen shows six camp buttons; the config has a 7th duplicate

function M.beliefs()
    local out = {}
    for i, row in ipairs(Extra.belief) do
        if i <= M.belief_count then
            local name
            for _, seg in ipairs(M.segments(row.lock_desc)) do
                if seg.color then name = (seg.text:gsub('英雄$', '')) end
            end
            out[#out + 1] = {id = row.id, camp = row.camp, hero_camp = row.need_camp, name = row.name,
                             desc = row.desc, lock_desc = row.lock_desc, camp_name = name,
                             need_star = row.need_star, need_num = row.need_num}
        end
    end
    return out
end

-- hero camp_type -> camp name (derived from the belief config).
M.camp_names = {}
for _, b in ipairs(M.beliefs()) do
    if b.camp_name then M.camp_names[b.hero_camp] = b.camp_name end
end

function M.camp_short(camp)
    local name = M.camp_names[camp]
    if not name then return tostring(camp) end
    return name:sub(1, 6)   -- first two CJK characters (3 UTF-8 bytes each): 海贼 / 海军 differ
end

function M.belief_rule() return Extra.rule end

-- Number of owned heroes that satisfy a belief's unlock requirement (camp + minimum star).
function M.belief_progress(belief, owned_heroes)
    local n = 0
    for _, hero in ipairs(owned_heroes or {}) do
        if hero.camp == belief.hero_camp and hero.star >= belief.need_star then n = n + 1 end
    end
    return math.min(n, belief.need_num), belief.need_num
end

-- ---------------------------------------------------------------------------
-- Ghost (幽灵, elfin/sprite) hatch slots. Only the account-level condition can be evaluated
-- offline; the rest depend on data (ghost tree level, ghosts, score, privilege) that is not
-- modelled, so those slots stay locked.
-- ---------------------------------------------------------------------------
function M.ghost_slots(level)
    local out = {}
    for _, row in ipairs(Extra.ghost_slots) do
        local open = row.cond == 'lev' and type(level) == 'number' and level >= row.value
        out[#out + 1] = {sort = row.sort, name = row.name, lock = row.lock, tip = row.tip,
                         cond = row.cond, value = row.value, cost = row.cost,
                         open = open, privilege = row.cond == 'privilege'}
    end
    return out
end

return M
