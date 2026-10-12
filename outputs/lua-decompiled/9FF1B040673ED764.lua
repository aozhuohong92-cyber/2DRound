Config = Config or {}
Config.NoticeData = Config.NoticeData or {}
Config.NoticeData.data_get_length = 27
Config.NoticeData.data_get = {
	{
		res = "1007",
		name = "邮件提示",
		can_overly = 1,
		id = 1,
		label = "mail"
	},
	{
		res = "1004",
		name = "加好友提示",
		can_overly = 1,
		id = 2,
		label = "add_friend"
	},
	[4] = {
		res = "1001",
		name = "加公会提示",
		can_overly = 1,
		id = 4,
		label = "join_guild"
	},
	[6] = {
		res = "1006",
		name = "切磋请求",
		can_overly = 1,
		id = 6,
		label = "challenge"
	},
	[8] = {
		res = "1005",
		name = "私聊提示",
		can_overly = 1,
		id = 8,
		label = "private_chat"
	},
	[9] = {
		res = "1002",
		name = "邀请帮会提示",
		can_overly = 1,
		id = 9,
		label = "invite_join_guild"
	},
	[10] = {
		res = "1003",
		name = "集结号角",
		can_overly = 1,
		id = 10,
		label = "guild_mass"
	},
	[11] = {
		res = "1002",
		name = "合并提示",
		can_overly = 1,
		id = 11,
		label = "guild_merge"
	},
	[12] = {
		res = "1006",
		name = "试炼邀请",
		can_overly = 1,
		id = 12,
		label = "team"
	},
	[13] = {
		res = "1008",
		name = "赠送体力",
		can_overly = 1,
		id = 13,
		label = "give"
	},
	[14] = {
		res = "1008",
		name = "世界Boss刷新",
		can_overly = 1,
		id = 14,
		label = "world_boss"
	},
	[15] = {
		res = "1008",
		name = "有人@你",
		can_overly = 1,
		id = 15,
		label = "mention"
	},
	[16] = {
		res = "1008",
		name = "无尽试炼选buff",
		can_overly = 1,
		id = 16,
		label = "endless"
	},
	[17] = {
		res = "1008",
		name = "萌兽夺宝完成",
		can_overly = 1,
		id = 17,
		label = "escort"
	},
	[18] = {
		res = "1008",
		name = "帮会Boss集结",
		can_overly = 1,
		id = 18,
		label = "guild_dun"
	},
	[19] = {
		res = "1008",
		name = "公会捐献提醒",
		can_overly = 1,
		id = 19,
		label = "guild"
	},
	[20] = {
		res = "1008",
		name = "公会战提醒",
		can_overly = 1,
		id = 20,
		label = "guild_war"
	},
	[21] = {
		res = "1008",
		name = "公会副本提醒",
		can_overly = 1,
		id = 21,
		label = "guild_voyage"
	},
	[22] = {
		res = "1008",
		name = "留言板有新消息",
		can_overly = 0,
		id = 22,
		label = "bbs_message"
	},
	[23] = {
		res = "1008",
		name = "他人留言板有新消息",
		can_overly = 0,
		id = 23,
		label = "bbs_message_reply"
	},
	[24] = {
		res = "1008",
		name = "留言板有新回复",
		can_overly = 0,
		id = 24,
		label = "bbs_message_reply_self"
	},
	[25] = {
		res = "1008",
		name = "灵矿防守失败",
		can_overly = 1,
		id = 25,
		label = "mine_defeat"
	},
	[26] = {
		res = "1008",
		name = "巅峰冠军赛竞猜",
		can_overly = 1,
		id = 26,
		label = "Peak_champion_arena_tips"
	},
	[27] = {
		res = "1008",
		name = "跨服竞技场挑战",
		can_overly = 1,
		id = 27,
		label = "Corss_arena_tips"
	},
	[28] = {
		res = "1008",
		name = "限时年兽挑战",
		can_overly = 1,
		id = 28,
		label = "Year_Monster_tips"
	},
	[29] = {
		res = "1008",
		name = "战技合成提醒",
		can_overly = 1,
		id = 29,
		label = "Artifact_Count_tips"
	},
	[30] = {
		res = "1008",
		name = "协力赛挑战提醒",
		can_overly = 1,
		id = 30,
		label = "team_battle_tips"
	}
}

function Config.NoticeData.data_get_fun(slot0)
	slot1 = Config.NoticeData.data_get[slot0]

	if DATA_DEBUG and slot1 == nil then
		print("(Config.NoticeData.data_get[" .. slot0 .. "])not found")

		return
	end

	return slot1
end
