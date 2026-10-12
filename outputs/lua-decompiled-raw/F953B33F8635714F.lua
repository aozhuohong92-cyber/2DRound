CrossshowController = CrossshowController or BaseClass(BaseController)

function CrossshowController.config(slot0)
	slot0.model = CrossshowModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function CrossshowController.getModel(slot0)
	return slot0.model
end

function CrossshowController.registerEvents(slot0)
end

function CrossshowController.registerProtocals(slot0)
	slot0:RegisterProtocal(22150, "handle22150")
end

function CrossshowController.sender22150(slot0)
	slot0:SendProtocal(22150, {})
end

function CrossshowController.handle22150(slot0, slot1)
	GlobalEvent:getInstance():Fire(CrossshowEvent.Get_Cross_Show_Info_Event, slot1)
end

function CrossshowController.openCrossshowMainWindow(slot0, slot1)
	if slot1 == true then
		if slot0.cross_show_main_window == nil then
			slot0.cross_show_main_window = CrossshowMainWindow.New()
		end

		if slot0.cross_show_main_window:isOpen() == false then
			slot0.cross_show_main_window:open(index)
		end
	elseif slot0.cross_show_main_window then
		slot0.cross_show_main_window:close()

		slot0.cross_show_main_window = nil
	end
end

function CrossshowController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
