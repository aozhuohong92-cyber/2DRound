Config = Config or {}
Config.DayGoalsData = Config.DayGoalsData or {}
Config.DayGoalsData.data_constant_length = 8
Config.DayGoalsData.data_constant = {
	over_time = {
		val = 7,
		label = "over_time",
		desc = "结束时间"
	},
	task_total = {
		val = 119,
		label = "task_total",
		desc = "全目标总任务数量"
	},
	rule_desc = {
		val = 1,
		label = "rule_desc",
		desc = "1、快速作战可直接收益"
	},
	day_item = {
		label = "day_item",
		desc = "七日目标图标展示",
		val = {
			10001,
			10403,
			8,
			10002,
			25,
			37001,
			40307
		}
	},
	day_item1 = {
		label = "day_item1",
		desc = "第二期七日目标图标展示",
		val = {
			10152,
			17,
			25,
			10002,
			10403,
			37002,
			40105
		}
	},
	day_item2 = {
		label = "day_item2",
		desc = "第三期七日目标图标展示",
		val = {
			8,
			17,
			25,
			10002,
			40106,
			17,
			10450
		}
	},
	day_item3 = {
		label = "day_item3",
		desc = "第四期七日目标图标展示",
		val = {
			40112,
			17,
			10403,
			10002,
			9,
			37001,
			72001
		}
	},
	limit_day_goals_charge_date = {
		label = "limit_day_goals_charge_date",
		desc = "限制该时间后开启的新服周期1的七日目标不再出现累充活动（2020年4月1日版本）",
		val = {
			{
				2020,
				4,
				2
			},
			{
				9,
				59,
				0
			}
		}
	}
}

function Config.DayGoalsData.data_constant_fun(slot0)
	slot1 = Config.DayGoalsData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DayGoalsData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DayGoalsData.data_welfarecollection_length = 3
Config.DayGoalsData.data_welfarecollection = {
	{
		{
			{
				goal_id = 20000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 1,
				id = 1,
				condition = {
					{
						"login",
						1
					}
				},
				award1 = {
					{
						3,
						100
					},
					{
						10001,
						100
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 20001,
				desc = "开服累充100元",
				show_icon = 131,
				period = 1,
				day = 1,
				id = 2,
				condition = {
					{
						"charge_rmb",
						100
					}
				},
				award1 = {
					{
						3,
						500
					},
					{
						10001,
						500
					}
				},
				extend = {}
			}
		},
		[7] = {
			{
				goal_id = 80000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 7,
				id = 1,
				condition = {
					{
						"login",
						7
					}
				},
				award1 = {
					{
						3,
						400
					},
					{
						27306,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 80001,
				desc = "开服累充5000元",
				show_icon = 131,
				period = 1,
				day = 7,
				id = 2,
				condition = {
					{
						"charge_rmb",
						5000
					}
				},
				award1 = {
					{
						3,
						15000
					},
					{
						27906,
						50
					}
				},
				extend = {}
			}
		},
		[6] = {
			{
				goal_id = 70000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 6,
				id = 1,
				condition = {
					{
						"login",
						6
					}
				},
				award1 = {
					{
						3,
						350
					},
					{
						37001,
						5
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 70001,
				desc = "开服累充3000元",
				show_icon = 131,
				period = 1,
				day = 6,
				id = 2,
				condition = {
					{
						"charge_rmb",
						3000
					}
				},
				award1 = {
					{
						3,
						7000
					},
					{
						14002,
						500
					}
				},
				extend = {}
			}
		},
		[5] = {
			{
				goal_id = 60000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 5,
				id = 1,
				condition = {
					{
						"login",
						5
					}
				},
				award1 = {
					{
						3,
						300
					},
					{
						40108,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 60001,
				desc = "开服累充2000元",
				show_icon = 131,
				period = 1,
				day = 5,
				id = 2,
				condition = {
					{
						"charge_rmb",
						2000
					}
				},
				award1 = {
					{
						3,
						5000
					},
					{
						10450,
						5000
					}
				},
				extend = {}
			}
		},
		[4] = {
			{
				goal_id = 50000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 4,
				id = 1,
				condition = {
					{
						"login",
						4
					}
				},
				award1 = {
					{
						3,
						250
					},
					{
						10002,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 50001,
				desc = "开服累充1000元",
				show_icon = 131,
				period = 1,
				day = 4,
				id = 2,
				condition = {
					{
						"charge_rmb",
						1000
					}
				},
				award1 = {
					{
						3,
						2000
					},
					{
						14001,
						1
					}
				},
				extend = {}
			}
		},
		[3] = {
			{
				goal_id = 40000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 3,
				id = 1,
				condition = {
					{
						"login",
						3
					}
				},
				award1 = {
					{
						3,
						200
					},
					{
						10103,
						5
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 40001,
				desc = "开服累充500元",
				show_icon = 131,
				period = 1,
				day = 3,
				id = 2,
				condition = {
					{
						"charge_rmb",
						500
					}
				},
				award1 = {
					{
						3,
						1500
					},
					{
						37002,
						1
					}
				},
				extend = {}
			},
			{
				goal_id = 40011,
				desc = "开服累充500元",
				show_icon = 131,
				period = 1,
				day = 3,
				id = 2,
				condition = {
					{
						"charge_rmb",
						500
					}
				},
				award1 = {
					{
						3,
						1500
					},
					{
						26907,
						50
					}
				},
				extend = {}
			},
			{
				goal_id = 40021,
				desc = "开服累充500元",
				show_icon = 131,
				period = 1,
				day = 3,
				id = 2,
				condition = {
					{
						"charge_rmb",
						500
					}
				},
				award1 = {
					{
						3,
						1500
					},
					{
						37002,
						1
					}
				},
				extend = {}
			}
		},
		[2] = {
			{
				goal_id = 30000,
				desc = "登陆1次",
				show_icon = 401,
				period = 1,
				day = 2,
				id = 1,
				condition = {
					{
						"login",
						2
					}
				},
				award1 = {
					{
						3,
						150
					},
					{
						10403,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 30001,
				desc = "开服累充200元",
				show_icon = 131,
				period = 1,
				day = 2,
				id = 2,
				condition = {
					{
						"charge_rmb",
						200
					}
				},
				award1 = {
					{
						3,
						1000
					},
					{
						10450,
						1000
					}
				},
				extend = {}
			}
		}
	},
	[7] = {
		{
			{
				goal_id = 27000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 1,
				id = 1,
				condition = {
					{
						"login",
						1
					}
				},
				award1 = {
					{
						3,
						100
					},
					{
						10001,
						100
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 27001,
				desc = "累充100元",
				show_icon = 131,
				period = 7,
				day = 1,
				id = 2,
				condition = {
					{
						"charge_rmb",
						100
					}
				},
				award1 = {
					{
						3,
						200
					},
					{
						10450,
						500
					}
				},
				extend = {}
			}
		},
		[7] = {
			{
				goal_id = 87000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 7,
				id = 1,
				condition = {
					{
						"login",
						7
					}
				},
				award1 = {
					{
						3,
						400
					},
					{
						27306,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 87001,
				desc = "累充5000元",
				show_icon = 131,
				period = 7,
				day = 7,
				id = 2,
				condition = {
					{
						"charge_rmb",
						5000
					}
				},
				award1 = {
					{
						3,
						8000
					},
					{
						27905,
						50
					}
				},
				extend = {}
			}
		},
		[6] = {
			{
				goal_id = 77000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 6,
				id = 1,
				condition = {
					{
						"login",
						6
					}
				},
				award1 = {
					{
						3,
						350
					},
					{
						37001,
						5
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 77001,
				desc = "累充3000元",
				show_icon = 131,
				period = 7,
				day = 6,
				id = 2,
				condition = {
					{
						"charge_rmb",
						3000
					}
				},
				award1 = {
					{
						3,
						5000
					},
					{
						38061,
						1
					}
				},
				extend = {}
			}
		},
		[5] = {
			{
				goal_id = 67000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 5,
				id = 1,
				condition = {
					{
						"login",
						5
					}
				},
				award1 = {
					{
						3,
						300
					},
					{
						40108,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 67001,
				desc = "累充2000元",
				show_icon = 131,
				period = 7,
				day = 5,
				id = 2,
				condition = {
					{
						"charge_rmb",
						2000
					}
				},
				award1 = {
					{
						3,
						3000
					},
					{
						10450,
						5000
					}
				},
				extend = {}
			}
		},
		[4] = {
			{
				goal_id = 57000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 4,
				id = 1,
				condition = {
					{
						"login",
						4
					}
				},
				award1 = {
					{
						3,
						250
					},
					{
						10002,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 57001,
				desc = "累充1000元",
				show_icon = 131,
				period = 7,
				day = 4,
				id = 2,
				condition = {
					{
						"charge_rmb",
						1000
					}
				},
				award1 = {
					{
						3,
						2000
					},
					{
						14001,
						1
					}
				},
				extend = {}
			}
		},
		[3] = {
			{
				goal_id = 47000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 3,
				id = 1,
				condition = {
					{
						"login",
						3
					}
				},
				award1 = {
					{
						3,
						200
					},
					{
						10103,
						5
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 47001,
				desc = "累充500元",
				show_icon = 131,
				period = 7,
				day = 3,
				id = 2,
				condition = {
					{
						"charge_rmb",
						500
					}
				},
				award1 = {
					{
						3,
						1000
					},
					{
						37002,
						1
					}
				},
				extend = {}
			}
		},
		[2] = {
			{
				goal_id = 37000,
				desc = "登陆1次",
				show_icon = 401,
				period = 7,
				day = 2,
				id = 1,
				condition = {
					{
						"login",
						2
					}
				},
				award1 = {
					{
						3,
						150
					},
					{
						10403,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 37001,
				desc = "累充200元",
				show_icon = 131,
				period = 7,
				day = 2,
				id = 2,
				condition = {
					{
						"charge_rmb",
						200
					}
				},
				award1 = {
					{
						3,
						400
					},
					{
						10403,
						3
					}
				},
				extend = {}
			}
		}
	},
	[4] = {
		{
			{
				goal_id = 23000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 1,
				id = 1,
				condition = {
					{
						"login",
						1
					}
				},
				award1 = {
					{
						3,
						100
					},
					{
						10001,
						100
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 23001,
				desc = "累充100元",
				show_icon = 131,
				period = 4,
				day = 1,
				id = 2,
				condition = {
					{
						"charge_rmb",
						100
					}
				},
				award1 = {
					{
						3,
						500
					},
					{
						10001,
						500
					}
				},
				extend = {}
			}
		},
		[7] = {
			{
				goal_id = 83000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 7,
				id = 1,
				condition = {
					{
						"login",
						7
					}
				},
				award1 = {
					{
						3,
						400
					},
					{
						27306,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 83001,
				desc = "累充5000元",
				show_icon = 131,
				period = 4,
				day = 7,
				id = 2,
				condition = {
					{
						"charge_rmb",
						5000
					}
				},
				award1 = {
					{
						3,
						15000
					},
					{
						28903,
						50
					}
				},
				extend = {}
			}
		},
		[6] = {
			{
				goal_id = 73000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 6,
				id = 1,
				condition = {
					{
						"login",
						6
					}
				},
				award1 = {
					{
						3,
						350
					},
					{
						37001,
						5
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 73001,
				desc = "累充3000元",
				show_icon = 131,
				period = 4,
				day = 6,
				id = 2,
				condition = {
					{
						"charge_rmb",
						3000
					}
				},
				award1 = {
					{
						3,
						7000
					},
					{
						38051,
						1
					}
				},
				extend = {}
			}
		},
		[5] = {
			{
				goal_id = 63000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 5,
				id = 1,
				condition = {
					{
						"login",
						5
					}
				},
				award1 = {
					{
						3,
						300
					},
					{
						40108,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 63001,
				desc = "累充2000元",
				show_icon = 131,
				period = 4,
				day = 5,
				id = 2,
				condition = {
					{
						"charge_rmb",
						2000
					}
				},
				award1 = {
					{
						3,
						5000
					},
					{
						10450,
						5000
					}
				},
				extend = {}
			}
		},
		[4] = {
			{
				goal_id = 53000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 4,
				id = 1,
				condition = {
					{
						"login",
						4
					}
				},
				award1 = {
					{
						3,
						250
					},
					{
						10002,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 53001,
				desc = "累充1000元",
				show_icon = 131,
				period = 4,
				day = 4,
				id = 2,
				condition = {
					{
						"charge_rmb",
						1000
					}
				},
				award1 = {
					{
						3,
						2000
					},
					{
						14001,
						1
					}
				},
				extend = {}
			}
		},
		[3] = {
			{
				goal_id = 43000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 3,
				id = 1,
				condition = {
					{
						"login",
						3
					}
				},
				award1 = {
					{
						3,
						200
					},
					{
						10103,
						5
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 43001,
				desc = "累充500元",
				show_icon = 131,
				period = 4,
				day = 3,
				id = 2,
				condition = {
					{
						"charge_rmb",
						500
					}
				},
				award1 = {
					{
						3,
						1500
					},
					{
						37002,
						1
					}
				},
				extend = {}
			}
		},
		[2] = {
			{
				goal_id = 33000,
				desc = "登陆1次",
				show_icon = 401,
				period = 4,
				day = 2,
				id = 1,
				condition = {
					{
						"login",
						2
					}
				},
				award1 = {
					{
						3,
						150
					},
					{
						10403,
						1
					},
					{
						10408,
						3
					}
				},
				extend = {}
			},
			{
				goal_id = 33001,
				desc = "累充200元",
				show_icon = 131,
				period = 4,
				day = 2,
				id = 2,
				condition = {
					{
						"charge_rmb",
						200
					}
				},
				award1 = {
					{
						3,
						1000
					},
					{
						10403,
						3
					}
				},
				extend = {}
			}
		}
	}
}
Config.DayGoalsData.data_growthtarget_length = 3
Config.DayGoalsData.data_growthtarget = {
	{
		{
			{
				target_type = 1,
				goal_id = 11010,
				desc = "通关剧情副本第20关",
				show_icon = 157,
				id = 1,
				day = 1,
				lev = 1,
				type_name = "剧情探索",
				period = 1,
				progress = {
					{
						cli_label = "evt_dungeon_pass",
						target = 10200,
						target_val = 1,
						param = {
							"chapter"
						}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						10001,
						30
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 11020,
				desc = "通关剧情副本第30关",
				show_icon = 157,
				id = 2,
				day = 1,
				lev = 1,
				type_name = "剧情探索",
				period = 1,
				progress = {
					{
						cli_label = "evt_dungeon_pass",
						target = 10300,
						target_val = 1,
						param = {
							"chapter"
						}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						10001,
						30
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 11030,
				desc = "通关剧情副本第40关",
				show_icon = 157,
				id = 3,
				day = 1,
				lev = 1,
				type_name = "剧情探索",
				period = 1,
				progress = {
					{
						cli_label = "evt_dungeon_pass",
						target = 10400,
						target_val = 1,
						param = {
							"chapter"
						}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						10001,
						30
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 11040,
				desc = "通关剧情副本第50关",
				show_icon = 157,
				id = 4,
				day = 1,
				lev = 1,
				type_name = "剧情探索",
				period = 1,
				progress = {
					{
						cli_label = "evt_dungeon_pass",
						target = 20080,
						target_val = 1,
						param = {
							"chapter"
						}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						10001,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 11050,
				desc = "通关剧情副本第60关",
				show_icon = 157,
				id = 5,
				day = 1,
				lev = 1,
				type_name = "剧情探索",
				period = 1,
				progress = {
					{
						cli_label = "evt_dungeon_pass",
						target = 20200,
						target_val = 1,
						param = {
							"chapter"
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10001,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 11060,
				desc = "通关剧情副本第70关",
				show_icon = 157,
				id = 6,
				day = 1,
				lev = 1,
				type_name = "剧情探索",
				period = 1,
				progress = {
					{
						cli_label = "evt_dungeon_pass",
						target = 20300,
						target_val = 1,
						param = {
							"chapter"
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10001,
						100
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 12010,
				desc = "公会捐献1次",
				show_icon = 145,
				id = 7,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 1,
				progress = {
					{
						cli_label = "evt_guild_donate",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26700,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 12020,
				desc = "公会捐献3次",
				show_icon = 145,
				id = 8,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 1,
				progress = {
					{
						cli_label = "evt_guild_donate",
						target = 0,
						target_val = 3,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26701,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 12030,
				desc = "公会捐献5次",
				show_icon = 145,
				id = 9,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 1,
				progress = {
					{
						cli_label = "evt_guild_donate",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26702,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 12040,
				desc = "公会副本挑战2次",
				show_icon = 146,
				id = 10,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 1,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26703,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 12050,
				desc = "公会副本挑战5次",
				show_icon = 146,
				id = 11,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 1,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26704,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 12060,
				desc = "公会副本挑战10次",
				show_icon = 146,
				id = 12,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 1,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26704,
						40
					}
				},
				extend = {}
			}
		},
		[7] = {
			{
				target_type = 1,
				goal_id = 14310,
				desc = "位面战胜守卫2个",
				show_icon = 151,
				id = 1,
				day = 7,
				lev = 1,
				type_name = "位面探险",
				period = 1,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						14002,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 14320,
				desc = "位面战胜守卫10个",
				show_icon = 151,
				id = 2,
				day = 7,
				lev = 1,
				type_name = "位面探险",
				period = 1,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						14002,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 14330,
				desc = "位面战胜守卫15个",
				show_icon = 151,
				id = 3,
				day = 7,
				lev = 1,
				type_name = "位面探险",
				period = 1,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						14002,
						15
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 14340,
				desc = "位面战胜守卫20个",
				show_icon = 151,
				id = 4,
				day = 7,
				lev = 1,
				type_name = "位面探险",
				period = 1,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						14002,
						15
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 14350,
				desc = "位面战胜守卫25个",
				show_icon = 151,
				id = 5,
				day = 7,
				lev = 1,
				type_name = "位面探险",
				period = 1,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						14002,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 14360,
				desc = "位面战胜守卫30个",
				show_icon = 151,
				id = 6,
				day = 7,
				lev = 1,
				type_name = "位面探险",
				period = 1,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						14002,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19210,
				desc = "拥有5个等级30以上的英雄",
				show_icon = 120,
				id = 7,
				day = 7,
				lev = 1,
				type_name = "英雄荣耀",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner",
						target = 0,
						target_val = 5,
						param = {
							{
								"lev",
								30
							}
						}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						29904,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19220,
				desc = "拥有1个等级99以上的英雄",
				show_icon = 120,
				id = 8,
				day = 7,
				lev = 1,
				type_name = "英雄荣耀",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner",
						target = 0,
						target_val = 1,
						param = {
							{
								"lev",
								99
							}
						}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						29904,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19230,
				desc = "拥有1个等级120以上的英雄",
				show_icon = 120,
				id = 9,
				day = 7,
				lev = 1,
				type_name = "英雄荣耀",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner",
						target = 0,
						target_val = 1,
						param = {
							{
								"lev",
								120
							}
						}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						14002,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19240,
				desc = "拥有5个5星英雄",
				show_icon = 120,
				id = 10,
				day = 7,
				lev = 1,
				type_name = "英雄荣耀",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner",
						target = 0,
						target_val = 5,
						param = {
							{
								"star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						29904,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19250,
				desc = "拥有1个6星的英雄",
				show_icon = 120,
				id = 11,
				day = 7,
				lev = 1,
				type_name = "英雄荣耀",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner",
						target = 0,
						target_val = 1,
						param = {
							{
								"star",
								6
							}
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						14002,
						20
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19260,
				desc = "拥有2个6星英雄",
				show_icon = 120,
				id = 12,
				day = 7,
				lev = 1,
				type_name = "英雄荣耀",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner",
						target = 0,
						target_val = 2,
						param = {
							{
								"star",
								6
							}
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						14002,
						20
					}
				},
				extend = {}
			}
		},
		[6] = {
			{
				target_type = 1,
				goal_id = 19010,
				desc = "无尽试炼通关10关",
				show_icon = 153,
				id = 1,
				day = 6,
				lev = 1,
				type_name = "无尽试炼",
				period = 1,
				progress = {
					{
						cli_label = "evt_endless_pass",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						37001,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 19020,
				desc = "无尽试炼通关20关",
				show_icon = 153,
				id = 2,
				day = 6,
				lev = 1,
				type_name = "无尽试炼",
				period = 1,
				progress = {
					{
						cli_label = "evt_endless_pass",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						37001,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 19030,
				desc = "无尽试炼通关30关",
				show_icon = 153,
				id = 3,
				day = 6,
				lev = 1,
				type_name = "无尽试炼",
				period = 1,
				progress = {
					{
						cli_label = "evt_endless_pass",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						37001,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 19040,
				desc = "无尽试炼通关40关",
				show_icon = 153,
				id = 4,
				day = 6,
				lev = 1,
				type_name = "无尽试炼",
				period = 1,
				progress = {
					{
						cli_label = "evt_endless_pass",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						37001,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 19050,
				desc = "无尽试炼通关50关",
				show_icon = 153,
				id = 5,
				day = 6,
				lev = 1,
				type_name = "无尽试炼",
				period = 1,
				progress = {
					{
						cli_label = "evt_endless_pass",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						37001,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 19060,
				desc = "无尽试炼派出英雄1次",
				show_icon = 153,
				id = 6,
				day = 6,
				lev = 1,
				type_name = "无尽试炼",
				period = 1,
				progress = {
					{
						cli_label = "evt_endless_appoint",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						37001,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19110,
				desc = "寻宝10次",
				show_icon = 405,
				id = 7,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 1,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						37001,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19120,
				desc = "寻宝20次",
				show_icon = 405,
				id = 8,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 1,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						10401,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19130,
				desc = "寻宝30次",
				show_icon = 405,
				id = 9,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 1,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						37001,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19140,
				desc = "寻宝40次",
				show_icon = 405,
				id = 10,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 1,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						10401,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19150,
				desc = "寻宝60次",
				show_icon = 405,
				id = 11,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 1,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10403,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 19160,
				desc = "寻宝80次",
				show_icon = 405,
				id = 12,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 1,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 80,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10403,
						2
					}
				},
				extend = {}
			}
		},
		[5] = {
			{
				target_type = 1,
				goal_id = 17010,
				desc = "解锁3件神器",
				show_icon = 201,
				id = 1,
				day = 5,
				lev = 1,
				type_name = "失落神器",
				period = 1,
				progress = {
					{
						cli_label = "evt_hallows_activate",
						target = 0,
						target_val = 3,
						param = {
							"num"
						}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						72001,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 17020,
				desc = "解锁5件神器",
				show_icon = 201,
				id = 2,
				day = 5,
				lev = 1,
				type_name = "失落神器",
				period = 1,
				progress = {
					{
						cli_label = "evt_hallows_activate",
						target = 0,
						target_val = 5,
						param = {
							"num"
						}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						72001,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 17030,
				desc = "神器等级达到1级",
				show_icon = 201,
				id = 3,
				day = 5,
				lev = 1,
				type_name = "失落神器",
				period = 1,
				progress = {
					{
						cli_label = "evt_hallows_step",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						72001,
						15
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 17040,
				desc = "神器等级达到2级",
				show_icon = 201,
				id = 4,
				day = 5,
				lev = 1,
				type_name = "失落神器",
				period = 1,
				progress = {
					{
						cli_label = "evt_hallows_step",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						72001,
						15
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 17050,
				desc = "神器等级达到3级",
				show_icon = 201,
				id = 5,
				day = 5,
				lev = 1,
				type_name = "失落神器",
				period = 1,
				progress = {
					{
						cli_label = "evt_hallows_step",
						target = 0,
						target_val = 3,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						29904,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 17060,
				desc = "神器等级达到4级",
				show_icon = 201,
				id = 6,
				day = 5,
				lev = 1,
				type_name = "失落神器",
				period = 1,
				progress = {
					{
						cli_label = "evt_hallows_step",
						target = 0,
						target_val = 4,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						29904,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 18010,
				desc = "玩家等级达到10级",
				show_icon = 157,
				id = 7,
				day = 5,
				lev = 1,
				type_name = "级级攀升",
				period = 1,
				progress = {
					{
						cli_label = "evt_levup",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						29904,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 18020,
				desc = "玩家等级达到20级",
				show_icon = 157,
				id = 8,
				day = 5,
				lev = 1,
				type_name = "级级攀升",
				period = 1,
				progress = {
					{
						cli_label = "evt_levup",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						29904,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 18030,
				desc = "玩家等级达到30级",
				show_icon = 157,
				id = 9,
				day = 5,
				lev = 1,
				type_name = "级级攀升",
				period = 1,
				progress = {
					{
						cli_label = "evt_levup",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						29904,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 18040,
				desc = "玩家等级达到40级",
				show_icon = 157,
				id = 10,
				day = 5,
				lev = 1,
				type_name = "级级攀升",
				period = 1,
				progress = {
					{
						cli_label = "evt_levup",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						29904,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 18050,
				desc = "玩家等级达到45级",
				show_icon = 157,
				id = 11,
				day = 5,
				lev = 1,
				type_name = "级级攀升",
				period = 1,
				progress = {
					{
						cli_label = "evt_levup",
						target = 0,
						target_val = 45,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						29904,
						15
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 18060,
				desc = "玩家等级达到55级",
				show_icon = 157,
				id = 12,
				day = 5,
				lev = 1,
				type_name = "级级攀升",
				period = 1,
				progress = {
					{
						cli_label = "evt_levup",
						target = 0,
						target_val = 55,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						29904,
						15
					}
				},
				extend = {}
			}
		},
		[4] = {
			{
				target_type = 1,
				goal_id = 16010,
				desc = "完成10个远航任务",
				show_icon = 126,
				id = 1,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						10002,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 16020,
				desc = "完成20个远航任务",
				show_icon = 126,
				id = 2,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						10002,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 16030,
				desc = "完成30个远航任务",
				show_icon = 126,
				id = 3,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						10002,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 16040,
				desc = "完成40个远航任务",
				show_icon = 126,
				id = 4,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						10002,
						4
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 16050,
				desc = "完成5个紫色品质以上远航任务",
				show_icon = 126,
				id = 5,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 5,
						param = {
							3
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10002,
						4
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 16060,
				desc = "完成10个紫色品质以上远航任务",
				show_icon = 126,
				id = 6,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 10,
						param = {
							3
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10002,
						4
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 16110,
				desc = "刷新5次远航任务",
				show_icon = 126,
				id = 7,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						72001,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 16120,
				desc = "刷新10次远航任务",
				show_icon = 126,
				id = 8,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						72001,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 16130,
				desc = "刷新15次远航任务",
				show_icon = 126,
				id = 9,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						72001,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 16140,
				desc = "刷新20次远航任务",
				show_icon = 126,
				id = 10,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						72001,
						10
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 16150,
				desc = "刷新30次远航任务",
				show_icon = 126,
				id = 11,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						72001,
						15
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 16160,
				desc = "刷新40次远航任务",
				show_icon = 126,
				id = 12,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 1,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						72001,
						15
					}
				},
				extend = {}
			}
		},
		[3] = {
			{
				target_type = 1,
				goal_id = 15010,
				desc = "挑战5次竞技场",
				show_icon = 158,
				id = 1,
				day = 3,
				lev = 1,
				type_name = "竞技风云",
				period = 1,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						10103,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 15020,
				desc = "挑战10次竞技场",
				show_icon = 158,
				id = 2,
				day = 3,
				lev = 1,
				type_name = "竞技风云",
				period = 1,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						37001,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 15030,
				desc = "挑战15次竞技场",
				show_icon = 158,
				id = 3,
				day = 3,
				lev = 1,
				type_name = "竞技风云",
				period = 1,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						10103,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 15040,
				desc = "挑战20次竞技场",
				show_icon = 158,
				id = 4,
				day = 3,
				lev = 1,
				type_name = "竞技风云",
				period = 1,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						37001,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 15050,
				desc = "挑战30次竞技场",
				show_icon = 158,
				id = 5,
				day = 3,
				lev = 1,
				type_name = "竞技风云",
				period = 1,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10103,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 15060,
				desc = "挑战40次竞技场",
				show_icon = 158,
				id = 6,
				day = 3,
				lev = 1,
				type_name = "竞技风云",
				period = 1,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						37001,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14110,
				desc = "融合神殿合成1个5星英雄",
				show_icon = 155,
				id = 7,
				day = 3,
				lev = 1,
				type_name = "融合生辉",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner_star_up",
						target = 5,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						10002,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14120,
				desc = "融合神殿合成2个5星英雄",
				show_icon = 155,
				id = 8,
				day = 3,
				lev = 1,
				type_name = "融合生辉",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner_star_up",
						target = 5,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						10002,
						3
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14130,
				desc = "融合神殿合成3个5星英雄",
				show_icon = 155,
				id = 9,
				day = 3,
				lev = 1,
				type_name = "融合生辉",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner_star_up",
						target = 5,
						target_val = 3,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						10002,
						4
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14140,
				desc = "融合神殿合成4个5星英雄",
				show_icon = 155,
				id = 10,
				day = 3,
				lev = 1,
				type_name = "融合生辉",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner_star_up",
						target = 5,
						target_val = 4,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						10002,
						5
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14150,
				desc = "融合神殿合成1个6星英雄",
				show_icon = 155,
				id = 11,
				day = 3,
				lev = 1,
				type_name = "融合生辉",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner_star_up",
						target = 6,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10002,
						6
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14160,
				desc = "融合神殿合成2个6星英雄",
				show_icon = 155,
				id = 12,
				day = 3,
				lev = 1,
				type_name = "融合生辉",
				period = 1,
				progress = {
					{
						cli_label = "evt_partner_star_up",
						target = 6,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10002,
						8
					}
				},
				extend = {}
			}
		},
		[2] = {
			{
				target_type = 1,
				goal_id = 13010,
				desc = "试练塔达到10层",
				show_icon = 160,
				id = 1,
				day = 2,
				lev = 1,
				type_name = "试炼冒险",
				period = 1,
				progress = {
					{
						cli_label = "evt_star_tower_floor_pass",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						10103,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 13020,
				desc = "试练塔达到15层",
				show_icon = 160,
				id = 2,
				day = 2,
				lev = 1,
				type_name = "试炼冒险",
				period = 1,
				progress = {
					{
						cli_label = "evt_star_tower_floor_pass",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						10103,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 13030,
				desc = "试练塔达到20层",
				show_icon = 160,
				id = 3,
				day = 2,
				lev = 1,
				type_name = "试炼冒险",
				period = 1,
				progress = {
					{
						cli_label = "evt_star_tower_floor_pass",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						10451,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 13040,
				desc = "试练塔达到30层",
				show_icon = 160,
				id = 4,
				day = 2,
				lev = 1,
				type_name = "试炼冒险",
				period = 1,
				progress = {
					{
						cli_label = "evt_star_tower_floor_pass",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						10103,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 13050,
				desc = "试练塔达到40层",
				show_icon = 160,
				id = 5,
				day = 2,
				lev = 1,
				type_name = "试炼冒险",
				period = 1,
				progress = {
					{
						cli_label = "evt_star_tower_floor_pass",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10103,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 13060,
				desc = "试练塔达到50层",
				show_icon = 160,
				id = 6,
				day = 2,
				lev = 1,
				type_name = "试炼冒险",
				period = 1,
				progress = {
					{
						cli_label = "evt_star_tower_floor_pass",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10452,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14010,
				desc = "普通召唤10次",
				show_icon = 120,
				id = 7,
				day = 2,
				lev = 1,
				type_name = "幸运召唤",
				period = 1,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						10001,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14020,
				desc = "普通召唤20次",
				show_icon = 120,
				id = 8,
				day = 2,
				lev = 1,
				type_name = "幸运召唤",
				period = 1,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						10450,
						80
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14030,
				desc = "高级召唤5次",
				show_icon = 120,
				id = 9,
				day = 2,
				lev = 1,
				type_name = "幸运召唤",
				period = 1,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						10001,
						80
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14040,
				desc = "高级召唤10次",
				show_icon = 120,
				id = 10,
				day = 2,
				lev = 1,
				type_name = "幸运召唤",
				period = 1,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						10450,
						100
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14050,
				desc = "高级召唤20次",
				show_icon = 120,
				id = 11,
				day = 2,
				lev = 1,
				type_name = "幸运召唤",
				period = 1,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10001,
						150
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 14060,
				desc = "高级召唤40次",
				show_icon = 120,
				id = 12,
				day = 2,
				lev = 1,
				type_name = "幸运召唤",
				period = 1,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						10450,
						200
					}
				},
				extend = {}
			}
		}
	},
	[7] = {
		{
			{
				target_type = 1,
				goal_id = 71010,
				desc = "挑战10次竞技场",
				show_icon = 158,
				id = 1,
				day = 1,
				lev = 1,
				type_name = "竞技风云",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 71020,
				desc = "挑战20次竞技场",
				show_icon = 158,
				id = 2,
				day = 1,
				lev = 1,
				type_name = "竞技风云",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 71030,
				desc = "挑战40次竞技场",
				show_icon = 158,
				id = 3,
				day = 1,
				lev = 1,
				type_name = "竞技风云",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 71040,
				desc = "挑战60次竞技场",
				show_icon = 158,
				id = 4,
				day = 1,
				lev = 1,
				type_name = "竞技风云",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 71050,
				desc = "挑战80次竞技场",
				show_icon = 158,
				id = 5,
				day = 1,
				lev = 1,
				type_name = "竞技风云",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 80,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 71060,
				desc = "挑战100次竞技场",
				show_icon = 158,
				id = 6,
				day = 1,
				lev = 1,
				type_name = "竞技风云",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 100,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 72010,
				desc = "公会副本挑战5次",
				show_icon = 146,
				id = 7,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 7,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 72020,
				desc = "公会副本挑战10次",
				show_icon = 146,
				id = 8,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 7,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 72030,
				desc = "公会副本挑战15次",
				show_icon = 146,
				id = 9,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 7,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 72040,
				desc = "公会副本挑战20次",
				show_icon = 146,
				id = 10,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 7,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 72050,
				desc = "公会副本挑战25次",
				show_icon = 146,
				id = 11,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 7,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 72060,
				desc = "公会副本挑战32次",
				show_icon = 146,
				id = 12,
				day = 1,
				lev = 1,
				type_name = "公会发展",
				period = 7,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 32,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		},
		[7] = {
			{
				target_type = 1,
				goal_id = 74210,
				desc = "竞技场段位积分达到1100",
				show_icon = 158,
				id = 1,
				day = 7,
				lev = 1,
				type_name = "搏击高手",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_score2",
						target = 1100,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74220,
				desc = "竞技场段位积分达到1200",
				show_icon = 158,
				id = 2,
				day = 7,
				lev = 1,
				type_name = "搏击高手",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_score2",
						target = 1200,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74230,
				desc = "竞技场段位积分达到1300",
				show_icon = 158,
				id = 3,
				day = 7,
				lev = 1,
				type_name = "搏击高手",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_score2",
						target = 1300,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74240,
				desc = "竞技场段位积分达到1400",
				show_icon = 158,
				id = 4,
				day = 7,
				lev = 1,
				type_name = "搏击高手",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_score2",
						target = 1400,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74250,
				desc = "竞技场段位积分达到1500",
				show_icon = 158,
				id = 5,
				day = 7,
				lev = 1,
				type_name = "搏击高手",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_score2",
						target = 1500,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74260,
				desc = "竞技场段位积分达到1700",
				show_icon = 158,
				id = 6,
				day = 7,
				lev = 1,
				type_name = "搏击高手",
				period = 7,
				progress = {
					{
						cli_label = "evt_arena_score2",
						target = 1700,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79210,
				desc = "符文重铸1次",
				show_icon = 404,
				id = 7,
				day = 7,
				lev = 1,
				type_name = "符文重铸",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_recast",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79220,
				desc = "符文重铸2次",
				show_icon = 404,
				id = 8,
				day = 7,
				lev = 1,
				type_name = "符文重铸",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_recast",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79230,
				desc = "符文重铸3次",
				show_icon = 404,
				id = 9,
				day = 7,
				lev = 1,
				type_name = "符文重铸",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_recast",
						target = 0,
						target_val = 3,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79240,
				desc = "符文重铸5次",
				show_icon = 404,
				id = 10,
				day = 7,
				lev = 1,
				type_name = "符文重铸",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_recast",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79250,
				desc = "符文重铸7次",
				show_icon = 404,
				id = 11,
				day = 7,
				lev = 1,
				type_name = "符文重铸",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_recast",
						target = 0,
						target_val = 7,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79260,
				desc = "符文重铸10次",
				show_icon = 404,
				id = 12,
				day = 7,
				lev = 1,
				type_name = "符文重铸",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_recast",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		},
		[6] = {
			{
				target_type = 1,
				goal_id = 79010,
				desc = "开启1个冒险银宝箱",
				show_icon = 407,
				id = 1,
				day = 6,
				lev = 1,
				type_name = "宝物猎人",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 79020,
				desc = "开启5个冒险银宝箱",
				show_icon = 407,
				id = 2,
				day = 6,
				lev = 1,
				type_name = "宝物猎人",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 79030,
				desc = "开启10个冒险银宝箱",
				show_icon = 407,
				id = 3,
				day = 6,
				lev = 1,
				type_name = "宝物猎人",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 79040,
				desc = "开启15个冒险银宝箱",
				show_icon = 407,
				id = 4,
				day = 6,
				lev = 1,
				type_name = "宝物猎人",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 79050,
				desc = "开启20个冒险银宝箱",
				show_icon = 407,
				id = 5,
				day = 6,
				lev = 1,
				type_name = "宝物猎人",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 79060,
				desc = "开启25个冒险银宝箱",
				show_icon = 407,
				id = 6,
				day = 6,
				lev = 1,
				type_name = "宝物猎人",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79110,
				desc = "高级召唤5次",
				show_icon = 120,
				id = 7,
				day = 6,
				lev = 1,
				type_name = "幸运召唤",
				period = 7,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79120,
				desc = "高级召唤10次",
				show_icon = 120,
				id = 8,
				day = 6,
				lev = 1,
				type_name = "幸运召唤",
				period = 7,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79130,
				desc = "高级召唤15次",
				show_icon = 120,
				id = 9,
				day = 6,
				lev = 1,
				type_name = "幸运召唤",
				period = 7,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79140,
				desc = "高级召唤20次",
				show_icon = 120,
				id = 10,
				day = 6,
				lev = 1,
				type_name = "幸运召唤",
				period = 7,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79150,
				desc = "高级召唤25次",
				show_icon = 120,
				id = 11,
				day = 6,
				lev = 1,
				type_name = "幸运召唤",
				period = 7,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 79160,
				desc = "高级召唤30次",
				show_icon = 120,
				id = 12,
				day = 6,
				lev = 1,
				type_name = "幸运召唤",
				period = 7,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		},
		[5] = {
			{
				target_type = 1,
				goal_id = 77010,
				desc = "冒险使用神之祝福2次",
				show_icon = 407,
				id = 1,
				day = 5,
				lev = 1,
				type_name = "神之祝福",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 77020,
				desc = "冒险使用神之祝福5次",
				show_icon = 407,
				id = 2,
				day = 5,
				lev = 1,
				type_name = "神之祝福",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 77030,
				desc = "冒险使用神之祝福8次",
				show_icon = 407,
				id = 3,
				day = 5,
				lev = 1,
				type_name = "神之祝福",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 8,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 77040,
				desc = "冒险使用神之祝福12次",
				show_icon = 407,
				id = 4,
				day = 5,
				lev = 1,
				type_name = "神之祝福",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 12,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 77050,
				desc = "冒险使用神之祝福16次",
				show_icon = 407,
				id = 5,
				day = 5,
				lev = 1,
				type_name = "神之祝福",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 16,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 77060,
				desc = "冒险使用神之祝福20次",
				show_icon = 407,
				id = 6,
				day = 5,
				lev = 1,
				type_name = "神之祝福",
				period = 7,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 78010,
				desc = "活动期间获取1个5星英雄",
				show_icon = 155,
				id = 7,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 7,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 1,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 78020,
				desc = "活动期间获取2个5星英雄",
				show_icon = 155,
				id = 8,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 7,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 2,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 78030,
				desc = "活动期间获取3个5星英雄",
				show_icon = 155,
				id = 9,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 7,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 3,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 78040,
				desc = "活动期间获取5个5星英雄",
				show_icon = 155,
				id = 10,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 7,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 5,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 78050,
				desc = "活动期间获取1个6星英雄",
				show_icon = 155,
				id = 11,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 7,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 1,
						param = {
							{
								"bind_star",
								6
							}
						}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 78060,
				desc = "活动期间获取2个6星英雄",
				show_icon = 155,
				id = 12,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 7,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 2,
						param = {
							{
								"bind_star",
								6
							}
						}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		},
		[4] = {
			{
				target_type = 1,
				goal_id = 76010,
				desc = "完成10个远航任务",
				show_icon = 126,
				id = 1,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 76020,
				desc = "完成20个远航任务",
				show_icon = 126,
				id = 2,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 76030,
				desc = "完成30个远航任务",
				show_icon = 126,
				id = 3,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 76040,
				desc = "完成50个远航任务",
				show_icon = 126,
				id = 4,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 76050,
				desc = "完成5个紫色品质以上远航任务",
				show_icon = 126,
				id = 5,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 5,
						param = {
							3
						}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 76060,
				desc = "完成10个紫色品质以上远航任务",
				show_icon = 126,
				id = 6,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 10,
						param = {
							3
						}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 76110,
				desc = "刷新5次远航任务",
				show_icon = 126,
				id = 7,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 76120,
				desc = "刷新10次远航任务",
				show_icon = 126,
				id = 8,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 76130,
				desc = "刷新15次远航任务",
				show_icon = 126,
				id = 9,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 76140,
				desc = "刷新20次远航任务",
				show_icon = 126,
				id = 10,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 76150,
				desc = "刷新30次远航任务",
				show_icon = 126,
				id = 11,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 76160,
				desc = "刷新40次远航任务",
				show_icon = 126,
				id = 12,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 7,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		},
		[3] = {
			{
				target_type = 1,
				goal_id = 74310,
				desc = "位面战胜守卫2个",
				show_icon = 151,
				id = 1,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 7,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {
					71110
				}
			},
			{
				target_type = 1,
				goal_id = 74320,
				desc = "位面战胜守卫10个",
				show_icon = 151,
				id = 2,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 7,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {
					71120
				}
			},
			{
				target_type = 1,
				goal_id = 74330,
				desc = "位面战胜守卫15个",
				show_icon = 151,
				id = 3,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 7,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74340,
				desc = "位面战胜守卫20个",
				show_icon = 151,
				id = 4,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 7,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74350,
				desc = "位面战胜守卫25个",
				show_icon = 151,
				id = 5,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 7,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 74360,
				desc = "位面战胜守卫30个",
				show_icon = 151,
				id = 6,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 7,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74110,
				desc = "合成符文1次",
				show_icon = 408,
				id = 7,
				day = 3,
				lev = 1,
				type_name = "符文熔炼",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_compose_quality",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74120,
				desc = "合成符文3次",
				show_icon = 408,
				id = 8,
				day = 3,
				lev = 1,
				type_name = "符文熔炼",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_compose_quality",
						target = 0,
						target_val = 3,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74130,
				desc = "合成符文5次",
				show_icon = 408,
				id = 9,
				day = 3,
				lev = 1,
				type_name = "符文熔炼",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_compose_quality",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74140,
				desc = "合成符文7次",
				show_icon = 408,
				id = 10,
				day = 3,
				lev = 1,
				type_name = "符文熔炼",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_compose_quality",
						target = 0,
						target_val = 7,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74150,
				desc = "合成符文9次",
				show_icon = 408,
				id = 11,
				day = 3,
				lev = 1,
				type_name = "符文熔炼",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_compose_quality",
						target = 0,
						target_val = 9,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74160,
				desc = "合成紫色符文1次",
				show_icon = 408,
				id = 12,
				day = 3,
				lev = 1,
				type_name = "符文熔炼",
				period = 7,
				progress = {
					{
						cli_label = "evt_artifact_compose_quality",
						target = 0,
						target_val = 1,
						param = {
							10453
						}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		},
		[2] = {
			{
				target_type = 1,
				goal_id = 73010,
				desc = "完成日常副本10次",
				show_icon = 152,
				id = 1,
				day = 2,
				lev = 1,
				type_name = "副本之主",
				period = 7,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 73020,
				desc = "完成日常副本20次",
				show_icon = 152,
				id = 2,
				day = 2,
				lev = 1,
				type_name = "副本之主",
				period = 7,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 73030,
				desc = "完成日常副本30次",
				show_icon = 152,
				id = 3,
				day = 2,
				lev = 1,
				type_name = "副本之主",
				period = 7,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 73040,
				desc = "完成日常副本40次",
				show_icon = 152,
				id = 4,
				day = 2,
				lev = 1,
				type_name = "副本之主",
				period = 7,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 73050,
				desc = "完成日常副本50次",
				show_icon = 152,
				id = 5,
				day = 2,
				lev = 1,
				type_name = "副本之主",
				period = 7,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 73060,
				desc = "完成日常副本60次",
				show_icon = 152,
				id = 6,
				day = 2,
				lev = 1,
				type_name = "副本之主",
				period = 7,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74010,
				desc = "试练塔通关1次",
				show_icon = 160,
				id = 7,
				day = 2,
				lev = 1,
				type_name = "试炼之塔",
				period = 7,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						10000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74020,
				desc = "试练塔通关5次",
				show_icon = 160,
				id = 8,
				day = 2,
				lev = 1,
				type_name = "试炼之塔",
				period = 7,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74030,
				desc = "试练塔通关10次",
				show_icon = 160,
				id = 9,
				day = 2,
				lev = 1,
				type_name = "试炼之塔",
				period = 7,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74040,
				desc = "试练塔通关15次",
				show_icon = 160,
				id = 10,
				day = 2,
				lev = 1,
				type_name = "试炼之塔",
				period = 7,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						40000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74050,
				desc = "试练塔通关20次",
				show_icon = 160,
				id = 11,
				day = 2,
				lev = 1,
				type_name = "试炼之塔",
				period = 7,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26900,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 74060,
				desc = "试练塔通关25次",
				show_icon = 160,
				id = 12,
				day = 2,
				lev = 1,
				type_name = "试炼之塔",
				period = 7,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						60000
					},
					{
						26900,
						2
					}
				},
				extend = {}
			}
		}
	},
	[4] = {
		{
			{
				target_type = 1,
				goal_id = 41010,
				desc = "击败冒险怪物10次",
				show_icon = 407,
				id = 1,
				day = 1,
				lev = 1,
				type_name = "冒险猎手",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_boss_fight_count",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 41020,
				desc = "击败冒险怪物20次",
				show_icon = 407,
				id = 2,
				day = 1,
				lev = 1,
				type_name = "冒险猎手",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_boss_fight_count",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 41030,
				desc = "击败冒险怪物30次",
				show_icon = 407,
				id = 3,
				day = 1,
				lev = 1,
				type_name = "冒险猎手",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_boss_fight_count",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 41040,
				desc = "击败冒险怪物40次",
				show_icon = 407,
				id = 4,
				day = 1,
				lev = 1,
				type_name = "冒险猎手",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_boss_fight_count",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 41050,
				desc = "击败冒险怪物50次",
				show_icon = 407,
				id = 5,
				day = 1,
				lev = 1,
				type_name = "冒险猎手",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_boss_fight_count",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 41060,
				desc = "击败冒险怪物60次",
				show_icon = 407,
				id = 6,
				day = 1,
				lev = 1,
				type_name = "冒险猎手",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_boss_fight_count",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 42010,
				desc = "冒险使用神之祝福2次",
				show_icon = 407,
				id = 7,
				day = 1,
				lev = 1,
				type_name = "神之祝福",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 42020,
				desc = "冒险使用神之祝福5次",
				show_icon = 407,
				id = 8,
				day = 1,
				lev = 1,
				type_name = "神之祝福",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 42030,
				desc = "冒险使用神之祝福8次",
				show_icon = 407,
				id = 9,
				day = 1,
				lev = 1,
				type_name = "神之祝福",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 8,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 42040,
				desc = "冒险使用神之祝福12次",
				show_icon = 407,
				id = 10,
				day = 1,
				lev = 1,
				type_name = "神之祝福",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 12,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 42050,
				desc = "冒险使用神之祝福16次",
				show_icon = 407,
				id = 11,
				day = 1,
				lev = 1,
				type_name = "神之祝福",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 16,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 42060,
				desc = "冒险使用神之祝福20次",
				show_icon = 407,
				id = 12,
				day = 1,
				lev = 1,
				type_name = "神之祝福",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_item_expend_count",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		},
		[7] = {
			{
				target_type = 1,
				goal_id = 44210,
				desc = "挑战10次竞技场",
				show_icon = 158,
				id = 1,
				day = 7,
				lev = 1,
				type_name = "竞技风云",
				period = 4,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 44220,
				desc = "挑战20次竞技场",
				show_icon = 158,
				id = 2,
				day = 7,
				lev = 1,
				type_name = "竞技风云",
				period = 4,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 44230,
				desc = "挑战40次竞技场",
				show_icon = 158,
				id = 3,
				day = 7,
				lev = 1,
				type_name = "竞技风云",
				period = 4,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 44240,
				desc = "挑战60次竞技场",
				show_icon = 158,
				id = 4,
				day = 7,
				lev = 1,
				type_name = "竞技风云",
				period = 4,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 44250,
				desc = "挑战80次竞技场",
				show_icon = 158,
				id = 5,
				day = 7,
				lev = 1,
				type_name = "竞技风云",
				period = 4,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 80,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 44260,
				desc = "挑战100次竞技场",
				show_icon = 158,
				id = 6,
				day = 7,
				lev = 1,
				type_name = "竞技风云",
				period = 4,
				progress = {
					{
						cli_label = "evt_arena_fight",
						target = 0,
						target_val = 100,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49210,
				desc = "神器强化1次",
				show_icon = 409,
				id = 7,
				day = 7,
				lev = 1,
				type_name = "神器强化",
				period = 4,
				progress = {
					{
						cli_label = "evt_hallows_step_intensify",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49220,
				desc = "神器强化5次",
				show_icon = 409,
				id = 8,
				day = 7,
				lev = 1,
				type_name = "神器强化",
				period = 4,
				progress = {
					{
						cli_label = "evt_hallows_step_intensify",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49230,
				desc = "神器强化10次",
				show_icon = 409,
				id = 9,
				day = 7,
				lev = 1,
				type_name = "神器强化",
				period = 4,
				progress = {
					{
						cli_label = "evt_hallows_step_intensify",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49240,
				desc = "神器强化15次",
				show_icon = 409,
				id = 10,
				day = 7,
				lev = 1,
				type_name = "神器强化",
				period = 4,
				progress = {
					{
						cli_label = "evt_hallows_step_intensify",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49250,
				desc = "神器强化20次",
				show_icon = 409,
				id = 11,
				day = 7,
				lev = 1,
				type_name = "神器强化",
				period = 4,
				progress = {
					{
						cli_label = "evt_hallows_step_intensify",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49260,
				desc = "神器强化25次",
				show_icon = 409,
				id = 12,
				day = 7,
				lev = 1,
				type_name = "神器强化",
				period = 4,
				progress = {
					{
						cli_label = "evt_hallows_step_intensify",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		},
		[6] = {
			{
				target_type = 1,
				goal_id = 49010,
				desc = "完成日常副本10次",
				show_icon = 152,
				id = 1,
				day = 6,
				lev = 1,
				type_name = "副本之主",
				period = 4,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 49020,
				desc = "完成日常副本20次",
				show_icon = 152,
				id = 2,
				day = 6,
				lev = 1,
				type_name = "副本之主",
				period = 4,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 49030,
				desc = "完成日常副本30次",
				show_icon = 152,
				id = 3,
				day = 6,
				lev = 1,
				type_name = "副本之主",
				period = 4,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 49040,
				desc = "完成日常副本40次",
				show_icon = 152,
				id = 4,
				day = 6,
				lev = 1,
				type_name = "副本之主",
				period = 4,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 49050,
				desc = "完成日常副本50次",
				show_icon = 152,
				id = 5,
				day = 6,
				lev = 1,
				type_name = "副本之主",
				period = 4,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 49060,
				desc = "完成日常副本60次",
				show_icon = 152,
				id = 6,
				day = 6,
				lev = 1,
				type_name = "副本之主",
				period = 4,
				progress = {
					{
						cli_label = "evt_dungeon_stone_fight",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49110,
				desc = "寻宝10次",
				show_icon = 405,
				id = 7,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 4,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49120,
				desc = "寻宝20次",
				show_icon = 405,
				id = 8,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 4,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49130,
				desc = "寻宝40次",
				show_icon = 405,
				id = 9,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 4,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49140,
				desc = "寻宝60次",
				show_icon = 405,
				id = 10,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 4,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 60,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49150,
				desc = "寻宝80次",
				show_icon = 405,
				id = 11,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 4,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 80,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 49160,
				desc = "寻宝100次",
				show_icon = 405,
				id = 12,
				day = 6,
				lev = 1,
				type_name = "幸运达人",
				period = 4,
				progress = {
					{
						cli_label = "evt_dial",
						target = 0,
						target_val = 100,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		},
		[5] = {
			{
				target_type = 1,
				goal_id = 47010,
				desc = "试练塔通关5次",
				show_icon = 160,
				id = 1,
				day = 5,
				lev = 1,
				type_name = "试炼之塔",
				period = 4,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 47020,
				desc = "试练塔通关10次",
				show_icon = 160,
				id = 2,
				day = 5,
				lev = 1,
				type_name = "试炼之塔",
				period = 4,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 47030,
				desc = "试练塔通关15次",
				show_icon = 160,
				id = 3,
				day = 5,
				lev = 1,
				type_name = "试炼之塔",
				period = 4,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 47040,
				desc = "试练塔通关20次",
				show_icon = 160,
				id = 4,
				day = 5,
				lev = 1,
				type_name = "试炼之塔",
				period = 4,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 47050,
				desc = "试练塔通关25次",
				show_icon = 160,
				id = 5,
				day = 5,
				lev = 1,
				type_name = "试炼之塔",
				period = 4,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 47060,
				desc = "试练塔通关30次",
				show_icon = 160,
				id = 6,
				day = 5,
				lev = 1,
				type_name = "试炼之塔",
				period = 4,
				progress = {
					{
						cli_label = "evt_star_tower_pass",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 48010,
				desc = "获取1个5星英雄",
				show_icon = 155,
				id = 7,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 4,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 1,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 48020,
				desc = "获取2个5星英雄",
				show_icon = 155,
				id = 8,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 4,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 2,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 48030,
				desc = "获取3个5星英雄",
				show_icon = 155,
				id = 9,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 4,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 3,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 48040,
				desc = "获取5个5星英雄",
				show_icon = 155,
				id = 10,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 4,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 5,
						param = {
							{
								"bind_star",
								5
							}
						}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 48050,
				desc = "获取1个6星英雄",
				show_icon = 155,
				id = 11,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 4,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 1,
						param = {
							{
								"bind_star",
								6
							}
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 48060,
				desc = "获取2个6星英雄",
				show_icon = 155,
				id = 12,
				day = 5,
				lev = 1,
				type_name = "勇者征召",
				period = 4,
				progress = {
					{
						cli_label = "evt_partner_add_new",
						target = 0,
						target_val = 2,
						param = {
							{
								"bind_star",
								6
							}
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		},
		[4] = {
			{
				target_type = 1,
				goal_id = 46010,
				desc = "完成10个远航任务",
				show_icon = 126,
				id = 1,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 46020,
				desc = "完成20个远航任务",
				show_icon = 126,
				id = 2,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 46030,
				desc = "完成30个远航任务",
				show_icon = 126,
				id = 3,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 46040,
				desc = "完成50个远航任务",
				show_icon = 126,
				id = 4,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 50,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 46050,
				desc = "完成5个紫色品质以上远航任务",
				show_icon = 126,
				id = 5,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 5,
						param = {
							3
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 46060,
				desc = "完成10个紫色品质以上远航任务",
				show_icon = 126,
				id = 6,
				day = 4,
				lev = 1,
				type_name = "远航之路",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping",
						target = 0,
						target_val = 10,
						param = {
							3
						}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 46110,
				desc = "刷新5次远航任务",
				show_icon = 126,
				id = 7,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 46120,
				desc = "刷新10次远航任务",
				show_icon = 126,
				id = 8,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 46130,
				desc = "刷新15次远航任务",
				show_icon = 126,
				id = 9,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 46140,
				desc = "刷新20次远航任务",
				show_icon = 126,
				id = 10,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 46150,
				desc = "刷新30次远航任务",
				show_icon = 126,
				id = 11,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 46160,
				desc = "刷新40次远航任务",
				show_icon = 126,
				id = 12,
				day = 4,
				lev = 1,
				type_name = "远航任务",
				period = 4,
				progress = {
					{
						cli_label = "evt_shipping_refresh",
						target = 0,
						target_val = 40,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		},
		[3] = {
			{
				target_type = 1,
				goal_id = 44310,
				desc = "位面战胜守卫2个",
				show_icon = 151,
				id = 1,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 4,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 2,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {
					41110
				}
			},
			{
				target_type = 1,
				goal_id = 44320,
				desc = "位面战胜守卫10个",
				show_icon = 151,
				id = 2,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 4,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {
					41120
				}
			},
			{
				target_type = 1,
				goal_id = 44330,
				desc = "位面战胜守卫15个",
				show_icon = 151,
				id = 3,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 4,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {
					41130
				}
			},
			{
				target_type = 1,
				goal_id = 44340,
				desc = "位面战胜守卫20个",
				show_icon = 151,
				id = 4,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 4,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {
					41140
				}
			},
			{
				target_type = 1,
				goal_id = 44350,
				desc = "位面战胜守卫25个",
				show_icon = 151,
				id = 5,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 4,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {
					41150
				}
			},
			{
				target_type = 1,
				goal_id = 44360,
				desc = "位面战胜守卫30个",
				show_icon = 151,
				id = 6,
				day = 3,
				lev = 1,
				type_name = "位面探险",
				period = 4,
				progress = {
					{
						cli_label = "evt_planes_kill_guard",
						target = 0,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {
					41160
				}
			},
			{
				target_type = 2,
				goal_id = 44110,
				desc = "高级召唤5次",
				show_icon = 120,
				id = 7,
				day = 3,
				lev = 1,
				type_name = "幸运召唤",
				period = 4,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44120,
				desc = "高级召唤10次",
				show_icon = 120,
				id = 8,
				day = 3,
				lev = 1,
				type_name = "幸运召唤",
				period = 4,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44130,
				desc = "高级召唤15次",
				show_icon = 120,
				id = 9,
				day = 3,
				lev = 1,
				type_name = "幸运召唤",
				period = 4,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44140,
				desc = "高级召唤20次",
				show_icon = 120,
				id = 10,
				day = 3,
				lev = 1,
				type_name = "幸运召唤",
				period = 4,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44150,
				desc = "高级召唤25次",
				show_icon = 120,
				id = 11,
				day = 3,
				lev = 1,
				type_name = "幸运召唤",
				period = 4,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44160,
				desc = "高级召唤30次",
				show_icon = 120,
				id = 12,
				day = 3,
				lev = 1,
				type_name = "幸运召唤",
				period = 4,
				progress = {
					{
						cli_label = "evt_recruit",
						target = 300,
						target_val = 30,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		},
		[2] = {
			{
				target_type = 1,
				goal_id = 43010,
				desc = "开启1个冒险银宝箱",
				show_icon = 407,
				id = 1,
				day = 2,
				lev = 1,
				type_name = "宝物猎人",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 1,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 43020,
				desc = "开启5个冒险银宝箱",
				show_icon = 407,
				id = 2,
				day = 2,
				lev = 1,
				type_name = "宝物猎人",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 43030,
				desc = "开启10个冒险银宝箱",
				show_icon = 407,
				id = 3,
				day = 2,
				lev = 1,
				type_name = "宝物猎人",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 43040,
				desc = "开启15个冒险银宝箱",
				show_icon = 407,
				id = 4,
				day = 2,
				lev = 1,
				type_name = "宝物猎人",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 43050,
				desc = "开启20个冒险银宝箱",
				show_icon = 407,
				id = 5,
				day = 2,
				lev = 1,
				type_name = "宝物猎人",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 1,
				goal_id = 43060,
				desc = "开启25个冒险银宝箱",
				show_icon = 407,
				id = 6,
				day = 2,
				lev = 1,
				type_name = "宝物猎人",
				period = 4,
				progress = {
					{
						cli_label = "evt_adventure_treasure_open",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						3,
						50
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44010,
				desc = "公会副本挑战5次",
				show_icon = 146,
				id = 7,
				day = 2,
				lev = 1,
				type_name = "公会发展",
				period = 4,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 5,
						param = {}
					}
				},
				award1 = {
					{
						1,
						20000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44020,
				desc = "公会副本挑战10次",
				show_icon = 146,
				id = 8,
				day = 2,
				lev = 1,
				type_name = "公会发展",
				period = 4,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 10,
						param = {}
					}
				},
				award1 = {
					{
						1,
						30000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44030,
				desc = "公会副本挑战15次",
				show_icon = 146,
				id = 9,
				day = 2,
				lev = 1,
				type_name = "公会发展",
				period = 4,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 15,
						param = {}
					}
				},
				award1 = {
					{
						1,
						50000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44040,
				desc = "公会副本挑战20次",
				show_icon = 146,
				id = 10,
				day = 2,
				lev = 1,
				type_name = "公会发展",
				period = 4,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 20,
						param = {}
					}
				},
				award1 = {
					{
						1,
						80000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44050,
				desc = "公会副本挑战25次",
				show_icon = 146,
				id = 11,
				day = 2,
				lev = 1,
				type_name = "公会发展",
				period = 4,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 25,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						1
					}
				},
				extend = {}
			},
			{
				target_type = 2,
				goal_id = 44060,
				desc = "公会副本挑战35次",
				show_icon = 146,
				id = 12,
				day = 2,
				lev = 1,
				type_name = "公会发展",
				period = 4,
				progress = {
					{
						cli_label = "evt_guild_dun_fight",
						target = 0,
						target_val = 35,
						param = {}
					}
				},
				award1 = {
					{
						1,
						100000
					},
					{
						26905,
						2
					}
				},
				extend = {}
			}
		}
	}
}
Config.DayGoalsData.data_halfdiscount_length = 3
Config.DayGoalsData.data_halfdiscount = {
	{
		{
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 1,
				disc = 0,
				day = 1,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						10001,
						20
					}
				}
			}
		},
		[21] = {
			{
				desc = "VIP6半价礼包",
				vip = 6,
				id = 21,
				disc = 5,
				day = 7,
				price2 = 5000,
				period = 1,
				price1 = 10000,
				award1 = {
					{
						28903,
						50
					}
				}
			}
		},
		[20] = {
			{
				desc = "VIP5半价礼包",
				vip = 5,
				id = 20,
				disc = 5,
				day = 6,
				price2 = 2500,
				period = 1,
				price1 = 5000,
				award1 = {
					{
						37002,
						5
					}
				}
			}
		},
		[19] = {
			{
				desc = "VIP4半价礼包",
				vip = 4,
				id = 19,
				disc = 5,
				day = 5,
				price2 = 2500,
				period = 1,
				price1 = 5000,
				award1 = {
					{
						10453,
						1
					}
				}
			}
		},
		[18] = {
			{
				desc = "VIP4半价礼包",
				vip = 4,
				id = 18,
				disc = 5,
				day = 4,
				price2 = 1250,
				period = 1,
				price1 = 2500,
				award1 = {
					{
						10403,
						10
					}
				}
			}
		},
		[17] = {
			{
				desc = "VIP3半价礼包",
				vip = 3,
				id = 17,
				disc = 5,
				day = 3,
				price2 = 2000,
				period = 1,
				price1 = 4000,
				award1 = {
					{
						72002,
						40
					}
				}
			}
		},
		[16] = {
			{
				desc = "VIP2半价礼包",
				vip = 2,
				id = 16,
				disc = 5,
				day = 2,
				price2 = 3000,
				period = 1,
				price1 = 6000,
				award1 = {
					{
						29105,
						50
					}
				}
			}
		},
		[15] = {
			{
				desc = "VIP1半价礼包",
				vip = 1,
				id = 15,
				disc = 5,
				day = 1,
				price2 = 150,
				period = 1,
				price1 = 300,
				award1 = {
					{
						10001,
						300
					}
				}
			}
		},
		[14] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 14,
				disc = 5,
				day = 7,
				price2 = 2500,
				period = 1,
				price1 = 5000,
				award1 = {
					{
						27304,
						1
					}
				}
			}
		},
		[13] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 13,
				disc = 5,
				day = 6,
				price2 = 1000,
				period = 1,
				price1 = 2000,
				award1 = {
					{
						37001,
						40
					}
				}
			}
		},
		[12] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 12,
				disc = 5,
				day = 5,
				price2 = 1000,
				period = 1,
				price1 = 2250,
				award1 = {
					{
						72001,
						150
					}
				}
			}
		},
		[11] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 11,
				disc = 5,
				day = 4,
				price2 = 300,
				period = 1,
				price1 = 600,
				award1 = {
					{
						10002,
						20
					}
				}
			}
		},
		[10] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 10,
				disc = 5,
				day = 3,
				price2 = 300,
				period = 1,
				price1 = 600,
				award1 = {
					{
						29904,
						30
					}
				}
			}
		},
		[9] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 9,
				disc = 5,
				day = 2,
				price2 = 500,
				period = 1,
				price1 = 1000,
				award1 = {
					{
						10403,
						4
					}
				}
			}
		},
		[8] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 8,
				disc = 5,
				day = 1,
				price2 = 300,
				period = 1,
				price1 = 600,
				award1 = {
					{
						26801,
						30
					}
				}
			}
		},
		[7] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 7,
				disc = 0,
				day = 7,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						10401,
						1
					}
				}
			}
		},
		[6] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 6,
				disc = 0,
				day = 6,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						1,
						50000
					}
				}
			}
		},
		[5] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 5,
				disc = 0,
				day = 5,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						37001,
						1
					}
				}
			}
		},
		[4] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 4,
				disc = 0,
				day = 4,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						25,
						50
					}
				}
			}
		},
		[3] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 3,
				disc = 0,
				day = 3,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						10002,
						1
					}
				}
			}
		},
		[2] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 2,
				disc = 0,
				day = 2,
				price2 = 0,
				period = 1,
				price1 = 50,
				award1 = {
					{
						10103,
						1
					}
				}
			}
		}
	},
	[7] = {
		[721] = {
			{
				desc = "VIP5折扣礼包",
				vip = 5,
				id = 721,
				disc = 5,
				day = 7,
				price2 = 3000,
				period = 7,
				price1 = 6000,
				award1 = {
					{
						29105,
						50
					}
				}
			}
		},
		[720] = {
			{
				desc = "VIP5折扣礼包",
				vip = 5,
				id = 720,
				disc = 5,
				day = 6,
				price2 = 2500,
				period = 7,
				price1 = 5000,
				award1 = {
					{
						37002,
						5
					}
				}
			}
		},
		[719] = {
			{
				desc = "VIP4折扣礼包",
				vip = 4,
				id = 719,
				disc = 5,
				day = 5,
				price2 = 2500,
				period = 7,
				price1 = 5000,
				award1 = {
					{
						10453,
						1
					}
				}
			}
		},
		[718] = {
			{
				desc = "VIP4折扣礼包",
				vip = 4,
				id = 718,
				disc = 6,
				day = 4,
				price2 = 1500,
				period = 7,
				price1 = 2500,
				award1 = {
					{
						10403,
						10
					}
				}
			}
		},
		[717] = {
			{
				desc = "VIP3折扣礼包",
				vip = 3,
				id = 717,
				disc = 6,
				day = 3,
				price2 = 1350,
				period = 7,
				price1 = 2250,
				award1 = {
					{
						72001,
						150
					}
				}
			}
		},
		[716] = {
			{
				desc = "VIP2折扣礼包",
				vip = 2,
				id = 716,
				disc = 6,
				day = 2,
				price2 = 3000,
				period = 7,
				price1 = 5000,
				award1 = {
					{
						29905,
						50
					}
				}
			}
		},
		[715] = {
			{
				desc = "VIP1折扣礼包",
				vip = 1,
				id = 715,
				disc = 5,
				day = 1,
				price2 = 250,
				period = 7,
				price1 = 500,
				award1 = {
					{
						10450,
						500
					}
				}
			}
		},
		[714] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 714,
				disc = 5,
				day = 7,
				price2 = 3000,
				period = 7,
				price1 = 6000,
				award1 = {
					{
						29305,
						50
					}
				}
			}
		},
		[713] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 713,
				disc = 6,
				day = 6,
				price2 = 1200,
				period = 7,
				price1 = 2000,
				award1 = {
					{
						37001,
						40
					}
				}
			}
		},
		[712] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 712,
				disc = 6,
				day = 5,
				price2 = 750,
				period = 7,
				price1 = 1250,
				award1 = {
					{
						10403,
						5
					}
				}
			}
		},
		[711] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 711,
				disc = 6,
				day = 4,
				price2 = 600,
				period = 7,
				price1 = 1000,
				award1 = {
					{
						10450,
						1000
					}
				}
			}
		},
		[710] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 710,
				disc = 6,
				day = 3,
				price2 = 300,
				period = 7,
				price1 = 500,
				award1 = {
					{
						10001,
						500
					}
				}
			}
		},
		[709] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 709,
				disc = 6,
				day = 2,
				price2 = 450,
				period = 7,
				price1 = 750,
				award1 = {
					{
						72001,
						50
					}
				}
			}
		},
		[708] = {
			{
				desc = "全民折扣礼包",
				vip = 0,
				id = 708,
				disc = 6,
				day = 1,
				price2 = 150,
				period = 7,
				price1 = 300,
				award1 = {
					{
						10450,
						300
					}
				}
			}
		},
		[707] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 707,
				disc = 0,
				day = 7,
				price2 = 0,
				period = 7,
				price1 = 250,
				award1 = {
					{
						10403,
						1
					}
				}
			}
		},
		[706] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 706,
				disc = 0,
				day = 6,
				price2 = 0,
				period = 7,
				price1 = 100,
				award1 = {
					{
						10450,
						100
					}
				}
			}
		},
		[705] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 705,
				disc = 0,
				day = 5,
				price2 = 0,
				period = 7,
				price1 = 100,
				award1 = {
					{
						37001,
						1
					}
				}
			}
		},
		[704] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 704,
				disc = 0,
				day = 4,
				price2 = 0,
				period = 7,
				price1 = 100,
				award1 = {
					{
						10002,
						2
					}
				}
			}
		},
		[703] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 703,
				disc = 0,
				day = 3,
				price2 = 0,
				period = 7,
				price1 = 100,
				award1 = {
					{
						10,
						200
					}
				}
			}
		},
		[702] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 702,
				disc = 0,
				day = 2,
				price2 = 0,
				period = 7,
				price1 = 100,
				award1 = {
					{
						10103,
						2
					}
				}
			}
		},
		[701] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 701,
				disc = 0,
				day = 1,
				price2 = 0,
				period = 7,
				price1 = 100,
				award1 = {
					{
						10001,
						50
					}
				}
			}
		}
	},
	[4] = {
		[321] = {
			{
				desc = "VIP6半价礼包",
				vip = 6,
				id = 321,
				disc = 5,
				day = 7,
				price2 = 5000,
				period = 4,
				price1 = 10000,
				award1 = {
					{
						28901,
						50
					}
				}
			}
		},
		[320] = {
			{
				desc = "VIP5半价礼包",
				vip = 5,
				id = 320,
				disc = 5,
				day = 6,
				price2 = 2500,
				period = 4,
				price1 = 5000,
				award1 = {
					{
						37002,
						5
					}
				}
			}
		},
		[319] = {
			{
				desc = "VIP4半价礼包",
				vip = 4,
				id = 319,
				disc = 5,
				day = 5,
				price2 = 2500,
				period = 4,
				price1 = 5000,
				award1 = {
					{
						10453,
						1
					}
				}
			}
		},
		[318] = {
			{
				desc = "VIP4半价礼包",
				vip = 4,
				id = 318,
				disc = 5,
				day = 4,
				price2 = 1250,
				period = 4,
				price1 = 2500,
				award1 = {
					{
						10403,
						10
					}
				}
			}
		},
		[317] = {
			{
				desc = "VIP3半价礼包",
				vip = 3,
				id = 317,
				disc = 5,
				day = 3,
				price2 = 1500,
				period = 4,
				price1 = 3000,
				award1 = {
					{
						72001,
						200
					}
				}
			}
		},
		[316] = {
			{
				desc = "VIP2半价礼包",
				vip = 2,
				id = 316,
				disc = 5,
				day = 2,
				price2 = 3000,
				period = 4,
				price1 = 6000,
				award1 = {
					{
						29205,
						50
					}
				}
			}
		},
		[315] = {
			{
				desc = "VIP1半价礼包",
				vip = 1,
				id = 315,
				disc = 5,
				day = 1,
				price2 = 250,
				period = 4,
				price1 = 500,
				award1 = {
					{
						10450,
						500
					}
				}
			}
		},
		[314] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 314,
				disc = 5,
				day = 7,
				price2 = 2500,
				period = 4,
				price1 = 5000,
				award1 = {
					{
						29305,
						50
					}
				}
			}
		},
		[313] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 313,
				disc = 5,
				day = 6,
				price2 = 1000,
				period = 4,
				price1 = 2000,
				award1 = {
					{
						37001,
						40
					}
				}
			}
		},
		[312] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 312,
				disc = 5,
				day = 5,
				price2 = 1125,
				period = 4,
				price1 = 2250,
				award1 = {
					{
						72001,
						150
					}
				}
			}
		},
		[311] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 311,
				disc = 5,
				day = 4,
				price2 = 300,
				period = 4,
				price1 = 600,
				award1 = {
					{
						10002,
						20
					}
				}
			}
		},
		[310] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 310,
				disc = 5,
				day = 3,
				price2 = 500,
				period = 4,
				price1 = 1000,
				award1 = {
					{
						10,
						2500
					}
				}
			}
		},
		[309] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 309,
				disc = 5,
				day = 2,
				price2 = 500,
				period = 4,
				price1 = 1000,
				award1 = {
					{
						10403,
						4
					}
				}
			}
		},
		[308] = {
			{
				desc = "全民半价礼包",
				vip = 0,
				id = 308,
				disc = 5,
				day = 1,
				price2 = 150,
				period = 4,
				price1 = 300,
				award1 = {
					{
						10450,
						300
					}
				}
			}
		},
		[307] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 307,
				disc = 0,
				day = 7,
				price2 = 0,
				period = 4,
				price1 = 250,
				award1 = {
					{
						10403,
						1
					}
				}
			}
		},
		[306] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 306,
				disc = 0,
				day = 6,
				price2 = 0,
				period = 4,
				price1 = 100,
				award1 = {
					{
						10450,
						100
					}
				}
			}
		},
		[305] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 305,
				disc = 0,
				day = 5,
				price2 = 0,
				period = 4,
				price1 = 100,
				award1 = {
					{
						37001,
						2
					}
				}
			}
		},
		[304] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 304,
				disc = 0,
				day = 4,
				price2 = 0,
				period = 4,
				price1 = 100,
				award1 = {
					{
						10002,
						2
					}
				}
			}
		},
		[303] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 303,
				disc = 0,
				day = 3,
				price2 = 0,
				period = 4,
				price1 = 100,
				award1 = {
					{
						10,
						250
					}
				}
			}
		},
		[302] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 302,
				disc = 0,
				day = 2,
				price2 = 0,
				period = 4,
				price1 = 100,
				award1 = {
					{
						10103,
						2
					}
				}
			}
		},
		[301] = {
			{
				desc = "全民福利礼包",
				vip = 0,
				id = 301,
				disc = 0,
				day = 1,
				price2 = 0,
				period = 4,
				price1 = 100,
				award1 = {
					{
						10001,
						100
					}
				}
			}
		}
	}
}
Config.DayGoalsData.data_all_target_length = 3
Config.DayGoalsData.data_all_target = {
	{
		{
			{
				id = 1,
				goal = 20,
				period = 1,
				award = {
					{
						10002,
						5
					}
				}
			}
		},
		[4] = {
			{
				id = 4,
				goal = 100,
				period = 1,
				award = {
					{
						3,
						3000
					}
				}
			}
		},
		[3] = {
			{
				id = 3,
				goal = 70,
				period = 1,
				award = {
					{
						37002,
						2
					}
				}
			}
		},
		[2] = {
			{
				id = 2,
				goal = 50,
				period = 1,
				award = {
					{
						10403,
						1
					}
				}
			}
		}
	},
	[7] = {
		[407] = {
			{
				id = 407,
				goal = 100,
				period = 7,
				award = {
					{
						3,
						2000
					}
				}
			}
		},
		[307] = {
			{
				id = 307,
				goal = 70,
				period = 7,
				award = {
					{
						37002,
						1
					}
				}
			}
		},
		[207] = {
			{
				id = 207,
				goal = 50,
				period = 7,
				award = {
					{
						10403,
						1
					}
				}
			}
		},
		[107] = {
			{
				id = 107,
				goal = 20,
				period = 7,
				award = {
					{
						10403,
						1
					}
				}
			}
		}
	},
	[4] = {
		[403] = {
			{
				id = 403,
				goal = 100,
				period = 4,
				award = {
					{
						3,
						2000
					}
				}
			}
		},
		[303] = {
			{
				id = 303,
				goal = 70,
				period = 4,
				award = {
					{
						37002,
						1
					}
				}
			}
		},
		[203] = {
			{
				id = 203,
				goal = 50,
				period = 4,
				award = {
					{
						10403,
						2
					}
				}
			}
		},
		[103] = {
			{
				id = 103,
				goal = 20,
				period = 4,
				award = {
					{
						10403,
						1
					}
				}
			}
		}
	}
}
Config.DayGoalsData.data_drama_explain_length = 3
Config.DayGoalsData.data_drama_explain = {
	{
		id = 1,
		title = "目标挑战",
		desc = "七日目标根据天数开放，玩家完成任务后，可根据完成进度领取对应大奖。活动8天后关闭，奖励只可领取一次，领取后继续完成任务不可补充领取奖励"
	},
	{
		id = 2,
		title = "每日福利",
		desc = "每天有特别福利放送，快快领取奖励继续提升自己，完成目标挑战"
	},
	{
		id = 3,
		title = "五折特惠",
		desc = "精选各种酷炫礼包，每日半价超值出售。走过路过不要错过！"
	}
}

function Config.DayGoalsData.data_drama_explain_fun(slot0)
	slot1 = Config.DayGoalsData.data_drama_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DayGoalsData.data_drama_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
