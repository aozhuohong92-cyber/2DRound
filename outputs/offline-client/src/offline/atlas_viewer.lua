-- Debug scene: render every frame of the stage-2 atlases in a labelled grid so the
-- frames can be screenshotted and identified (which mainui_xxxx is which UI element).
local Frames = require('offline.atlas_frames')
local M = {}

local ATLAS_ORDER = {
    'resource/mainui/mainui.plist',
    'resource/centerscene/centerscene.plist',
    'resource/common/common.plist',
    'resource/form/form.plist',
    'resource/face/face.plist',
    'resource/recruithero/recruithero.plist',
}
local COLS, ROWS = 4, 5
local PAGE = COLS * ROWS

local function sorted_names(map)
    local names = {}
    for name in pairs(map) do names[#names + 1] = name end
    table.sort(names)
    return names
end

function M.attach(canvas, size, trace)
    local atlas_index, page = 1, 0
    local layer = cc.Node:create()
    canvas:addChild(layer, 20)
    local status = cc.Label:createWithSystemFont('', 'sans-serif', 20)
    status:setPosition(size.width / 2, size.height - 40)
    canvas:addChild(status, 30)
    local names = sorted_names(Frames[ATLAS_ORDER[atlas_index]] or {})

    local function button(title, x, y, fn)
        local b = ccui.Button:create()
        b:setTitleText(title); b:setTitleFontSize(22)
        b:ignoreContentAdaptWithSize(false); b:setContentSize({width = 150, height = 56})
        b:setPosition(x, y); b:addClickEventListener(fn); canvas:addChild(b, 31)
    end

    local function render()
        layer:removeAllChildren()
        local atlas = ATLAS_ORDER[atlas_index]
        cc.SpriteFrameCache:getInstance():addSpriteFrames(atlas)
        names = sorted_names(Frames[atlas] or {})
        local pages = math.max(1, math.ceil(#names / PAGE))
        if page >= pages then page = pages - 1 end
        local cell_w, cell_h = size.width / COLS, (size.height - 220) / ROWS
        local first = page * PAGE
        local log = {}
        for i = first + 1, math.min(#names, first + PAGE) do
            local slot = i - first - 1
            local col, row = slot % COLS, math.floor(slot / COLS)
            local name = names[i]
            local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame(name)
            local cx = cell_w * (col + 0.5)
            local cy = size.height - 120 - cell_h * (row + 0.5)
            if frame then
                local sp = cc.Sprite:createWithSpriteFrame(frame)
                local fs = frame:getOriginalSize()
                local scale = math.min((cell_w - 12) / math.max(fs.width, 1), (cell_h - 30) / math.max(fs.height, 1))
                sp:setScale(math.min(scale, 4))
                sp:setPosition(cx, cy)
                layer:addChild(sp, 1)
            end
            local lab = cc.Label:createWithSystemFont(tostring(i), 'sans-serif', 18)
            lab:setPosition(cx, cy - cell_h / 2 + 14)
            layer:addChild(lab, 2)
            log[#log + 1] = i .. ':' .. name
        end
        status:setString(atlas .. '  ' .. (page + 1) .. '/' .. pages)
        trace('ATLAS_PAGE ' .. atlas .. ' page=' .. (page + 1) .. '/' .. pages .. ' ' .. table.concat(log, ' '))
    end

    button('<图集', 90, 60, function() atlas_index = (atlas_index - 2) % #ATLAS_ORDER + 1; page = 0; render() end)
    button('图集>', size.width - 90, 60, function() atlas_index = atlas_index % #ATLAS_ORDER + 1; page = 0; render() end)
    button('<页', size.width / 2 - 90, 60, function() page = math.max(0, page - 1); render() end)
    button('页>', size.width / 2 + 90, 60, function() page = page + 1; render() end)
    render()
    trace('ATLAS_VIEWER_READY atlases=' .. #ATLAS_ORDER)
end
return M
