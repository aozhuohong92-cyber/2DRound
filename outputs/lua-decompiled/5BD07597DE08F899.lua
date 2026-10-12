OrderActionModel = OrderActionModel or BaseClass()
slot0 = table.sort
slot1 = table.insert
slot2 = Config.HolidayWarOrderData.data_constant

function OrderActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function OrderActionModel.config(slot0)
	slot0:initTaskData()
end

function OrderActionModel.initTaskData(slot0)
	slot0.day_task_list = {}
	slot0.week_task_list = {}
	slot0.period_task_list = {}
end

function OrderActionModel.setTaskInduct(slot0, slot1, slot2, slot3)
	if slot3 == 1 then
		if Config.HolidayWarOrderData.data_day_task_list and slot4[slot1] then
			for slot8, slot9 in pairs(slot4[slot1]) do
				if slot9.day == slot2 then
					uv0(slot0.day_task_list, slot9)
				end
			end

			uv1(slot0.day_task_list, function (slot0, slot1)
				return slot0.goal_id < slot1.goal_id
			end)
		end
	elseif slot3 == 2 then
		if Config.HolidayWarOrderData.data_week_task_list and slot4[slot1] then
			for slot8, slot9 in pairs(slot4[slot1]) do
				if slot9.min_day <= slot2 and slot2 <= slot9.max_day then
					uv0(slot0.week_task_list, slot9)
				end
			end

			uv1(slot0.week_task_list, function (slot0, slot1)
				return slot0.goal_id < slot1.goal_id
			end)
		end
	elseif slot3 == 3 and Config.HolidayWarOrderData.data_period_task_list and slot4[slot1] then
		for slot8, slot9 in pairs(slot4[slot1]) do
			uv0(slot0.period_task_list, slot9)
		end

		uv1(slot0.period_task_list, function (slot0, slot1)
			return slot0.goal_id < slot1.goal_id
		end)
	end
end

function OrderActionModel.getTaskInduct(slot0, slot1)
	slot2 = nil

	if slot1 == 1 then
		slot2 = slot0.day_task_list
	elseif slot1 == 2 then
		slot2 = slot0.week_task_list
	elseif slot1 == 3 then
		slot2 = slot0.period_task_list
	end

	if slot2 and next(slot2) ~= nil then
		return slot2
	end

	return nil
end

function OrderActionModel.setCurExp(slot0, slot1)
	slot0.cur_exp = slot1
end

function OrderActionModel.getCurExp(slot0)
	if slot0.cur_exp then
		return slot0.cur_exp
	end

	return 1
end

function OrderActionModel.setCurPeriod(slot0, slot1)
	slot0.cur_period = slot1
end

function OrderActionModel.getCurPeriod(slot0)
	if slot0.cur_period then
		if MainuiController:getInstance():getFunctionIconById(OrderActionEntranceID.entrance_id8) then
			slot0.cur_period = 9
		end

		if MainuiController:getInstance():getFunctionIconById(OrderActionEntranceID.entrance_id9) then
			slot0.cur_period = 10
		end

		return slot0.cur_period
	end

	return 3
end

function OrderActionModel.setCurDay(slot0, slot1)
	slot0.cur_day = slot1
end

function OrderActionModel.getCurDay(slot0)
	if slot0.cur_day then
		return slot0.cur_day
	end

	return 1
end

function OrderActionModel.setCurLev(slot0, slot1)
	slot0.cur_lev = slot1
end

function OrderActionModel.getCurLev(slot0)
	if slot0.cur_lev then
		return slot0.cur_lev
	end

	return 1
end

function OrderActionModel.setRMBStatus(slot0, slot1)
	slot0.rmb_status = slot1
end

function OrderActionModel.getRMBStatus(slot0)
	if slot0.rmb_status then
		return slot0.rmb_status
	end

	return 0
end

function OrderActionModel.setExtraStatus(slot0, slot1)
	slot0.extra_status = slot1
end

function OrderActionModel.getExtraStatus(slot0)
	if slot0.extra_status then
		return slot0.extra_status
	end

	return 0
end

function OrderActionModel.setGiftStatus(slot0, slot1)
	if slot1 and next(slot1) == nil then
		slot0.gift_status = nil
	end

	if slot0.gift_status and slot0.gift_status == 1 then
		return 1
	end

	slot2 = Config.ChargeData.data_charge_data
	slot4 = slot0:getCurPeriod()

	if Config.HolidayWarOrderData.data_advance_card_list and slot3[slot4] and slot3[slot4][1] and (slot3[slot4][1].id or nil) then
		for slot9, slot10 in pairs(slot1) do
			if slot5 == slot10.id then
				slot0.gift_status = slot10.status
			end
		end
	end
end

function OrderActionModel.getGiftStatus(slot0)
	if slot0.gift_status then
		return slot0.gift_status
	end

	return 0
end

function OrderActionModel.setLevShowData(slot0, slot1)
	slot0.lev_show_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.lev_show_data[slot6.id] = slot6
	end

	slot0:setRewardLevRedPoint()
end

function OrderActionModel.getLevShowData(slot0, slot1)
	if slot0.lev_show_data and slot0.lev_show_data[slot1] then
		return slot0.lev_show_data[slot1]
	end

	return nil
end

function OrderActionModel.setRewardLevRedPoint(slot0)
	slot1 = false
	slot2 = Config.HolidayWarOrderData.data_lev_reward_list
	slot3 = slot0:getCurLev()
	slot4 = slot0:getCurPeriod()

	if slot0.lev_show_data and slot2[slot4] then
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

	slot0:setMainTipsStatus(OrderActionView.reward_panel, slot1)
end

function OrderActionModel.getRewardLevRedPoint(slot0)
	if slot0.reward_red_point then
		return slot0.reward_red_point
	end

	return false
end

function OrderActionModel.setInitTaskData(slot0, slot1)
	slot0:config()

	slot0.init_task_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.init_task_data[slot6.id] = slot6
	end

	slot0:setTaskRedPoint()
end

function OrderActionModel.getInitTaskData(slot0, slot1)
	if slot0.init_task_data and slot0.init_task_data[slot1] then
		return slot0.init_task_data[slot1]
	end

	return nil
end

function OrderActionModel.updataTeskData(slot0, slot1)
	if slot1 and slot1.list then
		for slot5, slot6 in pairs(slot1.list) do
			if slot0.init_task_data and slot0.init_task_data[slot6.id] then
				slot0.init_task_data[slot6.id] = slot6
			end
		end
	end

	slot0:setTaskRedPoint()
end

function OrderActionModel.setTaskRedPoint(slot0)
	slot1 = false

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

	slot0:setMainTipsStatus(OrderActionView.tesk_panel, slot1)
end

function OrderActionModel.getTaskRedPoint(slot0)
	if slot0.task_red_point then
		return slot0.task_red_point
	end

	return false
end

function OrderActionModel.setMainTipsStatus(slot0, slot1, slot2)
	slot3 = 0

	if slot2 then
		slot3 = 1
	end

	slot4 = {
		bid = slot1,
		num = slot3
	}
	slot5 = OrderActionEntranceID.entrance_id

	if slot0:getCurPeriod() == 2 then
		slot5 = OrderActionEntranceID.entrance_id1
	elseif slot0:getCurPeriod() == 3 then
		slot5 = OrderActionEntranceID.entrance_id2
	elseif slot0:getCurPeriod() == 4 then
		slot5 = OrderActionEntranceID.entrance_id3
	elseif slot0:getCurPeriod() == 5 then
		slot5 = OrderActionEntranceID.entrance_id4
	elseif slot0:getCurPeriod() == 6 then
		slot5 = OrderActionEntranceID.entrance_id5
	elseif slot0:getCurPeriod() == 7 then
		slot5 = OrderActionEntranceID.entrance_id6
	elseif slot0:getCurPeriod() == 8 then
		slot5 = OrderActionEntranceID.entrance_id7
	elseif slot0:getCurPeriod() == 9 then
		slot5 = OrderActionEntranceID.entrance_id8
	elseif slot0:getCurPeriod() == 10 then
		slot5 = OrderActionEntranceID.entrance_id9
	end

	MainuiController:getInstance():setFunctionTipsStatus(slot5, slot4)
end

function OrderActionModel.sortTeskItemList(slot0, slot1)
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

function OrderActionModel.__delete(slot0)
end
