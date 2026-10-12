FeedbackDetailWindow = FeedbackDetailWindow or BaseClass(BaseView)
slot0 = NoticeController:getInstance()

function FeedbackDetailWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "notice/feedback_detail_window"
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.title_height = 0
	slot0.title = ""
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_3"),
			type = ResourcesType.single
		}
	}
	slot0.cache_list = {}
	slot0.cache_list_2 = {}
	slot0.choose_star_list = {}
	slot0.star = {}
	slot0.choose_star = 0
	slot0.txt_title = TI18N("当前状态：")
	slot0.text_info = {
		TI18N("已提交"),
		TI18N("已回复"),
		TI18N("未评价"),
		TI18N("已完成"),
		TI18N("已完成")
	}
	slot0.is_shrink = false
	slot0.container_list_2 = {}
	slot0.container_list_1 = {}
	slot0.is_first_1 = true
end

function FeedbackDetailWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("backpanel")

	slot1:setScale(display.getMaxScale())

	slot0.background = slot1:getChildByName("background")
	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")

	slot0.top_panel:getChildByName("title_label"):setString(TI18N("问题详情"))

	if PathTool.getPlistImgForDownLoad("bigbg", "pattern/pattern_3") ~= nil then
		createSprite(slot2, slot0.main_panel:getContentSize().width / 2, 25, slot0.main_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScaleX(0.85)
	end

	slot0.main_container = slot0.main_panel:getChildByName("main_container")
	slot0.layout_quest = slot0.main_container:getChildByName("layout_quest")
	slot0.quest_title_bg = slot0.layout_quest:getChildByName("quest_title_bg")
	slot0.quest_title_desc = slot0.quest_title_bg:getChildByName("quest_title_desc")
	slot0.btn_quest_release = slot0.quest_title_bg:getChildByName("btn_quest_release")

	slot0.btn_quest_release:setVisible(false)

	slot0.layout_quest_content = slot0.layout_quest:getChildByName("layout_quest_content")
	slot0.quest_scroll = slot0.layout_quest:getChildByName("quest_scroll")

	slot0.quest_scroll:setScrollBarEnabled(false)

	slot0.quest_scroll_size = slot0.quest_scroll:getContentSize()
	slot0.layout_reply = slot0.main_container:getChildByName("layout_reply")
	slot0.reply_title_bg = slot0.layout_reply:getChildByName("reply_title_bg")
	slot0.reply_title_desc = slot0.reply_title_bg:getChildByName("reply_title_desc")

	slot0.reply_title_desc:setString(TI18N("客服回复："))

	slot0.reply_scroll = slot0.layout_reply:getChildByName("reply_scrol")

	slot0.reply_scroll:setScrollBarEnabled(false)
	slot0.reply_scroll:setPositionY(400)

	slot0.reply_scroll_size = slot0.reply_scroll:getContentSize()
	slot0.txt_first_label = slot0.layout_reply:getChildByName("txt_first_label")

	slot0.txt_first_label:setVisible(false)

	slot0.layout_reply_content = slot0.layout_reply:getChildByName("layout_reply_content")
	slot0.layout_continue_reply = slot0.main_container:getChildByName("layout_continue_reply")

	slot0.layout_continue_reply:setPositionY(325)

	slot0.continue_reply_title_bg = slot0.layout_continue_reply:getChildByName("continue_reply_title_bg")
	slot0.continue_scroll = slot0.continue_reply_title_bg:getChildByName("continue_scroll")

	slot0.continue_scroll:setScrollBarEnabled(false)

	slot0.continue_reply_title_desc = slot0.layout_continue_reply:getChildByName("continue_reply_title_desc")

	slot0.continue_reply_title_desc:setString(TI18N("继续提问："))

	slot0.btn_continue = slot0.layout_continue_reply:getChildByName("btn_continue")
	slot0.btn_continue_label = slot0.btn_continue:getChildByName("btn_continue_label")

	slot0.btn_continue_label:setString(TI18N("继续提问"))

	slot0.btn_ok = slot0.layout_continue_reply:getChildByName("btn_ok")
	slot0.btn_ok_label = slot0.btn_ok:getChildByName("btn_ok_label")

	slot0.btn_ok_label:setString(TI18N("继续提交"))
	slot0.btn_ok:setVisible(false)

	slot0.btn_finish = slot0.layout_continue_reply:getChildByName("btn_finish")
	slot0.btn_finish_label = slot0.btn_finish:getChildByName("btn_finish_label")

	slot0.btn_finish_label:setString(TI18N("已解决"))

	slot0.btn_cancel = slot0.layout_continue_reply:getChildByName("btn_cancel")
	slot0.btn_cancel_label = slot0.btn_cancel:getChildByName("btn_cancel_label")

	slot0.btn_cancel_label:setString(TI18N("取消"))
	slot0.btn_cancel:setVisible(false)

	slot0.layout_evaluate = slot0.main_container:getChildByName("layout_evaluate")
	slot0.txt_evaluate = slot0.layout_evaluate:getChildByName("txt_evaluate")

	slot0.txt_evaluate:setString(TI18N("对本次服务进行评价"))

	slot6 = "layout_star"
	slot0.layout_star = slot0.layout_evaluate:getChildByName(slot6)

	for slot6 = 1, 5 do
		slot7 = slot0.layout_star:getChildByName("shadow_star_" .. slot6)

		slot7:setVisible(true)

		slot8 = slot0.layout_star:getChildByName("star_" .. slot6)

		slot7:setTouchEnabled(true)
		slot8:setVisible(false)

		slot0.choose_star_list[slot6] = slot7
		slot0.choose_star_list[slot6].index = slot6
		slot0.star[slot6] = slot8
	end

	slot0.layout_continue_reply:setVisible(false)
	slot0.layout_evaluate:setVisible(false)

	slot0.txt_cur_status = slot0.main_container:getChildByName("txt_cur_status")

	slot0.txt_cur_status:setString(TI18N("已提交"))

	slot0.txt_time_evaluate = slot0.main_container:getChildByName("txt_time_evaluate")

	slot0.txt_time_evaluate:setString("2020-01-01")

	slot0.txt_time_finish = slot0.main_container:getChildByName("txt_time_finish")

	slot0.txt_time_finish:setString("2020-01-01")

	slot0.txt_time_commit = slot0.main_container:getChildByName("txt_time_commit")

	slot0.txt_time_commit:setString("2020-01-01")
	slot0:createProblemContentBox()
end

function FeedbackDetailWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:openFeedbackDetailWindow(false)
		end
	end)
	slot0.btn_quest_release:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:shrinkQuestScroll()
		end
	end)

	if slot0.background then
		registerButtonEventListener(slot0.background, function ()
			uv0:openFeedbackDetailWindow(false)
		end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	if slot0.btn_continue then
		registerButtonEventListener(slot0.btn_continue, function ()
			uv0.btn_continue:setVisible(false)
			uv0.btn_ok:setVisible(true)
			uv0.btn_finish:setVisible(false)
			uv0.btn_cancel:setVisible(true)
			uv0:setSolveState(1)
		end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	if slot0.btn_ok then
		registerButtonEventListener(slot0.btn_ok, function ()
			uv0:sender10810(4, uv1.title_str, uv1.quest_content_str, "", "", "", uv1.question_id)
		end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	if slot0.btn_finish then
		registerButtonEventListener(slot0.btn_finish, function ()
			uv0:sender10811(uv1.question_id, 0)
		end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	if slot0.btn_cancel then
		registerButtonEventListener(slot0.btn_cancel, function ()
			uv0:setSolveState(2)
		end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	end

	slot0:addGlobalEvent(NoticeEvent.Feedback_Evaluate_Success_Event, function (slot0)
		if slot0 == nil then
			return
		end

		if slot0.code == 1 then
			message(slot0.msg)
		end
	end)
	slot0:addGlobalEvent(NoticeEvent.Feedback_Success_Event, function (slot0)
		if slot0 == nil then
			return
		end

		if slot0.code == 1 then
			uv0:setSolveState(2)
			message(slot0.msg)
			uv0.problem_inputBox:setText("")
		end
	end)

	slot4 = NoticeEvent.All_Question_Info_List_Event

	function slot5()
		uv0:RemoveAll()
		uv0:setTraceDataList()
		uv0:createAnswerList()
		uv0:setTime()
	end

	slot0:addGlobalEvent(slot4, slot5)

	for slot4, slot5 in pairs(slot0.choose_star_list) do
		slot0.choose_star_list[slot4]:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:setStarStatus(uv1)
				uv2:sender10811(uv0.question_id, tonumber(uv1))
			end
		end)
	end
end

function FeedbackDetailWindow.shrinkQuestScroll(slot0, ...)
end

function FeedbackDetailWindow.RemoveAll(slot0, ...)
	slot0.answer_list = {}
	slot0.render_list = {}
	slot0.cache_list = {}
	slot0.cache_list_2 = {}

	slot0.reply_scroll:removeAllChildren()
	slot0.quest_scroll:removeAllChildren()
end

function FeedbackDetailWindow.setTime(slot0)
	slot1 = uv0:getModel():getTimeData()

	slot0.txt_time_commit:setString(TI18N("提交时间：") .. TimeTool.getYMDHMS(slot1.start_time))
	slot0.txt_time_finish:setString(TI18N("完成时间：") .. TimeTool.getYMDHMS(slot1.finish_time))
	slot0.txt_cur_status:setString(TI18N("当前状态：") .. slot0.text_info[slot1.state])
	slot0.txt_time_evaluate:setString(TI18N("评价时间：") .. TimeTool.getYMDHMS(slot1.score_time))
	slot0:setTimeOpacityState(slot1.state)

	if slot1.state == 5 then
		slot0.txt_first_label:setVisible(true)
		slot0.txt_first_label:setString(TI18N("         亲爱的船长大人：您的问题已经为您解答，记\n得查看哟，系统将自动为您关闭工单，如有疑问可以\n再次联系小客服反馈哟~"))
		slot0.reply_scroll:setPositionY(335)
	end

	slot0:setLayoutStatus(slot1.state)
end

function FeedbackDetailWindow.setTimeOpacityState(slot0, slot1)
	if (slot1 or 1) == 1 or slot2 == 2 then
		slot0.txt_time_commit:setVisible(true)
		slot0.txt_time_commit:setPositionY(80)
		slot0.txt_time_finish:setVisible(false)
		slot0.txt_time_evaluate:setVisible(false)
	elseif slot2 == 3 then
		slot0.txt_time_finish:setVisible(false)
		slot0.txt_time_evaluate:setVisible(true)
		slot0.txt_time_evaluate:setPositionY(80)
		slot0.txt_time_commit:setVisible(true)
		slot0.txt_time_commit:setOpacity(178)
		slot0.txt_time_commit:setPositionY(50)
	elseif slot2 == 4 or slot2 == 5 then
		slot0.txt_time_commit:setVisible(true)
		slot0.txt_time_commit:setOpacity(178)
		slot0.txt_time_commit:setPositionY(20)
		slot0.txt_time_finish:setVisible(true)
		slot0.txt_time_finish:setOpacity(178)
		slot0.txt_time_finish:setPositionY(50)
		slot0.txt_time_evaluate:setPositionY(80)
		slot0.txt_time_evaluate:setOpacity(255)
		slot0.txt_time_evaluate:setVisible(true)
	end
end

function FeedbackDetailWindow.setStarStatus(slot0, slot1)
	for slot6 = 1, slot1 or 1 do
		slot0.star[slot6]:setVisible(true)
	end
end

function FeedbackDetailWindow.createProblemContentBox(slot0)
	if not slot0.problem_inputBox then
		slot0.problem_inputBox = createEditBox(slot0.continue_scroll, PathTool.getResFrame("common", "common_99998"), cc.size(533, 90), Config.ColorData.data_color3[274], 24, cc.c3b(140, 140, 139), 24, TI18N("请进一步描述您的问题,(不少于10字)"), cc.p(0, 300), 150, LOADTEXT_TYPE_PLIST)
	end

	slot0.problem_inputBox:setAnchorPoint(cc.p(0, 1))
	slot0.problem_inputBox:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0.begin_change_title then
				uv0.begin_change_title = false

				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv0.quest_content_str then
					if StringUtil.SubStringGetTotalIndex(slot2) <= 10 then
						message(TI18N("内容长度不符合要求"))
						uv0.problem_inputBox:setText("")

						uv0.quest_content_str = ""
					else
						uv0.problem_inputBox:setText(slot2)

						uv0.quest_content_str = slot2
					end
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

function FeedbackDetailWindow.createAnswerList(slot0)
	slot0.answer_list = uv0:getModel():getAnswerContentData()

	if slot0.answer_list ~= nil and next(slot0.answer_list) ~= nil then
		for slot4, slot5 in ipairs(slot0.answer_list) do
			delayRun(slot0.reply_scroll, slot4 / display.DEFAULT_FPS, function ()
				uv0:createList_2(uv1)
			end)
		end
	end
end

function FeedbackDetailWindow.setTraceDataList(slot0)
	slot0.render_list = uv0:getModel():getTraceContentData()

	for slot4, slot5 in ipairs(slot0.render_list) do
		delayRun(slot0.quest_scroll, slot4 / display.DEFAULT_FPS, function ()
			uv0:createList_1(uv1)
		end)
	end
end

function FeedbackDetailWindow.createList_2(slot0, slot1)
	slot2, slot3 = slot0:createTitleContent_2(slot1)

	slot0.reply_scroll:addChild(slot2)
	table.insert(slot0.cache_list_2, slot2)

	slot0.max_height_reply = slot0.max_height_reply + slot3 + 30
	slot10 = slot0.reply_scroll_size.width

	slot0.reply_scroll:setInnerContainerSize(cc.size(slot10, math.max(slot0.max_height_reply, slot0.reply_scroll_size.height)))

	slot5 = 0

	for slot9, slot10 in ipairs(slot0.cache_list_2) do
		slot10:setPosition(0, slot4 - slot5)

		if slot9 == 1 then
			slot10:setOpacity(255)
			slot10:setPositionX(-20)
		else
			slot10:setOpacity(178)
		end

		slot5 = slot5 + slot10:getContentSize().height
	end
end

function FeedbackDetailWindow.createTitleContent_2(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0
	slot5 = createLabel(22, cc.c3b(149, 83, 34), nil, 52, -20, TimeTool.getYMDHMS(slot1.answer_timer), slot2, nil, cc.p(0, 1))
	slot6 = createLabel(22, cc.c3b(149, 83, 34), nil, 52, -50, slot1.answer_content, slot2, nil, cc.p(0, 1))

	slot6:setMaxLineWidth(560)

	slot3 = slot6:getContentSize().height + slot5:getContentSize().height + 35

	slot2:setContentSize(cc.size(slot0.reply_scroll_size.width - 8, slot3))
	slot5:setPositionY(slot3 - 15)
	createLabel(13, cc.c3b(149, 83, 34), nil, 26, -20, TI18N("● "), slot2, nil, cc.p(0, 1)):setPositionY(slot3 - 18)
	slot6:setPositionY(slot5:getPositionY() - 35)

	return slot2, slot3
end

function FeedbackDetailWindow.getMaxLength(slot0, slot1, slot2)
	slot4 = ""

	return StringUtil.SubStringGetTotalIndex(slot1) <= slot2 and slot1 or StringUtil.SubStringUTF8(slot1, 1, slot2) .. ".."
end

function FeedbackDetailWindow.createList_1(slot0, slot1)
	slot2, slot3 = slot0:createTitleContent_1(slot1)

	slot0.quest_scroll:addChild(slot2)
	table.insert(slot0.cache_list, slot2)

	slot0.max_height_quest = slot0.max_height_quest + slot3 + 10
	slot10 = slot0.quest_scroll_size.width

	slot0.quest_scroll:setInnerContainerSize(cc.size(slot10, math.max(slot0.max_height_quest, slot0.quest_scroll_size.height)))

	slot5 = 0

	for slot9, slot10 in ipairs(slot0.cache_list) do
		slot10:setPosition(0, slot4 - slot5)

		if slot9 == 1 then
			slot10:setOpacity(255)
		else
			slot10:setOpacity(178)
		end

		slot5 = slot5 + slot10:getContentSize().height + 10
	end
end

function FeedbackDetailWindow.createTitleContent_1(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0
	slot6 = createLabel(22, cc.c3b(100, 50, 35), nil, 160, -20, TimeTool.getYMDHMS(slot1.questions_timer), slot2, nil, cc.p(0, 1))
	slot7 = createLabel(22, cc.c3b(100, 50, 35), nil, 32, -50, slot1.questions_content, slot2, nil, cc.p(0, 1))

	slot7:setMaxLineWidth(560)

	slot3 = slot7:getContentSize().height + slot6:getContentSize().height + 35

	slot2:setContentSize(cc.size(slot0.quest_scroll_size.width - 8, slot3))
	createLabel(24, cc.c3b(100, 50, 35), nil, 32, -20, TI18N("详细描述："), slot2, nil, cc.p(0, 1)):setPositionY(slot3 - 15)
	createLabel(15, cc.c3b(100, 50, 35), nil, 10, -20, TI18N("● "), slot2, nil, cc.p(0, 1)):setPositionY(slot3 - 20)
	slot6:setPositionY(slot3 - 15)
	slot7:setPositionY(slot6:getPositionY() - 35)

	return slot2, slot3
end

function FeedbackDetailWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.question_id = slot1 or 0
	slot0.max_height_quest = 0
	slot0.max_height_reply = 0
	slot0.status = slot3

	slot0.txt_cur_status:setString(slot0.txt_title .. slot0.text_info[slot0.status])

	slot0.title_str = slot0:getMaxLength(slot2, 13)
	slot0.continue_status = 1
	slot0.max_length_str = ""
	slot0.btn_continue_status = 1

	if slot0.title_str ~= nil then
		slot4 = TI18N("问题：") .. slot0.title_str
	end

	slot0.quest_title_desc:setString(slot4)
	uv0:sender10814(slot0.question_id)
	slot0:setLayoutStatus(slot0.status)
end

function FeedbackDetailWindow.setLayoutStatus(slot0, slot1)
	slot0.layout_quest:setVisible(true)
	slot0.layout_reply:setVisible(true)

	if (slot1 or 1) == 1 or slot2 == 4 then
		slot0.layout_evaluate:setVisible(false)
		slot0.layout_continue_reply:setVisible(false)
	elseif slot2 == 2 then
		slot0:setSolveState(2)
		slot0.layout_continue_reply:setVisible(true)
		slot0.continue_reply_title_desc:setPosition(175, 107)
		slot0.continue_reply_title_bg:setVisible(false)
		slot0.layout_evaluate:setVisible(false)
	elseif slot2 == 3 then
		slot0.layout_evaluate:setVisible(true)
		slot0.reply_scroll:setTouchEnabled(false)
		slot0.layout_continue_reply:setVisible(false)
	end
end

function FeedbackDetailWindow.setSolveState(slot0, slot1)
	slot0.btn_continue_status = slot1 or 2

	if slot1 == 1 then
		slot0.layout_continue_reply:setVisible(true)
		slot0.layout_continue_reply:setContentSize(cc.size(560, 210))
		slot0.layout_continue_reply:setPositionY(325)
		slot0.continue_reply_title_desc:setPosition(230, 107)
		slot0.continue_reply_title_desc:setString(TI18N("继续提问"))
		slot0.continue_reply_title_bg:setVisible(true)
		slot0.btn_continue:setVisible(false)
		slot0.btn_cancel:setVisible(true)
		slot0.btn_ok:setVisible(true)
		slot0.btn_finish:setVisible(false)
	else
		slot0.layout_continue_reply:setVisible(true)
		slot0.layout_continue_reply:setContentSize(cc.size(560, 150))
		slot0.layout_continue_reply:setPositionY(265)
		slot0.continue_reply_title_desc:setPosition(175, 107)
		slot0.continue_reply_title_desc:setString(TI18N("您得问题是否已解决？"))
		slot0.continue_reply_title_bg:setVisible(false)
		slot0.btn_continue:setVisible(true)
		slot0.btn_cancel:setVisible(false)
		slot0.btn_ok:setVisible(false)
		slot0.btn_finish:setVisible(true)
	end
end

function FeedbackDetailWindow.close_callback(slot0)
	uv0:sender10813()
	slot0:RemoveAll()
	doStopAllActions(slot0.main_panel)
	uv0:openFeedbackDetailWindow(false)
end
