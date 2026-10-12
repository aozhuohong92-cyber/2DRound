HeroTipsAttrPanel = HeroTipsAttrPanel or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function HeroTipsAttrPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/hero_tips_attr_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		}
	}
	slot0.key_list1 = {
		"atk",
		"hp",
		"def",
		"speed"
	}
	slot0.key_list2 = {
		"crit_rate",
		"crit_ratio",
		"hit_magic",
		"dodge_magic"
	}
	slot0.key_list3 = {
		"tenacity",
		"hit_rate",
		"res",
		"dodge_rate"
	}
	slot0.key_list4 = {
		"cure",
		"be_cure",
		"dam",
		"dam_p",
		"dam_s",
		"res_p",
		"res_s"
	}
end

function HeroTipsAttrPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("main_panel")
	slot0.panel_bg = slot0.container:getChildByName("panel_bg")
	slot0.panel_bg_size = slot0.panel_bg:getContentSize()
	slot1 = slot0.container:getChildByName("bottom_panel")
	slot0.bottom_panel = slot1
	slot0.bottom_panel_y = slot1:getPositionY()

	slot0.container:getChildByName("base_attr"):setString(TI18N("基本属性"))

	slot5 = TI18N

	slot0.container:getChildByName("special_attr"):setString(slot5("特殊属性"))

	slot0.attr_panel_list = {}
	slot0.attr_list = {}

	for slot5 = 1, 3 do
		slot0.attr_panel_list[slot5] = slot0.container:getChildByName("attr_panel_" .. slot5)
		slot0.attr_list[slot5] = {}

		for slot11 = 1, 4 do
			slot0.attr_list[slot5][slot11] = {
				icon = slot6:getChildByName("attr_icon" .. slot11),
				key = slot6:getChildByName("attr_key" .. slot11),
				value = slot6:getChildByName("attr_label" .. slot11),
				attr_key = slot0["key_list" .. slot5][slot11]
			}
		end
	end

	slot0.attr_panel_list[4] = slot0.container:getChildByName("attr_panel_4")
	slot0.attr_list[4] = {}

	for slot6, slot7 in ipairs(slot0.key_list4) do
		slot0.attr_list[4][slot6] = {
			icon = slot2:getChildByName("attr_icon" .. slot6),
			key = slot2:getChildByName("attr_key" .. slot6),
			value = slot2:getChildByName("attr_label" .. slot6),
			attr_key = slot0.key_list4[slot6]
		}
	end

	slot0.guild_level_key = slot1:getChildByName("attr_key1")
	slot0.guild_pvp_level_key = slot1:getChildByName("attr_key2")
	slot0.halidom_level_key = slot1:getChildByName("attr_key3")
	slot0.resonate_level_key = slot1:getChildByName("attr_key4")
	slot0.guild_level_value = slot1:getChildByName("attr_label1")
	slot0.guild_pvp_level_value = slot1:getChildByName("attr_label2")
	slot0.halidom_level_value = slot1:getChildByName("attr_label3")
	slot0.resonate_level_value = slot1:getChildByName("attr_label4")
	slot0.title_name = slot1:getChildByName("title_name")

	slot0.title_name:setString(TI18N("加成项"))

	slot0.goto_btn_1 = slot1:getChildByName("goto_btn_1")
	slot0.goto_btn_2 = slot1:getChildByName("goto_btn_2")
	slot0.goto_btn_3 = slot1:getChildByName("goto_btn_3")
	slot0.goto_btn_4 = slot1:getChildByName("goto_btn_4")
	slot0.bottom_btn = slot1:getChildByName("bottom_btn")
	slot0.is_hide = false
end

function HeroTipsAttrPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
	registerButtonEventListener(slot0.goto_btn_1, handler(slot0, slot0.onClickGotoBtn1), true, 2)
	registerButtonEventListener(slot0.goto_btn_2, handler(slot0, slot0.onClickGotoBtn1), true, 2)
	registerButtonEventListener(slot0.goto_btn_3, handler(slot0, slot0.onClickGotoBtn3), true, 2)
	registerButtonEventListener(slot0.goto_btn_4, handler(slot0, slot0.onClickGotoBtn4), true, 2)
	registerButtonEventListener(slot0.bottom_btn, handler(slot0, slot0.onClickBottomBtn), true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Vo_Detailed_info, function (slot0)
		if slot0 and slot0.partner_id == uv0.hero_vo.partner_id then
			uv0:setData(slot0)
		end
	end)
end

function HeroTipsAttrPanel.onClickCloseBtn(slot0)
	uv0:openHeroTipsAttrPanel(false)
end

function HeroTipsAttrPanel.onClickGotoBtn1(slot0)
	if RoleController:getInstance():getRoleVo():isHasGuild() == false then
		message(TI18N("您暂未加入公会"))

		return
	end

	slot0:onClickCloseBtn()
	BaseView.closeAllView()
	ChatController:getInstance():closeChatUseAction()
	JumpController:getInstance():jumpViewByEvtData({
		32
	})
end

function HeroTipsAttrPanel.onClickGotoBtn3(slot0)
	if not HalidomController:getInstance():getModel():checkHalidomIsOpen() then
		return
	end

	slot0:onClickCloseBtn()
	BaseView.closeAllView()
	ChatController:getInstance():closeChatUseAction()
	HeroController:getInstance():openHeroBagWindow(true, HeroConst.BagTab.eHalidom)
end

function HeroTipsAttrPanel.onClickGotoBtn4(slot0)
	if not uv0:getModel():checkResonateIsOpen() then
		return
	end

	slot0:onClickCloseBtn()
	BaseView.closeAllView()
	ChatController:getInstance():closeChatUseAction()
	uv0:openHeroResonateWindow(true)
end

function HeroTipsAttrPanel.onClickBottomBtn(slot0)
	if slot0.is_hide then
		slot0.is_hide = false

		slot0.bottom_btn:setRotation(-90)
		slot0.panel_bg:setContentSize(slot0.panel_bg_size)
		slot0.bottom_panel:setPositionY(slot0.bottom_panel_y)
		slot0.attr_panel_list[3]:setVisible(true)
		slot0.attr_panel_list[4]:setVisible(true)
	else
		slot0.is_hide = true

		slot0.bottom_btn:setRotation(90)
		slot0.panel_bg:setContentSize(cc.size(slot0.panel_bg_size.width, slot0.panel_bg_size.height - 242))
		slot0.bottom_panel:setPositionY(slot0.bottom_panel_y + 242)
		slot0.attr_panel_list[3]:setVisible(false)
		slot0.attr_panel_list[4]:setVisible(false)
	end
end

function HeroTipsAttrPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.is_my = slot2
	slot0.hero_vo = slot1

	if RoleController:getInstance():getRoleVo() and slot0.hero_vo.rid and slot0.hero_vo.srv_id and slot3.rid == slot0.hero_vo.rid and slot3.srv_id == slot0.hero_vo.srv_id then
		slot0.is_my = true
	end

	if slot0.is_my then
		if slot1.is_pokedex then
			slot0:setData(slot1)
			slot0.goto_btn_1:setVisible(false)
			slot0.goto_btn_2:setVisible(false)
		elseif slot1.is_had_detailed then
			slot0:setData(slot1)
		else
			uv0:sender11063(slot1.partner_id)
		end
	else
		slot0:setData(slot1)
	end
end

function HeroTipsAttrPanel.setData(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.attr_list) do
		for slot10, slot11 in ipairs(slot6) do
			slot12 = slot11.attr_key

			loadSpriteTexture(slot11.icon, PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot12)), LOADTEXT_TYPE_PLIST)
			slot11.key:setString(Config.AttrData.data_key_to_name[slot12])

			if PartnerCalculate.isShowPerByStr(slot12) then
				slot16 = (slot1[slot12] or 0) / 10 .. "%"
			end

			slot11.value:setString(slot16)
		end
	end

	slot0:setBottomInfo()
end

function HeroTipsAttrPanel.setBottomInfo(slot0)
	slot1 = string.format
	slot2 = HeroConst.CareerType.eMagician
	slot3 = HeroConst.CampType.eWater

	if Config.PartnerData.data_partner_base[slot0.hero_vo.bid] then
		slot2 = slot4.type
		slot3 = slot4.camp_type
	end

	slot5 = 0
	slot6 = 0
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = 0

	if slot0.hero_vo.ext_data then
		for slot14, slot15 in ipairs(slot0.hero_vo.ext_data) do
			if slot15.id == 1 then
				slot5 = slot15.val or 0
			elseif slot15.id == 2 then
				slot9 = slot15.val or 0
			elseif slot15.id == 3 then
				slot8 = slot15.val or 0
			elseif slot15.id == 4 then
				slot10 = slot15.val or 0
			elseif slot15.id == 5 then
				slot7 = slot15.val or 0
			elseif slot15.id == 6 then
				slot6 = slot15.val or 0
			end
		end
	end

	if slot0.is_my and not slot0.hero_vo.is_pokedex then
		slot11 = GuildskillController:getInstance():getModel()
		slot13, slot14 = slot11:getCareerPvpSkillLevel(slot2)

		if slot11:getCareerSkillLevel(slot2) ~= -1 then
			slot5 = slot12
		end

		if slot13 ~= -1 then
			slot6 = slot14 or 0
			slot7 = slot13 or 0
		end

		if HalidomController:getInstance():getModel():getHalidomDataByCampType(slot3) then
			slot8 = slot15.lev or 0
			slot9 = slot15.step or 0
		end

		if uv0:getModel() then
			slot10 = slot16.resonate_stone_level or 0
		end
	end

	print("camp_type================", slot3)
	slot0.guild_level_key:setString(slot1("%s-%s", TI18N("公会技能等级"), HeroConst.CareerName[slot2]))
	slot0.guild_pvp_level_key:setString(slot1("%s-%s", TI18N("公会PVP等级"), HeroConst.CareerName[slot2]))
	slot0.halidom_level_key:setString(slot1(TI18N("%s之信念等级"), HeroConst.CampName[slot3]))
	slot0.resonate_level_key:setString(TI18N("恶魔树增幅阶段"))
	slot0.guild_level_value:setString(slot1("lv.%s", slot5))
	slot0.guild_pvp_level_value:setString(slot1("lv.%s(技能lv.%s)", slot7, slot6))

	if slot9 == 0 and slot8 == 0 then
		slot0.halidom_level_value:setString(TI18N("未解锁"))
	else
		slot0.halidom_level_value:setString(slot1("lv.%s(%s%s)", slot8, slot9, TI18N("阶")))
	end

	if slot10 == 0 then
		slot0.resonate_level_value:setString(TI18N("未解锁"))
	else
		slot0.resonate_level_value:setString(slot1("lv.%s", slot10))
	end
end

function HeroTipsAttrPanel.close_callback(slot0)
	uv0:openHeroTipsAttrPanel(false)
end
