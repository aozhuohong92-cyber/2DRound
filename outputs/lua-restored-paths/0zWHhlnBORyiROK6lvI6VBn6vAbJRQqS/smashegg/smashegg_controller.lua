SmasheggController = SmasheggController or BaseClass(BaseController)

function SmasheggController.config(slot0)
	slot0.model = SmasheggModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function SmasheggController.getModel(slot0)
	return slot0.model
end

function SmasheggController.registerEvents(slot0)
end

function SmasheggController.sender16680(slot0)
	slot0:SendProtocal(16680, {})
end

function SmasheggController.sender16681(slot0)
	slot0.request_flag = true

	slot0:SendProtocal(16681, {})
end

function SmasheggController.sender16682(slot0, slot1)
	slot0:SendProtocal(16682, {
		pos = slot1
	})
end

function SmasheggController.sender16683(slot0)
	slot0:SendProtocal(16683, {})
end

function SmasheggController.sender16684(slot0, slot1)
	slot0:SendProtocal(16684, {
		num = slot1
	})
end

function SmasheggController.sender16685(slot0, slot1)
	slot0:SendProtocal(16685, {
		type = slot1
	})
end

function SmasheggController.registerProtocals(slot0)
	slot0:RegisterProtocal(16680, "handle16680")
	slot0:RegisterProtocal(16681, "handle16681")
	slot0:RegisterProtocal(16682, "handle16682")
	slot0:RegisterProtocal(16683, "handle16683")
	slot0:RegisterProtocal(16684, "handle16684")
	slot0:RegisterProtocal(16685, "handle16685")
end

function SmasheggController.handle16680(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(SmasheggEvent.Update_Smashegg_Data_Event, slot1)
	end
end

function SmasheggController.handle16681(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end

	slot0.request_flag = false
end

function SmasheggController.checkRefreshReqIsBack(slot0)
	if not slot0.request_flag then
		return true
	end

	return false
end

function SmasheggController.handle16682(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end

	slot0.model:setSmasheggAniPlaying(false)
end

function SmasheggController.handle16683(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function SmasheggController.handle16684(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function SmasheggController.handle16685(slot0, slot1)
	if slot1 then
		if slot1.type == 1 then
			slot0.model:setMyselfRecordData(slot1.log_list)
		elseif slot1.type == 2 then
			slot0.model:setAllRecordData(slot1.log_list)
		end

		GlobalEvent:getInstance():Fire(SmasheggEvent.Update_Smashegg_Record_Event, slot1)
	end
end

function SmasheggController.openSmasheggRecordWindow(slot0, slot1)
	if slot1 == true then
		if slot0.smashegg_record_wnd == nil then
			slot0.smashegg_record_wnd = SmasheggRecordWindow.New()
		end

		if slot0.smashegg_record_wnd:isOpen() == false then
			slot0.smashegg_record_wnd:open()
		end
	elseif slot0.smashegg_record_wnd then
		slot0.smashegg_record_wnd:close()

		slot0.smashegg_record_wnd = nil
	end
end

function SmasheggController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
