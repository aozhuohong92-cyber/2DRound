TipsController = TipsController or BaseClass(BaseController)

function TipsController.config(slot0)
	slot0.model = TipsModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function TipsController.getModel(slot0)
	return slot0.model
end

function TipsController.registerEvents(slot0)
end

function TipsController.registerProtocals(slot0)
end

function TipsController.openSourceByIndex(slot0, slot1)
	if (slot1 or 1) == 1 then
		-- Nothing
	elseif slot1 >= 4 and slot1 <= 9 then
		MainuiController:getInstance():openDungeonWithBid(MainuiModel.DUN_ENTER_BIND_ID.Meterial)
	end
end

function TipsController.clickSourceBtn(slot0, slot1)
	slot2 = nil

	if (type(slot1) ~= "number" or Config.SourceData.data_source_data[slot1]) and slot1 and slot2.evt_type and slot2.extend then
		BackpackController:getInstance():gotoItemSources(slot2.evt_type, slot2.extend)
	end
end

function TipsController.openTaskExpTips(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.task_exp_tips ~= nil then
			slot0.task_exp_tips:close()

			slot0.task_exp_tips = nil
		end
	else
		if slot0.task_exp_tips == nil then
			slot0.task_exp_tips = TaskExpTips.New()
		end

		if slot0.task_exp_tips:isOpen() == false then
			slot0.task_exp_tips:open(slot2)
		end
	end
end

function TipsController.openHonorIconTips(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.honor_icon_tips ~= nil then
			slot0.honor_icon_tips:close()

			slot0.honor_icon_tips = nil
		end
	else
		if slot0.honor_icon_tips == nil then
			slot0.honor_icon_tips = HonorIconTips.New()
		end

		if slot0.honor_icon_tips:isOpen() == false then
			slot0.honor_icon_tips:open(slot2)
		end
	end
end

function TipsController.openHonorLevelTips(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.honor_level_tips ~= nil then
			slot0.honor_level_tips:close()

			slot0.honor_level_tips = nil
		end
	else
		if slot0.honor_level_tips == nil then
			slot0.honor_level_tips = HonorLevelTips.New()
		end

		if slot0.honor_level_tips:isOpen() == false then
			slot0.honor_level_tips:open(slot2)
		end
	end
end

function TipsController.openHonorNextLevelTips(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.honor_next_level_tips ~= nil then
			slot0.honor_next_level_tips:close()

			slot0.honor_next_level_tips = nil
		end
	else
		if slot0.honor_next_level_tips == nil then
			slot0.honor_next_level_tips = HonorNextLevelTips.New()
		end

		if slot0.honor_next_level_tips:isOpen() == false then
			slot0.honor_next_level_tips:open(slot2)
		end
	end
end

function TipsController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
