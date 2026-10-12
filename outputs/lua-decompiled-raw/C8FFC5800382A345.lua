ElitematchFightResultPanel = ElitematchFightResultPanel or BaseClass(BaseView)
slot1 = ElitematchController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ElitematchFightResultPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.layout_name = "elitematch/elitematch_fight_result_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitematch", "elitematch"),
			type = ResourcesType.plist
		}
	}
end

function ElitematchFightResultPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.Sprite_1 = slot0.container:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.container:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.title_container = slot0.container:getChildByName("title_container")
	slot1 = slot0.title_container:getContentSize()
	slot0.title_width = slot1.width
	slot0.title_height = slot1.height
	slot0.harm_btn = slot0.container:getChildByName("harm_btn")

	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.common_90044_0 = slot0.container:getChildByName("common_90044_0")
	slot0.level_icon = slot0.container:getChildByName("level_icon")
	slot0.node = slot0.container:getChildByName("node")
	slot0.level_name = slot0.container:getChildByName("level_name")
	slot0.score_key_0 = slot0.container:getChildByName("score_key_0")

	slot0.score_key_0:setString(TI18N("获取物品"))

	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 555, "", slot0.container, nil, cc.p(0.5, 0.5))
	slot0.comfirm_btn = createButton(slot0.container, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.container:getContentSize().width / 2 - 170, -50)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onClickBtnClose()
		end
	end)

	slot0.cancel_btn = createButton(slot0.container, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.container:getContentSize().width / 2 + 170, -50)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if not uv0.scdata then
				return
			end

			BattleResultReturnMgr:returnByFightType(uv0.scdata.combat_type)
			uv0:onClickBtnClose()
		end
	end)
end

function ElitematchFightResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0.onClickHarmBtn), false, 1)
end

function ElitematchFightResultPanel.onClickHarmBtn(slot0)
	if slot0.scdata and slot0.scdata.all_hurt_statistics then
		table.sort(slot0.scdata.all_hurt_statistics, function (slot0, slot1)
			return slot0.type < slot1.type
		end)

		for slot7, slot8 in ipairs(slot0.scdata.all_hurt_statistics) do
			if slot0.scdata.combat_type == BattleConst.Fight_Type.EliteKingMatchWar then
				slot8.atk_name = uv0("%s(队伍%s)", RoleController:getInstance():getRoleVo().name, slot8.a_round)
				slot8.target_role_name = uv0("%s(队伍%s)", slot0.scdata.target_role_name, slot8.b_round)
			else
				slot8.atk_name = slot2
				slot8.target_role_name = slot3
			end
		end

		BattleController:getInstance():openBattleHarmInfoView(true, slot0.scdata.all_hurt_statistics, {
			fight_type = slot0.scdata.combat_type
		})
	end
end

function ElitematchFightResultPanel.onClickBtnClose(slot0)
	uv0:openElitematchFightResultPanel(false)
end

function ElitematchFightResultPanel.openRootWnd(slot0, slot1)
	BattleResultMgr:getInstance():setWaitShowPanel(true)

	if not slot1 then
		return
	end

	slot0.scdata = slot1

	if slot1.result == 1 then
		playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)
	end

	slot0:handleEffect(true, slot1.result)
	slot0:setData(slot1)

	if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.scdata.combat_type] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot2)
	end

	uv0:sender24900()
end

function ElitematchFightResultPanel.setData(slot0, slot1)
	if Config.ArenaEliteData.data_elite_level[slot0.scdata.elite_lev] then
		slot0.level_name:setString(slot2.name)
		slot0:playLevelSpine(true, slot2)
	end

	slot3 = {}

	for slot7, slot8 in ipairs(slot0.scdata.awards) do
		uv0(slot3, {
			slot8.item_id,
			slot8.item_num
		})
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot3, {
		scale = 0.9,
		max_count = 4,
		is_center = true
	})
	slot5 = {}
	slot7 = slot0.scdata.score + slot0.scdata.add_score

	uv0(slot5, {
		key = "精英积分:",
		left_value = slot0.scdata.big_score + slot0.scdata.add_score,
		right_value = slot0.scdata.add_score
	})
	uv0(slot5, {
		key = "段位经验:",
		left_value = slot0.scdata.end_score,
		right_value = slot0.scdata.add_score
	})

	if slot0.scdata.combat_type == BattleConst.Fight_Type.EliteKingMatchWar then
		uv0(slot5, {
			score = uv1("%s: %s:%s", TI18N("总比分"), slot0.scdata.win_count, slot0.scdata.lose_count)
		})
	end

	if #slot0.scdata.promoted_info > 0 then
		uv0(slot5, {
			node = slot0.node
		})
		slot0:showLevelUpUI(true, slot2.promoted_info[1] or 1)

		for slot15, slot16 in ipairs(slot0.scdata.promoted_info) do
			if slot16.flag == 1 then
				slot11 = 0 + 1
			end
		end

		if (slot1.result == 0 or slot11 < (slot2.promoted_info[2] or 1)) and slot5[1] then
			slot5[1].not_change = true
			slot5[2].not_change = true
		end
	else
		uv0(slot5, {
			need_chang = true,
			node = slot0.node
		})

		slot11 = {}
		slot12, slot13, slot14 = nil
		slot15 = slot2.init_exp + slot2.need_exp

		if slot0.scdata.score + slot0.scdata.add_score >= 0 then
			slot12, slot14, slot13 = slot0:getPercent(slot2, slot10)

			if slot2.need_exp < slot10 then
				slot5[2].left_value = slot2.need_exp
				slot5[2].right_value = slot2.need_exp - slot0.scdata.score

				if slot2.next_id == 0 and slot2.need_exp <= slot0.scdata.score then
					slot5[2].right_value = 0
				end
			end
		elseif slot0.scdata.new_elite_lev < slot0.scdata.elite_lev then
			if Config.ArenaEliteData.data_elite_level[slot0.scdata.new_elite_lev] then
				slot12, slot14, slot13 = slot0:getPercent(slot16, slot0.scdata.end_score)
			end
		else
			slot12, slot14, slot13 = slot0:getPercent(slot2, slot10)
		end

		slot0.end_percent = slot12
		slot0.end_blue_percent = slot14
		slot0.end_str = slot13

		slot0:showProgressbarEffect(slot2)
	end

	slot0:initShowList(slot5)
end

function ElitematchFightResultPanel.getPercent(slot0, slot1, slot2)
	slot3, slot4, slot5 = nil
	slot6 = slot1.init_exp + slot1.need_exp

	if slot2 >= 0 then
		slot3 = (slot2 + slot1.init_exp) * 100 / slot6
		slot4 = slot1.init_exp * 100 / slot6

		if slot1.need_exp < slot2 then
			slot2 = slot1.need_exp
		end

		slot5 = uv0("%s/%s", slot2, slot1.need_exp)
	else
		slot3 = 0
		slot7 = slot1.init_exp + slot2
		slot4 = slot7 * 100 / slot6
		slot5 = slot7
	end

	return slot3, slot4, slot5
end

function ElitematchFightResultPanel.showProgressbarEffect(slot0, slot1)
	if slot0.scdata.result ~= 1 then
		slot2 = -1
	end

	slot3 = 0
	slot4 = slot1
	slot5 = slot0.scdata.score

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 + uv1
		uv2 = uv2 + uv1
		slot0, slot1, slot2 = uv3:getPercent(uv4, uv0)

		if math.abs(uv3.scdata.add_score) <= math.abs(uv2) then
			slot0 = uv3.end_percent
			slot2 = uv3.end_str
			slot1 = uv3.end_blue_percent

			GlobalTimeTicket:getInstance():remove("elitematch_fight_result_timer")
		end

		if slot1 <= 0 and uv3.scdata.new_elite_lev < uv3.scdata.elite_lev then
			uv4 = Config.ArenaEliteData.data_elite_level[uv3.scdata.new_elite_lev]

			if uv4 then
				uv0 = uv4.need_exp
				slot0, slot1, slot2 = uv3:getPercent(uv4, uv0)
			else
				slot0 = 0
				slot2 = 0
				slot1 = 0

				GlobalTimeTicket:getInstance():remove("elitematch_fight_result_timer")
			end
		end

		uv3:showProgressbar(true, slot0, slot1, slot2)
	end, 0.02, 0, "elitematch_fight_result_timer")
end

function ElitematchFightResultPanel.initShowList(slot0, slot1)
	if not slot1 then
		return
	end

	slot4 = 360
	slot5 = #slot1
	slot6 = 144 / slot5

	for slot10 = 1, slot5 do
		if slot1[slot10].node ~= nil then
			slot11.node:setPositionY(180 + (slot10 - 1) * slot6 + slot6 * 0.5)

			if slot11.need_chang then
				slot0.common_90044_0:setContentSize(cc.size(slot0.common_90044_0:getContentSize().width, slot2 + 10))
			else
				slot0.common_90044_0:setContentSize(cc.size(slot13.width, (slot5 - 1) * slot6))
			end
		elseif slot11.score ~= nil then
			createLabel(24, cc.c4b(255, 238, 172, 255), nil, slot4, slot12, slot11.score, slot0.container, 2, cc.p(0.5, 0.5))
		else
			createLabel(24, cc.c4b(255, 238, 172, 255), nil, 230, slot12, uv0("%s %s", slot11.key, slot11.left_value), slot0.container, 2, cc.p(0, 0.5))

			slot14, slot15 = nil
			slot14 = (slot11.right_value < 0 or PathTool.getResFrame("common", "common_1086")) and PathTool.getResFrame("common", "common_1087")
			slot15 = math.abs(slot11.right_value)

			if slot11.not_change then
				createLabel(24, cc.c4b(255, 238, 172, 255), nil, 496, slot12, TI18N("不变"), slot0.container, 2, cc.p(0, 0.5))
			else
				createSprite(slot14, 482, slot12, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 0)
				createLabel(24, cc.c4b(255, 238, 172, 255), nil, 496, slot12, tostring(slot15), slot0.container, 2, cc.p(0, 0.5))
			end
		end
	end
end

function ElitematchFightResultPanel.showProgressbar(slot0, slot1, slot2, slot3, slot4)
	if not slot0.node then
		return
	end

	if slot1 then
		slot5 = cc.size(350, 24)

		if not slot0.comp_bar then
			slot7 = PathTool.getResFrame("common", "common_90006")
			slot0.camp_bar_record_res = slot7
			slot9, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), slot7, slot5, slot0.node, cc.p(0.5, 0.5), 0, 0, true, true)
			slot0.comp_bar_bg = slot9
			slot11 = ccui.LoadingBar:create()

			slot11:setAnchorPoint(cc.p(0, 0.5))
			slot11:setScale9Enabled(true)
			slot11:setCascadeOpacityEnabled(true)
			slot11:loadTexture(PathTool.getResFrame("common", "common_90082"), LOADTEXT_TYPE_PLIST)
			slot11:setContentSize(cc.size(slot5.width - 4, slot5.height - 4))
			slot11:setPosition(cc.p(1, slot5.height / 2))
			slot9:addChild(slot11)

			slot0.comp_bar_blue = slot11
		end

		if not slot0.comp_bar_label then
			slot0.comp_bar_label = createLabel(16, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot5.width / 2, slot5.height / 2, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))
		end

		slot0.comp_bar_bg:setVisible(true)
		slot0.comp_bar:setPercent(slot2)
		slot0.comp_bar_blue:setPercent(slot3)
		slot0.comp_bar_label:setString(slot4)
	elseif slot0.comp_bar_bg then
		slot0.comp_bar_bg:setVisible(false)
	end
end

function ElitematchFightResultPanel.showLevelUpUI(slot0, slot1, slot2)
	if slot0.level_up_item_list then
		for slot6, slot7 in ipairs(slot0.level_up_item_list) do
			slot7:setVisible(false)
		end
	end

	if slot1 then
		if slot0.level_up_item_list == nil then
			slot0.level_up_item_list = {}
		end

		slot3 = 50
		slot4 = -slot3 * slot2 * 0.5 + slot3 * 0.5
		slot5 = {
			[slot10.count] = slot10.flag
		}

		for slot9, slot10 in ipairs(slot0.scdata.promoted_info) do
			-- Nothing
		end

		for slot9 = 1, slot2 do
			if slot0.level_up_item_list[slot9] == nil then
				slot0.level_up_item_list[slot9] = slot0:createLevelUpItem(slot4 + (slot9 - 1) * slot3, 0)
			else
				slot0.level_up_item_list[slot9]:setPositionX(slot10)
			end

			if slot5[slot9] == nil or slot5[slot9] == 0 then
				slot0.level_up_item_list[slot9].icon:setVisible(false)
				slot0.level_up_item_list[slot9].mask_icon:setVisible(false)
			else
				slot0.level_up_item_list[slot9].icon:setVisible(true)
				slot0.level_up_item_list[slot9].mask_icon:setVisible(true)

				if slot5[slot9] == 1 then
					setChildUnEnabled(false, slot0.level_up_item_list[slot9].icon)
					loadSpriteTexture(slot0.level_up_item_list[slot9].mask_icon, PathTool.getResFrame("elitematch", "txt_cn_elitematch_15"), LOADTEXT_TYPE_PLIST)
				else
					setChildUnEnabled(true, slot0.level_up_item_list[slot9].icon)
					loadSpriteTexture(slot0.level_up_item_list[slot9].mask_icon, PathTool.getResFrame("elitematch", "txt_cn_elitematch_16"), LOADTEXT_TYPE_PLIST)
				end
			end
		end
	end
end

function ElitematchFightResultPanel.createLevelUpItem(slot0, slot1, slot2)
	if not slot0.node then
		return
	end

	slot3 = {
		bg = createSprite(PathTool.getResFrame("elitematch", "elitematch_14"), slot1, slot2, slot0.node, cc.p(0.5, 0.5))
	}
	slot5 = slot3.bg:getContentSize()
	slot3.icon = createSprite(PathTool.getResFrame("elitematch", "elitematch_12"), slot5.width * 0.5, slot5.height * 0.5, slot3.bg, cc.p(0.5, 0.5))
	slot3.mask_icon = createSprite(PathTool.getResFrame("elitematch", "txt_cn_elitematch_15"), 35, 36, slot3.bg, cc.p(0.5, 0.5))

	return slot3
end

function ElitematchFightResultPanel.handleEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		if slot2 == 1 then
			slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[103], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5 - 14), cc.p(0.5, 0.5), false, PlayerAction.action_2)
		else
			slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[104], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5 + 32), cc.p(0.5, 0.5), false, PlayerAction.action)
		end

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function ElitematchFightResultPanel.playLevelSpine(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.level_spine then
			slot0.level_spine:clearTracks()
			slot0.level_spine:removeFromParent()

			slot0.level_spine = nil
		end
	else
		if not slot2 then
			return
		end

		if slot0.level_spine_record == nil or slot0.level_spine_record ~= slot2.ico then
			slot0.level_spine_record = slot2.ico

			slot0:playLevelSpine(false)

			slot0.level_spine = createEffectSpine(slot2.ico, cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.level_spine:setScale(0.5)
			slot0.level_icon:addChild(slot0.level_spine, 1)
			slot0:EliteEndAction(slot2)
		end
	end
end

function ElitematchFightResultPanel.EliteEndAction(slot0, slot1)
	if slot0.scdata and slot0.scdata.elite_lev ~= slot0.scdata.new_elite_lev then
		slot0.level_icon:setCascadeOpacityEnabled(true)
		slot0.level_icon:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			uv0.level_spine:runAction(cc.MoveBy:create(0.5, cc.p(-180, 0)))

			if uv0.level_name then
				uv0.level_name:runAction(cc.MoveBy:create(0.5, cc.p(-180, 0)))
			end
		end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			createSprite(PathTool.getResFrame("common", "common_90034"), 0, 84, uv0.level_icon, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST):runAction(cc.FadeIn:create(1))
		end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			if Config.ArenaEliteData.data_elite_level[uv0.scdata.new_elite_lev] and slot0.ico then
				slot1 = 0.5

				if uv0.scdata.elite_lev < uv0.scdata.new_elite_lev then
					uv0.next_lev_spine_bg = createEffectSpine(PathTool.getEffectRes(690), cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

					uv0.level_icon:addChild(uv0.next_lev_spine_bg, 1)
					uv0.next_lev_spine_bg:setPosition(180, 88)
					uv0.next_lev_spine_bg:setOpacity(0)
					uv0.next_lev_spine_bg:runAction(cc.FadeIn:create(1))
				end

				uv0.next_lev_spine = createEffectSpine(slot0.ico, cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action)

				uv0.next_lev_spine:setScale(0.5)
				uv0.level_icon:addChild(uv0.next_lev_spine, 3)
				uv0.next_lev_spine:setPositionX(180)
				uv0.next_lev_spine:setOpacity(0)
				uv0.next_lev_spine:runAction(cc.FadeIn:create(slot1))

				slot3 = createLabel(30, cc.c4b(255, 246, 208, 255), cc.c4b(0, 0, 0, 255), 0, 0, "", uv0.level_icon, 2, cc.p(0.5, 0.5))

				slot3:setLocalZOrder(10)
				slot3:setString(slot0.name)
				slot3:setPosition(180, 24)
				slot3:setOpacity(0)
				slot3:runAction(cc.FadeIn:create(slot1))
			end
		end)))
	end
end

function ElitematchFightResultPanel.close_callback(slot0)
	slot0:handleEffect(false)
	slot0:playLevelSpine(false)

	if slot0.next_lev_spine then
		slot0.next_lev_spine:clearTracks()
		slot0.next_lev_spine:removeFromParent()

		slot0.next_lev_spine = nil
	end

	if slot0.next_lev_spine_bg then
		slot0.next_lev_spine_bg:clearTracks()
		slot0.next_lev_spine_bg:removeFromParent()

		slot0.next_lev_spine_bg = nil
	end

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	GlobalTimeTicket:getInstance():remove("elitematch_fight_result_timer")
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openElitematchFightResultPanel(false)
end
