Config = Config or {}
Config.ItemData10 = Config.ItemData10 or {}
Config.ItemData10.data_unit_length = 1
Config.ItemData10.data_unit_cache = {}

function Config.ItemData10.data_unit(slot0)
	if Config.ItemData10.data_unit_cache[slot0] == nil then
		if not Config.ItemData10.data_unit_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.ItemData10.data_unit_cache[slot0] = {
			id = slot1[1],
			name = slot1[2],
			icon = slot1[3],
			type = slot1[4],
			sub_type = slot1[5],
			quality = slot1[6],
			overlap = slot1[7],
			gain_type = slot1[8],
			use_type = slot1[9],
			expire_type = slot1[10],
			value = slot1[11],
			effect = slot1[12],
			client_effect = slot1[13],
			source = slot1[14],
			desc = slot1[15],
			lev = slot1[16],
			career = slot1[17],
			sex = slot1[18],
			ext = slot1[19],
			is_effect = slot1[20],
			eqm_jie = slot1[21],
			fast_use = slot1[22],
			tips_btn = slot1[23],
			type_desc = slot1[24],
			use_desc = slot1[25],
			can_share = slot1[26],
			use_count = slot1[27]
		}
	end

	return Config.ItemData10.data_unit_cache[slot0]
end

Config.ItemData10.data_unit_table = {
	[300001.0] = "{300001, \"木锤\", 300001, 0, 0, 2, 99, 0, 0, 0, {}, {}, {}, {}, \"坚硬的木锤，能破坏某些障碍物。\", 0, 0, 2, {}, 0, 0, 0, {}, \"位面征战道具\", \"位面征战玩法中消耗\", 0, 0}"
}
