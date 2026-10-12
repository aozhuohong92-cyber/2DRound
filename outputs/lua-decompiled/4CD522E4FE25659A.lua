PartnerSummonGainShowWindow = PartnerSummonGainShowWindow or BaseClass(BaseView)
slot0 = PartnersummonController:getInstance()
slot1 = PartnersummonController:getInstance():getModel()

function PartnerSummonGainShowWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Full
	slot0.role_spine_list = {}
	slot0.skill_item_list = {}
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
end

function PartnerSummonGainShowWindow.createRootWnd(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:setContentSize(slot0.size)
	showLayoutRect(slot0.root_wnd, 255)
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "recruit_action2")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.Recruit, "result_01")

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

	slot0.image_bg = createSprite(slot0.partnersummon_call_bg_res, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, slot0.source_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.image_bg:setVisible(false)
	slot0.image_bg:setScale(display.getMaxScale())

	slot0.title_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_18"), SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 525, slot0.source_container, cc.p(0.5, 0.5), LOADTEXT_TYPE)

	slot0.title_bg:setVisible(false)
	slot0.title_bg:setScale(1.5)

	slot0.effect_container = ccui.Layout:create()

	slot0.effect_container:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.effect_container:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.effect_container:setCascadeOpacityEnabled(true)
	slot0.effect_container:setPosition(cc.p(slot0.size.width / 2, SCREEN_HEIGHT / 2))
	slot0.root_wnd:addChild(slot0.effect_container, 99)

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

	slot0.comfirm_next_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#823705>确定</div>"))

	if slot0.comfirm_next_btn then
		slot0.comfirm_next_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openSummonGainShowWindow(false)
			end
		end)
	end

	slot0:resgiter_event()
end

function PartnerSummonGainShowWindow.openRootWnd(slot0, slot1)
	slot0.is_chips = slot1.is_chips

	slot0:callAction(slot1)
end

function PartnerSummonGainShowWindow.callAction(slot0, slot1)
	slot0.data = slot1 or {}
	slot0.role_list = {}
	slot0.is_action_ing = true
	slot2 = deepCopy(Config.PartnerData.data_partner_base[slot1.partner_bid]) or {}
	slot2.star = slot1.init_star

	if slot2.voice ~= "" then
		AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.DUBBING, slot2.voice)
	end

	slot0.show_type = slot1.show_type or PartnersummonConst.Gain_Show_Type.Common_Show

	table.insert(slot0.role_list, slot2)
	slot0:quickShowHero()
end

function PartnerSummonGainShowWindow.quickShowHero(slot0)
	slot0.is_action_ing = false

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

	slot0:showHeroDetailInfo()
end

function PartnerSummonGainShowWindow.showHeroDetailInfo(slot0)
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

		if slot0.show_type == PartnersummonConst.Gain_Show_Type.Skin_show then
			if Config.PartnerSkinData.data_skin_info[slot0.data.skin_id] then
				slot0.hero_name_txt:setString(slot2.skin_name or "")
			end
		else
			slot0.hero_name_txt:setString(slot1.name)
		end

		loadSpriteTexture(slot0.hero_camp_sp, PathTool.getHeroCampTypeIcon(slot1.camp_type), LOADTEXT_TYPE_PLIST)
		slot0.hero_camp_sp:setPosition(cc.p(360 - slot0.hero_name_txt:getContentSize().width * 0.5 - 25, 1195))

		slot0.is_show_new = false

		if slot0.show_type == PartnersummonConst.Gain_Show_Type.Skin_show or HeroController:getInstance():getModel():getHeroNumByBid(slot1.bid) <= 1 then
			slot0.is_show_new = true
		end

		slot4 = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_300", true)

		if slot1.star >= 5 then
			slot4 = PathTool.getPlistImgForDownLoad("bigbg/partnersummon", "partnersummon_call_bg_400", true)

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

		if not slot0.bg_res_id or slot0.bg_res_id ~= slot4 then
			slot0.bg_res_id = slot4
			slot0.resources_bg_load = loadSpriteTextureFromCDN(slot0.image_bg, slot0.bg_res_id, ResourcesType.single, slot0.resources_bg_load)
		end

		slot0.hero_draw_scale = 1

		if slot0.hero_spine then
			slot0.hero_spine:removeFromParent()

			slot0.hero_spine = nil
		end

		slot0.hero_spine = BaseRole.new(BaseRole.type.partner, slot1, nil, nil)

		slot0.hero_spine:setAnimation(0, PlayerAction.show, true)
		slot0.hero_spine:setCascade(true)
		slot0.hero_spine:setPosition(cc.p(360, 475))
		slot0.hero_spine:setAnchorPoint(cc.p(0, 0))
		slot0.hero_spine:setScale(1.2)
		slot0.hero_info_node:addChild(slot0.hero_spine)

		if slot1.star >= 5 then
			slot5 = "txt_cn_partnersummon_type_" .. slot1.type .. "_s"
		end

		loadSpriteTexture(slot0.hero_type_sp, PathTool.getResFrame("partnersummon", slot5))
		slot0.hero_type_txt:setString(slot1.hero_pos or "")

		if Config.PartnerData.data_partner_library(slot1.bid) then
			slot0.hero_desc_txt:setString(slot7.voice_str)
		end

		slot0.hero_info_node:setVisible(false)

		slot0.is_show_enter_ani = true

		if slot1.star >= 5 then
			slot0:handleHigherFlickerEffect(true)
		else
			slot0:handleFlickerEffect(true, PlayerAction.action_1)
		end
	else
		uv0:openSummonGainShowWindow(false)
	end
end

function PartnerSummonGainShowWindow.showDrawEffect1(slot0, slot1)
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

function PartnerSummonGainShowWindow.showDrawEffect2(slot0, slot1)
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

function PartnerSummonGainShowWindow.showDrawEffect3(slot0, slot1)
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

function PartnerSummonGainShowWindow.showDrawEffect4(slot0, slot1)
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

function PartnerSummonGainShowWindow.quickShowHeroInfo(slot0)
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
	slot0.hero_type_bg:setPosition(cc.p(81, 458))
	slot0.hero_desc_bg:stopAllActions()
	slot0.hero_desc_bg:setScale(1)
	slot0.hero_desc_bg:setOpacity(255)
	slot0.hero_desc_bg:setPosition(cc.p(360, 232))
	slot0.hero_skill_btn:stopAllActions()
	slot0.hero_skill_btn:setPosition(cc.p(81, 358))
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
			slot0.hero_desc_txt:setString(slot2.voice_str)
		end

		if slot0.cur_show_hero_cfg.voice ~= "" and slot0.quick_show_voice then
			slot0.quick_show_voice = false

			HeroController:getInstance():onPlayHeroVoice(slot0.cur_show_hero_cfg.voice, slot0.cur_show_hero_cfg.voice_time)

			if slot0.hero_music ~= nil then
				AudioManager:getInstance():removeEffectByData(slot0.hero_music)

				slot0.hero_music = nil
			end

			slot0.hero_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.DUBBING, slot0.cur_show_hero_cfg.voice, false)
		end

		if slot0.cur_show_hero_cfg.rare_flag and slot0.cur_show_hero_cfg.rare_flag == 1 then
			slot0:showRareEffect(true)
		end
	end

	slot0.is_show_enter_ani = false
end

function PartnerSummonGainShowWindow.createHeroInfoNode(slot0)
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
	slot0.hero_comment_btn:setVisible(false)
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
	slot0.hero_desc_txt:setTextColor(cc.c4b(2, 54, 86, 255))

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

function PartnerSummonGainShowWindow.onClickCommentBtn(slot0)
	if slot0.cur_show_hero_cfg then
		PokedexController:getInstance():openCommentWindow(true, slot0.cur_show_hero_cfg)
	end
end

function PartnerSummonGainShowWindow.onClickShareBtn(slot0)
	if FINAL_CHANNEL == "syios_smzhs" then
		message(TI18N("暂不支持"))

		return
	end

	slot0:showHeroShareLayer(true)
end

function PartnerSummonGainShowWindow.onClickSkillBtn(slot0)
	if not slot0.cur_show_hero_cfg then
		return
	end

	if Config.PartnerData.data_partner_pokedex[slot0.cur_show_hero_cfg.bid] and slot1[1] then
		HeroController:getInstance():openHeroInfoWindowByBidStar(slot0.cur_show_hero_cfg.bid, slot1[1].star or 1, true)
	end
end

function PartnerSummonGainShowWindow.onClickShareReturnBtn(slot0)
	slot0:showHeroShareLayer(false)
end

function PartnerSummonGainShowWindow.onClickShareSaveBtn(slot0)
	slot0:shardErweimaImg()
end

function PartnerSummonGainShowWindow.showHeroShareLayer(slot0, slot1)
	slot0.hero_share_bg:setVisible(slot1)
	slot0.hero_comment_btn:setVisible(false)
	slot0.hero_share_btn:setVisible(false)
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

function PartnerSummonGainShowWindow.handleFlickerEffect(slot0, slot1, slot2)
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

function PartnerSummonGainShowWindow.handleHigherFlickerEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.draw_container) and slot0.higher_flicker_effect == nil then
			slot0.higher_flicker_effect = createEffectSpine(PathTool.getEffectRes(1317), cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.draw_container:addChild(slot0.higher_flicker_effect, 99)
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

function PartnerSummonGainShowWindow.showStarEffect(slot0, slot1, slot2)
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

function PartnerSummonGainShowWindow.showRareEffect(slot0, slot1)
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

function PartnerSummonGainShowWindow.showHeroInfoEnterAni(slot0)
	slot0.hero_name_txt:setPositionY(1155)
	slot0.hero_name_txt:setOpacity(0)
	slot0.hero_camp_sp:setPositionY(1155)
	slot0.hero_camp_sp:setOpacity(0)
	slot0.hero_comment_btn:setOpacity(0)
	slot0.hero_share_btn:setOpacity(0)
	slot0.hero_skill_btn:setPositionX(-80)
	slot0.hero_type_bg:setPositionX(-80)
	slot0.hero_desc_bg:setScale(0.3)
	slot0.hero_desc_bg:setOpacity(0)
	slot0.hero_desc_bg:setPositionY(432)
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

function PartnerSummonGainShowWindow.createExtendCard(slot0, slot1)
	slot2 = ccui.Layout:create()

	slot2:setCascadeOpacityEnabled(true)
	slot2:setContentSize(cc.size(323, 65))

	if slot0.show_type == PartnersummonConst.Gain_Show_Type.Common_Show then
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
	end

	return slot2
end

function PartnerSummonGainShowWindow.showHeroAction(slot0)
	slot0.temp_spine = table.remove(slot0.role_spine_list, 1)
	slot0.cur_show_card = slot0.temp_spine
	slot1 = cc.DelayTime:create(2)
	slot2 = cc.FadeIn:create(0.1)

	if slot0.effect_spine_2 then
		slot0.effect_spine_2:setVisible(false)
	end

	if slot0.effect_spine_4 then
		slot0.effect_spine_4:setVisible(false)
	end

	slot0.is_show_hero = true

	if slot0.temp_spine then
		slot0.temp_spine:setOpacity(0)
		slot0.temp_spine:setVisible(false)
		slot0.temp_spine.container:setVisible(false)
		slot0.title_bg:setVisible(false)
		slot0.btn_container:setVisible(false)
		slot0.new_desc_container:setVisible(false)
		slot0.title_bg:setScale(1.5)

		slot3 = PlayerAction.action_2

		if Config.RecruitData.data_partnersummon_data[slot0.group_id] and Config.RecruitData.data_partnersummon_data[slot0.group_id].action_card_name and Config.RecruitData.data_partnersummon_data[slot0.group_id].action_card_name ~= "" then
			slot3 = Config.RecruitData.data_partnersummon_data[slot0.group_id].action_card_name
		end

		if slot0.temp_spine and slot0.temp_spine.data and not slot0.is_show_item then
			slot4 = nil
			slot0.item_load = createResourcesLoad((slot0.show_type ~= PartnersummonConst.Gain_Show_Type.Skin_show or (not Config.PartnerSkinData.data_skin_info[slot0.data.skin_id] or PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot5.head_card_id)) and PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_2001")) and PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot0.temp_spine.data.bid), ResourcesType.single, function ()
				if not tolua.isnull(uv0.temp_spine) and PathTool.isFileExist(uv1) then
					loadSpriteTexture(uv0.temp_spine, uv1, LOADTEXT_TYPE)
				end
			end, slot0.item_load)

			if not slot0.effect_spine_2 then
				if slot0.show_type == PartnersummonConst.Gain_Show_Type.Skin_show then
					slot0.effect_spine_2 = slot0:playEffect("E51007", slot3, slot0.effect_container:getContentSize().width / 2, slot0.effect_container:getContentSize().height / 2 + 160, 99, slot0.effect_container)
				else
					slot0.effect_spine_2 = slot0:playEffect(Config.EffectData.data_effect_info[123], slot3, slot0.effect_container:getContentSize().width / 2, slot0.effect_container:getContentSize().height / 2 + 160, 99, slot0.effect_container)
				end

				slot0.effect_spine_2:setScale(display.getMaxScale())
			else
				slot0.effect_spine_2:setVisible(true)
				slot0.effect_spine_2:setToSetupPose()
				slot0.effect_spine_2:setAnimation(0, slot3, false)
			end

			slot0.temp_spine:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
				uv0.temp_spine:setVisible(true)
			end), cc.DelayTime:create(0.1), slot2, cc.Spawn:create(cc.CallFunc:create(function ()
				uv0.temp_spine.container:setVisible(true)
			end))))
			slot0.effect_spine_2:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.Recruit, "result_01", false)

					if uv0.effect_spine_4 and not tolua.isnull(uv0.effect_spine_4) then
						uv0.effect_spine_4:setVisible(true)
					elseif uv0.show_type == PartnersummonConst.Gain_Show_Type.Skin_show then
						uv0.effect_spine_4 = uv0:playEffect("E51007", PlayerAction.action_3, uv0.effect_container:getContentSize().width / 2, uv0.effect_container:getContentSize().height / 2 + 160, 99, uv0.effect_container)
					else
						uv0.effect_spine_4 = uv0:playEffect(Config.EffectData.data_effect_info[123], PlayerAction.action_3, uv0.effect_container:getContentSize().width / 2, uv0.effect_container:getContentSize().height / 2 + 160, 99, uv0.effect_container)
					end

					uv0.title_bg:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
						uv0.title_bg:setVisible(true)
					end), cc.DelayTime:create(0.1), cc.ScaleTo:create(0.1, 1)))
					uv0:updateNewDesc(uv0.temp_spine.data, uv0.temp_spine.base_data)
					uv0:shakeScreen(uv0.root_wnd)
					uv0:updateButton()
				end
			end, sp.EventType.ANIMATION_EVENT)
			slot0.effect_spine_2:registerSpineEventHandler(function ()
				if uv0.temp_spine and uv0.temp_spine.data.voice and uv0.temp_spine.data.voice ~= " " then
					uv0.hero_music = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.DUBBING, uv0.temp_spine.data.voice, false)
				end
			end, sp.EventType.ANIMATION_COMPLETE)
		end
	end
end

function PartnerSummonGainShowWindow.playEffect(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = nil
	slot8 = createEffectSpine(slot1, cc.p(slot3, slot4), cc.p(0.5, 0.5), slot7 or false, slot2, function ()
	end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

	slot6:addChild(slot8, slot5 or 1)

	return slot8
end

function PartnerSummonGainShowWindow.updateNewDesc(slot0, slot1, slot2)
	if not slot0.name then
		slot0.name = createLabel(70, 1, 2, slot0.new_desc_container:getContentSize().width / 2, 475, slot1.name, slot0.new_desc_container, nil, cc.p(0.5, 0.5), "fonts/title.ttf")
	end

	if not slot0.hero_pos then
		slot0.hero_pos = createLabel(40, 198, 199, slot0.new_desc_container:getContentSize().width / 2, 415, slot1.hero_pos, slot0.new_desc_container, nil, cc.p(0.5, 0.5), "fonts/title.ttf")
	end

	if slot0.show_type == PartnersummonConst.Gain_Show_Type.Skin_show then
		if Config.PartnerSkinData.data_skin_info[slot0.data.skin_id] then
			slot0.hero_pos:setPositionY(393)
			slot0.hero_pos:setString(string.format(TI18N("%s·皮肤"), slot1.name))
			slot0.name:setString(slot3.skin_name)
		end
	elseif slot0.show_type == PartnersummonConst.Gain_Show_Type.Common_Show then
		slot0.name:setString(slot1.name)
		slot0.hero_pos:setString(slot1.hero_pos)

		for slot7, slot8 in pairs(slot2.skills or {}) do
			if slot8[1] ~= 1 and slot8[2] then
				table.insert({}, slot9)
			end
		end

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

						if uv0 then
							TipsManager:getInstance():showSkillTips(Config.SkillData.data_get_skill(uv0), false, true)
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
	end

	slot0.new_desc_container:setVisible(true)
end

function PartnerSummonGainShowWindow.updateButton(slot0)
	if slot0.btn_container then
		slot0.btn_container:setVisible(true)
		slot0.share_btn:setVisible(false)
	end
end

function PartnerSummonGainShowWindow.updateShareLable(slot0)
end

function PartnerSummonGainShowWindow.shareLayout(slot0, slot1)
	if not slot0.root_layout then
		slot0.root_layout = ccui.Layout:create()

		slot0.root_layout:setContentSize(cc.size(SCREEN_WIDTH, 80))
		slot0.root_layout:setAnchorPoint(0.5, 0)
		slot0.root_layout:setPosition(SCREEN_WIDTH * 0.5, 0)
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
					if slot0 == 0 then
						uv0.er_wei_ma:loadTexture(slot1, LOADTEXT_TYPE)
					else
						uv0.er_wei_ma:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_erweima"), LOADTEXT_TYPE_PLIST)
					end
				end)
			else
				slot0.er_wei_ma:loadTexture(PathTool.getResFrame("partnersummon", "partnersummon_erweima"), LOADTEXT_TYPE_PLIST)
			end

			slot0.er_wei_ma_desc = createLabel(26, 1, nil, 275, 170, TI18N("长按识别二维码"), slot0.root_layout)
		end

		slot0.return_btn = createButton(slot0.share_layout, TI18N(""), 114, 40, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_return"), 24)

		slot0.return_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#823705>返回</div>"))
		slot0.return_btn:setRichLabelPosition(120, 62)

		slot0.save_img_btn = createButton(slot0.share_layout, TI18N("确定"), 606, 40, cc.size(220, 77), PathTool.getResFrame("partnersummon", "partnersummon_btn"), 24)

		slot0.save_img_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=34 outline=2,#823705>保存</div>"))

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

function PartnerSummonGainShowWindow.shardErweimaImg(slot0)
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
				message("保存失败")
			end
		end, uv0)
	end, 0.01)
end

function PartnerSummonGainShowWindow.changeShardStatus(slot0, slot1)
	if tolua.isnull(slot0.share_layout) then
		return
	end

	slot0.share_layout:setVisible(slot1)
end

function PartnerSummonGainShowWindow.wxShare(slot0, slot1)
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

function PartnerSummonGainShowWindow.handleShareStatus(slot0, slot1)
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

function PartnerSummonGainShowWindow.shakeScreen(slot0, slot1)
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

function PartnerSummonGainShowWindow.resgiter_event(slot0)
end

function PartnerSummonGainShowWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.hero_draw_load then
		slot0.hero_draw_load:DeleteMe()

		slot0.hero_draw_load = nil
	end

	slot0:showDrawEffect1(false)
	slot0:showDrawEffect2(false)
	slot0:showDrawEffect3(false)
	slot0:showDrawEffect4(false)
	slot0:handleFlickerEffect(false)
	slot0:handleHigherFlickerEffect(false)
	slot0:showStarEffect(false)
	slot0:showRareEffect(false)

	if slot0.effect_spine_2 then
		slot0.effect_spine_2:runAction(cc.RemoveSelf:create(true))

		slot0.effect_spine_2 = nil
	end

	if slot0.effect_spine_4 then
		slot0.effect_spine_4:runAction(cc.RemoveSelf:create(true))

		slot0.effect_spine_4 = nil
	end

	if slot0.card_music ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.card_music)
	end

	uv0:openSummonGainShowWindow(false)
end
