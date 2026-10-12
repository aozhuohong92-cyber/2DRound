HeroSoulWeapon = HeroSoulWeapon or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()

function HeroSoulWeapon.__init(slot0, slot1)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_soul_weapon_tips_panel"
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.data = slot1
	slot0.cur_status = HeroConst.soulWeapon.status.lock
end

function HeroSoulWeapon.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.close_btn = slot0.root_wnd:getChildByName("close_btn")
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("title")
	slot0.soulWeapon_icon = slot0.title:getChildByName("soulWeapon")
	slot0.soulWeapon_icon_mask = slot0.soulWeapon_icon:getChildByName("mask")
	slot0.soulWeapon_item = slot0.soulWeapon_icon:getChildByName("item_layout")
	slot0.soulWeapon_level_bg = slot0.soulWeapon_icon:getChildByName("level_bg")
	slot0.soulWeapon_level = slot0.soulWeapon_level_bg:getChildByName("level")
	slot0.attribute = slot0.main_panel:getChildByName("attribute")
	slot0.buff = slot0.main_panel:getChildByName("buff")
	slot0.condition = slot0.main_panel:getChildByName("condition")
	slot0.desc = slot0.main_panel:getChildByName("desc")
	slot0.help_btn = slot0.main_panel:getChildByName("help_btn")
	slot0.goto_btn = slot0.main_panel:getChildByName("goto_btn")
end

function HeroSoulWeapon.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 1)
	registerButtonEventListener(slot0.help_btn, function (slot0, slot1, slot2)
		if Config.PartnerExclusiveData.data_const.rule_desc then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1)
	registerButtonEventListener(slot0.goto_btn, handler(slot0, slot0.OnClickGoToAwarkPanel), true, 1)
end

function HeroSoulWeapon.onClickCloseBtn(slot0)
	uv0:openSoulWeaponPanel(false)
end

function HeroSoulWeapon.OnClickGoToAwarkPanel(slot0)
	uv0:openSoulWeaponChangePanel(true, slot0.data, {
		cur_status = slot0.cur_status
	})
	uv0:openSoulWeaponPanel(false)
end

function HeroSoulWeapon.update(slot0, slot1)
	if slot1 == HeroConst.soulWeapon.status.lock then
		slot0.goto_btn:getChildByName("label"):setVisible(false)
		slot0.soulWeapon_icon_mask:setVisible(true)
	end

	if slot1 == HeroConst.soulWeapon.status.awake then
		slot0.goto_btn:setVisible(true)
		slot0.goto_btn:getChildByName("label"):setString(TI18N("觉醒"))
		slot0.soulWeapon_icon_mask:setVisible(false)
		slot0.condition:setVisible(false)
	end

	if slot1 == HeroConst.soulWeapon.status.strengthen then
		slot0.goto_btn:setVisible(true)
		slot0.goto_btn:getChildByName("label"):setString(TI18N("强化"))
		slot0.soulWeapon_icon_mask:setVisible(false)
		slot0.condition:setVisible(false)
	end

	slot0.cur_status = slot1
end

function HeroSoulWeapon.openRootWnd(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.weapon_name = slot1.weapon_name
	slot0.hero_name = slot1.hero_name
	slot0.score = slot1.score
	slot0.desc_text = slot1.desc
	slot0.cur_status = slot1.status
	slot0.setting = slot2

	slot0:setTitle()
	slot0:setAttribute()
	slot0:setBuff()
	slot0:update(slot0.cur_status)
	slot0:ViewAutoSize()
	slot0.soulWeapon_icon_mask:setVisible(true)

	if slot1.status == HeroConst.soulWeapon.status.strengthen then
		slot0.soulWeapon_level_bg:setVisible(true)
		slot0.soulWeapon_level:setString(slot0.data.weapon_lev)
		slot0.soulWeapon_icon_mask:setVisible(false)
	end

	if slot2 and slot2.open_type == 0 then
		slot0.goto_btn:setVisible(false)
		slot0.condition:setVisible(false)

		if slot0.data.weapon_lev > 0 then
			slot0.soulWeapon_level_bg:setVisible(true)
			slot0.soulWeapon_level:setString(slot0.data.weapon_lev)
			slot0.soulWeapon_icon_mask:setVisible(false)
		end

		return
	end

	if slot0.data.weapon_lev < Config.PartnerExclusiveData.data_const.exclusive_max_lev.val then
		if slot0.data.hero_star < slot0.data.next_pre_star then
			slot0.goto_btn:setVisible(false)
			slot0.condition:setVisible(true)
		end
	else
		slot0.goto_btn:setVisible(false)
		slot0.condition:setVisible(true)
		slot0.condition:setString(TI18N("已强化到最大等级"))
	end

	if slot0.data.weapon_lev == slot3 then
		slot0.goto_btn:setVisible(false)
	end
end

function HeroSoulWeapon.setTitle(slot0)
	slot0:textTranslate()

	slot0.score_num = slot0.title:getChildByName("common_num")
	slot1 = CommonNum.new(17, slot0.score_num, slot0.score, -2, cc.p(0, 0.5))

	slot1:setScale(0.7)
	slot1:setPositionY(13)
	slot0.soulWeapon_item:setBackGroundImage(PathTool.getResFrame("common", "common_1010"), LOADTEXT_TYPE_PLIST)

	slot3 = slot0.soulWeapon_item:getChildByName("Image_3")

	slot3:setContentSize(cc.size(95, 95))
	slot3:loadTexture(PathTool.getItemRes(slot0.data.weapon_id, false), LOADTEXT_TYPE)
	slot0.soulWeapon_level_bg:setVisible(false)
end

function HeroSoulWeapon.textTranslate(slot0)
	slot0.title:getChildByName("weapon_name"):setString(TI18N(slot0.weapon_name))
	slot0.title:getChildByName("belong"):setString(TI18N(slot0.hero_name) .. TI18N("专属"))
	slot0.title:getChildByName("score"):setString(TI18N("评分:"))
	slot0.attribute:getChildByName("baseTitle"):setString(TI18N("基础属性"))
	slot0.attribute:getChildByName("baseTitle_2"):setString(TI18N("(强化后提升)"))
	slot0.attribute:getChildByName("baseTitle_2"):setVisible(false)
	slot0.buff:getChildByName("baseTitle"):setString(TI18N("强化效果"))
	slot0.desc:setString(TI18N(slot0.desc_text))

	if slot0.setting and slot0.setting.open_type == 0 then
		return
	end

	slot0.condition:setString(TI18N("英雄达到" .. slot0.data.next_pre_star .. "星可觉醒"))

	if slot0.data.weapon_lev > 1 then
		slot0.condition:setString(TI18N("英雄达到" .. slot0.data.next_pre_star .. "星可继续强化"))
	end

	slot0.goto_btn:getChildByName("label"):setString(TI18N("觉醒"))

	if slot0.data.status == HeroConst.soulWeapon.status.strengthen then
		slot0.attribute:getChildByName("baseTitle_2"):setVisible(true)
	end
end

function HeroSoulWeapon.setAttribute(slot0)
	slot0.attribute_list = {}

	for slot4, slot5 in pairs(slot0.data.attr) do
		slot6 = slot0.attribute:getChildByName("attr_" .. slot4)

		slot6:setVisible(true)

		slot6.icon = slot6:getChildByName("attr_icon")
		slot6.attr_name = slot6:getChildByName("attr_name")
		slot6.value = slot6:getChildByName("value")

		slot6.value:setString(slot5[2])

		slot6.data = slot5
		slot6.res = nil
		slot6.percent = false

		slot0:setAttrConfig(slot6, slot5[1])

		if slot6.percent == true then
			slot6.value:setString(slot5[2] / 10 .. "%")
		end

		slot6.icon:loadTexture(slot6.res, LOADTEXT_TYPE_PLIST)
		table.insert(slot0.attribute_list, slot6)
	end
end

function HeroSoulWeapon.setAttrConfig(slot0, slot1, slot2)
	if slot2 == HeroConst.soulWeapon.attr.attack then
		slot1.res = PathTool.getResFrame("common", "common_90021", false, "common")

		slot1.attr_name:setString(TI18N("攻击"))
	end

	if slot2 == HeroConst.soulWeapon.attr.defense then
		slot1.res = PathTool.getResFrame("common", "common_90023", false, "common")

		slot1.attr_name:setString(TI18N("防御"))
	end

	if slot2 == HeroConst.soulWeapon.attr.hitPoint then
		slot1.res = PathTool.getResFrame("common", "common_90022", false, "common")

		slot1.attr_name:setString(TI18N("生命"))
	end

	if slot2 == HeroConst.soulWeapon.attr.speed then
		slot1.res = PathTool.getResFrame("common", "common_90038", false, "common")

		slot1.attr_name:setString(TI18N("速度"))
	end

	if slot2 == HeroConst.soulWeapon.attr.hit_rate then
		slot1.res = PathTool.getResFrame("common", "common_90021_2", false, "common")

		slot1.attr_name:setString(TI18N("命中"))

		slot1.percent = true
	end

	if slot2 == HeroConst.soulWeapon.attr.dodge_rate then
		slot1.res = PathTool.getResFrame("common", "common_90021_4", false, "common")

		slot1.attr_name:setString(TI18N("闪避"))

		slot1.percent = true
	end

	if slot2 == HeroConst.soulWeapon.attr.dodge_magic then
		slot1.res = PathTool.getResFrame("common", "common_90037", false, "common")

		slot1.attr_name:setString(TI18N("抗控"))

		slot1.percent = true
	end

	if slot2 == HeroConst.soulWeapon.attr.tenacity then
		slot1.res = PathTool.getResFrame("common", "common_90021_1", false, "common")

		slot1.attr_name:setString(TI18N("抗暴"))

		slot1.percent = true
	end
end

function HeroSoulWeapon.setBuff(slot0)
	slot0.buff_list = {}
	slot1 = {}

	for slot6, slot7 in pairs(Config.PartnerExclusiveData.data_exclusive_skills) do
		if slot0.data.weapon_id == slot6 then
			slot1 = slot7
		end
	end

	for slot6 = 1, 4 do
		slot7 = slot0.buff:getChildByName("buff_desc_" .. slot6)
		slot7.star = slot7:getChildByName("star")
		slot7.star_light = slot7:getChildByName("star_light")
		slot7.old_desc = slot7:getChildByName("desc")

		slot7.old_desc:setVisible(false)

		slot7.desc = createLabel(22, cc.c3b(187, 174, 161), nil, 40, slot7:getContentSize().height, slot1[slot6].desc, slot7, 0, cc.p(0, 1))

		slot7.desc:setWidth(390)

		slot7.desc_text = slot1[slot6].desc
		slot7.active_lev = slot1[slot6].active_lev

		table.insert(slot0.buff_list, slot6, slot7)
	end

	slot0.data.lev_list = slot1
	slot0.data.buff_list = slot0.buff_list

	for slot6, slot7 in pairs(slot0.buff_list) do
		if slot7.active_lev <= slot0.data.weapon_lev then
			slot7.star:setVisible(false)
			slot7.star_light:setVisible(true)
			slot7.desc:setTextColor(cc.c3b(153, 255, 153))

			slot7.is_active = true
		end
	end
end

function HeroSoulWeapon.ViewAutoSize(slot0)
	slot1 = 325
	slot2 = 30

	for slot6, slot7 in pairs(slot0.buff_list) do
		slot8 = slot7.desc:getContentSize()
	end

	for slot8 = 2, #slot0.buff_list do
		slot10 = slot0.buff_list[slot8 - 1].desc:getContentSize().height

		slot0.buff_list[slot8]:setPositionY(slot0.buff_list[slot8 - 1]:getPositionY() - slot10 - slot2)

		slot4 = slot0.buff_list[1].desc:getContentSize().height + slot2 + 30 + slot10 + slot2
	end

	slot5 = slot0.buff:getPositionY() - slot4
	slot0.line = slot0.main_panel:getChildByName("line")

	slot0.line:setPositionY(slot5)
	slot0.desc:setPositionY(slot5 - 20)
	slot0.desc:setString("")

	slot6 = createLabel(18, cc.c3b(126, 116, 106), nil, 0, 0, TI18N(slot0.desc_text), slot0.desc, 0, cc.p(0.5, 1))

	slot6:setWidth(400)

	slot9 = slot1 + slot4 + slot6:getContentSize().height + 20 + 90
	slot0.bg = slot0.main_panel:getChildByName("bg")

	slot0.bg:setAnchorPoint(cc.p(0.5, 1))
	slot0.bg:setContentSize(471, slot9)

	slot10 = slot0.goto_btn:getPositionY()

	slot0.goto_btn:setPositionY(slot10 + 950 - slot9)
	slot0.condition:setPositionY(slot10 + 950 - slot9)
end

function HeroSoulWeapon.close_callback(slot0)
end
