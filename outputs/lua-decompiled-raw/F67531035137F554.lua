ActionSmallAmountGiftPanel = class("ActionSmallAmountGiftPanel", function ()
	return ccui.Widget:create()
end)
slot0 = Config.FunctionData.data_three_gear_gift_const
slot1 = ActionController:getInstance()
slot2 = string.format
slot3 = table.insert

function ActionSmallAmountGiftPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2

	slot0:configUI()
	slot0:register_event()
end

function ActionSmallAmountGiftPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_small_amount_gift_panel"))

	slot0.root_wnd:setPosition(-40, -67)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot1 = slot0.main_container:getChildByName("time_title")

	slot1:setString(TI18N("剩余时间:"))

	slot0.time_val = slot0.main_container:getChildByName("time_val")
	slot2 = slot0:colorChangeData(uv0[slot0.holiday_bid].time_color)

	slot1:setTextColor(slot2)
	slot1:disableEffect(cc.LabelEffect.OUTLINE)
	slot0.time_val:setTextColor(slot2)
	slot0.time_val:disableEffect(cc.LabelEffect.OUTLINE)

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot3 = slot0.main_container:getChildByName("title_img")
	slot4 = "txt_cn_action_small_amount_gift_bg"

	if uv1:getActionSubTabVo(slot0.holiday_bid) and slot5.aim_title ~= nil and slot5.aim_title ~= "" then
		slot4 = slot5.aim_title
	end

	slot0.item_load = loadSpriteTextureFromCDN(slot3, PathTool.getPlistImgForDownLoad("bigbg/action", slot4), ResourcesType.single, slot0.item_load)

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 236,
			item_height = 460,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.item_scrollview:setClickEnabled(false)
	end

	uv1:cs16603(slot0.holiday_bid)
end

function ActionSmallAmountGiftPanel.colorChangeData(slot0, slot1)
	slot2 = "ff"
	slot3 = "ff"
	slot4 = "ff"
	slot5 = "ff"
	slot3 = string.sub(slot1, 3, 4)
	slot4 = string.sub(slot1, 5, 6)
	slot5 = string.sub(slot1, 7, 8)

	if string.sub(slot1, 1, 2) == "" then
		slot2 = "ff"
	end

	if slot3 == "" then
		slot3 = "ff"
	end

	if slot4 == "" then
		slot4 = "ff"
	end

	if slot5 == "" then
		slot5 = "ff"
	end

	return cc.c4b(tonumber("0x" .. slot2), tonumber("0x" .. slot3), tonumber("0x" .. slot4), tonumber("0x" .. slot5))
end

function ActionSmallAmountGiftPanel.createNewCell(slot0, slot1, slot2)
	slot3 = ActionSmallAmountGiftItem.new(slot0.holiday_bid, slot1, slot2)

	slot3:setActionRankCommonType(slot0.holiday_bid, slot0.type)

	return slot3
end

function ActionSmallAmountGiftPanel.numberOfCells(slot0)
	if not slot0.limit_list then
		return 0
	end

	return #slot0.limit_list
end

function ActionSmallAmountGiftPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.limit_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
end

function ActionSmallAmountGiftPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	doStopAllActions(slot0.time_val)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_val)
				uv1.time_val:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionSmallAmountGiftPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeForFunction(slot1))
	else
		slot0.time_val:setString("00:00:00")
	end
end

function ActionSmallAmountGiftPanel.register_event(slot0)
	if not slot0.limin_yuan_zhen_event then
		slot0.limin_yuan_zhen_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
			end
		end)
	end
end

function ActionSmallAmountGiftPanel.setData(slot0, slot1)
	if (slot1.remain_sec or 0) < 0 then
		slot2 = 0
	end

	slot0:setLessTime(slot2)

	slot0.limit_list = slot1.aim_list or {}

	slot0.item_scrollview:reloadData()
end

function ActionSmallAmountGiftPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionSmallAmountGiftPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	if slot0.limin_yuan_zhen_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_yuan_zhen_event)

		slot0.limin_yuan_zhen_event = nil
	end

	doStopAllActions(slot0.time_val)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil
end

ActionSmallAmountGiftItem = class("ActionSmallAmountGiftItem", function ()
	return ccui.Widget:create()
end)

function ActionSmallAmountGiftItem.ctor(slot0, slot1, slot2, slot3)
	slot0.action_id = slot1
	slot0.item_list = {}

	slot0:configUI(slot2, slot3)
	slot0:register_event()
end

function ActionSmallAmountGiftItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_small_amount_gift_item"))

	slot0:addChild(slot0.root_wnd)
	slot0.root_wnd:setPosition((slot1 - 214) * 0.5, 0)

	slot4 = slot0.root_wnd:getChildByName("main_container")
	slot0.title = slot4:getChildByName("title")

	slot0.title:setTextColor(slot0:colorChangeData(uv0[slot0.action_id].gift_name_color))

	slot0.price_label = slot4:getChildByName("price_label")

	slot0.price_label:setTextColor(slot0:colorChangeData(uv0[slot0.action_id].origin_buy_color))

	slot0.limit_label = slot4:getChildByName("limit_label")

	slot0.limit_label:setTextColor(slot0:colorChangeData(uv0[slot0.action_id].limit_buy_color))

	slot0.common_30016 = slot4:getChildByName("common_30016")

	if slot0.common_30016 ~= nil then
		loadSpriteTexture(slot0.common_30016, PathTool.getResFrame("common", uv0[slot0.action_id].over_value_c_res), LOADTEXT_TYPE_PLIST)
	end

	slot0.tips = slot4:getChildByName("tips")

	slot0.tips:setTextColor(slot0:colorChangeData(uv0[slot0.action_id].over_value_color))
	slot0.tips:enableOutline(slot0:colorChangeData(uv0[slot0.action_id].over_value_outline), 2)
	slot0.tips:setString(TI18N("超值"))

	slot0.goods_con = slot4:getChildByName("goods_con")
	slot0.goods_con_size = slot0.goods_con:getContentSize()
	slot0.item_scrollview = createScrollView(slot0.goods_con_size.width, slot0.goods_con_size.height, 0, 0, slot0.goods_con)
	slot0.comfirm_btn = slot4:getChildByName("comfirm_btn")
	slot0.comfirm_btn_lable = slot0.comfirm_btn:getChildByName("label")
end

function ActionSmallAmountGiftItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)
end

function ActionSmallAmountGiftItem.colorChangeData(slot0, slot1)
	slot2 = "ff"
	slot3 = "ff"
	slot4 = "ff"
	slot5 = "ff"
	slot3 = string.sub(slot1, 3, 4)
	slot4 = string.sub(slot1, 5, 6)
	slot5 = string.sub(slot1, 7, 8)

	if string.sub(slot1, 1, 2) == "" then
		slot2 = "ff"
	end

	if slot3 == "" then
		slot3 = "ff"
	end

	if slot4 == "" then
		slot4 = "ff"
	end

	if slot5 == "" then
		slot5 = "ff"
	end

	return cc.c4b(tonumber("0x" .. slot2), tonumber("0x" .. slot3), tonumber("0x" .. slot4), tonumber("0x" .. slot5))
end

function ActionSmallAmountGiftItem.onComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.buy_id and slot0.buy_id ~= 0 and Config.ChargeData.data_charge_data[slot0.buy_id] then
		sdkOnPay(slot1.val, nil, slot1.id, slot1.name, slot1.name)
	end
end

function ActionSmallAmountGiftItem.setActionRankCommonType(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
end

function ActionSmallAmountGiftItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.title:setString(slot1.aim_str)

	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = false
	slot0.buy_id = 0

	if slot1.aim_args then
		for slot10, slot11 in ipairs(slot1.aim_args) do
			if slot11.aim_args_key == 26 then
				slot2 = slot11.aim_args_val
			elseif slot11.aim_args_key == 27 then
				slot3 = slot11.aim_args_val
			elseif slot11.aim_args_key == 4 then
				slot5 = slot11.aim_args_val
			elseif slot11.aim_args_key == 5 then
				slot4 = slot11.aim_args_val
			elseif slot11.aim_args_key == 30 then
				slot6 = slot11.aim_args_val == 1
			elseif slot11.aim_args_key == 33 then
				slot0.buy_id = slot11.aim_args_val
			end
		end
	end

	slot0.price_label:setString(TI18N("原价:") .. slot2)
	slot0.comfirm_btn_lable:setString("¥ " .. slot3)
	slot0.limit_label:setString(uv0(TI18N("限购: %s/%s"), slot4, slot5))

	if slot5 <= slot4 then
		slot0.comfirm_btn_lable:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.comfirm_btn)
		slot0.comfirm_btn_lable:enableOutline(Config.ColorData.data_color4[264], 2)
		slot0.comfirm_btn:setTouchEnabled(true)
	end

	if slot6 then
		slot0.common_30016:setVisible(true)
		slot0.tips:setVisible(true)
	else
		slot0.common_30016:setVisible(false)
		slot0.tips:setVisible(false)
	end

	if slot1.item_list then
		doStopAllActions(slot0.goods_con)

		slot7 = #slot1.item_list
		slot8, slot9 = slot0:getPosList(slot7)

		slot0.item_scrollview:setInnerContainerSize(cc.size(slot0.goods_con_size.width, math.max(slot0.goods_con_size.height, slot9)))

		if slot7 >= 5 then
			slot0.item_scrollview:setTouchEnabled(true)
		else
			slot0.item_scrollview:setTouchEnabled(false)
		end

		for slot14, slot15 in ipairs(slot1.item_list) do
			if slot8[slot14] then
				delayRun(slot0.goods_con, slot14 / display.DEFAULT_FPS, function ()
					if not uv0.item_list[uv1] then
						slot0 = BackPackItem.new(true, true)

						slot0:setAnchorPoint(0.5, 0.5)
						slot0:setScale(0.7)
						uv0.item_scrollview:addChild(slot0)

						uv0.item_list[uv1] = slot0
					else
						slot0:setVisible(true)
					end

					slot0:setPosition(uv2[uv1])
					slot0:setBaseData(uv3.bid, uv3.num, true)
					slot0:setDefaultTip(true)
				end)
			end
		end
	end
end

function ActionSmallAmountGiftItem.getPosList(slot0, slot1)
	if not slot0.goods_con_size then
		return
	end

	slot3 = slot0.goods_con_size.height

	if slot1 == 1 then
		uv0({}, cc.p(slot0.goods_con_size.width * 0.5, slot0.goods_con_size.height * 0.5))
	elseif slot1 == 2 then
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.25, slot0.goods_con_size.height * 0.5))
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.75, slot0.goods_con_size.height * 0.5))
	elseif slot1 == 3 then
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.5, slot0.goods_con_size.height * 0.75))
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.25, slot0.goods_con_size.height * 0.25))
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.75, slot0.goods_con_size.height * 0.25))
	elseif slot1 == 4 then
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.25, slot0.goods_con_size.height * 0.75))
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.75, slot0.goods_con_size.height * 0.75))
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.25, slot0.goods_con_size.height * 0.25))
		uv0(slot2, cc.p(slot0.goods_con_size.width * 0.75, slot0.goods_con_size.height * 0.25))
	else
		slot4 = slot0.goods_con_size.width * 0.5

		for slot11 = 1, slot1 do
			uv0(slot2, cc.p(slot4 * ((slot11 - 1) % 2) + slot4 * 0.5, 90 * math.ceil(slot1 / 2) - (slot6(slot11 / 2) - 1) * slot5 - slot5 * 0.5))
		end
	end

	return slot2, slot3
end

function ActionSmallAmountGiftItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end

	doStopAllActions(slot0.goods_con)

	slot0.item_list = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
