OrderActionController = OrderActionController or BaseClass(BaseController)

function OrderActionController.config(slot0)
	slot0.model = OrderActionModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function OrderActionController.getModel(slot0)
	return slot0.model
end

function OrderActionController.registerEvents(slot0)
end

function OrderActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(25300, "handle25300")
	slot0:RegisterProtocal(25301, "handle25301")
	slot0:RegisterProtocal(25303, "handle25303")
	slot0:RegisterProtocal(25304, "handle25304")
	slot0:RegisterProtocal(25305, "handle25305")
	slot0:RegisterProtocal(25306, "handle25306")
	slot0:RegisterProtocal(25307, "handle25307")
	slot0:RegisterProtocal(25308, "handle25308")
	slot0:RegisterProtocal(25309, "handle25309")
end

function OrderActionController.send25300(slot0)
	slot0:SendProtocal(25300, {})
end

function OrderActionController.handle25300(slot0, slot1)
	slot0.model:setCurPeriod(slot1.period)
	slot0.model:setCurDay(slot1.cur_day)
	slot0.model:setRMBStatus(slot1.rmb_status)
	slot0.model:setExtraStatus(slot1.exp_status)
	slot0.model:setCurLev(slot1.lev)
	slot0.model:setCurExp(slot1.exp)
	slot0.model:setInitTaskData(slot1.list)
	GlobalEvent:getInstance():Fire(OrderActionEvent.OrderAction_Init_Event, slot1)
end

function OrderActionController.handle25301(slot0, slot1)
	slot0.model:updataTeskData(slot1)
	GlobalEvent:getInstance():Fire(OrderActionEvent.OrderAction_TaskGet_Event)
end

function OrderActionController.send25302(slot0, slot1)
	slot0:SendProtocal(25302, {
		id = slot1
	})
end

function OrderActionController.send25303(slot0)
	slot0:SendProtocal(25303, {})
end

function OrderActionController.handle25303(slot0, slot1)
	slot0.model:setLevShowData(slot1.reward_list)
	GlobalEvent:getInstance():Fire(OrderActionEvent.OrderAction_LevReward_Event, slot1.lev)
end

function OrderActionController.send25304(slot0, slot1)
	slot0:SendProtocal(25304, {
		id = slot1
	})
end

function OrderActionController.handle25304(slot0, slot1)
	message(slot1.msg)
end

function OrderActionController.handle25305(slot0, slot1)
	slot0.model:setCurExp(slot1.exp)
	slot0.model:setCurLev(slot1.lev)
	GlobalEvent:getInstance():Fire(OrderActionEvent.OrderAction_Updata_LevExp_Event, slot1)
end

function OrderActionController.send25306(slot0)
	slot0:SendProtocal(25306, {})
end

function OrderActionController.handle25306(slot0, slot1)
	slot0.model:setRMBStatus(slot1.rmb_status)
	slot0.model:setExtraStatus(slot1.exp_status)
	slot0.model:setGiftStatus(slot1.list)
	GlobalEvent:getInstance():Fire(OrderActionEvent.OrderAction_BuyGiftCard_Event)
end

function OrderActionController.send25307(slot0, slot1)
	slot0:SendProtocal(25307, {
		id = slot1
	})
end

function OrderActionController.handle25307(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		slot0:openBuyLevView(false)
	end
end

function OrderActionController.send25308(slot0)
	slot0:SendProtocal(25308, {})
end

function OrderActionController.handle25308(slot0, slot1)
	message(slot1.msg)
end

function OrderActionController.send25309(slot0)
	slot0:SendProtocal(25309, {})
end

function OrderActionController.handle25309(slot0, slot1)
	GlobalEvent:getInstance():Fire(OrderActionEvent.OrderAction_IsPopWarn_Event, slot1)
end

function OrderActionController.openOrderActionMainView(slot0, slot1)
	if slot1 == true then
		if not slot0.order_action_view then
			slot0.order_action_view = OrderActionMainWindow.New()
		end

		slot0.order_action_view:open()
	elseif slot0.order_action_view then
		slot0.order_action_view:close()

		slot0.order_action_view = nil
	end
end

function OrderActionController.getOrderActionMainRoot(slot0)
	if slot0.order_action_view then
		return slot0.order_action_view
	end

	return nil
end

function OrderActionController.openBuyLevView(slot0, slot1)
	if slot1 == true then
		if not slot0.buy_lev_view then
			slot0.buy_lev_view = BuyLevWindow.New()
		end

		slot0.buy_lev_view:open()
	elseif slot0.buy_lev_view then
		slot0.buy_lev_view:close()

		slot0.buy_lev_view = nil
	end
end

function OrderActionController.openUntieRewardView(slot0, slot1)
	if slot1 == true then
		if not slot0.untie_reward_view then
			slot0.untie_reward_view = UntieRewardWindow.New()
		end

		slot0.untie_reward_view:open()
	elseif slot0.untie_reward_view then
		slot0.untie_reward_view:close()

		slot0.untie_reward_view = nil
	end
end

function OrderActionController.openEndWarnView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.end_warn_view then
			slot0.end_warn_view = OrderActionEndWarnWindow.New()
		end

		slot0.end_warn_view:open(slot2)
	elseif slot0.end_warn_view then
		slot0.end_warn_view:close()

		slot0.end_warn_view = nil
	end
end

function OrderActionController.openBuyCardView(slot0, slot1)
	if slot1 == true then
		if not slot0.buy_card_view then
			slot0.buy_card_view = UntieRewardWindow1.New()
		end

		slot0.buy_card_view:open()
	elseif slot0.buy_card_view then
		slot0.buy_card_view:close()

		slot0.buy_card_view = nil
	end
end

function OrderActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
