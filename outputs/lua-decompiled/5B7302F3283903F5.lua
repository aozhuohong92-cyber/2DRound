StarTowerResultWindow = StarTowerResultWindow or BaseClass(BaseView)

function StarTowerResultWindow.__init(slot0, slot1, slot2)
	slot0.result = slot1
	slot0.x = 100
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.fight_type = slot2
	slot0.is_running = true
	slot0.partner_list = {}
	slot0.item_list = {}
	slot0.dungeon_data = data
	slot0.cur_round = round
	slot0.total_round = total_round
	slot0.is_stop = false
	slot0.is_open_box = false
	slot0.win_type = WinType.Tips
	slot0.layout_name = "battle/battle_result_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.effect_list = {}
	slot0._boolClose = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
	slot0.star = 0
end

function StarTowerResultWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0:setData(slot1, slot2, slot3)
end

function StarTowerResultWindow.open_callback(slot0)
	slot1 = ""

	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.Sprite_1 = slot0.source_container:getChildByName("Sprite_1")

	if slot0.sprite_1_load == nil then
		slot0.sprite_1_load = loadSpriteTextureFromCDN(slot0.Sprite_1, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_97"), ResourcesType.single, slot0.sprite_1_load)
	end

	slot0.Sprite_2 = slot0.source_container:getChildByName("Sprite_2")

	if slot0.sprite_2_load == nil then
		slot0.sprite_2_load = loadSpriteTextureFromCDN(slot0.Sprite_2, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_98"), ResourcesType.single, slot0.sprite_2_load)
	end

	slot0.title_container = slot0.source_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	slot0:handleEffect(true)

	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 420), nil, nil, 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.root_wnd:addChild(slot0.time_label)

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 455, "", slot0.source_container, nil, cc.p(0.5, 0.5))

	createSprite(PathTool.getResFrame("common", "common_90044"), 360, 415, slot0.source_container, cc.p(0.5, 0.5)):setScaleX(5)

	slot0.pass_time = createRichLabel(24, 31, cc.p(0.5, 0.5), cc.p(360, 415), nil, nil, 1000)

	slot0.pass_time:setString(TI18N("通关时间：00:00:00"))
	slot0.source_container:addChild(slot0.pass_time)

	slot0.gain_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(360, 100), nil, nil, 1000)

	slot0.source_container:addChild(slot0.gain_label)

	slot3 = createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(360, 368), nil, nil, 1000)

	slot3:setString(TI18N("获得物品"))
	slot0.source_container:addChild(slot3)
	createSprite(PathTool.getResFrame("common", "common_1094"), 320, 368, slot0.source_container, cc.p(0, 0.5)):setScaleX(-1)

	slot5 = createSprite(PathTool.getResFrame("common", "common_1094"), 400, 368, slot0.source_container, cc.p(0, 0.5))
	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 230, 0, 130, slot0.source_container, ccui.ScrollViewDir.vertical)
	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 - 170, 470)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0._boolClose = true

			StartowerController:getInstance():openResultWindow(false)
		end
	end)

	slot0.cancel_btn = createButton(slot0.root_wnd, TI18N("挑战下一层"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 + 170, 470)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if not uv0.data then
				return
			end

			slot2 = uv0.data.tower or 0

			StartowerController:getInstance():openResultWindow(false)

			uv0._boolClose = true

			if uv0.isCanNext then
				StartowerController:getInstance():sender11322(slot2 + 1)

				if uv0.data.count > 0 and slot2 < Config.StarTowerData.data_tower_base_length then
					message(TI18N("已进入下一层战斗"))
				end
			else
				BattleResultReturnMgr:returnByFightType(uv0.fight_type)
			end
		end
	end)
end

function StarTowerResultWindow.register_event(slot0)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function StarTowerResultWindow._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = slot0.fight_type
		})
	end
end

function StarTowerResultWindow.setData(slot0, slot1, slot2, slot3)
	if slot1 then
		slot0.data = slot1 or {}
		slot0.dungeon_data = slot3
		slot0.fight_type = slot2
		slot4 = slot1.timer or 0
		slot6 = {}

		for slot11, slot12 in ipairs(slot0.data.first_award or {}) do
			slot12.is_first = true

			table.insert({}, slot12)
		end

		for slot11, slot12 in ipairs(slot0.data.award) do
			slot12.is_first = false

			table.insert(slot5, slot12)
		end

		slot8 = ""

		if slot6 and next(slot6 or {}) ~= nil then
			for slot12, slot13 in pairs(slot6) do
				if Config.ItemData.data_get_data(slot13.item_id) then
					slot8 = slot8 .. string.format("<div><img src='%s' scale=0.4 /></div><div fontcolor=#ffffff fontsize=24>+%s            </div>", PathTool.getItemRes(Config.ItemData.data_get_data(slot13.item_id).icon), slot13.num)
				end
			end
		end

		if slot0.gain_label and not tolua.isnull(slot0.gain_label) then
			slot0.gain_label:setString(slot8)
		end

		slot0.reward_list = slot5
		slot0.result = slot0.data.result
		slot0.is_guide = slot0.data.is_guide

		if slot1.is_skip and slot1.is_skip == 1 then
			slot0.pass_time:setString(TI18N("船长的实力过于强大~敌人落荒而逃~"))
			slot0.harm_btn:setVisible(false)
		else
			slot0.pass_time:setString(string.format(TI18N("通关时间：%s"), TimeTool.GetTimeFormat(slot4)))
			slot0.harm_btn:setVisible(true)
		end

		slot0:rewardViewUI()

		if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot9)
		end

		slot0.cancel_btn:setVisible(true)
		slot0.comfirm_btn:setPositionX(slot0.root_wnd:getContentSize().width / 2 - 170)

		if slot0.data.tower then
			slot0.isCanNext = false

			if Config.StarTowerData.data_tower_const.quick_challenge then
				if slot0.data.tower < slot9.val - 1 then
					slot0.isCanNext = false

					slot0.cancel_btn:setVisible(false)
					slot0.comfirm_btn:setPositionX(slot0.root_wnd:getContentSize().width / 2)
				else
					slot0.isCanNext = true

					slot0.cancel_btn:setBtnLabel(TI18N("挑战下一层"))
				end
			end
		end
	end
end

function StarTowerResultWindow.handleEffect(slot0, slot1)
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

function StarTowerResultWindow.rewardViewUI(slot0)
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
		slot10:setBaseData(slot9.item_id, slot9.num)

		if slot9.is_first and slot9.is_first == true then
			slot10:showBiaoQian(true, TI18N("首通"))
		end

		slot10:setGoodsName(Config.ItemData.data_get_data(slot9.item_id).name, nil, nil, 1)
		slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) % slot2 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot8 - 1) / slot2) * (BackPackItem.Height + slot0.space)))
		slot0.scroll_view:addChild(slot10)

		slot0.item_list[slot8] = slot10
	end

	slot0:ItemAciton()
end

function StarTowerResultWindow.ItemAciton(slot0)
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

function StarTowerResultWindow.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			uv1._boolClose = true

			StartowerController:getInstance():openResultWindow(false)
			GlobalTimeTicket:getInstance():remove("close_result_reward")
		end
	end, 1, 0, "close_result_reward")
end

function StarTowerResultWindow.close_callback(slot0)
	if slot0.partner_list then
		for slot4, slot5 in ipairs(slot0.partner_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	slot0.partner_list = {}
	slot0.partner_list = nil

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
			combat_type = BattleConst.Fight_Type.StarTower
		})
	end

	GlobalTimeTicket:getInstance():remove("close_result_reward")

	if slot0._boolClose then
		return
	end

	StartowerController:getInstance():openResultWindow(false)
end
