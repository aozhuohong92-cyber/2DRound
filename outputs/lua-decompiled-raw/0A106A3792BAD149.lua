DialActionModel = DialActionModel or BaseClass()

function DialActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function DialActionModel.config(slot0)
	slot0.dial_data = {}
	slot0.myself_record_data = {}
	slot0.all_record_data = {}
	slot0.no_ani_flag = false
	slot0.remind_flag = true
	slot0.award_red_status = false
end

function DialActionModel.setDialData(slot0, slot1)
	slot0.dial_data = slot1

	slot0:checkDialAwardRedStatus()
end

function DialActionModel.getDialData(slot0)
	return slot0.dial_data
end

function DialActionModel.getDialHolidayLv(slot0)
	if slot0.dial_data then
		return slot0.dial_data.holiday_lev
	end

	return 1
end

function DialActionModel.updateDialGoldNum(slot0, slot1)
	if slot0.dial_data then
		slot0.dial_data.gold = slot1
	end
end

function DialActionModel.getDialGoldNum(slot0)
	if slot0.dial_data then
		return slot0.dial_data.gold
	end

	return 0
end

function DialActionModel.getDialScore(slot0)
	if slot0.dial_data then
		return slot0.dial_data.num
	end

	return 0
end

function DialActionModel.getDialAwardData(slot0)
	if slot0.dial_data then
		return slot0.dial_data.award_list or {}
	end

	return {}
end

function DialActionModel.setIsNoAniFlag(slot0, slot1)
	slot0.no_ani_flag = slot1
end

function DialActionModel.getIsNoAniFlag(slot0)
	return slot0.no_ani_flag
end

function DialActionModel.setRemindFlag(slot0, slot1)
	slot0.remind_flag = slot1
end

function DialActionModel.getRemindFlag(slot0)
	return slot0.remind_flag
end

function DialActionModel.setMyselfDialRecordData(slot0, slot1)
	slot0.myself_record_data = slot1
end

function DialActionModel.getMyselfDialRecordData(slot0)
	return slot0.myself_record_data
end

function DialActionModel.setAllDialRecordData(slot0, slot1)
	slot0.all_record_data = slot1
end

function DialActionModel.getAllDialRecordData(slot0)
	return slot0.all_record_data
end

function DialActionModel.checkDialAwardRedStatus(slot0)
	slot1 = false

	if slot0.dial_data then
		for slot5, slot6 in pairs(slot0.dial_data.award_list) do
			if slot6.status == 1 then
				slot1 = true

				break
			end
		end
	end

	slot0.award_red_status = slot1
end

function DialActionModel.getDialAwardResStatus(slot0)
	return slot0.award_red_status
end

function DialActionModel.__delete(slot0)
end
