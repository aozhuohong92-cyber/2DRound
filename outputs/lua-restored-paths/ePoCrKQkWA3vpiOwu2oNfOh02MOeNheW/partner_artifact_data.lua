Config = Config or {}
Config.PartnerArtifactData = Config.PartnerArtifactData or {}
Config.PartnerArtifactData.data_artifact_const_length = 37
Config.PartnerArtifactData.data_artifact_const = {
	recast_purple = {
		val = 10430,
		desc = "紫色重铸石"
	},
	recast_yellow = {
		val = 10431,
		desc = "橙色重铸石"
	},
	skill_score_1 = {
		val = 600,
		desc = "低级技能评分"
	},
	skill_score_2 = {
		val = 1200,
		desc = "中级技能评分"
	},
	skill_score_3 = {
		val = 1800,
		desc = "高级技能评分"
	},
	skill_score_4 = {
		val = 5000,
		desc = "超级技能评分"
	},
	skill_score_5 = {
		val = 3000,
		desc = "神级技能评分"
	},
	artifact_rule = {
		val = 1,
		desc = [[
1.合成时只能使用同类战技，不同类的战技无法进行合成
2.越高阶的战技合成，需要冒险者达到的等级越高
3.每次合成至少需要2个同类战技
4.战技合成有几率失败，失败后参与合成的战技将被分解成强化训练
5.强化训练可用于战技重铸
6.每次合成放入的战技数量越多，合成时的成功率越大
7.每次合成失败都会获得熔炼值，当熔炼值达到1000时可获得1个橙色战技，同时扣除对应熔炼值]]
	},
	change_condition = {
		val = 1000,
		desc = "熔炼值触发条件数值"
	},
	change_gift = {
		desc = "熔炼值奖励",
		val = {
			{
				10454,
				1
			}
		}
	},
	recast_rule = {
		val = 1,
		desc = [[
1.战技重铸后，属性、技能和技能数量都有几率发生改变
2.每次重铸都将消耗强化训练和铜币，战技品质越高，消耗的重铸石和铜币越多
3.重铸战技·上忍和战技·暗部时，同类战技重铸次数达到指定次数，必定出现稀有高级技能
4.分解战技可获得强化训练
5.同类型的技能效果无法叠加，只按最高级别的生效]]
	},
	recastskill_rule = {
		val = 1,
		desc = [[
1.此处列出了战技可能获得的所有技能类型
2.战技品质越高，拥有的技能等级和数量越高
3.可在背包中对战技进行重铸，进而更换战技的属性和技能
4.同类型的技能效果无法叠加，只按最高级别的生效]]
	},
	main_shenqi = {
		val = 10451,
		desc = "战技获取更多ID"
	},
	recast_tag = {
		desc = "重铸界面【技能查看】中携带【稀有】标签的技能",
		val = {
			700075,
			750202,
			750002
		}
	},
	recast_power_tag = {
		desc = "重铸界面【技能查看】中携带【强力】标签的技能",
		val = {
			700005,
			700015,
			700045,
			700055,
			700175,
			700205,
			700235,
			700245,
			700265,
			700275,
			700315,
			700325,
			750102,
			750402,
			700285,
			700365,
			700395,
			700405,
			700415,
			700425,
			700455
		}
	},
	super_recast_tag = {
		desc = "重铸界面【技能查看】中携带【超稀有】标签的技能",
		val = {
			700076,
			750203,
			750003
		}
	},
	super_recast_power_tag = {
		desc = "重铸界面【技能查看】中携带【超强力】标签的技能",
		val = {
			700006,
			700016,
			700046,
			700056,
			700176,
			700206,
			700236,
			700246,
			700266,
			700276,
			700316,
			700326,
			750103,
			750403,
			700286,
			700366,
			700396,
			700406,
			700416,
			700426,
			700456
		}
	},
	lucky_item_id2 = {
		val = 10490,
		desc = "高级幸运宝珠道具id"
	},
	lucky_artifact_ids2 = {
		desc = "允许幸运重铸的战技id和消耗道具数量",
		val = {
			{
				10455,
				1
			},
			{
				10456,
				2
			},
			{
				10457,
				3
			}
		}
	},
	lucky_item_id = {
		val = 10470,
		desc = "幸运宝珠道具id"
	},
	lucky_artifact_ids = {
		desc = "允许幸运重铸的战技id和消耗道具数量",
		val = {
			{
				10455,
				1
			},
			{
				10456,
				2
			},
			{
				10457,
				3
			}
		}
	},
	lucky_artifact_skillids = {
		desc = "幸运重铸加成的技能列表（使用好运宝珠）",
		val = {
			700005,
			700015,
			700045,
			700055,
			700075,
			700175,
			700205,
			700235,
			700245,
			700265,
			700275,
			700315,
			700325,
			750002,
			750102,
			750202,
			750402,
			700285,
			700365,
			700395,
			700405,
			700415,
			700425,
			700455
		}
	},
	lucky_artifact_add_pro = {
		val = 1500,
		desc = "幸运重铸增加概率千分比（使用好运宝珠）"
	},
	lucky_artifact_skillids2 = {
		desc = "幸运重铸加成的技能列表（使用好运宝珠）",
		val = {
			700076,
			750203,
			750003,
			700006,
			700016,
			700046,
			700056,
			700176,
			700206,
			700236,
			700246,
			700266,
			700276,
			700316,
			700326,
			750103,
			750403,
			700286,
			700366,
			700396,
			700406,
			700416,
			700426,
			700456
		}
	},
	lucky_artifact_add_pro2 = {
		val = 1500,
		desc = "幸运重铸增加概率千分比（使用好运宝珠）"
	},
	lucky_artifact_desc = {
		val = 1,
		desc = "1.勾选后触发幸运重铸，选择消耗<div fontcolor=#d95014>好运宝珠</div>，<div fontcolor=#d95014>强力和稀有技能</div>重铸出现概率提升50%\n2.选择消耗<div fontcolor=#d95014>高级好运宝珠</div>，本次重铸必定出现<div fontcolor=#d95014>双高级技能</div>\n3.每重铸一定次数必定出现稀有技能，此时幸运重铸<div fontcolor=#d95014>不可勾选</div>"
	},
	lucky_artifact_desc2 = {
		val = 1,
		desc = "1.勾选后触发幸运重铸，选择消耗<div fontcolor=#d95014>好运宝珠</div>，<div fontcolor=#d95014>超强力和超稀有技能</div>重铸出现概率提升50%\n2.选择消耗<div fontcolor=#d95014>高级好运宝珠</div>，本次重铸必定出现<div fontcolor=#d95014>双超级技能</div>\n3.每重铸一定次数必定出现超稀有技能，此时幸运重铸<div fontcolor=#d95014>不可勾选</div>"
	},
	backpack_tips_count = {
		val = 200,
		desc = "战技合成提示的所需战技在背包中数量条件"
	},
	flash_skill_random_id = {
		val = 8,
		desc = "战技·传说之忍自选技能库id"
	},
	starshine_skill_random_id = {
		val = 6,
		desc = "战技·影级自选技能库id"
	},
	twinkle_skill_random_id = {
		val = 6,
		desc = "战技·暗部自选技能库id"
	},
	rainbow_skill_random_id = {
		val = 6,
		desc = "战技·上忍自选技能库id"
	},
	flash_skill_random_id2 = {
		val = 10,
		desc = "战技·传说之忍自选随机技能库id"
	},
	starshine_skill_random_id2 = {
		val = 9,
		desc = "战技·影级自选随机技能库id"
	},
	twinkle_skill_random_id2 = {
		val = 9,
		desc = "战技·暗部自选随机技能库id"
	},
	rainbow_skill_random_id2 = {
		val = 9,
		desc = "战技·上忍自选随机技能库id"
	},
	optional_artifact_ids = {
		desc = "战技·上忍,战技·暗部,战技·影级,战技·传说之忍",
		val = {
			10453,
			10454,
			10455,
			10456,
			10457
		}
	}
}

function Config.PartnerArtifactData.data_artifact_const_fun(slot0)
	slot1 = Config.PartnerArtifactData.data_artifact_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerArtifactData.data_artifact_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerArtifactData.data_artifact_data_length = 7
Config.PartnerArtifactData.data_artifact_data = {
	[10451] = {
		skill_num = 0,
		limit_lv = 0,
		arrt_desc = "",
		next_skill_star = 0,
		attr_num = 1,
		limit_num = 0,
		next_attr_star = 0,
		skill_desc = "",
		id = 10451,
		com_artifact = 10452,
		star = 0,
		ref_expend = {
			{
				10450,
				30
			},
			{
				1,
				20000
			}
		}
	},
	[10452] = {
		skill_num = 1,
		limit_lv = 30,
		arrt_desc = "[攻击]、[生命]、[防御]、[速度]\n从以上基础属性中随机获得1种",
		next_skill_star = 0,
		attr_num = 1,
		limit_num = 2,
		next_attr_star = 0,
		skill_desc = "1.[低级技能]\n \n随机获得1种低级被动技能",
		id = 10452,
		com_artifact = 10453,
		star = 0,
		ref_expend = {
			{
				10450,
				150
			},
			{
				1,
				100000
			}
		}
	},
	[10453] = {
		skill_num = 2,
		limit_lv = 40,
		arrt_desc = "[攻击]、[生命]、[防御]、[速度]\n从以上基础属性中随机获得1种",
		next_skill_star = 0,
		attr_num = 1,
		limit_num = 2,
		next_attr_star = 0,
		skill_desc = [[
1.[低级技能]+[低级技能]
2.[低级技能]+[中级技能]
3.[中级技能]
 
随机获得以上被动技能组合中的1种]],
		id = 10453,
		com_artifact = 10454,
		star = 0,
		ref_expend = {
			{
				10450,
				500
			},
			{
				1,
				250000
			}
		}
	},
	[10454] = {
		skill_num = 2,
		limit_lv = 50,
		arrt_desc = "[攻击]、[生命]、[防御]、[速度]\n从以上基础属性中随机获得1种",
		next_skill_star = 0,
		attr_num = 1,
		limit_num = 2,
		next_attr_star = 0,
		skill_desc = [[
1.[高级技能]+[中级技能]
2.[高级技能]+[低级技能]
3.[中级技能]+[中级技能]
4.[高级技能]
 
随机获得以上被动技能组合中的1种]],
		id = 10454,
		com_artifact = 10455,
		star = 0,
		ref_expend = {
			{
				10450,
				1500
			},
			{
				1,
				750000
			}
		}
	},
	[10455] = {
		skill_num = 2,
		limit_lv = 60,
		arrt_desc = "[攻击]、[生命]、[防御]、[速度]\n以上任意1种属性+任意1种百分比属性",
		next_skill_star = 0,
		attr_num = 2,
		limit_num = 2,
		next_attr_star = 0,
		skill_desc = [[
1.[高级技能]+[高级技能]
2.[高级技能]+[中级技能]
 
随机获得以上被动技能组合中的1种]],
		id = 10455,
		com_artifact = 10456,
		star = 0,
		ref_expend = {
			{
				10450,
				3750
			},
			{
				1,
				1500000
			}
		}
	},
	[10456] = {
		skill_num = 2,
		limit_lv = 60,
		arrt_desc = "[攻击]、[生命]、[防御]、[速度]\n以上任意1种属性+任意2种百分比属性",
		next_skill_star = 0,
		attr_num = 2,
		limit_num = 2,
		next_attr_star = 0,
		skill_desc = [[
1.[超级技能]+[高级技能]
2.[高级技能]+[中级技能]
 
随机获得以上被动技能组合中的1种]],
		id = 10456,
		com_artifact = 10457,
		star = 0,
		ref_expend = {
			{
				10450,
				5000
			},
			{
				1,
				2000000
			}
		}
	},
	[10457] = {
		skill_num = 3,
		limit_lv = 60,
		arrt_desc = "[攻击]、[生命]、[防御]、[速度]\n以上任意1种属性+任意2种百分比属性",
		next_skill_star = 0,
		attr_num = 3,
		limit_num = 5,
		next_attr_star = 0,
		skill_desc = "1.[超级技能]+[超级技能]\n2.[超级技能]+[高级技能]\n随机获得以上被动技能组合中的1种",
		id = 10457,
		com_artifact = 0,
		star = 0,
		ref_expend = {
			{
				10450,
				8000
			},
			{
				1,
				3000000
			}
		}
	}
}

function Config.PartnerArtifactData.data_artifact_data_fun(slot0)
	slot1 = Config.PartnerArtifactData.data_artifact_data[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerArtifactData.data_artifact_data[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerArtifactData.data_artifact_attr_length = 7
Config.PartnerArtifactData.data_artifact_attr = {
	[10451] = {
		crit_ratio = 20,
		def = 21,
		hp_max = 1476,
		hp_max_per = 10,
		atk_per = 5,
		atk = 146,
		dam = 10,
		speed = 10,
		res = 10,
		crit_rate = 10,
		def_per = 10,
		tenacity = 10
	},
	[10452] = {
		crit_ratio = 40,
		def = 43,
		hp_max = 2953,
		hp_max_per = 20,
		atk_per = 10,
		atk = 293,
		dam = 20,
		speed = 20,
		res = 20,
		crit_rate = 20,
		def_per = 20,
		tenacity = 20
	},
	[10453] = {
		crit_ratio = 60,
		def = 87,
		hp_max = 5907,
		hp_max_per = 30,
		atk_per = 15,
		atk = 587,
		dam = 30,
		speed = 30,
		res = 30,
		crit_rate = 30,
		def_per = 30,
		tenacity = 30
	},
	[10454] = {
		crit_ratio = 80,
		def = 175,
		hp_max = 11815,
		hp_max_per = 40,
		atk_per = 20,
		atk = 1174,
		dam = 40,
		speed = 40,
		res = 40,
		crit_rate = 40,
		def_per = 40,
		tenacity = 40
	},
	[10455] = {
		crit_ratio = 100,
		def = 351,
		hp_max = 23631,
		hp_max_per = 50,
		atk_per = 30,
		atk = 2349,
		dam = 50,
		speed = 50,
		res = 50,
		crit_rate = 50,
		def_per = 50,
		tenacity = 50
	},
	[10456] = {
		crit_ratio = 120,
		def = 527,
		hp_max = 35447,
		hp_max_per = 60,
		atk_per = 40,
		atk = 3524,
		dam = 60,
		speed = 60,
		res = 60,
		crit_rate = 60,
		def_per = 60,
		tenacity = 60
	},
	[10457] = {
		crit_ratio = 150,
		def = 777,
		hp_max = 53800,
		hp_max_per = 75,
		atk_per = 55,
		atk = 4960,
		dam = 70,
		speed = 70,
		res = 70,
		crit_rate = 70,
		def_per = 75,
		tenacity = 70
	}
}
Config.PartnerArtifactData.data_artifact_attr_score_length = 7
Config.PartnerArtifactData.data_artifact_attr_score = {
	[10451] = {
		crit_ratio = 140,
		def = 55,
		hp_max = 59,
		hp_max_per = 35,
		atk_per = 30,
		atk = 58,
		dam = 36,
		speed = 128,
		res = 36,
		crit_rate = 120,
		def_per = 33,
		tenacity = 80
	},
	[10452] = {
		crit_ratio = 280,
		def = 114,
		hp_max = 118,
		hp_max_per = 70,
		atk_per = 60,
		atk = 117,
		dam = 72,
		speed = 256,
		res = 72,
		crit_rate = 240,
		def_per = 66,
		tenacity = 160
	},
	[10453] = {
		crit_ratio = 420,
		def = 231,
		hp_max = 236,
		hp_max_per = 150,
		atk_per = 120,
		atk = 234,
		dam = 144,
		speed = 384,
		res = 144,
		crit_rate = 360,
		def_per = 132,
		tenacity = 240
	},
	[10454] = {
		crit_ratio = 560,
		def = 465,
		hp_max = 472,
		hp_max_per = 450,
		atk_per = 400,
		atk = 469,
		dam = 480,
		speed = 512,
		res = 480,
		crit_rate = 480,
		def_per = 440,
		tenacity = 320
	},
	[10455] = {
		crit_ratio = 700,
		def = 933,
		hp_max = 945,
		hp_max_per = 650,
		atk_per = 600,
		atk = 939,
		dam = 720,
		speed = 640,
		res = 720,
		crit_rate = 600,
		def_per = 660,
		tenacity = 400
	},
	[10456] = {
		crit_ratio = 840,
		def = 1401,
		hp_max = 1418,
		hp_max_per = 850,
		atk_per = 800,
		atk = 1409,
		dam = 960,
		speed = 768,
		res = 960,
		crit_rate = 720,
		def_per = 880,
		tenacity = 840
	},
	[10457] = {
		crit_ratio = 1150,
		def = 2000,
		hp_max = 2000,
		hp_max_per = 1190,
		atk_per = 1180,
		atk = 2000,
		dam = 1360,
		speed = 1000,
		res = 1350,
		crit_rate = 1000,
		def_per = 1190,
		tenacity = 1240
	}
}
Config.PartnerArtifactData.data_artifact_compound_length = 6
Config.PartnerArtifactData.data_artifact_compound = {
	[10452] = {
		[2] = {
			id = 10452,
			cost_num = 2,
			rate = 200,
			add_num = 4,
			materials = {
				10451
			},
			award = {
				{
					10450,
					60
				}
			},
			other_expend = {
				{
					1,
					20000
				}
			}
		},
		[3] = {
			id = 10452,
			cost_num = 3,
			rate = 400,
			add_num = 6,
			materials = {
				10451
			},
			award = {
				{
					10450,
					90
				}
			},
			other_expend = {
				{
					1,
					40000
				}
			}
		},
		[4] = {
			id = 10452,
			cost_num = 4,
			rate = 700,
			add_num = 8,
			materials = {
				10451
			},
			award = {
				{
					10450,
					120
				}
			},
			other_expend = {
				{
					1,
					60000
				}
			}
		},
		[5] = {
			id = 10452,
			cost_num = 5,
			rate = 1000,
			add_num = 10,
			materials = {
				10451
			},
			award = {
				{
					10450,
					150
				}
			},
			other_expend = {
				{
					1,
					80000
				}
			}
		}
	},
	[10453] = {
		[2] = {
			id = 10453,
			cost_num = 2,
			rate = 200,
			add_num = 20,
			materials = {
				10452
			},
			award = {
				{
					10450,
					300
				}
			},
			other_expend = {
				{
					1,
					100000
				}
			}
		},
		[3] = {
			id = 10453,
			cost_num = 3,
			rate = 400,
			add_num = 30,
			materials = {
				10452
			},
			award = {
				{
					10450,
					450
				}
			},
			other_expend = {
				{
					1,
					200000
				}
			}
		},
		[4] = {
			id = 10453,
			cost_num = 4,
			rate = 700,
			add_num = 40,
			materials = {
				10452
			},
			award = {
				{
					10450,
					600
				}
			},
			other_expend = {
				{
					1,
					300000
				}
			}
		},
		[5] = {
			id = 10453,
			cost_num = 5,
			rate = 1000,
			add_num = 50,
			materials = {
				10452
			},
			award = {
				{
					10450,
					750
				}
			},
			other_expend = {
				{
					1,
					400000
				}
			}
		}
	},
	[10454] = {
		[2] = {
			id = 10454,
			cost_num = 2,
			rate = 200,
			add_num = 100,
			materials = {
				10453
			},
			award = {
				{
					10450,
					1500
				}
			},
			other_expend = {
				{
					1,
					300000
				}
			}
		},
		[3] = {
			id = 10454,
			cost_num = 3,
			rate = 400,
			add_num = 150,
			materials = {
				10453
			},
			award = {
				{
					10450,
					2250
				}
			},
			other_expend = {
				{
					1,
					600000
				}
			}
		},
		[4] = {
			id = 10454,
			cost_num = 4,
			rate = 700,
			add_num = 200,
			materials = {
				10453
			},
			award = {
				{
					10450,
					3000
				}
			},
			other_expend = {
				{
					1,
					900000
				}
			}
		},
		[5] = {
			id = 10454,
			cost_num = 5,
			rate = 1000,
			add_num = 250,
			materials = {
				10453
			},
			award = {
				{
					10450,
					3750
				}
			},
			other_expend = {
				{
					1,
					1200000
				}
			}
		}
	},
	[10455] = {
		[2] = {
			id = 10455,
			cost_num = 2,
			rate = 200,
			add_num = 500,
			materials = {
				10454
			},
			award = {
				{
					10450,
					7500
				}
			},
			other_expend = {
				{
					1,
					500000
				}
			}
		},
		[3] = {
			id = 10455,
			cost_num = 3,
			rate = 400,
			add_num = 750,
			materials = {
				10454
			},
			award = {
				{
					10450,
					11250
				}
			},
			other_expend = {
				{
					1,
					1000000
				}
			}
		},
		[4] = {
			id = 10455,
			cost_num = 4,
			rate = 700,
			add_num = 1000,
			materials = {
				10454
			},
			award = {
				{
					10450,
					15000
				}
			},
			other_expend = {
				{
					1,
					1500000
				}
			}
		},
		[5] = {
			id = 10455,
			cost_num = 5,
			rate = 1000,
			add_num = 1250,
			materials = {
				10454
			},
			award = {
				{
					10450,
					18750
				}
			},
			other_expend = {
				{
					1,
					2000000
				}
			}
		}
	},
	[10456] = {
		[2] = {
			id = 10456,
			cost_num = 2,
			rate = 200,
			add_num = 700,
			materials = {
				10455
			},
			award = {
				{
					10450,
					7500
				}
			},
			other_expend = {
				{
					1,
					2000000
				}
			}
		},
		[3] = {
			id = 10456,
			cost_num = 3,
			rate = 400,
			add_num = 800,
			materials = {
				10455
			},
			award = {
				{
					10450,
					11250
				}
			},
			other_expend = {
				{
					1,
					3000000
				}
			}
		},
		[4] = {
			id = 10456,
			cost_num = 4,
			rate = 700,
			add_num = 1500,
			materials = {
				10455
			},
			award = {
				{
					10450,
					15000
				}
			},
			other_expend = {
				{
					1,
					4000000
				}
			}
		},
		[5] = {
			id = 10456,
			cost_num = 5,
			rate = 1000,
			add_num = 2000,
			materials = {
				10455
			},
			award = {
				{
					10450,
					18750
				}
			},
			other_expend = {
				{
					1,
					5000000
				}
			}
		}
	},
	[10457] = {
		[2] = {
			id = 10457,
			cost_num = 2,
			rate = 200,
			add_num = 700,
			materials = {
				10456
			},
			award = {
				{
					10450,
					7500
				}
			},
			other_expend = {
				{
					1,
					2000000
				}
			}
		},
		[3] = {
			id = 10457,
			cost_num = 3,
			rate = 400,
			add_num = 800,
			materials = {
				10456
			},
			award = {
				{
					10450,
					11250
				}
			},
			other_expend = {
				{
					1,
					3000000
				}
			}
		},
		[4] = {
			id = 10457,
			cost_num = 4,
			rate = 700,
			add_num = 1500,
			materials = {
				10456
			},
			award = {
				{
					10450,
					15000
				}
			},
			other_expend = {
				{
					1,
					4000000
				}
			}
		},
		[5] = {
			id = 10457,
			cost_num = 5,
			rate = 1000,
			add_num = 2000,
			materials = {
				10456
			},
			award = {
				{
					10450,
					18750
				}
			},
			other_expend = {
				{
					1,
					5000000
				}
			}
		}
	}
}
Config.PartnerArtifactData.data_artifact_resolve_length = 7
Config.PartnerArtifactData.data_artifact_resolve = {
	[10451] = {
		{
			10450,
			60
		}
	},
	[10452] = {
		{
			10450,
			300
		}
	},
	[10453] = {
		{
			10450,
			1500
		}
	},
	[10454] = {
		{
			10450,
			7500
		}
	},
	[10455] = {
		{
			10450,
			37500
		}
	},
	[10456] = {
		{
			10450,
			57500
		}
	},
	[10457] = {
		{
			10450,
			57500
		},
		{
			10462,
			160
		},
		{
			10461,
			480
		}
	}
}

function Config.PartnerArtifactData.data_artifact_resolve_fun(slot0)
	slot1 = Config.PartnerArtifactData.data_artifact_resolve[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerArtifactData.data_artifact_resolve[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerArtifactData.data_artifact_skill_length = 4
Config.PartnerArtifactData.data_artifact_skill = {
	{
		700071,
		750200,
		750000,
		700001,
		700011,
		700021,
		700031,
		700041,
		700051,
		700061,
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
		750100,
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
		700073,
		750201,
		750001,
		700003,
		700013,
		700023,
		700033,
		700043,
		700053,
		700063,
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
		750101,
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
		700075,
		750202,
		750002,
		700005,
		700015,
		700025,
		700035,
		700045,
		700055,
		700065,
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
		750102,
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
		700076,
		750203,
		750003,
		700006,
		700016,
		700026,
		700036,
		700046,
		700056,
		700066,
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
		750103,
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
		700456,
		700466
	}
}

function Config.PartnerArtifactData.data_artifact_skill_fun(slot0)
	slot1 = Config.PartnerArtifactData.data_artifact_skill[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerArtifactData.data_artifact_skill[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
