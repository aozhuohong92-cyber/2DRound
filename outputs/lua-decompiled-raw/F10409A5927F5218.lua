BugPanel = BugPanel or BaseClass(BaseView)

function BugPanel.__init(slot0)
	slot0.ctrl = NoticeController:getInstance()
	slot0.layout_name = "notice/bug_panel"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.btn_list = {}
	slot0.label_list = {}
	slot0.default_title_msg = TI18N("请输入标题")
	slot0.default_content_msg = TI18N("请输入内容")
	slot0.title_str = ""
	slot0.content_str = ""
	slot0.cur_select = nil
end

function BugPanel.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setScale(display.getMaxScale())

	slot0.background = slot1:getChildByName("background")
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")

	slot0.ok_btn:setTitleText(TI18N("提交"))

	slot0.ok_btn.label = slot0.ok_btn:getTitleRenderer()

	if slot0.ok_btn.label ~= nil then
		slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot5 = "tab_container"
	slot0.tab_container = slot0.main_panel:getChildByName(slot5)

	for slot5 = 1, 2 do
		slot6 = slot0.tab_container:getChildByName("tab_btn_" .. slot5)
		slot6.label = slot6:getChildByName("title")
		slot0.btn_list[slot5] = slot6

		slot6:setBright(false)
		slot6.label:setTextColor(cc.c4b(215, 226, 227, 255))

		slot0.btn_list[slot5].index = slot5

		if slot5 == 1 then
			slot7:setString(TI18N("提交建议"))
		else
			slot7:setString(TI18N("BUG反馈"))
		end
	end

	slot0.main_panel:getChildByName("edit_box_title"):setString(TI18N("标题:"))
	slot0.main_panel:getChildByName("edit_box_content"):setString(TI18N("内容:"))

	slot4 = createLabel(24, Config.ColorData.data_color4[175], nil, 45, 448, TI18N("亲爱的船长大人："), slot0.main_panel, nil, cc.p(0, 0))

	slot0.main_panel:addChild(createRichLabel(22, Config.ColorData.data_color4[175], cc.p(1, 1), cc.p(575, 445), 6, nil, 530))

	slot6 = ""
	CUSTOMER_QQ = CUSTOMER_QQ or 800185843

	slot5:setString((not BUG_PANEL_DESC or string.format(BUG_PANEL_DESC, GAME_NAME)) and string.format(TI18N("    欢迎您进驻《%s》的冒险世界，如您在游戏中发现BUG或有什么建议。欢迎您填写留言并提交给我们，我们会认真查看每一条留言，让冒险世界做的更好！如有紧急问题，请联系QQ：%s"), GAME_NAME, CUSTOMER_QQ))

	slot7 = PathTool.getResFrame("common", "common_99998")
	slot0.edit_title = createEditBox(slot0.main_panel, slot7, cc.size(300, 30), nil, 22, Config.ColorData.data_color4[151], 22, "", nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_title:setAnchorPoint(cc.p(0, 0))
	slot0.edit_title:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_title:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_title:setPosition(cc.p(126, 268))
	slot0.edit_title:setMaxLength(40)

	slot0.title_content = createRichLabel(22, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(130, 296), 6, nil, 300)

	slot0.title_content:setString(slot0.default_title_msg)
	slot0.main_panel:addChild(slot0.title_content)
	slot0.edit_title:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_title then
				uv0.begin_change_title = false

				uv0.title_content:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.title_str then
					uv0.title_str = slot2

					if uv0.title_content then
						uv0.title_content:setString(slot2)
					end
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_title then
				uv0.title_content:setVisible(false)

				uv0.begin_change_title = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)

	slot0.label_content = createRichLabel(22, Config.ColorData.data_color4[151], cc.p(0, 1), cc.p(130, 257), 6, nil, 300)

	slot0.label_content:setString(slot0.default_content_msg)
	slot0.main_panel:addChild(slot0.label_content)

	slot0.edit_content = createEditBox(slot0.main_panel, slot7, cc.size(400, 130), nil, 22, nil, 22, "", nil, , LOADTEXT_TYPE_PLIST)

	slot0.edit_content:setAnchorPoint(cc.p(0, 1))
	slot0.edit_content:setPlaceholderFontColor(Config.ColorData.data_color4[63])
	slot0.edit_content:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_content:setPosition(cc.p(133, 258))
	slot0.edit_content:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_label then
				uv0.begin_change_label = false

				uv0.label_content:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.content_str then
					uv0.content_str = slot2

					if uv0.label_content then
						uv0.label_content:setString(slot2)
					end
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_label then
				uv0.label_content:setVisible(false)

				uv0.begin_change_label = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
	slot0:changeIndex(1)
end

function BugPanel.register_event(slot0)
	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:closeBugPanel()
		end
	end

	slot0.close_btn:addTouchEventListener(slot4)

	for slot4 = 1, 2 do
		slot0.btn_list[slot4]:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:changeIndex(uv1)
			end
		end)
	end

	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.cur_select then
				return
			end

			slot2 = uv0.cur_select.index or 1

			if string.len(uv0.title_str or "") == 0 or slot3 == uv0.default_title_msg then
				message(TI18N("请输入标题"))

				return
			end

			if string.len(uv0.content_str or "") == 0 or slot4 == uv0.default_content_msg then
				message(TI18N("请输入内容"))

				return
			end

			uv0.ctrl:sender10810(slot2 + 1, slot3, slot4)

			if uv0.title_content then
				uv0.title_content:setString(uv0.default_title_msg)
			end

			if uv0.label_content then
				uv0.label_content:setString(uv0.default_content_msg)
			end
		end
	end)
end

function BugPanel.changeIndex(slot0, slot1)
	if slot0.cur_select and slot0.cur_select.index == slot1 then
		return
	end

	if (slot1 or 1) < 1 or slot1 > 2 then
		slot1 = 1
	end

	if slot0.cur_select ~= nil then
		slot0.cur_select.label:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.cur_select:setBright(false)
	end

	slot0.cur_select = slot0.btn_list[slot1]

	if slot0.cur_select ~= nil then
		slot0.cur_select.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.cur_select:setBright(true)
	end
end

function BugPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
end

function BugPanel.close_callback(slot0)
	slot0.ctrl:closeBugPanel()
end
