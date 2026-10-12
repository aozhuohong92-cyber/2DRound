OnlineGiftController = OnlineGiftController or BaseClass(BaseController)

function OnlineGiftController.config(slot0)
	slot0.model = OnlineGiftModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function OnlineGiftController.getModel(slot0)
	return slot0.model
end

function OnlineGiftController.registerEvents(slot0)
end

function OnlineGiftController.registerProtocals(slot0)
	slot0:RegisterProtocal(10926, "handle10926")
	slot0:RegisterProtocal(10927, "handle10927")
end

function OnlineGiftController.openOnlineGiftView(slot0, slot1)
	if slot1 == true then
		if not slot0.onlinegiftView then
			slot0.onlinegiftView = OnlineGiftWindow.New()
		end

		slot0.onlinegiftView:open()
	elseif slot0.onlinegiftView then
		slot0.onlinegiftView:close()

		slot0.onlinegiftView = nil
	end
end

function OnlineGiftController.sender10926(slot0)
	slot0:SendProtocal(10926, {})
end

function OnlineGiftController.handle10926(slot0, slot1)
	slot0.onlinegift_data = slot1.list
	slot0.online_time = slot1.time

	GlobalEvent:getInstance():Fire(OnlineGiftEvent.Get_Data, slot1)
end

function OnlineGiftController.setOnlineGiftData(slot0, slot1)
	if slot0.onlinegift_data then
		table.sort(slot0.onlinegift_data.time, slot1)
	end
end

function OnlineGiftController.getOnlineGiftData(slot0)
	if slot0.onlinegift_data then
		return slot0.onlinegift_data
	end
end

function OnlineGiftController.getOnlineTime(slot0)
	if slot0.online_time then
		return slot0.online_time
	end
end

function OnlineGiftController.sender10927(slot0, slot1)
	slot0:SendProtocal(10927, {
		time = slot1
	})
end

function OnlineGiftController.handle10927(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(OnlineGiftEvent.Updata_Data, slot1.time)
	end
end

function OnlineGiftController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
