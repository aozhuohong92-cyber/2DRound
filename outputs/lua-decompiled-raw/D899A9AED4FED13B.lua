slot0 = table.insert
slot1 = table.remove
slot2 = table.sort
ScrollViewFuncType = {
	OnCellTouched = 4,
	UpdateCellByIndex = 1,
	CreateNewCell = 2,
	NumberOfCells = 3
}
CommonScrollViewSingleLayout = class("CommonScrollViewSingleLayout", function ()
	return ccui.Layout:create()
end)

function CommonScrollViewSingleLayout.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.parent = slot1
	slot0.pos = slot2 or cc.p(0, 0)
	slot0.dir = slot3 or ScrollViewDir.vertical
	slot0.start_pos = slot4 or ScrollViewStartPos.top
	slot0.size = slot5 or cc.size(100, 100)
	slot0.ap = slot7 or cc.p(0, 0)
	slot0.cellList = {}
	slot0.cacheList = {}
	slot0.activeCellIdx = {}
	slot0.selectCellIndex = 1
	slot0.handler = {}
	slot0.time_show_index = 0
	slot0.is_first_init = true

	slot0:analysisSetting(slot6)
	slot0:createRootWnd()
end

function CommonScrollViewSingleLayout.analysisSetting(slot0, slot1)
	slot0.setting = slot1 or {}
	slot0.start_x = slot0.setting.start_x or 0
	slot0.end_x = slot0.setting.end_x or slot0.start_x
	slot0.start_y = slot0.setting.start_y or 0
	slot0.end_y = slot0.setting.end_y or slot0.start_y
	slot0.space_x = slot0.setting.space_x or 3
	slot0.space_y = slot0.setting.space_y or 3
	slot0.item_width = slot0.setting.item_width or 115
	slot0.item_height = slot0.setting.item_height or 115
	slot0.row = slot0.setting.row or 5
	slot0.col = slot0.setting.col or 5
	slot0.delay = 1
	slot0.once_num = slot0.setting.once_num or 1
	slot0.need_dynamic = true
	slot0.checkovercallback = slot0.setting.checkovercallback
	slot0.is_auto_scroll = slot1.is_auto_scroll or false
	slot0.position_data_list = slot0.setting.position_data_list
	slot0.container_width = slot1.container_width
	slot0.container_height = slot1.container_height
	slot0.inner_hight_offset = slot1.inner_hight_offset or 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot0.row = 1
	end

	slot0:calculationMaxSum()
end

function CommonScrollViewSingleLayout.updateSetting(slot0, slot1)
	if not slot1 then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		slot0[slot5] = slot6
	end
end

function CommonScrollViewSingleLayout.calculationMaxSum(slot0)
	slot1 = nil
	slot0.cacheMaxSize = slot0.dir == ScrollViewDir.horizontal and (math.ceil(slot0.size.width / (slot0.item_width + slot0.space_x)) + 1) * slot0.row or (math.ceil(slot0.size.height / (slot0.item_height + slot0.space_y)) + 1) * slot0.col
end

function CommonScrollViewSingleLayout.createRootWnd(slot0)
	slot0:setContentSize(slot0.size)

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0)
	end

	slot0:setPosition(slot0.pos)
	slot0:setAnchorPoint(slot0.ap)

	slot0.scroll_view = createScrollView(slot0.size.width, slot0.size.height, 0, 0, slot0, slot0.dir)
	slot0.container = slot0.scroll_view:getInnerContainer()

	slot0:registerEvent()
end

function CommonScrollViewSingleLayout.registerEvent(slot0)
	if slot0.need_dynamic == true then
		slot0.scroll_view:addEventListener(function (slot0, slot1)
			if slot1 == ccui.ScrollviewEventType.containerMoved then
				uv0:checkRectIntersectsRect()

				if uv0.checkovercallback then
					uv0.checkovercallback()
				end
			end
		end)
	end
end

function CommonScrollViewSingleLayout.registerScriptHandlerSingle(slot0, slot1, slot2)
	slot0.handler[slot2] = slot1
end

function CommonScrollViewSingleLayout.numberOfCells(slot0)
	if not slot0.handler[ScrollViewFuncType.NumberOfCells] then
		return
	end

	return slot0.handler[ScrollViewFuncType.NumberOfCells]()
end

function CommonScrollViewSingleLayout.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.handler[ScrollViewFuncType.UpdateCellByIndex] then
		return
	end

	slot0.handler[ScrollViewFuncType.UpdateCellByIndex](slot1, slot2)
end

function CommonScrollViewSingleLayout.createNewCell(slot0)
	if not slot0.handler[ScrollViewFuncType.CreateNewCell] then
		return
	end

	return slot0.handler[ScrollViewFuncType.CreateNewCell](slot0.item_width, slot0.item_height)
end

function CommonScrollViewSingleLayout.onCellTouched(slot0, slot1, slot2)
	if not slot0.handler[ScrollViewFuncType.OnCellTouched] then
		return
	end

	slot0.handler[ScrollViewFuncType.OnCellTouched](slot1, slot2)
end

function CommonScrollViewSingleLayout.setClickEnabled(slot0, slot1)
	slot0.scroll_view:setTouchEnabled(slot1)
end

function CommonScrollViewSingleLayout.setSwallowTouches(slot0, slot1)
	slot0.scroll_view:setSwallowTouches(slot1)
end

function CommonScrollViewSingleLayout.setBounceEnabled(slot0, slot1)
	slot0.scroll_view:setBounceEnabled(slot1)
end

function CommonScrollViewSingleLayout.checkRectIntersectsRect(slot0)
	if slot0.dir == ScrollViewDir.vertical then
		if slot0.start_pos == ScrollViewStartPos.top then
			slot0:checkOverShowByVertical()
		else
			slot0:checkOverShowByVerticalBottom()
		end
	elseif slot0.dir == ScrollViewDir.horizontal then
		slot0:checkOverShowByHorizontal()
	end
end

function CommonScrollViewSingleLayout.checkOverShowByVertical(slot0)
	if not slot0.cellList then
		return
	end

	slot5 = 1

	for slot9 = 1, math.ceil(#slot0.cellList / slot0.col) do
		slot5 = slot9

		if slot0.cellList[1 + (slot9 - 1) * slot0.col] and slot0.size.height + -slot0.container:getPositionY() >= slot11.y - slot0.item_height * 0.5 then
			break
		end
	end

	slot6 = slot4

	if slot2 > 0 then
		for slot10 = slot5, slot4 do
			if slot0.cellList[1 + (slot10 - 1) * slot0.col] and slot2 > slot12.y + slot0.item_height * 0.5 then
				slot6 = slot10 - 1

				break
			end
		end
	end

	slot7 = slot0:numberOfCells()

	for slot11 = 1, slot4 do
		if slot5 <= slot11 and slot11 <= slot6 then
			for slot15 = 1, slot0.col do
				if not slot0.activeCellIdx[(slot11 - 1) * slot0.col + slot15] and slot16 <= slot7 then
					slot0:updateCellAtIndex(slot16)

					slot0.activeCellIdx[slot16] = true
				end
			end
		else
			for slot15 = 1, slot0.col do
				if slot7 >= (slot11 - 1) * slot0.col + slot15 then
					slot0.activeCellIdx[slot16] = false
				end
			end
		end
	end
end

function CommonScrollViewSingleLayout.checkOverShowByVerticalBottom(slot0)
	if not slot0.cellList then
		return
	end

	slot4 = math.ceil(#slot0.cellList / slot0.col)
	slot5 = slot4

	for slot9 = slot4, 1, -1 do
		slot5 = slot9

		if slot0.cellList[1 + (slot9 - 1) * slot0.col] and slot0.size.height + -slot0.container:getPositionY() >= slot11.y - slot0.item_height * 0.5 then
			break
		end
	end

	slot6 = 1

	if slot2 > 0 then
		for slot10 = slot5, 1, -1 do
			if slot0.cellList[1 + (slot10 - 1) * slot0.col] and slot2 > slot12.y + slot0.item_height * 0.5 then
				slot6 = slot10 + 1

				break
			end
		end
	end

	slot7 = slot0:numberOfCells()

	for slot11 = 1, slot4 do
		if slot11 <= slot5 and slot6 <= slot11 then
			for slot15 = 1, slot0.col do
				if not slot0.activeCellIdx[(slot11 - 1) * slot0.col + slot15] and slot16 <= slot7 then
					slot0:updateCellAtIndex(slot16)

					slot0.activeCellIdx[slot16] = true
				end
			end
		else
			for slot15 = 1, slot0.col do
				if slot7 >= (slot11 - 1) * slot0.col + slot15 then
					slot0.activeCellIdx[slot16] = false
				end
			end
		end
	end
end

function CommonScrollViewSingleLayout.checkOverShowByHorizontal(slot0)
	if not slot0.cellList then
		return
	end

	slot2 = -slot0.container:getPositionX()
	slot3 = slot2 + slot0.size.width
	slot4 = #slot0.cellList
	slot5 = 1

	if slot2 > 0 then
		for slot9 = 1, slot4 do
			slot5 = slot9

			if slot0.cellList[slot9] and slot2 <= slot10.x + slot0.item_width * 0.5 then
				break
			end
		end
	end

	slot6 = slot4

	for slot10 = slot5, slot4 do
		if slot0.cellList[slot10] and slot3 < slot11.x - slot0.item_width * 0.5 then
			slot6 = slot10 - 1

			break
		end
	end

	for slot11 = 1, slot4 do
		if slot5 <= slot11 and slot11 <= slot6 then
			if not slot0.activeCellIdx[slot11] and slot11 <= slot0:numberOfCells() then
				slot0:updateCellAtIndex(slot11)

				slot0.activeCellIdx[slot11] = true
			end
		elseif slot11 <= slot7 then
			slot0.activeCellIdx[slot11] = false
		end
	end
end

function CommonScrollViewSingleLayout.updateMove(slot0, slot1)
	slot2 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(0.1, cc.p(slot2.x, slot2.y)))))
end

function CommonScrollViewSingleLayout.jumpToMove(slot0, slot1, slot2, slot3)
	slot4 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.MoveTo:create(slot2 or 1, cc.p(slot4.x, slot4.y)), cc.CallFunc:create(function ()
		if uv0 then
			uv0()
		end
	end)))
end

function CommonScrollViewSingleLayout.checkPosition(slot0, slot1, slot2)
	slot4 = slot0.container:getPositionY()

	if slot0.dir == ScrollViewDir.horizontal then
		slot3 = slot0.container:getPositionX() + slot1
	elseif slot0.dir == ScrollViewDir.vertical then
		slot4 = slot4 + slot2
	end

	if slot3 > 0 then
		slot3 = 0
	elseif slot3 < slot0.size.width - slot0.container_size.width then
		slot3 = slot0.size.width - slot0.container_size.width
	end

	if slot4 > 0 then
		slot4 = 0
	elseif slot4 < slot0.size.height - slot0.container_size.height then
		slot4 = slot0.size.height - slot0.container_size.height
	end

	return cc.p(slot3, slot4)
end

function CommonScrollViewSingleLayout.getCurContainerPosY(slot0)
	if slot0.container and not tolua.isnull(slot0.container) then
		return slot0.container:getPositionY()
	end
end

function CommonScrollViewSingleLayout.getCurContainerPosX(slot0)
	if slot0.container and not tolua.isnull(slot0.container) then
		return slot0.container:getPositionX()
	end
end

function CommonScrollViewSingleLayout.setInnerContainer(slot0)
	slot2 = slot0.container_width or slot0.size.width
	slot3 = slot0.container_height or slot0.size.height

	if slot0.dir == ScrollViewDir.horizontal then
		if slot0.container_width == nil then
			slot4 = math.ceil(slot0:numberOfCells() / slot0.row)
			slot2 = slot4 * slot0.item_width + slot0.end_x + slot0.start_x + (slot4 - 1) * slot0.space_x
		end
	elseif slot0.container_height == nil then
		slot4 = math.ceil(slot1 / slot0.col)
		slot3 = slot4 * slot0.item_height + slot0.end_y + slot0.start_y + (slot4 - 1) * slot0.space_y + slot0.inner_hight_offset
	end

	slot0.container_size = cc.size(math.max(slot2, slot0.size.width), math.max(slot3, slot0.size.height))
	slot0.cur_container_x, slot0.cur_container_y = slot0.container:getPosition()

	slot0.scroll_view:setInnerContainerSize(slot0.container_size)

	if slot0.start_pos == ScrollViewStartPos.top then
		slot0.scroll_view:jumpToTop()
	elseif slot0.start_pos == ScrollViewStartPos.bottom then
		slot0.scroll_view:jumpToBottom()
	end
end

function CommonScrollViewSingleLayout.resetCurrentItems(slot0)
	for slot4, slot5 in pairs(slot0.activeCellIdx) do
		if slot5 then
			slot0:updateCellAtIndex(slot4)
		end
	end
end

function CommonScrollViewSingleLayout.resetItemByIndex(slot0, slot1)
	if slot0.activeCellIdx[slot1] then
		slot0:updateCellAtIndex(slot1)
	end
end

function CommonScrollViewSingleLayout.getActiveCellList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.activeCellIdx) do
		if slot6 and slot0.cellList[slot5] and slot0.cellList[slot5].cell then
			uv0(slot1, slot0.cellList[slot5].cell)
		end
	end

	return slot1
end

function CommonScrollViewSingleLayout.getCellByIndex(slot0, slot1)
	if slot0.cellList[slot1] and slot0.cellList[slot1].cell then
		return slot0.cellList[slot1].cell
	end
end

function CommonScrollViewSingleLayout.getCellXYByIndex(slot0, slot1)
	if slot0.cellList[slot1] then
		return slot0.cellList[slot1].x, slot0.cellList[slot1].y
	end
end

function CommonScrollViewSingleLayout.getActiveCellByIndex(slot0, slot1)
	if slot0.activeCellIdx[slot1] and slot0.cellList[slot1] then
		return slot0.cellList[slot1].cell
	end
end

function CommonScrollViewSingleLayout.getContainerXY(slot0)
	if slot0.container then
		slot1, slot2 = slot0.container:getPosition()

		return slot1, slot2
	end
end

function CommonScrollViewSingleLayout.setContainerXY(slot0, slot1, slot2)
	if slot0.container then
		if slot1 and slot2 then
			slot0.container:setPosition(slot1, slot2)
		else
			if slot1 then
				slot0.container:setPositionX(slot1)
			end

			if slot2 then
				slot0.container:setPositionY(slot2)
			end
		end
	end
end

function CommonScrollViewSingleLayout.isActiveByIndex(slot0, slot1)
	if slot0.activeCellIdx[slot1] then
		return true
	end

	return false
end

function CommonScrollViewSingleLayout.jumpToMoveByIndex(slot0, slot1)
	if not slot0.cellList[slot1] then
		return
	end

	if slot0.container_size.height - ((slot0.cellList[slot1].y or 0) + slot0.size.height * 0.5) < 0 then
		slot3 = 0
	end

	if slot3 * 100 / (slot0.container_size.height - slot0.size.height) > 100 then
		slot4 = 100
	end

	if slot4 == 100 then
		if slot0.start_pos == ScrollViewStartPos.top then
			slot0:checkOverShowByVertical()
		else
			slot0:checkOverShowByVerticalBottom()
		end
	end

	slot0.scroll_view:scrollToPercentVertical(slot4, 0.8, true)
end

function CommonScrollViewSingleLayout.reloadData(slot0, slot1, slot2, slot3)
	if slot2 then
		slot0:updateSetting(slot2)
	end

	slot4 = 0
	slot5 = 0

	if slot0.container_size then
		slot4 = slot0.container_size.width
		slot5 = slot0.container_size.height
	end

	slot0.cellList = {}
	slot0.activeCellIdx = {}

	for slot9, slot10 in ipairs(slot0.cacheList) do
		slot10:setPositionX(-10000)
	end

	slot0:setInnerContainer()

	if slot0:numberOfCells() == 0 then
		return
	end

	for slot10 = 1, slot6 do
		slot11 = nil

		if slot10 <= slot0.time_show_index then
			slot11 = slot0:getCacheCellByIndex(slot10)
		end

		slot13, slot14 = nil

		if slot0.position_data_list then
			if slot0.position_data_list[#slot0.cellList + 1] then
				slot14 = slot15.y
				slot13 = slot15.x
			else
				slot13, slot14 = slot0:getCellPosition(slot12 + 1)
			end
		else
			slot13, slot14 = slot0:getCellPosition(slot12 + 1)
		end

		uv0(slot0.cellList, {
			cell = slot11,
			x = slot13,
			y = slot14
		})
	end

	if slot0.is_first_init then
		slot0:startTimeTicket()
	elseif slot0.time_show_index <= slot6 then
		slot0:startTimeTicket()
	end

	if slot3 then
		slot7 = slot0.cur_container_x or 0

		if slot0.dir == ScrollViewDir.vertical then
			if slot0.start_pos == ScrollViewStartPos.top then
				slot8 = (slot0.cur_container_y or 0) - (slot0.container_size.height - slot5)
			end

			if slot8 > 0 then
				slot8 = 0
			elseif slot8 < slot0.size.height - slot0.container_size.height then
				slot8 = slot0.size.height - slot0.container_size.height
			end
		elseif slot0.dir == ScrollViewDir.horizontal then
			if slot7 > 0 then
				slot7 = 0
			elseif slot7 < slot0.size.width - slot0.container_size.width then
				slot7 = slot0.size.width - slot0.container_size.width
			end
		end

		slot0.container:setPosition(slot7, slot8)
		slot0:checkRectIntersectsRect()
	elseif slot1 == nil then
		slot7 = nil
		slot7 = slot0.dir == ScrollViewDir.horizontal and slot0.cacheMaxSize - slot0.row or slot0.cacheMaxSize - slot0.col

		for slot12 = 1, slot6 < slot7 and slot6 or slot7 do
			if slot12 <= slot0.time_show_index then
				slot0:updateCellAtIndex(slot12)
			end

			slot0.activeCellIdx[slot12] = true
		end
	else
		slot0:selectCellByIndex(slot1)
	end

	if slot0.is_auto_scroll then
		slot7 = slot0.cacheMaxSize

		if slot6 <= (slot0.dir == ScrollViewDir.horizontal and slot7 - 2 * slot0.row or slot7 - 2 * slot0.col) then
			slot0:setClickEnabled(false)
		else
			slot0:setClickEnabled(true)
		end
	end
end

function CommonScrollViewSingleLayout.selectCellByIndex(slot0, slot1)
	if slot0.cellList[slot1 or 1] == nil then
		slot2 = 1
	end

	if slot0.cellList[slot2] == nil then
		return
	end

	slot3 = nil

	if slot0:numberOfCells() < (slot0.dir == ScrollViewDir.horizontal and slot0.cacheMaxSize - slot0.row or slot0.cacheMaxSize - slot0.col) then
		if slot0.time_show_index == 0 then
			slot0.time_show_index = slot2
		end

		for slot8 = 1, slot4 do
			if slot8 <= slot0.time_show_index then
				slot0:updateCellAtIndex(slot8)
			end

			slot0.activeCellIdx[slot8] = true
		end
	elseif slot0.dir == ScrollViewDir.horizontal then
		slot5 = nil

		if (slot2 == 1 and 0 or -(slot0.cellList[slot2].x - (slot0.item_width + slot0.space_x) * 0.5)) < -(slot0.container_size.width - slot0.size.width) then
			slot5 = slot6
		end

		if slot0.time_show_index < math.floor(math.abs(slot5) / slot0.item_width) + 1 then
			slot0.time_show_index = slot7
		end

		slot0.container:setPositionX(slot5)
		slot0:checkRectIntersectsRect()
	else
		slot5 = nil

		if (slot2 == 1 and slot0.start_y + slot0.cellList[slot2].y + slot0.item_height * 0.5 - slot0.size.height or slot0.cellList[slot2].y + (slot0.item_height + slot0.space_y) * 0.5 - slot0.size.height) < 0 then
			slot5 = 0
		end

		if slot0.time_show_index < (math.floor((slot0.container_size.height - (slot5 + slot0.size.height)) / slot0.item_height) + 1 - 1) * slot0.col + 1 then
			slot0.time_show_index = slot7
		end

		slot0.container:setPositionY(-slot5)
		slot0:checkRectIntersectsRect()
	end

	if slot2 > 0 and slot2 <= slot0:numberOfCells() then
		slot5 = slot0:getCacheCellByIndex(slot2)
		slot5.index = slot2
		slot0.cellList[slot2].cell = slot5

		slot0:onCellTouched(slot5, slot2)
	end
end

function CommonScrollViewSingleLayout.setOnCellTouched(slot0, slot1)
	slot2 = slot0:getCacheCellByIndex(slot1)
	slot2.index = slot1
	slot0.cellList[slot1].cell = slot2

	slot0:onCellTouched(slot2, slot1)
end

function CommonScrollViewSingleLayout.startTimeTicket(slot0)
	if slot0.time_ticket == nil then
		if #slot0.cellList == 0 then
			return
		end

		slot1 = slot0.once_num or 1
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if tolua.isnull(uv0.container) then
				return
			end

			slot0 = uv0.time_show_index + uv1

			if uv0.time_show_index + 1 == 0 then
				slot1 = 1
			end

			slot2 = #uv0.cellList
			uv0.time_show_index = uv0.time_show_index + uv1

			for slot6 = slot1, slot0 do
				if slot2 < slot6 then
					break
				end

				if uv0.cellList[slot6] and slot7.cell == nil then
					slot7.cell = uv0:getCacheCellByIndex(slot6)
				end

				if uv0.activeCellIdx[slot6] then
					uv0:updateCellAtIndex(slot6)
				end
			end

			if slot2 <= uv0.time_show_index then
				uv0:clearTimeTicket()

				uv0.is_first_init = false
			end
		end, slot0.delay / display.DEFAULT_FPS)
	end
end

function CommonScrollViewSingleLayout.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function CommonScrollViewSingleLayout.getCellPosition(slot0, slot1)
	slot2 = slot1
	slot3 = cc.p(0.5, 0.5)
	slot4 = 0
	slot5 = 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot4 = slot0.start_x + slot0.item_width * slot3.x + (slot0.item_width + slot0.space_x) * math.floor((slot1 - 1) / slot0.row)
		slot5 = slot0.container_size.height - (slot0.start_y + slot0.item_height * (1 - slot3.y) + (slot1 - 1) % slot0.row * (slot0.item_height + slot0.space_y))
	elseif slot0.start_pos == ScrollViewStartPos.top then
		slot4 = slot0.start_x + slot0.item_width * slot3.x + (slot0.item_width + slot0.space_x) * ((slot1 - 1) % slot0.col)
		slot5 = slot0.container_size.height - (slot0.start_y + slot0.item_height * (1 - slot3.y) + math.floor((slot1 - 1) / slot0.col) * (slot0.item_height + slot0.space_y))
	else
		slot4 = slot0.start_x + slot0.item_width * slot3.x + (slot0.item_width + slot0.space_x) * ((slot1 - 1) % slot0.col)
		slot5 = slot0.start_y + slot0.item_height * slot3.y + math.floor((slot1 - 1) / slot0.col) * (slot0.item_height + slot0.space_y)
	end

	return slot4, slot5
end

function CommonScrollViewSingleLayout.getCacheCellByIndex(slot0, slot1)
	if not slot0.cacheList[(slot1 - 1) % slot0.cacheMaxSize + 1] then
		if slot0:createNewCell() then
			slot3:setAnchorPoint(cc.p(0.5, 0.5))
			slot3:setPositionX(-10000)

			slot0.cacheList[slot2] = slot3

			slot0.scroll_view:addChild(slot3)
		end

		return slot3
	else
		return slot0.cacheList[slot2]
	end
end

function CommonScrollViewSingleLayout.updateCellAtIndex(slot0, slot1)
	if slot0.time_show_index < slot1 then
		return
	end

	if not slot0.cellList[slot1] then
		return
	end

	if slot0.cellList[slot1].cell == nil then
		slot2.cell = slot0:getCacheCellByIndex(slot1)
	end

	slot2.cell:setPosition(slot2.x, slot2.y)
	slot0:updateCellByIndex(slot2.cell, slot1)
end

function CommonScrollViewSingleLayout.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function CommonScrollViewSingleLayout.getMaxSize(slot0)
	return slot0.container_size
end

function CommonScrollViewSingleLayout.getContainer(slot0)
	return slot0.container
end

function CommonScrollViewSingleLayout.scrollToPercentVertical(slot0, slot1, slot2)
	slot0.scroll_view:scrollToPercentVertical(slot1, slot2, true)
end

function CommonScrollViewSingleLayout.DeleteMe(slot0)
	doStopAllActions(slot0.container)
	slot0:clearTimeTicket()

	for slot4, slot5 in ipairs(slot0.cacheList) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.cellList = nil
	slot0.activeCellIdx = nil
	slot0.cacheList = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
