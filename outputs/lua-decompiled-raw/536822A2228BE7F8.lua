PokedexDramaLookPanel = class("PokedexDramaLookPanel", function ()
	return ccui.Widget:create()
end)

function PokedexDramaLookPanel.ctor(slot0, slot1)
	slot0.ctrl = BattleDramaController:getInstance()
	slot0.callback = slot1
	slot0.cur_type = 1
	slot0.stack_item = {}
	slot0.stack_pool = {}
	slot0.stack_max = 3
	slot0.capter_data = {}

	slot0:configUI()
	slot0:register_event()
end

function PokedexDramaLookPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("pokedex/pokedex_drama_panel"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_panel = slot0.main_container:getChildByName("title_panel")
	slot0.content_panel = slot0.main_container:getChildByName("content_panel")
	slot0.title_list = slot0.title_panel:getChildByName("title_list")
	slot0.content_list = slot0.content_panel:getChildByName("content_list")

	slot0:changeViewTypeShow(1)
end

function PokedexDramaLookPanel.initTitlePanel(slot0)
	slot0.title_scrollview = CommonScrollViewLayout.new(slot0.title_list, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.title_list:getContentSize(), {
		start_y = 0,
		item_width = 620,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 76,
		space_y = 5,
		col = 1,
		item_class = PokedexDramaTitleItem
	})

	slot0.title_scrollview:setSwallowTouches(false)
	slot0:refreshTitleList()
end

function PokedexDramaLookPanel.initContentPanel(slot0)
	slot1 = slot0.content_list:getContentSize()
	slot0.content_scrollview = createScrollView(slot1.width, slot1.height, 0, 0, slot0.content_list)

	slot0.content_scrollview:setSwallowTouches(false)

	slot0.content_scroll_view_size = slot1
	slot0.content_container = slot0.content_scrollview:getInnerContainer()

	slot0.content_scrollview:addEventListener(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.containerMoved then
			uv0:checkRectIntersectsRect()
		end
	end)

	slot2 = slot0.content_panel:getChildByName("bg_title")
	slot3 = slot2:getContentSize()
	slot0.content_title_label = createLabel(26, cc.c3b(104, 69, 42), nil, slot3.width / 2, slot3.height / 2 + 10, "", slot2, nil, cc.p(0.5, 0.5))
end

function PokedexDramaLookPanel.changeViewTypeShow(slot0, slot1)
	if slot1 == 1 then
		if not slot0.init_title then
			slot0.init_title = true

			slot0:initTitlePanel()
		end

		for slot5, slot6 in pairs(slot0.stack_item) do
			slot6:setVisible(false)
		end
	elseif slot1 == 2 then
		if not slot0.init_content then
			slot0.init_content = true

			slot0:initContentPanel()
		end

		slot0:refreshContentList()

		if slot0.callback then
			slot0.callback(true)
		end
	end

	slot0.title_panel:setVisible(slot1 == 1)
	slot0.content_panel:setVisible(slot1 == 2)
end

function PokedexDramaLookPanel.showPlayingDunDrama(slot0, slot1)
	if Config.DramaChatData.data_info[slot1] then
		slot0:_onClickTitleItemCallBack(slot1, slot2.bid)
	end
end

function PokedexDramaLookPanel.refreshTitleList(slot0)
	if slot0.title_scrollview then
		slot0.title_scrollview:setData(slot0:getAllDramaTitleData(), handler(slot0, slot0._onClickTitleItemCallBack))
	end
end

function PokedexDramaLookPanel._onClickTitleItemCallBack(slot0, slot1, slot2)
	slot0.cur_dun_id = slot1
	slot0.cur_capter_id = slot2

	slot0:changeViewTypeShow(2)
end

function PokedexDramaLookPanel.getAllDramaTitleData(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in pairs(Config.DramaChatData.data_info) do
		slot2[slot7.bid] = slot2[slot7.bid] or {}

		table.insert(slot2[slot7.bid], slot7)
	end

	for slot6, slot7 in pairs(slot2) do
		slot8 = {}

		for slot12, slot13 in pairs(slot7) do
			if not slot8.id or slot13.id < slot8.id then
				slot8 = deepCopy(slot13)
			end
		end

		if next(slot8) ~= nil then
			table.insert(slot1, slot8)
		end
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.bid < slot1.bid
	end)

	return slot1
end

function PokedexDramaLookPanel.getOneCapterData(slot0, slot1)
	slot2 = {}

	if not BattleDramaController:getInstance():getModel():getDramaData() then
		return {}
	end

	for slot7, slot8 in pairs(Config.DramaChatData.data_info) do
		if slot8.bid == slot1 and slot8.id < slot3.dun_id then
			table.insert(slot2, deepCopy(slot8))
		end
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	return slot2
end

function PokedexDramaLookPanel.checkRectIntersectsRect(slot0)
	slot2 = slot0.stack_pool

	if slot0.stack_item == nil or tableLen(slot0.capter_data) <= slot0.stack_max then
		return
	end

	slot3 = slot0.content_container:getPositionY()

	if slot0.last_pos_y == nil then
		slot0.last_pos_y = slot3
	end

	slot4 = #slot1
	slot5 = math.abs(slot3)

	for slot9, slot10 in pairs(slot1) do
		slot11 = false
		slot13 = slot10:getContentSize()

		if slot3 > 0 then
			if slot10:getPositionY() > slot0.content_scroll_view_size.height - slot3 + 30 then
				slot11 = true
			end
		elseif slot12 < slot5 - slot13.height then
			slot11 = true
		elseif slot12 > slot5 + slot0.content_scroll_view_size.height + 30 then
			slot11 = true
		end

		if slot11 == true then
			slot10:setVisible(false)
			table.insert(slot2, slot10)

			slot1[slot9] = nil
		end
	end

	slot0:supplementItemList(slot1, slot0.last_pos_y, slot3)

	slot0.last_pos_y = slot3
end

function PokedexDramaLookPanel.supplementItemList(slot0, slot1, slot2, slot3)
	if slot1 == nil or tableLen(slot1) == 0 or tableLen(slot0.capter_data) <= slot0.stack_max then
		return
	end

	if tableLen(slot1) < slot0.stack_max then
		slot6 = 0

		for slot10, slot11 in pairs(slot1) do
			if 0 == 0 then
				slot5 = slot11.tmp_index
			end

			if slot6 == 0 then
				slot6 = slot11.tmp_index
			end

			if slot11.tmp_index <= slot5 then
				slot5 = slot11.tmp_index
			end

			if slot6 <= slot11.tmp_index then
				slot6 = slot11.tmp_index
			end
		end

		if slot2 < slot3 then
			for slot10 = 1, slot0.stack_max - slot4 do
				if slot0.capter_data[slot6 + slot10] then
					slot0:createDramaContentItem(slot0.capter_data[slot6 + slot10])
				end
			end
		else
			for slot10 = 1, slot0.stack_max - slot4 do
				if slot5 - slot10 > 0 and slot0.capter_data[slot5 - slot10] then
					slot0:createDramaContentItem(slot0.capter_data[slot5 - slot10])
				end
			end
		end
	end
end

function PokedexDramaLookPanel.refreshContentList(slot0)
	if slot0.cur_dun_id and slot0.cur_capter_id then
		if slot0:getOneCapterData(slot0.cur_capter_id) and slot1[1] then
			slot0.content_title_label:setString(string.format(TI18N("第%d章   %s"), slot1[1].bid, slot1[1].name))
		end

		for slot6, slot7 in ipairs(slot1) do
			slot7._index = slot6
			slot2 = 0 + slot7.height
		end

		slot2 = math.max(slot2, slot0.content_scroll_view_size.height)
		slot3 = 0
		slot4 = 1
		slot5 = 0

		for slot9, slot10 in ipairs(slot1) do
			if slot0.cur_dun_id == slot10.id then
				slot4 = slot9 - 1
				slot5 = slot3 / slot2 * 100
			end

			slot10._pos = cc.p(0, slot2 - (slot3 + slot10.height) - slot10.height)
		end

		if slot4 < 1 or #slot1 <= 3 then
			slot4 = 1
		elseif slot4 + 2 > #slot1 then
			slot4 = #slot1 - 2
		end

		slot0.content_scrollview:setInnerContainerSize(cc.size(slot0.content_scroll_view_size.width, slot2))

		slot0.capter_data = slot1
		slot6 = 0

		if slot0.time_ticket == nil and next(slot0.capter_data or {}) ~= nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				if uv0.capter_data == nil then
					uv0:clearTimeTicket()
				else
					if uv0.capter_data[uv1] ~= nil then
						uv0:createDramaContentItem(slot0)
					end

					uv1 = uv1 + 1
					uv2 = uv2 + 1

					if uv2 >= 3 then
						uv0:clearTimeTicket()
					end
				end
			end, 4 / display.DEFAULT_FPS)
		end

		slot0.content_scrollview:scrollToPercentVertical(slot5, 0.1, true)
	end
end

function PokedexDramaLookPanel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function PokedexDramaLookPanel.createDramaContentItem(slot0, slot1)
	slot0:onCheckDeleteContentItem()

	if table.remove(slot0.stack_pool, 1) == nil then
		slot0.content_scrollview:addChild(PokedexDramaContentItem.new())
	else
		slot2:setVisible(true)
	end

	slot2.tmp_index = slot1._index

	slot2:setData(slot1)

	slot0.stack_item[#slot0.stack_item + 1] = slot2

	return slot2
end

function PokedexDramaLookPanel.onCheckDeleteContentItem(slot0)
	if slot0.stack_max <= #slot0.stack_item and table.remove(slot0.stack_item, 1) then
		slot1:setVisible(false)
		table.insert(slot0.stack_pool, slot1)
	end
end

function PokedexDramaLookPanel.register_event(slot0)
end

function PokedexDramaLookPanel.DeleteMe(slot0)
	slot0:clearTimeTicket()

	for slot4, slot5 in pairs(slot0.stack_item) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	for slot4, slot5 in pairs(slot0.stack_pool) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	if slot0.title_scrollview then
		slot0.title_scrollview:DeleteMe()

		slot0.title_scrollview = nil
	end
end

PokedexDramaTitleItem = class("PokedexDramaTitleItem", function ()
	return ccui.Widget:create()
end)

function PokedexDramaTitleItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PokedexDramaTitleItem.configUI(slot0)
	slot0.size = cc.size(620, 76)

	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("pokedex/pokedex_drama_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_label = slot0.main_container:getChildByName("title_label")
	slot0.name_label = slot0.main_container:getChildByName("name_label")
	slot0.bg = slot0.main_container:getChildByName("bg")

	slot0.bg:setSwallowTouches(false)
end

function PokedexDramaTitleItem.register_event(slot0)
	slot0.bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.is_open then
				if uv0.callback then
					uv0.callback(uv0.data.id, uv0.data.bid)
				end
			elseif uv0.data and uv0.data.id and Config.DungeonData.data_drama_dungeon_info(uv0.data.id) then
				message(string.format(TI18N("通关%s开启"), slot2.name))
			end
		end
	end)

	if not slot0.update_drama_dun_event then
		slot0.update_drama_dun_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Dun_Id, function ()
			uv0:refreshOpenStatus()
		end)
	end
end

function PokedexDramaTitleItem.setData(slot0, slot1)
	slot0.data = slot1 or {}

	slot0.title_label:setString(string.format(TI18N("第%d章"), slot1.bid))
	slot0.name_label:setString(TI18N(slot1.name))
	slot0:refreshOpenStatus()
end

function PokedexDramaTitleItem.refreshOpenStatus(slot0)
	slot0.is_open = false
	slot1 = BattleDramaController:getInstance():getModel():getDramaData()

	if slot0.data and slot1 and slot0.data.id < slot1.dun_id then
		slot0.is_open = true

		setChildUnEnabled(false, slot0)
		slot0.title_label:setTextColor(cc.c4b(71, 44, 30, 255))
		slot0.name_label:setTextColor(cc.c4b(71, 44, 30, 255))
	else
		slot0.is_open = false

		setChildUnEnabled(true, slot0)
		slot0.title_label:setTextColor(cc.c4b(58, 58, 58, 255))
		slot0.name_label:setTextColor(cc.c4b(58, 58, 58, 255))
	end
end

function PokedexDramaTitleItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function PokedexDramaTitleItem.DeleteMe(slot0)
	if slot0.update_drama_dun_event then
		GlobalEvent:getInstance():UnBind(slot0.update_drama_dun_event)

		slot0.update_drama_dun_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

PokedexDramaContentItem = class("PokedexDramaContentItem", function ()
	return ccui.Widget:create()
end)

function PokedexDramaContentItem.ctor(slot0)
	slot0.ctrl = BattleDramaController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function PokedexDramaContentItem.configUI(slot0)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.title_bg = createImage(slot0, PathTool.getResFrame("pokedex", "pokedex_37"), 0, 0, cc.p(0.5, 0.5), true, 1, true)

	slot0.title_bg:setScale9Enabled(true)
	slot0.title_bg:setCapInsets(cc.rect(138, 19, 1, 1))
	slot0.title_bg:setContentSize(cc.size(520, 38))

	slot0.title_label = createLabel(26, cc.c3b(254, 242, 222), nil, 260, 19, "", slot0.title_bg, nil, cc.p(0.5, 0.5))
	slot0.lable_list = {}
end

function PokedexDramaContentItem.register_event(slot0)
end

function PokedexDramaContentItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.size = cc.size(630, slot1.height)

	slot0:setContentSize(slot0.size)
	slot0:setPosition(slot1._pos)

	slot7 = slot0.size.width / 2
	slot8 = slot0.size.height - 30

	slot0.title_bg:setPosition(cc.p(slot7, slot8))
	slot0.title_label:setString(slot1.title)

	slot2 = {}
	slot3 = ""

	for slot7, slot8 in ipairs(slot1.content) do
		if not slot8[2] or slot8[2] == "" then
			if slot3 ~= "" then
				table.insert(slot2, {
					flag = 2,
					msg = WordCensor:getInstance():relapceFaceIconTag(slot3)[2]
				})

				slot3 = ""
			end

			table.insert(slot2, {
				flag = 1,
				msg = slot8[3] or ""
			})
		elseif slot7 == #slot1.content then
			table.insert(slot2, {
				flag = 2,
				msg = WordCensor:getInstance():relapceFaceIconTag(slot3 .. string.format("<div fontcolor=#aa5a3f>%s</div>", slot8[2]) .. ": " .. slot8[3] .. " \n")[2]
			})
		end
	end

	for slot7, slot8 in pairs(slot0.lable_list) do
		slot8:setVisible(false)
	end

	slot4 = slot0.size.height - 80
	slot5 = 0
	slot6 = 40
	slot7 = {
		[1.0] = 560,
		[2.0] = 560
	}
	slot8 = {
		[1.0] = 40,
		[2.0] = 40
	}

	for slot12, slot13 in ipairs(slot2) do
		if not slot0.lable_list[slot12] then
			slot14 = createRichLabel(24, cc.c3b(104, 69, 42), cc.p(0, 0), nil, 15)

			slot0:addChild(slot14)
			table.insert(slot0.lable_list, slot14)
		end

		slot14:setVisible(true)
		slot14:setMaxWidth(slot7[slot13.flag])
		slot14:setString(slot13.msg)

		slot15 = slot14:getContentSize()

		slot14:setPosition(cc.p(slot8[slot13.flag], slot4 - slot5 - slot15.height - slot6 * (slot12 - 1)))

		slot5 = slot5 + slot15.height
	end
end

function PokedexDramaContentItem.DeleteMe(slot0)
end
