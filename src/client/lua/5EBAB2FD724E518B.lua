OnecentgiftModel = OnecentgiftModel or BaseClass()
slot0 = Config.HolidayDimeData

function OnecentgiftModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function OnecentgiftModel.config(slot0)
end

function OnecentgiftModel.setBaseInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0:setAwardDataById()
	slot0:setMainTipsStatus()
end

function OnecentgiftModel.setAwardDataById(slot0)
	if slot0.data == nil and slot0.data.list == nil and uv0 == nil then
		return
	end

	slot0.period_award = DeepCopy(uv0.data_award_list[slot0:getCurPeriod()])

	if slot0.period_award == nil then
		slot0.period_award = {}
	end

	for slot5, slot6 in pairs(slot0.period_award) do
		slot6.rev_state = 0

		for slot10, slot11 in pairs(slot0.data.list) do
			if slot6.id == slot11.id then
				slot6.rev_state = slot11.finish
			end
		end
	end
end

function OnecentgiftModel.getAwardData(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.period_award) do
		slot6.is_select = false

		table.insert(slot1, slot6)
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	if slot0:getIsBuy() then
		for slot5, slot6 in pairs(slot1) do
			if slot6.rev_state == 1 then
				slot6.is_select = true

				break
			end
		end
	end

	return slot1
end

function OnecentgiftModel.getCurPeriod(slot0)
	if slot0.data ~= nil and slot0.data.period ~= nil and slot0.data.period ~= 0 then
		return slot0.data.period
	end

	return 1
end

function OnecentgiftModel.getIsBuy(slot0)
	if slot0.data ~= nil and slot0.data.is_buy ~= nil then
		return slot0.data.is_buy == 1
	end

	return false
end

function OnecentgiftModel.getEndTime(slot0)
	if slot0.data ~= nil and slot0.data.end_time ~= nil then
		return slot0.data.end_time
	end

	return 0
end

function OnecentgiftModel.setFirstRed(slot0, slot1)
	slot0.first_red = slot1
end

function OnecentgiftModel.getFirstRed(slot0)
	if slot0.first_red == false then
		return false
	end

	for slot4, slot5 in pairs(slot0.period_award) do
		if slot5.rev_state ~= 2 then
			return true
		end
	end

	return false
end

function OnecentgiftModel.getIsCheap(slot0)
	if uv0.data_period_list[slot0:getCurPeriod()] ~= nil and slot2.is_cheap ~= nil and slot2.is_cheap == 1 then
		return true
	end

	return false
end

function OnecentgiftModel.setMainTipsStatus(slot0)
	slot1 = 1

	if slot0:getFirstRed() then
		slot2 = 0 + 1
	end

	if slot0.data and slot0.data.is_buy == 1 then
		for slot6, slot7 in pairs(slot0.data.list) do
			if slot7.finish == 1 then
				slot2 = slot2 + 1
			end
		end
	end

	slot5 = {
		bid = slot1,
		num = slot2
	}

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.one_cent_gift, slot5)
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.one_yuan_gift, slot5)
end

function OnecentgiftModel.updateRed(slot0, slot1)
	if slot0.period_award then
		slot2 = 1

		if slot0:getFirstRed() then
			slot3 = 0 + 1
		end

		for slot7, slot8 in pairs(slot0.period_award) do
			if slot8.power_limit <= slot1 and slot0.data.is_buy == 1 and slot8.rev_state ~= 2 then
				slot3 = slot3 + 1
			end
		end

		slot6 = {
			bid = slot2,
			num = slot3
		}

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.one_cent_gift, slot6)
		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.one_yuan_gift, slot6)
	end
end

function OnecentgiftModel.__delete(slot0)
end
