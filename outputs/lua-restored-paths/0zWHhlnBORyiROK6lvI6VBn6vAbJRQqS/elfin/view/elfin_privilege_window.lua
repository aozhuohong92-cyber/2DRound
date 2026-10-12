slot1 = ElfinController:getInstance():getModel()
slot2 = table.insert
ElfinPrivilegeWindow = ElfinPrivilegeWindow or BaseClass(BaseView)

function ElfinPrivilegeWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_privilege_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "txt_cn_privilege_bg"),
			type = ResourcesType.single
		}
	}
end

function ElfinPrivilegeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.go_to_btn = slot1:getChildByName("go_to_btn")
	slot0.btn_lab = slot0.go_to_btn:getChildByName("label")

	slot0.btn_lab:setString(TI18N("前往激活"))

	slot0.btn_close = slot1:getChildByName("btn_close")

	slot1:getChildByName("txt_tips_1"):setString(TI18N("解锁全新幽地，培养效率提升"))
	slot1:getChildByName("txt_tips_2"):setString(TI18N("获得专属传奇灵碑，培养极品幽灵"))
	slot1:getChildByName("txt_tips_3"):setString(TI18N("每日赠送普通灵碑，连续7天"))
	slot1:getChildByName("txt_tips_1"):setTextColor(cc.c3b(144, 93, 56))
	slot1:getChildByName("txt_tips_2"):setTextColor(cc.c3b(144, 93, 56))
	slot1:getChildByName("txt_tips_3"):setTextColor(cc.c3b(144, 93, 56))
end

function ElfinPrivilegeWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinPrivilegeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openElfinPrivilegeWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.go_to_btn, function ()
		if RoleController:getInstance():getModel():getPrivilegeDataById(5) and slot0.expire_time and slot0.status == 1 then
			return
		end

		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
		uv0:openElfinPrivilegeWindow(false)
	end, true)
end

function ElfinPrivilegeWindow.openRootWnd(slot0)
	if RoleController:getInstance():getModel():getPrivilegeDataById(5) and slot1.expire_time and slot1.status == 1 then
		setChildUnEnabled(true, slot0.go_to_btn)
		slot0.btn_lab:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_lab:setString(TI18N("已激活"))
	else
		setChildUnEnabled(false, slot0.go_to_btn)
		slot0.btn_lab:enableOutline(Config.ColorData.data_color4[264], 2)
		slot0.btn_lab:setString(TI18N("前往激活"))
	end
end

function ElfinPrivilegeWindow.close_callback(slot0)
	uv0:openElfinPrivilegeWindow(false)
end
