EndlessTrailBattleView = class("EndlessTrailBattleView", function (...)
	return ccui.Widget:create()
end)
slot0 = Endless_trailController:getInstance()
slot1 = Endless_trailController:getInstance():getModel()
slot2 = string.format

function EndlessTrailBattleView.ctor(slot0, ...)
	slot0:configUI()

	slot0.is_open = false
end

function EndlessTrailBattleView.configUI(slot0, ...)
	slot0.main_size = cc.size(SCREEN_WIDTH, display.height)

	slot0:setContentSize(slot0.main_size)
	slot0:setAnchorPoint(cc.p(0, 1))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_battle_view"))

	slot0:addChild(slot0.root_wnd)

	slot0.top_container = slot0.root_wnd:getChildByName("top_container")

	slot0.top_container:setPositionY(display.getTop(slot0))

	slot0.right_container = slot0.top_container:getChildByName("right_container")

	slot0.right_container:setPositionY(65)

	slot0.return_btn = slot0.right_container:getChildByName("return_btn")
	slot0.backpack_btn = slot0.right_container:getChildByName("backpack_btn")
	slot0.backpack_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot0.backpack_btn:getContentSize().width / 2 - 4, 0), nil, , 800)

	slot0.backpack_btn:addChild(slot0.backpack_label)

	slot0.backpack_red = slot0.backpack_btn:getChildByName("red_point")
	slot0.left_container = slot0.top_container:getChildByName("left_container")

	slot0.left_container:setPositionY(35)

	slot0.container_1 = slot0.left_container:getChildByName("container_1")
	slot0.container_1_width = slot0.container_1:getContentSize().width
	slot0.container_1_height = slot0.container_1:getContentSize().height
	slot0.container_2 = slot0.left_container:getChildByName("container_2")
	slot0.container_2_width = slot0.container_2:getContentSize().width
	slot0.container_2_height = slot0.container_2:getContentSize().height
	slot0.desc_label = createRichLabel(22, 1, cc.p(0, 0.5), cc.p(35, slot0.container_1:getContentSize().height / 2 + 2), nil, , 800)

	slot0.container_1:addChild(slot0.desc_label)

	slot0.desc_label_2 = createRichLabel(22, 1, cc.p(0, 0.5), cc.p(160, slot0.container_1:getContentSize().height / 2 + 2), nil, , 800)

	slot0.container_1:addChild(slot0.desc_label_2)

	slot0.reward_label = createRichLabel(22, 1, cc.p(0, 0.5), cc.p(0, slot0.container_2:getContentSize().height / 2), nil, , 800)

	slot0.container_2:addChild(slot0.reward_label)
	slot0:registerEvent()
	slot0:updateData()
end

function EndlessTrailBattleView.registerEvent(slot0, ...)
	if slot0.return_btn then
		slot0.return_btn:addTouchEventListener(function (slot0, slot1)
			if ccui.TouchEventType.ended == slot1 then
				CommonAlert.show(TI18N("退出后本场战斗将判定为失败，且结束本次挑战并结算奖励，是否确认退出挑战？"), TI18N("我要退出"), function (...)
					BattleController:getInstance():csFightExit()
				end, TI18N("继续挑战"), nil, CommonAlert.type.rich)
			end
		end)
	end

	if slot0.backpack_btn then
		slot0.backpack_btn:addTouchEventListener(function (slot0, slot1)
			if ccui.TouchEventType.ended == slot1 and uv0.backpack_btn then
				uv1:openEndlessRewardTips(true, uv0.backpack_btn)
			end
		end)
	end

	if not slot0.update_battle_data_event then
		slot0.update_battle_data_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_ENDLESSBATTLE_DATA, function (slot0)
			uv0:updateData(slot0)
		end)
	end

	if not slot0.update_first_event then
		slot0.update_first_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_FIRST_DATA, function ()
			slot0 = nil

			if uv0.battle_data then
				slot0 = uv1:getFirstData(uv0.battle_data.type)
			end

			uv0:updateBtnStatus(slot0)
		end)
	end
end

function EndlessTrailBattleView.updateData(slot0, slot1)
	if slot1 or uv0:getEndlessBattleData() then
		slot0.battle_data = slot2
		slot3 = string.format(TI18N("第%s关"), slot2.round)

		slot0:playFightStartEffect(slot2.round)

		slot4 = TI18N("增益效果:")

		if slot2.buff_list and next(slot2.buff_list or {}) ~= nil then
			for slot8, slot9 in ipairs(slot2.buff_list) do
				if Config.EndlessData.data_buff_data[slot9.group_id] and Config.EndlessData.data_buff_data[slot9.group_id][slot9.id] and Config.EndlessData.data_buff_data[slot9.group_id][slot9.id] then
					slot4 = slot4 .. slot10.battle_desc
				end
			end
		else
			slot4 = slot4 .. TI18N("暂无")
		end

		slot0.desc_label_2:setString(slot4)
		slot0.desc_label:setString(slot3)

		slot5 = TI18N("已累计奖励:  ")

		if slot2.acc_reward and next(slot2.acc_reward) then
			for slot9, slot10 in ipairs(slot2.acc_reward) do
				slot5 = slot5 .. uv1(TI18N("<img src=%s visible=true scale=0.35 /> %s "), PathTool.getItemRes(slot10.base_id), slot10.num)
			end
		else
			slot5 = slot2.reward_flag == TRUE and slot5 .. TI18N("当天已达上限,无法再结算奖励") or uv1(TI18N("%s再过%s关开始结算(今日至第%s关)"), slot5, slot2.rest_round or 0, slot2.max_reward_round or 0)
		end

		slot0.reward_label:setString(slot5)
		slot0.container_2:setContentSize(cc.size(math.max(slot0.reward_label:getSize().width, slot0.container_2_width), slot0.container_2_height))
		slot0.container_1:setContentSize(cc.size(math.max(slot0.desc_label:getSize().width, slot0.container_1_width), slot0.container_1_height))
		slot0:updateBtnStatus({
			id = slot0.battle_data.id,
			status = slot0.battle_data.status
		})
	end
end

function EndlessTrailBattleView.playFightStartEffect(slot0, slot1)
	if slot0.cur_round == nil then
		slot0.cur_round = slot1
	end

	if slot0.cur_round == slot1 then
		return
	end

	slot0.cur_round = slot1

	if slot0.effect_container == nil then
		slot0.effect_container = ccui.Layout:create()

		slot0.effect_container:setContentSize(cc.size(470, 80))
		slot0.effect_container:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.effect_container:setPosition(slot0.main_size.width * 0.5, 670)
		slot0.root_wnd:addChild(slot0.effect_container)

		slot0.top_effect = createEffectSpine(PathTool.getEffectRes(323), cc.p(235, 40), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.effect_container:addChild(slot0.top_effect)

		slot0.effect_img_1 = createSprite(PathTool.getResFrame("common", "txt_cn_common_90019"), 173, 45, slot0.effect_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		slot0.effect_img_2 = createSprite(PathTool.getResFrame("common", "txt_cn_common_90020"), 267, 45, slot0.effect_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		slot0.effect_width_1 = slot0.effect_img_1:getContentSize().width
		slot0.effect_width_2 = slot0.effect_img_2:getContentSize().width
		slot0.effect_num = CommonNum.new(26, slot0.effect_container, 1, -18, cc.p(0.5, 0.5))

		slot0.effect_num:setPosition(235, 74)

		slot0.bottom_effect = createEffectSpine(PathTool.getEffectRes(324), cc.p(235, 40), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.effect_container:addChild(slot0.bottom_effect)
	end

	slot0.top_effect:setAnimation(0, PlayerAction.action, false)
	slot0.bottom_effect:setAnimation(0, PlayerAction.action, false)
	slot0.effect_num:setNum(slot1)
	slot0.effect_container:setVisible(true)
	slot0.effect_img_1:setPosition(64, 102)
	slot0.effect_img_2:setPosition(475, 102)
	slot0.effect_img_1:setOpacity(0)
	slot0.effect_img_2:setOpacity(0)
	slot0.effect_num:setOpacity(0)
	slot0.effect_num:setScale(0.5)
	slot0.effect_img_1:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.08, cc.p(235 - slot0.effect_width_1 * 0.5 - 50, 45)), cc.FadeIn:create(0.1)), cc.DelayTime:create(0.3), cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		uv0.effect_container:setVisible(false)
	end)))
	slot0.effect_img_2:runAction(cc.Spawn:create(cc.MoveTo:create(0.08, cc.p(298 + slot0.effect_width_2 * 0.5, 45)), cc.FadeIn:create(0.1)))
	slot0.effect_num:runAction(cc.Spawn:create(cc.ScaleTo:create(0.1, 1), cc.FadeIn:create(0.1)))
end

function EndlessTrailBattleView.updateBtnStatus(slot0, slot1)
	if slot0.battle_data and slot1 and Config.EndlessData.data_first_data[slot0.battle_data.type] and Config.EndlessData.data_first_data[slot0.battle_data.type][slot1.id] and Config.EndlessData.data_first_data[slot0.battle_data.type][slot1.id] then
		slot3 = ""
		slot0.backpack_btn.id = slot1.id

		if slot0.reward_item == nil then
			slot0.reward_item = BackPackItem.new(true, false)

			slot0.reward_item:setAnchorPoint(cc.p(0, 0))
			slot0.reward_item:setScale(0.7)
			slot0.reward_item:setPosition(6, 12)
			slot0.backpack_btn:addChild(slot0.reward_item)
		end

		if slot2.items and slot2.items[1] then
			slot0.reward_item:setBaseData(slot2.items[1][1], slot2.items[1][2])
		end

		if slot1.status == 1 then
			slot0.backpack_btn.status = 1
			slot3 = uv0(TI18N("<div fontcolor=#ffffff, outline=2,#020019>可领取</div>"))

			slot0.reward_item:showItemEffect(true, 165, PlayerAction.action, true, 1.2)
		else
			slot0.backpack_btn.status = 0
			slot3 = uv0(TI18N("<div fontcolor=#fff22a outline=2,#020019>%s</div><div fontcolor=#ffffff, outline=2,#020019>关领取</div>"), slot2.limit_id)

			slot0.reward_item:showItemEffect(false, 165, PlayerAction.action, true)
		end

		slot0.backpack_label:setString(slot3)
	end
end

function EndlessTrailBattleView.open(slot0, ...)
	if BattleController:getInstance():getCtrlBattleScene() then
		slot0.is_open = true

		BattleController:getInstance():getCtrlBattleScene():addExternView(slot0, display.getLeft(BattleController:getInstance():getCtrlBattleScene()), display.getTop(BattleController:getInstance():getCtrlBattleScene()))
		delayRun(slot0.root_wnd, 1, function ()
			uv0:send23902()
		end)
	end
end

function EndlessTrailBattleView.isOpen(slot0, ...)
	return slot0.is_open
end

function EndlessTrailBattleView.close(slot0, ...)
	if slot0.reward_item then
		slot0.reward_item:DeleteMe()

		slot0.reward_item = nil
	end

	if slot0.effect_num then
		slot0.effect_num:DeleteMe()
	end

	slot0.effect_num = nil
	slot0.is_open = false

	if slot0.update_battle_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_battle_data_event)

		slot0.update_battle_data_event = nil
	end

	if slot0.update_first_event then
		GlobalEvent:getInstance():UnBind(slot0.update_first_event)

		slot0.update_first_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
