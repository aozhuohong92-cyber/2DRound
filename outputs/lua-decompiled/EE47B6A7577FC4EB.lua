FunctionIconVo = FunctionIconVo or BaseClass(EventDispatcher)
FunctionIconVo.UPDATE_SELF_EVENT = "FunctionIconVo.UPDATE_SELF_EVENT"
FunctionIconVo.type = {
	right_top_2 = 2,
	right_bottom_1 = 3,
	left_top = 5,
	right_bottom_2 = 4,
	right_top_1 = 1
}

function FunctionIconVo.__init(slot0, slot1, slot2)
	slot0.config = slot1 or {}
	slot0.pos = slot0.config.type or 1
	slot0.sort = slot0.config and slot0.config.index or 1
	slot0.is_new = false
	slot0.is_lock = slot2
	slot0.tips_status = false
	slot0.res_id = slot0.config.icon_res
	slot0.unclick = false
	slot0.status = 0
	slot0.end_time = 0
	slot0.action_id = 0
	slot0.dynamicres_id = 0
	slot0.real_name = ""
	slot0.real_res_id = ""
	slot0.tips_status_list = {}
end

function FunctionIconVo.setConfig(slot0, slot1)
	slot0.config = slot1
end

function FunctionIconVo.setLock(slot0, slot1)
	slot0.is_lock = slot1
end

function FunctionIconVo.setUnclick(slot0, slot1)
	slot0.unclick = slot1
end

function FunctionIconVo.update(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if #slot1 == 1 then
		if type(slot1[1]) == "table" then
			slot0.id = slot2.id
			slot0.status = slot2.status
			slot0.int_args = slot2.int_args

			if slot0.int_args and next(slot0.int_args) ~= nil then
				slot0.end_time = slot0.int_args[1].val or 0
			end

			if slot2.ext_args and next(slot3) then
				for slot7, slot8 in pairs(slot3) do
					if slot8.type == 1 then
						slot0.dynamicres_id = slot8.val
						slot0.real_name = slot8.str

						if slot8.val ~= 0 then
							slot0:changeDynamicResId()
						end

						break
					end
				end
			end
		elseif type(slot2) == "number" then
			slot0.status = slot2
		elseif type(slot2) == "string" and Config.FunctionData.data_convert_icon[slot2] then
			if slot2 == "xiariji" then
				slot4 = 0

				if PLATFORM_NAME == "symix" or PLATFORM_NAME == "symix2" then
					slot4 = 1
				end

				if slot3[slot4] then
					slot0.real_name = slot3[slot4].icon_name
					slot0.real_res_id = slot3[slot4].icon_res
				end
			elseif slot3[0] then
				slot0.real_name = slot3[0].icon_name
				slot0.real_res_id = slot3[0].icon_res
			end
		end
	elseif #slot1 >= 2 then
		slot0.status = slot1[1] or 0
		slot0.end_time = slot1[2] or 0
	end

	slot0:Fire(FunctionIconVo.UPDATE_SELF_EVENT)
end

function FunctionIconVo.setTipsStatus(slot0, slot1)
	if type(slot1) == "table" then
		if slot1.bid ~= nil then
			slot0.tips_status_list[slot1.bid] = slot1
		else
			for slot5, slot6 in pairs(slot1) do
				if slot6.bid ~= nil then
					slot0.tips_status_list[slot6.bid] = slot6
				end
			end
		end
	elseif slot1 ~= nil then
		slot0.tips_status = slot1
	else
		slot0.tips_status = not slot0.tips_status
	end

	slot0:Fire(FunctionIconVo.UPDATE_SELF_EVENT, "tips_status")
end

function FunctionIconVo.getTipsStatus(slot0)
	for slot4, slot5 in pairs(slot0.tips_status_list) do
		if slot5.num ~= nil and type(slot5.num) == "number" and slot5.num > 0 then
			return true
		end
	end

	return slot0.tips_status
end

function FunctionIconVo.getTipsNum(slot0)
	slot1 = 0

	if slot0.tips_status_list and next(slot0.tips_status_list) then
		for slot5, slot6 in pairs(slot0.tips_status_list) do
			slot1 = slot1 + (slot6.num or 0)
		end
	end

	return slot1
end

function FunctionIconVo.changeDynamicResId(slot0)
	if slot0.dynamicres_id == 0 then
		return
	end

	slot0:changeIcon("icon_" .. slot0.dynamicres_id)
end

function FunctionIconVo.getBattleIconRes(slot0)
	return slot0.dynamicres_id or 1
end

function FunctionIconVo.changeIcon(slot0, slot1)
	slot0.res_id = slot1

	slot0:Fire(FunctionIconVo.UPDATE_SELF_EVENT, "res_id")
end

function FunctionIconVo.changeTime(slot0, slot1)
	slot0.end_time = slot1

	slot0:Fire(FunctionIconVo.UPDATE_SELF_EVENT, "end_time")
end

function FunctionIconVo.getID(slot0)
	if slot0.config ~= nil then
		return slot0.config.id
	end

	return 0
end
