ActionHighValueGiftPanel = class("ActionHighValueGiftPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()
slot2 = string.format

function ActionHighValueGiftPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.touch_btn = true

	slot0:configUI()
	slot0:register_event()
end

function ActionHighValueGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_high_value_gift_panel"))

	slot0.root_wnd:setPosition(-40, -80)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.jump_btn = createImage(slot0.main_container, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_jump"), 600, 770, cc.p(0.5, 0.5), false, 1, true)

	slot0.jump_btn:setTouchEnabled(true)
	slot0.jump_btn:setVisible(false)

	slot0.img_bg = slot0.main_container:getChildByName("img_bg")
	slot2 = "txt_cn_action_high_value_gift_panel"
	slot0.holiday_bid = slot0.holiday_bid or ActionRankCommonType.high_value_gift

	if not Config.FunctionData.data_limit_little_recharge[slot0.holiday_bid] then
		return
	end

	if slot3.bg_name and slot3.bg_name ~= "" then
		slot2 = slot3.bg_name
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", slot2), ResourcesType.single, function ()
			if not tolua.isnull(uv0.img_bg) then
				loadSpriteTexture(uv0.img_bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("剩余时间:"))
	slot0.txt_time_title:setTextColor(color(slot3.time_title_color))
	slot0.txt_time_title:enableOutline(color(slot3.time_stroke_color), 2)

	slot0.txt_time_val = slot0.main_container:getChildByName("txt_time_val")

	slot0.txt_time_val:setTextColor(color(slot3.time_title_color))
	slot0.txt_time_val:enableOutline(color(slot3.time_stroke_color), 2)

	slot0.txt_price = slot0.main_container:getChildByName("txt_price")

	slot0.txt_price:setTextColor(color(slot3.common_color))

	slot0.txt_discount_title = slot0.main_container:getChildByName("txt_discount_title")

	slot0.txt_discount_title:setString(TI18N("现价："))
	slot0.txt_discount_title:setTextColor(color(slot3.common_color))

	slot0.txt_discount_price = slot0.main_container:getChildByName("txt_discount_price")

	slot0.txt_discount_price:setTextColor(color(slot3.common_color))

	slot0.txt_limit_time = slot0.main_container:getChildByName("txt_limit_time")

	if slot3.limit_color then
		slot0.txt_limit_time:setTextColor(color(slot3.limit_color))
	end

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")
	slot0.txt_buy = slot0.btn_buy:getChildByName("txt_buy")

	slot0.txt_buy:setString(TI18N("立即抢购"))

	if slot3.send_data and next(slot5) ~= nil then
		slot8 = createImage(slot0.main_container, PathTool.getItemRes(slot5[1][1]), 229, 616, cc.p(0, 0.5), false, 1, false)

		slot8:setScale(0.4)

		slot0.send_num = CommonNum.new(23, slot0.main_container, slot5[1][2], 1, cc.p(0, 0))

		slot0.send_num:setPosition(cc.p(229 + slot8:getContentSize().width * 0.4, 616))
	end

	slot6 = slot0.main_container:getChildByName("goods_list")
	slot0.item_scroll_view = CommonScrollViewLayout:create(slot6, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot6:getContentSize(), {
		start_y = 8,
		start_x = 10,
		space_x = 25,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0.item_scroll_view:setSwallowTouches(false)
	slot0.item_scroll_view:setClickEnabled(false)

	if slot0.holiday_bid == ActionRankCommonType.week_gift then
		slot0.txt_time_title:setPositionY(569)
		slot0.txt_time_val:setPositionY(569)
	end

	if slot0.holiday_bid == ActionRankCommonType.over_value_gift_1 then
		slot0.jump_btn:setVisible(false)
	end

	uv0:cs16603(slot0.holiday_bid)
	uv1:setGiftRedStatus({
		status = false,
		bid = ActionRankCommonType.high_value_gift
	})
end

function ActionHighValueGiftPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_buy, function ()
		if not uv0.touch_btn then
			return
		end

		if uv0.get_item_ticket == nil then
			uv0.get_item_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.touch_btn = true

				if uv0.get_item_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.get_item_ticket)

					uv0.get_item_ticket = nil
				end
			end, 2)
		end

		uv0.touch_btn = nil

		if uv0.data and uv0.data.charge_id and uv0.data.left_time > 0 then
			uv0.cur_charge_id = uv0.data.charge_id

			ActionController:getInstance():sender21016(uv0.data.charge_id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.jump_btn, function ()
		HeavenController:getInstance():openHeavenMainWindow(true, nil, HeavenConst.Tab_Index.DialRecord)
	end, true, 1)

	if not slot0.charge_data_event then
		slot0.charge_data_event = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id and Config.ChargeData.data_charge_data[slot0.charge_id] and slot0.status == 1 and slot0.charge_id == uv0.cur_charge_id then
				sdkOnPay(slot1.val, 1, slot1.id, slot1.name, uv0.data.left_time)
			end
		end)
	end
end

function ActionHighValueGiftPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	uv0:setCountDownTime(slot0.txt_time_val, slot1.remain_sec or 0)

	slot0.data = slot1.aim_list[1]
	slot3, slot4 = nil
	slot4 = keyfind("aim_args_key", ActionExtType.RechageCurCount, slot0.data.aim_args).aim_args_val or 0
	slot3 = keyfind("aim_args_key", ActionExtType.RechageTotalCount, slot0.data.aim_args).aim_args_val or 0

	slot0.txt_limit_time:setString(TI18N(uv1("限购：%d/%d", slot4, slot3)))

	slot0.data.left_time = slot3 - slot4
	slot7, slot8 = nil

	slot0.txt_price:setString(TI18N(uv1("原价：￥%d", keyfind("aim_args_key", ActionExtType.ActivityOldPrice, slot0.data.aim_args).aim_args_val or 0)))
	slot0.txt_discount_price:setString(TI18N(uv1("￥%d", keyfind("aim_args_key", ActionExtType.ActivityCurrentPrice, slot0.data.aim_args).aim_args_val or 0)))

	slot0.data.charge_id = keyfind("aim_args_key", ActionExtType.ItemRechargeId, slot0.data.aim_args).aim_args_val or 0

	slot0:loadRewardList(slot0.data.item_list)

	if slot0.data.left_time == 0 then
		slot0.txt_buy:setString(TI18N("已领取"))
		slot0.txt_buy:enableOutline(Config.ColorData.data_color4[84], 2)
		setChildUnEnabled(true, slot0.btn_buy)
	else
		setChildUnEnabled(false, slot0.btn_buy)
	end
end

function ActionHighValueGiftPanel.loadRewardList(slot0, slot1)
	slot2 = {}

	if tableLen(slot1) > 0 then
		for slot6, slot7 in pairs(slot1) do
			if {} then
				slot8.bid = slot7.bid
				slot8.quantity = slot7.num

				table.insert(slot2, slot8)
			end
		end

		if #slot2 > 5 then
			slot0.item_scroll_view:setClickEnabled(true)
			slot0.item_scroll_view:setPositionX(0)
		else
			slot0.item_scroll_view:setClickEnabled(false)
			slot0.item_scroll_view:setPositionX((5 - slot3) * 10 + (4 - slot3) * 55)
		end

		slot0.item_scroll_view:setData(slot2)
		slot0.item_scroll_view:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scroll_view:getItemList()) do
				slot5:setDefaultTip()
				slot5:setSwallowTouches(false)
			end
		end)
	end
end

function ActionHighValueGiftPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionHighValueGiftPanel.DeleteMe(slot0)
	doStopAllActions(slot0.txt_time_val)

	if slot0.send_num then
		slot0.send_num:DeleteMe()

		slot0.send_num = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_scroll_view then
		slot0.item_scroll_view:DeleteMe()

		slot0.item_scroll_view = nil
	end

	if slot0.get_item_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.get_item_ticket)

		slot0.get_item_ticket = nil
	end

	if slot0.charge_data_event then
		GlobalEvent:getInstance():UnBind(slot0.charge_data_event)

		slot0.charge_data_event = nil
	end

	if slot0.update_action_even_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)

		slot0.update_action_even_event = nil
	end
end
