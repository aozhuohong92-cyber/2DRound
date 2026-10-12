-- Isolated test record for the fixed drama replay. It uses its own store file
-- and never touches offline-state, the formal save, rewards or progression.
local Store = require('offline.store')
local M = {}
M.LIMIT = 20

function M.validate(value)
    assert(type(value) == 'table' and value.version == 1, 'bad record file')
    assert(type(value.revision) == 'number' and value.revision >= 0 and value.revision % 1 == 0, 'bad revision')
    assert(type(value.records) == 'table', 'bad records')
    for _, r in ipairs(value.records) do
        assert(type(r.outcome) == 'string' and type(r.stage_id) == 'number', 'bad record entry')
    end
end

function M.new(path)
    local store = Store.new(path, M.validate)
    local record = {}
    -- A corrupt or missing file is replaced: these are disposable test results.
    function record:append(entry)
        local current = store:load()
        if not current then current = {version = 1, revision = 0, records = {}} end
        local list = current.records
        list[#list + 1] = {
            seq = current.revision + 1, run_id = entry.run_id, stage_id = entry.stage_id,
            outcome = entry.outcome, fixed_replay = true, detail = entry.detail or '',
        }
        while #list > M.LIMIT do table.remove(list, 1) end
        current.revision = current.revision + 1
        return store:save(current)
    end
    function record:load() return store:load() end
    return record
end

return M
