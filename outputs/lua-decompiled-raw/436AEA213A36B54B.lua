TrainingcampController = TrainingcampController or BaseClass(BaseController)

function TrainingcampController.config(slot0)
	slot0.model = TrainingcampModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_open_all_finish_partner = false
end

function TrainingcampController.getModel(slot0)
	return slot0.model
end

function TrainingcampController.registerEvents(slot0)
	if not slot0.get_all_finish_tips_event then
		slot0.get_all_finish_tips_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function ()
			if uv0.is_open_all_finish_partner == true then
				uv0:openTrainingcampAllfinishTipsWindow(true)

				uv0.is_open_all_finish_partner = false
			end
		end)
	end
end

function TrainingcampController.registerProtocals(slot0)
	slot0:RegisterProtocal(27600, "handle27600")
	slot0:RegisterProtocal(27601, "handle27601")
	slot0:RegisterProtocal(27602, "handle27602")
	slot0:RegisterProtocal(27603, "handle27603")
end

function TrainingcampController.send27600(slot0)
	slot0:SendProtocal(27600, {})
end

function TrainingcampController.handle27600(slot0, slot1)
	if slot1 then
		if #slot0.model.finish_ids + 1 == #slot1.ids and Config.TrainingCampData.data_info and #Config.TrainingCampData.data_info == #slot1.ids then
			slot0.is_open_all_finish_partner = true
		end

		slot0.model:setInfo(slot1)
		GlobalEvent:getInstance():Fire(TrainingcampEvent.Update_Trainingcamp_Data_Event)
	end
end

function TrainingcampController.send27601(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(27601, {
		id = slot1,
		formation_type = slot2,
		pos_info = slot3
	})
end

function TrainingcampController.handle27601(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function TrainingcampController.send27602(slot0, slot1)
	slot0:SendProtocal(27602, {
		id = slot1
	})
end

function TrainingcampController.handle27602(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.flag == 1 and slot1.is_first == 1 then
			GlobalEvent:getInstance():Fire(TrainingcampEvent.Update_Trainingcamp_Tips_Event)
		end

		GlobalEvent:getInstance():Fire(TrainingcampEvent.Is_Show_Formation_Event, slot1.is_formation)
	end
end

function TrainingcampController.send27603(slot0, slot1)
	slot0:SendProtocal(27603, {
		id = slot1
	})
end

function TrainingcampController.handle27603(slot0)
end

function TrainingcampController.openTrainingcampWindow(slot0, slot1)
	if slot1 == true then
		if slot0.TrainingcampWindow == nil then
			slot0.TrainingcampWindow = TrainingcampWindow.New()
		end

		if slot0.TrainingcampWindow:isOpen() == false then
			slot0.TrainingcampWindow:open()
		end
	elseif slot0.TrainingcampWindow then
		slot0.TrainingcampWindow:close()

		slot0.TrainingcampWindow = nil
	end
end

function TrainingcampController.getTrainingcampRoot(slot0)
	if slot0.TrainingcampWindow then
		return slot0.TrainingcampWindow.root_wnd
	end
end

function TrainingcampController.openTrainingcampTipsWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.TrainingcampTipsWindow == nil then
			slot0.TrainingcampTipsWindow = TrainingcampTipsWindow.New()
		end

		if slot0.TrainingcampTipsWindow:isOpen() == false then
			slot0.TrainingcampTipsWindow:open(slot2)
		end
	elseif slot0.TrainingcampTipsWindow then
		slot0.TrainingcampTipsWindow:close()

		slot0.TrainingcampTipsWindow = nil
	end
end

function TrainingcampController.openTrainingcampMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.TrainingcampMainWindow == nil then
			slot0.TrainingcampMainWindow = TrainingcampMainWindow.New()
		end

		if slot0.TrainingcampMainWindow:isOpen() == false then
			slot0.TrainingcampMainWindow:open(slot2)
		end
	elseif slot0.TrainingcampMainWindow then
		slot0.TrainingcampMainWindow:close()

		slot0.TrainingcampMainWindow = nil
	end
end

function TrainingcampController.openTrainingcampAllfinishTipsWindow(slot0, slot1)
	if slot1 == true then
		if slot0.TrainingcampAllTipsWindow == nil then
			slot0.TrainingcampAllTipsWindow = TrainingcampAllfinishTipsWindow.New()
		end

		if slot0.TrainingcampAllTipsWindow:isOpen() == false then
			slot0.TrainingcampAllTipsWindow:open()
		end
	elseif slot0.TrainingcampAllTipsWindow then
		slot0.TrainingcampAllTipsWindow:close()

		slot0.TrainingcampAllTipsWindow = nil
	end
end

function TrainingcampController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
