slot1 = MonopolyController:getInstance():getModel()
slot2 = table.insert
slot3 = 100
slot4 = 200
MonopolyPumpkinWindow = MonopolyPumpkinWindow or BaseClass(BaseView)

function MonopolyPumpkinWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "monopoly/monopoly_pumpkin_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopolyboard"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_big_bg_1"),
			type = ResourcesType.single
		}
	}
	slot0.is_can_close = false
	slot0.cur_result_num = 0
	slot0.cur_ani_time = 0
	slot0.cur_ani_speed = 600
end

function MonopolyPumpkinWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setTouchEnabled(false)
	delayRun(slot0.background, 0.5, function ()
		uv0.background:setTouchEnabled(true)
	end)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1
	slot0.con_size = slot1:getContentSize()

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.bg_sp = slot1:getChildByName("bg_sp")
	slot5 = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_big_bg_1")

	loadSpriteTexture(slot0.bg_sp, slot5, LOADTEXT_TYPE)

	slot0.ani_start_pos_y = slot0.con_size.height * 0.5 - uv0 * 0.5
	slot0.ani_end_pos_y = slot0.con_size.height * 0.5 + uv0 * 0.5
	slot0.num_object_list = {}

	for slot5 = 1, 4 do
		uv1(slot0.num_object_list, {
			num_sp = createSprite(PathTool.getResFrame("monopoly", "monopolyboard_num_" .. slot5, false, "monopolyboard"), 360, slot0.ani_start_pos_y, slot1, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 2),
			num = slot5
		})
	end
end

function MonopolyPumpkinWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickGround), false, 1)
	slot0:addGlobalEvent(MonopolyEvent.Get_Dice_Result_Event, function (slot0)
		uv0.cur_result_num = slot0
	end)
end

function MonopolyPumpkinWindow.onClickGround(slot0)
	if slot0.is_can_close then
		uv0:openMonopolyPumpkinWindow(false)
	elseif slot0.cur_result_num then
		AudioManager:getInstance():removeEffectBySoundId(slot0.scroll_audio_effect)

		slot4 = AudioManager.AUDIO_TYPE.Recruit
		slot5 = "result_01"

		AudioManager:getInstance():playEffect(slot4, slot5, false)

		for slot4, slot5 in ipairs(slot0.num_object_list) do
			slot5.num_sp:stopAllActions()
			slot5.num_sp:setVisible(slot5.num == slot0.cur_result_num)

			if slot5.num == slot0.cur_result_num then
				slot5.num_sp:setPosition(360, slot0.ani_end_pos_y - uv1 * 0.5)
			end
		end

		slot0:handleEffect_1(true, PlayerAction.action_1)
		slot0:handleEffect_2(true, PlayerAction.action_1)

		slot0.is_can_close = true

		slot0:openNumRollTimer(false)
		delayRun(slot0.root_wnd, 1, function ()
			uv0:openMonopolyPumpkinWindow(false)
		end)
	end
end

function MonopolyPumpkinWindow.openRootWnd(slot0)
	slot0.is_can_close = false

	uv0:sender27403(1, 0)
	slot0:startPumpkinPlay()
end

function MonopolyPumpkinWindow.startPumpkinPlay(slot0)
	slot0.scroll_audio_effect = AudioManager:getInstance():playEffectForHandAudoRemove(AudioManager.AUDIO_TYPE.COMMON, "c_scroll", true)

	slot0:showRollAniBySpeed(slot0.cur_ani_speed, true)
	slot0:openNumRollTimer(true)
	slot0:handleEffect_1(true, PlayerAction.action_2)
	slot0:handleEffect_2(true, PlayerAction.action_2)
end

function MonopolyPumpkinWindow.handleEffect_1(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot0.cur_action_name = slot2 or PlayerAction.action_1

		if not tolua.isnull(slot0.container) and slot0.effect_1 == nil then
			slot0.effect_1 = createEffectSpine(Config.EffectData.data_effect_info[1502], cc.p(-25, -280), cc.p(0.5, 0.5), slot3 or false, slot2, handler(slot0, slot0.onEffectCallBack))

			slot0.container:addChild(slot0.effect_1, 1)
		elseif slot0.effect_1 then
			slot0.effect_1:setToSetupPose()
			slot0.effect_1:setAnimation(0, slot2, true)
		end
	elseif slot0.effect_1 then
		slot0.effect_1:clearTracks()
		slot0.effect_1:removeFromParent()

		slot0.effect_1 = nil
	end
end

function MonopolyPumpkinWindow.onEffectCallBack(slot0)
	if slot0.cur_action_name == PlayerAction.action_2 then
		slot0:handleEffect_1(true, PlayerAction.action_3, true)
		slot0:handleEffect_2(true, PlayerAction.action_3, true)
	end
end

function MonopolyPumpkinWindow.handleEffect_2(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not tolua.isnull(slot0.container) and slot0.effect_2 == nil then
			slot0.effect_2 = createEffectSpine(Config.EffectData.data_effect_info[1501], cc.p(-25, -280), cc.p(0.5, 0.5), slot3 or false, slot2 or PlayerAction.action_1)

			slot0.container:addChild(slot0.effect_2, 3)
		elseif slot0.effect_2 then
			slot0.effect_2:setToSetupPose()
			slot0.effect_2:setAnimation(0, slot2, true)
		end
	elseif slot0.effect_2 then
		slot0.effect_2:clearTracks()
		slot0.effect_2:removeFromParent()

		slot0.effect_2 = nil
	end
end

function MonopolyPumpkinWindow.openNumRollTimer(slot0, slot1)
	if slot1 == true then
		if slot0.roll_timer == nil then
			slot0.roll_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.cur_ani_time = uv0.cur_ani_time + 1

				if uv0.cur_ani_time >= 1.5 and uv0.cur_ani_speed ~= 350 then
					uv0:showRollAniBySpeed(350)
				elseif uv0.cur_ani_time >= 2.5 then
					uv0:showRollAniBySpeed(180)

					uv0.ani_over_flag = true

					GlobalTimeTicket:getInstance():remove(uv0.roll_timer)

					uv0.roll_timer = nil
				end
			end, 1)
		end
	elseif slot0.roll_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.roll_timer)

		slot0.roll_timer = nil
	end
end

function MonopolyPumpkinWindow.showRollAniBySpeed(slot0, slot1, slot2)
	slot0.cur_ani_speed = slot1
	slot3 = uv0 / slot1

	for slot7, slot8 in ipairs(slot0.num_object_list) do
		slot8.num_sp:stopAllActions()

		function slot9()
			uv5.num_sp:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(0, cc.p(360, uv0.ani_start_pos_y)), cc.DelayTime:create((#uv0.num_object_list * uv1 - uv2) / uv3), cc.MoveTo:create(uv4 * 0.5, cc.p(360, uv0.ani_end_pos_y - uv2 * 0.5)), cc.CallFunc:create(function ()
				if uv0.ani_over_flag and uv0.cur_result_num == uv1.num then
					uv0:stopAllNumAni()
				end
			end), cc.MoveTo:create(uv4 * 0.5, cc.p(360, uv0.ani_end_pos_y)))))
		end

		slot12 = cc.MoveTo:create((slot0.ani_end_pos_y - slot8.num_sp:getPositionY()) / slot1, cc.p(360, slot0.ani_end_pos_y))
		slot13 = 0

		if slot2 then
			slot13 = (slot7 - 1) * uv1 / slot1
		elseif slot10 == slot0.ani_start_pos_y then
			slot13 = 0

			for slot17 = 1, 3 do
				if slot7 - slot17 < 1 then
					slot18 = slot18 + 4
				end

				if slot0.num_object_list[slot18] and slot19.num_sp:getPositionY() ~= slot0.ani_start_pos_y then
					slot13 = slot17 * uv1 / slot1 - (slot20 - slot0.ani_start_pos_y) / slot1

					break
				end
			end
		end

		slot8.num_sp:runAction(cc.Sequence:create(cc.DelayTime:create(slot13), slot12, cc.CallFunc:create(slot9)))
	end
end

function MonopolyPumpkinWindow.stopAllNumAni(slot0)
	AudioManager:getInstance():removeEffectBySoundId(slot0.scroll_audio_effect)

	slot4 = AudioManager.AUDIO_TYPE.Recruit
	slot5 = "result_01"

	AudioManager:getInstance():playEffect(slot4, slot5, false)

	for slot4, slot5 in ipairs(slot0.num_object_list) do
		slot5.num_sp:stopAllActions()
		slot5.num_sp:setVisible(slot5.num == slot0.cur_result_num)
	end

	slot0:handleEffect_1(true, PlayerAction.action_1, true)
	slot0:handleEffect_2(true, PlayerAction.action_1, true)

	slot0.is_can_close = true

	slot0:openNumRollTimer(false)
	delayRun(slot0.root_wnd, 1, function ()
		uv0:openMonopolyPumpkinWindow(false)
	end)
end

function MonopolyPumpkinWindow.close_callback(slot0)
	AudioManager:getInstance():removeEffectBySoundId(slot0.scroll_audio_effect)
	slot0:handleEffect_1(false)

	slot4 = false

	slot0:handleEffect_2(slot4)

	for slot4, slot5 in ipairs(slot0.num_object_list) do
		slot5.num_sp:stopAllActions()
	end

	if slot0.cur_result_num and slot0.cur_result_num > 0 then
		GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Role_Move_Event, slot0.cur_result_num)
	end

	slot0:openNumRollTimer(false)
	uv0:openMonopolyPumpkinWindow(false)
end
