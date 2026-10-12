HallowsModel = HallowsModel or BaseClass()
slot0 = table.insert
slot1 = table.sort

function HallowsModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function HallowsModel.config(slot0)
	slot0.hallows_list = {}
	slot0.hallows_magic_list = {}
	slot0.magic_task_list = {}
	slot0.magic_attrs = {}
	slot0.open_flag = false
	slot0.had_request = false
	slot0.attr_ratio_list = {}
	slot0.hallows_red_list = {}
end

function HallowsModel.updateHallowsInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1.hallows) do
		if slot0.hallows_list[slot6.id] == nil then
			slot0.hallows_list[slot6.id] = HallowsVo.New()
		end

		slot7:initAttributeData(slot6)
	end

	slot0:checkHallowsRedStatus()
end

function HallowsModel.updateHallowsData(slot0, slot1)
	if slot0:getHallowsById(slot1.id) == nil then
		slot0.hallows_list[slot1.id] = HallowsVo.New()
	end

	slot2:initAttributeData(slot1)
	slot0:checkHallowsRedStatus()
end

function HallowsModel.updateHallowsRedStatus(slot0, slot1, slot2)
	if slot0.hallows_red_list[slot1] == slot2 then
		return
	end

	slot0.hallows_red_list[slot1] = slot2

	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.hallows, {
		bid = slot1,
		status = slot2
	})
	GlobalEvent:getInstance():Fire(HallowsEvent.HallowsRedStatus, slot1, slot2)
end

function HallowsModel.checkRedIsShowByRedType(slot0, slot1)
	return slot0.hallows_red_list[slot1] or false
end

function HallowsModel.getHallowsRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.hallows_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function HallowsModel.sortHallowsFunc(slot0, slot1, slot2)
	if slot1.step ~= slot2.step then
		return slot2.step < slot1.step
	elseif slot1.lucky ~= slot2.lucky then
		return slot2.lucky < slot1.lucky
	else
		return slot2.id < slot1.id
	end
end

function HallowsModel.checkHallowsRedStatus(slot0)
	slot1 = false

	if slot0:checkIsHaveAllHallows() then
		slot2 = deepCopy(slot0.hallows_list)

		uv0(slot2, function (slot0, slot1)
			return uv0:sortHallowsFunc(slot0, slot1)
		end)

		if slot2[1] then
			slot0:setRedHallowsId(slot3.id)

			slot4 = RoleController:getInstance():getRoleVo()

			if Config.HallowsData.data_info(getNorKey(slot3.id, slot3.step)).loss and next(slot6) ~= nil then
				for slot10, slot11 in pairs(slot6) do
					slot14 = 0

					if ((not Config.ItemData.data_assets_id2label[slot11[1]] or slot4[slot15]) and BackpackController:getInstance():getModel():getItemNumByBid(slot12)) < slot11[2] then
						slot1 = false

						break
					else
						slot1 = true
					end
				end
			end

			slot0:updateHallowsRedStatus(HallowsConst.Red_Index.hallows_lvup, slot1)

			slot1 = false

			if Config.HallowsData.data_skill_up(getNorKey(slot3.id, slot3.skill_lev)) and slot7.lev_limit ~= 0 and slot7.lev_limit <= slot3.step and slot7.lose and next(slot8) ~= nil then
				for slot12, slot13 in pairs(slot8) do
					slot16 = 0

					if ((not Config.ItemData.data_assets_id2label[slot13[1]] or slot4[slot17]) and BackpackController:getInstance():getModel():getItemNumByBid(slot14)) < slot13[2] then
						slot1 = false

						break
					else
						slot1 = true
					end
				end
			end

			slot0:updateHallowsRedStatus(HallowsConst.Red_Index.skill_lvup, slot1)

			slot1 = false

			if slot0:getHallowsRefineIsOpen() and Config.HallowsRefineData.data_refine[slot3.id] and slot9[slot3.refine_lev + 1] then
				if slot10.expend and slot10.need_lev <= slot3.step then
					for slot16, slot17 in pairs(slot11) do
						if BackpackController:getInstance():getModel():getItemNumByBid(slot17[1]) < slot17[2] then
							slot1 = false

							break
						else
							slot1 = true
						end
					end
				end
			end

			slot0:updateHallowsRedStatus(HallowsConst.Red_Index.refine_lvup, slot1)

			slot1 = false
			slot10 = Config.HallowsData.data_const.id_stone

			if Config.HallowsData.data_trace_cost(getNorKey(slot3.id, slot3.step)) and slot10 then
				if slot3.seal < slot9.num and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot10.val) > 0 then
					slot1 = true
				end
			end

			slot0:updateHallowsRedStatus(HallowsConst.Red_Index.stone_use, slot1)
		end

		if slot0:checkRedIsShowByRedType(HallowsConst.Red_Index.task_award) then
			slot0:updateHallowsRedStatus(HallowsConst.Red_Index.task_award, false)
		end
	else
		slot0:updateHallowsRedStatus(HallowsConst.Red_Index.task_award, slot0:checkHallowsAwardTips())
	end
end

function HallowsModel.setRedHallowsId(slot0, slot1)
	slot0.red_hallows_id = slot1
end

function HallowsModel.getRedHallowsId(slot0)
	return slot0.red_hallows_id
end

function HallowsModel.getHallowsById(slot0, slot1)
	return slot0.hallows_list[slot1]
end

function HallowsModel.curTotalStep(slot0)
	for slot5, slot6 in pairs(slot0.hallows_list) do
		slot1 = 0 + slot6.step
	end

	return slot1
end

function HallowsModel.getHallowsList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.hallows_list) do
		uv0(slot1, slot6)
	end

	return slot1
end

function HallowsModel.getResonateLev(slot0)
	return 0
end

function HallowsModel.getRatio(slot0, slot1, slot2)
	return slot0.attr_ratio_list[getNorKey(slot1, slot2)]
end

function HallowsModel.updateHallowsTask(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if slot0.hallows_task_list == nil then
		slot0.hallows_task_list = {}
	end

	for slot5, slot6 in ipairs(slot1) do
		slot0.hallows_task_list[slot6.id] = slot6
	end

	slot0:checkHallowsRedStatus()
	GlobalEvent:getInstance():Fire(HallowsEvent.UpdateHallowsTaskEvent)
end

function HallowsModel.getHallowsTaskList(slot0, slot1)
	slot2 = {}
	slot3 = Config.HallowsData.data_task

	if slot0.hallows_task_list then
		for slot7, slot8 in pairs(slot0.hallows_task_list) do
			if slot3[slot8.id] and slot9.hid == slot1 then
				uv0(slot2, slot8)
			end
		end
	end

	if next(slot2) then
		uv1(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	return slot2
end

function HallowsModel.getHallowsTaks(slot0, slot1)
	if slot0.hallows_task_list then
		return slot0.hallows_task_list[slot1]
	end
end

function HallowsModel.getCurActivityHallowsId(slot0)
	if slot0.hallows_list == nil or next(slot0.hallows_list) == nil then
		return 1
	end

	for slot5, slot6 in pairs(slot0.hallows_list) do
		if 0 < slot6.id then
			slot1 = slot6.id
		end
	end

	return slot1 + 1
end

function HallowsModel.checkHallowsAwardTips(slot0)
	if slot0.hallows_task_list == nil or next(slot0.hallows_task_list) == nil then
		return false
	end

	if slot0:getHallowsTaskList(slot0:getCurActivityHallowsId()) == nil or next(slot2) == nil then
		return false
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot7.finish == 1 then
			return true
		end
	end

	return false
end

function HallowsModel.checkIsHaveAllHallows(slot0)
	slot1 = Config.HallowsData.data_base_length

	for slot6, slot7 in pairs(slot0.hallows_list) do
		slot2 = 0 + 1
	end

	return slot1 <= slot2
end

function HallowsModel.setOpenHallowsFlag(slot0, slot1)
	slot0.open_flag = slot1
end

function HallowsModel.getHallowsOpenFlag(slot0)
	return slot0.open_flag
end

function HallowsModel.makeHighestHallowVo(slot0, slot1)
	if slot1 then
		slot2 = HallowsVo.New()
		slot5 = Config.HallowsRefineData.data_max_lev[slot1]
		slot12 = Config.HallowsData.data_skill_max_lev[slot1]
		slot7 = Config.HallowsData.data_skill_up(getNorKey(slot1, slot12))
		slot8 = {}

		for slot12, slot13 in pairs(Config.HallowsData.data_info(getNorKey(slot1, Config.HallowsData.data_max_lev[slot1])).attr) do
			uv0(slot8, {
				attr_id = Config.AttrData.data_key_to_id[slot13[1]],
				attr_val = slot13[2]
			})
		end

		slot2.id = slot1
		slot2.step = slot3
		slot2.add_attr = slot8
		slot2.skill_bid = slot7.skill_bid
		slot2.skill_lev = slot4
		slot2.refine_lev = slot5

		if slot0:getHallowsById(slot1) then
			slot2.look_id = slot9.look_id
		end

		return slot2
	end
end

function HallowsModel.setHallowsMagicData(slot0, slot1)
	slot0.hallows_magic_list = slot1 or {}

	slot0:calculateHallowsMagicAttrs()
end

function HallowsModel.getHallowsMagicData(slot0)
	return slot0.hallows_magic_list or {}
end

function HallowsModel.checkIsHaveHallowsMagic(slot0)
	if not slot0.hallows_magic_list or next(slot0.hallows_magic_list) == nil then
		return false
	else
		return true
	end
end

function HallowsModel.getHallowsMagicDataById(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.hallows_magic_list) do
		if slot7.id == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function HallowsModel.checkHallowsMagicIsHave(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.hallows_magic_list) do
		if slot7.id == slot1 then
			slot2 = true

			break
		end
	end

	return slot2
end

function HallowsModel.getHallowsMagicStatus(slot0, slot1)
	slot2 = HallowsConst.Magic_status.Lock

	if slot0:checkHallowsMagicIsHave(slot1) then
		slot2 = HallowsConst.Magic_status.Have
	elseif Config.HallowsData.data_magic[slot1] and slot3.is_item ~= 2 then
		if slot3.is_item == 0 then
			for slot8, slot9 in pairs(slot0:getMagicTaskListById(slot1)) do
				if slot9.finish == 0 then
					slot2 = HallowsConst.Magic_status.Lock

					break
				else
					slot2 = HallowsConst.Magic_status.CanHave
				end
			end
		elseif slot3.is_item == 1 and slot3.loss[1] and slot3.loss[1][2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot3.loss[1][1]) then
			slot2 = HallowsConst.Magic_status.CanHave
		end
	else
		slot2 = HallowsConst.Magic_status.Lock
	end

	return slot2
end

function HallowsModel.updateHallowsMagicData(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.hallows_magic_list) do
		if slot7.id == slot1.id then
			for slot11, slot12 in pairs(slot1) do
				slot7[slot11] = slot12
			end

			slot2 = true

			break
		end
	end

	if not slot2 then
		table.insert(slot0.hallows_magic_list, slot1)
	end

	slot0:calculateHallowsMagicAttrs()
end

function HallowsModel.deleteHallowsMagicById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.hallows_magic_list) do
		if slot6.id == slot1 then
			table.remove(slot0.hallows_magic_list, slot5)

			break
		end
	end

	slot0:calculateHallowsMagicAttrs()
end

function HallowsModel.setHallowsMagicTaskData(slot0, slot1)
	slot0.magic_task_list = {}

	for slot5, slot6 in pairs(slot1 or {}) do
		if Config.HallowsData.data_magic_task[slot6.id] then
			if slot0.magic_task_list[slot7.hid] == nil then
				slot0.magic_task_list[slot7.hid] = {}
			end

			table.insert(slot0.magic_task_list[slot7.hid], slot6)
		end
	end

	slot0:checkMagicTaskRedStatus()
end

function HallowsModel.updateHallowsMagicTaskData(slot0, slot1)
	for slot5, slot6 in pairs(slot1 or {}) do
		if Config.HallowsData.data_magic_task[slot6.id] then
			if slot0.magic_task_list[slot7.hid] == nil then
				slot0.magic_task_list[slot7.hid] = {}

				table.insert(slot0.magic_task_list[slot7.hid], slot6)
			else
				slot11 = slot7.hid

				for slot11, slot12 in pairs(slot0.magic_task_list[slot11]) do
					if slot12.id == slot6.id then
						for slot16, slot17 in pairs(slot6) do
							slot12[slot16] = slot17
						end

						break
					end
				end
			end
		end
	end

	slot0:checkMagicTaskRedStatus()
end

function HallowsModel.checkHallowsMagicIsShowRed(slot0, slot1)
	if slot0:checkHallowsMagicIsHave(slot1) then
		return false
	end

	slot2 = false

	if Config.HallowsData.data_magic[slot1] then
		if slot3.is_item == 0 then
			for slot8, slot9 in pairs(slot0:getMagicTaskListById(slot1)) do
				if slot9.finish == 1 then
					slot2 = true

					break
				end
			end
		elseif slot3.is_item == 1 and slot3.loss[1] and slot3.loss[1][2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot3.loss[1][1]) then
			slot2 = true
		end
	end

	return slot2
end

function HallowsModel.checkMagicTaskRedStatus(slot0)
	slot1 = false
	slot2 = RoleController:getInstance():getRoleVo()

	if Config.HallowsData.data_const.illusion_open and slot2 and slot3.val <= slot2.lev then
		for slot7, slot8 in pairs(slot0.magic_task_list) do
			for slot12, slot13 in pairs(slot8) do
				if slot13.finish == 1 then
					slot1 = true

					break
				end
			end
		end
	end

	slot0:updateHallowsRedStatus(HallowsConst.Red_Index.magic_task, slot1)
end

function HallowsModel.getMagicTaskListById(slot0, slot1)
	slot2 = {}
	slot3 = Config.HallowsData.data_magic_task

	if slot0.magic_task_list then
		slot2 = slot0.magic_task_list[slot1] or {}
	end

	if next(slot2) then
		uv0(slot2, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	return slot2
end

function HallowsModel.getHallowsEffectByMagicId(slot0, slot1)
	if Config.HallowsData.data_magic[slot1] then
		return slot2.effect
	end
end

function HallowsModel.calculateHallowsMagicAttrs(slot0)
	slot0.magic_attrs = {}

	for slot4, slot5 in pairs(slot0.hallows_magic_list) do
		if Config.HallowsData.data_magic[slot5.id] then
			for slot10, slot11 in pairs(slot6.attr) do
				if slot0.magic_attrs[slot11[1]] == nil then
					slot0.magic_attrs[slot12] = slot11[2]
				else
					slot0.magic_attrs[slot12] = slot0.magic_attrs[slot12] + slot13
				end
			end
		end
	end
end

function HallowsModel.getHallowsMagicAttrByKey(slot0, slot1)
	return slot0.magic_attrs[slot1] or 0
end

function HallowsModel.getHallowsRefineIsOpen(slot0)
	slot1 = false
	slot2 = RoleController:getInstance():getRoleVo()

	if Config.HallowsRefineData.data_const.open_lev and slot2 and slot3.val <= slot2.lev then
		slot1 = true
	end

	return slot1
end

function HallowsModel.__delete(slot0)
end
