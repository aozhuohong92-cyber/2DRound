StringUtil = StringUtil or {}

function StringUtil.splitStr(slot0)
	slot1 = {}
	slot2 = string.len(slot0)
	slot3 = 1
	slot4 = 1

	while slot3 <= slot2 do
		if string.byte(slot0, slot3) > 0 and slot5 <= 127 then
			slot4 = 1
		elseif slot5 >= 192 and slot5 <= 223 then
			slot4 = 2
		elseif slot5 >= 224 and slot5 <= 239 then
			slot4 = 3
		elseif slot5 >= 240 and slot5 <= 247 then
			slot4 = 4
		end

		slot3 = slot3 + slot4

		table.insert(slot1, {
			char = string.sub(slot0, slot3, slot3 + slot4 - 1),
			type = slot4
		})
	end

	return slot1, slot2
end

function StringUtil.getStrLen(slot0)
	slot1 = 0
	slot2 = 0
	slot4 = 1
	slot5 = 1

	while slot4 <= string.len(slot0) do
		if string.byte(slot0, slot4) > 0 and slot6 <= 127 then
			slot5 = 1
			slot2 = 1
		elseif slot6 >= 192 and slot6 <= 223 then
			slot5 = 2
			slot2 = 2
		elseif slot6 >= 224 and slot6 <= 239 then
			slot5 = 3
			slot2 = 2
		elseif slot6 >= 240 and slot6 <= 247 then
			slot5 = 4
			slot2 = 2
		end

		slot4 = slot4 + slot5
		slot1 = slot1 + slot2
	end

	return slot1
end

function StringUtil.splitByFormat(slot0, slot1)
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

function StringUtil.getChars(slot0, slot1, slot2)
	slot2 = slot2 or "..."
	slot4 = nil

	if (slot1 or 1) > #WordCensor:getInstance():stringToChars(slot0) then
		slot4 = slot0
	else
		slot5 = {
			[slot9] = slot3[slot9]
		}

		for slot9 = 1, slot1 do
		end

		table.insert(slot5, slot2)

		slot4 = table.concat(slot5)
	end

	return slot4
end

function StringUtil.checkFace(slot0, slot1)
	slot1 = slot1 or 5

	if WordCensor:getInstance():relapceFaceIconTag(slot0)[1] > 5 then
		message("发言中不能超过5个表情")

		return false
	end

	return true
end

util_num_chn = {
	"零",
	"一",
	"二",
	"三",
	"四",
	"五",
	"六",
	"七",
	"八",
	"九",
	"十"
}
util_num_std = {
	"零",
	"十",
	"百",
	"千",
	"万",
	"亿"
}

function StringUtil.numToChinese(slot0)
	slot3 = false
	slot4 = ""
	slot5 = 0

	if #StringUtil.splitStr(tonumber(slot0) or 0) > 13 then
		print("只支持13位数字")

		return
	end

	for slot9, slot10 in pairs(slot1) do
		if slot10.char == "0" and slot2 > 1 then
			slot3 = true
		else
			if slot3 then
				slot3 = false
				slot4 = slot4 .. util_num_std[1]
			end

			if slot2 - slot9 == 9 then
				slot4 = slot4 .. util_num_chn[tonumber(slot10.char) + 1] .. util_num_std[6]
			elseif slot5 == 5 then
				slot4 = slot4 .. util_num_std[slot5]
			elseif slot5 > 5 then
				slot4 = slot4 .. util_num_std[slot5 - 5 + 1]
			elseif slot5 >= 1 then
				slot4 = slot4 .. util_num_std[slot5 + 1]
			elseif slot5 == 1 then
				slot4 = slot4 .. util_num_std[2]
			end
		end
	end

	if slot0 < 20 and slot0 > 9 then
		return string.sub(slot4, 4)
	else
		return slot4
	end
end

function slot0(slot0)
	return math.floor(slot0 / 4)
end

function slot1(slot0)
	return slot0 - uv0(slot0) * 4
end

function slot2(slot0)
	if slot0 == "" then
		return ""
	end

	slot1 = {
		[slot5] = tonumber("0x" .. string.sub(slot0, slot5, slot5), 10)
	}

	for slot5 = 1, 4 do
	end

	return string.char(224 + slot1[1], 128 + slot1[2] * 4 + uv0(slot1[3]), 128 + uv1(slot1[3]) * 16 + slot1[4])
end

function unicode2utf8(slot0)
	slot1 = ""
	slot2 = 1

	while slot2 <= string.len(slot0) do
		if string.sub(slot0, slot2, slot2) == "\\" and string.sub(slot0, slot2 + 1, slot2 + 1) == "u" then
			slot1 = slot1 .. uv0(string.sub(slot0, slot2 + 2, slot2 + 5))
			slot2 = slot2 + 6
		else
			slot1 = slot1 .. slot3
			slot2 = slot2 + 1
		end
	end

	return slot1
end

function encodeBase64(slot0)
	slot1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	slot2 = ""

	while #slot0 > 0 do
		for slot9 = 1, 3 do
			if #slot3 > 0 then
				slot5 = 0 * 256 + string.byte(slot3, 1, 1)
				slot3 = string.sub(slot3, 2)
				slot4 = 0 + 1
			end
		end

		for slot9 = 1, slot4 + 1 do
			slot10 = math.fmod(math.floor(slot5 / 262144), 64) + 1
			slot2 = slot2 .. string.sub(slot1, slot10, slot10)
			slot5 = slot5 * 64
		end

		for slot9 = 1, 3 - slot4 do
			slot2 = slot2 .. "="
		end
	end

	return slot2
end

function bin2hex(slot0)
	return string.gsub(slot0, "(.)", function (slot0)
		return string.format("%02X", string.byte(slot0))
	end)
end

slot3 = {
	["0"] = 0,
	C = 12,
	B = 11,
	["2"] = 2,
	["7"] = 7,
	["3"] = 3,
	F = 15,
	D = 13,
	E = 14,
	A = 10,
	["6"] = 6,
	["9"] = 9,
	["5"] = 5,
	["1"] = 1,
	["8"] = 8,
	["4"] = 4
}

function hex2bin(slot0)
	return string.gsub(slot0, "(.)(.)", function (slot0, slot1)
		return string.char(uv0[slot0] * 16 + uv0[slot1])
	end)
end

function bin2str(slot0)
	return string.gsub(slot0, "(.)", function (slot0)
		if "\\xfd" < slot0 then
			return "" .. slot0
		else
			return string.char(string.byte(slot0) + 2)
		end
	end)
end

function str2bin(slot0)
	slot1 = {}
	slot3 = 1
	slot4 = 1

	while slot3 <= string.len(slot0) do
		if string.byte(slot0, slot3) == 1 then
			slot1[slot4] = string.char(string.byte(slot0, slot3 + 1))
			slot3 = slot3 + 2
		else
			slot1[slot4] = string.char(string.byte(slot0, slot3) - 2)
			slot3 = slot3 + 1
		end

		slot4 = slot4 + 1
	end

	return table.concat(slot1)
end

function str4num(slot0)
	if slot0 == nil or slot0 == 0 then
		return "无"
	elseif slot0 == 999 then
		return "不限"
	else
		return slot0
	end
end

function slot4(slot0, slot1)
	slot3 = 1

	if string.byte(slot0, slot1) == nil then
		slot3 = 0
	elseif slot2 > 0 and slot2 <= 127 then
		slot3 = 1
	elseif slot2 >= 192 and slot2 <= 223 then
		slot3 = 2
	elseif slot2 >= 224 and slot2 <= 239 then
		slot3 = 3
	elseif slot2 >= 240 and slot2 <= 247 then
		slot3 = 4
	end

	return slot3
end

function slot5(slot0)
	slot1 = 0
	slot2 = 1
	slot3 = 1

	repeat
		slot2 = slot2 + uv0(slot0, slot2)
		slot1 = slot1 + 1
	until slot3 == 0

	return slot1 - 1
end

function slot6(slot0, slot1)
	slot2 = 0
	slot3 = 1
	slot4 = 1

	repeat
		slot3 = slot3 + uv0(slot0, slot3)
	until slot1 <= slot2 + 1

	return slot3 - slot4
end

function StringUtil.SubStringGetTotalIndex(slot0)
	return uv0(slot0)
end

function StringUtil.SubStringUTF8(slot0, slot1, slot2)
	if slot1 < 0 then
		slot1 = uv0(slot0) + slot1 + 1
	end

	if slot2 ~= nil and slot2 < 0 then
		slot2 = uv0(slot0) + slot2 + 1
	end

	if slot2 == nil then
		return string.sub(slot0, uv1(slot0, slot1))
	else
		return string.sub(slot0, uv1(slot0, slot1), uv1(slot0, slot2 + 1) - 1)
	end
end

function StringUtil.ShowTextOneByOne(slot0, slot1)
	if not slot0 or tolua.isnull(slot0) then
		return
	end

	for slot6 = 1, StringUtil.SubStringGetTotalIndex(slot1) do
		delayRun(slot0, slot6 * 0.08, function ()
			if StringUtil.SubStringUTF8(uv0, 1, uv1) then
				uv2:setString(slot0)
			else
				uv2:setString(uv0)
				doStopAllActions(uv2)
			end
		end)
	end
end

slot7 = {
	error_format = 2,
	error_birthday = 4,
	error_code = 5,
	error_length = 1,
	success = 0,
	error_address = 3
}
slot8 = 18
slot9 = {
	11,
	12,
	13,
	14,
	15,
	21,
	22,
	23,
	31,
	32,
	33,
	34,
	35,
	36,
	37,
	71,
	41,
	42,
	43,
	44,
	45,
	46,
	81,
	82,
	51,
	52,
	53,
	54,
	50,
	61,
	62,
	63,
	64,
	65
}
slot10 = {
	7,
	9,
	10,
	5,
	8,
	4,
	2,
	1,
	6,
	3,
	7,
	9,
	10,
	5,
	8,
	4,
	2
}
slot11 = {
	"1",
	"0",
	"x",
	"9",
	"8",
	"7",
	"6",
	"5",
	"4",
	"3",
	"2"
}

function isLengthOk(slot0)
	if #slot0 ~= uv0 then
		return false
	else
		return true
	end
end

function isFormatOk(slot0)
	if string.match(slot0, "%d+") == slot0 or string.match(slot0, "%d+x") == slot0 then
		return true
	else
		return false
	end
end

function isAddressOk(slot0)
	slot6 = 1
	slot7 = 2
	slot2 = false

	for slot6, slot7 in ipairs(uv0) do
		if tonumber(slot0:sub(slot6, slot7)) == slot7 then
			slot2 = true

			break
		end
	end

	slot4 = false

	if tonumber(slot0:sub(3, 4)) >= 1 and slot3 <= 70 then
		slot4 = true
	end

	slot6 = false

	if tonumber(slot0:sub(5, 6)) >= 1 and slot5 <= 18 or slot5 >= 21 and slot5 <= 99 then
		slot6 = true
	end

	if slot2 and slot4 and slot6 then
		return true
	else
		return false
	end
end

function isBirthdayOk(slot0)
	slot4 = {
		year = tonumber(slot0:sub(7, 10)),
		month = tonumber(slot0:sub(11, 12)),
		day = tonumber(slot0:sub(13, 14))
	}

	if os.date("*t", os.time(slot4)).year == slot4.year and slot6.month == slot4.month and slot6.day == slot4.day then
		return true
	else
		return false
	end
end

function isCheckCodeOk(slot0)
	slot2 = {}
	slot6 = "."

	for slot6 in slot0:sub(1, 17):gmatch(slot6) do
		table.insert(slot2, tonumber(slot6))
	end

	for slot7, slot8 in ipairs(slot2) do
		slot3 = 0 + slot8 * uv0[slot7]
	end

	if uv1[slot3 % 11 + 1] == slot0:sub(18, 18) then
		return true
	else
		return false
	end
end

function isValidID(slot0)
	if slot0 == nil or slot0 == "" or string.len(slot0) ~= 18 then
		return false
	end

	slot1 = {
		7,
		9,
		10,
		5,
		8,
		4,
		2,
		1,
		6,
		3,
		7,
		9,
		10,
		5,
		8,
		4,
		2
	}
	slot2 = {
		"1",
		"0",
		"X",
		"9",
		"8",
		"7",
		"6",
		"5",
		"4",
		"3",
		"2"
	}
	slot3 = 0

	for slot7 = 1, 17 do
		if tonumber(string.sub(slot0, slot7, slot7)) < 0 or slot8 > 9 then
			return false
		end

		slot3 = slot3 + slot8 * slot1[slot7]
	end

	if string.upper(string.sub(slot0, 18, 18)) ~= slot2[slot3 % 11 + 1] then
		return false
	end

	return true
end

function verifyID(slot0)
	if not isLengthOk(slot0) then
		return uv0.error_length
	end

	if not isValidID(slot0) then
		return uv0.error_format
	end

	return uv0.success
end
