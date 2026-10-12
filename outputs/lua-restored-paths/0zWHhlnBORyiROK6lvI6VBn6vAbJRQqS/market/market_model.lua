MarketModel = MarketModel or BaseClass()

function MarketModel.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.gold_list = {}
	slot0.canSellList = {}

	slot0:config()
end

function MarketModel.setGoldShopList(slot0, slot1)
	slot0.gold_list[slot1.catalg] = slot1.goods
end

function MarketModel.getGoldShopList(slot0, slot1)
end

function MarketModel.setLimitList(slot0, slot1)
	slot0.limit_list = slot1
end

function MarketModel.getShowGoldShowList(slot0, slot1)
	slot2 = {}

	if slot1 == 1 then
		slot2 = Config.MarketGoldData.data_skill_shop_list
	elseif slot1 == 2 then
		slot2 = Config.MarketGoldData.data_form_shop_list
	elseif slot1 == 3 then
		slot2 = Config.MarketGoldData.data_break_shop_list
	elseif slot1 == 4 then
		slot2 = Config.MarketGoldData.data_other_shop_list
	elseif slot1 == 0 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_other_shop_list) do
			table.insert(slot2, slot7)
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_break_shop_list) do
			table.insert(slot2, slot7)
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_form_shop_list) do
			table.insert(slot2, slot7)
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_skill_shop_list) do
			table.insert(slot2, slot7)
		end
	end

	for slot6, slot7 in pairs(slot0.gold_list[slot1]) do
		slot7.has_buy = 0

		if slot0.limit_list and next(slot0.limit_list) ~= nil then
			for slot11, slot12 in pairs(slot0.limit_list) do
				if slot12.item_id == slot7.base_id then
					slot7.has_buy = slot12.count
				end
			end
		end

		for slot11, slot12 in pairs(slot2) do
			if slot12.base_id == slot7.base_id then
				slot7.limit_num = slot12.limit_num
				slot7.limit_type = slot12.limit_type
				slot7.sort = slot12.sort
			end
		end
	end

	table.sort(slot0.gold_list[slot1], SortTools.KeyLowerSorter("sort"))

	return slot0.gold_list[slot1]
end

function MarketModel.getCanSellList(slot0, slot1)
	slot2 = {}
	slot0.canSellList[slot1] = {}

	if slot1 == 1 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_skill_shop_list) do
			slot2[slot7.base_id] = slot7
		end
	elseif slot1 == 2 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_form_shop_list) do
			slot2[slot7.base_id] = slot7
		end
	elseif slot1 == 3 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_break_shop_list) do
			slot2[slot7.base_id] = slot7
		end
	elseif slot1 == 4 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_other_shop_list) do
			slot2[slot7.base_id] = slot7
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_hide_sell_list) do
			slot2[slot6] = slot7
			slot2[slot6].base_id = slot6
			slot2[slot6].catalg = 4
		end
	elseif slot1 == 0 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_skill_shop_list) do
			slot2[slot7.base_id] = slot7
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_form_shop_list) do
			slot2[slot7.base_id] = slot7
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_break_shop_list) do
			slot2[slot7.base_id] = slot7
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_other_shop_list) do
			slot2[slot7.base_id] = slot7
		end

		for slot6, slot7 in pairs(Config.MarketGoldData.data_hide_sell_list) do
			slot2[slot6] = slot7
			slot2[slot6].base_id = slot6
			slot2[slot6].catalg = 4
		end
	end

	for slot6, slot7 in pairs(slot2) do
		slot8 = BackpackController:getInstance():getModel()
		slot9 = slot8:getBackPackItemNumByBid(slot7.base_id)
		slot7.num = slot9
		slot7.id = slot8:getBackPackItemIDByBid(slot7.base_id)

		if slot9 > 0 then
			table.insert(slot0.canSellList[slot1], slot7)
		end
	end

	return slot0.canSellList[slot1] or {}
end

function MarketModel.getCanSellListII(slot0, slot1)
	if slot0.canSellList[slot1] and next(slot0.canSellList[slot1]) ~= nil then
		for slot5, slot6 in pairs(slot0.canSellList[slot1]) do
			slot6.price = math.floor(slot0:getPrice(slot6.base_id))
		end
	end

	return slot0.canSellList[slot1] or {}
end

function MarketModel.getPrice(slot0, slot1)
	if Config.MarketGoldData.data_hide_sell_list[slot1] then
		return Config.MarketGoldData.data_hide_sell_list[slot1].price
	elseif Config.MarketGoldData.data_change_sell_list[slot1] then
		slot2 = Config.MarketGoldData.data_change_sell_list[slot1].exchange_id

		if Config.MarketGoldData.data_stable_sell_list[slot2] then
			return math.floor(slot0:getGoldMarketPrice(slot2) * Config.MarketGoldData.data_stable_sell_list[slot2].discount / 1000)
		else
			return math.floor(slot3 * Config.MarketGoldData.data_market_gold_cost.item_sale.val)
		end
	elseif Config.MarketGoldData.data_stable_sell_list[slot1] then
		return math.floor(slot0:getGoldMarketPrice(slot1) * Config.MarketGoldData.data_stable_sell_list[slot1].discount / 1000)
	else
		return math.floor(slot0:getGoldMarketPrice(slot1) * Config.MarketGoldData.data_market_gold_cost.item_sale.val)
	end
end

function MarketModel.getGoldMarketPrice(slot0, slot1)
	for slot6, slot7 in pairs(slot0.ctrl:getPriceList()) do
		if slot7.base_id == slot1 and slot7.source == 2 then
			return slot7.price
		end
	end
end

function MarketModel.getData(slot0, slot1, slot2)
	if slot2 == 1 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_skill_shop_list) do
			if slot1 == slot7.base_id then
				return slot7
			end
		end
	elseif slot2 == 2 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_form_shop_list) do
			if slot1 == slot7.base_id then
				return slot7
			end
		end
	elseif slot2 == 3 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_break_shop_list) do
			if slot1 == slot7.base_id then
				return slot7
			end
		end
	elseif slot2 == 4 then
		for slot6, slot7 in pairs(Config.MarketGoldData.data_other_shop_list) do
			if slot1 == slot7.base_id then
				return slot7
			end
		end
	end
end

function MarketModel.setSliverShop(slot0, slot1)
	slot0.sliver_shop = {}
	slot2 = {}
	slot0.free_list = {}

	if slot1.free_ids and next(slot1.free_ids) ~= nil then
		for slot6, slot7 in pairs(slot1.free_ids) do
			slot2[slot7.cell_id] = {
				cell_id = slot7.cell_id,
				is_free = 0,
				is_lock = false
			}

			table.insert(slot0.free_list, {
				cell_id = slot7.cell_id
			})
		end
	end

	if slot1.cells and next(slot1.cells) ~= nil then
		for slot6, slot7 in pairs(slot1.cells) do
			slot2[slot7.cell_id] = {
				cell_id = slot7.cell_id,
				is_free = 1,
				is_lock = false,
				item_base_id = slot7.item_base_id,
				num = slot7.num,
				price = slot7.price,
				expiry = slot7.expiry,
				status = slot7.status,
				item_attrs = slot7.item_attrs
			}
		end
	end

	if #slot2 < Config.MarketSilverData.data_market_sliver_cost.silvermarket_boothnum.val then
		slot2[slot3 + 1] = {
			is_lock = true,
			cell_id = slot3 + 1
		}
	end

	slot0.sliver_shop = slot2
end

function MarketModel.getSliverShop(slot0)
	return slot0.sliver_shop or {}
end

function MarketModel.getFreeList(slot0)
	return slot0.free_list or {}
end

function MarketModel.getSliverGroundingItems(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in pairs(deepCopy(Config.MarketSilverData.data_antique_list)) do
		slot8 = BackpackController:getInstance():getModel()
		slot9 = slot8:getBackPackItemNumByBid(slot7.base_id)
		slot7.num = slot9
		slot7.id = slot8:getBackPackItemIDByBid(slot7.base_id)

		if slot9 > 0 then
			table.insert(slot1, slot7)
		end
	end

	table.sort(slot2, SortTools.KeyLowerSorter("base_id"))

	return slot1
end

function MarketModel.config(slot0)
end

function MarketModel.__delete(slot0)
end
