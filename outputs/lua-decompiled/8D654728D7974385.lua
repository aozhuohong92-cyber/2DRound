slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
ActionFortuneBagRuleWindow = ActionFortuneBagRuleWindow or BaseClass(BaseView)

function ActionFortuneBagRuleWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_fortune_bag_rule_window"
	slot0.camp_id = uv0:getFortuneBagCampId()
	slot0.rule_data = {}
end

function ActionFortuneBagRuleWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 2)
	slot1:getChildByName("win_title"):setString(TI18N("奖励详情"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot3 = slot1:getChildByName("list_panel")
	slot0.scroll_size = slot3:getContentSize()
	slot0.desc_scrollview = createScrollView(slot0.scroll_size.width, slot0.scroll_size.height, 0, 0, slot3)
end

function ActionFortuneBagRuleWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openFortuneBagRuleWindow(false)
	end, false, 2)

	if not slot0.update_fortune_bag_surplus_event then
		slot0.update_fortune_bag_surplus_event = GlobalEvent:getInstance():Bind(ActionEvent.FORTUNE_BAG_SURPLUS_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setPanelData(slot0)
		end)
	end
end

function ActionFortuneBagRuleWindow.openRootWnd(slot0, slot1)
	slot0.rule_data = slot1

	uv0:sender28301()
end

function ActionFortuneBagRuleWindow.setPanelData(slot0, slot1)
	if not slot0.rule_data or not slot1 then
		return
	end

	slot2 = 0
	slot4 = 0

	if slot1 and slot3.award_list then
		if not slot0.title_bg_1 then
			slot0.title_bg_1 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90090"), 0, 0, cc.p(0, 1), true, nil, true)

			slot0.title_bg_1:setCapInsets(cc.rect(2, 10, 2, 2))
			slot0.title_bg_1:setContentSize(cc.size(205, 36))

			slot6 = createLabel(24, 274, nil, 10, 18, TI18N("本轮剩余数量"), slot0.title_bg_1, nil, cc.p(0, 0.5))
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

			slot5 = TI18N("道具剩余数量")
			slot6 = createLabel(24, 116, nil, 152, 22, TI18N("道具"), slot0.info_title_bg_1, nil, cc.p(0.5, 0.5))
			slot7 = createLabel(24, 116, nil, 457, 22, TI18N("剩余数量"), slot0.info_title_bg_1, nil, cc.p(0.5, 0.5))
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

			slot0.num_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
			slot0.num_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
			slot0.num_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		end

		slot6 = {}
		slot8 = Config.HolidayOptionalLotteryData.data_optional_award[slot0.camp_id]
		slot9 = {}

		if Config.HolidayOptionalLotteryData.data_normal_award[slot0.camp_id][slot0.rule_data.round] then
			for slot13, slot14 in pairs(slot7) do
				if slot9[slot14.type_id] == nil then
					slot9[slot14.type_id] = {
						sum_count = 1,
						rewards = slot14.rewards
					}
				else
					slot9[slot14.type_id].sum_count = slot9[slot14.type_id].sum_count + 1
				end
			end
		end

		if slot0.rule_data.optional_id and slot8[slot0.rule_data.optional_id] then
			slot9[slot0.rule_data.optional_id] = {
				sum_count = 1,
				rewards = slot8[slot0.rule_data.optional_id].rewards
			}
		end

		for slot13, slot14 in pairs(slot9) do
			slot14.count = slot14.sum_count

			for slot18, slot19 in pairs(slot3.award_list) do
				if slot19.type_id == slot13 then
					slot14.count = slot14.sum_count - slot19.get_count
				end
			end

			uv0(slot6, slot14)
		end

		slot0.num_config = slot6

		slot0.num_scrollview:reloadData()

		slot2 = 54 + slot5.height + 60
	end

	slot5 = 0

	if slot0.rule_data and Config.HolidayOptionalLotteryData.data_constant then
		if not slot0.title_bg_2 then
			slot0.title_bg_2 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90090"), 0, 0, cc.p(0, 1), true, nil, true)

			slot0.title_bg_2:setCapInsets(cc.rect(2, 10, 2, 2))
			slot0.title_bg_2:setContentSize(cc.size(205, 36))

			slot7 = createLabel(24, 274, nil, 10, 18, TI18N("内容详情"), slot0.title_bg_2, nil, cc.p(0, 0.5))
		end

		if not slot0.award_desc then
			slot0.award_desc = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0.5, 1), cc.p(slot0.scroll_size.width * 0.5, 430), 10, nil, 580)

			slot0.desc_scrollview:addChild(slot0.award_desc)
		end

		slot0.award_desc:setString(slot6.rules.desc or "")

		slot2 = slot2 + slot0.award_desc:getContentSize().height + 54 + 10
	end

	slot6 = nil

	if slot2 + 50 <= slot0.scroll_size.height then
		slot0.desc_scrollview:setTouchEnabled(false)

		slot6 = slot0.scroll_size.height
	else
		slot0.desc_scrollview:setTouchEnabled(true)

		slot6 = slot2 + 50
	end

	slot0.desc_scrollview:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot6))

	if slot0.title_bg_1 then
		slot0.title_bg_1:setPositionY(slot6)
	end

	if slot0.info_title_bg_1 then
		slot0.info_title_bg_1:setPositionY(slot6 - 42)
	end

	if slot0.info_bg_1 then
		slot0.info_bg_1:setPositionY(slot6 - 40)
	end

	if slot0.num_scrollview then
		slot0.num_scrollview:setPositionY(slot6 - 90)
	end

	if slot0.title_bg_2 then
		slot0.title_bg_2:setPositionY(slot6 - slot4)
	end

	if slot0.award_desc then
		slot0.award_desc:setPositionY(slot6 - slot4 - 54)
	end
end

function ActionFortuneBagRuleWindow.createNewCell(slot0)
	return ActionFortuneBagRuleItem.new()
end

function ActionFortuneBagRuleWindow.numberOfCells(slot0)
	if not slot0.num_config then
		return 0
	end

	return #slot0.num_config
end

function ActionFortuneBagRuleWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.num_config[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
end

function ActionFortuneBagRuleWindow.close_callback(slot0)
	doStopAllActions(slot0.desc_scrollview)

	if slot0.num_scrollview then
		slot0.num_scrollview:DeleteMe()
	end

	slot0.num_scrollview = nil

	if slot0.update_fortune_bag_surplus_event then
		GlobalEvent:getInstance():UnBind(slot0.update_fortune_bag_surplus_event)

		slot0.update_fortune_bag_surplus_event = nil
	end

	uv0:openFortuneBagRuleWindow(false)
end

ActionFortuneBagRuleItem = class("ActionFortuneBagRuleItem", function ()
	return ccui.Widget:create()
end)

function ActionFortuneBagRuleItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionFortuneBagRuleItem.configUI(slot0)
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

function ActionFortuneBagRuleItem.register_event(slot0)
end

function ActionFortuneBagRuleItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.name_text:setTextColor(Config.ColorData.data_color4[274])
	slot0.num_text:setTextColor(Config.ColorData.data_color4[274])

	if Config.ItemData.data_get_data(slot1.rewards[1][1]) then
		slot0.name_text:setString(string.format("%s*%d", slot2.name, slot1.rewards[1][2]))
	end

	slot0.name_text:setTextColor(BackPackConst.getWhiteQualityColorC4B(slot2.quality))
	slot0.num_text:setString(string.format("%d/%d", slot1.count, slot1.sum_count))
end

function ActionFortuneBagRuleItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
