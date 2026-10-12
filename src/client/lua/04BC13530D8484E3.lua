Config = Config or {}
Config.SayData = Config.SayData or {}
Config.SayData.data_say_frame_length = 9
Config.SayData.data_say_frame = {
	[1000] = {
		expire_time = 0,
		name = "聊天气泡",
		offx = 0,
		group = 100,
		is_show = 1,
		desc = "领主专属聊天气泡",
		is_panel = 0,
		base_id = 1000,
		color = 63,
		offy = 0,
		res_id = 0,
		loss = {},
		attr = {}
	},
	[1001] = {
		expire_time = 10080,
		name = "无人能挡",
		offx = 30,
		group = 101,
		is_show = 1,
		desc = "段位赛达到<div fontcolor=#289b14>传奇段位</div>可激活",
		is_panel = 0,
		base_id = 1001,
		color = 63,
		offy = 15,
		res_id = 6,
		loss = {},
		attr = {}
	},
	[1002] = {
		expire_time = 1440,
		name = "荣耀冠军",
		offx = 30,
		group = 102,
		is_show = 1,
		desc = "每日竞技场结算时排名<div fontcolor=#289b14>第一</div>可激活荣耀冠军气泡",
		is_panel = 0,
		base_id = 1002,
		color = 63,
		offy = 15,
		res_id = 1,
		loss = {},
		attr = {}
	},
	[1003] = {
		expire_time = 10080,
		name = "天梯宗师",
		offx = 30,
		group = 103,
		is_show = 1,
		desc = "天梯段位达到宗师六阶激活",
		is_panel = 0,
		base_id = 1003,
		color = 91,
		offy = 15,
		res_id = 2,
		loss = {},
		attr = {}
	},
	[1004] = {
		expire_time = 10080,
		name = "首席霸主",
		offx = 20,
		group = 104,
		is_show = 1,
		desc = "首席争霸服务器第一名玩家可获得",
		is_panel = 1,
		base_id = 1004,
		color = 63,
		offy = 10,
		res_id = 8,
		loss = {
			{
				50104,
				1
			}
		},
		attr = {}
	},
	[1100] = {
		expire_time = 10080,
		name = "任性宝宝",
		offx = 20,
		group = 110,
		is_show = 1,
		desc = "双11活动可获得；使用同类道具激活可叠加有效期",
		is_panel = 1,
		base_id = 1100,
		color = 63,
		offy = 15,
		res_id = 7,
		loss = {
			{
				50100,
				1
			}
		},
		attr = {}
	},
	[1101] = {
		expire_time = 21600,
		name = "任性宝宝",
		offx = 20,
		group = 110,
		is_show = 0,
		desc = "双11活动可获得；使用同类道具激活可叠加有效期",
		is_panel = 1,
		base_id = 1101,
		color = 63,
		offy = 15,
		res_id = 7,
		loss = {
			{
				50101,
				1
			}
		},
		attr = {}
	},
	[1102] = {
		expire_time = 43200,
		name = "任性宝宝",
		offx = 20,
		group = 110,
		is_show = 0,
		desc = "双11活动可获得；使用同类道具激活可叠加有效期",
		is_panel = 1,
		base_id = 1102,
		color = 63,
		offy = 15,
		res_id = 7,
		loss = {
			{
				50102,
				1
			}
		},
		attr = {}
	},
	[1103] = {
		expire_time = 129600,
		name = "任性宝宝",
		offx = 20,
		group = 110,
		is_show = 0,
		desc = "双11活动可获得；使用同类道具激活可叠加有效期",
		is_panel = 1,
		base_id = 1103,
		color = 63,
		offy = 15,
		res_id = 7,
		loss = {
			{
				50103,
				1
			}
		},
		attr = {}
	}
}

function Config.SayData.data_say_frame_fun(slot0)
	slot1 = Config.SayData.data_say_frame[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SayData.data_say_frame[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.SayData.data_const_length = 14
Config.SayData.data_const = {
	default_bubble = {
		val = 1000,
		desc = "默认聊天气泡"
	},
	say_repeak_vip = {
		val = 10,
		desc = "VIPX以下限制"
	},
	say_repeak_lev = {
		val = 80,
		desc = "X级以下限制"
	},
	say_repeak_span = {
		val = 15,
		desc = "最近X分钟内的发言条数"
	},
	say_repeak_num = {
		val = 3,
		desc = "筛选的发言条数"
	},
	say_repeak_similar = {
		val = 60,
		desc = "封禁的相似度（百分比）"
	},
	say_repeak_time = {
		val = 10,
		desc = "封禁的小时"
	},
	say_string_length = {
		val = 28,
		desc = "限制的字符串长度（中文3个字符，英/数一个字符）"
	},
	cooldown_same_province = {
		val = 5,
		desc = "同省发言冷却"
	},
	cooldown_cross_service = {
		val = 10,
		desc = "跨服发言冷却"
	},
	cooldown_world = {
		val = 10,
		desc = "世界发言冷却"
	},
	cooldown_guild = {
		val = 5,
		desc = "公会发言冷却"
	},
	cooldown_team = {
		val = 3,
		desc = "组队聊天发言冷却"
	},
	at_condition = {
		val = 30,
		desc = "角色达到30级才可at其他玩家，请努力提升等级！"
	}
}

function Config.SayData.data_const_fun(slot0)
	slot1 = Config.SayData.data_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.SayData.data_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
