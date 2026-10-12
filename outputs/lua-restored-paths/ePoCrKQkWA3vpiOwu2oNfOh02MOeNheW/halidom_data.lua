Config = Config or {}
Config.HalidomData = Config.HalidomData or {}
Config.HalidomData.data_const_length = 9
Config.HalidomData.data_const = {
	halidom_open_lev = {
		val = 90,
		desc = "90级开启元素信念"
	},
	water_halo = {
		val = 8,
		desc = "海贼新星特效解锁阶数条件"
	},
	fire_halo = {
		val = 8,
		desc = "草帽特效解锁阶数条件"
	},
	wind_halo = {
		val = 8,
		desc = "强者特效解锁阶数条件"
	},
	light_halo = {
		val = 8,
		desc = "海军特效解锁阶数条件"
	},
	dark_halo = {
		val = 8,
		desc = "皇团特效解锁阶数条件"
	},
	legend_halo = {
		val = 8,
		desc = "传奇特效解锁阶数条件"
	},
	halidom_cost = {
		desc = "信念消耗物品ID汇总（客户端用）",
		val = {
			17001,
			17002,
			17003,
			17004,
			17005,
			17006,
			17011,
			17012,
			17013,
			17014,
			17015,
			1
		}
	},
	halidom_rule = {
		val = 1,
		desc = [[
信念共有6种系别，可使用同系4/5星英雄进行开启，开启后根据信念属性提升所有同系英雄属性
1.信念开启后可使用金币和相应的元素结晶提升信念等级和属性
2.信念每10级可进阶1次，进阶消耗相应系别英雄及元素之灵，进阶后额外提升信念百分比属性
3.英魂物品不可作为信念进阶的材料]]
	}
}

function Config.HalidomData.data_const_fun(slot0)
	slot1 = Config.HalidomData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HalidomData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HalidomData.data_base_length = 7
Config.HalidomData.data_base = {
	{
		name = "超新星之力",
		camp = 1,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>海贼英雄</div>提供属性加成",
		id = 1,
		msc = "",
		effect_id = 701,
		desc = "象征海贼超新星的海洋印记",
		loss = {
			{
				1,
				4,
				1
			}
		}
	},
	{
		name = "自由草帽",
		camp = 2,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>草帽联盟英雄</div>提供属性加成",
		id = 2,
		msc = "",
		effect_id = 702,
		desc = "象征草帽的自由印记",
		loss = {
			{
				2,
				4,
				1
			}
		}
	},
	{
		name = "海贼强者",
		camp = 3,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>强者英雄</div>提供属性加成",
		id = 3,
		msc = "",
		effect_id = 703,
		desc = "象征强者的海贼印记",
		loss = {
			{
				3,
				4,
				1
			}
		}
	},
	{
		name = "绝对正义",
		camp = 4,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>海军英雄</div>提供属性加成",
		id = 4,
		msc = "",
		effect_id = 704,
		desc = "象征海军的正义印记",
		loss = {
			{
				4,
				4,
				1
			}
		}
	},
	{
		name = "首领之慑",
		camp = 5,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>五皇团英雄</div>提供属性加成",
		id = 5,
		msc = "",
		effect_id = 705,
		desc = "象征五皇和首领的威慑印记",
		loss = {
			{
				5,
				4,
				1
			}
		}
	},
	{
		name = "传奇之力",
		camp = 6,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>传奇英雄</div>提供属性加成",
		id = 6,
		msc = "",
		effect_id = 706,
		desc = "象征传奇之力的威慑印记",
		loss = {
			{
				7,
				5,
				1
			}
		}
	},
	{
		name = "传奇之力",
		camp = 7,
		lock_desc = "解锁该信念为我方<div fontcolor=#c03e0b>传奇英雄</div>提供属性加成",
		id = 7,
		msc = "",
		effect_id = 706,
		desc = "象征传奇之力的威慑印记",
		loss = {
			{
				7,
				5,
				1
			}
		}
	}
}

function Config.HalidomData.data_base_fun(slot0)
	slot1 = Config.HalidomData.data_base[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HalidomData.data_base[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.HalidomData.data_max_lev_length = 7
Config.HalidomData.data_max_lev = {
	100,
	100,
	100,
	100,
	100,
	100,
	100
}
Config.HalidomData.data_max_step_length = 7
Config.HalidomData.data_max_step = {
	10,
	10,
	10,
	10,
	10,
	10,
	10
}
Config.HalidomData.data_lvup_length = 7
Config.HalidomData.data_lvup = {
	{
		{
			id = 1,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					968
				},
				{
					"atk",
					73
				}
			}
		},
		{
			id = 1,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					1936
				},
				{
					"atk",
					146
				}
			}
		},
		{
			id = 1,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					64
				}
			},
			attr = {
				{
					"hp_max",
					2904
				},
				{
					"atk",
					219
				}
			}
		},
		{
			id = 1,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					3872
				},
				{
					"atk",
					293
				}
			}
		},
		{
			id = 1,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					4840
				},
				{
					"atk",
					366
				}
			}
		},
		{
			id = 1,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					64
				}
			},
			attr = {
				{
					"hp_max",
					5808
				},
				{
					"atk",
					439
				}
			}
		},
		{
			id = 1,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					6776
				},
				{
					"atk",
					513
				}
			}
		},
		{
			id = 1,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					7744
				},
				{
					"atk",
					586
				}
			}
		},
		{
			id = 1,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					64
				}
			},
			attr = {
				{
					"hp_max",
					8712
				},
				{
					"atk",
					659
				}
			}
		},
		{
			id = 1,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17001,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					868
				},
				{
					"atk",
					63
				}
			},
			attr = {
				{
					"hp_max",
					9680
				},
				{
					"atk",
					733
				}
			}
		},
		{
			id = 1,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					10648
				},
				{
					"atk",
					806
				}
			}
		},
		{
			id = 1,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					12100
				},
				{
					"atk",
					916
				}
			}
		},
		{
			id = 1,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1288
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					13552
				},
				{
					"atk",
					1026
				}
			}
		},
		{
			id = 1,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					15005
				},
				{
					"atk",
					1136
				}
			}
		},
		{
			id = 1,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					16457
				},
				{
					"atk",
					1246
				}
			}
		},
		{
			id = 1,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					17909
				},
				{
					"atk",
					1356
				}
			}
		},
		{
			id = 1,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					19361
				},
				{
					"atk",
					1466
				}
			}
		},
		{
			id = 1,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					20813
				},
				{
					"atk",
					1576
				}
			}
		},
		{
			id = 1,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					22265
				},
				{
					"atk",
					1686
				}
			}
		},
		{
			id = 1,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17001,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1287
				},
				{
					"atk",
					95
				}
			},
			attr = {
				{
					"hp_max",
					23717
				},
				{
					"atk",
					1796
				}
			}
		},
		{
			id = 1,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					122
				}
			},
			attr = {
				{
					"hp_max",
					25169
				},
				{
					"atk",
					1906
				}
			}
		},
		{
			id = 1,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1697
				},
				{
					"atk",
					123
				}
			},
			attr = {
				{
					"hp_max",
					27105
				},
				{
					"atk",
					2052
				}
			}
		},
		{
			id = 1,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					122
				}
			},
			attr = {
				{
					"hp_max",
					29042
				},
				{
					"atk",
					2199
				}
			}
		},
		{
			id = 1,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					123
				}
			},
			attr = {
				{
					"hp_max",
					30978
				},
				{
					"atk",
					2345
				}
			}
		},
		{
			id = 1,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					123
				}
			},
			attr = {
				{
					"hp_max",
					32914
				},
				{
					"atk",
					2492
				}
			}
		},
		{
			id = 1,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					122
				}
			},
			attr = {
				{
					"hp_max",
					34850
				},
				{
					"atk",
					2639
				}
			}
		},
		{
			id = 1,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					123
				}
			},
			attr = {
				{
					"hp_max",
					36786
				},
				{
					"atk",
					2785
				}
			}
		},
		{
			id = 1,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					123
				}
			},
			attr = {
				{
					"hp_max",
					38722
				},
				{
					"atk",
					2932
				}
			}
		},
		{
			id = 1,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1696
				},
				{
					"atk",
					122
				}
			},
			attr = {
				{
					"hp_max",
					40658
				},
				{
					"atk",
					3079
				}
			}
		},
		{
			id = 1,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17001,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1697
				},
				{
					"atk",
					123
				}
			},
			attr = {
				{
					"hp_max",
					42594
				},
				{
					"atk",
					3225
				}
			}
		},
		{
			id = 1,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					44531
				},
				{
					"atk",
					3372
				}
			}
		},
		{
			id = 1,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					46951
				},
				{
					"atk",
					3555
				}
			}
		},
		{
			id = 1,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					154
				}
			},
			attr = {
				{
					"hp_max",
					49371
				},
				{
					"atk",
					3738
				}
			}
		},
		{
			id = 1,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					51791
				},
				{
					"atk",
					3922
				}
			}
		},
		{
			id = 1,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					54211
				},
				{
					"atk",
					4105
				}
			}
		},
		{
			id = 1,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2096
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					56631
				},
				{
					"atk",
					4288
				}
			}
		},
		{
			id = 1,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					154
				}
			},
			attr = {
				{
					"hp_max",
					59052
				},
				{
					"atk",
					4471
				}
			}
		},
		{
			id = 1,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					61472
				},
				{
					"atk",
					4655
				}
			}
		},
		{
			id = 1,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					153
				}
			},
			attr = {
				{
					"hp_max",
					63892
				},
				{
					"atk",
					4838
				}
			}
		},
		{
			id = 1,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17001,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2095
				},
				{
					"atk",
					154
				}
			},
			attr = {
				{
					"hp_max",
					66312
				},
				{
					"atk",
					5021
				}
			}
		},
		{
			id = 1,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2485
				},
				{
					"atk",
					177
				}
			},
			attr = {
				{
					"hp_max",
					68732
				},
				{
					"atk",
					5205
				}
			}
		},
		{
			id = 1,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					71637
				},
				{
					"atk",
					5424
				}
			}
		},
		{
			id = 1,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					74541
				},
				{
					"atk",
					5644
				}
			}
		},
		{
			id = 1,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					77445
				},
				{
					"atk",
					5864
				}
			}
		},
		{
			id = 1,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					80349
				},
				{
					"atk",
					6084
				}
			}
		},
		{
			id = 1,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2485
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					83253
				},
				{
					"atk",
					6304
				}
			}
		},
		{
			id = 1,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					86158
				},
				{
					"atk",
					6524
				}
			}
		},
		{
			id = 1,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					89062
				},
				{
					"atk",
					6744
				}
			}
		},
		{
			id = 1,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					91966
				},
				{
					"atk",
					6964
				}
			}
		},
		{
			id = 1,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17001,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2484
				},
				{
					"atk",
					178
				}
			},
			attr = {
				{
					"hp_max",
					94870
				},
				{
					"atk",
					7184
				}
			}
		},
		{
			id = 1,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					207
				}
			},
			attr = {
				{
					"hp_max",
					97774
				},
				{
					"atk",
					7404
				}
			}
		},
		{
			id = 1,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					208
				}
			},
			attr = {
				{
					"hp_max",
					101163
				},
				{
					"atk",
					7660
				}
			}
		},
		{
			id = 1,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					208
				}
			},
			attr = {
				{
					"hp_max",
					104551
				},
				{
					"atk",
					7917
				}
			}
		},
		{
			id = 1,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					207
				}
			},
			attr = {
				{
					"hp_max",
					107939
				},
				{
					"atk",
					8174
				}
			}
		},
		{
			id = 1,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					208
				}
			},
			attr = {
				{
					"hp_max",
					111327
				},
				{
					"atk",
					8430
				}
			}
		},
		{
			id = 1,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					207
				}
			},
			attr = {
				{
					"hp_max",
					114716
				},
				{
					"atk",
					8687
				}
			}
		},
		{
			id = 1,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					208
				}
			},
			attr = {
				{
					"hp_max",
					118104
				},
				{
					"atk",
					8943
				}
			}
		},
		{
			id = 1,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					208
				}
			},
			attr = {
				{
					"hp_max",
					121492
				},
				{
					"atk",
					9200
				}
			}
		},
		{
			id = 1,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					207
				}
			},
			attr = {
				{
					"hp_max",
					124880
				},
				{
					"atk",
					9457
				}
			}
		},
		{
			id = 1,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17001,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					208
				}
			},
			attr = {
				{
					"hp_max",
					128268
				},
				{
					"atk",
					9713
				}
			}
		},
		{
			id = 1,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					131657
				},
				{
					"atk",
					9970
				}
			}
		},
		{
			id = 1,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					135529
				},
				{
					"atk",
					10263
				}
			}
		},
		{
			id = 1,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3233
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					139401
				},
				{
					"atk",
					10556
				}
			}
		},
		{
			id = 1,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					230
				}
			},
			attr = {
				{
					"hp_max",
					143274
				},
				{
					"atk",
					10849
				}
			}
		},
		{
			id = 1,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					147146
				},
				{
					"atk",
					11143
				}
			}
		},
		{
			id = 1,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					151018
				},
				{
					"atk",
					11436
				}
			}
		},
		{
			id = 1,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3233
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					154890
				},
				{
					"atk",
					11729
				}
			}
		},
		{
			id = 1,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					230
				}
			},
			attr = {
				{
					"hp_max",
					158763
				},
				{
					"atk",
					12022
				}
			}
		},
		{
			id = 1,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					162635
				},
				{
					"atk",
					12316
				}
			}
		},
		{
			id = 1,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17001,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3232
				},
				{
					"atk",
					229
				}
			},
			attr = {
				{
					"hp_max",
					166507
				},
				{
					"atk",
					12609
				}
			}
		},
		{
			id = 1,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3592
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					170379
				},
				{
					"atk",
					12902
				}
			}
		},
		{
			id = 1,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					174736
				},
				{
					"atk",
					13232
				}
			}
		},
		{
			id = 1,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					179092
				},
				{
					"atk",
					13562
				}
			}
		},
		{
			id = 1,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3592
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					183448
				},
				{
					"atk",
					13892
				}
			}
		},
		{
			id = 1,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					187805
				},
				{
					"atk",
					14222
				}
			}
		},
		{
			id = 1,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					192161
				},
				{
					"atk",
					14552
				}
			}
		},
		{
			id = 1,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3592
				},
				{
					"atk",
					257
				}
			},
			attr = {
				{
					"hp_max",
					196517
				},
				{
					"atk",
					14882
				}
			}
		},
		{
			id = 1,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					200874
				},
				{
					"atk",
					15211
				}
			}
		},
		{
			id = 1,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					205230
				},
				{
					"atk",
					15541
				}
			}
		},
		{
			id = 1,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17001,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3591
				},
				{
					"atk",
					258
				}
			},
			attr = {
				{
					"hp_max",
					209586
				},
				{
					"atk",
					15871
				}
			}
		},
		{
			id = 1,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3941
				},
				{
					"atk",
					277
				}
			},
			attr = {
				{
					"hp_max",
					213942
				},
				{
					"atk",
					16201
				}
			}
		},
		{
			id = 1,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3940
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					218783
				},
				{
					"atk",
					16568
				}
			}
		},
		{
			id = 1,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3940
				},
				{
					"atk",
					277
				}
			},
			attr = {
				{
					"hp_max",
					223623
				},
				{
					"atk",
					16934
				}
			}
		},
		{
			id = 1,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3941
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					228463
				},
				{
					"atk",
					17301
				}
			}
		},
		{
			id = 1,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3940
				},
				{
					"atk",
					277
				}
			},
			attr = {
				{
					"hp_max",
					233304
				},
				{
					"atk",
					17667
				}
			}
		},
		{
			id = 1,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3940
				},
				{
					"atk",
					277
				}
			},
			attr = {
				{
					"hp_max",
					238144
				},
				{
					"atk",
					18034
				}
			}
		},
		{
			id = 1,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3941
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					242984
				},
				{
					"atk",
					18401
				}
			}
		},
		{
			id = 1,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3940
				},
				{
					"atk",
					277
				}
			},
			attr = {
				{
					"hp_max",
					247825
				},
				{
					"atk",
					18767
				}
			}
		},
		{
			id = 1,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3941
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					252665
				},
				{
					"atk",
					19134
				}
			}
		},
		{
			id = 1,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17001,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3940
				},
				{
					"atk",
					277
				}
			},
			attr = {
				{
					"hp_max",
					257506
				},
				{
					"atk",
					19500
				}
			}
		},
		{
			id = 1,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4668
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					262346
				},
				{
					"atk",
					19867
				}
			}
		},
		{
			id = 1,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4669
				},
				{
					"atk",
					331
				}
			},
			attr = {
				{
					"hp_max",
					268154
				},
				{
					"atk",
					20307
				}
			}
		},
		{
			id = 1,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4668
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					273963
				},
				{
					"atk",
					20746
				}
			}
		},
		{
			id = 1,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4668
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					279771
				},
				{
					"atk",
					21186
				}
			}
		},
		{
			id = 1,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4669
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					285579
				},
				{
					"atk",
					21626
				}
			}
		},
		{
			id = 1,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4668
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					291388
				},
				{
					"atk",
					22066
				}
			}
		},
		{
			id = 1,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4669
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					297196
				},
				{
					"atk",
					22506
				}
			}
		},
		{
			id = 1,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4668
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					303005
				},
				{
					"atk",
					22946
				}
			}
		},
		{
			id = 1,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17001,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4669
				},
				{
					"atk",
					332
				}
			},
			attr = {
				{
					"hp_max",
					308813
				},
				{
					"atk",
					23386
				}
			}
		},
		{
			id = 1,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17001,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					314622
				},
				{
					"atk",
					23826
				}
			}
		}
	},
	{
		{
			id = 2,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					921
				},
				{
					"atk",
					77
				}
			}
		},
		{
			id = 2,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					1843
				},
				{
					"atk",
					154
				}
			}
		},
		{
			id = 2,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					2765
				},
				{
					"atk",
					231
				}
			}
		},
		{
			id = 2,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					3687
				},
				{
					"atk",
					308
				}
			}
		},
		{
			id = 2,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					68
				}
			},
			attr = {
				{
					"hp_max",
					4609
				},
				{
					"atk",
					385
				}
			}
		},
		{
			id = 2,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					5531
				},
				{
					"atk",
					463
				}
			}
		},
		{
			id = 2,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					6453
				},
				{
					"atk",
					540
				}
			}
		},
		{
			id = 2,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					7375
				},
				{
					"atk",
					617
				}
			}
		},
		{
			id = 2,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					8297
				},
				{
					"atk",
					694
				}
			}
		},
		{
			id = 2,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17002,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					822
				},
				{
					"atk",
					67
				}
			},
			attr = {
				{
					"hp_max",
					9219
				},
				{
					"atk",
					771
				}
			}
		},
		{
			id = 2,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					10141
				},
				{
					"atk",
					848
				}
			}
		},
		{
			id = 2,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					11524
				},
				{
					"atk",
					964
				}
			}
		},
		{
			id = 2,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					12907
				},
				{
					"atk",
					1080
				}
			}
		},
		{
			id = 2,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					100
				}
			},
			attr = {
				{
					"hp_max",
					14290
				},
				{
					"atk",
					1196
				}
			}
		},
		{
			id = 2,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					15673
				},
				{
					"atk",
					1311
				}
			}
		},
		{
			id = 2,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					17056
				},
				{
					"atk",
					1427
				}
			}
		},
		{
			id = 2,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					18439
				},
				{
					"atk",
					1543
				}
			}
		},
		{
			id = 2,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					100
				}
			},
			attr = {
				{
					"hp_max",
					19822
				},
				{
					"atk",
					1659
				}
			}
		},
		{
			id = 2,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					21205
				},
				{
					"atk",
					1774
				}
			}
		},
		{
			id = 2,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17002,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1218
				},
				{
					"atk",
					101
				}
			},
			attr = {
				{
					"hp_max",
					22588
				},
				{
					"atk",
					1890
				}
			}
		},
		{
			id = 2,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					23971
				},
				{
					"atk",
					2006
				}
			}
		},
		{
			id = 2,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					131
				}
			},
			attr = {
				{
					"hp_max",
					25815
				},
				{
					"atk",
					2160
				}
			}
		},
		{
			id = 2,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					27659
				},
				{
					"atk",
					2315
				}
			}
		},
		{
			id = 2,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1603
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					29503
				},
				{
					"atk",
					2469
				}
			}
		},
		{
			id = 2,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					131
				}
			},
			attr = {
				{
					"hp_max",
					31346
				},
				{
					"atk",
					2623
				}
			}
		},
		{
			id = 2,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					33190
				},
				{
					"atk",
					2778
				}
			}
		},
		{
			id = 2,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					35034
				},
				{
					"atk",
					2932
				}
			}
		},
		{
			id = 2,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					131
				}
			},
			attr = {
				{
					"hp_max",
					36878
				},
				{
					"atk",
					3086
				}
			}
		},
		{
			id = 2,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					38722
				},
				{
					"atk",
					3241
				}
			}
		},
		{
			id = 2,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17002,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1604
				},
				{
					"atk",
					130
				}
			},
			attr = {
				{
					"hp_max",
					40566
				},
				{
					"atk",
					3395
				}
			}
		},
		{
			id = 2,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					42410
				},
				{
					"atk",
					3549
				}
			}
		},
		{
			id = 2,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					44715
				},
				{
					"atk",
					3742
				}
			}
		},
		{
			id = 2,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					47020
				},
				{
					"atk",
					3935
				}
			}
		},
		{
			id = 2,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					49325
				},
				{
					"atk",
					4128
				}
			}
		},
		{
			id = 2,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					51630
				},
				{
					"atk",
					4321
				}
			}
		},
		{
			id = 2,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					53935
				},
				{
					"atk",
					4514
				}
			}
		},
		{
			id = 2,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					56240
				},
				{
					"atk",
					4707
				}
			}
		},
		{
			id = 2,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1979
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					58545
				},
				{
					"atk",
					4900
				}
			}
		},
		{
			id = 2,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					60849
				},
				{
					"atk",
					5093
				}
			}
		},
		{
			id = 2,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17002,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1980
				},
				{
					"atk",
					163
				}
			},
			attr = {
				{
					"hp_max",
					63154
				},
				{
					"atk",
					5286
				}
			}
		},
		{
			id = 2,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					189
				}
			},
			attr = {
				{
					"hp_max",
					65459
				},
				{
					"atk",
					5479
				}
			}
		},
		{
			id = 2,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					190
				}
			},
			attr = {
				{
					"hp_max",
					68225
				},
				{
					"atk",
					5710
				}
			}
		},
		{
			id = 2,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					189
				}
			},
			attr = {
				{
					"hp_max",
					70991
				},
				{
					"atk",
					5942
				}
			}
		},
		{
			id = 2,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					190
				}
			},
			attr = {
				{
					"hp_max",
					73757
				},
				{
					"atk",
					6173
				}
			}
		},
		{
			id = 2,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					189
				}
			},
			attr = {
				{
					"hp_max",
					76523
				},
				{
					"atk",
					6405
				}
			}
		},
		{
			id = 2,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					190
				}
			},
			attr = {
				{
					"hp_max",
					79289
				},
				{
					"atk",
					6636
				}
			}
		},
		{
			id = 2,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					189
				}
			},
			attr = {
				{
					"hp_max",
					82055
				},
				{
					"atk",
					6868
				}
			}
		},
		{
			id = 2,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					190
				}
			},
			attr = {
				{
					"hp_max",
					84821
				},
				{
					"atk",
					7099
				}
			}
		},
		{
			id = 2,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2345
				},
				{
					"atk",
					189
				}
			},
			attr = {
				{
					"hp_max",
					87587
				},
				{
					"atk",
					7331
				}
			}
		},
		{
			id = 2,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17002,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2346
				},
				{
					"atk",
					190
				}
			},
			attr = {
				{
					"hp_max",
					90352
				},
				{
					"atk",
					7562
				}
			}
		},
		{
			id = 2,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					93118
				},
				{
					"atk",
					7794
				}
			}
		},
		{
			id = 2,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					96345
				},
				{
					"atk",
					8064
				}
			}
		},
		{
			id = 2,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					99572
				},
				{
					"atk",
					8334
				}
			}
		},
		{
			id = 2,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					102799
				},
				{
					"atk",
					8604
				}
			}
		},
		{
			id = 2,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					106026
				},
				{
					"atk",
					8874
				}
			}
		},
		{
			id = 2,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					109253
				},
				{
					"atk",
					9144
				}
			}
		},
		{
			id = 2,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					112480
				},
				{
					"atk",
					9414
				}
			}
		},
		{
			id = 2,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					115707
				},
				{
					"atk",
					9684
				}
			}
		},
		{
			id = 2,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2701
				},
				{
					"atk",
					221
				}
			},
			attr = {
				{
					"hp_max",
					118934
				},
				{
					"atk",
					9954
				}
			}
		},
		{
			id = 2,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17002,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2702
				},
				{
					"atk",
					222
				}
			},
			attr = {
				{
					"hp_max",
					122160
				},
				{
					"atk",
					10224
				}
			}
		},
		{
			id = 2,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					244
				}
			},
			attr = {
				{
					"hp_max",
					125387
				},
				{
					"atk",
					10495
				}
			}
		},
		{
			id = 2,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					245
				}
			},
			attr = {
				{
					"hp_max",
					129075
				},
				{
					"atk",
					10803
				}
			}
		},
		{
			id = 2,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					245
				}
			},
			attr = {
				{
					"hp_max",
					132763
				},
				{
					"atk",
					11112
				}
			}
		},
		{
			id = 2,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					244
				}
			},
			attr = {
				{
					"hp_max",
					136451
				},
				{
					"atk",
					11421
				}
			}
		},
		{
			id = 2,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					245
				}
			},
			attr = {
				{
					"hp_max",
					140139
				},
				{
					"atk",
					11729
				}
			}
		},
		{
			id = 2,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					245
				}
			},
			attr = {
				{
					"hp_max",
					143827
				},
				{
					"atk",
					12038
				}
			}
		},
		{
			id = 2,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3047
				},
				{
					"atk",
					244
				}
			},
			attr = {
				{
					"hp_max",
					147515
				},
				{
					"atk",
					12347
				}
			}
		},
		{
			id = 2,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					245
				}
			},
			attr = {
				{
					"hp_max",
					151202
				},
				{
					"atk",
					12655
				}
			}
		},
		{
			id = 2,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					245
				}
			},
			attr = {
				{
					"hp_max",
					154890
				},
				{
					"atk",
					12964
				}
			}
		},
		{
			id = 2,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17002,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3048
				},
				{
					"atk",
					244
				}
			},
			attr = {
				{
					"hp_max",
					158578
				},
				{
					"atk",
					13273
				}
			}
		},
		{
			id = 2,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					162266
				},
				{
					"atk",
					13581
				}
			}
		},
		{
			id = 2,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					166415
				},
				{
					"atk",
					13929
				}
			}
		},
		{
			id = 2,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					170564
				},
				{
					"atk",
					14276
				}
			}
		},
		{
			id = 2,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					174713
				},
				{
					"atk",
					14623
				}
			}
		},
		{
			id = 2,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3383
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					178862
				},
				{
					"atk",
					14970
				}
			}
		},
		{
			id = 2,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					183010
				},
				{
					"atk",
					15318
				}
			}
		},
		{
			id = 2,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					187159
				},
				{
					"atk",
					15665
				}
			}
		},
		{
			id = 2,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					191308
				},
				{
					"atk",
					16012
				}
			}
		},
		{
			id = 2,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					195457
				},
				{
					"atk",
					16359
				}
			}
		},
		{
			id = 2,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17002,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3384
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					199606
				},
				{
					"atk",
					16707
				}
			}
		},
		{
			id = 2,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					203755
				},
				{
					"atk",
					17054
				}
			}
		},
		{
			id = 2,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3709
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					208365
				},
				{
					"atk",
					17440
				}
			}
		},
		{
			id = 2,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					295
				}
			},
			attr = {
				{
					"hp_max",
					212974
				},
				{
					"atk",
					17826
				}
			}
		},
		{
			id = 2,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					217584
				},
				{
					"atk",
					18211
				}
			}
		},
		{
			id = 2,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					222194
				},
				{
					"atk",
					18597
				}
			}
		},
		{
			id = 2,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					226804
				},
				{
					"atk",
					18983
				}
			}
		},
		{
			id = 2,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					231414
				},
				{
					"atk",
					19369
				}
			}
		},
		{
			id = 2,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3709
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					236024
				},
				{
					"atk",
					19755
				}
			}
		},
		{
			id = 2,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					296
				}
			},
			attr = {
				{
					"hp_max",
					240633
				},
				{
					"atk",
					20141
				}
			}
		},
		{
			id = 2,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17002,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3710
				},
				{
					"atk",
					295
				}
			},
			attr = {
				{
					"hp_max",
					245243
				},
				{
					"atk",
					20527
				}
			}
		},
		{
			id = 2,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					249853
				},
				{
					"atk",
					20912
				}
			}
		},
		{
			id = 2,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					255385
				},
				{
					"atk",
					21375
				}
			}
		},
		{
			id = 2,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					260917
				},
				{
					"atk",
					21838
				}
			}
		},
		{
			id = 2,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4391
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					266449
				},
				{
					"atk",
					22301
				}
			}
		},
		{
			id = 2,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					271980
				},
				{
					"atk",
					22764
				}
			}
		},
		{
			id = 2,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					277512
				},
				{
					"atk",
					23227
				}
			}
		},
		{
			id = 2,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					283044
				},
				{
					"atk",
					23690
				}
			}
		},
		{
			id = 2,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					355
				}
			},
			attr = {
				{
					"hp_max",
					288576
				},
				{
					"atk",
					24153
				}
			}
		},
		{
			id = 2,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17002,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4392
				},
				{
					"atk",
					356
				}
			},
			attr = {
				{
					"hp_max",
					294108
				},
				{
					"atk",
					24616
				}
			}
		},
		{
			id = 2,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17002,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					299640
				},
				{
					"atk",
					25080
				}
			}
		}
	},
	{
		{
			id = 3,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					875
				},
				{
					"atk",
					81
				}
			}
		},
		{
			id = 3,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					1751
				},
				{
					"atk",
					162
				}
			}
		},
		{
			id = 3,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					2627
				},
				{
					"atk",
					243
				}
			}
		},
		{
			id = 3,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					3503
				},
				{
					"atk",
					324
				}
			}
		},
		{
			id = 3,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					4379
				},
				{
					"atk",
					405
				}
			}
		},
		{
			id = 3,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					5255
				},
				{
					"atk",
					486
				}
			}
		},
		{
			id = 3,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					775
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					6131
				},
				{
					"atk",
					567
				}
			}
		},
		{
			id = 3,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					7006
				},
				{
					"atk",
					648
				}
			}
		},
		{
			id = 3,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					7882
				},
				{
					"atk",
					729
				}
			}
		},
		{
			id = 3,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17003,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					776
				},
				{
					"atk",
					71
				}
			},
			attr = {
				{
					"hp_max",
					8758
				},
				{
					"atk",
					810
				}
			}
		},
		{
			id = 3,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					106
				}
			},
			attr = {
				{
					"hp_max",
					9634
				},
				{
					"atk",
					891
				}
			}
		},
		{
			id = 3,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					107
				}
			},
			attr = {
				{
					"hp_max",
					10948
				},
				{
					"atk",
					1012
				}
			}
		},
		{
			id = 3,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1148
				},
				{
					"atk",
					106
				}
			},
			attr = {
				{
					"hp_max",
					12262
				},
				{
					"atk",
					1134
				}
			}
		},
		{
			id = 3,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					107
				}
			},
			attr = {
				{
					"hp_max",
					13575
				},
				{
					"atk",
					1255
				}
			}
		},
		{
			id = 3,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					107
				}
			},
			attr = {
				{
					"hp_max",
					14889
				},
				{
					"atk",
					1377
				}
			}
		},
		{
			id = 3,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					106
				}
			},
			attr = {
				{
					"hp_max",
					16203
				},
				{
					"atk",
					1499
				}
			}
		},
		{
			id = 3,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					107
				}
			},
			attr = {
				{
					"hp_max",
					17517
				},
				{
					"atk",
					1620
				}
			}
		},
		{
			id = 3,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					106
				}
			},
			attr = {
				{
					"hp_max",
					18831
				},
				{
					"atk",
					1742
				}
			}
		},
		{
			id = 3,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1148
				},
				{
					"atk",
					107
				}
			},
			attr = {
				{
					"hp_max",
					20145
				},
				{
					"atk",
					1863
				}
			}
		},
		{
			id = 3,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17003,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1149
				},
				{
					"atk",
					106
				}
			},
			attr = {
				{
					"hp_max",
					21458
				},
				{
					"atk",
					1985
				}
			}
		},
		{
			id = 3,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					22772
				},
				{
					"atk",
					2106
				}
			}
		},
		{
			id = 3,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					24524
				},
				{
					"atk",
					2268
				}
			}
		},
		{
			id = 3,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1511
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					26276
				},
				{
					"atk",
					2430
				}
			}
		},
		{
			id = 3,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					28027
				},
				{
					"atk",
					2592
				}
			}
		},
		{
			id = 3,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					29779
				},
				{
					"atk",
					2754
				}
			}
		},
		{
			id = 3,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					139
				}
			},
			attr = {
				{
					"hp_max",
					31531
				},
				{
					"atk",
					2916
				}
			}
		},
		{
			id = 3,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1511
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					33283
				},
				{
					"atk",
					3079
				}
			}
		},
		{
			id = 3,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					35034
				},
				{
					"atk",
					3241
				}
			}
		},
		{
			id = 3,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					36786
				},
				{
					"atk",
					3403
				}
			}
		},
		{
			id = 3,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17003,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1512
				},
				{
					"atk",
					138
				}
			},
			attr = {
				{
					"hp_max",
					38538
				},
				{
					"atk",
					3565
				}
			}
		},
		{
			id = 3,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1864
				},
				{
					"atk",
					172
				}
			},
			attr = {
				{
					"hp_max",
					40290
				},
				{
					"atk",
					3727
				}
			}
		},
		{
			id = 3,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1865
				},
				{
					"atk",
					173
				}
			},
			attr = {
				{
					"hp_max",
					42479
				},
				{
					"atk",
					3929
				}
			}
		},
		{
			id = 3,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1865
				},
				{
					"atk",
					172
				}
			},
			attr = {
				{
					"hp_max",
					44669
				},
				{
					"atk",
					4132
				}
			}
		},
		{
			id = 3,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1864
				},
				{
					"atk",
					173
				}
			},
			attr = {
				{
					"hp_max",
					46859
				},
				{
					"atk",
					4334
				}
			}
		},
		{
			id = 3,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1865
				},
				{
					"atk",
					173
				}
			},
			attr = {
				{
					"hp_max",
					49048
				},
				{
					"atk",
					4537
				}
			}
		},
		{
			id = 3,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1865
				},
				{
					"atk",
					172
				}
			},
			attr = {
				{
					"hp_max",
					51238
				},
				{
					"atk",
					4740
				}
			}
		},
		{
			id = 3,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1864
				},
				{
					"atk",
					173
				}
			},
			attr = {
				{
					"hp_max",
					53428
				},
				{
					"atk",
					4942
				}
			}
		},
		{
			id = 3,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1865
				},
				{
					"atk",
					172
				}
			},
			attr = {
				{
					"hp_max",
					55617
				},
				{
					"atk",
					5145
				}
			}
		},
		{
			id = 3,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1865
				},
				{
					"atk",
					173
				}
			},
			attr = {
				{
					"hp_max",
					57807
				},
				{
					"atk",
					5347
				}
			}
		},
		{
			id = 3,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17003,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1864
				},
				{
					"atk",
					172
				}
			},
			attr = {
				{
					"hp_max",
					59997
				},
				{
					"atk",
					5550
				}
			}
		},
		{
			id = 3,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2208
				},
				{
					"atk",
					202
				}
			},
			attr = {
				{
					"hp_max",
					62186
				},
				{
					"atk",
					5752
				}
			}
		},
		{
			id = 3,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2208
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					64814
				},
				{
					"atk",
					5996
				}
			}
		},
		{
			id = 3,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2207
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					67442
				},
				{
					"atk",
					6239
				}
			}
		},
		{
			id = 3,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2208
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					70069
				},
				{
					"atk",
					6482
				}
			}
		},
		{
			id = 3,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2207
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					72697
				},
				{
					"atk",
					6725
				}
			}
		},
		{
			id = 3,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2208
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					75324
				},
				{
					"atk",
					6968
				}
			}
		},
		{
			id = 3,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2208
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					77952
				},
				{
					"atk",
					7211
				}
			}
		},
		{
			id = 3,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2207
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					80580
				},
				{
					"atk",
					7454
				}
			}
		},
		{
			id = 3,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2208
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					83207
				},
				{
					"atk",
					7697
				}
			}
		},
		{
			id = 3,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17003,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2207
				},
				{
					"atk",
					201
				}
			},
			attr = {
				{
					"hp_max",
					85835
				},
				{
					"atk",
					7940
				}
			}
		},
		{
			id = 3,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2541
				},
				{
					"atk",
					235
				}
			},
			attr = {
				{
					"hp_max",
					88462
				},
				{
					"atk",
					8183
				}
			}
		},
		{
			id = 3,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2541
				},
				{
					"atk",
					234
				}
			},
			attr = {
				{
					"hp_max",
					91528
				},
				{
					"atk",
					8467
				}
			}
		},
		{
			id = 3,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2540
				},
				{
					"atk",
					235
				}
			},
			attr = {
				{
					"hp_max",
					94594
				},
				{
					"atk",
					8750
				}
			}
		},
		{
			id = 3,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2541
				},
				{
					"atk",
					235
				}
			},
			attr = {
				{
					"hp_max",
					97659
				},
				{
					"atk",
					9034
				}
			}
		},
		{
			id = 3,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2540
				},
				{
					"atk",
					234
				}
			},
			attr = {
				{
					"hp_max",
					100725
				},
				{
					"atk",
					9318
				}
			}
		},
		{
			id = 3,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2541
				},
				{
					"atk",
					235
				}
			},
			attr = {
				{
					"hp_max",
					103790
				},
				{
					"atk",
					9601
				}
			}
		},
		{
			id = 3,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2540
				},
				{
					"atk",
					234
				}
			},
			attr = {
				{
					"hp_max",
					106856
				},
				{
					"atk",
					9885
				}
			}
		},
		{
			id = 3,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2541
				},
				{
					"atk",
					235
				}
			},
			attr = {
				{
					"hp_max",
					109921
				},
				{
					"atk",
					10168
				}
			}
		},
		{
			id = 3,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2540
				},
				{
					"atk",
					235
				}
			},
			attr = {
				{
					"hp_max",
					112987
				},
				{
					"atk",
					10452
				}
			}
		},
		{
			id = 3,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17003,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2541
				},
				{
					"atk",
					234
				}
			},
			attr = {
				{
					"hp_max",
					116052
				},
				{
					"atk",
					10736
				}
			}
		},
		{
			id = 3,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					119118
				},
				{
					"atk",
					11019
				}
			}
		},
		{
			id = 3,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					122621
				},
				{
					"atk",
					11343
				}
			}
		},
		{
			id = 3,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					261
				}
			},
			attr = {
				{
					"hp_max",
					126125
				},
				{
					"atk",
					11667
				}
			}
		},
		{
			id = 3,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					129628
				},
				{
					"atk",
					11992
				}
			}
		},
		{
			id = 3,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					133132
				},
				{
					"atk",
					12316
				}
			}
		},
		{
			id = 3,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					136635
				},
				{
					"atk",
					12640
				}
			}
		},
		{
			id = 3,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					140139
				},
				{
					"atk",
					12964
				}
			}
		},
		{
			id = 3,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					143642
				},
				{
					"atk",
					13288
				}
			}
		},
		{
			id = 3,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2863
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					147146
				},
				{
					"atk",
					13612
				}
			}
		},
		{
			id = 3,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17003,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					2864
				},
				{
					"atk",
					260
				}
			},
			attr = {
				{
					"hp_max",
					150649
				},
				{
					"atk",
					13936
				}
			}
		},
		{
			id = 3,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3176
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					154153
				},
				{
					"atk",
					14260
				}
			}
		},
		{
			id = 3,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3177
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					158094
				},
				{
					"atk",
					14625
				}
			}
		},
		{
			id = 3,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3176
				},
				{
					"atk",
					292
				}
			},
			attr = {
				{
					"hp_max",
					162036
				},
				{
					"atk",
					14990
				}
			}
		},
		{
			id = 3,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3176
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					165977
				},
				{
					"atk",
					15354
				}
			}
		},
		{
			id = 3,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3177
				},
				{
					"atk",
					292
				}
			},
			attr = {
				{
					"hp_max",
					169918
				},
				{
					"atk",
					15719
				}
			}
		},
		{
			id = 3,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3176
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					173860
				},
				{
					"atk",
					16083
				}
			}
		},
		{
			id = 3,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3177
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					177801
				},
				{
					"atk",
					16448
				}
			}
		},
		{
			id = 3,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3176
				},
				{
					"atk",
					292
				}
			},
			attr = {
				{
					"hp_max",
					181743
				},
				{
					"atk",
					16813
				}
			}
		},
		{
			id = 3,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3177
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					185684
				},
				{
					"atk",
					17177
				}
			}
		},
		{
			id = 3,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17003,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3176
				},
				{
					"atk",
					293
				}
			},
			attr = {
				{
					"hp_max",
					189626
				},
				{
					"atk",
					17542
				}
			}
		},
		{
			id = 3,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					193567
				},
				{
					"atk",
					17907
				}
			}
		},
		{
			id = 3,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3480
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					197946
				},
				{
					"atk",
					18312
				}
			}
		},
		{
			id = 3,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					202326
				},
				{
					"atk",
					18717
				}
			}
		},
		{
			id = 3,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					206705
				},
				{
					"atk",
					19122
				}
			}
		},
		{
			id = 3,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3480
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					211084
				},
				{
					"atk",
					19527
				}
			}
		},
		{
			id = 3,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					215464
				},
				{
					"atk",
					19932
				}
			}
		},
		{
			id = 3,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					316
				}
			},
			attr = {
				{
					"hp_max",
					219843
				},
				{
					"atk",
					20337
				}
			}
		},
		{
			id = 3,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3480
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					224222
				},
				{
					"atk",
					20743
				}
			}
		},
		{
			id = 3,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					228602
				},
				{
					"atk",
					21148
				}
			}
		},
		{
			id = 3,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17003,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					3479
				},
				{
					"atk",
					315
				}
			},
			attr = {
				{
					"hp_max",
					232981
				},
				{
					"atk",
					21553
				}
			}
		},
		{
			id = 3,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4116
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					237360
				},
				{
					"atk",
					21958
				}
			}
		},
		{
			id = 3,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4115
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					242616
				},
				{
					"atk",
					22444
				}
			}
		},
		{
			id = 3,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4115
				},
				{
					"atk",
					379
				}
			},
			attr = {
				{
					"hp_max",
					247871
				},
				{
					"atk",
					22930
				}
			}
		},
		{
			id = 3,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4115
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					253126
				},
				{
					"atk",
					23417
				}
			}
		},
		{
			id = 3,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4116
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					258381
				},
				{
					"atk",
					23903
				}
			}
		},
		{
			id = 3,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4115
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					263637
				},
				{
					"atk",
					24389
				}
			}
		},
		{
			id = 3,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4115
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					268892
				},
				{
					"atk",
					24875
				}
			}
		},
		{
			id = 3,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4115
				},
				{
					"atk",
					378
				}
			},
			attr = {
				{
					"hp_max",
					274147
				},
				{
					"atk",
					25361
				}
			}
		},
		{
			id = 3,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17003,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4116
				},
				{
					"atk",
					379
				}
			},
			attr = {
				{
					"hp_max",
					279402
				},
				{
					"atk",
					25847
				}
			}
		},
		{
			id = 3,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17003,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					284658
				},
				{
					"atk",
					26334
				}
			}
		}
	},
	{
		{
			id = 4,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					1014
				},
				{
					"atk",
					84
				}
			}
		},
		{
			id = 4,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					2028
				},
				{
					"atk",
					169
				}
			}
		},
		{
			id = 4,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					3042
				},
				{
					"atk",
					254
				}
			}
		},
		{
			id = 4,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					4056
				},
				{
					"atk",
					339
				}
			}
		},
		{
			id = 4,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					5070
				},
				{
					"atk",
					424
				}
			}
		},
		{
			id = 4,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					915
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					6084
				},
				{
					"atk",
					509
				}
			}
		},
		{
			id = 4,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					7099
				},
				{
					"atk",
					594
				}
			}
		},
		{
			id = 4,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					74
				}
			},
			attr = {
				{
					"hp_max",
					8113
				},
				{
					"atk",
					679
				}
			}
		},
		{
			id = 4,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					9127
				},
				{
					"atk",
					763
				}
			}
		},
		{
			id = 4,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17004,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					10141
				},
				{
					"atk",
					848
				}
			}
		},
		{
			id = 4,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					11155
				},
				{
					"atk",
					933
				}
			}
		},
		{
			id = 4,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					12677
				},
				{
					"atk",
					1061
				}
			}
		},
		{
			id = 4,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					14198
				},
				{
					"atk",
					1188
				}
			}
		},
		{
			id = 4,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					15719
				},
				{
					"atk",
					1315
				}
			}
		},
		{
			id = 4,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					17240
				},
				{
					"atk",
					1443
				}
			}
		},
		{
			id = 4,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					18762
				},
				{
					"atk",
					1570
				}
			}
		},
		{
			id = 4,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					20283
				},
				{
					"atk",
					1697
				}
			}
		},
		{
			id = 4,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					21804
				},
				{
					"atk",
					1825
				}
			}
		},
		{
			id = 4,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					23325
				},
				{
					"atk",
					1952
				}
			}
		},
		{
			id = 4,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17004,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					24847
				},
				{
					"atk",
					2079
				}
			}
		},
		{
			id = 4,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					26368
				},
				{
					"atk",
					2207
				}
			}
		},
		{
			id = 4,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					28396
				},
				{
					"atk",
					2376
				}
			}
		},
		{
			id = 4,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					30424
				},
				{
					"atk",
					2546
				}
			}
		},
		{
			id = 4,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					32453
				},
				{
					"atk",
					2716
				}
			}
		},
		{
			id = 4,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					34481
				},
				{
					"atk",
					2886
				}
			}
		},
		{
			id = 4,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					36509
				},
				{
					"atk",
					3055
				}
			}
		},
		{
			id = 4,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					38538
				},
				{
					"atk",
					3225
				}
			}
		},
		{
			id = 4,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					40566
				},
				{
					"atk",
					3395
				}
			}
		},
		{
			id = 4,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					42594
				},
				{
					"atk",
					3565
				}
			}
		},
		{
			id = 4,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17004,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					44623
				},
				{
					"atk",
					3734
				}
			}
		},
		{
			id = 4,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					46651
				},
				{
					"atk",
					3904
				}
			}
		},
		{
			id = 4,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					49187
				},
				{
					"atk",
					4116
				}
			}
		},
		{
			id = 4,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					51722
				},
				{
					"atk",
					4329
				}
			}
		},
		{
			id = 4,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					54257
				},
				{
					"atk",
					4541
				}
			}
		},
		{
			id = 4,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					56793
				},
				{
					"atk",
					4753
				}
			}
		},
		{
			id = 4,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					59328
				},
				{
					"atk",
					4965
				}
			}
		},
		{
			id = 4,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					61864
				},
				{
					"atk",
					5178
				}
			}
		},
		{
			id = 4,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					64399
				},
				{
					"atk",
					5390
				}
			}
		},
		{
			id = 4,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					66934
				},
				{
					"atk",
					5602
				}
			}
		},
		{
			id = 4,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17004,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					69470
				},
				{
					"atk",
					5814
				}
			}
		},
		{
			id = 4,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					72005
				},
				{
					"atk",
					6026
				}
			}
		},
		{
			id = 4,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					75048
				},
				{
					"atk",
					6281
				}
			}
		},
		{
			id = 4,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					78090
				},
				{
					"atk",
					6536
				}
			}
		},
		{
			id = 4,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					81133
				},
				{
					"atk",
					6790
				}
			}
		},
		{
			id = 4,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					84175
				},
				{
					"atk",
					7045
				}
			}
		},
		{
			id = 4,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					87218
				},
				{
					"atk",
					7300
				}
			}
		},
		{
			id = 4,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					90260
				},
				{
					"atk",
					7554
				}
			}
		},
		{
			id = 4,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					93303
				},
				{
					"atk",
					7809
				}
			}
		},
		{
			id = 4,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					96345
				},
				{
					"atk",
					8064
				}
			}
		},
		{
			id = 4,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17004,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					99388
				},
				{
					"atk",
					8318
				}
			}
		},
		{
			id = 4,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					102430
				},
				{
					"atk",
					8573
				}
			}
		},
		{
			id = 4,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					105980
				},
				{
					"atk",
					8870
				}
			}
		},
		{
			id = 4,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					109529
				},
				{
					"atk",
					9167
				}
			}
		},
		{
			id = 4,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					113079
				},
				{
					"atk",
					9464
				}
			}
		},
		{
			id = 4,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					249
				}
			},
			attr = {
				{
					"hp_max",
					116629
				},
				{
					"atk",
					9761
				}
			}
		},
		{
			id = 4,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					120178
				},
				{
					"atk",
					10059
				}
			}
		},
		{
			id = 4,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					123728
				},
				{
					"atk",
					10356
				}
			}
		},
		{
			id = 4,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					127277
				},
				{
					"atk",
					10653
				}
			}
		},
		{
			id = 4,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					130827
				},
				{
					"atk",
					10950
				}
			}
		},
		{
			id = 4,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17004,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					134377
				},
				{
					"atk",
					11247
				}
			}
		},
		{
			id = 4,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					137926
				},
				{
					"atk",
					11544
				}
			}
		},
		{
			id = 4,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					141983
				},
				{
					"atk",
					11884
				}
			}
		},
		{
			id = 4,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					146039
				},
				{
					"atk",
					12223
				}
			}
		},
		{
			id = 4,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					150096
				},
				{
					"atk",
					12563
				}
			}
		},
		{
			id = 4,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					154153
				},
				{
					"atk",
					12902
				}
			}
		},
		{
			id = 4,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					158209
				},
				{
					"atk",
					13242
				}
			}
		},
		{
			id = 4,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					162266
				},
				{
					"atk",
					13581
				}
			}
		},
		{
			id = 4,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					166323
				},
				{
					"atk",
					13921
				}
			}
		},
		{
			id = 4,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					170379
				},
				{
					"atk",
					14260
				}
			}
		},
		{
			id = 4,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17004,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					174436
				},
				{
					"atk",
					14600
				}
			}
		},
		{
			id = 4,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					178493
				},
				{
					"atk",
					14939
				}
			}
		},
		{
			id = 4,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					183056
				},
				{
					"atk",
					15321
				}
			}
		},
		{
			id = 4,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					187620
				},
				{
					"atk",
					15703
				}
			}
		},
		{
			id = 4,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					192184
				},
				{
					"atk",
					16085
				}
			}
		},
		{
			id = 4,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					196748
				},
				{
					"atk",
					16467
				}
			}
		},
		{
			id = 4,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					201311
				},
				{
					"atk",
					16849
				}
			}
		},
		{
			id = 4,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					205875
				},
				{
					"atk",
					17231
				}
			}
		},
		{
			id = 4,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					210439
				},
				{
					"atk",
					17613
				}
			}
		},
		{
			id = 4,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					215003
				},
				{
					"atk",
					17995
				}
			}
		},
		{
			id = 4,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17004,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					219566
				},
				{
					"atk",
					18377
				}
			}
		},
		{
			id = 4,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					224130
				},
				{
					"atk",
					18759
				}
			}
		},
		{
			id = 4,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					229201
				},
				{
					"atk",
					19184
				}
			}
		},
		{
			id = 4,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					234272
				},
				{
					"atk",
					19608
				}
			}
		},
		{
			id = 4,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					239343
				},
				{
					"atk",
					20033
				}
			}
		},
		{
			id = 4,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4170
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					244414
				},
				{
					"atk",
					20457
				}
			}
		},
		{
			id = 4,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					249484
				},
				{
					"atk",
					20881
				}
			}
		},
		{
			id = 4,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					254555
				},
				{
					"atk",
					21306
				}
			}
		},
		{
			id = 4,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					259626
				},
				{
					"atk",
					21730
				}
			}
		},
		{
			id = 4,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					264697
				},
				{
					"atk",
					22155
				}
			}
		},
		{
			id = 4,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17004,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					269768
				},
				{
					"atk",
					22579
				}
			}
		},
		{
			id = 4,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					274839
				},
				{
					"atk",
					23004
				}
			}
		},
		{
			id = 4,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					280924
				},
				{
					"atk",
					23513
				}
			}
		},
		{
			id = 4,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					287009
				},
				{
					"atk",
					24022
				}
			}
		},
		{
			id = 4,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					293094
				},
				{
					"atk",
					24532
				}
			}
		},
		{
			id = 4,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					299179
				},
				{
					"atk",
					25041
				}
			}
		},
		{
			id = 4,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					305264
				},
				{
					"atk",
					25550
				}
			}
		},
		{
			id = 4,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					311349
				},
				{
					"atk",
					26060
				}
			}
		},
		{
			id = 4,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					317434
				},
				{
					"atk",
					26569
				}
			}
		},
		{
			id = 4,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17004,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					323519
				},
				{
					"atk",
					27078
				}
			}
		},
		{
			id = 4,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17004,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					329604
				},
				{
					"atk",
					27588
				}
			}
		}
	},
	{
		{
			id = 5,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					1014
				},
				{
					"atk",
					84
				}
			}
		},
		{
			id = 5,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					2028
				},
				{
					"atk",
					169
				}
			}
		},
		{
			id = 5,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					3042
				},
				{
					"atk",
					254
				}
			}
		},
		{
			id = 5,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					4056
				},
				{
					"atk",
					339
				}
			}
		},
		{
			id = 5,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					5070
				},
				{
					"atk",
					424
				}
			}
		},
		{
			id = 5,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					915
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					6084
				},
				{
					"atk",
					509
				}
			}
		},
		{
			id = 5,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					7099
				},
				{
					"atk",
					594
				}
			}
		},
		{
			id = 5,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					74
				}
			},
			attr = {
				{
					"hp_max",
					8113
				},
				{
					"atk",
					679
				}
			}
		},
		{
			id = 5,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					9127
				},
				{
					"atk",
					763
				}
			}
		},
		{
			id = 5,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17005,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					10141
				},
				{
					"atk",
					848
				}
			}
		},
		{
			id = 5,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					11155
				},
				{
					"atk",
					933
				}
			}
		},
		{
			id = 5,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					12677
				},
				{
					"atk",
					1061
				}
			}
		},
		{
			id = 5,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					14198
				},
				{
					"atk",
					1188
				}
			}
		},
		{
			id = 5,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					15719
				},
				{
					"atk",
					1315
				}
			}
		},
		{
			id = 5,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					17240
				},
				{
					"atk",
					1443
				}
			}
		},
		{
			id = 5,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					18762
				},
				{
					"atk",
					1570
				}
			}
		},
		{
			id = 5,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					20283
				},
				{
					"atk",
					1697
				}
			}
		},
		{
			id = 5,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					21804
				},
				{
					"atk",
					1825
				}
			}
		},
		{
			id = 5,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					23325
				},
				{
					"atk",
					1952
				}
			}
		},
		{
			id = 5,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17005,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					24847
				},
				{
					"atk",
					2079
				}
			}
		},
		{
			id = 5,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					26368
				},
				{
					"atk",
					2207
				}
			}
		},
		{
			id = 5,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					28396
				},
				{
					"atk",
					2376
				}
			}
		},
		{
			id = 5,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					30424
				},
				{
					"atk",
					2546
				}
			}
		},
		{
			id = 5,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					32453
				},
				{
					"atk",
					2716
				}
			}
		},
		{
			id = 5,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					34481
				},
				{
					"atk",
					2886
				}
			}
		},
		{
			id = 5,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					36509
				},
				{
					"atk",
					3055
				}
			}
		},
		{
			id = 5,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					38538
				},
				{
					"atk",
					3225
				}
			}
		},
		{
			id = 5,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					40566
				},
				{
					"atk",
					3395
				}
			}
		},
		{
			id = 5,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					42594
				},
				{
					"atk",
					3565
				}
			}
		},
		{
			id = 5,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17005,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					44623
				},
				{
					"atk",
					3734
				}
			}
		},
		{
			id = 5,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					46651
				},
				{
					"atk",
					3904
				}
			}
		},
		{
			id = 5,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					49187
				},
				{
					"atk",
					4116
				}
			}
		},
		{
			id = 5,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					51722
				},
				{
					"atk",
					4329
				}
			}
		},
		{
			id = 5,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					54257
				},
				{
					"atk",
					4541
				}
			}
		},
		{
			id = 5,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					56793
				},
				{
					"atk",
					4753
				}
			}
		},
		{
			id = 5,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					59328
				},
				{
					"atk",
					4965
				}
			}
		},
		{
			id = 5,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					61864
				},
				{
					"atk",
					5178
				}
			}
		},
		{
			id = 5,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					64399
				},
				{
					"atk",
					5390
				}
			}
		},
		{
			id = 5,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					66934
				},
				{
					"atk",
					5602
				}
			}
		},
		{
			id = 5,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17005,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					69470
				},
				{
					"atk",
					5814
				}
			}
		},
		{
			id = 5,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					72005
				},
				{
					"atk",
					6026
				}
			}
		},
		{
			id = 5,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					75048
				},
				{
					"atk",
					6281
				}
			}
		},
		{
			id = 5,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					78090
				},
				{
					"atk",
					6536
				}
			}
		},
		{
			id = 5,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					81133
				},
				{
					"atk",
					6790
				}
			}
		},
		{
			id = 5,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					84175
				},
				{
					"atk",
					7045
				}
			}
		},
		{
			id = 5,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					87218
				},
				{
					"atk",
					7300
				}
			}
		},
		{
			id = 5,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					90260
				},
				{
					"atk",
					7554
				}
			}
		},
		{
			id = 5,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					93303
				},
				{
					"atk",
					7809
				}
			}
		},
		{
			id = 5,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					96345
				},
				{
					"atk",
					8064
				}
			}
		},
		{
			id = 5,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17005,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					99388
				},
				{
					"atk",
					8318
				}
			}
		},
		{
			id = 5,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					102430
				},
				{
					"atk",
					8573
				}
			}
		},
		{
			id = 5,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					105980
				},
				{
					"atk",
					8870
				}
			}
		},
		{
			id = 5,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					109529
				},
				{
					"atk",
					9167
				}
			}
		},
		{
			id = 5,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					113079
				},
				{
					"atk",
					9464
				}
			}
		},
		{
			id = 5,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					249
				}
			},
			attr = {
				{
					"hp_max",
					116629
				},
				{
					"atk",
					9761
				}
			}
		},
		{
			id = 5,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					120178
				},
				{
					"atk",
					10059
				}
			}
		},
		{
			id = 5,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					123728
				},
				{
					"atk",
					10356
				}
			}
		},
		{
			id = 5,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					127277
				},
				{
					"atk",
					10653
				}
			}
		},
		{
			id = 5,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					130827
				},
				{
					"atk",
					10950
				}
			}
		},
		{
			id = 5,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17005,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					134377
				},
				{
					"atk",
					11247
				}
			}
		},
		{
			id = 5,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					137926
				},
				{
					"atk",
					11544
				}
			}
		},
		{
			id = 5,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					141983
				},
				{
					"atk",
					11884
				}
			}
		},
		{
			id = 5,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					146039
				},
				{
					"atk",
					12223
				}
			}
		},
		{
			id = 5,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					150096
				},
				{
					"atk",
					12563
				}
			}
		},
		{
			id = 5,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					154153
				},
				{
					"atk",
					12902
				}
			}
		},
		{
			id = 5,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					158209
				},
				{
					"atk",
					13242
				}
			}
		},
		{
			id = 5,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					162266
				},
				{
					"atk",
					13581
				}
			}
		},
		{
			id = 5,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					166323
				},
				{
					"atk",
					13921
				}
			}
		},
		{
			id = 5,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					170379
				},
				{
					"atk",
					14260
				}
			}
		},
		{
			id = 5,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17005,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					174436
				},
				{
					"atk",
					14600
				}
			}
		},
		{
			id = 5,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					178493
				},
				{
					"atk",
					14939
				}
			}
		},
		{
			id = 5,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					183056
				},
				{
					"atk",
					15321
				}
			}
		},
		{
			id = 5,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					187620
				},
				{
					"atk",
					15703
				}
			}
		},
		{
			id = 5,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					192184
				},
				{
					"atk",
					16085
				}
			}
		},
		{
			id = 5,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					196748
				},
				{
					"atk",
					16467
				}
			}
		},
		{
			id = 5,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					201311
				},
				{
					"atk",
					16849
				}
			}
		},
		{
			id = 5,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					205875
				},
				{
					"atk",
					17231
				}
			}
		},
		{
			id = 5,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					210439
				},
				{
					"atk",
					17613
				}
			}
		},
		{
			id = 5,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					215003
				},
				{
					"atk",
					17995
				}
			}
		},
		{
			id = 5,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17005,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					219566
				},
				{
					"atk",
					18377
				}
			}
		},
		{
			id = 5,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					224130
				},
				{
					"atk",
					18759
				}
			}
		},
		{
			id = 5,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					229201
				},
				{
					"atk",
					19184
				}
			}
		},
		{
			id = 5,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					234272
				},
				{
					"atk",
					19608
				}
			}
		},
		{
			id = 5,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					239343
				},
				{
					"atk",
					20033
				}
			}
		},
		{
			id = 5,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4170
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					244414
				},
				{
					"atk",
					20457
				}
			}
		},
		{
			id = 5,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					249484
				},
				{
					"atk",
					20881
				}
			}
		},
		{
			id = 5,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					254555
				},
				{
					"atk",
					21306
				}
			}
		},
		{
			id = 5,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					259626
				},
				{
					"atk",
					21730
				}
			}
		},
		{
			id = 5,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					264697
				},
				{
					"atk",
					22155
				}
			}
		},
		{
			id = 5,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17005,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					269768
				},
				{
					"atk",
					22579
				}
			}
		},
		{
			id = 5,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					274839
				},
				{
					"atk",
					23004
				}
			}
		},
		{
			id = 5,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					280924
				},
				{
					"atk",
					23513
				}
			}
		},
		{
			id = 5,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					287009
				},
				{
					"atk",
					24022
				}
			}
		},
		{
			id = 5,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					293094
				},
				{
					"atk",
					24532
				}
			}
		},
		{
			id = 5,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					299179
				},
				{
					"atk",
					25041
				}
			}
		},
		{
			id = 5,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					305264
				},
				{
					"atk",
					25550
				}
			}
		},
		{
			id = 5,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					311349
				},
				{
					"atk",
					26060
				}
			}
		},
		{
			id = 5,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					317434
				},
				{
					"atk",
					26569
				}
			}
		},
		{
			id = 5,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17005,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					323519
				},
				{
					"atk",
					27078
				}
			}
		},
		{
			id = 5,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17005,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					329604
				},
				{
					"atk",
					27588
				}
			}
		}
	},
	{
		{
			id = 6,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					1014
				},
				{
					"atk",
					84
				}
			}
		},
		{
			id = 6,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					2028
				},
				{
					"atk",
					169
				}
			}
		},
		{
			id = 6,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					3042
				},
				{
					"atk",
					254
				}
			}
		},
		{
			id = 6,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					4056
				},
				{
					"atk",
					339
				}
			}
		},
		{
			id = 6,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					5070
				},
				{
					"atk",
					424
				}
			}
		},
		{
			id = 6,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					915
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					6084
				},
				{
					"atk",
					509
				}
			}
		},
		{
			id = 6,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					7099
				},
				{
					"atk",
					594
				}
			}
		},
		{
			id = 6,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					74
				}
			},
			attr = {
				{
					"hp_max",
					8113
				},
				{
					"atk",
					679
				}
			}
		},
		{
			id = 6,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					9127
				},
				{
					"atk",
					763
				}
			}
		},
		{
			id = 6,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					10141
				},
				{
					"atk",
					848
				}
			}
		},
		{
			id = 6,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					11155
				},
				{
					"atk",
					933
				}
			}
		},
		{
			id = 6,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					12677
				},
				{
					"atk",
					1061
				}
			}
		},
		{
			id = 6,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					14198
				},
				{
					"atk",
					1188
				}
			}
		},
		{
			id = 6,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					15719
				},
				{
					"atk",
					1315
				}
			}
		},
		{
			id = 6,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					17240
				},
				{
					"atk",
					1443
				}
			}
		},
		{
			id = 6,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					18762
				},
				{
					"atk",
					1570
				}
			}
		},
		{
			id = 6,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					20283
				},
				{
					"atk",
					1697
				}
			}
		},
		{
			id = 6,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					21804
				},
				{
					"atk",
					1825
				}
			}
		},
		{
			id = 6,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					23325
				},
				{
					"atk",
					1952
				}
			}
		},
		{
			id = 6,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					24847
				},
				{
					"atk",
					2079
				}
			}
		},
		{
			id = 6,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					26368
				},
				{
					"atk",
					2207
				}
			}
		},
		{
			id = 6,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					28396
				},
				{
					"atk",
					2376
				}
			}
		},
		{
			id = 6,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					30424
				},
				{
					"atk",
					2546
				}
			}
		},
		{
			id = 6,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					32453
				},
				{
					"atk",
					2716
				}
			}
		},
		{
			id = 6,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					34481
				},
				{
					"atk",
					2886
				}
			}
		},
		{
			id = 6,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					36509
				},
				{
					"atk",
					3055
				}
			}
		},
		{
			id = 6,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					38538
				},
				{
					"atk",
					3225
				}
			}
		},
		{
			id = 6,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					40566
				},
				{
					"atk",
					3395
				}
			}
		},
		{
			id = 6,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					42594
				},
				{
					"atk",
					3565
				}
			}
		},
		{
			id = 6,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					44623
				},
				{
					"atk",
					3734
				}
			}
		},
		{
			id = 6,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					46651
				},
				{
					"atk",
					3904
				}
			}
		},
		{
			id = 6,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					49187
				},
				{
					"atk",
					4116
				}
			}
		},
		{
			id = 6,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					51722
				},
				{
					"atk",
					4329
				}
			}
		},
		{
			id = 6,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					54257
				},
				{
					"atk",
					4541
				}
			}
		},
		{
			id = 6,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					56793
				},
				{
					"atk",
					4753
				}
			}
		},
		{
			id = 6,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					59328
				},
				{
					"atk",
					4965
				}
			}
		},
		{
			id = 6,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					61864
				},
				{
					"atk",
					5178
				}
			}
		},
		{
			id = 6,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					64399
				},
				{
					"atk",
					5390
				}
			}
		},
		{
			id = 6,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					66934
				},
				{
					"atk",
					5602
				}
			}
		},
		{
			id = 6,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					69470
				},
				{
					"atk",
					5814
				}
			}
		},
		{
			id = 6,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					72005
				},
				{
					"atk",
					6026
				}
			}
		},
		{
			id = 6,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					75048
				},
				{
					"atk",
					6281
				}
			}
		},
		{
			id = 6,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					78090
				},
				{
					"atk",
					6536
				}
			}
		},
		{
			id = 6,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					81133
				},
				{
					"atk",
					6790
				}
			}
		},
		{
			id = 6,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					84175
				},
				{
					"atk",
					7045
				}
			}
		},
		{
			id = 6,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					87218
				},
				{
					"atk",
					7300
				}
			}
		},
		{
			id = 6,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					90260
				},
				{
					"atk",
					7554
				}
			}
		},
		{
			id = 6,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					93303
				},
				{
					"atk",
					7809
				}
			}
		},
		{
			id = 6,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					96345
				},
				{
					"atk",
					8064
				}
			}
		},
		{
			id = 6,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					99388
				},
				{
					"atk",
					8318
				}
			}
		},
		{
			id = 6,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					102430
				},
				{
					"atk",
					8573
				}
			}
		},
		{
			id = 6,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					105980
				},
				{
					"atk",
					8870
				}
			}
		},
		{
			id = 6,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					109529
				},
				{
					"atk",
					9167
				}
			}
		},
		{
			id = 6,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					113079
				},
				{
					"atk",
					9464
				}
			}
		},
		{
			id = 6,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					249
				}
			},
			attr = {
				{
					"hp_max",
					116629
				},
				{
					"atk",
					9761
				}
			}
		},
		{
			id = 6,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					120178
				},
				{
					"atk",
					10059
				}
			}
		},
		{
			id = 6,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					123728
				},
				{
					"atk",
					10356
				}
			}
		},
		{
			id = 6,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					127277
				},
				{
					"atk",
					10653
				}
			}
		},
		{
			id = 6,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					130827
				},
				{
					"atk",
					10950
				}
			}
		},
		{
			id = 6,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					134377
				},
				{
					"atk",
					11247
				}
			}
		},
		{
			id = 6,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					137926
				},
				{
					"atk",
					11544
				}
			}
		},
		{
			id = 6,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					141983
				},
				{
					"atk",
					11884
				}
			}
		},
		{
			id = 6,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					146039
				},
				{
					"atk",
					12223
				}
			}
		},
		{
			id = 6,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					150096
				},
				{
					"atk",
					12563
				}
			}
		},
		{
			id = 6,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					154153
				},
				{
					"atk",
					12902
				}
			}
		},
		{
			id = 6,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					158209
				},
				{
					"atk",
					13242
				}
			}
		},
		{
			id = 6,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					162266
				},
				{
					"atk",
					13581
				}
			}
		},
		{
			id = 6,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					166323
				},
				{
					"atk",
					13921
				}
			}
		},
		{
			id = 6,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					170379
				},
				{
					"atk",
					14260
				}
			}
		},
		{
			id = 6,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					174436
				},
				{
					"atk",
					14600
				}
			}
		},
		{
			id = 6,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					178493
				},
				{
					"atk",
					14939
				}
			}
		},
		{
			id = 6,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					183056
				},
				{
					"atk",
					15321
				}
			}
		},
		{
			id = 6,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					187620
				},
				{
					"atk",
					15703
				}
			}
		},
		{
			id = 6,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					192184
				},
				{
					"atk",
					16085
				}
			}
		},
		{
			id = 6,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					196748
				},
				{
					"atk",
					16467
				}
			}
		},
		{
			id = 6,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					201311
				},
				{
					"atk",
					16849
				}
			}
		},
		{
			id = 6,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					205875
				},
				{
					"atk",
					17231
				}
			}
		},
		{
			id = 6,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					210439
				},
				{
					"atk",
					17613
				}
			}
		},
		{
			id = 6,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					215003
				},
				{
					"atk",
					17995
				}
			}
		},
		{
			id = 6,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					219566
				},
				{
					"atk",
					18377
				}
			}
		},
		{
			id = 6,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					224130
				},
				{
					"atk",
					18759
				}
			}
		},
		{
			id = 6,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					229201
				},
				{
					"atk",
					19184
				}
			}
		},
		{
			id = 6,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					234272
				},
				{
					"atk",
					19608
				}
			}
		},
		{
			id = 6,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					239343
				},
				{
					"atk",
					20033
				}
			}
		},
		{
			id = 6,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4170
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					244414
				},
				{
					"atk",
					20457
				}
			}
		},
		{
			id = 6,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					249484
				},
				{
					"atk",
					20881
				}
			}
		},
		{
			id = 6,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					254555
				},
				{
					"atk",
					21306
				}
			}
		},
		{
			id = 6,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					259626
				},
				{
					"atk",
					21730
				}
			}
		},
		{
			id = 6,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					264697
				},
				{
					"atk",
					22155
				}
			}
		},
		{
			id = 6,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					269768
				},
				{
					"atk",
					22579
				}
			}
		},
		{
			id = 6,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					274839
				},
				{
					"atk",
					23004
				}
			}
		},
		{
			id = 6,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					280924
				},
				{
					"atk",
					23513
				}
			}
		},
		{
			id = 6,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					287009
				},
				{
					"atk",
					24022
				}
			}
		},
		{
			id = 6,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					293094
				},
				{
					"atk",
					24532
				}
			}
		},
		{
			id = 6,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					299179
				},
				{
					"atk",
					25041
				}
			}
		},
		{
			id = 6,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					305264
				},
				{
					"atk",
					25550
				}
			}
		},
		{
			id = 6,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					311349
				},
				{
					"atk",
					26060
				}
			}
		},
		{
			id = 6,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					317434
				},
				{
					"atk",
					26569
				}
			}
		},
		{
			id = 6,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					323519
				},
				{
					"atk",
					27078
				}
			}
		},
		{
			id = 6,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17006,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					329604
				},
				{
					"atk",
					27588
				}
			}
		}
	},
	{
		{
			id = 7,
			lev = 1,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					5
				},
				{
					1,
					50000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					1014
				},
				{
					"atk",
					84
				}
			}
		},
		{
			id = 7,
			lev = 2,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					6
				},
				{
					1,
					80000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					2028
				},
				{
					"atk",
					169
				}
			}
		},
		{
			id = 7,
			lev = 3,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					7
				},
				{
					1,
					110000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					3042
				},
				{
					"atk",
					254
				}
			}
		},
		{
			id = 7,
			lev = 4,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					8
				},
				{
					1,
					140000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					4056
				},
				{
					"atk",
					339
				}
			}
		},
		{
			id = 7,
			lev = 5,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					9
				},
				{
					1,
					170000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					5070
				},
				{
					"atk",
					424
				}
			}
		},
		{
			id = 7,
			lev = 6,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					10
				},
				{
					1,
					200000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					915
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					6084
				},
				{
					"atk",
					509
				}
			}
		},
		{
			id = 7,
			lev = 7,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					12
				},
				{
					1,
					230000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					7099
				},
				{
					"atk",
					594
				}
			}
		},
		{
			id = 7,
			lev = 8,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					14
				},
				{
					1,
					260000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					74
				}
			},
			attr = {
				{
					"hp_max",
					8113
				},
				{
					"atk",
					679
				}
			}
		},
		{
			id = 7,
			lev = 9,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					16
				},
				{
					1,
					290000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					9127
				},
				{
					"atk",
					763
				}
			}
		},
		{
			id = 7,
			lev = 10,
			exp = 10,
			total_exp = 20,
			loss = {
				{
					17006,
					18
				},
				{
					1,
					320000
				}
			},
			exp_attr = {
				{
					"hp_max",
					50
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					914
				},
				{
					"atk",
					75
				}
			},
			attr = {
				{
					"hp_max",
					10141
				},
				{
					"atk",
					848
				}
			}
		},
		{
			id = 7,
			lev = 11,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					20
				},
				{
					1,
					350000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					11155
				},
				{
					"atk",
					933
				}
			}
		},
		{
			id = 7,
			lev = 12,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					22
				},
				{
					1,
					380000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					12677
				},
				{
					"atk",
					1061
				}
			}
		},
		{
			id = 7,
			lev = 13,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					24
				},
				{
					1,
					410000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					14198
				},
				{
					"atk",
					1188
				}
			}
		},
		{
			id = 7,
			lev = 14,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					26
				},
				{
					1,
					440000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					15719
				},
				{
					"atk",
					1315
				}
			}
		},
		{
			id = 7,
			lev = 15,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					28
				},
				{
					1,
					470000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					17240
				},
				{
					"atk",
					1443
				}
			}
		},
		{
			id = 7,
			lev = 16,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					30
				},
				{
					1,
					500000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					18762
				},
				{
					"atk",
					1570
				}
			}
		},
		{
			id = 7,
			lev = 17,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					32
				},
				{
					1,
					530000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					20283
				},
				{
					"atk",
					1697
				}
			}
		},
		{
			id = 7,
			lev = 18,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					34
				},
				{
					1,
					560000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					21804
				},
				{
					"atk",
					1825
				}
			}
		},
		{
			id = 7,
			lev = 19,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					36
				},
				{
					1,
					590000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1357
				},
				{
					"atk",
					112
				}
			},
			attr = {
				{
					"hp_max",
					23325
				},
				{
					"atk",
					1952
				}
			}
		},
		{
			id = 7,
			lev = 20,
			exp = 10,
			total_exp = 30,
			loss = {
				{
					17006,
					38
				},
				{
					1,
					620000
				}
			},
			exp_attr = {
				{
					"hp_max",
					55
				},
				{
					"atk",
					5
				}
			},
			show_attr = {
				{
					"hp_max",
					1356
				},
				{
					"atk",
					113
				}
			},
			attr = {
				{
					"hp_max",
					24847
				},
				{
					"atk",
					2079
				}
			}
		},
		{
			id = 7,
			lev = 21,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					40
				},
				{
					1,
					650000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					26368
				},
				{
					"atk",
					2207
				}
			}
		},
		{
			id = 7,
			lev = 22,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					42
				},
				{
					1,
					680000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					28396
				},
				{
					"atk",
					2376
				}
			}
		},
		{
			id = 7,
			lev = 23,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					44
				},
				{
					1,
					710000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					30424
				},
				{
					"atk",
					2546
				}
			}
		},
		{
			id = 7,
			lev = 24,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					46
				},
				{
					1,
					740000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					32453
				},
				{
					"atk",
					2716
				}
			}
		},
		{
			id = 7,
			lev = 25,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					48
				},
				{
					1,
					770000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					34481
				},
				{
					"atk",
					2886
				}
			}
		},
		{
			id = 7,
			lev = 26,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					50
				},
				{
					1,
					800000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					36509
				},
				{
					"atk",
					3055
				}
			}
		},
		{
			id = 7,
			lev = 27,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					52
				},
				{
					1,
					830000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					38538
				},
				{
					"atk",
					3225
				}
			}
		},
		{
			id = 7,
			lev = 28,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					54
				},
				{
					1,
					860000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					40566
				},
				{
					"atk",
					3395
				}
			}
		},
		{
			id = 7,
			lev = 29,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					56
				},
				{
					1,
					890000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1789
				},
				{
					"atk",
					145
				}
			},
			attr = {
				{
					"hp_max",
					42594
				},
				{
					"atk",
					3565
				}
			}
		},
		{
			id = 7,
			lev = 30,
			exp = 10,
			total_exp = 40,
			loss = {
				{
					17006,
					58
				},
				{
					1,
					920000
				}
			},
			exp_attr = {
				{
					"hp_max",
					60
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					1788
				},
				{
					"atk",
					146
				}
			},
			attr = {
				{
					"hp_max",
					44623
				},
				{
					"atk",
					3734
				}
			}
		},
		{
			id = 7,
			lev = 31,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					60
				},
				{
					1,
					950000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					46651
				},
				{
					"atk",
					3904
				}
			}
		},
		{
			id = 7,
			lev = 32,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					62
				},
				{
					1,
					980000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					49187
				},
				{
					"atk",
					4116
				}
			}
		},
		{
			id = 7,
			lev = 33,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					64
				},
				{
					1,
					1010000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					51722
				},
				{
					"atk",
					4329
				}
			}
		},
		{
			id = 7,
			lev = 34,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					66
				},
				{
					1,
					1040000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					54257
				},
				{
					"atk",
					4541
				}
			}
		},
		{
			id = 7,
			lev = 35,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					68
				},
				{
					1,
					1070000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					56793
				},
				{
					"atk",
					4753
				}
			}
		},
		{
			id = 7,
			lev = 36,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					70
				},
				{
					1,
					1100000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					183
				}
			},
			attr = {
				{
					"hp_max",
					59328
				},
				{
					"atk",
					4965
				}
			}
		},
		{
			id = 7,
			lev = 37,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					72
				},
				{
					1,
					1130000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					61864
				},
				{
					"atk",
					5178
				}
			}
		},
		{
			id = 7,
			lev = 38,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					74
				},
				{
					1,
					1160000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					64399
				},
				{
					"atk",
					5390
				}
			}
		},
		{
			id = 7,
			lev = 39,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					76
				},
				{
					1,
					1190000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2211
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					66934
				},
				{
					"atk",
					5602
				}
			}
		},
		{
			id = 7,
			lev = 40,
			exp = 10,
			total_exp = 50,
			loss = {
				{
					17006,
					78
				},
				{
					1,
					1220000
				}
			},
			exp_attr = {
				{
					"hp_max",
					65
				},
				{
					"atk",
					6
				}
			},
			show_attr = {
				{
					"hp_max",
					2210
				},
				{
					"atk",
					182
				}
			},
			attr = {
				{
					"hp_max",
					69470
				},
				{
					"atk",
					5814
				}
			}
		},
		{
			id = 7,
			lev = 41,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					80
				},
				{
					1,
					1250000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					72005
				},
				{
					"atk",
					6026
				}
			}
		},
		{
			id = 7,
			lev = 42,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					82
				},
				{
					1,
					1280000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					75048
				},
				{
					"atk",
					6281
				}
			}
		},
		{
			id = 7,
			lev = 43,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					84
				},
				{
					1,
					1310000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					78090
				},
				{
					"atk",
					6536
				}
			}
		},
		{
			id = 7,
			lev = 44,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					86
				},
				{
					1,
					1340000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					81133
				},
				{
					"atk",
					6790
				}
			}
		},
		{
			id = 7,
			lev = 45,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					88
				},
				{
					1,
					1370000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					84175
				},
				{
					"atk",
					7045
				}
			}
		},
		{
			id = 7,
			lev = 46,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					90
				},
				{
					1,
					1400000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					87218
				},
				{
					"atk",
					7300
				}
			}
		},
		{
			id = 7,
			lev = 47,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					92
				},
				{
					1,
					1430000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					90260
				},
				{
					"atk",
					7554
				}
			}
		},
		{
			id = 7,
			lev = 48,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					94
				},
				{
					1,
					1460000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					93303
				},
				{
					"atk",
					7809
				}
			}
		},
		{
			id = 7,
			lev = 49,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					96
				},
				{
					1,
					1490000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2623
				},
				{
					"atk",
					212
				}
			},
			attr = {
				{
					"hp_max",
					96345
				},
				{
					"atk",
					8064
				}
			}
		},
		{
			id = 7,
			lev = 50,
			exp = 10,
			total_exp = 60,
			loss = {
				{
					17006,
					98
				},
				{
					1,
					1520000
				}
			},
			exp_attr = {
				{
					"hp_max",
					70
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					2622
				},
				{
					"atk",
					213
				}
			},
			attr = {
				{
					"hp_max",
					99388
				},
				{
					"atk",
					8318
				}
			}
		},
		{
			id = 7,
			lev = 51,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					100
				},
				{
					1,
					1550000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					102430
				},
				{
					"atk",
					8573
				}
			}
		},
		{
			id = 7,
			lev = 52,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					102
				},
				{
					1,
					1580000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					105980
				},
				{
					"atk",
					8870
				}
			}
		},
		{
			id = 7,
			lev = 53,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					104
				},
				{
					1,
					1610000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					109529
				},
				{
					"atk",
					9167
				}
			}
		},
		{
			id = 7,
			lev = 54,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					106
				},
				{
					1,
					1640000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					113079
				},
				{
					"atk",
					9464
				}
			}
		},
		{
			id = 7,
			lev = 55,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					108
				},
				{
					1,
					1670000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					249
				}
			},
			attr = {
				{
					"hp_max",
					116629
				},
				{
					"atk",
					9761
				}
			}
		},
		{
			id = 7,
			lev = 56,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					110
				},
				{
					1,
					1700000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					120178
				},
				{
					"atk",
					10059
				}
			}
		},
		{
			id = 7,
			lev = 57,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					112
				},
				{
					1,
					1730000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					123728
				},
				{
					"atk",
					10356
				}
			}
		},
		{
			id = 7,
			lev = 58,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					114
				},
				{
					1,
					1760000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					127277
				},
				{
					"atk",
					10653
				}
			}
		},
		{
			id = 7,
			lev = 59,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					116
				},
				{
					1,
					1790000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3025
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					130827
				},
				{
					"atk",
					10950
				}
			}
		},
		{
			id = 7,
			lev = 60,
			exp = 10,
			total_exp = 70,
			loss = {
				{
					17006,
					118
				},
				{
					1,
					1820000
				}
			},
			exp_attr = {
				{
					"hp_max",
					75
				},
				{
					"atk",
					7
				}
			},
			show_attr = {
				{
					"hp_max",
					3024
				},
				{
					"atk",
					248
				}
			},
			attr = {
				{
					"hp_max",
					134377
				},
				{
					"atk",
					11247
				}
			}
		},
		{
			id = 7,
			lev = 61,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					120
				},
				{
					1,
					1850000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					137926
				},
				{
					"atk",
					11544
				}
			}
		},
		{
			id = 7,
			lev = 62,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					122
				},
				{
					1,
					1880000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					141983
				},
				{
					"atk",
					11884
				}
			}
		},
		{
			id = 7,
			lev = 63,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					124
				},
				{
					1,
					1910000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					146039
				},
				{
					"atk",
					12223
				}
			}
		},
		{
			id = 7,
			lev = 64,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					126
				},
				{
					1,
					1940000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					150096
				},
				{
					"atk",
					12563
				}
			}
		},
		{
			id = 7,
			lev = 65,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					128
				},
				{
					1,
					1970000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					154153
				},
				{
					"atk",
					12902
				}
			}
		},
		{
			id = 7,
			lev = 66,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					130
				},
				{
					1,
					2000000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					158209
				},
				{
					"atk",
					13242
				}
			}
		},
		{
			id = 7,
			lev = 67,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					132
				},
				{
					1,
					2030000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					162266
				},
				{
					"atk",
					13581
				}
			}
		},
		{
			id = 7,
			lev = 68,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					134
				},
				{
					1,
					2060000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3416
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					166323
				},
				{
					"atk",
					13921
				}
			}
		},
		{
			id = 7,
			lev = 69,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					136
				},
				{
					1,
					2090000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					276
				}
			},
			attr = {
				{
					"hp_max",
					170379
				},
				{
					"atk",
					14260
				}
			}
		},
		{
			id = 7,
			lev = 70,
			exp = 10,
			total_exp = 80,
			loss = {
				{
					17006,
					138
				},
				{
					1,
					2120000
				}
			},
			exp_attr = {
				{
					"hp_max",
					80
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3417
				},
				{
					"atk",
					275
				}
			},
			attr = {
				{
					"hp_max",
					174436
				},
				{
					"atk",
					14600
				}
			}
		},
		{
			id = 7,
			lev = 71,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					140
				},
				{
					1,
					2150000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					178493
				},
				{
					"atk",
					14939
				}
			}
		},
		{
			id = 7,
			lev = 72,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					142
				},
				{
					1,
					2180000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					183056
				},
				{
					"atk",
					15321
				}
			}
		},
		{
			id = 7,
			lev = 73,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					144
				},
				{
					1,
					2210000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					187620
				},
				{
					"atk",
					15703
				}
			}
		},
		{
			id = 7,
			lev = 74,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					146
				},
				{
					1,
					2240000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					192184
				},
				{
					"atk",
					16085
				}
			}
		},
		{
			id = 7,
			lev = 75,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					148
				},
				{
					1,
					2270000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					196748
				},
				{
					"atk",
					16467
				}
			}
		},
		{
			id = 7,
			lev = 76,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					150
				},
				{
					1,
					2300000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					201311
				},
				{
					"atk",
					16849
				}
			}
		},
		{
			id = 7,
			lev = 77,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					152
				},
				{
					1,
					2330000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					205875
				},
				{
					"atk",
					17231
				}
			}
		},
		{
			id = 7,
			lev = 78,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					154
				},
				{
					1,
					2360000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					210439
				},
				{
					"atk",
					17613
				}
			}
		},
		{
			id = 7,
			lev = 79,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					156
				},
				{
					1,
					2390000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3798
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					215003
				},
				{
					"atk",
					17995
				}
			}
		},
		{
			id = 7,
			lev = 80,
			exp = 10,
			total_exp = 90,
			loss = {
				{
					17006,
					158
				},
				{
					1,
					2420000
				}
			},
			exp_attr = {
				{
					"hp_max",
					85
				},
				{
					"atk",
					8
				}
			},
			show_attr = {
				{
					"hp_max",
					3799
				},
				{
					"atk",
					310
				}
			},
			attr = {
				{
					"hp_max",
					219566
				},
				{
					"atk",
					18377
				}
			}
		},
		{
			id = 7,
			lev = 81,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					160
				},
				{
					1,
					2450000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					224130
				},
				{
					"atk",
					18759
				}
			}
		},
		{
			id = 7,
			lev = 82,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					162
				},
				{
					1,
					2480000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					229201
				},
				{
					"atk",
					19184
				}
			}
		},
		{
			id = 7,
			lev = 83,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					164
				},
				{
					1,
					2510000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					234272
				},
				{
					"atk",
					19608
				}
			}
		},
		{
			id = 7,
			lev = 84,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					166
				},
				{
					1,
					2540000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					239343
				},
				{
					"atk",
					20033
				}
			}
		},
		{
			id = 7,
			lev = 85,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					168
				},
				{
					1,
					2570000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4170
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					244414
				},
				{
					"atk",
					20457
				}
			}
		},
		{
			id = 7,
			lev = 86,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					170
				},
				{
					1,
					2600000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					249484
				},
				{
					"atk",
					20881
				}
			}
		},
		{
			id = 7,
			lev = 87,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					172
				},
				{
					1,
					2630000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					254555
				},
				{
					"atk",
					21306
				}
			}
		},
		{
			id = 7,
			lev = 88,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					174
				},
				{
					1,
					2660000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					259626
				},
				{
					"atk",
					21730
				}
			}
		},
		{
			id = 7,
			lev = 89,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					176
				},
				{
					1,
					2690000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					334
				}
			},
			attr = {
				{
					"hp_max",
					264697
				},
				{
					"atk",
					22155
				}
			}
		},
		{
			id = 7,
			lev = 90,
			exp = 10,
			total_exp = 100,
			loss = {
				{
					17006,
					178
				},
				{
					1,
					2720000
				}
			},
			exp_attr = {
				{
					"hp_max",
					90
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4171
				},
				{
					"atk",
					335
				}
			},
			attr = {
				{
					"hp_max",
					269768
				},
				{
					"atk",
					22579
				}
			}
		},
		{
			id = 7,
			lev = 91,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					180
				},
				{
					1,
					2750000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					274839
				},
				{
					"atk",
					23004
				}
			}
		},
		{
			id = 7,
			lev = 92,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					182
				},
				{
					1,
					2780000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					280924
				},
				{
					"atk",
					23513
				}
			}
		},
		{
			id = 7,
			lev = 93,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					184
				},
				{
					1,
					2810000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					287009
				},
				{
					"atk",
					24022
				}
			}
		},
		{
			id = 7,
			lev = 94,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					186
				},
				{
					1,
					2840000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					293094
				},
				{
					"atk",
					24532
				}
			}
		},
		{
			id = 7,
			lev = 95,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					188
				},
				{
					1,
					2870000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					299179
				},
				{
					"atk",
					25041
				}
			}
		},
		{
			id = 7,
			lev = 96,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					190
				},
				{
					1,
					2900000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					305264
				},
				{
					"atk",
					25550
				}
			}
		},
		{
			id = 7,
			lev = 97,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					192
				},
				{
					1,
					2930000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					311349
				},
				{
					"atk",
					26060
				}
			}
		},
		{
			id = 7,
			lev = 98,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					194
				},
				{
					1,
					2960000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					401
				}
			},
			attr = {
				{
					"hp_max",
					317434
				},
				{
					"atk",
					26569
				}
			}
		},
		{
			id = 7,
			lev = 99,
			exp = 10,
			total_exp = 120,
			loss = {
				{
					17006,
					196
				},
				{
					1,
					2990000
				}
			},
			exp_attr = {
				{
					"hp_max",
					95
				},
				{
					"atk",
					9
				}
			},
			show_attr = {
				{
					"hp_max",
					4945
				},
				{
					"atk",
					402
				}
			},
			attr = {
				{
					"hp_max",
					323519
				},
				{
					"atk",
					27078
				}
			}
		},
		{
			id = 7,
			lev = 100,
			exp = 0,
			total_exp = 0,
			loss = {
				{
					17006,
					198
				},
				{
					1,
					3020000
				}
			},
			exp_attr = {},
			show_attr = {},
			attr = {
				{
					"hp_max",
					329604
				},
				{
					"atk",
					27588
				}
			}
		}
	}
}
Config.HalidomData.data_step_length = 7
Config.HalidomData.data_step = {
	{
		[0] = {
			skill_icon = 0,
			id = 1,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 10001,
			id = 1,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					4,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 10002,
			id = 1,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					4,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 10003,
			id = 1,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 10004,
			id = 1,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 10005,
			id = 1,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 10006,
			id = 1,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 10007,
			id = 1,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 10008,
			id = 1,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 10009,
			id = 1,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 10010,
			id = 1,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					1,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	},
	{
		[0] = {
			skill_icon = 0,
			id = 2,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 20001,
			id = 2,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					4,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 20002,
			id = 2,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					4,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 20003,
			id = 2,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 20004,
			id = 2,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 20005,
			id = 2,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 20006,
			id = 2,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 20007,
			id = 2,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 20008,
			id = 2,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 20009,
			id = 2,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 20010,
			id = 2,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					2,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	},
	{
		[0] = {
			skill_icon = 0,
			id = 3,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 30001,
			id = 3,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					4,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 30002,
			id = 3,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					4,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 30003,
			id = 3,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 30004,
			id = 3,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 30005,
			id = 3,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 30006,
			id = 3,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 30007,
			id = 3,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 30008,
			id = 3,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 30009,
			id = 3,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 30010,
			id = 3,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					3,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	},
	{
		[0] = {
			skill_icon = 0,
			id = 4,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 40001,
			id = 4,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					4,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 40002,
			id = 4,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					4,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 40003,
			id = 4,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 40004,
			id = 4,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 40005,
			id = 4,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 40006,
			id = 4,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 40007,
			id = 4,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 40008,
			id = 4,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 40009,
			id = 4,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 40010,
			id = 4,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					4,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	},
	{
		[0] = {
			skill_icon = 0,
			id = 5,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 50001,
			id = 5,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					4,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 50002,
			id = 5,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					4,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 50003,
			id = 5,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 50004,
			id = 5,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 50005,
			id = 5,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 50006,
			id = 5,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 50007,
			id = 5,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 50008,
			id = 5,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 50009,
			id = 5,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 50010,
			id = 5,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					5,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	},
	{
		[0] = {
			skill_icon = 0,
			id = 6,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 60001,
			id = 6,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 60002,
			id = 6,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 60003,
			id = 6,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 60004,
			id = 6,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 60005,
			id = 6,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 60006,
			id = 6,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 60007,
			id = 6,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 60008,
			id = 6,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 60009,
			id = 6,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 60010,
			id = 6,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	},
	{
		[0] = {
			skill_icon = 0,
			id = 7,
			step = 0,
			conds = {},
			loss_fixed = {},
			loss_rand = {},
			loss_items = {},
			dynamic_attr = {},
			fixed_attr = {}
		},
		{
			skill_icon = 60001,
			id = 7,
			step = 1,
			conds = {
				{
					"lev",
					10
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					50
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					50
				},
				{
					"atk_per",
					50
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 60002,
			id = 7,
			step = 2,
			conds = {
				{
					"lev",
					20
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					100
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					100
				},
				{
					"atk_per",
					100
				}
			},
			fixed_attr = {}
		},
		{
			skill_icon = 60003,
			id = 7,
			step = 3,
			conds = {
				{
					"lev",
					30
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					1
				}
			},
			loss_items = {
				{
					17011,
					200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					150
				},
				{
					"atk_per",
					150
				}
			},
			fixed_attr = {
				{
					"speed",
					5
				}
			}
		},
		{
			skill_icon = 60004,
			id = 7,
			step = 4,
			conds = {
				{
					"lev",
					40
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					2
				}
			},
			loss_items = {
				{
					17011,
					400
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					200
				},
				{
					"atk_per",
					200
				}
			},
			fixed_attr = {
				{
					"speed",
					10
				}
			}
		},
		{
			skill_icon = 60005,
			id = 7,
			step = 5,
			conds = {
				{
					"lev",
					50
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					5,
					3
				}
			},
			loss_items = {
				{
					17011,
					600
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					250
				},
				{
					"atk_per",
					250
				}
			},
			fixed_attr = {
				{
					"speed",
					15
				}
			}
		},
		{
			skill_icon = 60006,
			id = 7,
			step = 6,
			conds = {
				{
					"lev",
					60
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					6,
					1
				}
			},
			loss_items = {
				{
					17011,
					900
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					300
				},
				{
					"atk_per",
					300
				}
			},
			fixed_attr = {
				{
					"speed",
					20
				}
			}
		},
		{
			skill_icon = 60007,
			id = 7,
			step = 7,
			conds = {
				{
					"lev",
					70
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					7,
					1
				}
			},
			loss_items = {
				{
					17011,
					1200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					350
				},
				{
					"atk_per",
					350
				}
			},
			fixed_attr = {
				{
					"speed",
					30
				}
			}
		},
		{
			skill_icon = 60008,
			id = 7,
			step = 8,
			conds = {
				{
					"lev",
					80
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					8,
					1
				}
			},
			loss_items = {
				{
					17011,
					1500
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					400
				},
				{
					"atk_per",
					400
				}
			},
			fixed_attr = {
				{
					"speed",
					40
				}
			}
		},
		{
			skill_icon = 60009,
			id = 7,
			step = 9,
			conds = {
				{
					"lev",
					90
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					9,
					1
				}
			},
			loss_items = {
				{
					17011,
					1800
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					500
				},
				{
					"atk_per",
					500
				}
			},
			fixed_attr = {
				{
					"speed",
					55
				}
			}
		},
		{
			skill_icon = 60010,
			id = 7,
			step = 10,
			conds = {
				{
					"lev",
					100
				}
			},
			loss_fixed = {},
			loss_rand = {
				{
					7,
					10,
					1
				}
			},
			loss_items = {
				{
					17011,
					2200
				}
			},
			dynamic_attr = {
				{
					"hp_max_per",
					600
				},
				{
					"atk_per",
					600
				}
			},
			fixed_attr = {
				{
					"speed",
					75
				}
			}
		}
	}
}
Config.HalidomData.data_skill_length = 60
Config.HalidomData.data_skill = {
	[10001] = {
		name = "超新星之力",
		lev = 1,
		res_id = 26101,
		id = 10001,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10002] = {
		name = "超新星之力",
		lev = 2,
		res_id = 26101,
		id = 10002,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10003] = {
		name = "超新星之力",
		lev = 3,
		res_id = 26102,
		id = 10003,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10004] = {
		name = "超新星之力",
		lev = 4,
		res_id = 26102,
		id = 10004,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10005] = {
		name = "超新星之力",
		lev = 5,
		res_id = 26103,
		id = 10005,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10006] = {
		name = "超新星之力",
		lev = 6,
		res_id = 26103,
		id = 10006,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10007] = {
		name = "超新星之力",
		lev = 7,
		res_id = 26104,
		id = 10007,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10008] = {
		name = "超新星之力",
		lev = 8,
		res_id = 26104,
		id = 10008,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10009] = {
		name = "超新星之力",
		lev = 9,
		res_id = 26105,
		id = 10009,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[10010] = {
		name = "超新星之力",
		lev = 10,
		res_id = 26105,
		id = 10010,
		desc = "超新星之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n超新星之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20001] = {
		name = "自由草帽",
		lev = 1,
		res_id = 26201,
		id = 20001,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20002] = {
		name = "自由草帽",
		lev = 2,
		res_id = 26201,
		id = 20002,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20003] = {
		name = "自由草帽",
		lev = 3,
		res_id = 26202,
		id = 20003,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20004] = {
		name = "自由草帽",
		lev = 4,
		res_id = 26202,
		id = 20004,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20005] = {
		name = "自由草帽",
		lev = 5,
		res_id = 26203,
		id = 20005,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20006] = {
		name = "自由草帽",
		lev = 6,
		res_id = 26203,
		id = 20006,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20007] = {
		name = "自由草帽",
		lev = 7,
		res_id = 26204,
		id = 20007,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20008] = {
		name = "自由草帽",
		lev = 8,
		res_id = 26204,
		id = 20008,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20009] = {
		name = "自由草帽",
		lev = 9,
		res_id = 26205,
		id = 20009,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[20010] = {
		name = "自由草帽",
		lev = 10,
		res_id = 26205,
		id = 20010,
		desc = "自由草帽的生命属性额外提升<div fontcolor=#d95014>5%</div>\n自由草帽的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30001] = {
		name = "强者之怒",
		lev = 1,
		res_id = 26301,
		id = 30001,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30002] = {
		name = "强者之怒",
		lev = 2,
		res_id = 26301,
		id = 30002,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30003] = {
		name = "强者之怒",
		lev = 3,
		res_id = 26302,
		id = 30003,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30004] = {
		name = "强者之怒",
		lev = 4,
		res_id = 26302,
		id = 30004,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30005] = {
		name = "强者之怒",
		lev = 5,
		res_id = 26303,
		id = 30005,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30006] = {
		name = "强者之怒",
		lev = 6,
		res_id = 26303,
		id = 30006,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30007] = {
		name = "强者之怒",
		lev = 7,
		res_id = 26304,
		id = 30007,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30008] = {
		name = "强者之怒",
		lev = 8,
		res_id = 26304,
		id = 30008,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30009] = {
		name = "强者之怒",
		lev = 9,
		res_id = 26305,
		id = 30009,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[30010] = {
		name = "强者之怒",
		lev = 10,
		res_id = 26305,
		id = 30010,
		desc = "强者之怒的生命属性额外提升<div fontcolor=#d95014>5%</div>\n强者之怒的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40001] = {
		name = "绝对正义",
		lev = 1,
		res_id = 26401,
		id = 40001,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40002] = {
		name = "绝对正义",
		lev = 2,
		res_id = 26401,
		id = 40002,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40003] = {
		name = "绝对正义",
		lev = 3,
		res_id = 26402,
		id = 40003,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40004] = {
		name = "绝对正义",
		lev = 4,
		res_id = 26402,
		id = 40004,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40005] = {
		name = "绝对正义",
		lev = 5,
		res_id = 26403,
		id = 40005,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40006] = {
		name = "绝对正义",
		lev = 6,
		res_id = 26403,
		id = 40006,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40007] = {
		name = "绝对正义",
		lev = 7,
		res_id = 26404,
		id = 40007,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40008] = {
		name = "绝对正义",
		lev = 8,
		res_id = 26404,
		id = 40008,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40009] = {
		name = "绝对正义",
		lev = 9,
		res_id = 26405,
		id = 40009,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[40010] = {
		name = "绝对正义",
		lev = 10,
		res_id = 26405,
		id = 40010,
		desc = "绝对正义的生命属性额外提升<div fontcolor=#d95014>5%</div>\n绝对正义的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50001] = {
		name = "首领之慑",
		lev = 1,
		res_id = 26501,
		id = 50001,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50002] = {
		name = "首领之慑",
		lev = 2,
		res_id = 26501,
		id = 50002,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50003] = {
		name = "首领之慑",
		lev = 3,
		res_id = 26502,
		id = 50003,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50004] = {
		name = "首领之慑",
		lev = 4,
		res_id = 26502,
		id = 50004,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50005] = {
		name = "首领之慑",
		lev = 5,
		res_id = 26503,
		id = 50005,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50006] = {
		name = "首领之慑",
		lev = 6,
		res_id = 26503,
		id = 50006,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50007] = {
		name = "首领之慑",
		lev = 7,
		res_id = 26504,
		id = 50007,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50008] = {
		name = "首领之慑",
		lev = 8,
		res_id = 26504,
		id = 50008,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50009] = {
		name = "首领之慑",
		lev = 9,
		res_id = 26505,
		id = 50009,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[50010] = {
		name = "首领之慑",
		lev = 10,
		res_id = 26505,
		id = 50010,
		desc = "首领之慑的生命属性额外提升<div fontcolor=#d95014>5%</div>\n首领之慑的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[60001] = {
		name = "传奇之力",
		lev = 1,
		res_id = 26601,
		id = 60001,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>5%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>5%</div>"
	},
	[60002] = {
		name = "传奇之力",
		lev = 2,
		res_id = 26601,
		id = 60002,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>10%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>10%</div>"
	},
	[60003] = {
		name = "传奇之力",
		lev = 3,
		res_id = 26602,
		id = 60003,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>15%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>15%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+5</div>"
	},
	[60004] = {
		name = "传奇之力",
		lev = 4,
		res_id = 26602,
		id = 60004,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>20%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>20%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+10</div>"
	},
	[60005] = {
		name = "传奇之力",
		lev = 5,
		res_id = 26603,
		id = 60005,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>25%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>25%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+15</div>"
	},
	[60006] = {
		name = "传奇之力",
		lev = 6,
		res_id = 26603,
		id = 60006,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>30%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>30%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+20</div>"
	},
	[60007] = {
		name = "传奇之力",
		lev = 7,
		res_id = 26604,
		id = 60007,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>35%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>35%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+30</div>"
	},
	[60008] = {
		name = "传奇之力",
		lev = 8,
		res_id = 26604,
		id = 60008,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>40%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>40%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+40</div>"
	},
	[60009] = {
		name = "传奇之力",
		lev = 9,
		res_id = 26605,
		id = 60009,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>50%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>50%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+55</div>"
	},
	[60010] = {
		name = "传奇之力",
		lev = 10,
		res_id = 26605,
		id = 60010,
		desc = "传奇之力的生命属性额外提升<div fontcolor=#d95014>60%</div>\n传奇之力的攻击属性额外提升<div fontcolor=#d95014>60%</div>\n传奇之力的速度属性<div fontcolor=#d95014>+75</div>"
	}
}

function Config.HalidomData.data_skill_fun(slot0)
	slot1 = Config.HalidomData.data_skill[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.HalidomData.data_skill[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
