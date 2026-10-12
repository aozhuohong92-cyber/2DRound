ElitematchController = ElitematchController or BaseClass(BaseController)

function ElitematchController.config(slot0)
	slot0.model = ElitematchModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function ElitematchController.getModel(slot0)
	return slot0.model
end

function ElitematchController.registerEvents(slot0)
end

function ElitematchController.loginSendProtoInfo(slot0)
	slot1, slot2 = slot0.model:checkElitematchIsOpen(true)

	if slot1 then
		slot0.is_check_redpoint = true

		slot0.model:setUpdateRedPoint(false)
		slot0:sender24905()
		slot0:sender24900()
	elseif slot2 == 1 then
		slot0.role_vo = RoleController:getInstance():getRoleVo()

		if slot0.role_vo ~= nil and slot0.role_lev_event == nil then
			slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
				if slot0 == "lev" and uv0.model:checkElitematchIsOpen(true) then
					uv0.is_check_redpoint = true

					uv0.model:setUpdateRedPoint(false)
					uv0:sender24905()
					uv0:sender24900()
					uv0.role_vo:UnBind(uv0.role_lev_event)
				end
			end)
		end
	elseif slot2 == 2 then
		slot0.world_lev_event2 = GlobalEvent:getInstance():Bind(RoleEvent.WORLD_LEV, function ()
			if uv0.model:checkElitematchIsOpen(true) then
				uv0.is_check_redpoint = true

				uv0.model:setUpdateRedPoint(false)
				uv0:sender24905()
				uv0:sender24900()
				GlobalEvent:getInstance():UnBind(uv0.world_lev_event2)
			end
		end)
	end
end

function ElitematchController.registerProtocals(slot0)
	slot0:RegisterProtocal(24900, "handle24900")
	slot0:RegisterProtocal(24901, "handle24901")
	slot0:RegisterProtocal(24902, "handle24902")
	slot0:RegisterProtocal(24903, "handle24903")
	slot0:RegisterProtocal(24904, "handle24904")
	slot0:RegisterProtocal(24905, "handle24905")
	slot0:RegisterProtocal(24906, "handle24906")
	slot0:RegisterProtocal(24910, "handle24910")
	slot0:RegisterProtocal(24911, "handle24911")
	slot0:RegisterProtocal(24915, "handle24915")
	slot0:RegisterProtocal(24920, "handle24920")
	slot0:RegisterProtocal(24921, "handle24921")
	slot0:RegisterProtocal(24930, "handle24930")
	slot0:RegisterProtocal(24931, "handle24931")
	slot0:RegisterProtocal(24940, "handle24940")
	slot0:RegisterProtocal(24941, "handle24941")
	slot0:RegisterProtocal(24942, "handle24942")
	slot0:RegisterProtocal(24945, "handle24945")
	slot0:RegisterProtocal(24946, "handle24946")
	slot0:RegisterProtocal(24950, "handle24950")
	slot0:RegisterProtocal(24952, "handle24952")
	slot0:RegisterProtocal(24953, "handle24953")
	slot0:RegisterProtocal(24954, "handle24954")
	slot0:RegisterProtocal(24955, "handle24955")
end

function ElitematchController.sender24900(slot0)
	slot0:SendProtocal(24900, {})
end

function ElitematchController.handle24900(slot0, slot1)
	slot0.model:setSCData(slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Get_Elite_Main_Info_Event, slot1)

	if slot0.is_check_redpoint then
		slot0:sender24920(1)
		slot0:sender24920(2)

		slot0.is_check_redpoint = false
	end

	slot0.model:setSCDataBack24900()
end

function ElitematchController.sender24901(slot0)
	slot0:SendProtocal(24901, {})
end

function ElitematchController.handle24901(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Get_Elite_Enemy_Info_Event, slot1)

	if next(slot1.rand_list) ~= nil then
		if not slot0.elitematch_matching_window then
			if slot0.model.scdata.state == 0 then
				return
			end

			if slot0.model.scdata.is_skip == 0 then
				CommonAlert.show(string.format(TI18N("超凡段位赛已经匹配到对手了,是否进入阵容调整？")), TI18N("确定"), function ()
					if uv0.elitematch_main_window then
						uv0.elitematch_main_window:onClickMatchBtn()
					else
						uv0:openElitematchMainWindow(true, {
							is_open_match = true
						})
					end
				end, TI18N("取消"), function ()
					uv0:sender24903()
				end, CommonAlert.type.rich, nil, {
					extend_offy = -5,
					off_y = 43,
					title = TI18N("开始讨伐"),
					extend_str = TI18N("(点取消将直接开始战斗)"),
					extend_aligment = cc.TEXT_ALIGNMENT_CENTER
				}, nil, nil)
			end
		end
	end
end

function ElitematchController.sender24902(slot0, slot1)
	slot0:SendProtocal(24902, {
		type = slot1
	})
end

function ElitematchController.handle24902(slot0, slot1)
end

function ElitematchController.sender24903(slot0)
	slot0:SendProtocal(24903, {})
end

function ElitematchController.handle24903(slot0, slot1)
	if slot1.code ~= TRUE then
		message(slot1.msg)
		GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Fight_Fail_Event)
	end
end

function ElitematchController.sender24904(slot0)
	slot0:SendProtocal(24904, {})
end

function ElitematchController.handle24904(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_buy_count_Event, slot1)
	else
		message(slot1.msg)
	end
end

function ElitematchController.sender24905(slot0)
	slot0:SendProtocal(24905, {})
end

function ElitematchController.handle24905(slot0, slot1)
	slot0.model:setEliteMatchFightTime(slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Start_Time_Event, slot1)
	slot0.model:setSCDataBack24905()
end

function ElitematchController.handle24906(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Fight_Result_Event)

	if slot0.timer_id then
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(slot0.timer_id)

		slot0.timer_id = nil
	end

	slot0.scdata24906 = slot1

	slot0:openElitematchFightResultPanel(false)

	slot0.timer_id = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function (slot0)
		if uv0.timer_id then
			cc.Director:getInstance():getScheduler():unscheduleScriptEntry(uv0.timer_id)

			uv0.timer_id = nil
		end

		if uv0.scdata24906 then
			uv0:openElitematchFightResultPanel(true, uv0.scdata24906)
		end
	end, 2, false)
end

function ElitematchController.sender24910(slot0)
	slot0:SendProtocal(24910, {})
end

function ElitematchController.handle24910(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_History_Zone_Event, slot1)
end

function ElitematchController.sender24911(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(24911, {
		period = slot1,
		start_rank = slot2,
		end_rank = slot3,
		zone_id = slot4
	})
end

function ElitematchController.handle24911(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_History_Record_Event, slot1)
end

function ElitematchController.sender24915(slot0, slot1)
	slot0:SendProtocal(24915, {
		lev = slot1
	})
end

function ElitematchController.handle24915(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Receive_Reward_Event, slot1)
	else
		message(slot1.msg)
	end
end

function ElitematchController.sender24920(slot0, slot1)
	slot0:SendProtocal(24920, {
		type = slot1
	})
end

function ElitematchController.handle24920(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Update_Elite_Fun_Form, slot1)

	slot2 = nil

	for slot7, slot8 in ipairs(slot1.formations) do
		slot8.type = (slot1.type ~= 1 or PartnerConst.Fun_Form.EliteMatch) and PartnerConst.Fun_Form.EliteKingMatch

		HeroController:getInstance():getModel():setFormList(slot8, slot8.order)
	end
end

function ElitematchController.sender24921(slot0, slot1, slot2)
	slot0:SendProtocal(24921, {
		type = slot1,
		formations = slot2
	})
end

function ElitematchController.handle24921(slot0, slot1)
	if slot1.code == TRUE then
		GlobalEvent:getInstance():Fire(ElitematchEvent.Update_Elite_Save_Form, slot1)
		slot0:sender24920(1)
		slot0:sender24920(2)
	else
		message(slot1.msg)
	end
end

function ElitematchController.sender24930(slot0, slot1)
	slot0:SendProtocal(24930, {
		type = slot1
	})
end

function ElitematchController.handle24930(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Challenge_Record_Event, slot1)
end

function ElitematchController.sender24931(slot0, slot1, slot2)
	slot0:SendProtocal(24931, {
		type = slot1,
		id = slot2
	})
end

function ElitematchController.handle24931(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Challenge_Record_Info_Event, slot1)
end

function ElitematchController.sender24940(slot0, slot1)
	slot0:SendProtocal(24940, {
		period = slot1
	})
end

function ElitematchController.handle24940(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Personal_Info_Event, slot1)
end

function ElitematchController.sender24941(slot0, slot1)
	slot0:SendProtocal(24941, {
		channel = slot1
	})
end

function ElitematchController.handle24941(slot0, slot1)
	message(slot1.msg)
end

function ElitematchController.sender24942(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24942, {
		id = slot1,
		share_srv_id = slot2,
		period = slot3
	})
end

function ElitematchController.handle24942(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Personal_Info_Event2, slot1)
end

function ElitematchController.sender24945(slot0)
	slot0:SendProtocal(24945, {})
end

function ElitematchController.handle24945(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Declaration_Event, slot1)
end

function ElitematchController.sender24946(slot0, slot1)
	slot0:SendProtocal(24946, {
		manifesto = slot1
	})
end

function ElitematchController.handle24946(slot0, slot1)
	message(slot1.msg)
end

function ElitematchController.sender24950(slot0)
	slot0:SendProtocal(24950, {})
end

function ElitematchController.handle24950(slot0, slot1)
	message(slot1.msg)
end

function ElitematchController.openElitematchMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:checkElitematchIsOpen() then
			return
		end

		if slot0.elitematch_main_window == nil then
			slot0.elitematch_main_window = ElitematchMainWindow.New()
		end

		if slot0.elitematch_main_window:isOpen() == false then
			slot0.elitematch_main_window:open(slot2)
		end
	elseif slot0.elitematch_main_window then
		slot0.elitematch_main_window:close()

		slot0.elitematch_main_window = nil
	end
end

function ElitematchController.openElitematchMatchingWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.elitematch_matching_window == nil then
			slot0.elitematch_matching_window = ElitematchMatchingWindow.New()
		end

		if slot0.elitematch_matching_window:isOpen() == false then
			slot0.elitematch_matching_window:open(slot2, slot3)
		end
	elseif slot0.elitematch_matching_window then
		slot0.elitematch_matching_window:close()

		slot0.elitematch_matching_window = nil
	end
end

function ElitematchController.openElitematchFightResultPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.elitematch_fight_result_panel == nil then
			slot0.elitematch_fight_result_panel = ElitematchFightResultPanel.New()
		end

		if slot0.elitematch_fight_result_panel.isOpen and slot0.elitematch_fight_result_panel:isOpen() == false then
			slot0.elitematch_fight_result_panel:open(slot2)
		end
	elseif slot0.elitematch_fight_result_panel then
		slot0.elitematch_fight_result_panel:close()

		slot0.elitematch_fight_result_panel = nil
	end
end

function ElitematchController.openElitematchRewardPanel(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.elitematch_reward_panel == nil then
			slot0.elitematch_reward_panel = ElitematchRewardPanel.New()
		end

		if slot0.elitematch_reward_panel:isOpen() == false then
			slot0.elitematch_reward_panel:open(slot2, slot3, slot4)
		end
	elseif slot0.elitematch_reward_panel then
		slot0.elitematch_reward_panel:close()

		slot0.elitematch_reward_panel = nil
	end
end

function ElitematchController.openElitematchFightRecordPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.elitematch_fight_record_panel == nil then
			slot0.elitematch_fight_record_panel = ElitematchFightRecordPanel.New()
		end

		if slot0.elitematch_fight_record_panel:isOpen() == false then
			slot0.elitematch_fight_record_panel:open(slot2, slot3)
		end
	elseif slot0.elitematch_fight_record_panel then
		slot0.elitematch_fight_record_panel:close()

		slot0.elitematch_fight_record_panel = nil
	end
end

function ElitematchController.openElitematchFightVedioPanel(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		if slot0.elitematch_fight_vedio_panel == nil then
			slot0.elitematch_fight_vedio_panel = ElitematchFightVedioPanel.New()
		end

		if slot0.elitematch_fight_vedio_panel:isOpen() == false then
			slot0.elitematch_fight_vedio_panel:open(slot2, slot3, slot4, slot5)
		end
	elseif slot0.elitematch_fight_vedio_panel then
		slot0.elitematch_fight_vedio_panel:close()

		slot0.elitematch_fight_vedio_panel = nil
	end
end

function ElitematchController.openElitematchHistoryRecordWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.elitematch_history_record_window == nil then
			slot0.elitematch_history_record_window = ElitematchHistoryRecordWindow.New()
		end

		if slot0.elitematch_history_record_window:isOpen() == false then
			slot0.elitematch_history_record_window:open(slot2, slot3, slot4)
		end
	elseif slot0.elitematch_history_record_window then
		slot0.elitematch_history_record_window:close()

		slot0.elitematch_history_record_window = nil
	end
end

function ElitematchController.openElitematchPersonalInfoPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.elitematch_personal_info_panel == nil then
			slot0.elitematch_personal_info_panel = ElitematchPersonalInfoPanel.New()
		end

		if slot0.elitematch_personal_info_panel:isOpen() == false then
			slot0.elitematch_personal_info_panel:open(slot2, slot3)
		end
	elseif slot0.elitematch_personal_info_panel then
		slot0.elitematch_personal_info_panel:close()

		slot0.elitematch_personal_info_panel = nil
	end
end

function ElitematchController.openElitematchDeclarationPanel(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.elitematch_declaration_panel == nil then
			slot0.elitematch_declaration_panel = ElitematchDeclarationPanel.New(slot2)
		end

		if slot0.elitematch_declaration_panel:isOpen() == false then
			slot0.elitematch_declaration_panel:open()
		end
	elseif slot0.elitematch_declaration_panel then
		slot0.elitematch_declaration_panel:close()

		slot0.elitematch_declaration_panel = nil
	end
end

function ElitematchController.openChooseFacePanel(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		if slot0.choose_face_panel == nil then
			slot0.choose_face_panel = ChooseFacePanel.New()
		end

		if slot0.choose_face_panel:isOpen() == false then
			slot0.choose_face_panel:open(slot2, slot3, slot4, slot5)
		end
	elseif slot0.choose_face_panel then
		slot0.choose_face_panel:close()

		slot0.choose_face_panel = nil
	end
end

function ElitematchController.openElitematchZoneListPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.elitematch_zone_list_panel == nil then
			slot0.elitematch_zone_list_panel = ElitematchZoneListPanel.New()
		end

		if slot0.elitematch_zone_list_panel:isOpen() == false then
			slot0.elitematch_zone_list_panel:open(slot2, slot3)
		end
	elseif slot0.elitematch_zone_list_panel then
		slot0.elitematch_zone_list_panel:close()

		slot0.elitematch_zone_list_panel = nil
	end
end

function ElitematchController.sender24952(slot0)
	slot0:SendProtocal(24952, {})
end

function ElitematchController.handle24952(slot0, slot1)
	slot0.model:setOrderactionData(slot1)
	slot0.model:setSCDataBackOrderaction()
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_OrderAction_Init_Event, slot1)
end

function ElitematchController.sender24953(slot0, slot1)
	slot0:SendProtocal(24953, {
		id = slot1
	})
end

function ElitematchController.handle24953(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function ElitematchController.sender24954(slot0)
	slot0:SendProtocal(24954, {})
end

function ElitematchController.handle24954(slot0, slot1)
	if slot1 then
		slot0.model:setOrderactionRedStatus(slot1.flag)
		slot0.model:setSCDataBackOrderaction()
	end

	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_OrderAction_First_Red_Event)
end

function ElitematchController.sender24955(slot0)
	slot0:SendProtocal(24955, {})
end

function ElitematchController.handle24955(slot0, slot1)
	GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_OrderAction_IsPopWarn_Event, slot1)
end

function ElitematchController.openElitematchOrderactionWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.model:checkElitematchIsOpen() then
			return
		end

		if not slot0.elitematch_orderaction_window then
			slot0.elitematch_orderaction_window = ElitematchOrderactionWindow.New()
		end

		slot0.elitematch_orderaction_window:open()
	elseif slot0.elitematch_orderaction_window then
		slot0.elitematch_orderaction_window:close()

		slot0.elitematch_orderaction_window = nil
	end
end

function ElitematchController.openBuyCardView(slot0, slot1)
	if slot1 == true then
		if not slot0.buy_card_view then
			slot0.buy_card_view = ElitematchOrderactionUntieRewardWindow.New()
		end

		slot0.buy_card_view:open()
	elseif slot0.buy_card_view then
		slot0.buy_card_view:close()

		slot0.buy_card_view = nil
	end
end

function ElitematchController.openElitematchEndWarnView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.end_warn_view then
			slot0.end_warn_view = ElitematchOrderActionEndWarnWindow.New()
		end

		slot0.end_warn_view:open(slot2)
	elseif slot0.end_warn_view then
		slot0.end_warn_view:close()

		slot0.end_warn_view = nil
	end
end

function ElitematchController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
