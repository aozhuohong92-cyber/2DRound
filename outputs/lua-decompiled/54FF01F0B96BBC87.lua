ReconnectView = class("ReconnectView", function ()
	return ccui.Layout:create()
end)

function ReconnectView.ctor(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)

	slot0:setContentSize(slot0.size)
	slot0:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)

	slot1 = ccui.Layout:create()

	slot1:setAnchorPoint(cc.p(0.5, 0.5))
	slot1:setContentSize(slot0.size)
	slot1:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	showLayoutRect(slot1, 176)
	slot0:addChild(slot1)

	slot0.parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.RECONNECT_TAG)

	slot0.parent:addChild(slot0)
end

function ReconnectView.createEffect(slot0)
	if slot0.effect ~= nil then
		return
	end

	slot0.effect = createSpineByName("E51006")

	slot0.effect:setAnimation(0, PlayerAction.action, true)
	slot0.effect:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.effect:setScale(1)
	slot0:addChild(slot0.effect)
end

function ReconnectView.isOpen(slot0)
	return slot0.isOpenStatus
end

function ReconnectView.open(slot0)
	slot0.isOpenStatus = true

	slot0:createEffect()
end

function ReconnectView.close(slot0)
	if slot0.effect ~= nil then
		slot0.effect:removeFromParent()

		slot0.effect = nil
	end

	slot0:removeFromParent()

	slot0.isOpenStatus = nil
end

function ReconnectView.DeleteMe(slot0)
end
