require("script/utils/extern")
require("db/skill")
require("db/DB_Item_dress")
require("script/model/hero/HeroModel")
module("BT_Skill", package.seeall)

function isTurnedChangeSkill(slot0, slot1)
	slot4 = false

	for slot8, slot9 in pairs(string.split(DB_Heros_dress.getDataById(slot0).skilleffect_id, "|")) do
		if tonumber(slot9) == slot1 then
			slot4 = true

			break
		end
	end

	return slot4
end

function getDataById(slot0, slot1, slot2, slot3)
	print("p_skillId, p_DressId, p_htid, p_turnedId", slot0, slot1, slot2, slot3)

	slot4 = slot1 or 1
	slot6 = slot2 or 0
	slot7 = slot3 or 0

	if skill.getDataById(slot0 or 1).suitChange ~= 1 and slot7 == 0 then
		return slot8
	end

	print("skillData.functionWay", slot8.functionWay)
	print("turnedId", slot7)

	slot9 = DB_Heros_dress.getDataById(slot7)

	if tonumber(slot7) ~= 0 and slot9 ~= nil then
		print("BT_Skill", slot7, slot5)

		if isTurnedChangeSkill(slot7, tonumber(slot5)) then
			table.hcopy(slot8, {})
			require("db/DB_Heros_dress")

			slot11.mpostionType = slot9.mpostionType or slot11.mpostionType
			slot11.distancePath = slot9.distancePath or slot11.distancePath
			slot11.actionid = slot9.actionid or slot11.actionid
			slot11.skillEffect = slot9.skillEffect or slot11.skillEffect
			slot11.fullScreen = slot9.fullScreen or slot11.fullScreen
			slot11.attackEffct = slot9.attackEffct or slot11.attackEffct
			slot11.spell_effect = slot9.spell_effect or slot11.spell_effect
			slot11.hitEffct = slot9.hitEffct or slot11.hitEffct
			slot11.hit_effect = slot9.hit_effect or slot11.hit_effect
			slot11.attackEffctPosition = slot9.attackEffctPosition or slot11.attackEffctPosition

			return slot11
		end
	end

	if slot1 and slot1 ~= 0 and tonumber(slot8.functionWay) ~= 2 and DB_Heroes.getDataById(slot6) then
		table.hcopy(slot8, {})

		if string.split(DB_Item_dress.getDataById(slot4).mpostionType, ",")[HeroModel.getSex(slot6)] ~= "nil" then
			slot12.mpostionType = tonumber(string.split(slot13.mpostionType, ",")[slot11])
		else
			slot12.mpostionType = nil
		end

		if string.split(slot13.distancePath, ",")[slot11] ~= "nil" then
			slot12.distancePath = string.split(slot13.distancePath, ",")[slot11]
		else
			slot12.distancePath = nil
		end

		if string.split(slot13.actionid, ",")[slot11] ~= "nil" then
			slot12.actionid = string.split(slot13.actionid, ",")[slot11]
		else
			slot12.actionid = nil
		end

		if string.split(slot13.skillEffect, ",")[slot11] ~= "nil" then
			slot12.skillEffect = string.split(slot13.skillEffect, ",")[slot11]
		else
			slot12.skillEffect = nil
		end

		if string.split(slot13.fullScreen, ",")[slot11] ~= "nil" then
			slot12.fullScreen = tonumber(string.split(slot13.fullScreen, ",")[slot11])
		else
			slot12.fullScreen = nil
		end

		if string.split(slot13.attackEffct, ",")[slot11] ~= "nil" then
			slot12.attackEffct = string.split(slot13.attackEffct, ",")[slot11]
		else
			slot12.attackEffct = nil
		end

		if string.split(slot13.spell_effect, ",")[slot11] ~= "nil" then
			slot12.spell_effect = string.split(slot13.spell_effect, ",")[slot11]
		else
			slot12.spell_effect = nil
		end

		if string.split(slot13.hitEffct, ",")[slot11] ~= "nil" then
			slot12.hitEffct = string.split(slot13.hitEffct, ",")[slot11]
		else
			slot12.hitEffct = nil
		end

		if string.split(slot13.hit_effect, ",")[slot11] ~= "nil" then
			slot12.hit_effect = string.split(slot13.hit_effect, ",")[slot11]
		else
			slot12.hit_effect = nil
		end

		if string.split(slot13.attackEffctPosition, ",")[slot11] ~= "nil" then
			slot12.attackEffctPosition = string.split(slot13.attackEffctPosition, ",")[slot11]
		else
			slot12.attackEffctPosition = nil
		end

		return slot12
	else
		return slot8
	end
end
