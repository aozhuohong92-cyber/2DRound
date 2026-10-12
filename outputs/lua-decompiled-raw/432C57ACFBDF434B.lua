ActiontermbeginsController = ActiontermbeginsController or BaseClass(BaseController)

function ActiontermbeginsController.config(slot0)
	slot0.model = ActiontermbeginsModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ActiontermbeginsController.getModel(slot0)
	return slot0.model
end

function ActiontermbeginsController.registerEvents(slot0)
end

function ActiontermbeginsController.registerProtocals(slot0)
	slot0:RegisterProtocal(26700, "handle26700")
	slot0:RegisterProtocal(26701, "handle26701")
	slot0:RegisterProtocal(26702, "handle26702")
	slot0:RegisterProtocal(26703, "handle26703")
	slot0:RegisterProtocal(26704, "handle26704")
	slot0:RegisterProtocal(26705, "handle26705")
	slot0:RegisterProtocal(26706, "handle26706")
	slot0:RegisterProtocal(26707, "handle26707")
	slot0:RegisterProtocal(26708, "handle26708")
	slot0:RegisterProtocal(26709, "handle26709")
	slot0:RegisterProtocal(26710, "handle26710")
	slot0:RegisterProtocal(26711, "handle26711")
	slot0:RegisterProtocal(26712, "handle26712")
end

function ActiontermbeginsController.sender26700(slot0)
	slot0:SendProtocal(26700, {})
end

function ActiontermbeginsController.handle26700(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_MAIN_EVENT, slot1)
end

function ActiontermbeginsController.sender26701(slot0)
	slot0:SendProtocal(26701, {})
end

function ActiontermbeginsController.handle26701(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_BUY_COUNT_EVENT, slot1)
	end
end

function ActiontermbeginsController.sender26702(slot0)
	slot0:SendProtocal(26702, {})
end

function ActiontermbeginsController.handle26702(slot0, slot1)
	message(slot1.msg)
end

function ActiontermbeginsController.handle26703(slot0, slot1)
	slot1.item_rewards = slot1.award_list

	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.TermBegins, slot1)
end

function ActiontermbeginsController.sender26704(slot0, slot1)
	slot0:SendProtocal(26704, {
		count = slot1
	})
end

function ActiontermbeginsController.handle26704(slot0, slot1)
	if slot1.code == TRUE then
		message(TI18N("提交成功"))
		GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_SUBIT_PAPER_EVENT, slot1)
	else
		message(slot1.msg)
	end
end

function ActiontermbeginsController.sender26705(slot0)
	slot0:SendProtocal(26705, {})
end

function ActiontermbeginsController.handle26705(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_PAPER_REWARD_LIST_EVENT, slot1)
end

function ActiontermbeginsController.sender26706(slot0, slot1)
	slot0:SendProtocal(26706, {
		id = slot1
	})
end

function ActiontermbeginsController.handle26706(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_RECEIVE_PAPER_EVENT, slot1)
	end
end

function ActiontermbeginsController.sender26707(slot0)
	slot0:SendProtocal(26707, {})
end

function ActiontermbeginsController.handle26707(slot0, slot1)
	message(slot1.msg)
end

function ActiontermbeginsController.handle26708(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.TermBeginsBoss, slot1)
end

function ActiontermbeginsController.sender26709(slot0, slot1)
	slot0:SendProtocal(26709, {
		boss_id = slot1
	})
end

function ActiontermbeginsController.handle26709(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.TermBeginsBoss, slot1)
	end
end

function ActiontermbeginsController.sender26710(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(26710, {
		boss_id = slot1,
		start_num = slot2 or 1,
		end_num = slot3 or 100
	})
end

function ActiontermbeginsController.handle26710(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_RANK_EVENT, slot1)
end

function ActiontermbeginsController.sender26711(slot0)
	slot0:SendProtocal(26711, {})
end

function ActiontermbeginsController.handle26711(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.ACTION_TERM_BEGINS_EVENT, slot1)
end

function ActiontermbeginsController.sender26712(slot0, slot1)
	slot0:SendProtocal(26712, {
		num = 1,
		flag = slot1
	})
end

function ActiontermbeginsController.handle26712(slot0, slot1)
	if slot1.code == TRUE then
		if slot1.flag == 0 then
			GlobalEvent:getInstance():Fire(ActiontermbeginsEvent.TERM_BEGINS_BOSS_FORM_EVENT)
		else
			slot0:sender26709(slot1.flag)
		end
	end
end

function ActiontermbeginsController.openActiontermbeginsMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.action_term_begins_main_window ~= nil then
			slot0.action_term_begins_main_window:close()

			slot0.action_term_begins_main_window = nil
		end
	else
		if slot0.action_term_begins_main_window == nil then
			slot0.action_term_begins_main_window = ActiontermbeginsMainWindow.New()
		end

		slot0.action_term_begins_main_window:open(slot2)
	end
end

function ActiontermbeginsController.openActiontermbeginsFightResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if not slot0.term_begins_result_window then
			slot0.term_begins_result_window = ActiontermbeginsFightResultPanel.New()
		end

		if slot0.term_begins_result_window and slot0.term_begins_result_window:isOpen() == false then
			slot0.term_begins_result_window:open(slot2, BattleConst.Fight_Type.TermBeginsBoss)
		end
	elseif slot0.term_begins_result_window then
		slot0.term_begins_result_window:close()

		slot0.term_begins_result_window = nil

		GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
	end
end

function ActiontermbeginsController.openActiontermbeginsCollectResultPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.action_term_begins_cellect_reward_panel ~= nil then
			slot0.action_term_begins_cellect_reward_panel:close()

			slot0.action_term_begins_cellect_reward_panel = nil
		end
	else
		if slot0.action_term_begins_cellect_reward_panel == nil then
			slot0.action_term_begins_cellect_reward_panel = ActiontermbeginsCollectResultPanel.New()
		end

		slot0.action_term_begins_cellect_reward_panel:open(slot2)
	end
end

function ActiontermbeginsController.openActionBuyPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.action_buy_panel ~= nil then
			slot0.action_buy_panel:close()

			slot0.action_buy_panel = nil
		end
	else
		if slot0.action_buy_panel == nil then
			slot0.action_buy_panel = ActionBuyPanel.New()
		end

		slot0.action_buy_panel:open(slot2)
	end
end

function ActiontermbeginsController.openActiontermbeginsRankMainPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.action_term_begins_rank_main_panel ~= nil then
			slot0.action_term_begins_rank_main_panel:close()

			slot0.action_term_begins_rank_main_panel = nil
		end
	else
		if slot0.action_term_begins_rank_main_panel == nil then
			slot0.action_term_begins_rank_main_panel = ActiontermbeginsRankMainPanel.New()
		end

		slot0.action_term_begins_rank_main_panel:open(slot2)
	end
end

function ActiontermbeginsController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
