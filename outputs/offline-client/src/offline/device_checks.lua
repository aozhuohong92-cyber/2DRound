-- Opt-in device checks. Only touches files prefixed acceptance-state.
local M = {}
function M.run(directory, trace)
    local request_path = directory .. 'device-check.request'
    local request = io.open(request_path, 'rb')
    if not request then return end
    local mode = request:read('*a'):match('^%s*(.-)%s*$'); request:close()
    os.remove(request_path)
    local ok, err = xpcall(function()
        local State = require('offline.state')
        local Store = require('offline.store')
        local Events = require('offline.events')
        local path = directory .. 'acceptance-state'
        local store = Store.new(path, State.validate)
        if mode == 'write' then
            -- Explicit test namespace reset, never the application's offline-state files.
            for i = 0, 1 do os.remove(path .. '.' .. i); os.remove(path .. '.' .. i .. '.tmp') end
            local bus = Events.new()
            local events = 0
            bus:on('state.changed', function() events = events + 1 end)
            local state = assert(State.new(store, bus))
            assert(state:set_name('验收船长'))
            assert(state:summon_fixture(20510))
            assert(state:equip(1, '20510'))
            assert(state:claim_fixture('acceptance-first', 100))
            assert(not state:claim_fixture('acceptance-first', 100))
            assert(events == 4 and state:snapshot().revision == 4)
            trace('DEVICE_CHECK_WRITE_OK revision=4 coins=100 events=4')
        elseif mode == 'read' then
            local state = assert(State.new(store))
            local s = state:snapshot()
            assert(s.name == '验收船长' and s.revision == 4 and s.coins == 100)
            assert(s.heroes['20510'] and s.team[1] == '20510' and s.claims['acceptance-first'])
            assert(not state:claim_fixture('acceptance-first', 100))
            trace('DEVICE_CHECK_RESTART_OK revision=4 coins=100 team=20510')
            local f = assert(io.open(path .. '.0', 'wb')); assert(f:write('intentional test corruption')); f:close()
            local recovered = assert(State.new(store))
            assert(recovered.status == 'recovered' and recovered:snapshot().revision == 3)
            trace('DEVICE_CHECK_RECOVERY_OK revision=3')
            f = assert(io.open(path .. '.1', 'wb')); assert(f:write('intentional test corruption')); f:close()
            assert(not State.new(store))
            trace('DEVICE_CHECK_CORRUPTION_PROTECTED_OK')
        else error('unknown device check request') end
    end, debug.traceback)
    if not ok then trace('DEVICE_CHECK_FAILED ' .. tostring(err)) end
end
return M
