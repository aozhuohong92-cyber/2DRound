CustomCombox = CustomCombox or BaseClass()
CustomComboxDirection = {
	TOP = 1,
	BOTTOM = 2
}

function CustomCombox.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.parent_wnd = slot1
	slot0.bg_1 = slot4
	slot0.bg_2 = slot5
	slot0.bg_3 = slot6
	slot0.button_bg = slot7
	slot0.direction = slot2 or CustomComboxDirection.BOTTOM
	slot0.combox_size = slot3

	slot0:initView()
	slot0:registerEvent()
end

function CustomCombox.initView(slot0)
	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.parent_wnd:addChild(slot0.root_wnd)

	if slot0.bg_1 and slot0.bg_2 then
		slot0:initComBoxView(slot0.bg_1, slot0.bg_2, slot0.bg_3)
	end
end

function CustomCombox.setSkinType(slot0, slot1)
	slot0.type_index = slot1

	slot0:initComBoxView(PathTool.getResFrame("common", "common_1048"), PathTool.getResFrame("common", "common_arrow2"))
end

function CustomCombox.initComBoxView(slot0, slot1, slot2)
	slot0.combox_bg = createScale9Sprite(slot1, 0, 0)

	slot0.root_wnd:addChild(slot0.combox_bg)

	slot0.combox_right = createScale9Sprite(slot2, 0, 0)

	slot0.root_wnd:addChild(slot0.combox_right)
	slot0:setContentSize(slot0.combox_size)
end

function CustomCombox.setBg2Show(slot0, slot1)
	slot0.combox_right:setVisible(slot1)
end

function CustomCombox.setContentSize(slot0, slot1)
	slot0.combox_size = slot1 or slot0.combox_bg:getContentSize()

	slot0.root_wnd:setContentSize(slot0.combox_size)

	slot2 = slot0.combox_bg:getContentSize()

	slot0.combox_bg:setContentSize(slot0.combox_size)
	slot0.combox_bg:setPosition(cc.p(slot0.combox_size.width / 2, slot0.combox_size.height / 2))
	slot0.combox_right:setPosition(cc.p(slot0.combox_size.width - slot0.combox_right:getContentSize().width / 2, slot0.combox_size.height / 2))
end

function CustomCombox.setFontLabel(slot0, slot1, slot2, slot3)
	slot0.font_size = slot1
	slot0.font_color = slot2
	slot0.font_outline = slot3
end

function CustomCombox.setComboxArray(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.combox_list = slot1
	slot0.bg_3 = slot2 or PathTool.getResFrame("common", "common_90005")
	slot0.bg_width = slot3 or slot0.combox_size.width
	slot0.menu_list = {}

	if slot0.combox_layout then
		if slot0.combox_layout:getParent() then
			slot0.combox_layout:removeFromParent()
		end

		slot0.combox_layout = nil
	end

	slot6 = 0
	slot7 = 0

	if slot0.combox_list then
		for slot11 = 1, #slot0.combox_list do
			createWithSystemFont(slot0.combox_list[slot11].label, DEFAULT_FONT, slot0.font_size):setTextColor(Config.ColorData.data_color4[slot0.font_color or 1])

			if slot0.font_outline then
				slot13:enableOutline(Config.ColorData.data_color4[slot0.font_outline], 2)
			end

			slot6 = math.max(slot6, slot13:getContentSize().width)

			if slot7 == 0 then
				slot7 = slot13:getContentSize().height + 10
			end

			slot0.menu_list[slot11] = cc.MenuItemLabel:create(slot13)
		end

		slot0.combox_layout = ccui.Widget:create()

		slot0.combox_layout:setAnchorPoint(cc.p(0, 0))
		slot0.combox_layout:setContentSize(cc.size(math.max(slot6, slot0.bg_width), slot7 * #slot0.combox_list + 10))
		slot0.root_wnd:addChild(slot0.combox_layout)

		if slot0.direction == CustomComboxDirection.BOTTOM then
			slot0.combox_layout:setPosition(cc.p(0, -slot0.combox_layout:getContentSize().height))
		elseif slot0.direction == CustomComboxDirection.TOP then
			slot0.combox_right:setScaleY(-1)
			slot0.combox_layout:setPosition(cc.p(0, slot0:getContentSize().height))
		end

		slot9 = slot0.combox_layout:getContentSize()
		slot0.combox_bg_3 = createScale9Sprite(slot0.bg_3, 0, 0)

		slot0.combox_layout:addChild(slot0.combox_bg_3)
		slot0.combox_bg_3:setContentSize(slot9)
		slot0.combox_bg_3:setPosition(cc.p(slot9.width / 2, slot9.height / 2))

		if slot0.select_bg then
			slot0.combox_select_bg = createScale9Sprite(slot0.select_bg, 0, 0)

			slot0.combox_select_bg:setContentSize(cc.size(slot8, slot7))
			slot0.combox_layout:addChild(slot0.combox_select_bg)
			slot0.combox_select_bg:setPosition(cc.p(slot8 / 2, slot7 / 2))
		end

		if slot0.button_bg then
			for slot13 = 1, #slot0.menu_list do
				slot0.buttonBg = createScale9Sprite(slot0.button_bg, 0, 0)

				slot0.buttonBg:setContentSize(cc.size(slot8, slot7))
				slot0.buttonBg:setPosition(cc.p(slot8 / 2, slot9.height - slot7 / 2 - slot7 * (slot13 - 1) - 5))
				slot0.combox_layout:addChild(slot0.buttonBg)
			end
		end

		slot10 = cc.Menu:create()

		slot10:setPosition(cc.p(0, 0))

		slot14 = slot10

		slot0.combox_layout:addChild(slot14)

		for slot14 = 1, #slot0.menu_list do
			slot15 = slot0.menu_list[slot14]

			slot15:setPosition(cc.p(slot8 / 2, slot9.height - slot7 / 2 - slot7 * (slot14 - 1) - 5))
			slot10:addChild(slot15)
			slot15:setContentSize(cc.size(slot8, slot7))

			slot16 = slot15:getLabel()

			slot16:setAnchorPoint(cc.p(0.5, 0.5))
			slot16:setPosition(cc.p(slot8 / 2 - 3, slot7 / 2))
			slot15:registerScriptTapHandler(function (slot0, slot1)
				uv0:changeIndexHander(uv1)
			end)
		end

		slot0:setComboxMenuVisible(false)

		if not slot0.select_label then
			slot0.select_label = createWithSystemFont("", DEFAULT_FONT, slot0.font_size)

			slot0.select_label:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.select_label:setTextColor(Config.ColorData.data_color4[slot0.font_color or 1])

			if slot0.font_outline then
				slot0.select_label:enableOutline(Config.ColorData.data_color4[slot0.font_outline], 2)
			end

			slot0.root_wnd:addChild(slot0.select_label)
		end

		slot0.select_label:setPosition(cc.p(slot8 / 2 - 20, slot0:getContentSize().height / 2))

		slot0.pre_select_index = nil

		slot0:changeIndexHander(1)

		if slot4 then
			createSprite(slot4, 25, slot0:getContentSize().height / 2, slot0.root_wnd, cc.p(0.5, 0.5), slot5 or LOADTEXT_TYPE_PLIST):setScale(0.4)
		end
	end
end

function CustomCombox.changeIndexHander(slot0, slot1)
	if slot0.combox_list[slot1] then
		slot0.select_label:setString(slot0.combox_list[slot1].label)
	end

	if slot0.menu_list[slot1] and slot0.combox_select_bg then
		slot3 = slot0.combox_select_bg:getContentSize().height
		slot4 = slot0.menu_list[slot1]

		slot0.combox_select_bg:setPositionY(slot0.combox_layout:getContentSize().height - slot3 / 2 - slot3 * (slot1 - 1) - 5)
	end

	if slot0.pre_select_index ~= slot1 and slot0.click_call_back then
		slot0.click_call_back(slot1)
	end

	slot0.pre_select_index = slot1

	slot0:setComboxMenuVisible(false)
end

function CustomCombox.addCallBack(slot0, slot1)
	slot0.click_call_back = slot1
end

function CustomCombox.setSelectedBg(slot0, slot1)
	slot0.select_bg = slot1
end

function CustomCombox.setComboxMenuVisible(slot0, slot1)
	if slot0.combox_layout then
		slot0.combox_layout:setVisible(slot1)
		slot0.combox_layout:setTouchEnabled(slot1)
	end
end

function CustomCombox.isComboxMenuVisible(slot0)
	return slot0.combox_layout:isVisible()
end

function CustomCombox.setComboxBgSize(slot0, slot1)
	if slot0.combox_bg_3 then
		slot0.combox_bg_3:setScale9Enabled(true)
		slot0.combox_bg_3:setContentSize(slot1)
	end
end

function CustomCombox.registerEvent(slot0)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:setComboxMenuVisible(not uv0:isComboxMenuVisible())
		end
	end)
end

function CustomCombox.getContentSize(slot0)
	return slot0.combox_size
end

function CustomCombox.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function CustomCombox.setAnchorPoint(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(slot1, slot2))
end

function CustomCombox.setVisible(slot0, slot1)
	slot0.root_wnd:setVisible(slot1)
	slot0.root_wnd:setTouchEnabled(slot1)
end

function CustomCombox.setLocalZOrder(slot0, slot1)
	slot0.root_wnd:setLocalZOrder(slot1)
end
