RecommandPanel = class("RecommandPanel", function ()
	return ccui.Widget:create()
end)
slot0 = 5

function RecommandPanel.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}
	slot0.cur_select = nil
	slot0.cur_index = 1

	slot0:configUI()
	slot0:register_event()
end

function RecommandPanel.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(cc.size(620, 770))
	slot0.root_wnd:setAnchorPoint(0, 0)
	slot0:addChild(slot0.root_wnd)

	slot0.bg = createScale9Sprite(PathTool.getResFrame("common", "common_1034"), slot0.root_wnd:getContentSize().width / 2, slot0.root_wnd:getContentSize().height / 2, LOADTEXT_TYPE_PLIST, slot0.root_wnd)

	slot0.bg:setContentSize(cc.size(617, 772))
	slot0.bg:setAnchorPoint(0.5, 0.5)

	slot0.scroll = createScrollView(slot0.bg:getContentSize().width, slot0.bg:getContentSize().height - 15, 1, 10, slot0.bg, ccui.ScrollViewDir.vertical)

	slot0:createItemList()
end

function RecommandPanel.createItemList(slot0)
	slot2 = {}

	for slot7, slot8 in pairs(deepCopy(Config.StrongerData.data_recommand)) do
		if slot8.limit <= BattleDramaController:getInstance():getModel():getDramaData().max_dun_id then
			table.insert(slot2, slot8)
		end
	end

	table.sort(slot2, SortTools.KeyLowerSorter("sort"))

	slot0.max_height = math.max((166 + uv0) * #slot2, slot0.scroll:getContentSize().height)
	slot7 = cc.size

	slot0.scroll:setInnerContainerSize(slot7(slot0.scroll:getContentSize().width, slot0.max_height))

	for slot7, slot8 in ipairs(slot2) do
		delayRun(slot0.scroll, 0.05 * slot7, function ()
			slot0 = RecommandItem.new()

			slot0:setData(uv0)
			uv1.scroll:addChild(slot0)
			slot0:setPosition(5, uv1.max_height - 3 - (166 + uv2) * (uv3 - 1))

			uv1.item_list[uv3] = slot0

			slot0:setBtnCallBack(function (slot0)
				if uv0.cur_select ~= nil and uv0.cur_index and uv0.cur_index ~= uv1 then
					uv0.cur_select:setSelect(false)
					uv0.cur_select:showMessagePanel(false)
				end

				uv0.cur_select = slot0
				uv0.cur_index = uv1

				if uv0.cur_select:getIsShow() then
					slot7 = uv0.scroll:getContentSize().width

					uv0.scroll:setInnerContainerSize(cc.size(slot7, uv0.max_height))

					for slot6, slot7 in pairs(uv0.item_list) do
						slot7:setPosition(5, uv0.max_height - 3 - (166 + uv2) * (slot6 - 1))
					end

					uv0.cur_select:setSelect(false)
					uv0.cur_select:showMessagePanel(false)
				else
					uv0.cur_select:setSelect(true)
					uv0.cur_select:showMessagePanel(true)
					uv0:adjustPos()
				end

				slot2 = 0
				slot3 = uv0.max_height

				if uv0.height then
					slot3 = uv0.max_height + 170
				end

				if uv0.cur_select then
					slot2 = uv0.cur_select:getPositionY() / slot3 * 100
					slot5 = (uv0.cur_index - 1) * 136 / uv0.max_height * 100

					if uv0.height then
						slot5 = (uv0.cur_index - 1) * 270 / slot3 * 100
					end

					uv0.scroll:jumpToPercentVertical(math.ceil(slot5))
				end
			end)
		end)
	end
end

function RecommandPanel.adjustPos(slot0)
	if slot0.cur_select ~= nil then
		slot6 = slot0.scroll:getContentSize().width

		slot0.scroll:setInnerContainerSize(cc.size(slot6, slot0.max_height + 170))

		slot0.height = 170

		for slot5, slot6 in pairs(slot0.item_list) do
			if slot5 <= slot0.cur_index then
				slot6:setPosition(5, slot0.max_height + 170 - 3 - (166 + uv0) * (slot5 - 1))
			else
				slot6:setPosition(5, slot1 - 3 - 170 - (166 + uv0) * (slot5 - 1))
			end
		end
	end
end

function RecommandPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function RecommandPanel.register_event(slot0)
end

function RecommandPanel.DeleteMe(slot0)
	doStopAllActions(slot0.scroll)

	if slot0.item_list and slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end
	end
end

RecommandItem = class("RecommandItem", function ()
	return ccui.Widget:create()
end)

function RecommandItem.ctor(slot0)
	slot0.ctrl = StrongerController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function RecommandItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("stronger/recommand_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 1)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(606, 166))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.title = slot0.main_container:getChildByName("title")
	slot0.btn = slot0.main_container:getChildByName("btn")
	slot0.scroll_con = slot0.main_container:getChildByName("scroll_con")
	slot2 = 0.8
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scroll_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.scroll_con:getContentSize(), {
		start_y = 2,
		start_x = 2,
		space_x = 0,
		row = 1,
		space_y = 2,
		col = 0,
		item_class = HeroExhibitionItem,
		item_width = HeroExhibitionItem.Width * slot2,
		item_height = HeroExhibitionItem.Height * slot2,
		scale = slot2
	})
end

function RecommandItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.btn_callback then
				uv0:btn_callback()
			end
		end
	end)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function RecommandItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function RecommandItem.setBtnCallBack(slot0, slot1)
	slot0.btn_callback = slot1
end

function RecommandItem.getIsShow(slot0)
	return slot0.is_show
end

function RecommandItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.title:setString(slot1.name)

	slot2 = {}

	for slot6, slot7 in ipairs(slot1.hero_list[1]) do
		if deepCopy(Config.PartnerData.data_partner_base[slot7]) then
			table.insert(slot2, slot8)
		end
	end

	slot0.item_scrollview:setData(slot2, function (slot0, slot1)
		if slot1 and slot1.bid then
			HeroController:getInstance():openHeroTipsPanelByBid(slot1.bid)
		end
	end, nil, {
		hide_star = true,
		can_click = true,
		scale = 0.73
	})
end

function RecommandItem.setSelect(slot0, slot1)
	slot2 = nil

	slot0.bg:loadTexture((not slot1 or PathTool.getResFrame("common", "common_1020")) and PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST)
end

function RecommandItem.showMessagePanel(slot0, slot1)
	slot0.is_show = slot1

	if slot1 and slot0.msg_panel == nil then
		slot0:createMessagePanel()
	end

	slot0.msg_panel:setVisible(slot1)
end

function RecommandItem.createMessagePanel(slot0)
	if slot0.msg_panel == nil then
		slot0.msg_panel = createScale9Sprite(PathTool.getResFrame("common", "common_2008"), 10, -5, LOADTEXT_TYPE_PLIST, slot0.main_container)

		slot0.msg_panel:setContentSize(cc.size(585, 168))
		slot0.msg_panel:setAnchorPoint(0, 1)
	end

	if not slot0.msg_touch_layer then
		slot0.msg_touch_layer = ccui.Layout:create()

		slot0.msg_touch_layer:setContentSize(585, 168)
		slot0.msg_touch_layer:setPosition(cc.p(292.5, 84))
		slot0.msg_touch_layer:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.msg_touch_layer:setTouchEnabled(true)
		slot0.msg_panel:addChild(slot0.msg_touch_layer)
		slot0.msg_touch_layer:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.btn_callback then
				uv0:btn_callback()
			end
		end)
	end

	slot1 = PathTool.getResFrame("common", "common_1033")
	slot2 = createImage(slot0.msg_panel, slot1, 165, 147, cc.p(0.5, 0.5), true)

	createImage(slot0.msg_panel, slot1, 425, 147, cc.p(0.5, 0.5), true):setFlippedX(true)

	slot4 = createRichLabel(22, 175, cc.p(0.5, 0.5), cc.p(slot0.msg_panel:getContentSize().width / 2, 150))

	slot4:setString(TI18N("阵容分析"))
	slot0.msg_panel:addChild(slot4)

	slot0.desc = createRichLabel(20, 175, cc.p(0, 1), cc.p(20, 129), 5, 0, 550)

	slot0.msg_panel:addChild(slot0.desc)
	slot0.desc:setString(slot0.data.desc)

	slot0.packup = createLabel(20, cc.c3b(164, 127, 81), nil, 575, 10, TI18N("收起"), slot0.msg_panel, nil, cc.p(1, 0))
end

function RecommandItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end
