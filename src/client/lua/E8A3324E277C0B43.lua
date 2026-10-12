BackPackConst = BackPackConst or {}
BackPackConst.Bag_Code = {
	EQUIPS = 3,
	STORAGE = 2,
	BACKPACK = 1,
	PETBACKPACK = 5,
	HOME = 4
}
BackPackConst.Gain_To_Bag_Code = {
	BackPackConst.Bag_Code.BACKPACK,
	BackPackConst.Bag_Code.EQUIPS,
	[6] = BackPackConst.Bag_Code.HOME,
	[7] = BackPackConst.Bag_Code.PETBACKPACK
}
BackPackConst.item_type = {
	HERO_HUN = 29,
	GOD_RING = 24,
	ASSET = 7,
	ELFIN_ITEM = 38,
	WEEK_CARD = 27,
	ARTIFACTCHIPS = 10,
	SHOE = 2,
	HOME_PET_FOOD = 32,
	HOME_PET_TREASURE = 33,
	ELFIN = 36,
	HOME_PET_PHOTO = 34,
	WEAPON = 1,
	HAT = 4,
	GIFT = 100,
	PARTNER_DEBRIS = 102,
	GOD_EARRING = 23,
	GOD_BANGLE = 26,
	MATERIALS = 9,
	FREE_GIFT = 101,
	NORMAL = 0,
	HERO_SKIN = 28,
	STAR_SOUL = 105,
	ELFIN_EGG = 37,
	CLOTHES = 3,
	GOD_NECKLACE = 25,
	HOME_PET_LITTER = 35,
	HOME_PET_ITEM = 31
}
BackPackConst.item_tab_type = {
	SPECIAL = 4,
	EQUIPS = 1,
	HOMEPET_ITEM = 99,
	EMOGUOSHI = 7,
	HOMEPET_FOOD = 98,
	HOLYEQUIPMENT = 5,
	ELFIN = 6,
	PROPS = 2,
	OTHERS = 0,
	HERO = 3
}
BackPackConst.item_use_type = {
	EQUIP = 3,
	NO_DIRECT_USE = 0,
	CONSUM = 1,
	NO_CONSUM = 2,
	BATCH_USE = 4
}
BackPackConst.item_effect_type = {
	PARTNER_EXP = 4,
	COIN = 2,
	PARTNER = 7,
	PARTNER_DEBRIS = 5,
	EXP = 3,
	GOLD = 1,
	BUFF = 6,
	GIFT = 8
}
BackPackConst.item_source_type = {
	evt_farplane = "evt_farplane",
	evt_eqm_bag = "evt_eqm_bag",
	evt_partner_call = "evt_partner_call",
	evt_mall_buy = "evt_mall_buy",
	evt_vip = "evt_vip",
	evt_refine = "evt_refine",
	evt_dungeon = "evt_dungeon",
	evt_dun_chapter = "evt_dun_chapter",
	evt_tower = "evt_tower",
	evt_compose = "evt_compose",
	evt_world_boss = "evt_world_boss",
	evt_halo = "evt_halo",
	evt_activity = "evt_activity",
	evt_world_mon = "evt_world_mon",
	evt_artifact = "evt_artifact"
}
ItemConsumeType = {
	sell = 2,
	resolve = 3,
	use = 1,
	special = 4
}
BackPackConst.Big_Energy_ID = 10401
BackPackConst.Small_Energy_ID = 10400
EQUIP_PUT_TYPE = {
	TAKE_OFF = 2,
	PUT_ON = 1,
	OFF = 3
}
GridsCellState = {
	open = 2,
	full = 3,
	lock = 1
}
BackPackConst.new_quality_color = {
	[0] = cc.c4b(254, 243, 220, 255),
	cc.c4b(103, 254, 96, 255),
	cc.c4b(65, 208, 255, 255),
	cc.c4b(221, 65, 255, 255),
	cc.c4b(255, 175, 3, 255),
	cc.c4b(255, 54, 54, 255),
	cc.c4b(255, 255, 51, 255)
}
BackPackConst.quality_color = {
	[0] = Config.ColorData.data_color4[1],
	Config.ColorData.data_color4[178],
	Config.ColorData.data_color4[203],
	Config.ColorData.data_color4[185],
	Config.ColorData.data_color4[184],
	Config.ColorData.data_color4[206],
	Config.ColorData.data_color4[279]
}
BackPackConst.quality_3_color = {
	[0] = Config.ColorData.data_color3[1],
	Config.ColorData.data_color3[178],
	Config.ColorData.data_color3[203],
	Config.ColorData.data_color3[185],
	Config.ColorData.data_color3[184],
	Config.ColorData.data_color3[206],
	Config.ColorData.data_color3[279]
}
BackPackConst.quality = {
	blue = 2,
	orange = 4,
	gold = 6,
	red = 5,
	green = 1,
	purple = 3,
	white = 0
}
BackPackConst.quality_color_id = {
	[0] = 1,
	178,
	203,
	185,
	184,
	206,
	279
}
BackPackConst.ref_color = {
	[0] = 265,
	266,
	267,
	268,
	269,
	270,
	279
}
BackPackConst.holyequip_jie_name = {
	[0] = TI18N("凡品"),
	TI18N("良品"),
	TI18N("极品")
}
BackPackConst.quality_name = {
	[0] = TI18N("白色"),
	TI18N("绿色"),
	TI18N("蓝色"),
	TI18N("紫色"),
	TI18N("橙色"),
	TI18N("红色"),
	TI18N("金色")
}
BackPackConst.star_name = {
	TI18N("一星"),
	TI18N("二星"),
	TI18N("三星"),
	TI18N("四星"),
	TI18N("五星"),
	TI18N("六星")
}
BackPackConst.cb_type = {
	all = 1,
	quality = 2,
	star = 3
}
BackPackConst.holy_equip_icon_name_list = {
	[BackPackConst.item_type.GOD_EARRING] = "hero_info_25",
	[BackPackConst.item_type.GOD_RING] = "hero_info_27",
	[BackPackConst.item_type.GOD_NECKLACE] = "hero_info_26",
	[BackPackConst.item_type.GOD_BANGLE] = "hero_info_28"
}
BackPackConst.holy_equip_name_suffix = {
	[BackPackConst.item_type.GOD_EARRING] = 1,
	[BackPackConst.item_type.GOD_NECKLACE] = 2,
	[BackPackConst.item_type.GOD_RING] = 3,
	[BackPackConst.item_type.GOD_BANGLE] = 4
}
BackPackConst.tips_btn_type = {
	boss_source = 3,
	halidom = 34,
	item_sell = 37,
	seerpalace_summon = 19,
	fenjie = 30,
	sell = 21,
	goods_use = 2,
	form_source = 8,
	chenghao = 13,
	stone_upgrade = 14,
	arena_source = 16,
	artifact_source = 10,
	redbag = 11,
	heaven_dial_3 = 24,
	heaven_shop = 36,
	heaven_dial_1 = 22,
	hero_reset = 38,
	petard = 42,
	low_treasure = 17,
	return_action = 43,
	herosoul_shop = 44,
	emoguoshi_fenjie = 52,
	elfin_summon = 46,
	drama_source = 5,
	head = 12,
	elfin_egg_synthetic = 45,
	heaven_dial_2 = 23,
	hecheng = 31,
	emoguoshi_zhaohuan_source = 56,
	partner_character = 15,
	heaven_dial_4 = 25,
	elfin_hatch = 40,
	upgrade_star = 33,
	high_treasure = 18,
	resonate = 39,
	heaven_dial_5 = 26,
	call_source = 9,
	hecheng2 = 32,
	elfin_rouse = 41,
	skill_source = 7,
	drama_new_source = 4,
	hero_source = 6,
	source = 1,
	heaven_book = 35,
	seerpalace_change = 20
}
BackPackConst.tips_btn_title = {
	[BackPackConst.tips_btn_type.source] = TI18N("来源"),
	[BackPackConst.tips_btn_type.goods_use] = TI18N("使用"),
	[BackPackConst.tips_btn_type.boss_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.drama_new_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.drama_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.hero_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.skill_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.form_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.call_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.artifact_source] = TI18N("重铸"),
	[BackPackConst.tips_btn_type.redbag] = TI18N("使用"),
	[BackPackConst.tips_btn_type.head] = TI18N("使用"),
	[BackPackConst.tips_btn_type.chenghao] = TI18N("使用"),
	[BackPackConst.tips_btn_type.stone_upgrade] = TI18N("使用"),
	[BackPackConst.tips_btn_type.partner_character] = TI18N("使用"),
	[BackPackConst.tips_btn_type.arena_source] = TI18N("使用"),
	[BackPackConst.tips_btn_type.low_treasure] = TI18N("使用"),
	[BackPackConst.tips_btn_type.high_treasure] = TI18N("使用"),
	[BackPackConst.tips_btn_type.sell] = TI18N("出售"),
	[BackPackConst.tips_btn_type.heaven_dial_1] = TI18N("使用"),
	[BackPackConst.tips_btn_type.heaven_dial_2] = TI18N("使用"),
	[BackPackConst.tips_btn_type.heaven_dial_3] = TI18N("使用"),
	[BackPackConst.tips_btn_type.heaven_dial_4] = TI18N("使用"),
	[BackPackConst.tips_btn_type.heaven_dial_5] = TI18N("使用"),
	[BackPackConst.tips_btn_type.fenjie] = TI18N("分解"),
	[BackPackConst.tips_btn_type.hecheng] = TI18N("合成"),
	[BackPackConst.tips_btn_type.hecheng2] = TI18N("合成"),
	[BackPackConst.tips_btn_type.upgrade_star] = TI18N("使用"),
	[BackPackConst.tips_btn_type.seerpalace_summon] = TI18N("使用"),
	[BackPackConst.tips_btn_type.seerpalace_change] = TI18N("使用"),
	[BackPackConst.tips_btn_type.halidom] = TI18N("使用"),
	[BackPackConst.tips_btn_type.heaven_book] = TI18N("神装图鉴"),
	[BackPackConst.tips_btn_type.heaven_shop] = TI18N("使用"),
	[BackPackConst.tips_btn_type.item_sell] = TI18N("出售"),
	[BackPackConst.tips_btn_type.hero_reset] = TI18N("使用"),
	[BackPackConst.tips_btn_type.resonate] = TI18N("使用"),
	[BackPackConst.tips_btn_type.elfin_hatch] = TI18N("使用"),
	[BackPackConst.tips_btn_type.elfin_rouse] = TI18N("使用"),
	[BackPackConst.tips_btn_type.petard] = TI18N("使用"),
	[BackPackConst.tips_btn_type.return_action] = TI18N("使用"),
	[BackPackConst.tips_btn_type.herosoul_shop] = TI18N("使用"),
	[BackPackConst.tips_btn_type.elfin_egg_synthetic] = TI18N("合成"),
	[BackPackConst.tips_btn_type.elfin_summon] = TI18N("使用"),
	[BackPackConst.tips_btn_type.emoguoshi_fenjie] = TI18N("分解"),
	[BackPackConst.tips_btn_type.emoguoshi_zhaohuan_source] = TI18N("使用")
}

function BackPackConst.checkIsEquip(slot0)
	if slot0 == BackPackConst.item_type.WEAPON or slot0 == BackPackConst.item_type.CLOTHES or slot0 == BackPackConst.item_type.HAT or slot0 == BackPackConst.item_type.GOD_EARRING or slot0 == BackPackConst.item_type.GOD_RING or slot0 == BackPackConst.item_type.GOD_NECKLACE or slot0 == BackPackConst.item_type.GOD_BANGLE or slot0 == BackPackConst.item_type.SHOE then
		return true
	end

	return false
end

function BackPackConst.checkoutIsWeekCard(slot0)
	if slot0 then
		if slot0 == BackPackConst.item_type.WEEK_CARD then
			return true
		else
			return false
		end
	end

	return false
end

function BackPackConst.checkIsHolyEquipment(slot0)
	if not slot0 then
		return false
	end

	if slot0 == BackPackConst.item_type.GOD_EARRING or slot0 == BackPackConst.item_type.GOD_RING or slot0 == BackPackConst.item_type.GOD_NECKLACE or slot0 == BackPackConst.item_type.GOD_BANGLE then
		return true
	end

	return false
end

function BackPackConst.checkIsHeroSkin(slot0)
	if not slot0 then
		return false
	end

	if slot0 == BackPackConst.item_type.HERO_SKIN then
		return true
	end

	return false
end

function BackPackConst.checkIsArtifact(slot0)
	return slot0 == BackPackConst.item_type.ARTIFACTCHIPS
end

function BackPackConst.chekcIsElfinItem(slot0)
	return slot0 == BackPackConst.item_type.ELFIN_ITEM
end

function BackPackConst.checkIsElfinEgg(slot0)
	return slot0 == BackPackConst.item_type.ELFIN_EGG
end

function BackPackConst.checkIsElfin(slot0)
	return slot0 == BackPackConst.item_type.ELFIN
end

function BackPackConst.getEquipTipsColor(slot0)
	return BackPackConst.getBlackQualityColorC4B(slot0)
end

function BackPackConst.getBlackQualityColorC4B(slot0)
	if (slot0 or 0) == BackPackConst.quality.red then
		return Config.ColorData.data_color4[247]
	elseif slot0 == BackPackConst.quality.orange then
		return Config.ColorData.data_color4[246]
	elseif slot0 == BackPackConst.quality.purple then
		return Config.ColorData.data_color4[245]
	elseif slot0 == BackPackConst.quality.blue then
		return Config.ColorData.data_color4[244]
	elseif slot0 == BackPackConst.quality.green then
		return Config.ColorData.data_color4[243]
	else
		return Config.ColorData.data_color4[242]
	end
end

function BackPackConst.getBlackQualityColorStr(slot0)
	if (slot0 or 0) == BackPackConst.quality.red then
		return Config.ColorData.data_color_str[247]
	elseif slot0 == BackPackConst.quality.orange then
		return Config.ColorData.data_color_str[246]
	elseif slot0 == BackPackConst.quality.purple then
		return Config.ColorData.data_color_str[245]
	elseif slot0 == BackPackConst.quality.blue then
		return Config.ColorData.data_color_str[244]
	elseif slot0 == BackPackConst.quality.green then
		return Config.ColorData.data_color_str[243]
	else
		return Config.ColorData.data_color_str[242]
	end
end

function BackPackConst.getWhiteQualityColorC4B(slot0)
	if (slot0 or 0) == BackPackConst.quality.red then
		return Config.ColorData.data_color4[206]
	elseif slot0 == BackPackConst.quality.orange then
		return Config.ColorData.data_color4[184]
	elseif slot0 == BackPackConst.quality.purple then
		return Config.ColorData.data_color4[185]
	elseif slot0 == BackPackConst.quality.blue then
		return Config.ColorData.data_color4[203]
	elseif slot0 == BackPackConst.quality.green then
		return Config.ColorData.data_color4[178]
	else
		return Config.ColorData.data_color4[274]
	end
end

function BackPackConst.getWhiteQualityColorStr(slot0)
	if (slot0 or 0) == BackPackConst.quality.red then
		return Config.ColorData.data_color_str[206]
	elseif slot0 == BackPackConst.quality.orange then
		return Config.ColorData.data_color_str[184]
	elseif slot0 == BackPackConst.quality.purple then
		return Config.ColorData.data_color_str[185]
	elseif slot0 == BackPackConst.quality.blue then
		return Config.ColorData.data_color_str[203]
	elseif slot0 == BackPackConst.quality.green then
		return Config.ColorData.data_color_str[178]
	else
		return Config.ColorData.data_color_str[274]
	end
end
