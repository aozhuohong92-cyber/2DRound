ActionResetChargeWindow = ActionResetChargeWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()

function ActionResetChargeWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.TOP_TAG
	slot0.layout_name = "action/action_reset_charge_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_reset_charge_bg"),
			type = ResourcesType.single
		}
	}
end

function ActionResetChargeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.background:setPosition(360, 640)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.info_panel = slot0.main_container:getChildByName("info_panel")
	slot0.btn_close = slot0.info_panel:getChildByName("btn_close")
end

function ActionResetChargeWindow.openRootWnd(slot0)
end

function ActionResetChargeWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openActionResetChargeWindow(false)
	end, true, 2)
end

function ActionResetChargeWindow.close_callback(slot0)
	doStopAllActions(slot0.main_container)
	uv0:openActionResetChargeWindow(false)
end
