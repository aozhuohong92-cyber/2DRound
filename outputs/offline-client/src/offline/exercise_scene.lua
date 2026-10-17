-- 历练 (海贼试炼) window laid out from the reference screenshot (900x2000, design width 720
-- => x0.8). Original art (window CSB, bigbg_63, banner pictures, item icons) is not in the
-- local resource set, so those parts are labelled placeholders; texts, unlock state and
-- reward lists come from the recovered config. Entering an activity is not implemented.
local Exercise = require('offline.exercise')
local M = {}
local S = 0.8

local TINT = {{46, 74, 64}, {64, 44, 84}, {40, 72, 92}, {84, 56, 40}}

local function color(node, r, g, b)
    pcall(function() node:setColor({r = r, g = g, b = b}) end)
end

function M.attach(canvas, size, trace, options)
    options = options or {}
    local function X(px) return px * S end
    local function YT(py) return size.height - py * S end
    local function YB(py) return (2000 - py) * S end

    local root = cc.Node:create()
    root:setName('exercise_scene_root')
    canvas:addChild(root, 2)

    local function label(parent, text, x, y, font, rgb, z, anchor)
        local l = cc.Label:createWithSystemFont(text, 'sans-serif', font or 20)
        l:setPosition(x, y)
        if anchor then l:setAnchorPoint(anchor, 0.5) end
        if rgb then color(l, rgb[1], rgb[2], rgb[3]) end
        parent:addChild(l, z or 3)
        return l
    end
    local function box(parent, w, h, x, y, rgba, z)
        local b = cc.LayerColor:create({r = rgba[1], g = rgba[2], b = rgba[3], a = rgba[4] or 255}, w, h)
        b:setPosition(x - w / 2, y - h / 2)
        parent:addChild(b, z or 1)
        return b
    end

    -- Background (bigbg_63 is not local) and the window title plate.
    box(root, size.width, size.height, size.width / 2, size.height / 2, {72, 52, 40}, 0)
    label(root, '背景 bigbg_63 [缺资源]', size.width / 2, YT(330), 18, {170, 140, 110}, 1)
    box(root, 340, 56, X(440), YT(465), {60, 48, 52}, 2)
    label(root, Exercise.title, X(440), YT(465), 30, {255, 255, 255}, 3)

    local notice = label(root, '', size.width / 2, YT(520), 22, {255, 240, 200}, 30)
    local function toast(text)
        notice:stopAllActions()
        notice:setString(text)
        notice:setVisible(true)
        notice:runAction(cc.Sequence:create(cc.DelayTime:create(1.8),
            cc.CallFunc:create(function() notice:setVisible(false) end)))
        trace('EXERCISE_NOTICE ' .. text)
    end
    label(root, '离线预览 · 历练（美术占位；文案与奖励来自配置）', size.width / 2, size.height - 30, 18,
        {255, 255, 255}, 30)

    -- Unlock check uses the level shown in the top bar (reference value) so the page
    -- agrees with it; a fresh offline save is level 1.
    local level = require('offline.drama_reference').top.level
    local activities = Exercise.activities(level)

    local card_w, card_h, gap = X(790), X(340), X(55)
    local view_top, view_bottom = YT(535), YB(1790)
    local view_h = view_top - view_bottom
    local scroll = ccui.ScrollView:create()
    scroll:setName('exercise_scroll')
    local dirs = ccui.ScrollViewDir or ccui.ScrollView and ccui.ScrollView.Direction
    scroll:setDirection(dirs and dirs.vertical or 1)   -- VERTICAL is 1; the enum table is incomplete here
    scroll:setContentSize({width = size.width, height = view_h})
    scroll:setPosition(0, view_bottom)
    pcall(function() scroll:setBounceEnabled(true) end)
    root:addChild(scroll, 4)

    local inner_h = math.max(view_h, #activities * (card_h + gap) + gap)
    scroll:setInnerContainerSize({width = size.width, height = inner_h})
    local missing = 0
    for i, act in ipairs(activities) do
        local cx = size.width / 2
        local cy = inner_h - gap - (i - 1) * (card_h + gap) - card_h / 2
        local tint = TINT[(i - 1) % #TINT + 1]
        box(scroll, card_w + 8, card_h + 8, cx, cy, {176, 124, 52}, 1)       -- gold frame
        box(scroll, card_w, card_h, cx, cy, {tint[1], tint[2], tint[3]}, 2)  -- banner picture
        label(scroll, act.name, cx + card_w * 0.18, cy + card_h * 0.2, 40, {255, 232, 170}, 4)
        label(scroll, '横幅图 ' .. act.pic .. ' [缺资源]', cx + card_w * 0.18, cy + card_h * 0.2 - 36, 14,
            {190, 180, 160}, 4)
        label(scroll, act.desc, cx - card_w / 2 + 24, cy - card_h * 0.03, 20, {255, 255, 255}, 4, 0)
        for r, reward in ipairs(act.rewards) do
            local rx = cx - card_w / 2 + 24 + 36 + (r - 1) * 86
            local ry = cy - card_h * 0.3
            box(scroll, 64, 64, rx, ry, {98, 84, 130}, 3)
            label(scroll, reward.name, rx, ry, 13, {255, 255, 255}, 5)
            missing = missing + 1
        end
        box(scroll, 14, 14, cx + card_w / 2 - 6, cy + card_h / 2 - 6, {210, 40, 40}, 6)  -- red dot
        if not act.open then
            box(scroll, card_w, card_h, cx, cy, {0, 0, 0, 150}, 7)
            label(scroll, act.lock_desc, cx, cy, 26, {255, 255, 255}, 8)
        end
        local hit = ccui.Button:create()
        hit:ignoreContentAdaptWithSize(false)
        hit:setContentSize({width = card_w, height = card_h})
        hit:setPosition(cx, cy)
        hit:addClickEventListener(function()
            if act.open then
                toast('「' .. act.name .. '」玩法尚未还原')
            else
                toast(act.lock_desc)
            end
        end)
        scroll:addChild(hit, 9)
    end
    pcall(function() scroll:jumpToTop() end)
    trace(string.format('EXERCISE_LIST activities=%d level=%d reward_placeholders=%d',
        #activities, level, missing))
    return {root = root}
end

return M
