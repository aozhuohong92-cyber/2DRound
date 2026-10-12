NewOrderActionEndWarnWindow = NewOrderActionEndWarnWindow or BaseClass(BaseView)
slot0 = NeworderactionController:getInstance()

function NewOrderActionEndWarnWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "neworderaction/neworderaction_end_warn_window"
end

function NewOrderActionEndWarnWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot1:getChildByName("Image_16"):getChildByName("Text_15"):setString(TI18N("活动提醒"))

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.btn_ok = slot1:getChildByName("btn_ok")

	slot0.btn_ok:getChildByName("Text_14"):setString(TI18N("我知道了"))

	slot0.btn_unlock = slot1:getChildByName("btn_unlock")

	slot0.btn_unlock:getChildByName("label"):setString(TI18N("前往解锁"))
	slot1:getChildByName("desc_text"):setString(string.format(TI18N("当前周期剩余天数：\n活动周期重置后，累计等级、任务进度经验将会\n清除，请尽快完成任务领取奖励哦！")))

	slot0.reamin_day = slot1:getChildByName("reamin_day")
end

function NewOrderActionEndWarnWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openEndWarnView(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEndWarnView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_ok, function ()
		uv0:openEndWarnView(false)
	end, true, 1)
	registerButtonEventListener(slot0.btn_unlock, function ()
		uv0:openEndWarnView(false)
		uv0:openBuyCardView(true)
	end, true, 1)
end

function NewOrderActionEndWarnWindow.openRootWnd(slot0, slot1)
	slot2 = ""

	slot0.reamin_day:setString(30 - (slot1 or 0) .. TI18N("天"))
end

function NewOrderActionEndWarnWindow.close_callback(slot0)
	uv0:openEndWarnView(false)
end
