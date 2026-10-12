SevenGoalModel = SevenGoalModel or BaseClass()
slot0 = table.sort
slot1 = table.insert
slot2 = table.remove
slot3 = Config.DayGoalsNewData.data_charge_list

function SevenGoalModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function SevenGoalModel.config(slot0)
end

function SevenGoalModel.setInitSevenGoalData(slot0, slot1)
	slot0:setSevenGoalPeriod(slot1.period)
	slot0:setSevenGoalDay(slot1.cur_day)
	slot0:setSevenGoalLev(slot1.lev)

	slot0.seven_goal_data = {}
	slot2 = {}
	slot3 = {}

	if uv0[slot1.period] then
		for slot7, slot8 in pairs(slot1.list) do
			slot9 = false
			slot13 = slot1.period

			for slot13, slot14 in pairs(uv0[slot13]) do
				if slot8.id == slot14.goal_id then
					slot9 = true

					break
				end
			end

			if slot9 == true then
				uv1(slot2, slot8)
			else
				uv1(slot3, slot8)
			end
		end

		slot0:setSortItem(slot2)
		slot0:setChargeTotalData(slot2)

		if slot1.period == SevenGoalEntranceCycle.period_3 or slot1.period == SevenGoalEntranceCycle.period_6 or slot1.period == SevenGoalEntranceCycle.period_9 or slot1.period == SevenGoalEntranceCycle.period_11 or slot1.period == SevenGoalEntranceCycle.period_13 then
			slot4 = true

			for slot8, slot9 in pairs(slot2) do
				if slot9.finish ~= 2 then
					slot4 = false

					break
				end
			end

			if slot4 == true then
				uv2(slot2, function (slot0, slot1)
					return slot1.id < slot0.id
				end)
			end

			uv2(slot3, function (slot0, slot1)
				return slot0.id < slot1.id
			end)
		else
			slot0:setSortItem(slot3)
		end

		slot4 = 1

		for slot8, slot9 in ipairs(slot3) do
			if slot9.finish == 2 then
				slot4 = slot8

				break
			else
				slot4 = slot8 + 1
			end
		end

		if slot2[1] then
			if slot2[1].finish == 1 then
				uv1(slot3, 1, slot2[1])
			else
				uv1(slot3, slot4, slot2[1])
			end
		end

		slot0.seven_goal_data = slot3
	end
end

function SevenGoalModel.getInitSevenGoalData(slot0)
	if not slot0.seven_goal_data or next(slot0.seven_goal_data) == nil then
		return nil
	end

	return slot0.seven_goal_data or {}
end

function SevenGoalModel.setInitDataUpdata(slot0, slot1)
	if not slot0.seven_goal_data or next(slot0.seven_goal_data) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot0.seven_goal_data) do
		for slot10, slot11 in pairs(slot1) do
			if slot6.id == slot11.id then
				slot0.seven_goal_data[slot5] = slot11
			end
		end
	end

	slot6 = slot1[1]

	slot0:updataChargeTotalData(slot1[1].id, slot6)

	slot2 = slot0:getSevenGoalPeriod()

	for slot6, slot7 in pairs(slot0.seven_goal_data) do
		for slot11, slot12 in pairs(uv0[slot2]) do
			if slot7.finish == 2 and slot7.id == slot12.goal_id then
				slot14 = slot12.goal_id

				for slot18, slot19 in pairs(uv0[slot2]) do
					if slot19.id == slot12.id + 1 then
						slot14 = slot19.goal_id

						break
					end
				end

				if slot0:getChargeTotalData(slot14) then
					for slot19, slot20 in ipairs(slot0.seven_goal_data) do
						if slot20.id == slot12.goal_id then
							slot0.seven_goal_data[slot19] = slot15

							break
						end
					end
				end
			end
		end
	end

	if slot2 ~= SevenGoalEntranceCycle.period_3 and slot2 ~= SevenGoalEntranceCycle.period_6 and slot2 ~= SevenGoalEntranceCycle.period_9 and slot2 ~= SevenGoalEntranceCycle.period_11 then
		if slot2 ~= SevenGoalEntranceCycle.period_13 then
			slot0:setSortItem(slot0.seven_goal_data)
		end
	end
end

function SevenGoalModel.setChargeTotalData(slot0, slot1)
	slot0.chargeTotalData = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.chargeTotalData[slot6.id] = slot6
	end
end

function SevenGoalModel.getChargeTotalData(slot0, slot1)
	if not slot0.chargeTotalData or next(slot0.chargeTotalData) == nil then
		return nil
	end

	return slot0.chargeTotalData[slot1] or {}
end

function SevenGoalModel.updataChargeTotalData(slot0, slot1, slot2)
	if not slot0.chargeTotalData or next(slot0.chargeTotalData) == nil then
		return
	end

	slot3 = false

	for slot7, slot8 in pairs(slot0.chargeTotalData) do
		if slot8.id == slot2.id then
			slot3 = true

			break
		end
	end

	if slot3 == true then
		slot0.chargeTotalData[slot1] = slot2
	end
end

function SevenGoalModel.getPeriodChargeTotalData(slot0)
	if not slot0.chargeTotalData then
		return {}
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.chargeTotalData) do
		uv0(slot1, slot6)
	end

	uv1(slot1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0:setSortItem(slot1)

	return slot1
end

function SevenGoalModel.setSortItem(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	uv0(slot1, function (slot0, slot1)
		if slot0.finish ~= slot1.finish then
			if uv0[slot0.finish] and uv0[slot1.finish] then
				return uv0[slot0.finish] < uv0[slot1.finish]
			else
				return false
			end
		else
			return slot0.id < slot1.id
		end
	end)
end

function SevenGoalModel.setSevenGoalPeriod(slot0, slot1)
	slot0.peroid = slot1
end

function SevenGoalModel.getSevenGoalPeriod(slot0)
	return slot0.peroid or 2
end

function SevenGoalModel.setSevenGoalDay(slot0, slot1)
	slot0.day = slot1
end

function SevenGoalModel.getSevenGoalDay(slot0)
	return slot0.day or 1
end

function SevenGoalModel.setSevenGoalLev(slot0, slot1)
	slot0.current_lev = slot1
end

function SevenGoalModel.getSevenGoalLev(slot0)
	return slot0.current_lev or 1
end

function SevenGoalModel.setSevenGoalLevData(slot0, slot1)
	slot0.lev_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.lev_data[slot6.id] = true
	end

	slot0:checkMainRedPoint()
end

function SevenGoalModel.getSevenGoalLevData(slot0, slot1)
	if slot0.lev_data and slot0.lev_data[slot1] then
		return slot0.lev_data[slot1]
	end

	return false
end

function SevenGoalModel.setInitRedPoint(slot0)
	slot1 = false

	if slot0.seven_goal_data then
		for slot5, slot6 in pairs(slot0.seven_goal_data) do
			if slot6.finish == 1 then
				slot1 = true

				break
			end
		end
	end

	return slot1
end

function SevenGoalModel.setMoreResPoint(slot0)
	slot2 = false

	if Config.DayGoalsNewData.data_make_lev_list[slot0:getSevenGoalPeriod()] then
		slot7 = slot0

		for slot6, slot7 in pairs(slot1[slot0.getSevenGoalPeriod(slot7)]) do
			if slot0:getSevenGoalLevData(slot7.lev) == false and slot7.lev <= slot0:getSevenGoalLev() then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

function SevenGoalModel.checkMainRedPoint(slot0)
	slot1 = false
	slot1 = slot0:setMoreResPoint() or slot0:setInitRedPoint()
	slot2 = SevenGoalEntranceID.period_1

	if slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_3 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_6 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_9 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_11 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_13 then
		slot2 = SevenGoalEntranceID.period_2
	elseif slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_2 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_5 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_8 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_10 or slot0:getSevenGoalPeriod() == SevenGoalEntranceCycle.period_12 then
		slot2 = SevenGoalEntranceID.period_1
	end

	MainuiController:getInstance():setFunctionTipsStatus(slot2, slot1)
end

function SevenGoalModel.__delete(slot0)
end
