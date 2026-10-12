ErrorMessage = ErrorMessage or BaseClass()

function ErrorMessage.getInstance(slot0)
	if not slot0.init_view then
		slot0.init_view = true

		slot0:initCallBack()
	end

	return slot0
end

function ErrorMessage.initCallBack(slot0)
	slot0:openCallBack()
	slot0:registerCallBack()
end

function ErrorMessage.openCallBack(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("common/error_message"))

	slot0.root_wnd:retain()
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(cc.p(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.scroll_view = slot0.main_panel:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)
end

function ErrorMessage.setErrorMsg(slot0, slot1, slot2)
	slot0.msg = slot1
	slot3 = 16

	if slot2 then
		slot0.scroll_view:setTouchEnabled(false)
	end

	if slot0.error_txt ~= nil then
		if slot0.error_txt:getParent() ~= nil then
			slot0.error_txt:removeFromParent()
		end

		slot0.error_txt = nil
	end

	slot0.error_txt = slot0:recoutTextFieldSize(slot1, 570, slot3)
	slot4 = slot0.error_txt:getContentSize()

	slot0.error_txt:setPosition(cc.p(10, slot4.height - 10))
	UITool.SetLightColor(slot0.error_txt)

	slot5 = slot0.scroll_view:getContentSize()
	slot6 = ccui.Layout:create()

	slot6:setContentSize(cc.size(slot5.width - 10, slot4.height))
	slot6:addChild(slot0.error_txt)

	slot7 = math.max(slot4.height, slot5.height) - 30
	slot8 = ccui.Layout:create()

	slot8:setContentSize(cc.size(slot5.width - 10, slot7))
	slot6:setAnchorPoint(cc.p(0, 1))
	slot6:setPosition(cc.p(0, slot7))
	slot8:addChild(slot6)
	slot0.scroll_view:setInnerContainerSize(cc.size(slot5.width, slot7))
	slot0.scroll_view:addChild(slot8)
end

function ErrorMessage.registerCallBack(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:close()
		end
	end)
end

function ErrorMessage.recoutTextFieldSize(slot0, slot1, slot2, slot3)
	slot4 = createWithSystemFont(slot1, DEFAULT_FONT, slot3)

	slot4:setAnchorPoint(cc.p(0, 1))
	slot4:setTextColor(Config.ColorData.data_color4[63])

	if slot2 ~= nil then
		slot6 = slot4:getContentSize().height

		if slot2 < slot4:getContentSize().width then
			slot7 = math.ceil(slot5 / slot2)

			slot4:setContentSize(cc.size(slot2, slot6 * slot7))
			slot4:setWidth(slot2)
			slot4:setHeight(slot6 * slot7)
		end
	end

	return slot4
end

function ErrorMessage.show(slot0, slot1)
	if ErrorMessage:getInstance().msg ~= nil then
		return
	end

	slot2:open()
	slot2:setErrorMsg(slot0, slot1)

	return slot2
end

function ErrorMessage.open(slot0)
	if slot0.root_wnd and slot0.parent == nil then
		slot0.parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)

		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.root_wnd:setVisible(true)
end

function ErrorMessage.close(slot0)
	if slot0.close_callback then
		slot0.close_callback()

		slot0.close_callback = nil
	end

	slot0.msg = nil

	slot0.root_wnd:setVisible(false)
end

function ErrorMessage.setCloseCallBack(slot0, slot1)
	slot0.close_callback = slot1
end
