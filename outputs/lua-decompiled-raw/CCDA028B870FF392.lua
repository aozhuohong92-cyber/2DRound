Config = Config or {}
Config.HolidayBossNewData = Config.HolidayBossNewData or {}
Config.HolidayBossNewData.data_const_length = 9
Config.HolidayBossNewData.data_const = {
	action_time = {
		val = 1,
		desc = "5月7日-6月3日"
	},
	action_pre_reward = {
		desc = "活动界面奖励预览",
		val = {
			{
				3,
				1
			},
			{
				29905,
				1
			},
			{
				10403,
				1
			},
			{
				25,
				1
			}
		}
	},
	fight_max_count = {
		val = 2,
		desc = "显示挑战次数上限"
	},
	start_fight_count = {
		val = 2,
		desc = "初始挑战次数"
	},
	game_rule1 = {
		val = 1,
		desc = [[
活动周期
    试炼之境每周重置前都会进行一次更新，更新后关卡内容会发生变化。请尽量在一周内攻略完所有关卡

英雄锁定
    在挑战任何关卡时，不再消耗出战的英雄的使用次数。

关卡特征
    每次挑战结束，关卡怪物的剩余生命值将被保留至下一次挑战
    每个关卡有对应的效果加成，搭配合适的英雄进行挑战，可以事半功倍哦~

奖励获取
    通关奖励
        每次通过关卡，会随机掉落一些奖励，各个阶段的掉落均有不同
    结算奖励
        每通关一个阶段，会使结算奖励升级，在周期结算时可获取到上一期的结算奖励（奖励通过邮件发放）
         如果提前通关当期所有关卡，可立即获取结算奖励

难度升降
    首次进入难度匹配
        首次参与活动的玩家会根据用户当前最高战力进行难度匹配，后续将不再进行匹配
    升降级区
        每周会根据关卡分为降级，保级，升级3个区域
        完全通关对应的区域可解锁更好的结算奖励
        通关升级区后，下一期的难度会有所上升（达到上限将不再提升），对应的奖励也会获得更好
        若用户一周内玩家不参加或没有通关降级区，则下一期会降级（多周未参与最多下降一级）

参与次数
    每日免费挑战2次，每日0点会重置免费次数和购买次数
    只要参与战斗，无论胜负，均会消耗一次挑战次数
]]
	},
	action_num_espensive = {
		val = 100,
		desc = "次数购买钻石价格"
	},
	partner_num = {
		val = 4,
		desc = "英雄限制次数"
	},
	partner_num_up = {
		val = 8,
		desc = "UP英雄限制次数"
	},
	fight_buy_max_count = {
		val = 2,
		desc = "购买次数"
	}
}

function Config.HolidayBossNewData.data_const_fun(slot0)
	slot1 = Config.HolidayBossNewData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayBossNewData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayBossNewData.data_round_list_length = 4
Config.HolidayBossNewData.data_round_list = {
	{
		unit_round = 1
	},
	{
		unit_round = 2
	},
	{
		unit_round = 3
	},
	{
		unit_round = 4
	}
}

function Config.HolidayBossNewData.data_round_list_fun(slot0)
	slot1 = Config.HolidayBossNewData.data_round_list[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayBossNewData.data_round_list[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayBossNewData.data_lev_reward_list_length = 10
Config.HolidayBossNewData.data_lev_reward_list = {
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					150
				},
				{
					39035,
					3
				},
				{
					25,
					1000
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					200
				},
				{
					39035,
					4
				},
				{
					25,
					1200
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					250
				},
				{
					39035,
					5
				},
				{
					25,
					1400
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					165
				},
				{
					39035,
					4
				},
				{
					25,
					1200
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					220
				},
				{
					39035,
					5
				},
				{
					25,
					1400
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					275
				},
				{
					39035,
					6
				},
				{
					25,
					1600
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					180
				},
				{
					39035,
					5
				},
				{
					25,
					1400
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					240
				},
				{
					39035,
					6
				},
				{
					25,
					1600
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					305
				},
				{
					39035,
					7
				},
				{
					25,
					1800
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					200
				},
				{
					39035,
					6
				},
				{
					25,
					1600
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					265
				},
				{
					39035,
					7
				},
				{
					25,
					1800
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					335
				},
				{
					39035,
					8
				},
				{
					25,
					2000
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					220
				},
				{
					39035,
					7
				},
				{
					25,
					1800
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					295
				},
				{
					39035,
					8
				},
				{
					25,
					2000
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					365
				},
				{
					39035,
					9
				},
				{
					25,
					2200
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					240
				},
				{
					39035,
					8
				},
				{
					25,
					2000
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					320
				},
				{
					39035,
					9
				},
				{
					25,
					2200
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					405
				},
				{
					39035,
					10
				},
				{
					25,
					2400
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					260
				},
				{
					39035,
					9
				},
				{
					25,
					2200
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					340
				},
				{
					39035,
					10
				},
				{
					25,
					2400
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					440
				},
				{
					39035,
					11
				},
				{
					25,
					2600
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					280
				},
				{
					39035,
					10
				},
				{
					25,
					2400
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					360
				},
				{
					39035,
					11
				},
				{
					25,
					2600
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					460
				},
				{
					39035,
					12
				},
				{
					25,
					2800
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					300
				},
				{
					39035,
					11
				},
				{
					25,
					2600
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					380
				},
				{
					39035,
					12
				},
				{
					25,
					2800
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					480
				},
				{
					39035,
					13
				},
				{
					25,
					3000
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	},
	{
		{
			order_id = 5,
			sort_id = 1,
			reward = {
				{
					3,
					320
				},
				{
					39035,
					12
				},
				{
					25,
					2800
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 10,
			sort_id = 2,
			reward = {
				{
					3,
					400
				},
				{
					39035,
					13
				},
				{
					25,
					3000
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		},
		{
			order_id = 15,
			sort_id = 3,
			reward = {
				{
					3,
					500
				},
				{
					39035,
					14
				},
				{
					25,
					3200
				}
			},
			show_reward = {
				{
					10403,
					1
				},
				{
					10403,
					1
				},
				{
					37001,
					1
				},
				{
					25,
					1
				}
			}
		}
	}
}
Config.HolidayBossNewData.data_change_boss_list_length = 4
Config.HolidayBossNewData.data_change_boss_list = {
	{
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 1,
					order_id = 1,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 2,
					order_id = 2,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 3,
					order_id = 3,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 4,
					order_id = 4,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 6,
					power = 164972,
					sort_id = 5,
					order_id = 5,
					master_lev = 120,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 6,
					power = 161866,
					sort_id = 1,
					order_id = 6,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 2,
					order_id = 7,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 3,
					order_id = 8,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 6,
					power = 162263,
					sort_id = 4,
					order_id = 9,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 6,
					power = 204509,
					sort_id = 5,
					order_id = 10,
					master_lev = 140,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 6,
					power = 195620,
					sort_id = 1,
					order_id = 11,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 6,
					power = 194652,
					sort_id = 2,
					order_id = 12,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 6,
					power = 193324,
					sort_id = 3,
					order_id = 13,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 6,
					power = 194652,
					sort_id = 4,
					order_id = 14,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 7,
					power = 315568,
					sort_id = 5,
					order_id = 15,
					master_lev = 160,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 1,
					order_id = 1,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 2,
					order_id = 2,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 3,
					order_id = 3,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 4,
					order_id = 4,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 7,
					power = 312122,
					sort_id = 5,
					order_id = 5,
					master_lev = 160,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 6,
					power = 310115,
					sort_id = 1,
					order_id = 6,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 2,
					order_id = 7,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 3,
					order_id = 8,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 6,
					power = 310975,
					sort_id = 4,
					order_id = 9,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 7,
					power = 474289,
					sort_id = 5,
					order_id = 10,
					master_lev = 180,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 7,
					power = 457972,
					sort_id = 1,
					order_id = 11,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 7,
					power = 455150,
					sort_id = 2,
					order_id = 12,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 7,
					power = 451852,
					sort_id = 3,
					order_id = 13,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 7,
					power = 455150,
					sort_id = 4,
					order_id = 14,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 8,
					power = 702165,
					sort_id = 5,
					order_id = 15,
					master_lev = 200,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 1,
					order_id = 1,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 2,
					order_id = 2,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 3,
					order_id = 3,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 4,
					order_id = 4,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 9,
					power = 694622,
					sort_id = 5,
					order_id = 5,
					master_lev = 200,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 8,
					power = 693150,
					sort_id = 1,
					order_id = 6,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 2,
					order_id = 7,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 3,
					order_id = 8,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 8,
					power = 695430,
					sort_id = 4,
					order_id = 9,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 9,
					power = 1121191,
					sort_id = 5,
					order_id = 10,
					master_lev = 220,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 9,
					power = 1089899,
					sort_id = 1,
					order_id = 11,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 9,
					power = 1082249,
					sort_id = 2,
					order_id = 12,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 9,
					power = 1075115,
					sort_id = 3,
					order_id = 13,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 9,
					power = 1082249,
					sort_id = 4,
					order_id = 14,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 10,
					power = 1247973,
					sort_id = 5,
					order_id = 15,
					master_lev = 240,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 1,
					order_id = 1,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 2,
					order_id = 2,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 3,
					order_id = 3,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 4,
					order_id = 4,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 10,
					power = 1235711,
					sort_id = 5,
					order_id = 5,
					master_lev = 240,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 10,
					power = 1234727,
					sort_id = 1,
					order_id = 6,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 2,
					order_id = 7,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 3,
					order_id = 8,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 10,
					power = 1239046,
					sort_id = 4,
					order_id = 9,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 10,
					power = 1556669,
					sort_id = 5,
					order_id = 10,
					master_lev = 260,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 10,
					power = 1365663,
					sort_id = 1,
					order_id = 11,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 10,
					power = 1356043,
					sort_id = 2,
					order_id = 12,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 10,
					power = 1347291,
					sort_id = 3,
					order_id = 13,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 10,
					power = 1356043,
					sort_id = 4,
					order_id = 14,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 10,
					power = 2000442,
					sort_id = 5,
					order_id = 15,
					master_lev = 280,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 1,
					order_id = 1,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 2,
					order_id = 2,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 3,
					order_id = 3,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 4,
					order_id = 4,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 10,
					power = 1871677,
					sort_id = 5,
					order_id = 5,
					master_lev = 275,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 10,
					power = 1787853,
					sort_id = 1,
					order_id = 6,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 2,
					order_id = 7,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 3,
					order_id = 8,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 10,
					power = 1786514,
					sort_id = 4,
					order_id = 9,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 10,
					power = 2365809,
					sort_id = 5,
					order_id = 10,
					master_lev = 295,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 10,
					power = 2226611,
					sort_id = 1,
					order_id = 11,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 10,
					power = 2229181,
					sort_id = 2,
					order_id = 12,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 10,
					power = 2241595,
					sort_id = 3,
					order_id = 13,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 10,
					power = 2229181,
					sort_id = 4,
					order_id = 14,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 2813908,
					sort_id = 5,
					order_id = 15,
					master_lev = 315,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 1,
					order_id = 1,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 2,
					order_id = 2,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 3,
					order_id = 3,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 4,
					order_id = 4,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 11,
					power = 2686654,
					sort_id = 5,
					order_id = 5,
					master_lev = 310,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 11,
					power = 2596856,
					sort_id = 1,
					order_id = 6,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 2,
					order_id = 7,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 3,
					order_id = 8,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 11,
					power = 2595613,
					sort_id = 4,
					order_id = 9,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 11,
					power = 3174816,
					sort_id = 5,
					order_id = 10,
					master_lev = 330,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 11,
					power = 3036139,
					sort_id = 1,
					order_id = 11,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 11,
					power = 3038521,
					sort_id = 2,
					order_id = 12,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 11,
					power = 3058819,
					sort_id = 3,
					order_id = 13,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 11,
					power = 3038521,
					sort_id = 4,
					order_id = 14,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 3627369,
					sort_id = 5,
					order_id = 15,
					master_lev = 350,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 1,
					order_id = 1,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 2,
					order_id = 2,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 3,
					order_id = 3,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 4,
					order_id = 4,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 11,
					power = 3501627,
					sort_id = 5,
					order_id = 5,
					master_lev = 345,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 11,
					power = 3405912,
					sort_id = 1,
					order_id = 6,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 2,
					order_id = 7,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 3,
					order_id = 8,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 11,
					power = 3404761,
					sort_id = 4,
					order_id = 9,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 11,
					power = 3983874,
					sort_id = 5,
					order_id = 10,
					master_lev = 365,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 11,
					power = 3845672,
					sort_id = 1,
					order_id = 11,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 11,
					power = 3847864,
					sort_id = 2,
					order_id = 12,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 11,
					power = 3876016,
					sort_id = 3,
					order_id = 13,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 11,
					power = 3847864,
					sort_id = 4,
					order_id = 14,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 4440694,
					sort_id = 5,
					order_id = 15,
					master_lev = 385,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 1,
					order_id = 1,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 2,
					order_id = 2,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 3,
					order_id = 3,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 4,
					order_id = 4,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 11,
					power = 4316155,
					sort_id = 5,
					order_id = 5,
					master_lev = 380,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 11,
					power = 4215015,
					sort_id = 1,
					order_id = 6,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 2,
					order_id = 7,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 3,
					order_id = 8,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 11,
					power = 4213960,
					sort_id = 4,
					order_id = 9,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 11,
					power = 4792995,
					sort_id = 5,
					order_id = 10,
					master_lev = 400,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 11,
					power = 4655153,
					sort_id = 1,
					order_id = 11,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 11,
					power = 4657157,
					sort_id = 2,
					order_id = 12,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 11,
					power = 4693141,
					sort_id = 3,
					order_id = 13,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 11,
					power = 4657157,
					sort_id = 4,
					order_id = 14,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 5254525,
					sort_id = 5,
					order_id = 15,
					master_lev = 420,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 1,
					order_id = 1,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 2,
					order_id = 2,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 3,
					order_id = 3,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 4,
					order_id = 4,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 11,
					power = 5131818,
					sort_id = 5,
					order_id = 5,
					master_lev = 415,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 11,
					power = 5024081,
					sort_id = 1,
					order_id = 6,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 2,
					order_id = 7,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 3,
					order_id = 8,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 11,
					power = 5023118,
					sort_id = 4,
					order_id = 9,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 11,
					power = 5601946,
					sort_id = 5,
					order_id = 10,
					master_lev = 435,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 11,
					power = 5465125,
					sort_id = 1,
					order_id = 11,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 11,
					power = 5466943,
					sort_id = 2,
					order_id = 12,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 11,
					power = 5510785,
					sort_id = 3,
					order_id = 13,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 11,
					power = 5466943,
					sort_id = 4,
					order_id = 14,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 6068377,
					sort_id = 5,
					order_id = 15,
					master_lev = 455,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 1,
					order_id = 1,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 2,
					order_id = 2,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 3,
					order_id = 3,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 4,
					order_id = 4,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 20504,
					name = "BOSS关",
					star = 11,
					power = 5947542,
					sort_id = 5,
					order_id = 5,
					master_lev = 450,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20505,
					name = "生命试炼",
					star = 11,
					power = 5833211,
					sort_id = 1,
					order_id = 6,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 20509,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 2,
					order_id = 7,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50502,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 3,
					order_id = 8,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20508,
					name = "生命试炼",
					star = 11,
					power = 5832343,
					sort_id = 4,
					order_id = 9,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 40502,
					name = "BOSS关",
					star = 11,
					power = 6411043,
					sort_id = 5,
					order_id = 10,
					master_lev = 470,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 10505,
					name = "控制试炼",
					star = 11,
					power = 6275080,
					sort_id = 1,
					order_id = 11,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50505,
					name = "控制试炼",
					star = 11,
					power = 6276708,
					sort_id = 2,
					order_id = 12,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 10503,
					name = "控制试炼",
					star = 11,
					power = 6328402,
					sort_id = 3,
					order_id = 13,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 10510,
					name = "控制试炼",
					star = 11,
					power = 6276708,
					sort_id = 4,
					order_id = 14,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 6882279,
					sort_id = 5,
					order_id = 15,
					master_lev = 490,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		}
	},
	{
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 1,
					order_id = 1,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 5,
					power = 102716,
					sort_id = 2,
					order_id = 2,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 3,
					order_id = 3,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 4,
					order_id = 4,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 6,
					power = 165548,
					sort_id = 5,
					order_id = 5,
					master_lev = 120,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 1,
					order_id = 6,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 2,
					order_id = 7,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 3,
					order_id = 8,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 6,
					power = 161866,
					sort_id = 4,
					order_id = 9,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 6,
					power = 204011,
					sort_id = 5,
					order_id = 10,
					master_lev = 140,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 6,
					power = 194652,
					sort_id = 1,
					order_id = 11,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 6,
					power = 196284,
					sort_id = 2,
					order_id = 12,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 6,
					power = 195620,
					sort_id = 3,
					order_id = 13,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 6,
					power = 193988,
					sort_id = 4,
					order_id = 14,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 7,
					power = 316694,
					sort_id = 5,
					order_id = 15,
					master_lev = 160,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 1,
					order_id = 1,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 6,
					power = 200551,
					sort_id = 2,
					order_id = 2,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 3,
					order_id = 3,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 4,
					order_id = 4,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 7,
					power = 313248,
					sort_id = 5,
					order_id = 5,
					master_lev = 160,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 1,
					order_id = 6,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 2,
					order_id = 7,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 3,
					order_id = 8,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 6,
					power = 310115,
					sort_id = 4,
					order_id = 9,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 7,
					power = 472841,
					sort_id = 5,
					order_id = 10,
					master_lev = 180,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 7,
					power = 455150,
					sort_id = 1,
					order_id = 11,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 7,
					power = 459621,
					sort_id = 2,
					order_id = 12,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 7,
					power = 457972,
					sort_id = 3,
					order_id = 13,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 7,
					power = 453501,
					sort_id = 4,
					order_id = 14,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 8,
					power = 704646,
					sort_id = 5,
					order_id = 15,
					master_lev = 200,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 1,
					order_id = 1,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 8,
					power = 465120,
					sort_id = 2,
					order_id = 2,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 3,
					order_id = 3,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 4,
					order_id = 4,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 9,
					power = 697103,
					sort_id = 5,
					order_id = 5,
					master_lev = 200,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 1,
					order_id = 6,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 2,
					order_id = 7,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 3,
					order_id = 8,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 8,
					power = 693150,
					sort_id = 4,
					order_id = 9,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 9,
					power = 1117289,
					sort_id = 5,
					order_id = 10,
					master_lev = 220,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 9,
					power = 1082249,
					sort_id = 1,
					order_id = 11,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 9,
					power = 1093466,
					sort_id = 2,
					order_id = 12,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 9,
					power = 1089899,
					sort_id = 3,
					order_id = 13,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 9,
					power = 1078682,
					sort_id = 4,
					order_id = 14,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 10,
					power = 1252021,
					sort_id = 5,
					order_id = 15,
					master_lev = 240,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 1,
					order_id = 1,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 9,
					power = 1103153,
					sort_id = 2,
					order_id = 2,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 3,
					order_id = 3,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 4,
					order_id = 4,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 10,
					power = 1239759,
					sort_id = 5,
					order_id = 5,
					master_lev = 240,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 1,
					order_id = 6,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 2,
					order_id = 7,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 3,
					order_id = 8,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 10,
					power = 1234727,
					sort_id = 4,
					order_id = 9,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 10,
					power = 1558036,
					sort_id = 5,
					order_id = 10,
					master_lev = 260,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 10,
					power = 1356043,
					sort_id = 1,
					order_id = 11,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 10,
					power = 1370039,
					sort_id = 2,
					order_id = 12,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 10,
					power = 1365663,
					sort_id = 3,
					order_id = 13,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 10,
					power = 1351667,
					sort_id = 4,
					order_id = 14,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 10,
					power = 1995350,
					sort_id = 5,
					order_id = 15,
					master_lev = 280,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 1,
					order_id = 1,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 10,
					power = 1352423,
					sort_id = 2,
					order_id = 2,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 3,
					order_id = 3,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 4,
					order_id = 4,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 10,
					power = 1867148,
					sort_id = 5,
					order_id = 5,
					master_lev = 275,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 1,
					order_id = 6,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 2,
					order_id = 7,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 3,
					order_id = 8,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 10,
					power = 1787853,
					sort_id = 4,
					order_id = 9,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 10,
					power = 2367081,
					sort_id = 5,
					order_id = 10,
					master_lev = 295,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 10,
					power = 2229181,
					sort_id = 1,
					order_id = 11,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 10,
					power = 2220404,
					sort_id = 2,
					order_id = 12,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 10,
					power = 2226611,
					sort_id = 3,
					order_id = 13,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 10,
					power = 2235388,
					sort_id = 4,
					order_id = 14,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 11,
					power = 2804890,
					sort_id = 5,
					order_id = 15,
					master_lev = 315,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 1,
					order_id = 1,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 10,
					power = 2214744,
					sort_id = 2,
					order_id = 2,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 3,
					order_id = 3,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 4,
					order_id = 4,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 11,
					power = 2678201,
					sort_id = 5,
					order_id = 5,
					master_lev = 310,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 1,
					order_id = 6,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 2,
					order_id = 7,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 3,
					order_id = 8,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 2596856,
					sort_id = 4,
					order_id = 9,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 11,
					power = 3175994,
					sort_id = 5,
					order_id = 10,
					master_lev = 330,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 11,
					power = 3038521,
					sort_id = 1,
					order_id = 11,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 11,
					power = 3025990,
					sort_id = 2,
					order_id = 12,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 11,
					power = 3036139,
					sort_id = 3,
					order_id = 13,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 11,
					power = 3048670,
					sort_id = 4,
					order_id = 14,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 11,
					power = 3614425,
					sort_id = 5,
					order_id = 15,
					master_lev = 350,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 1,
					order_id = 1,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 11,
					power = 3025738,
					sort_id = 2,
					order_id = 2,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 3,
					order_id = 3,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 4,
					order_id = 4,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 11,
					power = 3489233,
					sort_id = 5,
					order_id = 5,
					master_lev = 345,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 1,
					order_id = 6,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 2,
					order_id = 7,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 3,
					order_id = 8,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 3405912,
					sort_id = 4,
					order_id = 9,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 11,
					power = 3984956,
					sort_id = 5,
					order_id = 10,
					master_lev = 365,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 11,
					power = 3847864,
					sort_id = 1,
					order_id = 11,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 11,
					power = 3831596,
					sort_id = 2,
					order_id = 12,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 11,
					power = 3845672,
					sort_id = 3,
					order_id = 13,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 11,
					power = 3861940,
					sort_id = 4,
					order_id = 14,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 11,
					power = 4423828,
					sort_id = 5,
					order_id = 15,
					master_lev = 385,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 1,
					order_id = 1,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 11,
					power = 3836782,
					sort_id = 2,
					order_id = 2,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 3,
					order_id = 3,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 4,
					order_id = 4,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 11,
					power = 4299840,
					sort_id = 5,
					order_id = 5,
					master_lev = 380,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 1,
					order_id = 6,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 2,
					order_id = 7,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 3,
					order_id = 8,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 4215015,
					sort_id = 4,
					order_id = 9,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 11,
					power = 4793985,
					sort_id = 5,
					order_id = 10,
					master_lev = 400,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 11,
					power = 4657157,
					sort_id = 1,
					order_id = 11,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 11,
					power = 4637161,
					sort_id = 2,
					order_id = 12,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 11,
					power = 4655153,
					sort_id = 3,
					order_id = 13,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 11,
					power = 4675149,
					sort_id = 4,
					order_id = 14,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 11,
					power = 5233715,
					sort_id = 5,
					order_id = 15,
					master_lev = 420,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 1,
					order_id = 1,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 11,
					power = 4647719,
					sort_id = 2,
					order_id = 2,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 3,
					order_id = 3,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 4,
					order_id = 4,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 11,
					power = 5111577,
					sort_id = 5,
					order_id = 5,
					master_lev = 415,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 1,
					order_id = 6,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 2,
					order_id = 7,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 3,
					order_id = 8,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 5024081,
					sort_id = 4,
					order_id = 9,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 11,
					power = 5602839,
					sort_id = 5,
					order_id = 10,
					master_lev = 435,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 11,
					power = 5466943,
					sort_id = 1,
					order_id = 11,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 11,
					power = 5443204,
					sort_id = 2,
					order_id = 12,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 11,
					power = 5465125,
					sort_id = 3,
					order_id = 13,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 11,
					power = 5488864,
					sort_id = 4,
					order_id = 14,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 11,
					power = 6043642,
					sort_id = 5,
					order_id = 15,
					master_lev = 455,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10509,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 1,
					order_id = 1,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30503,
					name = "输出试炼",
					star = 11,
					power = 5459452,
					sort_id = 2,
					order_id = 2,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30501,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 3,
					order_id = 3,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 4,
					order_id = 4,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30507,
					name = "BOSS关",
					star = 11,
					power = 5923373,
					sort_id = 5,
					order_id = 5,
					master_lev = 450,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 1,
					order_id = 6,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 30504,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 2,
					order_id = 7,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 30508,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 3,
					order_id = 8,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 5833211,
					sort_id = 4,
					order_id = 9,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20507,
					name = "BOSS关",
					star = 11,
					power = 6411842,
					sort_id = 5,
					order_id = 10,
					master_lev = 470,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20505,
					name = "控制试炼",
					star = 11,
					power = 6276708,
					sort_id = 1,
					order_id = 11,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 20508,
					name = "控制试炼",
					star = 11,
					power = 6249233,
					sort_id = 2,
					order_id = 12,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40504,
					name = "控制试炼",
					star = 11,
					power = 6275080,
					sort_id = 3,
					order_id = 13,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 30506,
					name = "控制试炼",
					star = 11,
					power = 6302555,
					sort_id = 4,
					order_id = 14,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 50504,
					name = "BOSS关",
					star = 11,
					power = 6853631,
					sort_id = 5,
					order_id = 15,
					master_lev = 490,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		}
	},
	{
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 1,
					order_id = 1,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 2,
					order_id = 2,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 3,
					order_id = 3,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 4,
					order_id = 4,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 6,
					power = 165548,
					sort_id = 5,
					order_id = 5,
					master_lev = 120,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 6,
					power = 161072,
					sort_id = 1,
					order_id = 6,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 6,
					power = 161866,
					sort_id = 2,
					order_id = 7,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 6,
					power = 162263,
					sort_id = 3,
					order_id = 8,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 4,
					order_id = 9,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 6,
					power = 203513,
					sort_id = 5,
					order_id = 10,
					master_lev = 140,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 6,
					power = 193988,
					sort_id = 1,
					order_id = 11,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 6,
					power = 193988,
					sort_id = 2,
					order_id = 12,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 6,
					power = 194956,
					sort_id = 3,
					order_id = 13,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 6,
					power = 194652,
					sort_id = 4,
					order_id = 14,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 7,
					power = 316694,
					sort_id = 5,
					order_id = 15,
					master_lev = 160,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 1,
					order_id = 1,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 2,
					order_id = 2,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 3,
					order_id = 3,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 4,
					order_id = 4,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 7,
					power = 313248,
					sort_id = 5,
					order_id = 5,
					master_lev = 160,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 6,
					power = 308395,
					sort_id = 1,
					order_id = 6,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 6,
					power = 310115,
					sort_id = 2,
					order_id = 7,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 6,
					power = 310975,
					sort_id = 3,
					order_id = 8,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 4,
					order_id = 9,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 7,
					power = 471393,
					sort_id = 5,
					order_id = 10,
					master_lev = 180,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 7,
					power = 453501,
					sort_id = 1,
					order_id = 11,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 7,
					power = 453501,
					sort_id = 2,
					order_id = 12,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 7,
					power = 456323,
					sort_id = 3,
					order_id = 13,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 7,
					power = 455150,
					sort_id = 4,
					order_id = 14,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 8,
					power = 704646,
					sort_id = 5,
					order_id = 15,
					master_lev = 200,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 1,
					order_id = 1,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 2,
					order_id = 2,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 3,
					order_id = 3,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 4,
					order_id = 4,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 9,
					power = 697103,
					sort_id = 5,
					order_id = 5,
					master_lev = 200,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 8,
					power = 688590,
					sort_id = 1,
					order_id = 6,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 8,
					power = 693150,
					sort_id = 2,
					order_id = 7,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 8,
					power = 695430,
					sort_id = 3,
					order_id = 8,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 4,
					order_id = 9,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 9,
					power = 1113387,
					sort_id = 5,
					order_id = 10,
					master_lev = 220,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 9,
					power = 1078682,
					sort_id = 1,
					order_id = 11,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 9,
					power = 1078682,
					sort_id = 2,
					order_id = 12,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 9,
					power = 1086332,
					sort_id = 3,
					order_id = 13,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 9,
					power = 1082249,
					sort_id = 4,
					order_id = 14,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 10,
					power = 1252021,
					sort_id = 5,
					order_id = 15,
					master_lev = 240,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 1,
					order_id = 1,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 2,
					order_id = 2,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 3,
					order_id = 3,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 4,
					order_id = 4,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 10,
					power = 1239759,
					sort_id = 5,
					order_id = 5,
					master_lev = 240,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 10,
					power = 1226089,
					sort_id = 1,
					order_id = 6,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 10,
					power = 1234727,
					sort_id = 2,
					order_id = 7,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 10,
					power = 1239046,
					sort_id = 3,
					order_id = 8,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 4,
					order_id = 9,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 10,
					power = 1559403,
					sort_id = 5,
					order_id = 10,
					master_lev = 260,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 10,
					power = 1351667,
					sort_id = 1,
					order_id = 11,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 10,
					power = 1351667,
					sort_id = 2,
					order_id = 12,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 10,
					power = 1361287,
					sort_id = 3,
					order_id = 13,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 10,
					power = 1356043,
					sort_id = 4,
					order_id = 14,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 10,
					power = 1995350,
					sort_id = 5,
					order_id = 15,
					master_lev = 280,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 1,
					order_id = 1,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 2,
					order_id = 2,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 3,
					order_id = 3,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 4,
					order_id = 4,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 10,
					power = 1867148,
					sort_id = 5,
					order_id = 5,
					master_lev = 275,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 10,
					power = 1790531,
					sort_id = 1,
					order_id = 6,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 10,
					power = 1787853,
					sort_id = 2,
					order_id = 7,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 10,
					power = 1786514,
					sort_id = 3,
					order_id = 8,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 4,
					order_id = 9,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 10,
					power = 2368353,
					sort_id = 5,
					order_id = 10,
					master_lev = 295,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 10,
					power = 2235388,
					sort_id = 1,
					order_id = 11,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 10,
					power = 2235388,
					sort_id = 2,
					order_id = 12,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 10,
					power = 2232818,
					sort_id = 3,
					order_id = 13,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 10,
					power = 2229181,
					sort_id = 4,
					order_id = 14,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 11,
					power = 2804890,
					sort_id = 5,
					order_id = 15,
					master_lev = 315,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 1,
					order_id = 1,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 2,
					order_id = 2,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 3,
					order_id = 3,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 4,
					order_id = 4,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 11,
					power = 2678201,
					sort_id = 5,
					order_id = 5,
					master_lev = 310,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 11,
					power = 2599342,
					sort_id = 1,
					order_id = 6,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 2596856,
					sort_id = 2,
					order_id = 7,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 2595613,
					sort_id = 3,
					order_id = 8,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 4,
					order_id = 9,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 3177172,
					sort_id = 5,
					order_id = 10,
					master_lev = 330,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 11,
					power = 3048670,
					sort_id = 1,
					order_id = 11,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 11,
					power = 3048670,
					sort_id = 2,
					order_id = 12,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 11,
					power = 3046288,
					sort_id = 3,
					order_id = 13,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 11,
					power = 3038521,
					sort_id = 4,
					order_id = 14,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 11,
					power = 3614425,
					sort_id = 5,
					order_id = 15,
					master_lev = 350,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 1,
					order_id = 1,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 2,
					order_id = 2,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 3,
					order_id = 3,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 4,
					order_id = 4,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 11,
					power = 3489233,
					sort_id = 5,
					order_id = 5,
					master_lev = 345,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 11,
					power = 3408214,
					sort_id = 1,
					order_id = 6,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 3405912,
					sort_id = 2,
					order_id = 7,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 3404761,
					sort_id = 3,
					order_id = 8,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 4,
					order_id = 9,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 3986038,
					sort_id = 5,
					order_id = 10,
					master_lev = 365,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 11,
					power = 3861940,
					sort_id = 1,
					order_id = 11,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 11,
					power = 3861940,
					sort_id = 2,
					order_id = 12,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 11,
					power = 3859748,
					sort_id = 3,
					order_id = 13,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 11,
					power = 3847864,
					sort_id = 4,
					order_id = 14,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 11,
					power = 4423828,
					sort_id = 5,
					order_id = 15,
					master_lev = 385,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 1,
					order_id = 1,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 2,
					order_id = 2,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 3,
					order_id = 3,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 4,
					order_id = 4,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 11,
					power = 4299840,
					sort_id = 5,
					order_id = 5,
					master_lev = 380,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 11,
					power = 4217125,
					sort_id = 1,
					order_id = 6,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 4215015,
					sort_id = 2,
					order_id = 7,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 4213960,
					sort_id = 3,
					order_id = 8,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 4,
					order_id = 9,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 4794975,
					sort_id = 5,
					order_id = 10,
					master_lev = 400,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 11,
					power = 4675149,
					sort_id = 1,
					order_id = 11,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 11,
					power = 4675149,
					sort_id = 2,
					order_id = 12,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 11,
					power = 4673145,
					sort_id = 3,
					order_id = 13,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 11,
					power = 4657157,
					sort_id = 4,
					order_id = 14,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 11,
					power = 5233715,
					sort_id = 5,
					order_id = 15,
					master_lev = 420,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 1,
					order_id = 1,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 2,
					order_id = 2,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 3,
					order_id = 3,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 4,
					order_id = 4,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 11,
					power = 5111577,
					sort_id = 5,
					order_id = 5,
					master_lev = 415,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 11,
					power = 5026007,
					sort_id = 1,
					order_id = 6,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 5024081,
					sort_id = 2,
					order_id = 7,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 5023118,
					sort_id = 3,
					order_id = 8,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 4,
					order_id = 9,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 5603732,
					sort_id = 5,
					order_id = 10,
					master_lev = 435,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 11,
					power = 5488864,
					sort_id = 1,
					order_id = 11,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 11,
					power = 5488864,
					sort_id = 2,
					order_id = 12,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 11,
					power = 5487046,
					sort_id = 3,
					order_id = 13,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 11,
					power = 5466943,
					sort_id = 4,
					order_id = 14,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 11,
					power = 6043642,
					sort_id = 5,
					order_id = 15,
					master_lev = 455,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 10506,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 1,
					order_id = 1,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 10501,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 2,
					order_id = 2,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 40508,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 3,
					order_id = 3,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 4,
					order_id = 4,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				},
				{
					head_id = 50507,
					name = "BOSS关",
					star = 11,
					power = 5923373,
					sort_id = 5,
					order_id = 5,
					master_lev = 450,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方法术伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40504,
					name = "生命试炼",
					star = 11,
					power = 5834947,
					sort_id = 1,
					order_id = 6,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 10505,
					name = "生命试炼",
					star = 11,
					power = 5833211,
					sort_id = 2,
					order_id = 7,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 20501,
					name = "生命试炼",
					star = 11,
					power = 5832343,
					sort_id = 3,
					order_id = 8,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 30506,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 4,
					order_id = 9,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 30509,
					name = "BOSS关",
					star = 11,
					power = 6412641,
					sort_id = 5,
					order_id = 10,
					master_lev = 470,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 20502,
					name = "控制试炼",
					star = 11,
					power = 6302555,
					sort_id = 1,
					order_id = 11,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 40503,
					name = "控制试炼",
					star = 11,
					power = 6302555,
					sort_id = 2,
					order_id = 12,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 50508,
					name = "控制试炼",
					star = 11,
					power = 6300927,
					sort_id = 3,
					order_id = 13,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20507,
					name = "控制试炼",
					star = 11,
					power = 6276708,
					sort_id = 4,
					order_id = 14,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 30508,
					name = "BOSS关",
					star = 11,
					power = 6853631,
					sort_id = 5,
					order_id = 15,
					master_lev = 490,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		}
	},
	{
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 5,
					power = 102172,
					sort_id = 1,
					order_id = 1,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 2,
					order_id = 2,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 5,
					power = 102716,
					sort_id = 3,
					order_id = 3,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 5,
					power = 102444,
					sort_id = 4,
					order_id = 4,
					master_lev = 100,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 6,
					power = 164972,
					sort_id = 5,
					order_id = 5,
					master_lev = 120,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 6,
					power = 161866,
					sort_id = 1,
					order_id = 6,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 2,
					order_id = 7,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 6,
					power = 162263,
					sort_id = 3,
					order_id = 8,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 6,
					power = 161469,
					sort_id = 4,
					order_id = 9,
					master_lev = 115,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 6,
					power = 205007,
					sort_id = 5,
					order_id = 10,
					master_lev = 140,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 6,
					power = 195620,
					sort_id = 1,
					order_id = 11,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 6,
					power = 195620,
					sort_id = 2,
					order_id = 12,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 6,
					power = 194652,
					sort_id = 3,
					order_id = 13,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 6,
					power = 194956,
					sort_id = 4,
					order_id = 14,
					master_lev = 135,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 7,
					power = 314924,
					sort_id = 5,
					order_id = 15,
					master_lev = 160,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 6,
					power = 199177,
					sort_id = 1,
					order_id = 1,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 2,
					order_id = 2,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 6,
					power = 200551,
					sort_id = 3,
					order_id = 3,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 6,
					power = 199864,
					sort_id = 4,
					order_id = 4,
					master_lev = 140,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 7,
					power = 312122,
					sort_id = 5,
					order_id = 5,
					master_lev = 160,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 6,
					power = 310115,
					sort_id = 1,
					order_id = 6,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 2,
					order_id = 7,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 6,
					power = 310975,
					sort_id = 3,
					order_id = 8,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 6,
					power = 309255,
					sort_id = 4,
					order_id = 9,
					master_lev = 155,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 7,
					power = 475737,
					sort_id = 5,
					order_id = 10,
					master_lev = 180,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 7,
					power = 457972,
					sort_id = 1,
					order_id = 11,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 7,
					power = 457972,
					sort_id = 2,
					order_id = 12,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 7,
					power = 455150,
					sort_id = 3,
					order_id = 13,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 7,
					power = 456323,
					sort_id = 4,
					order_id = 14,
					master_lev = 175,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 8,
					power = 699980,
					sort_id = 5,
					order_id = 15,
					master_lev = 200,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 8,
					power = 461730,
					sort_id = 1,
					order_id = 1,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 2,
					order_id = 2,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 8,
					power = 465120,
					sort_id = 3,
					order_id = 3,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 8,
					power = 463425,
					sort_id = 4,
					order_id = 4,
					master_lev = 180,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 9,
					power = 694622,
					sort_id = 5,
					order_id = 5,
					master_lev = 200,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 8,
					power = 693150,
					sort_id = 1,
					order_id = 6,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 2,
					order_id = 7,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 8,
					power = 695430,
					sort_id = 3,
					order_id = 8,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 8,
					power = 690870,
					sort_id = 4,
					order_id = 9,
					master_lev = 195,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 9,
					power = 1125093,
					sort_id = 5,
					order_id = 10,
					master_lev = 220,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 9,
					power = 1089899,
					sort_id = 1,
					order_id = 11,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 9,
					power = 1089899,
					sort_id = 2,
					order_id = 12,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 9,
					power = 1082249,
					sort_id = 3,
					order_id = 13,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 9,
					power = 1086332,
					sort_id = 4,
					order_id = 14,
					master_lev = 215,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 10,
					power = 1243225,
					sort_id = 5,
					order_id = 15,
					master_lev = 240,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 9,
					power = 1095841,
					sort_id = 1,
					order_id = 1,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 2,
					order_id = 2,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 9,
					power = 1103153,
					sort_id = 3,
					order_id = 3,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 9,
					power = 1099497,
					sort_id = 4,
					order_id = 4,
					master_lev = 220,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 10,
					power = 1235711,
					sort_id = 5,
					order_id = 5,
					master_lev = 240,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 10,
					power = 1234727,
					sort_id = 1,
					order_id = 6,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 2,
					order_id = 7,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 10,
					power = 1239046,
					sort_id = 3,
					order_id = 8,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 10,
					power = 1230408,
					sort_id = 4,
					order_id = 9,
					master_lev = 235,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 10,
					power = 1555302,
					sort_id = 5,
					order_id = 10,
					master_lev = 260,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 10,
					power = 1365663,
					sort_id = 1,
					order_id = 11,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 10,
					power = 1365663,
					sort_id = 2,
					order_id = 12,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 10,
					power = 1356043,
					sort_id = 3,
					order_id = 13,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 10,
					power = 1361287,
					sort_id = 4,
					order_id = 14,
					master_lev = 255,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 10,
					power = 1997974,
					sort_id = 5,
					order_id = 15,
					master_lev = 280,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 10,
					power = 1343671,
					sort_id = 1,
					order_id = 1,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 2,
					order_id = 2,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 10,
					power = 1352423,
					sort_id = 3,
					order_id = 3,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 10,
					power = 1348047,
					sort_id = 4,
					order_id = 4,
					master_lev = 255,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 10,
					power = 1871677,
					sort_id = 5,
					order_id = 5,
					master_lev = 275,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 10,
					power = 1787853,
					sort_id = 1,
					order_id = 6,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 2,
					order_id = 7,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 10,
					power = 1786514,
					sort_id = 3,
					order_id = 8,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 10,
					power = 1789192,
					sort_id = 4,
					order_id = 9,
					master_lev = 270,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 10,
					power = 2364537,
					sort_id = 5,
					order_id = 10,
					master_lev = 295,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 10,
					power = 2226611,
					sort_id = 1,
					order_id = 11,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 10,
					power = 2226611,
					sort_id = 2,
					order_id = 12,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 10,
					power = 2229181,
					sort_id = 3,
					order_id = 13,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 10,
					power = 2232818,
					sort_id = 4,
					order_id = 14,
					master_lev = 290,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 11,
					power = 2807324,
					sort_id = 5,
					order_id = 15,
					master_lev = 315,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 10,
					power = 2227158,
					sort_id = 1,
					order_id = 1,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 2,
					order_id = 2,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 10,
					power = 2214744,
					sort_id = 3,
					order_id = 3,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 10,
					power = 2220951,
					sort_id = 4,
					order_id = 4,
					master_lev = 290,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 11,
					power = 2686654,
					sort_id = 5,
					order_id = 5,
					master_lev = 310,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 11,
					power = 2596856,
					sort_id = 1,
					order_id = 6,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 2,
					order_id = 7,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 11,
					power = 2595613,
					sort_id = 3,
					order_id = 8,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 11,
					power = 2598099,
					sort_id = 4,
					order_id = 9,
					master_lev = 305,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 11,
					power = 3173638,
					sort_id = 5,
					order_id = 10,
					master_lev = 330,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 11,
					power = 3036139,
					sort_id = 1,
					order_id = 11,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 11,
					power = 3036139,
					sort_id = 2,
					order_id = 12,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 11,
					power = 3038521,
					sort_id = 3,
					order_id = 13,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 11,
					power = 3046288,
					sort_id = 4,
					order_id = 14,
					master_lev = 325,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 11,
					power = 3616671,
					sort_id = 5,
					order_id = 15,
					master_lev = 350,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 11,
					power = 3046036,
					sort_id = 1,
					order_id = 1,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 2,
					order_id = 2,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 3025738,
					sort_id = 3,
					order_id = 3,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 3035887,
					sort_id = 4,
					order_id = 4,
					master_lev = 325,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 11,
					power = 3501627,
					sort_id = 5,
					order_id = 5,
					master_lev = 345,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 11,
					power = 3405912,
					sort_id = 1,
					order_id = 6,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 2,
					order_id = 7,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 11,
					power = 3404761,
					sort_id = 3,
					order_id = 8,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 11,
					power = 3407063,
					sort_id = 4,
					order_id = 9,
					master_lev = 340,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 11,
					power = 3982792,
					sort_id = 5,
					order_id = 10,
					master_lev = 365,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 11,
					power = 3845672,
					sort_id = 1,
					order_id = 11,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 11,
					power = 3845672,
					sort_id = 2,
					order_id = 12,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 11,
					power = 3847864,
					sort_id = 3,
					order_id = 13,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 11,
					power = 3859748,
					sort_id = 4,
					order_id = 14,
					master_lev = 360,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 11,
					power = 4425888,
					sort_id = 5,
					order_id = 15,
					master_lev = 385,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 11,
					power = 3864934,
					sort_id = 1,
					order_id = 1,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 2,
					order_id = 2,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 3836782,
					sort_id = 3,
					order_id = 3,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 3850858,
					sort_id = 4,
					order_id = 4,
					master_lev = 360,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 11,
					power = 4316155,
					sort_id = 5,
					order_id = 5,
					master_lev = 380,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 11,
					power = 4215015,
					sort_id = 1,
					order_id = 6,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 2,
					order_id = 7,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 11,
					power = 4213960,
					sort_id = 3,
					order_id = 8,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 11,
					power = 4216070,
					sort_id = 4,
					order_id = 9,
					master_lev = 375,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 11,
					power = 4792005,
					sort_id = 5,
					order_id = 10,
					master_lev = 400,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 11,
					power = 4655153,
					sort_id = 1,
					order_id = 11,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 11,
					power = 4655153,
					sort_id = 2,
					order_id = 12,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 11,
					power = 4657157,
					sort_id = 3,
					order_id = 13,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 11,
					power = 4673145,
					sort_id = 4,
					order_id = 14,
					master_lev = 395,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 11,
					power = 5235587,
					sort_id = 5,
					order_id = 15,
					master_lev = 420,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 11,
					power = 4683703,
					sort_id = 1,
					order_id = 1,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 2,
					order_id = 2,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 4647719,
					sort_id = 3,
					order_id = 3,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 4665711,
					sort_id = 4,
					order_id = 4,
					master_lev = 395,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 11,
					power = 5131818,
					sort_id = 5,
					order_id = 5,
					master_lev = 415,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 11,
					power = 5024081,
					sort_id = 1,
					order_id = 6,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 2,
					order_id = 7,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 11,
					power = 5023118,
					sort_id = 3,
					order_id = 8,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 11,
					power = 5025044,
					sort_id = 4,
					order_id = 9,
					master_lev = 410,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 11,
					power = 5601053,
					sort_id = 5,
					order_id = 10,
					master_lev = 435,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 11,
					power = 5465125,
					sort_id = 1,
					order_id = 11,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 11,
					power = 5465125,
					sort_id = 2,
					order_id = 12,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 11,
					power = 5466943,
					sort_id = 3,
					order_id = 13,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 11,
					power = 5487046,
					sort_id = 4,
					order_id = 14,
					master_lev = 430,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 11,
					power = 6045324,
					sort_id = 5,
					order_id = 15,
					master_lev = 455,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		},
		{
			{
				{
					head_id = 20504,
					name = "输出试炼",
					star = 11,
					power = 5503294,
					sort_id = 1,
					order_id = 1,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方强者英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10510,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 2,
					order_id = 2,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方海贼新星英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 30502,
					name = "输出试炼",
					star = 11,
					power = 5459452,
					sort_id = 3,
					order_id = 3,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方草帽联盟英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 10504,
					name = "输出试炼",
					star = 11,
					power = 5481373,
					sort_id = 4,
					order_id = 4,
					master_lev = 430,
					order_type = 1,
					add_skill_decs = {
						"我方五皇团英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				},
				{
					head_id = 50503,
					name = "BOSS关",
					star = 11,
					power = 5947542,
					sort_id = 5,
					order_id = 5,
					master_lev = 450,
					order_type = 1,
					add_skill_decs = {
						"我方海军英雄伤害提升100%",
						"我方物理伤害提升100%"
					}
				}
			},
			{
				[6] = {
					head_id = 40503,
					name = "生命试炼",
					star = 11,
					power = 5833211,
					sort_id = 1,
					order_id = 6,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[7] = {
					head_id = 50504,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 2,
					order_id = 7,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[8] = {
					head_id = 50508,
					name = "生命试炼",
					star = 11,
					power = 5832343,
					sort_id = 3,
					order_id = 8,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[9] = {
					head_id = 20507,
					name = "生命试炼",
					star = 11,
					power = 5834079,
					sort_id = 4,
					order_id = 9,
					master_lev = 445,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				},
				[10] = {
					head_id = 20508,
					name = "BOSS关",
					star = 11,
					power = 6410244,
					sort_id = 5,
					order_id = 10,
					master_lev = 470,
					order_type = 2,
					add_skill_decs = {
						"回合结束会受到8%最大生命的伤害",
						"生命值高于90%时，伤害增加150%"
					}
				}
			},
			{
				[11] = {
					head_id = 30504,
					name = "控制试炼",
					star = 11,
					power = 6275080,
					sort_id = 1,
					order_id = 11,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方强者英雄伤害提升100%"
					}
				},
				[12] = {
					head_id = 50502,
					name = "控制试炼",
					star = 11,
					power = 6275080,
					sort_id = 2,
					order_id = 12,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海贼新星英雄伤害提升100%"
					}
				},
				[13] = {
					head_id = 40502,
					name = "控制试炼",
					star = 11,
					power = 6276708,
					sort_id = 3,
					order_id = 13,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方草帽联盟英雄伤害提升100%"
					}
				},
				[14] = {
					head_id = 20509,
					name = "控制试炼",
					star = 11,
					power = 6300927,
					sort_id = 4,
					order_id = 14,
					master_lev = 465,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方五皇团英雄伤害提升100%"
					}
				},
				[15] = {
					head_id = 10502,
					name = "BOSS关",
					star = 11,
					power = 6855121,
					sort_id = 5,
					order_id = 15,
					master_lev = 490,
					order_type = 3,
					add_skill_decs = {
						"敌人被控制时，会增加100%受到伤害",
						"我方海军英雄伤害提升100%"
					}
				}
			}
		}
	}
}
Config.HolidayBossNewData.data_explain_length = 6
Config.HolidayBossNewData.data_explain = {
	{
		id = 1,
		title = "活动周期",
		desc = "试炼之境<div fontcolor=#c23f35>每周重置都会进行一次更新</div>，更新后关卡内容会发生变化。请尽量在一周内攻略完所有关卡"
	},
	{
		id = 2,
		title = "挑战注意",
		desc = "在挑战任何关卡时，无论是否成功，<div fontcolor=#c23f35>都会消耗今日可挑战次数</div>。"
	},
	{
		id = 3,
		title = "关卡特征",
		desc = "每次挑战结束，关卡怪物的剩余生命值将被保留至下一次挑战\n每个关卡有对应的效果加成，<div fontcolor=#c23f35>搭配合适的英雄进行挑战，可以事半功倍哦~</div>"
	},
	{
		id = 4,
		title = "奖励获取",
		desc = [[
通关奖励
每次通过关卡，<div fontcolor=#c23f35>会随机掉落一些奖励</div>，各个阶段的掉落均有不同
 
结算奖励
每通关一个阶段，会使<div fontcolor=#c23f35>结算奖励升级</div>，在周期结算时可获取到上一期的结算奖励（奖励通过邮件发放）
如果提前通关当期所有关卡，可立即获取结算奖励]]
	},
	{
		id = 5,
		title = "难度升降",
		desc = [[
首次进入难度匹配
首次参与活动的玩家会根据用户<div fontcolor=#c23f35>当前最高战力</div>进行难度匹配，后续将不再进行匹配（单一大轮内）
 
升降级区
每周会根据关卡分为<div fontcolor=#c23f35>降级，保级，升级</div>3个区域
完全通关对应的区域可解锁更好的结算奖励
通关升级区后，下一期的难度会有所上升（达到上限将不再提升），对应的奖励也会获得更好
若用户一周内玩家不参加或没有通关降级区，则下一期会降级（多周未参与最多下降一级）]]
	},
	{
		id = 6,
		title = "参与次数",
		desc = "每日可以<div fontcolor=#c23f35>免费挑战2次</div>，每日0点会重置挑战次数和购买次数\n\n一旦发起挑战，无论胜负，均会消耗一次挑战次数"
	}
}

function Config.HolidayBossNewData.data_explain_fun(slot0)
	slot1 = Config.HolidayBossNewData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayBossNewData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
