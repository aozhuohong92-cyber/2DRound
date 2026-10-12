BarrageEditView = BarrageEditView or BaseClass(BaseView)
slot0 = BarrageController:getInstance()

function BarrageEditView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.TOP_TAG
	slot0.layout_name = "barrage/barrage_edit_window"
end

function BarrageEditView.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.send_btn = slot0.container:getChildByName("send_btn")

	slot0.send_btn:getChildByName("label"):setString(TI18N("发送"))
	slot0.send_btn:getChildByName("label"):enableOutline(Config.ColorData.data_color4[263], 2)

	slot2 = slot0.container:getChildByName("content_container")
	slot3 = cc.size(slot2:getContentSize().width - 36, slot2:getContentSize().height - 20)
	slot0.editbox = createEditBox(slot2, PathTool.getResFrame("common", "common_99998"), slot3, Config.ColorData.data_color4[175], 20, Config.ColorData.data_color4[63], 20, TI18N("请输入内容"), nil, 40, LOADTEXT_TYPE_PLIST)

	slot0.editbox:setAnchorPoint(cc.p(0, 1))
	slot0.editbox:setPosition(18, slot3.height + 10)
	slot0.container:getChildByName("notice_label"):setString(TI18N("限制40字以内"))
	slot0.container:getChildByName("desc_label"):setString(TI18N("消耗:"))
	slot0.container:getChildByName("win_title"):setString(TI18N("发送弹幕"))
end

function BarrageEditView.register_event(slot0)
	slot0.send_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.editbox:getText() ~= "" then
				uv1:sendBarrageMsg(uv0.type, slot2)
			end
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openEditView(false)
		end
	end)
	slot0:addGlobalEvent(SceneEvent.ENTER_FIGHT, function ()
		uv0:close(true)
	end)
end

function BarrageEditView.openRootWnd(slot0, slot1)
	slot0.type = slot1 or 1

	if slot0.container then
		slot2 = 500

		if Config.SubtitleData.data_list[slot0.type] and next(slot3.loss) ~= nil then
			slot2 = slot3.loss[1][2] or 500
		end

		slot0.container:getChildByName("desc_value"):setString(slot2)
	end
end

function BarrageEditView.close_callback(slot0)
	uv0:openEditView(false)
end
