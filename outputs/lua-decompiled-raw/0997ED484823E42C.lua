HeroModel = HeroModel or BaseClass()
slot0 = table.insert
slot1 = string.format
slot2 = table.sort
slot3 = table.remove

function HeroModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function HeroModel.config(slot0)
	slot0.hero_list = {}
	slot0.hero_bid_list = {}
	slot0.hero_array = Array.New()
	slot0.dic_star_count = {}
	slot0.hero_skin_list = nil
	slot0.hero_skin_group = nil
	slot0.hero_max_count = 0
	slot0.buy_num = 0
	slot0.dic_pokedex_info = nil
	slot0.dic_pokedex_bid = {}
	slot0.dic_fuse_info = nil
	slot0.is_fuse_redpoint = false
	slot0.dic_fuse_redpoint = {}
	slot0.dic_had_hero_info = {}
	slot0.pos_param = 10
	slot0.pos_list = {}
	slot0.expedit_list = nil
	slot0.use_formation_type = 1
	slot0.use_hallows_id = 0
	slot0.is_equip_redpoint_bag_update = true
	slot0.is_equip_redpoint_hero_update = true
	slot0.is_delay_redpoint_update = {}
	slot0.upgrade_star_cost_id = 10001
	slot0.upgrade_star_cost_id_2 = 10090
	slot0.talent_skill_cost_id = 10450
	slot0.is_upgradestar_redpoint_bag_update = true
	slot0.is_upgradestar_redpoint_hero_update = true
	slot0.is_redpoint_form = false
	slot0.is_redpoint_hallows = false
	slot0.record_login_lev = 0
	slot0.artifact_lock_list = {
		Config.PartnerData.data_partner_const.artifact_one.val,
		Config.PartnerData.data_partner_const.artifact_two.val
	}
	slot0.artifact_lucky = 0
	slot0.artifact_lucky_red = false
	slot0.hero_info_upgrade_star_param = 6
	slot0.hero_info_upgrade_star_param2 = 10
	slot0.hero_info_upgrade_star_param3 = 11
	slot0.hero_info_upgrade_star_param4 = 12
	slot0.hero_info_talent_skill_param = Config.PartnerSkillData.data_partner_skill_const.skill_slot.val
	slot0.dic_hero_talent_skill_learn_redpoint = {}
	slot0.is_need_update_talent_redpoint = true
	slot0.hero_holy_list = {}
	slot0.dic_itemid_to_partner_id = {}
	slot0.resonate_cystal_lev = 0
	slot0.dic_resonate_lock_info = {}
	slot0.resonate_stone_level = 0
	slot0.resonate_max_partner_lev = nil
	slot0.is_resonate_extract_redpoint = false
	slot0.reset_count = 0
end

function HeroModel.resetAllData(slot0)
	slot0.hero_list = {}
	slot0.hero_bid_list = {}
	slot0.hero_array = Array.New()
	slot0.hero_skin_list = nil
	slot0.hero_holy_list = {}
	slot0.dic_itemid_to_partner_id = {}
	slot0.pos_list = {}
	slot0.is_delay_redpoint_update = {}
end

function HeroModel.updateHeroList(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	for slot8, slot9 in pairs(slot1) do
		if slot0:updateHeroVo(slot9, slot2, slot3) then
			slot4 = 0 + 1
		end
	end

	report_hero(slot4)
end

function HeroModel.updateHeroVo(slot0, slot1, slot2, slot3)
	if slot1 == nil then
		return
	end

	slot1.id = slot1.partner_id
	slot5 = false

	if not slot0.hero_list[slot1.id] then
		if slot3 then
			return
		end

		slot0.hero_list[slot4] = HeroVo.New()
		slot5 = true
	end

	slot6 = slot0.hero_list[slot4]

	if not slot3 and Config.PartnerData.data_partner_base[slot1.bid] then
		for slot12, slot13 in pairs(slot8) do
			if slot12 ~= "skills" then
				slot1[slot12] = slot13
			end
		end

		slot9 = slot1.star or slot8.init_star

		if slot0.dic_had_hero_info[slot7] then
			if slot0.dic_had_hero_info[slot7] < slot9 then
				slot0.dic_had_hero_info[slot7] = slot9
			end
		else
			slot0.dic_had_hero_info[slot7] = slot9
		end
	end

	if RoleController:getInstance():getRoleVo() ~= nil then
		slot1.rid = slot7.rid
		slot1.srv_id = slot7.srv_id
	end

	slot8 = nil
	slot9 = 0

	if not slot5 then
		if not slot2 and slot6.power < slot1.power then
			GlobalMessageMgr:getInstance():showPowerMove(slot1.power - slot6.power, nil, slot6.power)
		end

		if not slot3 then
			if slot1.star and slot6.star < slot1.star then
				slot9 = 1
				slot8 = clone(slot6)

				if slot6.star == slot0.hero_info_talent_skill_param[2] - 1 then
					slot6.is_open_talent = true
				end

				if slot1.star >= 10 then
					slot0.dic_star_count = {}
				end
			elseif slot1.break_lev and slot6.break_lev < slot1.break_lev and not slot0:isResonateCystalHero(slot1) then
				slot9 = 2
				slot8 = clone(slot6)
			end
		end
	end

	slot6:updateHeroVo(slot1)

	if slot5 then
		slot0.hero_array:PushBack(slot6)

		if not slot0.hero_bid_list[slot6.bid] then
			slot0.hero_bid_list[slot6.bid] = {}
		end

		uv0(slot0.hero_bid_list[slot6.bid], slot6)
	else
		if slot9 == 1 and slot8 and next(slot8) ~= nil then
			slot0.ctrl:openHeroUpgradeStarExhibitionPanel(true, slot8, slot6)
			HeroCalculate.clearAllHeroRecordByRedPointType(HeroConst.RedPointType.eRPStar)
		elseif slot9 == 2 and slot8 and next(slot8) ~= nil then
			slot0.ctrl:openBreakExhibitionWindow(true, slot8, slot6)
		end

		if slot3 then
			slot6:setInitAttr()
			GlobalEvent:getInstance():Fire(HeroEvent.Hero_Detail_Data_Update, slot6)
		else
			GlobalEvent:getInstance():Fire(HeroEvent.Hero_Data_Update, slot6)
		end
	end

	return slot5
end

function HeroModel.getTopLevHeroInfoByBid(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.hero_bid_list[slot1] then
		uv0(slot2, SortTools.tableUpperSorter({
			"lev",
			"power"
		}))

		return slot2[1]
	end

	return nil
end

function HeroModel.getHeroNumByBid(slot0, slot1)
	if not slot1 then
		return 0
	end

	return #(slot0.hero_bid_list[slot1] or {})
end

function HeroModel.getHeroInfoByBidStar(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if slot0.hero_bid_list[slot1] then
		slot4 = {}

		for slot8, slot9 in ipairs(slot3) do
			if slot9.star == slot2 then
				uv0(slot4, slot9)
			end
		end

		return slot4
	end

	return nil
end

function HeroModel.updateHeroVoDetailedInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.hero_list[slot1.partner_id] then
		for slot5, slot6 in pairs(slot1) do
			slot0.hero_list[slot1.partner_id][slot5] = slot6
		end

		slot0.hero_list[slot1.partner_id]:setIsHadDetail(true)
		GlobalEvent:getInstance():Fire(HeroEvent.Hero_Vo_Detailed_info, slot0.hero_list[slot1.partner_id])
	end
end

function HeroModel.clearHeroVoDetailedInfoByPartnerID(slot0, slot1)
	if slot0.hero_list and slot0.hero_list[slot1] then
		slot0.hero_list[slot1]:setIsHadDetail(false)
	end
end

function HeroModel.clearHeroVoDetailedInfo(slot0)
	if not slot0.hero_list then
		return
	end

	for slot4, slot5 in pairs(slot0.hero_list) do
		slot5:setIsHadDetail(false)
	end
end

function HeroModel.updateHeroVoTalent(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot1) do
		if slot0.hero_list[slot8.partner_id] then
			slot0.hero_list[slot8.partner_id]:updateSkill(slot8.dower_skill)
			slot0.hero_list[slot8.partner_id]:setIsHadDetail(false)

			if not false and slot0.hero_list[slot8.partner_id]:isFormDrama() then
				slot3 = true
			end
		end
	end

	if slot3 and not slot2 then
		HeroCalculate.checkAllHeroRedPoint()
	end
end

function HeroModel.checkTalentIsLearnByBid(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.hero_list) do
		if slot7:isFormDrama() and slot7:checkIsHaveTalentByBid(slot1) then
			slot2 = true

			break
		end
	end

	return slot2
end

function HeroModel.setLockByPartnerid(slot0, slot1, slot2)
	if slot0.hero_list[slot1] ~= nil then
		slot0.hero_list[slot1].is_lock = slot2 or 0
	end
end

function HeroModel.delHeroDataList(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = 0

	for slot6, slot7 in ipairs(slot1) do
		if slot0.hero_list[slot7.partner_id] then
			slot0.hero_list[slot7.partner_id] = nil

			if slot0.hero_bid_list[slot0.hero_list[slot7.partner_id].bid] then
				for slot13 = #slot9, 1, -1 do
					if slot9[slot13].partner_id == slot7.partner_id then
						uv0(slot9, slot13)
					end
				end
			end

			slot2 = slot2 + 1
		end
	end

	slot0.hero_array = Array.New()

	for slot6, slot7 in pairs(slot0.hero_list) do
		slot0.hero_array:PushBack(slot7)
	end

	report_hero(0 - slot2)
	slot0:checkHeroChangeRedPoint()
	GlobalEvent:getInstance():Fire(HeroEvent.Del_Hero_Event, slot1)
end

function HeroModel.checkHeroChangeRedPoint(slot0)
	HeroCalculate.clearAllStarFuseRedpointRecord()

	slot0.is_upgradestar_redpoint_hero_update = true

	slot0:checkUpgradeStarRedPointUpdate()
end

function HeroModel.getExpeditHeroData(slot0)
	for slot6, slot7 in ipairs(slot0:getAllHeroArray().items) do
		uv0({}, {
			power = slot7.power,
			name = slot7.name,
			bid = slot7.bid,
			index = slot6,
			rid = slot7.rid,
			srv_id = slot7.srv_id,
			id = slot7.id,
			star = slot7.star,
			lev = slot7.lev,
			use_skin = slot7.use_skin
		})
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1.power < slot0.power
	end)

	return slot1
end

function HeroModel.getAllHeroArray(slot0)
	return slot0.hero_array or Array.New()
end

function HeroModel.getMaxFight(slot0)
	if slot0.hero_array then
		slot0.hero_array:UpperSortByParams("power")

		if slot0.hero_array:Get(0) then
			return slot1.power
		end
	end

	return 0
end

function HeroModel.getHeroList(slot0)
	return slot0.hero_list or {}
end

function HeroModel.getHeroById(slot0, slot1)
	if not slot0.hero_list then
		return
	end

	if not slot1 or type(slot1) ~= "number" then
		return
	end

	return slot0.hero_list[slot1] or {}
end

function HeroModel.getHeroMaxBreakCountByInitStar(slot0, slot1)
	if slot0.dic_max_break == nil then
		slot0.dic_max_break = {}

		for slot6, slot7 in ipairs(Config.PartnerData.data_partner_const.advanced_limit.val) do
			slot0.dic_max_break[slot7[1]] = slot7[2]
		end
	end

	return slot0.dic_max_break[slot1] or 0
end

function HeroModel.getRandomHeroHeadByQuality(slot0, slot1)
	if slot0.dic_random_hero_head == nil then
		slot0.dic_random_hero_head = {}

		for slot6, slot7 in ipairs(Config.PartnerData.data_partner_const.random_hero_icon.val) do
			if Config.ItemData.data_get_data(slot7[2]) then
				slot0.dic_random_hero_head[slot7[1]] = slot8.icon
			end
		end
	end

	if (slot1 or 0) < 0 then
		slot2 = 0
	elseif slot2 > 5 then
		slot2 = 5
	end

	return slot0.dic_random_hero_head[slot2] or 1
end

function HeroModel.getSourceHeroCombinationByCampStar(slot0, slot1, slot2)
	if slot0.dic_source_item_ids == nil then
		slot0.dic_source_item_ids = {}

		for slot7, slot8 in ipairs(Config.PartnerData.data_partner_const.source_hero_combination.val) do
			if slot0.dic_source_item_ids[slot8[1]] == nill then
				slot0.dic_source_item_ids[slot8[1]] = {}
			end

			slot0.dic_source_item_ids[slot8[1]][slot8[2]] = slot8[3]
		end
	end

	if slot0.dic_source_item_ids[slot1] then
		if (slot2 or 0) == 0 then
			slot3 = 3
		end

		return slot0.dic_source_item_ids[slot1][slot3]
	end
end

function HeroModel.setHeroMaxCount(slot0, slot1)
	if slot1 then
		slot0.hero_max_count = slot1
	end
end

function HeroModel.getHeroMaxCount(slot0)
	return slot0.hero_max_count or 0, slot0:getAllHeroArray():GetSize()
end

function HeroModel.getHeroBuyNum(slot0)
	return slot0.buy_num or 0
end

function HeroModel.setHeroBuyNum(slot0, slot1)
	slot0.buy_num = slot1 or 0
end

function HeroModel.setHadHeroInfo(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		if slot0.dic_had_hero_info[slot6.partner_id] then
			if slot0.dic_had_hero_info[slot6.partner_id] < slot6.max_star then
				slot0.dic_had_hero_info[slot6.partner_id] = slot6.max_star
			end
		else
			slot0.dic_had_hero_info[slot6.partner_id] = slot6.max_star
		end
	end
end

function HeroModel.getHadHeroInfo(slot0)
	return slot0.dic_had_hero_info or {}
end

function HeroModel.getHadHeroStarBybid(slot0, slot1)
	if slot0.dic_had_hero_info and slot0.dic_had_hero_info[slot1] then
		return slot0.dic_had_hero_info[slot1]
	end

	return 0
end

function HeroModel.isOpenTanlentById(slot0, slot1)
	if slot0.hero_list[slot1] then
		return slot0:isOpenTanlentByHerovo(slot0.hero_list[slot1])
	end

	return false
end

function HeroModel.isOpenTanlentByHerovo(slot0, slot1)
	if slot1[slot0.hero_info_talent_skill_param[1]] and slot0.hero_info_talent_skill_param[2] <= slot1[slot0.hero_info_talent_skill_param[1]] then
		return true
	end

	return false
end

function HeroModel.checkOpenTanlentByconfig(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if slot1.pos_limit[1] == "star" then
		is_open = slot1.pos_limit[2] <= slot2.star

		if is_open then
			return is_open
		else
			return is_open, slot1.pos_limit[2] .. TI18N("星开启")
		end
	end
end

function HeroModel.isMaxStarHero(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return false
	end

	if Config.PartnerData.data_partner_max_star[slot1] and slot3 <= slot2 then
		return true
	end

	return false
end

function HeroModel.getHeroPokedexList(slot0)
	if slot0.dic_pokedex_info == nil then
		slot0.dic_pokedex_info = {
			[HeroConst.CampType.eWater] = {},
			[HeroConst.CampType.eFire] = {},
			[HeroConst.CampType.eWind] = {},
			[HeroConst.CampType.eLight] = {},
			[HeroConst.CampType.eDark] = {}
		}

		if Config.PartnerData.data_partner_pokedex then
			for slot4, slot5 in pairs(Config.PartnerData.data_partner_pokedex) do
				if Config.PartnerData.data_partner_base[slot4] then
					for slot10, slot11 in ipairs(slot5) do
						slot14 = slot0:getHeroPokedexByBid(getNorKey(slot4, slot11.star))

						if MAKELIFEBETTER == true then
							slot14.aaaaa = math.random(1, 1000)
						end

						if slot14 then
							if MAKELIFEBETTER == true then
								slot14.aaaaa = math.random(1, 1000)
							end

							table.insert(slot0.dic_pokedex_info[slot14.camp_type], slot14)
						end
					end
				end
			end

			slot1 = nil

			for slot5, slot6 in pairs(slot0.dic_pokedex_info) do
				table.sort(slot6, (MAKELIFEBETTER ~= true or SortTools.tableLowerSorter({
					"aaaaa"
				})) and SortTools.tableLowerSorter({
					"camp_type",
					"star",
					"bid"
				}))
			end
		end
	end

	return slot0.dic_pokedex_info
end

function HeroModel.getHeroPokedexByBid(slot0, slot1)
	if slot0.dic_pokedex_bid[slot1] then
		return slot0.dic_pokedex_bid[slot1]
	end

	if not Config.PartnerData.data_partner_show(slot1) then
		if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" then
			message(string.format("英雄图鉴没有[%s](bid_star)的数据", tostring(slot1)))
		end

		return nil
	end

	if Config.PartnerData.data_partner_base[slot2.bid] then
		slot2.hp_max = slot2.hp
		slot2.power = PartnerCalculate.calculatePower(slot2)
		slot2.camp_type = slot3.camp_type
		slot2.name = slot3.name
		slot2.init_star = slot3.init_star
		slot2.type = slot3.type
		slot2.break_id = slot3.break_id
		slot2.introduce_str = slot3.introduce_str
		slot2.break_lev = slot0:getHeroMaxBreakCountByInitStar(slot2.star)
		slot2.partner_id = slot2.bid * 10 + slot2.star
		slot2.is_pokedex = true
		slot0.dic_pokedex_bid[slot1] = slot2

		return slot0.dic_pokedex_bid[slot1]
	end

	return nil
end

function HeroModel.getIsFuseRedPoint(slot0)
	return slot0.is_fuse_redpoint or false
end

function HeroModel.setIsFuseRedPoint(slot0, slot1)
	slot0.is_fuse_redpoint = slot1 or false
end

function HeroModel.checkNewFuseRedPoint(slot0)
	if not slot0.dic_fuse_info then
		return false
	end

	slot1 = false

	for slot6, slot7 in ipairs(slot0.dic_fuse_info[0] or {}) do
		if slot7.cur_redpoint == 1 and slot0.dic_fuse_redpoint[slot7.bid] == nil then
			slot1 = true

			break
		end
	end

	return slot1
end

function HeroModel.recordFuseRedPointInfo(slot0)
	if not slot0.dic_fuse_info then
		return false
	end

	for slot5, slot6 in ipairs(slot0.dic_fuse_info[0] or {}) do
		if slot6.cur_redpoint == 1 then
			slot0.dic_fuse_redpoint[slot6.bid] = true
		end
	end
end

function HeroModel.getStarFuseList(slot0)
	if slot0.dic_fuse_info then
		return slot0.dic_fuse_info
	end

	slot0.dic_fuse_info = {
		[0] = {},
		[HeroConst.CampType.eWater] = {},
		[HeroConst.CampType.eFire] = {},
		[HeroConst.CampType.eWind] = {},
		[HeroConst.CampType.eLight] = {},
		[HeroConst.CampType.eDark] = {}
	}

	for slot4, slot5 in pairs(Config.PartnerData.data_partner_fuse_star) do
		if Config.PartnerData.data_partner_base[slot4] then
			for slot10, slot11 in ipairs(slot5) do
				if Config.PartnerData.data_partner_star(getNorKey(slot4, slot11.star)) and #slot14.expend1 > 0 then
					slot15 = {
						base_config = slot6,
						star_config = slot14,
						camp_type = slot6.camp_type,
						bid = slot4,
						star = slot12,
						aaaaa = math.random(1, 10000)
					}

					if MAKELIFEBETTER == true then
						-- Nothing
					end

					table.insert(slot0.dic_fuse_info[0], slot15)
					table.insert(slot0.dic_fuse_info[slot6.camp_type], slot15)
				end
			end
		end
	end

	for slot5, slot6 in pairs(slot0.dic_fuse_info) do
		table.sort(slot6, SortTools.tableLowerSorter({
			"star",
			"camp_type",
			"bid"
		}))
	end

	return slot0.dic_fuse_info
end

function HeroModel.getMockHeroVoByBid(slot0, slot1)
	slot3 = Config.PartnerData.data_partner_attr[slot1]

	if not Config.PartnerData.data_partner_base[slot1] or not slot3 then
		return
	end

	slot4 = DeepCopy(slot2)
	slot4.star = slot2.init_star
	slot4.break_lev = 0

	for slot8, slot9 in pairs(slot3) do
		if slot4[slot8] == nil then
			slot4[slot8] = slot9
		end
	end

	slot4.hp = slot3.hp_max
	slot4.power = PartnerCalculate.calculatePower(slot4)

	return slot4
end

function HeroModel.getHeroListByMatchInfo(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = slot3 or {}
	slot6 = {}

	for slot11, slot12 in pairs(slot0.hero_list) do
		if not slot12:isResonateHero() then
			if slot1 and slot1[slot12.bid] and slot1[slot12.bid][slot12.star] then
				function (slot0, slot1, slot2)
					if uv0[slot0] == nil then
						if uv1[slot1] == nil then
							uv1[slot1] = 0
						end

						if uv1[slot1] < slot2 then
							uv1[slot1] = uv1[slot1] + 1
							uv2 = uv2 + 1
							uv0[slot0] = 1
						end
					end
				end(slot12.partner_id, uv0("%s%s", slot12.bid, slot12.star), slot1[slot12.bid][slot12.star])
			end

			if slot2 then
				if slot2[slot12.camp_type] and slot2[slot12.camp_type][slot12.star] then
					slot7(slot12.partner_id, uv0("_%s%s", slot12.camp_type, slot12.star), slot2[slot12.camp_type][slot12.star])
				elseif slot2[0] and slot2[0][slot12.star] then
					slot7(slot12.partner_id, uv0("_%s%s", 0, slot12.star), slot2[0][slot12.star])
				end
			end
		end
	end

	for slot12, slot13 in pairs(BackpackController:getInstance():getModel():getHeroHunList()) do
		if slot13.config then
			slot15 = slot13.config.eqm_jie

			if slot2[slot13.config.camp_type] and slot2[slot14][slot15] then
				if slot6[uv0("_%s%s", slot14, slot15)] == nil then
					slot6[slot16] = 0
				end

				if slot6[slot16] < slot2[slot14][slot15] then
					if slot13.quantity < slot2[slot14][slot15] - slot6[slot16] then
						slot17 = slot13.quantity
					end

					slot4 = slot4 + slot17
					slot6[slot16] = slot6[slot16] + slot17
				end
			end
		end
	end

	return slot4
end

function HeroModel.updateHeroEquipList(slot0, slot1)
	if slot0.hero_list[slot1.partner_id or 0] then
		if slot0.hero_list[slot2].power < slot1.power then
			GlobalMessageMgr:getInstance():showPowerMove(slot1.power - slot3.power, nil, slot3.power)
		end

		slot0.hero_list[slot2]:updateHeroVo(slot1)
	end
end

function HeroModel.getHeroEquipList(slot0, slot1)
	if slot0.hero_list[slot1] then
		return slot0.hero_list[slot1].eqm_list or {}
	end

	return {}
end

function HeroModel.isOpenHolyEquipMentTabByHerovo(slot0, slot1, slot2)
	if not slot1 then
		return false
	end

	slot3 = ""
	slot5 = slot1.star or 1

	if Config.PartnerHolyEqmData.data_const.show_star_condition then
		if slot1.star < slot4.val then
			return false
		end

		slot3 = slot4.desc
	end

	slot7 = 0

	if RoleController:getInstance():getRoleVo() then
		slot7 = slot6.lev or 0
	end

	if Config.PartnerHolyEqmData.data_const.open_lev_second_condition and slot7 < slot8.val then
		if slot7 < Config.PartnerHolyEqmData.data_const.open_lev_condition.val then
			return false
		end

		slot10 = Config.PartnerHolyEqmData.data_const.open_worldlev_condition

		if RoleController:getInstance():getModel():getWorldLev() and slot10 and slot11 < slot10.val then
			return false
		end
	end

	return true, slot3
end

function HeroModel.isOpenHolyEquipMentOldByHerovo(slot0, slot1, slot2)
	if not slot1 then
		return false
	end

	slot3 = slot1.star or 1

	if slot1.star < 6 then
		return false
	end

	slot5 = 0

	if RoleController:getInstance():getRoleVo() then
		slot5 = slot4.lev or 0
	end

	if slot5 < 120 then
		if slot5 < 105 then
			return false
		end

		if RoleController:getInstance():getModel():getWorldLev() and slot6 < 110 then
			return false
		end
	end

	return true
end

function HeroModel.isOpenHolyEquipMentByHerovo(slot0, slot1, slot2)
	if not slot1 then
		return false
	end

	slot4 = slot1.star or 1

	if Config.PartnerHolyEqmData.data_const.open_star_condition and slot1.star < slot3.val then
		return false
	end

	slot6 = 0

	if RoleController:getInstance():getRoleVo() then
		slot6 = slot5.lev or 0
	end

	if Config.PartnerHolyEqmData.data_const.open_lev_second_condition and slot6 < slot7.val then
		if slot6 < Config.PartnerHolyEqmData.data_const.open_lev_condition.val then
			return false
		end

		slot9 = Config.PartnerHolyEqmData.data_const.open_worldlev_condition

		if RoleController:getInstance():getModel():getWorldLev() and slot9 and slot10 < slot9.val then
			return false
		end
	end

	return true
end

function HeroModel.updateHolyEquipmentInfo(slot0, slot1)
	if slot0.hero_list[slot1.partner_id or 0] then
		if slot0.hero_list[slot2].power < slot1.power then
			GlobalMessageMgr:getInstance():showPowerMove(slot1.power - slot3.power, nil, slot3.power)
		end

		if slot3.holy_eqm_list then
			for slot7, slot8 in pairs(slot3.holy_eqm_list) do
				slot0.hero_holy_list[slot8.id] = nil
				slot0.dic_itemid_to_partner_id[slot8.id] = nil
			end
		end

		slot3:updateHeroVo(slot1)

		if slot3.holy_eqm_list then
			for slot7, slot8 in pairs(slot3.holy_eqm_list) do
				slot0.hero_holy_list[slot8.id] = slot8
				slot0.dic_itemid_to_partner_id[slot8.id] = slot3.partner_id
			end
		end

		GlobalEvent:getInstance():Fire(HeroEvent.Holy_Equipment_Update_Event, slot3)
	end
end

function HeroModel.getHeroHolyEquipList(slot0, slot1)
	if slot0.hero_list[slot1] then
		return slot0.hero_list[slot1].holy_eqm_list or {}
	end

	return {}
end

function HeroModel.getAllHeroHolyEquipList(slot0)
	return slot0.hero_holy_list or {}
end

function HeroModel.getHolyEquipById(slot0, slot1)
	if slot0.hero_holy_list then
		return slot0.hero_holy_list[slot1]
	end
end

function HeroModel.updateHeroVoHolyEquipment(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot1) do
		if slot0.hero_list[slot8.partner_id] then
			slot0.hero_list[slot8.partner_id]:updateHolyEqmList(slot8.holy_eqm)

			if not false and slot0.hero_list[slot8.partner_id]:isFormDrama() then
				slot3 = true
			end
		end
	end

	slot0.hero_holy_list = {}

	for slot7, slot8 in pairs(slot0.hero_list) do
		if slot8.holy_eqm_list then
			for slot12, slot13 in pairs(slot8.holy_eqm_list) do
				slot0.hero_holy_list[slot13.id] = slot13
				slot0.dic_itemid_to_partner_id[slot13.id] = slot8.partner_id
			end
		end
	end
end

function HeroModel.getHolyEquipmentColorByItemIdAttrKey(slot0, slot1, slot2, slot3, slot4, slot5)
	if (slot4 or 1) == 2 then
		if (slot5 or 1) == 2 then
			return BackPackConst.getWhiteQualityColorC4B(slot0:getHolyEquipmentQualityByItemIdAttrKey(slot1, slot2, slot3))
		else
			return BackPackConst.getBlackQualityColorC4B(slot8)
		end
	elseif slot7 == 2 then
		return BackPackConst.getWhiteQualityColorStr(slot8)
	else
		return BackPackConst.getBlackQualityColorStr(slot8)
	end
end

function HeroModel.getHolyEquipmentQualityByItemIdAttrKey(slot0, slot1, slot2, slot3)
	slot4 = 0

	if Config.PartnerHolyEqmData.data_base_info(slot1) then
		slot7 = Config.PartnerHolyEqmData.data_attr_color_rule_fun(getNorKey(slot5.group_id, slot2))

		if slot3 > 0 and slot7 and slot7.color_list[1] then
			for slot12, slot13 in ipairs(slot7.color_list[1]) do
				if slot8[slot12 + 1] then
					if slot8[slot12] <= slot3 and slot3 < slot8[slot12 + 1] then
						slot4 = slot12 - 1
					end
				elseif slot8[slot12] <= slot3 then
					slot4 = slot12 - 1
				end
			end
		end
	end

	return slot4
end

function HeroModel.getHolyEquipmentMaxAttrByItemIdAttrKey(slot0, slot1, slot2)
	slot3 = 1

	if Config.PartnerHolyEqmData.data_base_info(slot1) and Config.PartnerHolyEqmData.data_attr_max_info[slot4.group_id] then
		for slot9, slot10 in ipairs(slot5.max_attr) do
			if slot10[1] and slot10[1] == slot2 then
				slot3 = slot10[2] or 1

				break
			end
		end
	end

	return slot3
end

function HeroModel.checkLevelRedPointUpdate(slot0)
	GlobalEvent:getInstance():Fire(HeroEvent.Level_RedPoint_Event)

	if slot0.is_delay_redpoint_update[HeroConst.RedPointType.eRPLevelUp] then
		return
	end

	slot0.is_delay_redpoint_update[HeroConst.RedPointType.eRPLevelUp] = true

	HeroCalculate.clearAllHeroRecordByRedPointType(HeroConst.RedPointType.eRPLevelUp, true)
end

function HeroModel.setEquipUpdateRecord(slot0, slot1)
	slot0.is_equip_redpoint_bag_update = slot1
	slot0.is_equip_redpoint_hero_update = slot1
end

function HeroModel.checkEquipRedPointUpdate(slot0)
	if slot0.is_equip_redpoint_bag_update and slot0.is_equip_redpoint_hero_update then
		HeroCalculate.clearAllHeroRecordByRedPointType(HeroConst.RedPointType.eRPEquip)
		GlobalEvent:getInstance():Fire(HeroEvent.Equip_RedPoint_Event)
	end
end

function HeroModel.setUpgradeStarUpdateRecord(slot0, slot1)
	slot0.is_upgradestar_redpoint_bag_update = slot1
	slot0.is_upgradestar_redpoint_hero_update = slot1
end

function HeroModel.checkUpgradeStarRedPointUpdate(slot0)
	if slot0.is_upgradestar_redpoint_bag_update and slot0.is_upgradestar_redpoint_hero_update then
		HeroCalculate.clearAllHeroRecordByRedPointType(HeroConst.RedPointType.eRPStar)
	end
end

function HeroModel.checkTalentRedPointUpdate(slot0)
	if slot0.is_delay_redpoint_update[HeroConst.RedPointType.eRPTalent] then
		return
	end

	slot0.is_delay_redpoint_update[HeroConst.RedPointType.eRPTalent] = true

	HeroCalculate.clearAllHeroRecordByRedPointType(HeroConst.RedPointType.eRPTalent, true)
end

function HeroModel.checkUnlockFormRedPoint(slot0, slot1)
	if Config.FormationData.data_form_data then
		for slot6, slot7 in pairs(slot2) do
			if slot0.record_login_lev < slot7.need_lev and slot7.need_lev <= slot1 then
				slot0.is_redpoint_form = true

				GlobalEvent:getInstance():Fire(HeroEvent.Form_RedPoint_Event)
			end
		end
	end

	slot0.record_login_lev = slot1
end

function HeroModel.checkUnlockHallowsRedPoint(slot0)
	slot0.is_redpoint_hallows = true
end

function HeroModel.updatePartnerArtifactList(slot0, slot1)
	if slot0.hero_list[slot1.partner_id or 0] then
		if slot0.hero_list[slot2].power < slot1.power then
			GlobalMessageMgr:getInstance():showPowerMove(slot1.power - slot3.power, nil, slot3.power)
		end

		slot0.hero_list[slot2]:updateHeroVo(slot1)
		GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Update_Event, slot3)
		slot3:updateRedPoint(PartnerConst.Vo_Red_Type.Artifact, PartnerCalculate.getIsCanClothArtifact(slot3.bid))
	end
end

function HeroModel.getPartnerArtifactList(slot0, slot1)
	if slot0.hero_list[slot1] then
		return slot0.hero_list[slot1].artifact_list or {}
	end

	return {}
end

function HeroModel.getArtifactByType(slot0, slot1, slot2)
	if slot0.hero_list[slot1] then
		for slot7, slot8 in pairs(slot0.hero_list[slot1].artifact_list or {}) do
			if slot8 and slot8.pos == slot2 then
				return slot8
			end
		end
	end

	return {}
end

function HeroModel.setArtifactLucky(slot0, slot1)
	slot0.artifact_lucky = slot1

	slot0:updateArtifactLuckyRed()
end

function HeroModel.getArtifactLucky(slot0)
	return slot0.artifact_lucky
end

function HeroModel.updateArtifactLuckyRed(slot0)
	slot1 = 0

	if Config.PartnerArtifactData.data_artifact_const.change_condition and slot2.val then
		slot1 = slot2.val
	end

	if slot1 <= slot0.artifact_lucky then
		slot0.artifact_lucky_red = true
	else
		slot0.artifact_lucky_red = false
	end

	GlobalEvent:getInstance():Fire(HeroEvent.Artifact_Lucky_Red_Event)
	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.mall, slot0.artifact_lucky_red)
end

slot4 = Config.PartnerArtifactData.data_artifact_const.recast_tag

function HeroModel.checkIsUnusualSkillById(slot0, slot1)
	slot2 = false

	if uv0 then
		for slot6, slot7 in pairs(uv0.val) do
			if slot1 == slot7 then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

slot5 = Config.PartnerArtifactData.data_artifact_const.recast_power_tag

function HeroModel.checkIsUnusualSkillById2(slot0, slot1)
	slot2 = false

	if uv0 then
		for slot6, slot7 in pairs(uv0.val) do
			if slot1 == slot7 then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

function HeroModel.getArtifactLuckyRedStatus(slot0)
	return slot0.artifact_lucky_red
end

function HeroModel.updateArtifactRecastCount(slot0, slot1)
	slot0.artifact_recast_data = slot1 or {}
end

function HeroModel.getArtifactRecastCountByQuality(slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = 0

	if slot1 == BackPackConst.quality.orange then
		slot4 = 1
	elseif slot1 == BackPackConst.quality.red then
		slot4 = 2
	end

	if slot0.artifact_recast_data and slot4 > 0 then
		for slot8, slot9 in pairs(slot0.artifact_recast_data) do
			if slot9.type == slot4 then
				slot2 = slot9.current
				slot3 = slot9.limit

				break
			end
		end
	end

	return slot2, slot3
end

function HeroModel.setFormList(slot0, slot1, slot2)
	slot4 = slot2 or 1

	if slot0.pos_list[slot1.type or PartnerConst.Fun_Form.Drama] then
		if next(slot0.pos_list[slot3]) ~= nil then
			for slot8, slot9 in pairs(slot0.pos_list[slot3]) do
				if math.floor(slot8 / slot0.pos_param) + 1 == slot4 and slot0:getHeroById(slot9.id) and slot11.updateFormPos then
					slot11:updateFormPos(0, slot3)

					slot0.pos_list[slot3][slot8] = nil
				end
			end
		end
	else
		slot0.pos_list[slot3] = {}
	end

	for slot8, slot9 in pairs(slot1.pos_info) do
		slot0.pos_list[slot3][slot9.pos + (slot4 - 1) * slot0.pos_param] = slot9

		if slot0:getHeroById(slot9.id) and slot11.updateFormPos then
			slot11:updateFormPos(slot10, slot3)
		end
	end

	if slot3 == PartnerConst.Fun_Form.Drama then
		slot0.form_power = slot1.power or 0
		slot0.use_formation_type = slot1.formation_type
		slot0.use_hallows_id = slot1.hallows_id

		GlobalEvent:getInstance():Fire(HeroEvent.Form_Drama_Event, slot1)

		slot5 = {}

		for slot9, slot10 in pairs(slot0.pos_list[slot3]) do
			uv0(slot5, {
				partner_id = slot10.id
			})
		end

		HeroController:getInstance():sender11099(slot5)
	end
end

function HeroModel.sendAllHeroInfo(slot0)
	if slot0.hero_list then
		slot1 = {}

		for slot5, slot6 in pairs(slot0.hero_list) do
			uv0(slot1, {
				partner_id = slot6.id
			})
		end

		if #slot1 > 0 then
			HeroController:getInstance():sender11026(slot1)
		end
	end
end

function HeroModel.batchSendHeroInfo(slot0)
	if slot0.hero_list then
		slot1 = {}

		for slot5, slot6 in pairs(slot0.hero_list) do
			uv0(slot1, {
				partner_id = slot6.id
			})

			if #slot1 > 150 then
				HeroController:getInstance():sender11026(slot1)

				slot1 = {}
			end
		end

		if #slot1 > 0 then
			HeroController:getInstance():sender11026(slot1)
		end
	end
end

function HeroModel.sendAllHeroHolyEquipInfo(slot0)
	if slot0.hero_list then
		slot1 = {}

		for slot5, slot6 in pairs(slot0.hero_list) do
			if not slot6:ishaveHolyEquipmentData() then
				uv0(slot1, {
					partner_id = slot6.id
				})
			end
		end

		if #slot1 > 0 then
			HeroController:getInstance():sender11092(slot1)
		end
	end
end

function HeroModel.getMyPosList(slot0, slot1)
	if not slot0.pos_list[PartnerConst.Fun_Form.Drama] then
		return {}
	end

	if slot1 == nil then
		for slot7, slot8 in pairs(slot0.pos_list[PartnerConst.Fun_Form.Drama] or {}) do
			if slot0.hero_list[slot8.id] then
				-- Nothing
			end
		end

		return {
			[slot7] = slot8
		}
	end

	slot2 = {}
	slot6 = PartnerConst.Fun_Form.Drama

	for slot6, slot7 in pairs(slot0.pos_list[slot6]) do
		if math.floor(slot6 / slot0.pos_param) + 1 == slot1 and slot0.hero_list[slot7.id] then
			uv0(slot2, slot7)
		end
	end

	return slot2
end

function HeroModel.setUpdateTalentRedpoint(slot0)
	slot0.is_need_update_talent_redpoint = true
end

function HeroModel.getTalentRedpointRecord(slot0)
	if slot0.is_need_update_talent_redpoint and Config.PartnerSkillData.data_partner_skill_learn then
		slot2 = nil

		for slot6, slot7 in pairs(slot1) do
			slot0.dic_hero_talent_skill_learn_redpoint[slot7.id] = nil
			slot2 = true

			for slot11, slot12 in ipairs(slot7.expend) do
				if BackpackController:getInstance():getModel():getItemNumByBid(slot12[1]) < slot12[2] then
					slot2 = false

					break
				end
			end

			if slot2 then
				slot0.dic_hero_talent_skill_learn_redpoint[slot7.id] = slot7.id
			end
		end
	end

	slot0.is_need_update_talent_redpoint = false

	return slot0.dic_hero_talent_skill_learn_redpoint
end

function HeroModel.createStar(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot1 or 0

	if (slot3 or {}).star_list == nil then
		slot6.star_list = {}
	end

	if slot6.star_list2 == nil then
		slot6.star_list2 = {}
	end

	for slot10, slot11 in pairs(slot6.star_list) do
		slot11:setVisible(false)
	end

	for slot10, slot11 in pairs(slot6.star_list2) do
		slot11:setVisible(false)
	end

	if slot6.star10 then
		slot6.star10:setVisible(false)
	end

	if slot5 > 0 and slot5 <= 5 then
		function (slot0, slot1, slot2)
			slot3 = uv0 or 32
			slot4 = -slot0 * slot3 * 0.5 + slot3 * 0.5

			for slot8 = 1, slot0 do
				if not slot2[slot8] then
					slot9 = createImage(uv1, slot1, 0, 0, cc.p(0.5, 0.5), true, 0, false)

					slot9:setScale(1)

					slot2[slot8] = slot9
				end

				slot2[slot8]:setVisible(true)
				slot2[slot8]:setPositionX(slot4 + (slot8 - 1) * slot3)
			end
		end(slot5, PathTool.getResFrame("common", "common_90074"), slot6.star_list)
	elseif slot5 >= 6 and slot5 <= 9 then
		slot7(slot5 - 5, PathTool.getResFrame("common", "common_90075"), slot6.star_list2)
	elseif slot5 >= 10 then
		slot8 = slot5 - 10

		if slot6.star10 == nil then
			slot10 = createImage(slot2, PathTool.getResFrame("common", "common_90073"), 0, 0, cc.p(0.5, 0.5), true, 0, false)

			slot10:setScale(1.2)
			slot10:setCascadeOpacityEnabled(true)

			slot6.star10 = slot10
		else
			slot6.star10:setVisible(true)
		end

		if slot8 > 0 then
			if slot6.star_label == nil then
				slot10 = slot6.star10:getContentSize()
				slot6.star_label = createLabel(12, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot10.width * 0.5 - 2, slot10.height * 0.5, "10", slot6.star10, 1, cc.p(0.5, 0.5))
			else
				slot6.star_label:setVisible(true)
			end

			slot6.star_label:setString(slot8)
		elseif slot6.star_label then
			slot6.star_label:setVisible(false)
		end
	end

	return slot6
end

function HeroModel.getTipsStr(slot0, slot1)
	slot2 = nil

	return (slot1 ~= 11 or TI18N("满足以下任意条件开启：\n1. 个人等级达到110级或世界等级达到100级 \n2. 拥有5个不同的10星英雄 并且个人等级达到100级")) and (slot1 ~= 12 or TI18N("满足以下任意条件开启：\n1. 个人等级达到150级或世界等级达到140级 \n2. 拥有5个不同的11星英雄 并且个人等级达到120级")) and (slot1 ~= 13 or TI18N([[
满足以下任意条件开启：
1. 拥有2个不同的12星英雄 并且个人和世界等级达到170级 
2. 拥有2个不同的12星英雄 并且个人等级到达180级 
3. 拥有5个不同的12星英雄 并且个人等级达到150级]])) and ""
end

function HeroModel.checkOpenStar11(slot0, slot1)
	slot3 = true

	if Config.PartnerData.data_partner_const.staropen11_world_lev and slot2.val[1] == "world_lev" and (RoleController:getInstance():getModel():getWorldLev() or 0) < slot2.val[2] then
		slot3 = false
	end

	if not slot3 then
		slot3 = true

		if Config.PartnerData.data_partner_const.staropen11_player_lev and slot4.val[1] == "lev" and RoleController:getInstance():getRoleVo() and slot5.lev < slot4.val[2] then
			slot3 = false
		end
	end

	slot3 = slot3 or slot0:checkExtOpenInfo(Config.PartnerData.data_partner_const.staropen11_3rd_open_limit) or false
	slot6 = nil

	if slot1 and not slot3 then
		slot6 = slot0:getTipsStr(11)
	end

	return slot3, slot6
end

function HeroModel.checkOpenStar12(slot0, slot1)
	slot3 = true

	if Config.PartnerData.data_partner_const.staropen12_world_lev and slot2.val[1] == "world_lev" and (RoleController:getInstance():getModel():getWorldLev() or 0) < slot2.val[2] then
		slot3 = false
	end

	if not slot3 then
		slot3 = true

		if Config.PartnerData.data_partner_const.staropen12_player_lev and slot4.val[1] == "lev" and RoleController:getInstance():getRoleVo() and slot5.lev < slot4.val[2] then
			slot3 = false
		end
	end

	slot3 = slot3 or slot0:checkExtOpenInfo(Config.PartnerData.data_partner_const.staropen12_3rd_open_limit) or false
	slot6 = nil

	if slot1 and not slot3 then
		slot6 = slot0:getTipsStr(12)
	end

	return slot3, slot6
end

function HeroModel.checkOpenStar13(slot0, slot1)
	if slot0.is_star13_open then
		return true
	end

	slot3 = true

	if Config.PartnerData.data_partner_const.staropen13_limit_lev2 and slot0:checkOpenByKeyValue(slot2.val[1], slot2.val[2]) then
		slot3 = false
	end

	if not slot3 then
		slot3 = true

		if Config.PartnerData.data_partner_const.staropen13_limit_lev1 then
			for slot8, slot9 in ipairs(slot4.val) do
				if slot0:checkOpenByKeyValue(slot9[1], slot9[2]) then
					slot3 = false

					break
				end
			end
		end
	end

	slot4 = slot3
	slot5 = false
	slot6 = false

	if Config.PartnerData.data_partner_const.staropen13_limit_partner and next(slot7.val) then
		slot8 = 0

		for slot12, slot13 in pairs(slot0.dic_had_hero_info) do
			if slot7.val[1] <= slot13 and slot7.val[2] <= slot8 + 1 then
				break
			end
		end

		if slot8 < slot7.val[2] then
			slot3 = false
			slot5 = false
		else
			slot5 = true
		end
	end

	slot5 = slot3
	slot3 = slot3 or slot0:checkExtOpenInfo(Config.PartnerData.data_partner_const.staropen13_3rd_open_limit)
	slot9 = nil

	if slot1 and not slot3 then
		slot9 = slot0:getTipsStr(13)
	end

	if slot3 then
		slot0.is_star13_open = true
	end

	return slot3, slot9
end

function HeroModel.checkExtOpenInfo(slot0, slot1)
	if slot1.val == nil or next(slot2) == nil then
		return false
	end

	if slot0:checkOpenByKeyValue(slot2[1][1], slot2[1][2]) then
		return false
	end

	if slot2[2] == nil then
		return false
	end

	slot4 = slot2[2][3] or 5

	if slot0.dic_star_count[slot2[2][2] or 10] == nil then
		slot0.dic_star_count[slot3] = 0

		for slot8, slot9 in pairs(slot0.dic_had_hero_info) do
			if slot3 <= slot9 then
				slot0.dic_star_count[slot3] = slot0.dic_star_count[slot3] + 1

				if slot4 <= slot0.dic_star_count[slot3] then
					break
				end
			end
		end

		if slot4 <= slot0.dic_star_count[slot3] then
			return true
		end
	elseif slot4 <= slot0.dic_star_count[slot3] then
		return true
	end

	return false
end

function HeroModel.checkOpenByKeyValue(slot0, slot1, slot2)
	if not slot2 then
		return false
	end

	if slot1 == "world_lev" then
		return slot2 > (RoleController:getInstance():getModel():getWorldLev() or 0)
	elseif slot1 == "lev" and RoleController:getInstance():getRoleVo() and slot3.lev < slot2 then
		return true
	end

	return false
end

function HeroModel.getHolyEquipSuitDes(slot0, slot1)
	if not slot1 then
		return {}
	end

	slot2 = {}
	slot3 = {
		[slot10] = {
			slot9.config.eqm_set
		}
	}

	for slot8, slot9 in pairs(slot1) do
		if slot9.config then
			if slot2[math.floor(slot9.config.eqm_set / 100)] == nil then
				slot2[slot10] = 1
			else
				slot2[slot10] = slot2[slot10] + 1

				uv0(slot3[slot10], slot9.config.eqm_set)
			end
		end
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot2) do
		slot11 = slot3[slot9]

		if slot10 > 1 then
			table.sort(slot11, function (slot0, slot1)
				return slot1 < slot0
			end)

			for slot17, slot18 in ipairs(slot11) do
				if nil == nil then
					slot12 = slot18

					uv1(Config.PartnerHolyEqmData.data_suit_info[slot18], function (slot0, slot1)
						return slot0.num < slot1.num
					end)
				else
					if slot12 ~= slot18 then
						uv1(Config.PartnerHolyEqmData.data_suit_info[slot18], function (slot0, slot1)
							return slot0.num < slot1.num
						end)
					end

					for slot22, slot23 in ipairs(slot13) do
						if slot23.num == slot17 then
							uv0(slot5, slot23)

							break
						end
					end
				end
			end
		end
	end

	slot6 = {}

	for slot10, slot11 in ipairs(slot5) do
		if Config.PartnerHolyEqmData.data_suit_res_prefix_fun(slot4(slot11.id / 100)) then
			uv0(slot6, {
				num = slot11.num,
				icon_res = PathTool.getSuitRes(slot14.prefix),
				name = uv2("%s(%s件套)", slot11.name, slot11.num),
				id = slot12
			})
		end
	end

	uv1(slot6, SortTools.tableLowerSorter({
		"id",
		"num"
	}))

	return slot6
end

function HeroModel.initHeroSkin(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.hero_skin_list then
		slot2 = nil

		for slot6, slot7 in ipairs(slot1.partner_skins) do
			if slot0.hero_skin_list[slot7.id] == nil then
				slot2 = slot7.id

				break
			end
		end

		if slot2 and not slot0.hero_skin_group and Config.PartnerSkinData.data_skin_info[slot2] then
			PartnersummonController:getInstance():openSummonGainShowWindow(true, {
				partner_bid = slot3.bid,
				is_chips = 1,
				init_star = 5,
				status = 1,
				show_type = PartnersummonConst.Gain_Show_Type.Skin_show,
				skin_id = slot2
			}, 2)
		end
	end

	slot0.hero_skin_list = {}
	slot0.hero_skin_group = {}

	for slot5, slot6 in ipairs(slot1.partner_skins) do
		slot0.hero_skin_list[slot6.id] = slot6.end_time

		if Config.PartnerSkinData.data_skin_info[slot6.id] then
			if not slot0.hero_skin_group[slot7.series_id] then
				slot0.hero_skin_group[slot7.series_id] = {}
			end

			table.insert(slot0.hero_skin_group[slot7.series_id], slot6.id)
		end
	end

	for slot5, slot6 in pairs(slot0.hero_skin_group) do
		uv0(slot6, function (slot0, slot1)
			return slot0 < slot1
		end)
	end
end

function HeroModel.getHeroSkinInfoBySkinID(slot0, slot1)
	if slot0.hero_skin_list and slot0.hero_skin_list[slot1] then
		return slot0.hero_skin_list[slot1]
	end
end

function HeroModel.getHeroSkinIdBySeriesId(slot0, slot1)
	if slot0.hero_skin_group and slot0.hero_skin_group[slot1] then
		slot2 = slot0.hero_skin_group[slot1]

		return slot2[#slot2]
	end
end

function HeroModel.isUnlockHeroSkin(slot0, slot1, slot2)
	if slot0.hero_skin_list and slot0.hero_skin_list[slot1] then
		if slot2 and slot0.hero_skin_list[slot1] > 0 then
			return false
		end

		return true
	end

	return false
end

function HeroModel.clearHeroSkinTimeTicket(slot0)
	if slot0.hero_skin_time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.hero_skin_time_ticket)

		slot0.hero_skin_time_ticket = nil
	end
end

function HeroModel.setExpeditPosList(slot0, slot1)
end

function HeroModel.getExpeditPosList(slot0)
	return slot0.expedit_list or {}
end

function HeroModel.updateHolyEquipmentPlan(slot0, slot1)
	if slot1.num then
		slot0.holy_equip_plan_count = slot1.num
	end

	if slot0.holy_equip_plan == nil then
		slot0.holy_equip_plan = {}
	end

	if slot1.holy_eqm_set_cell then
		for slot5, slot6 in ipairs(slot1.holy_eqm_set_cell) do
			if slot0.holy_equip_plan[slot6.id] then
				for slot10, slot11 in pairs(slot6) do
					slot0.holy_equip_plan[slot6.id][slot10] = slot11
				end
			else
				slot0.holy_equip_plan[slot6.id] = slot6
			end
		end
	end
end

function HeroModel.getHolyEquipmentPlanData(slot0)
	return slot0.holy_equip_plan
end

function HeroModel.checkHolyEquipmentPalnByItemID(slot0, slot1)
	if not slot1 then
		return false
	end

	if not slot0.holy_equip_plan then
		return false
	end

	for slot5, slot6 in pairs(slot0.holy_equip_plan) do
		for slot10, slot11 in ipairs(slot6.list) do
			if slot1 == slot11.item_id then
				return true, slot6
			end
		end
	end

	return false
end

function HeroModel.getCystalPreLevLimit(slot0)
	if slot0.cystal_pre_lev_limit == nil then
		slot0.cystal_pre_lev_limit = 340

		if Config.ResonateData.data_const.cystal_pre_lev_limit then
			slot0.cystal_pre_lev_limit = slot1.val
		end
	end

	return slot0.cystal_pre_lev_limit or 340
end

function HeroModel.isResonateCystalMaxLev(slot0)
	if slot0.resonate_cystal_lev and slot0:getCystalPreLevLimit() <= slot0.resonate_cystal_lev then
		return true
	end

	return false
end

function HeroModel.isCanShowLabelMaxLev(slot0, slot1)
	if slot1 and slot1 < slot0:getCystalPreLevLimit() then
		return false
	end

	return true
end

function HeroModel.getDicResonateFiveHeroVo(slot0)
	return slot0.dic_resonate_five_hero_vo or {}
end

function HeroModel.isResonateCystalHero(slot0, slot1)
	if slot1.isResonateCrystalHero then
		if slot1:isResonateCrystalHero() then
			return true
		end
	elseif slot1.resonate_lev and slot1.resonate_lev > 0 then
		return true
	end

	return false
end

function HeroModel.updateResonateCystalInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.resonate_cystal_lev = slot1.lev
	slot0.dic_resonate_five_hero_vo = {}
	slot2 = 0

	for slot6, slot7 in ipairs(slot1.con_list) do
		if slot7.id ~= 0 then
			if slot0:getHeroById(slot7.id) and next(slot8) ~= nil then
				slot0.dic_resonate_five_hero_vo[slot8.id] = slot8
			end

			if slot8.star then
				slot2 = slot2 + slot8.star
			end
		end
	end

	for slot6, slot7 in pairs(slot0.dic_resonate_lock_info) do
		if slot7.updateLock then
			slot7:updateLock({
				{
					is_lock = 0,
					lock_type = HeroConst.LockType.eHeroResonateLock
				}
			})
		end
	end

	slot0.dic_resonate_lock_info = {}

	for slot6, slot7 in ipairs(slot1.res_list) do
		if slot7.id ~= 0 and slot0:getHeroById(slot7.id) and slot8.updateLock then
			slot0.dic_resonate_lock_info[slot7.id] = slot8

			slot8:updateLock({
				{
					is_lock = 1,
					lock_type = HeroConst.LockType.eHeroResonateLock
				}
			})
		end
	end

	if slot0.resonate_max_partner_lev == nil then
		slot0.resonate_max_partner_lev = slot2
	end
end

function HeroModel.updateResonateLockInfo(slot0, slot1)
	slot0.resonate_stone_level = slot1.lev or 0
	slot0.resonate_max_partner_lev = slot1.max_partner_lev or 0

	slot0:checkResonateRedPoint()
end

function HeroModel.checkResonateRedPoint(slot0)
	if not slot0.resonate_stone_level then
		return
	end

	if not slot0.resonate_max_partner_lev then
		return
	end

	slot1 = 50

	if Config.ResonateData.data_const.amp_all_start_limit then
		slot1 = slot2.val
	end

	if slot0.resonate_max_partner_lev < slot1 then
		return
	end

	slot4 = false

	if Config.ResonateData.data_level_up(slot0.resonate_stone_level) and slot3.expend and next(slot3.expend) ~= nil then
		slot4 = true

		for slot8, slot9 in ipairs(slot3.expend) do
			if slot9[2] and BackpackController:getInstance():getModel():getItemNumByBid(slot9[1]) < slot11 then
				slot4 = false
			end
		end
	end

	slot0.is_resonate_stone_redpoint = slot4

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.resonate, {
		{
			bid = HeroConst.RedPointType.eResonate_stone,
			status = slot0.is_resonate_stone_redpoint
		}
	})
end

function HeroModel.isResonateMaxLevel(slot0, slot1)
	if slot1 and Config.ResonateData.data_level_up(slot1 + 1) == nil then
		return true
	end

	return false
end

function HeroModel.checkResonateIsOpen(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if Config.ResonateData.data_const.open_lev and slot2 and slot3.val <= slot2.lev then
		return true
	end

	if not slot1 and slot3 then
		message(slot3.desc)
	end

	return false
end

function HeroModel.checkResonateExtractRedpoint(slot0, slot1)
	if not slot0:checkResonateIsOpen(true) then
		return
	end

	slot0.is_resonate_extract_redpoint = false

	if not slot0.resonate_max_partner_lev then
		return
	end

	slot2 = 50

	if Config.ResonateData.data_const.amp_all_start_limit then
		slot2 = slot3.val
	end

	if slot0.resonate_max_partner_lev < slot2 then
		return
	end

	if slot1.all_num ~= 0 then
		if slot1.all_num <= slot1.do_num + slot1.get_num then
			slot0.is_resonate_extract_redpoint = true
		end
	else
		slot0.is_resonate_extract_redpoint = slot1.is_point == 1

		if slot0.is_resonate_extract_redpoint and not slot0:isResonateMaxLevel(slot0.resonate_stone_level) and Config.ResonateData.data_const.single_refine_consume and next(slot4.val) ~= nil and BackpackController:getInstance():getModel():getItemNumByBid(slot4.val[1][1], BackPackConst.Bag_Code.BACKPACK) < slot4.val[1][2] then
			slot0.is_resonate_extract_redpoint = false
		end
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.resonate, {
		{
			bid = HeroConst.RedPointType.eResonate_extract,
			status = slot0.is_resonate_extract_redpoint
		}
	})
	GlobalEvent:getInstance():Fire(HeroEvent.Hero_Resonate_Extract_Redpoint_Event, slot0.is_resonate_extract_redpoint)
end

function HeroModel.isResonateExtractRedpoint(slot0)
	return slot0.is_resonate_extract_redpoint == true
end

function HeroModel.setResetCount(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.reset_count = slot1.day_num

	if slot0:getHeroById(slot1.partner_id) and next(slot2) ~= nil then
		slot2:initResetTime(slot1.end_time)
	end
end

function HeroModel.getResetCount(slot0)
	return slot0.reset_count
end

function HeroModel.removeResetTimeInfo(slot0)
	for slot4, slot5 in pairs(slot0.hero_list) do
		slot5.reset_time = nil
	end
end

function HeroModel.isGuildPvpFrom(slot0, slot1)
	if slot0.dic_guild_from_type == nil then
		slot0.dic_guild_from_type = {}

		if Config.CombatTypeData.data_fight_list then
			for slot6, slot7 in pairs(slot2) do
				if slot7.is_guild_pvp == 1 and next(slot7.from) ~= nil then
					for slot11, slot12 in pairs(slot7.from[1]) do
						slot0.dic_guild_from_type[slot12] = true
					end
				end
			end
		end
	end

	return slot0.dic_guild_from_type[slot1]
end

function HeroModel.__delete(slot0)
end
