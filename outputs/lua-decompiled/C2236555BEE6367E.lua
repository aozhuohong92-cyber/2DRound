VoyageOrderItem = class("VoyageOrderItem", function ()
	return ccui.Widget:create()
end)
slot1 = VoyageController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format

function VoyageOrderItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function VoyageOrderItem.configUI(slot0)
	slot0.size = cc.size(631, 171)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("voyage/voyage_order_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.rarity_image = slot2:getChildByName("rarity_image")
	slot0.order_name = slot2:getChildByName("order_name")
	slot0.get_btn = slot2:getChildByName("get_btn")
	slot3 = slot0.get_btn:getContentSize()
	slot0.get_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot3.width / 2, slot3.height / 2))

	slot0.get_btn:addChild(slot0.get_btn_label)

	slot0.progress_bg = slot2:getChildByName("progress_bg")
	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.progress_value = slot0.progress_bg:getChildByName("progress_value")

	slot0.progress_bg:setVisible(false)

	slot4 = slot2:getChildByName("goods_list")
	slot5 = slot4:getContentSize()
	slot7 = 0.7
	slot0.good_scrollview = CommonScrollViewLayout.new(slot4, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height), {
		start_y = 0,
		start_x = 0,
		space_x = 20,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * slot7,
		item_height = BackPackItem.Height * slot7,
		scale = slot7
	})

	slot0.good_scrollview:setSwallowTouches(false)
end

function VoyageOrderItem.register_event(slot0)
	registerButtonEventListener(slot0.get_btn, handler(slot0, slot0._onClickGetBtn), true)
end

function VoyageOrderItem._onClickGetBtn(slot0, slot1, slot2, slot3)
	if slot0.data then
		if slot0.data.status == VoyageConst.Order_Status.Unget then
			uv0:openVoyageDispatchWindow(true, slot0.data)
		elseif slot0.data.status == VoyageConst.Order_Status.Underway then
			uv0:requestFinishOrder(slot0.data.order_id, 1)
		elseif slot0.data.status == VoyageConst.Order_Status.Finish then
			uv0:requestFinishOrder(slot0.data.order_id, 0)
		end

		if slot2.guide_call_back ~= nil then
			slot2:guide_call_back()
		end
	end
end

function VoyageOrderItem.setData(slot0, slot1)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot0.update_price_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_price_event)

		slot0.update_price_event = nil
	end

	if slot0.update_price_event == nil then
		slot0.update_price_event = GlobalEvent:getInstance():Bind(VoyageEvent.UpdateActivityStatusEvent, function ()
			uv0:refreshOrderBtnStatus()
		end)
	end

	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(VoyageEvent.UpdateOrderDataEvent, function ()
				uv0:refreshOrderInfo()
			end)
		end

		slot0:refreshOrderInfo()
	end
end

function VoyageOrderItem.refreshOrderInfo(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.config or next(slot1) == nil then
		return
	end

	slot0.config = slot1

	slot0.rarity_image:loadTexture(PathTool.getResFrame("voyage", VoyageConst.Order_Rarity_Res[slot1.quality]), LOADTEXT_TYPE_PLIST)

	slot8 = 15

	slot0.rarity_image:setCapInsets(cc.rect(slot8, 15, 1, 5))
	slot0.order_name:setString(slot1.name)

	slot7 = 2

	slot0.order_name:enableOutline(VoyageConst.Order_Rarity_Color[slot1.quality], slot7)

	slot3 = {}

	for slot7, slot8 in ipairs(slot1.award) do
		slot11 = deepCopy(Config.ItemData.data_get_data(slot8[1]))
		slot11.quantity = slot8[2]

		uv0(slot3, slot11)
	end

	slot0.good_scrollview:setData(slot3)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)

	if slot0.get_btn and slot0.data.index then
		slot0.get_btn:setName("get_btn_" .. slot0.data.index)
	end

	slot0:refreshOrderBtnStatus()
end

function VoyageOrderItem.refreshOrderBtnStatus(slot0)
	if slot0.data.status == VoyageConst.Order_Status.Unget then
		if not slot0.expend_label then
			slot0.expend_label = createRichLabel(24, Config.ColorData.data_color3[175], cc.p(0.5, 0.5), cc.p(530, 120))

			slot0.container:addChild(slot0.expend_label)
		end

		if slot0.config.expend[1] then
			slot5 = PathTool.getItemRes(Config.ItemData.data_get_data(slot1[1]).icon)

			if uv0:getActivityStatus() == 1 and Config.ShippingData.data_const.discount then
				slot3 = slot1[2] * slot6.val / 1000
			end

			slot0.expend_label:setString(uv1(TI18N("消耗: <img src='%s' scale=0.5 /> %d"), slot5, slot3))
		end

		slot0.get_btn_label:setString(TI18N("<div fontcolor=#ffffff outline=2,#294a15>接取</div>"))
		slot0.get_btn:loadTexture(PathTool.getResFrame("common", "common_1098"), LOADTEXT_TYPE_PLIST)
		slot0.get_btn:setCapInsets(cc.rect(11, 11, 28, 1))
		slot0:openOrderTimer(false)
		slot0.expend_label:setVisible(true)
		slot0.progress_bg:setVisible(false)
	elseif slot0.data.status == VoyageConst.Order_Status.Underway then
		slot0.get_btn:loadTexture(PathTool.getResFrame("common", "common_1098"), LOADTEXT_TYPE_PLIST)
		slot0.get_btn:setCapInsets(cc.rect(11, 11, 28, 1))

		slot0.left_time = slot0.data.end_time - GameNet:getInstance():getTime()

		if slot0.left_time < 0 then
			slot0.left_time = 0
		end

		slot0.get_btn_label:setString(uv1(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#ffffff outline=2,#294a15>%d 加速</div>"), PathTool.getItemRes(3), uv0:getQuickFinishNeedGoldByTime(slot0.left_time)))
		slot0.progress:setPercent(100 - slot0.left_time / slot0.config.need_time * 100)
		slot0.progress_value:setString(TimeTool.GetTimeFormat(slot0.left_time))
		slot0:openOrderTimer(true)

		if slot0.data.old_status == VoyageConst.Order_Status.Unget then
			slot0.data.old_status = slot0.data.status

			slot0:handleEffect(true)
		end

		if slot0.expend_label then
			slot0.expend_label:setVisible(false)
		end

		slot0.progress_bg:setVisible(true)
	elseif slot0.data.status == VoyageConst.Order_Status.Finish then
		slot0.get_btn_label:setString(TI18N("<div fontcolor=#ffffff outline=2,#020019>完成</div>"))
		slot0.get_btn:loadTexture(PathTool.getResFrame("common", "common_1027"), LOADTEXT_TYPE_PLIST)
		slot0.get_btn:setCapInsets(cc.rect(11, 11, 28, 1))
		slot0.progress:setPercent(100)
		slot0.progress_value:setString(TI18N("完成"))
		slot0:openOrderTimer(false)

		if slot0.expend_label then
			slot0.expend_label:setVisible(false)
		end

		slot0.progress_bg:setVisible(true)
	end
end

function VoyageOrderItem.openOrderTimer(slot0, slot1)
	if slot1 == true then
		if slot0.order_timer == nil then
			slot0.order_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.left_time = uv0.left_time - 1

				if uv0.left_time >= 0 then
					uv0.progress:setPercent(100 - uv0.left_time / uv0.config.need_time * 100)
					uv0.progress_value:setString(TimeTool.GetTimeFormat(uv0.left_time))
				else
					uv0.progress:setPercent(100)
					uv0.progress_value:setString(TI18N("完成"))
					GlobalTimeTicket:getInstance():remove(uv0.order_timer)

					uv0.order_timer = nil
				end
			end, 1)
		end
	elseif slot0.order_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.order_timer)

		slot0.order_timer = nil
	end
end

function VoyageOrderItem.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.container) and slot0.play_effect == nil then
		slot2 = slot0.container:getContentSize()
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(629), cc.p(slot2.width * 0.5, slot2.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)

		slot0.container:addChild(slot0.play_effect, 1)
	elseif slot0.play_effect then
		slot0.play_effect:setToSetupPose()
		slot0.play_effect:setAnimation(0, PlayerAction.action, false)
	end
end

function VoyageOrderItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.update_price_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_price_event)

		slot0.update_price_event = nil
	end

	slot0:openOrderTimer(false)
	slot0:handleEffect(false)
end

function VoyageOrderItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end

	if slot0.update_price_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_price_event)

		slot0.update_price_event = nil
	end

	slot0:handleEffect(false)
	slot0:openOrderTimer(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
