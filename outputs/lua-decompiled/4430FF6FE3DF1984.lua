RoleSceneVo = RoleSceneVo or BaseClass(EventDispatcher)
RoleSceneVo.unittype = {
	role = 1,
	unit = 2,
	none = 0
}
RoleSceneVo.sub_unittype = {
	npc = 4,
	ele = 3
}
RoleSceneVo.lookstype = {
	body = 1,
	buff = 2
}

function RoleSceneVo.__init(slot0)
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.name = ""
	slot0.speed = 0
	slot0.dir = 0
	slot0.x = 0
	slot0.y = 0
	slot0.status = 0
	slot0.event = 0
	slot0.looks = {}
	slot0.face = 0
	slot0.lev = 0
	slot0.sex = 1
	slot0.avatar = 0
	slot0.battle_id = 1
	slot0.id = 0
	slot0.base_id = 0
	slot0.lev = 0
	slot0.sub_type = 0
	slot0.layer = 1
	slot0.scene_id = 0
	slot0.type = 0
	slot0.hide_self = false
	slot0.unit_type = 0
end

function RoleSceneVo.initAttributeData(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot5 == "looks" then
			slot0:setLooks(slot6, true)
		elseif type(slot6) ~= "table" then
			slot0:setRoleAttribute(slot5, slot6)
		end
	end
end

function RoleSceneVo.getSpeed(slot0)
	return slot0.speed * 0.1
end

function RoleSceneVo.getNowPos(slot0)
	return slot0.x, slot0.y
end

function RoleSceneVo.setLooks(slot0, slot1, slot2)
	slot3 = slot1 and next(slot1) ~= nil
	slot0.looks = {}
	slot4 = nil

	for slot8, slot9 in pairs(slot1 or {}) do
		if slot0.looks[slot9.looks_type] then
			if slot9.looks_model == 0 and slot9.looks_val == 0 and slot9.looks_str == "" then
				slot0.looks[slot9.looks_type] = nil
			else
				slot4:setAntVo(slot9)
			end
		else
			slot4 = LooksVo.New()

			slot4:setAntVo(slot9)

			slot0.looks[slot9.looks_type] = slot4
		end
	end

	if slot3 == true then
		slot0:dispatchUpdateAttrByKey("looks", slot0.looks)
	end
end

function RoleSceneVo.getBodyRes(slot0)
	slot1 = nil

	if slot0.type == slot0.unittype.role then
		if slot0:getLooksByType(RoleSceneVo.lookstype.body) ~= nil and slot2.looks_val ~= nil and slot2.looks_val ~= 0 then
			if slot2.looks_mode == 1 then
				if not Config.ClothesData.data_fashion_to_partner[slot2.looks_val] then
					return
				end

				if slot3 and slot3[1] and slot3[1].partner_bid and Config.ClothesData.data_clothes_data[slot3[1].partner_bid] and slot5[slot2.looks_val] then
					slot1 = slot5[slot2.looks_val].model or ""
				end
			elseif Config.PartnerData.data_partner[slot2.looks_val] ~= nil then
				slot1 = slot3.res_id
			end
		end
	elseif slot0.type == slot0.unittype.unit and Config.UnitData.data_unit(slot0.base_id) ~= nil then
		slot1 = slot2.body_id
	end

	return slot1
end

function RoleSceneVo.getLooksByType(slot0, slot1)
	return slot0.looks[slot1] or {}
end

function RoleSceneVo.setRoleAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end
end

function RoleSceneVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(RolesceneEvent.UPDATE_ROLE_ATTRIBUTE, slot1, slot2)
end
