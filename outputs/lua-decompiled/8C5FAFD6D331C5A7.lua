InfinitePartnerSummonView = InfinitePartnerSummonView or BaseClass(BaseView)
slot1 = NewPartnersummonController:getInstance():getModel()

function InfinitePartnerSummonView.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
	slot0.role_list = {}
	slot0.win_type = WinType.Full
	slot0.is_action_ing = false
	slot0.is_call = slot1 or TRUE
	slot0.single_status = 0
	slot0.is_show_item = false
	slot0.is_show_title = false
	slot0.is_use_csb = false
	slot0.point_list = {}
	slot0.cur_show_card = nil
	slot0.skill_item_list = {}
	slot0.role_spine_list = {}
	slot0.is_show_hero = false
	slot0.music_info = AudioManager:getInstance():getMusicInfo()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("partnersummon", "partnersummon"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_18"),
			type = ResourcesType.single
		}
	}
	slot0.config_data = Config.RecruitData.data_partnersummon_data
end

function InfinitePartnerSummonView.createRootWnd(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:setContentSize(slot0.size)
	showLayoutRect(slot0.root_wnd, 255)
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action2")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "result_01")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_get")

	slot0.source_container = ccui.Layout:create()

	slot0.source_container:setTouchEnabled(true)
	slot0.source_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.source_container:setOpacity(255)
	slot0.source_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.source_container:setCascadeOpacityEnabled(true)
	slot0.source_container:setScale(display.getMaxScale())
	slot0.source_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.source_container)

	slot0.draw_container = ccui.Layout:create()

	slot0.draw_container:setTouchEnabled(false)
	slot0.draw_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.draw_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.draw_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.draw_container)

	slot0.image_bg = createSprite(nil, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, slot0.source_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.image_bg:setVisible(false)
	slot0.image_bg:setScale(display.getMaxScale())

	slot0.image_top_bg = createScale9Sprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 55, LOADTEXT_TYPE, slot0.source_container)

	slot0.image_top_bg:setAnchorPoint(cc.p(0.5, 0))
	slot0.image_top_bg:setVisible(false)
	slot0.image_top_bg:setContentSize(cc.size(SCREEN_WIDTH + 100, 220))

	slot2 = createSprite(PathTool.getResFrame("partnersummon", "partnersummon_line"), slot0.image_top_bg:getContentSize().width / 2, slot0.image_top_bg:getContentSize().height - 5, image_top_bg, cc.p(0, 0.5), LOADTEXT_PLIST)

	createSprite(PathTool.getResFrame("partnersummon", "partnersummon_line"), slot0.image_top_bg:getContentSize().width / 2, slot0.image_top_bg:getContentSize().height - 5, image_top_bg, cc.p(0, 0.5), LOADTEXT_PLIST):setScaleX(-1)

	slot0.image_bottom_bg = createScale9Sprite(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_12"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 55, LOADTEXT_TYPE, slot0.source_container)

	slot0.image_bottom_bg:setContentSize(cc.size(SCREEN_WIDTH + 100, 220))
	slot0.image_bottom_bg:setScaleY(-1)
	slot0.image_bottom_bg:setVisible(false)
	slot0.image_bottom_bg:setAnchorPoint(cc.p(0.5, 0))

	slot0.title_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_18"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 525, slot0.source_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.title_bg:setVisible(false)
	slot0.title_bg:setScale(1)

	slot0.item_container = ccui.Layout:create()

	slot0.item_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.item_container:setOpacity(255)
	slot0.item_container:setContentSize(cc.size(SCREEN_WIDTH, 440))
	slot0.item_container:setCascadeOpacityEnabled(true)
	slot0.item_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.item_container:setVisible(false)
	slot0.root_wnd:addChild(slot0.item_container)

	slot0.left_container = ccui.Layout:create()

	slot0.left_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.left_container:setOpacity(0)
	slot0.left_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.left_container:setCascadeOpacityEnabled(true)
	slot0.left_container:setPosition(cc.p(-slot0.size.width, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.left_container)

	slot0.right_container = ccui.Layout:create()

	slot0.right_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.right_container:setOpacity(0)
	slot0.right_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.right_container:setCascadeOpacityEnabled(true)
	slot0.right_container:setPosition(cc.p(slot0.size.width, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.right_container)

	slot0.effect_container = ccui.Layout:create()

	slot0.effect_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.effect_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.effect_container:setCascadeOpacityEnabled(true)
	slot0.effect_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.effect_container, 99)

	slot0.first_container = ccui.Layout:create()

	slot0.first_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.first_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.first_container:setCascadeOpacityEnabled(true)
	slot0.first_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.first_container, 99)

	slot0.btn_container = ccui.Layout:create()

	slot0.btn_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.btn_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.btn_container:setCascadeOpacityEnabled(true)
	slot0.btn_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.btn_container:setVisible(false)
	slot0.root_wnd:addChild(slot0.btn_container, 99)

	slot0.new_desc_container = ccui.Layout:create()

	slot0.new_desc_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.new_desc_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.new_desc_container:setCascadeOpacityEnabled(true)
	slot0.new_desc_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.new_desc_container, 99)

	slot0.comfirm_next_btn = createButton(slot0.btn_container, TI18N("确定"), 555, 120, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn"), 24)

	slot0.comfirm_next_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#020019>确定</div>"))

	if slot0.comfirm_next_btn then
		slot0.comfirm_next_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openInfiniteSummonWindow(false)
			end
		end)
	end

	if slot0.is_call == TRUE then
		slot3 = ccui.CheckBox:create(PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1043"), PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1043"), LOADTEXT_TYPE_PLIST)

		slot3:setTouchEnabled(true)
		slot3:setPosition(90, 20)
		slot3:setContentSize(cc.size(64, 64))

		slot4 = createLabel(22, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), 50, 20, "跳过召唤动画", slot3, 2, cc.p(0, 0.5))

		slot0.item_container:addChild(slot3)
		slot3:setSelectedState(false)

		if uv0.is_skip_animation == true then
			slot3:setSelectedState(true)
		end

		slot3:addEventListener(function (slot0, slot1)
			if slot1 == ccui.CheckBoxEventType.selected then
				uv0.is_skip_animation = true
			elseif slot1 == ccui.CheckBoxEventType.unselected then
				uv0.is_skip_animation = false
			end
		end)

		slot0.again_btn = createButton(slot0.item_container, TI18N("再抽一次"), 165, -55, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn_2"))

		slot0.again_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=30 outline=2,#020019>再抽一次</div>"))

		slot0.item_label = createRichLabel(32, 1, cc.p(0.5, 0.5), cc.p(110, 100), 0, 0, 500)

		slot0.item_label:setString("")
		slot0.again_btn:addChild(slot0.item_label)

		slot0.comfirm_btn = createButton(slot0.item_container, TI18N("确定"), 560, -55, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn"))

		slot0.comfirm_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=30 outline=2,#020019>保存结果</div>"))
		slot0.comfirm_btn:getButton():setName("guildsign_summon_comfirm_btn")
	end

	slot0:resgiter_event()
end

function InfinitePartnerSummonView.gePartner_bidsByItemBaseID(slot0, slot1)
	slot3 = nil
	slot4 = {}

	for slot8, slot9 in pairs(Config.PartnerData.data_partner_base) do
		if slot9.item_id == slot1.base_id then
			slot3 = slot9
			slot4 = {
				partner_bid = slot3.bid,
				init_star = slot3.init_star
			}
		end
	end

	table.insert(slot0.partner_bids, slot4)

	return slot4
end

function InfinitePartnerSummonView.openRootWnd(slot0, slot1, slot2)
	BattleResultMgr:getInstance():setWaitShowPanel(true)

	slot0.tiems = slot1.times
	slot0.group_id = slot1.group_id or 0
	slot0.reward_list = slot1.rewards
	slot0.partner_chips = slot1.partner_chips
	slot0.type_flag = slot1.flag or 0
	slot0.floor_action, slot0.light_action = TimesummonController:getInstance():getModel():getEffectAction(slot1.rewards)
	slot0.partner_bids = {}

	for slot6, slot7 in pairs(slot0.reward_list) do
		slot0:gePartner_bidsByItemBaseID(slot7)
	end

	if slot0.type_flag == 0 then
		slot0.config_data = Config.RecruitData.data_partnersummon_data
	elseif slot0.type_flag == 1 then
		slot0.config_data = Config.RecruitHolidayData.data_summon
	elseif slot0.type_flag == 2 then
		slot0.config_data = Config.RecruitHolidayEliteData.data_summon
	elseif slot0.type_flag == 3 then
		slot0.config_data = Config.RecruitHolidayLuckyData.data_summon
	end

	slot0.again_btn:setVisible(true)
	slot0.comfirm_btn:setPosition(cc.p(560, -55))

	slot0.bg_res_id = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_300", true)
	slot0.resources_bg_load = loadSpriteTextureFromCDN(slot0.image_bg, slot0.bg_res_id, ResourcesType.single, slot0.resources_bg_load)

	slot0:callAction(slot1)
end

function InfinitePartnerSummonView.callAction(slot0, slot1)
	slot0.role_list = {}
	slot2 = false
	slot0.is_action_ing = true

	for slot6, slot7 in ipairs(slot0.partner_bids) do
		if deepCopy(Config.PartnerData.data_partner_base[slot7.partner_bid]) then
			slot8.star = slot7.init_star

			if slot8.star >= 4 then
				print(slot8.name)

				if slot8.voice ~= "" then
					AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.DUBBING, slot8.voice)
				end

				table.insert(slot0.role_list, slot8)
			end
		end
	end

	slot0:updateEffectAction()
end

function InfinitePartnerSummonView.updateEffectAction(slot0)
	slot0.recuit_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action", false)

	if uv0.is_skip_animation == false then
		slot0.third_effect_spine = slot0:playEffect(Config.EffectData.data_effect_info[9120], "action", 350, 350, 99, slot0.first_container)

		slot0.third_effect_spine:setAnchorPoint(cc.p(0, 0))
		slot0.third_effect_spine:setScale(1)

		slot0.first_effect_spine = slot0:playEffect(Config.EffectData.data_effect_info[120], "action", 350, 620, 99, slot0.first_container)

		slot0.first_effect_spine:setAnchorPoint(cc.p(0, 0))
		slot0.first_effect_spine:setScale(1)
		slot0.first_effect_spine:registerSpineEventHandler(function (slot0)
			if slot0.eventData.name == "appear" then
				if uv0.first_effect_spine then
					uv0.first_effect_spine:runAction(cc.RemoveSelf:create(true))

					uv0.first_effect_spine = nil
				end

				if uv0.third_effect_spine then
					uv0.third_effect_spine:runAction(cc.RemoveSelf:create(true))

					uv0.third_effect_spine = nil
				end

				uv0.image_bg:setVisible(true)

				if not uv0.is_show_item then
					if next(uv0.role_list or {}) == nil and uv0.is_call == TRUE then
						uv0:updateItemData(uv0.reward_list)
					else
						uv0:showHeroDetailInfo()
					end
				end
			end
		end, sp.EventType.ANIMATION_EVENT)
	else
		slot0.image_bg:setVisible(true)

		if not slot0.is_show_item then
			slot0:updateItemData(slot0.reward_list)
		end
	end
end

function InfinitePartnerSummonView.handleTimeSummonEffect(slot0, slot1)
	if slot1 == true then
		slot0:handleFloorEffect(true)
		slot0:handleLightEffect(true)

		if not slot0.time_summon_bg then
			slot0.time_summon_bg = createSprite(nil, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, slot0.first_container, cc.p(0.5, 0.5), LOADTEXT_TYPE, 99)

			slot0.time_summon_bg:setScale(display.getMaxScale())

			slot2 = "timesummon_bg"

			if slot0.group_id then
				if slot0.type_flag == 3 then
					slot2 = EliteSummonController:getInstance():getModel():getSummonBg()
				elseif Config.RecruitHolidayEliteData.data_summon and slot3[slot0.group_id] and slot3[slot0.group_id].call_bg_card and slot3[slot0.group_id].call_bg_card ~= "" then
					slot2 = slot3[slot0.group_id].call_bg_card
				end
			end

			slot0.summon_bg_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/timesummon", slot2, true), ResourcesType.single, function ()
				if not tolua.isnull(uv0.time_summon_bg) and PathTool.isFileExist(uv1) then
					loadSpriteTexture(uv0.time_summon_bg, uv1, LOADTEXT_TYPE)
				end
			end, slot0.summon_bg_load)
		end

		slot0.time_summon_bg:setVisible(true)
	else
		slot0:handleFloorEffect(false)
		slot0:handleLightEffect(false)
		slot0:handleBookEffect(false)

		if slot0.time_summon_bg then
			slot0.time_summon_bg:setVisible(false)
		end
	end
end

function InfinitePartnerSummonView.handleFloorEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.first_container) and slot0.floor_effect == nil then
			slot0.floor_effect = createEffectSpine(Config.EffectData.data_effect_info[671], cc.p(SCREEN_WIDTH / 2, 370), cc.p(0.5, 0.5), false, slot0.floor_action or PlayerAction.action_1)

			slot0.first_container:addChild(slot0.floor_effect, 100)
			slot0.floor_effect:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					uv0:handleBookEffect(true)
				end
			end, sp.EventType.ANIMATION_EVENT)
		end
	elseif slot0.floor_effect then
		slot0.floor_effect:clearTracks()
		slot0.floor_effect:removeFromParent()

		slot0.floor_effect = nil
	end
end

function InfinitePartnerSummonView.handleLightEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.first_container) and slot0.light_effect == nil then
			slot0.light_effect = createEffectSpine(Config.EffectData.data_effect_info[670], cc.p(SCREEN_WIDTH / 2, 400), cc.p(0.5, 0.5), false, slot0.light_action or PlayerAction.action_1, function (slot0)
				uv0.image_bg:setVisible(true)

				if uv0.time_summon_bg then
					uv0.time_summon_bg:setVisible(false)
				end

				if not uv0.is_show_item then
					if next(uv0.role_list or {}) == nil and uv0.is_call == TRUE then
						uv0:updateItemData(uv0.reward_list)
					else
						uv0:showHeroDetailInfo()
					end
				end
			end)

			slot0.first_container:addChild(slot0.light_effect, 102)
		end
	elseif slot0.light_effect then
		slot0.light_effect:clearTracks()
		slot0.light_effect:removeFromParent()

		slot0.light_effect = nil
	end
end

function InfinitePartnerSummonView.handleBookEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.first_container) and slot0.book_effect == nil then
			slot0.book_effect = createEffectSpine(Config.EffectData.data_effect_info[672], cc.p(SCREEN_WIDTH / 2, 400), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.first_container:addChild(slot0.book_effect, 101)
		end
	elseif slot0.book_effect then
		slot0.book_effect:clearTracks()
		slot0.book_effect:removeFromParent()

		slot0.book_effect = nil
	end
end

function InfinitePartnerSummonView.showHeroDetailInfo(slot0)
	slot0:showRareEffect(false)

	if table.remove(slot0.role_list, 1) then
		slot0.cur_show_hero_cfg = slot1

		if not slot0.hero_info_node then
			slot0:createHeroInfoNode()
		end

		slot0.cur_hero_is_five_star = slot1.star >= 5

		slot0:showDrawEffect3(false)
		slot0:showDrawEffect4(false)

		if slot0.cur_hero_is_five_star then
			slot0:showDrawEffect1(false)
			slot0:showDrawEffect2(false)
		else
			slot0:showDrawEffect1(true)
			slot0:showDrawEffect2(true)
			slot0:showDrawEffect4(true)
		end

		if slot0.star_effect then
			slot0.star_effect:setVisible(false)
		end

		slot0.hero_name_txt:setString(slot1.name)
		loadSpriteTexture(slot0.hero_camp_sp, PathTool.getHeroCampTypeIcon(slot1.camp_type), LOADTEXT_TYPE_PLIST)

		slot9 = 360 - slot0.hero_name_txt:getContentSize().width * 0.5 - 25

		slot0.hero_camp_sp:setPosition(cc.p(slot9, 1195))

		slot0.is_show_new = false

		for slot8, slot9 in pairs(slot0.role_list) do
			if slot9.bid == slot1.bid then
				slot4 = HeroController:getInstance():getModel():getHeroNumByBid(slot1.bid) - 1
			end
		end

		if slot4 <= 1 then
			slot0.is_show_new = true
		end

		slot5 = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_300", true)

		if slot1.star >= 5 then
			slot5 = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_400", true)

			slot0.hero_type_txt:setTextColor(cc.c4b(250, 235, 173, 255))
			slot0.hero_share_btn:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_12_s"), LOADTEXT_TYPE_PLIST)
			slot0.hero_share_btn_label:enableOutline(PartnersummonConst.Outline_Color_1, 2)
			slot0.hero_comment_btn:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_14_s"), LOADTEXT_TYPE_PLIST)
			slot0.hero_comment_btn_label:enableOutline(PartnersummonConst.Outline_Color_1, 2)
			slot0.hero_skill_btn:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_9_s"), LOADTEXT_TYPE_PLIST)
			slot0.hero_skill_btn_label:enableOutline(PartnersummonConst.Outline_Color_1, 2)
			slot0.hero_type_bg:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_10_s"), LOADTEXT_TYPE_PLIST)
			slot0.hero_line:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_13_s"), LOADTEXT_TYPE_PLIST)
			slot0.hero_desc_bg:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_15_s"), LOADTEXT_TYPE_PLIST)
			loadSpriteTexture(slot0.hero_share_desc_sp, PathTool.getResFrame("partnersummon", "txt_cn_partnersummon_share_s"), LOADTEXT_TYPE_PLIST)
		else
			slot0.hero_type_txt:setTextColor(cc.c4b(35, 76, 107, 255))
			slot0.hero_share_btn:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_12"), LOADTEXT_TYPE_PLIST)
			slot0.hero_share_btn_label:enableOutline(PartnersummonConst.Outline_Color_2, 2)
			slot0.hero_comment_btn:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_14"), LOADTEXT_TYPE_PLIST)
			slot0.hero_comment_btn_label:enableOutline(PartnersummonConst.Outline_Color_2, 2)
			slot0.hero_skill_btn:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_9"), LOADTEXT_TYPE_PLIST)
			slot0.hero_skill_btn_label:enableOutline(PartnersummonConst.Outline_Color_2, 2)
			slot0.hero_type_bg:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_10"), LOADTEXT_TYPE_PLIST)
			slot0.hero_line:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_13"), LOADTEXT_TYPE_PLIST)
			slot0.hero_desc_bg:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_image_15"), LOADTEXT_TYPE_PLIST)
			loadSpriteTexture(slot0.hero_share_desc_sp, PathTool.getResFrame("partnersummon", "txt_cn_partnersummon_share"), LOADTEXT_TYPE_PLIST)
		end

		slot0.hero_line:setCapInsets(cc.rect(30, 8, 1, 1))

		if not slot0.bg_res_id or slot0.bg_res_id ~= slot5 then
			slot0.bg_res_id = slot5
			slot0.resources_bg_load = loadSpriteTextureFromCDN(slot0.image_bg, slot0.bg_res_id, ResourcesType.single, slot0.resources_bg_load)
		end

		if slot1.draw_res ~= "" then
			if slot0.hero_spine then
				slot0.hero_spine:removeFromParent()

				slot0.hero_spine = nil
			end

			slot0.hero_spine = BaseRole.new(BaseRole.type.partner, slot1, nil, nil)

			slot0.hero_spine:setAnimation(0, PlayerAction.show, true)
			slot0.hero_spine:setCascade(true)
			slot0.hero_spine:setPosition(cc.p(360, 575))
			slot0.hero_spine:setAnchorPoint(cc.p(0, 0))
			slot0.hero_spine:setScale(1.2)
			slot0.hero_info_node:addChild(slot0.hero_spine)
		end

		if slot1.star >= 5 then
			slot6 = "txt_cn_partnersummon_type_" .. slot1.type .. "_s"
		end

		loadSpriteTexture(slot0.hero_type_sp, PathTool.getResFrame("partnersummon", slot6))
		slot0.hero_type_txt:setString(slot1.hero_pos or "")

		slot0.hero_draw_scale = 1

		if slot1.draw_scale then
			slot0.hero_draw_scale = slot1.draw_scale / 100
		end

		if slot1.draw_offset then
			slot0.hero_draw_sp:setPosition(cc.p(slot1.draw_offset[1] or 0, slot1.draw_offset[2] or 0))
		end

		slot0.hero_draw_sp:stopAllActions()

		if Config.PartnerData.data_partner_library(slot1.bid) then
			slot0.hero_desc_txt:setString(TI18N(slot8.voice_str))
		end

		slot0.hero_info_node:setVisible(false)

		slot0.is_show_enter_ani = true

		if slot1.star >= 5 then
			slot0:handleHigherFlickerEffect(true)
		else
			slot0:handleFlickerEffect(true, PlayerAction.action_1)
		end

		slot0:hideItemContainer()
	else
		slot0:updateItemData(slot0.reward_list)
	end
end

function InfinitePartnerSummonView.showDrawEffect1(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.source_container) and slot0.draw_effect_1 == nil then
			slot0.draw_effect_1 = createEffectSpine(Config.EffectData.data_effect_info[1313], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0.source_container:addChild(slot0.draw_effect_1)
		end
	elseif slot0.draw_effect_1 then
		slot0.draw_effect_1:clearTracks()
		slot0.draw_effect_1:removeFromParent()

		slot0.draw_effect_1 = nil
	end
end

function InfinitePartnerSummonView.showDrawEffect2(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.source_container) and slot0.draw_effect_2 == nil then
			slot0.draw_effect_2 = createEffectSpine(Config.EffectData.data_effect_info[1313], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.source_container:addChild(slot0.draw_effect_2)
		end
	elseif slot0.draw_effect_2 then
		slot0.draw_effect_2:clearTracks()
		slot0.draw_effect_2:removeFromParent()

		slot0.draw_effect_2 = nil
	end
end

function InfinitePartnerSummonView.showDrawEffect3(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.source_container) and slot0.draw_effect_3 == nil then
			slot0.draw_effect_3 = createEffectSpine(Config.EffectData.data_effect_info[1317], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_2)

			slot0.source_container:addChild(slot0.draw_effect_3)
		elseif slot0.draw_effect_3 then
			slot0.draw_effect_3:setToSetupPose()
			slot0.draw_effect_3:setAnimation(0, PlayerAction.action_2, true)
		end
	elseif slot0.draw_effect_3 then
		slot0.draw_effect_3:clearTracks()
		slot0.draw_effect_3:removeFromParent()

		slot0.draw_effect_3 = nil
	end
end

function InfinitePartnerSummonView.showDrawEffect4(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.draw_effect_4 == nil then
			slot0.draw_effect_4 = createEffectSpine(Config.EffectData.data_effect_info[1313], cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), true, PlayerAction.action_3)

			slot0.draw_container:addChild(slot0.draw_effect_4, 1)
		end
	elseif slot0.draw_effect_4 then
		slot0.draw_effect_4:clearTracks()
		slot0.draw_effect_4:removeFromParent()

		slot0.draw_effect_4 = nil
	end
end

function InfinitePartnerSummonView.quickShowHeroInfo(slot0)
	slot0.hero_draw_sp:stopAllActions()
	slot0.hero_draw_sp:setOpacity(255)
	slot0.hero_draw_sp:setScale(slot0.hero_draw_scale)
	slot0.hero_comment_btn:stopAllActions()
	slot0.hero_comment_btn:setOpacity(255)
	slot0.hero_comment_btn:setScale(1)
	slot0.hero_share_btn:stopAllActions()
	slot0.hero_share_btn:setOpacity(255)
	slot0.hero_share_btn:setScale(1)
	slot0.hero_camp_sp:stopAllActions()
	slot0.hero_camp_sp:setOpacity(255)
	slot0.hero_camp_sp:setPosition(cc.p(360 - slot0.hero_name_txt:getContentSize().width * 0.5 - 25, 1200))
	slot0.hero_name_txt:stopAllActions()
	slot0.hero_name_txt:setOpacity(255)
	slot0.hero_name_txt:setPosition(cc.p(360, 1200))
	slot0.hero_type_bg:stopAllActions()
	slot0.hero_type_bg:setPosition(cc.p(81, 350))
	slot0.hero_desc_bg:stopAllActions()
	slot0.hero_desc_bg:setScale(1)
	slot0.hero_desc_bg:setOpacity(255)
	slot0.hero_desc_bg:setPosition(cc.p(360, 232))
	slot0.hero_skill_btn:stopAllActions()
	slot0.hero_skill_btn:setPosition(cc.p(390, 80))
	slot0.hero_skill_btn:setOpacity(255)
	slot0.close_tips_sp:stopAllActions()
	slot0.close_tips_sp:setOpacity(255)
	slot0.hero_info_node:setVisible(true)

	if slot0.is_show_new then
		slot0.hero_new_sp:setVisible(true)
	else
		slot0.hero_new_sp:setVisible(false)
	end

	if slot0.cur_show_hero_cfg then
		if Config.PartnerData.data_partner_library(slot0.cur_show_hero_cfg.bid) then
			slot0.hero_desc_txt:setString(TI18N(slot2.voice_str))
		end

		if slot0.cur_show_hero_cfg.voice ~= "" and slot0.quick_show_voice then
			slot0.quick_show_voice = false

			HeroController:getInstance():onPlayHeroVoice(slot0.cur_show_hero_cfg.voice, slot0.cur_show_hero_cfg.voice_time)
		end

		if slot0.cur_show_hero_cfg.rare_flag and slot0.cur_show_hero_cfg.rare_flag == 1 then
			slot0:showRareEffect(true)
		end
	end

	slot0.is_show_enter_ani = false
end

function InfinitePartnerSummonView.createHeroInfoNode(slot0)
	slot0.hero_info_node = createCSBNote(PathTool.getTargetCSB("partnersummon/partnersummon_hero_info"))

	slot0.hero_info_node:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.hero_info_node:setPosition(cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))
	slot0.draw_container:addChild(slot0.hero_info_node)

	slot1 = slot0.hero_info_node:getChildByName("container")

	slot1:setName("guildsign_summon_next_btn")

	slot0.hero_info_container = slot1

	registerButtonEventListener(slot1, function ()
		if uv0.hero_is_show_share then
			return
		end

		if uv0.is_show_enter_ani then
			uv0:quickShowHeroInfo()
		else
			uv0:showHeroDetailInfo()
		end
	end, false)

	slot0.hero_draw_sp = createSprite(nil, 0, 0, slot1:getChildByName("pos_node"), cc.p(0.5, 0.5), LOADTEXT_TYPE)
	slot0.hero_new_sp = slot1:getChildByName("new_sp")

	slot0.hero_new_sp:setVisible(false)

	slot0.hero_line = slot1:getChildByName("line")
	slot0.hero_name_txt = slot1:getChildByName("hero_name_txt")
	slot0.hero_camp_sp = slot1:getChildByName("camp_sp")
	slot0.hero_comment_btn = slot1:getChildByName("comment_btn")
	slot0.hero_comment_btn_label = slot0.hero_comment_btn:getChildByName("label")

	slot0.hero_comment_btn_label:setString(TI18N("评论"))
	UITool.SetTitleColor(slot0.hero_comment_btn_label)

	slot0.hero_share_btn = slot1:getChildByName("share_btn")

	slot0.hero_share_btn:setVisible(false)

	slot0.hero_share_btn_label = slot0.hero_share_btn:getChildByName("label")

	slot0.hero_share_btn_label:setString(TI18N("分享"))
	UITool.SetTitleColor(slot0.hero_share_btn_label)

	slot0.hero_skill_btn = slot1:getChildByName("skill_btn")
	slot0.hero_skill_btn_label = slot0.hero_skill_btn:getChildByName("label")

	slot0.hero_skill_btn_label:setString(TI18N("查看技能"))
	UITool.SetTitleColor(slot0.hero_skill_btn_label)

	slot0.hero_type_bg = slot1:getChildByName("type_bg")
	slot0.hero_type_sp = slot0.hero_type_bg:getChildByName("type_sp")
	slot0.hero_type_txt = slot0.hero_type_bg:getChildByName("type_txt")
	slot0.hero_desc_bg = slot1:getChildByName("desc_bg")
	slot0.hero_desc_txt = slot0.hero_desc_bg:getChildByName("desc_txt")

	slot0.hero_desc_txt:setString("")

	slot0.close_tips_sp = slot1:getChildByName("close_tips_sp")
	slot0.hero_share_bg = slot1:getChildByName("share_bg")
	slot0.hero_share_desc_sp = slot0.hero_share_bg:getChildByName("share_desc_sp")
	slot0.er_wei_ma_sp = slot0.hero_share_bg:getChildByName("er_wei_ma_sp")

	slot0.hero_share_bg:getChildByName("er_wei_ma_title"):setString(TI18N("长按识别二维码"))

	slot0.share_return_btn = slot0.hero_share_bg:getChildByName("share_return_btn")

	slot0.share_return_btn:getChildByName("label"):setString(TI18N("返回"))
	UITool.SetTitleColor(slot0.share_return_btn:getChildByName("label"))

	slot0.share_save_btn = slot0.hero_share_bg:getChildByName("share_save_btn")

	slot0.share_save_btn:getChildByName("label"):setString(TI18N("保存"))
	UITool.SetTitleColor(slot0.share_save_btn:getChildByName("label"))
	registerButtonEventListener(slot0.hero_comment_btn, handler(slot0, slot0.onClickCommentBtn), true)
	registerButtonEventListener(slot0.hero_share_btn, handler(slot0, slot0.onClickShareBtn), true)
	registerButtonEventListener(slot0.hero_skill_btn, handler(slot0, slot0.onClickSkillBtn), true)
	registerButtonEventListener(slot0.share_return_btn, handler(slot0, slot0.onClickShareReturnBtn), true)
	registerButtonEventListener(slot0.share_save_btn, handler(slot0, slot0.onClickShareSaveBtn), true)
end

function InfinitePartnerSummonView.onClickCommentBtn(slot0)
	if slot0.cur_show_hero_cfg then
		PokedexController:getInstance():openCommentWindow(true, slot0.cur_show_hero_cfg)
	end
end

function InfinitePartnerSummonView.onClickShareBtn(slot0)
	if FINAL_CHANNEL == "syios_smzhs" then
		message(TI18N("暂不支持"))

		return
	end

	slot0:showHeroShareLayer(true)
end

function InfinitePartnerSummonView.onClickSkillBtn(slot0)
	if not slot0.cur_show_hero_cfg then
		return
	end

	if Config.PartnerData.data_partner_pokedex[slot0.cur_show_hero_cfg.bid] and slot1[1] then
		HeroController:getInstance():openHeroInfoWindowByBidStar(slot0.cur_show_hero_cfg.bid, slot1[1].star or 1, true)
	end
end

function InfinitePartnerSummonView.onClickShareReturnBtn(slot0)
	slot0:showHeroShareLayer(false)
end

function InfinitePartnerSummonView.onClickShareSaveBtn(slot0)
	slot0:shardErweimaImg()
end

function InfinitePartnerSummonView.showHeroShareLayer(slot0, slot1)
	slot0.hero_share_bg:setVisible(slot1)
	slot0.hero_comment_btn:setVisible(not slot1)
	slot0.hero_skill_btn:setVisible(not slot1)
	slot0.hero_desc_bg:setVisible(not slot1)
	slot0.close_tips_sp:setVisible(not slot1)

	if not slot1 and slot0.is_show_new then
		slot0.hero_new_sp:setVisible(true)
	else
		slot0.hero_new_sp:setVisible(false)
	end

	slot0.hero_is_show_share = slot1

	if slot1 == true then
		if IS_NEED_SHOW_LOGO ~= false then
			if not slot0.logo_img then
				slot0.logo_img = createSprite(PathTool.getLogoRes(), 4, display.getTop() - display.getBottom() - 26, slot0.hero_info_container, cc.p(0, 1), LOADTEXT_TYPE)

				slot0.logo_img:setScale(0.45)
			end

			slot0.logo_img:setVisible(true)
		elseif slot0.logo_img then
			slot0.logo_img:setVisible(false)
		end

		if IS_NEED_SHOW_ERWEIMA ~= false then
			if RoleController:getInstance():getApkData() then
				download_qrcode_png(slot2.message.qrcode_url, function (slot0, slot1)
					if not tolua.isnull(uv0.er_wei_ma_sp) then
						if slot0 == 0 then
							loadSpriteTexture(uv0.er_wei_ma_sp, slot1, LOADTEXT_TYPE)
						else
							loadSpriteTexture(uv0.er_wei_ma_sp, PathTool.getResFrame("partnersummon", "partnersummon_erweima"), LOADTEXT_TYPE_PLIST)
						end
					end
				end)
			else
				loadSpriteTexture(slot0.er_wei_ma_sp, PathTool.getResFrame("partnersummon", "partnersummon_erweima"), LOADTEXT_TYPE_PLIST)
			end

			slot0.er_wei_ma_sp:setVisible(true)
		else
			slot0.er_wei_ma_sp:setVisible(false)
		end
	else
		if slot0.logo_img then
			slot0.logo_img:setVisible(false)
		end

		slot0.er_wei_ma_sp:setVisible(false)
	end
end

function InfinitePartnerSummonView.handleFlickerEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.flicker_effect == nil then
			slot0.flicker_effect = createEffectSpine(PathTool.getEffectRes(1315), cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), false, slot2 or PlayerAction.action_1)

			slot0.draw_container:addChild(slot0.flicker_effect, 99)
			slot0.flicker_effect:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					uv0:showHeroInfoEnterAni()
				end
			end, sp.EventType.ANIMATION_EVENT)
		elseif slot0.flicker_effect then
			slot0.flicker_effect:setToSetupPose()
			slot0.flicker_effect:setAnimation(0, slot2, false)
		end
	elseif slot0.flicker_effect then
		slot0.flicker_effect:clearTracks()
		slot0.flicker_effect:removeFromParent()

		slot0.flicker_effect = nil
	end
end

function InfinitePartnerSummonView.handleHigherFlickerEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.higher_flicker_effect == nil then
			slot0.higher_flicker_effect = createEffectSpine(PathTool.getEffectRes(1317), cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.draw_container:addChild(slot0.higher_flicker_effect, 98)
			slot0.higher_flicker_effect:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					uv0:handleFlickerEffect(true, PlayerAction.action_2)
					uv0:showDrawEffect3(true)
					uv0:showDrawEffect4(true)
				end
			end, sp.EventType.ANIMATION_EVENT)
		elseif slot0.higher_flicker_effect then
			slot0.higher_flicker_effect:setToSetupPose()
			slot0.higher_flicker_effect:setAnimation(0, PlayerAction.action_1, false)
		end
	elseif slot0.higher_flicker_effect then
		slot0.higher_flicker_effect:clearTracks()
		slot0.higher_flicker_effect:removeFromParent()

		slot0.higher_flicker_effect = nil
	end
end

function InfinitePartnerSummonView.showStarEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.star_effect == nil then
			slot0.star_effect = createEffectSpine(PathTool.getEffectRes(1314), cc.p(SCREEN_WIDTH / 2, 1162), cc.p(0.5, 0.5), false, slot2 or PlayerAction.action_1)

			slot0.draw_container:addChild(slot0.star_effect)
		elseif slot0.star_effect then
			slot0.star_effect:setToSetupPose()
			slot0.star_effect:setAnimation(0, slot2, false)
			slot0.star_effect:setVisible(true)
		end
	elseif slot0.star_effect then
		slot0.star_effect:clearTracks()
		slot0.star_effect:removeFromParent()

		slot0.star_effect = nil
	end
end

function InfinitePartnerSummonView.showRareEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.rare_effect == nil then
			slot0.rare_effect = createEffectSpine(PathTool.getEffectRes(1316), cc.p(540, 1200), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.draw_container:addChild(slot0.rare_effect)
		end
	elseif slot0.rare_effect then
		slot0.rare_effect:clearTracks()
		slot0.rare_effect:removeFromParent()

		slot0.rare_effect = nil
	end
end

function InfinitePartnerSummonView.showHeroInfoEnterAni(slot0)
	if not tolua.isnull(slot0.hero_name_txt) then
		slot0.hero_name_txt:setPositionY(1155)
		slot0.hero_name_txt:setOpacity(0)
	end

	if not tolua.isnull(slot0.hero_camp_sp) then
		slot0.hero_camp_sp:setPositionY(1155)
		slot0.hero_camp_sp:setOpacity(0)
	end

	slot0.hero_comment_btn:setOpacity(0)
	slot0.hero_share_btn:setOpacity(0)
	slot0.hero_skill_btn:setPositionX(-80)
	slot0.hero_type_bg:setPositionX(-80)

	if not tolua.isnull(slot0.hero_desc_bg) then
		slot0.hero_desc_bg:setScale(0.3)
		slot0.hero_desc_bg:setOpacity(0)
		slot0.hero_desc_bg:setPositionY(432)
	end

	slot0.close_tips_sp:setOpacity(0)
	slot0.hero_draw_sp:setScale(0.6)
	slot0.hero_draw_sp:setOpacity(0)
	slot0.hero_info_node:setVisible(true)

	if slot0.is_show_new then
		slot0.hero_new_sp:setVisible(true)
		slot0.hero_new_sp:setOpacity(0)
	else
		slot0.hero_new_sp:setVisible(false)
	end

	slot0.quick_show_voice = true
	slot0.card_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Recruit, "result_01", false)
	slot1 = PlayerAction.action_1

	if slot0.cur_hero_is_five_star then
		slot1 = PlayerAction.action_2
	end

	slot0:showStarEffect(true, slot1)
	slot0.hero_draw_sp:runAction(cc.Sequence:create(cc.Spawn:create(cc.ScaleTo:create(0.1, slot0.hero_draw_scale + 0.2), cc.FadeIn:create(0.1)), cc.ScaleTo:create(0.05, slot0.hero_draw_scale), cc.CallFunc:create(function ()
		uv0.hero_draw_sp:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveBy:create(1, cc.p(0, 10)), cc.MoveBy:create(1, cc.p(0, -10)))))
	end)))
	slot0.hero_name_txt:runAction(cc.Spawn:create(cc.FadeIn:create(0.25), cc.MoveTo:create(0.25, cc.p(360, 1200))))
	slot0.hero_camp_sp:runAction(cc.Spawn:create(cc.FadeIn:create(0.25), cc.MoveTo:create(0.25, cc.p(360 - slot0.hero_name_txt:getContentSize().width * 0.5 - 25, 1200))))
	slot0.hero_comment_btn:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Spawn:create(cc.FadeIn:create(0.15), cc.ScaleTo:create(0.1, 2)), cc.ScaleTo:create(0.05, 1)))
	slot0.hero_share_btn:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Spawn:create(cc.FadeIn:create(0.15), cc.ScaleTo:create(0.1, 2)), cc.ScaleTo:create(0.05, 1)))

	if slot0.is_show_new then
		slot0.hero_new_sp:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.Spawn:create(cc.FadeIn:create(0.15), cc.ScaleTo:create(0.1, 2)), cc.ScaleTo:create(0.05, 1)))
	end

	slot0.hero_skill_btn:runAction(cc.MoveTo:create(0.3, cc.p(81, 358)))
	slot0.hero_type_bg:runAction(cc.MoveTo:create(0.3, cc.p(81, 485)))
	slot0.hero_desc_bg:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.Spawn:create(cc.FadeIn:create(0.1), cc.MoveTo:create(0.1, cc.p(360, 232)), cc.ScaleTo:create(0.1, 1.2)), cc.ScaleTo:create(0.05, 1), cc.CallFunc:create(function ()
		if uv0.cur_show_hero_cfg then
			if uv0.cur_show_hero_cfg.voice ~= "" then
				uv0.quick_show_voice = false

				HeroController:getInstance():onPlayHeroVoice(uv0.cur_show_hero_cfg.voice, uv0.cur_show_hero_cfg.voice_time)

				if uv0.hero_music ~= nil then
					AudioManager:getInstance():removeEffectByData(uv0.hero_music)

					uv0.hero_music = nil
				end

				uv0.hero_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.DUBBING, uv0.cur_show_hero_cfg.voice, false)
			end

			if uv0.cur_show_hero_cfg.rare_flag and uv0.cur_show_hero_cfg.rare_flag == 1 then
				uv0:showRareEffect(true)
			end
		end
	end)))
	slot0.close_tips_sp:runAction(cc.Sequence:create(cc.DelayTime:create(0.4), cc.FadeIn:create(0.2), cc.CallFunc:create(function ()
		uv0.is_show_enter_ani = false
	end)))
end

function InfinitePartnerSummonView.shardErweimaImg(slot0)
	if not IS_IOS_PLATFORM and callFunc("checkWrite") == "false" then
		return
	end

	slot0:changeShardStatus(false)

	slot1 = "sy_gameshard_image"

	if getRandomSaveName then
		slot1 = getRandomSaveName()
	end

	slot2 = cc.FileUtils:getInstance():getWritablePath() .. slot1 .. ".png"

	delayOnce(function ()
		cc.utils:captureScreen(function (slot0)
			if slot0 then
				saveImageToPhoto(uv0)
				uv1:changeShardStatus(true)
			else
				message(TI18N("保存失败"))
			end
		end, uv0)
	end, 0.01)
end

function InfinitePartnerSummonView.changeShardStatus(slot0, slot1)
	if tolua.isnull(slot0.share_layout) then
		return
	end

	slot0.share_layout:setVisible(slot1)
end

function InfinitePartnerSummonView.wxShare(slot0, slot1)
	cc.utils:captureScreen(function (slot0)
		if slot0 then
			if uv0.share_layout and not tolua.isnull(uv0.share_layout) then
				uv0.share_layout:setVisible(true)
			end

			wxSharePhoto(TI18N("我是测试title"), TI18N("我是测试内容"), uv1, nil, uv2)
		else
			message(TI18N("操作失败"))
		end
	end, cc.FileUtils:getInstance():getWritablePath() .. "CaptureScreen.png")
end

function InfinitePartnerSummonView.handleShareStatus(slot0, slot1)
	if slot0.btn_container and not tolua.isnull(slot0.btn_container) then
		slot0.btn_container:setVisible(slot1)
	end

	slot0:shareLayout(not slot1)
	slot0.title_bg:setVisible(slot1)

	if slot0.skill_item_list and next(slot0.skill_item_list or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.skill_item_list) do
			if slot6 then
				slot6:setVisible(slot1)
			end
		end
	end
end

function InfinitePartnerSummonView.updateItemData(slot0, slot1)
	if slot0.hero_info_node then
		slot0.hero_info_node:setVisible(false)
	end

	slot0:showStarEffect(false)

	slot0.is_action_ing = false

	slot0.effect_container:setVisible(false)
	slot0.left_container:setVisible(false)
	slot0.left_container:setOpacity(0)
	slot0.right_container:setVisible(false)
	slot0.right_container:setOpacity(0)
	slot0.item_container:setVisible(true)
	slot0.image_top_bg:setVisible(true)
	slot0.new_desc_container:setVisible(false)
	slot0.first_container:setVisible(false)
	slot0.image_bottom_bg:setVisible(true)
	slot0.image_bg:setVisible(true)

	if slot0.cur_hero_is_five_star then
		slot0:showDrawEffect1(false)
		slot0:showDrawEffect2(false)
		slot0:showDrawEffect3(true)
	else
		slot0:showDrawEffect1(true)
		slot0:showDrawEffect2(true)
		slot0:showDrawEffect3(false)
	end

	slot0:showDrawEffect4(true)
	slot0.title_bg:setVisible(true)
	slot0.btn_container:setVisible(false)

	slot2 = #slot1
	slot3 = 5
	slot0.row = math.ceil(slot2 / slot3)
	slot0.space = 20
	slot0.max_height = math.max(slot0.space + (slot0.space + 20 + BackPackItem.Height) * slot0.row, slot0.item_container:getContentSize().height)

	slot0.title_bg:setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 320)

	if slot3 <= slot2 then
		slot2 = slot3
	end

	slot0.start_x = (slot0.item_container:getContentSize().width - (slot2 * BackPackItem.Width + (slot2 - 1) * slot0.space)) * 0.5

	if slot0.row == 1 then
		slot0.start_y = slot0.max_height * 0.5 + 65
	else
		slot0.start_y = slot0.max_height - slot0.space - BackPackItem.Height * 0.5
	end

	for slot9, slot10 in ipairs(slot1) do
		slot11 = BackPackItem.new(false, true)

		slot11:setAnchorPoint(cc.p(0.5, 0.5))
		slot11:setBaseData(slot10.base_id, slot10.num)
		slot11:setScale(1.2)
		slot11:setOpacity(0)
		slot11:setDefaultTip()

		slot11.config = Config.ItemData.data_get_data(slot10.base_id)

		slot0.item_container:addChild(slot11)
		slot11:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot9 - 1) % slot3 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot9 - 1) / slot3) * (BackPackItem.Height + slot0.space + 20)))

		slot0.item_list[slot9] = slot11
	end

	AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_get", false)
	delayOnce(function ()
		if uv0.item_list then
			for slot3, slot4 in ipairs(uv0.item_list) do
				if slot4 and slot4 then
					slot4:runAction(cc.Sequence:create(cc.DelayTime:create(0.1 * slot3), cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1), cc.CallFunc:create(function ()
						uv0:playItemSound()
						uv0:showItemEffect(true, 156, PlayerAction.action_3, false)
					end), cc.CallFunc:create(function ()
						if uv0.config and uv0.config.is_effect and uv0.config.is_effect == 1 then
							slot0 = 156
							slot1 = PlayerAction.action_2

							if uv0.config.quality >= 4 then
								slot1 = PlayerAction.action_1
							end

							uv0:showItemEffect(true, slot0, slot1, true)
						end
					end))))
				end
			end
		end
	end, 0.2)
	slot0.again_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#020019>再抽十次</div>"))
	slot0:updateSingleSummon()
end

function InfinitePartnerSummonView.hideItemContainer(slot0)
	slot0.item_container:setVisible(false)
	slot0.image_top_bg:setVisible(false)
	slot0.image_bottom_bg:setVisible(false)
end

function InfinitePartnerSummonView.updateTenSummon(slot0)
	if slot0.type_flag == 1 and slot0.item_label then
		if slot0.tiems <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.five_icon_item) then
			slot0._item_enough = true

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.five_icon_item).icon), slot1, slot0.tiems))
		else
			slot0._item_enough = false

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot2), slot1, slot0.tiems))
		end

		return
	elseif (slot0.type_flag == 2 or slot0.type_flag == 3) and slot0.item_label then
		if slot0.tiems <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.five_icon_item) then
			slot0._item_enough = true

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.five_icon_item).icon), slot1, slot0.tiems))
		else
			slot0._item_enough = false

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot2), slot1, slot0.tiems))
		end

		return
	end

	if slot0.group_id == PartnersummonConst.Summon_Type.Score then
		slot0.item_label:setString("")

		return
	end

	slot4 = (PartnersummonController:getInstance():getModel():getSummonGroupDataByGroupId(slot0.group_id).info_data or {}).item_five[1][2]
	slot5 = 0
	slot5 = (slot0.group_id ~= PartnersummonConst.Summon_Type.Friend or RoleController:getInstance():getRoleVo().friend_point) and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.five_icon_item)
	slot6 = string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.five_icon_item).icon), slot5, slot4)

	if slot5 < slot4 then
		slot6 = string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot3), slot5, slot4)
	end

	slot0.item_label:setString(slot6)
end

function InfinitePartnerSummonView.updateSingleSummon(slot0)
	if not slot0.one_icon_item then
		return
	end

	if slot0.type_flag == 1 and slot0.item_label then
		slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.one_icon_item)

		if not Config.ItemData.data_get_data(slot0.one_icon_item) then
			return
		end

		if slot0.tiems <= slot1 then
			slot0._item_enough = true

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot2.icon), slot1, slot0.tiems))
		else
			slot0._item_enough = false

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot3), slot1, slot0.tiems))
		end

		return
	elseif (slot0.type_flag == 2 or slot0.type_flag == 3) and slot0.item_label then
		slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.one_icon_item)

		if not Config.ItemData.data_get_data(slot0.one_icon_item) then
			return
		end

		if slot0.tiems <= slot1 then
			slot0._item_enough = true

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot2.icon), slot1, slot0.tiems))
		else
			slot0._item_enough = false

			slot0.item_label:setString(string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot3), slot1, slot0.tiems))
		end

		return
	end

	if slot0.group_id == PartnersummonConst.Summon_Type.Score then
		slot0.item_label:setString("")

		return
	end

	slot2 = PartnersummonController:getInstance():getModel():getSummonGroupDataByGroupId(slot0.group_id).info_data or {}
	slot3 = slot1.proto_data or {}

	if slot0.group_id == PartnersummonConst.Summon_Type.Friend then
		slot0.one_icon_num = RoleController:getInstance():getRoleVo().friend_point
	else
		slot0.one_icon_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.one_icon_item)
	end

	slot4 = 0

	for slot8, slot9 in pairs(slot3.draw_list or {}) do
		if slot9.times == 1 and slot9.kv_list then
			for slot13, slot14 in pairs(slot9.kv_list) do
				if slot14.key == PartnersummonConst.Recruit_Key.Free_Count then
					slot4 = slot14.val

					break
				end
			end

			break
		end
	end

	slot5 = ""

	if slot4 > 0 then
		slot0.single_status = PartnersummonConst.Status.Free
		slot5 = TI18N("本次免费")
	elseif slot2 then
		slot6 = nil

		if slot2.ext_item_once and slot2.ext_item_once[1] and slot2.ext_item_once[1][1] then
			slot6 = slot2.ext_item_once[1][1]
		end

		slot8 = slot6 and slot2.ext_item_once[1][2] or 0
		slot9 = Config.ItemData.data_get_data(slot2.item_once[1][1]).icon
		slot10 = Config.ItemData.data_get_data(slot0.one_icon_item).icon

		if slot0.one_icon_num < slot2.item_once[1][2] and ((slot6 and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot6) or 0) < slot8 or slot8 == 0) then
			if slot0.group_id == PartnersummonConst.Summon_Type.Advanced then
				slot0.single_status = PartnersummonConst.Status.Gold
			else
				slot0.single_status = PartnersummonConst.Status.Item
			end

			slot5 = string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#e14737 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot9), slot0.one_icon_num, slot11)
		elseif slot8 <= slot7 and slot8 ~= 0 then
			slot0.single_status = PartnersummonConst.Status.special
			slot5 = string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot10), slot0.one_icon_num, slot8)
		else
			slot0.single_status = PartnersummonConst.Status.Item
			slot5 = string.format(TI18N("<img src=%s visible=true scale=0.5 /><div fontColor=#35ff14 outline=2,#000000>%d</div><div fontColor=#ffffff outline=2,#000000>/%d</div>"), PathTool.getItemRes(slot9), slot0.one_icon_num, slot11)
		end
	end

	if slot0.item_label then
		slot0.item_label:setString(slot5)
	end
end

function InfinitePartnerSummonView.sendFiveSummon(slot0)
	if slot0.group_id == PartnersummonConst.Summon_Type.Score then
		return
	end

	if slot0.config_data[slot0.group_id] then
		if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.five_icon_item) <= 0 and slot0.group_id == PartnersummonConst.Summon_Type.Advanced then
			if slot0.type_flag == 0 then
				slot4 = Config.ItemData.data_get_data(slot2.item_five[1][1]).icon

				slot0:showAlert(slot2.exchange_five[1][2], Config.ItemData.data_get_data(slot2.exchange_five[1][1]).icon, Config.ItemData.data_get_data(slot2.exchange_five_gain[1][1]).name or "", slot2.exchange_five_gain[1][2], 10, function ()
					PartnersummonController:getInstance():send23201(uv0.group_id, uv0.tiems, 3)
				end)
			elseif slot0.type_flag == 1 then
				slot4 = Config.ItemData.data_get_data(slot2.loss_item_ten[1][1]).icon

				slot0:showAlert(slot2.loss_gold_ten[1][2], Config.ItemData.data_get_data(slot2.loss_gold_ten[1][1]).icon, Config.ItemData.data_get_data(slot2.gain_ten[1][1]).name or "", slot2.gain_ten[1][2], 10, slot3)
			end
		else
			slot3 = nil

			if slot2.ext_item_five and slot2.ext_item_five[1] and slot2.ext_item_five[1][1] then
				slot3 = slot2.ext_item_five[1][1]
			end

			if slot3 and slot2.ext_item_five[1][2] <= (slot3 and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot3) or 0) then
				PartnersummonController:getInstance():send23201(slot0.group_id, slot0.tiems, 5)
			else
				PartnersummonController:getInstance():send23201(slot0.group_id, slot0.tiems, 4)
			end
		end
	end
end

function InfinitePartnerSummonView.showAlert(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	function slot7()
		if uv0.alert then
			uv0.alert:close()

			uv0.alert = nil
		end
	end

	slot10 = string.format(TI18N("是否使用<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(slot2), slot1, RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>%s(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次招募)</div>"), slot4, slot3, slot5)

	slot6()
end

function InfinitePartnerSummonView.playEffect(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = createEffectSpine(slot1, cc.p(slot3, slot4), cc.p(0.5, 0.5), slot7 or false, slot2, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

	slot6:addChild(slot8, slot5 or 1)

	return slot8
end

function InfinitePartnerSummonView.clickSkilAction(slot0, slot1)
	if slot0.is_action_ing == false then
		return
	end

	slot0.is_show_item = true

	if slot0.role_spine_list and next(slot0.role_spine_list or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.role_spine_list) do
			if slot6 then
				slot6:stopAllActions()
			end
		end
	end

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.item_list) do
			if slot6 and slot6:getRootWnd() then
				slot6:getRootWnd():setScale(1)
				slot6:getRootWnd():stopAllActions()
			end
		end
	end

	if slot0.title_effect and slot0.is_show_title == false and slot0.title_effect then
		slot0.title_effect:runAction(cc.RemoveSelf:create(true))

		slot0.title_effect = nil
	end

	if not slot0.title_effect then
		slot0.is_show_title = true

		slot0.title_bg:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			uv0.title_bg:setVisible(true)
		end), cc.DelayTime:create(0.1), cc.ScaleTo:create(0.1, 1)))
	end

	if slot0.reward_list and slot0.is_call == TRUE then
		slot0:updateItemData(slot0.reward_list)
	elseif slot0.is_call == FALSE then
		slot0:showHeroDetailInfo()
	end
end

function InfinitePartnerSummonView.quickShowHero(slot0, slot1)
	slot0.is_action_ing = false
	slot0.is_normal_click = slot1 or false

	slot0.image_bg:setVisible(true)

	if slot0.cur_hero_is_five_star then
		slot0:showDrawEffect1(false)
		slot0:showDrawEffect2(false)
		slot0:showDrawEffect3(true)
	else
		slot0:showDrawEffect1(true)
		slot0:showDrawEffect2(true)
		slot0:showDrawEffect3(false)
	end

	slot0:showDrawEffect4(true)

	if slot0.first_effect_spine then
		slot0.first_effect_spine:runAction(cc.RemoveSelf:create(true))

		slot0.first_effect_spine = nil
	end

	if slot0.third_effect_spine then
		slot0.third_effect_spine:runAction(cc.RemoveSelf:create(true))

		slot0.third_effect_spine = nil
	end

	slot0:handleTimeSummonEffect(false)
	slot0:showHeroDetailInfo()
end

function InfinitePartnerSummonView.resgiter_event(slot0)
	if slot0.source_container then
		slot0.source_container:setTouchEnabled(true)
		slot0.source_container:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if not uv0.is_action_ing then
					-- Nothing
				elseif uv0.role_list and next(uv0.role_list or {}) ~= nil and uv0.is_action_ing == true then
					if uv0.is_show_hero == false then
						uv0:quickShowHero(true)
					end
				else
					uv0:clickSkilAction()
				end
			end
		end)
	end

	if slot0.again_btn then
		slot0.again_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:send23250(2)
			end
		end)
	end

	if slot0.comfirm_btn then
		slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openInfiniteSummonWindow(false)
				uv0:send23251()
			end
		end)
	end

	if not slot0.update_summon_data_event then
		slot0.update_summon_data_event = GlobalEvent:getInstance():Bind(PartnersummonEvent.updateSummonDataEvent, function (slot0)
			if slot0 then
				uv0:updateSingleSummon()
			end
		end)
	end

	if not slot0.update_share_data_event then
		slot0.update_share_data_event = GlobalEvent:getInstance():Bind(PartnersummonEvent.updateSummonShareDataEvent, function ()
			uv0:updateShareLable()
		end)
	end
end

function InfinitePartnerSummonView.showSingleAlert(slot0)
	if slot0.config_data[slot0.group_id] and slot0.group_id == PartnersummonConst.Summon_Type.Advanced then
		if slot0.type_flag == 0 then
			slot3 = Config.ItemData.data_get_data(slot1.item_once[1][1]).icon
			slot11 = string.format(TI18N("是否使用<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1.exchange_once[1][1]).icon), slot1.exchange_once[1][2], RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>%s(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次招募)</div>"), slot1.exchange_once_gain[1][2], Config.ItemData.data_get_data(slot1.exchange_once_gain[1][1]).name or "", 1)

			;(function ()
				PartnersummonController:getInstance():send23201(uv0.group_id, 1, 3)
			end)()
		elseif slot0.type_flag == 1 then
			slot3 = Config.ItemData.data_get_data(slot1.loss_item_once[1][1]).icon
			slot11 = string.format(TI18N("是否使用<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1.loss_gold_once[1][1]).icon), slot1.loss_gold_once[1][2], RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>%s(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次招募)</div>"), slot1.gain_once[1][2], Config.ItemData.data_get_data(slot1.gain_once[1][1]).name or "", 1)

			slot2()
		end
	end
end

function InfinitePartnerSummonView.close_callback(slot0)
	GlobalEvent:getInstance():Fire(PokedexEvent.Call_End_Event)

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end

		slot0.item_list = {}
	end

	if slot0.card_music ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.card_music)
	end

	slot0:handleTimeSummonEffect(false)
	slot0:showDrawEffect1(false)
	slot0:showDrawEffect2(false)
	slot0:showDrawEffect3(false)
	slot0:showDrawEffect4(false)
	slot0:handleFlickerEffect(false)
	slot0:handleHigherFlickerEffect(false)
	slot0:showStarEffect(false)
	slot0:showRareEffect(false)

	if slot0.summon_bg_load then
		slot0.summon_bg_load:DeleteMe()

		slot0.summon_bg_load = nil
	end

	if slot0.effect_spine_2 then
		slot0.effect_spine_2:runAction(cc.RemoveSelf:create(true))

		slot0.effect_spine_2 = nil
	end

	if slot0.effect_spine_4 then
		slot0.effect_spine_4:runAction(cc.RemoveSelf:create(true))

		slot0.effect_spine_4 = nil
	end

	if slot0.first_container then
		slot0.first_container:removeAllChildren()

		slot0.first_container = nil
	end

	if slot0.left_container then
		slot0.left_container:removeAllChildren()

		slot0.left_container = nil
	end

	if slot0.right_container then
		slot0.right_container:removeAllChildren()

		slot0.right_container = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.resources_bg_load then
		slot0.resources_bg_load:DeleteMe()
	end

	slot0.resources_bg_load = nil

	if slot0.hero_draw_load then
		slot0.hero_draw_load:DeleteMe()
	end

	slot0.hero_draw_load = nil

	if slot0.effect_container then
		slot0.effect_container:removeAllChildren()

		slot0.effect_container = nil
	end

	if slot0.update_summon_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_data_event)

		slot0.update_summon_data_event = nil
	end

	if slot0.update_share_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_share_data_event)

		slot0.update_share_data_event = nil
	end

	uv0:openInfiniteSummonWindow(false)
end

function InfinitePartnerSummonView.shakeScreen(slot0, slot1)
	if slot1.action then
		slot0.is_shake = false

		slot2:stopAllActions()

		slot2.action = nil
	end

	slot0.camera_shake_pos = cc.p(slot1:getPosition())
	slot0.is_shake = true

	function slot3()
		uv0.is_shake = false

		uv1:setPosition(uv0.camera_shake_pos)
	end

	slot4 = {
		1,
		4,
		7,
		8,
		9,
		6,
		3,
		2
	}
	slot5 = 15
	slot6 = 3
	slot7 = 0.015
	slot8 = 0.25
	slot9 = 0.25
	slot11 = {
		{
			-0.7,
			0.7
		},
		{
			0,
			1
		},
		{
			0.7,
			0.7
		},
		{
			-1,
			0
		},
		{
			0,
			0
		},
		{
			1,
			0
		},
		{
			-0.7,
			-0.7
		},
		{
			0,
			-1
		},
		{
			0.7,
			-0.7
		}
	}

	function slot12(slot0)
		slot1, slot2 = nil

		uv6:setPosition(cc.p(uv5.camera_shake_pos.x + uv0 * uv1 * uv2[uv3[slot0]][1], uv5.camera_shake_pos.y + -uv0 * uv4 * uv2[uv3[slot0]][2]))
	end

	slot13 = nil

	for slot17 = 1, 1 do
		for slot21 = 1, #slot4 do
			slot13 = cc.Sequence:create(slot13, cc.CallFunc:create(function ()
				uv0(uv1)
			end), cc.DelayTime:create(slot7))
		end

		slot5 = slot5 - slot6
	end

	slot13 = cc.Sequence:create(slot13, cc.CallFunc:create(slot3))
	slot2.action = slot13

	slot2:runAction(slot13)
end

function InfinitePartnerSummonView.updateRole(slot0, slot1)
	slot0.role_spine_list = {}

	if slot1 and next(slot1 or {}) ~= nil then
		for slot7, slot8 in ipairs(slot1) do
			if not slot0.role_spine_list[slot7] then
				slot9 = slot0.effect_container:getContentSize()
				slot10 = createSprite(PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_10101"), slot9.width / 2, slot9.height / 2 + 170, slot0.effect_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

				slot10:setOpacity(0)
				slot10:setVisible(true)

				slot11 = slot0:createExtendCard(slot8)
				slot10.container = slot11

				slot10.container:setVisible(false)
				slot10:addChild(slot11)

				slot8.effect_action = PlayerAction.action_3
				slot10.data = slot8
				slot10.base_data = Config.PartnerData.data_partner_star(getNorKey(slot8.bid, slot8.star))
				slot0.role_spine_list[slot7] = slot10
				slot2 = 0 + 1
			end
		end

		if tableLen(slot1) <= slot2 then
			slot0:updateRoleAction()
		end
	end
end

function InfinitePartnerSummonView.createExtendCard(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setCascadeOpacityEnabled(true)
	slot2:setContentSize(cc.size(323, 65))
	showLayoutRect(slot2)

	slot4 = createSprite(PathTool.getResFrame("partnersummon", "partnersummon_type_" .. slot1.type), 5, slot2:getContentSize().height + 11, slot2, cc.p(0, 0), LOADTEXT_TYPE_PLIST)

	if slot1.camp_type then
		slot6 = createSprite(PathTool.getHeroCampTypeIcon(slot1.camp_type), 5, slot2:getContentSize().height + 390, slot2, cc.p(0, 0), LOADTEXT_TYPE_PLIST)
	end

	slot5 = {}

	for slot11 = 1, slot6 do
		if not slot5[slot11] then
			slot12 = createSprite(PathTool.getResFrame("common", "common_90011"), slot2:getContentSize().width / 2, slot2:getContentSize().height / 2, slot2, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			slot12:setPosition(slot2:getContentSize().width * 0.5 - ((slot1.star or slot1.show_star) - 1) * 30 + (slot11 - 1) * 60, slot2:getContentSize().height / 2)

			slot5[slot11] = slot12
		end
	end

	return slot2
end

function InfinitePartnerSummonView.updateRoleAction(slot0, slot1)
	if slot0.is_call == FALSE then
		slot0.is_action_ing = false
	end

	if tableLen(slot0.role_spine_list) == 0 and slot0.is_action_ing == true and slot0.is_call == TRUE then
		slot0:updateItemData(slot0.reward_list)

		return
	elseif slot0.is_normal_click == true and tableLen(slot0.role_spine_list) == 0 and slot0.is_call == TRUE then
		slot0:updateItemData(slot0.reward_list)

		return
	end

	if slot0.cur_show_card then
		slot0.cur_show_card:setOpacity(0)
		slot0.cur_show_card:setVisible(false)
	end

	slot0:showHeroAction()
end

function InfinitePartnerSummonView.showHeroAction(slot0)
	slot0.temp_sp = table.remove(slot0.role_spine_list, 1)
	slot0.cur_show_card = slot0.temp_sp
	slot1 = cc.DelayTime:create(2)
	slot2 = cc.FadeIn:create(0.1)

	if slot0.effect_spine_2 then
		slot0.effect_spine_2:setVisible(false)
	end

	if slot0.effect_spine_4 then
		slot0.effect_spine_4:setVisible(false)
	end

	slot0.is_show_hero = true

	if slot0.temp_sp then
		slot0.temp_sp:setOpacity(0)
		slot0.temp_sp:setVisible(false)
		slot0.temp_sp.container:setVisible(false)
		slot0.left_container:setPosition(cc.p(-slot0.size.width * 1.2, SCREEN_HEIGHT / 2 - 100))
		slot0.right_container:setPosition(cc.p(slot0.size.width * 1.2, SCREEN_HEIGHT / 2 + 100))
		slot0.title_bg:setVisible(false)
		slot0.btn_container:setVisible(false)
		slot0.new_desc_container:setVisible(false)
		slot0.title_bg:setScale(1.5)

		slot3 = PlayerAction.action_2

		if slot0.config_data[slot0.group_id] and slot0.config_data[slot0.group_id].action_card_name and slot0.config_data[slot0.group_id].action_card_name ~= "" then
			slot3 = slot0.config_data[slot0.group_id].action_card_name
		end

		if slot0.temp_sp and slot0.temp_sp.data and not slot0.is_show_item then
			slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot0.temp_sp.data.bid), ResourcesType.single, function ()
				if not tolua.isnull(uv0.temp_sp) and PathTool.isFileExist(uv1) then
					loadSpriteTexture(uv0.temp_sp, uv1, LOADTEXT_TYPE)
				end
			end, slot0.item_load)

			slot0.temp_sp:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
				uv0.temp_sp:setVisible(true)
			end), cc.DelayTime:create(0.1), slot2, cc.Spawn:create(cc.CallFunc:create(function ()
				uv0.temp_sp.container:setVisible(true)
			end))))

			if not slot0.effect_spine_2 then
				slot0.effect_spine_2 = slot0:playEffect(Config.EffectData.data_effect_info[123], slot3, slot0.effect_container:getContentSize().width / 2, slot0.effect_container:getContentSize().height / 2 + 160, 99, slot0.effect_container)

				slot0.effect_spine_2:setScale(display.getMaxScale())
			else
				slot0.effect_spine_2:setVisible(true)
				slot0.effect_spine_2:setToSetupPose()
				slot0.effect_spine_2:setAnimation(0, slot3, false)
			end

			slot0.effect_spine_2:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					if uv0.recuit_music ~= nil then
						AudioManager:getInstance():removeEffectByData(uv0.recuit_music)
					end

					uv0.card_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Recruit, "result_01", false)

					if not tolua.isnull(uv0.effect_spine_4) then
						uv0.effect_spine_4:setVisible(true)
					else
						uv0.effect_spine_4 = uv0:playEffect(Config.EffectData.data_effect_info[123], PlayerAction.action_3, uv0.effect_container:getContentSize().width / 2, uv0.effect_container:getContentSize().height / 2 + 160, 99, uv0.effect_container)
					end

					uv0.title_bg:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
						uv0.title_bg:setVisible(true)

						if not uv0.title_effect then
							uv0.title_effect = uv0:playEffect(Config.EffectData.data_effect_info[140], PlayerAction.action, uv0.title_bg:getContentSize().width / 2, 0, 1, uv0.title_bg, false)
						end
					end), cc.DelayTime:create(0.1), cc.ScaleTo:create(0.1, 1)))
					uv0:updateNewDesc(uv0.temp_sp.data, uv0.temp_sp.base_data)
					uv0:shakeScreen(uv0.root_wnd)
					uv0:updateButton()
				end
			end, sp.EventType.ANIMATION_EVENT)
			slot0.effect_spine_2:registerSpineEventHandler(function ()
				if uv0.card_music ~= nil then
					AudioManager:getInstance():removeEffectByData(uv0.card_music)
				end

				if uv0.temp_sp.data.voice then
					uv0.hero_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.DUBBING, uv0.temp_sp.data.voice, false)
				end
			end, sp.EventType.ANIMATION_COMPLETE)
		end
	end
end

function InfinitePartnerSummonView.updateNewDesc(slot0, slot1, slot2)
	if not slot0.name then
		slot0.name = createLabel(70, 1, 2, slot0.new_desc_container:getContentSize().width / 2, 475, slot1.name, slot0.new_desc_container, nil, cc.p(0.5, 0.5), "fonts/mini.ttf")
		slot0.hero_pos = createLabel(40, 198, 199, slot0.new_desc_container:getContentSize().width / 2, 415, slot1.hero_pos, slot0.new_desc_container, nil, cc.p(0.5, 0.5), "fonts/mini.ttf")
	end

	if slot0.name then
		slot0.name:setString(slot1.name)
	end

	if slot0.hero_pos then
		slot0.hero_pos:setString(slot1.hero_pos or "")
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2.skills or {}) do
		if slot8[1] ~= 1 and slot8[2] then
			table.insert(slot3, slot9)
		end
	end

	slot0.temp_skill_list = slot3

	for slot7, slot8 in pairs(slot0.skill_item_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in ipairs(slot3) do
		slot9 = Config.SkillData.data_get_skill(slot8)

		if not slot0.skill_item_list[slot7] and slot9 then
			slot10 = cc.size(105, 105)
			slot11 = ccui.ImageView:create()

			slot11:setCascadeOpacityEnabled(true)
			slot11:setAnchorPoint(0.5, 0.5)

			if PartnersummonConst.Gain_Skill_Pos[#slot3][slot7] then
				slot11:setPosition(slot12[slot7].x, slot12[slot7].y)
			end

			slot11:setTouchEnabled(true)
			slot11:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()

					if uv0.temp_skill_list[uv1] then
						TipsManager:getInstance():showSkillTips(Config.SkillData.data_get_skill(slot2), false, true)
					end
				end
			end)
			slot0.new_desc_container:addChild(slot11)
			slot11:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_skill_kuang"), LOADTEXT_TYPE_PLIST)

			slot13 = ccui.ImageView:create()

			slot13:setCascadeOpacityEnabled(true)
			slot13:setAnchorPoint(0.5, 0.5)
			slot13:setPosition(slot11:getContentSize().width / 2, slot11:getContentSize().height / 2)
			slot11:addChild(slot13, 3)
			slot13:loadTexture(PathTool.getSkillRes(slot9.icon), LOADTEXT_TYPE)

			slot0.skill_item_list[slot7] = slot11
			slot0.skill_item_list[slot7].icon = slot13
		end

		if slot0.skill_item_list[slot7].icon and slot9 then
			slot0.skill_item_list[slot7]:setVisible(true)

			if PartnersummonConst.Gain_Skill_Pos[#slot3][slot7] then
				slot0.skill_item_list[slot7]:setPosition(slot10[slot7].x, slot10[slot7].y)
			end

			slot0.skill_item_list[slot7].icon:loadTexture(PathTool.getSkillRes(slot9.icon), LOADTEXT_TYPE)
		end
	end

	slot0.new_desc_container:setVisible(true)
end

function InfinitePartnerSummonView.updateButton(slot0)
	if slot0.btn_container then
		slot0.btn_container:setVisible(true)
		slot0.share_btn:setVisible(true)
	end
end

function InfinitePartnerSummonView.updateShareLable(slot0)
end

function InfinitePartnerSummonView.shareLayout(slot0, slot1)
	if not slot0.root_layout then
		slot0.root_layout = ccui.Layout:create()

		slot0.root_layout:setContentSize(cc.size(SCREEN_WIDTH, 80))
		slot0.root_layout:setAnchorPoint(0.5, 0)
		slot0.root_layout:setPosition(SCREEN_WIDTH * 0.5, display.getBottom())
		slot0.root_wnd:addChild(slot0.root_layout, 99)

		slot0.share_layout = ccui.Layout:create()

		slot0.share_layout:setContentSize(cc.size(SCREEN_WIDTH, 80))
		slot0.share_layout:setPosition(cc.p(display.getLeft(slot0.root_wnd), 0))
		showLayoutRect(slot0.share_layout, 155)
		slot0.root_layout:addChild(slot0.share_layout, 99)

		slot2 = 0.62

		if IS_NEED_SHOW_LOGO ~= false then
			slot0.logo_img = createSprite(PathTool.getLogoRes(), 20, display.getTop() - display.getBottom() - 20, slot0.root_layout, cc.p(0, 1), LOADTEXT_TYPE)

			slot0.logo_img:setScale(slot2)

			slot3 = slot0.logo_img:getContentSize()
			slot0.logo_desc = createSprite(PathTool.getResFrame("partnersummon", "txt_cn_partnersummon_share"), slot3.width * slot2 + slot0.logo_img:getPositionX(), slot0.logo_img:getPositionY() - slot3.height * slot2, slot0.root_layout, cc.p(0, 0), LOADTEXT_TYPE_PLIST)
		end

		if IS_NEED_SHOW_ERWEIMA ~= false then
			slot0.er_wei_ma = ccui.ImageView:create()

			slot0.er_wei_ma:setCascadeOpacityEnabled(true)
			slot0.er_wei_ma:setAnchorPoint(0.5, 0.5)
			slot0.er_wei_ma:setPosition(365, 285)
			slot0.er_wei_ma:setTouchEnabled(true)
			slot0.er_wei_ma:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()
				end
			end)
			slot0.root_layout:addChild(slot0.er_wei_ma)

			if RoleController:getInstance():getApkData() then
				download_qrcode_png(slot3.message.qrcode_url, function (slot0, slot1)
					if not tolua.isnull(uv0.er_wei_ma) then
						if slot0 == 0 then
							uv0.er_wei_ma:loadTexture(slot1, LOADTEXT_TYPE)
						else
							uv0.er_wei_ma:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_erweima"), LOADTEXT_TYPE_PLIST)
						end
					end
				end)
			else
				slot0.er_wei_ma:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_erweima"), LOADTEXT_TYPE_PLIST)
			end

			slot0.er_wei_ma_desc = createLabel(26, 1, nil, 275, 170, TI18N("长按识别二维码"), slot0.root_layout)
		end

		slot0.return_btn = createButton(slot0.share_layout, TI18N(""), 114, 40, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_return"), 24)

		slot0.return_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#020019>返回</div>"))
		slot0.return_btn:setRichLabelPosition(120, 62)

		slot0.save_img_btn = createButton(slot0.share_layout, TI18N("确定"), 606, 40, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn"), 24)

		slot0.save_img_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#020019>保存</div>"))

		if slot0.save_img_btn then
			slot0.save_img_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					uv0:shardErweimaImg()
				end
			end)
		end

		if slot0.return_btn then
			slot0.return_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					uv0:handleShareStatus(true)
				end
			end)
		end
	end

	if slot0.root_layout and not tolua.isnull(slot0.root_layout) then
		slot0.root_layout:setVisible(slot1)
	end
end
