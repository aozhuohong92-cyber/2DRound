ArenaChampionInfoVo = ArenaChampionInfoVo or BaseClass(EventDispatcher)

function ArenaChampionInfoVo.__init(slot0)
	slot0.step = 0
	slot0.round = 0
	slot0.a_bet = 0
	slot0.a_rid = 0
	slot0.a_srv_id = 0
	slot0.a_name = ""
	slot0.a_lev = 0
	slot0.a_face = 0
	slot0.a_avatar_id = 0
	slot0.a_sex = 0
	slot0.a_power = 0
	slot0.a_formation_type = 0
	slot0.a_formation_lev = 0
	slot0.a_plist = {}
	slot0.b_bet = 0
	slot0.b_rid = 0
	slot0.b_srv_id = 0
	slot0.b_name = ""
	slot0.b_lev = 0
	slot0.b_face = 0
	slot0.b_avatar_id = 0
	slot0.b_sex = 0
	slot0.b_power = 0
	slot0.b_formation_type = 0
	slot0.b_formation_lev = 0
	slot0.b_plist = {}
	slot0.ret = 0
	slot0.replay_id = 0
end

function ArenaChampionInfoVo.updateData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0:setSingleInfo(slot5, slot6)
		else
			slot0[slot5] = slot6
		end
	end
end

function ArenaChampionInfoVo.setSingleInfo(slot0, slot1, slot2)
	if slot0[slot1] ~= slot2 then
		slot0[slot1] = slot2
	end
end
