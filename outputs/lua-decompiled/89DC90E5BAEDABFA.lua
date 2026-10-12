Config = Config or {}
Config.MonopolyDungeonsData = Config.MonopolyDungeonsData or {}
Config.MonopolyDungeonsData.data_const_length = 5
Config.MonopolyDungeonsData.data_const = {
	monopoly_combat_id = {
		desc = "挑战券id",
		val = {
			80245
		}
	},
	monopoly_follow_combat_id = {
		desc = "可追击的Boss_id",
		val = {
			4
		}
	},
	monopoly_buff_max = {
		desc = "最大数值",
		val = {
			{
				"attack",
				1000000
			},
			{
				"hp_max",
				10000000
			}
		}
	},
	day_worship_max = {
		desc = "每日点赞上限",
		val = {
			20
		}
	},
	worship_reward = {
		desc = "点赞奖励",
		val = {
			{
				1,
				10000
			}
		}
	}
}

function Config.MonopolyDungeonsData.data_const_fun(slot0)
	slot1 = Config.MonopolyDungeonsData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyDungeonsData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyDungeonsData.data_boss_info_length = 4
Config.MonopolyDungeonsData.data_boss_info = {
	{
		{
			id = 1,
			head_id = 10101,
			base_id = 910101,
			develop = 400,
			boss_id = 1,
			boss_name = "等待者1",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					100
				},
				{
					36,
					10
				},
				{
					10,
					1000
				}
			}
		},
		{
			id = 1,
			head_id = 10201,
			base_id = 910102,
			develop = 800,
			boss_id = 2,
			boss_name = "等待者2",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					150
				},
				{
					36,
					20
				},
				{
					10,
					1500
				}
			}
		},
		{
			id = 1,
			head_id = 10202,
			base_id = 910103,
			develop = 1200,
			boss_id = 3,
			boss_name = "等待者3",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					200
				},
				{
					36,
					30
				},
				{
					10,
					2000
				}
			}
		},
		{
			id = 1,
			head_id = 50510,
			base_id = 910104,
			develop = 1600,
			boss_id = 4,
			boss_name = "马尔科",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					300
				},
				{
					36,
					50
				},
				{
					10,
					3000
				}
			}
		}
	},
	{
		{
			id = 2,
			head_id = 10101,
			base_id = 910201,
			develop = 400,
			boss_id = 1,
			boss_name = "爆笑者1",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					100
				},
				{
					36,
					10
				},
				{
					10,
					1000
				}
			}
		},
		{
			id = 2,
			head_id = 10201,
			base_id = 910202,
			develop = 800,
			boss_id = 2,
			boss_name = "爆笑者2",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					150
				},
				{
					36,
					20
				},
				{
					10,
					1500
				}
			}
		},
		{
			id = 2,
			head_id = 10202,
			base_id = 910203,
			develop = 1200,
			boss_id = 3,
			boss_name = "爆笑者3",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					200
				},
				{
					36,
					30
				},
				{
					10,
					2000
				}
			}
		},
		{
			id = 2,
			head_id = 30508,
			base_id = 910204,
			develop = 1600,
			boss_id = 4,
			boss_name = "霜月龙马",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					300
				},
				{
					36,
					50
				},
				{
					10,
					3000
				}
			}
		}
	},
	{
		{
			id = 3,
			head_id = 10101,
			base_id = 910301,
			develop = 400,
			boss_id = 1,
			boss_name = "给赋者1",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					100
				},
				{
					36,
					10
				},
				{
					10,
					1000
				}
			}
		},
		{
			id = 3,
			head_id = 10201,
			base_id = 910302,
			develop = 800,
			boss_id = 2,
			boss_name = "给赋者2",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					150
				},
				{
					36,
					20
				},
				{
					10,
					1500
				}
			}
		},
		{
			id = 3,
			head_id = 10202,
			base_id = 910303,
			develop = 1200,
			boss_id = 3,
			boss_name = "给赋者3",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					200
				},
				{
					36,
					30
				},
				{
					10,
					2000
				}
			}
		},
		{
			id = 3,
			head_id = 10503,
			base_id = 910304,
			develop = 1600,
			boss_id = 4,
			boss_name = "德雷克",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					300
				},
				{
					36,
					50
				},
				{
					10,
					3000
				}
			}
		}
	},
	{
		{
			id = 4,
			head_id = 10101,
			base_id = 910401,
			develop = 400,
			boss_id = 1,
			boss_name = "给赋者",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					100
				},
				{
					36,
					10
				},
				{
					10,
					1000
				}
			}
		},
		{
			id = 4,
			head_id = 10201,
			base_id = 910402,
			develop = 800,
			boss_id = 2,
			boss_name = "给赋者",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					150
				},
				{
					36,
					20
				},
				{
					10,
					1500
				}
			}
		},
		{
			id = 4,
			head_id = 10513,
			base_id = 910403,
			develop = 1200,
			boss_id = 3,
			boss_name = "霍金斯",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					200
				},
				{
					36,
					30
				},
				{
					10,
					2000
				}
			}
		},
		{
			id = 4,
			head_id = 50512,
			base_id = 910404,
			develop = 1600,
			boss_id = 4,
			boss_name = "凯多",
			drop_id = {
				{
					80244,
					5
				},
				{
					10,
					100
				}
			},
			reward = {
				{
					80244,
					300
				},
				{
					36,
					50
				},
				{
					10,
					3000
				}
			}
		}
	}
}
Config.MonopolyDungeonsData.data_main_hero_length = 4
Config.MonopolyDungeonsData.data_main_hero = {
	{
		id = 1,
		buff_val = 50,
		main_partner = {
			20510,
			40511,
			50511
		},
		main_buff = {
			670011
		}
	},
	{
		id = 2,
		buff_val = 50,
		main_partner = {
			10503,
			10513,
			10502
		},
		main_buff = {
			670011
		}
	},
	{
		id = 3,
		buff_val = 50,
		main_partner = {
			50509,
			50501,
			20511
		},
		main_buff = {
			670011
		}
	},
	{
		id = 4,
		buff_val = 50,
		main_partner = {
			10505,
			50509,
			10511
		},
		main_buff = {
			670011
		}
	}
}

function Config.MonopolyDungeonsData.data_main_hero_fun(slot0)
	slot1 = Config.MonopolyDungeonsData.data_main_hero[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.MonopolyDungeonsData.data_main_hero[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.MonopolyDungeonsData.data_award_length = 5
Config.MonopolyDungeonsData.data_award = {
	{
		min = 1,
		max = 1,
		items = {
			{
				14001,
				10
			},
			{
				10403,
				60
			},
			{
				39047,
				16
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				14001,
				8
			},
			{
				10403,
				48
			},
			{
				39047,
				12
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				14001,
				6
			},
			{
				10403,
				36
			},
			{
				39047,
				8
			}
		}
	},
	{
		min = 4,
		max = 4,
		items = {
			{
				14001,
				4
			},
			{
				10403,
				24
			},
			{
				39047,
				4
			}
		}
	},
	{
		min = 5,
		max = 5,
		items = {
			{
				14001,
				2
			},
			{
				10403,
				12
			},
			{
				39047,
				2
			}
		}
	}
}
