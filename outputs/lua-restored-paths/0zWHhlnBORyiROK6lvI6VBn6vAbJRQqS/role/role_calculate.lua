RoleCalculate = RoleCalculate or BaseClass()

function RoleCalculate.isLimitCareer(slot0, slot1, slot2)
	if slot1 ~= nil and slot2 ~= nil and CommonGoodsType.isRolePartnerEquip(slot2.bid) then
		if RoleCalculate.isCanPutOn(slot2, slot0) == false then
			return slot3
		end

		if RoleCalculate.isLevLimit(slot1, slot2) == false then
			return slot3
		end

		if RoleCalculate.isCareerLimit(slot0, slot1, slot2) == false then
			return slot3
		end
	end

	return true
end

function RoleCalculate.isCareerLimit(slot0, slot1, slot2)
	slot3 = nil
	slot4 = true
	slot3 = (not slot0 or slot1.career) and Config.PartnerBase[slot1.bid].career

	if Config.Item[slot2.bid].condition and slot5.condition.career then
		slot8 = false

		for slot12 = string.len(slot3), 1, -1 do
			if tonumber(string.sub(slot3, 1, slot12)) == slot5.condition.career then
				slot8 = true

				break
			end
		end

		if slot8 == false then
			slot4 = slot8
		end
	end

	return slot4
end

function RoleCalculate.isLevLimit(slot0, slot1)
	slot2 = true

	if slot0 and slot1 then
		if Config.Item[slot1.bid] and slot0.lev < slot4.lev then
			slot2 = false
		end
	end

	return slot2
end

function RoleCalculate.isCanPutOn(slot0, slot1)
	if CommonGoodsType.isRolePartnerEquip(slot0.bid) and slot0.object then
		if slot1 then
			if slot0.object == RoleConstants.Object.Hero then
				return false
			end
		elseif slot0.object == RoleConstants.Object.Role then
			return false
		end
	end

	return true
end

function RoleCalculate.checkEquipCell(slot0, slot1, slot2, slot3)
	if CommonGoodsType.isRolePartnerEquip(slot0.bid) and slot1 == Config.EqmPos_2[Config.Item[slot0.bid].type].pos and RoleCalculate.isEquipLimit(slot0, slot2, slot3) then
		return slot0
	end
end

function RoleCalculate.isEquipLimit(slot0, slot1, slot2)
	return RoleCalculate.isLimitCareer(slot2, slot1, slot0)
end

function RoleCalculate.getEquipByShop(slot0, slot1)
	slot3, slot4 = nil

	for slot9, slot10 in pairs(Config.MallGoods) do
		if CommonGoodsType.isRolePartnerEquip(slot10.item_bid) and Config.Item[slot10.item_bid] and ShopModel:getInstance():hasGoodsByBidOnEquip(slot10.item_bid, slot11.lev) and RoleCalculate.isEquipLimit(slot11, GameData:getInstance():getRoleVo(), slot1 or true) and Config.EqmPos_2[slot11.type].pos == slot0 and 0 < slot11.lev then
			slot2 = slot13
			slot3 = slot11
			slot4 = slot10
		end
	end

	return slot3, slot4
end

function RoleCalculate.getHeroEquipByShop(slot0, slot1)
	slot3, slot4 = nil

	for slot9, slot10 in pairs(Config.MallGoods) do
		if CommonGoodsType.isRolePartnerEquip(slot10.item_bid) and Config.Item[slot10.item_bid] and ShopModel:getInstance():hasGoodsByBidOnEquip(slot10.item_bid, slot11.lev) and RoleCalculate.isEquipLimit(slot11, slot1, false) and Config.EqmPos_2[slot11.type].pos == slot0 and 0 < slot11.lev then
			slot2 = slot13
			slot3 = slot11
			slot4 = slot10
		end
	end

	return slot3, slot4
end

function RoleCalculate.isCanTakeOff(slot0)
	return not RoleCalculate.isFaBao(slot0)
end

function RoleCalculate.isFaBao(slot0)
	return CommonGoodsType.isPartnerFaBao(slot0)
end

function RoleCalculate.getFashionPageType(slot0)
	if Config.Item[slot0] then
		if slot1.type == 200 then
			return RoleTabConstants.all_style
		elseif slot2 == 201 then
			return RoleTabConstants.all_style
		elseif slot2 == 202 then
			return RoleTabConstants.shinering
		elseif slot2 == 203 then
			return RoleTabConstants.footprint
		elseif slot2 == 255 then
			return RoleTabConstants.all_style
		end
	end
end

function RoleCalculate.isItemFashion(slot0)
	slot1 = false

	if Config.Item[slot0] then
		if slot2.type == 200 then
			slot1 = true
		elseif slot3 == 201 then
			slot1 = true
		elseif slot3 == 202 then
			slot1 = true
		elseif slot3 == 203 then
			slot1 = true
		elseif slot3 == 255 then
			slot1 = true
		end
	end

	return slot1
end

function RoleCalculate.isItemJingLian(slot0)
	slot1 = false

	if Config.Item[slot0] and slot2.type == 201 then
		slot1 = true
	end

	return slot1
end

function RoleCalculate.getFashionArrByType(slot0)
	slot1 = Array.New()
	slot2 = GameData:getInstance():getRoleVo()

	for slot6, slot7 in pairs(Config.Fashion) do
		if slot0 == slot7.type and slot2 and (slot2.career == slot7.career or slot7.career == 100) and (slot2.sex == tonumber(slot7.sex) or tonumber(slot7.sex) == 100) then
			slot1:PushBack({
				bid = slot6,
				config = slot7,
				goodsVo = BackPackCtrl:getInstance():getData():getFashionVoByBid(slot6)
			})
		end
	end

	if slot1:GetSize() > 0 then
		slot1:LowerSort("bid")
	end

	return slot1
end

function RoleCalculate.getFashionArrByTypePro()
	slot1 = GameData:getInstance():getRoleVo()

	for slot6, slot7 in pairs(Config.Fashion) do
		if RoleTabConstants.headwear == slot7.type and slot1 and (slot1.career == slot7.career or slot7.career == 100) and (slot1.sex == tonumber(slot7.sex) or tonumber(slot7.sex) == 100) and slot7.show == 1 then
			Array.New():PushBack({
				bid = slot6,
				config = slot7,
				goodsVo = BackPackCtrl:getInstance():getData():getFashionVoByBid(slot6)
			})
		end
	end

	for slot6, slot7 in pairs(Config.Fashion) do
		if RoleTabConstants.bubble == slot7.type and slot1 and (slot1.career == slot7.career or slot7.career == 100) and (slot1.sex == tonumber(slot7.sex) or tonumber(slot7.sex) == 100) then
			slot0:PushBack({
				bid = slot6,
				config = slot7,
				goodsVo = BackPackCtrl:getInstance():getData():getFashionVoByBid(slot6)
			})
		end
	end

	for slot6, slot7 in pairs(Config.Fashion) do
		if RoleTabConstants.clothes == slot7.type and slot1 and (slot1.career == slot7.career or slot7.career == 100) and (slot1.sex == tonumber(slot7.sex) or tonumber(slot7.sex) == 100) then
			slot0:PushBack({
				bid = slot6,
				config = slot7,
				goodsVo = BackPackCtrl:getInstance():getData():getFashionVoByBid(slot6)
			})
		end
	end

	if slot0:GetSize() > 0 then
		slot0:LowerSort("bid")
	end

	return slot0
end

function RoleCalculate.isActivateFashion(slot0)
	slot1 = slot0 ~= nil

	if slot0 and slot0.expire_ts then
		slot1 = slot0.expire_ts > 0 and GameNet:getInstance():getTime() < slot2 or slot2 == 0
	end

	return slot1
end

function RoleCalculate.getFashionAttribute(slot0, slot1)
	if Config.Fashion[slot0.bid] then
		slot6 = slot4.activate_attr[slot1] or 0

		if slot6 > 0 and slot0.getAttrExtByCode then
			slot2 = 0 + slot6 + RoleCalculate.getFashionAddAttr(slot3, slot0:getAttrExtByCode(GoodsVo.AttrExt.fashion_jie), slot0:getAttrExtByCode(GoodsVo.AttrExt.fashion_perfect), slot1)
		end
	end

	return slot2
end

function RoleCalculate.getFashionAddAttr(slot0, slot1, slot2, slot3)
	slot4 = 0

	if Config.FashionUpgrade[slot0] and Config.FashionUpgrade[slot0][slot1] and Config.FashionUpgrade[slot0][slot1][slot2] then
		slot4 = Config.FashionUpgrade[slot0][slot1][slot2].add_attr[slot3] or 0
	end

	return slot4
end

function RoleCalculate.getFashionNextAddAttr(slot0, slot1, slot2, slot3)
	slot4 = RoleCalculate.getFashionAddAttr(slot0, slot1, slot2, slot3)
	slot5 = slot1
	slot6 = slot2

	if slot2 < Config.FashionConstant[2].value then
		slot6 = 0
		slot5 = math.min(slot1 + 1, Config.FashionConstant[1].value)

		if slot1 == Config.FashionConstant[1].value then
			slot6 = Config.FashionConstant[2].value
		end
	elseif slot1 < Config.FashionConstant[1].value then
		slot5 = math.min(slot1 + 1, Config.FashionConstant[1].value)
		slot6 = 0
	else
		slot6 = 0
		slot5 = 0
	end

	slot7 = 0

	if slot5 > 0 or slot6 > 0 then
		slot7 = RoleCalculate.getFashionAddAttr(slot0, slot5, slot6, slot3) - slot4
	end

	return slot7
end

function RoleCalculate.getFashionTabByType()
	slot0 = {}

	for slot4, slot5 in pairs(Config.Fashion) do
		if not slot0[slot5.type] then
			slot0[slot5.type] = true
		end
	end

	return slot0
end
