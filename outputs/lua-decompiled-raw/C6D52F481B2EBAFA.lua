ArenaEnterChampionView = class("ArenaEnterChampionView", function ()
	return ccui.Layout:create()
end)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getChampionModel()
slot2 = string.format

function ArenaEnterChampionView.ctor(slot0)
	slot0.statue_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_enter_champion_view"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("btn_container")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.rank_btn = slot0.root_wnd:getChildByName("Panel_9"):getChildByName("rank_btn")
	slot0.guess_btn = slot1:getChildByName("guess_btn")

	slot0.guess_btn:getChildByName("label"):setString(TI18N("我的布阵"))
	UITool.SetTitleColor(slot0.guess_btn:getChildByName("label"))

	slot0.enter_btn = slot1:getChildByName("enter_btn")

	slot0.enter_btn:getChildByName("label"):setString("进入挑战")

	slot0.tips_btn = slot0.root_wnd:getChildByName("dec_container"):getChildByName("tips_btn")

	slot0.root_wnd:getChildByName("worship"):setString(TI18N("被膜拜次数："))

	slot0.worship = slot0.root_wnd:getChildByName("worship_num")

	slot0.worship:setString(1000)

	slot6 = nil

	for slot10 = 1, 5 do
		if slot4:getChildByName("label_" .. slot10) then
			slot11:setString(slot0:getTitleLabel(slot10))
		end
	end

	slot0.match_step = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(163, 175), nil, , 560)

	slot4:addChild(slot0.match_step)

	slot0.my_rank_lable = slot4:getChildByName("my_rank_lable")
	slot0.my_total_rank = slot4:getChildByName("my_total_rank")
	slot11 = cc.p(0, 0.5)
	slot0.match_desc = createRichLabel(24, 1, slot11, cc.p(163, 66), nil, , 560)

	slot4:addChild(slot0.match_desc)

	slot0.notice_label = slot4:getChildByName("notice_label")

	slot0.notice_label:setString(TI18N("赛季结束时将通过邮件发放排名奖励"))

	slot0.dec_container = slot4
	slot0.btn_container = slot1
	slot7 = nil

	for slot11 = 1, 3 do
		slot7 = slot0.root_wnd:getChildByName("statue_" .. slot11)
		slot7.role_name = slot7:getChildByName("role_name")
		slot7.desc = slot7:getChildByName("desc")

		slot7.desc:setString(TI18N("虚位以待"))

		slot7.btn = slot7:getChildByName("worship_btn")
		slot7.worship_label = slot7.btn:getChildByName("label")

		slot7.worship_label:setString("")

		slot7.model = slot7:getChildByName("model")
		slot7.model = slot7:getChildByName("model")
		slot7.size = slot7.model:getContentSize()
		slot7.honor = slot7:getChildByName("honor")
		slot7.index = slot11
		slot7.btn.index = slot11
		slot0.statue_list[slot11] = slot7
	end

	slot0:registerEvent()
end

function ArenaEnterChampionView.registerEvent(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaEnterWindow(false)
		end
	end)
	slot0.rank_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openArenaChampionRankWindow(true)
		end
	end)
	slot0.guess_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.ArenaChampion)
		end
	end)
	slot0.enter_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openArenaChampionMatchWindow(true)
		end
	end)

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():openCommonExplainView(true, Config.ArenaChampionData.data_explain)
		end
	end

	slot0.tips_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.statue_list) do
		slot5.btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if slot0.data ~= nil then
					RoleController:getInstance():requestWorshipRole(slot0.data.rid, slot0.data.srv_id, slot0.index)
				end
			end
		end)
	end
end

function ArenaEnterChampionView.getTitleLabel(slot0, slot1)
	if slot1 == 1 then
		return TI18N("当前赛程:")
	elseif slot1 == 2 then
		return TI18N("当前排名:")
	elseif slot1 == 3 then
		return TI18N("历史最高排名:")
	elseif slot1 == 4 then
		return TI18N("赛季时间:")
	else
		return TI18N("系统提示:")
	end
end

function ArenaEnterChampionView.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleEvent(slot1)

	if RoleController:getInstance():getRoleVo() ~= nil then
		slot0.worship:setString(slot2.worship)
	end

	if slot1 == true then
		uv0:requestSelfResultInfo()
		uv0:requestRoleInfo()
		uv0:requestChampionTop3()
		slot0:setBaseInfo()
	end
end

function ArenaEnterChampionView.setBaseInfo(slot0)
	if uv0:getBaseInfo() == nil then
		return
	end

	if slot1.step == ArenaConst.champion_step.unopened then
		slot0.match_step:setString(uv1("<div outline=1,#000000>%s</div>", TI18N("暂未开启")))
	elseif slot1.step == ArenaConst.champion_step.score then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("选拔赛"), TI18N("暂未开启")))
		else
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("选拔赛"), TI18N("正式进行")))
		end
	elseif slot1.step == ArenaConst.champion_step.match_32 then
		if slot1.step_status == ArenaConst.champion_step_status.unopened then
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("32强赛"), TI18N("暂未开启")))
		else
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("32强赛"), TI18N("正在进行")))
		end
	elseif slot1.step == ArenaConst.champion_step.match_4 then
		if slot1.step_status == ArenaConst.champion_step_status.over then
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s</div>", TI18N("冠军赛已结束")))
		else
			slot0.match_step:setString(uv1("<div outline=1,#000000>%s-</div><div fontcolor=#4af915 outline=1,#000000>%s</div>", TI18N("4强赛"), TI18N("正在进行")))
		end
	end

	if slot1.step_status_time - GameNet:getInstance():getTime() < 0 then
		slot2 = 0
	end

	slot0.match_desc:setString(uv1("<div outline=1,#000000>%s-%s</div><div fontcolor=#4af915 outline=1,#000000>（剩余时间:%s）</div>", TimeTool.getMD(slot1.start_time), TimeTool.getMD(slot1.end_time), TimeTool.GetTimeFormatTwo(slot2)))
end

function ArenaEnterChampionView.setRoleInfo(slot0)
	if uv0:getRoleInfo() == nil then
		return
	end

	slot3 = slot1.best_rank or 0

	if (slot1.rank or 0) == 0 then
		slot0.my_rank_lable:setString(TI18N("未上榜"))
	else
		slot0.my_rank_lable:setString(slot2)
	end

	if slot3 == 0 then
		slot0.my_total_rank:setString(TI18N("未上榜"))
	else
		slot0.my_total_rank:setString(slot3)
	end
end

function ArenaEnterChampionView.updateStatueInfo(slot0, slot1)
	slot2 = nil
	slot3 = RoleController:getInstance():getRoleVo()
	slot4 = {
		"battle_champion",
		"battle_secondplace",
		"battle_thirdplace"
	}
	slot5 = Config.ArenaChampionData.data_const

	for slot9, slot10 in ipairs(slot0.statue_list) do
		if (slot1 or {})[slot10.index] == nil then
			slot10.role_name:setVisible(false)
			slot10.desc:setVisible(true)
			slot10.btn:setVisible(false)
			slot10.honor:setVisible(false)
		else
			slot10.role_name:setVisible(true)
			slot10.desc:setVisible(false)
			slot10.btn:setVisible(true)
			slot10.role_name:setString(slot2.name)
			slot10.worship_label:setString(slot2.worship)

			slot10.worship_num = slot2.worship

			if slot5[slot4[slot9]] and Config.HonorData.data_title[slot11.val] then
				loadSpriteTexture(slot10.honor, PathTool.getTargetRes("honor", uv0("txt_cn_honor_%s", slot12.res_id), false, false), LOADTEXT_TYPE)
				slot10.honor:setVisible(true)
			end

			if slot2.worship_status == TRUE or slot3:isSameRole(slot2.srv_id, slot2.rid) then
				slot10.btn:setTouchEnabled(false)
				setChildUnEnabled(true, slot10.btn, Config.ColorData.data_color4[1])
				slot10.worship_label:enableOutline(Config.ColorData.data_color4[2], 2)
			else
				slot10.btn:setTouchEnabled(true)
				setChildUnEnabled(false, slot10.btn, Config.ColorData.data_color4[175])
				slot10.worship_label:enableOutline(Config.ColorData.data_color4[277], 2)
			end
		end

		slot10.btn.data = slot2

		delayRun(slot0.dec_container, 5 * slot9 / display.DEFAULT_FPS, function ()
			uv0:setStatueModel(uv1)
		end)
	end
end

function ArenaEnterChampionView.setStatueModel(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	if slot1.btn.data == nil then
		if slot1.spine ~= nil then
			if slot1.spine ~= nil then
				slot1.spine:DeleteMe()

				slot1.spine = nil
			end

			slot1.spine_id = nil
		end

		return
	end

	if slot1.spine_id == slot2.lookid then
		return
	end

	if slot1.spine ~= nil then
		slot1.spine:DeleteMe()

		slot1.spine = nil
	end

	slot1.spine_id = slot2.lookid
	slot1.spine = BaseRole.new(BaseRole.type.role, slot2.lookid)

	slot1.spine:setAnimation(0, PlayerAction.show, true)
	slot1.spine:setPosition(cc.p(slot1.size.width * 0.5, 55))
	slot1.spine:setScale(0.4)
	slot1.spine:setAnchorPoint(cc.p(0.5, 0))
	slot1.model:addChild(slot1.spine)
end

function ArenaEnterChampionView.handleEvent(slot0, slot1)
	if slot1 == false then
		if slot0.update_base_info_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_base_info_event)

			slot0.update_base_info_event = nil
		end

		if slot0.update_role_info_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_role_info_event)

			slot0.update_role_info_event = nil
		end

		if slot0.update_statue_list_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_statue_list_event)

			slot0.update_statue_list_event = nil
		end

		if slot0.update_worship_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

			slot0.update_worship_event = nil
		end
	else
		if slot0.update_base_info_event == nil then
			slot0.update_base_info_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateChampionBaseInfoEvent, function (slot0)
				uv0:setBaseInfo()
			end)
		end

		if slot0.update_role_info_event == nil then
			slot0.update_role_info_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateChampionRoleInfoEvent, function ()
				uv0:setRoleInfo()
			end)
		end

		if slot0.update_statue_list_event == nil then
			slot0.update_statue_list_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateChampionTop3Event, function (slot0)
				uv0:updateStatueInfo(slot0)
			end)
		end

		if slot0.update_worship_event == nil then
			slot0.update_worship_event = GlobalEvent:getInstance():Bind(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2)
				if slot2 ~= nil and uv0.statue_list[slot2] ~= nil and slot3.worship_label ~= nil and slot3.worship_num ~= nil then
					slot3.worship_num = slot3.worship_num + 1

					slot3.worship_label:setString(slot3.worship_num)
					slot3.btn:setTouchEnabled(false)
					setChildUnEnabled(true, slot3.btn, Config.ColorData.data_color4[1])
					slot3.worship_label:enableOutline(Config.ColorData.data_color4[2], 2)
				end
			end)
		end
	end
end

function ArenaEnterChampionView.DeleteMe(slot0)
	doStopAllActions(slot0.dec_container)
	doStopAllActions(slot0.btn_container)

	slot4 = false

	slot0:handleEvent(slot4)

	for slot4, slot5 in ipairs(slot0.statue_list) do
		if slot5.spine ~= nil and slot5.spine ~= nil then
			slot5.spine:DeleteMe()

			slot5.spine = nil
		end
	end

	slot0.status_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
