PrimusController = PrimusController or BaseClass(BaseController)

function PrimusController.config(slot0)
	slot0.model = PrimusModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function PrimusController.getModel(slot0)
	return slot0.model
end

function PrimusController.registerEvents(slot0)
end

function PrimusController.registerProtocals(slot0)
	slot0:RegisterProtocal(20700, "handle20700")
	slot0:RegisterProtocal(20701, "handle20701")
	slot0:RegisterProtocal(20702, "handle20702")
	slot0:RegisterProtocal(20703, "handle20703")
	slot0:RegisterProtocal(20705, "handle20705")
	slot0:RegisterProtocal(20706, "handle20706")
end

function PrimusController.requestPrimusChallengeCount(slot0)
	slot0:SendProtocal(20700, {})
end

function PrimusController.handle20700(slot0, slot1)
	slot0.model:showPrimusRedPoint()
	GlobalEvent:getInstance():Fire(PrimusEvent.Updata_Primus_RedPoint)
end

function PrimusController.sender20701(slot0)
	slot0:SendProtocal(20701, {})
end

function PrimusController.handle20701(slot0, slot1)
	if slot1 and slot0.primus_main_window then
		slot0.primus_main_window:setData(slot1)
	end
end

function PrimusController.sender20702(slot0, slot1, slot2)
	slot0:SendProtocal(20702, {
		pos = slot1,
		num = slot2
	})
end

function PrimusController.handle20702(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openPrimusChallengePanel(false)
	end
end

function PrimusController.sender20703(slot0, slot1)
	slot0:SendProtocal(20703, {
		pos = slot1
	})
end

function PrimusController.handle20703(slot0, slot1)
	slot0:openPrimusChallengeRecordPanel(true, slot1)
end

function PrimusController.handle20705(slot0, slot1)
	slot0:openPrimusChallengeResultWindow(true, slot1)
end

function PrimusController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function PrimusController.openPrimusMainWindow(slot0, slot1)
	if slot1 == false then
		if slot0.primus_main_window ~= nil then
			slot0.primus_main_window:close()

			slot0.primus_main_window = nil
		end
	else
		if Config.DailyplayData.data_exerciseactivity[EsecsiceConst.exercise_index.honourfane] == nil then
			message(TI18N("霸气修炼数据异常"))

			return
		end

		if MainuiController:getInstance():checkIsOpenByActivate(slot2.activate) == false then
			message(slot2.lock_desc)

			return
		end

		slot0.model.is_show_redpoint = false

		if slot0.primus_main_window == nil then
			slot0.primus_main_window = PrimusMainWindow.New()
		end

		slot0.primus_main_window:open()
	end
end

function PrimusController.openPrimusChallengePanel(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.primus_challenge_panel ~= nil then
			slot0.primus_challenge_panel:close()

			slot0.primus_challenge_panel = nil
		end
	else
		if slot0.primus_challenge_panel == nil then
			slot0.primus_challenge_panel = PrimusChallengePanel.New()
		end

		slot0.primus_challenge_panel:open(slot2, slot3)
	end
end

function PrimusController.openPrimusChallengeRecordPanel(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.primus_challenge_record_panel ~= nil then
			slot0.primus_challenge_record_panel:close()

			slot0.primus_challenge_record_panel = nil
		end
	else
		if slot0.primus_challenge_record_panel == nil then
			slot0.primus_challenge_record_panel = PrimusChallengeRecordPanel.New()
		end

		slot0.primus_challenge_record_panel:open(slot2)
	end
end

function PrimusController.openPrimusChallengeResultWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.primus_challenge_result_window ~= nil then
			slot0.primus_challenge_result_window:close()

			slot0.primus_challenge_result_window = nil
		end
	else
		if slot0.primus_challenge_result_window == nil then
			slot0.primus_challenge_result_window = PrimusChallengeResultWindow.New()
		end

		slot0.primus_challenge_result_window:open(slot2)
	end
end

function PrimusController.checkIsCanOpenPrimusWindow(slot0)
	if (RoleController:getInstance():getRoleVo() and slot1.lev or 0) < Config.PrimusData.data_const.open_lev.val then
		message(string.format(TI18N("等级达到%s级开启\"霸气修炼\"玩法"), slot3))

		return false
	end

	return true
end

function PrimusController.sender20706(slot0)
	slot0:SendProtocal(20706, {})
end

function PrimusController.handle20706(slot0, slot1)
	slot2 = false

	if slot1.is_show == 1 then
		slot2 = true
	end

	slot0.model:setFirstLogin(slot2)
	GlobalEvent:getInstance():Fire(PrimusEvent.Updata_Primus_RedPoint)
end
