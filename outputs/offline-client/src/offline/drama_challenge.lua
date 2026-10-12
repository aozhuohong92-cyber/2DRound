-- Ephemeral C-stage gate. No store, rewards, battle renderer or progression writes.
local Catalog = require('offline.drama_catalog')
local Codec = require('offline.codec')
local M = {}
M.messages = {
    locked='独立预览：下一关尚未解锁', empty='队伍为空，请点左侧“调试”选择独立测试队伍',
    level='等级未达到关卡要求', unavailable='正常存档不可读取，请使用独立测试队伍',
    ready='入口检查通过；开始固定演出（不计算伤害）', busy='入口已就绪，请返回或取消准备',
    closed='预览已退出', unknown='关卡尚未接入',
}
function M.new(snapshot, options)
    local unlocked = options and options.unlocked or 10010
    local saved = snapshot and Codec.clone(snapshot)
    local session = {test_team=false, pending=nil, closed=false}
    function session:status(id)
        if self.closed then return 'closed' end
        local stage = Catalog[id]
        if not stage then return 'unknown' end
        -- Offline policy only: one preview stage unlocked, never derived from saved chapter.
        if id ~= unlocked then return 'locked' end
        if self.pending then return 'busy' end
        if not self.test_team and not saved then return 'unavailable' end
        local level = self.test_team and 1 or saved.level
        if level < stage.lev_limit then return 'level' end
        local team = self.test_team and {[1]='20510'} or saved.team
        if not next(team) then return 'empty' end
        return 'ready'
    end
    function session:request(id)
        local status = self:status(id)
        if status ~= 'ready' then return nil, status end
        self.pending = {stage_id=id, preview=true, team_source=self.test_team and 'test' or 'save_snapshot'}
        return Codec.clone(self.pending), 'ready'
    end
    function session:set_test_team(enabled)
        if self.closed then return false end
        self.test_team = enabled == true; self.pending = nil
        return true
    end
    function session:cancel() self.pending=nil end
    function session:close() self.pending=nil; self.closed=true end
    return session
end
return M
