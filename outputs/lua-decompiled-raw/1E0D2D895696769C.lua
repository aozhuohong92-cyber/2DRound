CrossarenaController = CrossarenaController or BaseClass(BaseController)

function CrossarenaController.config(slot0)
	slot0.model = CrossarenaModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function CrossarenaController.getModel(slot0)
	return slot0.model
end

function CrossarenaController.registerEvents(slot0)
	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			if uv0.crossarena_result_wnd then
				uv0:sender25612()
			end
		end)
	end
end

function CrossarenaController.sender25600(slot0)
	slot0:SendProtocal(25600, {})
end

function CrossarenaController.sender25601(slot0)
	slot0:SendProtocal(25601, {})
end

function CrossarenaController.sender25602(slot0, slot1, slot2)
	slot0:SendProtocal(25602, {
		rid = slot1,
		srv_id = slot2
	})
end

function CrossarenaController.sender25603(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(25603, {
		rid = slot1,
		srv_id = slot2,
		order = slot3,
		pos = slot4
	})
end

function CrossarenaController.sender25604(slot0, slot1, slot2)
	slot3 = {
		type = slot1,
		formations = slot2
	}

	if slot1 == 2 then
		slot0._temp_formations = slot2
	end

	slot0:SendProtocal(25604, slot3)
end

function CrossarenaController.sender25605(slot0, slot1)
	slot0:SendProtocal(25605, {
		type = slot1
	})
end

function CrossarenaController.sender25606(slot0, slot1, slot2)
	PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Corss_arena_tips)
	slot0:SendProtocal(25606, {
		rid = slot1,
		srv_id = slot2,
		is_auto = slot0.model:getCrossarenaAutoBattle() or 0
	})
end

function CrossarenaController.sender25607(slot0)
	slot0:SendProtocal(25607, {})
end

function CrossarenaController.sender25608(slot0, slot1)
	slot0:SendProtocal(25608, {
		num = slot1
	})
end

function CrossarenaController.sender25609(slot0)
	slot0:SendProtocal(25609, {})
end

function CrossarenaController.sender25610(slot0)
	slot0:SendProtocal(25610, {})
end

function CrossarenaController.sender25612(slot0)
	slot0:SendProtocal(25612, {})
end

function CrossarenaController.sender25613(slot0, slot1)
	slot0:SendProtocal(25613, {
		pos = slot1
	})
end

function CrossarenaController.sender25614(slot0)
	slot0:SendProtocal(25614, {})
end

function CrossarenaController.sender25615(slot0)
	slot0:SendProtocal(25615, {})
end

function CrossarenaController.sender25616(slot0, slot1)
	slot0:SendProtocal(25616, {
		type = slot1
	})
end

function CrossarenaController.sender25617(slot0, slot1, slot2)
	slot0:SendProtocal(25617, {
		type = slot1,
		id = slot2
	})
end

function CrossarenaController.registerProtocals(slot0)
	slot0:RegisterProtocal(25600, "handle25600")
	slot0:RegisterProtocal(25601, "handle25601")
	slot0:RegisterProtocal(25602, "handle25602")
	slot0:RegisterProtocal(25603, "handle25603")
	slot0:RegisterProtocal(25604, "handle25604")
	slot0:RegisterProtocal(25605, "handle25605")
	slot0:RegisterProtocal(25606, "handle25606")
	slot0:RegisterProtocal(25607, "handle25607")
	slot0:RegisterProtocal(25608, "handle25608")
	slot0:RegisterProtocal(25609, "handle25609")
	slot0:RegisterProtocal(25610, "handle25610")
	slot0:RegisterProtocal(25611, "handle25611")
	slot0:RegisterProtocal(25612, "handle25612")
	slot0:RegisterProtocal(25613, "handle25613")
	slot0:RegisterProtocal(25614, "handle25614")
	slot0:RegisterProtocal(25615, "handle25615")
	slot0:RegisterProtocal(25616, "handle25616")
	slot0:RegisterProtocal(25617, "handle25617")
	slot0:RegisterProtocal(25618, "handle25618")
end

function CrossarenaController.handle25600(slot0, slot1)
	if slot1 then
		slot0.model:setCrossarenaMyBaseInfo(slot1)
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_MyBaseInfo_Event)
	end
end

function CrossarenaController.handle25601(slot0, slot1)
	if slot1 then
		if slot1.type == 0 then
			slot0.model:setChallengeRoleData(slot1.f_list)
			GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Challenge_Role_Event)
		elseif slot1.type == 1 then
			slot0.model:updateChallengeRoleData(slot1.f_list)
		end
	end
end

function CrossarenaController.handle25602(slot0, slot1)
	if slot1 then
		slot0:openCrossarenaRoleTips(true, slot1)
	end
end

function CrossarenaController.handle25603(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function CrossarenaController.handle25604(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.code == 1 then
			GlobalEvent:getInstance():Fire(CrossarenaEvent.Save_Crossarena_Form_Event, slot1)

			if slot0._temp_formations then
				for slot6, slot7 in ipairs(slot0._temp_formations) do
					slot7.type = PartnerConst.Fun_Form.CrossArenaDef

					HeroController:getInstance():getModel():setFormList(slot7, slot7.order)
				end

				slot0._temp_formations = nil
			end
		end
	end
end

function CrossarenaController.handle25605(slot0, slot1)
	if slot1.type == 2 then
		for slot6, slot7 in ipairs(slot1.formations) do
			slot7.type = PartnerConst.Fun_Form.CrossArenaDef

			HeroController:getInstance():getModel():setFormList(slot7, slot7.order)

			slot7.type = nil
		end
	end

	GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Form_Data_Event, slot1)
end

function CrossarenaController.handle25606(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function CrossarenaController.handle25607(slot0, slot1)
	if slot1 then
		slot0.model:setChallengeAwardData(slot1)
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Challenge_Award_Event)
	end
end

function CrossarenaController.handle25608(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function CrossarenaController.handle25609(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.ref_time then
			slot0.model:updateRefreshTime(slot1.ref_time)
			GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Refresh_Time_Event)
		end
	end
end

function CrossarenaController.handle25610(slot0, slot1)
	if slot1 then
		slot0.model:setCrossarenaStatus(slot1.code)
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Open_Status_Event)
	end
end

function CrossarenaController.handle25611(slot0, slot1)
	if slot1 then
		BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.CrossArenaWar, slot1)
	end
end

function CrossarenaController.handle25612(slot0, slot1)
	if slot1 and slot1.card_info and next(slot1.card_info) ~= nil then
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Card_Info_Event, slot1.card_info)
	else
		slot0:openCrossarenaResultWindow(false)
	end
end

function CrossarenaController.handle25613(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function CrossarenaController.handle25614(slot0, slot1)
	if slot1 then
		slot0.model:setHonourRoleData(slot1.rank_list)
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Honour_Data_Event)
	end
end

function CrossarenaController.handle25615(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Rank_Data_Event, slot1)
	end
end

function CrossarenaController.handle25616(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(CrossarenaEvent.Update_Video_Data_Event, slot1)
	end
end

function CrossarenaController.handle25617(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(ElitematchEvent.Elite_Challenge_Record_Info_Event, slot1)
	end
end

function CrossarenaController.handle25618(slot0, slot1)
	if slot1 then
		if not slot0.first_login_flag or slot1.worship_code == 0 then
			slot0.first_login_flag = true

			slot0.model:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Like, slot1.worship_code == 1)
		end

		slot0.model:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Award, slot1.reward_code == 1)
		slot0.model:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Record, slot1.combat_code == 1)
	end
end

function CrossarenaController.openCrossarenaMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.model:getCrossarenaIsOpen() then
			return
		end

		if not slot0.crossarena_main_wnd then
			slot0.crossarena_main_wnd = CrossareanMainWindow.New()
		end

		if slot0.crossarena_main_wnd:isOpen() == false then
			slot0.crossarena_main_wnd:open(slot2)
		end
	elseif slot0.crossarena_main_wnd then
		slot0.crossarena_main_wnd:close()

		slot0.crossarena_main_wnd = nil
	end
end

function CrossarenaController.getCrossarenaMainRoot(slot0)
	if slot0.crossarena_main_wnd then
		return slot0.crossarena_main_wnd.root_wnd
	end
end

function CrossarenaController.openCrossarenaRankWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.crossarena_rank_wnd then
			slot0.crossarena_rank_wnd = CrossarenaRankWindow.New()
		end

		if slot0.crossarena_rank_wnd:isOpen() == false then
			slot0.crossarena_rank_wnd:open()
		end
	elseif slot0.crossarena_rank_wnd then
		slot0.crossarena_rank_wnd:close()

		slot0.crossarena_rank_wnd = nil
	end
end

function CrossarenaController.openCrossarenaAwardWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.crossarena_award_wnd then
			slot0.crossarena_award_wnd = CrossarenaAwardWindow.New()
		end

		if slot0.crossarena_award_wnd:isOpen() == false then
			slot0.crossarena_award_wnd:open()
		end
	elseif slot0.crossarena_award_wnd then
		slot0.crossarena_award_wnd:close()

		slot0.crossarena_award_wnd = nil
	end
end

function CrossarenaController.openCrossarenaShopWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.crossarena_shop_wnd then
			slot0.crossarena_shop_wnd = CrossareanShopWindow.New()
		end

		if slot0.crossarena_shop_wnd:isOpen() == false then
			slot0.crossarena_shop_wnd:open()
		end
	elseif slot0.crossarena_shop_wnd then
		slot0.crossarena_shop_wnd:close()

		slot0.crossarena_shop_wnd = nil
	end
end

function CrossarenaController.openCrossarenaRoleTips(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.crossarena_role_tips then
			slot0.crossarena_role_tips = CrossarenaRoleTips.New()
		end

		if slot0.crossarena_role_tips:isOpen() == false then
			slot0.crossarena_role_tips:open(slot2)
		end
	elseif slot0.crossarena_role_tips then
		slot0.crossarena_role_tips:close()

		slot0.crossarena_role_tips = nil
	end
end

function CrossarenaController.openCrossarenaVideoWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.crossarena_video_wnd then
			slot0.crossarena_video_wnd = CrossareanVideoWindow.New()
		end

		if slot0.crossarena_video_wnd:isOpen() == false then
			slot0.crossarena_video_wnd:open()
		end
	elseif slot0.crossarena_video_wnd then
		slot0.crossarena_video_wnd:close()

		slot0.crossarena_video_wnd = nil
	end
end

function CrossarenaController.openCrossarenaResultWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.crossarena_result_wnd then
			slot0.crossarena_result_wnd = CrossArenaResultWindow.New()
		end

		if slot0.crossarena_result_wnd:isOpen() == false then
			slot0.crossarena_result_wnd:open(slot2)
		end
	elseif slot0.crossarena_result_wnd then
		slot0.crossarena_result_wnd:close()

		slot0.crossarena_result_wnd = nil
	end
end

function CrossarenaController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
