DebugValue = DebugValue or class("DebugValue")
DebugValueHeight = 400
DebugValueWidth = DebugValueHeight / 2

function DebugValue.create()
	DebugValue.__index = DebugValue

	if not tolua.getpeer(cc.Layer:create()) then
		tolua.setpeer(slot0, {})
	end

	setmetatable(slot1, DebugValue)
	slot0:init_view()

	return slot0
end

function DebugValue.add(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.value_list = slot0.value_list or {}

	table.insert(slot0.value_list, {
		name = slot1,
		get_fun = slot3 or function ()
			return uv0[uv1] or ""
		end,
		set_fun = slot4 or function (slot0)
			uv0[uv1] = slot0
		end,
		min_max_list = slot5
	})
end

function DebugValue.init_view(slot0)
	slot1 = createScrollView(SCREEN_WIDTH, DebugValueHeight, 0, 150, slot0, ccui.ScrollViewDir.horizontal)

	slot1:setInnerContainerSize(cc.size(SCREEN_WIDTH * 2.5, DebugValueHeight))

	slot0.scroll_view = slot1
	slot0.scroll_view_touchenable = true
	slot0.scroll_view_show = true
	slot6 = {
		{
			"-点击穿透-",
			function ()
				uv0.scroll_view_touchenable = not uv0.scroll_view_touchenable
				slot2 = uv0.scroll_view
				slot4 = slot2

				for slot3, slot4 in pairs(slot2.getChildren(slot4)) do
					if not slot4.forever_show then
						slot9 = slot4

						for slot8, slot9 in pairs(slot4.getChildren(slot9)) do
							if slot9.setTouchEnabled then
								slot9:setTouchEnabled(uv0.scroll_view_touchenable)
							end
						end

						slot4:setOpacity(uv0.scroll_view_touchenable and 255 or 128)
					end

					slot4:setTouchEnabled(uv0.scroll_view_touchenable)
				end

				uv0.scroll_view:setTouchEnabled(uv0.scroll_view_touchenable)
			end
		},
		{
			"=显隐面板=",
			function ()
				uv0.scroll_view_show = not uv0.scroll_view_show
				slot2 = uv0.scroll_view
				slot4 = slot2

				for slot3, slot4 in pairs(slot2.getChildren(slot4)) do
					if not slot4.forever_show then
						slot4:setVisible(uv0.scroll_view_show)
					else
						slot4:setTouchEnabled(uv0.scroll_view_show)
					end
				end

				uv0.scroll_view:setTouchEnabled(uv0.scroll_view_show)
			end
		},
		{
			"x整个关掉x",
			function ()
				GlobalTimeTicket:getInstance():remove("DebugValue")
				uv0:removeFromParent()
			end
		},
		{
			"",
			function (slot0)
			end,
			"editbox",
			"全局变量"
		}
	}
	slot12 = 0
	slot7 = createScrollView(DebugValueWidth - 20, DebugValueHeight, 10, slot12, slot0.scroll_view)
	slot11 = cc.size

	slot7:setInnerContainerSize(slot11(DebugValueWidth - 20, math.max(80 * (#slot6 + 1), DebugValueHeight)))
	showLayoutRect(slot7)

	slot7.is_forever = true

	for slot11, slot12 in pairs(slot6) do
		slot13 = slot12[1]
		slot14 = slot12[2]
		slot15 = nil

		if slot12[3] == "editbox" then
			createEditBox(slot7, DebugValueWidth / 2 - 10, (0.5 - slot11) * 80 + DebugValueHeight, DebugValueWidth - 100, 50, 30, slot12[4], function (slot0)
			end):setAnchorPoint(0.5, 0.5)
		else
			slot16 = slot0:addButton(slot7, slot13, DebugValueWidth / 2 - 10, (0.5 - slot11) * 80 + DebugValueHeight, slot14, slot15)
		end
	end

	slot7.forever_show = true

	GlobalTimeTicket:getInstance():add(function ()
		uv0:update()
	end, 0.1, 0, "DebugValue")
	slot0:init_value()
end

function DebugValue.create_tips_view(slot0, slot1, slot2)
	slot4 = createScrollView(DebugValueWidth - 20, DebugValueHeight, DebugValueWidth * (slot1 + 0.5) - DebugValueWidth / 2 + 10, 0, slot0.scroll_view)

	slot4:setInnerContainerSize(cc.size(DebugValueWidth - 20, DebugValueHeight))

	slot5 = createRichLabel(20, 10, cc.p(0, 1), cc.p(0, DebugValueHeight), 5, 0, DebugValueWidth - 20)

	showLayoutRect(slot4)
	slot4:addChild(slot5)
	slot5:setString(tipsFormat("%s:%s\n", slot2.name, slot2.get_fun()))
	xzy(slot2)

	if slot2.min_max_list then
		slot4.val = {}

		for slot10, slot11 in pairs(slot2.min_max_list) do
			slot0:addSlider(slot4, DebugValueWidth / 2 - 10, DebugValueHeight - 100, slot2, slot10, slot11)
		end
	end

	return slot5
end

function DebugValue.addButton(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	button = ccui.Button:create()

	button:loadTextures(PathTool.getBtnRes("btn1"), "", "")
	button:setTitleText(slot2)
	button:setTitleFontSize(25)
	button:setPosition(slot3, slot4)
	button:setScale(0.8)
	button:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0(uv1)
		end
	end)
	slot1:addChild(button)

	return button
end

function DebugValue.addSlider(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot8 = slot6[2] or 100
	slot9 = slot6[3] or 0
	slot7 = math.min(slot6[1] or 0, slot8)
	slot10 = ccui.Slider:create()

	slot10:setTouchEnabled(true)
	slot10:loadBarTexture(PathTool.getResFrame("common", "common_1047"), LOADTEXT_TYPE_PLIST)
	slot10:loadSlidBallTextures(PathTool.getResFrame("common", "common_1014"), nil, nil, LOADTEXT_TYPE_PLIST)
	slot10:loadProgressBarTexture(PathTool.getResFrame("common", "common_1047"), LOADTEXT_TYPE_PLIST)
	slot1:addChild(slot10, -1)

	slot10.num = createWithSystemFont(0, DEFAULT_FONT, 26)

	slot10.num:setPosition(slot10:getContentSize().width / 2, slot10:getContentSize().height / 2)
	slot10.num:setString(slot7)
	slot10:setPosition(slot2, slot3 - (slot5 - 1) * 100)
	slot10:setScale(2)
	slot10:addChild(slot10.num)

	slot1.val[slot5] = slot9

	slot10:setPercent(slot9 / (slot8 - slot7) * 100)
	slot10.num:setString(slot9)
	slot10:addEventListener(function (slot0, slot1)
		uv0.val[uv1] = slot0:getPercent() / 100 * (uv2 - uv3) + uv3

		uv4.num:setString(uv0.val[uv1])
		uv5.set_fun(uv0.val)
	end)
end

function DebugValue.init_value(slot0)
	slot1 = 0

	if slot0.value_list == nil then
		slot0.value_list = {}
	end

	xzy(slot0.value_list)

	slot5 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot5((#slot0.value_list + 1) * DebugValueWidth, DebugValueHeight))

	for slot5, slot6 in pairs(slot0.value_list) do
		slot7 = slot0:create_tips_view(slot1 + 1, slot6)

		function slot6.update_fun()
			uv0:setString(tipsFormat("%s:%s\n", uv1.name, uv1.get_fun()))
		end
	end
end

function DebugValue.clearValue(slot0, slot1)
	for slot5, slot6 in pairs(slot0.value_list) do
		if slot6.name == slot1 then
			table.remove(slot0.value_list, slot5)
			slot0:init_value(layer)
		end
	end
end

function DebugValue.update(slot0)
	slot0.value_list = slot0.value_list or {}

	for slot4, slot5 in pairs(slot0.value_list) do
		if slot5.update_fun then
			slot5.update_fun()
		end
	end
end
