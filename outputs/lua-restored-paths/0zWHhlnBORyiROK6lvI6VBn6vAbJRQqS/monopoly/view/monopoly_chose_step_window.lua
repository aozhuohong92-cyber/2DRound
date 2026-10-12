slot1 = MonopolyController:getInstance():getModel()
slot2 = table.insert
MonopolyChoseStepWindow = MonopolyChoseStepWindow or BaseClass(BaseView)

function MonopolyChoseStepWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "monopoly/monopoly_chose_step_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_big_bg_2"),
			type = ResourcesType.single
		}
	}
end

function MonopolyChoseStepWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("tips_txt"):setString(TI18N("想走几步都可以做到哦"))

	slot5 = "close_btn"
	slot0.close_btn = slot1:getChildByName(slot5)
	slot0.step_btn_list = {}

	for slot5 = 1, 4 do
		if slot1:getChildByName("step_btn_" .. slot5) then
			uv0(slot0.step_btn_list, slot6)
		end
	end
end

function MonopolyChoseStepWindow.register_event(slot0)
	slot4 = handler(slot0, slot0.onClickCloseBtn)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.step_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickStepBtn(uv1)
		end, true)
	end

	slot0:addGlobalEvent(MonopolyEvent.Get_Dice_Result_Event, function (slot0)
		uv0:onGetDiceResultData(slot0)
	end)
end

function MonopolyChoseStepWindow.onGetDiceResultData(slot0, slot1)
	if not slot1 then
		return
	end

	GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Role_Move_Event, slot1)
	uv0:openMonopolyChoseStepWindow(false)
end

function MonopolyChoseStepWindow.onClickCloseBtn(slot0)
	uv0:openMonopolyChoseStepWindow(false)
end

function MonopolyChoseStepWindow.onClickStepBtn(slot0, slot1)
	uv0:sender27403(2, slot1)
end

function MonopolyChoseStepWindow.openRootWnd(slot0)
end

function MonopolyChoseStepWindow.close_callback(slot0)
	uv0:openMonopolyChoseStepWindow(false)
end
