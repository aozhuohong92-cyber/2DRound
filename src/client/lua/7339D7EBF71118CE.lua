GodBattleMainUI = class("GodBattleMainUI", function ()
	return ccui.Widget:create()
end)
slot1 = GodbattleController:getInstance():getModel()

function GodBattleMainUI.ctor(slot0, slot1)
	slot0.skill_list = {}
	slot0.role_data_list = {}
	slot0.cache_list = {}
	slot0.cache_key_list = {}
	slot0.cell_off_y = 3
	slot0.cell_height = 37
	slot0.interval_step = 1
	slot0.is_show = true
	slot0.touch_time = 0
	slot0.is_first = true
	slot0.parent = slot1

	slot0:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("godbattle/godbattle_mainui"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.top_container = slot0.main_container:getChildByName("top_container")

	slot0.top_container:setPosition(cc.p(SCREEN_WIDTH / 2, display.getTop() - 88))

	slot0.time_container = slot0.top_container:getChildByName("time_container")
	slot0.time_label = slot0.time_container:getChildByName("label")

	slot0.time_label:setString("")

	slot0.left_progress_container = slot0.top_container:getChildByName("left_progress_container")
	slot0.left_value = slot0.left_progress_container:getChildByName("value")
	slot0.right_progress_container = slot0.top_container:getChildByName("right_progress_container")
	slot0.right_value = slot0.right_progress_container:getChildByName("value")
	slot0.info_container = slot0.top_container:getChildByName("info_container")
	slot0.my_rank = slot0.info_container:getChildByName("my_rank")
	slot0.my_info_btn = slot0.info_container:getChildByName("my_info_btn")
	slot0.rank_title = createLabel(20, 1, nil, 62, 40, "", slot0.info_container)

	slot0.rank_title:setAnchorPoint(cc.p(0.5, 1))
	slot0.rank_title:setTextColor(cc.c4b(11, 208, 230, 255))
	slot0.rank_title:setString(TI18N("积分排行"))

	slot5 = slot0.info_container:getContentSize().width / 2

	slot0.rank_title:setPosition(slot5, slot0.info_container:getContentSize().height - 5)

	slot0.rank_list = {}

	for slot5 = 1, 3 do
		slot6 = slot0:createSingleRankItem(slot5)

		slot6:setPositionY(slot0.info_container:getContentSize().height - 40 - (slot5 - 1) * 36)
		slot0.info_container:addChild(slot6)

		slot0.rank_list[slot5] = slot6
	end

	slot0.rewards_btn = slot0.top_container:getChildByName("rewards_btn")

	slot0.rewards_btn:getChildByName("label"):setString(TI18N("奖励"))

	slot0.reward_red_point = slot0.rewards_btn:getChildByName("red_point")

	slot0.reward_red_point:setVisible(uv0.red_point and uv0.red_point > 0)

	slot0.form_btn = slot0.top_container:getChildByName("form_btn")

	slot0.form_btn:getChildByName("label"):setString(TI18N("布阵"))

	slot0.bottom_container = slot0.main_container:getChildByName("bottom_container")

	slot0.bottom_container:setPositionY(MainuiController:getInstance():getBottomHeight() + display.getBottom())

	slot0.bottom_bg = slot0.bottom_container:getChildByName("bg")

	slot0.bottom_bg:setContentSize(cc.size(SCREEN_WIDTH, 105))

	slot0.info_container = slot0.bottom_container:getChildByName("info_container")

	slot0.info_container:setPositionX(display.getLeft())

	slot0.info_bg = slot0.info_container:getChildByName("bg")
	slot0.my_info_camp = slot0.info_container:getChildByName("cur_camp")
	slot0.my_info_score = slot0.info_container:getChildByName("cur_score")
	slot0.my_info_skill = slot0.info_container:getChildByName("cur_kill_num")
	slot0.my_info_rank = slot0.info_container:getChildByName("cur_rank")
	slot0.info_btn = slot0.info_container:getChildByName("info_btn")
	slot0.skill_container = slot0.bottom_container:getChildByName("skill_container")

	slot0.skill_container:setPositionX(SCREEN_WIDTH)

	slot2, slot3 = nil

	for slot7 = 1, 3 do
		if slot0.skill_container:getChildByName("skill_" .. slot7) ~= nil then
			slot2.index = slot7
			slot2.id = 0
			slot2.icon = slot2:getChildByName("icon")
			slot2.label = slot2:getChildByName("label")
			slot2.cd_container = slot2:getChildByName("cd_container")
			slot2.cd_label = slot2.cd_container:getChildByName("cd_label")
			slot2.surplus_time = 0
			slot0.skill_list[slot7] = slot2
		end
	end

	slot0:registerEvent()
end

function GodBattleMainUI.createSingleRankItem(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setContentSize(cc.size(184, 36))

	slot3 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 5, 18, slot2)

	slot3:setAnchorPoint(cc.p(0, 0.5))
	slot3:setScale(0.5)

	slot2.sp = slot3
	slot4 = createLabel(20, 1, nil, 55, 18, "虚位以待", slot2)

	slot4:setAnchorPoint(cc.p(0, 0.5))
	slot4:setTextColor(cc.c4b(172, 242, 255, 255))

	slot5 = createLabel(20, 1, nil, 275, 18, "0", slot2)

	slot5:setAnchorPoint(cc.p(0, 0.5))
	slot5:setTextColor(cc.c4b(172, 242, 255, 255))

	slot2.name = slot4
	slot2.value = slot5

	return slot2
end

function GodBattleMainUI.registerEvent(slot0)
	for slot4, slot5 in pairs(slot0.skill_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:clearTouchTimer()

				if os.time() - uv0.touch_time >= 2 then
					uv0:clearTouchTimer()
				else
					if slot0.vo == nil then
						return
					end

					if Config.ZsWarData.data_skill[uv1.id].free <= slot0.vo.num and slot2.loss and slot2.loss[1] then
						CommonAlert.show(string.format(TI18N("<div fontcolor=#d95014>%s</div>使用次数已达上限，再次使用需额外消耗<img src=%s visible=true scale=0.35 /><div>%s，是否继续？"), slot2.name, PathTool.getItemRes(slot2.loss[1][1]), slot2.loss[1][2]), TI18N("确定"), function ()
							uv0:requestUseGodBattleSkill(uv1.id)
						end, TI18N("取消"), nil, CommonAlert.type.rich)
					elseif slot0.id ~= nil then
						uv2:requestUseGodBattleSkill(uv1.id)
					end
				end
			elseif slot1 == ccui.TouchEventType.began then
				uv0.touch_time = os.time()
				uv0.show_tips = false

				if uv0.touch_timer == nil then
					uv0.touch_timer = GlobalTimeTicket:getInstance():add(function ()
						if os.time() - uv0.touch_time >= 2 then
							uv0:clearTouchTimer()

							if Config.ZsWarData.data_skill[uv1.id] ~= nil then
								slot1 = uv1:convertToWorldSpace(cc.p(0, 1))

								TipsManager:getInstance():showCommonTips(slot0.desc, cc.p(slot1.x, slot1.y + uv1:getContentSize().height), 20, 3, 230)
							end
						end
					end, 1)
				end
			elseif slot1 == ccui.TouchEventType.canceled then
				uv0:clearTouchTimer()
			end
		end)

		if slot5.cd_container then
			slot5.cd_container:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended and Config.ZsWarData.data_skill[uv0.id] ~= nil then
					slot3 = slot0:convertToWorldSpace(cc.p(0, 1))

					TipsManager:getInstance():showCommonTips(slot2.desc, cc.p(slot3.x, slot3.y + slot0:getContentSize().height), 20, 3, 230)
				end
			end)
		end
	end

	if slot0.info_btn then
		slot0.info_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openGodBattleInfoView(true)
			end
		end)
	end

	if slot0.my_info_btn then
		slot0.my_info_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openGodBattleInfoView(true)
			end
		end)
	end

	if slot0.add_role_event == nil then
		slot0.add_role_event = GlobalEvent:getInstance():Bind(GodbattleEvent.AddRoleDataEvent, function (slot0, slot1)
			uv0:addRoleInfoList(slot0, slot1)
		end)
	end

	if slot0.total_score_event == nil then
		slot0.total_score_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateTotalScoreEvent, function (slot0)
			uv0:updateTotalScore(slot0)
		end)
	end

	if slot0.skill_list_event == nil then
		slot0.skill_list_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateSkillListEvent, function (slot0)
			uv0:updateSkillList(slot0)
		end)
	end

	if slot0.time_count_down_event == nil then
		slot0.time_count_down_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateTimeCountDown, function (slot0)
			uv0:timeCountDown(slot0)
		end)
	end

	if slot0.update_self_data_event == nil then
		slot0.update_self_data_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateSelfDataEvent, function (slot0, slot1, slot2, slot3)
			uv0:updateSelfData(slot0, slot1, slot2, slot3)
		end)
	end

	if slot0.update_role_awards_event == nil then
		slot0.update_role_awards_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateRoleAwards, function (slot0)
			uv0:updateRoleAwards(slot0)
		end)
	end

	if slot0.chat_ui_size_change == nil then
		slot0.chat_ui_size_change = GlobalEvent:getInstance():Bind(EventId.CHAT_HEIGHT_CHANGE, function ()
			uv0.bottom_container:setPositionY(MainuiController:getInstance():getBottomHeight() + display.getBottom())
		end)
	end

	if slot0.add_guard_event == nil then
		slot0.add_guard_event = GlobalEvent:getInstance():Bind(GodbattleEvent.AddGuardDataEvent, function (slot0, slot1)
			uv0:updateGuardListData(slot0, slot1)
		end)
	end

	if slot0.form_btn then
		slot0.form_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				-- Nothing
			end
		end)
	end

	if slot0.rewards_btn then
		slot0.rewards_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				GodbattleController:getInstance():openGodBattleRewardsWindow(true)
			end
		end)
	end

	if slot0.update_reward_red_point_event == nil then
		slot0.update_reward_red_point_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateRewardRedPoint, function (slot0)
			uv0.reward_red_point:setVisible(slot0 and slot0 > 0)
		end)
	end
end

function GodBattleMainUI.open(slot0)
	if slot0:getParent() == nil then
		if not tolua.isnull(slot0.parent) then
			slot0.parent:addChild(slot0)
		end
	else
		slot0:setVisibleStatus(true)
	end

	slot0:setScheduleUpdate(true)
end

function GodBattleMainUI.addRoleInfoList(slot0, slot1, slot2)
	if slot2 == nil or next(slot2) == nil then
		return
	end

	if slot1 == GodBattleConstants.update_type.update then
		-- Nothing
	elseif slot1 == GodBattleConstants.update_type.add or slot1 == GodBattleConstants.update_type.total then
		slot3 = {}

		for slot7, slot8 in ipairs(slot2) do
			if slot0.cache_key_list[getNorKey(slot8.rid, slot8.srv_id)] == nil then
				slot0.cache_key_list[getNorKey(slot8.rid, slot8.srv_id)] = slot8

				table.insert(slot0.role_data_list, slot8)
			end
		end
	end

	if slot1 == GodBattleConstants.update_type.total then
		slot0:updateRoleInfoList()
	end
end

function GodBattleMainUI.updateRoleInfoList(slot0)
	if slot0.role_data_list == nil then
		return
	end

	slot1 = RoleController:getInstance():getRoleVo()
	slot7 = SortTools.tableUpperSorter({
		"score",
		"win_acc"
	})

	table.sort(slot0.role_data_list, slot7)

	for slot7, slot8 in pairs(slot0.role_data_list) do
		if getNorKey(slot8.rid, slot8.srv_id) == getNorKey(slot1.rid, slot1.srv_id) then
			slot0.my_rank:setString(string.format(TI18N("我的排名：%s"), slot7))
			slot0.my_info_rank:setString(string.format(TI18N("当前排名：%s"), slot7))
		end

		if slot0.rank_list[slot7] then
			slot0.rank_list[slot7].name:setString(uv0:convertName(slot8))
			slot0.rank_list[slot7].value:setString(slot8.score)
		end
	end
end

function GodBattleMainUI.setScheduleUpdate(slot0, slot1)
	if slot1 == true then
		if slot0.queue_timer == nil then
			slot0.queue_timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0.interval_step > 1200 then
					uv0.interval_step = 1

					uv0:updateRoleInfoList()
				end

				uv0.interval_step = uv0.interval_step + 1
			end, 1 / display.DEFAULT_FPS)
		end
	elseif slot0.queue_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.queue_timer)

		slot0.queue_timer = nil
	end
end

function GodBattleMainUI.createList(slot0, slot1)
end

function GodBattleMainUI.updateTotalScore(slot0, slot1)
	slot0.left_value:setString(slot1.score_a or 0)
	slot0.right_value:setString(slot1.score_b or 0)

	if Config.ZsWarData.data_group[slot1.group or 0] then
		slot0.my_info_camp:setString(string.format(TI18N("当前战场：%s第%s战场"), slot3.name, slot1.zone or 0))
	end
end

function GodBattleMainUI.updateSelfData(slot0, slot1, slot2, slot3, slot4)
	if slot0.camp == nil then
		slot0.camp = slot1

		if slot1 == GodBattleConstants.camp.god then
			slot0.bottom_bg:loadTexture(PathTool.getResFrame("godbattle", "godbattle_7"), LOADTEXT_TYPE_PLIST)
			slot0.info_bg:loadTexture(PathTool.getResFrame("godbattle", "godbattle_5"), LOADTEXT_TYPE_PLIST)
			slot0.info_bg:setCapInsets(cc.rect(6, 12, 1, 1))
		end
	end

	slot0.my_info_score:setString(TI18N("当前积分:") .. slot2)
	slot0.my_info_skill:setString(TI18N("击杀数量:") .. slot3)
end

function GodBattleMainUI.updateRoleAwards(slot0, slot1)
end

function GodBattleMainUI.updateGuardListData(slot0, slot1, slot2)
end

function GodBattleMainUI.updateSkillList(slot0)
	slot2 = nil
	slot3 = false

	for slot7, slot8 in pairs(uv0:getGodBattleSkillList()) do
		if slot0.skill_list[slot7] ~= nil then
			config = Config.ZsWarData.data_skill[slot8.id]

			if config ~= nil and slot2.id ~= slot8.id then
				slot2.label:setString(config.name)
				loadSpriteTexture(slot2.icon, PathTool.getSkillRes(config.icon), LOADTEXT_TYPE)
			end

			slot2.id = slot8.id
			slot2.vo = slot8
			slot2.surplus_time = slot8.cdtime - GameNet:getInstance():getTime()

			if slot2.surplus_time > 0 then
				if slot3 == false then
					slot3 = true
				end

				if slot2.cd_label then
					slot2.cd_label:setString(slot2.surplus_time)
					slot2.cd_container:setVisible(true)
				end
			elseif slot2.cd_container then
				slot2.cd_container:setVisible(false)
			end
		end
	end

	slot0:clearSkillTimer()

	if slot3 == true and slot0.skill_timer == nil then
		slot0.skill_timer = GlobalTimeTicket:getInstance():add(function ()
			uv0:skillCountDownTime()
		end, 1)
	end
end

function GodBattleMainUI.timeCountDown(slot0, slot1)
	if slot1 == nil or slot1 <= 0 then
		if slot0.start_timer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.start_timer)

			slot0.start_timer = nil
		end

		if slot0.start_timer_num ~= nil then
			slot0.start_timer_num:DeleteMe()

			slot0.start_timer_num = nil
		end
	else
		slot0.start_time = slot1

		if slot0.start_time > 0 then
			slot0:setStartTimeNum(slot0.start_time)

			if slot0.start_timer == nil then
				slot0.start_timer = GlobalTimeTicket:getInstance():add(function ()
					uv0:countDownStartTime()
				end, 1)
			end
		end
	end
end

function GodBattleMainUI.countDownStartTime(slot0)
	slot0.start_time = slot0.start_time - 1

	if slot0.start_time <= 0 then
		slot0:timeCountDown()

		return
	end

	slot0:setStartTimeNum(slot0.start_time)
end

function GodBattleMainUI.setStartTimeNum(slot0, slot1)
	if slot0.start_timer_num == nil then
		slot0.start_timer_num = CommonNum.new(3, slot0.main_container, 0, 0, cc.p(0.5, 0.5))

		slot0.start_timer_num:setPosition(slot0.main_container:getContentSize().width * 0.5, slot0.main_container:getContentSize().height * 0.5 + 200)
	end

	slot0.start_timer_num:setNum(slot1)
end

function GodBattleMainUI.skillCountDownTime(slot0)
	for slot5, slot6 in pairs(slot0.skill_list) do
		slot6.surplus_time = slot6.surplus_time - 1

		if slot6.surplus_time <= 0 then
			slot6.cd_container:setVisible(false)

			slot1 = 0 + 1
		end

		slot6.cd_label:setString(slot6.surplus_time)
	end

	if slot1 >= 3 then
		slot0:clearSkillTimer()
	end
end

function GodBattleMainUI.clearSkillTimer(slot0)
	if slot0.skill_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.skill_timer)

		slot0.skill_timer = nil
	end
end

function GodBattleMainUI.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
	slot0:clearTimer()
	slot0:clearSkillTimer()

	if slot1 == true then
		slot0:setTimeCountDown()

		if slot0.is_first == false then
			slot0:updateSkillList()
		else
			slot0.is_first = false
		end
	end
end

function GodBattleMainUI.DeleteMe(slot0)
	slot0:clearTimer()
	slot0:clearSkillTimer()
	slot0:timeCountDown()
	slot0:clearTouchTimer()

	slot4 = false

	slot0:setScheduleUpdate(slot4)

	for slot4, slot5 in pairs(slot0.cache_list) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	if slot0.god_score then
		slot0.god_score:DeleteMe()

		slot0.god_score = nil
	end

	if slot0.devil_score then
		slot0.devil_score:DeleteMe()

		slot0.devil_score = nil
	end

	if slot0.add_role_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.add_role_event)

		slot0.add_role_event = nil
	end

	if slot0.total_score_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.total_score_event)

		slot0.total_score_event = nil
	end

	if slot0.skill_list_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.skill_list_event)

		slot0.skill_list_event = nil
	end

	if slot0.use_default_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.use_default_event)

		slot0.use_default_event = nil
	end

	if slot0.time_count_down_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.time_count_down_event)

		slot0.time_count_down_event = nil
	end

	if slot0.update_self_data_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_self_data_event)

		slot0.update_self_data_event = nil
	end

	if slot0.update_role_awards_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_role_awards_event)

		slot0.update_role_awards_event = nil
	end

	if slot0.chat_ui_size_change then
		GlobalEvent:getInstance():UnBind(slot0.chat_ui_size_change)

		slot0.chat_ui_size_change = nil
	end

	if slot0.add_guard_event then
		GlobalEvent:getInstance():UnBind(slot0.add_guard_event)

		slot0.add_guard_event = nil
	end

	if slot0.update_reward_red_point_event then
		GlobalEvent:getInstance():UnBind(slot0.update_reward_red_point_event)

		slot0.update_reward_red_point_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

function GodBattleMainUI.setTimeCountDown(slot0)
	slot0.time_info = uv0:getTimeInfo()

	if slot0.time_info == nil or slot0.time_info.end_time == nil then
		slot0.time_label:setString("")
	else
		slot0:clearTimer()

		slot0.surplus_time = slot0.time_info.end_time - GameNet:getInstance():getTime()

		if slot0.surplus_time <= 0 or slot0.time_info.status == ActionStatus.is_end then
			slot0.time_label:setString("")
		else
			slot0:countDownTime()

			if slot0.timer == nil then
				slot0.timer = GlobalTimeTicket:getInstance():add(function ()
					uv0:countDownTime()
				end, 1)
			end
		end
	end
end

function GodBattleMainUI.clearTouchTimer(slot0)
	if slot0.touch_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.touch_timer)

		slot0.touch_timer = nil
	end
end

function GodBattleMainUI.clearTimer(slot0)
	if slot0.timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.timer)

		slot0.timer = nil
	end
end

function GodBattleMainUI.countDownTime(slot0)
	slot0.surplus_time = slot0.surplus_time - 1

	if slot0.surplus_time < 0 then
		slot0:clearTimer()

		return
	end

	slot0.time_label:setString(TI18N("剩余时间:") .. TimeTool.GetTimeMS(slot0.surplus_time, true))
end
