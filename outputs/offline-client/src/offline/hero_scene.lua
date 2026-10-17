-- Hero window: 英雄 (owned heroes) and 图鉴 (library) tabs, laid out from the reference
-- screenshots (900x2000 reference, design width 720 => x0.8; top group anchored to the top
-- edge, bottom group to the bottom edge). Original window art (background, atlases, tab and
-- card frames, camp icons) is not in the local resource set, so those parts are labelled
-- placeholders; hero portraits come from the archived art (assets/ui/英雄).
local Lib = require('offline.hero_library')
local Detail = require('offline.hero_detail')
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
        -- Top-left camp emblem: the original shows a camp icon; the icons are not in the
        -- local resource set and the camp names are not recovered, so nothing is drawn yet.
        if spec.tap then button(parent, card_size, card_size, cx, cy, spec.tap, 9) end
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
        label(parent, '阵营图标缺资源（名称取自信念配置）', size.width / 2, YT(740), 14, {140, 110, 80}, 4)
        return select
    end

    local function reset_stats() art_stats.card, art_stats.head, art_stats.none = 0, 0, 0 end
    local function stats_text()
        return string.format('art_card=%d art_head=%d art_none=%d', art_stats.card, art_stats.head, art_stats.none)
    end

    local builders = {}
    local shared = {library_camp = Lib.default_camp}

    builders.library = function(parent)
        local camp = Lib.default_camp
        local render = make_grid(parent, 1700)
        local entries = {}
        for _, cid in ipairs(Lib.camps) do entries[#entries + 1] = {id = cid, text = Lib.camp_short(cid)} end
        local select = make_filter(parent, entries, {215, 313, 410, 510, 605, 705}, function(id)
            camp = id
            shared.library_camp = id
            reset_stats()
            local specs, owned = {}, 0
            for _, e in ipairs(Lib.entries(camp, lit_set)) do
                local bid = e.hero.bid
                specs[#specs + 1] = {hero = e.hero, lit = e.owned, number = e.hero.lev_limit,
                                     tap = function() shared.show_detail(bid) end}
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
        for _, cid in ipairs(Lib.camps) do entries[#entries + 1] = {id = cid, text = Lib.camp_short(cid)} end
        local total = #Lib.roster(snapshot, 0, roster_sample)
        counter:setString(Lib.capacity_text(total))
        local select = make_filter(parent, entries, {168, 265, 363, 460, 557, 654, 752}, function(id)
            reset_stats()
            local specs = {}
            for _, e in ipairs(Lib.roster(snapshot, id, roster_sample)) do
                specs[#specs + 1] = {hero = e.hero, lit = true, number = e.level, badge = e.in_team and '战' or nil,
                                     tap = function() toast('「' .. e.hero.name .. '」英雄详情尚未还原（图鉴页可查看资料）') end}
            end
            render(specs)
            trace(string.format('HERO_LIST_GRID camp=%d heroes=%d total=%d %s', id, #specs, total, stats_text()))
        end)
        select(0)
    end

    -- One centered line of "<div fontcolor=#rrggbb>" runs, drawn as adjacent labels.
    local function rich_line(parent, text, cx, y, font, base_rgb)
        local labels, total = {}, 0
        for _, seg in ipairs(Lib.segments(text)) do
            local l = cc.Label:createWithSystemFont(seg.text, 'sans-serif', font)
            local rgb = base_rgb
            if seg.color then
                rgb = {tonumber(seg.color:sub(1, 2), 16) or 0, tonumber(seg.color:sub(3, 4), 16) or 0,
                       tonumber(seg.color:sub(5, 6), 16) or 0}
            end
            color(l, rgb[1], rgb[2], rgb[3])
            local w = l:getContentSize().width
            labels[#labels + 1] = {node = l, width = w}
            total = total + w
            parent:addChild(l, 5)
        end
        local x = cx - total / 2
        for _, item in ipairs(labels) do
            item.node:setPosition(x + item.width / 2, y)
            x = x + item.width
        end
    end

    builders.ghost = function(parent)
        -- Use the level shown in the top bar (reference value) so the page agrees with it;
        -- a fresh offline save is level 1 and would lock every slot.
        local level = require('offline.drama_reference').top.level
        -- Sub tabs: 培养 (implemented as a static page), 觉醒 / 召唤 not restored.
        for i, name in ipairs({'培养', '觉醒', '召唤'}) do
            local x = X(200 + (i - 1) * 160)
            box(parent, 112, 44, x, YT(680), i == 1 and {196, 150, 90} or {150, 120, 80}, 3)
            label(parent, name, x, YT(680), 22, {255, 245, 220}, 4)
            button(parent, 112, 44, x, YT(680), function()
                if i ~= 1 then toast('「幽灵·' .. name .. '」尚未还原') end
            end)
        end
        label(parent, '幽灵图鉴 >>', X(775), YT(685), 20, {40, 90, 190}, 4)
        button(parent, 140, 40, X(775), YT(685), function() toast('「幽灵图鉴」尚未还原') end)

        local top, bottom = YT(712), YB(1680)
        local height = top - bottom
        box(parent, 620, height, size.width / 2, (top + bottom) / 2, {112, 88, 52}, 3)
        label(parent, '幽地背景 [缺资源]', size.width / 2, top - 18, 14, {190, 160, 110}, 4)
        local function py(ref) return top - (ref - 712) / (1680 - 712) * height end
        local rows = {880, 1190, 1490}
        local cols = {295, 634}
        for i, slot in ipairs(Lib.ghost_slots(level)) do
            local r, c = math.floor((i - 1) / 2) + 1, (i - 1) % 2 + 1
            local cx, cy = X(cols[c]), py(rows[r])
            -- base plate + tombstone placeholder
            box(parent, 150, 34, cx, cy - 42, {206, 196, 170}, 4)
            label(parent, slot.name, cx, cy - 42, 20, {70, 50, 40}, 5)
            box(parent, 64, 80, cx, cy + 14, slot.open and {150, 150, 150} or {110, 110, 110}, 4)
            if slot.open then
                label(parent, '可放入', cx, cy + 74, 18, {255, 245, 215}, 5)
                label(parent, '+', cx, cy + 14, 56, {70, 200, 70}, 6)
                box(parent, 12, 12, cx + 36, cy + 50, {210, 40, 40}, 6)
            else
                label(parent, '锁', cx, cy + 22, 22, {235, 235, 235}, 6)
                if slot.lock ~= '' then label(parent, slot.lock, cx, cy - 6, 17, {255, 250, 235}, 6) end
            end
        end
        box(parent, 58, 58, X(805), py(790), {70, 70, 70}, 4)
        label(parent, '幽灵特权', X(805), py(790) - 42, 18, {255, 245, 215}, 5)
        button(parent, 80, 90, X(805), py(790) - 14, function() toast('「幽灵特权」尚未还原') end, 6)
        trace('HERO_GHOST_SLOTS level=' .. tostring(level))
    end

    builders.belief = function(parent)
        local beliefs = Lib.beliefs()
        -- Unlock progress counts only heroes in the save; the preview sample used to fill the
        -- hero list must not look like real progress.
        local owned_heroes = {}
        for _, e in ipairs(Lib.roster(snapshot, 0)) do owned_heroes[#owned_heroes + 1] = e.hero end
        local current = 1
        local dynamic = cc.Node:create()
        parent:addChild(dynamic, 4)
        local select
        local function render()
            dynamic:removeAllChildren()
            local b = beliefs[current]
            local have, need = Lib.belief_progress(b, owned_heroes)
            -- Emblem placeholder (chained lock art is not available).
            box(dynamic, 250, 250, size.width / 2, YT(930), {205, 195, 170}, 3)
            label(dynamic, '信念徽记 [缺资源]\n（未解锁）', size.width / 2, YT(930), 18, {120, 100, 80}, 4)
            box(dynamic, 220, 40, size.width / 2, YT(1070), {128, 112, 100}, 4)
            label(dynamic, b.name, size.width / 2, YT(1070), 22, {255, 255, 255}, 5)
            box(dynamic, 86, 36, X(180), YB(1260), {222, 178, 110}, 3)
            label(dynamic, '解锁', X(180), YB(1260), 20, {120, 80, 40}, 4)
            local desc_y = YB(1345)
            box(dynamic, 640, 60, size.width / 2, desc_y, {226, 200, 160}, 3)
            label(dynamic, b.desc, X(115), desc_y + 6, 20, {60, 60, 60}, 4):setAnchorPoint(0, 0.5)
            local lock_y = YB(1462)
            box(dynamic, 640, 40, size.width / 2, lock_y, {226, 200, 160}, 3)
            rich_line(dynamic, b.lock_desc, size.width / 2, lock_y, 20, {30, 50, 90})
            local card_y = YB(1590)
            box(dynamic, 66, 66, X(250), card_y, {88, 80, 110}, 3)
            label(dynamic, '?', X(250), card_y + 4, 36, {235, 235, 235}, 4)
            label(dynamic, string.rep('★', b.need_star), X(250), card_y - 26, 12, {255, 214, 60}, 5)
            label(dynamic, string.format('%d/%d', have, need), X(250) + 18, card_y + 26, 16, {255, 255, 255}, 5)
            box(dynamic, 170, 56, X(672), card_y, {214, 178, 96}, 3)
            label(dynamic, '解锁', X(672), card_y, 24, {110, 70, 30}, 4)
            button(dynamic, 170, 56, X(672), card_y, function()
                toast(have >= need and '「信念解锁」尚未还原' or '材料不足：需要' .. b.need_star .. '星' .. b.camp_name .. '英雄')
            end, 6)
            trace(string.format('HERO_BELIEF %d %s have=%d/%d', b.id, b.name, have, need))
        end
        local entries = {}
        for i, b in ipairs(beliefs) do entries[#entries + 1] = {id = i, text = Lib.camp_short(b.hero_camp)} end
        select = make_filter(parent, entries, {215, 313, 410, 510, 605, 705}, function(id)
            current = id
            render()
        end)
        -- Arrows switch camps; the ? button shows the first line of the rules.
        local function step(delta)
            select(((current - 1 + delta) % #beliefs) + 1)
        end
        label(parent, '<<', X(125), YT(930), 36, {200, 170, 120}, 5)
        button(parent, 70, 120, X(125), YT(930), function() step(-1) end, 6)
        label(parent, '>>', X(828), YT(930), 36, {200, 170, 120}, 5)
        button(parent, 70, 120, X(828), YT(930), function() step(1) end, 6)
        box(parent, 46, 46, X(827), YT(782), {70, 55, 45}, 4)
        label(parent, '?', X(827), YT(782), 28, {255, 255, 255}, 5)
        button(parent, 56, 56, X(827), YT(782), function()
            toast((Lib.belief_rule():match('^[^\n]*')) or '')
        end, 6)
        select(1)
    end

    -- Single-hero panel (pokedex mode) laid out from the reference screenshot.
    local detail_layer
    local function hide_detail()
        if detail_layer then detail_layer:removeFromParent(); detail_layer = nil end
    end
    local function show_detail(bid)
        hide_detail()
        local info = Detail.info(bid)
        if not info then toast('该英雄暂无图鉴数据'); return end
        local layer = cc.Node:create()
        layer:setName('hero_detail')
        root:addChild(layer, 20)
        detail_layer = layer
        local cx = size.width / 2
        box(layer, size.width, size.height, cx, size.height / 2, {38, 46, 58}, 0)
        label(layer, '背景 [缺资源]', cx, YT(300), 16, {120, 130, 150}, 1)
        -- Name plate with the star under it.
        box(layer, 130, 130, X(455), YT(395), {120, 70, 50}, 2)
        box(layer, 340, 52, X(455), YT(395), {64, 36, 30}, 3)
        label(layer, info.name, X(455), YT(395), 28, {255, 255, 255}, 4)
        label(layer, string.rep('★', info.star), X(455), YT(458), 20, {255, 214, 60}, 4)
        local function round(x, y, text, tap)
            box(layer, 52, 52, x, y, {110, 90, 70}, 3)
            label(layer, text, x, y, 16, {255, 255, 255}, 4)
            button(layer, 52, 52, x, y, tap, 6)
        end
        round(X(210), YT(505), '外观', function() toast('「外观」尚未还原') end)
        round(X(690), YT(508), '语音', function() toast('「语音」尚未还原') end)
        label(layer, '战斗力', X(395), YT(525), 24, {255, 190, 90}, 4)
        label(layer, tostring(info.power), X(520), YT(525), 26, {255, 255, 255}, 4)
        -- Hero figure: rendered panel portrait (resource/heroportrait/<bid>.png, 600x800 canvas
        -- with the character's feet near the bottom). Falls back to a head icon on a
        -- placeholder when the portrait is missing.
        local figure = try_sprite('resource/heroportrait/' .. bid .. '.png')
        if figure then
            local cs = figure:getContentSize()
            figure:setAnchorPoint(0.5, 0)
            -- Feet sit just above the info panel (bottom group); the figure scales down on
            -- shorter screens so it never reaches the power line.
            local feet = YB(1275)
            figure:setScale(math.min(0.5, (YT(560) - feet) / cs.height))
            figure:setPosition(X(450), feet)
            layer:addChild(figure, 3)
        else
            box(layer, 230, 330, X(455), YT(950), {70, 80, 98, 200}, 2)
            local head = try_sprite('resource/headicon/' .. bid .. '.png')
            if head then
                local cs = head:getContentSize()
                head:setScale(170 / math.max(cs.width, cs.height))
                head:setPosition(X(455), YT(900))
                layer:addChild(head, 3)
            end
            label(layer, info.model .. ' 立绘/Spine [缺资源]', X(455), YT(1090), 14, {180, 190, 210}, 4)
        end
        -- Neighbour arrows (library order of the current camp).
        local list = Lib.list(shared.library_camp)
        local prev_bid, next_bid = Detail.neighbor(list, bid, -1), Detail.neighbor(list, bid, 1)
        local function arrow(x, text, target)
            if not target then return end
            label(layer, text, x, YT(1025), 44, {255, 255, 255}, 5)
            button(layer, 70, 120, x, YT(1025), function() show_detail(target) end, 7)
        end
        arrow(X(40), '<', prev_bid)
        arrow(X(860), '>', next_bid)
        -- Info panel (bottom group).
        box(layer, size.width, YB(1270) - YB(1750), cx, (YB(1270) + YB(1750)) / 2, {96, 78, 56, 235}, 2)
        local function left(text, y, font, rgb)
            return label(layer, text, X(38), y, font or 24, rgb or {235, 220, 190}, 4):setAnchorPoint(0, 0.5)
        end
        left('进阶:', YB(1320))
        label(layer, string.rep('★', info.star), X(145), YB(1320), 26, {255, 214, 60}, 4)
        left('升级:', YB(1380))
        box(layer, 196, 44, X(235), YB(1380), {120, 105, 86}, 3)
        label(layer, info.capped and '已达等级上限' or '升级', X(235), YB(1380), 22, {235, 225, 205}, 4)
        left(string.format('等级: %d/%d', info.lev, info.lev_max), YB(1443))
        label(layer, info.career_name .. info.intro, X(595), YB(1443), 24, {235, 220, 190}, 4)
        local a = info.attrs
        for i, item in ipairs({{'攻', a.atk}, {'血', a.hp}, {'防', a.def}, {'速', a.speed}}) do
            local x = X(({60, 280, 500, 665})[i])
            label(layer, item[1], x, YB(1510), 22, {255, 190, 90}, 4)
            label(layer, tostring(item[2]), x + 70, YB(1510), 28, {245, 235, 215}, 4)
        end
        round(X(830), YB(1507), '?', function() toast('属性为该英雄在星级等级上限时的数值') end)
        for i, skill in ipairs(info.skills) do
            local x = X(450) + (i - 1 - (#info.skills - 1) / 2) * 110
            -- Skill icon (resource/skillicon/<icon>.png); the default attack icon 20000 stands in
            -- for ids the original package lacks, then a labelled placeholder.
            local icon = try_sprite('resource/skillicon/' .. skill.icon .. '.png')
                or try_sprite('resource/skillicon/20000.png')
            if icon then
                local cs = icon:getContentSize()
                icon:setScale(88 / math.max(cs.width, cs.height))
                icon:setPosition(x, YB(1620))
                layer:addChild(icon, 3)
            else
                box(layer, 88, 88, x, YB(1620), {150, 90, 40}, 3)
                label(layer, skill.name, x, YB(1620), 16, {255, 255, 255}, 4)
            end
            box(layer, 26, 26, x - 34, YB(1620) + 34, {70, 60, 50}, 5)
            label(layer, tostring(skill.level), x - 34, YB(1620) + 34, 16, {255, 255, 255}, 6)
        end
        local back = left('返 回', YB(1690), 30, {255, 255, 255})
        button(layer, 130, 70, X(70), YB(1690), hide_detail, 8)
        trace(string.format('HERO_DETAIL %d %s power=%d atk=%d hp=%d skills=%d', bid, info.name, info.power,
            a.atk, a.hp, #info.skills))
    end
    shared.show_detail = show_detail

    -- Tabs.
    local tab_x = {175, 322, 470, 618}
    local active
    local tab_normal, tab_selected = {}, {}
    local function show_tab(id)
        hide_detail()
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
