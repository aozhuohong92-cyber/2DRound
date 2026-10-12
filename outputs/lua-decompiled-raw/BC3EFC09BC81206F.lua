ElitematchOrderActionEndWarnWindow = ElitematchOrderActionEndWarnWindow or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()

function ElitematchOrderActionEndWarnWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "elitematch/elitematch_orderaction_end_warn_window"
end

function ElitematchOrderActionEndWarnWindow.open_callback(slot0)
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

function ElitematchOrderActionEndWarnWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElitematchEndWarnView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openElitematchEndWarnView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_ok, function ()
		uv0:openElitematchEndWarnView(false)
	end, true, 1)
end

function ElitematchOrderActionEndWarnWindow.openRootWnd(slot0, slot1)
	slot2 = ""

	if 30 - (slot1 or 0) <= 0 then
		slot3 = 0
		slot2 = TI18N("今天")
	else
		slot2 = slot3 .. TI18N("天")
	end

	if Config.ArenaEliteWarOrderData.data_constant then
		slot0.desc_text:setString(string.format(slot4.warn_desc.desc, slot2))
	end

	if slot0.desc_text:getContentSize().height > 234 then
		slot6 = slot5 + 30
	end

	slot0.Image_15:setContentSize(cc.size(647, slot6 + 166))
	slot0.Image_23:setContentSize(cc.size(593, slot6))
	slot0.btn_ok:setPositionY(295 - slot6)
end

function ElitematchOrderActionEndWarnWindow.close_callback(slot0)
	uv0:openElitematchEndWarnView(false)
end
