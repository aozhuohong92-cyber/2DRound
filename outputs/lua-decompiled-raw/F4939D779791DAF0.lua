HallowsVo = HallowsVo or BaseClass(EventDispatcher)
slot0 = table.insert

function HallowsVo.__init(slot0)
	slot0.id = 0
	slot0.step = 1
	slot0.lucky = 0
	slot0.lucky_endtime = 0
	slot0.power = 0
	slot0.seal = 0
	slot0.add_attr = {}
	slot0.reward = {}
	slot0.skill_bid = 0
	slot0.skill_lev = 1
	slot0.look_id = 0
	slot0.refine_lev = 0
	slot0.is_update = false
	slot0.red_status_list = {}
end

function HallowsVo.initAttributeData(slot0, slot1)
	slot0.is_update = true

	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:updateSingleData(slot5, slot6)
		elseif slot5 == "add_attr" then
			slot0:updateAddAttr(slot6)
		elseif slot5 == "skill" then
			slot0:updateSkill(slot6)
		end
	end
end

function HallowsVo.updateSingleData(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end

function HallowsVo.updateAddAttr(slot0, slot1)
	slot0.add_attr = slot1 or {}
end

function HallowsVo.checkRedStatus(slot0, slot1)
	if slot0.is_update == true or slot1 == true then
		slot0.is_update = false
		slot0.red_status_list = {}

		return false
	else
		for slot5, slot6 in pairs(slot0.red_status_list) do
			if slot6 == true then
				return true
			end
		end
	end

	return false
end

function HallowsVo.getRedStatus(slot0, slot1)
	return slot0.red_status_list[slot1]
end

function HallowsVo.checkCanUpgrade(slot0)
	return false
end

function HallowsVo.checkCanUseTrace(slot0)
	return false
end

function HallowsVo.checkCanUpgradeSkill(slot0)
	return false
end

function HallowsVo.updateSkill(slot0, slot1)
	if slot1[1] then
		slot0.skill_bid = slot1[1].skill_bid
		slot0.skill_lev = slot1[1].lev
	end
end

function HallowsVo.checkRewardsIsOver(slot0, slot1)
	return slot0.reward[slot1]
end

function HallowsVo.getHallowsSkillAndRefineAtkVal(slot0)
	slot1 = 0
	slot2 = 0

	if Config.HallowsData.data_skill_up(getNorKey(slot0.id, slot0.skill_lev)) and Config.SkillData.data_get_skill(slot3.skill_bid) then
		slot1 = slot4.hallows_atk or 0
	end

	if Config.HallowsRefineData.data_refine[slot0.id] and slot4[slot0.refine_lev] then
		slot2 = slot5.add_dps or 0
	end

	return slot1, slot2
end

function HallowsVo.__delete(slot0)
end
