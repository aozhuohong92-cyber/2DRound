-- Hero library (图鉴) logic: filtering, ordering and owned/unowned state.
-- Engine-free so it can be unit-tested. Data comes from hero_data.lua
-- (generated from partner_data.lua). Nothing here writes the save.
local Data = require('offline.hero_data')
local M = {}

-- camp_type values present in data_partner_base; their display names are not recovered.
M.camps = {1, 2, 3, 4, 5, 7}
M.default_camp = 1

-- Tabs of the hero window (reference screenshot): hero list and library are implemented.
M.tabs = {
    {id = 'hero', name = '英雄', implemented = true},
    {id = 'library', name = '图鉴', implemented = true},
    {id = 'ghost', name = '幽灵', implemented = false},
    {id = 'belief', name = '信念', implemented = false},
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

return M
