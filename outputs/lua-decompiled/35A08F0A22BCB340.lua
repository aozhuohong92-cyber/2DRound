PromptModel = PromptModel or BaseClass()

function PromptModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PromptModel.config(slot0)
	slot0.prompt_list = {}
	slot0.auto_id = 0
end

function PromptModel.checkIsInList(slot0, slot1, slot2, slot3)
	for slot7, slot8 in ipairs(slot0.prompt_list) do
		if slot8.type == slot1 then
			for slot12, slot13 in pairs(slot8.list) do
				slot14, slot15, slot16 = slot8:getSridByData(slot13.data)

				if getNorKey(slot14, slot15) == getNorKey(slot2, slot3) then
					return true
				end
			end
		end
	end

	return false
end

function PromptModel.getPromptVoByType(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.prompt_list) do
		if slot6.type == slot1 then
			return slot6
		end
	end
end

function PromptModel.addPromptData(slot0, slot1)
	if Config.NoticeData.data_get[slot1.type] == nil then
		print("==============> 添加小图标失败, 未配置该小图标数据, 类型为 ", slot1.type)

		return
	end

	slot3 = nil
	slot4, slot5 = slot0:getSridByData(slot1)

	if slot0:checkIsInList(slot1.type, slot4, slot5) == true then
		return
	end

	slot0.auto_id = slot0.auto_id + 1

	if slot2.can_overly == 1 then
		if slot0:getPromptVoByType(slot1.type) == nil then
			table.insert(slot0.prompt_list, PromptVo.New(slot1.type, slot0.auto_id))
		end

		slot3:update(slot1)
	else
		slot3 = PromptVo.New(slot1.type, slot0.auto_id)

		slot3:update(slot1)
		table.insert(slot0.prompt_list, slot3)
	end

	GlobalEvent:getInstance():Fire(PromptEvent.ADD_PROMPT_DATA, slot3)
end

function PromptModel.getSridByData(slot0, slot1)
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
				end
			end
		end
	end

	return slot2, slot3, slot4, slot5
end

function PromptModel.removePromptData(slot0, slot1, slot2)
	if #slot0.prompt_list > 0 then
		for slot6, slot7 in ipairs(slot0.prompt_list) do
			if slot7.type == slot1 and slot7.id == slot2 then
				table.remove(slot0.prompt_list, slot6)

				break
			end
		end

		GlobalEvent:getInstance():Fire(PromptEvent.REMOVE_PROMPT_DATA)
	end
end

function PromptModel.removePromptDataByTpye(slot0, slot1)
	if #slot0.prompt_list > 0 then
		for slot5, slot6 in ipairs(slot0.prompt_list) do
			if slot6.type == slot1 then
				table.remove(slot0.prompt_list, slot5)

				break
			end
		end

		GlobalEvent:getInstance():Fire(PromptEvent.REMOVE_PROMPT_DATA)
	end
end

function PromptModel.checkPromptDataByTpye(slot0, slot1)
	if #slot0.prompt_list > 0 then
		for slot5, slot6 in ipairs(slot0.prompt_list) do
			if slot6.type == slot1 then
				return true
			end
		end
	end

	return false
end

function PromptModel.removePromptDataByInfo(slot0, slot1, slot2, slot3)
end

function PromptModel.getPromptList(slot0)
	return slot0.prompt_list
end

function PromptModel.getNotBubblePrompt(slot0)
	for slot4, slot5 in pairs(slot0.prompt_list) do
		if slot5.is_show_bubble == false then
			return slot5
		end
	end
end

function PromptModel.__delete(slot0)
end
