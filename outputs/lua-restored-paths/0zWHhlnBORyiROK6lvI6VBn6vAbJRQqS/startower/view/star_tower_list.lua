slot0 = table.insert
slot1 = table.remove
slot2 = table.sort
slot3 = StartowerController:getInstance()
StarTowerList = class("StarTowerList", function ()
	return ccui.Layout:create()
end)

function StarTowerList.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot1
	slot0.pos = slot2 or cc.p(0, 0)
	slot0.dir = ScrollViewDir.horizontal
	slot0.start_pos = ScrollViewStartPos.bottom
	slot0.size = slot3 or cc.size(100, 100)
	slot0.ap = cc.p(0, 0)
	slot0.cellList = {}
	slot0.cacheList = {}
	slot0.activeCellIdx = {}
	slot0.selectCellIndex = 1
	slot0.handler = {}
	slot0.start_x = 0
	slot0.space_x = 0
	slot0.start_y = 0
	slot0.space_y = 0
	slot0.item_width = 360
	slot0.item_height = 720
	slot0.row = 1
	slot0.col = 5
	slot0.cacheMaxSize = 5

	slot0:createRootWnd()

	slot0.bg_param = 2
end

function StarTowerList.createRootWnd(slot0)
	slot0:setContentSize(slot0.size)

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0)
	end

	slot0:setPosition(slot0.pos)
	slot0:setAnchorPoint(slot0.ap)

	slot0.scroll_view = createScrollView(slot0.size.width, slot0.size.height, -slot0.size.width / 2, 190, slot0, slot0.dir)

	slot0.scroll_view:setBounceEnabled(false)
	slot0.scroll_view:setTouchEnabled(false)
	slot0.scroll_view:setZOrder(2)

	slot0.container = slot0.scroll_view:getInnerContainer()

	slot0:registerEvent()
end

function StarTowerList.registerEvent(slot0)
	slot0.scroll_view:addEventListener(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.containerMoved then
			uv0:checkRectIntersectsRect()
		end
	end)
end

function StarTowerList.registerScriptHandlerSingle(slot0, slot1, slot2)
	slot0.handler[slot2] = slot1
end

function StarTowerList.numberOfCells(slot0)
	if not slot0.handler[ScrollViewFuncType.NumberOfCells] then
		return
	end

	return slot0.handler[ScrollViewFuncType.NumberOfCells]()
end

function StarTowerList.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.handler[ScrollViewFuncType.UpdateCellByIndex] then
		return
	end

	slot0.handler[ScrollViewFuncType.UpdateCellByIndex](slot1, slot2)
end

function StarTowerList.createNewCell(slot0)
	if not slot0.handler[ScrollViewFuncType.CreateNewCell] then
		return
	end

	return slot0.handler[ScrollViewFuncType.CreateNewCell](slot0.item_width, slot0.item_height)
end

function StarTowerList.onCellTouched(slot0, slot1, slot2)
	if not slot0.handler[ScrollViewFuncType.OnCellTouched] then
		return
	end

	slot0.handler[ScrollViewFuncType.OnCellTouched](slot1, slot2)
end

function StarTowerList.setClickEnabled(slot0, slot1)
end

function StarTowerList.setSwallowTouches(slot0, slot1)
	slot0.scroll_view:setSwallowTouches(slot1)
end

function StarTowerList.checkRectIntersectsRect(slot0)
	if slot0.dir == ScrollViewDir.horizontal then
		slot0:checkOverShowByVertical()
	end
end

function StarTowerList.checkOverShowByVertical(slot0)
	if not slot0.cellList then
		return
	end

	slot1 = slot0.container:getPositionX()

	if slot0.scroll_view_bg and slot0.scroll_view_bg:getContainer() then
		-- Nothing
	end

	slot4 = math.ceil(#slot0.cellList / slot0.row)
	slot5 = slot4

	for slot9 = slot4, 1, -1 do
		slot5 = slot9

		if slot0.cellList[1 + (slot9 - 1) * slot0.row] and slot11.x <= slot0.size.width + -slot1 + 180 then
			break
		end
	end

	slot6 = 1

	if slot2 > 0 then
		for slot10 = slot5, 1, -1 do
			if slot0.cellList[1 + (slot10 - 1) * slot0.row] and slot12.x + slot0.item_width < slot2 - 180 then
				slot6 = slot10 + 1

				break
			end
		end
	end

	slot7 = slot0:numberOfCells()

	for slot11 = 1, slot4 do
		if slot11 <= slot5 and slot6 <= slot11 then
			for slot15 = 1, slot0.row do
				if not slot0.activeCellIdx[(slot11 - 1) * slot0.row + slot15] and slot16 <= slot7 then
					slot0:updateCellAtIndex(slot16)

					slot0.activeCellIdx[slot16] = true
				end
			end
		else
			for slot15 = 1, slot0.row do
				if slot7 >= (slot11 - 1) * slot0.row + slot15 then
					slot0.activeCellIdx[slot16] = false
				end
			end
		end
	end
end

function StarTowerList.updateMove(slot0, slot1)
	slot2 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(0.1, cc.p(slot2.x, slot2.y)))))
end

function StarTowerList.jumpToMove(slot0, slot1, slot2, slot3)
	slot4 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.MoveTo:create(slot2 or 1, cc.p(slot4.x, slot4.y)), cc.CallFunc:create(function ()
		if uv0 then
			uv0()

			for slot3, slot4 in ipairs(uv1.cacheList) do
				if slot4.removePeopleAnime then
					slot4:removePeopleAnime()
					slot4:addPeopleAnime()
				end
			end
		end
	end)))
end

function StarTowerList.checkPosition(slot0, slot1, slot2)
	slot4 = slot0.container:getPositionY()

	if slot0.dir == ScrollViewDir.horizontal then
		slot3 = slot0.container:getPositionX() + slot1
	elseif slot0.dir == ScrollViewDir.horizontal then
		slot4 = slot4 + slot2
	end

	if slot3 > 0 then
		slot3 = 0
	elseif slot3 == -slot0.size.width * 2 * 1997 then
		slot3 = -slot0.size.width * 2 * 1997.5
	elseif slot3 < -slot0.size.width * 2 * 1998 then
		slot3 = -slot0.size.width * 2 * 1998
	elseif slot3 == -360 then
		slot3 = -180
	end

	if slot4 > 0 then
		slot4 = 0
	elseif slot4 < slot0.size.height - slot0.container_size.height then
		slot4 = slot0.size.height - slot0.container_size.height
	end

	return cc.p(slot3, slot4)
end

function StarTowerList.setInnerContainer(slot0)
	slot0.container_size = cc.size(slot0.size.width * slot0:numberOfCells() - 180, math.max(1280, slot0.size.height))

	slot0.scroll_view:setInnerContainerSize(slot0.container_size)

	if slot0.start_pos == ScrollViewStartPos.bottom then
		slot0.scroll_view:jumpToBottom()
	end
end

function StarTowerList.resetCurrentItems(slot0)
	for slot4, slot5 in pairs(slot0.activeCellIdx) do
		if slot5 then
			slot0:updateCellAtIndex(slot4)
		end
	end
end

function StarTowerList.resetItemByIndex(slot0, slot1)
	if slot0.activeCellIdx[slot1] then
		slot0:updateCellAtIndex(slot1)
	end
end

function StarTowerList.getActiveCellList(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.activeCellIdx) do
		if slot6 and slot0.cellList[slot5] and slot0.cellList[slot5].cell then
			uv0(slot1, slot0.cellList[slot5].cell)
		end
	end

	return slot1
end

function StarTowerList.getCellByIndex(slot0, slot1)
	if slot0.cellList[slot1] and slot0.cellList[slot1].cell then
		return slot0.cellList[i].cell
	end
end

function StarTowerList.getCellXYByIndex(slot0, slot1)
	if slot0.cellList[slot1] and slot0.cellList[slot1].cell then
		return slot0.cellList[i].x, slot0.cellList[i].y
	end
end

function StarTowerList.reloadData(slot0, slot1)
	slot0.cellList = {}
	slot0.activeCellIdx = {}

	for slot5, slot6 in ipairs(slot0.cacheList) do
		slot6:setPositionX(-10000)
	end

	if slot0:numberOfCells() == 0 then
		return
	end

	for slot6 = 1, slot2 do
		slot9, slot10 = slot0:getCellCrosswisePos(#slot0.cellList + 1)

		uv0(slot0.cellList, {
			cell = slot0:getCacheCellByIndex(slot6),
			x = slot9,
			y = slot10
		})
	end

	if slot1 == nil then
		for slot8 = 1, slot2 < slot0.cacheMaxSize - slot0.row and slot2 or slot3 do
			slot0:updateCellAtIndex(slot8)

			slot0.activeCellIdx[slot8] = true
		end
	else
		slot0:selectCellByIndex(slot1)
	end
end

function StarTowerList.setLeftClick(slot0)
	slot0:jumpToMove(cc.p(360, 0), 0.1, function ()
		uv0:checkOverShowByVertical()
	end)
end

function StarTowerList.setRightClick(slot0)
	slot0:jumpToMove(cc.p(-360, 0), 0.1, function ()
		uv0:checkOverShowByVertical()
	end)
end

function StarTowerList.jumpToMoveByY(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.container_size.height - (slot1 + slot0.size.height * 0.5) < 0 then
		slot2 = 0
	end

	if slot2 * 100 / (slot0.container_size.height - slot0.size.height) > 100 then
		slot3 = 100
	end

	if slot3 == 100 then
		slot0:checkOverShowByVertical()
	end

	slot0.scroll_view:scrollToPercentVertical(slot3, 0.5, true)
end

function StarTowerList.updateBgList(slot0)
	if slot0.scroll_view_bg == nil then
		slot2 = cc.size(720, 1280)
		slot0.bg_max_count = math.ceil(slot0.container_size.height / slot0.bg_param / (958 * display.getMaxScale())) + 1
		slot0.scroll_view_bg = CommonScrollViewSingleLayout.new(slot0, cc.p(-slot2.width / 2, 130), ScrollViewDir.horizontal, ScrollViewStartPos.bottom, slot2, {
			start_y = 0,
			item_height = 1280,
			start_x = 0,
			space_y = 0,
			col = 1,
			space_x = 0,
			row = 1,
			item_width = 720
		}, cc.p(0, 0))
		slot0.scroll_view_bg.time_show_index = slot0.bg_max_count + 1

		slot0.scroll_view_bg:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellBg), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view_bg:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsBg), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view_bg:setClickEnabled(false)
		slot0.scroll_view_bg:setBounceEnabled(false)
		slot0.scroll_view_bg:setContentSize(cc.size(slot0.container_size.width, slot0.container_size.height))
		delayRun(slot0, 3 / display.DEFAULT_FPS, function ()
			if uv0.scroll_view_bottom_bg == nil then
				uv0.scroll_view_bottom_bg = createImage(uv0.scroll_view_bg:getContainer(), PathTool.getPlistImgForDownLoad("bigbg", "bigbg_27", true), uv0.container_size.width / 2, 0, cc.p(0.5, 0), false, 1, false)

				uv0.scroll_view_bottom_bg:setScale(display.getMaxScale())
			end
		end)
	end

	slot0.scroll_view_bg:reloadData()
end

function StarTowerList.createNewCellBg(slot0)
	slot2 = createImage(nil, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_36", true), nil, nil, cc.p(0.5, 0), false, 0, false)

	slot2:setScale(display.getMaxScale())
	slot2:setContentSize(cc.size(720, 1280))

	return slot2
end

function StarTowerList.numberOfCellsBg(slot0)
	return slot0.bg_max_count or 0
end

function StarTowerList.showArrow(slot0)
	if not slot0.arrow_btn then
		slot0.arrow_btn = createButton(slot0.container, "", 0, 0, nil, PathTool.getResFrame("startower", "star_tower_1"))

		slot0.arrow_btn:setZOrder(10)
		slot0.arrow_btn:setAnchorPoint(cc.p(0, 0.5))

		slot2 = RoleController:getInstance():getRoleVo()
		slot0.head = PlayerHead.new(PlayerHead.type.circle)

		slot0.head:setHeadLayerScale(0.6)
		slot0.head:setPosition(47, 35)
		slot0.arrow_btn:addChild(slot0.head, 10)
		slot0.head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
		slot0.arrow_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:moveToArrowNewPosition()
			end
		end)
	end

	slot0:setNowArrowPos()
end

function StarTowerList.moveToArrowNewPosition(slot0)
	if not slot0.cellList[(uv0:getModel():getNowTowerId() or 0) + 1] then
		return
	end

	slot0:jumpToMove(cc.p(-360, 0), 0.2, function ()
		uv0:checkOverShowByVertical()
		uv0.cellList[uv1].cell:runUnLocking()
	end)
	slot0:setNowArrowPos()
end

function StarTowerList.setNowArrowPos(slot0)
	if not slot0.arrow_btn then
		return
	end

	if slot0:numberOfCells() < (uv0:getModel():getNowTowerId() or 0) + 1 then
		slot1 = slot2
	end

	if not slot0.cellList[slot1] then
		return
	end

	slot5 = slot3.y + slot0.item_height * 0.5
	slot0.arrow_height = slot5

	slot0.arrow_btn:setPosition(slot3.x + slot0.item_width * 0.5 - 5, slot5)
end

function StarTowerList.updateArrowPos(slot0, slot1, slot2)
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

function StarTowerList.selectCellByIndex(slot0, slot1)
	if slot0:numberOfCells() < slot0.cacheMaxSize - slot0.row then
		for slot7 = 1, slot3 do
			slot0:updateCellAtIndex(slot7)

			slot0.activeCellIdx[slot7] = true
		end
	else
		slot4 = nil

		if (slot1 <= 1 and 0 or slot0.cellList[slot1].x + 180) < 0 then
			slot4 = 0
		end

		slot0.container:setPositionX(-slot4)
		slot0:checkOverShowByVertical()
	end
end

function StarTowerList.getCellCrosswisePos(slot0, slot1)
	return slot0.start_x + slot0.item_width * cc.p(0.5, 0).x + (slot0.item_width + slot0.space_x) * (slot1 - 1) - 180, 150
end

function StarTowerList.getCellPosition(slot0, slot1)
	slot2 = cc.p(0.5, 0)

	return slot0.start_x + slot0.item_width * slot2.x + (slot0.item_width + slot0.space_x) * ((slot1 - 1) % slot0.row), slot0.start_y + slot0.item_height * slot2.y + math.floor((slot1 - 1) / slot0.row) * (slot0.item_height + slot0.space_y)
end

function StarTowerList.getCacheCellByIndex(slot0, slot1)
	if not slot0.cacheList[(slot1 - 1) % slot0.cacheMaxSize + 1] then
		if slot0:createNewCell() then
			slot3:setAnchorPoint(cc.p(0, 0))
			slot3:setPositionX(-10000)

			slot0.cacheList[slot2] = slot3

			slot0.scroll_view:addChild(slot3)
		end

		return slot3
	else
		return slot0.cacheList[slot2]
	end
end

function StarTowerList.updateCellAtIndex(slot0, slot1)
	if not slot0.cellList[slot1] then
		return
	end

	slot2 = slot0.cellList[slot1]

	slot2.cell:setPosition(slot2.x, slot2.y)
	slot0:updateCellByIndex(slot2.cell, slot1)
	slot0:updataPeopleAnime()
end

function StarTowerList.updataPeopleAnime(slot0)
	for slot4, slot5 in pairs(slot0.activeCellIdx) do
		if slot5 and type(slot0.cellList[slot4].cell.partner_model) == "nil" then
			slot0.cellList[slot4].cell:addPeopleAnime()
		end
	end
end

function StarTowerList.getMaxSize(slot0)
	return slot0.container_size
end

function StarTowerList.getContainer(slot0)
	return slot0.container
end

function StarTowerList.DeleteMe(slot0)
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
