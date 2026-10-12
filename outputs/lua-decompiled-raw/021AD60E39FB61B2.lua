ArenaLoopActivityPanel = class("ArenaLoopActivityPanel", function ()
	return ccui.Layout:create()
end)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()

function ArenaLoopActivityPanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arena_loop_activity_panel"))
	slot0.temp_list = {}
	slot0.item_list = {}
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("rank_title"):setString(TI18N("排名"))
	slot1:getChildByName("award_title"):setString(TI18N("奖励"))

	slot4 = slot0.root_wnd:getChildByName("my_container")

	slot4:getChildByName("desc"):setString(TI18N("保持排名可获得奖励:"))
	slot4:getChildByName("role_name"):setString(TI18N("我的排名:"))

	slot0.role_rank = slot4:getChildByName("role_rank")
	slot0.item_container = slot4:getChildByName("item_container")
	slot0.total_width = slot0.item_container:getContentSize().width

	if Config.ArenaData.data_const.daily_reward_time then
		slot0.root_wnd:getChildByName("desc"):setString(slot5.desc)
	end

	slot7 = slot1:getChildByName("scroll_container")
	slot0.scroll_view = CommonScrollViewSingleLayout.new(slot7, nil, , , slot7:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 4,
		space_x = 4,
		item_width = 614,
		item_height = 124,
		space_y = 4,
		col = 1,
		need_dynamic = true
	}, cc.p(0, 0))

	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:registerEvent()
end

function ArenaLoopActivityPanel.registerEvent(slot0)
end

function ArenaLoopActivityPanel.createNewCell(slot0)
	return ArenaLoopActivityItem.new()
end

function ArenaLoopActivityPanel.numberOfCells(slot0)
	if not slot0.temp_list then
		return 0
	end

	return #slot0.temp_list
end

function ArenaLoopActivityPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.temp_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaLoopActivityPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArenaLoopActivityPanel.addToParent(slot0)
	for slot5, slot6 in ipairs(deepCopy(Config.ArenaData.data_activity)) do
		slot6.index = slot5
	end

	slot0.temp_list = slot1

	slot0.scroll_view:reloadData()
end

function ArenaLoopActivityPanel.updatePanelInfo(slot0, slot1)
	if uv0:getMyLoopData() == nil then
		return
	end

	if slot2.rank == 0 then
		slot0.role_rank:setString(TI18N("暂未上榜"))
	else
		slot0.role_rank:setString(slot2.rank)

		slot3 = nil

		for slot7, slot8 in ipairs(Config.ArenaData.data_activity) do
			if slot8.min <= slot2.rank and slot2.rank <= slot8.max then
				slot3 = slot8

				break
			end
		end

		if slot3 then
			slot0:updateMyRewardsItems(slot3.items)
		end
	end
end

function ArenaLoopActivityPanel.updateMyRewardsItems(slot0, slot1)
	for slot5, slot6 in pairs(slot0.item_list) do
		slot6:setVisible(false)
	end

	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = nil
	slot3 = 1
	slot4 = nil
	slot5 = 0.8
	slot7 = 0

	for slot13 = #slot1, 1, -1 do
		if Config.ItemData.data_get_data(slot1[slot13][1]) then
			if slot0.item_list[slot3] == nil then
				slot4 = BackPackItem.new(false, true, false, slot5, false, true)

				slot4:setPosition(slot0.total_width - ((slot3 - 1) * (BackPackItem.Width * slot5 + 10) + BackPackItem.Width * 0.5 * slot5), 55)
				slot0.item_container:addChild(slot4)

				slot0.item_list[slot3] = slot4
			end

			slot4 = slot0.item_list[slot3]

			slot4:setBaseData(slot14[1], slot14[2])
			slot4:setVisible(true)

			slot3 = slot3 + 1
		end
	end
end

function ArenaLoopActivityPanel.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

ArenaLoopActivityItem = class("ArenaLoopActivityItem", function ()
	return ccui.Layout:create()
end)

function ArenaLoopActivityItem.ctor(slot0)
	slot0.item_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/arean_loop_awards_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
	slot0.rank_label = slot0.root_wnd:getChildByName("rank_label")
	slot0.item_container = slot0.root_wnd:getChildByName("item_container")
	slot0.total_width = slot0.item_container:getContentSize().width

	slot0:registerEvent()
end

function ArenaLoopActivityItem.registerEvent(slot0)
end

function ArenaLoopActivityItem.setData(slot0, slot1)
	if slot1 ~= nil then
		if slot1.index ~= nil then
			if slot1.index <= 3 then
				slot0.rank_label:setVisible(false)

				if slot1.rank == 0 then
					slot0.rank_img:setVisible(false)
				else
					if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.index)) then
						slot0.rank_res_id = slot2

						loadSpriteTexture(slot0.rank_img, slot2, LOADTEXT_TYPE_PLIST)
					end

					slot0.rank_img:setVisible(true)
				end
			else
				slot0.rank_img:setVisible(false)
				slot0.rank_label:setVisible(true)
				slot0.rank_label:setString(string.format("%s~%s", slot1.min, slot1.max))
			end
		end

		for slot5, slot6 in pairs(slot0.item_list) do
			slot6:setVisible(false)
		end

		slot2 = nil
		slot3 = 1
		slot4 = nil
		slot5 = 0.8
		slot7 = 0

		for slot13 = #slot1.items, 1, -1 do
			if Config.ItemData.data_get_data(slot1.items[slot13][1]) then
				if slot0.item_list[slot3] == nil then
					slot4 = BackPackItem.new(false, true, false, slot5, false, true)

					slot4:setPosition(slot0.total_width - ((slot3 - 1) * (BackPackItem.Width * slot5 + 10) + BackPackItem.Width * 0.5 * slot5), 55)
					slot0.item_container:addChild(slot4)

					slot0.item_list[slot3] = slot4
				end

				slot4 = slot0.item_list[slot3]

				slot4:setBaseData(slot14[1], slot14[2])
				slot4:setVisible(true)

				slot3 = slot3 + 1
			end
		end
	end
end

function ArenaLoopActivityItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
