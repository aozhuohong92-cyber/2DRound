CommonTips = CommonTips or BaseClass()

function CommonTips.__init(slot0, slot1)
	slot0.delay = slot1 or 30

	slot0:createRootWnd()
end

function CommonTips.createRootWnd(slot0)
	slot0:LoadLayoutFinish()
	slot0:registerCallBack()
end

function CommonTips.closeCallBack(slot0)
end

function CommonTips.LoadLayoutFinish(slot0)
	slot0.screen_bg = ccui.Layout:create()

	slot0.screen_bg:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.screen_bg:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	slot0.screen_bg:setTouchEnabled(true)
	slot0.screen_bg:setSwallowTouches(false)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.screen_bg:addChild(slot0.root_wnd)

	slot0.background = ccui.ImageView:create(PathTool.getResFrame("common", "common_1092"), LOADTEXT_TYPE_PLIST)

	slot0.background:setScale9Enabled(true)
	slot0.background:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:addChild(slot0.background)
end

function CommonTips.registerCallBack(slot0)
	slot0.screen_bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			TipsManager:getInstance():hideTips()
		end
	end)
end

function CommonTips.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function CommonTips.addToParent(slot0, slot1, slot2)
	slot0.parent_wnd = slot1

	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeFromParent()

		if not tolua.isnull(slot1) then
			slot0.parent_wnd:addChild(slot0.root_wnd, slot2)
		end
	end
end

function CommonTips.setPos(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function CommonTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function CommonTips.getScreenBg(slot0)
	return slot0.screen_bg
end

function CommonTips.showTips(slot0, slot1, slot2, slot3)
	slot0.tips_label = slot0:recoutTextFieldSize(slot1, slot2, slot3 or 6)
	slot5 = slot0.tips_label:getSize()
	slot6 = math.max(80 + slot5.width, slot0.background:getContentSize().width)
	slot7 = math.max(70 + slot5.height, slot0.background:getContentSize().height)

	slot0.root_wnd:setContentSize(cc.size(slot6, slot7))
	slot0.background:setContentSize(cc.size(slot6, slot7))
	slot0.tips_label:setPosition(cc.p(37, slot7 - 35))
	slot0.root_wnd:addChild(slot0.tips_label)
end

function CommonTips.recoutTextFieldSize(slot0, slot1, slot2, slot3)
	slot4 = createRichLabel(slot3, cc.c4b(197, 185, 158, 255), cc.p(0, 1), nil, 6, 0, slot2)

	slot4:setString(slot1)

	return slot4
end

function CommonTips.setAnchorPoint(slot0, slot1)
	slot0.screen_bg:setAnchorPoint(slot1)
end

function CommonTips.open(slot0)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.screen_bg)
	doStopAllActions(slot0.screen_bg)
	delayRun(slot0.screen_bg, slot0.delay, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function CommonTips.close(slot0)
	if slot0.screen_bg then
		doStopAllActions(slot0.screen_bg)
		slot0.screen_bg:removeFromParent()

		slot0.screen_bg = nil
	end
end
