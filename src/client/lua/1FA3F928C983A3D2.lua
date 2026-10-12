CommonGoodsType = CommonGoodsType or {}
CommonGoodsType.bagItemType = {
	BAG_MATERIAL = 4,
	BAG_ALL = 1
}

function CommonGoodsType.getGoodsItemType(slot0)
	if Config.ItemData.data_get_data(slot0) and slot1.type then
		if slot2 >= 11 and slot2 <= 20 then
			return CommonGoodsType.bagItemType.BAG_PROP
		elseif slot2 == 0 then
			return CommonGoodsType.bagItemType.BAG_MATERIAL
		elseif CommonGoodsType.isRoleEquip(slot0) then
			return CommonGoodsType.bagItemType.BAG_EQUIP
		end
	end
end

function CommonGoodsType.isRoleBagGoods(slot0)
	if CommonGoodsType.isBaseItem(slot0) or CommonGoodsType.isGiftItem(slot0) or CommonGoodsType.isJewelItem(slot0) or CommonGoodsType.isRoleEquip(slot0) then
		return true
	end

	return false
end

function CommonGoodsType.isRoleEquip(slot0)
	if CommonGoodsType.isRolePartnerEquip(slot0) then
		return true
	end

	return false
end

function CommonGoodsType.isArtifact(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and slot1.type and slot2 == BackPackConst.item_type.ARTIFACTCHIPS then
		return true
	end

	return false
end

function CommonGoodsType.isRolePartnerEquip(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and slot1.sub_type and slot2 == 4 then
		return true
	end

	return false
end

function CommonGoodsType.getQualityByVo(slot0)
	slot1 = 1
	slot2 = slot0.base_id or slot0.bid

	if slot0 and slot2 and Config.ItemData.data_get_data(slot2) then
		slot1 = (slot4.type < 1 or slot4.type > 6 or slot0.quality) and slot4.quality
	end

	return slot1
end

function CommonGoodsType.isMutiBuy(slot0, slot1)
	if slot0 == 1 and slot1 ~= 7 then
		return true
	end

	return false
end

function CommonGoodsType.isGiftItem(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and (slot1.type == 100 or slot2 == 101) then
		return true
	end

	return false
end

function CommonGoodsType.isCanBatchUse(slot0)
	if slot0 and slot0 == 10220 then
		return false
	end

	return true
end

function CommonGoodsType.isRemoveItem(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and slot1.type == 0 then
		return true
	end

	return false
end

function CommonGoodsType.isAsset(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and slot1.type == 7 then
		return true
	end

	return false
end

function CommonGoodsType.isPartnerPiece(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and slot1.type == 102 then
		return true
	end

	return false
end

function CommonGoodsType.isPartnerFashion(slot0)
	if slot0 and Config.ItemData.data_get_data(slot0) and slot1.type == 12 then
		return true
	end

	return false
end

function CommonGoodsType.isHaveActiveGoods(slot0)
	for slot5, slot6 in pairs(Config.AvatarData.data_avatar) do
		if slot6 and slot6.base_id and slot6.loss and slot6.loss[1] and slot6.loss[1][1] and slot6.loss[1][2] and not (slot0 or {})[slot6.base_id] then
			if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot6.loss[1][1]) and slot6.loss[1][2] < slot9 then
				return true
			end
		end
	end

	return false
end
