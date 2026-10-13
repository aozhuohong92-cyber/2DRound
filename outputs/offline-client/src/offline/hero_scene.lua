-- Hero window, library (图鉴) tab, laid out from the reference screenshot
-- (900x2000 reference, design width 720 => x0.8; top group anchored to the top
-- edge, bottom group to the bottom edge). Original art for this window is not in
-- the local resource set, so cards, tabs and frames are labelled placeholders;
-- owned heroes are drawn bright, unowned ones grey (as in the original).
local Lib = require('offline.hero_library')
local M = {}
local S = 0.8

local STAR_BORDER = {
    [1] = {230, 190, 40}, [2] = {80, 170, 70}, [3] = {70, 130, 220},
    [4] = {150, 90, 210}, [5] = {230, 120, 40}, [6] = {210, 50, 50},
}

local function color(node, r, g, b)
    pcall(function() node:setColor({r = r, g = g, b = b}) end)
end

function M.attach(canvas, size, trace, options)
    options = options or {}
    local function X(px) return px * S end
    local function YT(py) return size.height - py * S end
    local function YB(py) return (2000 - py) * S end

    local root = cc.Node:create()
    root:setName('hero_scene_root')
    canvas:addChild(root, 2)

    local function label(parent, text, x, y, font, rgb, z)
        local l = cc.Label:createWithSystemFont(text, 'sans-serif', font or 20)
        l:setPosition(x, y)
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

    -- Background (hero_bag_bg is not local) and parchment panel.
    box(root, size.width, size.height, size.width / 2, size.height / 2, {58, 38, 30}, 0)
    label(root, '背景 hero_bag_bg [缺资源]', size.width / 2, YT(330), 18, {160, 130, 110}, 1)
    local panel_top, panel_bottom = YT(590), YB(1735)
    local panel_h = panel_top - panel_bottom
    box(root, 700, panel_h + 8, size.width / 2, (panel_top + panel_bottom) / 2, {120, 84, 50}, 1)
    box(root, 688, panel_h - 4, size.width / 2, (panel_top + panel_bottom) / 2, {232, 211, 168}, 2)

    -- Notice line (unimplemented tabs / buttons).
    local notice = label(root, '', size.width / 2, YT(480), 22, {255, 240, 200}, 30)
    local function toast(text)
        notice:stopAllActions()
        notice:setString(text)
        notice:setVisible(true)
        notice:runAction(cc.Sequence:create(cc.DelayTime:create(1.8),
            cc.CallFunc:create(function() notice:setVisible(false) end)))
        trace('HERO_NOTICE ' .. text)
    end

    label(root, '离线预览 · 图鉴（美术占位；已获得=亮，未获得=灰）', size.width / 2, size.height - 30, 18,
        {255, 255, 255}, 30)

    -- Tabs.
    local tab_x = {175, 322, 470, 618}
    local active = 'library'
    local tab_nodes = {}
    local grid -- forward
    for i, tab in ipairs(Lib.tabs) do
        local x = X(tab_x[i])
        local selected = tab.id == active
        local b = box(root, 108, 58, x, YT(552), selected and {196, 150, 90} or {110, 76, 48}, 3)
        label(root, tab.name, x, YT(552), 24, selected and {255, 255, 255} or {235, 215, 170}, 4)
        tab_nodes[tab.id] = b
        local hit = ccui.Button:create()
        hit:ignoreContentAdaptWithSize(false)
        hit:setContentSize({width = 108, height = 58})
        hit:setPosition(x, YT(552))
        hit:addClickEventListener(function()
            if tab.implemented then
                trace('HERO_TAB ' .. tab.id)
            else
                toast('「' .. tab.name .. '」页尚未还原')
            end
        end)
        root:addChild(hit, 5)
    end
    -- 布阵 button (not implemented).
    box(root, 84, 64, X(785), YT(545), {120, 90, 60}, 3)
    label(root, '布阵', X(785), YT(545), 22, {255, 240, 200}, 4)
    local formation = ccui.Button:create()
    formation:ignoreContentAdaptWithSize(false)
    formation:setContentSize({width = 84, height = 64})
    formation:setPosition(X(785), YT(545))
    formation:addClickEventListener(function() toast('「布阵」尚未还原') end)
    root:addChild(formation, 5)

    -- Owned set: save snapshot + preview sample (never written).
    local owned = Lib.merge(Lib.owned_from_snapshot(options.state_snapshot), Lib.sample_owned(Lib.default_camp))

    -- Camp selector.
    local camp = Lib.default_camp
    local camp_nodes = {}
    local camp_x = {215, 313, 410, 510, 605, 705}
    local function render_grid() end
    local function select_camp(id)
        camp = id
        for cid, n in pairs(camp_nodes) do n:setVisible(cid == camp) end
        render_grid()
        trace('HERO_LIBRARY_CAMP ' .. camp .. ' count=' .. Lib.count(camp))
    end
    for i, cid in ipairs(Lib.camps) do
        local x, y = X(camp_x[i]), YT(687)
        box(root, 58, 58, x, y, {88, 62, 40}, 3)
        label(root, tostring(cid), x, y, 22, {255, 235, 190}, 4)
        local ring = box(root, 66, 66, x, y, {255, 214, 90}, 2)
        camp_nodes[cid] = ring
        local hit = ccui.Button:create()
        hit:ignoreContentAdaptWithSize(false)
        hit:setContentSize({width = 66, height = 66})
        hit:setPosition(x, y)
        hit:addClickEventListener(function() select_camp(cid) end)
        root:addChild(hit, 5)
    end
    label(root, '阵营图标/名称未取证', size.width / 2, YT(740), 14, {140, 110, 80}, 4)

    -- Scrolling grid.
    local view_h = YT(765) - YB(1700)
    -- The bundled runtime exposes an incomplete `ccui` table (e.g. TouchEventType), so
    -- never index enum tables directly: ScrollView direction VERTICAL is 1.
    local scroll = ccui.ScrollView:create()
    scroll:setName('hero_library_scroll')
    local dirs = ccui.ScrollViewDir or ccui.ScrollView and ccui.ScrollView.Direction
    scroll:setDirection(dirs and dirs.vertical or 1)
    scroll:setContentSize({width = size.width, height = view_h})
    scroll:setPosition(0, YB(1700))
    pcall(function() scroll:setBounceEnabled(true) end)
    root:addChild(scroll, 4)

    local card_size, row_h = 116, 136
    local col_x = {203, 390, 577, 764}

    -- Art lookup order: library card art (partnercard_<bid>), then the head icon, else a
    -- text placeholder. Files are WebP/PNG payloads under their original .png names.
    -- Owned heroes are bright; unowned use the grey shader (flat grey as fallback).
    local art_stats = {card = 0, head = 0, none = 0}
    local function try_sprite(path)
        local ok, sprite = pcall(cc.Sprite.create, cc.Sprite, path)
        if ok and sprite then return sprite end
    end
    local function card_art(parent, bid, owned_flag, cx, cy)
        local sprite, kind = try_sprite('resource/bigbg/partnercard/partnercard_' .. bid .. '.png'), 'card'
        if not sprite then
            sprite, kind = try_sprite('resource/headicon/' .. bid .. '.png'), 'head'
        end
        if not sprite then
            art_stats.none = art_stats.none + 1
            return false
        end
        art_stats[kind] = art_stats[kind] + 1
        local cs = sprite:getContentSize()
        -- Library art is a portrait; the original card shows its upper part filling the
        -- square frame, so crop to the top square instead of letterboxing.
        if kind == 'card' and cs.height > cs.width then
            local ok, err = pcall(function() sprite:setTextureRect({x = 0, y = 0, width = cs.width, height = cs.width}) end)
            if ok then
                local after = sprite:getContentSize()
                if not art_stats.logged then
                    art_stats.logged = true
                    trace(string.format('HERO_ART_CROP before=%.0fx%.0f after=%.0fx%.0f', cs.width, cs.height, after.width, after.height))
                end
                cs = after
            else
                trace('HERO_ART_CROP_ERROR ' .. tostring(err))
            end
        end
        sprite:setScale((card_size - 8) / math.max(cs.width, cs.height))
        sprite:setPosition(cx, cy)
        if not owned_flag then
            local gray = pcall(function()
                sprite:setGLProgramState(cc.GLProgramState:getOrCreateWithGLProgramName('ShaderUIGrayScale'))
            end)
            if not gray then color(sprite, 110, 110, 110) end
        end
        parent:addChild(sprite, 3)
        return true
    end

    local function card(parent, entry, cx, cy)
        local hero, lit = entry.hero, entry.owned
        local border = STAR_BORDER[hero.star] or {150, 150, 150}
        if not lit then border = {border[1] * 0.45, border[2] * 0.45, border[3] * 0.45} end
        box(parent, card_size, card_size, cx, cy, {border[1], border[2], border[3]}, 1)
        box(parent, card_size - 8, card_size - 8, cx, cy, lit and {70, 56, 84} or {88, 88, 88}, 2)
        local shown = card_art(parent, hero.bid, lit, cx, cy)
        local text = lit and {255, 255, 255} or {150, 150, 150}
        if not shown then
            label(parent, hero.name, cx, cy + 6, 18, text, 4)
            label(parent, '[缺立绘]', cx, cy - 14, 12, lit and {200, 180, 150} or {120, 120, 120}, 4)
        end
        label(parent, tostring(hero.lev_limit), cx + 34, cy + 42, 20, text, 5)
        label(parent, string.rep('★', hero.star), cx, cy - 44, 14,
            lit and {255, 214, 60} or {140, 140, 140}, 5)
        label(parent, tostring(hero.camp), cx - 40, cy + 42, 14, text, 5)
    end

    render_grid = function()
        scroll:removeAllChildren()
        art_stats.card, art_stats.head, art_stats.none = 0, 0, 0
        local entries = Lib.entries(camp, owned)
        local rows = math.ceil(#entries / 4)
        local inner_h = math.max(view_h, rows * row_h + 20)
        scroll:setInnerContainerSize({width = size.width, height = inner_h})
        for i, entry in ipairs(entries) do
            local r, c = math.floor((i - 1) / 4), (i - 1) % 4
            card(scroll, entry, X(col_x[c + 1]), inner_h - (r + 0.5) * row_h - 4)
        end
        pcall(function() scroll:jumpToTop() end)
        trace(string.format('HERO_LIBRARY_GRID camp=%d heroes=%d owned=%d art_card=%d art_head=%d art_none=%d',
            camp, #entries, Lib.owned_count(entries), art_stats.card, art_stats.head, art_stats.none))
    end

    select_camp(Lib.default_camp)
    return {root = root, select_camp = select_camp, owned = owned}
end

return M
