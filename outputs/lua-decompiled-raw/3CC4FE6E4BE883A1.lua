Config = Config or {}
Config.PartnerSkillData = Config.PartnerSkillData or {}
Config.PartnerSkillData.data_partner_skill_const_length = 2
Config.PartnerSkillData.data_partner_skill_const = {
	skill_slot = {
		code = "skill_slot",
		desc = "天赋栏开启条件",
		val = {
			"star",
			6
		}
	},
	skill_rule = {
		val = 1,
		code = "skill_rule",
		desc = [[
1.每个天赋栏可消耗对应的技能符石使英雄领悟对应技能，技能符石可在[技能商店]中消耗符文精华购买
2.领悟了的技能可消耗对应技能符石进行升级
3.可通过[遗忘]技能来重新领悟技能
4.[遗忘]技能后，将根据技能等级返还一定的符文精华
5.若领悟的技能与符文携带的技能为同类型，则优先且只生效高级别的技能]]
	}
}

function Config.PartnerSkillData.data_partner_skill_const_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_pos_length = 3
Config.PartnerSkillData.data_partner_skill_pos = {
	{
		pos = 1,
		pos_limit = {
			"star",
			6
		}
	},
	{
		pos = 2,
		pos_limit = {
			"star",
			11
		}
	},
	{
		pos = 3,
		pos_limit = {
			"star",
			13
		}
	}
}

function Config.PartnerSkillData.data_partner_skill_pos_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_pos[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_pos[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_learn_length = 56
Config.PartnerSkillData.data_partner_skill_learn = {
	[700001] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700001,
		order_magician = 2,
		order = 1,
		expend = {
			{
				16001,
				1
			}
		},
		limit_career = {}
	},
	[700011] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 5,
		id = 700011,
		order_magician = 1000,
		order = 2,
		expend = {
			{
				16002,
				1
			}
		},
		limit_career = {}
	},
	[700021] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 6,
		id = 700021,
		order_magician = 1000,
		order = 3,
		expend = {
			{
				16003,
				1
			}
		},
		limit_career = {}
	},
	[700031] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 7,
		id = 700031,
		order_magician = 1000,
		order = 4,
		expend = {
			{
				16004,
				1
			}
		},
		limit_career = {}
	},
	[700041] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 8,
		id = 700041,
		order_magician = 1000,
		order = 5,
		expend = {
			{
				16005,
				1
			}
		},
		limit_career = {}
	},
	[700051] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 10,
		id = 700051,
		order_magician = 10,
		order = 6,
		expend = {
			{
				16006,
				1
			}
		},
		limit_career = {}
	},
	[700061] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700061,
		order_magician = 1000,
		order = 7,
		expend = {
			{
				16007,
				1
			}
		},
		limit_career = {}
	},
	[700071] = {
		order_ssistant = 10,
		order_tank = 10,
		order_warrior = 1000,
		id = 700071,
		order_magician = 9,
		order = 8,
		expend = {
			{
				16008,
				1
			}
		},
		limit_career = {}
	},
	[700081] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700081,
		order_magician = 1000,
		order = 9,
		expend = {
			{
				16009,
				1
			}
		},
		limit_career = {}
	},
	[700091] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700091,
		order_magician = 1000,
		order = 10,
		expend = {
			{
				16010,
				1
			}
		},
		limit_career = {}
	},
	[700101] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700101,
		order_magician = 8,
		order = 11,
		expend = {
			{
				16011,
				1
			}
		},
		limit_career = {}
	},
	[700111] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700111,
		order_magician = 7,
		order = 12,
		expend = {
			{
				16012,
				1
			}
		},
		limit_career = {}
	},
	[700121] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700121,
		order_magician = 6,
		order = 13,
		expend = {
			{
				16013,
				1
			}
		},
		limit_career = {}
	},
	[700131] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 4,
		id = 700131,
		order_magician = 1000,
		order = 14,
		expend = {
			{
				16014,
				1
			}
		},
		limit_career = {}
	},
	[700141] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700141,
		order_magician = 1000,
		order = 15,
		expend = {
			{
				16015,
				1
			}
		},
		limit_career = {}
	},
	[700151] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700151,
		order_magician = 5,
		order = 16,
		expend = {
			{
				16016,
				1
			}
		},
		limit_career = {}
	},
	[700161] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700161,
		order_magician = 1000,
		order = 17,
		expend = {
			{
				16017,
				1
			}
		},
		limit_career = {}
	},
	[700171] = {
		order_ssistant = 7,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700171,
		order_magician = 1000,
		order = 18,
		expend = {
			{
				16018,
				1
			}
		},
		limit_career = {}
	},
	[700181] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700181,
		order_magician = 1000,
		order = 19,
		expend = {
			{
				16019,
				1
			}
		},
		limit_career = {}
	},
	[700191] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700191,
		order_magician = 1000,
		order = 20,
		expend = {
			{
				16020,
				1
			}
		},
		limit_career = {}
	},
	[700201] = {
		order_ssistant = 5,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700201,
		order_magician = 1000,
		order = 21,
		expend = {
			{
				16021,
				1
			}
		},
		limit_career = {}
	},
	[700211] = {
		order_ssistant = 6,
		order_tank = 6,
		order_warrior = 1000,
		id = 700211,
		order_magician = 1000,
		order = 22,
		expend = {
			{
				16022,
				1
			}
		},
		limit_career = {}
	},
	[700221] = {
		order_ssistant = 8,
		order_tank = 9,
		order_warrior = 1000,
		id = 700221,
		order_magician = 1000,
		order = 23,
		expend = {
			{
				16023,
				1
			}
		},
		limit_career = {}
	},
	[700231] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700231,
		order_magician = 1000,
		order = 24,
		expend = {
			{
				16024,
				1
			}
		},
		limit_career = {}
	},
	[700241] = {
		order_ssistant = 1000,
		order_tank = 5,
		order_warrior = 1000,
		id = 700241,
		order_magician = 1000,
		order = 25,
		expend = {
			{
				16025,
				1
			}
		},
		limit_career = {}
	},
	[700251] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700251,
		order_magician = 1000,
		order = 26,
		expend = {
			{
				16026,
				1
			}
		},
		limit_career = {}
	},
	[700261] = {
		order_ssistant = 1000,
		order_tank = 4,
		order_warrior = 1000,
		id = 700261,
		order_magician = 1000,
		order = 27,
		expend = {
			{
				16027,
				1
			}
		},
		limit_career = {}
	},
	[700271] = {
		order_ssistant = 1000,
		order_tank = 3,
		order_warrior = 1000,
		id = 700271,
		order_magician = 1000,
		order = 28,
		expend = {
			{
				16028,
				1
			}
		},
		limit_career = {}
	},
	[700291] = {
		order_ssistant = 1,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700291,
		order_magician = 1000,
		order = 29,
		expend = {
			{
				16029,
				1
			}
		},
		limit_career = {}
	},
	[700301] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700301,
		order_magician = 1000,
		order = 30,
		expend = {
			{
				16030,
				1
			}
		},
		limit_career = {}
	},
	[700311] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 3,
		id = 700311,
		order_magician = 3,
		order = 31,
		expend = {
			{
				16031,
				1
			}
		},
		limit_career = {}
	},
	[700321] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700321,
		order_magician = 1000,
		order = 32,
		expend = {
			{
				16032,
				1
			}
		},
		limit_career = {}
	},
	[750000] = {
		order_ssistant = 2,
		order_tank = 1000,
		order_warrior = 1000,
		id = 750000,
		order_magician = 1,
		order = 33,
		expend = {
			{
				16033,
				1
			}
		},
		limit_career = {}
	},
	[750100] = {
		order_ssistant = 9,
		order_tank = 8,
		order_warrior = 1000,
		id = 750100,
		order_magician = 1000,
		order = 34,
		expend = {
			{
				16034,
				1
			}
		},
		limit_career = {}
	},
	[750200] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1,
		id = 750200,
		order_magician = 1000,
		order = 35,
		expend = {
			{
				16035,
				1
			}
		},
		limit_career = {}
	},
	[750400] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 2,
		id = 750400,
		order_magician = 1000,
		order = 36,
		expend = {
			{
				16036,
				1
			}
		},
		limit_career = {}
	},
	[700281] = {
		order_ssistant = 3,
		order_tank = 7,
		order_warrior = 1000,
		id = 700281,
		order_magician = 1000,
		order = 37,
		expend = {
			{
				16037,
				1
			}
		},
		limit_career = {}
	},
	[700361] = {
		order_ssistant = 1000,
		order_tank = 1,
		order_warrior = 1000,
		id = 700361,
		order_magician = 1000,
		order = 38,
		expend = {
			{
				16038,
				1
			}
		},
		limit_career = {}
	},
	[700371] = {
		order_ssistant = 4,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700371,
		order_magician = 1000,
		order = 39,
		expend = {
			{
				16039,
				1
			}
		},
		limit_career = {}
	},
	[700381] = {
		order_ssistant = 1000,
		order_tank = 2,
		order_warrior = 1000,
		id = 700381,
		order_magician = 1000,
		order = 40,
		expend = {
			{
				16040,
				1
			}
		},
		limit_career = {}
	},
	[700391] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 9,
		id = 700391,
		order_magician = 1000,
		order = 41,
		expend = {
			{
				16041,
				1
			}
		},
		limit_career = {}
	},
	[700401] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700401,
		order_magician = 4,
		order = 42,
		expend = {
			{
				16042,
				1
			}
		},
		limit_career = {}
	},
	[700411] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700411,
		order_magician = 1000,
		order = 43,
		expend = {
			{
				16043,
				1
			}
		},
		limit_career = {}
	},
	[700421] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700421,
		order_magician = 1000,
		order = 44,
		expend = {
			{
				16044,
				1
			}
		},
		limit_career = {}
	},
	[700431] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700431,
		order_magician = 1000,
		order = 45,
		expend = {
			{
				16045,
				1
			}
		},
		limit_career = {}
	},
	[700441] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700441,
		order_magician = 1000,
		order = 46,
		expend = {
			{
				16046,
				1
			}
		},
		limit_career = {}
	},
	[700451] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 700451,
		order_magician = 1000,
		order = 47,
		expend = {
			{
				16047,
				1
			}
		},
		limit_career = {}
	},
	[701001] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701001,
		order_magician = 1000,
		order = 1000,
		expend = {
			{
				16101,
				1
			}
		},
		limit_career = {
			{
				3
			}
		}
	},
	[701011] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701011,
		order_magician = 1000,
		order = 1001,
		expend = {
			{
				16102,
				1
			}
		},
		limit_career = {
			{
				3
			}
		}
	},
	[701021] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701021,
		order_magician = 1000,
		order = 1002,
		expend = {
			{
				16103,
				1
			}
		},
		limit_career = {
			{
				2
			}
		}
	},
	[701031] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701031,
		order_magician = 1000,
		order = 1003,
		expend = {
			{
				16104,
				1
			}
		},
		limit_career = {
			{
				2
			}
		}
	},
	[701041] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701041,
		order_magician = 1000,
		order = 1004,
		expend = {
			{
				16105,
				1
			}
		},
		limit_career = {
			{
				4
			}
		}
	},
	[701051] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701051,
		order_magician = 1000,
		order = 1005,
		expend = {
			{
				16106,
				1
			}
		},
		limit_career = {
			{
				4
			}
		}
	},
	[701061] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701061,
		order_magician = 1000,
		order = 1006,
		expend = {
			{
				16107,
				1
			}
		},
		limit_career = {
			{
				5
			}
		}
	},
	[701071] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701071,
		order_magician = 1000,
		order = 1007,
		expend = {
			{
				16108,
				1
			}
		},
		limit_career = {
			{
				5
			}
		}
	},
	[701081] = {
		order_ssistant = 1000,
		order_tank = 1000,
		order_warrior = 1000,
		id = 701081,
		order_magician = 1000,
		order = 1008,
		expend = {
			{
				16106,
				1
			}
		},
		limit_career = {
			{
				4
			}
		}
	}
}

function Config.PartnerSkillData.data_partner_skill_learn_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_learn[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_learn[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_commend_skill_length = 7
Config.PartnerSkillData.data_partner_commend_skill = {
	[20507] = {
		700291,
		750000,
		700281,
		700361,
		700201,
		700211,
		700171,
		700221,
		750100,
		700071
	},
	[40507] = {
		700291,
		700371,
		700281,
		700361,
		700201,
		700211,
		700171,
		700221,
		750100,
		700071
	},
	[40509] = {
		700291,
		700231,
		700281,
		700361,
		700201,
		700211,
		700171,
		700221,
		750100,
		700071
	},
	[40502] = {
		750000,
		700001,
		700321,
		700311,
		700151,
		700121,
		700111,
		700101,
		700071,
		700141
	},
	[40503] = {
		750000,
		700001,
		700311,
		700401,
		700131,
		700121,
		700111,
		700101,
		700071,
		700051
	},
	[30511] = {
		700071,
		750200,
		700281,
		700421,
		700151,
		700171,
		700251,
		700221,
		700311
	},
	[10510] = {
		750000,
		700001,
		700311,
		700401,
		700051,
		700041,
		700111,
		700191,
		700071,
		700051
	}
}
Config.PartnerSkillData.data_partner_skill_level_length = 165
Config.PartnerSkillData.data_partner_skill_level = {
	[700001] = {
		id = 700001,
		next_id = 700003,
		expend = {
			{
				16001,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700011] = {
		id = 700011,
		next_id = 700013,
		expend = {
			{
				16002,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700021] = {
		id = 700021,
		next_id = 700023,
		expend = {
			{
				16003,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700031] = {
		id = 700031,
		next_id = 700033,
		expend = {
			{
				16004,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700041] = {
		id = 700041,
		next_id = 700043,
		expend = {
			{
				16005,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700051] = {
		id = 700051,
		next_id = 700053,
		expend = {
			{
				16006,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700061] = {
		id = 700061,
		next_id = 700063,
		expend = {
			{
				16007,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700071] = {
		id = 700071,
		next_id = 700073,
		expend = {
			{
				16008,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700081] = {
		id = 700081,
		next_id = 700083,
		expend = {
			{
				16009,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700091] = {
		id = 700091,
		next_id = 700093,
		expend = {
			{
				16010,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700101] = {
		id = 700101,
		next_id = 700103,
		expend = {
			{
				16011,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700111] = {
		id = 700111,
		next_id = 700113,
		expend = {
			{
				16012,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700121] = {
		id = 700121,
		next_id = 700123,
		expend = {
			{
				16013,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700131] = {
		id = 700131,
		next_id = 700133,
		expend = {
			{
				16014,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700141] = {
		id = 700141,
		next_id = 700143,
		expend = {
			{
				16015,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700151] = {
		id = 700151,
		next_id = 700153,
		expend = {
			{
				16016,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700161] = {
		id = 700161,
		next_id = 700163,
		expend = {
			{
				16017,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700171] = {
		id = 700171,
		next_id = 700173,
		expend = {
			{
				16018,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700181] = {
		id = 700181,
		next_id = 700183,
		expend = {
			{
				16019,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700191] = {
		id = 700191,
		next_id = 700193,
		expend = {
			{
				16020,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700201] = {
		id = 700201,
		next_id = 700203,
		expend = {
			{
				16021,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700211] = {
		id = 700211,
		next_id = 700213,
		expend = {
			{
				16022,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700221] = {
		id = 700221,
		next_id = 700223,
		expend = {
			{
				16023,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700231] = {
		id = 700231,
		next_id = 700233,
		expend = {
			{
				16024,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700241] = {
		id = 700241,
		next_id = 700243,
		expend = {
			{
				16025,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700251] = {
		id = 700251,
		next_id = 700253,
		expend = {
			{
				16026,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700261] = {
		id = 700261,
		next_id = 700263,
		expend = {
			{
				16027,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700271] = {
		id = 700271,
		next_id = 700273,
		expend = {
			{
				16028,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700291] = {
		id = 700291,
		next_id = 700293,
		expend = {
			{
				16029,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700301] = {
		id = 700301,
		next_id = 700303,
		expend = {
			{
				16030,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700311] = {
		id = 700311,
		next_id = 700313,
		expend = {
			{
				16031,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700321] = {
		id = 700321,
		next_id = 700323,
		expend = {
			{
				16032,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[750000] = {
		id = 750000,
		next_id = 750001,
		expend = {
			{
				16033,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[750100] = {
		id = 750100,
		next_id = 750101,
		expend = {
			{
				16034,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[750200] = {
		id = 750200,
		next_id = 750201,
		expend = {
			{
				16035,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[750400] = {
		id = 750400,
		next_id = 750401,
		expend = {
			{
				16036,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700281] = {
		id = 700281,
		next_id = 700283,
		expend = {
			{
				16037,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700361] = {
		id = 700361,
		next_id = 700363,
		expend = {
			{
				16038,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700371] = {
		id = 700371,
		next_id = 700373,
		expend = {
			{
				16039,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700381] = {
		id = 700381,
		next_id = 700383,
		expend = {
			{
				16040,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700391] = {
		id = 700391,
		next_id = 700393,
		expend = {
			{
				16041,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700401] = {
		id = 700401,
		next_id = 700403,
		expend = {
			{
				16042,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700411] = {
		id = 700411,
		next_id = 700413,
		expend = {
			{
				16043,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700421] = {
		id = 700421,
		next_id = 700423,
		expend = {
			{
				16044,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700431] = {
		id = 700431,
		next_id = 700433,
		expend = {
			{
				16045,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700441] = {
		id = 700441,
		next_id = 700443,
		expend = {
			{
				16046,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[700451] = {
		id = 700451,
		next_id = 700453,
		expend = {
			{
				16047,
				3
			},
			{
				10450,
				10000
			}
		}
	},
	[701001] = {
		id = 701001,
		next_id = 701003,
		expend = {
			{
				16101,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701011] = {
		id = 701011,
		next_id = 701013,
		expend = {
			{
				16102,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701021] = {
		id = 701021,
		next_id = 701023,
		expend = {
			{
				16103,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701031] = {
		id = 701031,
		next_id = 701033,
		expend = {
			{
				16104,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701041] = {
		id = 701041,
		next_id = 701043,
		expend = {
			{
				16105,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701051] = {
		id = 701051,
		next_id = 701053,
		expend = {
			{
				16106,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701061] = {
		id = 701061,
		next_id = 701063,
		expend = {
			{
				16107,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[701071] = {
		id = 701071,
		next_id = 701073,
		expend = {
			{
				16108,
				3
			},
			{
				10460,
				10
			}
		}
	},
	[700003] = {
		id = 700003,
		next_id = 700005,
		expend = {
			{
				16001,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700013] = {
		id = 700013,
		next_id = 700015,
		expend = {
			{
				16002,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700023] = {
		id = 700023,
		next_id = 700025,
		expend = {
			{
				16003,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700033] = {
		id = 700033,
		next_id = 700035,
		expend = {
			{
				16004,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700043] = {
		id = 700043,
		next_id = 700045,
		expend = {
			{
				16005,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700053] = {
		id = 700053,
		next_id = 700055,
		expend = {
			{
				16006,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700063] = {
		id = 700063,
		next_id = 700065,
		expend = {
			{
				16007,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700073] = {
		id = 700073,
		next_id = 700075,
		expend = {
			{
				16008,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700083] = {
		id = 700083,
		next_id = 700085,
		expend = {
			{
				16009,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700093] = {
		id = 700093,
		next_id = 700095,
		expend = {
			{
				16010,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700103] = {
		id = 700103,
		next_id = 700105,
		expend = {
			{
				16011,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700113] = {
		id = 700113,
		next_id = 700115,
		expend = {
			{
				16012,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700123] = {
		id = 700123,
		next_id = 700125,
		expend = {
			{
				16013,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700133] = {
		id = 700133,
		next_id = 700135,
		expend = {
			{
				16014,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700143] = {
		id = 700143,
		next_id = 700145,
		expend = {
			{
				16015,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700153] = {
		id = 700153,
		next_id = 700155,
		expend = {
			{
				16016,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700163] = {
		id = 700163,
		next_id = 700165,
		expend = {
			{
				16017,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700173] = {
		id = 700173,
		next_id = 700175,
		expend = {
			{
				16018,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700183] = {
		id = 700183,
		next_id = 700185,
		expend = {
			{
				16019,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700193] = {
		id = 700193,
		next_id = 700195,
		expend = {
			{
				16020,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700203] = {
		id = 700203,
		next_id = 700205,
		expend = {
			{
				16021,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700213] = {
		id = 700213,
		next_id = 700215,
		expend = {
			{
				16022,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700223] = {
		id = 700223,
		next_id = 700225,
		expend = {
			{
				16023,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700233] = {
		id = 700233,
		next_id = 700235,
		expend = {
			{
				16024,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700243] = {
		id = 700243,
		next_id = 700245,
		expend = {
			{
				16025,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700253] = {
		id = 700253,
		next_id = 700255,
		expend = {
			{
				16026,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700263] = {
		id = 700263,
		next_id = 700265,
		expend = {
			{
				16027,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700273] = {
		id = 700273,
		next_id = 700275,
		expend = {
			{
				16028,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700293] = {
		id = 700293,
		next_id = 700295,
		expend = {
			{
				16029,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700303] = {
		id = 700303,
		next_id = 700305,
		expend = {
			{
				16030,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700313] = {
		id = 700313,
		next_id = 700315,
		expend = {
			{
				16031,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700323] = {
		id = 700323,
		next_id = 700325,
		expend = {
			{
				16032,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750001] = {
		id = 750001,
		next_id = 750002,
		expend = {
			{
				16033,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750101] = {
		id = 750101,
		next_id = 750102,
		expend = {
			{
				16034,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750201] = {
		id = 750201,
		next_id = 750202,
		expend = {
			{
				16035,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750401] = {
		id = 750401,
		next_id = 750402,
		expend = {
			{
				16036,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700283] = {
		id = 700283,
		next_id = 700285,
		expend = {
			{
				16037,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700363] = {
		id = 700363,
		next_id = 700365,
		expend = {
			{
				16038,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700373] = {
		id = 700373,
		next_id = 700375,
		expend = {
			{
				16039,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700383] = {
		id = 700383,
		next_id = 700385,
		expend = {
			{
				16040,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700393] = {
		id = 700393,
		next_id = 700395,
		expend = {
			{
				16041,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700403] = {
		id = 700403,
		next_id = 700405,
		expend = {
			{
				16042,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700413] = {
		id = 700413,
		next_id = 700415,
		expend = {
			{
				16043,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700423] = {
		id = 700423,
		next_id = 700425,
		expend = {
			{
				16044,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700433] = {
		id = 700433,
		next_id = 700435,
		expend = {
			{
				16045,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700443] = {
		id = 700443,
		next_id = 700445,
		expend = {
			{
				16046,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700453] = {
		id = 700453,
		next_id = 700455,
		expend = {
			{
				16047,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[701003] = {
		id = 701003,
		next_id = 701005,
		expend = {
			{
				16101,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701013] = {
		id = 701013,
		next_id = 701015,
		expend = {
			{
				16102,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701023] = {
		id = 701023,
		next_id = 701025,
		expend = {
			{
				16103,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701033] = {
		id = 701033,
		next_id = 701035,
		expend = {
			{
				16104,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701043] = {
		id = 701043,
		next_id = 701045,
		expend = {
			{
				16105,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701053] = {
		id = 701053,
		next_id = 701055,
		expend = {
			{
				16106,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701063] = {
		id = 701063,
		next_id = 701065,
		expend = {
			{
				16107,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[701073] = {
		id = 701073,
		next_id = 701075,
		expend = {
			{
				16108,
				5
			},
			{
				10460,
				20
			}
		}
	},
	[700005] = {
		id = 700005,
		next_id = 700006,
		expend = {
			{
				16001,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700015] = {
		id = 700015,
		next_id = 700016,
		expend = {
			{
				16002,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700025] = {
		id = 700025,
		next_id = 700026,
		expend = {
			{
				16003,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700035] = {
		id = 700035,
		next_id = 700036,
		expend = {
			{
				16004,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700045] = {
		id = 700045,
		next_id = 700046,
		expend = {
			{
				16005,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700055] = {
		id = 700055,
		next_id = 700056,
		expend = {
			{
				16006,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700065] = {
		id = 700065,
		next_id = 700066,
		expend = {
			{
				16007,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700075] = {
		id = 700075,
		next_id = 700076,
		expend = {
			{
				16008,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700085] = {
		id = 700085,
		next_id = 700086,
		expend = {
			{
				16009,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700095] = {
		id = 700095,
		next_id = 700096,
		expend = {
			{
				16010,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700105] = {
		id = 700105,
		next_id = 700106,
		expend = {
			{
				16011,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700115] = {
		id = 700115,
		next_id = 700116,
		expend = {
			{
				16012,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700125] = {
		id = 700125,
		next_id = 700126,
		expend = {
			{
				16013,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700135] = {
		id = 700135,
		next_id = 700136,
		expend = {
			{
				16014,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700145] = {
		id = 700145,
		next_id = 700146,
		expend = {
			{
				16015,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700155] = {
		id = 700155,
		next_id = 700156,
		expend = {
			{
				16016,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700165] = {
		id = 700165,
		next_id = 700166,
		expend = {
			{
				16017,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700175] = {
		id = 700175,
		next_id = 700176,
		expend = {
			{
				16018,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700185] = {
		id = 700185,
		next_id = 700186,
		expend = {
			{
				16019,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700195] = {
		id = 700195,
		next_id = 700196,
		expend = {
			{
				16020,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700205] = {
		id = 700205,
		next_id = 700206,
		expend = {
			{
				16021,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700215] = {
		id = 700215,
		next_id = 700216,
		expend = {
			{
				16022,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700225] = {
		id = 700225,
		next_id = 700226,
		expend = {
			{
				16023,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700235] = {
		id = 700235,
		next_id = 700236,
		expend = {
			{
				16024,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700245] = {
		id = 700245,
		next_id = 700246,
		expend = {
			{
				16025,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700255] = {
		id = 700255,
		next_id = 700256,
		expend = {
			{
				16026,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700265] = {
		id = 700265,
		next_id = 700266,
		expend = {
			{
				16027,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700275] = {
		id = 700275,
		next_id = 700276,
		expend = {
			{
				16028,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700295] = {
		id = 700295,
		next_id = 700296,
		expend = {
			{
				16029,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700305] = {
		id = 700305,
		next_id = 700306,
		expend = {
			{
				16030,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700315] = {
		id = 700315,
		next_id = 700316,
		expend = {
			{
				16031,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700325] = {
		id = 700325,
		next_id = 700326,
		expend = {
			{
				16032,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750002] = {
		id = 750002,
		next_id = 750003,
		expend = {
			{
				16033,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750102] = {
		id = 750102,
		next_id = 750103,
		expend = {
			{
				16034,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750202] = {
		id = 750202,
		next_id = 750203,
		expend = {
			{
				16035,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[750402] = {
		id = 750402,
		next_id = 750403,
		expend = {
			{
				16036,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700285] = {
		id = 700285,
		next_id = 700286,
		expend = {
			{
				16037,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700365] = {
		id = 700365,
		next_id = 700366,
		expend = {
			{
				16038,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700375] = {
		id = 700375,
		next_id = 700376,
		expend = {
			{
				16039,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700385] = {
		id = 700385,
		next_id = 700386,
		expend = {
			{
				16040,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700395] = {
		id = 700395,
		next_id = 700396,
		expend = {
			{
				16041,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700405] = {
		id = 700405,
		next_id = 700406,
		expend = {
			{
				16042,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700415] = {
		id = 700415,
		next_id = 700416,
		expend = {
			{
				16043,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700425] = {
		id = 700425,
		next_id = 700426,
		expend = {
			{
				16044,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700435] = {
		id = 700435,
		next_id = 700436,
		expend = {
			{
				16045,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700445] = {
		id = 700445,
		next_id = 700446,
		expend = {
			{
				16046,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[700455] = {
		id = 700455,
		next_id = 700456,
		expend = {
			{
				16047,
				5
			},
			{
				10450,
				20000
			}
		}
	},
	[701005] = {
		id = 701005,
		next_id = 701007,
		expend = {
			{
				16101,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701015] = {
		id = 701015,
		next_id = 701017,
		expend = {
			{
				16102,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701025] = {
		id = 701025,
		next_id = 701027,
		expend = {
			{
				16103,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701035] = {
		id = 701035,
		next_id = 701037,
		expend = {
			{
				16104,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701045] = {
		id = 701045,
		next_id = 701047,
		expend = {
			{
				16105,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701055] = {
		id = 701055,
		next_id = 701057,
		expend = {
			{
				16106,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701065] = {
		id = 701065,
		next_id = 701067,
		expend = {
			{
				16107,
				10
			},
			{
				10460,
				20
			}
		}
	},
	[701075] = {
		id = 701075,
		next_id = 701077,
		expend = {
			{
				16108,
				10
			},
			{
				10460,
				20
			}
		}
	}
}

function Config.PartnerSkillData.data_partner_skill_level_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_level[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_level[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_map_length = 165
Config.PartnerSkillData.data_partner_skill_map = {
	[700326.0] = 700325,
	[700395.0] = 700393,
	[700083.0] = 700081,
	[700145.0] = 700143,
	[700393.0] = 700391,
	[700403.0] = 700401,
	[701003.0] = 701001,
	[700146.0] = 700145,
	[700365.0] = 700363,
	[701075.0] = 701073,
	[701005.0] = 701003,
	[750402.0] = 750401,
	[700135.0] = 700133,
	[750002.0] = 750001,
	[700325.0] = 700323,
	[700305.0] = 700303,
	[700136.0] = 700135,
	[700413.0] = 700411,
	[701073.0] = 701071,
	[700203.0] = 700201,
	[700265.0] = 700263,
	[700245.0] = 700243,
	[700185.0] = 700183,
	[700165.0] = 700163,
	[700266.0] = 700265,
	[700125.0] = 700123,
	[700133.0] = 700131,
	[701063.0] = 701061,
	[700225.0] = 700223,
	[700223.0] = 700221,
	[700253.0] = 700251,
	[700103.0] = 700101,
	[700143.0] = 700141,
	[700285.0] = 700283,
	[750102.0] = 750101,
	[700075.0] = 700073,
	[700005.0] = 700003,
	[700286.0] = 700285,
	[700375.0] = 700373,
	[700076.0] = 700075,
	[700006.0] = 700005,
	[700415.0] = 700413,
	[701067.0] = 701065,
	[700303.0] = 700301,
	[700073.0] = 700071,
	[700425.0] = 700423,
	[700013.0] = 700011,
	[700433.0] = 700431,
	[700045.0] = 700043,
	[700095.0] = 700093,
	[700405.0] = 700403,
	[701065.0] = 701063,
	[700196.0] = 700195,
	[700096.0] = 700095,
	[700406.0] = 700405,
	[700435.0] = 700433,
	[700163.0] = 700161,
	[700093.0] = 700091,
	[700423.0] = 700421,
	[750103.0] = 750102,
	[750403.0] = 750402,
	[700226.0] = 700225,
	[700023.0] = 700021,
	[700396.0] = 700395,
	[701023.0] = 701021,
	[700206.0] = 700205,
	[700215.0] = 700213,
	[700416.0] = 700415,
	[700426.0] = 700425,
	[700436.0] = 700435,
	[700216.0] = 700215,
	[700446.0] = 700445,
	[700035.0] = 700033,
	[700283.0] = 700281,
	[700213.0] = 700211,
	[700456.0] = 700455,
	[700036.0] = 700035,
	[701007.0] = 701005,
	[701047.0] = 701045,
	[701027.0] = 701025,
	[700383.0] = 700381,
	[700033.0] = 700031,
	[701077.0] = 701075,
	[750101.0] = 750100,
	[701025.0] = 701023,
	[700155.0] = 700153,
	[700085.0] = 700083,
	[700366.0] = 700365,
	[700156.0] = 700155,
	[700086.0] = 700085,
	[701015.0] = 701013,
	[700153.0] = 700151,
	[700175.0] = 700173,
	[701013.0] = 701011,
	[700176.0] = 700175,
	[700243.0] = 700241,
	[700173.0] = 700171,
	[700025.0] = 700023,
	[700306.0] = 700305,
	[700026.0] = 700025,
	[700295.0] = 700293,
	[701017.0] = 701015,
	[700296.0] = 700295,
	[700115.0] = 700113,
	[700363.0] = 700361,
	[700293.0] = 700291,
	[700116.0] = 700115,
	[700046.0] = 700045,
	[701037.0] = 701035,
	[700113.0] = 700111,
	[701043.0] = 701041,
	[700235.0] = 700233,
	[700445.0] = 700443,
	[700236.0] = 700235,
	[700166.0] = 700165,
	[700233.0] = 700231,
	[700255.0] = 700253,
	[700256.0] = 700255,
	[700323.0] = 700321,
	[700385.0] = 700383,
	[700043.0] = 700041,
	[700105.0] = 700103,
	[700386.0] = 700385,
	[700106.0] = 700105,
	[701035.0] = 701033,
	[700376.0] = 700375,
	[750001.0] = 750000,
	[700195.0] = 700193,
	[700063.0] = 700061,
	[700373.0] = 700371,
	[701033.0] = 701031,
	[700443.0] = 700441,
	[700126.0] = 700125,
	[750201.0] = 750200,
	[750003.0] = 750002,
	[701055.0] = 701053,
	[700193.0] = 700191,
	[750202.0] = 750201,
	[750401.0] = 750400,
	[750203.0] = 750202,
	[701053.0] = 701051,
	[700315.0] = 700313,
	[700183.0] = 700181,
	[700316.0] = 700315,
	[700246.0] = 700245,
	[700003.0] = 700001,
	[700065.0] = 700063,
	[700313.0] = 700311,
	[700066.0] = 700065,
	[701057.0] = 701055,
	[700055.0] = 700053,
	[700056.0] = 700055,
	[700123.0] = 700121,
	[700053.0] = 700051,
	[700186.0] = 700185,
	[701045.0] = 701043,
	[700455.0] = 700453,
	[700275.0] = 700273,
	[700205.0] = 700203,
	[700276.0] = 700275,
	[700453.0] = 700451,
	[700273.0] = 700271,
	[700015.0] = 700013,
	[700263.0] = 700261,
	[700016.0] = 700015
}

function Config.PartnerSkillData.data_partner_skill_map_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_map[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_map[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_back_length = 221
Config.PartnerSkillData.data_partner_skill_back = {
	[700001] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700011] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700021] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700031] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700041] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700051] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700061] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700071] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1500
			}
		}
	},
	[700081] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700091] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700101] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700111] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700121] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700131] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700141] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700151] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700161] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700171] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700181] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700191] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700201] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700211] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700221] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700231] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700241] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700251] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700261] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700271] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700291] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700301] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1000
			}
		}
	},
	[700311] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700321] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[750000] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1500
			}
		}
	},
	[750100] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[750200] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1500
			}
		}
	},
	[750400] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700281] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700361] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700371] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700381] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1250
			}
		}
	},
	[700391] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700401] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700411] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700421] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700431] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700441] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[700451] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10450,
				1375
			}
		}
	},
	[701001] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701011] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701021] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701031] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701041] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701051] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701061] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701071] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[701081] = {
		expend = {
			{
				3,
				100
			}
		},
		award1 = {
			{
				10460,
				2
			}
		}
	},
	[700003] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700013] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700023] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700033] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700043] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700053] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700063] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700073] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				11000
			}
		}
	},
	[700083] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700093] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700103] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700113] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700123] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700133] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700143] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700153] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700163] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700173] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700183] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700193] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700203] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700213] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700223] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700233] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700243] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700253] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700263] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700273] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700293] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700303] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				9000
			}
		}
	},
	[700313] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700323] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[750001] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				11000
			}
		}
	},
	[750101] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[750201] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				11000
			}
		}
	},
	[750401] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700283] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700363] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700373] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700383] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10000
			}
		}
	},
	[700393] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700403] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700413] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700423] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700433] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700443] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[700453] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10450,
				10500
			}
		}
	},
	[701003] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701013] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701023] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701033] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701043] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701053] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701063] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[701073] = {
		expend = {
			{
				3,
				200
			}
		},
		award1 = {
			{
				10460,
				13
			}
		}
	},
	[700005] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700015] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700025] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700035] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700045] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700055] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700065] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700075] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				28500
			}
		}
	},
	[700085] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700095] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700105] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700115] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700125] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700135] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700145] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700155] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700165] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700175] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700185] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700195] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700205] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700215] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700225] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700235] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700245] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700255] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700265] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700275] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700295] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700305] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700315] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700325] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[750002] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				28500
			}
		}
	},
	[750102] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[750202] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				28500
			}
		}
	},
	[750402] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700285] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700365] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700375] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700385] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700395] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700405] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700415] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700425] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700435] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700445] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700455] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[701005] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701015] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701025] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701035] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701045] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701055] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701065] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701075] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[700006] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700016] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700026] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700036] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700046] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700056] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700066] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700076] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				28500
			}
		}
	},
	[700086] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700096] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700106] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700116] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700126] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700136] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700146] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700156] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700166] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700176] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700186] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700196] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700206] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700216] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700226] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700236] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700246] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700256] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700266] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700276] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700296] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700306] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				24000
			}
		}
	},
	[700316] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700326] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[750003] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				28500
			}
		}
	},
	[750103] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[750203] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				28500
			}
		}
	},
	[750403] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700286] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700366] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700376] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700386] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				26250
			}
		}
	},
	[700396] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700406] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700416] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700426] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700436] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700446] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[700456] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10450,
				27375
			}
		}
	},
	[701007] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701017] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701027] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701037] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701047] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701057] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701067] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	},
	[701077] = {
		expend = {
			{
				3,
				500
			}
		},
		award1 = {
			{
				10460,
				33
			}
		}
	}
}

function Config.PartnerSkillData.data_partner_skill_back_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_back[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_back[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_getback_length = 221
Config.PartnerSkillData.data_partner_skill_getback = {
	[700001] = {
		spent_for_pick = {
			{
				16001,
				1
			}
		},
		award4 = {}
	},
	[700011] = {
		spent_for_pick = {
			{
				16002,
				1
			}
		},
		award4 = {}
	},
	[700021] = {
		spent_for_pick = {
			{
				16003,
				1
			}
		},
		award4 = {}
	},
	[700031] = {
		spent_for_pick = {
			{
				16004,
				1
			}
		},
		award4 = {}
	},
	[700041] = {
		spent_for_pick = {
			{
				16005,
				1
			}
		},
		award4 = {}
	},
	[700051] = {
		spent_for_pick = {
			{
				16006,
				1
			}
		},
		award4 = {}
	},
	[700061] = {
		spent_for_pick = {
			{
				16007,
				1
			}
		},
		award4 = {}
	},
	[700071] = {
		spent_for_pick = {
			{
				16008,
				1
			}
		},
		award4 = {}
	},
	[700081] = {
		spent_for_pick = {
			{
				16009,
				1
			}
		},
		award4 = {}
	},
	[700091] = {
		spent_for_pick = {
			{
				16010,
				1
			}
		},
		award4 = {}
	},
	[700101] = {
		spent_for_pick = {
			{
				16011,
				1
			}
		},
		award4 = {}
	},
	[700111] = {
		spent_for_pick = {
			{
				16012,
				1
			}
		},
		award4 = {}
	},
	[700121] = {
		spent_for_pick = {
			{
				16013,
				1
			}
		},
		award4 = {}
	},
	[700131] = {
		spent_for_pick = {
			{
				16014,
				1
			}
		},
		award4 = {}
	},
	[700141] = {
		spent_for_pick = {
			{
				16015,
				1
			}
		},
		award4 = {}
	},
	[700151] = {
		spent_for_pick = {
			{
				16016,
				1
			}
		},
		award4 = {}
	},
	[700161] = {
		spent_for_pick = {
			{
				16017,
				1
			}
		},
		award4 = {}
	},
	[700171] = {
		spent_for_pick = {
			{
				16018,
				1
			}
		},
		award4 = {}
	},
	[700181] = {
		spent_for_pick = {
			{
				16019,
				1
			}
		},
		award4 = {}
	},
	[700191] = {
		spent_for_pick = {
			{
				16020,
				1
			}
		},
		award4 = {}
	},
	[700201] = {
		spent_for_pick = {
			{
				16021,
				1
			}
		},
		award4 = {}
	},
	[700211] = {
		spent_for_pick = {
			{
				16022,
				1
			}
		},
		award4 = {}
	},
	[700221] = {
		spent_for_pick = {
			{
				16023,
				1
			}
		},
		award4 = {}
	},
	[700231] = {
		spent_for_pick = {
			{
				16024,
				1
			}
		},
		award4 = {}
	},
	[700241] = {
		spent_for_pick = {
			{
				16025,
				1
			}
		},
		award4 = {}
	},
	[700251] = {
		spent_for_pick = {
			{
				16026,
				1
			}
		},
		award4 = {}
	},
	[700261] = {
		spent_for_pick = {
			{
				16027,
				1
			}
		},
		award4 = {}
	},
	[700271] = {
		spent_for_pick = {
			{
				16028,
				1
			}
		},
		award4 = {}
	},
	[700291] = {
		spent_for_pick = {
			{
				16029,
				1
			}
		},
		award4 = {}
	},
	[700301] = {
		spent_for_pick = {
			{
				16030,
				1
			}
		},
		award4 = {}
	},
	[700311] = {
		spent_for_pick = {
			{
				16031,
				1
			}
		},
		award4 = {}
	},
	[700321] = {
		spent_for_pick = {
			{
				16032,
				1
			}
		},
		award4 = {}
	},
	[750000] = {
		spent_for_pick = {
			{
				16033,
				1
			}
		},
		award4 = {}
	},
	[750100] = {
		spent_for_pick = {
			{
				16034,
				1
			}
		},
		award4 = {}
	},
	[750200] = {
		spent_for_pick = {
			{
				16035,
				1
			}
		},
		award4 = {}
	},
	[750400] = {
		spent_for_pick = {
			{
				16036,
				1
			}
		},
		award4 = {}
	},
	[700281] = {
		spent_for_pick = {
			{
				16037,
				1
			}
		},
		award4 = {}
	},
	[700361] = {
		spent_for_pick = {
			{
				16038,
				1
			}
		},
		award4 = {}
	},
	[700371] = {
		spent_for_pick = {
			{
				16039,
				1
			}
		},
		award4 = {}
	},
	[700381] = {
		spent_for_pick = {
			{
				16040,
				1
			}
		},
		award4 = {}
	},
	[700391] = {
		spent_for_pick = {
			{
				16041,
				1
			}
		},
		award4 = {}
	},
	[700401] = {
		spent_for_pick = {
			{
				16042,
				1
			}
		},
		award4 = {}
	},
	[700411] = {
		spent_for_pick = {
			{
				16043,
				1
			}
		},
		award4 = {}
	},
	[700421] = {
		spent_for_pick = {
			{
				16044,
				1
			}
		},
		award4 = {}
	},
	[700431] = {
		spent_for_pick = {
			{
				16045,
				1
			}
		},
		award4 = {}
	},
	[700441] = {
		spent_for_pick = {
			{
				16046,
				1
			}
		},
		award4 = {}
	},
	[700451] = {
		spent_for_pick = {
			{
				16047,
				1
			}
		},
		award4 = {}
	},
	[701001] = {
		spent_for_pick = {
			{
				16101,
				1
			}
		},
		award4 = {}
	},
	[701011] = {
		spent_for_pick = {
			{
				16102,
				1
			}
		},
		award4 = {}
	},
	[701021] = {
		spent_for_pick = {
			{
				16103,
				1
			}
		},
		award4 = {}
	},
	[701031] = {
		spent_for_pick = {
			{
				16104,
				1
			}
		},
		award4 = {}
	},
	[701041] = {
		spent_for_pick = {
			{
				16105,
				1
			}
		},
		award4 = {}
	},
	[701051] = {
		spent_for_pick = {
			{
				16106,
				1
			}
		},
		award4 = {}
	},
	[701061] = {
		spent_for_pick = {
			{
				16107,
				1
			}
		},
		award4 = {}
	},
	[701071] = {
		spent_for_pick = {
			{
				16108,
				1
			}
		},
		award4 = {}
	},
	[701081] = {
		spent_for_pick = {
			{
				16108,
				1
			}
		},
		award4 = {}
	},
	[700003] = {
		spent_for_pick = {
			{
				16001,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700013] = {
		spent_for_pick = {
			{
				16002,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700023] = {
		spent_for_pick = {
			{
				16003,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700033] = {
		spent_for_pick = {
			{
				16004,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700043] = {
		spent_for_pick = {
			{
				16005,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700053] = {
		spent_for_pick = {
			{
				16006,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700063] = {
		spent_for_pick = {
			{
				16007,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700073] = {
		spent_for_pick = {
			{
				16008,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700083] = {
		spent_for_pick = {
			{
				16009,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700093] = {
		spent_for_pick = {
			{
				16010,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700103] = {
		spent_for_pick = {
			{
				16011,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700113] = {
		spent_for_pick = {
			{
				16012,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700123] = {
		spent_for_pick = {
			{
				16013,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700133] = {
		spent_for_pick = {
			{
				16014,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700143] = {
		spent_for_pick = {
			{
				16015,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700153] = {
		spent_for_pick = {
			{
				16016,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700163] = {
		spent_for_pick = {
			{
				16017,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700173] = {
		spent_for_pick = {
			{
				16018,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700183] = {
		spent_for_pick = {
			{
				16019,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700193] = {
		spent_for_pick = {
			{
				16020,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700203] = {
		spent_for_pick = {
			{
				16021,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700213] = {
		spent_for_pick = {
			{
				16022,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700223] = {
		spent_for_pick = {
			{
				16023,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700233] = {
		spent_for_pick = {
			{
				16024,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700243] = {
		spent_for_pick = {
			{
				16025,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700253] = {
		spent_for_pick = {
			{
				16026,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700263] = {
		spent_for_pick = {
			{
				16027,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700273] = {
		spent_for_pick = {
			{
				16028,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700293] = {
		spent_for_pick = {
			{
				16029,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700303] = {
		spent_for_pick = {
			{
				16030,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700313] = {
		spent_for_pick = {
			{
				16031,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700323] = {
		spent_for_pick = {
			{
				16032,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[750001] = {
		spent_for_pick = {
			{
				16033,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[750101] = {
		spent_for_pick = {
			{
				16034,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[750201] = {
		spent_for_pick = {
			{
				16035,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[750401] = {
		spent_for_pick = {
			{
				16036,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700283] = {
		spent_for_pick = {
			{
				16037,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700363] = {
		spent_for_pick = {
			{
				16038,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700373] = {
		spent_for_pick = {
			{
				16039,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700383] = {
		spent_for_pick = {
			{
				16040,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700393] = {
		spent_for_pick = {
			{
				16041,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700403] = {
		spent_for_pick = {
			{
				16042,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700413] = {
		spent_for_pick = {
			{
				16043,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700423] = {
		spent_for_pick = {
			{
				16044,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700433] = {
		spent_for_pick = {
			{
				16045,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700443] = {
		spent_for_pick = {
			{
				16046,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[700453] = {
		spent_for_pick = {
			{
				16047,
				4
			},
			{
				10450,
				10000
			}
		},
		award4 = {}
	},
	[701003] = {
		spent_for_pick = {
			{
				16101,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701013] = {
		spent_for_pick = {
			{
				16102,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701023] = {
		spent_for_pick = {
			{
				16103,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701033] = {
		spent_for_pick = {
			{
				16104,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701043] = {
		spent_for_pick = {
			{
				16105,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701053] = {
		spent_for_pick = {
			{
				16106,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701063] = {
		spent_for_pick = {
			{
				16107,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[701073] = {
		spent_for_pick = {
			{
				16108,
				4
			},
			{
				10460,
				10
			}
		},
		award4 = {}
	},
	[700005] = {
		spent_for_pick = {
			{
				16001,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700015] = {
		spent_for_pick = {
			{
				16002,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700025] = {
		spent_for_pick = {
			{
				16003,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700035] = {
		spent_for_pick = {
			{
				16004,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700045] = {
		spent_for_pick = {
			{
				16005,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700055] = {
		spent_for_pick = {
			{
				16006,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700065] = {
		spent_for_pick = {
			{
				16007,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700075] = {
		spent_for_pick = {
			{
				16008,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700085] = {
		spent_for_pick = {
			{
				16009,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700095] = {
		spent_for_pick = {
			{
				16010,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700105] = {
		spent_for_pick = {
			{
				16011,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700115] = {
		spent_for_pick = {
			{
				16012,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700125] = {
		spent_for_pick = {
			{
				16013,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700135] = {
		spent_for_pick = {
			{
				16014,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700145] = {
		spent_for_pick = {
			{
				16015,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700155] = {
		spent_for_pick = {
			{
				16016,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700165] = {
		spent_for_pick = {
			{
				16017,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700175] = {
		spent_for_pick = {
			{
				16018,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700185] = {
		spent_for_pick = {
			{
				16019,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700195] = {
		spent_for_pick = {
			{
				16020,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700205] = {
		spent_for_pick = {
			{
				16021,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700215] = {
		spent_for_pick = {
			{
				16022,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700225] = {
		spent_for_pick = {
			{
				16023,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700235] = {
		spent_for_pick = {
			{
				16024,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700245] = {
		spent_for_pick = {
			{
				16025,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700255] = {
		spent_for_pick = {
			{
				16026,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700265] = {
		spent_for_pick = {
			{
				16027,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700275] = {
		spent_for_pick = {
			{
				16028,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700295] = {
		spent_for_pick = {
			{
				16029,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700305] = {
		spent_for_pick = {
			{
				16030,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700315] = {
		spent_for_pick = {
			{
				16031,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700325] = {
		spent_for_pick = {
			{
				16032,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750002] = {
		spent_for_pick = {
			{
				16033,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750102] = {
		spent_for_pick = {
			{
				16034,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750202] = {
		spent_for_pick = {
			{
				16035,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750402] = {
		spent_for_pick = {
			{
				16036,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700285] = {
		spent_for_pick = {
			{
				16037,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700365] = {
		spent_for_pick = {
			{
				16038,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700375] = {
		spent_for_pick = {
			{
				16039,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700385] = {
		spent_for_pick = {
			{
				16040,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700395] = {
		spent_for_pick = {
			{
				16041,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700405] = {
		spent_for_pick = {
			{
				16042,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700415] = {
		spent_for_pick = {
			{
				16043,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700425] = {
		spent_for_pick = {
			{
				16044,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700435] = {
		spent_for_pick = {
			{
				16045,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700445] = {
		spent_for_pick = {
			{
				16046,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700455] = {
		spent_for_pick = {
			{
				16047,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[701005] = {
		spent_for_pick = {
			{
				16101,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701015] = {
		spent_for_pick = {
			{
				16102,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701025] = {
		spent_for_pick = {
			{
				16103,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701035] = {
		spent_for_pick = {
			{
				16104,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701045] = {
		spent_for_pick = {
			{
				16105,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701055] = {
		spent_for_pick = {
			{
				16106,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701065] = {
		spent_for_pick = {
			{
				16107,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701075] = {
		spent_for_pick = {
			{
				16108,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[700006] = {
		spent_for_pick = {
			{
				16001,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700016] = {
		spent_for_pick = {
			{
				16002,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700026] = {
		spent_for_pick = {
			{
				16003,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700036] = {
		spent_for_pick = {
			{
				16004,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700046] = {
		spent_for_pick = {
			{
				16005,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700056] = {
		spent_for_pick = {
			{
				16006,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700066] = {
		spent_for_pick = {
			{
				16007,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700076] = {
		spent_for_pick = {
			{
				16008,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700086] = {
		spent_for_pick = {
			{
				16009,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700096] = {
		spent_for_pick = {
			{
				16010,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700106] = {
		spent_for_pick = {
			{
				16011,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700116] = {
		spent_for_pick = {
			{
				16012,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700126] = {
		spent_for_pick = {
			{
				16013,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700136] = {
		spent_for_pick = {
			{
				16014,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700146] = {
		spent_for_pick = {
			{
				16015,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700156] = {
		spent_for_pick = {
			{
				16016,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700166] = {
		spent_for_pick = {
			{
				16017,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700176] = {
		spent_for_pick = {
			{
				16018,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700186] = {
		spent_for_pick = {
			{
				16019,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700196] = {
		spent_for_pick = {
			{
				16020,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700206] = {
		spent_for_pick = {
			{
				16021,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700216] = {
		spent_for_pick = {
			{
				16022,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700226] = {
		spent_for_pick = {
			{
				16023,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700236] = {
		spent_for_pick = {
			{
				16024,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700246] = {
		spent_for_pick = {
			{
				16025,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700256] = {
		spent_for_pick = {
			{
				16026,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700266] = {
		spent_for_pick = {
			{
				16027,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700276] = {
		spent_for_pick = {
			{
				16028,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700296] = {
		spent_for_pick = {
			{
				16029,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700306] = {
		spent_for_pick = {
			{
				16030,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700316] = {
		spent_for_pick = {
			{
				16031,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700326] = {
		spent_for_pick = {
			{
				16032,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750003] = {
		spent_for_pick = {
			{
				16033,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750103] = {
		spent_for_pick = {
			{
				16034,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750203] = {
		spent_for_pick = {
			{
				16035,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[750403] = {
		spent_for_pick = {
			{
				16036,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700286] = {
		spent_for_pick = {
			{
				16037,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700366] = {
		spent_for_pick = {
			{
				16038,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700376] = {
		spent_for_pick = {
			{
				16039,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700386] = {
		spent_for_pick = {
			{
				16040,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700396] = {
		spent_for_pick = {
			{
				16041,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700406] = {
		spent_for_pick = {
			{
				16042,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700416] = {
		spent_for_pick = {
			{
				16043,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700426] = {
		spent_for_pick = {
			{
				16044,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700436] = {
		spent_for_pick = {
			{
				16045,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700446] = {
		spent_for_pick = {
			{
				16046,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[700456] = {
		spent_for_pick = {
			{
				16047,
				9
			},
			{
				10450,
				30000
			}
		},
		award4 = {}
	},
	[701007] = {
		spent_for_pick = {
			{
				16101,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701017] = {
		spent_for_pick = {
			{
				16102,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701027] = {
		spent_for_pick = {
			{
				16103,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701037] = {
		spent_for_pick = {
			{
				16104,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701047] = {
		spent_for_pick = {
			{
				16105,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701057] = {
		spent_for_pick = {
			{
				16106,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701067] = {
		spent_for_pick = {
			{
				16107,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	},
	[701077] = {
		spent_for_pick = {
			{
				16108,
				9
			},
			{
				10460,
				30
			}
		},
		award4 = {}
	}
}

function Config.PartnerSkillData.data_partner_skill_getback_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_getback[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_getback[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_view_length = 4
Config.PartnerSkillData.data_partner_skill_view = {
	{
		701001,
		701011,
		701021,
		701031,
		701041,
		701051,
		701061,
		701071,
		700001,
		700011,
		700021,
		700031,
		700041,
		700051,
		700061,
		700071,
		700081,
		700091,
		700101,
		700111,
		700121,
		700131,
		700141,
		700151,
		700161,
		700171,
		700181,
		700191,
		700201,
		700211,
		700221,
		700231,
		700241,
		700251,
		700261,
		700271,
		700291,
		700301,
		700311,
		700321,
		750000,
		750100,
		750200,
		750400,
		700281,
		700361,
		700371,
		700381,
		700391,
		700401,
		700411,
		700421,
		700431,
		700441,
		700451
	},
	{
		701003,
		701013,
		701023,
		701033,
		701043,
		701053,
		701063,
		701073,
		700003,
		700013,
		700023,
		700033,
		700043,
		700053,
		700063,
		700073,
		700083,
		700093,
		700103,
		700113,
		700123,
		700133,
		700143,
		700153,
		700163,
		700173,
		700183,
		700193,
		700203,
		700213,
		700223,
		700233,
		700243,
		700253,
		700263,
		700273,
		700293,
		700303,
		700313,
		700323,
		750001,
		750101,
		750201,
		750401,
		700283,
		700363,
		700373,
		700383,
		700393,
		700403,
		700413,
		700423,
		700433,
		700443,
		700453
	},
	{
		701005,
		701015,
		701025,
		701035,
		701045,
		701055,
		701065,
		701075,
		700005,
		700015,
		700025,
		700035,
		700045,
		700055,
		700065,
		700075,
		700085,
		700095,
		700105,
		700115,
		700125,
		700135,
		700145,
		700155,
		700165,
		700175,
		700185,
		700195,
		700205,
		700215,
		700225,
		700235,
		700245,
		700255,
		700265,
		700275,
		700295,
		700305,
		700315,
		700325,
		750002,
		750102,
		750202,
		750402,
		700285,
		700365,
		700375,
		700385,
		700395,
		700405,
		700415,
		700425,
		700435,
		700445,
		700455
	},
	{
		701006,
		701016,
		701026,
		701036,
		701046,
		701056,
		701066,
		701076,
		700006,
		700016,
		700026,
		700036,
		700046,
		700056,
		700066,
		700076,
		700086,
		700096,
		700106,
		700116,
		700126,
		700136,
		700146,
		700156,
		700166,
		700176,
		700186,
		700196,
		700206,
		700216,
		700226,
		700236,
		700246,
		700256,
		700266,
		700276,
		700296,
		700306,
		700316,
		700326,
		750002,
		750103,
		750203,
		750403,
		700286,
		700366,
		700376,
		700386,
		700396,
		700406,
		700416,
		700426,
		700436,
		700446,
		700456
	}
}

function Config.PartnerSkillData.data_partner_skill_view_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_view[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_view[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_skill_item_length = 111
Config.PartnerSkillData.data_partner_skill_item = {
	[700001] = {
		id = 700001,
		expend = {
			16001
		}
	},
	[700011] = {
		id = 700011,
		expend = {
			16002
		}
	},
	[700021] = {
		id = 700021,
		expend = {
			16003
		}
	},
	[700031] = {
		id = 700031,
		expend = {
			16004
		}
	},
	[700041] = {
		id = 700041,
		expend = {
			16005
		}
	},
	[700051] = {
		id = 700051,
		expend = {
			16006
		}
	},
	[700061] = {
		id = 700061,
		expend = {
			16007
		}
	},
	[700071] = {
		id = 700071,
		expend = {
			16008
		}
	},
	[700081] = {
		id = 700081,
		expend = {
			16009
		}
	},
	[700091] = {
		id = 700091,
		expend = {
			16010
		}
	},
	[700101] = {
		id = 700101,
		expend = {
			16011
		}
	},
	[700111] = {
		id = 700111,
		expend = {
			16012
		}
	},
	[700121] = {
		id = 700121,
		expend = {
			16013
		}
	},
	[700131] = {
		id = 700131,
		expend = {
			16014
		}
	},
	[700141] = {
		id = 700141,
		expend = {
			16015
		}
	},
	[700151] = {
		id = 700151,
		expend = {
			16016
		}
	},
	[700161] = {
		id = 700161,
		expend = {
			16017
		}
	},
	[700171] = {
		id = 700171,
		expend = {
			16018
		}
	},
	[700181] = {
		id = 700181,
		expend = {
			16019
		}
	},
	[700191] = {
		id = 700191,
		expend = {
			16020
		}
	},
	[700201] = {
		id = 700201,
		expend = {
			16021
		}
	},
	[700211] = {
		id = 700211,
		expend = {
			16022
		}
	},
	[700221] = {
		id = 700221,
		expend = {
			16023
		}
	},
	[700231] = {
		id = 700231,
		expend = {
			16024
		}
	},
	[700241] = {
		id = 700241,
		expend = {
			16025
		}
	},
	[700251] = {
		id = 700251,
		expend = {
			16026
		}
	},
	[700261] = {
		id = 700261,
		expend = {
			16027
		}
	},
	[700271] = {
		id = 700271,
		expend = {
			16028
		}
	},
	[700291] = {
		id = 700291,
		expend = {
			16029
		}
	},
	[700301] = {
		id = 700301,
		expend = {
			16030
		}
	},
	[700311] = {
		id = 700311,
		expend = {
			16031
		}
	},
	[700321] = {
		id = 700321,
		expend = {
			16032
		}
	},
	[750000] = {
		id = 750000,
		expend = {
			16033
		}
	},
	[750100] = {
		id = 750100,
		expend = {
			16034
		}
	},
	[750200] = {
		id = 750200,
		expend = {
			16035
		}
	},
	[750400] = {
		id = 750400,
		expend = {
			16036
		}
	},
	[700281] = {
		id = 700281,
		expend = {
			16037
		}
	},
	[700361] = {
		id = 700361,
		expend = {
			16038
		}
	},
	[700371] = {
		id = 700371,
		expend = {
			16039
		}
	},
	[700381] = {
		id = 700381,
		expend = {
			16040
		}
	},
	[700391] = {
		id = 700391,
		expend = {
			16041
		}
	},
	[700401] = {
		id = 700401,
		expend = {
			16042
		}
	},
	[700411] = {
		id = 700411,
		expend = {
			16043
		}
	},
	[700421] = {
		id = 700421,
		expend = {
			16044
		}
	},
	[700431] = {
		id = 700431,
		expend = {
			16045
		}
	},
	[700441] = {
		id = 700441,
		expend = {
			16046
		}
	},
	[700451] = {
		id = 700451,
		expend = {
			16047
		}
	},
	[701001] = {
		id = 701001,
		expend = {
			16101
		}
	},
	[701011] = {
		id = 701011,
		expend = {
			16102
		}
	},
	[701021] = {
		id = 701021,
		expend = {
			16103
		}
	},
	[701031] = {
		id = 701031,
		expend = {
			16104
		}
	},
	[701041] = {
		id = 701041,
		expend = {
			16105
		}
	},
	[701051] = {
		id = 701051,
		expend = {
			16106
		}
	},
	[701061] = {
		id = 701061,
		expend = {
			16107
		}
	},
	[701071] = {
		id = 701071,
		expend = {
			16108
		}
	},
	[701081] = {
		id = 701081,
		expend = {
			16108
		}
	},
	[700003] = {
		id = 700003,
		expend = {
			16001
		}
	},
	[700013] = {
		id = 700013,
		expend = {
			16002
		}
	},
	[700023] = {
		id = 700023,
		expend = {
			16003
		}
	},
	[700033] = {
		id = 700033,
		expend = {
			16004
		}
	},
	[700043] = {
		id = 700043,
		expend = {
			16005
		}
	},
	[700053] = {
		id = 700053,
		expend = {
			16006
		}
	},
	[700063] = {
		id = 700063,
		expend = {
			16007
		}
	},
	[700073] = {
		id = 700073,
		expend = {
			16008
		}
	},
	[700083] = {
		id = 700083,
		expend = {
			16009
		}
	},
	[700093] = {
		id = 700093,
		expend = {
			16010
		}
	},
	[700103] = {
		id = 700103,
		expend = {
			16011
		}
	},
	[700113] = {
		id = 700113,
		expend = {
			16012
		}
	},
	[700123] = {
		id = 700123,
		expend = {
			16013
		}
	},
	[700133] = {
		id = 700133,
		expend = {
			16014
		}
	},
	[700143] = {
		id = 700143,
		expend = {
			16015
		}
	},
	[700153] = {
		id = 700153,
		expend = {
			16016
		}
	},
	[700163] = {
		id = 700163,
		expend = {
			16017
		}
	},
	[700173] = {
		id = 700173,
		expend = {
			16018
		}
	},
	[700183] = {
		id = 700183,
		expend = {
			16019
		}
	},
	[700193] = {
		id = 700193,
		expend = {
			16020
		}
	},
	[700203] = {
		id = 700203,
		expend = {
			16021
		}
	},
	[700213] = {
		id = 700213,
		expend = {
			16022
		}
	},
	[700223] = {
		id = 700223,
		expend = {
			16023
		}
	},
	[700233] = {
		id = 700233,
		expend = {
			16024
		}
	},
	[700243] = {
		id = 700243,
		expend = {
			16025
		}
	},
	[700253] = {
		id = 700253,
		expend = {
			16026
		}
	},
	[700263] = {
		id = 700263,
		expend = {
			16027
		}
	},
	[700273] = {
		id = 700273,
		expend = {
			16028
		}
	},
	[700293] = {
		id = 700293,
		expend = {
			16029
		}
	},
	[700303] = {
		id = 700303,
		expend = {
			16030
		}
	},
	[700313] = {
		id = 700313,
		expend = {
			16031
		}
	},
	[700323] = {
		id = 700323,
		expend = {
			16032
		}
	},
	[750001] = {
		id = 750001,
		expend = {
			16033
		}
	},
	[750101] = {
		id = 750101,
		expend = {
			16034
		}
	},
	[750201] = {
		id = 750201,
		expend = {
			16035
		}
	},
	[750401] = {
		id = 750401,
		expend = {
			16036
		}
	},
	[700283] = {
		id = 700283,
		expend = {
			16037
		}
	},
	[700363] = {
		id = 700363,
		expend = {
			16038
		}
	},
	[700373] = {
		id = 700373,
		expend = {
			16039
		}
	},
	[700383] = {
		id = 700383,
		expend = {
			16040
		}
	},
	[700393] = {
		id = 700393,
		expend = {
			16041
		}
	},
	[700403] = {
		id = 700403,
		expend = {
			16042
		}
	},
	[700413] = {
		id = 700413,
		expend = {
			16043
		}
	},
	[700423] = {
		id = 700423,
		expend = {
			16044
		}
	},
	[700433] = {
		id = 700433,
		expend = {
			16045
		}
	},
	[700443] = {
		id = 700443,
		expend = {
			16046
		}
	},
	[700453] = {
		id = 700453,
		expend = {
			16047
		}
	},
	[701003] = {
		id = 701003,
		expend = {
			16101
		}
	},
	[701013] = {
		id = 701013,
		expend = {
			16102
		}
	},
	[701023] = {
		id = 701023,
		expend = {
			16103
		}
	},
	[701033] = {
		id = 701033,
		expend = {
			16104
		}
	},
	[701043] = {
		id = 701043,
		expend = {
			16105
		}
	},
	[701053] = {
		id = 701053,
		expend = {
			16106
		}
	},
	[701063] = {
		id = 701063,
		expend = {
			16107
		}
	},
	[701073] = {
		id = 701073,
		expend = {
			16108
		}
	}
}

function Config.PartnerSkillData.data_partner_skill_item_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_skill_item[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_skill_item[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerSkillData.data_partner_awakening_skill_length = 33
Config.PartnerSkillData.data_partner_awakening_skill = {
	[701001] = {
		id = 701001,
		limit_career = {
			{
				3
			}
		}
	},
	[701011] = {
		id = 701011,
		limit_career = {
			{
				3
			}
		}
	},
	[701021] = {
		id = 701021,
		limit_career = {
			{
				2
			}
		}
	},
	[701031] = {
		id = 701031,
		limit_career = {
			{
				2
			}
		}
	},
	[701041] = {
		id = 701041,
		limit_career = {
			{
				4
			}
		}
	},
	[701051] = {
		id = 701051,
		limit_career = {
			{
				4
			}
		}
	},
	[701061] = {
		id = 701061,
		limit_career = {
			{
				5
			}
		}
	},
	[701071] = {
		id = 701071,
		limit_career = {
			{
				5
			}
		}
	},
	[701081] = {
		id = 701081,
		limit_career = {
			{
				4
			}
		}
	},
	[701003] = {
		id = 701003,
		limit_career = {
			{
				3
			}
		}
	},
	[701013] = {
		id = 701013,
		limit_career = {
			{
				3
			}
		}
	},
	[701023] = {
		id = 701023,
		limit_career = {
			{
				2
			}
		}
	},
	[701033] = {
		id = 701033,
		limit_career = {
			{
				2
			}
		}
	},
	[701043] = {
		id = 701043,
		limit_career = {
			{
				4
			}
		}
	},
	[701053] = {
		id = 701053,
		limit_career = {
			{
				4
			}
		}
	},
	[701063] = {
		id = 701063,
		limit_career = {
			{
				5
			}
		}
	},
	[701073] = {
		id = 701073,
		limit_career = {
			{
				5
			}
		}
	},
	[701005] = {
		id = 701005,
		limit_career = {
			{
				3
			}
		}
	},
	[701015] = {
		id = 701015,
		limit_career = {
			{
				3
			}
		}
	},
	[701025] = {
		id = 701025,
		limit_career = {
			{
				2
			}
		}
	},
	[701035] = {
		id = 701035,
		limit_career = {
			{
				2
			}
		}
	},
	[701045] = {
		id = 701045,
		limit_career = {
			{
				4
			}
		}
	},
	[701055] = {
		id = 701055,
		limit_career = {
			{
				4
			}
		}
	},
	[701065] = {
		id = 701065,
		limit_career = {
			{
				5
			}
		}
	},
	[701075] = {
		id = 701075,
		limit_career = {
			{
				5
			}
		}
	},
	[701007] = {
		id = 701007,
		limit_career = {
			{
				3
			}
		}
	},
	[701017] = {
		id = 701017,
		limit_career = {
			{
				3
			}
		}
	},
	[701027] = {
		id = 701027,
		limit_career = {
			{
				2
			}
		}
	},
	[701037] = {
		id = 701037,
		limit_career = {
			{
				2
			}
		}
	},
	[701047] = {
		id = 701047,
		limit_career = {
			{
				4
			}
		}
	},
	[701057] = {
		id = 701057,
		limit_career = {
			{
				4
			}
		}
	},
	[701067] = {
		id = 701067,
		limit_career = {
			{
				5
			}
		}
	},
	[701077] = {
		id = 701077,
		limit_career = {
			{
				5
			}
		}
	}
}

function Config.PartnerSkillData.data_partner_awakening_skill_fun(slot0)
	slot1 = Config.PartnerSkillData.data_partner_awakening_skill[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerSkillData.data_partner_awakening_skill[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
