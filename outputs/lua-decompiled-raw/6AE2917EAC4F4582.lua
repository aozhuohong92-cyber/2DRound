HeroLibraryInfoWindow = HeroLibraryInfoWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()
slot1 = table.sort
slot2 = string.format
slot3 = table.insert

function HeroLibraryInfoWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_library_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("herolibrary", "herolibrary"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.select_index = 0
	slot0.max_index = 2
	slot0.skill_item_list = {}
	slot0.encounter_id = 0
end

function HeroLibraryInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_draw_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.hero_name_bg = slot0.main_container:getChildByName("hero_name_bg")
	slot0.hero_draw_icon = slot0.main_container:getChildByName("hero_draw_icon")
	slot0.hero_name = slot0.hero_name_bg:getChildByName("hero_name")
	slot0.title_name = slot0.hero_name_bg:getChildByName("title_name")
	slot0.title_bg = slot0.hero_name_bg:getChildByName("title_bg")
	slot0.box_6 = slot0.main_container:getChildByName("box_6")
	slot0.attr_btn = slot0.box_6:getChildByName("attr_btn")

	slot0.attr_btn:getChildByName("label"):setString(TI18N("详细属性"))

	slot0.story_btn = slot0.box_6:getChildByName("story_btn")

	slot0.story_btn:getChildByName("label"):setString(TI18N("查看传记"))

	slot0.share_btn = slot0.box_6:getChildByName("share_btn")

	slot0.share_btn:getChildByName("label"):setString(TI18N("分享英雄"))

	slot0.encounter_btn = slot0.box_6:getChildByName("encounter_btn")

	slot0.encounter_btn:getChildByName("label"):setString(TI18N("物语图鉴"))
	slot0.encounter_btn:setVisible(false)
	slot0:adaptationScreen()
end

function HeroLibraryInfoWindow.adaptationScreen(slot0)
	slot4, slot5 = slot0.box_6:getPosition()
	slot7, slot8 = slot0.hero_name_bg:getPosition()
	slot9 = display.getTop(slot0.main_container) - (slot0.main_container:getContentSize().height - slot8)

	slot0.hero_name_bg:setPositionY(slot9)
	slot0.box_6:setPositionY(slot5 + display.getBottom(slot0.main_container))
	slot0.close_btn:setPositionY(slot9)
end

function HeroLibraryInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroLibraryInfoWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.attr_btn, function ()
		uv0:onClickAttrBtn()
	end, true, 2)
	registerButtonEventListener(slot0.story_btn, function ()
		uv0:onClickStoryBtn()
	end, true, 2)
	registerButtonEventListener(slot0.share_btn, function ()
		uv0:onClickShareBtn()
	end, true, 2)
end

function HeroLibraryInfoWindow.onClickAttrBtn(slot0)
	if not slot0.partner_config then
		return
	end

	if Config.PartnerData.data_partner_pokedex[slot0.partner_config.bid] and slot1[1] then
		uv0:openHeroInfoWindowByBidStar(slot0.partner_config.bid, slot1[1].star or 1)
	end
end

function HeroLibraryInfoWindow.onClickStoryBtn(slot0)
	if not slot0.partner_config or not slot0.library_config then
		return
	end

	if slot0.library_config.story == nil or slot0.library_config.story == "" then
		message(TI18N("该英雄暂无传记"))

		return
	end

	uv1:openHeroLibraryStoryPanel(true, uv0("%s %s", slot0.library_config.title, slot0.partner_config.name), slot0.library_config.story)
end

function HeroLibraryInfoWindow.onClickShareBtn(slot0)
	if not slot0.partner_config or not slot0.library_config then
		return
	end

	if slot0.partner_config.draw_res and slot1 ~= "" then
		uv0:openHeroLookDrawWindow(true, slot1, slot0.partner_config.name, slot0.partner_config, HeroConst.ShareType.eLibraryInfoShare)
	end
end

function HeroLibraryInfoWindow.onClickVoiceBtn(slot0)
	if not slot0.partner_config then
		return
	end

	if slot0.partner_config.voice and slot0.partner_config.voice ~= "" then
		uv0:onPlayHeroVoice(slot0.partner_config.voice, slot0.partner_config.voice_time)
	end
end

function HeroLibraryInfoWindow.onClickLeftBtn(slot0)
	slot0.select_index = slot0.select_index - 1

	if slot0.select_index <= 1 then
		slot0.select_index = 1
	end

	slot0:setBtnVisable(slot0.select_index)
	slot0:showPanelByIndex(slot0.select_index)
end

function HeroLibraryInfoWindow.onClickRightBtn(slot0)
	slot0.select_index = slot0.select_index + 1

	if slot0.max_index <= slot0.select_index then
		slot0.select_index = slot0.max_index
	end

	slot0:setBtnVisable(slot0.select_index)
	slot0:showPanelByIndex(slot0.select_index)
end

function HeroLibraryInfoWindow.setBtnVisable(slot0, slot1)
	if slot1 <= 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(true)
	elseif slot0.max_index <= slot1 then
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(false)
	else
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(true)
	end
end

function HeroLibraryInfoWindow.openRootWnd(slot0, slot1, slot2)
	slot4 = Config.PartnerData.data_partner_library(slot1)

	if not Config.PartnerData.data_partner_base[slot1] or not slot4 then
		return
	end

	slot0.partner_config = slot3
	slot0.library_config = slot4

	slot0:updateHeroInfo()

	slot0.page_view = CustomPageView.new(cc.size(720, 220), true, true)

	slot0.page_view:setPosition(-10, 14)
	slot0.box_6:addChild(slot0.page_view)

	slot0.page_view.per_page = 1

	slot0.page_view:addCreatePageCallBack(function (slot0, slot1, slot2)
		if slot1 == 1 then
			uv0:createSkillPanel(slot2)
		elseif slot1 == 2 then
			uv0:createVoicePanel(slot2)
		end
	end)
	slot0.page_view:setViewData({
		{
			1
		},
		{
			2
		}
	})
	slot0.page_view:adjustLightPos(10, 20, 10)
end

function HeroLibraryInfoWindow.updateHeroInfo(slot0)
	if not slot0.partner_config or not slot0.library_config then
		return
	end

	if slot0.hero_draw_icon then
		slot0.item_load = loadSpriteTextureFromCDN(slot0.hero_draw_icon, PathTool.getPlistImgForDownLoad("herodraw/herodrawres", slot0.partner_config.draw_res, false), ResourcesType.single, slot0.item_load)
	end

	if slot0.library_config.scale == 0 then
		slot0.hero_draw_icon:setScale(1)
	else
		slot0.hero_draw_icon:setScale(slot0.library_config.scale / 100)
	end

	if slot0.library_config.draw_offset and next(slot0.library_config.draw_offset) ~= nil then
		slot3, slot4 = slot0.hero_draw_icon:getPosition()

		slot0.hero_draw_icon:setPosition(slot3 + (slot0.library_config.draw_offset[1][1] or 0), slot4 + (slot0.library_config.draw_offset[1][2] or 0))
	end

	slot0.hero_name:setString(slot0.partner_config.name)

	if slot0.library_config.title and slot0.library_config.title ~= "" then
		slot0.title_name:setString(slot0.library_config.title)
	else
		slot0.title_bg:setVisible(false)
	end
end

function HeroLibraryInfoWindow.createSkillPanel(slot0, slot1)
	if not slot0.partner_config or not slot0.library_config then
		return
	end

	createLabel(26, cc.c4b(7, 60, 95, 255), nil, 79, 176, uv0("%s：%s%s", TI18N("属性"), tostring(HeroConst.CampAttrName[slot0.partner_config.camp_type]), tostring(HeroConst.CareerName[slot0.partner_config.type])), slot1)
	createLabel(26, cc.c4b(7, 60, 95, 255), nil, 442, 176, uv0("%s：%s", TI18N("定位"), slot0.partner_config.hero_pos), slot1)

	slot0.skill_container_size = cc.size(580, 130)
	slot0.skill_container = createScrollView(slot0.skill_container_size.width, slot0.skill_container_size.height, 70, 35, slot1, ccui.ScrollViewDir.vertical)

	slot0.skill_container:setSwallowTouches(false)
	slot0:initSkill()
end

function HeroLibraryInfoWindow.createVoicePanel(slot0, slot1)
	if not slot0.partner_config or not slot0.library_config then
		return
	end

	slot2 = createRichLabel(26, cc.c4b(7, 60, 95, 255), cc.p(0, 1), cc.p(70, 160), 12, nil, 580)

	slot1:addChild(slot2)
	slot2:setString(slot0.library_config.voice_str)

	if slot0.partner_config.voice and slot0.partner_config.voice ~= "" then
		slot3 = ccui.Layout:create()

		slot3:setContentSize(cc.size(176, 42))
		slot3:setAnchorPoint(cc.p(0, 0.5))
		slot3:setPosition(497, 35)
		slot3:setTouchEnabled(true)
		slot1:addChild(slot3)
		registerButtonEventListener(slot3, function ()
			uv0:onClickVoiceBtn()
		end, true, 2)
		createSprite(PathTool.getResFrame("herolibrary", "hero_library_19"), 23, 21, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		createSprite(PathTool.getResFrame("herolibrary", "hero_library_20"), 82, 9, slot3, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		createLabel(22, cc.c4b(248, 194, 60, 255), cc.c4b(2, 0, 25, 255), 82, 23, TI18N("播放语音"), slot3, 2, cc.p(0.5, 0.5))
	end
end

function HeroLibraryInfoWindow.showPanelByIndex(slot0, slot1)
	slot0.select_index = slot1

	for slot5 = 1, slot0.max_index do
		if slot1 == slot5 then
			slot0.point_list[slot5]:setVisible(true)
		else
			slot0.point_list[slot5]:setVisible(false)
		end
	end

	if slot1 == 1 then
		slot0:showSkillPanel(true)
		slot0:showVoicePanel(false)
	elseif slot1 == 2 then
		slot0:showSkillPanel(false)
		slot0:showVoicePanel(true)
	end
end

function HeroLibraryInfoWindow.showSkillPanel(slot0, slot1)
	if slot1 then
		slot0.skill_panel:setVisible(true)

		if not slot0.partner_config or not slot0.library_config then
			return
		end

		if slot0.is_init_skill == nil then
			slot0.is_init_skill = true

			slot0.attr_name:setString(uv0("%s：%s%s", TI18N("属性"), tostring(HeroConst.CampAttrName[slot0.partner_config.camp_type]), tostring(HeroConst.CareerName[slot0.partner_config.type])))
			slot0.type_name:setString(uv0("%s：%s", TI18N("定位"), slot0.partner_config.hero_pos))
			slot0:initSkill()
		end
	else
		slot0.skill_panel:setVisible(false)
	end
end

function HeroLibraryInfoWindow.showVoicePanel(slot0, slot1)
	if slot1 then
		slot0.voice_panel:setVisible(true)

		if not slot0.partner_config or not slot0.library_config then
			return
		end

		if slot0.is_init_voice == nil then
			slot0.is_init_voice = true
			slot2 = createRichLabel(26, cc.c4b(7, 60, 95, 255), cc.p(0, 1), cc.p(0, 0), 12, nil, 580)

			slot0.voice_node:addChild(slot2)
			slot2:setString("    " .. slot0.library_config.voice_str)

			if slot0.partner_config.voice == nil or slot0.partner_config.voice == "" then
				slot0.voice_btn:setVisible(false)
			end
		end
	else
		slot0.voice_panel:setVisible(false)
	end
end

function HeroLibraryInfoWindow.initSkill(slot0)
	if not slot0.partner_config.bid then
		return
	end

	if Config.PartnerData.data_partner_star(getNorKey(slot1, Config.PartnerData.data_partner_max_star[slot0.partner_config.bid] or slot0.partner_config.init_star)) == nil then
		return
	end

	slot5 = {}

	for slot9, slot10 in ipairs(slot4.skills) do
		if slot10[1] ~= 1 then
			uv0(slot5, slot10)
		end
	end

	slot13 = cc.size

	slot0.skill_container:setInnerContainerSize(slot13(math.max(slot0.skill_container_size.width, (108 + 28) * #slot5), slot0.skill_container_size.height))

	for slot13, slot14 in ipairs(slot0.skill_item_list) do
		slot14:setVisible(false)
	end

	slot10 = 0
	slot10 = slot0.skill_container_size.width < slot8 and 0 or (slot0.skill_container_size.width - slot8) * 0.5

	for slot14, slot15 in ipairs(slot5) do
		if Config.SkillData.data_get_skill(slot15[2]) then
			if slot0.skill_item_list[slot14] == nil then
				slot0.skill_item_list[slot14] = {}
				slot0.skill_item_list[slot14] = SkillItem.new(true, true, true, 1, true)

				slot0.skill_item_list[slot14]:setSwallowTouches(false)
				slot0.skill_container:addChild(slot0.skill_item_list[slot14])
			end

			slot0.skill_item_list[slot14]:setData(slot16)
			slot0.skill_item_list[slot14]:setVisible(true)
			slot0.skill_item_list[slot14]:setPosition(slot10 + slot7 * (slot14 - 1) + slot7 * 0.5, slot6 / 2 + 6)
		else
			print(uv1("技能表id: %s 没发现", tostring(slot15.skill_bid)))
		end
	end
end

function HeroLibraryInfoWindow.close_callback(slot0)
	if slot0.hero_music ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.hero_music)
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil
	slot0.encounter_id = 0

	uv0:openHeroLibraryInfoWindow(false)
end
