PractisetowerController = PractisetowerController or BaseClass(BaseController)

function PractisetowerController.config(slot0)
	slot0.model = PractisetowerModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PractisetowerController.getModel(slot0)
	return slot0.model
end

function PractisetowerController.registerEvents(slot0)
end

function PractisetowerController.registerProtocals(slot0)
	slot0:RegisterProtocal(29100, "handle29100")
	slot0:RegisterProtocal(29101, "handle29101")
	slot0:RegisterProtocal(29102, "handle29102")
	slot0:RegisterProtocal(29103, "handle29103")
	slot0:RegisterProtocal(29104, "handle29104")
	slot0:RegisterProtocal(29105, "handle29105")
	slot0:RegisterProtocal(29106, "handle29106")
	slot0:RegisterProtocal(29107, "handle29107")
end

function PractisetowerController.openMainView(slot0, slot1)
	if slot1 == false then
		if slot0.main_view ~= nil then
			slot0.main_view:close()

			slot0.main_view = nil
		end
	else
		if not slot0.main_view then
			slot0.main_view = PractiseTowerWindow.New()
		end

		if slot0.main_view and slot0.main_view:isOpen() == false then
			slot0.main_view:open()
		end
	end
end

function PractisetowerController.openRankWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.rank_window then
			slot0.rank_window = PractisetowerRankWindow.New()
		end

		if slot0.rank_window and slot0.rank_window:isOpen() == false then
			slot0.rank_window:open()
		end
	elseif slot0.rank_window then
		slot0.rank_window:close()

		slot0.rank_window = nil
	end
end

function PractisetowerController.openResultWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.result_window then
			slot0.result_window = PractiseTowerResultWindow.New(slot2.flag, BattleConst.Fight_Type.PractiseTower)
		end

		if slot0.result_window and slot0.result_window:isOpen() == false then
			slot0.result_window:open(slot2, BattleConst.Fight_Type.PractiseTower)
		end
	elseif slot0.result_window then
		slot0.result_window:close()

		slot0.result_window = nil
	end
end

function PractisetowerController.sender29100(slot0)
	slot0:SendProtocal(29100, {})
end

function PractisetowerController.handle29100(slot0, slot1)
	slot0.model:setPractiseTowerData(slot1)
end

function PractisetowerController.sender29104(slot0)
	slot0:SendProtocal(29104, {})
end

function PractisetowerController.handle29104(slot0, slot1)
	slot2 = slot0.model:getIsTouchFight()

	if slot1.flag == 1 and slot2 ~= nil and slot2.id ~= nil and slot2.power ~= nil then
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.PractiseTower, {
			select_base_id = slot2.id,
			is_send = false,
			power = slot2.power
		})
		slot0.model:setIsTouchFight(nil)
	end

	message(slot1.msg)
end

function PractisetowerController.sender29101(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(29101, {
		id = slot1,
		formation_type = slot2,
		pos_info = slot3,
		hallows_id = slot4
	})
end

function PractisetowerController.handle29101(slot0, slot1)
	message(slot1.msg)
end

function PractisetowerController.handle29102(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.PractiseTower, slot1)
end

function PractisetowerController.sender29103(slot0)
	slot0:SendProtocal(29103, {})
end

function PractisetowerController.handle29103(slot0, slot1)
	message(slot1.msg)

	slot2 = slot0.model:getResetFightId()

	if slot1.flag == 1 and slot2 and slot2.id ~= nil and slot2.power ~= nil then
		HeroController:getInstance():openFormGoFightPanel(false)
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.PractiseTower, {
			select_base_id = slot2.id,
			is_send = true,
			power = slot2.power
		})
		slot0:openResultWindow(false)
	end

	slot0.model:setResetFightId(nil)
end

function PractisetowerController.sender29105(slot0)
	slot0:SendProtocal(29105, {})
end

function PractisetowerController.handle29105(slot0, slot1)
	GlobalEvent:getInstance():Fire(PractisetowerEvent.Update_Top3_rank, slot1)
end

function PractisetowerController.handle29106(slot0, slot1)
	slot0.model:updateMyRank(slot1)
end

function PractisetowerController.sender29107(slot0, slot1)
	slot0:SendProtocal(29107, {
		type = slot1
	})
end

function PractisetowerController.handle29107(slot0, slot1)
end

function PractisetowerController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
