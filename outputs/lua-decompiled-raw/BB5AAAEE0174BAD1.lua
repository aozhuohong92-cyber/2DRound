Config = Config or {}
Config.DayGoalsNewData = Config.DayGoalsNewData or {}
Config.DayGoalsNewData.data_constant_length = 2
Config.DayGoalsNewData.data_constant = {
	tips = {
		val = 1,
		label = "tips",
		desc = "1.船长可以通过完成日记中的各项任务获取冒险阅历经验，提升日记等级可以获得奖励；\n2.每日任务进行每日轮换，0点刷新；\n3.累充任务是七天累计金额，不作每日刷新"
	},
	tips_1 = {
		val = 1,
		label = "tips_1",
		desc = "1.船长可以通过完成魔盒中的每日任务获取希望印记，积攒一定数量的希望印记可以解锁魔盒，获得奖励；\n2.每日任务进行每日轮换，0点刷新；\n3.累充任务是七天累计金额，不作每日刷新"
	}
}

function Config.DayGoalsNewData.data_constant_fun(slot0)
	slot1 = Config.DayGoalsNewData.data_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.DayGoalsNewData.data_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.DayGoalsNewData.data_make_lev_list_length = 10
Config.DayGoalsNewData.data_make_lev_list = {
	[2] = {
		{
			lev = 1,
			title_name = "冒险日记达到1级",
			period = 2,
			exp = 0,
			reward = {
				{
					10403,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 2,
			title_name = "冒险日记达到2级",
			period = 2,
			exp = 70,
			reward = {
				{
					10403,
					2
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 3,
			title_name = "冒险日记达到3级",
			period = 2,
			exp = 140,
			reward = {
				{
					38080,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 4,
			title_name = "冒险日记达到4级",
			period = 2,
			exp = 200,
			reward = {
				{
					38081,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 5,
			title_name = "冒险日记达到5级",
			period = 2,
			exp = 270,
			reward = {
				{
					37002,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 6,
			title_name = "冒险日记达到6级",
			period = 2,
			exp = 330,
			reward = {
				{
					3,
					2000
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 7,
			title_name = "冒险日记达到7级",
			period = 2,
			exp = 390,
			reward = {
				{
					14001,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 8,
			title_name = "冒险日记达到8级",
			period = 2,
			exp = 450,
			reward = {
				{
					24908,
					50
				},
				{
					37001,
					5
				}
			}
		}
	},
	[3] = {
		{
			lev = 1,
			title_name = "解锁普通魔盒（积攒50个希望印记）",
			period = 3,
			exp = 50,
			reward = {
				{
					10403,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 2,
			title_name = "解锁幸运魔盒（积攒100个希望印记）",
			period = 3,
			exp = 100,
			reward = {
				{
					10403,
					2
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 3,
			title_name = "解锁高级魔盒（积攒150个希望印记）",
			period = 3,
			exp = 150,
			reward = {
				{
					37002,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 4,
			title_name = "解锁豪华魔盒（积攒200个希望印记）",
			period = 3,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 5,
			title_name = "解锁月亮魔盒（积攒250个希望印记）",
			period = 3,
			exp = 250,
			reward = {
				{
					3,
					2000
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 6,
			title_name = "解锁彩虹魔盒（积攒300个希望印记）",
			period = 3,
			exp = 300,
			reward = {
				{
					14001,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 7,
			title_name = "解锁希望魔盒（积攒350个希望印记）",
			period = 3,
			exp = 350,
			reward = {
				{
					26902,
					50
				},
				{
					10450,
					200
				}
			}
		}
	},
	[5] = {
		{
			lev = 1,
			title_name = "冒险日记达到1级",
			period = 5,
			exp = 0,
			reward = {
				{
					10403,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 2,
			title_name = "冒险日记达到2级",
			period = 5,
			exp = 70,
			reward = {
				{
					10403,
					2
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 3,
			title_name = "冒险日记达到3级",
			period = 5,
			exp = 140,
			reward = {
				{
					38081,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 4,
			title_name = "冒险日记达到4级",
			period = 5,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 5,
			title_name = "冒险日记达到5级",
			period = 5,
			exp = 270,
			reward = {
				{
					37002,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 6,
			title_name = "冒险日记达到6级",
			period = 5,
			exp = 330,
			reward = {
				{
					3,
					2000
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 7,
			title_name = "冒险日记达到7级",
			period = 5,
			exp = 390,
			reward = {
				{
					14001,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 8,
			title_name = "冒险日记达到8级",
			period = 5,
			exp = 450,
			reward = {
				{
					24903,
					50
				},
				{
					72001,
					10
				}
			}
		}
	},
	[6] = {
		{
			lev = 1,
			title_name = "解锁普通魔盒（积攒50个希望印记）",
			period = 6,
			exp = 50,
			reward = {
				{
					10403,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 2,
			title_name = "解锁幸运魔盒（积攒100个希望印记）",
			period = 6,
			exp = 100,
			reward = {
				{
					10403,
					2
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 3,
			title_name = "解锁高级魔盒（积攒150个希望印记）",
			period = 6,
			exp = 150,
			reward = {
				{
					37002,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 4,
			title_name = "解锁豪华魔盒（积攒200个希望印记）",
			period = 6,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 5,
			title_name = "解锁月亮魔盒（积攒250个希望印记）",
			period = 6,
			exp = 250,
			reward = {
				{
					3,
					2000
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 6,
			title_name = "解锁彩虹魔盒（积攒300个希望印记）",
			period = 6,
			exp = 300,
			reward = {
				{
					14001,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 7,
			title_name = "解锁希望魔盒（积攒350个希望印记）",
			period = 6,
			exp = 350,
			reward = {
				{
					25902,
					50
				},
				{
					10450,
					200
				}
			}
		}
	},
	[8] = {
		{
			lev = 1,
			title_name = "冒险日记达到1级",
			period = 8,
			exp = 0,
			reward = {
				{
					10403,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 2,
			title_name = "冒险日记达到2级",
			period = 8,
			exp = 70,
			reward = {
				{
					10403,
					2
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 3,
			title_name = "冒险日记达到3级",
			period = 8,
			exp = 140,
			reward = {
				{
					38080,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 4,
			title_name = "冒险日记达到4级",
			period = 8,
			exp = 200,
			reward = {
				{
					38081,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 5,
			title_name = "冒险日记达到5级",
			period = 8,
			exp = 270,
			reward = {
				{
					37002,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 6,
			title_name = "冒险日记达到6级",
			period = 8,
			exp = 330,
			reward = {
				{
					3,
					2000
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 7,
			title_name = "冒险日记达到7级",
			period = 8,
			exp = 390,
			reward = {
				{
					14001,
					1
				},
				{
					37001,
					5
				}
			}
		},
		{
			lev = 8,
			title_name = "冒险日记达到8级",
			period = 8,
			exp = 450,
			reward = {
				{
					26905,
					50
				},
				{
					37001,
					5
				}
			}
		}
	},
	[9] = {
		{
			lev = 1,
			title_name = "解锁普通魔盒（积攒50个希望印记）",
			period = 9,
			exp = 50,
			reward = {
				{
					10403,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 2,
			title_name = "解锁幸运魔盒（积攒100个希望印记）",
			period = 9,
			exp = 100,
			reward = {
				{
					10403,
					2
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 3,
			title_name = "解锁高级魔盒（积攒150个希望印记）",
			period = 9,
			exp = 150,
			reward = {
				{
					37002,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 4,
			title_name = "解锁豪华魔盒（积攒200个希望印记）",
			period = 9,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 5,
			title_name = "解锁月亮魔盒（积攒250个希望印记）",
			period = 9,
			exp = 250,
			reward = {
				{
					3,
					2000
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 6,
			title_name = "解锁彩虹魔盒（积攒300个希望印记）",
			period = 9,
			exp = 300,
			reward = {
				{
					14001,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 7,
			title_name = "解锁希望魔盒（积攒350个希望印记）",
			period = 9,
			exp = 350,
			reward = {
				{
					24905,
					50
				},
				{
					10450,
					200
				}
			}
		}
	},
	[10] = {
		{
			lev = 1,
			title_name = "冒险日记达到1级",
			period = 10,
			exp = 0,
			reward = {
				{
					10403,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 2,
			title_name = "冒险日记达到2级",
			period = 10,
			exp = 70,
			reward = {
				{
					10403,
					2
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 3,
			title_name = "冒险日记达到3级",
			period = 10,
			exp = 140,
			reward = {
				{
					38081,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 4,
			title_name = "冒险日记达到4级",
			period = 10,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 5,
			title_name = "冒险日记达到5级",
			period = 10,
			exp = 270,
			reward = {
				{
					37002,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 6,
			title_name = "冒险日记达到6级",
			period = 10,
			exp = 330,
			reward = {
				{
					3,
					2000
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 7,
			title_name = "冒险日记达到7级",
			period = 10,
			exp = 390,
			reward = {
				{
					14001,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 8,
			title_name = "冒险日记达到8级",
			period = 10,
			exp = 450,
			reward = {
				{
					25905,
					50
				},
				{
					72001,
					10
				}
			}
		}
	},
	[11] = {
		{
			lev = 1,
			title_name = "解锁普通魔盒（积攒50个希望印记）",
			period = 11,
			exp = 50,
			reward = {
				{
					10403,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 2,
			title_name = "解锁幸运魔盒（积攒100个希望印记）",
			period = 11,
			exp = 100,
			reward = {
				{
					10403,
					2
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 3,
			title_name = "解锁高级魔盒（积攒150个希望印记）",
			period = 11,
			exp = 150,
			reward = {
				{
					37002,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 4,
			title_name = "解锁豪华魔盒（积攒200个希望印记）",
			period = 11,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 5,
			title_name = "解锁月亮魔盒（积攒250个希望印记）",
			period = 11,
			exp = 250,
			reward = {
				{
					3,
					2000
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 6,
			title_name = "解锁彩虹魔盒（积攒300个希望印记）",
			period = 11,
			exp = 300,
			reward = {
				{
					14001,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 7,
			title_name = "解锁希望魔盒（积攒350个希望印记）",
			period = 11,
			exp = 350,
			reward = {
				{
					26904,
					50
				},
				{
					10450,
					200
				}
			}
		}
	},
	[12] = {
		{
			lev = 1,
			title_name = "冒险日记达到1级",
			period = 12,
			exp = 0,
			reward = {
				{
					10403,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 2,
			title_name = "冒险日记达到2级",
			period = 12,
			exp = 70,
			reward = {
				{
					10403,
					2
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 3,
			title_name = "冒险日记达到3级",
			period = 12,
			exp = 140,
			reward = {
				{
					38081,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 4,
			title_name = "冒险日记达到4级",
			period = 12,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 5,
			title_name = "冒险日记达到5级",
			period = 12,
			exp = 270,
			reward = {
				{
					37002,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 6,
			title_name = "冒险日记达到6级",
			period = 12,
			exp = 330,
			reward = {
				{
					3,
					2000
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 7,
			title_name = "冒险日记达到7级",
			period = 12,
			exp = 390,
			reward = {
				{
					14001,
					1
				},
				{
					72001,
					10
				}
			}
		},
		{
			lev = 8,
			title_name = "冒险日记达到8级",
			period = 12,
			exp = 450,
			reward = {
				{
					24907,
					50
				},
				{
					72001,
					10
				}
			}
		}
	},
	[13] = {
		{
			lev = 1,
			title_name = "解锁普通魔盒（积攒50个希望印记）",
			period = 13,
			exp = 50,
			reward = {
				{
					10403,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 2,
			title_name = "解锁幸运魔盒（积攒100个希望印记）",
			period = 13,
			exp = 100,
			reward = {
				{
					10403,
					2
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 3,
			title_name = "解锁高级魔盒（积攒150个希望印记）",
			period = 13,
			exp = 150,
			reward = {
				{
					37002,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 4,
			title_name = "解锁豪华魔盒（积攒200个希望印记）",
			period = 13,
			exp = 200,
			reward = {
				{
					38091,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 5,
			title_name = "解锁月亮魔盒（积攒250个希望印记）",
			period = 13,
			exp = 250,
			reward = {
				{
					3,
					2000
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 6,
			title_name = "解锁彩虹魔盒（积攒300个希望印记）",
			period = 13,
			exp = 300,
			reward = {
				{
					14001,
					1
				},
				{
					10450,
					200
				}
			}
		},
		{
			lev = 7,
			title_name = "解锁希望魔盒（积攒350个希望印记）",
			period = 13,
			exp = 350,
			reward = {
				{
					24908,
					50
				},
				{
					10450,
					200
				}
			}
		}
	}
}
Config.DayGoalsNewData.data_circle_exp_item_length = 10
Config.DayGoalsNewData.data_circle_exp_item = {
	[2] = {
		item_id = 80212
	},
	[3] = {
		item_id = 80214
	},
	[5] = {
		item_id = 80213
	},
	[6] = {
		item_id = 80215
	},
	[8] = {
		item_id = 80216
	},
	[9] = {
		item_id = 80217
	},
	[10] = {
		item_id = 80218
	},
	[11] = {
		item_id = 80219
	},
	[12] = {
		item_id = 80220
	},
	[13] = {
		item_id = 80222
	}
}
Config.DayGoalsNewData.data_group_list_length = 10
Config.DayGoalsNewData.data_group_list = {
	[2] = {
		[211] = {
			goal_id = 211,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[212] = {
			goal_id = 212,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80212,
					10
				}
			}
		},
		[213] = {
			goal_id = 213,
			show_icon = 126,
			desc = "冒险远航：接取一次紫色及以上远航订单",
			award = {
				{
					80212,
					10
				}
			}
		},
		[214] = {
			goal_id = 214,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80212,
					10
				}
			}
		},
		[215] = {
			goal_id = 215,
			show_icon = 132,
			desc = "速战勇者：快速作战四次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[216] = {
			goal_id = 216,
			show_icon = 154,
			desc = "装备锻造：合成3件装备",
			award = {
				{
					80212,
					10
				}
			}
		},
		[217] = {
			goal_id = 217,
			show_icon = 204,
			desc = "领地招募：参与1次伟大召唤处召唤",
			award = {
				{
					80212,
					15
				}
			}
		},
		[221] = {
			goal_id = 221,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[222] = {
			goal_id = 222,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[223] = {
			goal_id = 223,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80212,
					10
				}
			}
		},
		[224] = {
			goal_id = 224,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[9901] = {
			goal_id = 9901,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80212,
					10
				}
			}
		},
		[226] = {
			goal_id = 226,
			show_icon = 408,
			desc = "战技锻造：合成1次战技",
			award = {
				{
					80212,
					10
				}
			}
		},
		[227] = {
			goal_id = 227,
			show_icon = 120,
			desc = "伙伴招募：高级召唤3次",
			award = {
				{
					80212,
					15
				}
			}
		},
		[231] = {
			goal_id = 231,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[232] = {
			goal_id = 232,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80212,
					10
				}
			}
		},
		[233] = {
			goal_id = 233,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[234] = {
			goal_id = 234,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80212,
					10
				}
			}
		},
		[235] = {
			goal_id = 235,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80212,
					10
				}
			}
		},
		[236] = {
			goal_id = 236,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80212,
					10
				}
			}
		},
		[237] = {
			goal_id = 237,
			show_icon = 120,
			desc = "英雄荣耀：获得1个5星英雄",
			award = {
				{
					80212,
					15
				}
			}
		},
		[241] = {
			goal_id = 241,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[242] = {
			goal_id = 242,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80212,
					10
				}
			}
		},
		[243] = {
			goal_id = 243,
			show_icon = 126,
			desc = "冒险远航：接取一次紫色及以上远航订单",
			award = {
				{
					80212,
					10
				}
			}
		},
		[244] = {
			goal_id = 244,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[9902] = {
			goal_id = 9902,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80212,
					10
				}
			}
		},
		[246] = {
			goal_id = 246,
			show_icon = 154,
			desc = "装备锻造：合成3件装备",
			award = {
				{
					80212,
					10
				}
			}
		},
		[247] = {
			goal_id = 247,
			show_icon = 132,
			desc = "速战勇者：快速作战五次",
			award = {
				{
					80212,
					15
				}
			}
		},
		[251] = {
			goal_id = 251,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[252] = {
			goal_id = 252,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[253] = {
			goal_id = 253,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80212,
					10
				}
			}
		},
		[254] = {
			goal_id = 254,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80212,
					10
				}
			}
		},
		[255] = {
			goal_id = 255,
			show_icon = 132,
			desc = "速战勇者：快速作战四次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[256] = {
			goal_id = 256,
			show_icon = 408,
			desc = "战技锻造：合成1次战技",
			award = {
				{
					80212,
					10
				}
			}
		},
		[257] = {
			goal_id = 257,
			show_icon = 120,
			desc = "伙伴招募：高级召唤3次",
			award = {
				{
					80212,
					15
				}
			}
		},
		[261] = {
			goal_id = 261,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[262] = {
			goal_id = 262,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80212,
					10
				}
			}
		},
		[263] = {
			goal_id = 263,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[264] = {
			goal_id = 264,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[9903] = {
			goal_id = 9903,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80212,
					10
				}
			}
		},
		[266] = {
			goal_id = 266,
			show_icon = 154,
			desc = "装备锻造：合成3件装备",
			award = {
				{
					80212,
					10
				}
			}
		},
		[267] = {
			goal_id = 267,
			show_icon = 120,
			desc = "英雄荣耀：获得1个5星英雄",
			award = {
				{
					80212,
					15
				}
			}
		},
		[271] = {
			goal_id = 271,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80212,
					10
				}
			}
		},
		[272] = {
			goal_id = 272,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80212,
					10
				}
			}
		},
		[273] = {
			goal_id = 273,
			show_icon = 126,
			desc = "冒险远航：接取一次紫色及以上远航订单",
			award = {
				{
					80212,
					10
				}
			}
		},
		[274] = {
			goal_id = 274,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80212,
					10
				}
			}
		},
		[275] = {
			goal_id = 275,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80212,
					10
				}
			}
		},
		[276] = {
			goal_id = 276,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80212,
					10
				}
			}
		},
		[277] = {
			goal_id = 277,
			show_icon = 132,
			desc = "速战勇者：快速作战五次",
			award = {
				{
					80212,
					15
				}
			}
		}
	},
	[3] = {
		[311] = {
			goal_id = 311,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[312] = {
			goal_id = 312,
			show_icon = 158,
			desc = "挑战5次竞技场",
			award = {
				{
					80214,
					10
				}
			}
		},
		[313] = {
			goal_id = 313,
			show_icon = 126,
			desc = "紫色订单远航一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[314] = {
			goal_id = 314,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80214,
					10
				}
			}
		},
		[315] = {
			goal_id = 315,
			show_icon = 132,
			desc = "快速作战四次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[316] = {
			goal_id = 316,
			show_icon = 204,
			desc = "参与1次伟大召唤",
			award = {
				{
					80214,
					10
				}
			}
		},
		[321] = {
			goal_id = 321,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[322] = {
			goal_id = 322,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[323] = {
			goal_id = 323,
			show_icon = 146,
			desc = "挑战公会boss3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[9904] = {
			goal_id = 9904,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80214,
					10
				}
			}
		},
		[325] = {
			goal_id = 325,
			show_icon = 408,
			desc = "合成1次战技",
			award = {
				{
					80214,
					10
				}
			}
		},
		[326] = {
			goal_id = 326,
			show_icon = 120,
			desc = "高级召唤3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[331] = {
			goal_id = 331,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[332] = {
			goal_id = 332,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80214,
					10
				}
			}
		},
		[333] = {
			goal_id = 333,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[334] = {
			goal_id = 334,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80214,
					10
				}
			}
		},
		[335] = {
			goal_id = 335,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80214,
					10
				}
			}
		},
		[336] = {
			goal_id = 336,
			show_icon = 120,
			desc = "获得1个5星英雄",
			award = {
				{
					80214,
					10
				}
			}
		},
		[341] = {
			goal_id = 341,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[342] = {
			goal_id = 342,
			show_icon = 158,
			desc = "挑战5次竞技场",
			award = {
				{
					80214,
					10
				}
			}
		},
		[343] = {
			goal_id = 343,
			show_icon = 126,
			desc = "紫色订单远航一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[344] = {
			goal_id = 344,
			show_icon = 146,
			desc = "挑战公会boss3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[9905] = {
			goal_id = 9905,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80214,
					10
				}
			}
		},
		[346] = {
			goal_id = 346,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[351] = {
			goal_id = 351,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[352] = {
			goal_id = 352,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[353] = {
			goal_id = 353,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80214,
					10
				}
			}
		},
		[354] = {
			goal_id = 354,
			show_icon = 132,
			desc = "快速作战四次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[355] = {
			goal_id = 355,
			show_icon = 408,
			desc = "合成1次战技",
			award = {
				{
					80214,
					10
				}
			}
		},
		[356] = {
			goal_id = 356,
			show_icon = 120,
			desc = "高级召唤3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[361] = {
			goal_id = 361,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[362] = {
			goal_id = 362,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80214,
					10
				}
			}
		},
		[363] = {
			goal_id = 363,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[364] = {
			goal_id = 364,
			show_icon = 146,
			desc = "挑战公会boss3次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[9906] = {
			goal_id = 9906,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80214,
					10
				}
			}
		},
		[366] = {
			goal_id = 366,
			show_icon = 120,
			desc = "获得1个5星英雄",
			award = {
				{
					80214,
					10
				}
			}
		},
		[371] = {
			goal_id = 371,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[372] = {
			goal_id = 372,
			show_icon = 158,
			desc = "挑战5次竞技场",
			award = {
				{
					80214,
					10
				}
			}
		},
		[373] = {
			goal_id = 373,
			show_icon = 126,
			desc = "紫色订单远航一次",
			award = {
				{
					80214,
					10
				}
			}
		},
		[374] = {
			goal_id = 374,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80214,
					10
				}
			}
		},
		[375] = {
			goal_id = 375,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80214,
					10
				}
			}
		},
		[376] = {
			goal_id = 376,
			show_icon = 201,
			desc = "进行5次神技升级",
			award = {
				{
					80214,
					10
				}
			}
		}
	},
	[5] = {
		[511] = {
			goal_id = 511,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[512] = {
			goal_id = 512,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80213,
					10
				}
			}
		},
		[513] = {
			goal_id = 513,
			show_icon = 126,
			desc = "冒险远航：接取一次紫色及以上远航订单",
			award = {
				{
					80213,
					10
				}
			}
		},
		[514] = {
			goal_id = 514,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80213,
					10
				}
			}
		},
		[515] = {
			goal_id = 515,
			show_icon = 157,
			desc = "速战勇者：快速作战四次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[516] = {
			goal_id = 516,
			show_icon = 154,
			desc = "装备锻造：合成3件装备",
			award = {
				{
					80213,
					10
				}
			}
		},
		[517] = {
			goal_id = 517,
			show_icon = 204,
			desc = "领地招募：参与1次伟大召唤处召唤",
			award = {
				{
					80213,
					15
				}
			}
		},
		[521] = {
			goal_id = 521,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[522] = {
			goal_id = 522,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[523] = {
			goal_id = 523,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80213,
					10
				}
			}
		},
		[524] = {
			goal_id = 524,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[9907] = {
			goal_id = 9907,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80213,
					10
				}
			}
		},
		[526] = {
			goal_id = 526,
			show_icon = 408,
			desc = "战技锻造：合成1次战技",
			award = {
				{
					80213,
					10
				}
			}
		},
		[527] = {
			goal_id = 527,
			show_icon = 120,
			desc = "伙伴招募：高级召唤3次",
			award = {
				{
					80213,
					15
				}
			}
		},
		[531] = {
			goal_id = 531,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[532] = {
			goal_id = 532,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80213,
					10
				}
			}
		},
		[533] = {
			goal_id = 533,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[534] = {
			goal_id = 534,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80213,
					10
				}
			}
		},
		[535] = {
			goal_id = 535,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80213,
					10
				}
			}
		},
		[536] = {
			goal_id = 536,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80213,
					10
				}
			}
		},
		[537] = {
			goal_id = 537,
			show_icon = 120,
			desc = "英雄荣耀：获得1个5星英雄",
			award = {
				{
					80213,
					15
				}
			}
		},
		[541] = {
			goal_id = 541,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[542] = {
			goal_id = 542,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80213,
					10
				}
			}
		},
		[543] = {
			goal_id = 543,
			show_icon = 126,
			desc = "冒险远航：接取一次紫色及以上远航订单",
			award = {
				{
					80213,
					10
				}
			}
		},
		[544] = {
			goal_id = 544,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[9908] = {
			goal_id = 9908,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80213,
					10
				}
			}
		},
		[546] = {
			goal_id = 546,
			show_icon = 154,
			desc = "装备锻造：合成3件装备",
			award = {
				{
					80213,
					10
				}
			}
		},
		[547] = {
			goal_id = 547,
			show_icon = 132,
			desc = "速战勇者：快速作战五次",
			award = {
				{
					80213,
					15
				}
			}
		},
		[551] = {
			goal_id = 551,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[552] = {
			goal_id = 552,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[553] = {
			goal_id = 553,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80213,
					10
				}
			}
		},
		[554] = {
			goal_id = 554,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80213,
					10
				}
			}
		},
		[555] = {
			goal_id = 555,
			show_icon = 157,
			desc = "速战勇者：快速作战四次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[556] = {
			goal_id = 556,
			show_icon = 408,
			desc = "战技锻造：合成1次战技",
			award = {
				{
					80213,
					10
				}
			}
		},
		[557] = {
			goal_id = 557,
			show_icon = 120,
			desc = "伙伴招募：高级召唤3次",
			award = {
				{
					80213,
					15
				}
			}
		},
		[561] = {
			goal_id = 561,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[562] = {
			goal_id = 562,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80213,
					10
				}
			}
		},
		[563] = {
			goal_id = 563,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[564] = {
			goal_id = 564,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[9909] = {
			goal_id = 9909,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80213,
					10
				}
			}
		},
		[566] = {
			goal_id = 566,
			show_icon = 154,
			desc = "装备锻造：合成3件装备",
			award = {
				{
					80213,
					10
				}
			}
		},
		[567] = {
			goal_id = 567,
			show_icon = 120,
			desc = "英雄荣耀：获得1个5星英雄",
			award = {
				{
					80213,
					15
				}
			}
		},
		[571] = {
			goal_id = 571,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80213,
					10
				}
			}
		},
		[572] = {
			goal_id = 572,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80213,
					10
				}
			}
		},
		[573] = {
			goal_id = 573,
			show_icon = 126,
			desc = "冒险远航：接取一次紫色及以上远航订单",
			award = {
				{
					80213,
					10
				}
			}
		},
		[574] = {
			goal_id = 574,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80213,
					10
				}
			}
		},
		[575] = {
			goal_id = 575,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80213,
					10
				}
			}
		},
		[576] = {
			goal_id = 576,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80213,
					10
				}
			}
		},
		[577] = {
			goal_id = 577,
			show_icon = 132,
			desc = "速战勇者：快速作战五次",
			award = {
				{
					80213,
					15
				}
			}
		}
	},
	[6] = {
		[611] = {
			goal_id = 611,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[612] = {
			goal_id = 612,
			show_icon = 158,
			desc = "挑战5次竞技场",
			award = {
				{
					80215,
					10
				}
			}
		},
		[613] = {
			goal_id = 613,
			show_icon = 126,
			desc = "紫色订单远航一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[614] = {
			goal_id = 614,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80215,
					10
				}
			}
		},
		[615] = {
			goal_id = 615,
			show_icon = 132,
			desc = "快速作战四次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[616] = {
			goal_id = 616,
			show_icon = 204,
			desc = "参与1次伟大召唤",
			award = {
				{
					80215,
					10
				}
			}
		},
		[621] = {
			goal_id = 621,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[622] = {
			goal_id = 622,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[623] = {
			goal_id = 623,
			show_icon = 146,
			desc = "挑战公会boss3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[9910] = {
			goal_id = 9910,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80215,
					10
				}
			}
		},
		[625] = {
			goal_id = 625,
			show_icon = 408,
			desc = "合成1次战技",
			award = {
				{
					80215,
					10
				}
			}
		},
		[626] = {
			goal_id = 626,
			show_icon = 120,
			desc = "高级召唤3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[631] = {
			goal_id = 631,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[632] = {
			goal_id = 632,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80215,
					10
				}
			}
		},
		[633] = {
			goal_id = 633,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[634] = {
			goal_id = 634,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80215,
					10
				}
			}
		},
		[635] = {
			goal_id = 635,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80215,
					10
				}
			}
		},
		[636] = {
			goal_id = 636,
			show_icon = 120,
			desc = "获得1个5星英雄",
			award = {
				{
					80215,
					10
				}
			}
		},
		[641] = {
			goal_id = 641,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[642] = {
			goal_id = 642,
			show_icon = 158,
			desc = "挑战5次竞技场",
			award = {
				{
					80215,
					10
				}
			}
		},
		[643] = {
			goal_id = 643,
			show_icon = 126,
			desc = "紫色订单远航一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[644] = {
			goal_id = 644,
			show_icon = 146,
			desc = "挑战公会boss3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[9911] = {
			goal_id = 9911,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80215,
					10
				}
			}
		},
		[646] = {
			goal_id = 646,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[651] = {
			goal_id = 651,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[652] = {
			goal_id = 652,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[653] = {
			goal_id = 653,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80215,
					10
				}
			}
		},
		[654] = {
			goal_id = 654,
			show_icon = 132,
			desc = "快速作战四次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[655] = {
			goal_id = 655,
			show_icon = 408,
			desc = "合成1次战技",
			award = {
				{
					80215,
					10
				}
			}
		},
		[656] = {
			goal_id = 656,
			show_icon = 120,
			desc = "高级召唤3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[661] = {
			goal_id = 661,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[662] = {
			goal_id = 662,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80215,
					10
				}
			}
		},
		[663] = {
			goal_id = 663,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[664] = {
			goal_id = 664,
			show_icon = 146,
			desc = "挑战公会boss3次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[9912] = {
			goal_id = 9912,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80215,
					10
				}
			}
		},
		[666] = {
			goal_id = 666,
			show_icon = 120,
			desc = "获得1个5星英雄",
			award = {
				{
					80215,
					10
				}
			}
		},
		[671] = {
			goal_id = 671,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[672] = {
			goal_id = 672,
			show_icon = 158,
			desc = "挑战5次竞技场",
			award = {
				{
					80215,
					10
				}
			}
		},
		[673] = {
			goal_id = 673,
			show_icon = 126,
			desc = "紫色订单远航一次",
			award = {
				{
					80215,
					10
				}
			}
		},
		[674] = {
			goal_id = 674,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80215,
					10
				}
			}
		},
		[675] = {
			goal_id = 675,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80215,
					10
				}
			}
		},
		[676] = {
			goal_id = 676,
			show_icon = 201,
			desc = "进行5次神技升级",
			award = {
				{
					80215,
					10
				}
			}
		}
	},
	[8] = {
		[811] = {
			goal_id = 811,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[812] = {
			goal_id = 812,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80216,
					10
				}
			}
		},
		[813] = {
			goal_id = 813,
			show_icon = 126,
			desc = "冒险远航：接取一次橙色及以上远航订单",
			award = {
				{
					80216,
					10
				}
			}
		},
		[814] = {
			goal_id = 814,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80216,
					10
				}
			}
		},
		[815] = {
			goal_id = 815,
			show_icon = 132,
			desc = "速战勇者：快速作战五5次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[816] = {
			goal_id = 816,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80216,
					10
				}
			}
		},
		[817] = {
			goal_id = 817,
			show_icon = 204,
			desc = "领地招募：参与1次伟大召唤处召唤",
			award = {
				{
					80216,
					15
				}
			}
		},
		[821] = {
			goal_id = 821,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[822] = {
			goal_id = 822,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[823] = {
			goal_id = 823,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80216,
					10
				}
			}
		},
		[824] = {
			goal_id = 824,
			show_icon = 146,
			desc = "公会使命：挑战公会boss4次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[9913] = {
			goal_id = 9913,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80216,
					10
				}
			}
		},
		[826] = {
			goal_id = 826,
			show_icon = 408,
			desc = "战技锻造：合成1次战技",
			award = {
				{
					80216,
					10
				}
			}
		},
		[827] = {
			goal_id = 827,
			show_icon = 120,
			desc = "伙伴招募：高级召唤5次",
			award = {
				{
					80216,
					15
				}
			}
		},
		[831] = {
			goal_id = 831,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[832] = {
			goal_id = 832,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80216,
					10
				}
			}
		},
		[833] = {
			goal_id = 833,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[834] = {
			goal_id = 834,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80216,
					10
				}
			}
		},
		[835] = {
			goal_id = 835,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80216,
					10
				}
			}
		},
		[836] = {
			goal_id = 836,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80216,
					10
				}
			}
		},
		[837] = {
			goal_id = 837,
			show_icon = 155,
			desc = "英雄荣耀：获得1个6星英雄",
			award = {
				{
					80216,
					15
				}
			}
		},
		[841] = {
			goal_id = 841,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[842] = {
			goal_id = 842,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80216,
					10
				}
			}
		},
		[843] = {
			goal_id = 843,
			show_icon = 126,
			desc = "冒险远航：接取一次橙色及以上远航订单",
			award = {
				{
					80216,
					10
				}
			}
		},
		[844] = {
			goal_id = 844,
			show_icon = 146,
			desc = "公会使命：挑战公会boss4次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[9914] = {
			goal_id = 9914,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80216,
					10
				}
			}
		},
		[846] = {
			goal_id = 846,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80216,
					10
				}
			}
		},
		[847] = {
			goal_id = 847,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80216,
					15
				}
			}
		},
		[851] = {
			goal_id = 851,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[852] = {
			goal_id = 852,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[853] = {
			goal_id = 853,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80216,
					10
				}
			}
		},
		[854] = {
			goal_id = 854,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80216,
					10
				}
			}
		},
		[855] = {
			goal_id = 855,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[856] = {
			goal_id = 856,
			show_icon = 408,
			desc = "战技锻造：合成1次战技",
			award = {
				{
					80216,
					10
				}
			}
		},
		[857] = {
			goal_id = 857,
			show_icon = 120,
			desc = "伙伴招募：高级召唤5次",
			award = {
				{
					80216,
					15
				}
			}
		},
		[861] = {
			goal_id = 861,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[862] = {
			goal_id = 862,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80216,
					10
				}
			}
		},
		[863] = {
			goal_id = 863,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[864] = {
			goal_id = 864,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[9915] = {
			goal_id = 9915,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80216,
					10
				}
			}
		},
		[866] = {
			goal_id = 866,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80216,
					10
				}
			}
		},
		[867] = {
			goal_id = 867,
			show_icon = 155,
			desc = "英雄荣耀：获得1个6星英雄",
			award = {
				{
					80216,
					15
				}
			}
		},
		[871] = {
			goal_id = 871,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80216,
					10
				}
			}
		},
		[872] = {
			goal_id = 872,
			show_icon = 158,
			desc = "勇士战场：挑战5次竞技场",
			award = {
				{
					80216,
					10
				}
			}
		},
		[873] = {
			goal_id = 873,
			show_icon = 126,
			desc = "冒险远航：接取一次橙色及以上远航订单",
			award = {
				{
					80216,
					10
				}
			}
		},
		[874] = {
			goal_id = 874,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80216,
					10
				}
			}
		},
		[875] = {
			goal_id = 875,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80216,
					10
				}
			}
		},
		[876] = {
			goal_id = 876,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80216,
					10
				}
			}
		},
		[877] = {
			goal_id = 877,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80216,
					15
				}
			}
		}
	},
	[9] = {
		[911] = {
			goal_id = 911,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[912] = {
			goal_id = 912,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80217,
					10
				}
			}
		},
		[913] = {
			goal_id = 913,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80217,
					10
				}
			}
		},
		[914] = {
			goal_id = 914,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80217,
					10
				}
			}
		},
		[915] = {
			goal_id = 915,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[916] = {
			goal_id = 916,
			show_icon = 204,
			desc = "参与1次伟大召唤",
			award = {
				{
					80217,
					10
				}
			}
		},
		[917] = {
			goal_id = 917,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[918] = {
			goal_id = 918,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[919] = {
			goal_id = 919,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[9916] = {
			goal_id = 9916,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80217,
					10
				}
			}
		},
		[921] = {
			goal_id = 921,
			show_icon = 408,
			desc = "合成3次战技",
			award = {
				{
					80217,
					10
				}
			}
		},
		[922] = {
			goal_id = 922,
			show_icon = 120,
			desc = "高级召唤5次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[923] = {
			goal_id = 923,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[924] = {
			goal_id = 924,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80217,
					10
				}
			}
		},
		[925] = {
			goal_id = 925,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[926] = {
			goal_id = 926,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80217,
					10
				}
			}
		},
		[927] = {
			goal_id = 927,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80217,
					10
				}
			}
		},
		[928] = {
			goal_id = 928,
			show_icon = 155,
			desc = "获得1个6星英雄",
			award = {
				{
					80217,
					10
				}
			}
		},
		[929] = {
			goal_id = 929,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[930] = {
			goal_id = 930,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80217,
					10
				}
			}
		},
		[931] = {
			goal_id = 931,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80217,
					10
				}
			}
		},
		[932] = {
			goal_id = 932,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[9917] = {
			goal_id = 9917,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80217,
					10
				}
			}
		},
		[934] = {
			goal_id = 934,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[935] = {
			goal_id = 935,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[936] = {
			goal_id = 936,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[937] = {
			goal_id = 937,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80217,
					10
				}
			}
		},
		[938] = {
			goal_id = 938,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[939] = {
			goal_id = 939,
			show_icon = 408,
			desc = "合成3次战技",
			award = {
				{
					80217,
					10
				}
			}
		},
		[940] = {
			goal_id = 940,
			show_icon = 120,
			desc = "高级召唤5次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[941] = {
			goal_id = 941,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[942] = {
			goal_id = 942,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80217,
					10
				}
			}
		},
		[943] = {
			goal_id = 943,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[944] = {
			goal_id = 944,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[9918] = {
			goal_id = 9918,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80217,
					10
				}
			}
		},
		[946] = {
			goal_id = 946,
			show_icon = 155,
			desc = "获得1个6星英雄",
			award = {
				{
					80217,
					10
				}
			}
		},
		[947] = {
			goal_id = 947,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80217,
					10
				}
			}
		},
		[948] = {
			goal_id = 948,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80217,
					10
				}
			}
		},
		[949] = {
			goal_id = 949,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80217,
					10
				}
			}
		},
		[950] = {
			goal_id = 950,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80217,
					10
				}
			}
		},
		[951] = {
			goal_id = 951,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80217,
					10
				}
			}
		},
		[952] = {
			goal_id = 952,
			show_icon = 201,
			desc = "进行5次神技升级",
			award = {
				{
					80217,
					10
				}
			}
		}
	},
	[10] = {
		[1011] = {
			goal_id = 1011,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1012] = {
			goal_id = 1012,
			show_icon = 158,
			desc = "勇士战场：挑战10次竞技场",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1013] = {
			goal_id = 1013,
			show_icon = 126,
			desc = "冒险远航：接取3次橙色及以上远航订单",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1014] = {
			goal_id = 1014,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1015] = {
			goal_id = 1015,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1016] = {
			goal_id = 1016,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1017] = {
			goal_id = 1017,
			show_icon = 204,
			desc = "领地招募：参与1次伟大召唤处召唤",
			award = {
				{
					80218,
					15
				}
			}
		},
		[1018] = {
			goal_id = 1018,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1019] = {
			goal_id = 1019,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1020] = {
			goal_id = 1020,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1021] = {
			goal_id = 1021,
			show_icon = 146,
			desc = "公会使命：挑战公会boss4次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[9919] = {
			goal_id = 9919,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1023] = {
			goal_id = 1023,
			show_icon = 408,
			desc = "战技锻造：合成3次战技",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1024] = {
			goal_id = 1024,
			show_icon = 120,
			desc = "伙伴招募：高级召唤5次",
			award = {
				{
					80218,
					15
				}
			}
		},
		[1025] = {
			goal_id = 1025,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1026] = {
			goal_id = 1026,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1027] = {
			goal_id = 1027,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1028] = {
			goal_id = 1028,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1029] = {
			goal_id = 1029,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1030] = {
			goal_id = 1030,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1031] = {
			goal_id = 1031,
			show_icon = 155,
			desc = "英雄荣耀：获得1个6星英雄",
			award = {
				{
					80218,
					15
				}
			}
		},
		[1032] = {
			goal_id = 1032,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1033] = {
			goal_id = 1033,
			show_icon = 158,
			desc = "勇士战场：挑战10次竞技场",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1034] = {
			goal_id = 1034,
			show_icon = 126,
			desc = "冒险远航：接取3次橙色及以上远航订单",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1035] = {
			goal_id = 1035,
			show_icon = 146,
			desc = "公会使命：挑战公会boss4次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[9920] = {
			goal_id = 9920,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1037] = {
			goal_id = 1037,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1038] = {
			goal_id = 1038,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80218,
					15
				}
			}
		},
		[1039] = {
			goal_id = 1039,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1040] = {
			goal_id = 1040,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1041] = {
			goal_id = 1041,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1042] = {
			goal_id = 1042,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1043] = {
			goal_id = 1043,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1044] = {
			goal_id = 1044,
			show_icon = 408,
			desc = "战技锻造：合成3次战技",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1045] = {
			goal_id = 1045,
			show_icon = 120,
			desc = "伙伴招募：高级召唤5次",
			award = {
				{
					80218,
					15
				}
			}
		},
		[1046] = {
			goal_id = 1046,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1047] = {
			goal_id = 1047,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1048] = {
			goal_id = 1048,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1049] = {
			goal_id = 1049,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[9921] = {
			goal_id = 9921,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1051] = {
			goal_id = 1051,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1052] = {
			goal_id = 1052,
			show_icon = 155,
			desc = "英雄荣耀：获得1个6星英雄",
			award = {
				{
					80218,
					15
				}
			}
		},
		[1053] = {
			goal_id = 1053,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1054] = {
			goal_id = 1054,
			show_icon = 158,
			desc = "勇士战场：挑战10次竞技场",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1055] = {
			goal_id = 1055,
			show_icon = 126,
			desc = "冒险远航：接取3次橙色及以上远航订单",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1056] = {
			goal_id = 1056,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1057] = {
			goal_id = 1057,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1058] = {
			goal_id = 1058,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80218,
					10
				}
			}
		},
		[1059] = {
			goal_id = 1059,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80218,
					15
				}
			}
		}
	},
	[11] = {
		[1111] = {
			goal_id = 1111,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1112] = {
			goal_id = 1112,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1113] = {
			goal_id = 1113,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1114] = {
			goal_id = 1114,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1115] = {
			goal_id = 1115,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1116] = {
			goal_id = 1116,
			show_icon = 204,
			desc = "参与1次伟大召唤",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1117] = {
			goal_id = 1117,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1118] = {
			goal_id = 1118,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1119] = {
			goal_id = 1119,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[9922] = {
			goal_id = 9922,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1121] = {
			goal_id = 1121,
			show_icon = 408,
			desc = "合成3次战技",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1122] = {
			goal_id = 1122,
			show_icon = 120,
			desc = "高级召唤5次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1123] = {
			goal_id = 1123,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1124] = {
			goal_id = 1124,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1125] = {
			goal_id = 1125,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1126] = {
			goal_id = 1126,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1127] = {
			goal_id = 1127,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1128] = {
			goal_id = 1128,
			show_icon = 155,
			desc = "获得1个6星英雄",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1129] = {
			goal_id = 1129,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1130] = {
			goal_id = 1130,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1131] = {
			goal_id = 1131,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1132] = {
			goal_id = 1132,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[9923] = {
			goal_id = 9923,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1134] = {
			goal_id = 1134,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1135] = {
			goal_id = 1135,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1136] = {
			goal_id = 1136,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1137] = {
			goal_id = 1137,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1138] = {
			goal_id = 1138,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1139] = {
			goal_id = 1139,
			show_icon = 408,
			desc = "合成3次战技",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1140] = {
			goal_id = 1140,
			show_icon = 120,
			desc = "高级召唤5次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1141] = {
			goal_id = 1141,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1142] = {
			goal_id = 1142,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1143] = {
			goal_id = 1143,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1144] = {
			goal_id = 1144,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[9924] = {
			goal_id = 9924,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1146] = {
			goal_id = 1146,
			show_icon = 155,
			desc = "获得1个6星英雄",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1147] = {
			goal_id = 1147,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1148] = {
			goal_id = 1148,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1149] = {
			goal_id = 1149,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1150] = {
			goal_id = 1150,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1151] = {
			goal_id = 1151,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80219,
					10
				}
			}
		},
		[1152] = {
			goal_id = 1152,
			show_icon = 201,
			desc = "进行5次神技升级",
			award = {
				{
					80219,
					10
				}
			}
		}
	},
	[12] = {
		[1211] = {
			goal_id = 1211,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1212] = {
			goal_id = 1212,
			show_icon = 158,
			desc = "勇士战场：挑战10次竞技场",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1213] = {
			goal_id = 1213,
			show_icon = 126,
			desc = "冒险远航：接取3次橙色及以上远航订单",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1214] = {
			goal_id = 1214,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1215] = {
			goal_id = 1215,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1216] = {
			goal_id = 1216,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1217] = {
			goal_id = 1217,
			show_icon = 204,
			desc = "领地招募：参与1次伟大召唤处召唤",
			award = {
				{
					80220,
					15
				}
			}
		},
		[1218] = {
			goal_id = 1218,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1219] = {
			goal_id = 1219,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1220] = {
			goal_id = 1220,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1221] = {
			goal_id = 1221,
			show_icon = 146,
			desc = "公会使命：挑战公会boss4次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[9925] = {
			goal_id = 9925,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1223] = {
			goal_id = 1223,
			show_icon = 408,
			desc = "战技锻造：合成3次战技",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1224] = {
			goal_id = 1224,
			show_icon = 120,
			desc = "伙伴招募：高级召唤5次",
			award = {
				{
					80220,
					15
				}
			}
		},
		[1225] = {
			goal_id = 1225,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1226] = {
			goal_id = 1226,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1227] = {
			goal_id = 1227,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1228] = {
			goal_id = 1228,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1229] = {
			goal_id = 1229,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1230] = {
			goal_id = 1230,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1231] = {
			goal_id = 1231,
			show_icon = 155,
			desc = "英雄荣耀：获得1个6星英雄",
			award = {
				{
					80220,
					15
				}
			}
		},
		[1232] = {
			goal_id = 1232,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1233] = {
			goal_id = 1233,
			show_icon = 158,
			desc = "勇士战场：挑战10次竞技场",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1234] = {
			goal_id = 1234,
			show_icon = 126,
			desc = "冒险远航：接取3次橙色及以上远航订单",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1235] = {
			goal_id = 1235,
			show_icon = 146,
			desc = "公会使命：挑战公会boss4次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[9926] = {
			goal_id = 9926,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1237] = {
			goal_id = 1237,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1238] = {
			goal_id = 1238,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80220,
					15
				}
			}
		},
		[1239] = {
			goal_id = 1239,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1240] = {
			goal_id = 1240,
			show_icon = 160,
			desc = "爬塔勇者：挑战或扫荡海底监狱任意层3次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1241] = {
			goal_id = 1241,
			show_icon = 402,
			desc = "友谊之光：赠送好友友情点5次以上",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1242] = {
			goal_id = 1242,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1243] = {
			goal_id = 1243,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1244] = {
			goal_id = 1244,
			show_icon = 408,
			desc = "战技锻造：合成3次战技",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1245] = {
			goal_id = 1245,
			show_icon = 120,
			desc = "伙伴招募：高级召唤5次",
			award = {
				{
					80220,
					15
				}
			}
		},
		[1246] = {
			goal_id = 1246,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1247] = {
			goal_id = 1247,
			show_icon = 152,
			desc = "冒险副本：参与日常副本8次以上",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1248] = {
			goal_id = 1248,
			show_icon = 405,
			desc = "幸运命轮：寻宝10次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1249] = {
			goal_id = 1249,
			show_icon = 146,
			desc = "公会使命：挑战公会boss3次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[9927] = {
			goal_id = 9927,
			show_icon = 138,
			desc = "钻石矿主：消耗500钻石",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1251] = {
			goal_id = 1251,
			show_icon = 154,
			desc = "装备锻造：合成5件装备",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1252] = {
			goal_id = 1252,
			show_icon = 155,
			desc = "英雄荣耀：获得1个6星英雄",
			award = {
				{
					80220,
					15
				}
			}
		},
		[1253] = {
			goal_id = 1253,
			show_icon = 401,
			desc = "荣誉登场：登录冒险大陆一次",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1254] = {
			goal_id = 1254,
			show_icon = 158,
			desc = "勇士战场：挑战10次竞技场",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1255] = {
			goal_id = 1255,
			show_icon = 126,
			desc = "冒险远航：接取3次橙色及以上远航订单",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1256] = {
			goal_id = 1256,
			show_icon = 145,
			desc = "公会使命：进行1次公会捐献",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1257] = {
			goal_id = 1257,
			show_icon = 153,
			desc = "试炼荣耀：参与1次无尽试炼",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1258] = {
			goal_id = 1258,
			show_icon = 201,
			desc = "终结技：进行5次神技升级",
			award = {
				{
					80220,
					10
				}
			}
		},
		[1259] = {
			goal_id = 1259,
			show_icon = 132,
			desc = "速战勇者：快速作战5次",
			award = {
				{
					80220,
					15
				}
			}
		}
	},
	[13] = {
		[1311] = {
			goal_id = 1311,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1312] = {
			goal_id = 1312,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1313] = {
			goal_id = 1313,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1314] = {
			goal_id = 1314,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1315] = {
			goal_id = 1315,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1316] = {
			goal_id = 1316,
			show_icon = 204,
			desc = "参与1次伟大召唤",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1317] = {
			goal_id = 1317,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1318] = {
			goal_id = 1318,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1319] = {
			goal_id = 1319,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[9928] = {
			goal_id = 9928,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1321] = {
			goal_id = 1321,
			show_icon = 408,
			desc = "合成3次战技",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1322] = {
			goal_id = 1322,
			show_icon = 120,
			desc = "高级召唤5次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1323] = {
			goal_id = 1323,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1324] = {
			goal_id = 1324,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1325] = {
			goal_id = 1325,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1326] = {
			goal_id = 1326,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1327] = {
			goal_id = 1327,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1328] = {
			goal_id = 1328,
			show_icon = 155,
			desc = "获得1个6星英雄",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1329] = {
			goal_id = 1329,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1330] = {
			goal_id = 1330,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1331] = {
			goal_id = 1331,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1332] = {
			goal_id = 1332,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[9929] = {
			goal_id = 9929,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1334] = {
			goal_id = 1334,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1335] = {
			goal_id = 1335,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1336] = {
			goal_id = 1336,
			show_icon = 160,
			desc = "通关扫荡海底监狱3次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1337] = {
			goal_id = 1337,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1338] = {
			goal_id = 1338,
			show_icon = 132,
			desc = "快速作战五次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1339] = {
			goal_id = 1339,
			show_icon = 408,
			desc = "合成3次战技",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1340] = {
			goal_id = 1340,
			show_icon = 120,
			desc = "高级召唤5次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1341] = {
			goal_id = 1341,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1342] = {
			goal_id = 1342,
			show_icon = 152,
			desc = "日常副本8次以上",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1343] = {
			goal_id = 1343,
			show_icon = 405,
			desc = "寻宝10次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1344] = {
			goal_id = 1344,
			show_icon = 146,
			desc = "挑战公会boss4次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[9930] = {
			goal_id = 9930,
			show_icon = 138,
			desc = "消耗500钻石",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1346] = {
			goal_id = 1346,
			show_icon = 155,
			desc = "获得1个6星英雄",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1347] = {
			goal_id = 1347,
			show_icon = 401,
			desc = "登录冒险大陆一次",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1348] = {
			goal_id = 1348,
			show_icon = 158,
			desc = "挑战10次竞技场",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1349] = {
			goal_id = 1349,
			show_icon = 126,
			desc = "接取3次橙色远航",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1350] = {
			goal_id = 1350,
			show_icon = 145,
			desc = "进行1次公会捐献",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1351] = {
			goal_id = 1351,
			show_icon = 153,
			desc = "参与1次无尽试炼",
			award = {
				{
					80222,
					10
				}
			}
		},
		[1352] = {
			goal_id = 1352,
			show_icon = 201,
			desc = "进行5次神技升级",
			award = {
				{
					80222,
					10
				}
			}
		}
	}
}
Config.DayGoalsNewData.data_charge_list_length = 10
Config.DayGoalsNewData.data_charge_list = {
	[2] = {
		[2001] = {
			goal_id = 2001,
			show_icon = 131,
			period = 2,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[2002] = {
			goal_id = 2002,
			show_icon = 131,
			period = 2,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[2003] = {
			goal_id = 2003,
			show_icon = 131,
			period = 2,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[2004] = {
			goal_id = 2004,
			show_icon = 131,
			period = 2,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[2005] = {
			goal_id = 2005,
			show_icon = 131,
			period = 2,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[2006] = {
			goal_id = 2006,
			show_icon = 131,
			period = 2,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38051,
					1
				}
			}
		},
		[2007] = {
			goal_id = 2007,
			show_icon = 131,
			period = 2,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					28904,
					50
				}
			}
		}
	},
	[3] = {
		[3001] = {
			goal_id = 3001,
			show_icon = 131,
			period = 3,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[3002] = {
			goal_id = 3002,
			show_icon = 131,
			period = 3,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[3003] = {
			goal_id = 3003,
			show_icon = 131,
			period = 3,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[3004] = {
			goal_id = 3004,
			show_icon = 131,
			period = 3,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[3005] = {
			goal_id = 3005,
			show_icon = 131,
			period = 3,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[3006] = {
			goal_id = 3006,
			show_icon = 131,
			period = 3,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[3007] = {
			goal_id = 3007,
			show_icon = 131,
			period = 3,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					28903,
					50
				}
			}
		}
	},
	[5] = {
		[5001] = {
			goal_id = 5001,
			show_icon = 131,
			period = 5,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[5002] = {
			goal_id = 5002,
			show_icon = 131,
			period = 5,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[5003] = {
			goal_id = 5003,
			show_icon = 131,
			period = 5,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[5004] = {
			goal_id = 5004,
			show_icon = 131,
			period = 5,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[5005] = {
			goal_id = 5005,
			show_icon = 131,
			period = 5,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[5006] = {
			goal_id = 5006,
			show_icon = 131,
			period = 5,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[5007] = {
			goal_id = 5007,
			show_icon = 131,
			period = 5,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					27902,
					50
				}
			}
		}
	},
	[6] = {
		[6001] = {
			goal_id = 6001,
			show_icon = 131,
			period = 6,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[6002] = {
			goal_id = 6002,
			show_icon = 131,
			period = 6,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[6003] = {
			goal_id = 6003,
			show_icon = 131,
			period = 6,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[6004] = {
			goal_id = 6004,
			show_icon = 131,
			period = 6,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[6005] = {
			goal_id = 6005,
			show_icon = 131,
			period = 6,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[6006] = {
			goal_id = 6006,
			show_icon = 131,
			period = 6,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[6007] = {
			goal_id = 6007,
			show_icon = 131,
			period = 6,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					28903,
					50
				}
			}
		}
	},
	[8] = {
		[8001] = {
			goal_id = 8001,
			show_icon = 131,
			period = 8,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[8002] = {
			goal_id = 8002,
			show_icon = 131,
			period = 8,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[8003] = {
			goal_id = 8003,
			show_icon = 131,
			period = 8,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[8004] = {
			goal_id = 8004,
			show_icon = 131,
			period = 8,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[8005] = {
			goal_id = 8005,
			show_icon = 131,
			period = 8,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[8006] = {
			goal_id = 8006,
			show_icon = 131,
			period = 8,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38051,
					1
				}
			}
		},
		[8007] = {
			goal_id = 8007,
			show_icon = 131,
			period = 8,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					27903,
					50
				}
			}
		}
	},
	[9] = {
		[9001] = {
			goal_id = 9001,
			show_icon = 131,
			period = 9,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					10450,
					1000
				}
			}
		},
		[9002] = {
			goal_id = 9002,
			show_icon = 131,
			period = 9,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[9003] = {
			goal_id = 9003,
			show_icon = 131,
			period = 9,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[9004] = {
			goal_id = 9004,
			show_icon = 131,
			period = 9,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[9005] = {
			goal_id = 9005,
			show_icon = 131,
			period = 9,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					72001,
					350
				}
			}
		},
		[9006] = {
			goal_id = 9006,
			show_icon = 131,
			period = 9,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[9007] = {
			goal_id = 9007,
			show_icon = 131,
			period = 9,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					27905,
					50
				}
			}
		}
	},
	[10] = {
		[10001] = {
			goal_id = 10001,
			show_icon = 131,
			period = 10,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					10450,
					1000
				}
			}
		},
		[10002] = {
			goal_id = 10002,
			show_icon = 131,
			period = 10,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[10003] = {
			goal_id = 10003,
			show_icon = 131,
			period = 10,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[10004] = {
			goal_id = 10004,
			show_icon = 131,
			period = 10,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[10005] = {
			goal_id = 10005,
			show_icon = 131,
			period = 10,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					17009,
					250
				}
			}
		},
		[10006] = {
			goal_id = 10006,
			show_icon = 131,
			period = 10,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[10007] = {
			goal_id = 10007,
			show_icon = 131,
			period = 10,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					28901,
					50
				}
			}
		}
	},
	[11] = {
		[11001] = {
			goal_id = 11001,
			show_icon = 131,
			period = 11,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[11002] = {
			goal_id = 11002,
			show_icon = 131,
			period = 11,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[11003] = {
			goal_id = 11003,
			show_icon = 131,
			period = 11,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[11004] = {
			goal_id = 11004,
			show_icon = 131,
			period = 11,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[11005] = {
			goal_id = 11005,
			show_icon = 131,
			period = 11,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[11006] = {
			goal_id = 11006,
			show_icon = 131,
			period = 11,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[11007] = {
			goal_id = 11007,
			show_icon = 131,
			period = 11,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					27902,
					50
				}
			}
		}
	},
	[12] = {
		[12001] = {
			goal_id = 12001,
			show_icon = 131,
			period = 12,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[12002] = {
			goal_id = 12002,
			show_icon = 131,
			period = 12,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[12003] = {
			goal_id = 12003,
			show_icon = 131,
			period = 12,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[12004] = {
			goal_id = 12004,
			show_icon = 131,
			period = 12,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[12005] = {
			goal_id = 12005,
			show_icon = 131,
			period = 12,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					17009,
					250
				}
			}
		},
		[12006] = {
			goal_id = 12006,
			show_icon = 131,
			period = 12,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[12007] = {
			goal_id = 12007,
			show_icon = 131,
			period = 12,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					28904,
					50
				}
			}
		}
	},
	[13] = {
		[13001] = {
			goal_id = 13001,
			show_icon = 131,
			period = 13,
			id = 1,
			desc = "累充100元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 100,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					200
				},
				{
					72001,
					50
				}
			}
		},
		[13002] = {
			goal_id = 13002,
			show_icon = 131,
			period = 13,
			id = 2,
			desc = "累充200元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 200,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					400
				},
				{
					10403,
					3
				}
			}
		},
		[13003] = {
			goal_id = 13003,
			show_icon = 131,
			period = 13,
			id = 3,
			desc = "累充500元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 500,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					1000
				},
				{
					37002,
					1
				}
			}
		},
		[13004] = {
			goal_id = 13004,
			show_icon = 131,
			period = 13,
			id = 4,
			desc = "累充1000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 1000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					2000
				},
				{
					14001,
					1
				}
			}
		},
		[13005] = {
			goal_id = 13005,
			show_icon = 131,
			period = 13,
			id = 5,
			desc = "累充2000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 2000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					3000
				},
				{
					10450,
					5000
				}
			}
		},
		[13006] = {
			goal_id = 13006,
			show_icon = 131,
			period = 13,
			id = 6,
			desc = "累充3000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 3000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					5000
				},
				{
					38061,
					1
				}
			}
		},
		[13007] = {
			goal_id = 13007,
			show_icon = 131,
			period = 13,
			id = 7,
			desc = "累充5000元",
			progress = {
				{
					cli_label = "evt_pay",
					target = 0,
					target_val = 5000,
					param = {
						"rmb"
					}
				}
			},
			award = {
				{
					3,
					8000
				},
				{
					27906,
					50
				}
			}
		}
	}
}
