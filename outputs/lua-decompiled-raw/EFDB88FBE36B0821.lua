TreasureJoinWindow = TreasureJoinWindow or BaseClass(BaseView)
slot1 = FestivalActionController:getInstance():getModel()
slot2 = Config.HolidaySnatchData.data_const
slot3 = Config.HolidaySnatchData.data_join_goods_list
slot4 = string.format
slot5 = {
	cc.c4b(149, 83, 34, 255),
	cc.c4b(255, 246, 228, 255)
}
slot6 = {
	6,
	30,
	128
}

function TreasureJoinWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "festivalaction/treasure_join_window"
	slot0.join_number = 0
	slot0.join_max_number = 1
	slot0.remain_count = 1
end

function TreasureJoinWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Image_2"):getChildByName("Text_1"):setString(TI18N("参与夺宝"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.bar = slot1:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)
	slot0.bar:setPercent(0)
	slot1:getChildByName("join_num_text"):setString(TI18N("满足参与人次时，即抽取1人获得奖品"))
	slot1:getChildByName("Text_3"):setString(TI18N("总需："))

	slot0.total_text = slot1:getChildByName("total_text")

	slot0.total_text:setString("")
	slot1:getChildByName("Text_3_0"):setString(TI18N("剩余："))

	slot0.remain_text = slot1:getChildByName("remain_text")

	slot0.remain_text:setString("")

	slot0.btn_join = slot1:getChildByName("btn_join")

	slot0.btn_join:getChildByName("Text_9"):setString(TI18N("立即参与"))
	slot1:getChildByName("time_0"):setString(TI18N("活动剩余："))

	slot0.time = slot1:getChildByName("time")

	slot0.time:setString("")
	slot1:getChildByName("Text_10"):setString(TI18N("消耗："))

	slot2 = slot1:getChildByName("join_bg")

	slot2:getChildByName("Text_11"):setString(TI18N("参与人次"))

	slot0.btn_minus = slot2:getChildByName("btn_minus")
	slot0.btn_add = slot2:getChildByName("btn_add")
	slot0.btn_10 = slot2:getChildByName("btn_10")

	slot0.btn_10:getChildByName("Text_12"):setString(uv0[1])

	slot0.btn_50 = slot2:getChildByName("btn_50")

	slot0.btn_50:getChildByName("Text_12"):setString(uv0[2])

	slot0.btn_100 = slot2:getChildByName("btn_100")

	slot0.btn_100:getChildByName("Text_12"):setString(uv0[3])

	slot0.join_num = slot2:getChildByName("join_num")

	slot0.join_num:setString("")

	slot0.text_Field = slot2:getChildByName("text_Field")

	slot0.text_Field:setPlaceHolderColor(FestivalActionConst.ColorConst[2])
	slot0.text_Field:setTextColor(FestivalActionConst.ColorConst[2])
	slot0.text_Field:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
	slot0.text_Field:setTextVerticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
	slot0.text_Field:addEventListener(function (slot0, slot1)
		if slot1 == ccui.TextFiledEventType.attach_with_ime then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.detach_with_ime then
			uv0:inputConsumeNumber()
		elseif slot1 == ccui.TextFiledEventType.insert_text then
			uv0:inputConsumeNumber()
		elseif slot1 == ccui.TextFiledEventType.delete_backward then
			if uv0.text_Field:getString() == "" then
				message(TI18N("亲，参与人次不能为空哦~~~"))

				return
			end

			uv0:inputConsumeNumber()
		end
	end)

	slot0.goods_item = BackPackItem.new(nil, true, nil, 1, false, true)

	slot1:addChild(slot0.goods_item)
	slot0.goods_item:setPosition(cc.p(105, 412))

	slot0.join_term = createRichLabel(22, uv1[1], cc.p(0.5, 0.5), cc.p(236, 99), nil, , )

	slot2:addChild(slot0.join_term)

	slot0.consume_term = createRichLabel(22, uv1[2], cc.p(0, 0.5), cc.p(235, 155), nil, , )

	slot1:addChild(slot0.consume_term)
end

function TreasureJoinWindow.inputConsumeNumber(slot0)
	slot1 = slot0.text_Field:getString()

	if type(tonumber(slot0.text_Field:getString())) == "number" then
		if slot0.join_max_number <= slot2 then
			message(TI18N("已到达个人购买上限~~~"))

			slot2 = slot0.join_max_number
		end

		if slot0.remain_count <= slot2 then
			message(TI18N("已到达个人购买上限~~~"))

			slot2 = slot0.remain_count
		end

		slot0.join_number = slot2

		slot0:consumeCalculat()
	else
		message(TI18N("亲，参与人次只能输入数字哦~~~"))
	end
end

function TreasureJoinWindow.openRootWnd(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	slot0.join_item_data = slot2
	slot0.my_join_count = 0

	if slot2.ext and (keyfind("key", 1, slot2.ext) or nil) then
		slot0.my_join_count = slot3.val or 0
	end

	if uv0[slot2.id or 0] then
		slot0.join_max_number = uv0[slot3].limit_role_max - slot0.my_join_count

		if slot0.join_max_number <= 0 then
			slot0.join_max_number = 0
		end
	end

	if slot1.award and slot1.award[1] then
		slot0.goods_item:setBaseData(slot1.award[1][1], slot1.award[1][2])
	end

	if slot1.expend and slot1.expend[1] then
		slot0.consume_icon_num = slot1.expend[1][1] or 0
		slot0.consume_num = slot1.expend[1][2] or 0

		if Config.ItemData.data_get_data(slot0.consume_icon_num) then
			slot0.join_term:setString(uv1(TI18N("%d <img src=%s visible=true scale=0.30 />/人次"), slot0.consume_num, PathTool.getItemRes(slot4.icon)))
		end
	end

	if Config.HolidaySnatchData.data_const and slot4.item_ticket and slot4.item_ticket.val then
		slot0.item_ticket = slot4.item_ticket.val
	end

	slot0.my_join_totle = BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.item_ticket)
	slot0.join_max_number = math.min(slot0.join_max_number, slot0.my_join_totle)

	slot0:consumeCalculat(slot0.join_number)
	slot0:setData(slot2)
	uv2:CountDownTime(slot0.time, uv2:getCountDownTime())
end

function TreasureJoinWindow.setData(slot0, slot1)
	slot2 = slot1.id or 0

	if uv0 and uv0[slot2] then
		slot3 = uv0[slot2].limit_max or 0

		slot0.total_text:setString(slot3)

		if slot3 - (slot1.num or 0) <= 0 then
			slot5 = 0
		end

		slot0.remain_count = slot5

		slot0.remain_text:setString(slot5)
		slot0.bar:setPercent(slot4 / slot3 * 100)
	end
end

function TreasureJoinWindow.register_event(slot0)
	slot0:addGlobalEvent(FestivalActionEvent.TreasureMessage, function (slot0)
		if uv0.join_item_data and uv0.join_item_data.pos then
			uv0:buyReturnMessage(slot0)
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openTreasureJoinView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openTreasureJoinView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_join, function ()
		if uv0.join_number == 0 then
			message("亲，参与次数不能为0哦~~~")

			return
		end

		if uv0.join_item_data and uv0.item_ticket then
			if uv0.item_ticket < uv0.join_number * uv0.consume_num then
				message(TI18N("亲，门票不够哦~~~"))
			elseif type(tonumber(uv0.text_Field:getString())) == "number" then
				uv1:sender25701(uv0.join_item_data.pos or 0, slot0)
			else
				message(TI18N("亲，参与人次只能输入数字哦~~~"))
			end
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_minus, function ()
		uv0:minusJoinNumber()
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0:addJoinNumber()
	end, true, 1)
	registerButtonEventListener(slot0.btn_10, function ()
		uv0:addJoinNumberType(1)
	end, true, 1)
	registerButtonEventListener(slot0.btn_50, function ()
		uv0:addJoinNumberType(2)
	end, true, 1)
	registerButtonEventListener(slot0.btn_100, function ()
		uv0:addJoinNumberType(3)
	end, true, 1)
end

function TreasureJoinWindow.buyReturnMessage(slot0, slot1)
	slot3 = nil

	for slot7, slot8 in pairs(slot1.holiday_snatch_info) do
		if slot8.pos == slot0.join_item_data.pos then
			slot3 = slot8

			break
		end
	end

	if slot3 and uv0[slot3.id] then
		slot0:setData(slot3)
	end
end

function TreasureJoinWindow.addJoinNumber(slot0)
	if slot0.join_max_number <= slot0.join_number or slot0.remain_count <= slot0.join_number then
		message(TI18N("已到达参与最大值"))

		return
	end

	slot0.join_number = slot0.join_number + 1

	if slot0.join_max_number <= slot0.join_number then
		slot0.join_number = slot0.join_max_number
	end

	slot0:consumeCalculat(slot0.join_number)
end

function TreasureJoinWindow.addJoinNumberType(slot0, slot1)
	if slot0.join_max_number <= uv0[slot1] or slot0.remain_count <= uv0[slot1] then
		if slot0.join_max_number <= uv0[slot1] then
			slot0.join_number = slot0.join_max_number
		elseif slot0.remain_count <= uv0[slot1] then
			slot0.join_number = slot0.remain_count
		end

		slot0:consumeCalculat(slot0.join_number)
		message(TI18N("参与次数不能超过最大值哦~~~"))

		return
	end

	slot0.join_number = uv0[slot1]

	slot0:consumeCalculat(slot0.join_number)
end

function TreasureJoinWindow.minusJoinNumber(slot0)
	if slot0.join_number <= 1 then
		message(TI18N("参与次数不能少于1哦~~~"))

		return
	end

	slot0.join_number = slot0.join_number - 1

	if slot0.join_number <= 1 then
		slot0.join_number = 1
	end

	slot0:consumeCalculat(slot0.join_number)
end

function TreasureJoinWindow.consumeCalculat(slot0)
	slot0.text_Field:setString(slot0.join_number)
	slot0:showConsume()
end

function TreasureJoinWindow.showConsume(slot0)
	if slot0.consume_num ~= 0 and slot0.consume_icon_num ~= 0 and Config.ItemData.data_get_data(slot0.consume_icon_num) then
		slot0.consume_term:setString(uv0(TI18N("<img src=%s visible=true scale=0.30 /> %s/%s"), PathTool.getItemRes(slot1.icon), slot0.my_join_totle, slot0.join_number * slot0.consume_num))
	end
end

function TreasureJoinWindow.close_callback(slot0)
	doStopAllActions(slot0.time)

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	uv0:openTreasureJoinView(false)
end
