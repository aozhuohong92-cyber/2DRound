AdventureShopWindow = AdventureShopWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = GameNet:getInstance()

function AdventureShopWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.index = 2
	slot0.layout_name = "adventure/adventure_shop_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall", "mall"),
			type = ResourcesType.plist
		}
	}
end

function AdventureShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("冒险商城"))
	slot1:getChildByName("time_title"):setString(TI18N("商城重置:"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.list_panel = slot1:getChildByName("list_panel")
	slot0.time_value = slot1:getChildByName("time_value")
	slot0.empty_tips = slot1:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无商品，快去寻找冒险商人吧"))

	slot0.item = slot1:getChildByName("item")

	slot0.item:setVisible(false)
end

function AdventureShopWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openAdventrueShopWindow(false)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:openAdventrueShopWindow(false)
		end
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateShopTotalEvent, function (slot0)
		uv0:updateShopTotalList(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateShopItemEvent, function (slot0)
		uv0:updateSingleShopItem(slot0)
	end)
end

function AdventureShopWindow.updateShopTotalList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		slot0.empty_tips:setVisible(true)
	else
		slot0.empty_tips:setVisible(false)

		function slot2(slot0, slot1)
			uv0:selectItemHandle(slot0, slot1)
		end

		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_panel, nil, , , slot0.list_panel:getContentSize(), {
				start_y = 0,
				item_width = 306,
				start_x = 0,
				space_x = 0,
				row = 2,
				item_height = 143,
				space_y = 4,
				col = 2,
				need_dynamic = true,
				item_class = AdventureShopItem
			})
		end

		uv0(slot1, function (slot0, slot1)
			return slot0.is_buy < slot1.is_buy
		end)
		slot0.scroll_view:setVisible(true)
		slot0.scroll_view:setData(slot1, slot2, nil, slot0.item)
	end
end

function AdventureShopWindow.selectItemHandle(slot0, slot1, slot2)
	if slot1 == nil or slot1.item_config == nil or slot1.buy_config == nil then
		return
	end

	if slot2 and slot2.is_buy == 1 then
		message(TI18N("该物品已被购买"))

		return
	end

	CommonAlert.show(string.format("%s<img src=%s visible=true scale=0.3 />%s%s<div fontColor=%s>%s</div>x%s", TI18N("是否消耗"), PathTool.getItemRes(slot1.buy_config.icon), MoneyTool.GetMoneyString(slot2.pay_val), TI18N("购买"), tranformC3bTostr(BackPackConst.quality_color_id[slot1.item_config.quality] or 0), slot3.name, slot2.num), TI18N("确定"), function ()
		if uv0 then
			uv1:requestBuyShopItem(uv0.id)
		end
	end, TI18N("取消"), nil, CommonAlert.type.rich)

	slot0.select_item = slot1
	slot0.select_data = slot2
end

function AdventureShopWindow.updateSingleShopItem(slot0, slot1)
	if slot0.select_item == nil then
		return
	end

	if slot0.select_data.id == slot1 then
		slot0.select_data.is_buy = 1
	end

	slot0.select_item:updateOverStatus()
end

function AdventureShopWindow.openRootWnd(slot0)
	uv0:requestShopTotal()
	slot0:updateEndTime()
end

function AdventureShopWindow.updateEndTime(slot0)
	slot0.base_data = uv0:getAdventureBaseData()

	if slot0.base_data == nil then
		return
	end

	if slot0.timeticket == nil then
		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function AdventureShopWindow.countDownEndTime(slot0)
	if slot0.base_data == nil then
		slot0:clearEneTime()

		return
	end

	if slot0.base_data.end_time - uv0:getTime() <= 0 then
		slot1 = 0

		slot0:clearEneTime()
	end

	slot0.time_value:setString(TimeTool.GetTimeFormat(slot1))
end

function AdventureShopWindow.clearEneTime(slot0)
	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end
end

function AdventureShopWindow.close_callback(slot0)
	uv0:openAdventrueShopWindow(false)
	slot0:clearEneTime()

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil
end

AdventureShopItem = class("AdventureShopItem", function ()
	return ccui.Layout:create()
end)

function AdventureShopItem.ctor(slot0)
	slot0.is_completed = false
end

function AdventureShopItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)
		slot0.root_wnd:setVisible(true)

		slot0.name = slot0.root_wnd:getChildByName("name")
		slot3 = slot0.root_wnd:getChildByName("count_bg")
		slot0.coin = slot3:getChildByName("coin")
		slot0.price = slot3:getChildByName("price")
		slot0.discount = slot0.root_wnd:getChildByName("discount")
		slot0.discount_num = slot0.discount:getChildByName("discount_num")
		slot0.sold = slot0.root_wnd:getChildByName("sold")
		slot0.grey = slot0.root_wnd:getChildByName("grey")
		slot0.item_container = slot0.root_wnd:getChildByName("item_container")
		slot0.backpack_item = BackPackItem.new(false, true, false, 1, false, true)

		slot0.backpack_item:setPosition(60, 60)
		slot0.item_container:addChild(slot0.backpack_item)
		slot0.grey:setVisible(false)
		slot0:registerEvent()
	end
end

function AdventureShopItem.registerEvent(slot0)
	registerButtonEventListener(slot0.root_wnd, function ()
		if uv0.call_back then
			uv0:call_back(uv0.data)
		end
	end, false, 1)
end

function AdventureShopItem.updateOverStatus(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.is_buy == 1 then
		slot0.sold:setVisible(true)
		slot0.grey:setVisible(true)
	else
		slot0.sold:setVisible(false)
		slot0.grey:setVisible(false)
	end
end

function AdventureShopItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot2 = Config.ItemData.data_get_data(slot1.bid)
		slot0.item_config = slot2
		slot0.buy_config = Config.ItemData.data_get_data(slot1.pay_type)

		if slot2 and slot3 then
			slot0.backpack_item:setBaseData(slot1.bid, slot1.num)
			slot0.name:setString(slot2.name)

			if slot0.icon_res_id ~= PathTool.getItemRes(slot3.icon) then
				slot0.icon_res_id = slot4

				slot0.coin:loadTexture(slot4, LOADTEXT_TYPE)
			end
		end

		slot0.price:setString(MoneyTool.GetMoneyString(slot1.pay_val))

		if slot1.discount ~= 0 then
			slot0.discount:setVisible(true)
			slot0.discount_num:setString(slot1.discount .. TI18N("折"))
		else
			slot0.discount:setVisible(false)
		end

		slot0:updateOverStatus()
	end
end

function AdventureShopItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function AdventureShopItem.suspendAllActions(slot0)
end

function AdventureShopItem.DeleteMe(slot0)
	if slot0.backpack_item then
		slot0.backpack_item:DeleteMe()
	end

	slot0.backpack_item = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
