BuffVo = BuffVo or BaseClass()

function BuffVo.__init(slot0)
	slot0.bid = 0
	slot0.duration = 0
	slot0.count = 0
	slot0.effect = {}
	slot0.exts = {}
end

function BuffVo.initVo(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			if slot5 ~= "effect" then
				if slot5 ~= "duration" then
					slot0:setBuffValue(slot5, slot6)
				else
					slot0.duration = slot6 + GameNet:getInstance():getTime()
				end
			else
				slot0:setBuffEffect(slot6)
			end
		end
	end
end

function BuffVo.setBuffEffect(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0.effect[slot6.key] = slot6.val
		end
	end
end

function BuffVo.getEffectNum(slot0)
	for slot5, slot6 in pairs(slot0.effect) do
		slot1 = 0 + 1
	end

	return slot1
end

function BuffVo.getBuffEffectByKey(slot0, slot1)
	slot2 = 0

	if slot0.effect then
		for slot6, slot7 in pairs(slot0.effect) do
			if slot6 == slot1 then
				slot2 = slot7

				break
			end
		end
	end

	return slot2
end

function BuffVo.setBuffValue(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end

function BuffVo.getBuffValue(slot0, slot1)
	return slot0[slot1]
end
