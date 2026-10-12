ActionLimitBuyPanel = class("ActionLimitBuyPanel", function (...)
	return ccui.Widget:create()
end)

function ActionLimitBuyPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.action_type = slot2
	slot0.ctrl = ActionController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitBuyPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_buy_panel"))

	slot0.root_wnd:setPosition(-40, -145)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.time_val = slot0.title_con:getChildByName("time_val")
	slot0.time_title = slot0.title_con:getChildByName("time_title")
	slot0.charge_con = slot0.main_container:getChildByName("charge_con")

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.title_img = slot0.title_con:getChildByName("title_img")

	if (slot0.holiday_bid ~= nil or slot0.holiday_bid ~= 0 and slot0.action_type ~= nil or slot0.action_type ~= 0) and slot0.ctrl:getActionSubTabVo(slot0.holiday_bid) then
		if slot1.aim_title == "" then
			slot1.aim_title = "txt_cn_action_limit_title"
		end

		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getPlistImgForDownLoad("bigbg/action", slot1.aim_title), ResourcesType.single, slot0.item_load1)
		end
	end

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.charge_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.charge_con:getContentSize(), {
		start_y = 0,
		start_x = 10,
		space_x = 0,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = ActionLimitBuyItem,
		item_width = ActionLimitBuyItem.Width,
		item_height = ActionLimitBuyItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionLimitBuyPanel.createList(slot0, slot1)
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
	slot0.item_scrollview:setData(slot2)
	slot0:setLessTime(slot1.remain_sec)

	if slot0.everyday_data and slot0.everyday_data.status ~= 2 then
		addRedPointToNodeByStatus(slot0.everyday_btn, true)
	else
		addRedPointToNodeByStatus(slot0.everyday_btn, false)
	end
end

function ActionLimitBuyPanel.setLessTime(slot0, slot1)
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

function ActionLimitBuyPanel.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString("00:00:00")
	end
end

function ActionLimitBuyPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:createList(slot0)
			end
		end)
	end
end

function ActionLimitBuyPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ActionLimitBuyPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end
end

ActionLimitBuyItem = class("ActionLimitBuyItem", function ()
	return ccui.Widget:create()
end)
ActionLimitBuyItem.Width = 679
ActionLimitBuyItem.Height = 164

function ActionLimitBuyItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.touch_limit_buy = true

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitBuyItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_buy_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(cc.size(ActionLimitBuyItem.Width, ActionLimitBuyItem.Height))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_label = slot0.main_container:getChildByName("title_label")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.has_bg = slot0.main_container:getChildByName("has_bg")

	slot0.has_bg:setVisible(false)

	slot0.btn = createButton(slot0.main_container, TI18N("购买"), 590, 67, cc.size(129, 62), PathTool.getResFrame("common", "common_1018"), 24)

	slot0.btn:setRichText("<div fontColor=#ffffff fontsize=28 outline=2,#2b610d>￥ 0</div>")
	slot0.btn:setPositionY(slot0.btn:getPositionY() - 15)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 11,
		start_x = 3,
		space_x = 15,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.limit_label = createRichLabel(24, 1, cc.p(1, 0.5), cc.p(665, 139), nil, nil, nil)

	slot0.main_container:addChild(slot0.limit_label)

	slot0.old_price = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(585, 104), nil, nil, nil)

	slot0.main_container:addChild(slot0.old_price)

	slot0.price_line = createScale9Sprite(PathTool.getResFrame("welfare", "welfare_40"), 50, 10, LOADTEXT_TYPE_PLIST, slot0.old_price)

	slot0.price_line:setAnchorPoint(cc.p(0.5, 0.5))
end

function ActionLimitBuyItem.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot1.item_list) do
		if deepCopy(Config.ItemData.data_get_data(slot8.bid)) then
			slot9.quantity = slot8.num

			table.insert(slot3, slot9)
		end
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)

	slot5 = keyfind("aim_args_key", 27, slot1.aim_args) or nil
	slot6 = 0

	if (keyfind("aim_args_key", 26, slot1.aim_args) or nil) and slot5 then
		slot0.old_price:setString(string.format(TI18N("原价:￥ %d"), slot4.aim_args_val or 0))
		slot0.btn:setRichText(string.format("<div fontColor=#ffffff fontsize=24 outline=2,#2b610d>￥ %d</div>", slot5.aim_args_val or 0))

		slot6 = slot5.aim_args_val
	end

	slot0.title_label:setString(slot1.aim_str)

	slot0.max_num = slot0:getValByKey(slot1.aim_args, 2) or 0
	slot0.cur_num = slot0:getValByKey(slot1.aim_args, 6) or 0
	slot8 = ""

	if (slot0:getValByKey(slot1.aim_args, 7) or 0) == 1 then
		if slot0.max_num and slot0.max_num ~= 0 and slot0.cur_num then
			slot8 = string.format(TI18N("<div fontcolor=#524931>每周限购%s个:  (</div><div fontcolor=#31DF54>%s<div fontcolor=#524931>/%s)"), slot0.max_num, slot0.cur_num, slot0.max_num)
		end
	elseif slot7 == 2 and slot0.max_num and slot0.max_num ~= 0 and slot0.cur_num then
		slot8 = string.format(TI18N("<div fontcolor=#524931>总限购%s个:  (</div><div fontcolor=#31DF54>%s<div fontcolor=#524931>/%s)"), slot0.max_num, slot0.self.cur_num, slot0.max_num)
	end

	slot0.limit_label:setString(slot8)

	if slot1.sort_index == 2 then
		slot0.btn:setGrayAndUnClick(true, false)
		slot0.btn:setRichText(string.format("<div fontColor=#ffffff fontsize=24>￥ %d</div>", slot6))
	else
		slot0.btn:setGrayAndUnClick(false, true)
		slot0.btn:setRichText(string.format("<div fontColor=#ffffff fontsize=24 outline=2,#2b610d>￥ %d</div>", slot6))
	end
end

function ActionLimitBuyItem.getValByKey(slot0, slot1, slot2)
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

function ActionLimitBuyItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and uv0.data then
			if uv0.data.status == 0 and uv0.touch_limit_buy == true then
				uv0.touch_limit_buy = nil

				sdkOnPay((keyfind("aim_args_key", 27, uv0.data.aim_args) or {}).aim_args_val, 1, uv0.data.aim, uv0.data.aim_str, uv0.max_num - uv0.cur_num)

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

function ActionLimitBuyItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.send_limit_buy_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_limit_buy_ticket)

		slot0.send_limit_buy_ticket = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
