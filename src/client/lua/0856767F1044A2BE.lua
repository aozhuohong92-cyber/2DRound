ChatConst = ChatConst or {}
ChatConst.Player = 1
ChatConst.GM = 2
ChatConst.Notice = 4
ChatConst.System = 8
ChatConst.Gang = 10
ChatConst.TYPE_WORD = 0
ChatConst.TYPE_VOICE = 1
ChatConst.TYPE_TASK = 2
ChatConst.TYPE_HERO = 3
ChatConst.TYPE_PACK = 4
ChatConst.Voice_Translate_Main = "chat_voice_translate_main"
ChatConst.Voice_Translate_Panel = "chat_voice_translate_panel"
ChatConst.AdjustMainChatZorder = "ChatConst.AdjustMainChatZorder"
ChatConst.Link = {
	BigworldBossPos = 17,
	Crossarena_honour = 59,
	Guild_Join = 6,
	Item_Show = 49,
	Guild_mem_red = 7,
	select_elite_summon = 71,
	voyage_Luxury_privilege = 70,
	Crosschampion = 65,
	Honor_Icon = 61,
	BargainHelp = 15,
	Crossarena = 58,
	Open_Ladder = 52,
	Open_Vedio_info = 57,
	Growth_Way = 64,
	Action_Treasure = 60,
	Elfin_Summon = 68,
	BigworldBoss = 16,
	voyage_senior_privilege = 69,
	Task_Exp = 62,
	Watch_Ladder = 51,
	Honor_Level = 63,
	OtherRole = 18,
	Guild_show_red = 8
}
ChatConst.Channel = {
	SystemTop = 128,
	Scene = 2,
	Notice = 16,
	System = 64,
	Gang = 4,
	Friend = 7,
	NoticeTop = 32,
	Multi = -1,
	Team_Sys = 512,
	World = 1,
	Whole = 0,
	Cross = 1024,
	Team = 8,
	Drama = 99,
	Gang_Sys = 256,
	Province = 2048
}
ChatConst.ContFlag = {
	Show = 2,
	Voice = 1,
	Normal = 0
}
ChatConst.ChannelRes = {
	[0] = "world",
	"world",
	"scene",
	nil,
	"gang",
	nil,
	nil,
	"friend",
	"system",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"notice",
	[256.0] = "gang",
	[64.0] = "system",
	[1024.0] = "cross",
	[99.0] = "drama",
	[512.0] = "system"
}
ChatConst.capacity = {
	[0] = ""
}
ChatConst.ornament = {
	{
		y = 17,
		x = 13,
		type = 1
	},
	{
		y = 3,
		x = 9,
		type = 2
	}
}
ChatConst.ornamentAnchor = {
	cc.p(1, 1),
	cc.p(0, 0)
}
ChatConst.ViewType = {
	Adventure = 2,
	Normal = 1
}
ChatConst.ChatBoxHeight = {
	[ChatConst.ViewType.Normal] = {
		231,
		412
	},
	[ChatConst.ViewType.Adventure] = {
		131,
		412
	}
}
ChatConst.ChatPanelHeight = {
	[ChatConst.ViewType.Normal] = {
		166,
		347
	},
	[ChatConst.ViewType.Adventure] = {
		66,
		347
	}
}
ChatConst.ChatTabHeight = {
	[ChatConst.ViewType.Normal] = {
		239,
		420
	},
	[ChatConst.ViewType.Adventure] = {
		139,
		420
	}
}
ChatConst.MainMsgColor = {
	[ChatConst.Channel.World] = cc.c3b(255, 255, 255),
	[ChatConst.Channel.Gang] = cc.c3b(19, 252, 96),
	[ChatConst.Channel.Friend] = cc.c3b(255, 255, 255),
	[ChatConst.Channel.Notice] = cc.c3b(255, 250, 118),
	[ChatConst.Channel.System] = cc.c3b(255, 250, 118),
	[ChatConst.Channel.Drama] = cc.c3b(255, 250, 118),
	[ChatConst.Channel.Cross] = cc.c3b(255, 255, 255),
	[ChatConst.Channel.Province] = cc.c3b(255, 255, 255)
}
ChatConst.MainFriendMsgColor = {
	cc.c3b(19, 252, 96),
	cc.c3b(255, 255, 255)
}
ChatConst.MainNameColor = {
	[ChatConst.Channel.World] = "#24ecf3",
	[ChatConst.Channel.Gang] = "#24ecf3",
	[ChatConst.Channel.Friend] = "#24ecf3",
	[ChatConst.Channel.Drama] = "#24ecf3",
	[ChatConst.Channel.Cross] = "#24ecf3",
	[ChatConst.Channel.Province] = "#24ecf3"
}
ChatConst.MianInputColor = cc.c3b(95, 63, 32)
ChatConst.MainChatButtonColor = {
	cc.c3b(155, 70, 18),
	cc.c3b(208, 183, 159)
}
ChatConst.Clear_Chat_Time = 300
ChatConst.ChatInputType = {
	eMessageBoardpanel = "MessageBoardpanel",
	eChatWindw = "chatWindow",
	eMessageBoardReplyPanel = "MessageBoardReplyPanel",
	eArenateam = "Arenateam"
}
