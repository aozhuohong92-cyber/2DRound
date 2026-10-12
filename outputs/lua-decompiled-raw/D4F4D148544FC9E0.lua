HeroCalculate = HeroCalculate or BaseClass()

function HeroCalculate.isEquipAttr(slot0)
	if slot0 == "atk2" or slot0 == "def2" or slot0 == "hp2" or slot0 == "speed2" or slot0 == "hit_rate2" or slot0 == "crit_rate2" or slot0 == "hit_magic2" or slot0 == "dodge_magic2" or slot0 == "crit_ratio2" then
		return true
	end

	return false
end

function HeroCalculate.isShowPer(slot0)
	if Config.AttrData.data_type[Config.AttrData.data_id_to_key[slot0]] and slot2 == 2 then
		return true
	end

	return false
end

function HeroCalculate.isShowPerByStr(slot0)
	if Config.AttrData.data_type[slot0] and slot1 == 2 then
		return true
	end

	return false
end

function HeroCalculate.getIsCanClothArtifact(slot0)
	return false
end

function HeroCalculate.calculatePower(slot0)
	if slot0 == nil or tableLen(slot0) == 0 then
		return 0
	end

	slot2, slot3 = nil

	for slot7, slot8 in pairs(slot0) do
		if type(slot8) == "table" and #slot8 >= 2 then
			slot2 = slot8[1]
			slot3 = slot8[2]
		else
			slot2 = slot7
			slot3 = slot8
		end

		if Config.AttrData.data_power[slot2] then
			slot1 = slot1 + (slot3 - slot9.not_to_power) * slot9.power * 0.001
		end
	end

	return math.ceil(slot1)
end

function HeroCalculate.holyEquipMentPower(slot0)
	if slot0 == nil or tableLen(slot0) == 0 then
		return 0
	end

	slot2, slot3 = nil

	for slot7, slot8 in pairs(slot0) do
		if type(slot8) == "table" and #slot8 >= 2 then
			slot2 = slot8[1]
			slot3 = slot8[2]
		else
			slot2 = slot7
			slot3 = slot8
		end

		if Config.PartnerHolyEqmData.data_holy_attr_score[slot2] then
			slot1 = slot1 + slot3 * slot9.score * 0.001
		end
	end

	return math.ceil(slot1)
end

function HeroCalculate.checkAllStarFuseRedpoint()
	if not HeroController:getInstance():getModel():getStarFuseList() then
		return false
	end

	return HeroCalculate.checkCampStarFuseRedpoint(slot0[0])
end

function HeroCalculate.clearAllStarFuseRedpointRecord()
	if not HeroController:getInstance():getModel():getStarFuseList() then
		return false
	end

	for slot5, slot6 in ipairs(slot0[0]) do
		slot6.cur_redpoint = nil
	end

	if HeroCalculate.checkAllStarFuseRedpoint() and HeroController:getInstance():getModel():checkNewFuseRedPoint() then
		HeroController:getInstance():sender11055(1)
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.guild, slot2)
end

function HeroCalculate.checkCampStarFuseRedpoint(slot0)
	if not slot0 then
		return false
	end

	slot2 = nil

	for slot6, slot7 in ipairs(slot0) do
		if not false and HeroCalculate.checkSingleStarFuseRedPoint(slot7) then
			slot1 = true
		end
	end

	return slot1
end

function HeroCalculate.checkSingleStarFuseRedPoint(slot0)
	if slot0.cur_redpoint ~= nil then
		return slot0.cur_redpoint == 1
	end

	if not slot0.star_config then
		return false
	end

	slot1, slot2, slot3 = HeroCalculate.checkSingleStarFuseRedPointByStarConfig(slot0.star_config)

	if slot1 then
		slot0.cur_redpoint = 1
	else
		slot0.cur_redpoint = 2
	end

	slot0.need_count = slot2 or 0
	slot0.total_count = slot3 or 0

	return slot1
end

function HeroCalculate.checkSingleStarFuseRedPointByStarConfig(slot0, slot1, slot2)
	if not slot0 then
		return false
	end

	slot3 = {}
	slot4 = 1
	slot5 = slot0.expend1[1]
	slot7 = {}
	slot8 = {}

	if not slot1 then
		if slot5 then
			slot12 = slot5[3]
			({
				[slot10] = {}
			})[slot5[1]][slot5[2]] = slot12
			slot9 = 0 + slot12
		end

		slot4 = slot4 + 1
	else
		slot8[slot2] = 1
	end

	for slot13, slot14 in ipairs(slot0.expend2) do
		slot16 = slot14[2]
		slot17 = slot14[3]

		if slot6[slot14[1]] == nil then
			slot6[slot15] = {}
		end

		if slot6[slot15][slot16] == nil then
			slot6[slot15][slot16] = slot17
		else
			slot6[slot15][slot16] = slot6[slot15][slot16] + slot17
		end

		slot9 = slot9 + slot17
		slot4 = slot4 + 1
	end

	if slot4 <= 4 then
		for slot13, slot14 in ipairs(slot0.expend3) do
			slot16 = slot14[2]
			slot17 = slot14[3]

			if slot7[slot14[1]] == nil then
				slot7[slot15] = {}
			end

			if slot7[slot15][slot16] == nil then
				slot7[slot15][slot16] = slot17
			else
				slot7[slot15][slot16] = slot7[slot15][slot16] + slot17
			end

			slot9 = slot9 + slot17

			if slot4 + 1 > 4 then
				break
			end
		end
	end

	return slot9 <= HeroController:getInstance():getModel():getHeroListByMatchInfo(slot6, slot7, slot8), slot9, slot11
end

function HeroCalculate.checkAllHeroRedPoint()
	slot0 = HeroCalculate.checkHeroRedPointByRedPointType(HeroConst.RedPointType.eRPLevelUp, true)
	slot1 = HeroCalculate.checkHeroRedPointByRedPointType(HeroConst.RedPointType.eRPEquip, true)
	slot2 = HeroCalculate.checkHeroRedPointByRedPointType(HeroConst.RedPointType.eRPStar, true)

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.partner, {
		slot0,
		slot1,
		slot2
	})
	GlobalEvent:getInstance():Fire(HeroEvent.All_Hero_RedPoint_Event, {
		slot0,
		slot1,
		slot2,
		HeroCalculate.checkHeroRedPointByRedPointType(HeroConst.RedPointType.eRPTalent, true)
	})
end

function HeroCalculate.checkHeroRedPointByRedPointType(slot0, slot1)
	for slot7, slot8 in pairs(HeroController:getInstance():getModel():getHeroList()) do
		if HeroCalculate.isCheckHeroRedPointByHeroVo(slot8) then
			if slot0 == HeroConst.RedPointType.eRPLevelUp then
				if ({
					bid = slot0,
					status = false,
					status = HeroCalculate.checkSingleHeroLevelUpRedPoint(slot8)
				}).status then
					break
				end
			elseif slot0 == HeroConst.RedPointType.eRPEquip then
				slot3.status = HeroCalculate.checkSingleHeroEquipRedPoint(slot8)

				if slot3.status then
					break
				end
			elseif slot0 == HeroConst.RedPointType.eRPStar then
				slot3.status = HeroCalculate.checkSingleHeroUpgradeStarRedPoint(slot8)

				if slot3.status then
					break
				end
			elseif slot0 == HeroConst.RedPointType.eRPTalent then
				slot3.status = HeroCalculate.checkSingleHeroTalentSkillRedPoint(slot8)

				if slot3.status then
					break
				end
			end
		end
	end

	if slot1 then
		return slot3
	else
		if slot0 ~= HeroConst.RedPointType.eRPTalent then
			MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.partner, {
				slot3
			})
		end

		GlobalEvent:getInstance():Fire(HeroEvent.All_Hero_RedPoint_Event, {
			slot3
		})
	end
end

function HeroCalculate.clearAllHeroRecordByRedPointType(slot0, slot1)
	for slot7, slot8 in pairs(HeroController:getInstance():getModel():getHeroList()) do
		slot8.red_point[slot0] = nil
	end

	if slot1 then
		delayOnce(function ()
			if HeroCalculate then
				HeroCalculate.checkHeroRedPointByRedPointType(uv0)

				if uv0 == HeroConst.RedPointType.eRPLevelUp or uv0 == HeroConst.RedPointType.eRPTalent then
					uv1.is_delay_redpoint_update[uv0] = false
				end
			end
		end, 1)
	else
		slot4()
	end
end

function HeroCalculate.isCheckHeroRedPointByHeroVo(slot0)
	if not slot0 then
		return false
	end

	if slot0:isFormDrama() then
		return true
	end

	return false
end

function HeroCalculate.checkSingleHeroRedPoint(slot0)
	slot1 = false

	if HeroCalculate.checkSingleHeroLevelUpRedPoint(slot0) then
		return true
	end

	if HeroCalculate.checkSingleHeroEquipRedPoint(slot0) then
		return true
	end

	if HeroCalculate.checkSingleHeroUpgradeStarRedPoint(slot0) then
		return true
	end

	return HeroCalculate.checkSingleHeroTalentSkillRedPoint(slot0)
end

function HeroCalculate.isEnoughCondition(slot0, slot1)
	slot2 = true

	for slot6, slot7 in ipairs(slot0) do
		if slot7[1] == "star" and slot1.star < slot7[2] then
			slot2 = false
		end
	end

	return slot2
end

function HeroCalculate.getHeroShowLevelStatus(slot0)
	if Config.PartnerData.data_partner_brach[getNorKey(slot0.type, slot0.break_id, slot0.break_lev)] == nil then
		return -1
	end

	slot6 = 0

	if Config.PartnerData.data_partner_brach[getNorKey(slot0.type, slot0.break_id, slot0.break_lev + 1)] == nil then
		if Config.PartnerData.data_partner_star(getNorKey(slot0.bid, slot0.star)) and slot2.lev_max < slot8.lev_max then
			slot5 = slot8.lev_max
		end

		if slot5 <= slot0.lev then
			slot6 = 0
		else
			slot6 = 1
		end
	elseif slot4.limit and next(slot4.limit) ~= nil then
		if slot2.lev_max <= slot0.lev then
			if HeroCalculate.isEnoughCondition(slot4.limit, slot0) then
				slot6 = 2
			else
				slot6 = 0
			end
		else
			slot6 = 1
		end
	elseif slot2.lev_max <= slot0.lev then
		slot6 = 2
	else
		slot6 = 1
	end

	return slot6
end

function HeroCalculate.checkSingleHeroLevelUpRedPoint(slot0)
	if not slot0 then
		return false
	end

	if slot0.red_point[HeroConst.RedPointType.eRPLevelUp] ~= nil then
		return slot0.red_point[HeroConst.RedPointType.eRPLevelUp] == true
	end

	if slot0.isResonateCrystalHero and slot0:isResonateCrystalHero() then
		return false
	end

	slot2 = false

	if HeroCalculate.getHeroShowLevelStatus(slot0) == 1 then
		if Config.PartnerData.data_partner_lev[slot0.lev] then
			slot5 = true

			for slot9, slot10 in ipairs(slot3.expend or {}) do
				if BackpackController:getInstance():getModel():getItemNumByBid(slot10[1]) < slot10[2] then
					slot5 = false
				end
			end

			slot2 = slot5
		end
	elseif slot1 == 2 and Config.PartnerData.data_partner_brach[getNorKey(slot0.type, slot0.break_id, slot0.break_lev)] then
		slot6 = true

		for slot10, slot11 in ipairs(slot4.expend or {}) do
			if BackpackController:getInstance():getModel():getItemNumByBid(slot11[1]) < slot11[2] then
				slot6 = false
			end
		end

		slot2 = slot6
	end

	slot0.red_point[HeroConst.RedPointType.eRPLevelUp] = slot2

	return slot2
end

function HeroCalculate.checkSingleHeroEachPosEquipRedPoint(slot0, slot1)
	slot4 = BackpackController:getInstance():getModel():getAllEquipListByType(slot0 or 1)

	if slot1 == nil then
		if slot4 and next(slot4) then
			return true
		end
	else
		if slot1.all_score == nil or slot1.all_score == 0 then
			slot1:setEnchantScore(0)
		end

		slot5 = slot1.all_score or 0

		if slot4 then
			for slot9, slot10 in pairs(slot4) do
				if slot10.all_score and slot5 < slot10.all_score then
					return true
				end
			end
		end
	end

	return false
end

function HeroCalculate.checkSingleArtifactRedPoint(slot0)
	slot2 = BackpackController:getInstance():getModel():getAllEquipListByType(BackPackConst.item_type.ARTIFACTCHIPS)

	if slot0 == nil and slot2 and next(slot2) then
		return true
	end

	return false
end

function HeroCalculate.checkSingleHeroEquipRedPoint(slot0)
	if not slot0 then
		return false
	end

	if not slot0:isInitAttr() then
		return false
	end

	if slot0.red_point[HeroConst.RedPointType.eRPEquip] ~= nil then
		return slot0.red_point[HeroConst.RedPointType.eRPEquip] == true
	end

	slot1 = nil

	for slot8, slot9 in ipairs(HeroConst.EquipPosList or {}) do
		if HeroCalculate.checkSingleHeroEachPosEquipRedPoint(slot9, HeroController:getInstance():getModel():getHeroEquipList(slot0.partner_id)[slot9]) then
			break
		end
	end

	slot0.red_point[HeroConst.RedPointType.eRPEquip] = slot1

	return slot1
end

function HeroCalculate.checkSingleHeroUpgradeStarRedPoint(slot0)
	if not slot0 then
		return false
	end

	if slot0.red_point[HeroConst.RedPointType.eRPStar] ~= nil then
		return slot0.red_point[HeroConst.RedPointType.eRPStar] == true
	end

	if Config.PartnerData.data_partner_star(getNorKey(slot0.bid, (slot0.star or 1) + 1)) == nil then
		slot0.red_point[HeroConst.RedPointType.eRPStar] = false

		return false
	end

	slot4 = slot3
	slot5 = false

	if (slot1 ~= HeroController:getInstance():getModel().hero_info_upgrade_star_param2 or slot6:checkOpenStar11()) and (slot1 ~= slot6.hero_info_upgrade_star_param3 or slot6:checkOpenStar12()) and (slot1 ~= slot6.hero_info_upgrade_star_param4 or slot6:checkOpenStar13()) and true then
		if slot4 then
			if HeroCalculate.checkSingleStarFuseRedPointByStarConfig(slot4, true, slot0.partner_id) and next(slot4.other_expend) ~= nil then
				for slot10, slot11 in pairs(slot4.other_expend) do
					if BackpackController:getInstance():getModel():getItemNumByBid(slot11[1]) < slot11[2] then
						slot5 = false

						break
					end
				end
			end
		else
			slot5 = false
		end
	end

	slot0.red_point[HeroConst.RedPointType.eRPStar] = slot5

	return slot5
end

function HeroCalculate.checkSingleHeroTalentSkillRedPoint(slot0)
	if not slot0 then
		return false
	end

	if slot0.is_open_talent == true then
		return true
	end

	if slot0.red_point[HeroConst.RedPointType.eRPTalent] ~= nil then
		return slot0.red_point[HeroConst.RedPointType.eRPTalent] == true
	end

	if not slot0:ishaveTalentData() then
		return false
	end

	slot1 = false
	slot2 = HeroController:getInstance():getModel():getTalentRedpointRecord()
	slot3 = {
		[slot8] = slot7
	}

	for slot7, slot8 in pairs(slot0.talent_skill_list) do
		-- Nothing
	end

	for slot7, slot8 in pairs(Config.PartnerSkillData.data_partner_skill_pos) do
		if slot0.talent_skill_list[slot8.pos] then
			if HeroCalculate.checkSingleTalentSkillLevel(slot0.talent_skill_list[slot8.pos]) then
				break
			end
		else
			slot9 = false

			if slot8.pos_limit[1] == "star" then
				slot9 = slot8.pos_limit[2] <= slot0.star
			end

			if slot9 then
				for slot13, slot14 in pairs(slot2) do
					if slot3[slot13] == nil then
						slot1 = true

						break
					end
				end

				if slot1 then
					break
				end
			end
		end
	end

	slot0.red_point[HeroConst.RedPointType.eRPTalent] = slot1

	return slot1
end

function HeroCalculate.checkSingleTalentSkillLevel(slot0)
	if Config.PartnerSkillData.data_partner_skill_level[slot0] then
		slot2 = true

		for slot6, slot7 in ipairs(slot1.expend) do
			if BackpackController:getInstance():getModel():getItemNumByBid(slot7[1]) < slot7[2] then
				slot2 = false

				break
			end
		end

		return slot2
	end

	return false
end

function HeroCalculate.checkSingleHeroHolyEquipmentRedPoint(slot0)
	if not slot0 then
		return false
	end

	if not HeroController:getInstance():getModel():isOpenHolyEquipMentByHerovo(slot0) then
		return false
	end

	if HeroController:getInstance():getModel():getHeroHolyEquipList(slot0.partner_id) then
		for slot7, slot8 in ipairs(HeroConst.HolyequipmentPosList) do
			if slot2[slot8] == nil and HeroCalculate.checkHolyEquipmentByEquipType(slot8) then
				return true
			end
		end
	end

	return false
end

function HeroCalculate.checkHolyEquipmentByEquipType(slot0)
	if not BackpackController:getInstance():getModel():getAllEquipListByType(slot0 or 1) then
		return false
	end

	if next(slot3) ~= nil then
		return true
	end

	return false
end
