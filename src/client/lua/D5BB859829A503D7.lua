NoticeModel = NoticeModel or BaseClass()

function NoticeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function NoticeModel.config(slot0)
	slot0.feed_back_list = {}
	slot0.all_count = 0
	slot0.replied_count = 0
	slot0.wait_count = 0
	slot0.reply_content_list = {}
	slot0.trace_content_list = {}
	slot0.time_data = {}
	slot0.red_status = false
end

function NoticeModel.setFeedBackData(slot0, slot1)
	slot0:config()

	if slot1.feedback_logs ~= nil and next(slot3) ~= nil then
		function slot7(slot0, slot1)
			return slot1.end_msg_time < slot0.end_msg_time
		end

		table.sort(slot3, slot7)

		for slot7, slot8 in pairs(slot3) do
			table.insert(slot0.feed_back_list, {
				id = slot8.id,
				title = slot8.title,
				content = slot8.content,
				state = slot8.state,
				status2 = slot8.status2,
				end_msg_time = slot8.end_msg_time,
				start_time = slot8.start_time,
				finish_time = slot8.finish_time,
				score_time = slot8.score_time
			})

			if slot8.state == 2 then
				slot0.replied_count = slot0.replied_count + 1
			end

			if slot8.state == 3 then
				slot0.wait_count = slot0.wait_count + 1
			end

			if (slot8.state == 2 or slot8.status2 == 3) and slot8.status2 == 0 then
				slot0.red_status = true
			end
		end

		slot0.all_count = #slot3
	end
end

function NoticeModel.getFeedBackData(slot0)
	if slot0.feed_back_list ~= nil and next(slot0.feed_back_list) ~= nil then
		table.sort(slot0.feed_back_list, function (slot0, slot1)
			return slot0.end_msg_time < slot1.end_msg_time
		end)
		table.sort(slot0.feed_back_list, function (slot0, slot1)
			if slot0.end_msg_time == 0 then
				return slot1.start_time < slot0.start_time
			end
		end)

		return slot0.feed_back_list
	end
end

function NoticeModel.getTimeData(slot0)
	if slot0.time_data ~= nil and next(slot0.time_data) ~= nil then
		return slot0.time_data
	end
end

function NoticeModel.setContentData(slot0, slot1)
	slot0:config()

	if slot1 ~= nil and next(slot1) ~= nil then
		if slot1.end_msg_time then
			slot0.time_data.end_msg_time = slot1.end_msg_time
		end

		if slot1.start_time then
			slot0.time_data.start_time = slot1.start_time
		end

		if slot1.finish_time then
			slot0.time_data.finish_time = slot1.finish_time
		end

		if slot1.status2 then
			slot0.time_data.state = slot1.state
		end

		if slot1.questions_lists ~= nil and next(slot2) ~= nil then
			slot0:setTraceContentData(slot2)
		end

		if slot1.answer_lists ~= nil and next(slot3) ~= nil then
			slot0:setAnswerContentData(slot3)
		end
	end
end

function NoticeModel.setTraceContentData(slot0, slot1)
	function slot6(slot0, slot1)
		return slot1.questions_timer < slot0.questions_timer
	end

	table.sort(slot1, slot6)

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot0.trace_content_list, {
			questions_timer = slot1[slot6].questions_timer,
			questions_content = slot1[slot6].questions_content
		})
	end
end

function NoticeModel.setAnswerContentData(slot0, slot1)
	function slot6(slot0, slot1)
		return slot1.answer_timer < slot0.answer_timer
	end

	table.sort(slot1, slot6)

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot0.reply_content_list, {
			answer_timer = slot1[slot6].answer_timer,
			answer_content = slot1[slot6].answer_content
		})
	end
end

function NoticeModel.getTraceContentData(slot0, ...)
	if slot0.trace_content_list ~= nil and next(slot0.trace_content_list) ~= nil then
		return slot0.trace_content_list
	end
end

function NoticeModel.getAnswerContentData(slot0, ...)
	if slot0.reply_content_list ~= nil and next(slot0.reply_content_list) ~= nil then
		return slot0.reply_content_list
	end
end

function NoticeModel.getRedStatus(slot0, ...)
	return slot0.red_status
end

function NoticeModel.getCount(slot0)
	return {
		wait_count = slot0.wait_count,
		all_count = slot0.all_count,
		replied_count = slot0.replied_count
	}
end

function NoticeModel.__delete(slot0)
end
