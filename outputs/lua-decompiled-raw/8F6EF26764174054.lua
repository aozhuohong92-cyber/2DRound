ServiceCenterWindow = ServiceCenterWindow or BaseClass(BaseView)
slot0 = NoticeController:getInstance()
slot1 = RoleController:getInstance():getRoleVo()
slot2 = LoginController:getInstance():getModel()
slot3 = {
	history_feedback = 2,
	contact_service = 1
}

function ServiceCenterWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.layout_name = "notice/service_center_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_3"),
			type = ResourcesType.single
		}
	}
	slot0.btn_list = {}
	slot0.choose_btn_list = {}
	slot0.choost_status = 1
	slot0.warning_str = ""
	slot0.email_str = ""
	slot0.phone_num_str = ""
	slot0.quest_content_str = ""
	CUSTOMER_QQ = CUSTOMER_QQ or 800185843
	slot0.placeholder_list = {
		string.format(TI18N("    请详细描述您遇到的问题或建议(字数不少于\n10字)，如遇到紧急问题，请联系QQ：\n%s"), CUSTOMER_QQ),
		TI18N("请输入手机号码"),
		TI18N("请输入邮箱地址")
	}
	slot0.cell_data_list = {}
	slot0.cache_list = {}
end

function ServiceCenterWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setScale(display.getMaxScale())

	slot0.background = slot1:getChildByName("background")
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")

	slot0.top_panel:getChildByName("title_label"):setString(TI18N("客服中心"))

	if PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_3") ~= nil then
		createSprite(slot2, slot0.main_panel:getContentSize().width / 2, 25, slot0.main_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScaleX(0.85)
	end

	slot6 = "tab_container"
	slot0.tab_container = slot0.main_panel:getChildByName(slot6)

	for slot6 = 1, 2 do
		slot7 = slot0.tab_container:getChildByName("tab_btn_" .. slot6)
		slot7.red_tips = slot7:getChildByName("red_tips")
		slot7.label = slot7:getChildByName("title")
		slot0.btn_list[slot6] = slot7

		slot7.red_tips:setVisible(false)
		slot7:setBright(false)

		slot0.btn_list[slot6].index = slot6

		if slot6 == 1 then
			slot8:setString(TI18N("联系客服"))
		else
			slot8:setString(TI18N("历史反馈"))
		end
	end

	slot0.contact_container = slot0.main_panel:getChildByName("contact_container")

	slot0.contact_container:getChildByName("question_desc"):setString(TI18N("问题描述*："))

	slot0.Image_21 = slot0.contact_container:getChildByName("Image_21")
	slot0.quest_scroll = slot0.Image_21:getChildByName("quest_scroll")

	slot0.quest_scroll:setScrollBarEnabled(false)
	slot0.quest_scroll:setTouchEnabled(false)
	slot0:createProblemContentBox()

	slot0.tab_info = slot0.contact_container:getChildByName("tab_info")
	slot0.txt_feedback_type = slot0.tab_info:getChildByName("txt_feedback_type")

	slot0.txt_feedback_type:setString(TI18N("反馈类型*："))

	slot0.CheckBox_choose_1 = slot0.txt_feedback_type:getChildByName("CheckBox_choose_1")
	slot0.CheckBox_choose_2 = slot0.txt_feedback_type:getChildByName("CheckBox_choose_2")
	slot0.CheckBox_choose_3 = slot0.txt_feedback_type:getChildByName("CheckBox_choose_3")

	for slot7 = 1, 3 do
		slot0.txt_feedback_type:getChildByName("txt_choose_" .. slot7):setString(({
			TI18N("Bug反馈"),
			TI18N("功能建议"),
			TI18N("其他反馈")
		})[slot7])

		slot0.choose_btn_list[slot7] = slot0.txt_feedback_type:getChildByName("CheckBox_choose_" .. slot7)
		slot0.choose_btn_list[slot7].index = slot7
	end

	slot0.tel_info = slot0.tab_info:getChildByName("tel_info")

	slot0.tel_info:setString(TI18N("手机号码："))

	slot0.tel_input = slot0.tel_info:getChildByName("tel_input")
	slot0.txt_tel_error = slot0.tel_input:getChildByName("txt_tel_error")

	slot0.txt_tel_error:setString(TI18N("填写不正确"))
	slot0.txt_tel_error:setVisible(false)
	slot0:createPhoneNumBox()

	slot0.mail_info = slot0.tab_info:getChildByName("mail_info")

	slot0.mail_info:setString(TI18N("邮箱地址："))

	slot0.email_input = slot0.mail_info:getChildByName("email_input")
	slot0.txt_email_error = slot0.email_input:getChildByName("txt_email_error")

	slot0.txt_email_error:setString(TI18N("填写不正确"))
	slot0.txt_email_error:setVisible(false)
	slot0:createEmailBox()

	slot0.srv_info = slot0.tab_info:getChildByName("srv_info")

	slot0.srv_info:setString(TI18N("区服信息："))

	slot0.txt_srv_name = slot0.srv_info:getChildByName("txt_srvname")
	slot0.role_info = slot0.tab_info:getChildByName("role_info")

	slot0.role_info:setString(TI18N("角色名字："))

	slot0.txt_role_name = slot0.role_info:getChildByName("txt_rolename")
	slot0.device_info = slot0.tab_info:getChildByName("device_info")

	slot0.device_info:setString(TI18N("设备信息："))

	slot0.txt_device_name = slot0.device_info:getChildByName("txt_device_name")
	slot0.device_info_str = slot0:getDeviceInfo()

	slot0.txt_device_name:setString(slot0.device_info_str)

	slot0.commit_btn = slot0.contact_container:getChildByName("commit_btn")
	slot0.explain_label = slot0.commit_btn:getChildByName("explain_label")

	slot0.explain_label:setString(TI18N("*标注为必填项"))

	slot0.commit_label = slot0.commit_btn:getChildByName("label")

	slot0.commit_label:setString(TI18N("提交反馈"))

	if uv0 then
		slot0.txt_srv_name:setString(uv1:getLoginData().srv_name)
		slot0.txt_role_name:setString(uv0.name)
	end

	slot0.feedback_container = slot0.main_panel:getChildByName("feedback_container")

	slot0.contact_container:setVisible(false)
	slot0.feedback_container:setVisible(false)

	slot0.list_info_layout = slot0.feedback_container:getChildByName("list_info_layout")
	slot0.num_all_questions = slot0.list_info_layout:getChildByName("num_all_questions")
	slot0.num_replied = slot0.list_info_layout:getChildByName("num_replied")
	slot0.num_wait = slot0.list_info_layout:getChildByName("num_wait")

	slot0.num_all_questions:setString(TI18N("问题数：0"))
	slot0.num_replied:setString(TI18N("已回复：0"))
	slot0.num_wait:setString(TI18N("待回复：0"))

	slot0.scroll_view = slot0.feedback_container:getChildByName("scroll_view")

	slot0:setCheckBoxStatus()

	if slot0:getIsChangePlaceHolder() == true then
		slot0.tel_info:setVisible(false)
		slot0.mail_info:setVisible(false)
		slot0.srv_info:setPositionY(230)
		slot0.role_info:setPositionY(160)
		slot0.device_info:setPositionY(90)
	end
end

function ServiceCenterWindow.getDeviceInfo(slot0)
	slot1 = ""

	return device.getDeviceName() ~= nil and slot2 or TI18N("无法显示")
end

function ServiceCenterWindow.createProblemContentBox(slot0)
	if not slot0.problem_inputBox then
		slot0.problem_inputBox = createEditBox(slot0.quest_scroll, PathTool.getResFrame("common", "common_99998"), cc.size(520, 140), Config.ColorData.data_color3[274], 24, cc.c3b(140, 140, 139), 24, slot0.placeholder_list[1], cc.p(5, 295), 150, LOADTEXT_TYPE_PLIST)
	end

	if slot0:getIsChangePlaceHolder() == true then
		slot0.problem_inputBox:setPlaceHolder(TI18N("        请详细描述您遇到的问题或建议（字数\n不少于10字）"))
	end

	slot0.problem_inputBox:setAnchorPoint(cc.p(0, 1))
	slot0.problem_inputBox:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_title then
				uv0.begin_change_title = false

				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.quest_content_str then
					uv0.quest_scroll:setTouchEnabled(false)

					uv0.quest_content_str = slot2

					uv0.problem_inputBox:setText(uv0.quest_content_str)
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_title then
				uv0.begin_change_title = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function ServiceCenterWindow.getMaxLength(slot0, slot1, slot2)
	slot4 = ""

	return StringUtil.SubStringGetTotalIndex(slot1) <= slot2 and slot1 or StringUtil.SubStringUTF8(slot1, 1, slot2) .. ".."
end

function ServiceCenterWindow.getIsChangePlaceHolder(slot0)
	if device.getChannel() == "66_1" or slot1 == "65_1" or slot1 == "51_1" or slot1 == "53_1" or slot1 == "52_1" or slot1 == "64_1" or slot1 == "69_1" or slot1 == "70_1" or slot1 == "55_1" or slot1 == "71_1" or slot1 == "58_1" or slot1 == "56_1" or slot1 == "54_1" or slot1 == "83_1" then
		return true
	else
		return false
	end
end

function ServiceCenterWindow.createPhoneNumBox(slot0)
	if not slot0.pnonenum_inputBox then
		slot0.pnonenum_inputBox = createEditBox(slot0.tel_input, PathTool.getResFrame("common", "common_99998"), cc.size(250, 45), Config.ColorData.data_color3[274], 24, cc.c3b(140, 140, 139), 22, slot0.placeholder_list[2], cc.p(0, 45), 11, LOADTEXT_TYPE_PLIST, cc.EDITBOX_INPUT_MODE_PHONENUMBER, cc.KEYBOARD_RETURNTYPE_DONE)
	end

	if slot0:getIsChangePlaceHolder() == true then
		slot0.pnonenum_inputBox:setPlaceHolder("")
	end

	slot0.pnonenum_inputBox:setAnchorPoint(cc.p(0, 1))
	slot0.pnonenum_inputBox:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_phonenum then
				uv0.begin_change_phonenum = false

				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.phone_num_str then
					uv0.phone_num_str = slot2

					uv0.pnonenum_inputBox:setText(slot2)

					if tonumber(uv0.phone_num_str) and #uv0.phone_num_str == 11 then
						uv0.txt_tel_error:setVisible(false)
					elseif uv0.phone_num_str == "" then
						uv0.txt_tel_error:setVisible(false)
					else
						uv0.txt_tel_error:setVisible(true)
					end
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_phonenum then
				uv0.txt_tel_error:setVisible(false)

				uv0.begin_change_phonenum = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function ServiceCenterWindow.createEmailBox(slot0, ...)
	if not slot0.email_inputBox then
		slot0.email_inputBox = createEditBox(slot0.email_input, PathTool.getResFrame("common", "common_99998"), cc.size(250, 45), Config.ColorData.data_color3[274], 24, cc.c3b(140, 140, 139), 22, slot0.placeholder_list[3], cc.p(0, 45), nil, LOADTEXT_TYPE_PLIST, cc.EDITBOX_INPUT_MODE_EMAILADDR)
	end

	if slot0:getIsChangePlaceHolder() == true then
		slot0.email_inputBox:setPlaceHolder("")
	end

	slot0.email_inputBox:setAnchorPoint(cc.p(0, 1))
	slot0.email_inputBox:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_email then
				uv0.begin_change_email = false

				slot1:setText("")

				if slot1:getText() ~= uv0.email_str then
					uv0.email_str = slot2 or ""

					uv0.email_inputBox:setText(uv0:getMaxLength(slot2, 18))

					if uv0:isRightEmail(tostring(uv0.email_str)) or uv0.email_str == "" then
						uv0.txt_email_error:setVisible(false)
					else
						uv0.txt_email_error:setVisible(true)
					end
				end
			end
		elseif slot0 == "began" then
			if not uv0.begin_change_email then
				uv0.txt_email_error:setVisible(false)

				uv0.begin_change_email = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function ServiceCenterWindow.isRightEmail(slot0, slot1)
	if string.len(slot1 or "") < 6 then
		return false
	end

	slot2, slot3 = string.find(slot1 or "", "@")
	slot4 = ""
	slot5 = ""

	if slot2 then
		slot4 = string.sub(slot1, 1, slot2 - 1)
		slot5 = string.sub(slot1, slot3 + 1, -1)
	else
		return false
	end

	slot6, slot7 = string.find(slot4, "[%w_]+")

	if slot6 ~= 1 or slot7 ~= string.len(slot4) then
		return false
	end

	if string.find(slot5, "^[%.]+") then
		return false
	end

	if string.find(slot5, "%.[%.]+") then
		return false
	end

	if string.find(slot5, "@") then
		return false
	end

	if string.find(slot5, "[%.]+$") then
		return false
	end

	_, count = string.gsub(slot5, "%.", "")

	if count < 1 or count > 3 then
		return false
	end

	return true
end

function ServiceCenterWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openServiceCenterWindow(false)
			end
		end)
	end

	if slot0.commit_btn then
		slot0.commit_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0:isCanCommit() then
					uv1:sender10810(tonumber(uv0.choost_status), uv0:getProblemTitle(), uv0.quest_content_str, uv0.phone_num_str, uv0.email_str, uv0.device_info_str)
				else
					CommonAlert.show(uv0.warning_str .. TI18N("填写不正确"), TI18N("确定"), nil, , , CommonAlert.type.common)
				end
			end
		end)
	end

	for slot4, slot5 in pairs(slot0.btn_list) do
		if slot5 then
			slot0.btn_list[slot4]:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	for slot4, slot5 in pairs(slot0.choose_btn_list) do
		slot0.choose_btn_list[slot4]:addEventListenerCheckBox(function (slot0, slot1)
			playButtonSound2()

			uv0.choost_status = uv1

			uv0:setCheckBoxStatus()
		end)
	end

	slot0:addGlobalEvent(NoticeEvent.All_Feedback_Event_Data, function ()
		uv0:setData()
		uv0:setRedStatus()
	end)
	slot0:addGlobalEvent(NoticeEvent.Feedback_Success_Event, function (slot0)
		if slot0 ~= nil and next(slot0) ~= nil and slot0.code == 1 then
			CommonAlert.show(TI18N("您的问题已提交成功！"), TI18N("前往查看"), function ()
				uv1:openFeedbackDetailWindow(true, uv2.id, uv0.quest_content_str or "", 1)
				uv0.problem_inputBox:setText("")
				uv0.email_inputBox:setText("")
				uv0.pnonenum_inputBox:setText("")
			end, nil, , CommonAlert.type.common)
		end
	end)
end

function ServiceCenterWindow.setRedStatus(slot0)
	slot0.btn_list[2].red_tips:setVisible(uv0:getModel():getRedStatus() or false)
end

function ServiceCenterWindow.setData(slot0)
	if slot0.common_scrollview == nil then
		slot0.common_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_view:getContentSize(), {
			start_y = 4,
			once_num = 1,
			start_x = 7,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 580,
			item_height = 121,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.cell_data_list = uv0:getModel():getFeedBackData() or {}
	slot1 = uv0:getModel():getCount()

	slot0.num_all_questions:setString(TI18N("问题数：") .. slot1.all_count)
	slot0.num_replied:setString(TI18N("已回复：") .. slot1.replied_count)
	slot0.num_wait:setString(TI18N("待评价：") .. slot1.wait_count)
	slot0.common_scrollview:reloadData()

	if next(slot0.cell_data_list) ~= nil then
		commonShowEmptyIcon(slot0.scroll_view, false)
	else
		commonShowEmptyIcon(slot0.scroll_view, true, {
			font_size = 22,
			offset_y = 6,
			scale = 1,
			text = TI18N("暂无反馈")
		})
	end
end

function ServiceCenterWindow.createNewCell(slot0, slot1, slot2)
	return FeedBackHistoryItem.new(slot1, slot2, slot0)
end

function ServiceCenterWindow.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ServiceCenterWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ServiceCenterWindow.getProblemTitle(slot0)
	if not slot0.quest_content_str then
		return
	end

	slot1 = ""

	return (StringUtil.SubStringGetTotalIndex(slot0.quest_content_str) > 13 or slot0.quest_content_str) and StringUtil.SubStringUTF8(slot0.quest_content_str, 1, 13)
end

function ServiceCenterWindow.setEmptyString(slot0)
end

function ServiceCenterWindow.isCanCommit(slot0)
	if StringUtil.SubStringGetTotalIndex(slot0.quest_content_str) <= 10 then
		slot0.warning_str = TI18N("问题描述")

		return false
	end

	if tonumber(slot0.phone_num_str) and #slot0.phone_num_str == 11 then
		-- Nothing
	elseif slot0.phone_num_str ~= "" then
		slot0.warning_str = TI18N("手机号码")

		return false
	end

	if not slot0:isRightEmail(slot0.email_str) then
		if slot0.email_str ~= "" then
			slot0.warning_str = TI18N("邮箱地址")

			return false
		end
	end

	return true
end

function ServiceCenterWindow.setCheckBoxStatus(slot0)
	for slot4 = 1, 3 do
		if slot0.choost_status == slot4 then
			slot0.choose_btn_list[slot4]:setSelectedState(true)
		else
			slot0.choose_btn_list[slot4]:setSelectedState(false)
		end
	end
end

function ServiceCenterWindow.changeSelectedTab(slot0, slot1)
	if slot0.selected_tab ~= nil and slot0.selected_tab.index == slot1 then
		return
	end

	if slot0.selected_tab then
		slot0.selected_tab:setBright(false)

		slot0.selected_tab = nil
	end

	slot0.selected_tab = slot0.btn_list[slot1]

	if slot0.selected_tab then
		slot0.selected_tab:setBright(true)
	end

	slot0.contact_container:setVisible(slot0.selected_tab.index == uv0.contact_service)
	slot0.feedback_container:setVisible(slot0.selected_tab.index == uv0.history_feedback)
end

function ServiceCenterWindow.openRootWnd(slot0, slot1)
	slot0.selected_index = slot1 or uv0.contact_service

	slot0:changeSelectedTab(slot0.selected_index)
	uv1:sender10813()
end

function ServiceCenterWindow.close_callback(slot0)
	uv0:openServiceCenterWindow(false)
end

FeedBackHistoryItem = class("feedback_history_item", function ()
	return ccui.Widget:create()
end)

function FeedBackHistoryItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function FeedBackHistoryItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("notice/feedback_history_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.txt_item_title = slot0.container:getChildByName("txt_item_title")
	slot0.txt_item_time = slot0.container:getChildByName("txt_item_time")
	slot0.txt_item_status = slot0.container:getChildByName("txt_item_status")
end

function FeedBackHistoryItem.register_event(slot0)
	registerButtonEventListener(slot0, function ()
		uv0:openFeedbackDetailWindow(true, uv1.id, uv1.title_label, uv1.state)
	end, false, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function FeedBackHistoryItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.id = slot1.id
	slot0.title_label = slot0:getTitleContent(slot1.content)
	slot0.state = slot1.state

	slot0.txt_item_title:setString(slot0.title_label)

	if slot1.end_msg_time == 0 then
		slot0.txt_item_time:setString(TimeTool.getYMDHMS(slot1.start_time))
	else
		slot0.txt_item_time:setString(TimeTool.getYMDHMS(slot1.end_msg_time))
	end

	slot2, slot3 = slot0:getTextInfo(slot1.state)

	slot0.txt_item_status:setString(slot2)
	slot0.txt_item_status:setTextColor(slot3)
end

function FeedBackHistoryItem.getTextInfo(slot0, slot1)
	slot2 = {
		{
			str = TI18N("已提交"),
			color = cc.c3b(36, 144, 3)
		},
		{
			str = TI18N("已回复"),
			color = cc.c3b(217, 80, 20)
		},
		{
			str = TI18N("未评价"),
			color = cc.c3b(217, 80, 20)
		},
		{
			str = TI18N("已完成"),
			color = cc.c3b(149, 83, 34)
		},
		{
			str = TI18N("已完成"),
			color = cc.c3b(149, 83, 34)
		}
	}

	return slot2[slot1].str, slot2[slot1].color
end

function FeedBackHistoryItem.getTitleContent(slot0, slot1)
	if not slot1 then
		return ""
	end

	slot3 = ""

	return StringUtil.SubStringGetTotalIndex(slot1) <= 13 and slot1 or StringUtil.SubStringUTF8(slot1, 1, 13) .. ".."
end

function FeedBackHistoryItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
