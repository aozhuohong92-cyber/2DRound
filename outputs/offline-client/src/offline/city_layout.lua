-- Main-city building layout (engine-free). Positions follow CenterCityScene: every building
-- is a child of map_layer<layer>, whose origin is shifted by (camera - init_x) * speed.
local Data = require('offline.city_data')
local M = {}

-- Original camera_default_x_pos and the initial x used by the scene (see main_city.lua).
M.camera_x = -505
M.init_x = -315
-- map_layer speeds, layers 1..4 (same values main_city.lua uses for the four background layers).
M.speeds = {0.2, 0, -0.15, -0.25}
M.map = {width = Data.width, height = Data.height}

-- Buildings visible in the reference screenshot (bid): 跨服时空 13, 跨服战场 12, 果实共鸣 15,
-- 竞技场 3, 锻造屋 2, 伟大召唤 8, 恶魔果实 17. The original shows the rest only when their
-- function is open (conditions not recovered), so they stay hidden offline.
M.preview_visible = {13, 12, 15, 3, 2, 8, 17}

function M.layer_origin_x(layer)
    local speed = M.speeds[layer] or 0
    return (M.camera_x - M.init_x) * speed
end

-- Position of a building in map coordinates (before the map node's own scale/offset).
function M.position(building)
    return M.layer_origin_x(building.layer) + building.x, building.y
end

function M.by_bid(bid)
    for _, b in ipairs(Data.buildings) do
        if b.bid == bid then return b end
    end
end

-- Buildings to draw, ordered back (layer 4) to front (layer 2) like the original z order.
function M.visible(bids)
    local out = {}
    for _, bid in ipairs(bids or M.preview_visible) do
        local b = M.by_bid(bid)
        if b then out[#out + 1] = b end
    end
    table.sort(out, function(a, b)
        if a.layer ~= b.layer then return a.layer > b.layer end
        return a.bid < b.bid
    end)
    return out
end

-- Frame names for a building bubble in resource/centerscene/centerscene.plist.
function M.frames(building)
    return {bg = 'scene_icon_bg_1.png', icon = 'txt_cn_scene_' .. building.res .. '.png'}
end

return M
