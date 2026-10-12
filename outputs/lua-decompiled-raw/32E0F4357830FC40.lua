BackPackSellHolyWindow = BackPackSellHolyWindow or BaseClass(BaseView)
slot1 = BackpackController:getInstance():getModel()
slot2 = table.insert

function BackPackSellHolyWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "backpack/backpack_sell_holy"
end

function BackPackSellHolyWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))

	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("一键出售"))
	slot0.container:getChildByName("win_title"):setString(TI18N("出售"))
	slot0.container:getChildByName("sell_title"):setString(TI18N("请选择一键出售条件:"))

	slot0.btn_star_1 = slot0.container:getChildByName("btn_star_1")

	slot0.btn_star_1:getChildByName("name"):setString(TI18N("1星"))
	slot0.btn_star_1:setSelected(false)

	slot0.btn_star_2 = slot0.container:getChildByName("btn_star_2")

	slot0.btn_star_2:getChildByName("name"):setString(TI18N("2星"))
	slot0.btn_star_2:setSelected(false)

	slot0.btn_star_3 = slot0.container:getChildByName("btn_star_3")

	slot0.btn_star_3:getChildByName("name"):setString(TI18N("3星"))
	slot0.btn_star_3:setSelected(false)

	slot0.btn_star_4 = slot0.container:getChildByName("btn_star_4")

	slot0.btn_star_4:getChildByName("name"):setString(TI18N("4星"))
	slot0.btn_star_4:setSelected(false)

	slot0.btn_star_5 = slot0.container:getChildByName("btn_star_5")

	slot0.btn_star_5:getChildByName("name"):setString(TI18N("5星"))
	slot0.btn_star_5:setSelected(false)

	slot0.btn_step_1 = slot0.container:getChildByName("btn_step_1")

	slot0.btn_step_1:getChildByName("name"):setString(TI18N("凡品"))
	slot0.btn_step_1:setSelected(false)

	slot0.btn_step_2 = slot0.container:getChildByName("btn_step_2")

	slot0.btn_step_2:getChildByName("name"):setString(TI18N("良品"))
	slot0.btn_step_2:setSelected(false)

	slot0.btn_step_3 = slot0.container:getChildByName("btn_step_3")

	slot0.btn_step_3:getChildByName("name"):setString(TI18N("极品"))
	slot0.btn_step_3:setSelected(false)
end

function BackPackSellHolyWindow.register_event(slot0)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:openQuickSellHolyWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onClickQuickSellBtn()
	end, true, 1)
	slot0.btn_star_1:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_1, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(1) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_1, false, false)
			else
				uv0.btn_star_1:setSelected(true)
			end
		end
	end)
	slot0.btn_star_2:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_2, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(1) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_2, false, false)
			else
				uv0.btn_star_2:setSelected(true)
			end
		end
	end)
	slot0.btn_star_3:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_3, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(1) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_3, false, false)
			else
				uv0.btn_star_3:setSelected(true)
			end
		end
	end)
	slot0.btn_star_4:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_4, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(1) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_4, false, false)
			else
				uv0.btn_star_4:setSelected(true)
			end
		end
	end)
	slot0.btn_star_5:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_5, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(1) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_5, false, false)
			else
				uv0.btn_star_5:setSelected(true)
			end
		end
	end)
	slot0.btn_step_1:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_step_1, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(2) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_step_1, false, false)
			else
				uv0.btn_step_1:setSelected(true)
			end
		end
	end)
	slot0.btn_step_2:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_step_2, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(2) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_step_2, false, false)
			else
				uv0.btn_step_2:setSelected(true)
			end
		end
	end)
	slot0.btn_step_3:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_step_3, true, false)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0:checkIsCanCancelSelect(2) then
				SysEnv:getInstance():set(SysEnv.keys.holy_sell_step_3, false, false)
			else
				uv0.btn_step_3:setSelected(true)
			end
		end
	end)
end

function BackPackSellHolyWindow.openRootWnd(slot0)
	slot0:setData()
end

function BackPackSellHolyWindow.setData(slot0)
	slot0.btn_star_1:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_1, true))
	slot0.btn_star_2:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_2, false))
	slot0.btn_star_3:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_3, false))
	slot0.btn_star_4:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_4, false))
	slot0.btn_star_5:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_5, false))
	slot0.btn_step_1:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_1, true))
	slot0.btn_step_2:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_2, false))
	slot0.btn_step_3:setSelected(SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_3, false))
end

function BackPackSellHolyWindow.checkIsCanCancelSelect(slot0, slot1)
	if slot1 == 1 then
		slot2 = {}

		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_1, true))
		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_2, false))
		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_3, false))
		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_4, false))
		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_5, false))

		for slot12, slot13 in pairs(slot2) do
			if slot13 then
				slot8 = 0 + 1
			end
		end

		if slot8 <= 1 then
			message(TI18N("请至少选择一种星数条件"))

			return false
		end
	else
		slot2 = {}

		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_1, true))
		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_2, false))
		uv0(slot2, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_3, false))

		for slot10, slot11 in pairs(slot2) do
			if slot11 then
				slot6 = 0 + 1
			end
		end

		if slot6 <= 1 then
			message(TI18N("请至少选择一种品质条件"))

			return false
		end
	end

	return true
end

function BackPackSellHolyWindow.onClickQuickSellBtn(slot0)
	slot1 = {}

	uv0(slot1, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_1, true))
	uv0(slot1, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_2, false))
	uv0(slot1, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_3, false))
	uv0(slot1, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_4, false))
	uv0(slot1, SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_star_5, false))

	slot11 = {}

	for slot16, slot17 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.HOLYEQUIPMENT)) do
		if slot1[slot17.eqm_star] and ({
			[0] = SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_1, true),
			SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_2, false),
			SysEnv:getInstance():getBool(SysEnv.keys.holy_sell_step_3, false)
		})[slot17.eqm_jie] then
			uv0(slot11, {
				item_id = slot17.id
			})
		end
	end

	if next(slot11) ~= nil then
		HeroController:getInstance():openHeroResetOfferPanel(true, slot11, false, function ()
			slot0 = false

			for slot4, slot5 in pairs(uv0) do
				if HeroController:getInstance():getModel():checkHolyEquipmentPalnByItemID(slot5.item_id) then
					slot0 = true

					break
				end
			end

			if slot0 then
				CommonAlert.show(TI18N("选中的对象中含有<div fontColor=#d95014 >已在方案</div>的神装，继续出售将会清除这些神装在方案中的配置，是否继续？"), TI18N("确定"), function ()
					HeroController:getInstance():sender11089(uv0)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			else
				HeroController:getInstance():sender11089(uv0)
			end
		end, HeroConst.ResetType.eHolyEquipSell, string.format(TI18N("本次一共出售<div fontcolor=#b35800>%d</div>件神装，可获得以下资源（已包含返还的60%%的洗练消耗），是否确定出售？"), #slot11))
		uv1:openQuickSellHolyWindow(false)
	else
		message(TI18N("没有符合要求的神装"))
	end
end

function BackPackSellHolyWindow.close_callback(slot0)
	SysEnv:getInstance():save()
	uv0:openQuickSellHolyWindow(false)
end
