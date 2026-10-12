EsecsiceController = EsecsiceController or BaseClass(BaseController)

function EsecsiceController.config(slot0)
	slot0.model = ActivityModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function EsecsiceController.getModel(slot0)
	return slot0.model
end

function EsecsiceController.registerEvents(slot0)
end

function EsecsiceController.registerProtocals(slot0)
end

function EsecsiceController.openEsecsiceView(slot0, slot1)
	if slot1 == true then
		if not slot0.esecsiceView then
			slot0.esecsiceView = EsecsiceWindow.New()
		end

		slot0.esecsiceView:open()
	elseif slot0.esecsiceView then
		slot0.esecsiceView:close()

		slot0.esecsiceView = nil
	end
end

function EsecsiceController.getEsecsiceRoot(slot0)
	if slot0.esecsiceView then
		return slot0.esecsiceView.root_wnd
	end
end

function EsecsiceController.switchEcersiceActivityView(slot0, slot1)
	if slot1 == EsecsiceConst.exercise_index.endless then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Endless)
	elseif slot1 == EsecsiceConst.exercise_index.stonedungeon then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.DungeonStone)
	elseif slot1 == EsecsiceConst.exercise_index.honourfane then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.PrimusWar)
	elseif slot1 == EsecsiceConst.exercise_index.heroexpedit then
		PlanesafkController:getInstance():sender28601()
	end
end

function EsecsiceController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
