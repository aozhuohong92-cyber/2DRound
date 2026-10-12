ArenaLoopChallengeVo = ArenaLoopChallengeVo or BaseClass(EventDispatcher)

function ArenaLoopChallengeVo.__init(slot0)
	slot0.idx = 0
	slot0.rid = 0
	slot0.srv_id = ""
	slot0.name = ""
	slot0.lev = 0
	slot0.sex = 0
	slot0.face = 0
	slot0.power = 0
	slot0.score = 0
	slot0.get_score = 0
	slot0.status = 0
end

function ArenaLoopChallengeVo.updatetAttributeData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		if type(slot6) ~= "table" then
			slot0:setAttribute(slot5, slot6)
		end
	end
end

function ArenaLoopChallengeVo.setAttribute(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2

		slot0:dispatchUpdateAttrByKey(slot1, slot2)
	end
end

function ArenaLoopChallengeVo.dispatchUpdateAttrByKey(slot0, slot1, slot2)
	slot0:Fire(ArenaEvent.UpdateLoopChallengeListItem, slot1, slot2)
end
