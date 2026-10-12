SkillUnlockWindow = SkillUnlockWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()

function SkillUnlockWindow.__init(slot0, slot1, slot2)
	slot0.is_full_screen = false
	slot0.layout_name = "hero/skill_unlock"
	slot0.res_list = {}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.skill_bid = slot1 or 0
	slot0.setting = slot2 or {}
	slot0.show_type = slot0.setting.show_type or 1
	slot0.is_can_close = false
end

function SkillUnlockWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0.main_panel:setTouchEnabled(false)

	slot0.title_panel = slot0.main_panel:getChildByName("title_panel")
	slot0.title = slot0.title_panel:getChildByName("title")

	slot0:createDesc()
	slot0:updateDesc()
end

function SkillUnlockWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.is_can_close == true then
				uv1:openSkillUnlockWindow(false)
			end
		end
	end)
end

function SkillUnlockWindow.createDesc(slot0)
	slot1 = slot0.main_panel:getContentSize()
	slot0.head_icon = SkillItem.new(true)

	slot0.head_icon:setPosition(cc.p(slot1.width / 2, 530))
	slot0.head_icon:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_panel:addChild(slot0.head_icon)

	slot0.star_name = createLabel(26, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot1.width / 2, 430, "", slot0.main_panel, 2, cc.p(0.5, 0))
	slot0.star_desc = createRichLabel(20, cc.c4b(255, 215, 155, 255), cc.p(0.5, 1), cc.p(slot1.width / 2, 415), nil, , 570)

	slot0.main_panel:addChild(slot0.star_desc)
end

function SkillUnlockWindow.updateDesc(slot0)
	delayOnce(function ()
		uv0.is_can_close = true
	end, 1)

	if slot0.show_type == 1 then
		if slot0.skill_bid == 0 then
			return
		end

		slot0.title_bg_load = loadSpriteTextureFromCDN(slot0.title, PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_19"), ResourcesType.single, slot0.title_bg_load)

		if not Config.SkillData.data_get_skill(slot0.skill_bid) then
			return
		end

		slot0.star_desc:setString(string.format("<div outline=2,#000000>%s</div>", slot2.des or ""))
		slot0.star_name:setString(slot2.name or "")
		slot0.head_icon:setData(slot2)
	elseif slot0.show_type == 2 then
		slot0.star_name:setString(TI18N("觉醒天赋栏"))
		slot0.star_desc:setString(TI18N("<div outline=2,#000000>已解锁13星专属天赋栏，可学习13星专属职业天赋</div>"))

		if slot0.head_icon and slot0.head_icon.item_icon then
			slot0.head_icon.item_icon:setVisible(true)
			loadSpriteTexture(slot0.head_icon.item_icon, PathTool.checkRes("resource/bigbg/hero/talent_pos.png"), LOADTEXT_TYPE)
		end

		slot0.title_bg_load = loadSpriteTextureFromCDN(slot0.title, PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_unlock_talent_bg"), ResourcesType.single, slot0.title_bg_load)
	end
end

function SkillUnlockWindow.openRootWnd(slot0)
	playOtherSound("c_get")
	slot0:handleEffect(true)
end

function SkillUnlockWindow.setPanelData(slot0)
end

function SkillUnlockWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	else
		slot2 = slot0.main_panel:getContentSize()

		if not tolua.isnull(slot0.main_panel) and slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(PathTool.getEffectRes(145), cc.p(slot2.width * 0.5, slot2.height * 0.5 + 40), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_panel:addChild(slot0.play_effect, -1)
		end
	end
end

function SkillUnlockWindow.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.bottom_head then
		slot0.bottom_head:DeleteMe()

		slot0.bottom_head = nil
	end

	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	if slot0.title_bg_load then
		slot0.title_bg_load:DeleteMe()

		slot0.title_bg_load = nil
	end

	GlobalEvent:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)
	uv0:openSkillUnlockWindow(false)
end
