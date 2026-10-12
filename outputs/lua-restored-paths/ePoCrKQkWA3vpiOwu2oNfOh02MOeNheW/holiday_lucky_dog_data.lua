Config = Config or {}
Config.HolidayLuckyDogData = Config.HolidayLuckyDogData or {}
Config.HolidayLuckyDogData.data_constant_length = 1
Config.HolidayLuckyDogData.data_constant = {
	rules = {
		val = 1,
		code = "rules",
		desc = [[
1.活动时间：2020年1月23日-29日
2.活动期间，完成幸运锦鲤任务，即可获得锦鲤号码，参与号码抽奖！
3.开奖时间为<div fontcolor=289b14>当天晚上的23:50</div>，若你当期获取的号码与开奖号码一样，恭喜你获得大奖！没有中奖也不要灰心，其他号码也能获得安慰幸运奖哦！
4.每位冒险者大人获取的3个锦鲤任务，要在<div fontcolor=289b14>开奖前（23：50）完成</div>任务获得的号码才能参与幸运锦鲤开奖！赶快行动起来吧！]]
	}
}

function Config.HolidayLuckyDogData.data_constant_fun(slot0)
	slot1 = Config.HolidayLuckyDogData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayLuckyDogData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayLuckyDogData.data_period_length = 7
Config.HolidayLuckyDogData.data_period = {
	{
		period = 1,
		open_time = "1月23日23：50",
		quest_ids = {
			101,
			108,
			109
		}
	},
	{
		period = 2,
		open_time = "1月24日23：50",
		quest_ids = {
			102,
			108,
			109
		}
	},
	{
		period = 3,
		open_time = "1月25日23：50",
		quest_ids = {
			103,
			108,
			109
		}
	},
	{
		period = 4,
		open_time = "1月26日23：50",
		quest_ids = {
			104,
			108,
			109
		}
	},
	{
		period = 5,
		open_time = "1月27日23：50",
		quest_ids = {
			105,
			108,
			109
		}
	},
	{
		period = 6,
		open_time = "1月28日23：50",
		quest_ids = {
			106,
			108,
			109
		}
	},
	{
		period = 7,
		open_time = "1月29日23：50",
		quest_ids = {
			107,
			108,
			109
		}
	}
}

function Config.HolidayLuckyDogData.data_period_fun(slot0)
	slot1 = Config.HolidayLuckyDogData.data_period[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayLuckyDogData.data_period[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayLuckyDogData.data_quest_length = 9
Config.HolidayLuckyDogData.data_quest = {
	[101] = {
		quest_id = 101,
		jump_id = 3,
		desc = "竞技场胜利五次",
		condition = {
			"evt_arena_fight_result",
			0,
			5,
			{}
		}
	},
	[102] = {
		quest_id = 102,
		jump_id = 1,
		desc = "高级召唤两次",
		condition = {
			"evt_high_recruit",
			0,
			2,
			{}
		}
	},
	[103] = {
		quest_id = 103,
		jump_id = 11,
		desc = "快速作战2次",
		condition = {
			"evt_dungeon_fast_combat",
			0,
			2,
			{}
		}
	},
	[104] = {
		quest_id = 104,
		jump_id = 40,
		desc = "幸运寻宝十次",
		condition = {
			"evt_dial",
			0,
			10,
			{}
		}
	},
	[105] = {
		quest_id = 105,
		jump_id = 17,
		desc = "日常副本6次",
		condition = {
			"evt_dungeon_stone_fight",
			0,
			6,
			{}
		}
	},
	[106] = {
		quest_id = 106,
		jump_id = 4,
		desc = "赠送好友友情点5次",
		condition = {
			"evt_friend_present",
			0,
			5,
			{}
		}
	},
	[107] = {
		quest_id = 107,
		jump_id = 3,
		desc = "竞技场胜利五次",
		condition = {
			"evt_arena_fight_result",
			0,
			5,
			{}
		}
	},
	[108] = {
		quest_id = 108,
		jump_id = 69,
		desc = "分享一次游戏",
		condition = {
			"evt_share_game",
			0,
			1,
			{}
		}
	},
	[109] = {
		quest_id = 109,
		jump_id = 7,
		desc = "累充6元",
		condition = {
			"charge_rmb",
			0,
			6,
			{}
		}
	}
}

function Config.HolidayLuckyDogData.data_quest_fun(slot0)
	slot1 = Config.HolidayLuckyDogData.data_quest[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayLuckyDogData.data_quest[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayLuckyDogData.data_quest_award_length = 7
Config.HolidayLuckyDogData.data_quest_award = {
	{
		{
			limit_number = 766,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 52,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 8,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	},
	{
		{
			limit_number = 958,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 33,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 2,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	},
	{
		{
			limit_number = 673,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 21,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 6,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	},
	{
		{
			limit_number = 649,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 52,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 3,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	},
	{
		{
			limit_number = 238,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 79,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 1,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	},
	{
		{
			limit_number = 309,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 68,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 5,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	},
	{
		{
			limit_number = 202,
			award = {
				{
					3,
					500
				},
				{
					14001,
					1
				}
			}
		},
		{
			limit_number = 86,
			award = {
				{
					3,
					300
				},
				{
					10403,
					1
				}
			}
		},
		{
			limit_number = 9,
			award = {
				{
					3,
					100
				}
			}
		},
		{
			limit_number = 0,
			award = {
				{
					3,
					50
				}
			}
		}
	}
}
