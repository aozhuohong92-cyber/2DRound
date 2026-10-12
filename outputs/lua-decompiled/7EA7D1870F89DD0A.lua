Config = Config or {}
Config.HolidayValentineBossData = Config.HolidayValentineBossData or {}
Config.HolidayValentineBossData.data_constant_length = 5
Config.HolidayValentineBossData.data_constant = {
	holiday_valentine_boss_buy_loss1 = {
		desc = "购买第一次所需资产",
		val = {
			{
				3,
				200
			}
		}
	},
	holiday_valentine_boss_buy_loss2 = {
		desc = "购买第二次所需资产",
		val = {
			{
				3,
				200
			}
		}
	},
	holiday_valentine_boss_buy_loss3 = {
		desc = "",
		val = {
			{
				3,
				200
			}
		}
	},
	holiday_valentine_boss_buy_loss4 = {
		desc = "",
		val = {
			{
				3,
				200
			}
		}
	},
	holiday_valentine_boss_buy_loss5 = {
		desc = "",
		val = {
			{
				3,
				200
			}
		}
	}
}

function Config.HolidayValentineBossData.data_constant_fun(slot0)
	slot1 = Config.HolidayValentineBossData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayValentineBossData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayValentineBossData.data_boss_list_length = 5
Config.HolidayValentineBossData.data_boss_list = {
	[49971] = {
		{
			time = 2,
			camp_id = 49971,
			draw_id = 1,
			boss_id = 97101,
			title_name = "元帅试炼",
			head_icon = 2020,
			buy_time = 5,
			act_time = "12月25日-12月31日",
			id = 1,
			rules = "1、活动期间，参与元帅赤犬boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得<div fontcolor=#c23f35>【圣诞币】</div>，更有机会掉落传奇灵碑、高级召唤卷、5星随机碎片、强化训练等珍稀材料！\n2、每日挑战机会<div fontcolor=#c23f35>2次</div>，挑战机会0点重置哦",
			start_time = {
				{
					2021,
					12,
					24
				},
				{
					0,
					0,
					0
				}
			},
			end_time = {
				{
					2021,
					12,
					31
				},
				{
					23,
					59,
					59
				}
			},
			boss_skill_id = {
				918101,
				918201,
				918301,
				918401
			},
			reward = {
				{
					29,
					1
				},
				{
					29905,
					1
				},
				{
					10603,
					1
				},
				{
					37008,
					1
				}
			}
		}
	},
	[49995] = {
		[2] = {
			time = 2,
			camp_id = 49995,
			draw_id = 2,
			boss_id = 97204,
			title_name = "伙伴征集",
			head_icon = 50510,
			buy_time = 5,
			act_time = "11月27日-12月3日",
			id = 2,
			rules = "1、活动期间，参与【伙伴征集】马尔科boss挑战，马尔科将考验玩家是否拥有前往和之国的实力，单场战斗内造成越多伤害，可获得更多奖励，奖励必得积分<div fontcolor=#c23f35>【征战约定】</div>！\n2、<div fontcolor=#c23f35>【征战约定】</div>可以在契约兑换中兑换船长大人喜欢的各种珍稀道具，活动限时，请抓紧时间兑换哦！\n3、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，可以额外钻石购买5次挑战机会（200钻/次），挑战机会0点重置哦",
			start_time = {
				{
					2021,
					11,
					26
				},
				{
					0,
					0,
					0
				}
			},
			end_time = {
				{
					2021,
					12,
					3
				},
				{
					23,
					59,
					59
				}
			},
			boss_skill_id = {
				981101,
				981201,
				981301,
				981401
			},
			reward = {
				{
					80266,
					1
				},
				{
					29905,
					1
				},
				{
					10408,
					1
				},
				{
					10450,
					1
				}
			}
		}
	},
	[50038] = {
		[3] = {
			time = 2,
			camp_id = 50038,
			draw_id = 3,
			boss_id = 97202,
			title_name = "士气作战",
			head_icon = 40508,
			buy_time = 0,
			act_time = "8月16日-8月22日",
			id = 3,
			rules = "1、活动期间，参与战国boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得道具<div fontcolor=#c23f35>【哨子】</div>！更有机会掉落精英召唤卷、5星随机碎片、强化训练等珍稀材料！\n2、<div fontcolor=#c23f35>【哨子】</div>可以在抽奖活动中挖取各种珍稀道具，活动限时，请抓紧时间参与哦！\n3、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，挑战机会0点重置哦",
			start_time = {
				{
					2021,
					9,
					6
				},
				{
					0,
					0,
					0
				}
			},
			end_time = {
				{
					2021,
					9,
					13
				},
				{
					23,
					59,
					59
				}
			},
			boss_skill_id = {
				916101,
				916201,
				916301,
				916401
			},
			reward = {
				{
					37016,
					1
				},
				{
					29905,
					1
				},
				{
					10407,
					1
				},
				{
					10450,
					1
				}
			}
		}
	},
	[50050] = {
		[4] = {
			time = 2,
			camp_id = 50050,
			draw_id = 4,
			boss_id = 97203,
			title_name = "灭世大战",
			head_icon = 40512,
			buy_time = 2,
			act_time = "1月5日-1月11日",
			id = 4,
			rules = "1、活动期间，参与灭世泽法boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得道具<div fontcolor=#c23f35>【流星弹】</div>！\n2、<div fontcolor=#c23f35>【流星弹】</div>可以在元旦活动中燃放焰火，活动限时，请抓紧时间兑换哦！\n3、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，可以额外钻石购买2次挑战机会（200钻/次），挑战机会0点重置哦",
			start_time = {
				{
					2022,
					1,
					4
				},
				{
					0,
					0,
					0
				}
			},
			end_time = {
				{
					2022,
					1,
					11
				},
				{
					23,
					59,
					59
				}
			},
			boss_skill_id = {
				915101,
				915201,
				915301
			},
			reward = {
				{
					80238,
					1
				},
				{
					29905,
					1
				},
				{
					10408,
					1
				},
				{
					10450,
					1
				}
			}
		}
	},
	[40351] = {
		[5] = {
			time = 2,
			camp_id = 40351,
			draw_id = 5,
			boss_id = 97203,
			title_name = "情书争夺战",
			head_icon = 40514,
			buy_time = 2,
			act_time = "6月4日-6月10日",
			id = 5,
			rules = "1、活动期间，参与茶豚boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得道具<div fontcolor=#c23f35>【告白情书】</div>！\n2、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，可以额外钻石购买2次挑战机会（200钻/次），挑战机会0点重置哦",
			start_time = {
				{
					2022,
					6,
					2
				},
				{
					0,
					0,
					0
				}
			},
			end_time = {
				{
					2022,
					6,
					10
				},
				{
					23,
					59,
					59
				}
			},
			boss_skill_id = {
				915101,
				915201,
				915301,
				915401
			},
			reward = {
				{
					37016,
					1
				},
				{
					29905,
					1
				},
				{
					10408,
					1
				},
				{
					10450,
					1
				}
			}
		}
	}
}
Config.HolidayValentineBossData.data_award_list_length = 5
slot2[1] = {
	id = 1,
	min = 61610001,
	box_count = 23,
	max = 75000000
}
Config.HolidayValentineBossData.data_award_list = {
	{
		{
			id = 1,
			min = 75000001,
			box_count = 24,
			max = 95000000
		},
		{
			id = 1,
			min = 50610001,
			box_count = 22,
			max = 61610000
		},
		{
			id = 1,
			min = 40610001,
			box_count = 21,
			max = 50610000
		},
		{
			id = 1,
			min = 31610001,
			box_count = 20,
			max = 40610000
		},
		{
			id = 1,
			min = 24610001,
			box_count = 19,
			max = 31610000
		},
		{
			id = 1,
			min = 18610001,
			box_count = 18,
			max = 24610000
		},
		{
			id = 1,
			min = 13610001,
			box_count = 17,
			max = 18610000
		},
		{
			id = 1,
			min = 9610001,
			box_count = 16,
			max = 13610000
		},
		{
			id = 1,
			min = 6610001,
			box_count = 15,
			max = 9610000
		},
		{
			id = 1,
			min = 4610001,
			box_count = 14,
			max = 6610000
		},
		{
			id = 1,
			min = 3110001,
			box_count = 13,
			max = 4610000
		},
		{
			id = 1,
			min = 2110001,
			box_count = 12,
			max = 3110000
		},
		{
			id = 1,
			min = 1410001,
			box_count = 11,
			max = 2110000
		},
		{
			id = 1,
			min = 910001,
			box_count = 10,
			max = 1410000
		},
		{
			id = 1,
			min = 560001,
			box_count = 9,
			max = 910000
		},
		{
			id = 1,
			min = 310001,
			box_count = 8,
			max = 560000
		},
		{
			id = 1,
			min = 190001,
			box_count = 7,
			max = 310000
		},
		{
			id = 1,
			min = 110001,
			box_count = 6,
			max = 190000
		},
		{
			id = 1,
			min = 60001,
			box_count = 5,
			max = 110000
		},
		{
			id = 1,
			min = 30001,
			box_count = 4,
			max = 60000
		},
		{
			id = 1,
			min = 15001,
			box_count = 3,
			max = 30000
		},
		{
			id = 1,
			min = 5001,
			box_count = 2,
			max = 15000
		},
		{
			id = 1,
			min = 1,
			box_count = 1,
			max = 5000
		}
	},
	{
		{
			id = 2,
			min = 61610001,
			box_count = 21,
			max = 75000000
		},
		{
			id = 2,
			min = 50610001,
			box_count = 20,
			max = 61610000
		},
		{
			id = 2,
			min = 40610001,
			box_count = 19,
			max = 50610000
		},
		{
			id = 2,
			min = 31610001,
			box_count = 18,
			max = 40610000
		},
		{
			id = 2,
			min = 24610001,
			box_count = 17,
			max = 31610000
		},
		{
			id = 2,
			min = 18610001,
			box_count = 16,
			max = 24610000
		},
		{
			id = 2,
			min = 13610001,
			box_count = 15,
			max = 18610000
		},
		{
			id = 2,
			min = 9610001,
			box_count = 14,
			max = 13610000
		},
		{
			id = 2,
			min = 6610001,
			box_count = 13,
			max = 9610000
		},
		{
			id = 2,
			min = 4610001,
			box_count = 12,
			max = 6610000
		},
		{
			id = 2,
			min = 3110001,
			box_count = 11,
			max = 4610000
		},
		{
			id = 2,
			min = 2110001,
			box_count = 10,
			max = 3110000
		},
		{
			id = 2,
			min = 1410001,
			box_count = 9,
			max = 2110000
		},
		{
			id = 2,
			min = 910001,
			box_count = 8,
			max = 1410000
		},
		{
			id = 2,
			min = 560001,
			box_count = 7,
			max = 910000
		},
		{
			id = 2,
			min = 310001,
			box_count = 6,
			max = 560000
		},
		{
			id = 2,
			min = 200001,
			box_count = 5,
			max = 310000
		},
		{
			id = 2,
			min = 140001,
			box_count = 4,
			max = 200000
		},
		{
			id = 2,
			min = 80001,
			box_count = 3,
			max = 140000
		},
		{
			id = 2,
			min = 30001,
			box_count = 2,
			max = 80000
		},
		{
			id = 2,
			min = 1,
			box_count = 1,
			max = 30000
		},
		[2] = {
			id = 2,
			min = 75000001,
			box_count = 22,
			max = 950000000
		}
	},
	{
		{
			id = 3,
			min = 61610001,
			box_count = 21,
			max = 75000000
		},
		{
			id = 3,
			min = 50610001,
			box_count = 20,
			max = 61610000
		},
		{
			id = 3,
			min = 40610001,
			box_count = 19,
			max = 50610000
		},
		{
			id = 3,
			min = 31610001,
			box_count = 18,
			max = 40610000
		},
		{
			id = 3,
			min = 24610001,
			box_count = 17,
			max = 31610000
		},
		{
			id = 3,
			min = 18610001,
			box_count = 16,
			max = 24610000
		},
		{
			id = 3,
			min = 13610001,
			box_count = 15,
			max = 18610000
		},
		{
			id = 3,
			min = 9610001,
			box_count = 14,
			max = 13610000
		},
		{
			id = 3,
			min = 6610001,
			box_count = 13,
			max = 9610000
		},
		{
			id = 3,
			min = 4610001,
			box_count = 12,
			max = 6610000
		},
		{
			id = 3,
			min = 3110001,
			box_count = 11,
			max = 4610000
		},
		{
			id = 3,
			min = 2110001,
			box_count = 10,
			max = 3110000
		},
		{
			id = 3,
			min = 1410001,
			box_count = 9,
			max = 2110000
		},
		{
			id = 3,
			min = 910001,
			box_count = 8,
			max = 1410000
		},
		{
			id = 3,
			min = 560001,
			box_count = 7,
			max = 910000
		},
		{
			id = 3,
			min = 310001,
			box_count = 6,
			max = 560000
		},
		{
			id = 3,
			min = 200001,
			box_count = 5,
			max = 310000
		},
		{
			id = 3,
			min = 140001,
			box_count = 4,
			max = 200000
		},
		{
			id = 3,
			min = 80001,
			box_count = 3,
			max = 140000
		},
		{
			id = 3,
			min = 30001,
			box_count = 2,
			max = 80000
		},
		{
			id = 3,
			min = 1,
			box_count = 1,
			max = 30000
		},
		[3] = {
			id = 3,
			min = 75000001,
			box_count = 22,
			max = 950000000
		}
	},
	{
		{
			id = 4,
			min = 61610001,
			box_count = 21,
			max = 75000000
		},
		{
			id = 4,
			min = 50610001,
			box_count = 20,
			max = 61610000
		},
		{
			id = 4,
			min = 40610001,
			box_count = 19,
			max = 50610000
		},
		{
			id = 4,
			min = 31610001,
			box_count = 18,
			max = 40610000
		},
		{
			id = 4,
			min = 24610001,
			box_count = 17,
			max = 31610000
		},
		{
			id = 4,
			min = 18610001,
			box_count = 16,
			max = 24610000
		},
		{
			id = 4,
			min = 13610001,
			box_count = 15,
			max = 18610000
		},
		{
			id = 4,
			min = 9610001,
			box_count = 14,
			max = 13610000
		},
		{
			id = 4,
			min = 6610001,
			box_count = 13,
			max = 9610000
		},
		{
			id = 4,
			min = 4610001,
			box_count = 12,
			max = 6610000
		},
		{
			id = 4,
			min = 3110001,
			box_count = 11,
			max = 4610000
		},
		{
			id = 4,
			min = 2110001,
			box_count = 10,
			max = 3110000
		},
		{
			id = 4,
			min = 1410001,
			box_count = 9,
			max = 2110000
		},
		{
			id = 4,
			min = 910001,
			box_count = 8,
			max = 1410000
		},
		{
			id = 4,
			min = 560001,
			box_count = 7,
			max = 910000
		},
		{
			id = 4,
			min = 310001,
			box_count = 6,
			max = 560000
		},
		{
			id = 4,
			min = 200001,
			box_count = 5,
			max = 310000
		},
		{
			id = 4,
			min = 140001,
			box_count = 4,
			max = 200000
		},
		{
			id = 4,
			min = 80001,
			box_count = 3,
			max = 140000
		},
		{
			id = 4,
			min = 30001,
			box_count = 2,
			max = 80000
		},
		{
			id = 4,
			min = 1,
			box_count = 1,
			max = 30000
		},
		[4] = {
			id = 4,
			min = 75000001,
			box_count = 22,
			max = 950000000
		}
	},
	{
		{
			id = 5,
			min = 61610001,
			box_count = 21,
			max = 75000000
		},
		{
			id = 5,
			min = 50610001,
			box_count = 20,
			max = 61610000
		},
		{
			id = 5,
			min = 40610001,
			box_count = 19,
			max = 50610000
		},
		{
			id = 5,
			min = 31610001,
			box_count = 18,
			max = 40610000
		},
		{
			id = 5,
			min = 24610001,
			box_count = 17,
			max = 31610000
		},
		{
			id = 5,
			min = 18610001,
			box_count = 16,
			max = 24610000
		},
		{
			id = 5,
			min = 13610001,
			box_count = 15,
			max = 18610000
		},
		{
			id = 5,
			min = 9610001,
			box_count = 14,
			max = 13610000
		},
		{
			id = 5,
			min = 6610001,
			box_count = 13,
			max = 9610000
		},
		{
			id = 5,
			min = 4610001,
			box_count = 12,
			max = 6610000
		},
		{
			id = 5,
			min = 3110001,
			box_count = 11,
			max = 4610000
		},
		{
			id = 5,
			min = 2110001,
			box_count = 10,
			max = 3110000
		},
		{
			id = 5,
			min = 1410001,
			box_count = 9,
			max = 2110000
		},
		{
			id = 5,
			min = 910001,
			box_count = 8,
			max = 1410000
		},
		{
			id = 5,
			min = 560001,
			box_count = 7,
			max = 910000
		},
		{
			id = 5,
			min = 310001,
			box_count = 6,
			max = 560000
		},
		{
			id = 5,
			min = 200001,
			box_count = 5,
			max = 310000
		},
		{
			id = 5,
			min = 140001,
			box_count = 4,
			max = 200000
		},
		{
			id = 5,
			min = 80001,
			box_count = 3,
			max = 140000
		},
		{
			id = 5,
			min = 30001,
			box_count = 2,
			max = 80000
		},
		{
			id = 5,
			min = 1,
			box_count = 1,
			max = 30000
		},
		[5] = {
			id = 5,
			min = 75000001,
			box_count = 22,
			max = 950000000
		}
	}
}
