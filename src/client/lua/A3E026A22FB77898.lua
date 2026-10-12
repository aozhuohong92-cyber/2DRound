slot0 = {
	cc.c4b(251, 239, 185, 255)
}
slot1 = table.insert
slot2 = Config.HolidayGrouponData.data_holiday_reward
ActionLimitGroupbuyPanel = class("ActionLimitGroupbuyPanel", function ()
	return ccui.Widget:create()
end)
slot3 = ActionController:getInstance()

function ActionLimitGroupbuyPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.old_price = {}
	slot0.new_price = {}
	slot0.diamond_back = 0
	slot0.remain_buy_num = {}
	slot0.discount_bar = {}
	slot0.get_status = 1
	slot0.holiday_item_bid = 0
	slot0.cur_index = 1

	slot0:loadResources()
end

function ActionLimitGroupbuyPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionlimitgroup", "actionlimitgroup"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_acc_limit"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function ActionLimitGroupbuyPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionLimitGroupbuyPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_groupbuy_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -87)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", "action_acc_limit"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot1:getChildByName("Text_1"):setString(TI18N("团购人数越多，打折的力度越大，\n差价均返还，快来抢购吧！"))

	slot4 = slot1:getChildByName("back_bg")

	slot4:getChildByName("Text_2"):setString(TI18N("当前可返现："))

	slot0.back_sprite = slot4:getChildByName("back_sprite")
	slot0.back_num = slot4:getChildByName("back_num")

	slot0:setPrice(3, slot0.back_sprite, slot0.back_num, "")

	slot0.bar = slot1:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)
	slot0.bar:setPercent(0)

	slot0.start_layer = slot1:getChildByName("start_layer")

	slot0.start_layer:getChildByName("Text_3"):setString(TI18N("营业中"))
	slot0.start_layer:setVisible(true)

	slot0.time_text = slot0.start_layer:getChildByName("time_text")

	slot0.time_text:setString("00:00:00")

	slot0.pause_layer = slot1:getChildByName("pause_layer")

	slot0.pause_layer:getChildByName("Text_5"):setString(TI18N("暂停营业"))
	slot0.pause_layer:setVisible(false)

	slot0.get_layer = slot1:getChildByName("get_layer")

	slot0.get_layer:setVisible(false)

	slot0.btn_get = slot0.get_layer:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_20")

	slot0.btn_get_label:setString(TI18N("领取"))
	slot0.get_layer:getChildByName("Text_21"):setString(TI18N("当前可返现："))

	slot0.back_get_sprite = slot0.get_layer:getChildByName("back_get_sprite")
	slot0.back_get_text = slot0.get_layer:getChildByName("back_get_text")

	slot0:setPrice(3, slot0.back_get_sprite, slot0.back_get_text, "")

	slot0.buy_layer = slot1:getChildByName("buy_layer")

	slot0.buy_layer:setVisible(true)

	slot0.btn_buy = slot0.buy_layer:getChildByName("btn_buy")

	slot0.btn_buy:getChildByName("Text_14")

	slot0.btn_buy_label = slot0.btn_buy:getChildByName("Text_14")

	slot0.btn_buy_label:setString(TI18N("购买"))
	slot0.buy_layer:getChildByName("Text_15"):setString(TI18N("原价："))

	slot0.old_sprite = slot0.buy_layer:getChildByName("old_sprite")
	slot0.old_text = slot0.buy_layer:getChildByName("old_text")

	slot0:setPrice(3, slot0.old_sprite, slot0.old_text, "")
	slot0.buy_layer:getChildByName("Text_15_0"):setString(TI18N("现价："))

	slot0.new_sprite = slot0.buy_layer:getChildByName("new_sprite")
	slot0.new_text = slot0.buy_layer:getChildByName("new_text")

	slot0:setPrice(3, slot0.new_sprite, slot0.new_text, "")

	slot0.discount_line = slot0.buy_layer:getChildByName("discount_line")
	slot0.discount_line_size = slot0.discount_line:getContentSize()
	slot0.get_item = BackPackItem.new(nil, true)

	slot0.buy_layer:addChild(slot0.get_item)

	slot10 = 129

	slot0.get_item:setPosition(cc.p(slot10, 144))
	slot0.get_item:setDefaultTip()

	slot0.discount_list = {}

	for slot10 = 1, 5 do
		slot11 = {
			num = slot12:getChildByName("num")
		}
		slot12 = slot1:getChildByName("discount_" .. slot10)

		slot12:setPositionX(slot5:getPositionX() + slot1:getChildByName("Image_4"):getContentSize().width / 4 * (slot10 - 1))
		slot11.num:setString("")

		slot11.discount = slot12:getChildByName("discount")

		slot11.discount:setString("")

		slot0.discount_list[slot10] = slot11
	end

	slot0.limit_group_buy = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(360, 290), nil, nil, nil)

	slot1:addChild(slot0.limit_group_buy)

	slot0.day_buy_totle = createRichLabel(24, uv0[1], cc.p(0, 0.5), cc.p(210, 101), nil, nil, nil)

	slot0.buy_layer:addChild(slot0.day_buy_totle)

	slot7 = slot1:getChildByName("good_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot7, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot7:getContentSize(), {
		start_y = 19,
		start_x = 0,
		space_x = 26,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:setBounceEnabled(false)
	uv1:cs16603(slot0.holiday_bid)
end

function ActionLimitGroupbuyPanel.showDiscountReward(slot0, slot1)
	slot2 = {}

	if uv0[slot1] then
		for slot6, slot7 in ipairs(uv0[slot1]) do
			uv1(slot2, {
				id = slot7.reward[1][1],
				quantity = slot7.reward[1][2]
			})
		end
	end

	if next(slot2) == nil then
		return
	end

	slot0.cur_index = slot0.cur_index or 1

	if slot2[slot0.cur_index] then
		slot0.get_item:setBaseData(slot2[slot0.cur_index].id, slot2[slot0.cur_index].quantity)
	end

	slot0:tableView(slot0.cur_index)
	slot0.item_scrollview:setData(slot2, function (slot0)
		if uv0.cur_index == slot0:getData()._index then
			return
		end

		uv0.cur_index = slot1

		uv0.get_item:setBaseData(slot0:getData().id, slot0:getData().quantity)
		uv0:tableView(uv0.cur_index)
	end)
end

function ActionLimitGroupbuyPanel.tableView(slot0, slot1)
	slot1 = slot1 or 1

	slot0.old_text:setString(slot0.old_price[slot1] or 0)
	slot0.discount_line:setContentSize(cc.size(slot0.discount_line_size.width + slot0.old_text:getContentSize().width, slot0.discount_line_size.height))
	slot0.new_text:setString(slot0.new_price[slot1] or 0)
	slot0.back_get_text:setString(slot0.diamond_back or 0)
	slot0.back_num:setString(slot0.diamond_back or 0)
	slot0:setBuyLimitCount(slot1)
	slot0.limit_group_buy:setString(string.format(TI18N("已团购<div fontColor=#66ff00> %d </div>次"), slot0.discount_bar[slot1]))
	slot0.bar:setPercent(slot0:sectionCalculation(slot0.discount_bar[slot1], slot1))

	for slot8 = 1, 5 do
		if uv0[slot0.holiday_item_bid] then
			slot0.discount_list[slot8].discount:setString(uv0[slot0.holiday_item_bid][slot1].discount[slot8][2] * 0.001 * 10 .. TI18N("折"))
			slot0.discount_list[slot8].num:setString(uv0[slot0.holiday_item_bid][slot1].discount[slot8][1])
		end
	end
end

function ActionLimitGroupbuyPanel.setBuyLimitCount(slot0, slot1)
	if uv0[slot0.holiday_item_bid] and uv0[slot0.holiday_item_bid][slot1] then
		slot0.remain_buy_num[slot1] = slot0.remain_buy_num[slot1] or 0

		if slot0.remain_buy_num[slot1] <= 0 then
			slot0.remain_buy_num[slot1] = 0
		end

		slot3 = uv0[slot0.holiday_item_bid][slot1].all_limit or 0
		slot4 = ""

		slot0.day_buy_totle:setString(((uv0[slot0.holiday_item_bid][slot1].limit or 0) ~= 0 or string.format(TI18N("活动期间可购买<div fontColor=#66ff00> %d </div>件"), slot0.remain_buy_num[slot1])) and string.format(TI18N("今日可购买<div fontColor=#66ff00> %d </div>件"), slot0.remain_buy_num[slot1]))

		if slot0.remain_buy_num[slot1] == 0 then
			setChildUnEnabled(true, slot0.btn_buy)
			slot0.btn_buy_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.btn_buy_label:setString(TI18N("已购买"))
			slot0.btn_buy:setTouchEnabled(false)
		else
			setChildUnEnabled(false, slot0.btn_buy)
			slot0.btn_buy_label:enableOutline(Config.ColorData.data_color4[264], 2)
			slot0.btn_buy_label:setString(TI18N("购买"))
			slot0.btn_buy:setTouchEnabled(true)
		end
	end
end

function ActionLimitGroupbuyPanel.setPrice(slot0, slot1, slot2, slot3, slot4)
	if not Config.ItemData.data_get_data(slot1) then
		return
	end

	loadSpriteTexture(slot2, PathTool.getItemRes(slot5.icon), LOADTEXT_TYPE)

	if slot3 then
		slot3:setString(slot4)
	end
end

function ActionLimitGroupbuyPanel.sectionCalculation(slot0, slot1, slot2)
	if not uv0[slot0.holiday_item_bid] then
		return 0
	end

	slot3 = 25
	slot4 = 1

	if uv0[slot0.holiday_item_bid][slot2] and uv0[slot0.holiday_item_bid][slot2].discount then
		if slot1 <= uv0[slot0.holiday_item_bid][slot2].discount[2][1] then
			return slot1 / slot5[2][1] * slot3
		elseif slot5[2][1] < slot1 and slot1 <= slot5[3][1] then
			slot4 = 3
		elseif slot5[3][1] < slot1 and slot1 <= slot5[4][1] then
			slot4 = 4
		elseif slot5[4][1] < slot1 and slot1 <= slot5[5][1] then
			slot4 = 5
		else
			return 100
		end

		return math.floor(slot3 * (slot4 - 2) + (slot1 - slot5[slot4 - 1][1]) / (slot5[slot4][1] - slot5[slot4 - 1][1]) * slot3)
	else
		return 0
	end
end

function ActionLimitGroupbuyPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_text) then
		return
	end

	doStopAllActions(slot0.time_text)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_text:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_text)
				uv1.start_layer:setVisible(false)
				uv1.pause_layer:setVisible(true)
				uv1.buy_layer:setVisible(false)
				uv1.get_layer:setVisible(true)
				uv1:refreshGetButStatus()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
		slot0.start_layer:setVisible(false)
		slot0.pause_layer:setVisible(true)
		slot0.buy_layer:setVisible(false)
		slot0.get_layer:setVisible(true)
		slot0:refreshGetButStatus()
	end
end

function ActionLimitGroupbuyPanel.refreshGetButStatus(slot0)
	if slot0.get_status == 1 then
		setChildUnEnabled(true, slot0.btn_get)
		slot0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_get_label:setString(TI18N("已领取"))
		slot0.btn_get:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.btn_get)
		slot0.btn_get_label:enableOutline(Config.ColorData.data_color4[263], 2)
		slot0.btn_get_label:setString(TI18N("领取"))
		slot0.btn_get:setTouchEnabled(true)
	end
end

function ActionLimitGroupbuyPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_text:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot1))
	else
		slot0.time_text:setString("00:00:00")
	end
end

function ActionLimitGroupbuyPanel.register_event(slot0)
	if not slot0.update_group_event then
		slot0.update_group_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if uv0.holiday_bid == slot0.bid then
				uv0:setLimitGroupbuyData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.holiday_bid then
			uv1:cs16604(uv0.holiday_bid, 0, 0)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_buy, function ()
		CommonAlert.show(string.format(TI18N("是否消耗 <img src='%s' scale=0.3 />%s 购买商品?"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), uv0.new_price[uv0.cur_index]), TI18N("确定"), function ()
			if uv0.holiday_bid then
				uv1:cs16604(uv0.holiday_bid, uv0.cur_index, 0)
			end
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end, true, 1)
end

function ActionLimitGroupbuyPanel.setLimitGroupbuyData(slot0, slot1)
	if (slot1.remain_sec or 0) - 86400 <= 0 then
		slot2 = 0
	end

	slot0:setLessTime(slot2)

	slot0.diamond_back = slot1.finish or 0

	table.sort(slot1.aim_list, function (slot0, slot1)
		return slot0.aim < slot1.aim
	end)

	if slot1.aim_list then
		for slot6, slot7 in ipairs(slot1.aim_list) do
			slot0:getBuyRealData(slot6, slot7.aim_args)
		end
	end

	if keyfind("args_key", 3, slot1.args) or nil then
		slot0.get_status = slot3.args_val or 0
	end

	if keyfind("args_key", 4, slot1.args) or nil then
		slot0.holiday_item_bid = slot4.args_val or 0
	end

	slot0:showDiscountReward(slot0.holiday_item_bid)
	slot0:refreshGetButStatus()
end

function ActionLimitGroupbuyPanel.getBuyRealData(slot0, slot1, slot2)
	slot0.old_price[slot1] = 0

	if keyfind("aim_args_key", 26, slot2) or nil then
		slot0.old_price[slot1] = slot3.aim_args_val or 0
	end

	slot0.new_price[slot1] = 0

	if keyfind("aim_args_key", 27, slot2) or nil then
		slot0.new_price[slot1] = slot4.aim_args_val or 0
	end

	slot0.remain_buy_num[slot1] = 0
	slot5, slot6 = nil

	if keyfind("aim_args_key", 2, slot2) or nil then
		slot5 = slot7.aim_args_val or 0
	end

	if keyfind("aim_args_key", 6, slot2) or nil then
		slot6 = slot8.aim_args_val or 0
	end

	if slot5 and slot6 then
		slot0.remain_buy_num[slot1] = slot5 - slot6
	end

	slot0.discount_bar[slot1] = 0

	if keyfind("aim_args_key", 32, slot2) or nil then
		slot0.discount_bar[slot1] = slot9.aim_args_val or 0
	end
end

function ActionLimitGroupbuyPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionLimitGroupbuyPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	doStopAllActions(slot0.time_text)

	if slot0.get_item then
		slot0.get_item:DeleteMe()

		slot0.get_item = nil
	end

	if slot0.update_group_event then
		GlobalEvent:getInstance():UnBind(slot0.update_group_event)

		slot0.update_group_event = nil
	end
end
