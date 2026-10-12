SdkView = class("SdkView", function ()
	return ccui.Widget:create()
end)

function SdkView.ctor(slot0, slot1)
	slot0.size = slot1:getContentSize()

	slot0:setContentSize(slot0.size)
	slot1:addChild(slot0)
	slot0:setPosition(cc.p(display.cx, 0))
	slot0:setAnchorPoint(cc.p(0.5, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("login/login_sdk_view"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")
	slot0.confirm_btn = slot0.main_container:getChildByName("confirm_btn")
	slot0.notice_label = slot0.main_container:getChildByName("notice_label")

	slot0.notice_label:setTextAreaSize(cc.size(430, 130))
	slot0.notice_label:setTextColor(cc.c4b(2, 55, 167, 255))

	if slot0.cancel_btn:getChildByName("label") then
		slot2:setString(TI18N("取消"))
	end

	if slot0.confirm_btn:getChildByName("label") then
		slot2:enableOutline(cc.c4b(2, 53, 85, 255), 2)
		slot2:setString(TI18N("确定"))
	end
end

function SdkView.show(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.notice_label:setString(slot1)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			uv0()
			uv1:close()
		end
	end)

	if slot4 then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				if uv0 then
					uv0()
				end

				uv1:close()
			end
		end)
	else
		slot0.cancel_btn:setVisible(false)
		slot0.confirm_btn:setPositionX(slot0.main_container:getContentSize().width / 2)
	end
end

function SdkView.close(slot0)
	if not tolua.isnull(slot0) then
		slot0:setVisible(false)
		slot0:removeFromParent()
	end
end
