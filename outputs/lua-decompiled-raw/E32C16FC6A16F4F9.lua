ActionModel = ActionModel or BaseClass()
slot0 = {
	cc.c4b(36, 144, 3, 255),
	cc.c4b(128, 247, 49, 255)
}
slot1 = table.insert
slot2 = table.sort

function ActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ActionModel.config(slot0)
	slot0.seven_days_quest = {}
	slot0.seven_red_status_list = {}
	slot0.corssserver_days_quest = {}
	slot0.crossserver_red_status_list = {}
	slot0.fund_red_list = {}
	slot0.dic_limit_icon_data = {}
end

function ActionModel.updateLimitIconData(slot0, slot1)
	if slot0.dic_limit_icon_data then
		if slot1.status == ActionStatus.un_finish then
			slot0.dic_limit_icon_data[slot1.id] = nil
		else
			slot0.dic_limit_icon_data[slot1.id] = slot1
		end
	end
end

function ActionModel.getLimitIconData(slot0)
	return slot0.dic_limit_icon_data
end

function ActionModel.updateSevenQuestList(slot0, slot1, slot2)
	slot3, slot4 = nil
	slot5 = false

	if slot2 == true then
		slot0.seven_days_quest = {}
	end

	for slot9, slot10 in ipairs(slot1) do
		if Config.DaysRankData.data_rank_quest_id[slot10.id] ~= nil then
			if slot0.seven_days_quest[slot10.id] == nil then
				slot0.seven_days_quest[slot10.id] = TaskVo.New(slot10.id, TaskConst.type.action)
			end

			slot0.seven_days_quest[slot10.id]:updateData(slot10)
		end
	end

	slot0:updateGuildRedStatus()
end

function ActionModel.updateGuildRedStatus(slot0)
	slot1 = false

	if slot0.seven_days_quest == nil or next(slot0.seven_days_quest) == nil then
		slot1 = false
	else
		for slot5, slot6 in pairs(slot0.seven_days_quest) do
			if slot6.finish == TaskConst.task_status.finish then
				slot1 = true

				break
			end
		end
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.seven_rank, slot1)
end

function ActionModel.delSevenQuest(slot0, slot1)
	slot0.seven_days_quest[slot1] = nil

	slot0:updateGuildRedStatus()
end

function ActionModel.getSevenQuestByID(slot0, slot1)
	return slot0.seven_days_quest[slot1]
end

function ActionModel.updateSevenLoginData(slot0, slot1)
	slot0.seven_login_data = slot1
end

function ActionModel.getSevenLoginData(slot0)
	return slot0.seven_login_data
end

function ActionModel.getMaxSevenDay(slot0)
	if slot0.seven_login_data == nil or slot0.seven_login_data.status_list == nil then
		return
	end

	slot1 = slot0.seven_login_data.status_list

	table.sort(slot1, function (slot0, slot1)
		return slot0.day < slot1.day
	end)

	slot2 = nil

	for slot6, slot7 in ipairs(slot1) do
		if slot7.status == 2 then
			slot2 = slot7

			break
		end
	end

	if slot2 == nil then
		slot2 = slot1[#slot1]
	end

	return slot2
end

function ActionModel.getSevenDayType(slot0)
	if slot0.seven_login_data == nil or slot0.seven_login_data.type == nil then
		return
	end

	return slot0.seven_login_data.type
end

function ActionModel.updataFestvalRedStatus(slot0, slot1, slot2)
	slot3 = slot0:getRedPointStatus(slot2)
	slot4 = MainuiConst.icon.festval

	if slot1 == ActionRankCommonType.festval_day then
		slot4 = MainuiConst.icon.festval_spring
	elseif slot1 == ActionRankCommonType.lover_day then
		slot4 = MainuiConst.icon.festval_lover
	end

	MainuiController:getInstance():setFunctionTipsStatus(slot4, slot3)
end

function ActionModel.getRedPointStatus(slot0, slot1)
	if not slot1 then
		return false
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		if slot7.status == 1 then
			slot2 = true
		end
	end

	return slot2
end

function ActionModel.updataCombineLoginRedStatus(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		if slot7.status == 1 then
			slot2 = true
		end
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.combine_login, slot2)
end

function ActionModel.updataPreferentialRedStatus(slot0, slot1, slot2)
	return

	slot2 = slot2 or MainuiConst.icon.preferential

	if slot1 then
		if slot0.prefer_fisrt_flag == nil then
			slot0.prefer_fisrt_flag = {}
		end

		if not slot0.prefer_fisrt_flag[slot2] then
			slot0.prefer_fisrt_flag[slot2] = true
		else
			slot1 = false
		end
	end

	MainuiController:getInstance():setFunctionTipsStatus(slot2, slot1)
end

function ActionModel.checkIsCrossServerRankList(slot0, slot1)
	if slot1 >= 1 and slot1 <= 7 then
		return false
	elseif slot1 >= 8 and slot1 <= 14 then
		return true
	else
		return false
	end
end

function ActionModel.getCrossServerRankListData(slot0, slot1)
	slot3 = {}

	for slot7, slot8 in pairs(Config.DaysRankData.data_rank_list) do
		if slot1 == 0 then
			if slot8[1].id >= 1 and slot8[1].id <= 7 or slot8[1].id >= 15 and slot8[1].id <= 19 then
				table.insert(slot3, slot8)
			end
		elseif slot1 == 1 and slot8[1].id >= 8 and slot8[1].id <= 14 then
			table.insert(slot3, slot8)
		end
	end

	return deepCopy(slot3)
end

function ActionModel.setSevenGoldPeriod(slot0, slot1)
	slot0.sevenPeriod = slot1
end

function ActionModel.getSevenGoldPeriod(slot0)
	return slot0.sevenPeriod or 1
end

function ActionModel.checkRedPoint(slot0, slot1)
	if slot1 < 1 or slot1 > 7 then
		return
	end

	slot1 = slot1 or 1
	slot0.welfareRetPoint = {}

	for slot5 = 1, slot1 do
		slot0.welfareRetPoint[slot5] = false

		for slot10, slot11 in pairs(slot0:getSevenGoalWelfareList(slot5)) do
			if slot11.status == 1 then
				slot0.welfareRetPoint[slot5] = true

				break
			end
		end
	end

	slot0.growRetPoint = {}

	for slot5 = 1, slot1 do
		slot0.growRetPoint[slot5] = false

		for slot10, slot11 in pairs(slot0:getServerGrowListData(slot5)) do
			if slot11.status == 1 then
				slot0.growRetPoint[slot5] = true

				break
			end
		end
	end

	slot0.giftRetPoint = {}

	for slot5 = 1, slot1 do
		slot0.giftRetPoint[slot5] = false

		for slot10, slot11 in pairs(slot0:getServerGiftListData(slot5)) do
			if slot11.status == 1 then
				slot0.giftRetPoint[slot5] = true

				break
			end
		end
	end

	slot0.halfRedPoint = {}

	for slot5 = 1, slot1 do
		slot0.halfRedPoint[slot5] = false

		for slot10, slot11 in pairs(slot0:getHalfGiftList(slot5)) do
			if slot10 == 1 and slot11.status == 0 then
				slot0.halfRedPoint[slot5] = true

				break
			end
		end
	end

	slot0.boxRedPoint = {}

	for slot6, slot7 in pairs(slot0:getSevenGoalBoxList()) do
		slot0.boxRedPoint[slot6] = false

		if slot7.status == 1 then
			slot0.boxRedPoint[slot6] = true
		end
	end

	slot3 = false
	slot4 = false
	slot5 = false
	slot6 = false
	slot7 = false
	slot8 = false

	for slot12, slot13 in pairs(slot0.welfareRetPoint) do
		if slot13 == true then
			slot4 = true

			break
		end
	end

	for slot12, slot13 in pairs(slot0.growRetPoint) do
		if slot13 == true then
			slot5 = true

			break
		end
	end

	for slot12, slot13 in pairs(slot0.giftRetPoint) do
		if slot13 == true then
			slot6 = true

			break
		end
	end

	for slot12, slot13 in pairs(slot0.halfRedPoint) do
		if slot13 == true then
			slot8 = true

			break
		end
	end

	for slot12, slot13 in pairs(slot0.boxRedPoint) do
		if slot13 == true then
			slot7 = true

			break
		end
	end

	slot9 = MainuiConst.icon.seven_goal

	MainuiController:getInstance():setFunctionTipsStatus((slot0:getSevenGoldPeriod() ~= 1 or MainuiConst.icon.seven_goal) and (slot0:getSevenGoldPeriod() ~= 2 or MainuiConst.icon.seven_goal1) and (slot0:getSevenGoldPeriod() ~= 3 or MainuiConst.icon.seven_goal2) and (slot0:getSevenGoldPeriod() ~= 7 or MainuiConst.icon.seven_goal4) and MainuiConst.icon.seven_goal3, slot4 or slot5 or slot6 or slot7 or slot8)
end

function ActionModel.getRedPointWelfareStatus(slot0, slot1)
	slot2 = false

	if slot0.welfareRetPoint and slot0.welfareRetPoint[slot1] then
		slot2 = slot0.welfareRetPoint[slot1] or false
	end

	return slot2
end

function ActionModel.updataRedPointWelfareStatus(slot0, slot1, slot2)
	if slot0.welfareRetPoint and slot0.welfareRetPoint[slot1] then
		slot0.welfareRetPoint[slot1] = slot2 or false
	end
end

function ActionModel.getRedPointGrowStatus(slot0, slot1)
	slot2 = false

	if slot0.growRetPoint and slot0.growRetPoint[slot1] then
		slot2 = slot0.growRetPoint[slot1] or false
	end

	return slot2
end

function ActionModel.updataRedPointGrowStatus(slot0, slot1, slot2)
	if slot0.growRetPoint and slot0.growRetPoint[slot1] then
		slot0.growRetPoint[slot1] = slot2 or false
	end
end

function ActionModel.getRedPointGiftStatus(slot0, slot1)
	slot2 = false

	if slot0.giftRetPoint and slot0.giftRetPoint[slot1] then
		slot2 = slot0.giftRetPoint[slot1] or false
	end

	return slot2
end

function ActionModel.updataRedPointGiftStatus(slot0, slot1, slot2)
	if slot0.giftRetPoint and slot0.giftRetPoint[slot1] then
		slot0.giftRetPoint[slot1] = slot2 or false
	end
end

function ActionModel.getRedPointHalfStatus(slot0, slot1)
	slot2 = false

	if slot0.halfRedPoint and slot0.halfRedPoint[slot1] then
		slot2 = slot0.halfRedPoint[slot1] or false
	end

	return slot2
end

function ActionModel.updataRedPointHalfStatus(slot0, slot1, slot2)
	if slot0.halfRedPoint and slot0.halfRedPoint[slot1] then
		slot0.halfRedPoint[slot1] = slot2 or false
	end
end

function ActionModel.getRedPointBoxStatus(slot0, slot1)
	slot2 = false

	if slot0.boxRedPoint and slot0.boxRedPoint[slot1] then
		slot2 = slot0.boxRedPoint[slot1] or false
	end

	return slot2
end

function ActionModel.updataRedPointBoxStatus(slot0, slot1, slot2)
	if slot0.boxRedPoint and slot0.boxRedPoint[slot1] then
		slot0.boxRedPoint[slot1] = slot2 or false
	end
end

function ActionModel.initSevenWalfare(slot0, slot1)
	slot0:setWalfareData(slot1)
	slot0:setWalfareGrowUpData(slot1)
	slot0:setHalfGiftData(slot1)
	slot0:setBoxRewardData(slot1)
end

function ActionModel.setBoxRewardData(slot0, slot1)
	slot0.boxRewardData = {}

	if Config.DayGoalsData.data_all_target[slot1] then
		for slot6, slot7 in pairs(slot2) do
			uv0(slot0.boxRewardData, slot7[1])
		end

		uv1(slot0.boxRewardData, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end
end

function ActionModel.getBoxRewardData(slot0)
	return slot0.boxRewardData or {}
end

function ActionModel.setWalfareData(slot0, slot1)
	if Config.DayGoalsData.data_welfarecollection[slot1] then
		slot0.welfareData = deepCopy(slot2)
	end
end

function ActionModel.setWalfareGrowUpData(slot0, slot1)
	slot0.welfareGrowData = {}
	slot0.welfareGiftData = {}

	if Config.DayGoalsData.data_growthtarget[slot1] then
		for slot6, slot7 in ipairs(slot2) do
			slot8 = {}
			slot9 = {}

			if slot2[slot6] then
				for slot13, slot14 in ipairs(slot2[slot6]) do
					if slot14.target_type == 1 then
						uv0(slot8, slot14)
					elseif slot14.target_type == 2 then
						uv0(slot9, slot14)
					end
				end
			end

			uv0(slot0.welfareGrowData, slot8)
			uv0(slot0.welfareGiftData, slot9)
		end
	end
end

function ActionModel.setHalfGiftData(slot0, slot1)
	slot2 = Config.DayGoalsData.data_halfdiscount[slot1]
	slot0.walfareHalfData = {}

	for slot6 = 1, 7 do
		slot0.walfareHalfData[slot6] = {}
	end

	if slot2 then
		for slot6, slot7 in pairs(slot2) do
			uv0(slot0.walfareHalfData[slot7[1].day], slot7[1])
		end

		for slot6 = 1, 7 do
			uv1(slot0.walfareHalfData[slot6], function (slot0, slot1)
				return slot0.id < slot1.id
			end)
		end
	end
end

function ActionModel.getWalfareData(slot0, slot1)
	if slot0.welfareData and slot0.welfareData[slot1] then
		return slot0.welfareData[slot1] or {}
	end

	return {}
end

function ActionModel.getWalfareGrowUpData(slot0, slot1)
	if slot0.welfareGrowData and slot0.welfareGrowData[slot1] then
		return slot0.welfareGrowData[slot1] or {}
	end

	return {}
end

function ActionModel.getWelfareGiftData(slot0, slot1)
	if slot0.welfareGiftData and slot0.welfareGiftData[slot1] then
		return slot0.welfareGiftData[slot1] or {}
	end

	return {}
end

function ActionModel.getWelfareHalfData(slot0, slot1)
	if slot0.walfareHalfData and slot0.walfareHalfData[slot1] then
		return slot0.walfareHalfData[slot1] or {}
	end

	return {}
end

function ActionModel.setSevenGoalWelfareList(slot0, slot1)
	slot0.welfareList = {}

	for slot5 = 1, 7 do
		slot0.welfareList[slot5] = {}
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6 and slot6.day and slot0.welfareList[slot6.day] then
			uv0(slot0.welfareList[slot6.day], slot6)
		end
	end
end

function ActionModel.getSevenGoalWelfareList(slot0, slot1)
	if slot0.welfareList and slot0.welfareList[slot1] then
		return slot0.welfareList[slot1] or {}
	end

	return {}
end

function ActionModel.updataGoalWelfareList(slot0, slot1, slot2, slot3)
	slot0.welfareList[slot1 or 1][slot2 or 1].status = slot3 or false
end

function ActionModel.setSevenGoalGrowList(slot0, slot1)
	slot2 = {
		[slot6] = {}
	}

	for slot6 = 1, 7 do
	end

	for slot6, slot7 in pairs(slot1) do
		uv0(slot2[slot7.day], slot7)
	end

	slot0.serverGrowListData = {}
	slot0.serverGiftListData = {}

	for slot6, slot7 in pairs(slot2) do
		slot8 = {}
		slot9 = {}

		for slot13, slot14 in pairs(slot2[slot6]) do
			if slot14.target_type == 1 then
				uv0(slot8, slot14)
			elseif slot14.target_type == 2 then
				uv0(slot9, slot14)
			end
		end

		uv0(slot0.serverGrowListData, slot8)
		uv0(slot0.serverGiftListData, slot9)
	end
end

function ActionModel.getServerGrowListData(slot0, slot1)
	if slot0.serverGrowListData and slot0.serverGrowListData[slot1] then
		return slot0.serverGrowListData[slot1] or {}
	end

	return {}
end

function ActionModel.updataGrowListData(slot0, slot1, slot2, slot3)
	slot0.serverGrowListData[slot1 or 1][slot2 or 1].status = slot3 or false
end

function ActionModel.getServerGiftListData(slot0, slot1)
	if slot0.serverGiftListData and slot0.serverGiftListData[slot1] then
		return slot0.serverGiftListData[slot1] or {}
	end

	return {}
end

function ActionModel.updataGiftListData(slot0, slot1, slot2, slot3)
	slot0.serverGiftListData[slot1 or 1][slot2 or 1].status = slot3 or false
end

function ActionModel.setHalfGiftList(slot0, slot1)
	slot0.halfGiftList = {}

	for slot5 = 1, 7 do
		slot0.halfGiftList[slot5] = {}
	end

	for slot5 = 1, 7 do
		for slot10, slot11 in ipairs(slot0:getWelfareHalfData(slot5)) do
			for slot15, slot16 in ipairs(slot1) do
				if slot11.id == slot16.day then
					uv0(slot0.halfGiftList[slot5], slot16)
				end
			end
		end
	end
end

function ActionModel.getHalfGiftList(slot0, slot1)
	if slot0.halfGiftList and slot0.halfGiftList[slot1] then
		return slot0.halfGiftList[slot1] or {}
	end

	return {}
end

function ActionModel.updataHalfListData(slot0, slot1, slot2, slot3)
	slot0.halfGiftList[slot1 or 1][slot2 or 1].status = slot3 or false
end

function ActionModel.setSevenGoalBoxList(slot0, slot1)
	slot0.boxList = slot1
end

function ActionModel.getSevenGoalBoxList(slot0)
	if slot0.boxList then
		uv0(slot0.boxList, function (slot0, slot1)
			return slot0.goal_id < slot1.goal_id
		end)

		return slot0.boxList
	end

	return {}
end

function ActionModel.updataBoxListData(slot0, slot1, slot2)
	slot0.boxList[slot1 or 1].status = slot2 or false
end

function ActionModel.setLucklyRewardData(slot0)
	slot0.lucky_num1, slot0.lucky_num2 = slot0:sortLucklyData(Config.DialData.data_get_lucky_award)
end

function ActionModel.getLucklyRewardData(slot0, slot1)
	if not slot0.lucky_num1 or not slot0.lucky_num2 then
		return {}
	end

	if slot1 == 1 then
		return slot0.lucky_num1 or {}
	elseif slot1 == 2 then
		return slot0.lucky_num2 or {}
	end
end

function ActionModel.setBuyRewardData(slot0)
	slot0.buy_num_list1, slot0.buy_num_list2 = slot0:sortLucklyData(Config.DialData.data_get_limit_open, true)
end

function ActionModel.getBuyRewardData(slot0, slot1)
	if not slot0.buy_num_list1 or not slot0.buy_num_list2 then
		return
	end

	if slot1 == 1 then
		return slot0.buy_num_list1 or {}
	elseif slot1 == 2 then
		return slot0.buy_num_list2 or {}
	end
end

function ActionModel.sortLucklyData(slot0, slot1, slot2)
	slot4 = {}

	for slot8, slot9 in pairs(slot1) do
		if slot9.type == 1 then
			uv0({}, slot9)
		elseif slot9.type == 2 then
			uv0(slot4, slot9)
		end
	end

	if slot2 then
		uv1(slot3, function (slot0, slot1)
			return slot0.type2 < slot1.type2
		end)
		uv1(slot4, function (slot0, slot1)
			return slot0.type2 < slot1.type2
		end)
	else
		uv1(slot3, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
		uv1(slot4, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	return slot3, slot4
end

function ActionModel.setTreasureInitData(slot0, slot1)
	slot0.treasureInitData = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.treasureInitData[slot6.type] = slot6
	end
end

function ActionModel.getTreasureInitData(slot0, slot1)
	if not slot0.treasureInitData then
		return {}
	end

	return slot0.treasureInitData[slot1] or {}
end

function ActionModel.updataTreasureInitData(slot0, slot1, slot2)
	if not slot0.treasureInitData then
		return
	end

	report_treasure(slot2.type, slot2.count - (slot0.treasureInitData[slot1] and slot0.treasureInitData[slot1].count or 0))

	slot0.treasureInitData[slot1].count = slot2.count
	slot0.treasureInitData[slot1].end_time = slot2.end_time
	slot0.treasureInitData[slot1].lucky = slot2.lucky
	slot0.treasureInitData[slot1].lucky_award = slot2.lucky_award
	slot0.treasureInitData[slot1].rand_lists = slot2.rand_lists
end

function ActionModel.updataTreasureLogData(slot0, slot1, slot2)
	if not slot0.treasureInitData then
		return
	end

	slot0.treasureInitData[slot1].log_list = slot2
end

function ActionModel.lucklyRedPoint(slot0)
	slot0:setLucklyRewardData()

	slot0.tab_redpoint = {
		false,
		false
	}

	for slot4 = 1, 2 do
		slot6 = slot0:getTreasureInitData(slot4)
		slot7 = false

		for slot11, slot12 in ipairs(slot0:getLucklyRewardData(slot4)) do
			slot13 = true

			for slot17, slot18 in ipairs(slot6.lucky_award) do
				if slot12.id == slot18.lucky then
					slot13 = false

					break
				end
			end

			if slot6.lucky < slot12.lucky_val then
				slot13 = false
			end

			if slot13 == true then
				slot7 = true

				break
			end
		end

		slot0:setLucklyTabRedPoint(slot4, slot7)
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.lucky_treasure, slot0.tab_redpoint[1] or slot0.tab_redpoint[2])
end

function ActionModel.setLucklyTabRedPoint(slot0, slot1, slot2)
	slot0.tab_redpoint[slot1] = slot2
end

function ActionModel.getLucklyTabRedPoint(slot0, slot1)
	if slot0.tab_redpoint and slot0.tab_redpoint[slot1] then
		return slot0.tab_redpoint[slot1]
	end

	return false
end

function ActionModel.setFirstRechargeData(slot0)
	slot0.firstRewardData1 = {}
	slot0.firstRewardData2 = {}

	for slot5, slot6 in pairs(Config.ChargeData.data_first_charge_data) do
		if slot6.fid == 1 then
			uv0(slot0.firstRewardData1, slot6)
		elseif slot6.fid == 2 then
			uv0(slot0.firstRewardData2, slot6)
		end
	end

	uv1(slot0.firstRewardData1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	uv1(slot0.firstRewardData2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function ActionModel.getFirstRechargeData(slot0, slot1)
	if not slot0.firstRewardData1 or not slot0.firstRewardData2 then
		return
	end

	if slot1 == 1 then
		return slot0.firstRewardData1 or {}
	elseif slot1 == 2 then
		return slot0.firstRewardData2 or {}
	end
end

function ActionModel.setFirstBtnStatus(slot0, slot1)
	if slot1 and next(slot1) then
		slot0.firstBtnStatus = {}

		for slot5, slot6 in ipairs(slot1) do
			slot0.firstBtnStatus[slot6.id] = slot6.status
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.status == 1 then
				slot2 = true

				break
			end
		end

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.first_charge, slot2)
	end
end

function ActionModel.getFirstBtnStatus(slot0, slot1)
	if not slot0.firstBtnStatus then
		return 0
	end

	return slot0.firstBtnStatus[slot1] or 0
end

function ActionModel.setOpenFundIds(slot0, slot1)
	slot0.fund_id_list = {}
	slot0.welfare_fund_id_list = {}

	for slot6, slot7 in ipairs(slot1 or {}) do
		if slot7.show == 1 then
			table.insert(slot0.fund_id_list, {
				status = slot7.status,
				show = slot7.show,
				id = slot7.id
			})
		elseif slot7.show == 0 then
			table.insert(slot0.welfare_fund_id_list, slot8)
		end
	end

	GlobalEvent:getInstance():Fire(ActionEvent.UPDATA_WELFARE_FUND__STATUS_EVENT, slot0.welfare_fund_id_list)
	slot0:checkFundRedStatus()
	slot0:checkWelfareFundRedStatus()
end

function ActionModel.getFundIsInWelfare(slot0)
	return slot0.welfare_fund_id_list or {}
end

function ActionModel.getOpenFundIds(slot0)
	return slot0.fund_id_list or {}
end

function ActionModel.setFundSrvData(slot0, slot1)
	slot0.fund_datas = slot0.fund_datas or {}

	if slot1 and slot1.id then
		slot0.fund_datas[slot1.id] = slot1

		slot0:updateFundStatus(slot1.id, slot1.status)
	end
end

function ActionModel.setWelfareFundSrvData(slot0, slot1)
	slot0.welfare_fund_datas = slot0.welfare_fund_datas or {}

	if not slot0.welfare_fund_id_list then
		return
	end

	if slot1 and slot1.id and next(slot0.welfare_fund_id_list) ~= nil then
		slot0.welfare_fund_datas[slot1.id] = slot1

		slot0:updateWelfareFundStatus(slot1.id, slot1.status)
	end
end

function ActionModel.getFundSrvDataById(slot0, slot1)
	slot0.fund_datas = slot0.fund_datas or {}

	return slot0.fund_datas[slot1] or {}
end

function ActionModel.clearFundSrvData(slot0)
	slot0.fund_datas = {}
end

function ActionModel.updateFundStatus(slot0, slot1, slot2)
	slot0.fund_id_list = slot0.fund_id_list or {}

	for slot6, slot7 in pairs(slot0.fund_id_list) do
		if slot7.id == slot1 then
			slot7.status = slot2

			break
		end
	end

	slot0:checkFundRedStatus()
end

function ActionModel.updateWelfareFundStatus(slot0, slot1, slot2)
	slot0.welfare_fund_id_list = slot0.welfare_fund_id_list or {}

	for slot6, slot7 in pairs(slot0.welfare_fund_id_list) do
		if slot7.id == slot1 then
			slot7.status = slot2

			break
		end
	end

	slot0:checkWelfareFundRedStatus()
end

function ActionModel.checkFundRedStatus(slot0)
	slot0.fund_id_list = slot0.fund_id_list or {}

	for slot4, slot5 in pairs(slot0.fund_id_list) do
		if slot5.id == FundType.type_one then
			slot0:updateFundRedStatus(FundRedIndex.fund_get_one, slot5.status == 1)
			slot0:updateFundRedStatus(FundRedIndex.fund_buy_one, slot5.status == 0)
		elseif slot5.id == FundType.type_two then
			slot0:updateFundRedStatus(FundRedIndex.fund_get_two, slot5.status == 1)
			slot0:updateFundRedStatus(FundRedIndex.fund_buy_two, slot5.status == 0)
		end
	end
end

function ActionModel.checkWelfareFundRedStatus(slot0)
	slot0.welfare_fund_id_list = slot0.welfare_fund_id_list or {}

	for slot4, slot5 in pairs(slot0.welfare_fund_id_list) do
		if (slot5.id == WelfareIcon.fund_one or slot5.id == WelfareIcon.fund_two) and slot5.show == 0 then
			WelfareController:getInstance():setWelfareStatus(slot5.id, slot5.status == 1)
		end
	end
end

function ActionModel.getWelfareFundRedStatusByBid(slot0, slot1)
	return slot0.welfare_fund_id_list[slot1]
end

function ActionModel.updateFundRedStatus(slot0, slot1, slot2)
	if slot0.fund_red_list[slot1] == slot2 then
		return
	end

	if (slot1 == FundRedIndex.fund_buy_one or slot1 == FundRedIndex.fund_buy_two) and slot3 == false then
		return
	end

	slot0.fund_red_list[slot1] = slot2
	slot4 = false

	for slot8, slot9 in pairs(slot0.fund_red_list) do
		if slot9 == true then
			slot4 = true

			break
		end
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.fund, slot4)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATA_FUND_RED_STATUS_EVENT, slot1, slot2)
end

function ActionModel.getFundRedStatusByBid(slot0, slot1)
	return slot0.fund_red_list[slot1]
end

function ActionModel.sortItemList(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	table.sort(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.aim < slot1.aim
		end
	end)
end

function ActionModel.setCountDownTime(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 > 0 then
		slot0:setTimeFormatString(slot1, slot2, slot3)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)

				if uv2 then
					uv1:setString(TI18N("活动已结束"))
					uv1:setTextColor(uv3[1])
				else
					uv1:setString("00:00:00")
					uv1:setTextColor(uv3[2])
				end
			else
				uv4:setTimeFormatString(uv1, uv0, uv2)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1, slot2, slot3)
	end
end

function ActionModel.setTimeFormatString(slot0, slot1, slot2, slot3)
	if slot2 > 0 then
		slot1:setString(TimeTool.GetTimeForFunction(slot2))
	else
		doStopAllActions(slot1)

		if slot3 then
			slot1:setString(TI18N("活动已结束"))
			slot1:setTextColor(uv0[1])
		else
			slot1:setString("00:00:00")
			slot1:setTextColor(uv0[2])
		end
	end
end

function ActionModel.updateGiftRedPointStatus(slot0, slot1)
	slot0.gift_id_list = slot0.gift_id_list or {}
	slot0.gift_id_list[slot1.bid] = slot1
end

function ActionModel.getGiftRedStatusByBid(slot0, slot1)
	if not slot0.gift_id_list then
		return
	end

	if slot0.gift_id_list[slot1] then
		return slot2.status
	end
end

function ActionModel.setGiftRedStatus(slot0, slot1)
	if not slot0.gift_id_list then
		return
	end

	slot3 = slot1.status

	if slot0.gift_id_list[slot1.bid] and slot4.status ~= slot3 then
		slot4.status = slot3

		GlobalEvent:getInstance():Fire(ActionEvent.SHOW_ACTIVITY_RED_POINT, slot2, slot3)
	end
end

function ActionModel.setColthesDataInit(slot0)
	slot0.hero_clothes_data = {}
end

function ActionModel.setHeroClothesShopData(slot0, slot1)
	if Config.HolidayHolyEqmData.data_reward_list and slot2[slot1] then
		slot0.hero_clothes_data = {}

		for slot6, slot7 in pairs(slot2[slot1]) do
			uv0(slot0.hero_clothes_data, slot7)
		end

		uv1(slot0.hero_clothes_data, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end
end

function ActionModel.getHeroClothesShopData(slot0)
	if slot0.hero_clothes_data and next(slot0.hero_clothes_data) ~= nil then
		return slot0.hero_clothes_data
	end

	return nil
end

function ActionModel.setLimitTypeData(slot0, slot1)
	slot0.limit_type_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.limit_type_data[slot6.id] = slot6
	end
end

function ActionModel.getLimitTypeData(slot0, slot1)
	if slot0.limit_type_data and slot0.limit_type_data[slot1] then
		return slot0.limit_type_data[slot1]
	end

	return nil
end

function ActionModel.setStoneShopData(slot0, slot1)
	slot0.stone_shop_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.stone_shop_data[slot6.id] = slot6
	end
end

function ActionModel.getStoneShopData(slot0, slot1)
	if slot0.stone_shop_data and slot0.stone_shop_data[slot1] then
		return slot0.stone_shop_data[slot1]
	end

	return nil
end

function ActionModel.setSevenChargeData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if not slot0.seven_charge_list then
		slot0.seven_charge_list = {}
	end

	if not slot0.daily_reward_list then
		slot0.daily_reward_list = {}
	end

	slot0.cur_day = 1

	if slot1.args and next(slot1.args) ~= nil and (keyfind("args_key", 1, slot1.args) or nil) then
		slot0.cur_day = slot2.args_val

		if slot0.cur_day > 7 then
			slot0.cur_day = 7
		end
	end

	slot0.is_get_resignin = false

	if slot1.args and next(slot1.args) ~= nil and (keyfind("args_key", 2, slot1.args) or nil) and slot2.args_val == 1 then
		slot0.is_get_resignin = true
	end

	if slot1.aim_list and next(slot1.aim_list) ~= nil then
		for slot5, slot6 in pairs(slot1.aim_list) do
			slot0.seven_charge_list[slot5] = slot6
			slot0.daily_reward_list[slot5] = slot6.item_list

			for slot10, slot11 in pairs(slot6.aim_args) do
				if slot11.aim_args_key == ActionExtType.RechageCurCount then
					slot0.seven_charge_list[slot5].need_charge = slot11.aim_args_val
				elseif slot12 == ActionExtType.ExbItemBid then
					slot0.seven_charge_list[slot5].item_bid = slot11.aim_args_val
				elseif slot12 == ActionExtType.ExbItemNum then
					slot0.seven_charge_list[slot5].item_num = slot11.aim_args_val
				elseif slot12 == ActionExtType.ResigninCharge then
					slot0.seven_charge_list[slot5].re_signin_charge = slot11.aim_args_val
				end
			end
		end
	end
end

function ActionModel.getCurChargeDay(slot0)
	if slot0.cur_day then
		return slot0.cur_day
	end

	return 1
end

function ActionModel.getIsGetResignin(slot0)
	return slot0.is_get_resignin or false
end

function ActionModel.getSevenChargeData(slot0)
	if slot0.seven_charge_list then
		return slot0.seven_charge_list
	end

	return nil
end

function ActionModel.getSevenChargeDataByDay(slot0, slot1)
	if slot0.seven_charge_list then
		for slot5, slot6 in pairs(slot0.seven_charge_list) do
			if slot6.aim == slot1 then
				return slot6
			end
		end
	end

	return nil
end

function ActionModel.getDailyRewardListById(slot0, slot1)
	if slot0.daily_reward_list and slot0.daily_reward_list[slot1] then
		return slot0.daily_reward_list[slot1]
	end

	return nil
end

function ActionModel.setLotteryItemData(slot0, slot1, slot2)
	if Config.HolidaySkinDrawData.data_lottery_stock and slot3[slot2] then
		slot4 = {
			[slot9.sort] = 1
		}

		for slot8, slot9 in pairs(slot3[slot2]) do
			-- Nothing
		end

		for slot8, slot9 in pairs(slot1) do
			slot4[slot9.sort] = 0
		end

		slot0.lottery_item_data = slot4
	end
end

function ActionModel.updataLotteryItemData(slot0, slot1)
	if slot0.lottery_item_data and slot0.lottery_item_data[slot1] then
		slot0.lottery_item_data[slot1] = 1
	end
end

function ActionModel.getLotteryItemData(slot0, slot1)
	if slot0.lottery_item_data and slot0.lottery_item_data[slot1] then
		return slot0.lottery_item_data[slot1]
	end

	return 0
end

function ActionModel.setPerferPrizeByJsonObj(slot0, slot1)
	if (slot1 or {}).data == nil then
		return
	end

	if slot2.banner then
		if slot2.banner.img then
			slot0:setPerferDownLoadPng(slot2.banner.img)
		end

		if slot2.banner.url then
			slot0:setPerferJumpurl(slot2.banner.url)
		end
	end

	if slot2.coupons then
		slot0:setSavePerferData(slot2.coupons)

		slot3 = {}

		for slot8, slot9 in pairs(slot2.coupons) do
			if GameNet:getInstance():getTime() < tonumber(slot9.end_ts) then
				table.insert(slot3, slot9)
			end
		end

		slot0:setSavePerferData(slot3)

		if #slot3 >= 1 then
			slot5 = 1
		end

		GlobalEvent:getInstance():Fire(ActionEvent.ACTION_PERFER_ISOPEN, slot5)
	end

	GlobalEvent:getInstance():Fire(ActionEvent.ACTION_PERFER_GET_DATA_EVENT)
end

function ActionModel.setSavePerferData(slot0, slot1)
	slot0.perfer_data = slot1
end

function ActionModel.getSavePerferData(slot0)
	if slot0.perfer_data then
		return slot0.perfer_data
	end

	return {}
end

function ActionModel.setPerferDownLoadPng(slot0, slot1)
	slot0.download_path = slot1
end

function ActionModel.getPerferDownLoadPng(slot0)
	if slot0.download_path then
		return slot0.download_path
	end

	return nil
end

function ActionModel.setPerferJumpurl(slot0, slot1)
	slot0.jump_url = slot1
end

function ActionModel.getPerferJumpurl(slot0)
	if slot0.jump_url then
		return slot0.jump_url
	end

	return nil
end

function ActionModel.setFortuneBagCampId(slot0, slot1)
	slot0.fortune_bag_camp_id = slot1
end

function ActionModel.getFortuneBagCampId(slot0)
	if slot0.fortune_bag_camp_id then
		return slot0.fortune_bag_camp_id
	end

	return 17553
end

function ActionModel.setLuckyDogData(slot0, slot1)
	if slot1 == nil or slot1.period == nil or slot1.info == nil then
		return
	end

	slot0.lucky_dog_data = {
		period = slot1.period,
		start_time = slot1.start_time,
		end_time = slot1.end_time,
		info = {}
	}

	for slot5, slot6 in pairs(slot1.info) do
		slot0.lucky_dog_data.info[slot6.period] = deepCopy(slot6)
	end
end

function ActionModel.getLuckyDogData(slot0)
	return slot0.lucky_dog_data
end

function ActionModel.getLuckyDogPeriod(slot0)
	if slot0.lucky_dog_data and slot0.lucky_dog_data.period then
		return slot0.lucky_dog_data.period
	end
end

function ActionModel.getLuckyDogBaseData(slot0, slot1)
	if slot0.lucky_dog_data and slot0.lucky_dog_data.info then
		for slot5, slot6 in pairs(slot0.lucky_dog_data.info) do
			if slot6.period == slot1 then
				return slot6
			end
		end
	end
end

function ActionModel.getLuckyDogTaskData(slot0, slot1)
	slot2 = {}

	if slot0:getLuckyDogBaseData(slot1) and slot3.quests then
		for slot7, slot8 in pairs(slot3.quests) do
			slot9 = deepCopy(slot8)
			slot9.index = slot7
			slot9.state = slot3.state
			slot9.period = slot3.period

			uv0(slot2, slot9)
		end
	end

	return slot2
end

function ActionModel.getLuckyDogPeriodRed(slot0, slot1)
	if slot0.lucky_dog_data.info and slot0.lucky_dog_data.info[slot1] then
		for slot5, slot6 in pairs(slot0.lucky_dog_data.info[slot1].quests) do
			if slot6.finish == 1 and slot0.lucky_dog_data.info[slot1].state == 1 then
				return true
			end
		end

		return slot0.lucky_dog_data.info[slot1].finish == 1
	end

	return false
end

function ActionModel.getLuckyDogAllRed(slot0)
	if slot0.lucky_dog_data and slot0.lucky_dog_data.info then
		for slot4, slot5 in pairs(slot0.lucky_dog_data.info) do
			if slot0:getLuckyDogPeriodRed(slot4) then
				return true
			end
		end
	end

	return false
end

function ActionModel.getLuckyDogParticipateIn(slot0, slot1)
	if slot0.lucky_dog_data and slot0.lucky_dog_data.info and slot0.lucky_dog_data.info[slot1] then
		for slot5, slot6 in pairs(slot0.lucky_dog_data.info[slot1].quests) do
			if slot6.finish == 2 then
				return true
			end
		end
	end

	return false
end

function ActionModel.setActionTimeCollectData(slot0, slot1)
	slot0.action_time_collect_data = slot1
end

function ActionModel.getActionTimeCollectData(slot0)
	return slot0.action_time_collect_data
end

function ActionModel.setSweetData(slot0, slot1)
	slot0.sweet_data = slot1

	slot0:calculSweetAwardStatus()
end

function ActionModel.getSweetData(slot0)
	return slot0.sweet_data
end

function ActionModel.getSweetMaxScore(slot0)
	if slot0.sweet_data then
		return slot0.sweet_data.max_acc_score or 0
	end

	return 0
end

function ActionModel.calculSweetAwardStatus(slot0)
	slot0.sweet_award_status = fasle

	if slot0.sweet_data and slot0.sweet_data.max_acc_score and slot0.sweet_data.max_acc_score > 0 then
		for slot4, slot5 in pairs(Config.HolidayValentinesData.data_award) do
			if slot5.count / 1000 * slot0.sweet_data.max_acc_score <= slot0.sweet_data.acc_score then
				slot0.sweet_award_status = true

				for slot10, slot11 in pairs(slot0.sweet_data.reward) do
					if slot11.id == slot5.id then
						slot0.sweet_award_status = fasle

						break
					end
				end
			end

			if slot0.sweet_award_status == true then
				break
			end
		end
	end
end

function ActionModel.getSweetAwardStatus(slot0)
	return slot0.sweet_award_status or false
end

function ActionModel.setWhiteDayData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.white_day_data = slot1
end

function ActionModel.getWhiteDayHeadId(slot0)
	if slot0.white_day_data and slot0.white_day_data.id and ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.white_day) and Config.HolidayValentineBossData.data_boss_list[slot1.camp_id] and slot3[slot0.white_day_data.id] and slot4.head_icon then
		return slot4.head_icon
	end

	return 2017
end

function ActionModel.getHarmRewardInfo(slot0, slot1)
	slot1 = slot1 or 0

	if slot0.white_day_data == nil or slot0.white_day_data.id == nil then
		return 0
	end

	if Config.HolidayValentineBossData.data_award_list[slot0.white_day_data.id] and next(slot2) ~= nil then
		uv0(slot2, function (slot0, slot1)
			return slot0.min < slot1.min
		end)

		for slot8, slot9 in ipairs(slot2) do
			if slot8 == 1 and slot9.min < slot1 and slot1 <= slot9.max then
				return slot9.box_count or 0, slot9, slot2[#slot2].max
			elseif slot8 == slot3 and slot9.min < slot1 then
				return slot9.box_count or 0, slot9, slot4
			elseif slot9.min < slot1 and slot1 <= slot9.max then
				return slot9.box_count or 0, slot9, slot4
			end
		end
	end

	return 0
end

function ActionModel.setSuperWeekData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.super_week_data = slot1
end

function ActionModel.getSuperWeekAward(slot0)
	if slot0.super_week_data and slot0.super_week_data.award_list then
		uv0(slot0.super_week_data.award_list, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		return slot0.super_week_data.award_list
	end

	return {}
end

function ActionModel.__delete(slot0)
end
