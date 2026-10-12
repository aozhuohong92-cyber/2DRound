AuguryAlertWindow = AuguryAlertWindow or BaseClass(BaseView)

function AuguryAlertWindow.__init(slot0, slot1)
	slot0.ctrl = AuguryController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "augury/augury_alert_window"
	slot0.cur_type = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("augury", "augury"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Mini
	slot0.open_type = slot1 or 1
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function AuguryAlertWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel:getChildByName("line"):setVisible(false)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.confirm_btn = slot0.main_panel:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("确定"))
	UITool.SetTitleColor(slot0.confirm_btn:getChildByName("label"))

	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))

	if slot0.open_type == 1 then
		slot0:createGoodsCall()
	elseif slot0.open_type == 2 then
		slot0:createGoldsCall()
	elseif slot0.open_type == 3 then
		slot0:createFlashPanel()
	end
end

function AuguryAlertWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openAlertWidnow(false)
		end
	end)
	slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openAlertWidnow(false)
		end
	end)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.open_type == 1 then
				uv0.ctrl:sender11331(1, 1)
			elseif uv0.open_type == 2 then
				uv0.ctrl:sender11331(1, 10)
			elseif uv0.open_type == 3 then
				uv0.ctrl:sender11332()
			end

			uv0.ctrl:openAlertWidnow(false)
		end
	end)
end

function AuguryAlertWindow.createGoodsCall(slot0)
	slot0.desc_label = createRichLabel(28, Config.ColorData.data_color4[175], cc.p(0.5, 1), cc.p(slot0.main_panel:getContentSize().width / 2, 330), 0, 0, 500)

	slot0.main_panel:addChild(slot0.desc_label)

	slot0.have_label = createLabel(28, Config.ColorData.data_color4[175], nil, 130, 130, TI18N("拥有"), slot0.main_panel, 0, cc.p(0, 0))
	slot2 = PathTool.getResFrame("common", "common_90003")
	slot3 = createImage(slot0.main_panel, slot2, 300, 130, cc.p(0.5, 0), true, 0, true)

	slot3:setCapInsets(cc.rect(20, 15, 1, 1))
	slot3:setContentSize(cc.size(177, 33))

	slot0.asset_icon = createImage(slot0.main_panel, slot2, 230, 130, cc.p(0.5, 0), false, 0, false)
	slot0.asset_num = createLabel(28, Config.ColorData.data_color4[175], nil, 310, 130, "0", slot0.main_panel, 0, cc.p(0.5, 0))

	createLabel(28, Config.ColorData.data_color4[175], nil, 129, 170, "0", slot0.main_panel, 0, cc.p(0, 0)):setString(TI18N("每日05:00刷新免费单抽次数"))

	if not Config.StarDivinationData.data_divination_const then
		return
	end

	if not slot5.divine_change.val then
		return
	end

	slot7 = 0
	slot8 = ""

	if Config.ItemData.data_get_data(slot6[1]) then
		slot0.asset_icon:loadTexture(PathTool.getItemRes(slot9.icon), LOADTEXT_TYPE)
		slot0.asset_icon:setScale(0.4)

		if not slot0.role_vo then
			return
		end

		slot12 = slot0.role_vo[Config.ItemData.data_assets_id2label[slot6[1]] or ""] or 0

		if slot6[1] == 15 then
			slot12 = slot0.role_vo.gold + slot0.role_vo.red_gold
		end

		slot0.asset_num:setString(slot12)

		slot8 = slot10
		slot7 = slot6[2] or 0
	end

	if not slot5.divine_buy.val then
		return
	end

	if Config.ItemData.data_get_data(slot10[1]) then
		slot12 = PathTool.getItemRes(slot11.icon)

		slot0.desc_label:setString(string.format(TI18N("是否消耗<img src='%s' scale=0.4 />%s购买%s星灵积分？\n(同时附赠1次命格抽取)"), slot8, slot7, slot10[2]))
	end
end

function AuguryAlertWindow.createGoldsCall(slot0)
	slot0.desc_label = createRichLabel(28, Config.ColorData.data_color4[175], cc.p(0.5, 1), cc.p(slot0.main_panel:getContentSize().width / 2, 330), 0, 0, 500)

	slot0.main_panel:addChild(slot0.desc_label)

	slot0.have_label = createLabel(28, Config.ColorData.data_color4[175], nil, 130, 130, TI18N("拥有"), slot0.main_panel, 0, cc.p(0, 0))
	slot2 = PathTool.getResFrame("common", "common_90003")
	slot3 = createImage(slot0.main_panel, slot2, 300, 130, cc.p(0.5, 0), true, 0, true)

	slot3:setCapInsets(cc.rect(20, 15, 1, 1))
	slot3:setContentSize(cc.size(177, 33))

	slot0.asset_icon = createImage(slot0.main_panel, slot2, 230, 130, cc.p(0.5, 0), false, 0, false)
	slot0.asset_num = createLabel(28, Config.ColorData.data_color4[175], nil, 310, 130, "0", slot0.main_panel, 0, cc.p(0.5, 0))

	if not Config.StarDivinationData.data_divination_const then
		return
	end

	if not slot4.divine_change10.val then
		return
	end

	slot6 = 0
	slot7 = ""

	if Config.ItemData.data_get_data(slot5[1]) then
		slot0.asset_icon:loadTexture(PathTool.getItemRes(slot8.icon), LOADTEXT_TYPE)
		slot0.asset_icon:setScale(0.4)

		if not slot0.role_vo then
			return
		end

		slot11 = slot0.role_vo[Config.ItemData.data_assets_id2label[slot5[1]] or ""] or 0

		if slot5[1] == 15 then
			slot11 = slot0.role_vo.gold + slot0.role_vo.red_gold
		end

		slot0.asset_num:setString(slot11)

		slot7 = slot9
		slot6 = slot5[2] or 0
	end

	if not slot4.divine_buy10.val then
		return
	end

	if Config.ItemData.data_get_data(slot9[1]) then
		slot11 = PathTool.getItemRes(slot10.icon)

		slot0.desc_label:setString(string.format(TI18N("是否消耗<img src='%s' scale=0.4 />%s购买%s星灵积分？\n(同时附赠10次命格抽取)"), slot7, slot6, slot9[2]))
	end
end

function AuguryAlertWindow.createFlashPanel(slot0)
	slot0.desc_label = createRichLabel(28, Config.ColorData.data_color4[175], cc.p(0.5, 1), cc.p(slot0.main_panel:getContentSize().width / 2, 330), 0, 0, 500)

	slot0.main_panel:addChild(slot0.desc_label)

	slot0.free_label = createRichLabel(26, Config.ColorData.data_color4[186], cc.p(0, 1), cc.p(135, 240), 0, 0, 500)

	slot0.main_panel:addChild(slot0.free_label)
	slot0.free_label:setString(TI18N("注：每日05:00将自动刷新运势"))

	if not Config.StarDivinationData.data_divination_flash then
		return
	end

	if not slot2[math.min((slot0.ctrl:getModel():getFlashCount() or 0) + 1, Config.StarDivinationData.data_divination_flash_length or 0)] then
		return
	end

	if not slot2[slot3].expend[1] then
		return
	end

	if Config.ItemData.data_get_data(slot5[1]) then
		slot0.desc_label:setString(string.format(TI18N("是否消耗<img src='%s' scale=0.4 />%s来刷新运势？"), PathTool.getItemRes(slot6.icon), slot5[2]))
	end
end

function AuguryAlertWindow.openRootWnd(slot0, slot1)
end

function AuguryAlertWindow.setPanelData(slot0)
end

function AuguryAlertWindow.close_callback(slot0)
	slot0.ctrl:openAlertWidnow(false)
end
