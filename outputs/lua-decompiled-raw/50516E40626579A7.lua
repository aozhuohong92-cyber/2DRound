HeroMainInfoWindow = HeroMainInfoWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = table.sort
slot3 = table.insert
slot4 = string.format

function HeroMainInfoWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "hero/hero_main_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.star_list = {}
	slot0.star_list2 = {}
	slot0.star10 = nil
	slot0.star_label = nil
	slot0.tab_list = {}
	slot0.view_list = {}
	slot0.can_click_btn = true
	slot0.param_star = uv0.hero_info_upgrade_star_param
	slot0.param_talent = 6
	slot0.show_model_type = HeroConst.BagTab.eBagHero
	slot0.camp_y = {
		[HeroConst.CampType.eWater] = 772,
		[HeroConst.CampType.eFire] = 745,
		[HeroConst.CampType.eWind] = 546,
		[HeroConst.CampType.eLight] = 804,
		[HeroConst.CampType.eDark] = 503,
		[HeroConst.CampType.eLegend] = 503
	}
	slot0.born_limit_lev = 100

	if Config.PartnerData.data_partner_const.born_limit_lev then
		slot0.born_limit_lev = slot1.val
	end
end

function HeroMainInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(1)
	slot0.background:setSize(cc.size(720, 1600))
	slot0.background:setPositionY(600)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.hero_camp_bg = slot0.main_panel:getChildByName("hero_camp_bg")
	slot0.hero_camp_bg_y = slot0.hero_camp_bg:getPositionY()
	slot0.comment_btn = slot0.main_panel:getChildByName("comment_btn")
	slot0.lock_btn = slot0.main_panel:getChildByName("lock_btn")
	slot0.lock_btn_icon = slot0.lock_btn:getChildByName("Sprite_1_0")
	slot0.share_btn = slot0.main_panel:getChildByName("share_btn")
	slot0.reset_btn = slot0.main_panel:getChildByName("reset_btn")

	if slot0.reset_btn then
		slot0.reset_btn:setVisible(false)
	end

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.draw_btn = slot0.main_panel:getChildByName("skin_btn")

	slot0.draw_btn:setVisible(true)

	slot1 = slot0.main_panel:getChildByName("lay_hero")
	slot0.lay_hero = slot1
	slot0.power_click = slot1:getChildByName("power_click")
	slot0.fight_label = CommonNum.new(20, slot0.power_click, 99999, -2, cc.p(0.5, 0.5))
	slot6 = 25

	slot0.fight_label:setPosition(155, slot6)

	slot0.star_node = slot1:getChildByName("star_node")
	slot0.mode_node = slot1:getChildByName("mode_node")
	slot0.camp_icon = slot1:getChildByName("camp_icon")
	slot0.hero_name = slot1:getChildByName("name")
	slot0.left_btn = slot1:getChildByName("left_btn")
	slot0.right_btn = slot1:getChildByName("right_btn")
	slot0.vocie_panel = slot1:getChildByName("voice_panel")
	slot0.tab_container = slot0.main_panel:getChildByName("tab_container")
	slot0.tab_type_list = {
		HeroConst.MainInfoTab.eMainTrain
	}

	for slot6 = 1, 4 do
		slot7 = {
			btn = slot8,
			index = slot6,
			select_bg = slot8:getChildByName("select_img")
		}
		slot8 = slot0.main_panel:getChildByName("tab_btn"):getChildByName("tab_btn_" .. slot6)

		slot7.select_bg:setVisible(false)

		slot7.title = slot8:getChildByName("label")

		slot7.title:setTextColor(cc.c4b(238, 209, 175, 255))
		slot7.title:enableOutline(cc.c4b(83, 61, 50, 255), 2)

		slot7.red_point = slot8:getChildByName("red_point")

		slot7.red_point:setVisible(false)

		slot7.is_hide = true

		slot7.btn:setVisible(false)

		slot0.tab_list[slot6] = slot7
	end

	slot0.resonate_panel = slot0.main_panel:getChildByName("resonate_panel")

	if slot0.resonate_panel then
		slot0.resonate_time = slot0.resonate_panel:getChildByName("resonate_time")

		slot0.resonate_panel:setVisible(false)
	end
end

function HeroMainInfoWindow.adaptationScreen(slot0)
end

function HeroMainInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroMainInfoWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.comment_btn, function ()
		uv0:onClickCommentBtn()
	end, true, 1)
	registerButtonEventListener(slot0.lock_btn, function ()
		uv0:onClickLockBtn()
	end, true, 1)
	registerButtonEventListener(slot0.draw_btn, function ()
		uv0:onClickSkinBtn()
	end, true, 1)
	registerButtonEventListener(slot0.reset_btn, function ()
		uv0:onClickResetBtn()
	end, true, 1)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		uv0:onClickSharetBtn(slot1:convertToWorldSpace(cc.p(0.5, 0)))
	end, true, 1)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0._onClickBtnLeft), true, 1)

	slot4 = handler(slot0, slot0._onClickBtnRight)
	slot5 = true

	registerButtonEventListener(slot0.right_btn, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabType(uv1, true, uv2.btn)
		end, false, 1)
	end

	slot0.vocie_panel:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0:onClickVoiceBtn()
		end
	end)

	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_vo ~= nil and slot0.role_lev_event == nil then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if not uv0.select_hero_vo then
				return
			end

			if slot0 == "lev" then
				uv0:checkTabShow()
			end
		end)
	end

	slot0:addGlobalEvent(RoleEvent.WORLD_LEV, function ()
		if not uv0.select_hero_vo then
			return
		end

		uv0:checkTabShow()
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Data_Update, function (slot0)
		if not slot0 then
			return
		end

		if slot0.partner_id == uv0.select_hero_vo.partner_id then
			uv0:updatePower()
			uv0:updateHeroBg()
			uv0:createStar(uv0.select_hero_vo.star)
			uv0:updateSpine(uv0.select_hero_vo, false)
			uv0:checkTabShow()
			uv0:updateResetInfo()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if not slot0 then
			return
		end

		slot1 = {
			[slot6.partner_id] = true
		}

		for slot5, slot6 in ipairs(slot0) do
			-- Nothing
		end

		slot2 = {}

		for slot6, slot7 in ipairs(uv0.hero_list) do
			if not slot1[slot7.partner_id] then
				uv1(slot2, slot7)

				if uv0.select_hero_vo.partner_id == slot7.partner_id then
					uv0.select_index = #slot2
				end
			end
		end

		uv0.hero_list = slot2
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Detail_Data_Update, function (slot0)
		if not slot0 then
			return
		end

		if slot0.partner_id == uv0.select_hero_vo.partner_id and uv0.equip_panel then
			uv0.equip_panel:setData(uv0.select_hero_vo)
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Equip_Update_Event, function ()
		uv0:updatePower()
	end)
	slot0:addGlobalEvent(HeroEvent.Holy_Equipment_Update_Event, function ()
		uv0:updatePower()
	end)
	slot0:addGlobalEvent(HeroEvent.Artifact_Update_Event, function ()
		uv0:updatePower()
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Lock_Event, function ()
		if not uv0.select_hero_vo then
			return
		end

		uv0:setLock()
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Level_Up_Success_Event, function ()
		if not uv0.select_hero_vo then
			return
		end

		uv0:showLevelUpAction()
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Can_Play_Level_UP_Music_Event, function ()
		uv0.can_play_music = true
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Talent_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.select_hero_vo then
			return
		end

		for slot4, slot5 in ipairs(slot0) do
			if slot5.partner_id == uv0.select_hero_vo.partner_id then
				uv0:updatePageRedPoint()
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Get_Holy_Equipment_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.select_hero_vo then
			return
		end

		for slot4, slot5 in ipairs(slot0) do
			if slot5.partner_id == uv0.select_hero_vo.partner_id then
				uv0:updatePageInfo()
				uv0:updatePageRedPoint()
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Holy_Equipment_Update_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.select_hero_vo then
			return
		end

		if slot0.partner_id == uv0.select_hero_vo.partner_id then
			uv0:updatePageRedPoint()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Get_Had_Hero_Star_Event, function ()
		if not uv0.select_hero_vo then
			return
		end

		if uv0.select_hero_vo.star >= 13 then
			uv0:updatePageInfo()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Update_Star_Close_Event, function (slot0)
		if not uv0.select_hero_vo then
			return
		end

		if slot0 and slot0.partner_id == uv0.select_hero_vo.partner_id and uv0.select_hero_vo.star == uv1.hero_info_upgrade_star_param4 + 1 then
			uv0.is_show_open_talent_effect = true

			uv0:checkTalentOpenEffect()
		end
	end)
end

function HeroMainInfoWindow.onClickDrawBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	uv0:openHeroDrawMainWindow(true, {
		hero_vo = slot0.select_hero_vo
	})
end

function HeroMainInfoWindow.onClickVoiceBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	slot1, slot2 = nil

	if slot0.select_hero_vo.use_skin ~= 0 and Config.PartnerSkinData.data_skin_info[slot0.select_hero_vo.use_skin] then
		slot1 = slot3.voice
		slot2 = slot3.voice_time
	end

	if slot1 == nil or slot1 == "" then
		slot2 = slot0.select_hero_vo.voice_time

		if slot0.select_hero_vo.voice == nil and Config.PartnerData.data_partner_base[slot0.select_hero_vo.bid] then
			slot1 = slot3.voice
			slot2 = slot3.voice_time
		end
	end

	if slot1 and slot1 ~= "" then
		playButtonSound2()
		uv0:onPlayHeroVoice(slot1, slot2)
	end
end

function HeroMainInfoWindow.onClickSkinBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	uv0:openHeroSkinWindow(true, slot0.select_hero_vo)
end

function HeroMainInfoWindow.onClickResetBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	if not slot0.select_hero_vo:isResetTimeInfo() then
		return
	end

	uv0:openHeroResetComfirmPanel(true, slot0.select_hero_vo)
end

function HeroMainInfoWindow.onClickCommentBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	PokedexController:getInstance():openCommentWindow(true, slot0.select_hero_vo)
end

function HeroMainInfoWindow.onClickSharetBtn(slot0, slot1)
	uv0:openHeroSharePanel(true, slot1, function (slot0, slot1)
		if not slot0 or not slot1 then
			return
		end

		if uv0.root_wnd and not tolua.isnull(uv0.root_wnd) and slot1.hero_vo then
			if slot0 == HeroConst.ShareBtnType.eHeroShareCross then
				uv1:sender11060(ChatConst.Channel.Cross, slot2.partner_id)
			elseif slot0 == HeroConst.ShareBtnType.eHeroShareWorld then
				uv1:sender11060(ChatConst.Channel.World, slot2.partner_id)
			elseif slot0 == HeroConst.ShareBtnType.eHeroShareGuild then
				uv1:sender11060(ChatConst.Channel.Gang, slot2.partner_id)
			end
		end
	end, {
		offsetx = -60,
		offsety = -60,
		hero_vo = slot0.select_hero_vo
	})
end

function HeroMainInfoWindow.showSharePanel(slot0, slot1)
	if slot1 == false and not slot0.share_panel then
		return
	end

	if not slot0.share_panel then
		slot2 = cc.size(200, 230)
		slot0.share_panel = ccui.Widget:create()

		slot0.share_panel:setContentSize(slot2)
		slot0.main_panel:addChild(slot0.share_panel)
		slot0.share_panel:setPosition(cc.p(459, 711))

		slot4 = createImage(slot0.share_panel, PathTool.getResFrame("common", "common_1056"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), true, 0, true)

		slot4:setContentSize(slot2)
		slot4:setCapInsets(cc.rect(14, 14, 14, 14))

		slot5 = PathTool.getResFrame("common", "common_1017")
		slot6 = createButton(slot0.share_panel, TI18N("世界频道"), slot2.width / 2, 115, cc.size(160, 64), slot5, 26, Config.ColorData.data_color4[1])

		slot6:enableOutline(Config.ColorData.data_color4[264], 2)
		slot6:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.select_hero_vo then
					return
				end

				uv1:sender11060(ChatConst.Channel.World, uv0.select_hero_vo.partner_id)
				uv0:showSharePanel(false)
			end
		end)

		slot7 = createButton(slot0.share_panel, TI18N("公会频道"), slot2.width / 2, 45, cc.size(160, 64), slot5, 26, Config.ColorData.data_color4[1])

		slot7:enableOutline(Config.ColorData.data_color4[264], 2)
		slot7:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.select_hero_vo then
					return
				end

				uv1:sender11060(ChatConst.Channel.Gang, uv0.select_hero_vo.partner_id)
				uv0:showSharePanel(false)
			end
		end)

		slot8 = createButton(slot0.share_panel, TI18N("跨服频道"), slot2.width / 2, 185, cc.size(160, 64), slot5, 26, Config.ColorData.data_color4[1])

		slot8:enableOutline(Config.ColorData.data_color4[264], 2)
		slot8:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.select_hero_vo then
					return
				end

				uv1:sender11060(ChatConst.Channel.Cross, uv0.select_hero_vo.partner_id)
				uv0:showSharePanel(false)
			end
		end)
	end

	slot0.share_panel:setVisible(slot1)
end

function HeroMainInfoWindow.onClickLockBtn(slot0)
	if not slot0.select_hero_vo then
		return
	end

	uv0:sender11015(slot0.select_hero_vo.partner_id, (slot0.select_hero_vo.dic_locks[HeroConst.LockType.eHeroLock] or 0) == 1 and 0 or 1)
end

function HeroMainInfoWindow._onClickBtnLeft(slot0)
	if not slot0.can_click_btn then
		return
	end

	if not slot0.hero_list or #slot0.hero_list <= 1 then
		return
	end

	slot0.select_index = slot0.select_index - 1

	if slot0.select_index <= 1 then
		slot0.select_index = 1
	end

	slot0:setBtnShowStatus()

	slot0.select_hero_vo = slot0.hero_list[slot0.select_index]

	slot0:updateData()
end

function HeroMainInfoWindow._onClickBtnRight(slot0)
	if not slot0.can_click_btn then
		return
	end

	if not slot0.hero_list or #slot0.hero_list <= 1 then
		return
	end

	slot0.select_index = slot0.select_index + 1

	if #slot0.hero_list <= slot0.select_index then
		slot0.select_index = slot1
	end

	slot0:setBtnShowStatus()

	slot0.select_hero_vo = slot0.hero_list[slot0.select_index]

	slot0:updateData()
end

function HeroMainInfoWindow.setBtnShowStatus(slot0)
	if not slot0.select_index then
		return
	end

	if not slot0.hero_list then
		return
	end

	if #slot0.hero_list == 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(false)

		return
	end

	if slot0.select_index == 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(true)
	elseif slot0.select_index == #slot0.hero_list then
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(false)
	else
		slot0.left_btn:setVisible(true)
		slot0.right_btn:setVisible(true)
	end

	slot0.is_hide_talent_Item = nil
end

function HeroMainInfoWindow.changeTabType(slot0, slot1, slot2, slot3)
	if not slot0.tab_type_list then
		return
	end

	if slot2 and slot0.cur_tab_index == slot1 then
		return
	end

	if not slot0.tab_type_list[slot1] then
		return
	end

	if slot4 == HeroConst.MainInfoTab.eMainUpgradeStar and slot0.is_star_lock then
		TipsManager:getInstance():showCommonTips(slot0.star_lock_dec, cc.p(360, display.getTop(slot0.main_container) - 300), nil, , 650, true)

		return
	elseif slot4 == HeroConst.MainInfoTab.eMainHolyequipment and slot0.is_holy_equp_lock then
		message(slot0.holy_equp_dec)

		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.title:setTextColor(cc.c4b(238, 209, 175, 255))
		slot0.cur_tab.title:enableOutline(cc.c4b(83, 61, 50, 255), 2)
		slot0.cur_tab.select_bg:setVisible(false)
		slot0.cur_tab.title:setFontSize(22)
	end

	slot0.cur_tab_index = slot1
	slot0.cur_type = slot4
	slot0.cur_tab = slot0.tab_list[slot0.cur_tab_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.title:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.cur_tab.select_bg:setVisible(true)
		slot0.cur_tab.title:setFontSize(24)
	end

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_type)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end

	slot0.pre_panel:setData(slot0.select_hero_vo, slot0.show_model_type)
	slot0:updatePageRedPoint()
end

function HeroMainInfoWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == HeroConst.MainInfoTab.eMainTrain then
			slot2 = HeroMainTabTrainPanel.new()
		elseif slot1 == HeroConst.MainInfoTab.eMainUpgradeStar then
			slot2 = HeroMainTabUpgradeStarPanel.new()
		elseif slot1 == HeroConst.MainInfoTab.eMainTalent then
			slot2 = HeroMainTabTalentPanel.new(slot0)
		elseif slot1 == HeroConst.MainInfoTab.eMainHolyequipment then
			slot2 = HeroMainTabHolyequipmentPanel.new()
		end

		slot3 = slot0.tab_container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.tab_container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function HeroMainInfoWindow.checkTalentOpenEffect(slot0)
	if slot0.cur_type then
		if slot0.cur_type == HeroConst.MainInfoTab.eMainTalent then
			if slot0.view_list[slot0.cur_type].checkOpenTanlentEffect then
				slot1:checkOpenTanlentEffect()
			end
		else
			for slot4, slot5 in ipairs(slot0.tab_type_list) do
				if slot5 == slot0.cur_type then
					slot0:changeTabType(slot4, true)

					break
				end
			end
		end
	end
end

function HeroMainInfoWindow.showLevelUpAction(slot0)
	if slot0.effect_parent == nil then
		slot0.effect_parent = ccui.Widget:create()

		slot0.effect_parent:setCascadeOpacityEnabled(true)
		slot0.effect_parent:setAnchorPoint(0, 0)
		slot0.mode_node:addChild(slot0.effect_parent, 2)

		slot0.show_level_label_list = {}
		slot1 = 25

		for slot6 = 1, 4 do
			slot0.show_level_label_list[slot6] = createLabel(20, cc.c3b(72, 244, 80), cc.c3b(0, 0, 0), -40, 50 - slot1 * (slot6 - 1) - slot1 * 0.5, "内容", slot0.effect_parent, 2, cc.p(0, 0.5), font)
		end
	end

	for slot5, slot6 in ipairs({
		"atk",
		"hp",
		"def",
		"speed"
	}) do
		if slot0.show_level_label_list[slot5] then
			slot0.show_level_label_list[slot5]:setString(uv0("%s + %s", Config.AttrData.data_key_to_name[slot6], math.ceil((slot0.select_hero_vo[slot6 .. 2] or 0) / 1000)))
		end
	end

	slot0.effect_parent:setVisible(true)
	slot0.effect_parent:stopAllActions()
	slot0.effect_parent:setPosition(-80, 0)
	slot0.effect_parent:setOpacity(10)
	slot0:showLevelUpEffect(true)
	slot0.effect_parent:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(0, 0)), cc.FadeIn:create(0.2)), cc.EaseSineOut:create(cc.MoveTo:create(0.4, cc.p(0, 10))), cc.CallFunc:create(function ()
		uv0.effect_parent:setVisible(false)
	end)))
end

function HeroMainInfoWindow.showLevelUpEffect(slot0, slot1)
	if slot1 == false then
		if slot0.level_up_effect then
			slot0.level_up_effect:clearTracks()
			slot0.level_up_effect:removeFromParent()

			slot0.level_up_effect = nil
		end
	elseif not tolua.isnull(slot0.mode_node) and slot0.level_up_effect == nil then
		if slot0.can_play_music then
			slot0.can_play_music = false

			playOtherSound("c_levelup")
		end

		slot0.level_up_effect = createEffectSpine(PathTool.getEffectRes(185), cc.p(0, -30), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.mode_node:addChild(slot0.level_up_effect, 1)
	elseif slot0.level_up_effect then
		if slot0.can_play_music then
			slot0.can_play_music = false

			playOtherSound("c_levelup")
		end

		slot0.level_up_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function HeroMainInfoWindow.sendRssetTimeProto(slot0)
	if not slot0.select_hero_vo then
		return
	end

	if slot0.select_hero_vo.isResetTimeInfo and not slot0.select_hero_vo:isResetTimeInfo() then
		uv0:sender11067(slot0.select_hero_vo.partner_id)
	end
end

function HeroMainInfoWindow.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.select_hero_vo = slot1
	slot0.can_click_btn = true
	slot0.select_index = -1
	slot0.hero_list = slot2
	slot4 = slot3 or {}
	slot0.show_model_type = slot4.show_model_type or HeroConst.BagTab.eBagHero
	slot0.is_hide_ui = slot4.is_hide_ui or false

	if slot0.hero_list then
		for slot8, slot9 in ipairs(slot0.hero_list) do
			if slot0.select_hero_vo.partner_id == slot9.partner_id then
				slot0.select_index = slot8
			end
		end

		if slot0.select_index == -1 then
			return
		end
	end

	slot0:setBtnShowStatus()

	slot0.cur_type = slot4.show_type or HeroConst.MainInfoTab.eMainTrain

	slot0:updateData()

	if slot0.is_hide_ui then
		MainuiController:getInstance():setMainUIShowStatus(false)
	end

	if slot0.show_model_type == HeroConst.BagTab.eBagPokedex then
		for slot8, slot9 in pairs(slot0.tab_list) do
			slot9.btn:setVisible(false)
		end

		slot0.lock_btn:setVisible(false)
		slot0.share_btn:setVisible(false)
	end

	GlobalEvent:getInstance():Fire(MainuiEvent.HEAD_UPDATE_WEALTH_EVENT, 2, Config.ItemData.data_assets_label2id.hero_exp)
end

function HeroMainInfoWindow.updateData(slot0)
	if not slot0.select_hero_vo then
		return
	end

	slot0.record_cur_star = slot0.select_hero_vo.star

	slot0:updateHeadHeroInfo()
	slot0:updatePageInfo()

	if slot0.show_model_type == HeroConst.BagTab.eBagHero then
		if uv0:isOpenTanlentByHerovo(slot0.select_hero_vo) and not slot0.select_hero_vo:ishaveTalentData() then
			uv1:sender11099({
				{
					partner_id = slot0.select_hero_vo.partner_id
				}
			})
		end

		if uv0:isOpenHolyEquipMentOldByHerovo(slot0.select_hero_vo) and not slot0.select_hero_vo:ishaveHolyEquipmentData() then
			uv1:sender11092({
				{
					partner_id = slot0.select_hero_vo.partner_id
				}
			})
		end

		if not slot0.select_hero_vo:isInitAttr() then
			uv1:sender11026({
				{
					partner_id = slot0.select_hero_vo.partner_id
				}
			})
		end

		if slot0.resonate_panel then
			if slot0.select_hero_vo.isResonateHero and slot0.select_hero_vo:isResonateHero() then
				slot0.resonate_panel:setVisible(true)
				commonCountDownTime(slot0.resonate_time, slot0.select_hero_vo.end_time - GameNet:getInstance():getTime(), {
					callback = function (slot0)
						uv0:setTimeFormatString(slot0)
					end
				})
			else
				slot0.resonate_panel:setVisible(false)
				doStopAllActions(slot0.resonate_time)
			end
		end

		slot0:updateResetInfo()
	end
end

function HeroMainInfoWindow.updateResetInfo(slot0)
	if slot0.show_model_type == HeroConst.BagTab.eBagHero and slot0.reset_btn then
		if slot0.select_hero_vo.lev > 1 and slot0.select_hero_vo.lev <= slot0.born_limit_lev and slot0.select_hero_vo.isResonateHero and not slot0.select_hero_vo:isResonateHero() and slot0.select_hero_vo.isResonateCrystalHero and not slot0.select_hero_vo:isResonateCrystalHero() then
			slot0:sendRssetTimeProto()
			slot0.reset_btn:setVisible(true)
		else
			slot0.reset_btn:setVisible(false)
		end
	end
end

function HeroMainInfoWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.resonate_time:setString(TimeTool.GetTimeForFunction(slot1))
	else
		uv0:openHeroMainInfoWindow(false)
	end
end

function HeroMainInfoWindow.updateHeadHeroInfo(slot0)
	if not slot0.select_hero_vo then
		return
	end

	slot0:updateHeroBg()

	slot1 = slot0.select_hero_vo.camp_type or 1
	slot2 = PathTool.getHeroCampTypeIcon(slot0.select_hero_vo.camp_type)

	if slot0.record_camp_type_res == nil or slot0.record_camp_type_res ~= slot2 then
		slot0.record_camp_type_res = slot2

		loadSpriteTexture(slot0.camp_icon, slot2, LOADTEXT_TYPE_PLIST)
	end

	slot0.hero_name:setString(slot0.select_hero_vo.name)

	if string.len(slot0.select_hero_vo.name) > 12 then
		slot0.camp_icon:setPositionX(-25)
	else
		slot0.camp_icon:setPositionX(0)
	end

	slot0:updatePower()
	slot0:createStar(slot0.select_hero_vo.star or 1)
	slot0:updateSpine(slot0.select_hero_vo, true)

	if slot0.show_model_type == HeroConst.BagTab.eBagHero then
		if slot0.equip_panel == nil then
			slot0.equip_panel = HeroMainTabEquipPanel.new(slot0.power_click)
			slot4 = slot0.lay_hero:getContentSize()

			slot0.equip_panel:setPosition(cc.p(slot4.width * 0.5, slot4.height * 0.5))
			slot0.lay_hero:addChild(slot0.equip_panel)
		end

		slot0.equip_panel:setData(slot0.select_hero_vo)
	end

	if slot0.select_hero_vo.draw_res == nil and Config.PartnerData.data_partner_base[slot0.select_hero_vo.bid] then
		slot4 = slot5.draw_res
	end

	if slot0.select_hero_vo.voice == nil and Config.PartnerData.data_partner_base[slot0.select_hero_vo.bid] then
		slot5 = slot6.voice
	end

	if MAKELIFEBETTER == true then
		slot0.draw_btn:setVisible(false)
	elseif slot4 and slot4 ~= "" then
		slot0.draw_btn:setVisible(true)
	else
		slot0.draw_btn:setVisible(true)
	end
end

function HeroMainInfoWindow.updateHeroBg(slot0)
	if not slot0.select_hero_vo then
		return
	end

	slot1 = nil

	if slot0.select_hero_vo.use_skin ~= 0 then
		slot1 = Config.PartnerSkinData.data_skin_info[slot0.select_hero_vo.use_skin]
	end

	slot3 = nil
	slot3 = (not slot1 or not slot1.hero_info_bg_res or slot1.hero_info_bg_res == "" or PathTool.getPlistImgForDownLoad("bigbg/hero", slot1.hero_info_bg_res, true)) and PathTool.getPlistImgForDownLoad("bigbg/hero", HeroConst.CampBgRes[slot0.select_hero_vo.camp_type or HeroConst.CampType.eWater], true)

	if slot0.record_bg_res ~= PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_info_bg_def", true) then
		slot0.record_bg_res = slot3
		slot0.item_load = loadImageTextureFromCDN(slot0.background, slot3, ResourcesType.single, slot0.item_load)
	end
end

function HeroMainInfoWindow.updatePageInfo(slot0)
	if slot0.show_model_type == HeroConst.BagTab.eBagHero then
		slot0.tab_type_list = {
			HeroConst.MainInfoTab.eMainTrain
		}
		slot0.is_star_lock = false

		if slot0:checkStarTabShow(slot0.select_hero_vo.star or 1) then
			uv0(slot0.tab_type_list, HeroConst.MainInfoTab.eMainUpgradeStar)
		end

		if slot0:checkTalentTabShow(slot1) then
			uv0(slot0.tab_type_list, HeroConst.MainInfoTab.eMainTalent)
		end

		slot0.is_holy_equp_lock = false

		if slot0:checkHolyequipmentTabShow() then
			uv0(slot0.tab_type_list, HeroConst.MainInfoTab.eMainHolyequipment)
		end

		for slot5, slot6 in ipairs(slot0.tab_list) do
			if slot0.tab_type_list[slot5] then
				slot6.is_hide = false
				slot6.type = slot0.tab_type_list[slot5]

				if slot6.type == HeroConst.MainInfoTab.eMainUpgradeStar and slot0.is_star_lock then
					setChildUnEnabled(true, slot6.btn)
				elseif slot6.type == HeroConst.MainInfoTab.eMainHolyequipment and slot0.is_holy_equp_lock then
					setChildUnEnabled(true, slot6.btn)
				else
					setChildUnEnabled(false, slot6.btn)
					slot6.title:setTextColor(cc.c4b(238, 209, 175, 255))
					slot6.title:enableOutline(cc.c4b(83, 61, 50, 255), 2)
				end

				slot6.title:setString(HeroConst.MainInfoTabName[slot6.type])

				if slot0.cur_type and slot0.cur_type == slot6.type then
					slot0.cur_tab_index = slot5
				end
			else
				slot6.is_hide = true

				if slot0.cur_tab_index and slot0.cur_tab_index == slot5 then
					slot0.cur_tab_index = 1
				end
			end

			if slot6.type == HeroConst.MainInfoTab.eMainHolyequipment then
				slot6.btn:setName("holy_equip_btn")
			end

			slot6.btn:setVisible(not slot6.is_hide)
		end

		slot0:setLock()
	end

	if slot0.cur_tab_index == nil then
		slot0.cur_tab_index = 1
	elseif slot0.tab_type_list[slot0.cur_tab_index] == HeroConst.MainInfoTab.eMainUpgradeStar and slot0.is_star_lock then
		slot0.cur_tab_index = 1
	elseif slot0.tab_type_list[slot0.cur_tab_index] == HeroConst.MainInfoTab.eMainHolyequipment and slot0.is_holy_equp_lock then
		slot0.cur_tab_index = 1
	end

	slot0:changeTabType(slot0.cur_tab_index, false)
end

function HeroMainInfoWindow.checkStarTabShow(slot0, slot1)
	if uv0:isMaxStarHero(slot0.select_hero_vo.bid, slot1) then
		return false
	end

	if slot0.param_star <= slot1 then
		return slot0:updateStarLockInfo(slot1)
	end

	if Config.PartnerData.data_partner_fuse_star[slot0.select_hero_vo.bid] then
		for slot7, slot8 in ipairs(slot3) do
			if slot1 + 1 == slot8.star then
				return true
			end
		end
	end

	return false
end

function HeroMainInfoWindow.checkStartByConfig(slot0, slot1, slot2)
	slot3 = true

	if slot1 and next(slot1.val) ~= nil and slot1.val[1] == "lv" and RoleController:getInstance():getRoleVo() and slot4.lev and slot4.lev < slot1.val[2] then
		slot3 = false
	end

	if not slot3 then
		slot3 = true

		if slot2 and next(slot2.val) ~= nil and slot2.val[1] == "world_lev" and (RoleController:getInstance():getModel():getWorldLev() or 0) and slot4 < slot2.val[2] then
			slot3 = false
		end
	end

	return slot3
end

function HeroMainInfoWindow.updateStarLockInfo(slot0, slot1)
	slot0.star_lock_dec = TI18N("等级不足")

	if slot1 == uv0.hero_info_upgrade_star_param2 then
		slot2 = true
		slot6, slot0.star_lock_dec = uv0:checkOpenStar11(true)

		if slot0:checkStartByConfig(Config.PartnerData.data_partner_const.star_11_show_lv, Config.PartnerData.data_partner_const.star_11_show_worldlv) and not slot6 then
			slot0.is_star_lock = true
		else
			if slot5 and slot0.is_star_lock then
				slot0.is_check_tab = true
			end

			if slot6 then
				slot5 = slot6
			end
		end

		return slot5
	elseif slot1 == uv0.hero_info_upgrade_star_param3 then
		slot5, slot0.star_lock_dec = uv0:checkOpenStar12(true)

		if slot0:checkStartByConfig(Config.PartnerData.data_partner_const.star_12_show_lv, Config.PartnerData.data_partner_const.star_12_show_worldlv) and not slot5 then
			slot0.is_star_lock = true
		else
			if slot4 and slot0.is_star_lock then
				slot0.is_check_tab = true
			end

			if slot5 then
				slot4 = slot5
			end
		end

		return slot4
	elseif slot1 == uv0.hero_info_upgrade_star_param4 then
		slot5, slot0.star_lock_dec = uv0:checkOpenStar13(true)

		if slot0:checkStartByConfig(Config.PartnerData.data_partner_const.star_13_show_lv, Config.PartnerData.data_partner_const.star_13_show_worldlv) and not slot5 then
			slot0.is_star_lock = true
		else
			if slot4 and slot0.is_star_lock then
				slot0.is_check_tab = true
			end

			if slot5 then
				slot4 = slot5
			end
		end

		return slot4
	else
		return true
	end
end

function HeroMainInfoWindow.checkTalentTabShow(slot0, slot1)
	if slot0.param_talent <= slot1 then
		return true
	end

	return false
end

function HeroMainInfoWindow.checkHolyequipmentTabShow(slot0)
	slot1 = false

	if slot0.select_hero_vo:ishaveHolyEquipmentData() and tableLen(slot0.select_hero_vo.holy_eqm_list) > 0 then
		slot1 = true
	end

	if not slot1 then
		slot2, slot0.holy_equp_dec = uv0:isOpenHolyEquipMentTabByHerovo(slot0.select_hero_vo)

		if slot2 and not uv0:isOpenHolyEquipMentByHerovo(slot0.select_hero_vo) then
			slot0.is_holy_equp_lock = true
		end

		return slot2
	end

	return true
end

function HeroMainInfoWindow.checkTabShow(slot0)
	if slot0.show_model_type ~= HeroConst.BagTab.eBagHero then
		return
	end

	slot1 = false
	slot2 = false
	slot3 = false

	for slot7, slot8 in ipairs(slot0.tab_type_list) do
		if slot8 == HeroConst.MainInfoTab.eMainUpgradeStar then
			slot1 = true
		elseif slot8 == HeroConst.MainInfoTab.eMainTalent then
			slot2 = true
		elseif slot8 == HeroConst.MainInfoTab.eMainHolyequipment then
			slot3 = true
		end
	end

	slot4 = false

	if slot0:checkStarTabShow(slot0.select_hero_vo.star) ~= slot1 then
		slot4 = true
	end

	if slot0:checkTalentTabShow(slot0.select_hero_vo.star) ~= slot2 then
		slot4 = true

		if uv0:isOpenTanlentByHerovo(slot0.select_hero_vo) and not slot0.select_hero_vo:ishaveTalentData() then
			uv1:sender11099({
				{
					partner_id = slot0.select_hero_vo.partner_id
				}
			})
		end
	end

	if slot0:checkHolyequipmentTabShow() ~= slot3 then
		slot4 = true
	end

	if slot0.record_cur_star and slot0.record_cur_star < slot0.select_hero_vo.star then
		slot4 = true
		slot0.record_cur_star = slot0.select_hero_vo.star

		if slot0.select_hero_vo.star == uv0.hero_info_upgrade_star_param4 + 1 then
			slot0.is_hide_talent_Item = true
		end
	end

	if slot0.is_check_tab then
		slot4 = true
		slot0.is_check_tab = nil
	end

	if slot4 then
		slot0:updatePageInfo()
	end
end

function HeroMainInfoWindow.setLock(slot0)
	slot1 = nil
	slot1 = (not slot0.select_hero_vo.dic_locks[HeroConst.LockType.eHeroLock] or slot0.select_hero_vo.dic_locks[HeroConst.LockType.eHeroLock] ~= 1 or PathTool.getResFrame("hero", "hero_info_5")) and PathTool.getResFrame("hero", "hero_info_6")

	if slot0.lock_record_res == nil or slot0.lock_record_res ~= slot1 then
		slot0.lock_record_res = slot1

		loadSpriteTexture(slot0.lock_btn_icon, slot1, LOADTEXT_TYPE_PLIST)
	end
end

function HeroMainInfoWindow.updatePageRedPoint(slot0)
	if slot0.show_model_type == HeroConst.BagTab.eBagHero then
		for slot4, slot5 in ipairs(slot0.tab_list) do
			if slot5 and not slot5.is_hide then
				if slot0.cur_tab_index == slot4 then
					slot5.red_point:setVisible(false)
				else
					slot6 = nil

					if slot5.type == HeroConst.MainInfoTab.eMainTrain then
						slot6 = HeroCalculate.checkSingleHeroLevelUpRedPoint(slot0.select_hero_vo)
					elseif slot5.type == HeroConst.MainInfoTab.eMainUpgradeStar then
						slot6 = HeroCalculate.checkSingleHeroUpgradeStarRedPoint(slot0.select_hero_vo)
					elseif slot5.type == HeroConst.MainInfoTab.eMainTalent then
						slot6 = HeroCalculate.checkSingleHeroTalentSkillRedPoint(slot0.select_hero_vo)
					elseif slot5.type == HeroConst.MainInfoTab.eMainHolyequipment then
						slot6 = HeroCalculate.checkSingleHeroHolyEquipmentRedPoint(slot0.select_hero_vo)
					end

					slot5.red_point:setVisible(slot6)
				end
			end
		end
	end
end

function HeroMainInfoWindow.updatePower(slot0)
	slot0.fight_label:setNum(slot0.select_hero_vo.power)
end

function HeroMainInfoWindow.createStar(slot0, slot1)
	slot0.star_setting = uv0:createStar(slot1 or 0, slot0.star_node, slot0.star_setting, 26)
end

function HeroMainInfoWindow.updateSpine(slot0, slot1, slot2)
	if slot0.record_spine_bid and slot0.record_spine_bid == slot1.bid and slot0.record_spine_star and slot0.record_spine_star == slot1.star and slot0.record_spine_skin and slot0.record_spine_skin == slot1.use_skin then
		if slot2 and slot0.spine then
			slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.FadeIn:create(0.2)))
		end

		return
	end

	slot0.record_spine_bid = slot1.bid
	slot0.record_spine_star = slot1.star
	slot0.record_spine_skin = slot1.use_skin

	function slot3()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.partner, uv1, nil, {
				skin_id = uv1.use_skin
			})

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, -240))
			uv0.spine:setAnchorPoint(cc.p(0, 0))
			uv0.mode_node:addChild(uv0.spine)

			if uv0.select_hero_vo.use_skin ~= 0 and Config.PartnerSkinData.data_skin_info[uv0.select_hero_vo.use_skin] and slot0.hero_camp_res == "null" then
				uv0.spine:showShadowUI(false)
			end

			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot0.spine then
		slot0.can_click_btn = false

		slot0.spine:setCascade(true)
		slot0.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil
			uv0.can_click_btn = true

			uv1()
		end)))
	else
		slot3()
	end
end

function HeroMainInfoWindow.close_callback(slot0)
	if slot0.hero_music ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.hero_music)
	end

	GlobalEvent:getInstance():Fire(MainuiEvent.HEAD_UPDATE_WEALTH_EVENT, 2, Config.ItemData.data_assets_label2id.gold)

	if slot0.spine then
		slot0.spine:DeleteMe()

		slot0.spine = nil
	end

	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.view_list = nil

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.item_load_camp then
		slot0.item_load_camp:DeleteMe()
	end

	slot0.item_load_camp = nil

	if slot0.fight_label then
		slot0.fight_label:DeleteMe()
	end

	slot0.fight_label = nil

	slot0:showLevelUpEffect(false)

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:UnBind(slot0.role_lev_event)
		slot0.role_lev_event = nil
	end

	MainuiController:getInstance():setMainUIShowStatus(true)
	uv0:openHeroMainInfoWindow(false)
end
