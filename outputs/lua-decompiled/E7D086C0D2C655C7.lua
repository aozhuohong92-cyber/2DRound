PrimusModel = PrimusModel or BaseClass()

function PrimusModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
end

function PrimusModel.config(slot0)
end

function PrimusModel.setFirstLogin(slot0, slot1)
	slot0.is_show_redpoint = slot1
end

function PrimusModel.getFirstLogin(slot0)
	if slot0.is_show_redpoint then
		return slot0.is_show_redpoint
	end

	return false
end

function PrimusModel.showPrimusRedPoint(slot0)
	MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {
		bid = RedPointType.primus,
		status = slot0:checkPrimusRedStatus()
	})
end

function PrimusModel.checkPrimusRedStatus(slot0)
	if MainuiController:getInstance():checkIsOpenByActivate(Config.DailyplayData.data_exerciseactivity[EsecsiceConst.exercise_index.honourfane].activate) == false then
		return false
	end

	slot3 = false

	if slot0:getFirstLogin() and slot4 == true then
		if RoleController:getInstance():getRoleVo().lev < Config.PrimusData.data_const.redpoint_close_condition.val then
			slot3 = true
		elseif ArenaController:getInstance():getModel():getMyLoopData() and slot7.rank and slot7.rank ~= 0 and slot7.rank <= 50 then
			slot3 = true
		end
	end

	return slot3
end

function PrimusModel.__delete(slot0)
end
