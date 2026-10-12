HeroVo = HeroVo or BaseClass(EventDispatcher)
HeroVo.UPDATE_Partner_ATTR = "heroVo_update_attr11"
slot0 = table.insert

function HeroVo.__init(slot0)
	slot0.partner_id = 0
	slot0.id = 0
	slot0.bid = 0
	slot0.camp_type = 0
	slot0.rare_type = 0
	slot0.name = ""
	slot0.type = 0
	slot0.face_id = 0
	slot0.lev = 0
	slot0.exp = 0
	slot0.break_lev = 0
	slot0.max_exp = 0
	slot0.star_step = 0
	slot0.star = 0
	slot0.quality = 0
	slot0.looks = {}
	slot0.body_res = ""
	slot0.res_id = ""
	slot0.power = 0
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.recruit_type = 1
	slot0.chips_id = 0
	slot0.chips_num = 0
	slot0.clothes_id = 0
	slot0.other_form = 0
	slot0.fetter = {}
	slot0.fetter_power = 0
	slot0.fetter_atk = 0
	slot0.fetter_hp = 0
	slot0.fetter_speed = 0
	slot0.fetter_def = 0
	slot0.atk = 0
	slot0.def_p = 0
	slot0.def_s = 0
	slot0.hp = 0
	slot0.speed = 0
	slot0.def = 0
	slot0.hit_rate = 0
	slot0.dodge_rate = 0
	slot0.crit_rate = 0
	slot0.crit_ratio = 0
	slot0.hit_magic = 0
	slot0.dodge_magic = 0
	slot0.resonate_lev = 0
	slot0.group_attr = {}
	slot0.skills = {}
	slot0.break_skills = {}
	slot0.eqm_list = {}
	slot0.holy_eqm_list = nil
	slot0.artifact_list = {}
	slot0.awaken_count = 0
	slot0.awaken_skills = {}
	slot0.form_param = 100
	slot0.is_in_form = 0
	slot0.dic_in_form = {}
	slot0.sort_order = 0
	slot0.show_order = 0
	slot0.order = 0
	slot0.is_lock = 0
	slot0.dic_locks = {}
	slot0.red_point = {}
	slot0.talent_skill_list = nil
	slot0.reset_time = nil
	slot0.is_init_attr = false
	slot0.is_had_detailed = nil
	slot0.horcrux_list = {}
end

function HeroVo.getKey(slot0)
	return getNorKey(slot0.battle_id, slot0.id)
end

function HeroVo.getId(slot0)
	if slot0.partner_id ~= 0 then
		return slot0.partner_id
	else
		return slot0.id
	end
end

function HeroVo.initAttributeData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		if slot5 == "looks" then
			slot0:setLooks(slot6)
		elseif type(slot6) ~= "table" then
			slot0:setRoleAttribute(slot5, slot6)
		end

		if slot5 == "show_order" then
			slot0.sort_order = slot6
		end
	end
end

function HeroVo.getBaseAttr(slot0)
	return {
		{
			name = "hp",
			value = slot0.hp
		},
		{
			name = "atk",
			value = slot0.atk
		},
		{
			name = "def_p",
			value = slot0.def_p
		},
		{
			name = "def_s",
			value = slot0.def_s
		},
		{
			name = "speed",
			value = slot0.speed
		}
	}
end

function HeroVo.getOtherAttr(slot0)
	return {
		{
			name = "crit_rate",
			value = slot0.crit_rate + slot0.crit_rate2
		},
		{
			name = "crit_ratio",
			value = slot0.crit_ratio + slot0.crit_ratio2
		},
		{
			name = "hit_magic",
			value = slot0.hit_magic + slot0.hit_magic2
		},
		{
			name = "dodge_magic",
			value = slot0.dodge_magic + slot0.dodge_magic2
		}
	}
end

function HeroVo.getBaseEquipAttr(slot0)
	return {
		{
			name = "hp2",
			value = slot0.hp2
		},
		{
			name = "atk2",
			value = slot0.atk2
		},
		{
			name = "def_p2",
			value = slot0.def_p2
		},
		{
			name = "def_s2",
			value = slot0.def_s2
		},
		{
			name = "speed2",
			value = slot0.speed2
		}
	}
end

function HeroVo.getOtherEquipAttr(slot0)
	return {
		{
			name = "crit_rate2",
			value = slot0.crit_rate2
		},
		{
			name = "crit_ratio2",
			value = slot0.crit_ratio2
		},
		{
			name = "hit_magic2",
			value = slot0.hit_magic2
		},
		{
			name = "dodge_magic2",
			value = slot0.dodge_magic2
		}
	}
end

function HeroVo.updateEqipAttr(slot0, slot1)
	slot1 = slot1 or {}

	for slot5, slot6 in pairs(slot1) do
		if PartnerCalculate.isEquipAttr(slot5) == true then
			slot0:setRoleAttribute(slot5, slot6)
		end
	end

	if slot1.power then
		slot0:setRoleAttribute("power", slot1.power)
	end
end

function HeroVo.setLooks(slot0, slot1)
	slot2 = slot1 and next(slot1) ~= nil
	slot3 = nil

	for slot7, slot8 in pairs(slot1 or {}) do
		if slot0.loos[slot8.looks_type] then
			slot3:setAntVo(V1)
		else
			slot3 = LooksVo.New()

			slot3:setAntVo(V1)

			slot0.looks[slot8.looks_type] = slot3
		end
	end

	if slot2 == true then
		slot0:dispatchUpdateAttrByKey("looks", slot0.looks)
	end
end

function HeroVo.updateHeroVo(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0:setAttr(slot5, slot6)

			if slot5 == "show_order" then
				slot0.sort_order = slot6
			end

			if slot5 == "eqms" then
				slot0:updateEqmList(slot6)
			end

			if slot5 == "holy_eqm" then
				slot0:updateHolyEqmList(slot6)
			end

			if slot5 == "artifacts" then
				slot0:updateArtifactList(slot6)
			end

			if slot5 == "is_lock" then
				slot0:updateLock(slot6)
			end

			if slot5 == "dower_skill" then
				slot0:updateSkill(slot6)
			end
		end

		slot0:Fire(HeroVo.UPDATE_Partner_ATTR, slot0)
	end
end

function HeroVo.setInitAttr(slot0)
	slot0.is_init_attr = true
end

function HeroVo.isInitAttr(slot0)
	return slot0.is_init_attr
end

function HeroVo.setIsHadDetail(slot0, slot1)
	slot0.is_had_detailed = slot1
end

function HeroVo.updateSkill(slot0, slot1)
	slot0.talent_skill_list = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.talent_skill_list[slot6.pos] = slot6.skill_id
	end
end

function HeroVo.ishaveTalentData(slot0)
	if slot0.talent_skill_list == nil then
		return false
	end

	return true
end

function HeroVo.checkIsHaveTalentByBid(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.talent_skill_list or {}) do
		if Config.PartnerSkillData.data_partner_skill_item[slot7] then
			for slot12, slot13 in pairs(slot8.expend or {}) do
				if slot13 == slot1 then
					slot2 = true

					break
				end
			end
		end

		if slot2 then
			break
		end
	end

	return slot2
end

function HeroVo.updateLock(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot0.dic_locks[slot6.lock_type] = slot6.is_lock
	end

	slot0.is_lock = 0

	for slot5, slot6 in pairs(slot0.dic_locks) do
		if slot0.is_lock == 0 then
			slot0.is_lock = slot6
		end
	end
end

function HeroVo.isLock(slot0)
	for slot4, slot5 in pairs(slot0.dic_locks) do
		if slot5 > 0 then
			return true, slot4
		end
	end

	return false
end

function HeroVo.checkHeroLockTips(slot0, slot1, slot2, slot3)
	slot4 = slot2 or {}

	if slot1 then
		slot4 = {
			HeroConst.LockType.eFormLock,
			HeroConst.LockType.eHeroLock,
			HeroConst.LockType.eHeroChangeLock,
			HeroConst.LockType.eHeroResonateLock
		}
	end

	for slot8, slot9 in ipairs(slot4) do
		if slot9 == HeroConst.LockType.eFormLock then
			if slot0:isInForm() then
				if not slot3 then
					if math.floor(slot0.is_in_form / slot0.form_param) == PartnerConst.Fun_Form.Drama then
						message(TI18N("该英雄在剧情阵容中已上阵"))
					elseif slot10 == PartnerConst.Fun_Form.Arena then
						message(TI18N("该英雄在竞技场防守阵容中已上阵"))
					elseif slot10 == PartnerConst.Fun_Form.EliteMatch or slot10 == PartnerConst.Fun_Form.EliteKingMatch then
						message(TI18N("该英雄已在超凡段位赛中上阵"))
					elseif slot10 == PartnerConst.Fun_Form.CrossArenaDef then
						message(TI18N("该英雄在跨服竞技场防守阵容中已上阵"))
					elseif slot10 == PartnerConst.Fun_Form.Adventure_Mine_Def then
						message(TI18N("该英雄秘矿冒险防守阵容中已上阵"))
					elseif slot10 == PartnerConst.Fun_Form.ArenaTeam then
						message(TI18N("该英雄组队竞技场阵容中已上阵"))
					elseif slot10 == PartnerConst.Fun_Form.ArenapeakchampionDef then
						message(TI18N("该英雄巅峰冠军赛阵容中已上阵"))
					end
				end

				return true
			end
		elseif slot0.dic_locks[slot9] and slot0.dic_locks[slot9] > 0 then
			if not slot3 then
				if slot9 == HeroConst.LockType.eHeroLock then
					message(TI18N("该英雄已锁定，请前往英雄界面解锁"))
				elseif slot9 == HeroConst.LockType.eHeroChangeLock then
					message(TI18N("该英雄转换中，请前往伟大召唤处解除"))
				elseif slot9 == HeroConst.LockType.eHeroResonateLock then
					message(TI18N("该英雄在恶魔果树槽位中已上阵"))
				end
			end

			return true
		end
	end

	return false
end

function HeroVo.isInForm(slot0)
	if slot0.is_in_form > 0 then
		if math.floor(slot0.is_in_form / slot0.form_param) == PartnerConst.Fun_Form.ArenaTeam then
			if ArenateamController:getInstance():getModel():getMyTeamInfo() and (slot3.state == 1 or slot3.state == 2) then
				return true
			else
				for slot8, slot9 in ipairs(slot0.dic_in_form) do
					slot4 = 0 + 1
				end

				if slot4 >= 2 then
					return true
				end
			end
		else
			return true
		end
	end

	return false
end

function HeroVo.isFormDrama(slot0)
	if slot0.is_in_form > 0 then
		if slot0.dic_in_form and slot0.dic_in_form[PartnerConst.Fun_Form.Drama] ~= nil then
			return true
		end

		return false
	end

	return false
end

function HeroVo.updateFetter(slot0, slot1)
	slot0.fetter = {}

	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		uv0(slot0.fetter, slot6.fetter)
	end
end

function HeroVo.checkFetter(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.fetter) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

function HeroVo.checkEquipFetter(slot0)
	slot2 = 60

	if Config.PartnerData.data_partner_const.fetter_open then
		slot2 = slot1.val
	end

	if #slot0.fetter >= 2 then
		return false
	end

	return true
end

function HeroVo.setAttr(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end

function HeroVo.getAttrByKey(slot0, slot1)
	return slot0[slot1]
end

function HeroVo.updateEqmList(slot0, slot1)
	slot2 = slot1 or {}

	for slot6, slot7 in pairs(slot2) do
		if not slot0.eqm_list[slot7.type] then
			slot0.eqm_list[slot7.type] = GoodsVo.New(slot7.base_id)
		end

		if slot8.initAttrData then
			slot8:initAttrData(slot7)
		end

		slot8:setEnchantScore(0)
	end

	if tableLen(slot2) < tableLen(slot0.eqm_list) then
		for slot6, slot7 in pairs(slot0.eqm_list) do
			slot8 = true

			for slot12, slot13 in ipairs(slot2) do
				if slot6 == slot13.type then
					slot8 = false

					break
				end
			end

			if slot8 == true then
				slot0.eqm_list[slot6] = nil
			end
		end
	end
end

function HeroVo.ishaveHolyEquipmentData(slot0)
	if slot0.holy_eqm_list == nil then
		return false
	end

	return true
end

function HeroVo.updateHolyEqmList(slot0, slot1)
	slot2 = slot1 or {}

	if slot0.holy_eqm_list == nil then
		slot0.holy_eqm_list = {}
	end

	for slot6, slot7 in ipairs(slot2) do
		if Config.ItemData.data_get_data(slot7.base_id) then
			slot7.type = slot8.type

			if not slot0.holy_eqm_list[slot7.type] then
				slot0.holy_eqm_list[slot7.type] = GoodsVo.New(slot7.base_id)
			end

			if slot9.initAttrData then
				slot9:initAttrData(slot7)
			end

			slot9:setEnchantScore(0)
		end
	end

	if tableLen(slot2) < tableLen(slot0.holy_eqm_list) then
		for slot6, slot7 in pairs(slot0.holy_eqm_list) do
			slot8 = true

			for slot12, slot13 in ipairs(slot2) do
				if slot6 == slot13.type then
					slot8 = false

					break
				end
			end

			if slot8 == true then
				slot0.holy_eqm_list[slot6] = nil
			end
		end
	end
end

function HeroVo.updateRedPoint(slot0, slot1, slot2)
	if slot2 ~= nil and slot0.red_point[slot1] ~= slot2 then
		slot0.red_point[slot1] = slot2

		slot0:Fire(HeroVo.UPDATE_Partner_ATTR, slot0)
	end
end

function HeroVo.isRedStatus(slot0)
	for slot4, slot5 in pairs(slot0.red_point) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function HeroVo.updateArtifactList(slot0, slot1)
	slot3 = {
		[slot8.artifact_pos] = slot8
	}

	for slot7, slot8 in ipairs(slot1 or {}) do
		-- Nothing
	end

	for slot7 = 1, 2 do
		slot9 = slot0.artifact_list[slot7]

		if slot3[slot7] and slot9 then
			if slot9.initAttrData then
				slot9:initAttrData(slot8)
			end
		elseif slot8 and slot9 == nil then
			if GoodsVo.New(slot8.base_id).initAttrData then
				slot9:initAttrData(slot8)
			end

			slot0.artifact_list[slot7] = slot9
		elseif slot8 == nil and slot9 then
			slot0.artifact_list[slot7] = nil

			slot9:DeleteMe()
		end
	end
end

function HeroVo.getArtifactSkill(slot0, slot1)
	if slot0.artifact_list == nil or next(slot0.artifact_list) == nil then
		return
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot0.artifact_list) do
		if slot7.extra then
			if slot1 == 2 and slot0:checkArtifactType(slot7) then
				return slot7.extra
			elseif slot1 == 1 and not slot0.checkArtifactType(slot7) then
				return slot7.extra
			end
		end
	end
end

function HeroVo.checkArtifactType(slot0, slot1)
	if slot1 == nil then
		return false
	end

	if slot1.extra == nil or next(slot1.extra) == nil then
		return false
	end

	slot2 = false

	for slot6, slot7 in ipairs(slot1.extra) do
		if slot7.extra_k == 2 then
			slot2 = true

			break
		end
	end

	return slot2
end

function HeroVo.updateFormPos(slot0, slot1, slot2)
	slot0.is_in_form = 0

	if (slot1 or 0) == 0 then
		slot0.dic_in_form[slot2 or PartnerConst.Fun_Form.Drama] = nil
	else
		slot0.dic_in_form[slot2] = slot1
	end

	for slot6, slot7 in pairs(slot0.dic_in_form) do
		if slot0.is_in_form == 0 then
			slot0.is_in_form = slot6 * slot0.form_param + slot7
		elseif slot8 < slot0.is_in_form then
			slot0.is_in_form = slot8
		end
	end

	slot0:updateHeroVo({
		is_in_form = slot0.is_in_form
	})
end

function HeroVo.setRoleAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end

function HeroVo.isResonateCrystalHero(slot0)
	if slot0.resonate_lev and slot0.resonate_lev > 0 then
		return true
	end

	return false
end

function HeroVo.isResonateHero(slot0)
	if slot0.end_time and slot0.end_time > 0 then
		return true
	end

	return false
end

function HeroVo.checkResonateHero(slot0)
	if slot0:isResonateHero() then
		message(TI18N("赋能英雄不可参与此玩法或选择"))

		return true
	end

	return false
end

function HeroVo.checkResonateHeroByFormType(slot0, slot1, slot2)
	if not slot1 then
		return false
	end

	if slot0:isResonateHero() then
		if slot1 == PartnerConst.Fun_Form.Drama or slot1 == PartnerConst.Fun_Form.Startower or slot1 == PartnerConst.Fun_Form.ElementWater or slot1 == PartnerConst.Fun_Form.ElementFire or slot1 == PartnerConst.Fun_Form.ElementWind or slot1 == PartnerConst.Fun_Form.ElementLight or slot1 == PartnerConst.Fun_Form.ElementDark or slot1 == PartnerConst.Fun_Form.GuildDun_AD then
			return false
		end

		if not slot2 then
			message(TI18N("赋能英雄不可参与此玩法或选择"))
		end

		return true
	end
end

function HeroVo.initResetTime(slot0, slot1)
	slot0.reset_time = slot1
end

function HeroVo.isResetTimeInfo(slot0)
	return slot0.reset_time ~= nil
end

function HeroVo.updateHorcruxList(slot0, slot1)
	slot3 = {
		[slot8.horcrux_pos] = slot8
	}

	for slot7, slot8 in ipairs(slot1 or {}) do
		-- Nothing
	end

	for slot7 = 1, 2 do
		slot9 = slot0.horcrux_list[slot7]

		if slot3[slot7] and slot9 then
			if slot9.initAttrData then
				slot9:initAttrData(slot8)
			end
		elseif slot8 and slot9 == nil then
			if GoodsVo.New(slot8.base_id).initAttrData then
				slot9:initAttrData(slot8)
			end

			slot0.horcrux_list[slot7] = slot9
		elseif slot8 == nil and slot9 then
			slot0.horcrux_list[slot7] = nil

			slot9:DeleteMe()
		end
	end
end
