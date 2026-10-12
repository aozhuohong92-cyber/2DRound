auto_id = auto_id or 0

function autoId()
	auto_id = auto_id + 1

	return auto_id
end

function printLuaTable(slot0, slot1)
	slot1 = slot1 or 0

	for slot5, slot6 in pairs(slot0) do
		slot7 = ""
		TypeV = type(slot6)

		if TypeV == "table" then
			slot7 = "{"
		end

		formatting = string.rep(" ", slot1) .. slot5 .. " = " .. slot7

		if TypeV == "table" then
			print(formatting)
			printLuaTable(slot6, slot1 + 1)
			print(slot8 .. "},")
		else
			slot9 = ""

			print(formatting .. ((TypeV ~= "string" or string.format("%q", slot6)) and tostring(slot6)) .. ",")
		end
	end
end

function luaTable2Str(slot0, slot1, slot2)
	slot2 = slot2 or 0
	slot0 = slot0 or ""

	for slot6, slot7 in pairs(slot1) do
		slot8 = ""
		TypeV = type(slot7)

		if TypeV == "table" then
			slot8 = "{"
		end

		formatting = string.rep(" ", slot2) .. slot6 .. " = " .. slot8
		slot0 = TypeV == "table" and luaTable2Str(slot0 .. formatting .. "\n", slot7, slot2 + 1) .. slot9 .. "}\n" or luaTable2Str(slot0 .. formatting .. "\n", slot7, slot2 + 1) .. slot9 .. "}\n" .. formatting .. ((TypeV ~= "string" or string.format("%q", slot7)) and tostring(slot7)) .. "\n"
	end

	return slot0
end

function radianToDegree(slot0)
	return slot0 * 57.29577951
end

function getAngleByPos(slot0, slot1)
	slot2 = {
		x = slot1.x - slot0.x,
		y = slot1.y - slot0.y
	}

	return math.atan2(slot2.y, slot2.x) * 180 / math.pi
end

function getPosByAngleAndDis(slot0, slot1, slot2)
	slot3 = math.pi / 180 * slot2

	return slot0.x + slot1 * math.cos(slot3), slot0.y + slot1 * math.sin(slot3)
end

function printParent(slot0)
	print(string.format("From %s:%d in function `%s`", string.match(debug.getinfo(slot0 or 2, "Sln").short_src, "[^\"]+.lua") or "nil", slot1.currentline, slot1.name or ""))
end

__hoop_file = ""

function hoop(...)
	__hoop_table = __hoop_table or {}

	if not debug.getinfo(3, "Sln") or not slot0.name then
		return
	end

	if string.match(slot0.short_src, string.format("[^\"]+.lua", __hoop_file)) then
		print(string.format("From %s:%d in function `%s`", slot1 or "nil", slot0.currentline, slot0.name or ""))
	end
end

function whoisyourdaddy()
	slot1 = 2
	slot0 = "" .. "your daddy is:\n"

	while true do
		if not debug.getinfo(slot1, "Sln") then
			break
		end

		slot0 = slot2.what == "C" and slot0 .. "    " .. tostring(slot1) .. "C function\n" or slot0 .. string.format("    %s:%d in function `%s`\n", string.match(slot2.short_src, "[^\"]+.lua"), slot2.currentline, slot2.name or "")
		slot1 = slot1 + 1
	end

	print(slot0)
end

function writeLog(slot0, slot1)
	Type = type(slot1)

	if Type == "table" then
		write_lua_table(slot0, slot1, 0)
	else
		slot0:write(slot1)
	end
end

function writeLuaTable(slot0, slot1, slot2)
	slot2 = slot2 or 0

	for slot6, slot7 in pairs(slot1) do
		if type(slot6) == "string" then
			slot6 = string.format("%q", slot6)
		end

		slot8 = ""
		TypeV = type(slot7)

		if TypeV == "table" then
			slot8 = "{"
		end

		formatting = string.rep(" ", slot2) .. "[" .. slot6 .. "]" .. " = " .. slot8

		if TypeV == "table" then
			slot0:write("[Trace] " .. formatting .. "\n")
			write_lua_table(slot0, slot7, slot2 + 1)
			slot0:write("[Trace] " .. slot9 .. "},\n")
		else
			slot10 = ""

			slot0:write("[Trace] " .. formatting .. ((TypeV ~= "string" or string.format("%q", slot7)) and tostring(slot7)) .. ",\n")
		end
	end
end

function keyfind(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7[slot0] == slot1 then
			return slot7
		end
	end

	return false
end

function keydelete(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2) do
		if slot7[slot0] == slot1 then
			table.remove(slot2, slot6)

			return slot7
		end
	end

	return false
end

function keyreplace(slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot2) do
		if slot8[slot0] == slot1 then
			slot2[slot7] = slot3

			return true
		end
	end

	return false
end

function tableLen(slot0)
	slot1 = 0

	if slot0 then
		for slot5 in pairs(slot0) do
			slot1 = slot1 + 1
		end
	end

	return slot1
end

function setVoFromRemote(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot1[slot5] ~= nil then
			slot0[slot5] = slot1[slot5]
		end
	end
end

function deepCopy(slot0)
	slot1 = {}

	return (function (slot0)
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
	end)(slot0)
end

function getIntPart(slot0)
	if math.ceil(slot0) == slot0 then
		return slot1
	else
		return slot1 - 1
	end
end

function getFloatPart(slot0)
	return slot0 - getIntPart(slot0)
end

function getRoundForNLocation(slot0, slot1)
	return math.floor(math.pow(10, slot1) * slot0 + 0.5) / math.pow(10, slot1)
end

function cutBaseClass(slot0)
	if type(slot0) ~= "table" then
		return slot0
	end

	for slot5, slot6 in pairs(slot0) do
		if slot5 ~= "DeleteMe" and slot5 ~= "_class_type" then
			if type(slot6) == "table" then
				-- Nothing
			else
				slot1[slot5] = slot6
			end
		end
	end

	return {
		[slot5] = cutBaseClass(slot6)
	}
end

function mathRound(slot0)
	return math.floor(slot0 + 0.5)
end

function int2rgb(slot0)
	slot1, slot2, slot3, slot4 = nil
	slot0 = (slot0 - slot0 % 256) / 256
	slot3 = slot0 % 256
	slot0 = (slot0 - slot3) / 256
	slot2 = slot0 % 256

	return (slot0 - slot2) / 256, slot2, slot3
end

_file_exist_list = _file_exist_list or {}

function isFileExist(slot0)
	if type(slot0) ~= "string" then
		return false
	end

	if _file_exist_list[slot0] ~= nil then
		return _file_exist_list[slot0]
	else
		slot1 = cc.FileUtils:getInstance():isFileExist(slot0)
		_file_exist_list[slot0] = slot1

		return slot1
	end
end

function tracebackex(slot0)
	slot0 = slot0 or 5
	slot2 = 2
	slot1 = "" .. "stack traceback:\n"

	while true do
		if not debug.getinfo(slot2, "Sln") then
			break
		end

		slot1 = slot3.what == "C" and slot1 .. tostring(slot2) .. "\tC function\n" or slot1 .. string.format("\t[%s]:%d in function `%s`\n", slot3.short_src, slot3.currentline, slot3.name or "")
		slot4 = 1

		while true do
			slot5, slot6 = debug.getlocal(slot2, slot4)

			if not slot5 then
				break
			end

			slot1 = slot1 .. "\t\t" .. slot5 .. " =\t" .. tostringex(slot6, 3) .. "\n"
			slot4 = slot4 + 1
		end

		if slot0 < slot2 + 1 then
			break
		end
	end

	print(slot1)
end

function tostringex(slot0, slot1)
	if slot1 == nil then
		slot1 = 0
	end

	slot2 = string.rep("\t", slot1)
	slot3 = ""

	if type(slot0) == "table" then
		if slot1 > 5 then
			return "\t{ ... }"
		end

		for slot8, slot9 in pairs(slot0) do
			slot4 = "" .. "\n\t" .. slot2 .. tostring(slot8) .. ":" .. tostringex(slot9, slot1 + 1)
		end

		if slot4 == "" then
			slot3 = slot3 .. slot2 .. "{ }\t(" .. tostring(slot0) .. ")"
		else
			if slot1 > 0 then
				slot3 = slot3 .. "\t(" .. tostring(slot0) .. ")\n"
			end

			slot3 = slot3 .. slot2 .. "{" .. slot4 .. "\n" .. slot2 .. "}"
		end
	else
		slot3 = slot3 .. slot2 .. tostring(slot0) .. "\t(" .. type(slot0) .. ")"
	end

	return slot3
end

function tipsFormat(...)
	return string.format(...)
end

function color(slot0)
	slot1 = "ff"
	slot2 = "ff"
	slot3 = "ff"
	slot4 = "ff"
	slot2 = string.sub(slot0, 3, 4)
	slot3 = string.sub(slot0, 5, 6)
	slot4 = string.sub(slot0, 7, 8)

	if string.sub(slot0, 1, 2) == "" then
		slot1 = "ff"
	end

	if slot2 == "" then
		slot2 = "ff"
	end

	if slot3 == "" then
		slot3 = "ff"
	end

	if slot4 == "" then
		slot4 = "ff"
	end

	return cc.c4b(tonumber("0x" .. slot1), tonumber("0x" .. slot2), tonumber("0x" .. slot3), tonumber("0x" .. slot4))
end

function c3bToStr(slot0)
	if not slot0 then
		return "#ffffff"
	end

	slot2 = string.format("%x", slot0.g)
	slot3 = string.format("%x", slot0.b)

	if #string.format("%x", slot0.r) < 2 then
		slot1 = "0" .. slot1 or slot1
	end

	if #slot2 < 2 then
		slot2 = "0" .. slot2 or slot2
	end

	if #slot3 < 2 then
		slot3 = "0" .. slot3 or slot3
	end

	return "#" .. slot1 .. slot2 .. slot3
end

function StringFormat(slot0, ...)
	slot1 = {
		...
	}

	return string.gsub(slot0, "{(%d+)}", function (slot0)
		return tostring(uv0[tonumber(slot0) + 1])
	end)
end

function Split(slot0, slot1)
	slot2 = {}
	slot3 = 1

	while true do
		slot4, slot5 = string.find(slot0, slot1, slot3)

		if not slot4 then
			break
		end

		slot2[#slot2 + 1] = string.sub(slot0, slot3, slot4 - 1)
		slot3 = slot5 + 1
	end

	if slot3 <= string.len(slot0) then
		slot2[#slot2 + 1] = string.sub(slot0, slot3)
	end

	return slot2
end

function Join(slot0, slot1)
	if #slot0 == 0 then
		return ""
	end

	for slot6 = 2, #slot0 do
		slot2 = "%s" .. slot1 .. "%s"
	end

	return string.format(slot2, unpack(slot0))
end

function Printf(slot0, ...)
	print(string.format(slot0, ...))
end

function DeepCopy(slot0)
	slot1 = {}

	return (function (slot0)
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
	end)(slot0)
end

function SwitchFuncs(slot0)
	function slot0.Case(slot0, slot1)
		return slot0[slot1] or slot0.default
	end

	return slot0
end

function ToBoolean(slot0)
	return ({
		["false"] = false,
		["true"] = true
	})[slot0]
end

function TabToStr(slot0, slot1)
	function slot3(slot0)
		return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(slot0, "%[", " "), "%]", " "), "\"", " "), "%'", " "), "\\", " "), "%%", " ")
	end

	for slot7, slot8 in pairs(slot0) do
		if type(slot7) == "number" then
			if type(slot8) == "table" then
				slot2 = string.format("%s[%d]=%s,", string.format("%s{", ""), slot7, TabToStr(slot8))
			elseif type(slot8) == "number" then
				slot2 = string.format("%s[%d]=%d,", slot2, slot7, slot8)
			elseif type(slot8) == "string" then
				slot2 = string.format("%s[%d]=%q,", slot2, slot7, slot8)
			elseif type(slot8) == "boolean" then
				slot2 = string.format("%s[%d]=%s,", slot2, slot7, tostring(slot8))
			elseif slot1 then
				slot2 = string.format("%s[%d]=%q,", slot2, slot7, type(slot8))
			else
				error("the type of value is a function or userdata")
			end
		elseif type(slot8) == "table" then
			slot2 = string.format("%s%s=%s,", slot2, slot7, TabToStr(slot8, slot1))
		elseif type(slot8) == "number" then
			slot2 = string.format("%s%s=%d,", slot2, slot7, slot8)
		elseif type(slot8) == "string" then
			slot2 = string.format("%s%s=%q,", slot2, slot7, slot8)
		elseif type(slot8) == "boolean" then
			slot2 = string.format("%s%s=%s,", slot2, slot7, tostring(slot8))
		elseif slot1 then
			slot2 = string.format("%s[%s]=%q,", slot2, slot7, type(slot8))
		else
			error("the type of value is a function or userdata")
		end
	end

	return string.format("%s}", slot2)
end

function Serialize(slot0, slot1, slot2, slot3)
	slot2 = slot2 or "\""
	slot3 = slot3 or "\""
	slot5 = "\n" .. string.rep("\t", slot1 or 0) .. "{\n"

	for slot9, slot10 in pairs(slot0) do
		slot11 = 0

		if type(slot9) == "string" then
			slot11 = 1
		end

		if type(slot10) == "table" then
			slot5 = slot5 .. slot4("\t", slot1 + 1) .. "[" .. slot4(slot2, slot11) .. slot9 .. slot4(slot3, slot11) .. "]" .. " = " .. Serialize(slot10, slot1 + 1) .. "\n"
		else
			slot12 = 0

			if type(slot10) == "string" then
				slot12 = 1
			end

			slot5 = slot5 .. slot4("\t", slot1 + 1) .. "[" .. slot4(slot2, slot11) .. slot9 .. slot4(slot3, slot11) .. "]" .. " = " .. slot4(slot2, slot12) .. slot10 .. slot4(slot3, slot12) .. ",\n"
		end
	end

	return slot5 .. slot4("\t", slot1) .. "},"
end

function getCCName(slot0)
	if type(slot0) == "userdata" then
		return tolua.type(slot0), slot0.__cname
	else
		return slot0.__cname
	end
end

function analyzeDesc(slot0, slot1, slot2, slot3)
	if slot0 == nil then
		return ""
	end

	slot7 = slot3 or 16

	if string.find(slot0, "%b{}") == nil then
		slot4 = richtext(slot4, tranformC3bTostr(slot1 or 302), slot2 or 16)
	else
		while string.find(slot4, "%b{}") ~= nil do
			slot8, slot9 = string.find(slot4, "%b{}")
			slot11, slot12 = string.find(string.sub(slot4, slot8 + 1, slot9 - 1), "|")
			slot13 = nil
			slot4 = string.gsub(slot4, "%b{}", (slot11 == nil or slot12 == nil or richtext(string.sub(slot10, slot12 + 1, #slot10), tranformC3bTostr(tonumber(string.sub(slot10, 1, slot11 - 1))), slot6)) and richtext(slot10, tranformC3bTostr(slot7), slot6), 1)
		end
	end

	return richtext(slot4, tranformC3bTostr(slot5), slot6)
end

function richtext(slot0, slot1, slot2)
	return string.format("<div fontsize=%s fontcolor=%s>%s</div>", slot2 or 26, slot1 or tranformC3bTostr(10), string.gsub(slot0 or "", "\\n", "\n"))
end

function readBinaryFile(slot0)
	if not cc.FileUtils:getInstance():isFileExist(slot0) then
		return ""
	end

	slot1 = assert(io.open(slot0, "rb"))

	slot1:close()

	return slot1:read("*all")
end

function writeBinaryFile(slot0, slot1)
	slot2 = assert(io.open(slot0, "wb"))

	slot2:write(slot1)
	slot2:close()
end

function copyFileTo(slot0, slot1)
	if not cc.FileUtils:getInstance():isFileExist(slot1) and cc.FileUtils:getInstance():isFileExist(slot0) then
		slot2 = assert(io.open(slot0, "rb"))

		slot2:close()

		slot2 = assert(io.open(slot1, "wb"))

		slot2:write(slot2:read("*all"))
		slot2:close()

		return true
	end

	return false
end

function getNorKey(...)
	slot2 = ""

	for slot6 = 1, #{
		...
	} do
		if slot2 ~= "" then
			slot2 = slot2 .. "_"
		end

		slot2 = slot2 .. slot0[slot6]
	end

	return slot2
end

function serverId(slot0)
	if slot0 and string.find(slot0, "_") then
		return string.sub(slot0, string.find(slot0, "_") + 1, string.len(slot0))
	else
		return 0
	end
end
