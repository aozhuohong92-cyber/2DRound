AdventureEvtFreeBoxWindow = AdventureEvtFreeBoxWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = string.format

function AdventureEvtFreeBoxWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Big
	slot0.data = slot1
	slot0.config = slot1.config
	slot0.layout_name = "adventure/adventure_evt_free_box_view"
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

function AdventureEvtFreeBoxWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.item_container = slot0.container:getChildByName("item_container")
	slot0.ack_button = slot0.container:getChildByName("ack_button")
	slot1 = slot0.ack_button:getTitleRenderer()

	slot1:setString(TI18N("打开"))
	slot1:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.title_label = slot0.container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("宝箱"))

	slot0.reward_label = slot0.container:getChildByName("reward_label")

	slot0.reward_label:setString(TI18N("随机奖励预览"))

	slot2 = slot0.item_container:getContentSize()
	slot0.is_select = false
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.item_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot2.width, slot2.height - 49), {
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
	slot0.open_desc = slot0.container:getChildByName("open_desc")

	slot0.open_desc:setString("")

	slot0.desc = slot0.container:getChildByName("desc")

	slot0.desc:setTextAreaSize(cc.size(556, 80))
	slot0:updatedata()
end

function AdventureEvtFreeBoxWindow.updatedata(slot0)
	if slot0.config then
		slot0.desc:setString(slot0.config.desc)

		if slot0.config.lose and next(slot0.config.lose[1] or {}) ~= nil then
			slot0:updateItemData(slot0.config.lose)
		end

		slot0:createEffect(slot0.config.effect_str)

		if slot0.config.box_show_item and next(slot0.config.box_show_item or {}) ~= nil then
			slot0:updateRankItemData(slot0.config.box_show_item)
		end
	end
end

function AdventureEvtFreeBoxWindow.createEffect(slot0, slot1)
	if slot1 ~= "" and not tolua.isnull(slot0.container) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(slot1, cc.p(360, 608), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.box_effect:setScale(1.5)
		slot0.container:addChild(slot0.box_effect)
	end
end

function AdventureEvtFreeBoxWindow.updateRankItemData(slot0, slot1)
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

function AdventureEvtFreeBoxWindow.updateTipsLabel(slot0, slot1)
end

function AdventureEvtFreeBoxWindow.register_event(slot0)
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

	if slot0.ack_button then
		slot0.ack_button:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data then
					slot2 = {
						{
							val = 0,
							type = 1
						}
					}

					if uv0.is_select == true then
						slot2 = {
							{
								val = 1,
								type = 1
							}
						}
					end

					uv1:send20620(uv0.data.id, AdventureEvenHandleType.handle, slot2)
				end
			end
		end)
	end

	if not slot0.update_box_event then
		slot0.update_box_event = GlobalEvent:getInstance():Bind(AdventureEvent.Update_Evt_Box_Result_Info, function (slot0)
			if slot0 then
				uv0:updateResult(slot0)
			end
		end)
	end
end

function AdventureEvtFreeBoxWindow.updateResult(slot0, slot1)
	if slot0.box_effect then
		slot0.box_effect:setAnimation(0, PlayerAction.action_1, false)
	end

	delayOnce(function ()
		uv0:showGetItemTips(uv1.items)
		uv0:openEvtViewByType(false)
	end, 1)
end

function AdventureEvtFreeBoxWindow.openRootWnd(slot0, slot1)
end

function AdventureEvtFreeBoxWindow.close_callback(slot0)
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
