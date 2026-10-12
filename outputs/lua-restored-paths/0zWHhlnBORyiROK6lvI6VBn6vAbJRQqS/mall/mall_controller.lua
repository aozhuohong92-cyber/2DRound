MallController = MallController or BaseClass(BaseController)

function MallController.config(slot0)
	slot0.model = MallModel.New(slot0)
	slot0.dispather = GlobalEvent:getInstance()
	slot0.is_first_login = true
	slot0.temp_data = nil
end

function MallController.setFirstLogin(slot0, slot1)
	slot0.is_first_login = slot1
end

function MallController.setExchangeBuyData(slot0, slot1)
	slot0.temp_data = slot1
end

function MallController.getModel(slot0)
	return slot0.model
end

function MallController.registerEvents(slot0)
	if slot0.init_role_event == nil then
		slot0.init_role_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Top_Update_Data, function ()
			GlobalEvent:getInstance():UnBind(uv0.init_role_event)

			uv0.init_role_event = nil
			uv0.role_vo = RoleController:getInstance():getRoleVo()

			if uv0.role_vo ~= nil then
				if BattleDramaController:getInstance():getModel():getDramaData().max_dun_id and Config.CityData.data_base[1].activate[1][2] <= slot0.max_dun_id and Config.ExchangeData.data_shop_list[1].login_red and next(slot2.login_red) ~= nil then
					uv0:sender13401(1)
				end
			end
		end)
	end
end

function MallController.registerProtocals(slot0)
	slot0:RegisterProtocal(13401, "handle13401")
	slot0:RegisterProtocal(13402, "handle13402")
	slot0:RegisterProtocal(13403, "handle13403")
	slot0:RegisterProtocal(13404, "handle13404")
	slot0:RegisterProtocal(13405, "handle13405")
	slot0:RegisterProtocal(13407, "handle13407")
	slot0:RegisterProtocal(13419, "handle13419")
	slot0:RegisterProtocal(13420, "handle13420")
	slot0:RegisterProtocal(16660, "handle16660")
	slot0:RegisterProtocal(16661, "handle16661")
	slot0:RegisterProtocal(27800, "handle27800")
	slot0:RegisterProtocal(27801, "handle27801")
	slot0:RegisterProtocal(21022, "handle21022")
	slot0:RegisterProtocal(21023, "handle21023")
	slot0:RegisterProtocal(21024, "handle21024")
end

function MallController.openMallPanel(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if MainSceneController:getInstance():getBuildVo(CenterSceneBuild.shop) and slot4.is_lock then
			message(slot4.desc)

			return
		end

		slot5 = Config.ExchangeData.data_shop_list[slot2 or MallConst.MallType.GodShop]
		slot0.need_bid = slot3

		if not slot0.mall_panel then
			slot0.mall_panel = MallWindow2.New()
		end

		slot0.mall_panel:open(slot2)
	elseif slot0.mall_panel then
		slot0.mall_panel:close()

		slot0.mall_panel = nil
	else
		slot0:openScoreShopWindow(false)
	end
end

function MallController.openMallActionWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.mall_action_window then
			slot0.mall_action_window = MallActionWindow.New()
		end

		slot0.mall_action_window:open(slot2)
	elseif slot0.mall_action_window then
		slot0.mall_action_window:close()

		slot0.mall_action_window = nil
	end
end

function MallController.openMallSingleShopPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.mall_single_shop_panel then
			slot0.mall_single_shop_panel = MallSingleShopPanel.New()
		end

		slot0.mall_single_shop_panel:open(slot2)
	elseif slot0.mall_single_shop_panel then
		slot0.mall_single_shop_panel:close()

		slot0.mall_single_shop_panel = nil
	end
end

function MallController.getMallRoot(slot0)
	if slot0.mall_panel then
		return slot0.mall_panel.root_wnd
	end
end

function MallController.getNeedBid(slot0)
	return slot0.need_bid
end

function MallController.setNeedBid(slot0, slot1)
	slot0.need_bid = slot1
end

function MallController.openMallBuyWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot2 then
			if slot2.shop_type == MallConst.MallType.Recovery or slot2.shop_type == MallConst.MallType.ActionShop or slot2.shop_type == MallConst.MallType.FestivalAction or slot2.shop_type == MallConst.MallType.SuitShop or slot2.shop_type == MallConst.MallType.ActionYearMonsterExchange then
				if not slot0.mall_buy_win then
					slot0.mall_buy_win = MallBuyWindow.New()
				end

				slot0.mall_buy_win:open()
				slot0.mall_buy_win:setData(slot2)
			else
				slot3 = 0
				slot3 = (not slot2.discount or slot2.discount <= 0 or slot2.discount) and slot2.price

				print("data.pay_type---------", slot2.pay_type, slot3)

				if slot0.model:checkMoenyByType(slot2.pay_type, slot3) <= 0 then
					slot5 = nil

					if (type(slot2.pay_type) ~= "number" or Config.ItemData.data_get_data(slot2.pay_type)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot2.pay_type]) then
						if slot5.id == Config.ItemData.data_assets_label2id.gold or slot5.id == Config.ItemData.data_assets_label2id.gold then
							if FILTER_CHARGE then
								message(TI18N("钻石不足"))
							else
								CommonAlert.show(string.format(TI18N("%s不足，是否前往充值"), slot5.name), TI18N("确定"), function ()
									VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
								end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
							end
						else
							BackpackController:getInstance():openTipsSource(true, slot5)
						end
					end
				else
					if not slot0.mall_buy_win then
						slot0.mall_buy_win = MallBuyWindow.New()
					end

					slot0.mall_buy_win:open()
					slot0.mall_buy_win:setData(slot2)
				end
			end
		end
	elseif slot0.mall_buy_win then
		slot0.mall_buy_win:close()

		slot0.mall_buy_win = nil
	end
end

function MallController.openMallBuyGiftWindow(slot0, slot1, slot2)
	if slot1 == true then
		if slot2 then
			if not slot0.mall_buy_gift_win then
				slot0.mall_buy_gift_win = MallBuyGiftWindow.New()
			end

			slot0.mall_buy_gift_win:open()
			slot0.mall_buy_gift_win:setData(slot2)
		end
	else
		slot0.mall_buy_gift_win:close()

		slot0.mall_buy_gift_win = nil
	end
end

function MallController.openMallGiftPanel(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.mall_gift_panel then
			slot0.mall_gift_panel = MallGiftPanel.New()
		end

		slot0.mall_gift_panel:open(slot2)
	elseif slot0.mall_gift_panel then
		slot0.mall_gift_panel:close()

		slot0.mall_gift_panel = nil
	end
end

function MallController.sender13401(slot0, slot1)
	slot0:SendProtocal(13401, {
		type = slot1
	})
end

function MallController.handle13401(slot0, slot1)
	GlobalEvent:getInstance():Fire(MallEvent.Open_View_Event, slot1)
end

function MallController.sender13402(slot0, slot1, slot2)
	slot0:SendProtocal(13402, {
		eid = slot1,
		num = slot2
	})
end

function MallController.handle13402(slot0, slot1)
	showAssetsMsg(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(MallEvent.Buy_Success_Event, slot1)
	end
end

function MallController.sender13403(slot0, slot1)
	slot0:SendProtocal(13403, {
		type = slot1
	})
end

function MallController.handle13403(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(MallEvent.Get_Buy_list, slot1)
end

function MallController.handle13404(slot0, slot1)
end

function MallController.sender13405(slot0, slot1)
	slot0:SendProtocal(13405, {
		type = slot1
	})
end

function MallController.handle13405(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(MallEvent.Get_Buy_list, slot1)
	end
end

function MallController.sender13407(slot0, slot1, slot2, slot3, slot4)
	slot0:SendProtocal(13407, {
		order = slot1,
		type = slot2,
		buy_type = slot3,
		num = slot4 or 1
	})
end

function MallController.handle13407(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(MallEvent.Buy_One_Success, slot1)
	end
end

function MallController.send13419(slot0, slot1)
	slot0:SendProtocal(13419, {
		num = slot1
	})
end

function MallController.handle13419(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 and slot0.temp_data then
		slot0:sender13407(slot0.temp_data.order, slot0.temp_data.shop_type, 1)

		slot0.temp_data = nil
	end
end

function MallController.send16660(slot0)
	slot0:SendProtocal(16660, {})
end

function MallController.handle16660(slot0, slot1)
	message(slot1.msg)
	GlobalEvent:getInstance():Fire(MallEvent.Update_Action_event, slot1)
end

function MallController.send16661(slot0, slot1, slot2, slot3)
	slot0:SendProtocal(16661, {
		bid = slot1,
		aim = slot2,
		num = slot3
	})
end

function MallController.handle16661(slot0, slot1)
	message(slot1.msg)

	if slot1.code == 1 then
		GlobalEvent:getInstance():Fire(MallEvent.Buy_Action_Shop_Success_event, slot1)
	end
end

function MallController.sender27800(slot0)
	slot0:SendProtocal(27800, {})
end

function MallController.handle27800(slot0, slot1)
	GlobalEvent:getInstance():Fire(MallEvent.Get_Chose_Shop_Data_Event, slot1)
end

function MallController.sender27801(slot0, slot1)
	slot0:SendProtocal(27801, {
		package_id = slot1
	})
end

function MallController.handle27801(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function MallController.sender21022(slot0)
	slot0:SendProtocal(21022, {})
end

function MallController.handle21022(slot0, slot1)
	GlobalEvent:getInstance():Fire(MallEvent.Get_Open_Charge_Shop_Event, slot1)
end

function MallController.sender21023(slot0, slot1)
	slot0:SendProtocal(21023, {
		package_id = slot1
	})
end

function MallController.handle21023(slot0, slot1)
	if slot1.msg then
		message(slot1.msg)
	end
end

function MallController.handle21024(slot0, slot1)
	slot2 = false
	slot3 = false
	slot4 = false
	slot5 = false

	for slot9, slot10 in pairs(slot1.list) do
		if slot10.id == 1 then
			slot3 = true
		elseif slot10.id == 2 then
			slot4 = true
		elseif slot10.id == 3 then
			slot5 = true
		elseif slot10.id == 4 then
			slot2 = true
		end
	end

	MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.variety, slot2)
end

function MallController.openVarietyStoreWindows(slot0, slot1)
	if slot1 == true then
		if slot0.variety_store_view == nil then
			slot0.variety_store_view = VarietyStoreWindows.New()
		end

		if slot0.variety_store_view:isOpen() == false then
			slot0.variety_store_view:open()
		end
	elseif slot0.variety_store_view then
		slot0.variety_store_view:close()

		slot0.variety_store_view = nil
	end
end

function MallController.getVarietyStoreRoot(slot0)
	if slot0.variety_store_view then
		return slot0.variety_store_view.root_wnd
	end
end

function MallController.handle13420(slot0, slot1)
	GlobalEvent:getInstance():Fire(MallEvent.Free_Refresh_Data, slot1)
end

function MallController.openSkinShopWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.skin_shop_wnd then
			slot0.skin_shop_wnd = SkinShopWindow.New()
		end

		if slot0.skin_shop_wnd:isOpen() == false then
			slot0.skin_shop_wnd:open()
		end
	elseif slot0.skin_shop_wnd then
		slot0.skin_shop_wnd:close()

		slot0.skin_shop_wnd = nil
	end
end

function MallController.openPlumeShopWindow(slot0, slot1)
	if slot1 == true then
		if not slot0.plume_shop_wnd then
			slot0.plume_shop_wnd = PlumeShopWindow.New()
		end

		if slot0.plume_shop_wnd:isOpen() == false then
			slot0.plume_shop_wnd:open()
		end
	elseif slot0.plume_shop_wnd then
		slot0.plume_shop_wnd:close()

		slot0.plume_shop_wnd = nil
	end
end

function MallController.openScoreShopWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.score_shop_wnd then
			slot0.score_shop_wnd = ScoreShopWindow.New()
		end

		if slot0.score_shop_wnd:isOpen() == false then
			slot0.score_shop_wnd:open(slot2)
		end
	elseif slot0.score_shop_wnd then
		slot0.score_shop_wnd:close()

		slot0.score_shop_wnd = nil
	end
end

function MallController.openChargeShopWindow(slot0, slot1, slot2)
	VipController:getInstance():openVipMainWindow(slot1, VIPTABCONST.CHARGE)
end

function MallController.openChargeSureWindow(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.charge_sure_wnd then
			slot0.charge_sure_wnd = ChargeSureWindow.New()
		end

		if slot0.charge_sure_wnd:isOpen() == false then
			slot0.charge_sure_wnd:open(slot2)
		end
	elseif slot0.charge_sure_wnd then
		slot0.charge_sure_wnd:close()

		slot0.charge_sure_wnd = nil
	end
end

function MallController.__delete(slot0)
	if slot0.model ~= nil then
		slot0.model:DeleteMe()

		slot0.model = nil
	end
end
