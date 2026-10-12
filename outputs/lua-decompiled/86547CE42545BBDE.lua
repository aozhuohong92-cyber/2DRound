Config = Config or {}
Config.HolidayMakeData = Config.HolidayMakeData or {}
Config.HolidayMakeData.data_const_length = 0
Config.HolidayMakeData.data_const = {}

function Config.HolidayMakeData.data_const_fun(slot0)
	slot1 = Config.HolidayMakeData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HolidayMakeData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HolidayMakeData.data_make_list_length = 7
Config.HolidayMakeData.data_make_list = {
	[51641] = {
		[1001] = {
			lev = 1,
			camp_id = 51641,
			exp = 100,
			id = 1001,
			name = "甜粽",
			limit = 20,
			loss = {
				{
					80269,
					30
				},
				{
					802700,
					60
				},
				{
					80271,
					60
				}
			}
		},
		[1002] = {
			lev = 2,
			camp_id = 51641,
			exp = 200,
			id = 1002,
			name = "咸肉粽",
			limit = 20,
			loss = {
				{
					80269,
					30
				},
				{
					802700,
					60
				},
				{
					80273,
					60
				}
			}
		},
		[1003] = {
			lev = 5,
			camp_id = 51641,
			exp = 500,
			id = 1003,
			name = "板栗肉粽",
			limit = 20,
			loss = {
				{
					80269,
					30
				},
				{
					802700,
					60
				},
				{
					80273,
					30
				},
				{
					80272,
					30
				}
			}
		},
		[1004] = {
			lev = 8,
			camp_id = 51641,
			exp = 1000,
			id = 1004,
			name = "蛋黄肉粽",
			limit = 20,
			loss = {
				{
					80269,
					30
				},
				{
					802700,
					60
				},
				{
					80273,
					30
				},
				{
					80274,
					30
				}
			}
		},
		[1005] = {
			lev = 9,
			camp_id = 51641,
			exp = 1000,
			id = 1005,
			name = "端午大礼包",
			limit = 999,
			loss = {
				{
					80269,
					30
				},
				{
					802700,
					30
				},
				{
					80271,
					30
				},
				{
					80272,
					30
				},
				{
					80273,
					30
				},
				{
					80274,
					30
				}
			}
		}
	},
	[51782] = {
		[1006] = {
			lev = 1,
			camp_id = 51782,
			exp = 100,
			id = 1006,
			name = "船副",
			limit = 10,
			loss = {
				{
					99943,
					30
				},
				{
					99944,
					60
				}
			}
		},
		[1007] = {
			lev = 2,
			camp_id = 51782,
			exp = 100,
			id = 1007,
			name = "航海士",
			limit = 10,
			loss = {
				{
					99943,
					30
				},
				{
					99944,
					60
				},
				{
					99945,
					60
				}
			}
		},
		[1008] = {
			lev = 4,
			camp_id = 51782,
			exp = 100,
			id = 1008,
			name = "狙击手",
			limit = 10,
			loss = {
				{
					99943,
					30
				},
				{
					99944,
					60
				},
				{
					99945,
					60
				},
				{
					99946,
					30
				}
			}
		},
		[1009] = {
			lev = 5,
			camp_id = 51782,
			exp = 100,
			id = 1009,
			name = "厨子",
			limit = 10,
			loss = {
				{
					99943,
					30
				},
				{
					99944,
					60
				},
				{
					99945,
					60
				},
				{
					99946,
					30
				},
				{
					99947,
					30
				}
			}
		},
		[1010] = {
			lev = 6,
			camp_id = 51782,
			exp = 100,
			id = 1010,
			name = "船医",
			limit = 10,
			loss = {
				{
					99943,
					30
				},
				{
					99944,
					60
				},
				{
					99945,
					60
				},
				{
					99946,
					30
				},
				{
					99947,
					30
				},
				{
					99948,
					30
				}
			}
		},
		[1011] = {
			lev = 7,
			camp_id = 51782,
			exp = 313,
			id = 1011,
			name = "考古学家",
			limit = 999,
			loss = {
				{
					99943,
					30
				},
				{
					99944,
					60
				},
				{
					99945,
					60
				},
				{
					99946,
					30
				},
				{
					99947,
					30
				},
				{
					99948,
					30
				},
				{
					99949,
					30
				}
			}
		}
	},
	[52035] = {
		[1012] = {
			lev = 1,
			camp_id = 52035,
			exp = 100,
			id = 1012,
			name = "月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				}
			}
		},
		[1013] = {
			lev = 2,
			camp_id = 52035,
			exp = 100,
			id = 1013,
			name = "蛋黄月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				}
			}
		},
		[1014] = {
			lev = 4,
			camp_id = 52035,
			exp = 100,
			id = 1014,
			name = "花生月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				}
			}
		},
		[1015] = {
			lev = 5,
			camp_id = 52035,
			exp = 100,
			id = 1015,
			name = "莲蓉月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				},
				{
					99962,
					30
				}
			}
		},
		[1016] = {
			lev = 6,
			camp_id = 52035,
			exp = 100,
			id = 1016,
			name = "杏仁月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				},
				{
					99962,
					30
				},
				{
					99963,
					30
				}
			}
		},
		[1017] = {
			lev = 7,
			camp_id = 52035,
			exp = 313,
			id = 1017,
			name = "五仁月饼",
			limit = 999,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				},
				{
					99962,
					30
				},
				{
					99963,
					30
				},
				{
					99964,
					30
				},
				{
					99965,
					30
				}
			}
		}
	},
	[52091] = {
		[1018] = {
			lev = 1,
			camp_id = 52091,
			exp = 100,
			id = 1018,
			name = "月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				}
			}
		},
		[1019] = {
			lev = 2,
			camp_id = 52091,
			exp = 100,
			id = 1019,
			name = "蛋黄月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				}
			}
		},
		[1020] = {
			lev = 4,
			camp_id = 52091,
			exp = 100,
			id = 1020,
			name = "花生月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				}
			}
		},
		[1021] = {
			lev = 5,
			camp_id = 52091,
			exp = 100,
			id = 1021,
			name = "莲蓉月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				},
				{
					99962,
					30
				}
			}
		},
		[1022] = {
			lev = 6,
			camp_id = 52091,
			exp = 100,
			id = 1022,
			name = "杏仁月饼",
			limit = 10,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				},
				{
					99962,
					30
				},
				{
					99963,
					30
				}
			}
		},
		[1023] = {
			lev = 7,
			camp_id = 52091,
			exp = 313,
			id = 1023,
			name = "五仁月饼",
			limit = 999,
			loss = {
				{
					99958,
					30
				},
				{
					99959,
					60
				},
				{
					99960,
					60
				},
				{
					99961,
					30
				},
				{
					99962,
					30
				},
				{
					99963,
					30
				},
				{
					99964,
					30
				}
			}
		}
	},
	[52477] = {
		[1024] = {
			lev = 1,
			camp_id = 52477,
			exp = 100,
			id = 1024,
			name = "爱国福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				}
			}
		},
		[1025] = {
			lev = 2,
			camp_id = 52477,
			exp = 100,
			id = 1025,
			name = "富强福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				}
			}
		},
		[1026] = {
			lev = 4,
			camp_id = 52477,
			exp = 100,
			id = 1026,
			name = "和谐福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				}
			}
		},
		[1027] = {
			lev = 5,
			camp_id = 52477,
			exp = 100,
			id = 1027,
			name = "友善福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				}
			}
		},
		[1028] = {
			lev = 6,
			camp_id = 52477,
			exp = 100,
			id = 1028,
			name = "敬业福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				},
				{
					99992,
					30
				}
			}
		},
		[1029] = {
			lev = 7,
			camp_id = 52477,
			exp = 313,
			id = 1029,
			name = "蛇卡",
			limit = 999,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				},
				{
					99992,
					30
				},
				{
					99993,
					30
				}
			}
		}
	},
	[52586] = {
		[1030] = {
			lev = 1,
			camp_id = 52586,
			exp = 100,
			id = 1030,
			name = "爱国福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				}
			}
		},
		[1031] = {
			lev = 2,
			camp_id = 52586,
			exp = 100,
			id = 1031,
			name = "富强福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				}
			}
		},
		[1032] = {
			lev = 4,
			camp_id = 52586,
			exp = 100,
			id = 1032,
			name = "和谐福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				}
			}
		},
		[1033] = {
			lev = 5,
			camp_id = 52586,
			exp = 100,
			id = 1033,
			name = "友善福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				}
			}
		},
		[1034] = {
			lev = 6,
			camp_id = 52586,
			exp = 100,
			id = 1034,
			name = "敬业福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				},
				{
					99992,
					30
				}
			}
		},
		[1035] = {
			lev = 7,
			camp_id = 52586,
			exp = 313,
			id = 1035,
			name = "蛇卡",
			limit = 999,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				},
				{
					99992,
					30
				},
				{
					99993,
					30
				}
			}
		}
	},
	[52643] = {
		[1036] = {
			lev = 1,
			camp_id = 52643,
			exp = 100,
			id = 1036,
			name = "爱国福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				}
			}
		},
		[1037] = {
			lev = 2,
			camp_id = 52643,
			exp = 100,
			id = 1037,
			name = "富强福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				}
			}
		},
		[1038] = {
			lev = 4,
			camp_id = 52643,
			exp = 100,
			id = 1038,
			name = "和谐福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				}
			}
		},
		[1039] = {
			lev = 5,
			camp_id = 52643,
			exp = 100,
			id = 1039,
			name = "友善福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				}
			}
		},
		[1040] = {
			lev = 6,
			camp_id = 52643,
			exp = 100,
			id = 1040,
			name = "敬业福",
			limit = 10,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				},
				{
					99992,
					30
				}
			}
		},
		[1041] = {
			lev = 7,
			camp_id = 52643,
			exp = 313,
			id = 1041,
			name = "蛇卡",
			limit = 999,
			loss = {
				{
					99987,
					30
				},
				{
					99988,
					60
				},
				{
					99989,
					60
				},
				{
					99990,
					30
				},
				{
					99991,
					30
				},
				{
					99992,
					30
				},
				{
					99993,
					30
				}
			}
		}
	}
}
Config.HolidayMakeData.data_make_reward_list_length = 7
Config.HolidayMakeData.data_make_reward_list = {
	[10001] = {
		[1001] = {
			id = 1001,
			group_id = 10001,
			reward = {
				{
					80275,
					1
				}
			}
		},
		[1002] = {
			id = 1002,
			group_id = 10001,
			reward = {
				{
					80276,
					1
				}
			}
		},
		[1003] = {
			id = 1003,
			group_id = 10001,
			reward = {
				{
					80277,
					1
				}
			}
		},
		[1004] = {
			id = 1004,
			group_id = 10001,
			reward = {
				{
					80278,
					1
				}
			}
		},
		[1005] = {
			id = 1005,
			group_id = 10001,
			reward = {
				{
					80279,
					1
				}
			}
		}
	},
	[10002] = {
		[1006] = {
			id = 1006,
			group_id = 10002,
			reward = {
				{
					99950,
					1
				}
			}
		},
		[1007] = {
			id = 1007,
			group_id = 10002,
			reward = {
				{
					99951,
					1
				}
			}
		},
		[1008] = {
			id = 1008,
			group_id = 10002,
			reward = {
				{
					99952,
					1
				}
			}
		},
		[1009] = {
			id = 1009,
			group_id = 10002,
			reward = {
				{
					99953,
					1
				}
			}
		},
		[1010] = {
			id = 1010,
			group_id = 10002,
			reward = {
				{
					99954,
					1
				}
			}
		},
		[1011] = {
			id = 1011,
			group_id = 10002,
			reward = {
				{
					99955,
					1
				}
			}
		}
	},
	[10003] = {
		[1012] = {
			id = 1012,
			group_id = 10003,
			reward = {
				{
					99966,
					1
				}
			}
		},
		[1013] = {
			id = 1013,
			group_id = 10003,
			reward = {
				{
					99967,
					1
				}
			}
		},
		[1014] = {
			id = 1014,
			group_id = 10003,
			reward = {
				{
					99968,
					1
				}
			}
		},
		[1015] = {
			id = 1015,
			group_id = 10003,
			reward = {
				{
					99969,
					1
				}
			}
		},
		[1016] = {
			id = 1016,
			group_id = 10003,
			reward = {
				{
					99970,
					1
				}
			}
		},
		[1017] = {
			id = 1017,
			group_id = 10003,
			reward = {
				{
					99971,
					1
				}
			}
		}
	},
	[10004] = {
		[1018] = {
			id = 1018,
			group_id = 10004,
			reward = {
				{
					99966,
					1
				}
			}
		},
		[1019] = {
			id = 1019,
			group_id = 10004,
			reward = {
				{
					99967,
					1
				}
			}
		},
		[1020] = {
			id = 1020,
			group_id = 10004,
			reward = {
				{
					99968,
					1
				}
			}
		},
		[1021] = {
			id = 1021,
			group_id = 10004,
			reward = {
				{
					99969,
					1
				}
			}
		},
		[1022] = {
			id = 1022,
			group_id = 10004,
			reward = {
				{
					99970,
					1
				}
			}
		},
		[1023] = {
			id = 1023,
			group_id = 10004,
			reward = {
				{
					99971,
					1
				}
			}
		}
	},
	[10005] = {
		[1024] = {
			id = 1024,
			group_id = 10005,
			reward = {
				{
					99995,
					1
				}
			}
		},
		[1025] = {
			id = 1025,
			group_id = 10005,
			reward = {
				{
					99996,
					1
				}
			}
		},
		[1026] = {
			id = 1026,
			group_id = 10005,
			reward = {
				{
					99997,
					1
				}
			}
		},
		[1027] = {
			id = 1027,
			group_id = 10005,
			reward = {
				{
					99998,
					1
				}
			}
		},
		[1028] = {
			id = 1028,
			group_id = 10005,
			reward = {
				{
					99999,
					1
				}
			}
		},
		[1029] = {
			id = 1029,
			group_id = 10005,
			reward = {
				{
					100000,
					1
				}
			}
		}
	},
	[10006] = {
		[1030] = {
			id = 1030,
			group_id = 10006,
			reward = {
				{
					99995,
					1
				}
			}
		},
		[1031] = {
			id = 1031,
			group_id = 10006,
			reward = {
				{
					99996,
					1
				}
			}
		},
		[1032] = {
			id = 1032,
			group_id = 10006,
			reward = {
				{
					99997,
					1
				}
			}
		},
		[1033] = {
			id = 1033,
			group_id = 10006,
			reward = {
				{
					99998,
					1
				}
			}
		},
		[1034] = {
			id = 1034,
			group_id = 10006,
			reward = {
				{
					99999,
					1
				}
			}
		},
		[1035] = {
			id = 1035,
			group_id = 10006,
			reward = {
				{
					100000,
					1
				}
			}
		}
	},
	[10007] = {
		[1036] = {
			id = 1036,
			group_id = 10007,
			reward = {
				{
					99995,
					1
				}
			}
		},
		[1037] = {
			id = 1037,
			group_id = 10007,
			reward = {
				{
					99996,
					1
				}
			}
		},
		[1038] = {
			id = 1038,
			group_id = 10007,
			reward = {
				{
					99997,
					1
				}
			}
		},
		[1039] = {
			id = 1039,
			group_id = 10007,
			reward = {
				{
					99998,
					1
				}
			}
		},
		[1040] = {
			id = 1040,
			group_id = 10007,
			reward = {
				{
					99999,
					1
				}
			}
		},
		[1041] = {
			id = 1041,
			group_id = 10007,
			reward = {
				{
					100000,
					1
				}
			}
		}
	}
}
Config.HolidayMakeData.data_make_lev_list_length = 7
Config.HolidayMakeData.data_make_lev_list = {
	[51641] = {
		{
			name = "无",
			camp_id = 51641,
			lev = 1,
			exp = 0,
			unlock_name = "无",
			reward = {
				{
					39183,
					3
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "咸肉粽",
			camp_id = 51641,
			lev = 2,
			exp = 500,
			unlock_name = "咸肉粽",
			reward = {
				{
					888805,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 51641,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					888805,
					3
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "无",
			camp_id = 51641,
			lev = 4,
			exp = 2000,
			unlock_name = "无",
			reward = {
				{
					888805,
					5
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "板栗肉粽",
			camp_id = 51641,
			lev = 5,
			exp = 3000,
			unlock_name = "板栗肉粽",
			reward = {
				{
					888805,
					8
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "无",
			camp_id = 51641,
			lev = 6,
			exp = 4000,
			unlock_name = "无",
			reward = {
				{
					888805,
					10
				},
				{
					39095,
					80
				},
				{
					3,
					2688
				}
			}
		},
		{
			name = "无",
			camp_id = 51641,
			lev = 7,
			exp = 5000,
			unlock_name = "无",
			reward = {
				{
					888805,
					13
				},
				{
					39095,
					100
				},
				{
					3,
					3288
				}
			}
		},
		{
			name = "蛋黄肉粽",
			camp_id = 51641,
			lev = 8,
			exp = 8000,
			unlock_name = "蛋黄肉粽",
			reward = {
				{
					888805,
					15
				},
				{
					39095,
					120
				},
				{
					3,
					3588
				}
			}
		},
		{
			name = "端午大礼包",
			camp_id = 51641,
			lev = 9,
			exp = 10000,
			unlock_name = "端午大礼包",
			reward = {
				{
					888805,
					18
				},
				{
					39095,
					140
				},
				{
					3,
					3888
				}
			}
		},
		{
			name = "无",
			camp_id = 51641,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					51207,
					1
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	},
	[51782] = {
		{
			name = "船副",
			camp_id = 51782,
			lev = 1,
			exp = 0,
			unlock_name = "船副",
			reward = {
				{
					39095,
					1
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "航海士",
			camp_id = 51782,
			lev = 2,
			exp = 500,
			unlock_name = "航海士",
			reward = {
				{
					541236,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 51782,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					641236,
					1
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "狙击手",
			camp_id = 51782,
			lev = 4,
			exp = 2000,
			unlock_name = "狙击手",
			reward = {
				{
					641236,
					2
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "厨子",
			camp_id = 51782,
			lev = 5,
			exp = 3000,
			unlock_name = "厨子",
			reward = {
				{
					88823,
					4
				},
				{
					39523,
					4
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "船医",
			camp_id = 51782,
			lev = 6,
			exp = 4000,
			unlock_name = "船医",
			reward = {
				{
					88824,
					4
				},
				{
					39524,
					4
				},
				{
					39095,
					80
				},
				{
					3,
					3388
				}
			}
		},
		{
			name = "考古学家",
			camp_id = 51782,
			lev = 7,
			exp = 5000,
			unlock_name = "考古学家",
			reward = {
				{
					88825,
					4
				},
				{
					39525,
					4
				},
				{
					39095,
					100
				},
				{
					3,
					4388
				}
			}
		},
		{
			name = "无",
			camp_id = 51782,
			lev = 8,
			exp = 8000,
			unlock_name = "无",
			reward = {
				{
					88826,
					4
				},
				{
					39526,
					4
				},
				{
					39095,
					120
				},
				{
					3,
					5388
				}
			}
		},
		{
			name = "无",
			camp_id = 51782,
			lev = 9,
			exp = 12000,
			unlock_name = "无",
			reward = {
				{
					88827,
					4
				},
				{
					39527,
					4
				},
				{
					39095,
					140
				},
				{
					3,
					6388
				}
			}
		},
		{
			name = "无",
			camp_id = 51782,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					99957,
					4
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	},
	[52035] = {
		{
			name = "月饼",
			camp_id = 52035,
			lev = 1,
			exp = 0,
			unlock_name = "月饼",
			reward = {
				{
					39095,
					1
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "蛋黄月饼",
			camp_id = 52035,
			lev = 2,
			exp = 500,
			unlock_name = "蛋黄月饼",
			reward = {
				{
					541236,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 52035,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					641236,
					1
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "花生月饼",
			camp_id = 52035,
			lev = 4,
			exp = 2000,
			unlock_name = "花生月饼",
			reward = {
				{
					641236,
					2
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "莲蓉月饼",
			camp_id = 52035,
			lev = 5,
			exp = 3000,
			unlock_name = "莲蓉月饼",
			reward = {
				{
					88823,
					4
				},
				{
					39523,
					4
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "杏仁月饼",
			camp_id = 52035,
			lev = 6,
			exp = 4000,
			unlock_name = "杏仁月饼",
			reward = {
				{
					88824,
					4
				},
				{
					39524,
					4
				},
				{
					39095,
					80
				},
				{
					3,
					3388
				}
			}
		},
		{
			name = "五仁月饼",
			camp_id = 52035,
			lev = 7,
			exp = 5000,
			unlock_name = "五仁月饼",
			reward = {
				{
					88825,
					4
				},
				{
					39525,
					4
				},
				{
					39095,
					100
				},
				{
					3,
					4388
				}
			}
		},
		{
			name = "无",
			camp_id = 52035,
			lev = 8,
			exp = 8000,
			unlock_name = "无",
			reward = {
				{
					88826,
					4
				},
				{
					39526,
					4
				},
				{
					39095,
					120
				},
				{
					3,
					5388
				}
			}
		},
		{
			name = "无",
			camp_id = 52035,
			lev = 9,
			exp = 12000,
			unlock_name = "无",
			reward = {
				{
					88827,
					4
				},
				{
					39527,
					4
				},
				{
					39095,
					140
				},
				{
					3,
					6388
				}
			}
		},
		{
			name = "无",
			camp_id = 52035,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					99957,
					4
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	},
	[52091] = {
		{
			name = "月饼",
			camp_id = 52091,
			lev = 1,
			exp = 0,
			unlock_name = "月饼",
			reward = {
				{
					39095,
					1
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "蛋黄月饼",
			camp_id = 52091,
			lev = 2,
			exp = 500,
			unlock_name = "蛋黄月饼",
			reward = {
				{
					541236,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 52091,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					641236,
					1
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "花生月饼",
			camp_id = 52091,
			lev = 4,
			exp = 2000,
			unlock_name = "花生月饼",
			reward = {
				{
					641236,
					2
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "莲蓉月饼",
			camp_id = 52091,
			lev = 5,
			exp = 3000,
			unlock_name = "莲蓉月饼",
			reward = {
				{
					88823,
					4
				},
				{
					39523,
					4
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "杏仁月饼",
			camp_id = 52091,
			lev = 6,
			exp = 4000,
			unlock_name = "杏仁月饼",
			reward = {
				{
					88824,
					4
				},
				{
					39524,
					4
				},
				{
					39095,
					80
				},
				{
					3,
					3388
				}
			}
		},
		{
			name = "五仁月饼",
			camp_id = 52091,
			lev = 7,
			exp = 5000,
			unlock_name = "五仁月饼",
			reward = {
				{
					88825,
					4
				},
				{
					39525,
					4
				},
				{
					39095,
					100
				},
				{
					3,
					4388
				}
			}
		},
		{
			name = "无",
			camp_id = 52091,
			lev = 8,
			exp = 8000,
			unlock_name = "无",
			reward = {
				{
					88826,
					4
				},
				{
					39526,
					4
				},
				{
					39095,
					120
				},
				{
					3,
					5388
				}
			}
		},
		{
			name = "无",
			camp_id = 52091,
			lev = 9,
			exp = 12000,
			unlock_name = "无",
			reward = {
				{
					88827,
					4
				},
				{
					39527,
					4
				},
				{
					39095,
					140
				},
				{
					3,
					6388
				}
			}
		},
		{
			name = "无",
			camp_id = 52091,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					99957,
					4
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	},
	[52477] = {
		{
			name = "爱国福",
			camp_id = 52477,
			lev = 1,
			exp = 0,
			unlock_name = "爱国福",
			reward = {
				{
					39095,
					1
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "富强福",
			camp_id = 52477,
			lev = 2,
			exp = 500,
			unlock_name = "富强福",
			reward = {
				{
					541236,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 52477,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					641236,
					1
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "和谐福",
			camp_id = 52477,
			lev = 4,
			exp = 2000,
			unlock_name = "和谐福",
			reward = {
				{
					641236,
					2
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "友善福",
			camp_id = 52477,
			lev = 5,
			exp = 3000,
			unlock_name = "友善福",
			reward = {
				{
					88823,
					4
				},
				{
					39523,
					4
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "敬业福",
			camp_id = 52477,
			lev = 6,
			exp = 4000,
			unlock_name = "敬业福",
			reward = {
				{
					88824,
					4
				},
				{
					39524,
					4
				},
				{
					39095,
					80
				},
				{
					3,
					3388
				}
			}
		},
		{
			name = "蛇卡",
			camp_id = 52477,
			lev = 7,
			exp = 5000,
			unlock_name = "蛇卡",
			reward = {
				{
					88825,
					4
				},
				{
					39525,
					4
				},
				{
					39095,
					100
				},
				{
					3,
					4388
				}
			}
		},
		{
			name = "无",
			camp_id = 52477,
			lev = 8,
			exp = 8000,
			unlock_name = "无",
			reward = {
				{
					88826,
					4
				},
				{
					39526,
					4
				},
				{
					39095,
					120
				},
				{
					3,
					5388
				}
			}
		},
		{
			name = "无",
			camp_id = 52477,
			lev = 9,
			exp = 12000,
			unlock_name = "无",
			reward = {
				{
					88827,
					4
				},
				{
					39527,
					4
				},
				{
					39095,
					140
				},
				{
					3,
					6388
				}
			}
		},
		{
			name = "无",
			camp_id = 52477,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					51212,
					1
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	},
	[52586] = {
		{
			name = "爱国福",
			camp_id = 52586,
			lev = 1,
			exp = 0,
			unlock_name = "爱国福",
			reward = {
				{
					39095,
					1
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "富强福",
			camp_id = 52586,
			lev = 2,
			exp = 500,
			unlock_name = "富强福",
			reward = {
				{
					541236,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 52586,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					641236,
					1
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "和谐福",
			camp_id = 52586,
			lev = 4,
			exp = 2000,
			unlock_name = "和谐福",
			reward = {
				{
					641236,
					2
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "友善福",
			camp_id = 52586,
			lev = 5,
			exp = 3000,
			unlock_name = "友善福",
			reward = {
				{
					88823,
					4
				},
				{
					39523,
					4
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "敬业福",
			camp_id = 52586,
			lev = 6,
			exp = 4000,
			unlock_name = "敬业福",
			reward = {
				{
					88824,
					4
				},
				{
					39524,
					4
				},
				{
					39095,
					80
				},
				{
					3,
					3388
				}
			}
		},
		{
			name = "蛇卡",
			camp_id = 52586,
			lev = 7,
			exp = 5000,
			unlock_name = "蛇卡",
			reward = {
				{
					88825,
					4
				},
				{
					39525,
					4
				},
				{
					39095,
					100
				},
				{
					3,
					4388
				}
			}
		},
		{
			name = "无",
			camp_id = 52586,
			lev = 8,
			exp = 8000,
			unlock_name = "无",
			reward = {
				{
					88826,
					4
				},
				{
					39526,
					4
				},
				{
					39095,
					120
				},
				{
					3,
					5388
				}
			}
		},
		{
			name = "无",
			camp_id = 52586,
			lev = 9,
			exp = 12000,
			unlock_name = "无",
			reward = {
				{
					88827,
					4
				},
				{
					39527,
					4
				},
				{
					39095,
					140
				},
				{
					3,
					6388
				}
			}
		},
		{
			name = "无",
			camp_id = 52586,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					51213,
					1
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	},
	[52643] = {
		{
			name = "爱国福",
			camp_id = 52643,
			lev = 1,
			exp = 0,
			unlock_name = "爱国福",
			reward = {
				{
					39095,
					1
				},
				{
					3,
					888
				}
			}
		},
		{
			name = "富强福",
			camp_id = 52643,
			lev = 2,
			exp = 500,
			unlock_name = "富强福",
			reward = {
				{
					541236,
					1
				},
				{
					3,
					1288
				}
			}
		},
		{
			name = "无",
			camp_id = 52643,
			lev = 3,
			exp = 1000,
			unlock_name = "无",
			reward = {
				{
					641236,
					1
				},
				{
					39095,
					20
				},
				{
					3,
					1688
				}
			}
		},
		{
			name = "和谐福",
			camp_id = 52643,
			lev = 4,
			exp = 2000,
			unlock_name = "和谐福",
			reward = {
				{
					641236,
					2
				},
				{
					39095,
					40
				},
				{
					3,
					1888
				}
			}
		},
		{
			name = "友善福",
			camp_id = 52643,
			lev = 5,
			exp = 3000,
			unlock_name = "友善福",
			reward = {
				{
					88823,
					4
				},
				{
					39523,
					4
				},
				{
					39095,
					60
				},
				{
					3,
					2388
				}
			}
		},
		{
			name = "敬业福",
			camp_id = 52643,
			lev = 6,
			exp = 4000,
			unlock_name = "敬业福",
			reward = {
				{
					88824,
					4
				},
				{
					39524,
					4
				},
				{
					39095,
					80
				},
				{
					3,
					3388
				}
			}
		},
		{
			name = "蛇卡",
			camp_id = 52643,
			lev = 7,
			exp = 5000,
			unlock_name = "蛇卡",
			reward = {
				{
					88825,
					4
				},
				{
					39525,
					4
				},
				{
					39095,
					100
				},
				{
					3,
					4388
				}
			}
		},
		{
			name = "无",
			camp_id = 52643,
			lev = 8,
			exp = 8000,
			unlock_name = "无",
			reward = {
				{
					88826,
					4
				},
				{
					39526,
					4
				},
				{
					39095,
					120
				},
				{
					3,
					5388
				}
			}
		},
		{
			name = "无",
			camp_id = 52643,
			lev = 9,
			exp = 12000,
			unlock_name = "无",
			reward = {
				{
					88827,
					4
				},
				{
					39527,
					4
				},
				{
					39095,
					140
				},
				{
					3,
					6388
				}
			}
		},
		{
			name = "无",
			camp_id = 52643,
			lev = 10,
			exp = 15000,
			unlock_name = "无",
			reward = {
				{
					51214,
					1
				},
				{
					888805,
					20
				},
				{
					39095,
					200
				},
				{
					3,
					6666
				}
			}
		}
	}
}
Config.HolidayMakeData.data_collect_list_length = 7
Config.HolidayMakeData.data_collect_list = {
	[51641] = {
		combat_num = 3,
		camp_id = 51641,
		buy_limit = 2,
		desc = "超市大抢购：击败其他抢购的人吧，上好的食材永远属于最强大的人（抢购原来真的是抢么？）",
		award = {
			{
				80269,
				70
			},
			{
				802700,
				140
			},
			{
				80271,
				30
			},
			{
				80280,
				30
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	},
	[51782] = {
		combat_num = 3,
		camp_id = 51782,
		buy_limit = 2,
		desc = "通关关卡获得周年庆典材料，击败他们····",
		award = {
			{
				99943,
				90
			},
			{
				99944,
				170
			},
			{
				99945,
				150
			},
			{
				99946,
				70
			},
			{
				99956,
				10
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	},
	[52035] = {
		combat_num = 3,
		camp_id = 52035,
		buy_limit = 2,
		desc = "超市大抢购：击败其他抢购的人吧，上好的食材永远属于最强大的人（抢购原来真的是抢么？）",
		award = {
			{
				99958,
				90
			},
			{
				99959,
				170
			},
			{
				99960,
				150
			},
			{
				99961,
				70
			},
			{
				99972,
				10
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	},
	[52091] = {
		combat_num = 3,
		camp_id = 52091,
		buy_limit = 2,
		desc = "超市大抢购：击败其他抢购的人吧，上好的食材永远属于最强大的人（抢购原来真的是抢么？）",
		award = {
			{
				99958,
				90
			},
			{
				99959,
				170
			},
			{
				99960,
				150
			},
			{
				99961,
				70
			},
			{
				99972,
				10
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	},
	[52477] = {
		combat_num = 3,
		camp_id = 52477,
		buy_limit = 2,
		desc = "超市大抢购：击败其他抢购的人吧，上好的食材永远属于最强大的人（抢购原来真的是抢么？）",
		award = {
			{
				99987,
				90
			},
			{
				99988,
				170
			},
			{
				99989,
				150
			},
			{
				99990,
				70
			},
			{
				100012,
				10
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	},
	[52586] = {
		combat_num = 3,
		camp_id = 52586,
		buy_limit = 2,
		desc = "超市大抢购：击败其他抢购的人吧，上好的食材永远属于最强大的人（抢购原来真的是抢么？）",
		award = {
			{
				99987,
				90
			},
			{
				99988,
				170
			},
			{
				99989,
				150
			},
			{
				99990,
				70
			},
			{
				100012,
				10
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	},
	[52643] = {
		combat_num = 3,
		camp_id = 52643,
		buy_limit = 2,
		desc = "超市大抢购：击败其他抢购的人吧，上好的食材永远属于最强大的人（抢购原来真的是抢么？）",
		award = {
			{
				99987,
				90
			},
			{
				99988,
				170
			},
			{
				99989,
				150
			},
			{
				99990,
				70
			},
			{
				100012,
				10
			}
		},
		drop_id = {},
		buy_loss = {
			{
				3,
				1000
			}
		}
	}
}
Config.HolidayMakeData.data_master_diff_list_length = 7
Config.HolidayMakeData.data_master_diff_list = {
	[51641] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 51641,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 51641,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 51641,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 51641,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 51641,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 51641,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 51641,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 51641,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 51641,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 51641,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 51641,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 51641,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 51641,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 51641,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 51641,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 51641,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 51641,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 51641,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 51641,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 51641,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 51641,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 51641,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 51641,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 51641,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 51641,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 51641,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 51641,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 51641,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 51641,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 51641,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 51641,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 51641,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 51641,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 51641,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 51641,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 51641,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 51641,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 51641,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 51641,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 51641,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 51641,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 51641,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 51641,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 51641,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 51641,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 51641,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 51641,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 51641,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 51641,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 51641,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 51641,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 51641,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 51641,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 51641,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 51641,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 51641,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 51641,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 51641,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 51641,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 51641,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 51641,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 51641,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 51641,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 51641,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 51641,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 51641,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 51641,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 51641,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 51641,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 51641,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 51641,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 51641,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 51641,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 51641,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 51641,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 51641,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 51641,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 51641,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 51641,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 51641,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 51641,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 51641,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 51641,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 51641,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 51641,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 51641,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 51641,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 51641,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 51641,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 51641,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 51641,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 51641,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 51641,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 51641,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 51641,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 51641,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 51641,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 51641,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 51641,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 51641,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 51641,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 51641,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 51641,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 51641,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 51641,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 51641,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 51641,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 51641,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 51641,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 51641,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 51641,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 51641,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 51641,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 51641,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 51641,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 51641,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 51641,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 51641,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 51641,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 51641,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 51641,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 51641,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 51641,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 51641,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 51641,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 51641,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 51641,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 51641,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 51641,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 51641,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 51641,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 51641,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 51641,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 51641,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 51641,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 51641,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 51641,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 51641,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 51641,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 51641,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 51641,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 51641,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 51641,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 51641,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 51641,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 51641,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 51641,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 51641,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 51641,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 51641,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 51641,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 51641,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 51641,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 51641,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 51641,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 51641,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 51641,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 51641,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 51641,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 51641,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 51641,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 51641,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 51641,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 51641,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 51641,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 51641,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 51641,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 51641,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 51641,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 51641,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 51641,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 51641,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 51641,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 51641,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 51641,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 51641,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 51641,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 51641,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 51641,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 51641,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 51641,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 51641,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 51641,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 51641,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 51641,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 51641,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 51641,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 51641,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 51641,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 51641,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 51641,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 51641,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 51641,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 51641,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 51641,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 51641,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 51641,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 51641,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 51641,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 51641,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 51641,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 51641,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 51641,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 51641,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 51641,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 51641,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 51641,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 51641,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 51641,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 51641,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 51641,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 51641,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 51641,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 51641,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 51641,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 51641,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 51641,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 51641,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 51641,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 51641,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 51641,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 51641,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 51641,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 51641,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 51641,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 51641,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 51641,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 51641,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 51641,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 51641,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 51641,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 51641,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 51641,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 51641,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 51641,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 51641,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 51641,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 51641,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 51641,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 51641,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 51641,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 51641,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 51641,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 51641,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 51641,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 51641,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 51641,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 51641,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 51641,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 51641,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 51641,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 51641,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 51641,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 51641,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 51641,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	},
	[51782] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 51782,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 51782,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 51782,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 51782,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 51782,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 51782,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 51782,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 51782,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 51782,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 51782,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 51782,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 51782,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 51782,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 51782,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 51782,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 51782,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 51782,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 51782,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 51782,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 51782,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 51782,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 51782,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 51782,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 51782,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 51782,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 51782,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 51782,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 51782,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 51782,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 51782,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 51782,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 51782,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 51782,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 51782,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 51782,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 51782,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 51782,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 51782,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 51782,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 51782,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 51782,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 51782,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 51782,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 51782,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 51782,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 51782,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 51782,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 51782,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 51782,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 51782,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 51782,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 51782,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 51782,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 51782,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 51782,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 51782,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 51782,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 51782,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 51782,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 51782,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 51782,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 51782,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 51782,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 51782,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 51782,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 51782,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 51782,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 51782,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 51782,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 51782,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 51782,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 51782,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 51782,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 51782,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 51782,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 51782,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 51782,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 51782,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 51782,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 51782,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 51782,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 51782,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 51782,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 51782,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 51782,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 51782,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 51782,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 51782,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 51782,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 51782,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 51782,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 51782,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 51782,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 51782,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 51782,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 51782,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 51782,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 51782,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 51782,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 51782,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 51782,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 51782,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 51782,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 51782,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 51782,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 51782,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 51782,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 51782,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 51782,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 51782,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 51782,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 51782,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 51782,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 51782,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 51782,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 51782,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 51782,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 51782,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 51782,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 51782,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 51782,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 51782,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 51782,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 51782,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 51782,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 51782,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 51782,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 51782,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 51782,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 51782,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 51782,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 51782,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 51782,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 51782,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 51782,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 51782,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 51782,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 51782,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 51782,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 51782,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 51782,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 51782,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 51782,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 51782,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 51782,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 51782,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 51782,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 51782,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 51782,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 51782,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 51782,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 51782,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 51782,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 51782,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 51782,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 51782,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 51782,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 51782,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 51782,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 51782,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 51782,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 51782,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 51782,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 51782,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 51782,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 51782,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 51782,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 51782,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 51782,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 51782,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 51782,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 51782,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 51782,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 51782,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 51782,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 51782,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 51782,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 51782,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 51782,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 51782,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 51782,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 51782,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 51782,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 51782,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 51782,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 51782,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 51782,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 51782,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 51782,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 51782,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 51782,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 51782,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 51782,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 51782,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 51782,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 51782,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 51782,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 51782,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 51782,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 51782,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 51782,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 51782,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 51782,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 51782,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 51782,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 51782,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 51782,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 51782,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 51782,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 51782,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 51782,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 51782,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 51782,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 51782,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 51782,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 51782,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 51782,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 51782,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 51782,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 51782,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 51782,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 51782,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 51782,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 51782,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 51782,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 51782,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 51782,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 51782,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 51782,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 51782,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 51782,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 51782,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 51782,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 51782,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 51782,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 51782,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 51782,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 51782,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 51782,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 51782,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 51782,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 51782,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 51782,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 51782,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 51782,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 51782,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 51782,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 51782,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 51782,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 51782,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 51782,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 51782,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 51782,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 51782,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 51782,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	},
	[52035] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 52035,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 52035,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 52035,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 52035,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 52035,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 52035,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 52035,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 52035,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 52035,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 52035,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 52035,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 52035,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 52035,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 52035,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 52035,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 52035,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 52035,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 52035,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 52035,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 52035,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 52035,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 52035,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 52035,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 52035,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 52035,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 52035,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 52035,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 52035,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 52035,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 52035,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 52035,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 52035,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 52035,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 52035,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 52035,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 52035,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 52035,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 52035,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 52035,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 52035,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 52035,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 52035,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 52035,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 52035,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 52035,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 52035,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 52035,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 52035,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 52035,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 52035,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 52035,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 52035,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 52035,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 52035,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 52035,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 52035,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 52035,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 52035,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 52035,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 52035,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 52035,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 52035,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 52035,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 52035,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 52035,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 52035,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 52035,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 52035,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 52035,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 52035,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 52035,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 52035,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 52035,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 52035,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 52035,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 52035,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 52035,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 52035,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 52035,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 52035,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 52035,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 52035,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 52035,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 52035,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 52035,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 52035,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 52035,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 52035,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 52035,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 52035,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 52035,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 52035,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 52035,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 52035,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 52035,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 52035,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 52035,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 52035,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 52035,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 52035,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 52035,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 52035,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 52035,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 52035,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 52035,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 52035,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 52035,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 52035,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 52035,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 52035,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 52035,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 52035,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 52035,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 52035,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 52035,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 52035,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 52035,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 52035,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 52035,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 52035,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 52035,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 52035,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 52035,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 52035,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 52035,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 52035,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 52035,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 52035,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 52035,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 52035,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 52035,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 52035,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 52035,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 52035,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 52035,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 52035,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 52035,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 52035,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 52035,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 52035,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 52035,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 52035,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 52035,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 52035,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 52035,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 52035,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 52035,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 52035,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 52035,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 52035,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 52035,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 52035,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 52035,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 52035,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 52035,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 52035,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 52035,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 52035,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 52035,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 52035,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 52035,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 52035,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 52035,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 52035,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 52035,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 52035,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 52035,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 52035,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 52035,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 52035,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 52035,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 52035,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 52035,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 52035,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 52035,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 52035,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 52035,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 52035,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 52035,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 52035,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 52035,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 52035,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 52035,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 52035,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 52035,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 52035,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 52035,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 52035,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 52035,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 52035,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 52035,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 52035,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 52035,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 52035,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 52035,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 52035,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 52035,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 52035,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 52035,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 52035,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 52035,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 52035,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 52035,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 52035,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 52035,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 52035,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 52035,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 52035,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 52035,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 52035,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 52035,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 52035,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 52035,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 52035,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 52035,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 52035,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 52035,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 52035,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 52035,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 52035,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 52035,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 52035,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 52035,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 52035,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 52035,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 52035,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 52035,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 52035,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 52035,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 52035,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 52035,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 52035,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 52035,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 52035,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 52035,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 52035,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 52035,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 52035,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 52035,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 52035,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 52035,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 52035,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 52035,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 52035,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 52035,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 52035,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 52035,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 52035,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 52035,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 52035,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 52035,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 52035,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 52035,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 52035,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 52035,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	},
	[52091] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 52091,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 52091,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 52091,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 52091,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 52091,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 52091,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 52091,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 52091,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 52091,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 52091,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 52091,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 52091,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 52091,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 52091,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 52091,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 52091,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 52091,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 52091,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 52091,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 52091,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 52091,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 52091,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 52091,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 52091,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 52091,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 52091,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 52091,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 52091,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 52091,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 52091,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 52091,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 52091,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 52091,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 52091,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 52091,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 52091,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 52091,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 52091,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 52091,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 52091,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 52091,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 52091,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 52091,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 52091,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 52091,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 52091,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 52091,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 52091,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 52091,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 52091,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 52091,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 52091,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 52091,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 52091,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 52091,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 52091,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 52091,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 52091,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 52091,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 52091,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 52091,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 52091,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 52091,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 52091,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 52091,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 52091,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 52091,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 52091,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 52091,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 52091,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 52091,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 52091,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 52091,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 52091,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 52091,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 52091,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 52091,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 52091,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 52091,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 52091,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 52091,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 52091,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 52091,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 52091,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 52091,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 52091,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 52091,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 52091,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 52091,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 52091,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 52091,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 52091,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 52091,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 52091,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 52091,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 52091,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 52091,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 52091,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 52091,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 52091,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 52091,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 52091,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 52091,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 52091,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 52091,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 52091,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 52091,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 52091,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 52091,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 52091,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 52091,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 52091,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 52091,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 52091,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 52091,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 52091,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 52091,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 52091,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 52091,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 52091,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 52091,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 52091,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 52091,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 52091,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 52091,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 52091,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 52091,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 52091,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 52091,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 52091,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 52091,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 52091,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 52091,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 52091,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 52091,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 52091,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 52091,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 52091,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 52091,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 52091,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 52091,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 52091,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 52091,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 52091,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 52091,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 52091,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 52091,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 52091,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 52091,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 52091,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 52091,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 52091,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 52091,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 52091,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 52091,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 52091,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 52091,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 52091,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 52091,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 52091,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 52091,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 52091,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 52091,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 52091,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 52091,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 52091,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 52091,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 52091,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 52091,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 52091,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 52091,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 52091,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 52091,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 52091,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 52091,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 52091,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 52091,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 52091,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 52091,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 52091,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 52091,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 52091,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 52091,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 52091,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 52091,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 52091,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 52091,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 52091,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 52091,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 52091,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 52091,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 52091,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 52091,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 52091,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 52091,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 52091,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 52091,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 52091,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 52091,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 52091,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 52091,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 52091,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 52091,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 52091,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 52091,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 52091,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 52091,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 52091,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 52091,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 52091,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 52091,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 52091,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 52091,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 52091,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 52091,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 52091,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 52091,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 52091,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 52091,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 52091,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 52091,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 52091,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 52091,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 52091,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 52091,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 52091,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 52091,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 52091,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 52091,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 52091,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 52091,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 52091,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 52091,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 52091,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 52091,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 52091,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 52091,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 52091,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 52091,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 52091,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 52091,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 52091,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 52091,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 52091,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 52091,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 52091,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 52091,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 52091,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 52091,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 52091,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 52091,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 52091,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 52091,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 52091,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 52091,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	},
	[52477] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 52477,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 52477,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 52477,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 52477,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 52477,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 52477,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 52477,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 52477,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 52477,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 52477,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 52477,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 52477,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 52477,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 52477,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 52477,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 52477,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 52477,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 52477,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 52477,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 52477,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 52477,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 52477,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 52477,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 52477,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 52477,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 52477,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 52477,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 52477,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 52477,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 52477,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 52477,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 52477,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 52477,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 52477,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 52477,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 52477,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 52477,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 52477,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 52477,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 52477,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 52477,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 52477,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 52477,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 52477,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 52477,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 52477,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 52477,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 52477,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 52477,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 52477,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 52477,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 52477,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 52477,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 52477,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 52477,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 52477,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 52477,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 52477,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 52477,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 52477,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 52477,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 52477,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 52477,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 52477,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 52477,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 52477,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 52477,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 52477,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 52477,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 52477,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 52477,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 52477,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 52477,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 52477,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 52477,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 52477,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 52477,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 52477,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 52477,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 52477,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 52477,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 52477,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 52477,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 52477,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 52477,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 52477,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 52477,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 52477,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 52477,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 52477,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 52477,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 52477,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 52477,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 52477,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 52477,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 52477,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 52477,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 52477,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 52477,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 52477,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 52477,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 52477,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 52477,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 52477,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 52477,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 52477,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 52477,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 52477,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 52477,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 52477,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 52477,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 52477,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 52477,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 52477,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 52477,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 52477,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 52477,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 52477,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 52477,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 52477,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 52477,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 52477,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 52477,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 52477,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 52477,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 52477,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 52477,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 52477,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 52477,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 52477,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 52477,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 52477,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 52477,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 52477,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 52477,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 52477,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 52477,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 52477,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 52477,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 52477,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 52477,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 52477,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 52477,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 52477,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 52477,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 52477,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 52477,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 52477,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 52477,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 52477,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 52477,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 52477,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 52477,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 52477,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 52477,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 52477,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 52477,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 52477,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 52477,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 52477,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 52477,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 52477,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 52477,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 52477,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 52477,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 52477,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 52477,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 52477,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 52477,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 52477,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 52477,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 52477,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 52477,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 52477,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 52477,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 52477,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 52477,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 52477,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 52477,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 52477,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 52477,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 52477,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 52477,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 52477,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 52477,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 52477,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 52477,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 52477,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 52477,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 52477,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 52477,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 52477,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 52477,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 52477,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 52477,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 52477,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 52477,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 52477,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 52477,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 52477,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 52477,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 52477,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 52477,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 52477,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 52477,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 52477,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 52477,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 52477,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 52477,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 52477,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 52477,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 52477,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 52477,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 52477,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 52477,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 52477,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 52477,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 52477,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 52477,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 52477,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 52477,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 52477,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 52477,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 52477,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 52477,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 52477,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 52477,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 52477,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 52477,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 52477,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 52477,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 52477,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 52477,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 52477,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 52477,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 52477,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 52477,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 52477,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 52477,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 52477,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 52477,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 52477,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 52477,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 52477,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 52477,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 52477,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 52477,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 52477,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 52477,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 52477,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 52477,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 52477,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 52477,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 52477,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 52477,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	},
	[52586] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 52586,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 52586,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 52586,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 52586,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 52586,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 52586,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 52586,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 52586,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 52586,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 52586,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 52586,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 52586,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 52586,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 52586,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 52586,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 52586,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 52586,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 52586,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 52586,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 52586,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 52586,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 52586,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 52586,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 52586,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 52586,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 52586,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 52586,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 52586,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 52586,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 52586,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 52586,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 52586,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 52586,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 52586,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 52586,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 52586,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 52586,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 52586,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 52586,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 52586,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 52586,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 52586,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 52586,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 52586,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 52586,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 52586,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 52586,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 52586,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 52586,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 52586,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 52586,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 52586,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 52586,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 52586,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 52586,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 52586,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 52586,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 52586,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 52586,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 52586,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 52586,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 52586,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 52586,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 52586,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 52586,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 52586,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 52586,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 52586,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 52586,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 52586,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 52586,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 52586,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 52586,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 52586,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 52586,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 52586,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 52586,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 52586,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 52586,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 52586,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 52586,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 52586,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 52586,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 52586,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 52586,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 52586,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 52586,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 52586,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 52586,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 52586,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 52586,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 52586,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 52586,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 52586,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 52586,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 52586,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 52586,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 52586,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 52586,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 52586,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 52586,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 52586,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 52586,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 52586,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 52586,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 52586,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 52586,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 52586,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 52586,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 52586,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 52586,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 52586,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 52586,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 52586,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 52586,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 52586,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 52586,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 52586,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 52586,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 52586,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 52586,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 52586,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 52586,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 52586,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 52586,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 52586,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 52586,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 52586,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 52586,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 52586,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 52586,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 52586,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 52586,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 52586,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 52586,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 52586,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 52586,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 52586,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 52586,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 52586,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 52586,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 52586,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 52586,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 52586,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 52586,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 52586,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 52586,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 52586,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 52586,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 52586,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 52586,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 52586,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 52586,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 52586,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 52586,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 52586,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 52586,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 52586,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 52586,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 52586,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 52586,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 52586,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 52586,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 52586,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 52586,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 52586,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 52586,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 52586,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 52586,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 52586,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 52586,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 52586,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 52586,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 52586,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 52586,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 52586,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 52586,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 52586,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 52586,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 52586,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 52586,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 52586,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 52586,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 52586,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 52586,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 52586,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 52586,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 52586,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 52586,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 52586,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 52586,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 52586,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 52586,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 52586,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 52586,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 52586,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 52586,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 52586,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 52586,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 52586,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 52586,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 52586,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 52586,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 52586,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 52586,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 52586,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 52586,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 52586,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 52586,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 52586,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 52586,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 52586,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 52586,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 52586,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 52586,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 52586,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 52586,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 52586,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 52586,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 52586,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 52586,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 52586,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 52586,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 52586,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 52586,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 52586,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 52586,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 52586,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 52586,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 52586,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 52586,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 52586,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 52586,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 52586,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 52586,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 52586,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 52586,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 52586,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 52586,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 52586,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 52586,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 52586,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 52586,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 52586,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 52586,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 52586,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 52586,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 52586,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 52586,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 52586,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 52586,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 52586,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 52586,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 52586,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 52586,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	},
	[52643] = {
		{
			recommend = 3425,
			min = 1,
			camp_id = 52643,
			id = 1,
			unit_id = 89000,
			max = 3425
		},
		{
			recommend = 3670,
			min = 3426,
			camp_id = 52643,
			id = 2,
			unit_id = 89001,
			max = 3670
		},
		{
			recommend = 3925,
			min = 3671,
			camp_id = 52643,
			id = 3,
			unit_id = 89002,
			max = 3925
		},
		{
			recommend = 4185,
			min = 3926,
			camp_id = 52643,
			id = 4,
			unit_id = 89003,
			max = 4185
		},
		{
			recommend = 4445,
			min = 4186,
			camp_id = 52643,
			id = 5,
			unit_id = 89004,
			max = 4445
		},
		{
			recommend = 4740,
			min = 4446,
			camp_id = 52643,
			id = 6,
			unit_id = 89005,
			max = 4740
		},
		{
			recommend = 4990,
			min = 4741,
			camp_id = 52643,
			id = 7,
			unit_id = 89006,
			max = 4990
		},
		{
			recommend = 5245,
			min = 4991,
			camp_id = 52643,
			id = 8,
			unit_id = 89007,
			max = 5245
		},
		{
			recommend = 5505,
			min = 5246,
			camp_id = 52643,
			id = 9,
			unit_id = 89008,
			max = 5505
		},
		{
			recommend = 5760,
			min = 5506,
			camp_id = 52643,
			id = 10,
			unit_id = 89009,
			max = 5760
		},
		{
			recommend = 6220,
			min = 5761,
			camp_id = 52643,
			id = 11,
			unit_id = 89010,
			max = 6220
		},
		{
			recommend = 6720,
			min = 6221,
			camp_id = 52643,
			id = 12,
			unit_id = 89011,
			max = 6720
		},
		{
			recommend = 7185,
			min = 6721,
			camp_id = 52643,
			id = 13,
			unit_id = 89012,
			max = 7185
		},
		{
			recommend = 7715,
			min = 7186,
			camp_id = 52643,
			id = 14,
			unit_id = 89013,
			max = 7715
		},
		{
			recommend = 8245,
			min = 7716,
			camp_id = 52643,
			id = 15,
			unit_id = 89014,
			max = 8245
		},
		{
			recommend = 8820,
			min = 8246,
			camp_id = 52643,
			id = 16,
			unit_id = 89015,
			max = 8820
		},
		{
			recommend = 9360,
			min = 8821,
			camp_id = 52643,
			id = 17,
			unit_id = 89016,
			max = 9360
		},
		{
			recommend = 9960,
			min = 9361,
			camp_id = 52643,
			id = 18,
			unit_id = 89017,
			max = 9960
		},
		{
			recommend = 10565,
			min = 9961,
			camp_id = 52643,
			id = 19,
			unit_id = 89018,
			max = 10565
		},
		{
			recommend = 11185,
			min = 10566,
			camp_id = 52643,
			id = 20,
			unit_id = 89019,
			max = 11185
		},
		{
			recommend = 13635,
			min = 11186,
			camp_id = 52643,
			id = 21,
			unit_id = 89020,
			max = 13635
		},
		{
			recommend = 14360,
			min = 13636,
			camp_id = 52643,
			id = 22,
			unit_id = 89021,
			max = 14360
		},
		{
			recommend = 15055,
			min = 14361,
			camp_id = 52643,
			id = 23,
			unit_id = 89022,
			max = 15055
		},
		{
			recommend = 15790,
			min = 15056,
			camp_id = 52643,
			id = 24,
			unit_id = 89023,
			max = 15790
		},
		{
			recommend = 16520,
			min = 15791,
			camp_id = 52643,
			id = 25,
			unit_id = 89024,
			max = 16520
		},
		{
			recommend = 17325,
			min = 16521,
			camp_id = 52643,
			id = 26,
			unit_id = 89025,
			max = 17325
		},
		{
			recommend = 18090,
			min = 17326,
			camp_id = 52643,
			id = 27,
			unit_id = 89026,
			max = 18090
		},
		{
			recommend = 18900,
			min = 18091,
			camp_id = 52643,
			id = 28,
			unit_id = 89027,
			max = 18900
		},
		{
			recommend = 19730,
			min = 18901,
			camp_id = 52643,
			id = 29,
			unit_id = 89028,
			max = 19730
		},
		{
			recommend = 20550,
			min = 19731,
			camp_id = 52643,
			id = 30,
			unit_id = 89029,
			max = 20550
		},
		{
			recommend = 23830,
			min = 20551,
			camp_id = 52643,
			id = 31,
			unit_id = 89030,
			max = 23830
		},
		{
			recommend = 24280,
			min = 23831,
			camp_id = 52643,
			id = 32,
			unit_id = 89031,
			max = 24280
		},
		{
			recommend = 24760,
			min = 24281,
			camp_id = 52643,
			id = 33,
			unit_id = 89032,
			max = 24760
		},
		{
			recommend = 25235,
			min = 24761,
			camp_id = 52643,
			id = 34,
			unit_id = 89033,
			max = 25235
		},
		{
			recommend = 25695,
			min = 25236,
			camp_id = 52643,
			id = 35,
			unit_id = 89034,
			max = 25695
		},
		{
			recommend = 26165,
			min = 25696,
			camp_id = 52643,
			id = 36,
			unit_id = 89035,
			max = 26165
		},
		{
			recommend = 26615,
			min = 26166,
			camp_id = 52643,
			id = 37,
			unit_id = 89036,
			max = 26615
		},
		{
			recommend = 27070,
			min = 26616,
			camp_id = 52643,
			id = 38,
			unit_id = 89037,
			max = 27070
		},
		{
			recommend = 27570,
			min = 27071,
			camp_id = 52643,
			id = 39,
			unit_id = 89038,
			max = 27570
		},
		{
			recommend = 28020,
			min = 27571,
			camp_id = 52643,
			id = 40,
			unit_id = 89039,
			max = 28020
		},
		{
			recommend = 33215,
			min = 28021,
			camp_id = 52643,
			id = 41,
			unit_id = 89040,
			max = 33215
		},
		{
			recommend = 33730,
			min = 33216,
			camp_id = 52643,
			id = 42,
			unit_id = 89041,
			max = 33730
		},
		{
			recommend = 34215,
			min = 33731,
			camp_id = 52643,
			id = 43,
			unit_id = 89042,
			max = 34215
		},
		{
			recommend = 34720,
			min = 34216,
			camp_id = 52643,
			id = 44,
			unit_id = 89043,
			max = 34720
		},
		{
			recommend = 35205,
			min = 34721,
			camp_id = 52643,
			id = 45,
			unit_id = 89044,
			max = 35205
		},
		{
			recommend = 35700,
			min = 35206,
			camp_id = 52643,
			id = 46,
			unit_id = 89045,
			max = 35700
		},
		{
			recommend = 36230,
			min = 35701,
			camp_id = 52643,
			id = 47,
			unit_id = 89046,
			max = 36230
		},
		{
			recommend = 36725,
			min = 36231,
			camp_id = 52643,
			id = 48,
			unit_id = 89047,
			max = 36725
		},
		{
			recommend = 37210,
			min = 36726,
			camp_id = 52643,
			id = 49,
			unit_id = 89048,
			max = 37210
		},
		{
			recommend = 37705,
			min = 37211,
			camp_id = 52643,
			id = 50,
			unit_id = 89049,
			max = 37705
		},
		{
			recommend = 41730,
			min = 37706,
			camp_id = 52643,
			id = 51,
			unit_id = 89050,
			max = 41730
		},
		{
			recommend = 42260,
			min = 41731,
			camp_id = 52643,
			id = 52,
			unit_id = 89051,
			max = 42260
		},
		{
			recommend = 42790,
			min = 42261,
			camp_id = 52643,
			id = 53,
			unit_id = 89052,
			max = 42790
		},
		{
			recommend = 43320,
			min = 42791,
			camp_id = 52643,
			id = 54,
			unit_id = 89053,
			max = 43320
		},
		{
			recommend = 43895,
			min = 43321,
			camp_id = 52643,
			id = 55,
			unit_id = 89054,
			max = 43895
		},
		{
			recommend = 44420,
			min = 43896,
			camp_id = 52643,
			id = 56,
			unit_id = 89055,
			max = 44420
		},
		{
			recommend = 44950,
			min = 44421,
			camp_id = 52643,
			id = 57,
			unit_id = 89056,
			max = 44950
		},
		{
			recommend = 45480,
			min = 44951,
			camp_id = 52643,
			id = 58,
			unit_id = 89057,
			max = 45480
		},
		{
			recommend = 46015,
			min = 45481,
			camp_id = 52643,
			id = 59,
			unit_id = 89058,
			max = 46015
		},
		{
			recommend = 46585,
			min = 46016,
			camp_id = 52643,
			id = 60,
			unit_id = 89059,
			max = 46585
		},
		{
			recommend = 52595,
			min = 46586,
			camp_id = 52643,
			id = 61,
			unit_id = 89060,
			max = 52595
		},
		{
			recommend = 53170,
			min = 52596,
			camp_id = 52643,
			id = 62,
			unit_id = 89061,
			max = 53170
		},
		{
			recommend = 53785,
			min = 53171,
			camp_id = 52643,
			id = 63,
			unit_id = 89062,
			max = 53785
		},
		{
			recommend = 54360,
			min = 53786,
			camp_id = 52643,
			id = 64,
			unit_id = 89063,
			max = 54360
		},
		{
			recommend = 54930,
			min = 54361,
			camp_id = 52643,
			id = 65,
			unit_id = 89064,
			max = 54930
		},
		{
			recommend = 55505,
			min = 54931,
			camp_id = 52643,
			id = 66,
			unit_id = 89065,
			max = 55505
		},
		{
			recommend = 56095,
			min = 55506,
			camp_id = 52643,
			id = 67,
			unit_id = 89066,
			max = 56095
		},
		{
			recommend = 56705,
			min = 56096,
			camp_id = 52643,
			id = 68,
			unit_id = 89067,
			max = 56705
		},
		{
			recommend = 57285,
			min = 56706,
			camp_id = 52643,
			id = 69,
			unit_id = 89068,
			max = 57285
		},
		{
			recommend = 57870,
			min = 57286,
			camp_id = 52643,
			id = 70,
			unit_id = 89069,
			max = 57870
		},
		{
			recommend = 58445,
			min = 57871,
			camp_id = 52643,
			id = 71,
			unit_id = 89070,
			max = 58445
		},
		{
			recommend = 59010,
			min = 58446,
			camp_id = 52643,
			id = 72,
			unit_id = 89071,
			max = 59010
		},
		{
			recommend = 59635,
			min = 59011,
			camp_id = 52643,
			id = 73,
			unit_id = 89072,
			max = 59635
		},
		{
			recommend = 60210,
			min = 59636,
			camp_id = 52643,
			id = 74,
			unit_id = 89073,
			max = 60210
		},
		{
			recommend = 60780,
			min = 60211,
			camp_id = 52643,
			id = 75,
			unit_id = 89074,
			max = 60780
		},
		{
			recommend = 61355,
			min = 60781,
			camp_id = 52643,
			id = 76,
			unit_id = 89075,
			max = 61355
		},
		{
			recommend = 61940,
			min = 61356,
			camp_id = 52643,
			id = 77,
			unit_id = 89076,
			max = 61940
		},
		{
			recommend = 62550,
			min = 61941,
			camp_id = 52643,
			id = 78,
			unit_id = 89077,
			max = 62550
		},
		{
			recommend = 63130,
			min = 62551,
			camp_id = 52643,
			id = 79,
			unit_id = 89078,
			max = 63130
		},
		{
			recommend = 63715,
			min = 63131,
			camp_id = 52643,
			id = 80,
			unit_id = 89079,
			max = 63715
		},
		{
			recommend = 70110,
			min = 63716,
			camp_id = 52643,
			id = 81,
			unit_id = 89080,
			max = 70110
		},
		{
			recommend = 76335,
			min = 70111,
			camp_id = 52643,
			id = 82,
			unit_id = 89081,
			max = 76335
		},
		{
			recommend = 76970,
			min = 76336,
			camp_id = 52643,
			id = 83,
			unit_id = 89082,
			max = 76970
		},
		{
			recommend = 77590,
			min = 76971,
			camp_id = 52643,
			id = 84,
			unit_id = 89083,
			max = 77590
		},
		{
			recommend = 78235,
			min = 77591,
			camp_id = 52643,
			id = 85,
			unit_id = 89084,
			max = 78235
		},
		{
			recommend = 78895,
			min = 78236,
			camp_id = 52643,
			id = 86,
			unit_id = 89085,
			max = 78895
		},
		{
			recommend = 79530,
			min = 78896,
			camp_id = 52643,
			id = 87,
			unit_id = 89086,
			max = 79530
		},
		{
			recommend = 80165,
			min = 79531,
			camp_id = 52643,
			id = 88,
			unit_id = 89087,
			max = 80165
		},
		{
			recommend = 80795,
			min = 80166,
			camp_id = 52643,
			id = 89,
			unit_id = 89088,
			max = 80795
		},
		{
			recommend = 81425,
			min = 80796,
			camp_id = 52643,
			id = 90,
			unit_id = 89089,
			max = 81425
		},
		{
			recommend = 82090,
			min = 81426,
			camp_id = 52643,
			id = 91,
			unit_id = 89090,
			max = 82090
		},
		{
			recommend = 82720,
			min = 82091,
			camp_id = 52643,
			id = 92,
			unit_id = 89091,
			max = 82720
		},
		{
			recommend = 83350,
			min = 82721,
			camp_id = 52643,
			id = 93,
			unit_id = 89092,
			max = 83350
		},
		{
			recommend = 83975,
			min = 83351,
			camp_id = 52643,
			id = 94,
			unit_id = 89093,
			max = 83975
		},
		{
			recommend = 84620,
			min = 83976,
			camp_id = 52643,
			id = 95,
			unit_id = 89094,
			max = 84620
		},
		{
			recommend = 85280,
			min = 84621,
			camp_id = 52643,
			id = 96,
			unit_id = 89095,
			max = 85280
		},
		{
			recommend = 85910,
			min = 85281,
			camp_id = 52643,
			id = 97,
			unit_id = 89096,
			max = 85910
		},
		{
			recommend = 86545,
			min = 85911,
			camp_id = 52643,
			id = 98,
			unit_id = 89097,
			max = 86545
		},
		{
			recommend = 87180,
			min = 86546,
			camp_id = 52643,
			id = 99,
			unit_id = 89098,
			max = 87180
		},
		{
			recommend = 96600,
			min = 87181,
			camp_id = 52643,
			id = 100,
			unit_id = 89099,
			max = 96600
		},
		{
			recommend = 132360,
			min = 96601,
			camp_id = 52643,
			id = 101,
			unit_id = 89100,
			max = 132360
		},
		{
			recommend = 133330,
			min = 132361,
			camp_id = 52643,
			id = 102,
			unit_id = 89101,
			max = 133330
		},
		{
			recommend = 134340,
			min = 133331,
			camp_id = 52643,
			id = 103,
			unit_id = 89102,
			max = 134340
		},
		{
			recommend = 135345,
			min = 134341,
			camp_id = 52643,
			id = 104,
			unit_id = 89103,
			max = 135345
		},
		{
			recommend = 136320,
			min = 135346,
			camp_id = 52643,
			id = 105,
			unit_id = 89104,
			max = 136320
		},
		{
			recommend = 137335,
			min = 136321,
			camp_id = 52643,
			id = 106,
			unit_id = 89105,
			max = 137335
		},
		{
			recommend = 138345,
			min = 137336,
			camp_id = 52643,
			id = 107,
			unit_id = 89106,
			max = 138345
		},
		{
			recommend = 139350,
			min = 138346,
			camp_id = 52643,
			id = 108,
			unit_id = 89107,
			max = 139350
		},
		{
			recommend = 140325,
			min = 139351,
			camp_id = 52643,
			id = 109,
			unit_id = 89108,
			max = 140325
		},
		{
			recommend = 141330,
			min = 140326,
			camp_id = 52643,
			id = 110,
			unit_id = 89109,
			max = 141330
		},
		{
			recommend = 142340,
			min = 141331,
			camp_id = 52643,
			id = 111,
			unit_id = 89110,
			max = 142340
		},
		{
			recommend = 143325,
			min = 142341,
			camp_id = 52643,
			id = 112,
			unit_id = 89111,
			max = 143325
		},
		{
			recommend = 144330,
			min = 143326,
			camp_id = 52643,
			id = 113,
			unit_id = 89112,
			max = 144330
		},
		{
			recommend = 145345,
			min = 144331,
			camp_id = 52643,
			id = 114,
			unit_id = 89113,
			max = 145345
		},
		{
			recommend = 146340,
			min = 145346,
			camp_id = 52643,
			id = 115,
			unit_id = 89114,
			max = 146340
		},
		{
			recommend = 147315,
			min = 146341,
			camp_id = 52643,
			id = 116,
			unit_id = 89115,
			max = 147315
		},
		{
			recommend = 148325,
			min = 147316,
			camp_id = 52643,
			id = 117,
			unit_id = 89116,
			max = 148325
		},
		{
			recommend = 149330,
			min = 148326,
			camp_id = 52643,
			id = 118,
			unit_id = 89117,
			max = 149330
		},
		{
			recommend = 150345,
			min = 149331,
			camp_id = 52643,
			id = 119,
			unit_id = 89118,
			max = 150345
		},
		{
			recommend = 151320,
			min = 150346,
			camp_id = 52643,
			id = 120,
			unit_id = 89119,
			max = 151320
		},
		{
			recommend = 159375,
			min = 151321,
			camp_id = 52643,
			id = 121,
			unit_id = 89120,
			max = 159375
		},
		{
			recommend = 160400,
			min = 159376,
			camp_id = 52643,
			id = 122,
			unit_id = 89121,
			max = 160400
		},
		{
			recommend = 161400,
			min = 160401,
			camp_id = 52643,
			id = 123,
			unit_id = 89122,
			max = 161400
		},
		{
			recommend = 162430,
			min = 161401,
			camp_id = 52643,
			id = 124,
			unit_id = 89123,
			max = 162430
		},
		{
			recommend = 163460,
			min = 162431,
			camp_id = 52643,
			id = 125,
			unit_id = 89124,
			max = 163460
		},
		{
			recommend = 164490,
			min = 163461,
			camp_id = 52643,
			id = 126,
			unit_id = 89125,
			max = 164490
		},
		{
			recommend = 165490,
			min = 164491,
			camp_id = 52643,
			id = 127,
			unit_id = 89126,
			max = 165490
		},
		{
			recommend = 166520,
			min = 165491,
			camp_id = 52643,
			id = 128,
			unit_id = 89127,
			max = 166520
		},
		{
			recommend = 167550,
			min = 166521,
			camp_id = 52643,
			id = 129,
			unit_id = 89128,
			max = 167550
		},
		{
			recommend = 168535,
			min = 167551,
			camp_id = 52643,
			id = 130,
			unit_id = 89129,
			max = 168535
		},
		{
			recommend = 169575,
			min = 168536,
			camp_id = 52643,
			id = 131,
			unit_id = 89130,
			max = 169575
		},
		{
			recommend = 170610,
			min = 169576,
			camp_id = 52643,
			id = 132,
			unit_id = 89131,
			max = 170610
		},
		{
			recommend = 171640,
			min = 170611,
			camp_id = 52643,
			id = 133,
			unit_id = 89132,
			max = 171640
		},
		{
			recommend = 172635,
			min = 171641,
			camp_id = 52643,
			id = 134,
			unit_id = 89133,
			max = 172635
		},
		{
			recommend = 173670,
			min = 172636,
			camp_id = 52643,
			id = 135,
			unit_id = 89134,
			max = 173670
		},
		{
			recommend = 174700,
			min = 173671,
			camp_id = 52643,
			id = 136,
			unit_id = 89135,
			max = 174700
		},
		{
			recommend = 175695,
			min = 174701,
			camp_id = 52643,
			id = 137,
			unit_id = 89136,
			max = 175695
		},
		{
			recommend = 176730,
			min = 175696,
			camp_id = 52643,
			id = 138,
			unit_id = 89137,
			max = 176730
		},
		{
			recommend = 177760,
			min = 176731,
			camp_id = 52643,
			id = 139,
			unit_id = 89138,
			max = 177760
		},
		{
			recommend = 178790,
			min = 177761,
			camp_id = 52643,
			id = 140,
			unit_id = 89139,
			max = 178790
		},
		{
			recommend = 194455,
			min = 178791,
			camp_id = 52643,
			id = 141,
			unit_id = 89140,
			max = 194455
		},
		{
			recommend = 195510,
			min = 194456,
			camp_id = 52643,
			id = 142,
			unit_id = 89141,
			max = 195510
		},
		{
			recommend = 196555,
			min = 195511,
			camp_id = 52643,
			id = 143,
			unit_id = 89142,
			max = 196555
		},
		{
			recommend = 197595,
			min = 196556,
			camp_id = 52643,
			id = 144,
			unit_id = 89143,
			max = 197595
		},
		{
			recommend = 198610,
			min = 197596,
			camp_id = 52643,
			id = 145,
			unit_id = 89144,
			max = 198610
		},
		{
			recommend = 251110,
			min = 198611,
			camp_id = 52643,
			id = 146,
			unit_id = 89145,
			max = 251110
		},
		{
			recommend = 252520,
			min = 251111,
			camp_id = 52643,
			id = 147,
			unit_id = 89146,
			max = 252520
		},
		{
			recommend = 253885,
			min = 252521,
			camp_id = 52643,
			id = 148,
			unit_id = 89147,
			max = 253885
		},
		{
			recommend = 255295,
			min = 253886,
			camp_id = 52643,
			id = 149,
			unit_id = 89148,
			max = 255295
		},
		{
			recommend = 256705,
			min = 255296,
			camp_id = 52643,
			id = 150,
			unit_id = 89149,
			max = 256705
		},
		{
			recommend = 269825,
			min = 256706,
			camp_id = 52643,
			id = 151,
			unit_id = 89150,
			max = 269825
		},
		{
			recommend = 271290,
			min = 269826,
			camp_id = 52643,
			id = 152,
			unit_id = 89151,
			max = 271290
		},
		{
			recommend = 272745,
			min = 271291,
			camp_id = 52643,
			id = 153,
			unit_id = 89152,
			max = 272745
		},
		{
			recommend = 274210,
			min = 272746,
			camp_id = 52643,
			id = 154,
			unit_id = 89153,
			max = 274210
		},
		{
			recommend = 275660,
			min = 274211,
			camp_id = 52643,
			id = 155,
			unit_id = 89154,
			max = 275660
		},
		{
			recommend = 277125,
			min = 275661,
			camp_id = 52643,
			id = 156,
			unit_id = 89155,
			max = 277125
		},
		{
			recommend = 278590,
			min = 277126,
			camp_id = 52643,
			id = 157,
			unit_id = 89156,
			max = 278590
		},
		{
			recommend = 280030,
			min = 278591,
			camp_id = 52643,
			id = 158,
			unit_id = 89157,
			max = 280030
		},
		{
			recommend = 281490,
			min = 280031,
			camp_id = 52643,
			id = 159,
			unit_id = 89158,
			max = 281490
		},
		{
			recommend = 282970,
			min = 281491,
			camp_id = 52643,
			id = 160,
			unit_id = 89159,
			max = 282970
		},
		{
			recommend = 297670,
			min = 282971,
			camp_id = 52643,
			id = 161,
			unit_id = 89160,
			max = 297670
		},
		{
			recommend = 299150,
			min = 297671,
			camp_id = 52643,
			id = 162,
			unit_id = 89161,
			max = 299150
		},
		{
			recommend = 300635,
			min = 299151,
			camp_id = 52643,
			id = 163,
			unit_id = 89162,
			max = 300635
		},
		{
			recommend = 302130,
			min = 300636,
			camp_id = 52643,
			id = 164,
			unit_id = 89163,
			max = 302130
		},
		{
			recommend = 303615,
			min = 302131,
			camp_id = 52643,
			id = 165,
			unit_id = 89164,
			max = 303615
		},
		{
			recommend = 397310,
			min = 303616,
			camp_id = 52643,
			id = 166,
			unit_id = 89165,
			max = 397310
		},
		{
			recommend = 399360,
			min = 397311,
			camp_id = 52643,
			id = 167,
			unit_id = 89166,
			max = 399360
		},
		{
			recommend = 401415,
			min = 399361,
			camp_id = 52643,
			id = 168,
			unit_id = 89167,
			max = 401415
		},
		{
			recommend = 403465,
			min = 401416,
			camp_id = 52643,
			id = 169,
			unit_id = 89168,
			max = 403465
		},
		{
			recommend = 405470,
			min = 403466,
			camp_id = 52643,
			id = 170,
			unit_id = 89169,
			max = 405470
		},
		{
			recommend = 407515,
			min = 405471,
			camp_id = 52643,
			id = 171,
			unit_id = 89170,
			max = 407515
		},
		{
			recommend = 409570,
			min = 407516,
			camp_id = 52643,
			id = 172,
			unit_id = 89171,
			max = 409570
		},
		{
			recommend = 411620,
			min = 409571,
			camp_id = 52643,
			id = 173,
			unit_id = 89172,
			max = 411620
		},
		{
			recommend = 413655,
			min = 411621,
			camp_id = 52643,
			id = 174,
			unit_id = 89173,
			max = 413655
		},
		{
			recommend = 415710,
			min = 413656,
			camp_id = 52643,
			id = 175,
			unit_id = 89174,
			max = 415710
		},
		{
			recommend = 417760,
			min = 415711,
			camp_id = 52643,
			id = 176,
			unit_id = 89175,
			max = 417760
		},
		{
			recommend = 419805,
			min = 417761,
			camp_id = 52643,
			id = 177,
			unit_id = 89176,
			max = 419805
		},
		{
			recommend = 421845,
			min = 419806,
			camp_id = 52643,
			id = 178,
			unit_id = 89177,
			max = 421845
		},
		{
			recommend = 423895,
			min = 421846,
			camp_id = 52643,
			id = 179,
			unit_id = 89178,
			max = 423895
		},
		{
			recommend = 425935,
			min = 423896,
			camp_id = 52643,
			id = 180,
			unit_id = 89179,
			max = 425935
		},
		{
			recommend = 442365,
			min = 425936,
			camp_id = 52643,
			id = 181,
			unit_id = 89180,
			max = 442365
		},
		{
			recommend = 444430,
			min = 442366,
			camp_id = 52643,
			id = 182,
			unit_id = 89181,
			max = 444430
		},
		{
			recommend = 446505,
			min = 444431,
			camp_id = 52643,
			id = 183,
			unit_id = 89182,
			max = 446505
		},
		{
			recommend = 448585,
			min = 446506,
			camp_id = 52643,
			id = 184,
			unit_id = 89183,
			max = 448585
		},
		{
			recommend = 450680,
			min = 448586,
			camp_id = 52643,
			id = 185,
			unit_id = 89184,
			max = 450680
		},
		{
			recommend = 607545,
			min = 450681,
			camp_id = 52643,
			id = 186,
			unit_id = 89185,
			max = 607545
		},
		{
			recommend = 610460,
			min = 607546,
			camp_id = 52643,
			id = 187,
			unit_id = 89186,
			max = 610460
		},
		{
			recommend = 613375,
			min = 610461,
			camp_id = 52643,
			id = 188,
			unit_id = 89187,
			max = 613375
		},
		{
			recommend = 616290,
			min = 613376,
			camp_id = 52643,
			id = 189,
			unit_id = 89188,
			max = 616290
		},
		{
			recommend = 619210,
			min = 616291,
			camp_id = 52643,
			id = 190,
			unit_id = 89189,
			max = 619210
		},
		{
			recommend = 622115,
			min = 619211,
			camp_id = 52643,
			id = 191,
			unit_id = 89190,
			max = 622115
		},
		{
			recommend = 625035,
			min = 622116,
			camp_id = 52643,
			id = 192,
			unit_id = 89191,
			max = 625035
		},
		{
			recommend = 627965,
			min = 625036,
			camp_id = 52643,
			id = 193,
			unit_id = 89192,
			max = 627965
		},
		{
			recommend = 630875,
			min = 627966,
			camp_id = 52643,
			id = 194,
			unit_id = 89193,
			max = 630875
		},
		{
			recommend = 633790,
			min = 630876,
			camp_id = 52643,
			id = 195,
			unit_id = 89194,
			max = 633790
		},
		{
			recommend = 636700,
			min = 633791,
			camp_id = 52643,
			id = 196,
			unit_id = 89195,
			max = 636700
		},
		{
			recommend = 639630,
			min = 636701,
			camp_id = 52643,
			id = 197,
			unit_id = 89196,
			max = 639630
		},
		{
			recommend = 642545,
			min = 639631,
			camp_id = 52643,
			id = 198,
			unit_id = 89197,
			max = 642545
		},
		{
			recommend = 645455,
			min = 642546,
			camp_id = 52643,
			id = 199,
			unit_id = 89198,
			max = 645455
		},
		{
			recommend = 648360,
			min = 645456,
			camp_id = 52643,
			id = 200,
			unit_id = 89199,
			max = 648360
		},
		{
			recommend = 698315,
			min = 648361,
			camp_id = 52643,
			id = 201,
			unit_id = 89200,
			max = 698315
		},
		{
			recommend = 701395,
			min = 698316,
			camp_id = 52643,
			id = 202,
			unit_id = 89201,
			max = 701395
		},
		{
			recommend = 704520,
			min = 701396,
			camp_id = 52643,
			id = 203,
			unit_id = 89202,
			max = 704520
		},
		{
			recommend = 707600,
			min = 704521,
			camp_id = 52643,
			id = 204,
			unit_id = 89203,
			max = 707600
		},
		{
			recommend = 710685,
			min = 707601,
			camp_id = 52643,
			id = 205,
			unit_id = 89204,
			max = 710685
		},
		{
			recommend = 982060,
			min = 710686,
			camp_id = 52643,
			id = 206,
			unit_id = 89205,
			max = 982060
		},
		{
			recommend = 986475,
			min = 982061,
			camp_id = 52643,
			id = 207,
			unit_id = 89206,
			max = 986475
		},
		{
			recommend = 990875,
			min = 986476,
			camp_id = 52643,
			id = 208,
			unit_id = 89207,
			max = 990875
		},
		{
			recommend = 995255,
			min = 990876,
			camp_id = 52643,
			id = 209,
			unit_id = 89208,
			max = 995255
		},
		{
			recommend = 999660,
			min = 995256,
			camp_id = 52643,
			id = 210,
			unit_id = 89209,
			max = 999660
		},
		{
			recommend = 1004080,
			min = 999661,
			camp_id = 52643,
			id = 211,
			unit_id = 89210,
			max = 1004080
		},
		{
			recommend = 1008480,
			min = 1004081,
			camp_id = 52643,
			id = 212,
			unit_id = 89211,
			max = 1008480
		},
		{
			recommend = 1012880,
			min = 1008481,
			camp_id = 52643,
			id = 213,
			unit_id = 89212,
			max = 1012880
		},
		{
			recommend = 1017265,
			min = 1012881,
			camp_id = 52643,
			id = 214,
			unit_id = 89213,
			max = 1017265
		},
		{
			recommend = 1021685,
			min = 1017266,
			camp_id = 52643,
			id = 215,
			unit_id = 89214,
			max = 1021685
		},
		{
			recommend = 1026070,
			min = 1021686,
			camp_id = 52643,
			id = 216,
			unit_id = 89215,
			max = 1026070
		},
		{
			recommend = 1030480,
			min = 1026071,
			camp_id = 52643,
			id = 217,
			unit_id = 89216,
			max = 1030480
		},
		{
			recommend = 1034870,
			min = 1030481,
			camp_id = 52643,
			id = 218,
			unit_id = 89217,
			max = 1034870
		},
		{
			recommend = 1039295,
			min = 1034871,
			camp_id = 52643,
			id = 219,
			unit_id = 89218,
			max = 1039295
		},
		{
			recommend = 1043685,
			min = 1039296,
			camp_id = 52643,
			id = 220,
			unit_id = 89219,
			max = 1043685
		},
		{
			recommend = 1086890,
			min = 1043686,
			camp_id = 52643,
			id = 221,
			unit_id = 89220,
			max = 1086890
		},
		{
			recommend = 1091370,
			min = 1086891,
			camp_id = 52643,
			id = 222,
			unit_id = 89221,
			max = 1091370
		},
		{
			recommend = 1095825,
			min = 1091371,
			camp_id = 52643,
			id = 223,
			unit_id = 89222,
			max = 1095825
		},
		{
			recommend = 1100330,
			min = 1095826,
			camp_id = 52643,
			id = 224,
			unit_id = 89223,
			max = 1100330
		},
		{
			recommend = 1104795,
			min = 1100331,
			camp_id = 52643,
			id = 225,
			unit_id = 89224,
			max = 1104795
		},
		{
			recommend = 1109255,
			min = 1104796,
			camp_id = 52643,
			id = 226,
			unit_id = 89225,
			max = 1109255
		},
		{
			recommend = 1113720,
			min = 1109256,
			camp_id = 52643,
			id = 227,
			unit_id = 89226,
			max = 1113720
		},
		{
			recommend = 1118225,
			min = 1113721,
			camp_id = 52643,
			id = 228,
			unit_id = 89227,
			max = 1118225
		},
		{
			recommend = 1122690,
			min = 1118226,
			camp_id = 52643,
			id = 229,
			unit_id = 89228,
			max = 1122690
		},
		{
			recommend = 1127160,
			min = 1122691,
			camp_id = 52643,
			id = 230,
			unit_id = 89229,
			max = 1127160
		},
		{
			recommend = 1131630,
			min = 1127161,
			camp_id = 52643,
			id = 231,
			unit_id = 89230,
			max = 1131630
		},
		{
			recommend = 1136110,
			min = 1131631,
			camp_id = 52643,
			id = 232,
			unit_id = 89231,
			max = 1136110
		},
		{
			recommend = 1140590,
			min = 1136111,
			camp_id = 52643,
			id = 233,
			unit_id = 89232,
			max = 1140590
		},
		{
			recommend = 1145050,
			min = 1140591,
			camp_id = 52643,
			id = 234,
			unit_id = 89233,
			max = 1145050
		},
		{
			recommend = 1149515,
			min = 1145051,
			camp_id = 52643,
			id = 235,
			unit_id = 89234,
			max = 1149515
		},
		{
			recommend = 1154015,
			min = 1149516,
			camp_id = 52643,
			id = 236,
			unit_id = 89235,
			max = 1154015
		},
		{
			recommend = 1158475,
			min = 1154016,
			camp_id = 52643,
			id = 237,
			unit_id = 89236,
			max = 1158475
		},
		{
			recommend = 1162950,
			min = 1158476,
			camp_id = 52643,
			id = 238,
			unit_id = 89237,
			max = 1162950
		},
		{
			recommend = 1167410,
			min = 1162951,
			camp_id = 52643,
			id = 239,
			unit_id = 89238,
			max = 1167410
		},
		{
			recommend = 1171915,
			min = 1167411,
			camp_id = 52643,
			id = 240,
			unit_id = 89239,
			max = 1171915
		},
		{
			recommend = 1214555,
			min = 1171916,
			camp_id = 52643,
			id = 241,
			unit_id = 89240,
			max = 1214555
		},
		{
			recommend = 1219105,
			min = 1214556,
			camp_id = 52643,
			id = 242,
			unit_id = 89241,
			max = 1219105
		},
		{
			recommend = 1223635,
			min = 1219106,
			camp_id = 52643,
			id = 243,
			unit_id = 89242,
			max = 1223635
		},
		{
			recommend = 1228210,
			min = 1223636,
			camp_id = 52643,
			id = 244,
			unit_id = 89243,
			max = 1228210
		},
		{
			recommend = 1232745,
			min = 1228211,
			camp_id = 52643,
			id = 245,
			unit_id = 89244,
			max = 1232745
		},
		{
			recommend = 1237285,
			min = 1232746,
			camp_id = 52643,
			id = 246,
			unit_id = 89245,
			max = 1237285
		},
		{
			recommend = 1241840,
			min = 1237286,
			camp_id = 52643,
			id = 247,
			unit_id = 89246,
			max = 1241840
		},
		{
			recommend = 1246365,
			min = 1241841,
			camp_id = 52643,
			id = 248,
			unit_id = 89247,
			max = 1246365
		},
		{
			recommend = 1250935,
			min = 1246366,
			camp_id = 52643,
			id = 249,
			unit_id = 89248,
			max = 1250935
		},
		{
			recommend = 1255465,
			min = 1250936,
			camp_id = 52643,
			id = 250,
			unit_id = 89249,
			max = 1255465
		},
		{
			recommend = 1260020,
			min = 1255466,
			camp_id = 52643,
			id = 251,
			unit_id = 89250,
			max = 1260020
		},
		{
			recommend = 1264555,
			min = 1260021,
			camp_id = 52643,
			id = 252,
			unit_id = 89251,
			max = 1264555
		},
		{
			recommend = 1269130,
			min = 1264556,
			camp_id = 52643,
			id = 253,
			unit_id = 89252,
			max = 1269130
		},
		{
			recommend = 1273670,
			min = 1269131,
			camp_id = 52643,
			id = 254,
			unit_id = 89253,
			max = 1273670
		},
		{
			recommend = 1278195,
			min = 1273671,
			camp_id = 52643,
			id = 255,
			unit_id = 89254,
			max = 9999999999.0
		}
	}
}
