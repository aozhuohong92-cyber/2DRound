Config = Config or {}
Config.AttrData = Config.AttrData or {}
Config.AttrData.data_id_to_key_length = 29
Config.AttrData.data_id_to_key = {
	[113.0] = "crit_rate",
	[121.0] = "dam",
	[104.0] = "hp_max",
	[112.0] = "dodge_rate",
	[124.0] = "be_cure",
	[120.0] = "hp_max_per",
	[111.0] = "hit_rate",
	[126.0] = "dam_s",
	[119.0] = "def_per",
	[102.0] = "def_p",
	[127.0] = "res_p",
	[128.0] = "res_s",
	[118.0] = "atk_per",
	[103.0] = "def_s",
	[129.0] = "speed_per",
	[130.0] = "def_p_per",
	[117.0] = "tenacity",
	[125.0] = "dam_p",
	[131.0] = "def_s_per",
	[116.0] = "dodge_magic",
	[101.0] = "atk",
	[107.0] = "def",
	[115.0] = "hit_magic",
	[123.0] = "cure",
	[106.0] = "speed",
	[114.0] = "crit_ratio",
	[122.0] = "res",
	[105.0] = "hp",
	[132.0] = "toughness"
}

function Config.AttrData.data_id_to_key_fun(slot0)
	slot1 = Config.AttrData.data_id_to_key[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_id_to_key[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_key_to_id_length = 29
Config.AttrData.data_key_to_id = {
	crit_ratio = 114,
	def = 107,
	dodge_magic = 116,
	hp_max = 104,
	crit_rate = 113,
	def_p = 102,
	hp_max_per = 120,
	dam = 121,
	dodge_rate = 112,
	hit_rate = 111,
	def_s = 103,
	atk = 101,
	def_per = 119,
	def_s_per = 131,
	hit_magic = 115,
	tenacity = 117,
	dam_s = 126,
	speed_per = 129,
	res_s = 128,
	def_p_per = 130,
	atk_per = 118,
	be_cure = 124,
	dam_p = 125,
	res_p = 127,
	speed = 106,
	res = 122,
	hp = 105,
	toughness = 132,
	cure = 123
}

function Config.AttrData.data_key_to_id_fun(slot0)
	slot1 = Config.AttrData.data_key_to_id[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_key_to_id[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_id_to_name_length = 29
Config.AttrData.data_id_to_name = {
	[113.0] = "暴击率",
	[121.0] = "伤害加成",
	[104.0] = "生命",
	[112.0] = "闪躲",
	[124.0] = "受疗",
	[120.0] = "生命",
	[111.0] = "命中",
	[126.0] = "法伤",
	[119.0] = "防御",
	[102.0] = "物防",
	[127.0] = "物免",
	[128.0] = "法免",
	[118.0] = "攻击",
	[103.0] = "法防",
	[129.0] = "速度",
	[130.0] = "物防",
	[117.0] = "抗暴",
	[125.0] = "物伤",
	[131.0] = "法防",
	[116.0] = "抗控",
	[101.0] = "攻击",
	[107.0] = "防御",
	[115.0] = "控制",
	[123.0] = "治疗",
	[106.0] = "速度",
	[114.0] = "暴伤",
	[122.0] = "免伤",
	[105.0] = "生命",
	[132.0] = "韧性"
}

function Config.AttrData.data_id_to_name_fun(slot0)
	slot1 = Config.AttrData.data_id_to_name[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_id_to_name[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_key_to_name_length = 29
Config.AttrData.data_key_to_name = {
	crit_ratio = "暴伤",
	def = "防御",
	dodge_magic = "抗控",
	hp_max = "生命",
	crit_rate = "暴击率",
	def_p = "物防",
	hp_max_per = "生命",
	dam = "伤害加成",
	dodge_rate = "闪躲",
	hit_rate = "命中",
	def_s = "法防",
	atk = "攻击",
	def_per = "防御",
	def_s_per = "法防",
	hit_magic = "控制",
	tenacity = "抗暴",
	dam_s = "法伤",
	speed_per = "速度",
	res_s = "法免",
	def_p_per = "物防",
	atk_per = "攻击",
	be_cure = "受疗",
	dam_p = "物伤",
	res_p = "物免",
	speed = "速度",
	res = "免伤",
	hp = "生命",
	toughness = "韧性",
	cure = "治疗"
}

function Config.AttrData.data_key_to_name_fun(slot0)
	slot1 = Config.AttrData.data_key_to_name[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_key_to_name[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_power_length = 29
Config.AttrData.data_power = {
	atk = {
		power = 2000,
		not_to_power = 0
	},
	def_p = {
		power = 0,
		not_to_power = 0
	},
	def_s = {
		power = 0,
		not_to_power = 0
	},
	hp_max = {
		power = 400,
		not_to_power = 0
	},
	hp = {
		power = 0,
		not_to_power = 0
	},
	speed = {
		power = 6400,
		not_to_power = 0
	},
	def = {
		power = 2658,
		not_to_power = 0
	},
	hit_rate = {
		power = 0,
		not_to_power = 0
	},
	dodge_rate = {
		power = 0,
		not_to_power = 0
	},
	crit_rate = {
		power = 14000,
		not_to_power = 0
	},
	crit_ratio = {
		power = 20000,
		not_to_power = 1500
	},
	hit_magic = {
		power = 8000,
		not_to_power = 0
	},
	dodge_magic = {
		power = 8000,
		not_to_power = 0
	},
	tenacity = {
		power = 14000,
		not_to_power = 0
	},
	atk_per = {
		power = 0,
		not_to_power = 0
	},
	def_per = {
		power = 0,
		not_to_power = 0
	},
	hp_max_per = {
		power = 0,
		not_to_power = 0
	},
	dam = {
		power = 18000,
		not_to_power = 0
	},
	res = {
		power = 18000,
		not_to_power = 0
	},
	cure = {
		power = 0,
		not_to_power = 0
	},
	be_cure = {
		power = 0,
		not_to_power = 0
	},
	dam_p = {
		power = 0,
		not_to_power = 0
	},
	dam_s = {
		power = 0,
		not_to_power = 0
	},
	res_p = {
		power = 18000,
		not_to_power = 0
	},
	res_s = {
		power = 18000,
		not_to_power = 0
	},
	speed_per = {
		power = 0,
		not_to_power = 0
	},
	def_p_per = {
		power = 0,
		not_to_power = 0
	},
	def_s_per = {
		power = 0,
		not_to_power = 0
	},
	toughness = {
		power = 0,
		not_to_power = 0
	}
}

function Config.AttrData.data_power_fun(slot0)
	slot1 = Config.AttrData.data_power[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_power[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_type_length = 29
Config.AttrData.data_type = {
	crit_ratio = 2,
	def = 1,
	dodge_magic = 2,
	hp_max = 1,
	crit_rate = 2,
	def_p = 1,
	hp_max_per = 2,
	dam = 2,
	dodge_rate = 2,
	hit_rate = 2,
	def_s = 1,
	atk = 1,
	def_per = 2,
	def_s_per = 2,
	hit_magic = 2,
	tenacity = 2,
	dam_s = 2,
	speed_per = 2,
	res_s = 2,
	def_p_per = 2,
	atk_per = 2,
	be_cure = 2,
	dam_p = 2,
	res_p = 2,
	speed = 1,
	res = 2,
	hp = 1,
	toughness = 2,
	cure = 2
}

function Config.AttrData.data_type_fun(slot0)
	slot1 = Config.AttrData.data_type[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_type[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_partner_power_length = 29
Config.AttrData.data_partner_power = {
	crit_ratio = 20000,
	def = 2658,
	dodge_magic = 8000,
	hp_max = 400,
	crit_rate = 14000,
	def_p = 0,
	hp_max_per = 0,
	dam = 18000,
	dodge_rate = 0,
	hit_rate = 0,
	def_s = 0,
	atk = 2000,
	def_per = 0,
	def_s_per = 0,
	hit_magic = 8000,
	tenacity = 14000,
	dam_s = 0,
	speed_per = 0,
	res_s = 18000,
	def_p_per = 0,
	atk_per = 0,
	be_cure = 0,
	dam_p = 0,
	res_p = 18000,
	speed = 6400,
	res = 18000,
	hp = 0,
	toughness = 0,
	cure = 0
}

function Config.AttrData.data_partner_power_fun(slot0)
	slot1 = Config.AttrData.data_partner_power[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_partner_power[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.AttrData.data_is_show_length = 14
Config.AttrData.data_is_show = {
	crit_ratio = 1,
	def = 1,
	dodge_magic = 1,
	hp_max = 1,
	atk_per = 1,
	atk = 1,
	def_p = 1,
	hp_max_per = 1,
	speed = 1,
	def_s = 1,
	crit_rate = 1,
	def_per = 1,
	hit_magic = 1,
	tenacity = 1
}

function Config.AttrData.data_is_show_fun(slot0)
	slot1 = Config.AttrData.data_is_show[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.AttrData.data_is_show[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
