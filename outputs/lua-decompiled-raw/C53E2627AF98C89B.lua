FestivalActionController = FestivalActionController or BaseClass(BaseController)

function FestivalActionController.config(slot0)
	slot0.model = FestivalActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function FestivalActionController.getModel(slot0)
	return slot0.model
end

function FestivalActionController.registerEvents(slot0)
end

function FestivalActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(25700, "handle25700")
	slot0:RegisterProtocal(25701, "handle25701")
	slot0:RegisterProtocal(25702, "handle25702")
	slot0:RegisterProtocal(25703, "handle25703")
	slot0:RegisterProtocal(25704, "handle25704")
	slot0:RegisterProtocal(26300, "handle26300")
	slot0:RegisterProtocal(26301, "handle26301")
end

function FestivalActionController.sender25700(slot0)
	slot0:SendProtocal(25700, {})
end

function FestivalActionController.handle25700(slot0, slot1)
	slot0.model:setActionStartStatus(slot1.state)
	slot0.model:setTreasureData(slot1.holiday_snatch_info)
	slot0.model:setCountDownTime(slot1.state_time)
	GlobalEvent:getInstance():Fire(FestivalActionEvent.TreasureMessage, slot1)
end

function FestivalActionController.sender25701(slot0, slot1, slot2)
	slot0:SendProtocal(25701, {
		pos = slot1,
		num = slot2
	})
end

function FestivalActionController.handle25701(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0:openTreasureJoinView(false)
	end
end

function FestivalActionController.sender25702(slot0, slot1)
	slot0:SendProtocal(25702, {
		pos = slot1
	})
end

function FestivalActionController.handle25702(slot0, slot1)
	GlobalEvent:getInstance():Fire(FestivalActionEvent.Treasure_OpenStatus_Event, slot1)
end

function FestivalActionController.sender25703(slot0)
	slot0:SendProtocal(25703, {})
end

function FestivalActionController.handle25703(slot0, slot1)
	GlobalEvent:getInstance():Fire(FestivalActionEvent.Treasure_AllServer_Event, slot1)
end

function FestivalActionController.sender25704(slot0)
	slot0:SendProtocal(25704, {})
end

function FestivalActionController.handle25704(slot0, slot1)
	GlobalEvent:getInstance():Fire(FestivalActionEvent.Treasure_MyServer_Event, slot1)
end

function FestivalActionController.openTreasureAllServerView(slot0, slot1)
	if slot1 == true then
		if not slot0.all_server_view then
			slot0.all_server_view = TreasureAllServerWindow.New()
		end

		slot0.all_server_view:open()
	elseif slot0.all_server_view then
		slot0.all_server_view:close()

		slot0.all_server_view = nil
	end
end

function FestivalActionController.openTreasureMyServerView(slot0, slot1)
	if slot1 == true then
		if not slot0.my_server_view then
			slot0.my_server_view = TreasureMyServerWindow.New()
		end

		slot0.my_server_view:open()
	elseif slot0.my_server_view then
		slot0.my_server_view:close()

		slot0.my_server_view = nil
	end
end

function FestivalActionController.openTreasureJoinView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.join_server_view then
			slot0.join_server_view = TreasureJoinWindow.New()
		end

		slot0.join_server_view:open(slot2, slot3)
	elseif slot0.join_server_view then
		slot0.join_server_view:close()

		slot0.join_server_view = nil
	end
end

function FestivalActionController.openTreasureOpenAwardView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.open_award_view then
			slot0.open_award_view = TreasureOpenAwardWindow.New()
		end

		slot0.open_award_view:open(slot2)
	elseif slot0.open_award_view then
		slot0.open_award_view:close()

		slot0.open_award_view = nil
	end
end

function FestivalActionController.sender26300(slot0)
	slot0:SendProtocal(26300)
end

function FestivalActionController.handle26300(slot0, slot1)
	GlobalEvent:getInstance():Fire(FestivalActionEvent.Personal_Gift_Event, slot1)
end

function FestivalActionController.sender26301(slot0)
	slot0:SendProtocal(26301)
end

function FestivalActionController.handle26301(slot0, slot1)
	if slot1.flag == 1 then
		CommonAlert.show(TI18N("恭喜你激活专属钜惠礼包，是否前往购买？"), TI18N("前往"), function ()
			uv0:openPersonalGiftView(true)
		end, TI18N("取消"), nil, , , {
			view_tag = ViewMgrTag.RECONNECT_TAG
		})
	end
end

function FestivalActionController.openPersonalGiftView(slot0, slot1)
	if slot1 == true then
		if not slot0.personal_gift_view then
			slot0.personal_gift_view = PersonnalGiftWindow.New()
		end

		slot0.personal_gift_view:open()
	elseif slot0.personal_gift_view then
		slot0.personal_gift_view:close()

		slot0.personal_gift_view = nil
	end
end

function FestivalActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
