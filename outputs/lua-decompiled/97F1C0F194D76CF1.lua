MonopolyModel = MonopolyModel or BaseClass()

function MonopolyModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function MonopolyModel.config(slot0)
	slot0.monopoly_is_open = false
	slot0.customs_data = {}
	slot0.monopoly_map_data = {}
	slot0.cur_map_id = 0
	slot0.buff_data = {}
	slot0.home_look_id = 0
	slot0.wait_show_tips_data = {}
	slot0.wait_show_award_data = {}
end

function MonopolyModel.setMonopolyBaseInfo(slot0, slot1)
	if slot1.flag and slot1.flag == 1 then
		slot0.monopoly_is_open = true
	else
		slot0.monopoly_is_open = false
	end

	slot0.end_time = slot1.end_time or 0
	slot0.customs_data = slot1.stage or {}
end

function MonopolyModel.getMonopolyEndTime(slot0)
	return slot0.end_time or 0
end

function MonopolyModel.getMonopolyBaseInfo(slot0)
	return slot0.customs_data
end

function MonopolyModel.getCustomsIsOpenById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.customs_data) do
		if slot7.id == slot1 then
			slot2 = slot7.lock ~= 1

			break
		end
	end

	return slot2
end

function MonopolyModel.setHomeLookId(slot0, slot1)
	slot0.home_look_id = slot1
end

function MonopolyModel.getHomeLookId(slot0)
	return slot0.home_look_id
end

function MonopolyModel.getDevelopValById(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.customs_data) do
		if slot7.id == slot1 then
			slot2 = slot7.develop or 0

			break
		end
	end

	return slot2
end

function MonopolyModel.updateDevelopValById(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.customs_data) do
		if slot7.id == slot1 then
			slot7.develop = slot2

			break
		end
	end

	GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Dev_Val_Event, slot1)
end

function MonopolyModel.getGuildDevelopValById(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.customs_data) do
		if slot7.id == slot1 then
			slot2 = slot7.guild_develop or 0

			break
		end
	end

	return slot2
end

function MonopolyModel.updateGuildDevelopValById(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.customs_data) do
		if slot7.id == slot1 then
			slot7.guild_develop = slot2

			break
		end
	end

	GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Guild_Dev_Val_Event, slot1)
end

function MonopolyModel.checkMonopolyIsOpen(slot0)
	return slot0.monopoly_is_open
end

function MonopolyModel.updateMonopolyMapData(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.monopoly_map_data) do
		if slot7.id == slot1.id then
			for slot11, slot12 in pairs(slot1) do
				slot7[slot11] = slot12
			end

			slot2 = true

			break
		end
	end

	if not slot2 then
		table.insert(slot0.monopoly_map_data, slot1)
	end
end

function MonopolyModel.clearMonopolyNowEvtType(slot0, slot1)
	for slot5, slot6 in pairs(slot0.monopoly_map_data) do
		if slot6.id == slot1 then
			slot6.now_type = 0

			break
		end
	end

	GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Now_Evt_Type_Event, slot1)
end

function MonopolyModel.updateMonopolyEventType(slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot0.monopoly_map_data) do
		if slot8.id == slot1 then
			for slot12, slot13 in pairs(slot8.events) do
				if slot13.pos == slot2 then
					slot13.type = slot3

					break
				end
			end

			break
		end
	end

	GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Grid_Evt_Type_Event, slot1, slot2, slot3)
end

function MonopolyModel.getMonopolyMapDataById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.monopoly_map_data) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function MonopolyModel.setCurMonopolyMapId(slot0, slot1)
	slot0.cur_map_id = slot1
end

function MonopolyModel.checkIsInCurMap(slot0, slot1)
	if slot0.cur_map_id == slot1 then
		return true
	end

	return false
end

function MonopolyModel.updateMonopolyBuffData(slot0, slot1)
	slot0.buff_data = slot1 or {}
end

function MonopolyModel.getMonopolyBuffData(slot0)
	return slot0.buff_data
end

function MonopolyModel.updateMonopolyBossNum(slot0, slot1)
	slot0.boss_num_data = slot1
end

function MonopolyModel.getMonopolyBossNumData(slot0)
	return slot0.boss_num_data or {}
end

function MonopolyModel.checkMonopolyIsOpen(slot0, slot1)
	slot3 = Config.MonopolyMapsData.data_const.open_lv_limit
	slot4 = Config.MonopolyMapsData.data_const.open_day_limit

	if RoleController:getInstance():getRoleVo() and slot3 and slot4 then
		if slot2.lev < slot3.val then
			if not slot1 then
				message(slot3.desc)
			end

			return false
		end

		if slot2.open_day < slot4.val then
			if not slot1 then
				message(slot4.desc)
			end

			return false
		end

		return true
	end

	return false
end

function MonopolyModel.getRandomDialogByEvtAndStep(slot0, slot1, slot2)
	if slot1 == MonopolyConst.Event_Type.Dialog then
		if not slot0.dialog_cfg or next(slot0.dialog_cfg) == nil then
			slot0.dialog_cfg = {}

			for slot6, slot7 in pairs(Config.MonopolyMapsData.data_dialog[1] or {}) do
				if not slot0.dialog_cfg[slot7.step_id or 0] then
					slot0.dialog_cfg[slot7.step_id or 0] = {}
				end

				table.insert(slot0.dialog_cfg[slot7.step_id or 0], slot7)
			end
		end

		slot3 = slot0.dialog_cfg[slot2] or {}

		for slot7, slot8 in pairs(slot0.dialog_cfg[0] or {}) do
			table.insert(slot3, slot8)
		end

		return slot3[math.random(1, #slot3)]
	elseif slot1 == MonopolyConst.Event_Type.Flag then
		if not slot0.flag_cfg or next(slot0.flag_cfg) == nil then
			slot0.flag_cfg = {}

			for slot6, slot7 in pairs(Config.MonopolyMapsData.data_dialog[2] or {}) do
				if not slot0.flag_cfg[slot7.step_id or 0] then
					slot0.flag_cfg[slot7.step_id or 0] = {}
				end

				table.insert(slot0.flag_cfg[slot7.step_id or 0], slot7)
			end
		end

		slot3 = slot0.flag_cfg[slot2] or {}

		for slot7, slot8 in pairs(slot0.flag_cfg[0] or {}) do
			table.insert(slot3, slot8)
		end

		return slot3[math.random(1, #slot3)]
	end
end

function MonopolyModel.addWaitShowTipsData(slot0, slot1)
	slot0.wait_show_tips_data = slot1 or {}
end

function MonopolyModel.getWaitShowTipsData(slot0)
	return slot0.wait_show_tips_data
end

function MonopolyModel.clearWaitShowTipsData(slot0)
	slot0.wait_show_tips_data = {}
end

function MonopolyModel.addWaitShowAwardData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		table.insert(slot0.wait_show_award_data, slot6)
	end
end

function MonopolyModel.getWaitShowAwardData(slot0)
	return slot0.wait_show_award_data
end

function MonopolyModel.clearWaitShowAwardData(slot0)
	slot0.wait_show_award_data = {}
end

function MonopolyModel.__delete(slot0)
end
