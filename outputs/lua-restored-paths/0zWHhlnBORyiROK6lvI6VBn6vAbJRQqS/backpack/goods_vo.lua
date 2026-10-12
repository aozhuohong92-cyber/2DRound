GoodsVo = GoodsVo or BaseClass(EventDispatcher)
GoodsVo.UPDATE_GOODS_ATTR = "goodsVo_update_attr"
GoodsVo.UPDATE_EQUIP_ATTR = "goodsVo_update_equip_attr"

function GoodsVo.__init(slot0, slot1)
	slot0.id = 0
	slot0.bind = 0
	slot0.quantity = 0
	slot0.pos = 0
	slot0.expire_type = 0
	slot0.expire_time = 0
	slot0.main_attr = {}
	slot0.enchant = 0
	slot0.attr = {}
	slot0.score = 0
	slot0.all_score = 0
	slot0.extra = {}
	slot0.extra_attr = {}
	slot0.holy_eqm_attr = {}
	slot0.is_add = 0
	slot0.quality = 0
	slot0.lev = 0
	slot0.gemstone_sort = 0
	slot0.have_gemstone = false
	slot0.is_gemstone_change = false
	slot0.gemstones = {}

	slot0:setBaseId(slot1)
end

function GoodsVo.setBaseId(slot0, slot1)
	slot1 = slot1 or 0
	slot0.base_id = slot1
	slot0.config = Config.ItemData.data_get_data(slot1)

	if slot0.config ~= nil then
		slot0.use_type = slot0.config.use_type or 0
		slot0.quality = slot0.config.quality or 0
		slot0.sub_type = slot0.config.sub_type or 0
		slot0.lev = slot0.config.lev
		slot0.sort = Config.ItemData.data_item_sort[slot0.config.type] or 0
		slot0.eqm_star = slot0.config.eqm_star or 0
		slot0.eqm_jie = slot0.config.eqm_jie or 0

		if slot0.config.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
			slot0.eqm_set = slot0.config.eqm_set
		end

		if Config.HomeData.data_home_unit(slot1) then
			slot0.unit_type = slot2.type
		end
	end
end

function GoodsVo.setEnchantInfo(slot0, slot1, slot2)
	slot0.enchant = slot1
	slot0.attr = slot2
end

function GoodsVo.initAttrData(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			if slot5 == "quantity" then
				if slot0.quantity < slot6 then
					slot0.is_add = 1
				elseif slot6 < slot0.quantity then
					slot0.is_add = 2
				else
					slot0.is_add = 0
				end
			end

			slot0:setGoodsAttr(slot5, slot6)
		end
	end

	if slot0.config and slot0.config.type == BackPackConst.item_type.ARTIFACTCHIPS then
		slot0:calculateArtifactScore()
	end
end

function GoodsVo.getGoodsAttr(slot0, slot1)
	return slot0[slot1]
end

function GoodsVo.getEquipBaseScore(slot0)
	if slot0.config == nil or slot0.config.ext == nil or slot0.config.ext[1] == nil or slot0.config.ext[1][2] == nil then
		return 0
	end

	slot0.score = PartnerCalculate.calculatePower(slot0.config.ext[1][2])

	return slot0.score
end

function GoodsVo.getEquipBaseAttr(slot0)
	if slot0.config == nil or slot0.config.ext == nil or slot0.config.ext[1] == nil or slot0.config.ext[1][2] == nil then
		return 0
	end

	return slot0.config.ext[1][2]
end

function GoodsVo.calculateArtifactScore(slot0)
	slot1 = Config.PartnerArtifactData.data_artifact_const

	for slot6, slot7 in ipairs(slot0.extra) do
		if slot7 and slot7.extra_k and (slot7.extra_k == 1 or slot7.extra_k == 2 or slot7.extra_k == 8) and Config.SkillData.data_get_skill(slot7.extra_v) and slot1["skill_score_" .. (slot8.level or 1)] and slot1[slot10].val then
			slot2 = 0 + slot1[slot10].val
		end
	end

	slot0.all_score = slot2
end

function GoodsVo.setEnchantScore(slot0, slot1)
	slot0.all_score = slot0:getEquipBaseScore() + slot1
end

function GoodsVo.setGoodsAttr(slot0, slot1, slot2)
	if slot1 == "gemstones" then
		slot0:gemstonesList(slot2)
	elseif slot0[slot1] ~= slot2 then
		if slot1 == "base_id" then
			slot0:setBaseId(slot2)
		end

		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end
end

function GoodsVo.gemstonesList(slot0, slot1)
	slot0.gemstones = {}
	slot0.have_gemstone = false
	slot0.is_gemstone_change = true
	slot0.gemstone_sort = 0

	for slot5, slot6 in ipairs(slot1) do
		slot0.gemstones[slot5] = slot6
		slot0.gemstone_sort = slot0.gemstone_sort + slot6.lev

		if slot6.lev ~= 0 then
			slot0.have_gemstone = true
		end
	end

	table.sort(slot0.gemstones, function (slot0, slot1)
		return slot1.lev < slot0.lev
	end)
	slot0:dispatchUpdateAttrByKey("gemstones", slot1)
end

function GoodsVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(GoodsVo.UPDATE_GOODS_ATTR, slot1, slot2)
end

function GoodsVo.checkGemStone(slot0)
	if slot0.is_gemstone_change == true or slot0.gem_red_status ~= nil then
		slot1 = false

		if slot0.gemstones and tableLen(slot0.gemstones) > 0 and Config.PartnerGemstoneData.data_const.gem_open_lev.val <= (RoleController:getInstance():getRoleVo() and slot2.lev or 0) then
			slot8 = (slot0.gemstones[#slot0.gemstones] or {}).lev or 0
			slot11 = Config.PartnerGemstoneData.data_upgrade[getNorKey(slot0.config.type, slot8)]

			if Config.PartnerGemstoneData.data_upgrade[getNorKey(slot0.config.type, slot8 + 1)] and slot12.limit_lev <= slot3 and slot11 and slot11.expend <= BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.PartnerGemstoneData.data_const.gem_fragments.val) then
				slot1 = true
			end
		end

		slot0.is_gemstone_change = false
		slot0.gem_red_status = slot1
	end

	return slot0.gem_red_status
end
