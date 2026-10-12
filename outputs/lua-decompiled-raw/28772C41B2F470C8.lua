BattleDramaModel = BattleDramaModel or BaseClass()

function BattleDramaModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()

	slot0.drama_data = {}
	slot0.quick_battle_data = {}
	slot0.mode_list = {}
	slot0.cur_dun_list = {}
	slot0.init_dungeon_list = {}
	slot0.has_open_num = 0
	slot0.root_wnd_pos = nil
	slot0.is_open_quick_battle_view = false
	slot0.buff_data = {}
	slot0.last_dun_id = 0
	slot0.auto_combat = nil
	slot0.dic_drama_rewrad_ids = {}
	slot0.hook_accumulate_data = {}
	slot0.hook_max_time = 120
end

function BattleDramaModel.setOpenQuickBattleStatus(slot0, slot1)
	slot0.is_open_quick_battle_view = slot1
end

function BattleDramaModel.getOpenQuickBattleStatus(slot0)
	return slot0.is_open_quick_battle_view
end

function BattleDramaModel.setBuffData(slot0, slot1)
	slot0.buff_data = slot1

	GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Drama_Buff_View, slot1)
end

function BattleDramaModel.getBuffData(slot0)
	if slot0.buff_data then
		return slot0.buff_data
	end
end

function BattleDramaModel.setDramaData(slot0, slot1)
	if slot1 then
		slot2 = false

		if slot0.drama_data and slot0.drama_data.max_dun_id ~= slot1.max_dun_id then
			slot2 = true
		end

		if slot0.drama_data.max_dun_id == nil or slot0.drama_data.max_dun_id < slot1.max_dun_id then
			slot0.last_dun_id = slot0.drama_data.max_dun_id or slot1.max_dun_id
		end

		slot0.drama_data = {
			mode = slot1.mode,
			chapter_id = slot1.chapter_id,
			dun_id = slot1.dun_id,
			status = slot1.status,
			cool_time = slot1.cool_time,
			max_dun_id = slot1.max_dun_id,
			auto_num = slot1.auto_num,
			auto_num_max = slot1.auto_num_max,
			last_dun_id = slot0.last_dun_id,
			is_first = slot1.is_first
		}

		if slot1.mode_list then
			slot0.mode_list = slot1.mode_list
		end

		if slot2 == true then
			GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Update_Max_Id, slot1.max_dun_id)
		end

		GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Top_Update_Data, slot1)
	end
end

function BattleDramaModel.updateDramaData(slot0, slot1)
	if slot1 and slot0.drama_data then
		slot2 = false

		if slot0.drama_data and slot0.drama_data.max_dun_id ~= slot1.max_dun_id then
			slot2 = true
		end

		if slot0.drama_data.max_dun_id == nil or slot0.drama_data.max_dun_id < slot1.max_dun_id then
			slot0.last_dun_id = slot0.drama_data.max_dun_id or slot1.max_dun_id
		end

		if slot0.drama_data and slot0.drama_data.dun_id ~= slot1.dun_id then
			GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Update_Dun_Id, slot1.dun_id)
		end

		slot0.drama_data.mode = slot1.mode
		slot0.drama_data.chapter_id = slot1.chapter_id
		slot0.drama_data.dun_id = slot1.dun_id
		slot0.drama_data.status = slot1.status
		slot0.drama_data.cool_time = slot1.cool_time
		slot0.drama_data.max_dun_id = slot1.max_dun_id
		slot0.drama_data.last_dun_id = slot0.last_dun_id
		slot0.drama_data.is_first = slot1.is_first

		slot0:updateModeListInfo(slot1)

		if slot0.cur_dun_list and next(slot0.cur_dun_list or {}) ~= nil and slot0.cur_dun_list[slot1.dun_id] then
			slot0.cur_dun_list[slot1.dun_id].status = slot1.status

			if slot0.cur_dun_list[slot1.dun_id].status == 3 then
				slot0.cur_dun_list[slot1.dun_id].is_has = true
			end

			GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Update_Data, slot1)
		end

		if slot2 then
			GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Update_Max_Id, slot1.max_dun_id)
		end
	end
end

function BattleDramaModel.getDramaData(slot0)
	if slot0.drama_data and next(slot0.drama_data or {}) ~= nil then
		return slot0.drama_data
	end
end

function BattleDramaModel.initDungeonList(slot0, slot1, slot2)
	if Config.DungeonData.data_drama_info then
		if Config.DungeonData.data_drama_info[slot1][slot2] then
			slot4 = {}

			for slot9, slot10 in pairs(slot3) do
				table.insert(slot4, slot10)
			end

			function slot9(slot0, slot1)
				return slot0.id < slot1.id
			end

			table.sort(slot4, slot9)

			for slot9, slot10 in ipairs(slot4) do
				slot0.init_dungeon_list[slot9] = {
					info_data = Config.DungeonData.data_drama_dungeon_info(slot10.id)
				}
				slot0.cur_dun_list[slot10.id] = {
					auto_num = 0,
					is_has = false,
					status = 0,
					cool_time = 0,
					dun_id = slot10.id
				}
			end
		end

		slot0:updateHadModeListInfo(slot1, slot2)
	end
end

function BattleDramaModel.getChapterLength(slot0, slot1, slot2)
	if slot0.chapter_list == nil then
		slot0.chapter_list = {}
	end

	if slot0.chapter_list[getNorKey(slot1, slot2)] == nil then
		slot3 = 0

		if Config.DungeonData.data_drama_info[slot1] ~= nil and Config.DungeonData.data_drama_info[slot1][slot2] ~= nil then
			slot3 = tableLen(slot4)
		end

		slot0.chapter_list[getNorKey(slot1, slot2)] = slot3
	end

	return slot0.chapter_list[getNorKey(slot1, slot2)]
end

function BattleDramaModel.getInitDungeonList(slot0)
	if slot0.init_dungeon_list and next(slot0.init_dungeon_list or {}) ~= nil then
		return slot0.init_dungeon_list
	end
end

function BattleDramaModel.updateHadModeListInfo(slot0, slot1, slot2)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil and slot0:getChapterListByID(slot1, slot2) and slot3.dun_list then
		for slot8, slot9 in ipairs(slot4) do
			if slot0.cur_dun_list[slot9.dun_id] then
				slot10.dun_id = slot9.dun_id
				slot10.status = slot9.status
				slot10.cool_time = slot9.cool_time
				slot10.auto_num = slot9.auto_num
				slot10.is_has = true
			end
		end
	end
end

function BattleDramaModel.getSingleBossData(slot0, slot1)
	slot2.v_data = slot0:getCurDungeonDunData(slot1) or {
		auto_num = 0,
		is_has = false,
		status = 0,
		cool_time = 0,
		dun_id = ({
			info_data = Config.DungeonData.data_drama_dungeon_info(slot1)
		}).id
	}

	return slot2
end

function BattleDramaModel.getChapterListByID(slot0, slot1, slot2)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot4 = nil

		if slot0.mode_list[slot1].chapter_list then
			for slot8, slot9 in ipairs(slot3) do
				if slot9.chapter_id == slot2 then
					slot4 = slot9

					break
				end
			end

			return slot4
		end
	end
end

function BattleDramaModel.updateModeListInfo(slot0, slot1)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil and slot0:getChapterListByID(slot1.mode, slot1.chapter_id) and slot2.dun_list then
		slot4 = true

		if slot1.status == 1 then
			slot4 = false
		end

		slot5 = false

		for slot9, slot10 in ipairs(slot3) do
			if slot1.dun_id == slot10.dun_id then
				slot5 = true
				slot10.dun_id = slot1.dun_id
				slot10.cool_time = slot1.cool_time
				slot10.status = slot1.status
				slot10.is_has = slot4
			end
		end

		if not slot5 then
			table.insert(slot3, {
				auto_num = 0,
				dun_id = slot1.dun_id,
				status = slot1.status,
				cool_time = slot1.cool_time,
				is_has = slot4
			})
		end
	end
end

function BattleDramaModel.getCurDunInfoByID(slot0, slot1)
	if slot0.cur_dun_list then
		return slot0.cur_dun_list[slot1]
	end
end

function BattleDramaModel.updateCurDunListInfo(slot0, slot1)
	if slot0.cur_dun_list and slot1 then
		if slot0.cur_dun_list[slot1.dun_id] then
			slot2.auto_num = slot2.auto_num + slot1.num
		end

		slot0:updateSingleCurInfo(slot1)
		GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Boss_Update_Data, slot2)
	end
end

function BattleDramaModel.updateSingleCurInfo(slot0, slot1)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot6 = slot0.drama_data.chapter_id
		slot2 = slot0:getChapterListByID(slot0.drama_data.mode, slot6)

		for slot6, slot7 in ipairs(slot0.mode_list) do
			for slot11, slot12 in ipairs(slot7.chapter_list) do
				for slot16, slot17 in ipairs(slot12.dun_list) do
					if slot17.dun_id == slot1.dun_id then
						slot17.dun_id = slot1.dun_id
						slot17.auto_num = slot17.auto_num + slot1.num
					end
				end
			end
		end
	end
end

function BattleDramaModel.getModeListByMode(slot0, slot1)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		if slot0.mode_list[slot1] then
			return slot2
		else
			return nil
		end
	end
end

function BattleDramaModel.getHasCurChapterPassListNum(slot0, slot1, slot2)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot4 = 0

		if slot0:getChapterListByID(slot1, slot2) and slot3.dun_list then
			for slot9, slot10 in ipairs(slot5) do
				if slot10.status == 3 then
					slot4 = slot4 + 1
				end
			end
		end

		return slot4
	end
end

function BattleDramaModel.getHasCurChapterPassListBossNum(slot0, slot1, slot2)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot4 = 1

		if slot0:getChapterListByID(slot1, slot2) and slot3.dun_list then
			for slot9, slot10 in ipairs(slot5) do
				slot11 = Config.DungeonData.data_drama_dungeon_info(slot10.dun_id)

				if slot10.status == 3 and slot11 and slot11.is_big == TRUE then
					slot4 = slot4 + 1
				end
			end
		end

		return slot4
	end
end

function BattleDramaModel.getHasPassChapterPassList(slot0, slot1)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot3 = 0

		if slot0.mode_list[slot1].chapter_list then
			for slot7, slot8 in ipairs(slot2) do
				if slot8.status == 1 then
					slot3 = slot3 + 1
				end
			end
		end

		return slot3
	end
end

function BattleDramaModel.getCurMaxChapterId(slot0, slot1)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot3 = 1

		if slot0.mode_list[slot1].chapter_list then
			for slot7, slot8 in ipairs(slot2) do
				if slot8.status == 1 and slot3 <= slot8.chapter_id then
					slot3 = slot8.chapter_id
				end
			end
		end

		return slot3
	end
end

function BattleDramaModel.getOpenSumChapter(slot0, slot1)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot3 = 0

		if slot0.mode_list[slot1].chapter_list then
			for slot7, slot8 in ipairs(slot2) do
				slot3 = slot3 + 1
			end
		end

		return slot3
	end
end

function BattleDramaModel.getHasPassChapterMaxDunId(slot0, slot1, slot2)
	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		slot4 = 0

		if slot0:getChapterListByID(slot1, slot2) then
			for slot9, slot10 in ipairs(slot3.dun_list) do
				if slot4 < slot10.dun_id then
					slot4 = slot10.dun_id
				end
			end
		end

		return slot4
	end
end

function BattleDramaModel.setQuickData(slot0, slot1)
	slot0.quick_battle_data = slot1

	if slot0.drama_data then
		slot0.drama_data.auto_num = slot1.auto_num
		slot0.drama_data.auto_num_max = slot1.auto_num_max
		slot0.drama_data.is_auto_combat = slot1.is_auto_combat
	end

	slot0:checkRedPoint()
	GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Quick_Battle_Data, slot1)
end

function BattleDramaModel.checkRedPoint(slot0)
	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.drama_scene, slot0:getDramaRewardRedPointInfo())
end

function BattleDramaModel.getQuickData(slot0)
	if slot0.quick_battle_data and next(slot0.quick_battle_data or {}) ~= nil then
		return slot0.quick_battle_data
	end
end

function BattleDramaModel.getRootWndPos(slot0)
	return slot0.root_wnd_pos
end

function BattleDramaModel.setRootWndPos(slot0, slot1)
	slot0.root_wnd_pos = slot1
end

function BattleDramaModel.setDramaReward(slot0, slot1)
	slot0.drama_reward = slot1
	slot0.dic_drama_rewrad_ids = {}

	for slot5, slot6 in ipairs(slot1.list) do
		slot0.dic_drama_rewrad_ids[slot6.id] = true
	end

	slot0:checkRedPoint()
	GlobalEvent:getInstance():Fire(Battle_dramaEvent.BattleDrama_Drama_Reward_Data, slot1)
end

function BattleDramaModel.getDramaRewardRedPointInfo(slot0)
	slot1 = slot0:getDramaData()

	if slot0.dic_drama_rewrad_ids and slot1 and slot1.max_dun_id and Config.DungeonData.data_drama_reward then
		for slot6, slot7 in ipairs(slot2) do
			if slot7.limit_id <= slot1.max_dun_id and not slot0.dic_drama_rewrad_ids[slot7.id] then
				return true
			end
		end
	end

	return false
end

function BattleDramaModel.getDicDramaRewardID(slot0)
	if slot0.dic_drama_rewrad_ids then
		return slot0.dic_drama_rewrad_ids
	end
end

function BattleDramaModel.getNewDramaRewardID(slot0)
	if Config.DungeonData.data_drama_reward then
		for slot5, slot6 in ipairs(slot1) do
			if not slot0.dic_drama_rewrad_ids[slot6.id] then
				return slot6
			end
		end
	end

	return nil
end

function BattleDramaModel.getOffsetNum(slot0, slot1)
	if Config.DungeonData.data_drama_dungeon_info(slot1) then
		slot2 = 0
		slot3 = 0
		slot5 = Config.DungeonData.data_drama_dungeon_info(slot1).mode

		if slot0.drama_data and Config.DungeonData.data_drama_info[slot5] and Config.DungeonData.data_drama_info[slot5] and slot6[Config.DungeonData.data_drama_dungeon_info(slot1).chapter_id] then
			for slot10, slot11 in pairs(slot6) do
				if slot10 <= slot4 then
					for slot15, slot16 in pairs(slot11) do
						if slot16.id <= slot1 then
							slot3 = slot3 + 1
						end
					end
				end
			end
		end

		return slot3
	end
end

function BattleDramaModel.getCurDungeonMaxNum(slot0)
	slot1 = 0

	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		for slot5, slot6 in ipairs(slot0.mode_list) do
			for slot10, slot11 in ipairs(slot6.chapter_list) do
				for slot15, slot16 in ipairs(slot11.dun_list) do
					if slot16.status == 3 then
						slot1 = slot1 + 1
					end
				end
			end
		end
	end

	return slot1
end

function BattleDramaModel.getCurDungeonDunData(slot0, slot1)
	slot2 = nil

	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		for slot6, slot7 in ipairs(slot0.mode_list) do
			for slot11, slot12 in ipairs(slot7.chapter_list) do
				for slot16, slot17 in ipairs(slot12.dun_list) do
					if slot17.dun_id == slot1 then
						slot2 = slot17

						break
					end
				end
			end
		end

		return slot2
	end
end

function BattleDramaModel.getMaxDungeonDunData(slot0, slot1)
	slot2 = nil
	slot3 = 0

	if slot0.mode_list and next(slot0.mode_list or {}) ~= nil then
		for slot7, slot8 in ipairs(slot0.mode_list) do
			for slot12, slot13 in ipairs(slot8.chapter_list) do
				for slot17, slot18 in ipairs(slot13.dun_list) do
					slot19 = Config.DungeonData.data_drama_dungeon_info(slot18.dun_id)

					if slot3 <= slot18.dun_id and slot18.dun_id <= slot1 and slot19 and slot19.is_big == TRUE then
						slot2 = slot18
						slot3 = slot18.dun_id
					end
				end
			end
		end

		return slot2
	end
end

function BattleDramaModel.getIsNewChapter(slot0)
	if slot0.drama_data then
		slot1 = false
		slot2 = 1
		slot3 = false

		if Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.max_dun_id) then
			slot2 = Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.max_dun_id).chapter_id

			if Config.DungeonData.data_drama_dungeon_info(slot0.drama_data.max_dun_id).next_id == 0 then
				slot3 = true
			end

			if slot2 ~= slot0.drama_data.chapter_id then
				slot1 = true
			end
		end

		return {
			is_open_new_chapter = slot1,
			cur_chapter = slot2,
			is_last_chapter = slot3
		}
	end
end

function BattleDramaModel.getShowDescRewad(slot0, slot1)
	slot2 = {}
	slot3 = 1

	if Config.DungeonData.data_drama_show_reward then
		for slot7, slot8 in ipairs(Config.DungeonData.data_drama_show_reward) do
			if slot1 < slot8.id and slot3 <= 3 then
				slot3 = slot3 + 1

				table.insert(slot2, slot8)
			end
		end

		table.sort(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		return slot2
	end
end

function BattleDramaModel.getMaxEnergyMax(slot0)
	return RoleController:getInstance():getRoleVo().energy_max or 0
end

function BattleDramaModel.getBossShowData(slot0)
	slot1 = {}
	slot2 = slot0:getOpenSumChapter(slot0.drama_data.mode)

	if Config.DungeonData.data_drama_world_info then
		for slot8, slot9 in ipairs(Config.DungeonData.data_drama_world_info[slot0.drama_data.mode]) do
			if Config.DungeonData.data_drama_boss_show_reward[slot8] and slot9.chapter_id <= slot2 + 1 then
				table.insert(slot1, slot9)
			end
		end

		return slot1
	end
end

function BattleDramaModel.config(slot0)
	slot0.chapter_rewards_dict = {}
	slot0.chapter_rewards_list = {}
end

function BattleDramaModel.__delete(slot0)
end

function BattleDramaModel.setPartnerUpgradeRedStatus(slot0, slot1)
end

function BattleDramaModel.checkPartnerRedStatus(slot0)
	if slot0.partner_red_status_list == nil then
		return false
	end

	for slot4, slot5 in pairs(slot0.partner_red_status_list) do
		if slot5.status == true then
			return true
		end
	end

	return false
end

function BattleDramaModel.updateHookAccumulateTime(slot0, slot1)
	slot0.hook_accumulate_data = slot1

	GlobalEvent:getInstance():Fire(Battle_dramaEvent.UpdateHookAccumulateTime, slot0.hook_accumulate_data)
end

function BattleDramaModel.getHookAccumulateInfo(slot0)
	return slot0.hook_accumulate_data
end

function BattleDramaModel.calcHookItems(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = nil

	for slot7, slot8 in pairs(slot1.hook_lev_add or {}) do
		if slot8[1] <= (RoleController:getInstance():getRoleVo().lev or 0) then
			slot3 = slot8[2]

			break
		end
	end

	if slot3 then
		slot4 = {
			[slot9[1]] = slot9[2]
		}

		for slot8, slot9 in pairs(slot3) do
			-- Nothing
		end

		for slot8, slot9 in pairs(slot1.per_hook_items) do
			slot4[slot9[1]] = slot9[2] + (slot4[slot9[1]] or 0)
		end

		slot3 = {}

		for slot8, slot9 in pairs(slot4) do
			table.insert(slot3, {
				slot8,
				slot9
			})
		end

		return slot3
	else
		return slot1.per_hook_items
	end
end
