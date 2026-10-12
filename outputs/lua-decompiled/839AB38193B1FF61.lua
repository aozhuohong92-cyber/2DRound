AdventureActivityController = AdventureActivityController or BaseClass(BaseController)

function AdventureActivityController.config(slot0)
	slot0.model = AdventureActivityModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function AdventureActivityController.getModel(slot0)
	return slot0.model
end

function AdventureActivityController.registerEvents(slot0)
end

function AdventureActivityController.registerProtocals(slot0)
end

function AdventureActivityController.openAdventureActivityMainWindow(slot0, slot1)
	if slot1 == true then
		if slot0.adventure_activity_window == nil then
			slot0.adventure_activity_window = AdventureActivityWindow.New()
		end

		if slot0.adventure_activity_window:isOpen() == false then
			slot0.adventure_activity_window:open()
		end
	elseif slot0.adventure_activity_window then
		slot0.adventure_activity_window:close()

		slot0.adventure_activity_window = nil
	end
end

function AdventureActivityController.getAdventureActivityWindowRoot(slot0)
	if slot0.adventure_activity_window ~= nil then
		return slot0.adventure_activity_window.root_wnd
	end
end

function AdventureActivityController.onClickGotoAdvenTureAcivity(slot0, slot1)
	if slot1 == AdventureActivityConst.Ground_Type.adventure then
		AdventureController:getInstance():requestEnterAdventure()
	elseif slot1 == AdventureActivityConst.Ground_Type.element then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.ElementWar)
	elseif slot1 == AdventureActivityConst.Ground_Type.heaven then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.HeavenWar)
	elseif slot1 == AdventureActivityConst.Ground_Type.adventure_mine then
		AdventureController:getInstance():requestEnterMaxAdventureMine()
	end
end

function AdventureActivityController.isOpenActivity(slot0, slot1)
	if not Config.CrossGroundData then
		return false
	end

	if not Config.CrossGroundData.data_adventure_activity then
		return false
	end

	slot3 = false

	if slot2[slot1] then
		if MainuiController:getInstance():checkIsOpenByActivate(slot2[slot1].activate) == true or MainuiController:getInstance():checkIsOpenByActivate(slot2[slot1].activate_2) == true then
			slot3 = true
		end
	end

	return slot3
end

function AdventureActivityController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
