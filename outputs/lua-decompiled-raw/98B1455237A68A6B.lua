BuildVo = BuildVo or BaseClass(EventDispatcher)
BuildVo.Update_self_event = "BuildVo.Update_self_event"
BuildVo.status_type = {
	LOCK = 0,
	UNLOCK = 1
}

function BuildVo.__init(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.config = slot1
	slot0.is_lock = slot2
	slot0.activate = slot3
	slot0.tips_list = {}
	slot0.tips_status = false
	slot0.desc = slot4
	slot0.in_fight = false
	slot0.fight_status_list = {}
	slot0.is_verifyios = slot5 or 1
	slot0.group_id = 0
end

function BuildVo.setLockStatus(slot0, slot1)
	if slot0.is_lock ~= slot1 then
		slot0.is_lock = slot1

		slot0:Fire(BuildVo.Update_self_event, "lock_status")
	end
end

function BuildVo.setTipsStatus(slot0, slot1)
	slot2 = false

	if slot1 == nil then
		slot1 = not slot0.tips_status
	end

	if type(slot1) == "table" then
		if slot1.bid ~= nil then
			if slot0.tips_list[slot1.bid] ~= slot1.status then
				slot2 = true
				slot0.tips_list[slot1.bid] = slot1.status
			end
		else
			for slot6, slot7 in pairs(slot1) do
				if slot7.bid ~= nil and slot0.tips_list[slot7.bid] ~= slot7.status then
					slot2 = true
					slot0.tips_list[slot7.bid] = slot7.status
				end
			end
		end
	elseif slot0.tips_status ~= slot1 then
		slot2 = true
		slot0.tips_status = slot1
	end

	if slot2 == true then
		slot0:Fire(BuildVo.Update_self_event, "tips_status")
	end
end

function BuildVo.clearTipsStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.tips_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	if slot0.tips_status == true then
		slot1 = true
	end

	slot0.tips_status = false
	slot0.tips_list = {}

	if slot1 == true then
		slot0:Fire(BuildVo.Update_self_event, "tips_status")
	end
end

function BuildVo.setFightStatus(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.fight_status_list) do
		if slot7 == true then
			slot2 = true

			break
		end
	end

	slot3 = false

	for slot7, slot8 in pairs(slot1) do
		if slot8 == true then
			slot3 = true

			break
		end
	end

	if slot2 == slot3 then
		return
	end

	slot0.fight_status_list = slot1

	slot0:Fire(BuildVo.Update_self_event, "fight_status")
end

function BuildVo.setSpecialGroupId(slot0, slot1)
	if slot0.group_id ~= slot1 then
		slot0.group_id = slot1

		slot0:Fire(BuildVo.Update_self_event, "group_id")
	end
end

function BuildVo.getFightStatus(slot0)
	for slot4, slot5 in pairs(slot0.fight_status_list) do
		if slot5 == true then
			return true
		end
	end

	return false
end

function BuildVo.getTipsStatus(slot0)
	for slot4, slot5 in pairs(slot0.tips_list) do
		if slot5 == true then
			return true
		end
	end

	return slot0.tips_status
end

function BuildVo.__datale(slot0)
end
