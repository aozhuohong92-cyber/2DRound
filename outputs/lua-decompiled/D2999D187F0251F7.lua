ForLoop = ForLoop or BaseClass()

function ForLoop.__init(slot0, slot1, slot2)
	slot1 = slot1 or {}
	slot0._speed = slot1.speed or 0.16666666666666666
	slot0._way = slot1.way or 1
	slot0._body_func = slot2
end

function ForLoop.start(slot0, slot1, slot2)
	slot0._start_id = slot1
	slot0._end_id = slot2

	slot0:launch()
end

function ForLoop.stop(slot0)
	slot0:pause()
end

function ForLoop.setLoopBody(slot0, slot1)
	slot0._body_func = slot1
end

function ForLoop.launch(slot0)
	if not slot0._running then
		slot0._running = true
		slot0._ticket_name = GlobalTimeTicket:getInstance():add(function ()
			uv0:push()
		end, slot0._speed)
	end
end

function ForLoop.pause(slot0)
	if slot0._running then
		slot0._running = nil

		if slot0._ticket_name then
			GlobalTimeTicket:getInstance():remove(slot0._ticket_name)

			slot0._ticket_name = nil
		end
	end
end

function ForLoop.setWay(slot0, slot1)
	slot0._way = slot1
end

function ForLoop.push(slot0)
	if not slot0._start_id or not slot0._end_id then
		return
	end

	if slot0._way == 1 then
		if slot0._start_id <= slot0._end_id then
			slot0._body_func(slot0._start_id)

			slot0._start_id = slot0._start_id + 1
		else
			slot0:pause()
		end
	elseif slot0._start_id >= 0 then
		slot0._body_func(slot0._start_id)

		slot0._start_id = slot0._start_id - 1
	else
		slot0:pause()
	end
end

function ForLoop.isRunning(slot0)
	return slot0._running
end

function ForLoop.__delete(slot0)
	slot0:stop()
end
