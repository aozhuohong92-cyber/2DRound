AdjustBezierPanel = AdjustBezierPanel or BaseClass(CommonUI)

function AdjustBezierPanel.__init(slot0, slot1)
	slot0.view_tag = ViewMgrTag.DEBUG_TAG

	slot0:createRootWnd()

	slot0.node_list = {}
	slot0.is_open = true
end

function AdjustBezierPanel.createRootWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.root_wnd:setAnchorPoint(0, 0)

	slot0.mask_bg = ccui.Layout:create()

	slot0.mask_bg:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.mask_bg:setAnchorPoint(0, 0)
	slot0.mask_bg:setBackGroundColor(cc.c3b(80, 80, 80))
	slot0.mask_bg:setBackGroundColorOpacity(255)
	slot0.mask_bg:setBackGroundColorType(1)
	slot0.root_wnd:addChild(slot0.mask_bg)
	ViewManager:getInstance():getLayerByTag(slot0.view_tag):addChild(slot0.root_wnd)

	slot0.close_btn = CustomButton.New(slot0.root_wnd, PathTool.getResFrame("common", "common_1028"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.close_btn:setPosition(cc.p(680, 1000))
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:hide()
		end
	end)

	slot1 = createLabel(26, 1, nil, 100, 1040, "背景透明度", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.editbox_1 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(100, 45), nil, 25, nil, 25, nil, nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_1:setPosition(cc.p(100, 1000))
	slot0.editbox_1:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" and tonumber(slot1:getText()) then
			uv0.mask_bg:setBackGroundColorOpacity(tonumber(slot2))
		end
	end)

	slot2 = createLabel(26, 1, nil, 200, 1040, "起点", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.editbox_2 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "X", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_2:setPosition(cc.p(200, 1000))

	slot0.editbox_3 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "Y", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_3:setPosition(cc.p(200, 960))

	slot3 = createLabel(26, 1, nil, 300, 1040, "终点", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.editbox_4 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "X", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_4:setPosition(cc.p(300, 1000))

	slot0.editbox_5 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "Y", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_5:setPosition(cc.p(300, 960))

	slot4 = createLabel(26, 1, nil, 400, 1040, "中间点", slot0.root_wnd, nil, cc.p(0.5, 0.5))
	slot0.editbox_6 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "X", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_6:setPosition(cc.p(400, 1000))

	slot0.editbox_7 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "Y", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_7:setPosition(cc.p(400, 960))

	slot0.editbox_8 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "X", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_8:setPosition(cc.p(500, 1000))

	slot0.editbox_9 = createEditBox(slot0.root_wnd, PathTool.getResFrame("common", "common_90018"), cc.size(60, 45), nil, 25, cc.c3b(255, 255, 255), 25, "Y", nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.editbox_9:setPosition(cc.p(500, 960))

	slot0.ok_btn = CustomButton.New(slot0.root_wnd, PathTool.getResFrame("common", "common_1042"), nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.ok_btn:setSize(cc.size(164, 69))
	slot0.ok_btn:setPosition(cc.p(580, 860))
	slot0.ok_btn:setBtnLabel(TI18N("确定"))
	slot0.ok_btn:setBtnLableColor(Config.ColorData.data_color4[174])
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:onClickOkBtn()
		end
	end)
end

function AdjustBezierPanel.open(slot0)
	slot0.root_wnd:setVisible(true)
	slot0.root_wnd:setPosition(cc.p(0, 0))

	slot0.is_open = true
end

function AdjustBezierPanel.hide(slot0)
	slot0.root_wnd:setVisible(false)
	slot0.root_wnd:setPosition(cc.p(-1000, 0))

	slot0.is_open = false
end

function AdjustBezierPanel.isOpen(slot0)
	return slot0.is_open
end

function AdjustBezierPanel.onClickOkBtn(slot0)
	slot3 = tonumber(slot0.editbox_4:getText()) or 700
	slot4 = tonumber(slot0.editbox_5:getText()) or 700
	slot6 = tonumber(slot0.editbox_7:getText()) or 700
	slot7 = tonumber(slot0.editbox_8:getText()) or 0
	slot8 = tonumber(slot0.editbox_9:getText()) or 0

	table.insert({}, cc.p(tonumber(slot0.editbox_2:getText()) or 400, tonumber(slot0.editbox_3:getText()) or 400))

	if (tonumber(slot0.editbox_6:getText()) or 500) ~= 0 and slot6 ~= 0 then
		table.insert(slot9, cc.p(slot5, slot6))
	end

	if slot7 ~= 0 and slot8 ~= 0 then
		table.insert(slot9, cc.p(slot7, slot8))
	end

	table.insert(slot9, cc.p(slot3, slot4))

	slot11 = 1 / (math.sqrt(math.pow(slot3 - slot1, 2) + math.pow(slot4 - slot2, 2)) / 20)
	slot12 = {}
	slot13 = 0

	while slot13 < 1 do
		table.insert(slot12, slot0:getBezierPos(slot9, slot13))

		slot13 = slot13 + slot11
	end

	for slot17, slot18 in pairs(slot0.node_list) do
		slot18:setVisible(false)
	end

	for slot17, slot18 in ipairs(slot12) do
		if not slot0.node_list[slot17] then
			slot0.node_list[slot17] = createSprite(PathTool.getResFrame("common", "common_1066"), slot18.x, slot18.y, slot0.root_wnd, cc.p(0.5, 0.5))
		end

		slot19:setPosition(slot18)
		slot19:setVisible(true)
	end
end

function AdjustBezierPanel.factorial(slot0, slot1)
	if slot1 == 0 then
		return 1
	else
		return slot1 * slot0:factorial(slot1 - 1)
	end
end

function AdjustBezierPanel.getBezierPos(slot0, slot1, slot2)
	slot3 = #slot1 - 1

	for slot9, slot10 in pairs(slot1) do
		slot4 = 0 + slot10.x * slot0:factorial(slot3) / (slot0:factorial(slot3 - slot9 + 1) * slot0:factorial(slot9 - 1)) * math.pow(1 - slot2, slot3 - slot9 + 1) * math.pow(slot2, slot9 - 1)
		slot5 = 0 + slot10.y * slot0:factorial(slot3) / (slot0:factorial(slot3 - slot9 + 1) * slot0:factorial(slot9 - 1)) * math.pow(1 - slot2, slot3 - slot9 + 1) * math.pow(slot2, slot9 - 1)
	end

	return cc.p(slot4, slot5)
end

function AdjustBezierPanel.__close(slot0)
	doRemoveFromParent(slot0.root_wnd)
end

function AdjustBezierPanel.close(slot0)
	if tolua.isnull(slot0.root_wnd) then
		return
	end

	slot0:__close()
end
