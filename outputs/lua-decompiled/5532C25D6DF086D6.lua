LadderController = LadderController or BaseClass(BaseController)

function LadderController.config(slot0)
	slot0.model = LadderModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function LadderController.getModel(slot0)
	return slot0.model
end

function LadderController.registerEvents(slot0)
end

function LadderController.requestLadderMyBaseInfo(slot0)
	slot0:SendProtocal(24300, {})
end

function LadderController.requestLadderEnemyListData(slot0)
	slot0:SendProtocal(24301, {})
end

function LadderController.requestLadderEnemyData(slot0, slot1, slot2)
	slot0:SendProtocal(24302, {
		rid = slot1,
		srv_id = slot2
	})
end

function LadderController.requestChallengeEnemy(slot0, slot1, slot2)
	slot0:SendProtocal(24303, {
		rid = slot1,
		srv_id = slot2
	})
end

function LadderController.requestRefreshEnemyList(slot0)
	slot0:SendProtocal(24304, {})
end

function LadderController.requestBuyChallengeCount(slot0)
	slot0:SendProtocal(24305, {})
end

function LadderController.requestQuickChallenge(slot0)
	slot0:SendProtocal(24306, {})
end

function LadderController.requestTopThreeRoleData(slot0)
	slot0:SendProtocal(24308, {})
end

function LadderController.requestLadderRankData(slot0)
	slot0:SendProtocal(24309, {})
end

function LadderController.requestMyLogData(slot0)
	slot0:SendProtocal(24310, {})
end

function LadderController.requestGodLogData(slot0)
	slot0:SendProtocal(24311, {})
end

function LadderController.requestLadderIsOpen(slot0)
	slot0:SendProtocal(24312, {})
end

function LadderController.requestCleanCDTime(slot0)
	slot0:SendProtocal(24315, {})
end

function LadderController.requestCheckRoleInfo(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24316, {
		rid = slot1,
		srv_id = slot2,
		pos = slot3
	})
end

function LadderController.requestShareVideo(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(24318, {
		replay_id = slot1,
		srv_id = slot2,
		channel = slot3,
		target_name = slot4
	})
end

function LadderController.registerProtocals(slot0)
	slot0:RegisterProtocal(24300, "handle24300")
	slot0:RegisterProtocal(24301, "handle24301")
	slot0:RegisterProtocal(24302, "handle24302")
	slot0:RegisterProtocal(24303, "handle24303")
	slot0:RegisterProtocal(24304, "handle24304")
	slot0:RegisterProtocal(24305, "handle24305")
	slot0:RegisterProtocal(24306, "handle24306")
	slot0:RegisterProtocal(24307, "handle24307")
	slot0:RegisterProtocal(24308, "handle24308")
	slot0:RegisterProtocal(24309, "handle24309")
	slot0:RegisterProtocal(24310, "handle24310")
	slot0:RegisterProtocal(24311, "handle24311")
	slot0:RegisterProtocal(24312, "handle24312")
	slot0:RegisterProtocal(24313, "handle24313")
	slot0:RegisterProtocal(24314, "handle24314")
	slot0:RegisterProtocal(24315, "handle24315")
	slot0:RegisterProtocal(24316, "handle24316")
	slot0:RegisterProtocal(24317, "handle24317")
	slot0:RegisterProtocal(24318, "handle24318")
end

function LadderController.handle24300(slot0, slot1)
	if slot1 then
		slot0.model:setLadderMyBaseInfo(slot1)
	end

	GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderMyBaseInfo)
end

function LadderController.handle24301(slot0, slot1)
	if slot1 then
		if slot1.type == 0 then
			slot0.model:setLadderEnemyListData(slot1.f_list)
		else
			slot0.model:updateLadderEnemyListData(slot1.f_list)
		end

		GlobalEvent:getInstance():Fire(LadderEvent.UpdateAllLadderEnemyList)
	end
end

function LadderController.handle24302(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(LadderEvent.GetLadderEnemyData, slot1)
	end
end

function LadderController.handle24303(slot0, slot1)
	message(slot1.msg)
	slot0:openLadderRoleInfoWindow(false)
end

function LadderController.handle24304(slot0, slot1)
	message(slot1.msg)
end

function LadderController.handle24305(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 and slot0._temp_rid and slot0._temp_srv_id then
		slot0:requestChallengeEnemy(slot0._temp_rid, slot0._temp_srv_id)

		slot0._temp_rid = nil
		slot0._temp_srv_id = nil
	elseif slot1.code == 1 and slot0._temp_quick_flag then
		slot0:requestQuickChallenge()

		slot0._temp_quick_flag = nil
	end
end

function LadderController.handle24306(slot0, slot1)
	message(slot1.msg)
end

function LadderController.handle24307(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.LadderWar, slot1)
end

function LadderController.handle24308(slot0, slot1)
	if slot1 and slot1.rank_list then
		GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderTopThreeRoleData, slot1.rank_list)
	end
end

function LadderController.handle24309(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderRankData, slot1)
	end
end

function LadderController.handle24310(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderMyLogData, slot1)
	end
end

function LadderController.handle24311(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderGodLogData, slot1)
	end
end

function LadderController.handle24312(slot0, slot1)
	if slot1 then
		slot0.model:setLadderOpenStatus(slot1.code)
		GlobalEvent:getInstance():Fire(LadderEvent.UpdateLadderOpenStatus)
	end
end

function LadderController.handle24313(slot0, slot1)
	if slot1.code then
		if not slot0._login_flag and slot1.code == 1 then
			slot0._login_flag = true

			slot0.model:updateLadderRedStatus(LadderConst.RedType.TopThree, true)
		else
			slot0.model:updateLadderRedStatus(LadderConst.RedType.TopThree, false)
		end
	end
end

function LadderController.handle24314(slot0, slot1)
	if slot1.code then
		slot0.model:updateLadderRedStatus(LadderConst.RedType.BattleLog, slot1.code == 1)
	end
end

function LadderController.handle24315(slot0, slot1)
	message(slot1.msg)
end

function LadderController.handle24316(slot0, slot1)
	message(slot1.msg)
end

function LadderController.handle24317(slot0, slot1)
	if slot1.code then
		slot0.model:updateLadderRedStatus(LadderConst.RedType.Challenge, slot1.code == 1)
	end
end

function LadderController.handle24318(slot0, slot1)
	message(slot1.msg)
end

function LadderController.checkJoinLadderBattle(slot0, slot1, slot2, slot3)
	if slot0.model:getLeftChallengeCount() > 0 then
		if slot3 then
			slot0:requestQuickChallenge()
		else
			slot0:requestChallengeEnemy(slot1, slot2)
		end
	elseif slot0.model:getTodayLeftBuyCount() > 0 then
		if Config.SkyLadderData.data_buy_num[slot0.model:getTodayBuyCount() + 1] then
			if slot3 then
				CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进行一键挑战？"), PathTool.getItemRes(3), slot5.cost), TI18N("确定"), function ()
					uv0._temp_quick_flag = true

					uv0:requestBuyChallengeCount()
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			else
				CommonAlert.show(string.format(TI18N("挑战次数不足，是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数并且进入战斗？"), PathTool.getItemRes(3), slot5.cost), TI18N("确定"), function ()
					uv0._temp_rid = uv1
					uv0._temp_srv_id = uv2

					uv0:requestBuyChallengeCount()
					uv0:openLadderRoleInfoWindow(false)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		end
	else
		message(TI18N("挑战次数不足"))
		slot0:openLadderRoleInfoWindow(false)
	end
end

function LadderController.openMainWindow(slot0, slot1)
	if slot1 then
		if RoleController:getInstance():getRoleVo().lev < Config.SkyLadderData.data_const.join_min_lev.val then
			message(slot3.desc)

			return
		end

		if slot0.ladder_main_window == nil then
			slot0.ladder_main_window = LadderMainWindow.New()
		end

		slot0.ladder_main_window:open()
	elseif slot0.ladder_main_window then
		slot0.ladder_main_window:close()

		slot0.ladder_main_window = nil
	end
end

function LadderController.openLadderShopWindow(slot0, slot1)
	if slot1 then
		if slot0.ladder_shop_window == nil then
			slot0.ladder_shop_window = LadderShopWindow.New()
		end

		slot0.ladder_shop_window:open()
	elseif slot0.ladder_shop_window then
		slot0.ladder_shop_window:close()

		slot0.ladder_shop_window = nil
	end
end

function LadderController.openLadderRoleInfoWindow(slot0, slot1, slot2)
	if slot1 then
		if slot0.ladder_role_info_window == nil then
			slot0.ladder_role_info_window = LadderRoleInfoWindow.New()
		end

		slot0.ladder_role_info_window:open(slot2)
	elseif slot0.ladder_role_info_window then
		slot0.ladder_role_info_window:close()

		slot0.ladder_role_info_window = nil
	end
end

function LadderController.openLadderLogWindow(slot0, slot1)
	if slot1 then
		if slot0.ladder_log_window == nil then
			slot0.ladder_log_window = LadderLogWindow.New()
		end

		slot0.ladder_log_window:open()
	elseif slot0.ladder_log_window then
		slot0.ladder_log_window:close()

		slot0.ladder_log_window = nil
	end
end

function LadderController.openLadderAwardWindow(slot0, slot1)
	if slot1 then
		if slot0.ladder_award_window == nil then
			slot0.ladder_award_window = LadderAwardWindow.New()
		end

		slot0.ladder_award_window:open()
	elseif slot0.ladder_award_window then
		slot0.ladder_award_window:close()

		slot0.ladder_award_window = nil
	end
end

function LadderController.openLadderRankWindow(slot0, slot1)
	if slot1 then
		if slot0.ladder_rank_window == nil then
			slot0.ladder_rank_window = LadderRankWindow.New()
		end

		slot0.ladder_rank_window:open()
	elseif slot0.ladder_rank_window then
		slot0.ladder_rank_window:close()

		slot0.ladder_rank_window = nil
	end
end

function LadderController.openLadderTopThreeWindow(slot0, slot1)
	if slot1 then
		if slot0.ladder_top_three_window == nil then
			slot0.ladder_top_three_window = LadderTopThreeWindow.New()
		end

		slot0.ladder_top_three_window:open()
	elseif slot0.ladder_top_three_window then
		slot0.ladder_top_three_window:close()

		slot0.ladder_top_three_window = nil
	end
end

function LadderController.openLadderBattleResultWindow(slot0, slot1, slot2)
	if slot1 then
		if slot0.ladder_result_window == nil then
			slot0.ladder_result_window = LadderBattleResultWindow.New()
		end

		slot0.ladder_result_window:open(slot2)
	elseif slot0.ladder_result_window then
		slot0.ladder_result_window:close()

		slot0.ladder_result_window = nil
	end
end

function LadderController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
