Config = Config or {}
Config.PartnerExclusiveData = Config.PartnerExclusiveData or {}
Config.PartnerExclusiveData.data_const_length = 4
Config.PartnerExclusiveData.data_const = {
	exclusive_open_lev = {
		val = 110,
		desc = "玩家达到110，开启魂器"
	},
	exclusive_open_world_lev = {
		val = 100,
		desc = "世界等级达到100，开启魂器"
	},
	rule_desc = {
		val = 1,
		desc = [[
1.每个英雄的大海秘宝属性和强化等级相互独立
2.不断强化，可为英雄代练属性提升
3.强化到达一定等级时（10、20、30、35），更可额外获得英雄的技能强化或属性提升
4.大海秘宝30级后，继续强化需要英雄达到13星]]
	},
	exclusive_max_lev = {
		val = 35,
		desc = "魂器最高等级35级"
	}
}

function Config.PartnerExclusiveData.data_const_fun(slot0)
	slot1 = Config.PartnerExclusiveData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerExclusiveData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerExclusiveData.data_exclusive_info_length = 10
Config.PartnerExclusiveData.data_exclusive_info = {
	[310512] = {
		partner_name = "萨博（路西）",
		name = "亲情的水管",
		parnter_bid = 10512,
		exclusive_id = 310512,
		desc = "一个维修工人都不会随身携带的东西，却和萨博形影不离，这是他和艾斯、路飞亲情的见证"
	},
	[320512] = {
		partner_name = "罗宾",
		name = "花花果实",
		parnter_bid = 20512,
		exclusive_id = 320512,
		desc = "超人系的恶魔果实，能让罗宾身体的任何部位像开花一样，长在任何有形体的事物上，并作出攻击、窃听、偷窥等其他用途"
	},
	[330511] = {
		partner_name = "汉库克",
		name = "萨罗梅",
		parnter_bid = 30511,
		exclusive_id = 330511,
		desc = "汉库克随身宠物，一条水性极佳的无毒蟒蛇，同时也作为汉考克的近身护卫，亦可卷曲作为她的坐椅"
	},
	[330513] = {
		partner_name = "金鱼乙姬",
		name = "友好签名",
		parnter_bid = 30513,
		exclusive_id = 330513,
		desc = "乙姬带回的世界贵族同意鱼人族与人类成立友好关系的签名，是鱼人岛走向陆地的开始"
	},
	[340510] = {
		partner_name = "赤犬",
		name = "岩浆果实",
		parnter_bid = 40510,
		exclusive_id = 340510,
		desc = "强大的自然系恶魔果实，身体可以变成岩浆，同时可以通过身体制造岩浆，甚至可以燃烧火，能使物理攻击、大多数能量攻击以及非霸气攻击对其能力者身体无效，可以自由操控岩浆，燃尽一切"
	},
	[340512] = {
		partner_name = "泽法",
		name = "巨腕粉碎机",
		parnter_bid = 40512,
		exclusive_id = 340512,
		desc = "巨大铁臂粉碎机，拥有着击碎一切的力量，泽法用他无双的霸气以及巨腕粉碎机目标毁灭全世界海贼。"
	},
	[340509] = {
		partner_name = "麦哲伦",
		name = "毒毒果实",
		parnter_bid = 40509,
		exclusive_id = 340509,
		desc = "超人系的恶魔果实，能从身体任何一处制造毒液，可以使全身缠绕着威力无比强大的剧毒，可以从身体任何部位释放剧毒无比的毒液"
	},
	[350502] = {
		partner_name = "冥王雷利",
		name = "皇副之剑",
		parnter_bid = 50502,
		exclusive_id = 350502,
		desc = "平平无奇之剑，但在冥王雷利手中，配合自身的霸气，能够挥斩出不逊于名刀的剑气"
	},
	[350508] = {
		partner_name = "白胡子",
		name = "丛云切",
		parnter_bid = 50508,
		exclusive_id = 350508,
		desc = "世界最强的的男人—白胡子的专属佩刀，配合白胡子威震整片大海，无上大快刀十二工——丛云切"
	},
	[350509] = {
		partner_name = "路飞(新世界)",
		name = "橡胶果实",
		parnter_bid = 50509,
		exclusive_id = 350509,
		desc = "‘超人系—橡胶果实？’路飞凭借果实的能力能够将身体的任何部位，依自己的意思伸长和反弹，使看似普通的打击具有更强的威力"
	}
}

function Config.PartnerExclusiveData.data_exclusive_info_fun(slot0)
	slot1 = Config.PartnerExclusiveData.data_exclusive_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerExclusiveData.data_exclusive_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerExclusiveData.data_partner_exclusive_length = 10
Config.PartnerExclusiveData.data_partner_exclusive = {
	[10512] = {
		exclusive_id = 310512
	},
	[20512] = {
		exclusive_id = 320512
	},
	[30511] = {
		exclusive_id = 330511
	},
	[30513] = {
		exclusive_id = 330513
	},
	[40510] = {
		exclusive_id = 340510
	},
	[40512] = {
		exclusive_id = 340512
	},
	[40509] = {
		exclusive_id = 340509
	},
	[50502] = {
		exclusive_id = 350502
	},
	[50508] = {
		exclusive_id = 350508
	},
	[50509] = {
		exclusive_id = 350509
	}
}

function Config.PartnerExclusiveData.data_partner_exclusive_fun(slot0)
	slot1 = Config.PartnerExclusiveData.data_partner_exclusive[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerExclusiveData.data_partner_exclusive[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.PartnerExclusiveData.data_exclusive_skills_length = 10
Config.PartnerExclusiveData.data_exclusive_skills = {
	[350509] = {
		{
			active_lev = 10,
			desc = "【强化+10】【橡皮灰熊枪】Lv3附加缓伤的概率提升20%（至60%）",
			exclusive_id = 350509,
			strengthen_skill_id = 521104
		},
		{
			active_lev = 20,
			desc = "【强化+20】【四档形态】Lv3发动时额外增加20%物理免伤",
			exclusive_id = 350509,
			strengthen_skill_id = 521304
		},
		{
			active_lev = 30,
			desc = "【强化+30】【四档形态】Lv3触发时回复的生命系数提升10%（至30%）",
			exclusive_id = 350509,
			strengthen_skill_id = 521305
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身生命值上限10%",
			exclusive_id = 350509,
			strengthen_skill_id = 0
		}
	},
	[350508] = {
		{
			active_lev = 10,
			desc = "【强化+10】【丛云切】Lv3的技能伤害系数提升10%（至114%）",
			exclusive_id = 350508,
			strengthen_skill_id = 516104
		},
		{
			active_lev = 20,
			desc = "【强化+20】【丛云切】Lv3的技能伤害系数提升16%（至130%），且目标携带负面效果的增伤系数提升3%(至8%)",
			exclusive_id = 350508,
			strengthen_skill_id = 516105
		},
		{
			active_lev = 30,
			desc = "【强化+30】【果实觉醒】全体单位回复生命值提升10%（至130）",
			exclusive_id = 350508,
			strengthen_skill_id = 516404
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身暴击伤害15%",
			exclusive_id = 350508,
			strengthen_skill_id = 0
		}
	},
	[350502] = {
		{
			active_lev = 10,
			desc = "【强化+10】【传奇皇副】Lv3单位死亡时，回复的生命值提升至15%",
			exclusive_id = 350502,
			strengthen_skill_id = 214404
		},
		{
			active_lev = 20,
			desc = "【强化+20】额外提升自身攻击10%",
			exclusive_id = 350502,
			strengthen_skill_id = 0
		},
		{
			active_lev = 30,
			desc = "【强化+30】【冥王】Lv3技能伤害系数提升10%（至220%），且改为2回合发动一次",
			exclusive_id = 350502,
			strengthen_skill_id = 214104
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身攻击10%",
			exclusive_id = 350502,
			strengthen_skill_id = 0
		}
	},
	[340509] = {
		{
			active_lev = 10,
			desc = "【强化+10】【毒龙】Lv3【均衡毒素】反伤效果提升至35%",
			exclusive_id = 340509,
			strengthen_skill_id = 519104
		},
		{
			active_lev = 20,
			desc = "【强化+20】【毒龙舞】Lv3的总伤害提升75%（至826%）",
			exclusive_id = 340509,
			strengthen_skill_id = 519304
		},
		{
			active_lev = 30,
			desc = "【强化+30】【毒龙舞】Lv3对生命值高于60%的单位暴击率临时提升20%",
			exclusive_id = 340509,
			strengthen_skill_id = 519305
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身法术伤害10%",
			exclusive_id = 340509,
			strengthen_skill_id = 0
		}
	},
	[340512] = {
		{
			active_lev = 10,
			desc = "【强化+10】【极致武装色】Lv3牺牲自身最大生命值的血量降低至12%",
			exclusive_id = 340512,
			strengthen_skill_id = 535304
		},
		{
			active_lev = 20,
			desc = "【强化+20】【极致武装色】Lv3牺牲自身最大生命值的血量降低至10%，护盾值提升至自身攻击力160%",
			exclusive_id = 340512,
			strengthen_skill_id = 535305
		},
		{
			active_lev = 30,
			desc = "【强化+30】【海军导师】Lv3己方全体海军攻击力提高至10%",
			exclusive_id = 340512,
			strengthen_skill_id = 535204
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身生命值上限10%",
			exclusive_id = 340512,
			strengthen_skill_id = 0
		}
	},
	[340510] = {
		{
			active_lev = 10,
			desc = "【强化+10】【大喷火】Lv3的【破甲】概率提升10%（至80%）",
			exclusive_id = 340510,
			strengthen_skill_id = 525105
		},
		{
			active_lev = 20,
			desc = "【强化+20】【大喷火】Lv3有25%概率再附加一层【熔岩刻印】",
			exclusive_id = 340510,
			strengthen_skill_id = 525106
		},
		{
			active_lev = 30,
			desc = "【强化+30】【犬啮红莲】Lv3受到攻击叠加刻印的概率提升10%；且每层【熔岩刻印】伤害提升至施法者生命值的5%",
			exclusive_id = 340510,
			strengthen_skill_id = 525404
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身生命值上限10%",
			exclusive_id = 340510,
			strengthen_skill_id = 0
		}
	},
	[330513] = {
		{
			active_lev = 10,
			desc = "【强化+10】【仁爱之心】Lv3所附加的【不屈】效果持续回合提升至3回合",
			exclusive_id = 330513,
			strengthen_skill_id = 532304
		},
		{
			active_lev = 20,
			desc = "【强化+20】【仁爱之心】Lv3为己方全体恢复生命时，治疗系数提升15%（至120%）",
			exclusive_id = 330513,
			strengthen_skill_id = 532305
		},
		{
			active_lev = 30,
			desc = "【强化+30】【共鸣演说】Lv3第三次释放有额外5%概率再释放一次",
			exclusive_id = 330513,
			strengthen_skill_id = 532104
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升金鱼乙姬10%的攻击力",
			exclusive_id = 330513,
			strengthen_skill_id = 0
		}
	},
	[330511] = {
		{
			active_lev = 10,
			desc = "【强化+10】【甜甜箭】Lv3附加【甜甜印记】的概率提升至90%",
			exclusive_id = 330511,
			strengthen_skill_id = 522304
		},
		{
			active_lev = 20,
			desc = "【强化+20】【甜甜箭】Lv3的治疗系数提升15%（至143%）",
			exclusive_id = 330511,
			strengthen_skill_id = 522305
		},
		{
			active_lev = 30,
			desc = "【强化+30】【女王鼓舞】Lv3的增益单位提升至全体，且有50%的概率施加一次【庇护】",
			exclusive_id = 330511,
			strengthen_skill_id = 522104
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身攻击力10%",
			exclusive_id = 330511,
			strengthen_skill_id = 0
		}
	},
	[320512] = {
		{
			active_lev = 10,
			desc = "【强化+10】【万紫千红·花园】Lv3的治疗系数提升10%（至118%）",
			exclusive_id = 320512,
			strengthen_skill_id = 528107
		},
		{
			active_lev = 20,
			desc = "【强化+20】【万紫千红·花园】Lv3的治疗目标单位增至4个",
			exclusive_id = 320512,
			strengthen_skill_id = 528108
		},
		{
			active_lev = 30,
			desc = "【强化+30】【万紫千红·愈合手】Lv3的伤害转化治疗系数提升10%（至40%）",
			exclusive_id = 320512,
			strengthen_skill_id = 528404
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身治疗量10%",
			exclusive_id = 320512,
			strengthen_skill_id = 0
		}
	},
	[310512] = {
		{
			active_lev = 10,
			desc = "【强化+10】【护弟狂魔】Lv3的暴击增益率提升至25%",
			exclusive_id = 310512,
			strengthen_skill_id = 526404
		},
		{
			active_lev = 20,
			desc = "【强化+20】【龙之勾爪】Lv3的技能吸血概率提升至40%",
			exclusive_id = 310512,
			strengthen_skill_id = 526104
		},
		{
			active_lev = 30,
			desc = "【强化+30】【龙之勾爪】Lv3攻击目标增加至3个",
			exclusive_id = 310512,
			strengthen_skill_id = 526105
		},
		{
			active_lev = 35,
			desc = "【强化+35】额外提升自身物理伤害10%",
			exclusive_id = 310512,
			strengthen_skill_id = 0
		}
	}
}
Config.PartnerExclusiveData.data_exclusive_upgrade_info_length = 350
Config.PartnerExclusiveData.data_exclusive_upgrade_info = {
	["310512_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"hit_rate",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["310512_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5750
			},
			{
				"atk",
				580
			},
			{
				"hit_rate",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["310512_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6610
			},
			{
				"atk",
				680
			},
			{
				"hit_rate",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["310512_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7600
			},
			{
				"atk",
				790
			},
			{
				"hit_rate",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["310512_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				8740
			},
			{
				"atk",
				920
			},
			{
				"hit_rate",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["310512_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10050
			},
			{
				"atk",
				1080
			},
			{
				"hit_rate",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["310512_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				11550
			},
			{
				"atk",
				1260
			},
			{
				"hit_rate",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["310512_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				13280
			},
			{
				"atk",
				1480
			},
			{
				"hit_rate",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["310512_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				15270
			},
			{
				"atk",
				1730
			},
			{
				"hit_rate",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["310512_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				17560
			},
			{
				"atk",
				2030
			},
			{
				"hit_rate",
				35
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["310512_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				20190
			},
			{
				"atk",
				2340
			},
			{
				"hit_rate",
				37
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["310512_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				23210
			},
			{
				"atk",
				2700
			},
			{
				"hit_rate",
				39
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["310512_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				26690
			},
			{
				"atk",
				3110
			},
			{
				"hit_rate",
				41
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["310512_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				30690
			},
			{
				"atk",
				3590
			},
			{
				"hit_rate",
				43
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["310512_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				35290
			},
			{
				"atk",
				4140
			},
			{
				"hit_rate",
				45
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["310512_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				40580
			},
			{
				"atk",
				4780
			},
			{
				"hit_rate",
				47
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["310512_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				46660
			},
			{
				"atk",
				5520
			},
			{
				"hit_rate",
				49
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["310512_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				53650
			},
			{
				"atk",
				6370
			},
			{
				"hit_rate",
				51
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["310512_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				61690
			},
			{
				"atk",
				7350
			},
			{
				"hit_rate",
				53
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["310512_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				70940
			},
			{
				"atk",
				8480
			},
			{
				"hit_rate",
				55
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				78030
			},
			{
				"atk",
				9490
			},
			{
				"hit_rate",
				58
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				85830
			},
			{
				"atk",
				10620
			},
			{
				"hit_rate",
				61
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				94410
			},
			{
				"atk",
				11890
			},
			{
				"hit_rate",
				64
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				103850
			},
			{
				"atk",
				13310
			},
			{
				"hit_rate",
				67
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				114230
			},
			{
				"atk",
				14900
			},
			{
				"hit_rate",
				70
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				125650
			},
			{
				"atk",
				16390
			},
			{
				"hit_rate",
				73
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				138210
			},
			{
				"atk",
				18020
			},
			{
				"hit_rate",
				76
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				152030
			},
			{
				"atk",
				19820
			},
			{
				"hit_rate",
				79
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 310512,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				167230
			},
			{
				"atk",
				21800
			},
			{
				"hit_rate",
				82
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526104,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 310512,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				183950
			},
			{
				"atk",
				23980
			},
			{
				"hit_rate",
				85
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526105,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 310512,
		lev = 31,
		consume = {
			{
				1,
				10512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				195440
			},
			{
				"atk",
				25050
			},
			{
				"hit_rate",
				88
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526105,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				24911,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				24911,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				24911,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 310512,
		lev = 32,
		consume = {
			{
				1,
				10512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				207650
			},
			{
				"atk",
				26170
			},
			{
				"hit_rate",
				91
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526105,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				24911,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				24911,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				24911,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 310512,
		lev = 33,
		consume = {
			{
				1,
				10512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				220620
			},
			{
				"atk",
				27340
			},
			{
				"hit_rate",
				94
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526105,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				24911,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				24911,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				24911,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 310512,
		lev = 34,
		consume = {
			{
				1,
				10512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				234400
			},
			{
				"atk",
				28570
			},
			{
				"hit_rate",
				97
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526105,
				526103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				24911,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				24911,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				24911,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["310512_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 310512,
		lev = 35,
		consume = {
			{
				1,
				10512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250000
			},
			{
				"atk",
				30000
			},
			{
				"hit_rate",
				100
			}
		},
		strengthen_skills = {
			{
				526404,
				526403
			},
			{
				526105,
				526103
			}
		},
		strengthen_attr = {
			{
				"dam_p",
				100
			}
		},
		award1 = {
			{
				24911,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				24911,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				24911,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"speed",
				15
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["320512_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5890
			},
			{
				"atk",
				560
			},
			{
				"speed",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["320512_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6860
			},
			{
				"atk",
				630
			},
			{
				"speed",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["320512_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7950
			},
			{
				"atk",
				710
			},
			{
				"speed",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["320512_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				9250
			},
			{
				"atk",
				800
			},
			{
				"speed",
				24
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["320512_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10860
			},
			{
				"atk",
				900
			},
			{
				"speed",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["320512_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				12650
			},
			{
				"atk",
				1020
			},
			{
				"speed",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["320512_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				14820
			},
			{
				"atk",
				1150
			},
			{
				"speed",
				35
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["320512_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				17360
			},
			{
				"atk",
				1300
			},
			{
				"speed",
				40
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["320512_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				20320
			},
			{
				"atk",
				1470
			},
			{
				"speed",
				46
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["320512_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				23480
			},
			{
				"atk",
				1650
			},
			{
				"speed",
				51
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["320512_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				27030
			},
			{
				"atk",
				1850
			},
			{
				"speed",
				57
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["320512_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				31140
			},
			{
				"atk",
				2080
			},
			{
				"speed",
				63
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["320512_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				35900
			},
			{
				"atk",
				2340
			},
			{
				"speed",
				70
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["320512_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				41480
			},
			{
				"atk",
				2630
			},
			{
				"speed",
				78
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["320512_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				47860
			},
			{
				"atk",
				2950
			},
			{
				"speed",
				86
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["320512_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				55290
			},
			{
				"atk",
				3310
			},
			{
				"speed",
				95
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["320512_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				63730
			},
			{
				"atk",
				3720
			},
			{
				"speed",
				105
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["320512_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				73540
			},
			{
				"atk",
				4180
			},
			{
				"speed",
				116
			}
		},
		strengthen_skills = {
			{
				528107,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["320512_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				84870
			},
			{
				"atk",
				4700
			},
			{
				"speed",
				128
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				94980
			},
			{
				"atk",
				5220
			},
			{
				"speed",
				138
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				106260
			},
			{
				"atk",
				5800
			},
			{
				"speed",
				149
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				118960
			},
			{
				"atk",
				6450
			},
			{
				"speed",
				161
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				133110
			},
			{
				"atk",
				7170
			},
			{
				"speed",
				174
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				149090
			},
			{
				"atk",
				7970
			},
			{
				"speed",
				188
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				163910
			},
			{
				"atk",
				8860
			},
			{
				"speed",
				197
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				180210
			},
			{
				"atk",
				9850
			},
			{
				"speed",
				206
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				198230
			},
			{
				"atk",
				10950
			},
			{
				"speed",
				216
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 320512,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				218030
			},
			{
				"atk",
				12180
			},
			{
				"speed",
				226
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 320512,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				239880
			},
			{
				"atk",
				13550
			},
			{
				"speed",
				237
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			},
			{
				528404,
				528403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 320512,
		lev = 31,
		consume = {
			{
				1,
				20512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250540
			},
			{
				"atk",
				14630
			},
			{
				"speed",
				241
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			},
			{
				528404,
				528403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				25911,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				25911,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				25911,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 320512,
		lev = 32,
		consume = {
			{
				1,
				20512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				261730
			},
			{
				"atk",
				15800
			},
			{
				"speed",
				245
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			},
			{
				528404,
				528403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				25911,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				25911,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				25911,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 320512,
		lev = 33,
		consume = {
			{
				1,
				20512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				273400
			},
			{
				"atk",
				17060
			},
			{
				"speed",
				249
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			},
			{
				528404,
				528403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				25911,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				25911,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				25911,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 320512,
		lev = 34,
		consume = {
			{
				1,
				20512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				285770
			},
			{
				"atk",
				18420
			},
			{
				"speed",
				253
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			},
			{
				528404,
				528403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				25911,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				25911,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				25911,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["320512_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 320512,
		lev = 35,
		consume = {
			{
				1,
				20512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				300000
			},
			{
				"atk",
				20000
			},
			{
				"speed",
				260
			}
		},
		strengthen_skills = {
			{
				528108,
				528103
			},
			{
				528404,
				528403
			}
		},
		strengthen_attr = {
			{
				"cure",
				100
			}
		},
		award1 = {
			{
				25911,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				25911,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				25911,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"dodge_rate",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["330511_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5890
			},
			{
				"atk",
				560
			},
			{
				"dodge_rate",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["330511_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6860
			},
			{
				"atk",
				630
			},
			{
				"dodge_rate",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["330511_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7950
			},
			{
				"atk",
				710
			},
			{
				"dodge_rate",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["330511_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				9250
			},
			{
				"atk",
				800
			},
			{
				"dodge_rate",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["330511_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10860
			},
			{
				"atk",
				900
			},
			{
				"dodge_rate",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["330511_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				12650
			},
			{
				"atk",
				1020
			},
			{
				"dodge_rate",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["330511_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				14820
			},
			{
				"atk",
				1150
			},
			{
				"dodge_rate",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["330511_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				17360
			},
			{
				"atk",
				1300
			},
			{
				"dodge_rate",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["330511_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				20320
			},
			{
				"atk",
				1470
			},
			{
				"dodge_rate",
				35
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["330511_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				23480
			},
			{
				"atk",
				1650
			},
			{
				"dodge_rate",
				37
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["330511_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				27030
			},
			{
				"atk",
				1850
			},
			{
				"dodge_rate",
				39
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["330511_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				31140
			},
			{
				"atk",
				2080
			},
			{
				"dodge_rate",
				41
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["330511_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				35900
			},
			{
				"atk",
				2340
			},
			{
				"dodge_rate",
				43
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["330511_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				41480
			},
			{
				"atk",
				2630
			},
			{
				"dodge_rate",
				45
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["330511_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				47860
			},
			{
				"atk",
				2950
			},
			{
				"dodge_rate",
				47
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["330511_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				55290
			},
			{
				"atk",
				3310
			},
			{
				"dodge_rate",
				49
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["330511_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				63730
			},
			{
				"atk",
				3720
			},
			{
				"dodge_rate",
				51
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["330511_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				73540
			},
			{
				"atk",
				4180
			},
			{
				"dodge_rate",
				53
			}
		},
		strengthen_skills = {
			{
				522304,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["330511_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				84870
			},
			{
				"atk",
				4700
			},
			{
				"dodge_rate",
				55
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				94980
			},
			{
				"atk",
				5220
			},
			{
				"dodge_rate",
				58
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				106260
			},
			{
				"atk",
				5800
			},
			{
				"dodge_rate",
				61
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				118960
			},
			{
				"atk",
				6450
			},
			{
				"dodge_rate",
				64
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				133110
			},
			{
				"atk",
				7170
			},
			{
				"dodge_rate",
				67
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				149090
			},
			{
				"atk",
				7970
			},
			{
				"dodge_rate",
				70
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				163910
			},
			{
				"atk",
				8860
			},
			{
				"dodge_rate",
				73
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				180210
			},
			{
				"atk",
				9850
			},
			{
				"dodge_rate",
				76
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				198230
			},
			{
				"atk",
				10950
			},
			{
				"dodge_rate",
				79
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 330511,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				218030
			},
			{
				"atk",
				12180
			},
			{
				"dodge_rate",
				82
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 330511,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				239880
			},
			{
				"atk",
				13550
			},
			{
				"dodge_rate",
				85
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				522104,
				522103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 330511,
		lev = 31,
		consume = {
			{
				1,
				30511,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250540
			},
			{
				"atk",
				14630
			},
			{
				"dodge_rate",
				88
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				522104,
				522103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26910,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26910,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26910,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 330511,
		lev = 32,
		consume = {
			{
				1,
				30511,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				261730
			},
			{
				"atk",
				15800
			},
			{
				"dodge_rate",
				91
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				522104,
				522103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26910,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26910,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26910,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 330511,
		lev = 33,
		consume = {
			{
				1,
				30511,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				273400
			},
			{
				"atk",
				17060
			},
			{
				"dodge_rate",
				94
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				522104,
				522103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26910,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26910,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26910,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 330511,
		lev = 34,
		consume = {
			{
				1,
				30511,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				285770
			},
			{
				"atk",
				18420
			},
			{
				"dodge_rate",
				97
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				522104,
				522103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26910,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26910,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26910,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330511_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 330511,
		lev = 35,
		consume = {
			{
				1,
				30511,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				300000
			},
			{
				"atk",
				20000
			},
			{
				"dodge_rate",
				100
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				522104,
				522103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				26910,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26910,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26910,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"dodge_magic",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["330513_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5890
			},
			{
				"atk",
				560
			},
			{
				"dodge_magic",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["330513_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6860
			},
			{
				"atk",
				630
			},
			{
				"dodge_magic",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["330513_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7950
			},
			{
				"atk",
				710
			},
			{
				"dodge_magic",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["330513_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				9250
			},
			{
				"atk",
				800
			},
			{
				"dodge_magic",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["330513_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10860
			},
			{
				"atk",
				900
			},
			{
				"dodge_magic",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["330513_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				12650
			},
			{
				"atk",
				1020
			},
			{
				"dodge_magic",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["330513_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				14820
			},
			{
				"atk",
				1150
			},
			{
				"dodge_magic",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["330513_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				17360
			},
			{
				"atk",
				1300
			},
			{
				"dodge_magic",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["330513_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				20320
			},
			{
				"atk",
				1470
			},
			{
				"dodge_magic",
				35
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["330513_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				23480
			},
			{
				"atk",
				1650
			},
			{
				"dodge_magic",
				37
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["330513_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				27030
			},
			{
				"atk",
				1850
			},
			{
				"dodge_magic",
				39
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["330513_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				31140
			},
			{
				"atk",
				2080
			},
			{
				"dodge_magic",
				41
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["330513_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				35900
			},
			{
				"atk",
				2340
			},
			{
				"dodge_magic",
				43
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["330513_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				41480
			},
			{
				"atk",
				2630
			},
			{
				"dodge_magic",
				45
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["330513_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				47860
			},
			{
				"atk",
				2950
			},
			{
				"dodge_magic",
				47
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["330513_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				55290
			},
			{
				"atk",
				3310
			},
			{
				"dodge_magic",
				49
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["330513_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				63730
			},
			{
				"atk",
				3720
			},
			{
				"dodge_magic",
				51
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["330513_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				73540
			},
			{
				"atk",
				4180
			},
			{
				"dodge_magic",
				53
			}
		},
		strengthen_skills = {
			{
				532304,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["330513_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				84870
			},
			{
				"atk",
				4700
			},
			{
				"dodge_magic",
				55
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				94980
			},
			{
				"atk",
				5220
			},
			{
				"dodge_magic",
				58
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				106260
			},
			{
				"atk",
				5800
			},
			{
				"dodge_magic",
				61
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				118960
			},
			{
				"atk",
				6450
			},
			{
				"dodge_magic",
				64
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				133110
			},
			{
				"atk",
				7170
			},
			{
				"dodge_magic",
				67
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				149090
			},
			{
				"atk",
				7970
			},
			{
				"dodge_magic",
				70
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				163910
			},
			{
				"atk",
				8860
			},
			{
				"dodge_magic",
				73
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				180210
			},
			{
				"atk",
				9850
			},
			{
				"dodge_magic",
				76
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				198230
			},
			{
				"atk",
				10950
			},
			{
				"dodge_magic",
				79
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 330513,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				218030
			},
			{
				"atk",
				12180
			},
			{
				"dodge_magic",
				82
			}
		},
		strengthen_skills = {
			{
				532305,
				532303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 330513,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				239880
			},
			{
				"atk",
				13550
			},
			{
				"dodge_magic",
				85
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				532104,
				532103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 330513,
		lev = 31,
		consume = {
			{
				1,
				30513,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250540
			},
			{
				"atk",
				14630
			},
			{
				"dodge_magic",
				88
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				532104,
				532103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26912,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26912,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26912,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 330513,
		lev = 32,
		consume = {
			{
				1,
				30513,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				261730
			},
			{
				"atk",
				15800
			},
			{
				"dodge_magic",
				91
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				532104,
				532103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26912,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26912,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26912,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 330513,
		lev = 33,
		consume = {
			{
				1,
				30513,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				273400
			},
			{
				"atk",
				17060
			},
			{
				"dodge_magic",
				94
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				532104,
				532103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26912,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26912,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26912,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 330513,
		lev = 34,
		consume = {
			{
				1,
				30513,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				285770
			},
			{
				"atk",
				18420
			},
			{
				"dodge_magic",
				97
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				532104,
				532103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				26912,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26912,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26912,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["330513_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 330513,
		lev = 35,
		consume = {
			{
				1,
				30513,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				300000
			},
			{
				"atk",
				20000
			},
			{
				"dodge_magic",
				100
			}
		},
		strengthen_skills = {
			{
				522305,
				522303
			},
			{
				532104,
				532103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				26912,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				26912,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				26912,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"def",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["340510_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5870
			},
			{
				"atk",
				570
			},
			{
				"def",
				28
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["340510_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6890
			},
			{
				"atk",
				650
			},
			{
				"def",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["340510_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				8090
			},
			{
				"atk",
				740
			},
			{
				"def",
				34
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["340510_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				9500
			},
			{
				"atk",
				850
			},
			{
				"def",
				38
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["340510_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				11160
			},
			{
				"atk",
				970
			},
			{
				"def",
				42
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["340510_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				13110
			},
			{
				"atk",
				1110
			},
			{
				"def",
				47
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["340510_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				15400
			},
			{
				"atk",
				1270
			},
			{
				"def",
				52
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["340510_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				18090
			},
			{
				"atk",
				1460
			},
			{
				"def",
				58
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["340510_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				21250
			},
			{
				"atk",
				1670
			},
			{
				"def",
				65
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["340510_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				24960
			},
			{
				"atk",
				1860
			},
			{
				"def",
				70
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["340510_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				29320
			},
			{
				"atk",
				2070
			},
			{
				"def",
				75
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["340510_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				34450
			},
			{
				"atk",
				2300
			},
			{
				"def",
				81
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["340510_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				40470
			},
			{
				"atk",
				2560
			},
			{
				"def",
				87
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["340510_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				47550
			},
			{
				"atk",
				2850
			},
			{
				"def",
				94
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["340510_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				54920
			},
			{
				"atk",
				3170
			},
			{
				"def",
				101
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["340510_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				63430
			},
			{
				"atk",
				3530
			},
			{
				"def",
				109
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["340510_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				73260
			},
			{
				"atk",
				3930
			},
			{
				"def",
				118
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["340510_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				84610
			},
			{
				"atk",
				4380
			},
			{
				"def",
				128
			}
		},
		strengthen_skills = {
			{
				525105,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["340510_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				97720
			},
			{
				"atk",
				4880
			},
			{
				"def",
				138
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				109930
			},
			{
				"atk",
				5290
			},
			{
				"def",
				148
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				123670
			},
			{
				"atk",
				5730
			},
			{
				"def",
				159
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				139120
			},
			{
				"atk",
				6210
			},
			{
				"def",
				170
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				156510
			},
			{
				"atk",
				6730
			},
			{
				"def",
				182
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				176070
			},
			{
				"atk",
				7300
			},
			{
				"def",
				195
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				193670
			},
			{
				"atk",
				7730
			},
			{
				"def",
				209
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				213030
			},
			{
				"atk",
				8190
			},
			{
				"def",
				224
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				234330
			},
			{
				"atk",
				8680
			},
			{
				"def",
				240
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 340510,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				257760
			},
			{
				"atk",
				9200
			},
			{
				"def",
				258
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 340510,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				283530
			},
			{
				"atk",
				9750
			},
			{
				"def",
				277
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			},
			{
				525404,
				525403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 340510,
		lev = 31,
		consume = {
			{
				1,
				40510,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				296280
			},
			{
				"atk",
				10180
			},
			{
				"def",
				290
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			},
			{
				525404,
				525403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27909,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27909,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27909,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 340510,
		lev = 32,
		consume = {
			{
				1,
				40510,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				309610
			},
			{
				"atk",
				10630
			},
			{
				"def",
				304
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			},
			{
				525404,
				525403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27909,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27909,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27909,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 340510,
		lev = 33,
		consume = {
			{
				1,
				40510,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				323540
			},
			{
				"atk",
				11100
			},
			{
				"def",
				319
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			},
			{
				525404,
				525403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27909,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27909,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27909,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 340510,
		lev = 34,
		consume = {
			{
				1,
				40510,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				338090
			},
			{
				"atk",
				11590
			},
			{
				"def",
				334
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			},
			{
				525404,
				525403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27909,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27909,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27909,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340510_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 340510,
		lev = 35,
		consume = {
			{
				1,
				40510,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				350000
			},
			{
				"atk",
				12000
			},
			{
				"def",
				350
			}
		},
		strengthen_skills = {
			{
				525106,
				525103
			},
			{
				525404,
				525403
			}
		},
		strengthen_attr = {
			{
				"hp_max_per",
				100
			}
		},
		award1 = {
			{
				27909,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27909,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27909,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"dodge_rate",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["340512_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5870
			},
			{
				"atk",
				570
			},
			{
				"dodge_rate",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["340512_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6890
			},
			{
				"atk",
				650
			},
			{
				"dodge_rate",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["340512_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				8090
			},
			{
				"atk",
				740
			},
			{
				"dodge_rate",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["340512_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				9500
			},
			{
				"atk",
				850
			},
			{
				"dodge_rate",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["340512_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				11160
			},
			{
				"atk",
				970
			},
			{
				"dodge_rate",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["340512_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				13110
			},
			{
				"atk",
				1110
			},
			{
				"dodge_rate",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["340512_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				15400
			},
			{
				"atk",
				1270
			},
			{
				"dodge_rate",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["340512_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				18090
			},
			{
				"atk",
				1460
			},
			{
				"dodge_rate",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["340512_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				21250
			},
			{
				"atk",
				1670
			},
			{
				"dodge_rate",
				35
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["340512_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				24960
			},
			{
				"atk",
				1860
			},
			{
				"dodge_rate",
				37
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["340512_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				29320
			},
			{
				"atk",
				2070
			},
			{
				"dodge_rate",
				39
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["340512_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				34450
			},
			{
				"atk",
				2300
			},
			{
				"dodge_rate",
				41
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["340512_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				40470
			},
			{
				"atk",
				2560
			},
			{
				"dodge_rate",
				43
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["340512_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				47550
			},
			{
				"atk",
				2850
			},
			{
				"dodge_rate",
				45
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["340512_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				54920
			},
			{
				"atk",
				3170
			},
			{
				"dodge_rate",
				47
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["340512_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				63430
			},
			{
				"atk",
				3530
			},
			{
				"dodge_rate",
				49
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["340512_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				73260
			},
			{
				"atk",
				3930
			},
			{
				"dodge_rate",
				51
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["340512_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				84610
			},
			{
				"atk",
				4380
			},
			{
				"dodge_rate",
				53
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["340512_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				97720
			},
			{
				"atk",
				4880
			},
			{
				"dodge_rate",
				55
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				109930
			},
			{
				"atk",
				5290
			},
			{
				"dodge_rate",
				58
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				123670
			},
			{
				"atk",
				5730
			},
			{
				"dodge_rate",
				61
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				139120
			},
			{
				"atk",
				6210
			},
			{
				"dodge_rate",
				64
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				156510
			},
			{
				"atk",
				6730
			},
			{
				"dodge_rate",
				67
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				176070
			},
			{
				"atk",
				7300
			},
			{
				"dodge_rate",
				70
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				193670
			},
			{
				"atk",
				7730
			},
			{
				"dodge_rate",
				73
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				213030
			},
			{
				"atk",
				8190
			},
			{
				"dodge_rate",
				76
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				234330
			},
			{
				"atk",
				8680
			},
			{
				"dodge_rate",
				79
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 340512,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				257760
			},
			{
				"atk",
				9200
			},
			{
				"dodge_rate",
				82
			}
		},
		strengthen_skills = {
			{
				535305,
				535303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 340512,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				283530
			},
			{
				"atk",
				9750
			},
			{
				"dodge_rate",
				85
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			},
			{
				535204,
				535203
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 340512,
		lev = 31,
		consume = {
			{
				1,
				40512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				296280
			},
			{
				"atk",
				10180
			},
			{
				"dodge_rate",
				88
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			},
			{
				535204,
				535203
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27911,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27911,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27911,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 340512,
		lev = 32,
		consume = {
			{
				1,
				40512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				309610
			},
			{
				"atk",
				10630
			},
			{
				"dodge_rate",
				91
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			},
			{
				535204,
				535203
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27911,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27911,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27911,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 340512,
		lev = 33,
		consume = {
			{
				1,
				40512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				323540
			},
			{
				"atk",
				11100
			},
			{
				"dodge_rate",
				94
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			},
			{
				535204,
				535203
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27911,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27911,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27911,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 340512,
		lev = 34,
		consume = {
			{
				1,
				40512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				338090
			},
			{
				"atk",
				11590
			},
			{
				"dodge_rate",
				97
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			},
			{
				535204,
				535203
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27911,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27911,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27911,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340512_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 340512,
		lev = 35,
		consume = {
			{
				1,
				40512,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				350000
			},
			{
				"atk",
				12000
			},
			{
				"dodge_rate",
				100
			}
		},
		strengthen_skills = {
			{
				535304,
				535303
			},
			{
				535204,
				535203
			}
		},
		strengthen_attr = {
			{
				"hp_max_per",
				100
			}
		},
		award1 = {
			{
				27911,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27911,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27911,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"dodge_magic",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["340509_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5750
			},
			{
				"atk",
				580
			},
			{
				"dodge_magic",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["340509_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6610
			},
			{
				"atk",
				680
			},
			{
				"dodge_magic",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["340509_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7600
			},
			{
				"atk",
				790
			},
			{
				"dodge_magic",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["340509_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				8740
			},
			{
				"atk",
				920
			},
			{
				"dodge_magic",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["340509_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10050
			},
			{
				"atk",
				1080
			},
			{
				"dodge_magic",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["340509_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				11550
			},
			{
				"atk",
				1260
			},
			{
				"dodge_magic",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["340509_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				13280
			},
			{
				"atk",
				1480
			},
			{
				"dodge_magic",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["340509_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				15270
			},
			{
				"atk",
				1730
			},
			{
				"dodge_magic",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["340509_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				17560
			},
			{
				"atk",
				2030
			},
			{
				"dodge_magic",
				35
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["340509_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				20190
			},
			{
				"atk",
				2340
			},
			{
				"dodge_magic",
				37
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["340509_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				23210
			},
			{
				"atk",
				2700
			},
			{
				"dodge_magic",
				39
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["340509_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				26690
			},
			{
				"atk",
				3110
			},
			{
				"dodge_magic",
				41
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["340509_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				30690
			},
			{
				"atk",
				3590
			},
			{
				"dodge_magic",
				43
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["340509_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				35290
			},
			{
				"atk",
				4140
			},
			{
				"dodge_magic",
				45
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["340509_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				40580
			},
			{
				"atk",
				4780
			},
			{
				"dodge_magic",
				47
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["340509_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				46660
			},
			{
				"atk",
				5520
			},
			{
				"dodge_magic",
				49
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["340509_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				53650
			},
			{
				"atk",
				6370
			},
			{
				"dodge_magic",
				51
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["340509_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				61690
			},
			{
				"atk",
				7350
			},
			{
				"dodge_magic",
				53
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["340509_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				70940
			},
			{
				"atk",
				8480
			},
			{
				"dodge_magic",
				55
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				78030
			},
			{
				"atk",
				9490
			},
			{
				"dodge_magic",
				58
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				85830
			},
			{
				"atk",
				10620
			},
			{
				"dodge_magic",
				61
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				94410
			},
			{
				"atk",
				11890
			},
			{
				"dodge_magic",
				64
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				103850
			},
			{
				"atk",
				13310
			},
			{
				"dodge_magic",
				67
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				114230
			},
			{
				"atk",
				14900
			},
			{
				"dodge_magic",
				70
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				125650
			},
			{
				"atk",
				16390
			},
			{
				"dodge_magic",
				73
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				138210
			},
			{
				"atk",
				18020
			},
			{
				"dodge_magic",
				76
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				152030
			},
			{
				"atk",
				19820
			},
			{
				"dodge_magic",
				79
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 340509,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				167230
			},
			{
				"atk",
				21800
			},
			{
				"dodge_magic",
				82
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519304,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 340509,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				183950
			},
			{
				"atk",
				23980
			},
			{
				"dodge_magic",
				85
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519305,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 340509,
		lev = 31,
		consume = {
			{
				1,
				40509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				195440
			},
			{
				"atk",
				25050
			},
			{
				"dodge_magic",
				88
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519305,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27908,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27908,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27908,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 340509,
		lev = 32,
		consume = {
			{
				1,
				40509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				207650
			},
			{
				"atk",
				26170
			},
			{
				"dodge_magic",
				91
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519305,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27908,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27908,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27908,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 340509,
		lev = 33,
		consume = {
			{
				1,
				40509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				220620
			},
			{
				"atk",
				27340
			},
			{
				"dodge_magic",
				94
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519305,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27908,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27908,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27908,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 340509,
		lev = 34,
		consume = {
			{
				1,
				40509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				234400
			},
			{
				"atk",
				28570
			},
			{
				"dodge_magic",
				97
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519305,
				519303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				27908,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27908,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27908,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["340509_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 340509,
		lev = 35,
		consume = {
			{
				1,
				40509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250000
			},
			{
				"atk",
				30000
			},
			{
				"dodge_magic",
				100
			}
		},
		strengthen_skills = {
			{
				519104,
				519103
			},
			{
				519305,
				519303
			}
		},
		strengthen_attr = {
			{
				"dam_s",
				100
			}
		},
		award1 = {
			{
				27908,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				27908,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				27908,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"dodge_magic",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["350502_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5750
			},
			{
				"atk",
				580
			},
			{
				"dodge_magic",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["350502_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6610
			},
			{
				"atk",
				680
			},
			{
				"dodge_magic",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["350502_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7600
			},
			{
				"atk",
				790
			},
			{
				"dodge_magic",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["350502_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				8740
			},
			{
				"atk",
				920
			},
			{
				"dodge_magic",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["350502_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10050
			},
			{
				"atk",
				1080
			},
			{
				"dodge_magic",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["350502_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				11550
			},
			{
				"atk",
				1260
			},
			{
				"dodge_magic",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["350502_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				13280
			},
			{
				"atk",
				1480
			},
			{
				"dodge_magic",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["350502_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				15270
			},
			{
				"atk",
				1730
			},
			{
				"dodge_magic",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["350502_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				17560
			},
			{
				"atk",
				2030
			},
			{
				"dodge_magic",
				35
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["350502_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				20190
			},
			{
				"atk",
				2340
			},
			{
				"dodge_magic",
				37
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["350502_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				23210
			},
			{
				"atk",
				2700
			},
			{
				"dodge_magic",
				39
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["350502_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				26690
			},
			{
				"atk",
				3110
			},
			{
				"dodge_magic",
				41
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["350502_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				30690
			},
			{
				"atk",
				3590
			},
			{
				"dodge_magic",
				43
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["350502_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				35290
			},
			{
				"atk",
				4140
			},
			{
				"dodge_magic",
				45
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["350502_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				40580
			},
			{
				"atk",
				4780
			},
			{
				"dodge_magic",
				47
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["350502_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				46660
			},
			{
				"atk",
				5520
			},
			{
				"dodge_magic",
				49
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["350502_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				53650
			},
			{
				"atk",
				6370
			},
			{
				"dodge_magic",
				51
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["350502_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				61690
			},
			{
				"atk",
				7350
			},
			{
				"dodge_magic",
				53
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["350502_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				70940
			},
			{
				"atk",
				8480
			},
			{
				"dodge_magic",
				55
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				78030
			},
			{
				"atk",
				9490
			},
			{
				"dodge_magic",
				58
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				85830
			},
			{
				"atk",
				10620
			},
			{
				"dodge_magic",
				61
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				94410
			},
			{
				"atk",
				11890
			},
			{
				"dodge_magic",
				64
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				103850
			},
			{
				"atk",
				13310
			},
			{
				"dodge_magic",
				67
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				114230
			},
			{
				"atk",
				14900
			},
			{
				"dodge_magic",
				70
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				125650
			},
			{
				"atk",
				16390
			},
			{
				"dodge_magic",
				73
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				138210
			},
			{
				"atk",
				18020
			},
			{
				"dodge_magic",
				76
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				152030
			},
			{
				"atk",
				19820
			},
			{
				"dodge_magic",
				79
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 350502,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				167230
			},
			{
				"atk",
				21800
			},
			{
				"dodge_magic",
				82
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 350502,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				183950
			},
			{
				"atk",
				23980
			},
			{
				"dodge_magic",
				85
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			},
			{
				214104,
				214103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 350502,
		lev = 31,
		consume = {
			{
				1,
				50502,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				195440
			},
			{
				"atk",
				25050
			},
			{
				"dodge_magic",
				88
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			},
			{
				214104,
				214103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				28901,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28901,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28901,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 350502,
		lev = 32,
		consume = {
			{
				1,
				50502,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				207650
			},
			{
				"atk",
				26170
			},
			{
				"dodge_magic",
				91
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			},
			{
				214104,
				214103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				28901,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28901,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28901,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 350502,
		lev = 33,
		consume = {
			{
				1,
				50502,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				220620
			},
			{
				"atk",
				27340
			},
			{
				"dodge_magic",
				94
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			},
			{
				214104,
				214103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				28901,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28901,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28901,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 350502,
		lev = 34,
		consume = {
			{
				1,
				50502,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				234400
			},
			{
				"atk",
				28570
			},
			{
				"dodge_magic",
				97
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			},
			{
				214104,
				214103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				100
			}
		},
		award1 = {
			{
				28901,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28901,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28901,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350502_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 350502,
		lev = 35,
		consume = {
			{
				1,
				50502,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250000
			},
			{
				"atk",
				30000
			},
			{
				"dodge_magic",
				100
			}
		},
		strengthen_skills = {
			{
				214404,
				214403
			},
			{
				214104,
				214103
			}
		},
		strengthen_attr = {
			{
				"atk_per",
				200
			}
		},
		award1 = {
			{
				28901,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28901,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28901,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"def",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["350508_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5750
			},
			{
				"atk",
				580
			},
			{
				"def",
				28
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["350508_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6610
			},
			{
				"atk",
				680
			},
			{
				"def",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["350508_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7600
			},
			{
				"atk",
				790
			},
			{
				"def",
				34
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["350508_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				8740
			},
			{
				"atk",
				920
			},
			{
				"def",
				38
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["350508_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10050
			},
			{
				"atk",
				1080
			},
			{
				"def",
				42
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["350508_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				11550
			},
			{
				"atk",
				1260
			},
			{
				"def",
				47
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["350508_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				13280
			},
			{
				"atk",
				1480
			},
			{
				"def",
				52
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["350508_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				15270
			},
			{
				"atk",
				1730
			},
			{
				"def",
				58
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["350508_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				17560
			},
			{
				"atk",
				2030
			},
			{
				"def",
				65
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["350508_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				20190
			},
			{
				"atk",
				2340
			},
			{
				"def",
				70
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["350508_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				23210
			},
			{
				"atk",
				2700
			},
			{
				"def",
				75
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["350508_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				26690
			},
			{
				"atk",
				3110
			},
			{
				"def",
				81
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["350508_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				30690
			},
			{
				"atk",
				3590
			},
			{
				"def",
				87
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["350508_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				35290
			},
			{
				"atk",
				4140
			},
			{
				"def",
				94
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["350508_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				40580
			},
			{
				"atk",
				4780
			},
			{
				"def",
				101
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["350508_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				46660
			},
			{
				"atk",
				5520
			},
			{
				"def",
				109
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["350508_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				53650
			},
			{
				"atk",
				6370
			},
			{
				"def",
				118
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["350508_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				61690
			},
			{
				"atk",
				7350
			},
			{
				"def",
				128
			}
		},
		strengthen_skills = {
			{
				516104,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["350508_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				70940
			},
			{
				"atk",
				8480
			},
			{
				"def",
				138
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				78030
			},
			{
				"atk",
				9490
			},
			{
				"def",
				148
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				85830
			},
			{
				"atk",
				10620
			},
			{
				"def",
				159
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				94410
			},
			{
				"atk",
				11890
			},
			{
				"def",
				170
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				103850
			},
			{
				"atk",
				13310
			},
			{
				"def",
				182
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				114230
			},
			{
				"atk",
				14900
			},
			{
				"def",
				195
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				125650
			},
			{
				"atk",
				16390
			},
			{
				"def",
				209
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				138210
			},
			{
				"atk",
				18020
			},
			{
				"def",
				224
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				152030
			},
			{
				"atk",
				19820
			},
			{
				"def",
				240
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 350508,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				167230
			},
			{
				"atk",
				21800
			},
			{
				"def",
				258
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 350508,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				183950
			},
			{
				"atk",
				23980
			},
			{
				"def",
				277
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			},
			{
				516404,
				516403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 350508,
		lev = 31,
		consume = {
			{
				1,
				50508,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				195440
			},
			{
				"atk",
				25050
			},
			{
				"def",
				290
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			},
			{
				516404,
				516403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28907,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28907,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28907,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 350508,
		lev = 32,
		consume = {
			{
				1,
				50508,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				207650
			},
			{
				"atk",
				26170
			},
			{
				"def",
				304
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			},
			{
				516404,
				516403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28907,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28907,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28907,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 350508,
		lev = 33,
		consume = {
			{
				1,
				50508,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				220620
			},
			{
				"atk",
				27340
			},
			{
				"def",
				319
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			},
			{
				516404,
				516403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28907,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28907,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28907,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 350508,
		lev = 34,
		consume = {
			{
				1,
				50508,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				234400
			},
			{
				"atk",
				28570
			},
			{
				"def",
				334
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			},
			{
				516404,
				516403
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28907,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28907,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28907,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350508_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 350508,
		lev = 35,
		consume = {
			{
				1,
				50508,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250000
			},
			{
				"atk",
				30000
			},
			{
				"def",
				350
			}
		},
		strengthen_skills = {
			{
				516105,
				516103
			},
			{
				516404,
				516403
			}
		},
		strengthen_attr = {
			{
				"crit_ratio",
				150
			}
		},
		award1 = {
			{
				28907,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28907,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28907,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_1"] = {
		score = 500,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 1,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5000
			},
			{
				"atk",
				500
			},
			{
				"tenacity",
				17
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				10
			}
		},
		award3 = {
			{
				11101,
				10
			}
		},
		award4 = {
			{
				11101,
				10
			}
		}
	},
	["350509_2"] = {
		score = 612,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 2,
		consume = {
			{
				2,
				11101,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				5750
			},
			{
				"atk",
				580
			},
			{
				"tenacity",
				19
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				20
			}
		},
		award3 = {
			{
				11101,
				20
			}
		},
		award4 = {
			{
				11101,
				20
			}
		}
	},
	["350509_3"] = {
		score = 724,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 3,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				6610
			},
			{
				"atk",
				680
			},
			{
				"tenacity",
				21
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				35
			}
		},
		award3 = {
			{
				11101,
				35
			}
		},
		award4 = {
			{
				11101,
				35
			}
		}
	},
	["350509_4"] = {
		score = 981,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 4,
		consume = {
			{
				2,
				11101,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				7600
			},
			{
				"atk",
				790
			},
			{
				"tenacity",
				23
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				50
			}
		},
		award3 = {
			{
				11101,
				50
			}
		},
		award4 = {
			{
				11101,
				50
			}
		}
	},
	["350509_5"] = {
		score = 1240,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 5,
		consume = {
			{
				2,
				11101,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				8740
			},
			{
				"atk",
				920
			},
			{
				"tenacity",
				25
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				70
			}
		},
		award3 = {
			{
				11101,
				70
			}
		},
		award4 = {
			{
				11101,
				70
			}
		}
	},
	["350509_6"] = {
		score = 1630,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 6,
		consume = {
			{
				2,
				11101,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				10050
			},
			{
				"atk",
				1080
			},
			{
				"tenacity",
				27
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				95
			}
		},
		award3 = {
			{
				11101,
				95
			}
		},
		award4 = {
			{
				11101,
				95
			}
		}
	},
	["350509_7"] = {
		score = 2150,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 7,
		consume = {
			{
				2,
				11101,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				11550
			},
			{
				"atk",
				1260
			},
			{
				"tenacity",
				29
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				125
			}
		},
		award3 = {
			{
				11101,
				125
			}
		},
		award4 = {
			{
				11101,
				125
			}
		}
	},
	["350509_8"] = {
		score = 2806,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 8,
		consume = {
			{
				2,
				11101,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				13280
			},
			{
				"atk",
				1480
			},
			{
				"tenacity",
				31
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				160
			}
		},
		award3 = {
			{
				11101,
				160
			}
		},
		award4 = {
			{
				11101,
				160
			}
		}
	},
	["350509_9"] = {
		score = 3550,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 9,
		consume = {
			{
				2,
				11101,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				15270
			},
			{
				"atk",
				1730
			},
			{
				"tenacity",
				33
			}
		},
		strengthen_skills = {},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				200
			}
		},
		award3 = {
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11101,
				200
			}
		}
	},
	["350509_10"] = {
		score = 4338,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 10,
		consume = {
			{
				2,
				11101,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				17560
			},
			{
				"atk",
				2030
			},
			{
				"tenacity",
				35
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11101,
				250
			}
		}
	},
	["350509_11"] = {
		score = 5139,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 11,
		consume = {
			{
				2,
				11102,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				20190
			},
			{
				"atk",
				2340
			},
			{
				"tenacity",
				37
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				10
			},
			{
				11101,
				250
			}
		}
	},
	["350509_12"] = {
		score = 5741,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 12,
		consume = {
			{
				2,
				11102,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				23210
			},
			{
				"atk",
				2700
			},
			{
				"tenacity",
				39
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				25
			},
			{
				11101,
				250
			}
		}
	},
	["350509_13"] = {
		score = 6442,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 13,
		consume = {
			{
				2,
				11102,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				26690
			},
			{
				"atk",
				3110
			},
			{
				"tenacity",
				41
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				45
			},
			{
				11101,
				250
			}
		}
	},
	["350509_14"] = {
		score = 7344,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 14,
		consume = {
			{
				2,
				11102,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				30690
			},
			{
				"atk",
				3590
			},
			{
				"tenacity",
				43
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				70
			},
			{
				11101,
				250
			}
		}
	},
	["350509_15"] = {
		score = 8246,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 15,
		consume = {
			{
				2,
				11102,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				35290
			},
			{
				"atk",
				4140
			},
			{
				"tenacity",
				45
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				100
			},
			{
				11101,
				250
			}
		}
	},
	["350509_16"] = {
		score = 9148,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 16,
		consume = {
			{
				2,
				11102,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				40580
			},
			{
				"atk",
				4780
			},
			{
				"tenacity",
				47
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				135
			},
			{
				11101,
				250
			}
		}
	},
	["350509_17"] = {
		score = 10152,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 17,
		consume = {
			{
				2,
				11102,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				46660
			},
			{
				"atk",
				5520
			},
			{
				"tenacity",
				49
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				175
			},
			{
				11101,
				250
			}
		}
	},
	["350509_18"] = {
		score = 11121,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 18,
		consume = {
			{
				2,
				11102,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				53650
			},
			{
				"atk",
				6370
			},
			{
				"tenacity",
				51
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				220
			},
			{
				11101,
				250
			}
		}
	},
	["350509_19"] = {
		score = 12140,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 19,
		consume = {
			{
				2,
				11102,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				61690
			},
			{
				"atk",
				7350
			},
			{
				"tenacity",
				53
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				270
			},
			{
				11101,
				250
			}
		}
	},
	["350509_20"] = {
		score = 13159,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 20,
		consume = {
			{
				2,
				11102,
				60
			}
		},
		base_attr = {
			{
				"hp_max",
				70940
			},
			{
				"atk",
				8480
			},
			{
				"tenacity",
				55
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award4 = {
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_21"] = {
		score = 13978,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 21,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				78030
			},
			{
				"atk",
				9490
			},
			{
				"tenacity",
				58
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				8
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				10
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_22"] = {
		score = 15097,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 22,
		consume = {
			{
				2,
				11103,
				10
			}
		},
		base_attr = {
			{
				"hp_max",
				85830
			},
			{
				"atk",
				10620
			},
			{
				"tenacity",
				61
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				16
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				20
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_23"] = {
		score = 16116,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 23,
		consume = {
			{
				2,
				11103,
				15
			}
		},
		base_attr = {
			{
				"hp_max",
				94410
			},
			{
				"atk",
				11890
			},
			{
				"tenacity",
				64
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				28
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				35
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_24"] = {
		score = 16935,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 24,
		consume = {
			{
				2,
				11103,
				20
			}
		},
		base_attr = {
			{
				"hp_max",
				103850
			},
			{
				"atk",
				13310
			},
			{
				"tenacity",
				67
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				44
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				55
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_25"] = {
		score = 17654,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 25,
		consume = {
			{
				2,
				11103,
				25
			}
		},
		base_attr = {
			{
				"hp_max",
				114230
			},
			{
				"atk",
				14900
			},
			{
				"tenacity",
				70
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				64
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				80
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_26"] = {
		score = 18173,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 26,
		consume = {
			{
				2,
				11103,
				30
			}
		},
		base_attr = {
			{
				"hp_max",
				125650
			},
			{
				"atk",
				16390
			},
			{
				"tenacity",
				73
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				88
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				110
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_27"] = {
		score = 19270,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 27,
		consume = {
			{
				2,
				11103,
				35
			}
		},
		base_attr = {
			{
				"hp_max",
				138210
			},
			{
				"atk",
				18020
			},
			{
				"tenacity",
				76
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				116
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				145
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_28"] = {
		score = 20073,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 28,
		consume = {
			{
				2,
				11103,
				40
			}
		},
		base_attr = {
			{
				"hp_max",
				152030
			},
			{
				"atk",
				19820
			},
			{
				"tenacity",
				79
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				148
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				185
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_29"] = {
		score = 21108,
		pre_star = 12,
		exclusive_id = 350509,
		lev = 29,
		consume = {
			{
				2,
				11103,
				45
			}
		},
		base_attr = {
			{
				"hp_max",
				167230
			},
			{
				"atk",
				21800
			},
			{
				"tenacity",
				82
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521304,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				184
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				230
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_30"] = {
		score = 22357,
		pre_star = 13,
		exclusive_id = 350509,
		lev = 30,
		consume = {
			{
				2,
				11103,
				50
			}
		},
		base_attr = {
			{
				"hp_max",
				183950
			},
			{
				"atk",
				23980
			},
			{
				"tenacity",
				85
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521305,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_31"] = {
		score = 23807,
		pre_star = 13,
		exclusive_id = 350509,
		lev = 31,
		consume = {
			{
				1,
				50509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				195440
			},
			{
				"atk",
				25050
			},
			{
				"tenacity",
				88
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521305,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28908,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28908,
				40
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28908,
				50
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_32"] = {
		score = 25840,
		pre_star = 13,
		exclusive_id = 350509,
		lev = 32,
		consume = {
			{
				1,
				50509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				207650
			},
			{
				"atk",
				26170
			},
			{
				"tenacity",
				91
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521305,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28908,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28908,
				80
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28908,
				100
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_33"] = {
		score = 27089,
		pre_star = 13,
		exclusive_id = 350509,
		lev = 33,
		consume = {
			{
				1,
				50509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				220620
			},
			{
				"atk",
				27340
			},
			{
				"tenacity",
				94
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521305,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28908,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28908,
				120
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28908,
				150
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_34"] = {
		score = 28160,
		pre_star = 13,
		exclusive_id = 350509,
		lev = 34,
		consume = {
			{
				1,
				50509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				234400
			},
			{
				"atk",
				28570
			},
			{
				"tenacity",
				97
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521305,
				521303
			}
		},
		strengthen_attr = {},
		award1 = {
			{
				28908,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28908,
				160
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28908,
				200
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	},
	["350509_35"] = {
		score = 30000,
		pre_star = 13,
		exclusive_id = 350509,
		lev = 35,
		consume = {
			{
				1,
				50509,
				1,
				5
			}
		},
		base_attr = {
			{
				"hp_max",
				250000
			},
			{
				"atk",
				30000
			},
			{
				"tenacity",
				100
			}
		},
		strengthen_skills = {
			{
				521104,
				521103
			},
			{
				521305,
				521303
			}
		},
		strengthen_attr = {
			{
				"hp_max_per",
				100
			}
		},
		award1 = {
			{
				28908,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		},
		award3 = {
			{
				28908,
				200
			},
			{
				11103,
				224
			},
			{
				11102,
				264
			},
			{
				11101,
				200
			}
		},
		award4 = {
			{
				28908,
				250
			},
			{
				11103,
				280
			},
			{
				11102,
				330
			},
			{
				11101,
				250
			}
		}
	}
}

function Config.PartnerExclusiveData.data_exclusive_upgrade_info_fun(slot0)
	slot1 = Config.PartnerExclusiveData.data_exclusive_upgrade_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.PartnerExclusiveData.data_exclusive_upgrade_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
