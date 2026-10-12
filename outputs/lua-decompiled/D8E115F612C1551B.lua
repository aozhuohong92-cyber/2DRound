AdventureBuffTips = AdventureBuffTips or BaseClass()
slot0 = string.format

function AdventureBuffTips.__init(slot0, slot1, slot2)
	slot0.buff_list = slot1 or {}
	slot0.holiday_buff_list = slot2 or {}
	slot0.delay = 10
	slot0.label_list = {}
	slot0.holiday_label_list = {}

	slot0:createRootWnd()
end

function AdventureBuffTips.createRootWnd(slot0)
	slot0:LoadLayoutFinish()
	slot0:registerCallBack()
end

function AdventureBuffTips.closeCallBack(slot0)
end

function AdventureBuffTips.LoadLayoutFinish(slot0)
	slot0.screen_bg = ccui.Layout:create()

	slot0.screen_bg:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.screen_bg:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	slot0.screen_bg:setTouchEnabled(true)
	slot0.screen_bg:setSwallowTouches(false)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(cc.p(0, 0))
	slot0.screen_bg:addChild(slot0.root_wnd)

	slot0.background = ccui.ImageView:create(PathTool.getResFrame("common", "common_1092"), LOADTEXT_TYPE_PLIST)

	slot0.background:setScale9Enabled(true)
	slot0.background:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:addChild(slot0.background)
end

function AdventureBuffTips.registerCallBack(slot0)
	slot0.screen_bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			TipsManager:getInstance():hideTips()
		end
	end)
end

function AdventureBuffTips.setPosition(slot0, slot1, slot2)
	slot0.root_wnd:setAnchorPoint(cc.p(0, 1))
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function AdventureBuffTips.addToParent(slot0, slot1, slot2)
	slot0.parent_wnd = slot1

	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:removeFromParent()

		if not tolua.isnull(slot1) then
			slot0.parent_wnd:addChild(slot0.root_wnd, slot2)
		end
	end
end

function AdventureBuffTips.setPos(slot0, slot1, slot2)
	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
end

function AdventureBuffTips.getContentSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function AdventureBuffTips.getScreenBg(slot0)
	return slot0.screen_bg
end

function AdventureBuffTips.showTips(slot0)
	slot0.buff_list = slot0.buff_list or {}
	slot0.holiday_buff_list = slot0.holiday_buff_list or {}
	slot2 = 510

	if #slot0.buff_list == 1 then
		slot2 = 255
	end

	slot4 = math.ceil(slot1 * 0.5) * 40 + 55
	slot5 = 0

	if next(slot0.holiday_buff_list) ~= nil then
		slot5 = math.ceil(#slot0.holiday_buff_list * 0.5) * 40 + 10
		slot2 = 510
	end

	slot0.root_wnd:setContentSize(cc.size(slot2, slot4 + slot5))
	slot0.background:setContentSize(cc.size(slot2, slot4 + slot5))

	if slot0.desc_label == nil then
		slot0.desc_label = createLabel(20, cc.c4b(180, 169, 154, 255), nil, slot2 * 0.5, 16, TI18N("该属性仅本轮冒险生效"), slot0.root_wnd, nil, cc.p(0.5, 0))
	end

	if slot5 > 0 then
		if slot0.line_image == nil then
			slot0.line_image = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_1097"), slot2 / 2, slot4 - 10, cc.p(0.5, 0.5), true, nil, true)

			slot0.line_image:setContentSize(cc.size(2, slot2 - 60))
			slot0.line_image:setRotation(90)
		end

		if slot0.holiday_label == nil then
			slot0.holiday_label = createLabel(24, cc.c4b(224, 191, 153, 255), nil, 30, slot4 + slot5 - 20, TI18N("活动加成:"), slot0.root_wnd, nil, cc.p(0, 1))
		end
	end

	slot0:createBuffList(slot2, slot4, slot5)
end

function AdventureBuffTips.createBuffList(slot0, slot1, slot2, slot3)
	slot5 = Config.BuffData.data_get_buff_data

	for slot9, slot10 in ipairs(slot0.holiday_buff_list or {}) do
		if slot0.holiday_label_list[slot9] == nil then
			slot0.holiday_label_list[slot9] = createRichLabel(24, cc.c4b(224, 191, 153, 255), cc.p(0, 1))

			slot0.root_wnd:addChild(slot0.holiday_label_list[slot9])
			slot0.holiday_label_list[slot9]:setPosition(30 + slot9 % 2 * 220, slot2 + slot3 - math.floor(slot9 / 2) * 40 - 20)
		end

		slot0:setBuffLabelData(slot0.holiday_label_list[slot9], slot5[slot10.bid], slot10.time or 1)
	end

	for slot9, slot10 in ipairs(slot0.buff_list) do
		if slot0.label_list[slot9] == nil then
			slot0.label_list[slot9] = createRichLabel(24, slot4, cc.p(0, 1))

			slot0.root_wnd:addChild(slot0.label_list[slot9])
			slot0.label_list[slot9]:setPosition(30 + (slot9 - 1) % 2 * 220, slot2 - math.floor((slot9 - 1) / 2) * 40 - 20)
		end

		slot0:setBuffLabelData(slot0.label_list[slot9], slot5[slot10.bid], slot10.time or 1)
	end
end

function AdventureBuffTips.setBuffLabelData(slot0, slot1, slot2, slot3)
	if slot1 and slot2 and slot3 then
		slot4 = ""

		for slot8, slot9 in ipairs(slot2.effect) do
			slot10 = slot9[1]
			slot11 = slot9[2] * slot3

			if slot4 ~= "" then
				slot4 = slot4 .. ","
			end

			slot12 = Config.AttrData.data_key_to_name[slot10] or ""
			slot4 = (not PartnerCalculate.isShowPerByStr(slot10) or uv0(TI18N("%s提升%s%s"), slot12, slot11 * 0.1, "%")) and uv0(TI18N("%s提升%s"), slot12, slot11)
		end

		slot1:setString(uv0("<img src=%s scale=0.3 visible=true />%s", PathTool.getBuffRes(slot2.icon), slot4))
	end
end

function AdventureBuffTips.recoutTextFieldSize(slot0, slot1, slot2, slot3)
	slot4 = createRichLabel(slot3, Config.ColorData.data_color4[161], cc.p(0, 1), nil, 6, 0, slot2)

	slot4:setString(slot1)

	return slot4
end

function AdventureBuffTips.setAnchorPoint(slot0, slot1)
	slot0.screen_bg:setAnchorPoint(slot1)
end

function AdventureBuffTips.open(slot0)
	ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG):addChild(slot0.screen_bg)
	doStopAllActions(slot0.screen_bg)
	delayRun(slot0.screen_bg, slot0.delay, function ()
		TipsManager:getInstance():hideTips()
	end)
end

function AdventureBuffTips.close(slot0)
	if slot0.screen_bg then
		doStopAllActions(slot0.screen_bg)
		slot0.screen_bg:removeFromParent()

		slot0.screen_bg = nil
	end
end
