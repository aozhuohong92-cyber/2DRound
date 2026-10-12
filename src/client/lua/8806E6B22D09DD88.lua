PartnerCalculate = PartnerCalculate or BaseClass()

function PartnerCalculate.isEquipAttr(slot0)
	if slot0 == "atk2" or slot0 == "def2" or slot0 == "hp2" or slot0 == "speed2" or slot0 == "hit_rate2" or slot0 == "crit_rate2" or slot0 == "hit_magic2" or slot0 == "dodge_magic2" or slot0 == "crit_ratio2" then
		return true
	end

	return false
end

function PartnerCalculate.isShowPer(slot0)
	if Config.AttrData.data_type[Config.AttrData.data_id_to_key[slot0]] and slot2 == 2 then
		return true
	end

	return false
end

function PartnerCalculate.isShowPerByStr(slot0)
	if Config.AttrData.data_type[slot0] and slot1 == 2 then
		return true
	end

	return false
end

function PartnerCalculate.getIsCanClothArtifact(slot0)
	return false
end

function PartnerCalculate.calculatePower(slot0)
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
