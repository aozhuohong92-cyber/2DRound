Config = Config or {}
Config.DailyplayData = Config.DailyplayData or {}
Config.DailyplayData.data_limitactivity_length = 7
Config.DailyplayData.data_limitactivity = {
	{
		id = 1,
		name = "萌兽寻宝",
		is_open = 1,
		lock_desc = "开服第2天、主角达32级开启",
		desc = "奖励翻倍",
		activate = {
			{
				"open_day",
				2
			},
			{
				"lev",
				28
			}
		},
		val = {
			{
				10007,
				1,
				2
			}
		}
	},
	{
		id = 2,
		name = "帮会Boss狂欢",
		is_open = 1,
		lock_desc = "",
		desc = "11:00-13:00 奖励翻倍",
		activate = {
			{
				"lev",
				10
			}
		},
		val = {
			{
				10,
				2
			}
		}
	},
	{
		id = 3,
		name = "首席争霸",
		is_open = 0,
		lock_desc = "",
		desc = "",
		activate = {},
		val = {}
	},
	{
		id = 4,
		name = "众神战场",
		is_open = 1,
		lock_desc = "开服第4天、主角达45级开启",
		desc = "每日12:30-13:00、20:00-20:30开启",
		activate = {
			{
				"open_day",
				4
			},
			{
				"lev",
				45
			}
		},
		val = {
			{
				8,
				33000,
				2
			}
		}
	},
	{
		id = 5,
		name = "帮会战",
		is_open = 1,
		lock_desc = "",
		desc = "每周三、周六12:00-20:00开启",
		activate = {
			{
				"lev",
				1
			}
		},
		val = {}
	},
	{
		id = 6,
		name = "冠军赛",
		is_open = 1,
		lock_desc = "开服第6天开启",
		desc = "每个竞技场赛季的第三、六天21:05-22:00开启",
		activate = {
			{
				"open_day",
				6
			}
		},
		val = {}
	},
	{
		id = 7,
		name = "跨服天梯",
		is_open = 1,
		lock_desc = "跨服期间开启",
		desc = "跨服期间开启",
		activate = {},
		val = {
			{
				70003,
				1,
				21,
				10421
			}
		}
	}
}

function Config.DailyplayData.data_limitactivity_fun(slot0)
	slot1 = Config.DailyplayData.data_limitactivity[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DailyplayData.data_limitactivity[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DailyplayData.data_exerciseactivity_length = 4
Config.DailyplayData.data_exerciseactivity = {
	{
		name = "材料副本",
		goto_id = 2,
		id = 1,
		is_open = 1,
		lock_desc = "冒险家15级开启",
		desc = "参与可获得大量实用道具",
		pic_name = "txt_cn_activity_item_12",
		activate = {
			{
				"lev",
				15
			}
		},
		val = {
			{
				1,
				22,
				29904,
				72001
			}
		}
	},
	{
		name = "无尽试炼",
		goto_id = 1,
		id = 2,
		is_open = 1,
		lock_desc = "冒险家25级开启",
		desc = "参与可获得大量英雄经验",
		pic_name = "txt_cn_activity_item_11",
		activate = {
			{
				"lev",
				25
			}
		},
		val = {
			{
				22,
				1,
				10403,
				10450
			}
		}
	},
	{
		name = "长环岛冒险",
		goto_id = 3,
		id = 3,
		is_open = 1,
		lock_desc = "冒险家30级开启",
		desc = "参与可获得征战积分和贝里",
		pic_name = "txt_cn_activity_item_14",
		activate = {
			{
				"lev",
				30
			}
		},
		val = {
			{
				29905,
				29904,
				1,
				25
			}
		}
	},
	{
		name = "霸气修炼",
		goto_id = 4,
		id = 4,
		is_open = 1,
		lock_desc = "冒险家35级开启",
		desc = "参与争夺霸主，赢强力称号",
		pic_name = "txt_cn_activity_item_13",
		activate = {
			{
				"lev",
				35
			}
		},
		val = {
			{
				50701,
				50702,
				50703
			}
		}
	}
}

function Config.DailyplayData.data_exerciseactivity_fun(slot0)
	slot1 = Config.DailyplayData.data_exerciseactivity[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DailyplayData.data_exerciseactivity[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
