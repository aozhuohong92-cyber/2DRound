PlanesafkOrderActionEndWarnWindow = PlanesafkOrderActionEndWarnWindow or BaseClass(BaseView)
slot0 = PlanesafkController:getInstance()

function PlanesafkOrderActionEndWarnWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "planesafk/planesafk_orderaction_end_warn_window"
end

function PlanesafkOrderActionEndWarnWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("Image_16"):getChildByName("Text_15"):setString(TI18N("活动提醒"))

	slot0.Image_23 = slot0.main_container:getChildByName("Image_23")
	slot0.Image_15 = slot0.main_container:getChildByName("Image_15")
	slot0.btn_close = slot0.main_container:getChildByName("btn_close")
	slot0.btn_ok = slot0.main_container:getChildByName("btn_ok")

	slot0.btn_ok:getChildByName("Text_14"):setString(TI18N("我知道了"))

	slot0.desc_text = createRichLabel(26, cc.c4b(64, 32, 23, 255), cc.p(0.5, 1), cc.p(323.5, 341), nil, , 548)

	slot0.main_container:addChild(slot0.desc_text)
end

function PlanesafkOrderActionEndWarnWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openPlanesafkEndWarnView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openPlanesafkEndWarnView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_ok, function ()
		uv0:openPlanesafkEndWarnView(false)
	end, true, 1)
end

function PlanesafkOrderActionEndWarnWindow.openRootWnd(slot0, slot1)
	slot2 = ""
	slot3 = 0

	if Config.PlanesWarOrderData.data_period_day[PlanesafkController:getInstance():getModel():getCurPeriod()] then
		slot3 = slot5.period_day - (slot1 or 0)
	end

	if slot3 <= 0 then
		slot3 = 0
		slot2 = TI18N("今天")
	else
		slot2 = slot3 .. TI18N("天")
	end

	if Config.PlanesWarOrderData.data_constant and slot6.warn_desc then
		slot0.desc_text:setString(string.format(slot6.warn_desc.desc, slot2))
	end

	if slot0.desc_text:getContentSize().height > 234 then
		slot8 = slot7 + 30
	end

	slot0.Image_15:setContentSize(cc.size(647, slot8 + 166))
	slot0.Image_23:setContentSize(cc.size(593, slot8))
	slot0.btn_ok:setPositionY(295 - slot8)
end

function PlanesafkOrderActionEndWarnWindow.close_callback(slot0)
	uv0:openPlanesafkEndWarnView(false)
end
