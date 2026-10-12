SliverOneUpWindow = SliverOneUpWindow or BaseClass(BaseView)

function SliverOneUpWindow.__init(slot0)
	slot0.ctrl = MarketController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "market/sliver_oneup_window"
	slot0.res_list = {}
	slot0.goods_list = {}
	slot0.precent = 1
	slot0.add_precent = 0.05
end

function SliverOneUpWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.return_btn = slot0.main_container:getChildByName("return_btn")

	slot0.return_btn:setTitleText(TI18N("返回"))

	slot0.return_btn.label = slot0.return_btn:getTitleRenderer()

	if slot0.return_btn.label ~= nil then
		slot0.return_btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	end

	slot0.one_up_btn = slot0.main_container:getChildByName("one_up_btn")

	slot0.one_up_btn:setTitleText(TI18N("一键出售"))

	slot0.one_up_btn.label = slot0.one_up_btn:getTitleRenderer()

	if slot0.one_up_btn.label ~= nil then
		slot0.one_up_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.price_min_btn = slot0.main_container:getChildByName("price_min_btn")
	slot0.price_plus_btn = slot0.main_container:getChildByName("price_plus_btn")
	slot0.price_val = slot0.main_container:getChildByName("price_val")

	slot0.price_val:setString("100%")

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")

	slot0.title_label:setString(TI18N("可摆摊物品"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function SliverOneUpWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	slot0:setData()
end

function SliverOneUpWindow.setData(slot0)
	slot1 = 3
	slot2 = 20
	slot1 = math.max(math.ceil(#slot0.data / 20), 3)

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

	slot0.list = {}

	for slot7, slot8 in pairs(slot0.data) do
		if slot8.base_id then
			slot9 = GoodsVo.New(slot8.base_id)

			slot9:initAttrData(slot8)

			slot9.quantity = slot8.num

			slot9:setGoodsAttr("showSellStatus", {
				select = false,
				status = true
			})
			table.insert(slot0.list, slot9)
		else
			table.insert(slot0.list, {})
		end
	end

	slot0.page_view = CustomPageView.new(slot0.goods_con:getContentSize(), false, true, 10, -15, slot1)

	slot0.goods_con:addChild(slot0.page_view)

	slot0.page_view.per_page = slot2

	slot0.page_view:addCreatePageCallBack(function (slot0, slot1, slot2)
		slot5 = 1

		for slot9 = uv0.page_view.per_page * (slot1 - 1) + 1, uv0.page_view.per_page * slot1 do
			slot10 = BackPackItem.new(true, true)

			slot10:setExtendData({
				showCheckBox = true
			})
			slot10:setScale(0.8)
			slot10:setData(slot0[slot9])
			slot2:addChild(slot10)
			slot10:setPosition(65 + (slot5 - 1) % 5 * (BackPackItem.Width * 0.8 + 13), 365 - math.floor((slot5 - 1) / 5) * (BackPackItem.Height * 0.8 + 6))

			uv0.goods_list[slot9] = slot10
			slot10.id = slot0[slot9].id or 0
			slot10.num = slot0[slot9].num or 0
			slot5 = slot5 + 1
		end
	end)
	slot0.page_view:setViewData(slot0.list)
end

function SliverOneUpWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSliverOneUpWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openSliverOneUpWindow(false)
			end
		end)
	end

	slot0.price_plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if 0.05 + uv0.precent <= Config.MarketSilverData.data_market_sliver_cost.silvermarket_salereduce.val / 100 then
				uv0.precent = 0.05 + uv0.precent

				uv0.price_val:setString(uv0.precent * 100 .. "%")
			else
				message(TI18N("不能再贵了"))
			end
		end
	end)
	slot0.price_min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.precent - 0.05 >= Config.MarketSilverData.data_market_sliver_cost.silvermarket_saleplus.val / 100 then
				uv0.precent = uv0.precent - 0.05

				uv0.price_val:setString(uv0.precent * 100 .. "%")
			else
				message(TI18N("不能再便宜了"))
			end
		end
	end)
	slot0.one_up_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot2 = {}

			for slot6, slot7 in pairs(uv0.list) do
				if slot7.showSellStatus and slot7.showSellStatus.select then
					table.insert(slot2, slot7)
				end
			end

			slot8 = "base_id"

			table.sort(slot2, SortTools.KeyLowerSorter(slot8))

			slot3 = uv0.model:getFreeList()
			slot4 = 1

			for slot8, slot9 in pairs(slot2) do
				if slot9.num <= 5 then
					if slot3[slot4] then
						uv0.ctrl:sender23504(1, slot9.id, slot9.num, uv0.precent * 100, slot3[slot4].cell_id)
					end

					slot4 = slot4 + 1
				else
					slot10 = 5

					for slot15 = 1, math.ceil(slot9.num / 5) do
						if slot15 == slot11 - 1 then
							if slot3[slot4] then
								uv0.ctrl:sender23504(1, slot9.id, slot9.num - 5 * slot15, uv0.precent * 100, slot3[slot4].cell_id)
							end
						elseif slot3[slot4] then
							uv0.ctrl:sender23504(1, slot9.id, slot10, uv0.precent * 100, slot3[slot4].cell_id)
						end

						slot4 = slot4 + 1
					end
				end
			end

			uv0.ctrl:openSliverOneUpWindow(false)
			uv0.ctrl:openSliverGroundingWindow(false)
		end
	end)
	slot0.return_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openSliverOneUpWindow(false)
		end
	end)
end

function SliverOneUpWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.goods_list) do
		slot5:DeleteMe()
	end

	slot0.goods_list = nil

	slot0.ctrl:openSliverOneUpWindow(false)
end
