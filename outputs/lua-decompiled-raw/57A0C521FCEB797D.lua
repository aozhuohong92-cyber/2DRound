BackpackModel = BackpackModel or BaseClass()
slot0 = table.insert
slot1 = table.sort
slot2 = Config.PartnerData.data_get_compound_info

function BackpackModel.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.item_list = {}
	slot0.expansion_list = {}
	slot0.is_new_list = {}
	slot0.equip_score_list = {}
	slot0.cur_equip_volume = 0
	slot0.hallows_comp_list = {}
	slot0.hero_hun_list = {}
	slot0.server_time = 0
end

function BackpackModel.setEquipsOutput(slot0, slot1)
	slot0.equip_output = slot1
end

function BackpackModel.getEquipsOutput(slot0)
	return slot0.equip_output
end

function BackpackModel.setExpOutput(slot0, slot1)
	slot0.exp_output = slot1
end

function BackpackModel.getExpOutput(slot0)
	return slot0.exp_output
end

function BackpackModel.getExpansionInfo(slot0, slot1)
	return slot0.expansion_list[slot1 or BackPackConst.Bag_Code.EQUIPS]
end

function BackpackModel.getEquipSize(slot0)
	return slot0.expansion_list[BackPackConst.Bag_Code.EQUIPS] and slot1.volume or 0
end

function BackpackModel.updateExpansionInfo(slot0, slot1)
	if slot1 == nil or slot1.type == nil or slot1.volume == nil or slot1.open_times == nil then
		return
	end

	if slot0.expansion_list[slot1.type] == nil then
		slot0.expansion_list[slot1.type] = {}
	end

	slot0.expansion_list[slot1.type].volume = slot1.volume
	slot0.expansion_list[slot1.type].open_times = slot1.open_times

	GlobalEvent:getInstance():Fire(BackpackEvent.UpdateEquipSize, slot1.type)
end

function BackpackModel.updateEquipScoreList(slot0, slot1, slot2)
	if slot2 and slot2.config then
		slot3 = slot2.config.type or 1

		if slot1 == BackPackConst.Bag_Code.EQUIPS then
			if not slot0.equip_score_list[slot3] then
				slot0.equip_score_list[slot3] = {}
			end

			slot0.equip_score_list[slot3][slot2.id] = slot2
		elseif slot1 == BackPackConst.Bag_Code.BACKPACK then
			if slot3 == BackPackConst.item_type.ARTIFACTCHIPS then
				if not slot0.equip_score_list[slot3] then
					slot0.equip_score_list[slot3] = {}
				end

				slot0.equip_score_list[slot3][slot2.id] = slot2
			elseif slot3 == BackPackConst.item_type.HERO_HUN then
				slot0.hero_hun_list[slot2.id] = slot2
			end
		elseif slot1 == BackPackConst.Bag_Code.PETBACKPACK and slot3 == BackPackConst.item_type.HOME_PET_TREASURE then
			HomepetController:getInstance():getModel():updateHaveTreasureInfoById(slot2.base_id)
		end
	end
end

function BackpackModel.initItemList(slot0, slot1)
	slot2 = slot1.bag_code

	if slot1.server_time then
		if slot0.server_time ~= slot1.server_time then
			slot0.item_list[slot2] = {}
			slot0.expansion_list[slot2] = {}
			slot0.server_time = slot1.server_time
		end
	else
		slot0.item_list[slot2] = {}
		slot0.expansion_list[slot2] = {}
	end

	slot0.expansion_list[slot2].volume = slot1.volume
	slot0.expansion_list[slot2].open_times = slot1.open_times
	slot3 = slot0.item_list[slot2]

	for slot7, slot8 in ipairs(slot1.item_list) do
		slot10 = nil

		if ((slot3[slot8.id] == nil or slot3[slot9]) and GoodsVo.New(slot8.base_id)).initAttrData then
			slot10:initAttrData(slot8)
		end

		slot3[slot9] = slot10

		slot0:updateEquipScoreList(slot2, slot10)
	end

	if slot2 == BackPackConst.Bag_Code.EQUIPS then
		slot0.cur_equip_volume = #slot1.item_list
	elseif not slot0.is_init_hero_chip_redpoint then
		slot0.is_init_hero_chip_redpoint = true

		slot0:getHeroChipRedPoint()
	end

	slot0:setHallowsCompData()
	slot0:checkArtifactCount()
	GlobalEvent:getInstance():Fire(BackpackEvent.GET_ALL_DATA, slot2)
end

function BackpackModel.getHeroChipRedPoint(slot0)
	slot2 = false

	for slot6, slot7 in pairs(slot0:getAllBackPackArray(BackPackConst.item_tab_type.HERO)) do
		if slot0:checkHeroChipRedPoint(slot7) then
			break
		end
	end

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.backpack, slot2)
end

function BackpackModel.checkHeroChipRedPoint(slot0, slot1)
	if slot1.quality ~= -1 and slot1.base_id then
		if uv0[slot1.base_id] and uv0[slot1.base_id].num <= slot1.quantity then
			return true
		end

		if slot0.hallows_comp_list and slot0.hallows_comp_list[slot1.base_id] and slot0.hallows_comp_list[slot1.base_id].num <= slot1.quantity then
			return true
		end
	end

	return false
end

function BackpackModel.addItemInBagCode(slot0, slot1)
	if slot1 == nil or next(slot1.item_list) == nil then
		return
	end

	slot2 = {}
	slot3, slot4 = nil

	for slot8, slot9 in ipairs(slot1.item_list) do
		if Config.ItemData.data_get_data(slot9.base_id) ~= nil then
			if slot0.item_list[slot9.storage] == nil then
				slot0.item_list[slot9.storage] = {}
			end

			if slot3 == nil then
				slot3 = slot9.storage
			end

			if slot0.item_list[slot9.storage][slot9.id] == nil then
				slot10[slot9.id] = GoodsVo.New(slot9.base_id)
			end

			if slot10[slot9.id].initAttrData then
				slot11:initAttrData(slot9)
			end

			slot2[slot9.id] = slot11

			slot0:updateEquipScoreList(slot3, slot11)

			if slot4.sub_type == BackPackConst.item_tab_type.HERO and slot0:checkHeroChipRedPoint(slot11) then
				MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.backpack, true)
			end
		end
	end

	if (slot3 or BackPackConst.Bag_Code.BACKPACK) == BackPackConst.Bag_Code.EQUIPS and slot0.expansion_list[slot3] then
		slot0.cur_equip_volume = slot0.cur_equip_volume + #slot1.item_list
	end

	GlobalEvent:getInstance():Fire(BackpackEvent.ADD_GOODS, slot3, slot2)
end

function BackpackModel.deleteBagItems(slot0, slot1)
	if slot1 == nil or next(slot1.item_list) == nil then
		return
	end

	slot2 = {}

	for slot7, slot8 in ipairs(slot1.item_list) do
		if nil == nil then
			slot3 = slot8.storage or BackPackConst.Bag_Code.BACKPACK
		end

		if not slot0.item_list[slot3] then
			return
		end

		slot9 = slot0.item_list[slot3][slot8.id]

		if slot3 == BackPackConst.Bag_Code.EQUIPS then
			if slot9 and slot9.config then
				if not slot0.equip_score_list[slot9.config.type or 1] then
					slot0.equip_score_list[slot10] = {}
				end

				slot0.equip_score_list[slot10][slot9.id] = nil
			end
		elseif slot3 == BackPackConst.Bag_Code.BACKPACK and slot9 and slot9.config then
			if (slot9.config.type or 1) == BackPackConst.item_type.ARTIFACTCHIPS then
				if not slot0.equip_score_list[slot10] then
					slot0.equip_score_list[slot10] = {}
				end

				slot0.equip_score_list[slot10][slot9.id] = nil
			elseif slot10 == BackPackConst.item_type.HERO_HUN then
				slot0.hero_hun_list[slot9.id] = nil
			end
		end

		if slot0.item_list[slot3] ~= nil and slot0.item_list[slot3][slot8.id] ~= nil then
			slot2[slot8.id] = slot10[slot8.id]
			slot10[slot8.id] = nil
		end
	end

	if (slot3 or BackPackConst.Bag_Code.BACKPACK) == BackPackConst.Bag_Code.EQUIPS then
		slot0.cur_equip_volume = slot0.cur_equip_volume - #slot1.item_list
	end

	GlobalEvent:getInstance():Fire(BackpackEvent.DELETE_GOODS, slot3, slot2)
end

function BackpackModel.updateBagItemsNum(slot0, slot1)
	if slot1 == nil or next(slot1.item_list) == nil then
		return
	end

	slot2 = {}
	slot3, slot4 = nil

	for slot8, slot9 in ipairs(slot1.item_list) do
		if slot9.base_id ~= nil and Config.ItemData.data_get_data(slot9.base_id) ~= nil then
			if slot0.item_list[slot9.storage] == nil then
				slot0.item_list[slot9.storage] = {}
			end

			if slot3 == nil then
				slot3 = slot9.storage
			end

			if slot0.item_list[slot9.storage][slot9.id] == nil then
				slot10[slot9.id] = GoodsVo.New(slot9.base_id)
			end

			slot11 = slot10[slot9.id]
			slot12 = nil

			if slot4.sub_type == BackPackConst.item_tab_type.HERO then
				slot12 = slot0:checkHeroChipRedPoint(slot11)
			end

			if slot11.initAttrData then
				slot11:initAttrData(slot9)
			end

			slot2[slot9.id] = slot11

			if slot3 == BackPackConst.Bag_Code.EQUIPS then
				if slot11 and slot11.config then
					if not slot0.equip_score_list[slot11.config.type or 1] then
						slot0.equip_score_list[slot13] = {}
					end

					slot0.equip_score_list[slot13][slot11.id] = slot11
				end
			elseif slot3 == BackPackConst.Bag_Code.BACKPACK and slot11 and slot11.config and (slot11.config.type or 1) == BackPackConst.item_type.HERO_HUN then
				slot0.hero_hun_list[slot11.id] = slot11
			end

			if not slot12 and slot4.sub_type == BackPackConst.item_tab_type.HERO and slot0:checkHeroChipRedPoint(slot11) then
				MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.backpack, true)
			end
		end
	end

	GlobalEvent:getInstance():Fire(BackpackEvent.MODIFY_GOODS_NUM, slot3 or BackPackConst.Bag_Code.BACKPACK, slot2)
end

function BackpackModel.getAllEquipListByType(slot0, slot1)
	return slot0.equip_score_list[slot1]
end

function BackpackModel.getHeroHunList(slot0)
	return slot0.hero_hun_list or {}
end

function BackpackModel.getBagItemList(slot0, slot1)
	if slot0.item_list ~= nil and slot0.item_list[slot1] ~= nil then
		return slot0.item_list[slot1]
	end

	return {}
end

function BackpackModel.getItemListForShare(slot0, slot1)
	slot4 = {}

	if slot0.item_list[slot1 or BackPackConst.Bag_Code.BACKPACK] then
		for slot8, slot9 in pairs(slot3) do
			if slot9.config and slot9.config.can_share == 1 then
				uv0(slot4, slot9)
			end
		end
	end

	return slot4
end

function BackpackModel.getAllBackPackArray(slot0, slot1, slot2)
	slot3 = slot1 or BackPackConst.item_tab_type.EQUIPS
	slot4 = nil
	slot6 = {}

	if slot0:getBagItemList((slot3 ~= BackPackConst.item_tab_type.EQUIPS and slot3 ~= BackPackConst.item_tab_type.HOLYEQUIPMENT or BackPackConst.Bag_Code.EQUIPS) and BackPackConst.Bag_Code.BACKPACK) ~= nil then
		for slot10, slot11 in pairs(slot5) do
			if slot11 and slot11.config and slot11.config.sub_type == slot3 then
				uv0(slot6, slot11)
			end
		end
	end

	return slot6
end

function BackpackModel.checkEquipsIsFull(slot0)
	return slot0:getEquipSize() <= tableLen(slot0:getAllBackPackArray(BackPackConst.item_tab_type.EQUIPS))
end

function BackpackModel.getBagGoldEquipList(slot0)
	slot2 = {}

	if slot0:getAllBackPackArray(BackPackConst.item_tab_type.EQUIPS) and next(slot1 or {}) ~= nil then
		for slot6, slot7 in ipairs(slot1) do
			if BackPackConst.quality.orange <= slot7.quality then
				table.insert(slot2, slot7)
			end
		end
	end

	return slot2
end

function BackpackModel.isNewGoods(slot0, slot1)
	slot0.is_new_list[slot1] = false

	return slot0.is_new_list[slot1]
end

function BackpackModel.isAssetsGoods(slot0, slot1)
	slot2 = false

	if slot1 == 104 then
		slot2 = true
	end

	return slot2
end

function BackpackModel.isSelectGiftGoods(slot0, slot1)
	slot2 = false

	if slot1 == 101 or slot1 == 100 then
		slot2 = true
	end

	return slot2
end

function BackpackModel.clearNewStateById(slot0, slot1)
	slot0.is_new_list[slot1] = nil
end

function BackpackModel.clearNewGoodsList(slot0)
	slot0.is_new_list = {}
end

function BackpackModel.getBackPackItemById(slot0, slot1)
	return slot0:getBagItemById(BackPackConst.Bag_Code.BACKPACK, slot1)
end

function BackpackModel.getHomePetItemById(slot0, slot1)
	return slot0:getBagItemById(BackPackConst.Bag_Code.PETBACKPACK, slot1)
end

function BackpackModel.getBagItemById(slot0, slot1, slot2)
	if slot0:getBagItemList(slot1) ~= nil and slot3[slot2] ~= nil then
		return slot3[slot2]
	end
end

function BackpackModel.getItemNumByBid(slot0, slot1, slot2)
	slot3 = slot2 or BackPackConst.Bag_Code.BACKPACK

	if Config.ItemData.data_assets_id2label[slot1] then
		if RoleController:getInstance():getRoleVo()[Config.ItemData.data_assets_id2label[slot1]] then
			return slot5[slot4]
		else
			return 0
		end
	elseif slot3 == BackPackConst.Bag_Code.BACKPACK then
		return slot0:getBackPackItemNumByBid(slot1)
	elseif slot3 == BackPackConst.Bag_Code.EQUIPS then
		return slot0:getEquipItemNumByBid(slot1)
	elseif slot3 == BackPackConst.Bag_Code.HOME then
		return slot0:getFurnitureNumByBid(slot1)
	end
end

function BackpackModel.getBackPackItemNumByBid(slot0, slot1)
	return slot0:getPackItemNumByBid(BackPackConst.Bag_Code.BACKPACK, slot1)
end

function BackpackModel.getEquipItemNumByBid(slot0, slot1)
	return slot0:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot1)
end

function BackpackModel.getFurnitureNumByBid(slot0, slot1)
	return slot0:getPackItemNumByBid(BackPackConst.Bag_Code.HOME, slot1)
end

function BackpackModel.getPackItemNumByBid(slot0, slot1, slot2)
	for slot8, slot9 in pairs(slot0:getBagItemList(slot1)) do
		if slot9 and slot9.config and slot9.config.id == slot2 then
			slot3 = 0 + slot9.quantity
		end
	end

	return slot3
end

function BackpackModel.getBackPackItemListByType(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in pairs(slot0:getBagItemList(BackPackConst.Bag_Code.BACKPACK)) do
		if slot8 and slot8.config and slot8.config.type == slot1 then
			uv0(slot2, slot8)
		end
	end

	return slot2
end

function BackpackModel.getBackPackItemIdListByBid(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in pairs(slot0:getBagItemList(BackPackConst.Bag_Code.BACKPACK)) do
		if slot8 and slot8.config and slot8.config.id == slot1 then
			uv0(slot2, slot8.id)
		end
	end

	return slot2
end

function BackpackModel.getBackPackItemIdListByBid1(slot0, slot1)
	slot2 = {}

	for slot7, slot8 in pairs(slot0:getBagItemList(BackPackConst.Bag_Code.EQUIPS)) do
		if slot8 and slot8.config and slot8.config.id == slot1 then
			uv0(slot2, slot8.id)
		end
	end

	return slot2
end

function BackpackModel.getBackPackItemIDByBid(slot0, slot1)
	return slot0:getPackItemIDByBid(BackPackConst.Bag_Code.BACKPACK, slot1)
end

function BackpackModel.getPackItemIDByBid(slot0, slot1, slot2)
	slot4 = 0

	for slot8, slot9 in pairs(slot0:getBagItemList(slot1)) do
		if slot9 and slot9.config and slot9.config.id == slot2 then
			slot4 = slot9.id

			break
		end
	end

	return slot4
end

function BackpackModel.getBackPackItemByBid(slot0, slot1)
	if slot0:getBackPackItemIDByBid(slot1) ~= nil then
		return slot0:getBackPackItemById(slot2)
	end
end

function BackpackModel.isEmpty(slot0)
	slot1 = true

	if slot0:getBagItemList(BackPackConst.Bag_Code.BACKPACK) ~= nil and next(slot2) ~= nil then
		slot1 = false
	end

	return slot1
end

function BackpackModel.getItemTypeIsEmpty(slot0)
	slot1 = {}

	if slot0:getBagItemList(BackPackConst.Bag_Code.BACKPACK) ~= nil then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.config and slot7.config.sub_type ~= nil and slot7.config.sub_type ~= BackPackConst.item_tab_type.OTHERS then
				if slot1[slot7.config.sub_type] == nil then
					slot1[slot7.config.sub_type] = {}
				end

				uv0(slot1[slot7.config.sub_type], slot7)
			end
		end
	end

	return slot1
end

slot3 = "item_source_key"

function BackpackModel.setSwapTimes(slot0, slot1)
	RoleEnv:getInstance():set(RoleEnv.keys.item_source_key, slot1, true)
end

function BackpackModel.getSwapTimes(slot0)
	if Config.DunChapterData.data_const_list.swap_lev_limit.val <= RoleController:getInstance():getRoleVo().lev or 1 <= RoleController:getInstance():getRoleVo().vip_lev then
		times = 10
	else
		times = 1
	end

	return times
end

function BackpackModel.setHallowsCompData(slot0)
	if next(slot0.hallows_comp_list) ~= nil then
		return
	end

	for slot5, slot6 in pairs(Config.ItemProductData.data_product_data) do
		slot0.hallows_comp_list[slot6.need_items[1][1]] = {
			bid = slot6.bid,
			num = slot6.need_items[1][2]
		}
	end
end

function BackpackModel.getHallowsCompData(slot0, slot1)
	if not slot0.hallows_comp_list and next(slot0.hallows_comp_list) == nil then
		return
	end

	return slot0.hallows_comp_list[slot1] or {}
end

function BackpackModel.checkArtifactCount(slot0, slot1)
	if slot0.is_artifact_check and not slot1 then
		return
	end

	slot0.is_artifact_check = true

	if RoleEnv:getInstance():getStr(RoleEnv.keys.artifact_count_tips) ~= "" and slot2 == os.date("%m_%d") then
		return
	end

	if slot0.backpack_tips_count == nil then
		if Config.PartnerArtifactData.data_artifact_const.backpack_tips_count then
			slot0.backpack_tips_count = slot4.val or 5
		else
			slot0.backpack_tips_count = 5
		end
	end

	for slot9, slot10 in pairs(slot0.equip_score_list[BackPackConst.item_type.ARTIFACTCHIPS] or {}) do
		slot5 = 0 + 1
	end

	if slot0.backpack_tips_count <= slot5 then
		PromptController:getInstance():getModel():addPromptData({
			type = PromptTypeConst.Artifact_Count_tips
		})
	end
end

function BackpackModel.__delete(slot0)
end
