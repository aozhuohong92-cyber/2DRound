LooksVo = LooksVo or BaseClass()

function LooksVo.__init(slot0)
	slot0.looks_type = 0
	slot0.looks_mode = 0
	slot0.looks_val = 0
	slot0.looks_str = ""
end

function LooksVo.setAntVo(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0:setAttrValue(slot5, slot6)
		end
	end
end

function LooksVo.setAttrValue(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end

function LooksVo.getAttr(slot0, slot1)
	return slot0[slot1]
end
