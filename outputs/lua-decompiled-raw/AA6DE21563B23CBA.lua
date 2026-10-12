GlobalMessageMgr = GlobalMessageMgr or BaseClass(CommonUI)
GlobalMessageMgr.is_hide_message = false
GlobalMessageMgr.Show_Global_Message = "Global_ShowMessage"
GlobalMessageMgr.Show_Type = {
	fade_in_out = 2,
	move_horizontal = 3,
	fade_vertical = 1
}
GlobalMessageMgr.Config = {
	speed = 100,
	max_num = 3,
	delay = 1,
	max_width = 650,
	start_height = SCREEN_HEIGHT * 2 / 3,
	start_width = display.width / 2
}
GlobalMessageMgr.Permanent_Start_Height = SCREEN_HEIGHT * 2 / 3 + 150
GlobalMessageMgr.Permanent_Move_Height = 90

function GlobalMessageMgr.__init(slot0)
	if GlobalMessageMgr.Instance ~= nil then
		error("[GlobalMessageMrg] accempt to create singleton twice!")
	end

	GlobalMessageMgr.Instance = slot0
	slot0.speed = GlobalMessageMgr.Config.speed
	slot0.delay = GlobalMessageMgr.Config.delay
	slot0.per_msg_label = nil
	slot0.msgs = Array.New()
	slot0.vertical_array = Array.New()
	slot0.vertical_array_tmp = {}
	slot0.item_effect_list = {}
end

function GlobalMessageMgr.getInstance(slot0)
	if GlobalMessageMgr.Instance == nil then
		GlobalMessageMgr.New()
	end

	return GlobalMessageMgr.Instance
end

function GlobalMessageMgr.showMoveVertical(slot0, slot1, slot2)
	slot3 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)

	if GlobalMessageMgr.Config.max_num <= slot0.vertical_array:GetSize() then
		table.insert(slot0.vertical_array_tmp, {
			"showMoveVertical",
			{
				slot1,
				slot2,
				delay
			}
		})

		if #slot0.vertical_array_tmp > 10 then
			table.remove(slot0.vertical_array_tmp, 1)
		end

		return
	end

	if string.len(slot1) == 0 then
		return
	end

	slot4 = ccui.Widget:create()

	slot4:setCascadeOpacityEnabled(true)
	slot4:setAnchorPoint(cc.p(0.5, 0))
	slot3:addChild(slot4, 10)

	slot5 = createScale9Sprite(PathTool.getResFrame("common", "common_90056"))

	slot5:setScale9Enabled(true)

	slot4.image = slot5

	slot4:addChild(slot5)

	slot8 = slot0:createhorizontalLabel(string.format("<div fontcolor=#ffda2f fontsize=24 >%s</div>", slot1), Config.ColorData.data_color3[1], GlobalMessageMgr.Config.max_width, 24)

	slot8:setAnchorPoint(0.5, 0.5)
	slot4:addChild(slot8)

	slot9 = slot8:getSize()
	slot11 = math.max(slot9.height + 28, 60)
	slot12 = cc.size(GlobalMessageMgr.Config.max_width, slot11)

	slot5:setContentSize(cc.size(math.max(slot9.width + 50, 500), slot11))
	slot4:setContentSize(slot12)
	slot5:setPosition(cc.p(slot12.width / 2, slot12.height / 2))
	slot8:setPosition(cc.p(slot12.width / 2, slot12.height / 2))

	function slot14()
		doRemoveFromParent(uv0.vertical_array:PopFront().item)

		if #uv0.vertical_array_tmp > 0 and type(uv0[table.remove(uv0.vertical_array_tmp, 1)[1]]) == "function" then
			uv0[slot2[1]](uv0, unpack(slot2[2]))
		end
	end

	slot15 = 2

	slot0.vertical_array:PushBack({
		msg = slot1,
		delay_time = slot15,
		item = slot4
	})
	slot0:sortPosition()
	delayRun(slot4.image, slot15, function ()
		uv0()
	end)
end

function GlobalMessageMgr.sortPosition(slot0)
	slot1 = 0
	slot2 = 0

	if slot0.vertical_array:GetSize() > 0 then
		slot4 = GlobalMessageMgr.Config.start_height
		slot5 = SCREEN_WIDTH / 2
		slot6 = slot0.vertical_array:Get(slot3 - 1).item:getContentSize().height
		slot7 = nil

		for slot11 = slot0.vertical_array:GetSize(), 1, -1 do
			if tolua.isnull(slot0.vertical_array:Get(slot11 - 1).item) then
				return
			end

			doStopAllActions(slot13)

			if slot3 == slot11 then
				slot13:setPosition(cc.p(slot5, slot4))

				slot7 = slot4 + slot13:getContentSize().height
			else
				slot13:setPosition(cc.p(slot5, slot7))

				slot7 = slot7 + slot13:getContentSize().height
			end

			slot13.action = slot13:runAction(cc.MoveBy:create(0.5, cc.p(0, slot6)))
		end
	end
end

function GlobalMessageMgr.showMoveHorizontal(slot0, slot1, slot2)
	if tolua.isnull(ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)) then
		return
	end

	if slot0.per_bg_icon == nil then
		slot0.per_bg_icon = createScale9Sprite(PathTool.getResFrame("common", "common_90056"))

		slot0.per_bg_icon:setScale9Enabled(true)
		slot0.per_bg_icon:setAnchorPoint(0.5, 1)
		slot0.per_bg_icon:setContentSize(cc.size(682, 38))
		slot3:addChild(slot0.per_bg_icon)
		slot0.per_bg_icon:setPosition(cc.p(SCREEN_WIDTH / 2, display.getTop() - 55))
	end

	if slot0.msg_save_arr == nil then
		slot0.msg_save_arr = Array.New()
	end

	function slot6(slot0, slot1)
		slot2 = uv0:createhorizontalLabel(string.gsub(slot0, "fontsize=%d+", "fontsize = 15"), slot1, 3000, 20)

		slot2:setAnchorPoint(cc.p(0, 0.5))
		slot2:setPosition(cc.p(0, -uv1.height / 2))
		uv0.per_bg_icon:addChild(slot2)

		return slot2
	end

	if slot0.msg_save_arr:GetSize() >= 5 then
		slot0.msg_save_arr:PopFront()
	end

	slot0.msg_save_arr:PushBack({
		delay_time = 3,
		msg = slot1,
		color = slot2
	})

	if slot0.has_msg_moveing == true then
		return
	end

	function ()
		uv0.has_msg_moveing = false

		if not tolua.isnull(uv0.per_move_msg_word) then
			doRemoveFromParent(uv0.per_move_msg_word)

			uv0.per_move_msg_word = nil
		end

		if uv0.msg_save_arr:GetSize() > 0 then
			uv0.has_msg_moveing = true
			slot0 = uv0.msg_save_arr:PopFront()
			slot1 = uv1(slot0.msg, slot0.color)
			uv0.per_move_msg_word = slot1
			slot3 = nil

			if uv2.width < slot1:getSize().width then
				slot1:setPositionX(0)

				slot7 = cc.DelayTime:create(1)
				slot3 = cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot1:getPositionX(), uv2.height / 2)), slot7, cc.MoveTo:create(slot0.delay_time or 3, cc.p(uv2.width - slot4.width - 5, uv2.height / 2)), slot7, cc.CallFunc:create(uv3))
			else
				slot1:setPositionX(uv2.width / 2 - slot4.width / 2)

				slot3 = cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot1:getPositionX(), uv2.height / 2)), cc.DelayTime:create(slot2), cc.CallFunc:create(uv3))
			end

			slot1:runAction(slot3)
		else
			uv0.msg_save_arr = nil

			if uv0.per_bg_icon then
				doRemoveFromParent(uv0.per_bg_icon)

				uv0.per_bg_icon = nil
			end
		end
	end()
end

function GlobalMessageMgr.showPermanentMsg(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.permanentMsg then
			slot0.permanentMsg = ccui.Widget:create()

			slot0.permanentMsg:setCascadeOpacityEnabled(true)
			slot0.permanentMsg:setAnchorPoint(cc.p(0.5, 0))
			slot0.permanentMsg:setPosition(cc.p(SCREEN_WIDTH / 2, GlobalMessageMgr.Permanent_Start_Height))
			slot0.permanentMsg:setOpacity(0)
			ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.permanentMsg, 10)

			slot4 = createScale9Sprite(PathTool.getResFrame("common", "common_90056"))

			slot4:setScale9Enabled(true)
			slot4:setContentSize(cc.size(500, 60))

			slot0.permanentMsg.image = slot4

			slot0.permanentMsg:addChild(slot4)

			slot6 = slot0:createhorizontalLabel(string.format("<div fontcolor=#ffda2f fontsize=24 >%s</div>", slot2), Config.ColorData.data_color3[1], GlobalMessageMgr.Config.max_width, 24)

			slot6:setAnchorPoint(0.5, 0.5)

			slot0.permanentMsg.label = slot6

			slot0.permanentMsg:addChild(slot6)

			slot10 = cc.size(GlobalMessageMgr.Config.max_width, math.max(slot6:getSize().height + 20, slot4:getContentSize().height))

			slot0.permanentMsg:setContentSize(slot10)
			slot4:setPosition(cc.p(slot10.width / 2, slot10.height / 2))
			slot6:setPosition(cc.p(slot10.width / 2, slot10.height / 2))
		end

		if slot0.permanentMsg and slot0.permanentMsg.label then
			slot0.permanentMsg:setOpacity(0)
			slot0.permanentMsg:stopAllActions()
			slot0.permanentMsg:setPosition(cc.p(SCREEN_WIDTH / 2, GlobalMessageMgr.Permanent_Start_Height))
			slot0.permanentMsg:runAction(cc.Spawn:create(cc.MoveBy:create(0.4, cc.p(0, GlobalMessageMgr.Permanent_Move_Height)), cc.FadeIn:create(0.4)))
			slot0.permanentMsg.label:setString(slot2)
		end
	elseif slot0.permanentMsg then
		slot0.permanentMsg:stopAllActions()
		slot0.permanentMsg:removeAllChildren()
		slot0.permanentMsg:removeFromParent()

		slot0.permanentMsg = nil
	end
end

function GlobalMessageMgr.ItemEffectMove(slot0, slot1, slot2)
	slot3 = AdventureController:getInstance():getBackBtnPos()
	slot4 = 1
	slot5 = cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

	if slot2 == 2 then
		slot5 = cc.p(0, 0)
		slot3 = MainuiController:getInstance():getBackPackBtnPos()
		slot4 = -1
	end

	if not slot3 then
		return
	end

	function slot6(slot0)
		if uv0.item_effect_list and next(uv0.item_effect_list or {}) ~= nil and uv0.item_effect_list[slot0] then
			if uv0.item_effect_list[slot0].item_effect_2 then
				uv0.item_effect_list[slot0].item_effect_2:runAction(cc.RemoveSelf:create(true))

				uv0.item_effect_list[slot0].item_effect_2 = nil
			end

			doStopAllActions(uv0.item_effect_list[slot0])
			uv0.item_effect_list[slot0]:removeAllChildren()
			uv0.item_effect_list[slot0]:removeFromParent()

			uv0.item_effect_list[slot0] = nil
		end
	end

	if slot3 and slot1 == true then
		slot7 = {
			x = slot5.x - slot3.x,
			y = slot5.y - slot3.y
		}
		slot8 = math.atan2(slot7.y, slot7.x) * 180 / math.pi

		if not slot0.first_effect and not tolua.isnull(ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)) then
			slot0.first_effect = createEffectSpine(PathTool.getEffectRes(251), cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot9:addChild(slot0.first_effect)
			slot0.first_effect:registerSpineEventHandler(function ()
				if uv0.first_effect then
					uv0.first_effect:runAction(cc.RemoveSelf:create(true))

					uv0.first_effect = nil
				end
			end, sp.EventType.ANIMATION_COMPLETE)
		end

		if not slot0.item_effect_list[slot2] then
			slot9 = ccui.Layout:create()

			slot9:setCascadeOpacityEnabled(true)
			slot9:setAnchorPoint(cc.p(0.5, 0.5))
			slot9:setPosition(cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))
			ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot9)

			slot0.item_effect_list[slot2] = slot9
			slot11 = "action2"

			if not tolua.isnull(slot0.item_effect_list[slot2]) then
				slot0.item_effect_list[slot2].item_effect_2 = createEffectSpine(PathTool.getEffectRes(252), cc.p(0, 0), cc.p(0.5, 0.5), false, PlayerAction.action_1)

				slot0.item_effect_list[slot2].item_effect_2:setRotation(slot8)
				slot0.item_effect_list[slot2]:addChild(slot0.item_effect_list[slot2].item_effect_2)
			end
		end

		if slot0.item_effect_list and next(slot0.item_effect_list or {}) ~= nil and slot0.item_effect_list[slot2] then
			doStopAllActions(slot0.item_effect_list[slot2])
			slot0.item_effect_list[slot2]:setOpacity(255)

			slot9 = cc.DelayTime:create(0.5)

			slot0.item_effect_list[slot2]:runAction(cc.Sequence:create(cc.MoveTo:create(0.8, cc.p(slot3.x, slot3.y)), cc.CallFunc:create(function ()
				uv0.item_effect_list[uv1].item_effect_2:setToSetupPose()
				uv0.item_effect_list[uv1].item_effect_2:setAnimation(0, PlayerAction.action_2, false)
			end), cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
				uv0(uv1)
			end)))
		end
	else
		slot6(slot2)
	end
end

function GlobalMessageMgr.PowerMove(slot0, slot1, slot2, slot3, slot4)
	slot6 = tonumber(slot1) or 0
	slot7 = tonumber(slot3) or 0
	slot9 = cc.size(700, 150)

	if not slot0.power_container then
		slot0.power_container = ccui.Widget:create()

		slot0.power_container:setCascadeOpacityEnabled(true)
		slot0.power_container:setContentSize(slot9)
		slot0.power_container:setAnchorPoint(cc.p(0.5, 0))
		slot0.power_container:setPosition(cc.p(SCREEN_WIDTH / 2, 920))
		ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.power_container)
		createSprite(PathTool.getResFrame("mainui", "mainui_1035"), slot9.width / 2, slot9.height / 2, slot0.power_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST):setScaleX(1.6)

		slot14 = createSprite(slot2 or PathTool.getResFrame("common", "txt_cn_common_90002"), 140 + ((slot4 or {}).res_offset_x or 0), 80, slot0.power_container, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST)
		slot0.power = CommonNum.new(23, slot0.power_container, 0, 0, cc.p(0, 0.5))

		slot0.power:setPosition(cc.p(310, 100))

		slot0.add_num = createLabel(50, cc.c4b(149, 244, 82, 255), cc.c4b(23, 65, 0, 255), 310, 50, "", slot0.power_container, 1, cc.p(0, 0))

		slot0.power_container:addChild(createEffectSpine(PathTool.getEffectRes(179), cc.p(slot9.width / 2, slot9.height / 2), cc.p(0.5, 0.5), true, "action"))
		playOtherSound("c_levelup")

		slot18 = createEffectSpine(PathTool.getEffectRes(171), cc.p(slot9.width / 2, slot9.height / 2), cc.p(0.5, 0.5), false, "action", function ()
			if effect then
				effect:runAction(cc.RemoveSelf:create(true))

				effect = nil
			end
		end)

		slot18:setLocalZOrder(10)
		slot0.power_container:addChild(slot18)
	end

	doStopAllActions(slot0.power_container)

	if tolua.isnull(slot0.add_num) then
		return
	end

	slot0:clearPowerTimer()

	slot10 = 0
	slot11 = slot7

	while slot11 > 0 do
		slot10 = slot10 + 1
		slot11 = math.floor(slot11 / 10)
	end

	if slot10 == 0 then
		slot10 = 1
	end

	slot0.power:setNum(slot7)
	slot0.add_num:setPositionX(slot10 * 26 + 315)

	slot12 = 0

	if not slot0.num_timer then
		slot0.num_timer = GlobalTimeTicket:getInstance():add(function ()
			uv0 = uv0 + 1
			slot0 = math.ceil(uv0 * uv1 / 10)

			uv2.add_num:setString("+" .. math.min(slot0, uv1))

			if uv1 <= slot0 then
				uv2:clearPowerTimer()
			end
		end, 0.05, 10)
	end

	function slot13()
		uv0:clearPowerTimer()

		if uv0.power and not tolua.isnull(uv0.power) then
			uv0.power:DeleteMe()

			uv0.power = nil
		end

		if uv0.power_container and not tolua.isnull(uv0.power_container) then
			uv0.power_container:removeAllChildren()
			uv0.power_container:removeFromParent()

			uv0.power_container = nil
		end
	end

	slot0.power_container:setOpacity(255)
	slot0.power_container:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.FadeOut:create(1), cc.CallFunc:create(function ()
		uv0()
	end)))
end

function GlobalMessageMgr.showPowerMove(slot0, slot1, slot2, slot3, slot4)
	slot0:PowerMove(slot1, slot2, slot3, slot4)
end

function GlobalMessageMgr.showArtTextMove(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot4 = cc.size(700, 150)

	if not slot0.arttxt_container then
		slot0.arttxt_container = ccui.Widget:create()

		slot0.arttxt_container:setCascadeOpacityEnabled(true)
		slot0.arttxt_container:setContentSize(slot4)
		slot0.arttxt_container:setAnchorPoint(cc.p(0.5, 0))
		slot0.arttxt_container:setPosition(cc.p(SCREEN_WIDTH / 2, 920 + (slot2 or 0)))
		ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.arttxt_container)
		createSprite(PathTool.getResFrame("mainui", "mainui_1035"), slot4.width / 2, slot4.height / 2, slot0.arttxt_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST):setScaleX(1.6)

		slot8 = createSprite(slot1, slot4.width / 2, 80, slot0.arttxt_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

		slot0.arttxt_container:addChild(createEffectSpine(PathTool.getEffectRes(179), cc.p(slot4.width / 2, slot4.height / 2), cc.p(0.5, 0.5), true, "action"))
		playOtherSound("c_levelup")

		slot12 = createEffectSpine(PathTool.getEffectRes(171), cc.p(slot4.width / 2, slot4.height / 2), cc.p(0.5, 0.5), false, "action", function ()
			if effect then
				effect:runAction(cc.RemoveSelf:create(true))

				effect = nil
			end
		end)

		slot12:setLocalZOrder(10)
		slot0.arttxt_container:addChild(slot12)
	end

	doStopAllActions(slot0.arttxt_container)

	function slot5()
		if uv0.arttxt_container and not tolua.isnull(uv0.arttxt_container) then
			uv0.arttxt_container:removeAllChildren()
			uv0.arttxt_container:removeFromParent()

			uv0.arttxt_container = nil
		end
	end

	slot0.arttxt_container:setOpacity(255)
	slot0.arttxt_container:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.FadeOut:create(1), cc.CallFunc:create(function ()
		uv0()
	end)))
end

function GlobalMessageMgr.clearPowerTimer(slot0)
	if slot0.num_timer then
		GlobalTimeTicket:getInstance():remove(slot0.num_timer)

		slot0.num_timer = nil
	end
end

function GlobalMessageMgr.showAttrMove(slot0, slot1)
	slot2 = res or PathTool.getResFrame("common", "txt_cn_common_90002")
	slot3 = tonumber(num) or 0
	slot4 = tonumber(old_num) or 0
	slot5 = cc.size(700, 150)

	if not slot0.attr_container then
		slot0.attr_container = ccui.Widget:create()

		slot0.attr_container:setCascadeOpacityEnabled(true)
		slot0.attr_container:setContentSize(slot5)
		slot0.attr_container:setAnchorPoint(cc.p(0.5, 0))
		slot0.attr_container:setPosition(cc.p(SCREEN_WIDTH / 2, 800))
		ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.attr_container)

		slot8 = createSprite(PathTool.getResFrame("mainui", "mainui_1035"), slot5.width / 2, slot5.height / 2, slot0.attr_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

		slot8:setScaleX(1.6)
		slot8:setScaleY(2)
	end

	if not slot0.attr_list then
		slot0.attr_list = {}
	end

	for slot9, slot10 in pairs(slot1 or {}) do
		if not slot0.attr_list[slot9] then
			slot0.attr_list[slot9] = {
				name = createLabel(24, cc.c4b(149, 244, 82, 255), cc.c4b(23, 65, 0, 255), 310, 50, "", slot0.attr_container, 2, cc.p(0, 0)),
				label = createLabel(26, cc.c4b(149, 244, 82, 255), cc.c4b(23, 65, 0, 255), 310, 50, "", slot0.attr_container, 2, cc.p(0, 0))
			}
		end
	end

	function slot6()
		if uv0.attr_container and not tolua.isnull(uv0.attr_container) then
			uv0.attr_container:removeAllChildren()
			uv0.attr_container:removeFromParent()

			uv0.attr_container = nil
			uv0.attr_list = {}
		end
	end

	slot0.attr_container:stopAllActions()
	slot0.attr_container:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.FadeOut:create(1), cc.CallFunc:create(function ()
		if uv0.num_load then
			uv0.num_load:DeleteMe()

			uv0.num_load = nil
		end

		uv1()
	end)))
end

function GlobalMessageMgr.createhorizontalLabel(slot0, slot1, slot2, slot3, slot4)
	slot6 = createRichLabel(slot4, slot2 or Config.ColorData.data_color3[2], cc.p(0, 1), cc.p(0, 0), 0, 0, slot3)

	slot6:setString(slot1)

	return slot6
end

function GlobalMessageMgr.__delete(slot0)
	GlobalMessageMgr.Instance = nil
end

function message(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil or slot0 == "" then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	if slot3 == nil then
		slot3 = Config.ColorData.data_color3[1]
	end

	GlobalMessageMgr:getInstance():showMoveVertical(slot0, slot3)
end

function showRichMsg(slot0, slot1, slot2)
	if GlobalMessageMgr:getInstance():isHideMessage() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	GlobalMessageMgr:getInstance():showMoveVertical(slot0, slot1)
end

function showAssetsMsg(slot0, slot1, slot2, slot3)
	if GlobalMessageMgr:getInstance():isHideMessage() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	GlobalMessageMgr:getInstance():showMoveVertical(WordCensor:getInstance():relapceAssetsTag(slot0), slot1)
end

function message2(slot0, slot1)
	if GlobalMessageMgr:getInstance():isHideMessage() then
		return
	end

	if StoryController:getInstance():getModel():isStoryState() then
		return
	end

	if slot1 == nil then
		slot1 = Config.ColorData.data_color3[1]
	end

	GlobalMessageMgr:getInstance():showMoveVertical(slot0, slot1)
end

function showHorizontalMsg(slot0, slot1, slot2, slot3)
	GlobalMessageMgr:getInstance():showMoveHorizontal(slot0, slot2)
end

function GlobalMessageMgr.isHideMessage(slot0)
	return slot0.is_hide_message
end

function GlobalMessageMgr.setHideMessage(slot0, slot1)
	slot0.is_hide_message = slot1
end
