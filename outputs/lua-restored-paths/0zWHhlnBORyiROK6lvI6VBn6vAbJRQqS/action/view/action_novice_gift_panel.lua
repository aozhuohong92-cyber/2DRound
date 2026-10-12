ActionNoviceGiftPanel = class("ActionNoviceGiftPanel", function (...)
	return ccui.Widget:create()
end)

function ActionNoviceGiftPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.action_type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.cell_data_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionNoviceGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_novice_gift_panel"))

	slot0.root_wnd:setPosition(-40, -145)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.time_val = slot0.title_con:getChildByName("time_val")
	slot0.time_title = slot0.title_con:getChildByName("time_title")
	slot0.good_cons = slot0.main_container:getChildByName("charge_con")
	slot0.battle_preview_btn = slot0.title_con:getChildByName("battle_preview_btn")

	slot0.battle_preview_btn:setOpacity(0)
	slot0.battle_preview_btn:setTouchEnabled(false)

	slot0.preview_btn_label = slot0.battle_preview_btn:getChildByName("preview_btn_label")

	slot0.preview_btn_label:setString(TI18N("战斗预览"))
	slot0.preview_btn_label:enableOutline(cc.c3b(0, 0, 0), 2)
	slot0.preview_btn_label:setOpacity(0)
	slot0.preview_btn_label:setTouchEnabled(false)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.title_img = slot0.title_con:getChildByName("title_img")

	if (slot0.holiday_bid ~= nil or slot0.holiday_bid ~= 0 and slot0.action_type ~= nil or slot0.action_type ~= 0) and slot0.ctrl:getActionSubTabVo(slot0.holiday_bid) then
		if slot1.reward_title == "" then
			slot1.reward_title = "txt_cn_welfare_banner127"
		end

		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getWelfareBannerRes(slot1.reward_title, false), ResourcesType.single, slot0.item_load1)
		end
	end

	slot0:updateScrollviewList()
end

function ActionNoviceGiftPanel.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 0,
			delay = 4,
			space_x = 0,
			space_y = 5,
			col = 1,
			item_width = ActionNoviceGiftItem.Width,
			item_height = ActionNoviceGiftItem.Height
		}, cc.p(0, 0))

		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.child_scrollview:setSwallowTouches(false)
	slot0.child_scrollview:reloadData()
end

function ActionNoviceGiftPanel.createNewCell(slot0, slot1, slot2)
	return ActionNoviceGiftItem.new()
end

function ActionNoviceGiftPanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionNoviceGiftPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list then
		return
	end

	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionNoviceGiftPanel.createList(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}
	slot0.everyday_data = nil

	for slot6, slot7 in ipairs(slot1.aim_list) do
		if slot7.aim == 99 then
			slot0.everyday_data = slot7
		else
			slot7.sort_index = 1

			if slot7.status == 1 then
				slot7.sort_index = 0
			elseif slot7.status == 2 then
				slot7.sort_index = 2
			end

			table.insert(slot2, slot7)
		end
	end

	table.sort(slot2, SortTools.tableLowerSorter({
		"sort_index",
		"aim"
	}))

	slot0.cell_data_list = slot2

	slot0.child_scrollview:reloadData()
	slot0:setLessTime(slot1.remain_sec)
end

function ActionNoviceGiftPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	slot0.time_val:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_val:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionNoviceGiftPanel.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString("00:00:00")
	end
end

function ActionNoviceGiftPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:createList(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.battle_preview_btn, function ()
		TimesummonController:getInstance():send23219(uv0.holiday_bid)
	end, true)
end

function ActionNoviceGiftPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ActionNoviceGiftPanel.DeleteMe(slot0)
	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end
end

ActionNoviceGiftItem = class("ActionNoviceGiftItem", function ()
	return ccui.Widget:create()
end)
ActionNoviceGiftItem.Width = 700
ActionNoviceGiftItem.Height = 152

function ActionNoviceGiftItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.touch_limit_buy = true
	slot0.good_list_data = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionNoviceGiftItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_novice_gift_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(cc.size(ActionNoviceGiftItem.Width, ActionNoviceGiftItem.Height))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_label = slot0.main_container:getChildByName("title_label")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.has_bg = slot0.main_container:getChildByName("has_bg")

	slot0.has_bg:setVisible(false)

	slot0.btn = createButton(slot0.main_container, TI18N("购买"), 600, 57, cc.size(124, 54), PathTool.getResFrame("common", "common_1027"), 24)

	slot0.btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=22 outline=2,#020019>0元</div>"))
	slot0:updateScrollviewList()

	slot0.limit_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(600, 105), nil, nil, nil)

	slot0.main_container:addChild(slot0.limit_label)
end

function ActionNoviceGiftItem.updateScrollviewList(slot0)
	if slot0.good_scrollview == nil then
		slot0.good_scrollview = CommonScrollViewSingleLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
			start_y = 12,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 4,
			space_x = 10,
			space_y = 0,
			col = 0,
			item_width = BackPackItem.Width * 0.7,
			item_height = BackPackItem.Height * 0.7
		}, cc.p(0, 0))

		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.good_scrollview:setSwallowTouches(false)
end

function ActionNoviceGiftItem.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new()

	slot3:setDefaultTip()
	slot3:setSwallowTouches(false)
	slot3:setScale(0.7)

	return slot3
end

function ActionNoviceGiftItem.numberOfCells(slot0)
	if not slot0.good_list_data then
		return 0
	end

	return #slot0.good_list_data
end

function ActionNoviceGiftItem.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.good_list_data then
		return
	end

	slot1.index = slot2

	if not slot0.good_list_data[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot3 and slot3.id == 3 then
		slot1:setDoubleIcon(true)
	else
		slot1:setDoubleIcon(false)
	end
end

function ActionNoviceGiftItem.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.item_list) do
		if deepCopy(Config.ItemData.data_get_data(slot8.bid)) then
			slot9.quantity = slot8.num

			table.insert(slot3, slot9)
		end
	end

	slot0.good_list_data = slot3

	slot0.good_scrollview:reloadData()

	slot4 = keyfind("aim_args_key", 26, slot1.aim_args) or nil
	slot6 = 0

	if keyfind("aim_args_key", 27, slot1.aim_args) or nil then
		slot0.btn:setRichText(string.format(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#020019>%d元</div>"), slot5.aim_args_val or 0))

		slot6 = slot5.aim_args_val
	end

	slot0.title_label:setString(slot1.aim_str)

	slot8 = slot0:getValByKey(slot1.aim_args, 2) or 0
	slot9 = slot0:getValByKey(slot1.aim_args, 6) or 0
	slot10 = ""

	if (slot0:getValByKey(slot1.aim_args, 7) or 0) == 1 then
		if slot8 and slot8 ~= 0 and slot9 then
			slot10 = string.format(TI18N("<div fontColor=#372F1C>每周限购%s个:  (</div><div fontcolor=#31DF54>%s<div fontColor=#372F1C>/%s)"), slot8, slot9, slot8)
		end
	elseif slot7 == 2 then
		if slot8 and slot8 ~= 0 and slot9 then
			slot10 = string.format(TI18N("<div fontColor=#372F1C>总限购%s个:  (</div><div fontcolor=#31DF54>%s<div fontColor=#372F1C>/%s)"), slot8, slot9, slot8)
		end
	elseif slot7 == 3 and slot8 and slot8 ~= 0 and slot9 then
		slot10 = string.format(TI18N("<div fontColor=#372F1C>限购:  (</div><div fontcolor=#31DF54>%s<div fontColor=#372F1C>/%s)"), slot9, slot8)
	end

	slot0.limit_label:setString(slot10)

	if slot1.sort_index == 2 then
		slot0.btn:setGrayAndUnClick(true, false)
		slot0.btn:setRichText(string.format(TI18N("<div fontColor=#ffffff fontsize=24>%d元</div>"), slot6))
	else
		slot0.btn:setGrayAndUnClick(false, true)
		slot0.btn:setRichText(string.format(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#020019>%d元</div>"), slot6))
	end
end

function ActionNoviceGiftItem.getValByKey(slot0, slot1, slot2)
	if not slot1 then
		return 0
	end

	slot3 = 0

	for slot7, slot8 in ipairs(slot1) do
		if slot8.aim_args_key == slot2 then
			slot3 = slot8.aim_args_val
		end
	end

	return slot3
end

function ActionNoviceGiftItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.data then
			if uv0.data.status == 0 and uv0.touch_limit_buy == true then
				uv0.touch_limit_buy = nil

				sdkOnPay((keyfind("aim_args_key", 27, uv0.data.aim_args) or {}).aim_args_val, 1, uv0.data.aim, uv0.data.aim_str)

				if uv0.send_limit_buy_ticket == nil then
					uv0.send_limit_buy_ticket = GlobalTimeTicket:getInstance():add(function ()
						uv0.touch_limit_buy = true

						if uv0.send_limit_buy_ticket ~= nil then
							GlobalTimeTicket:getInstance():remove(uv0.send_limit_buy_ticket)

							uv0.send_limit_buy_ticket = nil
						end
					end, 2)
				end
			elseif uv0.data.status == 2 then
				message(TI18N("已经购买完了"))
			end
		end
	end)
end

function ActionNoviceGiftItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.send_limit_buy_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_limit_buy_ticket)

		slot0.send_limit_buy_ticket = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
