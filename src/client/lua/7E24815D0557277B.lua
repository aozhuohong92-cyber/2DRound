ForgeHouseRoleTitlePanel = class("ForgeHouseRoleTitlePanel", function ()
	return ccui.Widget:create()
end)
slot1 = ForgeHouseController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = Config.PartnerEqmData.data_partner_const
slot4 = Config.HonorData.data_artifact_compound

function ForgeHouseRoleTitlePanel.ctor(slot0)
	slot0.is_full_screen = true
	slot0.tab_list = {}
	slot0.top_tab_list = {}
	slot0.cur_index = nil
	slot0.composite_number = 0
	slot0.compCoinNumber = 0
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.touch_comp_base = 1
	slot0.is_selected = nil
	slot0.is_tab_touch = true
	slot0.honor_data = {}
	slot0.chose_item_list = {}

	slot0:open_callback()
end

function ForgeHouseRoleTitlePanel.open_callback(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("forgehouse/forgehouse_role_title_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:setCascadeOpacityEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.role_title_container = slot0.main_container:getChildByName("role_title_container")
	slot1 = slot0.role_title_container:getChildByName("image_stage")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_80"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				uv0:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_equipment_forging")

	slot0.bar = slot0.role_title_container:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)

	slot0.bar_num = slot0.role_title_container:getChildByName("bar_num")

	slot0.bar_num:setString("")

	slot0.btn_composite = slot0.role_title_container:getChildByName("btn_composite"):setPositionX(355)

	slot0.btn_composite:getChildByName("Text_1"):setString(TI18N("合成"))

	slot0.btn_comp = slot0.role_title_container:getChildByName("btn_comp"):setVisible(false)

	slot0.btn_comp:getChildByName("Text_1"):setString(TI18N("合成记录"))

	slot0.rate_txt = createRichLabel(22, cc.c3b(79, 189, 61), cc.p(0, 1), cc.p(300, 918), 5, nil, 640)

	slot0.main_container:addChild(slot0.rate_txt)
	slot0.rate_txt:setVisible(false)
	delayRun(slot0, 0.016666666666666666, function ()
		function tab_key(slot0)
			slot1, slot2 = nil

			for slot6, slot7 in pairs(slot0) do
				if slot1 == nil or slot1 < slot6 then
					slot1 = slot6
					slot2 = slot7
				end
			end

			return slot1
		end

		uv0.max_num = tab_key(uv1[uv0.honor_data.base_id][uv0.honor_data.lev])

		uv0.bar_num:setString("0/" .. uv0.max_num)
		uv0.bar:setPercent(0)
		uv0.text_Field:setString(0)
	end)

	slot0.text_Field = slot0.role_title_container:getChildByName("text_Field")

	slot0.text_Field:setTextColor(cc.c4b(255, 255, 255, 255))
	slot0.text_Field:setPlaceHolderColor(cc.c4b(255, 255, 255, 255))
	slot0.text_Field:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)

	slot0.btn_all_composite = slot0.role_title_container:getChildByName("btn_all_composite"):setVisible(false)
	slot0.btn_all_composite_label = slot0.btn_all_composite:getChildByName("Text_1")

	slot0.btn_all_composite_label:setString(TI18N("一键合成"))

	if slot0.role_vo.vip_lev < uv1.synthesis_vip_lev.val and slot0.role_vo.lev < uv1.synthesis_character_lev.val then
		setChildUnEnabled(true, slot0.btn_all_composite)
		slot0.btn_all_composite_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	for slot9 = 1, 4 do
		slot10 = slot0.role_title_container:getChildByName("Image_1"):getChildByName("tab_container"):setVisible(false):getChildByName("tab_btn_" .. slot9)
		slot10.title = slot10:getChildByName("title")

		slot10.title:setString(({
			TI18N("武器"),
			TI18N("衣服"),
			TI18N("头盔"),
			TI18N("鞋子")
		})[slot9])
		slot10.title:disableEffect(cc.LabelEffect.OUTLINE)
		slot10.title:setTextColor(cc.c4b(215, 226, 227, 255))

		slot10.normal = slot10:getChildByName("normal")
		slot10.select = slot10:getChildByName("select")

		slot10.select:setVisible(false)

		slot10.redpoint = slot10:getChildByName("redpoint")

		slot10.redpoint:setVisible(false)

		slot10.index = slot9
		slot0.tab_list[slot9] = slot10
	end

	slot0.scroll = slot0.role_title_container:getChildByName("goods_con")
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

	slot0.role_title_container:addChild(slot0.last_item)
	slot0.last_item:setPosition(cc.p(207, 1006))

	slot0.cur_item = BackPackItem.new(nil, true, nil, 0.8)

	slot0.role_title_container:addChild(slot0.cur_item)
	slot0.cur_item:setPosition(cc.p(506, 1006))

	slot0.spriteGold = slot0.role_title_container:getChildByName("spriteGold")
	slot0.btn_add = slot0.role_title_container:getChildByName("btn_add")
	slot0.btn_redu = slot0.role_title_container:getChildByName("btn_redu")
	slot0.gold_bg = slot0.role_title_container:getChildByName("gold_bg")
	slot0.gold_num = slot0.role_title_container:getChildByName("gold_num")

	slot0.gold_num:setString("")

	slot0.composite_num = slot0.role_title_container:getChildByName("Image_3"):getChildByName("composite_num")

	slot0.composite_num:setVisible(false)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	delayRun(slot0, 0.001, function ()
		uv0.current_id = uv0.honor_data.base_id
		uv0.current_lev = uv0.honor_data.lev
		uv0.last_item_id = Config.HonorData.data_title[uv0.current_id].loss[1][1]

		uv0.last_item:setBaseData(uv0.last_item_id)
		uv0.last_item:addCallBack(handler(uv0, uv0._onClickTargetCallBack))
		uv0.cur_item:setBaseData(uv0.last_item_id)
		uv0.cur_item:addCallBack(handler(uv0, uv0._onClickTargetCallBack2))
		uv0:getGoldBGSize()
		uv0:setTouchEnable_Add(true)

		if uv0.composite_number <= 1 then
			uv0:setTouchEnable_Redu(true)
		end
	end)
	slot0:register_equip_event()
	slot0:tabChangeView()
end

function ForgeHouseRoleTitlePanel.tabChangeView(slot0)
	slot2 = {
		[slot3] = slot8
	}
	slot3 = 1

	for slot7, slot8 in pairs(uv0:getAllBackPackArray(BackPackConst.item_tab_type.PROPS)) do
		if slot8 and slot8.config and slot8.config.tips_btn[1] == 13 and Config.HonorData.data_artifact_data[slot8.config.effect[1].val] and slot9.com_artifact ~= 0 then
			slot3 = slot3 + 1
		end
	end

	table.sort(slot2, SortTools.tableLowerSorter({
		"quality",
		"id"
	}))
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

		uv0.last_item:setBaseData(slot1.base_id)
		uv0.cur_item:setBaseData(slot1.id)

		slot3 = uv1:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, slot1.base_id)

		uv0.bar_num:setString(slot3 .. "/" .. slot1.base_id)
		uv0.bar:setPercent(math.floor(slot3 / slot1.base_id * 100))

		uv0.composite_number = math.floor(slot3 / slot1.base_id)

		uv0.text_Field:setString(uv0.composite_number)
		uv0:getGoldBGSize()
		uv0:setTouchEnable_Add(true)
		uv0:setTouchEnable_Redu(false)

		if uv0.composite_number <= 1 then
			uv0:setTouchEnable_Redu(true)
		end
	end)
	delayRun(slot0, 0.016666666666666666, function ()
		uv0:onChangeAutoForgeNum()
	end)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			if slot5 then
				slot5:setDefaultTip()
				slot5:createSpriteMask()
				slot5:createSpriteRedPoint()
			end
		end

		uv0.is_selected = false
	end)
end

function ForgeHouseRoleTitlePanel.setTouchEnable_Add(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_add)
	slot0.btn_add:setTouchEnabled(not slot1)
end

function ForgeHouseRoleTitlePanel.setTouchEnable_Redu(slot0, slot1)
	setChildUnEnabled(slot1, slot0.btn_redu)
	slot0.btn_redu:setTouchEnabled(not slot1)
end

function ForgeHouseRoleTitlePanel.getGoldBGSize(slot0)
	if slot0.gold_num:getContentSize().width < 100 then
		slot2 = 120
	end

	slot0.gold_bg:setContentSize(cc.size(slot2 + 15, slot0.gold_bg:getContentSize().height))
end

function ForgeHouseRoleTitlePanel.register_equip_event(slot0)
	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if (slot0 == "lev" or slot0 == "vip_lev") and (uv1.synthesis_vip_lev.val <= uv0.role_vo.vip_lev or uv1.synthesis_character_lev.val <= uv0.role_vo.lev) then
				setChildUnEnabled(false, uv0.btn_all_composite)
				uv0.btn_all_composite_label:enableOutline(Config.ColorData.data_color4[264], 2)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_composite, function ()
		uv0.cur_index = uv0.cur_index or 1

		if uv0.touch_comp_base and uv0.cur_index then
			if uv0.role_vo.coin <= uv0.compCoinNumber then
				message(TI18N("贝里不足"))

				return
			end

			if uv0.composite_number <= 0 then
				uv0.is_selected = true

				message(TI18N("合成材料不足"))
			else
				uv0.is_selected = nil
				uv0.is_tab_touch = nil

				uv0:releaseCompositeEffect()
				AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_equipment_forging")
				playEffectOnce(PathTool.getEffectRes(269), uv0.last_item:getPositionX() + 165, uv0.last_item:getPositionY() - 5, uv0.role_title_container, function ()
					slot0 = {}

					for slot4, slot5 in pairs(uv0.chose_item_list) do
						table.insert(slot0, {
							artifact_id = slot5
						})
					end

					RoleController:sender23304(uv0.current_id, uv0.composite_number, slot0)
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
		uv0:onChangeAutoForgeNum(2)
	end, true, 1)
	registerButtonEventListener(slot0.btn_redu, function ()
		uv0:onChangeAutoForgeNum(1)
	end, true, 1)

	if not slot0.compound_update_evt then
		slot0.compound_update_evt = GlobalEvent:getInstance():Bind(RoleEvent.UpgradeTitle, function (slot0)
			delayRun(uv0, 0.016666666666666666, function ()
				if uv0 == 1 then
					uv1.current_lev = uv1.current_lev + 1
					uv1.max_num = tab_key(uv2[uv1.honor_data.base_id][uv1.current_lev])

					if uv1.current_lev == Config.HonorData.data_artifact_data[uv1.current_id].max_lev then
						uv1.cur_item:setVisible(false)

						uv1.Sprite_12 = uv1.role_title_container:getChildByName("Sprite_12"):setVisible(false)

						uv1.bar:setVisible(false)

						uv1.bar_bg = uv1.role_title_container:getChildByName("bar_bg"):setVisible(false)
						uv1.Image_3 = uv1.role_title_container:getChildByName("Image_3"):setVisible(false)

						uv1.bar_num:setVisible(false)
						uv1.btn_add:setVisible(false)
						uv1.btn_redu:setVisible(false)
						uv1.composite_num:setVisible(false)
						uv1.gold_bg:setVisible(false)
						uv1.gold_num:setVisible(false)
						uv1.spriteGold:setVisible(false)
						uv1.text_Field:setVisible(false)
						uv1.btn_composite:setVisible(false)
						uv1.last_item:setPosition(367, 916)
					end
				end

				uv1.chose_item_list = {}
				uv1.composite_number = 0

				uv1.text_Field:setString(0)
				uv1:tabChangeView()
				uv1.bar:setPercent(0)
				uv1.bar_num:setString(0 .. "/" .. uv1.max_num)
				uv1:onChangeAutoForgeNum()
			end)
		end)
	end

	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openForgeHouseView(false)
	end, true, 2)
end

function ForgeHouseRoleTitlePanel._onClickTargetCallBack(slot0)
	if slot0.last_item_id ~= 0 then
		HeroController:openArtifactRoleTitleTipsWindow(true, slot0.last_item_id, slot0.current_lev)
	end
end

function ForgeHouseRoleTitlePanel._onClickTargetCallBack2(slot0)
	if slot0.last_item_id ~= 0 then
		HeroController:openArtifactRoleTitleTipsWindow(true, slot0.last_item_id, slot0.current_lev + 1)
	end
end

function ForgeHouseRoleTitlePanel.onChangeAutoForgeNum(slot0, slot1)
	slot2 = uv0:getPackItemNumByBid(BackPackConst.Bag_Code.BACKPACK, slot0.last_item_id)
	slot4 = {}

	for slot8, slot9 in pairs(Config.HonorData.data_artifact_compound[slot0.current_id][slot0.current_lev]) do
		table.insert(slot4, slot8)
	end

	table.sort(slot4, function (slot0, slot1)
		return slot0 < slot1
	end)

	function IsInTable(slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			if slot6 == slot0 then
				return true
			end
		end

		return false
	end

	if not slot0.item_scrollview:getItemList() then
		return
	end

	if slot1 == 1 then
		for slot9 = 1, #slot4 do
			if slot0.composite_number == slot4[slot9 + 2] then
				slot0.composite_number = slot4[slot9 + 1]

				break
			end

			if slot0.composite_number == slot4[slot9 + 1] then
				slot0.composite_number = slot4[slot9]

				break
			end

			slot0.composite_number = 0

			break
		end

		slot0.text_Field:setString(slot0.composite_number)
		slot0.bar_num:setString(slot0.composite_number .. "/" .. slot0.max_num)
		slot0.bar:setPercent(math.floor(slot0.composite_number / slot0.max_num * 100))

		if slot0.composite_number == 0 then
			slot0.chose_item_list = {}
		else
			table.remove(slot0.chose_item_list, slot0.composite_number)
		end
	elseif slot1 == 2 then
		for slot9 = 1, #slot4 do
			if slot2 < slot4[slot9] then
				return message("当前称号数量小于最低强化数量")
			end

			if slot0.composite_number == slot4[slot9] then
				slot0.composite_number = slot4[slot9 + 1]

				break
			end

			if slot0.composite_number == slot4[slot9 + 1] then
				slot0.composite_number = slot4[slot9 + 2]

				break
			end

			slot0.composite_number = slot4[slot9]

			break
		end

		slot0.text_Field:setString(slot0.composite_number)

		slot10 = "/"

		slot0.bar_num:setString(slot0.composite_number .. slot10 .. slot0.max_num)

		slot9 = math.floor

		slot0.bar:setPercent(slot9(slot0.composite_number / slot0.max_num * 100))

		for slot9, slot10 in pairs(slot5) do
			if slot5[slot9]:getData().config.effect[1].val == slot0.current_id and not IsInTable(slot11.config.id, slot0.chose_item_list) then
				table.insert(slot0.chose_item_list, slot11.config.id)
			end
		end
	end

	if slot2 == 0 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(true)
	elseif slot0.composite_number <= 0 then
		slot0:setTouchEnable_Redu(true)
		slot0:setTouchEnable_Add(false)

		slot0.chose_item_list = {}
	elseif slot0.max_num <= slot0.composite_number or slot0.composite_number == slot2 and slot2 then
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(true)
	else
		slot0:setTouchEnable_Redu(false)
		slot0:setTouchEnable_Add(false)
	end

	slot0:updateRate()
end

function ForgeHouseRoleTitlePanel.updateRate(slot0)
	if uv0[slot0.current_id][slot0.current_lev] and slot1[slot0.composite_number] then
		slot0.rate_txt:setString("成功率" .. (slot1[slot0.composite_number].rate or 0) / 10 .. "%")
		slot0.rate_txt:setVisible(true)

		slot0.compCoinNumber = slot1[slot0.composite_number].other_expend[1][2]

		slot0.gold_num:setString(MoneyTool.GetMoneyString(slot0.compCoinNumber))
		loadSpriteTexture(slot0.spriteGold, PathTool.getItemRes(Config.ItemData.data_get_data(slot1[slot0.composite_number].other_expend[1][1]).icon), LOADTEXT_TYPE)
	else
		slot0.gold_num:setString(0)
		slot0.rate_txt:setVisible(false)
	end
end

function ForgeHouseRoleTitlePanel.releaseCompositeEffect(slot0)
	if slot0.composite_effect ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.composite_effect)

		slot0.composite_effect = nil
	end
end

function ForgeHouseRoleTitlePanel.close_callback(slot0)
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
