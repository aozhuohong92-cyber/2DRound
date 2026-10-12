SliverSellWindow = SliverSellWindow or BaseClass(BaseView)

function SliverSellWindow.__init(slot0)
	slot0.ctrl = MarketController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "market/sliver_sell_window"
	slot0.res_list = {}
end

function SliverSellWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")

	slot0.title_label:setString(TI18N("出售商品"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.info_con = slot0.main_container:getChildByName("info_con")
	slot0.name = slot0.info_con:getChildByName("name")
	slot0.down_btn = slot0.info_con:getChildByName("down_btn")

	slot0.down_btn:setTitleText(TI18N("免费下架"))

	slot0.down_btn.label = slot0.down_btn:getTitleRenderer()

	if slot0.down_btn.label ~= nil then
		slot0.down_btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	end

	slot0.up_btn = slot0.info_con:getChildByName("up_btn")

	slot0.up_btn:setTitleText(TI18N("重新上架"))

	slot0.up_btn.label = slot0.up_btn:getTitleRenderer()

	if slot0.up_btn.label ~= nil then
		slot0.up_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.price_min_btn = slot0.info_con:getChildByName("price_min_btn")
	slot0.price_plus_btn = slot0.info_con:getChildByName("price_plus_btn")
	slot0.num_min_btn = slot0.info_con:getChildByName("num_min_btn")
	slot0.num_plus_btn = slot0.info_con:getChildByName("num_plus_btn")
	slot0.price_val = slot0.info_con:getChildByName("price_val")
	slot0.num_val = slot0.info_con:getChildByName("num_val")
	slot0.total_val = slot0.info_con:getChildByName("total_val")
	slot0.tips = slot0.info_con:getChildByName("tips")
	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setPosition(150, 470)
	slot0.main_container:addChild(slot0.goods_item)
end

function SliverSellWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	slot0:setData()
end

function SliverSellWindow.setData(slot0)
	slot1 = Config.ItemData.data_get_data(slot0.data.item_base_id)

	slot0.goods_item:setData(slot1)
	slot0.name:setString(slot1.name)

	slot0.price = slot0.data.price
	slot0.precent = 1
	slot0.add_precent = 0.05
	slot0.num = slot0.data.num
	slot0.own_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.data.item_base_id)

	slot0.price_val:setString(slot0.data.price)

	slot0.default_price = slot0.data.price

	slot0.num_val:setString(slot0.data.num)
	slot0.total_val:setString(slot0.data.price * slot0.data.num)
end

function SliverSellWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSliveSellWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSliveSellWindow(false)
			end
		end)
	end

	slot0.price_plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot5 = 183
			slot6 = ""

			if uv0.default_price * (uv0.add_precent + uv0.precent) <= Config.MarketSilverData.data_antique_list[uv0.data.item_base_id].max_price and slot3 <= Config.MarketSilverData.data_market_sliver_cost.silvermarket_salereduce.val / 100 then
				uv0.precent = uv0.add_precent + uv0.precent
				uv0.price = math.floor(slot4)

				uv0.price_val:setString(uv0.price)
				uv0.total_val:setString(uv0.price * uv0.num)
			else
				message(TI18N("不能再贵了"))
			end

			if uv0.price / uv0.default_price * 100 - 100 > 0 then
				slot5 = 183
				slot6 = TI18N("推荐单价+" .. slot7 .. "%")
			elseif slot7 < 0 then
				slot5 = 173
				slot6 = TI18N("推荐单价" .. slot7 .. "%")
			else
				slot6 = ""
			end

			uv0.tips:setString(slot6)
			uv0.tips:setTextColor(Config.ColorData.data_color4[slot5])
		end
	end)
	slot0.price_min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot3 = 183
			slot4 = ""
			slot5 = Config.MarketSilverData.data_market_sliver_cost

			if Config.MarketSilverData.data_antique_list[uv0.data.item_base_id].min_price <= uv0.default_price * (uv0.precent - uv0.add_precent) and slot6 >= Config.MarketSilverData.data_market_sliver_cost.silvermarket_saleplus.val / 100 then
				uv0.precent = uv0.precent - uv0.add_precent
				uv0.price = math.floor(slot7)

				uv0.price_val:setString(uv0.price)
				uv0.total_val:setString(uv0.price * uv0.num)
			else
				message(TI18N("不能再便宜了"))
			end

			if uv0.price / uv0.default_price * 100 - 100 > 0 then
				slot3 = 183
				slot4 = TI18N("推荐单价+" .. slot8 .. "%")
			elseif slot8 < 0 then
				slot3 = 173
				slot4 = TI18N("推荐单价" .. slot8 .. "%")
			else
				slot4 = ""
			end

			uv0.tips:setString(slot4)
			uv0.tips:setTextColor(Config.ColorData.data_color4[slot3])
		end
	end)
	slot0.num_min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.num - 1 >= 1 then
				uv0.num = slot2

				uv0.num_val:setString(uv0.num)
				uv0.total_val:setString(uv0.price * uv0.num)
			else
				message(TI18N("不能再少了"))
			end
		end
	end)
	slot0.num_plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.num + 1 <= uv0.own_num then
				uv0.num = slot2

				uv0.num_val:setString(uv0.num)
				uv0.total_val:setString(uv0.price * uv0.num)
			else
				message(TI18N("不能再多了"))
			end
		end
	end)
	slot0.down_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:sender23506(uv0.data.cell_id)
			uv0.ctrl:openSliveSellWindow(false)
		end
	end)
	slot0.up_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:sender23513(uv0.data.cell_id, uv0.precent * 100, uv0.num)
			uv0.ctrl:openSliveSellWindow(false)
		end
	end)
end

function SliverSellWindow.close_callback(slot0)
	slot0.ctrl:openSliveSellWindow(false)
end
