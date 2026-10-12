ActionyearmonsterResultPanel = ActionyearmonsterResultPanel or BaseClass(BaseView)

function ActionyearmonsterResultPanel.__init(slot0, slot1)
	slot0.win_type = WinType.Tips
	slot0.layout_name = "battle/battle_result_view"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.effect_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("battle", "battle"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster_result"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionwhitedaymonster", "actionwhitedaymonster"),
			type = ResourcesType.plist
		}
	}
	slot0.fight_type = slot1 or BattleConst.Fight_Type.YearMonsterWar
	slot0.item_list = {}
end

function ActionyearmonsterResultPanel.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ActionyearmonsterResultPanel.open_callback(slot0)
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

	slot2 = 80
	slot3 = slot0.source_container:getChildByName("Sprite_3")
	slot4 = slot0.source_container:getChildByName("Sprite_4")

	slot0.Sprite_2:setPositionY(slot0.Sprite_2:getPositionY() - slot2)
	slot3:setPositionY(slot3:getPositionY() - slot2)
	slot4:setPositionY(slot4:getPositionY() - slot2)

	slot0.actionyearmonster_hp_progress = createCSBNote(PathTool.getTargetCSB("actionyearmonster/actionyearmonster_hp_progress"))

	slot0.actionyearmonster_hp_progress:setPosition(0, 315)
	slot0.source_container:addChild(slot0.actionyearmonster_hp_progress)

	progress_container = slot0.actionyearmonster_hp_progress:getChildByName("progress_container")
	slot0.progress_container = progress_container
	slot0.progress = progress_container:getChildByName("progress")

	slot0.progress:setZOrder(4)

	slot0.hp_count = progress_container:getChildByName("hp_count")

	slot0.hp_count:setZOrder(4)

	slot0.box_lev = progress_container:getChildByName("box_lev")

	slot0.box_lev:setZOrder(4)

	slot0.progress_box = progress_container:getChildByName("box")

	slot0.progress_box:setVisible(false)
	progress_container:getChildByName("box_bg"):setZOrder(3)
	progress_container:getChildByName("Image_1"):setZOrder(3)
	progress_container:getChildByName("Image_2"):setZOrder(3)

	slot0.head_panel = progress_container:getChildByName("head_panel")
	slot0.head_bg = slot0.head_panel:getChildByName("head_bg")
	slot0.head_bg_0 = slot0.head_panel:getChildByName("head_bg_0")
	slot0.fight_text = createLabel(24, cc.c4b(255, 238, 172, 255), nil, 360, 820, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.time_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2 + 5, 420 - slot2), nil, nil, 1000)

	slot0.time_label:setString(TI18N("10秒后关闭"))
	slot0.root_wnd:addChild(slot0.time_label)
	slot0:createComfirmAndCancelBtn(slot2)

	slot0.harm_btn = slot0.source_container:getChildByName("harm_btn")

	slot0.harm_btn:setVisible(false)
	slot0.harm_btn:getChildByName("harm_lab"):setString(TI18N("数据统计"))

	slot8 = createRichLabel(22, 31, cc.p(0.5, 0.5), cc.p(slot0.root_wnd:getContentSize().width / 2, 688), nil, nil, 1000)

	slot8:setString(TI18N("获得物品"))
	slot0.root_wnd:addChild(slot8)
	createSprite(PathTool.getResFrame("common", "common_1094"), slot0.root_wnd:getContentSize().width / 2 - 40, 688, slot0.root_wnd, cc.p(0, 0.5)):setScaleX(-1)

	slot10 = createSprite(PathTool.getResFrame("common", "common_1094"), slot0.root_wnd:getContentSize().width / 2 + 40, 688, slot0.root_wnd, cc.p(0, 0.5))
	slot0.scroll_view = createScrollView(SCREEN_WIDTH, 250, 0, 420, slot0.root_wnd, ccui.ScrollViewDir.vertical)
end

function ActionyearmonsterResultPanel.createComfirmBtn(slot0)
	if not slot0.root_wnd then
		return
	end

	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确 定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2, 455)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleController:getInstance():openFinishView(false, uv0.fight_type)
		end
	end)
end

function ActionyearmonsterResultPanel.createComfirmAndCancelBtn(slot0, slot1)
	if not slot0.root_wnd then
		return
	end

	slot0.comfirm_btn = createButton(slot0.root_wnd, TI18N("确 定"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1017"), 24, Config.ColorData.data_color4[1])

	slot0.comfirm_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 - 170, 455 - slot1)
	slot0.comfirm_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.comfirm_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			ActionyearmonsterController:getInstance():openActionyearmonsterResultPanel(false)
		end
	end)

	slot0.cancel_btn = createButton(slot0.root_wnd, TI18N("返回玩法"), 620, 580, cc.size(162, 62), PathTool.getResFrame("common", "common_1018"), 24, Config.ColorData.data_color4[1])

	slot0.cancel_btn:setPosition(slot0.root_wnd:getContentSize().width / 2 + 170, 455 - slot1)
	slot0.cancel_btn:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			BattleResultReturnMgr:returnByFightType(uv0.fight_type)
			ActionyearmonsterController:getInstance():openActionyearmonsterResultPanel(false)
		end
	end)
end

function ActionyearmonsterResultPanel.register_event(slot0)
	registerButtonEventListener(slot0.harm_btn, handler(slot0, slot0._onClickHarmBtn), true)
end

function ActionyearmonsterResultPanel._onClickHarmBtn(slot0)
	if slot0.data and next(slot0.data) ~= nil then
		BattleController:getInstance():openBattleHarmInfoView(true, slot0.data)
	end
end

function ActionyearmonsterResultPanel.setData(slot0, slot1, slot2)
	if slot1 then
		slot0.data = slot1 or {}
		slot0.reward_list = slot0.data.item_rewards or {
			{
				bid = 1,
				num = 1
			}
		}

		slot0:rewardViewUI()

		slot3 = ActionyearmonsterController:getInstance():getModel()

		if slot0.fight_type == BattleConst.Fight_Type.WhiteDayWar then
			slot0:setMonsterHead(ActionController:getInstance():getModel():getWhiteDayHeadId())
		end

		slot5, slot6, slot7 = slot3:getHarmRewardInfo(slot0.data.all_dps, slot0.data.type)

		if slot5 and slot5 > 0 then
			if slot0.fight_type == BattleConst.Fight_Type.WhiteDayWar then
				if slot0.progress_light_img == nil then
					slot0.progress_light_img = createImage(slot0.progress, PathTool.getResFrame("actionwhitedaymonster", "actionwhitedaymonster_2"), 0, slot0.progress:getContentSize().height / 2, cc.p(0.5, 0.5), true, 1, true)
				end

				if slot4 > 0 then
					slot0.progress_light_img:setVisible(true)
					slot0.progress_light_img:setPositionX(slot0.progress:getContentSize().width * slot4 / slot6.max)
				else
					slot0.progress_light_img:setVisible(false)
				end

				slot0.progress:setPercent(slot4 * 100 / slot6.max)
				slot0.hp_count:setString(string.format("%s/%s", slot4, slot6.max))
			else
				slot0.progress:setPercent(slot4 * 100 / slot6.dps_high)
				slot0.hp_count:setString(string.format("%s/%s", slot4, slot6.dps_high))
			end

			slot0.box_lev:setString(slot5)
		end

		slot0:showBoxEffect(true)

		if slot0.data and slot0.data.hurt_statistics then
			slot0.harm_btn:setVisible(true)
		else
			slot0.harm_btn:setVisible(false)
		end

		if slot0.fight_text and Config.BattleBgData.data_fight_name[slot0.fight_type] then
			slot0.fight_text:setString(TI18N("当前战斗：") .. slot8)
		end
	end
end

function ActionyearmonsterResultPanel.showBoxEffect(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.play_effect1 == nil then
			slot0.play_effect1 = createEffectSpine("E27705", cc.p(420, 21), cc.p(0.5, 0.5), true, PlayerAction.action, function ()
			end)

			slot0.progress_container:addChild(slot0.play_effect1, 1)
		end
	elseif slot0.play_effect1 then
		slot0.play_effect1:setVisible(false)
		slot0.play_effect1:removeFromParent()

		slot0.play_effect1 = nil
	end
end

function ActionyearmonsterResultPanel.setMonsterHead(slot0, slot1)
	slot2 = slot0.head_panel:getContentSize()
	slot0.mask_res = PathTool.getResFrame("common", "common_1032")

	if slot0.mask_res ~= nil then
		slot0.mark_bg = createSprite(slot0.mask_res, slot2.width / 2, slot2.height / 2, slot0.head_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
		slot0.mask = createSprite(slot0.mask_res, slot2.width / 2, slot2.height / 2, nil, cc.p(0.5, 0.5))
		slot0.clipNode = cc.ClippingNode:create(slot0.mask)

		slot0.clipNode:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.clipNode:setContentSize(slot2)
		slot0.clipNode:setCascadeOpacityEnabled(true)
		slot0.clipNode:setPosition(slot2.width / 2, slot2.height / 2)
		slot0.clipNode:setAlphaThreshold(0)
		slot0.head_panel:addChild(slot0.clipNode, 2)

		slot0.icon = ccui.ImageView:create()

		slot0.icon:setCascadeOpacityEnabled(true)
		slot0.icon:setAnchorPoint(0.5, 0.5)
		slot0.icon:setPosition(slot2.width / 2, slot2.height / 2 + 2)
		slot0.clipNode:addChild(slot0.icon, 3)
	else
		slot0.icon = ccui.ImageView:create()

		slot0.icon:setCascadeOpacityEnabled(true)
		slot0.icon:setAnchorPoint(0.5, 0.5)
		slot0.icon:setPosition(slot2.width / 2, slot2.height / 2 + 2)
		slot0.head_panel:addChild(slot0.icon)
	end

	slot0.clipNode:setScale(0.9)
	slot0.head_bg_0:setLocalZOrder(99)

	res = PathTool.getHeadIcon(slot1)

	slot0.icon:loadTexture(res, LOADTEXT_TYPE)
end

function ActionyearmonsterResultPanel.handleEffect(slot0, slot1)
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

function ActionyearmonsterResultPanel.rewardViewUI(slot0)
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

			slot10:setScale(1.2)
			slot10:setBaseData(slot9.bid, slot9.num)

			if Config.ItemData.data_get_data(slot9.bid) then
				slot10:setGoodsName(slot11.name, nil, nil, 1)
			end

			slot10:setPosition(cc.p(slot0.start_x + BackPackItem.Width * 0.5 + (slot8 - 1) % slot2 * (BackPackItem.Width + slot0.space), slot0.start_y - math.floor((slot8 - 1) / slot2) * (BackPackItem.Height + slot0.space) + 20))
			slot10:setDefaultTip()
			slot0.scroll_view:addChild(slot10)

			slot0.item_list[slot8] = slot10
		end
	end

	slot0:ItemAciton()
end

function ActionyearmonsterResultPanel.ItemAciton(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		slot1 = 0

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot6 then
				delayRun(slot0.root_wnd, 0.1 * (slot5 - 1), function ()
					uv0:setVisible(true)
					uv0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 0.95), cc.CallFunc:create(function ()
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

function ActionyearmonsterResultPanel.updateTimer(slot0)
	slot1 = 10

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			ActionyearmonsterController:getInstance():openActionyearmonsterResultPanel(false)
		end
	end, 1, 0, "result_timer" .. slot0.fight_type)
end

function ActionyearmonsterResultPanel.close_callback(slot0)
	HeroController:getInstance():openEquipTips(false)
	TipsManager:getInstance():hideTips()
	BattleController:getInstance():openFinishView(false, slot0.fight_type)
	GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW, slot0.fight_type)
	GlobalTimeTicket:getInstance():remove("result_timer" .. slot0.fight_type)
	ActionyearmonsterController:getInstance():openActionyearmonsterResultPanel(false)

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
