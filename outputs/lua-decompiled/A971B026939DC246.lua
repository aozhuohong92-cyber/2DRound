Config = Config or {}
Config.BuffData = Config.BuffData or {}
Config.BuffData.data_get_buff_data_length = 38
Config.BuffData.data_get_buff_data = {
	[1000] = {
		name = "经验增幅",
		seconds = 86400,
		type = "add",
		group = 1000,
		icon = 10000,
		bid = 1000,
		des = "经验获取增加100%",
		effect = {
			{
				"exp",
				2
			}
		}
	},
	[1010] = {
		name = "贝里增幅",
		seconds = 86400,
		type = "add",
		group = 1010,
		icon = 10010,
		bid = 1010,
		des = "贝里获取增加100%",
		effect = {
			{
				"coin",
				2
			}
		}
	},
	[1020] = {
		name = "经验增幅",
		seconds = 259200,
		type = "add",
		group = 1000,
		icon = 10000,
		bid = 1020,
		des = "经验获取增加100%",
		effect = {
			{
				"exp",
				2
			}
		}
	},
	[1030] = {
		name = "攻击加成",
		seconds = 0,
		type = "add",
		group = 1030,
		icon = 10000,
		bid = 1030,
		des = "攻击增加",
		effect = {
			{
				"atk_per",
				50
			}
		}
	},
	[1040] = {
		name = "气血加成",
		seconds = 0,
		type = "add",
		group = 1040,
		icon = 10001,
		bid = 1040,
		des = "气血增加",
		effect = {
			{
				"hp_max_per",
				100
			}
		}
	},
	[1050] = {
		name = "伤害加成",
		seconds = 0,
		type = "add",
		group = 1050,
		icon = 10002,
		bid = 1050,
		des = "伤害增加",
		effect = {
			{
				"dam",
				50
			}
		}
	},
	[1060] = {
		name = "免伤加成",
		seconds = 0,
		type = "add",
		group = 1060,
		icon = 10003,
		bid = 1060,
		des = "免伤增加",
		effect = {
			{
				"res",
				50
			}
		}
	},
	[1070] = {
		name = "速度加成",
		seconds = 0,
		type = "add",
		group = 1070,
		icon = 10004,
		bid = 1070,
		des = "速度增加",
		effect = {
			{
				"speed_per",
				50
			}
		}
	},
	[2000] = {
		name = "攻击+10%",
		seconds = 0,
		type = "add",
		group = 2000,
		icon = 10000,
		bid = 2000,
		des = "攻击+5%",
		effect = {
			{
				"atk_per",
				50
			}
		}
	},
	[2010] = {
		name = "攻击+15%",
		seconds = 0,
		type = "add",
		group = 2010,
		icon = 10000,
		bid = 2010,
		des = "攻击+10%",
		effect = {
			{
				"atk_per",
				100
			}
		}
	},
	[2020] = {
		name = "攻击+20%",
		seconds = 0,
		type = "add",
		group = 2010,
		icon = 10000,
		bid = 2020,
		des = "攻击+15%",
		effect = {
			{
				"atk_per",
				150
			}
		}
	},
	[3000] = {
		name = "攻击+10%",
		seconds = 3,
		type = "add",
		group = 3000,
		icon = 3020,
		bid = 3000,
		des = "攻击+10%",
		effect = {
			{
				"atk_per",
				100
			}
		}
	},
	[3020] = {
		name = "气血+10%",
		seconds = 3,
		type = "add",
		group = 3020,
		icon = 3030,
		bid = 3020,
		des = "气血+10%",
		effect = {
			{
				"hp_max_per",
				100
			}
		}
	},
	[3040] = {
		name = "伤害+10%",
		seconds = 3,
		type = "add",
		group = 3040,
		icon = 3040,
		bid = 3040,
		des = "伤害+10%",
		effect = {
			{
				"dam",
				100
			}
		}
	},
	[3060] = {
		name = "免伤+10%",
		seconds = 3,
		type = "add",
		group = 3060,
		icon = 3060,
		bid = 3060,
		des = "免伤+10%",
		effect = {
			{
				"res",
				100
			}
		}
	},
	[3080] = {
		name = "速度+10%",
		seconds = 3,
		type = "add",
		group = 3080,
		icon = 3070,
		bid = 3080,
		des = "速度+10%",
		effect = {
			{
				"speed_per",
				100
			}
		}
	},
	[3100] = {
		name = "贝里加成+10% ",
		seconds = 7200,
		type = "add",
		group = 3100,
		icon = 3012,
		bid = 3100,
		des = "贝里+10% ",
		effect = {
			{
				"adv_coin",
				100
			}
		}
	},
	[3120] = {
		name = "精炼石加成+20%",
		seconds = 7200,
		type = "add",
		group = 3120,
		icon = 3013,
		bid = 3120,
		des = "精炼石+20%",
		effect = {
			{
				"adv_item_10102",
				200
			}
		}
	},
	[3140] = {
		name = "怪物收益+10%",
		seconds = 7200,
		type = "add",
		group = 3140,
		icon = 3011,
		bid = 3140,
		des = "怪物收益+10%",
		effect = {
			{
				"adv_mon",
				100
			}
		}
	},
	[3160] = {
		name = "采集翻倍+10%",
		seconds = 7200,
		type = "add",
		group = 3160,
		icon = 3010,
		bid = 3160,
		des = "采集翻倍概率10%",
		effect = {
			{
				"adv_effect",
				100
			}
		}
	},
	[3200] = {
		name = "伤害+10%",
		seconds = 600,
		type = "add",
		group = 3200,
		icon = 3040,
		bid = 3200,
		des = "伤害+10%",
		effect = {
			{
				"dam",
				100
			}
		}
	},
	[900101] = {
		name = "暴击+0.5%",
		seconds = 0,
		type = "add",
		group = 900101,
		icon = 3020,
		bid = 900101,
		des = "暴击提升0.5%",
		effect = {
			{
				"crit_rate",
				5
			}
		}
	},
	[900102] = {
		name = "防御+0.5%",
		seconds = 0,
		type = "add",
		group = 900102,
		icon = 3060,
		bid = 900102,
		des = "防御提升0.5%",
		effect = {
			{
				"def_per",
				5
			}
		}
	},
	[900103] = {
		name = "攻击+0.5%",
		seconds = 0,
		type = "add",
		group = 900103,
		icon = 3020,
		bid = 900103,
		des = "攻击提升0.5%",
		effect = {
			{
				"atk_per",
				5
			}
		}
	},
	[900104] = {
		name = "生命+0.5%",
		seconds = 0,
		type = "add",
		group = 900104,
		icon = 3030,
		bid = 900104,
		des = "生命提升0.5%",
		effect = {
			{
				"hp_max_per",
				5
			}
		}
	},
	[900105] = {
		name = "伤害+0.5%",
		seconds = 0,
		type = "add",
		group = 900105,
		icon = 3040,
		bid = 900105,
		des = "伤害提升0.5%",
		effect = {
			{
				"dam",
				5
			}
		}
	},
	[900106] = {
		name = "免伤+0.5%",
		seconds = 0,
		type = "add",
		group = 900106,
		icon = 3060,
		bid = 900106,
		des = "免伤提升0.5%",
		effect = {
			{
				"res",
				5
			}
		}
	},
	[900903] = {
		name = "攻击+10%",
		seconds = 0,
		type = "add",
		group = 900103,
		icon = 3020,
		bid = 900903,
		des = "攻击提升10%",
		effect = {
			{
				"atk_per",
				100
			}
		}
	},
	[900503] = {
		name = "攻击+2%",
		seconds = 0,
		type = "add",
		group = 900503,
		icon = 3020,
		bid = 900503,
		des = "攻击提升2%",
		effect = {
			{
				"atk_per",
				20
			}
		}
	},
	[900513] = {
		name = "攻击+2%",
		seconds = 0,
		type = "add",
		group = 900513,
		icon = 3020,
		bid = 900513,
		des = "攻击提升2%",
		effect = {
			{
				"atk_per",
				20
			}
		}
	},
	[900523] = {
		name = "攻击+3%",
		seconds = 0,
		type = "add",
		group = 900523,
		icon = 3020,
		bid = 900523,
		des = "攻击提升3%",
		effect = {
			{
				"atk_per",
				30
			}
		}
	},
	[900533] = {
		name = "攻击+4%",
		seconds = 0,
		type = "add",
		group = 900533,
		icon = 3020,
		bid = 900533,
		des = "攻击提升4%",
		effect = {
			{
				"atk_per",
				40
			}
		}
	},
	[900543] = {
		name = "攻击+5%",
		seconds = 0,
		type = "add",
		group = 900543,
		icon = 3020,
		bid = 900543,
		des = "攻击提升5%",
		effect = {
			{
				"atk_per",
				50
			}
		}
	},
	[900502] = {
		name = "防御+2%",
		seconds = 0,
		type = "add",
		group = 900502,
		icon = 3060,
		bid = 900502,
		des = "防御提升2%",
		effect = {
			{
				"def_per",
				20
			}
		}
	},
	[900512] = {
		name = "防御+2%",
		seconds = 0,
		type = "add",
		group = 900512,
		icon = 3060,
		bid = 900512,
		des = "防御提升2%",
		effect = {
			{
				"def_per",
				20
			}
		}
	},
	[900522] = {
		name = "防御+3%",
		seconds = 0,
		type = "add",
		group = 900522,
		icon = 3060,
		bid = 900522,
		des = "防御提升3%",
		effect = {
			{
				"def_per",
				30
			}
		}
	},
	[900532] = {
		name = "防御+4%",
		seconds = 0,
		type = "add",
		group = 900532,
		icon = 3060,
		bid = 900532,
		des = "防御提升4%",
		effect = {
			{
				"def_per",
				40
			}
		}
	},
	[900542] = {
		name = "防御+5%",
		seconds = 0,
		type = "add",
		group = 900542,
		icon = 3060,
		bid = 900542,
		des = "防御提升5%",
		effect = {
			{
				"def_per",
				50
			}
		}
	}
}

function Config.BuffData.data_get_buff_data_fun(slot0)
	slot1 = Config.BuffData.data_get_buff_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.BuffData.data_get_buff_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
