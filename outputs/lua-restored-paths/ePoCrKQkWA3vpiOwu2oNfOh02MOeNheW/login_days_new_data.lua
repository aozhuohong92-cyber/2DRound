Config = Config or {}
Config.LoginDaysNewData = Config.LoginDaysNewData or {}
Config.LoginDaysNewData.data_day_length = 8
Config.LoginDaysNewData.data_day = {
	{
		reward_desc = "海量贝里",
		name = "第一天",
		action = 5,
		desc = "海量贝里",
		day_desc = "海量贝里",
		next_desc = "海量经验",
		day = 1,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				1,
				1000000
			}
		},
		pos = {
			{
				281,
				104
			}
		},
		spec_reward = {
			4
		}
	},
	{
		reward_desc = "海量经验",
		name = "第二天",
		action = 4,
		desc = "海量经验",
		day_desc = "海量经验",
		next_desc = "海量突破卡",
		day = 2,
		is_spe_day = 0,
		icon = 5051,
		rewards = {
			{
				22,
				1000000
			}
		},
		pos = {
			{
				318,
				102
			}
		},
		spec_reward = {
			26016
		}
	},
	{
		reward_desc = "海量突破卡",
		name = "第三天",
		action = 6,
		desc = "海量突破卡",
		day_desc = "海量突破卡",
		next_desc = "海量钻石",
		day = 3,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				10001,
				10000
			}
		},
		pos = {
			{
				294,
				102
			}
		},
		spec_reward = {
			10402
		}
	},
	{
		reward_desc = "海量钻石",
		name = "第四天",
		action = 7,
		desc = "海量钻石",
		day_desc = "海量钻石",
		next_desc = "高级百连抽",
		day = 4,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				3,
				20000
			}
		},
		pos = {
			{
				301,
				104
			}
		},
		spec_reward = {
			44105
		}
	},
	{
		reward_desc = "高级百连抽",
		name = "第五天",
		action = 2,
		desc = "高级百连抽",
		day_desc = "高级百连抽",
		next_desc = "精英百连抽",
		day = 5,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				10403,
				100
			}
		},
		pos = {
			{
				257,
				103
			}
		},
		spec_reward = {
			60033
		}
	},
	{
		reward_desc = "精英百连抽",
		name = "第六天",
		action = 3,
		desc = "精英百连抽",
		day_desc = "精英百连抽",
		next_desc = "海量贝里",
		day = 6,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				10408,
				100
			}
		},
		pos = {
			{
				293,
				104
			}
		},
		spec_reward = {
			35113
		}
	},
	{
		reward_desc = "海量贝里",
		name = "第七天",
		action = 9,
		desc = "海量贝里",
		day_desc = "海量贝里",
		next_desc = "海量经验",
		day = 7,
		is_spe_day = 0,
		icon = 5052,
		rewards = {
			{
				1,
				2000000
			}
		},
		pos = {
			{
				275,
				71
			}
		},
		spec_reward = {
			26055
		}
	},
	{
		reward_desc = "海量经验",
		name = "第八天",
		action = 9,
		desc = "海量经验",
		day_desc = "海量经验",
		next_desc = "",
		day = 8,
		is_spe_day = 0,
		icon = 5052,
		rewards = {
			{
				22,
				2000000
			}
		},
		pos = {
			{
				275,
				71
			}
		},
		spec_reward = {
			26055
		}
	}
}

function Config.LoginDaysNewData.data_day_fun(slot0)
	slot1 = Config.LoginDaysNewData.data_day[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.LoginDaysNewData.data_day[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
