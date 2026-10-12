Config = Config or {}
Config.HolidayReturnData = Config.HolidayReturnData or {}
Config.HolidayReturnData.data_constant_length = 4
Config.HolidayReturnData.data_constant = {
	privilege_rule = {
		val = 1,
		label = "privilege_rule",
		desc = [[
1.回归特权共持续14天，包含加成，礼包以及币章获得
2.荣耀臂章可在回归商城兑换超值奖励
3.活动结束后商城会额外开启2日，但不能获得荣耀臂章
4.活动商城关闭后荣耀臂章将无法使用！]]
	},
	privilege_desc = {
		val = 1,
		label = "privilege_desc",
		desc = "1.7天未登录且等级达到10级，即可领取回归特权\n2.推图3倍加速，挂机奖励加成20%，升级升星材料减半（贝里，英雄经验，突破卡）\n3.活动期间完成任务和挂机战斗，可获得荣耀臂章（含快速战斗）"
	},
	store_rule = {
		val = 1,
		label = "store_rule",
		desc = "1.消耗荣耀臂章兑换超值奖励\n2.活动结束后商城会额外开启2日，但不能获得荣耀臂章\n3.活动商城关闭后荣耀臂章将无法使用！"
	},
	item_id = {
		val = 80120,
		label = "item_id",
		desc = "活动道具"
	}
}

function Config.HolidayReturnData.data_constant_fun(slot0)
	slot1 = Config.HolidayReturnData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnData.data_action_holiday_length = 1
Config.HolidayReturnData.data_action_holiday = {
	{
		[101] = {
			panel_res = "txt_cn_returnaction1",
			panel_type = 121,
			camp_id = 101,
			min_day = 1,
			period = 1,
			title = "回归特权",
			ico = "125",
			max_day = 14
		},
		[102] = {
			panel_res = "txt_cn_returnaction2",
			panel_type = 122,
			camp_id = 102,
			min_day = 1,
			period = 1,
			title = "回归签到",
			ico = "126",
			max_day = 14
		},
		[103] = {
			panel_res = "txt_cn_welfare_return1",
			panel_type = 123,
			camp_id = 103,
			min_day = 1,
			period = 1,
			title = "回归任务",
			ico = "127",
			max_day = 14
		},
		[104] = {
			panel_res = "txt_cn_welfare_return2",
			panel_type = 124,
			camp_id = 104,
			min_day = 1,
			period = 1,
			title = "回归商城",
			ico = "128",
			max_day = 16
		},
		[105] = {
			panel_res = "txt_cn_welfare_return3",
			panel_type = 125,
			camp_id = 105,
			min_day = 1,
			period = 1,
			title = "超值特惠",
			ico = "129",
			max_day = 14
		}
	}
}
Config.HolidayReturnData.data_privilege_length = 1
Config.HolidayReturnData.data_privilege = {
	{
		new_price = 6,
		change_id = 1101,
		old_price = 198,
		rewards = {
			{
				10403,
				10
			},
			{
				37001,
				2
			},
			{
				10002,
				3
			},
			{
				1,
				1000000
			}
		}
	}
}

function Config.HolidayReturnData.data_privilege_fun(slot0)
	slot1 = Config.HolidayReturnData.data_privilege[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnData.data_privilege[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnData.data_shop_length = 10
Config.HolidayReturnData.data_shop = {
	{
		r_limit_day = 1,
		sub_type = 1,
		r_limit_all = 14,
		id = 1,
		title = "活动限兑",
		expend = {
			{
				80120,
				1
			}
		},
		award = {
			{
				3,
				100
			}
		}
	},
	{
		r_limit_day = 3,
		sub_type = 1,
		r_limit_all = 42,
		id = 2,
		title = "活动限兑",
		expend = {
			{
				80120,
				5
			}
		},
		award = {
			{
				10450,
				250
			}
		}
	},
	{
		r_limit_day = 3,
		sub_type = 1,
		r_limit_all = 42,
		id = 3,
		title = "活动限兑",
		expend = {
			{
				80120,
				5
			}
		},
		award = {
			{
				37001,
				5
			}
		}
	},
	{
		r_limit_day = 3,
		sub_type = 1,
		r_limit_all = 42,
		id = 4,
		title = "活动限兑",
		expend = {
			{
				80120,
				5
			}
		},
		award = {
			{
				10403,
				1
			}
		}
	},
	{
		r_limit_day = 0,
		sub_type = 2,
		r_limit_all = 10,
		id = 5,
		title = "活动限兑",
		expend = {
			{
				80120,
				10
			}
		},
		award = {
			{
				38092,
				1
			}
		}
	},
	{
		r_limit_day = 0,
		sub_type = 2,
		r_limit_all = 20,
		id = 6,
		title = "活动限兑",
		expend = {
			{
				80120,
				10
			}
		},
		award = {
			{
				37002,
				2
			}
		}
	},
	{
		r_limit_day = 0,
		sub_type = 2,
		r_limit_all = 10,
		id = 7,
		title = "活动限兑",
		expend = {
			{
				80120,
				10
			}
		},
		award = {
			{
				14001,
				1
			}
		}
	},
	{
		r_limit_day = 0,
		sub_type = 2,
		r_limit_all = 5,
		id = 8,
		title = "活动限兑",
		expend = {
			{
				80120,
				20
			}
		},
		award = {
			{
				10453,
				1
			}
		}
	},
	{
		r_limit_day = 0,
		sub_type = 2,
		r_limit_all = 1,
		id = 9,
		title = "活动限兑",
		expend = {
			{
				80120,
				20
			}
		},
		award = {
			{
				29905,
				50
			}
		}
	},
	{
		r_limit_day = 0,
		sub_type = 2,
		r_limit_all = 1,
		id = 10,
		title = "活动限兑",
		expend = {
			{
				80120,
				30
			}
		},
		award = {
			{
				27905,
				50
			}
		}
	}
}

function Config.HolidayReturnData.data_shop_fun(slot0)
	slot1 = Config.HolidayReturnData.data_shop[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnData.data_shop[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnData.data_signin_length = 7
Config.HolidayReturnData.data_signin = {
	{
		name = "第一天",
		day = 1,
		rewards = {
			{
				10403,
				1
			},
			{
				29905,
				5
			}
		}
	},
	{
		name = "第二天",
		day = 2,
		rewards = {
			{
				3,
				200
			},
			{
				29905,
				5
			}
		}
	},
	{
		name = "第三天",
		day = 3,
		rewards = {
			{
				37001,
				5
			},
			{
				29905,
				5
			}
		}
	},
	{
		name = "第四天",
		day = 4,
		rewards = {
			{
				10403,
				1
			},
			{
				29905,
				5
			}
		}
	},
	{
		name = "第五天",
		day = 5,
		rewards = {
			{
				10450,
				200
			},
			{
				29905,
				10
			}
		}
	},
	{
		name = "第六天",
		day = 6,
		rewards = {
			{
				72001,
				20
			},
			{
				29905,
				10
			}
		}
	},
	{
		name = "第七天",
		day = 7,
		rewards = {
			{
				50908,
				1
			},
			{
				29905,
				10
			}
		}
	}
}

function Config.HolidayReturnData.data_signin_fun(slot0)
	slot1 = Config.HolidayReturnData.data_signin[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayReturnData.data_signin[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayReturnData.data_recharge_length = 1
Config.HolidayReturnData.data_recharge = {
	{
		[0] = {
			name = "0元特惠礼包",
			charge_id = 0,
			period = 1,
			val = 0,
			limit_count = 1,
			reward = {
				{
					37001,
					2
				},
				{
					10002,
					3
				},
				{
					10001,
					100
				},
				{
					80120,
					1
				}
			}
		},
		[1102] = {
			name = "30元特惠礼包",
			charge_id = 1102,
			period = 1,
			val = 30,
			limit_count = 3,
			reward = {
				{
					10403,
					3
				},
				{
					72001,
					30
				},
				{
					37001,
					2
				},
				{
					80120,
					5
				}
			}
		},
		[1103] = {
			name = "68元特惠礼包",
			charge_id = 1103,
			period = 1,
			val = 68,
			limit_count = 3,
			reward = {
				{
					10403,
					7
				},
				{
					10450,
					500
				},
				{
					10001,
					300
				},
				{
					80120,
					12
				}
			}
		},
		[1104] = {
			name = "128元特惠礼包",
			charge_id = 1104,
			period = 1,
			val = 128,
			limit_count = 3,
			reward = {
				{
					14001,
					2
				},
				{
					37002,
					1
				},
				{
					1,
					1000000
				},
				{
					80120,
					24
				}
			}
		},
		[1105] = {
			name = "328元特惠礼包",
			charge_id = 1105,
			period = 1,
			val = 328,
			limit_count = 3,
			reward = {
				{
					29905,
					50
				},
				{
					14001,
					2
				},
				{
					38081,
					1
				},
				{
					80120,
					65
				}
			}
		},
		[1106] = {
			name = "448元特惠礼包",
			charge_id = 1106,
			period = 1,
			val = 448,
			limit_count = 2,
			reward = {
				{
					14001,
					5
				},
				{
					37002,
					5
				},
				{
					1,
					5000000
				},
				{
					80120,
					88
				}
			}
		},
		[1107] = {
			name = "648元特惠礼包",
			charge_id = 1107,
			period = 1,
			val = 648,
			limit_count = 1,
			reward = {
				{
					29906,
					50
				},
				{
					14001,
					5
				},
				{
					38061,
					1
				},
				{
					80120,
					128
				}
			}
		}
	}
}
Config.HolidayReturnData.data_task_length = 1
Config.HolidayReturnData.data_task = {
	{
		[1001] = {
			source_id = 0,
			id = 1001,
			title = "日常登录",
			desc = "日常登录1次",
			award = {
				{
					80120,
					1
				}
			}
		},
		[1002] = {
			source_id = 402,
			id = 1002,
			title = "好友赠送",
			desc = "每天赠送好友友情点5次",
			award = {
				{
					80120,
					1
				}
			}
		},
		[1003] = {
			source_id = 120,
			id = 1003,
			title = "召唤",
			desc = "进行3次召唤",
			award = {
				{
					80120,
					2
				}
			}
		},
		[1004] = {
			source_id = 158,
			id = 1004,
			title = "竞技场",
			desc = "参与3次竞技场挑战",
			award = {
				{
					80120,
					2
				}
			}
		},
		[1005] = {
			source_id = 132,
			id = 1005,
			title = "快速作战",
			desc = "快速作战5次",
			award = {
				{
					80120,
					2
				}
			}
		},
		[1006] = {
			source_id = 160,
			id = 1006,
			title = "深海监狱挑战",
			desc = "挑战或扫荡深海监狱任意层3次",
			award = {
				{
					80120,
					2
				}
			}
		},
		[1007] = {
			source_id = 153,
			id = 1007,
			title = "无尽试炼",
			desc = "参与1次无尽试炼",
			award = {
				{
					80120,
					2
				}
			}
		},
		[1008] = {
			source_id = 126,
			id = 1008,
			title = "悬赏任务",
			desc = "接取3次远航订单",
			award = {
				{
					80120,
					5
				}
			}
		},
		[1009] = {
			source_id = 152,
			id = 1009,
			title = "神技副本",
			desc = "参与2次日常副本",
			award = {
				{
					80120,
					5
				}
			}
		},
		[1010] = {
			source_id = 151,
			id = 1010,
			title = "英雄远征",
			desc = "英雄远征胜利3次",
			award = {
				{
					80120,
					5
				}
			}
		}
	}
}
