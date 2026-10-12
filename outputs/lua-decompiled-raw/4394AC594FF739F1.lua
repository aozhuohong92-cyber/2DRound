Config = Config or {}
Config.DungeonTeamData = Config.DungeonTeamData or {}
Config.DungeonTeamData.data_team_const_length = 2
Config.DungeonTeamData.data_team_const = {
	max_hero_num = {
		val = 6,
		label = "max_hero_num",
		desc = "最大上阵单位数"
	},
	join_lev = {
		val = 50,
		label = "join_lev",
		desc = "参与等级"
	}
}
Config.DungeonTeamData.data_team_data_length = 4
Config.DungeonTeamData.data_team_data = {
	{
		limit_lev = 50,
		name = "普通",
		expend = 15,
		expend2 = 8,
		msg2 = "神界试炼需要由3名领主各带6位英雄出战分别挑战3个BOSS。全队击杀完3个BOSS则获取胜利，全部出战队伍阵亡则失败，先战胜BOSS的领主将进入观战模式，观看队友战斗，并给予士气鼓舞，提升队友全队英雄攻击力和防御力，反之，BOSS击杀玩家后，会将剩余血量传输给存活的BOSS，并给BOSS增加攻击力。BOSS会越战越勇，需尽快解决战斗哦！",
		msg1 = "神圣巨龙三位一体，需要3人组队共同击杀掉3个BOSS才能获取最终胜利",
		drop_id = 42000,
		diff = 1,
		unit = {
			32600,
			32601,
			32602
		},
		award_list = {
			{
				51133,
				51134,
				51135,
				10214,
				10201
			}
		},
		skill_list = {
			900601,
			900611,
			900621,
			900631,
			900641
		}
	},
	{
		limit_lev = 55,
		name = "困难",
		expend = 20,
		expend2 = 10,
		msg2 = "神界试炼需要由3名领主各带6位英雄出战分别挑战3个BOSS。全队击杀完3个BOSS则获取胜利，全部出战队伍阵亡则失败，先战胜BOSS的领主将进入观战模式，观看队友战斗，并给予士气鼓舞，提升队友全队英雄攻击力和防御力，反之，BOSS击杀玩家后，会将剩余血量传输给存活的BOSS，并给BOSS增加攻击力。BOSS会越战越勇，需尽快解决战斗哦！",
		msg1 = "神圣巨龙三位一体，需要3人组队共同击杀掉3个BOSS才能获取最终胜利",
		drop_id = 42001,
		diff = 2,
		unit = {
			32605,
			32606,
			32607
		},
		award_list = {
			{
				51136,
				51137,
				51138,
				10214,
				10201
			}
		},
		skill_list = {
			900601,
			900611,
			900621,
			900631,
			900641
		}
	},
	{
		limit_lev = 60,
		name = "噩梦",
		expend = 25,
		expend2 = 12,
		msg2 = "神界试炼需要由3名领主各带6位英雄出战分别挑战3个BOSS。全队击杀完3个BOSS则获取胜利，全部出战队伍阵亡则失败，先战胜BOSS的领主将进入观战模式，观看队友战斗，并给予士气鼓舞，提升队友全队英雄攻击力和防御力，反之，BOSS击杀玩家后，会将剩余血量传输给存活的BOSS，并给BOSS增加攻击力。BOSS会越战越勇，需尽快解决战斗哦！",
		msg1 = "神圣巨龙三位一体，需要3人组队共同击杀掉3个BOSS才能获取最终胜利",
		drop_id = 42002,
		diff = 3,
		unit = {
			32610,
			32611,
			32612
		},
		award_list = {
			{
				51139,
				51140,
				51141,
				10214,
				10201
			}
		},
		skill_list = {
			900601,
			900611,
			900621,
			900631,
			900641
		}
	},
	{
		limit_lev = 65,
		name = "地狱",
		expend = 30,
		expend2 = 15,
		msg2 = "神界试炼需要由3名领主各带6位英雄出战分别挑战3个BOSS。全队击杀完3个BOSS则获取胜利，全部出战队伍阵亡则失败，先战胜BOSS的领主将进入观战模式，观看队友战斗，并给予士气鼓舞，提升队友全队英雄攻击力和防御力，反之，BOSS击杀玩家后，会将剩余血量传输给存活的BOSS，并给BOSS增加攻击力。BOSS会越战越勇，需尽快解决战斗哦！",
		msg1 = "神圣巨龙三位一体，需要3人组队共同击杀掉3个BOSS才能获取最终胜利",
		drop_id = 42003,
		diff = 4,
		unit = {
			32615,
			32616,
			32617
		},
		award_list = {
			{
				51142,
				51143,
				51144,
				10214,
				10201
			}
		},
		skill_list = {
			900601,
			900611,
			900621,
			900631,
			900641
		}
	}
}
Config.DungeonTeamData.data_team_power_length = 7
Config.DungeonTeamData.data_team_power = {
	{
		id = 1,
		need_power = 0
	},
	{
		id = 2,
		need_power = 300000
	},
	{
		id = 3,
		need_power = 350000
	},
	{
		id = 4,
		need_power = 400000
	},
	{
		id = 5,
		need_power = 500000
	},
	{
		id = 6,
		need_power = 600000
	},
	{
		id = 7,
		need_power = 700000
	}
}
