BattleResultView = BattleResultView or BaseClass(BaseView)

function BattleResultView.__init(slot0, slot1, slot2)
	slot0.result = slot1
	slot0.x = 100
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.fight_type = slot2
	slot0.is_running = true
	slot0.partner_list = {}
	slot0.item_list = {}
	slot0.is_stop = false
	slot0.is_open_box = false
	slot0.win_type = WinType.Tips
	slot0.layout_name = "battle/battle_result_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.effect_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		}
	}
	slot0.star = 0
end

function BattleResultView.openRootWnd(slot0, slot1, slot2)
	slot0:setData(slot1, slot2)
end

function BattleResultView.open_callback(slot0)
	slot1 = ""

	playOtherSound("b_win", AudioManager.AUDIO_TYPE.BATTLE)

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.source_container = slot0.root_wnd:getChildByName("container")
	slot0.title_container = slot0.source_container:getChildByName("title_container")
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

	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 820, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 420), nil, , 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.root_wnd:addChild(slot0.time_label)

	if slot0.fight_type == BattleConst.Fight_Type.DungeonStone then
		slot0:createComfirmBtn()
	else
		slot0:createComfirmAndCancelBtn()
	end

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot2 = createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2, 775), nil, , 1000)

	slot2:setString(TI18N("获得物品"))
	slot0.root_wnd:addChild(slot2)
	createSprite(PathTool.getResFrame("common", "common_1094"), slot0.root_wnd:getContentSize().width / 2 - 40, 790, slot0.root_wnd, cc.p(0, 1)):setScaleX(-1)

	slot4 = createSprite(PathTool.getResFrame("common", "common_1094"), slot0.root_wnd:getContentSize().width / 2 + 40, 790, slot0.root_wnd, cc.p(0, 1))
	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 210, 0, 518, slot0.root_wnd, ccui.ScrollViewDir.vertical)
end

function BattleResultView.createComfirmBtn(slot0)
	if not slot0.root_wnd then
		return
	end

	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确 定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2, 470)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleController:getInstance():openFinishView(false, uv0.fight_type)
		end
	end)
end

function BattleResultView.createComfirmAndCancelBtn(slot0)
	if not slot0.root_wnd then
		return
	end

	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确 定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 - 170, 470)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleController:getInstance():openFinishView(false, uv0.fight_type)
		end
	end)

	slot0.cancel_btn = createButton(slot0.root_wnd, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 + 170, 470)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleResultReturnMgr:returnByFightType(uv0.fight_type)
			BattleController:getInstance():openFinishView(false, uv0.fight_type)
		end
	end)
end

function BattleResultView.register_event(slot0)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function BattleResultView._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data, {
			fight_type = slot0.fight_type
		})
	end
end

function BattleResultView.setData(slot0, slot1, slot2)
	if slot1 then
		slot0.data = slot1 or {}
		slot0.fight_type = slot2
		slot0.reward_list = slot0.data.item_rewards or {}
		slot0.result = slot0.data.result
		slot0.is_guide = slot0.data.is_guide

		slot0:rewardViewUI()

		if slot0.data and slot0.data.hurt_statistics then
			slot0.harm_btn:setVisible(true)
		else
			slot0.harm_btn:setVisible(false)
		end

		if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot3)
		end
	end
end

function BattleResultView.handleEffect(slot0, slot1)
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

function BattleResultView.rewardViewUI(slot0)
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
		if slot9.bid and slot9.num then
			slot10 = BackPackItem.new(true, true)

			slot10:setScale(1.3)
			slot10:setBaseData(slot9.bid, slot9.num)

			if Config.ItemData.data_get_data(slot9.bid) then
				slot10:setGoodsName(slot11.name, nil, , 1)
			end

			slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) % slot2 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot8 - 1) / slot2) * (BackPackItem.Height + slot0.space) + 20))
			slot10:setDefaultTip()
			slot0.scroll_view:addChild(slot10)

			slot0.item_list[slot8] = slot10
		end
	end

	slot0:ItemAciton()
end

function BattleResultView.ItemAciton(slot0)
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

function BattleResultView.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(string.format(TI18N("%s秒后关闭"), math.ceil(uv0)))
		end

		if slot0 <= 0 then
			BattleController:getInstance():openFinishView(false, uv1.fight_type)
		end
	end, 1, 0, "result_timer" .. slot0.fight_type)
end

function BattleResultView.close_callback(slot0)
	HeroController:getInstance():openEquipTips(false)
	TipsManager:getInstance():hideTips()
	BattleController:getInstance():openFinishView(false, slot0.fight_type)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW, slot0.fight_type)
	GlobalTimeTicket:getInstance():remove("result_timer" .. slot0.fight_type)

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}
	slot0.item_list = nil

	slot0:handleEffect(false)

	if slot0.sprite_1_load then
		slot0.sprite_1_load:DeleteMe()

		slot0.sprite_1_load = nil
	end

	if slot0.sprite_2_load then
		slot0.sprite_2_load:DeleteMe()

		slot0.sprite_2_load = nil
	end

	if slot0.fight_type == BattleConst.Fight_Type.Darma then
		GlobalEvent:getInstance():Fire(BattleEvent.MOVE_DRAMA_EVENT, slot0.fight_type)
	end

	if BattleController:getInstance():getModel():getBattleScene() and BattleController:getInstance():getIsSameBattleType(slot0.fight_type) then
		BattleController:getInstance():getModel():result(slot0.data, slot0.is_leave_self)
	end
end
