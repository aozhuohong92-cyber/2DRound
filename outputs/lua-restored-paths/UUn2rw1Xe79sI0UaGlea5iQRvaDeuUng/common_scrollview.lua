slot0 = table.insert
slot1 = table.remove
slot2 = table.sort
slot3 = math.floor
CommonScrollViewLayout = class("CommonScrollViewLayout", function ()
	return ccui.Layout:create()
end)

function CommonScrollViewLayout.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.parent = slot1
	slot0.pos = slot2 or cc.p(0, 0)
	slot0.dir = slot3 or ScrollViewDir.vertical
	slot0.start_pos = slot4 or ScrollViewStartPos.top
	slot0.size = slot5 or cc.size(100, 100)
	slot0.ap = slot7 or cc.p(0, 0)
	slot0.total_cache_list = {}
	slot0.item_click_callback = nil
	slot0.extend = nil
	slot0.cur_item_class = nil
	slot0.is_radian = false
	slot0.is_scrolling = false
	slot0.cur_min_index = 0

	slot0:analysisSetting(slot6)
	slot0:createRootWnd()
end

function CommonScrollViewLayout.createRootWnd(slot0)
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

function CommonScrollViewLayout.registerEvent(slot0)
	if slot0.need_dynamic == true and slot0.dir == ScrollViewDir.vertical then
		slot0.scroll_view:addEventListener(function (slot0, slot1)
			if slot1 == ccui.ScrollviewEventType.containerMoved then
				uv0:checkRectIntersectsRect()
			elseif slot1 == ccui.ScrollviewEventType.bounceBottom and uv0.scrollToBottom_callback then
				uv0.scrollToBottom_callback()
			end
		end)
	end
end

function CommonScrollViewLayout.setClickEnabled(slot0, slot1)
	slot0.scroll_view:setTouchEnabled(slot1)
end

function CommonScrollViewLayout.checkRectIntersectsRect(slot0)
	if slot0.need_dynamic == false then
		return
	end

	if slot0.dir == ScrollViewDir.vertical then
		slot0:checkOverShowByVertical()
	elseif slot0.dir == ScrollViewDir.horizontal then
		slot0:checkOverShowByHorizontal()
	end
end

function CommonScrollViewLayout.checkOverShowByVertical(slot0)
	if slot0.cur_item_class == nil then
		return
	end

	if slot0.data_list == nil or next(slot0.data_list) == nil then
		return
	end

	if slot0.total_cache_list[slot0.cur_item_class] == nil then
		return
	end

	slot3 = slot1.pool

	if slot1.item == nil then
		return
	end

	if slot0.last_pos_y == nil then
		slot0.last_pos_y = slot0.container:getPositionY()
	end

	slot5 = slot0.container:getContentSize()
	slot6 = nil

	if slot0.item_move_callback then
		slot0.item_move_callback(uv0(math.abs(slot4) / (slot0.item_height + slot0.space_y)))
	end

	for slot11, slot12 in pairs(slot2) do
		slot13 = false

		if slot4 > 0 then
			if slot12:getPositionY() > slot0.size.height - slot4 + slot0.item_height then
				slot13 = true
			end
		elseif slot14 < slot7 - slot0.item_height then
			slot13 = true
		elseif slot14 > slot7 + slot0.size.height + slot0.item_height then
			slot13 = true
		end

		if slot13 == true then
			if slot12.suspendAllActions then
				slot12:suspendAllActions()
				slot12:setVisible(false)
			end

			table.insert(slot3, slot12)

			slot2[slot11] = nil
		end
	end

	slot0:supplementItemList(slot2, slot0.last_pos_y, slot4)

	slot0.last_pos_y = slot4
end

function CommonScrollViewLayout.checkOverShowByHorizontal(slot0)
	if slot0.cur_item_class == nil then
		return
	end

	if slot0.data_list == nil or next(slot0.data_list) == nil then
		return
	end

	if slot0.total_cache_list[slot0.cur_item_class] == nil then
		return
	end

	slot3 = slot1.pool

	if slot1.item == nil then
		return
	end

	slot4 = slot0.container:getPositionX()

	if slot0.last_pos_x == nil then
		slot0.last_pos_x = slot4
	end

	slot5 = slot0.container:getContentSize()
	slot6 = nil
	slot7 = math.abs(slot4)

	for slot11, slot12 in pairs(slot2) do
		slot13 = false

		if slot4 > 0 then
			if slot12:getPositionX() > slot0.size.width - slot4 + slot0.item_width then
				slot13 = true
			end
		elseif slot14 < slot7 - slot0.item_width then
			slot13 = true
		elseif slot14 > slot7 + slot0.size.width + slot0.item_width then
			slot13 = true
		end

		if slot13 == true then
			if slot12.suspendAllActions then
				slot12:suspendAllActions()
				slot12:setVisible(false)
			end

			table.insert(slot3, slot12)

			slot2[slot11] = nil
		end
	end

	slot0:supplementItemList(slot2, slot0.last_pos_x, slot4)

	slot0.last_pos_x = slot4
end

function CommonScrollViewLayout.supplementItemList(slot0, slot1, slot2, slot3)
	if slot1 == nil or tableLen(slot1) == 0 then
		return
	end

	if tableLen(slot1) < slot0.max_sum then
		slot6 = 0

		for slot10, slot11 in pairs(slot1) do
			if 0 == 0 then
				slot5 = slot11.tmp_index
			end

			if slot6 == 0 then
				slot6 = slot11.tmp_index
			end

			if slot11.tmp_index <= slot5 then
				slot5 = slot11.tmp_index
			end

			if slot6 <= slot11.tmp_index then
				slot6 = slot11.tmp_index
			end
		end

		if slot2 < slot3 then
			for slot10 = 1, slot0.max_sum - slot4 do
				slot0:createList(slot0.data_list[slot6 + slot10])
			end
		else
			for slot10 = 1, slot0.max_sum - slot4 do
				if slot5 - slot10 > 0 then
					slot0:createList(slot0.data_list[slot5 - slot10])
				end
			end
		end
	end
end

function CommonScrollViewLayout.setSwallowTouches(slot0, slot1)
	slot0.scroll_view:setSwallowTouches(slot1)
end

function CommonScrollViewLayout.setBounceEnabled(slot0, slot1)
	slot0.scroll_view:setBounceEnabled(slot1)
end

function CommonScrollViewLayout.updateMove(slot0, slot1)
	slot2 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(0.1, cc.p(slot2.x, slot2.y)))))
end

function CommonScrollViewLayout.jumpToMove(slot0, slot1, slot2, slot3)
	slot4 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.MoveTo:create(slot2 or 1, cc.p(slot4.x, slot4.y)), cc.CallFunc:create(function ()
		if uv0 then
			uv0()
		end
	end)))
end

function CommonScrollViewLayout.getCurContainerPosY(slot0)
	if slot0.container and not tolua.isnull(slot0.container) then
		return slot0.container:getPositionY()
	end
end

function CommonScrollViewLayout.getCurContainerPosX(slot0)
	if slot0.container and not tolua.isnull(slot0.container) then
		return slot0.container:getPositionX()
	end
end

function CommonScrollViewLayout.checkPosition(slot0, slot1, slot2)
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

function CommonScrollViewLayout.setInnerContainer(slot0)
	slot2 = slot0.size.width
	slot3 = slot0.size.height
	slot4 = 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot4 = math.ceil(#slot0.data_list / slot0.row)
		slot2 = slot4 * slot0.item_width + 2 * slot0.start_x + (slot4 - 1) * slot0.space_x
	else
		slot4 = math.ceil(slot1 / slot0.col)
		slot3 = not slot0.is_change and slot4 * slot0.item_height + 2 * slot0.start_y + (slot4 - 1) * slot0.space_y or slot4 * slot0.item_height + 2 * slot0.start_y + slot4 * slot0.space_y
	end

	slot0.container_size = cc.size(math.max(slot2, slot0.size.width), math.max(slot3, slot0.size.height))

	slot0.scroll_view:setInnerContainerSize(slot0.container_size)

	if slot0.start_pos == ScrollViewStartPos.top then
		slot0.scroll_view:jumpToTop()
	elseif slot0.start_pos == ScrollViewStartPos.bottom then
		slot0.scroll_view:jumpToBottom()
	end
end

function CommonScrollViewLayout.setStart_x(slot0, slot1)
	slot0.start_x = slot1
end

function CommonScrollViewLayout.setSpace(slot0, slot1, slot2)
	slot0.space_y = slot1
	slot0.is_change = slot2
end

function CommonScrollViewLayout.setData(slot0, slot1, slot2, slot3, slot4)
	if slot3 then
		slot0:analysisSetting(slot3)
	end

	slot0:clearCacheList()

	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot8, slot9 in ipairs(slot1) do
		slot9._index = slot8
	end

	slot0.item_click_callback = slot2
	slot0.data_list = slot1
	slot0.extend = slot4
	slot0.cur_item_class = slot0.item_class

	slot0:setInnerContainer()

	slot5 = 1
	slot6 = slot0.once_num or 1
	slot7 = nil
	slot8 = #slot0.data_list

	if slot0.need_dynamic == true then
		slot8 = slot0.max_sum
	end

	if slot0.cur_item_class and slot0.total_cache_list[slot0.cur_item_class] and slot0.total_cache_list[slot0.cur_item_class].pool then
		for slot12 = 1, slot8 do
			if slot0.data_list[slot12] ~= nil then
				slot0:createList(slot13)
			end

			if slot8 <= slot12 and slot0.end_callback then
				slot0:end_callback()
			end
		end
	elseif slot0.time_ticket == nil and next(slot0.data_list or {}) ~= nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if tolua.isnull(uv0.container) then
				return
			end

			if uv0.data_list == nil then
				if uv0.end_callback then
					uv0:end_callback()
				end

				uv0:clearTimeTicket()
			else
				for slot3 = uv1, uv1 + uv2 - 1 do
					uv3 = uv0.data_list[slot3]

					if uv3 ~= nil then
						uv0:createList(uv3)
					end
				end

				uv1 = uv1 + uv2

				if uv4 < uv1 then
					if uv0.end_callback then
						uv0:end_callback()
					end

					uv0:clearTimeTicket()
				end
			end
		end, slot0.delay / display.DEFAULT_FPS)
	end
end

function CommonScrollViewLayout.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function CommonScrollViewLayout.resetSize(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1.width == slot0.size.width and slot1.height == slot0.size.height then
		return
	end

	slot0.size = slot1

	slot0:setContentSize(slot1)
	slot0.scroll_view:setContentSize(slot1)
	slot0:calculationMaxSum()
end

function CommonScrollViewLayout.clearCacheList(slot0)
	slot0:clearTimeTicket()

	if slot0.cur_item_class ~= nil then
		if (slot0.total_cache_list[slot0.cur_item_class] or {}) ~= nil and next(slot1) ~= nil then
			for slot5, slot6 in pairs(slot1.item) do
				if slot6.suspendAllActions then
					slot6:suspendAllActions()
				end

				uv0(slot1.pool, slot6)
			end

			for slot5, slot6 in pairs(slot1.pool) do
				slot6:setVisible(false)
			end
		end

		slot1.item = {}
	end

	slot0.cur_item_class = nil
end

function CommonScrollViewLayout.addEndCallBack(slot0, slot1)
	slot0.end_callback = slot1
end

function CommonScrollViewLayout.addScrollToBottomCallBack(slot0, slot1)
	slot0.scrollToBottom_callback = slot1
end

function CommonScrollViewLayout.addScrollMoveCallBack(slot0, slot1)
	slot0.item_move_callback = slot1
end

function CommonScrollViewLayout.createList(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.cur_item_class == nil then
		return
	end

	if slot0.total_cache_list[slot0.cur_item_class] == nil then
		slot0.total_cache_list[slot0.cur_item_class] = {}
	end

	if slot0.total_cache_list[slot0.cur_item_class].item == nil then
		slot2.item = {}
	end

	if slot2.pool == nil then
		slot2.pool = {}
	end

	if slot2.item[slot1._index] ~= nil then
		return
	end

	slot3 = nil

	if next(slot2.pool) == nil then
		slot3 = slot0.item_class.new()

		slot3:setScale(slot0.scale)
		slot0.scroll_view:addChild(slot3)
	else
		uv0(slot2.pool, 1):setVisible(true)
	end

	slot3.tmp_index = slot1._index
	slot2.item[slot1._index] = slot3

	if slot0.extend ~= nil and slot3.setExtendData then
		slot3:setExtendData(slot0.extend)
	end

	slot0:setItemPosition(slot3, slot1._index)

	if slot0.item_click_callback ~= nil and slot3.addCallBack then
		slot3:addCallBack(slot0.item_click_callback)
	end

	slot3:setData(slot1, slot0.is_hide_effect)

	slot0.cur_item_index = slot1._index
end

function CommonScrollViewLayout.setItemPosition(slot0, slot1, slot2)
	slot3 = slot2
	slot4 = slot1:getAnchorPoint()
	slot5 = 0
	slot6 = 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot5 = slot0.start_x + slot0.item_width * slot4.x + (slot0.item_width + slot0.space_x) * math.floor((slot3 - 1) / slot0.row)
		slot6 = slot0.container_size.height - (slot0.start_y + slot0.item_height * (1 - slot4.y) + (slot3 - 1) % slot0.row * (slot0.item_height + slot0.space_y))
	elseif slot0.start_pos == ScrollViewStartPos.top then
		slot5 = slot0.start_x + slot0.item_width * slot4.x + (slot0.item_width + slot0.space_x) * ((slot3 - 1) % slot0.col)
		slot6 = slot0.container_size.height - (slot0.start_y + slot0.item_height * (1 - slot4.y) + math.floor((slot3 - 1) / slot0.col) * (slot0.item_height + slot0.space_y))
	else
		slot5 = slot0.start_x + slot0.item_width * slot4.x + (slot0.item_width + slot0.space_x) * ((slot3 - 1) % slot0.col)
		slot6 = slot0.start_y + slot0.item_height * slot4.y + math.floor((slot3 - 1) / slot0.col) * (slot0.item_height + slot0.space_y)
	end

	slot1:setPosition(slot5, slot6)
end

function CommonScrollViewLayout.getItemList(slot0)
	if slot0.cur_item_class == nil then
		return
	end

	if slot0.total_cache_list[slot0.cur_item_class] and next(slot1 or {}) == nil then
		return {}
	end

	slot2 = {}

	if slot1 and slot1.item then
		for slot6, slot7 in pairs(slot1.item) do
			uv0(slot2, slot7)
		end
	end

	return slot2
end

function CommonScrollViewLayout.getTempItemList(slot0)
	if slot0.cur_item_class == nil then
		return
	end

	if slot0.total_cache_list[slot0.cur_item_class] then
		return slot1.item, slot1.pool
	end
end

function CommonScrollViewLayout.resetAddPosition(slot0, slot1, slot2)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if slot2 ~= nil then
		uv0(slot1, slot2)
	end

	for slot6, slot7 in ipairs(slot1) do
		slot7._index = slot6
	end

	slot0.data_list = slot1
	slot3, slot4 = slot0:getTempItemList()

	if slot3 == nil or next(slot3) == nil then
		return
	end

	for slot8, slot9 in pairs(slot3) do
		if slot9.suspendAllActions then
			slot9:suspendAllActions()
		end

		if slot9.tmp_index then
			if slot1[slot9.tmp_index] and slot9.setData then
				slot9:setData(slot10)
				slot9:setVisible(true)

				slot9.tmp_index = slot10._index
			else
				slot9:setVisible(false)

				if slot4 then
					uv1(slot4, slot9)
				end

				slot3[slot8] = nil
			end
		end
	end
end

function CommonScrollViewLayout.resetPosition(slot0, slot1, slot2)
	if slot0.data_list == nil or next(slot0.data_list) == nil then
		return
	end

	if slot1 ~= nil then
		uv0(slot0.data_list, slot1)
	end

	for slot6, slot7 in ipairs(slot0.data_list) do
		slot7._index = slot6
	end

	slot3, slot4 = slot0:getTempItemList()

	if slot3 == nil or next(slot3) == nil then
		return
	end

	for slot8, slot9 in pairs(slot3) do
		if slot9.suspendAllActions then
			slot9:suspendAllActions()
		end

		if slot9.tmp_index and slot0.data_list[slot9.tmp_index] and slot9.setData then
			slot9:setData(slot10)
			slot9:setVisible(true)

			slot9.tmp_index = slot10._index
		end
	end
end

function CommonScrollViewLayout.analysisSetting(slot0, slot1)
	slot0.setting = slot1 or {}
	slot0.item_class = slot0.setting.item_class
	slot0.start_x = slot0.setting.start_x or 0
	slot0.space_x = slot0.setting.space_x or 3
	slot0.start_y = slot0.setting.start_y or 0
	slot0.space_y = slot0.setting.space_y or 3
	slot0.item_width = slot0.setting.item_width or 115
	slot0.item_height = slot0.setting.item_height or 115
	slot0.is_radian = slot0.setting.is_radian or false
	slot0.row = slot0.setting.row or 5
	slot0.col = slot0.setting.col or 5
	slot0.delay = slot0.setting.delay or 1
	slot0.once_num = slot0.setting.once_num or 1
	slot0.scale = slot0.setting.scale or 1
	slot0.need_dynamic = slot0.setting.need_dynamic or false
	slot0.is_hide_effect = slot0.setting.is_hide_effect or false

	slot0:calculationMaxSum()
end

function CommonScrollViewLayout.calculationMaxSum(slot0)
	slot1 = nil
	slot0.max_sum = slot0.dir == ScrollViewDir.horizontal and (math.ceil(slot0.size.width / (slot0.item_width + slot0.space_x)) + 2) * slot0.row or (math.ceil(slot0.size.height / (slot0.item_height + slot0.space_y)) + 2) * slot0.col
end

function CommonScrollViewLayout.getMaxSize(slot0)
	return slot0.container_size
end

function CommonScrollViewLayout.getContainer(slot0)
	return slot0.container
end

function CommonScrollViewLayout.scrollToPercentVertical(slot0, slot1, slot2)
	slot0.scroll_view:scrollToPercentVertical(slot1, slot2, true)
end

function CommonScrollViewLayout.scrollToPercentHorizontal(slot0, slot1, slot2)
	slot0.scroll_view:scrollToPercentHorizontal(slot1, slot2, true)
end

function CommonScrollViewLayout.DeleteMe(slot0)
	doStopAllActions(slot0.container)
	slot0:clearTimeTicket()

	for slot4, slot5 in pairs(slot0.total_cache_list) do
		for slot9, slot10 in pairs(slot5) do
			for slot14, slot15 in pairs(slot10) do
				if slot15.DeleteMe then
					slot15:DeleteMe()
				end
			end
		end
	end

	slot0.total_cache_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

CommonScrollItem = class("CommonScrollItem", function ()
	return ccui.Layout:create()
end)

function CommonScrollItem.ctor(slot0)
end

function CommonScrollItem.setData(slot0, slot1)
end

function CommonScrollItem.addCallBack(slot0, slot1)
end

function CommonScrollItem.clearInfo(slot0)
	slot0:removeFromParent()
end

function CommonScrollItem.suspendAllActions(slot0)
end

function CommonScrollItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
