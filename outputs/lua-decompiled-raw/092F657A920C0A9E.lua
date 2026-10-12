ArenateamChangTeamNamePanel = ArenateamChangTeamNamePanel or BaseClass(BaseView)
slot0 = ArenateamController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ArenateamChangTeamNamePanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arenateam/arenateam_chang_team_name_panel"
	slot0.res_list = {}
end

function ArenateamChangTeamNamePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("队伍改名"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.default_msg = TI18N("输入队伍名字")
	slot0.edit_box = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_1021"), cc.size(320, 50), nil, 24, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, , LOADTEXT_TYPE_PLIST, nil, )

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(cc.p(180, 176))
	slot0.edit_box:setMaxLength(14)

	slot0.name_key = slot0.main_container:getChildByName("name_key")

	slot0.name_key:setString(TI18N("请输入队伍新名字:"))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))
end

function ArenateamChangTeamNamePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
end

function ArenateamChangTeamNamePanel.onClickBtnRight(slot0)
	if (slot0.edit_box:getText() or "") == "" then
		message(slot0.default_msg)

		return
	end

	GlobalEvent:getInstance():Fire(ArenateamEvent.ARENATEAM_CHANGE_NAME_CALLBACK, slot1)
	uv0:sender27226(slot1)
	slot0:onClickBtnClose()
end

function ArenateamChangTeamNamePanel.onClickBtnClose(slot0)
	uv0:openArenateamChangTeamNamePanel(false)
end

function ArenateamChangTeamNamePanel.openRootWnd(slot0, slot1)
	if slot0.edit_box then
		slot0.edit_box:setText((slot1 or {}).name or "")
	end
end

function ArenateamChangTeamNamePanel.initData(slot0)
	slot0.level_data_list = {}
	slot0.power_data_list = {}
	slot0.select_level_index = 1
	slot0.select_power_index = 1

	for slot4 = 1, 10 do
		uv0(slot0.level_data_list, {
			value = slot4 * 10 .. TI18N("级")
		})
	end

	for slot4 = 1, 10 do
		uv0(slot0.power_data_list, {
			value = slot4 * 100 .. TI18N("万")
		})
	end

	if slot0.level_data_list[slot0.select_level_index] ~= nil then
		slot0.level_value:setString(slot0.level_data_list[slot0.select_level_index].value)
	end

	if slot0.power_data_list[slot0.select_power_index] ~= nil then
		slot0.power_value:setString(slot0.power_data_list[slot0.select_power_index].value)
	end
end

function ArenateamChangTeamNamePanel.updateComboboxList(slot0, slot1, slot2)
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
			item_width = 175,
			space_y = 0,
			col = 1,
			item_height = 42
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

function ArenateamChangTeamNamePanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(true)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot4 = cc.size(slot1, slot2 - 2)
	slot3.bg = createImage(slot3, PathTool.getResFrame("common", "common_90058"), 0, 2, cc.p(0, 0), true, 0, true)

	slot3.bg:setContentSize(slot4)
	slot3.bg:setOpacity(90)
	slot3.bg:setCapInsets(cc.rect(15, 15, 1, 1))

	slot3.select_bg = createImage(slot3, PathTool.getResFrame("common", "common_90058_1"), 0, 2, cc.p(0, 0), true, 0, true)

	slot3.select_bg:setContentSize(slot4)
	slot3.select_bg:setCapInsets(cc.rect(8, 10, 2, 1))
	slot3.select_bg:setVisible(false)

	slot3.label = createLabel(22, cc.c4b(100, 50, 35, 255), nil, 10, slot2 * 0.5, "", slot3, nil, cc.p(0, 0.5))
	slot3.mark_img = createSprite(PathTool.getResFrame("common", "common_1043"), slot1 - 10, slot2 * 0.5 + 2, slot3, cc.p(1, 0.5), LOADTEXT_TYPE_PLIST)

	slot3.mark_img:setScale(0.8)
	slot3:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.select_bg:setVisible(true)

			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.moved then
			uv0.select_bg:setVisible(false)
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

function ArenateamChangTeamNamePanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamChangTeamNamePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1.select_bg:setVisible(false)
	slot1.label:setString(slot3.value)

	if slot0.select_index == slot2 then
		slot1.mark_img:setVisible(true)
	else
		slot1.mark_img:setVisible(false)
	end
end

function ArenateamChangTeamNamePanel.setCellTouched(slot0, slot1)
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

function ArenateamChangTeamNamePanel.onHideComboboxPanel(slot0)
	if slot0.combobox_panel then
		slot0.combobox_panel:setPositionY(-10000)
	end
end

function ArenateamChangTeamNamePanel.close_callback(slot0)
	if slot0.combobox_scrollview then
		slot0.combobox_scrollview:DeleteMe()

		slot0.combobox_scrollview = nil
	end

	uv0:openArenateamChangTeamNamePanel(false)
end
