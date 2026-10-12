GlobalTimeTicket = GlobalTimeTicket or {}

function GlobalTimeTicket.getInstance(slot0)
	if not slot0.is_init then
		slot0.scheduler = cc.Director:getInstance():getScheduler()
		slot0.schedulers = {}
		slot0.is_init = true
		slot0.is_stop = nil
	end

	return slot0
end

function GlobalTimeTicket.add(slot0, slot1, slot2, slot3, slot4)
	if slot0.is_stop then
		return
	end

	slot4 = slot4 or autoId()

	if slot1 == nil or slot0.schedulers == nil or slot0.schedulers[slot4] ~= nil then
		return
	end

	slot3 = slot3 or 0
	slot0.schedulers[slot4] = slot0.scheduler:scheduleScriptFunc(function (slot0)
		if uv0.is_stop then
			return
		end

		if uv1 ~= nil then
			if uv2 == 1 then
				uv0:remove(uv3)
			elseif uv2 > 1 then
				uv2 = uv2 - 1
			end

			uv1(slot0)
		end
	end, slot2 or 1, false)

	return slot4
end

function GlobalTimeTicket.remove(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.schedulers[slot1] ~= nil then
		slot0.scheduler:unscheduleScriptEntry(slot2)

		slot0.schedulers[slot1] = nil
	end
end

function GlobalTimeTicket.removeAll(slot0)
	for slot4, slot5 in pairs(slot0.schedulers) do
		slot0.scheduler:unscheduleScriptEntry(slot5)
	end

	slot0.schedulers = {}
end

function GlobalTimeTicket.hasTicket(slot0, slot1)
	if slot0.schedulers[slot1] ~= nil then
		return true
	end

	return false
end

function GlobalTimeTicket.getSchedulers(slot0)
	return slot0.schedulers
end

function GlobalTimeTicket.stop(slot0)
	slot0.is_stop = true

	slot0:removeAll()
end
