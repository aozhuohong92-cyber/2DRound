ElementController = ElementController or BaseClass(BaseController)

function ElementController.config(slot0)
	slot0.model = ElementModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ElementController.getModel(slot0)
	return slot0.model
end

function ElementController.registerEvents(slot0)
end

function ElementController.registerProtocals(slot0)
	slot0:RegisterProtocal(25000, "handle25000")
	slot0:RegisterProtocal(25001, "handle25001")
	slot0:RegisterProtocal(25002, "handle25002")
	slot0:RegisterProtocal(25003, "handle25003")
	slot0:RegisterProtocal(25004, "handle25004")
	slot0:RegisterProtocal(25005, "handle25005")
end

function ElementController.sender25000(slot0)
	slot0:SendProtocal(25000, {})
end

function ElementController.handle25000(slot0, slot1)
	if slot1 then
		slot0.model:setElementData(slot1)
		GlobalEvent:getInstance():Fire(ElementEvent.Update_Element_Data_Event)

		if NEEDCHANGEENTERSTATUS == 3 and not slot0.first_enter then
			slot0.first_enter = true

			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.ElementWar)
		end
	end
end

function ElementController.sender25001(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(25001, {
		type = slot1,
		boss_id = slot2,
		formation_type = slot3,
		pos_info = slot4,
		hallows_id = slot5
	})
end

function ElementController.handle25001(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function ElementController.sender25002(slot0, slot1, slot2)
	slot0:SendProtocal(25002, {
		type = slot1,
		boss_id = slot2
	})
end

function ElementController.handle25002(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function ElementController.sender25003(slot0)
	slot0:SendProtocal(25003, {})
end

function ElementController.handle25003(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.code == 1 and slot0._temp_ele_type and slot0._temp_customs_id and slot0._temp_formation_type and slot0._temp_pos_info and slot0._temp_hallows_id then
			slot0:sender25001(slot0._temp_ele_type, slot0._temp_customs_id, slot0._temp_formation_type, slot0._temp_pos_info, slot0._temp_hallows_id)

			slot0._temp_ele_type = nil
			slot0._temp_customs_id = nil
			slot0._temp_formation_type = nil
			slot0._temp_pos_info = nil
			slot0._temp_hallows_id = nil
		elseif slot1.code == 1 and slot0._temp_type and slot0._temp_boss_id then
			slot0:sender25002(slot0._temp_type, slot0._temp_boss_id)

			slot0._temp_type = nil
			slot0._temp_boss_id = nil
		end
	end
end

function ElementController.handle25004(slot0, slot1)
	if slot1 then
		slot0.model:updateElementCountData(slot1)
		GlobalEvent:getInstance():Fire(ElementEvent.Update_Element_Count_Event)
	end
end

function ElementController.handle25005(slot0, slot1)
	if slot1 then
		slot0.model:updateElementCustomsData(slot1)
		GlobalEvent:getInstance():Fire(ElementEvent.Update_Element_Customs_Event)
	end
end

function ElementController.checkJoinHeavenBattle(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.model:getLeftChallengeCount() > 0 then
		slot0:sender25001(slot1, slot2, slot3, slot4, slot5)
		HeroController:getInstance():openFormGoFightPanel(false)
	elseif slot0.model:getTodayLeftBuyCount() > 0 then
		slot8 = RoleController:getInstance():getModel():checkPrivilegeStatus(4)

		if Config.ElementTempleData.data_buy_count[slot0.model:getNormalBuyCount() + 1] then
			CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进入战斗？"), PathTool.getItemRes(3), slot7.cost), TI18N("确定"), function ()
				uv0._temp_ele_type = uv1
				uv0._temp_customs_id = uv2
				uv0._temp_formation_type = uv3
				uv0._temp_pos_info = uv4
				uv0._temp_hallows_id = uv5

				uv0:sender25003()
				HeroController:getInstance():openFormGoFightPanel(false)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		elseif slot8 == true and Config.ElementTempleData.data_privilege[slot0.model:getPrivilegeBuyCount() + 1] then
			CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进入战斗？"), PathTool.getItemRes(3), slot10), TI18N("确定"), function ()
				uv0._temp_ele_type = uv1
				uv0._temp_customs_id = uv2
				uv0._temp_formation_type = uv3
				uv0._temp_pos_info = uv4
				uv0._temp_hallows_id = uv5

				uv0:sender25003()
				HeroController:getInstance():openFormGoFightPanel(false)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	else
		message(TI18N("挑战次数不足"))
		HeroController:getInstance():openFormGoFightPanel(false)
	end
end

function ElementController.checkSweepHeaven(slot0, slot1, slot2)
	if slot0.model:getLeftChallengeCount() > 0 then
		slot0:sender25002(slot1, slot2)
	elseif slot0.model:getTodayLeftBuyCount() > 0 then
		slot5 = RoleController:getInstance():getModel():checkPrivilegeStatus(4)

		if Config.ElementTempleData.data_buy_count[slot0.model:getNormalBuyCount() + 1] then
			CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进行扫荡？"), PathTool.getItemRes(3), slot4.cost), TI18N("确定"), function ()
				uv0._temp_type = uv1
				uv0._temp_boss_id = uv2

				uv0:sender25003()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		elseif slot5 == true and Config.ElementTempleData.data_privilege[slot0.model:getPrivilegeBuyCount() + 1] then
			CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进行扫荡？"), PathTool.getItemRes(3), slot7), TI18N("确定"), function ()
				uv0._temp_type = uv1
				uv0._temp_boss_id = uv2

				uv0:sender25003()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	else
		message(TI18N("挑战次数不足"))
	end
end

function ElementController.openElementMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkElementIsOpen() then
			return
		end

		if slot0.element_main_wnd == nil then
			slot0.element_main_wnd = ElementMainWindow.New()
		end

		if slot0.element_main_wnd:isOpen() == false then
			slot0.element_main_wnd:open(slot2)
		end
	elseif slot0.element_main_wnd then
		slot0.element_main_wnd:close()

		slot0.element_main_wnd = nil
	end
end

function ElementController.openElementEctypeWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.element_ectype_wnd == nil then
			slot0.element_ectype_wnd = ElementEctypeWindow.New()
		end

		if slot0.element_ectype_wnd:isOpen() == false then
			slot0.element_ectype_wnd:open(slot2)
		end
	elseif slot0.element_ectype_wnd then
		slot0.element_ectype_wnd:close()

		slot0.element_ectype_wnd = nil
	end
end

function ElementController.openElementRankWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.element_rank_wnd == nil then
			slot0.element_rank_wnd = ElementRankWindow.New()
		end

		if slot0.element_rank_wnd:isOpen() == false then
			slot0.element_rank_wnd:open(slot2, slot3)
		end
	elseif slot0.element_rank_wnd then
		slot0.element_rank_wnd:close()

		slot0.element_rank_wnd = nil
	end
end

function ElementController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
