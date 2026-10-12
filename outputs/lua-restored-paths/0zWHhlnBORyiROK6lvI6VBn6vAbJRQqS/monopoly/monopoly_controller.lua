MonopolyController = MonopolyController or BaseClass(BaseController)

function MonopolyController.config(slot0)
	slot0.model = MonopolyModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function MonopolyController.getModel(slot0)
	return slot0.model
end

function MonopolyController.registerEvents(slot0)
end

function MonopolyController.registerProtocals(slot0)
	slot0:RegisterProtocal(27400, "handle27400")
	slot0:RegisterProtocal(27401, "handle27401")
	slot0:RegisterProtocal(27403, "handle27403")
	slot0:RegisterProtocal(27404, "handle27404")
	slot0:RegisterProtocal(27405, "handle27405")
	slot0:RegisterProtocal(27406, "handle27406")
	slot0:RegisterProtocal(27407, "handle27407")
	slot0:RegisterProtocal(27408, "handle27408")
	slot0:RegisterProtocal(27409, "handle27409")
	slot0:RegisterProtocal(27410, "handle27410")
	slot0:RegisterProtocal(27500, "handle27500")
	slot0:RegisterProtocal(27501, "handle27501")
	slot0:RegisterProtocal(27502, "handle27502")
	slot0:RegisterProtocal(27503, "handle27503")
	slot0:RegisterProtocal(27504, "handle27504")
	slot0:RegisterProtocal(27505, "handle27505")
	slot0:RegisterProtocal(27506, "handle27506")
end

function MonopolyController.sender27400(slot0)
	slot0:SendProtocal(27400, {})
end

function MonopolyController.handle27400(slot0, slot1)
	if slot1.flag == 1 then
		slot0.model:setMonopolyBaseInfo(slot1)
		GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Monopoly_Base_Data_Event)
	else
		slot0:openHolynightMainWindow(false)
		slot0:openMonopolyMianScene(false)
		slot0:openHolynightBossWindow(false)
		slot0:openMonopolyDialogWindow(false)
		slot0:openMonopolyTips(false)
		slot0:openMonopolyChoseStepWindow(false)
		slot0:openMonopolyPumpkinWindow(false)
		slot0:openMonopolyMorraWindow(false)
		slot0:openMonopolyRankWindow(false)
		slot0:openMonopolyItemShowWindow(false)
	end
end

function MonopolyController.sender27401(slot0, slot1)
	slot0:SendProtocal(27401, {
		id = slot1
	})
end

function MonopolyController.handle27401(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.flag == TRUE then
		slot0.model:updateMonopolyMapData({
			id = slot1.id,
			map_id = slot1.map_id,
			pos = slot1.pos,
			events = slot1.events or {},
			now_type = slot1.now_type or 0
		})
		slot0.model:updateDevelopValById(slot1.id, slot1.develop)
		slot0.model:updateGuildDevelopValById(slot1.id, slot1.guild_develop)
		slot0.model:setHomeLookId(slot1.look_id)
		GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Monopoly_Map_Data_Event)
	end
end

function MonopolyController.sender27403(slot0, slot1, slot2)
	slot0:SendProtocal(27403, {
		type = slot1,
		num = slot2
	})
end

function MonopolyController.handle27403(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.flag == TRUE then
		slot0.model:updateMonopolyMapData({
			id = slot1.id,
			pos = slot1.pos,
			now_type = slot1.now_type
		})
		slot0.model:updateDevelopValById(slot1.id, slot1.develop)
		slot0.model:updateGuildDevelopValById(slot1.id, slot1.guild_develop)

		if slot0.model:checkIsInCurMap(slot1.id) then
			slot3 = false

			if not slot0.monopoly_pumpkin_wnd and not slot0.chose_step_wnd then
				slot3 = true
			end

			GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Dice_Result_Event, slot1.num, slot3)
		end
	end
end

function MonopolyController.sender27404(slot0, slot1)
	slot0:SendProtocal(27404, {
		args = slot1
	})
end

function MonopolyController.handle27404(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.flag == TRUE and slot0.model:checkIsInCurMap(slot1.id) then
		slot0.model:clearMonopolyNowEvtType(slot1.id)
		slot0.model:updateMonopolyEventType(slot1.id, slot1.pos, slot1.type)
	end
end

function MonopolyController.handle27405(slot0, slot1)
	GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Morra_Result_Event, slot1)
end

function MonopolyController.handle27406(slot0, slot1)
	if slot1.type and Config.MonopolyMapsData.data_drama[slot1.type] and next(slot2) ~= nil then
		slot0:openMonopolyDialogWindow(true, 99, 0, slot2)
	end
end

function MonopolyController.sender27407(slot0, slot1, slot2)
	slot0:SendProtocal(27407, {
		type = slot1,
		choice = slot2
	})
end

function MonopolyController.handle27407(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function MonopolyController.sender27408(slot0, slot1)
	slot0:SendProtocal(27408, {
		id = slot1
	})
end

function MonopolyController.handle27408(slot0, slot1)
	GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Monopoly_Buff_Event, slot1)
end

function MonopolyController.handle27409(slot0, slot1)
	if slot1.buffs and next(slot1.buffs) ~= nil then
		slot0.model:addWaitShowTipsData(slot1.buffs)
	end

	if slot1.reward and next(slot1.reward) ~= nil then
		slot0.model:addWaitShowAwardData(slot1.reward)
	end

	slot0:checkShowWaitTips()
end

function MonopolyController.sender27410(slot0, slot1)
	slot0:SendProtocal(27410, {
		id = slot1
	})
end

function MonopolyController.handle27410(slot0, slot1)
	GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Master_Data_Event, slot1)
end

function MonopolyController.sender27500(slot0, slot1)
	slot0:SendProtocal(27500, {
		id = slot1
	})
end

function MonopolyController.handle27500(slot0, slot1)
	if slot1.flag == 1 then
		GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Boss_Data_Event, slot1)
	end
end

function MonopolyController.sender27501(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0:SendProtocal(27501, {
		id = slot1,
		boss_id = slot2,
		formation_type = slot3,
		pos_info = slot4,
		hallows_id = slot5
	})
end

function MonopolyController.handle27501(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function MonopolyController.sender27502(slot0, slot1)
	slot0:SendProtocal(27502, {
		id = slot1
	})
end

function MonopolyController.handle27502(slot0, slot1)
	GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Personal_Rank_Data_Event, slot1)
end

function MonopolyController.sender27503(slot0, slot1, slot2)
	slot0:SendProtocal(27503, {
		id = slot1,
		num = slot2
	})
end

function MonopolyController.handle27503(slot0, slot1)
	GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Guild_Rank_Data_Event, slot1)
end

function MonopolyController.sender27504(slot0)
	slot0:SendProtocal(27504, {})
end

function MonopolyController.handle27504(slot0, slot1)
	if slot1 then
		slot0.model:updateMonopolyBuffData(slot1.buffs)
		GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Buff_Data_Event)
	end
end

function MonopolyController.sender27505(slot0)
	slot0:SendProtocal(27505, {})
end

function MonopolyController.handle27505(slot0, slot1)
	slot0.model:updateMonopolyBossNum(slot1)
	GlobalEvent:getInstance():Fire(MonopolyEvent.Update_Boss_Num_Event)
end

function MonopolyController.handle27506(slot0, slot1)
	GuildbossController:getInstance():openGuildbossResultWindow(true, slot1, BattleConst.Fight_Type.MonopolyBoss)
end

function MonopolyController.triggerGridEvtByType(slot0, slot1, slot2)
	if slot1 == MonopolyConst.Event_Type.Normal then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Trap then
		slot0:openMonopolyMasterInfoWindow(true, MonopolyConst.Event_Type.Trap, slot2)
	elseif slot1 == MonopolyConst.Event_Type.Award then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Morra then
		slot0:openMonopolyMorraWindow(true)
	elseif slot1 == MonopolyConst.Event_Type.Dialog then
		slot0:openMonopolyDialogWindow(true, MonopolyConst.Event_Type.Dialog, slot2)
	elseif slot1 == MonopolyConst.Event_Type.Redbag then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Boss then
		slot0:openMonopolyMasterInfoWindow(true, MonopolyConst.Event_Type.Boss, slot2)
	elseif slot1 == MonopolyConst.Event_Type.Advance then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Buff then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Wish then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Medicine then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Flag then
		slot0:openMonopolyDialogWindow(true, MonopolyConst.Event_Type.Flag, slot2)
	elseif slot1 == MonopolyConst.Event_Type.End then
		slot0:sender27404({})
	elseif slot1 == MonopolyConst.Event_Type.Start then
		slot0:sender27404({})
	end
end

function MonopolyController.openHolynightMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.holy_main_wnd then
			slot0.holy_main_wnd = HolynightMainWindow.New()
		end

		if slot0.holy_main_wnd:isOpen() == false then
			slot0.holy_main_wnd:open(slot2)
		end
	elseif slot0.holy_main_wnd then
		slot0.holy_main_wnd:close()

		slot0.holy_main_wnd = nil
	end
end

function MonopolyController.openMonopolyMianScene(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.monopoly_main_scene then
			slot0.monopoly_main_scene = MonopolyMainScene.New()
		end

		if slot0.monopoly_main_scene:isOpen() == false then
			slot0.monopoly_main_scene:open(slot2)
		end
	else
		if slot0.monopoly_main_scene then
			slot0.monopoly_main_scene:close()

			slot0.monopoly_main_scene = nil
		end

		slot0:checkShowWaitAward()
	end
end

function MonopolyController.openHolynightBossWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.holy_boss_wnd then
			slot0.holy_boss_wnd = HolynightBossWindow.New()
		end

		if slot0.holy_boss_wnd:isOpen() == false then
			slot0.holy_boss_wnd:open(slot2)
		end
	elseif slot0.holy_boss_wnd then
		slot0.holy_boss_wnd:close()

		slot0.holy_boss_wnd = nil
	end
end

function MonopolyController.openMonopolyDialogWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.monopoly_dialog_wnd then
			slot0.monopoly_dialog_wnd = MonopolyDialogWindow.New()
		end

		if slot0.monopoly_dialog_wnd:isOpen() == false then
			slot0.monopoly_dialog_wnd:open(slot2, slot3, slot4)
		end
	elseif slot0.monopoly_dialog_wnd then
		slot0.monopoly_dialog_wnd:close()

		slot0.monopoly_dialog_wnd = nil

		slot0:checkShowWaitTips()
	end
end

function MonopolyController.openMonopolyTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.monopoly_tips then
			slot0.monopoly_tips = MonopolyTips.New()
		end

		if slot0.monopoly_tips:isOpen() == false then
			slot0.monopoly_tips:open(slot2)
		end
	elseif slot0.monopoly_tips then
		slot0.monopoly_tips:close()

		slot0.monopoly_tips = nil
	end
end

function MonopolyController.openMonopolyChoseStepWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.chose_step_wnd then
			slot0.chose_step_wnd = MonopolyChoseStepWindow.New()
		end

		if slot0.chose_step_wnd:isOpen() == false then
			slot0.chose_step_wnd:open()
		end
	elseif slot0.chose_step_wnd then
		slot0.chose_step_wnd:close()

		slot0.chose_step_wnd = nil

		slot0:checkShowWaitTips()
	end
end

function MonopolyController.openMonopolyPumpkinWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.monopoly_pumpkin_wnd then
			slot0.monopoly_pumpkin_wnd = MonopolyPumpkinWindow.New()
		end

		if slot0.monopoly_pumpkin_wnd:isOpen() == false then
			slot0.monopoly_pumpkin_wnd:open()
		end
	elseif slot0.monopoly_pumpkin_wnd then
		slot0.monopoly_pumpkin_wnd:close()

		slot0.monopoly_pumpkin_wnd = nil

		slot0:checkShowWaitTips()
	end
end

function MonopolyController.openMonopolyMorraWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.monopoly_morra_wnd then
			slot0.monopoly_morra_wnd = MonopolyMorraWindow.New()
		end

		if slot0.monopoly_morra_wnd:isOpen() == false then
			slot0.monopoly_morra_wnd:open()
		end
	elseif slot0.monopoly_morra_wnd then
		slot0.monopoly_morra_wnd:close()

		slot0.monopoly_morra_wnd = nil

		slot0:checkShowWaitTips()
	end
end

function MonopolyController.openMonopolyRankWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.monopoly_rank_wnd then
			slot0.monopoly_rank_wnd = MonopolyRankWindow.New()
		end

		if slot0.monopoly_rank_wnd:isOpen() == false then
			slot0.monopoly_rank_wnd:open(slot2, slot3)
		end
	elseif slot0.monopoly_rank_wnd then
		slot0.monopoly_rank_wnd:close()

		slot0.monopoly_rank_wnd = nil
	end
end

function MonopolyController.openMonopolyItemShowWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.monopoly_item_wnd then
			slot0.monopoly_item_wnd = MonopolyShowItemWindow.New()
		end

		if slot0.monopoly_item_wnd:isOpen() == false then
			slot0.monopoly_item_wnd:open()
		end
	elseif slot0.monopoly_item_wnd then
		slot0.monopoly_item_wnd:close()

		slot0.monopoly_item_wnd = nil
	end
end

function MonopolyController.openMonopolyMasterInfoWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.master_info_wnd then
			slot0.master_info_wnd = MonopolyMasterInfoWindow.New()
		end

		if slot0.master_info_wnd:isOpen() == false then
			slot0.master_info_wnd:open(slot2, slot3)
		end
	elseif slot0.master_info_wnd then
		slot0.master_info_wnd:close()

		slot0.master_info_wnd = nil
	end
end

function MonopolyController.checkShowWaitTips(slot0)
	if not slot0.monopoly_dialog_wnd and not slot0.chose_step_wnd and not slot0.monopoly_pumpkin_wnd and not slot0.monopoly_morra_wnd then
		if slot0.monopoly_main_scene then
			GlobalEvent:getInstance():Fire(MonopolyEvent.Get_Show_Tips_Event)
		else
			slot0:checkShowWaitAward()
		end
	end
end

function MonopolyController.checkShowWaitAward(slot0)
	slot2 = {
		[slot6] = {}
	}

	for slot6, slot7 in ipairs(slot0.model:getWaitShowAwardData() or {}) do
		slot2[slot6].bid = slot7.base_id
		slot2[slot6].num = slot7.num
	end

	if next(slot2) ~= nil then
		MainuiController:getInstance():openGetItemView(true, slot2, 0, {
			is_backpack = true
		}, MainuiConst.item_open_type.normal)
	end

	slot0.model:clearWaitShowAwardData()
end

function MonopolyController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
