Config = Config or {}
Config.HolidayValentinesData = Config.HolidayValentinesData or {}
Config.HolidayValentinesData.data_const_length = 11
Config.HolidayValentinesData.data_const = {
	base_max_score = {
		val = 100000,
		desc = "基础积分上限"
	},
	score_item_id = {
		val = 99974,
		desc = "积分道具id"
	},
	holiday_item1 = {
		val = 99975,
		desc = "五角星道具id"
	},
	holiday_item2 = {
		val = 99976,
		desc = "旗杆道具id"
	},
	holiday_item3 = {
		val = 99977,
		desc = "红旗id"
	},
	holiday_score1 = {
		val = 1,
		desc = "五角星对应贡献积分"
	},
	holiday_score2 = {
		val = 5,
		desc = "旗杆对应贡献积分"
	},
	holiday_score3 = {
		val = 10,
		desc = "红旗对应贡献积分"
	},
	holiday_quester = {
		val = 93018,
		desc = "国庆节任务活动id"
	},
	item_gain = {
		val = 991048,
		desc = "国庆节道具获取id"
	},
	holiday_rule = {
		val = 1,
		desc = [[
<div fontcolor=#fca000>活动时间：</div>10月1日至10月7日24点
<div fontcolor=#fca000>玩法说明：</div>
1.活动期间，通过完成国庆节任务（盛世中国）获取道具，向五星红旗捐献道具（五角星/旗杆/红旗），可增加五星红旗经验从而提升五星红旗等级，同时也能获得<div fontcolor=#00ff00>个人积分</div>与<div fontcolor=#00ff00>积分币</div>
2.五星红旗每提升一级，解锁的等级奖励就会更丰厚，全服可领，全民一起努力更容易获得奖励哦！
3.捐献越多的冒险者排名越高，国庆积分排行榜在活动结束后会结算排行奖励，请在邮件查收哦
4.积分币可在国庆节<div fontcolor=#00ff00>积分币商城</div>兑换奖励，积分币的使用不会减少排行榜个人积分，<div fontcolor=#00ff00>2月19日24点活动结束后积分币会清零</div>，请及时使用！
5.积分计算规则：1五角星=1积分，1旗杆=5积分，1红旗=10积分，1积分=1国庆积分币]]
	}
}

function Config.HolidayValentinesData.data_const_fun(slot0)
	slot1 = Config.HolidayValentinesData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayValentinesData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayValentinesData.data_award_length = 7
Config.HolidayValentinesData.data_award = {
	{
		id = 1,
		count = 160,
		award = {
			{
				10408,
				200
			}
		}
	},
	{
		id = 2,
		count = 300,
		award = {
			{
				10407,
				200
			}
		}
	},
	{
		id = 3,
		count = 440,
		award = {
			{
				641236,
				2
			}
		}
	},
	{
		id = 4,
		count = 580,
		award = {
			{
				641236,
				5
			}
		}
	},
	{
		id = 5,
		count = 720,
		award = {
			{
				888805,
				2
			}
		}
	},
	{
		id = 6,
		count = 860,
		award = {
			{
				888805,
				5
			}
		}
	},
	{
		id = 7,
		count = 1000,
		award = {
			{
				641236,
				5
			},
			{
				888805,
				5
			}
		}
	}
}

function Config.HolidayValentinesData.data_award_fun(slot0)
	slot1 = Config.HolidayValentinesData.data_award[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayValentinesData.data_award[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayValentinesData.data_rank_award_length = 6
Config.HolidayValentinesData.data_rank_award = {
	{
		rank1 = 1,
		rank2 = 1,
		award = {
			{
				51210,
				1
			},
			{
				888805,
				10
			},
			{
				88828,
				2
			},
			{
				39528,
				2
			},
			{
				10457,
				1
			}
		}
	},
	{
		rank1 = 2,
		rank2 = 2,
		award = {
			{
				51210,
				1
			},
			{
				888805,
				5
			},
			{
				88828,
				1
			},
			{
				39528,
				1
			},
			{
				10456,
				1
			}
		}
	},
	{
		rank1 = 3,
		rank2 = 3,
		award = {
			{
				51210,
				1
			},
			{
				888805,
				3
			},
			{
				88827,
				2
			},
			{
				39527,
				2
			}
		}
	},
	{
		rank1 = 4,
		rank2 = 5,
		award = {
			{
				51210,
				1
			},
			{
				888805,
				1
			},
			{
				88827,
				1
			},
			{
				39527,
				1
			}
		}
	},
	{
		rank1 = 6,
		rank2 = 10,
		award = {
			{
				51210,
				1
			},
			{
				888805,
				1
			},
			{
				88826,
				2
			},
			{
				39526,
				2
			}
		}
	},
	{
		rank1 = 11,
		rank2 = 25,
		award = {
			{
				51210,
				1
			},
			{
				641236,
				1
			}
		}
	}
}
