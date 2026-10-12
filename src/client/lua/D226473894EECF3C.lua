Config = Config or {}
Config.ZsWarData = Config.ZsWarData or {}
Config.ZsWarData.data_pos_length = 15
Config.ZsWarData.data_pos = {
	{
		{
			600,
			428
		},
		{
			600,
			480
		},
		{
			600,
			520
		}
	},
	{
		{
			700,
			320
		},
		{
			700,
			420
		},
		{
			700,
			520
		}
	},
	{
		{
			800,
			320
		},
		{
			800,
			420
		},
		{
			800,
			520
		}
	},
	{
		{
			900,
			320
		},
		{
			900,
			420
		},
		{
			900,
			520
		}
	},
	{
		{
			1000,
			320
		},
		{
			1000,
			420
		},
		{
			1000,
			520
		}
	},
	{
		{
			1100,
			320
		},
		{
			1100,
			420
		},
		{
			1100,
			520
		}
	},
	{
		{
			1150,
			320
		},
		{
			1150,
			420
		},
		{
			1150,
			520
		}
	},
	{
		{
			1200,
			320
		},
		{
			1200,
			420
		},
		{
			1200,
			520
		}
	},
	{
		{
			1260,
			320
		},
		{
			1260,
			420
		},
		{
			1260,
			520
		}
	},
	{
		{
			1320,
			320
		},
		{
			1320,
			420
		},
		{
			1320,
			520
		}
	},
	{
		{
			1400,
			320
		},
		{
			1400,
			420
		},
		{
			1400,
			520
		}
	},
	{
		{
			1500,
			320
		},
		{
			1500,
			420
		},
		{
			1500,
			520
		}
	},
	{
		{
			1600,
			320
		},
		{
			1600,
			420
		},
		{
			1600,
			520
		}
	},
	{
		{
			1700,
			320
		},
		{
			1700,
			420
		},
		{
			1700,
			520
		}
	},
	{
		{
			1800,
			428
		},
		{
			1800,
			460
		},
		{
			1800,
			520
		}
	}
}
Config.ZsWarData.data_const_length = 35
Config.ZsWarData.data_const = {
	limit_lev = {
		val = 999,
		key = "limit_lev",
		desc = "玩法参与等级"
	},
	limit_day = {
		val = 999,
		key = "limit_day",
		desc = "开服天数限制"
	},
	reward_times = {
		val = 15,
		key = "reward_times",
		desc = "战斗前X次可获得积分"
	},
	move_reward_times = {
		val = 20,
		key = "move_reward_times",
		desc = "达阵前Y次可获得积分"
	},
	week_days = {
		key = "week_days",
		desc = "周几开战",
		val = {
			6,
			7
		}
	},
	start_time = {
		key = "start_time",
		desc = "每天12:30开启",
		val = {
			{
				12,
				30,
				0
			},
			{
				20,
				0,
				0
			}
		}
	},
	pre_time = {
		val = 300,
		key = "pre_time",
		desc = "报名时间"
	},
	match_time = {
		val = 1500,
		key = "match_time",
		desc = "正式时间"
	},
	zone_max = {
		val = 32,
		key = "zone_max",
		desc = "战场最大人数"
	},
	zone_real = {
		val = 20,
		key = "zone_real",
		desc = "准备阶段战场上限"
	},
	robot_limit = {
		val = 10,
		key = "robot_limit",
		desc = "机器人填充上限"
	},
	god_born = {
		val = "H30104",
		key = "god_born",
		desc = "初始路飞"
	},
	god_change = {
		val = "H30107",
		key = "god_change",
		desc = "甚平模型"
	},
	god_god = {
		val = "H30108",
		key = "god_god",
		desc = "进阶马尔科"
	},
	imp_born = {
		val = "H30052",
		key = "imp_born",
		desc = "斯摩格"
	},
	imp_change = {
		val = "H30109",
		key = "imp_change",
		desc = "赤犬"
	},
	imp_god = {
		val = "H30077",
		key = "imp_god",
		desc = "卡普"
	},
	god_guard = {
		val = "H30100",
		key = "god_guard",
		desc = "白胡子阵营建筑模型"
	},
	imp_guard = {
		val = "H30098",
		key = "imp_guard",
		desc = "战国阵营建筑模型"
	},
	god_defeat = {
		val = "E50079",
		key = "god_defeat",
		desc = "白胡子阵营连败buff光环"
	},
	imp_defeat = {
		val = "E50079",
		key = "imp_defeat",
		desc = "战国阵营连败buff光环"
	},
	god_name = {
		val = 1,
		key = "god_name",
		desc = "白胡子阵营"
	},
	imp_name = {
		val = 2,
		key = "imp_name",
		desc = "战国阵营"
	},
	like_reward = {
		key = "like_reward",
		desc = "点赞奖励",
		val = {
			{
				1,
				3000
			}
		}
	},
	liked_reward = {
		key = "liked_reward",
		desc = "被点赞奖励",
		val = {
			{
				1,
				3000
			}
		}
	},
	like_times = {
		val = 5,
		key = "like_times",
		desc = "最大点赞数量"
	},
	reward_type = {
		val = 8,
		key = "reward_type",
		desc = "个人积分转化资产ID"
	},
	reward_firstblood = {
		val = 10,
		key = "reward_firstblood",
		desc = "战场首杀积分奖励"
	},
	attack_god = {
		val = "E21000",
		key = "attack_god",
		desc = "白胡子-迟缓释放"
	},
	attack_imp = {
		val = "E53254",
		key = "attack_imp",
		desc = "战国-迟缓释放"
	},
	speed_up = {
		val = "E21003",
		key = "speed_up",
		desc = "技能-加速"
	},
	shield = {
		val = "E52033",
		key = "shield",
		desc = "技能-护盾"
	},
	attack_effect = {
		val = "E52000",
		key = "attack_effect",
		desc = "被迟缓特效"
	},
	attack_kill = {
		val = "E21004",
		key = "attack_kill",
		desc = "击杀特效"
	},
	news_kill = {
		val = 6,
		key = "news_kill",
		desc = "全服击杀传闻条件（连续击杀数）"
	}
}

function Config.ZsWarData.data_const_fun(slot0)
	slot1 = Config.ZsWarData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ZsWarData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ZsWarData.data_explain_length = 5
Config.ZsWarData.data_explain = {
	{
		id = 1,
		title = "基础规则",
		desc = [[
1.顶上战争为多人实时PVP玩法
2.参与的玩家被分为<div fontcolor=#d95014>白胡子</div>和<div fontcolor=#d95014>战国</div>两个阵营
3.参与战斗和抵达对方阵营可为己方增加荣誉积分
4.比赛结束后荣誉积分多的一方获胜]]
	},
	{
		id = 2,
		title = "参与规则",
		desc = [[
1.玩法<div fontcolor=#d95014>30级</div>可参与
2.每周六和周日<div fontcolor=#d95014>12:30-13:00</div>和<div fontcolor=#d95014>20:00-20:30</div>开启活动，前5分钟为报名阶段
3.活动开始后仍可报名继续参与
4.每到达30/60/100/120/140/160级时，将被分配至对应等级段的战场]]
	},
	{
		id = 3,
		title = "比赛规则",
		desc = "1.玩法开始后从各自出生点向敌方出生点发起进攻\n2.途中若遇到敌方玩家将触发战斗\n3.<div fontcolor=#d95014>参与战斗</div>或<div fontcolor=#d95014>抵达敌方阵营</div>都能获得荣誉积分"
	},
	{
		id = 4,
		title = "奖励发放",
		desc = "1.参与战斗可获得<div fontcolor=#d95014>竞技声望</div>与<div fontcolor=#d95014>贝里</div>奖励\n2.玩法结束后将根据积分排名和阵营胜负发放奖励"
	},
	{
		id = 5,
		title = "其他规则",
		desc = [[
1.当交战失败后，会获得阵营庇护效果：
奋勇一击：生命+10%，攻击+5%，防御+5%，速度+5%
孤注一掷：生命+20%，攻击+10%，防御+10%，速度+10%
破釜沉舟：生命+30%，攻击+15%，防御+15%，速度+15%
背水一战：生命+40%，攻击+20%，防御+20%，速度+20%
2.当首领血量差达到一定程度时，弱势方将触发白胡子士气/海军士气，随机一名玩家获得强力效果加持，同时全通阵营获得buff加成，持续一段时间后消失
3.使用战场技能会带来意想不到的效果
八尺琼勾玉/空裂：使用后有50%几率击晕前方目标，使其无法移动
冲锋：加速场景跑动，同时跑动过程中不触发战斗
空间屏障/大佛庇护：3秒内免疫受到敌方迟缓伤害]]
	}
}

function Config.ZsWarData.data_explain_fun(slot0)
	slot1 = Config.ZsWarData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ZsWarData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ZsWarData.data_skill_length = 6
Config.ZsWarData.data_skill = {
	{
		free = 10,
		name = "空裂",
		id = 1,
		icon = 22583,
		desc = "使用后有50%几率击晕前方目标（被击晕期间无法正常移动），冷却150秒",
		loss = {
			{
				15,
				20
			}
		}
	},
	{
		free = 10,
		name = "冲锋",
		id = 2,
		icon = 70007,
		desc = "加速25%场景跑动，同时跑动过程中不触发战斗，持续4秒，冷却时间150秒",
		loss = {
			{
				15,
				20
			}
		}
	},
	{
		free = 5,
		name = "空间屏障",
		id = 3,
		icon = 20210,
		desc = "3秒内免疫受到敌方迟缓伤害，冷却时间150秒",
		loss = {
			{
				15,
				20
			}
		}
	},
	{
		free = 10,
		name = "八尺琼勾玉",
		id = 4,
		icon = 50891,
		desc = "使用后有50%几率击晕前方目标（被击晕期间无法正常移动），冷却150秒",
		loss = {
			{
				15,
				20
			}
		}
	},
	{
		free = 10,
		name = "冲锋",
		id = 5,
		icon = 70007,
		desc = "加速25%场景跑动，同时跑动过程中不触发战斗，持续4秒，冷却时间150秒",
		loss = {
			{
				15,
				20
			}
		}
	},
	{
		free = 5,
		name = "佛之守护",
		id = 6,
		icon = 24150,
		desc = "3秒内免疫受到敌方迟缓伤害，冷却时间150秒",
		loss = {
			{
				15,
				20
			}
		}
	}
}

function Config.ZsWarData.data_skill_fun(slot0)
	slot1 = Config.ZsWarData.data_skill[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ZsWarData.data_skill[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ZsWarData.data_num_rewards_length = 6
Config.ZsWarData.data_num_rewards = {
	{
		{
			num = 1,
			type = 2,
			items = {
				{
					8,
					60
				}
			}
		},
		{
			num = 3,
			type = 2,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 3,
			type = 1,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 5,
			type = 2,
			items = {
				{
					8,
					160
				}
			}
		},
		{
			num = 5,
			type = 1,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 2,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 1,
			items = {
				{
					8,
					300
				}
			}
		},
		{
			num = 10,
			type = 1,
			items = {
				{
					8,
					400
				}
			}
		}
	},
	[6] = {
		{
			num = 1,
			type = 2,
			items = {
				{
					8,
					60
				}
			}
		},
		{
			num = 3,
			type = 2,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 3,
			type = 1,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 5,
			type = 2,
			items = {
				{
					8,
					160
				}
			}
		},
		{
			num = 5,
			type = 1,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 2,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 1,
			items = {
				{
					8,
					300
				}
			}
		},
		{
			num = 10,
			type = 1,
			items = {
				{
					8,
					400
				}
			}
		}
	},
	[5] = {
		{
			num = 1,
			type = 2,
			items = {
				{
					8,
					60
				}
			}
		},
		{
			num = 3,
			type = 2,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 3,
			type = 1,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 5,
			type = 2,
			items = {
				{
					8,
					160
				}
			}
		},
		{
			num = 5,
			type = 1,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 2,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 1,
			items = {
				{
					8,
					300
				}
			}
		},
		{
			num = 10,
			type = 1,
			items = {
				{
					8,
					400
				}
			}
		}
	},
	[4] = {
		{
			num = 1,
			type = 2,
			items = {
				{
					8,
					60
				}
			}
		},
		{
			num = 3,
			type = 2,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 3,
			type = 1,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 5,
			type = 2,
			items = {
				{
					8,
					160
				}
			}
		},
		{
			num = 5,
			type = 1,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 2,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 1,
			items = {
				{
					8,
					300
				}
			}
		},
		{
			num = 10,
			type = 1,
			items = {
				{
					8,
					400
				}
			}
		}
	},
	[3] = {
		{
			num = 1,
			type = 2,
			items = {
				{
					8,
					60
				}
			}
		},
		{
			num = 3,
			type = 2,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 3,
			type = 1,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 5,
			type = 2,
			items = {
				{
					8,
					160
				}
			}
		},
		{
			num = 5,
			type = 1,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 2,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 1,
			items = {
				{
					8,
					300
				}
			}
		},
		{
			num = 10,
			type = 1,
			items = {
				{
					8,
					400
				}
			}
		}
	},
	[2] = {
		{
			num = 1,
			type = 2,
			items = {
				{
					8,
					60
				}
			}
		},
		{
			num = 3,
			type = 2,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 3,
			type = 1,
			items = {
				{
					8,
					100
				}
			}
		},
		{
			num = 5,
			type = 2,
			items = {
				{
					8,
					160
				}
			}
		},
		{
			num = 5,
			type = 1,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 2,
			items = {
				{
					8,
					200
				}
			}
		},
		{
			num = 8,
			type = 1,
			items = {
				{
					8,
					300
				}
			}
		},
		{
			num = 10,
			type = 1,
			items = {
				{
					8,
					400
				}
			}
		}
	}
}
Config.ZsWarData.data_rank_rewards_length = 6
Config.ZsWarData.data_rank_rewards = {
	{
		{
			group = 1,
			desc = "胜方奖励",
			items = {
				{
					8,
					600
				}
			}
		},
		{
			group = 1,
			desc = "败方奖励",
			items = {
				{
					8,
					320
				}
			}
		},
		{
			group = 1,
			desc = "平局奖励",
			items = {
				{
					8,
					480
				}
			}
		},
		{
			group = 1,
			desc = "第1名",
			items = {
				{
					50047,
					1
				},
				{
					50603,
					1
				},
				{
					8,
					2000
				},
				{
					1,
					5000000
				},
				{
					3,
					500
				}
			}
		},
		{
			group = 1,
			desc = "第2名",
			items = {
				{
					50602,
					1
				},
				{
					8,
					1400
				},
				{
					1,
					3000000
				},
				{
					3,
					400
				}
			}
		},
		{
			group = 1,
			desc = "第3名",
			items = {
				{
					50601,
					1
				},
				{
					8,
					1000
				},
				{
					1,
					2000000
				},
				{
					3,
					300
				}
			}
		},
		{
			group = 1,
			desc = "4~10名",
			items = {
				{
					8,
					800
				},
				{
					1,
					1000000
				},
				{
					3,
					200
				}
			}
		},
		{
			group = 1,
			desc = "11~20名",
			items = {
				{
					8,
					700
				},
				{
					1,
					600000
				},
				{
					3,
					100
				}
			}
		},
		{
			group = 1,
			desc = "21~32名",
			items = {
				{
					8,
					500
				},
				{
					1,
					300000
				},
				{
					3,
					100
				}
			}
		}
	},
	[6] = {
		{
			group = 6,
			desc = "胜方奖励",
			items = {
				{
					8,
					600
				}
			}
		},
		{
			group = 6,
			desc = "败方奖励",
			items = {
				{
					8,
					320
				}
			}
		},
		{
			group = 6,
			desc = "平局奖励",
			items = {
				{
					8,
					480
				}
			}
		},
		{
			group = 6,
			desc = "第1名",
			items = {
				{
					50047,
					1
				},
				{
					50603,
					1
				},
				{
					8,
					2000
				},
				{
					1,
					5000000
				},
				{
					3,
					500
				}
			}
		},
		{
			group = 6,
			desc = "第2名",
			items = {
				{
					50602,
					1
				},
				{
					8,
					1400
				},
				{
					1,
					3000000
				},
				{
					3,
					400
				}
			}
		},
		{
			group = 6,
			desc = "第3名",
			items = {
				{
					50601,
					1
				},
				{
					8,
					1000
				},
				{
					1,
					2000000
				},
				{
					3,
					300
				}
			}
		},
		{
			group = 6,
			desc = "4~10名",
			items = {
				{
					8,
					800
				},
				{
					1,
					1000000
				},
				{
					3,
					200
				}
			}
		},
		{
			group = 6,
			desc = "11~20名",
			items = {
				{
					8,
					700
				},
				{
					1,
					600000
				},
				{
					3,
					100
				}
			}
		},
		{
			group = 6,
			desc = "21~32名",
			items = {
				{
					8,
					500
				},
				{
					1,
					300000
				},
				{
					3,
					100
				}
			}
		}
	},
	[5] = {
		{
			group = 5,
			desc = "胜方奖励",
			items = {
				{
					8,
					600
				}
			}
		},
		{
			group = 5,
			desc = "败方奖励",
			items = {
				{
					8,
					320
				}
			}
		},
		{
			group = 5,
			desc = "平局奖励",
			items = {
				{
					8,
					480
				}
			}
		},
		{
			group = 5,
			desc = "第1名",
			items = {
				{
					50047,
					1
				},
				{
					50603,
					1
				},
				{
					8,
					2000
				},
				{
					1,
					5000000
				},
				{
					3,
					500
				}
			}
		},
		{
			group = 5,
			desc = "第2名",
			items = {
				{
					50602,
					1
				},
				{
					8,
					1400
				},
				{
					1,
					3000000
				},
				{
					3,
					400
				}
			}
		},
		{
			group = 5,
			desc = "第3名",
			items = {
				{
					50601,
					1
				},
				{
					8,
					1000
				},
				{
					1,
					2000000
				},
				{
					3,
					300
				}
			}
		},
		{
			group = 5,
			desc = "4~10名",
			items = {
				{
					8,
					800
				},
				{
					1,
					1000000
				},
				{
					3,
					200
				}
			}
		},
		{
			group = 5,
			desc = "11~20名",
			items = {
				{
					8,
					700
				},
				{
					1,
					600000
				},
				{
					3,
					100
				}
			}
		},
		{
			group = 5,
			desc = "21~32名",
			items = {
				{
					8,
					500
				},
				{
					1,
					300000
				},
				{
					3,
					100
				}
			}
		}
	},
	[4] = {
		{
			group = 4,
			desc = "胜方奖励",
			items = {
				{
					8,
					600
				}
			}
		},
		{
			group = 4,
			desc = "败方奖励",
			items = {
				{
					8,
					320
				}
			}
		},
		{
			group = 4,
			desc = "平局奖励",
			items = {
				{
					8,
					480
				}
			}
		},
		{
			group = 4,
			desc = "第1名",
			items = {
				{
					50047,
					1
				},
				{
					50603,
					1
				},
				{
					8,
					2000
				},
				{
					1,
					5000000
				},
				{
					3,
					500
				}
			}
		},
		{
			group = 4,
			desc = "第2名",
			items = {
				{
					50602,
					1
				},
				{
					8,
					1400
				},
				{
					1,
					3000000
				},
				{
					3,
					400
				}
			}
		},
		{
			group = 4,
			desc = "第3名",
			items = {
				{
					50601,
					1
				},
				{
					8,
					1000
				},
				{
					1,
					2000000
				},
				{
					3,
					300
				}
			}
		},
		{
			group = 4,
			desc = "4~10名",
			items = {
				{
					8,
					800
				},
				{
					1,
					1000000
				},
				{
					3,
					200
				}
			}
		},
		{
			group = 4,
			desc = "11~20名",
			items = {
				{
					8,
					700
				},
				{
					1,
					600000
				},
				{
					3,
					100
				}
			}
		},
		{
			group = 4,
			desc = "21~32名",
			items = {
				{
					8,
					500
				},
				{
					1,
					300000
				},
				{
					3,
					100
				}
			}
		}
	},
	[3] = {
		{
			group = 3,
			desc = "胜方奖励",
			items = {
				{
					8,
					600
				}
			}
		},
		{
			group = 3,
			desc = "败方奖励",
			items = {
				{
					8,
					320
				}
			}
		},
		{
			group = 3,
			desc = "平局奖励",
			items = {
				{
					8,
					480
				}
			}
		},
		{
			group = 3,
			desc = "第1名",
			items = {
				{
					50047,
					1
				},
				{
					50603,
					1
				},
				{
					8,
					2000
				},
				{
					1,
					5000000
				},
				{
					3,
					500
				}
			}
		},
		{
			group = 3,
			desc = "第2名",
			items = {
				{
					50602,
					1
				},
				{
					8,
					1400
				},
				{
					1,
					3000000
				},
				{
					3,
					400
				}
			}
		},
		{
			group = 3,
			desc = "第3名",
			items = {
				{
					50601,
					1
				},
				{
					8,
					1000
				},
				{
					1,
					2000000
				},
				{
					3,
					300
				}
			}
		},
		{
			group = 3,
			desc = "4~10名",
			items = {
				{
					8,
					800
				},
				{
					1,
					1000000
				},
				{
					3,
					200
				}
			}
		},
		{
			group = 3,
			desc = "11~20名",
			items = {
				{
					8,
					700
				},
				{
					1,
					600000
				},
				{
					3,
					100
				}
			}
		},
		{
			group = 3,
			desc = "21~32名",
			items = {
				{
					8,
					500
				},
				{
					1,
					300000
				},
				{
					3,
					100
				}
			}
		}
	},
	[2] = {
		{
			group = 2,
			desc = "胜方奖励",
			items = {
				{
					8,
					600
				}
			}
		},
		{
			group = 2,
			desc = "败方奖励",
			items = {
				{
					8,
					320
				}
			}
		},
		{
			group = 2,
			desc = "平局奖励",
			items = {
				{
					8,
					480
				}
			}
		},
		{
			group = 2,
			desc = "第1名",
			items = {
				{
					50047,
					1
				},
				{
					50603,
					1
				},
				{
					8,
					2000
				},
				{
					1,
					5000000
				},
				{
					3,
					500
				}
			}
		},
		{
			group = 2,
			desc = "第2名",
			items = {
				{
					50602,
					1
				},
				{
					8,
					1400
				},
				{
					1,
					3000000
				},
				{
					3,
					400
				}
			}
		},
		{
			group = 2,
			desc = "第3名",
			items = {
				{
					50601,
					1
				},
				{
					8,
					1000
				},
				{
					1,
					2000000
				},
				{
					3,
					300
				}
			}
		},
		{
			group = 2,
			desc = "4~10名",
			items = {
				{
					8,
					800
				},
				{
					1,
					1000000
				},
				{
					3,
					200
				}
			}
		},
		{
			group = 2,
			desc = "11~20名",
			items = {
				{
					8,
					700
				},
				{
					1,
					600000
				},
				{
					3,
					100
				}
			}
		},
		{
			group = 2,
			desc = "21~32名",
			items = {
				{
					8,
					500
				},
				{
					1,
					300000
				},
				{
					3,
					100
				}
			}
		}
	}
}
Config.ZsWarData.data_group_length = 6
Config.ZsWarData.data_group = {
	{
		name = "顶上战争LV1"
	},
	{
		name = "顶上战争LV2"
	},
	{
		name = "顶上战争LV3"
	},
	{
		name = "顶上战争LV4"
	},
	{
		name = "顶上战争LV5"
	},
	{
		name = "顶上战争LV6"
	}
}

function Config.ZsWarData.data_group_fun(slot0)
	slot1 = Config.ZsWarData.data_group[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ZsWarData.data_group[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
