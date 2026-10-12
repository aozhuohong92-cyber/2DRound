-- Bounded data-only codec. Saves never execute Lua source.
local M = {}
local LIMIT = 1024 * 1024
function M.encode(value)
    local seen = {}
    local function enc(v, depth)
        assert(depth <= 32, 'save nesting limit')
        local t = type(v)
        if t == 'string' then return 's' .. #v .. ':' .. v end
        if t == 'number' then
            assert(v == v and v ~= math.huge and v ~= -math.huge, 'invalid number')
            local s = string.format('%.17g', v)
            return 'n' .. #s .. ':' .. s
        end
        if t == 'boolean' then return v and 't' or 'f' end
        assert(t == 'table' and not seen[v], 'unsupported or cyclic save')
        seen[v] = true
        local keys = {}
        for k in pairs(v) do
            assert(type(k) == 'string' or type(k) == 'number', 'invalid key')
            keys[#keys + 1] = k
        end
        table.sort(keys, function(a,b)
            if type(a) == type(b) then return a < b end
            return type(a) < type(b)
        end)
        local out = {'m', tostring(#keys), ':'}
        for _, k in ipairs(keys) do
            out[#out + 1] = enc(k, depth + 1)
            out[#out + 1] = enc(v[k], depth + 1)
        end
        seen[v] = nil
        return table.concat(out)
    end
    local data = enc(value, 0)
    assert(#data <= LIMIT, 'save too large')
    return data
end
function M.decode(data)
    assert(type(data) == 'string' and #data <= LIMIT, 'save too large')
    local pos = 1
    local function count()
        local stop = assert(data:find(':', pos, true), 'missing length')
        local s = data:sub(pos, stop - 1)
        assert(#s <= 8 and s:match('^%d+$'), 'invalid length')
        pos = stop + 1
        local n = tonumber(s)
        assert(n <= LIMIT, 'length limit')
        return n
    end
    local function dec(depth)
        assert(depth <= 32 and pos <= #data, 'invalid nesting or truncated save')
        local tag = data:sub(pos, pos); pos = pos + 1
        if tag == 't' then return true end
        if tag == 'f' then return false end
        if tag == 's' or tag == 'n' then
            local len = count()
            assert(pos + len - 1 <= #data, 'truncated value')
            local s = data:sub(pos, pos + len - 1); pos = pos + len
            if tag == 's' then return s end
            local n = tonumber(s)
            assert(n and n == n and n ~= math.huge and n ~= -math.huge, 'invalid number')
            return n
        end
        assert(tag == 'm', 'invalid type')
        local n, result = count(), {}
        assert(n <= 10000, 'too many fields')
        for _ = 1, n do
            local k = dec(depth + 1)
            assert(type(k) == 'string' or type(k) == 'number', 'invalid key')
            assert(result[k] == nil, 'duplicate key')
            result[k] = dec(depth + 1)
        end
        return result
    end
    local value = dec(0)
    assert(pos == #data + 1, 'trailing data')
    return value
end
function M.checksum(data)
    local a, b = 1, 0
    for i = 1, #data do a = (a + data:byte(i)) % 65521; b = (b + a) % 65521 end
    return string.format('%08x', b * 65536 + a)
end
function M.clone(value) return M.decode(M.encode(value)) end
return M
