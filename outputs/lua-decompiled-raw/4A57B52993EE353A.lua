ArenateamCreateTeamPanel = ArenateamCreateTeamPanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ArenateamCreateTeamPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arenateam/arenateam_create_team_panel"
	slot0.res_list = {}
	slot0.select_level_index = 1
	slot0.select_power_index = 1
	slot0.level_data_list = {}
	slot0.power_data_list = {}
end

function ArenateamCreateTeamPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("创建队伍"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.main_container:getChildByName("name_key"):setString(TI18N("创建队伍名字:"))
	slot0.main_container:getChildByName("level_key"):setString(TI18N("入队最低等级:"))
	slot0.main_container:getChildByName("power_key"):setString(TI18N("入队最低战力:"))

	slot0.default_msg = TI18N("输入队伍名字")
	slot0.edit_box = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_1021"), cc.size(320, 51), nil, 24, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, , LOADTEXT_TYPE_PLIST, nil, )

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(cc.p(275, 370))
	slot0.edit_box:setMaxLength(14)

	slot0.level_btn = slot0.main_container:getChildByName("level_btn")
	slot0.level_value = slot0.level_btn:getChildByName("value")
	slot0.power_btn = slot0.main_container:getChildByName("power_btn")
	slot0.power_value = slot0.power_btn:getChildByName("value")
	slot0.combobox_panel = slot0.main_container:getChildByName("combobox_panel")
	slot0.combobox_bg = slot0.combobox_panel:getChildByName("bg")
	slot0.combobox_bg_size = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size = cc.size(308, 190)
	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot0.checkbox = slot0.main_container:getChildByName("checkbox")
	slot0.checkbox_label = slot0.checkbox:getChildByName("name")

	slot0.checkbox_label:setString(TI18N("是否需要审核"))
	slot0.checkbox:setSelected(false)
	slot0:onHideComboboxPanel()
end

function ArenateamCreateTeamPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
	registerButtonEventListener(slot0.level_btn, handler(slot0, slot0.onClickBtnLevel), false, 1)
	registerButtonEventListener(slot0.power_btn, handler(slot0, slot0.onClickBtnPower), false, 1)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:onHideComboboxPanel()
	end, false, 0)
end

function ArenateamCreateTeamPanel.onClickBtnRight(slot0)
	if not slot0.level_data_list then
		return
	end

	if (slot0.edit_box:getText() or "") == "" then
		message(slot0.default_msg)

		return
	end

	slot3 = 0

	if slot0.checkbox:isSelected() or false then
		slot3 = 1
	end

	slot4 = 0

	if slot0.level_data_list[slot0.select_level_index] then
		slot4 = slot0.level_data_list[slot0.select_level_index].lev
	end

	slot5 = 0

	if slot0.power_data_list[slot0.select_power_index] then
		slot5 = slot0.power_data_list[slot0.select_power_index].power
	end

	uv0:sender27201(slot1, slot4, slot5, slot3)
end

function ArenateamCreateTeamPanel.onClickBtnLevel(slot0)
	if not slot0.level_data_list then
		return
	end

	slot0.combobox_panel:setPositionY(280)
	slot0:updateComboboxList(slot0.level_data_list, 1)
end

function ArenateamCreateTeamPanel.onClickBtnPower(slot0)
	if not slot0.power_data_list then
		return
	end

	slot0.combobox_panel:setPositionY(195)
	slot0:updateComboboxList(slot0.power_data_list, 2)
end

function ArenateamCreateTeamPanel.onClickBtnClose(slot0)
	uv0:openArenateamCreateTeamPanel(false)
end

function ArenateamCreateTeamPanel.openRootWnd(slot0)
	slot0:initData()
end

function ArenateamCreateTeamPanel.initData(slot0)
	slot0.level_data_list = {}
	slot0.power_data_list = {}
	slot0.select_level_index = 1
	slot0.select_power_index = 1

	for slot5, slot6 in ipairs(Config.ArenaTeamData.data_level_info or {}) do
		slot7 = {
			lev = slot6.lev,
			value = TI18N("不限制")
		}

		if slot6.lev == 0 then
			-- Nothing
		else
			slot7.value = slot6.lev .. TI18N("级")
		end

		uv0(slot0.level_data_list, slot7)
	end

	for slot6, slot7 in ipairs(Config.ArenaTeamData.data_power_info or {}) do
		if slot7.power == 0 then
			-- Nothing
		else
			slot8.value = slot7.power / 10000 .. TI18N("万")
		end

		uv0(slot0.power_data_list, {
			power = slot7.power,
			value = TI18N("不限制")
		})
	end

	if slot0.level_data_list[slot0.select_level_index] ~= nil then
		slot0.level_value:setString(slot0.level_data_list[slot0.select_level_index].value)
	end

	if slot0.power_data_list[slot0.select_power_index] ~= nil then
		slot0.power_value:setString(slot0.power_data_list[slot0.select_power_index].value)
	end
end

function ArenateamCreateTeamPanel.updateComboboxList(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.combobox_type = slot2 or 1

	if slot0.combobox_scrollview == nil then
		slot0.combobox_scrollview = CommonScrollViewSingleLayout.new(slot0.combobox_panel, cc.p(4, 3), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.combobox_max_size, {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 308,
			space_y = 0,
			col = 1,
			item_height = 54
		}, cc.p(0, 0))

		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if next(slot1) ~= nil then
		if #slot1 > 4 then
			slot0.combobox_scrollview:setClickEnabled(true)
			slot0.combobox_bg:setContentSize(slot0.combobox_bg_size)
		else
			slot0.combobox_scrollview:setClickEnabled(false)
			slot0.combobox_bg:setContentSize(cc.size(slot0.combobox_bg_size.width, slot4 * slot3 + slot0.combobox_bg_size.height - slot0.combobox_max_size.height))
		end

		slot0.show_list = slot1

		if slot0.combobox_type == 1 then
			slot0.select_index = slot0.select_level_index or 1
		else
			slot0.select_index = slot0.select_power_index or 1
		end

		slot0.combobox_scrollview:reloadData(slot0.select_index)
	end
end

function ArenateamCreateTeamPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(true)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.bg = createImage(slot3, PathTool.getResFrame("common", "common_1016"), 5, 2, cc.p(0, 0), true, 0, true)

	slot3.bg:setContentSize(cc.size(slot1 - 15, 3))
	slot3.bg:setOpacity(90)
	slot3.bg:setCapInsets(cc.rect(13, 1, 1, 1))

	slot3.label = createLabel(26, cc.c4b(100, 50, 35, 255), nil, 10, slot2 * 0.5, "", slot3, nil, cc.p(0, 0.5))

	slot3:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.ended then
			slot3 = slot0:getTouchEndPosition()

			if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 10 or math.abs(slot3.y - slot2.y) > 10) then
				return
			end

			playButtonSound2()
			uv1:setCellTouched(uv0)
		end
	end)

	return slot3
end

function ArenateamCreateTeamPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamCreateTeamPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1.label:setString(slot3.value)
end

function ArenateamCreateTeamPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end

	if slot0.combobox_type == 1 then
		slot0.select_level_index = slot2

		slot0.level_value:setString(slot3.value)
	else
		slot0.select_power_index = slot2

		slot0.power_value:setString(slot3.value)
	end

	slot0:onHideComboboxPanel()
end

function ArenateamCreateTeamPanel.onHideComboboxPanel(slot0)
	if slot0.combobox_panel then
		slot0.combobox_panel:setPositionY(-10000)
	end
end

function ArenateamCreateTeamPanel.close_callback(slot0)
	if slot0.combobox_scrollview then
		slot0.combobox_scrollview:DeleteMe()

		slot0.combobox_scrollview = nil
	end

	uv0:openArenateamCreateTeamPanel(false)
end
