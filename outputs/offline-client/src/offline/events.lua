local Events = {}
Events.__index = Events
function Events.new(on_error)
    return setmetatable({topics = {}, on_error = on_error or function() end}, Events)
end
function Events:on(topic, callback)
    assert(type(topic) == 'string' and type(callback) == 'function')
    local item = {callback = callback, active = true}
    local list = self.topics[topic] or {}
    self.topics[topic] = list
    list[#list + 1] = item
    return function()
        item.active = false
        for i = #list, 1, -1 do
            if list[i] == item then table.remove(list, i) end
        end
    end
end
function Events:emit(topic, payload)
    local snapshot = {}
    for i, item in ipairs(self.topics[topic] or {}) do snapshot[i] = item end
    local errors = {}
    for _, item in ipairs(snapshot) do
        if item.active then
            local ok, err = pcall(item.callback, payload)
            if not ok then
                errors[#errors + 1] = tostring(err)
                pcall(self.on_error, topic, err)
            end
        end
    end
    return errors
end
return Events
