Config = Config or {}
Config.ArenaChampionData = Config.ArenaChampionData or {}
Config.ArenaChampionData.data_const_length = 29
Config.ArenaChampionData.data_const = {
	time_score_start = {
		desc = "积分赛开始时间",
		val = {
			21,
			0,
			5
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
		desc = "32强冠军赛准备时间"
	},
	time_champion_guess = {
		val = 90,
		desc = "32强冠军赛下注时间"
	},
	time_champion_fight = {
		val = 180,
		desc = "32强冠军赛战斗时间"
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
		desc = "32强赛每轮给予的筹码数量"
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
		val = 128,
		desc = "积分赛参赛资格数量"
	},
	battel_score = {
		val = 80,
		desc = "循环赛积分加成系数"
	},
	base_score = {
		val = 600,
		desc = "机器人初始积分"
	},
	score_arg = {
		val = 5,
		desc = "机器人积分系数"
	},
	battle_champion = {
		val = 90003,
		desc = "冠军赛冠军称号"
	},
	battle_secondplace = {
		val = 90004,
		desc = "冠军赛亚军称号"
	},
	battle_thirdplace = {
		val = 90005,
		desc = "冠军赛季军称号"
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
	combat_down = {
		val = 900,
		desc = "填充玩家镜像数据机器人的战力衰减（千分比）"
	},
	wave_lev_max = {
		val = 15,
		desc = "等级波动上限"
	},
	wave_lev_min = {
		val = 40,
		desc = "等级波动下限"
	},
	hero_bid_limit = {
		desc = "剔除拥有该英雄的阵容",
		val = {
			20504
		}
	}
}

function Config.ArenaChampionData.data_const_fun(slot0)
	slot1 = Config.ArenaChampionData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaChampionData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaChampionData.data_awards_length = 11
Config.ArenaChampionData.data_awards = {
	{
		min = 1,
		max = 1,
		items = {
			{
				50012,
				1
			},
			{
				8,
				6000
			},
			{
				1,
				240000
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				50013,
				1
			},
			{
				8,
				5000
			},
			{
				1,
				200000
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				50014,
				1
			},
			{
				8,
				4500
			},
			{
				1,
				180000
			}
		}
	},
	{
		min = 4,
		max = 4,
		items = {
			{
				8,
				4000
			},
			{
				1,
				160000
			}
		}
	},
	{
		min = 5,
		max = 8,
		items = {
			{
				8,
				3600
			},
			{
				1,
				144000
			}
		}
	},
	{
		min = 9,
		max = 16,
		items = {
			{
				8,
				3200
			},
			{
				1,
				128000
			}
		}
	},
	{
		min = 17,
		max = 32,
		items = {
			{
				8,
				3000
			},
			{
				1,
				120000
			}
		}
	},
	{
		min = 33,
		max = 50,
		items = {
			{
				8,
				2600
			},
			{
				1,
				104000
			}
		}
	},
	{
		min = 51,
		max = 80,
		items = {
			{
				8,
				2200
			},
			{
				1,
				88000
			}
		}
	},
	{
		min = 81,
		max = 100,
		items = {
			{
				8,
				2000
			},
			{
				1,
				80000
			}
		}
	},
	{
		min = 101,
		max = 128,
		items = {
			{
				8,
				1800
			},
			{
				1,
				72000
			}
		}
	}
}
Config.ArenaChampionData.data_explain_length = 5
Config.ArenaChampionData.data_explain = {
	{
		id = 1,
		title = "基础规则",
		desc = [[
1.冠军赛由选拔赛和三十二强赛组成
2.每个竞技场赛季的第<div fontcolor=#d95014>三</div>和第<div fontcolor=#d95014>六</div>天，将选出<div fontcolor=#d95014>排位赛排行榜前128名</div>玩家自动参加比赛
3.比赛形式为1V1的单阵容对抗模式
4.若比赛战斗超时，则伤害总量高的一方获胜]]
	},
	{
		id = 2,
		title = "选拔赛规则",
		desc = "1.选拔赛在当天<div fontcolor=#d95014>21:05开启</div>，共6轮比赛。每轮比赛分准备阶段（用于更换阵容）、竞猜阶段（用于参与竞猜玩法）和战斗阶段\n2.每轮比赛胜利获得选拔赛积分，失败不得分\n3.最后的总积分等于选拔赛积分和加上一定比例的排位赛积分。总积分排名前32的玩家将参加三十二强比赛"
	},
	{
		id = 3,
		title = "三十二强赛规则",
		desc = "1.三十二强赛在选拔赛结束后开启，分四组进行。赛制为淘汰赛，最终决出冠军、亚军、季军\n2.季军的名次由4强中选拔赛总分的高低决定"
	},
	{
		id = 4,
		title = "竞猜规则",
		desc = [[
1.每轮比赛将对一场指定赛事发起竞猜，可在竞猜阶段进行下注。<div fontcolor=#d95014>每轮只能下注一次，无法更改</div>
2.每轮比赛开始时都将发放竞猜所用竞猜币
3.<div fontcolor=#d95014>竞猜正确获得对应赔率的竞猜币</div>，错误则扣除下注的竞猜币
4.冠军赛结束后竞猜币自动结算为可用于积分商城兑换道具的竞技声望]]
	},
	{
		id = 5,
		title = "奖励发放",
		desc = "1.冠军赛结束后按照最终排名通过邮件发放奖励"
	}
}

function Config.ArenaChampionData.data_explain_fun(slot0)
	slot1 = Config.ArenaChampionData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaChampionData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
