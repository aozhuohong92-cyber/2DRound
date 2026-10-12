BackPackSellEquipWindow = BackPackSellEquipWindow or BaseClass(BaseView)
slot0 = string.format
slot1 = table.insert
slot2 = BackpackController:getInstance()
slot3 = BackpackController:getInstance():getModel()
slot4 = 5
slot5 = 6

function BackPackSellEquipWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "backpack/backpack_sell_equip"
	slot0.quality_btn_list = {}
	slot0.star_btn_list = {}
end

function BackPackSellEquipWindow.open_callback(slot0)
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
	slot0.container:getChildByName("img_title_bg_1"):getChildByName("txt_title"):setString(TI18N("装备品级"))
	slot0.container:getChildByName("img_title_bg_2"):getChildByName("txt_title"):setString(TI18N("装备星级"))

	slot0.btn_all = slot0.container:getChildByName("btn_all")

	slot0.btn_all:getChildByName("name"):setString(TI18N("全选"))

	slot4 = false

	slot0.btn_all:setSelected(slot4)

	for slot4 = 1, uv0 do
		slot5 = slot0.container:getChildByName(uv1("btn_quality_%d", slot4))

		slot5:setSelected(false)
		slot5:getChildByName("name"):setString(BackPackConst.quality_name[slot4])
		uv2(slot0.quality_btn_list, slot4, slot5)
	end

	for slot4 = 1, uv3 do
		slot5 = slot0.container:getChildByName(uv1("btn_star_%d", slot4))

		slot5:setSelected(false)
		slot5:getChildByName("name"):setString(BackPackConst.star_name[slot4])
		uv2(slot0.star_btn_list, slot4, slot5)
	end
end

function BackPackSellEquipWindow.register_event(slot0)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:openQuickSellEquipWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onClickQuickSellBtn()
	end, true, 1)
	slot0:registerCheckBoxEvent(slot0.btn_all, "equip_sell_all", BackPackConst.cb_type.all)

	if not slot0.quality_btn_list then
		return
	end

	for slot4 = 1, uv1 do
		if slot0.quality_btn_list[slot4] then
			slot0:registerCheckBoxEvent(slot5, uv2("equip_sell_quality_%d", slot4), BackPackConst.cb_type.quality)
		end
	end

	if not slot0.star_btn_list then
		return
	end

	for slot4 = 1, uv3 do
		if slot0.star_btn_list[slot4] then
			slot0:registerCheckBoxEvent(slot5, uv2("equip_sell_star_%d", slot4), BackPackConst.cb_type.star)
		end
	end
end

function BackPackSellEquipWindow.openRootWnd(slot0)
	slot0:setData()
end

function BackPackSellEquipWindow.setData(slot0)
	slot5 = SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_all, false)

	slot0.btn_all:setSelected(slot5)

	for slot5 = 1, uv0 do
		if slot0.quality_btn_list[slot5] then
			slot8 = false

			if slot5 == 1 then
				slot8 = SysEnv:getInstance():getBool(SysEnv.keys[uv1("equip_sell_quality_%d", slot5)], true)
			elseif slot5 == 2 then
				if Config.PackageData.data_backpack_cost.limit_lev then
					if slot10.val <= RoleController:getInstance():getRoleVo().lev then
						if SysEnv:getInstance():getBool(SysEnv.keys[slot7], "no_val") == "no_val" then
							SysEnv:getInstance():set(SysEnv.keys[slot7], true, false)
						end
					else
						slot8 = SysEnv:getInstance():getBool(SysEnv.keys[slot7], false)
					end
				end
			else
				slot8 = SysEnv:getInstance():getBool(SysEnv.keys[slot7], false)
			end

			slot6:setSelected(slot8)
		end
	end

	for slot5 = 1, uv2 do
		slot7 = uv1("equip_sell_star_%d", slot5)

		if slot0.star_btn_list[slot5] then
			slot8 = false

			if slot5 == 1 or slot5 == 2 then
				if SysEnv:getInstance():getBool(SysEnv.keys[slot7], "no_val") == "no_val" then
					SysEnv:getInstance():set(SysEnv.keys[slot7], true, false)
				end
			else
				slot8 = SysEnv:getInstance():getBool(SysEnv.keys[slot7], false)
			end

			slot6:setSelected(slot8)
		end
	end
end

function BackPackSellEquipWindow.checkIsCanCancelSelect(slot0, slot1, slot2)
	slot3 = 0
	slot4 = {}
	slot2 = slot2 or false

	if slot1 == BackPackConst.cb_type.quality then
		slot9 = SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_quality_1, true)

		uv0(slot4, slot9)

		for slot9 = 2, uv1 do
			uv0(slot4, SysEnv:getInstance():getBool(SysEnv.keys[uv2("equip_sell_quality_%d", slot9)], false))
		end

		for slot9, slot10 in pairs(slot4) do
			if slot10 then
				slot3 = slot3 + 1
			end
		end

		slot6 = 2

		if slot2 then
			slot6 = 1
		end

		if slot3 < slot6 then
			message(TI18N("请至少选择一种品级与星级"))

			return false
		end
	elseif slot1 == BackPackConst.cb_type.star then
		slot9 = SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_star_1, true)

		uv0(slot4, slot9)

		for slot9 = 2, uv3 do
			uv0(slot4, SysEnv:getInstance():getBool(SysEnv.keys[uv2("equip_sell_star_%d", slot9)], false))
		end

		for slot9, slot10 in pairs(slot4) do
			if slot10 then
				slot3 = slot3 + 1
			end
		end

		slot6 = 2

		if slot2 then
			slot6 = 1
		end

		if slot3 < slot6 then
			message(TI18N("请至少选择一种品级与星级"))

			return false
		end
	end

	return true, slot4, slot3
end

function BackPackSellEquipWindow.setSpecialBtnSelected(slot0, slot1, slot2, slot3)
	if slot1 == BackPackConst.cb_type.all then
		if not (slot2 or false) then
			slot0:setData()
		else
			for slot7 = 1, uv0 do
				slot0.quality_btn_list[slot7]:setSelected(slot2)
				SysEnv:getInstance():set(SysEnv.keys[uv1("equip_sell_quality_%d", slot7)], slot2, false)
			end

			for slot7 = 1, uv2 do
				slot0.star_btn_list[slot7]:setSelected(slot2)
				SysEnv:getInstance():set(SysEnv.keys[uv1("equip_sell_star_%d", slot7)], slot2, false)
			end
		end
	elseif slot1 == BackPackConst.cb_type.quality then
		if not slot2 then
			return
		end

		slot4 = 2
		slot5 = SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_quality_1, false) or SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_quality_2, false)
		slot7 = nil

		if slot3 == "equip_sell_quality_3" then
			slot4 = 3
			slot7 = SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_quality_3, false)
		elseif slot3 == "equip_sell_quality_1" or slot3 == "equip_sell_quality_2" then
			slot7 = slot5
		end

		if slot7 then
			for slot11 = 1, slot4 do
				slot0.star_btn_list[slot11]:setSelected(true)
				SysEnv:getInstance():set(SysEnv.keys[uv1("equip_sell_star_%d", slot11)], true, false)
			end
		end
	end
end

function BackPackSellEquipWindow.registerCheckBoxEvent(slot0, slot1, slot2, slot3)
	if not slot1 or not slot2 or not slot3 then
		return
	end

	slot1:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys[uv0], true, false)
			uv1:setSpecialBtnSelected(uv2, true, uv0)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			slot2, slot3, slot4 = uv1:checkIsCanCancelSelect(uv2)

			if not slot2 then
				uv3:setSelected(true)
			else
				SysEnv:getInstance():set(SysEnv.keys[uv0], false, false)
				uv1:setSpecialBtnSelected(uv2, false, uv0)

				if slot4 == 2 then
					return
				end

				slot5, slot6, slot7 = uv1:checkIsCanCancelSelect(uv2)

				if not slot7 then
					return
				end

				if (uv2 == BackPackConst.cb_type.quality and slot7 < uv4 or uv2 == BackPackConst.cb_type.star and slot7 < uv5) and SysEnv:getInstance():getBool(SysEnv.keys.equip_sell_all, false) then
					uv1.btn_all:setSelected(false)
					SysEnv:getInstance():set(SysEnv.keys.equip_sell_all, false, false)
				end
			end
		end
	end)
end

function BackPackSellEquipWindow.onClickQuickSellBtn(slot0)
	slot1, slot2 = slot0:checkIsCanCancelSelect(BackPackConst.cb_type.quality, true)

	if not slot1 then
		return
	end

	slot3, slot4 = slot0:checkIsCanCancelSelect(BackPackConst.cb_type.star, true)

	if not slot3 then
		return
	end

	slot5 = false
	slot6 = {}

	for slot11, slot12 in pairs(uv0:getAllBackPackArray(BackPackConst.item_tab_type.EQUIPS)) do
		if slot4[slot12.eqm_star] and slot2[slot12.quality] then
			if slot12.quality == BackPackConst.quality.orange or slot12.quality == BackPackConst.quality.red then
				slot5 = true
			end

			uv1(slot6, {
				id = slot12.id,
				bid = slot12.base_id,
				num = slot12.quantity
			})
		end
	end

	slot8 = false

	if slot5 and (slot2[BackPackConst.quality.orange] or slot2[BackPackConst.quality.red]) then
		slot8 = true
	end

	slot9 = 0

	if next(slot6) ~= nil then
		for slot13, slot14 in ipairs(slot6) do
			if slot14 and slot14.num then
				slot9 = slot9 + slot14.num
			end
		end
	end

	if next(slot6) ~= nil then
		uv2:sender10521(BackPackConst.Bag_Code.EQUIPS, slot6)
		uv2:openSellConfirmWindow(true, function ()
			uv0:sender10522(BackPackConst.Bag_Code.EQUIPS, uv1)
		end, BackPackConst.Bag_Code.EQUIPS, slot8, slot9)
		uv2:openQuickSellEquipWindow(false)
	else
		message(TI18N("没有符合要求的装备"))
	end
end

function BackPackSellEquipWindow.close_callback(slot0)
	SysEnv:getInstance():save()
	uv0:openQuickSellEquipWindow(false)
end
