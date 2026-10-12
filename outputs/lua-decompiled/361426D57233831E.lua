PartnerComboModel = PartnerComboModel or BaseClass()
slot0 = table.sort
slot1 = table.insert
slot2 = string.format
PartnerComboModel.OPEN_LEVEL = 65

function PartnerComboModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PartnerComboModel.config(slot0)
	slot0.activeted_list = {}
	slot0.attr_list = {}
	slot0.meet_conditions_hero_list = {}
	slot0.not_meet_conditions_hero_list = {}
	slot0.redpoint_record = {}
	slot0.redpoint_status = false
end

function PartnerComboModel.updateAllData(slot0, slot1)
	slot0:updateAttrList(slot1)
	slot0:updateActivatedCombo(slot1)
	slot0:updateRedpoint()
end

function PartnerComboModel.getConfigDataListByQuality(slot0, slot1)
	if not slot0.config_datas then
		slot0.config_datas = {
			[0] = {}
		}

		for slot6, slot7 in pairs(Config.PartnerCatalogData.data_catalog_list) do
			uv0(slot0.config_datas[0], slot7)

			if not slot0.config_datas[slot7.quality] then
				slot0.config_datas[slot7.quality] = {}
			end

			uv0(slot0.config_datas[slot7.quality], slot7)
		end

		for slot6, slot7 in pairs(slot0.config_datas) do
			uv1(slot7, SortTools.KeyLowerSorter("sort"))
		end
	end

	return slot0.config_datas
end

function PartnerComboModel.clearConfigDatas(slot0)
	slot0.config_datas = nil
end

function PartnerComboModel.updateActivatedCombo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.ninjagroup_list
	slot3 = true

	for slot7, slot8 in pairs(Config.PartnerCatalogData.data_catalog_list) do
		for slot12, slot13 in ipairs(slot2) do
			if slot8.gid == slot13.gid then
				slot3 = false
				slot0.activeted_list[slot8.gid] = slot13.lev
			end
		end

		if slot3 then
			slot0.activeted_list[slot8.gid] = 0
		end

		slot3 = true
	end
end

function PartnerComboModel.getActivetedLevel(slot0, slot1)
	return slot0.activeted_list[slot1] or 0
end

function PartnerComboModel.updateAttrList(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.attr_list = {}

	if slot1.ninjagroup_list[1] then
		for slot5, slot6 in ipairs(slot1.ninjagroup_list) do
			for slot11, slot12 in ipairs(Config.PartnerCatalogData.data_get_update[slot6.gid .. "_" .. slot6.lev].effect) do
				if slot0.attr_list[slot12[1]] then
					slot0.attr_list[slot12[1]] = slot0.attr_list[slot12[1]] + slot12[2]
				else
					slot0.attr_list[slot12[1]] = slot12[2]
				end
			end
		end
	end
end

function PartnerComboModel.getAttrList(slot0)
	return slot0.attr_list
end

function PartnerComboModel.checkCanShow(slot0)
	slot1 = false

	if PartnerComboModel.OPEN_LEVEL <= RoleController:getInstance():getRoleVo().lev then
		slot1 = true
	end

	return slot1
end

function PartnerComboModel.updateRedpoint(slot0)
	slot0.meet_conditions_hero_list = {}
	slot0.not_meet_conditions_hero_list = {}
	slot0.redpoint_record = {}

	if not slot0:checkCanShow() then
		return
	end

	slot2 = {}

	for slot8, slot9 in pairs(Config.PartnerCatalogData.data_catalog_list) do
		if Config.PartnerCatalogData.data_get_update[uv0("%d_%d", slot9.gid, (slot0.activeted_list[slot9.gid] or 0) + 1)] then
			uv1(slot2, slot12)
		end
	end

	slot5 = HeroController:getInstance():getModel():getHeroList()

	for slot9, slot10 in ipairs(slot2) do
		slot11 = 0

		for slot15, slot16 in ipairs(slot10.cards) do
			if slot0.meet_conditions_hero_list[slot10.gid] == nil then
				slot0.meet_conditions_hero_list[slot10.gid] = {}
				slot0.not_meet_conditions_hero_list[slot10.gid] = {}
			end

			if slot0.meet_conditions_hero_list[slot10.gid][slot16[1]] == nil then
				slot0.meet_conditions_hero_list[slot10.gid][slot16[1]] = {}
				slot0.not_meet_conditions_hero_list[slot10.gid][slot16[1]] = {}
			end

			for slot20, slot21 in pairs(slot5) do
				if slot21.bid == slot16[1] and slot21.lev == 1 and slot21.init_star == slot21.star then
					if slot21:isLock() or slot21.isInForm and slot21:isInForm() then
						uv1(slot0.not_meet_conditions_hero_list[slot10.gid][slot16[1]], slot21)
					else
						uv1(slot0.meet_conditions_hero_list[slot10.gid][slot16[1]], slot21)
					end
				end
			end

			if slot16[2] <= #slot0.meet_conditions_hero_list[slot10.gid][slot16[1]] then
				slot11 = slot11 + 1
			end
		end

		if slot11 == #slot10.cards then
			slot0.redpoint_record[slot10.gid] = true
		end

		if slot0.redpoint_record[slot10.gid] then
			for slot15, slot16 in ipairs(slot10.materials) do
				if BackpackController:getInstance():getModel():getItemNumByBid(slot16[1]) < slot16[2] then
					slot0.redpoint_record[slot10.gid] = false

					break
				end
			end
		end
	end

	slot0.redpoint_status = false

	for slot9, slot10 in pairs(slot0.redpoint_record) do
		if slot10 then
			slot0.redpoint_status = true

			break
		end
	end

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.partner, {
		bid = HeroConst.RedPointType.ePokedex,
		status = slot0.redpoint_status
	})
	GlobalEvent:getInstance():Fire(HeroEvent.PARTNER_COMBO_REDPOINT_STATUS_UPDATE)
end

function PartnerComboModel.getMeetConditionsHeroList(slot0)
	return slot0.meet_conditions_hero_list
end

function PartnerComboModel.getNotMeetConditionsHeroList(slot0)
	return slot0.not_meet_conditions_hero_list
end

function PartnerComboModel.getRedpointRecord(slot0)
	return slot0.redpoint_record
end

function PartnerComboModel.getRedpointStatus(slot0)
	return slot0.redpoint_status
end

function PartnerComboModel.__delete(slot0)
end
