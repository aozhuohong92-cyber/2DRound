_inner_event_connection_obj = _inner_event_connection_obj or {}
CustomEvent = CustomEvent or BaseClass()

function CustomEvent.__init(slot0, slot1)
	slot0.event_id = slot1
	slot0.bind_id_count = 0
	slot0.event_func_list = {}
end

function CustomEvent.Fire(slot0, slot1)
	for slot5, slot6 in pairs(slot0.event_func_list) do
		slot6(unpack(slot1))
	end
end

function CustomEvent.UnBind(slot0, slot1)
	if getmetatable(slot1) == _inner_event_connection_obj and slot1.event_id == slot0.event_id then
		slot0.event_func_list[slot1.bind_id] = nil
	end
end

function CustomEvent.Bind(slot0, slot1)
	slot0.bind_id_count = slot0.bind_id_count + 1
	slot2 = {}

	setmetatable(slot2, _inner_event_connection_obj)

	slot2.event_id = slot0.event_id
	slot2.bind_id = slot0.bind_id_count
	slot0.event_func_list[slot2.bind_id] = slot1

	return slot2
end

_inner_event_system_list = _inner_event_system_list or {}
_inner_event_system_id_count = _inner_event_system_id_count or 0
EventSystem = EventSystem or BaseClass()

function EventSystem.__init(slot0)
	_inner_event_system_id_count = _inner_event_system_id_count + 1
	slot0.system_id = _inner_event_system_id_count
	_inner_event_system_list[slot0.system_id] = slot0
	slot0.need_fire_events = List.New()
	slot0.event_list = {}
	slot0.delay_handle_list = {}
	slot0.delay_id_count = 0
	slot0.is_deleted = false
end

function EventSystem.Update(slot0)
	while not List.Empty(slot0.need_fire_events) do
		slot1 = List.PopFront(slot0.need_fire_events)

		slot1.event:Fire(slot1.arg_list)
	end
end

function EventSystem.Bind(slot0, slot1, slot2)
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

function EventSystem.UnBind(slot0, slot1)
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

function EventSystem.Fire(slot0, slot1, ...)
	if slot1 == nil then
		error("Try to call EventSystem:Fire() with a nil event_id")

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

function EventSystem.FireNextFrame(slot0, slot1, ...)
	if slot1 == nil then
		error("Try to call EventSystem:FireNextFrame() with a nil event_id")

		return
	end

	if slot0.is_deleted then
		return
	end

	if slot0.event_list[slot1] ~= nil then
		List.PushBack(slot0.need_fire_events, {
			event = slot2,
			arg_list = {
				...
			}
		})
	end
end

function EventSystem.CreateEvent(slot0, slot1)
	slot0.event_list[slot1] = CustomEvent.New(slot1)
end

function EventSystem.__delete(slot0)
	if not slot0.is_deleted then
		_inner_event_system_list[slot0.system_id] = nil
		slot0.is_deleted = true
	end
end

EventDispatcher = EventDispatcher or BaseClass()

function EventDispatcher.__init(slot0)
	slot0.eventSys = EventSystem.New()
end

function EventDispatcher.Bind(slot0, slot1, slot2)
	return slot0.eventSys:Bind(slot1, slot2)
end

function EventDispatcher.UnBind(slot0, slot1)
	slot0.eventSys:UnBind(slot1)
end

function EventDispatcher.Fire(slot0, slot1, ...)
	slot0.eventSys:Fire(slot1, ...)
end
