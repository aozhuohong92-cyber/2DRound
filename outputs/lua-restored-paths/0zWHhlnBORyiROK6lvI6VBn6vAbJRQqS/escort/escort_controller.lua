EscortController = EscortController or BaseClass(BaseController)

function EscortController.config(slot0)
	slot0.model = EscortModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function EscortController.getModel(slot0)
	return slot0.model
end

function EscortController.registerEvents(slot0)
end

function EscortController.registerProtocals(slot0)
end

function EscortController.requestInitProtocal(slot0, slot1)
end

function EscortController.openEscortMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.main_window ~= nil then
			slot0.main_window:close()

			slot0.main_window = nil
		end
	else
		if slot0:checkIsOpen(true) == false then
			return
		end

		if slot0.main_window == nil then
			slot0.main_window = EscortMainWindow.New()

			slot0.main_window:open(slot2)
		else
			slot0.main_window:setWindowData(slot2)
		end
	end
end

function EscortController.checkIsOpen(slot0, slot1)
	if Config.EscortData.data_const.open_lev == nil then
		return false
	end

	slot3 = MainuiController:getInstance():checkIsOpenByActivate(slot2.val)

	if slot1 == true and slot3 == false then
		message(slot2.desc)
	end

	return slot3
end

function EscortController.isInEscortScreen(slot0)
	return slot0.main_window ~= nil
end

function EscortController.openEscortLogWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.log_window then
			slot0.log_window:close()

			slot0.log_window = nil
		end
	else
		if slot0.log_window == nil then
			slot0.log_window = EscortLogWindow.New()
		end

		slot0.log_window:open(slot2 or EscortConst.log_type.def)
	end
end

function EscortController.openEscortChallengeWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.challenge_window then
			slot0.challenge_window:close()

			slot0.challenge_window = nil
		end
	else
		if slot0.challenge_window == nil then
			slot0.challenge_window = EscortChallengeWindow.New(slot2 or EscortConst.challenge_type.revenge)
		end

		slot0.challenge_window:open(slot3)
	end
end

function EscortController.openEscortEmployWindow(slot0, slot1)
	if slot1 == false then
		if slot0.escort_employ_window then
			slot0.escort_employ_window:close()

			slot0.escort_employ_window = nil
		end
	else
		if slot0.escort_employ_window == nil then
			slot0.escort_employ_window = EscortEmployWindow.New()
		end

		slot0.escort_employ_window:open(data)
	end
end

function EscortController.openEscortMyInfoWindow(slot0, slot1)
	if slot1 == false then
		if slot0.my_info_window then
			slot0.my_info_window:close()

			slot0.my_info_window = nil
		end
	else
		if slot0.my_info_window == nil then
			slot0.my_info_window = EscortMyInfoWindow.New()
		end

		slot0.my_info_window:open()
	end
end

function EscortController.openEscortPlunderWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.plunder_window then
			slot0.plunder_window:close()

			slot0.plunder_window = nil
		end
	else
		if slot0.plunder_window == nil then
			slot0.plunder_window = EscortPlunderWindow.New()
		end

		slot0.plunder_window:open(slot2)
	end
end

function EscortController.handle24006(slot0, slot1)
	slot0.model:setMyInfo(slot1)
end

function EscortController.requestEscortBaseInfo(slot0, slot1, slot2)
	slot0:SendProtocal(24000, {
		rid = slot1 or 0,
		srv_id = slot2 or ""
	})
end

function EscortController.handle24000(slot0, slot1)
	slot0.model:updateEscortBaseInfo(slot1)
end

function EscortController.requestRefreshEscort(slot0, slot1)
	slot0:SendProtocal(24001, {
		type = slot1 or 1
	})
end

function EscortController.handle24001(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		-- Nothing
	end
end

function EscortController.requestEscort(slot0)
	slot0:SendProtocal(24002, {})
end

function EscortController.handle24002(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0:openEscortEmployWindow(false)
	end
end

function EscortController.requestCheckEscortPlayer(slot0, slot1, slot2)
	slot0:SendProtocal(24010, {
		rid = slot1 or 0,
		srv_id = slot2 or ""
	})
end

function EscortController.handle24010(slot0, slot1)
	slot0:openEscortPlunderWindow(true, slot1)
end

function EscortController.requestGetEscortAwards(slot0)
	slot0:SendProtocal(24004, {})
end

function EscortController.handle24004(slot0, slot1)
	if slot1.result == TRUE then
		slot0:openEscortMyInfoWindow(false)
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Escort)
	end
end

function EscortController.requestUseAssetsFinishEscort(slot0)
	slot0:SendProtocal(24003, {})
end

function EscortController.handle24003(slot0, slot1)
	if slot1.result == TRUE then
		slot0:openEscortMyInfoWindow(false)
	end
end

function EscortController.handle24005(slot0, slot1)
	GlobalEvent:getInstance():Fire(EscortEvent.UpdateEscortPlayerList, slot1)
end

function EscortController.requestPlunderEscort(slot0, slot1, slot2)
	slot0:SendProtocal(24011, {
		rid = slot1 or 0,
		srv_id = slot2 or ""
	})
end

function EscortController.handle24011(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0:openEscortPlunderWindow(false)
	end
end

function EscortController.handle24012(slot0, slot1)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Escort, slot1)
end

function EscortController.requestLogByType(slot0, slot1)
	slot0:SendProtocal(24013, {
		type = slot1
	})
end

function EscortController.handle24013(slot0, slot1)
	GlobalEvent:getInstance():Fire(EscortEvent.UpdateEscortLogInfoEvent, slot1)
end

function EscortController.requestAtkPlunderPlayer(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24015, {
		rid = slot1,
		srv_id = slot2,
		id = slot3
	})
end

function EscortController.handle24015(slot0, slot1)
	message(slot1.msg)

	if slot1.result == TRUE then
		slot0:openEscortChallengeWindow(false)
	end
end

function EscortController.requestPlunderInfo(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(24014, {
		rid = slot1 or 0,
		srv_id = slot2 or "",
		id = slot3 or 1,
		type = slot4 or EscortConst.challenge_type.revenge
	})
end

function EscortController.handle24014(slot0, slot1)
	slot0:openEscortChallengeWindow(true, slot1.type, slot1)
end

function EscortController.requestGuildForHelp(slot0, slot1)
	slot0:SendProtocal(24017, {
		id = slot1
	})
end

function EscortController.handle24017(slot0, slot1)
	message(slot1.msg)
end

function EscortController.handle24018(slot0, slot1)
	GlobalEvent:getInstance():Fire(EscortEvent.UpdateEscortSingleLogInfo, slot1)
end

function EscortController.handle24020(slot0, slot1)
	slot0.model:setDoubleTimes(slot1.code)
end

function EscortController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
