ActionMysteriousStorePanel = class("ActionMysteriousStorePanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = {
	166,
	243
}
slot6 = {
	220,
	270
}

function ActionMysteriousStorePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.frist_come_in = false
	slot0.is_change_id = nil
	slot0.cell_data_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionMysteriousStorePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_hero_expedit_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -66)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.time_label = slot0.title_con:getChildByName("label_time_key")

	slot0.time_label:setString(TI18N("剩余时间："))

	slot0.time_text = slot0.title_con:getChildByName("label_time")

	slot0.time_text:setTextColor(cc.c4b(128, 247, 49, 255))
	slot0.time_text:setAnchorPoint(cc.p(0, 0.5))

	slot0.rank_btn = slot0.title_con:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("详细排行"))

	slot0.reward_btn = slot0.title_con:getChildByName("reward_btn")

	slot0.reward_btn:getChildByName("label"):setString(TI18N("奖励预览"))

	slot0.btn_rule = slot0.title_con:getChildByName("btn_rule")

	slot0.btn_rule:setPositionX(670)
	slot0:loadBannerImage()

	slot0.good_cons = slot0.main_container:getChildByName("charge_con")

	slot0:updateScrollviewList()
	slot0:setPanelData()
	uv0:sender16688()
	uv1:setGiftRedStatus({
		status = false,
		bid = ActionRankCommonType.mysterious_store
	})
end

function ActionMysteriousStorePanel.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 0,
			delay = 4,
			space_x = 0,
			item_width = 688,
			item_height = 150,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.child_scrollview:setSwallowTouches(false)
	slot0.child_scrollview:reloadData()
end

function ActionMysteriousStorePanel.createNewCell(slot0, slot1, slot2)
	return ActionStoreItem.new()
end

function ActionMysteriousStorePanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionMysteriousStorePanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list then
		return
	end

	slot1.index = slot2

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionMysteriousStorePanel.loadBannerImage(slot0)
	slot1 = slot0.title_con:getChildByName("title_img")
	slot2 = ""

	if slot0.holiday_bid == ActionRankCommonType.mysterious_store then
		slot2 = "txt_cn_welfare_banner24"

		slot0.reward_btn:setVisible(false)
		slot0.rank_btn:setVisible(false)
	end

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot3.reward_title ~= "" and slot3.reward_title then
		slot2 = slot3.reward_title
	end

	slot0:updataItem(nil, nil, true)

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes(slot2), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end
end

function ActionMysteriousStorePanel.setPanelData(slot0)
	uv1:setCountDownTime(slot0.time_text, uv0:getActionSubTabVo(slot0.holiday_bid).remain_sec or 0)
end

function ActionMysteriousStorePanel.setItemData(slot0)
	if slot0.child_scrollview then
		slot0.cell_data_list = slot0:setConfigData()

		slot0.child_scrollview:reloadData()
	end
end

function ActionMysteriousStorePanel.setConfigData(slot0)
	slot1 = {}

	for slot6, slot7 in pairs(Config.HolidayExchangeData.data_get_config_const) do
		if uv0:getStoneShopData(slot7.id) then
			slot10 = slot8.all_num or 0
			slot11 = 0

			if slot7.sub_type == ActonExchangeType.Perday then
				slot11 = slot7.r_limit_day - (slot8.day_num or 0)
			elseif slot7.sub_type == ActonExchangeType.AllServer then
				-- Nothing
			elseif slot7.sub_type == ActonExchangeType.Activity then
				slot11 = slot7.r_limit_all - slot10
			end

			slot7.count = slot11

			if slot7.count <= 0 then
				slot7.sort = 1000000
			else
				slot7.sort = slot11
			end

			slot12 = nil

			for slot16, slot17 in ipairs(slot7.expend) do
				slot12 = (not Config.ItemData.data_get_data(slot17[1]) or slot16 ~= 1 or slot19.name) and slot19.name .. "、" .. slot19.name
			end

			slot7.name_str = slot12

			uv1(slot1, slot7)
		end
	end

	uv2(slot1, SortTools.tableCommonSorter({
		{
			"sort",
			false
		},
		{
			"id",
			false
		}
	}))

	return slot1
end

function ActionMysteriousStorePanel.register_event(slot0)
	if not slot0.update_store_data_event then
		slot0.update_store_data_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_STORE_DATA_EVENT, function ()
			if uv0.setItemData and uv0.frist_come_in == false then
				uv0.frist_come_in = true

				uv0:setItemData()
			end
		end)
	end

	if not slot0.update_store_data_success_event then
		slot0.update_store_data_success_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_STORE_DATA_SUCCESS_EVENT, function (slot0)
			uv0:changeSuccessData(slot0.id)
		end)
	end

	registerButtonEventListener(slot0.rank_btn, function ()
		uv0:jumpRankView()
	end, true, 1)
	registerButtonEventListener(slot0.reward_btn, function ()
		RankController:getInstance():openRankRewardPanel(true, uv0.holiday_bid)
	end, true, 1)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		slot3 = Config.HolidayClientData.data_constant.expedit_rules

		if uv0.holiday_bid == ActionRankCommonType.mysterious_store then
			slot3 = Config.HolidayClientData.data_constant.mysterious_store_rules
		end

		TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updataItem(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updataItem(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updataItem(slot0, slot1)
		end)
	end
end

function ActionMysteriousStorePanel.updataItem(slot0, slot1, slot2, slot3)
	slot4 = nil

	if Config.HolidayExchangeData.data_constant and slot5.consume_id and slot5.consume_id.val then
		slot4 = slot5.consume_id.val
	else
		return
	end

	if slot2 ~= nil then
		for slot9, slot10 in pairs(slot2) do
			if slot10.base_id == slot4 then
				slot3 = true
			end
		end
	end

	if slot3 then
		if slot0.item_icon == nil then
			slot0.item_icon = createSprite(nil, 580, 36, slot0.title_con, cc.p(0.5, 0.5), nil)

			slot0.item_icon:setScale(0.4)
		end

		if slot0.item_num == nil then
			slot0.item_num = createLabel(24, cc.c4b(255, 255, 255, 255), nil, 630, 36, nil, slot0.title_con, nil, cc.p(0.5, 0.5))
		end

		if Config.ItemData.data_get_data(slot4) then
			loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE)
		end

		slot0.item_num:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot4))
	end
end

function ActionMysteriousStorePanel.changeSuccessData(slot0, slot1)
	slot2 = Config.HolidayExchangeData.data_get_config_const

	if uv0:getStoneShopData(slot1) and slot2 and slot2[slot1] then
		slot5 = slot3.all_num or 0
		slot6 = 0

		if slot2[slot1].sub_type == ActonExchangeType.Perday then
			slot6 = slot2[slot1].r_limit_day - (slot3.day_num or 0)
		elseif slot2[slot1].sub_type == ActonExchangeType.AllServer then
			-- Nothing
		elseif slot2[slot1].sub_type == ActonExchangeType.Activity then
			slot6 = slot2[slot1].r_limit_all - slot5
		end

		if slot0.child_scrollview then
			slot0.cell_data_list = slot0:setConfigData()

			if slot6 <= 0 then
				slot0.child_scrollview:reloadData()
			else
				slot0.child_scrollview:resetCurrentItems()
			end
		end
	end
end

function ActionMysteriousStorePanel.jumpRankView(slot0)
end

function ActionMysteriousStorePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionMysteriousStorePanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()
	end

	slot0.child_scrollview = nil

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end

	if slot0.update_store_data_success_event then
		GlobalEvent:getInstance():UnBind(slot0.update_store_data_success_event)

		slot0.update_store_data_success_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end
end

ActionStoreItem = class("ActionStoreItem", function ()
	return ccui.Widget:create()
end)

function ActionStoreItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.cost_list_data = {}
	slot0.get_list_data = {}
end

function ActionStoreItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_mysterious_store_item"))

	slot0:setContentSize(cc.size(688, 150))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.txt_title = slot1:getChildByName("txt_title")

	slot0.txt_title:setString("")

	slot0.txt_task = slot1:getChildByName("txt_task")

	slot0.txt_task:setString("")

	slot0.btn_exchange = slot1:getChildByName("btn_exchange")
	slot0.txt_exchange = slot0.btn_exchange:getChildByName("txt_exchange")

	slot0.txt_exchange:setString(TI18N("兑换"))

	slot0.img_has_get = slot1:getChildByName("img_has_get")

	slot0.img_has_get:setVisible(false)

	slot0.img_equal = slot1:getChildByName("img_equal")
	slot0.cost_good_cons = slot1:getChildByName("cost_good_cons")

	slot0.cost_good_cons:setContentSize(cc.size(200, 100))

	slot0.get_good_cons = slot1:getChildByName("get_good_cons")

	slot0:updateScrollviewList()
end

function ActionStoreItem.updateScrollviewList(slot0)
	if slot0.cost_item_scrollview == nil then
		slot0.cost_item_scrollview = CommonScrollViewSingleLayout.new(slot0.cost_good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.cost_good_cons:getContentSize(), {
			start_y = 4,
			once_num = 1,
			start_x = 3,
			row = 1,
			delay = 4,
			space_x = 5,
			space_y = 0,
			col = 0,
			item_width = BackPackItem.Width * 0.8,
			item_height = BackPackItem.Height * 0.8
		}, cc.p(0, 0))

		slot0.cost_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.cost_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.cost_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.cost_item_scrollview:setClickEnabled(false)
	slot0.cost_item_scrollview:setSwallowTouches(false)

	if slot0.get_item_scrollview == nil then
		slot0.get_item_scrollview = CommonScrollViewSingleLayout.new(slot0.get_good_cons, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.get_good_cons:getContentSize(), slot1, cc.p(0, 0))

		slot0.get_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell1), ScrollViewFuncType.CreateNewCell)
		slot0.get_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells1), ScrollViewFuncType.NumberOfCells)
		slot0.get_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex1), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.get_item_scrollview:setSwallowTouches(false)
end

function ActionStoreItem.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new()

	slot3:setDefaultTip()
	slot3:setSwallowTouches(false)
	slot3:setScale(0.8)

	return slot3
end

function ActionStoreItem.numberOfCells(slot0)
	if not slot0.cost_list_data then
		return 0
	end

	return #slot0.cost_list_data
end

function ActionStoreItem.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cost_list_data then
		return
	end

	slot1.index = slot2

	if not slot0.cost_list_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionStoreItem.createNewCell1(slot0, slot1, slot2)
	slot3 = BackPackItem.new()

	slot3:setDefaultTip()
	slot3:setSwallowTouches(false)
	slot3:setScale(0.8)

	return slot3
end

function ActionStoreItem.numberOfCells1(slot0)
	if not slot0.get_list_data then
		return 0
	end

	return #slot0.get_list_data
end

function ActionStoreItem.updateCellByIndex1(slot0, slot1, slot2)
	if not slot0.get_list_data then
		return
	end

	slot1.index = slot2

	if not slot0.get_list_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionStoreItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_exchange, function ()
		uv0:btnExchange()
	end, true, 1)
end

function ActionStoreItem.btnExchange(slot0)
	if slot0.data and slot0.data.award and slot0.data.award[1] then
		slot1 = 0

		if slot0.data.sub_type == ActonExchangeType.Perday then
			slot1 = slot0.data.sort or 0
		elseif slot0.data.sub_type == ActonExchangeType.AllServer then
			-- Nothing
		elseif slot0.data.sub_type == ActonExchangeType.Activity then
			slot1 = slot0.data.sort or 0
		end

		if slot1 <= 1 then
			CommonAlert.show(string.format(TI18N("是否消耗<div fontColor=#289b14 fontsize= 26>%s</div>兑换物品？"), slot0.data.name_str), TI18N("确定"), function ()
				if uv0.data and uv0.data.charge_id then
					uv1:sender16689(uv0.data.charge_id, 1)
				end
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			MallController:getInstance():openMallBuyWindow(true, {
				bid = slot0.data.award[1][1],
				item_bid = slot0.data.award[1][1],
				shop_type = MallConst.MallType.SteriousShop,
				limit_num = slot1,
				has_buy = 0,
				is_show_limit_label = true,
				name = Config.ItemData.data_get_data(slot0.data.award[1][1]).name,
				aim = slot0.data.charge_id or 0,
				pay_type = 3,
				price = 1,
				quantity = 1
			})
		end
	end
end

function ActionStoreItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:setChangeData(slot1)
end

function ActionStoreItem.setChangeData(slot0, slot1)
	slot0.data = slot1
	slot0.data.charge_id = slot1.id

	slot0.txt_title:setString(slot1.title)
	slot0.txt_task:setString(TI18N(uv0("剩余:%d", slot1.count)))

	slot2 = 1
	slot3 = cc.size(100, 100)
	slot4 = cc.size(270, 100)

	if #slot1.expend > 1 then
		slot2 = 2
		slot3 = cc.size(200, 100)
		slot4 = cc.size(220, 100)
	end

	slot0.cost_good_cons:setPositionX(15)
	slot0.img_equal:setPositionX(uv1[slot2])
	slot0.get_good_cons:setPositionX(uv2[slot2])
	slot0:updateItemList(slot0.cost_item_scrollview, slot1.expend, 1)
	slot0:updateItemList(slot0.get_item_scrollview, slot1.award, 2)
	slot0.btn_exchange:setTouchEnabled(slot1.count ~= 0)

	if slot1.count == 0 then
		slot0.txt_exchange:setString(TI18N("不可兑换"))
		setChildUnEnabled(true, slot0.btn_exchange)
		slot0.txt_exchange:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.txt_exchange:setString(TI18N("兑换"))
		setChildUnEnabled(false, slot0.btn_exchange)
		slot0.txt_exchange:enableOutline(Config.ColorData.data_color4[277], 2)
	end
end

function ActionStoreItem.updateItemList(slot0, slot1, slot2, slot3)
	for slot8, slot9 in pairs(slot2) do
		table.insert({}, {
			bid = slot9[1],
			quantity = slot9[2]
		})
	end

	if slot3 == 1 then
		slot0.cost_list_data = slot4
	elseif slot3 == 2 then
		slot0.get_list_data = slot4
	end

	slot1:reloadData()

	if #slot2 <= 2 then
		slot1:setTouchEnabled(false)
	end
end

function ActionStoreItem.DeleteMe(slot0)
	if slot0.cost_item_scrollview then
		slot0.cost_item_scrollview:DeleteMe()

		slot0.cost_item_scrollview = nil
	end

	if slot0.get_item_scrollview then
		slot0.get_item_scrollview:DeleteMe()

		slot0.get_item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
