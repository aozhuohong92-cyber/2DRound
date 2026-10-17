-- Single-hero panel opened from the library (the original HeroMainInfoWindow in pokedex mode:
-- the hero shown at its star's maximum level). Engine-free; data from hero_stats_data.lua
-- (generated from data_partner_show / data_partner_star / skill data). No save access.
local Stats = require('offline.hero_stats_data')
local Lib = require('offline.hero_library')
local M = {}

-- PartnerConst.Hero_Type (index = hero `type`).
M.careers = {'控制', '法师', '战士', '坦克', '辅助'}

-- PartnerCalculate.calculatePower: sum((value - not_to_power) * weight * 0.001), rounded up.
-- The pokedex row sets hp_max = hp before calling it, so hp is weighted as hp_max.
function M.power(row)
    local sum = 0
    for key, weight in pairs(Stats.power) do
        local value = row[key]
        if key == 'hp_max' then value = row.hp end
        if value then sum = sum + (value - weight[2]) * weight[1] * 0.001 end
    end
    return math.ceil(sum)
end

function M.key(bid, star) return tostring(bid) .. '_' .. tostring(star) end

-- Detail for a hero at `star` (defaults to its initial star). Returns nil when the pokedex
-- row does not exist.
function M.info(bid, star)
    local hero = Lib.hero(bid)
    if not hero then return nil end
    star = star or hero.star
    local row = Stats.rows[M.key(bid, star)]
    if not row then return nil end
    local skills = {}
    for _, id in ipairs(row.skills) do
        local skill = Stats.skills[id]
        -- Normal attacks are not listed in this panel (see the reference screenshot).
        if skill and skill.normal == 0 then
            skills[#skills + 1] = {id = id, name = skill.name, level = skill.level, icon = skill.icon}
        end
    end
    return {
        bid = bid, name = hero.name, camp = hero.camp, camp_name = Lib.camp_names[hero.camp],
        career = hero.type, career_name = M.careers[hero.type] or '', intro = hero.intro,
        star = star, lev = row.lev, lev_max = row.lev_max, capped = row.lev >= row.lev_max,
        attrs = {atk = row.atk, hp = row.hp, def = row.def, speed = row.speed},
        power = M.power(row), model = row.model, skills = skills,
    }
end

-- Neighbouring hero in a list of hero entries ({bid=...}); nil at either end.
function M.neighbor(list, bid, delta)
    for i, hero in ipairs(list) do
        if hero.bid == bid then
            local other = list[i + delta]
            return other and other.bid or nil
        end
    end
end

return M
