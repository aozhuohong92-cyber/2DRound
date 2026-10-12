GuildmarketplacePutItemWindow = GuildmarketplacePutItemWindow or BaseClass(BaseView)
slot1 = GuildmarketplaceController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil

function GuildmarketplacePutItemWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildmarketplace", "guildmarketplace"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("backpack", "backpack"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "guildmarketplace/guildmarketplace_put_item_window"
	slot0.tab_list = {}
	slot0.dic_item_list = {}
	slot0.message_label_list = {}
end

function GuildmarketplacePutItemWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.item_load_bg = loadImageTextureFromCDN(slot0.background, PathTool.getPlistImgForDownLoad("bigbg/guildmarketplace", "guildmarketplace_bg", false), ResourcesType.single, slot0.item_load_bg)
	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.top_panel = slot0.container:getChildByName("top_panel")
	slot0.left_arrow = slot0.top_panel:getChildByName("left_arrow")
	slot0.right_arrow = slot0.top_panel:getChildByName("right_arrow")
	slot0.order_index_list = {
		{
			order = 1,
			index = BackPackConst.item_tab_type.EQUIPS
		},
		{
			order = 2,
			index = BackPackConst.item_tab_type.PROPS
		},
		{
			order = 3,
			index = BackPackConst.item_tab_type.HERO
		},
		{
			order = 4,
			index = BackPackConst.item_tab_type.SPECIAL
		}
	}
	slot0.tableContainer = slot0.top_panel:getChildByName("tab_container")
	slot4 = slot0.tableContainer:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot0.tableContainer, cc.p(40, 3), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot4.width - 80, slot4.height + 5), {
		start_y = 0,
		item_width = 150,
		start_x = 12,
		space_x = 5,
		row = 1,
		item_height = 84,
		space_y = 0,
		col = 0,
		item_class = CommonTabBtn
	})

	slot0.tab_scrollview.scroll_view:setTouchEnabled(false)
	slot0.tab_scrollview:setData({
		{
			title = TI18N("装备"),
			index = BackPackConst.item_tab_type.EQUIPS
		},
		{
			title = TI18N("道具"),
			index = BackPackConst.item_tab_type.PROPS
		},
		{
			title = TI18N("碎片"),
			index = BackPackConst.item_tab_type.HERO
		},
		{
			title = TI18N("特殊"),
			index = BackPackConst.item_tab_type.SPECIAL
		}
	}, handler(slot0, slot0.changeTabView), nil, {
		default_index = slot0.default_index or BackPackConst.item_tab_type.PROPS,
		tab_size = cc.size(140, 64),
		select_color = cc.c4b(255, 255, 255, 255),
		select_outline = cc.c4b(2, 0, 25, 255),
		normal_color = cc.c4b(248, 194, 60, 255),
		normal_outline = cc.c4b(2, 0, 25, 255),
		select_res = PathTool.getResFrame("backpack", "backpack_3"),
		normal_res = PathTool.getResFrame("backpack", "backpack_2"),
		img_rect = cc.rect(47, 40, 0, 0),
		tab_name = "tab_btn_"
	})
	slot0.tab_scrollview:addEndCallBack(function ()
		uv0.tab_list = uv0.tab_scrollview:getItemList()
	end)

	slot0.spine_node = slot0.top_panel:getChildByName("spine_node")

	slot0.spine_node:setPosition(547, -287)

	slot0.role_spine = createEffectSpine("E24126", cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.action_1)

	slot0.spine_node:addChild(slot0.role_spine)

	slot0.lay_srollview = slot0.top_panel:getChildByName("lay_srollview")

	slot0.top_panel:getChildByName("record_title"):setString(TI18N("交易记录"))

	slot0.message_size = cc.size(300, 130)
	slot0.message_scroll_view = createScrollView(slot0.message_size.width, slot0.message_size.height, 50, -156, slot0.top_panel, ScrollViewDir.vertical)
	slot0.back_bg_2 = slot0.top_panel:getChildByName("back_bg_2")
	slot0.Image_3 = slot0.container:getChildByName("Image_3")
	slot0.Image_3_0 = slot0.container:getChildByName("Image_3_0")

	slot0:adaptationScreen()
end

function GuildmarketplacePutItemWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.container)
	slot2 = display.getBottom(slot0.container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.close_btn:setPositionY(slot2 + slot0.close_btn:getPositionY())
	slot0.Image_3:setPositionY(slot2 + slot0.Image_3:getPositionY())
	slot0.Image_3_0:setPositionY(slot2 + slot0.Image_3_0:getPositionY())

	slot7 = slot0.back_bg_2:getContentSize()
	slot8 = slot1 - slot0.container_size.height - slot2

	slot0.back_bg_2:setContentSize(cc.size(slot7.width, slot7.height + slot8))

	slot9 = slot0.lay_srollview:getContentSize()

	slot0.lay_srollview:setContentSize(cc.size(slot9.width, slot9.height + slot8))
end

function GuildmarketplacePutItemWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.left_arrow, function ()
		uv0:onClickDirBtn(1)
	end, true)
	registerButtonEventListener(slot0.right_arrow, function ()
		uv0:onClickDirBtn(2)
	end, true)
	slot0:addGlobalEvent(GuildmarketplaceEvent.GUILD_MARKET_PLACE_MESSAGE_EVENT2, function (slot0)
		uv0:updateMessageInfo(slot0)
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if not uv0.dic_item_list then
			return
		end

		if not uv0.cur_index then
			return
		end

		uv0.dic_item_list[uv0.cur_index] = nil

		uv0:setPanelData()
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if not uv0.dic_item_list then
			return
		end

		if not uv0.cur_index then
			return
		end

		uv0.dic_item_list[uv0.cur_index] = nil

		uv0:setPanelData()
	end)
end

function GuildmarketplacePutItemWindow.onClickCloseBtn(slot0)
	uv0:openGuildmarketplacePutItemWindow(false)
end

function GuildmarketplacePutItemWindow.onClickDirBtn(slot0, slot1)
	if not slot0.tab_scrollview then
		return
	end

	slot2 = nil

	if slot1 == 1 then
		if slot0.cur_order - 1 < 1 then
			slot2 = 1
		end
	elseif slot1 == 2 and slot0.cur_order + 1 > 6 then
		slot2 = 6
	end

	if slot2 >= 4 then
		slot0.tab_scrollview:scrollToPercentHorizontal(100, 0.3)
	else
		slot0.tab_scrollview:scrollToPercentHorizontal(0, 0.3)
	end

	if slot0.order_index_list[slot2] and slot0.tab_list[slot0.order_index_list[slot2].order] then
		slot0:changeTabView(slot0.tab_list[slot3])
	end
end

function GuildmarketplacePutItemWindow.changeTabView(slot0, slot1)
	if not slot1 or slot1.index == slot0.cur_index then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setBtnSelectStatus(false)
	end

	slot0.cur_tab = slot1
	slot0.cur_index = slot1.index
	slot5 = true

	slot0.cur_tab:setBtnSelectStatus(slot5)

	slot0.cur_order = 1

	for slot5, slot6 in pairs(slot0.order_index_list) do
		if slot6.index == slot1.index then
			slot0.cur_order = slot6.order

			break
		end
	end

	slot0:setPanelData()
end

function GuildmarketplacePutItemWindow.openRootWnd(slot0, slot1)
	slot0:updateMessageInfo((slot1 or {}).message_data or {})
end

function GuildmarketplacePutItemWindow.updateMessageInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}
	slot4 = 1
	slot5 = 10

	for slot9, slot10 in ipairs(slot1.board_list) do
		if slot10.type == GuildmarketplaceConst.RewardRecordType.ePlay then
			for slot14, slot15 in ipairs(slot10.reward_list) do
				if Config.ItemData.data_get_data(slot15.base_id) then
					if slot10.operation == 1 then
						uv1(slot2, uv0(TI18N(" <div fontcolor=#289B14>%s</div>放入<div fontcolor=%s>%sx%s</div>"), slot10.name, BackPackConst.getWhiteQualityColorStr(slot16.quality), slot16.name, slot15.num))

						if slot5 < slot4 + 1 then
							break
						end
					end
				end
			end

			if slot5 < slot4 then
				break
			end
		end
	end

	if next(slot2) == nil then
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

	slot0.message_scroll_view:stopAllActions()

	for slot9, slot10 in ipairs(slot0.message_label_list) do
		slot10:setPositionY(-1000)
	end

	slot11 = cc.size

	slot0.message_scroll_view:setInnerContainerSize(slot11(slot0.message_size.width, slot0.message_size.height))

	for slot11, slot12 in ipairs(slot2) do
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

function GuildmarketplacePutItemWindow.createLabelData(slot0, slot1)
	if slot0.test_lable == nil then
		slot0.test_lable = createRichLabel(18, cc.c4b(134, 79, 53, 255), cc.p(0, 1), cc.p(-1000, 0), 4, nil, 300)

		slot0.top_panel:addChild(slot0.test_lable)
	end

	slot1 = slot1 or ""

	slot0.test_lable:setString(slot1)

	return {
		str = slot1,
		height = slot0.test_lable:getContentSize().height
	}
end

slot6 = Config.PartnerData.data_get_compound_info

function GuildmarketplacePutItemWindow.getHeroSorFunc(slot0)
	function slot1(slot0)
		slot1 = false

		if slot0.quality ~= -1 and slot0.base_id and uv0[slot0.base_id] and uv0[slot0.base_id].num <= slot0.quantity then
			slot1 = true
		end

		return slot1
	end

	return function (slot0, slot1)
		if uv0(slot0) and not uv0(slot1) then
			return true
		elseif not uv0(slot0) and uv0(slot1) then
			return false
		elseif slot0.quality ~= -1 and slot0.base_id and slot1.quality ~= -1 and slot1.base_id then
			if slot0.quality == slot1.quality then
				return slot0.base_id < slot1.base_id
			else
				return slot1.quality < slot0.quality
			end
		elseif slot0.quality ~= -1 and slot0.base_id and slot1.quality == -1 then
			return true
		elseif slot0.quality == -1 and slot1.quality ~= -1 and slot1.base_id then
			return false
		else
			return false
		end
	end
end

function GuildmarketplacePutItemWindow.setPanelData(slot0)
	if slot0.cur_index == BackPackConst.item_tab_type.OTHERS then
		slot0.cur_index = BackPackConst.item_tab_type.EQUIPS
	end

	if slot0.dic_item_list[slot0.cur_index] == nil then
		slot1 = Config.GuildMarketplaceData.data_dic_item_info
		slot6 = true
		slot0.dic_item_list[slot0.cur_index] = {}

		for slot6, slot7 in ipairs(BackpackController:getInstance():getModel():getAllBackPackArray(slot0.cur_index, slot6)) do
			if slot1[slot7.base_id] and slot1[slot7.base_id] == 1 then
				uv0(slot0.dic_item_list[slot0.cur_index], slot7)
			end
		end

		if slot0.cur_index == BackPackConst.item_tab_type.EQUIPS then
			sort_func = SortTools.tableUpperSorter({
				"quality",
				"sort"
			})
		elseif slot0.cur_index == BackPackConst.item_tab_type.PROPS then
			sort_func = SortTools.tableUpperSorter({
				"quality",
				"sort",
				"base_id"
			})
		elseif slot0.cur_index == BackPackConst.item_tab_type.HERO then
			sort_func = slot0:getHeroSorFunc()
		elseif slot0.cur_index == BackPackConst.item_tab_type.SPECIAL then
			function sort_func(slot0, slot1)
				return slot1.quality < slot0.quality
			end
		elseif slot0.cur_index == BackPackConst.item_tab_type.HOLYEQUIPMENT then
			-- Nothing
		elseif slot0.cur_index ~= BackPackConst.item_tab_type.ELFIN then
			print("类型出错了:" .. slot0.cur_index)

			return
		end

		uv1(slot0.dic_item_list[slot0.cur_index], sort_func)
	end

	slot0.show_list = slot0.dic_item_list[slot0.cur_index] or {}

	slot0:updateItemlist()
end

function GuildmarketplacePutItemWindow.updateItemlist(slot0)
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
			item_width = 124,
			item_height = 130,
			space_y = 0,
			col = 5
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.scrollview_list:reloadData()
end

function GuildmarketplacePutItemWindow.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new(true, true, false, 1)

	slot3:setSwallowTouches(false)
	slot3:setDefaultTip()
	slot3:addBtnCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function GuildmarketplacePutItemWindow.numberOfCells(slot0)
	if #slot0.show_list < 20 then
		slot1 = 20

		if slot0.lay_srollview and math.floor(slot0.lay_srollview:getContentSize().height / 130) * 5 > 20 then
			slot1 = slot3 * 5
		end
	end

	return slot1
end

function GuildmarketplacePutItemWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3)
	else
		slot1:suspendAllActions()
	end
end

function GuildmarketplacePutItemWindow.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		if slot3.config.type == BackPackConst.item_type.ARTIFACTCHIPS then
			HeroController:getInstance():openArtifactTipsWindow(true, slot3, PartnerConst.ArtifactTips.sell, 0, 1, false, {
				is_market_place = true
			})
		elseif Config.GuildMarketplaceData.data_item_info(slot3.base_id) then
			if math.floor(slot3.quantity / slot4.radio) <= 0 then
				message(TI18N("物品数量不足一组，无法放入"))

				return
			end

			if slot4 and next(slot4.sell) ~= nil then
				-- Nothing
			else
				slot6.price_item_id = 1
				slot6.price = 20
			end

			uv0:openGuildmarketplaceBuyItemPanel(true, {
				goods_id = slot3.id,
				item_id = slot3.base_id,
				item_count = slot4.radio,
				limit_num = slot5,
				price_item_id = slot4.sell[1][1] or 1,
				price = slot4.sell[1][2] or 1
			}, 2)
		end
	end
end

function GuildmarketplacePutItemWindow.close_callback(slot0)
	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
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

	uv0:openGuildmarketplacePutItemWindow(false)
end
