ArenaChampionRankAwardsWindow = ArenaChampionRankAwardsWindow or BaseClass(BaseView)
slot0 = ArenaController:getInstance()
slot1 = ArenaController:getInstance():getModel()

function ArenaChampionRankAwardsWindow.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "arena/arena_champion_rank_awards_window"
	slot0.res_list = {}
	slot0.view_type = slot1 or ArenaConst.champion_type.normal
	slot0.award_list = {}
end

function ArenaChampionRankAwardsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	if slot0.view_type == ArenaConst.champion_type.normal then
		slot0.root_wnd:getChildByName("main_container"):getChildByName("main_panel"):getChildByName("win_title"):setString(TI18N("冠军赛奖励"))
	else
		slot2:getChildByName("win_title"):setString(TI18N("周冠军赛奖励"))
	end

	slot2:getChildByName("notice_label"):setString(TI18N("比赛结束后奖品将发送到邮箱"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.list_view = slot2:getChildByName("list_view")
	slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.list_view, nil, nil, nil, slot0.list_view:getContentSize(), {
		start_y = -4,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 614,
		item_height = 124,
		space_y = 0,
		col = 1,
		need_dynamic = true
	}, cc.p(0, 0))

	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot5 = slot2:getChildByName("title_container")

	slot5:getChildByName("award_title"):setString(TI18N("奖励"))
	slot5:getChildByName("rank_title"):setString(TI18N("排名"))
end

function ArenaChampionRankAwardsWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaChampionRankAwardsWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openArenaChampionRankAwardsWindow(false)
		end
	end)
end

function ArenaChampionRankAwardsWindow.createNewCell(slot0)
	if ArenaChampionRankAwardsItem.new().setExtendData then
		slot1:setExtendData(slot0.view_type)
	end

	return slot1
end

function ArenaChampionRankAwardsWindow.numberOfCells(slot0)
	if not slot0.award_list then
		return 0
	end

	return #slot0.award_list
end

function ArenaChampionRankAwardsWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.award_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaChampionRankAwardsWindow.openRootWnd(slot0)
	slot1 = {}
	slot1 = (slot0.view_type ~= ArenaConst.champion_type.normal or deepCopy(Config.ArenaChampionData.data_awards)) and deepCopy(Config.ArenaClusterChampionData.data_awards)

	for slot5, slot6 in ipairs(slot1) do
		slot6.index = slot5
	end

	slot0.award_list = slot1

	slot0.scroll_view:reloadData()
end

function ArenaChampionRankAwardsWindow.close_callback(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openArenaChampionRankAwardsWindow(false)
end

ArenaChampionRankAwardsItem = class("ArenaChampionRankAwardsItem", function ()
	return ccui.Layout:create()
end)

function ArenaChampionRankAwardsItem.ctor(slot0)
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

function ArenaChampionRankAwardsItem.registerEvent(slot0)
end

function ArenaChampionRankAwardsItem.setExtendData(slot0, slot1)
	slot0.view_type = slot1 or ArenaConst.champion_type.normal
end

function ArenaChampionRankAwardsItem.setData(slot0, slot1)
	if slot1 ~= nil then
		if slot1.index ~= nil then
			if slot1.index <= 3 then
				slot0.rank_label:setVisible(false)

				if slot1.rank == 0 then
					slot0.rank_img:setVisible(false)
				else
					if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_300%s", slot1.index)) then
						slot0.rank_res_id = slot2

						loadSpriteTexture(slot0.rank_img, slot2, LOADTEXT_TYPE_PLIST)
					end

					slot0.rank_img:setVisible(true)
				end
			else
				slot0.rank_img:setVisible(false)
				slot0.rank_label:setVisible(true)

				if slot1.min == slot1.max then
					slot0.rank_label:setString(slot1.min)
				else
					slot0.rank_label:setString(string.format("%s~%s", slot1.min, slot1.max))
				end
			end
		end

		for slot5, slot6 in pairs(slot0.item_list) do
			slot6:setVisible(false)
		end

		slot2 = nil
		slot3 = 1
		slot4 = nil
		slot5 = 0.8
		slot6 = 10
		slot7 = 0
		slot8 = 55
		slot9 = slot1.items

		if slot0.view_type == ArenaConst.champion_type.cross then
			slot9 = slot1.awards or slot1.items or {}
		end

		for slot14 = #slot9, 1, -1 do
			if Config.ItemData.data_get_data(slot9[slot14][1]) then
				if slot0.item_list[slot3] == nil then
					slot4 = BackPackItem.new(false, true, false, slot5, false, true)

					slot4:setPosition(slot0.total_width - ((slot3 - 1) * (BackPackItem.Width * slot5 + slot6) + BackPackItem.Width * 0.5 * slot5), slot8)
					slot0.item_container:addChild(slot4)

					slot0.item_list[slot3] = slot4
				end

				slot4 = slot0.item_list[slot3]

				slot4:setVisible(true)
				slot4:setBaseData(slot15[1], slot15[2])

				slot3 = slot3 + 1
			end
		end
	end
end

function ArenaChampionRankAwardsItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
