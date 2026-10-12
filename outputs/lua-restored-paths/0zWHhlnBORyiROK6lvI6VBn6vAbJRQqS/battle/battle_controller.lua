BattleController = BattleController or BaseClass(BaseController)
BattleTypeConf = {
	TYPE_ROLE = 1,
	TYPE_ENEMY = -1,
	BATTLE_EXIT = 1
}
BattleObjectType = {
	Elfin = 5,
	Unit = 3,
	Role = 1,
	Pet = 2,
	Hallows = 4
}
BattleEffectPlayType = {
	ENEMY_SCENE = 4,
	SCENE = 2,
	ROLE = 1,
	TARGET = 5,
	ROLE_SCENE = 3
}
BattleGroupTypeConf = {
	TYPE_GROUP_ROLE = 1,
	TYPE_GROUP_ENEMY = 2
}
BattleTargetTypeConf = {
	ALIVE_SELF = 5,
	ALIVE_ENEMY = 1,
	ALIVE_EXEPT_SELF = 6,
	DEAD_ALLY = 3,
	DEAD_ENEMY = 4,
	ALIVE_ALLY = 2,
	ALIVE_ALLY_EXCEPT_SELF = 7
}
BattleSkillTypeConf = {
	PASSIVE_SKILL = "passive_skill",
	ACTIVE_SKILL = "active_skill",
	EQM_PASSIVE_SKILL = "eqm_passive_skill"
}
BattleRoleExtendType = {
	RESONATE = 10,
	CRYSTAL = 11,
	FASHION = 5
}

function BattleController.config(slot0)
	slot0.model = BattleModel.New()
	slot0.battle_hook_model = BattleHookModel.New()
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_watch_replay = false
	slot0.is_watch_witness = false
	slot0.init_fight_status = false
	slot0.circle_round_data = nil
	slot0.is_normal_battle = false
	slot0.cur_fight_type = 0
	slot0.is_battle_start = false
	slot0.is_pk_battle = false
	slot0.extend_fight_type = BattleConst.Fight_Type.Darma
	slot0.finish_fail_view_list = {}
	slot0.finish_result_view_list = {}
	slot0.fighting_type_list = {}
	slot0.is_unlock_chapter = false
	slot0.is_drama_result = false
	slot0.sum_lev = 0
	slot0.enemy_lev = 0

	slot0.model:initConfig()
	slot0.battle_hook_model:initConfig()
end

function BattleController.getModel(slot0)
	return slot0.model
end

function BattleController.getNormalModel(slot0)
	return slot0.battle_hook_model
end

function BattleController.isInFight(slot0)
	if slot0.model == nil then
		return false
	elseif not slot0.is_normal_battle then
		return slot0.model:isInFight()
	else
		return slot0.battle_hook_model:isInFight()
	end
end

function BattleController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.main_vo = RoleController:getInstance():getRoleVo()
		end)
	end
end

function BattleController.registerProtocals(slot0)
	slot0:RegisterProtocal(20027, "scInitFightStart")
	slot0:RegisterProtocal(20002, "scRoundFightStart")
	slot0:RegisterProtocal(20004, "scUseSkillData")
	slot0:RegisterProtocal(20006, "scFightEnd")
	slot0:RegisterProtocal(20008, "scFightExit")
	slot0:RegisterProtocal(20009, "scSkipFirstTeam")
	slot0:RegisterProtocal(20013, "scReBattleFight")
	slot0:RegisterProtocal(20014, "scBattlePk")
	slot0:RegisterProtocal(20015, "scBattlePkRe")
	slot0:RegisterProtocal(20016, "scBattlePkTwice")
	slot0:RegisterProtocal(20020, "scRoundNextFight")
	slot0:RegisterProtocal(20022, "scFightSpeed")
	slot0:RegisterProtocal(20033, "handle20033")
	slot0:RegisterProtocal(20034, "handle20034")
	slot0:RegisterProtocal(20036, "handle20036")
	slot0:RegisterProtocal(20060, "handle20060")
	slot0:RegisterProtocal(20061, "handle20061")
	slot0:RegisterProtocal(20062, "handle20062")
	slot0:RegisterProtocal(10957, "handle10957")
end

function BattleController.handle10957(slot0)
	slot2 = string.format("[fight_type:%s]", slot0.cur_fight_type)

	if BaseView and BaseView.winMap and #BaseView.winMap > 0 then
		for slot6, slot7 in ipairs(BaseView.winMap) do
			slot2 = slot2 .. slot1(",[%s]", slot7.layout_name)
		end
	end

	slot0:SendProtocal(10958, {
		combat_msg = slot2
	})
end

function BattleController.csReadyFightStart(slot0)
	slot0:SendProtocal(20001, {})
end

function BattleController.scRoundFightStart(slot0, slot1)
	if PLATFORM_NAME ~= "demo" and PLATFORM_NAME == "release" then
		-- Nothing
	end

	if slot1 then
		slot0.model:playRoundStart(slot1)
	end
end

function BattleController.scUseSkillData(slot0, slot1)
	if PLATFORM_NAME ~= "demo" and PLATFORM_NAME == "release" then
		-- Nothing
	end

	slot0.model:setUseSkillStatus(false)
	slot0.model:addRoundData(slot1)
end

function BattleController.csSkillPlayEnd(slot0)
	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
		print("正常播报,通知服务器播报完成")
	end

	slot0:SendProtocal(20005, {})
end

function BattleController.scFightEnd(slot0, slot1)
	if slot1 then
		if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
			print("服务器通知战斗结束", slot1.combat_type, os.time())
		end

		slot2 = false

		if slot1.combat_type > 1000 then
			slot1.combat_type = slot1.combat_type - 1000
			slot2 = true
		end

		slot0.fighting_type_list[slot1.combat_type] = nil

		slot0.model:showWin(slot1, slot2)

		if slot1.combat_type == BattleConst.Fight_Type.Adventrue then
			AdventureController:getInstance():getUiModel():setAdventureFightReturnTag(true)
		end

		if slot1.combat_type == BattleConst.Fight_Type.Endless then
			PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Endless_trail)
			Endless_trailController:getInstance():sendRankInfo()
		end
	end
end

function BattleController.csFightExit(slot0)
	slot0:SendProtocal(20008, {})
end

function BattleController.scFightExit(slot0, slot1)
	message(slot1.msg)
end

function BattleController.csSkipFirstTeam(slot0)
	slot0:SendProtocal(20009, {})
end

function BattleController.scSkipFirstTeam(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function BattleController.confirmBattlePk(slot0, slot1)
	if slot1 == nil and next(slot1.list) == nil then
		return
	end

	slot2 = slot1.list[1].data

	if Config.CombatTypeData.data_const.pk_agree_timeout.val <= GameNet:getInstance():getTime() - slot1.list[1].time then
		message(TI18N("请求已超时"))

		return
	end

	if slot2 then
		slot5, slot6, slot7, slot8 = slot1:getSridByData(slot2)

		CommonAlert.show(string.format(TI18N("玩家[%s]对你发出了切磋请求，是否同意？\n（同意后对方将与您的镜像进行战斗）"), transformNameByServ(slot7 or "", slot6)), TI18N("同意"), function ()
			uv0:csBattlePkRe(true, {
				target_srv_id = uv1,
				target_id = uv2
			})
		end, TI18N("拒绝"), function ()
			uv0:csBattlePkRe(false, {
				target_srv_id = uv1,
				target_id = uv2
			})
		end, CommonAlert.type.rich, nil, {
			no_clear = true
		})
	end
end

function BattleController.csBattlePk(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(20014, {
		target_id = slot1,
		target_srv_id = slot2,
		is_province = slot3
	})
end

function BattleController.scBattlePk(slot0, slot1)
	if slot1 then
		ChatController:getInstance():closeChatUseAction()
		FriendController:getInstance():openFriendCheckPanel(false)
		message(slot1.msg)
	end
end

function BattleController.csBattlePkRe(slot0, slot1, slot2)
	slot0:SendProtocal(20015, {
		target_id = slot2.target_id,
		target_srv_id = slot2.target_srv_id,
		is_agree = slot1 and TRUE or FALSE
	})
end

function BattleController.scBattlePkRe(slot0, slot1)
	message(slot1.msg)
end

function BattleController.scBattlePkTwice(slot0, slot1)
	if slot1 and not slot0:isInFight() then
		CommonAlert.show(string.format(TI18N("玩家<div fontcolor=#0x249015>%s</div>同意了你的切磋请求,点击”立即切磋“立即进入切磋战斗？"), slot1.target_name or ""), TI18N("立即切磋"), function ()
			uv0:csBattlePkTwiceConfirm(true, {
				target_srv_id = uv1.target_srv_id,
				target_id = uv1.target_id
			})
		end, TI18N("改主意了"), function ()
			uv0:csBattlePkTwiceConfirm(false, {
				target_srv_id = uv1.target_srv_id,
				target_id = uv1.target_id
			})
		end, CommonAlert.type.rich, nil, {
			timer = 10,
			timer_for = true,
			no_clear = true,
			timer_auto_close = TRUE,
			pk_status = TRUE
		})
	end
end

function BattleController.csBattlePkTwiceConfirm(slot0, slot1, slot2)
	slot0:SendProtocal(20016, {
		target_id = slot2.target_id,
		target_srv_id = slot2.target_srv_id,
		is_agree = slot1 and TRUE or FALSE
	})
end

function BattleController.handle20033(slot0, slot1)
	if not slot1.combat_type then
		slot1.combat_type = BattleConst.Fight_Type.PK
	end

	if not slot1.show_panel_type then
		slot1.show_panel_type = 1
	end

	slot0.model:showWin(slot1)
	slot0.model:setFinishData(slot1)
end

function BattleController.on20034(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(20034, {
		replay_id = slot1,
		channel = slot2,
		target_name = slot3,
		share_type = slot4
	})
end

function BattleController.handle20034(slot0, slot1)
	message(slot1.msg)
end

function BattleController.scReBattleFight(slot0, slot1)
	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
		print("scReBattleFight战斗重连", slot1, slot1.combat_type, os.time())
	end

	if slot1 then
		slot0.fighting_type_list[slot1.combat_type] = true

		if BattleConst.getUIFightByFightType(slot1.combat_type) == MainuiController:getInstance():getUIFightType() then
			slot0.model:setReconnectStatus(true)
			slot0:setInitStatus(false)
			slot0.model:createBattleScence(slot1)
		end
	end
end

function BattleController.csRoundFightEnd(slot0)
	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
		print("回合播报,通知服务器播报完成")
	end

	slot0:SendProtocal(20019, {})
end

function BattleController.scRoundNextFight(slot0, slot1)
	if slot1 and slot0.model:getBattleScene() then
		slot0.model:setNextMonStatus(true)
		slot0.model:upDateNextMon(slot1)
	end
end

function BattleController.csLoadMapFinish(slot0)
	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
		print("csLoadMapFinish地图准备完成")
	end

	slot0:SendProtocal(20026, {})
end

function BattleController.scInitFightStart(slot0, slot1)
	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
		print("scInitFightStart战斗初始化", slot1, slot1.combat_type, os.time())
	end

	if slot1 then
		slot0.lase_fight_data = slot1
		slot0.fighting_type_list[slot1.combat_type] = true

		slot0:setInitStatus(true)
		slot0:setCurFightType(slot1.combat_type)
		slot0.battle_hook_model:chanegBattle(slot1)
	end
end

function BattleController.setCurFightInfo(slot0, slot1)
	slot0.fighting_type_list = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.fighting_type_list[slot6.combat_type] = true
	end
end

function BattleController.getCurFightInfo(slot0, slot1)
	if slot0:getCurFightType() ~= BattleConst.Fight_Type.GodBattle and slot1 ~= BattleConst.Fight_Type.Darma then
		return false
	end

	return slot0.fighting_type_list and slot0.fighting_type_list[slot1]
end

function BattleController.csReBattleFightReady(slot0)
	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
		print("csReBattleFightReady重连准备好了")
	end

	slot0:SendProtocal(20028, {})
end

function BattleController.csFightSpeed(slot0, slot1)
	slot0:SendProtocal(20022, {
		speed = slot1
	})
end

function BattleController.scFightSpeed(slot0, slot1)
	message(slot1.msg)
end

function BattleController.csEnterBackGround(slot0, slot1)
	if not RoleController or not RoleController:getInstance():getRoleVo() then
		return
	end

	slot0:SendProtocal(10397, {
		status = slot1 and TRUE or FALSE
	})
end

function BattleController.setWatchReplayStatus(slot0, slot1)
	slot0.is_watch_replay = slot1
end

function BattleController.getWatchReplayStatus(slot0)
	return slot0.is_watch_replay
end

function BattleController.setIsHeroTestWar(slot0, slot1)
	slot0.is_hero_test = slot1
end

function BattleController.getIsHeroTestWar(slot0)
	return slot0.is_hero_test
end

function BattleController.csRecordBattle(slot0, slot1, slot2)
	if slot2 == nil then
		if RoleController:getInstance():getRoleVo() == nil then
			return
		end

		slot2 = slot3.srv_id
	end

	slot0:SendProtocal(20036, {
		replay_id = slot1,
		replay_srv_id = slot2
	})
end

function BattleController.handle20036(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		ChatController:getInstance():closeChatUseAction()
		slot0:setWatchReplayStatus(true)
	end
end

function BattleController.setWatchWitnessBattleStatus(slot0, slot1)
	slot0.is_watch_witness = slot1
end

function BattleController.getWatchWitnessBattleStatus(slot0)
	return slot0.is_watch_witness
end

function BattleController.openBattleScene(slot0, slot1)
	slot0.model:createBattleScence(slot1)
end

function BattleController.getActTime(slot0, slot1)
	slot2 = 1

	if Config.BattleActData.data_get_act_data and Config.BattleActData.data_get_act_data[slot1] then
		slot2 = Config.BattleActData.data_get_act_data[slot1].val / 100
	end

	return slot2
end

function BattleController.openFinishView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot0.fighting_type_list[slot2] = nil

		if slot0.finish_result_view_list[slot2] then
			slot0.finish_result_view_list[slot2]:close()

			slot0.finish_result_view_list[slot2] = nil
		end

		if GuideController:getInstance():isInGuide() then
			slot0.model:result(slot3)

			return
		end

		if not slot0.is_unlock_chapter then
			if slot2 == BattleConst.Fight_Type.WorldBoss then
				-- Nothing
			elseif slot2 == BattleConst.Fight_Type.PK then
				slot0.finish_result_view_list[slot2] = BattlePkResultView.New(slot3.result, BattleConst.Fight_Type.PK)

				slot0.finish_result_view_list[slot2]:open(slot3)
			elseif slot2 == BattleConst.Fight_Type.Arena then
				ArenaController:getInstance():openLoopResultWindow(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.GuildDun then
				GuildbossController:getInstance():openGuildbossResultWindow(true, slot3, slot2)
			elseif slot2 == BattleConst.Fight_Type.StarTower then
				StartowerController:getInstance():openResultWindow(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.SingleBoss then
				-- Nothing
			elseif slot2 == BattleConst.Fight_Type.Darma and slot3 and slot3.result == 1 then
				LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
				BattleResultMgr:getInstance():setWaitShowPanel(true)
				report_mission_completed(slot2, "")

				slot0.finish_result_view_list[slot2] = BattleMvpView.New(slot3)

				slot0.finish_result_view_list[slot2]:open(slot3)
			elseif slot2 == BattleConst.Fight_Type.LadderWar then
				LadderController:getInstance():openLadderBattleResultWindow(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.HeavenWar and slot3.result == 1 then
				HeavenController:getInstance():openHeavenBattleWinView(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.CrossArenaWar then
				CrossarenaController:getInstance():openCrossarenaResultWindow(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.AdventrueMine then
				AdventureController:getInstance():openAdventureMineFightResultPanel(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.TermBeginsBoss then
				ActiontermbeginsController:getInstance():openActiontermbeginsFightResultPanel(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.Arean_Team then
				ArenateamController:getInstance():openArenateamFightResultPanel(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.PlanesWar and slot3.result == 1 then
				GuildbossController:getInstance():openGuildbossResultWindow(true, slot3, BattleConst.Fight_Type.PlanesWar)
				slot0.model:result(slot3)
			elseif slot2 == BattleConst.Fight_Type.YearMonsterWar and slot3.result == 1 and slot3.type ~= ActionyearmonsterConstants.Evt_Type.Monster then
				ActionyearmonsterController:getInstance():openActionyearmonsterResultPanel(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.WhiteDayWar and slot3.result == 1 then
				ActionyearmonsterController:getInstance():openActionyearmonsterResultPanel(true, slot3, slot2)

				slot3.combat_type = slot2

				slot0.model:result(slot3)
			elseif slot2 == BattleConst.Fight_Type.AreanManyPeople then
				ArenaManyPeopleController:getInstance():openArenaManyPeopleFightResultPanel(true, slot3)
			elseif slot2 == BattleConst.Fight_Type.PractiseTower then
				if slot3.result == 1 then
					report_mission_completed(slot2, "")
				else
					report_mission_failed(slot2)
				end

				PractisetowerController:getInstance():openResultWindow(true, slot3)
			elseif not slot0.finish_result_view_list[slot2] then
				if slot3.result == 1 then
					report_mission_completed(slot2, "")
					LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
					BattleResultMgr:getInstance():setWaitShowPanel(true)

					slot0.finish_result_view_list[slot2] = BattleResultView.New(slot3.result, slot2)

					slot0.finish_result_view_list[slot2]:open(slot3, slot2)
				else
					report_mission_failed(slot2)
					slot0:openFailFinishView(true, slot2, slot3.result, slot3)
				end
			end
		elseif MainuiController:getInstance():checkIsInDramaUIFight() then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Darma)
		end
	elseif slot0.finish_result_view_list[slot2] then
		slot0.finish_result_view_list[slot2]:close()

		slot0.finish_result_view_list[slot2] = nil
	end
end

function BattleController.openBattleHarmInfoView(slot0, slot1, slot2, slot3)
	slot0:openBattleResultShowInfoWindow(slot1, slot2, slot3)
end

function BattleController.openBattleBuffInfoView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.buff_info_view == nil then
			slot0.buff_info_view = BattleBuffInfoView.New()
		end

		if slot0.buff_info_view:isOpen() == false then
			slot0.buff_info_view:open(slot2, slot3)
		end
	elseif slot0.buff_info_view then
		slot0.buff_info_view:close()

		slot0.buff_info_view = nil
	end
end

function BattleController.openBattleBuffListView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.buff_list_view == nil then
			slot0.buff_list_view = BattleBuffListView.New()
		end

		if slot0.buff_list_view:isOpen() == false then
			slot0.buff_list_view:open(slot2, slot3, slot4)
		end
	elseif slot0.buff_list_view then
		slot0.buff_list_view:close()

		slot0.buff_list_view = nil
	end
end

function BattleController.updateBattleBuffListView(slot0, slot1, slot2, slot3)
	if slot0.buff_list_view and slot0.buff_list_view:checkIsChosedBuffList(slot2, slot3) then
		slot0.buff_list_view:setData(slot1)
	end
end

function BattleController.openFailFinishView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if GuideController:getInstance():isInGuide() then
			slot0.model:result(slot4)

			return
		end

		if not slot0.is_unlock_chapter then
			if not slot0.finish_fail_view_list[slot2] then
				LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
				BattleResultMgr:getInstance():setWaitShowPanel(true)

				if BattleFailView.New(slot2, slot3, slot4) then
					slot5:open()
				end

				slot0.finish_fail_view_list[slot2] = slot5
			end
		elseif MainuiController:getInstance():checkIsInDramaUIFight() then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Darma)
		end
	elseif slot0.finish_fail_view_list[slot2] then
		slot0.finish_fail_view_list[slot2]:close()

		slot0.finish_fail_view_list[slot2] = nil
	end
end

function BattleController.openBattleCampView(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.battle_camp_view == nil then
			slot0.battle_camp_view = BattleCampView.New()
		end

		if slot0.battle_camp_view:isOpen() == false then
			slot0.battle_camp_view:open(slot2)
		end
	elseif slot0.battle_camp_view then
		slot0.battle_camp_view:close()

		slot0.battle_camp_view = nil
	end
end

function BattleController.getFinishView(slot0, slot1)
	if slot0.finish_result_view_list then
		return slot0.finish_result_view_list[slot1]
	end
end

function BattleController.closeBattleResultWindow(slot0)
	for slot4, slot5 in pairs(slot0.finish_result_view_list) do
		slot5:close()
	end

	slot0.finish_result_view_list = {}

	for slot4, slot5 in pairs(slot0.finish_fail_view_list) do
		slot5:close()
	end

	slot0.finish_fail_view_list = {}
end

function BattleController.setInitStatus(slot0, slot1)
	slot0.init_fight_status = slot1
end

function BattleController.getInitStatus(slot0)
	return slot0.init_fight_status
end

function BattleController.openBattleView(slot0, slot1, slot2)
	if slot1 then
		slot0:createMap(nil, BattleConst.Fight_Type.Darma)
	else
		if slot0.resources_load then
			slot0.resources_load:DeleteMe()

			slot0.resources_load = nil
		end

		slot0:setCurFightType(0)
		slot0:send20060(0)

		slot0.circle_round_data = nil

		slot0:clear(true)
	end
end

function BattleController.send20060(slot0, slot1)
	slot0:SendProtocal(20060, {
		combat_type = slot1
	})
end

function BattleController.handle20060(slot0, slot1)
	if PLATFORM == cc.PLATFORM_OS_WINDOWS then
		print("recv_20060====", slot1.combat_type)
	end

	slot0:setCurFightType(slot1.combat_type)

	if slot1.combat_type == BattleConst.Fight_Type.Darma and MainuiController:getInstance():checkIsInDramaUIFight() then
		slot0:openBattleView(true, BattleConst.Fight_Type.Darma)
	end

	GlobalEvent:getInstance():Fire(BattleEvent.COMBAT_TYPE_BACK, slot1.combat_type, slot1.type)
end

function BattleController.getCurFightType(slot0)
	if slot0.cur_fight_type then
		return slot0.cur_fight_type
	end
end

function BattleController.setCurFightType(slot0, slot1)
	slot0.cur_fight_type = slot1
end

function BattleController.getExtendFightType(slot0)
	if slot0.extend_fight_type then
		return slot0.extend_fight_type
	end
end

function BattleController.setUnlockChapterStatus(slot0, slot1)
	slot0.is_unlock_chapter = slot1
end

function BattleController.getUnlockChapterStatus(slot0, slot1)
	return slot0.is_unlock_chapter
end

function BattleController.setExtendFightType(slot0, slot1)
	slot0.extend_fight_type = slot1
end

function BattleController.handle20061(slot0, slot1)
	if slot1 then
		slot0:setCircleData(slot1)

		if slot0.battle_scene and MainuiController:getInstance():checkIsInDramaUIFight() then
			slot0.battle_scene:updateNormalBattle(slot1)
		end
	end
end

function BattleController.send20062(slot0)
	slot0:SendProtocal(20062, {})
end

function BattleController.handle20062(slot0, slot1)
	message(slot1.msg)
end

function BattleController.openNormalBattle(slot0, slot1)
	slot0.model:clearAllObject()
	slot0.battle_hook_model:clearRole()

	if slot0.battle_hook_model and slot1 and not slot0.battle_hook_model:getInitNormalStatus() then
		slot0.battle_hook_model:createBattleScence(slot1)
	else
		slot0.battle_hook_model:openNormalBattle(slot1, true)
	end
end

function BattleController.getCircleData(slot0)
	if slot0.circle_round_data then
		return slot0.circle_round_data
	end
end

function BattleController.setCircleData(slot0, slot1)
	slot0.circle_round_data = slot1
end

function BattleController.getDramaStatus(slot0)
	if slot0.is_drama_result then
		return slot0.is_drama_result
	end
end

function BattleController.setSumLev(slot0, slot1)
	slot0.sum_lev = slot1
end

function BattleController.getSumlev(slot0)
	if slot0.sum_lev then
		return slot0.sum_lev
	end
end

function BattleController.setEnemySumLev(slot0, slot1)
	slot0.enemy_lev = slot1
end

function BattleController.getEnemySumlev(slot0)
	if slot0.enemy_lev then
		return slot0.enemy_lev
	end
end

function BattleController.setDramaStatus(slot0, slot1)
	slot0.is_drama_result = slot1
end

function BattleController.getIsClickStatus(slot0)
	return slot0:getWatchReplayStatus() or slot0.is_pk_battle or slot0:getIsHeroTestWar()
end

function BattleController.setPkStatus(slot0, slot1)
	slot0.is_pk_battle = slot1
end

function BattleController.createMap(slot0, slot1, slot2, slot3)
	slot2 = slot2 or slot1.combat_type

	if slot0.fight_type and slot0.fight_type == slot2 and slot0.battle_scene then
		if slot1 ~= nil then
			slot0.model:enterBattle(slot1)
		end

		return
	end

	slot0:setPkStatus(false)
	slot0:setIsHeroTestWar(false)

	if slot2 == BattleConst.Fight_Type.PK then
		slot0:setPkStatus(true)
	elseif slot2 == BattleConst.Fight_Type.HeroTestWar then
		slot0:setIsHeroTestWar(true)
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	slot0:clear()

	slot0.fight_type = slot2

	if not slot0.resources_load then
		slot0.resources_load = ResourcesLoad.New(true)

		if slot0.resources_load then
			slot0.res_list = {
				{
					path = PathTool.getPlistImgForDownLoad("battle", "battle"),
					type = ResourcesType.plist
				}
			}

			slot0.resources_load:addAllList(slot0.res_list, function ()
				if uv0.cur_fight_type == uv0.fight_type then
					if not uv0.battle_scene then
						uv0.battle_scene = BattleSceneNewView.new()

						ViewManager:getInstance():addToLayerByTag(uv0.battle_scene, ViewMgrTag.BATTLE_LAYER_TAG)
					end

					if not tolua.isnull(uv0.battle_scene) then
						uv0.battle_scene:init(uv0.fight_type)

						if uv1 ~= nil then
							uv0.model:enterBattle(uv1)
						end
					end
				end
			end)
		end
	end
end

function BattleController.clear(slot0, slot1)
	slot0.model:clear(true)
	slot0.battle_hook_model:battleclear()

	if slot0.battle_scene and not tolua.isnull(slot0.battle_scene) and ((slot0:getExtendFightType() ~= BattleConst.Fight_Type.Darma or slot0.cur_fight_type == 0) == true or slot1 == true) then
		if slot0.resources_load then
			slot0.resources_load:DeleteMe()

			slot0.resources_load = nil
		end

		slot0.battle_scene:cleanFightView()
		slot0.battle_scene:removeAllChildren()
		slot0.battle_scene:removeFromParent()

		slot0.battle_scene = nil
		slot0.fight_type = nil
	end
end

function BattleController.curBattleResId(slot0, slot1)
	slot2 = 10001
	slot3 = 0

	if slot1 == BattleConst.Fight_Type.Darma then
		if BattleDramaController:getInstance():getModel():getDramaData() and Config.DungeonData.data_drama_world_info and Config.DungeonData.data_drama_world_info[slot4.mode] and Config.DungeonData.data_drama_world_info[slot4.mode][slot4.chapter_id] then
			slot3 = Config.BattleBgData.data_info2[slot1][Config.DungeonData.data_drama_world_info[slot4.mode][slot4.chapter_id].map_id].is_single_bg
		end
	else
		if Config.BattleBgData.data_info[slot1] == nil then
			slot4 = Config.BattleBgData.data_info[BattleConst.Fight_Type.Default]
		end

		if slot4 == nil then
			slot2 = 10001
		else
			slot2 = slot4.bid
			slot3 = slot4.is_single_bg
		end

		if slot1 == BattleConst.Fight_Type.Adventrue and AdventureController:getInstance():getUiModel():getAdventureBaseData() and Config.AdventureData.data_battle_res[slot5.id] and slot6.battle_res_id then
			slot2 = slot6.battle_res_id
		end
	end

	return slot2, slot3
end

function BattleController.getCtrlBattleScene(slot0)
	if slot0.battle_scene and not tolua.isnull(slot0.battle_scene) then
		return slot0.battle_scene
	end
end

function BattleController.handleBattleSceneStatus(slot0, slot1)
	if slot0.battle_scene and not tolua.isnull(slot0.battle_scene) then
		slot0.battle_scene:handleBattleSceneStatus(slot1)
	end
end

function BattleController.getMapLayer(slot0)
	if not tolua.isnull(slot0.battle_scene) then
		return slot0.battle_scene:getMapLayer()
	end
end

function BattleController.setIsNormaBattle(slot0, slot1)
	slot0.is_normal_battle = slot1
end

function BattleController.getIsNoramalBattle(slot0)
	return slot0.is_normal_battle
end

function BattleController.setBattleStartStatus(slot0, slot1)
	slot0.is_battle_start = slot1
end

function BattleController.getBattleStatus(slot0)
	return slot0.is_battle_start
end

function BattleController.getIsSameBattleType(slot0, slot1)
	return slot1 == slot0.model:getBattleType()
end

function BattleController.DeleteMe(slot0)
	if slot0.enter_backgroud_event then
		GlobalEvent:getInstance():UnBind(slot0.enter_backgroud_event)

		slot0.enter_backgroud_event = nil
	end

	if slot0.enter_foreground_event then
		GlobalEvent:getInstance():UnBind(slot0.enter_foreground_event)

		slot0.enter_foreground_event = nil
	end

	if slot0.vip_open_event then
		GlobalEvent:getInstance():UnBind(slot0.vip_open_event)

		slot0.vip_open_event = nil
	end

	if slot0.disconnect_view_event then
		GlobalEvent:getInstance():UnBind(slot0.disconnect_view_event)

		slot0.disconnect_view_event = nil
	end

	if slot0.disconnect_event then
		GlobalEvent:getInstance():UnBind(slot0.disconnect_event)

		slot0.disconnect_event = nil
	end

	slot0.circle_round_data = nil
end

function BattleController.playResourceCollect(slot0, slot1, slot2)
	if tolua.isnull(slot0.battle_scene) then
		return
	end

	if slot0.battle_scene.playResourceCollect then
		slot0.battle_scene:playResourceCollect(slot1, slot2)
	end
end

function BattleController.openBattleResultShowInfoWindow(slot0, slot1, slot2, slot3)
	if slot1 == true and slot2 then
		if slot0.showinfo_window == nil then
			slot0.showinfo_window = BattleResultShowInfoWindow.New()
		end

		slot0.showinfo_window:open(slot2, slot3)
	elseif slot0.showinfo_window then
		slot0.showinfo_window:close()

		slot0.showinfo_window = nil
	end
end
