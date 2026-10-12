BattleDramaAutoCombatWindow = BattleDramaAutoCombatWindow or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()

function BattleDramaAutoCombatWindow.__init(slot0)
	slot0.layout_name = "battledrama/battle_drama_auto_combat"
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
end

function BattleDramaAutoCombatWindow.open_callback(slot0)
	slot0.background_panel = slot0.root_wnd:getChildByName("background_panel")

	slot0.background_panel:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.main_container = slot0.main_panel:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.label = createRichLabel(24, 175, cc.p(0, 0.5), cc.p(30, 60), nil, , 500)

	slot0.main_container:addChild(slot0.label)
	slot0.label:setString(TI18N("开启连续作战将自动不断向下一关卡挑战，离线也不会中断，直到挑战失败或背包载满"))

	slot0.checkbox = slot0.main_panel:getChildByName("checkbox")
	slot0.checkbox_label = slot0.main_panel:getChildByName("checkbox_label")

	slot0.checkbox:setSelected(false)

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
end

function BattleDramaAutoCombatWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openDramBattleAutoCombatView(false)
			end
		end)
	end

	if slot0.cancel_btn then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()

				if uv0.checkbox:isSelected() then
					uv1.auto_combat = 0
				end

				uv2:send13003(0)
				uv2:openDramBattleAutoCombatView(false)
			end
		end)
	end

	if slot0.ok_btn then
		slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()

				if uv0.checkbox:isSelected() then
					uv1.auto_combat = 1
				end

				uv2:send13003(1)
				uv2:openDramBattleAutoCombatView(false)
			end
		end)
	end
end
