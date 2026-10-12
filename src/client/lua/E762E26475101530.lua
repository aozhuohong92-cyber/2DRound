PlanesModel = PlanesModel or BaseClass()
slot0 = table.insert
slot1 = table.remove

function PlanesModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PlanesModel.config(slot0)
	slot0.cur_dun_id = 0
	slot0.cur_floor = 0
	slot0.cur_dun_pro_val = 0
	slot0.max_dun_pro_val = 1
	slot0.can_chose_dun_list = {}
	slot0.can_get_award_dun_list = {}
	slot0.got_award_dun_list = {}
	slot0.planes_reset_time = 0
	slot0.evt_vo_list = {}
	slot0.planes_bag_data = nil
	slot0.planes_hero_data = {}
	slot0.is_holiday_open = false
	slot0.planes_red_list = {}
end

function PlanesModel.isHolidayOpen(slot0)
	return slot0.is_holiday_open
end

function PlanesModel.setHolidayOpen(slot0, slot1)
	if slot1 then
		slot0.is_holiday_open = slot1 == 1
	end
end

function PlanesModel.setCurDunId(slot0, slot1)
	slot0.cur_dun_id = slot1 or 0
end

function PlanesModel.getCurDunId(slot0)
	return slot0.cur_dun_id
end

function PlanesModel.setCurPlanesFloor(slot0, slot1)
	slot0.cur_floor = slot1 or 0
end

function PlanesModel.getCurPlanesFloor(slot0)
	return slot0.cur_floor
end

function PlanesModel.getPlanesBattleBgId(slot0)
	if Config.SecretDunData.data_customs[slot0.cur_dun_id] then
		return slot1.battle_bg_id
	end
end

function PlanesModel.setCurDunProgressVal(slot0, slot1, slot2)
	slot0.cur_dun_pro_val = slot1 or 0

	if slot2 and slot2 > 0 then
		slot0.max_dun_pro_val = slot2
	end

	if (slot0.cur_dun_id == 0 or slot1 ~= slot2) and not slot0.set_red_init then
		slot0.set_red_init = true

		slot0:updatePlanesRedStatus(PlanesConst.Red_Index.Login, true)
	end
end

function PlanesModel.getCurDunProgressVal(slot0)
	return slot0.cur_dun_pro_val, slot0.max_dun_pro_val
end

function PlanesModel.setCanChoseDunList(slot0, slot1)
	slot0.can_chose_dun_list = slot1 or {}
end

function PlanesModel.getCanChoseDunList(slot0)
	return slot0.can_chose_dun_list
end

function PlanesModel.setCanGetAwardDunList(slot0, slot1)
	slot0.can_get_award_dun_list = slot1 or {}

	slot0:calculateAwardRedStatus()
end

function PlanesModel.calculateAwardRedStatus(slot0)
	slot1 = false

	if tableLen(slot0.can_get_award_dun_list) > 0 then
		slot1 = true
	end

	slot0:updatePlanesRedStatus(PlanesConst.Red_Index.Award, slot1)
end

function PlanesModel.checkIsCanGetAwardByDunId(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.can_get_award_dun_list) do
		if slot7.can_reward_id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function PlanesModel.getPlanesDunStatusById(slot0, slot1)
	slot2 = PlanesConst.Dun_Status.Lock

	if slot0.cur_dun_id == 0 then
		for slot6, slot7 in pairs(slot0.can_chose_dun_list) do
			if slot7.id == slot1 then
				slot2 = PlanesConst.Dun_Status.Chose

				break
			end
		end
	elseif slot0.cur_dun_id == slot1 then
		slot2 = PlanesConst.Dun_Status.Select
	else
		for slot6, slot7 in pairs(slot0.can_chose_dun_list) do
			if slot7.id == slot1 then
				slot2 = PlanesConst.Dun_Status.Close

				break
			end
		end
	end

	return slot2
end

function PlanesModel.checkDunIsPassByDunId(slot0, slot1)
	slot2 = false

	if slot0.got_award_dun_list[slot1] or slot0:checkIsCanGetAwardByDunId(slot1) then
		slot2 = true
	end

	return slot2
end

function PlanesModel.getPlanesLockTipsByDunId(slot0, slot1)
	if Config.SecretDunData.data_customs[slot1] then
		slot3 = false

		if slot2.id_limit and slot2.id_limit[1] then
			if slot0:checkDunIsPassByDunId(slot2.id_limit[1]) then
				slot3 = true
			end

			if not slot3 and Config.SecretDunData.data_dun_info[slot2.id_limit[1]] then
				return TI18N(string.format("通关[%s]开启", slot4.name or ""))
			end
		end

		if RoleController:getInstance():getRoleVo().lev < slot2.lev_limit then
			return TI18N(string.format("等级达%d级", slot2.lev_limit))
		end

		if slot4.power < slot2.power_limit then
			return TI18N(string.format("战力达%d", slot2.power_limit))
		end
	end
end

function PlanesModel.setGotFirstAwardDunList(slot0, slot1)
	slot0.got_award_dun_list = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.got_award_dun_list[slot6.reward_id] = true
	end
end

function PlanesModel.addGotFirstAwardDunId(slot0, slot1)
	slot0.got_award_dun_list[slot1] = true

	for slot5, slot6 in pairs(slot0.can_get_award_dun_list) do
		if slot6.can_reward_id == slot1 then
			table.remove(slot0.can_get_award_dun_list, slot5)

			break
		end
	end

	slot0:calculateAwardRedStatus()
end

function PlanesModel.checkIsGetAwardByDunId(slot0, slot1)
	return slot0.got_award_dun_list[slot1]
end

function PlanesModel.setPlanesResetTime(slot0, slot1)
	slot0.planes_reset_time = slot1
end

function PlanesModel.getResetLessTime(slot0)
	if slot0.planes_reset_time - GameNet:getInstance():getTime() < 0 then
		slot2 = 0
	end

	return slot2
end

function PlanesModel.setPlanesRoleLookId(slot0, slot1)
	slot0.planes_look_id = slot1
end

function PlanesModel.getPlanesRoleLookId(slot0)
	return slot0.planes_look_id
end

function PlanesModel.setPlanesEvtVoList(slot0, slot1)
	slot0.evt_vo_list = {}

	for slot5, slot6 in pairs(slot1) do
		if slot6.evtid > 0 then
			slot7 = PlanesEvtVo.New()

			slot7:updateData(slot6)

			slot0.evt_vo_list[slot6.index] = slot7
		end
	end
end

function PlanesModel.updatePlanesEvtVoList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if not slot0.evt_vo_list[slot7.index] then
			slot8 = PlanesEvtVo.New()

			slot8:updateData(slot7)

			slot0.evt_vo_list[slot7.index] = slot8

			table.insert(slot2, slot8)
		else
			slot8:updateData(slot7)
		end
	end

	if next(slot2) ~= nil then
		GlobalEvent:getInstance():Fire(PlanesEvent.Add_Evt_Data_Event, slot2)
	end
end

function PlanesModel.getPlanesSameGroupIndexList(slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in pairs(slot0.evt_vo_list) do
		if slot8.index ~= slot2 and slot8.is_hide == 0 and slot8.config and slot8.config.group_id == slot1 then
			uv0(slot3, slot8.index)
		end
	end

	return slot3
end

function PlanesModel.checkEvtCanWalkByGridIndex(slot0, slot1, slot2)
	slot3 = true

	if slot0.evt_vo_list[slot1] then
		if slot2 and slot4.config and slot4.config.type ~= PlanesConst.Evt_Type.Barrier and slot4.status ~= PlanesConst.Evt_State.Down then
			slot3 = true
		elseif slot4.config and slot4.config.type == PlanesConst.Evt_Type.Stage then
			if slot4.platform == 1 then
				slot3 = false
			end
		elseif slot4.config and slot4.config.is_walk == 0 and slot4.status == PlanesConst.Evt_State.Doing then
			slot3 = false
		end
	end

	return slot3
end

function PlanesModel.checkIsHaveEvtByGridIndex(slot0, slot1)
	if slot0.evt_vo_list[slot1] then
		return true
	end

	return false
end

function PlanesModel.checkIsNeedStopPreGrid(slot0, slot1)
	if slot0.evt_vo_list[slot1] and slot2.status == PlanesConst.Evt_State.Doing and slot2.config and slot2.config.type ~= PlanesConst.Evt_Type.Start then
		return true
	end

	return false
end

function PlanesModel.getPlanesEvtVoList(slot0)
	return slot0.evt_vo_list
end

function PlanesModel.getPlanesEvtVoByGridIndex(slot0, slot1)
	return slot0.evt_vo_list[slot1]
end

function PlanesModel.setPlanesBagData(slot0, slot1)
	slot0.planes_bag_data = {}

	for slot5, slot6 in ipairs(slot1 or {}) do
		slot0.planes_bag_data[slot6.id] = slot6
	end

	GlobalEvent:getInstance():Fire(PlanesEvent.Iint_Bag_Data_Event)
end

function PlanesModel.getPlanesBagData(slot0)
	return slot0.planes_bag_data
end

function PlanesModel.updatePlanesBagData(slot0, slot1)
	if not slot0.planes_bag_data then
		return
	end

	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		if slot0.planes_bag_data[slot7.id] then
			slot0.planes_bag_data[slot7.id].num = slot7.num
		else
			slot0.planes_bag_data[slot7.id] = slot7
			slot2 = true
		end
	end

	GlobalEvent:getInstance():Fire(PlanesEvent.Update_Bag_Data_Event, slot1, slot2)
end

function PlanesModel.deletePlanesBagData(slot0, slot1)
	if not slot0.planes_bag_data then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		slot0.planes_bag_data[slot6.id] = nil
	end

	GlobalEvent:getInstance():Fire(PlanesEvent.Delete_Bag_Data_Event, slot1)
end

function PlanesModel.setAllPlanesHeroData(slot0, slot1)
	slot0.planes_hero_data = slot1
end

function PlanesModel.getAllPlanesHeroData(slot0)
	return slot0.planes_hero_data
end

function PlanesModel.getPlanesHireHeroData(slot0, slot1)
	for slot5, slot6 in pairs(slot0.planes_hero_data) do
		if slot6.flag == 1 and slot6.partner_id == slot1 then
			return slot6
		end
	end
end

function PlanesModel.updateMyHeroData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in pairs(slot0.planes_hero_data) do
			if slot11.flag == slot6.flag and slot11.partner_id == slot6.partner_id then
				slot11.hp_per = slot6.hp_per

				break
			end
		end
	end
end

function PlanesModel.getMyPlanesHeroHpPer(slot0, slot1, slot2)
	slot3 = 100

	for slot7, slot8 in pairs(slot0.planes_hero_data) do
		if slot8.flag == (slot2 or 0) and slot8.partner_id == slot1 then
			slot3 = slot8.hp_per or 100

			break
		end
	end

	return slot3
end

function PlanesModel.checkIsHaveHpNotFullHero(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.planes_hero_data) do
		if slot6.hp_per < 100 then
			slot1 = true

			break
		end
	end

	return slot1
end

function PlanesModel.checkIsHaveDieHero(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.planes_hero_data) do
		if slot6.hp_per <= 0 then
			slot1 = true

			break
		end
	end

	return slot1
end

function PlanesModel.setPlanesDramIdCache(slot0, slot1)
	slot0.dram_id_cache = slot1
end

function PlanesModel.getPlanesDramIdCache(slot0)
	return slot0.dram_id_cache
end

function PlanesModel.updatePlanesRedStatus(slot0, slot1, slot2)
	if not slot0.planes_is_open then
		slot0.planes_is_open = PlanesController:getInstance():checkPlanesIsOpen(true)
	end

	if not slot0.planes_is_open then
		return
	end

	slot0.planes_red_list[slot1] = slot2

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {
		bid = RedPointType.heroexpedit,
		status = slot0:getPlanesRedStatus()
	})
	GlobalEvent:getInstance():Fire(PlanesEvent.Update_Planes_Red_Event, slot1, slot2)
end

function PlanesModel.getPlanesRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.planes_red_list) do
		if slot6 then
			slot1 = true

			break
		end
	end

	return slot1
end

function PlanesModel.getPlanesRedStatusByBid(slot0, slot1)
	return slot0.planes_red_list[slot1] or false
end

function PlanesModel.__delete(slot0)
end
