slot0 = table.sort
slot1 = table.insert
slot2 = string.format
ChargeDialyPanel = ChargeDialyPanel or BaseClass()

function ChargeDialyPanel.__init(slot0, slot1, slot2)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.offset_y = slot2 or 0

	slot0:loadResListCompleted()
end

function ChargeDialyPanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
end

function ChargeDialyPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_value_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getContentSize()
	slot0.vip_tips_txt = createLabel(20, 1, cc.c4b(75, 64, 111, 255), 10, 842, TI18N("均可获得vip积分"), slot0.main_container, 2, cc.p(0, 0.5))
	slot0.daily_btn = slot0.main_container:getChildByName("daily_btn")

	slot0.daily_btn:setVisible(true)

	slot0.daily_btn_tips = slot0.daily_btn:getChildByName("redpoint")
	slot0.item_list = slot0.main_container:getChildByName("item_list")
	slot2 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(-5, -slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot2.width + 10, slot2.height + slot0.offset_y), {
		start_y = 5,
		row = 1,
		start_x = 0,
		space_x = 0,
		item_width = 684,
		item_height = 224,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot5 = slot0.main_container:getChildByName("image_1")

	slot5:setContentSize(cc.size(slot2.width + 10, slot2.height + slot0.offset_y + 20))
	slot5:setPositionY(slot5:getPositionY() - slot0.offset_y)
end

function ChargeDialyPanel.createNewCell(slot0)
	slot1 = ChargeDialyItem.new()

	slot1:addCallBack(handler(slot0, slot0.onClickCallBack))

	return slot1
end

function ChargeDialyPanel.numberOfCells(slot0)
	if not slot0.dialy_data then
		return 0
	end

	return #slot0.dialy_data
end

function ChargeDialyPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.dialy_data then
		return
	end

	slot1.index = slot2

	if not slot0.dialy_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeDialyPanel.onClickCallBack(slot0, slot1)
	if slot1 then
		slot0.gift_charge_id = slot1
	end
end

function ChargeDialyPanel.registerEvent(slot0)
	if slot0.update_daily_gift == nil then
		slot0.update_daily_gift = GlobalEvent:getInstance():Bind(VipEvent.DAILY_GIFT_INFO, function ()
			if uv0.item_scrollview then
				uv0.item_scrollview:resetCurrentItems()
			end
		end)
	end

	if slot0.update_daily_award == nil then
		slot0.update_daily_award = GlobalEvent:getInstance():Bind(WelfareEvent.Update_Daily_Awawd_Data, function ()
			uv0:updateDailyAwardRed()
		end)
	end

	if slot0.daygift_charge_data == nil then
		slot0.daygift_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if slot0 and slot0.status and slot0.charge_id and Config.ChargeData.data_charge_data[slot0.charge_id] and slot0.status == 1 and slot0.charge_id == uv0.gift_charge_id then
				sdkOnPay(slot1.val, 1, slot1.id, slot1.name, slot1.name)
			end
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
end

function ChargeDialyPanel.setData(slot0)
	slot0.dialy_data = {}

	if slot0.role_vo == nil then
		slot0.role_vo = RoleController:getInstance():getRoleVo()
	end

	for slot4, slot5 in pairs(Config.ChargeData.data_daily_gift_data) do
		if slot5.show_lv and slot5.show_lv <= slot0.role_vo.lev and slot5.show_vip_lv and slot5.show_vip_lv <= slot0.role_vo.vip_lev then
			uv0(slot0.dialy_data, deepCopy(slot5))
		end
	end

	uv1(slot0.dialy_data, SortTools.KeyLowerSorter("sort_id"))
	slot0.item_scrollview:reloadData()

	if #slot0.dialy_data > 3 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0:updateDailyAwardRed()
end

function ChargeDialyPanel.updateDailyAwardRed(slot0)
	slot1 = false

	if WelfareController:getInstance():getModel():getDailyAwardStatus() == 0 then
		slot1 = true
	end

	slot0.daily_btn_tips:setVisible(slot1)
end

function ChargeDialyPanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		WelfareController:getInstance():getModel():updateDailyGiftRedStatus(false)
		slot0:setData()
		slot0:updateDailyAwardRed()
	end
end

function ChargeDialyPanel.addChild(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) and not tolua.isnull(slot1) then
		slot0.root_wnd:addChild(slot1)
	end
end

function ChargeDialyPanel.setPosition(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1)
	end
end

function ChargeDialyPanel.__delete(slot0)
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

ChargeDialyItem = class("ChargeDialyItem", function ()
	return ccui.Widget:create()
end)

function ChargeDialyItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.touch_buy_gift = true
end

function ChargeDialyItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/daily_gift_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(684, 224))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_bg = slot0.container:getChildByName("image_bg")
	slot0.title_txt = slot0.container:getChildByName("title_txt")
	slot0.buy_btn = slot0.container:getChildByName("buy_btn")
	slot0.buy_btn.label = slot0.buy_btn:getTitleRenderer()

	if slot0.buy_btn.label ~= nil then
		slot0.buy_btn.label:enableOutline(cc.c4b(118, 69, 25, 255), 2)
	end

	slot0.left_num = slot0.container:getChildByName("left_num")
	slot0.zhe_panel = slot0.container:getChildByName("zhe_panel")

	slot0.zhe_panel:setVisible(false)
	slot0.zhe_panel:getChildByName("price_title"):setString(TI18N("原价"))

	slot0.price_txt = slot0.zhe_panel:getChildByName("price_txt")
	slot0.icon_sp = slot0.container:getChildByName("icon_sp")
	slot1 = slot0.container:getChildByName("good_list")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 5), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 15,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})
end

function ChargeDialyItem.registerEvent(slot0)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickItem), true)
end

function ChargeDialyItem.onClickItem(slot0)
	if slot0.gift_config then
		if slot0.gift_config.limit_vip <= RoleController:getInstance():getRoleVo().vip_lev then
			if Config.ChargeData.data_charge_data[slot0.gift_config.charge_id or 0] and slot0.touch_buy_gift == true then
				slot0.touch_buy_gift = nil

				if slot0.callback then
					slot0.callback(slot0.gift_config.charge_id)
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
			message(uv0(TI18N("VIP%d可购买"), slot2))
		end
	end
end

function ChargeDialyItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ChargeDialyItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.gift_config = slot1
	slot3 = VipController:getInstance():getModel():getDailyGiftBuyCountById(slot1.id)
	slot0.icon_load = loadSpriteTextureFromCDN(slot0.icon_sp, uv0("resource/mall_charge_icon/%s.png", slot1.icon_res or ""), ResourcesType.single, slot0.icon_load)
	slot0.gift_bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getTargetRes("bigbg", slot0.gift_config.bg_res, false, false), ResourcesType.single, slot0.gift_bg_load)

	slot0.title_txt:setString(slot0.gift_config.name)

	if slot0.gift_config.bg_res == "txt_cn_bigbg_25" then
		slot0.title_txt:enableOutline(cc.c3b(50, 60, 111), 2)
	elseif slot0.gift_config.bg_res == "txt_cn_bigbg_26" then
		slot0.title_txt:enableOutline(cc.c3b(56, 24, 70), 2)
	elseif slot0.gift_config.bg_res == "txt_cn_bigbg_27" then
		slot0.title_txt:enableOutline(cc.c3b(124, 55, 21), 2)
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
		slot0.gift_desc_txt = createRichLabel(22, 1, cc.p(0, 1), cc.p(210, 206), 0, nil, 260)

		slot0.container:addChild(slot0.gift_desc_txt)
	end

	slot6 = string.format("<img src='%s' scale=0.3 />", PathTool.getItemRes(3))

	slot0.gift_desc_txt:setString(string.format(slot0.gift_config.desc, slot6, slot6))

	if slot0.gift_config.old_price and slot0.gift_config.old_price > 0 then
		slot0.zhe_panel:setVisible(true)
		slot0.price_txt:setString(slot0.gift_config.old_price .. TI18N("元"))
	else
		slot0.zhe_panel:setVisible(false)
	end

	slot7 = RoleController:getInstance():getRoleVo()

	if Config.ChargeData.data_daily_gift_award[slot2] then
		slot9 = {}

		for slot13, slot14 in pairs(slot8) do
			if slot14.min <= slot7.lev and slot7.lev <= slot14.max then
				slot9 = deepCopy(slot14.reward)

				break
			end
		end

		slot10 = {}

		for slot14, slot15 in pairs(slot9) do
			if deepCopy(Config.ItemData.data_get_data(slot15[1])) then
				slot16.quantity = slot15[2]

				table.insert(slot10, slot16)
			end
		end

		slot0.good_scrollview:setData(slot10)

		slot11 = false

		if slot0.gift_config and slot0.gift_config.is_double and slot0.gift_config.is_double == 1 then
			slot11 = true
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

function ChargeDialyItem.getData(slot0)
	return slot0.data
end

function ChargeDialyItem.DeleteMe(slot0)
	if slot0.gift_bg_load then
		slot0.gift_bg_load:DeleteMe()

		slot0.gift_bg_load = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.send_buy_gift_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_buy_gift_ticket)

		slot0.send_buy_gift_ticket = nil
	end

	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
