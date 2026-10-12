MarketController = MarketController or BaseClass(BaseController)
MarketTabConst = {
	gold_sell = 3,
	sliver_sell = 4,
	gold_market = 1,
	sliver_market = 2
}
MaketSubTabConst = {
	All = 0,
	Skill = 1,
	Other = 4,
	Form = 2,
	Break = 3
}

function MarketController.config(slot0)
	slot0.model = MarketModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.price_list = {}
end

function MarketController.getModel(slot0)
	return slot0.model
end

function MarketController.registerEvents(slot0)
end

function MarketController.registerProtocals(slot0)
	slot0:RegisterProtocal(23500, "handle23500")
	slot0:RegisterProtocal(23501, "handle23501")
	slot0:RegisterProtocal(23502, "handle23502")
	slot0:RegisterProtocal(23518, "handle23518")
	slot0:RegisterProtocal(23520, "handle23520")
	slot0:RegisterProtocal(23504, "handle23504")
	slot0:RegisterProtocal(23505, "handle23505")
	slot0:RegisterProtocal(23506, "handle23506")
	slot0:RegisterProtocal(23507, "handle23507")
	slot0:RegisterProtocal(23508, "handle23508")
	slot0:RegisterProtocal(23509, "handle23509")
	slot0:RegisterProtocal(23511, "handle23511")
	slot0:RegisterProtocal(23512, "handle23512")
	slot0:RegisterProtocal(23513, "handle23513")
	slot0:RegisterProtocal(23514, "handle23514")
	slot0:RegisterProtocal(23516, "handle23516")
end

function MarketController.sender23500(slot0, slot1)
	slot0:SendProtocal(23500, {
		catalg = slot1
	})
end

function MarketController.handle23500(slot0, slot1)
	slot0.model:setGoldShopList(slot1)
	slot0.dispather:Fire(MarketEvent.Update_Gold_Category, slot1)
end

function MarketController.sender23501(slot0, slot1, slot2)
	slot0:SendProtocal(23501, {
		base_id = slot1,
		num = slot2
	})
end

function MarketController.handle23501(slot0, slot1)
	if slot1.flag == 1 and slot0.market_win and slot0.market_win:getCurIndex() == MarketTabConst.gold_market then
		slot0:sender23500(slot0.market_win:getCurSonIndex())
		slot0:sender23520()
	end
end

function MarketController.sender23502(slot0, slot1, slot2)
	slot0:SendProtocal(23502, {
		id = slot1,
		num = slot2
	})
end

function MarketController.handle23502(slot0, slot1)
	if slot1.flag == 1 then
		slot0.dispather:Fire(MarketEvent.Gold_Sell_Success)
	end
end

function MarketController.sender23518(slot0, slot1)
	slot0:SendProtocal(23518, {
		catalg = slot1
	})
end

function MarketController.handle23518(slot0, slot1)
end

function MarketController.sender23520(slot0)
	slot0:SendProtocal(23520, {})
end

function MarketController.handle23520(slot0, slot1)
	slot0.model:setLimitList(slot1.limit_data)
end

function MarketController.sender23504(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(23504, {
		package_type = slot1,
		item_id = slot2,
		num = slot3,
		percent = slot4,
		cell_id = slot5
	})
end

function MarketController.handle23504(slot0, slot1)
end

function MarketController.sender23505(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23505, {
		type = slot1,
		id = slot2,
		num = slot3
	})
end

function MarketController.handle23505(slot0, slot1)
	slot0.dispather:Fire(MarketEvent.Sliver_Market_Buy_Success, slot1)
end

function MarketController.sender23506(slot0, slot1)
	slot0:SendProtocal(23506, {
		cell_id = slot1
	})
end

function MarketController.handle23506(slot0, slot1)
end

function MarketController.sender23507(slot0)
	slot0:SendProtocal(23507, {})
end

function MarketController.handle23507(slot0, slot1)
	slot0.model:setSliverShop(slot1)
	slot0.dispather:Fire(MarketEvent.Sliver_Shop_Data)
end

function MarketController.sender23508(slot0, slot1)
	slot0:SendProtocal(23508, {
		item_base_id = slot1
	})
end

function MarketController.handle23508(slot0, slot1)
	slot0.dispather:Fire(MarketEvent.Sliver_Price, slot1)
end

function MarketController.sender23509(slot0, slot1)
	slot0:SendProtocal(23509, {
		refresh_type = slot1
	})
end

function MarketController.handle23509(slot0, slot1)
	slot0.dispather:Fire(MarketEvent.Update_Sliver_Market, slot1)
end

function MarketController.sender23511(slot0, slot1)
	slot0:SendProtocal(23511, {
		cell_id = slot1
	})
	print("=====23511====", slot1)
end

function MarketController.handle23511(slot0, slot1)
	Debug.info(slot1)
end

function MarketController.sender23512(slot0)
	slot0:SendProtocal(23512, {})
end

function MarketController.handle23512(slot0, slot1)
end

function MarketController.sender23513(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23513, {
		cell_id = slot1,
		percent = slot2,
		num = slot3
	})
end

function MarketController.handle23513(slot0, slot1)
end

function MarketController.sender23514(slot0, slot1)
	slot0:SendProtocal(23514, {
		type = slot1
	})
end

function MarketController.handle23514(slot0, slot1)
end

function MarketController.sender23516(slot0, slot1)
	slot0:SendProtocal(23516, {
		base_ids = slot1
	})
end

function MarketController.handle23516(slot0, slot1)
	for slot5, slot6 in pairs(slot1.market_price) do
		slot0.price_list[slot6.base_id] = slot6
	end

	slot0.dispather:Fire(MarketEvent.Gold_Sell_Price)
end

function MarketController.getPriceList(slot0)
	return slot0.price_list or {}
end

function MarketController.getPriceItemByBid(slot0, slot1)
	return slot0.price_list[slot1]
end

function MarketController.openMainWindow(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.mall) and slot6.is_lock then
			message(slot6.desc)

			return
		end

		if not slot0.market_win then
			slot0.market_win = MarketMainWindow.New()
		end

		slot0.need_bid = slot4
		slot0.need_item_list = slot5

		slot0.market_win:open(slot2 or MarketTabConst.gold_market, slot3 or 1, slot4)
	elseif slot0.market_win then
		slot0.market_win:close()

		slot0.market_win = nil
	end
end

function MarketController.getMarketRoot(slot0)
	if slot0.market_win then
		return slot0.market_win.root_wnd
	end
end

function MarketController.getMarketBuyRoot(slot0)
	if slot0.market_buy then
		return slot0.market_buy.root_wnd
	end
end

function MarketController.getMarketMainWin(slot0)
	return slot0.market_win
end

function MarketController.getNeedBid(slot0)
	return slot0.need_bid
end

function MarketController.checkIsNeedItem(slot0, slot1)
	if slot1 == nil then
		return false
	end

	slot2 = BackpackController:getInstance():getModel()

	if slot0.need_item_list then
		for slot6, slot7 in ipairs(slot0.need_item_list) do
			if type(slot7) == "table" then
				if slot7.bid and slot7.bid == slot1 and slot2:getBackPackItemNumByBid(slot1) < (slot7.need_num or 0) then
					return true
				end
			elseif slot7 == slot1 then
				return true
			end
		end
	elseif slot0.need_bid ~= nil and slot0.need_bid == slot1 then
		return true
	end

	return false
end

function MarketController.openBuyOrSellWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.market_buy then
			slot0.market_buy = MarketBuyWindow.New()
		end

		slot0.market_buy:open(slot2, slot3)
	elseif slot0.market_buy then
		slot0.market_buy:close()

		slot0.market_buy = nil
	end
end

function MarketController.openSliverGroundingWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.sliver_grounding then
			slot0.sliver_grounding = SliverGroundingWindow.New()
		end

		slot0.sliver_grounding:open(slot2, slot3)
	elseif slot0.sliver_grounding then
		slot0.sliver_grounding:close()

		slot0.sliver_grounding = nil
	end
end

function MarketController.openSliveSellWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.sliver_sell then
			slot0.sliver_sell = SliverSellWindow.New()
		end

		slot0.sliver_sell:open(slot2)
	elseif slot0.sliver_sell then
		slot0.sliver_sell:close()

		slot0.sliver_sell = nil
	end
end

function MarketController.openSliverOneUpWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.sliver_oneup then
			slot0.sliver_oneup = SliverOneUpWindow.New()
		end

		slot0.sliver_oneup:open(slot2)
	elseif slot0.sliver_oneup then
		slot0.sliver_oneup:close()

		slot0.sliver_oneup = nil
	end
end

function MarketController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
