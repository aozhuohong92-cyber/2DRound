MailModel = MailModel or BaseClass()
MailModel.MAX_COUNT = 50

function MailModel.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.mail_list = {}
	slot0.notice_list = {}
	slot0.red_status_list = {}

	slot0:config()
end

function MailModel.config(slot0)
end

function MailModel.initMailList(slot0, slot1)
	slot0.mail_list = {}

	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot0.mail_list[getNorKey(slot7.id, slot7.srv_id)] == nil then
			slot0.mail_list[slot8] = MailVo.New()
		end

		slot9:initAttrData(slot7)
	end

	slot0:checkMailRedSum()
end

function MailModel.addMailItem(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot0.mail_list[getNorKey(slot7.id, slot7.srv_id)] == nil then
			slot0.mail_list[slot8] = MailVo.New()
		end

		slot9:initAttrData(slot7)
	end

	slot0:checkMailRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.UPDATE_ITEM)
end

function MailModel.checkMailRedSum(slot0)
	for slot5, slot6 in pairs(slot0.mail_list) do
		if slot6.status == 0 then
			slot1 = 0 + 1
		end
	end

	slot0:updateRedStatus(1, slot1)
end

function MailModel.getAllMailArray(slot0)
	slot1 = {}

	for slot6, slot7 in pairs(slot0.mail_list) do
		if slot7.time_out ~= 0 and slot7.time_out <= GameNet:getInstance():getTime() and slot7.has_items == 0 then
			-- Nothing
		elseif slot7.type == 1 or slot7.type == 3 then
			table.insert(slot1, slot7)
		end
	end

	if #slot1 > 0 then
		table.sort(slot1, SortTools.tableLowerSorter({
			"status",
			"has_items"
		}))
	end

	return slot1
end

function MailModel.delMailItem(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		slot0.mail_list[getNorKey(slot7.id, slot7.srv_id)] = nil
	end

	GlobalEvent:getInstance():Fire(MailEvent.UPDATE_ITEM)
end

function MailModel.readMailItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.mail_list[getNorKey(slot1.id, slot1.srv_id)] == nil then
		return
	end

	slot3:setReaded(slot1.read_time)
	slot0:checkMailRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.READ_MAIL_INFO, slot2)
end

function MailModel.getMailGood(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = getNorKey(slot1.id, slot1.srv_id)

	slot0.mail_list[slot2]:removeAssets()
	slot0:checkMailRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.GET_ITEM_ASSETS, slot2)
end

function MailModel.getAllMailGood(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot0.mail_list[getNorKey(slot7.id, slot7.srv_id)] then
			slot9:removeAssets(slot7.read_time)
		end
	end

	slot0:checkMailRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.UPDATE_ITEM)
end

function MailModel.getHasReadNonRewardList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.mail_list) do
		if slot6.id and slot6.srv_id and (slot6.status == 2 or slot6.status == 1 and slot6.has_items == 0) then
			table.insert(slot1, {
				id = slot6.id,
				srv_id = slot6.srv_id
			})
		end
	end

	return slot1
end

function MailModel.updateRedStatus(slot0, slot1, slot2)
	if slot0.red_status_list[slot1] == slot2 then
		return
	end

	slot0.red_status_list[slot1] = slot2

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.mail, {
		bid = slot1,
		num = slot2
	})
	GlobalEvent:getInstance():Fire(MailEvent.UPDATEREDSTATUS, slot1, slot2)
end

function MailModel.getRedSum(slot0, slot1)
	return slot0.red_status_list[slot1]
end

function MailModel.initNoticeList(slot0, slot1, slot2)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot1) do
		if slot0.notice_list[slot7.id] == nil then
			slot0.notice_list[slot7.id] = NoticeVo.New()
		end

		slot8:initAttrData(slot7)
	end

	slot0:checkNoticeRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.UPDATE_NOTICE)
end

function MailModel.checkNoticeRedSum(slot0)
	for slot5, slot6 in pairs(slot0.notice_list) do
		if slot6.flag == 0 then
			slot1 = 0 + 1
		end
	end

	slot0:updateRedStatus(2, slot1)
end

function MailModel.delNoticeItem(slot0, slot1)
	if slot0.notice_list[slot1] then
		slot0.notice_list[slot1] = nil
	end

	slot0:checkNoticeRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.UPDATE_NOTICE)
end

function MailModel.readNoticeItem(slot0, slot1)
	slot0:checkNoticeRedSum()
	GlobalEvent:getInstance():Fire(MailEvent.READ_INFO_NOTICE, slot1)
end

function MailModel.getNoticeArray(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.notice_list) do
		table.insert(slot1, slot6)
	end

	if #slot1 > 0 then
		table.sort(slot1, SortTools.tableLowerSorter({
			"flag",
			"start_time"
		}))
	end

	return slot1
end

function MailModel.getNoticeMessage(slot0, slot1)
	if slot0.notice_list[slot1] then
		return slot0.notice_list[slot1]
	end

	return nil
end

function MailModel.__delete(slot0)
	slot0.main_info = nil
	slot0.mail_list = {}
	slot0.notice_list = {}
	slot0.mail_count = 0
end
