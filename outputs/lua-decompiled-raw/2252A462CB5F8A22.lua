VarietyStoreWindows = VarietyStoreWindows or BaseClass(BaseView)
slot1 = MallController:getInstance():getModel()

function VarietyStoreWindows.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/varietystore_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("varietystore", "varietystore"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_72", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_73"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_74"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_75"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_76"),
			type = ResourcesType.single
		}
	}
end

function VarietyStoreWindows.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_72", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.refresh_label = slot1:getChildByName("refresh_label")
	slot0.time_label = slot1:getChildByName("time_label")

	slot0.time_label:setString("0:00:00")

	slot0.refresh_btn = slot1:getChildByName("refresh_btn")
	slot0.refresh_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(82, 30))

	slot0.refresh_btn:addChild(slot0.refresh_btn_label)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot2 = slot1:getChildByName("item_list")
	slot3 = slot2:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, -40), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height + 50), {
		start_y = 30,
		item_width = 158,
		start_x = 20,
		space_x = 38,
		row = 0,
		item_height = 214,
		space_y = 85,
		col = 3,
		item_class = VarietyStoreItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:setBounceEnabled(false)
	slot0:adaptationScreen()
end

function VarietyStoreWindows.adaptationScreen(slot0)
	slot0.close_btn:setPositionY(slot0.close_btn:getPositionY() + display.getBottom(slot0.main_container))
end

function VarietyStoreWindows.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.refresh_btn, handler(slot0, slot0._onClickRefreshBtn), true, 2)
	slot0:addGlobalEvent(MallEvent.Get_Buy_list, function (slot0)
		if slot0.type == MallConst.MallType.VarietyShop and slot0 then
			uv0:setData(slot0)
		end
	end)
	slot0:addGlobalEvent(MallEvent.Free_Refresh_Data, function (slot0)
		if slot0.type == MallConst.MallType.VarietyShop and slot0 and uv0.data then
			for slot4, slot5 in pairs(slot0) do
				uv0.data[slot4] = slot5
			end

			uv0:updateRefreshInfo()
		end
	end)
end

function VarietyStoreWindows.setData(slot0, slot1)
	slot0.data = slot1 or {}

	slot0:updateRefreshInfo()

	for slot5, slot6 in ipairs(slot1.item_list or {}) do
		slot6.index = slot5
	end

	slot0.item_scrollview:setData(slot1.item_list or {})
end

function VarietyStoreWindows.updateRefreshInfo(slot0)
	if slot0.data then
		slot0.refresh_label:setString(string.format(TI18N("刷新次数:%d/%d"), slot0.data.count, Config.ExchangeData.data_shop_exchage_cost.maximum_number.val))

		slot2 = ""

		if slot0.data.free_count > 0 then
			slot3 = Config.ExchangeData.data_shop_exchage_cost.max_free_times
			slot2 = string.format(TI18N("<div fontcolor=#ffffff outline=2,#294a15>刷新(%d/%d)</div>"), slot0.data.free_count, slot3.val)

			if slot0.data.free_count == slot3.val then
				addRedPointToNodeByStatus(slot0.refresh_btn, true, 5, 5)
			else
				addRedPointToNodeByStatus(slot0.refresh_btn, false, 5, 5)
			end
		else
			addRedPointToNodeByStatus(slot0.refresh_btn, false)

			if Config.ExchangeData.data_shop_list[MallConst.MallType.VarietyShop] and slot3.cost_list then
				if Config.ItemData.data_get_data(slot3.cost_list[1][1]) then
					slot2 = string.format(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#ffffff outline=2,#294a15>%d 刷新</div>"), PathTool.getItemRes(slot6.icon), slot3.cost_list[1][2])
				end
			end
		end

		slot0.refresh_btn_label:setString(slot2)

		if slot0.data.refresh_time > 0 then
			if slot0.data.refresh_time - GameNet:getInstance():getTime() < 0 then
				slot3 = 0

				slot0:openRefreshTimer(false)
			else
				slot0:openRefreshTimer(true)
			end

			slot0.time_label:setString(TimeTool.GetTimeFormat(slot3))
		else
			slot0:openRefreshTimer(false)
			slot0.time_label:setString("0:00:00")
		end
	end
end

function VarietyStoreWindows.openRefreshTimer(slot0, slot1)
	if slot1 == true then
		if slot0.refresh_timer == nil then
			slot0.refresh_timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0.data and uv0.data.refresh_time > 0 then
					if uv0.data.refresh_time - GameNet:getInstance():getTime() < 0 then
						GlobalTimeTicket:getInstance():remove(uv0.refresh_timer)

						uv0.refresh_timer = nil
					end

					uv0.time_label:setString(TimeTool.GetTimeFormat(slot0))
				else
					uv0.time_label:setString("0:00:00")
					GlobalTimeTicket:getInstance():remove(uv0.refresh_timer)

					uv0.refresh_timer = nil
				end
			end, 1)
		end
	elseif slot0.refresh_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.refresh_timer)

		slot0.refresh_timer = nil
	end
end

function VarietyStoreWindows._onClickCloseBtn(slot0)
	uv0:openVarietyStoreWindows(false)
end

function VarietyStoreWindows._onClickRefreshBtn(slot0)
	if slot0.data then
		uv0:sender13405(MallConst.MallType.VarietyShop)
	end
end

function VarietyStoreWindows.openRootWnd(slot0)
	uv0:sender13403(MallConst.MallType.VarietyShop)
end

function VarietyStoreWindows.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:openRefreshTimer(false)
	uv0:openVarietyStoreWindows(false)
end

VarietyStoreItem = class("VarietyStoreItem", function ()
	return ccui.Widget:create()
end)

function VarietyStoreItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function VarietyStoreItem.configUI(slot0)
	slot0.size = cc.size(158, 214)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mall/varietystore_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2

	slot2:getChildByName("btn_buy"):setTouchEnabled(false)

	slot0.pos_node = slot2:getChildByName("pos_node")
	slot0.image_zhe = slot2:getChildByName("image_zhe")

	slot0.image_zhe:setVisible(false)

	slot0.zhe_label = slot0.image_zhe:getChildByName("zhe_label")
	slot0.image_buy = slot2:getChildByName("image_buy")

	slot0.image_buy:setVisible(false)
end

function VarietyStoreItem.register_event(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0._onClickItem), true)

	if not slot0.buy_success_event then
		slot0.buy_success_event = GlobalEvent:getInstance():Bind(MallEvent.Buy_One_Success, function (slot0)
			if uv0.data and uv0.data.order and slot0.order == uv0.data.order then
				uv0.data.has_buy = uv0.data.has_buy + 1

				if uv0.data.limit_count and uv0.data.limit_count <= uv0.data.has_buy then
					uv0:showSellOutStatus(true)
				end
			end
		end)
	end
end

function VarietyStoreItem._onClickItem(slot0)
	if slot0.data and slot0.data.order then
		if GuideController:getInstance():isInGuide() then
			uv0:sender13407(slot0.data.order, MallConst.MallType.VarietyShop, 1)
		else
			slot0:showAlert(slot0.data)
		end
	end
end

function VarietyStoreItem.showAlert(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.price

	if slot1.discount ~= 0 then
		slot2 = slot1.discount
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot2 <= BackpackController:getInstance():getModel():getItemNumByBid(slot1.pay_type) then
		slot6 = BackPackConst.Bag_Code.BACKPACK

		if Config.ItemData.data_get_data(slot1.item_id).sub_type == 1 then
			slot6 = BackPackConst.Bag_Code.EQUIPS
		end

		CommonAlert.show(string.format(TI18N("是否购买<div fontColor=#289b14 fontsize= 26>%s</div>(拥有:<div fontColor=#289b14 fontsize= 26>%d</div>)？"), slot5.name, BackpackController:getInstance():getModel():getItemNumByBid(slot1.item_id, slot6)), TI18N("确定"), function ()
			uv0:sender13407(uv1.order, MallConst.MallType.VarietyShop, 1)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		slot5 = nil

		if (type(slot1.pay_type) ~= "number" or Config.ItemData.data_get_data(slot1.pay_type)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot1.pay_type]) then
			if slot5.id == Config.ItemData.data_assets_label2id.gold then
				if FILTER_CHARGE then
					message(TI18N("钻石不足"))
				else
					CommonAlert.show(string.format(TI18N("%s不足，是否前往充值？"), slot5.name), TI18N("确定"), function ()
						VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , , true)
				end
			else
				BackpackController:getInstance():openTipsSource(true, slot5)
			end
		end
	end
end

function VarietyStoreItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1.index then
		slot0.container:setName("buy_btn_" .. slot1.index)
	end

	if not slot0.price_label then
		slot0.price_label = createRichLabel(26, cc.c3b(71, 44, 30), cc.p(0.5, 0.5), cc.p(slot0.size.width / 2, 30))

		slot0.container:addChild(slot0.price_label)
	end

	if Config.ItemData.data_get_data(slot1.pay_type) then
		slot4 = PathTool.getItemRes(slot3.icon)
		slot5 = slot1.price

		if slot1.discount > 0 then
			slot5 = slot1.discount
		end

		slot0.price_label:setString(string.format("<img src='%s' scale=0.3 /> %s", slot4, MoneyTool.GetMoneyString(slot5)))
	end

	if not slot0.item_icon then
		slot0.item_icon = BackPackItem.new(false, true, false, 1, nil, true)

		slot0.item_icon:setDefaultTip(true, false)
		slot0.item_icon:setAnchorPoint(cc.p(0.5, 0))
		slot0.pos_node:addChild(slot0.item_icon)
	end

	slot0.item_icon:setBaseData(slot1.item_id, slot1.item_num)

	if slot1.discount > 0 then
		slot0.image_zhe:setVisible(true)
		slot0.zhe_label:setString(string.format(TI18N("%d折"), slot1.discount_type))
	else
		slot0.image_zhe:setVisible(false)
	end

	slot1.limit_count = 1

	if slot1.has_buy and slot1.limit_count and slot1.limit_count <= slot1.has_buy then
		slot0:showSellOutStatus(true)
	else
		slot0:showSellOutStatus(false)
	end
end

function VarietyStoreItem.showSellOutStatus(slot0, slot1)
	if slot0.item_icon then
		slot0.item_icon:setItemIconUnEnabled(slot1)
	end

	if slot0.image_buy then
		slot0.image_buy:setVisible(slot1)
	end

	if slot0.container then
		slot0.container:setTouchEnabled(not slot1)
	end
end

function VarietyStoreItem.DeleteMe(slot0)
	if slot0.item_icon then
		slot0.item_icon:DeleteMe()

		slot0.item_icon = nil
	end

	if slot0.buy_success_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_event)

		slot0.buy_success_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
