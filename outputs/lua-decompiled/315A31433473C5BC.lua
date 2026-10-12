slot0 = require("math")
slot1 = require("string")
slot2 = require("table")

module("json")

slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13 = nil

function encode(slot0)
	if slot0 == nil then
		return "null"
	end

	if uv0.type(slot0) == "string" then
		return "\"" .. uv1(slot0) .. "\""
	end

	if slot1 == "number" or slot1 == "boolean" then
		return uv0.tostring(slot0)
	end

	if slot1 == "table" then
		slot2 = {}
		slot3, slot4 = uv2(slot0)

		if slot3 then
			for slot8 = 1, slot4 do
				uv3.insert(slot2, encode(slot0[slot8]))
			end
		else
			for slot8, slot9 in uv0.pairs(slot0) do
				if uv4(slot8) and uv4(slot9) then
					uv3.insert(slot2, "\"" .. uv1(slot8) .. "\":" .. encode(slot9))
				end
			end
		end

		if slot3 then
			return "[" .. uv3.concat(slot2, ",") .. "]"
		else
			return "{" .. uv3.concat(slot2, ",") .. "}"
		end
	end

	if slot1 == "function" and slot0 == null then
		return "null"
	end

	uv0.assert(false, "encode attempt to encode unsupported type " .. slot1 .. ":" .. uv0.tostring(slot0))
end

function decode(slot0, slot1)
	uv1.assert(uv0(slot0, slot1 and slot1 or 1) <= uv2.len(slot0), "Unterminated JSON encoded object found at position in [" .. slot0 .. "]")

	if uv2.sub(slot0, slot1, slot1) == "{" then
		return uv3(slot0, slot1)
	end

	if slot2 == "[" then
		return uv4(slot0, slot1)
	end

	if uv2.find("+-0123456789.e", slot2, 1, true) then
		return uv5(slot0, slot1)
	end

	if slot2 == "\"" or slot2 == "'" then
		return uv6(slot0, slot1)
	end

	if uv2.sub(slot0, slot1, slot1 + 1) == "/*" then
		return decode(slot0, uv7(slot0, slot1))
	end

	return uv8(slot0, slot1)
end

function null()
	return null
end

function slot4(slot0, slot1)
	slot2 = {}
	slot3 = uv0.len(slot0)

	uv1.assert(uv0.sub(slot0, slot1, slot1) == "[", "decode_scanArray called but array does not start at position " .. slot1 .. " in string:\n" .. slot0)

	repeat
		uv1.assert(uv2(slot0, slot1 + 1) <= slot3, "JSON String ended unexpectedly scanning array.")

		if uv0.sub(slot0, slot1, slot1) == "]" then
			return slot2, slot1 + 1
		end

		if slot4 == "," then
			slot1 = uv2(slot0, slot1 + 1)
		end

		uv1.assert(slot1 <= slot3, "JSON String ended unexpectedly scanning array.")

		object, slot1 = decode(slot0, slot1)

		uv3.insert(slot2, object)
	until false
end

function slot5(slot0, slot1)
	uv0.assert(uv1.sub(slot0, slot1, slot1 + 1) == "/*", "decode_scanComment called but comment does not start at position " .. slot1)
	uv0.assert(uv1.find(slot0, "*/", slot1 + 2) ~= nil, "Unterminated comment in string at " .. slot1)

	return slot2 + 2
end

function slot6(slot0, slot1)
	for slot7, slot8 in uv0.pairs({
		"true",
		"false",
		"null"
	}) do
		if uv1.sub(slot0, slot1, slot1 + uv1.len(slot8) - 1) == slot8 then
			return ({
				["false"] = false,
				["true"] = true
			})[slot8], slot1 + uv1.len(slot8)
		end
	end

	uv0.assert(nil, "Failed to scan constant from string " .. slot0 .. " at starting position " .. slot1)
end

function slot7(slot0, slot1)
	slot2 = slot1 + 1

	while uv0.find("+-0123456789.e", uv0.sub(slot0, slot2, slot2), 1, true) and slot2 <= uv0.len(slot0) do
		slot2 = slot2 + 1
	end

	slot5 = "return " .. uv0.sub(slot0, slot1, slot2 - 1)
	slot6 = uv1.loadstring(slot5)

	uv1.assert(slot6, "Failed to scan number [ " .. slot5 .. "] in JSON string at position " .. slot1 .. " : " .. slot2)

	return slot6(), slot2
end

function slot8(slot0, slot1)
	slot2 = {}
	slot3 = uv0.len(slot0)
	slot4, slot5 = nil

	uv1.assert(uv0.sub(slot0, slot1, slot1) == "{", "decode_scanObject called but object does not start at position " .. slot1 .. " in string:\n" .. slot0)

	repeat
		uv1.assert(uv2(slot0, slot1 + 1) <= slot3, "JSON string ended unexpectedly while scanning object.")

		if uv0.sub(slot0, slot1, slot1) == "}" then
			return slot2, slot1 + 1
		end

		if slot6 == "," then
			slot1 = uv2(slot0, slot1 + 1)
		end

		uv1.assert(slot1 <= slot3, "JSON string ended unexpectedly scanning object.")

		slot4, slot8 = decode(slot0, slot1)

		uv1.assert(slot8 <= slot3, "JSON string ended unexpectedly searching for value of key " .. slot4)
		uv1.assert(uv2(slot0, slot1) <= slot3, "JSON string ended unexpectedly searching for value of key " .. slot4)
		uv1.assert(uv0.sub(slot0, slot1, slot1) == ":", "JSON object key-value assignment mal-formed at " .. slot1)
		uv1.assert(uv2(slot0, slot1 + 1) <= slot3, "JSON string ended unexpectedly searching for value of key " .. slot4)

		slot2[slot4], slot1 = decode(slot0, slot1)
	until false
end

_G.setmetatable({
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

function slot9(slot0, slot1)
	uv0.assert(slot1, "decode_scanString(..) called without start position")
	uv0.assert(uv1.sub(slot0, slot1, slot1) == "\"" or slot2 == "'", "decode_scanString called for a non-string")

	slot3 = {}
	slot4 = slot1
	slot5 = slot1

	while uv1.find(slot0, slot2, slot5 + 1) ~= slot5 + 1 do
		slot7, slot5 = uv1.find(slot0, "\\.", slot5 + 1)
		slot7, slot8 = uv1.find(slot0, slot2, slot5 + 1)

		if not slot7 or slot7 < slot4 then
			slot5 = slot8 - 1
			slot4 = slot7

			if not slot7 then
				uv0.print(slot0, slot1, uv1.sub(slot0, slot1, slot6))
			end
		end

		uv2.insert(slot3, uv1.sub(slot0, slot6 + 1, slot4 - 1))

		if uv1.sub(slot0, slot4, slot5) == "\\u" then
			slot9 = uv1.sub(slot0, slot5 + 1, slot5 + 4)
			slot10 = uv0.tonumber(slot9, 16)

			uv0.assert(slot10, "String decoding failed: bad Unicode escape " .. slot9 .. " at position " .. slot4 .. " : " .. slot5 + 4)

			slot11 = nil

			uv2.insert(slot3, (slot10 >= 128 or uv1.char(slot10 % 128)) and (slot10 >= 2048 or uv1.char(192 + uv3.floor(slot10 / 64) % 32, 128 + slot10 % 64)) and uv1.char(224 + uv3.floor(slot10 / 4096) % 16, 128 + uv3.floor(slot10 / 64) % 64, 128 + slot10 % 64))
		else
			uv2.insert(slot3, uv4[uv1.sub(slot0, slot4, slot5)])
		end
	end

	uv2.insert(slot3, uv1.sub(slot5, slot5 + 1))
	uv0.assert(uv1.find(slot0, slot2, slot5 + 1), "String decoding failed: missing closing " .. slot2 .. " at position " .. slot5 .. "(for string at position " .. slot1 .. ")")

	return uv2.concat(slot3, ""), slot5 + 2
end

function slot10(slot0, slot1)
	while uv0.find(" \n\r\t", uv0.sub(slot0, slot1, slot1), 1, true) and slot1 <= uv0.len(slot0) do
		slot1 = slot1 + 1
	end

	return slot1
end

slot15 = {
	[""] = "\\f",
	[""] = "\\b",
	["\n"] = "\\n",
	["\r"] = "\\r",
	["\t"] = "\\t",
	["\\"] = "\\\\",
	["/"] = "\\/",
	["\""] = "\\\""
}

function slot11(slot0)
	return slot0:gsub(".", function (slot0)
		return uv0[slot0]
	end)
end

function slot12(slot0)
	slot1 = 0

	for slot5, slot6 in uv0.pairs(slot0) do
		if uv0.type(slot5) == "number" and uv1.floor(slot5) == slot5 and slot5 >= 1 then
			if not uv2(slot6) then
				return false
			end

			slot1 = uv1.max(slot1, slot5)
		elseif slot5 == "n" then
			if slot6 ~= uv3.getn(slot0) then
				return false
			end
		elseif uv2(slot6) then
			return false
		end
	end

	return true, slot1
end

function slot13(slot0)
	return uv0.type(slot0) == "string" or slot1 == "boolean" or slot1 == "number" or slot1 == "nil" or slot1 == "table" or slot1 == "function" and slot0 == null
end
