SliverGroundingWindow = SliverGroundingWindow or BaseClass(BaseView)

function SliverGroundingWindow.__init(slot0)
	slot0.ctrl = MarketController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "market/sliver_grounding_window"
	slot0.res_list = {}
	slot0.goods_list = {}
	slot0.select_item = nil
	slot0.precent = 1
	slot0.add_precent = 0.05
end

function SliverGroundingWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")

	slot0.title_label:setString(TI18N("可摆摊物品"))

	slot0.empty_tips = slot0.main_container:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("empty_label"):setString(TI18N("请点击上方的物品\n\n选择多个物品可批量上架"))

	slot0.info_con = slot0.main_container:getChildByName("info_con")
	slot0.price_min_btn = slot0.info_con:getChildByName("price_min_btn")
	slot0.price_plus_btn = slot0.info_con:getChildByName("price_plus_btn")
	slot0.num_min_btn = slot0.info_con:getChildByName("num_min_btn")
	slot0.num_plus_btn = slot0.info_con:getChildByName("num_plus_btn")
	slot0.price_val = slot0.info_con:getChildByName("price_val")
	slot0.num_val = slot0.info_con:getChildByName("num_val")
	slot0.total_val = slot0.info_con:getChildByName("total_val")
	slot0.tips = slot0.info_con:getChildByName("tips")
	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setPosition(78, 116)
	slot0.info_con:addChild(slot0.goods_item)
	slot0.info_con:setVisible(false)

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.ok_btn = slot0.main_container:getChildByName("ok_btn")

	slot0.ok_btn:setTitleText(TI18N("确定上架"))

	slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

	if slot0.ok_btn.label ~= nil then
		slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.one_up_btn = slot0.main_container:getChildByName("one_up_btn")

	slot0.one_up_btn:setTitleText(TI18N("一键上架"))

	slot0.one_up_btn.label = slot0.one_up_btn:getTitleRenderer()

	if slot0.one_up_btn.label ~= nil then
		slot0.one_up_btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	end

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function SliverGroundingWindow.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.cell_id = slot2

	slot0:setData()
end

function SliverGroundingWindow.setData(slot0)
	slot1 = 3
	slot2 = 15
	slot3 = #slot0.data
	slot1 = math.max(math.ceil(slot3 / 15), 3)

	print("====len===", slot3)

	if #slot0.data == 0 then
		for slot8 = 1, slot1 * slot2 do
		end

		slot0.data = {
			[slot8] = {}
		}
	elseif #slot0.data < slot1 * slot2 then
		for slot7 = #slot0.data + 1, slot1 * slot2 do
			table.insert(slot0.data, {})
		end
	end

	slot0.page_view = CustomPageView.new(slot0.goods_con:getContentSize(), false, true, 10, 20, slot1)

	slot0.goods_con:addChild(slot0.page_view)

	slot0.page_view.per_page = slot2

	slot0.page_view:addCreatePageCallBack(function (slot0, slot1, slot2)
		slot5 = 1
		slot6 = 0.8

		for slot10 = uv0.page_view.per_page * (slot1 - 1) + 1, uv0.page_view.per_page * slot1 do
			slot11 = BackPackItem.new(true, true)
			slot11.id = slot0[slot10].id or 0
			slot11.num = slot0[slot10].num or 0

			if deepCopy(Config.ItemData.data_get_data(slot0[slot10].base_id)) then
				slot12.quantity = slot11.num
			end

			slot11:setData(slot12 or slot0[slot10])
			slot2:addChild(slot11)
			slot11:setScale(slot6)
			slot11:setPosition(63 + (slot5 - 1) % 5 * (BackPackItem.Width * slot6 + 13), 295 - math.floor((slot5 - 1) / 5) * (BackPackItem.Height * slot6 + 10))

			uv0.goods_list[slot10] = slot11

			slot11:addCallBack(function (slot0)
				uv0:itemCallBack(slot0)
			end)

			slot5 = slot5 + 1
		end
	end)
	slot0.page_view:setViewData(slot0.data)
	slot0.page_view:adjustLightPos(10, 20, 10)
end

function SliverGroundingWindow.itemCallBack(slot0, slot1)
	if slot1:getData() and slot2.id ~= nil then
		if slot0.select_item ~= nil then
			slot0.select_item:setSelected(false)
		end

		slot0.select_item = slot1

		slot1:setSelected(true)
		slot0.empty_tips:setVisible(false)
		slot0.ctrl:sender23508(slot2.id)
	end
end

function SliverGroundingWindow.setInfoCon(slot0, slot1)
	if slot0.select_item == nil then
		return
	end

	if slot1.item_base_id == slot0.select_item:getData().id then
		slot0.info_con:setVisible(true)
		slot0.price_val:setString(slot1.price)

		slot0.num = 1

		slot0.num_val:setString(slot0.num)

		slot0.price = slot1.price
		slot0.default_price = slot1.price

		slot0.total_val:setString(slot1.price * slot0.num)
		slot0.goods_item:setData(Config.ItemData.data_get_data(slot1.item_base_id))
		slot0.goods_item:setDefaultTip()
	end
end

function SliverGroundingWindow.register_event(slot0)
	if slot0.sliver_price == nil then
		slot0.sliver_price = GlobalEvent:getInstance():Bind(MarketEvent.Sliver_Price, function (slot0)
			uv0:setInfoCon(slot0)
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSliverGroundingWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSliverGroundingWindow(false)
			end
		end)
	end

	slot0.price_plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot5 = 183
			slot6 = ""

			if uv0.default_price * (uv0.add_precent + uv0.precent) <= Config.MarketSilverData.data_antique_list[uv0.select_item:getData().id].max_price and slot3 <= Config.MarketSilverData.data_market_sliver_cost.silvermarket_salereduce.val / 100 then
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

			slot5 = 183
			slot6 = ""
			slot7 = Config.MarketSilverData.data_market_sliver_cost

			if Config.MarketSilverData.data_antique_list[uv0.select_item:getData().id].min_price <= uv0.default_price * (uv0.precent - uv0.add_precent) and slot3 >= Config.MarketSilverData.data_market_sliver_cost.silvermarket_saleplus.val / 100 then
				uv0.precent = uv0.precent - uv0.add_precent
				uv0.price = math.floor(slot4)

				uv0.price_val:setString(uv0.price)
				uv0.total_val:setString(uv0.price * uv0.num)
			else
				message(TI18N("不能再便宜了"))
			end

			if uv0.price / uv0.default_price * 100 - 100 > 0 then
				slot5 = 183
				slot6 = TI18N("推荐单价+" .. slot8 .. "%")
			elseif slot8 < 0 then
				slot5 = 173
				slot6 = TI18N("推荐单价" .. slot8 .. "%")
			else
				slot6 = ""
			end

			uv0.tips:setString(slot6)
			uv0.tips:setTextColor(Config.ColorData.data_color4[slot5])
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

			if uv0.num + 1 <= uv0.select_item.num then
				if slot2 > 5 then
					message(TI18N("同个摊位最多只能上架5个物品哟！"))
				else
					uv0.num = slot2

					uv0.num_val:setString(uv0.num)
					uv0.total_val:setString(uv0.price * uv0.num)
				end
			else
				message(TI18N("不能再多了"))
			end
		end
	end)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.select_item ~= nil then
				slot3 = BackpackController:getInstance():getModel():getBackPackItemIDByBid(uv0.select_item:getData().id)

				uv0.ctrl:sender23504(1, uv0.select_item.id, uv0.num, uv0.precent * 100, uv0.cell_id)
				uv0.ctrl:openSliverGroundingWindow(false)
			end
		end
	end)
	slot0.one_up_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openSliverOneUpWindow(true, uv0.data)
		end
	end)
end

function SliverGroundingWindow.close_callback(slot0)
	if slot0.sliver_price then
		GlobalEvent:getInstance():UnBind(slot0.sliver_price)

		slot0.sliver_price = nil
	end

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	for slot4, slot5 in pairs(slot0.goods_list) do
		slot5:DeleteMe()
	end

	slot0.goods_list = nil

	slot0.ctrl:openSliverGroundingWindow(false)
end
