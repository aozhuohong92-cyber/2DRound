WorldMapLand = class("WorldMapLand", function ()
	return ccui.Layout:create()
end)
slot0 = tolua.isnull

function WorldMapLand.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.config = slot1
	slot0.land_id = slot2
	slot0.click_callback = slot3
	slot0.size = cc.size(100, 38)
	slot0.scale = 2
	slot0.item_list = {}
	slot0.had_unlock = false
	slot0.open_chapter_data = slot4

	slot0:createRootWnd()
end

function WorldMapLand.createRootWnd(slot0)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0))

	slot0.name_container = createSprite(PathTool.getResFrame("worldmap", "worldmap_1007"), slot0.config.name_x, slot0.config.name_y, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 10)
	slot0.name_label = createLabel(20, 1, 9, 105, 40, slot0.config.name, slot0.name_container, nil, cc.p(0.5, 0.5))

	slot0.name_label:setLocalZOrder(9)

	slot0.had_unlock = true

	if slot0.had_unlock == true then
		slot0.click_layout = ccui.Layout:create()

		slot0.click_layout:setAnchorPoint(0.5, 0.5)
		slot0.click_layout:setTouchEnabled(true)
		slot0.click_layout:setSwallowTouches(false)
		slot0:addChild(slot0.click_layout, 10)

		if slot0.config.bid == 1 then
			slot0.click_layout:setPosition(34, -14)
			slot0.click_layout:setContentSize(cc.size(440, 300))
		elseif slot0.config.bid == 2 then
			slot0.click_layout:setPosition(23, 17)
			slot0.click_layout:setContentSize(cc.size(600, 200))
		elseif slot0.config.bid == 3 then
			slot0.click_layout:setPosition(111, -5)
			slot0.click_layout:setContentSize(cc.size(500, 300))
		elseif slot0.config.bid == 4 then
			slot0.click_layout:setPosition(2, 49)
			slot0.click_layout:setContentSize(cc.size(200, 380))
		elseif slot0.config.bid == 5 then
			slot0.click_layout:setPosition(74, 14)
			slot0.click_layout:setContentSize(cc.size(200, 380))
		end
	end

	slot0:registerEvent()
end

function WorldMapLand.registerEvent(slot0)
	if slot0.click_layout ~= nil then
		slot0.click_layout:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0.touch_end = slot0:getTouchEndPosition()
				slot2 = true

				if uv0.touch_began ~= nil then
					slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
				end

				if slot2 == true then
					uv0:clickHandler()
				end
			elseif slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()
			end
		end)
	end
end

function WorldMapLand.clickHandler(slot0)
	if slot0.click_callback then
		slot0:click_callback()
	end
end

function WorldMapLand.addToParent(slot0, slot1)
	if not uv0(slot1) and slot0.config then
		slot1:addChild(slot0)
		slot0:setPosition(slot0.config.x, slot0.config.y)
	end
end

function WorldMapLand.setSelectedLand(slot0, slot1)
	if slot1 == true then
		if slot0.item_list then
			for slot5, slot6 in pairs(slot0.item_list) do
				slot6:clearEffect()
			end
		end

		if not uv0(slot0.name_container) then
			slot0.name_container:setVisible(false)
		end

		if slot0.item_container == nil then
			slot0.item_container = ccui.Layout:create()

			slot0.item_container:setContentSize(slot0.size)
			slot0.item_container:setAnchorPoint(cc.p(0, 0))
			slot0:addChild(slot0.item_container)
		end

		slot0.item_container:setVisible(true)
		slot0:createItemList()
	else
		if not uv0(slot0.name_container) then
			slot0.name_container:setVisible(true)
		end

		if not uv0(slot0.item_container) then
			slot0.item_container:setVisible(false)
		end
	end
end

function WorldMapLand.createItemList(slot0)
	if slot0.config ~= nil and slot0.config.dungeon_list ~= nil then
		function slot1()
			if uv0.item_list then
				for slot3, slot4 in pairs(uv0.item_list) do
					slot4:clearEffect()
				end
			end
		end

		for slot5, slot6 in ipairs(slot0.config.dungeon_list) do
			delayRun(slot0.item_container, 2 * slot5 / display.DEFAULT_FPS, function ()
				if uv0.item_list[uv1.bid] == nil then
					uv0.item_list[uv1.bid] = WorldMapItem.new(uv1, uv0.open_chapter_data)

					uv0.item_list[uv1.bid]:addToParent(uv0.item_container, uv2)
				end
			end)
		end
	end
end

function WorldMapLand.DeleteMe(slot0)
	doStopAllActions(slot0.item_container)

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.main_land_load then
		slot0.main_land_load:DeleteMe()

		slot0.main_land_load = nil
	end
end
