TabSelectBar = TabSelectBar or BaseClass()
TabSelectBarDirection = {
	horizontal = 2,
	vertical = 1
}

function TabSelectBar.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12)
	slot0.parent_wnd = slot1
	slot0.direction = slot2
	slot0.space_offset = slot3 or 10
	slot0.per_select_index = nil
	slot0.scale = slot6 or 1
	slot0.label_offset_x = slot7 or 0
	slot0.label_offset_y = slot8 or 0
	slot0.is_plist = slot10
	slot0.changeItemByIndex = slot5
	slot0.last_btn_scale = slot11 or false

	if slot9 == nil then
		slot0.btn_need_scale = true
	else
		slot0.btn_need_scale = slot9
	end

	slot0.is_need_first_select = slot12 or true

	slot0:initView(slot4)
	slot0:registerEvent()
end

function TabSelectBar.initView(slot0, slot1)
	slot0.tab_bar = ccui.Widget:create()

	slot0.tab_bar:setCascadeOpacityEnabled(true)
	slot0.tab_bar:setAnchorPoint(cc.p(0, 0))
	slot0.parent_wnd:addChild(slot0.tab_bar)
	slot0:setTabArray(slot1)
	slot0.tab_bar:setScale(slot0.scale)
end

function TabSelectBar.registerEvent(slot0)
end

function TabSelectBar.setTabArray(slot0, slot1)
	slot0.tab_array = slot1
	slot0.btn_list = {}
	slot0.per_select_index = nil

	slot0.tab_bar:removeAllChildren()

	function slot2(slot0)
		uv0:setSelectByIndex(slot0)
	end

	slot3 = 0
	slot4 = 0
	slot5 = nil

	if slot0.tab_array and #slot0.tab_array > 0 then
		for slot9 = 1, #slot0.tab_array do
			slot10 = nil

			if (slot0.tab_array[slot9] or {}).width and slot5.height then
				slot10 = cc.size(slot5.width, slot5.height)
			end

			slot11 = TabSelectBtn.New(slot0.tab_bar, slot5.select_path, slot5.unselect_path, slot5.icon_path, slot5.arrow_path, function ()
			end, slot0.font_size, slot10, #slot1 - slot9, slot0.btn_need_scale, slot0.is_plist, slot5.extend_name)

			slot11:setCallBack(function ()
				uv0(uv1)
			end)
			slot11:setAnchorPoint(1, 0.5)
			slot11:setString(slot5.label or "")
			slot11:setTitleOffset(slot0.label_offset_x, slot0.label_offset_y)
			slot11:setTitleColor(slot5.unselect_color or Config.ColorData.data_color4[1])

			if slot9 == #slot0.tab_array and slot0.last_btn_scale == true then
				slot11:setAnchorPoint(0, 0.5)
				slot11:getRoot():setScaleX(-1)
			end

			slot11:setName(slot5.name or slot9)

			slot0.btn_list[slot9] = slot11

			if TabSelectBarDirection.vertical == slot0.direction then
				slot4 = slot4 + (slot5.height or slot11:getContentSize().height) + slot0.space_offset
				slot3 = math.max(slot3, slot5.width or slot11:getContentSize().width)
			elseif TabSelectBarDirection.horizontal == slot0.direction then
				slot3 = slot3 + (slot5.width or slot11:getContentSize().width) + slot0.space_offset
				slot4 = math.max(slot4, slot5.height or slot11:getContentSize().height)
			end

			slot0.btn_list[slot9]:createSelectIcon(slot5.select_icon, slot5.unselect_icon)

			if slot5.txt_icon and slot11.createTxtIcon then
				slot11:createTxtIcon(slot5.txt_icon)
			end
		end

		slot0.tab_bar:setContentSize(cc.size(slot3, slot4))

		slot6 = 0

		for slot10 = 1, #slot0.tab_array do
			slot11 = slot0.btn_list[slot10]
			slot5 = slot0.tab_array[slot10] or {}

			if TabSelectBarDirection.vertical == slot0.direction then
				slot11:setPosition((slot5.width or slot11:getContentSize().width) / 2, slot4 - ((slot5.height or slot11:getContentSize().height) + slot0.space_offset) + (slot5.height or slot11:getContentSize().height) / 2)
			elseif TabSelectBarDirection.horizontal == slot0.direction then
				if slot5 then
					slot6 = slot6 + (slot5.width or slot11:getContentSize().width) + slot0.space_offset
				end

				slot11:setPosition(slot6, (slot5.height or slot11:getContentSize().height) / 2)
			end
		end

		if slot0.is_need_first_select == true then
			slot0:setSelectByIndex(1)
		end
	end
end

function TabSelectBar.setTabButtonVisible(slot0, slot1, slot2)
	slot3 = slot0.tab_bar:getContentSize().height
	slot4 = nil
	slot5 = 0

	for slot10 = 1, #slot0.tab_array do
		if (function (slot0)
			if uv0 == nil or #uv0 == 0 then
				return false
			end

			for slot4, slot5 in ipairs(uv0) do
				if slot5 == slot0 then
					return true
				end
			end

			return false
		end)(slot10) and slot2 == false then
			slot0.btn_list[slot10]:setVisible(false)
		else
			slot11:setVisible(true)

			slot4 = slot0.tab_array[slot10] or {}

			if TabSelectBarDirection.vertical == slot0.direction then
				slot11:setPosition((slot4.width or slot11:getContentSize().width) / 2, slot3 - ((slot4.height or slot11:getContentSize().height) + slot0.space_offset) + (slot4.height or slot11:getContentSize().height) / 2)
			elseif TabSelectBarDirection.horizontal == slot0.direction then
				if slot4 then
					slot5 = slot5 + (slot4.width or slot11:getContentSize().width) + slot0.space_offset
				end

				slot11:setPosition(slot5, (slot4.height or slot11:getContentSize().height) / 2)
			end
		end
	end
end

function TabSelectBar.setTabVisibleState(slot0, slot1)
	slot3 = nil
	slot4 = 0

	for slot9 = 1, #slot0.tab_array do
		slot10 = slot0.btn_list[slot9]

		if (function (slot0)
			if uv0 == nil or #uv0 == 0 then
				return nil
			end

			for slot4, slot5 in ipairs(uv0) do
				if slot5[1] == slot0 then
					return slot5
				end
			end

			return nil
		end)(slot9) then
			if slot11[2] == true then
				if slot11[3] == true then
					if TabSelectBarDirection.vertical == slot0.direction then
						slot10:setPosition(0, slot0.tab_bar:getContentSize().height - (((slot0.tab_array[slot9] or {}).height or slot10:getContentSize().height) + slot0.space_offset))
					elseif TabSelectBarDirection.horizontal == slot0.direction then
						if slot0.tab_array[slot9 - 1] then
							slot4 = slot4 + (slot3.width or slot10:getContentSize().width) + slot0.space_offset
						end

						slot10:setPosition(slot4, 0)
					end
				elseif TabSelectBarDirection.vertical == slot0.direction then
					slot10:setPosition(0, slot2 - (((slot0.tab_array[slot9] or {}).height or slot10:getContentSize().height) + slot0.space_offset))
				elseif TabSelectBarDirection.horizontal == slot0.direction then
					if slot0.tab_array[slot9 - 1] then
						slot4 = slot4 + (slot3.width or slot10:getContentSize().width) + slot0.space_offset
					end

					slot10:setPosition(slot4, 0)
				end
			end

			slot10:setVisible(slot11[2])
		else
			slot10:setVisible(true)

			if TabSelectBarDirection.vertical == slot0.direction then
				slot10:setPosition(0, slot2 - (((slot0.tab_array[slot9] or {}).height or slot10:getContentSize().height) + slot0.space_offset))
			elseif TabSelectBarDirection.horizontal == slot0.direction then
				if slot0.tab_array[slot9 - 1] then
					slot4 = slot4 + (slot3.width or slot10:getContentSize().width) + slot0.space_offset
				end

				slot10:setPosition(slot4, 0)
			end
		end
	end
end

function TabSelectBar.setVisible(slot0, slot1)
	slot0.tab_bar:setVisible(slot1)
end

function TabSelectBar.setSelectByIndex(slot0, slot1)
	if slot0.per_select_index and slot0.per_select_index == slot1 then
		return
	end

	slot2, slot3 = nil

	if slot0.per_select_index and slot0.per_select_index <= #slot0.btn_list then
		slot0.btn_list[slot0.per_select_index]:setSelected(false)

		if slot0.tab_array[slot0.per_select_index] and slot3.unselect_outline then
			slot2:enableOutline(slot3.unselect_outline, 1)
		end

		if slot3 and slot3.unselect_color then
			slot2:setTitleColor(slot3.unselect_color)
		end

		if slot3 and slot3.label then
			slot2:setString(slot3.label)
		end
	end

	if slot1 and slot1 <= #slot0.btn_list then
		slot0.btn_list[slot1]:setSelected(true)

		if slot0.tab_array[slot1] and slot3.select_outline then
			slot2:enableOutline(slot3.select_outline, 1)
		end

		if slot3 and slot3.select_color then
			slot2:setTitleColor(slot3.select_color)
		end

		if slot3 and slot3.select_label then
			slot2:setString(slot3.select_label)
		end
	end

	slot0:changeBtnByIndex(slot1)

	slot0.per_select_index = slot1
end

function TabSelectBar.resetBtnSize(slot0, slot1)
	for slot5, slot6 in pairs(slot0.btn_list) do
		slot6:setBtnContenSize(slot1)

		slot0.tab_array[slot5].width = slot1.width
		slot0.tab_array[slot5].height = slot1.height
	end
end

function TabSelectBar.changeBtnByIndex(slot0, slot1)
	if slot0.per_select_index == slot1 then
		return
	end

	if slot0.changeItemByIndex ~= nil then
		slot0.changeItemByIndex(slot1)
	end
end

function TabSelectBar.setChangeItemByIndex(slot0, slot1)
	if slot1 ~= nil then
		slot0.changeItemByIndex = slot1
	end
end

function TabSelectBar.getSelectIndex(slot0)
	return slot0.per_select_index or 1
end

function TabSelectBar.getBtnByName(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			if slot6:getName() == slot1 then
				return slot6
			end
		end
	end
end

function TabSelectBar.getBtnByIndex(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			if slot5 == slot1 then
				return slot6
			end
		end
	end
end

function TabSelectBar.setCircleByName(slot0, slot1, slot2)
	if slot0:getBtnByName(slot1) then
		slot3:showCirclePoint(slot2)
	else
		print("icon name==>" .. slot1 .. "not found!!!")
	end
end

function TabSelectBar.setBtnScale(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.btn_list) do
		slot7:setIconScale(slot1, slot2)
	end
end

function TabSelectBar.setBtnRootSize(slot0, slot1)
	for slot5, slot6 in pairs(slot0.btn_list) do
		if slot1 then
			slot6:getRoot():setContentSize(slot1)
		end
	end
end

function TabSelectBar.showActivityIconByName(slot0, slot1, slot2, slot3)
	if slot0:getBtnByName(slot1) then
		if slot3 then
			slot4:showActivityIcon(slot2)
		else
			slot4:showActivityIcon(nil)
		end
	else
		print("icon name==>" .. slot1 .. "not found!!!")
	end
end

function TabSelectBar.setCircleNumByName(slot0, slot1, slot2)
	if slot0:getBtnByName(slot1) then
		slot3:showCircleLabel(slot2)
	end
end

function TabSelectBar.getContentSize(slot0)
	return slot0:getRoot():getContentSize()
end

function TabSelectBar.setOpenAction(slot0)
	for slot4, slot5 in pairs(slot0.btn_list) do
		slot5:setVisible(false)
	end

	for slot4, slot5 in pairs(slot0.btn_list) do
		delayRun(slot0.parent_wnd, 0.1 * slot4, function ()
			slot0 = uv0:getPositionX()
			slot1 = uv0:getPositionY()

			uv0:setPosition(cc.p(slot0 - 100, slot1))
			uv0:setVisible(true)
			uv0:getRoot():runAction(cc.Sequence:create(cc.MoveTo:create(0.2, cc.p(slot0, slot1))))
		end)
	end
end

function TabSelectBar.setCloseAction(slot0, slot1)
	for slot5, slot6 in pairs(slot0.btn_list) do
		slot6:setVisible(false)
	end

	for slot5, slot6 in pairs(slot0.btn_list) do
		slot7 = slot6:getPositionX()
		slot8 = slot6:getPositionY()

		slot6:setPosition(cc.p(slot7, slot8))
		slot6:setVisible(true)
		slot6:getRoot():runAction(cc.Sequence:create(cc.MoveTo:create(0.2, cc.p(slot7 - 200, slot8)), cc.CallFunc:create(function ()
			uv0()
		end)))
	end
end

function TabSelectBar.setTitleColor(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			slot6:setTitleColor(slot1)
		end
	end
end

function TabSelectBar.setCirclePointOffset(slot0, slot1, slot2)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot6, slot7 in pairs(slot0.btn_list) do
			slot7:setCirclePointOffset(slot1, slot2)
		end
	end
end

function TabSelectBar.enableOutline(slot0, slot1, slot2)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot6, slot7 in pairs(slot0.btn_list) do
			if slot0.per_select_index and slot0.per_select_index ~= slot6 then
				slot7:enableOutline(slot1, slot2)
			end
		end
	end
end

function TabSelectBar.setTextWidth(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			slot6:getLabel():setWidth(slot1)
		end
	end
end

function TabSelectBar.setLocalZOrder(slot0, slot1)
	slot0.tab_bar:setLocalZOrder(slot1)
end

function TabSelectBar.getBtnTabel(slot0)
	return slot0.btn_list
end

function TabSelectBar.setTitleOffset(slot0, slot1, slot2)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot6, slot7 in pairs(slot0.btn_list) do
			slot7:setTitleOffset(slot1, slot2)
		end
	end
end

function TabSelectBar.setTxtIconOffset(slot0, slot1, slot2)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot6, slot7 in pairs(slot0.btn_list) do
			slot7:setTxtIconOffset(slot1, slot2)
		end
	end
end

function TabSelectBar.setSelectTabPos(slot0, slot1, slot2)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot6, slot7 in pairs(slot0.btn_list) do
			slot7:setSelectTabPos(slot1, slot2)
		end
	end
end

function TabSelectBar.setTitleSize(slot0, slot1)
	slot0.font_size = slot1

	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			slot6:setFontSize(slot1)
		end
	end
end

function TabSelectBar.setTitleLabel(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5 = 1, #slot0.btn_list do
			slot0.btn_list[slot5]:setString(slot1[slot5])

			slot0.tab_array[slot5].label = slot1[slot5]
		end
	end
end

function TabSelectBar.setAnchorPoint(slot0, slot1, slot2)
	slot0.tab_bar:setAnchorPoint(cc.p(slot1, slot2))
end

function TabSelectBar.setPosition(slot0, slot1, slot2)
	slot0.tab_bar:setPosition(cc.p(slot1, slot2))
end

function TabSelectBar.getPosition(slot0)
	return slot0.tab_bar:getPositionX(), slot0.tab_bar:getPositionY()
end

function TabSelectBar.addToParent(slot0, slot1)
	slot0.parent_wnd = slot1

	if not tolua.isnull(slot0.tab_bar) and slot0.tab_bar:getParent() then
		slot0.tab_bar:removeFromParent()
	end

	slot0.parent_wnd:addChild(slot0.tab_bar)
end

function TabSelectBar.getRoot(slot0)
	return slot0.tab_bar
end

function TabSelectBar.__delete(slot0)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot4, slot5 in pairs(slot0.btn_list) do
			slot5:DeleteMe()

			slot5 = nil
		end

		slot0.btn_list = nil
	end

	slot0.tab_bar:removeAllChildren()

	slot0.tab_bar = nil
	slot0.parent_wnd = nil
end
