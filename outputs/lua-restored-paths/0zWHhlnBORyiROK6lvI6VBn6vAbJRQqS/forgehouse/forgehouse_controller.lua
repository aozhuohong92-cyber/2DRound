ForgeHouseController = ForgeHouseController or BaseClass(BaseController)

function ForgeHouseController.config(slot0)
	slot0.model = ForgeHouseModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ForgeHouseController.getModel(slot0)
	return slot0.model
end

function ForgeHouseController.registerEvents(slot0)
end

function ForgeHouseController.registerProtocals(slot0)
	slot0:RegisterProtocal(11079, "handle11079")
	slot0:RegisterProtocal(11080, "handle11080")
	slot0:RegisterProtocal(11081, "handle11081")
	slot0:RegisterProtocal(11082, "handle11082")
end

function ForgeHouseController.openForgeHouseView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if Config.CityData.data_base[CenterSceneBuild.mall] == nil then
			return
		end

		if not MainuiController:getInstance():checkIsOpenByActivate(slot4.activate) then
			message(slot4.desc)

			return
		end

		if not slot0.forgehouseView then
			slot0.forgehouseView = ForgeHouseWindow.New()
		end

		slot0.forgehouseView:open(slot2, slot3)
	elseif slot0.forgehouseView then
		slot0.forgehouseView:close()

		slot0.forgehouseView = nil
	end
end

function ForgeHouseController.send11079(slot0, slot1, slot2)
	slot0:SendProtocal(11079, {
		base_id = slot1,
		num = slot2 or 0
	})
end

function ForgeHouseController.handle11079(slot0, slot1)
	if next(slot1.list) == nil then
		message(TI18N("暂时无法合成任何装备或贝里不足"))

		return
	end

	if slot1.type == 0 then
		slot0:openEquipmentAllSynthesisWindow(true, slot1)
	end
end

function ForgeHouseController.send11080(slot0, slot1, slot2)
	slot0:SendProtocal(11080, {
		base_id = slot1,
		num = slot2
	})
end

function ForgeHouseController.handle11080(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ForgeHouseEvent.Composite_Result)
end

function ForgeHouseController.send11081(slot0, slot1, slot2)
	slot0:SendProtocal(11081, {
		base_id = slot1,
		num = slot2 or 0
	})
end

function ForgeHouseController.handle11081(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		slot0:openEquipmentAllSynthesisWindow(false)
		GlobalEvent:getInstance():Fire(ForgeHouseEvent.Composite_Result)
	end
end

function ForgeHouseController.openEquipmentAllSynthesisWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.all_synthsis_view then
			slot0.all_synthsis_view = EquipmentAllSynthesisWindow.New(slot2)
		end

		slot0.all_synthsis_view:open()
	elseif slot0.all_synthsis_view then
		slot0.all_synthsis_view:close()

		slot0.all_synthsis_view = nil
	end
end

function ForgeHouseController.send11082(slot0)
	slot0:SendProtocal(11082, {})
end

function ForgeHouseController.handle11082(slot0, slot1)
	GlobalEvent:getInstance():Fire(ForgeHouseEvent.Composite_Record, slot1)
end

function ForgeHouseController.openEquipmentCompRecordWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.comp_record_view then
			slot0.comp_record_view = EquipmentCompRecordWindow.New()
		end

		slot0.comp_record_view:open()
	elseif slot0.comp_record_view then
		slot0.comp_record_view:close()

		slot0.comp_record_view = nil
	end
end

function ForgeHouseController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
