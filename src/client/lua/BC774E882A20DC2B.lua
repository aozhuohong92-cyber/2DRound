VoyageConst = VoyageConst or {}
VoyageConst.Order_Status = {
	Underway = 2,
	Finish = 3,
	Unget = 1
}
VoyageConst.Order_Rarity = {
	Epic = 3,
	Eternity = 5,
	Excellent = 1,
	Uncommon = 2,
	Legend = 4,
	Normal = 0
}
VoyageConst.Order_Rarity_Res = {
	[VoyageConst.Order_Rarity.Normal] = "txt_cn_voyage_1006",
	[VoyageConst.Order_Rarity.Excellent] = "txt_cn_voyage_1005",
	[VoyageConst.Order_Rarity.Uncommon] = "txt_cn_voyage_1004",
	[VoyageConst.Order_Rarity.Epic] = "txt_cn_voyage_1003",
	[VoyageConst.Order_Rarity.Legend] = "txt_cn_voyage_1002",
	[VoyageConst.Order_Rarity.Eternity] = "txt_cn_voyage_1001"
}
VoyageConst.Order_Rarity_Color = {
	[VoyageConst.Order_Rarity.Normal] = cc.c3b(66, 75, 84),
	[VoyageConst.Order_Rarity.Excellent] = cc.c3b(35, 119, 1),
	[VoyageConst.Order_Rarity.Uncommon] = cc.c3b(6, 79, 147),
	[VoyageConst.Order_Rarity.Epic] = cc.c3b(126, 6, 147),
	[VoyageConst.Order_Rarity.Legend] = cc.c3b(147, 86, 6),
	[VoyageConst.Order_Rarity.Eternity] = cc.c3b(161, 1, 1)
}
VoyageConst.Order_Status_Color = {
	[VoyageConst.Order_Status.Unget] = cc.c3b(37, 85, 5),
	[VoyageConst.Order_Status.Underway] = cc.c3b(37, 85, 5),
	[VoyageConst.Order_Status.Finish] = cc.c3b(113, 40, 4)
}
VoyageConst.Chose_Hero_PosX = {
	{
		319
	},
	{
		255,
		383
	},
	{
		191,
		319,
		447
	},
	{
		127,
		255,
		383,
		511
	},
	{
		63,
		191,
		319,
		447,
		575
	}
}
VoyageConst.Condition_Icon_PosX = {
	{
		0
	},
	{
		-38,
		38
	},
	{
		-76,
		0,
		76
	},
	{
		-114,
		-38,
		38,
		114
	},
	{
		-152,
		-76,
		0,
		76,
		152
	}
}
