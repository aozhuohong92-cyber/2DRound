ActDailyLimitGiftView = ActDailyLimitGiftView or BaseClass(BaseView)
slot0 = ActionController:getInstance()
banner_list = {
	[92.0] = "2",
	[93.0] = "3",
	[94.0] = "4",
	[91.0] = "1"
}

function ActDailyLimitGiftView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "action/action_daily_limit_gift_view"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_23", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("exchange/banner", "1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("exchange/banner", "2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("exchange/banner", "3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("exchange/banner", "4"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("exchange", "exchange"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_id_list = {}
	slot0.tab_list = {}
	slot0.cur_index = 1
	slot0.data_list = {}
	slot0.banner_load = {}
	slot0.item_data_list = {}
	slot0.config_list = {}
	slot0.is_upper_limit_list = {}
	slot0.limit_num_list = {}
end

function ActDailyLimitGiftView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		loadSpriteTexture(slot0.background, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_23", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.banner_img = slot0.main_container:getChildByName("banner_img")
	slot1 = slot0.main_container:getChildByName("bottom_layout")
	slot0.buy_btn = slot1:getChildByName("buy_btn")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.old_price = createRichLabel(22, cc.c4b(236, 212, 173, 255), cc.p(0.5, 0.5), cc.p(slot0.buy_btn:getPositionX(), slot0.buy_btn:getPositionY() + 80))

	slot1:addChild(slot0.old_price)

	slot0.buy_price = createRichLabel(30, cc.c4b(236, 212, 173, 255), cc.p(0.5, 0.5), cc.p(slot0.buy_btn:getContentSize().width / 2, slot0.buy_btn:getContentSize().height / 2))

	slot0.buy_btn:addChild(slot0.buy_price)

	slot0.limit_count = createRichLabel(20, cc.c4b(236, 212, 173, 255), cc.p(0.5, 0.5), cc.p(slot0.buy_btn:getPositionX(), slot0.buy_btn:getPositionY() - 65))

	slot1:addChild(slot0.limit_count)

	slot0.red_line = createSprite(PathTool.getResFrame("exchange", "exchage_4"), 50, 15, slot0.old_price, cc.p(0.5, 0.5))
	slot2 = slot0.main_container:getChildByName("top_scroll")
	slot3 = slot2:getContentSize()
	slot0.tab_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot3.width, slot3.height), {
		start_y = 0,
		item_height = 196,
		start_x = 20,
		space_y = 0,
		item_width = 164,
		space_x = 10,
		need_dynamic = true,
		row = 1
	})

	slot0.tab_scrollview:setSwallowTouches(false)
	slot0.tab_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.tab_createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.tab_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.tab_numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.tab_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.tab_updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot6 = slot0.main_container:getChildByName("item_scroll")
	slot7 = slot6:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot6, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot7.width, slot7.height), {
		start_y = 0,
		row = 0,
		start_x = 10,
		space_x = 0,
		item_width = 640,
		item_height = 135,
		space_y = 5,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.item_createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.item_numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.item_updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function ActDailyLimitGiftView.openRootWnd(slot0)
	if Config.ExchangeData.data_shop_list[MallConst.MallType.DailyLimitGiftMainShop].subtype or next(slot2) then
		slot0.tab_id_list = slot1.subtype

		slot0.tab_scrollview:reloadData()
		slot0:updateBannerRes()
		slot0:updateItems()
	end
end

function ActDailyLimitGiftView.tab_createNewCell(slot0)
	slot1 = ActDailyLimitGiftTab.new()

	slot1:addCallBack(handler(slot0, slot0.tab_onClick))
	table.insert(slot0.tab_list, slot1)

	return slot1
end

function ActDailyLimitGiftView.tab_numberOfCells(slot0)
	return #slot0.tab_id_list
end

function ActDailyLimitGiftView.tab_updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.tab_id_list[slot2])
	slot1:setSelecte(slot2 == slot0.cur_index)

	if Config.ExchangeData.data_shop_list[slot0.tab_id_list[slot2]] then
		slot1:setTitle(slot3.name)
	end
end

function ActDailyLimitGiftView.tab_onClick(slot0, slot1)
	if slot1.index ~= slot0.cur_index then
		slot1:setSelecte(true)
		slot0.tab_list[slot0.cur_index]:setSelecte(false)

		slot0.cur_index = slot2

		slot0:updateBannerRes()
		slot0:updateItems()
	end
end

function ActDailyLimitGiftView.item_createNewCell(slot0)
	return ActDailyLimitGiftItem.new()
end

function ActDailyLimitGiftView.item_numberOfCells(slot0)
	return #slot0.item_data_list
end

function ActDailyLimitGiftView.item_updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.item_data_list[slot2])
end

function ActDailyLimitGiftView.updateBannerRes(slot0)
	slot1 = slot0.tab_id_list[slot0.cur_index]

	if not slot0.banner_load[slot1] then
		slot0.banner_load[slot1] = loadSpriteTextureFromCDN(slot0.banner_img, PathTool.checkRes(string.format("resource/exchange/banner/%s.png", banner_list[slot1])), ResourcesType.single, slot0.banner_load[id])
	else
		loadSpriteTexture(slot0.banner_img, slot2, LOADTEXT_TYPE)
	end
end

function ActDailyLimitGiftView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openDailyLimitGiftView(false)
	end, true, 2)
	registerButtonEventListener(slot0.buy_btn, function ()
		uv0:_onClickBuyBtn()
	end, true)

	if not slot0.update_have_count then
		slot0.update_have_count = GlobalEvent:getInstance():Bind(MallEvent.Open_View_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0:initShopData(slot0) ~= nil then
				uv0.data_list[slot0.type] = slot1
				uv0.item_data_list = slot1.items

				if uv0.item_scrollview then
					uv0.item_scrollview:reloadData()
				end

				uv0:updateCoin(slot0.type)
			end
		end)
	end

	if not slot0.buy_success_event then
		slot0.buy_success_event = GlobalEvent:getInstance():Bind(MallEvent.Buy_Success_Event, function (slot0)
			if not slot0 then
				return
			end

			MallController:getInstance():sender13401(slot0.type)
		end)
	end
end

function ActDailyLimitGiftView._onClickBuyBtn(slot0)
	slot1 = slot0.tab_id_list[slot0.cur_index]
	slot2 = slot0.config_list[slot1]

	if slot0.is_upper_limit_list[slot1] then
		message(TI18N("该商品今日购买已上限。"))
	else
		uv0:openDailyLimitGiftTips(true, slot2)
	end
end

function ActDailyLimitGiftView.updateItems(slot0)
	slot1 = slot0.tab_id_list[slot0.cur_index]
	slot2 = Config.ExchangeData.data_shop_list[slot1]

	if not slot0.data_list[slot1] then
		MallController:getInstance():sender13401(slot1)
	else
		slot0.item_data_list = slot0.data_list[slot1].items

		slot0.item_scrollview:reloadData()
		slot0:updateCoin(slot1)
	end
end

function ActDailyLimitGiftView.initShopData(slot0, slot1)
	slot2 = nil

	if slot1.type == MallConst.MallType.DailyLimitGiftCoin then
		slot2 = Config.ExchangeData.data_shop_large_amount_copper
	elseif slot3 == MallConst.MallType.DailyLimitGiftHero then
		slot2 = Config.ExchangeData.data_shop_partner_growup
	elseif slot3 == MallConst.MallType.DailyLimitGiftMagicWeapon then
		slot2 = Config.ExchangeData.data_shop_magic_growup
	elseif slot3 == MallConst.MallType.DailyLimitGiftWorldSoul then
		slot2 = Config.ExchangeData.data_shop_soul_growup
	else
		return nil
	end

	slot0.limit_num_list[slot1.type] = #slot2
	slot0.is_upper_limit_list[slot1.type] = #slot1.item_list == #slot2

	if slot2[slot4 + 1] == nil then
		slot5 = slot2[slot4]
	end

	slot0.config_list[slot1.type] = slot5

	return Config.GiftData.data_gift_data[slot5.item_bid]
end

function ActDailyLimitGiftView.updateCoin(slot0, slot1)
	slot2 = slot0.config_list[slot1]

	slot0.old_price:setString(string.format(TI18N("原价<img src=%s scale=0.3 visible=true />%s"), PathTool.getItemRes(3), slot2.price))
	slot0.buy_price:setString(string.format(TI18N("<img src=%s scale=0.4 visible=true /> <div outline=2,#442012>%s</div>"), PathTool.getItemRes(3), slot2.discount))
	slot0.limit_count:setString(string.format(TI18N("每日限购：<div fontColor=#23f333>%s/%s</div>"), slot0.is_upper_limit_list[slot1] and 0 or slot0.limit_num_list[slot1] - slot2.order + 1, slot0.limit_num_list[slot1]))
end

function ActDailyLimitGiftView.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.banner_load) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	slot0.banner_load = {}

	if slot0.tab_scrollview then
		slot0.tab_scrollview:DeleteMe()

		slot0.tab_scrollview = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.tab_list = nil

	if slot0.update_have_count then
		GlobalEvent:getInstance():UnBind(slot0.update_have_count)

		slot0.update_have_count = nil
	end

	if slot0.buy_success_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_event)

		slot0.buy_success_event = nil
	end

	uv0:openDailyLimitGiftView(false)
end
