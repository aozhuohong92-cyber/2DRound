NewFirstChargeModel = NewFirstChargeModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function NewFirstChargeModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function NewFirstChargeModel.config(slot0)
end

function NewFirstChargeModel.setFirstBtnStatus(slot0, slot1)
	if slot1 and next(slot1) then
		slot0.newFirstBtnStatus = {}

		for slot5, slot6 in ipairs(slot1) do
			slot0.newFirstBtnStatus[slot6.id] = slot6.status
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.status == 1 then
				slot2 = true

				break
			end
		end

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.first_charge_new, slot2)
	end
end

function NewFirstChargeModel.setFirstBtnNewStatus(slot0, slot1)
	if slot1 and next(slot1) then
		slot0.newFirstBtnStatus = {}

		for slot5, slot6 in ipairs(slot1) do
			slot0.newFirstBtnStatus[slot6.id] = slot6.status
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.status == 1 then
				slot2 = true

				break
			end
		end

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.first_charge_new1, slot2)
	end
end

function NewFirstChargeModel.setFirstBtnNewStatus2(slot0, slot1)
	if slot1 and next(slot1) then
		slot0.newFirstBtnStatus = {}

		for slot5, slot6 in ipairs(slot1) do
			slot0.newFirstBtnStatus[slot6.id] = slot6.status
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.status == 1 then
				slot2 = true

				break
			end
		end

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.first_charge_new2, slot2)
	end
end

function NewFirstChargeModel.setFirstBtnNewStatus3(slot0, slot1)
	if slot1 and next(slot1) then
		slot0.newFirstBtnStatus = {}

		for slot5, slot6 in ipairs(slot1) do
			slot0.newFirstBtnStatus[slot6.id] = slot6.status
		end

		slot2 = false

		for slot6, slot7 in pairs(slot1) do
			if slot7.status == 1 then
				slot2 = true

				break
			end
		end

		MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.first_charge_new3, slot2)
	end
end

function NewFirstChargeModel.getFirstBtnStatus(slot0, slot1)
	if not slot0.newFirstBtnStatus then
		return 0
	end

	return slot0.newFirstBtnStatus[slot1] or 0
end

function NewFirstChargeModel.setFirstRechargeData(slot0)
	slot0.firstRewardData1 = {}
	slot0.firstRewardData2 = {}

	for slot5, slot6 in pairs(Config.ChargeData.data_new_first_charge_data) do
		if slot6.fid == 1 then
			uv0(slot0.firstRewardData1, slot6)
		elseif slot6.fid == 2 then
			uv0(slot0.firstRewardData2, slot6)
		end
	end

	uv1(slot0.firstRewardData1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	uv1(slot0.firstRewardData2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function NewFirstChargeModel.setFirstRechargeNewData(slot0)
	slot0.firstRewardData1 = {}
	slot0.firstRewardData2 = {}

	for slot5, slot6 in pairs(Config.ChargeData.data_first_charge_data) do
		if slot6.fid == 1 then
			uv0(slot0.firstRewardData1, slot6)
		elseif slot6.fid == 2 then
			uv0(slot0.firstRewardData2, slot6)
		end
	end

	uv1(slot0.firstRewardData1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	uv1(slot0.firstRewardData2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function NewFirstChargeModel.setFirstRechargeNewData2(slot0)
	slot0.firstRewardData1 = {}
	slot0.firstRewardData2 = {}

	for slot5, slot6 in pairs(Config.ChargeData.data_first_charge_lwt_data) do
		if slot6.fid == 1 then
			uv0(slot0.firstRewardData1, slot6)
		elseif slot6.fid == 2 then
			uv0(slot0.firstRewardData2, slot6)
		end
	end

	uv1(slot0.firstRewardData1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	uv1(slot0.firstRewardData2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function NewFirstChargeModel.setFirstRechargeNewData3(slot0)
	slot0.firstRewardData1 = {}
	slot0.firstRewardData2 = {}

	for slot5, slot6 in pairs(Config.ChargeData.data_new_first_charge_data3) do
		if slot6.fid == 1 then
			uv0(slot0.firstRewardData1, slot6)
		elseif slot6.fid == 2 then
			uv0(slot0.firstRewardData2, slot6)
		end
	end

	uv1(slot0.firstRewardData1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	uv1(slot0.firstRewardData2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function NewFirstChargeModel.getFirstRechargeData(slot0, slot1)
	if not slot0.firstRewardData1 or not slot0.firstRewardData2 then
		return {}
	end

	if slot1 == 1 then
		return slot0.firstRewardData1
	elseif slot1 == 2 then
		return slot0.firstRewardData2
	end
end

function NewFirstChargeModel.__delete(slot0)
end
