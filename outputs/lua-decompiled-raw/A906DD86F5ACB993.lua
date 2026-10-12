ArenaLoopMatchWindow = ArenaLoopMatchWindow or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()

function ArenaLoopMatchWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.cur_type = 0
	slot0.title_str = TI18N("竞技场")

	slot0:initConfig()

	slot0.check_class_name = "ArenaLoopMatchWindow"
	slot0.panel_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenaloop"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("挑战"),
			index = ArenaConst.loop_index.challenge
		},
		{
			label = TI18N("排名榜"),
			index = ArenaConst.loop_index.rank,
			status = RankController:getInstance():checkRankIsShow(),
			notice = string.format(TI18N("%d级开启"), RankConstant.limit_open_lev)
		},
		{
			status = true,
			label = TI18N("日常奖励"),
			index = ArenaConst.loop_index.activity
		},
		{
			status = true,
			label = TI18N("排名奖励"),
			index = ArenaConst.loop_index.awards
		}
	}
end

function ArenaLoopMatchWindow.initConfig(slot0)
	slot0.background_path = string.format("resource/bigbg/battle_bg/%s/b_bg.jpg", BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.Arena))
end

function ArenaLoopMatchWindow.open_callback(slot0)
end

function ArenaLoopMatchWindow.register_event(slot0)
	if slot0.update_my_data == nil then
		slot0.update_my_data = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateMyLoopData, function (slot0, slot1)
			uv0:updateMyInfoData(slot0, slot1)
		end)
	end

	if slot0.update_challenge_activity == nil then
		slot0.update_challenge_activity = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateLoopChallengeTimesList, function ()
			uv0:updateChallengeActivityStatus()
		end)
	end

	if slot0.update_arena_red_event == nil then
		slot0.update_arena_red_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateArenaRedStatus, function (slot0, slot1)
			uv0:checkActivityStstus(slot0, slot1)
		end)
	end
end

function ArenaLoopMatchWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or ArenaConst.loop_index.challenge, true)
	slot0:checkActivityStstus()
end

function ArenaLoopMatchWindow.selectedTabCallBack(slot0, slot1)
	slot0:changeTabPanel(slot1)
end

function ArenaLoopMatchWindow.changeTabPanel(slot0, slot1)
	if slot0.cur_panel ~= nil then
		slot0.cur_panel:setNodeVisible(false)

		slot0.cur_panel = nil
	end

	slot0.cur_type = slot1
	slot0.cur_panel = slot0.panel_list[slot1]

	if slot0.cur_panel == nil then
		if slot1 == ArenaConst.loop_index.challenge then
			slot0.cur_panel = ArenaLoopChallengePanel.new()
		elseif slot1 == ArenaConst.loop_index.activity then
			slot0.cur_panel = ArenaLoopActivityPanel.new()
		elseif slot1 == ArenaConst.loop_index.rank then
			slot0.cur_panel = ArenaLoopRankPanel.new()
		elseif slot1 == ArenaConst.loop_index.awards then
			slot0.cur_panel = ArenaLoopAwardsPanel.new()
		end

		slot0.panel_list[slot1] = slot0.cur_panel

		slot0.container:addChild(slot0.cur_panel)

		if slot0.cur_panel.addToParent then
			slot0.cur_panel:addToParent()
		end
	end

	if slot0.cur_panel ~= nil then
		slot0.cur_panel:setNodeVisible(true)

		if slot0.cur_panel.updatePanelInfo then
			slot0.cur_panel:updatePanelInfo(false)
		end
	end
end

function ArenaLoopMatchWindow.updateMyInfoData(slot0)
	if slot0.cur_panel ~= nil and slot0.cur_panel.updatePanelInfo then
		slot0.cur_panel:updatePanelInfo(true)
	end
end

function ArenaLoopMatchWindow.updateChallengeActivityStatus(slot0)
	if slot0.panel_list[ArenaConst.loop_index.activity] ~= nil then
		slot1:updatePanelInfo(true)
	end
end

function ArenaLoopMatchWindow.checkActivityStstus(slot0, slot1, slot2)
	if slot1 == nil then
		slot3 = uv0:getLoopMatchRedStatus(ArenaConst.red_type.loop_challenge)

		slot0:setTabTips(uv0:getLoopMatchRedStatus(ArenaConst.red_type.loop_artivity), ArenaConst.loop_index.activity)
	elseif slot1 == ArenaConst.red_type.loop_challenge then
		-- Nothing
	elseif slot1 == ArenaConst.red_type.loop_artivity then
		slot0:setTabTips(slot2, ArenaConst.loop_index.activity)
	elseif slot1 == ArenaConst.red_type.loop_log and slot0.cur_type == ArenaConst.loop_index.challenge and slot0.cur_panel and slot0.cur_panel.updateMyLogTips then
		slot0.cur_panel:updateMyLogTips()
	end
end

function ArenaLoopMatchWindow.beforeClose(slot0)
	uv0:openArenaEnterWindow(true)
end

function ArenaLoopMatchWindow.close_callback(slot0)
	MainuiController:getInstance():resetUIFightType()
	uv0:openArenaLoopMathWindow(false, slot0.cur_type)

	if slot0.update_my_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_my_data)

		slot0.update_my_data = nil
	end

	if slot0.update_challenge_activity ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_activity)

		slot0.update_challenge_activity = nil
	end

	if slot0.update_arena_red_event == nil then
		GlobalEvent:getInstance():UnBind(slot0.update_arena_red_event)

		slot0.update_arena_red_event = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.panel_list = nil
end
