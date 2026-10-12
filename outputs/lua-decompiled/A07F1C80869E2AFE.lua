SevenGoalController = SevenGoalController or BaseClass(BaseController)

function SevenGoalController.config(slot0)
	slot0.model = SevenGoalModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function SevenGoalController.getModel(slot0)
	return slot0.model
end

function SevenGoalController.registerEvents(slot0)
end

function SevenGoalController.registerProtocals(slot0)
	slot0:RegisterProtocal(13604, "handle13604")
	slot0:RegisterProtocal(13605, "handle13605")
	slot0:RegisterProtocal(13606, "handle13606")
	slot0:RegisterProtocal(13607, "handle13607")
	slot0:RegisterProtocal(13608, "handle13608")
	slot0:RegisterProtocal(13609, "handle13609")
end

function SevenGoalController.sender13604(slot0)
	slot0:SendProtocal(13604, {})
end

function SevenGoalController.handle13604(slot0, slot1)
	slot0.model:setInitSevenGoalData(slot1)
	GlobalEvent:getInstance():Fire(SevenGoalEvent.BaseMessage, slot1)
end

function SevenGoalController.handle13605(slot0, slot1)
	slot0.model:setInitDataUpdata(slot1.list)
	slot0.model:checkMainRedPoint()
	GlobalEvent:getInstance():Fire(SevenGoalEvent.Tesk_Updata, slot1)
end

function SevenGoalController.sender13606(slot0, slot1)
	slot0:SendProtocal(13606, {
		id = slot1
	})
end

function SevenGoalController.handle13606(slot0, slot1)
	message(slot1.msg)
end

function SevenGoalController.openSevenGoalAdventureView(slot0, slot1)
	if slot1 == true then
		if not slot0.sevengoal_adventure then
			slot0.sevengoal_adventure = SevenGoalAdventureWindow.New()
		end

		slot0.sevengoal_adventure:open()
	elseif slot0.sevengoal_adventure then
		slot0.sevengoal_adventure:close()

		slot0.sevengoal_adventure = nil
	end
end

function SevenGoalController.handle13609(slot0, slot1)
	GlobalEvent:getInstance():Fire(SevenGoalEvent.Updata_Lev, slot1)
end

function SevenGoalController.sender13607(slot0)
	slot0:SendProtocal(13607, {})
end

function SevenGoalController.handle13607(slot0, slot1)
	slot0.model:setSevenGoalLevData(slot1.reward_list)
	GlobalEvent:getInstance():Fire(SevenGoalEvent.Reward_Lev, slot1)
end

function SevenGoalController.sender13608(slot0, slot1)
	slot0:SendProtocal(13608, {
		id = slot1
	})
end

function SevenGoalController.handle13608(slot0, slot1)
	message(slot1.msg)
end

function SevenGoalController.openSevenGoalAdventureLevRewardView(slot0, slot1)
	if slot1 == true then
		if not slot0.sevengoal_adventure_lev then
			slot0.sevengoal_adventure_lev = SevenGoalAdventureLevRewardWindow.New()
		end

		slot0.sevengoal_adventure_lev:open()
	elseif slot0.sevengoal_adventure_lev then
		slot0.sevengoal_adventure_lev:close()

		slot0.sevengoal_adventure_lev = nil
	end
end

function SevenGoalController.openSevenGoalTotleChargeView(slot0, slot1)
	if slot1 == true then
		if not slot0.sevengoal_adventure_charge then
			slot0.sevengoal_adventure_charge = SevenGoalTotleChargeWindow.New()
		end

		slot0.sevengoal_adventure_charge:open()
	elseif slot0.sevengoal_adventure_charge then
		slot0.sevengoal_adventure_charge:close()

		slot0.sevengoal_adventure_charge = nil
	end
end

function SevenGoalController.openSevenGoalSecretView(slot0, slot1)
	if slot1 == true then
		if not slot0.sevengoal_secret_view then
			slot0.sevengoal_secret_view = SevenGoalSecretWindow.New()
		end

		slot0.sevengoal_secret_view:open()
	elseif slot0.sevengoal_secret_view then
		slot0.sevengoal_secret_view:close()

		slot0.sevengoal_secret_view = nil
	end
end

function SevenGoalController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
