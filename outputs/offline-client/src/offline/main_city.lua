-- Stage 2 step 1: display the original main-city CSB, plus diagnostics.
-- The CSB is only a skeleton; main_ui_view.lua builds most widgets in code, so we
-- first prove which textures/plist frames resolve on the device.
local R = require('offline.resources')
local M = {}

local function describe(node)
    local ok_t, t = pcall(tolua.type, node)
    return ok_t and t or '?'
end

function M.attach(canvas, size, trace, options)
    options = options or {}
    -- Original city_data: 1350x1280; original renderMapPic offsets and layer order.
    if options.show_map ~= false then
        local map = cc.Node:create()
        map:setName('city_map')
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
    end
    -- Reference-screenshot overlay (building bubbles, activity row, side banner, bottom buttons).
    -- Only on the city map screen; other screens hide the map and keep their own layouts.
    if options.show_map ~= false and options.hud ~= false then
        local ok, err = pcall(function() require('offline.city_hud').attach_buildings(canvas:getChildByName('city_map'), trace) end)
        if not ok then trace('CITY_BUILDINGS_ERROR ' .. tostring(err)) end
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
    if top then top:setVisible(options.hide_top ~= true) end
    if top and options.top_values then
        -- Display-only overrides (reference screenshot values); the save is untouched.
        local function find(root, name)
            if root:getName() == name then return root end
            for _, child in ipairs(root:getChildren()) do
                local hit = find(child, name)
                if hit then return hit end
            end
        end
        local v = options.top_values
        local function set(name, value)
            local n = find(top, name)
            if n and n.setString then
                n:setString(tostring(value))
                trace('TOP_VALUE ' .. name .. '=' .. tostring(value))
            else
                trace('TOP_VALUE_MISSING ' .. name)
            end
        end
        set('name_label', v.name); set('lev_label', v.level); set('fight_label', v.power)
        for i, value in ipairs(v.wealth or {}) do set('wealth_label_' .. i, value) end
        -- Activity/red-bag/prompt rows belong to the city screen, not the drama screen.
        for _, name in ipairs({'icon_container', 'icon_container_1', 'icon_container_2', 'icon_container_3',
                'icon_container_4', 'icon_container_5', 'prompt_container', 'red_bag_container',
                'red_bag_container_2', 'red_bag_container_3', 'time_collect_container',
                'vote_mergeServer_container', 'effect_container'}) do
            local n = find(top, name)
            if n then n:setVisible(false) end
        end
    end
    if options.show_map == false then
        -- City-only expand controls must not float over the drama preview.
        local city_controls = node:getChildByName('hide_container')
        if city_controls then city_controls:setVisible(false) end
    end
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
                tab:addClickEventListener(function()
                    trace('NAV_TAP ' .. index)
                    if index == 4 and options.on_drama then
                        options.on_drama()
                    elseif options.on_nav then
                        options.on_nav(index)
                    end
                end)
            end
        end
    end
    if options.show_map ~= false and options.hud ~= false then
        local ok, err = pcall(function() require('offline.city_hud').attach_hud(canvas, size, trace) end)
        if not ok then trace('CITY_HUD_ERROR ' .. tostring(err)) end
    end
    M.node = node
    M.bottom_height = bottom and bottom:getContentSize().height or 0
    M.bottom = bottom
    return node, bottom
end
return M
