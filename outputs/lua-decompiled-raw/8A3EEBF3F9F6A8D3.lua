Config = Config or {}
Config.HolidayDialData = Config.HolidayDialData or {}
Config.HolidayDialData.data_dial_const_length = 8
Config.HolidayDialData.data_dial_const = {
	cost_once = {
		val = 22000000000.0,
		key = "cost_once",
		desc = "抽取一次消耗钻石"
	},
	cost_ten = {
		val = 22000000000.0,
		key = "cost_ten",
		desc = "抽取十次消耗钻石"
	},
	lottery_ticket = {
		val = 37003,
		key = "lottery_ticket",
		desc = "抽奖券ID"
	},
	holiday_rule = {
		val = 1,
		key = "holiday_rule",
		desc = [[
<div fontcolor=#fca000>玩法说明：</div><div fontcolor=#e7d499>
1.活动期间消耗</div><div fontcolor=#00ff00>星辰钥匙</div><div fontcolor=#e7d499>可进行转盘抽奖，每次抽奖可获得</div><div fontcolor=#00ff00>1</div><div fontcolor=#e7d499>积分，积分达到要求可获得</div><div fontcolor=#00ff00>相应奖励</div><div fontcolor=#e7d499>
2.全服玩家每次抽奖会有</div><div fontcolor=#00ff00>10</div><div fontcolor=#e7d499>钻石归入奖池中，若喜中</div><div fontcolor=#00ff00>一、二、三等奖</div><div fontcolor=#e7d499>后，将获得当前奖池</div><div fontcolor=#00ff00>50%、20%、10%</div><div fontcolor=#e7d499>比例钻石</div><div fontcolor=#fca000>
概率公示：</div><div fontcolor=#e7d499>
强力英雄整卡:</div><div fontcolor=#00ff00>2.85%</div><div fontcolor=#e7d499>
钻石奖励:</div><div fontcolor=#00ff00>6.75%</div><div fontcolor=#e7d499>
高级召唤券:</div><div fontcolor=#00ff00>5.0%</div><div fontcolor=#e7d499>
符文精华:</div><div fontcolor=#00ff00>41.15%</div><div fontcolor=#e7d499>
炼神石:</div><div fontcolor=#00ff00>12.10%</div><div fontcolor=#e7d499>
5星随机碎片*1:</div><div fontcolor=#00ff00>33.0%</div>]]
	},
	continue_time = {
		val = 10,
		key = "continue_time",
		desc = "连抽次数"
	},
	min_reward = {
		val = 10000,
		key = "min_reward",
		desc = "保底奖池钻石"
	},
	bouns_add = {
		val = 10,
		key = "bouns_add",
		desc = "单抽奖池增加钻石"
	},
	item_price = {
		val = 22000000000.0,
		key = "item_price",
		desc = "抽奖道具兑换价值"
	}
}

function Config.HolidayDialData.data_dial_const_fun(slot0)
	slot1 = Config.HolidayDialData.data_dial_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayDialData.data_dial_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayDialData.data_score_award_length = 10
Config.HolidayDialData.data_score_award = {
	{
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 1,
			num = 10,
			award_list = {
				{
					10450,
					100
				}
			}
		}
	},
	[10] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 10,
			num = 1800,
			award_list = {
				{
					10450,
					50000
				}
			}
		}
	},
	[9] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 9,
			num = 1500,
			award_list = {
				{
					10450,
					50000
				}
			}
		}
	},
	[8] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 8,
			num = 1200,
			award_list = {
				{
					10450,
					50000
				}
			}
		}
	},
	[7] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 7,
			num = 800,
			award_list = {
				{
					10450,
					50000
				}
			}
		}
	},
	[6] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 6,
			num = 500,
			award_list = {
				{
					27907,
					50
				}
			}
		}
	},
	[5] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 5,
			num = 200,
			award_list = {
				{
					10450,
					2000
				}
			}
		}
	},
	[4] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 4,
			num = 100,
			award_list = {
				{
					29905,
					50
				}
			}
		}
	},
	[3] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 3,
			num = 50,
			award_list = {
				{
					10450,
					1000
				}
			}
		}
	},
	[2] = {
		{
			limit_lev_max = 999,
			limit_lev_min = 0,
			id = 2,
			num = 30,
			award_list = {
				{
					38080,
					1
				}
			}
		}
	}
}
Config.HolidayDialData.data_dial_item_length = 12
Config.HolidayDialData.data_dial_item = {
	{
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 99956,
			num = 1,
			other_type = 9,
			order = 1
		}
	},
	[12] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 10450,
			num = 1000,
			other_type = 0,
			order = 12
		}
	},
	[11] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 17009,
			num = 100,
			other_type = 0,
			order = 11
		}
	},
	[10] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 43,
			num = 500,
			other_type = 3,
			order = 10
		}
	},
	[9] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 72001,
			num = 10,
			other_type = 0,
			order = 9
		}
	},
	[8] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 29905,
			num = 1,
			other_type = 0,
			order = 8
		}
	},
	[7] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 43,
			num = 1000,
			other_type = 2,
			order = 7
		}
	},
	[6] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 39095,
			num = 4,
			other_type = 0,
			order = 6
		}
	},
	[5] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 72001,
			num = 1000,
			other_type = 0,
			order = 5
		}
	},
	[4] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 43,
			num = 2000,
			other_type = 1,
			order = 4
		}
	},
	[3] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 90506,
			num = 5,
			other_type = 0,
			order = 3
		}
	},
	[2] = {
		{
			limit_lev_max = 999,
			percent = 0,
			limit_lev_min = 0,
			id = 39523,
			num = 4,
			other_type = 0,
			order = 2
		}
	}
}
