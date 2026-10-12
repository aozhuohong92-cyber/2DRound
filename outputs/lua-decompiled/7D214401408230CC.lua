PartnerComboCtrl = PartnerComboCtrl or BaseClass(BaseController)

function PartnerComboCtrl.config(slot0)
	slot0.model = PartnerComboModel.New(slot0)
end

function PartnerComboCtrl.getModel(slot0)
	return slot0.model
end

function PartnerComboCtrl.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():Off(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0._roleVo = RoleController:getInstance():getRoleVo()

			if uv0._roleVo ~= nil and uv0.role_assets_event == nil then
				uv0.role_assets_event = uv0._roleVo:Bind(HeroEvent.PLAYER_UPDATE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "lev" and slot1 >= 125 then
						uv0:sender18100()
					end
				end)
			end
		end)
	end
end

function PartnerComboCtrl.registerProtocals(slot0)
	slot0:RegisterProtocal(18100, "handle18100")
	slot0:RegisterProtocal(18101, "handle18101")
end

function PartnerComboCtrl.sender18100(slot0)
	slot0:SendProtocal(18100, {})
end

function PartnerComboCtrl.handle18100(slot0, slot1)
	slot0.model:updateAllData(slot1)
	GlobalEvent:getInstance():Fire(HeroEvent.PARTNER_COMBO_ACTUVATED_UPDATE)
end

function PartnerComboCtrl.sender18101(slot0, slot1, slot2)
	slot0:SendProtocal(18101, {
		gid = slot1,
		partner_lose = slot2
	})
end

function PartnerComboCtrl.handle18101(slot0, slot1)
	if slot1.code == 0 then
		message(slot1.msg)
	end

	slot0:openPartnerComboDetailView(false)
end

function PartnerComboCtrl.openPartnerComboMainView(slot0, slot1)
	if slot1 == false then
		if slot0.partner_combo_main_view ~= nil then
			slot0.partner_combo_main_view:close()

			slot0.partner_combo_main_view = nil
		end
	elseif slot0.model:checkCanShow() == true then
		if slot0.partner_combo_main_view == nil then
			slot0.partner_combo_main_view = PartnerComboMainView.New()
		end

		slot0.partner_combo_main_view:open()
	else
		message("该功能未开放！")
	end
end

function PartnerComboCtrl.openPartnerComboAttrView(slot0, slot1)
	if slot1 == true then
		if not slot0.partner_combo_attr_view then
			slot0.partner_combo_attr_view = PartnerComboAttrView.New()
		end

		slot0.partner_combo_attr_view:open()
	elseif slot0.partner_combo_attr_view then
		slot0.partner_combo_attr_view:close()

		slot0.partner_combo_attr_view = nil
	end
end

function PartnerComboCtrl.openPartnerComboDetailView(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.partner_combo_detail_view then
			slot0.partner_combo_detail_view = PartnerComboDetailView.New()
		end

		slot0.partner_combo_detail_view:open(slot2)
	elseif slot0.partner_combo_detail_view then
		slot0.partner_combo_detail_view:close()

		slot0.partner_combo_detail_view = nil
	end
end

function PartnerComboCtrl.openPartnerComboSelectView(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if not slot0.partner_combo_select_view then
			slot0.partner_combo_select_view = PartnerComboSelectView.New()
		end

		slot0.partner_combo_select_view:open(slot2, slot3, slot4)
	elseif slot0.partner_combo_select_view then
		slot0.partner_combo_select_view:close()

		slot0.partner_combo_select_view = nil
	end
end

function PartnerComboCtrl.isShowPerByStr(slot0)
	if Config.AttrData.data_type[slot0] and slot1 == 2 then
		return true
	end

	return false
end

function PartnerComboCtrl.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
