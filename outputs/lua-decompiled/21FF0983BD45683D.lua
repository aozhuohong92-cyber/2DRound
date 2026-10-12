ActionyearmonsterController = ActionyearmonsterController or BaseClass(BaseController)

function ActionyearmonsterController.config(slot0)
	slot0.model = ActionyearmonsterModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ActionyearmonsterController.getModel(slot0)
	return slot0.model
end

function ActionyearmonsterController.registerEvents(slot0)
	if not slot0.red_bg_event then
		slot0.red_bg_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function (slot0)
			if slot0 and slot0.is_year_red_bag then
				uv0:openActionyearmonsterRedbagEventPanel(true, {
					info_data = slot0.info_data
				})
			end
		end)
	end
end

function ActionyearmonsterController.registerProtocals(slot0)
	slot0:RegisterProtocal(28200, "handle28200")
	slot0:RegisterProtocal(28201, "handle28201")
	slot0:RegisterProtocal(28202, "handle28202")
	slot0:RegisterProtocal(28203, "handle28203")
	slot0:RegisterProtocal(28204, "handle28204")
	slot0:RegisterProtocal(28205, "handle28205")
	slot0:RegisterProtocal(28206, "handle28206")
	slot0:RegisterProtocal(28207, "handle28207")
	slot0:RegisterProtocal(28208, "handle28208")
	slot0:RegisterProtocal(28209, "handle28209")
	slot0:RegisterProtocal(28210, "handle28210")
	slot0:RegisterProtocal(28211, "handle28211")
	slot0:RegisterProtocal(28212, "handle28212")
	slot0:RegisterProtocal(28213, "handle28213")
	slot0:RegisterProtocal(28214, "handle28214")
	slot0:RegisterProtocal(28215, "handle28215")
	slot0:RegisterProtocal(28218, "handle28218")
	slot0:RegisterProtocal(28216, "handle28216")
	slot0:RegisterProtocal(28217, "handle28217")
	slot0:RegisterProtocal(28219, "handle28219")
	slot0:RegisterProtocal(28220, "handle28220")
	slot0:RegisterProtocal(28221, "handle28221")
	slot0:RegisterProtocal(28222, "handle28222")
	slot0:RegisterProtocal(28223, "handle28223")
	slot0:RegisterProtocal(28224, "handle28224")
end

function ActionyearmonsterController.sender28200(slot0)
	slot0:SendProtocal(28200, {})
end

function ActionyearmonsterController.handle28200(slot0, slot1)
	if slot1.camp_id == 0 then
		slot0:openActionyearmonsterChallengePanel(false)
		slot0:openActionyearmonsterRedbagEventPanel(false)
		slot0:openActionyearmonsterRedbagEffectPanel(false)
		slot0:openActionyearmonsterSubmitPanel(false)
		slot0:openActionyearmonsterBagPanel(false)
		slot0:openActionyearmonsterMonsterInfo(false)
		slot0:openActionyearmonsterExchangeWindow(false)
		slot0:openActionyearmonsterMainWindow(false)

		return
	end

	slot0.model:setBaseData(slot1)
	slot0.model:setPlanesRoleLookId(slot1.look_id)
	slot0.model:setHolidayOpen(slot1.camp_id)
	HomeworldController:getInstance():getModel():setMyCurHomeFigureId(slot1.look_id)
	HomeworldController:getInstance():getModel():setActivateFigureList(slot1.list, true)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.YEAR_MONSTER_BASE_INFO, slot1)

	if RoleController:getInstance():getRoleVo() then
		if slot1.max_val <= slot1.val then
			MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.year_monster, false)
		else
			slot3 = 80351

			if Config.HolidayNianData.data_const.holiday_nian_tribute_id then
				slot3 = slot4.val
			end

			if slot2:getActionAssetsNumByBid(slot3) > 0 then
				MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.year_monster, true)
			else
				MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.year_monster, false)
			end
		end
	end
end

function ActionyearmonsterController.handle28201(slot0, slot1)
	slot0.model:setCellData(slot1)

	if slot1.tile_list and next(slot1.tile_list) ~= nil then
		slot0.model:setYearEvtVoList(slot1.tile_list)
	end

	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.YEAR_MONSTER_CEIL_INFO, slot1)
end

function ActionyearmonsterController.handle28218(slot0, slot1)
	if next(slot1.tile_list) ~= nil then
		slot0.model:updateYearEvtVoList(slot1.tile_list)
		GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.YEAR_UPDATE_GRID_EVENT, slot1.tile_list)
	end
end

function ActionyearmonsterController.sender28202(slot0, slot1)
	slot0:SendProtocal(28202, {
		index = slot1
	})
end

function ActionyearmonsterController.handle28202(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Update_Role_Grid_Event, slot1)
end

function ActionyearmonsterController.sender28203(slot0, slot1, slot2, slot3, slot4)
	slot0.evt_extend = slot4

	slot0:SendProtocal(28203, {
		index = slot1 or slot0.evt_grid_index,
		action = slot2,
		ext_list = slot3 or {}
	})
end

function ActionyearmonsterController.handle28203(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE and slot0.evt_extend and slot0.evt_extend.index == slot1.index then
		slot0.evt_extend = nil
	end
end

function ActionyearmonsterController.sender28204(slot0)
	slot0.model:setCellData(nil)
	slot0:SendProtocal(28204, {})
end

function ActionyearmonsterController.handle28204(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.YearMonsterWar)
	end
end

function ActionyearmonsterController.sender28206(slot0)
	slot0:SendProtocal(28206, {})
end

function ActionyearmonsterController.handle28206(slot0, slot1)
	slot0.model:setYearBagData(slot1.holiday_nian_item)
end

function ActionyearmonsterController.handle28207(slot0, slot1)
	slot0.model:updateYearBagData(slot1.update_item)
end

function ActionyearmonsterController.handle28208(slot0, slot1)
	slot0.model:deleteYearBagData(slot1.delete_pos)
end

function ActionyearmonsterController.handle28209(slot0, slot1)
	slot1.item_rewards = slot1.reward

	for slot5, slot6 in ipairs(slot1.item_rewards) do
		slot6.bid = slot6.base_id
	end

	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.YearMonsterWar, slot1)

	if slot0.actionyearmonster_challenge_panel and (slot1.type == ActionyearmonsterConstants.Evt_Type.YearMonster or slot1.type == ActionyearmonsterConstants.Evt_Type.GoldYearMonster) then
		slot0:sender28203(slot1.evt_index, 0, {})
	end
end

function ActionyearmonsterController.handle28210(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Get_Master_Data_Event, slot1)
end

function ActionyearmonsterController.sender28211(slot0, slot1)
	slot0:SendProtocal(28211, {
		num = slot1
	})
end

function ActionyearmonsterController.handle28211(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Submit_item_Event, slot1)
	end
end

function ActionyearmonsterController.sender28212(slot0, slot1)
	slot0:SendProtocal(28212, {
		type = slot1
	})
end

function ActionyearmonsterController.handle28212(slot0, slot1)
	message(slot1.msg)

	if slot1.flag == TRUE then
		GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Buy_count_Event, slot1)
	end
end

function ActionyearmonsterController.handle28214(slot0, slot1)
	if slot1.flag == 0 then
		slot0:openActionyearmonsterRedbagEventPanel(true, {
			info_data = slot1
		})
	else
		slot0:openActionyearmonsterRedbagEffectPanel(true, slot1)
	end
end

function ActionyearmonsterController.sender28213(slot0, slot1, slot2)
	slot0:SendProtocal(28213, {
		type = slot1,
		num = slot2
	})
end

function ActionyearmonsterController.handle28213(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Rank_Info_Event, slot1)
end

function ActionyearmonsterController.handle28215(slot0, slot1)
	if slot0.actionyearmonster_challenge_panel then
		slot0.actionyearmonster_challenge_panel:updateData(slot1)
	else
		slot0:openActionyearmonsterChallengePanel(true, {
			data = slot1
		})
	end
end

function ActionyearmonsterController.openActionyearmonsterMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_main_window ~= nil then
			slot0.actionyearmonster_main_window:close()

			slot0.actionyearmonster_main_window = nil
		end
	else
		if slot0.actionyearmonster_main_window == nil then
			slot0.actionyearmonster_main_window = ActionyearmonsterMainWindow.New()
		end

		slot0.actionyearmonster_main_window:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterMonsterInfo(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_monster_info ~= nil then
			slot0.actionyearmonster_monster_info:close()

			slot0.actionyearmonster_monster_info = nil
		end
	else
		if slot0.actionyearmonster_monster_info == nil then
			slot0.actionyearmonster_monster_info = ActionyearmonsterMonsterInfo.New()
		end

		slot0.actionyearmonster_monster_info:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterBagPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_bag_panel ~= nil then
			slot0.actionyearmonster_bag_panel:close()

			slot0.actionyearmonster_bag_panel = nil
		end
	else
		if slot0.actionyearmonster_bag_panel == nil then
			slot0.actionyearmonster_bag_panel = ActionyearmonsterBagPanel.New()
		end

		slot0.actionyearmonster_bag_panel:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterSubmitPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_submit_panel ~= nil then
			slot0.actionyearmonster_submit_panel:close()

			slot0.actionyearmonster_submit_panel = nil
		end
	else
		if slot0.actionyearmonster_submit_panel == nil then
			slot0.actionyearmonster_submit_panel = ActionyearmonsterSubmitPanel.New()
		end

		slot0.actionyearmonster_submit_panel:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterRedbagEffectPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_redbag_effect_panel ~= nil then
			slot0.actionyearmonster_redbag_effect_panel:close()

			slot0.actionyearmonster_redbag_effect_panel = nil
		end
	else
		slot0.is_show_redbag = true

		if slot0.actionyearmonster_redbag_effect_panel == nil then
			slot0.actionyearmonster_redbag_effect_panel = ActionyearmonsterRedbagEffectPanel.New()
		end

		slot0.actionyearmonster_redbag_effect_panel:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterRedbagEventPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_redbag_event_panel ~= nil then
			slot0.actionyearmonster_redbag_event_panel:close()

			slot0.actionyearmonster_redbag_event_panel = nil
		end
	else
		if slot0.actionyearmonster_redbag_event_panel == nil then
			slot0.actionyearmonster_redbag_event_panel = ActionyearmonsterRedbagEventPanel.New()
		end

		slot0.actionyearmonster_redbag_event_panel:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterChallengePanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.actionyearmonster_challenge_panel ~= nil then
			slot0.actionyearmonster_challenge_panel:close()

			slot0.actionyearmonster_challenge_panel = nil
		end
	else
		if slot0.actionyearmonster_challenge_panel == nil then
			slot0.actionyearmonster_challenge_panel = ActionyearmonsterChallengePanel.New()
		end

		slot0.actionyearmonster_challenge_panel:open(slot2)
	end
end

function ActionyearmonsterController.openActionyearmonsterResultPanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.actionyearmonster_result_panel ~= nil then
			slot0.actionyearmonster_result_panel:close()

			slot0.actionyearmonster_result_panel = nil
		end
	else
		if slot0.actionyearmonster_result_panel == nil then
			slot0.actionyearmonster_result_panel = ActionyearmonsterResultPanel.New(slot3)
		end

		slot0.actionyearmonster_result_panel:open(slot2)
	end
end

function ActionyearmonsterController.onHandleYearEvtById(slot0, slot1, slot2)
	slot0.evt_grid_index = slot2

	if slot1 == ActionyearmonsterConstants.Evt_Type.Normal then
		-- Nothing
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Monster then
		slot0:openActionyearmonsterMonsterInfo(true, slot2)
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Start then
		-- Nothing
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Board then
		slot0:sender28203(slot2, 0, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Goods then
		slot0:sender28203(slot2, 1, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Dialog then
		slot0:sender28203(slot2, 0, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.DesBarrier then
		-- Nothing
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Barrier then
		message(TI18N("目标点为不可行走区域，请选择其他目标点"))
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Character then
		slot0:sender28203(slot2, 1, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Tribute then
		slot0:sender28203(slot2, 1, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.Fireworks then
		slot0:sender28203(slot2, 1, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.RedBag then
		slot0:sender28203(slot2, 1, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.YearMonster then
		slot0:sender28203(slot2, 0, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.GoldYearMonster then
		slot0:sender28203(slot2, 0, {})
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.YearMonster_nothit then
		message(TI18N("相传收集附近的贡品，可以将其唤醒~"))
	elseif slot1 == ActionyearmonsterConstants.Evt_Type.GoldYearMonster_nothit then
		message(TI18N("嘘~金色年兽正在沉睡呢~不要惊动它"))
	end
end

function ActionyearmonsterController.handle28205(slot0, slot1)
	if not slot0.model:getYearEvtVoByGridIndex(slot1.index) or not slot2.config then
		return
	end

	if slot1.ext_list and next(slot1.ext_list) ~= nil then
		for slot6, slot7 in pairs(slot1.ext_list) do
			if slot7.type == ActionyearmonsterConstants.Proto_28205.Dialog then
				if Config.HolidayNianData.data_dialogue[slot7.val1] then
					ActionController:getInstance():openActionTimeCollectWindow(true, 80, slot1.index, slot8)
				end
			elseif slot7.type == ActionyearmonsterConstants.Proto_28205.Board then
				if Config.HolidayNianData.data_board[slot7.val1] then
					PlanesController:getInstance():openPlanesBoardWindow(true, slot7.val1, slot1.index, {
						show_type = 2,
						board_cfg = slot8
					})
				end
			elseif slot7.type == ActionyearmonsterConstants.Proto_28205.Goods then
				slot0:showEvtItem(slot7.val1)
			elseif slot7.type == ActionyearmonsterConstants.Proto_28205.DesBarrier then
				-- Nothing
			elseif slot7.type == ActionyearmonsterConstants.Proto_28205.YearMonster then
				-- Nothing
			elseif slot7.type == ActionyearmonsterConstants.Proto_28205.GoldYearMonster then
				-- Nothing
			end
		end
	end
end

function ActionyearmonsterController.showEvtItem(slot0, slot1)
	if not slot1 then
		return
	end

	MainuiController:getInstance():openGetItemView(true, {
		{
			num = 1,
			bid = slot1
		}
	}, 0, {
		is_backpack = true
	}, MainuiConst.item_open_type.normal)
end

function ActionyearmonsterController.sender28216(slot0, slot1, slot2)
	slot0:SendProtocal(28216, {
		id = slot1,
		num = slot2
	})
end

function ActionyearmonsterController.handle28216(slot0, slot1)
	message(slot1.msg)
end

function ActionyearmonsterController.sender28217(slot0)
	slot0:SendProtocal(28217, {})
end

function ActionyearmonsterController.handle28217(slot0, slot1)
	slot0.model:setExchangeData(slot1)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.UPDATE_EXCHANGE_DATA_EVENT)
end

function ActionyearmonsterController.openActionyearmonsterExchangeWindow(slot0, slot1)
	if slot1 == false then
		if slot0.actionyearmonster_exchange_window ~= nil then
			slot0.actionyearmonster_exchange_window:close()

			slot0.actionyearmonster_exchange_window = nil
		end
	else
		if slot0.actionyearmonster_exchange_window == nil then
			slot0.actionyearmonster_exchange_window = ActionyearmonsterExchangeWindow.New()
		end

		slot0.actionyearmonster_exchange_window:open()
	end
end

function ActionyearmonsterController.sender28219(slot0, slot1)
	slot0:SendProtocal(28219, {
		face = slot1
	})
end

function ActionyearmonsterController.handle28219(slot0, slot1)
	message(slot1.msg)
end

function ActionyearmonsterController.sender28220(slot0)
	slot0:SendProtocal(28220, {})
end

function ActionyearmonsterController.handle28220(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Face_Event, slot1)
end

function ActionyearmonsterController.sender28221(slot0)
	slot0:SendProtocal(28221, {})
end

function ActionyearmonsterController.handle28221(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Five_Effect_Event, slot1)
end

function ActionyearmonsterController.sender28222(slot0)
	slot0:SendProtocal(28222, {})
end

function ActionyearmonsterController.handle28222(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Year_Other_Role_Event, slot1)
end

function ActionyearmonsterController.sender28223(slot0)
	slot0:SendProtocal(28223, {})
end

function ActionyearmonsterController.handle28223(slot0, slot1)
	GlobalEvent:getInstance():Fire(ActionyearmonsterEvent.Update_Year_Main_Redbag_Event, slot1.flag)
end

function ActionyearmonsterController.sender28224(slot0)
	slot0:SendProtocal(28224, {})
end

function ActionyearmonsterController.handle28224(slot0, slot1)
	if slot1.timer_flag == 1 or slot1.gold_flag == 1 then
		if not MainuiController:getInstance().is_click_yearmoster then
			PromptController:getInstance():getModel():addPromptData({
				type = PromptTypeConst.Year_Monster_tips
			})
		end
	else
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Year_Monster_tips)
	end
end

function ActionyearmonsterController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
