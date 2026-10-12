-- Stage 2 step 1: display the original main-city CSB, plus diagnostics.
-- The CSB is only a skeleton; main_ui_view.lua builds most widgets in code, so we
-- first prove which textures/plist frames resolve on the device.
local R = require('offline.resources')
local M = {}

local function describe(node)
    local ok_t, t = pcall(tolua.type, node)
    return ok_t and t or '?'
end

function M.attach(canvas, size, trace)
    -- Original city_data: 1350x1280; original renderMapPic offsets and layer order.
    local map = cc.Node:create()
    local map_scale = math.max(size.width / 720, (size.height - 70) / 1280)
    map:setScale(map_scale)
    map:setPosition(size.width / 2 - 360 * map_scale - 505 * map_scale, 0)
    canvas:addChild(map, 1)
    for i, file in ipairs({'1.png', '2.png', '3.png', '4.jpg'}) do
        local sprite = assert(cc.Sprite:create('resource/centerscene/centercity/1/' .. file))
        sprite:setAnchorPoint(0, i == 4 and 1 or 0)
        sprite:setPosition(-190 * ({0.2, 0, -0.15, -0.25})[i], ({0, 60, 502, 1280})[i])
        map:addChild(sprite, 5 - i)
        local dimensions = sprite:getContentSize()
        trace('CITY_LAYER ' .. file .. ' ' .. dimensions.width .. 'x' .. dimensions.height)
    end
    -- Explicitly preload the atlas the CSB references, and prove key frames resolve.
    for _, plist in ipairs({'resource/mainui/mainui.plist', 'resource/common/common.plist'}) do
        local ok, err = pcall(function() cc.SpriteFrameCache:getInstance():addSpriteFrames(plist) end)
        local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame('mainui_1000.png')
        trace('PLIST ' .. plist .. ' ok=' .. tostring(ok) .. ' frame_mainui_1000=' .. tostring(frame ~= nil) .. ' err=' .. tostring(err))
    end

    local node = R.node(R.stage2.maincity)
    local cs = node:getContentSize()
    trace('MAINCITY_OK ' .. math.floor(cs.width) .. 'x' .. math.floor(cs.height) .. ' children=' .. node:getChildrenCount())

    local function walk(n, depth, prefix)
        if depth > 3 then return end
        local s = n:getContentSize()
        trace(string.format('CSB_NODE %sname=%s type=%s size=%.0fx%.0f kids=%d vis=%s pos=%.0f,%.0f',
            prefix, tostring(n:getName()), describe(n), s.width, s.height,
            n:getChildrenCount(), tostring(n:isVisible()), n:getPositionX(), n:getPositionY()))
        for _, child in ipairs(n:getChildren()) do walk(child, depth + 1, prefix .. '  ') end
    end
    walk(node, 0, '')

    local scale = math.min(size.width / cs.width, size.height / cs.height)
    node:setScale(scale)
    node:setAnchorPoint(0.5, 0.5)
    node:setPosition(size.width / 2, size.height / 2)
    canvas:addChild(node, 10)
    trace('MAINCITY_PLACED scale=' .. string.format('%.3f', scale))
    -- Anchor original top/bottom containers to the visible screen edges.
    local top = node:getChildByName('top_container')
    local bottom = node:getChildByName('bottom_container')
    if top then top:setPositionY(cs.height + (size.height / scale - cs.height) / 2 - 70 / scale) end
    if bottom then
        bottom:setPositionY(-(size.height / scale - cs.height) / 2)
        local visible = {1, 2, 3, 4, 5, 6, 7}
        local unused = bottom:getChildByName('mainui_tab_4')
        if unused then
            unused:setVisible(true)
            local path = 'v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/E51130/action'
            local effect = assert(sp.SkeletonAnimation:createBinary(path .. '.skel', path .. '.atlas', 1))
            effect:setPosition(5, 10)
            effect:setScale(1.3)
            effect:setAnimation(0, 'action1', true)
            unused:getChildByName('icon'):addChild(effect)
            trace('CENTER_NAV_OK E51130 action1 scale=1.3')
        end
        for i, index in ipairs(visible) do
            local tab = bottom:getChildByName('mainui_tab_' .. index)
            if tab then
                -- Keep the original seven CSB positions, including the raised center icon.
                for _, name in ipairs({'tips_point', 'selected'}) do
                    local child = tab:getChildByName(name)
                    if child then child:setVisible(false) end
                end
                tab:addClickEventListener(function() trace('NAV_TAP ' .. index) end)
            end
        end
    end
    M.node = node
    return node
end
return M
