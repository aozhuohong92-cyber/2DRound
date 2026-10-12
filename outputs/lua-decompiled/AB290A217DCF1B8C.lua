Numerickeyboard = Numerickeyboard or BaseClass()

function Numerickeyboard.__init(slot0, slot1, slot2, slot3, slot4)
	slot0.isCompleted = false
	slot0.parent = slot2

	if slot0.parent == nil then
		slot0.parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.UI_TAG)
	end

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setContentSize(cc.size(356, 229))
	slot0.parent:addChild(slot0.root_wnd)

	if slot3 ~= nil then
		slot0.root_wnd:setPosition(slot3)
	end

	if slot4 ~= nil then
		slot0.root_wnd:setScale(slot4)
	end

	slot0.callBack = slot1

	slot0:config()
	slot0:initEvent()
end

function Numerickeyboard.config(slot0)
	slot2 = cc.size(356, 229)
	slot0.bg = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_1056"), slot2.width / 2, slot2.height / 2, nil, true)

	slot0.bg:setScale9Enabled(true)
	slot0.bg:setTouchEnabled(true)
	slot0.bg:setCapInsets(cc.rect(26, 27, 2, 2))
	slot0.bg:setContentSize(slot2)

	slot0.info_bg = createImage(slot0.bg, PathTool.getResFrame("common", "common_90024"), slot2.width / 2, slot2.height / 2, nil, true)

	slot0.info_bg:setScale9Enabled(true)
	slot0.info_bg:setTouchEnabled(true)
	slot0.info_bg:setCapInsets(cc.rect(26, 27, 2, 2))

	slot6 = cc.size

	slot0.info_bg:setContentSize(slot6(333, 203))

	slot0.btn_list = {}

	for slot6 = 1, 13 do
		slot1 = PathTool.getResFrame("common", "common_1029")
		slot7 = nil
		slot8 = (slot6 - 1) % 3
		slot9 = math.ceil(slot6 / 3)

		if slot6 == 10 then
			slot7 = createButton(slot0.bg, TI18N("删除"), slot2.width - (4 - 3) * 84 + 30, slot2.height - 1 * 65 + 14, cc.size(67, 50), PathTool.getResFrame("common", "common_1046"), 24, Config.ColorData.data_color4[1])
		elseif slot6 == 11 then
			slot7 = createButton(slot0.bg, 0, slot2.width - (4 - 3) * 84 + 30, slot2.height - 2 * 65 + 14, cc.size(67, 50), PathTool.getResFrame("common", "common_1046"), 28, Config.ColorData.data_color4[1])
		elseif slot6 == 12 then
			slot7 = createButton(slot0.bg, TI18N("确定"), slot2.width - (4 - 3) * 84 + 30, slot2.height - 3 * 65 + 14, cc.size(67, 50), PathTool.getResFrame("common", "common_1046"), 24, Config.ColorData.data_color4[1])
		elseif slot6 ~= 13 then
			slot7 = createButton(slot0.bg, slot6, slot2.width - (4 - slot8) * 84 + 30, slot2.height - slot9 * 65 + 14, cc.size(67, 50), PathTool.getResFrame("common", "common_1046"), 28, Config.ColorData.data_color4[1])
		end

		slot0.btn_list[slot6] = slot7
	end
end

function Numerickeyboard.initEvent(slot0)
	if slot0.callBack ~= nil then
		for slot4, slot5 in ipairs(slot0.btn_list) do
			slot5:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1)

				if slot1 == ccui.TouchEventType.ended then
					if uv0 ~= 11 then
						uv1.callBack(uv0)
					else
						uv1.callBack(0)
					end
				end
			end)
		end
	end
end

function Numerickeyboard.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function Numerickeyboard.close(slot0)
	slot0:DeleteMe()
end

function Numerickeyboard.__delete(slot0)
	if slot0.root_wnd and slot0.root_wnd:getParent() then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()

		slot0.root_wnd = nil
	end
end

CommonNumBar = CommonNumBar or BaseClass()

function CommonNumBar.__init(slot0, slot1, slot2, slot3, slot4)
	slot0.parent_wnd = slot1
	slot0.size = slot2
	slot0.font_size = slot3 or 26
	slot0.num = 0
	slot0.callBack = nil
	slot0.NumerickeyboardScale = slot4 or 1

	slot0:initView()
	slot0:registerEvents()
end

function CommonNumBar.initView(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0.parent_wnd:addChild(slot0.root_wnd)

	slot0.background = createScale9Sprite(PathTool.getResFrame("common", "common_1021"), slot0.size.width / 2, slot0.size.height / 2)

	slot0.background:setContentSize(slot0.size)
	slot0.background:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.root_wnd:addChild(slot0.background)

	slot0.num_label = createLabel(slot0.font_size, Config.ColorData.data_color4[151], nil, 0, 0, "", slot0.root_wnd, nil, cc.p(0.5, 0.5))

	slot0.num_label:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))

	slot0.sub_btn = createButton(slot0.root_wnd, "-", 0, 0, cc.size(56, 50), PathTool.getResFrame("common", "common_1046"), 30, Config.ColorData.data_color4[1], nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.sub_btn:setLabelPosition(28, 28)
	slot0.sub_btn:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.sub_btn:enableOutline(Config.ColorData.data_color3[157], 1)
	slot0.sub_btn:setPosition(cc.p(slot0.size.width / 2 - 118, slot0.size.height / 2))

	slot0.add_btn = createButton(slot0.root_wnd, "+", 0, 0, cc.size(56, 50), PathTool.getResFrame("common", "common_1046"), 30, Config.ColorData.data_color4[1], nil, nil, LOADTEXT_TYPE_PLIST)

	slot0.add_btn:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.add_btn:setLabelPosition(27, 28)
	slot0.add_btn:enableOutline(Config.ColorData.data_color3[157], 1)
	slot0.add_btn:setPosition(cc.p(slot0.size.width / 2 + 118, slot0.size.height / 2))
end

function CommonNumBar.unRegisterEvents(slot0)
	slot0.root_wnd:setTouchEnabled(false)
end

function CommonNumBar.registerEvents(slot0)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and not uv0.number_type then
			uv0.number_type = Numerickeyboard.New(function (slot0)
				if slot0 == 13 then
					uv0.number_type:close()

					uv0.number_type = nil
				elseif slot0 == 10 then
					uv0:popNum()
				elseif slot0 == 12 then
					uv0.number_type:close()

					uv0.number_type = nil

					if uv0.callBack then
						uv0.callBack("enter", uv0:getNum())
					end
				else
					uv0:pushNum(slot0)

					if uv0.callBack then
						uv0.callBack("push", uv0:getNum())
					end
				end
			end, ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG), cc.p(0, 0), uv0.NumerickeyboardScale)

			uv0:adjustTipsPosition(uv0.number_type, uv0.root_wnd:convertToWorldSpace(cc.p(uv0.background:getPositionX() + 65, uv0.background:getPositionY())))
			uv0:setNum(0)
		end
	end)
	slot0.add_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:addOne()

			if uv0.callBack then
				uv0.callBack("add", uv0:getNum())
			end
		end
	end)
	slot0.sub_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:subOne()

			if uv0.callBack then
				uv0.callBack("sub", uv0:getNum())
			end
		end
	end)
	slot0:registerNodeScriptHandler()
end

function CommonNumBar.closeNumkeyboard(slot0)
	if slot0.number_type then
		slot0.number_type:close()

		slot0.number_type = nil
	end
end

function CommonNumBar.registerNodeScriptHandler(slot0)
	slot0.root_wnd:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			-- Nothing
		elseif slot0 == "exit" and uv0.number_type then
			uv0.number_type:close()

			uv0.number_type = nil
		end
	end)
end

function CommonNumBar.getNum(slot0)
	return slot0.num
end

function CommonNumBar.setMaxUseNum(slot0, slot1)
	slot0.max_use_num = slot1
end

function CommonNumBar.setNum(slot0, slot1)
	if slot0.max_suffix_num then
		if slot0.max_suffix_num < slot1 then
			message("单次输入已达最大数量")
		end

		slot0.num = math.min(slot1, slot0.max_suffix_num)
	else
		slot0.num = slot1
	end

	if slot0.call_back then
		slot0.call_back(slot0.num)
	end

	if slot0.num_label then
		slot0.num_label:setString(slot0.num .. (slot0.suffix_str and "/" .. slot0.suffix_str or ""))
	end
end

function CommonNumBar.pushNum(slot0, slot1)
	slot0:setNum(tonumber(slot0.num .. slot1))
end

function CommonNumBar.popNum(slot0)
	if string.len(tostring(slot0.num)) > 1 then
		slot0:setNum(tonumber(string.sub(slot0.num, 1, slot1 - 1)))
	else
		slot0:setNum(0)
	end
end

function CommonNumBar.addOne(slot0)
	if slot0.max_use_num and slot0.max_use_num > 0 then
		if slot0.max_suffix_num and slot0.max_use_num <= slot0.max_suffix_num then
			slot0:setNum(math.min(slot0:getNum() + 1, slot0.max_use_num))

			if slot0.max_use_num <= slot0:getNum() then
				message(string.format("单次最大操作数量为%s个！", slot0.max_use_num))
			end
		elseif slot0.max_suffix_num < slot0.max_use_num then
			slot0:setNum(math.min(slot0:getNum() + 1, slot0.max_suffix_num))
		else
			slot0:setNum(slot0:getNum() + 1)
		end
	elseif slot0.max_suffix_num then
		if slot0.max_suffix_num < slot0:getNum() + 1 then
			message("单次输入已达最大数量")
		end

		slot0:setNum(math.min(slot0:getNum() + 1, slot0.max_suffix_num))
	else
		slot0:setNum(slot0:getNum() + 1)
	end
end

function CommonNumBar.subOne(slot0)
	slot0:setNum(math.max(slot0:getNum() - 1, slot0.min_suffix_num))
end

function CommonNumBar.setMaxSuffix(slot0, slot1)
	slot0.max_suffix_num = slot1
end

function CommonNumBar.setMinSuffix(slot0, slot1)
	slot0.min_suffix_num = slot1
end

function CommonNumBar.setAnchorPoint(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(slot1, slot2))
end

function CommonNumBar.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function CommonNumBar.setVisible(slot0, slot1)
	slot0.root_wnd:setVisible(slot1)
end

function CommonNumBar.addChangeEventListener(slot0, slot1)
	slot0.call_back = slot1
end

function CommonNumBar.adjustTipsPosition(slot0, slot1, slot2)
	slot5 = 10

	if cc.Director:getInstance():getWinSize().width < slot2.x + slot1.root_wnd:getContentSize().width then
		if slot3.height < slot2.y + slot4.height + slot5 then
			if slot2.y - slot5 - slot4.height > 0 then
				slot1:setPosition(slot2.x - slot4.width - slot5, slot2.y - slot5)
			else
				slot1:setPosition(slot2.x - slot4.width - slot5, slot2.y - slot5 + math.abs(slot2.y - slot5 - slot4.height))
			end
		else
			slot1:setPosition(slot2.x - slot4.width - slot5, slot2.y + slot4.height + slot5)
		end
	elseif slot3.height < slot2.y + slot4.height + slot5 then
		if slot2.y - slot5 - slot4.height > 0 then
			slot1:setPosition(slot2.x + slot5, slot2.y - slot5)
		else
			slot1:setPosition(slot2.x + slot5, slot2.y - slot5 + math.abs(slot2.y - slot5 - slot4.height))
		end
	else
		slot1:setPosition(slot2.x + slot5, slot2.y + slot4.height + slot5)
	end
end

function CommonNumBar.getLabel(slot0)
	return slot0.num_label
end

function CommonNumBar.setBackgroundVisible(slot0, slot1)
	slot0.background:setVisible(slot1)
end

function CommonNumBar.registerHandle(slot0, slot1)
	slot0.callBack = slot1
end

function CommonNumBar.__delete(slot0)
	if slot0.number_type then
		slot0.number_type:close()

		slot0.number_type = nil
	end
end
