ActionDirectBuygiftWindow = ActionDirectBuygiftWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()

function ActionDirectBuygiftWindow.__init(slot0)
	slot0.item_list = {}
	slot0.is_full_screen = true
	slot0.buyGiftYuan = 1
	slot0.productID = nil
	slot0.productStr = nil
	slot0.hoild_id = nil
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_direct_buygift_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_57"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_21"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfaretab", "welfaretab"),
			type = ResourcesType.plist
		}
	}
end

function ActionDirectBuygiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container)

	slot1 = slot0.main_container:getChildByName("title")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg/action", "action_direct_buygift", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.main_container:getChildByName("Text_4"):setString(TI18N([[
空
前
优
惠]]))
	slot0.main_container:getChildByName("Text_2_0"):setString(TI18N("原价:"))
	slot0.main_container:getChildByName("Text_2_0_0"):setString(TI18N("现价:"))

	slot0.oldPrice = slot0.main_container:getChildByName("oldPrice")
	slot0.newPrice = slot0.main_container:getChildByName("newPrice")

	slot0.main_container:getChildByName("Text_2"):setString(TI18N("优惠结束倒计时:"))

	slot0.textTime = slot0.main_container:getChildByName("textTime")
	slot0.cancle = slot0.main_container:getChildByName("cancle")

	slot0.cancle:getChildByName("Text_10"):setString(TI18N("稍后考虑"))

	slot0.goto_btn = slot0.main_container:getChildByName("goto")
	slot0.goto_btn.label = slot0.goto_btn:getChildByName("Text_10_0"):setString(TI18N("立即购买"))
	slot0.goods = slot0.main_container:getChildByName("goods")

	slot0.goods:setScrollBarEnabled(false)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
end

function ActionDirectBuygiftWindow.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.hoild_id = slot1

		uv0:cs16603(slot1)
	end
end

function ActionDirectBuygiftWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.textTime) then
		return
	end

	slot0.textTime:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.textTime:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.textTime:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionDirectBuygiftWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.textTime:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot1))
	else
		slot0.textTime:setString("")
	end
end

function ActionDirectBuygiftWindow.register_event(slot0)
	if not slot0.update_directgift_event then
		slot0.update_directgift_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			uv0._data = slot0

			if slot0.bid == uv0.hoild_id then
				if slot0.aim_list == nil or next(slot0.aim_list) == nil then
					ActionController:getInstance():openDirectBuyGiftWin(false)

					return
				end

				uv0:setLessTime(slot0.remain_sec)

				slot1 = slot0.aim_list[1].item_list
				slot5 = cc.size

				uv0.goods:setInnerContainerSize(slot5((BackPackItem.Width * 0.9 + 25) * tableLen(slot1), uv0.goods:getContentSize().height))

				for slot5, slot6 in pairs(slot1) do
					if not uv0.item_list[slot5] then
						slot7 = BackPackItem.new(false, true, false, 0.9, false)

						slot7:setAnchorPoint(0, 0.5)
						uv0.goods:addChild(slot7)

						uv0.item_list[slot5] = slot7
					end

					item = uv0.item_list[slot5]

					if item then
						item:setPosition((slot5 - 1) * (BackPackItem.Width * 0.9 + 25), 70)
						item:setBaseData(slot6.bid, slot6.num)
						item:setDefaultTip()
					end
				end

				slot3 = keyfind("aim_args_key", ActionExtType.ActivityCurrentPrice, slot0.aim_list[1].aim_args) or 0

				uv0.oldPrice:setString("￥" .. (keyfind("aim_args_key", ActionExtType.ActivityOldPrice, slot0.aim_list[1].aim_args) or 0).aim_args_val)
				uv0.newPrice:setString("￥" .. slot3.aim_args_val)

				uv0.buyGiftYuan = slot3.aim_args_val
				uv0.productID = slot0.aim_list[1].aim
				uv0.productStr = slot0.aim_list[1].aim_str

				if slot0.aim_list[1].status == 0 then
					setChildUnEnabled(false, uv0.goto_btn, Config.ColorData.data_color4[1])
					uv0.goto_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
					uv0.goto_btn:setTouchEnabled(true)
				elseif slot0.aim_list[1].status == 1 then
					setChildUnEnabled(true, uv0.goto_btn, Config.ColorData.data_color4[1])
					uv0.goto_btn:setTouchEnabled(false)
					uv0.goto_btn.label:disableEffect(cc.LabelEffect.OUTLINE)
				end
			end
		end)
	end

	registerButtonEventListener(slot0.close_btn, function ()
		ActionController:getInstance():openDirectBuyGiftWin(false)
	end, false, 2)
	registerButtonEventListener(slot0.cancle, function ()
		ActionController:getInstance():openDirectBuyGiftWin(false)
	end, true, 2)
	registerButtonEventListener(slot0.goto_btn, function ()
		CommonAlert.show(string.format("是否花费%d元，购买此礼包", uv0.buyGiftYuan), TI18N("确定"), function ()
			if uv0.productID ~= nil and uv0.productStr ~= nil then
				sdkOnPay(uv0.buyGiftYuan, 1, uv0.productID, uv0.productStr)
			else
				message(TI18N("获取礼包信息出错"))
			end
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24)
	end, true, 1)
end

function ActionDirectBuygiftWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	if slot0.update_directgift_event then
		slot0.update_directgift_event = GlobalEvent:getInstance():UnBind(slot0.update_directgift_event)
		slot0.update_directgift_event = nil
	end

	ActionController:getInstance():openDirectBuyGiftWin(false)
end
