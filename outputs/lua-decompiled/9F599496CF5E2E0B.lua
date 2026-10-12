MailVo = MailVo or BaseClass()

function MailVo.__init(slot0)
	slot0.id = 0
	slot0.srv_id = ""
	slot0.type = 1
	slot0.from_name = ""
	slot0.subject = ""
	slot0.content = ""
	slot0.assets = {}
	slot0.items = {}
	slot0.send_time = 0
	slot0.send_time_order = 0
	slot0.read_time = 0
	slot0.time_out = 0
	slot0.status = 0
	slot0.is_has = 1
	slot0.has_items = 0
end

function MailVo.setContent(slot0, slot1)
	slot0.mail_content = slot1
end

function MailVo.initAttrData(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0:update(slot5, slot6)

			if slot1.send_time then
				slot0:update("send_time_order", -slot1.send_time)
			end

			if slot1.assets or slot1.items then
				if #slot1.assets > 0 or #slot1.items > 0 then
					slot0:update("is_has", 0)
				else
					slot0:update("is_has", 1)
				end
			end
		end
	end
end

function MailVo.removeAssets(slot0, slot1)
	if slot1 then
		slot0.read_time = slot1
	end

	slot0.items = {}
	slot0.assets = {}
	slot0.status = 2
	slot0.has_items = 0
end

function MailVo.update(slot0, slot1, slot2)
	if slot0[slot1] then
		slot0[slot1] = slot2
	end
end

function MailVo.setReaded(slot0, slot1)
	if slot1 then
		slot0.read_time = slot1
	end

	slot0.status = 1
end

NoticeVo = NoticeVo or BaseClass()

function NoticeVo.__init(slot0)
	slot0.id = 0
	slot0.type = 1
	slot0.title = ""
	slot0.summary = ""
	slot0.content = ""
	slot0.start_time = 0
	slot0.end_time = 0
	slot0.flag = 0
end

function NoticeVo.initAttrData(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			slot0:update(slot5, slot6)
		end
	end
end

function NoticeVo.update(slot0, slot1, slot2)
	if slot0[slot1] then
		slot0[slot1] = slot2
	end
end

function NoticeVo.setReaded(slot0)
	slot0.flag = 1
end
