RolesceneController = RolesceneController or BaseClass(BaseController)

function RolesceneController.config(slot0)
	slot0.model = RolesceneModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function RolesceneController.getModel(slot0)
	return slot0.model
end

function RolesceneController.registerEvents(slot0)
end

function RolesceneController.registerProtocals(slot0)
	slot0:RegisterProtocal(10200, "on10200")
	slot0:RegisterProtocal(10210, "on10210")
	slot0:RegisterProtocal(10213, "on10213")
	slot0:RegisterProtocal(10214, "on10214")
	slot0:RegisterProtocal(10215, "on10215")
	slot0:RegisterProtocal(10220, "on10220")
	slot0:RegisterProtocal(10222, "on10222")
	slot0:RegisterProtocal(10260, "on10260")
	slot0:RegisterProtocal(10262, "on10262")
	slot0:RegisterProtocal(10216, "on10216")
	slot0:RegisterProtocal(10217, "on10217")
	slot0:RegisterProtocal(10218, "on10218")
	slot0:RegisterProtocal(10219, "on10219")
	slot0:RegisterProtocal(10266, "on10266")
end

function RolesceneController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function RolesceneController.exitRoleScene(slot0, slot1)
	if slot0.model:getScene() == nil then
		return
	end

	if slot0.model then
		slot0.model:DeleteMe()
	end

	slot0.last_pos = nil
end

function RolesceneController.handleRoleScene(slot0, slot1)
	slot0.model:handleScene(slot1)
end

function RolesceneController.requestHandleUnit(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(10200, {
		battle_id = slot1,
		id = slot2,
		code = slot3 or 0
	})
end

function RolesceneController.on10200(slot0, slot1)
	if slot1.result == FALSE then
		message(slot1.msg)
	end
end

function RolesceneController.requestExitRoleScene(slot0, slot1)
	if slot0.model:getScene() ~= nil then
		slot0.is_enter_main = slot1

		slot0:SendProtocal(13567, {})
	end
end

function RolesceneController.on10210(slot0, slot1)
	if slot1.bid == 0 then
		slot0:exitRoleScene()
	elseif slot1.bid == 1 then
		slot0:exitRoleScene(true)
	else
		MainSceneController:getInstance():destroyMainScene(MainSceneStatus.role_scene)

		if slot0:isHideMainUI(slot1.bid) == true or slot1.bid == Config.CrossHallData.data_const.hall_map.val then
			MainuiController:getInstance():openMainUI(false)
		end

		slot0.model:changeScene(slot1)
	end
end

function RolesceneController.isHideMainUI(slot0, slot1)
	if not Config.Map[slot1 or 0] then
		return false
	end

	if not slot2.client_type then
		return false
	end

	if slot2.client_type == 1 or slot2.client_type == 2 then
		return true
	end

	return false
end

function RolesceneController.on10213(slot0, slot1)
	slot0.model:addRole(slot1)
end

function RolesceneController.on10214(slot0, slot1)
	if slot0.model and slot0.model:getSceneId() == slot1.bid then
		for slot5, slot6 in pairs(slot1.role_ids) do
			slot0.model:removeRole(slot6.srv_id, slot6.rid)
		end
	end
end

function RolesceneController.on10260(slot0, slot1)
	slot0.model:addUnit(slot1)
end

function RolesceneController.on10262(slot0, slot1)
	if slot0.model and slot1 then
		slot0.model:removeUnit(slot1.id, slot1.battle_id)
	end
end

function RolesceneController.on10266(slot0, slot1)
	slot0.model:addUnit(slot1)
end

function RolesceneController.move(slot0, slot1, slot2)
	slot1 = slot1 or cc.p(0, 0)
	slot3 = math.floor(math.max(slot1.x, 0))
	slot4 = math.floor(math.max(slot1.y, 0))

	if slot0.last_pos ~= nil then
		if slot0.last_pos.x == slot3 and slot0.last_pos.y == slot4 then
			return
		end

		slot0.last_pos = cc.p(slot3, slot4)
	end

	slot0:SendProtocal(10215, {
		x = slot3,
		y = slot4,
		dir = slot2,
		base_id = slot0.model:getSceneId()
	})
end

function RolesceneController.on10215(slot0, slot1)
	if slot1 then
		slot0.model:syncRoles(slot1)
	end
end

function RolesceneController.on10216(slot0, slot1)
	if slot1 and next(slot1.role_list) ~= nil then
		for slot5, slot6 in pairs(slot1.role_list) do
			slot0:on10213(slot6)
		end
	end
end

function RolesceneController.on10217(slot0, slot1)
	slot0:on10213(slot1)
end

function RolesceneController.on10218(slot0, slot1)
	slot0.model:updateHeroPos(slot1)
end

function RolesceneController.on10220(slot0, slot1)
	for slot5, slot6 in pairs(slot1.unit_list) do
		slot0.model:addUnit(slot6)
	end
end

function RolesceneController.on10222(slot0, slot1)
	for slot5, slot6 in pairs(slot1.role_list) do
		slot0:on10213(slot6)
	end
end

function RolesceneController.on10219(slot0, slot1)
	slot0.model:updateRoleLooks(slot1)
end

function RolesceneController.getIsInChiefWar(slot0)
	if not Config.Map[slot0:getSceneID() or 0] then
		return false
	end

	if slot2.client_type == RolesceneConst.type.chiefwar_formal then
		return true
	end

	return false
end

function RolesceneController.getSceneID(slot0)
	return slot0.model:getSceneId() or 0
end
