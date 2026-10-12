Config = Config or {}
Config.PackageData = Config.PackageData or {}
Config.PackageData.data_backpack_cost_length = 8
Config.PackageData.data_backpack_cost = {
	bag_vol_def = {
		val = 999,
		key = "bag_vol_def",
		desc = "角色背包初始格子数"
	},
	bag_vol_max = {
		val = 999,
		key = "bag_vol_max",
		desc = "角色背包最大格子数"
	},
	partner_eqm_vol_def = {
		val = 999,
		key = "partner_eqm_vol_def",
		desc = "伙伴装备背包基础格子数"
	},
	bag_vol_open_def = {
		val = 5,
		key = "bag_vol_open_def",
		desc = "角色背包每次开启的格子数"
	},
	eqm_bag_vol_open_def = {
		val = 10,
		key = "eqm_bag_vol_open_def",
		desc = "装备背包每次开启的格子数"
	},
	eqm_bag_vol_max = {
		val = 999,
		key = "eqm_bag_vol_max",
		desc = "装备背包最大格子数"
	},
	open_lev = {
		val = 70,
		key = "open_lev",
		desc = "装备背包一键出售按钮开启等级"
	},
	limit_lev = {
		val = 100,
		key = "limit_lev",
		desc = "装备背包一键出售限制条件"
	}
}

function Config.PackageData.data_backpack_cost_fun(slot0)
	slot1 = Config.PackageData.data_backpack_cost[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PackageData.data_backpack_cost[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PackageData.data_backpack_use_length = 1
Config.PackageData.data_backpack_use = {
	[3] = {
		{
			num = 1,
			type = 3,
			loss = {
				{
					3,
					50
				}
			}
		},
		{
			num = 2,
			type = 3,
			loss = {
				{
					3,
					100
				}
			}
		},
		{
			num = 3,
			type = 3,
			loss = {
				{
					3,
					150
				}
			}
		},
		{
			num = 4,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 5,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 6,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 7,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 8,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 9,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 10,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 11,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 12,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		},
		{
			num = 13,
			type = 3,
			loss = {
				{
					3,
					200
				}
			}
		}
	}
}
