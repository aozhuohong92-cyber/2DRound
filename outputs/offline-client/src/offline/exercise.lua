-- 历练 (海贼试炼) window logic: the activity list, unlock state and reward icons.
-- Engine-free; data from exercise_data.lua (generated from dailyplay_data.lua).
-- Offline only: no activity is actually entered and nothing is written to the save.
local Data = require('offline.exercise_data')
local M = {}

-- Window title used by the original (EsecsiceWindow Text_1).
M.title = '海贼试炼'

-- The original shows the first three banners on screen; the fourth needs scrolling.
-- `level` is the account level used for the unlock check (display value offline).
function M.activities(level)
    local out = {}
    for _, row in ipairs(Data.activities) do
        local open = row.is_open == 1 and type(level) == 'number' and level >= row.lev
        local rewards = {}
        for _, id in ipairs(row.items) do
            local item = Data.items[id]
            rewards[#rewards + 1] = {id = id, name = item and item.name ~= '' and item.name or tostring(id),
                                     icon = item and item.icon or id}
        end
        out[#out + 1] = {id = row.id, name = row.name, desc = row.desc, pic = row.pic, goto_id = row.goto_id,
                         lev = row.lev, open = open, lock_desc = row.lock_desc, rewards = rewards}
    end
    return out
end

return M
