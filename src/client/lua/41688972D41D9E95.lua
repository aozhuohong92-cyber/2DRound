HallowsController = HallowsController or BaseClass(BaseController)

function HallowsController.config(slot0)
	slot0.model = HallowsModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_self_handle = false
end

function HallowsController.getModel(slot0)
	return slot0.model
end

function HallowsController.registerEvents(slot0)
	if slot0.backpack_init_event == nil then
		slot0.backpack_init_event = GlobalEvent:getInstance():Bind(BackpackEvent.GET_ALL_DATA, function (slot0)
		end)
	end

	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if not uv0.role_lev_event and uv0.role_vo then
				uv0.role_lev_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "coin" or slot0 == "hallow_refine" or slot0 == "lev" then
						uv0.model:checkHallowsRedStatus()
					end
				end)
			end
		end)
	end

	if slot0.battle_drama_event == nil then
		slot0.battle_drama_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Max_Id, function (slot0)
			uv0:requestInitProtocals(slot0)
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

	if not slot0.goods_update_event then
		slot0.goods_update_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end

	if not slot0.goods_del_event then
		slot0.goods_del_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:checkNeedUpdateRedStatus(slot1)
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0.resonate_data = nil

			uv0:requestInitProtocals()
		end)
	end
end

function HallowsController.checkNeedUpdateRedStatus(slot0, slot1)
	if slot0.is_self_handle == true then
		slot0.is_self_handle = false

		return
	end

	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6.config and (slot6.config.id == 72001 or slot6.config.id == 72002 or slot6.config.id == 72003) then
			slot0.model:checkHallowsRedStatus()
		end
	end
end

function HallowsController.registerProtocals(slot0)
	slot0:RegisterProtocal(24100, "handle24100")
	slot0:RegisterProtocal(24101, "handle24101")
	slot0:RegisterProtocal(24102, "handle24102")
	slot0:RegisterProtocal(24103, "handle24103")
	slot0:RegisterProtocal(24104, "handle24104")
	slot0:RegisterProtocal(24105, "handle24105")
	slot0:RegisterProtocal(24107, "handle24107")
	slot0:RegisterProtocal(24108, "handle24108")
	slot0:RegisterProtocal(24120, "handle24120")
	slot0:RegisterProtocal(24121, "handle24121")
	slot0:RegisterProtocal(24122, "handle24122")
	slot0:RegisterProtocal(24123, "handle24123")
	slot0:RegisterProtocal(24124, "handle24124")
	slot0:RegisterProtocal(24125, "handle24125")
	slot0:RegisterProtocal(24126, "handle24126")
	slot0:RegisterProtocal(24127, "handle24127")
	slot0:RegisterProtocal(24128, "handle24128")
	slot0:RegisterProtocal(24129, "handle24129")
	slot0:RegisterProtocal(24130, "handle24130")
	slot0:RegisterProtocal(24131, "handle24131")
	slot0:RegisterProtocal(24132, "handle24132")
	slot0:RegisterProtocal(24133, "handle24133")
	slot0:RegisterProtocal(24135, "handle24135")
end

function HallowsController.checkIsOpen(slot0, slot1)
	if Config.FunctionData.data_base[MainuiConst.btn_index.hallows] == nil then
		return false
	end

	slot3 = MainuiController:getInstance():checkIsOpenByActivate(slot2.activate)

	if slot1 == true and slot3 == false then
		message(slot2.desc)
	end

	return slot3
end

function HallowsController.requestInitProtocals(slot0)
	if slot0:checkIsOpen() == true then
		if slot1 and slot0.battle_drama_event then
			GlobalEvent:getInstance():UnBind(slot0.battle_drama_event)

			slot0.battle_drama_event = nil
		end

		slot0:requestHallowsInfo()
	end
end

function HallowsController.getHallowsRoot(slot0)
	if slot0.hallows_window then
		return slot0.hallows_window.root_wnd
	end
end

function HallowsController.getHallowsActivityRoot(slot0)
	if slot0.activity_window then
		return slot0.activity_window.root_wnd
	end
end

function HallowsController.getHallowsPreviewRoot(slot0)
	if slot0.hallows_preview then
		return slot0.hallows_preview.root_wnd
	end
end

function HallowsController.openHallowsMainWindow(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		if slot0.hallows_window then
			slot0.hallows_window:close()

			slot0.hallows_window = nil
		end
	else
		if slot0:checkIsOpen(true) == false then
			return
		end

		if slot0.model:getHallowsOpenFlag() == 0 then
			slot0:requestSignOpenHallows()
			slot0.model:setOpenHallowsFlag(1)
			slot0:openHallowsPreviewWindow(true)

			return
		end

		if slot0.hallows_window == nil then
			if slot0.model:checkIsHaveAllHallows() then
				slot0.hallows_window = HallowsMainWindow.New()
			else
				slot0.hallows_window = HallowsTaskWindow.New()
			end
		end

		slot0.hallows_window:open(slot2, slot3, slot4)
	end
end

function HallowsController.openHallowsPreviewWindow(slot0, slot1)
	if slot1 == true then
		if slot0.hallows_preview == nil then
			slot0.hallows_preview = HallowsPreviewWindow.New()
		end

		slot0.hallows_preview:open()
	elseif slot0.hallows_preview then
		slot0.hallows_preview:close()

		slot0.hallows_preview = nil
	end
end

function HallowsController.openHallowsTraceWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.trace_window then
			slot0.trace_window:close()

			slot0.trace_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.trace_window == nil then
			slot0.trace_window = HallowsTraceWindow.New()
		end

		slot0.trace_window:open(slot2)
	end
end

function HallowsController.openHallowsTips(slot0, slot1, slot2)
	if not slot1 then
		if slot0.hallows_tips then
			slot0.hallows_tips:close()

			slot0.hallows_tips = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.hallows_tips == nil then
			slot0.hallows_tips = HallowsTips.New()
		end

		slot0.hallows_tips:open(slot2)
	end
end

function HallowsController.openHallowsActivityWindow(slot0, slot1, slot2, slot3)
	if not slot1 then
		if slot0.activity_window then
			slot0.activity_window:close()

			slot0.activity_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.activity_window == nil then
			slot0.activity_window = HallowsActivityWindow.New()
		end

		slot0.activity_window:open(slot2, slot3)
	end
end

function HallowsController.openHallowsStepUpWindow(slot0, slot1, slot2)
	if not slot1 then
		if slot0.step_up_window then
			slot0.step_up_window:close()

			slot0.step_up_window = nil
		end

		if slot0.resonate_data then
			slot0:openHallowsResonateUpWindow(true, slot0.resonate_data)

			slot0.resonate_data = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.step_up_window == nil then
			slot0.step_up_window = HallowsStepUpWindow.New()
		end

		slot0.step_up_window:open(slot2)
	end
end

function HallowsController.openHallowsMagicWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.hallows_magic_view == nil then
			slot0.hallows_magic_view = HallowsMagicWindow.New()
		end

		if slot0.hallows_magic_view:isOpen() == false then
			slot0.hallows_magic_view:open(slot2, slot3)
		end
	elseif slot0.hallows_magic_view then
		slot0.hallows_magic_view:close()

		slot0.hallows_magic_view = nil
	end
end

function HallowsController.requestHallowsInfo(slot0)
	slot0:SendProtocal(24100, {})
	slot0:SendProtocal(24120, {})
end

function HallowsController.handle24100(slot0, slot1)
	slot0.model:updateHallowsInfo(slot1)
end

function HallowsController.handle24107(slot0, slot1)
	slot0.model:updateHallowsData(slot1)
	GlobalEvent:getInstance():Fire(HallowsEvent.HallowsUpdateEvent, slot1.id)
end

function HallowsController.handle24108(slot0, slot1)
	slot0.model:updateHallowsData(slot1)

	if slot0.model:checkIsHaveAllHallows() and slot0.hallows_window then
		slot0:openHallowsMainWindow(false)
		slot0:openHallowsMainWindow(true)
	end

	GlobalEvent:getInstance():Fire(HallowsEvent.HallowsActivityEvent, slot1.id)
	slot0:openHallowsActivityWindow(true, slot1)
end

function HallowsController.requestHallowsAdvance(slot0, slot1, slot2)
	slot0.is_self_handle = true
	slot3 = 0

	if slot2 == true then
		slot3 = 1
	end

	slot0:SendProtocal(24101, {
		id = slot1,
		is_auto = slot3
	})
end

function HallowsController.handle24101(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		slot0:openHallowsStepUpWindow(true, slot1.id)
	else
		slot0.is_self_handle = false
	end

	GlobalEvent:getInstance():Fire(HallowsEvent.HallowsAdvanceEvent, slot1.id, slot1.result)
end

function HallowsController.requestHallowsSkillUpgrade(slot0, slot1)
	slot0.is_self_handle = true

	slot0:SendProtocal(24103, {
		hallows_id = slot1
	})
end

function HallowsController.handle24103(slot0, slot1)
	message(slot1.msg)

	if slot1.result ~= 1 then
		slot0.is_self_handle = false
	end
end

function HallowsController.requestHallowsEquip(slot0, slot1, slot2, slot3)
	slot0.is_self_handle = true

	slot0:SendProtocal(24102, {
		hallows_id = slot1 or 0,
		id = slot2 or 1,
		pos = slot3 or 1
	})
end

function HallowsController.handle24102(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		GlobalEvent:getInstance():Fire(HallowsEvent.HallowsEqupUpEvent, slot1.id, slot1.pos)
	else
		slot0.is_self_handle = false
	end
end

function HallowsController.requestUseTraceItem(slot0, slot1, slot2)
	slot0.is_self_handle = true

	slot0:SendProtocal(24104, {
		hallows_id = slot1 or 0,
		num = slot2 or 1
	})
end

function HallowsController.handle24104(slot0, slot1)
	message(slot1.msg)

	if slot1.result == 1 then
		slot0:openHallowsTraceWindow(false)
	else
		slot0.is_self_handle = false
	end
end

function HallowsController.handle24120(slot0, slot1)
	slot0.model:updateHallowsTask(slot1.list)
end

function HallowsController.handle24121(slot0, slot1)
	slot0.model:updateHallowsTask(slot1.list)
end

function HallowsController.requestSubmitHallowsTask(slot0, slot1)
	slot0:SendProtocal(24122, {
		id = slot1
	})
end

function HallowsController.handle24122(slot0, slot1)
	message(slot1.msg)
end

function HallowsController.handle24105(slot0, slot1)
	slot0.resonate_data = slot1
end

function HallowsController.requestHallowsReset(slot0, slot1)
	slot0:SendProtocal(24123, {
		id = slot1
	})
end

function HallowsController.handle24123(slot0, slot1)
	message(slot1.msg)
end

function HallowsController.requestSignOpenHallows(slot0)
	slot0:SendProtocal(24124, {})
end

function HallowsController.handle24124(slot0, slot1)
	if slot1.is_first then
		slot0.model:setOpenHallowsFlag(slot1.is_first)
	end
end

function HallowsController.send24125(slot0)
	slot0:SendProtocal(24125, {})
end

function HallowsController.handle24125(slot0, slot1)
	if slot1 then
		slot0.model:setHallowsMagicData(slot1.hallows_looks)
	end
end

function HallowsController.handle24126(slot0, slot1)
	if slot1 then
		slot0.model:updateHallowsMagicData(slot1)
		GlobalEvent:getInstance():Fire(HallowsEvent.UpdateHallowsMagicDataEvent, slot1.id)
	end
end

function HallowsController.handle24127(slot0, slot1)
	if slot1 then
		slot0:openHallowsActivityWindow(true, slot1, HallowsConst.Activity_Type.Magic)
		GlobalEvent:getInstance():Fire(HallowsEvent.HallowsMagicActivityEvent)
	end
end

function HallowsController.send24128(slot0)
	slot0:SendProtocal(24128, {})
end

function HallowsController.handle24128(slot0, slot1)
	if slot1 then
		slot0.model:setHallowsMagicTaskData(slot1.list)
	end
end

function HallowsController.handle24129(slot0, slot1)
	if slot1 then
		slot0.model:updateHallowsMagicTaskData(slot1.list)
		GlobalEvent:getInstance():Fire(HallowsEvent.UpdateHallowsMagicTaskEvent)
	end
end

function HallowsController.send24130(slot0, slot1)
	slot0:SendProtocal(24130, {
		id = slot1
	})
end

function HallowsController.handle24130(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HallowsController.send24131(slot0, slot1)
	slot0:SendProtocal(24131, {
		id = slot1
	})
end

function HallowsController.handle24131(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HallowsController.send24132(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(24132, {
		id = slot1,
		hallows_id = slot2,
		flag = slot3
	})
end

function HallowsController.handle24132(slot0, slot1)
	if slot1 then
		message(slot1.msg)
	end
end

function HallowsController.handle24133(slot0, slot1)
	if slot1 then
		slot0.model:deleteHallowsMagicById(slot1.id)
		GlobalEvent:getInstance():Fire(HallowsEvent.UpdateHallowsMagicDataEvent, slot1.id)
	end
end

function HallowsController.send24135(slot0, slot1)
	slot0:SendProtocal(24135, {
		hallows_id = slot1
	})
end

function HallowsController.handle24135(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end

	if slot1.code == TRUE then
		slot0.model:updateHallowsData({
			id = slot1.hallows_id,
			refine_lev = slot1.refine_lev
		})
		GlobalEvent:getInstance():Fire(HallowsEvent.HallowsUpdateEvent, slot1.hallows_id, true)
	end
end

function HallowsController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
