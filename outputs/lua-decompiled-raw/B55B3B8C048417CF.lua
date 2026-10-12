ActionFundTwoPanel = class("ActionFundTwoPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()

function ActionFundTwoPanel.ctor(slot0, slot1)
	slot0.parent = container
	slot0.fund_bid = slot1
	slot0.cell_data_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function ActionFundTwoPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_fund_panel"))

	slot0.root_wnd:setPosition(-40, -81)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:getChildByName("image_bg"):loadTexture(PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_fund_bg_2", true), LOADTEXT_TYPE)

	slot0.desc_txt = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(495, 608), 12, nil, 500)

	slot0.main_container:addChild(slot0.desc_txt)

	slot0.btn_award = slot0.main_container:getChildByName("btn_award")

	slot0.btn_award:setPositionY(755)
	slot0.btn_award:getChildByName("label"):setString(TI18N("奖励预览"))

	slot3 = slot0.main_container:getChildByName("award_title")

	slot3:setTextColor(cc.c3b(238, 228, 255))
	slot3:setString(TI18N("部分奖励预览"))

	slot0.not_buy_panel = slot0.main_container:getChildByName("not_buy_panel")

	slot0.not_buy_panel:setVisible(true)

	slot0.buy_btn = slot0.not_buy_panel:getChildByName("buy_btn")
	slot0.buy_btn_label = slot0.buy_btn:getChildByName("label")

	slot0.buy_btn_label:setString(TI18N("328元"))

	slot4 = createRichLabel(26, cc.c4b(255, 234, 182, 255), cc.p(0.5, 0.5), cc.p(360, 120), nil, , 500)

	slot4:setString(string.format(TI18N("<div outline=2,#000000>超值基金和豪华基金可同时购买哦</div>")))
	slot0.not_buy_panel:addChild(slot4)

	slot6 = createRichLabel(26, cc.c4b(255, 234, 182, 255), cc.p(0.5, 0.5), cc.p(565, 540), nil, , 500)

	slot6:setString(string.format(TI18N("<div outline=2,#000000>至尊月卡用户可激活</div>")))
	slot0.main_container:addChild(slot6)

	slot0.buy_panel = slot0.main_container:getChildByName("buy_panel")

	slot0.buy_panel:setVisible(false)
	slot0.buy_panel:getChildByName("title_time"):setString(TI18N("领取时间："))
	slot0.buy_panel:getChildByName("title_time"):setTextColor(cc.c3b(218, 182, 254))
	slot0.buy_panel:getChildByName("tips_txt"):setString(TI18N("(每天登陆累计1天，最大30天)"))
	slot0.buy_panel:getChildByName("tips_txt"):setTextColor(cc.c3b(218, 182, 254))

	slot0.total_day_txt = slot0.buy_panel:getChildByName("total_day_txt")
	slot0.time_txt = slot0.buy_panel:getChildByName("txt_time")

	slot0.time_txt:setTextColor(cc.c3b(218, 182, 254))

	slot0.get_btn = slot0.buy_panel:getChildByName("get_btn")
	slot0.get_btn_label = slot0.get_btn:getChildByName("label")

	slot0.get_btn_label:setString(TI18N("领取"))

	slot0.goods_list = slot0.main_container:getChildByName("goods_list")

	slot0:updateScrollviewList()
	slot0:updateView()
end

function ActionFundTwoPanel.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.goods_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.goods_list:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 0,
			delay = 4,
			space_x = 25,
			item_width = 115,
			item_height = 129,
			space_y = 10,
			col = 4
		}, cc.p(0, 0))

		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.child_scrollview:reloadData()
end

function ActionFundTwoPanel.createNewCell(slot0, slot1, slot2)
	return ActionFuncTwoItem.new()
end

function ActionFundTwoPanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionFundTwoPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list then
		return
	end

	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionFundTwoPanel.updateView(slot0)
	if not slot0.fund_bid then
		return
	end

	if not Config.MonthFundData.data_fund_data[slot0.fund_bid] then
		return
	end

	slot0.func_config = slot1

	slot0.desc_txt:setString(slot1.desc)
	slot0.buy_btn_label:setString(slot1.val .. TI18N("元"))
	slot0:setData()
end

function ActionFundTwoPanel.setData(slot0)
	if not uv0:getFundSrvDataById(slot0.fund_bid) or next(slot1) == nil then
		return
	end

	slot0.srv_data = slot1
	slot2 = Config.MonthFundData.data_fund_award[slot1.group_id] or {}

	if Config.MonthFundData.data_fund_group[slot1.group_id] or {} then
		slot4 = {}

		for slot8, slot9 in ipairs(slot3.reward) do
			slot10 = false

			if slot3.effect_val ~= nil and next(slot3.effect_val) ~= nil then
				for slot14, slot15 in ipairs(slot3.effect_val) do
					if slot15 == slot9 then
						slot10 = true

						break
					end
				end
			end

			table.insert(slot4, {
				day = slot9,
				award = slot2[slot9] or {},
				show_effect = slot10
			})
		end

		slot0.cell_data_list = slot4

		slot0.child_scrollview:reloadData()
	end

	if slot1.status == 0 or slot1.status == 3 then
		slot0.not_buy_panel:setVisible(true)
		slot0.buy_panel:setVisible(false)

		if slot1.status == 0 then
			setChildUnEnabled(false, slot0.buy_btn)
			slot0.buy_btn_label:enableOutline(Config.ColorData.data_color4[277], 2)
		else
			setChildUnEnabled(true, slot0.buy_btn)
			slot0.buy_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	elseif slot1.status == 1 or slot1.status == 2 then
		slot0.not_buy_panel:setVisible(false)
		slot0.buy_panel:setVisible(true)
		slot0.total_day_txt:setString(string.format(TI18N("当前累计：%d天"), slot1.current_day))
		slot0.time_txt:setString(TimeTool.getMD2(slot1.endtime - 2592000) .. "~" .. TimeTool.getMD2(slot1.endtime - 1))

		if slot2[slot1.current_day] or {} then
			slot6 = slot5[1][1]
			slot7 = slot5[1][2]

			if not slot0.award_node then
				slot0.award_node = BackPackItem.new(false, true, false, 0.9, false, true)

				slot0.award_node:setDefaultTip(true, false)
				slot0.award_node:setPosition(cc.p(108, 104))
				slot0.buy_panel:addChild(slot0.award_node)
			end

			slot0.award_node:setBaseData(slot6, slot7)
		end

		if slot1.status == 1 then
			setChildUnEnabled(false, slot0.get_btn)
			slot0.get_btn:setTouchEnabled(true)
			slot0.get_btn_label:setString(TI18N("领取"))
			slot0.get_btn_label:enableOutline(cc.c3b(43, 97, 13), 2)
		else
			setChildUnEnabled(true, slot0.get_btn)
			slot0.get_btn:setTouchEnabled(false)
			slot0.get_btn_label:setString(TI18N("已领取"))
			slot0.get_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		end
	end
end

function ActionFundTwoPanel.register_event(slot0)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0._onClickBuyBtn), false)
	registerButtonEventListener(slot0.get_btn, handler(slot0, slot0._onClickGetBtn), false)
	registerButtonEventListener(slot0.btn_award, handler(slot0, slot0._onClickAwardBtn), true)

	if not slot0.update_fund_data_event then
		slot0.update_fund_data_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATA_FUND_DATA_EVENT, function (slot0)
			if uv0.fund_bid == slot0 then
				uv0:setData()
			end
		end)
	end
end

function ActionFundTwoPanel._onClickBuyBtn(slot0)
	if slot0.srv_data and slot0.srv_data.status == 0 and slot0.func_config then
		if Config.ChargeData.data_charge_data[slot0.func_config.charge_id or 0] then
			sdkOnPay(slot2.val, nil, slot2.id, slot2.name, slot2.name)
		end
	elseif slot0.srv_data and slot0.srv_data.status == 3 then
		message(TI18N("请先激活至尊月卡"))
	end
end

function ActionFundTwoPanel._onClickGetBtn(slot0)
	if slot0.srv_data and slot0.srv_data.status == 1 then
		uv0:sender24702(slot0.srv_data.id)
	end
end

function ActionFundTwoPanel._onClickAwardBtn(slot0)
	if slot0.srv_data then
		uv0:openActionFundAwardWindow(true, slot0.srv_data.group_id, slot0.fund_bid)
	end
end

function ActionFundTwoPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		if not uv0:getFundSrvDataById(slot0.fund_bid) or next(slot2) == nil then
			uv1:sender24701(slot0.fund_bid)
		end

		if uv0:getFundIsInWelfare() ~= nil and next(slot3) ~= nil then
			for slot7, slot8 in ipairs(slot3) do
				if slot8.id == slot0.fund_bid then
					WelfareController:getInstance():sender24703(slot0.fund_bid)
				end
			end
		end
	end
end

function ActionFundTwoPanel.DeleteMe(slot0)
	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()

		slot0.child_scrollview = nil
	end

	if slot0.award_node then
		slot0.award_node:DeleteMe()

		slot0.award_node = nil
	end

	if slot0.update_fund_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_fund_data_event)

		slot0.update_fund_data_event = nil
	end
end

ActionFuncTwoItem = class("ActionFuncTwoItem", function ()
	return ccui.Widget:create()
end)

function ActionFuncTwoItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionFuncTwoItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_fund_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(115, 129))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.txt_time = slot0.container:getChildByName("txt_time")
end

function ActionFuncTwoItem.register_event(slot0)
end

function ActionFuncTwoItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.txt_time:setString(string.format(TI18N("累计%d天"), slot1.day or 1))

	slot2 = slot1.award[1][1]
	slot3 = slot1.award[1][2]

	if not slot0.item_node then
		slot0.item_node = BackPackItem.new(false, true, false, 0.8, false, true)

		slot0.item_node:setDefaultTip(true, false)
		slot0.item_node:setPosition(cc.p(slot0.container:getContentSize().width / 2, 78))
		slot0.container:addChild(slot0.item_node)
	end

	slot0.item_node:setBaseData(slot2, slot3)

	if slot0.item_effect == nil then
		if slot1.show_effect then
			slot0.item_effect = createEffectSpine(PathTool.getEffectRes(263), cc.p(slot0.item_node:getContentSize().width / 2, slot0.item_node:getContentSize().height / 2), cc.p(0.5, 0.5), true, "action1")

			slot0.item_effect:setScale(1.1)
			slot0.item_node:addChild(slot0.item_effect)
		end
	elseif slot1.show_effect then
		slot0.item_effect:setVisible(true)
	else
		slot0.item_effect:setVisible(false)
	end
end

function ActionFuncTwoItem.DeleteMe(slot0)
	if slot0.item_effect then
		slot0.item_effect:clearTracks()
		slot0.item_effect:removeFromParent()

		slot0.item_effect = nil
	end

	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
