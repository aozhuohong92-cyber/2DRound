slot0 = ActionController:getInstance()
ActionTimeShopPanel = class("ActionTimeShopPanel", function ()
	return ccui.Widget:create()
end)

function ActionTimeShopPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionTimeShopPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -64)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_con")

	slot2:getChildByName("btn_rule"):setVisible(false)

	slot4 = slot2:getChildByName("sprite_title")
	slot0.shop_btn = slot2:getChildByName("btn_shop")

	if slot0.shop_btn then
		slot0.shop_btn:setVisible(false)
	end

	slot5 = "txt_cn_welfare_banner22"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot6.reward_title ~= "" and slot6.reward_title then
		slot5 = slot6.reward_title
	end

	if not slot0.banner_load then
		slot0.banner_load = createResourcesLoad(PathTool.getWelfareBannerRes(slot5), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.banner_load)
	end

	slot8 = slot2:getChildByName("time_panel")

	slot8:getChildByName("Text_1"):setString(TI18N("剩余时间: "))

	slot0.remain_time = slot8:getChildByName("remain_time")

	slot0.remain_time:setString("")
	slot0.remain_time:setPositionX(117)

	slot9 = slot1:getChildByName("good_cons")
	slot0.child_scrollview = CommonScrollViewLayout.new(slot9, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot9:getContentSize(), {
		start_y = 2,
		item_width = 688,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 136,
		space_y = 2,
		col = 1,
		item_class = ActionTimeShopItem
	})

	slot0.child_scrollview:setSwallowTouches(false)
	uv0:cs16603(slot0.holiday_bid)
end

function ActionTimeShopPanel.register_event(slot0)
	if not slot0.time_shop_event then
		slot0.time_shop_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv1:getModel():setCountDownTime(uv0.remain_time, slot0.remain_sec)
				uv0:setLimitShopData(slot0)
			end
		end)
	end
end

function ActionTimeShopPanel.setLimitShopData(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in pairs(slot1.aim_list) do
		if keyfind("aim_args_key", 39, slot8.aim_args) or nil then
			if slot8.status == 2 then
				slot10 = slot9.aim_args_val + #slot1.aim_list
			end

			slot8.sort_id = slot10

			table.insert(slot2, slot8)
		end
	end

	if next(slot2) == nil then
		table.sort(slot1.aim_list, function (slot0, slot1)
			if slot0.status == slot1.status then
				slot2 = 0
				slot3 = 0

				if keyfind("aim_args_key", 27, slot0.aim_args) or nil then
					slot2 = slot4.aim_args_val
				end

				if keyfind("aim_args_key", 27, slot1.aim_args) or nil then
					slot3 = slot5.aim_args_val
				end

				return slot2 < slot3
			else
				return slot0.status < slot1.status
			end
		end)
		slot0.child_scrollview:setData(slot1.aim_list)
	else
		table.sort(slot2, function (slot0, slot1)
			return slot0.sort_id < slot1.sort_id
		end)
		slot0.child_scrollview:setData(slot2)
	end
end

function ActionTimeShopPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionTimeShopPanel.DeleteMe(slot0)
	doStopAllActions(slot0.remain_time)

	if slot0.banner_load then
		slot0.banner_load:DeleteMe()

		slot0.banner_load = nil
	end

	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()

		slot0.child_scrollview = nil
	end

	if slot0.time_shop_event then
		GlobalEvent:getInstance():UnBind(slot0.time_shop_event)

		slot0.time_shop_event = nil
	end
end

ActionTimeShopItem = class("ActionTimeShopItem", function ()
	return ccui.Widget:create()
end)

function ActionTimeShopItem.ctor(slot0)
	slot0.touch_buy_limit_shop = true

	slot0:configUI()
	slot0:register_event()
end

function ActionTimeShopItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(688, 136))
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.has_get = slot1:getChildByName("has_get")
	slot0.btn_charge = slot1:getChildByName("btn_charge")
	slot0.charge_price = slot0.btn_charge:getChildByName("Text_4_0")
	slot0.text_remian = slot1:getChildByName("Text_4")
	slot2 = slot1:getChildByName("good_cons")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 12,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.good_scrollview:setSwallowTouches(false)
end

function ActionTimeShopItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_charge, function ()
		if not uv0.touch_buy_limit_shop then
			return
		end

		if uv0.buy_limit_shop_ticket == nil then
			uv0.buy_limit_shop_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.touch_buy_limit_shop = true

				if uv0.buy_limit_shop_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.buy_limit_shop_ticket)

					uv0.buy_limit_shop_ticket = nil
				end
			end, 2)
		end

		uv0.touch_buy_limit_shop = nil

		if uv0.data and uv0.data.aim and Config.ChargeData.data_charge_data[uv0.data.aim] then
			sdkOnPay(slot0.val, nil, slot0.id, slot0.name, uv0.max_num - uv0.buy_num)
		end
	end, true)
end

function ActionTimeShopItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = {}

	for slot6, slot7 in pairs(slot1.item_list or {}) do
		table.insert(slot2, {
			bid = slot7.bid,
			quantity = slot7.num
		})
	end

	slot0.good_scrollview:setData(slot2)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)

	if slot1.status == 2 then
		slot0.btn_charge:setVisible(false)
		slot0.text_remian:setVisible(false)
		slot0.has_get:setVisible(true)
	else
		slot0.has_get:setVisible(false)
		slot0.btn_charge:setVisible(true)
		slot0.text_remian:setVisible(true)

		slot0.max_num = 0
		slot0.buy_num = 0
		slot3 = 0

		for slot7, slot8 in pairs(slot1.aim_args) do
			if slot8.aim_args_key == 2 then
				slot0.max_num = slot8.aim_args_val
			elseif slot8.aim_args_key == 6 then
				slot0.buy_num = slot8.aim_args_val
			elseif slot8.aim_args_key == 27 then
				slot3 = slot8.aim_args_val
			end
		end

		slot0.text_remian:setString(string.format(TI18N("剩余:%d"), slot0.max_num - slot0.buy_num))
		slot0.charge_price:setString(slot3 .. TI18N("元"))
	end
end

function ActionTimeShopItem.DeleteMe(slot0)
	if slot0.buy_limit_shop_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_limit_shop_ticket)

		slot0.buy_limit_shop_ticket = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
