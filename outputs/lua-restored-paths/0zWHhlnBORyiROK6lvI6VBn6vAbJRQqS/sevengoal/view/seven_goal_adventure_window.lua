SevenGoalAdventureWindow = SevenGoalAdventureWindow or BaseClass(BaseView)
slot0 = SevenGoalController:getInstance()
slot1 = Config.DayGoalsNewData.data_group_list
slot2 = Config.DayGoalsNewData.data_make_lev_list
slot3 = Config.DayGoalsNewData.data_charge_list
slot4 = table.sort
slot5 = table.insert
slot6 = string.format

function SevenGoalAdventureWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "seven_goal/seven_goal_adventure_windown"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("seven_goals", "seven_gold"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("seven_goals/banner", "seven_goals_banner_1"),
			type = ResourcesType.single
		}
	}
end

function SevenGoalAdventureWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot2, 1)

	slot3 = slot2:getChildByName("title_banner")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("seven_goals/banner", "seven_goals_banner_1"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot2:getChildByName("Text_6"):setString(TI18N("下级奖励"))
	slot2:getChildByName("Text_10"):setString(TI18N("七日内完成每日任务升级日记，可获得对应等级奖励"))
	slot2:getChildByName("Text_7"):setString(TI18N("剩余时间："))

	slot0.time_text = slot2:getChildByName("time_text")

	slot0.time_text:setString("")

	slot5 = slot2:getChildByName("Sprite_8")

	slot5:getChildByName("Text_6_0"):setString(TI18N("等级"))

	slot0.btn_more = slot2:getChildByName("btn_more")

	slot0.btn_more:getChildByName("Text_5"):setString(TI18N("等级奖励"))

	slot0.btn_tips = slot2:getChildByName("btn_tips")
	slot0.bar = slot2:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)

	slot0.bar_num = slot2:getChildByName("bar_num")

	slot0.bar_num:setString("")

	slot0.cur_lev_num = CommonNum.new(22, slot5, 1, 1, cc.p(0.5, 0.5))

	slot0.cur_lev_num:setPosition(52, 72)

	slot6 = slot2:getChildByName("good_next")
	slot0.next_scrollview = CommonScrollViewLayout.new(slot6, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot6:getContentSize(), {
		start_y = 10,
		start_x = 0,
		need_dynamic = true,
		space_x = 30,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.6,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.6,
		item_height = BackPackItem.Height * 0.6
	})

	slot0.next_scrollview:setSwallowTouches(false)

	slot9 = slot2:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot9, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot9:getContentSize(), {
		start_y = 0,
		item_width = 616,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 150,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = SevenGoalAdventureItem
	})
	slot12 = slot2:getChildByName("total_layer")
	slot0.total_goto = slot12:getChildByName("total_goto")

	slot0.total_goto:getChildByName("Text_1"):setString(TI18N("前往"))

	slot0.total_get = slot12:getChildByName("total_get")

	slot0.total_get:getChildByName("Text_1"):setString(TI18N("领取"))
	slot0.total_get:setVisible(false)

	slot0.total_has = slot12:getChildByName("total_has")

	slot0.total_has:setVisible(false)

	slot0.total_more = slot12:getChildByName("total_more")

	slot0.total_more:getChildByName("Text_4"):setString(TI18N("查看更多"))

	slot0.total_name_charge = slot12:getChildByName("total_name_charge")

	slot0.total_name_charge:setString("")

	slot13 = slot12:getChildByName("total_cons")
	slot0.total_scrollview = CommonScrollViewLayout.new(slot13, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot13:getContentSize(), {
		start_y = 10,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.total_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot2:getChildByName("btn_close")
end

function SevenGoalAdventureWindow.commonTeskList(slot0, slot1)
	slot3 = {}
	slot0.totleChargeData = {}

	if uv0:getModel():getInitSevenGoalData() and uv1[slot1.period or uv0:getModel():getSevenGoalPeriod()] then
		for slot9, slot10 in pairs(slot2) do
			slot11 = false

			for slot15, slot16 in pairs(uv1[slot5]) do
				if slot10.id == slot16.goal_id then
					slot11 = true

					break
				end
			end

			if slot11 == true then
				uv2(slot0.totleChargeData, slot10)
			else
				uv2(slot3, slot10)
			end
		end
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:setData(slot3, nil, nil, slot5)
	end
end

function SevenGoalAdventureWindow.getTotalChargeData(slot0)
	return slot0.totleChargeData or {}
end

function SevenGoalAdventureWindow.setChangeTotleData(slot0)
	slot1 = uv0:getModel():getSevenGoalPeriod()

	if slot0:getTotalChargeData() and next(slot2) and next(slot2[1]) and uv1[slot1] then
		slot0.total_name_charge:setString(uv2("%s (%d/%d)", uv1[slot1][slot2[1].id].desc or "", slot2[1].value or 0, slot2[1].target_val or 0))
		slot0.total_goto:setVisible(slot2[1].finish == 0)
		slot0.total_get:setVisible(slot2[1].finish == 1)
		slot0.total_has:setVisible(slot2[1].finish == 2)

		if slot0.total_scrollview then
			slot7 = {}
			slot11 = slot2[1].id

			for slot11, slot12 in pairs(uv1[slot1][slot11].award) do
				table.insert(slot7, {
					bid = slot12[1],
					quantity = slot12[2]
				})
			end

			if #slot7 > 4 then
				slot0.total_scrollview:setClickEnabled(true)
			else
				slot0.total_scrollview:setClickEnabled(false)
			end

			slot0.total_scrollview:setData(slot7)
			slot0.total_scrollview:addEndCallBack(function ()
				for slot4, slot5 in pairs(uv0.total_scrollview:getItemList()) do
					slot5:setDefaultTip()
				end
			end)
		end
	end
end

function SevenGoalAdventureWindow.register_event(slot0)
	slot0:addGlobalEvent(SevenGoalEvent.BaseMessage, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:setLessTime(slot0.end_time - GameNet:getInstance():getTime())
		uv0:setChargeLevData(slot0.exp, slot0.lev)
		uv0:setMoreResPoint()
		uv0:commonTeskList(slot0)
		uv0:setChangeTotleData()
	end)
	slot0:addGlobalEvent(SevenGoalEvent.Tesk_Updata, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0.item_scrollview then
			uv0:commonTeskList(slot0)
			uv0:setChangeTotleData()
		end
	end)
	slot0:addGlobalEvent(SevenGoalEvent.Reward_Lev, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:setMoreResPoint()
	end)
	slot0:addGlobalEvent(SevenGoalEvent.Updata_Lev, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:getModel():setSevenGoalLev(slot0.lev)
		uv1:setMoreResPoint()
		uv1:setChargeLevData(slot0.exp, slot0.lev)
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openSevenGoalAdventureView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_more, function ()
		uv0:openSevenGoalAdventureLevRewardView(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.DayGoalsNewData.data_constant.tips.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, false, 1, nil, 0.8)
	registerButtonEventListener(slot0.total_goto, function ()
		StrongerController:getInstance():clickCallBack(131)
	end, true, 1)
	registerButtonEventListener(slot0.total_get, function ()
		if next(uv0:getTotalChargeData()) ~= nil and slot0[1].id then
			uv1:sender13606(slot1)
		end
	end, true, 1)
	registerButtonEventListener(slot0.total_more, function ()
		uv0:openSevenGoalTotleChargeView(true)
	end, true, 1)
end

function SevenGoalAdventureWindow.setMoreResPoint(slot0)
	slot1 = false

	addRedPointToNodeByStatus(slot0.btn_more, uv0:getModel():setMoreResPoint(), -10)
	uv0:getModel():checkMainRedPoint()
end

function SevenGoalAdventureWindow.setChargeLevData(slot0, slot1, slot2)
	if slot0.cur_lev_num then
		slot0.cur_lev_num:setNum(slot2 or 1)
	end

	if uv1[uv0:getModel():getSevenGoalPeriod()] == nil then
		return
	end

	if slot2 + 1 >= #uv1[slot3] then
		slot2 = #uv1[slot3]
	end

	slot1 = slot1 or 0
	slot4 = uv1[slot3][slot2].exp or 100

	slot0.bar_num:setString(slot1 .. "/" .. slot4)
	slot0.bar:setPercent(slot1 / slot4 * 100)

	for slot9, slot10 in pairs(uv1[slot3][slot2].reward) do
		if deepCopy(Config.ItemData.data_get_data(slot10[1])) then
			slot11.quantity = slot10[2]

			table.insert({}, slot11)
		end
	end

	if slot0.next_scrollview then
		if #slot5 > 3 then
			slot0.next_scrollview:setClickEnabled(true)
		else
			slot0.next_scrollview:setClickEnabled(false)
		end

		slot0.next_scrollview:setData(slot5)
		slot0.next_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.next_scrollview:getItemList()) do
				slot5:setDefaultTip()
			end
		end)
	end
end

function SevenGoalAdventureWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_text) then
		return
	end

	doStopAllActions(slot0.time_text)

	if (slot1 or 0) > 0 then
		slot0:setTimeFormatString(slot2)
		slot0.time_text:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_text)
				uv1.time_text:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function SevenGoalAdventureWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_text:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot1))
	else
		slot0.time_text:setString("00:00:00")
	end
end

function SevenGoalAdventureWindow.openRootWnd(slot0)
	uv0:sender13604()
end

function SevenGoalAdventureWindow.close_callback(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.next_scrollview then
		slot0.next_scrollview:DeleteMe()
	end

	slot0.next_scrollview = nil

	if slot0.cur_lev_num then
		slot0.cur_lev_num:DeleteMe()

		slot0.cur_lev_num = nil
	end

	uv0:openSevenGoalAdventureView(false)
end

SevenGoalAdventureItem = class("SevenGoalAdventureItem", function ()
	return ccui.Widget:create()
end)

function SevenGoalAdventureItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SevenGoalAdventureItem.configUI(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("seven_goal/seven_goal_adventure_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(616, 150))

	slot1 = slot0.rootWnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")
	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_1"):setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_1"):setString(TI18N("前往"))
	slot0.btn_goto:setVisible(false)

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.cur_gold = slot1:getChildByName("cur_gold")

	slot0.cur_gold:setString("")

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function SevenGoalAdventureItem.setExtendData(slot0, slot1)
	slot0.cur_item_period = slot1
end

function SevenGoalAdventureItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	if uv0[slot0.cur_item_period] == nil then
		return
	end

	if uv0[slot0.cur_item_period][slot1.id] == nil then
		return
	end

	slot0.btn_goto:setVisible(slot1.finish == 0)
	slot0.btn_get:setVisible(slot1.finish == 1)
	slot0.has_spr:setVisible(slot1.finish == 2)
	slot0.cur_gold:setString(slot1.value .. "/" .. slot1.target_val)
	slot0.title_name:setString(uv0[slot0.cur_item_period][slot1.id].desc or "")

	slot3 = {}

	for slot8, slot9 in pairs(uv0[slot0.cur_item_period][slot1.id].award or {}) do
		table.insert(slot3, {
			bid = slot9[1],
			quantity = slot9[2]
		})
	end

	if #slot3 > 4 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function SevenGoalAdventureItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_goto, function ()
		if not uv0.data and not uv0.cur_item_period then
			return
		end

		slot0 = nil

		if uv1[uv0.cur_item_period] and uv1[uv0.cur_item_period][uv0.data.id] then
			slot0 = uv1[uv0.cur_item_period][uv0.data.id].show_icon
		end

		if slot0 then
			StrongerController:getInstance():clickCallBack(slot0)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv1:sender13606(uv0.data.id)
		end
	end, true, 1)
end

function SevenGoalAdventureItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
