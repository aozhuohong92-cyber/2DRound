TimeSummonPreviewWindow = TimeSummonPreviewWindow or BaseClass(BaseView)
slot0 = TimesummonController:getInstance()
slot1 = table.insert
slot2 = table.sort
slot3 = string.format

function TimeSummonPreviewWindow.__init(slot0, slot1, slot2)
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "seerpalace/seerpalace_preview_window"
end

function TimeSummonPreviewWindow.open_callback(slot0, slot1, slot2)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot3 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot3

	slot0:playEnterAnimatianByObj(slot3, 1)
	slot3:getChildByName("win_title"):setString(TI18N("奖励预览"))

	slot0.list_panel = slot3:getChildByName("list_panel")
	slot0.scroll_view_size = slot0.list_panel:getContentSize()
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 0, 0, slot0.list_panel, ccui.ScrollViewDir.vertical)
end

function TimeSummonPreviewWindow.openRootWnd(slot0, slot1, slot2)
	slot0:setData(slot1, slot2)
end

function TimeSummonPreviewWindow.setData(slot0, slot1, slot2)
	slot3 = {}

	if (slot2 ~= TimesummonConst.ActonInfoType.EliteType or Config.RecruitHolidayEliteData.data_hero_show[slot1]) and (slot2 ~= TimesummonConst.ActonInfoType.ElfinType and slot2 ~= TimesummonConst.ActonInfoType.ElfinType2 or Config.HolidaySpriteLotteryData.data_hero_show[slot1]) and (slot2 ~= TimesummonConst.ActonInfoType.EliteType2 or Config.RecruitHolidayLuckyData.data_hero_show[slot1]) and Config.RecruitHolidayData.data_hero_show[slot1] then
		slot4 = {}

		for slot8, slot9 in pairs(slot3) do
			uv0(slot4, slot9)
		end

		uv1(slot4, function (slot0, slot1)
			return slot0.id < slot1.id
		end)

		slot12 = cc.size

		slot0.scroll_view:setInnerContainerSize(slot12(slot0.scroll_view_size.width, math.max(40 + (BackPackItem.Height * 0.9 + 30) * math.ceil(#slot4 / 4), slot0.scroll_view_size.height)))

		for slot12, slot13 in pairs(slot4) do
			delayRun(slot0.list_panel, slot12 / 60, function ()
				slot0 = BackPackItem.new(false, true)

				slot0:setAnchorPoint(cc.p(0, 1))
				slot0:setScale(uv0)
				slot0:setBaseData(uv1.id, uv1.num)
				slot0:showItemEffect(false)
				slot0:setSummonNumber(uv2("%0.3f", uv1.probability))
				slot0:setDefaultTip()
				slot0:setPosition(cc.p(30 + (BackPackItem.Width * uv0 + 30) * ((uv3 - 1) % 4), uv4 - (BackPackItem.Height * uv0 + 30) * math.floor((uv3 - 1) / 4)))
				uv5.scroll_view:addChild(slot0)
			end)
		end
	end
end

function TimeSummonPreviewWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
end

function TimeSummonPreviewWindow._onClickBtnClose(slot0)
	uv0:openTimeSummonpreviewWindow(false)
end

function TimeSummonPreviewWindow.close_callback(slot0)
	slot0.list_panel:stopAllActions()
	uv0:openTimeSummonpreviewWindow(false)
end
