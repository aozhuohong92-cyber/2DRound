MergeserverController = MergeserverController or BaseClass(BaseController)

function MergeserverController.config(slot0)
	slot0.model = MergeserverModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function MergeserverController.getModel(slot0)
	return slot0.model
end

function MergeserverController.registerEvents(slot0)
end

function MergeserverController.registerProtocals(slot0)
	slot0:RegisterProtocal(10991, "handle10991")
	slot0:RegisterProtocal(10992, "handle10992")
	slot0:RegisterProtocal(10993, "handle10993")
end

function MergeserverController.sender10991(slot0)
	slot0:SendProtocal(10991, {})
end

function MergeserverController.handle10991(slot0, slot1)
	if slot1 then
		slot0.dispather:Fire(MergeserverEvent.Update_Main_Mergeserver_Event, slot1)
	end
end

function MergeserverController.sender10992(slot0)
	slot0:SendProtocal(10992, {})
end

function MergeserverController.handle10992(slot0, slot1)
	slot0.dispather:Fire(MergeserverEvent.Update_Merge_MsgResult_Event, slot1)
	slot0.model:setResult(slot1)
end

function MergeserverController.sender10993(slot0, slot1)
	slot0:SendProtocal(10993, {
		flag = slot1
	})
end

function MergeserverController.handle10993(slot0, slot1)
	slot0.model:setVotingStatus(slot1.flag)
	slot0.dispather:Fire(MergeserverEvent.Update_Merge_Success_Event, slot1)
end

function MergeserverController.openMergeWindow(slot0, slot1)
	if slot1 == true then
		if slot0.merge_server_window == nil then
			slot0.merge_server_window = MergeserverLookWindow.New()
		end

		slot0.merge_server_window:open()
	elseif slot0.merge_server_window then
		slot0.merge_server_window:close()

		slot0.merge_server_window = nil
	end
end

function MergeserverController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
