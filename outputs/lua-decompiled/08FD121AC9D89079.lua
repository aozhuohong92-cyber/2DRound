slot0 = table.insert
slot1 = table.remove
slot2 = table.sort
slot3 = FruitTreasureController:getInstance()
FruitTreasureTreeList = class("FruitTreasureTreeList", function ()
	return ccui.Layout:create()
end)

function FruitTreasureTreeList.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot1
	slot0.pos = slot2 or cc.p(0, 0)
	slot0.dir = ScrollViewDir.vertical
	slot0.start_pos = ScrollViewStartPos.top
	slot0.size = slot3 or cc.size(100, 100)
	slot0.ap = cc.p(0.5, 0)
	slot0.cellList = {}
	slot0.cacheList = {}
	slot0.activeCellIdx = {}
	slot0.selectCellIndex = 1
	slot0.handler = {}
	slot0.start_x = 0
	slot0.space_x = 0
	slot0.start_y = 165
	slot0.top_height = 221
	slot0.space_y = 0
	slot0.item_width = 720
	slot0.item_height = 511
	slot0.col = 1
	slot0.cacheMaxSize = (math.ceil(slot0.size.height / (slot0.item_height + slot0.space_y)) + 1) * slot0.col

	slot0:createRootWnd()

	slot0.bg_param = 3
end

function FruitTreasureTreeList.createRootWnd(slot0)
	slot0:setContentSize(slot0.size)

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0)
	end

	slot0:setPosition(slot0.pos)
	slot0:setAnchorPoint(slot0.ap)

	slot0.scroll_view = createScrollView(slot0.size.width, slot0.size.height, 0, 0, slot0, slot0.dir)

	slot0.scroll_view:setBounceEnabled(false)
	slot0.scroll_view:setZOrder(2)

	slot0.container = slot0.scroll_view:getInnerContainer()

	slot0:registerEvent()
end

function FruitTreasureTreeList.registerEvent(slot0)
	slot0.scroll_view:addEventListener(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.containerMoved then
			uv0:checkRectIntersectsRect()
		end
	end)
end

function FruitTreasureTreeList.registerScriptHandlerSingle(slot0, slot1, slot2)
	slot0.handler[slot2] = slot1
end

function FruitTreasureTreeList.numberOfCells(slot0)
	if not slot0.handler[ScrollViewFuncType.NumberOfCells] then
		return
	end

	return slot0.handler[ScrollViewFuncType.NumberOfCells]()
end

function FruitTreasureTreeList.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.handler[ScrollViewFuncType.UpdateCellByIndex] then
		return
	end

	slot0.handler[ScrollViewFuncType.UpdateCellByIndex](slot1, slot2)
end

function FruitTreasureTreeList.createNewCell(slot0)
	if not slot0.handler[ScrollViewFuncType.CreateNewCell] then
		return
	end

	return slot0.handler[ScrollViewFuncType.CreateNewCell](slot0.item_width, slot0.item_height)
end

function FruitTreasureTreeList.onCellTouched(slot0, slot1, slot2)
	if not slot0.handler[ScrollViewFuncType.OnCellTouched] then
		return
	end

	slot0.handler[ScrollViewFuncType.OnCellTouched](slot1, slot2)
end

function FruitTreasureTreeList.setClickEnabled(slot0, slot1)
	slot0.scroll_view:setTouchEnabled(slot1)
end

function FruitTreasureTreeList.setSwallowTouches(slot0, slot1)
	slot0.scroll_view:setSwallowTouches(slot1)
end

function FruitTreasureTreeList.checkRectIntersectsRect(slot0)
	if slot0.dir == ScrollViewDir.vertical then
		slot0:checkOverShowByVertical()
	end
end

function FruitTreasureTreeList.checkOverShowByVertical(slot0)
	if not slot0.cellList then
		return
	end

	slot4 = math.ceil(#slot0.cellList / slot0.col)
	slot5 = slot4

	for slot9 = slot4, 1, -1 do
		slot5 = slot9

		if slot0.cellList[1 + (slot9 - 1) * slot0.col] and slot11.y <= slot0.size.height + -slot0.container:getPositionY() then
			break
		end
	end

	slot6 = 1

	if slot2 > 0 then
		for slot10 = slot5, 1, -1 do
			if slot0.cellList[1 + (slot10 - 1) * slot0.col] and slot2 > slot12.y + slot0.item_height then
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

	slot0:updateArrowPos(slot3, slot2)
end

function FruitTreasureTreeList.updateMove(slot0, slot1)
	slot2 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(0.1, cc.p(slot2.x, slot2.y)))))
end

function FruitTreasureTreeList.jumpToMove(slot0, slot1, slot2, slot3)
	slot4 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.MoveTo:create(slot2 or 1, cc.p(slot4.x, slot4.y)), cc.CallFunc:create(function ()
		if uv0 then
			uv0()
		end
	end)))
end

function FruitTreasureTreeList.checkPosition(slot0, slot1, slot2)
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

function FruitTreasureTreeList.setInnerContainer(slot0)
	slot3 = math.ceil(slot0:numberOfCells() / slot0.col)
	slot0.container_size = cc.size(slot0.size.width, math.max(slot3 * slot0.item_height + slot0.top_height + (slot3 - 1) * slot0.space_y + slot0.top_height, slot0.size.height))

	slot0.scroll_view:setInnerContainerSize(slot0.container_size)

	if slot0.start_pos == ScrollViewStartPos.top then
		slot0.scroll_view:jumpToTop()
	end
end

function FruitTreasureTreeList.resetCurrentItems(slot0)
	for slot4, slot5 in pairs(slot0.activeCellIdx) do
		if slot5 then
			slot0:updateCellAtIndex(slot4)
		end
	end
end

function FruitTreasureTreeList.resetItemByIndex(slot0, slot1)
	if slot0.activeCellIdx[slot1] then
		slot0:updateCellAtIndex(slot1)
	end
end

function FruitTreasureTreeList.getActiveCellList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.activeCellIdx) do
		if slot6 and slot0.cellList[slot5] and slot0.cellList[slot5].cell then
			uv0(slot1, slot0.cellList[slot5].cell)
		end
	end

	return slot1
end

function FruitTreasureTreeList.getCellByIndex(slot0, slot1)
	if slot0.cellList[slot1] and slot0.cellList[slot1].cell then
		return slot0.cellList[i].cell
	end
end

function FruitTreasureTreeList.getCellXYByIndex(slot0, slot1)
	if slot0.cellList[slot1] and slot0.cellList[slot1].cell then
		return slot0.cellList[i].x, slot0.cellList[i].y
	end
end

function FruitTreasureTreeList.reloadData(slot0, slot1)
	slot0.cellList = {}
	slot0.activeCellIdx = {}

	for slot5, slot6 in ipairs(slot0.cacheList) do
		slot6:setPositionX(-10000)
	end

	if slot0:numberOfCells() == 0 then
		return
	end

	for slot6 = 1, slot2 do
		slot9, slot10 = slot0:getCellPosition(#slot0.cellList + 1)

		uv0(slot0.cellList, {
			cell = slot0:getCacheCellByIndex(slot6),
			x = slot9,
			y = slot10
		})
	end

	if slot1 == nil then
		for slot8 = 1, slot2 < slot0.cacheMaxSize - slot0.col and slot2 or slot3 do
			slot0:updateCellAtIndex(slot8)

			slot0.activeCellIdx[slot8] = true
		end
	else
		slot0:selectCellByIndex(slot1)
	end

	delayRun(slot0, 1 / display.DEFAULT_FPS, function ()
		if uv0.bottom_bg == nil then
			uv0.bottom_bg = createImage(uv0.container, PathTool.getPlistImgForDownLoad("fruittreasure", "tree_3"), uv0.start_x + uv0.item_width * 0.5 - 0, 0, cc.p(0.5, 0), false, 3, false)
		end
	end)
	delayRun(slot0, 2 / display.DEFAULT_FPS, function ()
		if uv0.top_bg == nil then
			uv0.top_bg = createImage(uv0.container, PathTool.getPlistImgForDownLoad("fruittreasure", "tree_1"), uv0.start_x + uv0.item_width * 0.5 - 0, uv0.cellList[uv1].y + uv0.item_height, cc.p(0.5, 0), false, 3, false)
		end
	end)
end

function FruitTreasureTreeList.jumpToMoveByY(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot0.container_size.height - (slot1 + slot0.size.height * 0.5) < 0 then
		slot3 = 0
	end

	if slot3 * 100 / (slot0.container_size.height - slot0.size.height) > 100 then
		slot4 = 100
	end

	if slot4 == 100 then
		slot0:checkOverShowByVertical()
	end

	slot0.scroll_view:scrollToPercentVertical(slot4, slot2 or 0.5, true)
end

function FruitTreasureTreeList.moveToPositionByIndex(slot0, slot1, slot2)
	if not slot0.cellList[slot1] then
		return
	end

	slot0:jumpToMoveByY(slot3.y, slot2)

	if slot2 then
		GlobalTimeTicket:getInstance():remove("moveStarSpeed")
		GlobalTimeTicket:getInstance():add(function ()
			GlobalEvent:getInstance():Fire(StartowerEvent.Jump_Success_Event, false)
		end, slot2 * 0.8, 1, "moveStarSpeed")
	end
end

function FruitTreasureTreeList.moveToArrowNewPosition(slot0, slot1)
	if not slot0.cellList[(uv0:getModel():getNowTowerId() or 0) + 1] then
		return
	end

	slot0:jumpToMoveByY(slot3.y, slot1)

	if slot1 then
		GlobalTimeTicket:getInstance():remove("moveStarSpeed")
		GlobalTimeTicket:getInstance():add(function ()
			GlobalEvent:getInstance():Fire(StartowerEvent.Jump_Success_Event, false)
		end, slot1, 1, "moveStarSpeed")
	end
end

function FruitTreasureTreeList.updateArrowPos(slot0, slot1, slot2)
	if not slot0.arrow_height then
		return
	end

	slot4 = 245

	if slot1 - 140 <= slot0.arrow_height then
		slot0.arrow_btn:setPositionY(slot1 - slot3)
	elseif slot0.arrow_height <= slot2 + slot4 then
		slot0.arrow_btn:setPositionY(slot2 + slot4)
	else
		slot0.arrow_btn:setPositionY(slot0.arrow_height)
	end
end

function FruitTreasureTreeList.selectCellByIndex(slot0, slot1)
	if slot0:numberOfCells() < slot0.cacheMaxSize - slot0.col then
		for slot7 = 1, slot3 do
			slot0:updateCellAtIndex(slot7)

			slot0.activeCellIdx[slot7] = true
		end
	else
		slot4 = nil

		if (slot1 <= 1 and 0 or slot0.cellList[slot1].y + slot0.item_height - slot0.size.height * 0.5) < 0 then
			slot4 = 0
		end

		slot0.container:setPositionY(-slot4)
		slot0:checkOverShowByVertical()
	end
end

function FruitTreasureTreeList.getCellPosition(slot0, slot1)
	slot2 = cc.p(0.5, 0)

	return slot0.start_x + slot0.item_width * slot2.x + (slot0.item_width + slot0.space_x) * ((slot1 - 1) % slot0.col), slot0.start_y + slot0.item_height * slot2.y + math.floor((slot1 - 1) / slot0.col) * (slot0.item_height + slot0.space_y)
end

function FruitTreasureTreeList.getCacheCellByIndex(slot0, slot1)
	if not slot0.cacheList[(slot1 - 1) % slot0.cacheMaxSize + 1] then
		if slot0:createNewCell() then
			slot3:setAnchorPoint(cc.p(0.5, 0))
			slot3:setPositionX(-10000)

			slot0.cacheList[slot2] = slot3

			slot0.scroll_view:addChild(slot3)
		end

		return slot3
	else
		return slot0.cacheList[slot2]
	end
end

function FruitTreasureTreeList.updateCellAtIndex(slot0, slot1)
	if not slot0.cellList[slot1] then
		return
	end

	slot2 = slot0.cellList[slot1]

	slot2.cell:setPosition(slot2.x, slot2.y)
	slot0:updateCellByIndex(slot2.cell, slot1)
end

function FruitTreasureTreeList.getMaxSize(slot0)
	return slot0.container_size
end

function FruitTreasureTreeList.getContainer(slot0)
	return slot0.container
end

function FruitTreasureTreeList.DeleteMe(slot0)
	doStopAllActions(slot0)
	doStopAllActions(slot0.container)

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
