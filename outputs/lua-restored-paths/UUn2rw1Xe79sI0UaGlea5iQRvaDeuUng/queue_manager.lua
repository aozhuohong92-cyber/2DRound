QueueManager = QueueManager or BaseClass()

function QueueManager.getInstance(slot0)
	if not slot0.is_init then
		slot0.require_list = {}
		slot0.finish_list = {}
		slot0.is_in_require = false
		slot0.is_init = true
	end

	return slot0
end

function QueueManager.add(slot0, slot1, slot2, slot3)
	if keyfind("id", slot1, slot0.finish_list) then
		if slot3 then
			slot3()
		end

		return
	end

	slot2 = slot2 or ""

	if #slot0.require_list == 0 then
		GlobalTimeTicket:getInstance():add(function ()
			uv0:doOne()
		end, 0.1, 0, "queueMgrTimer")

		slot0.is_in_require = true
	end

	table.insert(slot0.require_list, {
		id = slot1,
		call_back = slot3,
		type_name = slot2
	})
end

function QueueManager.remove(slot0, slot1, slot2)
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in pairs(slot0.finish_list) do
		if slot9.type_name == slot1 and slot2 then
			slot2(slot9)
		else
			table.insert(slot3, slot9)
		end
	end

	for slot8, slot9 in pairs(slot0.require_list) do
		if slot9.type_name ~= slot1 then
			table.insert(slot4, slot9)
		end
	end

	slot0.finish_list = slot3
	slot0.require_list = slot4

	slot0:isAllFinish()
end

function QueueManager.isAllFinish(slot0)
	slot0.finish_list = {}

	if #slot0.require_list == 0 and slot0.is_in_require then
		GlobalTimeTicket:getInstance():remove("queueMgrTimer")

		slot0.is_in_require = false
	end
end

function QueueManager.doOne(slot0)
	if #slot0.require_list > 0 then
		table.remove(slot0.require_list, 1)

		if slot0.require_list[1].call_back then
			slot1.call_back()
		end

		table.insert(slot0.finish_list, slot1)
		slot0:isAllFinish()
	else
		slot0:isAllFinish()
	end
end
