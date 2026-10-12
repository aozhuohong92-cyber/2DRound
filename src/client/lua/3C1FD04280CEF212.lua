WelfareController = WelfareController or BaseClass(BaseController)

function WelfareController.config(slot0)
	slot0.model = WelfareModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.welfare_list = {}
	slot0.welfare_status_list = {}
	slot0.welfare_cache_red = {}
end

function WelfareController.getModel(slot0)
	return slot0.model
end

function WelfareController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_assets_event == nil then
				uv0.role_update_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "lev" then
						uv0:updateWelfareRedStatus(slot1)
					end
				end)
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:openMainWindow(false)
		end)
	end

	if slot0.welfare_fund_event == nil then
		slot0.welfare_fund_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATA_WELFARE_FUND__STATUS_EVENT, function (slot0)
			slot1 = {}
			uv0.fund_two_icon = false
			uv0.fund_one_icon = false

			if slot0 ~= nil and next(slot0) ~= nil then
				for slot5, slot6 in pairs(slot0) do
					if slot6.id == WelfareIcon.fund_one then
						uv0.fund_one_icon = true
					elseif slot6.id == WelfareIcon.fund_two then
						uv0.fund_two_icon = true
					end
				end

				uv0:sender24703(0)
			end
		end)
	end
end

function WelfareController.registerProtocals(slot0)
	slot0:RegisterProtocal(14100, "handle14100")
	slot0:RegisterProtocal(14101, "handle14101")
	slot0:RegisterProtocal(16705, "handle16705")
	slot0:RegisterProtocal(16706, "handle16706")
	slot0:RegisterProtocal(21002, "handle21002")
	slot0:RegisterProtocal(24600, "handle24600")
	slot0:RegisterProtocal(24601, "handle24601")
	slot0:RegisterProtocal(24602, "handle24602")
	slot0:RegisterProtocal(24603, "handle24603")
	slot0:RegisterProtocal(24604, "handle24604")
	slot0:RegisterProtocal(21007, "handle21007")
	slot0:RegisterProtocal(21008, "handle21008")
	slot0:RegisterProtocal(21009, "handle21009")
	slot0:RegisterProtocal(16635, "handle16635")
	slot0:RegisterProtocal(16636, "handle16636")
	slot0:RegisterProtocal(16633, "handle16633")
	slot0:RegisterProtocal(16634, "handle16634")
	slot0:RegisterProtocal(21021, "handle21021")
	slot0:RegisterProtocal(24703, "handle24703")
	slot0:RegisterProtocal(10989, "handle10989")
	slot0:RegisterProtocal(10987, "handle10987")
end

function WelfareController.requestInitProto(slot0)
	slot0:sender14100()
	slot0:sender16705()
	slot0:sender24600()
	slot0:sender21008()
	slot0:sender16635()
	slot0:sender16633()
end

function WelfareController.sender14100(slot0)
	slot0:SendProtocal(14100, {})
end

function WelfareController.sender16705(slot0)
	slot0:SendProtocal(16705, {})
end

function WelfareController.sender24600(slot0)
	slot0:SendProtocal(24600, {})
end

function WelfareController.sender21008(slot0)
	slot0:SendProtocal(21008, {})
end

function WelfareController.sender16635(slot0)
	slot0:SendProtocal(16635, {})
end

function WelfareController.sender16633(slot0)
	slot0:SendProtocal(16633, {})
end

function WelfareController.handle14100(slot0, slot1)
	slot0.dispather:Fire(WelfareEvent.Update_Sign_Info, slot1)

	slot2 = false

	if slot1.status == 0 or slot0.model:getRechargeCount() > 0 and slot1.status == 1 then
		slot2 = true
	end

	slot0:setWelfareStatus(WelfareIcon.sign, slot2)
end

function WelfareController.sender14101(slot0)
	slot0:SendProtocal(14101, {})
end

function WelfareController.handle14101(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.dispather:Fire(WelfareEvent.Sign_Success, slot1)

		slot2 = false

		if slot1.status == 0 or slot0.model:getRechargeCount() > 0 and slot1.status == 1 then
			slot2 = true
		end

		slot0:setWelfareStatus(WelfareIcon.sign, slot2)
	end
end

function WelfareController.handle16705(slot0, slot1)
	slot0.model:setYueka(slot1)
	slot0.dispather:Fire(WelfareEvent.Update_Yueka, slot1)

	slot2 = false
	slot3 = false
	slot4 = false

	if slot1.card1_is_reward == 1 then
		slot2 = true
	end

	if slot1.card2_is_reward == 1 then
		slot3 = true
	end

	if slot2 == true or slot3 == true then
		slot4 = true
	end

	slot0:setWelfareStatus(WelfareIcon.yueka, slot4)
end

function WelfareController.sender16706(slot0, slot1)
	slot0:SendProtocal(16706, {
		card_type = slot1
	})
end

function WelfareController.handle16706(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.dispather:Fire(WelfareEvent.Update_Get_Yueka, slot1.card_type)

		slot2 = slot0.model:getYueka()

		if slot1.card_type == 1 then
			if slot2 then
				slot2.card1_is_reward = 2
			end
		elseif slot1.card_type == 2 and slot2 then
			slot2.card2_is_reward = 2
		end

		if slot2 and slot2.card1_is_reward == 1 or slot2.card2_is_reward == 1 then
			slot0:setWelfareStatus(WelfareIcon.yueka, true)
		else
			slot0:setWelfareStatus(WelfareIcon.yueka, false)
		end
	end
end

function WelfareController.sender21002(slot0)
	slot0:SendProtocal(21002, {})
end

function WelfareController.handle21002(slot0, slot1)
	slot0.model:setRechargeCount(slot1.count)
	slot0:sender14100()
end

function WelfareController.sender24703(slot0, slot1)
	slot0:SendProtocal(24703, {
		id = slot1
	})
end

function WelfareController.handle24703(slot0, slot1)
	if slot1 then
		for slot5, slot6 in ipairs(slot1.ids) do
			if slot6.status ~= 0 then
				WelfareController:getInstance():setWelfareStatus(slot6.id, slot6.status == 1)
			end
		end
	end
end

function WelfareController.sender10987(slot0)
	slot0:SendProtocal(10987, {})
end

function WelfareController.handle10987(slot0, slot1)
	if slot1 and slot1.is_point ~= nil then
		WelfareController:getInstance():setWelfareStatus(WelfareIcon.subscribe, slot1.is_point == 1)
	end
end

function WelfareController.sender10988(slot0)
	slot0:SendProtocal(10988, {})
end

function WelfareController.sender10989(slot0)
	slot0:SendProtocal(10989, {})
end

function WelfareController.handle10989(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(WelfareEvent.Update_Subscribe_data, slot1)
	end
end

function WelfareController.checkCanAdd(slot0, slot1)
	if Config.HolidayClientData.data_info[slot1] == nil then
		return false
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return false
	end

	if type(slot2.open_lev) ~= "table" then
		return false
	end

	if MainuiController:getInstance():checkIsOpenByActivate(slot2.open_lev) == false then
		return false
	end

	slot5 = slot2.is_verifyios

	if FILTER_CHARGE then
		if slot1 == WelfareIcon.sign then
			return true
		else
			return false
		end
	end

	if slot5 == 1 then
		if slot1 == WelfareIcon.week then
			return slot0.model:getIsOpenWeekGift()
		end

		return true
	end

	if slot1 == WelfareIcon.bindphone then
		return SHOW_BIND_PHONE
	elseif slot1 == WelfareIcon.wechat then
		return SHOW_WECHAT_CERTIFY
	elseif slot1 == WelfareIcon.poste then
		return SHOW_BAIDU_TIEBA
	elseif slot1 == WelfareIcon.invicode then
		return SHOW_SINGLE_INVICODE
	elseif slot1 == WelfareIcon.share_game then
		return SHOW_GAME_SHARE and RoleController:getInstance():getApkData()
	elseif slot1 == WelfareIcon.fund_one then
		if slot0.fund_one_icon == true then
			return true
		else
			return false
		end
	elseif slot1 == WelfareIcon.fund_two then
		if slot0.fund_two_icon == true then
			return true
		else
			return false
		end
	else
		return not MAKELIFEBETTER
	end
end

function WelfareController.openMainWindow(slot0, slot1, slot2)
	if slot1 then
		if MAKELIFEBETTER == true then
			return
		end

		slot3 = RoleController:getInstance():getRoleVo()

		if Config.HolidayClientData.data_info and slot4[slot2] and MainuiController:getInstance():checkIsOpenByActivate(slot4[slot2].open_lev) == false then
			message(TI18N("条件不满足"))

			return
		end

		for slot8, slot9 in pairs(slot4) do
			if slot0.welfare_list[slot9.bid] == nil and slot0:checkCanAdd(slot9.bid) == true then
				sub_vo = WelfareSubTabVo.New()

				if sub_vo.update then
					sub_vo:update(slot9)
				end

				slot0.welfare_list[slot9.bid] = sub_vo
			end
		end

		if not slot0.welfare_win then
			slot0.welfare_win = WelfareMainWindow.New()
		end

		slot0.welfare_win:open(slot2)
	elseif slot0.welfare_win then
		slot0.welfare_win:close()

		slot0.welfare_win = nil
	end
end

function WelfareController.getWelfareRoot(slot0)
	if slot0.welfare_win then
		return slot0.welfare_win.root_wnd
	end
end

function WelfareController.getWelfareSubList(slot0)
	slot1 = {}

	if slot0.welfare_list ~= nil and next(slot0.welfare_list) ~= nil then
		for slot5, slot6 in pairs(slot0.welfare_list) do
			slot7 = true

			if ActionController:getInstance():isSpecialBid(slot6.bid) then
				if ActionController:getInstance():getActionSubTabVo(slot6.bid) == nil then
					slot7 = false
				end
			elseif slot6.bid == WelfareIcon.quest then
				if slot0.model:getQuestOpenData() and slot8.status == 0 then
					slot7 = false
				end
			elseif slot6.bid == WelfareIcon.bindphone and slot0:checkBindPhoneStatus() == true then
				slot7 = false
			end

			if slot7 == true then
				table.insert(slot1, slot6)
			end
		end
	end

	if next(slot1) ~= nil then
		table.sort(slot1, function (slot0, slot1)
			return slot0.sort_val < slot1.sort_val
		end)
	end

	return slot1
end

function WelfareController.updateWelfareRedStatus(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.welfare_cache_red == nil or slot0.welfare_cache_red[slot1] == nil then
		return
	end

	for slot6, slot7 in pairs(slot0.welfare_cache_red[slot1]) do
		slot0:setWelfareStatus(slot6, slot7)
	end
end

function WelfareController.setWelfareStatus(slot0, slot1, slot2)
	if not slot0:checkCanAdd(slot1) then
		if Config.HolidayClientData.data_info[slot1] then
			if slot0.welfare_cache_red[slot3.open_lev[1][2]] == nil then
				slot0.welfare_cache_red[slot3.open_lev[1][2]] = {}
			end

			slot0.welfare_cache_red[slot3.open_lev[1][2]][slot1] = slot2
		end
	else
		if slot0.welfare_status_list == nil then
			slot0.welfare_status_list = {}
		end

		slot3 = 0

		if slot2 then
			slot3 = 1
		end

		slot5 = {
			bid = slot1,
			status = slot2
		}
		slot0.welfare_status_list[slot1] = slot5

		slot0:setPosteWelfareStatus(true)
		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.welfare, {
			bid = slot1,
			num = slot3
		})
		GlobalEvent:getInstance():Fire(WelfareEvent.UPDATE_WELFARE_TAB_STATUS, slot5)
	end
end

function WelfareController.setPosteWelfareStatus(slot0, slot1)
	if SHOW_BAIDU_TIEBA then
		if slot1 == true and slot0.welfare_status_list[WelfareIcon.poste] == nil then
			slot2 = RoleController:getInstance():getRoleVo()
			slot4 = 0

			if Config.HolidayClientData.data_info[WelfareIcon.poste] and MainuiController:getInstance():checkIsOpenByActivate(slot3.open_lev) == true and SysEnv:getInstance():getBool(SysEnv.keys.welfare_redpoint, true) then
				slot4 = 1
			end

			slot5 = {
				bid = WelfareIcon.poste,
				num = slot4
			}
			slot6 = false

			if slot4 == 1 then
				slot6 = true
			end

			WelfareController:getInstance():setWelfareStatus(WelfareIcon.poste, slot6)
			MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.welfare, slot5)
		elseif slot1 == false and slot0.welfare_status_list[WelfareIcon.poste] then
			SysEnv:getInstance():set(SysEnv.keys.welfare_redpoint, false, nil)
			WelfareController:getInstance():setWelfareStatus(WelfareIcon.poste, false)
			MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.welfare, {
				num = 0,
				bid = WelfareIcon.poste
			})
		end
	end
end

function WelfareController.getWelfareStatusByID(slot0, slot1)
	if slot0.welfare_status_list then
		return slot0.welfare_status_list[slot1]
	end
end

function WelfareController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function WelfareController.sender10946(slot0)
end

function WelfareController.handle10946(slot0, slot1)
end

function WelfareController.sender23210(slot0)
end

function WelfareController.handle23210(slot0, slot1)
end

function WelfareController.sender23211(slot0, slot1)
end

function WelfareController.handle23211(slot0, slot1)
end

function WelfareController.openSureveyQuestView(slot0, slot1)
	if slot1 == true then
		if not slot0.sureveyQuestWindow then
			slot0.sureveyQuestWindow = SureveyQuestWindow.New()
		end

		slot0.sureveyQuestWindow:open()
	elseif slot0.sureveyQuestWindow then
		slot0.sureveyQuestWindow:close()

		slot0.sureveyQuestWindow = nil
	end
end

function WelfareController.handle24600(slot0, slot1)
	slot0.model:setQuestOpenData(slot1)
end

function WelfareController.sender24601(slot0)
	slot0:SendProtocal(24601, {})
end

function WelfareController.handle24601(slot0, slot1)
	GlobalEvent:getInstance():Fire(WelfareEvent.Get_SureveyQuest_Basic, slot1)
end

function WelfareController.sender24602(slot0)
	slot0:SendProtocal(24602, {})
end

function WelfareController.handle24602(slot0, slot1)
	GlobalEvent:getInstance():Fire(WelfareEvent.Get_SureveyQuest_Topic_Content, slot1)
end

function WelfareController.sender24603(slot0, slot1)
	slot0:SendProtocal(24603, {
		ret_list = slot1
	})
end

function WelfareController.handle24603(slot0, slot1)
	message(slot1.msg)
end

function WelfareController.sender24604(slot0)
	slot0:SendProtocal(24604, {})
end

function WelfareController.handle24604(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(WelfareEvent.Get_SureveyQuest_Get_Reward, slot1)
	end
end

function WelfareController.sender21007(slot0, slot1)
	slot0:SendProtocal(21007, {
		type = slot1 or 1
	})
end

function WelfareController.handle21007(slot0, slot1)
	GlobalEvent:getInstance():Fire(WelfareEvent.Updata_Week_Month_Data, slot1)
end

function WelfareController.handle21008(slot0, slot1)
	slot0.model:setDailyAwardStatus(slot1.status)
	GlobalEvent:getInstance():Fire(WelfareEvent.Update_Daily_Awawd_Data)
end

function WelfareController.sender21009(slot0)
	slot0:SendProtocal(21009, {})
end

function WelfareController.handle21009(slot0, slot1)
	message(slot1.msg)
end

function WelfareController.openCertifyBindPhoneWindow(slot0, slot1)
	if not slot1 then
		if slot0.certify_phone then
			slot0.certify_phone:close()
		end

		slot0.certify_phone = nil
	else
		if slot0.certify_phone == nil then
			slot0.certify_phone = CertifyBindPhoneWindow.New()
		end

		slot0.certify_phone:open()
	end
end

function WelfareController.checkBindPhoneStatus(slot0)
	if slot0.bind_phone_data == nil or slot0.bind_phone_data.code ~= 0 then
		return true
	end

	return false
end

function WelfareController.getBindPhoneData(slot0)
	return slot0.bind_phone_data
end

function WelfareController.handle16635(slot0, slot1)
	slot0.bind_phone_data = slot1
	slot0.bind_phone_data.status = slot1.code

	if slot1.code == 0 and SHOW_BIND_PHONE then
		slot0:setWelfareStatus(WelfareIcon.bindphone, true)
	end
end

function WelfareController.requestBindPhone(slot0, slot1, slot2)
	slot0:SendProtocal(16636, {
		number = slot1,
		code = slot2
	})
end

function WelfareController.handle16636(slot0, slot1)
	if slot0.bind_phone_data == nil then
		return
	end

	message(slot1.msg)

	slot0.bind_phone_data.status = slot1.code

	if slot1.code ~= 0 then
		if slot1.code == 1 then
			slot0.bind_phone_data.code = 1

			slot0:openCertifyBindPhoneWindow(false)
		end

		GlobalEvent:getInstance():Fire(WelfareEvent.UpdateBindPhoneStatus, slot0.bind_phone_data)
	end
end

function WelfareController.handle16633(slot0, slot1)
	if SHOW_WECHAT_CERTIFY then
		slot0.wechat_subscription_data = slot1

		if slot1.code == 0 then
			slot0:setWelfareStatus(WelfareIcon.wechat, true)
		end
	end
end

function WelfareController.tellServerWechatStatus(slot0)
	if slot0.wechat_subscription_data and slot0.wechat_subscription_data.code == 1 then
		return
	end

	slot0:SendProtocal(16634, {})
end

function WelfareController.handle16634(slot0, slot1)
	if slot0.wechat_subscription_data then
		slot0.wechat_subscription_data.code = 1

		slot0:setWelfareStatus(WelfareIcon.wechat, false)
	end
end

function WelfareController.getWechatData(slot0)
	return slot0.wechat_subscription_data
end

function WelfareController.handle21021(slot0, slot1)
	slot0.model:setIsOpenWeekGift(slot1.flag)
end
