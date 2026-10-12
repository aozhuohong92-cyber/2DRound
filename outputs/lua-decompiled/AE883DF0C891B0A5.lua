Config = Config or {}
Config.ArenaData = Config.ArenaData or {}
Config.ArenaData.data_base_awards_length = 6
Config.ArenaData.data_base_awards = {
	{
		items = {}
	},
	{
		items = {}
	},
	{
		items = {}
	},
	[11] = {
		items = {}
	},
	[12] = {
		items = {}
	},
	[13] = {
		items = {}
	}
}

function Config.ArenaData.data_base_awards_fun(slot0)
	slot1 = Config.ArenaData.data_base_awards[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaData.data_base_awards[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaData.data_cup_length = 8
Config.ArenaData.data_cup = {
	{
		index = 1,
		name = "青铜",
		min_score = 800,
		max_score = 1099
	},
	{
		index = 2,
		name = "白银",
		min_score = 1100,
		max_score = 1299
	},
	{
		index = 3,
		name = "黄金",
		min_score = 1300,
		max_score = 1499
	},
	{
		index = 4,
		name = "铂金",
		min_score = 1500,
		max_score = 1799
	},
	{
		index = 5,
		name = "钻石",
		min_score = 1800,
		max_score = 9999
	},
	{
		index = 6,
		name = "大师",
		min_score = 10000,
		max_score = 49999
	},
	{
		index = 7,
		name = "宗师",
		min_score = 50000,
		max_score = 99999
	},
	{
		index = 8,
		name = "王者",
		min_score = 100000,
		max_score = 9999999
	}
}
Config.ArenaData.data_continue_length = 0
Config.ArenaData.data_continue = {}

function Config.ArenaData.data_continue_fun(slot0)
	slot1 = Config.ArenaData.data_continue[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaData.data_continue[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaData.data_continue_list_length = 0
Config.ArenaData.data_continue_list = {}
Config.ArenaData.data_activity_length = 9
Config.ArenaData.data_activity = {
	{
		min = 1,
		max = 1,
		items = {
			{
				43,
				100000
			},
			{
				99899,
				200
			},
			{
				37004,
				20
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				43,
				70000
			},
			{
				99899,
				100
			},
			{
				37004,
				15
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
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
				10
			}
		}
	},
	{
		min = 4,
		max = 5,
		items = {
			{
				43,
				30000
			},
			{
				37004,
				5
			}
		}
	},
	{
		min = 6,
		max = 10,
		items = {
			{
				43,
				10000
			},
			{
				37004,
				2
			}
		}
	},
	{
		min = 11,
		max = 20,
		items = {
			{
				43,
				5000
			},
			{
				37004,
				1
			}
		}
	},
	{
		min = 21,
		max = 50,
		items = {
			{
				3,
				100
			},
			{
				8,
				180
			}
		}
	},
	{
		min = 51,
		max = 100,
		items = {
			{
				3,
				50
			},
			{
				8,
				160
			}
		}
	},
	{
		min = 101,
		max = 99999,
		items = {
			{
				3,
				30
			},
			{
				8,
				140
			}
		}
	}
}
Config.ArenaData.data_season_num_reward_length = 7
Config.ArenaData.data_season_num_reward = {
	{
		num = 10,
		items = {
			{
				10002,
				5
			}
		}
	},
	{
		num = 20,
		items = {
			{
				10403,
				1
			}
		}
	},
	{
		num = 35,
		items = {
			{
				10403,
				1
			}
		}
	},
	{
		num = 50,
		items = {
			{
				37002,
				1
			}
		}
	},
	{
		num = 70,
		items = {
			{
				37002,
				1
			}
		}
	},
	{
		num = 90,
		items = {
			{
				14001,
				1
			}
		}
	},
	{
		num = 120,
		items = {
			{
				14001,
				1
			}
		}
	}
}
Config.ArenaData.data_awards_length = 9
Config.ArenaData.data_awards = {
	{
		min = 1,
		max = 1,
		items = {
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
				100
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				43,
				400000
			},
			{
				99899,
				300
			},
			{
				37004,
				80
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				43,
				300000
			},
			{
				99899,
				100
			},
			{
				37004,
				60
			}
		}
	},
	{
		min = 4,
		max = 5,
		items = {
			{
				43,
				200000
			},
			{
				99899,
				50
			},
			{
				37004,
				50
			}
		}
	},
	{
		min = 6,
		max = 10,
		items = {
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
	{
		min = 11,
		max = 20,
		items = {
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
	{
		min = 21,
		max = 50,
		items = {
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
	{
		min = 51,
		max = 100,
		items = {
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
	},
	{
		min = 101,
		max = 99999,
		items = {
			{
				43,
				5000
			},
			{
				99899,
				50
			},
			{
				37004,
				1
			}
		}
	}
}
Config.ArenaData.data_explain_length = 3
Config.ArenaData.data_explain = {
	{
		id = 1,
		title = "规则说明",
		desc = "1、在竞技场中，可以挑战本服中的其他玩家，提升竞技分数\n2、每天有<div fontcolor=289b14>3</div>次免费挑战机会，可消耗钻石购买额外次数\n3、每<div fontcolor=289b14>7天</div>为一个赛季，每个赛季第7天<div fontcolor=289b14>21:00</div>结算排名奖励，<div fontcolor=289b14>23:59</div>结算后的竞技场积分为当前的<div fontcolor=289b14>70%，最低1000</div>4、每个赛季的比赛场次达到<div fontcolor=289b14>30</div>后，将开启<div fontcolor=289b14>战斗跳过</div>功能"
	},
	{
		id = 2,
		title = "玩法规则",
		desc = [[
1、根据自身竞技积分匹配对手，优先匹配和自己竞技积分接近的其他玩家
2、挑战其他玩家胜利，自己竞技积分增加，对方积分减少，进攻失败不会减少积分
3、战胜的对手积分比自己高越多，胜利获得的积分就越高，相反则越低
4、竞技场布阵的防守阵容，将作为他人的进攻的战斗对象

5、每次进攻若超过<div fontcolor=289b14>20</div>回合没战胜对手，则本次进攻失败]]
	},
	{
		id = 3,
		title = "奖励规则",
		desc = [[
1、每次挑战对手后都可获得一份随机奖励，可获得进阶石、英雄经验、<div fontcolor=289b14>竞技声望</div>等，<div fontcolor=289b14>竞技声望</div>可用于在竞技商店中兑换道具
2.每个赛季挑战达到指定次数即可领取对应的宝箱奖励，宝箱奖励赛季结算后重置
3、每个赛季结束时，根据积分排名发放排名奖励，前三名拥有专属聊天头像框，可前往个人空间处进行设置
4、在冠军赛开启前，排名前<div fontcolor=289b14>128</div>名的玩家可获得冠军赛参赛资格，赢取更高荣耀与奖励]]
	}
}

function Config.ArenaData.data_explain_fun(slot0)
	slot1 = Config.ArenaData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ArenaData.data_const_length = 26
Config.ArenaData.data_const = {
	season_time = {
		desc = "赛季持续时间",
		val = {
			6,
			23,
			59,
			59
		}
	},
	init_score = {
		val = 1000,
		desc = "初始积分"
	},
	protect_score = {
		val = 1100,
		desc = "保护积分"
	},
	limit_lev = {
		val = 8,
		desc = "开启等级"
	},
	dun_id = {
		val = 0,
		desc = "通关卡达尔森林1开放竞技场"
	},
	face_list = {
		desc = "机器人随机头像",
		val = {
			10508,
			20401,
			20402,
			20403
		}
	},
	combat_num = {
		val = 5,
		desc = "每天免费挑战次数"
	},
	in_rank_min_score = {
		val = 801,
		desc = "上榜最小积分要求"
	},
	like_max = {
		val = 3,
		desc = "膜拜点赞最大次数"
	},
	ref_time = {
		val = 3,
		desc = "刷新列表CD时间"
	},
	lose_item_ratio = {
		val = 600,
		desc = "战败可获得奖励（千分比）"
	},
	min_score = {
		val = 800,
		desc = "最小积分"
	},
	hide_rank = {
		val = 20,
		desc = "排行前X名为神秘人"
	},
	score_iocn = {
		val = 9999,
		desc = "竞技积分图标ID"
	},
	hide_min_score = {
		val = 1100,
		desc = "神秘人最低积分"
	},
	reward_time = {
		desc = "赛季排名奖励结算时间",
		val = {
			6,
			20,
			59,
			59
		}
	},
	reset_score = {
		val = 700,
		desc = "赛季结算杯数保留系数（千分比）"
	},
	daily_reward_time = {
		desc = "奖励每日21:00通过邮件发放",
		val = {
			21,
			0,
			0
		}
	},
	arena_ticketcost = {
		desc = "挑战券消耗",
		val = {
			{
				10103,
				1
			}
		}
	},
	ticket_price = {
		desc = "挑战券购买价格",
		val = {
			{
				3,
				20
			}
		}
	},
	arena_ticket = {
		val = 10103,
		desc = "挑战券ID"
	},
	win_drop = {
		val = 20002,
		desc = "战斗胜利掉落"
	},
	lose_drop = {
		val = 20003,
		desc = "战斗失败掉落"
	},
	arena_skip_count = {
		val = 30,
		desc = "竞技场赛季可以跳过次数"
	},
	arena_skip_level = {
		val = 80,
		desc = "80级后可直接跳过战斗"
	},
	max_score = {
		val = 10000,
		desc = "超过1万积分"
	}
}

function Config.ArenaData.data_const_fun(slot0)
	slot1 = Config.ArenaData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ArenaData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
