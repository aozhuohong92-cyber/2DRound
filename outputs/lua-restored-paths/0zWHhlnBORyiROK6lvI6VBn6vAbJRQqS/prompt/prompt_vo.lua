PromptVo = RoleVo or BaseClass(EventDispatcher)
PromptVo.UPDATE_SELF_EVENT = "PromptVo.UPDATE_SELF_EVENT"

function PromptVo.__init(slot0, slot1, slot2)
	slot0.list = {}
	slot0.type = slot1
	slot0.id = slot2
	slot0.auto_id = 0
	slot0.name = ""
	slot0.is_show_bubble = false
end

function PromptVo.update(slot0, slot1)
	slot0.auto_id = slot0.auto_id + 1

	if slot0.type == PromptTypeConst.BBS_message_reply then
		slot2, slot3, slot4, slot5, slot6 = slot0:getSridByData(slot1)
		slot0.name = (slot4 or TI18N("名字")) .. TI18N("回复了你")
	else
		slot0.name = Config.NoticeData.data_get[slot0.type].name
	end

	table.insert(slot0.list, {
		id = slot0.auto_id,
		data = slot1,
		time = GameNet:getInstance():getTime()
	})
	slot0:Fire(PromptVo.UPDATE_SELF_EVENT)
end

function PromptVo.removeDataById(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.list) do
		if slot6.id == slot1 then
			table.remove(slot0.list, slot5)
		end
	end

	slot0:Fire(PromptVo.UPDATE_SELF_EVENT)
end

function PromptVo.getNum(slot0)
	return #slot0.list
end

function PromptVo.setShowBubbleStatus(slot0, slot1)
	slot0.is_show_bubble = slot1
end

function PromptVo.getSridByData(slot0, slot1)
	slot2 = 0
	slot3 = ""
	slot4 = ""
	slot5 = 0

	if slot1 and slot1.arg_uint32 and #slot1.arg_uint32 > 0 then
		for slot9 = 1, #slot1.arg_uint32 do
			if slot1.arg_uint32[slot9] then
				if slot10.key == 1 then
					slot2 = slot10.value
				elseif slot10.key == 2 then
					slot5 = slot10.value
				end
			end
		end
	end

	if slot1 and slot1.arg_str and #slot1.arg_str > 0 then
		for slot9 = 1, #slot1.arg_str do
			if slot1.arg_str[slot9] then
				if slot10.key == 1 then
					slot3 = slot10.value
				elseif slot10.key == 2 then
					slot4 = slot10.value
				elseif slot10.key == 3 then
					guild_name = slot10.value
				end
			end
		end
	end

	return slot2, slot3, slot4, guild_name, slot5
end
