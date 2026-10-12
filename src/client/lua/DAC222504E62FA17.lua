StartowerController = StartowerController or BaseClass(BaseController)

function StartowerController.config(slot0)
	slot0.model = StartowerModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function StartowerController.getModel(slot0)
	return slot0.model
end

function StartowerController.registerEvents(slot0)
end

function StartowerController.registerProtocals(slot0)
	slot0:RegisterProtocal(11320, "handle11320")
	slot0:RegisterProtocal(11321, "handle11321")
	slot0:RegisterProtocal(11322, "handle11322")
	slot0:RegisterProtocal(11323, "handle11323")
	slot0:RegisterProtocal(11324, "handle11324")
	slot0:RegisterProtocal(11325, "handle11325")
	slot0:RegisterProtocal(11326, "handle11326")
	slot0:RegisterProtocal(11333, "handle11333")
	slot0:RegisterProtocal(11327, "handle11327")
	slot0:RegisterProtocal(11328, "handle11328")
	slot0:RegisterProtocal(11329, "handle11329")
end

function StartowerController.checkIsOpen(slot0, slot1)
	if Config.StarTowerData.data_tower_const.open_floor == nil then
		return false
	end

	if MainuiController:getInstance():checkIsOpenByActivate(slot2.val) == false and slot1 == true then
		message(slot2.desc)
	end

	return slot3
end

function StartowerController.getStarTowerRoot(slot0)
	if slot0.main_view then
		return slot0.main_view.root_wnd
	end
end

function StartowerController.getStarTowerChallengeRoot(slot0)
	if slot0.star_tower_window then
		return slot0.star_tower_window.root_wnd
	end
end

function StartowerController.openMainView(slot0, slot1)
	if slot1 == false then
		if slot0.main_view ~= nil then
			slot0.main_view:close()

			slot0.main_view = nil
		end
	else
		if slot0:checkIsOpen(true) == false then
			return
		end

		if not slot0.main_view then
			slot0.main_view = StarTowerWindow.New()
		end

		if slot0.main_view and slot0.main_view:isOpen() == false then
			slot0.main_view:open()
		end
	end
end

function StartowerController.openStarTowerMainView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.star_tower_window then
			slot0.star_tower_window = StarTowerMainWindow.New(slot2)
		end

		if slot0.star_tower_window and slot0.star_tower_window:isOpen() == false then
			slot0.star_tower_window:open()
		end
	elseif slot0.star_tower_window then
		slot0.star_tower_window:close()

		slot0.star_tower_window = nil
	end
end

function StartowerController.openAwardWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.award_window then
			slot0.award_window = StarTowerAwardWindow.New()
		end

		if slot0.award_window and slot0.award_window:isOpen() == false then
			slot0.award_window:open()
		end
	elseif slot0.award_window then
		slot0.award_window:close()

		slot0.award_window = nil
	end
end

function StartowerController.openVideoWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.video_window then
			slot0.video_window = StarTowerVideoWindow.New(slot2, slot3)
		end

		if slot0.video_window and slot0.video_window:isOpen() == false then
			slot0.video_window:open()
		end
	elseif slot0.video_window then
		slot0.video_window:close()

		slot0.video_window = nil
	end
end

function StartowerController.getResultWindow(slot0)
	return slot0.result_window
end

function StartowerController.openResultWindow(slot0, slot1, slot2)
	if slot1 == true then
		LevupgradeController:getInstance():waitForOpenLevUpgrade(true)
		BattleResultMgr:getInstance():setWaitShowPanel(true)

		if not slot0.result_window then
			slot0.result_window = StarTowerResultWindow.New(slot2.result, BattleConst.Fight_Type.StarTower)
		end

		if slot0.result_window and slot0.result_window:isOpen() == false then
			slot0.result_window:open(slot2, BattleConst.Fight_Type.StarTower)
		end
	else
		if slot0.result_window then
			slot0.result_window:close()

			slot0.result_window = nil

			if slot0.is_show_lock ~= true or not slot0.show_data then
				GlobalEvent:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
			end

			if slot0.main_view then
				slot0.main_view:playAction()
			end
		end

		slot0.is_show_lock = false
		slot0.show_data = nil
	end
end

function StartowerController.openGetWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.get_window then
			slot0.get_window = StarTowerGetWindow.New(slot2)
		end

		if slot0.get_window and slot0.get_window:isOpen() == false then
			slot0.get_window:open()
		end
	elseif slot0.get_window then
		slot0.get_window:close()

		slot0.get_window = nil
	end
end

function StartowerController.openTipsWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.tips_window then
			slot0.tips_window = StarTowerTipsWindow.New()
		end

		if slot0.tips_window and slot0.tips_window:isOpen() == false then
			slot0.tips_window:open(slot2)
		end
	elseif slot0.tips_window then
		slot0.tips_window:close()

		slot0.tips_window = nil
	end
end

function StartowerController.sender11320(slot0)
	slot0:SendProtocal(11320, {})
end

function StartowerController.handle11320(slot0, slot1)
	slot0.model:setStarTowerData(slot1)
end

function StartowerController.sender11321(slot0)
	slot0:SendProtocal(11321, {})
end

function StartowerController.handle11321(slot0, slot1)
	message(slot1.msg)
	slot0.model:updateLessCount(slot1)
end

function StartowerController.sender11322(slot0, slot1)
	slot0:SendProtocal(11322, {
		tower = slot1
	})
end

function StartowerController.handle11322(slot0, slot1)
	report_mission_begin(BattleConst.Fight_Type.StarTower)
	message(slot1.msg)
	slot0:openStarTowerMainView(false)
end

function StartowerController.handle11323(slot0, slot1)
	if slot1.result == 1 then
		if slot1.is_skip == 1 then
			slot0:openTipsWindow(true, slot1)
		else
			BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.StarTower, slot1)
		end

		slot0.model:updateMaxTower(slot1)
		slot0.model:updateLessCount(slot1)
		GlobalEvent:getInstance():Fire(StartowerEvent.Fight_Success_Event)
	else
		BattleController:getInstance():openFailFinishView(true, BattleConst.Fight_Type.StarTower, slot1.result, slot1)
	end
end

function StartowerController.sender11324(slot0, slot1)
	slot0:SendProtocal(11324, {
		tower = slot1
	})
end

function StartowerController.handle11324(slot0, slot1)
	message(slot1.msg)
	slot0.model:updateLessCount(slot1)
end

function StartowerController.sender11325(slot0, slot1)
	slot0:SendProtocal(11325, {
		tower = slot1
	})
end

function StartowerController.handle11325(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(StartowerEvent.Video_Data_Event, slot1)
end

function StartowerController.handle11326(slot0, slot1)
	slot0.show_data = slot1
	slot0.is_show_lock = true
end

function StartowerController.sender11333(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(11333, {
		replay_id = slot1,
		channel = slot2,
		tower = slot3
	})
end

function StartowerController.handle11333(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		slot0:openVideoWindow(false)
	end
end

function StartowerController.requestStarTowerRank(slot0)
	slot0:SendProtocal(11327, {})
end

function StartowerController.handle11327(slot0, slot1)
	GlobalEvent:getInstance():Fire(StartowerEvent.Update_Top3_rank, slot1.rank_lists)
end

function StartowerController.sender11328(slot0, slot1)
	slot0:SendProtocal(11328, {
		id = slot1
	})
end

function StartowerController.handle11328(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(StartowerEvent.Update_Reward_Event)
	end
end

function StartowerController.handle11329(slot0, slot1)
	slot0.model:setRewardData(slot1.award_list)
	GlobalEvent:getInstance():Fire(StartowerEvent.Update_First_Reward_Msg)
end

function StartowerController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
