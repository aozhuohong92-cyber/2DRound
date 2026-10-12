NeworderactionController = NeworderactionController or BaseClass(BaseController)

function NeworderactionController.config(slot0)
	slot0.model = NeworderactionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function NeworderactionController.getModel(slot0)
	return slot0.model
end

function NeworderactionController.registerEvents(slot0)
end

function NeworderactionController.registerProtocals(slot0)
	slot0:RegisterProtocal(28700, "handle28700")
	slot0:RegisterProtocal(28701, "handle28701")
	slot0:RegisterProtocal(28703, "handle28703")
	slot0:RegisterProtocal(28704, "handle28704")
	slot0:RegisterProtocal(28705, "handle28705")
	slot0:RegisterProtocal(28706, "handle28706")
	slot0:RegisterProtocal(28707, "handle28707")
	slot0:RegisterProtocal(28708, "handle28708")
end

function NeworderactionController.send28700(slot0)
	slot0:SendProtocal(28700, {})
end

function NeworderactionController.handle28700(slot0, slot1)
	slot0.model:setCurPeriod(slot1.period)
	slot0.model:setCurDay(slot1.cur_day)
	slot0.model:setRMBStatus(slot1.rmb_status)
	slot0.model:setCurLev(slot1.lev)
	slot0.model:setCurExp(slot1.exp)
	slot0.model:setInitTaskData(slot1.list)
	slot0.model:setPeriodLev(slot1.period_lev)
	slot0.model:setDayLev(slot1.day_lev)
	slot0.model:setWeekLev(slot1.week_lev)
	slot0.dispather:Fire(NeworderactionEvent.OrderAction_Init_Event, slot1)
end

function NeworderactionController.handle28701(slot0, slot1)
	slot0.model:updataTaskData(slot1)
	slot0.dispather:Fire(NeworderactionEvent.OrderAction_TaskGet_Event)
end

function NeworderactionController.send28702(slot0, slot1)
	slot0:SendProtocal(28702, {
		id = slot1
	})
end

function NeworderactionController.send28703(slot0)
	slot0:SendProtocal(28703, {})
end

function NeworderactionController.handle28703(slot0, slot1)
	slot0.model:setLevShowData(slot1.reward_list)
	slot0.dispather:Fire(NeworderactionEvent.OrderAction_LevReward_Event, slot1)
end

function NeworderactionController.send28704(slot0, slot1)
	slot0:SendProtocal(28704, {
		id = slot1
	})
end

function NeworderactionController.handle28704(slot0, slot1)
	message(slot1.msg)
end

function NeworderactionController.handle28705(slot0, slot1)
	slot0.model:setCurExp(slot1.exp)
	slot0.model:setCurLev(slot1.lev)
	slot0.dispather:Fire(NeworderactionEvent.OrderAction_Updata_LevExp_Event, slot1)
end

function NeworderactionController.send28706(slot0)
	slot0:SendProtocal(28706, {})
end

function NeworderactionController.handle28706(slot0, slot1)
	slot0.model:setRMBStatus(slot1.rmb_status)
	slot0.model:setGiftStatus(slot1.list)
	slot0.dispather:Fire(NeworderactionEvent.OrderAction_BuyGiftCard_Event)
end

function NeworderactionController.send28707(slot0)
	slot0:SendProtocal(28707, {})
end

function NeworderactionController.handle28707(slot0, slot1)
	slot0.dispather:Fire(NeworderactionEvent.OrderAction_IsPopWarn_Event, slot1)
end

function NeworderactionController.send28708(slot0)
	slot0:SendProtocal(28708)
end

function NeworderactionController.handle28708(slot0, slot1)
	if slot1 and slot1.flag and slot1.flag == 1 then
		slot0.model:setPeriodRed(true)
	end

	slot0.model:setPeriodRed(false)
end

function NeworderactionController.openOrderActionMainView(slot0, slot1)
	if slot1 == true then
		if not slot0.new_orderaction_window then
			slot0.new_orderaction_window = NewOrderactionWindow.New()
		end

		slot0.new_orderaction_window:open()
	elseif slot0.new_orderaction_window then
		slot0.new_orderaction_window:close()

		slot0.new_orderaction_window = nil
	end
end

function NeworderactionController.getOrderActionMainRoot(slot0)
	if slot0.order_action_view then
		return slot0.order_action_view
	end

	return nil
end

function NeworderactionController.openUntieRewardView(slot0, slot1)
	if slot1 == true then
		if not slot0.untie_reward_view then
			slot0.untie_reward_view = NewUntieRewardWindow.New()
		end

		slot0.untie_reward_view:open()
	elseif slot0.untie_reward_view then
		slot0.untie_reward_view:close()

		slot0.untie_reward_view = nil
	end
end

function NeworderactionController.openEndWarnView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.end_warn_view then
			slot0.end_warn_view = NewOrderActionEndWarnWindow.New()
		end

		slot0.end_warn_view:open(slot2)
	elseif slot0.end_warn_view then
		slot0.end_warn_view:close()

		slot0.end_warn_view = nil
	end
end

function NeworderactionController.openBuyCardView(slot0, slot1)
	if slot1 == true then
		if not slot0.buy_card_view then
			slot0.buy_card_view = NewUntieRewardWindow1.New()
		end

		slot0.buy_card_view:open()
	elseif slot0.buy_card_view then
		slot0.buy_card_view:close()

		slot0.buy_card_view = nil
	end
end

function NeworderactionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
