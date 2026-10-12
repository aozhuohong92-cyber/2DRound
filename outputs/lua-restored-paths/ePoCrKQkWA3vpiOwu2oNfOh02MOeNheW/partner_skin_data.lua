Config = Config or {}
Config.PartnerSkinData = Config.PartnerSkinData or {}
Config.PartnerSkinData.data_const_length = 2
Config.PartnerSkinData.data_const = {
	skin_open = {
		desc = "玩家35级开启皮肤系统",
		val = {
			"lev",
			35
		}
	},
	skin_tip = {
		desc = "请注意，伙伴技能等级达到5级以后，技能的转换才会生效！",
		val = {
			"lev",
			35
		}
	}
}

function Config.PartnerSkinData.data_const_fun(slot0)
	slot1 = Config.PartnerSkinData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkinData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkinData.data_skin_info_length = 160
Config.PartnerSkinData.data_skin_info = {
	[107] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 107,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 1,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 117,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv1",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23019,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[117] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 117,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 2,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 127,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv2",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23019,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[127] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 127,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 3,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 137,
		chip_num = 100,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv3",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23019,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				2500
			}
		}
	},
	[137] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 137,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 4,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 147,
		chip_num = 100,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv4",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23019,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				2500
			}
		}
	},
	[147] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 147,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 5,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 157,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv5",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23019,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[157] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 157,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 6,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 167,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv6",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23019,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[167] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 167,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 7,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 177,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv7",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23019,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[177] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 177,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 8,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 187,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv8",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23019,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[187] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 187,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 9,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 197,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv9",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23019,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[197] = {
		draw_res = "anyingbaojun",
		head_card_id = 2007,
		skin_id = 197,
		voice = "d_voice_50504",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50006",
		bid = 50504,
		fight_effect = "E25107",
		voice_time = 4,
		hero_info_bg_res = "hero_info_bg_5",
		level = 10,
		head_id = 2007,
		bustid = 2007,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 107,
		series_id = 1,
		skin_name = "面子红发lv10",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23019,
			23020
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[120] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 120,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 1,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1201,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv1",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23058,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1201] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1201,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 2,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1202,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv2",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23058,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1202] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1202,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 3,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1203,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv3",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23058,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1203] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1203,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 4,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1204,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv4",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23058,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1204] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1204,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 5,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1205,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv5",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23058,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1205] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1205,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 6,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1206,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv6",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23058,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1206] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1206,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 7,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1207,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv7",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23058,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1207] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1207,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 8,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1208,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv8",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23058,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1208] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1208,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 9,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 1209,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv9",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23058,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1209] = {
		draw_res = "shuiseyoumeng",
		head_card_id = 2002,
		skin_id = 1209,
		voice = "d_voice_20511",
		action_bid = 991032,
		hero_camp_res = "null",
		res_id = "H50002",
		bid = 20511,
		fight_effect = "E25106",
		voice_time = 1,
		hero_info_bg_res = "hero_info_bg_shuiseyoumeng",
		level = 10,
		head_id = 2002,
		bustid = 2002,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 120,
		series_id = 2,
		skin_name = "草帽舵手lv10",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {
			2019,
			10,
			4,
			0,
			0,
			0
		},
		action_end_time = {
			2019,
			10,
			6,
			23,
			59,
			59
		},
		item_id_list = {
			23058,
			23059
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[109] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 109,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 1,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1091,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv1",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23025,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1091] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1091,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 2,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1092,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv2",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23025,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1092] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1092,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 3,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1093,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv3",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23025,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1093] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1093,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 4,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1094,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv4",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23025,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1094] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1094,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 5,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1095,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv5",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23025,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1095] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1095,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 6,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1096,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv6",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23025,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1096] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1096,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 7,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1097,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv7",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23025,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1097] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1097,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 8,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1098,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv8",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23025,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1098] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1098,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 9,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 1099,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv9",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23025,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1099] = {
		draw_res = "baozouqingchun",
		head_card_id = 2009,
		skin_id = 1099,
		voice = "d_voice_50508",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50008",
		bid = 50508,
		fight_effect = "E25107",
		voice_time = 3,
		hero_info_bg_res = "hero_info_bg_5",
		level = 10,
		head_id = 2009,
		bustid = 2009,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 109,
		series_id = 3,
		skin_name = "最强男人lv10",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23025,
			23026
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[111] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 111,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1111,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv1",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"speed_per",
				40
			}
		},
		upgrade_loss = {
			{
				23031,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1111] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1111,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1112,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv2",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"speed_per",
				45
			}
		},
		upgrade_loss = {
			{
				23031,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1112] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1112,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1113,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv3",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"speed_per",
				50
			}
		},
		upgrade_loss = {
			{
				23031,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1113] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1113,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1114,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv4",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"speed_per",
				55
			}
		},
		upgrade_loss = {
			{
				23031,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1114] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1114,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1115,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv5",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"speed_per",
				60
			}
		},
		upgrade_loss = {
			{
				23031,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1115] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1115,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1116,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv6",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"speed_per",
				65
			}
		},
		upgrade_loss = {
			{
				23031,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1116] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1116,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1117,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv7",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"speed_per",
				70
			}
		},
		upgrade_loss = {
			{
				23031,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1117] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1117,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1118,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv8",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"speed_per",
				75
			}
		},
		upgrade_loss = {
			{
				23031,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1118] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1118,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 1119,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv9",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"speed_per",
				80
			}
		},
		upgrade_loss = {
			{
				23031,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1119] = {
		draw_res = "meiyenanjue",
		head_card_id = 2011,
		skin_id = 1119,
		voice = "d_voice_20507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50010",
		bid = 20507,
		fight_effect = "E25102",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2011,
		bustid = 2011,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 111,
		series_id = 4,
		skin_name = "50贝里lv10",
		scale = 95,
		show_effect = "E25002",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"speed_per",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23031,
			23032
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[121] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 121,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1211,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv1",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23060,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1211] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1211,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1212,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv2",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23060,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1212] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1212,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1213,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv3",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23060,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1213] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1213,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1214,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv4",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23060,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1214] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1214,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1215,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv5",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23060,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1215] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1215,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1216,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv6",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23060,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1216] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1216,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1217,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv7",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23060,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1217] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1217,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1218,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv8",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23060,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1218] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1218,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 1219,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv9",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23060,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1219] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2020,
		skin_id = 1219,
		voice = "d_voice_40510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50020",
		bid = 40510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2020,
		bustid = 2020,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 121,
		series_id = 5,
		skin_name = "元帅lv10",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23060,
			23061
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[123] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 123,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 133,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv1",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"cure",
				40
			}
		},
		upgrade_loss = {
			{
				23062,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[133] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 133,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 143,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv2",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"cure",
				45
			}
		},
		upgrade_loss = {
			{
				23062,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[143] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 143,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 153,
		chip_num = 200,
		is_shop = 1,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv3",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"cure",
				50
			}
		},
		upgrade_loss = {
			{
				23062,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[153] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 153,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 163,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv4",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"cure",
				55
			}
		},
		upgrade_loss = {
			{
				23062,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[163] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 163,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 173,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv5",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"cure",
				60
			}
		},
		upgrade_loss = {
			{
				23062,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[173] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 173,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 183,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv6",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"cure",
				65
			}
		},
		upgrade_loss = {
			{
				23062,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[183] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 183,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 193,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv7",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"cure",
				70
			}
		},
		upgrade_loss = {
			{
				23062,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[193] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 193,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 203,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv8",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"cure",
				75
			}
		},
		upgrade_loss = {
			{
				23062,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[203] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 203,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 213,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv9",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"cure",
				80
			}
		},
		upgrade_loss = {
			{
				23062,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[213] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2021,
		skin_id = 213,
		voice = "d_voice_30511",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50007",
		bid = 30511,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2021,
		bustid = 2021,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 123,
		series_id = 6,
		skin_name = "九蛇女帝lv10",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				85
			},
			{
				"hp_max_per",
				85
			},
			{
				"cure",
				85
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23062,
			23063
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[301] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 301,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 311,
		chip_num = 200,
		is_shop = 1,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv1",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23064,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[311] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 311,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 321,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv2",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23064,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[321] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 321,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 331,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv3",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23064,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[331] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 331,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 341,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv4",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23064,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[341] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 341,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 351,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv5",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23064,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[351] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 351,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 361,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv6",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23064,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[361] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 361,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 371,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv7",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23064,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[371] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 371,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 381,
		chip_num = 200,
		is_shop = 1,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv8",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23064,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[381] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 381,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 391,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv9",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23064,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[391] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2022,
		skin_id = 391,
		voice = "d_voice_50502",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50021",
		bid = 50502,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2022,
		bustid = 2022,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 301,
		series_id = 7,
		skin_name = "传奇副手lv10",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23064,
			23065
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[401] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 401,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 411,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv1",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"dodge_magic",
				40
			}
		},
		upgrade_loss = {
			{
				23066,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[411] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 411,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 421,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv2",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"dodge_magic",
				45
			}
		},
		upgrade_loss = {
			{
				23066,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[421] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 421,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 431,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv3",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"dodge_magic",
				50
			}
		},
		upgrade_loss = {
			{
				23066,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[431] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 431,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 441,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv4",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"dodge_magic",
				55
			}
		},
		upgrade_loss = {
			{
				23066,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[441] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 441,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 451,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv5",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"dodge_magic",
				60
			}
		},
		upgrade_loss = {
			{
				23066,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[451] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 451,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 461,
		chip_num = 200,
		is_shop = 1,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv6",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"dodge_magic",
				65
			}
		},
		upgrade_loss = {
			{
				23066,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[461] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 461,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 471,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv7",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"dodge_magic",
				70
			}
		},
		upgrade_loss = {
			{
				23066,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[471] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 471,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 481,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv8",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"dodge_magic",
				75
			}
		},
		upgrade_loss = {
			{
				23066,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[481] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 481,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 491,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv9",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"dodge_magic",
				80
			}
		},
		upgrade_loss = {
			{
				23066,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[491] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2023,
		skin_id = 491,
		voice = "d_voice_50513",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "H50022",
		bid = 50513,
		fight_effect = "E25108",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2023,
		bustid = 2023,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 401,
		series_id = 8,
		skin_name = "夏洛特·玲玲lv10",
		scale = 95,
		show_effect = "E25108",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"dodge_magic",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23066,
			23067
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[501] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 501,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 511,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv1",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"speed_per",
				40
			}
		},
		upgrade_loss = {
			{
				23068,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[511] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 511,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 521,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv2",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"speed_per",
				45
			}
		},
		upgrade_loss = {
			{
				23068,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[521] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 521,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 531,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv3",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"speed_per",
				50
			}
		},
		upgrade_loss = {
			{
				23068,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[531] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 531,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 541,
		chip_num = 200,
		is_shop = 1,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv4",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"speed_per",
				55
			}
		},
		upgrade_loss = {
			{
				23068,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[541] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 541,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 551,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv5",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"speed_per",
				60
			}
		},
		upgrade_loss = {
			{
				23068,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[551] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 551,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 561,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv6",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"speed_per",
				65
			}
		},
		upgrade_loss = {
			{
				23068,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[561] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 561,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 571,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv7",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"speed_per",
				70
			}
		},
		upgrade_loss = {
			{
				23068,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[571] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 571,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 581,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv8",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"speed_per",
				75
			}
		},
		upgrade_loss = {
			{
				23068,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[581] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 581,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 591,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv9",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"speed_per",
				80
			}
		},
		upgrade_loss = {
			{
				23068,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[591] = {
		draw_res = "yuanshuaichiquan",
		head_card_id = 2024,
		skin_id = 591,
		voice = "d_voice_20512",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_zhigengniao",
		bid = 20512,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2024,
		bustid = 2024,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 501,
		series_id = 9,
		skin_name = "知更鸟lv10",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"speed_per",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23068,
			23069
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[601] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 601,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 611,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv1",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23070,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[611] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 611,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 621,
		chip_num = 200,
		is_shop = 1,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv2",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23070,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[621] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 621,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 631,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv3",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23070,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[631] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 631,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 641,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv4",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23070,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[641] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 641,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 651,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv5",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23070,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[651] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 651,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 661,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv6",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23070,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[661] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 661,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 671,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv7",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23070,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[671] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 671,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 681,
		chip_num = 200,
		is_shop = 0,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv8",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23070,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[681] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 681,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 691,
		chip_num = 200,
		is_shop = 1,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv9",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23070,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[691] = {
		draw_res = "dakouzhenshen",
		head_card_id = 2025,
		skin_id = 691,
		voice = "d_voice_20514",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_dakouzhenshen",
		bid = 20514,
		fight_effect = "",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2025,
		bustid = 2025,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 601,
		series_id = 10,
		skin_name = "大口真神lv10",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23070,
			23071
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[701] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 701,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7011,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv1",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23072,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7011] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7011,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7012,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv2",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23072,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7012] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7012,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7013,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv3",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23072,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7013] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7013,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7014,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv4",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23072,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7014] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7014,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7015,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv5",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23072,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7015] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7015,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7016,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv6",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23072,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7016] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7016,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7017,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv7",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23072,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7017] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7017,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7018,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv8",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23072,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7018] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7018,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 7019,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv9",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23072,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[7019] = {
		draw_res = "xiaozeimao",
		head_card_id = 2027,
		skin_id = 7019,
		voice = "d_voice_20505",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_xiaozeimao",
		bid = 20505,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2027,
		bustid = 2027,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 701,
		series_id = 11,
		skin_name = "小贼猫lv10",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23072,
			23073
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[801] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 801,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8011,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv1",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"speed_per",
				40
			}
		},
		upgrade_loss = {
			{
				23074,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8011] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8011,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8012,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv2",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"speed_per",
				45
			}
		},
		upgrade_loss = {
			{
				23074,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8012] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8012,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8013,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv3",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"speed_per",
				50
			}
		},
		upgrade_loss = {
			{
				23074,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8013] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8013,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8014,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv4",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"speed_per",
				55
			}
		},
		upgrade_loss = {
			{
				23074,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8014] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8014,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8015,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv5",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"speed_per",
				60
			}
		},
		upgrade_loss = {
			{
				23074,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8015] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8015,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8016,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv6",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"speed_per",
				65
			}
		},
		upgrade_loss = {
			{
				23074,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8016] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8016,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8017,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv7",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"speed_per",
				70
			}
		},
		upgrade_loss = {
			{
				23074,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8017] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8017,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8018,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv8",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"speed_per",
				75
			}
		},
		upgrade_loss = {
			{
				23074,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8018] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8018,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 8019,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv9",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"speed_per",
				80
			}
		},
		upgrade_loss = {
			{
				23074,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[8019] = {
		draw_res = "chunjingzhengyi",
		head_card_id = 2028,
		skin_id = 8019,
		voice = "d_voice_40507",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_chunjingzhengyi",
		bid = 40507,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2028,
		bustid = 2028,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 801,
		series_id = 12,
		skin_name = "纯净正义lv10",
		scale = 95,
		show_effect = "",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"speed_per",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23074,
			23075
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[901] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 901,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9011,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv1",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"speed_per",
				40
			}
		},
		upgrade_loss = {
			{
				23076,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9011] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9011,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9012,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv2",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"speed_per",
				45
			}
		},
		upgrade_loss = {
			{
				23076,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9012] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9012,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9013,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv3",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"speed_per",
				50
			}
		},
		upgrade_loss = {
			{
				23076,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9013] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9013,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9014,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv4",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"speed_per",
				55
			}
		},
		upgrade_loss = {
			{
				23076,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9014] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9014,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9015,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv5",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"speed_per",
				60
			}
		},
		upgrade_loss = {
			{
				23076,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9015] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9015,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9016,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv6",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"speed_per",
				65
			}
		},
		upgrade_loss = {
			{
				23076,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9016] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9016,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9017,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv7",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"speed_per",
				70
			}
		},
		upgrade_loss = {
			{
				23076,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9017] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9017,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9018,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv8",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"speed_per",
				75
			}
		},
		upgrade_loss = {
			{
				23076,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9018] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9018,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 9019,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv9",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"speed_per",
				80
			}
		},
		upgrade_loss = {
			{
				23076,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[9019] = {
		draw_res = "businiao",
		head_card_id = 2029,
		skin_id = 9019,
		voice = "d_voice_50510",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_maerke",
		bid = 50510,
		fight_effect = "E25107",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2029,
		bustid = 2029,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 0,
		first_id = 901,
		series_id = 13,
		skin_name = "不死鸟lv10",
		scale = 95,
		show_effect = "E25107",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"speed_per",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23076,
			23077
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1001] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1001,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1002,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv1",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23078,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1002] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1002,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1003,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv2",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23078,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1003] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1003,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1004,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv3",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23078,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1004] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1004,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1005,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv4",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23078,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1005] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1005,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1006,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv5",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23078,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1006] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1006,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1007,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv6",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23078,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1007] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1007,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1008,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv7",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23078,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1008] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1008,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1009,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv8",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23078,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1009] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1009,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 1010,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv9",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23078,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1010] = {
		draw_res = "gangtiemengnan",
		head_card_id = 2030,
		skin_id = 1010,
		voice = "d_voice_70520",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_gangtiemengnan",
		bid = 70520,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2030,
		bustid = 2030,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 1001,
		series_id = 14,
		skin_name = "钢铁猛男lv10",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23078,
			23079
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1021] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1021,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1022,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv1",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23080,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1022] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1022,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1023,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv2",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23080,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1023] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1023,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1024,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv3",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23080,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1024] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1024,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1025,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv4",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23080,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1025] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1025,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1026,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv5",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23080,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1026] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1026,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1027,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv6",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23080,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1027] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1027,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1028,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv7",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23080,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1028] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1028,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1029,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv8",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23080,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1029] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1029,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 1030,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv9",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23080,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1030] = {
		draw_res = "linghunzhiwang",
		head_card_id = 2031,
		skin_id = 1030,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_linghunzhiwang",
		bid = 70523,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2031,
		bustid = 2031,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 1021,
		series_id = 15,
		skin_name = "摇滚之王lv10",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23080,
			23081
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1031] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1031,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 1,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1032,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv1",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				40
			},
			{
				"hp_max_per",
				40
			},
			{
				"crit_rate",
				40
			}
		},
		upgrade_loss = {
			{
				23082,
				1
			},
			{
				1,
				10000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1032] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1032,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 2,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1033,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv2",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				45
			},
			{
				"hp_max_per",
				45
			},
			{
				"crit_rate",
				45
			}
		},
		upgrade_loss = {
			{
				23082,
				2
			},
			{
				1,
				15000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1033] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1033,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 3,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1034,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv3",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				50
			},
			{
				"hp_max_per",
				50
			},
			{
				"crit_rate",
				50
			}
		},
		upgrade_loss = {
			{
				23082,
				3
			},
			{
				1,
				20000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1034] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1034,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 4,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1035,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv4",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				55
			},
			{
				"hp_max_per",
				55
			},
			{
				"crit_rate",
				55
			}
		},
		upgrade_loss = {
			{
				23082,
				4
			},
			{
				1,
				25000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1035] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1035,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 5,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1036,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv5",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				60
			},
			{
				"hp_max_per",
				60
			},
			{
				"crit_rate",
				60
			}
		},
		upgrade_loss = {
			{
				23082,
				5
			},
			{
				1,
				30000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1036] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1036,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 6,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1037,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv6",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				65
			},
			{
				"hp_max_per",
				65
			},
			{
				"crit_rate",
				65
			}
		},
		upgrade_loss = {
			{
				23082,
				6
			},
			{
				1,
				35000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1037] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1037,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 7,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1038,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv7",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				70
			},
			{
				"hp_max_per",
				70
			},
			{
				"crit_rate",
				70
			}
		},
		upgrade_loss = {
			{
				23082,
				7
			},
			{
				1,
				40000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1038] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1038,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 8,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1039,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv8",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				75
			},
			{
				"hp_max_per",
				75
			},
			{
				"crit_rate",
				75
			}
		},
		upgrade_loss = {
			{
				23082,
				8
			},
			{
				1,
				45000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1039] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1039,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 9,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 1040,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv9",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				80
			},
			{
				"hp_max_per",
				80
			},
			{
				"crit_rate",
				80
			}
		},
		upgrade_loss = {
			{
				23082,
				9
			},
			{
				1,
				50000000
			}
		},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	},
	[1040] = {
		draw_res = "jixietegong",
		head_card_id = 2032,
		skin_id = 1040,
		voice = "d_voice_70523",
		action_bid = 0,
		hero_camp_res = "",
		res_id = "pf_tegong",
		bid = 70548,
		fight_effect = "E25106",
		voice_time = 2,
		hero_info_bg_res = "hero_info_bg_2",
		level = 10,
		head_id = 2032,
		bustid = 12032,
		scale_2 = 95,
		next_id = 0,
		chip_num = 200,
		is_shop = 1,
		first_id = 1031,
		series_id = 16,
		skin_name = "机械特工lv10",
		scale = 95,
		show_effect = "E25106",
		skin_attr = {
			{
				"atk_per",
				100
			},
			{
				"hp_max_per",
				100
			},
			{
				"crit_rate",
				100
			}
		},
		upgrade_loss = {},
		draw_offset = {
			-40,
			30
		},
		draw_offset_2 = {
			-40,
			30
		},
		action_start_time = {},
		action_end_time = {},
		item_id_list = {
			23082,
			23083
		},
		diamond_num = {
			{
				3,
				5000
			}
		}
	}
}

function Config.PartnerSkinData.data_skin_info_fun(slot0)
	slot1 = Config.PartnerSkinData.data_skin_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkinData.data_skin_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkinData.data_hero_info_length = 0
Config.PartnerSkinData.data_hero_info_cache = {}

function Config.PartnerSkinData.data_hero_info(slot0)
	if Config.PartnerSkinData.data_hero_info_cache[slot0] == nil then
		if not Config.PartnerSkinData.data_hero_info_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.PartnerSkinData.data_hero_info_cache[slot0] = {
			skin_id = slot1[1],
			content = slot1[2]
		}
	end

	return Config.PartnerSkinData.data_hero_info_cache[slot0]
end

Config.PartnerSkinData.data_hero_info_table = {}
Config.PartnerSkinData.data_partner_bid_info_length = 16
Config.PartnerSkinData.data_partner_bid_info = {
	[50504] = {
		[107] = {
			skin_id = 107
		},
		[117] = {
			skin_id = 117
		},
		[127] = {
			skin_id = 127
		},
		[137] = {
			skin_id = 137
		},
		[147] = {
			skin_id = 147
		},
		[157] = {
			skin_id = 157
		},
		[167] = {
			skin_id = 167
		},
		[177] = {
			skin_id = 177
		},
		[187] = {
			skin_id = 187
		},
		[197] = {
			skin_id = 197
		}
	},
	[20511] = {
		[120] = {
			skin_id = 120
		},
		[1201] = {
			skin_id = 1201
		},
		[1202] = {
			skin_id = 1202
		},
		[1203] = {
			skin_id = 1203
		},
		[1204] = {
			skin_id = 1204
		},
		[1205] = {
			skin_id = 1205
		},
		[1206] = {
			skin_id = 1206
		},
		[1207] = {
			skin_id = 1207
		},
		[1208] = {
			skin_id = 1208
		},
		[1209] = {
			skin_id = 1209
		}
	},
	[50508] = {
		[109] = {
			skin_id = 109
		},
		[1091] = {
			skin_id = 1091
		},
		[1092] = {
			skin_id = 1092
		},
		[1093] = {
			skin_id = 1093
		},
		[1094] = {
			skin_id = 1094
		},
		[1095] = {
			skin_id = 1095
		},
		[1096] = {
			skin_id = 1096
		},
		[1097] = {
			skin_id = 1097
		},
		[1098] = {
			skin_id = 1098
		},
		[1099] = {
			skin_id = 1099
		}
	},
	[20507] = {
		[111] = {
			skin_id = 111
		},
		[1111] = {
			skin_id = 1111
		},
		[1112] = {
			skin_id = 1112
		},
		[1113] = {
			skin_id = 1113
		},
		[1114] = {
			skin_id = 1114
		},
		[1115] = {
			skin_id = 1115
		},
		[1116] = {
			skin_id = 1116
		},
		[1117] = {
			skin_id = 1117
		},
		[1118] = {
			skin_id = 1118
		},
		[1119] = {
			skin_id = 1119
		}
	},
	[40510] = {
		[121] = {
			skin_id = 121
		},
		[1211] = {
			skin_id = 1211
		},
		[1212] = {
			skin_id = 1212
		},
		[1213] = {
			skin_id = 1213
		},
		[1214] = {
			skin_id = 1214
		},
		[1215] = {
			skin_id = 1215
		},
		[1216] = {
			skin_id = 1216
		},
		[1217] = {
			skin_id = 1217
		},
		[1218] = {
			skin_id = 1218
		},
		[1219] = {
			skin_id = 1219
		}
	},
	[30511] = {
		[123] = {
			skin_id = 123
		},
		[133] = {
			skin_id = 133
		},
		[143] = {
			skin_id = 143
		},
		[153] = {
			skin_id = 153
		},
		[163] = {
			skin_id = 163
		},
		[173] = {
			skin_id = 173
		},
		[183] = {
			skin_id = 183
		},
		[193] = {
			skin_id = 193
		},
		[203] = {
			skin_id = 203
		},
		[213] = {
			skin_id = 213
		}
	},
	[50502] = {
		[301] = {
			skin_id = 301
		},
		[311] = {
			skin_id = 311
		},
		[321] = {
			skin_id = 321
		},
		[331] = {
			skin_id = 331
		},
		[341] = {
			skin_id = 341
		},
		[351] = {
			skin_id = 351
		},
		[361] = {
			skin_id = 361
		},
		[371] = {
			skin_id = 371
		},
		[381] = {
			skin_id = 381
		},
		[391] = {
			skin_id = 391
		}
	},
	[50513] = {
		[401] = {
			skin_id = 401
		},
		[411] = {
			skin_id = 411
		},
		[421] = {
			skin_id = 421
		},
		[431] = {
			skin_id = 431
		},
		[441] = {
			skin_id = 441
		},
		[451] = {
			skin_id = 451
		},
		[461] = {
			skin_id = 461
		},
		[471] = {
			skin_id = 471
		},
		[481] = {
			skin_id = 481
		},
		[491] = {
			skin_id = 491
		}
	},
	[20512] = {
		[501] = {
			skin_id = 501
		},
		[511] = {
			skin_id = 511
		},
		[521] = {
			skin_id = 521
		},
		[531] = {
			skin_id = 531
		},
		[541] = {
			skin_id = 541
		},
		[551] = {
			skin_id = 551
		},
		[561] = {
			skin_id = 561
		},
		[571] = {
			skin_id = 571
		},
		[581] = {
			skin_id = 581
		},
		[591] = {
			skin_id = 591
		}
	},
	[20514] = {
		[601] = {
			skin_id = 601
		},
		[611] = {
			skin_id = 611
		},
		[621] = {
			skin_id = 621
		},
		[631] = {
			skin_id = 631
		},
		[641] = {
			skin_id = 641
		},
		[651] = {
			skin_id = 651
		},
		[661] = {
			skin_id = 661
		},
		[671] = {
			skin_id = 671
		},
		[681] = {
			skin_id = 681
		},
		[691] = {
			skin_id = 691
		}
	},
	[20505] = {
		[701] = {
			skin_id = 701
		},
		[7011] = {
			skin_id = 7011
		},
		[7012] = {
			skin_id = 7012
		},
		[7013] = {
			skin_id = 7013
		},
		[7014] = {
			skin_id = 7014
		},
		[7015] = {
			skin_id = 7015
		},
		[7016] = {
			skin_id = 7016
		},
		[7017] = {
			skin_id = 7017
		},
		[7018] = {
			skin_id = 7018
		},
		[7019] = {
			skin_id = 7019
		}
	},
	[40507] = {
		[801] = {
			skin_id = 801
		},
		[8011] = {
			skin_id = 8011
		},
		[8012] = {
			skin_id = 8012
		},
		[8013] = {
			skin_id = 8013
		},
		[8014] = {
			skin_id = 8014
		},
		[8015] = {
			skin_id = 8015
		},
		[8016] = {
			skin_id = 8016
		},
		[8017] = {
			skin_id = 8017
		},
		[8018] = {
			skin_id = 8018
		},
		[8019] = {
			skin_id = 8019
		}
	},
	[50510] = {
		[901] = {
			skin_id = 901
		},
		[9011] = {
			skin_id = 9011
		},
		[9012] = {
			skin_id = 9012
		},
		[9013] = {
			skin_id = 9013
		},
		[9014] = {
			skin_id = 9014
		},
		[9015] = {
			skin_id = 9015
		},
		[9016] = {
			skin_id = 9016
		},
		[9017] = {
			skin_id = 9017
		},
		[9018] = {
			skin_id = 9018
		},
		[9019] = {
			skin_id = 9019
		}
	},
	[70520] = {
		[1001] = {
			skin_id = 1001
		},
		[1002] = {
			skin_id = 1002
		},
		[1003] = {
			skin_id = 1003
		},
		[1004] = {
			skin_id = 1004
		},
		[1005] = {
			skin_id = 1005
		},
		[1006] = {
			skin_id = 1006
		},
		[1007] = {
			skin_id = 1007
		},
		[1008] = {
			skin_id = 1008
		},
		[1009] = {
			skin_id = 1009
		},
		[1010] = {
			skin_id = 1010
		}
	},
	[70523] = {
		[1021] = {
			skin_id = 1021
		},
		[1022] = {
			skin_id = 1022
		},
		[1023] = {
			skin_id = 1023
		},
		[1024] = {
			skin_id = 1024
		},
		[1025] = {
			skin_id = 1025
		},
		[1026] = {
			skin_id = 1026
		},
		[1027] = {
			skin_id = 1027
		},
		[1028] = {
			skin_id = 1028
		},
		[1029] = {
			skin_id = 1029
		},
		[1030] = {
			skin_id = 1030
		}
	},
	[70548] = {
		[1031] = {
			skin_id = 1031
		},
		[1032] = {
			skin_id = 1032
		},
		[1033] = {
			skin_id = 1033
		},
		[1034] = {
			skin_id = 1034
		},
		[1035] = {
			skin_id = 1035
		},
		[1036] = {
			skin_id = 1036
		},
		[1037] = {
			skin_id = 1037
		},
		[1038] = {
			skin_id = 1038
		},
		[1039] = {
			skin_id = 1039
		},
		[1040] = {
			skin_id = 1040
		}
	}
}
Config.PartnerSkinData.data_skilltoeffect_length = 63
Config.PartnerSkinData.data_skilltoeffect = {
	["117_5161003"] = 10311,
	["116_5215002"] = 10251,
	["117_5160001"] = 10301,
	["114_5031002"] = 10011,
	["116_5211002"] = 10211,
	["115_5043003"] = 10121,
	["117_5163002"] = 10331,
	["116_5210001"] = 10201,
	["118_5151012"] = 10411,
	["115_5041003"] = 10111,
	["116_5211003"] = 10211,
	["114_5033003"] = 10031,
	["114_5033002"] = 10031,
	["118_5153103"] = 10431,
	["116_5213012"] = 10231,
	["115_5043002"] = 10121,
	["114_5031003"] = 10011,
	["118_5150001"] = 10401,
	["115_5040001"] = 10110,
	["117_5169001"] = 10391,
	["117_5161001"] = 10311,
	["115_5043001"] = 10121,
	["115_5049001"] = 95009001,
	["118_5153101"] = 10431,
	["116_5215001"] = 10251,
	["121_5250001"] = 10601,
	["118_5151011"] = 10411,
	["114_5039001"] = 10000,
	["118_5153301"] = 10433,
	["118_5153302"] = 10433,
	["116_5213099"] = 10239,
	["119_5141013"] = 10511,
	["117_5163003"] = 10331,
	["118_5153303"] = 10433,
	["119_5143001"] = 10531,
	["119_5143002"] = 10531,
	["119_5143003"] = 10531,
	["116_5213011"] = 10231,
	["117_5161002"] = 10311,
	["118_5153102"] = 10431,
	["118_5153203"] = 10432,
	["114_5033001"] = 10031,
	["118_5159001"] = 10491,
	["116_5215003"] = 10251,
	["119_5141012"] = 10511,
	["118_5153202"] = 10432,
	["118_5151013"] = 10411,
	["115_5041002"] = 10111,
	["119_5149001"] = 10591,
	["119_5140001"] = 10501,
	["119_5141011"] = 10511,
	["121_5258001"] = 10602,
	["117_5163001"] = 10331,
	["115_5041001"] = 10111,
	["116_5211001"] = 10211,
	["121_5251001"] = 10611,
	["116_5219001"] = 10291,
	["116_5213013"] = 10231,
	["121_5251002"] = 10611,
	["114_5030001"] = 10000,
	["121_5251003"] = 10611,
	["114_5031001"] = 10011,
	["118_5153201"] = 10432
}

function Config.PartnerSkinData.data_skilltoeffect_fun(slot0)
	slot1 = Config.PartnerSkinData.data_skilltoeffect[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkinData.data_skilltoeffect[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkinData.data_skilltonewskill_length = 74
Config.PartnerSkinData.data_skilltonewskill = {
	["1004_760403"] = 760403,
	["1006_760403"] = 760403,
	["203_522403"] = 522403,
	["1010_760403"] = 760403,
	["661_540403"] = 540403,
	["1024_763403"] = 763403,
	["421_536403"] = 536403,
	["147_153303"] = 153303,
	["1005_760403"] = 760403,
	["183_522403"] = 522403,
	["571_528103"] = 528103,
	["561_528103"] = 528103,
	["1025_763403"] = 763403,
	["157_153303"] = 153303,
	["401_536403"] = 536403,
	["167_153303"] = 153303,
	["1001_760403"] = 760403,
	["193_522403"] = 522403,
	["651_540403"] = 540403,
	["1008_760403"] = 760403,
	["671_540403"] = 540403,
	["1021_763403"] = 763403,
	["1022_763403"] = 763403,
	["143_522403"] = 522403,
	["501_528103"] = 528103,
	["1026_763403"] = 763403,
	["1027_763403"] = 763403,
	["1029_763403"] = 763403,
	["301_214303"] = 214303,
	["127_153303"] = 153303,
	["137_153303"] = 153303,
	["351_214303"] = 214303,
	["681_540403"] = 540403,
	["117_153303"] = 153303,
	["631_540403"] = 540403,
	["1003_760403"] = 760403,
	["601_540403"] = 540403,
	["621_540403"] = 540403,
	["641_540403"] = 540403,
	["177_153303"] = 153303,
	["581_528103"] = 528103,
	["611_540403"] = 540403,
	["123_522403"] = 522403,
	["133_522403"] = 522403,
	["331_214303"] = 214303,
	["1002_760403"] = 760403,
	["1030_763403"] = 763403,
	["153_522403"] = 522403,
	["411_536403"] = 536403,
	["431_536403"] = 536403,
	["381_214303"] = 214303,
	["163_522403"] = 522403,
	["173_522403"] = 522403,
	["371_214303"] = 214303,
	["341_214303"] = 214303,
	["1028_763403"] = 763403,
	["361_214303"] = 214303,
	["107_153303"] = 153303,
	["321_214303"] = 214303,
	["541_528103"] = 528103,
	["311_214303"] = 214303,
	["521_528103"] = 528103,
	["187_153303"] = 153303,
	["551_528103"] = 528103,
	["481_536403"] = 536403,
	["531_528103"] = 528103,
	["1023_763403"] = 763403,
	["511_528103"] = 528103,
	["1007_760403"] = 760403,
	["1009_760403"] = 760403,
	["451_536403"] = 536403,
	["441_536403"] = 536403,
	["471_536403"] = 536403,
	["461_536403"] = 536403
}

function Config.PartnerSkinData.data_skilltonewskill_fun(slot0)
	slot1 = Config.PartnerSkinData.data_skilltonewskill[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkinData.data_skilltonewskill[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkinData.data_bufftospine_length = 9
Config.PartnerSkinData.data_bufftospine = {
	["116_16501"] = {
		effect_bid = 0,
		spine_res = "H35106"
	},
	["116_16502"] = {
		effect_bid = 0,
		spine_res = "H35106"
	},
	["116_16503"] = {
		effect_bid = 0,
		spine_res = "H35106"
	},
	["118_16201"] = {
		effect_bid = 50026,
		spine_res = ""
	},
	["118_16202"] = {
		effect_bid = 50026,
		spine_res = ""
	},
	["118_16203"] = {
		effect_bid = 50026,
		spine_res = ""
	},
	["119_19101"] = {
		effect_bid = 50031,
		spine_res = ""
	},
	["119_19102"] = {
		effect_bid = 50031,
		spine_res = ""
	},
	["119_19103"] = {
		effect_bid = 50031,
		spine_res = ""
	}
}

function Config.PartnerSkinData.data_bufftospine_fun(slot0)
	slot1 = Config.PartnerSkinData.data_bufftospine[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkinData.data_bufftospine[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
