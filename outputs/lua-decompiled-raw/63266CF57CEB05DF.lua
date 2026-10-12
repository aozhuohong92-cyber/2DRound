AnimateActionController = AnimateActionController or BaseClass(BaseController)

function AnimateActionController.config(slot0)
	slot0.model = AnimateActionModel.New(slot0)
end

function AnimateActionController.getModel(slot0)
	return slot0.model
end

function AnimateActionController.registerEvents(slot0)
end

function AnimateActionController.registerProtocals(slot0)
	slot0:RegisterProtocal(24801, "handle24801")
	slot0:RegisterProtocal(24802, "handle24802")
	slot0:RegisterProtocal(24803, "handle24803")
	slot0:RegisterProtocal(24804, "handle24804")
	slot0:RegisterProtocal(24805, "handle24805")
	slot0:RegisterProtocal(24806, "handle24806")
	slot0:RegisterProtocal(24807, "handle24807")
	slot0:RegisterProtocal(24808, "handle24808")
	slot0:RegisterProtocal(24809, "handle24809")
end

function AnimateActionController.sender24801(slot0)
	slot0:SendProtocal(24801, {})
end

function AnimateActionController.handle24801(slot0, slot1)
	GlobalEvent:getInstance():Fire(AnimateActionEvent.YuanZhenFestval_Linght, slot1)
end

function AnimateActionController.sender24802(slot0, slot1)
	slot0:SendProtocal(24802, {
		id = slot1
	})
end

function AnimateActionController.handle24802(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(AnimateActionEvent.YuanZhenFestval_Lottery, slot1)
	end
end

function AnimateActionController.sender24803(slot0, slot1)
	slot0:SendProtocal(24803, {
		id = slot1
	})
end

function AnimateActionController.handle24803(slot0, slot1)
	message(slot1.msg)
end

function AnimateActionController.openAnimateFestvalWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot0.animate_festval_window then
			slot0.animate_festval_window = AnimateActionFestvalWindow.New(slot2, slot3)
		end

		slot0.animate_festval_window:open()
	elseif slot0.animate_festval_window then
		slot0.animate_festval_window:close()

		slot0.animate_festval_window = nil
	end
end

function AnimateActionController.sender24804(slot0)
	slot0:SendProtocal(24804, {})
end

function AnimateActionController.handle24804(slot0, slot1)
	slot0.model:setHolidayID(slot1.camp_id)
	slot0.model:setRemainChallageNum(slot1.combat_num)
	slot0.model:setKitchenRemainData(slot1.make_list)
	GlobalEvent:getInstance():Fire(AnimateActionEvent.YuanZhenFestval_Kitchen, slot1)
end

function AnimateActionController.sender24806(slot0, slot1)
	slot0:SendProtocal(24806, {
		id = slot1
	})
end

function AnimateActionController.handle24806(slot0, slot1)
	message(slot1.msg)
end

function AnimateActionController.sender24805(slot0)
	slot0:SendProtocal(24805, {})
end

function AnimateActionController.handle24805(slot0, slot1)
	slot0.model:setKitchenLevData(slot1.reward_list)
	GlobalEvent:getInstance():Fire(AnimateActionEvent.YuanZhenFestval_Kitchen_Lev, slot1)
end

function AnimateActionController.sender24807(slot0, slot1)
	slot0:SendProtocal(24807, {
		id = slot1
	})
end

function AnimateActionController.handle24807(slot0, slot1)
	message(slot1.msg)
end

function AnimateActionController.openAnimateYuanzhenGotoKitchenWindow(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 then
		if not slot0.animate_kitchen_window then
			slot0.animate_kitchen_window = AnimateYuanzhenGotoKitchenWindow.New(slot2, slot3, slot4, slot5)
		end

		slot0.animate_kitchen_window:open()
	elseif slot0.animate_kitchen_window then
		slot0.animate_kitchen_window:close()

		slot0.animate_kitchen_window = nil
	end
end

function AnimateActionController.openAnimateYuanzhenKitchenLevWindow(slot0, slot1, slot2)
	if slot1 then
		if not slot0.animate_kitchen_lev_window then
			slot0.animate_kitchen_lev_window = AnimateYuanzhenKitchenLevWindow.New(slot2)
		end

		slot0.animate_kitchen_lev_window:open()
	elseif slot0.animate_kitchen_lev_window then
		slot0.animate_kitchen_lev_window:close()

		slot0.animate_kitchen_lev_window = nil
	end
end

function AnimateActionController.sender24808(slot0)
	slot0:SendProtocal(24808, {})
end

function AnimateActionController.handle24808(slot0, slot1)
	message(slot1.msg)
end

function AnimateActionController.sender24809(slot0)
	slot0:SendProtocal(24809, {})
end

function AnimateActionController.handle24809(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(AnimateActionEvent.YuanZhenFestval_Buy_Challage, slot1)
	end
end

function AnimateActionController.openAnimateYuanzhenCollectWindow(slot0, slot1)
	if slot1 then
		if not slot0.animate_collect_window then
			slot0.animate_collect_window = AnimateYuanzhenCollectWindow.New()
		end

		slot0.animate_collect_window:open()
	elseif slot0.animate_collect_window then
		slot0.animate_collect_window:close()

		slot0.animate_collect_window = nil
	end
end

function AnimateActionController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
