Config = Config or {}
Config.HolidayNianData = Config.HolidayNianData or {}
Config.HolidayNianData.data_const_length = 32
Config.HolidayNianData.data_const = {
	start_time = {
		val = 0,
		desc = "1月21日-1月23日"
	},
	open_lev = {
		val = 40,
		desc = "玩法达40级开启"
	},
	holiday_nian_red_packet_day_limit = {
		val = 5,
		desc = "每日玩家可领红包最大数"
	},
	holiday_nian_red_packet_max_num = {
		val = 50,
		desc = "每次刷新全服可领取红包次数"
	},
	holiday_nian_red_packet_display_num = {
		val = 20,
		desc = "红包列表显示多少个玩家"
	},
	other_players_limit = {
		val = 5,
		desc = "地图显示多少个其它在线玩家"
	},
	other_players_time = {
		val = 600,
		desc = "交互玩家保存时间（秒）"
	},
	holiday_nian_default_face = {
		desc = "默认表情",
		val = {
			{
				1,
				1
			},
			{
				2,
				2
			},
			{
				3,
				6
			}
		}
	},
	package_item = {
		desc = "背包道具列表",
		val = {
			80301,
			80302,
			80303,
			80304,
			80305,
			80306,
			80307,
			80308,
			80351,
			80352
		}
	},
	firework_itemid = {
		val = 80352,
		desc = "烟花ID"
	},
	firework_reward_drop = {
		val = 82003,
		desc = "烟花奖励掉落ID"
	},
	holiday_nian_gold_nian_appears = {
		desc = "巅峰BIG·MOM召唤条件（年三十 9：00）",
		val = {
			2022,
			12,
			23,
			16,
			0,
			0
		}
	},
	holiday_nian_timer_monster_free_time = {
		val = 2,
		desc = "BIG·MOM免费挑战次数"
	},
	holiday_nian_timer_monster_buy_time = {
		val = 3,
		desc = "BIG·MOM购买挑战次数"
	},
	holiday_nian_timer_monster_buy_price = {
		desc = "BIG·MOM购买挑战次数价格",
		val = {
			{
				3,
				100
			}
		}
	},
	holiday_nian_gold_monster_free_time = {
		val = 4,
		desc = "巅峰BIG·MOM免费挑战次数"
	},
	holiday_nian_gold_monster_buy_time = {
		val = 6,
		desc = "巅峰BIG·MOM购买挑战次数"
	},
	holiday_nian_gold_monster_buy_price = {
		desc = "巅峰BIG·MOM购买挑战次数价格",
		val = {
			{
				3,
				100
			}
		}
	},
	holiday_nian_timer_monster_time = {
		val = 86400,
		desc = "限时BIG·MOM保存时间(秒)"
	},
	holiday_nian_gold_monster_time = {
		val = 172800,
		desc = "巅峰BIG·MOM保存时间(秒)"
	},
	holiday_nian_tribute_id = {
		val = 80351,
		desc = "新春蛋糕Id"
	},
	holiday_nian_desc = {
		val = 0,
		desc = [[
1.玩法于<div fontcolor=#d95014>1月29日0：00 — 2月11日23：59</div>限时开启
2.挑战地图上的卡塔库栗可以获得新春蛋糕。全服玩家收集<div fontcolor=#d95014>提交新春蛋糕</div>达到进度目标，即可唤醒沉睡的大BIG·MOM，还能召唤<div fontcolor=#d95014>钻石红包雨</div>。每次召唤BIG·MOM所需要的进度目标，会根据服务器的活跃人数动态变化
3.在<div fontcolor=#d95014>大年三十的早上9：00</div>，限时巅峰BIG·MOM将被唤醒，挑战获得丰厚奖励。伤害排名靠前的玩家，还可获得新年专属动态头像框
4.场景每隔一段时间，还会刷新其它奖励如<div fontcolor=#d95014>卡塔库栗、烟花、新春蛋糕、英雄碎片、四将星甜品</div>等等，不容错过
5.卡塔库栗事件刷新时间为<div fontcolor=#d95014>每天的 0：00，6：00，12：00，18：00</div>
6.随机奖励事件刷新时间为<div fontcolor=#d95014>每天的 0：00，8：00，16：00</div>
7.四将星甜品事件刷新时间为<div fontcolor=#d95014>每天的 0：00，4：00，8：00，12：00，16：00，20：00</div>
8.新春蛋糕和烟花事件<div fontcolor=#d95014>每两小时</div>刷新一次
9.集齐特定将星甜品组合，可兑换专属奖励<div fontcolor=#d95014>万国动态头像框</div>和海量奖励]]
	},
	holiday_nian_fight_desc = {
		val = 0,
		desc = [[
1.BIG·MOM在沉睡时，<div fontcolor=#d95014>无法被发起挑战</div>
2.<div fontcolor=#d95014>提交</div>收集到的新春蛋糕，可唤醒沉睡的BIG·MOM
3.巅峰BIG·MOM将在<div fontcolor=#d95014>大年三十的早上9：00</div>自动苏醒
4.BIG·MOM唤醒后<div fontcolor=#d95014>限时存在</div>，请在存在时间内发起挑战
5.每次挑战造成<div fontcolor=#d95014>伤害越高</div>，获得<div fontcolor=#d95014>奖励也越丰厚</div>
6.巅峰BIG·MOM还会根据伤害排名，在BIG·MOM消失时发放<div fontcolor=#d95014>排名奖励</div>，其中包括<div fontcolor=#d95014>专属的新年头像框</div>]]
	},
	holiday_nian_tribute_desc = {
		val = 0,
		desc = "1.<div fontcolor=#d95014>提交</div>收集到的新春蛋糕，可唤醒<div fontcolor=#d95014>沉睡的BIG·MOM</div>\n2.BIG·MOM苏醒后，暂时<div fontcolor=#d95014>无法提交</div>新春蛋糕\n3.挑战地图的<div fontcolor=#d95014>卡塔库栗</div>或触发<div fontcolor=#d95014>新春蛋糕</div>事件，可收集获得新春蛋糕"
	},
	exchange_desc = {
		val = 0,
		desc = "1.限时收集<div fontcolor=#d95014>特定将星甜品组合</div>，可兑换专属奖励和海量奖励\n2.挑战地图的<div fontcolor=#d95014>BIG·MOM</div>或触发<div fontcolor=#d95014>将星甜品事件</div>，可收集获得将星甜品"
	},
	holiday_nian_update_time = {
		desc = "一天刷新的时间点",
		val = {
			{
				1,
				5
			},
			{
				2,
				3600
			},
			{
				3,
				7200
			},
			{
				4,
				10800
			},
			{
				5,
				14400
			},
			{
				6,
				18000
			},
			{
				7,
				21600
			},
			{
				8,
				25200
			},
			{
				9,
				28800
			},
			{
				10,
				32400
			},
			{
				11,
				36000
			},
			{
				12,
				39600
			},
			{
				13,
				43200
			},
			{
				14,
				46800
			},
			{
				15,
				50400
			},
			{
				16,
				54000
			},
			{
				17,
				57600
			},
			{
				18,
				61200
			},
			{
				19,
				64800
			},
			{
				20,
				68400
			},
			{
				21,
				72000
			},
			{
				22,
				75600
			},
			{
				23,
				79200
			},
			{
				24,
				82800
			}
		}
	},
	holiday_nian_power_time = {
		val = 24,
		desc = "记录战力保存时间（小时）"
	},
	holiday_nian_map_id = {
		val = 100001,
		desc = "地图id"
	},
	map_bg = {
		val = "map_bg_100001",
		desc = "地图资源"
	},
	make_progress_value = {
		val = 50,
		desc = "补进度值（千分比）"
	},
	make_progress_cd = {
		val = 48,
		desc = "多久没召唤BIG·MOM，可补进度值（小时）"
	},
	make_progress_check_cd = {
		val = 3600,
		desc = "多久补进度值（秒）"
	}
}

function Config.HolidayNianData.data_const_fun(slot0)
	slot1 = Config.HolidayNianData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNianData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayNianData.data_evt_info_length = 34
Config.HolidayNianData.data_evt_info = {
	[0] = {
		name = "",
		type = 0,
		reversal = 0,
		is_walk = 1,
		id = 0,
		ext = {},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {},
		boss_skill_id = {}
	},
	[10001] = {
		name = "出生点",
		type = 2,
		reversal = 0,
		is_walk = 1,
		id = 10001,
		ext = {},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {},
		boss_skill_id = {}
	},
	[10101] = {
		name = "告示",
		type = 3,
		reversal = 0,
		is_walk = 0,
		id = 10101,
		ext = {
			10101
		},
		res_1 = {
			1,
			9011
		},
		res_2 = {},
		offset = {
			0,
			38
		},
		reward = {},
		boss_skill_id = {}
	},
	[10201] = {
		name = "福神官",
		type = 5,
		reversal = 0,
		is_walk = 0,
		id = 10201,
		ext = {
			{
				10201,
				500
			}
		},
		res_1 = {
			1,
			9181
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {},
		boss_skill_id = {}
	},
	[10202] = {
		name = "福娃",
		type = 5,
		reversal = 0,
		is_walk = 0,
		id = 10202,
		ext = {
			{
				10202,
				500
			}
		},
		res_1 = {
			1,
			9182
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {},
		boss_skill_id = {}
	},
	[10301] = {
		name = "金",
		type = 8,
		reversal = 0,
		is_walk = 0,
		id = 10301,
		ext = {},
		res_1 = {
			1,
			9141
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[10302] = {
		name = "鼠",
		type = 8,
		reversal = 0,
		is_walk = 0,
		id = 10302,
		ext = {},
		res_1 = {
			1,
			9142
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[10303] = {
		name = "献",
		type = 8,
		reversal = 0,
		is_walk = 0,
		id = 10303,
		ext = {},
		res_1 = {
			1,
			9143
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[10304] = {
		name = "瑞",
		type = 8,
		reversal = 0,
		is_walk = 0,
		id = 10304,
		ext = {},
		res_1 = {
			1,
			9144
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[10401] = {
		name = "随机奖励",
		type = 4,
		reversal = 0,
		is_walk = 0,
		id = 10401,
		ext = {},
		res_1 = {
			1,
			1151
		},
		res_2 = {},
		offset = {
			3,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[10501] = {
		name = "贡品",
		type = 9,
		reversal = 0,
		is_walk = 0,
		id = 10501,
		ext = {},
		res_1 = {
			1,
			9151
		},
		res_2 = {},
		offset = {
			-4,
			30
		},
		reward = {},
		boss_skill_id = {}
	},
	[10601] = {
		name = "烟花",
		type = 10,
		reversal = 0,
		is_walk = 0,
		id = 10601,
		ext = {},
		res_1 = {
			1,
			9152
		},
		res_2 = {},
		offset = {
			0,
			30
		},
		reward = {},
		boss_skill_id = {}
	},
	[10701] = {
		name = "红包",
		type = 11,
		reversal = 0,
		is_walk = 0,
		id = 10701,
		ext = {},
		res_1 = {
			1,
			9153
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[10801] = {
		name = "小年兽",
		type = 1,
		reversal = 0,
		is_walk = 0,
		id = 10801,
		ext = {
			97004
		},
		res_1 = {
			1,
			9183
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {
			{
				80351,
				5
			},
			{
				1,
				25000
			},
			{
				22,
				10000
			}
		},
		boss_skill_id = {}
	},
	[19001] = {
		name = "沉睡的年兽",
		type = 14,
		reversal = 1,
		is_walk = 0,
		id = 19001,
		ext = {
			19003
		},
		res_1 = {
			2,
			"E28002"
		},
		res_2 = {},
		offset = {
			26,
			-21
		},
		reward = {},
		boss_skill_id = {}
	},
	[19002] = {
		name = "沉睡的年兽",
		type = 14,
		reversal = 0,
		is_walk = 0,
		id = 19002,
		ext = {
			19004
		},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {},
		boss_skill_id = {}
	},
	[19003] = {
		name = "凶狠的年兽",
		type = 12,
		reversal = 1,
		is_walk = 0,
		id = 19003,
		ext = {
			19001
		},
		res_1 = {
			2,
			"E28002"
		},
		res_2 = {},
		offset = {
			26,
			-21
		},
		reward = {
			{
				3,
				1
			},
			{
				29905,
				1
			},
			{
				80304,
				1
			},
			{
				80303,
				1
			},
			{
				10450,
				1
			},
			{
				72001,
				1
			}
		},
		boss_skill_id = {
			919001,
			919101,
			919201,
			919401
		}
	},
	[19004] = {
		name = "凶狠的年兽",
		type = 12,
		reversal = 0,
		is_walk = 0,
		id = 19004,
		ext = {
			19002
		},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {},
		boss_skill_id = {}
	},
	[19051] = {
		name = "沉睡的金色年兽",
		type = 15,
		reversal = 1,
		is_walk = 0,
		id = 19051,
		ext = {
			19053
		},
		res_1 = {
			2,
			"E28003"
		},
		res_2 = {},
		offset = {
			26,
			-21
		},
		reward = {},
		boss_skill_id = {}
	},
	[19052] = {
		name = "沉睡的金色年兽",
		type = 15,
		reversal = 0,
		is_walk = 0,
		id = 19052,
		ext = {
			19054
		},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {},
		boss_skill_id = {}
	},
	[19053] = {
		name = "新年瑞兽",
		type = 13,
		reversal = 1,
		is_walk = 0,
		id = 19053,
		ext = {
			19051
		},
		res_1 = {
			2,
			"E28003"
		},
		res_2 = {},
		offset = {
			26,
			-21
		},
		reward = {
			{
				3,
				1
			},
			{
				37010,
				1
			},
			{
				80304,
				1
			},
			{
				80303,
				1
			},
			{
				29905,
				1
			},
			{
				10403,
				1
			}
		},
		boss_skill_id = {
			919001,
			919101,
			919201,
			919401
		}
	},
	[19054] = {
		name = "新年瑞兽",
		type = 13,
		reversal = 0,
		is_walk = 0,
		id = 19054,
		ext = {
			19052
		},
		res_1 = {},
		res_2 = {},
		offset = {},
		reward = {},
		boss_skill_id = {}
	},
	[90111] = {
		name = "1*1_酒坛子",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90111,
		ext = {},
		res_1 = {
			1,
			20001
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[90112] = {
		name = "1*1_酒坛子（翻转）",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90112,
		ext = {},
		res_1 = {
			1,
			20001
		},
		res_2 = {},
		offset = {
			0,
			35
		},
		reward = {},
		boss_skill_id = {}
	},
	[90121] = {
		name = "1*1_鞭炮串",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90121,
		ext = {},
		res_1 = {
			1,
			20002
		},
		res_2 = {},
		offset = {
			0,
			95
		},
		reward = {},
		boss_skill_id = {}
	},
	[90122] = {
		name = "1*1_鞭炮串（翻转）",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90122,
		ext = {},
		res_1 = {
			1,
			20002
		},
		res_2 = {},
		offset = {
			0,
			95
		},
		reward = {},
		boss_skill_id = {}
	},
	[90131] = {
		name = "1*1_小房",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90131,
		ext = {},
		res_1 = {
			1,
			20003
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {},
		boss_skill_id = {}
	},
	[90132] = {
		name = "1*1_小房（翻转）",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90132,
		ext = {},
		res_1 = {
			1,
			20003
		},
		res_2 = {},
		offset = {
			0,
			45
		},
		reward = {},
		boss_skill_id = {}
	},
	[90211] = {
		name = "2*2_大房",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90211,
		ext = {},
		res_1 = {
			1,
			20004
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {},
		boss_skill_id = {}
	},
	[90212] = {
		name = "2*2_大房（翻转）",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90212,
		ext = {},
		res_1 = {
			1,
			20004
		},
		res_2 = {},
		offset = {
			0,
			40
		},
		reward = {},
		boss_skill_id = {}
	},
	[90221] = {
		name = "2*2_桃树",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90221,
		ext = {},
		res_1 = {
			1,
			20005
		},
		res_2 = {},
		offset = {
			33,
			91
		},
		reward = {},
		boss_skill_id = {}
	},
	[90222] = {
		name = "2*2_桃树（翻转）",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90222,
		ext = {},
		res_1 = {
			1,
			20005
		},
		res_2 = {},
		offset = {
			33,
			91
		},
		reward = {},
		boss_skill_id = {}
	},
	[90231] = {
		name = "2*2_地砖",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90231,
		ext = {},
		res_1 = {
			1,
			20006
		},
		res_2 = {},
		offset = {
			0,
			-50
		},
		reward = {},
		boss_skill_id = {}
	},
	[90232] = {
		name = "2*2_地砖（翻转）",
		type = 7,
		reversal = 0,
		is_walk = 0,
		id = 90232,
		ext = {},
		res_1 = {
			1,
			20006
		},
		res_2 = {},
		offset = {
			0,
			-50
		},
		reward = {},
		boss_skill_id = {}
	}
}

function Config.HolidayNianData.data_evt_info_fun(slot0)
	slot1 = Config.HolidayNianData.data_evt_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNianData.data_evt_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayNianData.data_dialogue_length = 2
Config.HolidayNianData.data_dialogue = {
	[10201] = {
		dialogue = {
			{
				"福神官",
				0,
				"fushenguan",
				"处于沉睡中的年兽是无法被攻击的，想要打败它，唯有收集附近的贡品，将其唤醒。",
				20,
				250,
				90
			},
			{
				"福神官",
				0,
				"fushenguan",
				"附近还有各种新春字，如果拿到了也别忘了去兑换奖励~",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	},
	[10202] = {
		dialogue = {
			{
				"福娃",
				0,
				"fuwa",
				"哇哇哇，这可是我见过最大的年兽了，它会在除夕当天醒来，别忘及时将它打败哟~",
				20,
				250,
				90
			},
			{
				"福娃",
				0,
				"fuwa",
				"附近还有很多好看的烟花，捡到了就点燃它，和大家一起欣赏吧！",
				20,
				250,
				90
			}
		},
		answer = {
			{
				1
			}
		}
	}
}

function Config.HolidayNianData.data_dialogue_fun(slot0)
	slot1 = Config.HolidayNianData.data_dialogue[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNianData.data_dialogue[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayNianData.data_drama_length = 1
Config.HolidayNianData.data_drama = {
	{
		dialogue = {
			{
				"斯芬克斯·锦绣霓裳",
				0,
				0,
				"jinxiunishang",
				"可恶的年兽，每到过年就出来打扰我睡觉，这一次我一定要给他们点颜色瞧瞧。",
				300,
				200,
				65
			},
			{
				"斯芬克斯·锦绣霓裳",
				0,
				0,
				"jinxiunishang",
				"但是光靠我自己不足以唤醒并打败它们，所以我需要你们的帮助，人类冒险者。",
				300,
				200,
				65
			},
			{
				"斯芬克斯·锦绣霓裳",
				0,
				0,
				"jinxiunishang",
				"为了表达我的感谢，只要收集贡品唤醒沉睡的年兽，每达到一定的程度我就会奉上新年红包。",
				300,
				200,
				65
			},
			{
				"斯芬克斯·锦绣霓裳",
				0,
				0,
				"jinxiunishang",
				"当然，年兽被唤醒后，你们每次攻击它也都能获得相应的奖励。",
				300,
				200,
				65
			}
		}
	}
}

function Config.HolidayNianData.data_drama_fun(slot0)
	slot1 = Config.HolidayNianData.data_drama[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNianData.data_drama[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayNianData.data_board_length = 1
Config.HolidayNianData.data_board = {
	[10101] = {
		res_id = "board_img_100001",
		desc_2 = [[
每逢过年，总会有一种怪物四处捣乱，人们称之为“年兽”。
据说年兽生活在奇异的空间之中，唯有过年时，它们才会在沉睡中醒来，挣脱束缚，危害大陆。
而年兽处于沉睡之时，所有的攻击对它们都无效。
这一次，冒险者在斯芬克斯的带领下，闯入年兽空间，试图收集贡品将年兽唤醒，并将其击败。]],
		id = 10101,
		title = "新春告示",
		desc_1 = "我们来看看它记载着什么",
		btn_str = ""
	}
}

function Config.HolidayNianData.data_board_fun(slot0)
	slot1 = Config.HolidayNianData.data_board[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNianData.data_board[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayNianData.data_redbag_progress_length = 3
Config.HolidayNianData.data_redbag_progress = {
	450,
	1350,
	1800
}
Config.HolidayNianData.data_harm_reward_length = 2
Config.HolidayNianData.data_harm_reward = {
	[12] = {
		{
			dps_high = 61610000,
			dps_low = 50610000
		},
		{
			dps_high = 50610000,
			dps_low = 40610000
		},
		{
			dps_high = 40610000,
			dps_low = 31610000
		},
		{
			dps_high = 31610000,
			dps_low = 24610000
		},
		{
			dps_high = 24610000,
			dps_low = 18610000
		},
		{
			dps_high = 18610000,
			dps_low = 13610000
		},
		{
			dps_high = 13610000,
			dps_low = 9610000
		},
		{
			dps_high = 9610000,
			dps_low = 6610000
		},
		{
			dps_high = 6610000,
			dps_low = 4610000
		},
		{
			dps_high = 4610000,
			dps_low = 3110000
		},
		{
			dps_high = 3110000,
			dps_low = 2110000
		},
		{
			dps_high = 2110000,
			dps_low = 1410000
		},
		{
			dps_high = 1410000,
			dps_low = 910000
		},
		{
			dps_high = 910000,
			dps_low = 560000
		},
		{
			dps_high = 560000,
			dps_low = 310000
		},
		{
			dps_high = 310000,
			dps_low = 190000
		},
		{
			dps_high = 190000,
			dps_low = 110000
		},
		{
			dps_high = 110000,
			dps_low = 60000
		},
		{
			dps_high = 60000,
			dps_low = 30000
		},
		{
			dps_high = 30000,
			dps_low = 15000
		},
		{
			dps_high = 15000,
			dps_low = 5000
		},
		{
			dps_high = 5000,
			dps_low = 0
		}
	},
	[13] = {
		{
			dps_high = 61610000,
			dps_low = 50610000
		},
		{
			dps_high = 50610000,
			dps_low = 40610000
		},
		{
			dps_high = 40610000,
			dps_low = 31610000
		},
		{
			dps_high = 31610000,
			dps_low = 24610000
		},
		{
			dps_high = 24610000,
			dps_low = 18610000
		},
		{
			dps_high = 18610000,
			dps_low = 13610000
		},
		{
			dps_high = 13610000,
			dps_low = 9610000
		},
		{
			dps_high = 9610000,
			dps_low = 6610000
		},
		{
			dps_high = 6610000,
			dps_low = 4610000
		},
		{
			dps_high = 4610000,
			dps_low = 3110000
		},
		{
			dps_high = 3110000,
			dps_low = 2110000
		},
		{
			dps_high = 2110000,
			dps_low = 1410000
		},
		{
			dps_high = 1410000,
			dps_low = 910000
		},
		{
			dps_high = 910000,
			dps_low = 560000
		},
		{
			dps_high = 560000,
			dps_low = 310000
		},
		{
			dps_high = 310000,
			dps_low = 190000
		},
		{
			dps_high = 190000,
			dps_low = 110000
		},
		{
			dps_high = 110000,
			dps_low = 60000
		},
		{
			dps_high = 60000,
			dps_low = 30000
		},
		{
			dps_high = 30000,
			dps_low = 15000
		},
		{
			dps_high = 15000,
			dps_low = 5000
		},
		{
			dps_high = 5000,
			dps_low = 0
		}
	}
}
Config.HolidayNianData.data_rank_reward_length = 8
Config.HolidayNianData.data_rank_reward = {
	{
		rank_high = 1,
		rank_low = 1,
		reward = {
			{
				10408,
				10
			},
			{
				60003,
				1
			}
		}
	},
	{
		rank_high = 2,
		rank_low = 2,
		reward = {
			{
				10408,
				8
			},
			{
				60003,
				1
			}
		}
	},
	{
		rank_high = 3,
		rank_low = 3,
		reward = {
			{
				10408,
				6
			},
			{
				60003,
				1
			}
		}
	},
	{
		rank_high = 4,
		rank_low = 10,
		reward = {
			{
				10408,
				5
			},
			{
				60003,
				1
			}
		}
	},
	{
		rank_high = 11,
		rank_low = 20,
		reward = {
			{
				10408,
				4
			},
			{
				60003,
				1
			}
		}
	},
	{
		rank_high = 21,
		rank_low = 50,
		reward = {
			{
				10408,
				3
			}
		}
	},
	{
		rank_high = 51,
		rank_low = 100,
		reward = {
			{
				10408,
				2
			}
		}
	},
	{
		rank_high = 101,
		rank_low = 200,
		reward = {
			{
				10408,
				1
			}
		}
	}
}
Config.HolidayNianData.data_exchange_length = 18
Config.HolidayNianData.data_exchange = {
	{
		start_unixtime = 1578644831,
		time = 1,
		id = 1,
		end_unixtime = 1579708799,
		loss = {
			{
				80301,
				1
			},
			{
				80302,
				1
			},
			{
				80303,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				29905,
				50
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 1,
		id = 2,
		end_unixtime = 1579708799,
		loss = {
			{
				80301,
				1
			},
			{
				80303,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				14001,
				1
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 1,
		id = 3,
		end_unixtime = 1579708799,
		loss = {
			{
				80301,
				1
			},
			{
				80302,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				10603,
				1
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 5,
		id = 4,
		end_unixtime = 1579708799,
		loss = {
			{
				80303,
				1
			},
			{
				80302,
				1
			}
		},
		gain = {
			{
				10403,
				1
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 20,
		id = 5,
		end_unixtime = 1579708799,
		loss = {
			{
				80301,
				1
			},
			{
				80302,
				1
			}
		},
		gain = {
			{
				10040,
				5
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 99,
		id = 6,
		end_unixtime = 1579708799,
		loss = {
			{
				80301,
				1
			}
		},
		gain = {
			{
				22,
				10000
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 99,
		id = 7,
		end_unixtime = 1579708799,
		loss = {
			{
				80302,
				1
			}
		},
		gain = {
			{
				1,
				50000
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 20,
		id = 8,
		end_unixtime = 1579708799,
		loss = {
			{
				80303,
				1
			}
		},
		gain = {
			{
				72001,
				5
			}
		}
	},
	{
		start_unixtime = 1578644831,
		time = 20,
		id = 9,
		end_unixtime = 1579708799,
		loss = {
			{
				80304,
				1
			}
		},
		gain = {
			{
				10450,
				100
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 1,
		id = 10,
		end_unixtime = 1580399999,
		loss = {
			{
				80301,
				1
			},
			{
				80302,
				1
			},
			{
				80303,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				29905,
				50
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 1,
		id = 11,
		end_unixtime = 1580399999,
		loss = {
			{
				80301,
				1
			},
			{
				80302,
				1
			},
			{
				80303,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				80401,
				1
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 1,
		id = 12,
		end_unixtime = 1580399999,
		loss = {
			{
				80301,
				1
			},
			{
				80303,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				14001,
				1
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 1,
		id = 13,
		end_unixtime = 1580399999,
		loss = {
			{
				80301,
				1
			},
			{
				80302,
				1
			},
			{
				80304,
				1
			}
		},
		gain = {
			{
				10603,
				1
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 10,
		id = 14,
		end_unixtime = 1580399999,
		loss = {
			{
				80303,
				1
			},
			{
				80301,
				1
			},
			{
				80302,
				1
			}
		},
		gain = {
			{
				37010,
				1
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 99,
		id = 15,
		end_unixtime = 1580399999,
		loss = {
			{
				80301,
				1
			}
		},
		gain = {
			{
				22,
				10000
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 99,
		id = 16,
		end_unixtime = 1580399999,
		loss = {
			{
				80302,
				1
			}
		},
		gain = {
			{
				1,
				50000
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 20,
		id = 17,
		end_unixtime = 1580399999,
		loss = {
			{
				80303,
				1
			}
		},
		gain = {
			{
				72001,
				5
			}
		}
	},
	{
		start_unixtime = 1579708800,
		time = 20,
		id = 18,
		end_unixtime = 1580399999,
		loss = {
			{
				80304,
				1
			}
		},
		gain = {
			{
				10450,
				100
			}
		}
	}
}

function Config.HolidayNianData.data_exchange_fun(slot0)
	slot1 = Config.HolidayNianData.data_exchange[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayNianData.data_exchange[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
