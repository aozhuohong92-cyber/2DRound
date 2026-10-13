-- Hero window: 英雄 (owned heroes) and 图鉴 (library) tabs, laid out from the reference
-- screenshots (900x2000 reference, design width 720 => x0.8; top group anchored to the top
-- edge, bottom group to the bottom edge). Original window art (background, atlases, tab and
-- card frames, camp icons) is not in the local resource set, so those parts are labelled
-- placeholders; hero portraits come from the archived art (assets/ui/英雄).
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
    local function button(parent, w, h, x, y, fn, z)
        local b = ccui.Button:create()
        b:ignoreContentAdaptWithSize(false)
        b:setContentSize({width = w, height = h})
        b:setPosition(x, y)
        b:addClickEventListener(fn)
        parent:addChild(b, z or 5)
        return b
    end

    -- Background (hero_bag_bg is not local) and parchment panel.
    box(root, size.width, size.height, size.width / 2, size.height / 2, {58, 38, 30}, 0)
    label(root, '背景 hero_bag_bg [缺资源]', size.width / 2, YT(330), 18, {160, 130, 110}, 1)
    local panel_top, panel_bottom = YT(590), YB(1735)
    local panel_h = panel_top - panel_bottom
    box(root, 700, panel_h + 8, size.width / 2, (panel_top + panel_bottom) / 2, {120, 84, 50}, 1)
    box(root, 688, panel_h - 4, size.width / 2, (panel_top + panel_bottom) / 2, {232, 211, 168}, 2)

    local notice = label(root, '', size.width / 2, YT(480), 22, {255, 240, 200}, 30)
    local function toast(text)
        notice:stopAllActions()
        notice:setString(text)
        notice:setVisible(true)
        notice:runAction(cc.Sequence:create(cc.DelayTime:create(1.8),
            cc.CallFunc:create(function() notice:setVisible(false) end)))
        trace('HERO_NOTICE ' .. text)
    end
    label(root, '离线预览 · 英雄/图鉴（美术占位；亮=已获得，灰=未获得）', size.width / 2, size.height - 30, 18,
        {255, 255, 255}, 30)

    -- Owned set for the library and roster for the list: save + preview sample (never written).
    local snapshot = options.state_snapshot
    local lit_set = Lib.merge(Lib.owned_from_snapshot(snapshot), Lib.sample_owned(Lib.default_camp))
    local roster_sample = Lib.sample_roster()

    -- Content swapped per tab.
    local content = cc.Node:create()
    content:setName('hero_scene_content')
    root:addChild(content, 4)

    local card_size, row_h = 116, 136
    local col_x = {203, 390, 577, 764}

    local art_stats = {card = 0, head = 0, none = 0}
    local function try_sprite(path)
        local ok, sprite = pcall(cc.Sprite.create, cc.Sprite, path)
        if ok and sprite then return sprite end
    end
    -- Portrait lookup: library card (partnercard_<bid>) -> head icon -> text placeholder.
    local function card_art(parent, bid, lit, cx, cy)
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
        -- Portraits are tall; the original card shows the upper part filling the square.
        -- NOTE: this runtime has no cc.rect, rects are plain tables.
        if kind == 'card' and cs.height > cs.width then
            local ok = pcall(function()
                sprite:setTextureRect({x = 0, y = 0, width = cs.width, height = cs.width})
            end)
            if ok then cs = sprite:getContentSize() end
        end
        sprite:setScale((card_size - 8) / math.max(cs.width, cs.height))
        sprite:setPosition(cx, cy)
        if not lit then
            local gray = pcall(function()
                sprite:setGLProgramState(cc.GLProgramState:getOrCreateWithGLProgramName('ShaderUIGrayScale'))
            end)
            if not gray then color(sprite, 110, 110, 110) end
        end
        parent:addChild(sprite, 3)
        return true
    end

    -- spec: {hero=, lit=bool, number=text at top right, badge=optional bottom-right text}
    local function card(parent, spec, cx, cy)
        local hero, lit = spec.hero, spec.lit
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
        label(parent, tostring(spec.number), cx + 34, cy + 42, 20, text, 5)
        label(parent, string.rep('★', hero.star), cx, cy - 44, 14, lit and {255, 214, 60} or {140, 140, 140}, 5)
        label(parent, tostring(hero.camp), cx - 40, cy + 42, 14, text, 5)
        if spec.badge then
            box(parent, 30, 30, cx + 38, cy - 38, {190, 40, 40}, 6)
            label(parent, spec.badge, cx + 38, cy - 38, 18, {255, 255, 255}, 7)
        end
    end

    -- Scrolling 4-column grid inside `parent`; returns render(specs).
    local function make_grid(parent, bottom_py)
        local view_h = YT(765) - YB(bottom_py)
        local scroll = ccui.ScrollView:create()
        scroll:setName('hero_scroll')
        -- This runtime's `ccui` enums are incomplete; VERTICAL is 1.
        local dirs = ccui.ScrollViewDir or ccui.ScrollView and ccui.ScrollView.Direction
        scroll:setDirection(dirs and dirs.vertical or 1)
        scroll:setContentSize({width = size.width, height = view_h})
        scroll:setPosition(0, YB(bottom_py))
        pcall(function() scroll:setBounceEnabled(true) end)
        parent:addChild(scroll, 4)
        return function(specs)
            scroll:removeAllChildren()
            local rows = math.ceil(#specs / 4)
            local inner_h = math.max(view_h, rows * row_h + 20)
            scroll:setInnerContainerSize({width = size.width, height = inner_h})
            for i, spec in ipairs(specs) do
                local r, c = math.floor((i - 1) / 4), (i - 1) % 4
                card(scroll, spec, X(col_x[c + 1]), inner_h - (r + 0.5) * row_h - 4)
            end
            pcall(function() scroll:jumpToTop() end)
        end
    end

    -- Round-ish filter buttons; `entries` = {{id=, text=}}, returns select(id).
    local function make_filter(parent, entries, xs, on_select)
        local rings = {}
        local function select(id)
            for eid, ring in pairs(rings) do ring:setVisible(eid == id) end
            on_select(id)
        end
        for i, entry in ipairs(entries) do
            local x, y = X(xs[i]), YT(687)
            box(parent, 58, 58, x, y, {88, 62, 40}, 3)
            label(parent, entry.text, x, y, 22, {255, 235, 190}, 4)
            rings[entry.id] = box(parent, 66, 66, x, y, {255, 214, 90}, 2)
            button(parent, 66, 66, x, y, function() select(entry.id) end)
        end
        label(parent, '阵营图标/名称未取证', size.width / 2, YT(740), 14, {140, 110, 80}, 4)
        return select
    end

    local function reset_stats() art_stats.card, art_stats.head, art_stats.none = 0, 0, 0 end
    local function stats_text()
        return string.format('art_card=%d art_head=%d art_none=%d', art_stats.card, art_stats.head, art_stats.none)
    end

    local builders = {}

    builders.library = function(parent)
        local camp = Lib.default_camp
        local render = make_grid(parent, 1700)
        local entries = {}
        for _, cid in ipairs(Lib.camps) do entries[#entries + 1] = {id = cid, text = tostring(cid)} end
        local select = make_filter(parent, entries, {215, 313, 410, 510, 605, 705}, function(id)
            camp = id
            reset_stats()
            local specs, owned = {}, 0
            for _, e in ipairs(Lib.entries(camp, lit_set)) do
                specs[#specs + 1] = {hero = e.hero, lit = e.owned, number = e.hero.lev_limit}
                if e.owned then owned = owned + 1 end
            end
            render(specs)
            trace(string.format('HERO_LIBRARY_GRID camp=%d heroes=%d owned=%d %s', camp, #specs, owned, stats_text()))
        end)
        select(Lib.default_camp)
    end

    builders.hero = function(parent)
        local render = make_grid(parent, 1610)
        local counter = label(parent, '', X(195), YB(1645), 24, {255, 255, 255}, 6)
        box(parent, 120, 44, X(195), YB(1645), {95, 70, 50}, 5)
        box(parent, 40, 40, X(195) + 80, YB(1645), {200, 150, 60}, 5)
        label(parent, '+', X(195) + 80, YB(1645), 28, {255, 255, 255}, 7)
        button(parent, 40, 40, X(195) + 80, YB(1645), function() toast('「扩充英雄位」尚未还原') end, 8)
        local entries = {{id = 0, text = '全'}}
        for _, cid in ipairs(Lib.camps) do entries[#entries + 1] = {id = cid, text = tostring(cid)} end
        local total = #Lib.roster(snapshot, 0, roster_sample)
        counter:setString(Lib.capacity_text(total))
        local select = make_filter(parent, entries, {168, 265, 363, 460, 557, 654, 752}, function(id)
            reset_stats()
            local specs = {}
            for _, e in ipairs(Lib.roster(snapshot, id, roster_sample)) do
                specs[#specs + 1] = {hero = e.hero, lit = true, number = e.level, badge = e.in_team and '战' or nil}
            end
            render(specs)
            trace(string.format('HERO_LIST_GRID camp=%d heroes=%d total=%d %s', id, #specs, total, stats_text()))
        end)
        select(0)
    end

    -- Tabs.
    local tab_x = {175, 322, 470, 618}
    local active
    local tab_normal, tab_selected = {}, {}
    local function show_tab(id)
        active = id
        for tid, b in pairs(tab_selected) do b:setVisible(tid == id) end
        for tid, b in pairs(tab_normal) do b:setVisible(tid ~= id) end
        content:removeAllChildren()
        local ok, err = xpcall(function() builders[id](content) end, debug.traceback)
        if not ok then
            trace('HERO_TAB_ERROR ' .. id .. ' ' .. tostring(err))
            label(content, '页面加载失败：' .. tostring(err):match('^[^\n]*'), size.width / 2, size.height * 0.5, 18)
        end
        trace('HERO_TAB ' .. id .. ' ok=' .. tostring(ok))
    end
    for i, tab in ipairs(Lib.tabs) do
        local x = X(tab_x[i])
        tab_normal[tab.id] = box(root, 108, 58, x, YT(552), {110, 76, 48}, 3)
        tab_selected[tab.id] = box(root, 108, 58, x, YT(552), {196, 150, 90}, 3)
        label(root, tab.name, x, YT(552), 24, {255, 245, 220}, 4)
        button(root, 108, 58, x, YT(552), function()
            if not tab.implemented then
                toast('「' .. tab.name .. '」页尚未还原')
            elseif tab.id ~= active then
                show_tab(tab.id)
            end
        end)
    end
    -- 布阵 button (not implemented).
    box(root, 84, 64, X(785), YT(545), {120, 90, 60}, 3)
    label(root, '布阵', X(785), YT(545), 22, {255, 240, 200}, 4)
    button(root, 84, 64, X(785), YT(545), function() toast('「布阵」尚未还原') end)

    -- The original opens on the hero list; options.tab can start on the library.
    show_tab(options.tab or 'hero')
    return {root = root, show_tab = show_tab}
end

return M
