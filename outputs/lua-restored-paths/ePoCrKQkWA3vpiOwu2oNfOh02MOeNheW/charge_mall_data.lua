Config = Config or {}
Config.ChargeMallData = Config.ChargeMallData or {}
Config.ChargeMallData.data_const_length = 1
Config.ChargeMallData.data_const = {
	skin_mall_lev = {
		val = 35,
		key = "skin_mall_lev",
		desc = "35级开启"
	}
}

function Config.ChargeMallData.data_const_fun(slot0)
	slot1 = Config.ChargeMallData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeMallData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeMallData.data_charge_shop_length = 9
Config.ChargeMallData.data_charge_shop = {
	{
		first_tab = 1,
		res_id = "mall_charge_btn_1",
		name = "超值召唤",
		bg_id = "",
		id = 1,
		sort = 1,
		subtype = {
			4,
			5,
			6,
			7
		},
		limit = {},
		limit_2 = {}
	},
	{
		first_tab = 1,
		res_id = "mall_charge_btn_2",
		name = "特惠材料",
		bg_id = "",
		id = 2,
		sort = 2,
		subtype = {
			8,
			9
		},
		limit = {
			{
				"lev",
				10
			}
		},
		limit_2 = {
			{
				"lev",
				10
			},
			{
				"open_day",
				15
			}
		}
	},
	{
		first_tab = 1,
		res_id = "mall_charge_btn_3",
		name = "特权商城",
		bg_id = "txt_cn_privilege_bg",
		id = 3,
		sort = 3,
		subtype = {},
		limit = {},
		limit_2 = {}
	},
	{
		first_tab = 0,
		res_id = "mall_charge_sub_btn_1",
		name = "钻石商城",
		bg_id = "charge_diamond_bg",
		id = 4,
		sort = 4,
		subtype = {},
		limit = {},
		limit_2 = {}
	},
	{
		first_tab = 0,
		res_id = "mall_charge_sub_btn_2",
		name = "每日特惠",
		bg_id = "txt_cn_dialy_bg",
		id = 5,
		sort = 1,
		subtype = {},
		limit = {},
		limit_2 = {}
	},
	{
		first_tab = 0,
		res_id = "mall_charge_sub_btn_3",
		name = "每周限购",
		bg_id = "txt_cn_weekly_bg",
		id = 6,
		sort = 2,
		subtype = {},
		limit = {
			{
				"lev",
				10
			},
			{
				"charge_num",
				100
			}
		},
		limit_2 = {}
	},
	{
		first_tab = 0,
		res_id = "mall_charge_sub_btn_4",
		name = "月度限量",
		bg_id = "txt_cn_monthly_bg",
		id = 7,
		sort = 3,
		subtype = {},
		limit = {
			{
				"lev",
				10
			}
		},
		limit_2 = {}
	},
	{
		first_tab = 0,
		res_id = "mall_charge_sub_btn_5",
		name = "限时礼包",
		bg_id = "txt_cn_time_bg",
		id = 8,
		sort = 1,
		subtype = {},
		limit = {
			{
				"lev",
				10
			},
			{
				"charge_num",
				100
			}
		},
		limit_2 = {
			{
				"lev",
				10
			},
			{
				"open_day",
				15
			}
		}
	},
	{
		first_tab = 0,
		res_id = "mall_charge_sub_btn_6",
		name = "成长自选",
		bg_id = "txt_cn_cloth_bg",
		id = 9,
		sort = 2,
		subtype = {},
		limit = {
			{
				"lev",
				70
			}
		},
		limit_2 = {}
	}
}

function Config.ChargeMallData.data_charge_shop_fun(slot0)
	slot1 = Config.ChargeMallData.data_charge_shop[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeMallData.data_charge_shop[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ChargeMallData.data_skin_mall_length = 6
Config.ChargeMallData.data_skin_mall = {
	[1003] = {
		skin_bid = 23007,
		charge_id = 1403,
		id = 1003,
		skin_id = 103,
		price = 1280,
		sort = 1,
		award = {
			{
				3,
				1980
			},
			{
				23007,
				1
			}
		}
	},
	[1004] = {
		skin_bid = 23010,
		charge_id = 1404,
		id = 1004,
		skin_id = 104,
		price = 1280,
		sort = 2,
		award = {
			{
				3,
				1980
			},
			{
				23010,
				1
			}
		}
	},
	[1005] = {
		skin_bid = 23013,
		charge_id = 1405,
		id = 1005,
		skin_id = 105,
		price = 1280,
		sort = 3,
		award = {
			{
				3,
				3280
			},
			{
				23013,
				1
			}
		}
	},
	[1006] = {
		skin_bid = 23016,
		charge_id = 1406,
		id = 1006,
		skin_id = 106,
		price = 1280,
		sort = 4,
		award = {
			{
				3,
				3280
			},
			{
				23016,
				1
			}
		}
	},
	[1008] = {
		skin_bid = 23022,
		charge_id = 1408,
		id = 1008,
		skin_id = 108,
		price = 1280,
		sort = 6,
		award = {
			{
				3,
				3280
			},
			{
				23022,
				1
			}
		}
	},
	[1011] = {
		skin_bid = 23031,
		charge_id = 1411,
		id = 1011,
		skin_id = 111,
		price = 1280,
		sort = 5,
		award = {
			{
				3,
				3280
			},
			{
				23031,
				1
			}
		}
	}
}

function Config.ChargeMallData.data_skin_mall_fun(slot0)
	slot1 = Config.ChargeMallData.data_skin_mall[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ChargeMallData.data_skin_mall[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
