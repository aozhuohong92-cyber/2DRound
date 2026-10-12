-- Engine-free state machine for the fixed drama replay (D stage).
-- It sequences presentation only: no damage, rewards, progression or save writes.
-- Every run settles at most once; late callbacks from an older run, or after
-- close(), are rejected so they cannot pollute a newer scene.
local M = {}

local TEXT = {
    done = '固定演出完成 · 不计算伤害 · 无奖励 · 已记录测试结果',
    failed = '演出失败 · 无奖励',
    cancelled = '演出已取消 · 无奖励',
}

function M.summary(record)
    assert(type(record) == 'table' and TEXT[record.outcome], 'unknown outcome')
    if record.outcome == 'failed' and record.detail and record.detail ~= '' then
        return TEXT.failed .. '（' .. record.detail .. '）'
    end
    return TEXT[record.outcome]
end

-- sink(record) -> true | nil, err ; failures are reported on the record, never thrown.
function M.new(sink)
    assert(sink == nil or type(sink) == 'function')
    local replay = {}
    local run, state, stage_id, closed = 0, 'idle', nil, false
    local settled, last = {}, nil

    function replay:status() return closed and 'closed' or state end
    function replay:run_id() return run end
    function replay:last() return last end
    function replay:playing() return state == 'playing' and not closed end

    function replay:start(id)
        if closed then return nil, 'closed' end
        if state == 'playing' then return nil, 'busy' end
        if type(id) ~= 'number' then return nil, 'invalid' end
        run = run + 1; state = 'playing'; stage_id = id; last = nil
        return run
    end

    local function settle(id, outcome, detail)
        if id ~= run or state ~= 'playing' then return nil, 'stale' end
        if settled[id] then return nil, 'duplicate' end
        settled[id] = true
        state = outcome
        local record = {run_id = id, stage_id = stage_id, outcome = outcome,
                        fixed_replay = true, detail = detail or ''}
        if sink then
            local ok, result, err = pcall(sink, record)
            record.persisted = ok and result == true
            record.persist_error = (not ok and tostring(result)) or (result ~= true and tostring(err)) or nil
        end
        last = record
        return record
    end

    function replay:finish(id) return settle(id, 'done') end
    function replay:fail(id, err) return settle(id, 'failed', tostring(err)) end
    function replay:cancel()
        if state ~= 'playing' then return nil, 'idle' end
        return settle(run, 'cancelled', 'cancelled')
    end
    function replay:close()
        local record = state == 'playing' and settle(run, 'cancelled', 'closed') or nil
        closed = true
        return record
    end
    return replay
end

return M
