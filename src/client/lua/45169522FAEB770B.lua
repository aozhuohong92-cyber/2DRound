Config = Config or {}
Config.PrivilegeData = Config.PrivilegeData or {}
Config.PrivilegeData.data_const_length = 0
Config.PrivilegeData.data_const = {}

function Config.PrivilegeData.data_const_fun(slot0)
	slot1 = Config.PrivilegeData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PrivilegeData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PrivilegeData.data_fast_combat_cost_length = 8
Config.PrivilegeData.data_fast_combat_cost = {
	{
		cost = 200
	},
	{
		cost = 200
	},
	{
		cost = 200
	},
	{
		cost = 200
	},
	{
		cost = 200
	},
	{
		cost = 200
	},
	{
		cost = 200
	},
	{
		cost = 200
	}
}

function Config.PrivilegeData.data_fast_combat_cost_fun(slot0)
	slot1 = Config.PrivilegeData.data_fast_combat_cost[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PrivilegeData.data_fast_combat_cost[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PrivilegeData.data_privilege_data_length = 6
Config.PrivilegeData.data_privilege_data = {
	[101] = {
		limit_lev = 0,
		limit_type = 1,
		charge_id = 304,
		name = "强者招募礼包",
		icon_id = "10",
		loss = 30,
		limit_day = 7,
		desc = "召唤强力英雄必购礼包！超值优惠，每周限购一次！",
		sort_id = 1,
		pay_type = 1,
		title_type = 1,
		id = 101
	},
	[102] = {
		limit_lev = 0,
		limit_type = 1,
		charge_id = 305,
		name = "快速作战特权",
		icon_id = "10",
		loss = 68,
		limit_day = 30,
		desc = "搜集资源特权！每天三次免费快速作战，再送召唤福利！",
		sort_id = 2,
		pay_type = 1,
		title_type = 1,
		id = 102
	},
	[103] = {
		limit_lev = 0,
		limit_type = 0,
		charge_id = 0,
		name = "远航高级特权",
		icon_id = "11",
		loss = 980,
		limit_day = 0,
		desc = "远航高级特权，每天首次远航刷新必出紫色任务！",
		sort_id = 7,
		pay_type = 2,
		title_type = 2,
		id = 103
	},
	[104] = {
		limit_lev = 0,
		limit_type = 0,
		charge_id = 0,
		name = "远航豪华特权",
		icon_id = "11",
		loss = 1980,
		limit_day = 0,
		desc = "远航豪华特权，每天第3次远航刷新必出橙色任务！",
		sort_id = 8,
		pay_type = 2,
		title_type = 2,
		id = 104
	},
	[105] = {
		limit_lev = 90,
		limit_type = 1,
		charge_id = 307,
		name = "领地挑战特权",
		icon_id = "12",
		loss = 30,
		limit_day = 30,
		desc = "领地挑战特权！每天两次额外免费次数，六次购买次数！",
		sort_id = 6,
		pay_type = 1,
		title_type = 3,
		id = 105
	},
	[106] = {
		limit_lev = 80,
		limit_type = 1,
		charge_id = 310,
		name = "幽灵培养特权",
		icon_id = "12",
		loss = 30,
		limit_day = 7,
		desc = "幽灵培养特权！专属灵窝，再送极品灵墓和培养道具！",
		sort_id = 3,
		pay_type = 1,
		title_type = 0,
		id = 106
	}
}

function Config.PrivilegeData.data_privilege_data_fun(slot0)
	slot1 = Config.PrivilegeData.data_privilege_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PrivilegeData.data_privilege_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PrivilegeData.data_privilege_award_length = 8
Config.PrivilegeData.data_privilege_award = {
	[108] = {
		{
			min = 1,
			max = 300,
			reward = {
				{
					1,
					200000
				},
				{
					10004,
					10
				},
				{
					10408,
					5
				}
			}
		}
	},
	[107] = {
		{
			min = 1,
			max = 300,
			reward = {
				{
					5,
					2000000
				},
				{
					10004,
					30
				},
				{
					10408,
					10
				}
			}
		}
	},
	[106] = {
		{
			min = 80,
			max = 300,
			reward = {
				{
					30057,
					1
				},
				{
					10603,
					3
				},
				{
					10040,
					10
				}
			}
		}
	},
	[105] = {
		{
			min = 1,
			max = 300,
			reward = {
				{
					30056,
					1
				},
				{
					14001,
					2
				},
				{
					10001,
					1000
				}
			}
		}
	},
	[104] = {
		{
			min = 1,
			max = 300,
			reward = {
				{
					30055,
					1
				},
				{
					14001,
					1
				},
				{
					10403,
					10
				}
			}
		}
	},
	[103] = {
		{
			min = 1,
			max = 300,
			reward = {
				{
					30054,
					1
				},
				{
					10403,
					5
				},
				{
					10001,
					200
				}
			}
		}
	},
	[102] = {
		{
			min = 1,
			max = 70,
			reward = {
				{
					30053,
					1
				},
				{
					10403,
					10
				},
				{
					10001,
					1000
				}
			}
		},
		{
			min = 71,
			max = 300,
			reward = {
				{
					30053,
					1
				},
				{
					10403,
					10
				},
				{
					10001,
					1000
				}
			}
		}
	},
	[101] = {
		{
			min = 1,
			max = 70,
			reward = {
				{
					14001,
					3
				},
				{
					10001,
					1000
				},
				{
					1,
					100000
				}
			}
		},
		{
			min = 71,
			max = 300,
			reward = {
				{
					14001,
					3
				},
				{
					10001,
					1000
				},
				{
					1,
					100000
				}
			}
		}
	}
}
