RedpointController = RedpointController or BaseClass(BaseController)
slot0 = 1
slot1 = 2

function RedpointController.config(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.bind_events = {}
	slot0.all_tag_num = {}
	slot0.bind_order = 0
	slot0.all_bind_info = {}
	slot0.all_bind_tag_map = {}
	slot0.all_bind_node_map = {}
	slot0.all_bind_node_dirty_map = {}
	slot0.need_update_order = {}
	slot0.one_to_combination_map = {}

	slot0:setUpConst()
end

function RedpointController.checkRegisterEvents(slot0)
	if slot0.is_setup_event then
		return
	end

	slot0.is_setup_event = true

	if slot0.bind_events.daily_libao == nil then
		slot0.bind_events.daily_libao = GlobalEvent:getInstance():Bind(VipEvent.UPDATA_ITEM_REDPOINT, function ()
			uv0:redPointChange(RedpointConst.tequan_libao)
		end)
	end

	if slot0.bind_events.Hero_Data_Add == nil then
		slot0.bind_events.Hero_Data_Add = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Add, function (slot0)
			uv0:redPointChange(RedpointConst.stronger)

			slot4 = RedpointConst.emoguoshi

			uv0:redPointChange(slot4)

			for slot4, slot5 in pairs(slot0) do
				if YanJiuSuoController:getInstance():isMyHeroVo(slot5) or YanJiuSuoController:getInstance():isMyUpItem(slot5.bid) then
					uv0:redPointChange(RedpointConst.yanjiusuo)
				end
			end
		end)
	end

	if slot0.bind_events.emoguoshi == nil then
		slot0.bind_events.emoguoshi = GlobalEvent:getInstance():Bind(EmoguoshiEvent.ONE_INFO, function ()
			uv0:redPointChange(RedpointConst.emoguoshi)
		end)
	end

	if slot0.bind_events.item_add == nil then
		slot0.bind_events.item_add = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if not slot1 then
				return
			end

			slot2 = false
			slot3 = false

			for slot8, slot9 in pairs(slot1) do
				if slot9.config and EmoguoshiController:getInstance():isSuiPian(slot9.config.id) then
					slot2 = true
				end
			end

			if slot2 then
				uv0:redPointChange(RedpointConst.emoguoshi)
			end

			if slot3 then
				uv0:redPointChange(RedpointConst.jiyou_group_skill)
			end
		end)
	end

	if slot0.bind_events.item_delete == nil then
		slot0.bind_events.item_delete = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if not slot1 then
				return
			end

			slot2 = false
			slot3 = false

			for slot8, slot9 in pairs(slot1) do
				if slot9.config and EmoguoshiController:getInstance():isSuiPian(slot9.config.id) then
					slot2 = true
				end
			end

			if slot2 then
				uv0:redPointChange(RedpointConst.emoguoshi)
			end
		end)
	end

	if slot0.bind_events.item_change == nil then
		slot0.bind_events.item_change = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if not slot1 then
				return
			end

			slot2 = false
			slot3 = false
			slot4 = false

			for slot9, slot10 in pairs(slot1) do
				if slot10.config and EmoguoshiController:getInstance():isSuiPian(slot10.config.id) then
					slot2 = true
				end
			end

			if slot2 then
				uv0:redPointChange(RedpointConst.emoguoshi)
			end

			if slot3 then
				uv0:redPointChange(RedpointConst.jiyou_group_skill)
			end

			if slot4 then
				uv0:redPointChange(RedpointConst.yanjiusuo)
			end
		end)
	end

	if slot0.bind_events.emoguoshi_zhanling1 == nil then
		slot0.bind_events.emoguoshi_zhanling1 = GlobalEvent:getInstance():Bind(EmoguoshiEvent.ZHANLING_ALL_INFO, function ()
			uv0:redPointChange(RedpointConst.emoguoshi_zhanling)
		end)
	end

	if slot0.bind_events.emoguoshi_zhanling2 == nil then
		slot0.bind_events.emoguoshi_zhanling2 = GlobalEvent:getInstance():Bind(EmoguoshiEvent.ZHANLING_HUOYUEDU, function ()
			uv0:redPointChange(RedpointConst.emoguoshi_zhanling)
		end)
	end

	if not slot0.role_vo then
		slot0.role_vo = RoleController:getInstance():getRoleVo()

		if slot0.role_assets_event == nil then
			slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "vip_lev" then
					uv0:redPointChange(RedpointConst.tequan_libao)
				end

				if slot0 == "lev" then
					uv0:redPointChange(RedpointConst.jiyou_group_skill)
					uv0:redPointChange(RedpointConst.jiyou_touzhi)
					uv0:redPointChange(RedpointConst.jiyou_tiaozhan)
					uv0:redPointChange(RedpointConst.jiyou_taofa)
					uv0:redPointChange(RedpointConst.jiyou_choujiang)
				end
			end)
		end
	end
end

function RedpointController.setUpConst(slot0, ...)
	for slot4, slot5 in pairs(RedpointConst.combination_map) do
		for slot9, slot10 in pairs(slot5) do
			if not slot0.one_to_combination_map[slot10] then
				slot0.one_to_combination_map[slot10] = {}
			end

			table.insert(slot0.one_to_combination_map[slot10], slot4)
		end
	end
end

function RedpointController.nextBindOrder(slot0)
	slot0.bind_order = slot0.bind_order + 1

	return slot0.bind_order
end

function RedpointController.checkUpdate(slot0)
	if slot0.is_in_update then
		return
	end

	slot1 = nil

	for slot5, slot6 in pairs(slot0.need_update_order) do
		slot1 = slot5

		break
	end

	if not slot1 then
		return
	end

	slot0.is_in_update = true

	RenderMgr:getInstance():doNextFrame(function ()
		uv0.is_in_update = false
		uv0.need_update_order[uv1] = nil

		uv0:doUpdateOne(uv1)
		uv0:checkUpdate()
	end)
end

function RedpointController.setNeedFresh(slot0, slot1)
	slot0.need_update_order[slot1] = 1

	if not slot0.all_bind_info[slot1] then
		return
	end

	slot0.all_bind_node_dirty_map[slot2[3]] = 1

	slot0:checkUpdate()
end

function RedpointController.setDirty(slot0, slot1)
	slot0.all_tag_num[slot1] = nil

	if slot0.one_to_combination_map[slot1] then
		for slot5, slot6 in pairs(slot0.one_to_combination_map[slot1]) do
			slot0:setDirty(slot6)
		end
	end

	if slot0.all_bind_tag_map[slot1] then
		for slot5, slot6 in pairs(slot0.all_bind_tag_map[slot1]) do
			slot0:setNeedFresh(slot5)
		end
	end
end

function RedpointController.getNum(slot0, slot1)
	if slot0.all_tag_num[slot1] then
		return slot0.all_tag_num[slot1]
	end

	if RedpointConst.one_get_map[slot1] then
		slot0.all_tag_num[slot1] = RedpointConst.one_get_map[slot1]()

		return slot0.all_tag_num[slot1]
	elseif RedpointConst.combination_map[slot1] then
		for slot6, slot7 in pairs(RedpointConst.combination_map[slot1]) do
			slot2 = 0 + slot0:getNum(slot7)
		end

		slot0.all_tag_num[slot1] = slot2

		return slot0.all_tag_num[slot1]
	end

	return slot0.all_tag_num[slot1] or 0
end

function RedpointController.redPointChange(slot0, slot1)
	slot0:setDirty(slot1)
end

function RedpointController.unBindRedPoint(slot0, slot1)
	if not slot0.all_bind_info[slot1] then
		return
	end

	slot0.all_bind_info[slot1] = nil
	slot3 = slot2[2]
	slot0.all_bind_tag_map[slot3][slot1] = nil

	for slot7, slot8 in pairs(slot0.all_bind_tag_map[slot3]) do
		return
	end

	slot0.all_bind_tag_map[slot3] = nil
	slot4 = slot2[3]
	slot0.all_bind_node_map[slot4][slot1] = nil
	slot5 = false

	for slot9, slot10 in pairs(slot0.all_bind_node_map[slot4]) do
		slot5 = true

		slot0:setNeedFresh(slot9)
	end

	if not slot5 then
		slot0.all_bind_node_map[slot4] = nil
		slot0.all_bind_node_dirty_map[slot4] = nil
	end
end

function RedpointController.bindRedPointNode(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:checkRegisterEvents()

	if slot0.all_bind_tag_map[slot2] then
		for slot9, slot10 in pairs(slot0.all_bind_tag_map[slot2]) do
			if slot0.all_bind_info[slot9][3] == slot1 then
				return slot9
			end
		end
	end

	slot0.all_bind_info[slot0:nextBindOrder()] = {
		uv0,
		slot2,
		slot1,
		slot3,
		slot4,
		slot5
	}

	if not slot0.all_bind_tag_map[slot2] then
		slot0.all_bind_tag_map[slot2] = {}
	end

	slot0.all_bind_tag_map[slot2][slot6] = 1

	if not slot0.all_bind_node_map[slot1] then
		slot0.all_bind_node_map[slot1] = {}
	end

	slot0.all_bind_node_map[slot1][slot6] = 1

	slot0:setNeedFresh(slot6)

	return slot6
end

function RedpointController.bindRedPointCb(slot0, slot1, slot2)
	slot0:checkRegisterEvents()

	if slot0.all_bind_tag_map[slot2] then
		for slot6, slot7 in pairs(slot0.all_bind_tag_map[slot2]) do
			if slot0.all_bind_info[slot6][3] == slot1 then
				return slot6
			end
		end
	end

	slot0.all_bind_info[slot0:nextBindOrder()] = {
		uv0,
		slot2,
		slot1
	}

	if not slot0.all_bind_tag_map[slot2] then
		slot0.all_bind_tag_map[slot2] = {}
	end

	slot0.all_bind_tag_map[slot2][slot3] = 1

	if not slot0.all_bind_node_map[slot1] then
		slot0.all_bind_node_map[slot1] = {}
	end

	slot0.all_bind_node_map[slot1][slot3] = 1

	slot0:setNeedFresh(slot3)

	return slot3
end

function RedpointController.doUpdateOne(slot0, slot1)
	if not slot0.all_bind_info[slot1] then
		return
	end

	if slot2[1] == uv0 then
		slot2[3](slot2[2], slot0:getNum(slot2[2]))
	elseif slot2[1] == uv1 and slot0.all_bind_node_dirty_map[slot3] then
		slot4 = 0

		for slot8, slot9 in pairs(slot0.all_bind_node_map[slot3]) do
			if slot0.all_bind_info[slot8][1] == uv0 then
				-- Nothing
			elseif slot10[1] == uv1 then
				slot4 = slot4 + slot0:getNum(slot10[2])
			end
		end

		addRedPointToNodeByStatus(slot3, slot4 > 0, slot2[4], slot2[5])
	end

	slot0.all_bind_node_dirty_map[slot3] = nil
end

function RedpointController.__delete(slot0)
	for slot4, slot5 in pairs(slot0.bind_events) do
		GlobalEvent:getInstance():UnBind(slot5)
	end

	slot0.bind_events = {}

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end
