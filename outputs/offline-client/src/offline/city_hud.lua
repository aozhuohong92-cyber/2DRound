-- Main-city overlay laid out from the reference screenshot (900x2000, design width 720 => x0.8):
-- building bubbles on the map, activity icon row, right-hand banner, Chopper's speech bubble
-- and the bottom round buttons. Original art for the HUD icons is not in the local resource
-- set, so those parts are labelled placeholders; nothing here has gameplay behaviour.
local Layout = require('offline.city_layout')
local M = {}
local S = 0.8

-- Sample texts from the reference screenshot (display only, not save data).
M.activities = {
    {name = '超值基金', sub = '10:07:13', x = 155},
    {name = '八天登陆', sub = '海量贝里', x = 268},
    {name = '七日目标', x = 380},
    {name = '主题活动', x = 490},
    {name = '限时活动', x = 602},
    {name = '福利', x = 713},
}
M.side = {
    {name = '充值', y = 320}, {name = '海楼石商城', y = 460}, {name = '每日首充', y = 575}, {name = '超值首充', y = 690},
}
M.bubble_names = {[13] = '跨服时空', [12] = '跨服战场', [15] = '果实共鸣', [3] = '竞技场',
                  [2] = '锻造屋', [8] = '伟大召唤', [17] = '恶魔果实'}
M.chopper_text = '跨服竞技场挑战'
M.bottom_buttons = {{x = 372}, {x = 490}, {x = 610, count = 3}, {x = 725}, {x = 840}}

local function color(node, r, g, b)
    pcall(function() node:setColor({r = r, g = g, b = b}) end)
end

local function frame_sprite(name)
    local fr = cc.SpriteFrameCache:getInstance():getSpriteFrame(name)
    if not fr then return nil end
    return cc.Sprite:createWithSpriteFrame(fr)
end

-- Bubbles go on the (scaled) map node so they follow its transform and parallax.
function M.attach_buildings(map_node, trace)
    pcall(function() cc.SpriteFrameCache:getInstance():addSpriteFrames('resource/centerscene/centerscene.plist') end)
    local drawn, fallback = 0, 0
    for _, b in ipairs(Layout.visible()) do
        local x, y = Layout.position(b)
        local frames = Layout.frames(b)
        local holder = cc.Node:create()
        holder:setPosition(x, y)
        local bg, icon = frame_sprite(frames.bg), frame_sprite(frames.icon)
        if bg then holder:addChild(bg, 1) end
        if icon then
            holder:addChild(icon, 2)
        else
            fallback = fallback + 1
        end
        if not icon then
            local l = cc.Label:createWithSystemFont(M.bubble_names[b.bid] or b.name, 'sans-serif', 24)
            l:setPosition(0, 0)
            holder:addChild(l, 3)
        end
        map_node:addChild(holder, 20 + (5 - b.layer))
        drawn = drawn + 1
    end
    trace(string.format('CITY_BUILDINGS drawn=%d fallback_text=%d', drawn, fallback))
end

function M.attach_hud(canvas, size, trace)
    local function X(px) return px * S end
    local function YT(py) return size.height - py * S end
    local function YB(py) return (2000 - py) * S end
    local root = cc.Node:create()
    root:setName('city_hud')
    canvas:addChild(root, 8)

    local function label(text, x, y, font, rgb, z)
        local shadow = cc.Label:createWithSystemFont(text, 'sans-serif', font)
        shadow:setPosition(x + 1.5, y - 1.5)
        color(shadow, 17, 17, 17)
        root:addChild(shadow, (z or 3) - 1)
        local l = cc.Label:createWithSystemFont(text, 'sans-serif', font)
        l:setPosition(x, y)
        if rgb then color(l, rgb[1], rgb[2], rgb[3]) end
        root:addChild(l, z or 3)
        return l
    end
    local function chip(x, y, w, h, rgba)
        local b = cc.LayerColor:create({r = rgba[1], g = rgba[2], b = rgba[3], a = rgba[4] or 170}, w, h)
        b:setPosition(x - w / 2, y - h / 2)
        root:addChild(b, 2)
        return b
    end
    local function dot(x, y, text)
        chip(x, y, text and 22 or 14, text and 22 or 14, {210, 40, 40, 255})
        if text then label(text, x, y, 14, {255, 255, 255}, 6) end
    end

    -- Activity icons (top row).
    for _, a in ipairs(M.activities) do
        local x, y = X(a.x), YT(270)
        chip(x, y, 64, 64, {90, 70, 50})
        label(a.name, x, YT(308), 18, {255, 245, 215}, 4)
        if a.sub then label(a.sub, x, YT(334), 16, {110, 230, 110}, 4) end
        dot(x + 28, y + 28)
    end
    -- Right-hand banner.
    chip(X(840), YT((245 + 800) / 2), X(105), (800 - 245) * S, {50, 42, 40, 200})
    for _, item in ipairs(M.side) do
        chip(X(840), YT(item.y), 60, 60, {96, 84, 70})
        label(item.name, X(840), YT(item.y + 36), 17, {255, 245, 215}, 4)
    end
    dot(X(878), YT(275))
    -- Chopper and his speech bubble (bottom left).
    chip(X(100), YB(1790), 120, 150, {110, 80, 60})
    label('乔巴 [缺资源]', X(100), YB(1790), 14, {255, 240, 220}, 4)
    chip(X(237), YB(1685), 204, 56, {250, 244, 232, 235})
    label(M.chopper_text, X(237), YB(1685), 19, {120, 70, 20}, 4)
    -- Bottom round buttons and the quest scroll.
    for _, b in ipairs(M.bottom_buttons) do
        chip(X(b.x), YB(1790), 58, 58, {96, 64, 40, 230})
        label('入口', X(b.x), YB(1790), 15, {255, 235, 190}, 4)
        if b.count then dot(X(b.x) + 22, YB(1790) + 22, tostring(b.count)) else dot(X(b.x) + 22, YB(1790) + 22) end
    end
    chip(X(840), YB(1670), 58, 58, {96, 64, 40, 230})
    label('任务', X(840), YB(1670), 15, {255, 235, 190}, 4)
    trace('CITY_HUD activities=' .. #M.activities .. ' side=' .. #M.side)
    return root
end

return M
