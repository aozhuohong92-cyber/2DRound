PlanesafkModel = PlanesafkModel or BaseClass()

function PlanesafkModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PlanesafkModel.config(slot0)
	slot0.map_id = nil
	slot0.map_config = nil
	slot0.cur_line = nil
	slot0.cur_index = nil
	slot0.is_show_search_finish = nil
	slot0.planesafk_login_redpoint = nil
end

function PlanesafkModel.setIsShowSearchFinish(slot0, slot1)
	slot0.is_show_search_finish = slot1
end

function PlanesafkModel.getIsShowSearchFinish(slot0)
	return slot0.is_show_search_finish
end

function PlanesafkModel.setPlanesRoleLookId(slot0, slot1)
	slot0.planes_look_id = slot1
end

function PlanesafkModel.getPlanesRoleLookId(slot0)
	return slot0.planes_look_id
end

function PlanesafkModel.setMapData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.map_id then
		slot0.map_id = slot1.map_id
		slot0.map_config = Config.PlanesData.data_customs[slot0.map_id]
	end
end

function PlanesafkModel.updateRolePos(slot0, slot1)
	slot0.cur_line = slot1.line or 1
	slot0.cur_index = slot1.index or 3
end

function PlanesafkModel.getMapID(slot0)
	return slot0.map_id or 1
end

function PlanesafkModel.getMapResID(slot0)
	if slot0.map_config then
		return slot0.map_config.res_id or "11"
	end

	return "11"
end

function PlanesafkModel.getRolePos(slot0)
	return slot0.cur_line or 1, slot0.cur_index or 3
end

function PlanesafkModel.isHolidayOpen(slot0)
	return slot0.is_holiday_open
end

function PlanesafkModel.setHolidayOpen(slot0, slot1)
	if slot1 then
		slot0.is_holiday_open = slot1 == 1
	end
end

function PlanesafkModel.setAllPlanesHeroData(slot0, slot1)
	slot0.planes_hero_data = slot1
end

function PlanesafkModel.getAllPlanesHeroData(slot0)
	return slot0.planes_hero_data
end

function PlanesafkModel.getPlanesHireHeroData(slot0, slot1)
	if not slot0.planes_hero_data then
		return
	end

	for slot5, slot6 in pairs(slot0.planes_hero_data) do
		if slot6.flag == 1 and slot6.partner_id == slot1 then
			return slot6
		end
	end
end

function PlanesafkModel.updateMyHeroData(slot0, slot1)
	if not slot0.planes_hero_data then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in pairs(slot0.planes_hero_data) do
			if slot11.flag == slot6.flag and slot11.partner_id == slot6.partner_id then
				slot11.hp_per = slot6.hp_per

				break
			end
		end
	end

	GlobalEvent:getInstance():Fire(PlanesafkEvent.Get_Hero_Live_Event)
end

function PlanesafkModel.getMyPlanesHeroHpPer(slot0, slot1, slot2)
	if not slot0.planes_hero_data then
		return
	end

	slot3 = 100

	for slot7, slot8 in pairs(slot0.planes_hero_data) do
		if slot8.flag == (slot2 or 0) and slot8.partner_id == slot1 then
			slot3 = slot8.hp_per or 100

			break
		end
	end

	return slot3
end

function PlanesafkModel.checkIsHaveHpNotFullHero(slot0)
	if not slot0.planes_hero_data then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(slot0.planes_hero_data) do
		if slot6.hp_per < 100 then
			slot1 = true

			break
		end
	end

	return slot1
end

function PlanesafkModel.checkIsHaveDieHero(slot0)
	if not slot0.planes_hero_data then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(slot0.planes_hero_data) do
		if slot6.hp_per <= 0 then
			slot1 = true

			break
		end
	end

	return slot1
end

function PlanesafkModel.getBgPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return string.format("resource/planes/grid_icon/%s.png", slot1)
	end
end

function PlanesafkModel.getPlanesAfkRedStatus(slot0)
	return slot0:getOrderactionRedpoint() or slot0.planesafk_login_redpoint
end

function PlanesafkModel.checkPlanesafkRedPoint(slot0)
	slot1 = false

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {
		bid = RedPointType.heroexpedit,
		status = slot0:getPlanesAfkRedStatus()
	})
	GlobalEvent:getInstance():Fire(PlanesafkEvent.Update_Planes_Red_Event)
end

function PlanesafkModel.setPlanesafkLoginRedpointFalse(slot0)
	slot0.planesafk_login_redpoint = false

	slot0:checkPlanesafkRedPoint()
end

function PlanesafkModel.checkPlaneafkCanExploreRedPoint(slot0, slot1)
	if slot1 and slot0.planesafk_login_redpoint == nil then
		slot0.planesafk_login_redpoint = false
		slot2 = 3

		if Config.PlanesData.data_const.planes_max_floor then
			slot2 = slot3.val
		end

		if slot1.floor < slot2 then
			slot0.planesafk_login_redpoint = true
		elseif slot1.is_can_reward ~= 1 or slot1.is_reward ~= 1 then
			slot0.planesafk_login_redpoint = true
		end
	end

	slot0:checkPlanesafkRedPoint()
end

function PlanesafkModel.setOrderactionData(slot0, slot1)
	slot0.orderaction_data = slot1

	if slot1 then
		slot0:setGiftStatus(slot1.rmb_status)
	end
end

function PlanesafkModel.getCurPeriod(slot0)
	if slot0.orderaction_data and slot0.orderaction_data.period then
		return slot0.orderaction_data.period
	end

	return 1
end

function PlanesafkModel.getGiftStatus(slot0)
	if slot0.rmb_status then
		return slot0.rmb_status
	end

	return 0
end

function PlanesafkModel.getLevShowData(slot0, slot1)
	if slot0.orderaction_data and slot0.orderaction_data.list and slot0.orderaction_data.list[slot1] then
		return slot0.orderaction_data.list[slot1]
	end

	return nil
end

function PlanesafkModel.getWinCounts(slot0)
	if slot0.orderaction_data and slot0.orderaction_data.win_count then
		return slot0.orderaction_data.win_count
	end

	return 0
end

function PlanesafkModel.getCurDay(slot0)
	if slot0.orderaction_data and slot0.orderaction_data.cur_day then
		return slot0.orderaction_data.cur_day
	end

	return 1
end

function PlanesafkModel.setOrderactionRedStatus(slot0, slot1)
	slot0.orderaction_first_red_status = slot1
end

function PlanesafkModel.setGiftStatus(slot0, slot1)
	slot0.rmb_status = slot1
end

function PlanesafkModel.getOrderactionRedpoint(slot0)
	if slot0.orderaction_first_red_status == 1 then
		return true
	end

	if not slot0.orderaction_data then
		return false
	end

	if Config.ArenaEliteWarOrderData.data_lev_reward_list and slot1[slot0.orderaction_data.period] then
		for slot5, slot6 in ipairs(slot1[slot0.orderaction_data.period]) do
			slot7 = 0
			slot8 = 0

			if slot0:getLevShowData(slot6.lev) then
				slot7 = slot9.award_status
				slot8 = slot9.rmb_award_status
			end

			if slot6.lev <= slot0.orderaction_data.lev then
				if slot7 == 0 then
					return true
				elseif slot8 == 0 and slot0.orderaction_data.rmb_status == 1 then
					return true
				end
			end
		end
	end

	return false
end

function PlanesafkModel.getOrderIsShow(slot0)
	slot1 = Config.PlanesWarOrderData.data_constant.limit_lev
	slot4 = RoleController:getInstance():getModel():getRoleVo()

	if Config.PlanesWarOrderData.data_constant.open_srv_day and slot1 and slot4 and (RoleController:getInstance():getModel():getOpenSrvDay() < slot2.val or slot4.lev < slot1.val) then
		return false
	end

	return true
end

function PlanesafkModel.__delete(slot0)
end
