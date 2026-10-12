local M = {}
M.spine = 'v9o8qm1Y40cbOAlh6LDp0kMDi5CzXlsO/H30104/'
M.csb = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/battle/battle_boss_hp_progress.csb'
M.font = 'fonts/mini.ttf'
M.background = 'resource/bigbg/battle_bg/10032/b_bg.jpg'
M.csb_dir = 'SI4YKjtXKGfkpPZhfeZcJEE6b4gGZbox/'
-- Stage 2 panels; paths follow PathTool.getTargetCSB().
M.stage2 = {
    maincity = M.csb_dir .. 'mainui/mainui_view.csb',
    setname = M.csb_dir .. 'roleinfo/role_setname_view.csb',
    recruit = M.csb_dir .. 'recruithero/recruit_hero_window.csb',
    formation = M.csb_dir .. 'hero/formation_select_panel.csb',
}
function M.check()
    local missing = {}
    local files = cc.FileUtils:getInstance()
    for _, path in ipairs(require('offline.asset_paths')) do
        if not files:isFileExist(path) then missing[#missing + 1] = path end
    end
    return missing
end
function M.skeleton(action)
    assert(action == 'stand2' or action == 'action1' or action == 'action2' or action == 'action9' or action == 'hurt' or action == 'run')
    local path = M.spine .. action
    return assert(sp.SkeletonAnimation:createBinary(path .. '.skel', path .. '.atlas', 1, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444 or 8), 'Spine create failed')
end
function M.character(action)
    local node=M.skeleton(action)
    node:setAnimation(0, action, true)
    return node
end
function M.panel()
    return assert(cc.CSLoader:createNode(M.csb), 'CSB create failed')
end
function M.node(csb_path)
    return assert(cc.CSLoader:createNode(csb_path), 'CSB create failed: ' .. tostring(csb_path))
end
return M
