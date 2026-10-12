-- Handwritten compatibility subset; not recovered original BaseClass source.
return function(super)
    local cls = {super = super}
    cls.__index = cls
    setmetatable(cls, {__index = super})
    function cls.New(...)
        local object = setmetatable({_deleted = false}, cls)
        local function init(c, ...)
            if c.super then init(c.super, ...) end
            local fn = rawget(c, '__init')
            if fn then fn(object, ...) end
        end
        init(cls, ...)
        return object
    end
    function cls:DeleteMe()
        if self._deleted then return end
        self._deleted = true
        local c = getmetatable(self)
        while c do
            local fn = rawget(c, '__delete')
            if fn then fn(self) end
            c = c.super
        end
    end
    return cls
end
