EndlessAwardsPanel = class("EndlessAwardsPanel", function ()
	return ccui.Layout:create()
end)
slot0 = table.sort
slot1 = ArenaController:getInstance()
slot2 = ArenaController:getInstance():getModel()

function EndlessAwardsPanel.ctor(slot0, slot1)
	slot0.endless_type = slot1 or Endless_trailEvent.endless_type.old
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_awards_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:getChildByName("rank_title"):setString(TI18N("排名"))
	slot2:getChildByName("award_title"):setString(TI18N("奖励"))

	slot5 = slot2:getChildByName("scroll_container")
	slot0.scroll_view = CommonScrollViewLayout.new(slot5, nil, nil, nil, slot5:getContentSize(), {
		start_y = 0,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 124,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = EndlessAwardsItem
	})

	slot0:registerEvent()
end

function EndlessAwardsPanel.registerEvent(slot0)
end

function EndlessAwardsPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function EndlessAwardsPanel.addToParent(slot0)
	slot1 = deepCopy(Config.EndlessData.data_rank_reward_data[slot0.endless_type])
	slot5 = SortTools.KeyLowerSorter

	uv0(slot1, slot5("min"))

	for slot5, slot6 in ipairs(slot1) do
		slot6.index = slot5
	end

	slot0.scroll_view:setData(slot1)
end

function EndlessAwardsPanel.updatePanelInfo(slot0, slot1)
end

function EndlessAwardsPanel.DeleteMe(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

EndlessAwardsItem = class("EndlessAwardsItem", function ()
	return ccui.Layout:create()
end)

function EndlessAwardsItem.ctor(slot0)
	slot0.item_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_awards_item"))
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

function EndlessAwardsItem.registerEvent(slot0)
end

function EndlessAwardsItem.setData(slot0, slot1)
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

				slot0.item_list[slot3]:setBaseData(slot14[1], slot14[2])

				slot3 = slot3 + 1
			end
		end
	end
end

function EndlessAwardsItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
