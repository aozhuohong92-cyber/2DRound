BattleLoop2 = BattleLoop2 or {}
BattleLoop2.talk_cd = 0
BattleLoop2.next_target_type_pos = 1
BattleLoop2.next_target_type_kill = 2
slot0 = {
	1,
	2,
	3,
	1,
	2,
	3,
	1,
	2,
	3
}
slot1 = {
	{
		1,
		4,
		7
	},
	{
		2,
		5,
		8
	},
	{
		3,
		6,
		9
	}
}

function BattleLoop2.init(slot0)
	BattleLoop2.idx = 0
	BattleLoop2.data = slot0
	BattleLoop2.a_objects = {}
	BattleLoop2.target_objects = {}
	BattleLoop2.icon_res_list = {
		5,
		2,
		7
	}
	BattleLoop2.icon_idx = 0

	BattleLoop2.randWaveTargets()

	BattleLoop2.b_formation_type = slot0.b_formation_type or 1
	BattleLoop2.now_num = 0
	BattleLoop2.max_num = math.min(#slot0.partner_list, 3)
	BattleLoop2.needPlays = {}
	BattleLoop2.last_pos = 0
	BattleLoop2.last_time = 0
	BattleLoop2.a_col = {}
	BattleLoop2.target_play = {}
	BattleLoop2.cd_time = 1

	if #slot0.partner_list < 2 then
		BattleLoop2.cd_time = 2
	end

	BattleLoop2.talk_list = (Config.DungeonData.data_drama_dungeon_info(slot0.dun_bid) or {}).talk_ids or {}
	slot2 = {
		objects = {},
		target_list = {},
		comabt_type = slot0.combat_type
	}

	for slot6, slot7 in ipairs(slot0.partner_list) do
		slot7.playing = 0
		BattleLoop2.a_objects[slot6] = slot7
		slot2.objects[slot6] = {
			group = 1,
			object_type = 2,
			pos = slot7.pos,
			bid = slot7.bid,
			star = slot7.star,
			hp = slot7.hp,
			hp_max = slot7.hp,
			skill_list = {},
			fashion = slot7.use_skin
		}
		BattleLoop2.a_col[slot8] = BattleLoop2.a_col[uv0[slot7.pos]] or {
			enum = 0,
			rnum = 0
		}
		BattleLoop2.a_col[slot8].rnum = BattleLoop2.a_col[slot8].rnum + 1
		BattleLoop2.a_col[slot8][slot7.pos] = slot6

		for slot12, slot13 in ipairs(slot7.skill_list) do
			table.insert(slot2.objects[slot6].skill_list, slot13.sid)
		end
	end

	slot2.target_list[1] = BattleLoop2.nextTarget()

	return slot2
end

function BattleLoop2.nextTarget(slot0)
	slot1 = os.time()

	if BattleLoop2.max_num <= BattleLoop2.now_num then
		return
	end

	if BattleLoop2.now_num > 0 and slot1 - BattleLoop2.last_time < BattleLoop2.cd_time then
		return
	end

	slot3 = {}
	slot4, slot5 = nil

	for slot9 = 1, 9 do
		slot5 = uv0[slot9]

		if BattleLoop2.target_objects[slot9 + GIRD_POS_OFFSET] == nil and BattleLoop2.a_col[slot5] ~= nil and BattleLoop2.last_pos ~= slot4 and BattleLoop2.a_col[slot5].enum < BattleLoop2.a_col[slot5].rnum then
			table.insert({}, slot4)

			if uv0[BattleLoop2.last_pos - GIRD_POS_OFFSET] ~= slot5 then
				table.insert(slot3, slot4)
			end
		end
	end

	if next(slot3) then
		slot2 = slot3
	end

	if next(slot2) then
		slot4 = BattleLoop2.rand_item(slot2)
		slot5 = uv0[slot4 - GIRD_POS_OFFSET]
		BattleLoop2.a_col[slot5].enum = BattleLoop2.a_col[slot5].enum + 1
		slot6 = BattleLoop2.rand_item(BattleLoop2.b_objects)
		BattleLoop2.target_objects[slot4] = slot6
		BattleLoop2.needPlays[slot4] = true
		BattleLoop2.last_pos = slot4
		BattleLoop2.last_time = slot1
		BattleLoop2.icon_idx = BattleLoop2.icon_idx % #BattleLoop2.icon_res_list + 1
		BattleLoop2.now_num = BattleLoop2.now_num + 1
		slot8 = BattleLoop2.init_play(slot4)
		BattleLoop2.target_play[slot4] = slot8

		return {
			group = 2,
			object_type = 3,
			pos = slot4,
			bid = slot6.bid,
			star = slot6.star,
			hp_max = slot6.hp,
			hp = slot6.hp,
			skill_list = {},
			icon = BattleLoop2.icon_res_list[BattleLoop2.icon_idx],
			actor = slot8.actor,
			effect_bid = slot8.effect_bid
		}
	end
end

function BattleLoop2.init_play(slot0)
	if BattleLoop2.target_objects[slot0] == nil or BattleLoop2.needPlays[slot0] ~= true then
		return
	end

	slot2 = BattleLoop2.selectActor(slot0)
	BattleLoop2.needPlays[slot0] = slot2
	slot3 = BattleLoop2.a_objects[slot2]
	slot3.playing = slot3.playing + 1
	slot4 = BattleLoop2.rand_item_by_key(slot3.skill_list, "rand")
	slot5 = {
		skill_plays = {},
		actor = slot3.pos,
		target = slot0,
		skill_bid = slot4.sid,
		effect_bid = slot16.eid
	}
	slot7 = 1
	slot8, slot9 = BattleLoop2.rand_talk()
	slot10 = {
		order = 1,
		bid = slot3.bid,
		actor = slot3.pos,
		target = slot0,
		skill_bid = slot4.sid,
		effect_play = {},
		talk_pos = slot8,
		talk_content = slot9
	}
	slot11 = slot1.hp

	for slot15, slot16 in pairs(slot4.effect_list) do
		slot18 = 0

		if math.random(0, 1000) < slot3.crit then
			slot17 = math.ceil(math.random(slot16.min_hurt, slot16.max_hurt) * 1.5)
			slot18 = 1
		end

		slot19 = slot17

		if slot15 < #slot4.effect_list then
			slot19 = math.ceil(math.min(slot17, slot11) / #slot4.effect_list)
		end

		table.insert(slot10.effect_play, {
			order = slot7,
			actor = slot3.pos,
			target = slot0,
			effect_bid = slot16.eid,
			hp = math.max(slot11 - slot19),
			hurt = -slot17,
			is_crit = slot18
		})

		slot7 = slot7 + 1
	end

	table.insert(slot5.skill_plays, slot10)

	return slot5
end

function BattleLoop2.play(slot0)
	BattleLoop2.target_play[slot0] = nil

	return BattleLoop2.target_play[slot0]
end

function BattleLoop2.selectActor(slot0)
	slot2 = uv0[slot0 - GIRD_POS_OFFSET]

	for slot10, slot11 in pairs(uv1[slot2]) do
		if BattleLoop2.a_col[slot2][slot11] then
			slot6 = nil or slot5

			if BattleLoop2.a_objects[slot5].playing == 0 then
				return slot5
			end
		end
	end

	return slot6
end

function BattleLoop2.playEnd(slot0)
	if BattleLoop2.needPlays[slot0] then
		slot2 = BattleLoop2.a_objects[slot1]
		slot2.playing = slot2.playing - 1
	end

	BattleLoop2.needPlays[slot0] = nil
	BattleLoop2.target_objects[slot0] = nil
	BattleLoop2.now_num = BattleLoop2.now_num - 1

	if BattleLoop2.a_col[uv0[slot0 - GIRD_POS_OFFSET]] then
		BattleLoop2.a_col[slot2].enum = BattleLoop2.a_col[slot2].enum - 1
	end
end

function BattleLoop2.rand_talk()
	BattleLoop2.talk_cd = BattleLoop2.talk_cd - 1

	if BattleLoop2.talk_cd > 0 then
		return nil
	end

	if BattleLoop2.rand_item_by_key2(BattleLoop2.talk_list, 2, 10000) and slot0[1] then
		BattleLoop2.talk_cd = 5

		return BattleLoop2.rand_item(BattleLoop2.a_objects).pos, Config.DungeonData.data_drama_talk[slot0[1]]
	end
end

function BattleLoop2.randWaveTargets()
	if BattleLoop2.idx % 10 == 0 and BattleLoop2.data and next(BattleLoop2.data.wave_list) ~= nil then
		BattleLoop2.b_objects = BattleLoop2.rand_item(BattleLoop2.data.wave_list).unit_list
	end

	BattleLoop2.idx = BattleLoop2.idx + 1
end

function BattleLoop2.rand_item(slot0)
	return slot0[math.random(#slot0)]
end

function BattleLoop2.rand_item_by_key(slot0, slot1)
	for slot6, slot7 in pairs(slot0) do
		slot2 = 0 + slot7[slot1]
	end

	return BattleLoop2.rand_item_by_key2(slot0, slot1, slot2)
end

function BattleLoop2.rand_item_by_key2(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot0) do
		if math.random(1, slot2) >= slot2 - slot8[slot1] then
			return slot8
		end
	end

	return nil
end
