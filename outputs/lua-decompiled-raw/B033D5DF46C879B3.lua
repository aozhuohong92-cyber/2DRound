AnimateActionModel = AnimateActionModel or BaseClass()

function AnimateActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function AnimateActionModel.config(slot0)
end

function AnimateActionModel.setLessTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if (slot2 or 0) > 0 then
		slot0:setTimeFormatString(slot1, slot3)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			else
				uv2:setTimeFormatString(uv1, uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1, slot3)
	end
end

function AnimateActionModel.setTimeFormatString(slot0, slot1, slot2)
	if slot2 > 0 then
		slot1:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot2))
	else
		slot1:setString("00:00:00")
	end
end

function AnimateActionModel.setHolidayID(slot0, slot1)
	slot0.holiday_id = slot1
end

function AnimateActionModel.getHolidayID(slot0)
	return slot0.holiday_id or 0
end

function AnimateActionModel.setRemainChallageNum(slot0, slot1)
	slot0.challage_num = slot1
end

function AnimateActionModel.getRemainChallageNum(slot0)
	return slot0.challage_num or 0
end

function AnimateActionModel.setKitchenRemainData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.remain_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.remain_data[slot6.id] = slot6.num
	end
end

function AnimateActionModel.getKitchenRemainData(slot0, slot1)
	if not slot0.remain_data then
		return 0
	end

	return slot0.remain_data[slot1] or 0
end

function AnimateActionModel.setKitchenLevData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.lev_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.lev_data[slot6.id] = true
	end
end

function AnimateActionModel.getKitchenLevData(slot0, slot1)
	if not slot0.lev_data then
		return
	end

	if slot0.lev_data and slot0.lev_data[slot1] then
		return slot0.lev_data[slot1] or false
	end
end

function AnimateActionModel.__delete(slot0)
end
