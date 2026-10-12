HeroExpeditController = HeroExpeditController or BaseClass(BaseController)

function HeroExpeditController.config(slot0)
	slot0.model = HeroExpeditModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function HeroExpeditController.getModel(slot0)
	return slot0.model
end

function HeroExpeditController.registerEvents(slot0)
	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:openHeroExpeditView(false)
			uv0:openHeroExpeditLevelView(false)
			uv0:openEmpolyPanelView(false)
			uv0:openBrowsePanelView(false)
		end)
	end

	if slot0.expedit_updata_event == nil then
		slot0.expedit_updata_event = GlobalEvent:getInstance():Bind(BattleEvent.CLOSE_RESULT_VIEW, function (slot0)
			if slot0 == BattleConst.Fight_Type.ExpeditFight and uv0.need_reset_event == true then
				uv0:showExpeditReset()

				uv0.need_reset_event = false
			end
		end)
	end
end

function HeroExpeditController.registerProtocals(slot0)
	slot0:RegisterProtocal(24400, "handle24400")
	slot0:RegisterProtocal(24401, "handle24401")
	slot0:RegisterProtocal(24402, "handle24402")
	slot0:RegisterProtocal(24403, "hander24403")
	slot0:RegisterProtocal(24405, "hander24405")
	slot0:RegisterProtocal(24406, "hander24406")
	slot0:RegisterProtocal(24407, "hander24407")
	slot0:RegisterProtocal(24408, "hander24408")
	slot0:RegisterProtocal(24409, "hander24409")
	slot0:RegisterProtocal(24410, "hander24410")
	slot0:RegisterProtocal(24411, "hander24411")
	slot0:RegisterProtocal(24412, "hander24412")
	slot0:RegisterProtocal(24413, "hander24413")
	slot0:RegisterProtocal(24414, "hander24414")
	slot0:RegisterProtocal(24415, "hander24415")
end

function HeroExpeditController.sender24400(slot0)
	slot0:SendProtocal(24400, {})
end

function HeroExpeditController.handle24400(slot0, slot1)
	slot0.model:setExpeditData(slot1)

	slot0.grard_id = slot1.guard_id
	slot0.max_difficulty = slot1.max_difficulty

	slot0.model:setDifferentChoose(slot1.difficulty)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.HeroExpeditViewEvent, slot1)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.Expedit_RedPoint_Event)

	if NEEDCHANGEENTERSTATUS == 1 and not slot0.first_enter then
		slot0.first_enter = true

		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.ExpeditFight)
	end
end

function HeroExpeditController.getGrardID(slot0)
	if slot0.grard_id then
		return slot0.grard_id
	end

	return 1
end

function HeroExpeditController.getMaxDifficulty(slot0)
	if slot0.max_difficulty then
		return slot0.max_difficulty
	end

	return 0
end

function HeroExpeditController.sender24401(slot0, slot1)
	slot0:SendProtocal(24401, {
		id = slot1
	})
end

function HeroExpeditController.handle24401(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = false

	for slot7, slot8 in pairs(slot0.model:getExpeditBoxData()) do
		if slot8 == slot1.id then
			slot3 = true

			break
		end
	end

	if slot3 == true then
		slot0:openBrowsePanelView(true, slot1)
	elseif slot1.id <= slot0:getGrardID() then
		slot0:openHeroExpeditLevelView(true)
		GlobalEvent:getInstance():Fire(HeroExpeditEvent.levelMessageEvent, slot1)
	else
		message(TI18N("先通关前置关卡"))
	end
end

function HeroExpeditController.sender24402(slot0, slot1)
	slot0:SendProtocal(24402, {
		id = slot1
	})
end

function HeroExpeditController.handle24402(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		table.insert(slot0.model:getExpeditData().reward, {
			reward_id = slot1.id
		})
		GlobalEvent:getInstance():Fire(HeroExpeditEvent.Get_Box_Event, slot1.id)
	end
end

function HeroExpeditController.sender24403(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24403, {
		formation_type = slot1,
		pos_info = slot2,
		hallows_id = slot3
	})
end

function HeroExpeditController.hander24403(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		HeroController:getInstance():openFormGoFightPanel(false)
	end
end

function HeroExpeditController.sender24405(slot0)
	slot0:SendProtocal(24405, {})
end

function HeroExpeditController.hander24405(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.Employ_Me_Help, slot1)
end

function HeroExpeditController.sender24407(slot0, slot1)
	slot0:SendProtocal(24407, {
		id = slot1
	})
end

function HeroExpeditController.hander24407(slot0, slot1)
	message(slot1.msg)
end

function HeroExpeditController.sender24406(slot0)
	slot0:SendProtocal(24406, {})
end

function HeroExpeditController.hander24406(slot0, slot1)
	slot0.model:setEmployHelpMeData(slot1.list)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.Employ_Help_Me)
end

function HeroExpeditController.sender24408(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24408, {
		rid = slot1,
		srv_id = slot2,
		id = slot3
	})
end

function HeroExpeditController.hander24408(slot0, slot1)
	message(slot1.msg)
end

function HeroExpeditController.sender24409(slot0)
	slot0:SendProtocal(24409, {})
end

function HeroExpeditController.hander24409(slot0, slot1)
	slot0.model:setHeroBloodById(slot1)
end

function HeroExpeditController.sender24410(slot0)
	slot0:SendProtocal(24410, {})
end

function HeroExpeditController.hander24410(slot0, slot1)
	slot0.model:setIsChangeRedPoint(slot1.is_show)
end

function HeroExpeditController.sender24411(slot0)
	slot0:SendProtocal(24411, {})
end

function HeroExpeditController.hander24411(slot0, slot1)
	slot0.model:setHeroSendRedPoint(slot1.is_show)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.MeHelp_RedPoint_Event)
end

function HeroExpeditController.sender24412(slot0, slot1)
	slot0:SendProtocal(24412, {
		difficulty = slot1
	})
end

function HeroExpeditController.hander24412(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openModeChooseView(false)
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.ExpeditFight)
	end
end

function HeroExpeditController.hander24413(slot0, slot1)
	if MainuiController:getInstance():getUIFightType() == MainuiConst.ui_fight_type.expedit_fight then
		if BattleController:getInstance():isInFight() then
			slot0.need_reset_event = true
		else
			slot0:showExpeditReset()
		end
	end
end

function HeroExpeditController.hander24414(slot0, slot1)
	slot0:openHeroexpeditResultView(true, slot1)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.Expedit_Clear_Event, slot1)
end

function HeroExpeditController.sender24415(slot0, slot1)
	slot0:SendProtocal(24415, {
		guard_id = slot1
	})
end

function HeroExpeditController.hander24415(slot0, slot1)
	GlobalEvent:getInstance():Fire(HeroExpeditEvent.Expedit_Video_Event, slot1)
end

function HeroExpeditController.requestEnterHeroExpedit(slot0)
	PlanesController:getInstance():openPlanesMainWindow(true)
end

function HeroExpeditController.checkoutExpeditIsOpen(slot0)
	slot1 = false

	if Config.DailyplayData.data_exerciseactivity[EsecsiceConst.exercise_index.heroexpedit] == nil then
		message(TI18N("远征数据异常"))
	end

	if MainuiController:getInstance():checkIsOpenByActivate(slot2.activate) == true then
		slot1 = true
	end

	return slot1
end

function HeroExpeditController.showExpeditReset(slot0)
	MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
	delayOnce(function ()
		CommonAlert.show(TI18N("远征已重置，是否重新进入？"), TI18N("确定"), function ()
			uv0:requestEnterHeroExpedit()
		end, TI18N("取消"))
	end, 0.2)
end

function HeroExpeditController.openHeroExpeditView(slot0, slot1)
end

function HeroExpeditController.openHeroExpeditLevelView(slot0, slot1)
end

function HeroExpeditController.openEmpolyPanelView(slot0, slot1)
end

function HeroExpeditController.openBrowsePanelView(slot0, slot1, slot2)
end

function HeroExpeditController.openModeChooseView(slot0, slot1)
end

function HeroExpeditController.openHeroexpeditResultView(slot0, slot1, slot2)
end

function HeroExpeditController.openHeroexpeditVideoView(slot0, slot1, slot2)
end

function HeroExpeditController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
