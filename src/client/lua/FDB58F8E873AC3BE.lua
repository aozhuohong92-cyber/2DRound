GlobalKeybordEvent = GlobalKeybordEvent or BaseClass()

function GlobalKeybordEvent.getInstance(slot0)
	if not slot0.is_init then
		slot0.event_list = {}
		slot0.is_init = true
		slot0.keydown_list = {}
		slot0.keyup_list = {}
		slot3 = cc.EventListenerKeyboard:create()

		slot3:registerScriptHandler(function (slot0, slot1)
			uv0:onKeyPressed(slot0)

			if not uv0.keyCode then
				uv0.keyCode = slot0
			end

			if DEBUG_MODE then
				print("按了", slot0)
			end
		end, cc.Handler.EVENT_KEYBOARD_PRESSED)
		slot3:registerScriptHandler(function (slot0, slot1)
			if DEBUG_MODE then
				print("松开", slot0)
			end

			if uv0.keyCode == slot0 then
				uv0.keyCode = nil
			end

			uv0:onKeyReleased(slot0)
		end, cc.Handler.EVENT_KEYBOARD_RELEASED)
		cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(slot3, ViewManager:getInstance():getLayerByTag(ViewMgrTag.WIN_TAG))
	end

	return slot0
end

function GlobalKeybordEvent.add(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == nil then
		return
	end

	slot5 = slot5 or autoId()
	slot0.event_list[slot5] = {
		call_back = slot1,
		limit_time = slot4 or 1,
		type = slot2 or cc.Handler.EVENT_KEYBOARD_PRESSED,
		keycode = slot3 or cc.Handler.EVENT_CONTROLLER_KEYUP
	}

	return slot5
end

function GlobalKeybordEvent.remove(slot0, slot1)
	slot0.event_list[slot1] = nil
end

function GlobalKeybordEvent.inKeyCode(slot0, slot1)
	return slot0.keyCode == slot1
end

function GlobalKeybordEvent.onKeyPressed(slot0, slot1)
	for slot5, slot6 in pairs(slot0.event_list) do
		if slot6.type == cc.Handler.EVENT_KEYBOARD_PRESSED and slot1 == slot6.keycode then
			slot6.call_back()

			if slot6.limit_time == 0 then
				-- Nothing
			elseif slot6.limit_time == 1 then
				slot0.event_list[slot5] = nil
			elseif slot6.limit_time > 1 then
				slot6.limit_time = slot6.limit_time - 1
			end
		end
	end
end

function GlobalKeybordEvent.onKeyReleased(slot0, slot1)
	for slot5, slot6 in pairs(slot0.event_list) do
		if slot6.type == cc.Handler.EVENT_KEYBOARD_RELEASED and slot1 == slot6.keycode then
			slot6.call_back()

			if slot6.limit_time == 0 then
				-- Nothing
			elseif slot6.limit_time == 1 then
				slot0.event_list[slot5] = nil
			elseif slot6.limit_time > 1 then
				slot6.limit_time = slot6.limit_time - 1
			end
		end
	end
end
