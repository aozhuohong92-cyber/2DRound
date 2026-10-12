HomepetVo = HomepetVo or BaseClass(EventDispatcher)

function HomepetVo.__init(slot0)
	slot0.pet_id = 0
	slot0.name = ""
	slot0.state = 0
	slot0.vigor = 0
	slot0.vigor_time = 0
	slot0.set_item = {}
	slot0.dic_set_item_id = {}
	slot0.rename_count = 0
	slot0.day_talk = 0
	slot0.day_feed = 0
end

function HomepetVo.updateAttrData(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] then
			slot0[slot5] = slot6
		end

		if slot5 == "set_item" then
			slot0:updateSetItem(slot6)
		end

		slot0:Fire(HomepetEvent.HOME_PET_VO_ATTR_EVENT, slot5, slot6)
	end
end

function HomepetVo.updateSetItem(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.dic_set_item_id = {}

	for slot5, slot6 in ipairs(slot1) do
		slot0.dic_set_item_id[slot6.key] = slot6.id
	end
end

function HomepetVo.getSetItemInfo(slot0)
	return slot0.dic_set_item_id or {}
end

function HomepetVo.getPetName(slot0)
	if slot0.name == nil or slot0.name == "" then
		return TI18N("二哈")
	else
		return slot0.name
	end
end

function HomepetVo.getPetState(slot0)
	return slot0.state
end

function HomepetVo.getPetVigor(slot0)
	return slot0.vigor or 0
end

function HomepetVo.getPetVigorTime(slot0)
	if slot0.vigor_time == 0 then
		return 0
	end

	if slot0.vigor_time - GameNet:getInstance():getTime() < 0 then
		slot1 = 0
	end

	return slot1
end

function HomepetVo.__delete(slot0)
end
