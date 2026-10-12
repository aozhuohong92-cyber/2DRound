ArenaChampionMatchWindow = ArenaChampionMatchWindow or BaseClass(BaseView)
slot0 = GameNet:getInstance()
slot1 = string.format

function ArenaChampionMatchWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.layout_name = "arena/arena_champion_match_window"
	slot0.cur_type = 0
	slot0.panel_list = {}
	slot0.real_panel_index = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenachampion"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("form", "form"),
			type = ResourcesType.plist
		}
	}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.ctrl = ArenaController:getInstance()
		slot0.model = slot0.ctrl:getChampionModel()
	else
		slot0.ctrl = CrosschampionController:getInstance()
		slot0.model = slot0.ctrl:getModel()
	end

	slot0:initConfig()

	slot0.tab_list = {}
	slot0.had_show = false
end

function ArenaChampionMatchWindow.initConfig(slot0)
	slot1 = BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.Champion)

	if slot0.view_type == ArenaConst.champion_type.cross then
		slot1 = BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.CrossChampion)
	end

	slot0.background_path = string.format("resource/bigbg/battle_bg/%s/b_bg.jpg", slot1)

	table.insert(slot0.res_list, {
		path = slot0.background_path,
		type = ResourcesType.single
	})
end

function ArenaChampionMatchWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(slot0.background_path, LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale(slot0.root_wnd))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.my_guess_btn = slot1:getChildByName("my_guess_btn")
	slot0.my_guess_btn_label = slot0.my_guess_btn:getChildByName("label")

	UITool.SetTitleColor(slot0.my_guess_btn_label)

	slot0.awards_btn = slot1:getChildByName("awards_btn")

	slot0.awards_btn:getChildByName("label"):setString(TI18N("奖励"))

	slot0.tab_container = slot1:getChildByName("tab_container")
	slot0.explain_btn = slot0.tab_container:getChildByName("explain_btn")
	slot0.shop_btn = slot0.tab_container:getChildByName("shop_btn")
	slot2 = slot0.shop_btn:getChildByName("label")

	slot0.shop_btn:ignoreContentAdaptWithSize(true)

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.shop_btn:loadTexture(PathTool.getResFrame("arena", "arenachampion_1026", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
		slot2:setString(TI18N("竞技商城"))
		slot2:setPositionX(31)
	else
		slot0.shop_btn:loadTexture(PathTool.getResFrame("arena", "arenachampion_1036", false, "arenachampion"), LOADTEXT_TYPE_PLIST)
		slot2:setString(TI18N("冠军商城"))
		slot2:setPositionX(38.5)
	end

	slot0.panel_title = slot1:getChildByName("panel_title")
	slot0.match_time_label = slot1:getChildByName("match_time_label")

	slot0.panel_title:setVisible(false)
	slot0.match_time_label:setVisible(false)

	slot6 = "container"
	slot0.container = slot1:getChildByName(slot6)

	for slot6 = 1, 4 do
		slot7 = slot0.tab_container:getChildByName(string.format("tab_btn_%s", slot6))

		slot7:setBright(false)

		slot8 = slot7:getChildByName("title")

		slot8:setTextColor(cc.c4b(209, 226, 227, 255))
		slot8:setString(slot0:getLabel(slot6))

		slot0.tab_list[slot6] = {
			tab_btn = slot7,
			label = slot8,
			index = slot6
		}

		if slot6 == 2 then
			slot0.red_point = slot7:getChildByName("red_point")
		elseif slot6 == 3 then
			slot0.other_red_point = slot7:getChildByName("red_point")
		end
	end
end

function ArenaChampionMatchWindow.register_event(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()
				uv0:changeTabView(uv1)
			end
		end)
	end

	slot0.explain_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.view_type == ArenaConst.champion_type.normal then
				MainuiController:getInstance():openCommonExplainView(true, Config.ArenaChampionData.data_explain)
			else
				MainuiController:getInstance():openCommonExplainView(true, Config.ArenaClusterChampionData.data_explain)
			end
		end
	end)
	slot0.shop_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.view_type == ArenaConst.champion_type.normal then
				MallController:getInstance():openMallPanel(true, MallConst.MallType.ArenaShop)
			else
				CrosschampionController:getInstance():openCrosschampionShopWindow(true)
			end
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		if uv0.view_type == ArenaConst.champion_type.cross and uv0.ctrl:getCrosschampionOpenFlag() then
			uv0.ctrl:openCrosschampionMainWindow(true, true)
		end

		if uv0.cur_selected and uv0.cur_selected.index == ArenaConst.champion_index.match then
			if uv0.cur_panel and uv0.cur_panel.is_in_check_info == true then
				GlobalEvent:getInstance():Fire(ArenaEvent.CheckFightInfoEvent, false)
			else
				ArenaController:getInstance():openArenaChampionMatchWindow(false)
			end
		else
			ArenaController:getInstance():openArenaChampionMatchWindow(false)
		end
	end, true, 2)
	slot0.my_guess_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.cur_selected.index == ArenaConst.champion_index.my_match_ready then
				HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.ArenaChampion)
			else
				ArenaController:getInstance():openArenaChampionMyGuessWindow(true, uv0.view_type)
			end
		end
	end)
	slot0.awards_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			ArenaController:getInstance():openArenaChampionRankAwardsWindow(true, uv0.view_type)
		end
	end)

	if slot0.update_role_info_event == nil then
		slot0.update_role_info_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateChampionRoleInfoEvent, function (slot0)
			uv0:updateCurPanelInfo()
		end)
	end

	if slot0.change_tab_from_top_event == nil then
		slot0.change_tab_from_top_event = GlobalEvent:getInstance():Bind(ArenaEvent.ChangeTanFromTop324, function ()
			uv0:changeTabView(ArenaConst.champion_index.guess)
		end)
	end
end

function ArenaChampionMatchWindow.changeTabView(slot0, slot1)
	if slot0.cur_selected and slot0.cur_selected.index == slot1 then
		return
	end

	if slot0.cur_selected then
		slot0.cur_selected.label:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.cur_selected.tab_btn:setBright(false)

		slot0.cur_selected = nil
	end

	slot0.cur_selected = slot0.tab_list[slot1]

	if slot0.cur_selected == nil then
		return
	end

	if slot1 == ArenaConst.champion_index.my_match_ready then
		slot0.my_guess_btn_label:setString(TI18N("我的布阵"))
	else
		slot0.my_guess_btn_label:setString(TI18N("我的竞猜"))
	end

	slot0.my_guess_btn:setVisible(slot1 ~= ArenaConst.champion_index.rank)

	if slot1 == ArenaConst.champion_index.guess then
		slot0.red_point:setVisible(false)
	elseif slot1 == ArenaConst.champion_index.match then
		slot0.other_red_point:setVisible(false)
	end

	slot0.cur_selected.label:setTextColor(cc.c4b(255, 255, 255, 255))
	slot0.cur_selected.tab_btn:setBright(true)

	if slot0.cur_panel then
		slot0.cur_panel:addToParent(false)
	end

	slot0.cur_panel = slot0:getPanel(slot1)

	if slot0.cur_panel then
		slot0.cur_panel:addToParent(true)

		if slot0.cur_panel.updateInfo then
			slot0.cur_panel:updateInfo(true)
		end
	end

	slot0:updateBaseInfo()
	GlobalEvent:getInstance():Fire(BarrageEvent.SetVisibleStatus, slot1 ~= ArenaConst.champion_index.rank)
end

function ArenaChampionMatchWindow.updateCurPanelInfo(slot0)
	slot1 = slot0.model:getBaseInfo()

	if slot0.real_panel_index ~= ArenaConst.champion_index.guess then
		if slot1 and slot1.round_status == ArenaConst.champion_round_status.guess then
			slot0.red_point:setVisible(true)
		else
			slot0.red_point:setVisible(false)
		end
	end

	if slot0.real_panel_index ~= ArenaConst.champion_index.match and slot0.had_show == false and slot1 and (slot1.step == ArenaConst.champion_step.match_32 or slot1.step == ArenaConst.champion_step.match_4 or slot1.step == ArenaConst.champion_step.match_64 or slot1.step == ArenaConst.champion_step.match_8) then
		if slot1.step_status == ArenaConst.champion_step_status.opened then
			slot0.other_red_point:setVisible(true)

			slot0.had_show = true
		else
			slot0.other_red_point:setVisible(false)
		end
	end

	slot2 = false

	if slot0.cur_selected and slot0.cur_selected.index == ArenaConst.champion_index.my_match_ready then
		slot2 = slot0:changeMyMatchStatus() ~= slot0.real_panel_index
	end

	if slot0.cur_panel and slot0.cur_panel.updateInfo then
		slot0.cur_panel:updateInfo(slot2)
	end

	slot0:updateBaseInfo()
end

function ArenaChampionMatchWindow.changeMyMatchStatus(slot0)
	slot1 = ArenaConst.champion_index.my_match_ready

	if slot0.model:getMyMatchStatus() == ArenaConst.champion_my_status.in_match then
		slot1 = ArenaConst.champion_index.my_match
	end

	if slot0.real_panel_index == slot1 then
		return slot1
	end

	if slot0.cur_panel then
		slot0.cur_panel:addToParent(false)

		slot0.cur_panel = nil
	end

	slot0.cur_panel = slot0:getPanel(ArenaConst.champion_index.my_match_ready)

	if slot0.cur_panel then
		slot0.cur_panel:addToParent(true)
	end

	return slot1
end

function ArenaChampionMatchWindow.getPanel(slot0, slot1)
	if slot1 == ArenaConst.champion_index.my_match_ready and slot0.model:getMyMatchStatus() == ArenaConst.champion_my_status.in_match then
		slot1 = ArenaConst.champion_index.my_match
	end

	if slot0.panel_list[slot1] == nil then
		if slot1 == ArenaConst.champion_index.my_match_ready then
			slot2 = ArenaChampionMyMatchReadyPanel.new(slot0.view_type)
		elseif slot1 == ArenaConst.champion_index.my_match then
			slot2 = ArenaChampionMyMatchPanel.new(slot0.view_type)
		elseif slot1 == ArenaConst.champion_index.guess then
			slot2 = ArenaChampionCurGuessPanel.new(slot0.view_type)
		elseif slot1 == ArenaConst.champion_index.match then
			slot2 = ArenaChampionTop32Panel.new(slot0.view_type)
		elseif slot1 == ArenaConst.champion_index.rank then
			slot2 = ArenaChampionCurRankPanel.new(slot0.view_type)
		end

		if slot2 then
			slot0.container:addChild(slot2)
		end
	end

	slot0.panel_list[slot1] = slot2
	slot0.real_panel_index = slot1

	return slot2
end

function ArenaChampionMatchWindow.openRootWnd(slot0, slot1)
	slot0:changeTabView(slot1 or ArenaConst.champion_index.my_match_ready)

	if slot0.model:getBaseInfo() then
		if slot2.round_status == ArenaConst.champion_round_status.guess then
			slot0.red_point:setVisible(true)
		else
			slot0.red_point:setVisible(false)
		end

		if slot2.step == ArenaConst.champion_step.match_32 or slot2.step == ArenaConst.champion_step.match_4 or slot2.step == ArenaConst.champion_step.match_64 or slot2.step == ArenaConst.champion_step.match_8 then
			if slot2.step_status == ArenaConst.champion_step_status.opened then
				slot0.other_red_point:setVisible(true)

				slot0.had_show = true
			else
				slot0.other_red_point:setVisible(false)
			end
		end
	end

	if slot0.view_type == ArenaConst.champion_type.normal then
		GlobalEvent:getInstance():Fire(BarrageEvent.HandleBarrageType, true, BarrageConst.type.champion)
	else
		slot0.ctrl:sender26216()
		GlobalEvent:getInstance():Fire(BarrageEvent.HandleBarrageType, true, BarrageConst.type.crosschampion)
	end
end

function ArenaChampionMatchWindow.updateBaseInfo(slot0)
	if slot0.model:getBaseInfo() == nil then
		return
	end

	if slot0.real_panel_index == ArenaConst.champion_index.my_match_ready or slot0.real_panel_index == ArenaConst.champion_index.rank then
		slot0.panel_title:setVisible(false)
		slot0.match_time_label:setVisible(false)
		slot0:clearTimeTicket()
	else
		slot0.panel_title:setVisible(true)
		slot0:setChampionStepInfo()

		if (slot1.step == ArenaConst.champion_step.match_4 or slot1.step == ArenaConst.champion_step.match_8) and slot1.step_status == ArenaConst.champion_step_status.over then
			slot0:clearTimeTicket()
			slot0.match_time_label:setVisible(false)
		else
			slot0.match_time_label:setVisible(true)

			if slot0.time_ticket == nil then
				slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0:countDownTimeTicket()
				end, 1)
			end

			slot0:countDownTimeTicket()
		end
	end
end

function ArenaChampionMatchWindow.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function ArenaChampionMatchWindow.countDownTimeTicket(slot0)
	if slot0.model:getBaseInfo() == nil then
		slot0:clearTimeTicket()

		return
	end

	slot2 = uv0:getTime()

	if ((slot1.step ~= ArenaConst.champion_step.unopened or slot1.step_status_time) and (slot1.step ~= ArenaConst.champion_step.score or slot1.step_status ~= ArenaConst.champion_step_status.unopened or slot1.step_status_time) and slot1.round_status_time) - uv0:getTime() < 0 then
		slot3 = 0

		slot0:clearTimeTicket()
	end

	slot4 = ""

	slot0.match_time_label:setString((slot1.step ~= ArenaConst.champion_step.unopened and slot1.step_status ~= ArenaConst.champion_step_status.unopened or uv1(TI18N("距离开始:%s"), TimeTool.GetTimeFormat(slot3))) and (slot1.round_status ~= ArenaConst.champion_round_status.prepare or uv1(TI18N("准备阶段:%s"), TimeTool.GetTimeFormat(slot3))) and (slot1.round_status ~= ArenaConst.champion_round_status.guess or uv1(TI18N("竞猜阶段:%s"), TimeTool.GetTimeFormat(slot3))) and uv1(TI18N("比赛阶段:%s"), TimeTool.GetTimeFormat(slot3)))
end

function ArenaChampionMatchWindow.setChampionStepInfo(slot0)
	if slot0.model:getBaseInfo() == nil or slot0.model:getRoleInfo() == nil then
		return
	end

	if slot1.step == ArenaConst.champion_step.unopened then
		slot3 = uv0(TI18N("下次冠军赛 %s"), TimeTool.getMD2(slot1.step_status_time))

		if slot0.view_type == ArenaConst.champion_type.cross then
			slot3 = uv0(TI18N("下次周冠军赛 %s"), TimeTool.getMD2(slot1.step_status_time))
		end

		slot0.panel_title:setString(slot3)
	elseif slot1.step == ArenaConst.champion_step.score then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot3 = uv0(TI18N("下次冠军赛 %s"), TimeTool.getMD2(slot1.step_status_time))

			if slot0.view_type == ArenaConst.champion_type.cross then
				slot3 = uv0(TI18N("下次周冠军赛 %s"), TimeTool.getMD2(slot1.step_status_time))
			end

			slot0.panel_title:setString(slot3)
		elseif slot1.step_status == ArenaConst.champion_step_status.opened then
			slot0.panel_title:setString(uv0(TI18N("%s第%s回合"), ArenaConst.getMatchStepDesc(slot1.step), slot1.round))
		end
	elseif slot1.step == ArenaConst.champion_step.match_64 then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot0.panel_title:setString(TI18N("下轮64强赛"))
		elseif slot1.step_status == ArenaConst.champion_step_status.opened then
			if slot1.round <= 1 then
				if slot2.rank > 64 then
					slot0.panel_title:setString(TI18N("32强赛"))
				else
					slot0.panel_title:setString(uv0(TI18N("32强赛%s"), ArenaConst.getGroup(slot2.group)))
				end
			elseif slot1.round == 2 then
				if slot2.rank > 32 then
					slot0.panel_title:setString(TI18N("16强赛"))
				else
					slot0.panel_title:setString(uv0(TI18N("16强赛%s"), ArenaConst.getGroup(slot2.group)))
				end
			elseif slot1.round == 3 then
				if slot2.rank > 16 then
					slot0.panel_title:setString(TI18N("8强赛"))
				else
					slot0.panel_title:setString(uv0(TI18N("8强赛%s"), ArenaConst.getGroup(slot2.group)))
				end
			end
		end
	elseif slot1.step == ArenaConst.champion_step.match_32 then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot0.panel_title:setString(TI18N("下轮32强赛"))
		elseif slot1.step_status == ArenaConst.champion_step_status.opened then
			if slot1.round <= 1 then
				if slot2.rank > 32 then
					slot0.panel_title:setString(TI18N("16强赛"))
				else
					slot0.panel_title:setString(uv0(TI18N("16强赛%s"), ArenaConst.getGroup(slot2.group)))
				end
			elseif slot1.round == 2 then
				if slot2.rank > 16 then
					slot0.panel_title:setString(TI18N("8强赛"))
				else
					slot0.panel_title:setString(uv0(TI18N("8强赛%s"), ArenaConst.getGroup(slot2.group)))
				end
			elseif slot1.round == 3 then
				if slot2.rank > 8 then
					slot0.panel_title:setString(TI18N("4强赛"))
				else
					slot0.panel_title:setString(uv0(TI18N("4强赛%s"), ArenaConst.getGroup(slot2.group)))
				end
			end
		end
	elseif slot1.step == ArenaConst.champion_step.match_8 then
		if slot1.step_status == ArenaConst.champion_step_status.opened then
			if slot1.round == 1 then
				slot0.panel_title:setString(TI18N("4强赛"))
			elseif slot1.round == 2 then
				slot0.panel_title:setString(TI18N("半决赛"))
			elseif slot1.round == 3 then
				slot0.panel_title:setString(TI18N("决赛"))
			end
		elseif slot1.step_status == ArenaConst.champion_step_status.over then
			if slot0.view_type == ArenaConst.champion_type.normal then
				slot0.panel_title:setString(TI18N("本轮冠军赛已结束"))
			else
				slot0.panel_title:setString(TI18N("本轮周冠军赛已结束"))
			end
		end
	elseif slot1.step == ArenaConst.champion_step.match_4 then
		if slot1.step_status == ArenaConst.champion_step_status.opened then
			if slot1.round == 1 then
				slot0.panel_title:setString(TI18N("半决赛"))
			elseif slot1.round == 2 then
				slot0.panel_title:setString(TI18N("决赛"))
			end
		elseif slot1.step_status == ArenaConst.champion_step_status.over then
			if slot0.view_type == ArenaConst.champion_type.normal then
				slot0.panel_title:setString(TI18N("本轮冠军赛已结束"))
			else
				slot0.panel_title:setString(TI18N("本轮周冠军赛已结束"))
			end
		end
	end
end

function ArenaChampionMatchWindow.close_callback(slot0)
	GlobalEvent:getInstance():Fire(BarrageEvent.HandleBarrageType, false)
	slot0:clearTimeTicket()

	if slot0.update_role_info_event then
		GlobalEvent:getInstance():UnBind(slot0.update_role_info_event)

		slot0.update_role_info_event = nil
	end

	if slot0.change_tab_from_top_event then
		GlobalEvent:getInstance():UnBind(slot0.change_tab_from_top_event)

		slot0.change_tab_from_top_event = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	CrosschampionController:getInstance():setCrosschampionOpenFlag(false)
	ArenaController:getInstance():openArenaChampionMatchWindow(false)
end

function ArenaChampionMatchWindow.getLabel(slot0, slot1)
	if slot1 == ArenaConst.champion_index.my_match_ready then
		return TI18N("我的竞赛")
	elseif slot1 == ArenaConst.champion_index.guess then
		return TI18N("竞猜")
	elseif slot1 == ArenaConst.champion_index.match then
		if slot0.view_type == ArenaConst.champion_type.normal then
			return TI18N("32强赛")
		else
			return TI18N("64强赛")
		end
	elseif slot1 == ArenaConst.champion_index.rank then
		return TI18N("排行榜")
	end
end
