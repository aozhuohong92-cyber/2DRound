AdventureEvtBoxWindow = AdventureEvtBoxWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()

function AdventureEvtBoxWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Big
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.layout_name = "adventure/adventure_evt_box_view"
	slot0.is_full_screen = false
	slot0.item_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventure"),
			type = ResourcesType.plist
		}
	}
	slot0.is_send_proto = false
	slot0.is_use_csb = false
	slot0.need_list = {}
end

function AdventureEvtBoxWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.item_container = slot0.main_container:getChildByName("item_container")
	slot0.ack_button = slot0.main_container:getChildByName("ack_button")

	slot0.ack_button:getChildByName("label"):setString(TI18N("打 开"))

	slot0.title_label = slot0.main_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("宝箱"))

	slot0.reward_label = slot0.main_container:getChildByName("reward_label")

	slot0.reward_label:setString(TI18N("随机奖励预览"))

	slot0.swap_desc_label = createRichLabel(24, 175, cc.p(0.5, 1), cc.p(360, 760), nil, , 610)

	slot0.main_container:addChild(slot0.swap_desc_label)
	slot0.swap_desc_label:setVisible(true)

	slot1 = slot0.item_container:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.item_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height - 49), {
		start_y = 5,
		start_x = 10,
		space_x = 15,
		row = 0,
		space_y = 10,
		col = 5,
		scale = 0.9,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0:updatedata()
end

function AdventureEvtBoxWindow.updatedata(slot0)
	if slot0.config then
		slot0.swap_desc_label:setString(slot0.config.desc)

		if slot0.config.lose and next(slot0.config.lose[1] or {}) ~= nil then
			slot0:updateItemData(slot0.config.lose)
		end

		slot0:updateTipsLabel(slot0.config.base_items)
		slot0:createEffect(slot0.config.effect_str)

		if slot0.config.box_show_item and next(slot0.config.box_show_item or {}) ~= nil then
			slot0:updateRankItemData(slot0.config.box_show_item)
		end
	end
end

function AdventureEvtBoxWindow.createEffect(slot0, slot1)
	if slot1 ~= "" and not tolua.isnull(slot0.main_container) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(slot1, cc.p(375, 855), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.box_effect:setScale(1.5)
		slot0.main_container:addChild(slot0.box_effect)
	end
end

function AdventureEvtBoxWindow.updateItemData(slot0, slot1)
	if slot1 and next(slot1 or {}) ~= nil then
		slot0.need_list = slot1
		slot2 = BackPackItem.Width * #slot1
		slot0.start_x = (slot0.item_container:getContentSize().width - (#slot1 * BackPackItem.Height + #slot1 * 5)) * 0.5

		for slot7, slot8 in ipairs(slot1) do
			if not slot0.item_list[slot7] then
				slot9 = BackPackItem.new(true, true)

				slot9:setBaseData(slot8[1], slot8[2])
				slot9:setScale(0.8)
				slot9:setAnchorPoint(cc.p(0.5, 0.5))
				slot9:setDefaultTip()
				slot9:setNeedNum(slot8[2], BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot8[1]))

				slot9.bid = slot8[1]

				slot0.main_container:addChild(slot9)
				slot9:setPosition(360, 408)

				slot0.item_list[slot7] = slot9
			end
		end
	end
end

function AdventureEvtBoxWindow.updateRankItemData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot8 = {}
		slot8 = deepCopy(Config.ItemData.data_get_data(slot7[1]))
		slot8.num = slot7[2]

		table.insert(slot2, slot8)
	end

	slot0.item_scrollview:setData(slot2)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5.data and slot5.data.num ~= 1 then
				slot5:setNum(slot5.data.num)
			end
		end
	end)
end

function AdventureEvtBoxWindow.updateTipsLabel(slot0, slot1)
end

function AdventureEvtBoxWindow.register_event(slot0)
	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openEvtViewByType(false)
			end
		end)
	end

	registerButtonEventListener(slot0.ack_button, function ()
		if uv0.data then
			uv1:send20620(uv0.data.id, AdventureEvenHandleType.handle, {
				{
					val = 0,
					type = 1
				}
			})
		end
	end, true, 1)

	if not slot0.update_box_event then
		slot0.update_box_event = GlobalEvent:getInstance():Bind(AdventureEvent.Update_Evt_Box_Result_Info, function (slot0)
			if slot0 then
				uv0:updateResult(slot0)
			end
		end)
	end
end

function AdventureEvtBoxWindow.updateResult(slot0, slot1)
	slot0.box_effect:setAnimation(0, PlayerAction.action_1, false)
	delayOnce(function ()
		uv0:showGetItemTips(uv1.items)
		uv0:openEvtViewByType(false)
	end, 1)
end

function AdventureEvtBoxWindow.updateNum(slot0, slot1)
	if slot0.item_list then
		for slot5, slot6 in ipairs(slot0.item_list) do
			if slot6 and slot6.num_label and slot6.bid == slot1 then
				slot6.num_label:setString(string.format(TI18N("拥有<div fontcolor=#e14737>%s</div>个"), BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot6.bid)))
			end
		end
	end
end

function AdventureEvtBoxWindow.openRootWnd(slot0, slot1)
end

function AdventureEvtBoxWindow.close_callback(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end

		slot0.item_list = {}
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_box_event then
		GlobalEvent:getInstance():UnBind(slot0.update_box_event)

		slot0.update_box_event = nil
	end

	uv0:openEvtViewByType(false)
end
