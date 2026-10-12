ActionController = ActionController or BaseClass(BaseController)

function ActionController.config(slot0)
	slot0.model = ActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.mainui_ctrl = MainuiController:getInstance()
	slot0.holiday_list = {}
	slot0.holiday_award_list = {}
	slot0.holiday_del_list = {}
	slot0.need_show_init_red = {}
	slot0.cache_function_list = {}
	slot0.return_action_shop_first_red = true
	slot0.return_action_shop_red = false
end

function ActionController.getModel(slot0)
	return slot0.model
end

function ActionController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil

			uv0:needRequireData()
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:needRequireData(true)
		end)
	end
end

function ActionController.needRequireData(slot0, slot1)
	slot0:openActionMainPanel(false)

	slot0.holiday_list = {}
	slot0.holiday_award_list = {}
	slot0.need_show_init_red = {}
	slot0.holiday_del_list = {}
	slot0.is_init_require = true

	slot0.model:clearFundSrvData()
	slot0:requestActionStatus()
	slot0:requestHolidayList()
	slot0:cs21100()
end

function ActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(21000, "on21000")
	slot0:RegisterProtocal(21001, "on21001")
	slot0:RegisterProtocal(10922, "on10922")
	slot0:RegisterProtocal(10923, "on10923")
	slot0:RegisterProtocal(10924, "on10924")
	slot0:RegisterProtocal(10925, "on10925")
	slot0:RegisterProtocal(21100, "on21100")
	slot0:RegisterProtocal(21101, "on21101")
	slot0:RegisterProtocal(16601, "on16601")
	slot0:RegisterProtocal(16602, "on16602")
	slot0:RegisterProtocal(16606, "on16606")
	slot0:RegisterProtocal(16603, "on16603")
	slot0:RegisterProtocal(16604, "on16604")
	slot0:RegisterProtocal(16607, "on16607")
	slot0:RegisterProtocal(16620, "on16620")
	slot0:RegisterProtocal(22700, "on22700")
	slot0:RegisterProtocal(22701, "on22701")
	slot0:RegisterProtocal(22702, "on22702")
	slot0:RegisterProtocal(22703, "on22703")
	slot0:RegisterProtocal(22704, "on22704")
	slot0:RegisterProtocal(13601, "handle13601")
	slot0:RegisterProtocal(13602, "handle13602")
	slot0:RegisterProtocal(16637, "handle16637")
	slot0:RegisterProtocal(16638, "handle16638")
	slot0:RegisterProtocal(16639, "handle16639")
	slot0:RegisterProtocal(16641, "handle16641")
	slot0:RegisterProtocal(16642, "handle16642")
	slot0:RegisterProtocal(16643, "handle16643")
	slot0:RegisterProtocal(21200, "handle21200")
	slot0:RegisterProtocal(21201, "handle21201")
	slot0:RegisterProtocal(21210, "handle21210")
	slot0:RegisterProtocal(21211, "handle21211")
	slot0:RegisterProtocal(16650, "handle16650")
	slot0:RegisterProtocal(24700, "handle24700")
	slot0:RegisterProtocal(24701, "handle24701")
	slot0:RegisterProtocal(24702, "handle24702")
	slot0:RegisterProtocal(24810, "handle24810")
	slot0:RegisterProtocal(24811, "handle24811")
	slot0:RegisterProtocal(24812, "handle24812")
	slot0:RegisterProtocal(24813, "handle24813")
	slot0:RegisterProtocal(24814, "handle24814")
	slot0:RegisterProtocal(24815, "handle24815")
	slot0:RegisterProtocal(24816, "handle24816")
	slot0:RegisterProtocal(24817, "handle24817")
	slot0:RegisterProtocal(24818, "handle24818")
	slot0:RegisterProtocal(27300, "handle27300")
	slot0:RegisterProtocal(27301, "handle27301")
	slot0:RegisterProtocal(21016, "handle21016")
	slot0:RegisterProtocal(16665, "handle16665")
	slot0:RegisterProtocal(16666, "handle16666")
	slot0:RegisterProtocal(16686, "handle16686")
	slot0:RegisterProtocal(16687, "handle16687")
	slot0:RegisterProtocal(16688, "handle16688")
	slot0:RegisterProtocal(16689, "handle16689")
	slot0:RegisterProtocal(16695, "handle16695")
	slot0:RegisterProtocal(25400, "handle25400")
	slot0:RegisterProtocal(25401, "handle25401")
	slot0:RegisterProtocal(25402, "handle25402")
	slot0:RegisterProtocal(25403, "handle25403")
	slot0:RegisterProtocal(25404, "handle25404")
	slot0:RegisterProtocal(25405, "handle25405")
	slot0:RegisterProtocal(25500, "handle25500")
	slot0:RegisterProtocal(11071, "handle11071")
	slot0:RegisterProtocal(11072, "handle11072")
	slot0:RegisterProtocal(11072, "handle11074")
	slot0:RegisterProtocal(26600, "handle26600")
	slot0:RegisterProtocal(26601, "handle26601")
	slot0:RegisterProtocal(26602, "handle26602")
	slot0:RegisterProtocal(21020, "handle21020")
	slot0:RegisterProtocal(16696, "handle16696")
	slot0:RegisterProtocal(28100, "handle28100")
	slot0:RegisterProtocal(28101, "handle28101")
	slot0:RegisterProtocal(28102, "handle28102")
	slot0:RegisterProtocal(28103, "handle28103")
	slot0:RegisterProtocal(26530, "handle26530")
	slot0:RegisterProtocal(28400, "handle28400")
	slot0:RegisterProtocal(28402, "handle28402")
	slot0:RegisterProtocal(28403, "handle28403")
	slot0:RegisterProtocal(28300, "handle28300")
	slot0:RegisterProtocal(28301, "handle28301")
	slot0:RegisterProtocal(28302, "handle28302")
	slot0:RegisterProtocal(28303, "handle28303")
	slot0:RegisterProtocal(28305, "handle28305")
	slot0:RegisterProtocal(28306, "handle28306")
	slot0:RegisterProtocal(28500, "handle28500")
	slot0:RegisterProtocal(28501, "handle28501")
	slot0:RegisterProtocal(28502, "handle28502")
	slot0:RegisterProtocal(16697, "handle16697")
	slot0:RegisterProtocal(16698, "handle16698")
	slot0:RegisterProtocal(28800, "handle28800")
	slot0:RegisterProtocal(28801, "handle28801")
	slot0:RegisterProtocal(28802, "handle28802")
	slot0:RegisterProtocal(28803, "handle28803")
	slot0:RegisterProtocal(10971, "handle10971")
	slot0:RegisterProtocal(16653, "handle16653")
	slot0:RegisterProtocal(16654, "handle16654")
end

function ActionController.requestActionStatus(slot0)
	if slot0.protocal_list_22 and next(slot0.protocal_list_22 or {}) ~= nil then
		for slot4, slot5 in pairs(slot0.protocal_list_22) do
			slot0.mainui_ctrl:removeFunctionIconById(slot5)
		end

		slot0.protocal_list_22 = {}
	end

	slot0:send10925(OrderActionEntranceID.entrance_id8)
	slot0:send10925(OrderActionEntranceID.entrance_id9)
	RenderMgr:getInstance():doNextFrame(function ()
		uv0:SendProtocal(10922, {})
		uv0:SendProtocal(10924, {})
	end)
end

function ActionController.requestActionRedStatus(slot0)
	ActionController:getInstance():sender16687({
		bid = ActionRankCommonType.open_server
	})
	ActionController:getInstance():sender16687({
		bid = ActionRankCommonType.high_value_gift
	})
	ActionController:getInstance():sender16687({
		bid = ActionRankCommonType.mysterious_store
	})
end

function ActionController.requestActionList(slot0)
	slot0:SendProtocal(16620, {
		id_list = {
			{
				id = 91005
			},
			{
				id = 991011
			},
			{
				id = 1011
			},
			{
				id = 991014
			},
			{
				id = 91014
			},
			{
				id = 991024
			},
			{
				id = 991025
			}
		}
	})
end

function ActionController.sender21000(slot0)
	slot0:SendProtocal(21000, {})
end

function ActionController.on21000(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in ipairs(slot1.first_gift) do
		if slot7.status == 1 then
			slot2 = slot7

			break
		end
	end

	if slot2 == nil then
		for slot6, slot7 in ipairs(slot1.first_gift) do
			if slot7.status == 0 then
				slot2 = slot7

				break
			end
		end
	end

	slot0.first_get_data = slot1.first_gift

	slot0.model:setFirstBtnStatus(slot1.first_gift)
	slot0.dispather:Fire(ActionEvent.Update_First_Charge_Status, slot1, slot2)
end

function ActionController.getFirstInfoData(slot0)
	return slot0.first_data_info
end

function ActionController.sender21001(slot0, slot1)
	slot0:SendProtocal(21001, {
		id = slot1
	})
end

function ActionController.on21001(slot0, slot1)
	message(slot1.msg)
end

function ActionController.on10922(slot0, slot1)
	if slot0.protocal_list_22 == nil then
		slot0.protocal_list_22 = {}
	end

	if slot1 ~= nil and slot1.act_list then
		for slot5, slot6 in ipairs(slot1.act_list) do
			slot0:handleActionStatusData(slot6)

			if slot6.status == ActionStatus.un_finish then
				slot0.protocal_list_22[slot6.id] = nil
			else
				slot0.protocal_list_22[slot6.id] = slot6.id
			end
		end
	end
end

function ActionController.on10923(slot0, slot1)
	slot0:handleActionStatusData(slot1)

	if slot1 ~= nil then
		if slot0.protocal_list_22 == nil then
			slot0.protocal_list_22 = {}
		end

		if slot1.status == ActionStatus.un_finish then
			slot0.protocal_list_22[slot1.id] = nil
		else
			slot0.protocal_list_22[slot1.id] = slot1.id
		end
	end
end

function ActionController.on10924(slot0, slot1)
	slot2 = false

	if slot1 ~= nil and slot1.act_list then
		for slot6, slot7 in ipairs(slot1.act_list) do
			slot0:handleActionStatusData(slot7)
		end
	end
end

function ActionController.setFirstTipsStatus(slot0, slot1, slot2)
	slot0.mainui_ctrl:setFunctionTipsStatus(slot1, slot2)
end

function ActionController.send10925(slot0, slot1)
	slot0:SendProtocal(10925, {
		id = slot1
	})
end

function ActionController.on10925(slot0, slot1)
	slot0:handleActionStatusData(slot1)
end

function ActionController.handleActionStatusData(slot0, slot1)
	if Config.FunctionData.data_info[25] then
		for slot7, slot8 in ipairs(Config.FunctionData.data_info[slot2].param1) do
			if slot8 == slot1.id then
				slot0.model:updateLimitIconData(slot1)

				if next(slot0.model:getLimitIconData()) == nil then
					slot0.mainui_ctrl:removeFunctionIconById(slot2)

					if slot0.mainui_ctrl.setMergeServerContainerPositionY then
						slot0.mainui_ctrl:setMergeServerContainerPositionY(false)
					end
				else
					slot0.mainui_ctrl:addFunctionIconById(slot2)

					if slot0.mainui_ctrl.setMergeServerContainerPositionY then
						slot0.mainui_ctrl:setMergeServerContainerPositionY(true)
					end
				end

				return
			end
		end
	end

	if slot1 then
		if Config.FunctionData.data_info[slot1.id] == nil then
			return
		end

		if slot1.status == ActionStatus.un_finish then
			slot0.mainui_ctrl:removeFunctionIconById(slot1.id)
		else
			slot0.mainui_ctrl:addFunctionIconById(slot1.id, slot1)

			if slot1.id == MainuiConst.icon.seven_rank then
				slot0:requestSevenDaysRank()
			elseif slot1.id == MainuiConst.icon.fund then
				slot0.model:checkFundRedStatus()
			end
		end
	end
end

function ActionController.openFirstChargeView(slot0, slot1)
	if slot1 then
		if not slot0.first_charge_win then
			slot0.first_charge_win = ActionFirstChargeWindow.New()
		end

		slot3 = 1

		if RoleController:getInstance():getRoleVo().vip_exp ~= 0 then
			slot3 = 2
		end

		if slot0.first_get_data then
			slot4 = false

			for slot8 = 1, 3 do
				if slot0.first_get_data[slot8].status == 1 then
					slot4 = true
					slot3 = 1

					break
				end
			end

			slot5 = false

			for slot9 = 4, 6 do
				if slot0.first_get_data[slot9].status == 1 then
					slot5 = true
					slot3 = 2

					break
				end
			end

			if slot4 == true and slot5 == true then
				slot3 = 1
			end
		end

		slot0.first_charge_win:open(slot3)
	elseif slot0.first_charge_win then
		slot0.first_charge_win:close()

		slot0.first_charge_win = nil
	end
end

function ActionController.openSevenGoalView(slot0, slot1)
	if slot1 then
		if not slot0.seven_goal_win then
			slot0.seven_goal_win = ActionSevenGoalWindow.New()
		end

		slot0.seven_goal_win:open()
	elseif slot0.seven_goal_win then
		slot0.seven_goal_win:close()

		slot0.seven_goal_win = nil
	end
end

function ActionController.cs13601(slot0)
	slot0:SendProtocal(13601, {})
end

function ActionController.handle13601(slot0, slot1)
	if slot1.period == 0 then
		return
	end

	slot0.model:setSevenGoldPeriod(slot1.period or 1)
	slot0.model:initSevenWalfare(slot1.period or 1)
	slot0.model:setSevenGoalWelfareList(slot1.welfare_list)
	slot0.model:setSevenGoalGrowList(slot1.grow_list)
	slot0.model:setHalfGiftList(slot1.price_list)
	slot0.model:setSevenGoalBoxList(slot1.finish_list, slot1.num)
	slot0.model:checkRedPoint(slot1.cur_day)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVENT_GOAL, slot1)
end

function ActionController.cs13602(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(13602, {
		type = slot1,
		day_type = slot2,
		id = slot3,
		item = slot4
	})
end

function ActionController.handle13602(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVENT_GET, slot1)
	end
end

function ActionController.openSevenLoginWin(slot0, slot1)
	if slot1 then
		if not slot0.seven_login_win then
			slot0.seven_login_win = ActionSevenLoginWindow.New()
		end

		slot0.seven_login_win:open()
	elseif slot0.seven_login_win then
		slot0.seven_login_win:close()

		slot0.seven_login_win = nil
	end
end

function ActionController.getSevenLoginRoot(slot0)
	slot1 = nil

	if slot0.seven_login_win then
		slot1 = slot0.seven_login_win.root_wnd
	end

	if slot0.model:getSevenLoginData() and slot2.type == 1 and slot0.eight_login_win then
		slot1 = slot0.eight_login_win.root_wnd
	end

	return slot1
end

function ActionController.openEightLoginWin(slot0, slot1)
	if slot1 then
		if not slot0.eight_login_win then
			slot0.eight_login_win = ActionEightLoginWindow.New()
		end

		slot0.eight_login_win:open()
	elseif slot0.eight_login_win then
		slot0.eight_login_win:close()

		slot0.eight_login_win = nil
	end
end

function ActionController.openActionLimitGiftMainWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.action_limit_gift then
			slot0.action_limit_gift = ActionLimitGiftMainWindow.New()
		end

		slot0.action_limit_gift:open(slot2)
	elseif slot0.action_limit_gift then
		slot0.action_limit_gift:close()

		slot0.action_limit_gift = nil
	end
end

function ActionController.openActionOpenServerGiftWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.action_open_server_recharge then
			slot0.action_open_server_recharge = ActionOpenServerGiftWindow.New()
		end

		slot0.action_open_server_recharge:open(slot2)
	elseif slot0.action_open_server_recharge then
		slot0.action_open_server_recharge:close()

		slot0.action_open_server_recharge = nil
	end
end

function ActionController.cs21100(slot0)
	slot0:SendProtocal(21100, {})
end

function ActionController.on21100(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot1.status_list) do
		if slot7.status == 2 then
			if slot1.type == 1 then
				slot0.mainui_ctrl:setFunctionTipsStatus(MainuiConst.icon.eight_login, true)

				break
			end

			slot0.mainui_ctrl:setFunctionTipsStatus(MainuiConst.icon.seven_login, true)

			break
		end
	end

	for slot7, slot8 in pairs(slot1.status_list) do
		if slot8.status == 3 then
			slot3 = 0 + 1
		end
	end

	if slot3 == #slot1.status_list then
		if slot1.type == 1 then
			slot0.mainui_ctrl:setFunctionTipsStatus(MainuiConst.icon.eight_login, false)
		else
			slot0.mainui_ctrl:setFunctionTipsStatus(MainuiConst.icon.seven_login, false)
		end
	end

	slot0.model:updateSevenLoginData(slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVEN_LOGIN_STATUS, slot1)
end

function ActionController.cs21101(slot0, slot1)
	slot0:SendProtocal(21101, {
		day = slot1
	})
end

function ActionController.on21101(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVEN_LOGIN_REWARDS, slot1)
		slot0:cs21100()
	end
end

function ActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function ActionController.openLuckyTreasureWin(slot0, slot1, slot2)
	slot2 = slot2 or 1

	if slot1 then
		if slot2 == 2 then
			ActionController:getInstance():getModel():setBuyRewardData()

			if MainuiController:getInstance():checkIsOpenByActivate(ActionController:getInstance():getModel():getBuyRewardData(slot2)[2].limit_open) == false then
				message(TI18N("人物等级不足"))

				return
			end
		end

		if not slot0.treasure_win then
			slot0.treasure_win = ActionTreasureWindow.New()
		end

		slot0.treasure_win:open(slot2)
	elseif slot0.treasure_win then
		slot0.treasure_win:close()

		slot0.treasure_win = nil
	end
end

function ActionController.getTreasureRoot(slot0)
	if slot0.treasure_win then
		return slot0.treasure_win.root_wnd
	end
end

function ActionController.openTreasureGetItemWindow(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		if not slot0.treasure_get_win then
			slot0.treasure_get_win = ActionTreasureGetWindow.New(slot2, slot3, slot4, slot5)
		end

		slot0.treasure_get_win:open()
	elseif slot0.treasure_get_win then
		slot0.treasure_get_win:close()

		slot0.treasure_get_win = nil
	end
end

function ActionController.openDirectBuyGiftWin(slot0, slot1, slot2)
	if slot1 then
		if not slot0.buygift_win then
			slot0.buygift_win = ActionDirectBuygiftWindow.New()
		end

		slot0.buygift_win:open(slot2)
	elseif slot0.buygift_win then
		slot0.buygift_win:close()

		slot0.buygift_win = nil
	end
end

function ActionController.openSevenRankWin(slot0, slot1)
	if slot1 then
		if not slot0.seven_rank_win then
			slot0.seven_rank_win = ActionSevenRankWindow.New()
		end

		slot0.seven_rank_win:open()
	elseif slot0.seven_rank_win then
		slot0.seven_rank_win:close()

		slot0.seven_rank_win = nil
	end
end

function ActionController.openCorssserverRankWin(slot0, slot1)
	if slot1 then
		if not slot0.crossserver_rank_win then
			slot0.crossserver_rank_win = ActionCrossServerRankWindow.New()
		end

		slot0.crossserver_rank_win:open()
	elseif slot0.crossserver_rank_win then
		slot0.crossserver_rank_win:close()

		slot0.crossserver_rank_win = nil
	end
end

function ActionController.sender22700(slot0, slot1)
	slot0:SendProtocal(22700, {
		is_cluster = slot1 or 0
	})
end

function ActionController.on22700(slot0, slot1)
	if slot1.is_cluster == 1 then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_CROSSSERVER_RANK_LIST, slot1)
	elseif slot1.is_cluster == 0 then
		slot0:openSevenRankWin(true)
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVEN_RANK_LIST, slot1)
	end
end

function ActionController.sender22701(slot0, slot1)
	slot0:SendProtocal(22701, {
		id = slot1
	})
end

function ActionController.on22701(slot0, slot1)
	if slot0.model:checkIsCrossServerRankList(slot1.id) then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_CROSSSERVER_RANK_DATA, slot1)
	else
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVEN_RANK_DATA, slot1)
	end
end

function ActionController.openFestvalLoginWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.festval_login_win then
			slot0.festval_login_win = ActionFestvalLoginWindow.New(slot2)
		end

		slot0.festval_login_win:open()
	elseif slot0.festval_login_win then
		slot0.festval_login_win:close()

		slot0.festval_login_win = nil
	end
end

function ActionController.openPreferentialWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.preferential_win then
			slot0.preferential_win = ActionPreferentialWindow.New(slot3)
		end

		slot0.preferential_win:open(slot2)
	elseif slot0.preferential_win then
		slot0.preferential_win:close()

		slot0.preferential_win = nil
	end
end

function ActionController.openActionFundWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.action_fund_win then
			slot0.action_fund_win = ActionFundMainWindow.New()
		end

		if slot0.action_fund_win:isOpen() == false then
			slot0.action_fund_win:open(slot2)
		end
	elseif slot0.action_fund_win then
		slot0.action_fund_win:close()

		slot0.action_fund_win = nil
	end
end

function ActionController.openActionFundAwardWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.fund_award_win then
			slot0.fund_award_win = ActionFundAwardWindow.New()
		end

		if slot0.fund_award_win:isOpen() == false then
			slot0.fund_award_win:open(slot2, slot3)
		end
	elseif slot0.fund_award_win then
		slot0.fund_award_win:close()

		slot0.fund_award_win = nil
	end
end

function ActionController.requestHolidayList(slot0)
	slot0:SendProtocal(16601, {})
end

function ActionController.on16601(slot0, slot1)
	slot2 = nil
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.holiday_list) do
		if slot0.holiday_del_list[slot8.bid] == nil then
			if slot0.holiday_list[slot8.bid] == nil then
				slot0.holiday_list[slot8.bid] = ActionSubTabVo.New()
			end

			if slot0.holiday_list[slot8.bid] ~= nil then
				slot2:update(slot8)
			end

			if slot0:isSpecialBid(slot8.bid) then
				slot2:setShowStatus(false)
				slot0:cs16603(slot8.bid)
			end

			if slot8.bid == ActionRankCommonType.recharge_rebate then
				slot0:sender28102()
			end

			if slot8.bid == ActionRankCommonType.lucky_dog then
				slot0:send28400()
				slot0:send28402()
			end

			if slot8.bid == ActionRankCommonType.FortuneBagDraw then
				slot0:sender28306()
				slot0.model:setFortuneBagCampId(slot8.camp_id)
			end

			if slot8.bid == ActionRankCommonType.super_week_card then
				slot0:sender16653()
			end

			if slot8.bid == ActionRankCommonType.white_day then
				slot0:sender28800()
			end

			if slot2.cli_type ~= 0 then
				if slot3[slot2.cli_type] == nil then
					slot3[slot2.cli_type] = {
						action_num = 0,
						action_name = ""
					}
				end

				if not slot0:isSpecialBid(slot2.bid) then
					slot3[slot2.cli_type].action_num = slot3[slot2.cli_type].action_num + 1

					if slot2.cli_type_name ~= "" and slot2.cli_type_name ~= "null" and slot3[slot2.cli_type].action_name == "" then
						slot3[slot2.cli_type].action_name = slot2.cli_type_name
					end
				end
			end
		end
	end

	if slot0.is_init_require == true then
		slot0:requestActionAwardStatus()

		slot0.is_init_require = false
	end

	for slot7, slot8 in pairs(slot3) do
		if slot8 then
			if slot8.action_num > 0 then
				slot0.mainui_ctrl:addFunctionIconById(slot7, slot8.action_name)
			else
				slot0.mainui_ctrl:removeFunctionIconById(slot7)
			end
		end
	end

	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_ACTION_DATA_EVENT)
	slot0:startHolidayListTimeTicket()
	slot0:setReturnActionShopFirstRedStatus(true)
end

function ActionController.startHolidayListTimeTicket(slot0)
	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if uv0.holiday_list then
				for slot3, slot4 in pairs(uv0.holiday_list) do
					if slot4.remain_sec then
						slot4.remain_sec = slot4.remain_sec - 1

						if slot4.remain_sec < 0 then
							slot4.remain_sec = 0
						end
					end
				end
			end
		end)
	end
end

function ActionController.checkCanAddWonderful(slot0, slot1)
	if slot1 == nil then
		return false
	end

	if slot0.holiday_list == nil or next(slot0.holiday_list) == nil then
		return false
	end

	for slot5, slot6 in pairs(slot0.holiday_list) do
		if slot6.cli_type == slot1 then
			return true
		end
	end

	return false
end

function ActionController.getActionSubList(slot0, slot1)
	slot2 = {}

	if slot0.holiday_list then
		for slot6, slot7 in pairs(slot0.holiday_list) do
			if slot7.cli_type == slot1 and slot7:isShowInAction() == true then
				table.insert(slot2, slot7)
			end
		end
	end

	if next(slot2) ~= nil then
		table.sort(slot2, function (slot0, slot1)
			return slot0.sort_val < slot1.sort_val
		end)
	end

	return slot2
end

function ActionController.requestActionAwardStatus(slot0)
	slot0:SendProtocal(16602, {})
end

function ActionController.on16602(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.holiday_list) do
		slot0:setHolidayStatus(slot6.bid, slot6.can_get_num ~= FALSE)
	end
end

function ActionController.cs16603(slot0, slot1)
	slot0:SendProtocal(16603, {
		bid = slot1
	})
end

function ActionController.isSpecialBid(slot0, slot1)
	return slot1 == ActionSpecialID.invest or slot1 == ActionSpecialID.growfund
end

function ActionController.on16620(slot0, slot1)
	for slot5, slot6 in ipairs(slot1.holiday_list) do
		slot0:on16603(slot6)
	end
end

function ActionController.canRemoveTabVo(slot0, slot1)
	return slot1 ~= 93015
end

function ActionController.on16603(slot0, slot1)
	if slot1.bid == ActionRankCommonType.common_day or slot1.bid == ActionRankCommonType.festval_day or slot1.bid == ActionRankCommonType.lover_day then
		slot0.model:updataFestvalRedStatus(slot1.bid, slot1.aim_list)
	elseif slot1.bid == 1011 then
		slot0.model:updataCombineLoginRedStatus(slot1.aim_list)
	elseif slot1.bid == 991014 then
		slot0.model:updataPreferentialRedStatus(true, MainuiConst.icon.preferential)
	elseif slot1.bid == 91014 then
		slot0.model:updataPreferentialRedStatus(true, MainuiConst.icon.other_preferential)
	end

	if #slot1.aim_list == 0 then
		slot0:handleHolidayList(0, slot1.bid)
	end

	if slot1.bid == 91005 then
		slot0:handle91005Data(slot1)
	elseif slot1.bid == ActionRankCommonType.seven_charge then
		slot0.model:setSevenChargeData(slot1)
	elseif slot1.bid == ActionRankCommonType.skin_direct_purchase then
		slot0:updateSkinDirectPurchase(slot1)
	end

	if slot0:isSpecialBid(slot1.bid) then
		if slot1.finish == 0 and slot0.need_show_init_red[slot1.bid] == nil and #slot1.aim_list ~= 0 then
			slot2 = false

			if Config.HolidayClientData.data_info[slot1.bid] then
				slot4 = MainuiController:getInstance():checkIsOpenByActivate(slot3.open_lev)

				if RoleController:getInstance():getRoleVo() and slot4 and slot5.lev then
					if slot4 == true and SysEnv:getInstance():getBool(SysEnv.keys.grow_fund_redpoint, true) then
						slot2 = true
					end

					SysEnv:getInstance():set(SysEnv.keys.grow_fund_redpoint, slot2)
				end
			end

			slot0.need_show_init_red[slot1.bid] = slot2

			slot0:setHolidayStatus(slot1.bid, slot2)

			if slot1.bid == ActionSpecialID.growfund then
				WelfareController:getInstance():setWelfareStatus(ActionSpecialID.growfund, slot2)
			end
		elseif slot1.bid == ActionSpecialID.growfund then
			slot2 = false

			if slot1 and slot1.finish == ActionStatus.finish then
				for slot6, slot7 in pairs(slot1.aim_list) do
					if slot7.status == ActionStatus.finish then
						slot2 = true

						break
					end
				end
			end

			if SysEnv:getInstance():getBool(SysEnv.keys.grow_fund_redpoint) ~= true then
				slot0:setHolidayStatus(slot1.bid, slot2)
				WelfareController:getInstance():setWelfareStatus(ActionSpecialID.growfund, slot2)
			end
		end
	end

	slot0.dispather:Fire(ActionEvent.UPDATE_HOLIDAY_SIGNLE, slot1)
end

function ActionController.updateSkinDirectPurchase(slot0, slot1)
	if slot1.finish ~= 0 then
		slot0.mainui_ctrl:removeFunctionIconById(MainuiConst.icon.skin_direct_purchase)

		if slot0.action_skin_direct_purchase_panel then
			slot0:openActionSkinDirectPurchasePanel(false)
		end
	end
end

function ActionController.handle91005Data(slot0, slot1)
	if not slot0.today_list then
		slot0.today_list = {}
	end

	if slot1.aim_list and next(slot1.aim_list) ~= nil then
		for slot5, slot6 in pairs(slot1.aim_list) do
			for slot10, slot11 in pairs(slot6.aim_args) do
				if slot11.aim_args_key == 3 then
					if slot11.aim_args_val == 1 then
						slot0.today_list[slot5] = slot6
						slot0.today_list[slot5].has_num = slot0.has_num
						slot0.today_list[slot5].item_effect_list = slot0.item_effect_list
					end
				elseif slot11.aim_args_key == 4 then
					if slot0.today_list[slot5] then
						slot0.today_list[slot5].need_charge = slot11.aim_args_val
					end
				elseif slot11.aim_args_key == 5 then
					if slot0.today_list[slot5] then
						slot0.today_list[slot5].charge_day = slot11.aim_args_val
					end
				elseif slot11.aim_args_key == 6 and slot0.today_list[slot5] then
					slot0.today_list[slot5].has_charge = slot11.aim_args_val
				end
			end
		end
	end

	slot0:checkShowDayCharge()
end

function ActionController.checkShowDayCharge(slot0)
	if slot0:check91005Create() == true then
		slot0.mainui_ctrl:removeFunctionIconById(MainuiConst.icon.day_charge)
	else
		slot0.mainui_ctrl:addFunctionIconById(MainuiConst.icon.day_charge)

		slot2 = false

		if slot0.today_list and next(slot0.today_list) then
			for slot6, slot7 in pairs(slot0.today_list) do
				if slot7.status == 1 then
					slot2 = true

					break
				end
			end
		end

		slot0.mainui_ctrl:setFunctionTipsStatus(MainuiConst.icon.day_charge, slot2)
	end
end

function ActionController.check91005Create(slot0)
	slot1 = true

	if slot0.today_list and next(slot0.today_list or {}) ~= 0 then
		for slot5, slot6 in pairs(slot0.today_list) do
			if slot6.status == 1 or slot6.status == 0 then
				slot1 = false

				break
			end
		end
	end

	return slot1
end

function ActionController.cs16604(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(16604, {
		bid = slot1,
		aim = slot2,
		arg = slot3 or 0
	})
end

function ActionController.on16604(slot0, slot1)
	showAssetsMsg(slot1.msg)
end

function ActionController.on16606(slot0, slot1)
	slot0:setHolidayStatus(slot1.bid, slot1.can_get_num ~= FALSE)
end

function ActionController.on16607(slot0, slot1)
	if slot1 and slot1.type == 0 then
		slot0:needRequireData(true)
	end
end

function ActionController.getActionSubTabVo(slot0, slot1)
	return slot0.holiday_list[slot1]
end

function ActionController.setHolidayStatus(slot0, slot1, slot2)
	if slot0.holiday_list == nil or slot0.holiday_list[slot1] == nil then
		return
	end

	if slot0.holiday_award_list == nil then
		slot0.holiday_award_list = {}
	end

	if slot1 == 93042 then
		slot0.return_action_shop_red = slot2

		if slot0.return_action_shop_first_red == true then
			slot2 = true
		end
	end

	slot4 = nil
	slot0.holiday_award_list[slot1] = {
		bid = slot1,
		status = slot2
	}
	slot5 = slot0.holiday_list[slot1]
	slot6 = MainuiConst.icon.welfare

	if slot0:isSpecialBid(slot1) then
		slot0.mainui_ctrl:setFunctionTipsStatus(MainuiConst.icon.welfare, (not slot2 or {
			num = 1,
			bid = slot1
		}) and {
			num = 0,
			bid = slot1
		})
	else
		slot0.mainui_ctrl:setFunctionTipsStatus(slot5.cli_type, slot4)

		slot6 = slot5.cli_type
	end

	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_HOLIDAY_TAB_STATUS, slot6, slot3)
end

function ActionController.getHolidayAweradsStatus(slot0, slot1)
	if slot0.holiday_award_list then
		return slot0.holiday_award_list[slot1]
	end
end

function ActionController.setReturnActionShopFirstRedStatus(slot0, slot1)
	slot0.return_action_shop_first_red = slot1

	if ReturnActionController:getInstance():getModel():getCurPeriodByOtherRole() > 0 then
		if slot0.return_action_shop_red ~= nil then
			slot0:setHolidayStatus(93042, slot0.return_action_shop_red)
		else
			slot0:setHolidayStatus(93042, false)
		end
	end
end

function ActionController.handleHolidayList(slot0, slot1, slot2)
end

function ActionController.openActionMainPanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.action_operate ~= nil then
			if slot0.action_operate.panel_list ~= nil then
				for slot7, slot8 in pairs(slot0.action_operate.panel_list) do
					if slot7 == ActionRankCommonType.white_day then
						BattleController:getInstance():openBattleView(false)
						MainuiController:getInstance():resetUIFightType()

						break
					end
				end
			end

			slot0.action_operate:close()

			slot0.action_operate = nil
		end
	else
		if slot3 and slot0.holiday_list[slot3] then
			slot2 = slot4.cli_type
		end

		if slot2 == nil then
			slot2 = MainuiConst.icon.action
		end

		if slot0.action_operate == nil then
			slot0.action_operate = ActionMainWindow.New()
		end

		if slot0.action_operate:isOpen() == false then
			slot0.action_operate:open(slot2, slot3)
		end
	end
end

function ActionController.requestSevenDaysRank(slot0)
	slot0:SendProtocal(22703, {})
end

function ActionController.on22703(slot0, slot1)
	slot0.model:updateSevenQuestList(slot1.feat_list, true)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVENT_QUEST)
end

function ActionController.on22702(slot0, slot1)
	slot0.model:updateSevenQuestList(slot1.feat_list)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVENT_QUEST)
end

function ActionController.requestSubmitTask(slot0, slot1)
	slot0:SendProtocal(22704, {
		quest_id = slot1
	})
end

function ActionController.on22704(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0.model:delSevenQuest(slot1.quest_id)
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_SEVENT_QUEST)
	end
end

function ActionController.requestLucky(slot0)
	slot0:SendProtocal(16637, {})
end

function ActionController.handle16637(slot0, slot1)
	slot0.model:setTreasureInitData(slot1.dial_data)
	slot0.model:lucklyRedPoint()
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_LUCKYROUND_GET, slot1)
end

function ActionController.send16638(slot0, slot1, slot2)
	slot0:SendProtocal(16638, {
		type = slot1,
		type2 = slot2
	})
end

function ActionController.handle16638(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.TREASURE_SUCCESS_DATA, slot1)
end

function ActionController.handle16639(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_LUCKLY_DATA, slot1)
end

function ActionController.send16640(slot0, slot1, slot2)
	slot0:SendProtocal(16640, {
		type = slot1,
		id = slot2
	})
end

function ActionController.handle16641(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATA_TREASURE_LOG_DATA, slot1)
end

function ActionController.send16642(slot0, slot1)
	slot0:SendProtocal(16642, {
		type = slot1
	})
end

function ActionController.handle16642(slot0, slot1)
	message(slot1.msg)
end

function ActionController.send16643(slot0, slot1, slot2)
	if slot0.treasure_win then
		slot0:SendProtocal(16643, {
			type = slot1,
			type2 = slot2
		})
	else
		message(TI18N("亲，不在探宝界面无法进行抽奖哦~~~"))
	end
end

function ActionController.handle16643(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATA_TREASURE_POPUPS_SEND, slot1)
	end
end

function ActionController.send21200(slot0)
	slot0:SendProtocal(21200, {})
end

function ActionController.handle21200(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_LEVEL_UP_GIFT, slot1)
end

function ActionController.send21201(slot0, slot1)
	slot0:SendProtocal(21201, {
		id = slot1
	})
end

function ActionController.handle21201(slot0, slot1)
	message(slot1.msg)
end

function ActionController.send21210(slot0)
	slot0:SendProtocal(21210, {})
end

function ActionController.handle21210(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.LIMIT_GIFT_MAIN_EVENT, slot1)
end

function ActionController.handle21211(slot0, slot1)
	if (slot1.id or 0) == 2001 then
		return
	end

	BattleResultMgr:getInstance():addShowData(BattleConst.Closed_Result_Type.LimitGiftType, slot1)
end

function ActionController.checkOpenActionLimitGiftMainWindow(slot0, slot1)
	if Config.StarGiftData.data_limit_gift(slot1) then
		slot3 = slot1

		CommonAlert.show(slot2.desc, TI18N("前往"), function ()
			uv0:openActionLimitGiftMainWindow(true, uv1)
			GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
		end, TI18N("取消"), function ()
			GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
		end)

		return
	end

	GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
end

function ActionController.send16650(slot0, slot1)
	slot0:SendProtocal(16650, {
		bid = slot1
	})
end

function ActionController.handle16650(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.RANK_REWARD_LIST, slot1)
end

function ActionController.sender24700(slot0)
	slot0:SendProtocal(24700, {})
end

function ActionController.handle24700(slot0, slot1)
	if slot1 and slot1.ids then
		for slot5, slot6 in ipairs(slot1.ids) do
			slot6.show = 1
		end

		slot0.model:setOpenFundIds(slot1.ids)
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATA_FUND_ID_LIST_EVENT)
	end
end

function ActionController.sender24701(slot0, slot1)
	slot0:SendProtocal(24701, {
		id = slot1
	})
end

function ActionController.handle24701(slot0, slot1)
	if slot1 then
		slot0.model:setFundSrvData(slot1)
		slot0.model:setWelfareFundSrvData(slot1)
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATA_FUND_DATA_EVENT, slot1.id)
	end
end

function ActionController.sender24702(slot0, slot1)
	slot0:SendProtocal(24702, {
		id = slot1
	})
end

function ActionController.handle24702(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function ActionController.sender24810(slot0)
	slot0:SendProtocal(24810, {})
end

function ActionController.handle24810(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_DATA_EVENT, slot1)
end

function ActionController.handle24811(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_UPDATA_EVENT, slot1)
end

function ActionController.sender24812(slot0, slot1)
	slot0:SendProtocal(24812, {
		id = slot1
	})
end

function ActionController.handle24812(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_TASK_EVENT, slot1)
	end
end

function ActionController.sender24813(slot0)
	slot0:SendProtocal(24813, {})
end

function ActionController.handle24813(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_DATA_EVENT, slot1)
end

function ActionController.sender24814(slot0, slot1)
	slot0:SendProtocal(24814, {
		id = slot1
	})
end

function ActionController.handle24814(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_TASK_EVENT, slot1)
	end
end

function ActionController.sender24815(slot0)
	slot0:SendProtocal(24815, {})
end

function ActionController.handle24815(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_DATA_EVENT, slot1)
end

function ActionController.sender24816(slot0, slot1)
	slot0:SendProtocal(24816, {
		id = slot1
	})
end

function ActionController.handle24816(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_TASK_EVENT, slot1)
	end
end

function ActionController.sender24817(slot0)
	slot0:SendProtocal(24817, {})
end

function ActionController.handle24817(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_DATA_EVENT, slot1)
end

function ActionController.sender24818(slot0, slot1)
	slot0:SendProtocal(24818, {
		id = slot1
	})
end

function ActionController.handle24818(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActionEvent.YUAN_ZHEN_TASK_EVENT, slot1)
	end
end

function ActionController.sender16665(slot0, slot1, slot2)
	slot0:SendProtocal(16665, {
		bid = slot1,
		ids = slot2
	})
end

function ActionController.handle16665(slot0, slot1)
	message(slot1.msg)
end

function ActionController.sender16666(slot0, slot1)
	slot0:SendProtocal(16666, {
		bid = slot1
	})
end

function ActionController.handle16666(slot0, slot1)
end

function ActionController.sender16686(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(16686, {
		partner_id = slot1,
		partner_bid = slot2,
		expend = slot3
	})
end

function ActionController.handle16686(slot0, slot1)
	message(slot1.msg)
end

function ActionController.sender27300(slot0)
	slot0:SendProtocal(27300, {})
end

function ActionController.handle27300(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Merge_Aim_Event, slot1)
end

function ActionController.sender27301(slot0, slot1)
	slot0:SendProtocal(27301, {
		reward_list = slot1
	})
end

function ActionController.handle27301(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Merge_Box_Status_Event, slot1)
end

function ActionController.sender21016(slot0, slot1)
	slot0:SendProtocal(21016, {
		charge_id = slot1
	})
end

function ActionController.handle21016(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Is_Charge_Event, slot1)
end

function ActionController.sender16687(slot0, slot1)
	if tableLen(slot1 or {}) == 0 then
		slot2.bid = 91029
	end

	slot0:SendProtocal(16687, slot2)
end

function ActionController.handle16687(slot0, slot1)
	slot2 = false

	if slot1.code == 1 then
		slot2 = true
	end

	slot1.status = slot2

	if slot1.bid == ActionRankCommonType.open_server then
		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.open_server_recharge, slot2)
	elseif slot1.bid == ActionRankCommonType.high_value_gift or slot1.bid == ActionRankCommonType.mysterious_store then
		slot0.model:updateGiftRedPointStatus(slot1)
	end
end

function ActionController.sender16688(slot0)
	slot0:SendProtocal(16688, {})
end

function ActionController.handle16688(slot0, slot1)
	slot0.model:setStoneShopData(slot1.buy_info)
	GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_STORE_DATA_EVENT)
end

function ActionController.sender16689(slot0, slot1, slot2)
	slot0:SendProtocal(16689, {
		id = slot1,
		num = slot2
	})
end

function ActionController.handle16689(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_STORE_DATA_SUCCESS_EVENT, slot1)
	end
end

function ActionController.sender16695(slot0, slot1)
	slot0:SendProtocal(16695, {
		card_id = slot1
	})
end

function ActionController.handle16695(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:cs16603(ActionRankCommonType.carnival_report)
	end
end

function ActionController.sender25400(slot0)
	slot0:SendProtocal(25400, {})
end

function ActionController.handle25400(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Aandybeach_Boss_Fight_Action_Event, slot1)
end

function ActionController.sender25401(slot0)
	slot0:SendProtocal(25401, {})
end

function ActionController.handle25401(slot0, slot1)
	slot0:sender25400()

	slot0.day_count = slot1.count
	slot0.setRemainCount = slot1.buy_count

	GlobalEvent:getInstance():Fire(ActionEvent.Aandybeach_Boss_Fight_Main_Event, slot1)
end

function ActionController.sender25402(slot0)
	slot0:SendProtocal(25402, {})
end

function ActionController.handle25402(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.day_count = slot1.count
		slot0.setRemainCount = slot1.buy_count

		if slot0.touch_buy_change and slot1.count == 1 then
			slot0:sender25404()
		end

		slot0.touch_buy_change = nil

		GlobalEvent:getInstance():Fire(ActionEvent.Aandybeach_Boss_Fight_Buy_Count_Event, slot1)
	end
end

function ActionController.sender25403(slot0, slot1)
	slot0:SendProtocal(25403, {
		award_id = slot1
	})
end

function ActionController.handle25403(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Aandybeach_Boss_Fight_Reward_Event, slot1)
end

function ActionController.sender25404(slot0)
	slot0:SendProtocal(25404, {})
end

function ActionController.handle25404(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		HeroController:getInstance():openFormGoFightPanel(false)
	end
end

function ActionController.handle25405(slot0, slot1)
	GuildbossController:getInstance():openGuildbossResultWindow(true, slot1, BattleConst.Fight_Type.SandybeachBossFight)
end

function ActionController.getDayCount(slot0)
	if slot0.day_count then
		return slot0.day_count
	end

	return 0
end

function ActionController.getRemainCount(slot0)
	if slot0.setRemainCount then
		return slot0.setRemainCount
	end

	return 0
end

function ActionController.checkJoinFight(slot0)
	if not Config.HolidayBossData.data_buy_info then
		return
	end

	for slot6, slot7 in pairs(slot1) do
		if 0 <= slot7.max then
			slot2 = slot7.max
		end
	end

	if slot2 <= slot0:getRemainCount() and slot0:getDayCount() == 0 then
		message(TI18N("今日次数已用完~~~"))
	elseif slot3 <= 0 then
		if slot0:getUseDiamond() and next(slot5.expend) ~= nil then
			CommonAlert.show(string.format(TI18N("是否花费 <img src='%s' scale=0.3 />%s购买一次挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), slot5.expend[1][2]), TI18N("确定"), function ()
				uv0.touch_buy_change = true

				uv0:sender25402()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	else
		slot0:sender25404()
	end
end

function ActionController.getUseDiamond(slot0)
	if not Config.HolidayBossData.data_buy_info then
		return nil
	end

	slot2 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot2, slot8)
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.min < slot1.min
	end)

	if #slot2 == 0 then
		return nil
	end

	slot4 = slot0:getRemainCount()
	slot5 = nil

	for slot9, slot10 in ipairs(slot2) do
		if slot10.min <= slot4 and slot4 <= slot10.max then
			slot5 = slot10
		end
	end

	return slot5
end

function ActionController.openSandybeachBossFightMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.sandybeach_boss_fight_main_window then
			slot0.sandybeach_boss_fight_main_window = SandybeachBossFightMainWindow.New()
		end

		slot0.sandybeach_boss_fight_main_window:open(slot2)
	elseif slot0.sandybeach_boss_fight_main_window then
		slot0.sandybeach_boss_fight_main_window:close()

		slot0.sandybeach_boss_fight_main_window = nil
	end
end

function ActionController.openMergeAimRewardPanel(slot0, slot1)
	if slot1 == true then
		if not slot0.merge_aim_reaward_panel then
			slot0.merge_aim_reaward_panel = MergeAimRewardPanel.New()
		end

		slot0.merge_aim_reaward_panel:open()
	elseif slot0.merge_aim_reaward_panel then
		slot0.merge_aim_reaward_panel:close()

		slot0.merge_aim_reaward_panel = nil
	end
end

function ActionController.openActionCommonRewardPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.action_common_reward_panel then
			slot0.action_common_reward_panel = ActionCommonRewardPanel.New()
		end

		slot0.action_common_reward_panel:open(slot2)
	elseif slot0.action_common_reward_panel then
		slot0.action_common_reward_panel:close()

		slot0.action_common_reward_panel = nil
	end
end

function ActionController.sender25500(slot0)
	slot0:SendProtocal(25500, {})
end

function ActionController.handle25500(slot0, slot1)
	slot0.model:setLimitTypeData(slot1.list)
	GlobalEvent:getInstance():Fire(ActionEvent.Updata_Hero_Clothes_Shop_Data, slot1)
end

function ActionController.CheckActionExistByActionBid(slot0, slot1)
	if not slot1 then
		return false
	end

	if slot0:getActionSubTabVo(slot1) then
		return true
	end

	return false
end

function ActionController.checkActionExistByCampId(slot0, slot1)
	if not slot1 then
		return false
	end

	slot2 = false

	for slot6, slot7 in pairs(slot0.holiday_list) do
		if slot7.camp_id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function ActionController.sender11071(slot0, slot1)
	slot0:SendProtocal(11071, {
		partner_id = slot1
	})
end

function ActionController.handle11071(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.ACTION_HERO_RESET_EVENT, slot1)
end

function ActionController.sender11072(slot0, slot1)
	slot0:SendProtocal(11072, {
		partner_id = slot1
	})
end

function ActionController.handle11072(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActionEvent.ACTION_HERO_RESET_ITEM_EVENT, slot1)
	end
end

function ActionController.sender11074(slot0, slot1)
	slot0:SendProtocal(11074, {
		list = slot1
	})
end

function ActionController.handle11074(slot0, slot1)
	message(slot1.msg)
end

function ActionController.openActionHeroResetSelectPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.action_hero_reset_select_panel then
			slot0.action_hero_reset_select_panel = ActionHeroResetSelectPanel.New()
		end

		slot0.action_hero_reset_select_panel:open(slot2, slot3, slot4)
	elseif slot0.action_hero_reset_select_panel then
		slot0.action_hero_reset_select_panel:close()

		slot0.action_hero_reset_select_panel = nil
	end
end

function ActionController.openActionHeroSkinResetPanel(slot0, slot1)
	if slot1 == true then
		if not slot0.action_hero_skin_reset_panel then
			slot0.action_hero_skin_reset_panel = ActionHeroSkinResetPanel.New()
		end

		slot0.action_hero_skin_reset_panel:open(data, open_type, partner)
	elseif slot0.action_hero_skin_reset_panel then
		slot0.action_hero_skin_reset_panel:close()

		slot0.action_hero_skin_reset_panel = nil
	end
end

function ActionController.openActionSpecialVIPWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.special_vip_view then
			slot0.special_vip_view = ActionSpecialVipWindow.New()
		end

		slot0.special_vip_view:open()
	elseif slot0.special_vip_view then
		slot0.special_vip_view:close()

		slot0.special_vip_view = nil
	end
end

function ActionController.openActionPerferPrizeWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.perfer_prize_view then
			slot0.perfer_prize_view = ActionPerferPrizeWindow.New()
		end

		slot0.perfer_prize_view:open()
	elseif slot0.perfer_prize_view then
		slot0.perfer_prize_view:close()

		slot0.perfer_prize_view = nil
	end
end

function ActionController.openActionSkinDirectPurchasePanel(slot0, slot1)
	if slot1 == true then
		if not slot0.action_skin_direct_purchase_panel then
			print("打开皮肤直购=================")

			slot0.action_skin_direct_purchase_panel = ActionSkinDirectPurchasePanel.New()
		end

		slot0.action_skin_direct_purchase_panel:open()
	elseif slot0.action_skin_direct_purchase_panel then
		slot0.action_skin_direct_purchase_panel:close()

		slot0.action_skin_direct_purchase_panel = nil
	end
end

function ActionController.sender26600(slot0)
	slot0:SendProtocal(26600)
end

function ActionController.handle26600(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		slot0.model:updataLotteryItemData(slot1.sort)
		GlobalEvent:getInstance():Fire(ActionEvent.ACTION_SKIN_LOTTERY_GET, slot1)
	end
end

function ActionController.sender26601(slot0)
	slot0:SendProtocal(26601)
end

function ActionController.handle26601(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.ACTION_SKIN_LOTTERY_MSG, slot1)
	slot0.model:setLotteryItemData(slot1.sort_list, slot1.lottery_id)
end

function ActionController.sender26602(slot0)
	slot0:SendProtocal(26602)
end

function ActionController.handle26602(slot0, slot1)
	if slot1 then
		slot0:openTreasureGetItemWindow(true, slot1.reward_list, 1, 4, function ()
			GlobalEvent:getInstance():Fire(ActionEvent.ACTION_SKIN_LOTTERY_REWARD)
		end)
	end
end

function ActionController.handle21020(slot0, slot1)
	if slot1 and slot1.status == 1 then
		GlobalEvent:getInstance():Fire(ActionEvent.ACTION_PERFER_ISOPEN, slot1.status)
	end
end

function ActionController.handle16696(slot0, slot1)
	if slot1 and slot1.code == 1 then
		slot0:openActionResetChargeWindow(true)
	end
end

function ActionController.openActionResetChargeWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.action_return_charge_window then
			slot0.action_return_charge_window = ActionResetChargeWindow.New()
		end

		slot0.action_return_charge_window:open()
	elseif slot0.action_return_charge_window then
		slot0.action_return_charge_window:close()

		slot0.action_return_charge_window = nil
	end
end

function ActionController.sender28100(slot0)
	slot0:SendProtocal(28100)
end

function ActionController.handle28100(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(ActionEvent.UPDATE_RECHARGE_REBATE_EVENT, slot1)
	end
end

function ActionController.sender28101(slot0)
	slot0:SendProtocal(28101)
end

function ActionController.handle28101(slot0, slot1)
end

function ActionController.sender28102(slot0)
	slot0:SendProtocal(28102)
end

function ActionController.handle28102(slot0, slot1)
	if slot1 and slot1.code == 1 then
		slot0:setHolidayStatus(ActionRankCommonType.recharge_rebate, true)
	else
		slot0:setHolidayStatus(ActionRankCommonType.recharge_rebate, false)
	end
end

function ActionController.sender28103(slot0)
	slot0:SendProtocal(28103)
end

function ActionController.handle28103(slot0, slot1)
end

function ActionController.send26530(slot0, slot1)
	slot0:SendProtocal(26530, {
		item_bid = slot1
	})
end

function ActionController.handle26530(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionEvent.SPRITE_RESET_EVENT, slot1)
end

function ActionController.openActionSpriteResetSelectPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.action_sprite_reset_select_panel then
			slot0.action_sprite_reset_select_panel = ActionSpriteResetSelectPanel.New()
		end

		slot0.action_sprite_reset_select_panel:open(slot2, slot3, slot4)
	elseif slot0.action_sprite_reset_select_panel then
		slot0.action_sprite_reset_select_panel:close()

		slot0.action_sprite_reset_select_panel = nil
	end
end

function ActionController.send28400(slot0)
	slot0:SendProtocal(28400)
end

function ActionController.handle28400(slot0, slot1)
	slot0.model:setLuckyDogData(slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.LUCKY_DOG_BASE_EVENT)
	slot0:setHolidayStatus(ActionRankCommonType.lucky_dog, slot0.lucky_dog_login_red or slot0.model:getLuckyDogAllRed())
end

function ActionController.send28401(slot0, slot1)
	slot0:SendProtocal(28401, {
		period = slot1
	})
end

function ActionController.send28402(slot0)
	slot0:SendProtocal(28402)
end

function ActionController.handle28402(slot0, slot1)
	slot0.lucky_dog_login_red = slot1.code == 1

	slot0:setHolidayStatus(ActionRankCommonType.lucky_dog, slot0.lucky_dog_login_red or slot0.model:getLuckyDogAllRed())
end

function ActionController.send28403(slot0)
	slot0:SendProtocal(28403)
end

function ActionController.handle28403(slot0, slot1)
end

function ActionController.openFortuneBagRuleWindow(slot0, slot1, slot2)
	if slot1 then
		if slot0.fortune_bag_rule_win == nil then
			slot0.fortune_bag_rule_win = ActionFortuneBagRuleWindow.New()
		end

		slot0.fortune_bag_rule_win:open(slot2)
	elseif slot0.fortune_bag_rule_win then
		slot0.fortune_bag_rule_win:close()

		slot0.fortune_bag_rule_win = nil
	end
end

function ActionController.openFortuneBagSelectWindow(slot0, slot1, slot2)
	if slot1 then
		if slot0.fortune_bag_select_win == nil then
			slot0.fortune_bag_select_win = ActionFortuneBagSelectWindow.New()
		end

		slot0.fortune_bag_select_win:open(slot2)
	elseif slot0.fortune_bag_select_win then
		slot0.fortune_bag_select_win:close()

		slot0.fortune_bag_select_win = nil
	end
end

function ActionController.sender28300(slot0)
	slot0:SendProtocal(28300)
end

function ActionController.handle28300(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(ActionEvent.FORTUNE_BAG_DRAW_BASE_EVENT, slot1)
	end
end

function ActionController.sender28301(slot0)
	slot0:SendProtocal(28301)
end

function ActionController.handle28301(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(ActionEvent.FORTUNE_BAG_SURPLUS_EVENT, slot1)
	end
end

function ActionController.sender28302(slot0, slot1)
	slot0:SendProtocal(28302, {
		pos = slot1
	})
end

function ActionController.handle28302(slot0, slot1)
	message(slot1.msg)
end

function ActionController.sender28303(slot0)
	slot0:SendProtocal(28303)
end

function ActionController.handle28303(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(ActionEvent.FORTUNE_BAG_ULTIMATE_EVENT, slot1)
	end
end

function ActionController.sender28305(slot0, slot1)
	slot0:SendProtocal(28305, {
		type_id = slot1
	})
end

function ActionController.handle28305(slot0, slot1)
end

function ActionController.sender28306(slot0)
	slot0:SendProtocal(28306)
end

function ActionController.handle28306(slot0, slot1)
	if slot1 and slot1.code and slot1.code == 1 then
		slot0:setHolidayStatus(ActionRankCommonType.FortuneBagDraw, true)

		return
	end

	slot0:setHolidayStatus(ActionRankCommonType.FortuneBagDraw, false)
end

function ActionController.sender28307(slot0)
	slot0:SendProtocal(28307)
end

function ActionController.sender28308(slot0)
	slot0:SendProtocal(28308)
end

function ActionController.send16697(slot0)
	slot0:SendProtocal(16697, {})
end

function ActionController.handle16697(slot0, slot1)
	slot0.model:setActionTimeCollectData(slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Update_Time_Collect_Main_Icon_Event, slot1.code)
end

function ActionController.send16698(slot0, slot1)
	slot0:SendProtocal(16698, {
		id = slot1
	})
end

function ActionController.handle16698(slot0, slot1)
	message(slot1.msg)
end

function ActionController.openActionTimeCollectWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.action_time_collect_window then
			slot0.action_time_collect_window = ActionTimeCollectWindow.New()
		end

		slot0.action_time_collect_window:open(slot2, slot3, slot4)
	elseif slot0.action_time_collect_window then
		slot0.action_time_collect_window:close()

		slot0.action_time_collect_window = nil
	end
end

function ActionController.sender10971(slot0)
	slot0:SendProtocal(10971, {
		bid = ActionRankCommonType.ouqi_gift
	})
end

function ActionController.handle10971(slot0, slot1)
	slot2 = nil
	slot4 = string.format
	slot5 = RoleController:getInstance():getRoleVo()
	slot6, slot7 = unpack(Split(slot5.srv_id, "_"))

	if IS_IOS_PLATFORM == true then
		sdkCallFunc("openSyW", slot4("%s?%s", (PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" or PLATFORM_NAME == "release2") and "http://test-cms-sszg.shiyue.com/m/spring_festival.html" or "https://sszg.shiyue.com/m/spring_festival.html", encodeBase64(slot4("role_id=%s&platform=%s&zone_id=%s&ctime=%s&flag=%s&token=%s", slot5.rid, PLATFORM_NAME, slot7, GameNet:getInstance():getTime(), cc.CCGameLib:getInstance():md5str(slot4("%s%s%s%s%s", slot5.rid, PLATFORM_NAME, slot7, GameNet:getInstance():getTime(), "He952ae2a6ea8cdG7410j6T42d7ce32")), slot1.token))))
	else
		sdkCallFunc("openUrl", slot8)
	end
end

function ActionController.openOuqiGiftTips(slot0)
	slot0:sender16687({
		bid = ActionRankCommonType.ouqi_gift
	})
	CommonAlert.show(TI18N("抽取新年红包,需要打开浏览器哦~"), TI18N("确定"), function ()
		uv0:sender10971()
	end, nil, , CommonAlert.type.rich, nil, , , true)
end

function ActionController.sender28500(slot0)
	slot1 = {}

	slot0:SendProtocal(28500, {})
end

function ActionController.handle28500(slot0, slot1)
	slot0.model:setSweetData(slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.Update_Sweet_Data_Event)
end

function ActionController.sender28501(slot0, slot1)
	slot0:SendProtocal(28501, {
		reward_list = slot1
	})
end

function ActionController.handle28501(slot0, slot1)
	if slot1.msg and slot1.msg ~= "" then
		message(slot1.msg)
	end
end

function ActionController.sender28502(slot0, slot1, slot2)
	slot0:SendProtocal(28502, {
		id = slot1,
		num = slot2
	})
end

function ActionController.handle28502(slot0, slot1)
	if slot1.msg and slot1.msg ~= "" then
		message(slot1.msg)
	end

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActionEvent.Sweet_Put_Success_Event, slot1.id)
	end
end

function ActionController.openActionSweetAwardWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.sweet_award_wnd then
			slot0.sweet_award_wnd = ActionSweetAwardWindow.New()
		end

		slot0.sweet_award_wnd:open()
	elseif slot0.sweet_award_wnd then
		slot0.sweet_award_wnd:close()

		slot0.sweet_award_wnd = nil
	end
end

function ActionController.sender28800(slot0)
	slot1 = {}

	slot0:SendProtocal(28800, {})
end

function ActionController.handle28800(slot0, slot1)
	if slot1 and slot1.time and slot1.time > 0 then
		slot0:setHolidayStatus(ActionRankCommonType.white_day, true)
	else
		slot0:setHolidayStatus(ActionRankCommonType.white_day, false)
	end

	slot0.model:setWhiteDayData(slot1)
	GlobalEvent:getInstance():Fire(ActionEvent.White_Day_Init_Event, slot1)
end

function ActionController.sender28801(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(28801, {
		id = slot1,
		formation_type = slot2,
		pos_info = slot3,
		hallows_id = slot4
	})
end

function ActionController.handle28801(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function ActionController.handle28802(slot0, slot1)
	slot1.item_rewards = slot1.reward

	for slot5, slot6 in ipairs(slot1.item_rewards) do
		slot6.bid = slot6.base_id
		slot6.quality = Config.ItemData.data_get_data(slot6.bid).quality
	end

	table.sort(slot1.item_rewards, function (slot0, slot1)
		return slot1.quality < slot0.quality
	end)

	slot1.result = 1

	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.WhiteDayWar, slot1)
end

function ActionController.sender28803(slot0)
	slot1 = {}

	slot0:SendProtocal(28803, {})
end

function ActionController.handle28803(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function ActionController.sender16653(slot0)
	slot1 = {}

	slot0:SendProtocal(16653, {})
end

function ActionController.handle16653(slot0, slot1)
	slot0.model:setSuperWeekData(slot1)

	if slot1 and slot1.award_list then
		slot2 = false

		for slot6, slot7 in pairs(slot1.award_list) do
			if slot7 and slot7.finish and slot7.finish == 1 then
				slot2 = true

				break
			end
		end

		slot0:setHolidayStatus(ActionRankCommonType.super_week_card, slot2)
	end

	GlobalEvent:getInstance():Fire(ActionEvent.SuperValueWeeklyCard_Init_Event, slot1)
end

function ActionController.sender16654(slot0, slot1)
	slot0:SendProtocal(16654, {
		id = slot1
	})
end

function ActionController.handle16654(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end
