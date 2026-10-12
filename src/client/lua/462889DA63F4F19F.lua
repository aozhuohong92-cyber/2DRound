RankController = RankController or BaseClass(BaseController)

function RankController.config(slot0)
	slot0.model = RankModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function RankController.getModel(slot0)
	return slot0.model
end

function RankController.registerEvents(slot0)
end

function RankController.registerProtocals(slot0)
	slot0:RegisterProtocal(12900, "handle_12900")
	slot0:RegisterProtocal(12901, "handle_12901")
	slot0:RegisterProtocal(12902, "handle_12902")
	slot0:RegisterProtocal(12903, "handle_12903")
	slot0:RegisterProtocal(12904, "handle_12904")
end

function RankController.send_12900(slot0, slot1, slot2, slot3, slot4)
	slot5 = 0

	if slot4 == true then
		slot5 = 1
	end

	slot0:SendProtocal(12900, {
		type = slot1,
		start = slot2 or 1,
		num = slot3 or 100,
		is_cluster = slot5
	})
end

function RankController.handle_12900(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(RankEvent.RankEvent_Get_Rank_data, slot1)
	end
end

function RankController.send_12901(slot0, slot1, slot2)
	slot3 = 0

	if slot2 == true then
		slot3 = 1
	end

	slot0:SendProtocal(12901, {
		type = slot1,
		is_cluster = slot3
	})
end

function RankController.handle_12901(slot0, slot1)
	GlobalEvent:getInstance():Fire(RankEvent.RankEvent_Get_Time_event, slot1)
end

function RankController.send_12902(slot0, slot1)
	slot2 = 0

	if slot1 == true then
		slot2 = 1
	end

	slot0:SendProtocal(12902, {
		is_cluster = slot2
	})
end

function RankController.handle_12902(slot0, slot1)
	GlobalEvent:getInstance():Fire(RankEvent.RankEvent_Get_First_data, slot1)
end

function RankController.send_12903(slot0, slot1)
	slot2 = 0

	if slot1 == true then
		slot2 = 1
	end

	slot0:SendProtocal(12903, {
		start = 1,
		num = 100,
		is_cluster = slot2
	})
end

function RankController.handle_12903(slot0, slot1)
	GlobalEvent:getInstance():Fire(RankEvent.RankEvent_Get_Rank_data, slot1)
end

function RankController.send_12904(slot0, slot1, slot2)
	slot0:SendProtocal(12904, {
		start = slot1 or 1,
		num = slot2 or 100
	})
end

function RankController.handle_12904(slot0, slot1)
	GlobalEvent:getInstance():Fire(RankEvent.RankEvent_Get_Rank_data, slot1)
end

function RankController.openMainView(slot0, slot1, slot2)
	if slot1 == true then
		if slot0:checkRankIsShow() then
			if MainuiController:getInstance():checkMainFunctionOpenStatus(MainuiConst.icon.rank, MainuiConst.function_type.other) == false then
				return
			end

			if not slot0.main_view then
				slot0.main_view = RankMainWindow.New()
			end

			slot0.main_view:open(slot2)
		else
			message(string.format(TI18N("%d级开启"), RankConstant.limit_open_lev))
		end
	elseif slot0.main_view then
		slot0.main_view:close()

		slot0.main_view = nil
	end
end

function RankController.openRankView(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0:checkRankIsShow() then
			if not slot0.rank_panel then
				slot0.rank_panel = RankWindow.New(slot2, slot3)
			end

			slot0.rank_panel:open()
		else
			message(string.format(TI18N("%d级开启"), RankConstant.limit_open_lev))
		end
	elseif slot0.rank_panel then
		slot0.rank_panel:close()

		slot0.rank_panel = nil
	end
end

function RankController.checkRankIsShow(slot0)
	if RoleController:getInstance():getModel():getRoleVo() and RankConstant.limit_open_lev <= slot1.lev then
		return true
	end

	return false
end

function RankController.openRankRewardPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.rank_reward_panel then
			slot0.rank_reward_panel = RankRewardPanel.New(slot2)
		end

		slot0.rank_reward_panel:open()
	elseif slot0.rank_reward_panel then
		slot0.rank_reward_panel:close()

		slot0.rank_reward_panel = nil
	end
end

function RankController.openSingleRankMainWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot4 = slot2 or {}

		if not slot0.single_rank_main_window then
			slot0.single_rank_main_window = SingleRankMainWindow.New(slot4.title_name, slot4.background_path)
		end

		slot0.single_rank_main_window:open(slot4, slot3)
	elseif slot0.single_rank_main_window then
		slot0.single_rank_main_window:close()

		slot0.single_rank_main_window = nil
	end
end

function RankController.openChatMessage(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot5 = RoleController:getInstance():getRoleVo()

	if slot1 and slot2 and slot5.rid == slot1 and slot5.srv_id == slot2 then
		message(TI18N("你不认识你自己了么？"))

		return
	end

	if slot2 and slot2 == "robot" then
		message(TI18N("神秘人太高冷，不给查看"))

		return
	end

	if slot3 and slot3 == 1 then
		message(TI18N("神秘人太高冷，不给查看"))

		return
	end

	ChatController:getInstance():openFriendInfo({
		rid = slot1,
		srv_id = slot2
	}, slot4 or cc.p(0, 0))
end

function RankController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
