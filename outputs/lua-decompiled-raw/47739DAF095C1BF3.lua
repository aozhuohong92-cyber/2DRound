NeworderactionModel = NeworderactionModel or BaseClass()
slot0 = table.sort
slot1 = table.insert
slot3 = Config.HolidayNewWarOrderData.data_constant

function NeworderactionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function NeworderactionModel.config(slot0)
	slot0:initTaskData()
end

function NeworderactionModel.initTaskData(slot0)
	slot0.day_task_list = {}
	slot0.week_task_list = {}
end

function NeworderactionModel.setTaskInduct(slot0, slot1, slot2, slot3)
	if slot3 == 1 then
		slot5 = slot0:getDayLev()

		if uv0.data_day_task_list and slot4[slot1] then
			for slot9, slot10 in pairs(slot4[slot1]) do
				if slot10.day == slot2 and slot10.min_lev <= slot5 and slot5 <= slot10.max_lev then
					uv1(slot0.day_task_list, slot10)
				end
			end

			uv2(slot0.day_task_list, function (slot0, slot1)
				return slot0.goal_id < slot1.goal_id
			end)
		end
	elseif slot3 == 2 then
		slot5 = slot0:getWeekLev()

		if uv0.data_week_task_list and slot4[slot1] then
			for slot9, slot10 in pairs(slot4[slot1]) do
				if slot10.min_day <= slot2 and slot2 <= slot10.max_day and slot10.min_lev <= slot5 and slot5 <= slot10.max_lev then
					uv1(slot0.week_task_list, slot10)
				end
			end

			uv2(slot0.week_task_list, function (slot0, slot1)
				return slot0.goal_id < slot1.goal_id
			end)
		end
	end
end

function NeworderactionModel.getTaskInduct(slot0, slot1)
	slot2 = nil

	if slot1 == 1 then
		slot2 = slot0.day_task_list
	elseif slot1 == 2 then
		slot2 = slot0.week_task_list
	end

	if slot2 and next(slot2) ~= nil then
		return slot2
	end

	return nil
end

function NeworderactionModel.setCurExp(slot0, slot1)
	slot0.cur_exp = slot1
end

function NeworderactionModel.getCurExp(slot0)
	if slot0.cur_exp then
		return slot0.cur_exp
	end

	return 1
end

function NeworderactionModel.setCurPeriod(slot0, slot1)
	slot0.cur_period = slot1
end

function NeworderactionModel.getCurPeriod(slot0)
	if slot0.cur_period then
		return slot0.cur_period
	end

	return 1
end

function NeworderactionModel.setCurDay(slot0, slot1)
	slot0.cur_day = slot1
end

function NeworderactionModel.getCurDay(slot0)
	if slot0.cur_day then
		return slot0.cur_day
	end

	return 1
end

function NeworderactionModel.setCurLev(slot0, slot1)
	slot0.cur_lev = slot1
end

function NeworderactionModel.getCurLev(slot0)
	if slot0.cur_lev then
		return slot0.cur_lev
	end

	return 1
end

function NeworderactionModel.getJumpNum(slot0)
end

function NeworderactionModel.setRMBStatus(slot0, slot1)
	slot0.rmb_status = slot1

	slot0:setRewardLevRedPoint()
end

function NeworderactionModel.getRMBStatus(slot0)
	if slot0.rmb_status then
		return slot0.rmb_status
	end

	return 0
end

function NeworderactionModel.setGiftStatus(slot0, slot1)
	if slot1 and next(slot1) == nil then
		slot0.gift_status = nil
	end

	if slot0.gift_status and slot0.gift_status == 1 then
		return 1
	end

	slot2 = Config.ChargeData.data_charge_data
	slot4 = slot0:getCurPeriod()

	if uv0.data_advance_card_list and slot3[slot4] and slot3[slot4] and (slot3[slot4].id or nil) then
		for slot9, slot10 in pairs(slot1) do
			if slot5 == slot10.id then
				slot0.gift_status = slot10.status
			end
		end
	end
end

function NeworderactionModel.getGiftStatus(slot0)
	if slot0.gift_status then
		return slot0.gift_status
	end

	return 0
end

function NeworderactionModel.setLevShowData(slot0, slot1)
	slot0.lev_show_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.lev_show_data[slot6.id] = slot6
	end

	slot0:setRewardLevRedPoint()
	slot0:setTaskRedPoint()
end

function NeworderactionModel.getLevShowData(slot0, slot1)
	if slot0.lev_show_data and slot0.lev_show_data[slot1] then
		return slot0.lev_show_data[slot1]
	end

	return nil
end

function NeworderactionModel.setPeriodLev(slot0, slot1)
	slot0.period_lev = slot1
end

function NeworderactionModel.getPeriodLev(slot0)
	if slot0.period_lev then
		return slot0.period_lev
	end

	return 1
end

function NeworderactionModel.setDayLev(slot0, slot1)
	slot0.day_lev = slot1
end

function NeworderactionModel.getDayLev(slot0)
	if slot0.day_lev then
		return slot0.day_lev
	end

	return 1
end

function NeworderactionModel.setWeekLev(slot0, slot1)
	slot0.week_lev = slot1
end

function NeworderactionModel.getWeekLev(slot0)
	if slot0.week_lev then
		return slot0.week_lev
	end

	return 1
end

function NeworderactionModel.getDayTaskEndTime(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.day_task_list) do
		if slot0:getInitTaskData(slot6.goal_id) and slot7.end_time and (slot7.end_time < slot1 or slot1 == 0) then
			slot1 = slot7.end_time
		end
	end

	return slot1
end

function NeworderactionModel.getWeekTaskEndtime(slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.week_task_list) do
		if slot0:getInitTaskData(slot6.goal_id) and slot7.end_time and (slot7.end_time < slot1 or slot1 == 0) then
			slot1 = slot7.end_time
		end
	end

	return slot1
end

function NeworderactionModel.setRewardLevRedPoint(slot0)
	slot1 = false
	slot2 = uv0.data_lev_reward_list
	slot3 = slot0:getCurLev()
	slot4 = slot0:getCurPeriod()

	if slot0.lev_show_data and slot2[slot4] and not slot0:checkIsGetAll() then
		for slot8, slot9 in pairs(slot2[slot4]) do
			if slot9.lev <= slot3 then
				slot10 = false

				if slot0:getLevShowData(slot9.lev) then
					if slot0:getRMBStatus() == 1 then
						if slot11.rmb_status == 1 and slot11.status == 1 then
							slot10 = false
						else
							slot10 = true
						end
					end
				elseif slot2[slot4][slot9.lev] and slot2[slot4][slot9.lev].reward and slot2[slot4][slot9.lev].reward[1] then
					slot10 = true
				end

				if slot10 == true then
					slot1 = true

					break
				end
			end
		end
	end

	slot0.reward_red_point = slot1

	slot0:setMainTipsStatus(NewOrderActionView.reward_panel, slot1)
end

function NeworderactionModel.checkIsGetAll(slot0)
	slot2 = slot0:getCurPeriod()
	slot3 = {}

	if uv0.data_lev_reward_list and slot1[slot2] then
		for slot8, slot9 in pairs(slot1[slot2]) do
			uv1(slot3, slot9)
		end
	end

	if slot0.lev_show_data ~= nil and #slot0.lev_show_data >= #slot3 then
		return true
	end

	return false
end

function NeworderactionModel.getRewardLevRedPoint(slot0)
	if slot0.reward_red_point then
		return slot0.reward_red_point
	end

	return false
end

function NeworderactionModel.setInitTaskData(slot0, slot1)
	slot0:config()

	slot0.init_task_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.init_task_data[slot6.id] = slot6
	end

	slot0:setTaskRedPoint()
end

function NeworderactionModel.getInitTaskData(slot0, slot1)
	if slot0.init_task_data and slot0.init_task_data[slot1] then
		return slot0.init_task_data[slot1]
	end

	return nil
end

function NeworderactionModel.updataTaskData(slot0, slot1)
	if slot1 and slot1.list then
		for slot5, slot6 in pairs(slot1.list) do
			if slot0.init_task_data and slot0.init_task_data[slot6.id] then
				slot0.init_task_data[slot6.id] = slot6
			end
		end
	end

	slot0:setTaskRedPoint()
end

function NeworderactionModel.setTaskRedPoint(slot0)
	slot1 = false

	if not slot0:checkIsGetAll() then
		if slot0.init_task_data then
			for slot5, slot6 in pairs(slot0.init_task_data) do
				if slot6.finish == 1 then
					slot1 = true

					break
				end
			end
		end

		slot0.task_red_point = slot1

		if uv0 and uv0.war_order_levmax and uv0.war_order_levmax.val <= slot0:getCurLev() and slot0:getRMBStatus() == 1 then
			slot1 = false
		end
	end

	slot0:setMainTipsStatus(NewOrderActionView.task_panel, slot1)
end

function NeworderactionModel.getTaskRedPoint(slot0)
	if slot0.task_red_point then
		return slot0.task_red_point
	end

	return false
end

function NeworderactionModel.setMainTipsStatus(slot0, slot1, slot2)
	slot3 = 0

	if slot2 or slot0:getPeriodRed() then
		slot3 = 1
	end

	MainuiController:getInstance():setFunctionTipsStatus(NewOrderActionEntranceID.entrance_id, {
		bid = slot1,
		num = slot3
	})
end

function NeworderactionModel.sortTaskItemList(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	uv0(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.goal_id < slot1.goal_id
		end
	end)
end

function NeworderactionModel.setPeriodRed(slot0, slot1)
	slot0.period_red = slot1
end

function NeworderactionModel.getPeriodRed(slot0)
	if slot0.period_red then
		return slot0.period_red
	end

	return false
end

function NeworderactionModel.__delete(slot0)
end
