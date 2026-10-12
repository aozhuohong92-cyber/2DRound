Config = Config or {}
Config.CrossGroundData = Config.CrossGroundData or {}
Config.CrossGroundData.data_base_length = 4
Config.CrossGroundData.data_base = {
	{
		{
			id = 1004,
			name = "周冠军赛",
			res_id = 4,
			index = 2,
			groud = 1,
			desc = "每周日12点-13点开启",
			open_limit = {
				{
					"lev",
					55
				}
			},
			award = {
				72109,
				10453
			}
		},
		{
			id = 1001,
			name = "跨服天梯",
			res_id = 1,
			index = 1,
			groud = 1,
			desc = "每周六0点-周日23点开启",
			open_limit = {
				{
					"lev",
					55
				}
			},
			award = {
				50801,
				38101
			}
		}
	},
	{
		{
			id = 1005,
			name = "组队竞技场",
			res_id = 5,
			index = 3,
			groud = 2,
			desc = "每周五12点-周日23点开启",
			open_limit = {
				{
					"lev",
					70
				}
			},
			award = {
				51201,
				30,
				3,
				29961
			}
		}
	},
	[3] = {
		{
			id = 1002,
			name = "超凡段位赛",
			res_id = 2,
			index = 4,
			groud = 3,
			desc = "每日0点-23点30分开启",
			open_limit = {
				{
					"world_lev",
					100
				},
				{
					"lev",
					100
				}
			},
			award = {
				51001,
				72111,
				10454,
				27,
				3
			}
		}
	},
	[4] = {
		{
			id = 1006,
			name = "巅峰冠军赛",
			res_id = 6,
			index = 6,
			groud = 4,
			desc = "每日一场 / 20点30分开战",
			open_limit = {
				{
					"world_lev",
					120
				},
				{
					"lev",
					90
				}
			},
			award = {
				72112,
				50024,
				10603
			}
		},
		{
			id = 1003,
			name = "跨服竞技场",
			res_id = 3,
			index = 5,
			groud = 4,
			desc = "每周二、四、六全天开启",
			open_limit = {
				{
					"world_lev",
					120
				},
				{
					"lev",
					115
				}
			},
			award = {
				51101,
				29961
			}
		}
	}
}
Config.CrossGroundData.data_adventure_activity_length = 3
Config.CrossGroundData.data_adventure_activity = {
	{
		retrue_id = 1,
		item_desc = "神界冒险每2天重置1次",
		desc = "50级开启",
		desc2 = "",
		id = 1,
		res_id = 1,
		activate = {
			{
				"lev",
				50
			}
		},
		activate_2 = {},
		award = {
			{
				1,
				1
			},
			{
				72001,
				1
			},
			{
				10450,
				1
			}
		}
	},
	[3] = {
		retrue_id = 2,
		item_desc = "周一到周五轮流开启，周末全部开启",
		desc = "90级开启",
		desc2 = "",
		id = 3,
		res_id = 2,
		activate = {
			{
				"lev",
				90
			}
		},
		activate_2 = {},
		award = {
			{
				17011,
				1
			},
			{
				17001,
				1
			},
			{
				17002,
				1
			},
			{
				17003,
				1
			},
			{
				17004,
				1
			},
			{
				17005,
				1
			}
		}
	},
	[4] = {
		retrue_id = 3,
		item_desc = "全天开放，参与获英雄神装",
		desc = "105级 且 世界等级110级 开启",
		desc2 = "或 只需个人达120级开启",
		id = 4,
		res_id = 3,
		activate = {
			{
				"world_lev",
				110
			},
			{
				"lev",
				105
			}
		},
		activate_2 = {
			{
				"lev",
				120
			}
		},
		award = {
			{
				17193,
				1
			},
			{
				28,
				1
			},
			{
				10030,
				1
			},
			{
				3,
				1
			}
		}
	}
}

function Config.CrossGroundData.data_adventure_activity_fun(slot0)
	slot1 = Config.CrossGroundData.data_adventure_activity[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CrossGroundData.data_adventure_activity[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
