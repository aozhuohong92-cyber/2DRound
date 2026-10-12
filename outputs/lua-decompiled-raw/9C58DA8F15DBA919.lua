CommonComboboxPanel = CommonComboboxPanel or BaseClass(BaseView)
slot0 = CommonUIController:getInstance()

function CommonComboboxPanel.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "common/common_combobox_panel"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.item_height = 54
end

function CommonComboboxPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		-- Nothing
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.combobox_panel = slot0.main_panel:getChildByName("combobox_panel")
	slot0.combobox_bg = slot0.combobox_panel:getChildByName("bg")
	slot0.combobox_bg_size = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size = cc.size(308, 190)
end

function CommonComboboxPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 1)
end

function CommonComboboxPanel.onClickCloseBtn(slot0)
	uv0:openCommonComboboxPanel(false)
end

function CommonComboboxPanel.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	if slot3 == nil or next(slot5) == nil then
		return
	end

	slot0.callback = slot2
	slot6 = slot4 or {}
	slot0.setting = slot6
	slot0.combo_show_type = slot6.combo_show_type or 1
	slot0.select_index = slot6.select_index or 1
	slot0.item_height = slot6.item_height or 54

	if slot6.combobox_max_size then
		slot0.combobox_max_size = slot6.combobox_max_size

		slot0.combobox_panel:setContentSize(slot0.combobox_max_size)
		slot0.combobox_bg:setPositionX(slot0.combobox_max_size.width * 0.5)
	end

	slot0.show_max_count = math.floor(slot0.combobox_max_size.height / slot0.item_height)

	if slot6.combobox_bg_size then
		slot0.combobox_bg_size = slot6.combobox_bg_size
	end

	slot0.other_index = slot6.other_index
	slot0.dir_type = slot6.dir_type or 1

	if slot0.main_panel:convertToNodeSpace(slot1) then
		slot0.combobox_panel:setPosition(cc.p(slot7.x + (slot6.offsetx or 0), slot7.y + (slot6.offsety or 0)))
	end

	slot0:updateComboboxList(slot5)

	if slot0.combo_show_type == 2 then
		slot0.combobox_bg:loadTexture(PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_mian_14", false, "arenapeak_guessing"), LOADTEXT_TYPE_PLIST)
	end
end

function CommonComboboxPanel.updateComboboxList(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.combobox_scrollview == nil then
		slot0.combobox_scrollview = CommonScrollViewSingleLayout.new(slot0.combobox_panel, cc.p(4, 3), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.combobox_max_size, {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			delay = 1,
			space_x = 0,
			space_y = 0,
			col = 1,
			item_width = slot0.combobox_max_size.width,
			item_height = 54
		}, cc.p(0, 0))

		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.combobox_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if next(slot1) ~= nil then
		slot4 = 0

		if slot0.show_max_count < #slot1 then
			slot0.combobox_scrollview:setClickEnabled(true)
			slot0.combobox_bg:setContentSize(slot0.combobox_bg_size)

			slot4 = slot0.combobox_bg_size.height
		else
			slot0.combobox_scrollview:setClickEnabled(false)

			slot5 = slot3 * slot2 + slot0.combobox_bg_size.height - slot0.combobox_max_size.height

			slot0.combobox_bg:setContentSize(cc.size(slot0.combobox_bg_size.width, slot5))

			slot4 = slot5
		end

		if slot0.dir_type == 2 then
			slot0.combobox_panel:setPositionY(slot0.combobox_panel:getPositionY() + slot4)
		end

		slot0.show_list = slot1

		slot0.combobox_scrollview:reloadData(slot0.select_index)
	end
end

function CommonComboboxPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(true)
	slot3:setContentSize(cc.size(slot1, slot2))
	slot0:initComboItemStyle(slot3, slot1, slot2)
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

function CommonComboboxPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function CommonComboboxPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	if slot0.combo_show_type == 1 then
		slot1.label:setString(slot3.value)
	else
		slot1.label:setString(slot3.value)

		if slot0.other_index == slot2 then
			slot1.icon:setVisible(true)
		else
			slot1.icon:setVisible(false)
		end

		if slot0.select_index == slot2 then
			slot1.select_bg:setVisible(true)
		else
			slot1.select_bg:setVisible(false)
		end
	end
end

function CommonComboboxPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end

	if slot0.callback then
		slot0.callback(slot2, slot3, slot0.setting)
	end

	slot0:onClickCloseBtn()
end

function CommonComboboxPanel.initComboItemStyle(slot0, slot1, slot2, slot3)
	if slot0.combo_show_type == 1 then
		slot1.bg = createImage(slot1, PathTool.getResFrame("common", "common_1016"), 5, 2, cc.p(0, 0), true, 0, true)

		slot1.bg:setContentSize(cc.size(slot2 - 15, 3))
		slot1.bg:setOpacity(90)
		slot1.bg:setCapInsets(cc.rect(13, 1, 1, 1))

		slot1.label = createLabel(26, cc.c4b(100, 50, 35, 255), nil, 10, slot3 * 0.5, "", slot1, nil, cc.p(0, 0.5))
	elseif slot0.combo_show_type == 2 then
		slot1.bg = createImage(slot1, PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_mian_16", false, "arenapeak_guessing"), 5, 2, cc.p(0, 0), true, 0, true)

		slot1.bg:setContentSize(cc.size(slot2 - 15, 3))
		slot1.bg:setOpacity(90)
		slot1.bg:setCapInsets(cc.rect(13, 1, 1, 1))

		slot1.label = createLabel(26, cc.c4b(255, 248, 201, 255), cc.c4b(0, 0, 0, 255), slot2 * 0.5, slot3 * 0.5, "", slot1, 2, cc.p(0.5, 0.5))
		slot1.icon = createImage(slot1, PathTool.getResFrame("arenapeakchampion", "arenapeakchampion_mian_17", false, "arenapeak_guessing"), 0, slot3 * 0.5, cc.p(0, 0.5), true, 0, false)
		slot1.select_bg = createImage(slot1, PathTool.getResFrame("common", "common_90058_1"), 2, 4, cc.p(0, 0), true, 0, true)

		slot1.select_bg:setContentSize(cc.size(slot2 - 10, slot3 - 6))
		slot1.select_bg:setCapInsets(cc.rect(8, 10, 2, 1))
		slot1.select_bg:setVisible(false)
	end
end

function CommonComboboxPanel.close_callback(slot0)
	if slot0.combobox_scrollview then
		slot0.combobox_scrollview:DeleteMe()

		slot0.combobox_scrollview = nil
	end

	uv0:openCommonComboboxPanel(false)
end
