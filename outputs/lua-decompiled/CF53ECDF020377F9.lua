slot1 = ReturnActionController:getInstance():getModel()
slot2 = table.insert
ReturnActionSummonAwardView = ReturnActionSummonAwardView or BaseClass(BaseView)

function ReturnActionSummonAwardView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "returnaction/returnaction_summon_award"
	slot0.res_list = {}
	slot0.pro_config = {}
	slot0.num_config = {}
end

function ReturnActionSummonAwardView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("奖励详情"))

	slot0.time_label = slot1:getChildByName("time_label")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot3 = slot1:getChildByName("list_panel")
	slot0.scroll_size = slot3:getContentSize()
	slot0.desc_scrollview = createScrollView(slot0.scroll_size.width, slot0.scroll_size.height, 0, 0, slot3)
end

function ReturnActionSummonAwardView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openReturnActionSummonAwardView(false)
	end, false, 2)
end

function ReturnActionSummonAwardView.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.text_elite = slot3 or nil
	slot0.period = slot1
	slot0.data = slot2

	slot0:setData()
end

function ReturnActionSummonAwardView.setData(slot0)
	if not slot0.period then
		return
	end

	slot1 = 0
	slot3 = 0

	if uv0:getActionSummonItemList() then
		if not slot0.title_bg_1 then
			slot0.title_bg_1 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90090"), 0, 0, cc.p(0, 1), true, nil, true)

			slot0.title_bg_1:setCapInsets(cc.rect(2, 10, 2, 2))
			slot0.title_bg_1:setContentSize(cc.size(205, 36))

			slot5 = createLabel(24, 274, nil, 10, 18, TI18N("道具剩余数量"), slot0.title_bg_1, nil, cc.p(0, 0.5))
		end

		if not slot0.info_bg_1 then
			slot0.info_bg_1 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90024"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

			slot0.info_bg_1:setContentSize(cc.size(614, 260))
		end

		if not slot0.info_title_bg_1 then
			slot0.info_title_bg_1 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90025"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

			slot0.info_title_bg_1:setContentSize(cc.size(610, 44))

			slot0.line_1 = createImage(slot0.info_title_bg_1, PathTool.getResFrame("common", "common_1069"), 305, 22, cc.p(0.5, 0.5), true, nil, true)

			slot0.line_1:setContentSize(cc.size(2, 40))

			slot4 = TI18N("道具剩余数量")
			slot5 = createLabel(24, 116, nil, 152, 22, TI18N("道具"), slot0.info_title_bg_1, nil, cc.p(0.5, 0.5))
			slot6 = createLabel(24, 116, nil, 457, 22, TI18N("剩余数量"), slot0.info_title_bg_1, nil, cc.p(0.5, 0.5))
		end

		if slot0.num_scrollview == nil then
			slot0.num_scrollview = CommonScrollViewSingleLayout.new(slot0.desc_scrollview, cc.p(0, 990), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(584, 200), {
				start_y = 0,
				once_num = 1,
				start_x = 0,
				row = 1,
				space_x = 0,
				item_width = 584,
				item_height = 30,
				space_y = 5,
				col = 1
			}, cc.p(0, 1))

			slot0.num_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell2), ScrollViewFuncType.CreateNewCell)
			slot0.num_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells2), ScrollViewFuncType.NumberOfCells)
			slot0.num_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex2), ScrollViewFuncType.UpdateCellByIndex)
		end

		slot5 = {}

		for slot9, slot10 in pairs(slot2) do
			if slot10.cfg and slot10.cfg.show == 0 then
				uv1(slot5, slot10)
			end
		end

		slot0.num_config = slot5

		slot0.num_scrollview:reloadData()

		slot1 = 54 + slot4.height + 60
	end

	slot4 = 0

	if slot0.data and Config.HolidayReturnNewData.data_constant.tips_1 then
		if not slot0.title_bg_2 then
			slot0.title_bg_2 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90090"), 0, 0, cc.p(0, 1), true, nil, true)

			slot0.title_bg_2:setCapInsets(cc.rect(2, 10, 2, 2))
			slot0.title_bg_2:setContentSize(cc.size(205, 36))

			slot6 = createLabel(24, 274, nil, 10, 18, TI18N("内容详情"), slot0.title_bg_2, nil, cc.p(0, 0.5))
		end

		if not slot0.award_desc then
			slot0.award_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0.5, 1), cc.p(slot0.scroll_size.width * 0.5, 430), 10, nil, 580)

			slot0.desc_scrollview:addChild(slot0.award_desc)
		end

		slot0.award_desc:setString(slot5.desc or "")

		slot1 = slot1 + slot0.award_desc:getContentSize().height + 54 + 10
	end

	if slot2 then
		if not slot0.title_bg_3 then
			slot0.title_bg_3 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90090"), 0, 0, cc.p(0, 1), true, nil, true)

			slot0.title_bg_3:setCapInsets(cc.rect(2, 10, 2, 2))
			slot0.title_bg_3:setContentSize(cc.size(205, 36))

			slot5 = createLabel(24, 274, nil, 10, 18, TI18N("概率公示"), slot0.title_bg_3, nil, cc.p(0, 0.5))
		end

		if not slot0.info_bg_2 then
			slot0.info_bg_2 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90024"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

			slot0.info_bg_2:setContentSize(cc.size(614, 260))
		end

		if not slot0.info_title_bg_2 then
			slot0.info_title_bg_2 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90025"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

			slot0.info_title_bg_2:setContentSize(cc.size(610, 44))

			slot0.line_2 = createImage(slot0.info_title_bg_2, PathTool.getResFrame("common", "common_1069"), 305, 22, cc.p(0.5, 0.5), true, nil, true)

			slot0.line_2:setContentSize(cc.size(2, 40))

			slot5 = TI18N("道具剩余数量")
			slot6 = createLabel(24, 116, nil, 152, 22, TI18N("道具"), slot0.info_title_bg_2, nil, cc.p(0.5, 0.5))
			slot7 = createLabel(24, 116, nil, 457, 22, TI18N("概率"), slot0.info_title_bg_2, nil, cc.p(0.5, 0.5))
		end

		slot5 = cc.size(584, 200)

		if slot0.pro_scrollview == nil then
			slot0.pro_scrollview = CommonScrollViewSingleLayout.new(slot0.desc_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot5, {
				start_y = 0,
				once_num = 1,
				start_x = 0,
				row = 1,
				space_x = 0,
				item_width = 584,
				item_height = 30,
				space_y = 5,
				col = 1
			}, cc.p(0, 1))

			slot0.pro_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
			slot0.pro_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
			slot0.pro_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		end

		slot1 = slot1 + slot5.height + 54
		slot0.pro_config = slot2

		slot0.pro_scrollview:reloadData()
	end

	slot0.desc_scrollview:setInnerContainerSize(cc.size(slot0.scroll_size.width, math.max(slot0.scroll_size.height, slot1) + 100))

	if slot0.title_bg_1 then
		slot0.title_bg_1:setPositionY(slot5)
	end

	if slot0.info_title_bg_1 then
		slot0.info_title_bg_1:setPositionY(slot5 - 42)
	end

	if slot0.info_bg_1 then
		slot0.info_bg_1:setPositionY(slot5 - 40)
	end

	if slot0.num_scrollview then
		slot0.num_scrollview:setPositionY(slot5 - 90)
	end

	if slot0.title_bg_2 then
		slot0.title_bg_2:setPositionY(slot5 - slot3)
	end

	if slot0.award_desc then
		slot0.award_desc:setPositionY(slot5 - slot3 - 54)
	end

	if slot0.title_bg_3 then
		slot0.title_bg_3:setPositionY(slot5 - slot3 - slot4)
	end

	if slot0.info_title_bg_2 then
		slot0.info_title_bg_2:setPositionY(slot5 - slot3 - slot4 - 42)
	end

	if slot0.info_bg_2 then
		slot0.info_bg_2:setPositionY(slot5 - slot3 - slot4 - 40)
	end

	if slot0.pro_scrollview then
		slot0.pro_scrollview:setPositionY(slot5 - slot3 - slot4 - 90)
	end

	if slot0.data then
		slot0.time_label:setString(string.format(TI18N("概率有效期：%s~%s"), TimeTool.getYMD(slot0.data.starttime), TimeTool.getYMD(slot0.data.endtime)))
	end
end

function ReturnActionSummonAwardView.createNewCell2(slot0)
	return ReturnActionSummonAwardItem.new()
end

function ReturnActionSummonAwardView.numberOfCells2(slot0)
	if not slot0.num_config then
		return 0
	end

	return #slot0.num_config
end

function ReturnActionSummonAwardView.updateCellByIndex2(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.num_config[slot2] then
		return
	end

	slot4 = slot1:setData(slot3, 1)
end

function ReturnActionSummonAwardView.createNewCell(slot0)
	return ReturnActionSummonAwardItem.new()
end

function ReturnActionSummonAwardView.numberOfCells(slot0)
	if not slot0.pro_config then
		return 0
	end

	return #slot0.pro_config
end

function ReturnActionSummonAwardView.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.pro_config[slot2] then
		return
	end

	slot4 = slot1:setData(slot3, 2)
end

function ReturnActionSummonAwardView.close_callback(slot0)
	doStopAllActions(slot0.desc_scrollview)

	if slot0.pro_scrollview then
		slot0.pro_scrollview:DeleteMe()
	end

	slot0.pro_scrollview = nil

	if slot0.num_scrollview then
		slot0.num_scrollview:DeleteMe()
	end

	slot0.num_scrollview = nil

	uv0:openReturnActionSummonAwardView(false)
end

ReturnActionSummonAwardItem = class("ReturnActionSummonAwardItem", function ()
	return ccui.Widget:create()
end)

function ReturnActionSummonAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ReturnActionSummonAwardItem.configUI(slot0)
	slot0.size = cc.size(584, 30)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.name_text = createLabel(24, 274, nil, 169, slot0.size.height / 2, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.num_text = createLabel(24, 274, nil, 473, slot0.size.height / 2, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))
end

function ReturnActionSummonAwardItem.register_event(slot0)
end

function ReturnActionSummonAwardItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.name_text:setTextColor(Config.ColorData.data_color4[274])
	slot0.num_text:setTextColor(Config.ColorData.data_color4[274])

	if Config.ItemData.data_get_data(slot1.itemId) then
		slot0.name_text:setString(string.format("%s*%d", slot3.name, slot1.itemNum))

		if slot2 == 1 then
			slot0.name_text:setTextColor(BackPackConst.getWhiteQualityColorC4B(slot3.quality))
		end
	end

	if slot2 == 1 then
		slot4, slot5 = uv0:getActionSummonItemNumById(slot1.itemId)

		slot0.num_text:setString(string.format("%d/%d", slot5 - slot4, slot5))
	else
		slot0.num_text:setString(slot1.show_pro .. "%")
	end
end

function ReturnActionSummonAwardItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
