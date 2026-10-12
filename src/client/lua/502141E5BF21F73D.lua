ActionyearmonsterModel = ActionyearmonsterModel or BaseClass()

function ActionyearmonsterModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ActionyearmonsterModel.config(slot0)
	slot0.cell_data = nil
	slot0.evt_vo_list = nil
	slot0.base_data = nil
	slot0.year_monster_list = {}
	slot0.is_holiday_open = false
end

function ActionyearmonsterModel.setPlanesRoleLookId(slot0, slot1)
	slot0.planes_look_id = slot1
end

function ActionyearmonsterModel.getPlanesRoleLookId(slot0)
	return slot0.planes_look_id
end

function ActionyearmonsterModel.isHolidayOpen(slot0)
	return slot0.is_holiday_open
end

function ActionyearmonsterModel.setHolidayOpen(slot0, slot1)
	if slot1 then
		slot0.is_holiday_open = slot1 == 1
	end
end

function ActionyearmonsterModel.getYearMonsterList(slot0)
	return slot0.year_monster_list
end

function ActionyearmonsterModel.setBaseData(slot0, slot1)
	slot0.base_data = slot1
end

function ActionyearmonsterModel.getBaseData(slot0, slot1)
	return slot0.base_data
end

function ActionyearmonsterModel.setCellData(slot0, slot1)
	slot0.cell_data = slot1
end

function ActionyearmonsterModel.getCellData(slot0)
	return slot0.cell_data
end

function ActionyearmonsterModel.getYearEvtVoList(slot0)
	return slot0.evt_vo_list
end

function ActionyearmonsterModel.getYearEvtVoByGridIndex(slot0, slot1)
	return slot0.evt_vo_list[slot1]
end

function ActionyearmonsterModel.checkIsNeedStopPreGrid(slot0, slot1)
	if slot0.evt_vo_list[slot1] and slot2.config and slot2.config.type ~= ActionyearmonsterConstants.Evt_Type.Start and slot2.config.id ~= 0 then
		return true
	end

	return false
end

function ActionyearmonsterModel.setYearEvtVoList(slot0, slot1)
	slot0.evt_vo_list = {}

	for slot5, slot6 in pairs(slot1) do
		if slot6.evtid > 0 then
			slot7 = ActionyearmonsterEvtVo.New()

			slot7:updateData(slot6)

			slot0.evt_vo_list[slot6.index] = slot7

			if slot7.config then
				if slot7.config.id == ActionyearmonsterConstants.evt_limit_monster_hit or slot7.config.id == ActionyearmonsterConstants.evt_limit_monster_not_hit then
					slot0.year_monster_list[1] = slot6
				elseif slot7.config.id == ActionyearmonsterConstants.evt_gold_monster_hit or slot7.config.id == ActionyearmonsterConstants.evt_gold_monster_not_hit then
					slot0.year_monster_list[2] = slot6
				end
			end
		end
	end
end

function ActionyearmonsterModel.updateYearEvtVoList(slot0, slot1)
	if not slot0.evt_vo_list then
		return
	end

	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if not slot0.evt_vo_list[slot7.index] then
			slot8 = ActionyearmonsterEvtVo.New()

			slot8:updateData(slot7)

			slot0.evt_vo_list[slot7.index] = slot8

			table.insert(slot2, slot8)
		else
			slot8:updateData(slot7)
		end
	end

	if next(slot2) ~= nil then
		GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.YEAR_Add_Evt_Data_Event, slot2)
	end
end

function ActionyearmonsterModel.checkIsHaveEvtByGridIndex(slot0, slot1)
	if slot0.evt_vo_list[slot1] then
		return true
	end

	return false
end

function ActionyearmonsterModel.checkEvtCanWalkByGridIndex(slot0, slot1, slot2)
	slot3 = true

	if slot0.evt_vo_list[slot1] then
		if slot2 and slot4.config and slot4.config.type ~= ActionyearmonsterConstants.Evt_Type.Barrier then
			slot3 = true
		elseif slot4.config and slot4.config.is_walk == 0 then
			slot3 = false
		end
	end

	return slot3
end

function ActionyearmonsterModel.checkYearmonsterCentreGrid(slot0, slot1)
	if slot0.evt_vo_list[slot1] and slot2.config and (slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_not_hit or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_hit or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_not_hit or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_hit) then
		return true
	end

	return false
end

function ActionyearmonsterModel.checkYearmonsterGrid(slot0, slot1)
	if slot0.evt_vo_list[slot1] and slot2.config and (slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_not_hit or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_hit or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_not_hit or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_hit or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_not_hit_2 or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_hit_2 or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_not_hit_2 or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_hit_2) then
		return true
	end

	return false
end

function ActionyearmonsterModel.checkLimitYearmonsterGrid(slot0, slot1)
	if slot0.evt_vo_list[slot1] and slot2.config and (slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_not_hit or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_hit or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_not_hit_2 or slot2.config.id == ActionyearmonsterConstants.evt_limit_monster_hit_2) then
		return true
	end

	return false
end

function ActionyearmonsterModel.checkGoldYearmonsterGrid(slot0, slot1)
	if slot0.evt_vo_list[slot1] and slot2.config and (slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_not_hit or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_hit or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_not_hit_2 or slot2.config.id == ActionyearmonsterConstants.evt_gold_monster_hit_2) then
		return true
	end

	return false
end

function ActionyearmonsterModel.setYearBagData(slot0, slot1)
	slot0.year_bag_data = {}

	for slot5, slot6 in ipairs(slot1 or {}) do
		slot0.year_bag_data[slot6.id] = slot6
	end

	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Iint_Bag_Data_Event)
end

function ActionyearmonsterModel.getYearBagData(slot0)
	return slot0.year_bag_data
end

function ActionyearmonsterModel.updateYearBagData(slot0, slot1)
	if not slot0.year_bag_data then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		if slot0.year_bag_data[slot7.id] then
			slot0.year_bag_data[slot7.id].num = slot7.num
		else
			slot0.year_bag_data[slot7.id] = slot7
			slot2 = true
		end
	end

	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Update_Bag_Data_Event, slot1, slot2)
end

function ActionyearmonsterModel.getYearBagDataByBaseID(slot0, slot1)
	if not slot0.year_bag_data then
		return
	end

	for slot5, slot6 in pairs(slot0.year_bag_data) do
		if slot6.base_id == slot1 then
			return slot6
		end
	end
end

function ActionyearmonsterModel.deleteYearBagData(slot0, slot1)
	if not slot0.year_bag_data then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		slot0.year_bag_data[slot6.id] = nil
	end

	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Delete_Bag_Data_Event, slot1)
end

function ActionyearmonsterModel.setExchangeData(slot0, slot1)
	if slot0.exchange_data == nil then
		slot0.exchange_data = {}
	end

	if slot1 and slot1.collection then
		for slot5, slot6 in pairs(slot1.collection) do
			slot0.exchange_data[slot6.id] = slot6
		end
	end
end

function ActionyearmonsterModel.getExchangeDataById(slot0, slot1)
	if slot0.exchange_data then
		return slot0.exchange_data[slot1]
	end

	return nil
end

function ActionyearmonsterModel.getHarmRewardInfo(slot0, slot1, slot2)
	slot1 = slot1 or 0

	if Config.HolidayNianData.data_harm_reward[slot2] and next(slot3) ~= nil then
		table.sort(slot3, function (slot0, slot1)
			return slot0.dps_low < slot1.dps_low
		end)

		for slot9, slot10 in ipairs(slot3) do
			if slot9 == 1 and slot1 <= slot10.dps_high then
				return slot9, slot10, slot3[#slot3].dps_high
			elseif slot9 == slot4 and slot10.dps_low < slot1 then
				return slot9, slot10, slot5
			elseif slot10.dps_low < slot1 and slot1 <= slot10.dps_high then
				return slot9, slot10, slot5
			end
		end
	end

	return 0
end

function ActionyearmonsterModel.__delete(slot0)
end
