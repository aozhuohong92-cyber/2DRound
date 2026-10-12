Config = Config or {}
Config.ItemData4 = Config.ItemData4 or {}
Config.ItemData4.data_unit_length = 0
Config.ItemData4.data_unit_cache = {}

function Config.ItemData4.data_unit(slot0)
	if Config.ItemData4.data_unit_cache[slot0] == nil then
		if not Config.ItemData4.data_unit_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.ItemData4.data_unit_cache[slot0] = {
			id = slot1[1],
			name = slot1[2],
			icon = slot1[3],
			type = slot1[4],
			sub_type = slot1[5],
			quality = slot1[6],
			overlap = slot1[7],
			gain_type = slot1[8],
			use_type = slot1[9],
			value = slot1[10],
			desc = slot1[11],
			lev = slot1[12],
			career = slot1[13],
			eqm_set = slot1[14],
			ext = slot1[15],
			is_effect = slot1[16],
			tips_btn = slot1[17],
			source = slot1[18],
			type_desc = slot1[19],
			can_share = slot1[20]
		}
	end

	return Config.ItemData4.data_unit_cache[slot0]
end

Config.ItemData4.data_unit_table = {}
