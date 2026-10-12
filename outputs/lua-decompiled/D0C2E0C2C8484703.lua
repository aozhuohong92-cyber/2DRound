DailyGiftPanel = class("DailyGiftPanel", function ()
	return ccui.Widget:create()
end)
slot1 = VipController:getInstance():getModel()

function DailyGiftPanel.ctor(slot0)
	slot0.gift_charge_id = 0

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
	slot0:setData()
end

function DailyGiftPanel.registerEvents(slot0)
	if slot0.update_daily_gift == nil then
		slot0.update_daily_gift = GlobalEvent:getInstance():Bind(VipEvent.DAILY_GIFT_INFO, function ()
			uv0:setData()
		end)
	end

	if slot0.update_daily_award == nil then
		slot0.update_daily_award = GlobalEvent:getInstance():Bind(WelfareEvent.Update_Daily_Awawd_Data, function ()
			uv0:updateDailyAwardRed()
		end)
	end

	if not slot0.role_vo then
		slot0.role_vo = RoleController:getInstance():getRoleVo()

		if slot0.role_assets_event == nil then
			slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "lev" or slot0 == "vip_lev" then
					uv0:setData()
				end
			end)
		end
	end

	registerButtonEventListener(slot0.daily_btn, function ()
		WelfareController:getInstance():sender21009()
	end, true)

	if slot0.daygift_charge_data == nil then
		slot0.daygift_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id and Config.ChargeData.data_charge_data[slot0.charge_id] and slot0.status == 1 and slot0.charge_id == uv0.gift_charge_id then
				sdkOnPay(slot1.val, 1, slot1.id, slot1.name, slot1.name)
			end
		end)
	end
end

function DailyGiftPanel.config(slot0)
	slot0.size = cc.size(668, 644)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/daily_gift_panel"))

	slot0.root_wnd:setPosition(-4, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
end

function DailyGiftPanel.layoutUI(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.daily_btn = slot0.main_container:getChildByName("daily_btn")
	slot0.daily_btn_tips = slot0.daily_btn:getChildByName("redpoint")
	slot0.one_key_box = slot0.main_container:getChildByName("one_key_box"):setVisible(false)
	slot0.sp_arrow = slot0.main_container:getChildByName("sp_arrow")
end

function DailyGiftPanel.createItemScrollview(slot0, slot1)
	if slot0.item_scrollview then
		return
	end

	slot2 = slot0.main_container:getChildByName("scrollCon")
	slot3 = slot2:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height + 20), {
		start_y = 15,
		item_width = 668,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 213,
		space_y = 10,
		col = 1,
		item_class = DailyGiftItem
	})
end

function DailyGiftPanel.setData(slot0)
	slot1 = {}

	if slot0.role_vo == nil then
		slot0.role_vo = RoleController:getInstance():getRoleVo()
	end

	for slot5, slot6 in pairs(Config.ChargeData.data_daily_gift_data) do
		if slot6.show_lv and slot6.show_lv <= slot0.role_vo.lev and slot6.show_vip_lv and slot6.show_vip_lv <= slot0.role_vo.vip_lev then
			table.insert(slot1, deepCopy(slot6))
		end
	end

	table.sort(slot1, SortTools.KeyLowerSorter("sort_id"))

	if not slot0.item_scrollview then
		slot0:createItemScrollview(#slot1)
	end

	slot0.item_scrollview:setData(slot1, function (slot0)
		uv0.gift_charge_id = slot0:getData().charge_id
	end)

	if #slot1 > 3 then
		slot0.sp_arrow:setVisible(true)
		slot0.item_scrollview:setBounceEnabled(true)

		if not slot0._init_flag then
			slot0._init_flag = true

			slot0.item_scrollview:scrollToPercentVertical(40 / slot0.item_scrollview:getMaxSize().height * 100, 0)
		end
	else
		slot0.sp_arrow:setVisible(false)
		slot0.item_scrollview:setBounceEnabled(false)
	end

	slot0:updateDailyAwardRed()
end

function DailyGiftPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
	WelfareController:getInstance():getModel():updateDailyGiftRedStatus(false)
end

function DailyGiftPanel.updateDailyAwardRed(slot0)
	slot1 = false

	if WelfareController:getInstance():getModel():getDailyAwardStatus() == 0 then
		slot1 = true
	end

	slot0.daily_btn_tips:setVisible(slot1)
end

function DailyGiftPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_daily_gift then
		GlobalEvent:getInstance():UnBind(slot0.update_daily_gift)

		slot0.update_daily_gift = nil
	end

	if slot0.update_daily_award then
		GlobalEvent:getInstance():UnBind(slot0.update_daily_award)

		slot0.update_daily_award = nil
	end

	if slot0.daygift_charge_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.daygift_charge_data)

		slot0.daygift_charge_data = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end

DailyGiftItem = class("DailyGiftItem", function ()
	return ccui.Widget:create()
end)

function DailyGiftItem.ctor(slot0)
	slot0.touch_buy_gift = true

	slot0:configUI()
	slot0:register_event()
end

function DailyGiftItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/daily_gift_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(668, 213))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_bg = slot0.container:getChildByName("image_bg")
	slot0.title_txt = slot0.container:getChildByName("title_txt")
	slot0.buy_btn = slot0.container:getChildByName("buy_btn")
	slot0.buy_btn.label = slot0.buy_btn:getTitleRenderer()

	if slot0.buy_btn.label ~= nil then
		slot0.buy_btn:setTitleColor(cc.c4b(255, 255, 255, 255))
		slot0.buy_btn.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
	end

	slot0.left_num = slot0.container:getChildByName("left_num")
	slot0.zhe_panel = slot0.container:getChildByName("zhe_panel")

	slot0.zhe_panel:setVisible(false)
	slot0.zhe_panel:getChildByName("price_title"):setString(TI18N("原价"))

	slot0.price_txt = slot0.zhe_panel:getChildByName("price_txt")
	slot1 = slot0.container:getChildByName("good_list")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.good_scrollview:setSwallowTouches(fasle)
end

function DailyGiftItem.register_event(slot0)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0._onClickBuyBtn))
end

function DailyGiftItem._onClickBuyBtn(slot0)
	if slot0.gift_config then
		if slot0.gift_config.limit_vip <= RoleController:getInstance():getRoleVo().vip_lev then
			if Config.ChargeData.data_charge_data[slot0.gift_config.charge_id or 0] and slot0.touch_buy_gift == true then
				slot0.touch_buy_gift = nil

				if slot0.callback then
					slot0:callback()
				end

				ActionController:getInstance():sender21016(slot4.id)

				if slot0.send_buy_gift_ticket == nil then
					slot0.send_buy_gift_ticket = GlobalTimeTicket:getInstance():add(function ()
						uv0.touch_buy_gift = true

						if uv0.send_buy_gift_ticket ~= nil then
							GlobalTimeTicket:getInstance():remove(uv0.send_buy_gift_ticket)

							uv0.send_buy_gift_ticket = nil
						end
					end, 2)
				end
			end
		else
			message(string.format(TI18N("VIP%d可购买"), slot2))
		end
	end
end

function DailyGiftItem.getData(slot0)
	return slot0.gift_config
end

function DailyGiftItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function DailyGiftItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.gift_config = slot1
	slot3 = uv0:getDailyGiftBuyCountById(slot1.id)
	slot0.gift_bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg", slot0.gift_config.bg_res), ResourcesType.single, slot0.gift_bg_load)

	slot0.title_txt:setString(slot0.gift_config.name)

	if slot0.gift_config.bg_res == "txt_cn_bigbg_25" then
		slot0.title_txt:enableOutline(cc.c3b(5, 108, 107), 2)
	elseif slot0.gift_config.bg_res == "txt_cn_bigbg_26" then
		slot0.title_txt:enableOutline(cc.c3b(109, 5, 148), 2)
	elseif slot0.gift_config.bg_res == "txt_cn_bigbg_27" then
		slot0.title_txt:enableOutline(cc.c3b(148, 59, 5), 2)
	end

	if slot0.gift_config.limit_count <= slot3 then
		setChildUnEnabled(true, slot0.buy_btn)
		slot0.buy_btn:setTouchEnabled(false)
		slot0.buy_btn:setTitleText(TI18N("今日已购"))
	else
		setChildUnEnabled(false, slot0.buy_btn)
		slot0.buy_btn:setTouchEnabled(true)
		slot0.buy_btn:setTitleText(string.format(TI18N("%d元"), slot0.gift_config.val or 0))
	end

	slot0.left_num:setString(string.format(TI18N("限购:%d次"), slot0.gift_config.limit_count - slot3))

	if not slot0.gift_desc_txt then
		slot0.gift_desc_txt = createRichLabel(24, 1, cc.p(0.5, 1), cc.p(314, 192), 10, nil, 280)

		slot0.container:addChild(slot0.gift_desc_txt)
	end

	slot5 = string.format("<img src='%s' scale=0.3 />", PathTool.getItemRes(3))

	slot0.gift_desc_txt:setString(string.format(slot0.gift_config.desc, slot5, slot5))

	if slot0.gift_config.old_price and slot0.gift_config.old_price > 0 then
		slot0.zhe_panel:setVisible(true)
		slot0.price_txt:setString(slot0.gift_config.old_price .. TI18N("元"))
	else
		slot0.zhe_panel:setVisible(false)
	end

	slot6 = RoleController:getInstance():getRoleVo()

	if Config.ChargeData.data_daily_gift_award[slot2] then
		slot8 = {}

		for slot12, slot13 in pairs(slot7) do
			if slot13.min <= slot6.lev and slot6.lev <= slot13.max then
				slot8 = deepCopy(slot13.reward)

				break
			end
		end

		slot9 = {}

		for slot13, slot14 in pairs(slot8) do
			if deepCopy(Config.ItemData.data_get_data(slot14[1])) then
				slot15.quantity = slot14[2]

				table.insert(slot9, slot15)
			end
		end

		slot0.good_scrollview:setData(slot9)

		slot10 = false

		if slot0.gift_config and slot0.gift_config.is_double and slot0.gift_config.is_double == 1 then
			slot10 = true
		end

		slot0.good_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
				if uv1 then
					if slot5:getData() and slot6.id == 3 then
						slot5:setDoubleIcon(true)
					else
						slot5:setDoubleIcon(false)
					end
				end

				slot5:setDefaultTip()
			end
		end)
	end
end

function DailyGiftItem.DeleteMe(slot0)
	if slot0.gift_bg_load then
		slot0.gift_bg_load:DeleteMe()

		slot0.gift_bg_load = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	slot0.touch_buy_gift = true

	if slot0.send_buy_gift_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_buy_gift_ticket)

		slot0.send_buy_gift_ticket = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
