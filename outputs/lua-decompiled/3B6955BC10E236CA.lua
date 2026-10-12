LimitExerciseChangeWindow = LimitExerciseChangeWindow or BaseClass(BaseView)
slot1 = LimitExerciseController:getInstance():getModel()
slot2 = Config.HolidayBossNewData.data_change_boss_list
slot3 = Config.HolidayBossNewData.data_lev_reward_list
slot4 = math.floor
slot5 = math.abs
slot6 = table.insert
slot7 = table.sort
slot8 = string.format
slot9 = {
	{
		0,
		320
	},
	{
		320,
		1047
	},
	{
		1047,
		1500
	}
}
slot10 = Config.HolidayBossNewData.data_const.start_fight_count.val
slot11 = {
	cc.c4b(100, 50, 35, 255),
	cc.c4b(108, 43, 0, 255)
}

function LimitExerciseChangeWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "limitexercise/limitexercise_change_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("limitexercise", "limitexercise"),
			type = ResourcesType.plist
		}
	}
	slot0.cur_order_type = nil
	slot0.cur_order_id = nil
	slot0.cur_box_status = nil
	slot0.scrollview_bar = nil
end

function LimitExerciseChangeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("bg")

	if not slot0.change_load_bg then
		slot0.change_load_bg = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/limitexercise", "limit_exercise_bg1"), ResourcesType.single, slot0.change_load_bg)

		slot2:setScale(display.getMaxScale())
	end

	slot1:getChildByName("Text_10"):setString(TI18N("本轮挑战剩余："))

	slot0.ramain_time = slot1:getChildByName("ramain_time")

	slot0.ramain_time:setString("")

	slot0.level_area_text = slot1:getChildByName("level_area_text")
	slot7 = ""

	slot0.level_area_text:setString(slot7)

	slot0.left_scrollview_pos = {}

	for slot7 = 1, 3 do
		slot0.left_scrollview_pos[slot7] = slot1:getChildByName("sroll_spr_" .. slot7):getPositionY()
	end

	slot0.sroll_main_spr = slot1:getChildByName("sroll_main_spr")

	slot0.sroll_main_spr:setOpacity(0)

	slot0.level_num = slot1:getChildByName("level_num")

	slot0.level_num:setString("")
	slot1:getChildByName("level_area_text_0_0"):setString(TI18N("难度"))

	slot0.item_area = slot1:getChildByName("item_area")
	slot0.level_msg = slot1:getChildByName("level_msg")
	slot0.btn_change = slot0.level_msg:getChildByName("btn_change")
	slot0.btn_change_text = slot0.btn_change:getChildByName("Text_4")

	slot0.btn_change_text:setString(TI18N("挑战"))

	slot0.btn_box = slot0.level_msg:getChildByName("btn_box")
	slot0.box_sprite = slot0.btn_box:getChildByName("box_sprite")

	slot0.box_sprite:setAnchorPoint(0.5, 0.5)
	slot0.box_sprite:setPositionY(49)
	slot0.level_msg:getChildByName("Text_8"):setString(TI18N("下一阶段奖励"))

	slot0.level_text = slot0.level_msg:getChildByName("level_text")

	slot0.level_text:setString("")
	slot0.level_msg:getChildByName("level_tips_text"):setString(TI18N("关卡效果"))

	slot0.level_effect_desc = createRichLabel(22, uv0[1], cc.p(0, 0.5), cc.p(229, 130), nil, nil, 500)

	slot0.level_msg:addChild(slot0.level_effect_desc)

	slot0.power = slot0.level_msg:getChildByName("power")

	slot0.power:setString(TI18N("推荐战力："))

	slot0.change_item = slot0.level_msg:getChildByName("change_item")

	slot0.change_item:setScrollBarEnabled(false)

	slot0.btn_rule = slot1:getChildByName("btn_rule")

	slot0.btn_rule:setScale(0.8)

	slot4 = slot1:getChildByName("bottom_panel")

	slot4:getChildByName("count_title"):setString(TI18N("挑战次数:"))

	slot0.remain_count = slot4:getChildByName("remain_count")

	slot0.remain_count:setString("剩余购买次数：")

	slot0.change_count = slot4:getChildByName("count_label")

	slot0.change_count:setString("")

	slot0.add_btn = slot4:getChildByName("add_btn")
	slot0.btn_close = slot4:getChildByName("btn_close")
end

function LimitExerciseChangeWindow.openRootWnd(slot0)
	slot0:createAreaList()

	if uv0:getLimitExerciseData() == nil then
		uv1:send25410()
	else
		slot1 = uv0:getLimitExerciseData()

		slot0:setRoundHero(slot1.difficulty, slot1.count)
		slot0:remainBuyCount(slot1.buy_count)
		slot0:setCountDownTime(slot0.ramain_time, slot1.endtime - GameNet:getInstance():getTime())
		slot0:levelBoxStatus(slot1.status, slot1.order)
		slot0:showBossMessageItem(slot1.difficulty)
		slot0:scrollviewSprintBar(slot0:getCurrentPos(uv2(slot0.item_innercontainer:getPositionY())))
	end

	uv1:send25414()
end

function LimitExerciseChangeWindow.createAreaList(slot0)
	if not slot0.item_scrollview then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_area, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.bottom, slot0.item_area:getContentSize(), {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_width = 720,
			space_y = 0,
			col = 1,
			need_dynamic = true,
			item_height = LimitExerciseChangeItem.HeightItem,
			checkovercallback = handler(slot0, slot0.updateSlideShowByVertical)
		})

		slot0.item_scrollview:setSwallowTouches(true)

		slot0.item_innercontainer = slot0.item_scrollview:getContainer()

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createAreaChangeCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfAreaChangeCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateAreaChangeCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end
end

function LimitExerciseChangeWindow.showBossMessageItem(slot0, slot1)
	round = uv0:getCurrentRound()
	slot1 = slot1 or 1

	if slot0.item_scrollview and uv1[round] and uv1[round][slot1] then
		slot0.area_list = {}
		slot5 = round

		for slot5, slot6 in pairs(uv1[slot5][slot1]) do
			uv2(slot0.area_list, slot6)
		end

		slot3 = 1

		if uv0:getCurrentType() then
			slot3 = slot2
		end

		slot0.item_scrollview:reloadData(slot3)
		slot0.sroll_main_spr:setPositionY(slot0.left_scrollview_pos[slot3])
	end
end

function LimitExerciseChangeWindow.createAreaChangeCell(slot0)
	slot1 = LimitExerciseChangeItem.new()

	slot1:addCallBack(function (slot0, slot1, slot2)
		uv0:onCellTouched(uv1, slot0, slot1, slot2)
	end)

	return slot1
end

function LimitExerciseChangeWindow.onCellTouched(slot0, slot1, slot2, slot3, slot4)
	if not slot1.index then
		return
	end

	if not slot0.area_list[slot1.index] then
		return
	end

	slot0.view_order_type = slot2
	slot0.view_order_id = slot3

	for slot10, slot11 in pairs(slot0.item_scrollview:getActiveCellList()) do
		slot11:setTouchKuangVisible(false)
	end

	slot0.select_index = slot1.index

	slot1:setTouchKuangPos(true)
	slot0:getLevelMessage(slot2, slot3)
end

function LimitExerciseChangeWindow.numberOfAreaChangeCells(slot0)
	if not slot0.area_list then
		return 0
	end

	return #slot0.area_list
end

function LimitExerciseChangeWindow.updateAreaChangeCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.area_list then
		return
	end

	if not slot0.area_list[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot0.view_order_type == nil or slot0.view_order_id == nil then
		slot1:setItemIndex()
	end

	if slot0.select_index and slot0.select_index == slot2 then
		slot1:setTouchKuangPos(true)
	else
		slot1:setTouchKuangPos(false)
	end
end

function LimitExerciseChangeWindow.updateSlideShowByVertical(slot0)
	if slot0.item_scrollview then
		slot2 = slot0:getCurrentPos(uv0(slot0.item_innercontainer:getPositionY()))

		slot0:scrollviewSprintBar(slot2)
		slot0.level_area_text:setString(LimitExerciseConstants.type[slot2])
	end
end

function LimitExerciseChangeWindow.scrollviewSprintBar(slot0, slot1)
	if slot0.scrollview_bar == slot1 then
		return
	end

	slot0.scrollview_bar = slot1

	doStopAllActions(slot0.sroll_main_spr)
	slot0.sroll_main_spr:runAction(cc.Sequence:create(cc.FadeOut:create(0.3), cc.Spawn:create(cc.FadeIn:create(0.3), cc.MoveTo:create(0.001, cc.p(41, slot0.left_scrollview_pos[slot1]))), cc.ScaleTo:create(0.1, 1.2), cc.ScaleTo:create(0.1, 1)))
end

function LimitExerciseChangeWindow.getCurrentPos(slot0, slot1)
	slot2 = 1

	if uv0[1][1] <= slot1 and slot1 <= uv0[1][2] then
		slot2 = 1
	elseif uv0[2][1] <= slot1 and slot1 <= uv0[2][2] then
		slot2 = 2
	elseif uv0[3][1] <= slot1 and slot1 <= uv0[3][2] then
		slot2 = 3
	end

	return slot2
end

function LimitExerciseChangeWindow.getLevelMessage(slot0, slot1, slot2)
	if slot0.cur_order_type == (slot1 or 1) and slot0.cur_order_id == (slot2 or uv0:getCurrentChangeID()) then
		return
	end

	slot4 = uv0:getCurrentDiff()

	if not uv0:getCurrentRound() then
		return
	end

	slot0.level_area_text:setString(LimitExerciseConstants.type[slot1])

	if uv1[slot3] and uv1[slot3][slot4] then
		slot5 = uv1[slot3][slot4]

		if slot2 >= 15 then
			slot2 = 15
		end

		if slot5[slot1] and slot5[slot1][slot2] then
			slot6 = slot5[slot1][slot2].order_id

			slot0.level_text:setString(TI18N("第") .. slot6 .. TI18N("关"))

			if slot6 == uv0:getCurrentChangeID() then
				setChildUnEnabled(false, slot0.btn_change)
				slot0.btn_change:setTouchEnabled(true)
				slot0.btn_change_text:enableOutline(uv2[2], 2)
			else
				setChildUnEnabled(true, slot0.btn_change)
				slot0.btn_change:setTouchEnabled(false)
				slot0.btn_change_text:disableEffect(cc.LabelEffect.OUTLINE)
			end

			slot8 = slot5[slot1][slot2].add_skill_decs or {}

			for slot12 = 1, #slot8 do
				slot7 = "" .. slot8[slot12] .. "\n"
			end

			slot0.level_effect_desc:setString(slot7)
			slot0.power:setString(TI18N("推荐战力：") .. (slot5[slot1][slot2].power or 0))

			if slot0.cur_order_type ~= slot1 then
				slot10 = slot0:getBoxRewardID(slot2)

				if uv3[slot4] and uv3[slot4][slot10] then
					slot0.level_item_list = commonShowSingleRowItemList(slot0.change_item, slot0.level_item_list, uv3[slot4][slot10].reward or {}, {
						scale = 0.6,
						max_count = 3,
						is_center = true,
						show_effect_id = 263
					})
				end
			end
		end
	end

	slot0.cur_order_type = slot1
	slot0.cur_order_id = slot2
end

function LimitExerciseChangeWindow.getBoxRewardID(slot0, slot1)
	slot3 = 1

	if uv1[uv0:getCurrentDiff()] then
		for slot7 = 1, 3 do
			if slot1 <= uv1[slot2][1].order_id then
				slot3 = 1
			elseif uv1[slot2][1].order_id < slot1 and slot1 <= uv1[slot2][2].order_id then
				slot3 = 2
			elseif uv1[slot2][2].order_id < slot1 then
				slot3 = 3
			end
		end
	end

	return slot3
end

function LimitExerciseChangeWindow.levelBoxStatus(slot0, slot1, slot2)
	if slot0.cur_box_status == slot1 then
		return
	end

	slot0.cur_box_status = slot1

	loadSpriteTexture(slot0.box_sprite, PathTool.getResFrame("limitexercise", "limitexercise_box" .. slot0:getBoxRewardID(slot2)), LOADTEXT_TYPE_PLIST)

	if slot1 == 1 then
		doStopAllActions(slot0.box_sprite)

		slot4 = cc.RotateTo:create(0.1, 10)
		slot5 = cc.RotateTo:create(0.1, -10)

		slot0.box_sprite:runAction(cc.RepeatForever:create(cc.Sequence:create(slot4, slot5, slot4, slot5, slot4, slot5, cc.RotateTo:create(0.1, 0), cc.DelayTime:create(1))))
	elseif slot1 == 2 then
		doStopAllActions(slot0.box_sprite)
	end
end

function LimitExerciseChangeWindow.register_event(slot0)
	slot0:addGlobalEvent(LimitExerciseEvent.LimitExercise_Message_Event, function (slot0)
		uv0:setRoundHero(slot0.difficulty, slot0.count)
		uv0:remainBuyCount(slot0.buy_count)
		uv0:setCountDownTime(uv0.ramain_time, slot0.endtime - GameNet:getInstance():getTime())
		uv0:levelBoxStatus(slot0.status, slot0.order)
		uv0:showBossMessageItem(slot0.difficulty)
		uv0:getLevelMessage(slot0.order_type, slot0.order)
	end)
	slot0:addGlobalEvent(LimitExerciseEvent.LimitExercise_GetBox_Event, function (slot0)
		if slot0 and slot0.code == 1 then
			uv0:levelBoxStatus(2, 15)
		end
	end)
	slot0:addGlobalEvent(LimitExerciseEvent.LimitExercise_BuyCount_Event, function (slot0)
		if slot0 then
			uv1:setRoundHero(uv0:getCurrentDiff(), slot0.count)
			uv1:remainBuyCount(slot0.buy_count)
		end
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openLimitExerciseChangeView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_change, function ()
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.LimitExercise)
	end, true)
	registerButtonEventListener(slot0.btn_rule, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.HolidayBossNewData.data_explain, TI18N("规则说明"))
	end, true, 1, nil, 0.8)
	registerButtonEventListener(slot0.btn_box, function ()
		if uv0:getBoxStatus() == 1 then
			uv1:send25412()
		else
			uv1:openLimitExerciseRewardView(true)
		end
	end, true)
	registerButtonEventListener(slot0.add_btn, function ()
		if not Config.HolidayBossNewData.data_const then
			return
		end

		if slot0.fight_buy_max_count.val <= uv0:getDayBuyCount() then
			message(TI18N("已达今日购买最大值"))

			return
		end

		CommonAlert.show(uv1(TI18N("是否花费 <img src='%s' scale=0.3 />%s购买一次挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), slot0.action_num_espensive.val), TI18N("确定"), function ()
			uv0:send25411()
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end, true)
end

function LimitExerciseChangeWindow.remainBuyCount(slot0, slot1)
	if slot0.remain_count then
		slot2 = 0

		if Config.HolidayBossNewData.data_const.fight_buy_max_count and slot3.val then
			if slot3.val - (slot1 or 0) <= 0 then
				slot2 = 0
			end

			slot0.remain_count:setString("剩余购买次数：" .. slot2)
		end
	end
end

function LimitExerciseChangeWindow.setRoundHero(slot0, slot1, slot2)
	slot0.level_num:setString(slot1 or 1)
	slot0.change_count:setString(slot2 or 0)
end

function LimitExerciseChangeWindow.setCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 > 0 then
		slot0:setTimeFormatString(slot1, slot2)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString("00:00:00")
			else
				uv2:setTimeFormatString(uv1, uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1, slot2)
	end
end

function LimitExerciseChangeWindow.setTimeFormatString(slot0, slot1, slot2)
	if slot2 > 0 then
		slot1:setString(TimeTool.GetTimeFormatDay(slot2))
	else
		doStopAllActions(slot1)
		slot1:setString("00:00:00")
	end
end

function LimitExerciseChangeWindow.close_callback(slot0)
	if slot0.change_load_bg then
		slot0.change_load_bg:DeleteMe()
	end

	slot0.change_load_bg = nil

	doStopAllActions(slot0.ramain_time)
	doStopAllActions(slot0.box_sprite)
	doStopAllActions(slot0.sroll_main_spr)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.level_item_list then
		for slot4, slot5 in pairs(slot0.level_item_list) do
			slot5:DeleteMe()
		end

		slot0.level_item_list = nil
	end

	uv0:openLimitExerciseChangeView(false)
end

LimitExerciseChangeItem = class("LimitExerciseChangeItem", function ()
	return ccui.Widget:create()
end)
LimitExerciseChangeItem.HeightItem = 568

function LimitExerciseChangeItem.ctor(slot0)
	slot0.btn_master = {}

	slot0:configUI()
	slot0:register_event()
end

function LimitExerciseChangeItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("limitexercise/limitexercise_change_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(720, LimitExerciseChangeItem.HeightItem))

	slot5 = "touch_kuang"
	slot0.touch_kuang = slot0.root_wnd:getChildByName("main_container"):getChildByName(slot5)

	for slot5 = 1, 5 do
		slot6 = {
			btn = slot1:getChildByName("btn_master_" .. slot5),
			hero_item = HeroExhibitionItem.new(0.9, true, 0, false)
		}

		slot6.hero_item:addCallBack(function ()
			uv0:onClickHeroItem(uv1)
		end)
		slot6.hero_item:setPosition(49, 49)
		slot6.btn:addChild(slot6.hero_item)

		slot6.name = slot6.btn:getChildByName("name")

		slot6.name:setString("")

		slot6.bar = slot6.btn:getChildByName("bar")

		slot6.bar:setScale9Enabled(true)
		slot6.bar:setPercent(0)

		slot6.bar_num = slot6.btn:getChildByName("bar_num")

		slot6.bar_num:setString("")

		slot6.kill_spr = slot6.btn:getChildByName("kill_spr")

		slot6.kill_spr:setLocalZOrder(10)
		slot6.kill_spr:setVisible(false)

		slot6.lock_spr = slot6.btn:getChildByName("lock_spr")

		slot6.lock_spr:setLocalZOrder(10)
		slot6.lock_spr:setVisible(false)

		if slot5 == 5 then
			slot6.btn:getChildByName("boss_spr"):setLocalZOrder(10)
		end

		slot6.index = slot5
		slot0.btn_master[slot5] = slot6
	end
end

function LimitExerciseChangeItem.setTouchKuangPos(slot0, slot1)
	if slot0.touch_kuang then
		if slot1 then
			if slot0.item_index then
				slot0.touch_kuang:setPosition(slot0.btn_master[slot0.item_index].btn:getPositionX() - 25, slot0.btn_master[slot0.item_index].btn:getPositionY() - 4)
				slot0.touch_kuang:setVisible(true)
			end
		else
			slot0.touch_kuang:setVisible(false)
		end
	end
end

function LimitExerciseChangeItem.setTouchKuangVisible(slot0, slot1)
	if slot0.touch_kuang then
		slot0.touch_kuang:setVisible(slot1)
	end
end

function LimitExerciseChangeItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:setGuardData(slot1)
end

function LimitExerciseChangeItem.setGuardData(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		uv0(slot2, slot7)
	end

	function slot6(slot0, slot1)
		return slot0.sort_id < slot1.sort_id
	end

	uv1(slot2, slot6)

	slot0.data = slot1

	for slot6 = 1, #slot2 do
		if slot0.btn_master[slot6] then
			slot0.btn_master[slot6].hero_item:setHeadImg(slot2[slot6].head_id)
			slot0.btn_master[slot6].hero_item:setQualityImg(slot2[slot6].star)
			slot0.btn_master[slot6].hero_item:setLev(slot2[slot6].master_lev)
			slot0.btn_master[slot6].name:setString(slot2[slot6].name)

			slot7, slot8 = slot0:getHeroHp(slot2[slot6].order_id)

			slot0.btn_master[slot6].bar_num:setString(uv2("%d%%", slot7))
			slot0.btn_master[slot6].bar:setPercent(slot7)

			if slot8 == true then
				slot0.btn_master[slot6].lock_spr:setVisible(false)
			else
				slot0.btn_master[slot6].lock_spr:setVisible(slot7 == 100)
			end

			slot0.btn_master[slot6].kill_spr:setVisible(slot7 == 0)
			setChildUnEnabled(slot7 == 0, slot0.btn_master[slot6].hero_item)
		end
	end
end

function LimitExerciseChangeItem.getHeroHp(slot0, slot1)
	if not uv0:getCurrentChangeID() or not uv0:getCurrentBossHp() then
		return 0
	end

	slot4 = 0
	slot5 = false

	if slot1 < slot2 then
		slot4 = 0
	elseif slot1 == slot2 then
		slot4 = slot3 * 0.001
		slot5 = true
	elseif slot2 < slot1 then
		slot4 = 100
	end

	return slot4, slot5
end

function LimitExerciseChangeItem.onClickHeroItem(slot0, slot1)
	slot0:funcCallBack(slot0.data, slot1)
end

function LimitExerciseChangeItem.register_event(slot0)
	if slot0.data then
		for slot4, slot5 in pairs(slot0.btn_master) do
			registerButtonEventListener(slot5.btn, function ()
				uv0:funcCallBack(uv0.data, uv1.index)
			end, false)
		end
	end
end

function LimitExerciseChangeItem.funcCallBack(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot0.callback then
		slot3, slot4 = nil

		for slot8, slot9 in pairs(slot1) do
			if slot9.sort_id == slot2 then
				slot3 = slot9.order_type
				slot4 = slot9.order_id

				break
			end
		end

		if slot3 and slot4 then
			slot0.item_index = slot2

			slot0.callback(slot3, slot4, slot2)
		end
	end
end

function LimitExerciseChangeItem.setItemIndex(slot0)
	slot1 = 1

	if slot0.data and uv0:getCurrentChangeID() then
		for slot6, slot7 in pairs(slot0.data) do
			if slot7.order_id == slot2 then
				slot1 = slot7.sort_id

				break
			end
		end
	end

	slot0.item_index = slot1
end

function LimitExerciseChangeItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function LimitExerciseChangeItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
