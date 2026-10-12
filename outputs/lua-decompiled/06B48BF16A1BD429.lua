FruitTreasureController = FruitTreasureController or BaseClass(BaseController)

function FruitTreasureController.config(slot0)
	slot0.model = FruitTreasureModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.upgrade_lev_cost_id = 72005
end

function FruitTreasureController.getModel(slot0)
	return slot0.model
end

function FruitTreasureController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if not uv0.role_lev_event and uv0.role_vo then
				uv0.role_lev_event = uv0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
					if slot0 == "coin" then
						uv0.model:checkFruitTreasureRedStatus()
					end
				end)
			end
		end)
	end

	if not slot0.add_goods_event then
		slot0.add_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 == BackPackConst.Bag_Code.BACKPACK then
				slot2 = false

				for slot6, slot7 in pairs(slot1) do
					if slot7.base_id == uv0.model.upgrade_lev_cost_id then
						slot2 = true
					end

					if slot7.config and slot7.config.type == BackPackConst.item_type.Fruit_Treasure then
						slot2 = true
					end

					if slot7.config and slot7.config.type == BackPackConst.item_type.HERO_HUN then
						slot2 = true
					end
				end

				if slot2 and uv0.model.checkFruitTreasureRedStatus then
					uv0.model:checkFruitTreasureRedStatus()
				end
			end
		end)
	end

	if slot0.hero_data_add_event == nil then
		slot0.hero_data_add_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Data_Add, function ()
			uv0.model:checkFruitTreasureRedStatus()
		end)
	end

	if slot0.login_success == nil then
		slot0.login_success = slot0.dispather:Bind(EventId.ROLE_CREATE_SUCCESS, function ()
			uv0:send29604()
			GlobalTimeTicket:getInstance():add(function ()
				uv0.model:checkFruitTreasureRedStatus()
			end, 1, 1)
		end)
	end
end

function FruitTreasureController.requestInitProtocal(slot0)
end

function FruitTreasureController.registerProtocals(slot0)
	slot0:RegisterProtocal(29600, "handle29600")
	slot0:RegisterProtocal(29601, "handle29601")
	slot0:RegisterProtocal(29602, "handle29602")
	slot0:RegisterProtocal(29603, "handle29603")
	slot0:RegisterProtocal(29604, "handle29604")
	slot0:RegisterProtocal(29605, "handle29605")
	slot0:RegisterProtocal(29606, "handle29606")
	slot0:RegisterProtocal(29607, "handle29607")
	slot0:RegisterProtocal(29608, "handle29608")
	slot0:RegisterProtocal(29609, "handle29609")
	slot0:RegisterProtocal(29620, "handle29620")
	slot0:RegisterProtocal(29621, "handle29621")
	slot0:RegisterProtocal(29622, "handle29622")
end

function FruitTreasureController.send29600(slot0, slot1)
	slot0:SendProtocal(29600, {
		id = slot1 or 0
	})
end

function FruitTreasureController.send29604(slot0)
	slot0:SendProtocal(29604, {})
end

function FruitTreasureController.handle29600(slot0, slot1)
	slot0.model:checkFruitTreasureRedStatus()
end

function FruitTreasureController.handle29601(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function FruitTreasureController.send29601(slot0, slot1)
	slot0:SendProtocal(29601, {
		id = slot1 or 0
	})
end

function FruitTreasureController.handle29602(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function FruitTreasureController.send29602(slot0, slot1, slot2)
	slot0:SendProtocal(29602, {
		id = slot1 or 0,
		cost_partners = slot2 or {}
	})
end

function FruitTreasureController.handle29603(slot0, slot1)
	if slot1.flag == TRUE then
		-- Nothing
	end
end

function FruitTreasureController.handle29604(slot0, slot1)
	if slot1.list then
		for slot5, slot6 in pairs(slot1.list) do
			slot0.model:setItemInfo(slot6)
		end
	end

	slot0.model:checkFruitTreasureRedStatus()
end

function FruitTreasureController.handle29605(slot0, slot1)
	GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasureLv, slot1)
end

function FruitTreasureController.send29605(slot0, slot1)
	slot0:SendProtocal(29605, {
		id = slot1 or 0
	})
end

function FruitTreasureController.handle29606(slot0, slot1)
	GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasureStar, slot1)
end

function FruitTreasureController.send29606(slot0, slot1)
	slot0:SendProtocal(29606, {
		id = slot1 or 0
	})
end

function FruitTreasureController.handle29607(slot0, slot1)
	if slot1.power then
		GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasureAttrs, slot1)
	end
end

function FruitTreasureController.send29607(slot0)
	slot0:SendProtocal(29607, {})
end

function FruitTreasureController.send29608(slot0, slot1, slot2)
	slot0:SendProtocal(29608, {
		id = slot1 or 0
	})

	if slot2 then
		slot0.cb29608 = slot2
	end
end

function FruitTreasureController.handle29608(slot0, slot1)
	if slot1.lev > 0 then
		slot0.model:setItemInfo(slot1)
		GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasureAll, slot1)

		if slot0.cb29608 then
			slot0.cb29608()

			slot0.cb29608 = null
		end
	end
end

function FruitTreasureController.send29609(slot0, slot1, slot2)
	slot0:SendProtocal(29609, {
		rid = slot1,
		srv_id = slot2
	})
end

function FruitTreasureController.handle29609(slot0, slot1)
	if slot1.list then
		slot0.model:initOtherList(slot1.list)
		GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasureOther)
	end
end

function FruitTreasureController.__delete(slot0)
end

function FruitTreasureController.openFruitTreasureChipBagView(slot0, slot1)
	if slot1 == true then
		if not slot0.fruit_chip_bag_window then
			slot0.fruit_chip_bag_window = FruitTreasureChipBagView.New()
		end

		if slot0.fruit_chip_bag_window:isOpen() == false then
			slot0.fruit_chip_bag_window:open()
		end
	elseif slot0.fruit_chip_bag_window then
		slot0.fruit_chip_bag_window:close()

		slot0.fruit_chip_bag_window = nil
	end
end

function FruitTreasureController.openFruitTreasureCultivateView(slot0, slot1)
	if slot1 == true then
		if not slot0.fruit_cultivate_window then
			slot0.fruit_cultivate_window = FruitTreasureCultivateView.New()
		end

		if slot0.fruit_cultivate_window:isOpen() == false then
			slot0.fruit_cultivate_window:open()
		end
	elseif slot0.fruit_cultivate_window then
		slot0.fruit_cultivate_window:close()

		slot0.fruit_cultivate_window = nil
	end
end

function FruitTreasureController.setFruitTreasureCultivateData(slot0, slot1, slot2)
	slot0.cultivateData = slot1
	slot0.cultivateType = slot2
end

function FruitTreasureController.openMainView(slot0, slot1)
	message("弟阿勇")

	if slot1 == false then
		if slot0.fruit_main_window ~= nil then
			slot0.fruit_main_window:close()

			slot0.fruit_main_window = nil
		end
	else
		if not slot0.fruit_main_window then
			slot0.fruit_main_window = FruitTreasureMainView.New()
		end

		if slot0.fruit_main_window and slot0.fruit_main_window:isOpen() == false then
			slot0.fruit_main_window:open()
		end
	end
end

function FruitTreasureController.openPropTips(slot0, slot1)
	if slot1 == false then
		if slot0.fruit_Prop_window ~= nil then
			slot0.fruit_Prop_window:close()

			slot0.fruit_Prop_window = nil
		end
	else
		if not slot0.fruit_Prop_window then
			slot0.fruit_Prop_window = FruitTreasurePropTips.New()
		end

		if slot0.fruit_Prop_window and slot0.fruit_Prop_window:isOpen() == false then
			slot0.fruit_Prop_window:open()
		end
	end
end

function FruitTreasureController.OpenFruitTreasurePassView(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.battle_pass_view ~= nil then
			slot0.battle_pass_view:close()

			slot0.battle_pass_view = nil
		end
	else
		if slot0.battle_pass_view == nil then
			slot0.battle_pass_view = FruitTreasurePassView.New()
		end

		if slot0.battle_pass_view and slot0.battle_pass_view:isOpen() == false then
			slot0.battle_pass_view:open(slot2)
		end
	end
end

function FruitTreasureController.sender29620(slot0)
	slot0:SendProtocal(29620, {})
end

function FruitTreasureController.handle29620(slot0, slot1)
	slot0.model:SetBattlePassInfo(slot1)

	slot2 = slot0.model:CheckBattlePassRedState()

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.fruit, slot2)
	GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasurePassRed, slot2)
	GlobalEvent:getInstance():Fire(FruitTreasureEvent.UpdateFruitTreasurePass, slot1)
	slot0.model:checkMainRed()
end

function FruitTreasureController.sender29621(slot0)
	slot0:SendProtocal(29621, {})
end

function FruitTreasureController.handle29621(slot0, slot1)
	if slot1.code ~= TRUE then
		message(slot1.msg)

		return
	end
end

function FruitTreasureController.sender29622(slot0, slot1)
	slot0:SendProtocal(29622, {
		reward_id = slot1
	})
end

function FruitTreasureController.handle29622(slot0, slot1)
	if slot1.code ~= TRUE then
		message(slot1.msg)

		return
	end
end
