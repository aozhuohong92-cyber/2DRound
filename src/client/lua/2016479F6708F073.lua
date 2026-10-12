EliteSummonController = EliteSummonController or BaseClass(BaseController)

function EliteSummonController.config(slot0)
	slot0.model = EliteSummonModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function EliteSummonController.getModel(slot0)
	return slot0.model
end

function EliteSummonController.registerProtocals(slot0)
	slot0:RegisterProtocal(23220, "handle23220")
	slot0:RegisterProtocal(23221, "handle23221")
	slot0:RegisterProtocal(23222, "handle23222")
	slot0:RegisterProtocal(23230, "handle23230")
	slot0:RegisterProtocal(23231, "handle23231")
	slot0:RegisterProtocal(23232, "handle23232")
	slot0:RegisterProtocal(23233, "handle23233")
	slot0:RegisterProtocal(16690, "handle16690")
	slot0:RegisterProtocal(16691, "handle16691")
	slot0:RegisterProtocal(16692, "handle16692")
	slot0:RegisterProtocal(16693, "handle16693")
	slot0:RegisterProtocal(16694, "handle16694")
end

function EliteSummonController.send23220(slot0)
	slot0:SendProtocal(23220)
end

function EliteSummonController.handle23220(slot0, slot1)
	slot0.dispather:Fire(EliteSummonEvent.EliteSummon_Message, slot1)
end

function EliteSummonController.send23221(slot0, slot1, slot2)
	slot0:SendProtocal(23221, {
		times = slot1,
		recruit_type = slot2
	})
end

function EliteSummonController.handle23221(slot0, slot1)
	message(slot1.msg)
end

function EliteSummonController.send23222(slot0)
	slot0:SendProtocal(23222)
end

function EliteSummonController.handle23222(slot0, slot1)
	message(slot1.msg)
end

function EliteSummonController.send23230(slot0)
	slot0:SendProtocal(23230)
end

function EliteSummonController.handle23230(slot0, slot1)
	slot0.model:setSelectSummonData(slot1)
	slot0.dispather:Fire(EliteSummonEvent.SelectEliteSummon_Message, slot1)
end

function EliteSummonController.send23231(slot0, slot1, slot2)
	slot0:SendProtocal(23231, {
		times = slot1,
		recruit_type = slot2
	})
end

function EliteSummonController.handle23231(slot0, slot1)
	message(slot1.msg)
end

function EliteSummonController.send23232(slot0, slot1, slot2)
	slot0:SendProtocal(23232, {
		award_id = slot1,
		self_award_id = slot2
	})
end

function EliteSummonController.handle23232(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		TimesummonController:getInstance():openHeroSelectView(false)
	end
end

function EliteSummonController.send23233(slot0, slot1)
	slot0:SendProtocal(23233, {
		lucky_bid = slot1
	})
end

function EliteSummonController.handle23233(slot0, slot1)
	message(slot1.msg)
end

function EliteSummonController.send16690(slot0)
	slot0:SendProtocal(16690)
end

function EliteSummonController.handle16690(slot0, slot1)
	slot0.model:setPineBaseData(slot1)
	slot0.model:setGoodsItemPos(slot1.predict_data)
	slot0.dispather:Fire(EliteSummonEvent.PresageSummon_Message, slot1)
end

function EliteSummonController.send16691(slot0, slot1)
	slot0:SendProtocal(16691, {
		type = slot1
	})
end

function EliteSummonController.handle16691(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:updataOpenPeelPineData(slot1)
		slot0.dispather:Fire(EliteSummonEvent.PresageSummon_ReFresh, slot1)
	end
end

function EliteSummonController.send16692(slot0, slot1)
	slot0:SendProtocal(16692, {
		num = slot1
	})
end

function EliteSummonController.handle16692(slot0, slot1)
	message(slot1.msg)
end

function EliteSummonController.send16693(slot0, slot1)
	slot0:SendProtocal(16693, {
		type = slot1
	})
end

function EliteSummonController.handle16693(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:updataBuyData(slot1)
		slot0.model:updataPromptGetBtnStatus(slot1)
		slot0.dispather:Fire(EliteSummonEvent.PresageSummon_Buy_Return)
	end
end

function EliteSummonController.send16694(slot0, slot1)
	slot0:SendProtocal(16694, {
		type = slot1
	})
end

function EliteSummonController.handle16694(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		slot0.model:updataPresageStatus(slot1)
		slot0.dispather:Fire(EliteSummonEvent.PresageSummon_Open_Pine)
	end
end

function EliteSummonController.openSummonSelectWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.summon_select_wnd then
			slot0.summon_select_wnd = SummonSelectWindow.New()
		end

		if slot0.summon_select_wnd:isOpen() == false then
			slot0.summon_select_wnd:open(data)
		end
	elseif slot0.summon_select_wnd then
		slot0.summon_select_wnd:close()

		slot0.summon_select_wnd = nil
	end
end

function EliteSummonController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
