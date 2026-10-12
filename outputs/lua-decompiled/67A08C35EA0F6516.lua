MallModel = MallModel or BaseClass()

function MallModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function MallModel.config(slot0)
	slot0.buy_list = {}
	slot0.shop_list = {}
	slot0.mall_red_list = {}
end

function MallModel.setBuyList(slot0, slot1)
	slot0.buy_list = slot1
end

function MallModel.getBuyList(slot0)
	return slot0.buy_list
end

function MallModel.getScoreBuyList(slot0, slot1)
	if slot0.shop_list[slot1] and next(slot0.shop_list[slot1]) ~= nil then
		return slot0.shop_list[slot1]
	end

	return nil
end

function MallModel.checkHeroChips(slot0, slot1)
	slot2 = false

	if HeroController:getInstance():getModel():getMyPosList() and next(slot3 or {}) ~= nil then
		for slot7, slot8 in pairs(slot3) do
			if HeroController:getInstance():getModel():getHeroById(slot8.id) and slot9.chips_id == slot1 then
				slot2 = true
			end
		end

		return slot2
	end
end

function MallModel.checkMoenyByType(slot0, slot1, slot2)
	slot4 = 0
	slot5 = 0

	if RoleController:getInstance():getRoleVo() then
		if type(slot1) == "number" then
			if slot1 == Config.ItemData.data_assets_label2id.hero_soul then
				slot4 = math.floor(slot3.hero_soul / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.silver_coin then
				slot4 = math.floor(slot3.silver_coin / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.coin then
				slot4 = math.floor(slot3.coin / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.gold then
				slot4 = math.floor((slot3.red_gold + slot3.gold) / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.star_point then
				slot4 = math.floor(slot3.star_point / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.arena_guesscent then
				slot4 = math.floor(slot3.arena_guesscent / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.gold then
				slot4 = math.floor(slot3.gold / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.skin_debris then
				slot4 = math.floor(slot3.skin_debris / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.home_coin then
				slot4 = math.floor(slot3.home_coin / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.cluster_guess_cent then
				slot4 = math.floor(slot3.cluster_guess_cent / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.emzz then
				slot4 = math.floor(slot3.emzz / slot2)
			elseif slot1 == Config.ItemData.data_assets_label2id.charge_bi then
				slot4 = math.floor(slot3.charge_bi / slot2)
			else
				slot4 = math.floor(BackpackController:getInstance():getModel():getItemNumByBid(slot1) / slot2)
			end
		elseif slot1 == "gold" then
			slot4 = math.floor(slot3.gold / slot2)
		elseif slot1 == "silver_coin" then
			slot4 = math.floor(slot3.silver_coin / slot2)
		elseif slot1 == "coin" then
			slot4 = math.floor(slot3.coin / slot2)
		elseif slot1 == "red_gold_or_gold" then
			slot4 = math.floor((slot3.red_gold + slot3.gold) / slot2)
		elseif slot1 == "arena_cent" then
			slot4 = math.floor(slot3.arena_cent / slot2)
		elseif slot1 == "friend_point" then
			slot4 = math.floor(slot3.friend_point / slot2)
		elseif slot1 == "guild" then
			slot4 = math.floor(slot3.guild / slot2)
		elseif slot1 == "boss_point" then
			slot4 = math.floor(slot3.boss_point / slot2)
		elseif slot1 == "arena_guesscent" then
			slot4 = math.floor(slot3.arena_guesscent / slot2)
		elseif slot1 == "star_point" then
			slot4 = math.floor(slot3.star_point / slot2)
		elseif slot1 == "sky_coin" then
			slot4 = math.floor(slot3.sky_coin / slot2)
		elseif slot1 == "recruithigh_hero" then
			slot4 = math.floor(slot3.recruithigh_hero / slot2)
		elseif slot1 == "expedition_medal" then
			slot4 = math.floor(slot3.expedition_medal / slot2)
		elseif slot1 == "elite_coin" then
			slot4 = math.floor(slot3.elite_coin / slot2)
		elseif slot1 == "skin_debris" then
			slot4 = math.floor(slot3.skin_debris / slot2)
		elseif slot1 == "home_coin" then
			slot4 = math.floor(slot3.home_coin / slot2)
		elseif slot1 == "cluster_guess_cent" then
			slot4 = math.floor(slot3.cluster_guess_cent / slot2)
		elseif slot1 == "peak_guess_cent" then
			slot4 = math.floor(slot3.peak_guess_cent / slot2)
		elseif slot1 == "charge_bi" then
			slot4 = math.floor(slot3.charge_bi / slot2)
		end
	end

	return slot4
end

function MallModel.checkActionMoenyByType(slot0, slot1, slot2)
	if Config.ItemData.data_assets_id2label and slot3[slot1] then
		slot4 = slot0:checkMoenyByType(slot1, slot2)

		return slot0:checkMoenyByType(slot1, slot2)
	end

	slot5 = 0

	if RoleController:getInstance():getRoleVo() then
		slot5 = math.floor(slot4:getActionAssetsNumByBid(slot1) / slot2)
	end

	return slot5
end

function MallModel.updateMallRedStatus(slot0, slot1, slot2)
end

function MallModel.getMallRedStateByBid(slot0, slot1)
	return slot0.mall_red_list[slot1]
end

function MallModel.getChargeShopRedData(slot0)
	for slot5, slot6 in pairs(MallConst.Red_Index) do
		if slot5 ~= "Variety" then
			table.insert({}, {
				bid = slot6,
				status = slot0:getMallRedStateByBid(slot6)
			})
		end
	end

	for slot6, slot7 in pairs(VipController:getInstance():getVipRedData()) do
		table.insert(slot1, slot7)
	end

	return slot1
end

function MallModel.__delete(slot0)
end
