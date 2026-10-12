WorldMapItem = class("WorldMapItem", function ()
	return ccui.Layout:create()
end)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()

function WorldMapItem.ctor(slot0, slot1, slot2)
	slot0.config = slot1
	slot0.size = cc.size(50, 50)
	slot0.scale = 4
	slot0.open_data = slot2

	slot0:createRootWnd()
end

function WorldMapItem.createRootWnd(slot0)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.effect = createEffectSpine(PathTool.getEffectRes(119), cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action_4)

	slot0:addChild(slot0.effect)

	slot0.progress_bg = createSprite(PathTool.getResFrame("worldmap", "worldmap_1008"), slot0.size.width * 0.5, 80, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.progress_label = createLabel(18, 1, nil, 42, 13, "", slot0.progress_bg, nil, cc.p(0.5, 0.5))
	slot3 = createSprite(PathTool.getResFrame("worldmap", "worldmap_1006"), slot0.size.width * 0.5, -20, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	slot0.name_label = createLabel(18, cc.c3b(71, 44, 30), nil, slot0.size.width * 0.5 - 2, -15, slot0.config.name, slot0, nil, cc.p(0.5, 0.5))

	slot0:registerEvent()
	slot0:fillData()
end

function WorldMapItem.registerEvent(slot0)
	slot0:setTouchEnabled(true)
	slot0:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if uv0.call_back then
				uv0.call_back()
			end

			playButtonSound2()

			if uv0.drama_data then
				if uv0.config.bid <= uv1:getOpenSumChapter(uv0.drama_data.mode) and uv0.config.bid ~= uv0.drama_data.chapter_id then
					WorldmapController:getInstance():openWorldMapTipsWindow(true, uv0.config.bid, WorldmapEvent.open_type.open_type_2)
				elseif uv0.config.bid == uv0.drama_data.chapter_id then
					WorldmapController:getInstance():openWorldMapTipsWindow(true, uv0.config.bid, WorldmapEvent.open_type.open_type_1)
				else
					WorldmapController:getInstance():openWorldMapTipsWindow(true, uv0.config.bid, WorldmapEvent.open_type.open_type_3)
				end
			end
		end
	end)

	if not slot0.update_effect_event then
		slot0.update_effect_event = GlobalEvent:getInstance():Bind(WorldmapEvent.World_Map_Unlock_item, function ()
			slot0 = uv0:getDramaData()

			if uv1.config and slot0 and uv1.config.bid == slot0.chapter_id and uv1.effect then
				uv1.effect:registerSpineEventHandler(function ()
				end, sp.EventType.ANIMATION_COMPLETE)
				uv1.effect:setAnimation(0, PlayerAction.action_1, true)
			end
		end)
	end
end

function WorldMapItem.showAfterEffect(slot0)
	if slot0.after_effect then
		slot0.after_effect:runAction(cc.RemoveSelf:create(true))

		slot0.after_effect = nil
	end

	if not slot0.after_effect then
		slot2 = slot0:convertToWorldSpace(cc.p(slot0:getContentSize().width / 2, slot0:getContentSize().height / 2))
		slot0.after_effect = createEffectSpine(PathTool.getEffectRes(146), cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2), cc.p(0.5, 0.5), false, PlayerAction.action)

		ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.after_effect)
		slot0.after_effect:runAction(cc.Sequence:create(cc.MoveTo:create(0.5, cc.p(slot2.x, slot2.y))))
		slot0.after_effect:registerSpineEventHandler(function ()
			if uv0.after_effect then
				uv0.after_effect:runAction(cc.RemoveSelf:create(true))

				uv0.after_effect = nil
			end

			uv0:showFingerEffect()
		end, sp.EventType.ANIMATION_COMPLETE)
	end
end

function WorldMapItem.showFingerEffect(slot0)
	if slot0.finger_effect then
		slot0.finger_effect:runAction(cc.RemoveSelf:create(true))

		slot0.finger_effect = nil
	end

	if not slot0.finger_effect then
		slot0.finger_effect = createEffectSpine(PathTool.getEffectRes(240), cc.p(slot0:getContentSize().width / 2, slot0:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0:addChild(slot0.finger_effect)
		slot0.finger_effect:registerSpineEventHandler(animationEventFunc, sp.EventType.ANIMATION_EVENT)
		slot0.finger_effect:registerSpineEventHandler(function ()
			BattleController:getInstance():setUnlockChapterStatus(false)
			WorldmapController:getInstance():addLockContainer(false)
			uv0.effect:setAnimation(0, PlayerAction.action_1, true)
		end, sp.EventType.ANIMATION_COMPLETE)
	end
end

function WorldMapItem.addToParent(slot0, slot1, slot2)
	if not tolua.isnull(slot1) and slot0.config then
		slot1:addChild(slot0)

		if slot2 then
			slot0.call_back = slot2
		end

		slot0:setPosition(slot0.config.x, slot0.config.y)
	end
end

function WorldMapItem.openEffect(slot0)
	if not tolua.isnull(slot0.effect) then
		slot0.effect:setAnimation(0, PlayerAction.action_6, false)
		slot0.effect:registerSpineEventHandler(function ()
			WorldmapController:getInstance():openWorldMapTipsWindow(true, uv0.config.bid, WorldmapEvent.open_type.open_type_1)
			BattleController:getInstance():setUnlockChapterStatus(false)
			WorldmapController:getInstance():addLockContainer(false)
		end, sp.EventType.ANIMATION_COMPLETE)
	end
end

function WorldMapItem.fillData(slot0)
	slot0.drama_data = uv0:getDramaData()

	if slot0.config ~= nil and slot0.drama_data ~= nil then
		slot0.progress_bg:setVisible(slot0.config.bid <= slot0.drama_data.chapter_id)
		slot0.progress_label:setString(string.format("%s/%s", uv0:getHasCurChapterPassListNum(BattleDramaConst.Normal, slot0.config.bid), uv0:getChapterLength(BattleDramaConst.Normal, slot0.config.bid)))

		slot1 = uv0:getOpenSumChapter(slot0.drama_data.mode)

		if slot0.config.bid == slot0.drama_data.chapter_id then
			if slot0.open_data then
				slot0:openEffect()
			else
				slot0.effect:setAnimation(0, PlayerAction.action_1, true)
			end
		elseif slot0.config.bid < slot1 then
			slot0.effect:setAnimation(0, PlayerAction.action_3, true)
		elseif slot1 < slot0.config.bid then
			slot0.effect:setAnimation(0, PlayerAction.action_5, true)
		end
	end
end

function WorldMapItem.clearEffect(slot0)
	if slot0.finger_effect then
		slot0.finger_effect:runAction(cc.RemoveSelf:create(true))

		slot0.finger_effect = nil
	end

	if slot0.after_effect then
		slot0.after_effect:runAction(cc.RemoveSelf:create(true))

		slot0.after_effect = nil
	end

	if slot0.open_effect then
		slot0.open_effect:runAction(cc.RemoveSelf:create(true))

		slot0.open_effect = nil
	end
end

function WorldMapItem.DeleteMe(slot0)
	if slot0.update_effect_event then
		GlobalEvent:getInstance():UnBind(slot0.update_effect_event)

		slot0.update_effect_event = nil
	end

	slot0:clearEffect()
end
