CommonExplainWindow = CommonExplainWindow or BaseClass(BaseView)

function CommonExplainWindow.__init(slot0, slot1, slot2, slot3)
	slot0.ctrl = slot1
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "common/common_explain_view"
	slot0.cache_list = {}
	slot0.title_str = slot2 or TI18N("规则")
	slot0.is_summon = slot3 or nil
end

function CommonExplainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.scroll_view = slot0.container:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.win_title = slot0.container:getChildByName("win_title")

	slot0.win_title:setString(slot0.title_str)
end

function CommonExplainWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openCommonExplainView(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openCommonExplainView(false)
		end
	end)
end

function CommonExplainWindow.openRootWnd(slot0, slot1)
	slot0.max_height = 0

	slot0:setDataList(slot1)
end

function CommonExplainWindow.setDataList(slot0, slot1)
	slot0.render_list = slot1

	for slot5, slot6 in ipairs(slot0.render_list) do
		delayRun(slot0.container, slot5 / display.DEFAULT_FPS, function ()
			uv0:createList(uv1)
		end)
	end
end

function CommonExplainWindow.createList(slot0, slot1)
	slot2, slot3 = slot0:createTitleContent(slot1)

	slot0.scroll_view:addChild(slot2)
	table.insert(slot0.cache_list, slot2)

	slot0.max_height = slot0.max_height + slot3 + 30
	slot10 = slot0.scroll_width

	slot0.scroll_view:setInnerContainerSize(cc.size(slot10, math.max(slot0.max_height, slot0.scroll_height)))

	slot5 = 0

	for slot9, slot10 in ipairs(slot0.cache_list) do
		slot10:setPosition(8, slot4 - slot5)

		slot5 = slot5 + slot10:getContentSize().height + 30
	end
end

function CommonExplainWindow.createTitleContent(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0

	if slot1.title == " " or slot1.title == "" then
		slot4 = createRichLabel(24, 175, cc.p(0, 1), cc.p(0, 0), 5, nil, 605)

		slot4:setString(splitDataStr(slot1.desc))
		slot2:addChild(slot4)

		slot3 = slot4:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot4:setPositionY(slot3 - 8)
	else
		slot4 = createScale9Sprite(PathTool.getResFrame("common", "common_90025"), 0, 0, LOADTEXT_TYPE_PLIST, slot2)

		slot4:setAnchorPoint(cc.p(0, 1))
		slot4:setContentSize(cc.size(617, 44))

		if slot0.is_summon and slot1.id and slot1.id >= 2 and slot1.id <= 5 then
			slot5 = createImage(slot4, PathTool.getResFrame("common", "common_1093"), 480, 21, cc.p(0.5, 0.5), true, 1, true)

			slot5:setContentSize(cc.size(41, 46))
			slot5:setScale(0.8)
			slot5:setTouchEnabled(true)
			registerButtonEventListener(slot5, function ()
				SeerpalaceController:getInstance():openSeerpalacePreviewWindow(true, uv0.id, 1)
			end)

			slot6 = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0.5, 0.5), cc.p(slot5:getContentSize().width + 55, slot5:getContentSize().height * 0.5))

			slot6:setString(string.format("<div href=xxx>%s</div>", TI18N("查看详情")))
			slot5:addChild(slot6)
			slot6:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
				SeerpalaceController:getInstance():openSeerpalacePreviewWindow(true, uv0.id, 1)
			end, {
				"click",
				"href"
			})
		end

		slot5 = createLabel(26, Config.ColorData.data_color4[175], nil, 5, slot4:getContentSize().height * 0.5, slot1.title, slot4, nil, cc.p(0, 0.5))
		slot6 = createRichLabel(24, 175, cc.p(0, 1), cc.p(0, 0), 5, nil, 605)

		slot6:setString(splitDataStr(slot1.desc))
		slot2:addChild(slot6)

		slot3 = slot4:getContentSize().height + slot6:getContentSize().height

		slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
		slot4:setPositionY(slot3 - 8)
		slot6:setPositionY(slot4:getPositionY() - slot4:getContentSize().height - 8)
	end

	return slot2, slot3
end

function CommonExplainWindow.close_callback(slot0)
	slot0.container:stopAllActions()
	slot0.ctrl:openCommonExplainView(false)
end
