Config = Config or {}
slot1 = Config.CombatHaloData or {}
Config.CombatHaloData = slot1
Config.CombatHaloData.data_const_length = 0
Config.CombatHaloData.data_const = {}

function Config.CombatHaloData.data_const_fun(slot0)
	slot1 = Config.CombatHaloData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CombatHaloData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.CombatHaloData.data_halo_length = 34
Config.CombatHaloData.data_halo = {
	{
		id = 1,
		condition = 0,
		pos_info = {
			{
				1,
				5
			}
		},
		attrs = {
			{
				"hp_max_per",
				220
			},
			{
				"atk_per",
				160
			},
			{
				"hit_magic",
				30
			}
		}
	},
	{
		id = 2,
		condition = 0,
		pos_info = {
			{
				2,
				5
			}
		},
		attrs = {
			{
				"hp_max_per",
				220
			},
			{
				"atk_per",
				160
			},
			{
				"crit_rate",
				30
			}
		}
	},
	{
		id = 3,
		condition = 0,
		pos_info = {
			{
				3,
				5
			}
		},
		attrs = {
			{
				"hp_max_per",
				220
			},
			{
				"atk_per",
				160
			},
			{
				"dodge_rate",
				30
			}
		}
	},
	{
		id = 4,
		condition = 0,
		pos_info = {
			{
				4,
				5
			}
		},
		attrs = {
			{
				"hp_max_per",
				300
			},
			{
				"atk_per",
				200
			},
			{
				"res",
				30
			}
		}
	},
	{
		id = 5,
		condition = 0,
		pos_info = {
			{
				5,
				5
			}
		},
		attrs = {
			{
				"hp_max_per",
				300
			},
			{
				"atk_per",
				200
			},
			{
				"dam",
				30
			}
		}
	},
	{
		id = 6,
		condition = 0,
		pos_info = {
			{
				1,
				4
			}
		},
		attrs = {
			{
				"hp_max_per",
				160
			},
			{
				"atk_per",
				120
			}
		}
	},
	{
		id = 7,
		condition = 0,
		pos_info = {
			{
				2,
				4
			}
		},
		attrs = {
			{
				"hp_max_per",
				160
			},
			{
				"atk_per",
				120
			}
		}
	},
	{
		id = 8,
		condition = 0,
		pos_info = {
			{
				3,
				4
			}
		},
		attrs = {
			{
				"hp_max_per",
				160
			},
			{
				"atk_per",
				120
			}
		}
	},
	{
		id = 9,
		condition = 0,
		pos_info = {
			{
				4,
				4
			}
		},
		attrs = {
			{
				"hp_max_per",
				220
			},
			{
				"atk_per",
				150
			}
		}
	},
	{
		id = 10,
		condition = 0,
		pos_info = {
			{
				5,
				4
			}
		},
		attrs = {
			{
				"hp_max_per",
				220
			},
			{
				"atk_per",
				150
			}
		}
	},
	{
		id = 11,
		condition = 0,
		pos_info = {
			{
				1,
				3
			}
		},
		attrs = {
			{
				"hp_max_per",
				110
			},
			{
				"atk_per",
				80
			}
		}
	},
	{
		id = 12,
		condition = 0,
		pos_info = {
			{
				2,
				3
			}
		},
		attrs = {
			{
				"hp_max_per",
				110
			},
			{
				"atk_per",
				80
			}
		}
	},
	{
		id = 13,
		condition = 0,
		pos_info = {
			{
				3,
				3
			}
		},
		attrs = {
			{
				"hp_max_per",
				110
			},
			{
				"atk_per",
				80
			}
		}
	},
	{
		id = 14,
		condition = 0,
		pos_info = {
			{
				4,
				3
			}
		},
		attrs = {
			{
				"hp_max_per",
				150
			},
			{
				"atk_per",
				110
			}
		}
	},
	{
		id = 15,
		condition = 0,
		pos_info = {
			{
				5,
				3
			}
		},
		attrs = {
			{
				"hp_max_per",
				150
			},
			{
				"atk_per",
				110
			}
		}
	},
	{
		id = 16,
		condition = 0,
		pos_info = {
			{
				1,
				2
			}
		},
		attrs = {
			{
				"hp_max_per",
				70
			},
			{
				"atk_per",
				50
			}
		}
	},
	{
		id = 17,
		condition = 0,
		pos_info = {
			{
				2,
				2
			}
		},
		attrs = {
			{
				"hp_max_per",
				70
			},
			{
				"atk_per",
				50
			}
		}
	},
	{
		id = 18,
		condition = 0,
		pos_info = {
			{
				3,
				2
			}
		},
		attrs = {
			{
				"hp_max_per",
				70
			},
			{
				"atk_per",
				50
			}
		}
	},
	{
		id = 19,
		condition = 0,
		pos_info = {
			{
				4,
				2
			}
		},
		attrs = {
			{
				"hp_max_per",
				100
			},
			{
				"atk_per",
				70
			}
		}
	},
	{
		id = 20,
		condition = 0,
		pos_info = {
			{
				5,
				2
			}
		},
		attrs = {
			{
				"hp_max_per",
				100
			},
			{
				"atk_per",
				70
			}
		}
	},
	{
		id = 21,
		condition = 0,
		pos_info = {
			{
				1,
				1
			},
			{
				2,
				1
			},
			{
				3,
				1
			},
			{
				4,
				1
			},
			{
				5,
				1
			},
			{
				5,
				1
			}
		},
		attrs = {
			{
				"hp_max_per",
				170
			},
			{
				"atk_per",
				120
			}
		}
	},
	{
		id = 22,
		condition = 0,
		pos_info = {
			{
				4,
				1
			}
		},
		attrs = {
			{
				"hp_max_per",
				40
			},
			{
				"atk_per",
				30
			}
		}
	},
	{
		id = 23,
		condition = 21,
		pos_info = {
			{
				5,
				1
			}
		},
		attrs = {
			{
				"hp_max_per",
				40
			},
			{
				"atk_per",
				30
			}
		}
	},
	{
		id = 24,
		condition = 0,
		pos_info = {
			{
				7,
				1
			}
		},
		attrs = {
			{
				"hp_max_per",
				150
			},
			{
				"atk_per",
				110
			}
		}
	},
	{
		id = 25,
		condition = 0,
		pos_info = {
			{
				7,
				2
			}
		},
		attrs = {
			{
				"hp_max_per",
				230
			},
			{
				"atk_per",
				160
			}
		}
	},
	{
		id = 26,
		condition = 0,
		pos_info = {
			{
				7,
				3
			}
		},
		attrs = {
			{
				"hp_max_per",
				270
			},
			{
				"atk_per",
				180
			}
		}
	},
	{
		id = 27,
		condition = 0,
		pos_info = {
			{
				7,
				4
			}
		},
		attrs = {
			{
				"hp_max_per",
				310
			},
			{
				"atk_per",
				210
			}
		}
	},
	{
		id = 28,
		condition = 0,
		pos_info = {
			{
				7,
				5
			}
		},
		attrs = {
			{
				"hp_max_per",
				350
			},
			{
				"atk_per",
				250
			}
		}
	},
	{
		id = 29,
		condition = 0,
		pos_info = {
			{
				7,
				6
			}
		},
		attrs = {
			{
				"hp_max_per",
				450
			},
			{
				"atk_per",
				350
			}
		}
	},
	{
		id = 30,
		condition = 0,
		pos_info = {
			{
				1,
				6
			}
		},
		attrs = {
			{
				"hp_max_per",
				320
			},
			{
				"atk_per",
				260
			},
			{
				"hit_magic",
				60
			}
		}
	},
	{
		id = 31,
		condition = 0,
		pos_info = {
			{
				2,
				6
			}
		},
		attrs = {
			{
				"hp_max_per",
				320
			},
			{
				"atk_per",
				260
			},
			{
				"crit_rate",
				60
			}
		}
	},
	{
		id = 32,
		condition = 0,
		pos_info = {
			{
				3,
				6
			}
		},
		attrs = {
			{
				"hp_max_per",
				320
			},
			{
				"atk_per",
				260
			},
			{
				"dodge_rate",
				60
			}
		}
	},
	{
		id = 33,
		condition = 0,
		pos_info = {
			{
				4,
				6
			}
		},
		attrs = {
			{
				"hp_max_per",
				400
			},
			{
				"atk_per",
				300
			},
			{
				"res",
				60
			}
		}
	},
	{
		id = 34,
		condition = 0,
		pos_info = {
			{
				5,
				6
			}
		},
		attrs = {
			{
				"hp_max_per",
				400
			},
			{
				"atk_per",
				300
			},
			{
				"dam",
				60
			}
		}
	}
}

function Config.CombatHaloData.data_halo_fun(slot0)
	slot1 = Config.CombatHaloData.data_halo[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CombatHaloData.data_halo[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.CombatHaloData.data_halo_icon_length = 185
slot1[22] = {
	id = 22,
	icon = 1004,
	nums = {
		1
	}
}
slot1[23] = {
	id = 23,
	icon = 1005,
	nums = {
		1
	}
}
Config.CombatHaloData.data_halo_icon = {
	{
		id = 1,
		icon = 1001,
		nums = {
			5
		}
	},
	{
		id = 2,
		icon = 1002,
		nums = {
			5
		}
	},
	{
		id = 3,
		icon = 1003,
		nums = {
			5
		}
	},
	{
		id = 4,
		icon = 1004,
		nums = {
			5
		}
	},
	{
		id = 5,
		icon = 1005,
		nums = {
			5
		}
	},
	{
		id = 6,
		icon = 1001,
		nums = {
			4
		}
	},
	{
		id = 7,
		icon = 1002,
		nums = {
			4
		}
	},
	{
		id = 8,
		icon = 1003,
		nums = {
			4
		}
	},
	{
		id = 9,
		icon = 1004,
		nums = {
			4
		}
	},
	{
		id = 10,
		icon = 1005,
		nums = {
			4
		}
	},
	{
		id = 11,
		icon = 1001,
		nums = {
			3
		}
	},
	{
		id = 12,
		icon = 1002,
		nums = {
			3
		}
	},
	{
		id = 13,
		icon = 1003,
		nums = {
			3
		}
	},
	{
		id = 14,
		icon = 1004,
		nums = {
			3
		}
	},
	{
		id = 15,
		icon = 1005,
		nums = {
			3
		}
	},
	{
		id = 16,
		icon = 1001,
		nums = {
			2
		}
	},
	{
		id = 17,
		icon = 1002,
		nums = {
			2
		}
	},
	{
		id = 18,
		icon = 1003,
		nums = {
			2
		}
	},
	{
		id = 19,
		icon = 1004,
		nums = {
			2
		}
	},
	{
		id = 20,
		icon = 1005,
		nums = {
			2
		}
	},
	{
		id = 21,
		icon = 1006,
		nums = {}
	},
	{
		id = 22,
		icon = 1004,
		nums = {
			1
		}
	},
	{
		id = 23,
		icon = 1005,
		nums = {
			1
		}
	},
	{
		id = 24,
		icon = 1007,
		nums = {
			1
		}
	},
	{
		id = 25,
		icon = 1007,
		nums = {
			2
		}
	},
	{
		id = 26,
		icon = 1007,
		nums = {
			3
		}
	},
	{
		id = 27,
		icon = 1007,
		nums = {
			4
		}
	},
	{
		id = 28,
		icon = 1007,
		nums = {
			5
		}
	},
	{
		id = 29,
		icon = 1007,
		nums = {
			6
		}
	},
	{
		id = 30,
		icon = 1001,
		nums = {
			6
		}
	},
	{
		id = 31,
		icon = 1002,
		nums = {
			6
		}
	},
	{
		id = 32,
		icon = 1003,
		nums = {
			6
		}
	},
	{
		id = 33,
		icon = 1004,
		nums = {
			6
		}
	},
	{
		id = 34,
		icon = 1005,
		nums = {
			6
		}
	},
	[1117] = {
		id = 1117,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1118] = {
		id = 1118,
		icon = 1025,
		nums = {
			3,
			2
		}
	},
	[1119] = {
		id = 1119,
		icon = 1023,
		nums = {
			3,
			2
		}
	},
	[1120] = {
		id = 1120,
		icon = 1024,
		nums = {
			3,
			2
		}
	},
	[1216] = {
		id = 1216,
		icon = 1022,
		nums = {
			3,
			2
		}
	},
	[1218] = {
		id = 1218,
		icon = 1021,
		nums = {
			3,
			2
		}
	},
	[1219] = {
		id = 1219,
		icon = 1019,
		nums = {
			3,
			2
		}
	},
	[1220] = {
		id = 1220,
		icon = 1020,
		nums = {
			3,
			2
		}
	},
	[1316] = {
		id = 1316,
		icon = 1014,
		nums = {
			3,
			2
		}
	},
	[1317] = {
		id = 1317,
		icon = 1013,
		nums = {
			3,
			2
		}
	},
	[1319] = {
		id = 1319,
		icon = 1011,
		nums = {
			3,
			2
		}
	},
	[1320] = {
		id = 1320,
		icon = 1012,
		nums = {
			3,
			2
		}
	},
	[1416] = {
		id = 1416,
		icon = 1018,
		nums = {
			3,
			2
		}
	},
	[1417] = {
		id = 1417,
		icon = 1017,
		nums = {
			3,
			2
		}
	},
	[1418] = {
		id = 1418,
		icon = 1016,
		nums = {
			3,
			2
		}
	},
	[1420] = {
		id = 1420,
		icon = 1015,
		nums = {
			3,
			2
		}
	},
	[1516] = {
		id = 1516,
		icon = 1010,
		nums = {
			3,
			2
		}
	},
	[1517] = {
		id = 1517,
		icon = 1009,
		nums = {
			3,
			2
		}
	},
	[1518] = {
		id = 1518,
		icon = 1008,
		nums = {
			3,
			2
		}
	},
	[1519] = {
		id = 1519,
		icon = 1007,
		nums = {
			3,
			2
		}
	},
	[1617] = {
		id = 1617,
		icon = 1022,
		nums = {
			2,
			2
		}
	},
	[1618] = {
		id = 1618,
		icon = 1014,
		nums = {
			2,
			2
		}
	},
	[1619] = {
		id = 1619,
		icon = 1018,
		nums = {
			2,
			2
		}
	},
	[1620] = {
		id = 1620,
		icon = 1010,
		nums = {
			2,
			2
		}
	},
	[1718] = {
		id = 1718,
		icon = 1013,
		nums = {
			2,
			2
		}
	},
	[1719] = {
		id = 1719,
		icon = 1017,
		nums = {
			2,
			2
		}
	},
	[1720] = {
		id = 1720,
		icon = 1009,
		nums = {
			2,
			2
		}
	},
	[1819] = {
		id = 1819,
		icon = 1016,
		nums = {
			2,
			2
		}
	},
	[1820] = {
		id = 1820,
		icon = 1008,
		nums = {
			2,
			2
		}
	},
	[1920] = {
		id = 1920,
		icon = 1007,
		nums = {
			2,
			2
		}
	},
	[2223] = {
		id = 2223,
		icon = 1007,
		nums = {
			1,
			1
		}
	},
	[622] = {
		id = 622,
		icon = 1023,
		nums = {
			4,
			1
		}
	},
	[722] = {
		id = 722,
		icon = 1019,
		nums = {
			4,
			1
		}
	},
	[822] = {
		id = 822,
		icon = 1011,
		nums = {
			4,
			1
		}
	},
	[1022] = {
		id = 1022,
		icon = 1007,
		nums = {
			4,
			1
		}
	},
	[1122] = {
		id = 1122,
		icon = 1023,
		nums = {
			3,
			1
		}
	},
	[1222] = {
		id = 1222,
		icon = 1019,
		nums = {
			3,
			1
		}
	},
	[1322] = {
		id = 1322,
		icon = 1011,
		nums = {
			3,
			1
		}
	},
	[1522] = {
		id = 1522,
		icon = 1007,
		nums = {
			3,
			1
		}
	},
	[1622] = {
		id = 1622,
		icon = 1023,
		nums = {
			2,
			1
		}
	},
	[1722] = {
		id = 1722,
		icon = 1019,
		nums = {
			2,
			1
		}
	},
	[1822] = {
		id = 1822,
		icon = 1011,
		nums = {
			2,
			1
		}
	},
	[2022] = {
		id = 2022,
		icon = 1007,
		nums = {
			2,
			1
		}
	},
	[623] = {
		id = 623,
		icon = 1024,
		nums = {
			4,
			1
		}
	},
	[723] = {
		id = 723,
		icon = 1020,
		nums = {
			4,
			1
		}
	},
	[823] = {
		id = 823,
		icon = 1012,
		nums = {
			4,
			1
		}
	},
	[923] = {
		id = 923,
		icon = 1015,
		nums = {
			4,
			1
		}
	},
	[1123] = {
		id = 1123,
		icon = 1024,
		nums = {
			3,
			1
		}
	},
	[1223] = {
		id = 1223,
		icon = 1020,
		nums = {
			3,
			1
		}
	},
	[1323] = {
		id = 1323,
		icon = 1012,
		nums = {
			3,
			1
		}
	},
	[1423] = {
		id = 1423,
		icon = 1015,
		nums = {
			3,
			1
		}
	},
	[1623] = {
		id = 1623,
		icon = 1024,
		nums = {
			2,
			1
		}
	},
	[1723] = {
		id = 1723,
		icon = 1020,
		nums = {
			2,
			1
		}
	},
	[1823] = {
		id = 1823,
		icon = 1012,
		nums = {
			2,
			1
		}
	},
	[1923] = {
		id = 1923,
		icon = 1015,
		nums = {
			2,
			1
		}
	},
	[112223] = {
		id = 112223,
		icon = 112223,
		nums = {
			3,
			1,
			1
		}
	},
	[122223] = {
		id = 122223,
		icon = 122223,
		nums = {
			3,
			1,
			1
		}
	},
	[132223] = {
		id = 132223,
		icon = 132223,
		nums = {
			3,
			1,
			1
		}
	},
	[162223] = {
		id = 162223,
		icon = 112223,
		nums = {
			2,
			1,
			1
		}
	},
	[172223] = {
		id = 172223,
		icon = 122223,
		nums = {
			2,
			1,
			1
		}
	},
	[182223] = {
		id = 182223,
		icon = 132223,
		nums = {
			2,
			1,
			1
		}
	},
	[161722] = {
		id = 161722,
		icon = 161722,
		nums = {
			1,
			2,
			2
		}
	},
	[161822] = {
		id = 161822,
		icon = 161822,
		nums = {
			1,
			2,
			2
		}
	},
	[162022] = {
		id = 162022,
		icon = 162022,
		nums = {
			1,
			2,
			2
		}
	},
	[171822] = {
		id = 171822,
		icon = 171822,
		nums = {
			1,
			2,
			2
		}
	},
	[172022] = {
		id = 172022,
		icon = 172022,
		nums = {
			1,
			2,
			2
		}
	},
	[182022] = {
		id = 182022,
		icon = 182022,
		nums = {
			1,
			2,
			2
		}
	},
	[161723] = {
		id = 161723,
		icon = 161723,
		nums = {
			1,
			2,
			2
		}
	},
	[161823] = {
		id = 161823,
		icon = 161823,
		nums = {
			1,
			2,
			2
		}
	},
	[161923] = {
		id = 161923,
		icon = 161923,
		nums = {
			1,
			2,
			2
		}
	},
	[171823] = {
		id = 171823,
		icon = 171823,
		nums = {
			1,
			2,
			2
		}
	},
	[171923] = {
		id = 171923,
		icon = 171923,
		nums = {
			1,
			2,
			2
		}
	},
	[181923] = {
		id = 181923,
		icon = 181923,
		nums = {
			1,
			2,
			2
		}
	},
	[1125] = {
		id = 1125,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1225] = {
		id = 1225,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1325] = {
		id = 1325,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1425] = {
		id = 1425,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1525] = {
		id = 1525,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1125] = {
		id = 1125,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1225] = {
		id = 1225,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1325] = {
		id = 1325,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1425] = {
		id = 1425,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1525] = {
		id = 1525,
		icon = 1026,
		nums = {
			3,
			2
		}
	},
	[1625] = {
		id = 1625,
		icon = 1026,
		nums = {
			2,
			2
		}
	},
	[1725] = {
		id = 1725,
		icon = 1026,
		nums = {
			2,
			2
		}
	},
	[1825] = {
		id = 1825,
		icon = 1026,
		nums = {
			2,
			2
		}
	},
	[1925] = {
		id = 1925,
		icon = 1026,
		nums = {
			2,
			2
		}
	},
	[2025] = {
		id = 2025,
		icon = 1026,
		nums = {
			2,
			2
		}
	},
	[2225] = {
		id = 2225,
		icon = 1026,
		nums = {
			1,
			2
		}
	},
	[2325] = {
		id = 2325,
		icon = 1026,
		nums = {
			1,
			2
		}
	},
	[162225] = {
		id = 162225,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[172225] = {
		id = 172225,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[182225] = {
		id = 182225,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[162325] = {
		id = 162325,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[172325] = {
		id = 172325,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[182325] = {
		id = 182325,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[192325] = {
		id = 192325,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[202225] = {
		id = 202225,
		icon = 1026,
		nums = {
			2,
			1,
			2
		}
	},
	[222325] = {
		id = 222325,
		icon = 1026,
		nums = {
			1,
			1,
			2
		}
	},
	[624] = {
		id = 624,
		icon = 1026,
		nums = {
			1,
			4
		}
	},
	[724] = {
		id = 724,
		icon = 1026,
		nums = {
			1,
			4
		}
	},
	[824] = {
		id = 824,
		icon = 1026,
		nums = {
			1,
			4
		}
	},
	[924] = {
		id = 924,
		icon = 1026,
		nums = {
			1,
			4
		}
	},
	[1024] = {
		id = 1024,
		icon = 1026,
		nums = {
			1,
			4
		}
	},
	[112224] = {
		id = 112224,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[122224] = {
		id = 122224,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[132224] = {
		id = 132224,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[152224] = {
		id = 152224,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[112324] = {
		id = 112324,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[122324] = {
		id = 122324,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[132324] = {
		id = 132324,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[142324] = {
		id = 142324,
		icon = 1026,
		nums = {
			3,
			1,
			1
		}
	},
	[2224] = {
		id = 2224,
		icon = 1026,
		nums = {
			1,
			1
		}
	},
	[2324] = {
		id = 2324,
		icon = 1026,
		nums = {
			1,
			1
		}
	},
	[161724] = {
		id = 161724,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[161824] = {
		id = 161824,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[161924] = {
		id = 161924,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[171824] = {
		id = 171824,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[171924] = {
		id = 171924,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[181924] = {
		id = 181924,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[182024] = {
		id = 182024,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[192024] = {
		id = 192024,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[222324] = {
		id = 222324,
		icon = 1026,
		nums = {
			1,
			1,
			1
		}
	},
	[1124] = {
		id = 1124,
		icon = 1026,
		nums = {
			3,
			1
		}
	},
	[1224] = {
		id = 1224,
		icon = 1026,
		nums = {
			3,
			1
		}
	},
	[1324] = {
		id = 1324,
		icon = 1026,
		nums = {
			3,
			1
		}
	},
	[1424] = {
		id = 1424,
		icon = 1026,
		nums = {
			3,
			1
		}
	},
	[1524] = {
		id = 1524,
		icon = 1026,
		nums = {
			3,
			1
		}
	},
	[1624] = {
		id = 1624,
		icon = 1026,
		nums = {
			2,
			1
		}
	},
	[1724] = {
		id = 1724,
		icon = 1026,
		nums = {
			2,
			1
		}
	},
	[1824] = {
		id = 1824,
		icon = 1026,
		nums = {
			2,
			1
		}
	},
	[1924] = {
		id = 1924,
		icon = 1026,
		nums = {
			2,
			1
		}
	},
	[2024] = {
		id = 2024,
		icon = 1026,
		nums = {
			2,
			1
		}
	},
	[192324] = {
		id = 192324,
		icon = 1026,
		nums = {
			1,
			1,
			2
		}
	},
	[202224] = {
		id = 202224,
		icon = 1026,
		nums = {
			1,
			1,
			2
		}
	},
	[161924] = {
		id = 161924,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[171924] = {
		id = 171924,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[181924] = {
		id = 181924,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[162024] = {
		id = 162024,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[172024] = {
		id = 172024,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[182024] = {
		id = 182024,
		icon = 1026,
		nums = {
			1,
			2,
			2
		}
	},
	[162224] = {
		id = 162224,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[172224] = {
		id = 172224,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[182224] = {
		id = 182224,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[202224] = {
		id = 202224,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[162324] = {
		id = 162324,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[172324] = {
		id = 172324,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[182324] = {
		id = 182324,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	},
	[192324] = {
		id = 192324,
		icon = 1026,
		nums = {
			2,
			1,
			1
		}
	}
}

function Config.CombatHaloData.data_halo_icon_fun(slot0)
	slot1 = Config.CombatHaloData.data_halo_icon[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.CombatHaloData.data_halo_icon[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.CombatHaloData.data_halo_show_length = 7
Config.CombatHaloData.data_halo_show = {
	{
		{
			name = "海贼之力",
			icon = 1001,
			desc = "上阵2个海贼英雄",
			attrs = {
				{
					"hp_max_per",
					70
				},
				{
					"atk_per",
					50
				}
			},
			pos_info = {
				{
					1,
					2
				}
			}
		},
		{
			name = "海贼之力",
			icon = 0,
			desc = "上阵3个海贼英雄",
			attrs = {
				{
					"hp_max_per",
					110
				},
				{
					"atk_per",
					80
				}
			},
			pos_info = {
				{
					1,
					3
				}
			}
		},
		{
			name = "海贼之力",
			icon = 0,
			desc = "上阵4个海贼英雄",
			attrs = {
				{
					"hp_max_per",
					160
				},
				{
					"atk_per",
					120
				}
			},
			pos_info = {
				{
					1,
					4
				}
			}
		},
		{
			name = "海贼之力",
			icon = 0,
			desc = "上阵5个海贼英雄",
			attrs = {
				{
					"hp_max_per",
					220
				},
				{
					"atk_per",
					160
				},
				{
					"hit_magic",
					30
				}
			},
			pos_info = {
				{
					1,
					5
				}
			}
		},
		{
			name = "海贼之力",
			icon = 0,
			desc = "上阵6个海贼英雄",
			attrs = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					200
				},
				{
					"hit_magic",
					50
				}
			},
			pos_info = {
				{
					1,
					6
				}
			}
		}
	},
	{
		{
			name = "草帽之力",
			icon = 1002,
			desc = "上阵2个草帽联盟英雄",
			attrs = {
				{
					"hp_max_per",
					70
				},
				{
					"atk_per",
					50
				}
			},
			pos_info = {
				{
					2,
					2
				}
			}
		},
		{
			name = "草帽之力",
			icon = 0,
			desc = "上阵3个草帽联盟英雄",
			attrs = {
				{
					"hp_max_per",
					110
				},
				{
					"atk_per",
					80
				}
			},
			pos_info = {
				{
					2,
					3
				}
			}
		},
		{
			name = "草帽之力",
			icon = 0,
			desc = "上阵4个草帽联盟英雄",
			attrs = {
				{
					"hp_max_per",
					160
				},
				{
					"atk_per",
					120
				}
			},
			pos_info = {
				{
					2,
					4
				}
			}
		},
		{
			name = "草帽之力",
			icon = 0,
			desc = "上阵5个草帽联盟英雄",
			attrs = {
				{
					"hp_max_per",
					220
				},
				{
					"atk_per",
					160
				},
				{
					"crit_rate",
					30
				}
			},
			pos_info = {
				{
					2,
					5
				}
			}
		},
		{
			name = "草帽之力",
			icon = 0,
			desc = "上阵6个草帽联盟英雄",
			attrs = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					200
				},
				{
					"hit_magic",
					50
				}
			},
			pos_info = {
				{
					2,
					6
				}
			}
		}
	},
	{
		{
			name = "强者之力",
			icon = 1003,
			desc = "上阵2个强者英雄",
			attrs = {
				{
					"hp_max_per",
					70
				},
				{
					"atk_per",
					50
				}
			},
			pos_info = {
				{
					3,
					2
				}
			}
		},
		{
			name = "强者之力",
			icon = 0,
			desc = "上阵3个强者英雄",
			attrs = {
				{
					"hp_max_per",
					110
				},
				{
					"atk_per",
					80
				}
			},
			pos_info = {
				{
					3,
					3
				}
			}
		},
		{
			name = "强者之力",
			icon = 0,
			desc = "上阵4个强者英雄",
			attrs = {
				{
					"hp_max_per",
					160
				},
				{
					"atk_per",
					120
				}
			},
			pos_info = {
				{
					3,
					4
				}
			}
		},
		{
			name = "强者之力",
			icon = 0,
			desc = "上阵5个强者英雄",
			attrs = {
				{
					"hp_max_per",
					220
				},
				{
					"atk_per",
					160
				},
				{
					"dodge_rate",
					30
				}
			},
			pos_info = {
				{
					3,
					5
				}
			}
		},
		{
			name = "强者之力",
			icon = 0,
			desc = "上阵6个强者英雄",
			attrs = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					200
				},
				{
					"hit_magic",
					50
				}
			},
			pos_info = {
				{
					3,
					6
				}
			}
		}
	},
	{
		{
			name = "正义之力",
			icon = 1004,
			desc = "上阵1个海军英雄",
			attrs = {
				{
					"hp_max_per",
					40
				},
				{
					"atk_per",
					30
				}
			},
			pos_info = {
				{
					4,
					1
				}
			}
		},
		{
			name = "正义之力",
			icon = 0,
			desc = "上阵2个海军英雄",
			attrs = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					70
				}
			},
			pos_info = {
				{
					4,
					2
				}
			}
		},
		{
			name = "正义之力",
			icon = 0,
			desc = "上阵3个海军英雄",
			attrs = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					110
				}
			},
			pos_info = {
				{
					4,
					3
				}
			}
		},
		{
			name = "正义之力",
			icon = 0,
			desc = "上阵4个海军英雄",
			attrs = {
				{
					"hp_max_per",
					220
				},
				{
					"atk_per",
					150
				}
			},
			pos_info = {
				{
					4,
					4
				}
			}
		},
		{
			name = "正义之力",
			icon = 0,
			desc = "上阵5个海军英雄",
			attrs = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					200
				},
				{
					"res",
					30
				}
			},
			pos_info = {
				{
					4,
					5
				}
			}
		},
		{
			name = "正义之力",
			icon = 0,
			desc = "上阵6个海军英雄",
			attrs = {
				{
					"hp_max_per",
					360
				},
				{
					"atk_per",
					240
				},
				{
					"res",
					60
				}
			},
			pos_info = {
				{
					4,
					6
				}
			}
		}
	},
	{
		{
			name = "首领之力",
			icon = 1005,
			desc = "上阵1个五皇团英雄",
			attrs = {
				{
					"hp_max_per",
					40
				},
				{
					"atk_per",
					30
				}
			},
			pos_info = {
				{
					5,
					1
				}
			}
		},
		{
			name = "首领之力",
			icon = 0,
			desc = "上阵2个五皇团英雄",
			attrs = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					70
				}
			},
			pos_info = {
				{
					5,
					2
				}
			}
		},
		{
			name = "首领之力",
			icon = 0,
			desc = "上阵3个五皇团英雄",
			attrs = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					110
				}
			},
			pos_info = {
				{
					5,
					3
				}
			}
		},
		{
			name = "首领之力",
			icon = 0,
			desc = "上阵4个五皇团英雄",
			attrs = {
				{
					"hp_max_per",
					220
				},
				{
					"atk_per",
					150
				}
			},
			pos_info = {
				{
					5,
					4
				}
			}
		},
		{
			name = "首领之力",
			icon = 0,
			desc = "上阵5个五皇团英雄",
			attrs = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					200
				},
				{
					"dam",
					30
				}
			},
			pos_info = {
				{
					5,
					5
				}
			}
		},
		{
			name = "首领之力",
			icon = 0,
			desc = "上阵5个五皇团英雄",
			attrs = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					200
				},
				{
					"dam",
					30
				}
			},
			pos_info = {
				{
					6,
					5
				}
			}
		}
	},
	{
		{
			name = "融合之力",
			icon = 1006,
			desc = "上阵6个不同阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					170
				},
				{
					"atk_per",
					120
				}
			},
			pos_info = {
				{
					1,
					1
				},
				{
					2,
					1
				},
				{
					3,
					1
				},
				{
					4,
					1
				},
				{
					5,
					1
				},
				{
					6,
					1
				}
			}
		}
	},
	{
		{
			name = "传说之力",
			icon = 1007,
			desc = "上阵1个传奇阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					110
				}
			},
			pos_info = {
				{
					7,
					1
				}
			}
		},
		{
			name = "传说之力",
			icon = 0,
			desc = "上阵2个传奇阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					230
				},
				{
					"atk_per",
					160
				}
			},
			pos_info = {
				{
					7,
					2
				}
			}
		},
		{
			name = "传说之力",
			icon = 0,
			desc = "上阵3个传奇阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					310
				},
				{
					"atk_per",
					210
				}
			},
			pos_info = {
				{
					7,
					3
				}
			}
		},
		{
			name = "传说之力",
			icon = 0,
			desc = "上阵4个传奇阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					390
				},
				{
					"atk_per",
					260
				}
			},
			pos_info = {
				{
					7,
					4
				}
			}
		},
		{
			name = "传说之力",
			icon = 0,
			desc = "上阵5个传奇阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					470
				},
				{
					"atk_per",
					310
				}
			},
			pos_info = {
				{
					7,
					5
				}
			}
		},
		{
			name = "传说之力",
			icon = 0,
			desc = "上阵6个传奇阵营的英雄",
			attrs = {
				{
					"hp_max_per",
					530
				},
				{
					"atk_per",
					360
				}
			},
			pos_info = {
				{
					7,
					6
				}
			}
		}
	}
}
