RedbagController = RedbagController or BaseClass(BaseController)

function RedbagController.config(slot0)
	slot0.model = RedbagModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.red_bag_vo = nil
end

function RedbagController.getModel(slot0)
	return slot0.model
end

function RedbagController.registerEvents(slot0)
	if not slot0.role_create_success then
		slot0.role_create_success = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.role_create_success)

			uv0.role_create_success = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo and uv0.role_update_event == nil then
				uv0.role_update_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "gid" and slot1 == 0 then
						uv0.model:resetData()
					end
				end)
			end
		end)
	end

	if not slot0.red_bg_event then
		slot0.red_bg_event = GlobalEvent:getInstance():Bind(MainuiEvent.CLOSE_ITEM_VIEW, function (slot0)
			if slot0 and slot0.is_red_bag and slot0.is_red_bag == true and uv0.model:getRedBagListById(slot0.info_data.id) ~= nil then
				uv0:openLookWindow(true, slot1)
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK and uv0.model:getRebBagItemNumList() then
				for slot6, slot7 in ipairs(uv0.model:getRebBagItemNumList()) do
					for slot11, slot12 in pairs(slot1) do
						if slot7 and slot7.bid == slot12.base_id then
							uv0.model:checkRedBagRedPoint()
						end
					end
				end
			end
		end)
	end

	if not slot0.modify_goods_event then
		slot0.modify_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 and slot0 == BackPackConst.Bag_Code.BACKPACK and uv0.model:getRebBagItemNumList() then
				for slot6, slot7 in ipairs(uv0.model:getRebBagItemNumList()) do
					for slot11, slot12 in pairs(slot1) do
						if slot7 and slot7.bid == slot12.base_id then
							uv0.model:checkRedBagRedPoint()
						end
					end
				end
			end
		end)
	end

	if not slot0.delete_goods_event then
		slot0.delete_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 and slot0 == BackPackConst.Bag_Code.BACKPACK and uv0.model:getRebBagItemNumList() then
				for slot6, slot7 in ipairs(uv0.model:getRebBagItemNumList()) do
					for slot11, slot12 in pairs(slot1) do
						if slot7 and slot7.bid == slot12.base_id then
							uv0.model:checkRedBagRedPoint()
						end
					end
				end
			end
		end)
	end
end

function RedbagController.registerProtocals(slot0)
	slot0:RegisterProtocal(13534, "handle13534")
	slot0:RegisterProtocal(13535, "handle13535")
	slot0:RegisterProtocal(13536, "handle13536")
	slot0:RegisterProtocal(13546, "handle13546")
	slot0:RegisterProtocal(13540, "handle13540")
	slot0:RegisterProtocal(13545, "handle13545")
end

function RedbagController.openMainView(slot0, slot1, slot2)
	if slot1 == true then
		if isQingmingShield and isQingmingShield() then
			return
		end

		if not slot0.main_view then
			slot0.main_view = RedBagWindow.New(slot2)
		end

		if slot0.main_view and slot0.main_view:isOpen() == false then
			slot0.main_view:open()
		end
	elseif slot0.main_view then
		slot0.main_view:close()

		slot0.main_view = nil
	end
end

function RedbagController.openLookWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.look_window then
			slot0.look_window = RedBagLookWindow.New(slot2)
		end

		if slot0.look_window and slot0.look_window:isOpen() == false then
			slot0.look_window:open()
		end
	elseif slot0.look_window then
		slot0.look_window:close()

		slot0.look_window = nil
	end
end

function RedbagController.sender13534(slot0)
	slot0:SendProtocal(13534, {})
end

function RedbagController.handle13534(slot0, slot1)
	slot0.model:updateData(slot1)
end

function RedbagController.sender13535(slot0, slot1, slot2)
	slot0:SendProtocal(13535, {
		type = slot1,
		num = 1,
		msg_id = 0,
		loss_type = slot2
	})
end

function RedbagController.handle13535(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function RedbagController.sender13536(slot0, slot1)
	slot0:SendProtocal(13536, {
		id = slot1
	})
end

function RedbagController.handle13536(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openRegBagWindow(true, slot1)
	end
end

function RedbagController.sender13540(slot0, slot1)
	slot0:SendProtocal(13540, {
		id = slot1
	})
end

function RedbagController.handle13540(slot0, slot1)
	GlobalEvent:getInstance():Fire(RedbagEvent.Get_List_Event, slot1)
end

function RedbagController.sender13545(slot0)
	slot0:SendProtocal(13545, {})
end

function RedbagController.handle13545(slot0, slot1)
	GlobalEvent:getInstance():Fire(RedbagEvent.Rank_List_Event, slot1)
end

function RedbagController.setRedBagVo(slot0, slot1)
	slot0.red_bag_vo = slot1
end

function RedbagController.openRegBagWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.open_window then
			slot0.open_window = RedBagOpenView.New()
		end

		if slot0.open_window and slot0.open_window:isOpen() == false then
			slot0.open_window:open(slot2)
		end
	elseif slot0.open_window then
		slot0.open_window:close()

		slot0.open_window = nil
	end
end

function RedbagController.send13546(slot0)
	slot0:SendProtocal(13546, {})
end

function RedbagController.handle13546(slot0, slot1)
	GlobalEvent:getInstance():Fire(RedbagEvent.Update_Red_Bag_Event, slot1.list)
end

function RedbagController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
