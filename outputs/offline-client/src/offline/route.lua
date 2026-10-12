-- Small synchronous scene-route guard.
-- Entering a scene is blocked while another transition is running and while the
-- requested scene is already current, which prevents duplicate taps from
-- building overlapping scenes.
local M = {}

function M.new()
    local current = nil
    local switching = false

    local route = {}

    function route:current()
        return current
    end

    function route:is_switching()
        return switching
    end

    function route:go(name, enter)
        assert(type(name) == 'string' and name ~= '', 'route name is required')
        assert(type(enter) == 'function', 'route enter callback is required')
        if switching or current == name then
            return false
        end

        switching = true
        local ok, result = pcall(enter, name, current)
        switching = false
        if not ok then
            error(result, 0)
        end

        current = name
        return true, result
    end

    return route
end

return M
