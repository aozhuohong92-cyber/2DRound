Config = Config or {}
Config.GuildQuestData = Config.GuildQuestData or {}
Config.GuildQuestData.data_guild_action_data_length = 1
Config.GuildQuestData.data_guild_action_data = {
	open_glev = {
		val = 1,
		desc = "功能开放所需公会等级"
	}
}

function Config.GuildQuestData.data_guild_action_data_fun(slot0)
	slot1 = Config.GuildQuestData.data_guild_action_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildQuestData.data_guild_action_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildQuestData.data_lev_data_length = 51
Config.GuildQuestData.data_lev_data = {
	[0] = {
		id = 0,
		lev = 0,
		res_id = 1,
		exp = 30,
		items = {},
		attr = {
			{
				"atk",
				0
			},
			{
				"hp_max",
				0
			}
		}
	},
	{
		id = 1,
		lev = 1,
		res_id = 1,
		exp = 70,
		items = {
			{
				10,
				100
			},
			{
				1,
				10000
			}
		},
		attr = {
			{
				"atk",
				10
			},
			{
				"hp_max",
				50
			}
		}
	},
	{
		id = 2,
		lev = 2,
		res_id = 1,
		exp = 120,
		items = {
			{
				10,
				100
			},
			{
				1,
				20000
			}
		},
		attr = {
			{
				"atk",
				20
			},
			{
				"hp_max",
				100
			}
		}
	},
	{
		id = 3,
		lev = 3,
		res_id = 1,
		exp = 180,
		items = {
			{
				10,
				100
			},
			{
				1,
				30000
			}
		},
		attr = {
			{
				"atk",
				30
			},
			{
				"hp_max",
				150
			}
		}
	},
	{
		id = 4,
		lev = 4,
		res_id = 1,
		exp = 250,
		items = {
			{
				10,
				100
			},
			{
				1,
				40000
			}
		},
		attr = {
			{
				"atk",
				40
			},
			{
				"hp_max",
				200
			}
		}
	},
	{
		id = 5,
		lev = 5,
		res_id = 2,
		exp = 330,
		items = {
			{
				10,
				100
			},
			{
				1,
				50000
			}
		},
		attr = {
			{
				"atk",
				50
			},
			{
				"hp_max",
				250
			}
		}
	},
	{
		id = 6,
		lev = 6,
		res_id = 2,
		exp = 420,
		items = {
			{
				10,
				100
			},
			{
				1,
				60000
			}
		},
		attr = {
			{
				"atk",
				60
			},
			{
				"hp_max",
				300
			}
		}
	},
	{
		id = 7,
		lev = 7,
		res_id = 2,
		exp = 520,
		items = {
			{
				10,
				100
			},
			{
				1,
				70000
			}
		},
		attr = {
			{
				"atk",
				70
			},
			{
				"hp_max",
				350
			}
		}
	},
	{
		id = 8,
		lev = 8,
		res_id = 2,
		exp = 630,
		items = {
			{
				10,
				100
			},
			{
				1,
				80000
			}
		},
		attr = {
			{
				"atk",
				80
			},
			{
				"hp_max",
				400
			}
		}
	},
	{
		id = 9,
		lev = 9,
		res_id = 2,
		exp = 750,
		items = {
			{
				10,
				100
			},
			{
				1,
				90000
			}
		},
		attr = {
			{
				"atk",
				90
			},
			{
				"hp_max",
				450
			}
		}
	},
	{
		id = 10,
		lev = 10,
		res_id = 2,
		exp = 880,
		items = {
			{
				10,
				100
			},
			{
				1,
				100000
			}
		},
		attr = {
			{
				"atk",
				100
			},
			{
				"hp_max",
				500
			}
		}
	},
	{
		id = 11,
		lev = 11,
		res_id = 3,
		exp = 1020,
		items = {
			{
				10,
				150
			},
			{
				1,
				110000
			}
		},
		attr = {
			{
				"atk",
				110
			},
			{
				"hp_max",
				550
			}
		}
	},
	{
		id = 12,
		lev = 12,
		res_id = 3,
		exp = 1170,
		items = {
			{
				10,
				150
			},
			{
				1,
				120000
			}
		},
		attr = {
			{
				"atk",
				120
			},
			{
				"hp_max",
				600
			}
		}
	},
	{
		id = 13,
		lev = 13,
		res_id = 3,
		exp = 1330,
		items = {
			{
				10,
				150
			},
			{
				1,
				130000
			}
		},
		attr = {
			{
				"atk",
				130
			},
			{
				"hp_max",
				650
			}
		}
	},
	{
		id = 14,
		lev = 14,
		res_id = 3,
		exp = 1500,
		items = {
			{
				10,
				150
			},
			{
				1,
				140000
			}
		},
		attr = {
			{
				"atk",
				140
			},
			{
				"hp_max",
				700
			}
		}
	},
	{
		id = 15,
		lev = 15,
		res_id = 3,
		exp = 1680,
		items = {
			{
				10,
				150
			},
			{
				1,
				150000
			}
		},
		attr = {
			{
				"atk",
				150
			},
			{
				"hp_max",
				750
			}
		}
	},
	{
		id = 16,
		lev = 16,
		res_id = 3,
		exp = 1870,
		items = {
			{
				10,
				150
			},
			{
				1,
				160000
			}
		},
		attr = {
			{
				"atk",
				160
			},
			{
				"hp_max",
				800
			}
		}
	},
	{
		id = 17,
		lev = 17,
		res_id = 3,
		exp = 2070,
		items = {
			{
				10,
				150
			},
			{
				1,
				170000
			}
		},
		attr = {
			{
				"atk",
				170
			},
			{
				"hp_max",
				850
			}
		}
	},
	{
		id = 18,
		lev = 18,
		res_id = 3,
		exp = 2280,
		items = {
			{
				10,
				150
			},
			{
				1,
				180000
			}
		},
		attr = {
			{
				"atk",
				180
			},
			{
				"hp_max",
				900
			}
		}
	},
	{
		id = 19,
		lev = 19,
		res_id = 3,
		exp = 2500,
		items = {
			{
				10,
				150
			},
			{
				1,
				190000
			}
		},
		attr = {
			{
				"atk",
				190
			},
			{
				"hp_max",
				950
			}
		}
	},
	{
		id = 20,
		lev = 20,
		res_id = 3,
		exp = 2730,
		items = {
			{
				10,
				150
			},
			{
				1,
				200000
			}
		},
		attr = {
			{
				"atk",
				200
			},
			{
				"hp_max",
				1000
			}
		}
	},
	{
		id = 21,
		lev = 21,
		res_id = 4,
		exp = 2970,
		items = {
			{
				10,
				200
			},
			{
				1,
				210000
			}
		},
		attr = {
			{
				"atk",
				210
			},
			{
				"hp_max",
				1050
			}
		}
	},
	{
		id = 22,
		lev = 22,
		res_id = 4,
		exp = 3220,
		items = {
			{
				10,
				200
			},
			{
				1,
				220000
			}
		},
		attr = {
			{
				"atk",
				220
			},
			{
				"hp_max",
				1100
			}
		}
	},
	{
		id = 23,
		lev = 23,
		res_id = 4,
		exp = 3480,
		items = {
			{
				10,
				200
			},
			{
				1,
				230000
			}
		},
		attr = {
			{
				"atk",
				230
			},
			{
				"hp_max",
				1150
			}
		}
	},
	{
		id = 24,
		lev = 24,
		res_id = 4,
		exp = 3750,
		items = {
			{
				10,
				200
			},
			{
				1,
				240000
			}
		},
		attr = {
			{
				"atk",
				240
			},
			{
				"hp_max",
				1200
			}
		}
	},
	{
		id = 25,
		lev = 25,
		res_id = 4,
		exp = 4030,
		items = {
			{
				10,
				200
			},
			{
				1,
				250000
			}
		},
		attr = {
			{
				"atk",
				250
			},
			{
				"hp_max",
				1250
			}
		}
	},
	{
		id = 26,
		lev = 26,
		res_id = 4,
		exp = 4320,
		items = {
			{
				10,
				200
			},
			{
				1,
				260000
			}
		},
		attr = {
			{
				"atk",
				260
			},
			{
				"hp_max",
				1300
			}
		}
	},
	{
		id = 27,
		lev = 27,
		res_id = 4,
		exp = 4620,
		items = {
			{
				10,
				200
			},
			{
				1,
				270000
			}
		},
		attr = {
			{
				"atk",
				270
			},
			{
				"hp_max",
				1350
			}
		}
	},
	{
		id = 28,
		lev = 28,
		res_id = 4,
		exp = 4930,
		items = {
			{
				10,
				200
			},
			{
				1,
				280000
			}
		},
		attr = {
			{
				"atk",
				280
			},
			{
				"hp_max",
				1400
			}
		}
	},
	{
		id = 29,
		lev = 29,
		res_id = 4,
		exp = 5250,
		items = {
			{
				10,
				200
			},
			{
				1,
				290000
			}
		},
		attr = {
			{
				"atk",
				290
			},
			{
				"hp_max",
				1450
			}
		}
	},
	{
		id = 30,
		lev = 30,
		res_id = 4,
		exp = 5580,
		items = {
			{
				10,
				200
			},
			{
				1,
				300000
			}
		},
		attr = {
			{
				"atk",
				300
			},
			{
				"hp_max",
				1500
			}
		}
	},
	{
		id = 31,
		lev = 31,
		res_id = 5,
		exp = 5920,
		items = {
			{
				10,
				250
			},
			{
				1,
				310000
			}
		},
		attr = {
			{
				"atk",
				310
			},
			{
				"hp_max",
				1550
			}
		}
	},
	{
		id = 32,
		lev = 32,
		res_id = 5,
		exp = 6270,
		items = {
			{
				10,
				250
			},
			{
				1,
				320000
			}
		},
		attr = {
			{
				"atk",
				320
			},
			{
				"hp_max",
				1600
			}
		}
	},
	{
		id = 33,
		lev = 33,
		res_id = 5,
		exp = 6630,
		items = {
			{
				10,
				250
			},
			{
				1,
				330000
			}
		},
		attr = {
			{
				"atk",
				330
			},
			{
				"hp_max",
				1650
			}
		}
	},
	{
		id = 34,
		lev = 34,
		res_id = 5,
		exp = 7000,
		items = {
			{
				10,
				250
			},
			{
				1,
				340000
			}
		},
		attr = {
			{
				"atk",
				340
			},
			{
				"hp_max",
				1700
			}
		}
	},
	{
		id = 35,
		lev = 35,
		res_id = 5,
		exp = 7380,
		items = {
			{
				10,
				250
			},
			{
				1,
				350000
			}
		},
		attr = {
			{
				"atk",
				350
			},
			{
				"hp_max",
				1750
			}
		}
	},
	{
		id = 36,
		lev = 36,
		res_id = 5,
		exp = 7770,
		items = {
			{
				10,
				250
			},
			{
				1,
				360000
			}
		},
		attr = {
			{
				"atk",
				360
			},
			{
				"hp_max",
				1800
			}
		}
	},
	{
		id = 37,
		lev = 37,
		res_id = 5,
		exp = 8170,
		items = {
			{
				10,
				250
			},
			{
				1,
				370000
			}
		},
		attr = {
			{
				"atk",
				370
			},
			{
				"hp_max",
				1850
			}
		}
	},
	{
		id = 38,
		lev = 38,
		res_id = 5,
		exp = 8580,
		items = {
			{
				10,
				250
			},
			{
				1,
				380000
			}
		},
		attr = {
			{
				"atk",
				380
			},
			{
				"hp_max",
				1900
			}
		}
	},
	{
		id = 39,
		lev = 39,
		res_id = 5,
		exp = 9000,
		items = {
			{
				10,
				250
			},
			{
				1,
				390000
			}
		},
		attr = {
			{
				"atk",
				390
			},
			{
				"hp_max",
				1950
			}
		}
	},
	{
		id = 40,
		lev = 40,
		res_id = 5,
		exp = 9430,
		items = {
			{
				10,
				250
			},
			{
				1,
				400000
			}
		},
		attr = {
			{
				"atk",
				400
			},
			{
				"hp_max",
				2000
			}
		}
	},
	{
		id = 41,
		lev = 41,
		res_id = 6,
		exp = 9870,
		items = {
			{
				10,
				300
			},
			{
				1,
				410000
			}
		},
		attr = {
			{
				"atk",
				410
			},
			{
				"hp_max",
				2050
			}
		}
	},
	{
		id = 42,
		lev = 42,
		res_id = 6,
		exp = 10320,
		items = {
			{
				10,
				300
			},
			{
				1,
				420000
			}
		},
		attr = {
			{
				"atk",
				420
			},
			{
				"hp_max",
				2100
			}
		}
	},
	{
		id = 43,
		lev = 43,
		res_id = 6,
		exp = 10780,
		items = {
			{
				10,
				300
			},
			{
				1,
				430000
			}
		},
		attr = {
			{
				"atk",
				430
			},
			{
				"hp_max",
				2150
			}
		}
	},
	{
		id = 44,
		lev = 44,
		res_id = 6,
		exp = 11250,
		items = {
			{
				10,
				300
			},
			{
				1,
				440000
			}
		},
		attr = {
			{
				"atk",
				440
			},
			{
				"hp_max",
				2200
			}
		}
	},
	{
		id = 45,
		lev = 45,
		res_id = 6,
		exp = 11730,
		items = {
			{
				10,
				300
			},
			{
				1,
				450000
			}
		},
		attr = {
			{
				"atk",
				450
			},
			{
				"hp_max",
				2250
			}
		}
	},
	{
		id = 46,
		lev = 46,
		res_id = 6,
		exp = 12220,
		items = {
			{
				10,
				300
			},
			{
				1,
				460000
			}
		},
		attr = {
			{
				"atk",
				460
			},
			{
				"hp_max",
				2300
			}
		}
	},
	{
		id = 47,
		lev = 47,
		res_id = 6,
		exp = 12720,
		items = {
			{
				10,
				300
			},
			{
				1,
				470000
			}
		},
		attr = {
			{
				"atk",
				470
			},
			{
				"hp_max",
				2350
			}
		}
	},
	{
		id = 48,
		lev = 48,
		res_id = 6,
		exp = 13230,
		items = {
			{
				10,
				300
			},
			{
				1,
				480000
			}
		},
		attr = {
			{
				"atk",
				480
			},
			{
				"hp_max",
				2400
			}
		}
	},
	{
		id = 49,
		lev = 49,
		res_id = 6,
		exp = 13750,
		items = {
			{
				10,
				300
			},
			{
				1,
				490000
			}
		},
		attr = {
			{
				"atk",
				490
			},
			{
				"hp_max",
				2450
			}
		}
	},
	{
		id = 50,
		lev = 50,
		res_id = 6,
		exp = 0,
		items = {
			{
				10,
				300
			},
			{
				1,
				500000
			}
		},
		attr = {
			{
				"atk",
				500
			},
			{
				"hp_max",
				2500
			}
		}
	}
}

function Config.GuildQuestData.data_lev_data_fun(slot0)
	slot1 = Config.GuildQuestData.data_lev_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildQuestData.data_lev_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildQuestData.data_task_data_length = 9
Config.GuildQuestData.data_task_data = {
	{
		id = 101,
		name = "升级公会技能",
		show_jump = "evt_league_skill",
		type = 1,
		exp = 10,
		desc = "升级公会技能",
		progress = {
			{
				cli_label = "evt_guild_skill",
				target = 0,
				target_val = 3,
				param = {}
			}
		}
	},
	{
		id = 102,
		name = "挑战公会副本",
		show_jump = "evt_league_dungeon",
		type = 1,
		exp = 5,
		desc = "挑战公会副本",
		progress = {
			{
				cli_label = "evt_guild_dun_fight",
				target = 0,
				target_val = 3,
				param = {}
			}
		}
	},
	{
		id = 107,
		name = "公会商城消费",
		show_jump = "evt_league_shop",
		type = 1,
		exp = 5,
		desc = "公会商城消费",
		progress = {
			{
				cli_label = "evt_exchange",
				target = 0,
				target_val = 2,
				param = {
					5
				}
			}
		}
	},
	{
		id = 108,
		name = "贝里捐献",
		show_jump = "evt_league_donate",
		type = 1,
		exp = 5,
		desc = "贝里捐献",
		progress = {
			{
				cli_label = "evt_guild_donate",
				target = 1,
				target_val = 1,
				param = {}
			}
		}
	},
	{
		id = 109,
		name = "钻石捐献",
		show_jump = "evt_league_donate",
		type = 1,
		exp = 10,
		desc = "钻石捐献",
		progress = {
			{
				cli_label = "evt_guild_donate",
				target = 2,
				target_val = 1,
				param = {}
			}
		}
	},
	{
		id = 110,
		name = "至尊钻石捐献",
		show_jump = "evt_league_donate",
		type = 1,
		exp = 20,
		desc = "至尊钻石捐献",
		progress = {
			{
				cli_label = "evt_guild_donate",
				target = 3,
				target_val = 1,
				param = {}
			}
		}
	},
	{
		id = 111,
		name = "发送任意红包",
		show_jump = "evt_league_redpacket",
		type = 1,
		exp = 20,
		desc = "发送任意红包",
		progress = {
			{
				cli_label = "evt_guild_mem_red_packet_send",
				target = 0,
				target_val = 1,
				param = {}
			}
		}
	},
	{
		id = 112,
		name = "参与1次公会战挑战",
		show_jump = "evt_league_war",
		type = 1,
		exp = 10,
		desc = "参与1次公会战挑战",
		progress = {
			{
				cli_label = "evt_guild_war",
				target = 0,
				target_val = 1,
				param = {}
			}
		}
	},
	{
		id = 201,
		name = "公会副本增益加成",
		show_jump = "evt_league_dungeon",
		type = 2,
		exp = 50,
		desc = "公会副本增益加成",
		progress = {
			{
				cli_label = "evt_guild_dun_buff",
				target = 0,
				target_val = 1,
				param = {}
			}
		}
	}
}

function Config.GuildQuestData.data_task_data_fun(slot0)
	slot1 = Config.GuildQuestData.data_task_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.GuildQuestData.data_task_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.GuildQuestData.data_max_lev_length = 6
Config.GuildQuestData.data_max_lev = {
	0,
	5,
	11,
	21,
	31,
	41
}
