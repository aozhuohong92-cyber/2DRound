slot1 = PetardActionController:getInstance():getModel()
PetardAffirmWindow = PetardAffirmWindow or BaseClass(BaseView)

function PetardAffirmWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "petard/petard_affirm_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionpetard", "actionpetard"),
			type = ResourcesType.plist
		}
	}
end

function PetardAffirmWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.affirm_btn = slot1:getChildByName("affirm_btn")

	slot0.affirm_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))
	slot1:getChildByName("win_title"):setString(TI18N("提示"))
	slot1:getChildByName("tips_txt"):setString(TI18N("即将返回主城燃放庆典烟花，是否继续？燃放烟花后，您将获得一个红包。"))
end

function PetardAffirmWindow.register_event(slot0)
	registerButtonEventListener(slot0.affirm_btn, handler(slot0, slot0.onClickAffirmBtn), true)
	registerButtonEventListener(slot0.cancel_btn, handler(slot0, slot0.onClickCancelBtn), true, 2)
end

function PetardAffirmWindow.onClickAffirmBtn(slot0)
	if slot0.item_bid and slot0.item_num then
		PetardActionController:getInstance():sender27001(slot0.item_bid, slot0.item_num)
	end
end

function PetardAffirmWindow.onClickCancelBtn(slot0)
	uv0:openAffirmWindow(false)
end

function PetardAffirmWindow.openRootWnd(slot0, slot1, slot2)
	slot0.item_bid = slot1
	slot0.item_num = slot2
end

function PetardAffirmWindow.close_callback(slot0)
	uv0:openAffirmWindow(false)
end
