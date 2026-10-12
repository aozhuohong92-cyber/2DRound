function ccui.Widget.onTouch(slot0, slot1)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == 0 then
			-- Nothing
		elseif slot1 == 1 then
			slot2.name = "moved"
		elseif slot1 == 2 then
			slot2.name = "ended"
		else
			slot2.name = "cancelled"
		end

		uv0({
			x = 0,
			y = 0,
			name = "began",
			target = slot0
		})
	end)

	return slot0
end
