RolePersonalSpaceTabHonorWallPanel = class("RolePersonalSpaceTabHonorWallPanel", function ()
	return ccui.Widget:create()
end)
slot1 = RoleController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = math.floor

function RolePersonalSpaceTabHonorWallPanel.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:loadResources()
end

function RolePersonalSpaceTabHonorWallPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("rolehonorwall", "rolehonorwall"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if tolua.isnull(uv0) then
			return
		end

		uv0:layoutUI()
		uv0:registerEvents()

		uv0.is_load_completed = true

		if uv0.visible_status then
			uv0:setVisibleStatus(true)
		end
	end)
end

function RolePersonalSpaceTabHonorWallPanel.setVisibleStatus(slot0, slot1)
	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 and slot0.is_load_completed then
		GlobalEvent:getInstance():Fire(RoleEvent.ROLE_PS_CHANGE_PANEL_EVENT)

		if not slot0.is_init then
			if slot0.parent.role_type == RoleConst.role_type.eMySelf then
				uv0:send25806(slot0.role_vo.rid, slot0.role_vo.srv_id)
			elseif slot0.parent.other_data then
				uv0:send25806(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id)
			end
		end
	end
end

function RolePersonalSpaceTabHonorWallPanel.config(slot0)
end

function RolePersonalSpaceTabHonorWallPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_personal_space_tab_honor_wall_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot2 = PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "role_honor_wall_bg", false)

	if slot0.record_title_img_res == nil or slot0.record_title_img_res ~= slot2 then
		slot0.record_title_img_res = slot2
		slot0.item_load_title_img_res = loadSpriteTextureFromCDN(slot0.title_img, slot2, ResourcesType.single, slot0.item_load_title_img_res)
	end

	slot0.progress_node = slot0.main_container:getChildByName("progress_node")
	slot0.honor_btn = slot0.main_container:getChildByName("honor_btn")
	slot0.honor_icon = slot0.honor_btn:getChildByName("honor_icon")
	slot0.honor_count = slot0.main_container:getChildByName("honor_count")
	slot0.honor_name = slot0.main_container:getChildByName("honor_name")
	slot0.reward_count = slot0.main_container:getChildByName("reward_count")
	slot0.reward_per = slot0.main_container:getChildByName("reward_per")
	slot0.share_btn = slot0.main_container:getChildByName("share_btn")

	slot0.share_btn:getChildByName("label"):setString(TI18N("分享"))

	slot0.show_set_btn = slot0.main_container:getChildByName("show_set_btn")

	slot0.show_set_btn:getChildByName("label"):setString(TI18N("展示设置"))

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
end

function RolePersonalSpaceTabHonorWallPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		uv0:onShareBtn(slot1)
	end, true, 1)
	registerButtonEventListener(slot0.show_set_btn, function ()
		uv0:onShowSetBtn()
	end, true, 1)
	registerButtonEventListener(slot0.honor_btn, function ()
		uv0:onHonorBtn()
	end, true, 1)

	if slot0.get_honor_wall_event == nil then
		slot0.get_honor_wall_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_GET_HONOR_WALL_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_init = true

			uv0:setData(slot0)
		end)
	end

	if slot0.update_honor_wall_event == nil then
		slot0.update_honor_wall_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_UPDATE_HONOR_WALL_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.dic_use_honor_icon_list then
				if slot0.id == 0 then
					uv0.dic_use_honor_icon_list[slot0.pos] = nil
				else
					uv0.dic_use_honor_icon_list[slot0.pos] = {
						pos = slot0.pos,
						id = slot0.id
					}
				end
			end
		end)
	end
end

function RolePersonalSpaceTabHonorWallPanel.onHonorBtn(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		slot3, slot4, slot5 = uv0:getHonorPointName(slot0.scdata.point or 0)

		if slot5 == -1 then
			TipsController:getInstance():openHonorLevelTips(true, {
				point = slot2,
				num = slot0.active_count,
				role_data = slot0.role_vo,
				show_type = RoleConst.role_type.eMySelf
			})
		else
			TipsController:getInstance():openHonorNextLevelTips(true, slot1)
		end
	else
		TipsController:getInstance():openHonorLevelTips(true, {
			point = slot0.scdata.point or 0,
			num = slot0.active_count,
			role_data = slot0.parent.other_data,
			show_type = RoleConst.role_type.eOther,
			is_hide_btn_label = true
		})
	end
end

function RolePersonalSpaceTabHonorWallPanel.onShareBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	TaskController:getInstance():openTaskSharePanel(true, {
		world_pos = slot1:convertToWorldSpace(cc.p(0.5, 0.5)),
		callback = function (slot0)
			if tolua.isnull(uv0) then
				return
			end

			uv0:shareCallback(slot0)
		end
	})
end

function RolePersonalSpaceTabHonorWallPanel.shareCallback(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot1 == VedioConst.Share_Btn_Type.eWorldBtn then
		uv0:send25819(ChatConst.Channel.World)
	elseif slot1 == VedioConst.Share_Btn_Type.eGuildBtn then
		uv0:send25819(ChatConst.Channel.Gang)
	elseif slot1 == VedioConst.Share_Btn_Type.eCrossBtn then
		uv0:send25819(ChatConst.Channel.Cross)
	end
end

function RolePersonalSpaceTabHonorWallPanel.onShowSetBtn(slot0)
	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf and slot0.dic_use_honor_icon_list then
		uv0:openRoleSelectHonorListPanel(true, {
			use_honor_icon_list = deepCopy(slot0.dic_use_honor_icon_list),
			active_list = slot0.active_list
		})
	end
end

function RolePersonalSpaceTabHonorWallPanel.initdata(slot0)
	if not slot0.scdata then
		return
	end

	if not Config.RoomFeatData.data_honor_icon_info then
		return
	end

	slot2 = #Config.RoomFeatData.data_show_list[0]
	slot3 = {}

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		slot4 = {
			[slot9.id] = slot9
		}

		for slot8, slot9 in ipairs(slot0.scdata.honor_badges) do
			-- Nothing
		end

		slot0.dic_use_honor_icon_list = {}
		slot0.active_list = {}

		for slot8, slot9 in ipairs(slot0.scdata.use_badges) do
			if slot4[slot9.id] then
				slot0.dic_use_honor_icon_list[slot9.pos] = slot9
				slot0.dic_use_honor_icon_list[slot9.pos].time = slot4[slot9.id].time or 0
			end
		end

		slot5 = 0

		for slot10, slot11 in pairs(slot1) do
			slot12 = nil

			if slot4[slot10] then
				slot4[slot10].lock = 0
				slot4[slot10].config = slot11
				slot12 = slot4[slot10]

				if slot11.is_show == 1 then
					slot6 = 0 + 1
				else
					slot5 = slot5 + 1
				end

				uv0(slot0.active_list, slot12)
			else
				slot12 = {
					id = slot10,
					lock = 1,
					config = slot11
				}
			end

			if slot3[slot11.type_id] == nil then
				slot3[slot11.type_id] = {}
			end

			if slot12.lock == 1 and slot11.is_show ~= 1 or slot12.lock == 0 then
				uv0(slot3[slot11.type_id], slot12)
			end
		end

		slot0.active_count = slot5 + slot6
		slot0.total_count = slot2 + slot6
	else
		slot4 = 0
		slot5 = 0

		for slot9, slot10 in ipairs(slot0.scdata.honor_badges) do
			if slot1[slot10.id] then
				slot10.config = slot11
				slot10.lock = 0

				if slot3[slot11.type_id] == nil then
					slot3[slot11.type_id] = {}
				end

				if slot11.is_show == 1 then
					slot5 = slot5 + 1
				else
					slot4 = slot4 + 1
				end

				uv0(slot3[slot11.type_id], slot10)
			end
		end

		slot0.active_count = slot4 + slot5
		slot0.total_count = slot2 + slot5
	end

	slot0.show_list = {}

	for slot7, slot8 in pairs(slot3) do
		uv1(slot8, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		if #slot8 > 0 then
			for slot14 = 1, uv2((slot9 - 1) / 4) + 1 do
				slot15 = {
					type_id = slot7,
					sort_index = slot14,
					honor_item_list = {}
				}
				slot15.honor_item_list[1] = slot8[(slot14 - 1) * 4 + 1]
				slot15.honor_item_list[2] = slot8[(slot14 - 1) * 4 + 2]
				slot15.honor_item_list[3] = slot8[(slot14 - 1) * 4 + 3]
				slot15.honor_item_list[4] = slot8[(slot14 - 1) * 4 + 4]

				if slot8[slot14] then
					if slot14 == 1 then
						slot15.title_name = slot8[slot14].config.type_name
					end

					uv0(slot0.show_list, slot15)
				end
			end
		end
	end

	uv1(slot0.show_list, SortTools.tableCommonSorter({
		{
			"type_id",
			false
		},
		{
			"sort_index",
			false
		}
	}))

	if #slot0.show_list < 4 then
		for slot8 = 1, 4 do
			if slot0.show_list[slot8] == nil then
				slot0.show_list[slot8] = {
					honor_item_list = {}
				}
			end
		end
	end
end

function RolePersonalSpaceTabHonorWallPanel.setData(slot0, slot1)
	slot0.scdata = slot1

	slot0:initdata()

	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	slot2 = slot0.scdata.point or 0

	slot0.honor_count:setString(slot2)

	slot3, slot4 = uv0:getHonorPointName(slot2)

	slot0.honor_name:setString(slot3 or "")

	slot5 = PathTool.getPlistImgForDownLoad("rolehonorwall/honorwarllicon", "honor_level_" .. (slot4 or 1), false)

	if slot0.record_honor_icon_res == nil or slot0.record_honor_icon_res ~= slot5 then
		slot0.record_honor_icon_res = slot5
		slot0.item_load_honor_icon = loadSpriteTextureFromCDN(slot0.honor_icon, slot5, ResourcesType.single, slot0.item_load_honor_icon)
	end

	slot0.reward_count:setString(slot0.active_count or 0)

	if (slot0.total_count or 0) == 0 then
		slot0.reward_per:setString("0%")
		slot0:showProgress(true, 0, "0/0")
	else
		slot8 = math.floor(slot6 * 100 / slot7)

		slot0.reward_per:setString(slot8 .. "%")
		slot0:showProgress(true, slot8, uv1("%s/%s", slot6, slot7))
	end

	if slot0.parent.role_type ~= RoleConst.role_type.eMySelf then
		slot0.share_btn:setVisible(false)
		slot0.show_set_btn:setVisible(false)
	end

	slot0:updateHonorItemlist()
end

function RolePersonalSpaceTabHonorWallPanel.showProgress(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.comp_bar == nil then
			slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), cc.size(315, 19), slot0.progress_node, cc.p(0.5, 0.5), 0, 0, true, true)
		else
			slot0.comp_bar_bg:setVisible(true)
		end

		if not slot0.comp_bar_label then
			slot4 = cc.size(315, 19)
			slot0.comp_bar_label = createLabel(16, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot4.width / 2, slot4.height / 2, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))
		end

		slot0.comp_bar:setPercent(slot2)
		slot0.comp_bar_label:setString(slot3)
	elseif slot0.comp_bar_bg then
		slot0.comp_bar_bg:setVisible(false)
	end
end

function RolePersonalSpaceTabHonorWallPanel.updateHonorItemlist(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 620,
			item_height = 197,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true)
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function RolePersonalSpaceTabHonorWallPanel.createNewCell(slot0, slot1, slot2)
	return RoleHonorWallItem.new(slot1, slot2, slot0.parent)
end

function RolePersonalSpaceTabHonorWallPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RolePersonalSpaceTabHonorWallPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function RolePersonalSpaceTabHonorWallPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end
end

function RolePersonalSpaceTabHonorWallPanel.DeleteMe(slot0)
	if slot0.get_honor_wall_event then
		GlobalEvent:getInstance():UnBind(slot0.get_honor_wall_event)

		slot0.get_honor_wall_event = nil
	end

	if slot0.update_honor_wall_event then
		GlobalEvent:getInstance():UnBind(slot0.update_honor_wall_event)

		slot0.update_honor_wall_event = nil
	end

	if slot0.item_load_honor_icon then
		slot0.item_load_honor_icon:DeleteMe()

		item_load_honor_icon = nil
	end

	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	slot0.role_vo = nil
end

RoleHonorWallItem = class("RoleHonorWallItem", function ()
	return ccui.Widget:create()
end)

function RoleHonorWallItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function RoleHonorWallItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_honor_wall_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot7 = "title_name"
	slot0.title_name = slot0.main_container:getChildByName(slot7)
	slot0.item_load_list = {}
	slot0.item_list = {}

	for slot7 = 1, 4 do
		slot8 = slot0.main_container:getChildByName("item_bg_" .. slot7)
		slot0.item_list[slot7] = {
			item_btn = slot8
		}

		slot0.item_list[slot7].item_btn:setSwallowTouches(false)

		slot0.item_list[slot7].honor_item = RoleHonorItem.new(0.6)

		slot8:getChildByName("item_node"):addChild(slot0.item_list[slot7].honor_item)

		slot0.item_list[slot7].lock_img = slot8:getChildByName("lock_img")
		slot0.item_list[slot7].honor_name = slot8:getChildByName("honor_name")
	end
end

function RoleHonorWallItem.register_event(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		registerButtonEventListener(slot5.item_btn, function ()
			uv0:onClickItemBtn(uv1)
		end, false, 1, nil, , , true)
	end
end

function RoleHonorWallItem.onClickItemBtn(slot0, slot1)
	if not slot0.data then
		return
	end

	if slot0.data.honor_item_list[slot1] ~= nil then
		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			-- Nothing
		else
			slot2.config = slot0.data.honor_item_list[slot1].config
			slot2.show_type = RoleConst.role_type.eOther

			if slot0.parent.other_data then
				slot2.have_name = slot0.parent.other_data.name
			end

			slot2.have_time = slot0.data.honor_item_list[slot1].time
		end

		TipsController:getInstance():openHonorIconTips(true, {
			config = slot0.data.honor_item_list[slot1].config,
			have_time = slot0.data.honor_item_list[slot1].time
		})
	end
end

function RoleHonorWallItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1.title_name then
		slot0.title_img:setVisible(true)
		slot0.title_name:setVisible(true)
		slot0.title_name:setString(slot1.title_name)
	else
		slot0.title_img:setVisible(false)
		slot0.title_name:setVisible(false)
	end

	for slot6, slot7 in ipairs(slot0.item_list) do
		if (slot1.honor_item_list or {})[slot6] then
			slot7.honor_name:setVisible(true)
			slot7.honor_name:setString(slot8.config.name)
			slot7.honor_item:setVisible(true)
			slot7.honor_item:setData(slot8)

			if slot8.lock == 1 then
				slot7.lock_img:setVisible(true)
				slot7.honor_item:setIconUnEnabled(true)
				slot7.honor_item:setShowEffect(false)
			else
				slot7.lock_img:setVisible(false)
				slot7.honor_item:setIconUnEnabled(false)
				slot7.honor_item:setShowEffect(true)
			end
		else
			slot7.honor_name:setVisible(false)
			slot7.honor_item:setVisible(false)
			slot7.lock_img:setVisible(false)
		end
	end
end

function RoleHonorWallItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.honor_item:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
