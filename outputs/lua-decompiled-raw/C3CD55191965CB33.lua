ActionHelp = ActionHelp or {}

function ActionHelp.MoveAction(slot0, slot1, slot2, slot3, slot4)
	if tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or cc.size(0, 0)
	slot2 = slot2 or cc.p(0, 0)
	pos_new = pos_new or cc.p(0, 0)

	slot0:runAction(cc.Sequence:create(cc.MoveTo:create(slot3 or 0.1, slot2), cc.MoveTo:create(0.1, cc.p(slot2.x, slot2.y + 5)), cc.MoveTo:create(0.1, slot2), cc.CallFunc:create(slot4 or function ()
	end)))
end

function ActionHelp.ScaleAction(slot0, slot1)
	if tolua.isnull(move_node) then
		return
	end

	slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(0.2, 1.1), cc.ScaleTo:create(0.2, 1), cc.CallFunc:create(slot1 or function ()
	end)))
end

function ActionHelp.itemUpAction(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or 400
	slot2 = slot2 or 0
	slot3 = slot3 or 0.2
	slot5 = slot5 or 0
	slot10, slot11 = slot0:getPosition()

	if slot9 == nil or slot9 == true then
		slot0:setOpacity(0)
	end

	slot0:setPosition(slot10 - slot1, slot11 - slot2)

	slot12 = nil

	slot0:runAction(transition.sequence({
		cc.DelayTime:create(slot5),
		cc.Spawn:create((not slot4 or cc.MoveBy:create(slot3, cc.p(slot1, slot2))) and transition.newEasing(cc.MoveBy:create(slot3, cc.p(slot1, slot2)), slot7 or "BACKOUT", slot8), cc.FadeIn:create(slot3)),
		cc.CallFunc:create(function ()
			if uv0 then
				uv0()
			end
		end)
	}))
end

function ActionHelp.itemScaleAction(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or 0.3
	slot2 = slot2 or 1
	slot3 = slot3 or 0.3

	if slot4 == nil or slot4 == true then
		slot0:setOpacity(0)
	end

	slot0:setScale(slot1)

	slot10 = cc.ScaleTo:create(slot3, slot2)

	if slot5 then
		slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot5), cc.Spawn:create((slot7 or false) and slot10 or cc.EaseBackOut:create(slot10), cc.FadeIn:create(slot3 - 0.1)), cc.CallFunc:create(function ()
			if uv0 then
				uv0()
			end
		end)))
	else
		slot0:runAction(cc.Sequence:create(slot12, cc.CallFunc:create(function ()
			if uv0 then
				uv0()
			end
		end)))
	end
end

function ActionHelp.itemOpacityAction(slot0, slot1, slot2)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:setOpacity(slot1 or 0)
	slot0:runAction(cc.Spawn:create(cc.FadeIn:create(slot2 or 0.3)))
end

function ActionHelp.itemOpacityAction2(slot0, slot1, slot2)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:setOpacity(slot1 or 1)
	slot0:runAction(cc.Spawn:create(cc.FadeOut:create(slot2 or 0.3)))
end

function ActionHelp.itemFadeDownAction(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot4 = slot4 or 0.3
	slot7, slot8 = slot0:getPosition()

	slot0:setPosition(slot7 - (slot1 or 0), slot8 - (slot2 or 0))
	slot0:setOpacity(slot3 or 0)

	if slot6 == true and slot0.setTouchEnabled then
		slot0:setTouchEnabled(false)
	end

	slot11 = cc.CallFunc:create(function ()
		if uv0.setTouchEnabled and uv1 == true then
			uv0:setTouchEnabled(true)
		end
	end)
	slot12 = cc.Spawn:create(cc.MoveBy:create(slot4, cc.p(slot1, slot2)), cc.FadeIn:create(slot4))

	if slot5 == true then
		slot12 = cc.Spawn:create(cc.EaseBackOut:create(slot9), slot10)
	end

	slot0:runAction(cc.Sequence:create(slot12, slot11))
end

function ActionHelp.itemFlipAction(slot0, slot1, slot2)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or 0.1
	slot3 = cc.ScaleTo:create(slot1, 0.01, 1)
	slot4 = cc.ScaleTo:create(slot1, 1)

	if slot2 == true then
		slot3 = cc.EaseBackOut:create(cc.ScaleTo:create(slot1, -1, 1.2))
		slot4 = cc.EaseBackOut:create(cc.ScaleTo:create(slot1, 1))
	end

	slot0:runAction(cc.Sequence:create(slot3, slot4))
end

function ActionHelp.itemFlipCardAction(slot0, slot1, slot2, slot3)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or 0.5
	slot5 = slot0:getScaleY()
	slot6 = cc.ScaleTo:create(slot1, 0.01, slot5)
	slot7 = cc.ScaleTo:create(slot1, slot0:getScaleX(), slot5)
	slot8, slot9 = nil

	if slot2 then
		slot8 = cc.CallFunc:create(function ()
			uv0()
		end)
	end

	if slot3 then
		slot9 = cc.CallFunc:create(function ()
			uv0()
		end)
	end

	if slot8 then
		slot0:runAction(cc.Sequence:create(slot6, slot8, slot7, slot9))
	else
		slot0:runAction(cc.Sequence:create(slot6, slot7, slot9))
	end
end

function ActionHelp.itemUnfoldAction(slot0, slot1)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot1 = slot1 or 0.3

	slot0:setScaleX(0)
	slot0:setOpacity(0)
	slot0:runAction(cc.Spawn:create(cc.Sequence:create(cc.ScaleTo:create(slot1 - 0.1, 1.2, 1), cc.ScaleTo:create(0.1, 1)), cc.FadeIn:create(slot1)))
end

function ActionHelp.pressDownAction(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:setScale(1)
	slot0:setOpacity(255)
	slot0:runAction(cc.Sequence:create(cc.ScaleTo:create(slot1 or 0.15, slot4 or 1.3), cc.ScaleTo:create(slot2 or 0.1, 1), cc.CallFunc:create(function ()
		if uv0 then
			uv0()
		end
	end)))
end

function ActionHelp.ZoomFadeoutAction(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot3 = 0.15

	slot0:setScale(slot1 or 1)
	slot0:setOpacity(255)
	slot0:runAction(cc.Sequence:create(cc.Spawn:create(cc.ScaleTo:create(slot3, slot2 or 1.3), cc.FadeOut:create(slot3)), cc.CallFunc:create(function ()
		if uv0 then
			uv0()
		end

		uv1:setScale(1)
		uv1:setOpacity(255)
	end)))
end

function ActionHelp.scaleCycleAction(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:stopAllActions()
	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(slot1 or 0.1, slot3 or 1.2), cc.ScaleTo:create(slot2 or 0.1, slot4 or 1))))
end

function ActionHelp.breathingLampAction(slot0, slot1, slot2)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:stopAllActions()

	slot1 = slot1 or 0.1
	slot3 = cc.FadeOut:create(slot1)
	slot4 = cc.FadeIn:create(slot1)

	if slot2 then
		slot4 = cc.FadeTo:create(slot1, slot2)
	end

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(slot3, slot4)))
end

function ActionHelp.carouselAction(slot0, slot1, slot2, slot3)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:stopAllActions()

	slot1 = slot1 or 0.1

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(slot1), cc.DelayTime:create(slot2 or 0.5), cc.FadeIn:create(slot1), cc.DelayTime:create(slot3 or 0.5))))
end

function ActionHelp.floatingEffectAction(slot0, slot1, slot2, slot3, slot4, slot5)
	slot1 = slot1 or 0.5
	slot3 = slot3 or 10
	slot5 = slot5 or {}

	if slot2 then
		if (slot4 or 1) == 1 then
			slot0:setPositionY(slot2)
		elseif slot4 == 2 then
			slot0:setPositionX(slot2)
		end
	end

	slot6, slot7 = nil

	if slot4 == 1 then
		slot6 = cc.MoveBy:create(slot1, cc.p(0, -slot3))
		slot7 = cc.MoveBy:create(slot1, cc.p(0, slot3))
	elseif slot4 == 2 then
		slot6 = cc.MoveBy:create(slot1, cc.p(-slot3, 0))
		slot7 = cc.MoveBy:create(slot1, cc.p(slot3, 0))
	end

	if slot5.ease_name then
		slot6 = transition.newEasing(slot6, slot5.ease_name)
		slot7 = transition.newEasing(slot7, slot5.ease_name)
	end

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(slot6, slot7)))
end

function ActionHelp.runCircleAction(slot0, slot1)
	slot1.time = checktable(slot1).time or 2
	slot1.loop = checknumber(slot1.loop)
	slot1.is_forward = checkbool(slot1.is_forward)
	slot1.a = slot1.a or 100
	slot1.b = slot1.b or 20
	slot1.center_pos = slot1.center_pos or cc.p(0, 0)
	slot1.scale_max = slot1.scale_max or 1
	slot1.scale_min = slot1.scale_min or 1
	slot1.zorder = slot1.zorder or 1
	slot1.interval = slot1.interval or 1
	slot3 = math.ceil(slot1.time / (slot1.interval / display.DEFAULT_FPS))
	slot4 = 0
	slot5 = 0
	slot6 = math.pi * 2
	slot7 = slot1.is_forward and 0 or -1
	slot8 = slot1.scale_max
	slot9 = slot1.scale_min
	slot10 = slot1.loop > 0 and function ()
		if uv1.loop <= uv0 then
			uv2:stopAllActions()
		end
	end or function ()
	end

	function slot11()
		uv0 = uv0 + 1

		if uv1 <= uv0 then
			uv0 = 0
			uv2 = uv2 + 1

			uv3()
		end

		slot0 = uv0 / uv1 + uv4

		uv9:setScale(uv7 == uv7 and uv7 or uv7 - slot2 / uv5.b * (uv7 - uv8))
		uv9:setLocalZOrder(uv5.zorder * (slot2 > 0 and -1 or 1))
		uv9:move(cc.pAdd(uv5.center_pos, cc.p(uv5.a * math.cos(uv6 * slot0), uv5.b * math.sin(uv6 * slot0))))
	end

	slot11()
	schedule(slot0, slot11, slot2)
end

function ActionHelp.runLightMoveAction(slot0, slot1)
	slot2 = checktable(slot1).light_type or 1
	slot9 = cc.ClippingNode:create(cc.Node:create())

	slot9:align(slot0:getAnchorPoint(), slot0:getPosition())
	slot9:setAlphaThreshold(slot1.alpha_threshold or 0.5)
	slot9:addTo(slot0:getParent())

	slot10 = createSprite(PathTool.getTargetRes("gameforeshow", "light"), 0, 0, slot9, display.CENTER, LOADTEXT_TYPE)
	slot11 = slot10:getContentSize()
	slot12, slot13, slot14 = nil

	function slot9.updateLightStencil(slot0)
		uv0 = createRenderSpr(uv1, {
			parent = uv2
		}):move(0, 0)
		uv3 = uv0:getContentSize()
		uv4 = uv3.width / 2 + uv5.width
	end

	slot9:updateLightStencil()
	schedule(slot9, function ()
		uv0(uv1)
	end, (slot1.move_time or 1.5) + (slot1.delay_time or 1))
	slot1.move_func or function (slot0)
		slot0:runAction(cc.Sequence:create(cc.Place:create(cc.p(-uv0, 0)), cc.MoveTo:create(uv1, cc.p(uv0, 0))))
	end(slot10)

	return slot9
end

function ActionHelp.twoNodesAlternate(slot0, slot1, slot2, slot3, slot4)
	if not slot0 or not slot1 or tolua.isnull(slot0) or tolua.isnull(slot1) then
		return
	end

	slot2 = slot2 or 1
	slot3 = slot3 or 2

	slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(slot2), cc.DelayTime:create(slot3), cc.FadeOut:create(slot2), cc.DelayTime:create(slot4 or 2))))
	slot1:runAction(cc.Sequence:create(cc.DelayTime:create(slot2 + slot3), cc.CallFunc:create(function ()
		uv1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(uv0), uv2, cc.FadeOut:create(uv0), uv3)))
	end)))
end

function ActionHelp.MoveAction2(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if tolua.isnull(slot0) then
		return
	end

	slot3 = slot3 or function ()
	end
	slot8 = cc.MoveTo:create(slot2 or 0.1, slot1 or cc.p(0, 0))

	if slot4 then
		slot8 = transition.newEasing(cc.MoveTo:create(slot2, slot1), slot5 or "BACKOUT", slot6)
	end

	slot0:runAction(cc.Sequence:create(slot8, cc.CallFunc:create(slot3)))
end

function ActionHelp.MoveScaleAction(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if tolua.isnull(slot0) then
		return
	end

	slot4 = slot4 or function ()
	end
	slot3 = slot3 or 0.1
	slot11 = cc.Spawn:create(cc.MoveTo:create(slot3, slot1 or cc.p(0, 0)), cc.ScaleTo:create(slot3, slot2 or 1))

	if slot5 then
		slot11 = transition.newEasing(cc.Spawn:create(slot9, slot10), slot6 or "BACKOUT", slot7)
	end

	slot0:runAction(cc.Sequence:create(slot11, cc.CallFunc:create(slot4)))
end

function ActionHelp.MoveFadeInAction(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if tolua.isnull(slot0) then
		return
	end

	slot3 = slot3 or function ()
	end
	slot2 = slot2 or 2
	slot10 = cc.Spawn:create(cc.MoveTo:create(slot2, slot1 or cc.p(0, 0)), cc.FadeIn:create(slot2))

	if slot4 then
		slot10 = transition.newEasing(cc.Spawn:create(slot8, slot9), slot5 or "BACKOUT", slot6)
	end

	slot0:runAction(cc.Sequence:create(slot10, cc.CallFunc:create(slot3)))
end

function ActionHelp.SlowToFastSlowMoveIn(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot0) then
		return
	end

	slot0:runAction(cc.EaseSineInOut:create(cc.Spawn:create(cc.ScaleTo:create(slot3, slot2), cc.MoveTo:create(slot3, slot1))))
end

function ActionHelp.FadeInScaleMoveTo(slot0, slot1, slot2, slot3, slot4)
	if tolua.isnull(slot0) then
		return
	end

	slot5 = cc.MoveTo:create(slot3, slot1)
	slot6 = cc.ScaleTo:create(slot3, slot2)
	slot7 = cc.FadeIn:create(slot3)
	slot8 = nil

	slot0:runAction((not slot4 or cc.Sequence:create(cc.DelayTime:create(slot4), cc.Spawn:create(slot5, slot6, slot7))) and cc.Spawn:create(slot5, slot6, slot7))
end

function ActionHelp.EaseFadeInMoveTo(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot0) then
		return
	end

	slot4 = cc.MoveTo:create(slot2, slot1)
	slot5 = cc.FadeIn:create(slot2)
	slot6 = nil

	slot0:runAction((not slot3 or cc.Sequence:create(cc.DelayTime:create(slot3), cc.EaseOut:create(cc.Spawn:create(slot4, slot5), 2))) and cc.EaseOut:create(cc.Spawn:create(slot4, slot5), 2))
end

function slot0(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if tolua.isnull(slot0) then
		return
	end

	assert(slot1, "act_Any is empty")

	slot3 = slot3 or function ()
	end

	slot0:show()

	slot7 = (slot5 or false) and cc.DelayTime:create(0) or slot0:setOpacity(0) and cc.FadeIn:create(slot2[1])

	if type(slot4) == "string" and slot4 ~= "" then
		slot1 = transition.newEasing(slot1, slot4, slot6)
	end

	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot2[2]), cc.Spawn:create(slot7, slot1), cc.CallFunc:create(slot3)))
end

function ActionHelp.MoveByActionForAnyEase(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if tolua.isnull(slot0) then
		return
	end

	slot2 = slot2 or {
		0,
		0
	}
	slot7 = cc.p(slot0:getPositionX(), slot0:getPositionY())

	slot0:setPositionX(slot7.x + slot2[1])
	slot0:setPositionY(slot7.y + slot2[2])
	uv0(slot0, cc.MoveTo:create(slot1[1], slot7), slot1, slot3, slot4, slot5, slot6)
end

function ActionHelp.MoveByAction(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	ActionHelp.MoveByActionForAnyEase(slot0, slot1, slot2, slot3, slot4 or "", slot5, slot6)
end

function ActionHelp.itemScaleAction2(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot6 = 1

	if slot4 then
		slot6 = slot0:getScale()
	end

	slot0:setScale(slot1)

	slot7 = cc.ScaleTo:create(slot2, slot6)

	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot3 or 0), cc.Show:create(), (slot5 or false) and slot7 or cc.EaseBackOut:create(slot7)))
end

function ActionHelp.itemLongTimeClickScaleAction(slot0, slot1, slot2, slot3, slot4)
	if slot0 == nil or tolua.isnull(slot0) then
		return
	end

	slot0:stopAllActions()
	slot0:setScale(slot3)
	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(slot1), cc.CallFunc:create(function ()
		uv0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.ScaleTo:create(uv1, uv2), cc.ScaleTo:create(uv1, uv3))))
	end)))
end
