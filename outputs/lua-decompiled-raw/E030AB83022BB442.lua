BuildItem = BuildItem or BaseClass()
slot0 = MainSceneController:getInstance()

function BuildItem.__init(slot0, slot1, slot2)
	slot0.data = slot1
	slot0.can_click = false
	slot0.is_build = slot2 == BuildItemType.build
	slot0.build_type = slot2

	slot0:createRootwnd()
end

function BuildItem.getData(slot0)
	return slot0.data
end

function BuildItem.createRootwnd(slot0)
	slot0.size = cc.size(83, 80)
	slot0.node = ccui.Widget:create()

	slot0.node:setAnchorPoint(0.5, 0)
	slot0.node:setContentSize(slot0.size)

	if slot0.is_build == true then
		slot0:createBuild()
	elseif slot0.build_type == BuildItemType.effect then
		slot0:createEffect()
	elseif slot0.build_type == BuildItemType.npc then
		slot0:createNpc()
	end
end

function BuildItem.createBuild(slot0)
	slot0.item_icon_bg = createImage(slot0.node, PathTool.getResFrame("centerscene", "scene_icon_bg_1"), slot0.size.width * 0.5, slot0.size.height * 0.5, cc.p(0.5, 0.5), true)
	slot2 = 1

	if slot0.data.config.bid == CenterSceneBuild.crossshow or slot0.data.config.bid == CenterSceneBuild.luckytreasure or slot0.data.config.bid == CenterSceneBuild.startower or slot0.data.config.bid == CenterSceneBuild.adventure or slot0.data.config.bid == CenterSceneBuild.seerpalace or slot0.data.config.bid == CenterSceneBuild.resonate then
		slot2 = -1
	end

	slot0.item_icon_bg:setScaleX(slot2)

	slot0.item_icon = createImage(slot0.node, PathTool.getResFrame("centerscene", string.format("txt_cn_scene_%s", slot0.data.config.res)), slot0.size.width * 0.5, slot0.size.height * 0.5 + 6, cc.p(0.5, 0.5), true)

	slot0.node:setName("guidesign_build_" .. slot0.data.config.bid)
	slot0:fightStatus()
	slot0:setLockStatus()
	slot0:setRedPoint()
	slot0:setGuideEffect()
	slot0:registEvent()
end

function BuildItem.createEffect(slot0)
	slot0.body = createEffectSpine(slot0.data.res, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)

	slot0.node:addChild(slot0.body)
end

function BuildItem.createNpc(slot0)
	slot0.body = createEffectSpine(slot0.data.res, cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action_1, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)

	slot0.node:addChild(slot0.body)

	slot0.is_idle_ing = false

	slot0.body:registerSpineEventHandler(function (slot0)
		if slot0.animation == PlayerAction.action_2 then
			uv0.body:setAnimation(0, PlayerAction.action_1, true)

			uv0.is_idle_ing = false
		end
	end, sp.EventType.ANIMATION_COMPLETE)
	slot0:registNpcEvent()
end

function BuildItem.clickNpcHandler(slot0)
	if slot0.is_idle_ing == true then
		return
	end

	playOtherSound(slot0.data.name, AudioManager.AUDIO_TYPE.COMMON)

	slot0.is_idle_ing = true

	slot0.body:setAnimation(0, PlayerAction.action_2, false)
end

function BuildItem.updateBuildBg(slot0)
	if slot0.item_icon_bg then
		slot0.item_icon_bg:loadTexture(PathTool.getResFrame("centerscene", "scene_icon_bg_1"), LOADTEXT_TYPE_PLIST)
	end
end

function BuildItem.registNpcEvent(slot0)
	slot0.node:setTouchEnabled(true)
	slot0.node:setSwallowTouches(false)
	slot0.node:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				uv0:clickNpcHandler()
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)
end

function BuildItem.registEvent(slot0)
	slot0.node:setTouchEnabled(false)
	slot0.node:setSwallowTouches(false)
	slot0.node:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			uv0:removeFinger()

			if slot2 == true then
				if slot0.guide_call_back ~= nil then
					slot0:guide_call_back()
				end

				uv0:clickHandler()
			end
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		end
	end)

	if slot0.data ~= nil and slot0.update_self_event == nil then
		slot0.update_self_event = slot0.data:Bind(BuildVo.Update_self_event, function (slot0)
			if slot0 == "lock_status" then
				uv0:setLockStatus()
			elseif slot0 == "tips_status" then
				uv0:setRedPoint()
			elseif slot0 == "fight_status" then
				uv0:fightStatus()
			elseif slot0 == "group_id" then
				uv0:setGuideEffect()
			end
		end)
	end

	delayRun(slot0.node, 1.2, function ()
		uv0.node:setTouchEnabled(true)
	end)
end

function BuildItem.clickHandler(slot0)
	if slot0.data ~= nil then
		if IS_IOS_PLATFORM then
			slot1 = "scene[build_item]"
			slot2 = "false"

			if slot0.data.is_lock then
				slot2 = "true"
			end

			nativeSdkClickEvent(slot1, "building_id=" .. slot0.data.config.bid .. ", is_lock=" .. slot2)
		end

		if slot0.data.is_lock == true then
			if slot0.data.desc then
				message(slot0.data.desc)
			else
				message(TI18N("建筑开启数据异常"))
			end
		else
			playButtonSound()

			if slot0.data.group_id ~= 0 then
				uv0:send10956(slot0.data.group_id)
				slot0.data:setSpecialGroupId(0)
			end

			uv0:openBuild(slot0.data.config.bid)
		end
	end
end

function BuildItem.getRoot(slot0)
	return slot0.node
end

function BuildItem.getNode(slot0)
	return slot0.node
end

function BuildItem.getPosition(slot0)
	return slot0.node:getPosition()
end

function BuildItem.getContentSize(slot0)
	return slot0.node:getContentSize()
end

function BuildItem.getSize(slot0)
	return slot0.node:getContentSize()
end

function BuildItem.getAnchorPoint(slot0)
	return slot0.node:getAnchorPoint()
end

function BuildItem.setParentWnd(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	slot0.parent_wnd = slot1

	if slot0.data ~= nil then
		if slot0.is_build then
			slot0.node:setPosition(slot0.data.config.x, slot0.data.config.y)
			slot0.parent_wnd:addChild(slot0.node, 10)
		else
			slot0.node:setPosition(slot0.data.x, slot0.data.y)
			slot0.parent_wnd:addChild(slot0.node, 1)
		end
	end
end

function BuildItem.getParent(slot0)
	return slot0.parent_wnd
end

function BuildItem.__delete(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.body then
		slot0.body:setVisible(false)
		slot0.body:clearTracks()
		slot0.body:runAction(cc.RemoveSelf:create(true))
	end

	if slot0.node:getParent() then
		slot0.node:removeAllChildren()
		slot0.node:removeFromParent()
	end
end

function BuildItem.showFingerTips(slot0)
	if slot0.finger_effect == nil then
		slot0.finger_effect = createEffectSpine("E51050", cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.action)

		slot0.finger_effect:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
		slot0.node:addChild(slot0.finger_effect)
		slot0.finger_effect:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.CallFunc:create(function ()
			uv0:removeFinger()
		end)))
	end
end

function BuildItem.removeFinger(slot0)
	if slot0.finger_effect ~= nil then
		slot0.finger_effect:clearTracks()
		slot0.finger_effect:runAction(cc.RemoveSelf:create(true))

		slot0.finger_effect = nil
	end
end

function BuildItem.setRedPoint(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data:getTipsStatus()

	if slot0.data.is_lock == true then
		return
	end

	if slot0.red_status ~= nil and slot0.red_status == slot1 then
		return
	end

	slot0.red_status = slot1

	if slot1 == false then
		if slot0.tips_icon ~= nil then
			slot0.tips_icon:setVisible(false)
		end
	else
		if slot0.tips_icon == nil then
			slot0.tips_icon = createSprite(PathTool.getResFrame("centerscene", "scene_0"), 70, 66, slot0.item_icon, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
		end

		slot0.tips_icon:setVisible(true)
	end
end

function BuildItem.setGuideEffect(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data.group_id

	if slot0.item_group_id ~= nil and slot0.item_group_id == slot1 then
		return
	end

	if slot1 == 0 then
		if slot0.guide_effect then
			slot0.guide_effect:removeFromParent()

			slot0.guide_effect = nil
		end
	elseif slot0.guide_effect == nil then
		slot0.guide_effect = createEffectSpine(PathTool.getEffectRes(240), cc.p(41, 45), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.item_icon:addChild(slot0.guide_effect, 10)
	end
end

function BuildItem.fightStatus(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = slot0.data:getFightStatus()

	if slot0.fight_status ~= nil and slot0.fight_status == slot1 then
		return
	end

	if slot1 == false then
		if slot0.fight_effect then
			slot0.fight_effect:setVisible(false)
		end
	else
		if slot0.fight_effect == nil then
			slot0.fight_effect = createEffectSpine(PathTool.getEffectRes(186), cc.p(41, 100), cc.p(0, 0), true, PlayerAction.action)

			slot0.fight_effect:setScale(1.5)
			slot0.item_icon:addChild(slot0.fight_effect, 10)
		end

		slot0.fight_effect:setVisible(true)
	end
end

function BuildItem.setLockStatus(slot0)
	if slot0.build_lock_status == slot0.data.is_lock then
		return
	end

	slot0.build_lock_status = slot0.data.is_lock

	if slot0.build_lock_status then
		if slot0.data.config.bid == CenterSceneBuild.crossshow then
			slot0.node:setVisible(false)
		else
			setChildUnEnabled(true, slot0.node)
		end
	else
		if slot0.data.config.bid == CenterSceneBuild.crossshow then
			slot0.node:setVisible(true)
		else
			setChildUnEnabled(false, slot0.node)
		end

		slot0:setRedPoint()
	end
end
