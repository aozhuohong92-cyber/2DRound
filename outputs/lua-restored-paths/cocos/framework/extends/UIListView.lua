slot0 = ccui.ListView

function slot0.onEvent(slot0, slot1)
	slot0:addEventListener(function (slot0, slot1)
		if slot1 == 0 then
			-- Nothing
		else
			slot2.name = "ON_SELECTED_ITEM_END"
		end

		uv0({
			name = "ON_SELECTED_ITEM_START",
			target = slot0
		})
	end)

	return slot0
end

function slot0.onScroll(slot0, slot1)
	slot0:addScrollViewEventListener(function (slot0, slot1)
		if slot1 == 0 then
			-- Nothing
		elseif slot1 == 1 then
			slot2.name = "SCROLL_TO_BOTTOM"
		elseif slot1 == 2 then
			slot2.name = "SCROLL_TO_LEFT"
		elseif slot1 == 3 then
			slot2.name = "SCROLL_TO_RIGHT"
		elseif slot1 == 4 then
			slot2.name = "SCROLLING"
		elseif slot1 == 5 then
			slot2.name = "BOUNCE_TOP"
		elseif slot1 == 6 then
			slot2.name = "BOUNCE_BOTTOM"
		elseif slot1 == 7 then
			slot2.name = "BOUNCE_LEFT"
		elseif slot1 == 8 then
			slot2.name = "BOUNCE_RIGHT"
		elseif slot1 == 9 then
			slot2.name = "CONTAINER_MOVED"
		elseif slot1 == 10 then
			slot2.name = "AUTOSCROLL_ENDED"
		end

		uv0({
			name = "SCROLL_TO_TOP",
			target = slot0
		})
	end)

	return slot0
end
