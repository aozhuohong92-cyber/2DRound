DownLoadView = class("DownLoadView", function ()
	return ccui.Layout:create()
end)

function DownLoadView.ctor(slot0)
	slot0.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)

	slot0:setContentSize(slot0.size)
	slot0:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(true)

	slot1 = ccui.Layout:create()

	slot1:setAnchorPoint(cc.p(0.5, 0.5))
	slot1:setContentSize(slot0.size)
	slot1:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot1:setScale(display.getMaxScale())
	showLayoutRect(slot1, 176)
	slot0:addChild(slot1)

	slot0.parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.RECONNECT_TAG)

	slot0.parent:addChild(slot0)
end

function DownLoadView.createEffect(slot0)
	if slot0.effect ~= nil then
		return
	end

	slot0.effect = createSpineByName("E51006")

	slot0.effect:setAnimation(0, PlayerAction.action_1, true)
	slot0.effect:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.effect)
end

function DownLoadView.isOpen(slot0)
	return slot0.isOpenStatus
end

function DownLoadView.open(slot0, slot1)
	slot0.isOpenStatus = true
	slot0.data = slot1

	slot0:createEffect()
end

function DownLoadView.close(slot0)
	if slot0.effect ~= nil then
		slot0.effect:removeFromParent()

		slot0.effect = nil
	end

	slot0:removeFromParent()

	slot0.isOpenStatus = nil
end

function DownLoadView.DeleteMe(slot0)
end
