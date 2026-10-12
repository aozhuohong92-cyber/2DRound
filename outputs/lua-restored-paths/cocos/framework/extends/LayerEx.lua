slot0 = cc.Layer

function slot0.onTouch(slot0, slot1, slot2, slot3)
	if type(slot2) ~= "boolean" then
		slot2 = false
	end

	if type(slot3) ~= "boolean" then
		slot3 = false
	end

	slot0:registerScriptTouchHandler(function (slot0, ...)
		slot1 = {
			...
		}

		if uv0 then
			for slot7 = 1, #slot1[1], 3 do
				slot10 = slot1[slot7 + 2]
			end

			slot2.points = {
				[slot10] = {
					x = slot1[slot7],
					y = slot1[slot7 + 1],
					id = slot10
				}
			}
		else
			slot2.x = slot1[1]
			slot2.y = slot1[2]
		end

		return uv1({
			name = slot0
		})
	end, slot2, 0, slot3)
	slot0:setTouchEnabled(true)

	return slot0
end

function slot0.removeTouch(slot0)
	slot0:unregisterScriptTouchHandler()
	slot0:setTouchEnabled(false)

	return slot0
end

function slot0.onKeypad(slot0, slot1)
	slot0:registerScriptKeypadHandler(slot1)
	slot0:setKeyboardEnabled(true)

	return slot0
end

function slot0.removeKeypad(slot0)
	slot0:unregisterScriptKeypadHandler()
	slot0:setKeyboardEnabled(false)

	return slot0
end

function slot0.onAccelerate(slot0, slot1)
	slot0:registerScriptAccelerateHandler(slot1)
	slot0:setAccelerometerEnabled(true)

	return slot0
end

function slot0.removeAccelerate(slot0)
	slot0:unregisterScriptAccelerateHandler()
	slot0:setAccelerometerEnabled(false)

	return slot0
end
