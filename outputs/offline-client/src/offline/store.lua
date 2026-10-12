local Codec = require('offline.codec')
local Store = {}
Store.__index = Store
function Store.new(path, validate)
    assert(type(path) == 'string' and type(validate) == 'function')
    return setmetatable({path = path, validate = validate}, Store)
end
local function read(path)
    local f = io.open(path, 'rb')
    if not f then return nil end
    local data = f:read(1024 * 1024 + 128); f:close()
    return data
end
function Store:load()
    local best, errors, present = nil, {}, false
    for slot = 0, 1 do
        local raw = read(self.path .. '.' .. slot)
        if raw then
            present = true
            local ok, value = pcall(function()
                local sum, body = raw:match('^OFFLINE1\n(%x%x%x%x%x%x%x%x)\n(.*)$')
                assert(body and Codec.checksum(body) == sum, 'checksum mismatch')
                local decoded = Codec.decode(body)
                self.validate(decoded)
                return decoded
            end)
            if ok then
                if not best or value.revision > best.revision then best = value end
            else errors[#errors + 1] = tostring(value) end
        end
    end
    if best then return best, #errors > 0 and 'recovered' or 'loaded' end
    if present then return nil, 'corrupt', errors end
    return nil, 'new'
end
function Store:save(value)
    local ok, result = pcall(function()
        self.validate(value)
        local body = Codec.encode(value)
        local target = self.path .. '.' .. (value.revision % 2)
        local temp = target .. '.tmp'
        local f, err = io.open(temp, 'wb')
        assert(f, err)
        local wrote, write_error = f:write('OFFLINE1\n' .. Codec.checksum(body) .. '\n' .. body)
        local closed, close_error = f:close()
        if not wrote or not closed then
            os.remove(temp)
            error(write_error or close_error or 'write failed')
        end
        local renamed, rename_error = os.rename(temp, target)
        if not renamed then os.remove(temp); error(rename_error) end
        return true
    end)
    if not ok then return nil, tostring(result) end
    return result
end
return Store
