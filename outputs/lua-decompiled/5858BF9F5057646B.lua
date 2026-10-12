GuildvoyageController = GuildvoyageController or BaseClass(BaseController)

function GuildvoyageController.config(slot0)
	slot0.model = GuildvoyageModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function GuildvoyageController.getModel(slot0)
	return slot0.model
end

function GuildvoyageController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo ~= nil then
				uv0:requestInitProtocal(true)

				if uv0.role_assets_event == nil then
					uv0.role_assets_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
						if slot0 == "guild_lev" then
							uv0:requestInitProtocal()
						end
					end)
				end
			end
		end)
	end

	if slot0.re_link_game_event == nil then
		slot0.re_link_game_event = GlobalEvent:getInstance():Bind(LoginEvent.RE_LINK_GAME, function ()
			uv0:openMainWindow(false)
			uv0:openGuildvoyageOrderEscortWindow(false)
			uv0:openChoosePartnerWindow(false)
			uv0:requestInitProtocal(true)
		end)
	end
end

function GuildvoyageController.requestInitProtocal(slot0, slot1)
	if slot0.role_vo == nil then
		return
	end

	if Config.GuildShippingData.data_const.guild_lev == nil then
		return
	end

	if slot0.role_vo.gid == 0 or slot0.role_vo.guild_lev < slot2.val then
		slot0.model:clearGuildVoyageInfo()
	elseif slot1 == true then
		slot0:requestOrderList()
	elseif slot0.model:getBaseInfo() == nil or next(slot3) == nil then
		slot0:requestOrderList()
	end
end

function GuildvoyageController.registerProtocals(slot0)
	slot0:RegisterProtocal(23800, "handle23800")
	slot0:RegisterProtocal(23801, "handle23801")
	slot0:RegisterProtocal(23802, "handle23802")
	slot0:RegisterProtocal(23803, "handle23803")
	slot0:RegisterProtocal(23806, "handle23806")
	slot0:RegisterProtocal(23807, "handle23807")
	slot0:RegisterProtocal(23808, "handle23808")
	slot0:RegisterProtocal(23809, "handle23809")
	slot0:RegisterProtocal(23810, "handle23810")
	slot0:RegisterProtocal(23811, "handle23811")
	slot0:RegisterProtocal(23812, "handle23812")
	slot0:RegisterProtocal(23813, "handle23813")
	slot0:RegisterProtocal(23814, "handle23814")
	slot0:RegisterProtocal(23815, "handle23815")
end

function GuildvoyageController.openMainWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.main_window then
			slot0.main_window:close()

			slot0.main_window = nil
		end
	else
		if slot0.role_vo == nil or slot0.role_vo.gid == 0 then
			message(TI18N("你当前还没有加入任何公会!"))

			return
		end

		if Config.GuildShippingData.data_const.guild_lev == nil then
			message(TI18N("公会远航数据异常!"))

			return
		end

		if slot0.role_vo.guild_lev < slot3.val then
			message(slot3.desc)

			return
		end

		if slot0.main_window == nil then
			slot0.main_window = GuildvoyageMainWindow.New()
		end

		slot0.main_window:open(slot2)
	end
end

function GuildvoyageController.openGuildvoyageOrderEscortWindow(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.order_escort_window then
			slot0.order_escort_window:close()

			slot0.order_escort_window = nil
		end

		slot0.cur_check_order_id = nil
	else
		if slot2 == nil or slot3 == nil then
			return
		end

		if (slot2 or GuildvoyageConst.escort_type.prepare) == GuildvoyageConst.escort_type.prepare then
			slot0.cur_check_order_id = slot3
		end

		if slot0.order_escort_window == nil then
			slot0.order_escort_window = GuildvoyageOrderEscortWindow.New(slot2)
		end

		slot0.order_escort_window:open(slot3)
	end
end

function GuildvoyageController.openChoosePartnerWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.choose_window then
			slot0.choose_window:close()

			slot0.choose_window = nil
		end
	else
		if slot0.choose_window == nil then
			slot0.choose_window = GuildvoyageChoosePartnerWindow.New()
		end

		slot0.choose_window:open(slot2)
	end
end

function GuildvoyageController.openGuildvoyageDonateWindow(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == false then
		if slot0.donate_window then
			slot0.donate_window:close()

			slot0.donate_window = nil
		end
	else
		if slot0.donate_window == nil then
			slot0.donate_window = GuildvoyageDonateWindow.New()
		end

		slot0.donate_window:open(slot2, slot3, slot4, slot5, slot6)
	end
end

function GuildvoyageController.openGuildvoyageResultWindow(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot0.result_window then
			slot0.result_window:close()

			slot0.result_window = nil
		end
	else
		if slot2 == nil then
			return
		end

		if slot0.result_window == nil then
			slot0.result_window = GuildvoyageResultWindow.New()
		end

		slot0.result_window:open(slot2, slot3, slot4)
	end
end

function GuildvoyageController.openGuildVoyageLogWindow(slot0, slot1)
	if slot1 == false then
		if slot0.log_window then
			slot0.log_window:close()

			slot0.log_window = nil
		end
	else
		if slot0.log_window == nil then
			slot0.log_window = GuildVoyageLogWindow.New()
		end

		slot0.log_window:open()
	end
end

function GuildvoyageController.requestOrderList(slot0)
	slot0:SendProtocal(23800, {})
	slot0:SendProtocal(23814, {})
	slot0:SendProtocal(23815, {})
end

function GuildvoyageController.requestEscortLeftTimes(slot0)
	slot0:SendProtocal(23815, {})
end

function GuildvoyageController.handle23800(slot0, slot1)
	slot0.model:initGuildVoyageOrderList(slot1)
end

function GuildvoyageController.requestSubmitVoyage(slot0, slot1, slot2)
	slot0:SendProtocal(23809, {
		order_id = slot1,
		is_double = slot2 or 0
	})
end

function GuildvoyageController.handle23809(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildvoyageOrderEscortWindow(false)
		slot0:openGuildvoyageChooseConfirmWindow(false)
		slot0.model:changeGuildVoyageStatus(slot1.order_id, GuildvoyageConst.status.over)
		slot0:openGuildvoyageResultWindow(true, slot1.order_id, slot1.is_success, slot1.is_double)
	end
end

function GuildvoyageController.seekHelpInGuild(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.cur_check_order_id == nil then
		return
	end

	slot0:SendProtocal(23810, {
		order_id = slot0.cur_check_order_id,
		item_bid = slot1
	})
end

function GuildvoyageController.handle23810(slot0, slot1)
	message(slot1.msg)
end

function GuildvoyageController.handle23801(slot0, slot1)
	slot0.model:updateGuildVoyageOrderList(slot1)
end

function GuildvoyageController.requestEscortOrder(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23802, {
		order_id = slot1,
		partner_ids = slot2,
		is_success = slot3
	})
end

function GuildvoyageController.handle23802(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildvoyageOrderEscortWindow(false)
	end
end

function GuildvoyageController.requestDonateTreasure(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(23808, {
		rid = slot1,
		srv_id = slot2,
		order_id = slot3,
		item_bid = slot4
	})
end

function GuildvoyageController.handle23808(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildvoyageDonateWindow(false)
	end
end

function GuildvoyageController.requestFinishOrder(slot0, slot1)
	slot0:SendProtocal(23803, {
		order_id = slot1
	})
end

function GuildvoyageController.handle23803(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0:openGuildvoyageOrderEscortWindow(false)

		if slot0.model:getOrderById(slot1.order_id) then
			slot0:openGuildvoyageChooseConfirmWindow(true, slot2)
		end
	end
end

function GuildvoyageController.requestInteractionList(slot0)
	slot0:SendProtocal(23806, {})
end

function GuildvoyageController.handle23806(slot0, slot1)
	slot0.model:updateGuildVoyageInteractionList(slot1)
end

function GuildvoyageController.requestHelpMemberOrder(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(23807, {
		rid = slot1,
		srv_id = slot2,
		order_id = slot3
	})
end

function GuildvoyageController.handle23807(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE then
		slot0.model:removeGuildVoyageInteraction(slot1)
	end
end

function GuildvoyageController.handle23811(slot0, slot1)
	slot0.model:updateVoyageInfo(slot1)
end

function GuildvoyageController.requestRefresh(slot0)
	function slot1()
		uv0:SendProtocal(23812, {})
	end

	if slot0.model:getRefreshTimes() == nil then
		slot2 = 0
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if Config.GuildShippingData.data_refresh[slot2 + 1] == nil then
		message(TI18N("当前刷新次数已到达本日上限"))
	elseif slot3.vip_lev < slot5.vip_lev then
		CommonAlert.show(string.format(TI18N("提升至<div fontcolor='#289b14'>vip%s</div>可提高<div fontcolor='#289b14'>1</div>点次数购买上限，是否前往充值提升vip等级"), slot5.vip_lev), TI18N("我要提升"), function ()
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	elseif slot5.loss_fee and slot5.loss_fee[1] then
		if slot5.loss_fee[1] == nil or #slot6 < 2 then
			return
		end

		if Config.ItemData.data_get_data(slot6[1]) then
			CommonAlert.show(string.format(TI18N("是否花费 <img src=%s visible=true scale=0.35 />%s 刷新远航订单吗？"), PathTool.getItemRes(slot7.icon), slot6[2]), TI18N("确定"), function ()
				uv0()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	end
end

function GuildvoyageController.handle23812(slot0, slot1)
	message(slot1.msg)
end

function GuildvoyageController.handle23814(slot0, slot1)
	slot0.model:updateLogInfo(slot1)
end

function GuildvoyageController.requestLogList(slot0)
	slot0:SendProtocal(23813, {})
end

function GuildvoyageController.handle23813(slot0, slot1)
	GlobalEvent:getInstance():Fire(GuildvoyageEvent.UpdateLogListEvent, slot1.list)
end

function GuildvoyageController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end

function GuildvoyageController.handle23815(slot0, slot1)
	slot0.model:setDailyTimes(slot1.time)
end

function GuildvoyageController.openGuildvoyageChooseConfirmWindow(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.choose_confirm then
			slot0.choose_confirm:close()

			slot0.choose_confirm = nil
		end
	else
		if slot0.choose_confirm == nil then
			slot0.choose_confirm = GuildvoyageChooseConfirmWindow.New()
		end

		if slot0.choose_confirm:isOpen() == false then
			slot0.choose_confirm:open(slot2)
		end
	end
end
