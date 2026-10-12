RoleModel = RoleModel or BaseClass()

function RoleModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function RoleModel.config(slot0)
	slot0.role_vo = nil
	slot0.role_srv_day = 0
	slot0.role_register_day = 0
	slot0.world_lev = 0
	slot0.open_srv_day = 0
	slot0.privilege_data = {}
	slot0.fans_rank_data = nil
	slot0.dic_role_growth_way = nil
	slot0.dic_other_growth_way = {}
	slot0.dic_message_board_list = nil
	slot0.growth_way_carnival_data = nil
	slot0.red_point_data = {}
end

function RoleModel.setWorldLev(slot0, slot1)
	slot0.world_lev = slot1
end

function RoleModel.getWorldLev(slot0)
	return slot0.world_lev
end

function RoleModel.setOpenSrvDay(slot0, slot1)
	slot0.open_srv_day = slot1
end

function RoleModel.getOpenSrvDay(slot0)
	return slot0.open_srv_day
end

function RoleModel.setServerList(slot0, slot1)
	slot0.serverList = {}

	for slot5, slot6 in pairs(slot1) do
		slot0.serverList[slot6.srv_id] = 1
	end
end

function RoleModel.isTheSame(slot0, slot1)
	if slot0.serverList and slot1 then
		return slot0.serverList[slot1] ~= nil
	end

	return true
end

function RoleModel.initRoleBaseData(slot0, slot1)
	slot0:initAttribute(slot1)
	slot0.role_vo:dispatchUpdateBaseAttr()
end

function RoleModel.initRoleAssetsData(slot0, slot1)
	slot0:initAttribute(slot1)
end

function RoleModel.initRoleActionAssetsData(slot0, slot1, slot2)
	if not slot0.role_vo then
		slot0.role_vo = RoleVo.New()
	end

	if slot1 then
		slot0.role_vo:initActionAssetsData(slot1, slot2)
	end
end

function RoleModel.setSrvDay(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.role_srv_day = slot1.open_time or 0
	slot0.role_register_day = slot1.reg_time or 0
end

function RoleModel.getRegisterDay(slot0)
	return slot0.role_register_day or 0
end

function RoleModel.getSrvDay(slot0)
	return slot0.role_srv_day or 0
end

function RoleModel.updateRoleAssets(slot0, slot1)
	if slot0.role_vo then
		slot0.role_vo:setRoleAssset(slot1)
	end
end

function RoleModel.updateRoleHeadList(slot0, slot1)
	if slot0:getRoleVo() then
		slot0:getRoleVo():setRoleHeadList(slot1)
	end
end

function RoleModel.setRoleAttribute(slot0, slot1, slot2)
	if slot0.role_vo ~= nil then
		slot0.role_vo:setRoleAttribute(slot1, slot2)
	end
end

function RoleModel.initAttribute(slot0, slot1)
	if not slot0.role_vo then
		slot0.role_vo = RoleVo.New()
	end

	if slot1 then
		slot0.role_vo:initAttributeData(slot1)
	end
end

function RoleModel.setPrivilegeData(slot0, slot1)
	slot0.privilege_data = slot1 or {}
end

function RoleModel.getPrivilegeData(slot0)
	return slot0.privilege_data
end

function RoleModel.checkPrivilegeStatus(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.privilege_data) do
		if slot7.id == slot1 then
			slot2 = slot7.status == 1

			break
		end
	end

	return slot2
end

function RoleModel.getPrivilegeDataById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.privilege_data) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function RoleModel.getRoleVo(slot0)
	return slot0.role_vo
end

function RoleModel.getHonorPointName(slot0, slot1)
	slot2 = slot1 or 0

	if not Config.RoomFeatData.data_honor_title_info then
		return
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.min < slot1.min
	end)

	for slot8, slot9 in ipairs(slot3) do
		if slot9.min <= slot2 and slot2 <= slot9.max then
			if #slot3 <= slot8 then
				return slot9.name, slot9.res_id, -1
			else
				return slot9.name, slot9.res_id, slot3[slot8 + 1].min, slot3[slot8 + 1].name, slot3[slot8 + 1].res_id
			end
		end
	end

	if next(slot3) ~= nil then
		return slot3[slot4].name, slot3[slot4].res_id, -1
	end
end

function RoleModel.setGrowthWayData(slot0, slot1)
	slot0.growth_way_max_count = slot1.max_num

	if not slot0.dic_role_growth_way then
		slot0.dic_role_growth_way = {}
	end

	for slot5, slot6 in ipairs(slot1.progress) do
		if slot0.dic_role_growth_way[slot6.order] == nil then
			slot0.dic_role_growth_way[slot6.order] = slot6
		end
	end
end

function RoleModel.checkGrowthWayRedPoint(slot0, slot1)
	if slot0.dic_role_growth_way and slot1 and #slot1.progress > 0 and slot1.progress[1].order and slot0.dic_role_growth_way[slot2] == nil then
		return true
	end

	return false
end

function RoleModel.getGrowthWayData(slot0)
	return slot0.dic_role_growth_way or {}
end

function RoleModel.setOtherGrowthWayData(slot0, slot1)
	if not slot0.dic_other_growth_way then
		slot0.dic_other_growth_way = {}
	end

	if slot0.dic_other_growth_way[string.format("%s_%s", slot1.srv_id, slot1.rid)] == nil then
		slot0.dic_other_growth_way[slot2] = {}
	end

	for slot6, slot7 in ipairs(slot1.room_grow_info) do
		if slot0.dic_other_growth_way[slot2][slot7.order] == nil then
			slot0.dic_other_growth_way[slot2][slot7.order] = slot7
		end
	end
end

function RoleModel.getOtherGrowthWayData(slot0, slot1, slot2)
	if slot0.dic_other_growth_way == nil then
		return {}
	end

	return slot0.dic_other_growth_way[string.format("%s_%s", slot2, slot1)] or {}
end

function RoleModel.initMessageBoardData(slot0, slot1)
	if slot0.dic_message_board_list == nil then
		slot0.dic_message_board_list = {}
	end

	slot2 = nil

	if slot1.rid == nil or slot1.srv_id == nil then
		if not slot0:getRoleVo() then
			return
		end

		slot2 = slot0:getKeyBySrvidAndRid(slot3.srv_id, slot3.rid)
	else
		slot2 = slot0:getKeyBySrvidAndRid(slot1.srv_id, slot1.rid)
	end

	if slot0.dic_message_board_list[slot2] == nil then
		slot0.dic_message_board_list[slot2] = {}
	end

	slot0.message_board_max_count = slot1.max_num

	for slot6, slot7 in ipairs(slot1.room_bbs_info) do
		slot0.dic_message_board_list[slot2][slot7.bbs_id] = slot7
	end
end

function RoleModel.deleteMessageBoardDataByBbsid(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0:getRoleVo() then
		return
	end

	slot3 = slot0:getKeyBySrvidAndRid(slot2.srv_id, slot2.rid)

	if slot0.dic_message_board_list and slot0.dic_message_board_list[slot3] then
		slot0.dic_message_board_list[slot3][slot1] = nil
	end
end

function RoleModel.getKeyBySrvidAndRid(slot0, slot1, slot2)
	return string.format("%s_%s", slot1, slot2)
end

function RoleModel.getMessageBoardData(slot0, slot1, slot2)
	slot3 = slot0:getKeyBySrvidAndRid(slot1, slot2)

	if slot0.dic_message_board_list and slot0.dic_message_board_list[slot3] then
		return slot0.dic_message_board_list[slot3]
	end

	return {}
end

function RoleModel.removeMessageBoardData(slot0, slot1, slot2)
	slot3 = slot0:getKeyBySrvidAndRid(slot1, slot2)

	if slot0.dic_message_board_list and slot0.dic_message_board_list[slot3] then
		slot0.dic_message_board_list[slot3] = nil
	end
end

function RoleModel.setGrowthWayCarnivalData(slot0, slot1)
	slot0.growth_way_carnival_data = slot1
end

function RoleModel.getGrowthWayCarnivalData(slot0, slot1)
	return slot0.growth_way_carnival_data
end

function RoleModel.updateCustomFace(slot0, slot1, slot2)
	if slot0.role_vo then
		slot0.role_vo:setRoleAttribute("face_file", slot1)
		slot0.role_vo:setRoleAttribute("face_update_time", slot2)
	end
end

function RoleModel.setRedPointData(slot0, slot1)
	if slot1 then
		slot0.red_point_data = slot1.id_list
	end
end

function RoleModel.getRedPointStatus(slot0, slot1)
	if slot0.red_point_data then
		for slot5, slot6 in pairs(slot0.red_point_data) do
			if slot6.id == slot1 then
				return false
			end
		end
	end

	return true
end

function RoleModel.updateRedPointData(slot0, slot1)
	if slot0.red_point_data then
		for slot5, slot6 in pairs(slot0.red_point_data) do
			if slot6.id == slot1 then
				return
			end
		end

		table.insert(slot0.red_point_data, {
			id = slot1
		})
	end
end

function RoleModel.__delete(slot0)
	slot0.role_vo = nil
end
