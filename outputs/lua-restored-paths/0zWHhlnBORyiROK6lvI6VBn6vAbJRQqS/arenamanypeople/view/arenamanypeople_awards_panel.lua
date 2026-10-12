ArenaManyPeopleAwardsPanel = class("ArenaManyPeopleAwardsPanel", function ()
	return ccui.Layout:create()
end)
slot0 = table.insert
slot1 = table.sort
slot3 = ArenaManyPeopleController:getInstance():getModel()

function ArenaManyPeopleAwardsPanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arenamanypeople/amp_awards_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("rank_title"):setString(TI18N("排名"))
	slot1:getChildByName("award_title"):setString(TI18N("奖励"))

	slot4 = slot1:getChildByName("scroll_container")
	slot0.scroll_view = CommonScrollViewSingleLayout.new(slot4, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 600,
		item_height = 135,
		space_y = 2,
		col = 1,
		need_dynamic = true
	})

	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot7 = slot1:getChildByName("my_container")
	slot0.tank_title = slot7:getChildByName("tank_title")

	slot0.tank_title:setString(TI18N("我的排名："))

	slot0.tips_lab = slot7:getChildByName("tips_lab")

	slot0.tips_lab:setString(TI18N("保持排名可获得奖励"))

	slot0.rank_num = slot7:getChildByName("rank_num")
	slot0.item_scrollview = slot7:getChildByName("item_scrollview")
	slot0.my_container = slot7

	slot0:registerEvent()
	slot0:addToParent()
end

function ArenaManyPeopleAwardsPanel.createNewCell(slot0)
	return ArenaManyPeopleAwardsItem.new()
end

function ArenaManyPeopleAwardsPanel.numberOfCells(slot0)
	if not slot0.award_list then
		return 0
	end

	return #slot0.award_list
end

function ArenaManyPeopleAwardsPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.award_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
end

function ArenaManyPeopleAwardsPanel.registerEvent(slot0)
end

function ArenaManyPeopleAwardsPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArenaManyPeopleAwardsPanel.addToParent(slot0)
	slot0.award_list = {}
	slot2 = uv0:getMyInfo()
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in pairs(deepCopy(Config.HolidayArenaTeamData.data_rank_reward)) do
		uv1(slot4, slot9)

		if slot2 and slot9.min <= slot2.rank and slot2.rank <= slot9.max then
			slot3 = slot9.items
		end
	end

	uv2(slot4, SortTools.KeyLowerSorter("min"))

	slot0.award_list = slot4

	slot0.scroll_view:reloadData()

	if slot2 and slot2.rank > 0 then
		slot0.rank_num:setString(tostring(slot2.rank))
	else
		slot0.rank_num:setString(TI18N("未上榜"))
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot3, {
		scale = 0.9,
		max_count = 3
	})
end

function ArenaManyPeopleAwardsPanel.DeleteMe(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end

ArenaManyPeopleAwardsItem = class("ArenaManyPeopleAwardsItem", function ()
	return ccui.Layout:create()
end)

function ArenaManyPeopleAwardsItem.ctor(slot0)
	slot0.item_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("arenamanypeople/amp_awards_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.rank_img = slot0.root_wnd:getChildByName("rank_img")
	slot0.rank_label = slot0.root_wnd:getChildByName("rank_label")
	slot0.item_container = slot0.root_wnd:getChildByName("item_container")

	slot0.item_container:setScrollBarEnabled(false)
	slot0:registerEvent()
end

function ArenaManyPeopleAwardsItem.registerEvent(slot0)
end

function ArenaManyPeopleAwardsItem.setData(slot0, slot1)
	if slot1 ~= nil then
		if slot1.min ~= nil then
			if slot1.min <= 1 then
				slot0.rank_label:setVisible(false)

				if slot1.rank == 0 then
					slot0.rank_img:setVisible(false)
				else
					if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.min)) then
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

		slot0.item_list = commonShowSingleRowItemList(slot0.item_container, slot0.item_list, slot1.items, {
			scale = 0.9,
			max_count = 3
		})
	end
end

function ArenaManyPeopleAwardsItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
