DialActionController = DialActionController or BaseClass(BaseController)

function DialActionController.config(slot0)
	slot0.model = DialActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function DialActionController.getModel(slot0)
	return slot0.model
end

function DialActionController.registerEvents(slot0)
end

function DialActionController.sender16670(slot0)
	slot0:SendProtocal(16670, {})
end

function DialActionController.sender16671(slot0, slot1, slot2)
	slot0:SendProtocal(16671, {
		count = slot1,
		flag = slot2
	})
end

function DialActionController.sender16672(slot0)
	slot0:SendProtocal(16672, {})
end

function DialActionController.sender16673(slot0, slot1)
	slot0:SendProtocal(16673, {
		id = slot1
	})
end

function DialActionController.sender16674(slot0, slot1)
	slot0:SendProtocal(16674, {
		type = slot1
	})
end

function DialActionController.sender16675(slot0, slot1)
	slot0:SendProtocal(16675, {
		num = slot1
	})
end

function DialActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(16670, "handle16670")
	slot0:RegisterProtocal(16671, "handle16671")
	slot0:RegisterProtocal(16672, "handle16672")
	slot0:RegisterProtocal(16673, "handle16673")
	slot0:RegisterProtocal(16674, "handle16674")
	slot0:RegisterProtocal(16675, "handle16675")
	slot0:RegisterProtocal(16676, "handle16676")
end

function DialActionController.handle16670(slot0, slot1)
	if slot1 then
		slot0.model:setDialData(slot1)
		GlobalEvent:getInstance():Fire(DialActionEvent.Update_Dial_Data_Event, slot1)
	end
end

function DialActionController.handle16671(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.result == TRUE and slot1.flag == 0 then
			GlobalEvent:getInstance():Fire(DialActionEvent.Update_Dial_Result_Event, slot1.id)
		end
	end
end

function DialActionController.handle16672(slot0, slot1)
	if slot1 then
		ActionController:getInstance():openTreasureGetItemWindow(true, slot1.awards2, slot1.count, 3)
	end
end

function DialActionController.handle16673(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function DialActionController.handle16674(slot0, slot1)
	if slot1 then
		if slot1.type == 1 then
			slot0.model:setMyselfDialRecordData(slot1.log_list)
		elseif slot1.type == 2 then
			slot0.model:setAllDialRecordData(slot1.log_list)
		end

		GlobalEvent:getInstance():Fire(DialActionEvent.Update_Dial_Record_Event, slot1.type)
	end
end

function DialActionController.handle16675(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function DialActionController.handle16676(slot0, slot1)
	if slot1 then
		slot0.model:updateDialGoldNum(slot1.gold)
		GlobalEvent:getInstance():Fire(DialActionEvent.Update_Dial_Gold_Event)
	end
end

function DialActionController.openDialRecordWindow(slot0, slot1)
	if slot1 == true then
		if slot0.dial_record_wnd == nil then
			slot0.dial_record_wnd = DialRecordWindow.New()
		end

		if slot0.dial_record_wnd:isOpen() == false then
			slot0.dial_record_wnd:open()
		end
	elseif slot0.dial_record_wnd then
		slot0.dial_record_wnd:close()

		slot0.dial_record_wnd = nil
	end
end

function DialActionController.openDialAwardWindow(slot0, slot1)
	if slot1 == true then
		if slot0.dial_award_wnd == nil then
			slot0.dial_award_wnd = DialAwardWindow.New()
		end

		if slot0.dial_award_wnd:isOpen() == false then
			slot0.dial_award_wnd:open()
		end
	elseif slot0.dial_award_wnd then
		slot0.dial_award_wnd:close()

		slot0.dial_award_wnd = nil
	end
end

function DialActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
