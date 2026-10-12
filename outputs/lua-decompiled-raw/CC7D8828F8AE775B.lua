GuildbossResultWindow = GuildbossResultWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()
slot2 = string.format

function GuildbossResultWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Tips
	slot0.is_full_screen = false
	slot0.effect_cache_list = {}
	slot0.layout_name = "guildboss/guildboss_result_window"
	slot0.is_csb_action = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		}
	}
	slot0.fight_type = BattleConst.Fight_Type.GuildDun
end

function GuildbossResultWindow.open_callback(slot0)
	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1
	slot0.title_container = slot0.root_wnd:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 400, "", slot1, nil, cc.p(0.5, 0.5))
	slot0.dps_list_btn = slot1:getChildByName("dps_list_btn")
	slot0.harm_btn = slot1:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.best_title_sp = slot1:getChildByName("Sprite_7")

	slot0.best_title_sp:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.partner_item = HeroExhibitionItem.new(1, false)

	slot0.partner_item:setPosition(165, 223)
	slot1:addChild(slot0.partner_item)

	slot0.dps_value = slot1:getChildByName("dps_value")
	slot0.container = slot1
end

function GuildbossResultWindow.onCloseBtn(slot0)
	uv0:openGuildbossResultWindow(false)

	if slot0.fight_type == BattleConst.Fight_Type.SandybeachBossFight then
		GlobalEvent:getInstance():Fire(ActionEvent.Aandybeach_Boss_Fight_Result_Close)
	end
end

function GuildbossResultWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:onCloseBtn()
		end
	end)
	slot0.dps_list_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openGuildbossResultDpsRankWindow(true, uv1.data)
		end
	end)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function GuildbossResultWindow._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = slot0.fight_type
		})
	end
end

function GuildbossResultWindow.openRootWnd(slot0, slot1, slot2)
	slot0.fight_type = slot2 or BattleConst.Fight_Type.GuildDun

	slot0:handleEffect(true)

	if slot1 ~= nil then
		slot0.data = slot1

		slot0.dps_value:setString(string.format(TI18N("总伤害：%s"), slot1.all_dps))

		slot3 = nil

		if slot1.best_partner ~= 0 then
			slot3 = HeroController:getInstance():getModel():getHeroById(slot1.best_partner)
		end

		if slot3 then
			slot0.partner_item:setData(slot3)
		end

		if slot0.fight_type == BattleConst.Fight_Type.GuildDun or slot0.fight_type == BattleConst.Fight_Type.MonopolyBoss then
			slot0:createRewardsList(slot1.award_list)
		elseif slot0.fight_type == BattleConst.Fight_Type.SandybeachBossFight then
			slot0:createSandybeachBossFighRewardsList(slot1)
		elseif slot0.fight_type == BattleConst.Fight_Type.PlanesWar then
			slot0.partner_item:setVisible(false)
			slot0.dps_list_btn:setVisible(false)
			slot0.best_title_sp:setVisible(false)
			slot0:createPlanesAwardList(slot1.award_list)
		end

		slot0.harm_btn:setVisible(true)

		if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot4)
		end
	end
end

function GuildbossResultWindow.createRewardsList(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = nil
	slot3 = 0
	slot4 = nil
	slot5 = 1
	slot6 = ""

	for slot10, slot11 in ipairs(slot1) do
		if Config.ItemData.data_get_data(slot11.bid) then
			slot0.container:addChild(createRichLabel(24, 190, cc.p(0, 0.5), cc.p(266, 251 - (slot5 - 1) * 50), nil, , 500))
			slot2:setString(string.format("%s%s：<img src=%s visible=true scale=0.4 /> +%s", TI18N("获得"), (slot4.id ~= Config.ItemData.data_assets_label2id.guild or TI18N("贡献")) and slot4.name, PathTool.getItemRes(slot4.icon), slot11.num))

			slot5 = slot5 + 1
		end
	end
end

function GuildbossResultWindow.createSandybeachBossFighRewardsList(slot0, slot1)
	slot6 = "战胜积分:"

	for slot6, slot7 in ipairs({
		{
			name = TI18N("伤害积分:"),
			score = slot1.dps_score
		},
		{
			name = TI18N(slot6),
			score = slot1.kill_score
		}
	}) do
		slot8 = nil

		if (slot0.fight_type ~= BattleConst.Fight_Type.SandybeachBossFight or Config.ItemData.data_get_data(80228)) and Config.ItemData.data_get_data(1) then
			slot10 = createRichLabel(24, 190, cc.p(0, 0.5), cc.p(266, 266 - (slot6 - 1) * 50), nil, , 500)

			slot0.container:addChild(slot10)
			slot10:setString(string.format("%s <img src=%s visible=true scale=0.4 /> +%s", slot7.name, PathTool.getItemRes(slot8.icon), slot7.score))
		end
	end
end

function GuildbossResultWindow.createPlanesAwardList(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if not slot0.award_scroll_view then
		slot0.award_scroll_view = createScrollView(SCREEN_WIDTH, 210, 0, 64, slot0.container, ccui.ScrollViewDir.vertical)
	end

	slot2 = #slot1
	slot3 = 4
	slot5 = 30

	slot0.award_scroll_view:setInnerContainerSize(cc.size(slot0.award_scroll_view:getContentSize().width, math.max(slot5 + (slot5 + BackPackItem.Height) * math.ceil(slot2 / slot3), slot0.award_scroll_view:getContentSize().height)))

	if slot3 <= slot2 then
		slot2 = slot3
	end

	slot8 = (slot0.award_scroll_view:getContentSize().width - (slot2 * BackPackItem.Width + (slot2 - 1) * slot5)) * 0.5
	slot9 = 0
	slot9 = slot4 == 1 and slot6 * 0.5 or slot6 - slot5 - BackPackItem.Height * 0.5
	slot0.item_list = slot0.item_list or {}

	for slot13, slot14 in ipairs(slot1) do
		if slot14.bid and slot14.num then
			BackPackItem.new(true, true):setBaseData(slot14.bid, slot14.num)

			if Config.ItemData.data_get_data(slot14.bid) then
				slot15:setGoodsName(slot16.name, nil, , 1)
			end

			if slot14.bid == 25 and PlanesafkController:getInstance():getModel():isHolidayOpen() then
				slot15:holidHeroExpeditTag(true, TI18N("限时提升"))
			end

			slot15:setPosition(cc.p(slot8 + BackPackItem.Width * 0.5 + (slot13 - 1) % slot3 * (BackPackItem.Width + slot5), slot9 - math.floor((slot13 - 1) / slot3) * (BackPackItem.Height + slot5) + 20))
			slot15:setDefaultTip()
			slot0.award_scroll_view:addChild(slot15)

			slot0.item_list[slot13] = slot15
		end
	end
end

function GuildbossResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function GuildbossResultWindow.close_callback(slot0)
	slot0.container:stopAllActions()

	if slot0.partner_item then
		slot0.partner_item:DeleteMe()

		slot0.partner_item = nil
	end

	slot0:handleEffect(false)

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.fight_type == BattleConst.Fight_Type.PlanesWar and slot0.data then
		PlanesafkController:getInstance():initiativeTriggerEvtByIndex(slot0.data.line, slot0.data.index)
	end

	uv0:openGuildbossResultWindow(false)
end
