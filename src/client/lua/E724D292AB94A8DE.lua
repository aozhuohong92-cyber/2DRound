BattleResultMgr = BattleResultMgr or BaseClass(BaseController)

function BattleResultMgr.config(slot0)
	slot0.dic_show_data = {}
	slot0.order_list = {
		BattleConst.Closed_Result_Type.LevelUpgradeType,
		BattleConst.Closed_Result_Type.TaskExpType,
		BattleConst.Closed_Result_Type.LimitGiftType
	}
end

function BattleResultMgr.registerEvents(slot0)
	if slot0.battle_exit_event == nil then
		slot0.battle_exit_event = GlobalEvent:getInstance():Bind(BattleEvent.CLOSE_RESULT_VIEW, function (slot0)
			if uv0.is_wait_show then
				uv0:showNextPanel()
			end
		end)
	end

	if slot0.battle_next_event == nil then
		slot0.battle_next_event = GlobalEvent:getInstance():Bind(BattleEvent.NEXT_SHOW_RESULT_VIEW, function (slot0)
			if uv0.is_wait_show then
				uv0:showNextPanel()
			end
		end)
	end
end

function BattleResultMgr.isWaitShow(slot0)
	return slot0.is_wait_show or false
end

function BattleResultMgr.setWaitShowPanel(slot0, slot1)
	slot0.is_wait_show = slot1
end

function BattleResultMgr.showNextPanel(slot0)
	if slot0.dic_show_data and next(slot0.dic_show_data) ~= nil then
		for slot4, slot5 in ipairs(slot0.order_list) do
			if slot0.dic_show_data[slot5] ~= nil and next(slot0.dic_show_data[slot5]) ~= nil then
				slot0:openViewByType(slot5, table.remove(slot0.dic_show_data[slot5], 1))

				if #slot0.dic_show_data[slot5] == 0 then
					slot0.dic_show_data[slot5] = nil
				end

				slot0.cur_show_type = slot5

				break
			end
		end
	else
		if not slot0.cur_show_type or slot0.cur_show_type ~= BattleConst.Closed_Result_Type.LimitGiftType then
			GlobalEvent:getInstance():Fire(StoryEvent.PREPARE_PLAY_PLOT)
		end

		slot0.is_wait_show = false
		slot0.cur_show_type = nil
	end
end

function BattleResultMgr.addShowData(slot0, slot1, slot2)
	if slot0.dic_show_data == nil then
		slot0.dic_show_data = {}
	end

	if slot0.dic_show_data[slot1] == nil then
		slot0.dic_show_data[slot1] = {}
	end

	if slot1 == BattleConst.Closed_Result_Type.LimitGiftType and #slot0.dic_show_data[slot1] > 0 then
		return
	end

	table.insert(slot0.dic_show_data[slot1], slot2)

	if not slot0.is_wait_show then
		slot0.is_wait_show = true

		slot0:showNextPanel()
	end
end

function BattleResultMgr.openViewByType(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if slot1 == BattleConst.Closed_Result_Type.LevelUpgradeType then
		LevupgradeController:getInstance():openMainWindow(true, slot2)
	elseif slot1 == BattleConst.Closed_Result_Type.TaskExpType then
		RoleController:getInstance():openRoleAchieveWindow(true, slot2)
	elseif slot1 == BattleConst.Closed_Result_Type.LimitGiftType then
		ActionController:getInstance():checkOpenActionLimitGiftMainWindow(slot2.id)
	end
end
