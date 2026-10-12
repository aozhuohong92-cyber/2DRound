slot0 = table.insert
slot1 = table.remove
slot2 = table.sort
RedBagListPanel = class("RedBagListPanel", function ()
	return ccui.Layout:create()
end)

function RedBagListPanel.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.parent = slot1
	slot0.pos = slot2 or cc.p(0, 0)
	slot0.dir = slot3 or ScrollViewDir.vertical
	slot0.start_pos = slot4 or 0
	slot0.size = slot5 or cc.size(100, 100)
	slot0.ap = slot7 or cc.p(0, 0)
	slot0.total_cache_list = {}
	slot0.item_click_callback = nil
	slot0.extend = nil
	slot0.move_over_index = 0
	slot0.cur_item_class = nil
	slot0.item_num = 0
	slot0.select_item = nil
	slot0.is_run = false

	slot0:analysisSetting(slot6)

	slot0.posx_list = {
		slot0.size.width / 2,
		slot0.size.width / 2 + 140,
		slot0.size.width / 2 - 140
	}

	slot0:createRootWnd()
end

function RedBagListPanel.createRootWnd(slot0)
	slot0:setContentSize(slot0.size)

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0)
	end

	slot0:setPosition(slot0.pos)
	slot0:setAnchorPoint(slot0.ap)

	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)
	slot0:registerEvent()
end

function RedBagListPanel.registerEvent(slot0)
	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.last_point = nil
		uv0.is_move = false

		doStopAllActions(uv0.container)

		if uv0.cur_item_class == nil then
			return false
		end

		if uv0.screenSize == nil then
			slot2 = uv0:convertToWorldSpace(cc.p(0, 0))
			uv0.screenSize = cc.rect(slot2.x, slot2.y, uv0.size.width, uv0.size.height)
		end

		if not cc.rectContainsPoint(uv0.screenSize, cc.p(slot0:getLocation().x, slot0:getLocation().y)) then
			return false
		end

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.last_point = slot0:getDelta()

		uv0:moveContainer(uv0.last_point)
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.is_move = false

		if uv0.last_point == nil then
			return
		end
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.container:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.container)
end

function RedBagListPanel.updateMove(slot0)
end

function RedBagListPanel.moveContainer(slot0, slot1)
	slot2 = slot0:checkPosition(slot1.x, slot1.y)
	slot3 = slot1.x < 0

	if math.abs(slot1.x) >= 5 and slot0.is_move ~= true then
		slot0.is_move = true
		slot0.is_run = true

		for slot8 = 1, slot0.item_num do
			slot0:setMoveItemPos(slot0.total_cache_list[slot0.cur_item_class].item[slot8], slot3)
		end
	end
end

function RedBagListPanel.jumpToMove(slot0, slot1, slot2, slot3)
	slot4 = slot0:checkPosition(slot1.x, slot1.y)

	slot0.container:runAction(cc.Sequence:create(cc.MoveTo:create(slot2 or 1, cc.p(slot4.x, slot4.y)), cc.CallFunc:create(function ()
		if uv0 then
			uv0()
		end
	end)))
end

function RedBagListPanel.checkPosition(slot0, slot1, slot2)
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

function RedBagListPanel.setData(slot0, slot1, slot2, slot3, slot4)
	if slot3 then
		slot0:analysisSetting(slot3)
	end

	slot0:clearCacheList()

	slot0.item_click_callback = slot2
	slot0.data_list = slot1
	slot0.extend = slot4
	slot0.item_num = #slot1
	slot6 = slot0.size.width
	slot7 = slot0.size.height
	slot8 = 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot8 = math.ceil(slot5 / slot0.row)
		slot6 = slot8 * slot0.item_width + 2 * slot0.start_x + (slot8 - 1) * slot0.space_x
	else
		slot8 = math.ceil(slot5 / slot0.col)
		slot7 = slot8 * slot0.item_height + 2 * slot0.start_y + (slot8 - 1) * slot0.space_y
	end

	slot0.container_size = cc.size(math.max(slot6, slot0.size.width), math.max(slot7, slot0.size.height))

	slot0.container:setContentSize(slot0.container_size)

	if slot0.start_pos > 0 then
		slot0.container:setPosition(cc.p(0, math.max(0 - slot7 * slot0.start_pos + 35, slot0.size.height - slot0.container_size.height)))
	elseif slot0.start_pos == 0 then
		slot0.container:setPosition(cc.p(0, 0))
	end

	slot0.cur_item_class = slot0.item_class
	slot9 = 1
	slot10 = slot0.once_num or 1
	slot11 = nil

	if slot0.time_ticket == nil and next(slot0.data_list or {}) ~= nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			for slot3 = uv0, uv0 + uv1 - 1 do
				if uv2.data_list and not tolua.isnull(uv2.container) then
					uv3 = uv2.data_list[slot3]

					if uv3 ~= nil then
						if uv3._index == nil then
							uv3._index = slot3
						end

						uv2:createList(uv3)
					end
				end
			end

			uv0 = uv0 + uv1

			if uv4 < uv0 then
				if uv2.end_callback then
					uv2:end_callback()
				end

				uv2:clearTimeTicket()
			end
		end, slot0.delay / display.DEFAULT_FPS)
	end
end

function RedBagListPanel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function RedBagListPanel.clearCacheList(slot0)
	slot0:clearTimeTicket()
	doStopAllActions(slot0.container)

	if slot0.cur_item_class ~= nil then
		if (slot0.total_cache_list[slot0.cur_item_class] or {}) ~= nil and next(slot1) ~= nil then
			for slot5, slot6 in ipairs(slot1.item) do
				slot6:setVisible(false)
				uv0(slot1.pool, slot6)
			end
		end

		slot1.item = {}
	end

	slot0.cur_item_class = nil
end

function RedBagListPanel.addEndCallBack(slot0, slot1)
	slot0.end_callback = slot1
end

function RedBagListPanel.createList(slot0, slot1)
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

	slot3 = nil

	if next(slot2.pool) == nil then
		if slot0.item_class.new(true, true, cc.size(slot0.item_width, slot0.item_height)).setSwallowTouches then
			slot3:setSwallowTouches(false)
		end

		slot3:setScale(slot0.scale)
		slot0.container:addChild(slot3)
	else
		slot3 = uv0(slot2.pool, 1)
	end

	uv1(slot2.item, slot3)

	slot3.item_index = #slot2.item

	if slot0.extend ~= nil and slot3.setExtendData then
		slot3:setExtendData(slot0.extend)
	end

	slot3:setVisible(true)
	slot0:setItemPosition(slot3)

	if slot0.item_click_callback ~= nil and slot3.addCallBack then
		slot3:addCallBack(slot0.item_click_callback)
	end

	slot3:setData(slot1)
end

function RedBagListPanel.getItemList(slot0)
	if slot0.cur_item_class == nil then
		return
	end

	return slot0.total_cache_list[slot0.cur_item_class].item
end

function RedBagListPanel.setItemPosition(slot0, slot1)
	if slot0.total_cache_list[slot0.cur_item_class] == nil or slot2.item == nil then
		return
	end

	slot3 = #slot2.item
	slot5 = 0
	slot6 = 0
	slot7 = 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot5 = slot0.posx_list[slot3]
		slot6 = slot0.container_size.height - (slot0.start_y + slot0.item_height * (1 - slot1:getAnchorPoint().y) + (slot3 - 1) % slot0.row * (slot0.item_height + slot0.space_y))
	end

	slot1:setPosition(slot5, slot6)

	if slot3 == 1 then
		slot1:setLocalZOrder(10)
		slot1:showBlackBg(false)
		slot1:setScale(1.05)

		slot0.select_item = slot1
	else
		slot1:setLocalZOrder(1)
		slot1:showBlackBg(true)
		slot1:setScale(0.85)
	end
end

function RedBagListPanel.setMoveItemPos(slot0, slot1, slot2)
	if slot0.total_cache_list[slot0.cur_item_class] == nil or slot3.item == nil then
		return
	end

	if not slot1 then
		return
	end

	slot4 = slot1.item_index or 0
	slot1.item_index = slot2 == true and (slot4 <= 1 and slot0.item_num or slot4 - 1) or slot0.item_num <= slot4 and 1 or slot4 + 1
	slot6 = 0
	slot7 = 0

	if slot0.dir == ScrollViewDir.horizontal then
		slot6 = slot0.posx_list[slot4]
		slot7 = slot0.container_size.height - (slot0.start_y + slot0.item_height * (1 - slot1:getAnchorPoint().y) + (slot4 - 1) % slot0.row * (slot0.item_height + slot0.space_y))
	end

	doStopAllActions(slot1)

	slot8 = 1

	if slot4 == 1 then
		slot1:setLocalZOrder(10)
		slot1:showBlackBg(false)

		slot8 = 1.05
		slot0.select_item = slot1
	else
		slot1:showBlackBg(true)
		slot1:setLocalZOrder(1)

		slot8 = 0.85
	end

	slot1:runAction(cc.Sequence:create(cc.ScaleTo:create(0.3, slot8)))
	slot1:runAction(cc.Sequence:create(cc.MoveTo:create(0.3, cc.p(slot6, slot7)), cc.CallFunc:create(function ()
		uv0.is_run = false

		if uv0.end_callback then
			uv0:end_callback()
		end
	end)))
end

function RedBagListPanel.runLeftPostion(slot0)
	if slot0.is_run == true then
		return
	end

	slot0.is_run = true

	for slot5 = 1, slot0.item_num do
		slot0:setMoveItemPos(slot0.total_cache_list[slot0.cur_item_class].item[slot5], true)
	end
end

function RedBagListPanel.runRightPostion(slot0)
	if slot0.is_run == true then
		return
	end

	slot0.is_run = true

	for slot5 = 1, slot0.item_num do
		slot0:setMoveItemPos(slot0.total_cache_list[slot0.cur_item_class].item[slot5], false)
	end
end

function RedBagListPanel.getSelectItem(slot0)
	return slot0.select_item
end

function RedBagListPanel.setSelectItem(slot0, slot1)
	if slot1 then
		slot0.select_item = slot1
	end
end

function RedBagListPanel.analysisSetting(slot0, slot1)
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
	slot0.delay = slot0.setting.delay or 2
	slot0.once_num = slot0.setting.once_num or 1
	slot0.scale = slot0.setting.scale or 1
end

function RedBagListPanel.scrollToPos(slot0, slot1)
	doStopAllActions(slot0.container)
	slot0.container:runAction(cc.Sequence:create(cc.MoveTo:create(0.6, cc.p(0, math.min(0, math.max(0 - slot0.container_size.height * (slot1 or 1) + 35, slot0.size.height - slot0.container_size.height))))))
end

function RedBagListPanel.getMaxSize(slot0)
	return slot0.container_size
end

function RedBagListPanel.getContainer(slot0)
	return slot0.container
end

function RedBagListPanel.DeleteMe(slot0)
	slot0:clearTimeTicket()
	doStopAllActions(slot0.container)

	for slot4, slot5 in pairs(slot0.total_cache_list) do
		for slot9, slot10 in pairs(slot5) do
			for slot14, slot15 in ipairs(slot10) do
				if slot15.DeleteMe then
					slot15:DeleteMe()
				end
			end
		end
	end

	slot0.total_cache_list = nil

	if slot0.head then
		slot0.head:DeleteMe()

		slot0.head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
