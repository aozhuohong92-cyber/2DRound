slot1 = MonopolyController:getInstance():getModel()
slot2 = table.insert
slot3 = {
	1,
	3,
	2
}
MonopolyMorraWindow = MonopolyMorraWindow or BaseClass(BaseView)

function MonopolyMorraWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "monopoly/monopoly_morra_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopolymorra"),
			type = ResourcesType.plist
		}
	}
	slot0.is_can_close = false
end

function MonopolyMorraWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("title_txt"):setString(TI18N("石头剪刀布"))

	slot0.left_role_layout = slot1:getChildByName("left_role_layout")
	slot0.right_role_layout = slot1:getChildByName("right_role_layout")

	slot0:createRoleSpine()

	slot5 = "chose_panel"
	slot0.chose_panel = slot1:getChildByName(slot5)
	slot0.morra_object_list = {}

	for slot5 = 1, 3 do
		slot6 = {
			morra_btn = slot0.chose_panel:getChildByName("morra_btn_" .. slot5)
		}
		slot7, slot8 = slot6.morra_btn:getPosition()
		slot6.pos = cc.p(slot7, slot8)
		slot6.num = uv0[slot5]

		uv1(slot0.morra_object_list, slot6)
	end

	slot0.select_img = slot0.chose_panel:getChildByName("select_img")

	slot0.select_img:setVisible(false)

	slot0.rule_btn = slot0.chose_panel:getChildByName("rule_btn")

	slot0.rule_btn:setVisible(false)

	slot0.affirm_btn = slot0.chose_panel:getChildByName("affirm_btn")

	slot0.affirm_btn:getChildByName("label"):setString(TI18N("出手"))

	slot0.result_panel = slot1:getChildByName("result_panel")

	slot0.result_panel:setVisible(false)

	slot0.left_result_sp = slot0.result_panel:getChildByName("left_result_sp")

	slot0.left_result_sp:setPositionX(-100)
	slot0.left_result_sp:setOpacity(0)
	slot0.left_result_sp:getChildByName("label"):setString(TI18N("我方"))

	slot0.right_result_sp = slot0.result_panel:getChildByName("right_result_sp")

	slot0.right_result_sp:setPositionX(730)
	slot0.right_result_sp:setOpacity(0)
	slot0.right_result_sp:getChildByName("label"):setString(TI18N("敌方"))

	slot0.win_sp = slot0.result_panel:getChildByName("win_sp")

	slot0.win_sp:setVisible(false)

	slot0.vs_sp_1 = slot0.result_panel:getChildByName("vs_sp_1")

	slot0.vs_sp_1:setOpacity(0)
	slot0.vs_sp_1:setScale(3)
end

function MonopolyMorraWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.rule_btn, handler(slot0, slot0.onClickRuleBtn), true)

	slot4 = handler(slot0, slot0.onClickAffirmBtn)
	slot5 = true

	registerButtonEventListener(slot0.affirm_btn, slot4, slot5, 1, nil, , 0.5)

	for slot4, slot5 in ipairs(slot0.morra_object_list) do
		if slot5.morra_btn then
			registerButtonEventListener(slot5.morra_btn, function ()
				uv0:onClickMorraBtn(uv1)
			end, true)
		end
	end

	slot0:addGlobalEvent(MonopolyEvent.Get_Morra_Result_Event, function (slot0)
		uv0:onGetResultData(slot0)
	end)
end

function MonopolyMorraWindow.onClickMorraBtn(slot0, slot1)
	if slot0.morra_object_list[slot1] then
		slot0.select_img:setPosition(slot2.pos)
		slot0.select_img:setVisible(true)

		slot0.chose_morra_num = slot2.num
	end
end

function MonopolyMorraWindow.onClickCloseBtn(slot0)
	if slot0.is_can_close then
		uv0:openMonopolyMorraWindow(false)
	end
end

function MonopolyMorraWindow.onClickRuleBtn(slot0)
end

function MonopolyMorraWindow.onClickAffirmBtn(slot0)
	if not slot0.chose_morra_num then
		message(TI18N("你还没有选择任何一项"))

		return
	end

	slot0.select_img:setVisible(false)

	function slot1()
		uv0.chose_panel:setVisible(false)
		uv0.result_panel:setVisible(true)
		uv0.left_result_sp:runAction(cc.Spawn:create(cc.FadeIn:create(0.2), cc.MoveTo:create(0.2, cc.p(180, 210))))
		uv0.right_result_sp:runAction(cc.Spawn:create(cc.FadeIn:create(0.2), cc.MoveTo:create(0.2, cc.p(540, 210))))
		uv0.vs_sp_1:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.Spawn:create(cc.FadeIn:create(0.1), cc.ScaleTo:create(0.1, 1))))
		uv1:sender27404({
			{
				arg2 = 0,
				type = 4,
				arg1 = uv0.chose_morra_num
			}
		})
	end

	for slot5, slot6 in ipairs(slot0.morra_object_list) do
		if slot5 == 1 then
			slot6.morra_btn:runAction(cc.Spawn:create(cc.FadeOut:create(0.2), cc.MoveTo:create(0.2, cc.p(-100, 210))))
		elseif slot5 == 2 then
			slot6.morra_btn:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(slot1)))
		else
			slot6.morra_btn:runAction(cc.Spawn:create(cc.FadeOut:create(0.2), cc.MoveTo:create(0.2, cc.p(730, 210))))
		end
	end
end

function MonopolyMorraWindow.createRoleSpine(slot0)
	slot3 = "H60001"

	if Config.HomeData.data_figure[uv0:getHomeLookId()] then
		slot3 = slot2.look_id
	end

	slot0.left_role_spine = createEffectSpine(slot3, cc.p(160, -30), cc.p(0.5, 0.5), true, PlayerAction.idle)

	slot0.left_role_spine:setScale(1)
	slot0.left_role_layout:addChild(slot0.left_role_spine)

	slot0.right_role_spine = createEffectSpine("H60004", cc.p(160, -30), cc.p(0.5, 0.5), true, PlayerAction.idle)

	slot0.right_role_spine:setScaleX(-1)
	slot0.right_role_layout:addChild(slot0.right_role_spine)
end

function MonopolyMorraWindow.showMorraResultAni(slot0, slot1, slot2, slot3)
	slot0.left_result_sp:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 0.01, 1.4), cc.CallFunc:create(function ()
		loadSpriteTexture(uv0.left_result_sp, uv0:getMorraResByNum(uv1), LOADTEXT_TYPE_PLIST)
	end), cc.ScaleTo:create(0.1, 1)))
	slot0.right_result_sp:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 0.01, 1.4), cc.CallFunc:create(function ()
		loadSpriteTexture(uv0.right_result_sp, uv0:getMorraResByNum(uv1), LOADTEXT_TYPE_PLIST)
	end), cc.ScaleTo:create(0.1, 1)))
	slot0.win_sp:setVisible(false)

	if slot3 == 1 then
		slot0.win_sp:setVisible(true)
		slot0.win_sp:setPosition(244, 144)
	elseif slot3 == 2 then
		slot0.win_sp:setVisible(true)
		slot0.win_sp:setPosition(478, 144)
	end

	slot0.is_can_close = true
end

function MonopolyMorraWindow.getMorraResByNum(slot0, slot1)
	slot2 = PathTool.getResFrame("monopoly", "monopolymorra_1007", false, "monopolymorra")

	if slot1 == 2 then
		slot2 = PathTool.getResFrame("monopoly", "monopolymorra_1006", false, "monopolymorra")
	elseif slot1 == 3 then
		slot2 = PathTool.getResFrame("monopoly", "monopolymorra_1005", false, "monopolymorra")
	end

	return slot2
end

function MonopolyMorraWindow.onGetResultData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:showMorraResultAni(slot1.choice, slot1.system_choice, slot1.ret)
end

function MonopolyMorraWindow.openRootWnd(slot0)
end

function MonopolyMorraWindow.close_callback(slot0)
	if slot0.left_role_layout then
		slot0.left_role_layout:setClippingEnabled(false)
	end

	if slot0.right_role_layout then
		slot0.right_role_layout:setClippingEnabled(false)
	end

	if slot0.left_role_spine then
		slot0.left_role_spine:clearTracks()
		slot0.left_role_spine:removeFromParent()

		slot0.left_role_spine = nil
	end

	if slot0.right_role_spine then
		slot0.right_role_spine:clearTracks()
		slot0.right_role_spine:removeFromParent()

		slot0.right_role_spine = nil
	end

	uv0:openMonopolyMorraWindow(false)
end
