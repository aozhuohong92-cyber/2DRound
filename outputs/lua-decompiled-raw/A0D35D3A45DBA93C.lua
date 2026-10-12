slot1 = PetardActionController:getInstance():getModel()
PetardActionTips = PetardActionTips or BaseClass(BaseView)

function PetardActionTips.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "petard/petard_action_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_petard_open"),
			type = ResourcesType.single
		}
	}
end

function PetardActionTips.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.petard_btn = slot1:getChildByName("petard_btn")

	slot0.petard_btn:getChildByName("label"):setString(TI18N("燃放烟花"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.tips_txt = slot1:getChildByName("tips_txt")

	slot0.tips_txt:setString(TI18N("燃放烟花后将获得全服红包"))
end

function PetardActionTips.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.petard_btn, handler(slot0, slot0.onClickPetardBtn), true)
end

function PetardActionTips.onClickPetardBtn(slot0)
	uv0:openSelectItemWindow(true)
	uv0:openPetardActionTips(false)
end

function PetardActionTips.onClickCloseBtn(slot0)
	uv0:openPetardActionTips(false)
end

function PetardActionTips.openRootWnd(slot0)
	uv0:sender27000()
end

function PetardActionTips.close_callback(slot0)
	uv0:openPetardActionTips(false)
end
