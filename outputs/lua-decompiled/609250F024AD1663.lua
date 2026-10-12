Config = Config or {}
Config.ElementTempleData = Config.ElementTempleData or {}
Config.ElementTempleData.data_const_length = 5
Config.ElementTempleData.data_const = {
	join_lev = {
		val = 90,
		desc = "船长等级90级开启"
	},
	refresh_time = {
		val = 10800,
		desc = "挑战次数刷新时间"
	},
	refresh_number = {
		val = 10,
		desc = "挑战次数上限"
	},
	rank_number = {
		val = 20,
		desc = "排行榜最大人数"
	},
	challenge_free = {
		val = 2,
		desc = "特权每日赠送挑战次数"
	}
}

function Config.ElementTempleData.data_const_fun(slot0)
	slot1 = Config.ElementTempleData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ElementTempleData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ElementTempleData.data_base_length = 5
Config.ElementTempleData.data_base = {
	{
		name = "超新星基地",
		type = 1,
		res_id = 1,
		group = {
			1,
			2,
			11,
			12
		},
		open_day = {
			1,
			6,
			7
		}
	},
	{
		name = "草帽大船团",
		type = 2,
		res_id = 2,
		group = {
			3,
			4,
			13,
			14
		},
		open_day = {
			3,
			6,
			7
		}
	},
	{
		name = "强者居所",
		type = 3,
		res_id = 3,
		group = {
			5,
			6,
			15,
			16
		},
		open_day = {
			5,
			6,
			7
		}
	},
	{
		name = "海军基地",
		type = 4,
		res_id = 4,
		group = {
			7,
			8,
			17,
			18
		},
		open_day = {
			2,
			6,
			7
		}
	},
	{
		name = "五皇领地",
		type = 5,
		res_id = 5,
		group = {
			9,
			10,
			19,
			20
		},
		open_day = {
			4,
			6,
			7
		}
	}
}

function Config.ElementTempleData.data_base_fun(slot0)
	slot1 = Config.ElementTempleData.data_base[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ElementTempleData.data_base[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ElementTempleData.data_customs_length = 20
Config.ElementTempleData.data_customs = {
	{
		{
			id = 1,
			unit_id = 35051,
			group = 1,
			limit_desc = "本关需上阵1位强者英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					3,
					1
				}
			},
			first_reward = {
				{
					17001,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17001,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35052,
			group = 1,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17001,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35053,
			group = 1,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17001,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35054,
			group = 1,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17001,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35055,
			group = 1,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17001,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35056,
			group = 1,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17001,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35057,
			group = 1,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17001,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35058,
			group = 1,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17001,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35059,
			group = 1,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17001,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35060,
			group = 1,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17001,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35401,
			group = 1,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17001,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35402,
			group = 1,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17001,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35061,
			group = 2,
			limit_desc = "本关需上阵1位强者英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					3,
					1
				}
			},
			first_reward = {
				{
					17001,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17001,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35062,
			group = 2,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17001,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35063,
			group = 2,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17001,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35064,
			group = 2,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17001,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35065,
			group = 2,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17001,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35066,
			group = 2,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17001,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35067,
			group = 2,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17001,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35068,
			group = 2,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17001,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35069,
			group = 2,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17001,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35070,
			group = 2,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17001,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35406,
			group = 2,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17001,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35407,
			group = 2,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17001,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35011,
			group = 3,
			limit_desc = "本关需上阵1位海贼英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					1,
					1
				}
			},
			first_reward = {
				{
					17002,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17002,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35012,
			group = 3,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17002,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35013,
			group = 3,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17002,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35014,
			group = 3,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17002,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35015,
			group = 3,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17002,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35016,
			group = 3,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17002,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35017,
			group = 3,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17002,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35018,
			group = 3,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17002,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35019,
			group = 3,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17002,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35020,
			group = 3,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17002,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35421,
			group = 3,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17002,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35422,
			group = 3,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17002,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35021,
			group = 4,
			limit_desc = "本关需上阵1位海贼英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					1,
					1
				}
			},
			first_reward = {
				{
					17002,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17002,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35022,
			group = 4,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17002,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35023,
			group = 4,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17002,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35024,
			group = 4,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17002,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35025,
			group = 4,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17002,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35026,
			group = 4,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17002,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35027,
			group = 4,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17002,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35028,
			group = 4,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17002,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35029,
			group = 4,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17002,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35030,
			group = 4,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17002,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35426,
			group = 4,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17002,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35427,
			group = 4,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17002,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35041,
			group = 5,
			limit_desc = "本关需上阵1位草帽联盟英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					2,
					1
				}
			},
			first_reward = {
				{
					17003,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17003,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35042,
			group = 5,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17003,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35043,
			group = 5,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17003,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35044,
			group = 5,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17003,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35045,
			group = 5,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17003,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35046,
			group = 5,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17003,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35047,
			group = 5,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17003,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35048,
			group = 5,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17003,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35049,
			group = 5,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17003,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35050,
			group = 5,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17003,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35441,
			group = 5,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17003,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35442,
			group = 5,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17003,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35031,
			group = 6,
			limit_desc = "本关需上阵1位草帽联盟英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					2,
					1
				}
			},
			first_reward = {
				{
					17003,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17003,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35032,
			group = 6,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17003,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35033,
			group = 6,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17003,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35034,
			group = 6,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17003,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35035,
			group = 6,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17003,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35036,
			group = 6,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17003,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35037,
			group = 6,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17003,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35038,
			group = 6,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17003,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35039,
			group = 6,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17003,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35040,
			group = 6,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17003,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35446,
			group = 6,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17003,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35447,
			group = 6,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17003,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35071,
			group = 7,
			limit_desc = "本关需上阵1位五皇团英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					5,
					1
				}
			},
			first_reward = {
				{
					17004,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17004,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35072,
			group = 7,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17004,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35073,
			group = 7,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17004,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35074,
			group = 7,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17004,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35075,
			group = 7,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17004,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35076,
			group = 7,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17004,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35077,
			group = 7,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17004,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35078,
			group = 7,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17004,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35079,
			group = 7,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17004,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35080,
			group = 7,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17004,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35461,
			group = 7,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17004,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35462,
			group = 7,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17004,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35081,
			group = 8,
			limit_desc = "本关需上阵1位五皇团英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					5,
					1
				}
			},
			first_reward = {
				{
					17004,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17004,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35082,
			group = 8,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17004,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35083,
			group = 8,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17004,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35084,
			group = 8,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17004,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35085,
			group = 8,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17004,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35086,
			group = 8,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17004,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35087,
			group = 8,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17004,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35088,
			group = 8,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17004,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35089,
			group = 8,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17004,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35090,
			group = 8,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17004,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35466,
			group = 8,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17004,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35467,
			group = 8,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17004,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35091,
			group = 9,
			limit_desc = "本关需上阵1位海军英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					4,
					1
				}
			},
			first_reward = {
				{
					17005,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17005,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35092,
			group = 9,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17005,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35093,
			group = 9,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17005,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35094,
			group = 9,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17005,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35095,
			group = 9,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17005,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35096,
			group = 9,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17005,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35097,
			group = 9,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17005,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35098,
			group = 9,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17005,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35099,
			group = 9,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17005,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35100,
			group = 9,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17005,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35481,
			group = 9,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17005,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35482,
			group = 9,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17005,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	{
		{
			id = 1,
			unit_id = 35101,
			group = 10,
			limit_desc = "本关需上阵1位海军英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					4,
					1
				}
			},
			first_reward = {
				{
					17005,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17005,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35102,
			group = 10,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17005,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35103,
			group = 10,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17005,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35104,
			group = 10,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17005,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35105,
			group = 10,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17005,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35106,
			group = 10,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17005,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35107,
			group = 10,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17005,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35108,
			group = 10,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17005,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35109,
			group = 10,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17005,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35110,
			group = 10,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17005,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35486,
			group = 10,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17005,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35487,
			group = 10,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17005,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[11] = {
		{
			id = 1,
			unit_id = 35131,
			group = 11,
			limit_desc = "本关需上阵1位强者英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					3,
					1
				}
			},
			first_reward = {
				{
					17001,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17001,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35132,
			group = 11,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17001,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35133,
			group = 11,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17001,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35134,
			group = 11,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17001,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35135,
			group = 11,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17001,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35136,
			group = 11,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17001,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35137,
			group = 11,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17001,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35138,
			group = 11,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17001,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35139,
			group = 11,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17001,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35140,
			group = 11,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17001,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35411,
			group = 11,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17001,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35412,
			group = 11,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17001,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[12] = {
		{
			id = 1,
			unit_id = 35141,
			group = 12,
			limit_desc = "本关需上阵1位强者英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					3,
					1
				}
			},
			first_reward = {
				{
					17001,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17001,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35142,
			group = 12,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17001,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35143,
			group = 12,
			limit_desc = "本关需上阵2位强者英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					3,
					2
				}
			},
			first_reward = {
				{
					17001,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17001,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35144,
			group = 12,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17001,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35145,
			group = 12,
			limit_desc = "本关需上阵3位强者英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					3,
					3
				}
			},
			first_reward = {
				{
					17001,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17001,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35146,
			group = 12,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17001,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35147,
			group = 12,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17001,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35148,
			group = 12,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17001,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35149,
			group = 12,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17001,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35150,
			group = 12,
			limit_desc = "本关需上阵4位强者英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					3,
					4
				}
			},
			first_reward = {
				{
					17001,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17001,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35416,
			group = 12,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17001,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35417,
			group = 12,
			limit_desc = "本关需上阵5位强者英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					3,
					5
				}
			},
			first_reward = {
				{
					17001,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17001,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					3,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[13] = {
		{
			id = 1,
			unit_id = 35111,
			group = 13,
			limit_desc = "本关需上阵1位海贼英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					1,
					1
				}
			},
			first_reward = {
				{
					17002,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17002,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35112,
			group = 13,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17002,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35113,
			group = 13,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17002,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35114,
			group = 13,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17002,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35115,
			group = 13,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17002,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35116,
			group = 13,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17002,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35117,
			group = 13,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17002,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35118,
			group = 13,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17002,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35119,
			group = 13,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17002,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35120,
			group = 13,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17002,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35431,
			group = 13,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17002,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35432,
			group = 13,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17002,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[14] = {
		{
			id = 1,
			unit_id = 35121,
			group = 14,
			limit_desc = "本关需上阵1位海贼英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					1,
					1
				}
			},
			first_reward = {
				{
					17002,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17002,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35122,
			group = 14,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17002,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35123,
			group = 14,
			limit_desc = "本关需上阵2位海贼英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					1,
					2
				}
			},
			first_reward = {
				{
					17002,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17002,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35124,
			group = 14,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17002,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35125,
			group = 14,
			limit_desc = "本关需上阵3位海贼英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					1,
					3
				}
			},
			first_reward = {
				{
					17002,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17002,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35126,
			group = 14,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17002,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35127,
			group = 14,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17002,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35128,
			group = 14,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17002,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35129,
			group = 14,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17002,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35130,
			group = 14,
			limit_desc = "本关需上阵4位海贼英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					1,
					4
				}
			},
			first_reward = {
				{
					17002,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17002,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35436,
			group = 14,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17002,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35437,
			group = 14,
			limit_desc = "本关需上阵5位海贼英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					1,
					5
				}
			},
			first_reward = {
				{
					17002,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17002,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					1,
					601001
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[15] = {
		{
			id = 1,
			unit_id = 35151,
			group = 15,
			limit_desc = "本关需上阵1位草帽联盟英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					2,
					1
				}
			},
			first_reward = {
				{
					17003,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17003,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35152,
			group = 15,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17003,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35153,
			group = 15,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17003,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35154,
			group = 15,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17003,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35155,
			group = 15,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17003,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35156,
			group = 15,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17003,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35157,
			group = 15,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17003,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35158,
			group = 15,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17003,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35159,
			group = 15,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17003,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35160,
			group = 15,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17003,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35451,
			group = 15,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17003,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35452,
			group = 15,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17003,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[16] = {
		{
			id = 1,
			unit_id = 35161,
			group = 16,
			limit_desc = "本关需上阵1位草帽联盟英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					2,
					1
				}
			},
			first_reward = {
				{
					17003,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17003,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35162,
			group = 16,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17003,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35163,
			group = 16,
			limit_desc = "本关需上阵2位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					2,
					2
				}
			},
			first_reward = {
				{
					17003,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17003,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35164,
			group = 16,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17003,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35165,
			group = 16,
			limit_desc = "本关需上阵3位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					2,
					3
				}
			},
			first_reward = {
				{
					17003,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17003,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35166,
			group = 16,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17003,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35167,
			group = 16,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17003,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35168,
			group = 16,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17003,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35169,
			group = 16,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17003,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35170,
			group = 16,
			limit_desc = "本关需上阵4位草帽联盟英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					2,
					4
				}
			},
			first_reward = {
				{
					17003,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17003,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35456,
			group = 16,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17003,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35457,
			group = 16,
			limit_desc = "本关需上阵5位草帽联盟英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					2,
					5
				}
			},
			first_reward = {
				{
					17003,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17003,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					2,
					601001
				},
				{
					1,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[17] = {
		{
			id = 1,
			unit_id = 35171,
			group = 17,
			limit_desc = "本关需上阵1位五皇团英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					5,
					1
				}
			},
			first_reward = {
				{
					17004,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17004,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35172,
			group = 17,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17004,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35173,
			group = 17,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17004,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35174,
			group = 17,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17004,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35175,
			group = 17,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17004,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35176,
			group = 17,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17004,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35177,
			group = 17,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17004,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35178,
			group = 17,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17004,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35179,
			group = 17,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17004,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35180,
			group = 17,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17004,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35471,
			group = 17,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17004,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35472,
			group = 17,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17004,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		}
	},
	[18] = {
		{
			id = 1,
			unit_id = 35181,
			group = 18,
			limit_desc = "本关需上阵1位五皇团英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					5,
					1
				}
			},
			first_reward = {
				{
					17004,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17004,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35182,
			group = 18,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17004,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35183,
			group = 18,
			limit_desc = "本关需上阵2位五皇团英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					5,
					2
				}
			},
			first_reward = {
				{
					17004,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17004,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35184,
			group = 18,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17004,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35185,
			group = 18,
			limit_desc = "本关需上阵3位五皇团英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					5,
					3
				}
			},
			first_reward = {
				{
					17004,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17004,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35186,
			group = 18,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17004,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35187,
			group = 18,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17004,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35188,
			group = 18,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17004,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35189,
			group = 18,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17004,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35190,
			group = 18,
			limit_desc = "本关需上阵4位五皇团英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					5,
					4
				}
			},
			first_reward = {
				{
					17004,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17004,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35476,
			group = 18,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17004,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35477,
			group = 18,
			limit_desc = "本关需上阵5位五皇团英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					5,
					5
				}
			},
			first_reward = {
				{
					17004,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17004,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					5,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					4,
					601002
				}
			}
		}
	},
	[19] = {
		{
			id = 1,
			unit_id = 35191,
			group = 19,
			limit_desc = "本关需上阵1位海军英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					4,
					1
				}
			},
			first_reward = {
				{
					17005,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17005,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35192,
			group = 19,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17005,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35193,
			group = 19,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17005,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35194,
			group = 19,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17005,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35195,
			group = 19,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17005,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35196,
			group = 19,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17005,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35197,
			group = 19,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17005,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35198,
			group = 19,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17005,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35199,
			group = 19,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17005,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35200,
			group = 19,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17005,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35491,
			group = 19,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17005,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35492,
			group = 19,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17005,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	},
	[20] = {
		{
			id = 1,
			unit_id = 35201,
			group = 20,
			limit_desc = "本关需上阵1位海军英雄",
			limit_dun_id = 0,
			power = 440583,
			limit = {
				{
					4,
					1
				}
			},
			first_reward = {
				{
					17005,
					30
				},
				{
					17011,
					2
				}
			},
			auto_reward = {
				{
					17005,
					5
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 2,
			unit_id = 35202,
			group = 20,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 798253,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					35
				},
				{
					17011,
					4
				}
			},
			auto_reward = {
				{
					17005,
					6
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 3,
			unit_id = 35203,
			group = 20,
			limit_desc = "本关需上阵2位海军英雄",
			limit_dun_id = 0,
			power = 1203092,
			limit = {
				{
					4,
					2
				}
			},
			first_reward = {
				{
					17005,
					40
				},
				{
					17011,
					6
				}
			},
			auto_reward = {
				{
					17005,
					7
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 4,
			unit_id = 35204,
			group = 20,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1345660,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					45
				},
				{
					17011,
					8
				}
			},
			auto_reward = {
				{
					17005,
					8
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 5,
			unit_id = 35205,
			group = 20,
			limit_desc = "本关需上阵3位海军英雄",
			limit_dun_id = 0,
			power = 1630794,
			limit = {
				{
					4,
					3
				}
			},
			first_reward = {
				{
					17005,
					50
				},
				{
					17011,
					10
				}
			},
			auto_reward = {
				{
					17005,
					9
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 6,
			unit_id = 35206,
			group = 20,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 0,
			power = 1883784,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					55
				},
				{
					17011,
					12
				}
			},
			auto_reward = {
				{
					17005,
					10
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 7,
			unit_id = 35207,
			group = 20,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 5,
			power = 2164884,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					65
				},
				{
					17011,
					14
				}
			},
			auto_reward = {
				{
					17005,
					11
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 8,
			unit_id = 35208,
			group = 20,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 6,
			power = 2445984,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					80
				},
				{
					17011,
					16
				}
			},
			auto_reward = {
				{
					17005,
					12
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 9,
			unit_id = 35209,
			group = 20,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 7,
			power = 2727084,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					100
				},
				{
					17011,
					18
				}
			},
			auto_reward = {
				{
					17005,
					13
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 10,
			unit_id = 35210,
			group = 20,
			limit_desc = "本关需上阵4位海军英雄",
			limit_dun_id = 8,
			power = 3008184,
			limit = {
				{
					4,
					4
				}
			},
			first_reward = {
				{
					17005,
					120
				},
				{
					17011,
					20
				}
			},
			auto_reward = {
				{
					17005,
					15
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 11,
			unit_id = 35496,
			group = 20,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 9,
			power = 5000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					125
				},
				{
					17011,
					22
				}
			},
			auto_reward = {
				{
					17005,
					16
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		},
		{
			id = 12,
			unit_id = 35497,
			group = 20,
			limit_desc = "本关需上阵5位海军英雄",
			limit_dun_id = 10,
			power = 6000000,
			limit = {
				{
					4,
					5
				}
			},
			first_reward = {
				{
					17005,
					130
				},
				{
					17011,
					24
				}
			},
			auto_reward = {
				{
					17005,
					18
				},
				{
					17011,
					1
				}
			},
			camp_skill = {
				{
					4,
					601001
				},
				{
					1,
					601002
				},
				{
					2,
					601002
				},
				{
					3,
					601002
				},
				{
					5,
					601002
				}
			}
		}
	}
}
Config.ElementTempleData.data_buy_count_length = 2
Config.ElementTempleData.data_buy_count = {
	{
		cost = 50,
		num = 1,
		vip = 0
	},
	{
		cost = 100,
		num = 2,
		vip = 0
	}
}

function Config.ElementTempleData.data_buy_count_fun(slot0)
	slot1 = Config.ElementTempleData.data_buy_count[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ElementTempleData.data_buy_count[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ElementTempleData.data_privilege_length = 6
Config.ElementTempleData.data_privilege = {
	100,
	100,
	100,
	100,
	150,
	150
}

function Config.ElementTempleData.data_privilege_fun(slot0)
	slot1 = Config.ElementTempleData.data_privilege[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ElementTempleData.data_privilege[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ElementTempleData.data_award_length = 6
Config.ElementTempleData.data_award = {
	{
		min = 1,
		max = 1,
		items = {
			{
				39010,
				100
			},
			{
				3,
				300
			}
		}
	},
	{
		min = 2,
		max = 2,
		items = {
			{
				39010,
				80
			},
			{
				3,
				250
			}
		}
	},
	{
		min = 3,
		max = 3,
		items = {
			{
				39010,
				65
			},
			{
				3,
				200
			}
		}
	},
	{
		min = 4,
		max = 10,
		items = {
			{
				39010,
				50
			},
			{
				3,
				160
			}
		}
	},
	{
		min = 11,
		max = 20,
		items = {
			{
				39010,
				40
			},
			{
				3,
				130
			}
		}
	},
	{
		min = 21,
		max = 50,
		items = {
			{
				39010,
				30
			},
			{
				3,
				100
			}
		}
	}
}
Config.ElementTempleData.data_monster_length = 20
Config.ElementTempleData.data_monster = {
	{
		head_id = 10502,
		name = "艾斯",
		bust_id = 10036,
		attr_desc = "强者英雄额外造成50%伤害",
		group = 1,
		combat_desc = "非强者英雄在战斗时攻击力下降50%",
		skill_list = {
			924401,
			924402,
			924403
		}
	},
	{
		head_id = 10504,
		name = "贝基",
		bust_id = 10083,
		attr_desc = "强者英雄额外造成50%伤害",
		group = 2,
		combat_desc = "非强者英雄在战斗时攻击力下降50%",
		skill_list = {
			925201,
			925202,
			925203
		}
	},
	{
		head_id = 20502,
		name = "乌索普",
		bust_id = 10008,
		attr_desc = "海贼英雄额外造成50%伤害",
		group = 3,
		combat_desc = "非海贼英雄在战斗时攻击力下降50%",
		skill_list = {
			920401,
			920402,
			920403
		}
	},
	{
		head_id = 20507,
		name = "乔巴",
		bust_id = 10078,
		attr_desc = "海贼英雄额外造成50%伤害",
		group = 4,
		combat_desc = "非海贼英雄在战斗时攻击力下降50%",
		skill_list = {
			921401,
			921402,
			921403
		}
	},
	{
		head_id = 30502,
		name = "暴君熊",
		bust_id = 10086,
		attr_desc = "草帽联盟英雄额外造成50%伤害",
		group = 5,
		combat_desc = "非草帽联盟英雄在战斗时攻击力下降50%",
		skill_list = {
			923401,
			923402,
			923403
		}
	},
	{
		head_id = 30506,
		name = "萨博（火拳）",
		bust_id = 10010,
		attr_desc = "草帽联盟英雄额外造成50%伤害",
		group = 6,
		combat_desc = "非草帽联盟英雄在战斗时攻击力下降50%",
		skill_list = {
			922401,
			922402,
			922403
		}
	},
	{
		head_id = 40503,
		name = "黄猿",
		bust_id = 10027,
		attr_desc = "五皇团英雄额外造成50%伤害",
		group = 7,
		combat_desc = "非五皇团英雄在战斗时攻击力下降50%",
		skill_list = {
			926201,
			926202,
			926203
		}
	},
	{
		head_id = 40504,
		name = "卡普",
		bust_id = 10075,
		attr_desc = "五皇团英雄额外造成50%伤害",
		group = 8,
		combat_desc = "非五皇团英雄在战斗时攻击力下降50%",
		skill_list = {
			927301,
			927302,
			927303
		}
	},
	{
		head_id = 50505,
		name = "黑胡子(新世界)",
		bust_id = 10067,
		attr_desc = "海军英雄额外造成50%伤害",
		group = 9,
		combat_desc = "非海军英雄在战斗时攻击力下降50%",
		skill_list = {
			928401,
			928402,
			928403
		}
	},
	{
		head_id = 50504,
		name = "香克斯",
		bust_id = 10044,
		attr_desc = "海军英雄额外造成50%伤害",
		group = 10,
		combat_desc = "非海军英雄在战斗时攻击力下降50%",
		skill_list = {
			929401,
			929402,
			929403
		}
	},
	{
		head_id = 10510,
		name = "艾尼路",
		bust_id = 10089,
		attr_desc = "强者英雄额外造成50%伤害",
		group = 11,
		combat_desc = "非强者英雄在战斗时攻击力下降50%",
		skill_list = {
			933901,
			933902,
			933903
		}
	},
	{
		head_id = 10507,
		name = "贝拉米",
		bust_id = 10030,
		attr_desc = "强者英雄额外造成50%伤害",
		group = 12,
		combat_desc = "非强者英雄在战斗时攻击力下降50%",
		skill_list = {
			934901,
			934902,
			934903
		}
	},
	{
		head_id = 20509,
		name = "山治",
		bust_id = 10088,
		attr_desc = "海贼英雄额外造成50%伤害",
		group = 13,
		combat_desc = "非海贼英雄在战斗时攻击力下降50%",
		skill_list = {
			931901,
			931902,
			931903
		}
	},
	{
		head_id = 20504,
		name = "布鲁克",
		bust_id = 10032,
		attr_desc = "海贼英雄额外造成50%伤害",
		group = 14,
		combat_desc = "非海贼英雄在战斗时攻击力下降50%",
		skill_list = {
			932901,
			932902,
			932903
		}
	},
	{
		head_id = 30508,
		name = "龙马",
		bust_id = 10081,
		attr_desc = "草帽联盟英雄额外造成50%伤害",
		group = 15,
		combat_desc = "非草帽联盟英雄在战斗时攻击力下降50%",
		skill_list = {
			935901,
			935902,
			935903
		}
	},
	{
		head_id = 30501,
		name = "鳄鱼",
		bust_id = 10039,
		attr_desc = "草帽联盟英雄额外造成50%伤害",
		group = 16,
		combat_desc = "非草帽联盟英雄在战斗时攻击力下降50%",
		skill_list = {
			936901,
			936902,
			936903
		}
	},
	{
		head_id = 40502,
		name = "战桃丸",
		bust_id = 10001,
		attr_desc = "五皇团英雄额外造成50%伤害",
		group = 17,
		combat_desc = "非五皇团英雄在战斗时攻击力下降50%",
		skill_list = {
			937901,
			937902,
			937903
		}
	},
	{
		head_id = 40506,
		name = "青雉",
		bust_id = 10068,
		attr_desc = "五皇团英雄额外造成50%伤害",
		group = 18,
		combat_desc = "非五皇团英雄在战斗时攻击力下降50%",
		skill_list = {
			938901,
			938902,
			938903
		}
	},
	{
		head_id = 50503,
		name = "巴杰斯",
		bust_id = 10085,
		attr_desc = "海军英雄额外造成50%伤害",
		group = 19,
		combat_desc = "非海军英雄在战斗时攻击力下降50%",
		skill_list = {
			939901,
			939902,
			939903
		}
	},
	{
		head_id = 50507,
		name = "艾斯（魂）",
		bust_id = 10069,
		attr_desc = "海军英雄额外造成50%伤害",
		group = 20,
		combat_desc = "非海军英雄在战斗时攻击力下降50%",
		skill_list = {
			940901,
			940902,
			940903
		}
	}
}

function Config.ElementTempleData.data_monster_fun(slot0)
	slot1 = Config.ElementTempleData.data_monster[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ElementTempleData.data_monster[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.ElementTempleData.data_explain_length = 3
Config.ElementTempleData.data_explain = {
	{
		id = 1,
		title = "领地副本",
		desc = [[
1.共有超新星基地、草帽大船团、强者居所、海军基地、五皇领土5大副本，周一至周五轮流开启，周末所有领地副本将全部开启
2.每个领地共有12层，每层通关后可开启对应的扫荡
3.周末副本开启时，将继承周一至周五各个副本的进度
4.每周一0点副本将重置，所有副本进度将被清空
5.领地中获得的材料可用于各个信念的升级和进阶]]
	},
	{
		id = 2,
		title = "挑战次数",
		desc = [[
1.挑战次数为所有副本共用
2.挑战失败不消耗次数
3.挑战次数每日0点更新
4.每天可消耗钻石额外购买2次挑战次数。]]
	},
	{
		id = 3,
		title = "排行榜",
		desc = "1.每周记录玩家所有领地的通关总次数，扫荡不计入统计\n2.每周一0点将根据排行榜的排名发放对应奖励，同时重置通关数"
	}
}

function Config.ElementTempleData.data_explain_fun(slot0)
	slot1 = Config.ElementTempleData.data_explain[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.ElementTempleData.data_explain[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
