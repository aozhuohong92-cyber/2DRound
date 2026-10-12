Config = Config or {}
Config.RecruitHolidayLuckyData = Config.RecruitHolidayLuckyData or {}
Config.RecruitHolidayLuckyData.data_const_length = 3
Config.RecruitHolidayLuckyData.data_const = {
	common_s = {
		val = 10408,
		key = "common_s",
		desc = "召唤道具ID"
	},
	common_time = {
		val = 1,
		key = "common_time",
		desc = "特殊召唤每天免费次数"
	},
	c_interval = {
		val = 86400,
		key = "c_interval",
		desc = "普通召唤免费次数间隔/s"
	}
}

function Config.RecruitHolidayLuckyData.data_const_fun(slot0)
	slot1 = Config.RecruitHolidayLuckyData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayLuckyData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayLuckyData.data_action_length = 1
Config.RecruitHolidayLuckyData.data_action = {
	[50051] = {
		group_id = 50051,
		camp_id = 50051,
		desc = [[
1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄
2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>
3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。
4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；
5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；
6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；]]
	}
}

function Config.RecruitHolidayLuckyData.data_action_fun(slot0)
	slot1 = Config.RecruitHolidayLuckyData.data_action[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayLuckyData.data_action[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayLuckyData.data_summon_length = 1
Config.RecruitHolidayLuckyData.data_summon = {
	[50051] = {
		name = "精英召唤",
		action_name = "action",
		call_bg_action = 147,
		action_card_name = "action2",
		call_bg_card = "",
		call_bg = "txt_cn_elitesummon_20",
		group_id = 50051,
		res_id = 2,
		gain_once = {
			{
				22,
				5000
			}
		},
		gain_ten = {
			{
				22,
				50000
			}
		},
		loss_gold_once = {
			{
				3,
				22000000000.0
			}
		},
		loss_gold_ten = {
			{
				3,
				22000000000.0
			}
		},
		loss_item_once = {
			{
				10408,
				1
			}
		},
		loss_item_ten = {
			{
				10408,
				10
			}
		}
	}
}

function Config.RecruitHolidayLuckyData.data_summon_fun(slot0)
	slot1 = Config.RecruitHolidayLuckyData.data_summon[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RecruitHolidayLuckyData.data_summon[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RecruitHolidayLuckyData.data_award_length = 1
Config.RecruitHolidayLuckyData.data_award = {
	[50051] = {
		{
			camp_id = 50051,
			id = 1,
			times = 30,
			reward = {
				{
					10408,
					3
				}
			},
			self_reward = {}
		},
		{
			camp_id = 50051,
			id = 2,
			times = 50,
			reward = {
				{
					29905,
					50
				}
			},
			self_reward = {}
		},
		{
			camp_id = 50051,
			id = 3,
			times = 100,
			reward = {
				{
					26909,
					50
				}
			},
			self_reward = {}
		},
		{
			camp_id = 50051,
			id = 4,
			times = 200,
			reward = {
				{
					27911,
					50
				}
			},
			self_reward = {}
		},
		{
			camp_id = 50051,
			id = 5,
			times = 300,
			reward = {
				{
					641231,
					1
				}
			},
			self_reward = {}
		}
	}
}
Config.RecruitHolidayLuckyData.data_probability_length = 1
Config.RecruitHolidayLuckyData.data_probability = {
	[50051] = {
		{
			num = 0,
			name = "光暗英雄",
			probability = "0.76",
			index = 1,
			is_chip = 0,
			is_up = 1,
			id = 0,
			group_id = 50051,
			star = "5星"
		},
		{
			num = 0,
			name = "风水火英雄",
			probability = "1",
			index = 2,
			is_chip = 0,
			is_up = 1,
			id = 0,
			group_id = 50051,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星（up英雄为光暗时）",
			probability = "4.24",
			index = 3,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 50051,
			star = "5星"
		},
		{
			num = 0,
			name = "其他5星（up英雄为风水火时）",
			probability = "4",
			index = 4,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 50051,
			star = "5星"
		},
		{
			num = 0,
			name = "4星英雄",
			probability = "15",
			index = 5,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 50051,
			star = "4星"
		},
		{
			num = 0,
			name = "3星英雄",
			probability = "80",
			index = 6,
			is_chip = 0,
			is_up = 0,
			id = 0,
			group_id = 50051,
			star = "3星"
		}
	}
}
Config.RecruitHolidayLuckyData.data_hero_show_length = 3
Config.RecruitHolidayLuckyData.data_hero_show = {
	[10001] = {
		[24400] = {
			group_id = 10001,
			name = "娜迦公主",
			probability = "0.037",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 10001,
			name = "冰雪女王",
			probability = "0.037",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 10001,
			name = "冰霜巨龙",
			probability = "0.037",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 10001,
			name = "泰坦",
			probability = "0.015",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 10001,
			name = "波塞冬",
			probability = "0.015",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 10001,
			name = "派西斯",
			probability = "0.185",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 10001,
			name = "少年梅林",
			probability = "0.037",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 10001,
			name = "海宁芙",
			probability = "0.085",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 10001,
			name = "阿瑞斯",
			probability = "0.185",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 10001,
			name = "耶梦加得",
			probability = "0.015",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 10001,
			name = "酒神",
			probability = "0.015",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 10001,
			name = "炽天使",
			probability = "0.037",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 10001,
			name = "炎魔之王",
			probability = "0.037",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 10001,
			name = "剑豪卡赞",
			probability = "0.185",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 10001,
			name = "菲尼克斯",
			probability = "0.037",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 10001,
			name = "阿波罗",
			probability = "0.037",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 10001,
			name = "吸血伯爵",
			probability = "0.185",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 10001,
			name = "普罗米修斯",
			probability = "0.78",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 10001,
			name = "瓦尔基里",
			probability = "0.015",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 10001,
			name = "洛基",
			probability = "0.015",
			id = 25408,
			num = 1
		},
		[25409] = {
			group_id = 10001,
			name = "哪吒",
			probability = "0.015",
			id = 25409,
			num = 1
		},
		[25410] = {
			group_id = 10001,
			name = "海姆达尔",
			probability = "0.015",
			id = 25410,
			num = 1
		},
		[26400] = {
			group_id = 10001,
			name = "奥丁",
			probability = "0.037",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 10001,
			name = "影刹",
			probability = "0.015",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 10001,
			name = "凯兰崔尔",
			probability = "0.185",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 10001,
			name = "魅魔女王",
			probability = "0.037",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 10001,
			name = "美杜莎",
			probability = "0.186",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 10001,
			name = "雅典娜",
			probability = "0.037",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 10001,
			name = "潘",
			probability = "0.015",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 10001,
			name = "斯芬克斯",
			probability = "0.78",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 10001,
			name = "芬尼尔",
			probability = "0.015",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 10001,
			name = "拉塔托斯克",
			probability = "0.015",
			id = 26409,
			num = 1
		},
		[26410] = {
			group_id = 10001,
			name = "辛西娅",
			probability = "0.015",
			id = 26410,
			num = 1
		},
		[27400] = {
			group_id = 10001,
			name = "伊西斯",
			probability = "0.075",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 10001,
			name = "宙斯",
			probability = "0.01",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 10001,
			name = "赫拉",
			probability = "0.058",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 10001,
			name = "雷神",
			probability = "0.058",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 10001,
			name = "盖亚",
			probability = "0.075",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 10001,
			name = "艾蕾莉亚",
			probability = "0.058",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 10001,
			name = "神灵大祭司",
			probability = "0.01",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 10001,
			name = "拉斐尔",
			probability = "0.01",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 10001,
			name = "维纳斯",
			probability = "0.01",
			id = 27408,
			num = 1
		},
		[27409] = {
			group_id = 10001,
			name = "加百列",
			probability = "0.94",
			id = 27409,
			num = 1
		},
		[28400] = {
			group_id = 10001,
			name = "蛇女墨莎",
			probability = "0.075",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 10001,
			name = "哈迪斯",
			probability = "0.01",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 10001,
			name = "亚巴顿",
			probability = "0.058",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 10001,
			name = "黑暗之主",
			probability = "0.01",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 10001,
			name = "阿努比斯",
			probability = "0.058",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 10001,
			name = "路西法",
			probability = "0.075",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 10001,
			name = "潘多拉",
			probability = "0.01",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 10001,
			name = "海拉",
			probability = "0.01",
			id = 28407,
			num = 1
		},
		[28408] = {
			group_id = 10001,
			name = "尼德霍格",
			probability = "0.01",
			id = 28408,
			num = 1
		},
		[28409] = {
			group_id = 10001,
			name = "阿蒙",
			probability = "0.01",
			id = 28409,
			num = 1
		},
		[24300] = {
			group_id = 10001,
			name = "亚瑟",
			probability = "0.66",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 10001,
			name = "竖琴海妖",
			probability = "0.67",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 10001,
			name = "水元素",
			probability = "0.67",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 10001,
			name = "冰晶女巫",
			probability = "0.67",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 10001,
			name = "娜迦侍女",
			probability = "0.67",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 10001,
			name = "火枪艾克",
			probability = "0.67",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 10001,
			name = "凯瑟琳",
			probability = "0.67",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 10001,
			name = "阿伽门农",
			probability = "0.67",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 10001,
			name = "雷诺蛮锤",
			probability = "0.67",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 10001,
			name = "翼女",
			probability = "0.67",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 10001,
			name = "吟游诗人",
			probability = "0.67",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 10001,
			name = "亡灵收割者",
			probability = "0.67",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 10001,
			name = "圣锤提尔",
			probability = "0.67",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 10001,
			name = "甘道夫",
			probability = "0.67",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 10001,
			name = "德鲁伊",
			probability = "0.67",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 10001,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 10001,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 10001,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 10001,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 10001,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 10001,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 10001,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 10001,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 10001,
			name = "魔法女学徒",
			probability = "4.8",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 10001,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 10001,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 10001,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 10001,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 10001,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 10001,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 10001,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 10001,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 10001,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 10001,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 10001,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 10001,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 10001,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 10001,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 10001,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 10001,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[10006] = {
		[24400] = {
			group_id = 10006,
			name = "娜迦公主",
			probability = "0.037",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 10006,
			name = "冰雪女王",
			probability = "0.015",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 10006,
			name = "冰霜巨龙",
			probability = "0.037",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 10006,
			name = "泰坦",
			probability = "0.015",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 10006,
			name = "波塞冬",
			probability = "0.78",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 10006,
			name = "派西斯",
			probability = "0.185",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 10006,
			name = "少年梅林",
			probability = "0.037",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 10006,
			name = "海宁芙",
			probability = "0.185",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 10006,
			name = "阿瑞斯",
			probability = "0.185",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 10006,
			name = "耶梦加得",
			probability = "0.015",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 10006,
			name = "酒神",
			probability = "0.015",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 10006,
			name = "炽天使",
			probability = "0.037",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 10006,
			name = "炎魔之王",
			probability = "0.037",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 10006,
			name = "剑豪卡赞",
			probability = "0.185",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 10006,
			name = "菲尼克斯",
			probability = "0.037",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 10006,
			name = "阿波罗",
			probability = "0.037",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 10006,
			name = "吸血伯爵",
			probability = "0.185",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 10006,
			name = "普罗米修斯",
			probability = "0.037",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 10006,
			name = "瓦尔基里",
			probability = "0.015",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 10006,
			name = "洛基",
			probability = "0.015",
			id = 25408,
			num = 1
		},
		[26400] = {
			group_id = 10006,
			name = "奥丁",
			probability = "0.037",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 10006,
			name = "影刹",
			probability = "0.015",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 10006,
			name = "凯兰崔尔",
			probability = "0.185",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 10006,
			name = "魅魔女王",
			probability = "0.037",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 10006,
			name = "美杜莎",
			probability = "0.186",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 10006,
			name = "雅典娜",
			probability = "0.037",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 10006,
			name = "潘",
			probability = "0.78",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 10006,
			name = "斯芬克斯",
			probability = "0.015",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 10006,
			name = "芬尼尔",
			probability = "0.015",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 10006,
			name = "拉塔托斯克",
			probability = "0.015",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 10006,
			name = "伊西斯",
			probability = "0.075",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 10006,
			name = "宙斯",
			probability = "0.01",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 10006,
			name = "赫拉",
			probability = "0.058",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 10006,
			name = "雷神",
			probability = "0.058",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 10006,
			name = "盖亚",
			probability = "0.075",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 10006,
			name = "艾蕾莉亚",
			probability = "0.058",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 10006,
			name = "神灵大祭司",
			probability = "0.01",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 10006,
			name = "拉斐尔",
			probability = "0.01",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 10006,
			name = "维纳斯",
			probability = "0.01",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 10006,
			name = "蛇女墨莎",
			probability = "0.075",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 10006,
			name = "哈迪斯",
			probability = "0.01",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 10006,
			name = "亚巴顿",
			probability = "0.058",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 10006,
			name = "黑暗之主",
			probability = "0.01",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 10006,
			name = "阿努比斯",
			probability = "0.058",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 10006,
			name = "路西法",
			probability = "0.075",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 10006,
			name = "潘多拉",
			probability = "0.01",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 10006,
			name = "海拉",
			probability = "0.94",
			id = 28407,
			num = 1
		},
		[24300] = {
			group_id = 10006,
			name = "亚瑟",
			probability = "0.66",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 10006,
			name = "竖琴海妖",
			probability = "0.67",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 10006,
			name = "水元素",
			probability = "0.67",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 10006,
			name = "冰晶女巫",
			probability = "0.67",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 10006,
			name = "娜迦侍女",
			probability = "0.67",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 10006,
			name = "火枪艾克",
			probability = "0.67",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 10006,
			name = "凯瑟琳",
			probability = "0.67",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 10006,
			name = "阿伽门农",
			probability = "0.67",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 10006,
			name = "雷诺蛮锤",
			probability = "0.67",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 10006,
			name = "翼女",
			probability = "0.67",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 10006,
			name = "吟游诗人",
			probability = "0.67",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 10006,
			name = "亡灵收割者",
			probability = "0.67",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 10006,
			name = "圣锤提尔",
			probability = "0.67",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 10006,
			name = "甘道夫",
			probability = "0.67",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 10006,
			name = "德鲁伊",
			probability = "0.67",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 10006,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 10006,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 10006,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 10006,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 10006,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 10006,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 10006,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 10006,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 10006,
			name = "魔法女学徒",
			probability = "4.8",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 10006,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 10006,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 10006,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 10006,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 10006,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 10006,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 10006,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 10006,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 10006,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 10006,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 10006,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 10006,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 10006,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 10006,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 10006,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 10006,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	},
	[10010] = {
		[24400] = {
			group_id = 10010,
			name = "娜迦公主",
			probability = "0.037",
			id = 24400,
			num = 1
		},
		[24401] = {
			group_id = 10010,
			name = "冰雪女王",
			probability = "0.015",
			id = 24401,
			num = 1
		},
		[24402] = {
			group_id = 10010,
			name = "冰霜巨龙",
			probability = "0.037",
			id = 24402,
			num = 1
		},
		[24403] = {
			group_id = 10010,
			name = "泰坦",
			probability = "0.015",
			id = 24403,
			num = 1
		},
		[24404] = {
			group_id = 10010,
			name = "波塞冬",
			probability = "0.78",
			id = 24404,
			num = 1
		},
		[24405] = {
			group_id = 10010,
			name = "派西斯",
			probability = "0.185",
			id = 24405,
			num = 1
		},
		[24406] = {
			group_id = 10010,
			name = "少年梅林",
			probability = "0.037",
			id = 24406,
			num = 1
		},
		[24407] = {
			group_id = 10010,
			name = "海宁芙",
			probability = "0.185",
			id = 24407,
			num = 1
		},
		[24408] = {
			group_id = 10010,
			name = "阿瑞斯",
			probability = "0.185",
			id = 24408,
			num = 1
		},
		[24409] = {
			group_id = 10010,
			name = "耶梦加得",
			probability = "0.015",
			id = 24409,
			num = 1
		},
		[24410] = {
			group_id = 10010,
			name = "酒神",
			probability = "0.015",
			id = 24410,
			num = 1
		},
		[25400] = {
			group_id = 10010,
			name = "炽天使",
			probability = "0.037",
			id = 25400,
			num = 1
		},
		[25401] = {
			group_id = 10010,
			name = "炎魔之王",
			probability = "0.037",
			id = 25401,
			num = 1
		},
		[25402] = {
			group_id = 10010,
			name = "剑豪卡赞",
			probability = "0.185",
			id = 25402,
			num = 1
		},
		[25403] = {
			group_id = 10010,
			name = "菲尼克斯",
			probability = "0.037",
			id = 25403,
			num = 1
		},
		[25404] = {
			group_id = 10010,
			name = "阿波罗",
			probability = "0.037",
			id = 25404,
			num = 1
		},
		[25405] = {
			group_id = 10010,
			name = "吸血伯爵",
			probability = "0.185",
			id = 25405,
			num = 1
		},
		[25406] = {
			group_id = 10010,
			name = "普罗米修斯",
			probability = "0.037",
			id = 25406,
			num = 1
		},
		[25407] = {
			group_id = 10010,
			name = "瓦尔基里",
			probability = "0.015",
			id = 25407,
			num = 1
		},
		[25408] = {
			group_id = 10010,
			name = "洛基",
			probability = "0.015",
			id = 25408,
			num = 1
		},
		[26400] = {
			group_id = 10010,
			name = "奥丁",
			probability = "0.037",
			id = 26400,
			num = 1
		},
		[26401] = {
			group_id = 10010,
			name = "影刹",
			probability = "0.015",
			id = 26401,
			num = 1
		},
		[26402] = {
			group_id = 10010,
			name = "凯兰崔尔",
			probability = "0.185",
			id = 26402,
			num = 1
		},
		[26403] = {
			group_id = 10010,
			name = "魅魔女王",
			probability = "0.037",
			id = 26403,
			num = 1
		},
		[26404] = {
			group_id = 10010,
			name = "美杜莎",
			probability = "0.186",
			id = 26404,
			num = 1
		},
		[26405] = {
			group_id = 10010,
			name = "雅典娜",
			probability = "0.037",
			id = 26405,
			num = 1
		},
		[26406] = {
			group_id = 10010,
			name = "潘",
			probability = "0.78",
			id = 26406,
			num = 1
		},
		[26407] = {
			group_id = 10010,
			name = "斯芬克斯",
			probability = "0.015",
			id = 26407,
			num = 1
		},
		[26408] = {
			group_id = 10010,
			name = "芬尼尔",
			probability = "0.015",
			id = 26408,
			num = 1
		},
		[26409] = {
			group_id = 10010,
			name = "拉塔托斯克",
			probability = "0.015",
			id = 26409,
			num = 1
		},
		[27400] = {
			group_id = 10010,
			name = "伊西斯",
			probability = "0.075",
			id = 27400,
			num = 1
		},
		[27401] = {
			group_id = 10010,
			name = "宙斯",
			probability = "0.01",
			id = 27401,
			num = 1
		},
		[27402] = {
			group_id = 10010,
			name = "赫拉",
			probability = "0.058",
			id = 27402,
			num = 1
		},
		[27403] = {
			group_id = 10010,
			name = "雷神",
			probability = "0.058",
			id = 27403,
			num = 1
		},
		[27404] = {
			group_id = 10010,
			name = "盖亚",
			probability = "0.075",
			id = 27404,
			num = 1
		},
		[27405] = {
			group_id = 10010,
			name = "艾蕾莉亚",
			probability = "0.058",
			id = 27405,
			num = 1
		},
		[27406] = {
			group_id = 10010,
			name = "神灵大祭司",
			probability = "0.01",
			id = 27406,
			num = 1
		},
		[27407] = {
			group_id = 10010,
			name = "拉斐尔",
			probability = "0.01",
			id = 27407,
			num = 1
		},
		[27408] = {
			group_id = 10010,
			name = "维纳斯",
			probability = "0.01",
			id = 27408,
			num = 1
		},
		[28400] = {
			group_id = 10010,
			name = "蛇女墨莎",
			probability = "0.075",
			id = 28400,
			num = 1
		},
		[28401] = {
			group_id = 10010,
			name = "哈迪斯",
			probability = "0.01",
			id = 28401,
			num = 1
		},
		[28402] = {
			group_id = 10010,
			name = "亚巴顿",
			probability = "0.058",
			id = 28402,
			num = 1
		},
		[28403] = {
			group_id = 10010,
			name = "黑暗之主",
			probability = "0.01",
			id = 28403,
			num = 1
		},
		[28404] = {
			group_id = 10010,
			name = "阿努比斯",
			probability = "0.058",
			id = 28404,
			num = 1
		},
		[28405] = {
			group_id = 10010,
			name = "路西法",
			probability = "0.075",
			id = 28405,
			num = 1
		},
		[28406] = {
			group_id = 10010,
			name = "潘多拉",
			probability = "0.01",
			id = 28406,
			num = 1
		},
		[28407] = {
			group_id = 10010,
			name = "海拉",
			probability = "0.94",
			id = 28407,
			num = 1
		},
		[24300] = {
			group_id = 10010,
			name = "亚瑟",
			probability = "0.66",
			id = 24300,
			num = 1
		},
		[24301] = {
			group_id = 10010,
			name = "竖琴海妖",
			probability = "0.67",
			id = 24301,
			num = 1
		},
		[24302] = {
			group_id = 10010,
			name = "水元素",
			probability = "0.67",
			id = 24302,
			num = 1
		},
		[24303] = {
			group_id = 10010,
			name = "冰晶女巫",
			probability = "0.67",
			id = 24303,
			num = 1
		},
		[24304] = {
			group_id = 10010,
			name = "娜迦侍女",
			probability = "0.67",
			id = 24304,
			num = 1
		},
		[25300] = {
			group_id = 10010,
			name = "火枪艾克",
			probability = "0.67",
			id = 25300,
			num = 1
		},
		[25301] = {
			group_id = 10010,
			name = "凯瑟琳",
			probability = "0.67",
			id = 25301,
			num = 1
		},
		[25302] = {
			group_id = 10010,
			name = "阿伽门农",
			probability = "0.67",
			id = 25302,
			num = 1
		},
		[25303] = {
			group_id = 10010,
			name = "雷诺蛮锤",
			probability = "0.67",
			id = 25303,
			num = 1
		},
		[25304] = {
			group_id = 10010,
			name = "翼女",
			probability = "0.67",
			id = 25304,
			num = 1
		},
		[26300] = {
			group_id = 10010,
			name = "吟游诗人",
			probability = "0.67",
			id = 26300,
			num = 1
		},
		[26301] = {
			group_id = 10010,
			name = "亡灵收割者",
			probability = "0.67",
			id = 26301,
			num = 1
		},
		[26302] = {
			group_id = 10010,
			name = "圣锤提尔",
			probability = "0.67",
			id = 26302,
			num = 1
		},
		[26303] = {
			group_id = 10010,
			name = "甘道夫",
			probability = "0.67",
			id = 26303,
			num = 1
		},
		[26304] = {
			group_id = 10010,
			name = "德鲁伊",
			probability = "0.67",
			id = 26304,
			num = 1
		},
		[27300] = {
			group_id = 10010,
			name = "光明牧师",
			probability = "0.62",
			id = 27300,
			num = 1
		},
		[27301] = {
			group_id = 10010,
			name = "月之祭司",
			probability = "0.62",
			id = 27301,
			num = 1
		},
		[27302] = {
			group_id = 10010,
			name = "精灵王子",
			probability = "0.62",
			id = 27302,
			num = 1
		},
		[27303] = {
			group_id = 10010,
			name = "丘比特",
			probability = "0.62",
			id = 27303,
			num = 1
		},
		[28300] = {
			group_id = 10010,
			name = "毒咒女巫",
			probability = "0.62",
			id = 28300,
			num = 1
		},
		[28301] = {
			group_id = 10010,
			name = "死亡骑士",
			probability = "0.62",
			id = 28301,
			num = 1
		},
		[28302] = {
			group_id = 10010,
			name = "阿喀琉斯",
			probability = "0.62",
			id = 28302,
			num = 1
		},
		[28303] = {
			group_id = 10010,
			name = "黑精灵密言",
			probability = "0.62",
			id = 28303,
			num = 1
		},
		[24200] = {
			group_id = 10010,
			name = "魔法女学徒",
			probability = "4.8",
			id = 24200,
			num = 1
		},
		[24201] = {
			group_id = 10010,
			name = "美狄亚",
			probability = "4.7",
			id = 24201,
			num = 1
		},
		[24202] = {
			group_id = 10010,
			name = "破坏者",
			probability = "4.7",
			id = 24202,
			num = 1
		},
		[24203] = {
			group_id = 10010,
			name = "咒法师",
			probability = "4.7",
			id = 24203,
			num = 1
		},
		[24204] = {
			group_id = 10010,
			name = "月之骑士",
			probability = "4.7",
			id = 24204,
			num = 1
		},
		[25200] = {
			group_id = 10010,
			name = "邪狼·加鲁鲁",
			probability = "4.7",
			id = 25200,
			num = 1
		},
		[25201] = {
			group_id = 10010,
			name = "末日守卫",
			probability = "4.7",
			id = 25201,
			num = 1
		},
		[25202] = {
			group_id = 10010,
			name = "吉尔伽美什",
			probability = "4.7",
			id = 25202,
			num = 1
		},
		[25203] = {
			group_id = 10010,
			name = "地狱火",
			probability = "4.7",
			id = 25203,
			num = 1
		},
		[25204] = {
			group_id = 10010,
			name = "奥杜尔·铜须",
			probability = "4.7",
			id = 25204,
			num = 1
		},
		[26200] = {
			group_id = 10010,
			name = "树人",
			probability = "4.7",
			id = 26200,
			num = 1
		},
		[26201] = {
			group_id = 10010,
			name = "风暴猎手",
			probability = "4.7",
			id = 26201,
			num = 1
		},
		[26202] = {
			group_id = 10010,
			name = "雷霆狮鹫",
			probability = "4.7",
			id = 26202,
			num = 1
		},
		[26203] = {
			group_id = 10010,
			name = "岩灵",
			probability = "4.7",
			id = 26203,
			num = 1
		},
		[26204] = {
			group_id = 10010,
			name = "游侠射手",
			probability = "4.7",
			id = 26204,
			num = 1
		},
		[28200] = {
			group_id = 10010,
			name = "巨魔巫医",
			probability = "4.7",
			id = 28200,
			num = 1
		},
		[27200] = {
			group_id = 10010,
			name = "光之苏尔",
			probability = "4.7",
			id = 27200,
			num = 1
		}
	}
}
Config.RecruitHolidayLuckyData.data_wish_length = 1
Config.RecruitHolidayLuckyData.data_wish = {
	[50051] = {
		[29400] = {
			sort_2 = 1,
			camp_id = 50051,
			id = 29400,
			bg = "selectsummon_call_bg_19",
			sort = 1
		},
		[29401] = {
			sort_2 = 2,
			camp_id = 50051,
			id = 29401,
			bg = "selectsummon_call_bg_16",
			sort = 2
		},
		[29402] = {
			sort_2 = 3,
			camp_id = 50051,
			id = 29402,
			bg = "selectsummon_call_bg_16",
			sort = 3
		},
		[29403] = {
			sort_2 = 4,
			camp_id = 50051,
			id = 29403,
			bg = "selectsummon_call_bg_20",
			sort = 4
		},
		[29414] = {
			sort_2 = 5,
			camp_id = 50051,
			id = 29414,
			bg = "selectsummon_call_bg_18",
			sort = 5
		},
		[29415] = {
			sort_2 = 6,
			camp_id = 50051,
			id = 29415,
			bg = "selectsummon_call_bg_17",
			sort = 6
		},
		[29416] = {
			sort_2 = 7,
			camp_id = 50051,
			id = 29416,
			bg = "selectsummon_call_bg_19",
			sort = 7
		},
		[29417] = {
			sort_2 = 8,
			camp_id = 50051,
			id = 29417,
			bg = "selectsummon_call_bg_16",
			sort = 8
		},
		[29418] = {
			sort_2 = 9,
			camp_id = 50051,
			id = 29418,
			bg = "selectsummon_call_bg_16",
			sort = 9
		},
		[29419] = {
			sort_2 = 10,
			camp_id = 50051,
			id = 29419,
			bg = "selectsummon_call_bg_20",
			sort = 10
		},
		[29420] = {
			sort_2 = 11,
			camp_id = 50051,
			id = 29420,
			bg = "selectsummon_call_bg_18",
			sort = 11
		},
		[29421] = {
			sort_2 = 12,
			camp_id = 50051,
			id = 29421,
			bg = "selectsummon_call_bg_17",
			sort = 12
		},
		[29422] = {
			sort_2 = 13,
			camp_id = 50051,
			id = 29422,
			bg = "selectsummon_call_bg_17",
			sort = 13
		},
		[29423] = {
			sort_2 = 14,
			camp_id = 50051,
			id = 29423,
			bg = "selectsummon_call_bg_17",
			sort = 14
		},
		[29424] = {
			sort_2 = 15,
			camp_id = 50051,
			id = 29424,
			bg = "selectsummon_call_bg_17",
			sort = 15
		},
		[29425] = {
			sort_2 = 16,
			camp_id = 50051,
			id = 29425,
			bg = "selectsummon_call_bg_17",
			sort = 16
		},
		[29426] = {
			sort_2 = 17,
			camp_id = 50051,
			id = 29426,
			bg = "selectsummon_call_bg_17",
			sort = 17
		},
		[29427] = {
			sort_2 = 18,
			camp_id = 50051,
			id = 29427,
			bg = "selectsummon_call_bg_17",
			sort = 18
		},
		[29428] = {
			sort_2 = 19,
			camp_id = 50051,
			id = 29428,
			bg = "selectsummon_call_bg_17",
			sort = 19
		},
		[29429] = {
			sort_2 = 20,
			camp_id = 50051,
			id = 29429,
			bg = "selectsummon_call_bg_17",
			sort = 20
		},
		[29430] = {
			sort_2 = 21,
			camp_id = 50051,
			id = 29430,
			bg = "selectsummon_call_bg_17",
			sort = 21
		},
		[29431] = {
			sort_2 = 22,
			camp_id = 50051,
			id = 29431,
			bg = "selectsummon_call_bg_17",
			sort = 22
		},
		[29432] = {
			sort_2 = 23,
			camp_id = 50051,
			id = 29432,
			bg = "selectsummon_call_bg_17",
			sort = 23
		},
		[29433] = {
			sort_2 = 24,
			camp_id = 50051,
			id = 29433,
			bg = "selectsummon_call_bg_17",
			sort = 24
		},
		[29434] = {
			sort_2 = 25,
			camp_id = 50051,
			id = 29434,
			bg = "selectsummon_call_bg_17",
			sort = 25
		},
		[29435] = {
			sort_2 = 26,
			camp_id = 50051,
			id = 29435,
			bg = "selectsummon_call_bg_17",
			sort = 26
		},
		[29436] = {
			sort_2 = 27,
			camp_id = 50051,
			id = 29436,
			bg = "selectsummon_call_bg_17",
			sort = 27
		},
		[29437] = {
			sort_2 = 28,
			camp_id = 50051,
			id = 29437,
			bg = "selectsummon_call_bg_17",
			sort = 28
		},
		[29438] = {
			sort_2 = 29,
			camp_id = 50051,
			id = 29438,
			bg = "selectsummon_call_bg_17",
			sort = 29
		},
		[29439] = {
			sort_2 = 30,
			camp_id = 50051,
			id = 29439,
			bg = "selectsummon_call_bg_17",
			sort = 30
		},
		[29440] = {
			sort_2 = 31,
			camp_id = 50051,
			id = 29440,
			bg = "selectsummon_call_bg_17",
			sort = 31
		},
		[29441] = {
			sort_2 = 32,
			camp_id = 50051,
			id = 29441,
			bg = "selectsummon_call_bg_17",
			sort = 32
		},
		[29442] = {
			sort_2 = 33,
			camp_id = 50051,
			id = 29442,
			bg = "selectsummon_call_bg_17",
			sort = 33
		},
		[29443] = {
			sort_2 = 34,
			camp_id = 50051,
			id = 29443,
			bg = "selectsummon_call_bg_17",
			sort = 34
		},
		[29444] = {
			sort_2 = 35,
			camp_id = 50051,
			id = 29444,
			bg = "selectsummon_call_bg_17",
			sort = 35
		},
		[29445] = {
			sort_2 = 36,
			camp_id = 50051,
			id = 29445,
			bg = "selectsummon_call_bg_17",
			sort = 36
		},
		[29446] = {
			sort_2 = 37,
			camp_id = 50051,
			id = 29446,
			bg = "selectsummon_call_bg_17",
			sort = 37
		},
		[29447] = {
			sort_2 = 38,
			camp_id = 50051,
			id = 29447,
			bg = "selectsummon_call_bg_17",
			sort = 38
		},
		[29448] = {
			sort_2 = 39,
			camp_id = 50051,
			id = 29448,
			bg = "selectsummon_call_bg_17",
			sort = 39
		},
		[29449] = {
			sort_2 = 40,
			camp_id = 50051,
			id = 29449,
			bg = "selectsummon_call_bg_17",
			sort = 40
		},
		[29450] = {
			sort_2 = 41,
			camp_id = 50051,
			id = 29450,
			bg = "selectsummon_call_bg_17",
			sort = 41
		},
		[29451] = {
			sort_2 = 42,
			camp_id = 50051,
			id = 29451,
			bg = "selectsummon_call_bg_17",
			sort = 42
		},
		[29452] = {
			sort_2 = 43,
			camp_id = 50051,
			id = 29452,
			bg = "selectsummon_call_bg_17",
			sort = 43
		}
	}
}
