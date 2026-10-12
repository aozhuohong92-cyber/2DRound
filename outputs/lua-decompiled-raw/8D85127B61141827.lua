ActionLimitFullExchangePanel = class("ActionLimitFullExchangePanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.sort

function ActionLimitFullExchangePanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.data = nil
	slot0.end_count = 0
	slot0.original_count = 0
	slot0.discount_count = 0
	slot0.full_exchange_list = {}

	if Config.HolidayFullExchangeData.data_holiday_full_exchange then
		for slot7, slot8 in pairs(slot3) do
			if slot8.val ~= 0 then
				uv0(slot0.full_exchange_list, slot8)
			end
		end

		uv1(slot0.full_exchange_list, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	end

	slot0.limit_list = {}
	slot0.dic_limit_list = {}

	slot0:configUI()
	slot0:register_event()
	slot0:loadResources()
end

function ActionLimitFullExchangePanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionfullexchange", "actionfullexchange"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("num", "type28"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(false)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0.remove_full_num_label = {}
		uv0.remove_reduce_num_label = {}

		for slot4, slot5 in ipairs(uv0.full_exchange_list) do
			if slot4 <= 3 then
				uv0.remove_full_num_label[slot4], uv0.remove_reduce_num_label[slot4] = uv0:initNumUI(({
					20,
					240,
					484
				})[slot4], 672, slot5.min, slot5.val)
			end
		end
	end)
end

function ActionLimitFullExchangePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_full_exchange_panel"))

	slot0.root_wnd:setPosition(-40, -105)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.time_val = slot0.main_container:getChildByName("time_val")
	slot0.time_title = slot0.main_container:getChildByName("time_title")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.buy_btn = slot0.main_container:getChildByName("buy_btn")

	slot0.time_title:setString(TI18N("冬季 购物大酬宾"))

	slot2 = nil

	if uv0:getActionSubTabVo(slot0.type, slot0.holiday_bid) and slot1.aim_title ~= nil and slot1.aim_title ~= "" then
		slot2 = slot1.aim_title
	end

	if slot2 == nil then
		slot2 = "txt_cn_limit_full_exchange"
	end

	slot0.item_load = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getPlistImgForDownLoad("bigbg/action", slot2), ResourcesType.single, slot0.item_load)

	if slot0.item_scrollview == nil then
		slot4 = slot0.goods_con:getContentSize()
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.goods_con, cc.p(slot4.width * 0.5, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot4, {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 355,
			item_height = 173,
			space_y = 0,
			col = 2
		}, cc.p(0.5, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.buy_btn = slot0.main_container:getChildByName("buy_btn")
	slot0.original_price = createRichLabel(22, cc.c4b(255, 246, 228, 255), cc.p(0, 0.5), cc.p(185, 35), nil, , 900)
	slot0.discount_price = createRichLabel(22, cc.c4b(255, 246, 228, 255), cc.p(0, 0.5), cc.p(345, 35), nil, , 900)

	slot0.main_container:addChild(slot0.original_price)
	slot0.main_container:addChild(slot0.discount_price)

	slot4 = slot0.buy_btn:getContentSize()
	slot0.end_price = createRichLabel(22, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot4.width * 0.5, slot4.height * 0.5), nil, , 900)

	slot0.buy_btn:addChild(slot0.end_price)
end

function ActionLimitFullExchangePanel.createNewCell(slot0, slot1, slot2)
	slot3 = ActionLimitFullExchangeItem.new(slot1, slot2)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ActionLimitFullExchangePanel.numberOfCells(slot0)
	if not slot0.limit_list then
		return 0
	end

	return #slot0.limit_list
end

function ActionLimitFullExchangePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.limit_list[slot2] then
		return
	end

	slot4 = slot1:setData(slot3)
end

function ActionLimitFullExchangePanel.onCellTouched(slot0, slot1)
	slot0:countPrice()
end

function ActionLimitFullExchangePanel.holidayTime(slot0, slot1)
	if slot1.args then
		slot2, slot3 = nil

		if keyfind("args_key", 1, slot1.args) or nil then
			slot2 = slot4.args_val
		end

		if keyfind("args_key", 2, slot1.args) or nil then
			slot3 = slot5.args_val
		end

		if slot2 and slot3 then
			slot0.time_val:setString(uv0(TI18N("活动时间：%s 至 %s"), TimeTool.getYMD2(slot2), TimeTool.getYMD2(slot3)))
		end
	end
end

function ActionLimitFullExchangePanel.setLessTime(slot0, slot1)
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
				uv1:setTimeFormatString(0)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(0)
	end
end

function ActionLimitFullExchangePanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(uv0("%s: %s", TI18N("活动时间"), TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.time_val:setString(TI18N("活动时间: 00:00:00"))
	end
end

function ActionLimitFullExchangePanel.register_event(slot0)
	registerButtonEventListener(slot0.buy_btn, function ()
		uv0:onBuyBtn()
	end, true, 2)

	if not slot0.limin_common_event then
		slot0.limin_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0.data = slot0

				uv0:holidayTime(slot0)
				uv0:initData()
			end
		end)
	end
end

function ActionLimitFullExchangePanel.onBuyBtn(slot0)
	if not slot0.limit_list then
		return
	end

	for slot5, slot6 in ipairs(slot0.limit_list) do
		if slot6.add_count and slot6.add_count > 0 then
			uv0({}, {
				id = slot6.aim,
				num = slot6.add_count
			})
		end
	end

	if slot0.end_count > 0 then
		CommonAlert.show(uv2("是否消耗<img src='%s' scale=0.3 />%s购买商品?", PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon), slot0.end_count), TI18N("确定"), function ()
			uv0:sender16665(uv1.holiday_bid, uv2)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		message(TI18N("你还没购买东西呢！"))
	end
end

function ActionLimitFullExchangePanel.initNumUI(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot8 = slot5 or 1
	slot9 = {}
	slot10 = false
	slot11 = false

	function slot12()
		if uv0 and uv1 then
			slot0 = uv2

			for slot4, slot5 in ipairs(uv3) do
				slot5:setScale(uv4)
				slot5:setPositionX(slot0)

				slot0 = slot0 + slot5:getContentSize().width * uv4 + 2
			end
		end
	end

	slot19 = CommonNum.new(28, slot0.main_container, nil, 0, cc.p(0, 0.5))

	slot19:setPositionY(slot2 + 13.5 * slot8 - 2)
	slot19:setCallBack(function ()
		uv0 = true

		uv1()
	end)

	slot20 = CommonNum.new(28, slot0.main_container, nil, 0, cc.p(0, 0.5))

	slot20:setPositionY(slot2 + 13.5 * slot8 - 2)
	slot20:setCallBack(function ()
		uv0 = true

		uv1()
	end)
	uv0(slot9, createSprite(PathTool.getResFrame("actionfullexchange", "txt_cn_actionfullexchange_1"), slot1, slot2, slot0.main_container, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST, 1))
	uv0(slot9, slot19)
	uv0(slot9, createSprite(PathTool.getResFrame("actionfullexchange", "txt_cn_actionfullexchange_2"), -10000, slot2, slot0.main_container, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST, 1))
	uv0(slot9, slot20)
	slot19:setNum(slot3 or 0)
	slot20:setNum(slot4 or 0)

	return slot19, slot20
end

function ActionLimitFullExchangePanel.countPrice(slot0)
	for slot5, slot6 in ipairs(slot0.limit_list) do
		if slot6.add_count and slot6.add_count > 0 then
			slot1 = 0 + slot6.show_price * slot6.add_count
		end
	end

	slot0.original_count = slot1
	slot0.discount_count = 0

	if slot0.full_exchange_list then
		for slot5, slot6 in ipairs(slot0.full_exchange_list) do
			if slot5 == 1 and slot1 < slot6.min then
				slot0.discount_count = 0

				break
			elseif slot6.min <= slot1 and slot1 <= slot6.max then
				slot0.discount_count = slot6.val

				break
			end

			if slot5 >= #slot0.full_exchange_list and slot6.max < slot1 then
				slot0.discount_count = slot6.val
			end
		end
	end

	slot0.end_count = slot0.original_count - slot0.discount_count
	slot3 = PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon)

	slot0.original_price:setString(uv0("%s <img src=%s visible=true scale=0.25 />%s", TI18N("原价"), slot3, slot0.original_count))
	slot0.discount_price:setString(uv0("%s <img src=%s visible=true scale=0.25 />%s", TI18N("减免"), slot3, slot0.discount_count))
	slot0.end_price:setString(uv0("<img src=%s visible=true scale=0.25 /><div div fontColor=#ffffff outline=2,#2B610D>%s %s</div>", slot3, slot0.end_count, TI18N("结算")))
end

function ActionLimitFullExchangePanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		uv0:sender16666(slot0.holiday_bid)
		uv0:cs16603(slot0.holiday_bid)
	end
end

function ActionLimitFullExchangePanel.initData(slot0)
	if slot0.data then
		slot0.limit_list = {}

		for slot4, slot5 in ipairs(slot0.data.aim_list) do
			if slot0.dic_limit_list[slot5.aim] == nil then
				slot0.dic_limit_list[slot5.aim] = slot5
				slot6 = slot0.dic_limit_list[slot5.aim]
			else
				for slot10, slot11 in pairs(slot5) do
					slot6[slot10] = slot11
				end
			end

			slot6.limit_count = 0
			slot6.had_count = 0
			slot6.show_price = 0
			slot6.add_count = 0

			for slot10, slot11 in ipairs(slot5.aim_args) do
				if slot11.aim_args_key == 2 then
					slot6.limit_count = slot11.aim_args_val
				elseif slot11.aim_args_key == 6 then
					slot6.had_count = slot11.aim_args_val
				elseif slot11.aim_args_key == 27 then
					slot6.show_price = slot11.aim_args_val
				elseif slot11.aim_args_key == 7 then
					slot6.limit_buy_type = slot11.aim_args_val
				end
			end

			slot6.buy_count = slot6.limit_count - slot6.had_count

			if slot6.buy_count < 0 then
				slot6.buy_count = 0
			end

			if slot6.buy_count == 0 then
				slot6.sort_index = 2
			else
				slot6.sort_index = 1
			end

			uv0(slot0.limit_list, slot6)
		end

		uv1(slot0.limit_list, SortTools.tableLowerSorter({
			"sort_index",
			"aim"
		}))
		slot0.item_scrollview:reloadData()
		slot0:countPrice()
	end
end

function ActionLimitFullExchangePanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.limin_common_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_common_event)

		slot0.limin_common_event = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.remove_full_num_label then
		for slot4, slot5 in ipairs(slot0.remove_full_num_label) do
			slot5:DeleteMe()
		end

		slot0.remove_full_num_label = nil
	end

	if slot0.remove_reduce_num_label then
		for slot4, slot5 in ipairs(slot0.remove_reduce_num_label) do
			slot5:DeleteMe()
		end

		slot0.remove_reduce_num_label = nil
	end
end

ActionLimitFullExchangeItem = class("ActionLimitFullExchangeItem", function ()
	return ccui.Widget:create()
end)

function ActionLimitFullExchangeItem.ctor(slot0, slot1, slot2)
	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ActionLimitFullExchangeItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_limit_full_exchange_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot4 = slot0.root_wnd:getChildByName("main_container")
	slot0.item_bg_1 = slot4:getChildByName("item_bg_1")
	slot0.btn_redu = slot0.item_bg_1:getChildByName("btn_redu")
	slot0.btn_add = slot0.item_bg_1:getChildByName("btn_add")
	slot0.pic_has = slot4:getChildByName("pic_has")

	slot0.pic_has:setVisible(false)

	slot0.item_info = BackPackItem.new(false, true, false, 0.9, false, true, false)

	slot0.item_info:setDefaultTip(true, false)
	slot4:getChildByName("item_node"):addChild(slot0.item_info)

	slot0.item_name = slot4:getChildByName("item_name")

	slot0.item_name:setString("道具名字")

	slot0.item_price = slot4:getChildByName("item_price")
	slot0.buy_num = slot4:getChildByName("buy_num")
	slot0.limit_name = slot4:getChildByName("limit_name")
	slot0.buy_icon = slot4:getChildByName("buy_icon")
	slot7 = createEditBox(slot4, PathTool.getResFrame("common", "common_99998"), cc.size(90, 30), nil, 22, nil, 22, "", nil, , LOADTEXT_TYPE_PLIST)
	slot0.edit_content = slot7

	slot7:setAnchorPoint(cc.p(0.5, 0.5))
	slot7:setPlaceholderFontColor(cc.c4b(255, 246, 228, 255))
	slot7:setFontColor(cc.c4b(255, 246, 228, 255))
	slot7:setPosition(cc.p(234, 65))

	slot8 = false

	slot7:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			if uv0 then
				uv0 = false

				uv1.buy_num:setVisible(true)
				slot1:setText("")

				if slot1:getText() ~= "" and slot2 ~= uv1.input_text then
					if tonumber(slot2) ~= nil and slot3 > 0 then
						uv1:checkShowNum(slot3)
					else
						uv1:checkShowNum(0)
						message(TI18N("请输入数字"))
					end
				else
					uv1:checkShowNum(0)
				end
			end
		elseif slot0 == "began" then
			if not uv0 then
				uv1.buy_num:setVisible(false)

				uv0 = true
			end
		elseif slot0 == "changed" then
			-- Nothing
		end
	end)
end

function ActionLimitFullExchangeItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0:onClickReduBtn()
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0:onClickAddBtn()
	end, true, 1)
end

function ActionLimitFullExchangeItem.onClickReduBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.add_count then
		return
	end

	slot0.data.add_count = slot0.data.add_count - 1

	if slot0.data.add_count < 0 then
		slot0.data.add_count = 0
	end

	slot0:updateLabelNum(slot0.data.add_count)
end

function ActionLimitFullExchangeItem.onClickAddBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.add_count then
		return
	end

	slot0.data.add_count = slot0.data.add_count + 1

	if slot0.data.buy_count < slot0.data.add_count then
		slot0.data.add_count = slot0.data.buy_count
	end

	slot0:updateLabelNum(slot0.data.add_count)
end

function ActionLimitFullExchangeItem.checkShowNum(slot0, slot1)
	if math.floor(math.abs(slot1)) < 0 then
		slot2 = 0
	elseif slot0.data.buy_count < slot2 then
		slot2 = slot0.data.buy_count
	end

	slot0.data.add_count = slot2

	slot0:updateLabelNum(slot0.data.add_count)
end

function ActionLimitFullExchangeItem.updateLabelNum(slot0, slot1)
	if slot0.data.buy_count == 0 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(true)
		slot0.buy_num:setString(0)
		slot0.item_info:setItemIconUnEnabled(true)
		slot0.edit_content:setVisible(false)

		return
	end

	if slot1 == 0 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(false)
	elseif slot1 == slot0.data.buy_count then
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(true)
	else
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(false)
	end

	slot0.edit_content:setVisible(true)
	slot0.item_info:setItemIconUnEnabled(false)
	slot0.buy_num:setString(slot1)

	if slot0.callback then
		slot0.callback()
	end
end

function ActionLimitFullExchangeItem.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function ActionLimitFullExchangeItem.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function ActionLimitFullExchangeItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ActionLimitFullExchangeItem.setActionRankCommonType(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
end

function ActionLimitFullExchangeItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.buy_icon:setScale(0.3)
	loadSpriteTexture(slot0.buy_icon, PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon), LOADTEXT_TYPE)
	slot0.item_name:setString(slot0.data.aim_str)
	slot0.item_price:setString(slot0.data.show_price)

	if slot0.data.limit_buy_type == 2 then
		slot0.limit_name:setString(uv0(TI18N("活动限购(%s/%s)"), slot0.data.had_count, slot0.data.limit_count))
	else
		slot0.limit_name:setString(uv0(TI18N("今日限购(%s/%s)"), slot0.data.had_count, slot0.data.limit_count))
	end

	if slot0.data.item_list and next(slot0.data.item_list) ~= nil then
		slot0.item_info:setBaseData(slot0.data.item_list[1].bid, slot0.data.item_list[1].num, true)
	end

	slot0:updateLabelNum(slot0.data.add_count)
end

function ActionLimitFullExchangeItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
