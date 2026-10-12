SeerpalacePreviewWindow = SeerpalacePreviewWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = table.sort
slot2 = string.format
slot4 = SeerpalaceController:getInstance():getModel()

function SeerpalacePreviewWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "seerpalace/seerpalace_preview_window"
	slot0.summon_tag = slot1 or nil
end

function SeerpalacePreviewWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("奖励预览"))

	slot0.list_panel = slot1:getChildByName("list_panel")
	slot0.scroll_view_size = slot0.list_panel:getContentSize()
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 0, 0, slot0.list_panel, ccui.ScrollViewDir.vertical)
end

function SeerpalacePreviewWindow.openRootWnd(slot0, slot1)
	if slot0.summon_tag == 1 then
		slot0:setSummonData(slot1)
	else
		slot0.group_id = SeerpalaceConst.Index_To_GroupId[slot1]

		if slot0.group_id then
			slot0:setData()
		end
	end
end

function SeerpalacePreviewWindow.setData(slot0)
	if Config.RecruitHighData.data_seerpalace_award[slot0.group_id] then
		slot2 = slot1[5]
		slot3 = slot1[4]
		slot4 = 0.9
		slot5 = 40
		slot6 = 4
		slot7 = 22
		slot8 = 35
		slot9 = 30
		slot10 = 20

		for slot15, slot16 in pairs(slot1) do
			if slot16.desc and slot16.desc ~= "" then
				slot11 = 0 + slot5
			end

			slot18 = math.ceil(#slot16.items / slot6)
			slot11 = slot11 + BackPackItem.Height * slot4 * slot18 + (slot18 - 1) * slot9 + slot10
		end

		slot12 = math.max(slot11, slot0.scroll_view_size.height)

		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view_size.width, slot12))

		slot17 = nil
		slot18 = slot7
		slot13 = createLabel(22, cc.c3b(234, 181, 80), slot17, slot18, slot12 - slot5 / 2, slot2.desc, slot0.scroll_view, nil, cc.p(0, 0.5))

		for slot17, slot18 in ipairs(slot2.items) do
			delayRun(slot0.list_panel, slot17 / 60, function ()
				slot3 = BackPackItem.new(false, true)

				slot3:setAnchorPoint(cc.p(0, 1))
				slot3:setScale(0.9)
				slot3:setBaseData(uv0[1], uv0[2])
				slot3:setSummonNumber(uv0[3] or 0)
				slot3:setDefaultTip()

				if uv1 % uv2 == 0 then
					slot4 = uv2
				end

				slot3:setPosition(cc.p(uv3 + (slot4 - 1) * (BackPackItem.Width * uv4 + uv5), uv6 - uv7 - (math.ceil(uv1 / uv2) - 1) * (BackPackItem.Height * uv4 + uv8) + 5))
				uv9.scroll_view:addChild(slot3)
			end)
		end

		slot19 = nil
		slot20 = slot7
		slot15 = createLabel(22, cc.c3b(234, 181, 80), slot19, slot20, slot12 - slot5 - math.ceil(#slot2.items / slot6) * (BackPackItem.Height * slot4 + slot9) + slot9 - slot10 - slot5 / 2, slot3.desc, slot0.scroll_view, nil, cc.p(0, 0.5))

		for slot19, slot20 in ipairs(slot3.items) do
			delayRun(slot0.list_panel, slot19 / 60, function ()
				slot3 = BackPackItem.new(false, true)

				slot3:setAnchorPoint(cc.p(0, 1))
				slot3:setScale(0.9)
				slot3:setBaseData(uv0[1], uv0[2])
				slot3:setSummonNumber(uv0[3] or 0)
				slot3:setDefaultTip()

				if uv1 % uv2 == 0 then
					slot4 = uv2
				end

				slot3:setPosition(cc.p(uv3 + (slot4 - 1) * (BackPackItem.Width * uv4 + uv5), uv6 - uv7 - (math.ceil(uv1 / uv2) - 1) * (BackPackItem.Height * uv4 + uv8)))
				uv9.scroll_view:addChild(slot3)
			end)
		end
	end
end

function SeerpalacePreviewWindow.setSummonData(slot0, slot1)
	if Config.RecruitData.data_summon_data and slot2[SeerpalaceConst.Summon_Index[slot1]] then
		slot3 = {}

		for slot7, slot8 in pairs(slot2[SeerpalaceConst.Summon_Index[slot1]]) do
			uv0(slot3, slot8)
		end

		uv1(slot3, function (slot0, slot1)
			return slot0.base_id < slot1.base_id
		end)

		slot11 = cc.size

		slot0.scroll_view:setInnerContainerSize(slot11(slot0.scroll_view_size.width, math.max(40 + (BackPackItem.Height * 0.9 + 30) * math.ceil(#slot3 / 4), slot0.scroll_view_size.height)))

		for slot11, slot12 in pairs(slot3) do
			delayRun(slot0.list_panel, slot11 / 60, function ()
				slot0 = BackPackItem.new(false, true)

				slot0:setAnchorPoint(cc.p(0, 1))
				slot0:setScale(uv0)
				slot0:setBaseData(uv1.base_id)
				slot0:showItemEffect(false)
				slot0:setSummonNumber(uv2("%0.3f", uv1.summon_desc))
				slot0:setDefaultTip()
				slot0:setPosition(cc.p(30 + (BackPackItem.Width * uv0 + 30) * ((uv3 - 1) % 4), uv4 - (BackPackItem.Height * uv0 + 30) * math.floor((uv3 - 1) / 4)))
				uv5.scroll_view:addChild(slot0)
			end)
		end
	end
end

function SeerpalacePreviewWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
end

function SeerpalacePreviewWindow._onClickBtnClose(slot0)
	uv0:openSeerpalacePreviewWindow(false)
end

function SeerpalacePreviewWindow.close_callback(slot0)
	slot0.list_panel:stopAllActions()
	uv0:openSeerpalacePreviewWindow(false)
end
