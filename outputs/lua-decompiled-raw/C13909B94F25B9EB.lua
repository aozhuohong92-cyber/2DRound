HeroConst = HeroConst or {}
HeroConst.BagTab = {
	eBagHero = 1,
	eBagPokedex = 2,
	eElfin = 3,
	eHalidom = 4
}
HeroConst.MainInfoTab = {
	eMainTrain = 1,
	eMainHolyequipment = 4,
	eMainTalent = 3,
	eMainUpgradeStar = 2
}
HeroConst.MainInfoTabName = {
	[HeroConst.MainInfoTab.eMainTrain] = TI18N("培养"),
	[HeroConst.MainInfoTab.eMainUpgradeStar] = TI18N("升星"),
	[HeroConst.MainInfoTab.eMainTalent] = TI18N("霸气领悟"),
	[HeroConst.MainInfoTab.eMainHolyequipment] = TI18N("神装")
}
HeroConst.FormMiddleTab = {
	eFormHallows = 2,
	eFormFormation = 3,
	eFormHero = 1
}
HeroConst.FormShowType = {
	eFormSave = 2,
	eFormFight = 1
}
HeroConst.SacrificeType = {
	eHeroReplace = 3,
	eSuperAdvance = 5,
	eHeroDisband = 4,
	eHeroSacrifice = 2,
	eHeroFuse = 1
}
HeroConst.tabType = {
	[HeroConst.SacrificeType.eHeroFuse] = TI18N("融合"),
	[HeroConst.SacrificeType.eHeroSacrifice] = TI18N("献祭"),
	[HeroConst.SacrificeType.eHeroReplace] = TI18N("置换"),
	[HeroConst.SacrificeType.eHeroDisband] = TI18N("回退"),
	[HeroConst.SacrificeType.eSuperAdvance] = TI18N("超进阶")
}
HeroConst.ResonateType = {
	eEmpowerment = 3,
	eStoneTablet = 2,
	eResonate = 1
}
HeroConst.ResetType = {
	eFunriture = 6,
	eHeroReturn = 7,
	eActionHeroReset = 5,
	eHeroReset = 1,
	eSpriteReturn = 8,
	eTenStarChang = 4,
	eChipReset = 2,
	eHolyEquipSell = 3
}
HeroConst.LockType = {
	eHeroResonateLock = 98,
	eHeroLock = 1,
	eFormLock = 99,
	eHeroChangeLock = 2
}
HeroConst.CampType = {
	eNone = 0,
	eWater = 1,
	eLight = 4,
	eDark = 5,
	eFire = 2,
	eLegend = 7,
	eWind = 3,
	eLingtDark = 6
}
HeroConst.CampName = {
	[HeroConst.CampType.eNone] = TI18N("无"),
	[HeroConst.CampType.eWater] = TI18N("海贼新星"),
	[HeroConst.CampType.eFire] = TI18N("草帽联盟"),
	[HeroConst.CampType.eWind] = TI18N("强者"),
	[HeroConst.CampType.eLight] = TI18N("海军"),
	[HeroConst.CampType.eDark] = TI18N("五皇团"),
	[HeroConst.CampType.eLegend] = TI18N("传奇")
}
HeroConst.CampAttrName = {
	[HeroConst.CampType.eNone] = TI18N("无"),
	[HeroConst.CampType.eWater] = TI18N("海贼新星"),
	[HeroConst.CampType.eFire] = TI18N("草帽联盟"),
	[HeroConst.CampType.eWind] = TI18N("强者"),
	[HeroConst.CampType.eLight] = TI18N("海军"),
	[HeroConst.CampType.eDark] = TI18N("五皇团"),
	[HeroConst.CampType.eLegend] = TI18N("传奇")
}
HeroConst.CampBgRes = {
	[HeroConst.CampType.eWater] = "hero_info_bg_1",
	[HeroConst.CampType.eFire] = "hero_info_bg_2",
	[HeroConst.CampType.eWind] = "hero_info_bg_3",
	[HeroConst.CampType.eLight] = "hero_info_bg_4",
	[HeroConst.CampType.eDark] = "hero_info_bg_5",
	[HeroConst.CampType.eLegend] = "hero_info_bg_5"
}
HeroConst.CampBottomBgRes = {
	[HeroConst.CampType.eWater] = "hero_camp_1",
	[HeroConst.CampType.eFire] = "hero_camp_2",
	[HeroConst.CampType.eWind] = "hero_camp_3",
	[HeroConst.CampType.eLight] = "hero_camp_4",
	[HeroConst.CampType.eDark] = "hero_camp_5",
	[HeroConst.CampType.eLegend] = "hero_camp_5"
}
HeroConst.CareerType = {
	eNone = 0,
	eSsistant = 5,
	eTank = 4,
	eWarrior = 3,
	eMagician = 2
}
HeroConst.CareerName = {
	[0] = TI18N("无"),
	[HeroConst.CareerType.eMagician] = TI18N("法师"),
	[HeroConst.CareerType.eWarrior] = TI18N("战士"),
	[HeroConst.CareerType.eTank] = TI18N("坦克"),
	[HeroConst.CareerType.eSsistant] = TI18N("辅助")
}
HeroConst.CareerName2 = {
	[0] = TI18N("无"),
	[HeroConst.CareerType.eMagician] = TI18N("法"),
	[HeroConst.CareerType.eWarrior] = TI18N("物"),
	[HeroConst.CareerType.eTank] = TI18N("坦"),
	[HeroConst.CareerType.eSsistant] = TI18N("辅")
}
HeroConst.ExhibitionItemType = {
	eNone = 0,
	eExpeditFight = 9,
	eHeroBag = 1,
	eFormFight = 7,
	eStronger = 10,
	eHeroChange = 4,
	ePokedex = 2,
	eVoyage = 8,
	eAdventure = 12,
	ePlanes = 14,
	eEndLessHero = 11,
	eLimitExercise = 13
}
HeroConst.RedPointType = {
	eElfin_hatch_egg = 16,
	eRPHalidom_Step = 7,
	eElfin_empty_pos = 12,
	eRPLevelUp = 1,
	eElfin_tree_lvup = 11,
	eElfin_higher_lv = 14,
	ePokedex = 20,
	eResonate_stone = 9,
	eRPTalent = 4,
	eResonate_extract = 8,
	eRPHalidom_Unlock = 5,
	eRPHalidom_Lvup = 6,
	eRPEquip = 2,
	eRPStar = 3,
	eElfin_compound = 13,
	eElfin_hatch_done = 10,
	eElfin_hatch_open = 18,
	eElfin_activate = 17,
	eElfin_summon = 19,
	eElfin_hatch_lvup = 15
}
HeroConst.EquipPosList = {
	BackPackConst.item_type.WEAPON,
	BackPackConst.item_type.SHOE,
	BackPackConst.item_type.CLOTHES,
	BackPackConst.item_type.HAT
}
HeroConst.HolyequipmentPosList = {
	BackPackConst.item_type.GOD_EARRING,
	BackPackConst.item_type.GOD_NECKLACE,
	BackPackConst.item_type.GOD_RING,
	BackPackConst.item_type.GOD_BANGLE
}
HeroConst.HolyEmptyIconName = {
	[BackPackConst.item_type.GOD_EARRING] = "hero_info_25",
	[BackPackConst.item_type.GOD_RING] = "hero_info_27",
	[BackPackConst.item_type.GOD_NECKLACE] = "hero_info_26",
	[BackPackConst.item_type.GOD_BANGLE] = "hero_info_28"
}
HeroConst.ShareType = {
	eHeroInfoShare = 1,
	eLibraryInfoShare = 2
}
HeroConst.ShareBtnType = {
	eHeroShareCross = 1,
	eHeroShareGuild = 3,
	eHeroShareWorld = 2
}
HeroConst.EnterType = {
	eHolyPlan = 1,
	eOhter = 0
}
HeroConst.SelectHeroType = {
	eFreeSummon = 8,
	eSuperAdvance = 9,
	eResonateStone = 5,
	eTenConvert = 4,
	eResonateCrystal = 7,
	eStarFuse = 1,
	eHalidom = 3,
	eUpgradeStar = 2,
	eResonateEmpowerment = 6
}
HeroConst.soulWeapon = {
	attr = {
		speed = "speed",
		hit_rate = "hit_rate",
		dodge_magic = "dodge_magic",
		attack = "atk",
		hitPoint = "hp_max",
		dodge_rate = "dodge_rate",
		defense = "def",
		tenacity = "tenacity"
	},
	status = {
		strengthen = 3,
		lock = 1,
		awake = 2
	}
}
LONG_TOUCH_INIT_TYPE = 0
LONG_TOUCH_BEGAN_TYPE = 1
LONG_TOUCH_END_TYPE = 2
LONG_TOUCH_CANCEL_TYPE = 3
