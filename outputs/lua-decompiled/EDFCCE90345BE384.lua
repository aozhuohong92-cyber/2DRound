LevupgradeController = LevupgradeController or BaseClass(BaseController)

function LevupgradeController.config(slot0)
	slot0.model = LevupgradeModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.wait_list = {}
end

function LevupgradeController.getModel(slot0)
	return slot0.model
end

function LevupgradeController.registerEvents(slot0)
end

function LevupgradeController.registerProtocals(slot0)
	slot0:RegisterProtocal(10344, "handle10344")
end

function LevupgradeController.handle10344(slot0, slot1)
	BattleResultMgr:getInstance():addShowData(BattleConst.Closed_Result_Type.LevelUpgradeType, slot1)
end

function LevupgradeController.waitForOpenLevUpgrade(slot0, slot1)
end

function LevupgradeController.openMainWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.lev_window then
			slot0.lev_window:close()

			slot0.lev_window = nil
		end
	else
		if slot0.lev_window == nil then
			slot0.lev_window = LevupgradeWindow.New()
		end

		slot0.lev_window:open(slot2)
	end
end

function LevupgradeController.waitLevupgrade(slot0)
	return slot0.cache_data ~= nil or slot0.lev_window ~= nil or next(slot0.wait_list) ~= nil
end

function LevupgradeController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
