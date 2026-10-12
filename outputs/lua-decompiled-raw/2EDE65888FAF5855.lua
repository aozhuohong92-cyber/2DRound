SeerpalaceController = SeerpalaceController or BaseClass(BaseController)

function SeerpalaceController.config(slot0)
	slot0.model = SeerpalaceModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
end

function SeerpalaceController.getModel(slot0)
	return slot0.model
end

function SeerpalaceController.registerEvents(slot0)
end

function SeerpalaceController.registerProtocals(slot0)
	slot0:RegisterProtocal(23213, "handle23213")
	slot0:RegisterProtocal(23214, "handle23214")
	slot0:RegisterProtocal(23215, "handle23215")
	slot0:RegisterProtocal(23235, "handle23235")
end

function SeerpalaceController.requestSeerpalaceSummon(slot0, slot1)
	slot0:SendProtocal(23213, {
		group_id = slot1
	})
end

function SeerpalaceController.handle23213(slot0, slot1)
	if slot1 then
		slot0.model:setLastSummonGroupId(slot1.group_id)

		slot2 = {
			[slot6] = {}
		}

		for slot6, slot7 in ipairs(slot1.rewards or {}) do
			slot2[slot6].bid = slot7.base_id
			slot2[slot6].num = slot7.num
		end

		MainuiController:getInstance():openGetItemView(true, slot2, 0, {
			is_backpack = true
		}, MainuiConst.item_open_type.seerpalace)
	end
end

function SeerpalaceController.requestSeerpalaceChangeInfo(slot0)
	slot0:SendProtocal(23214, {})
end

function SeerpalaceController.handle23214(slot0, slot1)
	slot0.model:setChangePartnerId(slot1.partner_id)
	GlobalEvent:getInstance():Fire(SeerpalaceEvent.Change_Role_Info_Event, slot1)
end

function SeerpalaceController.requestSeerpalaceChangeRole(slot0, slot1, slot2)
	slot3 = {
		partner_id = slot1,
		action = slot2
	}

	if slot2 and slot2 == 1 then
		slot0.model:setChangeFlag(true)
	end

	slot0:SendProtocal(23215, slot3)
end

function SeerpalaceController.handle23215(slot0, slot1)
	message(slot1.msg)

	if slot1.code == TRUE and slot0.model:getChangeFlag() then
		GlobalEvent:getInstance():Fire(SeerpalaceEvent.Change_Role_Success)
		slot0.model:setChangeFlag(false)
	end
end

function SeerpalaceController.requestSummonOpen(slot0)
	slot0:SendProtocal(23234, {})
end

function SeerpalaceController.handle23235(slot0, slot1)
	if slot1 and slot1.flag then
		slot0.model:setFirstOpen(slot1.flag == 0)
		slot0.model:updateScoreSummonRed()
	end

	slot0.role_vo = RoleController:getInstance():getRoleVo()

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "predict_point" and uv0.label then
				uv0.model:updateScoreSummonRed()
			elseif slot0 == "vip_lev" then
				uv0.model:updateScoreSummonRed()
			end
		end)
	end
end

function SeerpalaceController.openSeerpalaceMainWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0:checkSeerpalaceIsOpen() then
			return
		end

		if slot0.seerpalace_main_window == nil then
			slot0.seerpalace_main_window = SeerpalaceMainWindow.New()
		end

		if slot0.seerpalace_main_window:isOpen() == false then
			slot0.seerpalace_main_window:open(slot2)
		end
	elseif slot0.seerpalace_main_window then
		slot0.seerpalace_main_window:close()

		slot0.seerpalace_main_window = nil
	end
end

function SeerpalaceController.openSeerpalaceSummonScoreWindow(slot0, slot1)
	if slot1 == true then
		if slot0.seerpalace_score_window == nil then
			slot0.seerpalace_score_window = SeerpalaceSummonScoreWindow.New()
		end

		if slot0.seerpalace_score_window:isOpen() == false then
			slot0.seerpalace_score_window:open(index)
		end
	elseif slot0.seerpalace_score_window then
		slot0.seerpalace_score_window:close()

		slot0.seerpalace_score_window = nil
	end
end

function SeerpalaceController.getSeerpalaceMainRoot(slot0)
	if slot0.seerpalace_main_window then
		return slot0.seerpalace_main_window.root_wnd
	end
end

function SeerpalaceController.openSeerpalaceShopWindow(slot0, slot1)
	if slot1 == true then
		if slot0.seerpalace_shop_window == nil then
			slot0.seerpalace_shop_window = SeerpalaceShopWindow.New()
		end

		if slot0.seerpalace_shop_window:isOpen() == false then
			slot0.seerpalace_shop_window:open()
		end
	elseif slot0.seerpalace_shop_window then
		slot0.seerpalace_shop_window:close()

		slot0.seerpalace_shop_window = nil
	end
end

function SeerpalaceController.openSeerpalacePreviewWindow(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.seerpalace_preview == nil then
			slot0.seerpalace_preview = SeerpalacePreviewWindow.New(slot3)
		end

		if slot0.seerpalace_preview:isOpen() == false then
			slot0.seerpalace_preview:open(slot2)
		end
	elseif slot0.seerpalace_preview then
		slot0.seerpalace_preview:close()

		slot0.seerpalace_preview = nil
	end
end

function SeerpalaceController.checkSeerpalaceIsOpen(slot0, slot1)
	slot2 = false

	if Config.RecruitHighData.data_seerpalace_const.common_limit and slot4.val <= RoleController:getInstance():getRoleVo().lev then
		slot2 = true
	else
		slot2 = false

		if not slot1 then
			message(string.format(TI18N("%d级开启伟大召唤处"), slot4.val))
		end
	end

	return slot2
end

function SeerpalaceController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
