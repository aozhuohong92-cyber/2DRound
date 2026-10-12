HorcruxTips = HorcruxTips or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = RoleController:getInstance():getRoleVo()
slot6 = math.floor

function HorcruxTips.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/horcrux_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.base_list = {}
	slot0.strengthen_list = {}
end

function HorcruxTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.score_title = slot0.base_panel:getChildByName("score_title")

	slot0.score_title:setString(TI18N("评分："))

	slot0.horcrux_item = HorcruxItem.new(false, 1, false, false)

	slot0.horcrux_item:setPosition(cc.p(72, 68))
	slot0.base_panel:addChild(slot0.horcrux_item)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.equip_type = slot0.base_panel:getChildByName("equip_type")
	slot0.power_label = CommonNum.new(1, slot0.base_panel, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(210, 32))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.8)

	slot0.look_btn = slot0.base_panel:getChildByName("look_btn")
	slot0.baseattr_panel = slot0.container:getChildByName("baseattr_panel")
	slot0.baseattr_panel_height = slot0.baseattr_panel:getContentSize().height

	slot0.baseattr_panel:getChildByName("label"):setString(TI18N("基础属性"))

	slot0.strengthen_label = slot0.baseattr_panel:getChildByName("label_0")

	slot0.strengthen_label:setString(TI18N("（升星后提升）"))

	slot0.strengthen_panel = slot0.container:getChildByName("strengthen_panel")
	slot0.strengthen_panel_height = slot0.strengthen_panel:getContentSize().height

	slot0.strengthen_panel:getChildByName("label"):setString(TI18N("升星效果"))

	slot0.tab_panel = slot0.container:getChildByName("tab_panel")
	slot0.tab_panel_height = slot0.tab_panel:getContentSize().height
	slot0.tab_btn_1 = slot0.tab_panel:getChildByName("tab_btn_1")

	slot0.tab_btn_1:setTitleText(TI18N("升星"))

	slot0.tab_btn_1.need_str = ""
	slot0.tips_label = slot0.tab_panel:getChildByName("tips_label")
	slot0.tab_btn_2 = slot0.tab_panel:getChildByName("tab_btn_2")

	slot0.tab_btn_2:setTitleText(TI18N("回退"))

	slot0.desc_panel = slot0.container:getChildByName("desc_panel")
	slot0.scroll_view = slot0.desc_panel:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.scroll_view:getContentSize()
	slot0.desc_label = createRichLabel(19, cc.c4b(161, 151, 139, 255), cc.p(0, 1), cc.p(20, 64), 8, nil, 380)

	slot0.scroll_view:addChild(slot0.desc_label)

	slot0.spattr_panel = slot0.container:getChildByName("spattr_panel")

	slot0.spattr_panel:getChildByName("label"):setString(TI18N("SP同调效果"))

	slot0.sp_attr_tips = slot0.spattr_panel:getChildByName("label_0"):setString(TI18N("(同调英雄魂器满级激活)"))
	slot0.spattr_panel_height = slot0.spattr_panel:getContentSize().height
	slot0.close_btn = slot0.container:getChildByName("close_btn")
end

function HorcruxTips.register_event(slot0)
	slot0.tab_btn_1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onTabBtn1()
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 0)
	registerButtonEventListener(slot0.tab_btn_2, function ()
		uv0:onClickFallbackBtn()
	end, true, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.HorcruxData.data_constant.horcrux_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Data_Update, function (slot0)
		if not slot0 or not uv0.horcrux_data then
			return
		end

		if slot0.partner_id == uv0.horcrux_data.partner_id then
			uv0.horcrux_data = {
				bid = slot0.bid,
				horcrux_status = slot0.horcrux_status,
				horcrux_lev = slot0.horcrux_lev,
				partner_id = slot0.partner_id,
				star = slot0.star
			}

			uv0:initData()
		end
	end)
end

function HorcruxTips.onClickCloseBtn(slot0)
	uv0:openHorcruxTipsPanel(false)
end

function HorcruxTips.onTabBtn1(slot0)
	if slot0.horcrux_data then
		uv0:openHorcruxStrengtPanel(true, slot0.horcrux_data)
	end

	uv0:openHorcruxTipsPanel(false)
end

function HorcruxTips.onClickFallbackBtn(slot0)
	uv0:openHeroResetHorcruxPanel(true, slot0.horcrux_data)
end

function HorcruxTips.openRootWnd(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot0.horcrux_data = slot1
	slot0.is_show_sp_attr = false

	if uv0:getPartnerHorcruxConfig(slot1.bid) and next(slot3.sp_attrs) then
		slot0.is_show_sp_attr = true
	end

	slot4 = uv0.hero_info_upgrade_star_param4

	if slot0.horcrux_data.star == uv0.hero_info_upgrade_star_param4 then
		slot4 = 13
	end

	slot0.tips_label:setString(string.format(TI18N("英雄达到%s星解锁"), slot4))

	slot0.open_type = slot2 or PartnerConst.HorcruxTips.other

	slot0:initData()
	slot0:setMirrorUI()
end

function HorcruxTips.setMirrorUI(slot0)
	if slot0.horcrux_data.is_mirror and slot0.horcrux_data.is_mirror == true then
		slot0.tab_btn_1:setVisible(false)
		slot0.tips_label:setVisible(true)
		slot0.tips_label:setString(TI18N("魂器不可升星,等级与宿主英雄相同"))
	end
end

function HorcruxTips.initData(slot0)
	slot3 = 0

	if true then
		if slot0:setBaseAttrInfo() > 0 then
			slot1 = slot0.container_init_size.height + slot3
		else
			slot3 = 0

			slot0.baseattr_panel:setVisible(false)
		end
	else
		slot3 = 0

		slot0.baseattr_panel:setVisible(false)
	end

	slot5 = 0

	if true then
		if slot0:setStrengthenInfo() > 0 then
			slot1 = slot1 + slot5
		else
			slot5 = 0

			slot0.strengthen_panel:setVisible(false)
		end
	else
		slot5 = 0

		slot0.strengthen_panel:setVisible(false)
	end

	if slot0.open_type == PartnerConst.HorcruxTips.normal then
		slot0:updateBtnList()
	else
		slot1 = slot1 - slot0.tab_panel_height

		slot0.tab_panel:setVisible(false)
	end

	if slot0.is_show_sp_attr then
		slot0.spattr_panel:setVisible(true)
		slot0:setSpAttrInfo()

		slot1 = slot1 + slot0.spattr_panel_height
	end

	if slot1 ~= slot0.container_init_size.height then
		slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot1))

		slot7 = slot1 - 4

		slot0.base_panel:setPositionY(slot7)
		slot0.close_btn:setPositionY(slot7 - 11)

		slot7 = slot7 - slot0.base_panel:getContentSize().height

		if slot2 then
			slot0.baseattr_panel:setPositionY(slot7)

			slot7 = slot7 - slot3
		end

		if slot4 then
			slot0.strengthen_panel:setPositionY(slot7)

			slot7 = slot7 - slot5
		end

		if slot0.is_show_sp_attr then
			slot0.spattr_panel:setPositionY(slot7)

			slot7 = slot7 - slot0.spattr_panel_height
		end

		slot0.desc_panel:setPositionY(slot7)

		if slot6 then
			slot0.tab_panel:setPositionY(slot7 - slot0.desc_panel:getContentSize().height)
		end
	end

	slot0:setBaseInfo()
end

function HorcruxTips.setSpAttrInfo(slot0)
	if not slot0.horcrux_data then
		return
	end

	if not uv0:getPartnerHorcruxConfig(slot0.horcrux_data.bid) or not next(slot1.sp_attrs) then
		return
	end

	slot2 = PathTool.getResFrame("hero", "hero_info_65")
	slot3 = cc.c4b(193, 183, 171, 255)
	slot4 = 0.8

	if slot0.horcrux_data.link_horcrux_lev and Config.HorcruxData.data_lev_max_max <= slot0.horcrux_data.link_horcrux_lev then
		slot2 = PathTool.getResFrame("hero", "hero_info_64")
		slot3 = cc.c4b(101, 223, 116, 255)
		slot4 = 0.9

		slot0.sp_attr_tips:setVisible(false)
	end

	slot10 = slot0.spattr_panel
	slot11 = cc.p(0.5, 0.5)

	createSprite(slot2, 39, 20, slot10, slot11, LOADTEXT_TYPE_PLIST):setScale(slot4)

	for slot10, slot11 in ipairs(slot1.sp_attrs) do
		slot12, slot13, slot14 = commonGetAttrInfoByKeyValue(slot11[1], slot11[2])
		slot6 = uv1("%s    %s+%s", "", slot13, slot14)
	end

	if not slot0.sp_desc_label then
		slot0.sp_desc_label = createLabel(19, slot3, nil, 46, 20, slot6, slot0.spattr_panel, nil, cc.p(0, 0.5))
	end

	slot0.sp_desc_label:setString(slot6)
end

function HorcruxTips.updateBtnList(slot0)
	slot0.tab_btn_1:setTitleText(TI18N("升星"))
end

function HorcruxTips.setBaseInfo(slot0)
	if slot0.horcrux_data == nil then
		return
	end

	slot2 = uv0:getPartnerHorcruxConfig(slot0.horcrux_data.bid)

	if Config.PartnerData.data_partner_base[slot0.horcrux_data.bid] == nil or slot2 == nil or uv0:getHorcruxAttrConfig(slot0.horcrux_data.horcrux_lev) == nil then
		return
	end

	slot0.horcrux_item:setData(slot0.horcrux_data)

	slot5 = PathTool.getResFrame("tips", "tips_" .. (slot2.quality or 0))

	if slot0.record_background_res == nil or slot0.record_background_res ~= slot5 then
		slot0.record_background_res = slot5

		loadSpriteTexture(slot0.base_panel, slot5, LOADTEXT_TYPE_PLIST)
	end

	slot0.name:setTextColor(BackPackConst.getEquipTipsColor(slot4))
	slot0.name:setString(slot2.horcrux_name)
	slot0.equip_type:setString(uv1(TI18N("%s专属"), slot1.name))
	slot0.power_label:setNum(slot3.score or 0)

	if slot0.horcrux_item.show_type == 2 or slot0.horcrux_item.show_type == 6 then
		slot0.tab_btn_1:setVisible(false)
		slot0.tips_label:setVisible(true)
	else
		slot0.tab_btn_1:setVisible(true)
		slot0.tips_label:setVisible(false)
	end

	slot0.desc_label:setString(slot2.horcrux_desc)

	slot10 = math.max(slot0.desc_label:getContentSize().height, slot0.scroll_size.height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot10))
	slot0.desc_label:setPositionY(slot10 - 10)
end

function HorcruxTips.setBaseAttrInfo(slot0)
	slot2 = 0

	if uv0:getHorcruxAttrList(slot0.horcrux_data.bid, slot0.horcrux_data.horcrux_lev) == nil then
		return 0
	end

	for slot6, slot7 in ipairs(slot1) do
		slot9 = slot7[1][2]

		if Config.AttrData.data_key_to_name[slot7[1][1]] then
			if not slot0.base_list[slot6] then
				slot0.base_list[slot6] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(4, 28), nil, nil, 380)

				slot0.baseattr_panel:addChild(slot0.base_list[slot6])
			end

			if (slot6 + 1) % 2 == 0 then
				slot2 = slot2 + 1
			end

			slot0.base_list[slot6]:setPosition(24 + (slot6 - 1) % 2 * 200, 28 - (slot2 - 1) * 40)

			slot14 = PathTool.getAttrIconByStr(slot8)

			if PartnerCalculate.isShowPerByStr(slot8) == true then
				slot9 = slot9 * 0.1 .. "%"
			end

			slot11:setString(uv1("<img src='%s' scale=1 /> <div fontcolor=#c1b7ab> %s：</div><div fontcolor=#ffeedd>%s</div>", PathTool.getResFrame("common", slot14), slot10, slot9))
		end
	end

	slot0.strengthen_label:setVisible(not slot0:checkIsMax())

	return slot0.baseattr_panel_height + 40 * (slot2 - 1)
end

function HorcruxTips.setStrengthenInfo(slot0)
	if slot0.strengthen_list then
		for slot4, slot5 in ipairs(slot0.strengthen_list) do
			slot0.strengthen_list[slot4]:removeFromParent()

			slot0.strengthen_list[slot4] = nil
		end
	end

	slot0.strengthen_list = {}
	slot2 = 0

	if uv0:getStrengthenDesc(slot0.horcrux_data.bid, slot0.horcrux_data.horcrux_lev) then
		for slot6, slot7 in ipairs(slot1) do
			slot8, slot9 = slot0:createStrengthenItem(slot7)

			slot8:setPosition(24, 26 - (slot2 + slot9) - slot9 / 2 - 20)
			slot0.strengthen_panel:addChild(slot8)

			slot0.strengthen_list[slot6] = slot8
		end

		return slot0.strengthen_panel_height + slot2
	end

	return 0
end

function HorcruxTips.createStrengthenItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = cc.size(550, 40)

	ccui.Widget:create():setAnchorPoint(0, 0.5)

	slot4 = PathTool.getResFrame("hero", "hero_info_65")
	slot5 = cc.c4b(193, 183, 171, 255)
	slot6 = 0.8

	if slot1.is_achieve then
		slot4 = PathTool.getResFrame("hero", "hero_info_64")
		slot5 = cc.c4b(101, 223, 116, 255)
		slot6 = 0.9
	end

	slot7 = createRichLabel(19, slot5, cc.p(0, 0.5), cc.p(30, 0), 8, nil, 320)

	slot7:setString(slot1.desc_str)

	slot2.height = math.max(slot2.height, slot7:getContentSize().height + 15)

	slot3:setContentSize(cc.size(slot2.width, slot2.height))
	slot3:addChild(slot7)
	slot7:setPositionY(slot2.height / 2)
	createImage(slot3, slot4, 15, slot2.height / 2 + slot7:getContentSize().height / 2 + 3, cc.p(0.5, 1), true):setScale(slot6)

	return slot3, slot2.height
end

function HorcruxTips.checkIsMax(slot0)
	if slot0.horcrux_data and slot0.horcrux_data.horcrux_lev and uv0:getHorcruxAttrConfig(slot0.horcrux_data.horcrux_lev + 1) then
		return false
	end

	return true
end

function HorcruxTips.close_callback(slot0)
	if slot0.horcrux_item then
		slot0.horcrux_item:DeleteMe()

		slot0.horcrux_item = nil
	end

	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	uv0:openHorcruxTipsPanel(false)
end
