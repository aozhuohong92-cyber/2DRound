AdventureController = AdventureController or BaseClass(BaseController)

function AdventureController.config(slot0)
	slot0.ui_model = AdventureUIModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function AdventureController.getUiModel(slot0)
	return slot0.ui_model
end

function AdventureController.registerEvents(slot0)
end

function AdventureController.requestInitProtocal(slot0, slot1)
	if slot1 == nil then
		slot2 = AdventureActivityController:getInstance():isOpenActivity(AdventureActivityConst.Ground_Type.adventure)
	end

	if slot2 == false then
		return
	end

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	slot0:send20600()
	slot0:send20601()
	slot0:send20604()
end

function AdventureController.registerProtocals(slot0)
	slot0:RegisterProtocal(20600, "handle20600")
	slot0:RegisterProtocal(20601, "handle20601")
	slot0:RegisterProtocal(20602, "handle20602")
	slot0:RegisterProtocal(20603, "handle20603")
	slot0:RegisterProtocal(20604, "handle20604")
	slot0:RegisterProtocal(20605, "handle20605")
	slot0:RegisterProtocal(20606, "handle20606")
	slot0:RegisterProtocal(20607, "handle20607")
	slot0:RegisterProtocal(20608, "handle20608")
	slot0:RegisterProtocal(20609, "handle20609")
	slot0:RegisterProtocal(20610, "handle20610")
	slot0:RegisterProtocal(20611, "handle20611")
	slot0:RegisterProtocal(20612, "handle20612")
	slot0:RegisterProtocal(20636, "handle20636")
	slot0:RegisterProtocal(20620, "handle20620")
	slot0:RegisterProtocal(20621, "handle20621")
	slot0:RegisterProtocal(20622, "handle20622")
	slot0:RegisterProtocal(20623, "handle20623")
	slot0:RegisterProtocal(20624, "handle20624")
	slot0:RegisterProtocal(20625, "handle20625")
	slot0:RegisterProtocal(20627, "handle20627")
	slot0:RegisterProtocal(20628, "handle20628")
	slot0:RegisterProtocal(20630, "handle20630")
	slot0:RegisterProtocal(20631, "handle20631")
	slot0:RegisterProtocal(20632, "handle20632")
	slot0:RegisterProtocal(20633, "handle20633")
	slot0:RegisterProtocal(20634, "handle20634")
	slot0:RegisterProtocal(20635, "handle20635")
	slot0:RegisterProtocal(20640, "handle20640")
	slot0:RegisterProtocal(20641, "handle20641")
	slot0:RegisterProtocal(20642, "handle20642")
	slot0:RegisterProtocal(20643, "handle20643")
	slot0:RegisterProtocal(20644, "handle20644")
	slot0:RegisterProtocal(20645, "handle20645")
	slot0:RegisterProtocal(20646, "handle20646")
	slot0:RegisterProtocal(20647, "handle20647")
	slot0:RegisterProtocal(20648, "handle20648")
	slot0:RegisterProtocal(20649, "handle20649")
	slot0:RegisterProtocal(20651, "handle20651")
	slot0:RegisterProtocal(20652, "handle20652")
	slot0:RegisterProtocal(20653, "handle20653")
	slot0:RegisterProtocal(20654, "handle20654")
	slot0:RegisterProtocal(20655, "handle20655")
	slot0:RegisterProtocal(20656, "handle20656")
	slot0:RegisterProtocal(20657, "handle20657")
	slot0:RegisterProtocal(20658, "handle20658")
	slot0:RegisterProtocal(20659, "handle20659")
	slot0:RegisterProtocal(20660, "handle20660")
end

function AdventureController.send20640(slot0, slot1, slot2)
	slot0:SendProtocal(20640, {
		floor = slot1,
		is_notice = slot2 or 0
	})
end

function AdventureController.handle20640(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_BASE_INFO_EVENT, slot1)
end

function AdventureController.send20641(slot0, slot1, slot2)
	slot0:SendProtocal(20641, {
		floor = slot1,
		room_id = slot2
	})
end

function AdventureController.handle20641(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_SINGLE_INFO_EVENT, slot1)
end

function AdventureController.send20642(slot0)
	slot0:SendProtocal(20642, {})
end

function AdventureController.handle20642(slot0, slot1)
	slot0.ui_model:updateMineDefenseInfo(slot1)
end

function AdventureController.send20643(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(20643, {
		floor = slot1,
		room_id = slot2,
		is_skip = slot3
	})

	if slot0.adventure_mine_fight_panel then
		slot0:openAdventureMineFightPanel(false)
	end
end

function AdventureController.handle20643(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_FIGHT_EVENT, slot1)
end

function AdventureController.send20644(slot0)
	slot0:SendProtocal(20644, {})
end

function AdventureController.handle20644(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_ALL_LOG_EVENT, slot1)
end

function AdventureController.send20645(slot0, slot1, slot2)
	slot0:SendProtocal(20645, {
		floor = slot1,
		room_id = slot2
	})
end

function AdventureController.handle20645(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_SINGE_LOG_EVENT, slot1)
end

function AdventureController.send20646(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(20646, {
		floor = slot1,
		room_id = slot2,
		id = slot3,
		pos_info = slot4,
		hallows_id = slot5
	})
end

function AdventureController.handle20646(slot0, slot1)
	if slot1.flag == TRUE then
		slot0:send20642()

		if slot0.adventure_mine_window and slot0.adventure_mine_window.sendUpdateMineData then
			slot0.adventure_mine_window:sendUpdateMineData()
		end

		GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_SAVE_FORM_EVENT)

		if slot0.adventure_mine_result_window then
			slot0:openAdventureMineFightResultPanel(false)
		end

		if slot0.is_strike_back and slot0.adventure_mine_my_info_panel then
			slot0.is_strike_back = false

			slot0:send20652()
		end
	end

	message(slot1.msg)
end

function AdventureController.send20647(slot0)
	slot0:SendProtocal(20647, {})
end

function AdventureController.handle20647(slot0, slot1)
	slot0.ui_model:setScdata20647(slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_BOX_LIST_EVENT, slot1)
end

function AdventureController.send20648(slot0, slot1)
	slot0:SendProtocal(20648, {
		num = slot1
	})
end

function AdventureController.handle20648(slot0, slot1)
	slot0.ui_model:setReceiveByNum(slot1.num)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_RECEIVE_BOX_EVENT, slot1)
end

function AdventureController.handle20649(slot0, slot1)
	if slot1.result == 1 then
		BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.AdventrueMine, slot1)

		if slot0.adventure_mine_window and slot0.adventure_mine_window.sendUpdateMineData then
			slot0.adventure_mine_window:sendUpdateMineData()
			slot0:send20647()
		end
	else
		BattleController:getInstance():openFailFinishView(true, BattleConst.Fight_Type.AdventrueMine, slot1.result, slot1)
	end

	if slot0.adventure_mine_fight_panel then
		slot0:openAdventureMineFightPanel(false)
	end
end

function AdventureController.send20651(slot0, slot1, slot2)
	slot0:SendProtocal(20651, {
		floor = slot1,
		room_id = slot2
	})
end

function AdventureController.handle20651(slot0, slot1)
	if slot1.code == TRUE then
		if slot0.adventure_mine_window and slot0.adventure_mine_window.sendUpdateMineData then
			slot0.adventure_mine_window:sendUpdateMineData()
		end

		slot0:send20642()
		GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_GIVE_UP_OCCUPY_EVENT)
	end

	message(slot1.msg)
end

function AdventureController.send20652(slot0)
	slot0:SendProtocal(20652, {})
end

function AdventureController.handle20652(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_MY_MINE_INFO_EVENT, slot1)
end

function AdventureController.send20653(slot0)
	slot0:SendProtocal(20653, {})
end

function AdventureController.handle20653(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_All_LAYER_INFO_EVENT, slot1)
end

function AdventureController.send20654(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(20654, {
		floor = slot1,
		room_id = slot2,
		type = slot3
	})
end

function AdventureController.handle20654(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_BUY_EMPLOY_EVENT, slot1)
	end

	message(slot1.msg)
end

function AdventureController.send20655(slot0)
	slot0:SendProtocal(20655, {})
end

function AdventureController.handle20655(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_BUY_COUNT_EVENT, slot1)
	end

	message(slot1.msg)
end

function AdventureController.send20656(slot0, slot1, slot2)
	slot0:SendProtocal(20656, {
		rid = slot1,
		srvid = slot2
	})
end

function AdventureController.handle20656(slot0, slot1)
	if slot1.floor ~= 0 and slot1.room_id ~= 0 then
		GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_STRIKE_BACK_EVENT, slot1)

		slot0.is_strike_back = true
	else
		message(TI18N("对方已经没有可以攻占的灵矿了"))
	end
end

function AdventureController.send20657(slot0)
	slot0:SendProtocal(20657, {})
end

function AdventureController.handle20657(slot0, slot1)
	slot0.ui_model:setMineRecordRedpoint(slot1.code == 1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_RECORD_RED_POINT_EVENT, slot1)
end

function AdventureController.send20659(slot0)
	slot0:SendProtocal(20659, {})
end

function AdventureController.handle20659(slot0, slot1)
	slot0.ui_model:setMineCountRedpoint(slot1.code == 1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_LOGIN_RED_POINT_EVENT, slot1)
end

function AdventureController.send20658(slot0)
	slot0:SendProtocal(20658, {})
end

function AdventureController.handle20658(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.ADVENTURE_MINE_HALLOWS_LIST_EVENT, slot1)
end

function AdventureController.send20660(slot0, slot1, slot2)
	slot0:SendProtocal(20660, {
		floor = slot1,
		room_id = slot2
	})
end

function AdventureController.handle20660(slot0, slot1)
	message(slot1.msg)
end

function AdventureController.openAnswerView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.adventure_answer_view ~= nil then
			slot0.adventure_answer_view:close()

			slot0.adventure_answer_view = nil
		end
	else
		if slot0.adventure_answer_view == nil then
			slot0.adventure_answer_view = AdventureEvtAnswerWindow.New(slot2)
		end

		if slot0.adventure_answer_view and slot0.adventure_answer_view:isOpen() == false then
			slot0.adventure_answer_view:open()
		end
	end
end

function AdventureController.openAdventureFormWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.form_window then
			slot0.form_window:close()

			slot0.form_window = nil
		end
	else
		if slot0.form_window == nil then
			slot0.form_window = AdventureFormWindow.New()
		end

		slot0.form_window:open(slot2)
	end
end

function AdventureController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end

	if slot0.ui_model ~= nil then
		slot0.ui_model:DeleteMe()

		slot0.ui_model = nil
	end
end

function AdventureController.getAdventureRoot(slot0)
	if slot0.adventure_window then
		return slot0.adventure_window.root_wnd
	end
end

function AdventureController.getNextAlertRoot(slot0)
	if slot0.adventure_window and slot0.adventure_window:getAlert() then
		return slot1.root_wnd
	end
end

function AdventureController.checkMaxMineLayerInfo(slot0)
	if slot0.ui_model:getAdventureBaseData() == nil or slot1.current_id == nil or slot1.id == nil then
		return false
	end

	if math.floor(slot1.id / 10) * 10 < 10 then
		return false
	end

	slot0:requestEnterAdventureMine(slot2)

	return true
end

function AdventureController.requestEnterMaxAdventureMine(slot0)
	if not slot0.ui_model:getAdventureBaseData() then
		return
	end

	slot2 = slot1.pass_id or 0
	slot3 = 0

	if Config.AdventureMineData.data_floor_data then
		for slot8, slot9 in pairs(slot4) do
			if slot9.floor <= slot2 and slot3 < slot9.floor then
				slot3 = slot9.floor
			end
		end
	end

	if slot3 ~= 0 then
		slot0:requestEnterAdventure(true, slot3)
	end
end

function AdventureController.requestEnterAdventure(slot0, slot1, slot2)
	if slot0.ui_model:getFormList() == nil or next(slot3) == nil then
		slot0:openAdventureFormWindow(true, {
			max_floor = slot2
		})
	else
		if slot0.ui_model:getAdventureBaseData() == nil or slot4.current_id == nil or slot4.id == nil then
			return
		end

		slot5 = nil
		slot5 = (not true or slot4.id) and slot4.current_id

		if slot2 ~= nil then
			slot5 = slot2
		end

		if Config.AdventureMineData.data_floor_data[slot5] then
			print("进入冒险矿井界面,floor = ", slot5)
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.AdventrueMine, {
				is_show_open_effect = true,
				floor_id = slot5
			})
		else
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Adventrue)
		end
	end
end

function AdventureController.requestEnterAdventureMine(slot0, slot1, slot2)
	if slot0.ui_model:getFormList() == nil or next(slot3) == nil then
		slot0:openAdventureFormWindow(true)
	elseif Config.AdventureMineData.data_floor_data[slot1] then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.AdventrueMine, {
			is_show_open_effect = true,
			floor_id = slot1,
			open_setting = slot2
		})
	end
end

function AdventureController.openAdventureMainWindow(slot0, slot1)
	if not slot1 then
		if slot0.adventure_window then
			slot0.adventure_window:close()

			slot0.adventure_window = nil
		end
	else
		if slot0.ui_model:getFormList() == nil or next(slot2) == nil then
			print("跳转进入空岛冒险有误,当前还没有布阵 ============>")

			return
		end

		if slot0.adventure_mine_window then
			slot0:openAdventureMineWindow(false)
		end

		if slot0.ui_model:getAdventureBaseData() == nil then
			return
		end

		if slot0.adventure_window == nil then
			slot0.adventure_window = AdventureMainWindow.New(slot3.id)
		end

		slot0.adventure_window:open()
	end
end

function AdventureController.getAdventureMineWindow(slot0)
	return slot0.adventure_mine_window
end

function AdventureController.openAdventureMineWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.adventure_mine_window then
			slot0.adventure_mine_window:close()

			slot0.adventure_mine_window = nil
		end
	else
		if slot0.ui_model:getFormList() == nil or next(slot3) == nil then
			print("跳转进入冒险矿井界面有误,当前还没有布阵 ============>")

			return
		end

		if slot0.adventure_window then
			slot0:openAdventureMainWindow(false)
		end

		if slot0.ui_model:getAdventureBaseData() == nil then
			return
		end

		if slot0.adventure_mine_window == nil then
			slot0.adventure_mine_window = AdventureMineWindow.New(slot4.id)

			slot0.adventure_mine_window:open(slot2)
		else
			slot0.adventure_mine_window:openRootWnd(slot2)
		end
	end
end

function AdventureController.openAdventureMineFightRecordPanel(slot0, slot1, slot2)
	if not slot1 then
		if slot0.adventure_mine_fight_recrod_panel then
			slot0.adventure_mine_fight_recrod_panel:close()

			slot0.adventure_mine_fight_recrod_panel = nil
		end
	else
		if slot0.adventure_mine_fight_recrod_panel == nil then
			slot0.adventure_mine_fight_recrod_panel = AdventureMineFightRecordPanel.New()
		end

		slot0.adventure_mine_fight_recrod_panel:open(slot2)
	end
end

function AdventureController.openAdventureMineMyInfoPanel(slot0, slot1, slot2)
	if not slot1 then
		if slot0.adventure_mine_my_info_panel then
			slot0.adventure_mine_my_info_panel:close()

			slot0.adventure_mine_my_info_panel = nil
		end
	else
		if slot0.adventure_mine_my_info_panel == nil then
			slot0.adventure_mine_my_info_panel = AdventureMineMyInfoPanel.New()
		end

		slot0.adventure_mine_my_info_panel:open(slot2)
	end
end

function AdventureController.openAdventureMineLayerPanel(slot0, slot1, slot2)
	if not slot1 then
		if slot0.adventure_mine_layer_panel then
			slot0.adventure_mine_layer_panel:close()

			slot0.adventure_mine_layer_panel = nil
		end
	else
		if slot0.adventure_mine_layer_panel == nil then
			slot0.adventure_mine_layer_panel = AdventureMineLayerPanel.New()
		end

		slot0.adventure_mine_layer_panel:open(slot2)
	end
end

function AdventureController.openAdventureMineFightPanel(slot0, slot1, slot2)
	if not slot1 then
		if slot0.adventure_mine_fight_panel then
			slot0.adventure_mine_fight_panel:close()

			slot0.adventure_mine_fight_panel = nil
		end
	else
		if slot0.adventure_mine_fight_panel == nil then
			slot0.adventure_mine_fight_panel = AdventureMineFightPanel.New()
		end

		slot0.adventure_mine_fight_panel:open(slot2)
	end
end

function AdventureController.openAdventureMineFightResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if not slot0.adventure_mine_result_window then
			slot0.adventure_mine_result_window = AdventureMineFightResultPanel.New(slot2.result, BattleConst.Fight_Type.AdventrueMine)
		end

		if slot0.adventure_mine_result_window and slot0.adventure_mine_result_window:isOpen() == false then
			slot0.adventure_mine_result_window:open(slot2, BattleConst.Fight_Type.AdventrueMine)
		end
	elseif slot0.adventure_mine_result_window then
		slot0.adventure_mine_result_window:close()

		slot0.adventure_mine_result_window = nil

		GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	end
end

function AdventureController.openWindowByConfig(slot0, slot1)
	if slot1 == nil or slot1.config == nil then
		return
	end

	if AdventureEvent.isMonster(slot1.config.evt_type) then
		if slot0.ui_model:allHeroIsDie() == true then
			message(TI18N("英雄全部阵亡,本轮冒险已结束!"))

			return
		end

		slot0:openEvtViewByType(true, AdventureEvtChallengeWindow, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.box then
		slot0:openEvtViewByType(true, AdventureEvtBoxWindow, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.finger_guessing then
		slot0:openEvtViewByType(true, AdventureEvtFighterGuessWindow, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.answer then
		slot0:openEvtViewByType(true, AdventureEvtStartWindow, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.npc then
		slot0:openEvtViewByType(true, AdventureEvtNpcView, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.freebox then
		slot0:openEvtViewByType(true, AdventureEvtFreeBoxWindow, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.npc_talk then
		slot0:openEvtViewByType(true, AdventureEvtOtherNpcWindow, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.shop then
		slot0:openEvtViewByType(true, AdventureEvtShopView, slot1)
	elseif slot2.evt_type == AdventureEvent.EventType.effect then
		slot0:send20620(slot1.id, AdventureEvenHandleType.handle, {})
	end
end

function AdventureController.openEvtViewByType(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == false then
		if slot0.adventure_evt_view ~= nil then
			slot0.adventure_evt_view:close()

			slot0.adventure_evt_view = nil
		end
	else
		if slot3 == nil then
			return
		end

		if slot0.adventure_evt_view == nil then
			slot0.adventure_evt_view = (slot2 or AdventureEvtChallengeWindow).New(slot3, slot4, slot5)
		end

		if slot0.adventure_evt_view and slot0.adventure_evt_view:isOpen() == false then
			slot0.adventure_evt_view:open()
		end
	end
end

function AdventureController.openAdventrueShopWindow(slot0, slot1)
	if not slot1 then
		if slot0.shop_window then
			slot0.shop_window:close()

			slot0.shop_window = nil
		end
	else
		if slot0.shop_window == nil then
			slot0.shop_window = AdventureShopWindow.New()
		end

		slot0.shop_window:open()
	end
end

function AdventureController.openAdventureShotKillWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.shot_kill_window then
			slot0.shot_kill_window:close()

			slot0.shot_kill_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.shot_kill_window == nil then
			slot0.shot_kill_window = AdventureShotKillWindow.New()
		end

		slot0.shot_kill_window:open(slot2)
	end
end

function AdventureController.openAdventureUseHPWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.use_hp_window then
			slot0.use_hp_window:close()

			slot0.use_hp_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.use_hp_window == nil then
			slot0.use_hp_window = AdventureUseHPWindow.New()
		end

		slot0.use_hp_window:open(slot2)
	end
end

function AdventureController.send20620(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(20620, {
		room_id = slot1,
		action = slot2,
		ext_list = slot3 or {}
	})
end

function AdventureController.handle20620(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 2 then
		slot0:openEvtViewByType(false)
	end
end

function AdventureController.send20602(slot0)
	slot0:SendProtocal(20602, {})
end

function AdventureController.handle20602(slot0, slot1)
	slot0.ui_model:setRoomList(slot1)
end

function AdventureController.handle20603(slot0, slot1)
	slot0.ui_model:updateRoomList(slot1)
end

function AdventureController.send20604(slot0)
	slot0:SendProtocal(20604, {})
end

function AdventureController.handle20604(slot0, slot1)
	slot0.ui_model:setFightSkipCount(slot1.combat_num)
	slot0.ui_model:updateFormPartner(slot1.partners, slot1.id)

	if NEEDCHANGEENTERSTATUS == 2 and not slot0.first_enter then
		slot0.first_enter = true

		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.drama_scene)
	end
end

function AdventureController.requestSetForm(slot0, slot1, slot2)
	slot0.max_floor = slot2

	slot0:SendProtocal(20605, {
		plist = slot1 or {}
	})
end

function AdventureController.handle20605(slot0, slot1)
	if slot1.code == 1 then
		slot0.ui_model:setLastAdventureNum(slot1.last_num)
		slot0:openAdventureFormWindow(false)
		slot0:requestEnterAdventure(true, slot0.max_floor)

		slot0.max_floor = nil

		slot0:send20642()
	end
end

function AdventureController.send20608(slot0, slot1)
	slot0:SendProtocal(20608, {
		room_id = slot1
	})
end

function AdventureController.handle20608(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.HandleRoomOverEvent, slot1.room_id)
	end
end

function AdventureController.send20600(slot0)
	slot0:SendProtocal(20600, {})
end

function AdventureController.handle20600(slot0, slot1)
	if slot1 then
		slot0.ui_model:setAdventureBaseData(slot1)
	end

	if slot0.must_change_window then
		slot0.must_change_window = false

		slot0:requestEnterAdventure(true)
	end
end

function AdventureController.setMustChangeWindow(slot0)
	slot0.must_change_window = true
end

function AdventureController.send20601(slot0)
	slot0:SendProtocal(20601, {})
end

function AdventureController.handle20601(slot0, slot1)
	if slot1 then
		slot0.ui_model:setBuffData(slot1)
	end
end

function AdventureController.handle20622(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.Update_Evt_Buff_Info, slot1)
	end
end

function AdventureController.handle20621(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.Update_Evt_Guess_Result, slot1)
	end
end

function AdventureController.handle20623(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.Update_Evt_Answer_Info, slot1)
	end
end

function AdventureController.handle20628(slot0, slot1)
	if slot1 then
		message(slot1.msg)
		delayOnce(function ()
			uv0:openEvtViewByType(false)
			uv0:showGetItemTips(uv1.items)
		end, 1)
	end
end

function AdventureController.handle20630(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.Update_Evt_Box_Result_Info, slot1)
	end
end

function AdventureController.handle20627(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.Update_Evt_Npc_Info, slot1)
	end
end

function AdventureController.handle20631(slot0, slot1)
	if slot1.type == 1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.Update_Evt_Shop_Info, slot1)
	elseif slot1.type == 2 then
		slot0:openAdventureEvtShopView(true, slot1.list)
	end
end

function AdventureController.openAdventureEvtShopView(slot0, slot1, slot2)
	if not slot1 then
		if slot0.shop_evt_window then
			slot0.shop_evt_window:close()

			slot0.shop_evt_window = nil
		end
	else
		if slot0.shop_evt_window == nil then
			slot0.shop_evt_window = AdventureEvtShopView.New()
		end

		slot0.shop_evt_window:open(slot2)
	end
end

function AdventureController.showGetItemTips(slot0, slot1, slot2, slot3)
	if slot1 then
		slot4 = ""

		for slot8, slot9 in ipairs(slot1) do
			if slot4 ~= "" then
				slot4 = slot4 .. "，"
			end

			slot10 = Config.ItemData.data_get_data(slot9.bid)
			slot4 = (not Config.ItemData.data_assets_id2label[slot9.bid] or string.format("%s<img src=%s scale=0.4 visible=true /><div fontcolor=#289b14>x%s</div>", slot4, PathTool.getItemRes(slot10.icon), slot9.num)) and string.format("%s<div fontcolor=%s>%s</div><div fontcolor=#289b14>x%s</div>", slot4, tranformC3bTostr(BackPackConst.quality_color_id[slot10.quality]), slot10.name, slot9.num)
		end

		playOtherSound("c_get")
		GlobalMessageMgr:getInstance():showMoveVertical((slot2 ~= true or ((slot3 or 0) ~= 0 or string.format(TI18N("竟然有人能跟我猜成平手，这%s拿去"), slot4)) and (slot3 ~= 1 or string.format(TI18N("你赢了，这%s归你了"), slot4)) and string.format(TI18N("你输了，这%s还给你"), slot4)) and string.format(TI18N("获取%s"), slot4))
	end
end

function AdventureController.openAdventureFloorResultWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.floor_result_window then
			slot0.floor_result_window:close()

			slot0.floor_result_window = nil
		end
	else
		if slot2 == nil or slot2.items_list == nil then
			return
		end

		if slot0.floor_result_window == nil then
			slot0.floor_result_window = AdventureFloorResultWindow.New()
		end

		slot0.floor_result_window:open(slot2)
	end
end

function AdventureController.handle20606(slot0, slot1)
	slot0:openAdventureFloorResultWindow(true, slot1)
end

function AdventureController.send20607(slot0, slot1, slot2)
	slot0:SendProtocal(20607, {
		skill_id = slot1,
		val = slot2
	})
end

function AdventureController.handle20607(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openAdventureShotKillWindow(false)
		slot0:openAdventureUseHPWindow(false)
	end
end

function AdventureController.send20609(slot0)
	slot0:SendProtocal(20609, {})
end

function AdventureController.handle20609(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.UpdateSkillInfo, slot1.skill_list)
	end
end

function AdventureController.send20636(slot0, slot1)
	slot0:SendProtocal(20636, {
		num = slot1
	})
end

function AdventureController.handle20636(slot0, slot1)
	message(slot1.msg)
end

function AdventureController.requestSelectPartner(slot0, slot1)
	slot0:SendProtocal(20610, {
		id = slot1
	})
end

function AdventureController.handle20610(slot0, slot1)
	if slot1.code == 1 then
		slot0.ui_model:updateSelectPartnerID(slot1.id)
	end
end

function AdventureController.handle20624(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateMonsterHP, slot1.hp_per)
end

function AdventureController.send20611(slot0)
	slot0:SendProtocal(20611, {})
end

function AdventureController.handle20611(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateShotKillInfo, slot1.room_list)
end

function AdventureController.requestShopTotal(slot0)
	slot0:SendProtocal(20632, {})
end

function AdventureController.handle20632(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateShopTotalEvent, slot1.list)
end

function AdventureController.requestBuyShopItem(slot0, slot1)
	slot0:SendProtocal(20633, {
		id = slot1
	})
end

function AdventureController.handle20633(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(AdventureEvent.UpdateShopItemEvent, slot1.id)
	end
end

function AdventureController.send20634(slot0)
	slot0:SendProtocal(20634, {})
end

function AdventureController.handle20634(slot0, slot1)
	slot0.ui_model:setAdventureBoxStatus(slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.UpdateBoxTeskEvent, slot1)
end

function AdventureController.send20635(slot0, slot1)
	slot0:SendProtocal(20635, {
		id = slot1
	})
end

function AdventureController.handle20635(slot0, slot1)
	message(slot1.msg)
end

function AdventureController.openAdventureBoxRewardView(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.box_reward_window == nil then
			slot0.box_reward_window = AdventureBoxRewardWindow.New(slot2)
		end

		slot0.box_reward_window:open()
	elseif slot0.box_reward_window then
		slot0.box_reward_window:close()

		slot0.box_reward_window = nil
	end
end

function AdventureController.handle20625(slot0, slot1)
	GlobalEvent:getInstance():Fire(AdventureEvent.GetSkillForEffectAction, slot1.id, slot1.skill_id)
end

function AdventureController.handle20612(slot0, slot1)
	if MainuiController:getInstance():getUIFightType() == MainuiConst.ui_fight_type.sky_scene or slot2 == MainuiConst.ui_fight_type.adventrueMine then
		if BattleController:getInstance():isInFight() then
			if slot0.battle_exit_event == nil then
				slot0.battle_exit_event = GlobalEvent:getInstance():Bind(SceneEvent.EXIT_FIGHT, function (slot0)
					if slot0 == BattleConst.Fight_Type.Adventrue or slot0 == BattleConst.Fight_Type.AdventrueMine then
						uv0:showAdventureReset()
					end
				end)
			end
		else
			slot0:showAdventureReset()
		end
	end
end

function AdventureController.showAdventureReset(slot0)
	if slot0.battle_exit_event then
		GlobalEvent:getInstance():UnBind(slot0.battle_exit_event)

		slot0.battle_exit_event = nil
	end

	MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
	delayOnce(function ()
		CommonAlert.show(TI18N("空岛冒险已重置，是否重新进入？"), TI18N("确定"), function ()
			uv0:requestEnterAdventure()
		end, TI18N("取消"))
	end, 0.2)
end
