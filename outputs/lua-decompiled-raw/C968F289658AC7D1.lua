HeroExpeditLevel = HeroExpeditLevel or BaseClass(BaseView)
slot0 = HeroExpeditController:getInstance()
slot1 = Config.ExpeditionData.data_sign_info

function HeroExpeditLevel.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "heroexpedit/level_message"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.reward_list = {}
end

function HeroExpeditLevel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.text_level_msg = slot0.main_container:getChildByName("Image_6"):getChildByName("Text_7")

	slot0.text_level_msg:setString("")
	slot0.main_container:getChildByName("reward"):getChildByName("Text_17_0"):setString(TI18N("奖励"))

	slot0.reward_panel = slot0.main_container:getChildByName("reward"):getChildByName("reward_panel")

	slot0.main_container:getChildByName("enemy"):getChildByName("Text_17"):setString(TI18N("敌方阵容"))

	slot0.enemy_panel = slot0.main_container:getChildByName("enemy"):getChildByName("enemy_panel")
	slot0.btn_fight = slot0.main_container:getChildByName("btn_fight")
	slot0.btn_fight_label = slot0.btn_fight:getChildByName("Text_6")

	slot0.btn_fight_label:setString(TI18N("战斗"))

	slot0.btn_video = slot0.main_container:getChildByName("btn_video")
	slot0.text_name = slot0.main_container:getChildByName("text_name")
	slot0.text_fight_power = slot0.main_container:getChildByName("text_fight_power")
end

function HeroExpeditLevel.fightMessage(slot0, slot1)
	slot0.cur_grard_id = slot1.id

	slot0.text_level_msg:setString(TI18N("第") .. uv0[slot1.id].floor .. TI18N("关"))

	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.my_head:setPosition(cc.p(166, 541))
	slot0.main_container:addChild(slot0.my_head)
	slot0.my_head:setHeadRes(slot1.face)
	slot0.my_head:setLev(slot1.lev)
	slot0.text_name:setString(slot1.name)
	slot0.text_fight_power:setString(slot1.power)

	if slot1.status == 2 then
		setChildUnEnabled(true, slot0.btn_fight)
		slot0.btn_fight_label:setTextColor(cc.c4b(255, 255, 4080, 255))
		slot0.btn_fight_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_fight:setTouchEnabled(false)
	end

	if slot1.rewards then
		slot3 = {}
		slot3 = (tableLen(slot1.rewards) ~= 2 or {
			108,
			365
		}) and {
			108,
			238,
			365
		}

		for slot7 = 1, slot2 do
			if not slot0.reward_list[slot7] then
				slot0.reward_list[slot7] = BackPackItem.new(nil, true, nil, 0.9)

				slot0.reward_list[slot7]:setAnchorPoint(0, 0.5)
				slot0.reward_panel:addChild(slot0.reward_list[slot7])
			end

			if slot0.reward_list[slot7] then
				slot0.reward_list[slot7]:setPosition(cc.p(slot3[slot7], 55))

				if slot1.rewards[slot7].bid == 25 and slot1.is_holiday == 1 then
					slot0.reward_list[slot7]:holidHeroExpeditTag(true, TI18N("限时提升"))
				else
					slot0.reward_list[slot7]:holidHeroExpeditTag(false)
				end

				slot0.reward_list[slot7]:setDefaultTip()
				slot0.reward_list[slot7]:setBaseData(slot1.rewards[slot7].bid, slot1.rewards[slot7].num)
			end
		end
	end

	slot8 = ScrollViewDir.horizontal
	slot0.enemy_list = CommonScrollViewLayout.new(slot0.enemy_panel, cc.p(-5, 10), slot8, ScrollViewStartPos.top, slot0.enemy_panel:getContentSize(), {
		start_y = 4,
		item_width = 119,
		start_x = 0,
		space_x = 0,
		row = 1,
		item_height = 119,
		space_y = 0,
		col = 1,
		item_class = HeroExhibitionItem
	})
	slot7 = false

	slot0.enemy_list:setClickEnabled(slot7)

	for slot7, slot8 in pairs(slot1.guards) do
		slot8.blood = slot8.hp_per
	end

	slot0.enemy_list:setData(slot1.guards, nil, , {
		scale = 0.8,
		can_click = false,
		from_type = HeroConst.ExhibitionItemType.eExpeditFight
	})
end

function HeroExpeditLevel.register_event(slot0)
	slot0:addGlobalEvent(HeroExpeditEvent.levelMessageEvent, function (slot0)
		if not slot0 then
			return
		end

		uv0:fightMessage(slot0)
	end)
	registerButtonEventListener(slot0.btn_fight, function ()
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Expedit_Fight)
		uv0:openHeroExpeditLevelView(false)
	end, true, 1)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroExpeditLevelView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_video, function ()
		if uv0.cur_grard_id then
			uv1:openHeroexpeditVideoView(true, uv0.cur_grard_id)
			uv1:openHeroExpeditLevelView(false)
		end
	end, true)
end

function HeroExpeditLevel.openRootWnd(slot0)
	uv0:sender24409()
end

function HeroExpeditLevel.close_callback(slot0)
	if slot0.reward_list and next(slot0.reward_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.reward_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.my_head then
		slot0.my_head:DeleteMe()

		slot0.my_head = nil
	end

	if slot0.enemy_list then
		slot0.enemy_list:DeleteMe()

		slot0.enemy_list = nil
	end

	uv0:openHeroExpeditLevelView(false)
end
