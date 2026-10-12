ArenaManyPeopleFightResultPanel = ArenaManyPeopleFightResultPanel or BaseClass(BaseView)
slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function ArenaManyPeopleFightResultPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.layout_name = "arenamanypeople/amp_fight_result_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
end

function ArenaManyPeopleFightResultPanel.open_callback(slot0)
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
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 455, "", slot0.container, nil, cc.p(0.5, 0.5))
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

			BattleResultReturnMgr:returnByFightType(BattleConst.Fight_Type.AreanManyPeople)
			uv0:onClickBtnClose()
		end
	end)
end

function ArenaManyPeopleFightResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0.onClickHarmBtn), false, 1)
end

function ArenaManyPeopleFightResultPanel.onClickHarmBtn(slot0)
	if slot0.scdata and slot0.scdata.all_hurt_statistics then
		function slot4(slot0, slot1)
			return slot0.type < slot1.type
		end

		table.sort(slot0.scdata.all_hurt_statistics, slot4)

		for slot4, slot5 in ipairs(slot0.scdata.all_hurt_statistics) do
			slot5.atk_name = slot5.a_name
			slot5.target_role_name = slot5.b_name

			if slot5.ret == 1 then
				slot5.result = 1
			elseif slot5.ret == 2 then
				slot5.result = 2
			end
		end

		BattleController:getInstance():openBattleHarmInfoView(true, slot0.scdata.all_hurt_statistics, {
			fight_type = BattleConst.Fight_Type.AreanManyPeople
		})
	end
end

function ArenaManyPeopleFightResultPanel.onClickBtnClose(slot0)
	uv0:openArenaManyPeopleFightResultPanel(false)
end

function ArenaManyPeopleFightResultPanel.openRootWnd(slot0, slot1)
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

	if slot0.fight_text and Config.BattleBgData.data_fight_name[BattleConst.Fight_Type.AreanManyPeople] then
		slot0.fight_text:setString(TI18N("当前战斗：") .. slot2)
	end

	uv0:sender29000()
end

function ArenaManyPeopleFightResultPanel.setData(slot0, slot1)
	if Config.HolidayArenaTeamData.data_elite_level[slot0.scdata.score_lev] then
		slot3 = cc.c4b(86, 46, 13, 255)

		if slot2.icon == "amp_icon_1" or slot2.icon == "amp_icon_2" or slot2.icon == "amp_icon_3" then
			slot3 = cc.c4b(48, 56, 83, 255)
		end

		slot0.level_name:enableOutline(slot3, 2)
		slot0.level_name:setString(slot2.name)
		slot0:playLevelSpine(true, slot2)
	end

	slot3 = {}

	uv0(slot3, {
		type = 1,
		key = TI18N("积分:"),
		left_value = slot0.scdata.new_score,
		right_value = slot0.scdata.new_score - slot0.scdata.score,
		old_value = slot0.scdata.score
	})
	uv0(slot3, {
		type = 2,
		key = TI18N("排名:"),
		left_value = slot0.scdata.new_rank,
		right_value = slot0.scdata.new_rank - slot0.scdata.rank,
		old_value = slot0.scdata.rank
	})
	uv0(slot3, {
		need_chang = true,
		node = slot0.node
	})

	slot9 = {}
	slot10, slot11 = nil

	if slot0.scdata.new_score - slot2.need_score >= 0 then
		if slot0.scdata.score_lev < slot0.scdata.new_score_lev then
			if Config.HolidayArenaTeamData.data_elite_level[slot0.scdata.new_score_lev] then
				slot10, slot11 = slot0:getPercent(slot12, slot0.scdata.new_score - slot12.need_score)
			end
		else
			slot10, slot11 = slot0:getPercent(slot2, slot8)
		end
	elseif slot0.scdata.new_score_lev < slot0.scdata.score_lev then
		if Config.HolidayArenaTeamData.data_elite_level[slot0.scdata.new_score_lev] then
			slot10, slot11 = slot0:getPercent(slot12, slot2.need_score - slot12.need_score + slot8)
		end
	else
		slot10, slot11 = slot0:getPercent(slot2, slot8)
	end

	slot0.end_percent = slot10
	slot0.end_str = slot11

	slot0:showProgressbarEffect(slot2)
	slot0:initShowList(slot3)
end

function ArenaManyPeopleFightResultPanel.getPercent(slot0, slot1, slot2)
	slot3 = 9999

	if Config.HolidayArenaTeamData.data_elite_level[slot1.lev + 1] then
		slot3 = slot4.need_score - slot1.need_score
	end

	slot5, slot6 = nil

	if slot2 >= 0 then
		slot5 = slot2 * 100 / slot3

		if slot3 < slot2 then
			slot2 = slot3
		end

		slot6 = uv0("%s/%s", slot2, slot3)
	else
		slot5 = 0
		slot6 = slot2
	end

	return slot5, slot6
end

function ArenaManyPeopleFightResultPanel.showProgressbarEffect(slot0, slot1)
	if slot0.scdata.result ~= 1 then
		slot2 = -1
	end

	slot3 = 0
	slot5 = slot0.scdata.score - slot1.need_score

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 + uv1
		uv2 = uv2 + uv1
		slot0, slot1 = uv3:getPercent(uv4, uv0)

		if math.abs(uv3.scdata.new_score - uv3.scdata.score) <= math.abs(uv2) then
			slot0 = uv3.end_percent
			slot1 = uv3.end_str

			GlobalTimeTicket:getInstance():remove("emp_fight_result_timer")
		end

		if uv3.scdata.new_score_lev < uv3.scdata.score_lev then
			if Config.HolidayArenaTeamData.data_elite_level[uv3.scdata.new_score_lev] then
				uv0 = uv3.scdata.new_score - slot2.need_score
				slot0, slot1 = uv3:getPercent(slot2, uv0)
			else
				slot0 = 0
				slot1 = 0

				GlobalTimeTicket:getInstance():remove("emp_fight_result_timer")
			end
		end

		uv3:showProgressbar(true, slot0, slot1)
	end, 0.02, 0, "emp_fight_result_timer")
end

function ArenaManyPeopleFightResultPanel.initShowList(slot0, slot1)
	if not slot1 then
		return
	end

	slot4 = 360
	slot5 = #slot1
	slot6 = 144 / slot5

	for slot10 = 1, slot5 do
		slot12 = 90 + (slot10 - 1) * slot6 + slot6 * 0.5

		if slot1[slot10].node ~= nil then
			slot11.node:setPositionY(240)

			if slot11.need_chang then
				slot0.common_90044_0:setContentSize(cc.size(slot0.common_90044_0:getContentSize().width, slot2 + 10))
			else
				slot0.common_90044_0:setContentSize(cc.size(slot13.width, (slot5 - 1) * slot6))
			end
		elseif slot11.score ~= nil then
			createLabel(24, cc.c4b(255, 238, 172, 255), nil, slot4, slot12, slot11.score, slot0.container, 2, cc.p(0.5, 0.5))
		else
			createLabel(24, cc.c4b(255, 238, 172, 255), nil, 200, slot12, uv0("%s %s", slot11.key, slot11.left_value), slot0.container, 2, cc.p(0, 0.5))

			slot14, slot15 = nil
			slot14 = (slot11.type ~= 2 or (slot11.old_value == 0 or slot11.right_value <= 0 or PathTool.getResFrame("common", "common_1087")) and PathTool.getResFrame("common", "common_1086")) and (slot11.right_value < 0 or PathTool.getResFrame("common", "common_1086")) and PathTool.getResFrame("common", "common_1087")
			slot15 = math.abs(slot11.right_value)

			if slot11.not_change then
				createLabel(24, cc.c4b(255, 238, 172, 255), nil, 466, slot12, TI18N("不变"), slot0.container, 2, cc.p(0, 0.5))
			else
				createSprite(slot14, 452, slot12, slot0.container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 0)
				createLabel(24, cc.c4b(255, 238, 172, 255), nil, 466, slot12, tostring(slot15), slot0.container, 2, cc.p(0, 0.5))
			end
		end
	end
end

function ArenaManyPeopleFightResultPanel.showProgressbar(slot0, slot1, slot2, slot3)
	if not slot0.node then
		return
	end

	if slot1 then
		if not slot0.comp_bar then
			slot6 = PathTool.getResFrame("common", "common_90006")
			slot7 = PathTool.getResFrame("common", "common_90082")
			slot0.camp_bar_record_res = slot6
			slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), slot6, cc.size(350, 24), slot0.node, cc.p(0.5, 0.5), 0, 0, true, true)
		end

		if not slot0.comp_bar_label then
			slot0.comp_bar_label = createLabel(16, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot4.width / 2, slot4.height / 2, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))
		end

		slot0.comp_bar_bg:setVisible(true)
		slot0.comp_bar:setPercent(slot2)
		slot0.comp_bar_label:setString(slot3)
	elseif slot0.comp_bar_bg then
		slot0.comp_bar_bg:setVisible(false)
	end
end

function ArenaManyPeopleFightResultPanel.handleEffect(slot0, slot1, slot2)
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

function ArenaManyPeopleFightResultPanel.playLevelSpine(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.level_spine then
			slot0.level_spine:setVisible(false)
		end
	else
		if not slot2 then
			return
		end

		if slot0.level_spine_record == nil or slot0.level_spine_record ~= slot2.icon then
			slot0.level_spine_record = slot2.icon
			slot0.level_spine = createSprite(nil, 0, 3, slot0.level_icon, cc.p(0.5, 0.5))
			slot0.item_load = loadSpriteTextureFromCDN(slot0.level_spine, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", slot2.icon), ResourcesType.single, slot0.item_load)

			slot0.level_spine:setVisible(true)
			slot0:EliteEndAction(slot2)
		end
	end
end

function ArenaManyPeopleFightResultPanel.EliteEndAction(slot0, slot1)
	if slot0.scdata and slot0.scdata.score_lev ~= slot0.scdata.new_score_lev then
		slot0.level_icon:setCascadeOpacityEnabled(true)
		slot0.level_icon:runAction(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			uv0.level_spine:runAction(cc.MoveBy:create(0.5, cc.p(-180, 0)))

			if uv0.level_name then
				uv0.level_name:runAction(cc.MoveBy:create(0.5, cc.p(-180, 0)))
			end
		end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			createSprite(PathTool.getResFrame("common", "common_30014"), 0, 0, uv0.level_icon, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST):runAction(cc.FadeIn:create(1))
		end), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
			if Config.HolidayArenaTeamData.data_elite_level[uv0.scdata.new_score_lev] and slot0.icon then
				slot1 = 0.5

				if uv0.scdata.score_lev < uv0.scdata.new_score_lev then
					uv0.next_lev_spine_bg = createEffectSpine(PathTool.getEffectRes(690), cc.p(0, 3), cc.p(0.5, 0.5), true, PlayerAction.action)

					uv0.level_icon:addChild(uv0.next_lev_spine_bg, 1)
					uv0.next_lev_spine_bg:setPosition(180, 0)
					uv0.next_lev_spine_bg:setOpacity(0)
					uv0.next_lev_spine_bg:runAction(cc.FadeIn:create(1))
				end

				uv0.next_lev_spine = createSprite(nil, 0, 3, uv0.level_icon, cc.p(0.5, 0.5), nil, 10)
				uv0.item_load_2 = loadSpriteTextureFromCDN(uv0.next_lev_spine, PathTool.getPlistImgForDownLoad("arenampmatch/arenampmatch_icon", slot0.icon), ResourcesType.single, uv0.item_load_2)

				uv0.next_lev_spine:setPositionX(180)
				uv0.next_lev_spine:setOpacity(0)
				uv0.next_lev_spine:runAction(cc.FadeIn:create(slot1))
				createLabel(30, cc.c4b(255, 255, 255, 255), cc.c4b(0, 0, 0, 255), 0, 0, "", uv0.level_icon, 2, cc.p(0.5, 0.5)):setLocalZOrder(10)

				slot5 = cc.c4b(86, 46, 13, 255)

				if slot0.icon == "amp_icon_1" or slot0.icon == "amp_icon_2" or slot0.icon == "amp_icon_3" then
					slot5 = cc.c4b(48, 56, 83, 255)
				end

				slot4:enableOutline(slot5, 2)
				slot4:setString(slot0.name)
				slot4:setPosition(180, -60)
				slot4:setOpacity(0)
				slot4:runAction(cc.FadeIn:create(slot1))
			end
		end)))
	end
end

function ArenaManyPeopleFightResultPanel.close_callback(slot0)
	slot0:handleEffect(false)
	slot0:playLevelSpine(false)

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

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_load_2 then
		slot0.item_load_2:DeleteMe()

		slot0.item_load_2 = nil
	end

	GlobalTimeTicket:getInstance():remove("emp_fight_result_timer")
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	uv0:openArenaManyPeopleFightResultPanel(false)
end
