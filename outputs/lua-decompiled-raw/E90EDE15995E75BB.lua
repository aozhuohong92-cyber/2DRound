AdventureMineFightResultPanel = AdventureMineFightResultPanel or BaseClass(BaseView)

function AdventureMineFightResultPanel.__init(slot0, slot1, slot2)
	slot0.win_type = WinType.Tips
	slot0.layout_name = "adventure/adventure_mine_fight_result_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
	slot0.effect_list = {}
	slot0.result = slot1
	slot0.fight_type = slot2
	slot0.item_list = {}
end

function AdventureMineFightResultPanel.open_callback(slot0)
	slot1 = ""

	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.source_container:getChildByName("title_container")

	slot0:playEnterAnimatianByObj(slot0.title_container, 2)

	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)

	slot0.Sprite_1 = slot0.source_container:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.source_container:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.Sprite_3 = slot0.source_container:getChildByName("Sprite_3")
	slot0.Sprite_4 = slot0.source_container:getChildByName("Sprite_4")
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 806, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 389), nil, , 1000)

	slot0.root_wnd:addChild(slot0.time_label)

	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("占 领"), 620, 500, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 + 170, 500)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onClickOccupyBtn()
		end
	end)

	slot0.cancel_btn = createButton(slot0.root_wnd, TI18N("放弃占领"), 620, 500, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 - 170, 500)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			AdventureController:getInstance():openAdventureMineFightResultPanel(false)

			if uv0.data then
				AdventureController:getInstance():send20660(uv0.data.floor, uv0.data.room_id)
			end
		end
	end)

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot2 = createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(360, 340), nil, , 1000)

	slot2:setString(TI18N("获得物品"))
	slot0.source_container:addChild(slot2)
	createSprite(PathTool.getResFrame("common", "common_1094"), 320, 340, slot0.source_container, cc.p(0, 0.5)):setScaleX(-1)

	slot4 = createSprite(PathTool.getResFrame("common", "common_1094"), 400, 340, slot0.source_container, cc.p(0, 0.5))
	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 228, 0, 120, slot0.source_container, ccui.ScrollViewDir.vertical)
end

function AdventureMineFightResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function AdventureMineFightResultPanel.onClickOccupyBtn(slot0)
	if not slot0.data then
		return
	end

	HeroController:getInstance():openAdventureMineFormGoFightPanel(true, PartnerConst.Fun_Form.Adventure_Mine_Def, {
		floor = slot0.data.floor,
		room_id = slot0.data.room_id,
		is_occupy = true,
		end_time = slot0.data.end_time
	}, HeroConst.FormShowType.eFormSave)
	AdventureController:getInstance():openAdventureMineFightResultPanel(false)
end

function AdventureMineFightResultPanel._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data)
	end
end

function AdventureMineFightResultPanel.openRootWnd(slot0, slot1, slot2)
	slot0:setData(slot1, slot2)
end

function AdventureMineFightResultPanel.setData(slot0, slot1, slot2)
	if slot1 then
		slot0.data = slot1
		slot0.fight_type = slot2

		slot0.harm_btn:setVisible(true)

		for slot8, slot9 in ipairs(slot0.data.first_award or {}) do
			slot9.is_first = true

			table.insert({}, slot9)
		end

		for slot8, slot9 in ipairs(slot0.data.award) do
			slot9.is_first = false

			table.insert(slot3, slot9)
		end

		slot0.reward_list = slot3
		slot0.result = slot0.data.result

		slot0:rewardViewUI()

		if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot5)
		end
	end
end

function AdventureMineFightResultPanel.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[103], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function AdventureMineFightResultPanel.rewardViewUI(slot0)
	slot1 = #slot0.reward_list
	slot2 = 4
	slot0.row = math.ceil(slot1 / slot2)
	slot0.space = 30
	slot0.max_height = math.max(slot0.space + (slot0.space + BackPackItem.Height) * slot0.row, slot0.scroll_view:getContentSize().height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view:getContentSize().width, slot0.max_height))

	if slot2 <= slot1 then
		slot1 = slot2
	end

	if slot1 == 0 and slot0.desc == nil then
		slot0.desc = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(360, 226), 6, nil, 900)

		slot0.source_container:addChild(slot0.desc)
		slot0.desc:setString(TI18N("该矿已经不能再被掠夺了~"))
	end

	slot0.start_x = (slot0.scroll_view:getContentSize().width - (slot1 * BackPackItem.Width + (slot1 - 1) * slot0.space)) * 0.5

	if slot0.row == 1 then
		slot0.start_y = slot0.max_height * 0.5
	else
		slot0.start_y = slot0.max_height - slot0.space - BackPackItem.Height * 0.5
	end

	for slot8, slot9 in ipairs(slot0.reward_list) do
		slot10 = BackPackItem.new(true, true)

		slot10:setScale(1.3)
		slot10:setBaseData(slot9.item_id, slot9.num)

		if slot9.is_first and slot9.is_first == true then
			slot10:showBiaoQian(true, TI18N("首通"))
		end

		slot10:setGoodsName(Config.ItemData.data_get_data(slot9.item_id).name, nil, , 1)
		slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) % slot2 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot8 - 1) / slot2) * (BackPackItem.Height + slot0.space)))
		slot0.scroll_view:addChild(slot10)

		slot0.item_list[slot8] = slot10
	end

	slot0:ItemAciton()
end

function AdventureMineFightResultPanel.ItemAciton(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		slot1 = 0

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot6 then
				delayRun(slot0.root_wnd, 0.1 * (slot5 - 1), function ()
					uv0:setVisible(true)
					uv0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1), cc.CallFunc:create(function ()
						uv0 = uv0 + 1

						if tableLen(uv1.item_list) <= uv0 then
							uv1:updateTimer()
						end
					end)))
				end)
			end
		end

		return
	end

	slot0:updateTimer()
end

function AdventureMineFightResultPanel.updateTimer(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.end_time - GameNet:getInstance():getTime() <= 0 then
		slot1 = 1
	end

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1
		slot0 = math.ceil(uv0)

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(slot0 .. TI18N("秒后自动放弃占领"))
		end

		if slot0 <= 0 then
			AdventureController:getInstance():openAdventureMineFightResultPanel(false)
			GlobalTimeTicket:getInstance():remove("close_mine_result_reward")
		end
	end, 1, 0, "close_mine_result_reward")

	if slot0.time_label and not tolua.isnull(slot0.time_label) then
		slot0.time_label:setString(math.ceil(slot1) .. TI18N("秒后自动放弃占领"))
	end
end

function AdventureMineFightResultPanel.close_callback(slot0)
	slot0:handleEffect(false)

	if not MainuiController:getInstance():checkIsInDramaUIFight() then
		AudioManager:getInstance():playLastMusic()
	end

	if BattleController:getInstance():getModel():getBattleScene() then
		BattleController:getInstance():getModel():result({
			result = slot0.result,
			combat_type = slot0.fight_type
		})
	end

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	GlobalTimeTicket:getInstance():remove("close_mine_result_reward")
	StartowerController:getInstance():openResultWindow(false)
end
