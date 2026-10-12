HalidomModel = HalidomModel or BaseClass()

function HalidomModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function HalidomModel.config(slot0)
	slot0.all_halidom_data = {}
	slot0.halidom_red_list = {}
end

function HalidomModel.setAllHalidomData(slot0, slot1)
	slot0.all_halidom_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot7 = HalidomVo.New()

		slot7:updateData(slot6)
		table.insert(slot0.all_halidom_data, slot7)
	end

	slot0:checkHalidomRedStatus()
end

function HalidomModel.updateHalidomData(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.all_halidom_data) do
		if slot7.id == slot1.id then
			slot2 = true

			slot7:updateData(slot1)

			break
		end
	end

	if not slot2 then
		slot3 = HalidomVo.New()

		slot3:updateData(slot1)
		table.insert(slot0.all_halidom_data, slot3)
	end

	slot0:checkHalidomRedStatus()

	return slot2
end

function HalidomModel.getHalidomDataById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.all_halidom_data) do
		if slot6.id == slot1 then
			return slot6
		end
	end

	return {}
end

function HalidomModel.getHalidomDataByCampType(slot0, slot1)
	for slot5, slot6 in pairs(slot0.all_halidom_data) do
		if Config.HalidomData.data_base[slot6.id] and slot7.camp == slot1 then
			return slot6
		end
	end
end

function HalidomModel.checkHalidomIsUnlock(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.all_halidom_data) do
		if slot7.id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function HalidomModel.checkHalidomIsOpen(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if Config.HalidomData.data_const.halidom_open_lev and slot2 and slot3.val <= slot2.lev then
		return true
	end

	if not slot1 and slot3 then
		message(slot3.desc)
	end

	return false
end

function HalidomModel.updateHalidomRedStatus(slot0, slot1, slot2)
	slot0.halidom_red_list[slot1] = slot2

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.partner, {
		bid = slot1,
		status = slot2
	})
	GlobalEvent:getInstance():Fire(HalidomEvent.Update_Halidom_Red_Event, slot1, slot2)
end

function HalidomModel.getHalidomRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.halidom_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function HalidomModel.getHalidomRedStatusByRedBid(slot0, slot1)
	return slot0.halidom_red_list[slot1] or false
end

function HalidomModel.calculateHalidomRedStatus(slot0)
	if not slot0:checkHalidomIsOpen(true) then
		return
	end

	for slot4, slot5 in pairs(slot0.all_halidom_data) do
		slot5:checkHalidomRedStatus()
	end

	slot0:checkHalidomRedStatus()
end

function HalidomModel.checkHalidomRedStatus(slot0)
	if not slot0:checkHalidomIsOpen(true) then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(Config.HalidomData.data_base) do
		if slot0:checkHalidomIsCanUnlock(slot6.id) then
			slot1 = true

			break
		end
	end

	slot6 = slot1

	slot0:updateHalidomRedStatus(HeroConst.RedPointType.eRPHalidom_Unlock, slot6)

	slot2 = false

	for slot6, slot7 in pairs(slot0.all_halidom_data) do
		if slot7:getRedStatusByType(HalidomConst.Red_Type.Lvup) then
			slot2 = true

			break
		end
	end

	slot7 = slot2

	slot0:updateHalidomRedStatus(HeroConst.RedPointType.eRPHalidom_Lvup, slot7)

	slot3 = false

	for slot7, slot8 in pairs(slot0.all_halidom_data) do
		if slot8:getRedStatusByType(HalidomConst.Red_Type.Step) then
			slot3 = true

			break
		end
	end

	slot0:updateHalidomRedStatus(HeroConst.RedPointType.eRPHalidom_Step, slot3)
end

function HalidomModel.checkHalidomIsCanUnlock(slot0, slot1)
	slot2 = false

	if slot0:checkHalidomIsOpen(true) and not slot0:checkHalidomIsUnlock(slot1) and Config.HalidomData.data_base[slot1] then
		slot2 = true
		slot5 = HeroController:getInstance():getModel():getAllHeroArray():GetSize()

		for slot9, slot10 in pairs(slot3.loss) do
			slot13 = slot10[3]

			for slot18 = 1, slot5 do
				if slot4:Get(slot18 - 1).is_lock == 0 and slot19.is_in_form == 0 and slot19.camp_type == slot10[1] and slot19.star == slot10[2] then
					slot14 = 0 + 1
				end

				if slot13 <= slot14 then
					break
				end
			end

			if slot14 < slot13 then
				slot2 = false

				break
			end
		end
	end

	return slot2
end

function HalidomModel.__delete(slot0)
end
