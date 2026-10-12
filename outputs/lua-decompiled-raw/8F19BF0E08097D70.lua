Config = Config or {}
Config.HolidayTermBeginsData = Config.HolidayTermBeginsData or {}
Config.HolidayTermBeginsData.data_const_length = 16
Config.HolidayTermBeginsData.data_const = {
	action_time = {
		val = 1,
		desc = "10月17日-10月30日"
	},
	action_pre_reward = {
		desc = "初始界面活动奖励",
		val = {
			{
				80234,
				1
			},
			{
				29905,
				1
			},
			{
				35,
				1
			},
			{
				25,
				1
			}
		}
	},
	action_num_espensive = {
		desc = "关卡次数购买钻石价格",
		val = {
			3,
			100
		}
	},
	free_fight_count = {
		val = 2,
		desc = "关卡每日免费挑战次数"
	},
	limit_buy_count = {
		val = 6,
		desc = "关卡每日限购次数"
	},
	entrance_exam_cost = {
		desc = "准考证消耗",
		val = {
			3,
			100
		}
	},
	boss_fight_cost = {
		desc = "boss挑战消耗",
		val = {
			80233,
			1
		}
	},
	collection_quantity = {
		val = 113750,
		desc = "收集数量上限"
	},
	damage = {
		val = 5,
		desc = "收集buff倍率"
	},
	buff_name = {
		val = "dam",
		desc = "收集buff"
	},
	collection_buff = {
		val = 3080,
		desc = "收集伤害buff图标"
	},
	collection_damage_tips = {
		val = 1,
		desc = "提交满分试卷可以增长进度，进度每增长1%为全服玩家提供5%伤害"
	},
	boss_descreption = {
		val = 1,
		desc = [[
1.开学季活动每七天为一轮，后两天开放世界boss挑战。
2.玩家可以在世界boss页面提交收集到的满分试卷，提交满分试卷会增长进度条的进度，根据玩家提交的数量会在世界boss阶段为所有玩家提供伤害加成。
3.提交满分试卷，参与并击败世界boss均可获得丰厚奖励。
4.挑战世界boss需要消耗“准考证”，当道具数量不足时，可以直接消耗钻石进行挑战。
5.当玩家参与人数不足100时，按照参与人数100来发放排名奖励。
6.boss挑战于9月11日23:30结束，请合理安排时间。]]
	},
	level_descreption = {
		val = 1,
		desc = [[
1.开学季活动每七天为一轮，后两天开放世界boss挑战。
2.关卡挑战中，挑战任何一个关卡无论是否失败，都会消耗一次挑战次数
3.每次挑战关卡结束后，关卡怪物的剩余血量将被保留至下一次挑战。
4.通关每一个关卡都可以获得数量不等的满分试卷。
5.玩家可以在世界boss页面提交收集到的满分试卷，提交满分试卷会增长进度条的进度，根据玩家提交的数量会在世界boss阶段为所有玩家提供伤害加成。
6.玩家每天拥有2次免费挑战的机会，也可以使用钻石购买挑战次数，日限6次。
7.关卡挑战于2019年9月11日23:30结束，请合理安排时间。]]
	},
	paper_item_id = {
		val = 80232,
		desc = "试卷id"
	},
	ticket_item_id = {
		val = 80233,
		desc = "准考证id"
	}
}

function Config.HolidayTermBeginsData.data_const_fun(slot0)
	slot1 = Config.HolidayTermBeginsData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayTermBeginsData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayTermBeginsData.data_round_info_length = 2
Config.HolidayTermBeginsData.data_round_info = {
	{
		boss_round = 1,
		unit_round = 1,
		action_time = "8月31日-9月5日",
		round = 1,
		start_time = {
			2021,
			8,
			31,
			0,
			0,
			0
		},
		end_time = {
			2021,
			9,
			5,
			23,
			59,
			59
		}
	},
	{
		boss_round = 2,
		unit_round = 2,
		action_time = "9月6日-9月11日",
		round = 2,
		start_time = {
			2021,
			9,
			6,
			0,
			0,
			0
		},
		end_time = {
			2021,
			9,
			11,
			23,
			59,
			59
		}
	}
}

function Config.HolidayTermBeginsData.data_round_info_fun(slot0)
	slot1 = Config.HolidayTermBeginsData.data_round_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayTermBeginsData.data_round_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayTermBeginsData.data_chapter_info_length = 2
Config.HolidayTermBeginsData.data_chapter_info = {
	{
		{
			{
				unit_id = 89307,
				unit_round = 1,
				type = 1,
				order_name = "意志训练",
				order_res = "1",
				order_id = 1,
				power = 143287,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						10
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			{
				unit_id = 89308,
				unit_round = 1,
				type = 1,
				order_name = "素质训练",
				order_res = "2",
				order_id = 2,
				power = 146899,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						11
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			{
				unit_id = 89309,
				unit_round = 1,
				type = 1,
				order_name = "体能训练",
				order_res = "3",
				order_id = 3,
				power = 149466,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						12
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			{
				unit_id = 89310,
				unit_round = 1,
				type = 1,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 4,
				power = 152756,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						13
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			{
				unit_id = 89311,
				unit_round = 1,
				type = 1,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 5,
				power = 155421,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						14
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		},
		{
			[6] = {
				unit_id = 89312,
				unit_round = 1,
				type = 2,
				order_name = "意志训练",
				order_res = "1",
				order_id = 6,
				power = 202850,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						20
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			[7] = {
				unit_id = 89313,
				unit_round = 1,
				type = 2,
				order_name = "素质训练",
				order_res = "2",
				order_id = 7,
				power = 204850,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						21
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			[8] = {
				unit_id = 89314,
				unit_round = 1,
				type = 2,
				order_name = "体能训练",
				order_res = "3",
				order_id = 8,
				power = 206950,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						22
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			[9] = {
				unit_id = 89315,
				unit_round = 1,
				type = 2,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 9,
				power = 208430,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						23
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			[10] = {
				unit_id = 89316,
				unit_round = 1,
				type = 2,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 10,
				power = 210774,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						24
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		},
		{
			[11] = {
				unit_id = 89317,
				unit_round = 1,
				type = 3,
				order_name = "意志训练",
				order_res = "1",
				order_id = 11,
				power = 362794,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						30
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			[12] = {
				unit_id = 89318,
				unit_round = 1,
				type = 3,
				order_name = "素质训练",
				order_res = "2",
				order_id = 12,
				power = 395776,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						31
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			[13] = {
				unit_id = 89319,
				unit_round = 1,
				type = 3,
				order_name = "体能训练",
				order_res = "3",
				order_id = 13,
				power = 494720,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						32
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			[14] = {
				unit_id = 89320,
				unit_round = 1,
				type = 3,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 14,
				power = 593317,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						33
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			[15] = {
				unit_id = 89321,
				unit_round = 1,
				type = 3,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 15,
				power = 809069,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						34
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		},
		{
			[16] = {
				unit_id = 89322,
				unit_round = 1,
				type = 4,
				order_name = "意志训练",
				order_res = "1",
				order_id = 16,
				power = 1364208,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						40
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			[17] = {
				unit_id = 89323,
				unit_round = 1,
				type = 4,
				order_name = "素质训练",
				order_res = "2",
				order_id = 17,
				power = 1488227,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						41
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			[18] = {
				unit_id = 89324,
				unit_round = 1,
				type = 4,
				order_name = "体能训练",
				order_res = "3",
				order_id = 18,
				power = 1533972,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						42
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			[19] = {
				unit_id = 89325,
				unit_round = 1,
				type = 4,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 19,
				power = 2267611,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						43
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			[20] = {
				unit_id = 89326,
				unit_round = 1,
				type = 4,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 20,
				power = 2748339,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						44
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		}
	},
	{
		{
			{
				unit_id = 89359,
				unit_round = 2,
				type = 1,
				order_name = "意志训练",
				order_res = "1",
				order_id = 1,
				power = 143287,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						10
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			{
				unit_id = 89360,
				unit_round = 2,
				type = 1,
				order_name = "素质训练",
				order_res = "2",
				order_id = 2,
				power = 146899,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						11
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			{
				unit_id = 89361,
				unit_round = 2,
				type = 1,
				order_name = "体能训练",
				order_res = "3",
				order_id = 3,
				power = 149466,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						12
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			{
				unit_id = 89362,
				unit_round = 2,
				type = 1,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 4,
				power = 152756,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						13
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			{
				unit_id = 89363,
				unit_round = 2,
				type = 1,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 5,
				power = 155421,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						14
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		},
		{
			[6] = {
				unit_id = 89364,
				unit_round = 2,
				type = 2,
				order_name = "意志训练",
				order_res = "1",
				order_id = 6,
				power = 202850,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						20
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			[7] = {
				unit_id = 89365,
				unit_round = 2,
				type = 2,
				order_name = "素质训练",
				order_res = "2",
				order_id = 7,
				power = 204850,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						21
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			[8] = {
				unit_id = 89366,
				unit_round = 2,
				type = 2,
				order_name = "体能训练",
				order_res = "3",
				order_id = 8,
				power = 206950,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						22
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			[9] = {
				unit_id = 89367,
				unit_round = 2,
				type = 2,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 9,
				power = 208430,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						23
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			[10] = {
				unit_id = 89368,
				unit_round = 2,
				type = 2,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 10,
				power = 210774,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						24
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		},
		{
			[11] = {
				unit_id = 89369,
				unit_round = 2,
				type = 3,
				order_name = "意志训练",
				order_res = "1",
				order_id = 11,
				power = 362794,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						30
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			[12] = {
				unit_id = 89370,
				unit_round = 2,
				type = 3,
				order_name = "素质训练",
				order_res = "2",
				order_id = 12,
				power = 395776,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						31
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			[13] = {
				unit_id = 89371,
				unit_round = 2,
				type = 3,
				order_name = "体能训练",
				order_res = "3",
				order_id = 13,
				power = 494720,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						32
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			[14] = {
				unit_id = 89372,
				unit_round = 2,
				type = 3,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 14,
				power = 593317,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						33
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			[15] = {
				unit_id = 89373,
				unit_round = 2,
				type = 3,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 15,
				power = 809069,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						34
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		},
		{
			[16] = {
				unit_id = 89374,
				unit_round = 2,
				type = 4,
				order_name = "意志训练",
				order_res = "1",
				order_id = 16,
				power = 1364208,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						40
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"敌方被控制时会增加100%所受伤害",
					"海军伤害提升100%"
				}
			},
			[17] = {
				unit_id = 89375,
				unit_round = 2,
				type = 4,
				order_name = "素质训练",
				order_res = "2",
				order_id = 17,
				power = 1488227,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						41
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"生命高于90%时伤害增加150%",
					"每回合受到最大生命8%的伤害",
					"五皇团伤害提升100%"
				}
			},
			[18] = {
				unit_id = 89376,
				unit_round = 2,
				type = 4,
				order_name = "体能训练",
				order_res = "3",
				order_id = 18,
				power = 1533972,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						42
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"战士伤害提升100%",
					"草帽团伤害提升100%"
				}
			},
			[19] = {
				unit_id = 89377,
				unit_round = 2,
				type = 4,
				order_name = "医疗训练",
				order_res = "4",
				order_id = 19,
				power = 2267611,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						43
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"我方治疗效果造成等量伤害",
					"强者伤害提升100%"
				}
			},
			[20] = {
				unit_id = 89378,
				unit_round = 2,
				type = 4,
				order_name = "智慧训练",
				order_res = "5",
				order_id = 20,
				power = 2748339,
				hit_award = {
					{
						80233,
						1
					},
					{
						80232,
						44
					},
					{
						25,
						100
					}
				},
				add_skill_decs = {
					"法师伤害提升100%",
					"超新星伤害提升100%"
				}
			}
		}
	}
}
Config.HolidayTermBeginsData.data_max_chapter_id_length = 2
Config.HolidayTermBeginsData.data_max_chapter_id = {
	[1.0] = 20,
	[2.0] = 20
}
Config.HolidayTermBeginsData.data_max_diff_length = 2
Config.HolidayTermBeginsData.data_max_diff = {
	[1.0] = 4,
	[2.0] = 4
}
Config.HolidayTermBeginsData.data_boss_info_length = 2
Config.HolidayTermBeginsData.data_boss_info = {
	{
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 1,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 2,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 3,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 4,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 5,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 6,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 7,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 8,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 9,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 10,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 11,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 12,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 13,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 14,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 15,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 16,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 17,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 18,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 19,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 20,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 21,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 22,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 23,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 24,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 25,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 26,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 27,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 28,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 29,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 30,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 1,
			boss_name = "海军试炼·黄猿",
			unit_id = 89327,
			boss_id = 31,
			hit_award = {
				{
					80234,
					8
				}
			}
		}
	},
	{
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 1,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 2,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 3,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 4,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 5,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 6,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 7,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 8,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 9,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 10,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 11,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 12,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 13,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 14,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 15,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 16,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 17,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 18,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 19,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 20,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 21,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 22,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 23,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 24,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 25,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 26,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 27,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 28,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 29,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 30,
			hit_award = {
				{
					80234,
					8
				}
			}
		},
		{
			boss_round = 2,
			boss_name = "海军试炼·赤犬",
			unit_id = 89358,
			boss_id = 31,
			hit_award = {
				{
					80234,
					8
				}
			}
		}
	}
}
Config.HolidayTermBeginsData.data_cellect_reward_info_length = 3
Config.HolidayTermBeginsData.data_cellect_reward_info = {
	{
		id = 1,
		res = "termbeginsreward_02",
		count = 170,
		award = {
			{
				80234,
				1
			},
			{
				35,
				1
			},
			{
				25,
				1000
			}
		}
	},
	{
		id = 2,
		res = "termbeginsreward_03",
		count = 330,
		award = {
			{
				80234,
				3
			},
			{
				35,
				1
			},
			{
				25,
				2000
			}
		}
	},
	{
		id = 3,
		res = "termbeginsreward_04",
		count = 490,
		award = {
			{
				80234,
				5
			},
			{
				35,
				2
			},
			{
				25,
				5000
			}
		}
	}
}
Config.HolidayTermBeginsData.data_rank_reward_length = 7
Config.HolidayTermBeginsData.data_rank_reward = {
	{
		rank1 = 0,
		rank2 = 1,
		award = {
			{
				3,
				1000
			},
			{
				35,
				10
			},
			{
				50016,
				1
			}
		}
	},
	{
		rank1 = 1,
		rank2 = 5,
		award = {
			{
				3,
				800
			},
			{
				35,
				8
			},
			{
				50017,
				1
			}
		}
	},
	{
		rank1 = 5,
		rank2 = 10,
		award = {
			{
				3,
				500
			},
			{
				35,
				5
			},
			{
				50018,
				1
			}
		}
	},
	{
		rank1 = 10,
		rank2 = 20,
		award = {
			{
				3,
				200
			},
			{
				35,
				3
			}
		}
	},
	{
		rank1 = 20,
		rank2 = 50,
		award = {
			{
				3,
				150
			},
			{
				35,
				2
			}
		}
	},
	{
		rank1 = 50,
		rank2 = 80,
		award = {
			{
				3,
				100
			},
			{
				35,
				1
			}
		}
	},
	{
		rank1 = 80,
		rank2 = 100,
		award = {
			{
				3,
				50
			}
		}
	}
}
Config.HolidayTermBeginsData.data_explain_length = 0
Config.HolidayTermBeginsData.data_explain = {}

function Config.HolidayTermBeginsData.data_explain_fun(slot0)
	slot1 = Config.HolidayTermBeginsData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayTermBeginsData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
