Config = Config or {}
Config.StrongerData = Config.StrongerData or {}
Config.StrongerData.data_stronger_constant_length = 4
Config.StrongerData.data_stronger_constant = {
	strong_level = {
		val = 10,
		label = "strong_level",
		desc = "进入等级限制"
	},
	guild_skill = {
		val = 500,
		label = "guild_skill",
		desc = "联盟技能评分系数"
	},
	artifact_skill = {
		val = 1000,
		label = "artifact_skill",
		desc = "战技技能评分系数"
	},
	partner_eqm1 = {
		val = 1000,
		label = "partner_eqm1",
		desc = "装备评分系数"
	}
}

function Config.StrongerData.data_stronger_constant_fun(slot0)
	slot1 = Config.StrongerData.data_stronger_constant[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.StrongerData.data_stronger_constant[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.StrongerData.data_stronger_two_length = 7
Config.StrongerData.data_stronger_two = {
	{
		evt_type = 203,
		name = "英雄等级",
		desc = "简单的培养，适合前期发展",
		id = 1,
		icon = 1001,
		sort = 1,
		limit = {
			{
				"lev",
				1
			}
		}
	},
	{
		evt_type = 203,
		name = "装备穿戴",
		desc = "穿戴装备可迅速提升实力",
		id = 2,
		icon = 1006,
		sort = 2,
		limit = {
			{
				"lev",
				1
			}
		}
	},
	{
		evt_type = 203,
		name = "英雄星级",
		desc = "大幅提升战力的关键",
		id = 3,
		icon = 1007,
		sort = 3,
		limit = {
			{
				"lev",
				1
			}
		}
	},
	{
		evt_type = 203,
		name = "英雄进阶",
		desc = "前期提升战力的关键",
		id = 4,
		icon = 1005,
		sort = 4,
		limit = {
			{
				"lev",
				1
			}
		}
	},
	{
		evt_type = 201,
		name = "神技培养",
		desc = "提升神技伤害和属性加成",
		id = 5,
		icon = 1004,
		sort = 5,
		limit = {
			{
				"lev",
				1
			}
		}
	},
	{
		evt_type = 202,
		name = "公会技能",
		desc = "后期最强属性增幅",
		id = 6,
		icon = 1003,
		sort = 6,
		limit = {
			{
				"lev",
				1
			}
		}
	},
	{
		evt_type = 203,
		name = "战技培养",
		desc = "英雄可获额外被动技能",
		id = 7,
		icon = 1002,
		sort = 7,
		limit = {
			{
				"lev",
				1
			}
		}
	}
}

function Config.StrongerData.data_stronger_two_fun(slot0)
	slot1 = Config.StrongerData.data_stronger_two[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.StrongerData.data_stronger_two[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.StrongerData.data_resource_one_length = 8
Config.StrongerData.data_resource_one = {
	{
		name = "贝里",
		evt_type = 0,
		sort = 1,
		id = 1,
		icon = 1,
		desc = "用于升级英雄/神技、商城购买等",
		sub_list = {
			100,
			101,
			102,
			103,
			104,
			105,
			106,
			107,
			108,
			109
		}
	},
	{
		name = "钻石",
		evt_type = 0,
		sort = 2,
		id = 2,
		icon = 3,
		desc = "用于召唤、商城购买物品等",
		sub_list = {
			110,
			112,
			113,
			114,
			115,
			116
		}
	},
	{
		name = "突破卡",
		evt_type = 0,
		sort = 3,
		id = 3,
		icon = 10001,
		desc = "用于进阶英雄",
		sub_list = {
			120,
			121,
			122,
			123,
			124
		}
	},
	{
		name = "英雄碎片",
		evt_type = 0,
		sort = 4,
		id = 4,
		icon = 29999,
		desc = "用于合成英雄",
		sub_list = {
			130,
			131,
			132,
			133,
			134,
			135,
			136,
			137
		}
	},
	{
		name = "英雄经验",
		evt_type = 0,
		sort = 5,
		id = 5,
		icon = 22,
		desc = "用于提升英雄等级",
		sub_list = {
			140,
			141,
			142,
			143,
			144,
			145,
			146
		}
	},
	{
		name = "远航情报",
		evt_type = 0,
		sort = 6,
		id = 6,
		icon = 7,
		desc = "用于参与远航玩法",
		sub_list = {
			150,
			151
		}
	},
	{
		name = "公会贡献",
		evt_type = 0,
		sort = 7,
		id = 7,
		icon = 10,
		desc = "用于升级公会技能、公会商店购买",
		sub_list = {
			170,
			171,
			172,
			173
		}
	},
	{
		name = "神技材料",
		evt_type = 0,
		sort = 8,
		id = 8,
		icon = 72002,
		desc = "用于升级神技及其技能",
		sub_list = {
			180,
			181,
			182
		}
	}
}

function Config.StrongerData.data_resource_one_fun(slot0)
	slot1 = Config.StrongerData.data_resource_one[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.StrongerData.data_resource_one[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.StrongerData.data_resource_two_length = 50
Config.StrongerData.data_resource_two = {
	[100] = {
		evt_type = 157,
		name = "推图挂机",
		sort = 100,
		id = 100,
		icon = 1,
		desc = "通关越多，奖励越多~"
	},
	[101] = {
		evt_type = 160,
		name = "海底监狱",
		sort = 101,
		id = 101,
		icon = 1,
		desc = "参与海底监狱获大量奖励"
	},
	[102] = {
		evt_type = 153,
		name = "无尽试炼",
		sort = 102,
		id = 102,
		icon = 1,
		desc = "参与获大量贝里"
	},
	[103] = {
		evt_type = 132,
		name = "快速作战",
		sort = 103,
		id = 103,
		icon = 1,
		desc = "点击就送贝里啦"
	},
	[104] = {
		evt_type = 162,
		name = "每日点金",
		sort = 104,
		id = 104,
		icon = 1,
		desc = "参与获大量贝里"
	},
	[105] = {
		evt_type = 152,
		name = "日常副本",
		sort = 105,
		id = 105,
		icon = 1,
		desc = "点击就送贝里啦"
	},
	[106] = {
		evt_type = 151,
		name = "长环岛冒险",
		sort = 106,
		id = 106,
		icon = 1,
		desc = "挑战获英雄碎片"
	},
	[107] = {
		evt_type = 407,
		name = "空岛冒险",
		sort = 107,
		id = 107,
		icon = 1,
		desc = "参与获大量贝里"
	},
	[108] = {
		evt_type = 420,
		name = "进阶历练",
		sort = 108,
		id = 108,
		icon = 1,
		desc = "完成进阶历练获贝里奖励"
	},
	[109] = {
		evt_type = 418,
		name = "家园",
		sort = 109,
		id = 109,
		icon = 1,
		desc = "参与家园玩法获大量贝里"
	},
	[110] = {
		evt_type = 158,
		name = "竞技场",
		sort = 110,
		id = 110,
		icon = 3,
		desc = "每日排名结算发钻石啦"
	},
	[111] = {
		evt_type = 130,
		name = "日常成就",
		sort = 111,
		id = 111,
		icon = 3,
		desc = "完成成就获得钻石"
	},
	[112] = {
		evt_type = 126,
		name = "远航悬赏",
		sort = 112,
		id = 112,
		icon = 3,
		desc = "你参与，我们就血亏"
	},
	[113] = {
		evt_type = 157,
		name = "提升等级",
		sort = 113,
		id = 113,
		icon = 3,
		desc = "每次升级都能获钻石奖励"
	},
	[114] = {
		evt_type = 157,
		name = "挂机收益",
		sort = 114,
		id = 114,
		icon = 3,
		desc = "挂机也能得钻石~"
	},
	[115] = {
		evt_type = 420,
		name = "进阶历练",
		sort = 115,
		id = 115,
		icon = 3,
		desc = "完成进阶历练获大量钻石"
	},
	[116] = {
		evt_type = 418,
		name = "家园",
		sort = 116,
		id = 116,
		icon = 3,
		desc = "参与家园玩法获钻石奖励"
	},
	[120] = {
		evt_type = 160,
		name = "海底监狱",
		sort = 120,
		id = 120,
		icon = 10001,
		desc = "突破卡的主要来源之一"
	},
	[121] = {
		evt_type = 134,
		name = "酒吧柜台",
		sort = 121,
		id = 121,
		icon = 10001,
		desc = "可直接购买突破卡"
	},
	[122] = {
		evt_type = 157,
		name = "推图挂机",
		sort = 122,
		id = 122,
		icon = 10001,
		desc = "突破卡的主要来源之一"
	},
	[123] = {
		evt_type = 152,
		name = "日常副本",
		sort = 123,
		id = 123,
		icon = 10001,
		desc = "参与副本获突破卡奖励"
	},
	[124] = {
		evt_type = 407,
		name = "空岛冒险",
		sort = 124,
		id = 124,
		icon = 10001,
		desc = "可直接购买突破卡"
	},
	[130] = {
		evt_type = 157,
		name = "推图挂机",
		sort = 130,
		id = 130,
		icon = 29999,
		desc = "通关领取"
	},
	[131] = {
		evt_type = 126,
		name = "远航悬赏",
		sort = 131,
		id = 131,
		icon = 29999,
		desc = "最高可获5星英雄碎片"
	},
	[132] = {
		evt_type = 151,
		name = "长环岛冒险",
		sort = 132,
		id = 132,
		icon = 29999,
		desc = "可在征战商店中兑换英雄碎片"
	},
	[133] = {
		evt_type = 134,
		name = "酒吧柜台",
		sort = 133,
		id = 133,
		icon = 29999,
		desc = "可购买英雄碎片"
	},
	[134] = {
		evt_type = 204,
		name = "伟大召唤处",
		sort = 134,
		id = 134,
		icon = 29999,
		desc = "抽取4、5星英雄及其碎片"
	},
	[135] = {
		evt_type = 158,
		name = "竞技场",
		sort = 135,
		id = 135,
		icon = 29999,
		desc = "可在竞技商店兑换英雄碎片"
	},
	[136] = {
		evt_type = 407,
		name = "神界冒险",
		sort = 136,
		id = 136,
		icon = 29999,
		desc = "参与玩法获英雄碎片奖励"
	},
	[137] = {
		evt_type = 418,
		name = "家园",
		sort = 137,
		id = 137,
		icon = 29999,
		desc = "参与玩法获英雄碎片"
	},
	[140] = {
		evt_type = 157,
		name = "推图挂机",
		sort = 140,
		id = 140,
		icon = 22,
		desc = "通关越多，奖励越多~"
	},
	[141] = {
		evt_type = 160,
		name = "海底监狱",
		sort = 141,
		id = 141,
		icon = 22,
		desc = "通关和扫荡都能获得英雄经验呢"
	},
	[142] = {
		evt_type = 153,
		name = "无尽试炼",
		sort = 142,
		id = 142,
		icon = 22,
		desc = "参与可获英雄经验"
	},
	[143] = {
		evt_type = 152,
		name = "日常副本",
		sort = 143,
		id = 143,
		icon = 22,
		desc = "每日挑战可获大量经验"
	},
	[144] = {
		evt_type = 132,
		name = "快速作战",
		sort = 144,
		id = 144,
		icon = 22,
		desc = "点击就送经验"
	},
	[145] = {
		evt_type = 134,
		name = "酒吧柜台",
		sort = 145,
		id = 145,
		icon = 22,
		desc = "可直接购买经验哦"
	},
	[146] = {
		evt_type = 407,
		name = "空岛冒险",
		sort = 146,
		id = 146,
		icon = 22,
		desc = "参与玩法获大量英雄经验"
	},
	[150] = {
		evt_type = 157,
		name = "推图挂机",
		sort = 150,
		id = 150,
		icon = 7,
		desc = "通关越多，奖励越多~"
	},
	[151] = {
		evt_type = 132,
		name = "快速作战",
		sort = 151,
		id = 151,
		icon = 7,
		desc = "点击就送啦"
	},
	[160] = {
		evt_type = 126,
		name = "远航悬赏",
		sort = 160,
		id = 160,
		icon = 10454,
		desc = "完成远航获取战技碎片"
	},
	[161] = {
		evt_type = 159,
		name = "冠军赛",
		sort = 161,
		id = 161,
		icon = 10454,
		desc = "高级战技等你来拿"
	},
	[162] = {
		evt_type = 161,
		name = "战技合成",
		sort = 161,
		id = 162,
		icon = 10454,
		desc = "低级战技合成高级战技"
	},
	[163] = {
		evt_type = 157,
		name = "挂机掉落",
		sort = 161,
		id = 163,
		icon = 10454,
		desc = "掉落大量低级战技"
	},
	[170] = {
		evt_type = 145,
		name = "公会捐献",
		sort = 170,
		id = 170,
		icon = 10,
		desc = "捐献可直接获得奖励哦"
	},
	[171] = {
		evt_type = 146,
		name = "公会副本",
		sort = 171,
		id = 171,
		icon = 10,
		desc = "挑战Boss获贡献奖励~"
	},
	[172] = {
		evt_type = 419,
		name = "公会活跃任务",
		sort = 172,
		id = 172,
		icon = 10,
		desc = "完成活跃任务获贡献奖励"
	},
	[173] = {
		evt_type = 419,
		name = "公会战",
		sort = 173,
		id = 173,
		icon = 10,
		desc = "参与获大量贡献奖励"
	},
	[180] = {
		evt_type = 130,
		name = "成就",
		sort = 180,
		id = 180,
		icon = 72001,
		desc = "可获神技精石和神技魂石"
	},
	[181] = {
		evt_type = 151,
		name = "长环岛冒险",
		sort = 181,
		id = 181,
		icon = 72001,
		desc = "可在征战商城中兑换神技精石"
	},
	[182] = {
		evt_type = 407,
		name = "空岛冒险",
		sort = 182,
		id = 182,
		icon = 72001,
		desc = "参与获神技精石奖励"
	}
}

function Config.StrongerData.data_resource_two_fun(slot0)
	slot1 = Config.StrongerData.data_resource_two[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.StrongerData.data_resource_two[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.StrongerData.data_recommand_length = 6
Config.StrongerData.data_recommand = {
	{
		desc = "<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>鬼索、狼刑、和之国·路飞</div>\n满星尼卡置换满星鬼索，最强毕业阵容，三辅助25星效果最好",
		name = "最强输出",
		id = 1,
		limit = 0,
		sort = 100,
		hero_list = {
			{
				70532,
				90527,
				70544,
				70527,
				70523,
				70506
			}
		}
	},
	{
		desc = "<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>鬼索、尼卡、和之国·路飞</div>\n满星尼卡置换满星鬼索，三辅助25星效果最好",
		name = "鬼索单核",
		id = 2,
		limit = 0,
		sort = 101,
		hero_list = {
			{
				70532,
				70504,
				70544,
				70527,
				70523,
				70506
			}
		}
	},
	{
		desc = "<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>玲玲、尼卡、和之国·路飞</div>\n满星尼卡置换满星和路，狼刑+玲玲，三辅助25星效果最好",
		name = "免控强杀流",
		id = 3,
		limit = 0,
		sort = 102,
		hero_list = {
			{
				70543,
				90527,
				70544,
				70527,
				70523,
				70506
			}
		}
	},
	{
		desc = "<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>狼刑、和之国·路飞</div>\n满星尼卡置换满星和路，狼刑，桃兔满星，三辅助25星效果最好",
		name = "平民单核",
		id = 4,
		limit = 0,
		sort = 103,
		hero_list = {
			{
				40513,
				90527,
				70544,
				70527,
				70523,
				70506
			}
		}
	},
	{
		desc = "<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>山治、士力架</div>\n山治必须满星，其余伙伴星级越高越好，必备霸气铁甲反伤",
		name = "反伤护甲流",
		id = 5,
		limit = 0,
		sort = 104,
		hero_list = {
			{
				70511,
				70515,
				70522,
				70506,
				70528,
				70527
			}
		}
	},
	{
		desc = "<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>路飞</div>\n强度从高到低，刷海底监狱公会boss必备，百分比伤害+复活",
		name = "PVE专用",
		id = 6,
		limit = 0,
		sort = 105,
		hero_list = {
			{
				70531,
				70544,
				70527,
				70543,
				40513,
				10513
			}
		}
	}
}

function Config.StrongerData.data_recommand_fun(slot0)
	slot1 = Config.StrongerData.data_recommand[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.StrongerData.data_recommand[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.StrongerData.data_problem_length = 8
Config.StrongerData.data_problem = {
	{
		id = 1,
		name = "怎样选择上阵英雄？",
		sort = 1,
		desc = [[
<div fontcolor=#249003>  →注意职业搭配：</div>
一个完整的阵容一般可由<div fontcolor=#249003>坦克英雄</div>（负责保护控制）；<div fontcolor=#249003>战士、法师英雄</div>（负责制造伤害）；<div fontcolor=#249003>辅助英雄</div>（负责治疗增益）这三部分组成
<div fontcolor=#249003>  →注意阵营克制：</div>
阵营克制效果会在战斗中带来可观的伤害加成，根据敌方阵营合理选择其克制阵营也是胜利的关键
<div fontcolor=#249003>  →注意阵型搭配：</div>
上阵指定阵营的英雄也可在战斗中获得属性加成，根据自己已有的英雄合理搭配阵型也能大幅提高胜率呢；具体搭配可在[英雄出战]面板中点击阵营图标查看
<div fontcolor=#249003>  →注意技能组合：</div>
大部分英雄的技能是可以相互配合的。例如乌索普的[火鸟星]给敌方附加<div fontcolor=#249003>出血</div>状态，而索隆(伟大航路)的[犀回]则必定<div fontcolor=#249003>对出血单位造成暴击伤害</div>。还有更多厉害的组合等你去发掘~]]
	},
	{
		id = 2,
		name = "如何选择阵法？",
		sort = 6,
		desc = [[
<div fontcolor=#249003>  →根据我方英雄职业：</div>
可根据实际上阵的英雄职业决定。例如上阵了<div fontcolor=#249003>2个肉盾型英雄</div>，推荐使用<div fontcolor=#249003>圣灵阵</div>，从而加强对我方其他英雄的保护
<div fontcolor=#249003>  →根据对手的阵容：</div>
还可根据对手上阵的英雄来决定。对于某些特定的AOE伤害（如鳄鱼的沙暴：攻击敌方前两排所有英雄），通过<div fontcolor=#249003>调整站位</div>来规避此类控制技能
<div fontcolor=#249003>  →更换阵法：</div>
若遇到打不过的战斗，调整阵法再战可能会有奇效哦]]
	},
	{
		id = 3,
		name = "如何给英雄升星？",
		sort = 2,
		desc = [[
<div fontcolor=#249003>→升星的好处：</div>
  升星能大幅提升英雄的属性；同时升星也是提升英雄技能等级的唯一途径
<div fontcolor=#249003>→如何升星：</div>
  前往主城界面中的[融合神殿]，选择你想升星的英雄，根据提示放入其他指定英雄就可以升星啦；6星英雄可在英雄培养界面中直接进行升星操作哦~
<div fontcolor=#249003>→友情提示：</div>
  因为一股神秘的力量，导致不是所有英雄都能升到最高星级呢，培养英雄的时候可要注意啦]]
	},
	{
		id = 4,
		name = "如何让我的小伙伴快速成长？",
		sort = 3,
		desc = [[
<div fontcolor=#249003>  →</div>每日免费的<div fontcolor=#249003>召唤、点金和快速作战</div>千万别错过啦
<div fontcolor=#249003>  →</div>每日可在<div fontcolor=#249003>历练</div>中挑战日常副本、参与各种玩法可获得各种收益
<div fontcolor=#249003>  →</div>每日在竞技场给排行榜中的玩家点赞也可获得贝里哦
<div fontcolor=#249003>  →</div>加入联盟，消耗贡献学习联盟技能也能让英雄获得极大的提升
<div fontcolor=#249003>  →</div>最重要的[挂机收益]可别忘记每天上线领取哦~]]
	},
	{
		id = 5,
		name = "英雄的各种技能效果有什么作用？",
		sort = 7,
		desc = [[
1.出血、流血、缓伤、中毒
   每回合受到固定伤害，叠加的层数越多，伤害越高
2.迟缓、石化、迟缓、睡眠、麻痹
   英雄无法行动
3.封印
   携带该状态的单位无法产生暴击，被动技能无法触发
4.虚弱
   携带该状态的单位停止行动1回合，该状态不可叠加
5.沉默
   携带该状态的单位无法使用技能
6.嘲讽
   携带该状态的单位将强制只用普攻攻击嘲讽者
7.技能效果的命中率
   技能效果的实际命中率=效果命中属性-效果抵抗属性
8.Buff的叠加规则
   同类Buff默认不叠加，可叠加的Buff将在Buff描述中特殊说明；
   某些Buff在与其他同类Buff共存时只生效最强的1个（例如破甲），且预览中只显示其中1层（因此当英雄身上其中1层该类Buff被“驱散”或“嫁祸转移”后，依然会显示1层）]]
	},
	{
		id = 6,
		name = "战斗中英雄的出手顺序是怎样的？",
		sort = 8,
		desc = "<div fontcolor=#249003>→出手顺序</div>\n每回合开始时，根据场中单位<div fontcolor=#249003>速度高低</div>，决定本回合的出手顺序，过程中改变速度，会在下一回合开始时影响出手顺序\n（注：艾斯战斗开始时的减速，第一回合就会生效）"
	},
	{
		id = 7,
		name = "如何快速提升角色升级？",
		sort = 4,
		desc = [[
<div fontcolor=#249003>→角色经验的获取：</div>
  剧情战斗、剧情挂机和快速作战是获取角色经验的唯一途径，达到的关卡数越高，挂机获得的角色经验越多
<div fontcolor=#249003>→快速作战相关：</div>
  快速作战可<div fontcolor=#249003>直接获得120分钟的挂机收益</div>，是获得角色经验的捷径哦
<div fontcolor=#249003>→特别提示：</div>
  Vip等级越高，每次挂机获得的各项收益也就越高哦；购买<div fontcolor=#249003>快速作战特权</div>后每日可获得3次免费快速作战次数，还能额外购买11次作速作战，想要快速升级的船长大人千万不能错过啦]]
	},
	{
		id = 8,
		name = "钻石如何使用性价比最高？",
		sort = 5,
		desc = [[
<div fontcolor=#249003>→快速作战：</div>
  每次快速作战都能直接获得120分钟的挂机收益，小助手建议每日都买满哦~
<div fontcolor=#249003>→日常副本：</div>
  使用钻石购买日常副本次数也是很划算的哦
<div fontcolor=#249003>→远航订单：</div>
  若遇到不想要远航订单，那就放心用钻石去刷新吧，更好的奖励等着你呢
<div fontcolor=#249003>→公会副本：</div>
  购买次数加速副本的推进，从而更快的获得公会贡献哦，另外自己的伤害排名越高，获得的公会贡献也越多呢
<div fontcolor=#249003>→特别提示：</div>
  特权商城的远航礼包一定要记得购买哦；达到VIP2后每日还能购买超值高级召唤卷1个~]]
	}
}

function Config.StrongerData.data_problem_fun(slot0)
	slot1 = Config.StrongerData.data_problem[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.StrongerData.data_problem[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
