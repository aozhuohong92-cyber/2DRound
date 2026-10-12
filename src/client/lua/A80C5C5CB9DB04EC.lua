slot0 = table.insert
slot1 = table.remove
HomeworldModel = HomeworldModel or BaseClass()

function HomeworldModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function HomeworldModel.config(slot0)
	slot0.my_home_figure_id = 0
	slot0.my_home_name = ""
	slot0.home_comfort_val = 0
	slot0.home_worship = 0
	slot0.left_worship_num = 0
	slot0.acc_hook_time = 0
	slot0.home_wall_id = 0
	slot0.home_floor_id = 0
	slot0.max_comfort_val = 0
	slot0.max_all_soft_val = 0
	slot0.home_furniture_data = {}
	slot0.home_visitors_data = {}
	slot0.activate_figure_list = {}
	slot0.suit_award_data = {}
	slot0.cur_storey_index = 1
	slot0.max_soft_storey = 1
	slot0.max_storey_soft = 0
	slot0.main_storey_index = 1
	slot0.other_storey_data = {}
	slot0.is_open_home_flag = 0
	slot0.occupy_grid_list = {}
	slot0.today_worship_data = {}
	slot0.random_visiter_data = {}
	slot0.home_red_list = {}
end

function HomeworldModel.clearHomeCacheData(slot0)
	slot0.home_wall_id = 0
	slot0.home_floor_id = 0
	slot0.home_furniture_data = {}
	slot0.home_visitors_data = {}
	slot0.occupy_grid_list = {}
	slot0.today_worship_data = {}
	slot0.random_visiter_data = {}
end

function HomeworldModel.setMyCurHomeFigureId(slot0, slot1)
	slot0.my_home_figure_id = slot1
end

function HomeworldModel.getMyCurHomeFigureId(slot0)
	return slot0.my_home_figure_id
end

function HomeworldModel.setMyHomeName(slot0, slot1)
	slot0.my_home_name = slot1
end

function HomeworldModel.getMyHomeName(slot0)
	return slot0.my_home_name
end

function HomeworldModel.setHomeComfortValue(slot0, slot1)
	slot0.home_comfort_val = slot1
end

function HomeworldModel.getHomeComfortValue(slot0)
	return slot0.home_comfort_val
end

function HomeworldModel.getHomeCoinOutput(slot0)
	slot1 = 0
	slot2 = nil

	for slot6, slot7 in pairs(Config.HomeData.data_home_coin) do
		if slot7.soft <= slot0.max_storey_soft and (not slot2 or slot2 > slot0.max_storey_soft - slot7.soft) then
			slot2 = slot0.max_storey_soft - slot7.soft
			slot1 = slot7.home_coin
		end
	end

	return slot1
end

function HomeworldModel.setHomeWorship(slot0, slot1)
	slot0.home_worship = slot1
end

function HomeworldModel.getHomeWorship(slot0)
	return slot0.home_worship
end

function HomeworldModel.setLeftWorshipNum(slot0, slot1)
	slot0.left_worship_num = slot1
end

function HomeworldModel.getLeftWorshipNum(slot0)
	return slot0.left_worship_num
end

function HomeworldModel.setHomeAccHookTime(slot0, slot1)
	slot0.acc_hook_time = slot1
	slot2 = false

	if Config.HomeData.data_const.coin_redpoint_time_condition and slot1 >= slot3.val * 3600 then
		slot2 = true
	end

	slot0:updateHomeworldRedStatus(HomeworldConst.Red_Index.Hook, slot2)
end

function HomeworldModel.getHomeAccHookTime(slot0)
	return slot0.acc_hook_time
end

function HomeworldModel.setMyHomeWallId(slot0, slot1)
	slot0.home_wall_id = slot1
end

function HomeworldModel.getMyHomeWallId(slot0)
	return slot0.home_wall_id
end

function HomeworldModel.setMyHomeFloorId(slot0, slot1)
	slot0.home_floor_id = slot1
end

function HomeworldModel.getMyHomeFloorId(slot0)
	return slot0.home_floor_id
end

function HomeworldModel.setMyHomeCurStoreyIndex(slot0, slot1, slot2)
	slot0.cur_storey_index = slot1
	slot0.max_soft_storey = slot2
end

function HomeworldModel.updateMaxSoftStoreyIndex(slot0, slot1)
	slot0.max_soft_storey = slot1
end

function HomeworldModel.getMyHomeCurStoreyIndex(slot0)
	return slot0.cur_storey_index, slot0.max_soft_storey
end

function HomeworldModel.checkMaxStoreyIsChange(slot0, slot1)
	if slot0.max_soft_storey == slot1 then
		return false
	end

	return true
end

function HomeworldModel.setMyHomeMaxStoreySoft(slot0, slot1)
	slot0.max_storey_soft = slot1
end

function HomeworldModel.getMyHomeMaxStoreySoft(slot0)
	return slot0.max_storey_soft
end

function HomeworldModel.setMyHomeMainStoreyIndex(slot0, slot1)
	slot0.main_storey_index = slot1
end

function HomeworldModel.getMyhomeMainStoreyIndex(slot0)
	return slot0.main_storey_index
end

function HomeworldModel.setOtherStoreyFurnitureData(slot0, slot1)
	slot0.other_storey_data = slot1 or {}
end

function HomeworldModel.getOtherStoreyFurnitureData(slot0)
	return slot0.other_storey_data
end

function HomeworldModel.setMyHomeFurnitureData(slot0, slot1)
	slot0.home_furniture_data = {}

	for slot5, slot6 in pairs(slot1) do
		slot7 = FurnitureVo.New()

		slot7:updateData(slot6)
		uv0(slot0.home_furniture_data, slot7)
	end
end

function HomeworldModel.getMyHomeFurnitureData(slot0)
	return slot0.home_furniture_data
end

function HomeworldModel.checkIsHaveFurnitureData(slot0)
	if next(slot0.home_furniture_data) == nil then
		return false
	end

	return true
end

function HomeworldModel.getFurnitureAllNumByBid(slot0, slot1)
	slot2 = BackpackController:getInstance():getModel():getItemNumByBid(slot1, BackPackConst.Bag_Code.HOME)
	slot3 = 0

	if slot1 == slot0.home_wall_id or slot1 == slot0.home_floor_id then
		slot3 = 1
	else
		for slot7, slot8 in pairs(slot0.home_furniture_data) do
			if slot8.bid == slot1 then
				slot3 = slot3 + 1
			end
		end
	end

	slot4 = 0

	for slot8, slot9 in pairs(slot0.other_storey_data) do
		if slot9.bid == slot1 then
			slot4 = slot9.num or 0

			break
		end
	end

	return slot2 + slot3 + slot4
end

function HomeworldModel.setMyHomeVisitorsData(slot0, slot1)
	slot0.home_visitors_data = slot1 or {}
end

function HomeworldModel.getMyHomeVisitorsData(slot0)
	return slot0.home_visitors_data
end

function HomeworldModel.setMaxComfortValue(slot0, slot1)
	slot0.max_comfort_val = slot1
	slot2 = false

	for slot6, slot7 in pairs(Config.HomeData.data_figure) do
		if slot0:getFigureActiveStatus(slot7.id) == HomeworldConst.Figure_State.CanUnlock then
			slot2 = true

			break
		end
	end

	slot0:updateHomeworldRedStatus(HomeworldConst.Red_Index.Figure, slot2, true)
end

function HomeworldModel.getMaxComfortValue(slot0)
	return slot0.max_comfort_val
end

function HomeworldModel.setMaxAllSoftValue(slot0, slot1)
	slot0.max_all_soft_val = slot1
end

function HomeworldModel.getMaxAllSoftValue(slot0)
	return slot0.max_all_soft_val
end

function HomeworldModel.setActivateFigureList(slot0, slot1, slot2)
	slot0.activate_figure_list = slot1

	if not slot2 then
		slot3 = false

		for slot7, slot8 in pairs(Config.HomeData.data_figure) do
			if slot0:getFigureActiveStatus(slot8.id) == HomeworldConst.Figure_State.CanUnlock then
				slot3 = true

				break
			end
		end

		slot0:updateHomeworldRedStatus(HomeworldConst.Red_Index.Figure, slot3, true)
	end
end

function HomeworldModel.addFigureIdToActiveList(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.activate_figure_list) do
		if slot7.id == slot1 then
			slot2 = true

			break
		end
	end

	if not slot2 then
		uv0(slot0.activate_figure_list, {
			id = slot1
		})
	end
end

function HomeworldModel.getFigureActiveStatus(slot0, slot1)
	if not Config.HomeData.data_figure[slot1] then
		return HomeworldConst.Figure_State.Lock
	end

	slot3 = false

	for slot7, slot8 in pairs(slot0.activate_figure_list) do
		if slot1 == slot8.id then
			slot3 = true

			break
		end
	end

	if slot3 then
		return HomeworldConst.Figure_State.Unlock
	elseif slot2.tips ~= nil and slot2.tips ~= "" then
		return HomeworldConst.Figure_State.Lock
	elseif slot2.open_soft <= slot0.max_comfort_val then
		return HomeworldConst.Figure_State.CanUnlock
	else
		return HomeworldConst.Figure_State.Lock
	end
end

function HomeworldModel.setHomeSuitAwardData(slot0, slot1)
	slot0.suit_award_data = slot1
	slot2 = false

	for slot6, slot7 in pairs(slot1) do
		for slot13, slot14 in pairs(Config.HomeData.data_suit_award[slot7.set_id] or {}) do
			if slot14.num <= #slot7.collect then
				slot15 = false

				for slot19, slot20 in pairs(slot7.reward) do
					if slot20.id == slot14.id then
						slot15 = true

						break
					end
				end

				if not slot15 then
					slot2 = true
				end
			end

			if slot2 == true then
				break
			end
		end

		if slot2 == true then
			break
		end
	end

	slot0:updateHomeworldRedStatus(HomeworldConst.Red_Index.Suit, slot2)
end

function HomeworldModel.checkSuitAwardRedStatus(slot0, slot1, slot2)
	if not slot1 then
		return false
	end

	slot3 = false

	for slot7, slot8 in pairs(slot0.suit_award_data) do
		if slot8.set_id == slot1 then
			for slot14, slot15 in pairs(Config.HomeData.data_suit_award[slot1] or {}) do
				if slot15.num <= #slot8.collect and (not slot2 or slot2 == slot15.id) then
					slot16 = false

					for slot20, slot21 in pairs(slot8.reward) do
						if slot21.id == slot15.id then
							slot16 = true

							break
						end
					end

					if not slot16 then
						slot3 = true
					end
				end

				if slot3 then
					break
				end
			end

			break
		end
	end

	return slot3
end

function HomeworldModel.getHomeSuitAwardDataById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.suit_award_data) do
		if slot6.set_id == slot1 then
			return slot6
		end
	end
end

function HomeworldModel.checkIsHaveSuitAwardData(slot0)
	if slot0.suit_award_data and next(slot0.suit_award_data) ~= nil then
		return true
	end

	return false
end

function HomeworldModel.checkGridWalkType(slot0, slot1, slot2)
	if not slot0.walk_cfg then
		slot0.walk_cfg = Config.MapBlock.data(HomeworldConst.Map_Id)
	end

	if slot0.walk_cfg and slot0.walk_cfg[slot2] and slot0.walk_cfg[slot2][slot1] then
		return slot0.walk_cfg[slot2][slot1]
	end

	return 0
end

function HomeworldModel.checkGridIsCanWalk(slot0, slot1, slot2, slot3, slot4)
	if slot0:checkGridWalkType(slot1, slot2) == slot3 then
		slot6 = true

		for slot10, slot11 in pairs(slot4 or slot0.occupy_grid_list) do
			if slot11[1] == slot1 and slot11[2] == slot2 then
				slot6 = false

				break
			end
		end

		return slot6
	end

	return false
end

function HomeworldModel.updateOccupyGridList(slot0, slot1)
	slot0.occupy_grid_list = slot1 or {}
end

function HomeworldModel.setHomeFirstOpenFlag(slot0, slot1)
	slot0.is_open_home_flag = slot1
end

function HomeworldModel.getIsFirstTimeOpenHome(slot0)
	if slot0.is_open_home_flag == 1 then
		return false
	end

	return true
end

function HomeworldModel.checkHomeworldIsOpen(slot0, slot1)
	slot2 = false
	slot3 = RoleController:getInstance():getRoleVo()

	if Config.HomeData.data_const.open_lev and slot3 and slot4.val <= slot3.lev then
		slot2 = true
	end

	if slot2 == false and not slot1 and slot4 then
		message(slot4.desc)
	end

	return slot2
end

function HomeworldModel.setTodayWorshipPlayerData(slot0, slot1)
	slot0.today_worship_data = slot1
end

function HomeworldModel.checkIsHaveTodayWorshipData(slot0)
	if slot0.today_worship_data and next(slot0.today_worship_data) ~= nil then
		return true
	end

	return false
end

function HomeworldModel.addPlayerToWorshipData(slot0, slot1, slot2)
	slot3 = false

	for slot7, slot8 in pairs(slot0.today_worship_data) do
		if slot8.rid == slot1 and slot8.srv_id == slot2 then
			slot3 = true

			break
		end
	end

	if not slot3 then
		uv0(slot0.today_worship_data, {
			rid = slot1,
			srv_id = slot2
		})
	end
end

function HomeworldModel.checkPlayerTodayIsWorship(slot0, slot1, slot2)
	slot3 = 0

	for slot7, slot8 in pairs(slot0.today_worship_data) do
		if slot8.rid == slot1 and slot8.srv_id == slot2 then
			slot3 = 1

			break
		end
	end

	return slot3
end

function HomeworldModel.setRandomVisiterData(slot0, slot1)
	slot0.random_visiter_data = slot1 or {}
end

function HomeworldModel.getNextPlayerList(slot0, slot1, slot2)
	slot3 = {}

	for slot8, slot9 in pairs(FriendController:getInstance():getModel():getOpenHomeFriendList()) do
		slot10 = {
			rid = slot9.rid,
			srv_id = slot9.srv_id,
			is_friend = 1,
			is_worship = slot0:checkPlayerTodayIsWorship(slot9.rid, slot9.srv_id),
			is_first = 1
		}

		if slot9.rid == slot1 and slot9.srv_id == slot2 then
			-- Nothing
		else
			slot10.is_first = 0
		end

		uv0(slot3, slot10)
	end

	function slot5(slot0, slot1)
		slot2 = false

		for slot6, slot7 in pairs(uv0) do
			if slot7.rid == slot0 and slot7.srv_id == slot1 then
				slot2 = true

				break
			end
		end

		if not slot2 then
			if slot0 == uv2 and slot1 == uv3 then
				-- Nothing
			else
				slot3.is_first = 0
			end

			uv4(uv0, {
				rid = slot0,
				srv_id = slot1,
				is_friend = 0,
				is_worship = uv1:checkPlayerTodayIsWorship(slot0, slot1),
				is_first = 1
			})
		end
	end

	for slot9, slot10 in pairs(slot0.random_visiter_data) do
		slot5(slot10.rid, slot10.srv_id)
	end

	slot5(slot1, slot2)
	table.sort(slot3, function (slot0, slot1)
		if slot0.is_first ~= slot1.is_first then
			return slot1.is_first < slot0.is_first
		elseif slot0.is_friend ~= slot1.is_friend then
			return slot1.is_friend < slot0.is_friend
		else
			return slot0.is_worship < slot1.is_worship
		end
	end)

	return slot3
end

function HomeworldModel.updateHomeworldRedStatus(slot0, slot1, slot2, slot3)
	slot4 = slot0.home_red_list[slot1]
	slot0.home_red_list[slot1] = slot2

	if not slot3 then
		MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.home, {
			bid = slot1,
			status = slot2
		})
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Update_Red_Status_Data, slot1, slot2)
end

function HomeworldModel.checkHomeworldRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.home_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function HomeworldModel.getRedStatusById(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.home_red_list) do
		if slot6 == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function HomeworldModel.__delete(slot0)
end
