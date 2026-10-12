Config = Config or {}
Config.RoleData = Config.RoleData or {}
Config.RoleData.data_role_const_length = 13
Config.RoleData.data_role_const = {
	max_lev = {
		val = 200,
		desc = "角色等级上限"
	},
	energy_time = {
		val = 300,
		desc = "默认体力恢复时间(秒)"
	},
	role_auth_award = {
		desc = "防沉迷验证奖励",
		val = {
			{
				4,
				100
			}
		}
	},
	role_reported_lev_limit = {
		val = 20,
		desc = "举报功能等级限制"
	},
	role_reported_limit_count = {
		val = 10,
		desc = "举报限制次数"
	},
	role_reported_vip_limit = {
		desc = "vip被举报多少次后禁言",
		val = {
			{
				2,
				5
			},
			{
				5,
				10
			},
			{
				13,
				100
			}
		}
	},
	game_rule1 = {
		val = 1,
		desc = "1.20级以上可举报玩家 \n2.每日举报上限为10次"
	},
	fans_avatar_id = {
		val = 2700,
		desc = "avatar_data.xml边框表的id"
	},
	fans_tips_text1 = {
		val = 1,
		desc = "[一键赠送]友情点时，优先赠与已关注的好友\n本服粉丝值排名前<div fontcolor=#ff7d27>5</div>名可获得专属头像框奖励（限时7天）"
	},
	fans_tips_text2 = {
		val = 1,
		desc = "奖励每周一00:00通过邮件发放"
	},
	fan_like_levlimit = {
		val = 35,
		desc = "个人空间关注操作等级限制"
	},
	fan_rewardnumber = {
		val = 5,
		desc = "粉丝排行榜本服奖励人数"
	},
	fan_rank_reward = {
		desc = "粉丝排行榜本服每周奖励",
		val = {
			{
				50004,
				1
			}
		}
	}
}

function Config.RoleData.data_role_const_fun(slot0)
	slot1 = Config.RoleData.data_role_const[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RoleData.data_role_const[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RoleData.data_role_attr_length = 200
Config.RoleData.data_role_attr = {
	{
		exp_total = 120,
		exp_max = 120,
		ext_desc = "6级开启",
		icon = "open_1",
		title = "日常任务",
		desc = "每日必做，高额收益！",
		reward = {}
	},
	{
		exp_total = 480,
		exp_max = 360,
		ext_desc = "6级开启",
		icon = "open_1",
		title = "日常任务",
		desc = "每日必做，高额收益！",
		reward = {
			{
				3,
				10
			}
		}
	},
	{
		exp_total = 1200,
		exp_max = 720,
		ext_desc = "6级开启",
		icon = "open_1",
		title = "日常任务",
		desc = "每日必做，高额收益！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 2400,
		exp_max = 1200,
		ext_desc = "6级开启",
		icon = "open_1",
		title = "日常任务",
		desc = "每日必做，高额收益！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 4200,
		exp_max = 1800,
		ext_desc = "6级开启",
		icon = "open_1",
		title = "日常任务",
		desc = "每日必做，高额收益！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 7220,
		exp_max = 3020,
		ext_desc = "开启新功能！",
		icon = "open_1",
		title = "日常任务",
		desc = "每日必做，高额收益！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 10580,
		exp_max = 3360,
		ext_desc = "8级开启",
		icon = "open_1",
		title = "竞技场",
		desc = "竞技场里与众多船长一较高低！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 14900,
		exp_max = 4320,
		ext_desc = "开启新功能！",
		icon = "open_1",
		title = "竞技场",
		desc = "竞技场里与众多船长一较高低！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 20300,
		exp_max = 5400,
		ext_desc = "12级开启",
		icon = "open_2",
		title = "远航",
		desc = "英雄护送，获取珍稀道具！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 27500,
		exp_max = 7200,
		ext_desc = "12级开启",
		icon = "open_2",
		title = "远航",
		desc = "英雄护送，获取珍稀道具！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 36740,
		exp_max = 9240,
		ext_desc = "12级开启",
		icon = "open_3",
		title = "远航",
		desc = "英雄护送，获取珍稀道具！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 48260,
		exp_max = 11520,
		ext_desc = "开启新功能！",
		icon = "open_3",
		title = "远航",
		desc = "英雄护送，获取珍稀道具！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 62300,
		exp_max = 14040,
		ext_desc = "15级开启",
		icon = "open_4",
		title = "日常副本",
		desc = "每日副本，珍稀材料轻松拿！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 79100,
		exp_max = 16800,
		ext_desc = "15级开启",
		icon = "open_4",
		title = "日常副本",
		desc = "每日副本，珍稀材料轻松拿！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 98900,
		exp_max = 19800,
		ext_desc = "开启新功能！",
		icon = "open_4",
		title = "日常副本",
		desc = "每日副本，珍稀材料轻松拿！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 121940,
		exp_max = 23040,
		ext_desc = "开启新功能！",
		icon = "open_5",
		title = "海底监狱",
		desc = "挑战海底监狱，领取珍稀道具！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 148460,
		exp_max = 26520,
		ext_desc = "18级开启",
		icon = "open_6",
		title = "公会",
		desc = "公会大家庭，更多福利精彩等着你！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 178700,
		exp_max = 30240,
		ext_desc = "开启新功能！",
		icon = "open_6",
		title = "公会",
		desc = "公会大家庭，更多福利精彩等着你！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 212900,
		exp_max = 34200,
		ext_desc = "20级开启",
		icon = "open_12",
		title = "录像馆",
		desc = "各种精彩战斗不容错过！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 252500,
		exp_max = 39600,
		ext_desc = "开启新功能！",
		icon = "open_12",
		title = "录像馆",
		desc = "各种精彩战斗不容错过！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 297860,
		exp_max = 45360,
		ext_desc = "25级开启",
		icon = "open_7",
		title = "无尽试炼",
		desc = "获取大量英雄经验和神技精石！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 349340,
		exp_max = 51480,
		ext_desc = "25级开启",
		icon = "open_7",
		title = "无尽试炼",
		desc = "获取大量英雄经验和神技精石！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 407300,
		exp_max = 57960,
		ext_desc = "25级开启",
		icon = "open_7",
		title = "无尽试炼",
		desc = "获取大量英雄经验和神技精石！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 911300,
		exp_max = 64800,
		ext_desc = "25级开启",
		icon = "open_7",
		title = "无尽试炼",
		desc = "获取大量英雄经验和神技精石！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 544100,
		exp_max = 72000,
		ext_desc = "开启新功能！",
		icon = "open_7",
		title = "无尽试炼",
		desc = "获取大量英雄经验和神技精石！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 623660,
		exp_max = 79560,
		ext_desc = "30级开启",
		icon = "open_9",
		title = "长环岛冒险",
		desc = "派遣英雄，挑战神秘的长环岛之境！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 711140,
		exp_max = 87480,
		ext_desc = "30级开启",
		icon = "open_9",
		title = "长环岛冒险",
		desc = "派遣英雄，挑战神秘的长环岛之境！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 806900,
		exp_max = 95760,
		ext_desc = "30级开启",
		icon = "open_9",
		title = "长环岛冒险",
		desc = "派遣英雄，挑战神秘的长环岛之境！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 911300,
		exp_max = 104400,
		ext_desc = "30级开启",
		icon = "open_9",
		title = "长环岛冒险",
		desc = "派遣英雄，挑战神秘的长环岛之境！",
		reward = {
			{
				3,
				20
			}
		}
	},
	{
		exp_total = 1026500,
		exp_max = 115200,
		ext_desc = "开启新功能！",
		icon = "open_9",
		title = "长环岛冒险",
		desc = "派遣英雄，挑战神秘的长环岛之境！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 1152980,
		exp_max = 126480,
		ext_desc = "35级开启",
		icon = "open_8",
		title = "霸气修炼室",
		desc = "最强船长的专属殿堂！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 1291220,
		exp_max = 138240,
		ext_desc = "35级开启",
		icon = "open_8",
		title = "霸气修炼室",
		desc = "最强船长的专属殿堂！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 1441700,
		exp_max = 150480,
		ext_desc = "35级开启",
		icon = "open_8",
		title = "霸气修炼室",
		desc = "最强船长的专属殿堂！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 1604900,
		exp_max = 163200,
		ext_desc = "35级开启",
		icon = "open_8",
		title = "霸气修炼室",
		desc = "最强船长的专属殿堂！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 1781300,
		exp_max = 176400,
		ext_desc = "开启新功能！",
		icon = "open_8",
		title = "霸气修炼室",
		desc = "最强船长的专属殿堂！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 1971380,
		exp_max = 190080,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 2175620,
		exp_max = 204240,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 2394500,
		exp_max = 218880,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 2628500,
		exp_max = 234000,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				30
			}
		}
	},
	{
		exp_total = 2930500,
		exp_max = 302000,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 3201100,
		exp_max = 270600,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 3490900,
		exp_max = 289800,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 3800500,
		exp_max = 309600,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 4130500,
		exp_max = 330000,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 4481500,
		exp_max = 351000,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 4854100,
		exp_max = 372600,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 5248900,
		exp_max = 394800,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 5666500,
		exp_max = 417600,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 6107500,
		exp_max = 441000,
		ext_desc = "50级开启",
		icon = "open_10",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				40
			}
		}
	},
	{
		exp_total = 6575500,
		exp_max = 468000,
		ext_desc = "开启新功能！",
		icon = "open_11",
		title = "空岛冒险",
		desc = "挑战神界守卫，探索未知领域！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 7071220,
		exp_max = 495720,
		ext_desc = "55级开启",
		icon = "open_11",
		title = "跨服天梯",
		desc = "强者齐聚，真正的挑战即将开启！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 7595380,
		exp_max = 524160,
		ext_desc = "55级开启",
		icon = "open_11",
		title = "跨服天梯",
		desc = "强者齐聚，真正的挑战即将开启！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 8148700,
		exp_max = 553320,
		ext_desc = "55级开启",
		icon = "open_11",
		title = "跨服天梯",
		desc = "强者齐聚，真正的挑战即将开启！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 8731900,
		exp_max = 583200,
		ext_desc = "55级开启",
		icon = "open_11",
		title = "跨服天梯",
		desc = "强者齐聚，真正的挑战即将开启！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 9345700,
		exp_max = 613800,
		ext_desc = "开启新功能！",
		icon = "open_11",
		title = "跨服天梯",
		desc = "强者齐聚，真正的挑战即将开启！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 9990820,
		exp_max = 645120,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 10667980,
		exp_max = 677160,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 11377900,
		exp_max = 709920,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 12121300,
		exp_max = 743400,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				50
			}
		}
	},
	{
		exp_total = 12902500,
		exp_max = 781200,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 13722340,
		exp_max = 819840,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 14581660,
		exp_max = 859320,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 15481300,
		exp_max = 899640,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 16422100,
		exp_max = 940800,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 17404900,
		exp_max = 982800,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 18435540,
		exp_max = 1030640,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 19504860,
		exp_max = 1069320,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 20618700,
		exp_max = 1113840,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 21777900,
		exp_max = 1159200,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				60
			}
		}
	},
	{
		exp_total = 22987500,
		exp_max = 1209600,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 24248460,
		exp_max = 1260960,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 25561740,
		exp_max = 1313280,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 26928300,
		exp_max = 1366560,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 28349100,
		exp_max = 1420800,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 29825100,
		exp_max = 1476000,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 31357260,
		exp_max = 1532160,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 32946540,
		exp_max = 1589280,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 34593900,
		exp_max = 1647360,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 36300300,
		exp_max = 1706400,
		ext_desc = "80级开启",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				3,
				70
			}
		}
	},
	{
		exp_total = 38071500,
		exp_max = 1771200,
		ext_desc = "开启新功能！",
		icon = "open_19",
		title = "幽灵系统",
		desc = "唤醒沉睡的古树，萌系幽灵协助作战！",
		reward = {
			{
				10601,
				1
			},
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 39908580,
		exp_max = 1837080,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 41812620,
		exp_max = 1904040,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 43784700,
		exp_max = 1972080,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 45825900,
		exp_max = 2041200,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 47937300,
		exp_max = 2111400,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 50119980,
		exp_max = 2182680,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 52425020,
		exp_max = 2305040,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 54753500,
		exp_max = 2328480,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 57156500,
		exp_max = 2403000,
		ext_desc = "90级开启",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				80
			}
		}
	},
	{
		exp_total = 59640500,
		exp_max = 2484000,
		ext_desc = "开启新功能！",
		icon = "open_13",
		title = "信念圣殿",
		desc = "掌控信念之力，解放信念圣物！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 62706700,
		exp_max = 3066200,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 65356300,
		exp_max = 2649600,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 68090500,
		exp_max = 2734200,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 70910500,
		exp_max = 2820000,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 73817500,
		exp_max = 2907000,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 76812700,
		exp_max = 2995200,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 79897300,
		exp_max = 3084600,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 83072500,
		exp_max = 3175200,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 86339500,
		exp_max = 3267000,
		ext_desc = "100级开启",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "千锤百炼成钢，百战百胜超凡！开启战斗3倍速！",
		reward = {
			{
				3,
				90
			}
		}
	},
	{
		exp_total = 89705500,
		exp_max = 3366000,
		ext_desc = "开启新功能！",
		icon = "open_14",
		title = "超凡段位赛",
		desc = "世界等级达100级可参与！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 93171820,
		exp_max = 3466320,
		ext_desc = "105级开启",
		icon = "open_15",
		title = "传奇挑战",
		desc = "天界历练，强力神装！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 96739780,
		exp_max = 3567960,
		ext_desc = "105级开启",
		icon = "open_15",
		title = "英雄神装",
		desc = "天界历练，强力神装！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 100410700,
		exp_max = 3670920,
		ext_desc = "105级开启",
		icon = "open_15",
		title = "传奇挑战",
		desc = "天界历练，强力神装！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 104185900,
		exp_max = 3775200,
		ext_desc = "105级开启",
		icon = "open_15",
		title = "英雄神装",
		desc = "天界历练，强力神装！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 108066700,
		exp_max = 3880800,
		ext_desc = "开启新功能！",
		icon = "open_15",
		title = "传奇挑战",
		desc = "世界等级达110级可参与！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 112054420,
		exp_max = 3987720,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 116150380,
		exp_max = 4095960,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 120355900,
		exp_max = 4205520,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 124672300,
		exp_max = 4316400,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				100
			}
		}
	},
	{
		exp_total = 129107500,
		exp_max = 4435200,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 133662940,
		exp_max = 4555440,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 138340060,
		exp_max = 4677120,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 143140300,
		exp_max = 4800240,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 148065100,
		exp_max = 4924800,
		ext_desc = "115级开启",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "新的征战起点！",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 153115900,
		exp_max = 5050800,
		ext_desc = "开启新功能！",
		icon = "open_16",
		title = "跨服竞技场",
		desc = "世界等级达120级可参与！",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 158294140,
		exp_max = 5178240,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 163601260,
		exp_max = 5307120,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 169038700,
		exp_max = 5437440,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 174607900,
		exp_max = 5569200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				110
			}
		}
	},
	{
		exp_total = 180317500,
		exp_max = 5709600,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 186169060,
		exp_max = 5851560,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 192164140,
		exp_max = 5995080,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 198304300,
		exp_max = 6140160,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 238279300,
		exp_max = 6286800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 211026100,
		exp_max = 6435000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 217610860,
		exp_max = 6584760,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 224346940,
		exp_max = 6736080,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 231235900,
		exp_max = 6888960,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 238279300,
		exp_max = 7043400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				120
			}
		}
	},
	{
		exp_total = 245486500,
		exp_max = 7207200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 252859180,
		exp_max = 7372680,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 260399020,
		exp_max = 7539840,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 268107700,
		exp_max = 7708680,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 275986900,
		exp_max = 7879200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 284038300,
		exp_max = 8051400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 292268580,
		exp_max = 8230280,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 300669420,
		exp_max = 8400840,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 309247500,
		exp_max = 8578080,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 318004500,
		exp_max = 8757000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				130
			}
		}
	},
	{
		exp_total = 326950500,
		exp_max = 8946000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 336087300,
		exp_max = 9136800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 345416700,
		exp_max = 9329400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 354940500,
		exp_max = 9523800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 364660500,
		exp_max = 9720000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 374578500,
		exp_max = 9918000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 384696300,
		exp_max = 10117800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 395015700,
		exp_max = 10319400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 405538500,
		exp_max = 10522800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 416266500,
		exp_max = 10728000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				140
			}
		}
	},
	{
		exp_total = 427210500,
		exp_max = 10944000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 438372420,
		exp_max = 11161920,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 449754180,
		exp_max = 11381760,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 461357700,
		exp_max = 11603520,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 473184900,
		exp_max = 11827200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 485237700,
		exp_max = 12052800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 497518020,
		exp_max = 12280320,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 510527780,
		exp_max = 13009760,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 523268900,
		exp_max = 12741120,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 536243300,
		exp_max = 12974400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				150
			}
		}
	},
	{
		exp_total = 549462500,
		exp_max = 13219200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 562928540,
		exp_max = 13466040,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 576643460,
		exp_max = 13714920,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 590609300,
		exp_max = 13965840,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 604828100,
		exp_max = 14218800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 619301900,
		exp_max = 14473800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 634032740,
		exp_max = 14730840,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 649022660,
		exp_max = 14989920,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 664323700,
		exp_max = 15301040,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 679837900,
		exp_max = 15514200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				160
			}
		}
	},
	{
		exp_total = 695627500,
		exp_max = 15789600,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 711694660,
		exp_max = 16067160,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 728041540,
		exp_max = 16346880,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 744670300,
		exp_max = 16628760,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 761583100,
		exp_max = 16912800,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 778782100,
		exp_max = 17199000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 796269460,
		exp_max = 17487360,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 814047340,
		exp_max = 17777880,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 832117900,
		exp_max = 18070560,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 850483300,
		exp_max = 18365400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				170
			}
		}
	},
	{
		exp_total = 869156500,
		exp_max = 18673200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 888139780,
		exp_max = 18983280,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 907435420,
		exp_max = 19295640,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 927045700,
		exp_max = 19610280,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 946972900,
		exp_max = 19927200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 967219300,
		exp_max = 20246400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 987787180,
		exp_max = 20567880,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 1008678820,
		exp_max = 20891640,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 1029896500,
		exp_max = 21217680,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 1051442500,
		exp_max = 21546000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				180
			}
		}
	},
	{
		exp_total = 1073330500,
		exp_max = 21888000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1095562900,
		exp_max = 22232400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1118642100,
		exp_max = 23079200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1141570500,
		exp_max = 22928400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1164850500,
		exp_max = 23280000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1188484500,
		exp_max = 23634000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1212474900,
		exp_max = 23990400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1236824100,
		exp_max = 24349200,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1261534500,
		exp_max = 24710400,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1291608500,
		exp_max = 30074000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				190
			}
		}
	},
	{
		exp_total = 1322060500,
		exp_max = 30452000,
		ext_desc = "",
		icon = "",
		title = "",
		desc = "",
		reward = {
			{
				3,
				200
			}
		}
	}
}

function Config.RoleData.data_role_attr_fun(slot0)
	slot1 = Config.RoleData.data_role_attr[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RoleData.data_role_attr[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RoleData.data_role_career_length = 0
Config.RoleData.data_role_career = {}

function Config.RoleData.data_role_career_fun(slot0)
	slot1 = Config.RoleData.data_role_career[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.RoleData.data_role_career[" .. slot0 .. "])not found")

		return
	end

	return slot1
end

Config.RoleData.data_province_list_length = 34
Config.RoleData.data_province_list = {
	{
		province_name = "北京市",
		province_id = 1
	},
	{
		province_name = "天津市",
		province_id = 2
	},
	{
		province_name = "河北",
		province_id = 3
	},
	{
		province_name = "山西",
		province_id = 4
	},
	{
		province_name = "内蒙古",
		province_id = 5
	},
	{
		province_name = "辽宁",
		province_id = 6
	},
	{
		province_name = "吉林",
		province_id = 7
	},
	{
		province_name = "黑龙江",
		province_id = 8
	},
	{
		province_name = "上海市",
		province_id = 9
	},
	{
		province_name = "江苏",
		province_id = 10
	},
	{
		province_name = "浙江",
		province_id = 11
	},
	{
		province_name = "安徽",
		province_id = 12
	},
	{
		province_name = "福建",
		province_id = 13
	},
	{
		province_name = "江西",
		province_id = 14
	},
	{
		province_name = "山东",
		province_id = 15
	},
	{
		province_name = "河南",
		province_id = 16
	},
	{
		province_name = "湖北",
		province_id = 17
	},
	{
		province_name = "湖南",
		province_id = 18
	},
	{
		province_name = "广东",
		province_id = 19
	},
	{
		province_name = "广西",
		province_id = 20
	},
	{
		province_name = "海南",
		province_id = 21
	},
	{
		province_name = "重庆市",
		province_id = 22
	},
	{
		province_name = "四川",
		province_id = 23
	},
	{
		province_name = "贵州",
		province_id = 24
	},
	{
		province_name = "云南",
		province_id = 25
	},
	{
		province_name = "西藏",
		province_id = 26
	},
	{
		province_name = "陕西",
		province_id = 27
	},
	{
		province_name = "甘肃",
		province_id = 28
	},
	{
		province_name = "青海",
		province_id = 29
	},
	{
		province_name = "宁夏",
		province_id = 30
	},
	{
		province_name = "新疆",
		province_id = 31
	},
	{
		province_name = "台湾",
		province_id = 32
	},
	{
		province_name = "香港",
		province_id = 33
	},
	{
		province_name = "澳门",
		province_id = 34
	}
}
Config.RoleData.data_city_list_length = 34
Config.RoleData.data_city_list = {
	{
		{
			city_name = "延庆",
			city_id = 116
		},
		{
			city_name = "密云",
			city_id = 115
		},
		{
			city_name = "平谷",
			city_id = 114
		},
		{
			city_name = "怀柔",
			city_id = 113
		},
		{
			city_name = "大兴",
			city_id = 112
		},
		{
			city_name = "昌平",
			city_id = 111
		},
		{
			city_name = "顺义",
			city_id = 110
		},
		{
			city_name = "通州",
			city_id = 109
		},
		{
			city_name = "房山",
			city_id = 108
		},
		{
			city_name = "门头沟",
			city_id = 107
		},
		{
			city_name = "海淀",
			city_id = 106
		},
		{
			city_name = "石景山",
			city_id = 105
		},
		{
			city_name = "丰台",
			city_id = 104
		},
		{
			city_name = "朝阳",
			city_id = 103
		},
		{
			city_name = "西城",
			city_id = 102
		},
		{
			city_name = "东城",
			city_id = 101
		}
	},
	{
		{
			city_name = "蓟县",
			city_id = 216
		},
		{
			city_name = "宝坻",
			city_id = 215
		},
		{
			city_name = "静海",
			city_id = 214
		},
		{
			city_name = "武清",
			city_id = 213
		},
		{
			city_name = "宁河",
			city_id = 212
		},
		{
			city_name = "北辰",
			city_id = 211
		},
		{
			city_name = "津南",
			city_id = 210
		},
		{
			city_name = "西青",
			city_id = 209
		},
		{
			city_name = "东丽",
			city_id = 208
		},
		{
			city_name = "滨海新",
			city_id = 207
		},
		{
			city_name = "红桥",
			city_id = 206
		},
		{
			city_name = "河北",
			city_id = 205
		},
		{
			city_name = "南开",
			city_id = 204
		},
		{
			city_name = "河东",
			city_id = 203
		},
		{
			city_name = "和平",
			city_id = 202
		},
		{
			city_name = "河西",
			city_id = 201
		}
	},
	{
		{
			city_name = "衡水市",
			city_id = 311
		},
		{
			city_name = "廊坊市",
			city_id = 310
		},
		{
			city_name = "沧州市",
			city_id = 309
		},
		{
			city_name = "承德市",
			city_id = 308
		},
		{
			city_name = "张家口市",
			city_id = 307
		},
		{
			city_name = "保定市",
			city_id = 306
		},
		{
			city_name = "邢台市",
			city_id = 305
		},
		{
			city_name = "邯郸市",
			city_id = 304
		},
		{
			city_name = "秦皇岛市",
			city_id = 303
		},
		{
			city_name = "唐山市",
			city_id = 302
		},
		{
			city_name = "石家庄市",
			city_id = 301
		}
	},
	{
		{
			city_name = "吕梁市",
			city_id = 411
		},
		{
			city_name = "临汾市",
			city_id = 410
		},
		{
			city_name = "忻州市",
			city_id = 409
		},
		{
			city_name = "运城市",
			city_id = 408
		},
		{
			city_name = "晋中市",
			city_id = 407
		},
		{
			city_name = "朔州市",
			city_id = 406
		},
		{
			city_name = "晋城市",
			city_id = 405
		},
		{
			city_name = "长治市",
			city_id = 404
		},
		{
			city_name = "阳泉市",
			city_id = 403
		},
		{
			city_name = "大同市",
			city_id = 402
		},
		{
			city_name = "太原市",
			city_id = 401
		}
	},
	{
		{
			city_name = "阿拉善盟",
			city_id = 512
		},
		{
			city_name = "锡林郭勒盟",
			city_id = 511
		},
		{
			city_name = "兴安盟",
			city_id = 510
		},
		{
			city_name = "乌兰察布市",
			city_id = 509
		},
		{
			city_name = "巴彦淖尔市",
			city_id = 508
		},
		{
			city_name = "呼伦贝尔市",
			city_id = 507
		},
		{
			city_name = "鄂尔多斯市",
			city_id = 506
		},
		{
			city_name = "通辽市",
			city_id = 505
		},
		{
			city_name = "赤峰市",
			city_id = 504
		},
		{
			city_name = "乌海市",
			city_id = 503
		},
		{
			city_name = "包头市",
			city_id = 502
		},
		{
			city_name = "呼和浩特市",
			city_id = 501
		}
	},
	{
		{
			city_name = "葫芦岛市",
			city_id = 614
		},
		{
			city_name = "朝阳市",
			city_id = 613
		},
		{
			city_name = "铁岭市",
			city_id = 612
		},
		{
			city_name = "盘锦市",
			city_id = 611
		},
		{
			city_name = "辽阳市",
			city_id = 610
		},
		{
			city_name = "阜新市",
			city_id = 609
		},
		{
			city_name = "营口市",
			city_id = 608
		},
		{
			city_name = "锦州市",
			city_id = 607
		},
		{
			city_name = "丹东市",
			city_id = 606
		},
		{
			city_name = "本溪市",
			city_id = 605
		},
		{
			city_name = "抚顺市",
			city_id = 604
		},
		{
			city_name = "鞍山市",
			city_id = 603
		},
		{
			city_name = "大连市",
			city_id = 602
		},
		{
			city_name = "沈阳市",
			city_id = 601
		}
	},
	{
		{
			city_name = "延边",
			city_id = 709
		},
		{
			city_name = "白城市",
			city_id = 708
		},
		{
			city_name = "松原市",
			city_id = 707
		},
		{
			city_name = "白山市",
			city_id = 706
		},
		{
			city_name = "通化市",
			city_id = 705
		},
		{
			city_name = "辽源市",
			city_id = 704
		},
		{
			city_name = "四平市",
			city_id = 703
		},
		{
			city_name = "吉林市",
			city_id = 702
		},
		{
			city_name = "长春市",
			city_id = 701
		}
	},
	{
		{
			city_name = "大兴安岭",
			city_id = 813
		},
		{
			city_name = "绥化市",
			city_id = 812
		},
		{
			city_name = "黑河市",
			city_id = 811
		},
		{
			city_name = "牡丹江市",
			city_id = 810
		},
		{
			city_name = "七台河市",
			city_id = 809
		},
		{
			city_name = "佳木斯市",
			city_id = 808
		},
		{
			city_name = "伊春市",
			city_id = 807
		},
		{
			city_name = "大庆市",
			city_id = 806
		},
		{
			city_name = "双鸭山市",
			city_id = 805
		},
		{
			city_name = "鹤岗市",
			city_id = 804
		},
		{
			city_name = "鸡西市",
			city_id = 803
		},
		{
			city_name = "齐齐哈尔市",
			city_id = 802
		},
		{
			city_name = "哈尔滨市",
			city_id = 801
		}
	},
	{
		{
			city_name = "崇明",
			city_id = 918
		},
		{
			city_name = "青浦",
			city_id = 917
		},
		{
			city_name = "奉贤",
			city_id = 916
		},
		{
			city_name = "松江",
			city_id = 915
		},
		{
			city_name = "金山",
			city_id = 914
		},
		{
			city_name = "浦东新",
			city_id = 913
		},
		{
			city_name = "嘉定",
			city_id = 912
		},
		{
			city_name = "宝山",
			city_id = 911
		},
		{
			city_name = "闵行",
			city_id = 910
		},
		{
			city_name = "杨浦",
			city_id = 909
		},
		{
			city_name = "虹口",
			city_id = 908
		},
		{
			city_name = "普陀",
			city_id = 907
		},
		{
			city_name = "闸北",
			city_id = 906
		},
		{
			city_name = "静安",
			city_id = 905
		},
		{
			city_name = "长宁",
			city_id = 904
		},
		{
			city_name = "徐汇",
			city_id = 903
		},
		{
			city_name = "卢湾",
			city_id = 902
		},
		{
			city_name = "黄浦",
			city_id = 901
		}
	},
	{
		{
			city_name = "宿迁市",
			city_id = 1013
		},
		{
			city_name = "泰州市",
			city_id = 1012
		},
		{
			city_name = "镇江市",
			city_id = 1011
		},
		{
			city_name = "扬州市",
			city_id = 1010
		},
		{
			city_name = "盐城市",
			city_id = 1009
		},
		{
			city_name = "淮安市",
			city_id = 1008
		},
		{
			city_name = "连云港市",
			city_id = 1007
		},
		{
			city_name = "南通市",
			city_id = 1006
		},
		{
			city_name = "苏州市",
			city_id = 1005
		},
		{
			city_name = "常州市",
			city_id = 1004
		},
		{
			city_name = "徐州市",
			city_id = 1003
		},
		{
			city_name = "无锡市",
			city_id = 1002
		},
		{
			city_name = "南京市",
			city_id = 1001
		}
	},
	{
		{
			city_name = "丽水市",
			city_id = 1111
		},
		{
			city_name = "台州市",
			city_id = 1110
		},
		{
			city_name = "舟山市",
			city_id = 1109
		},
		{
			city_name = "衢州市",
			city_id = 1108
		},
		{
			city_name = "金华市",
			city_id = 1107
		},
		{
			city_name = "绍兴市",
			city_id = 1106
		},
		{
			city_name = "湖州市",
			city_id = 1105
		},
		{
			city_name = "嘉兴市",
			city_id = 1104
		},
		{
			city_name = "温州市",
			city_id = 1103
		},
		{
			city_name = "宁波市",
			city_id = 1102
		},
		{
			city_name = "杭州市",
			city_id = 1101
		}
	},
	{
		{
			city_name = "宣城市",
			city_id = 1216
		},
		{
			city_name = "池州市",
			city_id = 1215
		},
		{
			city_name = "亳州市",
			city_id = 1214
		},
		{
			city_name = "六安市",
			city_id = 1213
		},
		{
			city_name = "宿州市",
			city_id = 1212
		},
		{
			city_name = "阜阳市",
			city_id = 1211
		},
		{
			city_name = "滁州市",
			city_id = 1210
		},
		{
			city_name = "黄山市",
			city_id = 1209
		},
		{
			city_name = "安庆市",
			city_id = 1208
		},
		{
			city_name = "铜陵市",
			city_id = 1207
		},
		{
			city_name = "淮北市",
			city_id = 1206
		},
		{
			city_name = "马鞍山市",
			city_id = 1205
		},
		{
			city_name = "淮南市",
			city_id = 1204
		},
		{
			city_name = "蚌埠市",
			city_id = 1203
		},
		{
			city_name = "芜湖市",
			city_id = 1202
		},
		{
			city_name = "合肥市",
			city_id = 1201
		}
	},
	{
		{
			city_name = "宁德市",
			city_id = 1309
		},
		{
			city_name = "龙岩市",
			city_id = 1308
		},
		{
			city_name = "南平市",
			city_id = 1307
		},
		{
			city_name = "漳州市",
			city_id = 1306
		},
		{
			city_name = "泉州市",
			city_id = 1305
		},
		{
			city_name = "三明市",
			city_id = 1304
		},
		{
			city_name = "莆田市",
			city_id = 1303
		},
		{
			city_name = "厦门市",
			city_id = 1302
		},
		{
			city_name = "福州市",
			city_id = 1301
		}
	},
	{
		{
			city_name = "上饶市",
			city_id = 1411
		},
		{
			city_name = "抚州市",
			city_id = 1410
		},
		{
			city_name = "宜春市",
			city_id = 1409
		},
		{
			city_name = "吉安市",
			city_id = 1408
		},
		{
			city_name = "赣州市",
			city_id = 1407
		},
		{
			city_name = "鹰潭市",
			city_id = 1406
		},
		{
			city_name = "新余市",
			city_id = 1405
		},
		{
			city_name = "九江市",
			city_id = 1404
		},
		{
			city_name = "萍乡市",
			city_id = 1403
		},
		{
			city_name = "景德镇市",
			city_id = 1402
		},
		{
			city_name = "南昌市",
			city_id = 1401
		}
	},
	{
		{
			city_name = "菏泽市",
			city_id = 1517
		},
		{
			city_name = "滨州市",
			city_id = 1516
		},
		{
			city_name = "聊城市",
			city_id = 1515
		},
		{
			city_name = "德州市",
			city_id = 1514
		},
		{
			city_name = "临沂市",
			city_id = 1513
		},
		{
			city_name = "莱芜市",
			city_id = 1512
		},
		{
			city_name = "日照市",
			city_id = 1511
		},
		{
			city_name = "威海市",
			city_id = 1510
		},
		{
			city_name = "泰安市",
			city_id = 1509
		},
		{
			city_name = "济宁市",
			city_id = 1508
		},
		{
			city_name = "潍坊市",
			city_id = 1507
		},
		{
			city_name = "烟台市",
			city_id = 1506
		},
		{
			city_name = "东营市",
			city_id = 1505
		},
		{
			city_name = "枣庄市",
			city_id = 1504
		},
		{
			city_name = "淄博市",
			city_id = 1503
		},
		{
			city_name = "青岛市",
			city_id = 1502
		},
		{
			city_name = "济南市",
			city_id = 1501
		}
	},
	{
		{
			city_name = "济源市",
			city_id = 1618
		},
		{
			city_name = "驻马店市",
			city_id = 1617
		},
		{
			city_name = "周口市",
			city_id = 1616
		},
		{
			city_name = "信阳市",
			city_id = 1615
		},
		{
			city_name = "商丘市",
			city_id = 1614
		},
		{
			city_name = "南阳市",
			city_id = 1613
		},
		{
			city_name = "三门峡市",
			city_id = 1612
		},
		{
			city_name = "漯河市",
			city_id = 1611
		},
		{
			city_name = "许昌市",
			city_id = 1610
		},
		{
			city_name = "濮阳市",
			city_id = 1609
		},
		{
			city_name = "焦作市",
			city_id = 1608
		},
		{
			city_name = "新乡市",
			city_id = 1607
		},
		{
			city_name = "鹤壁市",
			city_id = 1606
		},
		{
			city_name = "安阳市",
			city_id = 1605
		},
		{
			city_name = "平顶山市",
			city_id = 1604
		},
		{
			city_name = "洛阳市",
			city_id = 1603
		},
		{
			city_name = "开封市",
			city_id = 1602
		},
		{
			city_name = "郑州市",
			city_id = 1601
		}
	},
	{
		{
			city_name = "神农架",
			city_id = 1717
		},
		{
			city_name = "天门市",
			city_id = 1716
		},
		{
			city_name = "潜江市",
			city_id = 1715
		},
		{
			city_name = "仙桃市",
			city_id = 1714
		},
		{
			city_name = "恩施",
			city_id = 1713
		},
		{
			city_name = "随州市",
			city_id = 1712
		},
		{
			city_name = "咸宁市",
			city_id = 1711
		},
		{
			city_name = "黄冈市",
			city_id = 1710
		},
		{
			city_name = "荆州市",
			city_id = 1709
		},
		{
			city_name = "孝感市",
			city_id = 1708
		},
		{
			city_name = "荆门市",
			city_id = 1707
		},
		{
			city_name = "鄂州市",
			city_id = 1706
		},
		{
			city_name = "襄阳市",
			city_id = 1705
		},
		{
			city_name = "宜昌市",
			city_id = 1704
		},
		{
			city_name = "十堰市",
			city_id = 1703
		},
		{
			city_name = "黄石市",
			city_id = 1702
		},
		{
			city_name = "武汉市",
			city_id = 1701
		}
	},
	{
		{
			city_name = "湘西",
			city_id = 1814
		},
		{
			city_name = "娄底市",
			city_id = 1813
		},
		{
			city_name = "怀化市",
			city_id = 1812
		},
		{
			city_name = "永州市",
			city_id = 1811
		},
		{
			city_name = "郴州市",
			city_id = 1810
		},
		{
			city_name = "益阳市",
			city_id = 1809
		},
		{
			city_name = "张家界市",
			city_id = 1808
		},
		{
			city_name = "常德市",
			city_id = 1807
		},
		{
			city_name = "岳阳市",
			city_id = 1806
		},
		{
			city_name = "邵阳市",
			city_id = 1805
		},
		{
			city_name = "衡阳市",
			city_id = 1804
		},
		{
			city_name = "湘潭市",
			city_id = 1803
		},
		{
			city_name = "株洲市",
			city_id = 1802
		},
		{
			city_name = "长沙市",
			city_id = 1801
		}
	},
	{
		{
			city_name = "云浮市",
			city_id = 1921
		},
		{
			city_name = "揭阳市",
			city_id = 1920
		},
		{
			city_name = "潮州市",
			city_id = 1919
		},
		{
			city_name = "中山市",
			city_id = 1918
		},
		{
			city_name = "东莞市",
			city_id = 1917
		},
		{
			city_name = "清远市",
			city_id = 1916
		},
		{
			city_name = "阳江市",
			city_id = 1915
		},
		{
			city_name = "河源市",
			city_id = 1914
		},
		{
			city_name = "汕尾市",
			city_id = 1913
		},
		{
			city_name = "梅州市",
			city_id = 1912
		},
		{
			city_name = "惠州市",
			city_id = 1911
		},
		{
			city_name = "肇庆市",
			city_id = 1910
		},
		{
			city_name = "茂名市",
			city_id = 1909
		},
		{
			city_name = "湛江市",
			city_id = 1908
		},
		{
			city_name = "江门市",
			city_id = 1907
		},
		{
			city_name = "佛山市",
			city_id = 1906
		},
		{
			city_name = "汕头市",
			city_id = 1905
		},
		{
			city_name = "珠海市",
			city_id = 1904
		},
		{
			city_name = "深圳市",
			city_id = 1903
		},
		{
			city_name = "韶关市",
			city_id = 1902
		},
		{
			city_name = "广州市",
			city_id = 1901
		}
	},
	{
		{
			city_name = "崇左市",
			city_id = 2014
		},
		{
			city_name = "来宾市",
			city_id = 2013
		},
		{
			city_name = "河池市",
			city_id = 2012
		},
		{
			city_name = "贺州市",
			city_id = 2011
		},
		{
			city_name = "百色市",
			city_id = 2010
		},
		{
			city_name = "玉林市",
			city_id = 2009
		},
		{
			city_name = "贵港市",
			city_id = 2008
		},
		{
			city_name = "钦州市",
			city_id = 2007
		},
		{
			city_name = "防城港市",
			city_id = 2006
		},
		{
			city_name = "北海市",
			city_id = 2005
		},
		{
			city_name = "梧州市",
			city_id = 2004
		},
		{
			city_name = "桂林市",
			city_id = 2003
		},
		{
			city_name = "柳州市",
			city_id = 2002
		},
		{
			city_name = "南宁市",
			city_id = 2001
		}
	},
	{
		{
			city_name = "琼中",
			city_id = 2118
		},
		{
			city_name = "保亭",
			city_id = 2117
		},
		{
			city_name = "陵水",
			city_id = 2116
		},
		{
			city_name = "乐东",
			city_id = 2115
		},
		{
			city_name = "昌江",
			city_id = 2114
		},
		{
			city_name = "白沙",
			city_id = 2113
		},
		{
			city_name = "临高",
			city_id = 2112
		},
		{
			city_name = "澄迈",
			city_id = 2111
		},
		{
			city_name = "屯昌",
			city_id = 2110
		},
		{
			city_name = "东方市",
			city_id = 2109
		},
		{
			city_name = "万宁市",
			city_id = 2108
		},
		{
			city_name = "文昌市",
			city_id = 2107
		},
		{
			city_name = "琼海市",
			city_id = 2106
		},
		{
			city_name = "五指山市",
			city_id = 2105
		},
		{
			city_name = "儋州市",
			city_id = 2104
		},
		{
			city_name = "三沙市",
			city_id = 2103
		},
		{
			city_name = "三亚市",
			city_id = 2102
		},
		{
			city_name = "海口市",
			city_id = 2101
		}
	},
	{
		{
			city_name = "南川",
			city_id = 2241
		},
		{
			city_name = "永川",
			city_id = 2240
		},
		{
			city_name = "合川",
			city_id = 2239
		},
		{
			city_name = "江津",
			city_id = 2238
		},
		{
			city_name = "彭水",
			city_id = 2237
		},
		{
			city_name = "酉阳",
			city_id = 2236
		},
		{
			city_name = "秀山",
			city_id = 2235
		},
		{
			city_name = "石柱",
			city_id = 2234
		},
		{
			city_name = "黔江",
			city_id = 2233
		},
		{
			city_name = "巫溪",
			city_id = 2232
		},
		{
			city_name = "巫山",
			city_id = 2231
		},
		{
			city_name = "奉节",
			city_id = 2230
		},
		{
			city_name = "云阳",
			city_id = 2229
		},
		{
			city_name = "开县",
			city_id = 2228
		},
		{
			city_name = "忠县",
			city_id = 2227
		},
		{
			city_name = "武隆",
			city_id = 2226
		},
		{
			city_name = "垫江",
			city_id = 2225
		},
		{
			city_name = "丰都",
			city_id = 2224
		},
		{
			city_name = "城口",
			city_id = 2223
		},
		{
			city_name = "梁平",
			city_id = 2222
		},
		{
			city_name = "璧山",
			city_id = 2221
		},
		{
			city_name = "荣昌",
			city_id = 2220
		},
		{
			city_name = "大足",
			city_id = 2219
		},
		{
			city_name = "铜梁",
			city_id = 2218
		},
		{
			city_name = "潼南",
			city_id = 2217
		},
		{
			city_name = "綦江",
			city_id = 2216
		},
		{
			city_name = "长寿",
			city_id = 2215
		},
		{
			city_name = "巴南",
			city_id = 2214
		},
		{
			city_name = "渝北",
			city_id = 2213
		},
		{
			city_name = "双桥",
			city_id = 2212
		},
		{
			city_name = "万盛",
			city_id = 2211
		},
		{
			city_name = "两江新",
			city_id = 2210
		},
		{
			city_name = "北碚",
			city_id = 2209
		},
		{
			city_name = "南岸",
			city_id = 2208
		},
		{
			city_name = "九龙坡",
			city_id = 2207
		},
		{
			city_name = "沙坪坝",
			city_id = 2206
		},
		{
			city_name = "江北",
			city_id = 2205
		},
		{
			city_name = "大渡口",
			city_id = 2204
		},
		{
			city_name = "渝中",
			city_id = 2203
		},
		{
			city_name = "涪陵",
			city_id = 2202
		},
		{
			city_name = "万州",
			city_id = 2201
		}
	},
	{
		{
			city_name = "凉山",
			city_id = 2321
		},
		{
			city_name = "甘孜",
			city_id = 2320
		},
		{
			city_name = "阿坝",
			city_id = 2319
		},
		{
			city_name = "资阳市",
			city_id = 2318
		},
		{
			city_name = "巴中市",
			city_id = 2317
		},
		{
			city_name = "雅安市",
			city_id = 2316
		},
		{
			city_name = "达州市",
			city_id = 2315
		},
		{
			city_name = "广安市",
			city_id = 2314
		},
		{
			city_name = "宜宾市",
			city_id = 2313
		},
		{
			city_name = "眉山市",
			city_id = 2312
		},
		{
			city_name = "南充市",
			city_id = 2311
		},
		{
			city_name = "乐山市",
			city_id = 2310
		},
		{
			city_name = "内江市",
			city_id = 2309
		},
		{
			city_name = "遂宁市",
			city_id = 2308
		},
		{
			city_name = "广元市",
			city_id = 2307
		},
		{
			city_name = "绵阳市",
			city_id = 2306
		},
		{
			city_name = "德阳市",
			city_id = 2305
		},
		{
			city_name = "泸州市",
			city_id = 2304
		},
		{
			city_name = "攀枝花市",
			city_id = 2303
		},
		{
			city_name = "自贡市",
			city_id = 2302
		},
		{
			city_name = "成都市",
			city_id = 2301
		}
	},
	{
		{
			city_name = "黔南",
			city_id = 2409
		},
		{
			city_name = "黔东南",
			city_id = 2408
		},
		{
			city_name = "毕节市",
			city_id = 2407
		},
		{
			city_name = "黔西南",
			city_id = 2406
		},
		{
			city_name = "铜仁市",
			city_id = 2405
		},
		{
			city_name = "安顺市",
			city_id = 2404
		},
		{
			city_name = "遵义市",
			city_id = 2403
		},
		{
			city_name = "六盘水市",
			city_id = 2402
		},
		{
			city_name = "贵阳市",
			city_id = 2401
		}
	},
	{
		{
			city_name = "迪庆",
			city_id = 2516
		},
		{
			city_name = "怒江",
			city_id = 2515
		},
		{
			city_name = "德宏",
			city_id = 2514
		},
		{
			city_name = "大理",
			city_id = 2513
		},
		{
			city_name = "西双版纳",
			city_id = 2512
		},
		{
			city_name = "文山",
			city_id = 2511
		},
		{
			city_name = "红河",
			city_id = 2510
		},
		{
			city_name = "楚雄",
			city_id = 2509
		},
		{
			city_name = "临沧市",
			city_id = 2508
		},
		{
			city_name = "普洱市",
			city_id = 2507
		},
		{
			city_name = "丽江市",
			city_id = 2506
		},
		{
			city_name = "昭通市",
			city_id = 2505
		},
		{
			city_name = "保山市",
			city_id = 2504
		},
		{
			city_name = "玉溪市",
			city_id = 2503
		},
		{
			city_name = "曲靖市",
			city_id = 2502
		},
		{
			city_name = "昆明市",
			city_id = 2501
		}
	},
	{
		{
			city_name = "林芝市",
			city_id = 2607
		},
		{
			city_name = "阿里地区",
			city_id = 2606
		},
		{
			city_name = "那曲地区",
			city_id = 2605
		},
		{
			city_name = "日喀则市",
			city_id = 2604
		},
		{
			city_name = "山南市",
			city_id = 2603
		},
		{
			city_name = "昌都市",
			city_id = 2602
		},
		{
			city_name = "拉萨市",
			city_id = 2601
		}
	},
	{
		{
			city_name = "商洛市",
			city_id = 2710
		},
		{
			city_name = "安康市",
			city_id = 2709
		},
		{
			city_name = "榆林市",
			city_id = 2708
		},
		{
			city_name = "汉中市",
			city_id = 2707
		},
		{
			city_name = "延安市",
			city_id = 2706
		},
		{
			city_name = "渭南市",
			city_id = 2705
		},
		{
			city_name = "咸阳市",
			city_id = 2704
		},
		{
			city_name = "宝鸡市",
			city_id = 2703
		},
		{
			city_name = "铜川市",
			city_id = 2702
		},
		{
			city_name = "西安市",
			city_id = 2701
		}
	},
	{
		{
			city_name = "甘南",
			city_id = 2814
		},
		{
			city_name = "临夏",
			city_id = 2813
		},
		{
			city_name = "陇南市",
			city_id = 2812
		},
		{
			city_name = "定西市",
			city_id = 2811
		},
		{
			city_name = "庆阳市",
			city_id = 2810
		},
		{
			city_name = "酒泉市",
			city_id = 2809
		},
		{
			city_name = "平凉市",
			city_id = 2808
		},
		{
			city_name = "张掖市",
			city_id = 2807
		},
		{
			city_name = "武威市",
			city_id = 2806
		},
		{
			city_name = "天水市",
			city_id = 2805
		},
		{
			city_name = "白银市",
			city_id = 2804
		},
		{
			city_name = "金昌市",
			city_id = 2803
		},
		{
			city_name = "嘉峪关市",
			city_id = 2802
		},
		{
			city_name = "兰州市",
			city_id = 2801
		}
	},
	{
		{
			city_name = "海西",
			city_id = 2908
		},
		{
			city_name = "玉树",
			city_id = 2907
		},
		{
			city_name = "果洛",
			city_id = 2906
		},
		{
			city_name = "海南",
			city_id = 2905
		},
		{
			city_name = "黄南",
			city_id = 2904
		},
		{
			city_name = "海北",
			city_id = 2903
		},
		{
			city_name = "海东市",
			city_id = 2902
		},
		{
			city_name = "西宁市",
			city_id = 2901
		}
	},
	{
		{
			city_name = "中卫市",
			city_id = 3005
		},
		{
			city_name = "固原市",
			city_id = 3004
		},
		{
			city_name = "吴忠市",
			city_id = 3003
		},
		{
			city_name = "石嘴山市",
			city_id = 3002
		},
		{
			city_name = "银川市",
			city_id = 3001
		}
	},
	{
		{
			city_name = "北屯市",
			city_id = 3119
		},
		{
			city_name = "五家渠市",
			city_id = 3118
		},
		{
			city_name = "图木舒克市",
			city_id = 3117
		},
		{
			city_name = "阿拉尔市",
			city_id = 3116
		},
		{
			city_name = "石河子市",
			city_id = 3115
		},
		{
			city_name = "阿勒泰",
			city_id = 3114
		},
		{
			city_name = "塔城",
			city_id = 3113
		},
		{
			city_name = "伊犁",
			city_id = 3112
		},
		{
			city_name = "和田",
			city_id = 3111
		},
		{
			city_name = "喀什",
			city_id = 3110
		},
		{
			city_name = "克孜勒苏",
			city_id = 3109
		},
		{
			city_name = "阿克苏",
			city_id = 3108
		},
		{
			city_name = "巴音郭楞",
			city_id = 3107
		},
		{
			city_name = "博尔塔拉",
			city_id = 3106
		},
		{
			city_name = "昌吉",
			city_id = 3105
		},
		{
			city_name = "哈密市",
			city_id = 3104
		},
		{
			city_name = "吐鲁番市",
			city_id = 3103
		},
		{
			city_name = "克拉玛依市",
			city_id = 3102
		},
		{
			city_name = "乌鲁木齐市",
			city_id = 3101
		}
	},
	{
		{
			city_name = "澎湖县",
			city_id = 3225
		},
		{
			city_name = "花莲县",
			city_id = 3224
		},
		{
			city_name = "台东县",
			city_id = 3223
		},
		{
			city_name = "屏东县",
			city_id = 3222
		},
		{
			city_name = "高雄县",
			city_id = 3221
		},
		{
			city_name = "台南县",
			city_id = 3220
		},
		{
			city_name = "嘉义县",
			city_id = 3219
		},
		{
			city_name = "云林县",
			city_id = 3218
		},
		{
			city_name = "南投县",
			city_id = 3217
		},
		{
			city_name = "彰化县",
			city_id = 3216
		},
		{
			city_name = "台中县",
			city_id = 3215
		},
		{
			city_name = "苗栗县",
			city_id = 3214
		},
		{
			city_name = "新竹县",
			city_id = 3213
		},
		{
			city_name = "桃源县",
			city_id = 3212
		},
		{
			city_name = "宜兰县",
			city_id = 3211
		},
		{
			city_name = "新北市",
			city_id = 3210
		},
		{
			city_name = "嘉义市",
			city_id = 3209
		},
		{
			city_name = "新竹市",
			city_id = 3208
		},
		{
			city_name = "桃园市",
			city_id = 3207
		},
		{
			city_name = "新北市",
			city_id = 3206
		},
		{
			city_name = "台南市",
			city_id = 3205
		},
		{
			city_name = "台中市",
			city_id = 3204
		},
		{
			city_name = "基隆市",
			city_id = 3203
		},
		{
			city_name = "高雄市",
			city_id = 3202
		},
		{
			city_name = "台北市",
			city_id = 3201
		}
	},
	{
		{
			city_name = "特别行政区",
			city_id = 3301
		}
	},
	{
		{
			city_name = "特别行政区",
			city_id = 3401
		}
	}
}
Config.RoleData.data_city_id_to_province_id_length = 476
Config.RoleData.data_city_id_to_province_id_cache = {}

function Config.RoleData.data_city_id_to_province_id(slot0)
	if Config.RoleData.data_city_id_to_province_id_cache[slot0] == nil then
		if not Config.RoleData.data_city_id_to_province_id_table[slot0] then
			return
		end

		if not loadstring(string.format("return %s", slot1))() then
			return
		end

		Config.RoleData.data_city_id_to_province_id_cache[slot0] = {
			province_id = slot1[1],
			province_name = slot1[2],
			city_name = slot1[3]
		}
	end

	return Config.RoleData.data_city_id_to_province_id_cache[slot0]
end

Config.RoleData.data_city_id_to_province_id_table = {
	[3112.0] = "{31, \"新疆\", \"伊犁\"}",
	[2228.0] = "{22, \"重庆市\", \"开县\"}",
	[2311.0] = "{23, \"四川\", \"南充市\"}",
	[2212.0] = "{22, \"重庆市\", \"双桥\"}",
	[2405.0] = "{24, \"贵州\", \"铜仁市\"}",
	[1616.0] = "{16, \"河南\", \"周口市\"}",
	[1712.0] = "{17, \"湖北\", \"随州市\"}",
	[3401.0] = "{34, \"澳门\", \"特别行政区\"}",
	[2005.0] = "{20, \"广西\", \"北海市\"}",
	[1206.0] = "{12, \"安徽\", \"淮北市\"}",
	[3203.0] = "{32, \"台湾\", \"基隆市\"}",
	[3223.0] = "{32, \"台湾\", \"台东县\"}",
	[2705.0] = "{27, \"陕西\", \"渭南市\"}",
	[3207.0] = "{32, \"台湾\", \"桃园市\"}",
	[605.0] = "{6, \"辽宁\", \"本溪市\"}",
	[2115.0] = "{21, \"海南\", \"乐东\"}",
	[609.0] = "{6, \"辽宁\", \"阜新市\"}",
	[2709.0] = "{27, \"陕西\", \"安康市\"}",
	[2516.0] = "{25, \"云南\", \"迪庆\"}",
	[2112.0] = "{21, \"海南\", \"临高\"}",
	[116.0] = "{1, \"北京市\", \"延庆\"}",
	[2237.0] = "{22, \"重庆市\", \"彭水\"}",
	[1517.0] = "{15, \"山东\", \"菏泽市\"}",
	[2904.0] = "{29, \"青海\", \"黄南\"}",
	[2308.0] = "{23, \"四川\", \"遂宁市\"}",
	[3205.0] = "{32, \"台湾\", \"台南市\"}",
	[3213.0] = "{32, \"台湾\", \"新竹县\"}",
	[2221.0] = "{22, \"重庆市\", \"璧山\"}",
	[2225.0] = "{22, \"重庆市\", \"垫江\"}",
	[2905.0] = "{29, \"青海\", \"海南\"}",
	[3110.0] = "{31, \"新疆\", \"喀什\"}",
	[3209.0] = "{32, \"台湾\", \"嘉义市\"}",
	[2230.0] = "{22, \"重庆市\", \"奉节\"}",
	[2227.0] = "{22, \"重庆市\", \"忠县\"}",
	[2007.0] = "{20, \"广西\", \"钦州市\"}",
	[2211.0] = "{22, \"重庆市\", \"万盛\"}",
	[2404.0] = "{24, \"贵州\", \"安顺市\"}",
	[305.0] = "{3, \"河北\", \"邢台市\"}",
	[909.0] = "{9, \"上海市\", \"杨浦\"}",
	[307.0] = "{3, \"河北\", \"张家口市\"}",
	[2239.0] = "{22, \"重庆市\", \"合川\"}",
	[309.0] = "{3, \"河北\", \"沧州市\"}",
	[901.0] = "{9, \"上海市\", \"黄浦\"}",
	[3222.0] = "{32, \"台湾\", \"屏东县\"}",
	[2704.0] = "{27, \"陕西\", \"咸阳市\"}",
	[3206.0] = "{32, \"台湾\", \"新北市\"}",
	[2231.0] = "{22, \"重庆市\", \"巫山\"}",
	[1814.0] = "{18, \"湖南\", \"湘西\"}",
	[913.0] = "{9, \"上海市\", \"浦东新\"}",
	[301.0] = "{3, \"河北\", \"石家庄市\"}",
	[2515.0] = "{25, \"云南\", \"怒江\"}",
	[1308.0] = "{13, \"福建\", \"龙岩市\"}",
	[3117.0] = "{31, \"新疆\", \"图木舒克市\"}",
	[1806.0] = "{18, \"湖南\", \"岳阳市\"}",
	[1109.0] = "{11, \"浙江\", \"舟山市\"}",
	[1910.0] = "{19, \"广东\", \"肇庆市\"}",
	[2307.0] = "{23, \"四川\", \"广元市\"}",
	[1918.0] = "{19, \"广东\", \"中山市\"}",
	[2710.0] = "{27, \"陕西\", \"商洛市\"}",
	[1404.0] = "{14, \"江西\", \"九江市\"}",
	[2104.0] = "{21, \"海南\", \"儋州市\"}",
	[1902.0] = "{19, \"广东\", \"韶关市\"}",
	[1615.0] = "{16, \"河南\", \"信阳市\"}",
	[3116.0] = "{31, \"新疆\", \"阿拉尔市\"}",
	[1607.0] = "{16, \"河南\", \"新乡市\"}",
	[2226.0] = "{22, \"重庆市\", \"武隆\"}",
	[3211.0] = "{32, \"台湾\", \"宜兰县\"}",
	[2210.0] = "{22, \"重庆市\", \"两江新\"}",
	[2403.0] = "{24, \"贵州\", \"遵义市\"}",
	[2803.0] = "{28, \"甘肃\", \"金昌市\"}",
	[2802.0] = "{28, \"甘肃\", \"嘉峪关市\"}",
	[2004.0] = "{20, \"广西\", \"梧州市\"}",
	[2001.0] = "{20, \"广西\", \"南宁市\"}",
	[2703.0] = "{27, \"陕西\", \"宝鸡市\"}",
	[2706.0] = "{27, \"陕西\", \"延安市\"}",
	[3221.0] = "{32, \"台湾\", \"高雄县\"}",
	[2503.0] = "{25, \"云南\", \"玉溪市\"}",
	[1711.0] = "{17, \"湖北\", \"咸宁市\"}",
	[2812.0] = "{28, \"甘肃\", \"陇南市\"}",
	[2113.0] = "{21, \"海南\", \"白沙\"}",
	[2907.0] = "{29, \"青海\", \"玉树\"}",
	[3201.0] = "{32, \"台湾\", \"台北市\"}",
	[2514.0] = "{25, \"云南\", \"德宏\"}",
	[1005.0] = "{10, \"江苏\", \"苏州市\"}",
	[1704.0] = "{17, \"湖北\", \"宜昌市\"}",
	[1001.0] = "{10, \"江苏\", \"南京市\"}",
	[1516.0] = "{15, \"山东\", \"滨州市\"}",
	[1701.0] = "{17, \"湖北\", \"武汉市\"}",
	[2306.0] = "{23, \"四川\", \"绵阳市\"}",
	[3301.0] = "{33, \"香港\", \"特别行政区\"}",
	[1618.0] = "{16, \"河南\", \"济源市\"}",
	[1916.0] = "{19, \"广东\", \"清远市\"}",
	[2806.0] = "{28, \"甘肃\", \"武威市\"}",
	[2607.0] = "{26, \"西藏\", \"林芝市\"}",
	[512.0] = "{5, \"内蒙古\", \"阿拉善盟\"}",
	[2241.0] = "{22, \"重庆市\", \"南川\"}",
	[2014.0] = "{20, \"广西\", \"崇左市\"}",
	[3109.0] = "{31, \"新疆\", \"克孜勒苏\"}",
	[2006.0] = "{20, \"广西\", \"防城港市\"}",
	[2209.0] = "{22, \"重庆市\", \"北碚\"}",
	[2402.0] = "{24, \"贵州\", \"六盘水市\"}",
	[1605.0] = "{16, \"河南\", \"安阳市\"}",
	[1604.0] = "{16, \"河南\", \"平顶山市\"}",
	[1602.0] = "{16, \"河南\", \"开封市\"}",
	[1601.0] = "{16, \"河南\", \"郑州市\"}",
	[2702.0] = "{27, \"陕西\", \"铜川市\"}",
	[3210.0] = "{32, \"台湾\", \"新北市\"}",
	[3220.0] = "{32, \"台湾\", \"台南县\"}",
	[1702.0] = "{17, \"湖北\", \"黄石市\"}",
	[3204.0] = "{32, \"台湾\", \"台中市\"}",
	[1511.0] = "{15, \"山东\", \"日照市\"}",
	[1813.0] = "{18, \"湖南\", \"娄底市\"}",
	[1510.0] = "{15, \"山东\", \"威海市\"}",
	[1509.0] = "{15, \"山东\", \"泰安市\"}",
	[2513.0] = "{25, \"云南\", \"大理\"}",
	[805.0] = "{8, \"黑龙江\", \"双鸭山市\"}",
	[1307.0] = "{13, \"福建\", \"南平市\"}",
	[1805.0] = "{18, \"湖南\", \"邵阳市\"}",
	[1108.0] = "{11, \"浙江\", \"衢州市\"}",
	[1909.0] = "{19, \"广东\", \"茂名市\"}",
	[2305.0] = "{23, \"四川\", \"德阳市\"}",
	[1917.0] = "{19, \"广东\", \"东莞市\"}",
	[2321.0] = "{23, \"四川\", \"凉山\"}",
	[1505.0] = "{15, \"山东\", \"东营市\"}",
	[1403.0] = "{14, \"江西\", \"萍乡市\"}",
	[1901.0] = "{19, \"广东\", \"广州市\"}",
	[1614.0] = "{16, \"河南\", \"商丘市\"}",
	[2240.0] = "{22, \"重庆市\", \"永川\"}",
	[1606.0] = "{16, \"河南\", \"鹤壁市\"}",
	[2224.0] = "{22, \"重庆市\", \"丰都\"}",
	[2804.0] = "{28, \"甘肃\", \"白银市\"}",
	[2208.0] = "{22, \"重庆市\", \"南岸\"}",
	[2401.0] = "{24, \"贵州\", \"贵阳市\"}",
	[1501.0] = "{15, \"山东\", \"济南市\"}",
	[3119.0] = "{31, \"新疆\", \"北屯市\"}",
	[1507.0] = "{15, \"山东\", \"潍坊市\"}",
	[1303.0] = "{13, \"福建\", \"莆田市\"}",
	[2701.0] = "{27, \"陕西\", \"西安市\"}",
	[1302.0] = "{13, \"福建\", \"厦门市\"}",
	[3219.0] = "{32, \"台湾\", \"嘉义县\"}",
	[1214.0] = "{12, \"安徽\", \"亳州市\"}",
	[1710.0] = "{17, \"湖北\", \"黄冈市\"}",
	[604.0] = "{6, \"辽宁\", \"抚顺市\"}",
	[1411.0] = "{14, \"江西\", \"上饶市\"}",
	[2111.0] = "{21, \"海南\", \"澄迈\"}",
	[1212.0] = "{12, \"安徽\", \"宿州市\"}",
	[2512.0] = "{25, \"云南\", \"西双版纳\"}",
	[2504.0] = "{25, \"云南\", \"保山市\"}",
	[1205.0] = "{12, \"安徽\", \"马鞍山市\"}",
	[1515.0] = "{15, \"山东\", \"聊城市\"}",
	[1204.0] = "{12, \"安徽\", \"淮南市\"}",
	[2813.0] = "{28, \"甘肃\", \"临夏\"}",
	[2303.0] = "{23, \"四川\", \"攀枝花市\"}",
	[2801.0] = "{28, \"甘肃\", \"兰州市\"}",
	[2320.0] = "{23, \"四川\", \"甘孜\"}",
	[1506.0] = "{15, \"山东\", \"烟台市\"}",
	[1107.0] = "{11, \"浙江\", \"金华市\"}",
	[2605.0] = "{26, \"西藏\", \"那曲地区\"}",
	[216.0] = "{2, \"天津市\", \"蓟县\"}",
	[1105.0] = "{11, \"浙江\", \"湖州市\"}",
	[2013.0] = "{20, \"广西\", \"来宾市\"}",
	[3107.0] = "{31, \"新疆\", \"巴音郭楞\"}",
	[2223.0] = "{22, \"重庆市\", \"城口\"}",
	[1103.0] = "{11, \"浙江\", \"温州市\"}",
	[2207.0] = "{22, \"重庆市\", \"九龙坡\"}",
	[1102.0] = "{11, \"浙江\", \"宁波市\"}",
	[908.0] = "{9, \"上海市\", \"虹口\"}",
	[1013.0] = "{10, \"江苏\", \"宿迁市\"}",
	[1011.0] = "{10, \"江苏\", \"镇江市\"}",
	[1010.0] = "{10, \"江苏\", \"扬州市\"}",
	[210.0] = "{2, \"天津市\", \"津南\"}",
	[3218.0] = "{32, \"台湾\", \"云林县\"}",
	[211.0] = "{2, \"天津市\", \"北辰\"}",
	[3202.0] = "{32, \"台湾\", \"高雄市\"}",
	[3005.0] = "{30, \"宁夏\", \"中卫市\"}",
	[1812.0] = "{18, \"湖南\", \"怀化市\"}",
	[2110.0] = "{21, \"海南\", \"屯昌\"}",
	[2511.0] = "{25, \"云南\", \"文山\"}",
	[916.0] = "{9, \"上海市\", \"奉贤\"}",
	[1703.0] = "{17, \"湖北\", \"十堰市\"}",
	[1306.0] = "{13, \"福建\", \"漳州市\"}",
	[1804.0] = "{18, \"湖南\", \"衡阳市\"}",
	[212.0] = "{2, \"天津市\", \"宁河\"}",
	[1908.0] = "{19, \"广东\", \"湛江市\"}",
	[2302.0] = "{23, \"四川\", \"自贡市\"}",
	[2319.0] = "{23, \"四川\", \"阿坝\"}",
	[917.0] = "{9, \"上海市\", \"青浦\"}",
	[201.0] = "{2, \"天津市\", \"河西\"}",
	[1402.0] = "{14, \"江西\", \"景德镇市\"}",
	[2604.0] = "{26, \"西藏\", \"日喀则市\"}",
	[1613.0] = "{16, \"河南\", \"南阳市\"}",
	[703.0] = "{7, \"吉林\", \"四平市\"}",
	[2238.0] = "{22, \"重庆市\", \"江津\"}",
	[3106.0] = "{31, \"新疆\", \"博尔塔拉\"}",
	[2222.0] = "{22, \"重庆市\", \"梁平\"}",
	[205.0] = "{2, \"天津市\", \"河北\"}",
	[2206.0] = "{22, \"重庆市\", \"沙坪坝\"}",
	[204.0] = "{2, \"天津市\", \"南开\"}",
	[403.0] = "{4, \"山西\", \"阳泉市\"}",
	[1717.0] = "{17, \"湖北\", \"神农架\"}",
	[1203.0] = "{12, \"安徽\", \"蚌埠市\"}",
	[206.0] = "{2, \"天津市\", \"红桥\"}",
	[1211.0] = "{12, \"安徽\", \"阜阳市\"}",
	[3217.0] = "{32, \"台湾\", \"南投县\"}",
	[405.0] = "{4, \"山西\", \"晋城市\"}",
	[1709.0] = "{17, \"湖北\", \"荆州市\"}",
	[3004.0] = "{30, \"宁夏\", \"固原市\"}",
	[1410.0] = "{14, \"江西\", \"抚州市\"}",
	[2109.0] = "{21, \"海南\", \"东方市\"}",
	[2510.0] = "{25, \"云南\", \"红河\"}",
	[906.0] = "{9, \"上海市\", \"闸北\"}",
	[1004.0] = "{10, \"江苏\", \"常州市\"}",
	[905.0] = "{9, \"上海市\", \"静安\"}",
	[1514.0] = "{15, \"山东\", \"德州市\"}",
	[904.0] = "{9, \"上海市\", \"长宁\"}",
	[2811.0] = "{28, \"甘肃\", \"定西市\"}",
	[2301.0] = "{23, \"四川\", \"成都市\"}",
	[2318.0] = "{23, \"四川\", \"资阳市\"}",
	[3102.0] = "{31, \"新疆\", \"克拉玛依市\"}",
	[813.0] = "{8, \"黑龙江\", \"大兴安岭\"}",
	[812.0] = "{8, \"黑龙江\", \"绥化市\"}",
	[2603.0] = "{26, \"西藏\", \"山南市\"}",
	[811.0] = "{8, \"黑龙江\", \"黑河市\"}",
	[1012.0] = "{10, \"江苏\", \"泰州市\"}",
	[2012.0] = "{20, \"广西\", \"河池市\"}",
	[3105.0] = "{31, \"新疆\", \"昌吉\"}",
	[2908.0] = "{29, \"青海\", \"海西\"}",
	[810.0] = "{8, \"黑龙江\", \"牡丹江市\"}",
	[2205.0] = "{22, \"重庆市\", \"江北\"}",
	[809.0] = "{8, \"黑龙江\", \"七台河市\"}",
	[505.0] = "{5, \"内蒙古\", \"通辽市\"}",
	[1508.0] = "{15, \"山东\", \"济宁市\"}",
	[503.0] = "{5, \"内蒙古\", \"乌海市\"}",
	[709.0] = "{7, \"吉林\", \"延边\"}",
	[501.0] = "{5, \"内蒙古\", \"呼和浩特市\"}",
	[3216.0] = "{32, \"台湾\", \"彰化县\"}",
	[707.0] = "{7, \"吉林\", \"松原市\"}",
	[706.0] = "{7, \"吉林\", \"白山市\"}",
	[3003.0] = "{30, \"宁夏\", \"吴忠市\"}",
	[705.0] = "{7, \"吉林\", \"通化市\"}",
	[1811.0] = "{18, \"湖南\", \"永州市\"}",
	[2509.0] = "{25, \"云南\", \"楚雄\"}",
	[704.0] = "{7, \"吉林\", \"辽源市\"}",
	[804.0] = "{8, \"黑龙江\", \"鹤岗市\"}",
	[1305.0] = "{13, \"福建\", \"泉州市\"}",
	[914.0] = "{9, \"上海市\", \"金山\"}",
	[1803.0] = "{18, \"湖南\", \"湘潭市\"}",
	[2810.0] = "{28, \"甘肃\", \"庆阳市\"}",
	[1907.0] = "{19, \"广东\", \"江门市\"}",
	[2317.0] = "{23, \"四川\", \"巴中市\"}",
	[1915.0] = "{19, \"广东\", \"阳江市\"}",
	[702.0] = "{7, \"吉林\", \"吉林市\"}",
	[1401.0] = "{14, \"江西\", \"南昌市\"}",
	[2602.0] = "{26, \"西藏\", \"昌都市\"}",
	[1612.0] = "{16, \"河南\", \"三门峡市\"}",
	[701.0] = "{7, \"吉林\", \"长春市\"}",
	[2236.0] = "{22, \"重庆市\", \"酉阳\"}",
	[3104.0] = "{31, \"新疆\", \"哈密市\"}",
	[2220.0] = "{22, \"重庆市\", \"荣昌\"}",
	[613.0] = "{6, \"辽宁\", \"朝阳市\"}",
	[2204.0] = "{22, \"重庆市\", \"大渡口\"}",
	[612.0] = "{6, \"辽宁\", \"铁岭市\"}",
	[611.0] = "{6, \"辽宁\", \"盘锦市\"}",
	[1716.0] = "{17, \"湖北\", \"天门市\"}",
	[1202.0] = "{12, \"安徽\", \"芜湖市\"}",
	[610.0] = "{6, \"辽宁\", \"辽阳市\"}",
	[1210.0] = "{12, \"安徽\", \"滁州市\"}",
	[2814.0] = "{28, \"甘肃\", \"甘南\"}",
	[3215.0] = "{32, \"台湾\", \"台中县\"}",
	[1708.0] = "{17, \"湖北\", \"孝感市\"}",
	[3002.0] = "{30, \"宁夏\", \"石嘴山市\"}",
	[1409.0] = "{14, \"江西\", \"宜春市\"}",
	[2107.0] = "{21, \"海南\", \"文昌市\"}",
	[2508.0] = "{25, \"云南\", \"临沧市\"}",
	[608.0] = "{6, \"辽宁\", \"营口市\"}",
	[607.0] = "{6, \"辽宁\", \"锦州市\"}",
	[2606.0] = "{26, \"西藏\", \"阿里地区\"}",
	[1513.0] = "{15, \"山东\", \"临沂市\"}",
	[1213.0] = "{12, \"安徽\", \"六安市\"}",
	[2809.0] = "{28, \"甘肃\", \"酒泉市\"}",
	[603.0] = "{6, \"辽宁\", \"鞍山市\"}",
	[2316.0] = "{23, \"四川\", \"雅安市\"}",
	[3103.0] = "{31, \"新疆\", \"吐鲁番市\"}",
	[601.0] = "{6, \"辽宁\", \"沈阳市\"}",
	[3108.0] = "{31, \"新疆\", \"阿克苏\"}",
	[2601.0] = "{26, \"西藏\", \"拉萨市\"}",
	[511.0] = "{5, \"内蒙古\", \"锡林郭勒盟\"}",
	[2011.0] = "{20, \"广西\", \"贺州市\"}",
	[2235.0] = "{22, \"重庆市\", \"秀山\"}",
	[2003.0] = "{20, \"广西\", \"桂林市\"}",
	[2219.0] = "{22, \"重庆市\", \"大足\"}",
	[907.0] = "{9, \"上海市\", \"普陀\"}",
	[2203.0] = "{22, \"重庆市\", \"渝中\"}",
	[911.0] = "{9, \"上海市\", \"宝山\"}",
	[306.0] = "{3, \"河北\", \"保定市\"}",
	[509.0] = "{5, \"内蒙古\", \"乌兰察布市\"}",
	[308.0] = "{3, \"河北\", \"承德市\"}",
	[903.0] = "{9, \"上海市\", \"徐汇\"}",
	[310.0] = "{3, \"河北\", \"廊坊市\"}",
	[506.0] = "{5, \"内蒙古\", \"鄂尔多斯市\"}",
	[3214.0] = "{32, \"台湾\", \"苗栗县\"}",
	[808.0] = "{8, \"黑龙江\", \"佳木斯市\"}",
	[3001.0] = "{30, \"宁夏\", \"银川市\"}",
	[915.0] = "{9, \"上海市\", \"松江\"}",
	[1810.0] = "{18, \"湖南\", \"郴州市\"}",
	[2507.0] = "{25, \"云南\", \"普洱市\"}",
	[302.0] = "{3, \"河北\", \"唐山市\"}",
	[708.0] = "{7, \"吉林\", \"白城市\"}",
	[1304.0] = "{13, \"福建\", \"三明市\"}",
	[411.0] = "{4, \"山西\", \"吕梁市\"}",
	[1802.0] = "{18, \"湖南\", \"株洲市\"}",
	[2808.0] = "{28, \"甘肃\", \"平凉市\"}",
	[1906.0] = "{19, \"广东\", \"佛山市\"}",
	[2315.0] = "{23, \"四川\", \"达州市\"}",
	[1914.0] = "{19, \"广东\", \"河源市\"}",
	[410.0] = "{4, \"山西\", \"临汾市\"}",
	[409.0] = "{4, \"山西\", \"忻州市\"}",
	[408.0] = "{4, \"山西\", \"运城市\"}",
	[407.0] = "{4, \"山西\", \"晋中市\"}",
	[1611.0] = "{16, \"河南\", \"漯河市\"}",
	[3118.0] = "{31, \"新疆\", \"五家渠市\"}",
	[1603.0] = "{16, \"河南\", \"洛阳市\"}",
	[2218.0] = "{22, \"重庆市\", \"铜梁\"}",
	[406.0] = "{4, \"山西\", \"朔州市\"}",
	[2202.0] = "{22, \"重庆市\", \"涪陵\"}",
	[1101.0] = "{11, \"浙江\", \"杭州市\"}",
	[1715.0] = "{17, \"湖北\", \"潜江市\"}",
	[910.0] = "{9, \"上海市\", \"闵行\"}",
	[1201.0] = "{12, \"安徽\", \"合肥市\"}",
	[401.0] = "{4, \"山西\", \"太原市\"}",
	[1209.0] = "{12, \"安徽\", \"黄山市\"}",
	[311.0] = "{3, \"河北\", \"衡水市\"}",
	[1707.0] = "{17, \"湖北\", \"荆门市\"}",
	[507.0] = "{5, \"内蒙古\", \"呼伦贝尔市\"}",
	[2304.0] = "{23, \"四川\", \"泸州市\"}",
	[1408.0] = "{14, \"江西\", \"吉安市\"}",
	[2105.0] = "{21, \"海南\", \"五指山市\"}",
	[2506.0] = "{25, \"云南\", \"丽江市\"}",
	[508.0] = "{5, \"内蒙古\", \"巴彦淖尔市\"}",
	[2114.0] = "{21, \"海南\", \"昌江\"}",
	[1007.0] = "{10, \"江苏\", \"连云港市\"}",
	[1512.0] = "{15, \"山东\", \"莱芜市\"}",
	[1003.0] = "{10, \"江苏\", \"徐州市\"}",
	[1504.0] = "{15, \"山东\", \"枣庄市\"}",
	[2807.0] = "{28, \"甘肃\", \"张掖市\"}",
	[2314.0] = "{23, \"四川\", \"广安市\"}",
	[3101.0] = "{31, \"新疆\", \"乌鲁木齐市\"}",
	[510.0] = "{5, \"内蒙古\", \"兴安盟\"}",
	[2234.0] = "{22, \"重庆市\", \"石柱\"}",
	[304.0] = "{3, \"河北\", \"邯郸市\"}",
	[303.0] = "{3, \"河北\", \"秦皇岛市\"}",
	[2010.0] = "{20, \"广西\", \"百色市\"}",
	[2233.0] = "{22, \"重庆市\", \"黔江\"}",
	[2002.0] = "{20, \"广西\", \"柳州市\"}",
	[2217.0] = "{22, \"重庆市\", \"潼南\"}",
	[801.0] = "{8, \"黑龙江\", \"哈尔滨市\"}",
	[2201.0] = "{22, \"重庆市\", \"万州\"}",
	[3111.0] = "{31, \"新疆\", \"和田\"}",
	[1106.0] = "{11, \"浙江\", \"绍兴市\"}",
	[215.0] = "{2, \"天津市\", \"宝坻\"}",
	[214.0] = "{2, \"天津市\", \"静海\"}",
	[213.0] = "{2, \"天津市\", \"武清\"}",
	[918.0] = "{9, \"上海市\", \"崇明\"}",
	[1008.0] = "{10, \"江苏\", \"淮安市\"}",
	[3212.0] = "{32, \"台湾\", \"桃源县\"}",
	[1009.0] = "{10, \"江苏\", \"盐城市\"}",
	[209.0] = "{2, \"天津市\", \"西青\"}",
	[208.0] = "{2, \"天津市\", \"东丽\"}",
	[1809.0] = "{18, \"湖南\", \"益阳市\"}",
	[2505.0] = "{25, \"云南\", \"昭通市\"}",
	[807.0] = "{8, \"黑龙江\", \"伊春市\"}",
	[207.0] = "{2, \"天津市\", \"滨海新\"}",
	[803.0] = "{8, \"黑龙江\", \"鸡西市\"}",
	[2106.0] = "{21, \"海南\", \"琼海市\"}",
	[1801.0] = "{18, \"湖南\", \"长沙市\"}",
	[1104.0] = "{11, \"浙江\", \"嘉兴市\"}",
	[1905.0] = "{19, \"广东\", \"汕头市\"}",
	[2313.0] = "{23, \"四川\", \"宜宾市\"}",
	[1913.0] = "{19, \"广东\", \"汕尾市\"}",
	[1407.0] = "{14, \"江西\", \"赣州市\"}",
	[2906.0] = "{29, \"青海\", \"果洛\"}",
	[912.0] = "{9, \"上海市\", \"嘉定\"}",
	[203.0] = "{2, \"天津市\", \"河东\"}",
	[1610.0] = "{16, \"河南\", \"许昌市\"}",
	[2232.0] = "{22, \"重庆市\", \"巫溪\"}",
	[2903.0] = "{29, \"青海\", \"海北\"}",
	[2216.0] = "{22, \"重庆市\", \"綦江\"}",
	[202.0] = "{2, \"天津市\", \"和平\"}",
	[1705.0] = "{17, \"湖北\", \"襄阳市\"}",
	[2409.0] = "{24, \"贵州\", \"黔南\"}",
	[1714.0] = "{17, \"湖北\", \"仙桃市\"}",
	[2108.0] = "{21, \"海南\", \"万宁市\"}",
	[115.0] = "{1, \"北京市\", \"密云\"}",
	[113.0] = "{1, \"北京市\", \"怀柔\"}",
	[1208.0] = "{12, \"安徽\", \"安庆市\"}",
	[112.0] = "{1, \"北京市\", \"大兴\"}",
	[1706.0] = "{17, \"湖北\", \"鄂州市\"}",
	[602.0] = "{6, \"辽宁\", \"大连市\"}",
	[104.0] = "{1, \"北京市\", \"丰台\"}",
	[606.0] = "{6, \"辽宁\", \"丹东市\"}",
	[103.0] = "{1, \"北京市\", \"朝阳\"}",
	[2103.0] = "{21, \"海南\", \"三沙市\"}",
	[102.0] = "{1, \"北京市\", \"西城\"}",
	[614.0] = "{6, \"辽宁\", \"葫芦岛市\"}",
	[101.0] = "{1, \"北京市\", \"东城\"}",
	[1921.0] = "{19, \"广东\", \"云浮市\"}",
	[107.0] = "{1, \"北京市\", \"门头沟\"}",
	[2805.0] = "{28, \"甘肃\", \"天水市\"}",
	[2312.0] = "{23, \"四川\", \"眉山市\"}",
	[106.0] = "{1, \"北京市\", \"海淀\"}",
	[1216.0] = "{12, \"安徽\", \"宣城市\"}",
	[105.0] = "{1, \"北京市\", \"石景山\"}",
	[2009.0] = "{20, \"广西\", \"玉林市\"}",
	[3115.0] = "{31, \"新疆\", \"石河子市\"}",
	[2902.0] = "{29, \"青海\", \"海东市\"}",
	[1503.0] = "{15, \"山东\", \"淄博市\"}",
	[2215.0] = "{22, \"重庆市\", \"长寿\"}",
	[2408.0] = "{24, \"贵州\", \"黔东南\"}",
	[111.0] = "{1, \"北京市\", \"昌平\"}",
	[902.0] = "{9, \"上海市\", \"卢湾\"}",
	[110.0] = "{1, \"北京市\", \"顺义\"}",
	[2708.0] = "{27, \"陕西\", \"榆林市\"}",
	[109.0] = "{1, \"北京市\", \"通州\"}",
	[2118.0] = "{21, \"海南\", \"琼中\"}",
	[1808.0] = "{18, \"湖南\", \"张家界市\"}",
	[2102.0] = "{21, \"海南\", \"三亚市\"}",
	[108.0] = "{1, \"北京市\", \"房山\"}",
	[1111.0] = "{11, \"浙江\", \"丽水市\"}",
	[1904.0] = "{19, \"广东\", \"珠海市\"}",
	[1912.0] = "{19, \"广东\", \"梅州市\"}",
	[1406.0] = "{14, \"江西\", \"鹰潭市\"}",
	[1609.0] = "{16, \"河南\", \"濮阳市\"}",
	[3114.0] = "{31, \"新疆\", \"阿勒泰\"}",
	[2901.0] = "{29, \"青海\", \"西宁市\"}",
	[2214.0] = "{22, \"重庆市\", \"巴南\"}",
	[2407.0] = "{24, \"贵州\", \"毕节市\"}",
	[1617.0] = "{16, \"河南\", \"驻马店市\"}",
	[1713.0] = "{17, \"湖北\", \"恩施\"}",
	[402.0] = "{4, \"山西\", \"大同市\"}",
	[1207.0] = "{12, \"安徽\", \"铜陵市\"}",
	[3225.0] = "{32, \"台湾\", \"澎湖县\"}",
	[1215.0] = "{12, \"安徽\", \"池州市\"}",
	[2707.0] = "{27, \"陕西\", \"汉中市\"}",
	[404.0] = "{4, \"山西\", \"长治市\"}",
	[2117.0] = "{21, \"海南\", \"保亭\"}",
	[2502.0] = "{25, \"云南\", \"曲靖市\"}",
	[2101.0] = "{21, \"海南\", \"海口市\"}",
	[1006.0] = "{10, \"江苏\", \"南通市\"}",
	[1920.0] = "{19, \"广东\", \"揭阳市\"}",
	[1002.0] = "{10, \"江苏\", \"无锡市\"}",
	[2310.0] = "{23, \"四川\", \"乐山市\"}",
	[2008.0] = "{20, \"广西\", \"贵港市\"}",
	[3113.0] = "{31, \"新疆\", \"塔城\"}",
	[2229.0] = "{22, \"重庆市\", \"云阳\"}",
	[1502.0] = "{15, \"山东\", \"青岛市\"}",
	[2213.0] = "{22, \"重庆市\", \"渝北\"}",
	[2406.0] = "{24, \"贵州\", \"黔西南\"}",
	[504.0] = "{5, \"内蒙古\", \"赤峰市\"}",
	[502.0] = "{5, \"内蒙古\", \"包头市\"}",
	[3224.0] = "{32, \"台湾\", \"花莲县\"}",
	[3208.0] = "{32, \"台湾\", \"新竹市\"}",
	[2116.0] = "{21, \"海南\", \"陵水\"}",
	[2501.0] = "{25, \"云南\", \"昆明市\"}",
	[1301.0] = "{13, \"福建\", \"福州市\"}",
	[806.0] = "{8, \"黑龙江\", \"大庆市\"}",
	[1309.0] = "{13, \"福建\", \"宁德市\"}",
	[802.0] = "{8, \"黑龙江\", \"齐齐哈尔市\"}",
	[1807.0] = "{18, \"湖南\", \"常德市\"}",
	[1110.0] = "{11, \"浙江\", \"台州市\"}",
	[1911.0] = "{19, \"广东\", \"惠州市\"}",
	[2309.0] = "{23, \"四川\", \"内江市\"}",
	[1919.0] = "{19, \"广东\", \"潮州市\"}",
	[1405.0] = "{14, \"江西\", \"新余市\"}",
	[114.0] = "{1, \"北京市\", \"平谷\"}",
	[1903.0] = "{19, \"广东\", \"深圳市\"}",
	[1608.0] = "{16, \"河南\", \"焦作市\"}"
}
