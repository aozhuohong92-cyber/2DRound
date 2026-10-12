TreasurePanel = class("TreasurePanel", function ()
	return ccui.Widget:create()
end)
slot0 = Config.HolidaySnatchData.data_join_goods_list
slot2 = FestivalActionController:getInstance():getModel()
slot3 = table.insert
slot4 = table.sort
slot5 = string.format

function TreasurePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.first_comme_in = false
	slot0.recent_record_txt = {}
	slot0.recent_record_num = {}

	slot0:loadResources()
end

function TreasurePanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("treasure", "treasure"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "txt_cn_festival_treasure"),
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

function TreasurePanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function TreasurePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("festivalaction/treasure_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("treasure_bg")
	slot3 = "txt_cn_festival_treasure"

	if ActionController:getInstance():getActionSubTabVo(slot0.holiday_bid) and slot4.aim_title ~= "" and slot4.aim_title then
		slot3 = slot4.aim_title
	end

	slot0.treasure_bg_load = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/festivalaction", slot3), ResourcesType.single, slot0.treasure_bg_load)
	slot0.btn_my_record = slot1:getChildByName("btn_my_record")
	slot0.btn_change_shop = slot1:getChildByName("btn_change_shop")
	slot0.btn_rule = slot1:getChildByName("btn_rule")

	slot1:getChildByName("Text_1"):setString(TI18N("剩余时间："))

	slot0.text_remain = slot1:getChildByName("text_remain")

	slot0.text_remain:setString("")

	slot0.holiday_time = slot1:getChildByName("holiday_time")

	slot0.holiday_time:setString("")
	slot0:setHolidayJoinTime()
	slot1:getChildByName("Text_2"):setString(TI18N("只需一个夺宝币，即有机会获得超值道具！若未中奖，\n夺宝币则按1:3返还为夺宝积分"))

	slot0.add_btn = slot1:getChildByName("add_btn")
	slot0.count_label = slot1:getChildByName("count_label")

	slot0.count_label:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(37006))

	slot7 = slot1:getChildByName("grade_icon")

	if Config.ItemData.data_get_data(37006) then
		loadSpriteTexture(slot7, PathTool.getItemRes(slot8.icon), LOADTEXT_TYPE)
		slot7:setScale(0.4)
	end

	slot0.goods_scroll = slot1:getChildByName("goods_scroll")
	slot0.record_scroll = slot1:getChildByName("record_scroll")

	uv0:sender25700()
end

function TreasurePanel.setHolidayJoinTime(slot0)
	slot0.holiday_time:setString(uv0:setSnatchTime())
end

function TreasurePanel.setJoinLotteryData(slot0)
	if not slot0.item_scrollview then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.goods_scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.goods_scroll:getContentSize(), {
			start_y = 5,
			row = 1,
			start_x = 7,
			space_x = 5,
			item_width = 341,
			item_height = 260,
			space_y = 0,
			col = 2,
			need_dynamic = true
		})

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot1 = 0.5

	if slot0.first_comme_in == false then
		slot1 = 0.01
	end

	if slot0.update_join_ticket == nil then
		slot0.update_join_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:clearUpdataJoinTicket()

			uv0.show_list = {}
			uv0.show_list = uv1:getTreasureAllItemData()

			if uv0.show_list then
				uv2(uv0.show_list, function (slot0, slot1)
					return slot0.pos < slot1.pos
				end)
			end

			if uv0.item_scrollview then
				if uv0.first_comme_in == false then
					uv0.first_comme_in = true

					uv0.item_scrollview:reloadData()
				else
					uv0.item_scrollview:resetCurrentItems()
				end
			end
		end, slot1)
	end
end

function TreasurePanel.clearUpdataJoinTicket(slot0)
	if slot0.update_join_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.update_join_ticket)

		slot0.update_join_ticket = nil
	end
end

function TreasurePanel.createNewCell(slot0)
	return TreasureItem.new()
end

function TreasurePanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function TreasurePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function TreasurePanel.register_event(slot0)
	if not slot0.holiday_treasure_event then
		slot0.holiday_treasure_event = GlobalEvent:getInstance():Bind(FestivalActionEvent.TreasureMessage, function (slot0)
			uv0:setJoinLotteryData()
			uv0:setLateWinLogs(slot0.logs)

			if slot0.state == 1 then
				if slot0.state_time - GameNet:getInstance():getTime() <= 0 then
					slot1 = 0
				end

				commonCountDownTime(uv0.text_remain, slot1)
			else
				doStopAllActions(uv0.text_remain)
				uv0.text_remain:setString(TI18N("尚未开启"))
			end
		end)
	end

	registerButtonEventListener(slot0.btn_my_record, function ()
		uv0:openTreasureMyServerView(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_change_shop, function ()
		MallController:getInstance():openMallActionWindow(true, uv0.holiday_bid)
	end, true, 1)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.HolidaySnatchData.data_const and slot3.holiday_rule and slot3.holiday_rule.desc then
			TipsManager:getInstance():showCommonTips(slot3.holiday_rule.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1)
	registerButtonEventListener(slot0.record_scroll, function ()
		uv0:openTreasureAllServerView(true)
	end, false, 1)
	registerButtonEventListener(slot0.add_btn, function ()
		if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.trause_grade_shop) and slot0.action_operate and slot0.action_operate.tab_list[slot1.bid] then
			slot0.action_operate:handleSelectedTab(slot0.action_operate.tab_list[slot1.bid])
		else
			message(TI18N("该活动已结束或未到开启时间段"))
		end
	end, false, 1)

	if not slot0.grade_count_add_event then
		slot0.grade_count_add_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:changeGradeCount(slot1)
		end)
	end

	if not slot0.grade_count_delete_event then
		slot0.grade_count_delete_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:changeGradeCount(slot1)
		end)
	end

	if not slot0.grade_count_modify_event then
		slot0.grade_count_modify_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:changeGradeCount(slot1)
		end)
	end
end

function TreasurePanel.changeGradeCount(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot6.base_id == 37006 then
			slot0.count_label:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(37006))
		end
	end
end

function TreasurePanel.setLateWinLogs(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0:setRecentAwardsData(slot1)
end

function TreasurePanel.setRecentAwardsData(slot0, slot1)
	for slot5 = 1, #slot1 do
		if not slot0.recent_record_txt[slot5] then
			slot0.recent_record_txt[slot5] = createRichLabel(20, cc.c3b(255, 248, 191), cc.p(0, 0.5), cc.p(22, 90 - slot5 * 25), nil, nil, 400)

			slot0.record_scroll:addChild(slot0.recent_record_txt[slot5])

			slot0.recent_record_num[slot5] = createRichLabel(20, cc.c3b(255, 248, 191), cc.p(1, 0.5), cc.p(694, 90 - slot5 * 25), nil, nil, 300)

			slot0.record_scroll:addChild(slot0.recent_record_num[slot5])
		end

		slot6 = 0

		if slot1[slot5].awards and slot1[slot5].awards[1] then
			slot6 = slot1[slot5].awards[1].num or 0
		end

		slot0.recent_record_txt[slot5]:setString(uv0(TI18N("<div fontcolor=fff8bf outline=2,#000000>恭喜 </div><div fontcolor=ffd34c outline=2,#000000>%s</div><div fontcolor=fff8bf outline=2,#000000> 夺得 </div><div fontcolor=ff9a09 outline=2,#000000>%sx%d</div>"), slot1[slot5].win_name, slot1[slot5].award_name, slot6))
		slot0.recent_record_num[slot5]:setString(uv0(TI18N("<div fontcolor=fff8bf outline=2,#000000>参与 </div><div fontcolor=5fd54c outline=2,#000000>%s </div><div fontcolor=fff8bf outline=2,#000000> 人次 总共 </div><div fontcolor=5fd54c outline=2,#000000>%s</div><div fontcolor=fff8bf outline=2,#000000> 人次</div>"), slot0:changeJoinNumber(slot1[slot5].join_num), slot0:changeJoinNumber(slot1[slot5].max_num)))
	end
end

function TreasurePanel.changeJoinNumber(slot0, slot1)
	if not slot1 then
		return 0
	end

	if 4 == string.len(tostring(slot1)) then
		return tostring(slot1)
	end

	for slot10 = 1, slot2 - slot4 do
		slot5 = "" .. "  "
	end

	return slot5 .. slot1
end

function TreasurePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function TreasurePanel.DeleteMe(slot0)
	slot0:clearUpdataJoinTicket()
	doStopAllActions(slot0.text_remain)

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.holiday_treasure_event then
		GlobalEvent:getInstance():UnBind(slot0.holiday_treasure_event)

		slot0.holiday_treasure_event = nil
	end

	if slot0.grade_count_add_event then
		GlobalEvent:getInstance():UnBind(slot0.grade_count_add_event)

		slot0.grade_count_add_event = nil
	end

	if slot0.grade_count_delete_event then
		GlobalEvent:getInstance():UnBind(slot0.grade_count_delete_event)

		slot0.grade_count_delete_event = nil
	end

	if slot0.grade_count_modify_event then
		GlobalEvent:getInstance():UnBind(slot0.grade_count_modify_event)

		slot0.grade_count_modify_event = nil
	end

	if slot0.treasure_bg_load then
		slot0.treasure_bg_load:DeleteMe()

		slot0.treasure_bg_load = nil
	end

	if slot0.record_scrollview then
		slot0.record_scrollview:DeleteMe()

		slot0.record_scrollview = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end

TreasureItem = class("TreasureItem", function ()
	return ccui.Widget:create()
end)

function TreasureItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function TreasureItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("festivalaction/treasure_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(341, 260))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.tag = slot1:getChildByName("tag")

	slot0.tag:setVisible(false)
	slot0.tag:setLocalZOrder(10)

	slot0.icon = slot1:getChildByName("icon")
	slot0.btn_open = slot1:getChildByName("btn_open")

	slot0.btn_open:getChildByName("Text_6"):setString(TI18N("已开奖"))
	slot0.btn_open:setVisible(false)

	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_6"):setString(TI18N("待开奖"))
	slot0.btn_get:setVisible(false)

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_6"):setString(TI18N("立即参与"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_next = slot1:getChildByName("btn_next")

	slot0.btn_next:getChildByName("Text_6"):setString(TI18N("未开奖"))
	slot0.btn_next:setVisible(false)

	slot0.next_text = slot1:getChildByName("next_text")

	slot0.next_text:setString(TI18N("未达到最低开奖人数"))
	slot0.next_text:setVisible(false)

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")

	slot0.assets = slot1:getChildByName("assets")

	slot0.assets:setString("")

	slot0.people_full = slot1:getChildByName("people_full")

	slot0.people_full:setVisible(false)

	slot0.full_bar = slot0.people_full:getChildByName("full_bar")

	slot0.full_bar:setScale9Enabled(true)
	slot0.full_bar:setPercent(100)
	slot0.people_full:getChildByName("Text_8"):setString(TI18N("人数已满"))
	slot0.people_full:getChildByName("Text_8_0"):setString(TI18N("倒计时："))

	slot0.time = slot0.people_full:getChildByName("time")

	slot0.time:setString("")

	slot0.people_join = slot1:getChildByName("people_join")

	slot0.people_join:setVisible(false)

	slot0.join_bar = slot0.people_join:getChildByName("join_bar")

	slot0.join_bar:setScale9Enabled(true)
	slot0.join_bar:setPercent(0)
	slot0.people_join:getChildByName("Text_11"):setString(TI18N("已参与"))
	slot0.people_join:getChildByName("Text_11_0"):setString(TI18N("总需次数"))
	slot0.people_join:getChildByName("Text_11_1"):setString(TI18N("剩余"))

	slot0.current_count = slot0.people_join:getChildByName("current_count")

	slot0.current_count:setString("")

	slot0.totle_count = slot0.people_join:getChildByName("totle_count")

	slot0.totle_count:setString("")

	slot0.remain_count = slot0.people_join:getChildByName("remain_count")

	slot0.remain_count:setString("")

	slot0.people_open = slot1:getChildByName("people_open")

	slot0.people_open:setVisible(false)
	slot0.people_open:getChildByName("Text_8_0"):setString(TI18N("倒计时："))

	slot0.open_time = slot0.people_open:getChildByName("time")

	slot0.open_time:setString("")

	slot0.goods_item = BackPackItem.new(nil, true, nil, 0.8, false, true)

	slot1:addChild(slot0.goods_item)
	slot0.goods_item:setPosition(cc.p(65, 195))
end

function TreasureItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if uv0[slot1.id] == nil then
		return
	end

	slot0.treasure_item_data = slot2
	slot1.start_status = 1

	if uv1:getActionStartStatus() == 0 then
		if slot1.state == 4 then
			slot1.start_status = 2

			slot0.next_text:setString(TI18N("未达到最低开奖人数"))
		else
			slot1.state = 5
			slot1.start_status = 3

			slot0.next_text:setString(TI18N("活动尚未开启"))
		end
	end

	slot0.item_data = slot1

	slot0.people_join:setVisible(slot1.state == 0)
	slot0.people_full:setVisible(slot1.state == 1)
	slot0.people_open:setVisible(slot1.state == 2 or slot1.state == 3)
	slot0.btn_goto:setVisible(slot1.state == 0)
	slot0.btn_get:setVisible(slot1.state == 1)
	slot0.btn_open:setVisible(slot1.state == 2 or slot1.state == 3)
	slot0.btn_next:setVisible(slot1.state == 4 or slot1.state == 5)
	slot0.next_text:setVisible(slot1.state == 4 or slot1.state == 5)
	slot0.name:setString(slot2.name)
	slot0.tag:setVisible(slot2.is_hot == 1)
	slot0:showJoinMessage(slot2, slot1)

	if slot0.goods_item then
		slot0.goods_item:setBaseData(slot2.award[1][1], slot2.award[1][2])
	end

	if Config.ItemData.data_get_data(37006) then
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
		slot0.icon:setScale(0.4)
	end

	slot0.assets:setString(slot2.price)
end

function TreasureItem.showJoinMessage(slot0, slot1, slot2)
	if slot0.people_full:isVisible() then
		uv0:CountDownTime(slot0.time, slot2.state_time)
	elseif slot0.people_join:isVisible() then
		slot3 = slot2.num or 0
		slot4 = slot1.limit_max or 0
		slot5 = 0

		if slot2.ext and (keyfind("key", 1, slot2.ext) or nil) then
			slot5 = slot6.val or 0
		end

		slot0.current_count:setString(slot5)
		slot0.totle_count:setString(slot4)

		if slot4 - slot3 <= 0 then
			slot6 = 0
		end

		slot0.remain_count:setString(slot6)
		slot0.join_bar:setPercent(slot3 / slot4 * 100)
	elseif slot0.people_open:isVisible() then
		uv0:CountDownTime(slot0.open_time, slot2.state_time)
	end
end

function TreasureItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_open, function ()
		if uv0.item_data then
			uv1:openTreasureOpenAwardView(true, uv0.item_data)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		if uv0.treasure_item_data and uv0.item_data then
			uv1:openTreasureJoinView(true, uv0.treasure_item_data, uv0.item_data)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		message(TI18N("尚未开奖，请耐心等待哦~~~"))
	end, true, 1)
	registerButtonEventListener(slot0.btn_next, function ()
		if uv0.item_data and uv0.item_data.start_status then
			if uv0.item_data.start_status == 1 or uv0.item_data.start_status == 2 then
				message(TI18N("未达到最低开奖人数，请参与下一轮~~~"))
			elseif uv0.item_data.start_status == 3 then
				message(TI18N("活动尚未开启~~~"))
			end
		end
	end, true, 1)
end

function TreasureItem.DeleteMe(slot0)
	doStopAllActions(slot0.time)
	doStopAllActions(slot0.open_time)

	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
