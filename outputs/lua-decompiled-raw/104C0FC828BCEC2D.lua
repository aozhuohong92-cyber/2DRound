UserProtoPanel = UserProtoPanel or BaseClass(BaseView)
slot0 = LoginController:getInstance()

function UserProtoPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "login/user_proto_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("login", "login2"),
			type = ResourcesType.plist
		}
	}
	slot0.is_agree = false
end

function UserProtoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("用户协议"))

	slot0.content_label = createRichLabel(28, cc.c3b(110, 110, 110), cc.p(0, 1), cc.p(50, 445), 34, nil, 580)

	slot0.main_container:addChild(slot0.content_label)
	slot0.content_label:setString(TI18N("　　在您使用本游戏前阅读并同意游戏用户协议和隐私保护指引。"))

	slot0.gotoe_label = createRichLabel(26, cc.c3b(110, 110, 110), cc.p(0, 1), cc.p(50, 320), 34, nil, 580)

	slot0.gotoe_label:setString(TI18N("　　请点击查看<div href=onclick_1 fontcolor=#4273e1>《用户游戏协议》</div>和<div href=onclick_2 fontcolor=#4273e1>《 隐私保护指引》</div> 您点击“确认并同意”即表示您已阅读并同意上述条款。"))
	slot0.gotoe_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if slot1 == "onclick_1" then
			if IS_IOS_PLATFORM == true then
				sdkCallFunc("openSyW", "https://game.shiyuegame.com/article_detail_10_34.html")
			else
				sdkCallFunc("openUrl", slot4)
			end
		elseif slot1 == "onclick_2" then
			if IS_IOS_PLATFORM == true then
				sdkCallFunc("openSyW", "https://game.shiyuegame.com/article_detail_10_37.html")
			else
				sdkCallFunc("openUrl", slot4)
			end
		end
	end, {
		"click",
		"href"
	})
	slot0.main_container:addChild(slot0.gotoe_label)

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("确认并同意"))
end

function UserProtoPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.onClickComfirmBtn), true, 2)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCancelBtn), true, 2)
	registerButtonEventListener(slot0.checkbox, function ()
		uv0.is_agree = uv0.checkbox:isSelected()
	end, false, 1)
end

function UserProtoPanel.onClickBtnClose(slot0)
	uv0:openUserProtoPanel(false)
end

function UserProtoPanel.onClickComfirmBtn(slot0)
	if slot0.callback then
		slot0.callback()
	end

	SysEnv:getInstance():set(SysEnv.keys.user_proto_agree, true, true)
	slot0:onClickBtnClose()
end

function UserProtoPanel.onClickCancelBtn(slot0)
	slot0:onClickBtnClose()
end

function UserProtoPanel.openRootWnd(slot0, slot1)
	slot0.callback = slot1
end

function UserProtoPanel.close_callback(slot0)
	uv0:openUserProtoPanel(false)
end
