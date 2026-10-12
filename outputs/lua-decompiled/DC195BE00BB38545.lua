Config = Config or {}
Config.LoginDaysData = Config.LoginDaysData or {}
Config.LoginDaysData.data_day_length = 7
Config.LoginDaysData.data_day = {
	{
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第一天",
		action = 5,
		desc = "钻石200",
		day_desc = "领大量钻石",
		next_desc = "明日领鳄鱼",
		day = 1,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				3,
				200
			},
			{
				10001,
				100
			},
			{
				1,
				20000
			},
			{
				22,
				20000
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
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第二天",
		action = 4,
		desc = "五星鳄鱼",
		day_desc = "领五星鳄鱼",
		next_desc = "明日霍古巴克",
		day = 2,
		is_spe_day = 1,
		icon = 5051,
		rewards = {
			{
				26900,
				50
			},
			{
				10001,
				150
			},
			{
				1,
				30000
			},
			{
				22,
				30000
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
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第三天",
		action = 6,
		desc = "五星霍古巴克",
		day_desc = "领霍古巴克",
		next_desc = "明日领橙武",
		day = 3,
		is_spe_day = 1,
		icon = 505,
		rewards = {
			{
				26904,
				50
			},
			{
				10001,
				200
			},
			{
				1,
				50000
			},
			{
				22,
				50000
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
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第四天",
		action = 7,
		desc = "全套橙武",
		day_desc = "领橙武",
		next_desc = "明日高级券",
		day = 4,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				40108,
				1
			},
			{
				40308,
				1
			},
			{
				40208,
				1
			},
			{
				22,
				50000
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
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第五天",
		action = 2,
		desc = "高级寻宝",
		day_desc = "领寻宝券",
		next_desc = "明日刻印石",
		day = 5,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				37002,
				1
			},
			{
				10002,
				5
			},
			{
				1,
				100000
			},
			{
				22,
				80000
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
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第六天",
		action = 3,
		desc = "神技刻印石",
		day_desc = "领刻印石",
		next_desc = "明日强者招募令",
		day = 6,
		is_spe_day = 0,
		icon = 505,
		rewards = {
			{
				72003,
				1
			},
			{
				72001,
				10
			},
			{
				1,
				120000
			},
			{
				22,
				100000
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
		reward_desc = "这是一个很厉害的描述这是一个很厉害的描述",
		name = "第七天",
		action = 9,
		desc = "强者招募令",
		day_desc = "领强者招募令",
		next_desc = "领强者招募令",
		day = 7,
		is_spe_day = 0,
		icon = 5052,
		rewards = {
			{
				14001,
				1
			},
			{
				10001,
				300
			},
			{
				1,
				150000
			},
			{
				22,
				150000
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

function Config.LoginDaysData.data_day_fun(slot0)
	slot1 = Config.LoginDaysData.data_day[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.LoginDaysData.data_day[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
