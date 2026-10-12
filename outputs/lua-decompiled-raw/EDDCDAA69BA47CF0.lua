PractiseTowerResultWindow = PractiseTowerResultWindow or BaseClass(BaseView)

function PractiseTowerResultWindow.__init(slot0, slot1, slot2)
	slot0.result = slot1
	slot0.x = 100
	slot0.fight_type = slot2
	slot0.item_list = {}
	slot0.dungeon_data = data
	slot0.win_type = WinType.Tips
	slot0.layout_name = "battle/battle_result_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
end

function PractiseTowerResultWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0:setData(slot1, slot2, slot3)
end

function PractiseTowerResultWindow.open_callback(slot0)
	slot1 = ""

	if slot0.result == 0 then
		playOtherSound("b_lose", AudioManager.AUDIO_TYPE.BATTLE)
	else
		playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)
	end

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.Sprite_1 = slot0.source_container:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil and slot0.result == 1 then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.source_container:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil and slot0.result == 1 then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.title_container = slot0.source_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)

	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 420), nil, , 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.time_label:setVisible(false)
	slot0.root_wnd:addChild(slot0.time_label)

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 455, "", slot0.source_container, nil, cc.p(0.5, 0.5))
	slot0.tips_lab = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 250, "", slot0.source_container, nil, cc.p(0.5, 0.5))

	if slot0.result == 1 then
		slot0.tips_lab:setVisible(false)
	else
		slot0.tips_lab:setVisible(true)
	end

	slot0.tips_lab:setString(TI18N("            选择重新挑战后将再次挑战本次Boss关卡\n\n（不会额外消耗挑战次数，但本次挑战结果将失效）"))
	createSprite(PathTool.getResFrame("common", "common_90044"), 360, 415, slot0.source_container, cc.p(0.5, 0.5)):setScaleX(5)

	slot0.pass_time = createRichLabel(24, 31, cc.p(0.5, 0.5), cc.p(360, 415), nil, , 1000)

	slot0.pass_time:setString(TI18N("本次造成伤害：0"))
	slot0.source_container:addChild(slot0.pass_time)
	slot0.source_container:addChild(createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(360, 368), nil, , 1000))
	createSprite(PathTool.getResFrame("common", "common_1094"), 320, 368, slot0.source_container, cc.p(0, 0.5)):setScaleX(-1)

	slot5 = createSprite(PathTool.getResFrame("common", "common_1094"), 400, 368, slot0.source_container, cc.p(0, 0.5))
	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 230, 0, 130, slot0.source_container, ccui.ScrollViewDir.vertical)
	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 - 170, 470)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			PractisetowerController:getInstance():openResultWindow(false)
		end
	end)

	slot0.cancel_btn = createButton(slot0.root_wnd, TI18N("重新挑战"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 + 170, 470)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			slot2 = nil

			if Config.HolidayPractiseTowerData.data_tower[uv0.data.number] then
				slot2 = slot3.power
			end

			PractisetowerController:getInstance():getModel():setResetFightId({
				id = uv0.data.number,
				power = slot2
			})
			PractisetowerController:getInstance():sender29103()
		end
	end)

	if slot0.result == 0 then
		slot3:setString(TI18N("战斗提示"))
	else
		slot3:setString(TI18N("获得物品"))
	end

	slot0.fight_num = createLabel(24, cc.c4b(255, 238, 172, 255), nil, slot0.root_wnd:getContentSize().width / 2 + 170, 420, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
end

function PractiseTowerResultWindow.register_event(slot0)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function PractiseTowerResultWindow._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = slot0.fight_type
		})
	end
end

function PractiseTowerResultWindow.setData(slot0, slot1, slot2, slot3)
	if slot1 then
		slot0.data = slot1 or {}
		slot0.dungeon_data = slot3
		slot0.fight_type = slot2
		slot0.reward_list = slot0.data.reward
		slot0.result = slot0.data.flag
		slot0.is_guide = slot0.data.is_guide

		slot0.pass_time:setString(string.format(TI18N("本次造成伤害：%s"), slot1.all_dps or 0))
		slot0.harm_btn:setVisible(true)
		slot0:rewardViewUI()

		if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot5)
		end

		slot0.cancel_btn:setVisible(true)
		slot0.fight_num:setVisible(true)
		slot0.comfirm_btn:setPositionX(slot0.root_wnd:getContentSize().width / 2 - 170)

		if slot0.result == 1 then
			slot0.cancel_btn:setVisible(false)
			slot0.fight_num:setVisible(false)
			slot0.comfirm_btn:setPositionX(slot0.root_wnd:getContentSize().width / 2)
		end

		slot0.fight_num:setString(string.format(TI18N("剩余：%d次"), slot1.last_anew_times))
	end
end

function PractiseTowerResultWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		if slot0.result == 1 then
			slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[103], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2)
		else
			slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[104], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5 + 32), cc.p(0.5, 0.5), false, PlayerAction.action)
		end

		slot0.title_container:addChild(slot0.play_effect, 1)
	end
end

function PractiseTowerResultWindow.rewardViewUI(slot0)
	slot1 = #slot0.reward_list
	slot2 = 4
	slot0.row = math.ceil(slot1 / slot2)
	slot0.space = 30
	slot0.max_height = math.max(slot0.space + (slot0.space + BackPackItem.Height) * slot0.row, slot0.scroll_view:getContentSize().height)

	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view:getContentSize().width, slot0.max_height))

	if slot2 <= slot1 then
		slot1 = slot2
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
		slot10:setBaseData(slot9.base_id, slot9.num)
		slot10:setGoodsName(Config.ItemData.data_get_data(slot9.base_id).name, nil, , 1)
		slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) % slot2 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot8 - 1) / slot2) * (BackPackItem.Height + slot0.space)))
		slot0.scroll_view:addChild(slot10)

		slot0.item_list[slot8] = slot10
	end

	slot0:ItemAciton()
end

function PractiseTowerResultWindow.ItemAciton(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		slot1 = 0

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot6 then
				delayRun(slot0.root_wnd, 0.1 * (slot5 - 1), function ()
					uv0:setVisible(true)
					uv0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 1), cc.CallFunc:create(function ()
						uv0 = uv0 + 1

						if tableLen(uv1.item_list) <= uv0 and uv1.result == 1 then
							uv1:updateTimer()
						end
					end)))
				end)
			end
		end

		return
	end

	if slot0.result == 1 then
		slot0:updateTimer()
	end
end

function PractiseTowerResultWindow.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setVisible(true)
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			PractisetowerController:getInstance():openResultWindow(false)
			GlobalTimeTicket:getInstance():remove("close_result_reward")
		end
	end, 1, 0, "close_result_reward")
end

function PractiseTowerResultWindow.close_callback(slot0)
	slot0:handleEffect(false)

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	if not MainuiController:getInstance():checkIsInDramaUIFight() then
		AudioManager:getInstance():playLastMusic()
	end

	if BattleController:getInstance():getModel():getBattleScene() then
		BattleController:getInstance():getModel():result({
			result = slot0.result,
			combat_type = BattleConst.Fight_Type.PractiseTower
		})
	end

	GlobalTimeTicket:getInstance():remove("close_result_reward")
	PractisetowerController:getInstance():openResultWindow(false)
end
