local M = {}

local CSB = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/'

function M.map_background(map_id)
    return {
        far = string.format('resource/bigbg/battle_bg/%s/m_bg.jpg', map_id),
        near = string.format('resource/bigbg/battle_bg/%s/map_bg.png', map_id),
    }
end

M.pattern = 'resource/bigbg/pattern/pattern_3.png'
M.button_list = CSB .. 'battle/battle_button_list.csb'
M.plists = {
    'resource/battledrama/battledrama.plist',
    'resource/mainui/mainui.plist',
    'resource/common/common.plist',
    'resource/battle/battle.plist',
}

function M.load(trace)
    for _, plist in ipairs(M.plists) do
        local ok, err = pcall(function()
            cc.SpriteFrameCache:getInstance():addSpriteFrames(plist)
        end)
        trace(string.format('DRAMA_PLIST %s ok=%s err=%s', plist, tostring(ok), tostring(err)))
    end
    trace('DRAMA_PATTERN ' .. M.pattern)
end

return M
