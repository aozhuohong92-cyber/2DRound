MainuiController = MainuiController or BaseClass(BaseController)
slot0 = tolua.isnull

function MainuiController.config(slot0)
	slot0.model = MainuiModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.function_list = {}
	slot0.cur_index_status = 0
	slot0.ui_fight_type = MainuiConst.ui_fight_type.main_scene
	slot0.main_scene_btn_status = false
	slot0.cache_tips_list = {}
	slot0.cache_wait_create_list = {}
end

function MainuiController.getModel(slot0)
	return slot0.model
end

function MainuiController.registerEvents(slot0)
	if slot0.init_main_event == nil then
		slot0.init_main_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_main_event)

			uv0.init_main_event = nil

			if uv0.role_change_event == nil then
				uv0.role_vo = RoleController:getInstance():getRoleVo()

				if uv0.role_vo ~= nil then
					uv0.role_change_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
						if slot0 == "lev" then
							uv0:checkFunctionByRoleLev(slot1)
							report_level_up(slot1)
							sdkSubmitUserData(4)
						end
					end)
				end
			end
		end)
	end

	if slot0.update_drama_max_event == nil then
		slot0.update_drama_max_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Max_Id, function (slot0)
			uv0:updateMainBtnStatus(slot0)
		end)
	end

	if slot0.combat_type_back_event == nil then
		slot0.combat_type_back_event = GlobalEvent:getInstance():Bind(BattleEvent.COMBAT_TYPE_BACK, function (slot0, slot1)
			if slot1 == 0 then
				uv0:openRelevanceWindowAtOnce(slot0)
			end
		end)
	end

	if slot0.battle_exit_event == nil then
		slot0.battle_exit_event = GlobalEvent:getInstance():Bind(SceneEvent.EXIT_FIGHT, function (slot0)
			if not BattleController:getInstance():getModel():checkIsHaveUnfinishedWar(slot0) then
				uv0:openRelevanceWindowAtOnce(slot0)
			end
		end)
	end

	if slot0.isopen_perfer_event == nil then
		slot0.isopen_perfer_event = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_PERFER_ISOPEN, function (slot0)
			if not IS_IOS_PLATFORM then
				uv0:checkFunctionByPerfer(slot0)
			end
		end)
	end
end

function MainuiController.getMainUi(slot0)
	if slot0.mainui then
		return slot0.mainui
	end
end

function MainuiController.getMainUiRoot(slot0)
	if slot0.mainui then
		return slot0.mainui.node
	end
end

function MainuiController.registerProtocals(slot0)
	slot0:RegisterProtocal(12742, "handle12742")
	slot0:RegisterProtocal(16630, "handle16630")
	slot0:RegisterProtocal(16631, "handle16631")
	slot0:RegisterProtocal(10931, "handle10931")
end

function MainuiController.DeleteMe(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end

	if slot0.mainui ~= nil then
		slot0.mainui:DeleteMe()

		slot0.mainui = nil
	end

	if slot0.notice_view then
		slot0.notice_view:DeleteMe()

		slot0.notice_view = nil
	end
end

function MainuiController.updateMainBtnStatus(slot0, slot1)
	if slot0.mainui ~= nil then
		slot0.mainui:checkUnLockStatus(slot1)
	else
		slot0.max_dun_id = slot1
	end

	slot0:checkFunctionByDrama(slot1)
end

function MainuiController.setMergeServerContainerPositionY(slot0, slot1)
	if slot0.mainui then
		slot0.mainui:setMergeServerContainerPositionY(slot1)
	end
end

function MainuiController.openMainUI(slot0, slot1)
	if slot1 == true and BattleController:getInstance():isInFight() == false then
		if slot0.mainui == nil then
			slot0.mainui = MainUiView.New(slot0)

			slot0:checkFunctionByRoleLev()
			delayOnce(function ()
				uv0:requestDownLoadStatus()
			end, 0.5)
		end

		if slot0.mainui then
			slot0.mainui:open()
			slot0.mainui:checkShowNewPromptBubble()

			if slot0.max_dun_id ~= nil then
				slot0.mainui:checkUnLockStatus(slot0.max_dun_id)

				slot0.max_dun_id = nil
			end
		end

		if slot0.notice_view == nil then
			slot0.notice_view = MainUiNoticeView.new()
		end
	elseif slot0.mainui then
		slot0.mainui:close()
	end
end

function MainuiController.setMainUIChatBubbleStatus(slot0, slot1)
	if slot0.mainui then
		slot0.mainui:setMainUIChatBubbleStatus(slot1)
	end
end

function MainuiController.setMainUIShowStatus(slot0, slot1)
	if slot0.mainui then
		slot0.mainui:setIsShowMainUI(slot1)
	end
end

function MainuiController.setIsShowMainUIBottom(slot0, slot1)
	if slot0.mainui then
		slot0.mainui:setShowBottomUI(slot1)
	end
end

function MainuiController.showFuncIconList(slot0, slot1)
	if slot0.mainui then
		slot0.mainui:showFuncIconList(slot1)
	end
end

function MainuiController.updateIconRedStatus(slot0)
	if slot0.mainui then
		slot0.mainui:updateIconRedStatus()
	end
end

function MainuiController.getFunctionIconById(slot0, slot1)
	return slot0.function_list[slot1]
end

function MainuiController.setFunctionTipsStatus(slot0, slot1, slot2)
	if type(slot1) ~= "number" then
		return
	end

	if slot0:getFunctionIconById(slot1) then
		slot3:setTipsStatus(slot2)
	else
		if slot0.cache_tips_list == nil then
			slot0.cache_tips_list = {}
		end

		if type(slot2) == "table" then
			if slot2.bid == nil or type(slot2.bid) ~= "number" then
				return
			end

			if slot0.cache_tips_list[slot1] == nil then
				slot0.cache_tips_list[slot1] = {}
			end

			if slot2.bid ~= nil then
				slot0.cache_tips_list[slot1][slot2.bid] = slot2
			end
		else
			slot0.cache_tips_list[slot1] = slot2
		end
	end

	slot0:checkMainSceneIconStatus()
end

function MainuiController.checkFunctionByRoleLev(slot0, slot1)
	if slot0.mainui == nil then
		return
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	slot3 = {}

	for slot7, slot8 in pairs(Config.FunctionData.data_info) do
		if slot0.function_list[slot8.id] == nil and (not MAKELIFEBETTER or MAKELIFEBETTER == true and slot8.is_verifyios == TRUE) and slot8.open_type == 1 and slot8.activate and slot8.activate[1] and slot9[1] and slot9[2] then
			if slot9[1] == "lev" and slot9[2] <= (slot1 or slot2.lev) and slot0:createFunctionVo(slot8) ~= nil then
				slot0.function_list[slot8.id] = slot12

				table.insert(slot3, slot12)
				GlobalEvent:getInstance():Fire(MainuiEvent.UPDATE_FUNCTION_STATUS, slot8.id, true)
			end
		end
	end

	if next(slot3) and slot0.mainui then
		slot0.mainui:addIconList(slot3)
	end

	slot0:checkCacheWaitFunction()
end

function MainuiController.checkFunctionByPerfer(slot0, slot1)
	if slot1 and slot1 == 1 and slot0.function_list[MainuiConst.icon.perfer_icon] == nil then
		slot0.function_list[MainuiConst.icon.perfer_icon] = slot0:createFunctionVo(Config.FunctionData.data_info[MainuiConst.icon.perfer_icon])

		if slot0.mainui then
			slot0.mainui:addIconList({
				slot3
			})
		end
	end
end

function MainuiController.checkFunctionByDrama(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(Config.FunctionData.data_info) do
		if slot0.function_list[slot7.id] == nil and (not MAKELIFEBETTER or MAKELIFEBETTER == true and slot7.is_verifyios == TRUE) and slot7.open_type == 1 and slot7.activate and slot7.activate[1] and slot8[1] and slot8[2] then
			if slot8[1] == "dun" and slot8[2] <= slot1 and slot0:createFunctionVo(slot7) ~= nil then
				slot0.function_list[slot7.id] = slot11

				table.insert(slot2, slot11)
				GlobalEvent:getInstance():Fire(MainuiEvent.UPDATE_FUNCTION_STATUS, slot7.id, true)
			end
		end
	end

	if next(slot2) and slot0.mainui then
		slot0.mainui:addIconList(slot2)
	end

	slot0:checkCacheWaitFunction()
end

function MainuiController.checkCacheWaitFunction(slot0)
	if slot0.cache_wait_create_list == nil or tableLen(slot0.cache_wait_create_list) == 0 then
		return
	end

	slot1 = RoleController:getInstance():getRoleVo()
	slot2 = BattleDramaController:getInstance():getModel():getDramaData()

	for slot6, slot7 in pairs(slot0.cache_wait_create_list) do
		if Config.FunctionData.data_info[slot6] == nil or slot8.activate == nil then
			slot0.cache_wait_create_list[slot6] = nil
		elseif slot8.activate[1][1] == nil or slot9[2] == nil then
			slot0.cache_wait_create_list[slot6] = nil
		else
			slot11 = slot9[2]

			if (slot9[1] == "lev" and slot1 and slot11 <= slot1.lev or slot10 == "dun" and slot2 and slot11 <= slot2.max_dun_id) and slot0:createFunctionVo(slot8) ~= nil then
				slot12:update(slot0.cache_wait_create_list[slot6])

				slot0.function_list[slot6] = slot12

				if slot0.mainui then
					slot0.mainui:addIcon(slot12)
				end

				slot0.cache_wait_create_list[slot6] = nil

				GlobalEvent:getInstance():Fire(MainuiEvent.UPDATE_FUNCTION_STATUS, slot6, true)
			end
		end
	end
end

function MainuiController.getFucntionIconVoById(slot0, slot1)
	if slot0.function_list and next(slot0.function_list or {}) ~= nil and slot0.function_list[slot1] then
		return slot0.function_list[slot1]
	end
end

function MainuiController.createFunctionVo(slot0, slot1)
	if slot1 == nil then
		return
	end

	if IS_APPLE_RMUI == true and slot1.id ~= MainuiConst.icon.eight_login then
		if slot1.id ~= MainuiConst.icon.welfare then
			return
		end
	end

	if slot1.id == MainuiConst.icon.oppo_gotocommunity and (not IS_OPPO_CHANNEL or BUILD_VERSION == 0) then
		return
	end

	if slot1.id == MainuiConst.icon.scanning and not canAddScannig() then
		return
	end

	if (slot1.id == MainuiConst.icon.action or slot1.id == MainuiConst.icon.festival or slot1.id == MainuiConst.icon.combine) and ActionController:getInstance():checkCanAddWonderful(slot1.id) == false then
		return
	end

	if slot0.function_list[slot1.id] == nil then
		slot2 = FunctionIconVo.New(slot1)
	end

	if slot0.cache_wait_create_list[slot1.id] ~= nil then
		slot2:update(slot0.cache_wait_create_list[slot1.id])

		slot0.cache_wait_create_list[slot1.id] = nil
	end

	if slot0.cache_tips_list[slot1.id] ~= nil then
		slot2:setTipsStatus(slot0.cache_tips_list[slot1.id])

		slot0.cache_tips_list[slot1.id] = nil
	end

	return slot2
end

function MainuiController.addFunctionIconById(slot0, slot1, ...)
	if slot1 == nil then
		return
	end

	if slot1 == MainuiConst.icon.one_cent_gift and not IS_ONECENTGIFT then
		return
	end

	if slot0.function_list[slot1] then
		slot3:update({
			...
		})

		return
	end

	if Config.FunctionData.data_info[slot1] == nil or slot4.activate == nil then
		return
	end

	if MAKELIFEBETTER == true and slot4.is_verifyios == FALSE then
		return
	end

	if slot4.activate[1] == nil or slot5[1] == nil or slot5[2] == nil then
		return
	end

	slot7 = slot5[2]
	slot8 = RoleController:getInstance():getRoleVo()
	slot9 = BattleDramaController:getInstance():getModel():getDramaData()

	if slot5[1] == "lev" and slot8 and slot7 <= slot8.lev or slot6 == "dun" and slot9 and slot7 <= slot9.max_dun_id then
		if slot0:createFunctionVo(slot4) ~= nil then
			slot3:update(slot2)

			slot0.function_list[slot1] = slot3

			if slot0.mainui then
				slot0.mainui:addIcon(slot3)
			end

			GlobalEvent:getInstance():Fire(MainuiEvent.UPDATE_FUNCTION_STATUS, slot1, true)
		end
	else
		slot0.cache_wait_create_list[slot1] = slot2
	end
end

function MainuiController.removeFunctionIconById(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.function_list[slot1] == nil then
		return
	end

	if slot0.mainui then
		slot0.mainui:removeIcon(slot1)
	end

	slot0.function_list[slot1] = nil
	slot0.cache_wait_create_list[slot1] = nil

	GlobalEvent:getInstance():Fire(MainuiEvent.UPDATE_FUNCTION_STATUS, slot1, false)
end

function MainuiController.handle12742(slot0, slot1)
	if slot1 == nil or next(slot1.asset_list) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1.asset_list) do
		slot6.num = tonumber(slot6.num) or 0
	end

	slot0:openGetItemView(true, slot1.asset_list, slot1.source)
end

function MainuiController.openGetItemView(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.exhibition_view then
			slot0.exhibition_view:close()

			slot0.exhibition_view = nil
		end
	else
		slot0.ref_class = ref_class or ItemExhibitionList

		playOtherSound("c_get")

		if slot2 == nil or next(slot2) == nil then
			return
		end

		slot3 = slot3 or 0

		if slot0.exhibition_view == nil then
			slot0.exhibition_view = ItemExhibitionView.New(slot4, slot5)
		end

		if slot0.exhibition_view:isOpen() == false then
			slot0.exhibition_view:open(slot2, slot3)
		end
	end
end

function MainuiController.getItemExhibtionRoot(slot0)
	if slot0.exhibition_view ~= nil then
		return slot0.exhibition_view.root_wnd
	elseif slot0.comp_view ~= nil then
		return slot0.comp_view.root_wnd
	end
end

function MainuiController.openDownloadView(slot0, slot1)
	if slot1 == false then
		if slot0.download_view then
			slot0.download_view:close()

			slot0.download_view = nil
		end
	else
		if slot0.download_view == nil then
			slot0.download_view = DownloadPanel.New()
		end

		if slot0.download_view:isOpen() == false then
			slot0.download_view:open()
		end
	end
end

function MainuiController.openPlayEffectView(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot1 == false then
		if slot0.play_effect_view then
			slot0.play_effect_view:close()

			slot0.play_effect_view = nil
		end
	else
		if slot0.play_effect_view == nil then
			slot0.play_effect_view = PlayEffectView.New(slot0, slot2, slot3, slot4, slot5, slot6, slot7)
		end

		if slot0.play_effect_view:isOpen() == false then
			slot0.play_effect_view:open()
		end
	end
end

function MainuiController.itemExhibitionIsOpen(slot0)
	if slot0.exhibition_view ~= nil then
		return false
	end

	return true
end

function MainuiController.iconClickHandle(slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	if slot1 == MainuiConst.icon.friend then
		FriendController:getInstance():openFriendWindow(true)
	elseif slot1 == MainuiConst.icon.mail then
		MailController:getInstance():openMailPanel(true)
	elseif slot1 == MainuiConst.icon.daily then
		TaskController:getInstance():openTaskMainWindow(true)
	elseif slot1 == MainuiConst.icon.welfare then
		WelfareController:getInstance():openMainWindow(true)
	elseif slot1 == MainuiConst.icon.first_charge then
		ActionController:getInstance():openFirstChargeView(true)
	elseif slot1 == MainuiConst.icon.first_charge_new or slot1 == MainuiConst.icon.first_charge_new1 or slot1 == MainuiConst.icon.first_charge_new2 or slot1 == MainuiConst.icon.first_charge_new3 then
		NewFirstChargeController:getInstance():openNewFirstChargeView(true)
	elseif slot1 == MainuiConst.icon.icon_charge1 then
		ActionController:getInstance():openFirstChargeView(true)
	elseif slot1 == MainuiConst.icon.icon_charge2 then
		ActionController:getInstance():openFirstChargeView(true)
	elseif slot1 == MainuiConst.icon.seven_login then
		ActionController:getInstance():openSevenLoginWin(true)
	elseif slot1 == MainuiConst.icon.limit_recruit then
		RecruitHeroController:getInstance():openRecruitHeroWindow(true)
	elseif slot1 == MainuiConst.icon.limit_gift_entry then
		ActionController:getInstance():openActionLimitGiftMainWindow(true)
	elseif slot1 == MainuiConst.icon.seven_rank then
		ActionController:getInstance():sender22700(0)
	elseif slot1 == MainuiConst.icon.crossserver_rank then
		ActionController:getInstance():sender22700(1)
	elseif slot1 == MainuiConst.icon.festival or slot1 == MainuiConst.icon.action or slot1 == MainuiConst.icon.dongjihuodong then
		ActionController:getInstance():openActionMainPanel(true, slot1)
	elseif slot1 == MainuiConst.icon.combine then
		ActionController:getInstance():openActionMainPanel(true, slot1)
	elseif slot1 == MainuiConst.icon.day_charge then
		ActionController:getInstance():openActionMainPanel(true, nil, 91005)
	elseif slot1 == MainuiConst.icon.godpartner then
		ActionController:getInstance():openActionMainPanel(true, nil, 93006)
	elseif slot1 == MainuiConst.icon.stronger then
		StrongerController:getInstance():openMainWin(true)
	elseif slot1 == MainuiConst.icon.rank then
		RankController:getInstance():openMainView(true)
	elseif slot1 == MainuiConst.icon.download then
		slot0:openDownloadView(true)
	elseif slot1 == MainuiConst.icon.icon_firt1 then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.VIP, 5)
	elseif slot1 == MainuiConst.icon.icon_firt2 then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.VIP, 8)
	elseif slot1 == MainuiConst.icon.icon_firt3 then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.VIP, 12)
	elseif slot1 == MainuiConst.icon.icon_firt4 then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.VIP, 13)
	elseif slot1 == MainuiConst.icon.icon_firt5 then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.VIP, 14)
	elseif slot1 == MainuiConst.icon.champion then
		MainSceneController:getInstance():openBuild(CenterSceneBuild.arena, ArenaConst.arena_type.rank)
	elseif slot1 == MainuiConst.icon.escort then
		slot0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Escort)
	elseif slot1 == MainuiConst.icon.godbattle then
		GodbattleController:getInstance():requestEnterGodBattle()
	elseif slot1 == MainuiConst.icon.dungeon_double_time then
		slot0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
	elseif slot1 == MainuiConst.icon.festval then
		-- Nothing
	elseif slot1 == MainuiConst.icon.festval_spring then
		-- Nothing
	elseif slot1 == MainuiConst.icon.festval_lover then
		-- Nothing
	elseif slot1 == MainuiConst.icon.combine_login then
		-- Nothing
	elseif slot1 == MainuiConst.icon.seven_goal or slot1 == MainuiConst.icon.seven_goal1 or slot1 == MainuiConst.icon.seven_goal2 or slot1 == MainuiConst.icon.seven_goal3 or slot1 == MainuiConst.icon.seven_goal4 then
		ActionController:getInstance():openSevenGoalView(true)
	elseif slot1 == SevenGoalEntranceID.period_1 then
		SevenGoalController:getInstance():openSevenGoalAdventureView(true)
	elseif slot1 == SevenGoalEntranceID.period_2 then
		SevenGoalController:getInstance():openSevenGoalSecretView(true)
	elseif slot1 == MainuiConst.icon.guildwar then
		slot0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildWar)
	elseif slot1 == MainuiConst.icon.direct_gift then
		ActionController:getInstance():openDirectBuyGiftWin(true, 991016)
	elseif slot1 == MainuiConst.icon.lucky_treasure then
		ActionController:getInstance():openLuckyTreasureWin(true)
	elseif slot1 == MainuiConst.icon.preferential then
		-- Nothing
	elseif slot1 == MainuiConst.icon.other_preferential then
		-- Nothing
	elseif slot1 == MainuiConst.icon.ladder or slot1 == MainuiConst.icon.ladder_2 then
		slot0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LadderWar)
	elseif slot1 == MainuiConst.icon.certify then
		RoleController:getInstance():openRoleAttestationWindow(true)
	elseif slot1 == MainuiConst.icon.fund then
		ActionController:getInstance():openActionFundWindow(true)
	elseif slot1 == MainuiConst.icon.charge then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	elseif slot1 == MainuiConst.icon.chargehcoin then
		CommonAlert.show(TI18N("消耗快乐币,购买任意道具，即可刷新货币！！"), TI18N("确定"), function ()
			sdkCallFunc("openUrl", PAY_URI .. "?UserID=" .. LoginController:getInstance():getModel():getLoginData().usrName)
		end, TI18N("取消"))
	elseif slot1 == MainuiConst.icon.chongzhilibao then
		CommonAlert.show(TI18N("是否打开玩家中心"), TI18N("确定"), function ()
			slot0 = LoginController:getInstance():getModel():getLoginData()

			sdkCallFunc("openUrl", ROLE_URI .. "?account=" .. slot0.usrName .. "&password=" .. slot0.password)
		end, TI18N("取消"))
	elseif slot1 == MainuiConst.icon.day_first_charge then
		DayChargeController:getInstance():openDayFirstChargeView(true)
	elseif slot1 == MainuiConst.icon.vedio then
		VedioController:getInstance():openVedioMainWindow(true)
	elseif slot1 == MainuiConst.icon.open_server_recharge then
		ActionController:getInstance():openActionOpenServerGiftWindow(true, ActionRankCommonType.open_server)
	elseif slot1 == OrderActionEntranceID.entrance_id or slot1 == OrderActionEntranceID.entrance_id1 or slot1 == OrderActionEntranceID.entrance_id2 or slot1 == OrderActionEntranceID.entrance_id3 or slot1 == OrderActionEntranceID.entrance_id4 or slot1 == OrderActionEntranceID.entrance_id5 or slot1 == OrderActionEntranceID.entrance_id6 or slot1 == OrderActionEntranceID.entrance_id7 or slot1 == OrderActionEntranceID.entrance_id8 or slot1 == OrderActionEntranceID.entrance_id9 then
		OrderActionController:getInstance():openOrderActionMainView(true)
	elseif slot1 == NewOrderActionEntranceID.entrance_id then
		NeworderactionController:getInstance():openOrderActionMainView(true)
	elseif slot1 == MainuiConst.icon.return_action then
		ReturnActionController:getInstance():openReturnActionMainPanel(true)
	elseif slot1 == MainuiConst.icon.oppo_gotocommunity then
		callFunc("gotoCommunity")
	elseif slot1 == MainuiConst.icon.crosschampion then
		slot0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossChampion)
	elseif slot1 == MainuiConst.icon.personal_gift then
		FestivalActionController:getInstance():openPersonalGiftView(true)
	elseif slot1 == MainuiConst.icon.special_vip then
		ActionController:getInstance():openActionSpecialVIPWindow(true)
	elseif slot1 == MainuiConst.icon.perfer_icon then
		ActionController:getInstance():openActionPerferPrizeWindow(true)
	elseif slot1 == MainuiConst.icon.year_monster then
		ActionyearmonsterController:getInstance():sender28204()
	elseif slot1 == MainuiConst.icon.monopoly then
		MonopolyController:getInstance():openHolynightMainWindow(true)
	elseif slot1 == MainuiConst.icon.scanning then
		slot4 = LoginController:getInstance():getModel():getLoginData()

		callFunc("scanning", string.format("{\"ip\":\"%s\", \"port\":\"%s\", \"host\":\"%s\", \"rid\":\"%s\", \"srv_id\":\"%s\", \"usrName\":\"%s\", \"srv_name\":\"%s\"}", slot4.ip, slot4.port, slot4.host, slot4.rid, slot4.srv_id, slot4.usrName, slot4.srv_name))
	elseif slot1 == MainuiConst.icon.limit_time_btn then
		slot0:openLimitTimePlayPanel(true, {
			world_pos = slot2:convertToWorldSpace(cc.p(0.5, 0.5))
		})
	elseif slot1 == MainuiConst.icon.peak_champion then
		ArenapeakchampionController:getInstance():openArenapeakchampionMainWindow(true)
	elseif slot1 == MainuiConst.icon.limit_time_gift then
		LimitTimeActionController:getInstance():openLimitTimeGiftWindow(true)
	elseif slot1 == MainuiConst.icon.skin_direct_purchase then
		ActionController:getInstance():openActionSkinDirectPurchasePanel(true)
	elseif slot1 == MainuiConst.icon.eight_login then
		ActionController:getInstance():openEightLoginWin(true)
	elseif slot1 == MainuiConst.icon.one_cent_gift or slot1 == MainuiConst.icon.one_yuan_gift then
		OnecentgiftController:getInstance():openOnecentiftView(true)
	elseif slot1 == MainuiConst.icon.rfm_personnal_gift then
		RfmPersonnalGiftController:getInstance():openRfmPersonalGiftView(true)
	elseif slot1 == MainuiConst.icon.arena_many_people then
		slot0:requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.AreanManyPeople)
	end
end

function MainuiController.getDownLoadStatus(slot0)
	return slot0.down_load_status
end

function MainuiController.getDownLoadItems(slot0)
	return slot0.down_load_items
end

function MainuiController.requestDownLoadStatus(slot0)
	slot0:SendProtocal(16630, {})
end

function MainuiController.handle16630(slot0, slot1)
	slot0.down_load_status = slot1.code
	slot0.down_load_items = slot1.items

	if slot0:checkDownLoadStatus() == true then
		slot0:removeFunctionIconById(MainuiConst.icon.download)
	else
		slot0:addFunctionIconById(MainuiConst.icon.download)
	end
end

function MainuiController.checkDownLoadStatus(slot0)
	if IS_REQUIRE_RES_GY == false then
		return true
	end

	if slot0.down_load_status == TRUE and (ResourcesLoadMgr:getInstance():getPercentage() or 0) >= 100 then
		return true
	else
		return false
	end

	return true
end

function MainuiController.requestGetDownLoadAwards(slot0)
	slot0:SendProtocal(16631, {})
end

function MainuiController.handle16631(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.down_load_status = TRUE

		if slot0:checkDownLoadStatus() == true then
			slot0:openDownloadView(false)
			slot0:removeFunctionIconById(MainuiConst.icon.download)
		else
			slot0:addFunctionIconById(MainuiConst.icon.download)
		end
	end
end

function MainuiController.openCommonExplainView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.common_explain ~= nil then
			slot0.common_explain:close()

			slot0.common_explain = nil
		end
	else
		if slot2 == nil or next(slot2) == nil then
			return
		end

		if slot0.common_explain == nil then
			slot0.common_explain = CommonExplainWindow.New(MainuiController:getInstance(), slot3, slot4)
		end

		if slot0.common_explain and slot0.common_explain:isOpen() == false then
			slot0.common_explain:open(slot2)
		end
	end
end

function MainuiController.getMainUIIndex(slot0)
	if slot0.mainui then
		return slot0.mainui:getMainUiIndex()
	end
end

function MainuiController.setUIFightType(slot0, slot1)
	slot0.ui_fight_type = slot1
end

function MainuiController.getUIFightType(slot0)
	return slot0.ui_fight_type
end

function MainuiController.checkIsInDramaUIFight(slot0)
	return slot0.ui_fight_type == MainuiConst.ui_fight_type.drama_scene
end

function MainuiController.checkIsInSkySceneUIFight(slot0)
	return slot0.ui_fight_type == MainuiConst.ui_fight_type.sky_scene
end

function MainuiController.checkIsInEndlessUIFight(slot0)
	return slot0.ui_fight_type == MainuiConst.ui_fight_type.endless
end

function MainuiController.isInSkySceneOrDramaScene(slot0)
	return slot0:checkIsInDramaUIFight() or slot0:checkIsInSkySceneUIFight()
end

function MainuiController.changeMainUIStatus(slot0, slot1, slot2, slot3, slot4)
	if slot0.mainui then
		if slot2 == MainuiConst.sub_type.adventure and Config.CityData.data_base[CenterSceneBuild.adventure] and slot0:checkIsOpenByActivate(slot5.activate) == false then
			message(slot5.desc)

			return
		end

		slot0.mainui:changeMainUiStatus(slot1, slot2, slot3, slot4)
	end
end

function MainuiController.getBottomHeight(slot0)
	if slot0.mainui then
		return slot0.mainui:getBottomHeight()
	end
end

function MainuiController.setBtnRedPoint(slot0, slot1, slot2)
	if type(slot1) ~= "number" then
		return
	end

	if slot0.mainui then
		slot0.mainui:updateBtnTipsPoint(slot1, slot2)

		if slot1 == MainuiConst.btn_index.backpack then
			BackpackController:getInstance():setEquipBackPackStatus(slot2)
		end
	end
end

function MainuiController.setBackPackBtnPos(slot0, slot1)
	slot0.backpack_pos = slot1
end

function MainuiController.getBackPackBtnPos(slot0)
	if slot0.backpack_pos then
		return slot0.backpack_pos
	end
end

function MainuiController.requestOpenBattleRelevanceWindow(slot0, slot1, slot2)
	slot0.relevance_ui_last_type = slot0.ui_fight_type
	slot0.relevance_battle_type = slot1
	slot0.relevance_ui_fight_type = BattleConst.getUIFightByFightType(slot1)
	slot0.relevance_params = slot2

	slot0:setUIFightType(slot0.relevance_ui_fight_type)
	BattleController:getInstance():send20060(slot1)
end

function MainuiController.resetUIFightType(slot0)
	if slot0.relevance_ui_last_type then
		slot0.ui_fight_type = slot0.relevance_ui_last_type
		slot0.relevance_ui_last_type = MainuiConst.ui_fight_type.normal
	end
end

function MainuiController.openRelevanceWindowAtOnce(slot0, slot1)
	if slot1 == BattleConst.Fight_Type.WorldBoss or slot1 == BattleConst.Fight_Type.SingleBoss then
		if slot0.relevance_battle_type ~= BattleConst.Fight_Type.WorldBoss and slot0.relevance_battle_type ~= BattleConst.Fight_Type.SingleBoss then
			return
		end
	elseif slot0.relevance_battle_type ~= slot1 then
		return
	end

	if slot0.relevance_ui_fight_type ~= slot0.ui_fight_type then
		return
	end

	if slot1 == BattleConst.Fight_Type.GuildDun then
		GuildbossController:getInstance():openMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.Arena then
		ArenaController:getInstance():openArenaLoopMathWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.StarTower then
		StartowerController:getInstance():openMainView(true)
	elseif slot1 == BattleConst.Fight_Type.Endless then
		Endless_trailController:getInstance():openEndlessMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.Escort then
		EscortController:getInstance():openEscortMainWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.Adventrue then
		AdventureController:getInstance():openAdventureMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.AdventrueMine then
		AdventureController:getInstance():openAdventureMineWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.DungeonStone then
		Stone_dungeonController:getInstance():openStoneDungeonView(true)
	elseif slot1 == BattleConst.Fight_Type.Godbattle then
		GodbattleController:getInstance():openGodBattleMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.GuildWar then
		GuildwarController:getInstance():openMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.PrimusWar then
		PrimusController:getInstance():openPrimusMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.LadderWar then
		LadderController:getInstance():openMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.ExpeditFight then
		PlanesController:getInstance():openPlanesMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.YuanZhenFight then
		AnimateActionController:getInstance():openAnimateYuanzhenCollectWindow(true)
	elseif slot1 == BattleConst.Fight_Type.EliteMatchWar then
		ElitematchController:getInstance():openElitematchMatchingWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.ElementWar then
		ElementController:getInstance():openElementMainWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.HeavenWar then
		HeavenController:getInstance():openHeavenMainWindow(true, slot0.relevance_params, HeavenConst.Tab_Index.Dungeon, nil, true)
	elseif slot1 == BattleConst.Fight_Type.SandybeachBossFight then
		ActionController:getInstance():openSandybeachBossFightMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.CrossArenaWar then
		CrossarenaController:getInstance():openCrossarenaMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.LimitExercise then
		LimitExerciseController:getInstance():openLimitExerciseChangeView(true)
	elseif slot1 == BattleConst.Fight_Type.CrossChampion then
		CrosschampionController:getInstance():openCrosschampionMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.TermBegins or slot1 == BattleConst.Fight_Type.TermBeginsBoss then
		ActiontermbeginsController:getInstance():openActiontermbeginsMainWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.GuildSecretArea then
		GuildsecretareaController:getInstance():openGuildsecretareaMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.Arean_Team then
		ArenateamController:getInstance():openArenateamMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.MonopolyWar_1 or slot1 == BattleConst.Fight_Type.MonopolyWar_2 or slot1 == BattleConst.Fight_Type.MonopolyWar_3 or slot1 == BattleConst.Fight_Type.MonopolyWar_4 then
		MonopolyController:getInstance():openMonopolyMianScene(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.MonopolyBoss then
		MonopolyController:getInstance():openHolynightBossWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.Training_Camp then
		TrainingcampController:getInstance():openTrainingcampWindow(true)
	elseif slot1 == BattleConst.Fight_Type.Arenapeakchampion then
		ArenapeakchampionController:getInstance():openArenapeakchampionGuessingWindow(true)
	elseif slot1 == BattleConst.Fight_Type.PlanesWar then
		PlanesafkController:getInstance():openPlanesafkMainWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.YearMonsterWar then
		ActionyearmonsterController:getInstance():openActionyearmonsterMainWindow(true, slot0.relevance_params)
	elseif slot1 == BattleConst.Fight_Type.AreanManyPeople then
		ArenaManyPeopleController:getInstance():openArenaManyPeopleMainWindow(true)
	elseif slot1 == BattleConst.Fight_Type.PractiseTower then
		PractisetowerController:getInstance():openMainView(true)
	end

	slot0.relevance_battle_type = nil
	slot0.relevance_ui_fight_type = nil
	slot0.relevance_params = nil
end

function MainuiController.checkMainFunctionOpenStatus(slot0, slot1, slot2, slot3)
	slot1 = slot1 or 0
	slot4 = nil
	slot5 = ""
	slot6 = false

	if (((slot2 or MainuiConst.function_type.main) ~= MainuiConst.function_type.main or Config.FunctionData.data_base[slot1]) and Config.FunctionData.data_info[slot1]) == nil or slot4.activate == nil then
		slot5 = TI18N("配置数据异常")
		slot6 = false
	else
		slot5 = slot4.desc
		slot6 = slot0:checkIsOpenByActivate(slot4.activate)
	end

	if not slot3 and slot6 == false then
		message(slot5)
	end

	return slot6
end

function MainuiController.checkIsOpenByActivate(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()
	slot3 = BattleDramaController:getInstance():getModel():getDramaData()

	if slot1 == nil or type(slot1) ~= "table" or next(slot1) == nil then
		return false
	end

	if slot2 == nil or slot3 == nil or slot3.max_dun_id == nil then
		return false
	end

	for slot7, slot8 in ipairs(slot1) do
		slot11 = 0
		slot12 = ""

		if slot8[1] == "lev" then
			slot11 = slot2.lev
			slot12 = string.format(TI18N("角色等级达到%s级解锁"), slot8[2] or 0)
		elseif slot9 == "open_day" then
			slot11 = slot2.open_day
			slot12 = string.format(TI18N("开服%s天解锁"), slot10)
		elseif slot9 == "dun" then
			slot11 = slot3.max_dun_id
		elseif slot9 == "vip_lev" then
			slot11 = slot2.vip_lev
			slot12 = string.format(TI18N("VIP等级达到%s级解锁"), slot10)
		elseif slot9 == "world_lev" then
			slot11 = RoleController:getInstance():getModel():getWorldLev()
			slot12 = string.format(TI18N("世界等级达到%s级解锁"), slot10)
		elseif slot9 == "charge_num" then
			slot11 = slot2.vip_exp * 0.1
		end

		if slot10 > slot11 then
			return false, slot12
		end
	end

	return true
end

function MainuiController.checkMainSceneIconStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.function_list) do
		if slot6:getTipsStatus() == true then
			slot1 = true

			break
		end
	end

	if slot1 == true then
		if slot0.main_scene_btn_status == false then
			slot0.main_scene_btn_status = true

			slot0:setBtnRedPoint(MainuiConst.btn_index.main_scene, slot0.main_scene_btn_status)
		end

		return
	end

	if MainSceneController:getInstance():getBuildVoList() then
		for slot6, slot7 in pairs(slot2) do
			if slot7:getTipsStatus() == true then
				slot1 = true

				break
			end
		end
	end

	if slot1 ~= slot0.main_scene_btn_status then
		slot0.main_scene_btn_status = slot1

		slot0:setBtnRedPoint(MainuiConst.btn_index.main_scene, slot0.main_scene_btn_status)
	end
end

function MainuiController.setFuncionIconTime(slot0, slot1, slot2)
	if slot0:getFunctionIconById(slot1) then
		slot3:changeTime(slot2)
	end
end

function MainuiController.getMainChatInput(slot0)
	if slot0.mainui and slot0.mainui.chat_ui then
		return slot0.mainui.chat_ui.chat_input
	end
end

function MainuiController.openMianChatChannel(slot0, slot1, slot2)
	if slot1 == ChatConst.Channel.Friend then
		slot3 = ChatController:getInstance():getModel()

		if slot2 then
			slot3:addContactList(slot2.srv_id, slot2.rid)
			slot3:writeContactList()
		elseif FriendController:getInstance():getModel():getArray():Get(0) then
			slot3:addContactList(slot4.srv_id, slot4.rid)
			slot3:writeContactList()
		end

		if slot2 then
			slot0.mainui.chat_ui:openChannel(slot1, slot2.srv_id, slot2.rid)
		else
			slot0.mainui.chat_ui:openChannel(slot1)
		end
	else
		slot0.mainui.chat_ui:openChannel(slot1)
	end
end

function MainuiController.mainChatAtPeople(slot0, slot1, slot2)
	if slot0:getMainChatInput() then
		slot3:setInputText("@" .. slot1 .. " ", slot2)
	end
end

function MainuiController.setMainChatBoxCurViewType(slot0, slot1)
	slot0.cur_view_type = slot1

	if slot0.mainui and slot0.mainui.chat_ui then
		slot0.mainui.chat_ui:changeChatUIHeight(true)
	end
end

function MainuiController.getMainChatBoxCurViewType(slot0)
	return slot0.cur_view_type or ChatConst.ViewType.Normal
end

function MainuiController.openLimitActionTips(slot0, slot1)
	if not slot1 then
		if slot0.limit_action_window then
			slot0.limit_action_window:close()

			slot0.limit_action_window = nil
		end
	else
		if slot0.limit_action_window == nil then
			slot0.limit_action_window = LimitActionWindowTips.New()
		end

		slot0.limit_action_window:open()
	end
end

function MainuiController.openLimitTimePlayPanel(slot0, slot1, slot2)
	if not slot1 then
		if slot0.limit_time_play_panel then
			slot0.limit_time_play_panel:close()

			slot0.limit_time_play_panel = nil
		end
	else
		if slot0.limit_time_play_panel == nil then
			slot0.limit_time_play_panel = LimitTimePlayPanel.New()
		end

		slot0.limit_time_play_panel:open(slot2)
	end
end

function MainuiController.onClickPromptTipsItem(slot0, slot1)
	if slot1.type == PromptTypeConst.Private_chat then
		slot2 = {
			rid = slot7.value
		}

		for slot6, slot7 in pairs(slot1.list[1].data.arg_uint32) do
			if slot7.key == 1 then
				-- Nothing
			end
		end

		for slot6, slot7 in pairs(slot1.list[1].data.arg_str) do
			if slot7.key == 1 then
				slot2.srv_id = slot7.value
			end
		end

		if next(slot2) ~= nil then
			ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend, "friend", slot2)
		end
	elseif slot1.type == PromptTypeConst.World_boss then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.world_boss)
	elseif slot1.type == PromptTypeConst.At_notice then
		ChatController:getInstance():openChatPanel()
	elseif slot1.type == PromptTypeConst.Endless_trail then
		Endless_trailController:getInstance():openEndlessBuffView(true)

		return
	elseif slot1.type == PromptTypeConst.Escort then
		EscortController:getInstance():openEscortMyInfoWindow(true)
	elseif slot1.type == PromptTypeConst.GuileMuster then
		GuildbossController:getInstance():openMainWindow(true)
	elseif slot1.type == PromptTypeConst.Challenge then
		BattleController:getInstance():confirmBattlePk(slot1)
	elseif slot1.type == PromptTypeConst.Guild then
		GuildController:getInstance():checkOpenGuildWindow()
	elseif slot1.type == PromptTypeConst.Guild_war then
		if GuildwarController:getInstance():checkIsCanOpenGuildWarWindow() == true then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildWar)
		end
	elseif slot1.type == PromptTypeConst.Guild_voyage then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.GuildDun)
	elseif slot1.type == PromptTypeConst.BBS_message or slot1.type == PromptTypeConst.BBS_message_reply_self then
		RoleController:getInstance():openRolePersonalSpacePanel(true, {
			index = RoleConst.Tab_type.eMessageBoard
		})

		if RoleController:getInstance():getRoleVo() then
			RoleController:getInstance():send25840(slot2.rid, slot2.srv_id, 0)
		end
	elseif slot1.type == PromptTypeConst.BBS_message_reply then
		if #slot1.list > 0 then
			slot5, slot6, slot7, slot8, slot9 = slot1:getSridByData(slot2[1].data)

			if slot5 and slot6 then
				RoleController:getInstance():requestRoleInfo(slot5, slot6, {
					form_type = RoleConst.Other_Form_Type.eMessageBoardInfo,
					bbs_id = slot9
				})
				RoleController:getInstance():send25840(slot5, slot6, slot9)
			end
		end
	elseif slot1.type == PromptTypeConst.Mine_defeat then
		AdventureController:getInstance():openAdventureMineFightRecordPanel(true)
	elseif slot1.type == PromptTypeConst.Peak_champion_arena_tips then
		ArenapeakchampionController:getInstance():openArenapeakchampionMainWindow(true)
	elseif slot1.type == PromptTypeConst.Corss_arena_tips then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossArenaWar)
	elseif slot1.type == PromptTypeConst.Artifact_Count_tips then
		ForgeHouseController:getInstance():openForgeHouseView(true, ForgeHouseConst.Tab_Index.Artifact)
	elseif slot1.type == PromptTypeConst.Year_Monster_tips then
		slot0.is_click_yearmoster = true

		JumpController:getInstance():jumpViewByEvtData({
			70
		})
	end

	if slot1.type == PromptTypeConst.BBS_message_reply then
		PromptController:getInstance():getModel():removePromptData(slot1.type, slot1.id)
	elseif slot1.type == PromptTypeConst.BBS_message or slot1.type == PromptTypeConst.BBS_message_reply_self then
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.BBS_message)
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.BBS_message_reply_self)
	elseif slot1.type == PromptTypeConst.AMP_tips then
		JumpController:getInstance():jumpViewByEvtData({
			76
		})
	else
		PromptController:getInstance():getModel():removePromptDataByTpye(slot1.type)
	end
end

function MainuiController.updateCustomHeadImg(slot0, slot1)
	if slot0.head_img_win then
		slot0.head_img_win:updateSelectHeadImg(slot1)
	end
end

function MainuiController.openCustomHeadImgWin(slot0, slot1)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if not CAN_USE_CAMERA then
		if IS_IOS_PLATFORM == true then
			message(TI18N("功能暂未开启，敬请期待"))
		else
			get_apk_url(function (slot0)
				if slot0 and slot0.success == true and slot0.message then
					if slot0.message.url and slot0.message.url ~= "" and PLATFORM_NAME == "symlf" then
						CommonAlert.show(TI18N("是否前往下载最新版本，解锁自定义头像功能？"), TI18N("确定"), function ()
							sdkCallFunc("openUrl", uv0.message.url)
						end, TI18N("取消"))
					else
						message(TI18N("功能暂未开启，敬请期待"))
					end
				else
					message(TI18N("功能暂未开启，敬请期待"))
				end
			end)
		end

		return
	end

	if slot1 == true then
		if slot0.head_img_win == nil then
			slot0.head_img_win = CustomHeadImgWindow.New()
		end

		slot0.head_img_win:open()
	elseif slot0.head_img_win then
		slot0.head_img_win:close()

		slot0.head_img_win = nil
	end
end

function MainuiController.handle10931(slot0, slot1)
	if slot1.code == 0 then
		slot0:removeFunctionIconById(MainuiConst.icon.scanning)
	else
		slot0:addFunctionIconById(MainuiConst.icon.scanning)
	end
end
