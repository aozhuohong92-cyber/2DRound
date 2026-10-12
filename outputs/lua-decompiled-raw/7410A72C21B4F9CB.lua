function printLog(slot0, slot1, ...)
	print(table.concat({
		"[",
		string.upper(tostring(slot0)),
		"] ",
		string.format(tostring(slot1), ...)
	}))
end

function printError(slot0, ...)
	printLog("ERR", slot0, ...)
	print(debug.traceback("", 2))
end

function printInfo(slot0, ...)
	if type(DEBUG) ~= "number" or DEBUG < 2 then
		return
	end

	printLog("INFO", slot0, ...)
end

function slot0(slot0)
	if type(slot0) == "string" then
		slot0 = "\"" .. slot0 .. "\""
	end

	return tostring(slot0)
end

function dump(slot0, slot1, slot2)
	if type(slot2) ~= "number" then
		slot2 = 3
	end

	slot3 = {}

	print("dump from: " .. string.trim(string.split(debug.traceback("", 2), "\n")[3]))

	slot10 = slot1
	slot11 = "- "

	function (slot0, slot1, slot2, slot3, slot4)
		slot5 = ""

		if type(slot4) == "number" then
			slot5 = string.rep(" ", slot4 - string.len(uv0(slot1 or "<var>")))
		end

		if type(slot0) ~= "table" then
			uv1[#uv1 + 1] = string.format("%s%s%s = %s", slot2, uv0(slot1), slot5, uv0(slot0))
		elseif uv2[tostring(slot0)] then
			uv1[#uv1 + 1] = string.format("%s%s%s = *REF*", slot2, uv0(slot1), slot5)
		else
			uv2[tostring(slot0)] = true

			if uv3 < slot3 then
				uv1[#uv1 + 1] = string.format("%s%s = *MAX NESTING*", slot2, uv0(slot1))
			else
				slot14 = slot1
				uv1[#uv1 + 1] = string.format("%s%s = {", slot2, uv0(slot14))
				slot6 = slot2 .. "    "
				slot7 = {}
				slot9 = {}

				for slot13, slot14 in pairs(slot0) do
					slot7[#slot7 + 1] = slot13

					if 0 < string.len(uv0(slot13)) then
						slot8 = slot16
					end

					slot9[slot13] = slot14
				end

				function slot13(slot0, slot1)
					if type(slot0) == "number" and type(slot1) == "number" then
						return slot0 < slot1
					else
						return tostring(slot0) < tostring(slot1)
					end
				end

				table.sort(slot7, slot13)

				for slot13, slot14 in ipairs(slot7) do
					uv4(slot9[slot14], slot14, slot6, slot3 + 1, slot8)
				end

				uv1[#uv1 + 1] = string.format("%s}", slot2)
			end
		end
	end(slot0, slot10, slot11, 1)

	for slot10, slot11 in ipairs({}) do
		print(slot11)
	end
end

DUMP_IGNORE_KEY = {
	getSuperClassName = true,
	getClassName = true,
	getSuperClass = true,
	__ctype = true,
	new = true,
	isInstance = true,
	ctor = true,
	__index = true,
	__cname = true,
	class = true,
	dataMgr = true
}

function dumpTable(slot0, slot1, slot2, slot3, slot4, slot5)
	if type(slot0) ~= "table" then
		return (slot3 or "  ") .. (slot2 or "") .. " = " .. tostring(slot0) .. "\n"
	end

	slot6 = {
		mxl = 0
	}
	slot8 = nil
	(slot5 or {})[slot0] = slot2 or "."
	slot2 = slot2 or ""

	for slot12, slot13 in pairs(slot0) do
		if type(slot13) == "table" then
			if slot5[slot13] then
				table.insert({}, "[" .. slot5[slot13] .. "]")

				slot8 = slot3:rep(slot4 or 1) .. tostring(slot12)

				table.insert(slot6, slot8)

				slot6.mxl = math.max(#slot8, slot6.mxl)
			else
				slot5[slot13] = slot2 .. "." .. tostring(slot12)

				table.insert(slot7, dumpTable(slot13, slot1, slot5[slot13], slot3, slot4 + 1, slot5))

				slot8 = slot3:rep(slot4) .. tostring(slot12)

				table.insert(slot6, slot8)

				slot6.mxl = math.max(#slot8, slot6.mxl)
			end
		else
			if type(slot13) == "string" then
				table.insert(slot7, ("%q"):format(slot13):gsub("\\\n", "\\n"):gsub("\\r\\n", "\\n"))
			else
				table.insert(slot7, tostring(slot13))
			end

			slot8 = slot3:rep(slot4) .. tostring(slot12)

			table.insert(slot6, slot8)

			slot6.mxl = math.max(#slot8, slot6.mxl)
		end
	end

	for slot12, slot13 in ipairs(slot6) do
		if slot1 then
			if not DUMP_IGNORE_KEY[cctrim(slot13)] then
				slot7[slot12] = slot13 .. (" "):rep(slot6.mxl - #slot13) .. " = " .. slot7[slot12] .. "\n"
			else
				slot7[slot12] = ""
			end
		else
			slot7[slot12] = slot13 .. (" "):rep(slot8 - #slot13) .. " = " .. slot7[slot12] .. "\n"
		end
	end

	return "{\n" .. table.concat(slot7) .. slot3:rep(slot4 - 1) .. "}"
end

function cctrim(slot0)
	return slot0:gsub("^%s*(.-)%s*$", "%1")
end

function ccdump(slot0, slot1)
	if slot1 then
		print("准备dump:" .. slot1)
	end

	print(dumpTable(slot0, true))
end

function printf(slot0, ...)
	print(string.format(tostring(slot0), ...))
end

function checknumber(slot0, slot1)
	return tonumber(slot0, slot1) or 0
end

function checkint(slot0)
	return math.round(checknumber(slot0))
end

function checkbool(slot0)
	return slot0 ~= nil and slot0 ~= false
end

function checktable(slot0)
	if type(slot0) ~= "table" then
		slot0 = {}
	end

	return slot0
end

function isset(slot0, slot1)
	return (type(slot0) == "table" or slot2 == "userdata") and slot0[slot1] ~= nil
end

slot1 = nil

function setmetatableindex(slot0, slot1)
	if type(slot0) == "userdata" then
		if not tolua.getpeer(slot0) then
			tolua.setpeer(slot0, {})
		end

		uv0(slot2, slot1)
	elseif not (getmetatable(slot0) or {}).__index then
		slot2.__index = slot1

		setmetatable(slot0, slot2)
	elseif slot2.__index ~= slot1 then
		uv0(slot2, slot1)
	end
end

function clone(slot0)
	slot1 = {}

	return function (slot0)
		if type(slot0) ~= "table" then
			return slot0
		elseif uv0[slot0] then
			return uv0[slot0]
		end

		uv0[slot0] = {}

		for slot5, slot6 in pairs(slot0) do
			slot1[uv1(slot5)] = uv1(slot6)
		end

		return setmetatable(slot1, getmetatable(slot0))
	end(slot0)
end

function class(slot0, ...)
	slot1 = {
		__cname = slot0
	}

	for slot6, slot7 in ipairs({
		...
	}) do
		assert(type(slot7) == "nil" or slot8 == "table" or slot8 == "function", string.format("class() - create class \"%s\" with invalid super class type \"%s\"", slot0, slot8))

		if slot8 == "function" then
			assert(slot1.__create == nil, string.format("class() - create class \"%s\" with more than one creating function", slot0))

			slot1.__create = slot7
		elseif slot8 == "table" then
			if slot7[".isclass"] then
				assert(slot1.__create == nil, string.format("class() - create class \"%s\" with more than one creating function or native class", slot0))

				function slot1.__create()
					return uv0:create()
				end
			else
				slot1.__supers = slot1.__supers or {}
				slot1.__supers[#slot1.__supers + 1] = slot7

				if not slot1.super then
					slot1.super = slot7
				end
			end
		else
			error(string.format("class() - create class \"%s\" with invalid super type", slot0), 0)
		end
	end

	slot1.__index = slot1

	if not slot1.__supers or #slot1.__supers == 1 then
		setmetatable(slot1, {
			__index = slot1.super
		})
	else
		setmetatable(slot1, {
			__index = function (slot0, slot1)
				for slot6 = 1, #uv0.__supers do
					if slot2[slot6][slot1] then
						return slot7[slot1]
					end
				end
			end
		})
	end

	if not slot1.ctor then
		function slot1.ctor()
		end
	end

	function slot1.new(...)
		slot0 = nil
		slot0 = (not uv0.__create or uv0.__create(...)) and {}

		setmetatableindex(slot0, uv0)

		slot0.class = uv0

		slot0:ctor(...)

		return slot0
	end

	function slot1.create(slot0, ...)
		return uv0.new(...)
	end

	return slot1
end

slot2 = nil

function slot2(slot0, slot1)
	if type(rawget(slot0, "__index")) == "table" and rawget(slot2, "__cname") == slot1 then
		return true
	end

	if rawget(slot0, "__cname") == slot1 then
		return true
	end

	if not rawget(slot0, "__supers") then
		return false
	end

	for slot7, slot8 in ipairs(slot3) do
		if uv0(slot8, slot1) then
			return true
		end
	end

	return false
end

function iskindof(slot0, slot1)
	if type(slot0) ~= "table" and slot2 ~= "userdata" then
		return false
	end

	slot3 = nil

	if slot2 == "userdata" then
		if tolua.iskindof(slot0, slot1) then
			return true
		end

		slot3 = tolua.getpeer(slot0)
	else
		slot3 = getmetatable(slot0)
	end

	if slot3 then
		return uv0(slot3, slot1)
	end

	return false
end

function import(slot0, slot1)
	slot2 = nil
	slot3 = slot0
	slot4 = 1

	while true do
		if string.byte(slot0, slot4) ~= 46 then
			if slot2 and #slot2 > 0 then
				slot3 = table.concat(slot2, ".") .. "." .. string.sub(slot0, slot4)
			end

			break
		end

		slot4 = slot4 + 1

		if not slot2 then
			if not slot1 then
				slot5, slot1 = debug.getlocal(3, 1)
			end

			slot2 = string.split(slot1, ".")
		end

		table.remove(slot2, #slot2)
	end

	return require(slot3)
end

function handler(slot0, slot1)
	return function (...)
		return uv0(uv1, ...)
	end
end

function math.newrandomseed()
	slot0, slot1 = pcall(function ()
		return require("socket")
	end)

	if slot0 then
		math.randomseed(slot1.gettime() * 1000)
	else
		math.randomseed(os.time())
	end

	math.random()
	math.random()
	math.random()
	math.random()
end

function math.round(slot0)
	return math.floor(checknumber(slot0) + 0.5)
end

slot3 = math.pi / 180

function math.angle2radian(slot0)
	return slot0 * uv0
end

slot4 = math.pi * 180

function math.radian2angle(slot0)
	return slot0 / uv0
end

function io.exists(slot0)
	if io.open(slot0, "r") then
		io.close(slot1)

		return true
	end

	return false
end

function io.readfile(slot0)
	if io.open(slot0, "r") then
		io.close(slot1)

		return slot1:read("*a")
	end

	return nil
end

function io.writefile(slot0, slot1, slot2)
	if io.open(slot0, slot2 or "w+b") then
		if slot3:write(slot1) == nil then
			return false
		end

		io.close(slot3)

		return true
	else
		return false
	end
end

function io.pathinfo(slot0)
	slot2 = string.len(slot0) + 1

	while slot1 > 0 do
		if string.byte(slot0, slot1) == 46 then
			slot2 = slot1
		elseif slot3 == 47 then
			break
		end

		slot1 = slot1 - 1
	end

	slot4 = string.sub(slot0, slot1 + 1)
	slot2 = slot2 - slot1

	return {
		dirname = string.sub(slot0, 1, slot1),
		filename = slot4,
		basename = string.sub(slot4, 1, slot2 - 1),
		extname = string.sub(slot4, slot2)
	}
end

function io.filesize(slot0)
	slot1 = false

	if io.open(slot0, "r") then
		slot1 = slot2:seek("end")

		slot2:seek("set", slot2:seek())
		io.close(slot2)
	end

	return slot1
end

function table.nums(slot0)
	for slot5, slot6 in pairs(slot0) do
		slot1 = 0 + 1
	end

	return slot1
end

function table.keys(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

function table.values(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot1[#slot1 + 1] = slot6
	end

	return slot1
end

function table.merge(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end
end

function table.insertto(slot0, slot1, slot2)
	if checkint(slot2) <= 0 then
		slot2 = #slot0 + 1
	end

	for slot7 = 0, #slot1 - 1 do
		slot0[slot7 + slot2] = slot1[slot7 + 1]
	end
end

function table.indexof(slot0, slot1, slot2)
	for slot6 = slot2 or 1, #slot0 do
		if slot0[slot6] == slot1 then
			return slot6
		end
	end

	return false
end

function table.keyof(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if slot6 == slot1 then
			return slot5
		end
	end

	return nil
end

function table.removebyvalue(slot0, slot1, slot2)
	slot3 = 0
	slot4 = 1

	while slot4 <= #slot0 do
		if slot0[slot4] == slot1 then
			table.remove(slot0, slot4)

			slot3 = slot3 + 1
			slot4 = slot4 - 1
			slot5 = slot5 - 1

			if not slot2 then
				break
			end
		end

		slot4 = slot4 + 1
	end

	return slot3
end

function table.map(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		slot0[slot5] = slot1(slot6, slot5)
	end
end

function table.walk(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		slot1(slot6, slot5)
	end
end

function table.filter(slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		if not slot1(slot6, slot5) then
			slot0[slot5] = nil
		end
	end
end

function table.unique(slot0, slot1)
	slot2 = {}
	slot4 = 1

	for slot8, slot9 in pairs(slot0) do
		if not slot2[slot9] then
			if slot1 then
				slot4 = slot4 + 1
			else
				slot3[slot8] = slot9
			end

			slot2[slot9] = true
		end
	end

	return {
		[slot4] = slot9
	}
end

string._htmlspecialchars_set = {
	["&"] = "&amp;",
	["\""] = "&quot;",
	["'"] = "&#039;",
	["<"] = "&lt;",
	[">"] = "&gt;"
}

function string.htmlspecialchars(slot0)
	for slot4, slot5 in pairs(string._htmlspecialchars_set) do
		slot0 = string.gsub(slot0, slot4, slot5)
	end

	return slot0
end

function string.restorehtmlspecialchars(slot0)
	for slot4, slot5 in pairs(string._htmlspecialchars_set) do
		slot0 = string.gsub(slot0, slot5, slot4)
	end

	return slot0
end

function string.nl2br(slot0)
	return string.gsub(slot0, "\n", "<br />")
end

function string.text2html(slot0)
	return string.nl2br(string.gsub(string.htmlspecialchars(string.gsub(slot0, "\t", "    ")), " ", "&nbsp;"))
end

function string.split(slot0, slot1)
	slot0 = tostring(slot0)

	if tostring(slot1) == "" then
		return false
	end

	slot3 = {}

	for slot7, slot8 in function ()
		return string.find(uv0, uv1, uv2, true)
	end, nil,  do
		table.insert(slot3, string.sub(slot0, 0, slot7 - 1))

		slot2 = slot8 + 1
	end

	table.insert(slot3, string.sub(slot0, slot2))

	return slot3
end

function string.ltrim(slot0)
	return string.gsub(slot0, "^[ \t\n\r]+", "")
end

function string.rtrim(slot0)
	return string.gsub(slot0, "[ \t\n\r]+$", "")
end

function string.trim(slot0)
	return string.gsub(string.gsub(slot0, "^[ \t\n\r]+", ""), "[ \t\n\r]+$", "")
end

function string.ucfirst(slot0)
	return string.upper(string.sub(slot0, 1, 1)) .. string.sub(slot0, 2)
end

function slot5(slot0)
	return "%" .. string.format("%02X", string.byte(slot0))
end

function string.urlencode(slot0)
	return string.gsub(string.gsub(string.gsub(tostring(slot0), "\n", "\r\n"), "([^%w%.%- ])", uv0), " ", "+")
end

function string.urldecode(slot0)
	return string.gsub(string.gsub(string.gsub(slot0, "+", " "), "%%(%x%x)", function (slot0)
		return string.char(checknumber(slot0, 16))
	end), "\r\n", "\n")
end

function string.utf8len(slot0)
	slot2 = string.len(slot0)
	slot3 = 0
	slot4 = {
		0,
		192,
		224,
		240,
		248,
		252
	}

	while slot2 ~= 0 do
		slot5 = string.byte(slot0, -slot2)
		slot6 = #slot4

		while slot4[slot6] do
			if slot4[slot6] <= slot5 then
				slot2 = slot2 - slot6

				break
			end

			slot6 = slot6 - 1
		end

		slot3 = slot3 + 1
	end

	return slot3
end

function string.formatnumberthousands(slot0)
	slot2 = nil

	while true do
		slot1, slot4 = string.gsub(tostring(checknumber(slot0)), "^(-?%d+)(%d%d%d)", "%1,%2")

		if slot4 == 0 then
			break
		end
	end

	return slot1
end
