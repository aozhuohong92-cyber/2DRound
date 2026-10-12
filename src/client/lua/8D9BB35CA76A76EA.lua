ActiontermbeginsRankTabReward = class("ActiontermbeginsRankTabReward", function ()
	return ccui.Widget:create()
end)
slot1 = ActiontermbeginsController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = RoleController:getInstance():getRoleVo()
slot5 = math.floor

function ActiontermbeginsRankTabReward.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ActiontermbeginsRankTabReward.config(slot0)
end

function ActiontermbeginsRankTabReward.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("actiontermbegins/action_term_begins_rank_tab_reward"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.item_list = slot0.main_container:getChildByName("item_list")

	slot0.main_container:getChildByName("range_label"):setString(TI18N("名次"))
	slot0.main_container:getChildByName("reward_label"):setString(TI18N("奖励"))

	slot0.my_rank = slot0.main_container:getChildByName("my_rank")
	slot0.award_title = slot0.my_rank:getChildByName("award_title")

	slot0.award_title:setString(TI18N("保持排名可获得奖励:"))
	slot0.my_rank:getChildByName("rank_title"):setString(TI18N("我的排名:"))

	slot0.rank_label = slot0.my_rank:getChildByName("rank_label")
	slot0.good_con = slot0.my_rank:getChildByName("good_con")
	slot5 = slot0.good_con:getContentSize()
	slot0.good_con_size = slot5
	slot0.item_scroll_view = createScrollView(slot5.width, slot5.height, 0, 0, slot0.good_con, ccui.ScrollViewDir.horizontal)

	slot0.item_scroll_view:setAnchorPoint(cc.p(0, 0))
	slot0.item_scroll_view:setInnerContainerSize(cc.size(slot5.width, slot5.height))
	slot0.item_scroll_view:setSwallowTouches(false)
end

function ActiontermbeginsRankTabReward.registerEvents(slot0)
end

function ActiontermbeginsRankTabReward.setData(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.rank_type == RankConstant.RankType.termbegins and not slot0.is_init then
		slot0.is_init = true

		if slot0.parent.scdata then
			slot0:setScdata(slot0.parent.scdata)
		end
	end
end

function ActiontermbeginsRankTabReward.setScdata(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot0.rank_type = slot0.parent.rank_type or RankConstant.RankType.termbegins
	slot2 = true

	if slot0.parent.rank_type == RankConstant.RankType.termbegins then
		slot2 = false
		slot0.rank = slot1.rank_per
		slot0.reward = uv0:getRankRewardByRank(slot0.rank)
	else
		slot2 = true
	end

	if slot2 then
		slot0.my_rank:setVisible(false)

		slot0.bg_size = slot0.bg:getContentSize()

		slot0.bg:setContentSize(cc.size(slot0.bg_size.width, 805))
		slot0.item_list:setContentSize(cc.size(slot0.item_list:getContentSize().width, 734))
	else
		slot0:initMyRank()
	end

	slot0.show_list = slot0:getConfigByRankType(slot0.rank_type)

	slot0:updateList()
end

function ActiontermbeginsRankTabReward.getConfigByRankType(slot0, slot1)
	slot2 = {}

	if slot1 == RankConstant.RankType.element then
		table.sort(Config.ElementTempleData.data_award, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot1 == RankConstant.RankType.sandybeach_boss_fight then
		table.sort(Config.HolidayBossData.data_rank_info, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot1 == RankConstant.RankType.termbegins then
		table.sort(Config.HolidayTermBeginsData.data_rank_reward, function (slot0, slot1)
			return slot0.rank1 < slot1.rank1
		end)
	end

	return slot2
end

function ActiontermbeginsRankTabReward.initMyRank(slot0)
	if slot0.rank <= 0 then
		slot0.rank_label:setString(TI18N("未上榜"))
		slot0.rank_label:setTextColor(cc.c3b(169, 95, 15))

		if slot0.parent.rank_type == RankConstant.RankType.termbegins then
			slot0.award_title:setString(TI18N("前1%可获得右边奖励:"))
		end
	else
		if slot0.parent.rank_type == RankConstant.RankType.termbegins then
			slot0.rank_label:setString(uv0(TI18N("前%s%%"), slot0.rank))
		else
			slot0.rank_label:setString(slot0.rank)
		end

		slot0.rank_label:setTextColor(cc.c3b(336, 144, 3))
	end

	if slot0.reward then
		slot0.packback_item_list = commonShowSingleRowItemList(slot0.item_scroll_view, slot0.packback_item_list, slot0.reward, {
			scale = 0.8,
			max_count = 3,
			is_center = true
		})
	end
end

function ActiontermbeginsRankTabReward.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.item_list:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 614,
			item_height = 138,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.item_list, true, {
			text = TI18N("暂无奖励数据")
		})
	else
		commonShowEmptyIcon(slot0.item_list, false)
	end

	slot0.item_scrollview:reloadData()
end

function ActiontermbeginsRankTabReward.createNewCell(slot0, slot1, slot2)
	return TermbeginsRewardItem.new(slot1, slot2, slot0.parent.rank_type)
end

function ActiontermbeginsRankTabReward.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ActiontermbeginsRankTabReward.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3, slot2)
end

function ActiontermbeginsRankTabReward.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ActiontermbeginsRankTabReward.DeleteMe(slot0)
	if slot0.boss_form_event then
		GlobalEvent:getInstance():UnBind(slot0.boss_form_event)

		slot0.boss_form_event = nil
	end

	if slot0.packback_item_list then
		for slot4, slot5 in pairs(slot0.packback_item_list) do
			slot5:DeleteMe()
		end

		slot0.packback_item_list = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	doStopAllActions(slot0.item_scrollview)
end

TermbeginsRewardItem = class("TermbeginsRewardItem", function ()
	return ccui.Layout:create()
end)

function TermbeginsRewardItem.ctor(slot0, slot1, slot2, slot3)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("actiontermbegins/action_term_begins_reward_item"))
	slot0.size = cc.size(slot1, slot2)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.level_name = slot0.container:getChildByName("level_name")
	slot0.icon = slot0.container:getChildByName("icon")
	slot0.level_name2 = slot0.container:getChildByName("level_name2")
	slot0.item_scrollview = slot0.container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.rank_type = slot3 or 0

	slot0:registerEvent()
end

function TermbeginsRewardItem.registerEvent(slot0)
end

function TermbeginsRewardItem.setData(slot0, slot1, slot2)
	if slot1 ~= nil then
		slot1.index = slot2
		slot3 = slot1.items

		if slot0.rank_type == RankConstant.RankType.termbegins then
			slot3 = slot1.award

			if slot1.index == 1 then
				slot0.level_name:setString(string.format(TI18N("前%s%%"), slot1.rank2))
			else
				slot0.level_name:setString(string.format(TI18N("前%s%%(不含)~%s%%"), slot1.rank1, slot1.rank2))
			end
		else
			slot3 = slot1.items

			if slot1.index <= 3 then
				slot0.level_name:setVisible(false)

				if slot1.rank == 0 then
					slot0.icon:setVisible(false)
				else
					if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.index)) then
						slot0.rank_res_id = slot4

						loadSpriteTexture(slot0.icon, slot4, LOADTEXT_TYPE_PLIST)
					end

					slot0.icon:setVisible(true)
				end
			else
				slot0.icon:setVisible(false)
				slot0.level_name:setVisible(true)
				slot0.level_name:setString(string.format("%s~%s", slot1.min, slot1.max))
			end
		end

		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot3, {
			scale = 0.8,
			max_count = 3
		})
	end
end

function TermbeginsRewardItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
