ActionSevenGoalWindow = ActionSevenGoalWindow or BaseClass(BaseView)
slot0 = Config.DayGoalsData.data_constant
slot1 = table.insert
slot3 = ActionController:getInstance():getModel()

function ActionSevenGoalWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.cur_index = nil
	slot0.cur_select = nil
	slot0.cur_grop_select = nil
	slot0.play_effect = {}
	slot0.welfareList = nil
	slot0.growthTarget = nil
	slot0.priceList = nil
	slot0.item_scrollview_walfare = nil
	slot0.currentDay = 1
	slot0.initCurrentDay = 1
	slot0.load_touch_day = {}
	slot0.layout_name = "action/action_seven_goal_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionlimitgroup", "actionlimitgroup"),
			type = ResourcesType.plist
		}
	}
end

function ActionSevenGoalWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.bg_sprite = slot0.root_wnd:getChildByName("Image_bg")

	if slot0.bg_sprite ~= nil then
		slot0.bg_sprite:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.background:getChildByName("main_container")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.main_container, slot5)

	slot0.layer_tab = slot0.main_container:getChildByName("layer_tab")
	slot0.award_list = {
		108,
		108,
		108,
		110
	}
	slot0.box_list_layer = {}

	for slot5 = 1, 4 do
		slot6 = slot0.background:getChildByName("box_" .. slot5)

		slot6:setPositionX(80 + 139.75 * slot5)

		slot6.redpoint = slot6:getChildByName("redpoint")

		slot6.redpoint:setLocalZOrder(11)
		slot6.redpoint:setVisible(false)

		slot6.textNum = slot6:getChildByName("textNum")

		slot6.textNum:setLocalZOrder(11)
		slot6.textNum:setString("")

		slot0.box_list_layer[slot5] = slot6
	end

	slot0.goods_walfare = slot0.main_container:getChildByName("goods_walfare")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_list = {}

	for slot6 = 1, 4 do
		slot7 = slot0.layer_tab:getChildByName("btnSelect_" .. slot6)
		slot7.red_point = slot7:getChildByName("redpoint")

		slot7.red_point:setVisible(false)

		slot7.normal = slot7:getChildByName("normal")
		slot7.select = slot7:getChildByName("select")

		slot7.select:setVisible(false)

		slot7.title = slot7:getChildByName("title")

		slot7.title:setString(({
			TI18N("福利领取"),
			TI18N(""),
			TI18N(""),
			TI18N("福利礼包")
		})[slot6])
		slot7.title:setTextColor(cc.c4b(215, 226, 227, 255))
		slot7.title:enableOutline(cc.c4b(2, 0, 25, 255), 2)

		slot7.index = slot6
		slot0.btn_list[slot6] = slot7
	end

	slot0.touchTotleDay = {}

	for slot7 = 1, 7 do
		slot8 = {
			btn = slot0.background:getChildByName("layerReward"):getChildByName("reward_" .. slot7)
		}
		slot8.red_point = slot8.btn:getChildByName("redpoint")

		slot8.red_point:setVisible(false)

		slot9 = slot8.btn:getChildByName("day")

		slot9:setString(TI18N("第") .. slot7 .. TI18N("天"))
		slot9:setTextColor(cc.c4b(215, 226, 227, 255))
		slot9:enableOutline(cc.c4b(2, 0, 25, 255), 1)

		slot8.rewardImage = slot8.btn:getChildByName("rewardImage")
		slot8.show_day_icon = slot8.btn:getChildByName("rewardItem")

		slot8.show_day_icon:setScale(0.8)

		slot0.touchTotleDay[slot7] = slot8
	end

	slot0.finish_round = slot0.background:getChildByName("finish_round")
	slot0.day_title = slot0.background:getChildByName("day_title")

	slot0.main_container:getChildByName("Text_19"):setString(TI18N("剩余时间: "))
	slot0.background:getChildByName("Text_1"):setString(TI18N("完成个数"))

	slot0.sevenGoalTime = slot0.main_container:getChildByName("sevenGoalTime")
	slot0.bar = slot0.background:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)

	slot0.successNum = slot0.background:getChildByName("successNum")
	slot4 = slot0.goods_walfare:getContentSize()
	slot0.item_scrollview_walfare = CommonScrollViewLayout.new(slot0.goods_walfare, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height), {
		start_y = 0,
		item_width = 641,
		start_x = 6,
		space_x = 0,
		row = 0,
		item_height = 156,
		space_y = 5,
		col = 1,
		item_class = ActionSevenGoalItem
	})

	slot0.item_scrollview_walfare:setSwallowTouches(false)
end

function ActionSevenGoalWindow.register_event(slot0)
	slot0:addGlobalEvent(ActionEvent.UPDATE_SEVENT_GOAL, function (slot0)
		uv0:seventGoal(slot0)
	end)

	slot4 = ActionEvent.UPDATE_SEVENT_GET

	function slot5(slot0)
		uv0:seventGet(slot0)
	end

	slot0:addGlobalEvent(slot4, slot5)

	for slot4, slot5 in pairs(slot0.btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:selectByBtn(uv1)
		end, false, 1)
	end

	for slot4, slot5 in pairs(slot0.touchTotleDay) do
		registerButtonEventListener(slot5.btn, function ()
			if uv1.initCurrentDay < uv0 then
				message(TI18N("未达到开放天数"))

				return
			end

			uv1:noArriveDayGray(uv0)
		end, false, 1)
	end

	for slot4, slot5 in pairs(slot0.box_list_layer) do
		registerButtonEventListener(slot5, function ()
			if uv0:getBoxRewardData() and slot0[uv1] and slot0[uv1].id then
				CommonAlert.showItemApply(TI18N("当前活跃度奖励"), slot0[uv1].award, function ()
					uv0:cs13602(5, uv1.currentDay, uv2[uv3].id, 0)
				end, TI18N("确定"), nil, nil, TI18N("奖励"), nil, nil, true, nil, nil, {
					off_y = 50
				})
			end
		end, true, 1)
	end

	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openSevenGoalView(false)
	end, true, 2)
end

function ActionSevenGoalWindow.openRootWnd(slot0)
	uv0:cs13601()
end

function ActionSevenGoalWindow.seventGoal(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot1 or slot1.cur_day > 7 or slot1.cur_day < 1 then
		uv0:openSevenGoalView(false)

		return
	end

	doStopAllActions(slot0.layer_tab)

	slot1.period = slot1.period or 1

	if slot1.period == 7 then
		slot1.period = 4
	end

	if not slot0.item_load then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.bg_sprite, PathTool.getPlistImgForDownLoad(string.format("seven_goals/%d", slot1.period), "action_seven_goal_bg1"), ResourcesType.single, slot0.item_load)
	end

	slot3 = uv1:getBoxRewardData()

	for slot7 = 1, 4 do
		if slot0.box_list_layer[slot7] and slot3[slot7] then
			slot0.box_list_layer[slot7].textNum:setString(slot3[slot7].goal)
		end
	end

	slot4 = uv2.day_item

	if slot1.period == 2 then
		slot4 = uv2.day_item1
	elseif slot1.period == 3 then
		slot4 = uv2.day_item2
	elseif slot1.period == 4 then
		slot4 = uv2.day_item3
	end

	for slot8 = 1, 7 do
		if Config.ItemData.data_get_data(slot4.val[slot8]) then
			slot10 = PathTool.getItemRes(slot9.icon)

			if slot0.touchTotleDay[slot8] then
				delayRun(slot0.layer_tab, slot8 / display.DEFAULT_FPS, function ()
					loadSpriteTexture(uv0.touchTotleDay[uv1].show_day_icon, uv2, LOADTEXT_TYPE)
				end)
			end
		end
	end

	delayRun(slot0.layer_tab, 2 / display.DEFAULT_FPS, function ()
		if not uv0.load_round_finish then
			uv0.load_round_finish = loadSpriteTextureFromCDN(uv0.finish_round, PathTool.getPlistImgForDownLoad(uv1, "seven_goals_1_3"), ResourcesType.single, uv0.load_round_finish)
		end
	end)
	delayRun(slot0.layer_tab, 3 / display.DEFAULT_FPS, function ()
		if not uv0.load_day_title then
			uv0.load_day_title = loadSpriteTextureFromCDN(uv0.day_title, PathTool.getPlistImgForDownLoad(uv1, "seven_goals_1_4"), ResourcesType.single, uv0.load_day_title)

			uv0.day_title:setScaleX(8)
		end
	end)

	slot5 = RoleController:getInstance():getRoleVo()
	slot0.goalEndTime = slot1.end_time or 0
	slot0.currentDay = slot1.cur_day or 1
	slot0.initCurrentDay = slot1.cur_day or 1

	slot0:noArriveDayGray(slot0.currentDay)

	slot0.success_num = slot1.num or 1

	slot0.successNum:setString(slot0.success_num)
	slot0.bar:setPercent(slot0:setSemgentPercent(slot0.success_num))
	slot0:udpateGoalEndTime()
	slot0:updateTaskList(uv1:getSevenGoalBoxList())

	if slot0.cur_index == nil then
		slot0:selectByBtn(1)
	else
		slot0:selectByBtn(slot0.cur_index)
	end

	for slot11, slot12 in ipairs(slot0:initRedPointDay(slot0.currentDay)) do
		if slot12 and slot0.touchTotleDay[slot11] then
			slot0.touchTotleDay[slot11].red_point:setVisible(slot12)
		end
	end

	slot0:redPointTabDayList(slot0.currentDay)
end

function ActionSevenGoalWindow.udpateGoalEndTime(slot0)
	if not slot0.goalEndTime then
		return
	end

	if not slot0.sevenGoalTime then
		return
	end

	doStopAllActions(slot0.sevenGoalTime)

	if slot0.goalEndTime > 0 then
		slot0.sevenGoalTime:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0.goalEndTime = uv0.goalEndTime - 1

			if uv0.goalEndTime <= 0 then
				doStopAllActions(uv0.sevenGoalTime)
				uv0.sevenGoalTime:setString("00:00:00")
			else
				uv0.sevenGoalTime:setString(TimeTool.GetTimeFormatDayIIIIIIII(uv0.goalEndTime))
			end
		end))))
		slot0:sevenGoalRemainTime()
	else
		doStopAllActions(slot0.sevenGoalTime)
		slot0.sevenGoalTime:setString("00:00:00")
	end
end

function ActionSevenGoalWindow.seventGet(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.success_num = slot1.num or 1

	slot0.successNum:setString(slot0.success_num)
	slot0.bar:setPercent(slot0:setSemgentPercent(slot0.success_num))

	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}

	if slot1.type == 1 or slot1.type == 2 or slot1.type == 3 then
		if slot1.type == 1 then
			slot3 = uv0:getWalfareData(slot1.day_type)
			slot4 = uv0:getSevenGoalWelfareList(slot1.day_type)
		elseif slot1.type == 2 then
			slot3 = uv0:getWalfareGrowUpData(slot1.day_type)
			slot4 = uv0:getServerGrowListData(slot1.day_type)
		elseif slot1.type == 3 then
			slot3 = uv0:getWelfareGiftData(slot1.day_type)
			slot4 = uv0:getServerGiftListData(slot1.day_type)
		end

		slot6 = 1

		for slot10, slot11 in ipairs(slot4) do
			if slot11 and slot11.goal_id and slot11.goal_id == slot1.id then
				slot6 = slot10

				break
			end
		end

		if slot1.type == 1 then
			uv0:updataGoalWelfareList(slot1.day_type, slot6, slot1.status)

			slot5 = uv0:getSevenGoalWelfareList(slot0.currentDay)
		elseif slot1.type == 2 then
			uv0:updataGrowListData(slot1.day_type, slot6, slot1.status)

			slot5 = uv0:getServerGrowListData(slot1.day_type)
		elseif slot1.type == 3 then
			uv0:updataGiftListData(slot1.day_type, slot6, slot1.status)

			slot5 = uv0:getServerGiftListData(slot1.day_type)
		end

		slot10 = slot0:reverseTable(deepCopy(slot5))

		for slot10, slot11 in ipairs(slot0:sortFunc(slot10)) do
			for slot15, slot16 in ipairs(slot3) do
				if slot11.goal_id == slot16.goal_id then
					uv1(slot2, slot16)
				end
			end
		end

		slot3 = slot2
		slot7 = false

		for slot11, slot12 in ipairs(slot5) do
			if slot12.status == 1 then
				slot7 = true

				break
			end
		end

		if slot1.type == 1 then
			uv0:updataRedPointWelfareStatus(slot1.day_type, slot7)
		elseif slot1.type == 2 then
			uv0:updataRedPointGrowStatus(slot1.day_type, slot7)
		elseif slot1.type == 3 then
			uv0:updataRedPointGiftStatus(slot1.day_type, slot7)
		end

		slot0.item_scrollview_walfare:setData(slot3, nil, nil, {
			list = deepCopy(slot5),
			type = slot0.cur_index,
			day = slot1.day_type,
			init_cur_day = slot0.initCurrentDay
		})
	elseif slot1.type == 4 then
		slot6 = uv0:getWelfareHalfData(slot1.day_type)
		slot8 = 1

		for slot12, slot13 in ipairs(uv0:getHalfGiftList(slot1.day_type)) do
			if slot13.day == slot1.id then
				slot8 = slot12

				break
			end
		end

		slot14 = slot1.status

		uv0:updataHalfListData(slot1.day_type, slot8, slot14)

		slot9 = uv0:getHalfGiftList(slot1.day_type)

		function slot13(slot0, slot1)
			if slot0.status < slot1.status then
				return slot0.status < slot1.status
			end
		end

		table.sort(slot9, slot13)

		for slot13, slot14 in ipairs(slot9) do
			for slot18, slot19 in ipairs(slot6) do
				if slot14.day == slot19.id then
					uv1(slot2, slot19)
				end
			end
		end

		slot6 = slot2
		slot10 = false

		for slot14, slot15 in ipairs(slot9) do
			if slot15.day <= 7 and slot15.status == 0 then
				slot10 = true

				break
			end
		end

		uv0:updataRedPointHalfStatus(slot1.day_type, slot10)
		slot0.item_scrollview_walfare:setData(slot6, nil, nil, {
			list = deepCopy(slot9),
			type = slot0.cur_index,
			day = slot1.day_type,
			init_cur_day = slot0.initCurrentDay
		})
	elseif slot1.type == 5 then
		slot7 = 1

		for slot11, slot12 in ipairs(uv0:getBoxRewardData()) do
			if slot12.id == slot1.id then
				slot7 = slot11

				break
			end
		end

		uv0:updataBoxListData(slot7, slot1.status)

		slot8 = uv0:getSevenGoalBoxList()

		slot0:updateTaskList(slot8)
		uv0:updataRedPointBoxStatus(slot7, slot8[slot7].status)
	end

	if slot0.success_num == uv0:getBoxRewardData()[1].goal or slot0.success_num == slot6[2].goal or slot0.success_num == slot6[3].goal or slot0.success_num == slot6[4].goal then
		slot7 = uv0:getSevenGoalBoxList()

		for slot11 = 1, 4 do
			if slot0.success_num == slot6[slot11].goal and slot7[slot11].status == 0 then
				slot7[slot11].status = 1
			end
		end

		slot0:updateTaskList(slot7)
	end

	slot0:redPointTabDayList(slot1.day_type, true)
end

function ActionSevenGoalWindow.sevenGoalRemainTime(slot0)
	slot0.goalEndTime = slot0.goalEndTime - 1

	if slot0.goalEndTime <= 0 then
		doStopAllActions(slot0.sevenGoalTime)
		slot0.sevenGoalTime:setString("00:00:00")
	end

	slot0.sevenGoalTime:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot0.goalEndTime))
end

function ActionSevenGoalWindow.noArriveDayGray(slot0, slot1)
	if slot0.cur_index then
		slot0.currentDay = slot1 or 1

		slot0:selectByBtn(slot0.cur_index)
	end

	if uv0:getSevenGoldPeriod() == 7 then
		slot2 = 4
	end

	slot3 = string.format("seven_goals/%d", slot2)

	for slot7 = 1, 7 do
		delayRun(slot0.layer_tab, slot7 / display.DEFAULT_FPS, function ()
			if uv0 <= uv1.initCurrentDay then
				if uv0 == uv2 then
					if not uv1.load_touch_day[uv2] and uv1.touchTotleDay[uv0].rewardImage then
						uv1.load_touch_day[uv2] = loadSpriteTextureFromCDN(uv1.touchTotleDay[uv2].rewardImage, PathTool.getPlistImgForDownLoad(uv3, "seven_goals_1_2"), ResourcesType.single, uv1.load_touch_day[uv2])
					end

					if uv1.load_touch_day[uv2] and uv1.touchTotleDay[uv0].rewardImage then
						loadSpriteTexture(uv1.touchTotleDay[uv2].rewardImage, slot0, LOADTEXT_TYPE)
					end
				else
					if not uv1.load_touch_day[uv0] and uv1.touchTotleDay[uv0].rewardImage then
						uv1.load_touch_day[uv0] = loadSpriteTextureFromCDN(uv1.touchTotleDay[uv0].rewardImage, PathTool.getPlistImgForDownLoad(uv3, "seven_goals_1_1"), ResourcesType.single, uv1.load_touch_day[uv0])
					end

					if uv1.load_touch_day[uv0] and uv1.touchTotleDay[uv0].rewardImage then
						loadSpriteTexture(uv1.touchTotleDay[uv0].rewardImage, slot0, LOADTEXT_TYPE)
					end
				end
			else
				if uv1.touchTotleDay[uv0] then
					setChildUnEnabled(true, uv1.touchTotleDay[uv0].btn, cc.c4b(211, 211, 211, 255))
				end

				if not uv1.load_touch_day[uv0] and uv1.touchTotleDay[uv0].rewardImage then
					uv1.load_touch_day[uv0] = loadSpriteTextureFromCDN(uv1.touchTotleDay[uv0].rewardImage, PathTool.getPlistImgForDownLoad(uv3, "seven_goals_1_1"), ResourcesType.single, uv1.load_touch_day[uv0])
				end

				if uv1.load_touch_day[uv0] and uv1.touchTotleDay[uv0].rewardImage then
					loadSpriteTexture(uv1.touchTotleDay[uv0].rewardImage, slot0, LOADTEXT_TYPE)
				end
			end
		end)
	end
end

function ActionSevenGoalWindow.reverseTable(slot0, slot1)
	if slot1 == nil then
		return {}
	end

	for slot6 = 1, #slot1 do
	end

	return {
		[slot6] = table.remove(slot1)
	}
end

function ActionSevenGoalWindow.sortFunc(slot0, slot1)
	slot2 = {
		[0] = 2,
		1,
		3
	}

	table.sort(slot1, function (slot0, slot1)
		if slot0.status ~= slot1.status then
			if uv0[slot0.status] and uv0[slot1.status] then
				return uv0[slot0.status] < uv0[slot1.status]
			else
				return false
			end
		else
			return slot0.goal_id < slot1.goal_id
		end
	end)

	return slot1
end

function ActionSevenGoalWindow.getTabName(slot0, slot1)
	slot3 = uv0:getWelfareGiftData(slot1)
	slot4 = ""
	slot5 = ""

	if next(uv0:getWalfareGrowUpData(slot1)) ~= nil and slot2[1].type_name then
		slot4 = slot2[1].type_name
	end

	if next(slot3) ~= nil and slot3[1].type_name then
		slot5 = slot3[1].type_name
	end

	return slot4, slot5
end

function ActionSevenGoalWindow.selectByBtn(slot0, slot1)
	slot1 = slot1 or 1

	if slot0.cur_select ~= nil then
		slot0.cur_select.select:setVisible(false)
		slot0.cur_select.title:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.cur_select.title:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	slot0.cur_index = slot1
	slot0.cur_select = slot0.btn_list[slot0.cur_index]

	if slot0.cur_select ~= nil then
		slot0.cur_select.select:setVisible(true)
		slot0.cur_select.title:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.cur_select.title:setTextColor(cc.c4b(255, 255, 255, 255))
	end

	slot0:redPointTabDayList(slot0.currentDay)

	slot2 = {}
	slot3 = {}
	slot4 = {}

	if slot0.cur_index == 1 then
		slot2 = uv0:getWalfareData(slot0.currentDay)
		slot3 = uv0:getSevenGoalWelfareList(slot0.currentDay)
	elseif slot0.cur_index == 2 then
		slot2 = uv0:getWalfareGrowUpData(slot0.currentDay)
		slot3 = uv0:getServerGrowListData(slot0.currentDay)
	elseif slot0.cur_index == 3 then
		slot2 = uv0:getWelfareGiftData(slot0.currentDay)
		slot3 = uv0:getServerGiftListData(slot0.currentDay)
	elseif slot0.cur_index == 4 then
		slot2 = uv0:getWelfareHalfData(slot0.currentDay)
		slot3 = uv0:getHalfGiftList(slot0.currentDay)
	end

	slot5, slot6 = slot0:getTabName(slot0.currentDay)

	slot0.btn_list[2].title:setString(slot5)
	slot0.btn_list[3].title:setString(slot6)

	if slot0.cur_index == 4 then
		function slot10(slot0, slot1)
			return slot0.status < slot1.status
		end

		table.sort(slot3, slot10)

		for slot10, slot11 in ipairs(slot3) do
			for slot15, slot16 in ipairs(slot2) do
				if slot11.day == slot16.id then
					uv1(slot4, slot16)
				end
			end
		end
	else
		slot10 = slot0:reverseTable(deepCopy(slot3))

		for slot10, slot11 in ipairs(slot0:sortFunc(slot10)) do
			for slot15, slot16 in ipairs(slot2) do
				if slot11.goal_id == slot16.goal_id then
					uv1(slot4, slot16)
				end
			end
		end
	end

	slot0.item_scrollview_walfare:setData(slot4, nil, nil, {
		list = slot3,
		type = slot0.cur_index,
		day = slot0.currentDay,
		init_cur_day = slot0.initCurrentDay
	})
end

function ActionSevenGoalWindow.initRedPointDay(slot0, slot1)
	if slot1 < 1 or slot1 > 7 then
		return {}
	end

	for slot6 = 1, slot1 do
		slot11 = false
	end

	return {
		[slot6] = false,
		[slot6] = uv0:getRedPointWelfareStatus(slot6) or uv0:getRedPointGrowStatus(slot6) or uv0:getRedPointGiftStatus(slot6) or uv0:getRedPointHalfStatus(slot6)
	}
end

function ActionSevenGoalWindow.redPointTabDayList(slot0, slot1, slot2)
	if slot0.currentDay < 1 or slot0.currentDay > 7 then
		return
	end

	if slot0.btn_list[1].red_point then
		slot0.btn_list[1].red_point:setVisible(uv0:getRedPointWelfareStatus(slot1))
	end

	if slot0.btn_list[2].red_point then
		slot0.btn_list[2].red_point:setVisible(uv0:getRedPointGrowStatus(slot1))
	end

	if slot0.btn_list[3].red_point then
		slot0.btn_list[3].red_point:setVisible(uv0:getRedPointGiftStatus(slot1))
	end

	if slot0.btn_list[4].red_point then
		slot0.btn_list[4].red_point:setVisible(uv0:getRedPointHalfStatus(slot1))
	end

	if slot2 then
		slot7 = false

		if slot0.touchTotleDay[slot1].red_point then
			slot0.touchTotleDay[slot1].red_point:setVisible(slot3 or slot4 or slot5 or slot6)
		end

		slot9 = false

		for slot13, slot14 in ipairs(slot0:initRedPointDay(slot0.currentDay)) do
			if slot14 and slot14 == true then
				slot9 = true

				break
			end
		end

		slot10 = false

		for slot14 = 1, 3 do
			if uv0:getRedPointBoxStatus(slot14) == true then
				slot10 = true

				break
			end
		end

		slot11 = MainuiConst.icon.seven_goal3

		if uv0:getSevenGoldPeriod() == 1 then
			slot11 = MainuiConst.icon.seven_goal
		elseif uv0:getSevenGoldPeriod() == 2 then
			slot11 = MainuiConst.icon.seven_goal1
		elseif uv0:getSevenGoldPeriod() == 3 then
			slot11 = MainuiConst.icon.seven_goal2
		elseif uv0:getSevenGoldPeriod() == 7 then
			slot11 = MainuiConst.icon.seven_goal4
		end

		MainuiController:getInstance():setFunctionTipsStatus(slot11, slot9 or slot10)
	end
end

function ActionSevenGoalWindow.updateTaskList(slot0, slot1)
	for slot5 = 1, 4 do
		slot6 = PlayerAction.action_1

		slot0.box_list_layer[slot5].redpoint:setVisible(false)

		if next(slot1) ~= nil and slot1[slot5] then
			if slot1[slot5] and slot1[slot5].status == 0 then
				slot6 = PlayerAction.action_1
			elseif slot1[slot5] and slot1[slot5].status == 1 then
				slot6 = PlayerAction.action_2

				slot0.box_list_layer[slot5].redpoint:setVisible(true)
			elseif slot1[slot5] and slot1[slot5].status == 2 then
				slot6 = PlayerAction.action_3
			end
		end

		if slot0.play_effect[slot5] then
			slot0.play_effect[slot5]:clearTracks()
			slot0.play_effect[slot5]:removeFromParent()

			slot0.play_effect[slot5] = nil
		end

		if not tolua.isnull(slot0.box_list_layer[slot5]) and slot0.play_effect[slot5] == nil then
			slot0.play_effect[slot5] = createEffectSpine(PathTool.getEffectRes(slot0.award_list[slot5]), cc.p(slot0.box_list_layer[slot5]:getContentSize().width * 0.5, 0), cc.p(0, 0), true, slot6)

			slot0.box_list_layer[slot5]:addChild(slot0.play_effect[slot5])
		end
	end
end

function ActionSevenGoalWindow.setSemgentPercent(slot0, slot1)
	slot2 = 25
	slot3 = 1

	if uv0:getBoxRewardData()[1] == nil or slot4[2] == nil or slot4[3] == nil or slot4[4] == nil then
		return 0
	end

	if slot1 <= slot4[1].goal then
		return slot1 / slot4[1].goal * slot2
	elseif slot4[1].goal < slot1 and slot1 <= slot4[2].goal then
		slot3 = 2
	elseif slot4[2].goal < slot1 and slot1 <= slot4[3].goal then
		slot3 = 3
	elseif slot4[3].goal < slot1 and slot1 <= slot4[4].goal then
		slot3 = 4
	else
		return 100
	end

	return slot2 * (slot3 - 1) + (slot1 - slot4[slot3 - 1].goal) / (slot4[slot3].goal - slot4[slot3 - 1].goal) * slot2
end

function ActionSevenGoalWindow.close_callback(slot0)
	doStopAllActions(slot0.layer_tab)

	slot0.cur_select = nil

	if slot0.play_effect and next(slot0.play_effect or {}) ~= nil then
		for slot4 = 1, 4 do
			if slot0.play_effect[slot4] then
				slot0.play_effect[slot4]:clearTracks()
				slot0.play_effect[slot4]:removeFromParent()

				slot0.play_effect[slot4] = nil
			end
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.load_round_finish then
		slot0.load_round_finish:DeleteMe()
	end

	slot0.load_round_finish = nil

	if slot0.load_day_title then
		slot0.load_day_title:DeleteMe()
	end

	slot0.load_day_title = nil

	for slot4, slot5 in pairs(slot0.load_touch_day) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	slot0.play_effect = {}

	if slot0.item_scrollview_walfare then
		slot0.item_scrollview_walfare:DeleteMe()

		slot0.item_scrollview_walfare = nil
	end

	doStopAllActions(slot0.sevenGoalTime)
	uv0:openSevenGoalView(false)
end

ActionSevenGoalItem = class("ActionSevenGoalItem", function ()
	return ccui.Widget:create()
end)

function ActionSevenGoalItem.ctor(slot0)
	slot0.goods_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionSevenGoalItem.configUI(slot0)
	slot0.size = cc.size(641, 156)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_seven_goal_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.has_bg = slot0.main_container:getChildByName("has_bg")

	slot0.has_bg:setVisible(false)

	slot0.textGet = slot0.main_container:getChildByName("textGet")
	slot0.btn_get = slot0.main_container:getChildByName("btn_get")

	slot0.btn_get:setTitleText(TI18N("领取"))

	if slot0.btn_get:getTitleRenderer() ~= nil then
		slot2:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot0.btn_get:setVisible(false)

	slot0.btn_goto = slot0.main_container:getChildByName("btn_goto")

	slot0.btn_goto:setTitleText(TI18N("前往"))

	slot0.btn_goto_label = slot0.btn_goto:getTitleRenderer()

	if slot0.btn_goto_label ~= nil then
		slot0.btn_goto_label:enableOutline(Config.ColorData.data_color4[278], 2)
	end

	slot0.btn_goto:setVisible(false)

	slot0.half_panel = slot0.main_container:getChildByName("half_panel")

	slot0.half_panel:getChildByName("Text_1"):setString(TI18N("原价:"))

	slot0.price_1 = slot0.half_panel:getChildByName("price_1")
	slot0.btn_buy = slot0.half_panel:getChildByName("btn_buy")
	slot0.price_2 = slot0.btn_buy:getChildByName("price_2")

	slot0.half_panel:setVisible(false)
	UITool.SetTitleColor(slot0.price_2)

	slot0.title_txt = slot0.main_container:getChildByName("title_txt")
end

function ActionSevenGoalItem.setExtendData(slot0, slot1)
	slot0.serve_list = slot1.list
	slot0.type = slot1.type
	slot0.cur_day = slot1.day
	slot0.init_cur_day = slot1.init_cur_day
end

function ActionSevenGoalItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	if slot1.desc then
		slot0.title_txt:setString(slot1.desc)
	end

	for slot5, slot6 in pairs(slot0.goods_list) do
		slot6:setVisible(false)
	end

	for slot5 = 1, #slot1.award1 do
		if not slot0.goods_list[slot5] then
			slot6 = BackPackItem.new(false, true, false, 0.7, false)

			slot6:setAnchorPoint(0, 0.5)
			slot6:setSwallowTouches(false)
			slot0.goods_con:addChild(slot6)

			slot0.goods_list[slot5] = slot6
		end

		item = slot0.goods_list[slot5]

		if item then
			item:setVisible(true)
			item:setPosition((slot5 - 1) * (BackPackItem.Width * 0.7 + 25), 45)
			item:setBaseData(slot1.award1[slot5][1], slot1.award1[slot5][2])
			item:setDefaultTip()
		end
	end

	if slot0.type == 1 then
		if slot0.serve_list[slot0.data._index] then
			slot0.textGet:setString(string.format("%d/%d", slot2.value or 0, slot2.target_val or 0))
		end
	elseif slot0.type == 2 or slot0.type == 3 then
		if slot0.serve_list[slot0.data._index].progress and slot0.serve_list[slot0.data._index].progress[1] and slot0.serve_list[slot0.data._index].progress[1] then
			slot0.textGet:setString(string.format("%d/%d", slot2.value or 0, slot2.target_val or 0))
		end
	elseif slot0.type == 4 then
		slot0.btn_goto:setVisible(false)
		slot0.btn_get:setVisible(false)
		slot0.has_bg:setVisible(false)
		slot0.price_1:setString(slot1.price1)
		slot0.price_2:setString(slot1.price2)

		if slot0.serve_list[slot0.data._index].status == 0 then
			slot0.half_panel:setVisible(true)
			slot0.has_bg:setVisible(false)
			slot0.textGet:setString(TI18N("剩余: 1"))
		else
			slot0.half_panel:setVisible(false)
			slot0.has_bg:setVisible(true)
			slot0.textGet:setString(TI18N("剩余: 0"))
		end
	end

	if slot0.type ~= 4 then
		slot0.half_panel:setVisible(false)
		slot0.btn_goto:setVisible(slot0.serve_list[slot0.data._index].status == 0)
		slot0.btn_get:setVisible(slot0.serve_list[slot0.data._index].status == 1)
		slot0.has_bg:setVisible(slot0.serve_list[slot0.data._index].status == 2)

		if slot0.init_cur_day and slot0.init_cur_day < slot0.cur_day then
			slot0.btn_goto:setVisible(true)
			slot0.btn_goto:setTitleText(TI18N("未解锁"))
			setChildUnEnabled(true, slot0.btn_goto)
			slot0.btn_goto_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.btn_goto:setTouchEnabled(false)
			slot0.btn_get:setVisible(false)
			slot0.has_bg:setVisible(false)
		else
			setChildUnEnabled(false, slot0.btn_goto)
			slot0.btn_goto_label:enableOutline(Config.ColorData.data_color4[278], 2)
			slot0.btn_goto:setTouchEnabled(true)
		end
	end
end

function ActionSevenGoalItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		ActionController:getInstance():cs13602(uv0.type, uv0.cur_day, uv0.serve_list[uv0.data._index].goal_id, uv0.data._index)
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		StrongerController:getInstance():clickCallBack(uv0.data.show_icon)
		ActionController:getInstance():openSevenGoalView(false)
	end, true, 1)
	registerButtonEventListener(slot0.btn_buy, function ()
		ActionController:getInstance():cs13602(uv0.type, uv0.cur_day, uv0.data.id, uv0.data._index)
	end, true, 1)
end

function ActionSevenGoalItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.goods_list and next(slot0.goods_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.goods_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
