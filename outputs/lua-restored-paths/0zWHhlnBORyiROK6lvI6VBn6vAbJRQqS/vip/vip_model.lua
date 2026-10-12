VipModel = VipModel or BaseClass()

function VipModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function VipModel.config(slot0)
	slot0.get_list = {}
	slot0.daily_gift = {}
	slot0.privilege_list = {}
end

function VipModel.setGetGiftList(slot0, slot1)
	if slot1 and #slot1 > 0 then
		for slot5, slot6 in pairs(slot1) do
			slot0.get_list[slot6.lev] = slot6.lev
		end
	end

	GlobalEvent:getInstance():Fire(VipEvent.UPDATE_GET_LIST)
end

function VipModel.getGetGiftList(slot0)
	if slot0.get_list then
		return slot0.get_list
	end

	return nil
end

function VipModel.getVIPIsBuyStatus(slot0, slot1)
	if slot0.get_list and slot0.get_list[slot1] then
		return true
	end

	return nil
end

function VipModel.setAccList(slot0, slot1)
	slot0.acc_list = slot1
end

function VipModel.getAccList(slot0)
	return slot0.acc_list
end

function VipModel.checkGiftList(slot0, slot1)
	for slot5, slot6 in pairs(slot0.get_list) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

function VipModel.getGiftListVip(slot0)
	slot1 = 1
	slot2 = false
	slot3 = {}

	if Config.VipData.data_get_vip_icon then
		for slot7, slot8 in pairs(Config.VipData.data_get_vip_icon) do
			table.insert(slot3, slot8)
		end
	end

	function slot7(slot0, slot1)
		return slot0.vip_lev < slot1.vip_lev
	end

	table.sort(slot3, slot7)

	for slot7, slot8 in ipairs(slot3) do
		if not slot0:checkGiftList(slot8.vip_lev) then
			slot1 = slot8.vip_lev

			break
		end
	end

	return slot1
end

function VipModel.getIsGetAcc(slot0)
	if slot0.acc_list and next(slot0.acc_list) ~= nil then
		slot1 = 0

		for slot5, slot6 in pairs(slot0.acc_list) do
			if slot6.status == 1 then
				return true
			elseif slot6.status == 0 or slot6.status == 2 then
				slot1 = slot1 + 1
			end
		end

		if slot1 == #slot0.acc_list then
			return false
		end
	end

	return false
end

function VipModel.setDailyGiftData(slot0, slot1)
	slot0.daily_gift = slot1 or {}
end

function VipModel.getDailyGiftBuyCountById(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.daily_gift) do
		if slot7.id == slot1 then
			slot2 = slot7.count

			break
		end
	end

	return slot2
end

function VipModel.setPrivilegeList(slot0, slot1)
	slot0.privilege_list = slot1 or {}
end

function VipModel.getPrivilegeDataById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.privilege_list) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function VipModel.getPrivilegeRedStatus(slot0)
	slot1 = false

	if not slot0.privilege_flag then
		slot1 = true

		for slot5, slot6 in pairs(slot0.privilege_list) do
			if slot6.status == 1 then
				slot1 = false

				break
			end
		end
	end

	return slot1
end

function VipModel.setPrivilegeOpenFlag(slot0, slot1)
	slot0.privilege_flag = slot1
end

function VipModel.setMonthCard(slot0, slot1)
	slot0.monthCard = slot1
end

function VipModel.getMonthCard(slot0)
	slot1 = false
	slot0.monthCard = slot0.monthCard or 0

	return slot0.monthCard == 1 and true or false
end

function VipModel.__delete(slot0)
end
