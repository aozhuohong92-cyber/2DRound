slot0 = cc.Node

function slot0.add(slot0, slot1, slot2, slot3)
	if slot3 then
		slot0:addChild(slot1, slot2, slot3)
	elseif slot2 then
		slot0:addChild(slot1, slot2)
	else
		slot0:addChild(slot1)
	end

	return slot0
end

function slot0.addTo(slot0, slot1, slot2, slot3)
	if slot3 then
		slot1:addChild(slot0, slot2, slot3)
	elseif slot2 then
		slot1:addChild(slot0, slot2)
	else
		slot1:addChild(slot0)
	end

	return slot0
end

function slot0.removeSelf(slot0)
	slot0:removeFromParent()

	return slot0
end

function slot0.align(slot0, slot1, slot2, slot3)
	slot0:setAnchorPoint(slot1)

	return slot0:move(slot2, slot3)
end

function slot0.show(slot0)
	slot0:setVisible(true)

	return slot0
end

function slot0.hide(slot0)
	slot0:setVisible(false)

	return slot0
end

function slot0.move(slot0, slot1, slot2)
	if slot2 then
		slot0:setPosition(slot1, slot2)
	else
		slot0:setPosition(slot1)
	end

	return slot0
end

function slot0.moveTo(slot0, slot1)
	transition.moveTo(slot0, slot1)

	return slot0
end

function slot0.moveBy(slot0, slot1)
	transition.moveBy(slot0, slot1)

	return slot0
end

function slot0.fadeIn(slot0, slot1)
	transition.fadeIn(slot0, slot1)

	return slot0
end

function slot0.fadeOut(slot0, slot1)
	transition.fadeOut(slot0, slot1)

	return slot0
end

function slot0.fadeTo(slot0, slot1)
	transition.fadeTo(slot0, slot1)

	return slot0
end

function slot0.rotate(slot0, slot1)
	slot0:setRotation(slot1)

	return slot0
end

function slot0.rotateTo(slot0, slot1)
	transition.rotateTo(slot0, slot1)

	return slot0
end

function slot0.rotateBy(slot0, slot1)
	transition.rotateBy(slot0, slot1)

	return slot0
end

function slot0.scaleTo(slot0, slot1)
	transition.scaleTo(slot0, slot1)

	return slot0
end

function slot0.onUpdate(slot0, slot1)
	slot0:scheduleUpdateWithPriorityLua(slot1, 0)

	return slot0
end

slot0.scheduleUpdate = slot0.onUpdate

function slot0.onNodeEvent(slot0, slot1, slot2)
	if slot1 == "enter" then
		slot0.onEnterCallback_ = slot2
	elseif slot1 == "exit" then
		slot0.onExitCallback_ = slot2
	elseif slot1 == "enterTransitionFinish" then
		slot0.onEnterTransitionFinishCallback_ = slot2
	elseif slot1 == "exitTransitionStart" then
		slot0.onExitTransitionStartCallback_ = slot2
	elseif slot1 == "cleanup" then
		slot0.onCleanupCallback_ = slot2
	end

	slot0:enableNodeEvents()
end

function slot0.enableNodeEvents(slot0)
	if slot0.isNodeEventEnabled_ then
		return slot0
	end

	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			uv0:onEnter_()
		elseif slot0 == "exit" then
			uv0:onExit_()
		elseif slot0 == "enterTransitionFinish" then
			uv0:onEnterTransitionFinish_()
		elseif slot0 == "exitTransitionStart" then
			uv0:onExitTransitionStart_()
		elseif slot0 == "cleanup" then
			uv0:onCleanup_()
		end
	end)

	slot0.isNodeEventEnabled_ = true

	return slot0
end

function slot0.disableNodeEvents(slot0)
	slot0:unregisterScriptHandler()

	slot0.isNodeEventEnabled_ = false

	return slot0
end

function slot0.onEnter(slot0)
end

function slot0.onExit(slot0)
end

function slot0.onEnterTransitionFinish(slot0)
end

function slot0.onExitTransitionStart(slot0)
end

function slot0.onCleanup(slot0)
end

function slot0.onEnter_(slot0)
	slot0:onEnter()

	if not slot0.onEnterCallback_ then
		return
	end

	slot0:onEnterCallback_()
end

function slot0.onExit_(slot0)
	slot0:onExit()

	if not slot0.onExitCallback_ then
		return
	end

	slot0:onExitCallback_()
end

function slot0.onEnterTransitionFinish_(slot0)
	slot0:onEnterTransitionFinish()

	if not slot0.onEnterTransitionFinishCallback_ then
		return
	end

	slot0:onEnterTransitionFinishCallback_()
end

function slot0.onExitTransitionStart_(slot0)
	slot0:onExitTransitionStart()

	if not slot0.onExitTransitionStartCallback_ then
		return
	end

	slot0:onExitTransitionStartCallback_()
end

function slot0.onCleanup_(slot0)
	slot0:onCleanup()

	if not slot0.onCleanupCallback_ then
		return
	end

	slot0:onCleanupCallback_()
end
