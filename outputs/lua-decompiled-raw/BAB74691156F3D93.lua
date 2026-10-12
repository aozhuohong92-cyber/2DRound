function getTestBattleInfo()
	slot0 = {
		appraisal = "F"
	}
	slot1 = {
		level = 36,
		uid = 21805,
		isPlayer = true,
		totalHpCost = 1000,
		name = GetLocalizeStringBy("key_2260")
	}
	slot2 = {
		[slot6] = {
			position = slot6 - 1,
			level = 11,
			maxHp = 400,
			rageSkill = 1030,
			currRage = 0,
			htid = 20002,
			hid = 3010020 + slot6
		}
	}

	for slot6 = 1, 6 do
	end

	slot2[6].hid = 3012621
	slot1.arrHero = slot2
	slot0.team1 = slot1
	slot3 = {
		level = 36,
		uid = 21806,
		isPlayer = false,
		totalHpCost = 1000,
		name = GetLocalizeStringBy("key_2261")
	}
	slot4 = {
		[slot8] = {
			position = slot8 - 1,
			level = 11,
			maxHp = 400,
			rageSkill = 1030,
			currRage = 0,
			htid = 20002,
			hid = 3010040 + slot8
		}
	}

	for slot8 = 1, 6 do
	end

	slot4[6].hid = 3012631
	slot3.arrHero = slot4
	slot0.team2 = slot3
	slot5 = {}
	slot6 = {
		defender = 3010041,
		arrReaction = {}
	}
	slot6.arrReaction[1] = {
		defender = 3010041,
		reaction = 1,
		arrDamage = {}
	}
	slot6.arrReaction[1].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot6.arrReaction[1].enBuffer = {
		4029
	}
	slot6.arrChild = {
		{}
	}
	slot6.arrChild[1].defender = 3010042
	slot6.arrChild[1].round = 1
	slot6.arrChild[1].action = 645
	slot6.arrChild[1].attacker = 3010021
	slot6.arrChild[1].rage = 50
	slot6.arrChild[1].arrReaction = {
		{}
	}
	slot6.arrChild[1].arrReaction[1].defender = 3010042
	slot6.arrChild[1].arrReaction[1].reaction = 1
	slot6.arrChild[1].arrReaction[1].arrDamage = {
		{}
	}
	slot6.arrChild[1].arrReaction[1].arrDamage[1].damageType = 1
	slot6.arrChild[1].arrReaction[1].arrDamage[1].damageValue = 43
	slot6.arrChild[1].arrReaction[1].enBuffer = {
		119
	}
	slot6.round = 1
	slot6.action = 2260
	slot6.attacker = 3010021
	slot6.rage = 50
	slot5[#slot5 + 1] = slot6
	slot7 = {
		defender = 0,
		buffer = {}
	}
	slot7.buffer[1] = {
		bufferId = 4029,
		data = -5,
		type = 9
	}
	slot7.round = 2
	slot7.action = 0
	slot7.attacker = 3010041
	slot7.rage = 50
	slot5[#slot5 + 1] = slot7
	slot8 = {
		defender = 3010023,
		arrReaction = {}
	}
	slot8.arrReaction[1] = {
		defender = 3010023,
		reaction = 1,
		arrDamage = {}
	}
	slot8.arrReaction[1].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot8.arrReaction[2] = {
		defender = 3012631,
		reaction = 1,
		arrDamage = {}
	}
	slot8.arrReaction[2].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot8.round = 3
	slot8.action = 1030
	slot8.attacker = 3010043
	slot8.rage = 50
	slot5[#slot5 + 1] = slot8
	slot9 = {
		defender = 3010041,
		arrReaction = {}
	}
	slot9.arrReaction[1] = {
		defender = 3010041,
		reaction = 1,
		arrDamage = {}
	}
	slot9.arrReaction[1].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot9.arrReaction[2] = {
		defender = 3010044,
		reaction = 1,
		arrDamage = {}
	}
	slot9.arrReaction[2].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot9.round = 4
	slot9.action = 1070
	slot9.attacker = 3010024
	slot9.rage = 50
	slot5[#slot5 + 1] = slot9
	slot10 = {
		defender = 3010041,
		arrReaction = {}
	}
	slot10.arrReaction[1] = {
		defender = 3010041,
		reaction = 1,
		arrDamage = {}
	}
	slot10.arrReaction[1].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot10.round = 5
	slot10.action = 1130
	slot10.attacker = 3010025
	slot10.rage = 50
	slot5[#slot5 + 1] = slot10
	slot11 = {
		defender = 3010041,
		arrReaction = {}
	}
	slot11.arrReaction[1] = {
		defender = 3010041,
		reaction = 1,
		arrDamage = {}
	}
	slot11.arrReaction[1].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot11.arrReaction[2] = {
		defender = 3010042,
		reaction = 1,
		arrDamage = {}
	}
	slot11.arrReaction[2].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot11.arrReaction[3] = {
		defender = 3010043,
		reaction = 1,
		arrDamage = {}
	}
	slot11.arrReaction[3].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot11.arrReaction[4] = {
		defender = 3010044,
		reaction = 1,
		arrDamage = {}
	}
	slot11.arrReaction[4].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot11.arrReaction[5] = {
		defender = 3010045,
		reaction = 1,
		arrDamage = {}
	}
	slot11.arrReaction[5].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot11.arrReaction[6] = {
		defender = 3012631,
		reaction = 1,
		arrDamage = {}
	}
	slot11.arrReaction[6].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot11.round = 6
	slot11.action = 1090
	slot11.attacker = 3012621
	slot11.rage = 50
	slot5[#slot5 + 1] = slot11
	slot12 = {
		defender = 3010041,
		arrReaction = {}
	}
	slot12.arrReaction[1] = {
		defender = 3010041,
		reaction = 1,
		arrDamage = {}
	}
	slot12.arrReaction[1].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot12.arrReaction[2] = {
		defender = 3010042,
		reaction = 1,
		arrDamage = {}
	}
	slot12.arrReaction[2].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot12.arrReaction[3] = {
		defender = 3010043,
		reaction = 1,
		arrDamage = {}
	}
	slot12.arrReaction[3].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot12.arrReaction[4] = {
		defender = 3010044,
		reaction = 1,
		arrDamage = {}
	}
	slot12.arrReaction[4].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot12.arrReaction[5] = {
		defender = 3010045,
		reaction = 1,
		arrDamage = {}
	}
	slot12.arrReaction[5].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot12.arrReaction[6] = {
		defender = 3012631,
		reaction = 1,
		arrDamage = {}
	}
	slot12.arrReaction[6].arrDamage[1] = {
		damageType = 1,
		damageValue = 43
	}
	slot12.round = 7
	slot12.action = 1050
	slot12.attacker = 3010021
	slot12.rage = 50
	slot5[#slot5 + 1] = slot12
	slot0.battle = slot5

	return slot0
end
