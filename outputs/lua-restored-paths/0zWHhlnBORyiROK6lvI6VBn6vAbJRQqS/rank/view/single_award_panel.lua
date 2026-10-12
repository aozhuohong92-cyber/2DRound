SingleAwardPanel = class("SingleAwardPanel", function ()
	return ccui.Layout:create()
end)

function SingleAwardPanel.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_awards_panel"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:getChildByName("rank_title"):setString(TI18N("排名"))
	slot1:getChildByName("award_title"):setString(TI18N("奖励"))

	slot0.scroll_container = slot1:getChildByName("scroll_container")

	slot0:registerEvent()
end

function SingleAwardPanel.registerEvent(slot0)
end

function SingleAwardPanel.setNodeVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function SingleAwardPanel.updateScrollList(slot0)
	if not slot0.show_list then
		return
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			font_size = 22,
			scale = 1,
			text = TI18N("暂无奖励信息")
		})

		return
	end

	if not slot0.scroll_view then
		slot1 = slot0.scroll_container:getContentSize()
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(slot1.width * 0.5, slot1.height * 0.5), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1, {
			start_y = 0,
			start_x = 4,
			delay = 1,
			space_x = 4,
			item_width = 614,
			item_height = 124,
			space_y = 0,
			col = 1,
			need_dynamic = true
		}, cc.p(0.5, 0.5))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scroll_view:reloadData()
end

function SingleAwardPanel.createNewCell(slot0, slot1, slot2)
	return SingleAwardsItem.new(slot0.rank_type)
end

function SingleAwardPanel.numberOfCells(slot0)
	return #slot0.show_list
end

function SingleAwardPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3, slot2, slot2 == slot0:numberOfCells())
	end
end

function SingleAwardPanel.addToParent(slot0, slot1)
	if slot0.show_list == nil then
		slot0.setting = slot1 or {}
		slot0.rank_type = slot0.setting.rank_type or RankConstant.RankType.element
		slot0.show_list = slot0:getConfigByRankType(slot0.rank_type)

		slot0:updateScrollList()
	end
end

function SingleAwardPanel.getConfigByRankType(slot0, slot1)
	slot2 = {}

	if slot1 == RankConstant.RankType.element then
		table.sort(Config.ElementTempleData.data_award, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot1 == RankConstant.RankType.sandybeach_boss_fight then
		table.sort(Config.HolidayBossData.data_rank_info, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot0.rank_type == RankConstant.RankType.guild_secretarea then
		table.sort(Config.GuildSecretAreaData.data_rank_reward[slot0.setting.boss_id] or {}, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot0.rank_type == RankConstant.RankType.arena_peak_champion then
		table.sort(Config.ArenaPeakChampionData.data_rank_reward, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot0.rank_type == RankConstant.RankType.year_monster then
		config_list = Config.HolidayNianData.data_rank_reward

		for slot7, slot8 in ipairs(config_list) do
			table.insert(slot2, {
				min = slot8.rank_high,
				max = slot8.rank_low,
				awards = slot8.reward
			})
		end

		table.sort(slot2, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	elseif slot1 == RankConstant.RankType.sweet then
		table.sort(Config.HolidayValentinesData.data_rank_award or {}, function (slot0, slot1)
			return slot0.rank1 < slot1.rank2
		end)
	else
		print("排行类型为: ", slot1)
	end

	return slot2
end

function SingleAwardPanel.DeleteMe(slot0)
	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

SingleAwardsItem = class("SingleAwardsItem", function ()
	return ccui.Layout:create()
end)

function SingleAwardsItem.ctor(slot0, slot1)
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
	slot2 = cc.size(344, 110)
	slot0.scroll_view = createScrollView(slot2.width, slot2.height, 252, 7, slot0.root_wnd, ScrollViewDir.horizontal)
	slot0.total_width = slot0.item_container:getContentSize().width
	slot0.rank_type = slot1

	slot0:registerEvent()
end

function SingleAwardsItem.registerEvent(slot0)
end

function SingleAwardsItem.setData(slot0, slot1, slot2, slot3)
	if slot1 ~= nil then
		slot1.index = slot2

		if slot1.index ~= nil then
			if slot1.index <= 3 then
				slot0.rank_label:setVisible(false)

				if slot1.rank == 0 then
					slot0.rank_img:setVisible(false)
				else
					if slot0.rank_res_id ~= PathTool.getResFrame("common", string.format("common_200%s", slot1.index)) then
						slot0.rank_res_id = slot4

						loadSpriteTexture(slot0.rank_img, slot4, LOADTEXT_TYPE_PLIST)
					end

					slot0.rank_img:setVisible(true)
				end
			else
				slot0.rank_img:setVisible(false)
				slot0.rank_label:setVisible(true)

				if slot3 and slot1.max == 999 then
					slot0.rank_label:setString(string.format("%s+", slot1.min or slot1.rank1))
				else
					slot0.rank_label:setString(string.format("%s~%s", slot1.min or slot1.rank1, slot1.max or slot1.rank2))
				end
			end
		end

		slot0.item_list = commonShowSingleRowItemList(slot0.scroll_view, slot0.item_list, slot1.items or slot1.reward or slot1.awards or slot1.award, {
			scale = 0.8,
			max_count = 3
		})
	end
end

function SingleAwardsItem.DeleteMe(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
