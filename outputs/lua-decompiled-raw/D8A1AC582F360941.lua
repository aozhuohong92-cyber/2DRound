ReturnActionModel = ReturnActionModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function ReturnActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ReturnActionModel.config(slot0)
	slot0.item_list = {}
	slot0.return_redbag_data = {}
end

function ReturnActionModel.setActionGiftData(slot0, slot1)
	slot0.action_gift_data = slot1

	slot0:checkGiftRedPoint()
end

function ReturnActionModel.getActionGiftStatus(slot0)
	slot1 = 0

	if slot0.action_gift_data then
		slot1 = slot0.action_gift_data.flag
	end

	return slot1
end

function ReturnActionModel.getActionGiftEndTime(slot0)
	slot1 = 0

	if slot0.action_gift_data then
		slot1 = slot0.action_gift_data.endtime
	end

	return slot1
end

function ReturnActionModel.checkGiftRedPoint(slot0)
	if slot0:returnActionIsOpen() then
		slot2 = false

		if slot0:getActionGiftStatus() == 0 then
			slot2 = true
		end

		ReturnActionController:getInstance():setReturnActionTabStatus(ReturnActionConstants.ReturnActionType.privilege, slot2)
	end
end

function ReturnActionModel.setActionSummonData(slot0, slot1)
	slot0.action_summon_data = slot1

	slot0:checkSummonRedPoint()
end

function ReturnActionModel.getActionSummonData(slot0)
	return slot0.action_summon_data
end

function ReturnActionModel.initActionSummonItem(slot0)
	if next(slot0.item_list or {}) == nil then
		slot0.item_list = {}
		slot1 = slot0:getActionPeriod()

		if Config.HolidayReturnNewData.data_summon and Config.HolidayReturnNewData.data_summon[slot1] then
			for slot5, slot6 in pairs(Config.HolidayReturnNewData.data_summon[slot1]) do
				if slot0.item_list[slot6.type_id] and slot0.item_list[slot6.type_id].num then
					slot0.item_list[slot6.type_id].num = slot0.item_list[slot6.type_id].num + 1
					slot0.item_list[slot6.type_id].pro = slot0.item_list[slot6.type_id].pro + slot6.pro
					slot0.item_list[slot6.type_id].show_pro = slot6.show_pro
				else
					slot0.item_list[slot6.type_id] = {
						num = 1,
						itemId = slot6.rewards[1][1],
						itemNum = slot6.rewards[1][2],
						cfg = slot6,
						pro = slot6.pro,
						show_pro = slot6.show_pro
					}
				end
			end
		end
	end
end

function ReturnActionModel.getActionSummonItemNumById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.item_list) do
		if slot6.itemId == slot1 then
			return slot0:getActionSummonItemCountByTypeId(slot5), slot6.num
		end
	end

	return 0, 0
end

function ReturnActionModel.getActionSummonItemCountByTypeId(slot0, slot1)
	if slot0.action_summon_data and slot0.action_summon_data.award_list then
		for slot5, slot6 in pairs(slot0.action_summon_data.award_list) do
			if slot6.type_id == slot1 then
				return slot6.get_count
			end
		end
	end

	return 0
end

function ReturnActionModel.getActionSummonItemList(slot0)
	return slot0.item_list
end

function ReturnActionModel.checkSummonRedPoint(slot0)
	if slot0:returnActionIsOpen() and slot0.action_summon_data then
		slot2 = false

		if slot0.action_summon_data.draw_time < slot0.action_summon_data.limit_draw_time then
			if slot0.action_summon_data.free_time == 1 then
				slot2 = true
			elseif Config.HolidayReturnNewData.data_constant.draw_item_cost and BackpackController:getInstance():getModel():getItemNumByBid(slot3.val[1][1]) and slot3.val[1][2] <= slot4 then
				slot2 = true
			end
		end

		ReturnActionController:getInstance():setReturnActionTabStatus(ReturnActionConstants.ReturnActionType.summon, slot2)
	end
end

function ReturnActionModel.setActionTaskData(slot0, slot1)
	slot0.action_task_data = slot1

	slot0:checkTaskRedPoint()
end

function ReturnActionModel.updateActionTaskData(slot0, slot1)
	if slot0.action_task_data and slot0.action_task_data.quest_list and slot1 then
		for slot5, slot6 in ipairs(slot0.action_task_data.quest_list) do
			if slot6.id == slot1.id then
				slot6.finish = slot1.finish
				slot6.target_val = slot1.target_val
				slot6.value = slot1.value

				break
			end
		end
	end

	slot0:checkTaskRedPoint()
end

function ReturnActionModel.updateActionTaskDataById(slot0, slot1)
	if slot0.action_task_data and slot0.action_task_data.quest_list and slot1 then
		for slot5, slot6 in ipairs(slot0.action_task_data.quest_list) do
			if slot6.id == slot1.id then
				slot6.finish = 2
				slot6.target_val = slot1.target_val
				slot6.value = slot1.target_val

				break
			end
		end
	end

	slot0:checkTaskRedPoint()
	slot0:checkSummonRedPoint()
end

function ReturnActionModel.getActionTaskQuestList(slot0)
	slot1 = {}

	if slot0.action_task_data and slot0.action_task_data.quest_list then
		slot1 = slot0.action_task_data.quest_list
	end

	return slot1
end

function ReturnActionModel.getActionSubList(slot0, slot1, slot2)
	if Config.HolidayReturnNewData.data_action_holiday and slot3[slot1] then
		slot0.holiday_list = {}

		for slot7, slot8 in pairs(slot3[slot1]) do
			if slot8.min_day <= slot2 and slot2 <= slot8.max_day then
				uv0(slot0.holiday_list, slot8)
			end
		end

		uv1(slot0.holiday_list, function (slot0, slot1)
			return slot0.camp_id < slot1.camp_id
		end)

		return slot0.holiday_list
	end
end

function ReturnActionModel.getReturnActionData(slot0, slot1)
	if slot0.holiday_list then
		for slot5, slot6 in pairs(slot0.holiday_list) do
			if slot6.camp_id == slot1 then
				return slot6
			end
		end

		return nil
	end

	return nil
end

function ReturnActionModel.setActionIsOpen(slot0, slot1)
	slot0.action_isopen = slot1
end

function ReturnActionModel.getActionIsOpen(slot0)
	if slot0.action_isopen then
		return slot0.action_isopen
	end

	return 0
end

function ReturnActionModel.setActionPeriod(slot0, slot1)
	slot0.action_period = slot1
end

function ReturnActionModel.getActionPeriod(slot0)
	if slot0.action_period then
		return slot0.action_period
	end

	return 1
end

function ReturnActionModel.setActionDay(slot0, slot1)
	slot0.action_day = slot1
end

function ReturnActionModel.getActionDay(slot0)
	if slot0.action_day then
		return slot0.action_day
	end

	return 1
end

function ReturnActionModel.setShopData(slot0)
	if slot0.shop_data then
		return
	end

	slot1 = Config.HolidayReturnNewData.data_shop

	if slot0:getCurPeriodByOtherRole() <= 0 then
		slot2 = 1
	end

	slot0.shop_data = {}

	if slot1 and slot1[slot2] then
		for slot6, slot7 in pairs(slot1[slot2]) do
			uv0(slot0.shop_data, slot7)
		end

		uv1(slot0.shop_data, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end
end

function ReturnActionModel.getShopData(slot0)
	if slot0.shop_data then
		return slot0.shop_data
	end

	return nil
end

function ReturnActionModel.setServerShopData(slot0, slot1)
	if slot1 and slot1.buy_info then
		slot0.server_shop_data = {}

		for slot5, slot6 in pairs(slot1.buy_info) do
			slot0.server_shop_data[slot6.id] = slot6
		end
	end
end

function ReturnActionModel.getServerShopData(slot0, slot1)
	if slot0.server_shop_data and slot0.server_shop_data[slot1] then
		return slot0.server_shop_data[slot1]
	end

	return nil
end

function ReturnActionModel.returnActionIsOpen(slot0)
	if slot0:getActionIsOpen() == 0 then
		return false
	end

	if Config.FunctionData.data_info and slot2[MainuiConst.icon.return_action] then
		if MainuiController:getInstance():checkIsOpenByActivate(slot2[MainuiConst.icon.return_action].activate) == false then
			return false
		end

		return true
	end

	return false
end

function ReturnActionModel.checkTaskRedPoint(slot0)
	if not slot0.action_task_data then
		return
	end

	if slot0:returnActionIsOpen() and slot0.action_task_data.quest_list then
		slot2 = false

		for slot6, slot7 in pairs(slot0.action_task_data.quest_list) do
			if slot7.finish == 1 then
				slot2 = true

				break
			end
		end

		ReturnActionController:getInstance():setReturnActionTabStatus(ReturnActionConstants.ReturnActionType.task, slot2)
	end
end

function ReturnActionModel.setSignConfigData(slot0)
	slot2 = slot0:getActionPeriod()

	if Config.HolidayReturnNewData.data_signin and slot1[slot2] then
		slot0.sign_data = {}

		for slot6, slot7 in pairs(slot1[slot2]) do
			uv0(slot0.sign_data, slot7)
		end

		uv1(slot0.sign_data, function (slot0, slot1)
			return slot0.day < slot1.day
		end)
	end
end

function ReturnActionModel.getSignConfigData(slot0)
	if slot0.sign_data then
		return slot0.sign_data
	end

	return nil
end

function ReturnActionModel.setServerSignData(slot0, slot1)
	if slot1 and slot1.status_list then
		slot0.server_sign_data = {}

		for slot5, slot6 in pairs(slot1.status_list) do
			slot0.server_sign_data[slot6.day] = slot6
		end

		slot0:checkSignRedPoint()
	end
end

function ReturnActionModel.getServerSignData(slot0, slot1)
	if slot0.server_sign_data and slot0.server_sign_data[slot1] then
		return slot0.server_sign_data[slot1]
	end

	return nil
end

function ReturnActionModel.updataServerSignData(slot0, slot1)
	if slot0.server_sign_data and slot0.server_sign_data[slot1] then
		slot0.server_sign_data[slot1].status = 2

		slot0:checkSignRedPoint()
		slot0:checkSummonRedPoint()
	end
end

function ReturnActionModel.getActionSignCurDay(slot0)
	return #slot0.server_sign_data or 1
end

function ReturnActionModel.checkSignRedPoint(slot0)
	if slot0.server_sign_data then
		slot1 = false

		for slot5, slot6 in pairs(slot0.server_sign_data) do
			if slot6.status == 1 then
				slot1 = true

				break
			end
		end

		ReturnActionController:getInstance():setReturnActionTabStatus(ReturnActionConstants.ReturnActionType.sign, slot1)
	end
end

function ReturnActionModel.setReturnRedbagData(slot0, slot1)
	slot0.return_redbag_data = slot1 or {}
end

function ReturnActionModel.getReturnRedbagData(slot0)
	return slot0.return_redbag_data
end

function ReturnActionModel.setReturnRedbagNumData(slot0, slot1)
	slot0.return_redbag_Num_data = slot1
end

function ReturnActionModel.isCanGetRedbag(slot0)
	slot1 = true

	if slot0.return_redbag_Num_data and slot0.return_redbag_Num_data.get_num and slot0.return_redbag_Num_data.max_num and slot0.return_redbag_Num_data.max_num <= slot0.return_redbag_Num_data.get_num then
		slot1 = false
	end

	return slot1
end

function ReturnActionModel.getLessTime(slot0)
	slot2 = 0

	for slot6, slot7 in pairs(Config.HolidayReturnNewData.data_privilege) do
		slot8 = slot7.start_time
		slot9 = slot7.end_time

		if GameNet:getInstance():getTime() < os.time({
			year = slot9[1],
			month = slot9[2],
			day = slot9[3],
			hour = slot9[4],
			min = slot9[5],
			sec = slot9[6]
		}) and os.time({
			year = slot8[1],
			month = slot8[2],
			day = slot8[3],
			hour = slot8[4],
			min = slot8[5],
			sec = slot8[6]
		}) < slot12 then
			slot2 = 1

			break
		end
	end

	return slot2
end

function ReturnActionModel.getCurPeriodByOtherRole(slot0)
	slot1 = 0

	for slot6, slot7 in pairs(Config.HolidayReturnNewData.data_privilege) do
		slot8 = slot7.start_time
		slot9 = slot7.end_time

		if GameNet:getInstance():getTime() < os.time({
			year = slot9[1],
			month = slot9[2],
			day = slot9[3],
			hour = slot9[4],
			min = slot9[5],
			sec = slot9[6]
		}) and os.time({
			year = slot8[1],
			month = slot8[2],
			day = slot8[3],
			hour = slot8[4],
			min = slot8[5],
			sec = slot8[6]
		}) < slot12 then
			slot1 = slot7.period

			break
		end
	end

	return slot1
end

function ReturnActionModel.__delete(slot0)
end
