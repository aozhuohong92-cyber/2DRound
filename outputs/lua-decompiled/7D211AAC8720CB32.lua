ElementModel = ElementModel or BaseClass()

function ElementModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ElementModel.config(slot0)
	slot0.element_data = {}
	slot0.red_status = false
	slot0.record_open_type = nil
end

function ElementModel.getRecordOpenType(slot0)
	return slot0.record_open_type
end

function ElementModel.setRecordOpenType(slot0, slot1)
	slot0.record_open_type = slot1
end

function ElementModel.setElementData(slot0, slot1)
	slot0.element_data = slot1 or {}

	slot0:updateLadderRedStatus()
end

function ElementModel.getElementData(slot0)
	return slot0.element_data or {}
end

function ElementModel.checkIsHaveElementData(slot0)
	if not slot0.element_data or next(slot0.element_data) == nil then
		return false
	end

	return true
end

function ElementModel.updateElementCountData(slot0, slot1)
	if slot0.element_data then
		for slot5, slot6 in pairs(slot1) do
			slot0.element_data[slot5] = slot6
		end

		slot0:updateLadderRedStatus()
	end
end

function ElementModel.updateElementCustomsData(slot0, slot1)
	if slot0.element_data and slot0.element_data.list then
		for slot5, slot6 in pairs(slot0.element_data.list) do
			if slot6.type == slot1.type then
				slot6.group = slot1.group
				slot6.boss_id = slot1.boss_id

				break
			end
		end
	end
end

function ElementModel.getLeftChallengeCount(slot0)
	if slot0.element_data then
		return slot0.element_data.num or 0
	end

	return 0
end

function ElementModel.getNormalBuyCount(slot0)
	if slot0.element_data then
		return slot0.element_data.buy_num or 0
	end

	return 0
end

function ElementModel.getPrivilegeBuyCount(slot0)
	if slot0.element_data then
		return slot0.element_data.pr_buy_num or 0
	end

	return 0
end

function ElementModel.getTodayLeftBuyCount(slot0)
	slot1 = 0
	slot2 = slot0.element_data.buy_num or 0

	for slot8, slot9 in pairs(Config.ElementTempleData.data_buy_count) do
		if slot9.vip <= RoleController:getInstance():getRoleVo().vip_lev then
			slot3 = 0 + 1
		end
	end

	if RoleController:getInstance():getModel():checkPrivilegeStatus(4) then
		slot1 = slot3 - slot2 + Config.ElementTempleData.data_privilege_length - (slot0.element_data.pr_buy_num or 0)
	end

	if slot1 < 0 then
		slot1 = 0
	end

	return slot1
end

function ElementModel.getElementCustomsIdByType(slot0, slot1)
	slot2 = 0

	if slot0.element_data and slot0.element_data.list then
		for slot6, slot7 in pairs(slot0.element_data.list) do
			if slot7.type == slot1 then
				slot2 = slot7.boss_id

				break
			end
		end
	end

	return slot2
end

function ElementModel.updateLadderRedStatus(slot0)
	slot0.red_status = false

	if slot0.element_data and slot0.element_data.num > 0 then
		slot0.red_status = true
	end

	if AdventureActivityController:getInstance():isOpenActivity(AdventureActivityConst.Ground_Type.element) == false then
		slot0.red_status = false
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.adventure, {
		bid = AdventureActivityConst.Red_Type.element,
		status = slot0.red_status
	})
	GlobalEvent:getInstance():Fire(ElementEvent.Update_Element_Red_Status, slot0.red_status)
end

function ElementModel.checkElementRedStatus(slot0)
	return slot0.red_status
end

function ElementModel.checkElementIsOpen(slot0, slot1)
	slot4 = true

	if Config.ElementTempleData.data_const.join_lev and RoleController:getInstance():getRoleVo().lev < slot3.val then
		slot4 = false

		if not slot1 then
			message(slot3.desc)
		end
	end

	return slot4
end

function ElementModel.__delete(slot0)
end
