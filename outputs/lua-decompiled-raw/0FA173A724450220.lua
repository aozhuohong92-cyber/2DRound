RoleSelectHonorListPanel = RoleSelectHonorListPanel or BaseClass(BaseView)
slot1 = RoleController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove
slot5 = table.sort

function RoleSelectHonorListPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "roleinfo/role_select_honor_list_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("rolehonorwall", "rolehonorwall"),
			type = ResourcesType.plist
		}
	}
end

function RoleSelectHonorListPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("展示设置"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot6 = PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "role_honor_wall_desk", false)
	slot0.item_load_title_img = loadSpriteTextureFromCDN(slot0.title_img, slot6, ResourcesType.single, slot0.item_load_title_img)
	slot0.item_load_list = {}
	slot0.item_list = {}

	for slot6 = 1, 3 do
		slot7 = slot0.main_container:getChildByName("item_bg_" .. slot6)
		slot0.item_list[slot6] = {
			item_btn = slot7,
			honor_item = RoleHonorItem.new(0.6)
		}

		slot7:getChildByName("item_node"):addChild(slot0.item_list[slot6].honor_item)

		slot0.item_list[slot6].change_img = slot7:getChildByName("lock_img")
	end

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot0.tip_name = slot0.main_container:getChildByName("tip_name")

	slot0.tip_name:setString(TI18N("选择展示的徽章将其显示在个人信息面板中"))
end

function RoleSelectHonorListPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 1)

	slot4 = handler(slot0, slot0.onClickBtnClose)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.item_list) do
		registerButtonEventListener(slot5.item_btn, function ()
			uv0:onChangeBtn(uv1)
		end, false, 1)
	end

	slot0:addGlobalEvent(RoleEvent.ROLE_UPDATE_HONOR_WALL_EVENT, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.show_list then
			return
		end

		uv0:updateEquipInfo(slot0)
	end)
end

function RoleSelectHonorListPanel.onClickBtnClose(slot0)
	uv0:openRoleSelectHonorListPanel(false)
end

function RoleSelectHonorListPanel.onChangeBtn(slot0, slot1)
	if not slot0.item_list then
		return
	end

	if slot0.item_list[slot1] and slot0.item_list[slot1].can_touch then
		for slot5, slot6 in ipairs(slot0.item_list) do
			slot6.can_touch = false

			slot6.change_img:setVisible(false)
		end

		if slot0.select_index ~= 0 and slot0.show_list[slot0.select_index] then
			uv0:send25805(slot1, slot0.show_list[slot0.select_index].id)
		end
	end
end

function RoleSelectHonorListPanel.updateEquipInfo(slot0, slot1)
	if slot1.id == 0 then
		if slot0.honor_list[slot1.pos] then
			slot0.dic_honor_data[slot0.honor_list[slot1.pos].id] = nil
		end

		slot0.honor_list[slot1.pos] = nil
		slot5 = slot1.pos

		slot0:updateItemByindex(slot5)

		for slot5, slot6 in ipairs(slot0.item_list) do
			slot6.can_touch = false

			slot6.change_img:setVisible(false)
		end
	else
		slot0.honor_list[slot1.pos] = {
			pos = slot1.pos,
			id = slot1.id
		}
		slot0.dic_honor_data = {}

		for slot6, slot7 in pairs(slot0.honor_list) do
			slot0.dic_honor_data[slot7.id] = slot7
		end

		slot0.dic_honor_data[slot1.id] = slot2

		slot0:updateItemByindex(slot1.pos, slot2)
	end

	if slot0.list_view then
		slot0.list_view:resetCurrentItems()
	end
end

function RoleSelectHonorListPanel.openRootWnd(slot0, slot1)
	slot0.honor_list = (slot1 or {}).use_honor_icon_list

	if not slot0.honor_list then
		return
	end

	slot0.show_list = slot2.active_list or {}
	slot0.dic_honor_data = {}

	for slot6, slot7 in ipairs(slot0.item_list) do
		if slot0.honor_list[slot6] then
			slot0.dic_honor_data[slot0.honor_list[slot6].id] = slot0.honor_list[slot6]

			slot0:updateItemByindex(slot6, slot0.honor_list[slot6])
		else
			slot0:updateItemByindex(slot6)
		end
	end

	slot0:updateHonorList()
end

function RoleSelectHonorListPanel.updateItemByindex(slot0, slot1, slot2)
	if slot0.item_list[slot1] then
		if slot2 then
			slot0.item_list[slot1].honor_item:setVisible(true)
			slot0.item_list[slot1].change_img:setVisible(false)
			slot0.item_list[slot1].honor_item:setData(slot2)
			slot0.item_list[slot1].honor_item:setShowEffect(true)
		else
			slot0.item_list[slot1].honor_item:setVisible(false)
			slot0.item_list[slot1].change_img:setVisible(false)
		end
	end
end

function RoleSelectHonorListPanel.showChangeImg(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot0.honor_list[slot4] then
			slot5.change_img:setVisible(true)

			slot5.can_touch = true
		else
			slot5.change_img:setVisible(false)
		end
	end
end

function RoleSelectHonorListPanel.checkHonorList(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot0.honor_list[slot4] == nil then
			return true, slot4
		end
	end

	return false
end

function RoleSelectHonorListPanel.updateHonorList(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.list_view == nil then
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			row = 0,
			start_x = 1,
			space_x = 0,
			item_width = 152,
			item_height = 134,
			space_y = 0,
			col = 4,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	uv0(slot0.show_list, SortTools.tableCommonSorter({
		{
			"id",
			false
		}
	}))
	slot0.list_view:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("还没有徽章哦，快去收集吧~")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function RoleSelectHonorListPanel.createNewCell(slot0, slot1, slot2)
	slot3 = RoleSelectHonorItem.new(slot1, slot2)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function RoleSelectHonorListPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RoleSelectHonorListPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot0.select_index and slot0.select_index == slot2 then
		slot1:setSelect(true)
	else
		slot1:setSelect(false)
	end

	if slot0.dic_honor_data[slot3.id] then
		slot1:setBoxVisible(true)
	else
		slot1:setBoxVisible(false)
	end
end

function RoleSelectHonorListPanel.onCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end

	if slot0.select_cell then
		slot0.select_cell:setSelect(false)
	end

	slot0.select_cell = slot1

	slot0.select_cell:setSelect(true)

	slot0.select_index = slot2

	if slot0.dic_honor_data[slot3.id] ~= nil then
		uv0:send25805(slot0.dic_honor_data[slot3.id].pos, 0)
	else
		slot4, slot5 = slot0:checkHonorList()

		if slot4 then
			uv0:send25805(slot5, slot3.id)
		else
			slot0:showChangeImg()
		end
	end
end

function RoleSelectHonorListPanel.close_callback(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.item_load_title_img then
		slot0.item_load_title_img:DeleteMe()

		slot0.item_load_title_img = nil
	end

	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.item_load then
				slot5.item_load:DeleteMe()

				slot5.item_load = nil
			end
		end
	end

	uv0:openRoleSelectHonorListPanel(false)
end

RoleSelectHonorItem = class("RoleSelectHonorItem", function ()
	return ccui.Widget:create()
end)

function RoleSelectHonorItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function RoleSelectHonorItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_select_honor_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.honor_item = RoleHonorItem.new(0.6)

	slot0.main_container:getChildByName("item_node"):addChild(slot0.honor_item)

	slot0.select_img = slot0.main_container:getChildByName("select_img")
	slot0.checkbox = slot0.main_container:getChildByName("checkbox")
end

function RoleSelectHonorItem.register_event(slot0)
	registerButtonEventListener(slot0.main_container, function ()
		if uv0.callback then
			uv0.callback()
		end
	end, true, 1, nil, , , true)
end

function RoleSelectHonorItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function RoleSelectHonorItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.honor_item then
		slot0.honor_item:setData(slot1)
		slot0.honor_item:setShowEffect(true)
	end
end

function RoleSelectHonorItem.setSelect(slot0, slot1)
	if slot0.select_img then
		slot0.select_img:setVisible(slot1 or false)
	end
end

function RoleSelectHonorItem.setBoxVisible(slot0, slot1)
	if slot0.checkbox then
		slot0.checkbox:setVisible(slot1 or false)
	end
end

function RoleSelectHonorItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
