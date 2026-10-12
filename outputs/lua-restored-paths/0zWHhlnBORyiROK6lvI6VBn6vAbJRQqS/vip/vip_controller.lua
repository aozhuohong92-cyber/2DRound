VipController = VipController or BaseClass(BaseController)
VIPTABCONST = {
	CHARGE = 1,
	ACC_CHARGE = 2,
	VIP = 3,
	KLB = 6,
	DAILY_GIFT = 4,
	PRIVILEGE = 5
}
VIPREDPOINT = {
	VIP_TAB = 2,
	DAILY_AWARD = 3,
	MONTH_CARD = 1,
	PRIVILEGE = 4
}

function VipController.config(slot0)
	slot0.model = VipModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.vip_redpoint_status = {}
	slot0.vip_privilege_redpoint = {}
	slot0.is_first = true
	slot0.gift_red_list = {}
end

function VipController.setPrivilegeRedpoint(slot0, slot1, slot2)
	slot0.vip_privilege_redpoint[slot1] = slot2
end

function VipController.getPrivilegeRedpoint(slot0, slot1)
	return slot0.vip_privilege_redpoint[slot1]
end

function VipController.getIsFirst(slot0)
	if MainuiController:getInstance():checkIsOpenByActivate(Config.FunctionData.data_info[10].activate) == false then
		return false
	end

	slot5 = false

	for slot9, slot10 in pairs(Config.VipData.data_get_reward) do
		if slot0.model:getVIPIsBuyStatus(slot10.lev) == nil and slot10.lev <= RoleController:getInstance():getRoleVo().vip_lev then
			slot5 = true

			break
		end
	end

	if slot5 == true and slot0.is_first then
		return slot0.is_first
	end

	return false
end

function VipController.setIsFirst(slot0, slot1)
	slot0.is_first = slot1
end

function VipController.getModel(slot0)
	return slot0.model
end

function VipController.registerEvents(slot0)
	if slot0.login_event_success == nil then
		slot0.login_event_success = slot0.dispather:Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.login_event_success)

			uv0.login_event_success = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()
		end)
	end
end

function VipController.registerProtocals(slot0)
	slot0:RegisterProtocal(16700, "handle16700")
	slot0:RegisterProtocal(16710, "handle16710")
	slot0:RegisterProtocal(16711, "handle16711")
	slot0:RegisterProtocal(16712, "handle16712")
	slot0:RegisterProtocal(16713, "handle16713")
	slot0:RegisterProtocal(21005, "handle21005")
	slot0:RegisterProtocal(21006, "handle21006")
	slot0:RegisterProtocal(24501, "handle24501")
	slot0:RegisterProtocal(24502, "handle24502")
	slot0:RegisterProtocal(16707, "handle16707")
	slot0:RegisterProtocal(16708, "handle16708")
	slot0:RegisterProtocal(21035, "handle21035")
end

function VipController.changeVipFuncionIcon(slot0)
end

function VipController.changeFirstRechargeStatus(slot0, slot1)
end

function VipController.sender21035(slot0, slot1)
	print(slot1)
	slot0:SendProtocal(21035, {
		package_id = slot1
	})
end

function VipController.handle21035(slot0, slot1)
	if slot1 then
		print(json.encode(slot1))
	end
end

function VipController.sender16700(slot0)
	slot0:SendProtocal(16700, {})
end

function VipController.handle16700(slot0, slot1)
	slot0.dispather:Fire(VipEvent.UPDATE_CHARGE_LIST, slot1.list)
end

function VipController.sender21005(slot0)
	slot0:SendProtocal(21005, {})
end

function VipController.handle21005(slot0, slot1)
	slot0.dispather:Fire(VipEvent.THREE_RECHARGE, slot1)
end

function VipController.sender21006(slot0)
	slot0:SendProtocal(21006, {})
end

function VipController.handle21006(slot0, slot1)
	if slot1 then
		slot0.model:setDailyGiftData(slot1.first_gift)
		slot0.dispather:Fire(VipEvent.DAILY_GIFT_INFO)
	end
end

function VipController.sender24501(slot0, slot1)
	slot0:SendProtocal(24501, {
		id = slot1
	})
end

function VipController.handle24501(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function VipController.sender24502(slot0)
	slot0:SendProtocal(24502, {})
end

function VipController.handle24502(slot0, slot1)
	if slot1 then
		slot0.model:setPrivilegeList(slot1.list)
		slot0:setTipsGiftStatus(VIPREDPOINT.PRIVILEGE, slot0.model:getPrivilegeRedStatus())
		slot0.dispather:Fire(VipEvent.PRIVILEGE_INFO)
	end
end

function VipController.sender16707(slot0)
	slot0:SendProtocal(16707, {})
end

function VipController.handle16707(slot0, slot1)
	slot2 = false

	if slot1.status == 1 then
		slot2 = true
	end

	slot0.model:setMonthCard(slot1.status)
	slot0:setTipsGiftStatus(VIPREDPOINT.MONTH_CARD, slot2)
	slot0.dispather:Fire(VipEvent.SUPRE_CARD_GET, slot1.status)
end

function VipController.sender16708(slot0)
	slot0:SendProtocal(16708, {})
end

function VipController.handle16708(slot0, slot1)
	message(slot1.msg)
end

function VipController.sender16710(slot0)
	slot0:SendProtocal(16710, {})
end

function VipController.handle16710(slot0, slot1)
	slot0.model:setGetGiftList(slot1.list)

	if slot0.role_vo and slot0.role_vo.vip_lev ~= 0 then
		slot0:changeVipFuncionIcon()
	end

	slot2 = slot0.model:getGetGiftList()
	slot3 = false

	if slot0.role_vo and slot2 then
		slot3 = slot2[slot0.role_vo.vip_lev]
	end

	slot0:setTipsGiftStatus(VIPREDPOINT.VIP_TAB, slot3 == nil and slot0:getIsFirst())
	slot0.dispather:Fire(VipEvent.UPDATA_ITEM_REDPOINT)
end

function VipController.setTipsVIPStstus(slot0, slot1, slot2)
	slot0.vip_redpoint_status[slot1] = slot2
	slot3 = false

	for slot7, slot8 in pairs(slot0.vip_redpoint_status) do
		if slot8 == true then
			slot3 = true

			break
		end
	end

	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.charge, slot3)
end

function VipController.setTipsGiftStatus(slot0, slot1, slot2)
	slot0.gift_red_list[slot1] = slot2

	slot0.dispather:Fire(VipEvent.Update_Gift_Red_state)
	Area_sceneController:getInstance():setBuildRedStatus(3, {
		{
			bid = slot1,
			status = slot2
		}
	})
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.charge, slot0:getGiftRedStatus())
end

function VipController.getGiftRedStatusById(slot0, slot1)
	return slot0.gift_red_list[slot1]
end

function VipController.getVipRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.gift_red_list) do
		if (slot5 == VIPREDPOINT.VIP_TAB or slot5 == VIPREDPOINT.MONTH_CARD) and slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function VipController.getGiftRedStatus(slot0)
	slot1 = false

	for slot5, slot6 in pairs(slot0.gift_red_list) do
		if slot6 == true then
			slot1 = true

			break
		end
	end

	return slot1
end

function VipController.getVipRedData(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(VIPREDPOINT) do
		table.insert(slot1, {
			bid = slot6,
			status = slot0:getGiftRedStatusById(slot6)
		})
	end

	return slot1
end

function VipController.sender16711(slot0, slot1)
	slot0:SendProtocal(16711, {
		lev = slot1
	})
end

function VipController.handle16711(slot0, slot1)
	message(slot1.msg)
end

function VipController.sender16712(slot0)
	slot0:SendProtocal(16712, {})
end

function VipController.handle16712(slot0, slot1)
	slot0.charge_sum = slot1.charge_sum

	slot0.model:setAccList(slot1.list)
	slot0.dispather:Fire(VipEvent.ACC_RECHARGE_INFO, slot1)
end

function VipController.getChargeSum(slot0)
	return slot0.charge_sum or 0
end

function VipController.sender16713(slot0, slot1)
	slot0:SendProtocal(16713, {
		id = slot1
	})
end

function VipController.handle16713(slot0, slot1)
	message(slot1.msg)
end

function VipController.openVipMainWindow(slot0, slot1, slot2, slot3)
	if slot1 then
		if FILTER_CHARGE == true then
			message(TI18N("功能暂未开放，敬请期待"))

			return
		end

		if Config.ChargeData.data_constant.open_lv and slot0.role_vo and slot0.role_vo.lev < slot4.val then
			message(slot4.desc)

			return
		end

		if not slot0.vip_window then
			slot0.vip_window = VipMainWindow.New()
		end

		if slot0.vip_window and slot0.vip_window:isOpen() == false then
			slot0.vip_window:open(slot2 or 1, slot3)
		end
	elseif slot0.vip_window then
		slot0.vip_window:close()

		slot0.vip_window = nil
	end
end

function VipController.getVIPIsOpen(slot0)
	slot1 = false

	if slot0.vip_window then
		slot1 = slot0.vip_window:isOpen()
	end

	return slot1
end

function VipController.jumpChangeTabView(slot0, slot1)
	if slot0.vip_window then
		slot0.vip_window:changeTabView(VIPTABCONST.VIP)
	end
end

function VipController.changeMainWindowTab(slot0, slot1)
	if slot0.vip_window then
		slot0.vip_window:changeTabView(VIPTABCONST.VIP)
	end
end

function VipController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
