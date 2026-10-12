RadioGroup = class("RadioGroup", function ()
	return ccui.Layout:create()
end)
RadioGroupDir = {
	horizontal = 2,
	vertical = 1
}

function RadioGroup.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.parent = slot1
	slot0.direction = slot2 or RadioGroupDir.horizontal
	slot0.space_offset = slot3 or 10
	slot0.tab_array = slot4
	slot0.changeItemByIndex = slot5

	slot0.parent:addChild(slot0)

	if slot4 then
		slot0:setRadioArray(slot4)
	end
end

function RadioGroup.setRadioArray(slot0, slot1)
	slot0.tab_array = slot1
	slot0.btn_list = {}

	slot0:removeAllChildren()

	function slot2(slot0)
		uv0:setSelectByIndex(slot0)
	end

	slot3 = 0
	slot4 = 0
	slot5 = nil

	if slot0.tab_array and #slot0.tab_array > 0 then
		for slot9 = 1, #slot0.tab_array do
			slot5 = slot0.tab_array[slot9] or {}
			slot10 = RadioButton.new(slot0, slot5.background, slot5.select_path, slot5.label, slot5.font_offset, slot5.dir, slot0.font_size)

			slot10:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0(uv1)
				end
			end)
			slot10:setAnchorPoint(0, 0)
			slot10:setTitleColor(slot5.unselect_color or Config.ColorData.data_color4[1])
			slot10:setName(slot5.name or slot9)

			slot0.btn_list[slot9] = slot10

			if RadioGroupDir.vertical == slot0.direction then
				slot4 = slot4 + (slot5.height or slot10:getContentSize().height + slot0.space_offset)
				slot3 = math.max(slot3, slot5.width or slot10:getContentSize().width)
			elseif RadioGroupDir.horizontal == slot0.direction then
				slot3 = slot3 + (slot5.width or slot10:getContentSize().width + slot0.space_offset)
				slot4 = math.max(slot4, slot5.height or slot10:getContentSize().height)
			end
		end

		slot0:setContentSize(cc.size(slot3, slot4))

		slot6 = 0

		for slot10 = 1, #slot0.tab_array do
			slot11 = slot0.btn_list[slot10]

			if RadioGroupDir.vertical == slot0.direction then
				slot11:setPosition(0, slot4 - ((slot0.tab_array[slot10] or {}).height or slot11:getContentSize().height) - slot0.space_offset)
			elseif RadioGroupDir.horizontal == slot0.direction then
				if slot0.tab_array[slot10 - 1] then
					slot6 = slot6 + (slot5.width or slot11:getContentSize().width) + slot0.space_offset
				end

				slot11:setPosition(slot6, 0)
			end
		end

		slot0:setSelectByIndex(1)
	end
end

function RadioGroup.setSelectByIndex(slot0, slot1, slot2)
	slot3, slot4 = nil

	if slot0.per_select_index and slot0.btn_list[slot0.per_select_index] and slot0.per_select_index <= #slot0.btn_list then
		slot3 = slot0.btn_list[slot0.per_select_index]

		slot3:setSelected(false)
		slot3:setLocalZOrder(#slot0.btn_list - 1)

		if slot0.tab_array[slot0.per_select_index] and slot4.unselect_outline then
			slot3:enableOutline(slot4.unselect_outline, 2)
		end

		if slot4 and slot4.unselect_color then
			slot3:setTitleColor(slot4.unselect_color)
		end
	end

	if slot1 and slot1 <= #slot0.btn_list and slot0.btn_list[slot1] then
		slot3 = slot0.btn_list[slot1]

		slot3:setSelected(true)
		slot3:setLocalZOrder(#slot0.btn_list)

		if slot0.tab_array[slot1] and slot4.select_outline then
			slot3:enableOutline(slot4.select_outline, 2)
		end

		if slot4 and slot4.select_color then
			slot3:setTitleColor(slot4.select_color)
		end
	end

	if slot2 == nil then
		slot0:changeBtnByIndex(slot1)
	end

	slot0.per_select_index = slot1
end

function RadioGroup.changeBtnByIndex(slot0, slot1)
	if slot0.per_select_index == slot1 then
		if slot0.curItemByIndex ~= nil then
			slot0.curItemByIndex(slot1)
		end

		return
	end

	if slot0.changeItemByIndex ~= nil then
		slot0.changeItemByIndex(slot1)
	end
end

function RadioGroup.getSelectIndex(slot0)
	return slot0.per_select_index
end

function RadioGroup.setChangeItemByIndex(slot0, slot1)
	if slot1 ~= nil then
		slot0.changeItemByIndex = slot1
	end
end

function RadioGroup.setTitleSize(slot0, slot1)
	slot0.font_size = slot1

	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			slot6:setFontSize(slot1)
		end
	end
end

function RadioGroup.setTitleColor(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			slot6:setTitleColor(slot1)
		end
	end
end

function RadioGroup.getBtnByName(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			if not tolua.isnull(slot6) and slot6:getName() == slot1 then
				return slot6
			end
		end
	end
end

function RadioGroup.getBtnByIndex(slot0, slot1)
	if slot0.btn_list and #slot0.btn_list > 0 then
		for slot5, slot6 in pairs(slot0.btn_list) do
			if slot5 == slot1 then
				return slot6
			end
		end
	end
end

function RadioGroup.getSelectedRadio(slot0)
	return slot0:getBtnByIndex(slot0:getSelectIndex())
end

function RadioGroup.unSelectedRadio(slot0)
	if slot0:getBtnByIndex(slot0:getSelectIndex()) then
		slot0:getBtnByIndex(slot0:getSelectIndex()):setSelected(false)

		slot0.per_select_index = nil
	end
end
