FestivalActionModel = FestivalActionModel or BaseClass()

function FestivalActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function FestivalActionModel.config(slot0)
end

function FestivalActionModel.setCountDownTime(slot0, slot1)
	slot0.count_down_time = slot1
end

function FestivalActionModel.getCountDownTime(slot0)
	if slot0.count_down_time then
		return slot0.count_down_time
	end

	return 0
end

function FestivalActionModel.setActionStartStatus(slot0, slot1)
	slot0.start_status = slot1
end

function FestivalActionModel.getActionStartStatus(slot0)
	if slot0.start_status then
		return slot0.start_status
	end

	return 0
end

function FestivalActionModel.setTreasureData(slot0, slot1)
	slot0.treasure_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.treasure_data[slot6.pos] = slot6
	end
end

function FestivalActionModel.getTreasureAllItemData(slot0)
	if slot0.treasure_data then
		return slot0.treasure_data
	end

	return nil
end

function FestivalActionModel.getTreasureData(slot0, slot1)
	if slot0.treasure_data and slot0.treasure_data[slot1] then
		return slot0.treasure_data[slot1]
	end

	return nil
end

function FestivalActionModel.CountDownTime(slot0, slot1, slot2, slot3)
	slot3 = slot3 or 1

	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 - GameNet:getInstance():getTime() > 0 then
		function (slot0)
			if slot0 > 0 then
				if uv0 == 1 then
					uv1:setString(TimeTool.GetTimeFormat(slot0))
				elseif uv0 == 2 then
					uv1:setString(TimeTool.GetTimeFormatDay(uv2))
				end
			else
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			end
		end(slot2)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			else
				uv2(uv0)
			end
		end))))
	else
		slot4(slot2)
	end
end

function FestivalActionModel.setSnatchTime(slot0)
	if Config.HolidaySnatchData.data_const then
		slot2 = ""

		return slot0:setTimeModel(slot1.snatch_time1.val) .. "    " .. slot0:setTimeModel(slot1.snatch_time2.val)
	end
end

function FestivalActionModel.setTimeModel(slot0, slot1)
	slot2 = ""

	if slot1[1] and slot1[2] then
		slot3 = slot1[1][1] or ""
		slot5 = slot1[2][1] or ""
		slot6 = slot1[2][2] or ""

		if (slot1[1][2] or "") == 0 then
			slot4 = "00"
		end

		if slot6 == 0 then
			slot6 = "00"
		end

		slot2 = slot3 .. ":" .. slot4 .. "-" .. slot5 .. ":" .. slot6
	end

	return slot2
end

function FestivalActionModel.__delete(slot0)
end
