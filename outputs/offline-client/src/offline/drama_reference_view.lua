-- Reference-screenshot layout for the drama screen. Coordinates come from the
-- 900x2000 reference image (design width 720 => x0.8); top group is anchored to
-- the top edge and the bottom group to the bottom edge, as in the original UI.
-- Anything whose original resource is not available locally is a labelled
-- placeholder (see drama_reference.missing); nothing here touches the save.
local M = {}
local S = 0.8

local function try_color(node, r, g, b)
    pcall(function() node:setColor({r = r, g = g, b = b}) end)
end

function M.attach(canvas, size, ref, trace, handlers)
    handlers = handlers or {}
    local function X(px) return px * S end
    local function YT(py) return size.height - py * S end
    local function YB(py) return (2000 - py) * S end
    -- `group` sits under the original button panel (z=5); `overlay` sits above the
    -- panel but below the bottom navigation (z=10), for text drawn on the panel.
    local group = cc.Node:create()
    group:setName('drama_reference_hud')
    canvas:addChild(group, 4)
    local overlay = cc.Node:create()
    overlay:setName('drama_reference_overlay')
    canvas:addChild(overlay, 6)
    local layer = group
    local placeholders = {}

    local function label(text, x, y, font, color, z, anchor)
        -- Dark offset copy stands in for the original outline so text stays
        -- readable over the forest background.
        local shadow = cc.Label:createWithSystemFont(text, 'sans-serif', font or 20)
        shadow:setPosition(x + 1.5, y - 1.5)
        if anchor then shadow:setAnchorPoint(anchor, 0.5) end
        try_color(shadow, 17, 17, 17)
        layer:addChild(shadow, (z or 3) - 1)
        local l = cc.Label:createWithSystemFont(text, 'sans-serif', font or 20)
        l:setPosition(x, y)
        if anchor then l:setAnchorPoint(anchor, 0.5) end
        if color then try_color(l, color[1], color[2], color[3]) end
        layer:addChild(l, z or 3)
        l.shadow = shadow
        return l
    end
    -- Labelled stand-in for a resource that is not in the local set.
    -- `silent` chips are too small for text; the tag is still recorded.
    local function chip(tag, x, y, w, h, z, silent)
        local box = cc.LayerColor:create({r = 18, g = 26, b = 30, a = 150}, w, h)
        box:setPosition(x - w / 2, y - h / 2)
        layer:addChild(box, z or 2)
        if not silent then
            local font = w < 90 and 12 or 16
            local l = cc.Label:createWithSystemFont(tag .. '\n[缺]', 'sans-serif', font)
            l:setPosition(x, y)
            layer:addChild(l, (z or 2) + 1)
        end
        placeholders[#placeholders + 1] = tag
        return box
    end
    local function frame(name, x, y, z)
        local fr = cc.SpriteFrameCache:getInstance():getSpriteFrame(name .. '.png')
        if not fr then return nil end
        local s = cc.Sprite:createWithSpriteFrame(fr)
        s:setPosition(x, y)
        layer:addChild(s, z or 2)
        return s
    end
    -- Item icon from resource/item/<icon>.png when it is packaged, else a labelled chip.
    local function item_icon(icon, tag, x, y, box, z)
        local path = 'resource/item/' .. tostring(icon) .. '.png'
        if cc.FileUtils:getInstance():isFileExist(path) then
            local ok, s = pcall(cc.Sprite.create, cc.Sprite, path)
            if ok and s then
                local cs = s:getContentSize()
                s:setScale(box / math.max(cs.width, cs.height))
                s:setPosition(x, y)
                layer:addChild(s, z or 3)
                return s
            end
        end
        return chip(tag, x, y, box, box, z or 2)
    end
    -- Mirrors BattleDramaTopView:createSpecialIcon(): round bg + icon + caption.
    local function special_icon(icon_frame, caption, x, y, red_dot)
        if not frame('battledrama_1020', x, y, 2) then chip('图标底', x, y, 70, 70, 2) end
        if not frame(icon_frame, x, y, 3) then chip(icon_frame, x, y, 40, 40, 3) end
        label(caption, x, y - 46, 20, {255, 240, 200}, 4)
        if red_dot then
            local dot = cc.LayerColor:create({r = 220, g = 40, b = 40, a = 255}, 12, 12)
            dot:setPosition(x + 22, y + 22)
            layer:addChild(dot, 5)
        end
    end

    -- Left: online-gift (diamond 5000 / 可领取).
    item_icon(ref.gift.item_id, '钻石礼包', X(100), YT(330), 76, 2)
    label(tostring(ref.gift.amount), X(100), YT(344), 18, {255, 255, 255}, 4)
    label(ref.gift.text, X(100), YT(392), 18, {120, 230, 90}, 4)

    -- Top-right icon row.
    local world = label('世', X(415), YT(270), 30, {255, 230, 160}, 4)
    if not frame('battledrama_1020', X(415), YT(270), 2) then chip('图标底', X(415), YT(270), 56, 56, 2) end
    special_icon('battledrama_1018', '通关奖励', X(535), YT(275), false)
    special_icon('battledrama_1016', '日常任务', X(652), YT(272), true)

    -- Mini map: ring/flag exist locally, the map picture itself does not.
    chip('小地图', X(808), YT(290), 104, 104, 1)
    frame('battledrama_1001', X(808), YT(290), 3)
    frame('battledrama_1013', X(808), YT(285), 4)
    label(ref.stage.name, X(810), YT(373), 22, {255, 245, 220}, 4)

    -- Voyage (远航) node: its CSB is not available locally.
    chip('远航节点', X(810), YT(455), 76, 76, 2, true)
    label(ref.voyage.name, X(810), YT(458), 20, {255, 245, 220}, 4)
    label(tostring(ref.voyage.value), X(810), YT(516), 20, {255, 255, 255}, 4)

    -- Income per minute list + 挂机UP + chest/timer.
    -- Anchored to the bottom like the original: spacing is measured from the panel top.
    for i, row in ipairs(ref.income) do
        local y = YB(1045 + (i - 1) * 50)
        chip('物品' .. row.item_id, X(735), y, 26, 26, 2, true)
        label(row.text, X(815), y, 24, {255, 255, 255}, 4)
    end
    chip(ref.hook_up, X(795), YB(1258), 150, 44, 2)
    chip('宝箱 effect282', X(830), YB(1335), 110, 80, 2)
    -- The timer overlaps the panel's top edge in the original, so draw it above the panel.
    layer = overlay
    label(ref.chest_time, X(820), YB(1390), 20, {255, 255, 255}, 4)
    layer = group

    -- Bottom panel overlays (CSB provides frame, WANTED board and buttons).
    layer = overlay
    label(ref.desc, X(50), YB(1520), 22, {120, 80, 40}, 6, 0)
    chip('BOSS 悬赏人像', X(660), YB(1640), 264, 310, 6)
    for i, item in ipairs(ref.rewards) do
        local x = X(125 + (i - 1) * 86)
        item_icon(item.icon, item.name, x, YB(1765), 60, 6)
        label('×' .. item.count, x + 22, YB(1765) - 24, 16, {255, 255, 255}, 8)
    end

    if handlers.on_missing then handlers.on_missing(placeholders) end
    trace('DRAMA_REFERENCE_HUD placeholders=' .. #placeholders .. ' stage=' .. ref.stage.name)
    return {group = group, placeholders = placeholders, world_button = world}
end

return M
