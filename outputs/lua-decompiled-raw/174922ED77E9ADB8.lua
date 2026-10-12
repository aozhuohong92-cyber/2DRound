MarketMainWindow = MarketMainWindow or BaseClass(BaseView)
slot0 = RoleController:getInstance():getRoleVo()
slot1 = MarketController:getInstance()
slot2 = MarketController:getInstance():getModel()

function MarketMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.title_str = TI18N("市场")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("market", "market"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getEmptyMark(),
			type = ResourcesType.single
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("贝里市场"),
			index = MarketTabConst.gold_market
		},
		{
			status = true,
			label = TI18N("银币市场"),
			index = MarketTabConst.sliver_market
		},
		{
			status = true,
			label = TI18N("贝里出售"),
			index = MarketTabConst.gold_sell
		},
		{
			status = true,
			label = TI18N("银币摆摊"),
			index = MarketTabConst.sliver_sell
		}
	}
	slot0.cur_index = nil
	slot0.sub_tab_list = {}
	slot0.cur_son_index = nil
	slot0.cur_son_tab = nil
	slot0.show_list = {}
	slot0.gold_market_list = {
		[0] = TI18N("全部"),
		TI18N("技能"),
		TI18N("高级技能"),
		TI18N("突破"),
		TI18N("其他")
	}
	slot0.sliver_market_list = {
		[0] = TI18N("古董"),
		"",
		"",
		"",
		""
	}
end

function MarketMainWindow.open_callback(slot0)
	slot0.mail_root = createCSBNote(PathTool.getTargetCSB("market/market_main_window"))

	slot0.container:addChild(slot0.mail_root)

	slot0.main_container = slot0.mail_root:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot4 = "tab_container"
	slot0.tab_container = slot0.main_container:getChildByName(slot4)

	for slot4 = 0, 3 do
		slot5 = slot0.tab_container:getChildByName(string.format("guidesign_tab_btn_%s", slot4))
		slot5.label = slot5:getChildByName("title")

		slot5:setBright(false)
		slot5.label:setTextColor(cc.c4b(207, 181, 147, 255))

		slot5.index = slot4 + 1
		slot0.sub_tab_list[slot5.index] = slot5
	end

	slot0.tab_bg = slot0.tab_container:getChildByName("tab_bg")
	slot0.scroll_con = slot0.main_container:getChildByName("scroll_con")
	slot0.title_con = slot0.scroll_con:getChildByName("title_con")
	slot0.setting1 = {
		start_y = 0,
		item_width = 622,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 123,
		space_y = -5,
		col = 1,
		need_dynamic = false,
		item_class = GoldMarketItem
	}
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scroll_con, cc.p(0, 4), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.scroll_con:getContentSize().width, 590), slot0.setting1)
	slot0.tips_btn = slot0.main_container:getChildByName("tips_btn")

	slot0.tips_btn:setTitleText(TI18N("帮助说明"))

	slot0.tips_btn.label = slot0.tips_btn:getTitleRenderer()

	if slot0.tips_btn.label ~= nil then
		slot0.tips_btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	end

	slot0.grounding_btn = slot0.main_container:getChildByName("grounding_btn")

	slot0.grounding_btn:setTitleText(TI18N("重新上架"))

	slot0.grounding_btn.label = slot0.grounding_btn:getTitleRenderer()

	if slot0.grounding_btn.label ~= nil then
		slot0.grounding_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.get_btn = slot0.main_container:getChildByName("get_btn")

	slot0.get_btn:setTitleText(TI18N("一键领取"))

	slot0.get_btn.label = slot0.get_btn:getTitleRenderer()

	if slot0.get_btn.label ~= nil then
		slot0.get_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.refresh_btn = CustomButton.New(slot0.main_container, PathTool.getResFrame("common", "common_1017"), nil, , LOADTEXT_TYPE_PLIST)

	slot0.refresh_btn:setSize(cc.size(158, 64))
	slot0.refresh_btn:setPosition(550, slot0.tips_btn:getPositionY())

	slot0.refresh_time = slot0.main_container:getChildByName("refresh_time")
	slot0.sliver_sell_tips = slot0.main_container:getChildByName("sliver_sell_tips")
	slot0.scroll_con = slot0.main_container:getChildByName("scroll_con")
	slot0.title_con = slot0.scroll_con:getChildByName("title_con")
end

function MarketMainWindow.register_event(slot0)
	for slot4, slot5 in pairs(slot0.sub_tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()

				if uv0.index ~= nil then
					if uv0.can_touch ~= false then
						uv1:changeSonTabView(uv0.index)
					end
				end
			end
		end)
	end

	if slot0.tips_btn then
		slot0.tips_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				MainuiController:getInstance():openCommonExplainView(true, Config.MarketGoldData.data_explain, TI18N("市场规则"))
			end
		end)
	end

	if slot0.refresh_btn then
		slot0.refresh_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.rest_time <= 0 then
					uv1:sender23509(1)
				else
					uv1:sender23509(2)
				end
			end
		end)
	end

	if slot0.grounding_btn then
		slot0.grounding_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:sender23514(1)
			end
		end)
	end

	if slot0.get_btn then
		slot0.get_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:sender23514(2)
			end
		end)
	end

	if slot0.update_gold_market == nil then
		slot0.update_gold_market = GlobalEvent:getInstance():Bind(MarketEvent.Update_Gold_Category, function (slot0)
			if uv0.cur_index == MarketTabConst.gold_market and uv0.cur_son_index == slot0.catalg then
				slot1 = uv1:getShowGoldShowList(slot0.catalg)

				uv0.title_con:setVisible(true)
				uv0.item_scrollview:resetSize(cc.size(uv0.scroll_con:getContentSize().width, 590))
				uv0.item_scrollview:setData(slot1, function ()
				end, uv0.setting1)
				uv0:showEmpty(#slot1 == 0)

				uv0.show_list[slot0.catalg] = slot1
			end
		end)
	end

	if slot0.sliver_buy_event == nil then
		slot0.sliver_buy_event = GlobalEvent:getInstance():Bind(MarketEvent.Sliver_Market_Buy_Success, function (slot0)
			if uv0.sliver_item == nil or uv0.sliver_item.data == nil then
				return
			end

			if uv0.sliver_item.data.id ~= slot0.id or uv0.sliver_item.data.type ~= slot0.type then
				return
			end

			uv0.sliver_item:updateSelfInfo(slot0.num, slot0.status)

			slot2 = uv0.item_scrollview:getItemList()

			if uv0.sliver_item.data.item_base_id and slot2 and next(slot2) then
				for slot6, slot7 in pairs(slot2) do
					if slot7 and slot7.data and slot7.data.item_base_id == slot1 and slot7.checkNeedStatus then
						slot7:checkNeedStatus()
					end
				end
			end

			uv0.sliver_item = nil
		end)
	end

	if slot0.update_sliver_market == nil then
		slot0.update_sliver_market = GlobalEvent:getInstance():Bind(MarketEvent.Update_Sliver_Market, function (slot0)
			if slot0 == nil or slot0.data == nil then
				return
			end

			if uv0.cur_index == MarketTabConst.sliver_market then
				uv0.refresh_btn:setRichText(string.format(TI18N("<img src=%s scale=0.4 visible=true /><div outline=2,#c45a14>%s刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.silver_coin).icon), Config.MarketSilverData.data_market_sliver_cost.silvermarket_cost.val), 24, 1)
				uv0:setLessTime(slot0.refresh_time - GameNet:getInstance():getTime())
				uv0.title_con:setVisible(false)

				if #Config.MarketSilverData.data_market_sliver_cost.silvermarket_type.val <= 1 then
					uv0.tab_container:setVisible(false)
					uv0.scroll_con:setContentSize(cc.size(uv0.item_scrollview:getContentSize().width, 690))
					uv0.scroll_con:setPositionY(790)
					uv0.item_scrollview:resetSize(cc.size(uv0.item_scrollview:getContentSize().width, 690))
				else
					uv0.tab_container:setVisible(true)
					uv0.scroll_con:setContentSize(cc.size(uv0.item_scrollview:getContentSize().width, 634))
					uv0.scroll_con:setPositionY(739)
					uv0.item_scrollview:resetSize(cc.size(uv0.scroll_con:getContentSize().width, 630))
				end

				if slot0.data[1] and slot2.goods then
					slot3 = {}

					for slot7, slot8 in ipairs(slot2.goods) do
						slot8.type = slot2.type

						table.insert(slot3, slot8)
					end

					uv0.item_scrollview:setData(slot3, function (slot0)
						uv0:clickSliverItem(slot0)
					end, uv0.setting2)
					uv0:showEmpty(#slot3 == 0)
				end
			end
		end)
	end

	if slot0.update_gold_sell_price == nil then
		slot0.update_gold_sell_price = GlobalEvent:getInstance():Bind(MarketEvent.Gold_Sell_Price, function ()
			if uv0.cur_son_index == nil then
				return
			end

			slot0 = uv1:getCanSellListII(uv0.cur_son_index - 1)

			uv0.item_scrollview:setData(slot0, function (slot0)
				uv0:openBuyOrSellWindow(true, 3, slot0:getData())
			end, uv0.setting2)
			uv0:showEmpty(#slot0 == 0)
		end)
	end

	if slot0.update_gold_sell_num == nil then
		slot0.update_gold_sell_num = GlobalEvent:getInstance():Bind(MarketEvent.Gold_Sell_Success, function ()
			if uv0.cur_son_index == nil then
				return
			end

			slot0 = uv1:getCanSellList(uv0.cur_son_index - 1)

			uv0.item_scrollview:setData(uv1:getCanSellListII(uv0.cur_son_index - 1), function (slot0)
				uv0:openBuyOrSellWindow(true, 3, slot0:getData())
			end, uv0.setting2)
		end)
	end

	if slot0.update_sliver_shop == nil then
		slot0.update_sliver_shop = GlobalEvent:getInstance():Bind(MarketEvent.Sliver_Shop_Data, function ()
			uv1.item_scrollview:setData(uv0:getSliverShop(), function (slot0)
				if slot0:getData().is_lock then
					CommonAlert.show(string.format(TI18N("确定花费<img src=%s scale=0.3 visible=true />%s解锁新的摊位？"), PathTool.getItemRes(Config.ItemData.data_get_data(Config.MarketSilverData.data_shop_open[slot1.cell_id].loss[1][1]).icon), Config.MarketSilverData.data_shop_open[slot1.cell_id].loss[1][2]), TI18N("确定"), function ()
						uv0:sender23512()
					end, TI18N("取消"), nil, CommonAlert.type.rich)
				elseif slot1.is_free == 0 then
					uv0:openSliverGroundingWindow(true, uv1:getSliverGroundingItems(), slot1.cell_id)
				elseif slot1.is_free == 1 then
					if slot1.status == 1 then
						uv0:sender23506(slot1.cell_id)
					elseif slot1.status == 5 then
						uv0:sender23511(slot1.cell_id)
					else
						uv0:openSliveSellWindow(true, slot1)
					end
				end
			end, uv1.setting3)
		end)
	end
end

function MarketMainWindow.clickSliverItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.sliver_item = slot1

	if slot1:getData().status ~= 2 and slot2.num ~= 0 then
		if math.floor(uv0.silver_coin / (slot2.price or 0)) < 1 then
			if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.silver_coin) then
				BackpackController:getInstance():openTipsSource(true, slot6)
			end
		else
			uv1:openBuyOrSellWindow(true, 2, slot1:getData())
		end
	elseif slot2.status == 2 or slot2.num == 0 then
		message(TI18N("此物品已经卖完啦"))
	end
end

function MarketMainWindow.showEmpty(slot0, slot1)
	if slot0.no_image == nil then
		slot0.no_image = createImage(slot0.scroll_con, PathTool.getEmptyMark(), slot0.scroll_con:getContentSize().width / 2, slot0.scroll_con:getContentSize().height / 2, cc.p(0.5, 0.5), false)
		slot0.no_label = createLabel(22, 58, nil, slot0.no_image:getContentSize().width / 2, -10, TI18N("空空如也"), slot0.no_image, 0, cc.p(0.5, 0.5))
	end

	slot0.no_image:setVisible(slot1)

	if slot0.cur_index == MarketTabConst.sliver_market and slot1 then
		if slot0.go_to_btn == nil then
			slot0.go_to_btn = createButton(slot0.scroll_con, TI18N("我要摆摊"), slot0.scroll_con:getContentSize().width / 2, 190, cc.size(158, 64), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])
		end

		slot0.go_to_btn:setVisible(slot1)
		slot0.go_to_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:setSelecteTab(4)
			end
		end)
	elseif slot0.go_to_btn then
		slot0.go_to_btn:setVisible(false)
	end
end

function MarketMainWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.show_sub_index = slot2 or 1
	slot0.sub_index = slot2 or 1
	slot0.target_bid = slot3

	slot0:setSelecteTab(slot1 or 1)
end

function MarketMainWindow.selectedTabCallBack(slot0, slot1)
	slot0.cur_index = slot1

	if slot0.cur_son_index then
		slot0.cur_son_index = nil
	end

	if slot1 == MarketTabConst.gold_market then
		slot0.title_con:setVisible(true)
		slot0.scroll_con:setContentSize(cc.size(slot0.item_scrollview:getContentSize().width, 634))
		slot0.scroll_con:setPositionY(739)
		slot0.item_scrollview:resetSize(cc.size(slot0.scroll_con:getContentSize().width, 590))
		slot0.grounding_btn:setVisible(false)
		slot0.get_btn:setVisible(false)
		slot0.refresh_btn:setVisible(false)
		slot0.refresh_time:setVisible(false)
		slot0.sliver_sell_tips:setVisible(false)
	else
		slot0.title_con:setVisible(false)

		slot0.setting2 = {
			start_y = 4,
			item_width = 306,
			start_x = 4,
			space_x = 2,
			row = 0,
			item_height = 143,
			space_y = -2,
			col = 2,
			need_dynamic = false,
			item_class = MarketItem
		}

		slot0.scroll_con:setContentSize(cc.size(slot0.item_scrollview:getContentSize().width, 634))
		slot0.scroll_con:setPositionY(739)
		slot0.item_scrollview:resetSize(cc.size(slot0.scroll_con:getContentSize().width, 630))

		if slot1 == MarketTabConst.sliver_sell then
			slot0.grounding_btn:setVisible(true)
			slot0.get_btn:setVisible(true)
			slot0.sliver_sell_tips:setVisible(true)
			slot0.refresh_btn:setVisible(false)
			slot0.refresh_time:setVisible(false)
		elseif slot1 == MarketTabConst.gold_sell then
			slot0.grounding_btn:setVisible(false)
			slot0.get_btn:setVisible(false)
			slot0.sliver_sell_tips:setVisible(false)
			slot0.refresh_btn:setVisible(false)
			slot0.refresh_time:setVisible(false)
		elseif slot1 == MarketTabConst.sliver_market then
			slot0.grounding_btn:setVisible(false)
			slot0.get_btn:setVisible(false)
			slot0.sliver_sell_tips:setVisible(false)
			slot0.refresh_btn:setVisible(true)
			slot0.refresh_time:setVisible(true)
			slot0.refresh_btn:setRichText(string.format(TI18N("<img src=%s scale=0.4 visible=true /><div outline=2,#c45a14>%s刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(1).icon), Config.MarketSilverData.data_market_sliver_cost.silvermarket_cost.val), 24, 1)
		end
	end

	if slot1 == MarketTabConst.sliver_sell then
		slot0.tab_container:setVisible(false)
		slot0.title_con:setVisible(false)
		slot0:showEmpty(false)

		slot0.setting3 = {
			start_y = 4,
			item_width = 306,
			start_x = 4,
			space_x = 2,
			row = 0,
			item_height = 143,
			space_y = 0,
			col = 2,
			need_dynamic = false,
			item_class = SliverSellItem
		}

		uv0:sender23507()
	else
		if slot1 == MarketTabConst.sliver_market then
			slot3 = {
				[slot7] = slot8
			}

			for slot7, slot8 in pairs(Config.MarketSilverData.data_market_sliver_cost.silvermarket_type.val) do
				-- Nothing
			end

			for slot7, slot8 in pairs(slot0.sub_tab_list) do
				if slot3[slot7] then
					slot8:setVisible(true)
					slot8.label:setString(slot0.sliver_market_list[slot7])

					slot8.index = slot7
				else
					slot8:setVisible(false)
				end
			end

			slot0.tab_bg:setContentSize(cc.size(119 * #slot2, slot0.tab_bg:getContentSize().height))

			if #slot2 <= 1 then
				slot0.tab_container:setVisible(false)
				slot0.item_scrollview:resetSize(cc.size(slot0.item_scrollview:getContentSize().width, 690))
			else
				slot0.tab_container:setVisible(true)
				slot0.item_scrollview:resetSize(cc.size(slot0.scroll_con:getContentSize().width, 630))
			end

			slot0.sub_index = slot0.show_sub_index or 0
		elseif slot1 == MarketTabConst.gold_sell then
			slot3 = {
				[slot7] = slot8
			}

			for slot7, slot8 in pairs(Config.MarketGoldData.data_market_gold_cost.market_type.val) do
				-- Nothing
			end

			for slot8, slot9 in pairs(slot0.sub_tab_list) do
				if slot3[slot8] >= 0 then
					slot9:setVisible(true)
					slot9.label:setString(slot0.gold_market_list[slot3[slot8]])

					slot9.index = slot8
					slot4 = 0 + 1
				else
					slot9:setVisible(false)
				end
			end

			slot0.tab_container:setVisible(true)
			slot0.tab_bg:setContentSize(cc.size(119 * slot4, slot0.tab_bg:getContentSize().height))

			slot0.sub_index = slot0.show_sub_index or 0
		elseif slot1 == MarketTabConst.gold_market then
			slot2 = {
				1,
				2,
				3,
				4
			}

			for slot7, slot8 in pairs(slot0.sub_tab_list) do
				if slot2[slot7] >= 0 then
					slot8:setVisible(true)
					slot8.label:setString(slot0.gold_market_list[slot2[slot7]])

					slot8.index = slot7
					slot3 = 0 + 1
				else
					slot8:setVisible(false)
				end
			end

			slot0.tab_container:setVisible(true)
			slot0.tab_bg:setContentSize(cc.size(119 * slot3, slot0.tab_bg:getContentSize().height))

			slot0.sub_index = slot0.show_sub_index or 1
		end

		slot0:refreshSonTabPos()
		slot0:changeSonTabView(slot0.sub_index)
	end
end

function MarketMainWindow.refreshSonTabPos(slot0)
	slot1 = 5
	slot2 = 69
	slot3 = 117
	slot4 = {}

	for slot9, slot10 in ipairs(slot0.sub_tab_list) do
		if slot10:isVisible() then
			slot5 = 0 + 1

			table.insert(slot4, slot10)
		end
	end

	slot1 = slot1 + (4 - slot5) * slot3 / 2

	for slot9, slot10 in ipairs(slot4) do
		slot10:setPositionX(slot2 + (4 - slot5) * slot3 / 2 + (slot9 - 1) * slot3)
	end

	slot0.tab_bg:setPositionX(slot1)
end

function MarketMainWindow.changeSonTabView(slot0, slot1)
	if slot0.cur_son_index == slot1 then
		return
	end

	if slot0.cur_son_tab ~= nil then
		slot0.cur_son_tab.label:setTextColor(cc.c4b(207, 181, 147, 255))
		slot0.cur_son_tab:setBright(false)
	end

	slot0.cur_son_index = slot1

	if slot0.cur_index == MarketTabConst.gold_market then
		slot0.cur_son_tab = slot0.sub_tab_list[slot0.cur_son_index]
	else
		slot0.cur_son_tab = slot0.sub_tab_list[slot0.cur_son_index]
	end

	if slot0.cur_son_tab ~= nil then
		slot0.cur_son_tab.label:setTextColor(cc.c4b(255, 237, 214, 255))
		slot0.cur_son_tab:setBright(true)
	end

	if slot0.cur_index == MarketTabConst.gold_market then
		uv0:sender23520()
		uv0:sender23500(slot0.cur_son_index)
	elseif slot0.cur_index == MarketTabConst.sliver_market then
		uv0:sender23509(3)
	elseif slot0.cur_index == MarketTabConst.gold_sell then
		slot3 = {}

		for slot7, slot8 in pairs(uv1:getCanSellList(slot0.cur_son_index - 1)) do
			table.insert(slot3, {
				base_id = slot8.base_id
			})
		end

		uv0:sender23516(slot3)
	end
end

function MarketMainWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.refresh_time) then
		return
	end

	slot0.refresh_time:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.refresh_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.refresh_time:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function MarketMainWindow.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.refresh_time:setString(string.format(TI18N("下次刷新：%s"), TimeTool.GetTimeFormat(slot1)))
	else
		slot0.refresh_btn:setRichText(string.format(TI18N("<div outline=2,#c45a14>免费刷新</div>")), 24, 1)
		slot0.refresh_time:setString("")
	end
end

function MarketMainWindow.getCurIndex(slot0)
	return slot0.cur_index or 1
end

function MarketMainWindow.getCurSonIndex(slot0)
	return slot0.cur_son_index or 1
end

function MarketMainWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.sliver_buy_event then
		GlobalEvent:getInstance():UnBind(slot0.sliver_buy_event)

		slot0.sliver_buy_event = nil
	end

	if slot0.update_gold_market then
		GlobalEvent:getInstance():UnBind(slot0.update_gold_market)

		slot0.update_gold_market = nil
	end

	if slot0.update_sliver_market then
		GlobalEvent:getInstance():UnBind(slot0.update_sliver_market)

		slot0.update_sliver_market = nil
	end

	if slot0.update_gold_sell_price then
		GlobalEvent:getInstance():UnBind(slot0.update_gold_sell_price)

		slot0.update_gold_sell_price = nil
	end

	if slot0.update_gold_sell_num then
		GlobalEvent:getInstance():UnBind(slot0.update_gold_sell_num)

		slot0.update_gold_sell_num = nil
	end

	if slot0.update_sliver_shop then
		GlobalEvent:getInstance():UnBind(slot0.update_sliver_shop)

		slot0.update_sliver_shop = nil
	end

	uv0:openMainWindow(false)
end
