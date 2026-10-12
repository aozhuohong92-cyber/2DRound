UnitVo = UnitVo or BaseClass(EventDispatcher)
UnitVo.type = {
	DOOR = 102,
	NPC = 1
}

function UnitVo.__init(slot0)
	slot0.battle_id = 1
	slot0.id = 0
	slot0.bid = 0
	slot0.type = 0
	slot0.name = ""
	slot0.x = 0
	slot0.y = 0
	slot0.dir = 4
	slot0.body_res = ""
	slot0.speed = 1
	slot0.unit_type = 2
	slot0.camp = 0
	slot0.lev = 0
	slot0.status = 0
	slot0.effect = 0
	slot0.score = 0
	slot0.win_acc = 0
	slot0.pos_x = 0
	slot0.pos_y = 0
	slot0.skill_effect = {}
	slot0.is_speed_up = false
end

function UnitVo.getKey(slot0)
	return getNorKey(slot0.battle_id, slot0.id)
end

function UnitVo.initAttributeData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		slot0:setUnitAttribute(slot5, slot6)
	end
end

function UnitVo.setUnitAttribute(slot0, slot1, slot2)
	if slot1 == "type" then
		return
	end

	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		if slot1 == "speed" then
			slot0.move_speed = (slot2 or 0) / 10
		end
	end

	slot0:dispatchUpdateAttrByKey(slot1, slot2)
end

function UnitVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	if slot1 == "x" or slot1 == "y" then
		return
	end

	slot0:Fire(SceneEvent.UPDATE_UNIT_ATTRIBUTE, slot1, slot2)
end
