CrossgroundController = CrossgroundController or BaseClass(BaseController)

function CrossgroundController.config(slot0)
	slot0.model = CrossgroundModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function CrossgroundController.getModel(slot0)
	return slot0.model
end

function CrossgroundController.registerEvents(slot0)
end

function CrossgroundController.registerProtocals(slot0)
end

function CrossgroundController.openCrossGroundMainWindow(slot0, slot1)
	if slot1 == true then
		if slot0.cross_ground_window == nil then
			slot0.cross_ground_window = CrossgroundMainWindow.New()
		end

		if slot0.cross_ground_window:isOpen() == false then
			slot0.cross_ground_window:open()
		end
	elseif slot0.cross_ground_window then
		slot0.cross_ground_window:close()

		slot0.cross_ground_window = nil
	end
end

function CrossgroundController.onClickCrossgroundItem(slot0, slot1)
	if slot1 == CrossgroundConst.Ground_Type.Ladder then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LadderWar)
	elseif slot1 == CrossgroundConst.Ground_Type.EliteMatch then
		ElitematchController:getInstance():openElitematchMainWindow(true)
	elseif slot1 == CrossgroundConst.Ground_Type.CrossArena then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossArenaWar)
	elseif slot1 == CrossgroundConst.Ground_Type.CrossChampion then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.CrossChampion)
	elseif slot1 == CrossgroundConst.Ground_Type.Arenateam then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Arean_Team)
	elseif slot1 == CrossgroundConst.Ground_Type.peakChampion then
		ArenapeakchampionController:getInstance():openArenapeakchampionMainWindow(true)
	end
end

function CrossgroundController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
