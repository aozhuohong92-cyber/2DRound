PresageSummonPanel = class("PresageSummonPanel", function ()
	return ccui.Widget:create()
end)
slot1 = EliteSummonController:getInstance():getModel()
slot2 = Config.HolidayPredictData.data_constant
slot3 = Config.HolidayPredictData.data_reward_pos
slot4 = string.format

function PresageSummonPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.get_server_return = nil
	slot0.round_bg_load = {}
	slot0.open_list_pos = {}
	slot0.pine_pos_x = {}
	slot0.pine_pos_y = {}
	slot0.reward_item = {}
	slot0.open_status_item = {}
	slot0.effect_status_1 = {}
	slot0.pine_item = {}
	slot0.buy_item_type = nil
	slot0.touch_btn_reset = true
	slot0.tab_change_view = true
	slot0.tab_view = {}
	slot0.cur_index = nil
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("presagesummon", "presagesummon"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function PresageSummonPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PresageSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elitesummon/presage_summon_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.bg_image = slot1:getChildByName("bg_image")

	for slot7 = 1, 2 do
		slot8 = {
			btn = slot1:getChildByName("tab_panel"):getChildByName("tab_" .. slot7)
		}
		slot8.normal = slot8.btn:getChildByName("normal")
		slot8.select = slot8.btn:getChildByName("select")

		slot8.select:setVisible(false)

		slot8.name = slot8.btn:getChildByName("name")

		slot8.name:setString(({
			TI18N("幸运松果"),
			TI18N("豪华松果")
		})[slot7])

		slot8.index = slot7
		slot0.tab_view[slot7] = slot8
	end

	slot0.item_pine_count = uv0.item1.val
	slot4 = slot1:getChildByName("icon")

	if Config.ItemData.data_get_data(slot0.item_pine_count) then
		loadSpriteTexture(slot4, PathTool.getItemRes(slot5.icon), LOADTEXT_TYPE)
		slot4:setScale(0.45)
	end

	slot0.icon_count = slot1:getChildByName("icon_count")

	slot0.icon_count:setString("")
	slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_pine_count))

	slot0.btn_drop = slot1:getChildByName("btn_drop")
	slot0.probablity = slot1:getChildByName("probablity")

	slot0.probablity:setVisible(false)

	slot0.probablity_panel = slot0.probablity:getChildByName("panel")
	slot0.probabily_bg = slot0.probablity:getChildByName("probabily_bg")
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.btn_buy = slot1:getChildByName("btn_buy")
	slot0.time_text = slot1:getChildByName("time_text")

	slot0.time_text:setString("")

	slot0.item_scroll = slot1:getChildByName("item_scroll")
	slot0.close_status = slot1:getChildByName("close_status")

	slot0.close_status:setVisible(false)

	slot0.btn_open = slot0.close_status:getChildByName("btn_open")

	slot0.btn_open:getChildByName("Text_13"):setString(TI18N("打开松果"))

	slot0.open_status = slot1:getChildByName("open_status")

	slot0.open_status:setVisible(false)

	slot0.btn_reset = slot0.open_status:getChildByName("btn_reset")

	slot0.btn_reset:getChildByName("Text_13"):setString(TI18N("重新剥开"))

	slot0.refresh_text = createRichLabel(20, cc.c4b(255, 251, 148, 255), cc.p(0.5, 0.5), cc.p(103, 22))

	slot0.btn_reset:addChild(slot0.refresh_text)
	slot0.refresh_text:setString(TI18N("免费刷新: "))

	slot0.remain_refresh_bg = slot0.open_status:getChildByName("Image_6")

	slot0.remain_refresh_bg:setVisible(false)

	slot0.remain_refresh_text = createRichLabel(22, cc.c4b(255, 247, 227, 255), cc.p(0.5, 0.5), cc.p(slot0.remain_refresh_bg:getContentSize().width / 2, 15), nil, , 500)

	slot0.remain_refresh_bg:addChild(slot0.remain_refresh_text)

	slot0.btn_get = slot0.open_status:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_13")

	slot0.btn_get_label:setString(TI18N("立即获得"))

	slot0.get_diamond = createRichLabel(22, cc.c4b(138, 250, 73, 255), cc.p(0.5, 0.5), cc.p(103, 22))

	slot0.btn_get:addChild(slot0.get_diamond)

	slot0.limit_count = slot0.open_status:getChildByName("limit_count")
	slot10 = TI18N

	slot0.limit_count:setString(slot10("活动限购: "))

	for slot10 = 1, 3 do
		slot0.open_list_pos[slot10] = {
			slot0.open_status:getChildByName("node_" .. slot10):getPositionX(),
			slot0.open_status:getChildByName("node_" .. slot10):getPositionY()
		}
		slot0.pine_pos_x[slot10] = slot0.close_status:getChildByName("node_" .. slot10):getPositionX()
		slot0.pine_pos_y[slot10] = slot0.close_status:getChildByName("node_" .. slot10):getPositionY()
	end

	slot0.remain_up = createRichLabel(22, cc.c4b(255, 247, 227, 255), cc.p(0.5, 0.5), cc.p(360, 157), nil, , 500)

	slot0.open_status:addChild(slot0.remain_up)
	uv1:send16690()
end

function PresageSummonPanel.setDropProbalyData(slot0)
	if not slot0.probably_item_scrollview then
		slot0.probably_item_scrollview = CommonScrollViewSingleLayout.new(slot0.probablity_panel, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.probablity_panel:getContentSize(), {
			start_y = 0,
			row = 1,
			start_x = 20,
			space_x = 0,
			space_y = 0,
			col = 2,
			need_dynamic = true,
			item_width = PresageSummonItem.width,
			item_height = PresageSummonItem.height
		})

		slot0.probably_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.probably_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.probably_item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if not slot0.cur_index then
		return
	end

	slot0.drop_list = uv0:getDropData(slot0.cur_index)

	if next(slot0.drop_list) == nil then
		uv0:setDropData(slot0.cur_index)

		slot0.drop_list = uv0:getDropData(slot0.cur_index)
	end

	if slot0.probably_item_scrollview then
		slot0.probably_item_scrollview:reloadData()
	end
end

function PresageSummonPanel.createNewCell(slot0)
	return PresageSummonItem.new()
end

function PresageSummonPanel.numberOfCells(slot0)
	if not slot0.drop_list then
		return 0
	end

	return #slot0.drop_list
end

function PresageSummonPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.drop_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function PresageSummonPanel.tabChangeView(slot0, slot1)
	slot1 = slot1 or 1

	if not slot0.tab_change_view then
		return
	end

	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.normal:setVisible(true)
		slot0.cur_tab.select:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_view[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.normal:setVisible(false)
		slot0.cur_tab.select:setVisible(true)
	end

	slot0.remain_refresh_bg:setVisible(slot1 == 2)

	if not slot0.round_bg_load[slot1] then
		slot0.round_bg_load[slot1] = loadSpriteTextureFromCDN(slot0.bg_image, PathTool.getPlistImgForDownLoad("bigbg/timesummon", "txt_cn_presage_summon" .. slot1), ResourcesType.single, slot0.round_bg_load[slot1])
	end

	if slot0.round_bg_load[slot1] then
		loadSpriteTexture(slot0.bg_image, slot2, LOADTEXT_TYPE)
	end

	slot0:setConfigData()
	slot0:IsActionStatus(uv0:getIsStatus(slot1))
	slot0:setLimitCount()
end

function PresageSummonPanel.setConfigData(slot0)
	if not slot0.cur_index then
		return
	end

	slot1 = nil

	if slot0.cur_index == 1 then
		slot1 = uv0.show_item1.val
	elseif slot0.cur_index == 2 then
		slot1 = uv0.show_item2.val
	end

	if not slot1 then
		return
	end

	slot2 = slot0.item_scroll:getContentSize().height - 60

	if #slot1 >= 6 then
		slot3 = 6
	end

	for slot7 = 1, slot3 do
		if not slot0.reward_item[slot7] then
			slot0.reward_item[slot7] = BackPackItem.new(nil, true, nil, 0.7)

			slot0.item_scroll:addChild(slot0.reward_item[slot7])
		end

		slot0.reward_item[slot7]:setPosition(cc.p(58 + (BackPackItem.Width * 0.7 + 15) * ((slot7 - 1) % 3), slot2 - (BackPackItem.Height * 0.7 + 10) * math.floor((slot7 - 1) / 3)))
		slot0.reward_item[slot7]:setBaseData(slot1[slot7][1], slot1[slot7][2])
		slot0.reward_item[slot7]:setDefaultTip()
	end
end

function PresageSummonPanel.IsActionStatus(slot0, slot1)
	slot0.close_status:setVisible(slot1 == 0)
	slot0.open_status:setVisible(slot1 == 1)

	if not uv0:getGoodsItemPos(slot0.cur_index) then
		return
	end

	if not uv1 then
		return
	end

	if slot1 == 0 then
		slot0:setEffectStatus_1(false)
		slot0.btn_open:setVisible(true)

		if next(slot2.rand_lists) ~= nil then
			for slot7 = 1, 3 do
				if slot3[slot7] and slot3[slot7].pos and slot3[slot7].id and uv2[slot3[slot7].id] then
					slot9 = 520

					if Config.ItemData.data_get_data(uv2[slot3[slot7].id].item_id) and slot8.quality == BackPackConst.quality.orange then
						slot9 = 521
					end

					slot0:setEffectStatus_1(true, slot0.cur_index, slot7, slot9)

					if not slot0.pine_item[slot7] then
						slot0.pine_item[slot7] = createSprite(nil, slot0.pine_pos_x[slot7], slot0.pine_pos_y[slot7], slot0.close_status, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 10)
					end

					slot0.pine_item[slot7]:setVisible(true)

					slot10 = PathTool.getResFrame("presagesummon", "presagesummon_5")

					if uv2[slot3[slot7].id].is_goal == 1 then
						slot10 = PathTool.getResFrame("presagesummon", "presagesummon_8")
					end

					loadSpriteTexture(slot0.pine_item[slot7], slot10, LOADTEXT_TYPE_PLIST)
				end
			end
		end
	elseif slot1 == 1 then
		if next(slot2.rand_lists) ~= nil then
			for slot7 = 1, 3 do
				if not slot0.open_status_item[slot7] then
					slot0.open_status_item[slot7] = BackPackItem.new(nil, true)

					slot0.open_status:addChild(slot0.open_status_item[slot7])
				end

				if slot3[slot7] and slot3[slot7].pos and slot3[slot7].id and uv2[slot3[slot7].id] then
					slot9 = 522

					if Config.ItemData.data_get_data(uv2[slot3[slot7].id].item_id) and slot8.quality == BackPackConst.quality.orange then
						slot9 = 523
					end

					slot0.open_status_item[slot7]:setVisible(true)
					slot0.open_status_item[slot7]:setPosition(cc.p(slot0.open_list_pos[slot3[slot7].pos][1], slot0.open_list_pos[slot3[slot7].pos][2]))
					slot0.open_status_item[slot7]:setBaseData(uv2[slot3[slot7].id].item_id, uv2[slot3[slot7].id].item_num)
					slot0.open_status_item[slot7]:showItemEffect(true, slot9, PlayerAction.action, true)
					slot0.open_status_item[slot7]:setEffectLocalZOrder(-1)
					slot0.open_status_item[slot7]:setDefaultTip()
				end
			end
		end

		slot0:setBtnRefreahData()

		slot4 = uv1.must_num_2.val
		slot5 = uv3(TI18N("<div outline=2,#37161a>剩余</div><div fontColor=#8bfa49 fontsize=22 outline=2,#37161a> %d </div><div outline=2,#37161a>次刷新必出两个五星英雄</div>"), slot4 - slot2.count % slot4)

		if slot4 - slot2.count % slot4 == 1 then
			slot5 = TI18N("本次刷新必出两个五星英雄")
		end

		slot0.remain_refresh_text:setString(slot5)
	end
end

function PresageSummonPanel.setBtnRefreahData(slot0)
	if not slot0.cur_index then
		return
	end

	slot1 = uv0:getReFreshCount(slot0.cur_index)
	slot2 = uv1.free_time1.val

	if slot0.cur_index == 2 then
		slot2 = uv1.free_time2.val
	end

	slot3 = uv2(TI18N("<div outline=2,#651d00>免费刷新: %d/%d</div>"), slot2 - slot1, slot2)

	if slot2 <= slot1 then
		if BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_pine_count) >= 1 then
			if Config.ItemData.data_get_data(slot0.item_pine_count) then
				slot3 = uv2(TI18N("<img src=%s visible=true scale=0.25 /> %d"), PathTool.getItemRes(slot5.icon), 1)
			end
		elseif uv1.item_price.val and slot5[1] then
			slot3 = uv2(TI18N("<img src=%s visible=true scale=0.25 /> %d"), PathTool.getItemRes(slot5[1][1]), slot5[1][2])
		end
	end

	slot0.refresh_text:setString(slot3)

	slot4 = uv0:getbuyCount(slot0.cur_index)
	slot5 = 0

	if slot0.cur_index == 1 then
		slot5 = uv1.buy_time1.val
	elseif slot0.cur_index == 2 then
		slot5 = uv1.buy_time2.val
	end

	if slot4 < slot5 then
		if uv0:getGetButtonStatus(slot0.cur_index) == 1 then
			slot0:setGetChildUnEnabled(false)
		else
			slot0:setGetChildUnEnabled(true)
		end
	end
end

function PresageSummonPanel.setEffectStatus_1(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		for slot8, slot9 in pairs(slot0.effect_status_1) do
			if slot9 then
				slot9:setVisible(false)
			end
		end
	else
		if not slot0.effect_status_1[3 * (slot2 - 1) + slot3] then
			slot0.effect_status_1[slot5] = createEffectSpine(PathTool.getEffectRes(slot4), cc.p(slot0.pine_pos_x[slot3], slot0.pine_pos_y[slot3]), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.close_status:addChild(slot0.effect_status_1[slot5])
		end

		if slot0.effect_status_1[slot5] then
			slot0.effect_status_1[slot5]:setVisible(true)
		end
	end
end

function PresageSummonPanel.setLimitCount(slot0)
	if Config.HolidayPredictData.data_prize_pool[slot0.cur_index] then
		slot2 = slot1[slot0.cur_index].expend_item

		if slot2[1][2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot2[1][1]) then
			slot0.buy_item_type = 1
		else
			slot0.buy_item_type = 2
		end

		slot4 = nil

		if Config.ItemData.data_get_data(slot2[1][1]) then
			slot4 = string.format("<img src=%s scale=0.25 visible=true /> <div outline=2,#37161a> %d</div>", PathTool.getItemRes(slot5.icon), slot2[1][2])
		end

		slot6 = uv0:getbuyCount(slot0.cur_index)
		slot7 = 0

		if slot0.cur_index == 1 then
			slot7 = uv1.buy_time1.val
		elseif slot0.cur_index == 2 then
			slot7 = uv1.buy_time2.val
		end

		if slot7 <= slot6 then
			slot4 = TI18N("已到最大值")

			slot0:setGetChildUnEnabled(false)
		elseif slot6 < slot7 then
			if uv0:getGetButtonStatus(slot0.cur_index) == 1 then
				slot0:setGetChildUnEnabled(false)
			else
				slot0:setGetChildUnEnabled(true)
			end
		end

		if slot7 <= slot6 then
			slot6 = slot7
		end

		slot0.limit_count:setString(uv2(TI18N("活动限购: %d/%d"), slot6, slot7))

		if slot4 then
			slot0.get_diamond:setString(slot4)
		end
	end
end

function PresageSummonPanel.setGetChildUnEnabled(slot0, slot1)
	if slot1 == true then
		slot0.btn_get:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.btn_get)
		slot0.btn_get_label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.btn_get_label:enableOutline(cc.c4b(101, 29, 0, 255), 2)
	else
		slot0.btn_get:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_get)
		slot0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
	end
end

function PresageSummonPanel.register_event(slot0)
	if not slot0.message_event then
		slot0.message_event = GlobalEvent:getInstance():Bind(EliteSummonEvent.PresageSummon_Message, function (slot0)
			if not slot0 then
				return
			end

			uv0.get_server_return = true

			uv0:setCountDownTime(uv0.time_text, slot0.time)
			uv0:tabChangeView(1)
			uv0:setLimitCount()
		end)
	end

	if not slot0.refersh_event then
		slot0.refersh_event = GlobalEvent:getInstance():Bind(EliteSummonEvent.PresageSummon_ReFresh, function (slot0)
			uv0:setTouchChangeView()
			uv0:openPineEffect()
		end)
	end

	if not slot0.open_prine_event then
		slot0.open_prine_event = GlobalEvent:getInstance():Bind(EliteSummonEvent.PresageSummon_Open_Pine, function ()
			uv0:setTouchChangeView()
			uv0:openPineEffect()
		end)
	end

	if not slot0.buy_return_event then
		slot0.buy_return_event = GlobalEvent:getInstance():Bind(EliteSummonEvent.PresageSummon_Buy_Return, function ()
			uv0:setLimitCount()
		end)
	end

	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if uv0.cur_index then
			slot3 = nil

			if uv0.cur_index == 1 then
				slot3 = uv1.game_rule1
			elseif uv0.cur_index == 2 then
				slot3 = uv1.game_rule2
			end

			if slot3 then
				TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
			end
		end
	end, true, nil, , 0.9)
	registerButtonEventListener(slot0.btn_buy, function ()
		if uv0 then
			ArenaController:getInstance():openArenaLoopChallengeBuy(true, {
				view_type = ArenaConst.view_type.summon,
				item_bid = uv0.item1.val,
				item_price = uv0.item_price.val[1][2]
			})
		end
	end, true)
	registerButtonEventListener(slot0.btn_open, function ()
		if uv0.cur_index then
			uv1:send16694(uv0.cur_index)
		end
	end, true)
	registerButtonEventListener(slot0.btn_reset, function ()
		if uv0.cur_index then
			uv0:touchBtnReset()
		end
	end, true)
	registerButtonEventListener(slot0.btn_get, function ()
		uv0:btnGetRewardItem()
	end, true)
	registerButtonEventListener(slot0.btn_drop, function ()
		uv0:btnDropMessage()
	end, true)

	function slot4()
		uv0.probablity:setVisible(false)
	end

	slot5 = false

	registerButtonEventListener(slot0.probabily_bg, slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_view) do
		registerButtonEventListener(slot5.btn, function ()
			if not uv0.get_server_return then
				message(TI18N("网络玩命加载中~~~~"))

				return
			end

			uv0:tabChangeView(uv1.index)
		end, false)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end
end

function PresageSummonPanel.setTouchChangeView(slot0)
	if not slot0.tab_change_view then
		return
	end

	if slot0.tab_change_ticket == nil then
		slot0.tab_change_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.tab_change_view = true

			uv0:clearTabChangeTicket()
		end, 2)
	end

	slot0.tab_change_view = nil
end

function PresageSummonPanel.clearTabChangeTicket(slot0)
	if slot0.tab_change_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.tab_change_ticket)

		slot0.tab_change_ticket = nil
	end
end

function PresageSummonPanel.touchBtnReset(slot0)
	slot1 = uv0.refresh.val

	if BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_pine_count) <= 0 and RoleController:getInstance():getRoleVo().gold < uv0.item_price.val[1][2] then
		message(TI18N("钻石不足~~~~"))

		return
	end

	if not slot0.touch_btn_reset then
		return
	end

	if slot0.btn_reset_ticket == nil then
		slot0.btn_reset_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_btn_reset = true

			if uv0.btn_reset_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.btn_reset_ticket)

				uv0.btn_reset_ticket = nil
			end
		end, 2)
	end

	slot0.touch_btn_reset = nil
	slot5 = EliteSummonController:getInstance():getModel():getbuyCount(slot0.cur_index)
	slot6 = 0

	if slot0.cur_index == 1 then
		slot6 = uv0.buy_time1.val
	elseif slot0.cur_index == 2 then
		slot6 = uv0.buy_time2.val
	end

	slot7 = 0

	if slot0.cur_index == 1 then
		slot7 = uv0.free_time1.val
	elseif slot0.cur_index == 2 then
		slot7 = uv0.free_time2.val
	end

	if slot6 <= slot5 then
		slot9 = nil

		if EliteSummonController:getInstance():getModel():getReFreshCount(slot0.cur_index) < slot7 then
			uv1:send16691(slot0.cur_index)
		else
			if slot3 > 0 then
				slot9 = uv2(TI18N("本次活动已无可购买次数，是否消耗<img src=%s visible=true scale=0.35 /><div fontColor=#289b14 fontsize= 26> 1</div> 继续刷新"), PathTool.getItemRes(uv0.item1.val))
			else
				slot10 = uv0.item_price.val
				slot9 = uv2(TI18N("本次活动已无可购买次数，是否消耗<img src=%s visible=true scale=0.30 /><div fontColor=#289b14 fontsize= 26> %d</div> 继续刷新"), PathTool.getItemRes(slot10[1][1]), slot10[1][2])
			end

			if slot9 then
				CommonAlert.show(slot9, TI18N("确定"), function ()
					uv0:send16691(uv1.cur_index)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		end
	else
		uv1:send16691(slot0.cur_index)
	end
end

function PresageSummonPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.item_pine_count and slot1 and slot2 and slot1 == BackPackConst.Bag_Code.BACKPACK then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.base_id and slot0.item_pine_count == slot7.base_id then
				if slot0.icon_count then
					slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_pine_count))
				end

				slot0:setLimitCount()
				slot0:setBtnRefreahData()
			end
		end
	end
end

function PresageSummonPanel.btnGetRewardItem(slot0)
	if slot0.cur_index and slot0.buy_item_type then
		if slot0.buy_item_type == 2 then
			slot3 = "松果币数量不足，"
			slot4 = ""

			if BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_pine_count) > 0 then
				slot5 = Config.HolidayPredictData.data_prize_pool[slot0.cur_index].expend_gold[1][2] - uv0.item_price.val[1][2] * slot2

				if Config.ItemData.data_get_data(slot0.item_pine_count) then
					slot3 = ""
					slot4 = uv1(TI18N("<img src=%s visible=true scale=0.30 /><div fontColor=#289b14 fontsize= 26>%d</div> 和 "), PathTool.getItemRes(slot7.icon), slot2)
				end
			end

			CommonAlert.show(uv1(TI18N("%s是否消耗 %s<img src=%s visible=true scale=0.30 /><div fontColor=#289b14 fontsize= 26>%d</div> 购买当前物品"), slot3, slot4, PathTool.getItemRes(slot1.expend_gold[1][1]), slot5), TI18N("确定"), function ()
				uv0:send16693(uv1.cur_index)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			uv2:send16693(slot0.cur_index)
		end
	end
end

function PresageSummonPanel.openPineEffect(slot0)
	doStopAllActions(slot0.actionNode)
	slot0:setEffectStatus_1(false)

	if slot0.pine_item then
		for slot4, slot5 in pairs(slot0.pine_item) do
			if slot5 then
				slot5:setVisible(false)
			end
		end
	end

	if slot0.open_status_item then
		for slot4, slot5 in pairs(slot0.open_status_item) do
			if slot5 then
				slot5:setVisible(false)
			end
		end
	end

	slot0.btn_open:setVisible(false)
	slot0.close_status:setVisible(true)

	slot1 = {
		524,
		525
	}
	slot2 = {
		[slot6] = cc.CallFunc:create(function ()
			uv1.close_status:addChild(createEffectSpine(PathTool.getEffectRes(uv0[uv1.cur_index]), cc.p(uv1.pine_pos_x[uv2], uv1.pine_pos_y[uv2]), cc.p(0.5, 0.5), false, PlayerAction.action))
		end)
	}

	for slot6 = 1, 3 do
	end

	slot0.actionNode = cc.Node:create()

	slot0.close_status:addChild(slot0.actionNode)
	slot0.actionNode:runAction(cc.Sequence:create(slot2[1], slot2[2], slot2[3], cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
		uv0:IsActionStatus(1)

		uv0.tab_change_view = true
	end), cc.RemoveSelf:create(true)))
end

function PresageSummonPanel.setCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 > 0 then
		function (slot0)
			if tolua.isnull(uv0) then
				return
			end

			uv0:setString(TimeTool.GetTimeFormatDayIIIIII(slot0))
		end(slot2)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			uv1(uv0)
		end))))
	else
		slot3(slot2)
	end
end

function PresageSummonPanel.btnDropMessage(slot0)
	if not slot0.cur_index then
		return
	end

	slot0.probablity:setVisible(true)
	slot0:setDropProbalyData()
end

function PresageSummonPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function PresageSummonPanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)
	doStopAllActions(slot0.actionNode)

	for slot4, slot5 in pairs(slot0.effect_status_1) do
		if slot5 then
			slot5:clearTracks()
			slot5:removeFromParent()

			slot5 = nil
		end
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.probably_item_scrollview then
		slot0.probably_item_scrollview:DeleteMe()

		slot0.probably_item_scrollview = nil
	end

	slot0:clearTabChangeTicket()

	if slot0.btn_reset_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.btn_reset_ticket)

		slot0.btn_reset_ticket = nil
	end

	slot0.effect_status_1 = {}

	if slot0.message_event then
		GlobalEvent:getInstance():UnBind(slot0.message_event)

		slot0.message_event = nil
	end

	if slot0.refersh_event then
		GlobalEvent:getInstance():UnBind(slot0.refersh_event)

		slot0.refersh_event = nil
	end

	if slot0.buy_return_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_return_event)

		slot0.buy_return_event = nil
	end

	if slot0.open_prine_event then
		GlobalEvent:getInstance():UnBind(slot0.open_prine_event)

		slot0.open_prine_event = nil
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

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	for slot4, slot5 in pairs(slot0.reward_item) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	for slot4, slot5 in pairs(slot0.open_status_item) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	for slot4, slot5 in pairs(slot0.round_bg_load) do
		if slot5 and slot5.DeleteMe then
			slot5:DeleteMe()
		end

		slot5 = nil
	end
end

slot5 = cc.c4b(76, 216, 73, 255)
PresageSummonItem = class("PresageSummonItem", function ()
	return ccui.Widget:create()
end)
PresageSummonItem.width = 250
PresageSummonItem.height = 30

function PresageSummonItem.ctor(slot0)
	slot0:configNumberUI()
end

function PresageSummonItem.configNumberUI(slot0)
	slot0:setContentSize(cc.size(PresageSummonItem.width, PresageSummonItem.height))
end

function PresageSummonItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.name_text then
		slot0.name_text = createRichLabel(26, uv0, cc.p(0, 0.5), cc.p(0, 15), nil, , 250)

		slot0:addChild(slot0.name_text)
	end

	slot0.name_text:setString(uv1(TI18N("%s<div fontColor=#ffa72a fontsize= 26> *%d</div>"), slot1.name, slot1.num))
end

function PresageSummonItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
