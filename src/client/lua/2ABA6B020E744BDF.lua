slot0, slot1, slot2, slot3 = nil
slot4 = require
slot5, slot6, slot7, slot8 = nil
slot7 = (not loadstring or loadstring) and load
slot9 = setfenv or function (slot0, slot1)
	slot2 = 1

	while true do
		if debug.getupvalue(slot0, slot2) == "_ENV" then
			debug.upvaluejoin(slot0, slot2, function ()
				return uv0
			end, 1)

			break
		elseif not slot3 then
			break
		end

		slot2 = slot2 + 1
	end

	return slot0
end
slot10 = {}
slot11 = nil

if LuaDebugTool then
	slot11 = LuaDebugTool
elseif CS and CS.LuaDebugTool then
	slot11 = CS.LuaDebugTool
end

slot12 = slot11
slot13 = slot7
slot14 = debug.getinfo

function slot15()
	slot0 = _G
	slot1 = require("string")
	slot2 = require("math")
	slot4 = require("socket.core")

	function slot4.connect4(slot0, slot1, slot2, slot3)
		return uv0.connect(slot0, slot1, slot2, slot3, "inet")
	end

	function slot4.connect6(slot0, slot1, slot2, slot3)
		return uv0.connect(slot0, slot1, slot2, slot3, "inet6")
	end

	if not slot4.connect then
		function slot4.connect(slot0, slot1, slot2, slot3)
			slot4, slot5 = uv0.tcp()

			if not slot4 then
				return nil, slot5
			end

			if slot2 then
				slot6, slot7 = slot4:bind(slot2, slot3, -1)

				if not slot6 then
					return nil, slot7
				end
			end

			slot6, slot7 = slot4:connect(slot0, slot1)

			if not slot6 then
				return nil, slot7
			end

			return slot4
		end
	end

	function slot4.bind(slot0, slot1, slot2)
		if slot0 == "*" then
			slot0 = "0.0.0.0"
		end

		slot3, slot4 = uv0.dns.getaddrinfo(slot0)

		if not slot3 then
			return nil, slot4
		end

		slot5, slot6 = nil
		slot4 = "no info on address"

		for slot10, slot11 in uv1.ipairs(slot3) do
			if slot11.family == "inet" then
				slot5, slot4 = uv0.tcp4()
			else
				slot5, slot4 = uv0.tcp6()
			end

			if not slot5 then
				return nil, slot4
			end

			slot5:setoption("reuseaddr", true)

			slot12, slot4 = slot5:bind(slot11.addr, slot1)

			if not slot12 then
				slot5:close()
			else
				slot12, slot4 = slot5:listen(slot2)

				if not slot12 then
					slot5:close()
				else
					return slot5
				end
			end
		end

		return nil, slot4
	end

	slot4.try = slot4.newtry()

	function slot4.choose(slot0)
		return function (slot0, slot1, slot2)
			if uv0.type(slot0) ~= "string" then
				slot2 = slot1
				slot1 = slot0
				slot0 = "default"
			end

			if not uv1[slot0 or "nil"] then
				uv0.error("unknown key (" .. uv0.tostring(slot0) .. ")", 3)
			else
				return slot3(slot1, slot2)
			end
		end
	end

	slot5 = {}
	slot6 = {}
	slot4.sourcet = slot5
	slot4.sinkt = slot6
	slot4.BLOCKSIZE = 2048

	slot6["close-when-done"] = function (slot0)
		return uv0.setmetatable({
			getfd = function ()
				return uv0:getfd()
			end,
			dirty = function ()
				return uv0:dirty()
			end
		}, {
			__call = function (slot0, slot1, slot2)
				if not slot1 then
					uv0:close()

					return 1
				else
					return uv0:send(slot1)
				end
			end
		})
	end

	slot6["keep-open"] = function (slot0)
		return uv0.setmetatable({
			getfd = function ()
				return uv0:getfd()
			end,
			dirty = function ()
				return uv0:dirty()
			end
		}, {
			__call = function (slot0, slot1, slot2)
				if slot1 then
					return uv0:send(slot1)
				else
					return 1
				end
			end
		})
	end

	slot6.default = slot6["keep-open"]
	slot4.sink = slot4.choose(slot6)

	slot5["by-length"] = function (slot0, slot1)
		return uv0.setmetatable({
			getfd = function ()
				return uv0:getfd()
			end,
			dirty = function ()
				return uv0:dirty()
			end
		}, {
			__call = function ()
				if uv0 <= 0 then
					return nil
				end

				slot1, slot2 = uv3:receive(uv1.min(uv2.BLOCKSIZE, uv0))

				if slot2 then
					return nil, slot2
				end

				uv0 = uv0 - uv4.len(slot1)

				return slot1
			end
		})
	end

	slot5["until-closed"] = function (slot0)
		slot1 = nil

		return uv0.setmetatable({
			getfd = function ()
				return uv0:getfd()
			end,
			dirty = function ()
				return uv0:dirty()
			end
		}, {
			__call = function ()
				if uv0 then
					return nil
				end

				slot0, slot1, slot2 = uv1:receive(uv2.BLOCKSIZE)

				if not slot1 then
					return slot0
				elseif slot1 == "closed" then
					uv1:close()

					uv0 = 1

					return slot2
				else
					return nil, slot1
				end
			end
		})
	end

	slot5.default = slot5["until-closed"]
	slot4.source = slot4.choose(slot5)

	return slot4
end

slot17 = print
slot18, slot19 = nil
slot20 = (function ()
	slot0 = require("math")
	slot1 = require("string")
	slot2 = require("table")
	slot3 = nil
	slot5 = {
		encodeString = function (slot0)
			return tostring(slot0):gsub(".", function (slot0)
				return uv0[slot0]
			end)
		end
	}
	slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15 = nil

	function slot6(slot0, slot1)
		slot2 = {}
		slot3 = uv0.len(slot0)

		assert(uv0.sub(slot0, slot1, slot1) == "[", "decode_scanArray called but array does not start at position " .. slot1 .. " in string:\n" .. slot0)

		repeat
			assert(uv1(slot0, slot1 + 1) <= slot3, "JSON String ended unexpectedly scanning array.")

			if uv0.sub(slot0, slot1, slot1) == "]" then
				return slot2, slot1 + 1
			end

			if slot4 == "," then
				slot1 = uv1(slot0, slot1 + 1)
			end

			assert(slot1 <= slot3, "JSON String ended unexpectedly scanning array.")

			uv2, slot1 = uv3.decode(slot0, slot1)

			uv4.insert(slot2, uv2)
		until false
	end

	function slot7(slot0, slot1)
		assert(uv0.sub(slot0, slot1, slot1 + 1) == "/*", "decode_scanComment called but comment does not start at position " .. slot1)
		assert(uv0.find(slot0, "*/", slot1 + 2) ~= nil, "Unterminated comment in string at " .. slot1)

		return slot2 + 2
	end

	function slot8(slot0, slot1)
		for slot7, slot8 in pairs({
			"true",
			"false",
			"null"
		}) do
			if uv0.sub(slot0, slot1, slot1 + uv0.len(slot8) - 1) == slot8 then
				return ({
					["false"] = false,
					["true"] = true
				})[slot8], slot1 + uv0.len(slot8)
			end
		end

		assert(nil, "Failed to scan constant from string " .. slot0 .. " at starting position " .. slot1)
	end

	function slot9(slot0, slot1)
		slot2 = slot1 + 1

		while uv0.find("+-0123456789.e", uv0.sub(slot0, slot2, slot2), 1, true) and slot2 <= uv0.len(slot0) do
			slot2 = slot2 + 1
		end

		slot5 = "return " .. uv0.sub(slot0, slot1, slot2 - 1)
		slot6 = uv1(slot5)

		assert(slot6, "Failed to scan number [ " .. slot5 .. "] in JSON string at position " .. slot1 .. " : " .. slot2)

		return slot6(), slot2
	end

	function slot10(slot0, slot1)
		slot2 = {}
		slot3 = uv0.len(slot0)
		slot4, slot5 = nil

		assert(uv0.sub(slot0, slot1, slot1) == "{", "decode_scanObject called but object does not start at position " .. slot1 .. " in string:\n" .. slot0)

		repeat
			assert(uv1(slot0, slot1 + 1) <= slot3, "JSON string ended unexpectedly while scanning object.")

			if uv0.sub(slot0, slot1, slot1) == "}" then
				return slot2, slot1 + 1
			end

			if slot6 == "," then
				slot1 = uv1(slot0, slot1 + 1)
			end

			assert(slot1 <= slot3, "JSON string ended unexpectedly scanning object.")

			slot4, slot8 = uv2.decode(slot0, slot1)

			assert(slot8 <= slot3, "JSON string ended unexpectedly searching for value of key " .. slot4)
			assert(uv1(slot0, slot1) <= slot3, "JSON string ended unexpectedly searching for value of key " .. slot4)
			assert(uv0.sub(slot0, slot1, slot1) == ":", "JSON object key-value assignment mal-formed at " .. slot1)
			assert(uv1(slot0, slot1 + 1) <= slot3, "JSON string ended unexpectedly searching for value of key " .. slot4)

			slot2[slot4], slot1 = uv2.decode(slot0, slot1)
		until false
	end

	setmetatable({
		["\\n"] = "\n",
		["\\t"] = "\t",
		["\\f"] = "",
		["\\r"] = "\r",
		["\\b"] = ""
	}, {
		__index = function (slot0, slot1)
			return uv0.sub(slot1, 2)
		end
	})

	function slot11(slot0, slot1)
		assert(slot1, "decode_scanString(..) called without start position")
		assert(uv0.sub(slot0, slot1, slot1) == "\"" or slot2 == "'", "decode_scanString called for a non-string")

		slot3 = {}
		slot4 = slot1
		slot5 = slot1

		while uv0.find(slot0, slot2, slot5 + 1) ~= slot5 + 1 do
			slot7, slot5 = uv0.find(slot0, "\\.", slot5 + 1)
			slot7, slot8 = uv0.find(slot0, slot2, slot5 + 1)

			if not slot7 or slot7 < slot4 then
				slot5 = slot8 - 1
				slot4 = slot7
			end

			uv1.insert(slot3, uv0.sub(slot0, slot6 + 1, slot4 - 1))

			if uv0.sub(slot0, slot4, slot5) == "\\u" then
				slot9 = uv0.sub(slot0, slot5 + 1, slot5 + 4)
				slot10 = tonumber(slot9, 16)

				assert(slot10, "String decoding failed: bad Unicode escape " .. slot9 .. " at position " .. slot4 .. " : " .. slot5 + 4)

				slot11 = nil

				uv1.insert(slot3, (slot10 >= 128 or uv0.char(slot10 % 128)) and (slot10 >= 2048 or uv0.char(192 + uv2.floor(slot10 / 64) % 32, 128 + slot10 % 64)) and uv0.char(224 + uv2.floor(slot10 / 4096) % 16, 128 + uv2.floor(slot10 / 64) % 64, 128 + slot10 % 64))
			else
				uv1.insert(slot3, uv3[uv0.sub(slot0, slot4, slot5)])
			end
		end

		uv1.insert(slot3, uv0.sub(slot5, slot5 + 1))
		assert(uv0.find(slot0, slot2, slot5 + 1), "String decoding failed: missing closing " .. slot2 .. " at position " .. slot5 .. "(for string at position " .. slot1 .. ")")

		return uv1.concat(slot3, ""), slot5 + 2
	end

	function slot12(slot0, slot1)
		while uv0.find(" \n\r\t", uv0.sub(slot0, slot1, slot1), 1, true) and slot1 <= uv0.len(slot0) do
			slot1 = slot1 + 1
		end

		return slot1
	end

	slot17 = {
		[""] = "\\f",
		[""] = "\\b",
		["\n"] = "\\n",
		["\r"] = "\\r",
		["\t"] = "\\t",
		["\\"] = "\\\\",
		["/"] = "\\/",
		["\""] = "\\\""
	}

	function slot14(slot0)
		if slot0 == uv0.EMPTY_ARRAY then
			return true, 0
		end

		if slot0 == uv0.EMPTY_OBJECT then
			return false
		end

		slot1 = 0

		for slot5, slot6 in pairs(slot0) do
			if type(slot5) == "number" and uv1.floor(slot5) == slot5 and slot5 >= 1 then
				if not uv2(slot6) then
					return false
				end

				slot1 = uv1.max(slot1, slot5)
			elseif slot5 == "n" then
				if slot6 ~= (slot0.n or #slot0) then
					return false
				end
			elseif uv2(slot6) then
				return false
			end
		end

		return true, slot1
	end

	function slot15(slot0)
		return type(slot0) == "string" or slot1 == "boolean" or slot1 == "number" or slot1 == "nil" or slot1 == "table" or slot1 == "function" and slot0 == uv0.null
	end

	return {
		EMPTY_ARRAY = {},
		EMPTY_OBJECT = {},
		encode = function (slot0)
			if slot0 == nil then
				return "null"
			end

			if type(slot0) == "string" then
				return "\"" .. uv0.encodeString(slot0) .. "\""
			end

			if slot1 == "number" or slot1 == "boolean" then
				return tostring(slot0)
			end

			if slot1 == "table" then
				slot2 = {}
				slot3, slot4 = uv1(slot0)

				if slot3 then
					for slot8 = 1, slot4 do
						uv2.insert(slot2, uv3.encode(slot0[slot8]))
					end
				else
					for slot8, slot9 in pairs(slot0) do
						if uv4(slot8) and uv4(slot9) then
							uv2.insert(slot2, "\"" .. uv0.encodeString(slot8) .. "\":" .. uv3.encode(slot9))
						end
					end
				end

				if slot3 then
					return "[" .. uv2.concat(slot2, ",") .. "]"
				else
					return "{" .. uv2.concat(slot2, ",") .. "}"
				end
			end

			if slot1 == "function" and slot0 == uv3.null then
				return "null"
			end

			assert(false, "encode attempt to encode unsupported type " .. slot1 .. ":" .. tostring(slot0))
		end,
		decode = function (slot0, slot1)
			assert(uv0(slot0, slot1 and slot1 or 1) <= uv1.len(slot0), "Unterminated JSON encoded object found at position in [" .. slot0 .. "]")

			if uv1.sub(slot0, slot1, slot1) == "{" then
				return uv2(slot0, slot1)
			end

			if slot2 == "[" then
				return uv3(slot0, slot1)
			end

			if uv1.find("+-0123456789.e", slot2, 1, true) then
				return uv4(slot0, slot1)
			end

			if slot2 == "\"" or slot2 == "'" then
				return uv5(slot0, slot1)
			end

			if uv1.sub(slot0, slot1, slot1 + 1) == "/*" then
				return uv6.decode(slot0, uv7(slot0, slot1))
			end

			return uv8(slot0, slot1)
		end,
		null = function ()
			return uv0.null
		end
	}
end)()
slot21 = {
	StepIn = false,
	StepInLevel = 0,
	serVarLevel = 4,
	isFoxGloryProject = false,
	StepNext = false,
	version = "0.9.3",
	isHook = true,
	isDebugPrint = true,
	StepNextLevel = 0,
	isProntToConsole = 1,
	currentFileName = "",
	Run = true,
	DebugLuaFie = "",
	StepOut = false,
	hookType = "lrc",
	fileMaps = {},
	breakInfos = {},
	pathCachePaths = {},
	splitFilePaths = {},
	event = {
		C2S_StepOutResponse = 13,
		C2S_SerVar = 25,
		S2C_SerVar = 24,
		C2S_NextResponseOver = 9,
		S2C_ReqVar = 5,
		C2S_DebugXpCall = 20,
		C2S_LuaPrint = 14,
		S2C_SetBreakPoints = 1,
		C2S_ReLoadFile = 27,
		S2C_DebugClose = 21,
		C2S_ReqVar = 6,
		S2C_NextRequest = 7,
		C2S_LoadLuaScript = 18,
		C2S_StepInResponse = 11,
		S2C_StepOutRequest = 12,
		C2S_NextResponse = 8,
		C2S_SetBreakPoints = 2,
		S2C_LoadLuaScript = 16,
		S2C_StepInRequest = 10,
		S2C_ReLoadFile = 26,
		C2S_HITBreakPoint = 4,
		S2C_RUN = 3,
		C2S_SetSocketName = 17
	}
}
slot22 = nil
slot23 = coroutine.resume

function coroutine.resume(slot0, ...)
	if uv0.isHook and coroutine.status(slot0) ~= "dead" then
		debug.sethook(slot0, uv1, "lrc")
	end

	return uv2(slot0, ...)
end

slot24 = coroutine.wrap

function coroutine.wrap(slot0, slot1)
	return uv0(function ()
		debug.sethook(uv0, "lrc")

		return uv1()
	end)
end

function print(...)
	if uv0.isProntToConsole == 1 or uv0.isProntToConsole == 3 then
		uv1(...)
	end

	if (uv0.isProntToConsole == 1 or uv0.isProntToConsole == 2) and uv2 then
		slot1 = ""

		if #{
			...
		} == 0 then
			slot0 = {
				"nil"
			}
		end

		for slot5, slot6 in pairs(slot0) do
			slot1 = slot1 .. tostring(slot6) .. "\t"
		end

		uv2:send(uv4.encode({
			event = uv0.event.C2S_LuaPrint,
			data = {
				type = 1,
				msg = uv3.encode(slot1)
			}
		}) .. "__debugger_k0204__")
	end
end

function luaIdePrintWarn(...)
	if uv0.isProntToConsole == 1 or uv0.isProntToConsole == 3 then
		uv1(...)
	end

	if (uv0.isProntToConsole == 1 or uv0.isProntToConsole == 2) and uv2 then
		slot1 = ""

		if #{
			...
		} == 0 then
			slot0 = {
				"nil"
			}
		end

		for slot5, slot6 in pairs(slot0) do
			slot1 = slot1 .. tostring(slot6) .. "\t"
		end

		uv2:send(uv4.encode({
			event = uv0.event.C2S_LuaPrint,
			data = {
				type = 2,
				msg = uv3.encode(slot1)
			}
		}) .. "__debugger_k0204__")
	end
end

function luaIdePrintErr(...)
	if uv0.isProntToConsole == 1 or uv0.isProntToConsole == 3 then
		uv1(...)
	end

	if (uv0.isProntToConsole == 1 or uv0.isProntToConsole == 2) and uv2 then
		slot1 = ""

		if #{
			...
		} == 0 then
			slot0 = {
				"nil"
			}
		end

		for slot5, slot6 in pairs(slot0) do
			slot1 = slot1 .. tostring(slot6) .. "\t"
		end

		uv2:send(uv4.encode({
			event = uv0.event.C2S_LuaPrint,
			data = {
				type = 3,
				msg = uv3.encode(slot1)
			}
		}) .. "__debugger_k0204__")
	end
end

function slot25(slot0, slot1)
	slot2 = string.find(slot0, slot1, 1)

	while slot2 do
		if not string.find(slot0, slot1, slot2 + 1) then
			break
		else
			slot2 = slot3
		end
	end

	return slot2
end

function slot26(slot0)
	slot1, slot2 = string.find(slot0, "/%.%./")

	if slot1 then
		slot3 = string.sub(slot0, 1, slot1 - 1)

		return uv1(string.sub(slot3, 1, uv0(slot3, "/") - 1) .. string.sub(slot0, slot2))
	else
		return slot0
	end
end

function slot27(slot0)
	slot1, slot2 = nil

	if slot0:gsub("/.\\", "/"):gsub("\\", "/"):gsub("//", "/"):find("@") == 1 then
		slot0 = slot0:sub(2)
	end

	if slot0:find("%./") == 1 then
		slot0 = slot0:sub(3)
	end

	slot4 = string.len(uv0(slot0))
	slot5 = {
		".lua",
		".lua.txt",
		".txt",
		".bytes"
	}

	table.sort(slot5, function (slot0, slot1)
		return string.len(slot1) < string.len(slot0)
	end)

	for slot10, slot11 in ipairs(slot5) do
		table.insert({}, string.len(slot11))
	end

	slot7 = string.len(slot0)

	for slot11, slot12 in ipairs(slot5) do
		if string.sub(slot0, slot7 - slot6[slot11] + 1) == slot12 then
			slot0 = string.sub(slot0, 1, slot7 - slot6[slot11])

			break
		end
	end

	if uv1(slot0, "/") then
		slot0 = string.sub(slot0, 1, slot8) .. string.sub(slot0, slot8 + 1)
	elseif not uv1(slot0, "%.") then
		slot1 = slot0
		slot2 = ""
	else
		slot0 = string.sub(slot0, 1, slot8):gsub("%.", "/") .. string.sub(slot0, slot8 + 1)
	end

	return slot0, slot2, slot1
end

function slot28(slot0, slot1)
	slot0 = tostring(slot0)

	if tostring(slot1) == "" then
		return false
	end

	slot3 = {}

	for slot7, slot8 in function ()
		return string.find(uv0, uv1, uv2, true)
	end, nil, nil do
		table.insert(slot3, string.sub(slot0, 0, slot7 - 1))

		slot2 = slot8 + 1
	end

	table.insert(slot3, string.sub(slot0, slot2))

	return slot3
end

function slot29(slot0)
	return string.gsub(string.gsub(slot0, "^[ \t\n\r]+", ""), "[ \t\n\r]+$", "")
end

function slot30(slot0, slot1, slot2)
	if type(slot2) ~= "number" then
		slot2 = 3
	end

	slot3 = {}

	function slot5(slot0)
		if type(slot0) == "string" then
			slot0 = "\"" .. slot0 .. "\""
		end

		return tostring(slot0)
	end

	print("dump from: " .. uv1(uv0(debug.traceback("", 2), "\n")[3]))

	slot11 = slot1
	slot12 = "- "

	;(function (slot0, slot1, slot2, slot3, slot4)
		slot5 = ""

		if type(slot4) == "number" then
			slot5 = string.rep(" ", slot4 - string.len(uv0(slot1 or "<var>")))
		end

		if type(slot0) ~= "table" then
			uv1[#uv1 + 1] = string.format("%s%s%s = %s", slot2, uv0(slot1), slot5, uv0(slot0))
		elseif uv2[slot0] then
			uv1[#uv1 + 1] = string.format("%s%s%s = *REF*", slot2, slot1, slot5)
		else
			uv2[slot0] = true

			if uv3 < slot3 then
				uv1[#uv1 + 1] = string.format("%s%s = *MAX NESTING*", slot2, slot1)
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
	end)(slot0, slot11, slot12, 1)

	for slot11, slot12 in ipairs({}) do
		print(slot12)
	end
end

function slot31(slot0)
	slot2 = nil

	if type(slot0) == "userdata" then
		if uv0.isFoxGloryProject then
			return "userdata", slot1
		else
			return tostring(slot0), slot1
		end
	elseif slot1 == "table" or slot1 == "function" or slot1 == "boolean" then
		xpcall(function ()
			uv0 = tostring(uv1)
		end, function ()
			uv0 = uv1
		end)

		return slot1, slot1
	elseif slot1 == "number" or slot1 == "string" then
		return slot0, slot1
	else
		return tostring(slot0), slot1
	end
end

function slot32(slot0, slot1)
	slot2, slot2 = uv0(slot1)
	slot4, slot5 = uv0(slot0)

	if slot2 == nil then
		-- Nothing
	end

	return {
		name = slot4,
		valueType = slot3,
		valueStr = uv1.encode(slot2)
	}
end

function slot33(slot0)
	slot1 = 1
	slot2 = {}

	while true do
		slot3, slot4 = debug.getlocal(slot0, slot1)

		if not slot3 then
			break
		end

		if slot3 ~= "(*temporary)" then
			slot2[slot3] = slot4
		end

		slot1 = slot1 + 1
	end

	slot3 = uv0(slot0, "f").func
	slot1 = 1
	slot4 = {}

	while slot3 do
		slot5, slot6 = debug.getupvalue(slot3, slot1)

		if not slot5 then
			break
		end

		if slot5 == "_ENV" then
			slot4._ENV_ = slot6
		else
			slot4[slot5] = slot6
		end

		slot1 = slot1 + 1
	end

	return {
		locals = slot2,
		ups = slot4
	}
end

function slot2(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}
	slot6 = 0

	for slot10 = slot0, 100 do
		slot12 = true

		if slot10 == slot0 then
			if uv0(slot10).source:find(uv1.DebugLuaFie) then
				return
			end

			if slot13 == "=[C]" then
				slot12 = false
			end
		end

		if not slot11 then
			break
		end

		if slot12 then
			slot13, slot14, slot15 = uv2(slot11.source)
			slot6 = slot10

			table.insert(slot3, {
				src = slot13,
				scoreName = slot11.name,
				currentline = slot11.currentline,
				linedefined = slot11.linedefined,
				what = slot11.what,
				nameWhat = slot11.namewhat
			})
			table.insert(slot4, uv3(slot10 + 1))
			table.insert(slot5, slot11.func)
		end

		if slot11.what == "main" then
			break
		end
	end

	slot7 = {
		stack = slot3,
		vars = slot4,
		funcs = slot5
	}
	slot8 = {
		stack = slot7.stack,
		vars = slot7.vars,
		funcs = slot7.funcs,
		event = slot1,
		funcsLength = #slot7.funcs,
		upFunc = uv0(slot0 - 3, "f").func
	}
	uv1.currentTempFunc = slot8.funcs[1]

	return slot8
end

slot34 = nil

function slot35()
	if jit and uv0.debugLuaType ~= "jit" then
		print("当前luajit版本为: " .. jit.version .. " 请使用LuaDebugjit 进行调试!")
	end

	if uv1 then
		slot0, slot1 = uv1:receive()

		if uv0.isLaunch and slot1 == "closed" then
			os.exit()
		end

		if slot0 then
			if uv2.decode(slot0).event == uv0.event.S2C_SetBreakPoints then
				uv3(slot2.data)
			elseif slot2.event == uv0.event.S2C_LoadLuaScript then
				uv0.loadScriptBody = slot2.data

				uv4()
				uv5(uv1, uv0.event.C2S_LoadLuaScript, uv0.loadScriptBody)
			elseif slot2.event == uv0.event.S2C_ReLoadFile then
				uv0.reLoadFileBody = slot2.data
				uv0.isReLoadFile = false
				uv0.reLoadFileBody.isReLoad = uv6(uv0.reLoadFileBody)

				print("重载结果:", uv0.reLoadFileBody.isReLoad)

				uv0.reLoadFileBody.script = nil

				uv5(uv1, uv0.event.C2S_ReLoadFile, {
					stack = uv0.reLoadFileBody
				})
			end
		end
	end
end

function slot36(slot0)
	if uv0.splitFilePaths[slot0] then
		return uv0.splitFilePaths[slot0]
	end

	slot2 = {}

	for slot6, slot7 in function ()
		return string.find(uv0, "/", uv1, true)
	end, nil, nil do
		table.insert(slot2, string.sub(slot0, 0, slot6 - 1))

		slot1 = slot7 + 1
	end

	table.insert(slot2, string.sub(slot0, slot1))

	uv0.splitFilePaths[slot0] = slot2

	return slot2
end

function slot34(slot0)
	slot1 = uv0.breakInfos

	for slot5, slot6 in ipairs(slot0) do
		slot6.fileName = string.lower(slot6.fileName)
		slot6.serverPath = string.lower(slot6.serverPath)

		if not slot1[slot6.fileName] then
			slot1[slot6.fileName] = {}
			slot7 = slot1[slot6.fileName]
		end

		if not slot6.breakDatas or #slot6.breakDatas == 0 then
			slot7[slot6.serverPath] = nil
		else
			if not slot7[slot6.serverPath] then
				slot7[slot6.serverPath] = {
					pathNames = uv1(slot6.serverPath),
					hitCounts = {}
				}
			end

			for slot13, slot14 in ipairs(slot6.breakDatas) do
				if slot14.hitCondition and slot14.hitCondition ~= "" then
					slot14.hitCondition = tonumber(slot14.hitCondition)
				else
					slot14.hitCondition = 0
				end

				if not slot8.hitCounts[slot14.line] then
					slot8.hitCounts[slot14.line] = 0
				end
			end

			slot8.lines = {
				[slot14.line] = slot14
			}

			for slot13, slot14 in pairs(slot8.hitCounts) do
				if not slot9[slot13] then
					slot8.hitCounts[slot13] = nil
				end
			end
		end

		for slot12, slot13 in pairs(slot7) do
			slot8 = 0 + 1
		end

		if slot8 == 0 then
			slot1[slot6.fileName] = nil
		end
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		slot2 = true

		break
	end

	if slot2 then
		if not uv0.isHook then
			debug.sethook(uv2, "lrc")
		end

		uv0.isHook = true
	else
		if uv0.isHook then
			debug.sethook()
		end

		uv0.isHook = false
	end
end

function slot37(slot0)
	return uv0.breakInfos[slot0]
end

slot38 = "192.168.1.102"
slot39 = 7003

function slot8(slot0, slot1, slot2)
	slot0:send(uv0.encode({
		event = slot1,
		data = slot2
	}) .. "__debugger_k0204__")
end

function debugger_conditionStr(slot0, slot1, slot2)
	slot4, slot5 = xpcall(function ()
		slot0 = {}
		slot1 = uv0[1].locals

		if uv0[1].ups then
			for slot6, slot7 in pairs(slot2) do
				slot0[slot6] = slot7
			end
		end

		if slot1 then
			for slot6, slot7 in pairs(slot1) do
				slot0[slot6] = slot7
			end
		end

		setmetatable(slot0, {
			__index = _G
		})

		slot3 = uv1("return " .. uv2)

		uv3(slot3, slot0)

		return slot3()
	end, function (slot0)
		print(slot0)
	end)

	if slot4 and slot5 then
		slot2()
	end
end

function slot5()
	slot1, slot2 = xpcall(function ()
		slot0 = uv0.loadScriptBody.script

		if uv0.loadScriptBody.isBreak then
			slot1 = {
				_G = _G,
				[slot10] = slot11
			}
			slot2 = uv0.loadScriptBody.frameId
			slot3 = uv0.currentDebuggerData.funcs[slot2]
			slot4 = uv0.currentDebuggerData.vars[slot2]
			slot5 = slot4.locals

			for slot10, slot11 in pairs(slot4.ups) do
				-- Nothing
			end

			for slot10, slot11 in pairs(slot5) do
				slot1[slot10] = slot11
			end

			setmetatable(slot1, {
				__index = _G
			})

			slot7 = uv1(slot0)

			uv2(slot7, slot1)
			slot7()
		else
			uv1(slot0)()
		end
	end, function (slot0)
	end)
	uv0.loadScriptBody.script = nil

	if uv0.loadScriptBody.isBreak then
		uv0.serVarLevel = uv0.serVarLevel + 1
		uv0.currentDebuggerData = uv3(uv0.serVarLevel, uv0.event.C2S_HITBreakPoint)
		uv0.loadScriptBody.stack = uv0.currentDebuggerData.stack
	end

	uv0.loadScriptBody.complete = true
end

function slot40(slot0, slot1, slot2)
	if slot1 == -1 then
		return slot0
	elseif slot1 == 1 then
		return tonumber(slot0)
	elseif slot1 == 2 then
		slot3 = nil

		for slot7, slot8 in pairs(slot2) do
			if (type(slot7) == "userdata" or slot9 == "table") and not uv0.isFoxGloryProject then
				if slot0 == tostring(slot7) then
					return slot7
				end

				break
			end
		end
	end
end

function slot41(slot0, slot1)
	slot2 = nil
	slot3 = uv0.serVarLevel + uv0.setVarBody.frameId
	slot4 = slot1.keys[1]
	slot5 = -1
	slot6 = -1
	slot7, slot8 = nil
	slot9 = 1
	slot10 = {}

	while true do
		slot11, slot12 = debug.getlocal(slot3, slot9)

		if not slot11 then
			break
		end

		if slot4 == slot11 then
			slot5 = slot9
			slot8 = slot12
		end

		if slot11 ~= "(*temporary)" then
			slot10[slot11] = slot12
		end

		slot9 = slot9 + 1
	end

	slot11 = uv1(slot3, "f").func
	slot9 = 1
	slot12 = {}

	while slot11 do
		slot13, slot14 = debug.getupvalue(slot11, slot9)

		if not slot13 then
			break
		end

		if slot5 == -1 and slot4 == slot13 then
			slot7 = slot11
			slot8 = slot14
			slot6 = slot9
		end

		if slot13 == "_ENV" then
			slot12._ENV_ = slot14
		else
			slot12[slot13] = slot14
		end

		slot9 = slot9 + 1
	end

	slot13 = {
		locals = slot10,
		ups = slot12
	}
	slot15, slot16 = xpcall(function ()
		slot0 = {}
		slot1 = uv0.locals

		if uv0.ups then
			for slot6, slot7 in pairs(slot2) do
				slot0[slot6] = slot7
			end
		end

		if slot1 then
			for slot6, slot7 in pairs(slot1) do
				slot0[slot6] = slot7
			end
		end

		setmetatable(slot0, {
			__index = _G
		})

		slot3 = uv1("return " .. uv2.value)

		uv3(slot3, slot0)

		uv4 = slot3()
	end, function (slot0)
		print(slot0, "============================")
	end)
	slot17 = 1

	if #slot1.keys == 1 then
		if slot5 ~= -1 then
			debug.setlocal(slot3, slot5, slot2)
		elseif slot7 ~= nil then
			debug.setupvalue(slot7, slot6, slot2)
		elseif _G[slot4] then
			_G[slot4] = slot2
		end
	else
		if not slot8 and _G[slot4] then
			slot8 = _G[slot4]
		end

		slot19 = slot8

		for slot23 = 2, slot18 - 1 do
			if slot19 then
				slot8 = slot8[uv4(slot1.keys[slot23], slot1.numberTypes[slot23], slot8)]
			end
		end

		if slot19 then
			slot8[uv4(slot1.keys[slot18], slot1.numberTypes[slot18], slot8)] = slot2
		end
	end

	slot1.varInfo = uv5(slot1.varName, slot2)
	uv0.serVarLevel = uv0.serVarLevel + 1
	uv0.currentDebuggerData = uv6(uv0.serVarLevel, uv0.event.C2S_HITBreakPoint)
end

function slot6()
	if uv0.isSetVar then
		uv0.isSetVar = false

		uv1(uv2, uv0.setVarBody)

		uv0.serVarLevel = uv0.serVarLevel + 1

		uv3(uv4, uv0.setVarBody)
		xpcall(uv5, function (slot0)
			print("设置变量", slot0)
		end)
	elseif uv0.isLoadLuaScript then
		uv0.isLoadLuaScript = false

		uv6()

		uv0.serVarLevel = uv0.serVarLevel + 1

		uv3(uv4, uv0.reLoadFileBody)
		xpcall(uv5, function (slot0)
			print("执行代码", slot0)
		end)
	elseif uv0.isReLoadFile then
		uv0.isReLoadFile = false
		uv0.reLoadFileBody.isReLoad = uv7(uv0.reLoadFileBody)

		print("重载结果:", uv0.reLoadFileBody.isReLoad)

		uv0.reLoadFileBody.script = nil
		uv0.serVarLevel = uv0.serVarLevel + 1

		uv3(uv4, uv0.reLoadFileBody)
		xpcall(uv5, function (slot0)
			print("重新加载文件", slot0)
		end)
	end
end

function slot42(slot0)
	if uv0.pathCachePaths[string.lower(slot0)] then
		uv0.currentLineFile = uv0.pathCachePaths[slot0]

		return uv0.pathCachePaths[slot0]
	end

	uv0.currentLineFile, slot2, slot3 = uv1(slot0)
	uv0.pathCachePaths[slot0] = slot3

	return slot3
end

function slot43(slot0, slot1)
	slot3 = {}

	for slot7 = 1, uv0.getUserDataInfo(slot1).Count do
		slot8 = slot2[slot7 - 1]

		table.insert(slot3, {
			csharp = true,
			name = slot8.name,
			valueType = slot8.valueType,
			valueStr = uv1.encode(slot8.valueStr),
			isValue = slot8.isValue
		})
	end

	return slot3
end

function slot44(slot0, slot1)
	slot3, slot4 = xpcall(function ()
		slot0 = uv0("return " .. uv1)

		uv2(slot0, uv3)

		uv4 = slot0()
	end, function (slot0)
		print(slot0, "====>")

		uv0 = nil
	end)

	return nil
end

function slot45(slot0, slot1, slot2)
	slot3 = ""

	for slot8 = slot2, #slot1 do
		if slot1[slot8] == "[metatable]" then
			-- Nothing
		elseif slot8 == slot2 then
			if string.find(slot9, "%.") then
				if slot3 == "" then
					slot8 = slot2 + 1
					slot0 = slot0[slot9]
				end

				if slot8 >= #slot1 then
					return slot2, slot0
				end

				return uv0(slot0, slot1, slot8)
			else
				slot3 = slot9
			end
		elseif string.find(slot9, "%[") then
			slot3 = slot3 .. slot9
		elseif type(slot9) == "string" then
			if string.find(slot9, "table:") or string.find(slot9, "userdata:") or string.find(slot9, "function:") then
				if slot3 ~= "" then
					if uv1(slot0, slot3) then
						for slot14, slot15 in pairs(slot0) do
							if (type(slot14) == "userdata" or slot16 == "table" or slot16 == "function") and uv2(slot14) == slot9 then
								slot0 = slot15

								break
							end
						end
					end

					slot3 = ""

					if slot8 == slot4 then
						return #slot1, slot0
					else
						return uv0(slot0, slot1, slot8 + 1)
					end
				else
					slot3 = slot3 .. "[\"" .. slot9 .. "\"]"
				end
			else
				slot3 = slot3 .. "[\"" .. slot9 .. "\"]"
			end
		else
			slot3 = slot3 .. "[" .. slot9 .. "]"
		end
	end

	return #slot1, uv1(slot0, slot3)
end

function slot46(slot0, slot1, slot2)
	if uv0.getCSharpValue(slot0, slot2[slot1]) then
		if slot1 == #slot2 then
			return #slot2, slot4
		else
			slot5, slot6 = uv1(slot4, slot1 + 1, slot2)

			if not slot6 then
				for slot11 = slot5, #slot2 do
					table.insert({}, slot2[slot11])
				end

				slot8, slot9 = debugger_searchVarByKeys(slot0, searckKeys, 1)

				return slot8, slot9
			else
				return slot5, slot6
			end
		end
	else
		return slot1, slot4
	end
end

function slot47(slot0, slot1, slot2)
	slot3, slot4 = uv0(slot0, slot2, 1)

	if not uv1 or not uv1.getCSharpValue or type(uv1.getCSharpValue) ~= "function" then
		return slot3, slot4
	end

	if slot4 then
		if slot3 == #slot1 then
			return slot3, slot4
		else
			slot5 = ""
			slot6 = #slot1
			slot8, slot9 = uv2(slot4, slot3 + 1, slot1)

			return slot8, slot9
		end
	else
		slot5 = {}

		for slot9 = 1, #slot2 - 1 do
			table.insert(slot5, slot1[slot9])
		end

		if #slot5 == 0 then
			return #slot1, nil
		end

		return uv3(slot0, slot1, slot5)
	end
end

function slot48(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	for slot10, slot11 in ipairs(slot6) do
		if slot1 == slot11 then
			return slot2
		end
	end

	slot10 = slot1

	table.insert(slot6, slot10)

	for slot10, slot11 in pairs(slot1) do
		slot12 = nil

		if type(slot10) == "string" then
			xpcall(function ()
				uv0 = uv1[uv2]
			end, function (slot0)
				uv0 = nil
			end)

			if slot12 == nil then
				xpcall(function ()
					if string.find(uv0, "__") then
						uv1 = uv2
					end
				end, function (slot0)
					uv0 = nil
				end)
			end
		end

		if slot12 then
			table.insert(slot2, uv0(slot10, slot12))

			if #slot2 > 10 then
				uv1(slot3, uv2.event.C2S_ReqVar, {
					isComplete = 0,
					variablesReference = slot4,
					debugSpeedIndex = slot5,
					vars = slot2
				})

				slot2 = {}
			end
		end
	end

	if getmetatable(slot1) then
		return uv3(slot0, slot7, slot2, slot3, slot4, slot5, slot6)
	else
		return slot2
	end
end

function slot49(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5 == "userdata" then
		if tolua and tolua.getpeer then
			slot0 = tolua.getpeer(slot0)
		else
			return slot1
		end
	end

	if slot0 == nil then
		return slot1
	end

	for slot9, slot10 in pairs(slot0) do
		table.insert(slot1, uv0(slot9, slot10))

		if #slot1 > 10 then
			uv1(slot2, uv2.event.C2S_ReqVar, {
				isComplete = 0,
				variablesReference = slot3,
				debugSpeedIndex = slot4,
				vars = slot1
			})

			slot1 = {}
		end
	end

	return slot1
end

function slot50(slot0, slot1, slot2, slot3)
	slot5 = {}
	slot7 = {}
	slot8 = nil

	if type(slot0) == "userdata" then
		slot8 = getmetatable(slot0)
		slot4 = uv0(slot0, {}, slot1, slot2, slot3, slot6)

		if uv1 then
			slot13 = slot2
			slot14 = slot3

			for slot13, slot14 in ipairs(uv2(slot1, slot0, slot13, slot14)) do
				if slot14.valueType == "System.Byte[]" and slot0[slot14.name] and type(slot0[slot14.name]) == "string" then
					table.insert(slot4, {
						valueType = "string",
						name = slot14.name,
						valueStr = uv3.encode(slot0[slot14.name])
					})
				else
					table.insert(slot4, slot14)
				end

				if #slot4 > 10 then
					uv4(slot1, uv5.event.C2S_ReqVar, {
						isComplete = 0,
						variablesReference = slot2,
						debugSpeedIndex = slot3,
						vars = slot4
					})

					slot4 = {}
				end
			end
		end
	else
		slot8 = getmetatable(slot0)
		slot4 = uv0(slot0, slot4, slot1, slot2, slot3, slot6)
	end

	if slot8 then
		slot4 = uv6(slot0, slot8, slot4, slot1, slot2, slot3, {})
	end

	uv4(slot1, uv5.event.C2S_ReqVar, {
		isComplete = 1,
		variablesReference = slot2,
		debugSpeedIndex = slot3,
		vars = slot4
	})
end

function slot51(slot0, slot1)
	slot2 = slot0.variablesReference
	slot3 = slot0.debugSpeedIndex
	slot4 = {}

	xpcall(function ()
		slot2 = uv0.keys
		slot3 = nil

		if uv0.type == 1 then
			slot3 = uv1.currentDebuggerData.vars[uv0.frameId + 1].locals
		elseif slot1 == 2 then
			slot3 = uv1.currentDebuggerData.vars[slot0 + 1].ups
		elseif slot1 == 3 then
			slot3 = _G
		end

		if #slot2 == 0 then
			uv2(slot3, uv3, uv4, uv5)

			return
		end

		slot4, slot5 = uv6(slot3, slot2, slot2)

		if slot5 then
			if type(slot5) == "table" or slot6 == "userdata" then
				uv2(slot5, uv3, uv4, uv5)
			else
				if slot6 == "function" then
					slot5 = tostring(slot5)
				end

				uv7(uv3, uv1.event.C2S_ReqVar, {
					isComplete = 1,
					variablesReference = uv4,
					debugSpeedIndex = uv5,
					vars = uv8.encode(slot5),
					varType = slot6
				})
			end
		else
			uv7(uv3, uv1.event.C2S_ReqVar, {
				isComplete = 1,
				varType = "nil",
				variablesReference = uv4,
				debugSpeedIndex = uv5,
				vars = {}
			})
		end
	end, function (slot0)
		uv0(uv1, uv2.event.C2S_ReqVar, {
			isComplete = 1,
			variablesReference = uv3,
			debugSpeedIndex = uv4,
			vars = {
				{
					isValue = false,
					name = "error",
					valueType = "string",
					valueStr = uv5.encode("无法获取属性值:" .. slot0 .. "->" .. debug.traceback("", 2))
				}
			}
		})
	end)
end

function slot52()
	uv0.Run = false
	uv0.StepIn = false
	uv0.StepNext = false
	uv0.StepOut = false
	uv0.StepNextLevel = 0
end

slot3 = coroutine.create(function (slot0)
	slot0 = uv0
	slot1 = nil
	slot2 = {}
	slot3 = nil

	while true do
		slot4, slot5 = slot0:receive()

		if slot5 == "closed" then
			if uv1.isLaunch then
				os.exit()
			else
				debug.sethook()
				coroutine.yield()
			end
		end

		if slot4 then
			slot6 = uv2.decode(slot4)
			slot8 = slot6.data

			if slot6.event == uv1.event.S2C_DebugClose then
				if uv1.isLaunch then
					os.exit()
				else
					debug.sethook()
					coroutine.yield()
				end
			elseif slot7 == uv1.event.S2C_SetBreakPoints then
				xpcall(function ()
					uv0(uv1)
				end, function (slot0)
					print(slot0)
				end)
			elseif slot7 == uv1.event.S2C_RUN then
				uv1.runTimeType = slot8.runTimeType
				uv1.isProntToConsole = slot8.isProntToConsole
				uv1.isFoxGloryProject = slot8.isFoxGloryProject
				uv1.isLaunch = slot8.isLaunch

				uv4()

				uv1.Run = true
				slot9 = coroutine.yield()
				uv1.serVarLevel = 4
				uv1.currentDebuggerData = slot9

				uv5(slot0, slot9.event, {
					stack = slot9.stack
				})
			elseif slot7 == uv1.event.S2C_ReqVar then
				uv6(slot8, slot0)
			elseif slot7 == uv1.event.S2C_NextRequest then
				uv4()

				uv1.StepNext = true
				uv1.StepNextLevel = 0
				slot9 = coroutine.yield()
				uv1.serVarLevel = 4
				uv1.currentDebuggerData = slot9

				uv5(slot0, slot9.event, {
					stack = slot9.stack
				})
			elseif slot7 == uv1.event.S2C_StepInRequest then
				uv4()

				uv1.StepIn = true
				slot9 = coroutine.yield()
				uv1.serVarLevel = 4
				uv1.currentDebuggerData = slot9

				uv5(slot0, slot9.event, {
					stack = slot9.stack,
					eventType = slot9.eventType
				})
			elseif slot7 == uv1.event.S2C_StepOutRequest then
				uv4()

				uv1.StepOut = true
				slot9 = coroutine.yield()
				uv1.serVarLevel = 4
				uv1.currentDebuggerData = slot9

				uv5(slot0, slot9.event, {
					stack = slot9.stack,
					eventType = slot9.eventType
				})
			elseif slot7 == uv1.event.S2C_LoadLuaScript then
				uv1.loadScriptBody = slot8
				uv1.isLoadLuaScript = true
				slot9 = coroutine.yield()

				uv5(slot0, uv1.event.C2S_LoadLuaScript, uv1.loadScriptBody)
			elseif slot7 == uv1.event.S2C_SerVar then
				uv1.isSetVar = true
				uv1.setVarBody = slot8
				slot9 = coroutine.yield()

				uv5(slot0, uv1.event.C2S_SerVar, {
					stack = slot9,
					eventType = slot9.eventType
				})
			elseif slot7 == uv1.event.S2C_ReLoadFile then
				uv1.isReLoadFile = true
				uv1.reLoadFileBody = slot8
				slot9 = coroutine.yield()

				uv5(slot0, uv1.event.C2S_ReLoadFile, {
					stack = slot9,
					eventType = slot9.eventType
				})
			end
		end
	end
end)

function slot22(slot0, slot1)
	if not uv0.isHook then
		return
	end

	if uv0.Run then
		if slot0 == "line" then
			slot2 = false

			for slot6, slot7 in pairs(uv0.breakInfos) do
				for slot11, slot12 in pairs(slot7) do
					if slot12.lines and slot12.lines[slot1] then
						slot2 = true

						break
					end
				end

				if slot2 then
					break
				end
			end

			if not slot2 then
				return
			end
		else
			uv0.currentFileName = nil
			uv0.currentTempFunc = nil

			return
		end
	end

	if uv0.StepOut then
		if slot0 == "line" or slot0 == "call" then
			return
		end

		slot2 = uv1(2, "f").func

		if uv0.currentDebuggerData.funcsLength == 1 then
			uv2()

			uv0.Run = true
		elseif uv0.currentDebuggerData.funcs[2] == slot2 then
			uv4(uv5, uv3(3, uv0.event.C2S_StepInResponse))
			uv6()
		end

		return
	end

	slot2 = nil

	if slot0 == "call" then
		if not uv0.Run then
			uv0.StepNextLevel = uv0.StepNextLevel + 1
		end

		if uv1(2, "S").source:find(uv0.DebugLuaFie) or slot4 == "=[C]" then
			return
		end

		uv0.currentFileName = uv7(slot4)
	elseif slot0 == "return" or slot0 == "tail return" then
		if not uv0.Run then
			uv0.StepNextLevel = uv0.StepNextLevel - 1
		end

		uv0.currentFileName = nil
	elseif slot0 == "line" then
		slot3 = false
		slot4 = nil

		if not uv0.currentFileName then
			if uv1(2, "S").source == "=[C]" or slot5:find(uv0.DebugLuaFie) then
				return
			end

			uv0.currentFileName = uv7(slot5)
		end

		slot6 = nil

		if uv0.breakInfos[uv0.currentFileName] then
			slot7 = false

			for slot11, slot12 in pairs(slot5) do
				if slot12.lines and slot13[slot1] then
					slot7 = true

					break
				end
			end

			if slot7 then
				slot9 = {
					[slot14] = 0
				}
				slot10 = nil

				for slot14, slot15 in pairs(slot5) do
					slot10 = slot15.hitCounts

					if slot15.lines and slot16[slot1] then
						slot6 = slot16[slot1]
						slot18 = #uv8(uv0.currentLineFile)
						slot19 = #slot15.pathNames
						slot20 = 0

						while true do
							if slot17[slot19] ~= slot8[slot18] then
								break
							else
								slot9[slot14] = slot9[slot14] + 1
							end

							slot20 = slot20 + 1

							if slot19 - 1 <= 0 or slot18 - 1 <= 0 then
								break
							end
						end

						if slot20 > 0 then
							break
						end

						if slot20 == 0 then
							slot6 = nil
						end
					else
						slot6 = nil
					end
				end

				if slot6 then
					slot11 = ""

					for slot16, slot17 in pairs(slot9) do
						if 0 < slot17 then
							slot12 = slot17
							slot11 = slot16
						end
					end

					if (#slot8 == 1 or slot13 > 1 and slot12 > 1) and slot11 ~= "" then
						slot15 = slot10[slot6.line] + 1
						slot10[slot6.line] = slot15

						if slot6.hitCondition <= slot15 then
							slot3 = true
						end
					end
				end
			end
		end

		if uv0.StepIn and uv3(3, uv0.event.C2S_NextResponse) then
			uv0.currentTempFunc = slot7.funcs[1]

			uv4(uv5, slot7)
			uv6()

			return
		end

		if uv0.StepNext and uv0.StepNextLevel <= 0 and uv3(3, uv0.event.C2S_NextResponse) then
			uv0.currentTempFunc = slot7.funcs[1]

			uv4(uv5, slot7)
			uv6()

			return
		end

		if slot3 then
			if slot6 and slot6.condition then
				debugger_conditionStr(slot6.condition, uv3(3, uv0.event.C2S_HITBreakPoint).vars, function ()
					uv0(uv1, uv2)
					uv3()
				end)
			else
				uv4(uv5, slot7)
				uv6()
			end
		end
	end
end

function slot1()
	if uv0(4, uv1.event.C2S_HITBreakPoint).stack and slot0.stack[1] then
		slot0.stack[1].isXpCall = true
	end

	uv2(uv3, slot0)
	uv4()
end

function slot54()
	slot0, slot1, uv2.DebugLuaFie = uv0(uv1(1).source)

	print(uv4)
	print(uv5)

	slot4 = uv3().connect(uv4, uv5)
	uv6 = slot4

	if slot4 then
		uv7 = uv3().connect(uv4, uv5)

		if uv7 then
			uv7:settimeout(0)
			uv8(uv7, uv2.event.C2S_SetSocketName, {
				name = "breakPointSocket"
			})
			uv8(slot4, uv2.event.C2S_SetSocketName, {
				name = "mainSocket",
				version = uv2.version
			})
			xpcall(function ()
				debug.sethook(uv0, "lrc")
			end, function (slot0)
				print("error:", slot0)
			end)

			if jit and uv2.debugLuaType ~= "jit" then
				print("error======================================================")
				print("当前luajit版本为: " .. jit.version .. " 请使用LuaDebugjit 进行调试!")
			end

			uv10(uv11, slot4)
		end
	end
end

function StartDebug(slot0, slot1, slot2)
	if not slot0 then
		print("error host nil")
	end

	if not slot1 then
		print("error prot nil")
	end

	if type(slot0) ~= "string" then
		print("error host not string")
	end

	if type(slot1) ~= "number" then
		print("error host not number")
	end

	uv0 = slot0
	uv1 = slot1

	xpcall(uv2, function (slot0)
		print(slot0)
	end)

	if isReLoad then
		xpcall(function ()
			uv0 = require("luaideReLoadFile")
		end, function ()
			print("左侧luaide按钮->打开luaIde最新调试文件所在文件夹->luaideReLoadFile.lua->拷贝到项目中")
			print("具体使用方式请看luaideReLoadFile中文件注释")

			function uv0()
				print("未实现代码重载")
			end
		end)
	end

	return uv4, uv5
end

slot10.__code = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"a",
	"b",
	"c",
	"d",
	"e",
	"f",
	"g",
	"h",
	"i",
	"j",
	"k",
	"l",
	"m",
	"n",
	"o",
	"p",
	"q",
	"r",
	"s",
	"t",
	"u",
	"v",
	"w",
	"x",
	"y",
	"z",
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"+",
	"/"
}
slot10.__decode = {}

for slot59, slot60 in pairs(slot10.__code) do
	slot10.__decode[string.byte(slot60, 1)] = slot59 - 1
end

function slot10.encode(slot0)
	slot1 = uv0.len(slot0)
	slot3 = {}
	slot4 = 1

	for slot8 = 1, slot1 - slot1 % 3, 3 do
		for slot16 = 1, 4 do
			slot3[slot4] = uv1.__code[math.floor((uv0.byte(slot0, slot8) * 65536 + uv0.byte(slot0, slot8 + 1) * 256 + uv0.byte(slot0, slot8 + 2)) / 2^((4 - slot16) * 6)) % 64 + 1]
			slot4 = slot4 + 1
		end
	end

	if slot2 == 1 then
		uv1.__left1(slot3, slot4, slot0, slot1)
	elseif slot2 == 2 then
		uv1.__left2(slot3, slot4, slot0, slot1)
	end

	return table.concat(slot3)
end

function slot10.__left2(slot0, slot1, slot2, slot3)
	slot6 = uv0.byte(slot2, slot3 + 1) * 1024 + uv0.byte(slot2, slot3 + 2) * 4
	slot0[slot1] = uv1.__code[math.floor(slot6 / 4096) % 64 + 1]
	slot0[slot1 + 1] = uv1.__code[math.floor(slot6 / 64) % 64 + 1]
	slot0[slot1 + 2] = uv1.__code[slot6 % 64 + 1]
	slot0[slot1 + 3] = "="
end

function slot10.__left1(slot0, slot1, slot2, slot3)
	slot4 = uv0.byte(slot2, slot3 + 1) * 16
	slot0[slot1] = uv1.__code[math.floor(slot4 / 64) % 64 + 1]
	slot0[slot1 + 1] = uv1.__code[slot4 % 64 + 1]
	slot0[slot1 + 2] = "="
	slot0[slot1 + 3] = "="
end

function slot10.decode(slot0)
	slot2 = 0

	if uv0.sub(slot0, uv0.len(slot0) - 1) == "==" then
		slot2 = 2
		slot1 = slot1 - 4
	elseif uv0.sub(slot0, slot1) == "=" then
		slot2 = 1
		slot1 = slot1 - 4
	end

	slot3 = {
		[slot4] = uv0.char(math.floor(slot14 / 256) % 256),
		[slot4 + 1] = uv0.char(slot14 % 256),
		[slot4 + 2] = uv0.char(slot14 % 256)
	}
	slot4 = 1
	slot5 = uv1.__decode

	for slot9 = 1, slot1, 4 do
		slot14 = math.floor((slot5[uv0.byte(slot0, slot9)] * 262144 + slot5[uv0.byte(slot0, slot9 + 1)] * 4096 + slot5[uv0.byte(slot0, slot9 + 2)] * 64 + slot5[uv0.byte(slot0, slot9 + 3)]) / 256)
		slot4 = slot4 + 3
	end

	if slot2 == 1 then
		uv1.__decodeLeft1(slot3, slot4, slot0, slot1)
	elseif slot2 == 2 then
		uv1.__decodeLeft2(slot3, slot4, slot0, slot1)
	end

	return table.concat(slot3)
end

function slot10.__decodeLeft1(slot0, slot1, slot2, slot3)
	slot4 = uv0.__decode
	slot8 = slot4[uv1.byte(slot2, slot3 + 1)] * 4096 + slot4[uv1.byte(slot2, slot3 + 2)] * 64 + slot4[uv1.byte(slot2, slot3 + 3)]
	slot0[slot1] = uv1.char(math.floor(slot8 / 1024) % 256)
	slot0[slot1 + 1] = uv1.char(math.floor(slot8 / 4) % 256)
end

function slot10.__decodeLeft2(slot0, slot1, slot2, slot3)
	slot4 = uv0.__decode
	slot0[slot1] = uv1.char(math.floor((slot4[uv1.byte(slot2, slot3 + 1)] * 64 + slot4[uv1.byte(slot2, slot3 + 2)]) / 16))
end

return StartDebug
