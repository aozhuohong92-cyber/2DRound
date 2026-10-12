GlobalEvent = GlobalEvent or BaseClass()

function GlobalEvent.getInstance(slot0)
	if not slot0.is_init then
		slot0.event_list = {}
		slot0.is_deleted = false
		slot0.is_init = true
	end

	return slot0
end

function GlobalEvent.Bind(slot0, slot1, slot2)
	if slot1 == nil then
		print(debug.traceback())
		error("Try to bind to a nil event_id")

		return
	end

	if slot0.is_deleted then
		return
	end

	if slot0.event_list[slot1] == nil then
		slot0:CreateEvent(slot1)
	end

	return slot0.event_list[slot1]:Bind(slot2)
end

function GlobalEvent.CreateEvent(slot0, slot1)
	slot0.event_list[slot1] = CustomEvent.New(slot1)
end

function GlobalEvent.UnBind(slot0, slot1)
	if slot1 == nil or slot1.event_id == nil then
		error("Try to unbind a nil event_id")

		return
	end

	if slot0.is_deleted then
		return
	end

	if slot0.event_list[slot1.event_id] ~= nil then
		slot2:UnBind(slot1)
	end
end

function GlobalEvent.UnBindAll(slot0)
	for slot4, slot5 in pairs(slot0.event_list) do
		if slot0.event_list[slot5.event_id] ~= nil then
			slot6:UnBind(slot5)
		end

		slot5 = nil
	end
end

function GlobalEvent.UnBindMacro(slot0, slot1)
	if slot1 then
		slot0:UnBind(slot1)

		slot1 = nil
	end
end

function GlobalEvent.Fire(slot0, slot1, ...)
	if slot1 == nil then
		print(debug.traceback())
		error("Try to call Event:Fire() with a nil event_id")

		return
	end

	if slot0.is_deleted then
		return
	end

	if slot0.event_list[slot1] ~= nil then
		slot2:Fire({
			...
		})
	end
end

function GlobalEvent.__delete(slot0)
	if not slot0.is_deleted then
		slot0.is_deleted = true
	end
end
