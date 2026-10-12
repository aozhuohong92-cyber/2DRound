ElfinModel = ElfinModel or BaseClass()

function ElfinModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function ElfinModel.config(slot0)
	slot0.elfin_hatch_list = {}
	slot0.elfin_buy_info = {}
	slot0.activated_elfin_list = {}
	slot0.elfin_tree_data = {}
	slot0.tree_attr_change_data = {}
	slot0.hatch_cfg = Config.SpriteData.data_hatch_data
	slot0.elfin_red_list = {}
end

function ElfinModel.setElfinBuyInfo(slot0, slot1)
	slot0.elfin_buy_info = slot1 or {}
end

function ElfinModel.updateElfinBuyInfoByBid(slot0, slot1, slot2)
	slot3 = false

	for slot7, slot8 in pairs(slot0.elfin_buy_info) do
		if slot8.item_bid == slot1 then
			slot3 = true
			slot8.buy_num = slot2

			break
		end
	end

	if not slot3 then
		table.insert(slot0.elfin_buy_info, {
			item_bid = slot1,
			buy_num = slot2
		})
	end
end

function ElfinModel.getElfinBuyCountByBid(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.elfin_buy_info) do
		if slot7.item_bid == slot1 then
			slot2 = slot7.buy_num

			break
		end
	end

	return slot2
end

function ElfinModel.setActivatedElfinList(slot0, slot1)
	slot0.activated_elfin_list = slot1 or {}
end

function ElfinModel.checkElfinIsActivatedByBid(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.activated_elfin_list) do
		if slot7.item_bid == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function ElfinModel.setElfinHatchList(slot0, slot1)
	slot0.elfin_hatch_list = {}

	for slot5, slot6 in pairs(slot1) do
		ElfinHatchVo.New():updateData(slot6)

		if slot0.hatch_cfg and slot0.hatch_cfg[slot6.id] then
			slot7.sort = slot0.hatch_cfg[slot6.id].sort
		end

		table.insert(slot0.elfin_hatch_list, slot7)
	end

	slot0:calculateElfinHatchDoneRedStatus()
	slot0:calculateElfinHatchLvupRedStatus()
	slot0:calculateElfinHatchEggRedStatus()
end

function ElfinModel.updateElfinHatchData(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot7 = false

		for slot11, slot12 in pairs(slot0.elfin_hatch_list) do
			if slot12.id == slot6.id then
				slot12:updateData(slot6)

				slot7 = true

				break
			end
		end

		if not slot7 then
			ElfinHatchVo.New():updateData(slot6)

			if slot0.hatch_cfg and slot0.hatch_cfg[slot6.id] then
				slot8.sort = slot0.hatch_cfg[slot6.id].sort
			end

			table.insert(slot0.elfin_hatch_list, slot8)
		end
	end

	slot0:calculateElfinHatchDoneRedStatus()
	slot0:calculateElfinHatchLvupRedStatus()
	slot0:calculateElfinHatchEggRedStatus()
end

function ElfinModel.updateOneElfinHatchData(slot0, slot1)
	for slot5, slot6 in pairs(slot0.elfin_hatch_list) do
		if slot6.id == slot1.id then
			slot6:updateData(slot1)

			break
		end
	end

	slot0:calculateElfinHatchDoneRedStatus()
	slot0:calculateElfinHatchLvupRedStatus()
	slot0:calculateElfinHatchEggRedStatus()
end

function ElfinModel.getElfinHatchList(slot0)
	return slot0.elfin_hatch_list
end

function ElfinModel.getElfinHatchVoById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.elfin_hatch_list) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function ElfinModel.checkElfinIsOpen(slot0, slot1)
	slot2 = false
	slot3 = RoleController:getInstance():getRoleVo()

	if Config.SpriteData.data_const.sprite_unlocked_lv and slot3 and slot4.val <= slot3.lev then
		slot2 = true
	end

	if not slot2 and slot4 and not slot1 then
		message(slot4.desc)
	end

	return slot2
end

function ElfinModel.setElfinTreeData(slot0, slot1)
	slot0.tree_attr_change_data = {}

	if slot0.elfin_tree_data and next(slot0.elfin_tree_data) ~= nil then
		for slot6, slot7 in ipairs({
			"atk",
			"hp_max",
			"def",
			"speed"
		}) do
			if slot0.elfin_tree_data[slot7] < slot1[slot7] then
				slot0.tree_attr_change_data[slot7] = slot9 - slot8
			end
		end

		if slot0.elfin_tree_data.break_lev < slot1.break_lev then
			ElfinController:getInstance():openElfinTreeRouseWindow(true, slot0.elfin_tree_data, slot1)
		end

		if slot0.elfin_tree_data.power and slot0.elfin_tree_data.power < slot1.power then
			GlobalMessageMgr:getInstance():showPowerMove(slot1.power - slot0.elfin_tree_data.power, PathTool.getResFrame("common", "txt_cn_common_90025"), slot0.elfin_tree_data.power)
		end
	end

	slot0.elfin_tree_data = slot1 or {}
	slot0.dic_elfin_item_pos = {}
	slot2 = slot1.sprites or {}

	for slot6, slot7 in ipairs(slot1.sprites) do
		slot0.dic_elfin_item_pos[slot7.pos] = slot7.item_bid
	end

	slot0.tree_cost_list = {}
	slot0.tree_step_lev = 0
	slot4 = Config.SpriteData.data_tree_step[slot1.break_lev]

	if Config.SpriteData.data_tree_up_lv(slot1.lev) and slot4 then
		if slot4.lev_max <= slot1.lev then
			slot0.tree_cost_list = slot4.expend

			for slot9, slot10 in pairs(slot4.step_cond) do
				if slot10[1] == "role_lev" then
					slot0.tree_step_lev = slot10[2]
				end
			end
		else
			slot0.tree_cost_list = slot3.expend
		end
	end

	slot0:calculateTreeUplvRedStatus()
	slot0:calculateTreePutElfinRedStatus()
	slot0:calculateElfinCompoundRedStatus()
	slot0:calculateElfinHigherRedStatus()
end

function ElfinModel.getElfinTreeData(slot0)
	return slot0.elfin_tree_data
end

function ElfinModel.getElfinTreeElfinList(slot0)
	if not slot0.elfin_tree_data then
		return {}
	end

	return slot0.elfin_tree_data.sprites or {}
end

function ElfinModel.getElfinItemByPos(slot0, slot1)
	if slot0.dic_elfin_item_pos then
		return slot0.dic_elfin_item_pos[slot1]
	end

	return nil
end

function ElfinModel.getDedefaultElfinInfo(slot0)
	if slot0.elfin_tree_data then
		slot1 = {}

		for slot6, slot7 in ipairs(slot0.elfin_tree_data.sprites or {}) do
			table.insert(slot1, {
				pos = slot7.pos,
				item_bid = 0
			})
		end

		return slot1
	end

	return {}
end

function ElfinModel.getElfinTreeByBid(slot0, slot1)
	if slot0.dic_elfin_item_pos and slot1 and slot1 ~= 0 then
		for slot5, slot6 in pairs(slot0.dic_elfin_item_pos) do
			if slot6 == slot1 then
				return slot5
			end
		end
	end

	return nil
end

function ElfinModel.getElfinTreeAttrChangeData(slot0)
	return slot0.tree_attr_change_data
end

function ElfinModel.getElfinTreeNextAttrVal(slot0, slot1, slot2, slot3)
	if not Config.SpriteData.data_tree_attr[1] or not Config.SpriteData.data_tree_step[slot3] then
		return 0
	end

	slot7 = "add_" .. slot1

	if slot1 == "hp_max" then
		slot7 = "add_hp"
	end

	return GameMath.round((slot5[slot1] or 0) + function (slot0)
		slot1 = 0

		for slot5, slot6 in pairs(uv0.all_attr or {}) do
			if slot6[1] == slot0 then
				slot1 = slot6[2] or 0
			end
		end

		return slot1
	end(slot1) + slot2 * (slot5[slot7] or 0) * (slot6[slot7] or 0) / 1000000)
end

function ElfinModel.updateElfinRedStatus(slot0, slot1, slot2)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot0.elfin_red_list[slot1] = slot2

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.partner, {
		bid = slot1,
		status = slot2
	})
	GlobalEvent:getInstance():Fire(ElfinEvent.Update_Elfin_Red_Event, slot1, slot2)
end

function ElfinModel.calculateElfinHatchDoneRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(slot0.elfin_hatch_list) do
		if slot6.state == ElfinConst.Hatch_Status.Over then
			slot1 = true

			break
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_hatch_done, slot1)
end

function ElfinModel.calculateElfinHatchLvupRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_hatch_lvup, false)
end

function ElfinModel.setNotCalculateHatchLvupRedFlag(slot0)
	if slot0:getElfinRedStatusByRedBid(HeroConst.RedPointType.eElfin_hatch_lvup) then
		slot0.not_calculate_hatch_flag = true
	end
end

function ElfinModel.setOpenElfinHatchFlag(slot0, slot1)
	slot0.open_hatch_flag = slot1
end

function ElfinModel.calculateElfinHatchEggRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false
	slot2 = false

	for slot6, slot7 in pairs(slot0.elfin_hatch_list) do
		if slot7.is_open == 1 and slot7.state == ElfinConst.Hatch_Status.Open then
			slot2 = true

			break
		end
	end

	if slot2 and #BackpackController:getInstance():getModel():getBackPackItemListByType(BackPackConst.item_type.ELFIN_EGG) > 0 then
		slot1 = true
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_hatch_egg, slot1)
end

function ElfinModel.calculateElfinHatchOpenRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(slot0.elfin_hatch_list) do
		if slot6.is_open == 2 and slot6.state == ElfinConst.Hatch_Status.Open then
			slot1 = true

			break
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_hatch_open, slot1)
end

function ElfinModel.calculateTreeUplvRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false

	if slot0.tree_cost_list and next(slot0.tree_cost_list) ~= nil then
		slot1 = true

		for slot5, slot6 in pairs(slot0.tree_cost_list) do
			if BackpackController:getInstance():getModel():getItemNumByBid(slot6[1]) < slot6[2] then
				slot1 = false

				break
			end
		end

		if slot1 == true and slot0.tree_step_lev and slot0.tree_step_lev > 0 and RoleController:getInstance():getRoleVo() and slot2.lev < slot0.tree_step_lev then
			slot1 = false
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_tree_lvup, slot1)
end

function ElfinModel.getElfinTreeCostBidList(slot0)
	slot1 = {}

	if slot0.tree_cost_list and next(slot0.tree_cost_list) ~= nil then
		for slot5, slot6 in pairs(slot0.tree_cost_list) do
			table.insert(slot1, slot6[1])
		end
	end

	return slot1
end

function ElfinModel.calculateTreePutElfinRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false

	if slot0.elfin_tree_data.sprites and next(slot0.elfin_tree_data.sprites) ~= nil then
		slot2 = false
		slot3 = {}

		for slot7, slot8 in pairs(slot0.elfin_tree_data.sprites) do
			if slot8.item_bid == 0 then
				slot2 = true
			elseif Config.SpriteData.data_elfin_data(slot8.item_bid) and slot9.sprite_type then
				table.insert(slot3, slot9.sprite_type)
			end
		end

		if slot2 == true then
			for slot8, slot9 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}) do
				if Config.SpriteData.data_elfin_data(slot9.base_id) then
					slot11 = false

					for slot15, slot16 in pairs(slot3) do
						if slot10.sprite_type == slot16 then
							slot11 = true

							break
						end
					end

					if not slot11 then
						slot1 = true

						break
					end
				end
			end
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_empty_pos, slot1)
end

function ElfinModel.calculateElfinCompoundRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false
	slot0.elfin_com_cost_list = {}

	if slot0.elfin_tree_data.sprites and next(slot0.elfin_tree_data.sprites) ~= nil then
		for slot5, slot6 in pairs(slot0.elfin_tree_data.sprites) do
			slot7 = Config.SpriteData.data_elfin_com[slot6.item_bid]

			if slot6.item_bid ~= 0 and slot7 and slot7.expend and next(slot7.expend) ~= nil then
				slot8 = true

				for slot12, slot13 in pairs(slot7.expend) do
					table.insert(slot0.elfin_com_cost_list, slot13)

					if slot1 == false and BackpackController:getInstance():getModel():getItemNumByBid(slot13[1]) < slot13[2] then
						slot8 = false
					end
				end

				if slot8 == true then
					slot1 = true
				end
			end
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_compound, slot1)
end

function ElfinModel.getElfinCompoundCostBidList(slot0)
	slot1 = {}

	if slot0.elfin_com_cost_list and next(slot0.elfin_com_cost_list) ~= nil then
		for slot5, slot6 in pairs(slot0.elfin_com_cost_list) do
			table.insert(slot1, slot6[1])
		end
	end

	return slot1
end

function ElfinModel.calculateElfinHigherRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false

	if slot0.elfin_tree_data.sprites and next(slot0.elfin_tree_data.sprites) ~= nil then
		for slot6, slot7 in pairs(slot0.elfin_tree_data.sprites) do
			slot8 = Config.SpriteData.data_elfin_data(slot7.item_bid)

			if slot7.item_bid ~= 0 and slot8 then
				table.insert({}, {
					step = slot8.step,
					s_type = slot8.sprite_type
				})
			end
		end

		for slot7, slot8 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.ELFIN) or {}) do
			if Config.SpriteData.data_elfin_data(slot8.base_id) then
				for slot13, slot14 in pairs(slot2) do
					if slot9.sprite_type == slot14.s_type and slot14.step < slot9.step then
						slot1 = true

						break
					end
				end
			end

			if slot1 == true then
				break
			end
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_higher_lv, slot1)
end

function ElfinModel.calculateElfinActivateRedStatus(slot0, slot1)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_activate, false)
end

function ElfinModel.checkActivateTabBtnRedStatus(slot0, slot1)
	if slot0.elfin_activate_red_data and slot0.elfin_activate_red_data[slot1] and next(slot0.elfin_activate_red_data[slot1]) ~= nil then
		return true
	end

	return false
end

function ElfinModel.clearActivateDataByIndex(slot0, slot1)
	if slot0.elfin_activate_red_data then
		slot0.elfin_activate_red_data[slot1] = {}
	end

	slot0:calculateElfinActivateRedStatus()
end

function ElfinModel.clearActivateRedData(slot0)
	slot0.elfin_activate_red_data = {}

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_activate, false)
end

function ElfinModel.clearActivateDataByBid(slot0, slot1)
	if slot0.elfin_activate_red_data then
		for slot5, slot6 in pairs(slot0.elfin_activate_red_data) do
			slot7 = false

			for slot11, slot12 in pairs(slot6) do
				if slot12 == slot1 then
					table.remove(slot6, slot11)

					slot7 = true

					break
				end
			end

			if slot7 then
				break
			end
		end
	end
end

function ElfinModel.checkIsNewActivateByBid(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.elfin_activate_red_data or {}) do
		for slot11, slot12 in pairs(slot7) do
			if slot12 == slot1 then
				slot2 = true

				break
			end
		end

		if slot2 then
			break
		end
	end

	return slot2
end

function ElfinModel.getElfinRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.elfin_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function ElfinModel.getElfinRedStatusByRedBid(slot0, slot1)
	return slot0.elfin_red_list[slot1] or false
end

function ElfinModel.calculateElfinSummonRedStatus(slot0)
	if not slot0:checkElfinIsOpen(true) then
		return
	end

	slot1 = false

	if slot0:getElfinSummonData() then
		if slot2.free_time and slot2.free_time <= GameNet:getInstance():getTime() then
			slot1 = true
		end

		if slot1 == false and slot2.lucky_ids and #slot2.lucky_ids <= 0 then
			slot1 = true
		end

		if slot1 == false and Config.HolidaySpriteLotteryData.data_award[slot2.camp_id] then
			for slot8, slot9 in pairs(slot4) do
				slot10 = false

				for slot14, slot15 in pairs(slot2.do_awards) do
					if slot9.id == slot15.award_id then
						slot10 = true

						break
					end
				end

				if slot10 == false and slot9.times <= slot2.times then
					slot1 = true

					break
				end
			end
		end
	end

	slot0:updateElfinRedStatus(HeroConst.RedPointType.eElfin_summon, slot1)
end

function ElfinModel.setElfinSummonData(slot0, slot1)
	slot0.elfin_summon_data = slot1

	slot0:calculateElfinSummonRedStatus()
end

function ElfinModel.getElfinSummonData(slot0)
	return slot0.elfin_summon_data
end

function ElfinModel.setPlanData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.elfin_plan_data == nil then
		slot0.elfin_plan_data = {}
	end

	for slot5, slot6 in ipairs(slot1.plan_list) do
		if slot0.elfin_plan_data[slot6.id] == nil then
			slot0.elfin_plan_data[slot6.id] = slot6
		else
			for slot10, slot11 in pairs(slot6) do
				slot0.elfin_plan_data[slot6.id][slot10] = slot11
			end
		end
	end
end

function ElfinModel.getPlanCount(slot0)
	if slot0.elfin_plan_data == nil then
		return 0
	end

	for slot5, slot6 in pairs(slot0.elfin_plan_data) do
		slot1 = 0 + 1
	end

	return slot1
end

function ElfinModel.getPlanData(slot0)
	return slot0.elfin_plan_data
end

function ElfinModel.__delete(slot0)
end
