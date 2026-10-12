HeroExhibitionItem = class("HeroExhibitionItem", function ()
	return ccui.Layout:create()
end)
HeroExhibitionItem.Width = 119
HeroExhibitionItem.Height = 119
slot0 = HeroExpeditController:getInstance():getModel()

function HeroExhibitionItem.ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.scale = 1

	if slot1 and type(slot1) == "number" then
		slot0.scale = slot1
	end

	slot0.can_click = slot2

	if slot0.can_click == nil then
		slot0.can_click = true
	end

	if slot4 == nil then
		slot4 = true
	end

	slot0.can_effect = slot4
	slot0.click_delay = slot3 or 0
	slot0.last_click_time = 0
	slot0.star_list = {}
	slot0.star_list2 = {}
	slot0.star10 = nil
	slot0.star_label = nil
	slot0.from_type = HeroConst.ExhibitionItemType.eNone
	slot0.size = cc.size(HeroExhibitionItem.Width, HeroExhibitionItem.Height)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(true)

	if slot5 then
		slot0:setSwallowTouches(false)
	end

	slot0:setCascadeOpacityEnabled(true)

	if type(slot0.scale) == "number" and slot0.scale ~= 1 then
		slot0:setScale(slot0.scale)
	end

	slot0.background = createImage(slot0, PathTool.getResFrame("common", "common_1005"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, false)
	slot0.head_icon = createImage(slot0, nil, slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), false, 1, false)
	slot0.num_label = createLabel(24, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], 107, 81, "", slot0, 2, cc.p(1, 0))

	slot0.num_label:setZOrder(3)
	slot0.num_label:setVisible(false)
	slot0:initPartnerType()

	slot0.star_con = ccui.Widget:create()

	slot0.star_con:setZOrder(3)
	slot0.star_con:setPosition(cc.p(slot0.size.width * 0.5, 20))
	slot0:addChild(slot0.star_con)
	slot0:registerEvent()
end

function HeroExhibitionItem.setExtendData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.scale = slot1.scale or 1

	slot0:setScale(slot0.scale)

	slot0.can_click = slot1.can_click

	if slot0.can_click == nil then
		slot0.can_click = true
	end

	slot0:initPartnerType()

	slot0.from_type = slot1.from_type or HeroConst.ExhibitionItemType.eNone
	slot0.boold_type = slot1.boold_type or nil
	slot0.click_delay = slot1.click_delay or 0
	slot0.hide_star = slot1.hide_star or false
	slot0.pos_id = slot1.pos_id
	slot0.extend_info = slot1
end

function HeroExhibitionItem.getExtendData(slot0)
	return slot0.extend_info or {}
end

function HeroExhibitionItem.initPartnerType(slot0)
	if slot0.partner_type == nil then
		slot0.partner_type = createSprite(PathTool.getPartnerTypeIcon(hero_type), 19, 100, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)

		slot0.partner_type:setVisible(false)
		slot0.partner_type:setScale(0.6)
	end
end

function HeroExhibitionItem.getSize(slot0)
	return slot0.size
end

function HeroExhibitionItem.getData(slot0)
	return slot0.data
end

function HeroExhibitionItem.showFightIcon(slot0, slot1)
	if not slot0.data then
		return
	end

	if slot0.data.is_in_form and slot0.data.is_in_form > 0 and slot1 == true and not slot0.form_icon then
		slot0.form_icon = createImage(slot0, PathTool.getResFrame("common", "txt_cn_common_90001"), 90, 85, cc.p(0, 0), true, 0, false)
	end

	if slot0.form_icon then
		slot0.form_icon:setVisible(slot0.data.is_in_form > 0 and slot1)
	end
end

function HeroExhibitionItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function HeroExhibitionItem.clickFun(slot0)
	if slot0.callback then
		slot0:callback(slot0.data)
	end
end

function HeroExhibitionItem.addLongTimeTouchCallback(slot0, slot1)
	slot0:setLongTimeTouchEffect(true)

	slot0.long_time_callback = slot1
end

function HeroExhibitionItem.setLongTimeTouchEffect(slot0, slot1)
	slot0.have_long_time_effect = slot1
end

function HeroExhibitionItem.registerEvent(slot0)
	if slot0.can_click == true then
		slot0:addTouchEventListener(function (slot0, slot1)
			if uv0.can_effect then
				customClickAction_2(uv0, slot1, uv0.scale)
			end

			if slot1 == ccui.TouchEventType.began then
				if uv0.have_long_time_effect then
					uv0.touch_began = slot0:getTouchBeganPosition()

					doStopAllActions(uv0.background)

					uv0.long_touch_type = LONG_TOUCH_BEGAN_TYPE

					delayRun(uv0.background, 0.6, function ()
						if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
							if uv0.long_time_callback then
								uv0.long_time_callback()
							elseif uv0.data then
								if uv0.from_type == HeroConst.ExhibitionItemType.ePlanes then
									if uv0.data.flag == 1 then
										PlanesafkController:getInstance():sender28623(uv0.data.partner_id)
									elseif HeroController:getInstance():getModel():getHeroById(uv0.data.partner_id) then
										HeroController:getInstance():openHeroTipsPanel(true, slot0)
									end
								elseif uv0.from_type == HeroConst.ExhibitionItemType.eEndLessHero and uv0.data.is_endless then
									LookController:getInstance():sender11061(uv0.data.rid, uv0.data.srv_id, uv0.data.id)
								else
									HeroController:getInstance():openHeroTipsPanel(true, uv0.data)
								end
							end
						end

						uv0.long_touch_type = LONG_TOUCH_END_TYPE
					end)
				end
			elseif slot1 == ccui.TouchEventType.moved then
				if uv0.have_long_time_effect and uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
					slot3 = slot0:getTouchMovePosition()

					if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
						doStopAllActions(uv0.background)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					end
				end
			elseif slot1 == ccui.TouchEventType.ended then
				if uv0.have_long_time_effect then
					if uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
						doStopAllActions(uv0.background)

						uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
					elseif uv0.long_touch_type == LONG_TOUCH_END_TYPE then
						return
					end
				end

				if uv0:checkItemClickDelayTime() then
					playButtonSound2()
					uv0:clickFun()

					if slot0.guide_call_back ~= nil then
						slot0:guide_call_back()
					end
				end
			elseif slot1 == ccui.TouchEventType.canceled and uv0.have_long_time_effect and uv0.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
				doStopAllActions(uv0.background)

				uv0.long_touch_type = LONG_TOUCH_CANCEL_TYPE
			end
		end)
	end

	slot0:registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			-- Nothing
		elseif slot0 == "exit" then
			uv0:unBindEvent()
		end
	end)
end

function HeroExhibitionItem.checkItemClickDelayTime(slot0)
	if slot0.click_delay and slot0.click_delay > 0 then
		if math.abs(GameNet:getInstance():getTimeFloat() - slot0.last_click_time) < slot0.click_delay then
			return false
		else
			slot0.last_click_time = GameNet:getInstance():getTimeFloat()

			return true
		end
	else
		return true
	end
end

function HeroExhibitionItem.unBindEvent(slot0)
	if slot0.data then
		if slot0.item_update_event ~= nil then
			slot0.data:UnBind(slot0.item_update_event)

			slot0.item_update_event = nil
		end

		slot0.data = nil
	end
end

function HeroExhibitionItem.setUnitData(slot0, slot1)
	if Config.UnitData.data_unit(slot1 or 0) == nil then
		slot0.head_icon:setVisible(false)
		slot0.star_con:setVisible(false)
		slot0.num_label:setString("")
		slot0:setQualityImg(0)

		if slot0.partner_type then
			slot0.partner_type:setVisible(false)
		end
	elseif slot2.monster3 and Config.UnitData.data_unit(slot3) then
		slot0:setHeadImg(slot4.head_icon)
		slot0:setQualityImg(slot4.star - 1)
		slot0:setCampImg(slot4.camp_type)

		slot0.star_setting = slot0:createStar(slot4.star, slot0.star_con, slot0.star_setting)

		slot0:setLev(slot4.lev)
	end
end

function HeroExhibitionItem.findUseSkin(slot0, slot1)
	if slot1.ext_data then
		for slot6, slot7 in ipairs(slot1.ext_data or {}) do
			if slot7.key == 5 then
				return slot7.val
			end
		end
	end

	if slot1.ext then
		for slot6, slot7 in ipairs(slot1.ext or {}) do
			if slot7.key == 5 then
				return slot7.val
			end
		end
	end

	if slot1.use_skin then
		return slot1.use_skin
	end

	return 0
end

function HeroExhibitionItem.findKeyValue(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if slot1.ext_data then
		for slot7, slot8 in ipairs(slot1.ext_data or {}) do
			if slot8.key == slot2 then
				return slot8.val
			end
		end
	end

	if slot1.ext then
		for slot7, slot8 in ipairs(slot1.ext or {}) do
			if slot8.key == slot2 then
				return slot8.val
			end
		end
	end
end

function HeroExhibitionItem.setData(slot0, slot1)
	slot0:unBindEvent()

	slot0.data = slot1

	if type(slot0.scale) == "number" then
		slot0:setScale(slot0.scale)
	end

	if slot1 == nil then
		if slot0.index then
			slot0:setName("hero_" .. slot0.index)
		end

		slot0.head_icon:setVisible(false)
		slot0.star_con:setVisible(false)
		slot0.num_label:setVisible(false)
		slot0:setQualityImg(0)

		if slot0.partner_type then
			slot0.partner_type:setVisible(false)
		end

		doStopAllActions(slot0)
		slot0:showResonateImg(false)
		slot0:showSelfMarkImg(false)
		slot0:showThirteenEffect(false)
	else
		slot0.head_icon:setVisible(true)
		slot0.star_con:setVisible(true)
		slot0.num_label:setVisible(true)
		slot0:updateData(slot1)
	end
end

function HeroExhibitionItem.setIconClarity(slot0, slot1)
	doStopAllActions(slot0)
	slot0:showThirteenEffect(false)

	if slot0.thirteen_effect then
		slot0.thirteen_effect:setVisible(false)
		slot0.thirteen_effect:removeFromParent()

		slot0.thirteen_effect = nil
	end

	if slot0.thirteen_effect2 then
		slot0.thirteen_effect2:setVisible(false)
		slot0.thirteen_effect2:removeFromParent()

		slot0.thirteen_effect2 = nil
	end

	if slot0.head_icon then
		slot0.head_icon:setOpacity(slot1)
	end

	if slot0.partner_type then
		slot0.partner_type:setOpacity(slot1)
	end

	if slot0.num_label then
		slot0.num_label:setOpacity(slot1)
	end

	if slot0.star_setting then
		if slot0.star_setting.star_list and #slot0.star_setting.star_list >= 1 then
			for slot6, slot7 in pairs(slot0.star_setting.star_list) do
				if slot7 then
					slot7:setOpacity(slot1)
				end
			end
		end

		if slot0.star_setting.star_list2 and #slot0.star_setting.star_list2 >= 1 then
			for slot6, slot7 in pairs(slot0.star_setting.star_list2) do
				if slot7 then
					slot7:setOpacity(slot1)
				end
			end
		end

		if slot0.star_setting.star10 then
			slot0.star_setting.star10:setOpacity(slot1)
		end

		if slot0.star_setting.star_label then
			slot0.star_setting.star_label:setOpacity(slot1)
		end

		if slot0.star_setting.star_icon then
			slot0.star_setting.star_icon:setOpacity(slot1)
		end
	end

	slot0:setBgOpacity(slot1)
	slot0:setOpacity(slot1)
end

function HeroExhibitionItem.updateData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = nil

	if type(slot1) == "number" and not Config.PartnerData.data_partner_base[slot1] or slot1.data and not slot1.data or not slot1 or not slot2.bid then
		return
	end

	slot3 = slot2.star or slot2.init_star or 1

	if slot2.bid ~= 0 then
		slot4 = true

		if GuideController:getInstance():getModel():getGuideID() and Config.DramaData.data_const.guide_heavn_id and slot6.val then
			for slot10, slot11 in pairs(slot6.val) do
				if slot11 == slot5 and slot0.index then
					slot0:setName("hero_" .. slot0.index)

					slot4 = false

					break
				end
			end
		end

		if slot4 == true then
			slot0:setName("hero_" .. slot2.bid)
		end

		if slot1.master_head_id ~= nil then
			slot0:setHeadImg(slot1.master_head_id)
		elseif slot0:findUseSkin(slot1) and slot6 ~= 0 then
			if Config.PartnerSkinData.data_skin_info[slot6] then
				slot0:setHeadImg(slot7.head_id)
			end
		elseif Config.PartnerData.data_partner_star(getNorKey(slot2.bid, slot3)) then
			slot0:setHeadImg(slot8.head_id)
		end
	end

	slot0:setQualityImg(slot3 - 1)

	if (slot2.camp_type == nil or slot4 == 0) and Config.PartnerData.data_partner_base[slot2.bid] then
		slot4 = slot5.camp_type
	end

	slot0:setCampImg(slot4)

	if not slot0.hide_star then
		slot0.star_setting = slot0:createStar(slot3, slot0.star_con, slot0.star_setting)

		if slot3 >= 13 then
			slot0:showThirteenEffect(true)
		else
			slot0:showThirteenEffect(false)
		end
	else
		slot0:showThirteenEffect(false)
	end

	if slot2.isResonateHero and slot2:isResonateHero() then
		slot0:showResonateImg(true)
	elseif slot0:findKeyValue(slot1, 10) and slot5 > 0 then
		slot0:showResonateImg(true)
	else
		slot0:showResonateImg(false)
	end

	slot5 = nil

	slot0:setLev(slot2.lev, (not slot2.isResonateCrystalHero or (not slot2:isResonateCrystalHero() or cc.c4b(75, 255, 232, 255)) and Config.ColorData.data_color4[1]) and (not slot1.resonate_lev or (slot2.resonate_lev <= 0 or cc.c4b(75, 255, 232, 255)) and Config.ColorData.data_color4[1]) and (not slot0:findKeyValue(slot1, 11) or slot6 <= 0 or cc.c4b(75, 255, 232, 255)) and Config.ColorData.data_color4[1])

	if slot0.from_type == HeroConst.ExhibitionItemType.eHeroBag then
		if HeroCalculate.isCheckHeroRedPointByHeroVo(slot2) then
			slot0:showRedPoint(HeroCalculate.checkSingleHeroRedPoint(slot2), 10, 5)
		else
			slot0:showRedPoint(false)
		end
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eHeroChange then
		slot0:showLockIcon(slot2.is_locked or false, slot2.lock_str)
		slot0:setSelected(slot2.is_ui_select == true)
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eFormFight or slot0.from_type == HeroConst.ExhibitionItemType.eAdventure then
		slot0:setSelected(slot2.is_ui_select == true)
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eVoyage then
		slot0:showStrTips(slot2.in_task, TI18N("任务中"))
		slot0:setSelected(slot2.is_ui_select == true)
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eStronger then
		slot0:setBoxSelected(slot2.is_ui_select == true)
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eExpeditFight then
		slot6 = 100

		if slot0.boold_type == true then
			slot6 = uv0:getHeroBloodById(slot2.partner_id, slot2.rid, slot2.srv_id)
			slot7 = false

			if uv0:getHireHero(slot2.partner_id, slot2.rid, slot2.srv_id) == true and slot2.is_used then
				if not slot0.hireHero then
					slot0.hireHero = createSprite(PathTool.getResFrame("heroexpedit", "txt_cn_heroexpedit_1"), 79, -7, slot0, cc.p(0, 0), LOADTEXT_TYPE_PLIST, 1)
				else
					slot0.hireHero:setVisible(true)
					loadSpriteTexture(slot0.hireHero, PathTool.getResFrame("heroexpedit", "txt_cn_heroexpedit_1"))
				end
			elseif slot0.hireHero then
				slot0.hireHero:setVisible(false)
			end
		else
			slot6 = slot2.blood or 0
		end

		slot0:showProgressbar(slot6)

		if slot6 <= 0 then
			slot0:showStrTips(true, TI18N("已阵亡"), {
				c3b = cc.c3b(255, 255, 255)
			})
		else
			slot0:showStrTips(false)
		end

		slot0:setSelected(slot2.is_ui_select == true)
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eEndLessHero then
		slot0:setSelected(slot2.is_ui_select == true)

		if slot2.is_endless then
			slot0:showHelpImg(true)
		else
			slot0:showHelpImg(false)
		end

		if slot2.hp_per then
			slot0:showProgressbar(slot2.hp_per)

			if slot2.hp_per <= 0 then
				slot0:showStrTips(true, TI18N("已阵亡"), {
					c3b = cc.c3b(255, 255, 255)
				})
			else
				slot0:showStrTips(false)
			end
		end
	elseif slot0.from_type == HeroConst.ExhibitionItemType.eLimitExercise then
		slot0:setSelected(slot2.is_ui_select == true)
	elseif slot0.from_type == HeroConst.ExhibitionItemType.ePlanes then
		if slot2.flag == 1 then
			slot0:showHelpImg(true)
		else
			slot0:showHelpImg(false)
		end

		if slot2.hp_per or PlanesafkController:getInstance():getModel():getMyPlanesHeroHpPer(slot2.partner_id, slot2.flag) then
			slot0:showProgressbar(slot6)

			if slot6 <= 0 then
				slot0:showStrTips(true, TI18N("已阵亡"), {
					c3b = cc.c3b(255, 255, 255)
				})
			else
				slot0:showStrTips(false)
			end
		end

		slot0:setSelected(slot2.is_ui_select == true)
	end

	slot0:addVoBindEvent()
end

function HeroExhibitionItem.showThirteenEffect(slot0, slot1)
	if slot1 then
		if slot0.thirteen_effect == nil then
			slot0.thirteen_effect = createEffectSpine("E27802", cc.p(slot0.size.width / 2, slot0.size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0:addChild(slot0.thirteen_effect, 1)
		end

		if slot0.thirteen_effect2 == nil then
			slot0.thirteen_effect2 = createEffectSpine("E27801", cc.p(0, -7), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.star_con:addChild(slot0.thirteen_effect2, 1)
		end
	else
		if slot0.thirteen_effect then
			slot0.thirteen_effect:setVisible(false)
			slot0.thirteen_effect:removeFromParent()

			slot0.thirteen_effect = nil
		end

		if slot0.thirteen_effect2 then
			slot0.thirteen_effect2:setVisible(false)
			slot0.thirteen_effect2:removeFromParent()

			slot0.thirteen_effect2 = nil
		end
	end
end

function HeroExhibitionItem.setHeadImg(slot0, slot1)
	if slot0.record_head_id == nil or slot0.record_head_id ~= slot1 then
		slot0.record_head_id = slot1

		slot0.head_icon:loadTexture(PathTool.getHeadIcon(slot1), LOADTEXT_TYPE)
	end
end

function HeroExhibitionItem.setQualityImg(slot0, slot1)
	slot2 = PathTool.getQualityBg(slot1)

	if slot0.record_res_id == nil or slot0.record_res_id ~= slot2 then
		slot0.record_res_id = slot2

		slot0.background:loadTexture(slot2, LOADTEXT_TYPE_PLIST)
	end
end

function HeroExhibitionItem.setCampImg(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 == 0 then
		slot0.partner_type:setVisible(false)
	elseif slot0.partner_type then
		if PathTool.getHeroCampTypeIcon(slot1) ~= slot0.type_res then
			slot0.type_res = slot2

			loadSpriteTexture(slot0.partner_type, slot2, LOADTEXT_TYPE_PLIST)
		end

		slot0.partner_type:setVisible(true)
	end
end

function HeroExhibitionItem.setLev(slot0, slot1, slot2)
	if slot1 ~= nil then
		slot0.num_label:setVisible(true)

		if slot2 then
			slot0.num_label:setTextColor(slot2)
		end

		slot0.num_label:setString(slot1)
	else
		slot0.num_label:setVisible(false)
	end
end

function HeroExhibitionItem.addVoBindEvent(slot0)
	doStopAllActions(slot0)

	if type(slot0.data) == "table" and slot0.data and slot0.data.id ~= nil and slot0.data.Bind and slot0.item_update_event == nil then
		slot0.item_update_event = slot0.data:Bind(HeroVo.UPDATE_Partner_ATTR, function (slot0)
			delayRun(uv0, 1, function ()
				if uv0 and uv0.updateData then
					uv0:updateData(uv1)
				end
			end)
		end)
	end
end

function HeroExhibitionItem.setDefaultHead(slot0, slot1)
	if slot1 and slot0.record_head_id == nil or slot0.record_head_id ~= slot1 then
		slot0.record_head_id = slot1

		slot0.head_icon:loadTexture(PathTool.getItemRes(slot1), LOADTEXT_TYPE)
	end
end

function HeroExhibitionItem.setDefaultHeadByRes(slot0, slot1, slot2, slot3)
	if slot1 and slot0.record_head_id == nil or slot0.record_head_id ~= slot1 then
		slot0.record_head_id = slot1

		if slot3 == nil then
			slot3 = LOADTEXT_TYPE_PLIST
		end

		slot0.head_icon:loadTexture(slot1, slot3)
		slot0.head_icon:setScale(slot2 or 1)
	end
end

function HeroExhibitionItem.createStar(slot0, slot1, slot2, slot3)
	slot4 = slot1 or 0

	if (slot3 or {}).star_list == nil then
		slot5.star_list = {}
	end

	if slot5.star_list2 == nil then
		slot5.star_list2 = {}
	end

	for slot9, slot10 in pairs(slot5.star_list) do
		slot10:setVisible(false)
	end

	for slot9, slot10 in pairs(slot5.star_list2) do
		slot10:setVisible(false)
	end

	if slot5.star10 then
		slot5.star10:setVisible(false)
	end

	if slot4 > 0 and slot4 <= 5 then
		function (slot0, slot1, slot2)
			slot3 = 12
			slot4 = -slot0 * slot3 * 0.5 + slot3 * 0.5

			for slot8 = 1, slot0 do
				if not slot2[slot8] then
					slot9 = createImage(uv0, slot1, 0, 0, cc.p(0.5, 0.5), true, 0, false)

					slot9:setScale(1)

					slot2[slot8] = slot9
				end

				slot2[slot8]:setVisible(true)
				slot2[slot8]:setPositionX(slot4 + (slot8 - 1) * slot3)
			end
		end(slot4, PathTool.getResFrame("common", "common_90074"), slot5.star_list)
	elseif slot4 >= 6 and slot4 <= 9 then
		slot6(slot4 - 5, PathTool.getResFrame("common", "common_90075"), slot5.star_list2)
	elseif slot4 >= 10 then
		slot8 = nil

		if slot5.star10 == nil then
			slot5.star10 = createImage(slot2, (slot4 - 10 <= 0 or PathTool.getResFrame("common", "common_90084")) and PathTool.getResFrame("common", "common_90076"), 0, -7, cc.p(0.5, 0.5), true, 0, false)
			slot10 = createImage(slot5.star10, PathTool.getResFrame("common", "common_90073"), 63, 21, cc.p(0.5, 0.5), true, 0, false)

			slot10:setScale(1.2)

			slot5.star_icon = slot10
		else
			slot5.star10:loadTexture(slot8, LOADTEXT_TYPE_PLIST)
			slot5.star10:setVisible(true)
		end

		if slot7 > 0 then
			if slot5.star_label == nil then
				slot9 = slot5.star_icon:getContentSize()
				slot5.star_label = createLabel(12, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot9.width * 0.5 - 2, slot9.height * 0.5, "10", slot5.star_icon, 1, cc.p(0.5, 0.5))
			else
				slot5.star_label:setVisible(true)
			end

			slot5.star_label:setString(slot7)
		elseif slot5.star_label then
			slot5.star_label:setVisible(false)
		end
	end

	return slot5
end

function HeroExhibitionItem.showProgressbar(slot0, slot1, slot2)
	slot0:showProgressbarStatus(true, slot1, slot2)
end

function HeroExhibitionItem.showProgressbarStatus(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		if not slot0.comp_bar then
			slot9 = cc.size(118, 19)
			slot0.comp_bar_bg, slot0.comp_bar = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), slot9, slot0, cc.p(0.5, 0.5), slot9.width / 2, (slot4 or {}).y or -10, true, true)
		else
			slot0.comp_bar_bg:setVisible(true)
			slot0.comp_bar:setVisible(true)
		end

		slot0.comp_bar:setPercent(slot2)

		if slot3 then
			if not slot0.comp_bar_label then
				slot7 = cc.size(118, 19)
				slot0.comp_bar_label = createLabel(18, cc.c3b(255, 255, 255), cc.c3b(0, 0, 0), slot7.width / 2, slot7.height / 2, "", slot0.comp_bar, 2, cc.p(0.5, 0.5))
			end

			slot0.comp_bar_label:setString(slot3)
		end
	else
		if slot0.comp_bar then
			slot0.comp_bar:setVisible(false)
		end

		if slot0.comp_bar_bg then
			slot0.comp_bar_bg:setVisible(false)
		end
	end
end

function HeroExhibitionItem.showChipIcon(slot0, slot1)
	if slot1 then
		if slot0.hero_chip_icon == nil then
			slot0.hero_chip_icon = createSprite(PathTool.getResFrame("common", "common_90055"), HeroExhibitionItem.Width - 20, HeroExhibitionItem.Height - 20, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
		else
			slot0.hero_chip_icon:setVisible(true)
		end
	elseif slot0.hero_chip_icon then
		slot0.hero_chip_icon:setVisible(false)
	end
end

function HeroExhibitionItem.setHeadUnEnabled(slot0, slot1)
	if slot0.head_icon then
		setChildUnEnabled(slot1, slot0.head_icon)
	end
end

function HeroExhibitionItem.setSelected(slot0, slot1)
	if slot1 then
		if slot0.lay_select == nil then
			slot0.lay_select = ccui.Layout:create()

			slot0.lay_select:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.lay_select:setContentSize(slot0.size)
			slot0.lay_select:setPosition(slot0.size.width / 2, slot0.size.height / 2)
			slot0.lay_select:setTouchEnabled(false)
			showLayoutRect(slot0.lay_select, 150)
			createImage(slot0.lay_select, PathTool.getResFrame("common", "common_1043"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, false)
			slot0:addChild(slot0.lay_select, 3)
		else
			slot0.lay_select:setVisible(true)
		end
	elseif slot0.lay_select then
		slot0.lay_select:setVisible(false)
	end
end

function HeroExhibitionItem.setBoxSelected(slot0, slot1)
	if slot1 then
		if slot0.box_select == nil then
			slot0.box_select = createImage(slot0, PathTool.getResFrame("stronger", "stronger_3"), slot0.size.width / 2, slot0.size.height / 2 - 10, cc.p(0.5, 0.5), true, 1)

			slot0.box_select:setScale(1.25)
		else
			slot0.box_select:setVisible(true)
		end
	elseif slot0.box_select then
		slot0.box_select:setVisible(false)
	end
end

function HeroExhibitionItem.setBoxSelected2(slot0, slot1)
	if slot1 then
		if slot0.box_select == nil then
			slot0.box_select = createImage(slot0, PathTool.getResFrame("stronger", "stronger_3"), slot0.size.width / 2, slot0.size.height / 2 - 10, cc.p(0.5, 0.5), true, 1)

			slot0.box_select:setScale(1.25)
		else
			slot0.box_select:setVisible(true)
		end
	elseif slot0.box_select then
		slot0.box_select:setVisible(false)
	end
end

function HeroExhibitionItem.showLockIcon(slot0, slot1, slot2, slot3)
	if slot1 == false and not slot0.lock_icon then
		return
	end

	if not slot0.lock_icon then
		slot0.lock_icon = createImage(slot0, (slot3 or {}).res or PathTool.getResFrame("common", "common_90009"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, false)
	elseif slot5 and slot0.lock_icon then
		slot0.lock_icon:loadTexture(slot5, LOADTEXT_TYPE_PLIST)
	end

	if slot2 ~= nil then
		if not slot0.lock_label then
			slot0.lock_label = createLabel(22, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot0.size.width / 2, 22, "", slot0, 2, cc.p(0.5, 0))
		end

		slot0.lock_label:setString(slot2)
	end

	slot0.lock_icon:setVisible(slot1)
	slot0:setHeadUnEnabled(slot1)

	if slot0.partner_type then
		setChildUnEnabled(slot1, slot0.partner_type)
	end

	if slot4.is_unenabled_bg then
		setChildUnEnabled(slot1, slot0.background)
	else
		setChildUnEnabled(false, slot0.background)
	end

	if slot0.lock_label then
		slot0.lock_label:setVisible(slot1)
	end
end

function HeroExhibitionItem.showFightImg(slot0, slot1)
	if slot1 == false and not slot0.fight_img then
		return
	end

	if not slot0.fight_img then
		slot0.fight_img = createImage(slot0, PathTool.getResFrame("common", "txt_cn_common_90001"), 109, 18, cc.p(0.5, 0.5), true, 3, false)
	end

	slot0.fight_img:setVisible(slot1)
end

function HeroExhibitionItem.showAddIcon(slot0, slot1, slot2)
	if slot1 == false and not slot0.add_btn then
		return
	end

	if not slot0.add_btn then
		slot0.add_btn = createSprite(slot2 or PathTool.getResFrame("common", "common_90026"), slot0.size.width / 2, slot0.size.height / 2, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
	end

	slot0.add_btn:setVisible(slot1)
end

function HeroExhibitionItem.showAddIconII(slot0, slot1, slot2)
	if slot1 == false and not slot0.add_btn then
		return
	end

	if not slot0.add_btn then
		slot0.add_btn = createImage(slot0, PathTool.getResFrame("common", "common_90026"), slot0.size.width / 2, 40, cc.p(0.5, 0), true, 0, false)
		slot0.add_label = createLabel(22, Config.ColorData.data_color4[1], Config.ColorData.data_color4[9], slot0.size.width / 2, 12, "", slot0, 2, cc.p(0.5, 0))
	end

	slot0.add_btn:setVisible(slot1)
	slot0.add_label:setString(slot2 or "")
	slot0.add_label:setVisible(slot1)
end

function HeroExhibitionItem.showUnknownIcon(slot0, slot1)
	if slot1 == false and not slot0.unknow_icon then
		return
	end

	if not slot0.unknow_icon then
		slot0.unknow_icon = createSprite(PathTool.getResFrame("common", "common_90086"), slot0.size.width / 2, slot0.size.height / 2, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
	end

	slot0.unknow_icon:setVisible(slot1)
end

function HeroExhibitionItem.showRedPoint(slot0, slot1, slot2, slot3)
	if slot1 == false and not slot0.red_point then
		return
	end

	if not slot0.red_point then
		slot0.red_point = createImage(slot0, PathTool.getResFrame("common", "common_1014"), 108 + (slot2 or 0), 108 + (slot3 or 0), cc.p(0.5, 0.5), true, 10, false)
	end

	slot0.red_point:setVisible(slot1)
end

function HeroExhibitionItem.showHelpImg(slot0, slot1)
	if slot1 == false and not slot0.help_img then
		return
	end

	if not slot0.help_img then
		slot0.help_img = createSprite(PathTool.getResFrame("common", "txt_cn_common_90014"), 10, 16, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 3)
	end

	slot0.help_img:setVisible(slot1)
end

function HeroExhibitionItem.showResonateImg(slot0, slot1)
	if slot1 == false and not slot0.resonate_img then
		return
	end

	if not slot0.resonate_img then
		slot0.resonate_img = createSprite(PathTool.getResFrame("common", "common_2036"), slot0.size.width * 0.5, slot0.size.height * 0.5, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
	end

	if slot1 then
		slot0.resonate_img:setVisible(slot1)
		doStopAllActions(slot0.resonate_img)
		slot0.resonate_img:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(0.7), cc.DelayTime:create(0.4), cc.FadeIn:create(0.7), cc.DelayTime:create(0.1))))
	else
		doStopAllActions(slot0.resonate_img)
		slot0.resonate_img:setVisible(slot1)
	end
end

function HeroExhibitionItem.showResonateCrystalTime(slot0, slot1, slot2)
	if slot1 == false and not slot0.resonate_crystal_img then
		return
	end

	if not slot0.resonate_crystal_img then
		slot0.resonate_crystal_img = createSprite(PathTool.getResFrame("common", "common_2036"), slot0.size.width * 0.5, 70, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)

		slot0.resonate_crystal_img:setScale(0.7)

		slot0.resonate_crystal_time = createLabel(24, cc.c4b(255, 248, 191, 255), nil, 18, -25, "", slot0.resonate_crystal_img, 2, cc.p(0.5, 0.5))
	end

	if slot1 then
		slot0.resonate_crystal_img:setVisible(true)

		if slot2 then
			slot0.resonate_crystal_time:setString(slot2)
		end
	else
		slot0.resonate_crystal_img:setVisible(false)
	end

	return slot0.resonate_crystal_time
end

function HeroExhibitionItem.showSelfMarkImg(slot0, slot1)
	if slot1 == false and not slot0.selfmark_img then
		return
	end

	if not slot0.selfmark_img then
		slot0.selfmark_img = createSprite(PathTool.getPlistImgForDownLoad("hero", "txt_cn_hero_temp_01"), slot0.size.width * 0.5, slot0.size.height * 0.5, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE, 1)
	end

	if slot1 then
		slot0.selfmark_img:setVisible(slot1)
		doStopAllActions(slot0.selfmark_img)
		slot0.selfmark_img:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeOut:create(0.7), cc.DelayTime:create(0.4), cc.FadeIn:create(0.7), cc.DelayTime:create(0.1))))
	else
		doStopAllActions(slot0.selfmark_img)
		slot0.selfmark_img:setVisible(slot1)
	end
end

function HeroExhibitionItem.showDefImg(slot0, slot1)
	if slot1 == false and not slot0.help_img then
		return
	end

	if not slot0.help_img then
		slot0.help_img = createSprite(PathTool.getResFrame("common", "txt_cn_common_30016"), 34, 63, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
	end

	slot0.help_img:setVisible(slot1)
end

function HeroExhibitionItem.shwoExtendPower(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.extend_power then
			slot0.extend_pwer:setVisible(false)
		end
	else
		slot2 = slot2 or 0

		if slot0.extend_power == nil then
			slot0.extend_power = createRichLabel(24, 175, cc.p(0.5, 1), cc.p(slot0.size.width * 0.5, -2))

			slot0:addChild(slot0.extend_power, 1)
		end

		slot0.extend_power:setString(string.format("<div><img src='%s' scale=1 />%s</div>", PathTool.getResFrame("common", "common_90002"), slot2))
	end
end

function HeroExhibitionItem.showHeroRemainCount(slot0, slot1, slot2)
	if not slot0.remain_text then
		slot3 = createImage(slot0, PathTool.getResFrame("limitexercise", "limitexercise_22"), 61, -10, cc.p(0.5, 0.5), true, 1, true)

		slot3:setContentSize(cc.size(120, 21))
		slot3:setCapInsets(cc.rect(3, 3, 6, 6))

		slot0.remain_text = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(0, 0, 0, 255), slot3:getContentSize().width / 2, slot3:getContentSize().height / 2, "", slot3, 2, cc.p(0.5, 0.5))
	end

	slot0.remain_text:setString(slot1 .. "/" .. slot2)
end

function HeroExhibitionItem.showStrTips(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		if slot0.lay_tips == nil then
			slot0.lay_tips = ccui.Layout:create()

			slot0.lay_tips:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.lay_tips:setContentSize(slot0.size)
			slot0.lay_tips:setPosition(slot0.size.width / 2, slot0.size.height / 2)
			slot0.lay_tips:setTouchEnabled(false)
			showLayoutRect(slot0.lay_tips, 150)

			if slot3 then
				slot5 = slot3.c3b or cc.c3b(255, 255, 255)
				slot6 = slot3.enable or cc.c3b(132, 0, 0)
			end

			slot7 = createLabel(slot4 or 26, slot5, slot6, slot0.size.width / 2, slot0.size.height / 2, slot2, slot0.lay_tips, nil, cc.p(0.5, 0.5))

			slot0:addChild(slot0.lay_tips, 1)
		else
			slot0.lay_tips:setVisible(true)
		end
	elseif slot0.lay_tips then
		slot0.lay_tips:setVisible(false)
	end
end

function HeroExhibitionItem.setHeroName(slot0, slot1, slot2, slot3)
	if slot1 then
		if not slot2 then
			return
		end

		if slot0.hero_name_label == nil then
			slot4 = slot3 or {}
			slot0.hero_name_label = createLabel(slot4.font_size or 22, slot4.color or cc.c4b(248, 194, 60, 255), nil, slot0.size.width / 2, -20, slot2, slot0, nil, cc.p(0.5, 0.5))
		else
			slot0.hero_name_label:setVisible(true)
			slot0.hero_name_label:setString(slot2)
		end
	elseif slot0.hero_name_label then
		slot0.hero_name_label:setVisible(false)
	end
end

function HeroExhibitionItem.setHeroNameColor(slot0, slot1)
	if slot0.hero_name_label then
		slot0.hero_name_label:setTextColor(slot1)
	end
end

function HeroExhibitionItem.setBgOpacity(slot0, slot1)
	if (slot1 or 0) < 0 then
		slot2 = 0
	end

	if slot2 > 255 then
		slot2 = 255
	end

	slot0.background:setOpacity(slot2)
end

function HeroExhibitionItem.DeleteMe(slot0)
	doStopAllActions(slot0)
	slot0:showThirteenEffect(false)
	slot0:unBindEvent()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
