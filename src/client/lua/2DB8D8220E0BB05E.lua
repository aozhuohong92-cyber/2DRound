Config = Config or {}
Config.ArenaClusterChampionData = Config.ArenaClusterChampionData or {}
Config.ArenaClusterChampionData.data_const_length = 31
Config.ArenaClusterChampionData.data_const = {
	time_score_start = {
		desc = "积分赛开始时间",
		val = {
			12,
			0,
			0
		}
	},
	time_score_ready = {
		val = 30,
		desc = "积分赛准备时间"
	},
	time_score_guess = {
		val = 90,
		desc = "积分赛下注时间"
	},
	time_score_fight = {
		val = 180,
		desc = "积分赛战斗时间"
	},
	time_champion_ready = {
		val = 30,
		desc = "64强冠军赛准备时间"
	},
	time_champion_guess = {
		val = 90,
		desc = "64强冠军赛下注时间"
	},
	time_champion_fight = {
		val = 180,
		desc = "64强冠军赛战斗时间"
	},
	base_power = {
		val = 100000,
		desc = "机器人基本战力（没有真实玩家时使用)"
	},
	base_lev = {
		val = 60,
		desc = "机器人基本等级（没有一个真实玩家时使用）"
	},
	face_list = {
		desc = "机器人头像信息",
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
	look_list = {
		desc = "机器人外观信息",
		val = {
			110401,
			110402,
			110403,
			110404,
			110405,
			120401,
			120402,
			120403,
			120404,
			120405,
			130401,
			130402,
			130403,
			130404,
			130405,
			140401,
			140402,
			140403,
			140404,
			150401,
			150402,
			150403,
			150404
		}
	},
	time_champion_end = {
		desc = "冠军赛结束时间",
		val = {
			1,
			23,
			59,
			59
		}
	},
	guess_number1 = {
		val = 60,
		desc = "积分赛每轮给予的筹码数量"
	},
	guess_number2 = {
		val = 60,
		desc = "64强赛每轮给予的筹码数量"
	},
	guess_limit = {
		val = 1000,
		desc = "竞猜单次押注上限"
	},
	guess_times = {
		val = 2000,
		desc = "竞猜成功获得的竞猜币倍数"
	},
	guess_coin = {
		val = 10,
		desc = "竞猜币每次加减数量"
	},
	battle_members = {
		val = 256,
		desc = "选拔赛参赛资格数量"
	},
	battel_score = {
		val = 80,
		desc = "循环赛积分加成系数"
	},
	base_score = {
		val = 400,
		desc = "机器人初始积分"
	},
	score_arg = {
		val = 1000,
		desc = "机器人初始积分系数"
	},
	battel_guess = {
		desc = "竞猜筛选战力差范围（三轮筛选）",
		val = {
			{
				0,
				50
			},
			{
				51,
				80
			},
			{
				81,
				100
			}
		}
	},
	like_max = {
		val = 3,
		desc = "每日点赞最大次数"
	},
	like_reward = {
		desc = "点赞奖励",
		val = {
			{
				34,
				50
			}
		}
	},
	guess_lev_limit = {
		val = 55,
		desc = "55级可参与竞猜玩法"
	},
	season_start = {
		desc = "赛季开启时间",
		val = {
			12,
			0,
			0
		}
	},
	season_end = {
		desc = "赛季结束时间",
		val = {
			13,
			0,
			0
		}
	},
	robot_win_score = {
		val = 100,
		desc = "机器人胜利积分系数"
	},
	like_redpoint_limit = {
		val = 55,
		desc = "红点显示等级"
	},
	open_number_limit = {
		val = 64,
		desc = "周冠军赛开启所需人数"
	},
	hallowskin_reward_rank = {
		val = 3,
		desc = "能获得神器皮肤死神镰刀的前x名"
	}
}

function Config.ArenaClusterChampionData.data_const_fun(slot0)
	slot1 = Config.ArenaClusterChampionData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaClusterChampionData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaClusterChampionData.data_awards_length = 12
Config.ArenaClusterChampionData.data_awards = {
	{
		min = 1,
		max = 1,
		items = {
			{
				72109,
				1
			},
			{
				34,
				9000
			},
			{
				1,
				540000
			},
			{
				43,
				5000000
			},
			{
				99899,
				1000
			}
		},
		awards = {
			{
				72109,
				1
			},
			{
				34,
				9000
			},
			{
				1,
				540000
			},
			{
				43,
				5000000
			},
			{
				99899,
				1000
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				72109,
				1
			},
			{
				34,
				7500
			},
			{
				1,
				450000
			},
			{
				43,
				2000000
			},
			{
				99899,
				500
			}
		},
		awards = {
			{
				72109,
				1
			},
			{
				34,
				7500
			},
			{
				1,
				450000
			},
			{
				43,
				2000000
			},
			{
				99899,
				500
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				72109,
				1
			},
			{
				34,
				6750
			},
			{
				1,
				405000
			},
			{
				43,
				1000000
			},
			{
				99899,
				300
			}
		},
		awards = {
			{
				72109,
				1
			},
			{
				34,
				6750
			},
			{
				1,
				405000
			},
			{
				43,
				1000000
			},
			{
				99899,
				300
			}
		}
	},
	{
		min = 4,
		max = 4,
		items = {
			{
				34,
				6000
			},
			{
				1,
				360000
			},
			{
				43,
				800000
			},
			{
				99899,
				200
			}
		},
		awards = {
			{
				34,
				6000
			},
			{
				1,
				360000
			},
			{
				43,
				800000
			},
			{
				99899,
				200
			}
		}
	},
	{
		min = 5,
		max = 8,
		items = {
			{
				34,
				5400
			},
			{
				1,
				324000
			},
			{
				43,
				600000
			},
			{
				99899,
				100
			}
		},
		awards = {
			{
				34,
				5400
			},
			{
				1,
				324000
			},
			{
				43,
				600000
			},
			{
				99899,
				100
			}
		}
	},
	{
		min = 9,
		max = 16,
		items = {
			{
				34,
				4800
			},
			{
				1,
				288000
			},
			{
				43,
				300000
			},
			{
				99899,
				0
			}
		},
		awards = {
			{
				34,
				4800
			},
			{
				1,
				288000
			},
			{
				43,
				300000
			},
			{
				99899,
				0
			}
		}
	},
	{
		min = 17,
		max = 32,
		items = {
			{
				34,
				4500
			},
			{
				1,
				270000
			},
			{
				43,
				200000
			},
			{
				99899,
				30
			}
		},
		awards = {
			{
				34,
				4500
			},
			{
				1,
				270000
			},
			{
				43,
				200000
			},
			{
				99899,
				30
			}
		}
	},
	{
		min = 33,
		max = 64,
		items = {
			{
				34,
				3900
			},
			{
				1,
				234000
			}
		},
		awards = {
			{
				34,
				3900
			},
			{
				1,
				234000
			}
		}
	},
	{
		min = 65,
		max = 100,
		items = {
			{
				34,
				3300
			},
			{
				1,
				198000
			}
		},
		awards = {
			{
				34,
				3300
			},
			{
				1,
				198000
			}
		}
	},
	{
		min = 101,
		max = 150,
		items = {
			{
				34,
				3000
			},
			{
				1,
				180000
			}
		},
		awards = {
			{
				34,
				3000
			},
			{
				1,
				180000
			}
		}
	},
	{
		min = 151,
		max = 200,
		items = {
			{
				34,
				2700
			},
			{
				1,
				162000
			}
		},
		awards = {
			{
				34,
				2700
			},
			{
				1,
				162000
			}
		}
	},
	{
		min = 201,
		max = 256,
		items = {
			{
				34,
				2400
			},
			{
				1,
				144000
			}
		},
		awards = {
			{
				34,
				2400
			},
			{
				1,
				144000
			}
		}
	}
}
Config.ArenaClusterChampionData.data_explain_length = 5
Config.ArenaClusterChampionData.data_explain = {
	{
		id = 1,
		title = "基础规则",
		desc = [[
1.周冠军赛由选拔赛和六十四强赛组成
2.每<div fontcolor=#d95014>周日12-13点</div>，届时系统将选取<div fontcolor=#d95014>跨服天梯</div>玩法前<div fontcolor=#d95014>256</div>名玩家<div fontcolor=#d95014>自动</div>进行赛事
3.拥有参赛资格的人数需<div fontcolor=#d95014>大于等于64</div>，否则比赛无法开启
4.比赛形式为1V1的单阵容对抗模式
5.若比赛战斗超时，则伤害总量高的一方获胜]]
	},
	{
		id = 2,
		title = "选拔赛规则",
		desc = "1.选拔赛在周日<div fontcolor=#d95014>12:00开启</div>，共6轮比赛。每轮比赛分准备阶段（用于更换阵容）、竞猜阶段（用于参与竞猜玩法）和战斗阶段\n2.每轮比赛胜利获得选拔赛积分，失败不得分\n3.最后的总积分等于选拔赛积分和加上跨服天梯排名带来的积分，天梯排名越高，获得的初始积分越高。总积分排名前64的玩家将参加六十四强比赛"
	},
	{
		id = 3,
		title = "六十四强赛规则",
		desc = "1.六十四强赛在选拔赛结束后开启，分八组进行。赛制为淘汰赛，最终决出冠军、亚军、季军\n2.季军的名次由4强中选拔赛总分的高低决定"
	},
	{
		id = 4,
		title = "竞猜规则",
		desc = [[
1.每轮比赛将对一场指定赛事发起竞猜，可在竞猜阶段进行下注。<div fontcolor=#d95014>每轮只能下注一次，无法更改</div>
2.每轮比赛开始时都将发放竞猜所用高级竞猜币
3.<div fontcolor=#d95014>竞猜正确获得对应赔率的高级竞猜币</div>，错误则扣除下注的高级竞猜币
4.周冠军赛结束后高级竞猜币自动结算为可用于冠军商店兑换道具的冠军币]]
	},
	{
		id = 5,
		title = "奖励发放",
		desc = "1.周冠军赛结束后按照最终排名通过邮件发放奖励"
	}
}

function Config.ArenaClusterChampionData.data_explain_fun(slot0)
	slot1 = Config.ArenaClusterChampionData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaClusterChampionData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
