NoticeController = NoticeController or BaseClass(BaseController)

function NoticeController.config(slot0)
	slot0.model = NoticeModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function NoticeController.getModel(slot0)
	return slot0.model
end

function NoticeController.registerEvents(slot0)
end

function NoticeController.registerProtocals(slot0)
	slot0:RegisterProtocal(10810, "handle10810")
	slot0:RegisterProtocal(10811, "handle10811")
	slot0:RegisterProtocal(10813, "handle10813")
	slot0:RegisterProtocal(10814, "handle10814")
end

function NoticeController.sender10810(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0:SendProtocal(10810, {
		issue_type = slot1 or "",
		title = slot2 or "",
		content = slot3 or "",
		phone = slot4 or "",
		email = slot5 or "",
		phone_info = slot6,
		id = slot7 or 0
	})
end

function NoticeController.handle10810(slot0, slot1)
	message(slot1.msg)

	if slot1 ~= nil and next(slot1) ~= nil then
		slot0.dispather:Fire(NoticeEvent.Feedback_Success_Event, slot1)
	end
end

function NoticeController.sender10811(slot0, slot1, slot2)
	slot0:SendProtocal(10811, {
		id = slot1,
		score = slot2
	})
end

function NoticeController.handle10811(slot0, slot1)
	if slot1 ~= nil and next(slot1) ~= nil then
		slot0.dispather:Fire(NoticeEvent.Feedback_Evaluate_Success_Event, slot1)
	end
end

function NoticeController.sender10813(slot0)
	slot0:SendProtocal(10813, {})
end

function NoticeController.handle10813(slot0, slot1)
	if slot1 ~= nil and next(slot1) ~= nil then
		slot0.model:setFeedBackData(slot1)
		slot0.dispather:Fire(NoticeEvent.All_Feedback_Event_Data)
	end
end

function NoticeController.sender10814(slot0, slot1)
	slot0:SendProtocal(10814, {
		id = slot1
	})
end

function NoticeController.handle10814(slot0, slot1)
	if slot1 ~= nil and next(slot1) ~= nil then
		slot0.model:setContentData(slot1)
		slot0.dispather:Fire(NoticeEvent.All_Question_Info_List_Event)
	end
end

function NoticeController.openNoticeView(slot0, slot1)
	if not slot0.notice_view then
		slot0.notice_view = NoticeWindow.New(slot1)
	end

	if not slot0.notice_view:isOpen() then
		slot0.notice_view:open()
	end
end

function NoticeController.closeNoticeView(slot0)
	if slot0.notice_view then
		slot0.notice_view:close()

		slot0.notice_view = nil
	end
end

function NoticeController.setNoticeContent(slot0, slot1, slot2)
	if not slot0.notice_content then
		slot0.notice_content = {}
	end

	slot0.notice_content[slot1] = slot2
end

function NoticeController.getNoticeContent(slot0, slot1)
	return slot0.notice_content and slot0.notice_content[slot1] or nil
end

function NoticeController.openServiceCenterWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.service_center_window then
			slot0.service_center_window = ServiceCenterWindow.New()
		end

		if slot0.service_center_window:isOpen() == false then
			slot0.service_center_window:open(slot2)
		end
	elseif slot0.service_center_window then
		slot0.service_center_window:close()

		slot0.service_center_window = nil
	end
end

function NoticeController.openFeedbackDetailWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.feedback_detail_window then
			slot0.feedback_detail_window = FeedbackDetailWindow.New()
		end

		if slot0.feedback_detail_window:isOpen() == false then
			slot0.feedback_detail_window:open(slot2, slot3, slot4)
		end
	elseif slot0.feedback_detail_window then
		slot0.feedback_detail_window:close()

		slot0.feedback_detail_window = nil
	end
end

function NoticeController.closeBugPanel(slot0)
	if slot0.bug_panel then
		slot0.bug_panel:close()

		slot0.bug_panel = nil
	end
end

function NoticeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
