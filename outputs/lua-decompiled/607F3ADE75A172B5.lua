BackPackAddHolyWindow = BackPackAddHolyWindow or BaseClass(BaseView)
slot1 = BackpackController:getInstance():getModel()
slot2 = table.insert

function BackPackAddHolyWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "backpack/backpack_sell_holy"
	slot0.quality = 2
	slot0.star = 5
end

function BackPackAddHolyWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.cancel_btn = slot0.container:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("取消"))

	slot0.confirm_btn = slot0.container:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("一键添加"))
	slot0.container:getChildByName("win_title"):setString(TI18N("出售"))
	slot0.container:getChildByName("sell_title"):setString(TI18N("请选择一键添加条件:"))

	slot0.btn_star_1 = slot0.container:getChildByName("btn_star_1")

	slot0.btn_star_1:getChildByName("name"):setString(TI18N("5星"))
	slot0.btn_star_1:setSelected(false)

	slot0.btn_star_2 = slot0.container:getChildByName("btn_star_2")

	slot0.btn_star_2:getChildByName("name"):setString(TI18N("6星"))
	slot0.btn_star_2:setSelected(false)

	slot0.btn_star_3 = slot0.container:getChildByName("btn_star_3")

	slot0.btn_star_3:getChildByName("name"):setString(TI18N("7星"))
	slot0.btn_star_3:setSelected(false)

	slot0.btn_star_4 = slot0.container:getChildByName("btn_star_4")

	slot0.btn_star_4:getChildByName("name"):setString(TI18N("8星"))
	slot0.btn_star_4:setSelected(false)

	slot0.btn_star_5 = slot0.container:getChildByName("btn_star_5")

	slot0.btn_star_5:getChildByName("name"):setString(TI18N("9星"))
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

function BackPackAddHolyWindow.register_event(slot0)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:openQuickAddHolyWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onClickQuickSellBtn()
	end, true, 1)
	slot0.btn_star_1:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.holy_sell_star_1, true, false)
			uv0.btn_star_5:setSelected(false)
			uv0.btn_star_2:setSelected(false)
			uv0.btn_star_3:setSelected(false)
			uv0.btn_star_4:setSelected(false)

			uv0.star = 5
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
			uv0.btn_star_1:setSelected(false)
			uv0.btn_star_5:setSelected(false)
			uv0.btn_star_3:setSelected(false)
			uv0.btn_star_4:setSelected(false)

			uv0.star = 6
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
			uv0.btn_star_1:setSelected(false)
			uv0.btn_star_2:setSelected(false)
			uv0.btn_star_5:setSelected(false)
			uv0.btn_star_4:setSelected(false)

			uv0.star = 7
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
			uv0.btn_star_1:setSelected(false)
			uv0.btn_star_2:setSelected(false)
			uv0.btn_star_3:setSelected(false)
			uv0.btn_star_5:setSelected(false)

			uv0.star = 8
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
			uv0.btn_star_1:setSelected(false)
			uv0.btn_star_2:setSelected(false)
			uv0.btn_star_3:setSelected(false)
			uv0.btn_star_4:setSelected(false)

			uv0.star = 9
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
			uv0.btn_step_3:setSelected(false)
			uv0.btn_step_2:setSelected(false)

			uv0.quality = 0
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
			uv0.btn_step_1:setSelected(false)
			uv0.btn_step_3:setSelected(false)

			uv0.quality = 1
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
			uv0.btn_step_1:setSelected(false)
			uv0.btn_step_2:setSelected(false)

			uv0.quality = 2
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

function BackPackAddHolyWindow.openRootWnd(slot0)
	slot0:setData()
end

function BackPackAddHolyWindow.setData(slot0)
	slot0.btn_star_1:setSelected(true)
	slot0.btn_star_2:setSelected(false)
	slot0.btn_star_3:setSelected(false)
	slot0.btn_star_4:setSelected(false)
	slot0.btn_star_5:setSelected(false)
	slot0.btn_step_1:setSelected(false)
	slot0.btn_step_2:setSelected(false)
	slot0.btn_step_3:setSelected(true)
end

function BackPackAddHolyWindow.checkIsCanCancelSelect(slot0, slot1)
	if slot1 == 1 then
		message("请至少选择一种星数条件")

		return false
	else
		message("请至少选择一种品质条件")

		return false
	end

	return true
end

function BackPackAddHolyWindow.onClickQuickSellBtn(slot0)
	slot0.cur_auto_num = 5
	slot1 = {}

	for slot7, slot8 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.HOLYEQUIPMENT)) do
		if slot8.config.eqm_jie == slot0.quality and slot8.eqm_star == slot0.star then
			uv0({}, {
				bid = slot8.config.id
			})
		end
	end

	for slot8 = 1, BackPackConst.quality.red do
		if slot3[slot8] and Config.PartnerHolyEqmData.data_artifact_data[slot3[slot8].bid] and slot10.com_artifact ~= 0 then
			slot12 = BackpackController:getInstance():getModel():getItemNumByBid(slot9, BackPackConst.Bag_Code.EQUIPS)

			if Config.PartnerHolyEqmData.data_artifact_data[slot10.com_artifact] and slot11.limit_num <= slot12 then
				if not false then
					slot4 = true
					slot1 = BackpackController:getInstance():getModel():getBackPackItemIdListByBid1(slot9)
				end

				if slot0.cur_auto_num <= slot12 then
					slot1 = {}

					if slot0.cur_auto_num < slot12 then
						for slot17, slot18 in ipairs(slot13) do
							if slot17 <= slot0.cur_auto_num then
								uv0(slot1, slot18)
							else
								break
							end
						end

						break
					end

					slot1 = slot13

					break
				end
			end
		end
	end

	if next(slot1) == nil then
		message("暂无可作为材料的神装")
	else
		GlobalEvent:getInstance():Fire(HeroEvent.SHEN_JIANG_FANG_HOLY_EQUIP_COMPOSE_SELECT_LIST, slot1)
	end

	uv1:openQuickAddHolyWindow(false)
end

function BackPackAddHolyWindow.close_callback(slot0)
	SysEnv:getInstance():save()
	uv0:openQuickAddHolyWindow(false)
end
