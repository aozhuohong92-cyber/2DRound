GodBattleRankRewardPanel = GodBattleRankRewardPanel or BaseClass()

function GodBattleRankRewardPanel.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1

	slot0:createRootWnd()
	slot0:registerEvent()
end

function GodBattleRankRewardPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("godbattle/godbattle_rank_rewards_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.item = slot0.root_wnd:getChildByName("item")
	slot0.scroll_container = slot0.container:getChildByName("scroll_container")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.scroll_container, nil, , , slot0.scroll_container:getContentSize(), {
		start_y = 3,
		item_width = 616,
		start_x = 3,
		space_x = 0,
		row = 0,
		item_height = 134,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GodBattleRankRewardItem
	})
end

function GodBattleRankRewardPanel.registerEvent(slot0)
end

function GodBattleRankRewardPanel.addToParent(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	slot3 = GodbattleController:getInstance():getModel():getSelfInfo()

	if slot1 == true and slot3 then
		slot0.scroll_view:setData(Config.ZsWarData.data_rank_rewards[slot3.group], nil, , slot0.item)
	end
end

function GodBattleRankRewardPanel.__datale(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil
end

GodBattleRankRewardItem = class("GodBattleRankRewardItem", function ()
	return ccui.Layout:create()
end)

function GodBattleRankRewardItem.ctor(slot0)
	slot0.item_list = {}
end

function GodBattleRankRewardItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.label = slot0.root_wnd:getChildByName("rank_label")
		slot0.item_container = slot0.root_wnd:getChildByName("item_container")
		slot0.total_width = slot0.item_container:getContentSize().width

		slot0:registerEvent()
	end
end

function GodBattleRankRewardItem.registerEvent(slot0)
end

function GodBattleRankRewardItem.setData(slot0, slot1)
	if slot1 ~= nil then
		slot0.label:setString(slot1.desc)

		slot2 = nil
		slot3 = 1
		slot4 = nil
		slot5 = 0.8
		slot6 = 10
		slot7 = 0
		slot8 = 55
		slot9 = #slot1.items

		for slot13, slot14 in pairs(slot0.item_list) do
			slot14:setVisible(false)
		end

		for slot13 = slot9, 1, -1 do
			if Config.ItemData.data_get_data(slot1.items[slot13][1]) then
				if slot0.item_list[slot3] == nil then
					slot4 = BackPackItem.new(false, true, false, slot5, false, true)

					slot4:setPosition(slot0.total_width - ((slot3 - 1) * (BackPackItem.Width * slot5 + slot6) + BackPackItem.Width * 0.5 * slot5), slot8)
					slot0.item_container:addChild(slot4)

					slot0.item_list[slot3] = slot4
				end

				slot4 = slot0.item_list[slot3]

				slot4:setVisible(true)
				slot4:setBaseData(slot14[1], slot14[2])

				slot3 = slot3 + 1
			end
		end
	end
end

function GodBattleRankRewardItem.suspendAllActions(slot0)
end

function GodBattleRankRewardItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
