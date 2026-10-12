ActionAccCostPanel = class("ActionAccCostPanel", function (...)
	return ccui.Widget:create()
end)

function ActionAccCostPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.action_type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionAccCostPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_cost_panel"))

	slot0.root_wnd:setPosition(-40, -120)

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
			slot1.aim_title = "txt_cn_action_acc_cost_title"
		end

		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getTargetRes("bigbg/action", slot1.aim_title, false, false), ResourcesType.single, slot0.item_load1)
		end
	end

	slot0.charge_btn = slot0.main_container:getChildByName("charge_btn")

	slot0.charge_btn:setTitleText(TI18N("立即充值"))

	slot0.charge_btn.label = slot0.charge_btn:getTitleRenderer()

	if slot0.charge_btn.label ~= nil then
		slot0.charge_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.charge_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.charge_con:getContentSize(), {
		start_y = 2,
		start_x = 13,
		space_x = 2,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = ActionAccCostItem,
		item_width = ActionAccCostItem.Width,
		item_height = ActionAccCostItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionAccCostPanel.createList(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1.aim_list) do
		slot7.sort_index = 1

		if slot7.status == 1 then
			slot7.sort_index = 0
		elseif slot7.status == 2 then
			slot7.sort_index = 2
		end

		table.insert(slot2, slot7)
	end

	table.sort(slot2, SortTools.tableLowerSorter({
		"sort_index",
		"aim"
	}))
	slot0.item_scrollview:setData(slot2, nil, nil, slot1)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setHolidayBid(uv0.holiday_bid)
		end
	end)
	slot0:setLessTime(slot1.remain_sec)
end

function ActionAccCostPanel.setLessTime(slot0, slot1)
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

function ActionAccCostPanel.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString("")
	end
end

function ActionAccCostPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:createList(slot0)
			end
		end)
	end
end

function ActionAccCostPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ActionAccCostPanel.DeleteMe(slot0)
	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	slot0.item_list = nil

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end
end

ActionAccCostItem = class("ActionAccCostItem", function ()
	return ccui.Widget:create()
end)
ActionAccCostItem.Width = 679
ActionAccCostItem.Height = 164

function ActionAccCostItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function ActionAccCostItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_acc_cost_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(cc.size(ActionAccCostItem.Width, ActionAccCostItem.Height))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_label = slot0.main_container:getChildByName("title_label")
	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.exp = slot0.main_container:getChildByName("exp")

	slot0.exp:setString("")

	slot0.get = slot0.main_container:getChildByName("get")

	slot0.get:setVisible(false)

	slot0.btn = slot0.main_container:getChildByName("btn")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("领取"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[277], 2)
	end

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
end

function ActionAccCostItem.setExtendData(slot0, slot1)
	slot0.extend_data = slot1
end

function ActionAccCostItem.setData(slot0, slot1)
	slot0.data = slot1
	slot3 = {}

	for slot7, slot8 in pairs(slot1.item_list) do
		slot9 = deepCopy(Config.ItemData.data_get_data(slot8.bid))
		slot9.quantity = slot8.num

		table.insert(slot3, slot9)
	end

	slot0.item_scrollview:setData(slot3)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5:getData() and slot6.id then
				slot7 = slot6.id

				for slot12, slot13 in pairs(uv0.extend_data.item_effect_list) do
					if slot7 and slot7 == slot13.bid then
						if slot6.quality >= 4 then
							slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
						else
							slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
						end
					end
				end
			end
		end
	end)
	slot0.title_label:setString(slot1.aim_str)
	slot0.exp:setString(slot0:getValByKey(slot1.aim_args, 5) .. "/" .. slot0:getValByKey(slot1.aim_args, 4))
	slot0:changeChargeBtn(slot1.status)
end

function ActionAccCostItem.getValByKey(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot7.aim_args_key == slot2 then
			return slot7.aim_args_val
		elseif slot7.aim_args_key == slot2 then
			return slot7.aim_args_val
		end
	end
end

function ActionAccCostItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				if uv0.data.status == 1 then
					uv0.ctrl:cs16604(uv0.holiday_bid, uv0.data.aim, 0)
				elseif slot2 == 0 then
					message(TI18N("未达到条件"))
				elseif slot2 == 2 then
					message(TI18N("已经领取过了"))
				end
			end
		end
	end)
end

function ActionAccCostItem.setHolidayBid(slot0, slot1)
	slot0.holiday_bid = slot1
end

function ActionAccCostItem.changeChargeBtn(slot0, slot1)
	if slot1 == 0 then
		slot0.btn:setTitleText(TI18N("领取"))
		setChildUnEnabled(true, slot0.btn)
		slot0.btn.label:disableEffect(cc.LabelEffect.OUTLINE)
	elseif slot1 == 1 then
		slot0.btn:setTitleText(TI18N("领取"))
		setChildUnEnabled(false, slot0.btn)
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	elseif slot1 == 2 then
		slot0.btn:setTitleText(TI18N("已领取"))
		setChildUnEnabled(true, slot0.btn)
		slot0.btn.label:disableEffect(cc.LabelEffect.OUTLINE)
	end
end

function ActionAccCostItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
