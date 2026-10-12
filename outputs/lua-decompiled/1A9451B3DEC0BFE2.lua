HolyequipmentRefreshAttPanel = HolyequipmentRefreshAttPanel or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert

function HolyequipmentRefreshAttPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hero/holyequipment_refresh_att_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		}
	}
	slot0.is_can_save = false
	slot0.need_list = {}
	slot0.base_list_left = {}
	slot0.base_list_right = {}
	slot0.skill_list_left = {}
	slot0.skill_list_right = {}
end

function HolyequipmentRefreshAttPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("神装洗练"))

	slot2 = slot1:getChildByName("container")
	slot0.container = slot2

	slot2:getChildByName("cost_title"):setString(TI18N("消耗"))
	slot2:getChildByName("base_title_1"):setString(TI18N("基础属性"))
	slot2:getChildByName("up_title"):setString(TI18N("随机属性[洗练前]"))
	slot2:getChildByName("down_title"):setString(TI18N("随机属性[洗练后]"))

	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.score_lab = slot2:getChildByName("score_lab")

	slot0.score_lab:setString("")

	slot0.checkbox_list = {}
	slot0.is_checkbox_select = {}
	slot0.checkbox_list[1] = slot0.container:getChildByName("checkbox1")
	slot0.checkbox_list[2] = slot0.container:getChildByName("checkbox2")

	slot0.checkbox_list[1]:setSelected(false)
	slot0.checkbox_list[2]:setSelected(false)
	slot0.checkbox_list[1]:getChildByName("name"):setString(TI18N("锁定属性"))
	slot0.checkbox_list[2]:getChildByName("name"):setString(TI18N("锁定属性"))

	slot7 = slot2:getChildByName("cost_icon_1")

	slot7:setScale(0.8)

	slot8 = slot2:getChildByName("cost_icon_2")

	slot8:setScale(0.8)

	slot0.cost_icon = {
		slot7,
		slot8
	}
	slot9 = slot2:getChildByName("cost_txt_1")
	slot10 = slot2:getChildByName("cost_txt_2")

	slot9:setString("")
	slot10:setString("")

	slot0.cost_txt = {
		slot9,
		slot10
	}
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.save_btn = slot1:getChildByName("save_btn")

	slot0.save_btn:getChildByName("label"):setString(TI18N("保存"))

	slot0.reset_btn = slot1:getChildByName("reset_btn")

	slot0.reset_btn:getChildByName("label"):setString(TI18N("洗练"))

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")

	slot0.cancel_btn:getChildByName("label"):setString(TI18N("洗练"))

	slot0.pos_item = slot2:getChildByName("pos_item")
	slot0.item_node = BackPackItem.new(false, false, false)

	slot0.item_node:setPositionY(15)
	slot0.pos_item:addChild(slot0.item_node)

	slot0.tips_label = slot2:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("(已洗练至最大的属性不会下降,但在不锁定下会改变类型)"))

	slot0.checkbox_tips = createRichLabel(22, cc.c4b(255, 242, 199, 255), cc.p(1, 0.5), cc.p(638, 551), nil, nil, 380)

	slot2:addChild(slot0.checkbox_tips)

	slot0.base_att_label = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(200, 625), nil, nil, 380)
	slot14 = slot0.base_att_label

	slot2:addChild(slot14)

	slot0.random_att_up_list = {}

	for slot14 = 1, 2 do
		slot0.random_att_up_list[slot14] = slot0:createAttInfo(44, 500 - (slot14 - 1) * 48, slot2)
	end

	slot0.random_att_down_list = {}

	for slot14 = 1, 2 do
		slot0.random_att_down_list[slot14] = slot0:createAttInfo(44, 300 - (slot14 - 1) * 48, slot2)
	end

	slot0.reset_count_tips = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(20, 35), nil, nil, 380)

	slot0.main_container:addChild(slot0.reset_count_tips)
end

function HolyequipmentRefreshAttPanel.createAttInfo(slot0, slot1, slot2, slot3)
	slot4 = {
		att_label = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot1, slot2), nil, nil, 720),
		value_lable = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot1 + 300, slot2), nil, nil, 380)
	}

	slot3:addChild(slot4.att_label)
	slot3:addChild(slot4.value_lable)

	slot7 = cc.size(160, 18)
	slot4.comp_bar_bg, slot9 = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), slot7, slot3, cc.p(0.5, 0.5), slot1 + 210, slot2, true, true)
	slot4.comp_bar = slot9
	slot4.comp_bar_label = createLabel(18, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot7.width / 2, slot7.height / 2, "", slot9, 2, cc.p(0.5, 0.5))

	slot4.comp_bar_label:setString("100%")
	slot4.comp_bar_bg:setVisible(false)

	return slot4
end

function HolyequipmentRefreshAttPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClickCloseBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.reset_btn, function ()
		uv0:onClickResetBtn()
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:onClickResetBtn()
	end, true, 1)

	function slot4()
		uv0:onClickSaveBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.save_btn, slot4, slot5, 1)

	for slot4, slot5 in ipairs(slot0.checkbox_list) do
		slot5:addEventListener(function (slot0, slot1)
			playButtonSound2()
			uv0:onCheckboxSelect(uv1)
		end)
	end

	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1)
		if Config.PartnerHolyEqmData.data_const.game_rule_2 then
			TipsManager:getInstance():showCommonTips(slot2.desc, slot1:getTouchBeganPosition())
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Holy_Equipment_Update_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.data or not uv0.item_config then
			return
		end

		if slot0.partner_id and slot0.partner_id == uv0.partner_id then
			uv0:initData()
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.partner_id then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.partner_id == slot5.partner_id then
					uv0:onClickCloseBtn()
				end
			end
		end
	end)
end

function HolyequipmentRefreshAttPanel.addDataBindEvent(slot0)
	if (slot0.partner_id == nil or slot0.partner_id == 0) and slot0.data and slot0.data.Bind and slot0.item_update_event == nil then
		slot0.item_update_event = slot0.data:Bind(GoodsVo.UPDATE_GOODS_ATTR, function (slot0, slot1)
			if slot0 == "holy_eqm_attr" then
				uv0:initData()
			end
		end)
	end
end

function HolyequipmentRefreshAttPanel.onClickCloseBtn(slot0)
	uv0:openHolyequipmentRefreshAttPanel(false)
end

function HolyequipmentRefreshAttPanel.onClickResetBtn(slot0)
	if not slot0.data or not slot0.item_config then
		return
	end

	if not slot0.is_checkbox_select then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.is_checkbox_select) do
		if slot6 == true then
			uv0(slot1, {
				pos = slot5
			})
		end
	end

	uv1:sender11094(slot0.partner_id, slot0.data.id, slot1)
end

function HolyequipmentRefreshAttPanel.onClickSaveBtn(slot0)
	if not slot0.data or not slot0.item_config then
		return
	end

	uv0:sender11090(slot0.partner_id, slot0.data.id, 1)
end

function HolyequipmentRefreshAttPanel.onCheckboxSelect(slot0, slot1)
	if not slot0.checkbox_list[slot1] then
		return
	end

	if not slot0.checkbox_tips then
		return
	end

	slot0.is_checkbox_select[slot1] = slot0.checkbox_list[slot1]:isSelected()

	for slot6, slot7 in pairs(slot0.is_checkbox_select) do
		if slot7 then
			slot2 = 0 + 1
		end
	end

	if slot2 > 0 then
		slot3 = nil

		if Config.PartnerHolyEqmData.data_const.lock_pay_diamon then
			for slot8, slot9 in ipairs(slot4.val) do
				if slot2 == slot9[1] then
					slot3 = slot9[2]

					break
				end
			end

			if slot3 == nil and next(slot4.val) ~= nil then
				slot3 = slot4.val[#slot4.val][2]
			end
		end

		if slot3 ~= nil then
			slot0.checkbox_tips:setString(uv0("%s <img src='%s' scale=0.25 />: %s", TI18N("锁定共花费"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), slot3))
		else
			slot0.checkbox_tips:setString("")
		end
	else
		slot0.checkbox_tips:setString("")
	end
end

function HolyequipmentRefreshAttPanel.openRootWnd(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.item_config = slot0.data.config

	if slot0.item_config == nil then
		return
	end

	slot0.partner_id = slot2 or 0

	slot0:initData()
	slot0:addDataBindEvent()
end

function HolyequipmentRefreshAttPanel.initData(slot0)
	if not slot0.data or not slot0.item_config then
		return
	end

	slot0.item_node:setData(slot0.data)
	slot0.name_txt:setString(slot0.item_config.name)

	slot0.is_can_save = false

	for slot5, slot6 in ipairs(slot0.data.holy_eqm_attr) do
		if slot6.pos >= 100 then
			slot0.is_can_save = true
		end
	end

	slot0:setBaseAttrInfo()
	slot0:setRandomAttrInfo({
		[slot6.pos] = slot6
	})
	slot0:updateBtnShow()
	slot0:updateCostInfo()

	slot2 = 0

	for slot6, slot7 in pairs(slot0.data.extra) do
		if slot7.extra_k == 10 then
			slot2 = slot7.extra_v
		end
	end

	slot0.reset_count_tips:setString(uv0(TI18N("该装备已洗练%s次"), slot2))
end

function HolyequipmentRefreshAttPanel.getAttrInfo(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot1]] then
		slot5 = PathTool.getAttrIconByStr(slot3)

		if PartnerCalculate.isShowPerByStr(slot3) == true then
			slot2 = slot2 / 10 .. "%"
		end

		return PathTool.getResFrame("common", slot5), slot4, slot2
	end
end

function HolyequipmentRefreshAttPanel.setBaseAttrInfo(slot0)
	if not slot0.data or not slot0.data.main_attr then
		return
	end

	slot1 = slot0.data.main_attr[1] or {}
	slot2, slot3, slot4 = slot0:getAttrInfo(slot1.attr_id, slot1.attr_val)

	if slot2 then
		slot0.base_att_label:setString(uv0("<img src='%s' scale=1 /><div fontcolor=#643223> %s：%s </div><div fontcolor=#955322>(%s)</div>", slot2, slot3, slot4, TI18N("不变")))
	end
end

function HolyequipmentRefreshAttPanel.getHolyEquipScore(slot0)
	if not slot0.item_config or not slot0.item_config.ext or not slot0.item_config.ext[1] then
		return 0
	end

	slot1 = 0
	slot2 = 0
	slot3 = 0

	if Config.PartnerHolyEqmData.data_base_info(slot0.item_config.id) then
		slot1 = slot4.score
	end

	if slot0.item_config and slot0.item_config.ext and slot0.item_config.ext[1] then
		slot2 = HeroCalculate.holyEquipMentPower(slot0.item_config.ext[1][2] or {})
	end

	if slot0.data and slot0.data.holy_eqm_attr then
		slot5 = {}
		slot6 = {
			[slot11.pos] = slot11
		}

		for slot10, slot11 in pairs(slot0.data.holy_eqm_attr) do
			-- Nothing
		end

		for slot10 = 1, 2 do
			if slot6[slot10] then
				uv0(slot5, {
					Config.AttrData.data_id_to_key[slot6[slot10].attr_id],
					slot6[slot10].attr_val
				})
			end
		end

		slot3 = HeroCalculate.holyEquipMentPower(slot5)
	end

	return slot1 + slot2 + slot3
end

function HolyequipmentRefreshAttPanel.setRandomAttrInfo(slot0, slot1)
	slot3 = {}

	for slot7 = 1, 2 do
		slot8 = slot1[slot7] or {}
		slot9, slot10, slot11 = slot0:getAttrInfo(slot8.attr_id, slot8.attr_val)

		if slot9 then
			slot0.random_att_up_list[slot7].att_label:setString(uv0("<img src='%s' scale=1 /> %s：", slot9, slot10))

			slot13 = Config.AttrData.data_id_to_key[slot8.attr_id]
			slot15 = PathTool.getBarQualityBg(uv1:getHolyEquipmentQualityByItemIdAttrKey(slot0.item_config.id, slot13, slot8.attr_val))

			uv2({}, {
				slot13,
				slot8.attr_val
			})

			if slot0.random_att_up_list[slot7].record_res == nil or slot0.random_att_up_list[slot7].record_res ~= slot15 then
				slot0.random_att_up_list[slot7].record_res = slot15

				slot0.random_att_up_list[slot7].comp_bar:loadTexture(slot15, LOADTEXT_TYPE_PLIST)
			end

			slot16 = uv1:getHolyEquipmentMaxAttrByItemIdAttrKey(slot0.item_config.id, slot13)
			slot17 = slot8.attr_val * 100 / slot16

			if slot16 <= slot8.attr_val then
				slot0.random_att_up_list[slot7].value_lable:setString(uv0("<div fontcolor=%s>(max)</div>", BackPackConst.getWhiteQualityColorStr(slot14)))
			else
				slot0.random_att_up_list[slot7].value_lable:setString("")
			end

			slot0.random_att_up_list[slot7].comp_bar_bg:setVisible(true)
			slot0.random_att_up_list[slot7].comp_bar:setPercent(slot17)
			slot0.random_att_up_list[slot7].comp_bar_label:setString(slot11)
		else
			slot0.random_att_up_list[slot7].comp_bar_bg:setVisible(false)
			slot0.random_att_up_list[slot7].att_label:setString("    ----                              --                                           ---- ")
		end

		if slot8 ~= nil and next(slot8) ~= nil then
			if slot0.is_can_save then
				slot12 = slot1[slot7 + 100] or {}
				slot13, slot14, slot15 = slot0:getAttrInfo(slot12.attr_id, slot12.attr_val)

				if slot13 then
					slot0.random_att_down_list[slot7].att_label:setString(uv0("<img src='%s' scale=1 /> %s：", slot13, slot14))

					slot19 = PathTool.getBarQualityBg(uv1:getHolyEquipmentQualityByItemIdAttrKey(slot0.item_config.id, Config.AttrData.data_id_to_key[slot12.attr_id], slot12.attr_val))

					if slot0.random_att_down_list[slot7].record_res == nil or slot0.random_att_down_list[slot7].record_res ~= slot19 then
						slot0.random_att_down_list[slot7].record_res = slot19

						slot0.random_att_down_list[slot7].comp_bar:loadTexture(slot19, LOADTEXT_TYPE_PLIST)
					end

					uv2(slot3, {
						slot17,
						slot12.attr_val
					})

					slot20 = uv1:getHolyEquipmentMaxAttrByItemIdAttrKey(slot0.item_config.id, slot17)
					slot21 = slot12.attr_val * 100 / slot20

					if slot20 <= slot12.attr_val then
						slot0.random_att_down_list[slot7].value_lable:setString(uv0("<div fontcolor=%s>(max)</div>", BackPackConst.getWhiteQualityColorStr(slot18)))
					else
						slot0.random_att_down_list[slot7].value_lable:setString("")
					end

					slot0.random_att_down_list[slot7].comp_bar_bg:setVisible(true)
					slot0.random_att_down_list[slot7].comp_bar:setPercent(slot21)
					slot0.random_att_down_list[slot7].comp_bar_label:setString(slot15)
				end
			else
				slot0.random_att_down_list[slot7].att_label:setString(uv0("<img src='%s' scale=1 /> %s：", PathTool.getAttrIconByStr("random"), TI18N("随机属性")))
				slot0.random_att_down_list[slot7].value_lable:setString("? ? ?")
				slot0.random_att_down_list[slot7].comp_bar_bg:setVisible(false)
			end
		else
			slot0.random_att_down_list[slot7].comp_bar_bg:setVisible(false)
			slot0.checkbox_list[slot7]:setVisible(false)
			slot0.random_att_down_list[slot7].att_label:setString("    ----                              --")
		end
	end

	if slot3 and #slot3 > 0 then
		slot4 = HeroCalculate.holyEquipMentPower(slot2) or 0
		slot5 = HeroCalculate.holyEquipMentPower(slot3) or 0
		slot6 = 0
		slot7 = 0

		if Config.PartnerHolyEqmData.data_base_info(slot0.item_config.id) then
			slot6 = slot8.score
		end

		if slot0.item_config and slot0.item_config.ext and slot0.item_config.ext[1] then
			slot7 = HeroCalculate.holyEquipMentPower(slot0.item_config.ext[1][2] or {})
		end

		slot0.score_lab:setString(uv0(TI18N("评分：%d(%s)"), slot9, slot5 + slot6 + slot7 - (slot4 + slot6 + slot7) > 0 and "+" .. slot10 or "" .. slot10))
	else
		slot0.score_lab:setString(TI18N("评分：? ? ?"))
	end
end

function HolyequipmentRefreshAttPanel.updateBtnShow(slot0)
	slot0.reset_btn:setVisible(not slot0.is_can_save)
	slot0.save_btn:setVisible(slot0.is_can_save)
	slot0.cancel_btn:setVisible(slot0.is_can_save)
end

function HolyequipmentRefreshAttPanel.updateCostInfo(slot0)
	if not slot0.data or not slot0.item_config then
		return
	end

	if Config.PartnerHolyEqmData.data_base_info(slot0.item_config.id) and slot1.reset_price and next(slot1.reset_price) ~= nil then
		for slot5 = 1, 2 do
			slot8 = slot0.cost_txt[slot5]

			if slot1.reset_price[slot5] then
				slot10 = slot6[2]

				if Config.ItemData.data_get_data(slot6[1]) then
					slot0.cost_icon[slot5]:loadTexture(PathTool.getItemRes(slot11.icon), LOADTEXT_TYPE)

					slot12 = BackpackController:getInstance():getModel():getItemNumByBid(slot9)

					slot8:setString(MoneyTool.GetMoneyString(slot12) .. "/" .. MoneyTool.GetMoneyString(slot10))

					if slot10 <= slot12 then
						slot8:setTextColor(cc.c3b(255, 246, 228))
					else
						slot8:setTextColor(cc.c3b(253, 71, 71))
					end
				end
			else
				slot8:setString("")
			end
		end
	end
end

function HolyequipmentRefreshAttPanel.close_callback(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	if slot0.item_update_event ~= nil then
		slot0.data:UnBind(slot0.item_update_event)

		slot0.item_update_event = nil
	end

	uv0:openHolyequipmentRefreshAttPanel(false)
end
