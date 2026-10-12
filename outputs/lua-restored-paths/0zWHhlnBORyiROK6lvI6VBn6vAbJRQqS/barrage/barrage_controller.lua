BarrageController = BarrageController or BaseClass(BaseController)

function BarrageController.config(slot0)
	slot0.model = BarrageModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function BarrageController.getModel(slot0)
	return slot0.model
end

function BarrageController.registerEvents(slot0)
	if slot0.barrage_enter_event == nil then
		slot0.barrage_enter_event = GlobalEvent:getInstance():Bind(BarrageEvent.HandleBarrageType, function (slot0, slot1, slot2)
			if not slot0 then
				uv0:openMainView(false)
			else
				uv0:openMainView(true, slot1, slot2)
			end
		end)
	end
end

function BarrageController.registerProtocals(slot0)
	slot0:RegisterProtocal(12732, "on12732")
	slot0:RegisterProtocal(12733, "on12733")
end

function BarrageController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function BarrageController.openMainView(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.barrage_view ~= nil then
			slot0.barrage_view:close()

			slot0.barrage_view = nil
		end
	else
		if slot0.barrage_view == nil then
			slot0.barrage_view = BarrageMainView.New(slot2)
		end

		if slot0.barrage_view and slot0.barrage_view:isOpen() == false then
			slot0.barrage_view:open(slot2, slot3)
		end
	end
end

function BarrageController.showWirteBtn(slot0, slot1)
	if not slot0.barrage_view then
		return
	end

	if slot1 then
		slot0.barrage_view:showBtn(true)
	else
		slot0.barrage_view:showBtn(false)
	end
end

function BarrageController.openEditView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.barrage_edit_view ~= nil then
			slot0.barrage_edit_view:close()

			slot0.barrage_edit_view = nil
		end
	else
		if slot0.barrage_edit_view == nil then
			slot0.barrage_edit_view = BarrageEditView.New(BarrageController:getInstance())
		end

		if slot0.barrage_edit_view and slot0.barrage_edit_view:isOpen() == false then
			slot0.barrage_edit_view:open(slot2)
		end
	end
end

function BarrageController.requestEnterBarrage(slot0, slot1, slot2)
	slot0:SendProtocal(12730, {
		type = slot1,
		is_push = slot2 or TRUE
	})
end

function BarrageController.requestExitBarrage(slot0)
	slot0:SendProtocal(12731, {})
end

function BarrageController.requestArenaPeakExitBarrage(slot0)
	slot0:SendProtocal(12729, {})
end

function BarrageController.sendBarrageMsg(slot0, slot1, slot2)
	slot0:SendProtocal(12732, {
		type = slot1,
		msg = slot2
	})
end

function BarrageController.on12732(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openEditView(false)
	end
end

function BarrageController.on12733(slot0, slot1)
	GlobalEvent:getInstance():Fire(BarrageEvent.UpdateBarrageData, slot1)
end

function BarrageController.setBarrageOpen(slot0, slot1, slot2)
	if slot0.barrage_open_list == nil then
		slot0.barrage_open_list = RoleEnv:getInstance():get(RoleEnv.keys.barrage_type_key, {})
	end

	slot0.barrage_open_list[slot1] = slot2

	RoleEnv:getInstance():set(RoleEnv.keys.barrage_type_key, slot0.barrage_open_list, true)
end

function BarrageController.getBarrageOpen(slot0, slot1)
	if slot0.barrage_open_list == nil then
		slot0.barrage_open_list = RoleEnv:getInstance():get(RoleEnv.keys.barrage_type_key, {})
	end

	if slot0.barrage_open_list == nil or slot0.barrage_open_list[slot1] == nil then
		return true
	end

	return slot0.barrage_open_list[slot1]
end
