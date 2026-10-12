MarketBuyWindow = MarketBuyWindow or BaseClass(BaseView)

function MarketBuyWindow.__init(slot0)
	slot0.ctrl = MarketController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "mall/mall_buy_panel"
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.limit_num = 20
	slot0.has_buy = 0
	slot0.can_buy_num = 0
	slot0.is_can_buy_max = true
end

function MarketBuyWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.title_label = slot0.title_con:getChildByName("title_label")
	slot0.ok_btn = slot0.main_container:getChildByName("ok_btn")
	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")

	slot0.cancel_btn:setTitleText(TI18N("取消"))

	slot0.cancel_btn.label = slot0.cancel_btn:getTitleRenderer()

	if slot0.cancel_btn.label ~= nil then
		slot0.cancel_btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	end

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item_con = slot0.main_container:getChildByName("item_con")
	slot0.name = slot0.item_con:getChildByName("name")
	slot0.coin = slot0.item_con:getChildByName("coin")
	slot0.price = slot0.item_con:getChildByName("price")
	slot0.limit = slot0.item_con:getChildByName("limit")
	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setPosition(110, slot0.item_con:getContentSize().height / 2 - 2)
	slot0.item_con:addChild(slot0.goods_item)

	slot0.info_con = slot0.main_container:getChildByName("info_con")
	slot0.slider = slot0.info_con:getChildByName("slider")

	slot0.slider:setBarPercent(10, 89)

	slot0.buy_count_title = slot0.info_con:getChildByName("buy_count_title")
	slot0.plus_btn = slot0.info_con:getChildByName("plus_btn")
	slot0.buy_count = slot0.info_con:getChildByName("buy_count")
	slot0.num = 1
	slot0.price_val = 1

	slot0.buy_count:setString(slot0.num)

	slot0.min_btn = slot0.info_con:getChildByName("min_btn")
	slot0.max_btn = slot0.info_con:getChildByName("max_btn")

	slot0.info_con:getChildByName("total_price_title"):setString(TI18N("总价："))

	slot0.total_price = slot0.info_con:getChildByName("total_price")
	slot0.tips_label = createLabel(22, 15, nil, 385, 277, TI18N("只能买这么多了"), slot0.main_container, nil, cc.p(0.5, 0.5))

	slot0.tips_label:setVisible(false)
end

function MarketBuyWindow.openRootWnd(slot0, slot1, slot2)
	slot0.type = slot1
	slot0.data = slot2
	slot0.win = slot0.ctrl:getMarketMainWin()

	if slot0.win and slot0.win:getCurIndex() == MarketTabConst.gold_market then
		slot0.ctrl:sender23520()
		slot0.ctrl:sender23500(slot0.win:getCurSonIndex())
	elseif slot0.win and slot0.win:getCurIndex() == MarketTabConst.gold_sell then
		if Config.MarketGoldData.data_change_sell_list[slot2.base_id] then
			slot3 = {}

			table.insert(slot3, {
				base_id = Config.MarketGoldData.data_change_sell_list[slot2.base_id].exchange_id
			})
			slot0.ctrl:sender23516(slot3)
		else
			slot3 = {}

			table.insert(slot3, {
				base_id = slot2.base_id
			})
			slot0.ctrl:sender23516(slot3)
		end
	else
		slot0:setData(slot2)
	end

	if slot0.type == 1 or slot0.type == 2 then
		slot0.title_label:setString(TI18N("购买"))
		slot0.ok_btn:setTitleText(TI18N("购买"))

		slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

		if slot0.ok_btn.label ~= nil then
			slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
		end

		slot0.buy_count_title:setString(TI18N("购买数量："))
	elseif slot0.type == 3 then
		slot0.title_label:setString(TI18N("出售"))
		slot0.ok_btn:setTitleText(TI18N("出售"))

		slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

		if slot0.ok_btn.label ~= nil then
			slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
		end

		slot0.buy_count_title:setString(TI18N("出售数量："))
	end
end

function MarketBuyWindow.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = Config.ItemData.data_get_data(slot1.base_id or slot1.item_base_id)

	slot0.goods_item:setData(slot2)
	slot0.goods_item:setDefaultTip()
	slot0.name:setString(slot2.name)

	if slot1.limit_num and slot1.limit_num > 0 or slot1.num then
		slot0.limit_num = slot1.limit_num or slot1.num
	else
		slot0.limit_num = 20
	end

	slot0.has_buy = slot1.has_buy or 0
	slot0.price_val = slot1.cur_price or slot1.price or 1

	slot0.price:setString(slot1.cur_price or slot1.price)

	if slot0.type == 1 and slot1.limit_num and slot1.limit_num > 0 and slot1.limit_type then
		slot0.limit:setString(TI18N("限购") .. slot1.limit_num .. TI18N("个"))

		slot0.is_can_buy_max = true
	elseif slot0.type == 2 and slot1.num and slot1.status then
		slot0.limit:setString(TI18N("数量：") .. slot1.num)

		slot0.is_can_buy_max = true
	elseif slot0.type == 3 and slot1.num then
		slot0.limit:setString(TI18N("拥有：") .. slot1.num)

		slot0.price_val = math.floor(slot0.model:getPrice(slot1.base_id)) or 1

		slot0.price:setString(slot0.price_val)

		slot0.limit_num = slot1.num
	end

	if slot0.type == 1 then
		slot0.can_buy_num = math.max(1, math.floor(slot0.role_vo.coin / slot0.price_val))

		if slot0.can_buy_num < slot0.limit_num then
			slot0.limit_num = slot0.can_buy_num

			slot0.tips_label:setVisible(false)

			slot0.is_can_buy_max = false
		end
	elseif slot0.type == 2 then
		slot0.can_buy_num = math.max(1, math.floor(slot0.role_vo.silver_coin / slot0.price_val))

		if slot0.can_buy_num < slot0.limit_num then
			slot0.limit_num = slot0.can_buy_num

			slot0.tips_label:setVisible(false)

			slot0.is_can_buy_max = false
		end
	end

	slot3 = nil

	slot0.coin:loadTexture(PathTool.getItemRes(((slot0.type ~= 2 or Config.ItemData.data_get_data(2)) and Config.ItemData.data_get_data(1)).icon), LOADTEXT_TYPE)
	slot0:setCurUseItemInfoByNum(slot0.num)
end

function MarketBuyWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openBuyOrSellWindow(false)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:openBuyOrSellWindow(false)
			end
		end)
	end

	if slot0.slider ~= nil then
		slot0.slider:addEventListener(function (slot0, slot1)
			if slot1 == ccui.SliderEventType.percentChanged then
				if uv0.type == 1 or uv0.type == 2 then
					if uv0.slider:getPercent() == 100 and uv0.limit_num <= uv0.can_buy_num and uv0.is_can_buy_max == false then
						uv0.tips_label:setVisible(true)
					else
						uv0.tips_label:setVisible(false)
					end
				end

				uv0:setCurUseItemInfoByPercent(uv0.slider:getPercent())
			end
		end)
	end

	slot0.min_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 0 then
				return
			end

			if uv0.num == 0 then
				return
			end

			uv0.num = uv0.num - 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.plus_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.num >= uv0.limit_num - uv0.has_buy then
				return
			end

			uv0.num = uv0.num + 1

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)
	slot0.max_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.slider:getPercent() == 100 then
				return
			end

			if uv0.num >= uv0.limit_num - uv0.has_buy then
				return
			end

			uv0.num = uv0.limit_num - uv0.has_buy

			uv0:setCurUseItemInfoByNum(uv0.num)
		end
	end)

	if slot0.ok_btn then
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.type == 1 then
					uv0.ctrl:sender23501(uv0.data.base_id, uv0.num)
				elseif uv0.type == 2 then
					uv0.ctrl:sender23505(uv0.data.type, uv0.data.id, uv0.num)
				elseif uv0.type == 3 then
					uv0.ctrl:sender23502(uv0.data.id, uv0.num)
				end

				uv0.ctrl:openBuyOrSellWindow(false)
			end
		end)
	end

	if slot0.cancel_btn then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openBuyOrSellWindow(false)
			end
		end)
	end

	if slot0.update_gold_market == nil then
		slot0.update_gold_market = GlobalEvent:getInstance():Bind(MarketEvent.Update_Gold_Category, function (slot0)
			if uv0.win and uv0.win:getCurIndex() == MarketTabConst.gold_market and uv0.win:getCurSonIndex() == slot0.catalg then
				for slot5, slot6 in pairs(uv0.model:getShowGoldShowList(slot0.catalg)) do
					if uv0.data.base_id == slot6.base_id then
						uv0:setData(slot6)

						return
					end
				end
			end
		end)
	end

	if slot0.update_price == nil then
		slot0.update_price = GlobalEvent:getInstance():Bind(MarketEvent.Gold_Sell_Price, function ()
			uv0:setData(uv0.data)
		end)
	end
end

function MarketBuyWindow.setCurUseItemInfoByPercent(slot0, slot1)
	slot0.num = math.floor(slot1 * (slot0.limit_num - slot0.has_buy) * 0.01)

	slot0.buy_count:setString(slot0.num)
	slot0.total_price:setString(slot0.num * slot0.price_val)
end

function MarketBuyWindow.setCurUseItemInfoByNum(slot0, slot1)
	slot0.num = slot1

	slot0.slider:setPercent(slot0.num / (slot0.limit_num - slot0.has_buy) * 100)
	slot0.buy_count:setString(slot0.num)
	slot0.total_price:setString(slot0.num * slot0.price_val)

	if slot0.type == 1 or slot0.type == 2 then
		if slot2 == 100 and slot0.is_can_buy_max == false and slot0.limit_num <= slot0.can_buy_num then
			slot0.tips_label:setVisible(true)
		else
			slot0.tips_label:setVisible(false)
		end
	end
end

function MarketBuyWindow.close_callback(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	if slot0.update_gold_market then
		GlobalEvent:getInstance():UnBind(slot0.update_gold_market)

		slot0.update_gold_market = nil
	end

	if slot0.update_price then
		GlobalEvent:getInstance():UnBind(slot0.update_price)

		slot0.update_price = nil
	end

	slot0.ctrl:openBuyOrSellWindow(false)
end
