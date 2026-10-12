GuildmarketplaceMainWindow = GuildmarketplaceMainWindow or BaseClass(BaseView)
slot1 = GuildmarketplaceController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil
slot6 = math.floor
slot7 = math.random
slot8 = math.randomseed

function GuildmarketplaceMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildmarketplace", "guildmarketplace"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildmarketplace/guildmarketplace_main_window"
	slot0.tab_list = {}
	slot0.dic_marketplace_id = {}
	slot0.dic_list_data = {}
	slot0.dic_limit_buy = {}
	slot0.record_put_message = {}
	slot0.message_label_list = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.guild_change_item_id = 36

	if Config.GuildMarketplaceData.data_const.guild_change_item_id then
		slot0.guild_change_item_id = slot1.val
	end

	slot0.chat_Interval_time = 5

	if Config.GuildMarketplaceData.data_const.chat_Interval_time then
		slot0.chat_Interval_time = slot2.val
	end

	slot0.change_action_time = 5

	if Config.GuildMarketplaceData.data_const.change_action_time then
		slot0.change_action_time = slot3.val
	end

	slot0.action_keep_time1 = 5

	if Config.GuildMarketplaceData.data_const.action_keep_time1 then
		slot0.action_keep_time1 = slot4.val
	end

	slot0.action_keep_time2 = 5

	if Config.GuildMarketplaceData.data_const.action_keep_time2 then
		slot0.action_keep_time2 = slot5.val
	end

	slot0.action_time_step_1 = 0
	slot0.action_time_step_2 = 0
end

function GuildmarketplaceMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.item_load_bg = loadImageTextureFromCDN(slot0.background, PathTool.getPlistImgForDownLoad("bigbg/guildmarketplace", "guildmarketplace_bg", false), ResourcesType.single, slot0.item_load_bg)
	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.look_btn = slot0.container:getChildByName("look_btn")
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.chat_label = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0.5, 0.5), cc.p(403, 91), nil, nil, 210)

	slot0.top_panel:addChild(slot0.chat_label)
	slot0.chat_label:setString(TI18N("欢迎光临"))

	slot0.record_info_btn = createRichLabel(22, cc.c4b(21, 126, 34, 255), cc.p(0.5, 0.5), cc.p(280, -128))

	slot0.record_info_btn:setString(uv0("<div href=xxx>%s</div>", TI18N("查看详情")))
	slot0.record_info_btn:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:openGuildmarketplaceRecordInfoPanel(true, {
			message_data = uv1.message_data
		})
	end, {
		"click",
		"href"
	})
	slot0.top_panel:addChild(slot0.record_info_btn)

	slot0.spine_btn = slot0.top_panel:getChildByName("spine_btn")
	slot0.spine_node = slot0.top_panel:getChildByName("spine_node")

	slot0.spine_node:setPosition(547, -287)

	slot0.role_spine = createEffectSpine("E24126", cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action_1)

	slot0.spine_node:addChild(slot0.role_spine)
	slot0:initSpineTime()

	slot0.lay_bg = slot0.top_panel:getChildByName("lay_bg")
	slot0.lay_srollview = slot0.top_panel:getChildByName("lay_srollview")
	slot0.tab_container = slot0.top_panel:getChildByName("tab_container")
	slot3 = {
		TI18N("碎片"),
		TI18N("装备"),
		TI18N("战技"),
		TI18N("道具")
	}
	slot0.tab_index_type = {
		GuildmarketplaceConst.BagType.eHero,
		GuildmarketplaceConst.BagType.eEquips,
		GuildmarketplaceConst.BagType.eSpecial,
		GuildmarketplaceConst.BagType.eProps
	}
	slot0.tab_type_index = {}

	for slot7, slot8 in pairs(slot0.tab_index_type) do
		slot0.tab_type_index[slot8] = slot7
	end

	for slot7 = 1, 4 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot7) then
			slot9 = {
				select_bg = slot8:getChildByName("select_img")
			}

			slot9.select_bg:setVisible(false)

			slot9.unselect_bg = slot8:getChildByName("normal_img")
			slot9.label = slot8:getChildByName("label")

			slot9.label:setTextColor(cc.c4b(62, 38, 133, 255))

			if slot3[slot7] then
				slot9.label:setString(slot3[slot7])
			end

			slot9.tab_btn = slot8
			slot9.index = slot7
			slot0.tab_list[slot7] = slot9
		end
	end

	slot0.put_btn = slot0.top_panel:getChildByName("put_btn")
	slot0.put_btn_label = slot0.put_btn:getChildByName("label")

	slot0.put_btn_label:setString(TI18N("放入物品"))
	slot0.top_panel:getChildByName("record_title"):setString(TI18N("交易记录"))

	slot0.item_bg = slot0.top_panel:getChildByName("item_bg")
	slot0.item_icon = slot0.item_bg:getChildByName("icon")
	slot0.item_count = slot0.item_bg:getChildByName("count")

	if Config.ItemData.data_get_data(slot0.guild_change_item_id) then
		loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot4.icon, false), LOADTEXT_TYPE)
	end

	slot0.message_size = cc.size(300, 110)
	slot0.message_scroll_view = createScrollView(slot0.message_size.width, slot0.message_size.height, 32, -116, slot0.top_panel, ScrollViewDir.vertical)

	slot0:adaptationScreen()
end

function GuildmarketplaceMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.container)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())

	slot7 = slot0.lay_bg:getContentSize()
	slot8 = slot1 - slot0.container_size.height - slot2

	slot0.lay_bg:setContentSize(cc.size(slot7.width, slot7.height + slot8))

	slot9 = slot0.lay_srollview:getContentSize()

	slot0.lay_srollview:setContentSize(cc.size(slot9.width, slot9.height + slot8))
	slot0.put_btn:setPositionY(slot0.put_btn:getPositionY() - slot8)
	slot0.item_bg:setPositionY(slot0.item_bg:getPositionY() - slot8)
end

function GuildmarketplaceMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, REGISTER_BUTTON_SOUND_CLOSED_TYPY)
	registerButtonEventListener(slot0.put_btn, handler(slot0, slot0.onClickPutBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.spine_btn, handler(slot0, slot0.onClickSpineBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	slot4 = handler(slot0, slot0.onClickRuleBtn)
	slot5 = true

	registerButtonEventListener(slot0.look_btn, slot4, slot5, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	for slot4, slot5 in ipairs(slot0.tab_list) do
		registerButtonEventListener(slot5.tab_btn, function ()
			uv0:changeSelectedTab(uv1.index)
		end, false, 2)
	end

	slot0:addGlobalEvent(GuildmarketplaceEvent.GUILD_MARKET_PLACE_ITEM_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setScdata(slot0)
	end)
	slot0:addGlobalEvent(GuildmarketplaceEvent.GUILD_MARKET_PLACE_MESSAGE_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.message_data = slot0

		uv0:updateMessageInfo(slot0)
		GlobalEvent:getInstance():Fire(GuildmarketplaceEvent.GUILD_MARKET_PLACE_MESSAGE_EVENT2, uv0.message_data)
	end)

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "brave_symbol" then
				uv0:updateItemInfo()
			end
		end)
	end
end

function GuildmarketplaceMainWindow.onClickCloseBtn(slot0)
	uv0:openGuildmarketplaceMainWindow(false)
end

function GuildmarketplaceMainWindow.onClickRuleBtn(slot0)
	MainuiController:getInstance():openCommonExplainView(true, Config.GuildMarketplaceData.data_explain)
end

function GuildmarketplaceMainWindow.onClickPutBtn(slot0)
	if not slot0.message_data then
		return
	end

	uv0:openGuildmarketplacePutItemWindow(true, {
		message_data = slot0.message_data
	})
end

function GuildmarketplaceMainWindow.onClickSpineBtn(slot0)
	if slot0.is_keep_action_3 then
		return
	end

	slot0.is_keep_action_3 = true

	slot0.top_panel:stopAllActions()
	slot0.role_spine:setAnimation(0, PlayerAction.action_3, true)
	slot0:setChatByAction(3)
	delayRun(slot0.top_panel, slot0.action_keep_time2, function ()
		uv0.is_keep_action_3 = false

		uv0:clearActionTime()

		uv0.action_time_step_1 = uv0.chat_Interval_time

		uv0.role_spine:setAnimation(0, PlayerAction.action_1, true)
		uv0:setChatByAction(1)
	end)
end

function GuildmarketplaceMainWindow.initSpineTime(slot0)
	slot0:clearActionTime()

	if slot0.time_ticket == nil then
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			if not uv0.role_spine then
				return
			end

			if uv0.is_keep_action_2 or uv0.is_keep_action_3 then
				return
			end

			uv0.action_time_step_1 = uv0.action_time_step_1 + 1
			uv0.action_time_step_2 = uv0.action_time_step_2 + 1

			if uv0.change_action_time <= uv0.action_time_step_2 then
				uv0.is_keep_action_2 = true

				uv0.top_panel:stopAllActions()
				uv0.role_spine:setAnimation(0, PlayerAction.action_2, true)
				uv0:setChatByAction(2)
				delayRun(uv0.top_panel, uv0.action_keep_time1, function ()
					uv0.is_keep_action_2 = false

					uv0:clearActionTime()

					uv0.action_time_step_1 = uv0.chat_Interval_time

					uv0.role_spine:setAnimation(0, PlayerAction.action_1, true)
					uv0:setChatByAction(1)
				end)
			elseif uv0.chat_Interval_time <= uv0.action_time_step_1 then
				uv0:setChatByAction(1)

				uv0.action_time_step_1 = 0
			end
		end, 1)
	end
end

function GuildmarketplaceMainWindow.setChatByAction(slot0, slot1)
	if Config.GuildMarketplaceData.data_landlady_info[slot1] then
		for slot7, slot8 in ipairs(slot2) do
			slot3 = 0 + slot8.weight
		end

		if slot3 <= 1 then
			return
		end

		uv0(os.time())

		slot4 = uv1(1, slot3)
		slot5 = 0

		for slot9, slot10 in ipairs(slot2) do
			if slot5 < slot4 and slot4 <= slot5 + slot10.weight then
				if slot0.chat_label then
					slot0.chat_label:setString(slot10.content)
				end

				return
			end

			slot5 = slot5 + slot10.weight
		end
	end
end

function GuildmarketplaceMainWindow.clearActionTime(slot0)
	slot0.action_time_step_1 = 0
	slot0.action_time_step_2 = 0
end

function GuildmarketplaceMainWindow.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function GuildmarketplaceMainWindow.changeSelectedTab(slot0, slot1, slot2)
	if not slot2 and slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.label:setTextColor(cc.c4b(62, 38, 133, 255))

		slot0.tab_object = nil
	end

	slot0.tab_index = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.label:setTextColor(cc.c4b(99, 83, 201, 255))
	end

	slot0.show_list = slot0.dic_list_data[slot1] or {}

	slot0:updateItemlist()
end

function GuildmarketplaceMainWindow.openRootWnd(slot0, slot1)
	if not slot0.tab_index_type then
		return
	end

	slot0.tab_index = slot0.tab_type_index[(slot1 or {}).bag_type or GuildmarketplaceConst.BagType.eHero] or 1

	uv0:sender26900()
	uv0:sender26903()
	slot0:updateItemInfo()
end

function GuildmarketplaceMainWindow.updateMessageInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if next(slot1.board_list) == nil then
		commonShowEmptyIcon(slot0.message_scroll_view, true, {
			font_size = 16,
			offset_y = 50,
			scale = 0.4,
			text = TI18N("暂无记录信息")
		})

		return
	else
		commonShowEmptyIcon(slot0.message_scroll_view, false)
	end

	uv0(slot2, function (slot0, slot1)
		return slot1.unixtime < slot0.unixtime
	end)

	slot3 = {}
	slot4 = 1
	slot5 = 10

	for slot9, slot10 in ipairs(slot2) do
		if slot10.type == GuildmarketplaceConst.RewardRecordType.ePlay then
			for slot14, slot15 in ipairs(slot10.reward_list) do
				if Config.ItemData.data_get_data(slot15.base_id) then
					if slot10.operation == 1 then
						uv2(slot3, uv1(TI18N(" <div fontcolor=#289B14>%s</div>放入<div fontcolor=%s>%sx%s</div>"), slot10.name, BackPackConst.getWhiteQualityColorStr(slot16.quality), slot16.name, slot15.num))

						if slot5 < slot4 + 1 then
							break
						end
					elseif slot10.operation == 2 then
						uv2(slot3, uv1(TI18N(" <div fontcolor=#289B14>%s</div>兑换<div fontcolor=%s>%sx%s</div>"), slot10.name, slot17, slot16.name, slot15.num))

						if slot5 < slot4 + 1 then
							break
						end
					end
				end
			end
		elseif slot10.type == GuildmarketplaceConst.RewardRecordType.eSystem then
			for slot14, slot15 in ipairs(slot10.reward_list) do
				if Config.ItemData.data_get_data(slot15.base_id) then
					if slot10.operation == 3 then
						uv2(slot3, uv1(TI18N(" <div fontcolor=%s>%sx%s</div>已过期下架"), BackPackConst.getWhiteQualityColorStr(slot16.quality), slot16.name, slot15.num))

						if slot5 < slot4 + 1 then
							break
						end
					end
				end
			end
		elseif slot10.operation == 1 then
			slot15 = slot10.name

			for slot15, slot16 in ipairs(slot10.reward_list) do
				if Config.ItemData.data_get_data(slot16.base_id) then
					slot11 = uv3:getStrByType(slot10.type, slot15) .. uv1(" \n <div fontcolor=%s>%sx%s</div>", BackPackConst.getWhiteQualityColorStr(slot17.quality), slot17.name, slot16.num)
				end
			end

			uv2(slot3, slot11)

			if slot5 < slot4 + 1 then
				break
			end
		end

		if slot5 < slot4 then
			break
		end
	end

	slot0.message_scroll_view:stopAllActions()

	for slot9, slot10 in ipairs(slot0.message_label_list) do
		slot10:setPositionY(-1000)
	end

	slot11 = cc.size

	slot0.message_scroll_view:setInnerContainerSize(slot11(slot0.message_size.width, slot0.message_size.height))

	for slot11, slot12 in ipairs(slot3) do
		if slot11 <= 5 and slot0.message_label_list[slot11] then
			slot0.message_label_list[slot11]:setString(slot12)
			slot0.message_label_list[slot11]:setPositionY(slot0.message_size.height - (0 + slot0.message_label_list[slot11]:getContentSize().height + 5))
		else
			delayRun(slot0.message_scroll_view, slot11 / display.DEFAULT_FPS, function ()
				if uv0.message_label_list[uv1] == nil then
					uv0.message_label_list[uv1] = createRichLabel(18, cc.c4b(144, 93, 56, 255), cc.p(0, 1), cc.p(0, 0), 4, nil, 300)

					uv0.message_scroll_view:addChild(uv0.message_label_list[uv1])
				end

				uv0.message_label_list[uv1]:setString(uv2)

				uv3 = uv3 + uv0.message_label_list[uv1]:getContentSize().height + uv4

				if uv3 <= uv0.message_size.height then
					uv0.message_label_list[uv1]:setPositionY(uv0.message_size.height - uv3)
				else
					slot5 = cc.size

					uv0.message_scroll_view:setInnerContainerSize(slot5(uv0.message_size.width, uv3))

					slot1 = 0

					for slot5 = 1, uv1 do
						if uv0.message_label_list[slot5] then
							uv0.message_label_list[slot5]:setPositionY(uv3 - slot1)

							slot1 = slot1 + uv0.message_label_list[slot5]:getContentSize().height + uv4
						end
					end
				end
			end)
		end
	end
end

function GuildmarketplaceMainWindow.createLabelData(slot0, slot1)
	if slot0.test_lable == nil then
		slot0.test_lable = createRichLabel(18, cc.c4b(71, 44, 30, 255), cc.p(0, 1), cc.p(-1000, 0), 4, nil, 300)

		slot0.top_panel:addChild(slot0.test_lable)
	end

	slot1 = slot1 or ""

	slot0.test_lable:setString(slot1)

	return {
		str = slot1,
		height = slot0.test_lable:getContentSize().height
	}
end

function GuildmarketplaceMainWindow.updateItemInfo(slot0)
	if not slot0.guild_change_item_id then
		return
	end

	slot0.item_count:setString(MoneyTool.GetMoneyString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.guild_change_item_id) or 0))
end

function GuildmarketplaceMainWindow.setScdata(slot0, slot1)
	slot3 = {}
	slot4 = slot0.tab_index
	slot5 = false

	for slot9, slot10 in ipairs(slot1.item_list) do
		if slot0.dic_marketplace_id[slot10.id] then
			if slot10.end_time then
				uv0(slot10.end_time, function (slot0, slot1)
					return slot0.end_unixtime < slot1.end_unixtime
				end)

				slot0.dic_marketplace_id[slot10.id].end_time = slot10.end_time
			end

			if slot0.dic_marketplace_id[slot10.id].market_item_config then
				slot4 = slot0.tab_type_index[slot0.dic_marketplace_id[slot10.id].market_item_config.type] or slot0.tab_index
			end

			slot0.dic_marketplace_id[slot10.id].quantity = slot10.num

			if slot10.num == 0 then
				slot0.dic_marketplace_id[slot10.id]:DeleteMe()

				slot0.dic_marketplace_id[slot10.id] = nil
				slot5 = true
			end
		elseif Config.GuildMarketplaceData.data_item_info(slot10.base_id) then
			slot10.market_item_config = slot11
			slot10.quantity = slot10.num
			slot10.extra_attr = slot10.extra

			uv0(slot10.end_time, function (slot0, slot1)
				return slot0.end_unixtime < slot1.end_unixtime
			end)

			slot12 = GoodsVo.New()

			slot12:initAttrData(slot10)

			slot0.dic_marketplace_id[slot10.id] = slot12
			slot5 = true

			if slot0.is_init then
				slot4 = slot0.tab_type_index[slot0.dic_marketplace_id[slot10.id].market_item_config.type] or slot0.tab_index
			else
				slot3[slot0.tab_type_index[slot0.dic_marketplace_id[slot10.id].market_item_config.type] or slot0.tab_index] = true
			end
		end
	end

	if slot1.day_buy then
		for slot9, slot10 in ipairs(slot1.day_buy) do
			slot0.dic_limit_buy[slot10.base_id] = slot10.num
		end
	end

	if not slot0.is_init then
		slot0.is_init = true
		slot5 = true

		if next(slot3) ~= nil and slot3[slot0.tab_index] == nil then
			for slot9, slot10 in ipairs(slot0.tab_index_type) do
				if slot3[slot9] then
					slot0.tab_index = slot9
					slot4 = slot0.tab_index

					break
				end
			end
		end
	end

	if slot5 then
		slot0.dic_list_data = {}

		for slot9 = 1, 4 do
			slot0.dic_list_data[slot9] = {}
		end

		for slot9, slot10 in pairs(slot0.dic_marketplace_id) do
			if slot10.config and slot0.dic_list_data[slot0.tab_type_index[slot10.market_item_config.type]] then
				uv1(slot0.dic_list_data[slot11], slot10)
			end
		end

		for slot9, slot10 in pairs(slot0.dic_list_data) do
			slot11 = nil

			if slot0.tab_index_type[slot9] == GuildmarketplaceConst.BagType.eHero then
				slot11 = SortTools.tableCommonSorter({
					{
						"quality",
						true
					},
					{
						"lev",
						false
					},
					{
						"base_id",
						false
					}
				})
			elseif slot12 == GuildmarketplaceConst.BagType.eEquips then
				slot11 = SortTools.tableUpperSorter({
					"quality",
					"eqm_star"
				})
			elseif slot12 == GuildmarketplaceConst.BagType.eSpecial then
				function slot11(slot0, slot1)
					return slot1.quality < slot0.quality
				end
			elseif slot12 == GuildmarketplaceConst.BagType.eProps then
				slot11 = SortTools.tableUpperSorter({
					"quality",
					"sort",
					"base_id"
				})
			end

			if slot11 then
				uv0(slot10, slot11)
			end
		end

		slot0:changeSelectedTab(slot4, true)
	elseif slot4 ~= slot0.tab_index then
		slot0:changeSelectedTab(slot4, true)
	elseif slot0.scrollview_list then
		slot0.scrollview_list:resetCurrentItems()
	end
end

function GuildmarketplaceMainWindow.updateItemlist(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 622,
			item_height = 220,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			label_color = cc.c3b(255, 243, 217)
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function GuildmarketplaceMainWindow.createNewCell(slot0, slot1, slot2)
	return GuildmarketplaceItem.new(slot1, slot2, slot0)
end

function GuildmarketplaceMainWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return uv0(#slot0.show_list / 4)
end

function GuildmarketplaceMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1:setData(slot0.show_list[(slot2 - 1) * 4 + 1], slot0.show_list[(slot2 - 1) * 4 + 2], slot0.show_list[(slot2 - 1) * 4 + 3], slot0.show_list[(slot2 - 1) * 4 + 4])
end

function GuildmarketplaceMainWindow.close_callback(slot0)
	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	if slot0.item_load_bg then
		slot0.item_load_bg:DeleteMe()
	end

	slot0.item_load_bg = nil

	if slot0.item_load_record_bg then
		slot0.item_load_record_bg:DeleteMe()
	end

	slot0.item_load_record_bg = nil

	if slot0.item_load_chat_bg then
		slot0.item_load_chat_bg:DeleteMe()
	end

	slot0.item_load_chat_bg = nil

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()
	end

	slot0.item_load1 = nil

	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()
	end

	slot0.scrollview_list = nil

	if slot0.dic_marketplace_id then
		for slot4, slot5 in pairs(slot0.dic_marketplace_id) do
			slot5:DeleteMe()
		end

		slot0.dic_marketplace_id = nil
	end

	slot0:clearTimeTicket()
	uv0:openGuildmarketplaceMainWindow(false)
end

GuildmarketplaceItem = class("GuildmarketplaceItem", function ()
	return ccui.Widget:create()
end)

function GuildmarketplaceItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function GuildmarketplaceItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildmarketplace/guildmarketplace_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot7 = "title_name"
	slot0.title_name = slot0.main_container:getChildByName(slot7)
	slot0.item_load_list = {}
	slot0.item_list = {}

	for slot7 = 1, 4 do
		slot8 = slot0.main_container:getChildByName("item_bg_" .. slot7)
		slot0.item_list[slot7] = {
			item_btn = slot8
		}

		slot0.item_list[slot7].item_btn:setSwallowTouches(false)

		slot0.item_list[slot7].item = BackPackItem.new(true, true, false, 0.8)

		slot0.item_list[slot7].item:addBtnCallBack(function ()
			uv0:onClickTipsBtn(uv1)
		end)
		slot8:getChildByName("item_node"):addChild(slot0.item_list[slot7].item)

		slot0.item_list[slot7].time_out_img = slot8:getChildByName("time_out_img")
		slot0.item_list[slot7].cost_icon = slot8:getChildByName("cost_icon")
		slot0.item_list[slot7].cost_count = slot8:getChildByName("cost_count")
		slot0.item_list[slot7].have_count = slot8:getChildByName("have_count")

		slot0.item_list[slot7].have_count:setString("")
		slot0.item_list[slot7].time_out_img:setVisible(false)
		slot0.item_list[slot7].cost_count:setString("")
	end
end

function GuildmarketplaceItem.register_event(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		registerButtonEventListener(slot5.item_btn, function ()
			uv0:onClickItemBtn(uv1)
		end, false, 1, nil, nil, nil, true)
	end
end

function GuildmarketplaceItem.onClickTipsBtn(slot0, slot1)
	if slot0["data" .. slot1] then
		if slot2.market_item_config.day_buy and slot2.market_item_config.day_buy ~= 0 then
			slot2.limit_day = slot0.parent.dic_limit_buy[slot2.base_id] or 0

			if slot2.limit_day < 0 then
				slot2.limit_day = 0
			end

			slot2.limit_total_num = slot2.market_item_config.day_buy
		end

		if BackPackConst.checkIsEquip(slot2.config.type) then
			slot2.is_market_place = true

			HeroController:getInstance():openEquipTips(true, slot2)
		elseif slot2.config.type == BackPackConst.item_type.ARTIFACTCHIPS then
			HeroController:getInstance():openArtifactTipsWindow(true, slot2, PartnerConst.ArtifactTips.buy, 0, 1, false, {
				is_market_place = true
			})
		else
			TipsManager:showGoodsTips(slot2, false, 0, {
				is_market_place = true
			})
		end
	end
end

function GuildmarketplaceItem.onClickItemBtn(slot0, slot1)
	if slot0["data" .. slot1] then
		slot3 = {
			goods_id = slot2.id,
			item_id = slot2.base_id,
			item_count = slot2.market_item_config.radio,
			limit_num = uv0(slot2.quantity / slot2.market_item_config.radio),
			price_item_id = slot2.market_item_config.price[1][1] or 1,
			price = slot2.market_item_config.price[1][2] or 1
		}

		if slot2.market_item_config and next(slot2.market_item_config.price) ~= nil then
			-- Nothing
		else
			slot3.price_item_id = 1
			slot3.price = 20
		end

		if slot0.parent.guild_change_item_id == slot3.price_item_id then
			if math.floor((BackpackController:getInstance():getModel():getItemNumByBid(slot0.parent.guild_change_item_id) or 0) / slot3.price) <= 0 then
				slot6 = 1
			end

			slot3.limit_num = slot6

			if slot4 < slot3.limit_num then
				slot3.limit_num = slot4
			end
		end

		if next(slot2.end_time) ~= nil then
			slot3.less_time = slot2.end_time[1].end_unixtime
			slot3.less_count = slot2.end_time[1].end_num
		end

		if slot2.market_item_config.day_buy and slot2.market_item_config.day_buy ~= 0 then
			slot3.limit_day = slot0.parent.dic_limit_buy[slot2.base_id] or 0

			if slot3.limit_day < 0 then
				slot3.limit_day = 0
			end

			slot3.limit_total_num = slot2.market_item_config.day_buy
		end

		uv1:openGuildmarketplaceBuyItemPanel(true, slot3, 1)
	end
end

function GuildmarketplaceItem.setData(slot0, slot1, slot2, slot3, slot4)
	slot0.data1 = slot1
	slot0.data2 = slot2
	slot0.data3 = slot3
	slot0.data4 = slot4

	for slot8, slot9 in ipairs(slot0.item_list) do
		if slot0["data" .. slot8] then
			slot9.item_btn:setVisible(true)
			slot9.have_count:setString(TI18N("库存:") .. uv0(slot10.quantity / slot10.market_item_config.radio))
			slot9.item:setBaseData(slot10.base_id, slot10.market_item_config.radio)

			if slot10.market_item_config.day_buy and slot10.market_item_config.day_buy ~= 0 then
				slot9.item:showLeftBiaoQian(true, TI18N("限购"))
			else
				slot9.item:showLeftBiaoQian(false)
			end

			if next(slot10.market_item_config.price) ~= nil then
				slot12 = slot10.market_item_config.price[1][1] or 1
				slot13 = slot10.market_item_config.price[1][2] or 1

				if slot9.record_cost_item_id == nil or slot9.record_cost_item_id ~= slot12 then
					slot9.record_cost_item_id = slot12

					if Config.ItemData.data_get_data(slot12) then
						print(slot14.icon)
						loadSpriteTexture(slot9.cost_icon, PathTool.getItemRes(slot14.icon, false), LOADTEXT_TYPE)
					end
				end

				slot9.cost_count:setString(slot13)
			end
		else
			slot9.item_btn:setVisible(false)
		end
	end
end

function GuildmarketplaceItem.updateItemTimeInfo(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot0["data" .. slot4] then
			if next(slot6.end_time) ~= nil then
				if slot6.end_time[1].end_unixtime - GameNet:getInstance():getTime() <= 0 then
					slot5.time_out_img:setVisible(true)
				else
					slot5.time_out_img:setVisible(false)
				end
			else
				slot5.time_out_img:setVisible(false)
			end
		else
			slot5.time_out_img:setVisible(false)
		end
	end
end

function GuildmarketplaceItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.item:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
