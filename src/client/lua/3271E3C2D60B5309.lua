BackPackItem = class("BackPackItem", function ()
	return ccui.Layout:create()
end)
BackPackItem.Width = 119
BackPackItem.Height = 119
slot0 = RoleController:getInstance():getRoleVo()

function BackPackItem.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.is_other = slot1
	slot0.click = slot2

	if slot0.click == nil then
		slot0.click = true
	end

	slot0.is_show_tips = slot6 or false
	slot0.scale = slot4 or 1
	slot0.swallow_touch = slot7

	if slot5 == nil then
		slot5 = true
	end

	slot0.effect = slot5
	slot0.show_check_box = false
	slot0.forgehouse_select = false
	slot0.star_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("backpack/goods_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(slot0.click)
	slot0:setCascadeOpacityEnabled(true)

	if slot0.scale ~= 1 then
		slot0:setScale(slot0.scale)
	end

	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width / 2, slot0.size.height / 2)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.background = slot0.main_container:getChildByName("background")
	slot0.item_icon = slot0.main_container:getChildByName("icon")
	slot0.num_label = slot0.main_container:getChildByName("num")

	slot0.num_label:setString("")

	slot0.num_bg = slot0.main_container:getChildByName("num_bg")
	slot0.num_bg_size = slot0.num_bg:getContentSize()

	slot0.num_bg:setLocalZOrder(20)
	slot0.num_label:setLocalZOrder(21)

	slot0.background_res_id = PathTool.getQualityBg(0)

	slot0:registerEvent()
end

function BackPackItem.getBackground(slot0)
	return slot0.background
end

function BackPackItem.getRoot(slot0)
	return slot0.main_container
end

function BackPackItem.getSize(slot0)
	return slot0.size
end

function BackPackItem.getData(slot0)
	return slot0.data
end

function BackPackItem.createSpriteRedPoint(slot0)
	if not slot0.redpoint then
		slot0.redpoint = createSprite(PathTool.getResFrame("common", "common_1014"), 102, 101, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 10)

		slot0.redpoint:setVisible(false)
	end
end

function BackPackItem.setVisibleResPoint(slot0, slot1)
	if slot0.redpoint then
		slot0.redpoint:setVisible(slot1)
	end
end

function BackPackItem.createSpriteMask(slot0)
	if not slot0.mask_imsge then
		slot0.mask_imsge = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90019"), slot0.main_container:getContentSize().width / 2, slot0.main_container:getContentSize().height / 2, cc.p(0.5, 0.5), true, 10, true)

		slot0.mask_imsge:setVisible(false)
		slot0.mask_imsge:setContentSize(cc.size(BackPackItem.Width, BackPackItem.Height))
	end
end

function BackPackItem.setMaskVisible(slot0, slot1)
	if slot0.mask_imsge then
		slot0.mask_imsge:setVisible(slot1)
	end
end

function BackPackItem.setSelected(slot0, slot1)
	if not slot0.select_bg and slot1 == false then
		return
	end

	if not slot0.select_bg then
		slot0.select_bg = createImage(slot0.main_container, PathTool.getSelectBg(), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, nil, true)

		slot0.select_bg:setContentSize(cc.size(slot0.Width, slot0.Height))
	end

	slot0.select_bg:setVisible(slot1)
end

function BackPackItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function BackPackItem.updateScale(slot0, slot1)
	slot0.scale = slot1 or 1
end

function BackPackItem.addLongTimeTouchCallback(slot0, slot1)
	slot0:setLongTimeTouchEffect(true)

	slot0.long_time_callback = slot1
end

function BackPackItem.setLongTimeTouchEffect(slot0, slot1)
	slot0.have_long_time_effect = slot1
end

function BackPackItem.registerEvent(slot0)
	if slot0.click == true then
		slot0:setTouchEnabled(true)
		slot0:addTouchEventListener(function (slot0, slot1)
			if uv0.effect == true then
				customClickAction_2(uv0.main_container, slot1)
			end

			if slot1 == ccui.TouchEventType.ended then
				if uv0.have_long_time_effect then
					if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
						doStopAllActions(uv0.background)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
						return
					end
				end

				uv0.touch_end = slot0:getTouchEndPosition()
				slot2 = true

				if uv0.touch_began ~= nil then
					slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
				end

				if slot2 == true then
					playButtonSound2()

					if uv0.btn_call_fun then
						uv0:btn_call_fun()
					else
						if uv0.is_show_tips and uv0.data ~= nil then
							slot3 = uv0.data.bid or uv0.data.base_id or uv0.data.id
							slot4 = 0

							if uv0.item_config then
								slot4 = uv0.item_config.type
							end

							if BackPackConst.checkIsEquip(slot4) then
								HeroController:getInstance():openEquipTips(true, uv0.data)
							elseif BackPackConst.checkoutIsWeekCard(slot4) then
								TipsManager:getInstance():showWeekCardTips(true, uv0.item_config)
							elseif BackPackConst.checkIsHeroSkin(slot4) then
								HeroController:getInstance():openHeroSkinTipsPanel(true, uv0.item_config)
							elseif BackPackConst.checkIsElfin(slot4) then
								TipsManager:getInstance():showElfinTips(slot3)
							else
								slot5 = nil
								slot5 = (not uv0.data.config or uv0.data.config) and Config.ItemData.data_get_data(slot3)

								if uv0.is_show_source == true and slot5.source and next(slot5.source) then
									BackpackController:getInstance():openTipsSource(true, slot5)
								elseif uv0.is_tips_source then
									TipsManager:getInstance():showGoodsTips(slot5, true, uv0.is_tips_source)
								else
									TipsManager:getInstance():showGoodsTips(slot5)
								end

								if uv0.source_callback then
									uv0:source_callback()
								end
							end

							return
						end

						if uv0.callback then
							uv0:callback(uv0)
						end
					end

					if slot0.guide_call_back ~= nil then
						slot0:guide_call_back()
					end
				end
			elseif slot1 == ccui.TouchEventType.moved then
				if uv0.have_long_time_effect and uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					slot3 = slot0:getTouchMovePosition()

					if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
						doStopAllActions(uv0.background)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					end
				end
			elseif slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()

				if uv0.have_long_time_effect then
					doStopAllActions(uv0.background)

					uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

					delayRun(uv0.background, 0.6, function ()
						if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE and uv0.long_time_callback then
							uv0.long_time_callback()
						end

						uv0.long_touch_type = LONG_TOUCH_END_TYPE
					end)
				end
			elseif slot1 == ccui.TouchEventType.canceled and uv0.have_long_time_effect and uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
				doStopAllActions(uv0.background)

				uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
			end
		end)

		if slot0.swallow_touch == false then
			slot0:setSwallowTouches(slot0.swallow_touch)
		end
	end

	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			-- Nothing
		elseif slot0 == "exit" and uv0.data then
			if uv0.item_update_event ~= nil then
				uv0.data:UnBind(uv0.item_update_event)

				uv0.item_update_event = nil
			end

			uv0.data = nil
		end
	end)
end

function BackPackItem.setExtendData(slot0, slot1)
	if type(slot1) == "table" then
		if slot1.showCheckBox ~= nil then
			slot0.show_check_box = slot1.showCheckBox
		elseif slot1.scale ~= nil then
			slot0:setScale(slot1.scale)
		end

		if slot1.adjustCheckBoxPos ~= nil then
			slot0.check_box_pos = slot1.adjustCheckBoxPos
		end

		if slot1.checkBoxClickCallBack ~= nil then
			slot0.click_check_callback = slot1.checkBoxClickCallBack
		end

		if slot1.red_point ~= nil then
			slot0.is_check_red = true

			slot0:checkRedPoint()
		end

		if slot1.show_use_target ~= nil then
			slot0.show_use_target = slot1.show_use_target
		end

		if slot1.is_hide_effect then
			slot0.is_hide_effect = slot1.is_hide_effect
		end

		if slot1.is_show_tips ~= nil then
			slot0.is_show_tips = slot1.is_show_tips
		end

		if slot1.show_extend_gemstone ~= nil then
			slot0.show_extend_gemstone = slot1.show_extend_gemstone
		end

		if slot1.is_other ~= nil then
			slot0.is_other = slot1.is_other
		end

		if slot1.is_start ~= nil then
			slot0.is_start = slot1.is_start
		end

		if slot1.is_camptype ~= nil then
			slot0.is_camptype = slot1.is_camptype
		end

		if slot1.is_comp_num ~= nil then
			slot0.is_comp_num = slot1.is_comp_num
		end
	end
end

function BackPackItem.setSelfNum(slot0, slot1)
	if slot0.is_comp_num == true then
		if Config.PartnerData.data_get_compound_info[slot0.item_config.id] then
			if slot2[slot0.item_config.id].num <= slot1 then
				slot0:showRedPoint(true)
			else
				slot0:showRedPoint(false)
			end

			slot0:showCompNumber(slot1, slot2[slot0.item_config.id].num)
		end

		if BackpackController:getModel():getHallowsCompData(slot0.item_config.id).num then
			if slot3.num <= slot1 then
				slot0:showRedPoint(true)
			else
				slot0:showRedPoint(false)
			end

			slot0:showCompNumber(slot1, slot3.num)
		end
	else
		slot1 = slot1 or 0

		slot0.num_label:setVisible(slot1 > 1)
		slot0.num_bg:setVisible(slot1 > 1)

		if slot1 > 1 then
			slot0.num_label:setString(MoneyTool.GetMoneyString(slot1))
			slot0:updateNumBGSize()
		end
	end
end

function BackPackItem.setSelfEquip(slot0, slot1, slot2, slot3)
	if slot0:checkIsEquip(slot1) == true then
		slot0:setEquipJie(true)
		slot0:setEnchantLev(slot2)
	elseif slot0.data.type == BackPackConst.item_type.NORMAL and slot0.data.sub_type == BackPackConst.item_tab_type.HERO then
		slot0:setEquipJie(true)
	else
		slot0:setEquipJie(false)
		slot0:setEnchantLev(0)
	end
end

function BackPackItem.setSelfEffect(slot0, slot1)
	if not slot0.is_hide_effect == true then
		if slot1 and slot1.is_effect and slot1.is_effect >= 1 then
			slot2 = slot1.is_effect
			slot3 = PlayerAction.action
			slot4 = 1

			if slot1.is_effect == 1 then
				slot2 = 156
				slot3 = PlayerAction.action_2

				if slot1.quality >= 4 then
					slot3 = PlayerAction.action_1
				end
			end

			slot0.item_icon:setVisible(true)

			if slot2 >= 1671 and slot2 <= 1674 then
				slot4 = 0.7608695652173914
			elseif slot2 == 354 then
				slot4 = 0.7

				slot0.item_icon:setVisible(false)
			end

			slot0:showItemEffect(true, slot2, slot3, true, slot4)
		else
			slot0:showItemEffect(false)
			slot0.item_icon:setVisible(true)
		end
	else
		slot0:showItemEffect(false)
		slot0.item_icon:setVisible(true)
	end
end

function BackPackItem.setItemIcon(slot0, slot1)
	slot0.item_icon:setVisible(true)

	if slot0.record_head_icon == nil or slot0.record_head_icon ~= slot1 then
		slot0.record_head_icon = slot1

		loadSpriteTexture(slot0.item_icon, slot1, LOADTEXT_TYPE)
	end
end

function BackPackItem.setSelfBackground(slot0, slot1)
	slot0:setBackgroundRes(PathTool.getQualityBg(slot1 or 0))
end

function BackPackItem.setBackgroundRes(slot0, slot1)
	if slot0.background_res_id ~= slot1 then
		slot0.background_res_id = slot1

		slot0.background:loadTexture(slot0.background_res_id, LOADTEXT_TYPE_PLIST)
	end
end

function BackPackItem.setBackgroundOpacity(slot0, slot1)
	if slot0.background then
		slot0.background:setOpacity(slot1)
	end
end

function BackPackItem.setBaseData(slot0, slot1, slot2, slot3)
	if slot1 == nil then
		slot0:suspendAllActions()

		return
	end

	if Config.ItemData.data_get_data(slot1) == nil then
		return
	end

	slot0.data = slot4
	slot0.item_config = slot4

	slot0.item_icon:setVisible(true)

	slot5 = PathTool.getItemRes(slot4.icon, false)

	if slot0.record_head_icon == nil or slot0.record_head_icon ~= slot5 then
		slot0.record_head_icon = slot5

		loadSpriteTexture(slot0.item_icon, slot5, LOADTEXT_TYPE)
	end

	if slot0.item_config.type == BackPackConst.item_type.HOME_PET_TREASURE then
		slot0.item_icon:setScale(0.82)
	end

	slot0:isChipSprite(slot4)
	slot0:setEquipJie(true)
	slot0:setSelfNum(slot2)
	slot0:setSelfBackground(slot4.quality)
	slot0:setSelfEquip(slot4.type, 0, true)
	slot0:setSelfEffect(slot4)
	slot0:isShowStart(slot4.type, slot4.eqm_jie)
	slot0:isShowStep(slot4.type)
	slot0:isShowCamp(slot4.sub_type, slot4.lev)
	slot0:setGodHolyEquipmentUI(true, slot4)
end

function BackPackItem.setData(slot0, slot1, slot2)
	if slot0.data and slot0.item_update_event ~= nil then
		slot0.data:UnBind(slot0.item_update_event)

		slot0.item_update_event = nil
		slot0.data = nil
	end

	slot0.data = slot1
	slot3 = nil
	slot0.is_hide_effect = slot2 or false

	if slot0.data then
		slot3 = slot0.data.id or slot0.data.bid
	end

	if slot0.camp_icom then
		slot0.camp_icom:setVisible(false)
	end

	if slot0.data == nil or slot3 == nil then
		slot0:suspendAllActions()
	else
		slot4 = nil

		if ((slot0.data.config ~= nil or Config.ItemData.data_get_data(slot3)) and slot0.data.config) == nil then
			return
		end

		slot0.item_config = slot4

		slot0:setName("item_" .. slot4.id)
		slot0.item_icon:setVisible(true)

		slot5 = PathTool.getItemRes(slot4.icon, false)

		if slot0.record_head_icon == nil or slot0.record_head_icon ~= slot5 then
			slot0.record_head_icon = slot5

			loadSpriteTexture(slot0.item_icon, slot5, LOADTEXT_TYPE)
		end

		if slot0.item_config.type == BackPackConst.item_type.HOME_PET_TREASURE then
			slot0.item_icon:setScale(0.82)
		end

		slot0:isChipSprite(slot4)
		slot0:setSelfNum(slot0.data.quantity)
		slot0:setSelfBackground(slot4.quality)
		slot0:setSelfEquip(slot4.type, slot1.enchant, true)
		slot0:setArtifactStars()
		slot0:isShowStart(slot4.type, slot4.eqm_jie)
		slot0:isShowStep(slot4.type)
		slot0:isShowCamp(slot4.sub_type, slot4.lev)
		slot0:setGodHolyEquipmentUI(true, slot4)

		if slot0.data.showSellStatus ~= nil then
			slot0:setCheckBoxStatus(slot0.data.showSellStatus.status, slot0.data.showSellStatus.select)
		end

		slot0:setSelfEffect(slot4)

		if slot0.is_check_red == true then
			slot0:checkRedPoint()
		end

		slot0:showUseTag(false)

		if slot0.show_use_target == true and slot0.data and slot0.data.config and slot0.data.config.tips_btn then
			if slot0:checkIsUse(slot0.data.config.tips_btn) == 2 and (slot0.data.expire_time or 0) - GameNet:getInstance():getTime() <= 0 then
				slot0:showUseTag(true, slot6)
			end
		end

		if slot0.data and slot0.data.bid then
			slot0:setWeekCardData(slot0.data.bid)
		end
	end

	slot0:addVoBindEvent()
end

function BackPackItem.setWeekCardData(slot0, slot1)
	if Config.ItemData.data_get_data(slot1) and slot2.tips_btn and slot0:checkIsWeekCard(slot2.tips_btn) == 50 then
		slot0:showWeekCardTag(true)
	end
end

function BackPackItem.setGodHolyEquipmentUI(slot0, slot1, slot2)
	if slot1 then
		if not slot2 then
			return
		end

		if slot2.sub_type == BackPackConst.item_tab_type.HOLYEQUIPMENT then
			if slot0.holy_equipment_bg == nil then
				slot5 = cc.size(109, 37)
				slot0.holy_equipment_bg = cc.Layer:create()

				slot0.holy_equipment_bg:setContentSize(slot5)
				slot0.holy_equipment_bg:setAnchorPoint(cc.p(0.5, 0.5))
				slot0.holy_equipment_bg:setPosition(BackPackItem.Width * 0.5, slot5.height * 0.5)
				slot0.main_container:addChild(slot0.holy_equipment_bg, 0)

				slot0.holy_equipment_img = createImage(slot0.holy_equipment_bg, PathTool.getResFrame("common", "common_90085"), 0, 0, cc.p(0.5, 0.5), true, 0, false)
				slot0.holy_equipment_star_label = createLabel(20, cc.c4b(249, 232, 206, 255), cc.c4b(67, 38, 22, 255), -1, 0, "", slot0.holy_equipment_bg, 2, cc.p(0.5, 0.5))
				slot0.holy_equipment_jie_label = createLabel(20, cc.c4b(249, 232, 206, 255), cc.c4b(67, 38, 22, 255), 50, 80, "", slot0.holy_equipment_bg, 2, cc.p(1, 0.5))
				slot0.suit_icon = createImage(slot0.holy_equipment_bg, nil, -35, 76, cc.p(0.5, 0.5), true, 0, false)
			else
				slot0.holy_equipment_bg:setVisible(true)
			end

			if slot2.eqm_star > 5 then
				slot0.holy_equipment_img:setVisible(true)
				slot0.holy_equipment_star_label:setVisible(true)

				if slot0.holy_equipment_star_label then
					slot0.holy_equipment_star_label:setString(slot2.eqm_star)
				end
			else
				slot0.holy_equipment_img:setVisible(false)
				slot0.holy_equipment_star_label:setVisible(false)
				slot0:setStarCount(true, slot2.eqm_star)
			end

			if slot0.holy_equipment_jie_label then
				if BackPackConst.holyequip_jie_name[slot2.eqm_jie] then
					slot0.holy_equipment_jie_label:setString(BackPackConst.holyequip_jie_name[slot2.eqm_jie])
				else
					slot0.holy_equipment_jie_label:setString(BackPackConst.holyequip_jie_name[0])
				end
			end

			if slot2.eqm_set and Config.PartnerHolyEqmData.data_suit_res_prefix_fun(math.floor(slot2.eqm_set / 100)) then
				if slot0.suit_icon then
					slot0.suit_icon:loadTexture(PathTool.getSuitRes(slot4.prefix), LOADTEXT_TYPE)
				end
			end
		elseif slot0.holy_equipment_bg then
			slot0.holy_equipment_bg:setVisible(false)
		end
	else
		if slot0.holy_equipment_bg then
			slot0.holy_equipment_bg:setVisible(false)
		end

		slot0:setStarCount(false)
	end
end

function BackPackItem.setSuitShopStar(slot0, slot1, slot2)
	if slot1 then
		if slot0.suit_shop_bg == nil then
			slot5 = cc.size(109, 37)
			slot0.suit_shop_bg = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90085"), BackPackItem.Width * 0.5, slot5.height * 0.5, cc.p(0.5, 0.5), true, 0, false)
			slot0.suit_shop_star_label = createLabel(20, cc.c4b(249, 232, 206, 255), cc.c4b(67, 38, 22, 255), slot5.width * 0.5 - 1, slot5.height * 0.5, "", slot0.suit_shop_bg, 2, cc.p(0.5, 0.5))
		end

		if slot2 > 5 then
			slot0.suit_shop_bg:setVisible(true)
			slot0.suit_shop_star_label:setVisible(true)

			if slot0.suit_shop_star_label then
				slot0.suit_shop_star_label:setString(slot2)
			end
		else
			slot0.suit_shop_bg:setVisible(false)
			slot0.suit_shop_star_label:setVisible(false)
			slot0:setStarCount(true, slot2)
		end
	else
		if slot0.suit_shop_bg then
			slot0.suit_shop_bg:setVisible(false)
		end

		slot0:setStarCount(false)
	end
end

function BackPackItem.isShowStart(slot0, slot1, slot2)
	if slot1 == BackPackConst.item_type.PARTNER_DEBRIS and not slot0.is_start then
		slot0:setEquipJie(true)
	end
end

function BackPackItem.isShowStep(slot0, slot1)
	if slot1 == BackPackConst.item_type.ELFIN then
		slot0:setElfinStep(true)
	elseif slot0.elfin_step_list then
		for slot5, slot6 in ipairs(slot0.elfin_step_list) do
			slot6:setVisible(false)
		end
	end
end

function BackPackItem.isShowCamp(slot0, slot1, slot2)
	if slot1 == 3 and not slot0.is_camptype and slot2 ~= 0 then
		slot0:initCamp(slot2)
	elseif slot0.camp_icom then
		slot0.camp_icom:setVisible(false)
	end
end

function BackPackItem.initCamp(slot0, slot1)
	if not slot0.camp_icom then
		slot0.camp_icom = createSprite("", 21, 97, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)

		slot0.camp_icom:setScale(0.7)
	end

	if slot0.camp_icom then
		slot0.camp_icom:setVisible(true)
		loadSpriteTexture(slot0.camp_icom, PathTool.getHeroCampTypeIcon(slot1), LOADTEXT_TYPE_PLIST)
	end
end

function BackPackItem.isChipSprite(slot0, slot1)
	if slot1.type == BackPackConst.item_type.PARTNER_DEBRIS then
		if not slot0.chipSprite then
			slot0.chipSprite = createSprite("", 97, 97, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
		end

		if slot0.chipSprite then
			slot0.chipSprite:setVisible(true)
			loadSpriteTexture(slot0.chipSprite, PathTool.getResFrame("common", "common_90055"), LOADTEXT_TYPE_PLIST)
		end
	elseif slot0.chipSprite then
		slot0.chipSprite:setVisible(false)
	end
end

function BackPackItem.createCompLayer(slot0)
	if not slot0.compLayer then
		slot0.compLayer = cc.Layer:create()

		slot0.compLayer:setContentSize(107, 19)
		slot0.main_container:addChild(slot0.compLayer)
		slot0.compLayer:setPosition(5, -24)
		slot0.compLayer:setVisible(false)

		slot3, slot0.camp_progress_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), cc.size(107, 19), slot0.compLayer, cc.p(0, 0.5), 0, slot0.compLayer:getContentSize().height / 2, true, true)
		slot0.text_bar = createLabel(18, Config.ColorData.data_color4[1], nil, slot0.compLayer:getContentSize().width / 2, slot0.compLayer:getContentSize().height / 2, "0/0", slot0.compLayer, nil, cc.p(0.5, 0.5))
	end
end

function BackPackItem.setLockStatus(slot0, slot1)
	slot2 = false

	if slot1 == BackPackConst.item_type.ARTIFACTCHIPS then
		-- Nothing
	end

	if slot2 == true then
		if not slot0.lock_icon then
			slot0.lock_icon = createSprite(PathTool.getResFrame("common", "common_lock"), slot0.size.width - 5, slot0.size.height - 5, slot0.main_container, cc.p(1, 1), LOADTEXT_TYPE_PLIST)
		end

		if slot0.lock_icon then
			slot0.lock_icon:setVisible(true)
		end
	elseif slot0.lock_icon then
		slot0.lock_icon:setVisible(false)
	end
end

function BackPackItem.setMagicIcon(slot0, slot1)
	if slot1 == true then
		if not slot0.magic_icon then
			slot0.magic_icon = createSprite(PathTool.getResFrame("common", "txt_cn_common_90021"), 5, slot0.size.height - 5, slot0.main_container, cc.p(0, 1), LOADTEXT_TYPE_PLIST)
		end

		if slot0.magic_icon then
			slot0.magic_icon:setVisible(true)
		end
	elseif slot0.magic_icon then
		slot0.magic_icon:setVisible(false)
	end
end

function BackPackItem.showCompNumber(slot0, slot1, slot2)
	slot0:createCompLayer()
	slot0.compLayer:setVisible(true)
	slot0.camp_progress_bar:setPercent(math.floor(slot1 / slot2 * 100))
	slot0.text_bar:setString(slot1 .. "/" .. slot2)
end

function BackPackItem.addVoBindEvent(slot0)
	if slot0.data and slot0.data.config ~= nil and slot0.data.id ~= nil and slot0.data.Bind and slot0.item_update_event == nil then
		slot0.item_update_event = slot0.data:Bind(GoodsVo.UPDATE_GOODS_ATTR, function (slot0, slot1)
			if slot0 == "showSellStatus" then
				uv0:setCheckBoxStatus(slot1.status or false, slot1.select or false)
			elseif slot0 == "enchant" then
				if uv0:checkIsEquip(uv0.data.config.type) == true then
					uv0:setEnchantLev(slot1)
					uv0:setEquipJie(true)
				end

				uv0:setArtifactStars()
			elseif slot0 == "quantity" then
				uv0:setSelfNum(uv0.data.quantity)
			end

			if uv0.is_check_red == true then
				uv0:checkRedPoint()
			end
		end)
	end
end

function BackPackItem.setChangeCallback(slot0, slot1)
	slot0.change_callback = slot1
end

function BackPackItem.checkIsUse(slot0, slot1)
	slot2 = 0

	if slot1 then
		for slot6, slot7 in ipairs(slot1) do
			if slot7 == 2 then
				slot2 = slot7

				break
			end
		end
	end

	return slot2
end

function BackPackItem.checkIsWeekCard(slot0, slot1)
	slot2 = 0

	if slot1 then
		for slot6, slot7 in ipairs(slot1) do
			if slot7 == 50 then
				slot2 = slot7

				break
			end
		end
	end

	return slot2
end

function BackPackItem.checkRedPoint(slot0)
end

function BackPackItem.showEquipName(slot0, slot1, slot2)
	if (slot1 or 0) <= 0 and not slot0.equip_name then
		return
	end

	if not slot0.equip_name then
		slot0.equip_name = createLabel(24, cc.c4b(207, 190, 169, 255), cc.c4b(86, 37, 18, 255), slot0.Width / 2, slot0.Height / 2, "", slot0.main_container, 1, cc.p(0.5, 0.5))
	end

	slot0.equip_name:setString(Config.ItemData.data_item_type[slot1] or "")
	slot0.equip_name:setVisible(slot2)
end

function BackPackItem.showNumLabel(slot0, slot1)
	slot1 = slot1 or false

	if slot0.num_label then
		slot0.num_label:setVisible(slot1)
		slot0.num_bg:setVisible(slot1)
	end
end

function BackPackItem.setNumFontSize(slot0, slot1)
	if slot0.num_label and slot1 then
		slot0.num_label:setFontSize(slot1)
		slot0:updateNumBGSize()
	end
end

function BackPackItem.checkIsEquip(slot0, slot1)
	if (slot1 or 0) >= 1 and slot1 <= 4 then
		return true
	end

	return false
end

function BackPackItem.setNeedNum(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = false

	if (slot1 or 0) > 0 or slot4 == true then
		slot6 = true
	end

	slot7 = slot1

	if slot2 then
		slot3 = slot2 < slot1 and 127 or 1
		slot7 = MoneyTool.GetMoneyString(slot2) .. "/" .. MoneyTool.GetMoneyString(slot1)
	end

	slot0.num_label:setString(slot7)

	if slot3 and Config.ColorData.data_color4[slot3] then
		slot0.num_label:setTextColor(Config.ColorData.data_color4[slot3])
	end

	if slot5 and Config.ColorData.data_color4[slot5] then
		slot0.num_label:enableOutline(Config.ColorData.data_color4[slot5], 2)
	end

	slot0.num_label:setVisible(slot6)
	slot0.num_bg:setVisible(slot6)
	slot0:updateNumBGSize()
end

function BackPackItem.setNeedNum2(slot0, slot1, slot2, slot3, slot4, slot5)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	slot6 = 125
	slot7 = 35

	if slot4 then
		slot6 = slot4.x
		slot7 = slot4.y
	end

	if slot0.need_num_bg == nil then
		slot0.need_num_bg = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_90005"), slot6, slot7, cc.p(0, 0.5), true, 0, true)

		slot0.need_num_bg:setContentSize(slot5 or cc.size(170, 36))
		slot0.need_num_bg:setCapInsets(cc.rect(12, 10, 1, 1))
	end

	if slot0.need_num_label == nil then
		slot0.need_num_label = createLabel(22, cc.c4b(255, 246, 228, 255), nil, slot6 + 10, slot7, "", slot0.root_wnd, nil, cc.p(0, 0.5))
	end

	slot8 = nil
	slot8 = slot2 and MoneyTool.GetMoneyString(slot2) .. "/" .. slot1 or slot1

	if slot3 and Config.ColorData.data_color4[slot9] then
		slot0.need_num_label:setTextColor(Config.ColorData.data_color4[slot9])
	end

	slot0.need_num_label:setString(slot8)
end

function BackPackItem.setEnchantLev(slot0, slot1)
	if (slot1 or 0) <= 0 then
		if not tolua.isnull(slot0.enchant_label) then
			slot0.enchant_label:setVisible(false)
		end

		return
	end

	if not slot0.enchant_label then
		slot0.enchant_label = createLabel(24, cc.c4b(255, 244, 117, 255), cc.c4b(86, 37, 18, 255), 108, 84, "", slot0.main_container, 1, cc.p(1, 0))
	end

	slot0.enchant_label:setString("+" .. slot1)
	slot0.enchant_label:setVisible(slot1 > 0)
end

function BackPackItem.setGemstoneLev(slot0, slot1)
	slot0:setEnchantLev(0)

	if slot1 <= 0 then
		if not tolua.isnull(slot0.gemstone_label) then
			slot0.gemstone_label:setVisible(false)
		end
	else
		if not slot0.gemstone_label then
			slot0.gemstone_label = createLabel(22, Config.ColorData.data_color4[1], cc.c4b(0, 0, 0, 255), 108, 34, "", slot0.main_container, 1, cc.p(1, 0))
		end

		slot0.gemstone_label:setString("Lv." .. slot1)
		slot0.gemstone_label:setVisible(true)
	end
end

function BackPackItem.setEquipJie(slot0, slot1)
	if slot1 == false and not slot0.equip_star_list then
		return
	end

	slot2 = nil

	if slot0.data then
		slot2 = slot0.data.id or slot0.data.bid
	end

	slot3 = nil

	if slot2 then
		slot3 = (slot0.data.config ~= nil or Config.ItemData.data_get_data(slot2)) and slot0.data.config
	end

	if not slot3 then
		return
	end

	slot4 = 0

	if slot1 == true then
		slot5 = false

		if slot0:checkIsEquip(slot3.type) == true then
			slot4 = slot3.eqm_star
		elseif slot3.type == BackPackConst.item_type.PARTNER_DEBRIS then
			slot4 = slot3.eqm_jie
		elseif slot3.type == BackPackConst.item_type.ARTIFACTCHIPS then
			slot4 = slot0.data.enchant or 0
		elseif slot3.type == BackPackConst.item_type.NORMAL and slot3.sub_type == BackPackConst.item_tab_type.HERO then
			slot4 = slot0.data.eqm_jie or slot3.eqm_jie or 0
		end
	end

	slot0:setStarCount(true, slot4)
end

function BackPackItem.setStarCount(slot0, slot1, slot2)
	if slot0.equip_star_list then
		for slot6, slot7 in ipairs(slot0.equip_star_list) do
			slot7:setVisible(false)
		end
	end

	if slot1 then
		if slot0.equip_star_list == nil then
			slot0.equip_star_list = {}
		end

		slot3 = 12
		slot4 = slot0.size.width * 0.5 - slot2 * slot3 * 0.5 + slot3 * 0.5

		for slot8 = 1, slot2 do
			if not slot0.equip_star_list[slot8] then
				slot10 = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90074"), 0, 0, cc.p(0.5, 0.5), true, 0, false)

				slot10:setScale(1)

				slot0.equip_star_list[slot8] = slot10
			end

			slot0.equip_star_list[slot8]:setVisible(true)
			slot0.equip_star_list[slot8]:setPosition(slot4 + (slot8 - 1) * slot3, 15)
		end
	end
end

function BackPackItem.setElfinStep(slot0, slot1)
	if slot1 == false and not slot0.elfin_step_list then
		return
	end

	slot2 = nil

	if slot0.data then
		slot2 = slot0.data.id or slot0.data.bid
	end

	slot3 = nil

	if slot2 then
		slot3 = (slot0.data.config ~= nil or Config.ItemData.data_get_data(slot2)) and slot0.data.config
	end

	if slot0.elfin_step_list then
		for slot7, slot8 in ipairs(slot0.elfin_step_list) do
			slot8:setVisible(false)
		end
	end

	if not slot3 then
		return
	end

	if slot0.elfin_step_list == nil then
		slot0.elfin_step_list = {}
	end

	slot4 = 0

	if slot1 == true then
		slot4 = slot3.eqm_jie or 0
	end

	slot5 = 15
	slot6 = slot0.size.width * 0.5 - slot4 * slot5 * 0.5 + slot5 * 0.5

	for slot10 = 1, slot4 do
		if not slot0.elfin_step_list[slot10] then
			slot0.elfin_step_list[slot10] = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90032"), 0, 0, cc.p(0.5, 0.5), true, 0, false)
		end

		slot0.elfin_step_list[slot10]:setVisible(true)
		slot0.elfin_step_list[slot10]:setPosition(slot6 + (slot10 - 1) * slot5, 10)
	end
end

function BackPackItem.createStar(slot0, slot1)
	if slot0.star_node == nil then
		slot0.star_node = cc.Node:create()

		slot0.star_node:setPosition(slot0.size.width * 0.5, 20)
		slot0.main_container:addChild(slot0.star_node)
	end

	slot0.star_setting = HeroController:getInstance():getModel():createStar(slot1 or 0, slot0.star_node, slot0.star_setting, 17)
end

function BackPackItem.setEquipLev(slot0, slot1, slot2, slot3, slot4)
	slot2 = slot2 or 1
	slot3 = slot3 or 20
	slot4 = slot4 or cc.p(60, -10)

	if (slot1 or 0) <= 0 then
		if slot0.lev_label then
			slot0.lev_label:setVisible(false)
		end

		return
	end

	if not slot0.lev_label then
		slot0.lev_label = createLabel(slot3, 175, nil, slot4.x, slot4.y, "", slot0.main_container, 1, cc.p(0.5, 0.5))

		slot0.lev_label:setScale(1 / slot2)
	end

	slot0.lev_label:setString("LV." .. slot1)
	slot0.lev_label:setVisible(true)
end

function BackPackItem.showArtifactLock(slot0, slot1)
	if slot1 == false and not slot0.artifact_lock then
		return
	end

	if not slot0.artifact_lock then
		slot0.artifact_lock = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_90009"), 60, 60, cc.p(0.5, 0.5), true, 1, false)
	end

	slot0.artifact_lock:setVisible(slot1)
end

function BackPackItem.showArtifactLabel(slot0, slot1, slot2)
	slot2 = slot2 or ""

	if not slot0.lock_label then
		slot0.lock_label = createLabel(24, cc.c4b(207, 190, 169, 255), cc.c4b(86, 37, 18, 255), 60, 12, "", slot0.main_container, 1, cc.p(0.5, 0))
	end

	slot0.lock_label:setString(slot2)
	slot0.lock_label:setVisible(slot1)
end

function BackPackItem.showOrderWarLock(slot0, slot1, slot2)
	if slot1 == false and not slot0.order_war_lock then
		return
	end

	if not slot0.order_war_lock then
		slot3 = slot2 or cc.p(7, 97)
		slot0.order_war_lock = createSprite(PathTool.getResFrame("common", "common_90009"), slot3.x, slot3.y, slot0.root_wnd, cc.p(0.5, 0.5))
	end

	slot0.order_war_lock:setVisible(slot1)
end

function BackPackItem.IsGetStatus(slot0, slot1, slot2, slot3)
	slot2 = slot2 or 150

	if slot1 == false and not slot0.is_get_select then
		return
	end

	if not slot0.is_get_select then
		slot0.is_get_select = ccui.Layout:create()

		slot0.is_get_select:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.is_get_select:setContentSize(slot0.size)
		slot0.is_get_select:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot0.is_get_select:setTouchEnabled(false)
		showLayoutRect(slot0.is_get_select, slot2)
		createSprite(slot3 or PathTool.getResFrame("common", "common_1043"), 60, 60, slot0.is_get_select, cc.p(0.5, 0.5))
		slot0:addChild(slot0.is_get_select)
	end

	slot0.is_get_select:setVisible(slot1)
end

function BackPackItem.showAddIcon(slot0, slot1)
	if slot1 == false and not slot0.add_btn then
		return
	end

	if not slot0.add_btn then
		slot0.add_btn = createSprite(PathTool.getResFrame("common", "common_90026"), 60, 60, slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 10)
	end

	slot0.add_btn:setVisible(slot1)
end

function BackPackItem.addBtnCallBack(slot0, slot1)
	slot0.btn_call_fun = slot1
end

function BackPackItem.setCheckBoxStatus(slot0, slot1, slot2)
	if slot0.show_check_box == false then
		return
	end

	if slot1 == false then
		if slot0.check_box ~= nil then
			slot0.check_box:setVisible(false)
		end
	elseif slot0.check_box == nil then
		slot0.check_box = ccui.CheckBox:create(PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1043"), PathTool.getResFrame("common", "common_1044"), PathTool.getResFrame("common", "common_1043"), LOADTEXT_TYPE_PLIST)

		if slot0.check_box_pos then
			slot0.check_box:setPosition(slot0.check_box_pos)
		else
			slot0.check_box:setPosition(25, 25)
		end

		slot0.main_container:addChild(slot0.check_box)
		slot0.check_box:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.began then
				uv0.check_box_status = uv0.check_box:isSelected()
			elseif slot1 == ccui.TouchEventType.ended then
				if uv0.data ~= nil and uv0.data.id ~= nil and uv0.data.showSellStatus then
					uv0.data:setGoodsAttr("showSellStatus", {
						status = true,
						select = uv0.check_box:isSelected()
					})

					if uv0.click_check_callback then
						uv0.click_check_callback(uv0.check_box:isSelected(), uv0)
					end
				end
			elseif slot1 == ccui.TouchEventType.canceled then
				uv0.check_box:setSelected(uv0.check_box_status or false)
			end
		end)
	else
		slot0.check_box:setVisible(true)
	end

	if slot2 == nil then
		slot2 = false
	end

	if not tolua.isnull(slot0.check_box) then
		slot0.check_box:setSelected(slot2)
	end
end

function BackPackItem.adjustCheckBoxPos(slot0, slot1)
	slot0.check_box:setPosition(slot1)
end

function BackPackItem.showBiaoQian(slot0, slot1, slot2)
	if not slot0.qian_icon then
		slot0.qian_icon = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90015"), 37, 86, cc.p(0.5, 0.5), true, 10, true)
		slot0.qian_label = createLabel(20, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], 29, 25, "", slot0.qian_icon, 2, cc.p(0.5, 0))

		slot0.qian_label:setRotation(-45)
	end

	slot0.qian_icon:setVisible(slot1)
	slot0.qian_label:setString(slot2 or "")
end

function BackPackItem.showRightBiaoQian(slot0, slot1, slot2)
	if not slot0.right_icon then
		slot0.right_icon = createImage(slot0.main_container, PathTool.getResFrame("common", "common_30013"), 88, 86, cc.p(0.5, 0.5), true, 10, true)

		slot0.right_icon:setRotation(90)

		slot0.right_label = createLabel(20, Config.ColorData.data_color4[1], Config.ColorData.data_color4[214], 27, 49, "", slot0.right_icon, 2, cc.p(0.5, 0.5))

		slot0.right_label:setRotation(-45)
	end

	slot0.right_icon:setVisible(slot1)
	slot0.right_label:setString(slot2 or "")
end

function BackPackItem.showLeftBiaoQian(slot0, slot1, slot2)
	if not slot0.left_icon then
		slot0.left_icon = createImage(slot0.main_container, PathTool.getResFrame("common", "common_30012"), 30, 88, cc.p(0.5, 0.5), true, 10, true)
		slot0.left_label = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(143, 29, 11, 255), 23, 42, "", slot0.left_icon, 2, cc.p(0.5, 0.5))

		slot0.left_label:setRotation(-45)
	end

	slot0.left_icon:setVisible(slot1)
	slot0.left_label:setString(slot2 or "")
end

function BackPackItem.setGoodsName(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not slot1 then
		return
	end

	slot4 = slot4 or 156
	slot8 = Config.ColorData.data_color4[156]

	if not slot0.goods_name then
		slot0.goods_name = createLabel(slot3 or 24, (type(slot4) ~= "number" or Config.ColorData.data_color4[slot4]) and slot4, slot5, slot0.Width / 2, -30, "", slot0.root_wnd, 2, cc.p(0.5, 0))

		slot0.goods_name:setScale(1 / (slot6 or 1))
	end

	slot0.goods_name:setString(slot1 or "")

	if slot2 then
		slot0.goods_name:setPosition(slot2)
	end
end

function BackPackItem.showItemQualityName(slot0, slot1)
	if slot1 == true then
		if not slot0.quality_name_bg then
			slot0.quality_name_bg = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90010"), slot0.size.width * 0.5, -5, cc.p(0.5, 1), true, nil, true)

			slot0.quality_name_bg:setContentSize(cc.size(128, 37))

			slot0.quality_name_txt = createLabel(20, 1, nil, 64, 18.5, "", slot0.quality_name_bg, nil, cc.p(0.5, 0.5))
		end

		if slot0.item_config then
			slot0.quality_name_txt:setString(slot0.item_config.name)
			slot0.quality_name_txt:setTextColor(BackPackConst.getWhiteQualityColorC4B(slot0.item_config.quality))
		end
	elseif slot0.quality_name_bg then
		slot0.quality_name_bg:setVisible(false)
	end
end

function BackPackItem.setGrayIcon(slot0, slot1)
	if slot1 == false and not slot0.gray_bg then
		return
	end

	if not slot0.gray_bg then
		slot0.gray_bg = createImage(slot0.main_container, PathTool.getResFrame("common", "common_1073"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 0, true)

		slot0.gray_bg:setContentSize(slot0.size.width, slot0.size.height)
	end

	slot0.gray_bg:setVisible(slot1)
end

function BackPackItem.changeSelectStatus(slot0, slot1, slot2)
end

function BackPackItem.getSellSelectStatus(slot0)
	if not slot0.sell_select then
		return false
	end

	return slot0.sell_select:isVisible()
end

function BackPackItem.showNoticeTips(slot0, slot1, slot2)
	if slot1 == false then
		slot0:showRedPoint(false)
		slot0:showUpgradeIcon(false)
	else
		slot0:showRedPoint(slot2 == 1)
		slot0:showUpgradeIcon(slot2 == 2)
	end
end

function BackPackItem.showRedPoint(slot0, slot1)
	if not slot0.red_point and slot1 == false then
		return
	end

	if not slot0.red_point then
		slot0.red_point = createImage(slot0, PathTool.getResFrame("common", "common_1014"), 84, 84, cc.p(0, 0), true, 10, false)
	end

	slot0.red_point:setVisible(slot1)
end

function BackPackItem.showUpgradeIcon(slot0, slot1)
	if not slot0.upgrade_icon and slot1 == false then
		return
	end

	if not slot0.upgrade_icon then
		slot0.upgrade_icon = createImage(slot0, PathTool.getResFrame("common", "common_1086"), 84, 8, cc.p(0, 0), true, 10, false)
	end

	slot0.upgrade_icon:setVisible(slot1)

	if slot1 then
		breatheShineAction4(slot0.upgrade_icon)
	else
		doStopAllActions(slot0.upgrade_icon)
	end
end

function BackPackItem.setDoubleIcon(slot0, slot1)
	if slot1 == false then
		if slot0.double_icon then
			slot0.double_icon:setVisible(false)
		end
	else
		if slot0.double_icon == nil then
			slot0.double_icon = createSprite(PathTool.getResFrame("common", "txt_cn_common_90008"), 0, 119, slot0, cc.p(0, 1), LOADTEXT_TYPE_PLIST, 20)
		end

		slot0.double_icon:setVisible(true)
	end
end

function BackPackItem.showGainTag(slot0, slot1, slot2)
	if not slot0.tag_point and slot1 == false then
		return
	end

	if not slot0.tag_point then
		slot0.tag_point = createImage(slot0, PathTool.getResFrame("common", "common_30012"), 0, 119, cc.p(0, 1), true, 10, false)
		slot0.tag_label = createLabel(18, 1, cc.c4b(135, 24, 0, 255), 29, 32, TI18N("必得"), slot0.tag_point, 1, cc.p(0.5, 0))

		slot0.tag_label:setRotation(-45)
		slot0.tag_point:setScale(1 / (slot2 or 1))
	end

	slot0.tag_point:setVisible(slot1)
end

function BackPackItem.setFirstIcon(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.first_icon then
			slot0.first_icon:setVisible(false)
		end
	else
		slot2 = slot2 or 1

		if slot0.first_icon == nil then
			slot0.first_icon = createSprite(PathTool.getResFrame("common", "txt_cn_common_90018"), 120, 120, slot0, cc.p(1, 1), LOADTEXT_TYPE_PLIST, 20)
		end

		slot0.first_icon:setVisible(true)
		slot0.first_icon:setScale(1 / slot2)
	end
end

function BackPackItem.setReceivedIcon(slot0, slot1)
	if slot1 == false then
		if slot0.received_icon then
			slot0.received_icon:setVisible(false)
		end

		slot0:setItemIconUnEnabled(false)
	else
		if slot0.received_icon == nil then
			slot0.received_icon = createSprite(PathTool.getResFrame("common", "common_1000"), BackPackItem.Width / 2, BackPackItem.Height / 2, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 20)
		end

		slot0.received_icon:setVisible(true)
		slot0:setItemIconUnEnabled(true)
		setChildUnEnabled(false, slot0.received_icon)
	end
end

function BackPackItem.setReceivedIcon1(slot0, slot1)
	if slot1 == false then
		if slot0.lay_received then
			slot0.lay_received:setVisible(false)
		end
	elseif slot0.lay_received == nil then
		slot0.lay_received = ccui.Layout:create()

		slot0.lay_received:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.lay_received:setContentSize(cc.size(slot0.size.width - 4, slot0.size.height - 4))
		slot0.lay_received:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot0.lay_received:setTouchEnabled(false)
		showLayoutRect(slot0.lay_received, 60)
		createImage(slot0.lay_received, PathTool.getResFrame("mainui", "mainui_1037"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 0, false)
		slot0:addChild(slot0.lay_received)
	else
		slot0.lay_received:setVisible(true)
	end
end

function BackPackItem.setGotIcon(slot0, slot1)
	if slot1 == false then
		if slot0.got_icon then
			slot0.got_icon:setVisible(false)
		end
	else
		if slot0.got_icon == nil then
			slot0.got_icon = createImage(slot0, PathTool.getResFrame("common", "common_1074"), BackPackItem.Width / 2, BackPackItem.Height / 2, cc.p(0.5, 0.5), true, 20, true)

			slot0.got_icon:setContentSize(cc.size(BackPackItem.Width, BackPackItem.Height))

			slot2 = createSprite(PathTool.getResFrame("common", "txt_cn_common_get"), BackPackItem.Width / 2, BackPackItem.Height / 2, slot0.got_icon, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 20)
		end

		slot0.got_icon:setVisible(true)
	end
end

function BackPackItem.showUseTag(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot3 = slot3 or 1

		if not slot0.use_ponit then
			slot0.use_ponit = createImage(slot0.main_container, PathTool.getResFrame("common", "txt_cn_common_30015"), 55, 122, cc.p(0, 1), true, 10, false)
		end

		if slot0.use_ponit and not tolua.isnull(slot0.use_ponit) then
			slot0.use_ponit:loadTexture(slot4, LOADTEXT_TYPE_PLIST)
			slot0.use_ponit:setVisible(slot1)
		end
	elseif slot0.use_ponit and not tolua.isnull(slot0.use_ponit) then
		slot0.use_ponit:removeAllChildren()
		slot0.use_ponit:removeFromParent()

		slot0.use_ponit = nil
	end
end

function BackPackItem.showWeekCardTag(slot0, slot1)
	if slot1 == true then
		if not slot0.use_week_card then
			slot0.use_week_card = createSprite(PathTool.getResFrame("common", "txt_cn_common_90023"), 0, 115, slot0.main_container, cc.p(0, 1), LOADTEXT_TYPE_PLIST, 10)
		end

		if slot0.use_week_card and not tolua.isnull(slot0.use_week_card) then
			loadSpriteTexture(slot0.use_week_card, slot2, LOADTEXT_TYPE_PLIST)
			slot0.use_week_card:setVisible(slot1)
		end
	elseif slot0.use_week_card and not tolua.isnull(slot0.use_week_card) then
		slot0.use_week_card:removeAllChildren()
		slot0.use_week_card:removeFromParent()

		slot0.use_week_card = nil
	end
end

function BackPackItem.showDoubleTag(slot0, slot1, slot2)
	if not slot0.double_ponit then
		slot0.double_ponit = createImage(slot0.main_container, PathTool.getResFrame("common", "common_30012"), 0, 119, cc.p(0, 1), true, 10, false)
		slot0.use_ponit_label = createLabel(18, 1, cc.c4b(135, 24, 0, 255), 29, 32, TI18N("双倍"), slot0.tag_point, 1, cc.p(0.5, 0))

		slot0.use_ponit_label:setRotation(-45)
	end

	if slot0.double_ponit and not tolua.isnull(slot0.double_ponit) then
		slot0.double_ponit:setVisible(slot1)
	end

	if slot0.num_label and not tolua.isnull(slot0.num_label) then
		if slot1 == true then
			slot0.num_label:setVisible(true)
			slot0.num_label:setString(slot2 * 2)
			slot0.num_bg:setVisible(true)
			slot0:updateNumBGSize()
		else
			if slot2 <= 1 then
				slot0.num_label:setVisible(false)
				slot0.num_bg:setVisible(false)
			end

			slot0.num_label:setString(slot2)
			slot0:updateNumBGSize()
		end
	end
end

function BackPackItem.showFlagByRes(slot0, slot1, slot2, slot3, slot4)
	if slot1 == true then
		if slot0.flag_icon == nil then
			slot0.flag_icon = createImage(slot0.main_container, slot2, slot3 or -9, slot4 or 126, cc.p(0, 1), true, 10, false)
		end

		if slot0.flag_icon and not tolua.isnull(slot0.flag_icon) then
			slot0.flag_icon:setVisible(slot1)
		end
	elseif slot0.flag_icon then
		slot0.flag_icon:setVisible(false)
	end
end

function BackPackItem.showTagIcon(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot3 = slot3 or 1
		slot4 = PathTool.getResFrame("common", "common_30013")
		slot5 = ""
		slot6 = cc.c4b(142, 43, 0, 255)

		if slot2 == 1 then
			slot4 = PathTool.getResFrame("common", "common_30013")
			slot5 = TI18N("已领悟")
			slot6 = cc.c4b(142, 43, 0, 255)
		end

		if not slot0.tag_icon then
			slot0.tag_icon = createSprite(slot4, 31, 87, slot0.main_container, cc.p(0.5, 0.5))
			slot0.tab_label = createLabel(18, Config.ColorData.data_color4[1], cc.c4b(149, 15, 0, 255), 25, 87, "", slot0.main_container, 2, cc.p(0.5, 0))

			if slot3 == 1 then
				slot0.tab_label:setRotation(-45)
				slot0.tag_icon:setPosition(cc.p(31, 87))
				slot0.tab_label:setPosition(cc.p(25, 87))
			elseif slot3 == 2 then
				slot0.tag_icon:setScaleX(-1)
				slot0.tab_label:setRotation(45)
				slot0.tag_icon:setPosition(cc.p(88, 87))
				slot0.tab_label:setPosition(cc.p(91, 89))
			end
		else
			loadSpriteTexture(slot0.tag_icon, slot4, LOADTEXT_TYPE_PLIST)
		end

		slot0.tab_label:setString(slot5)
		slot0.tab_label:enableOutline(slot6, 2)
		slot0.tag_icon:setVisible(true)
		slot0.tab_label:setVisible(true)
	else
		if slot0.tag_icon then
			slot0.tag_icon:setVisible(false)
		end

		if slot0.tab_label then
			slot0.tab_label:setVisible(false)
		end
	end
end

function BackPackItem.showExtendTag(slot0, slot1, slot2, slot3)
	if not slot1 then
		if slot0.extend_tag then
			slot0.extend_tag:setVisible(false)
		end
	else
		if slot0.extend_tag == nil then
			if slot3 == nil then
				slot0.extend_tag = createImage(slot0.main_container, PathTool.getResFrame("common", "common_30012"), 0, 119, cc.p(0, 1), true, 10, false)
				slot0.extend_tag_desc = createLabel(18, 1, cc.c4b(135, 24, 0, 255), 29, 32, "", slot0.extend_tag, 1, cc.p(0.5, 0))
			else
				slot0.extend_tag = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90016"), 0, 119, cc.p(0, 1), true, 10, false)
				slot0.extend_tag_desc = createLabel(18, 1, cc.c4b(2, 106, 2, 255), 26, 46, "", slot0.extend_tag, 1, cc.p(0.5, 0.5))

				slot0.extend_tag_desc:disableEffect(cc.LabelEffect.OUTLINE)
			end

			slot0.extend_tag_desc:setRotation(-45)
		end

		slot0.extend_tag:setVisible(true)
		slot0.extend_tag_desc:setString(slot2)
	end
end

function BackPackItem.holidHeroExpeditTag(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.heroExpeditTag then
			slot0.heroExpeditTag:setVisible(slot1)
		end
	else
		if slot0.heroExpeditTag == nil then
			slot0.heroExpeditTag = createSprite(PathTool.getResFrame("common", "common_90081"), 90, 88, slot0.main_container, cc.p(0.5, 0.5))
			slot0.heroExpeditTag_desc = createLabel(16, 1, cc.c4b(175, 35, 58, 255), 46, 48, "", slot0.heroExpeditTag, 2, cc.p(0.5, 0.5))

			slot0.heroExpeditTag_desc:setRotation(45)
		end

		slot0.heroExpeditTag:setVisible(slot1)
		slot0.heroExpeditTag_desc:setString(slot2)
	end
end

function BackPackItem.setGemStoneList(slot0, slot1)
	if slot1 == nil and slot0.gemstone_container then
		slot0.gemstone_container:setVisible(false)
	end
end

function BackPackItem.setNum(slot0, slot1)
	if slot1 > 0 then
		slot0.num_label:setVisible(true)
		slot0.num_label:setString(slot1)
		slot0.num_bg:setVisible(true)
		slot0:updateNumBGSize()
	else
		slot0.num_label:setVisible(false)
		slot0.num_bg:setVisible(false)
	end
end

function BackPackItem.setNum2(slot0, slot1)
	slot0.num_label:setVisible(true)
	slot0.num_label:setString(slot1)
	slot0.num_bg:setVisible(true)
	slot0:updateNumBGSize()

	slot2 = 1

	if slot1 <= 0 then
		slot2 = 127
	end

	if slot2 and Config.ColorData.data_color4[slot2] then
		slot0.num_label:setTextColor(Config.ColorData.data_color4[slot2])
	end

	if outcolor and Config.ColorData.data_color4[outcolor] then
		slot0.num_label:enableOutline(Config.ColorData.data_color4[outcolor], 2)
	end
end

function BackPackItem.updateNumBGSize(slot0)
	if slot0.num_label:getContentSize().width < 30 then
		slot2 = 21
	end

	slot0.num_bg:setContentSize(cc.size(slot2 + 6, slot0.num_bg_size.height))
end

function BackPackItem.setSpecialNum(slot0, slot1)
	if not tolua.isnull(slot0.num_label) then
		slot0.num_label:setVisible(true)
		slot0.num_label:setString(slot1)
		slot0.num_bg:setVisible(true)
		slot0:updateNumBGSize()
	end
end

function BackPackItem.setSpecialColor(slot0, slot1)
	if not tolua.isnull(slot0.num_label) then
		if slot1 == true then
			slot0.num_label:setTextColor(Config.ColorData.data_color4[240])
		else
			slot0.num_label:setTextColor(Config.ColorData.data_color4[1])
		end
	end
end

function BackPackItem.setShowNumBg(slot0, slot1)
	slot0.num_bg:setVisible(slot1)
end

function BackPackItem.setDefaultTip(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		slot1 = true
	end

	slot0.is_show_tips = slot1
	slot0.is_show_source = slot2 or false
	slot0.source_callback = slot3
	slot0.is_tips_source = slot4
end

function BackPackItem.update(slot0)
end

function BackPackItem.effectHandler(slot0)
end

function BackPackItem.showItemEffect(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == true then
		slot5 = slot5 or 1
		slot6 = Config.EffectData.data_effect_info[slot2]

		if slot0.record_effect_res == nil or slot0.record_effect_res ~= slot6 then
			slot0:clearPlayEffect()

			slot0.record_effect_res = slot6
			slot7 = BackPackItem.Width * 0.5
			slot8 = BackPackItem.Height * 0.5

			if slot2 == 354 then
				slot8 = 51
			end

			slot0.play_effect = createEffectSpine(slot6, cc.p(slot7, slot8), cc.p(0.5, 0.5), slot4, slot3)

			slot0.play_effect:setScale(slot5)
			slot0.main_container:addChild(slot0.play_effect, 1)
		end
	else
		slot0:clearPlayEffect()
	end
end

function BackPackItem.clearPlayEffect(slot0)
	if slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
		slot0.record_effect_res = nil
	end
end

function BackPackItem.setEffectLocalZOrder(slot0, slot1)
	if slot0.play_effect then
		slot0.play_effect:setLocalZOrder(slot1)
	end
end

function BackPackItem.setExtendDesc(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot1 == false then
		if slot0.extend_desc then
			slot0.extend_desc:setVisible(false)
		end

		if slot0.extend_bg then
			slot0.extend_bg:setVisible(false)
		end
	else
		if not slot0.extend_desc then
			slot0.extend_desc = createRichLabel(26, 178, cc.p(0.5, 1), cc.p(60, -5))

			slot0.main_container:addChild(slot0.extend_desc, 1)
		end

		if slot5 then
			if not slot0.extend_bg then
				slot0.extend_bg = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90003"), 60, -18, cc.p(0.5, 0.5), true, 0, true)

				slot0.extend_bg:setCapInsets(cc.rect(20, 15, 1, 1))
				slot0.extend_bg:setContentSize(cc.size(177, 33))
			else
				slot0.extend_bg:setVisible(true)
			end
		elseif slot0.extend_bg then
			slot0.extend_bg:setVisible(false)
		end

		slot8 = nil

		if slot2 == nil and slot0.data then
			slot8 = (not slot0.data.config or BackPackConst.quality_color_id[slot0.data.config.quality or 0]) and BackPackConst.quality_color_id[slot0.data.quality or 0]
		end

		slot3 = slot3 or slot8 or 178
		slot6 = slot6 or 26

		if StringUtil.getStrLen(slot2) > 14 then
			slot6 = 20
		end

		slot0.extend_desc:setString((slot4 ~= nil or string.format("<div fontcolor=%s fontsize=%d >%s</div>", tranformC3bTostr(slot3), slot6, slot2)) and string.format("<div fontcolor=%s fontsize=%d outline=1,%s >%s</div>", tranformC3bTostr(slot3), slot6, tranformC3bTostr(slot4), slot2))
		slot0.extend_desc:setVisible(true)
	end
end

function BackPackItem.setArtifactStars(slot0)
	slot1 = 0

	if slot0.data and slot0.data.config and slot0.data.config.type == BackPackConst.item_type.ARTIFACTCHIPS and slot0.data.enchant and slot0.data.enchant > 0 then
		slot1 = slot0.data.enchant or 0
	end

	slot0:setEquipJie(true)
end

function BackPackItem.playItemSound(slot0)
	if slot0.item_sound ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.item_sound)
	end

	slot0.item_sound = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_get02", false)
end

function BackPackItem.clearInfo(slot0)
	slot0:suspendAllActions()
	slot0:removeFromParent()
end

function BackPackItem.suspendAllActions(slot0)
	if slot0.data and slot0.item_update_event ~= nil then
		slot0.data:UnBind(slot0.item_update_event)

		slot0.item_update_event = nil
	end

	if slot0.use_ponit and not tolua.isnull(slot0.use_ponit) then
		slot0.use_ponit:removeAllChildren()
		slot0.use_ponit:removeFromParent()

		slot0.use_ponit = nil
	end

	slot0:showRedPoint(false)
	slot0:showAddIcon(false)
	slot0:setEnchantLev(0)
	slot0:setEquipJie(false)
	slot0:setElfinStep(false)
	slot0:showUseTag(false)
	slot0:showWeekCardTag(false)
	slot0:setSelfBackground(0)
	slot0:setMagicIcon(false)
	slot0:showItemQualityName(false)
	slot0.num_label:setVisible(false)
	slot0.num_bg:setVisible(false)
	slot0.item_icon:setVisible(false)

	if slot0.chipSprite then
		slot0.chipSprite:setVisible(false)
	end

	if slot0.camp_icom then
		slot0.camp_icom:setVisible(false)
	end

	if slot0.compLayer then
		slot0.compLayer:setVisible(false)
	end

	slot0:setGodHolyEquipmentUI(false)
	slot0:setSuitShopStar(false)
	slot0:clearPlayEffect()
	slot0:setCheckBoxStatus(false, false)

	slot0.data = nil
end

function BackPackItem.setItemIconUnEnabled(slot0, slot1)
	setChildUnEnabled(slot1, slot0.main_container)

	if slot0.num_label then
		setChildUnEnabled(false, slot0.num_label)
	end

	if slot0.add_btn then
		setChildUnEnabled(false, slot0.add_btn)
	end
end

function BackPackItem.setIsShowBackground(slot0, slot1)
	slot0.background:setVisible(slot1)
end

function BackPackItem.setSummonNumber(slot0, slot1)
	if not slot0.summon_text then
		slot0.summon_text = createLabel(22, cc.c4b(234, 181, 80, 255), nil, 62, -15, "", slot0.main_container, nil, cc.p(0.5, 0.5))
	end

	slot0.summon_text:setString(slot1 .. "%")
end

function BackPackItem.grayStatus(slot0, slot1, slot2, slot3)
	slot2 = slot2 or 150

	if slot1 == false and not slot0.gray_bg then
		return
	end

	if not slot0.gray_bg then
		slot0.gray_bg = ccui.Layout:create()

		slot0.gray_bg:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.gray_bg:setContentSize(slot0.size)
		slot0.gray_bg:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot0.gray_bg:setTouchEnabled(false)
		showLayoutRect(slot0.gray_bg, slot2)

		slot0.gray_text = createLabel(24, 1, cc.c4b(133, 20, 20, 255), slot0.gray_bg:getContentSize().width / 2, slot0.gray_bg:getContentSize().height / 2, slot3, slot0.gray_bg, 2, cc.p(0.5, 0.5))

		slot0:addChild(slot0.gray_bg)
	end

	slot0.gray_bg:setVisible(slot1)
end

function BackPackItem.setBoxSelected(slot0, slot1)
	if slot1 then
		if slot0.box_select == nil then
			slot0.box_select = createImage(slot0, PathTool.getResFrame("stronger", "stronger_3"), slot0.size.width / 2, slot0.size.height / 2 - 10, cc.p(0.5, 0.5), true)

			slot0.box_select:setScale(1.25)
		else
			slot0.box_select:setVisible(true)
		end
	elseif slot0.box_select then
		slot0.box_select:setVisible(false)
	end
end

function BackPackItem.showStrTips(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.tips_img == nil then
			slot0.tips_img = createImage(slot0.main_container, PathTool.getResFrame("common", "common_1035"), 60, 62, cc.p(0.5, 0.5), true, 0, true)

			slot0.tips_img:setCapInsets(cc.rect(20, 15, 1, 1))
			slot0.tips_img:setContentSize(cc.size(80, 33))

			slot6 = slot3 or {}
			slot0.tips_text = createLabel(slot6.font_size or 26, slot6.color or cc.c3b(0, 255, 0), nil, slot4.width / 2, slot4.height / 2, slot2, slot0.tips_img, nil, cc.p(0.5, 0.5))
		else
			slot0.tips_img:setVisible(true)

			if slot0.tips_text and slot2 then
				slot0.tips_text:setString(slot2)
			end
		end
	elseif slot0.tips_img then
		slot0.tips_img:setVisible(false)
	end
end

function BackPackItem.DeleteMe(slot0)
	if slot0.data then
		if slot0.item_update_event ~= nil then
			slot0.data:UnBind(slot0.item_update_event)

			slot0.item_update_event = nil
		end

		slot0.data = nil
	end

	slot0:clearPlayEffect()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
