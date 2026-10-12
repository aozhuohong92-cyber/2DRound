PlanesafkOrderactionWindow = PlanesafkOrderactionWindow or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()
slot2 = ActionController:getInstance()
slot3 = Config.PlanesWarOrderData.data_lev_reward_list
slot4 = table.sort
slot5 = table.insert

function PlanesafkOrderactionWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "planesafk/planesafk_orderaction_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planesafkorderaction", "planesafkorderaction"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.reward_list = {}
end

function PlanesafkOrderactionWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("planes", "planes_bg", true), LOADTEXT_TYPE)
	end

	slot0.top_bg = slot0.root_wnd:getChildByName("top_bg")
	slot0.bottom_bg = slot0.root_wnd:getChildByName("bottom_bg")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.btn_open_lock = slot0.main_container:getChildByName("btn_open_lock")
	slot0.btn_open_lock_label = slot0.btn_open_lock:getChildByName("name")

	slot0.btn_open_lock_label:setString(TI18N("解锁征战之证"))

	slot0.btn_go = slot0.main_container:getChildByName("btn_go")
	slot0.btn_go_lab = slot0.btn_go:getChildByName("name")

	slot0.btn_go_lab:setString(TI18N("前往"))
	slot0.main_container:getChildByName("time_title"):setString(TI18N("重置时间："))

	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString("")

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")
	slot0.btn_rule_2 = slot0.main_container:getChildByName("btn_rule_2")

	slot0.btn_rule_2:setVisible(false)

	slot0.btn_close = slot0.main_container:getChildByName("btn_close")

	slot0.main_container:getChildByName("level_title"):setString(TI18N("通关积分："))

	slot0.level_num = slot0.main_container:getChildByName("level_num")

	slot0.level_num:setString("")

	slot0.icon_img = slot0.main_container:getChildByName("icon_img")

	slot0.main_container:getChildByName("Text_33"):setString(TI18N("长环岛冒险击败每层BOSS即可获得通关积分"))

	slot1 = slot0.main_container:getChildByName("goods_item")
	slot2 = slot1:getContentSize()
	slot0.reward_goods_item = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2, {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 720,
		item_height = 139,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		checkovercallback = handler(slot0, slot0.updateSlideShowByVertical)
	})

	slot0.reward_goods_item:setSwallowTouches(true)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.createTaskCell), ScrollViewFuncType.CreateNewCell)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTaskCells), ScrollViewFuncType.NumberOfCells)
	slot0.reward_goods_item:registerScriptHandlerSingle(handler(slot0, slot0.updateTaskCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.reward_num_item = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(100, slot2.height), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 100,
		item_height = 139,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.reward_num_item:setClickEnabled(false)
	slot0.reward_num_item:registerScriptHandlerSingle(handler(slot0, slot0.createTaskCell2), ScrollViewFuncType.CreateNewCell)
	slot0.reward_num_item:registerScriptHandlerSingle(handler(slot0, slot0.numberOfTaskCells2), ScrollViewFuncType.NumberOfCells)
	slot0.reward_num_item:registerScriptHandlerSingle(handler(slot0, slot0.updateTaskCellByIndex2), ScrollViewFuncType.UpdateCellByIndex)
	slot0:createProgress()
	slot0:adaptationScreen()
end

function PlanesafkOrderactionWindow.adaptationScreen(slot0)
	slot0.top_bg:setPositionY(display.getTop(slot0.container))
	slot0.bottom_bg:setPositionY(display.getBottom(slot0.container))
end

function PlanesafkOrderactionWindow.createProgress(slot0)
	if slot0.comp_bar == nil then
		slot1 = cc.size(315, 27)
		slot2 = PathTool.getResFrame("planesafkorderaction", "planesafkaction_4")
		slot3 = PathTool.getResFrame("planesafkorderaction", "planesafkaction_7")

		if slot0.reward_goods_item and not tolua.isnull(slot0.reward_goods_item) and slot0.reward_goods_item.container and not tolua.isnull(slot0.reward_goods_item.container) then
			slot4 = ccui.Layout:create()

			slot4:setContentSize(cc.size(27, 27))
			slot4:setAnchorPoint(0, 0)
			slot4:setRotation(90)

			if slot4 then
				slot0.reward_goods_item.container:addChild(slot4, 999)

				slot0.bar_layout = slot4
			end

			slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(slot2, slot3, slot1, slot0.bar_layout, cc.p(0, 0.5), 0, 0, true, true)
		end
	end
end

function PlanesafkOrderactionWindow.updatePercent(slot0, slot1)
	if tolua.isnull(slot0.comp_bar) or not slot1 then
		return
	end

	slot2 = uv0:getCurPeriod()

	if uv1 and uv1[slot2] then
		slot3 = uv1[slot2]
		slot4 = 0
		slot7 = 0
		slot8 = (slot0.bar_layout:getContentSize().width + 0) / (#slot3 - 1)

		for slot12, slot13 in ipairs(slot3) do
			if slot12 == 1 then
				if slot1 <= slot13.win_count then
					slot7 = slot1 / slot13.win_count * 0

					break
				else
					slot7 = slot6
				end
			elseif slot1 <= slot13.win_count then
				slot7 = slot7 + (slot1 - slot4) / (slot13.win_count - slot4) * slot8

				break
			else
				slot7 = slot7 + slot8
			end

			slot4 = slot13.win_count
		end

		slot0.comp_bar:setPercent(slot7 / slot5 * 100)
	end
end

function PlanesafkOrderactionWindow.register_event(slot0)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_OrderAction_Init_Event, function (slot0)
		uv0:setBasicInitData(slot0)
		uv1:getModel():setCountDownTime(uv0.time_text, slot0.end_time - GameNet:getInstance():getTime())
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_OrderAction_IsPopWarn_Event, function (slot0)
		if slot0 and Config.PlanesWarOrderData.data_period_day[uv0:getCurPeriod()] and (slot2.period_day - slot0.cur_day == 7 or slot3 - slot0.cur_day == 3 or slot3 - slot0.cur_day == 0) and slot0.is_pop == 1 then
			uv1:openPlanesafkEndWarnView(true, slot0.cur_day)
		end
	end)
	registerButtonEventListener(slot0.btn_open_lock, function ()
		uv0:openBuyCardView(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_go, function ()
		uv0:openPlanesafkOrderactionWindow(false)
		JumpController:getInstance():jumpViewByEvtData({
			68
		})
	end, true, 1)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openPlanesafkOrderactionWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.PlanesWarOrderData.data_constant then
			TipsManager:getInstance():showCommonTips(slot3.rule_desc.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, false, 1)
	registerButtonEventListener(slot0.btn_rule_2, function (slot0, slot1, slot2)
		if Config.PlanesWarOrderData.data_constant then
			TipsManager:getInstance():showCommonTips(slot3.rule_desc_2.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, false, 1)
end

function PlanesafkOrderactionWindow.createTaskCell(slot0)
	return PlanesafkOrderActiodRewardItem.new()
end

function PlanesafkOrderactionWindow.numberOfTaskCells(slot0)
	if not slot0.reward_list then
		return 0
	end

	return #slot0.reward_list
end

function PlanesafkOrderactionWindow.updateTaskCellByIndex(slot0, slot1, slot2)
	if not slot0.reward_list then
		return
	end

	if not slot0.reward_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function PlanesafkOrderactionWindow.updateSlideShowByVertical(slot0)
	if slot0.reward_goods_item:getCurContainerPosY() and slot0.reward_num_item and not tolua.isnull(slot0.reward_num_item) and slot0.reward_num_item.container and not tolua.isnull(slot0.reward_num_item.container) then
		slot0.reward_num_item.container:setPositionY(slot1)
		slot0.reward_num_item:checkRectIntersectsRect()
	end
end

function PlanesafkOrderactionWindow.createTaskCell2(slot0)
	return PlanesafkOrderActiodRewardItem2.new()
end

function PlanesafkOrderactionWindow.numberOfTaskCells2(slot0)
	if not slot0.reward_list then
		return 0
	end

	return #slot0.reward_list
end

function PlanesafkOrderactionWindow.updateTaskCellByIndex2(slot0, slot1, slot2)
	if not slot0.reward_list then
		return
	end

	if not slot0.reward_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function PlanesafkOrderactionWindow.updateIconImg(slot0, slot1)
	if tolua.isnull(slot0.icon_img) or tolua.isnull(slot0.btn_open_lock) then
		return
	end

	loadSpriteTexture(slot0.icon_img, PathTool.getResFrame("planesafkorderaction", "planesafkaction_14"), LOADTEXT_TYPE_PLIST)

	if slot1 == 1 then
		setChildUnEnabled(false, slot0.icon_img)
	else
		setChildUnEnabled(true, slot0.icon_img)
	end

	if slot1 == 1 then
		slot0.btn_open_lock:setVisible(false)
	else
		slot0.btn_open_lock:setVisible(true)
	end
end

function PlanesafkOrderactionWindow.jumpToMoveByY(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 < 0 then
		slot2 = 0
	end

	if slot2 * 100 / ((#slot0.reward_list or 1) * 139) > 100 then
		slot4 = 100
	end

	slot0.reward_goods_item:scrollToPercentVertical(slot4, 0.5, true)
end

function PlanesafkOrderactionWindow.setChangeLevelStatus(slot0, slot1)
	slot2 = uv0:getCurPeriod()

	if uv1 and uv1[slot2] then
		slot0.reward_list = {}

		for slot6, slot7 in pairs(uv1[slot2]) do
			slot7.cur_lev = slot1
			slot7.status = 0
			slot7.rmb_status = 0
			slot7.is_locak = uv0:getGiftStatus()

			if uv0:getLevShowData(slot7.lev) then
				slot7.status = slot8.award_status
				slot7.rmb_status = slot8.rmb_award_status
			end

			uv2(slot0.reward_list, slot7)
		end

		if next(slot0.reward_list) == nil then
			slot0.reward_goods_item:reloadData()
			slot0.reward_num_item:reloadData()
		else
			uv3(slot0.reward_list, function (slot0, slot1)
				return slot0.lev < slot1.lev
			end)
			slot0.reward_goods_item:reloadData()
			slot0.reward_num_item:reloadData()
		end

		if slot0.comp_bar_bg and not tolua.isnull(slot0.comp_bar_bg) and slot0.comp_bar and not tolua.isnull(slot0.comp_bar) and slot0.bar_layout and not tolua.isnull(slot0.bar_layout) then
			slot3 = #slot0.reward_list or 1

			slot0.comp_bar_bg:setContentSize(cc.size(139 * (slot3 - 1), 27))
			slot0.comp_bar:setContentSize(cc.size(139 * (slot3 - 1), 15))
			slot0.bar_layout:setPosition(cc.p(50, 139 * (slot3 - 1) + 69.5))
			slot0:updatePercent(uv0:getWinCounts())
		end
	end

	if (#slot0.reward_list or 1) <= (slot1 or 1) + 2 then
		slot3 = slot4 + 1
	end

	slot0:jumpToMoveByY(139 * (slot3 - 1))
end

function PlanesafkOrderactionWindow.setBasicInitData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.lev or 0
	slot4 = uv0:getCurPeriod()

	if slot0.level_num and not tolua.isnull(slot0.level_num) then
		slot0.level_num:setString(slot1.win_count or 0)
	end

	slot0:setChangeLevelStatus(slot2)
	slot0:updateIconImg(slot1.rmb_status)
end

function PlanesafkOrderactionWindow.openRootWnd(slot0)
	uv0:setOrderactionRedStatus(0)
	uv0:checkPlanesafkRedPoint()
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Planesafk_OrderAction_First_Red_Event)
	uv1:sender28616()
	uv1:sender28619()
end

function PlanesafkOrderactionWindow.close_callback(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.reward_goods_item then
		slot0.reward_goods_item:DeleteMe()

		slot0.reward_goods_item = nil
	end

	if slot0.reward_num_item then
		slot0.reward_num_item:DeleteMe()

		slot0.reward_num_item = nil
	end

	uv0:openPlanesafkOrderactionWindow(false)
end

PlanesafkOrderActiodRewardItem = class("PlanesafkOrderActiodRewardItem", function ()
	return ccui.Widget:create()
end)

function PlanesafkOrderActiodRewardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PlanesafkOrderActiodRewardItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("planesafk/planesafk_orderaction_reward_item"))

	slot0:setContentSize(cc.size(720, 139))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.goods_item = slot1:getChildByName("goods_item")

	slot0.goods_item:setScrollBarEnabled(false)

	slot0.finish_img = slot1:getChildByName("finish_img")

	slot0.finish_img:setVisible(false)

	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_name = slot0.btn_get:getChildByName("name")

	slot0.btn_name:setString("")

	slot0.common_goods_item = BackPackItem.new(nil, true, nil, 0.8, nil, true)

	slot1:addChild(slot0.common_goods_item)
	slot0.common_goods_item:setPosition(cc.p(170, 69.5))
end

function PlanesafkOrderActiodRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			if uv0.data.status == 0 or uv0.data.rmb_status == 0 and uv0.data.is_locak == 1 then
				uv1:sender28617(0)
			elseif uv0.data.status == 1 and uv0.data.rmb_status == 1 then
				message(TI18N("奖励已领取"))
			else
				uv1:openBuyCardView(true)
			end
		end
	end, true, 1)
end

function PlanesafkOrderActiodRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = true

	if slot0.common_goods_item and not tolua.isnull(slot0.common_goods_item) then
		if slot1.reward and slot1.reward[1] then
			slot0.common_goods_item:setBaseData(slot1.reward[1][1], slot1.reward[1][2])
			slot0.common_goods_item:setVisible(true)
		else
			slot0.common_goods_item:setVisible(false)
		end

		if slot1.status == 1 then
			slot0.common_goods_item:IsGetStatus(true, nil, PathTool.getResFrame("planesafkorderaction", "txt_cn_planesafkaction_1"))
		else
			slot0.common_goods_item:IsGetStatus(false)
		end
	end

	slot3 = true

	if slot1.lev <= slot1.cur_lev then
		slot2 = false

		if slot1.is_locak == 1 then
			slot3 = false
		else
			slot3 = true
		end
	else
		slot2 = true
		slot3 = true
	end

	if slot2 == false then
		if slot1.status == 1 then
			slot0.common_goods_item:showItemEffect(false)
		else
			slot0.common_goods_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
		end
	else
		slot0.common_goods_item:showItemEffect(false)
	end

	slot4 = true
	slot5 = nil

	if uv0:getGiftStatus() == 1 and slot1.rmb_status == 0 and slot1.lev <= slot1.cur_lev then
		slot4 = false
	end

	if slot4 == false then
		slot5 = 263
	end

	slot6 = false

	if slot1.rmb_status == 1 then
		slot6 = true
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.goods_item, slot0.item_list, slot1.rmb_reward or {}, {
		start_x = 10,
		scale = 0.8,
		max_count = 3,
		lock = slot3,
		lock_pos = cc.p(59.5, 59.5),
		is_tip = true,
		show_effect_id = slot5,
		is_get_status = slot6,
		get_status_res = PathTool.getResFrame("planesafkorderaction", "txt_cn_planesafkaction_1")
	})

	if slot0.btn_get then
		addRedPointToNodeByStatus(slot0.btn_get, false, 5, 5)

		if slot1.cur_lev < slot1.lev then
			setChildUnEnabled(true, slot0.btn_get)
			slot0.btn_get:setTouchEnabled(false)
			slot0.btn_name:setString(TI18N("领取"))
			slot0.btn_name:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.btn_get:setVisible(true)
			slot0.finish_img:setVisible(false)
		elseif slot1.status == 0 or slot1.rmb_status == 0 and slot1.is_locak == 1 then
			setChildUnEnabled(false, slot0.btn_get)
			slot0.btn_get:setTouchEnabled(true)
			slot0.btn_name:setString(TI18N("可领取"))
			slot0.btn_name:enableOutline(Config.ColorData.data_color4[264], 2)
			slot0.btn_get:setVisible(true)
			slot0.finish_img:setVisible(false)
			addRedPointToNodeByStatus(slot0.btn_get, true, 5, 5)
		elseif slot1.status == 1 and slot1.rmb_status == 1 then
			slot0.btn_get:setVisible(false)
			slot0.finish_img:setVisible(true)
		else
			setChildUnEnabled(false, slot0.btn_get)
			slot0.btn_get:setTouchEnabled(true)
			slot0.btn_name:setString(TI18N("继续领取"))
			slot0.btn_name:enableOutline(Config.ColorData.data_color4[264], 2)
			slot0.btn_get:setVisible(true)
			slot0.finish_img:setVisible(false)
		end
	end
end

function PlanesafkOrderActiodRewardItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.common_goods_item then
		slot0.common_goods_item:DeleteMe()

		slot0.common_goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

PlanesafkOrderActiodRewardItem2 = class("PlanesafkOrderActiodRewardItem2", function ()
	return ccui.Widget:create()
end)

function PlanesafkOrderActiodRewardItem2.ctor(slot0)
	slot0.size = cc.size(100, 139)

	slot0:configUI()
	slot0:register_event()
end

function PlanesafkOrderActiodRewardItem2.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.select_bg = createImage(slot0.root_wnd, PathTool.getResFrame("planesafkorderaction", "planesafkaction_2"), slot0.size.width / 2, slot0.size.height / 2 + 6, cc.p(0.5, 0.5), true)
	slot0.select_img = createImage(slot0.root_wnd, PathTool.getResFrame("planesafkorderaction", "planesafkaction_1"), slot0.size.width / 2, slot0.size.height / 2 + 6, cc.p(0.5, 0.5), true)

	slot0.select_img:setVisible(false)

	slot0.num_bg = createImage(slot0.root_wnd, PathTool.getResFrame("planesafkorderaction", "planesafkaction_11"), slot0.size.width / 2, slot0.size.height / 5 + 11, cc.p(0.5, 0.5), true, nil, true)

	slot0.num_bg:setCapInsets(cc.rect(19, 17, 2, 2))
	slot0.num_bg:setContentSize(cc.size(71, 37))

	slot0.num_txt = createLabel(20, Config.ColorData.data_color4[1], nil, slot0.size.width / 2 - 2, slot0.size.height / 5 + 11, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
end

function PlanesafkOrderActiodRewardItem2.register_event(slot0)
end

function PlanesafkOrderActiodRewardItem2.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.num_txt:setString(tostring(slot1.win_count or 0))

	if slot1.lev <= slot1.cur_lev then
		slot0.select_img:setVisible(true)
	else
		slot0.select_img:setVisible(false)
	end
end

function PlanesafkOrderActiodRewardItem2.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
