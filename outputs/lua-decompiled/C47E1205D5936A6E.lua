ForgeHouseWindow = ForgeHouseWindow or BaseClass(BaseView)
slot1 = ForgeHouseController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = Config.PartnerEqmData.data_partner_const
slot4 = Config.PartnerEqmData.data_eqm_compose_id

function ForgeHouseWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "forgehouse/forgehouse_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("forgehouse", "forgehouse"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_64", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_79", false),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_80", false),
			type = ResourcesType.single
		}
	}
	slot0.tab_list = {}
	slot0.top_tab_list = {}
	slot0.cur_index = nil
	slot0.composite_number = 0
	slot0.compCoinNumber = 0
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.touch_comp_base = 1
	slot0.is_selected = nil
	slot0.is_tab_touch = true
end

function ForgeHouseWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("bg")

	slot1:ignoreContentAdaptWithSize(true)
	slot1:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_64", true), LOADTEXT_TYPE)
	slot1:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.equip_container = slot0.main_container:getChildByName("equip_container")
	slot0.artifact_container = slot0.main_container:getChildByName("artifact_container")
	slot0.role_title_container = slot0.main_container:getChildByName("role_title_container")
	slot0.holy_eqm_container = slot0.main_container:getChildByName("holy_eqm_container")
	slot2 = slot0.equip_container:getChildByName("image_stage")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_80"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				uv0:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	for slot9 = 1, 3 do
		if slot0.main_container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot9) then
			slot11 = {
				unselect_bg = slot10:getChildByName("unselect_bg")
			}

			slot11.unselect_bg:setVisible(true)

			slot11.select_bg = slot10:getChildByName("select_bg")

			slot11.select_bg:setVisible(false)

			slot11.lable = slot10:getChildByName("title")

			slot11.lable:setString(({
				TI18N("装备锻造"),
				TI18N("战技锻造"),
				TI18N("神装锻造")
			})[slot9])

			slot11.tab_btn = slot10
			slot11.index = slot9
			slot11.tips = slot10:getChildByName("tips")

			if slot11.index == 2 then
				slot11.tips:setVisible(HeroController:getInstance():getModel():getArtifactLuckyRedStatus())
			else
				slot11.tips:setVisible(false)
			end

			slot0.top_tab_list[slot9] = slot11
		end
	end

	slot0.close_btn = slot0.main_container:getChildByName("btn_return")

	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_equipment_forging")
end

function ForgeHouseWindow.initEquipLayout(slot0)
	slot0.bar = slot0.equip_container:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)

	slot0.bar_num = slot0.equip_container:getChildByName("bar_num")

	slot0.bar_num:setString("")

	slot0.btn_composite = slot0.equip_container:getChildByName("btn_composite")

	slot0.btn_composite:getChildByName("Text_1"):setString(TI18N("合成"))

	slot0.btn_comp = slot0.equip_container:getChildByName("btn_comp")

	slot0.btn_comp:getChildByName("Text_1"):setString(TI18N("合成记录"))

	slot0.text_Field = slot0.equip_container:getChildByName("text_Field")

	slot0.text_Field:setTextColor(cc.c4b(255, 255, 255, 255))
	slot0.text_Field:setPlaceHolderColor(cc.c4b(255, 255, 255, 255))
	slot0.text_Field:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
	slot0.text_Field:addEventListener(function (slot0, slot1)
		if slot1 == ccui.TextFiledEventType.attach_with_ime then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.detach_with_ime then
			slot3 = uv1[uv0.cur_index or 1][uv0.touch_comp_base].expend
			slot4 = math.floor(uv2:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot3[1][1]) / slot3[1][2])

			if uv0.text_Field:getString() == "" then
				message(TI18N("需写入合成数量哦~~"))

				uv0.composite_number = 0

				return
			elseif type(tonumber(uv0.text_Field:getString())) and type(slot5) == "number" and type(slot4) and type(slot4) == "number" then
				if slot4 < slot5 then
					uv0.text_Field:setString(slot4)

					uv0.composite_number = slot4
				else
					uv0.text_Field:setString(slot5)

					uv0.composite_number = slot5
				end
			else
				message("只能输入数字哦")
			end

			uv0.gold_num:setString(MoneyTool.GetMoneyString(slot3[2][2] * uv0.composite_number))

			uv0.compCoinNumber = slot3[2][2] * uv0.composite_number
		elseif slot1 == ccui.TextFiledEventType.insert_text then
			-- Nothing
		elseif slot1 == ccui.TextFiledEventType.delete_backward then
			-- Nothing
		end
	end)

	slot0.btn_all_composite = slot0.equip_container:getChildByName("btn_all_composite")
	slot0.btn_all_composite_label = slot0.btn_all_composite:getChildByName("Text_1")

	slot0.btn_all_composite_label:setString(TI18N("一键合成"))

	if slot0.role_vo.vip_lev < uv2.synthesis_vip_lev.val and slot0.role_vo.lev < uv2.synthesis_character_lev.val then
		setChildUnEnabled(true, slot0.btn_all_composite)
		slot0.btn_all_composite_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	for slot8 = 1, 4 do
		slot9 = slot0.equip_container:getChildByName("Image_1"):getChildByName("tab_container"):getChildByName("tab_btn_" .. slot8)
		slot9.title = slot9:getChildByName("title")

		slot9.title:setString(({
			TI18N("武器"),
			TI18N("衣服"),
			TI18N("头盔"),
			TI18N("鞋子")
		})[slot8])
		slot9.title:disableEffect(cc.LabelEffect.OUTLINE)
		slot9.title:setTextColor(cc.c4b(215, 226, 227, 255))

		slot9.normal = slot9:getChildByName("normal")
		slot9.select = slot9:getChildByName("select")

		slot9.select:setVisible(false)

		slot9.redpoint = slot9:getChildByName("redpoint")

		slot9.redpoint:setVisible(false)

		slot9.index = slot8
		slot0.tab_list[slot8] = slot9
	end

	slot0.scroll = slot0.equip_container:getChildByName("goods_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll:getContentSize(), {
		start_y = 0,
		start_x = 5,
		space_x = 7,
		row = 1,
		space_y = 10,
		col = 5,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})
	slot0.last_item = BackPackItem.new(nil, true, nil, 0.8)

	slot0.equip_container:addChild(slot0.last_item)
	slot0.last_item:setPosition(cc.p(207, 1006))
	slot0.last_item:setDefaultTip()

	slot0.cur_item = BackPackItem.new(nil, true, nil, 0.8)

	slot0.equip_container:addChild(slot0.cur_item)
	slot0.cur_item:setPosition(cc.p(506, 1006))
	slot0.cur_item:setDefaultTip()

	slot0.spriteGold = slot0.equip_container:getChildByName("spriteGold")
	slot0.btn_add = slot0.equip_container:getChildByName("btn_add")
	slot0.btn_redu = slot0.equip_container:getChildByName("btn_redu")
	slot0.gold_bg = slot0.equip_container:getChildByName("gold_bg")
	slot0.gold_num = slot0.equip_container:getChildByName("gold_num")

	slot0.gold_num:setString("")

	slot0.composite_num = slot0.equip_container:getChildByName("Image_3"):getChildByName("composite_num")

	slot0.composite_num:setVisible(false)
	slot0:register_equip_event()
	slot0:tabChangeView(1)
	slot0:initRedPoint()
end

function ForgeHouseWindow.tabChangeView(slot0, slot1)
	if slot0.is_tab_touch == nil then
		return
	end

	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select:setVisible(false)
		slot0.cur_tab.title:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.cur_tab.title:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.cur_tab.title:setFontSize(24)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select:setVisible(true)
		slot0.cur_tab.title:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.cur_tab.title:enableOutline(cc.c4b(2, 0, 25, 255), 2)
		slot0.cur_tab.title:setFontSize(26)
	end

	slot0.touch_comp_base = 1

	slot0:setTouchEnable_Add(false)
	slot0:setTouchEnable_Redu(false)

	slot2 = uv0[slot0.cur_index]

	loadSpriteTexture(slot0.spriteGold, PathTool.getItemRes(Config.ItemData.data_get_data(slot2[1].expend[2][1]).icon), LOADTEXT_TYPE)
	slot0.last_item:setBaseData(slot2[slot0.touch_comp_base].expend[1][1])
	slot0.cur_item:setBaseData(slot2[slot0.touch_comp_base].id)

	slot5 = uv1:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot2[slot0.touch_comp_base].expend[1][1])

	slot0.bar_num:setString(slot5 .. "/" .. slot2[slot0.touch_comp_base].expend[1][2])
	slot0.bar:setPercent(math.floor(slot5 / slot2[slot0.touch_comp_base].expend[1][2] * 100))

	slot0.composite_number = math.floor(slot5 / slot2[slot0.touch_comp_base].expend[1][2])

	slot0.text_Field:setString(slot0.composite_number)
	slot0.gold_num:setString(MoneyTool.GetMoneyString(slot2[slot0.touch_comp_base].expend[2][2] * slot0.composite_number))

	slot0.compCoinNumber = slot2[1].expend[2][2] * slot0.composite_number

	slot0:getGoldBGSize()
	slot0:setTouchEnable_Add(true)

	if slot0.composite_number <= 1 then
		slot0:setTouchEnable_Redu(true)
	end

	slot0.item_scrollview:setData(slot2, function (slot0)
		if not uv0.is_selected then
			return
		end

		slot1 = slot0:getData()

		for slot6, slot7 in pairs(uv0.item_scrollview:getItemList()) do
			if slot7 then
				if slot1 and slot7:getData() and slot7:getData().id == slot1.id then
					slot7:setMaskVisible(true)

					uv0.touch_comp_base = slot7:getData()._index
				else
					slot7:setMaskVisible(false)
				end
			end
		end

		uv0.last_item:setBaseData(slot1.expend[1][1])
		uv0.cur_item:setBaseData(slot1.id)

		slot3 = uv1:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot1.expend[1][1])

		uv0.bar_num:setString(slot3 .. "/" .. slot1.expend[1][2])
		uv0.bar:setPercent(math.floor(slot3 / slot1.expend[1][2] * 100))

		uv0.composite_number = math.floor(slot3 / uv2[1].expend[1][2])

		uv0.text_Field:setString(uv0.composite_number)
		uv0.gold_num:setString(MoneyTool.GetMoneyString(slot1.expend[2][2] * uv0.composite_number))

		uv0.compCoinNumber = slot1.expend[2][2] * uv0.composite_number

		uv0:getGoldBGSize()
		uv0:setTouchEnable_Add(true)
		uv0:setTouchEnable_Redu(false)

		if uv0.composite_number <= 1 then
			uv0:setTouchEnable_Redu(true)
		end
	end)
	slot0.item_scrollview:addEndCallBack(function ()
		slot1 = false

		for slot5, slot6 in pairs(uv0.item_scrollview:getItemList()) do
			if slot6 then
				slot6:createSpriteMask()
				slot6:createSpriteRedPoint()

				if slot5 == uv0.touch_comp_base then
					slot6:setMaskVisible(true)
				else
					slot6:setMaskVisible(false)
				end

				if slot6:getData() and uv1:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot7.expend[1][1]) and slot7.expend[1][2] then
					if slot7.expend[1][2] <= slot8 then
						slot6:setVisibleResPoint(true)

						slot1 = true
					else
						slot6:setVisibleResPoint(false)
					end
				end
			end
		end

		uv0.is_selected = true

		uv0.tab_list[uv0.cur_index].redpoint:setVisible(slot1)
	end)
end

function ForgeHouseWindow.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function ForgeHouseWindow.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function ForgeHouseWindow.getGoldBGSize(slot0)
	if slot0.gold_num:getContentSize().width < 100 then
		slot2 = 120
	end

	slot0.gold_bg:setContentSize(cc.size(slot2 + 15, slot0.gold_bg:getContentSize().height))
end

function ForgeHouseWindow.register_equip_event(slot0)
	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5, function ()
			uv0:tabChangeView(uv1.index)
		end, false, 3)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if (slot0 == "lev" or slot0 == "vip_lev") and (uv1.synthesis_vip_lev.val <= uv0.role_vo.vip_lev or uv1.synthesis_character_lev.val <= uv0.role_vo.lev) then
				setChildUnEnabled(false, uv0.btn_all_composite)
				uv0.btn_all_composite_label:enableOutline(Config.ColorData.data_color4[264], 2)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_comp, function ()
		uv0:openEquipmentCompRecordWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_all_composite, function ()
		if uv0.role_vo.vip_lev < uv1.synthesis_vip_lev.val and uv0.role_vo.lev < uv1.synthesis_character_lev.val then
			message(string.format(TI18N("人物%d级或VIP达到%d级开启"), uv1.synthesis_character_lev.val, uv1.synthesis_vip_lev.val))

			return
		end

		if uv2[uv0.cur_index][#uv2[uv0.cur_index]].id then
			uv3:getModel():setCompSendID(slot0)
			uv3:send11079(slot0)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_composite, function ()
		if uv0.text_Field:getString() == "" then
			message(TI18N("需写入合成数量哦~~"))

			return
		end

		uv0.cur_index = uv0.cur_index or 1

		if uv0.touch_comp_base and uv0.cur_index then
			if uv0.role_vo.coin <= uv0.compCoinNumber then
				message(TI18N("贝里不足"))

				return
			end

			slot0 = uv1[uv0.cur_index][uv0.touch_comp_base].id

			if uv0.composite_number <= 0 then
				uv0.is_selected = true

				message(TI18N("合成材料不足"))
			else
				uv0.is_selected = nil
				uv0.is_tab_touch = nil

				uv0:releaseCompositeEffect()
				AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_equipment_forging")
				playEffectOnce(PathTool.getEffectRes(269), uv0.last_item:getPositionX() + 165, uv0.last_item:getPositionY() - 5, uv0.equip_container, function ()
					uv0:send11080(uv1, uv2.composite_number)
				end, nil, nil, nil, PlayerAction.action, 1)
			end

			if uv0.send_comp_ticket == nil then
				uv0.send_comp_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0.is_tab_touch = true
					uv0.is_selected = true

					if uv0.send_comp_ticket ~= nil then
						GlobalTimeTicket:getInstance():remove(uv0.send_comp_ticket)

						uv0.send_comp_ticket = nil
					end
				end, 1)
			end
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_add, function ()
		uv0.composite_number = uv0.composite_number + 1

		uv0.text_Field:setString(uv0.composite_number)

		slot0 = uv1[uv0.cur_index][uv0.touch_comp_base].expend

		uv0.gold_num:setString(MoneyTool.GetMoneyString(slot0[2][2] * uv0.composite_number))

		uv0.compCoinNumber = slot0[2][2] * uv0.composite_number

		uv0:getGoldBGSize()

		if math.floor(uv2:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot0[1][1]) / slot0[1][2]) <= uv0.composite_number then
			uv0:setTouchEnable_Add(true)
			uv0:setTouchEnable_Redu(false)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0.composite_number = uv0.composite_number - 1

		uv0.text_Field:setString(uv0.composite_number)

		slot0 = uv1[uv0.cur_index][uv0.touch_comp_base].expend

		uv0.gold_num:setString(MoneyTool.GetMoneyString(slot0[2][2] * uv0.composite_number))

		uv0.compCoinNumber = slot0[2][2] * uv0.composite_number

		uv0:getGoldBGSize()

		if uv0.composite_number < math.floor(uv2:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot0[1][1]) / slot0[1][2]) then
			uv0:setTouchEnable_Add(false)
			uv0:setTouchEnable_Redu(false)
		end

		if uv0.composite_number <= 1 then
			uv0:setTouchEnable_Add(false)
			uv0:setTouchEnable_Redu(true)
		end
	end, true, 1)
end

function ForgeHouseWindow.releaseCompositeEffect(slot0)
	if slot0.composite_effect ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.composite_effect)

		slot0.composite_effect = nil
	end
end

function ForgeHouseWindow.register_event(slot0)
	slot0:addGlobalEvent(ForgeHouseEvent.Composite_Result, function ()
		uv0.is_tab_touch = true
		uv0.is_selected = true
		uv0.cur_index = uv0.cur_index or 1
		slot0 = uv1[uv0.cur_index][uv0.touch_comp_base].expend
		slot1 = uv2:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot0[1][1])
		uv0.composite_number = math.floor(slot1 / slot0[1][2])

		uv0.gold_num:setString(MoneyTool.GetMoneyString(slot0[2][2] * uv0.composite_number))

		uv0.compCoinNumber = slot0[2][2] * uv0.composite_number

		uv0.bar_num:setString(slot1 .. "/" .. slot0[1][2])
		uv0.bar:setPercent(math.floor(slot1 / slot0[1][2] * 100))
		uv0.text_Field:setString(uv0.composite_number)
		uv0:getGoldBGSize()

		if math.floor(slot1 / slot0[1][2]) <= uv0.composite_number then
			if uv0.composite_number <= 1 then
				uv0:setTouchEnable_Add(true)
				uv0:setTouchEnable_Redu(true)
			else
				uv0:setTouchEnable_Add(true)
				uv0:setTouchEnable_Redu(false)
			end
		end

		slot4 = false

		for slot8, slot9 in pairs(uv0.item_scrollview:getItemList()) do
			if slot9:getData() and slot9 and uv2:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot10.expend[1][1]) and slot10.expend[1][2] then
				if slot10.expend[1][2] <= slot11 then
					slot9:setVisibleResPoint(true)

					slot4 = true
				else
					slot9:setVisibleResPoint(false)
				end
			end
		end

		uv0.tab_list[uv0.cur_index].redpoint:setVisible(slot4)
	end)
	slot0:addGlobalEvent(HeroEvent.Artifact_Lucky_Red_Event, function ()
		if uv0.top_tab_list[ForgeHouseConst.Tab_Index.Artifact] then
			slot0.tips:setVisible(HeroController:getInstance():getModel():getArtifactLuckyRedStatus())
		end
	end)

	function slot4()
		uv0:openForgeHouseView(false)
	end

	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.top_tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end
end

function ForgeHouseWindow.changeSelectedTab(slot0, slot1, slot2)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.top_tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
	end

	if slot1 == ForgeHouseConst.Tab_Index.Equip then
		slot0.equip_container:setVisible(true)
		slot0.artifact_container:setVisible(false)
		slot0.holy_eqm_container:setVisible(false)

		if not slot0.init_equip then
			slot0:initEquipLayout()

			slot0.init_equip = true
		end
	elseif slot1 == ForgeHouseConst.Tab_Index.Artifact then
		slot0.equip_container:setVisible(false)
		slot0.artifact_container:setVisible(true)
		slot0.holy_eqm_container:setVisible(false)

		if not slot0.init_artifact then
			slot0.init_artifact = true
			slot0.artifact_layout = ForgeArtifactPanel.new()

			slot0.artifact_container:addChild(slot0.artifact_layout)
		end
	elseif slot1 == ForgeHouseConst.Tab_Index.Holy_Eqm then
		slot0.equip_container:setVisible(false)
		slot0.artifact_container:setVisible(false)
		slot0.holy_eqm_container:setVisible(true)

		if not slot0.init_holy_eqm then
			slot0.init_holy_eqm = true
			slot0.holy_eqm_layout = ForgeHolyEqmPanel.new()

			slot0.holy_eqm_container:addChild(slot0.holy_eqm_layout)
		end
	elseif slot1 == ForgeHouseConst.Tab_Index.Role_Title then
		slot0.equip_container:setVisible(false)
		slot0.artifact_container:setVisible(false)
		slot0.role_title_container:setVisible(true)

		slot6 = false

		slot0.holy_eqm_container:setVisible(slot6)

		for slot6 = 1, 3 do
			slot0.main_container:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot6):setVisible(false)
		end

		if not slot0.init_role_title then
			slot0.init_role_title = true
			slot0.role_title_layout = ForgeHouseRoleTitlePanel.new()

			if slot2 then
				slot0.role_title_layout.honor_data = slot2
			end

			slot0.role_title_container:addChild(slot0.role_title_layout)
		end
	end
end

function ForgeHouseWindow.openRootWnd(slot0, slot1, slot2)
	slot0:changeSelectedTab(slot1 or ForgeHouseConst.Tab_Index.Equip, slot2)
end

function ForgeHouseWindow.initRedPoint(slot0)
	for slot4 = 1, 4 do
		slot6 = false

		for slot10, slot11 in pairs(uv0[slot4]) do
			if slot11 and uv1:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot11.expend[1][1]) and slot11.expend[1][2] and slot11.expend[1][2] <= slot12 then
				slot6 = true

				break
			end
		end

		slot0.tab_list[slot4].redpoint:setVisible(slot6)
	end
end

function ForgeHouseWindow.close_callback(slot0)
	slot0:releaseCompositeEffect()

	if slot0.send_comp_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.send_comp_ticket)

		slot0.send_comp_ticket = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.artifact_layout then
		slot0.artifact_layout:DeleteMe()

		slot0.artifact_layout = nil
	end

	if slot0.cur_item then
		slot0.cur_item:DeleteMe()

		slot0.cur_item = nil
	end

	if slot0.last_item then
		slot0.last_item:DeleteMe()

		slot0.last_item = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openForgeHouseView(false)
end
