HalidomController = HalidomController or BaseClass(BaseController)

function HalidomController.config(slot0)
	slot0.model = HalidomModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function HalidomController.getModel(slot0)
	return slot0.model
end

function HalidomController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if not uv0.role_lev_event and uv0.role_vo then
				uv0.role_lev_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "coin" then
						uv0.model:calculateHalidomRedStatus()
					end
				end)
			end
		end)
	end

	if not slot0.goods_add_event then
		slot0.goods_add_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end

	if not slot0.goods_modify_event then
		slot0.goods_modify_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end

	if not slot0.goods_delete_event then
		slot0.goods_delete_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end
end

function HalidomController.registerProtocals(slot0)
	slot0:RegisterProtocal(22200, "handle22200")
	slot0:RegisterProtocal(22201, "handle22201")
	slot0:RegisterProtocal(22202, "handle22202")
	slot0:RegisterProtocal(22203, "handle22203")
	slot0:RegisterProtocal(22204, "handle22204")
	slot0:RegisterProtocal(22205, "handle22205")
end

function HalidomController.sender22200(slot0)
	slot0:SendProtocal(22200, {})
end

function HalidomController.handle22200(slot0, slot1)
	if slot1 then
		slot0.model:setAllHalidomData(slot1.list)
		GlobalEvent:getInstance():Fire(HalidomEvent.Get_Halidom_Data_Event)
	end
end

function HalidomController.handle22201(slot0, slot1)
	if slot1 then
		GlobalEvent:getInstance():Fire(HalidomEvent.Update_Halidom_Data_Event, slot1.id)

		if not slot0.model:updateHalidomData(slot1) then
			slot0:openHalidomUnlockWindow(true, slot1.id)
		end
	end
end

function HalidomController.sender22202(slot0, slot1, slot2)
	slot0:SendProtocal(22202, {
		id = slot1,
		list = slot2
	})
end

function HalidomController.handle22202(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HalidomController.sender22203(slot0, slot1)
	slot0:SendProtocal(22203, {
		id = slot1
	})
end

function HalidomController.handle22203(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HalidomController.sender22204(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(22204, {
		id = slot1,
		list1 = slot2,
		list2 = slot3
	})
end

function HalidomController.handle22204(slot0, slot1)
	if slot1 then
		message(slot1.msg)

		if slot1.code == TRUE then
			slot0:openHalidomUpStepWindow(true, slot1.id)
		end
	end
end

function HalidomController.handle22205(slot0, slot1)
	if slot1 and slot1.id then
		slot0:openHalidomUpLvWindow(true, slot1.id)
	end
end

function HalidomController.checkNeedUpdateRedStatus(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if Config.HalidomData.data_const.halidom_cost then
		slot3 = false

		for slot7, slot8 in pairs(slot1) do
			if slot8.config then
				for slot12, slot13 in pairs(slot2.val or {}) do
					if slot13 == slot8.config.id then
						slot3 = true

						break
					end
				end
			end

			if slot3 then
				break
			end
		end

		if slot3 then
			slot0.model:calculateHalidomRedStatus()
		end
	end
end

function HalidomController.openHalidomUpStepWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.up_step_window == nil then
			slot0.up_step_window = HalidomUpStepWindow.New()
		end

		if slot0.up_step_window:isOpen() == false then
			slot0.up_step_window:open(slot2)
		end
	elseif slot0.up_step_window then
		slot0.up_step_window:close()
	end
end

function HalidomController.openHalidomUpLvWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.up_lv_window == nil then
			slot0.up_lv_window = HalidomUpLvWindow.New()
		end

		if slot0.up_lv_window:isOpen() == false then
			slot0.up_lv_window:open(slot2)
		end
	elseif slot0.up_lv_window then
		slot0.up_lv_window:close()
	end
end

function HalidomController.openHalidomUnlockWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.unlock_window == nil then
			slot0.unlock_window = HalidomUnlockWindow.New()
		end

		if slot0.unlock_window:isOpen() == false then
			slot0.unlock_window:open(slot2)
		end
	elseif slot0.unlock_window then
		slot0.unlock_window:close()
	end
end

function HalidomController.openHalidomStepPreView(slot0, slot1, slot2)
	if slot1 == true then
		if slot0.step_pre_view == nil then
			slot0.step_pre_view = HalidomStepPreView.New()
		end

		if slot0.step_pre_view:isOpen() == false then
			slot0.step_pre_view:open(slot2)
		end
	elseif slot0.step_pre_view then
		slot0.step_pre_view:close()
	end
end

function HalidomController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
