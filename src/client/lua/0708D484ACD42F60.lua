PetardActionModel = PetardActionModel or BaseClass()

function PetardActionModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PetardActionModel.config(slot0)
	slot0.petard_base_info = {}
	slot0.petard_redbag_data = {}
end

function PetardActionModel.setPetardBaseInfo(slot0, slot1)
	slot0.petard_base_info = slot1 or {}
end

function PetardActionModel.getPetardBaseInfo(slot0)
	return slot0.petard_base_info
end

function PetardActionModel.getMaxPetardHotVal(slot0)
	if slot0.petard_base_info then
		return slot0.petard_base_info.lev_score or 0
	end

	return 0
end

function PetardActionModel.setPetardRedbagData(slot0, slot1)
	slot0.petard_redbag_data = slot1 or {}
end

function PetardActionModel.getPetardRedbagData(slot0)
	return slot0.petard_redbag_data
end

function PetardActionModel.checkPetardIsOpen(slot0)
	slot1 = false
	slot3 = Config.HolidayPetardData.data_const.holiday_open_day
	slot4 = RoleController:getInstance():getRoleVo()

	if Config.HolidayPetardData.data_const.holiday_open_lev and slot2.val <= slot4.lev and slot3 and slot3.val <= slot4.open_day then
		slot1 = true
	end

	return slot1
end

function PetardActionModel.checkCanUseBigPetard(slot0)
	if not slot0.petard_base_info then
		return false
	end

	if GameNet:getInstance():getTime() > (slot0.petard_base_info.end_time or 0) then
		message(TI18N("活动未开启"))

		return false
	else
		slot4 = Config.HolidayPetardData.data_const.petard_end_time
		slot5 = tonumber(os.date("%H", slot1))

		if Config.HolidayPetardData.data_const.petard_start_time and slot4 and slot3.val <= slot5 and slot5 < slot4.val then
			return true
		else
			message(TI18N("请在19:00-23:00之间使用"))

			return false
		end
	end
end

function PetardActionModel.__delete(slot0)
end
