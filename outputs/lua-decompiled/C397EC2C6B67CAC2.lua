Config = Config or {}
Config.TrainingCampData = Config.TrainingCampData or {}
Config.TrainingCampData.data_const_length = 7
Config.TrainingCampData.data_const = {
	training_camp_lev_limit = {
		val = 20,
		key = "training_camp_lev_limit",
		desc = "开启条件"
	},
	tips_rule = {
		val = 1,
		key = "tips_rule",
		desc = "1.只有完成全部的初阶训练，才可以进入进阶训练！\n2.为了达到更好的训练效果，我们调整了部分英雄的属性，英雄实际属性请以游戏中实际数据为准！"
	},
	city_tips_cd = {
		val = 60,
		key = "city_tips_cd",
		desc = "主城小助手气泡CD（未完成全部初阶训练）"
	},
	camp_tips_cd = {
		val = 10,
		key = "camp_tips_cd",
		desc = "训练营看板娘气泡CD"
	},
	city_complete_cd = {
		val = 300,
		key = "city_complete_cd",
		desc = "主城小助手气泡CD（已完成全部初阶训练）"
	},
	tips_title = {
		val = 1,
		key = "tips_title",
		desc = "训练结束"
	},
	tips_content = {
		val = 1,
		key = "tips_content",
		desc = "冒险者大人您已完成全部训练，您已经是位成熟的冒险家了；教官需要去训练其他的新晋冒险者，今后的冒险之路要靠您自己从实战中总结经验教训，提升自身实力！&&img1"
	}
}

function Config.TrainingCampData.data_const_fun(slot0)
	slot1 = Config.TrainingCampData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.TrainingCampData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.TrainingCampData.data_info_length = 8
Config.TrainingCampData.data_info = {
	{
		name = "种族克制教学",
		formation = 1,
		type = 1,
		desc = "种族属性之间相互克制，对应克制有伤害加成",
		tips = "风系能克制水系",
		message = "种族克制效果：<div fontcolor=289b14>伤害+25% 命中+20%</div>&&img1&&例如：风种族的英雄对水种族的英雄造成的伤害有25%的加成，且有20%的命中加成&&img2&&img10",
		flag = 0,
		id = 1,
		target_id = 96010,
		partner_id = {
			96011,
			96012,
			96013
		},
		required_partner = {},
		ban_pos = {
			2,
			3,
			4,
			5,
			6
		},
		unlock = {},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "控制教学",
		formation = 1,
		type = 1,
		desc = "冰冻能限制敌方某单位一定回合的行动，让其被动挨打",
		tips = "艾尼路能释放控制",
		message = "img3&&img4&&所有的控制技能都能限制敌方某单位的行动，控制技能包括冰冻、眩晕、石化等；冰冻是成功率最高的控制技能，但被冰冻的目标在受击3次后，将解除冰冻状态\n \n特别注意：若解除冰冻时，该回合已错过该英雄的出手时间（出手时间详情请看出手顺序关卡），则该回合该英雄不会出手&&img11",
		flag = 0,
		id = 2,
		target_id = 96020,
		partner_id = {
			96021,
			96022,
			96023
		},
		required_partner = {
			{
				96029,
				4
			}
		},
		ban_pos = {
			2,
			3,
			5,
			6
		},
		unlock = {
			1
		},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "减益buff教学",
		formation = 1,
		type = 1,
		desc = "减益buff能一定回合内降低某单位一定属性",
		tips = "青雉能使对面防御降低",
		message = "img6&&减益buff能对目标造成一定的影响，比如降低防御、降低输出、受到持续伤害等等\n \n破甲技能能使敌方某目标一定回合内防御力削减，能让我方输出打出更高的伤害&&img12",
		flag = 0,
		id = 3,
		target_id = 96030,
		partner_id = {
			96031,
			96032,
			96033
		},
		required_partner = {
			{
				96039,
				4
			}
		},
		ban_pos = {
			2,
			3,
			5,
			6
		},
		unlock = {
			2
		},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "出手顺序教学",
		formation = 1,
		type = 1,
		desc = "角色的速度属性决定了其在战斗中的出手顺序",
		tips = "艾斯能使对面减速",
		message = "部分英雄的技能可以使对手降速，实现我方慢速的输出英雄能先手进攻。&&img5&&战斗每个回合开始时，将对双方全部英雄的速度进行排序，速度值越大，则排名越前；然后按照速度排名的先后双方英雄依次出手\n \n特别注意：若有多个英雄速度相同，则靠左边的英雄先出手；若靠左程度一样，则战力高的先出手&&img13",
		flag = 0,
		id = 4,
		target_id = 96040,
		partner_id = {
			96041,
			96042,
			96043
		},
		required_partner = {
			{
				96049,
				4
			}
		},
		ban_pos = {
			2,
			3,
			5,
			6
		},
		unlock = {
			3
		},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "增益buff教学",
		formation = 1,
		type = 1,
		desc = "增益buff能一定程度提升我方单位的属性",
		tips = "佩罗娜能提升己方属性",
		message = "img7&&增益buff的对象往往是我方英雄，能够根据技能效果，提升我方单位一定的属性，也能做到让我方英雄造成更多的伤害&&img14",
		flag = 0,
		id = 5,
		target_id = 96050,
		partner_id = {
			96051,
			96052,
			96053
		},
		required_partner = {
			{
				96059,
				4
			}
		},
		ban_pos = {
			2,
			3,
			5,
			6
		},
		unlock = {
			4
		},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "站位教学",
		formation = 4,
		type = 1,
		desc = "合理的站位能规避敌方的重火力进攻",
		tips = "保护输出，避开路飞（请拖动英雄变更站位）",
		message = "img8&&一般而言，我们需要保护我方输出英雄，避开对方的直接攻击，让我方有反击的机会&&img15",
		flag = 0,
		id = 6,
		target_id = 96060,
		partner_id = {
			96051,
			96052,
			96053
		},
		required_partner = {
			{
				96066,
				1
			}
		},
		ban_pos = {
			2,
			3
		},
		unlock = {
			5
		},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "阵法教学",
		formation = 0,
		type = 1,
		desc = "特定的阵法能满足整体站位需求",
		tips = "战魂阵，能让己方三个输出站后排",
		message = "img9&&某些特定的站位需求需要配合特定的阵法才能实现。例如上图，只有天攻阵能让我方三个英雄站在中间一列；同理，只有地绝阵能让我方三个英雄站在最后一列&&img16",
		flag = 1,
		id = 7,
		target_id = 96070,
		partner_id = {},
		required_partner = {
			{
				96075,
				3
			},
			{
				96076,
				2
			},
			{
				96077,
				1
			},
			{
				96078,
				4
			},
			{
				96079,
				5
			}
		},
		ban_pos = {},
		unlock = {
			6
		},
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		name = "阵容教学",
		formation = 1,
		type = 2,
		desc = "了解每个英雄的定位，合理搭配阵容，做到最强输出",
		tips = "乔巴能让己方暴击回血",
		message = [[
合理的阵容搭配要兼顾治疗和输出，考虑英雄之间的协同能力，两位看起来很弱的英雄组合起来产生的化学反应会让人意想不到
 
娜迦公主在我方一速出手可有效提升我方战士的输出；斯芬克斯和黑暗之主第一回合压低对方血量，第二回合大招爆发造成敌方减员；神灵大祭司提供了一定的回复能力
 
那么你能补全这个阵容的最后一块拼图吗？提示，注意生存&&img17]],
		flag = 0,
		id = 8,
		target_id = 96080,
		partner_id = {
			96081,
			96082,
			96083
		},
		required_partner = {
			{
				96086,
				1
			},
			{
				96087,
				4
			},
			{
				96088,
				2
			},
			{
				96089,
				5
			}
		},
		ban_pos = {
			6
		},
		unlock = {
			1,
			2,
			3,
			4,
			5,
			6,
			7
		},
		reward = {
			{
				3,
				100
			}
		}
	}
}

function Config.TrainingCampData.data_info_fun(slot0)
	slot1 = Config.TrainingCampData.data_info[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.TrainingCampData.data_info[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.TrainingCampData.data_city_tips_length = 13
Config.TrainingCampData.data_city_tips = {
	{
		id = 1,
		desc = "这儿有变强攻略哦~"
	},
	{
		id = 2,
		desc = "今天天气真好~"
	},
	{
		id = 3,
		desc = "ヾ(*´∀`)ﾉ 啦啦啦~♪"
	},
	{
		id = 4,
		desc = "良好的策略搭配是\n制胜的关键！"
	},
	{
		id = 5,
		desc = "哼哼~想我了吧？"
	},
	{
		id = 6,
		desc = "你是冒险大陆的希望！"
	},
	{
		id = 7,
		desc = "高输出类英雄往往\n很脆弱，需要坦克\n或辅助英雄保护！"
	},
	{
		id = 8,
		desc = "哼哼，精灵商店中可\n以刷到超便宜的道\n具呢~"
	},
	{
		id = 9,
		desc = "精灵商店和道具商\n城位于商业街中，\n多去逛逛哦！"
	},
	{
		id = 10,
		desc = "别忘了每周的竞技\n场挑战奖励哦~"
	},
	{
		id = 11,
		desc = "锻造屋可以助你打\n造更强力的装备和\n符文！"
	},
	{
		id = 12,
		desc = "精彩活动奖励多多，\n等着你来参与！~"
	},
	{
		id = 13,
		desc = "可从英雄图鉴页面中\n打开【图书馆】，\n浏览所有英雄神明~"
	}
}

function Config.TrainingCampData.data_city_tips_fun(slot0)
	slot1 = Config.TrainingCampData.data_city_tips[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.TrainingCampData.data_city_tips[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.TrainingCampData.data_camp_tips_length = 6
Config.TrainingCampData.data_camp_tips = {
	{
		id = 1,
		desc = "(。・`ω´・)ノ 认真训练！"
	},
	{
		id = 2,
		desc = "哼，今天可不会像昨天那样轻松！"
	},
	{
		id = 3,
		desc = "打起精神来！"
	},
	{
		id = 4,
		desc = "你好，冒险者！"
	},
	{
		id = 5,
		desc = "看，都很简单吧~"
	},
	{
		id = 6,
		desc = "要和我切磋？哈哈，有意思！"
	}
}

function Config.TrainingCampData.data_camp_tips_fun(slot0)
	slot1 = Config.TrainingCampData.data_camp_tips[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.TrainingCampData.data_camp_tips[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
