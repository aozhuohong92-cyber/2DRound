Config = Config or {}
Config.ArenaTeamData = Config.ArenaTeamData or {}
Config.ArenaTeamData.data_const_length = 22
Config.ArenaTeamData.data_const = {
	open_lev = {
		val = 70,
		desc = "70级开启组队竞技场"
	},
	init_score = {
		val = 1000,
		desc = "竞技场初始积分"
	},
	start_team_time = {
		desc = "组队开启时间{周几,时,分}",
		val = {
			5,
			12,
			0
		}
	},
	start_match_time = {
		desc = "比赛时间节点{周几,时,分}",
		val = {
			6,
			0,
			0
		}
	},
	end_time = {
		desc = "赛季结束时间节点",
		val = {
			7,
			23,
			0
		}
	},
	end_settlement_time = {
		desc = "赛季结算时间点",
		val = {
			7,
			23,
			40
		}
	},
	coefficient1 = {
		val = 2000,
		desc = "得分系数1"
	},
	coefficient2 = {
		val = 1.15,
		desc = "得分系数2"
	},
	coefficient3 = {
		val = 1300,
		desc = "得分系数3"
	},
	add_score = {
		val = 20,
		desc = "加分基础分"
	},
	add_coefficient1 = {
		val = 50,
		desc = "加分系数1"
	},
	reduce_score = {
		val = 0,
		desc = "扣分基础分"
	},
	reduce_coefficient1 = {
		val = 0,
		desc = "扣分系数1"
	},
	list_validity_time = {
		val = 300,
		desc = "挑战列表有效期（秒）"
	},
	initial_number = {
		val = 3,
		desc = "初始挑战次数"
	},
	limit_number = {
		val = 6,
		desc = "挑战次数存储上限"
	},
	recovery_time = {
		val = 7200,
		desc = "挑战次数回复CD（秒）"
	},
	guard_score = {
		val = 1150,
		desc = "保护分"
	},
	robot_headicon = {
		desc = "机器人随机头像",
		val = {
			10101,
			10201,
			10202,
			10301,
			10302,
			10303,
			10304,
			10305,
			10401,
			10402,
			10403,
			10404,
			10405,
			10501,
			10502,
			10503,
			10504,
			10505,
			10506,
			10507,
			10508,
			10509,
			20101,
			20201,
			20202,
			20301,
			20302,
			20303,
			20304,
			20305,
			20401,
			20402,
			20403,
			20404,
			20405,
			20501,
			20502,
			20503,
			20504,
			20505,
			20506,
			20507,
			20508,
			30101,
			30201,
			30202,
			30301,
			30302,
			30303,
			30304,
			30305,
			30401,
			30402,
			30403,
			30404,
			30405,
			30501,
			30502,
			30503,
			30504,
			30505,
			30506,
			30507,
			30508,
			40301,
			40401,
			40402,
			40403,
			40404,
			40501,
			40502,
			40503,
			40504,
			40505,
			40506,
			40507,
			50301,
			50401,
			50402,
			50403,
			50404,
			50501,
			50502,
			50503,
			50504,
			50505,
			50506,
			50507
		}
	},
	integral_higher = {
		val = 30,
		desc = "机器人队伍积分波动（上下波动）（低于保护分）"
	},
	integral_low = {
		val = 20,
		desc = "机器人队伍积分波动（上下波动）（高于保护分）"
	},
	refresh_cd = {
		val = 10,
		desc = "挑战列表刷新CD"
	}
}

function Config.ArenaTeamData.data_const_fun(slot0)
	slot1 = Config.ArenaTeamData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaTeamData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaTeamData.data_level_info_length = 6
Config.ArenaTeamData.data_level_info = {
	{
		id = 1,
		lev = 0
	},
	{
		id = 2,
		lev = 80
	},
	{
		id = 3,
		lev = 100
	},
	{
		id = 4,
		lev = 120
	},
	{
		id = 5,
		lev = 150
	},
	{
		id = 6,
		lev = 200
	}
}
Config.ArenaTeamData.data_power_info_length = 6
Config.ArenaTeamData.data_power_info = {
	{
		id = 1,
		power = 0
	},
	{
		id = 2,
		power = 300000
	},
	{
		id = 3,
		power = 800000
	},
	{
		id = 4,
		power = 1300000
	},
	{
		id = 5,
		power = 2000000
	},
	{
		id = 6,
		power = 3000000
	}
}
Config.ArenaTeamData.data_challenge_count_reward_info_length = 5
Config.ArenaTeamData.data_challenge_count_reward_info = {
	{
		id = 1,
		count = 5,
		award = {
			{
				30,
				300
			},
			{
				1,
				150000
			}
		}
	},
	{
		id = 2,
		count = 10,
		award = {
			{
				30,
				300
			},
			{
				10403,
				1
			}
		}
	},
	{
		id = 3,
		count = 15,
		award = {
			{
				30,
				300
			},
			{
				1,
				200000
			}
		}
	},
	{
		id = 4,
		count = 20,
		award = {
			{
				30,
				300
			},
			{
				10403,
				1
			}
		}
	},
	{
		id = 5,
		count = 25,
		award = {
			{
				30,
				300
			},
			{
				14001,
				1
			}
		}
	}
}
Config.ArenaTeamData.data_rank_reward_length = 8
Config.ArenaTeamData.data_rank_reward = {
	{
		min = 1,
		max = 1,
		items = {
			{
				30,
				8000
			},
			{
				43,
				1000000
			},
			{
				99899,
				1000
			},
			{
				37004,
				100
			}
		}
	},
	[3] = {
		min = 2,
		max = 3,
		items = {
			{
				30,
				6400
			},
			{
				43,
				500000
			},
			{
				99899,
				500
			},
			{
				37004,
				80
			}
		}
	},
	[5] = {
		min = 4,
		max = 5,
		items = {
			{
				30,
				4800
			},
			{
				43,
				300000
			},
			{
				99899,
				300
			},
			{
				37004,
				60
			}
		}
	},
	[10] = {
		min = 6,
		max = 10,
		items = {
			{
				30,
				4000
			},
			{
				43,
				200000
			},
			{
				99899,
				100
			},
			{
				37004,
				50
			}
		}
	},
	[20] = {
		min = 11,
		max = 20,
		items = {
			{
				30,
				3200
			},
			{
				43,
				100000
			},
			{
				99899,
				50
			},
			{
				37004,
				40
			}
		}
	},
	[50] = {
		min = 21,
		max = 50,
		items = {
			{
				30,
				2400
			},
			{
				43,
				50000
			},
			{
				99899,
				50
			},
			{
				37004,
				20
			}
		}
	},
	[100] = {
		min = 51,
		max = 100,
		items = {
			{
				30,
				1600
			},
			{
				43,
				20000
			},
			{
				99899,
				50
			},
			{
				37004,
				10
			}
		}
	},
	[999] = {
		min = 101,
		max = 999,
		items = {
			{
				30,
				800
			},
			{
				43,
				10000
			},
			{
				99899,
				50
			},
			{
				37004,
				5
			}
		}
	}
}

function Config.ArenaTeamData.data_rank_reward_fun(slot0)
	slot1 = Config.ArenaTeamData.data_rank_reward[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaTeamData.data_rank_reward[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaTeamData.data_explain_length = 3
Config.ArenaTeamData.data_explain = {
	{
		id = 1,
		title = "基础规则",
		desc = [[
1.当玩家达到<div fontcolor=289b14>70</div>级后，可参与组队竞技场玩法
2.组队竞技场将在每<div fontcolor=289b14>周五12:00</div>开放组队，<div fontcolor=289b14>周六00:00</div>正式开启挑战，<div fontcolor=289b14>周日23:00</div>关闭组队与挑战并进行结算处理（包括处理剩余未结束的战斗），<div fontcolor=289b14>周日23:40</div>正式结算并发放奖励
3.当队伍满3人后，队长可报名参赛，且正式开赛后，不可再进行人员变动
4.开赛后，队伍初始积分为<div fontcolor=289b14>1000分</div>，且不会因为扣分而降至1000分以下
5.初始挑战次数为<div fontcolor=289b14>3次</div>，每<div fontcolor=289b14>2小时</div>恢复<div fontcolor=289b14>1次</div>挑战次数，挑战次数储存上限为<div fontcolor=289b14>6次</div>
6.只有队长可在正式开赛后，选择挑战目标并发起挑战，队伍挑战成功将加分、失败积分不变；防守方队伍积分始终不变
7.仅有队长能调整阵型，且可以隐藏一个队员的出战信息，隐藏队员不影响队伍总战力显示
8.组队大厅—队伍列表中点击玩家头像显示为该玩家的剧情战斗布阵，并非组队竞技场布阵，但队伍列表的队伍总战力为玩家组队竞技场布阵队伍战力之和]]
	},
	{
		id = 2,
		title = "战斗规则",
		desc = "1.战斗将按照队长设置好的出战顺序进行车轮战，每场战斗中，胜利方队员将继承血量但不继承BUFF进入下一场战斗，对阵对面下一个出战选手\n2.单场战斗中，<div fontcolor=289b14>30个</div>回合内若未能结束战斗，则双方以伤害量做比较，总伤害量高的一方为胜，继承血量进入下一场战斗"
	},
	{
		id = 3,
		title = "奖励规则",
		desc = "1.正式开赛后到结算前，队员与队长都能领取挑战次数宝箱奖励，在结算前未领取的宝箱奖励将通过邮件补发\n2.赛季结算后，将按照排名通过邮件发放排名奖励\n3.组队竞技场的积分商店与跨服竞技场积分商店相通（包括积分、商店道具购买上限）"
	}
}

function Config.ArenaTeamData.data_explain_fun(slot0)
	slot1 = Config.ArenaTeamData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaTeamData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
