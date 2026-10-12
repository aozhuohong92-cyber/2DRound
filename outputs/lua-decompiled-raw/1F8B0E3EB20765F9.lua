OrderActionEndWarnWindow = OrderActionEndWarnWindow or BaseClass(BaseView)
slot0 = OrderActionController:getInstance()

function OrderActionEndWarnWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "orderaction/orderaction_end_warn_window"
end

function OrderActionEndWarnWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("Image_16"):getChildByName("Text_15"):setString(TI18N("活动提醒"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.btn_ok = slot1:getChildByName("btn_ok")

	slot0.btn_ok:getChildByName("Text_14"):setString(TI18N("我知道了"))

	slot2 = TI18N("花火映秋")

	if OrderActionController:getInstance():getModel():getCurPeriod() == 7 then
		slot2 = TI18N("奇妙之夜")
	elseif slot3 == 8 then
		slot2 = TI18N("雪舞冬季")
	elseif slot3 == 9 then
		slot2 = TI18N("岁初礼赞")
	elseif slot3 == 10 then
		slot2 = TI18N("踏雪拾春")
	end

	slot1:getChildByName("desc_text"):setString(string.format(TI18N([[
                %s活动将于          后结束
活动结束后，累积等级、任务进度及经验将会清
除，请及时完成试炼任务，领取相应奖励，以免
错过奖励哦！]]), slot2))

	slot0.reamin_day = slot1:getChildByName("reamin_day")
end

function OrderActionEndWarnWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openEndWarnView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEndWarnView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_ok, function ()
		uv0:openEndWarnView(false)
	end, true, 1)
end

function OrderActionEndWarnWindow.openRootWnd(slot0, slot1)
	slot2 = ""
	slot4 = 30 - (slot1 or 0)

	if OrderActionController:getInstance():getModel():getCurPeriod() == 10 then
		slot4 = 29 - slot1
	end

	if slot4 <= 0 then
		slot4 = 0
		slot2 = TI18N("今天")
	else
		slot2 = slot4 .. TI18N("天")
	end

	slot0.reamin_day:setString(slot2)
end

function OrderActionEndWarnWindow.close_callback(slot0)
	uv0:openEndWarnView(false)
end
