ArenaEnterLoopView = class("ArenaEnterLoopView", function ()
	return ccui.Layout:create()
end)

function ArenaEnterLoopView.ctor(slot0)
	slot0.text_list = {}
	slot0.statue_list = {}
	slot0.ctrl = ArenaController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_enter_loop_view"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("btn_container")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.enter_btn = slot1:getChildByName("enter_btn")

	slot0.enter_btn:getChildByName("label"):setString(TI18N("进入挑战"))

	slot0.enter_tips = slot0.enter_btn:getChildByName("tips")

	slot0.enter_tips:setVisible(false)

	slot3 = slot0.root_wnd:getChildByName("dec_container")
	slot0.tips_btn = slot3:getChildByName("tips_btn")
	slot0.buy_btn = slot3:getChildByName("buy_btn")

	slot0.root_wnd:getChildByName("worship"):setString(TI18N("被膜拜次数："))

	slot0.worship = slot0.root_wnd:getChildByName("worship_num")

	slot0.worship:setString(1000)

	slot5 = nil

	for slot9 = 1, 5 do
		slot10 = {}

		if slot3:getChildByName("label_" .. slot9) then
			slot5:setString(slot0:getTitleLabel(slot9))
		end

		slot10.label = slot5

		if slot3:getChildByName("label_value_" .. slot9) ~= nil then
			slot10.value = slot5
			slot0.text_list[slot9] = slot10

			if slot9 == 5 then
				slot5:setString(TI18N("赛季结束时将通过邮件发放排名奖励"))
			end
		end
	end

	slot10 = cc.p(0, 0.5)
	slot0.match_desc = createRichLabel(24, 1, slot10, cc.p(163, 66), nil, nil, 560)

	slot3:addChild(slot0.match_desc)

	slot0.dec_container = slot3
	slot6 = nil

	for slot10 = 1, 3 do
		slot6 = slot0.root_wnd:getChildByName("statue_" .. slot10)
		slot6.role_name = slot6:getChildByName("role_name")
		slot6.desc = slot6:getChildByName("desc")

		slot6.desc:setString(TI18N("虚位以待"))

		slot6.btn = slot6:getChildByName("worship_btn")
		slot6.worship_label = slot6.btn:getChildByName("label")

		slot6.worship_label:setString("")

		slot6.model = slot6:getChildByName("model")
		slot6.model = slot6:getChildByName("model")
		slot6.size = slot6.model:getContentSize()
		slot6.index = slot10
		slot6.btn.index = slot10
		slot0.statue_list[slot10] = slot6
	end

	slot0:registerEvent()
end

function ArenaEnterLoopView.registerEvent(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openArenaEnterWindow(false)
		end
	end)
	slot0.buy_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			ArenaController:getInstance():openArenaLoopChallengeBuy(true)
		end
	end)
	slot0.enter_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:requestOpenArenaLoopMathWindow(true)
		end
	end)

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():openCommonExplainView(true, Config.ArenaData.data_explain)
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

function ArenaEnterLoopView.getTitleLabel(slot0, slot1)
	if slot1 == 1 then
		return TI18N("我的积分:")
	elseif slot1 == 2 then
		return TI18N("我的排名:")
	elseif slot1 == 3 then
		return TI18N("挑战劵数:")
	elseif slot1 == 4 then
		return TI18N("赛季时间:")
	else
		return TI18N("系统提示:")
	end
end

function ArenaEnterLoopView.addToParent(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:handleEvent(slot1)
	slot0:updateMyData()

	if slot1 == true then
		slot0.ctrl:requestLoopChallengeStatueList()
		slot0:checkRedStatus()
	end

	if RoleController:getInstance():getRoleVo() ~= nil then
		slot0.worship:setString(slot2.worship)
	end
end

function ArenaEnterLoopView.updateMyData(slot0)
	slot2 = slot0.model:getZoneConfig()

	if slot0.model:getMyLoopData() ~= nil and slot2 ~= nil then
		slot0.text_list[1].value:setString(string.format("%s", slot1.score))

		if slot0.cup_index ~= slot2.index then
			slot0.cup_index = slot2.index
		end

		if slot1.rank == 0 then
			slot0.text_list[2].value:setString(TI18N("千里之外"))
		else
			slot3.value:setString(slot1.rank)
		end

		slot0.text_list[3].value:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.ArenaData.data_const.arena_ticketcost.val[1][1]))

		if slot1.end_time - GameNet:getInstance():getTime() < 0 then
			slot6 = 0
		end

		slot0.match_desc:setString(string.format("<div outline=1,#000000>%s-%s</div><div fontcolor=#4af915 outline=1,#000000>（剩余时间:%s）</div>", TimeTool.getMD(slot1.start_time), TimeTool.getMD(slot1.end_time), TimeTool.GetTimeFormatTwo(slot6)))
	end
end

function ArenaEnterLoopView.updateStatueInfo(slot0, slot1)
	slot2 = nil
	slot3 = RoleController:getInstance():getRoleVo()

	for slot7, slot8 in ipairs(slot0.statue_list) do
		if (slot1 or {})[slot8.index] == nil then
			slot8.role_name:setVisible(false)
			slot8.desc:setVisible(true)
			slot8.btn:setVisible(false)
		else
			slot8.role_name:setVisible(true)
			slot8.desc:setVisible(false)
			slot8.btn:setVisible(true)
			slot8.role_name:setString(slot2.name)
			slot8.worship_label:setString(slot2.worship)

			slot8.worship_num = slot2.worship

			if slot2.worship_status == TRUE or slot3:isSameRole(slot2.srv_id, slot2.rid) then
				slot8.btn:setTouchEnabled(false)
				setChildUnEnabled(true, slot8.btn, Config.ColorData.data_color4[1])
				slot8.worship_label:enableOutline(Config.ColorData.data_color4[2], 2)
			else
				slot8.btn:setTouchEnabled(true)
				setChildUnEnabled(false, slot8.btn, Config.ColorData.data_color4[175])
				slot8.worship_label:enableOutline(Config.ColorData.data_color4[277], 2)
			end
		end

		slot8.btn.data = slot2

		delayRun(slot0.dec_container, 5 * slot7 / display.DEFAULT_FPS, function ()
			uv0:setStatueModel(uv1)
		end)
	end
end

function ArenaEnterLoopView.setStatueModel(slot0, slot1)
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
	slot1.spine:setAnchorPoint(cc.p(0, 0))
	slot1.model:addChild(slot1.spine)
end

function ArenaEnterLoopView.handleEvent(slot0, slot1)
	if slot1 == false then
		if slot0.update_self_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		if slot0.update_statue_list_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_statue_list_event)

			slot0.update_statue_list_event = nil
		end

		if slot0.update_worship_event ~= nil then
			GlobalEvent:getInstance():UnBind(slot0.update_worship_event)

			slot0.update_worship_event = nil
		end

		if slot0.update_arena_red_event then
			GlobalEvent:getInstance():UnBind(slot0.update_arena_red_event)

			slot0.update_arena_red_event = nil
		end
	else
		if slot0.update_self_event == nil then
			slot0.update_self_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateMyLoopData, function ()
				uv0:updateMyData()
			end)
		end

		if slot0.update_statue_list_event == nil then
			slot0.update_statue_list_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateLoopChallengeStatueList, function (slot0)
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

		if slot0.update_arena_red_event == nil then
			slot0.update_arena_red_event = GlobalEvent:getInstance():Bind(ArenaEvent.UpdateArenaRedStatus, function (slot0, slot1)
				uv0:checkRedStatus()
			end)
		end
	end
end

function ArenaEnterLoopView.checkRedStatus(slot0)
	slot0.enter_tips:setVisible(slot0.model:checkLoopMatchRedStatus())
end

function ArenaEnterLoopView.DeleteMe(slot0)
	doStopAllActions(slot0.dec_container)

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
