GodbattleController = GodbattleController or BaseClass(BaseController)

function GodbattleController.config(slot0)
	slot0.model = GodbattleModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.kill_notice_list = {}
	slot0.apply_status = 0
end

function GodbattleController.getModel(slot0)
	return slot0.model
end

function GodbattleController.registerEvents(slot0)
end

function GodbattleController.registerProtocals(slot0)
end

function GodbattleController.requestInitProtocal(slot0, slot1)
	if slot0.role_vo == nil then
		return
	end

	if Config.ZsWarData.data_const.limit_lev == nil then
		return
	end

	if slot2.val <= slot0.role_vo.lev then
		if slot1 == true then
			slot0:SendProtocal(21403, {})
		elseif slot0.model:hadRequestStatus() == false then
			slot0:SendProtocal(21403, {})
		end
	end
end

function GodbattleController.on21403(slot0, slot1)
	if slot1.code == GodBattleConstants.apply_status.auto_enter then
		slot0.model:updateApplyStatus(GodBattleConstants.apply_status.in_game)
		slot0:requestEnterGodBattle()

		return
	end

	slot0.model:updateApplyStatus(slot1.code)

	if slot1.code == GodBattleConstants.apply_status.in_game then
		if slot0.model:getSelfInfo() == nil then
			-- Nothing
		end

		if slot0.godbattle_window == nil then
			ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle)
		end
	elseif slot1.code == GodBattleConstants.apply_status.un_apply then
		slot0:requestExitGodBattle()
	end
end

function GodbattleController.requestEnterGodBattle(slot0)
	if MainuiController:getInstance():getMainUIIndex() == MainuiConst.btn_index.main_scene then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Godbattle)
	else
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.godbattle)
	end
end

function GodbattleController.convertName(slot0, slot1)
	if slot1.camp == GodBattleConstants.camp.god then
		slot2 = string.format("战桃丸·%s", transformNameByServ(slot1.name, slot1.srv_id))
	elseif slot1.camp == GodBattleConstants.camp.devil then
		slot2 = string.format("炎魔·%s", slot2)
	end

	return slot2
end

function GodbattleController.requestExitGodBattle(slot0)
	if slot0.godbattle_window then
		slot0:openGodBattleMainWindow(false)
	end

	slot0.kill_notice_list = {}

	if slot0.kill_notice ~= nil then
		slot0.kill_notice:close()

		slot0.kill_notice = nil

		print("kill_notice_close")
	end
end

function GodbattleController.openGodBattleMainWindow(slot0, slot1)
	if not slot1 then
		if slot0.godbattle_window then
			slot0.godbattle_window:close()

			slot0.godbattle_window = nil
		end
	else
		if Config.ZsWarData.data_const.limit_lev and slot0.role_vo.lev < slot2.val then
			message(TI18N("等级不足"))

			return
		end

		if MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.godbattle) == nil then
			message(TI18N("活动暂未开始"))

			return
		end

		if slot3.status == MainuiConst.icon_status.prepare then
			if slot0.model:getApplyStatus() == GodBattleConstants.apply_status.un_apply then
				ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle_sign)
			end
		elseif slot3.status == MainuiConst.icon_status.start then
			if slot4 == GodBattleConstants.apply_status.un_apply then
				ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle)
			else
				if slot0.godbattle_window == nil then
					slot0.godbattle_window = GodBattleScene.New()
				end

				slot0.godbattle_window:open()
			end
		end
	end
end

function GodbattleController.isInGodBattleScreen(slot0)
	return slot0.godbattle_window ~= nil
end

function GodbattleController.openGodBattleApplyView(slot0, slot1)
	if slot1 == true then
		ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle)
	end
end

function GodbattleController.requestApplyGodBattle(slot0)
	slot0:SendProtocal(21401, protocal)
end

function GodbattleController.on21401(slot0, slot1)
	message(slot1.msg)
end

function GodbattleController.requestGodBattleRoleList(slot0)
	slot0:SendProtocal(21410, {})
end

function GodbattleController.on21411(slot0, slot1)
	slot0.model:updateRoleMoveData(slot1)
end

function GodbattleController.on21412(slot0, slot1)
	slot0.model:updateTotalScore(slot1)
end

function GodbattleController.openGodBattleRewardsWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.godbattle_rewards then
			slot0.godbattle_rewards:close()

			slot0.godbattle_rewards = nil
		end
	else
		if slot0.godbattle_rewards == nil then
			slot0.godbattle_rewards = GodBattleRewardsWindow:New()
		end

		slot0.godbattle_rewards:open(slot2)
	end
end

function GodbattleController.on21402(slot0, slot1)
	message(slot1.msg)
end

function GodbattleController.clearGodBattleData(slot0)
	slot0.model:clearGodBattleData()
	slot0:openGodBattleInfoView(false)
	slot0:openGodBattleKillNoticeView(false)
end

function GodbattleController.on21410(slot0, slot1)
	slot0.model:updateRoleData(slot1)
end

function GodbattleController.getTimeInfo(slot0)
	if MainuiController:getInstance() ~= nil then
		return slot1:getFunctionIconById(MainuiConst.icon.godbattle)
	end
end

function GodbattleController.on21413(slot0, slot1)
	slot0.model:updateGuardData(slot1)
end

function GodbattleController.on21414(slot0, slot1)
end

function GodbattleController.on21415(slot0, slot1)
	slot0:requestExitGodBattle()

	if slot0.result_info == nil then
		slot0.result_info = {}
	end

	for slot5, slot6 in pairs(slot1) do
		slot0.result_info[slot5] = slot6
	end

	slot0:openGodBattleResult(true)
end

function GodbattleController.openGodBattleResult(slot0, slot1)
	if slot1 == false then
		if slot0.godbattle_result ~= nil then
			slot0.godbattle_result:close()

			slot0.godbattle_result = nil
		end
	else
		if slot0.godbattle_result == nil then
			slot0.godbattle_result = GodBattleResultView.New(GodbattleController:getInstance())
		end

		if slot0.godbattle_result and slot0.godbattle_result:isOpen() == false then
			slot0.godbattle_result:open()
		end
	end
end

function GodbattleController.getGodBattleResult(slot0)
	return slot0.result_info or {}
end

function GodbattleController.openGodBattleInfoView(slot0, slot1)
	if slot1 == false then
		if slot0.godbattle_info ~= nil then
			slot0.godbattle_info:close()

			slot0.godbattle_info = nil
		end
	else
		if slot0.godbattle_info == nil then
			slot0.godbattle_info = GodBattleInfoView.New()
		end

		slot0.godbattle_info:open()
	end
end

function GodbattleController.on21420(slot0, slot1)
	slot0.model:updateRoleSkillData(slot1)
end

function GodbattleController.requestUseGodBattleSkill(slot0, slot1)
	slot0:SendProtocal(21421, {
		id = slot1
	})
end

function GodbattleController.on21421(slot0, slot1)
	message(slot1.msg)
end

function GodbattleController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function GodbattleController.on21409(slot0, slot1)
	GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateTimeCountDown, slot1.time)
end

function GodbattleController.on21416(slot0, slot1)
	if slot0.kill_notice ~= nil then
		table.insert(slot0.kill_notice_list, slot1)
	else
		slot0:openGodBattleKillNoticeView(true, slot1)
	end
end

function GodbattleController.openGodBattleKillNoticeView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.kill_notice ~= nil then
			slot0.kill_notice:close()

			slot0.kill_notice = nil

			if slot0.kill_notice_list and next(slot0.kill_notice_list) ~= nil then
				slot0:openGodBattleKillNoticeView(true, table.remove(slot0.kill_notice_list, 1))
			end
		end
	else
		if slot2 == nil then
			return
		end

		if slot0:checkIsInGodbattle() == false then
			return
		end

		if slot0.kill_notice == nil then
			slot0.kill_notice = GodBattleKillNoticeView.New()
		end

		if slot0.kill_notice and slot0.kill_notice:isOpen() == false then
			slot0.kill_notice:open(slot2)
		end
	end
end

function GodbattleController.checkIsInGodbattle(slot0)
	if slot0.model:getApplyStatus() ~= GodBattleConstants.apply_status.in_game then
		return false
	end

	if slot0.godbattle_window == nil then
		return false
	end

	return true
end

function GodbattleController.on21417(slot0, slot1)
	GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateRoleAwards, slot1.items)
end

function GodbattleController.on21425(slot0, slot1)
	slot0.model:setSelfInfo(slot1)
end

function GodbattleController.on21426(slot0, slot1)
	slot0.model:setRewardInfo(slot1)
end

function GodbattleController.requestGetCombatReward(slot0, slot1, slot2)
	slot0:SendProtocal(21427, {
		type = slot1,
		num = slot2
	})
end

function GodbattleController.on21427(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		if slot0.model:getRewardInfo() then
			if slot1.type == 1 then
				slot2.win_list[slot1.num] = 1
			else
				slot2.cnum_list[slot1.num] = 1
			end
		end

		slot0.model:recalcRedPoint()
		GlobalEvent:getInstance():Fire(GodbattleEvent.UpdateCombatAwards, slot1.type, slot1.num)
	end
end
