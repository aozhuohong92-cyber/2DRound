RankRewardPanel = RankRewardPanel or BaseClass(BaseView)
slot0 = RankController:getInstance()
slot1 = table.sort
slot2 = string.format

function RankRewardPanel.__init(slot0, slot1)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.layout_name = "rank/rank_reward_panel"
	slot0.res_list = {}
	slot0.rank_reward_type = slot1 or 1
end

function RankRewardPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.rank_panel = slot0.main_container:getChildByName("rank_panel")
	slot0.my_rank = slot0.main_container:getChildByName("my_rank")

	slot0.my_rank:getChildByName("title"):setString(TI18N("我的排名"))

	slot0.rank_index = slot0.my_rank:getChildByName("rank_id")
	slot0.label_tips = slot0.my_rank:getChildByName("label_tips")
	slot0.item_scrollview = slot0.my_rank:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.title_con = slot0.main_container:getChildByName("title_con")

	slot0.title_con:getChildByName("title_label"):setString("奖励预览" or "")
end

function RankRewardPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 1)
	slot0:addGlobalEvent(ActionEvent.RANK_REWARD_LIST, function (slot0)
		if not slot0 then
			return
		end

		uv0.cell_data_list = slot0.rank_award

		uv1(uv0.cell_data_list, function (slot0, slot1)
			return slot0.rank1 < slot1.rank2
		end)

		if #uv0.cell_data_list == 0 then
			uv0:showEmptyIcon()
		else
			uv0:updateRankList()
		end

		uv0:updateMyRankInfo(slot0.rank)
	end)
end

function RankRewardPanel.onClosedBtn(slot0)
	uv0:openRankRewardPanel(false)
end

function RankRewardPanel.openRootWnd(slot0, slot1, slot2)
	if slot1 ~= nil then
		slot0.cell_data_list = slot1

		if #slot0.cell_data_list == 0 then
			slot0:showEmptyIcon()
		else
			slot0:updateRankList()
		end

		slot0:updateMyRankInfo(slot2)
	else
		ActionController:getInstance():send16650(slot0.rank_reward_type)
	end
end

function RankRewardPanel.updateMyRankInfo(slot0, slot1)
	if not slot0.cell_data_list then
		return
	end

	if slot1 == nil or slot1 == 0 then
		slot0.rank_index:setVisible(false)
		slot0.label_tips:setString(TI18N("未上榜"))

		return
	end

	slot0.rank_index:setString(slot1)

	slot2 = nil

	for slot6, slot7 in ipairs(slot0.cell_data_list) do
		if slot7.rank1 and slot7.rank2 then
			if slot7.rank1 <= slot1 and slot1 <= slot7.rank2 then
				slot2 = slot7
			end
		elseif slot7.rank1 and slot1 <= slot7.rank1 then
			slot2 = slot7
		end
	end

	if not slot2 then
		return
	end

	slot5 = #slot2.award

	slot0.item_scrollview:setInnerContainerSize(cc.size(math.max(slot0.item_scrollview_size.width, (BackPackItem.Width * 0.8 + 10) * slot5), slot0.item_scrollview_size.height))

	if slot5 <= 3 then
		slot0.item_scrollview:setTouchEnabled(false)
	end

	slot0.item_list = {}
	slot0.start_x = slot4 * 0.5
	slot9 = nil
	slot10 = #slot0.item_list

	for slot14, slot15 in ipairs(slot2.award) do
		delayRun(slot0.item_scrollview, slot14 / display.DEFAULT_FPS, function ()
			if not uv0.item_list[uv1] then
				uv2 = BackPackItem.new(true, true)

				uv2:setAnchorPoint(0, 0.5)
				uv2:setScale(uv3)
				uv2:setSwallowTouches(false)
				uv0.item_scrollview:addChild(uv2)

				uv0.item_list[uv1] = uv2

				uv2:setPosition(uv0.start_x + (uv1 - 1) * (uv4 + uv5) + 8, uv0.item_scrollview_size.height * 0.5)
				uv2:setBaseData(uv6.bid, uv6.num, true)
				uv2:setDefaultTip()
			end
		end)
	end
end

function RankRewardPanel.updateRankList(slot0)
	if slot0.common_scrollview == nil then
		slot1 = slot0.main_container:getChildByName("lay_scrollview")
		slot0.common_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 634,
			item_height = 142,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.common_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.common_scrollview:reloadData()
end

function RankRewardPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("rank/rank_reward_item"))

	slot3:addChild(slot3.root_wnd)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.main_container = slot3.root_wnd:getChildByName("main_container")
	slot3.rank_img = slot3.main_container:getChildByName("rank_img")
	slot3.rank_label = slot3.main_container:getChildByName("rank_label")
	slot3.item_scrollview = slot3.main_container:getChildByName("item_scrollview")

	slot3.item_scrollview:setScrollBarEnabled(false)
	slot3.item_scrollview:setSwallowTouches(false)

	slot3.item_scrollview_size = slot3.item_scrollview:getContentSize()
	slot3.item_list = {}

	function slot3.DeleteMe()
		doStopAllActions(uv0.item_scrollview)

		if uv0.item_list ~= nil then
			for slot3, slot4 in pairs(uv0.item_list) do
				slot4:DeleteMe()
			end

			uv0.item_list = nil
		end
	end

	return slot3
end

function RankRewardPanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function RankRewardPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list[slot2] then
		return
	end

	if slot3.rank1 <= 3 then
		slot1.rank_label:setVisible(false)
		slot1.rank_img:setVisible(true)
		loadSpriteTexture(slot1.rank_img, PathTool.getResFrame("common", "common_200" .. slot3.rank1), LOADTEXT_TYPE_PLIST)
	else
		slot1.rank_label:setVisible(true)
		slot1.rank_img:setVisible(false)

		slot4 = nil

		slot1.rank_label:setString((not slot3.rank1 or not slot3.rank2 or (slot3.rank2 ~= 9999 or uv0("%s+", slot3.rank1)) and uv0("%s~%s", slot3.rank1, slot3.rank2)) and slot3.rank1)
	end

	if slot1.item_list then
		for slot7, slot8 in ipairs(slot1.item_list) do
			slot8:setVisible(false)
		end
	end

	slot6 = #slot3.award

	slot1.item_scrollview:setInnerContainerSize(cc.size(math.max(slot1.item_scrollview_size.width, (BackPackItem.Width * 0.9 + 14) * slot6), slot1.item_scrollview_size.height))

	if slot6 <= 3 then
		slot1.item_scrollview:setTouchEnabled(false)
	end

	slot1.start_x = slot5 * 0.5

	slot1.item_scrollview:stopAllActions()

	slot10 = nil
	slot11 = #slot1.item_list

	for slot15, slot16 in ipairs(slot3.award) do
		if slot1.item_list[slot15] then
			slot10:setVisible(true)
			slot10:setPosition(slot1.start_x + (slot15 - 1) * (slot7 + slot5) + 8, slot1.item_scrollview_size.height * 0.5)
			slot10:setBaseData(slot16.bid, slot16.num, true)
			slot10:setDefaultTip()
		else
			if slot15 - slot11 <= 0 then
				slot17 = 1
			end

			delayRun(slot1.item_scrollview, slot17 / display.DEFAULT_FPS, function ()
				if not uv0.item_list[uv1] then
					uv2 = BackPackItem.new(true, true)

					uv2:setAnchorPoint(0, 0.5)
					uv2:setScale(uv3)
					uv2:setSwallowTouches(false)
					uv0.item_scrollview:addChild(uv2)

					uv0.item_list[uv1] = uv2

					uv2:setPosition(uv0.start_x + (uv1 - 1) * (uv4 + uv5) + 8, uv0.item_scrollview_size.height * 0.5)
					uv2:setBaseData(uv6.bid, uv6.num, true)
					uv2:setDefaultTip()
				end
			end)
		end
	end
end

function RankRewardPanel.showEmptyIcon(slot0, slot1)
	if not slot0.empty_con and slot1 == false then
		return
	end

	if not slot0.empty_con then
		slot3 = cc.size(200, 200)
		slot0.empty_con = ccui.Widget:create()

		slot0.empty_con:setContentSize(slot3)
		slot0.empty_con:setAnchorPoint(cc.p(0.5, 0))
		slot0.empty_con:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, 330))
		slot0.main_container:addChild(slot0.empty_con, 10)

		slot5 = createImage(slot0.empty_con, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"), slot3.width / 2, slot3.height / 2, cc.p(0.5, 0.5), false)
		slot0.empty_label = createLabel(26, Config.ColorData.data_color4[175], nil, slot3.width / 2, -10, "", slot0.empty_con, 0, cc.p(0.5, 0))
	end

	slot0.empty_label:setString(TI18N("暂无奖励数据"))
	slot0.empty_con:setVisible(slot1)
end

function RankRewardPanel.close_callback(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)

	if slot0.common_scrollview then
		slot0.common_scrollview:DeleteMe()

		slot0.common_scrollview = nil
	end
end
