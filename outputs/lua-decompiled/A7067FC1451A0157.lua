TimeTool = TimeTool or {}

function TimeTool.GetTimeFormat(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % 3600 / 60)
	slot3 = slot0 % 3600 % 60

	if math.floor(slot0 / 3600) < 10 then
		slot1 = "0" .. slot1 or slot1
	end

	if slot2 < 10 then
		slot2 = "0" .. slot2 or slot2
	end

	if slot3 < 10 then
		slot3 = "0" .. slot3 or slot3
	end

	return slot1 .. ":" .. slot2 .. ":" .. slot3
end

function TimeTool.GetMinSecTime(slot0)
	slot0 = tonumber(slot0) or 0
	slot3 = math.floor(slot0 % 3600 % 60)

	if math.floor(slot0 / 3600) * 60 + math.floor(slot0 % 3600 / 60) < 10 then
		slot2 = "0" .. slot2 or slot2
	end

	if slot3 < 10 then
		slot3 = "0" .. slot3 or slot3
	end

	return slot2 .. ":" .. slot3
end

function TimeTool.GetTimeFormatII(slot0)
	slot0 = tonumber(slot0) or 0

	if math.floor(slot0 % 3600 % 60) <= 0 then
		if math.floor(slot0 % 3600 / 60) <= 0 then
			return math.floor(slot0 / 3600) .. TI18N("小时")
		else
			return slot1 .. tipsFormat(TI18N("小时%s分"), slot2)
		end
	end

	return slot1 .. tipsFormat(TI18N("小时%s分%s秒"), slot2, slot3)
end

function TimeTool.GetTimeFormatTwo(slot0, slot1)
	slot0 = tonumber(slot0) or 0
	slot3 = math.floor(slot0 % 3600 / 60)
	slot4 = math.floor(slot0 % 3600 % 60)
	slot5 = math.floor(slot0 / 3600) < 10 and "0" .. slot2 or slot2
	slot6 = slot3 < 10 and "0" .. slot3 or slot3
	slot7 = slot4 < 10 and "0" .. slot4 or slot4

	if slot2 <= 0 then
		if slot1 then
			return string.format("%s:%s", slot6, slot7)
		end

		return string.format(TI18N("%s分%s秒"), slot6, slot7)
	else
		if slot1 then
			return string.format("%s:%s", slot5, slot6)
		end

		return string.format(TI18N("%s小时%s分"), slot5, slot6)
	end
end

function TimeTool.GetTimeFormatIII(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % 3600 / 60)

	if math.floor(slot0 / 3600) < 10 then
		slot1 = "0" .. slot1 or slot1
	end

	if slot2 < 10 then
		slot2 = "0" .. slot2 or slot2
	end

	return slot1 .. ":" .. slot2
end

function TimeTool.GetTimeMS(slot0, slot1)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 / 3600)
	slot3 = math.floor(slot0 % 3600 / 60)
	slot4 = math.floor(slot0 % 3600 % 60)

	if slot1 then
		if slot4 < 10 then
			slot4 = "0" .. slot4 or slot4
		end

		if slot2 * 60 + slot3 < 10 then
			slot5 = "0" .. slot5 or slot5
		end

		return slot5 .. ":" .. slot4
	else
		return tipsFormat(TI18N("%s分%s秒"), slot2 * 60 + slot3, slot4)
	end
end

function TimeTool.getYMDHMS(slot0)
	return os.date("%Y-%m-%d %X ", slot0)
end

function TimeTool.getYMDHM(slot0)
	return os.date("%Y-%m-%d %H:%M", slot0)
end

function TimeTool.getMDHMS(slot0)
	return os.date("%m-%d %X ", slot0)
end

function TimeTool.getMD(slot0)
	return os.date("%m.%d", slot0)
end

function TimeTool.getMDHM(slot0)
	return os.date("%m-%d %H:%M", slot0)
end

function TimeTool.getHMS(slot0)
	return os.date("%X ", slot0)
end

function TimeTool.getYDHM(slot0)
	return os.date("%m/%d %H:%M ", slot0)
end

function TimeTool.getMS(slot0)
	return os.date("%M:%S", slot0)
end

function TimeTool.getHM(slot0)
	return os.date("%H:%M", slot0)
end

function TimeTool.getYMD(slot0)
	return os.date("%Y-%m-%d", slot0)
end

function TimeTool.getYMD1(slot0)
	return os.date("%Y.%m.%d", slot0)
end

function TimeTool.getYMD2(slot0)
	return os.date("%Y", slot0) .. TI18N("年") .. os.date("%m", slot0) .. TI18N("月") .. os.date("%d", slot0) .. TI18N("日")
end

function TimeTool.getYMD3(slot0)
	return os.date("%Y", slot0) .. "." .. os.date("%m", slot0) .. "." .. os.date("%d", slot0)
end

function TimeTool.getMD2(slot0)
	return os.date("%m", slot0) .. TI18N("月") .. os.date("%d", slot0) .. TI18N("日")
end

function TimeTool.getMD3(slot0)
	return os.date("%m-%d", slot0)
end

function TimeTool.getOneDayLessTime()
	return os.difftime(os.time({
		hour = 0,
		min = 0,
		sec = 0,
		isdst = false,
		year = tonumber(os.date("%Y")),
		month = tonumber(os.date("%m")),
		day = tonumber(os.date("%d")) + 1
	}), os.time())
end

function TimeTool.getToDayZeroTime()
	slot0 = GameNet:getInstance():getTime()

	return os.time({
		hour = 0,
		min = 0,
		sec = 0,
		isdst = false,
		year = os.date("%Y", curTime),
		month = os.date("%m", curTime),
		day = os.date("%d", curTime)
	}) or 0
end

function TimeTool.day2s()
	return 86400
end

function TimeTool.getDayDifference(slot0)
	if type(slot0) ~= "number" then
		return 0
	end

	return (os.time() - slot0) / TimeTool.day2s()
end

function TimeTool.GetTimeFormatDay(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % TimeTool.day2s())
	slot3 = math.floor(slot2 / 3600)
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)
	slot6 = ""

	if math.floor(slot0 / TimeTool.day2s()) >= 1 then
		slot6 = slot1 .. TI18N("天")
	end

	if slot1 >= 1 then
		if slot3 > 0 then
			return slot6 .. slot3 .. TI18N("小时")
		else
			return slot6
		end
	else
		if slot5 <= 0 then
			if slot4 <= 0 then
				if slot3 <= 0 then
					return ""
				end

				return slot6 .. slot3 .. TI18N("小时")
			else
				return slot6 .. slot3 .. tipsFormat(TI18N("小时%s分"), slot4)
			end
		end

		return slot6 .. slot3 .. tipsFormat(TI18N("小时%s分"), slot4)
	end
end

function TimeTool.GetTimeDayOrTime(slot0)
	slot2 = ""

	if math.floor((tonumber(slot0) or 0) / TimeTool.day2s()) >= 1 then
		return slot1 .. TI18N("天")
	end

	if slot1 < 1 then
		return TimeTool.GetTimeFormat(slot0)
	end
end

function TimeTool.GetTimeFormatDayII(slot0)
	slot0 = tonumber(slot0) or 0
	slot1 = math.floor(slot0 / 86400)
	slot2 = math.floor(slot0 % 86400)
	slot3 = math.floor(slot2 / 3600)
	slot4 = math.floor(slot2 % 3600 / 60)
	slot6 = ""
	slot7 = ""
	slot8 = ""
	slot9 = ""

	if math.floor(slot2 % 3600 % 60) >= 1 then
		slot9 = slot5 .. TI18N("秒")
	end

	if slot4 >= 1 then
		slot8 = slot4 .. TI18N("分")
	end

	if slot3 >= 1 then
		slot7 = slot3 .. TI18N("小时")
	end

	if slot1 >= 1 then
		return slot1 .. TI18N("天") .. slot7
	elseif slot3 >= 1 then
		return slot7 .. slot8
	else
		return slot8 .. slot9
	end
end

function TimeTool.GetTimeFormatDayIII(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % 86400)
	slot3 = math.floor(slot2 / 3600)
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)
	slot6 = ""
	slot7 = ""
	slot8 = ""
	slot9 = ""

	if math.floor(slot0 / 86400) >= 1 then
		if slot3 >= 1 then
			slot7 = slot3 .. TI18N("小时")
		end

		return slot1 .. TI18N("天") .. slot7
	else
		return slot3 .. TI18N("小时") .. (slot4 .. TI18N("分")) .. (slot5 .. TI18N("秒"))
	end
end

function TimeTool.GetTimeFormatDayIV(slot0)
	slot2 = ""

	if math.floor((tonumber(slot0) or 0) / 86400) >= 1 then
		slot2 = slot1 .. TI18N("天")
	else
		slot3 = math.floor(slot0 % 86400)
		slot5 = math.floor(slot3 % 3600 / 60)
		slot6 = math.floor(slot3 % 3600 % 60)

		if math.floor(slot3 / 3600) < 10 then
			slot4 = "0" .. slot4
		end

		if slot5 < 10 then
			slot5 = "0" .. slot5
		end

		if slot6 < 10 then
			slot6 = "0" .. slot6
		end

		slot2 = string.format("%s:%s:%s", slot4, slot5, slot6)
	end

	return slot2
end

function TimeTool.GetTimeName(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % TimeTool.day2s())

	return math.floor(slot0 / TimeTool.day2s()), math.floor(slot2 / 3600), math.floor(slot2 % 3600 / 60), math.floor(slot2 % 3600 % 60)
end

function TimeTool.GetTimeFormatDayIIIIII(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % TimeTool.day2s())
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)
	slot6 = ""

	if math.floor(slot0 / TimeTool.day2s()) >= 1 then
		if math.floor(slot2 / 3600) <= 0 then
			return slot1 .. TI18N("天")
		else
			return slot6 .. slot3 .. TI18N("小时")
		end
	else
		if slot5 <= 0 then
			if slot4 <= 0 then
				if slot3 <= 0 then
					return ""
				end

				return slot6 .. slot3 .. TI18N("小时")
			else
				return slot6 .. slot3 .. tipsFormat(TI18N("小时%s分"), slot4)
			end
		end

		return slot6 .. slot3 .. tipsFormat(TI18N("小时%s分"), slot4)
	end
end

function TimeTool.GetTimeFormatDay2(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % TimeTool.day2s())
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)
	slot6 = ""

	if math.floor(slot0 / TimeTool.day2s()) >= 1 then
		if math.floor(slot2 / 3600) <= 0 then
			return slot1 .. TI18N("天")
		else
			return slot6 .. slot3 .. TI18N("小时")
		end
	elseif slot3 >= 1 then
		if slot4 <= 0 then
			return slot3 .. TI18N("小时")
		else
			return slot6 .. slot4 .. TI18N("分")
		end
	elseif slot4 >= 1 then
		if slot5 <= 0 then
			return slot4 .. TI18N("分")
		else
			return slot6 .. slot5 .. TI18N("秒")
		end
	else
		return slot5 .. TI18N("秒")
	end
end

function TimeTool.GetTimeForFunction(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % TimeTool.day2s())
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)

	if math.floor(slot0 / TimeTool.day2s()) >= 1 then
		return slot1 .. TI18N("天") .. math.floor(slot2 / 3600) .. TI18N("小时")
	elseif slot3 >= 1 then
		return (slot3 < 10 and "0" .. slot3 or slot3) .. ":" .. (slot4 < 10 and "0" .. slot4 or slot4) .. ":" .. (slot5 < 10 and "0" .. slot5 or slot5)
	else
		return slot7 .. ":" .. slot8
	end
end

function TimeTool.GetTimeFormatDayIIIIIII(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % 86400)
	slot3 = math.floor(slot2 / 3600)
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = ""

	return math.floor(slot0 / 86400) >= 1 and slot1 .. TI18N("天") .. slot3 .. TI18N("时") .. slot4 .. TI18N("分") or string.format(TI18N("%s时%s分%s秒"), slot3, slot4, math.floor(slot2 % 3600 % 60))
end

function TimeTool.GetTimeFormatDayIIIIIIII(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % 86400)
	slot3 = math.floor(slot2 / 3600)
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)
	slot6 = ""

	return (math.floor(slot0 / 86400) < 1 or string.format(TI18N("%d天%02d:%02d:%02d"), slot1, slot3, slot4, slot5)) and string.format("%02d:%02d:%02d", slot3, slot4, slot5)
end

function TimeTool.getDayOrHour(slot0)
	slot0 = tonumber(slot0) or 0
	slot2 = math.floor(slot0 % TimeTool.day2s())
	slot3 = math.floor(slot2 / 3600)
	slot4 = math.floor(slot2 % 3600 / 60)
	slot5 = math.floor(slot2 % 3600 % 60)

	if math.floor(slot0 / TimeTool.day2s()) >= 1 then
		return slot1 .. TI18N("天")
	elseif slot3 >= 1 then
		return slot3 .. TI18N("小时")
	elseif slot4 >= 1 then
		return slot4 .. TI18N("分钟")
	elseif slot5 >= 1 then
		return slot5 .. TI18N("秒")
	else
		return 0
	end
end

function TimeTool.getMessageBoardTime(slot0)
	if GameNet:getInstance():getTime() - (tonumber(slot0) or 0) < 0 then
		slot1 = 0
	end

	if math.floor(slot1 / TimeTool.day2s()) > 0 then
		return TimeTool.getYMD2(slot0)
	end

	if math.floor(math.floor(slot1 % TimeTool.day2s()) / 3600) >= 1 then
		return slot4 .. TI18N("小时前")
	end

	if math.floor(slot3 % 3600 / 60) >= 1 then
		return slot5 .. TI18N("分钟前")
	end

	return TI18N("刚刚")
end

slot0 = {
	"一",
	"二",
	"三",
	"四",
	"五",
	"六",
	"日"
}

function TimeTool.getWeekDay(slot0)
	if not slot0 or next(slot0) == nil then
		return ""
	end

	slot1 = false

	for slot6, slot7 in pairs(slot0) do
		if slot7 == 6 or slot7 == 7 then
			slot2 = 0 + 1
		end
	end

	for slot8, slot9 in ipairs(slot0) do
		if (slot9 == 6 or slot9 == 7) and slot2 >= 2 then
			if not false then
				slot3 = ("" ~= "" or TI18N("周末")) and TI18N("周末") .. TI18N("、周末")
				slot4 = true
			end
		else
			slot3 = (slot3 ~= "" or string.format(TI18N("周%s"), uv0[slot9])) and string.format(TI18N("%s、周%s"), string.format(TI18N("周%s"), uv0[slot9]), uv0[slot9])
		end
	end

	return slot3
end

function TimeTool.GetTimeFormatFriendShowTime(slot0)
	if math.floor((tonumber(slot0) or 0) / TimeTool.day2s()) >= 3 then
		return TI18N("3天以上")
	end

	if slot1 > 0 then
		return slot1 .. TI18N("天前")
	end

	if math.ceil(math.floor(slot0 % TimeTool.day2s()) / 3600) <= 0 then
		slot3 = 1
	end

	return slot3 .. TI18N("小时前")
end

function TimeTool.getMixTime(slot0)
	if not slot0 then
		return
	end

	if type(slot0) == "string" then
		slot1 = 0
		slot2 = 0
		slot3, slot4 = string.find(slot0, "-")

		if slot3 and slot4 then
			slot1 = string.sub(slot0, 1, slot3 - 1)
			slot2 = string.sub(slot0, slot4 + 1)
		end

		return tonumber(slot1 .. slot2)
	end

	return nil
end

function TimeTool.getSplitTime(slot0)
	if not slot0 then
		return
	end

	if type(slot0) == "number" then
		slot1 = 0
		slot2 = 0

		if string.len(tostring(slot0)) == 3 then
			slot1 = "0" .. string.sub(slot0, 1, 1)
			slot2 = string.sub(slot0, 2, 3)
		elseif string.len(slot0) == 4 then
			slot1 = string.sub(slot0, 1, 2)
			slot2 = string.sub(slot0, 3, 4)
		end

		return slot1 .. "-" .. slot2
	end

	return nil
end

function TimeTool.getTimeZone()
	slot0 = os.time()

	return os.difftime(slot0, os.time(os.date("!*t", slot0))) / 3600
end
