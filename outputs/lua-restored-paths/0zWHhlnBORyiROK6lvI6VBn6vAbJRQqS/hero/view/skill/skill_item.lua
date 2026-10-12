SkillItem = class("SkillItem", function ()
	return ccui.Layout:create()
end)
SkillItem.Width = 119
SkillItem.Height = 119

function SkillItem.ctor(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.play = slot1
	slot0.click = slot2
	slot0.is_show_tips = slot3 or false
	slot0.scale = slot4 or 1
	slot0.can_reset_name = true
	slot0.show_lev = slot5 or false
	slot0.size = cc.size(SkillItem.Width, SkillItem.Height)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	if slot0.scale ~= 1 then
		slot0:setScale(slot0.scale)
	end

	slot0:configUI()

	if slot0.click == true then
		slot0:setTouchEnabled(true)
		slot0:registerEvent()
		slot0:setSwallowTouches(slot6)
	end
end

function SkillItem.setClickInfo(slot0, slot1)
	slot1 = slot1 or {}
	slot0.clickScroll = slot1.clickScroll or false
	slot0.click = slot1.click or false

	if slot0.click == true then
		slot0:setTouchEnabled(true)
		slot0:registerEvent()
	end

	slot0.swallow_touch = slot1.swallow_touch or false

	if slot0.swallow_touch == true then
		slot0:setSwallowTouches(slot0.swallow_touch)
	end
end

function SkillItem.configUI(slot0)
	slot0.background = createImage(slot0, PathTool.getNormalSkillBg(), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 0, true)

	slot0.background:setContentSize(slot0.size)

	slot0.item_icon = createSprite(nil, slot0.size.width / 2, slot0.size.height / 2, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE, 0)

	if slot0.show_lev then
		slot0.level_bg = createImage(slot0, PathTool.getResFrame("common", "common_2018"), 10, 108, cc.p(0.5, 0.5), true, 1, false)
		slot0.num_label = createLabel(20, cc.c4b(100, 50, 35, 255), nil, 8, 107, "00", slot0, 1, cc.p(0.5, 0.5))

		slot0.num_label:setZOrder(1)
	end
end

function SkillItem.getSize(slot0)
	return slot0.size
end

function SkillItem.resetName(slot0, slot1)
	slot0.can_reset_name = slot1
end

function SkillItem.getData(slot0)
	return slot0.data
end

function SkillItem.setSelected(slot0, slot1)
	if not slot0.select_bg and slot1 == false then
		return
	end

	if not slot0.select_bg then
		slot0.select_bg = createImage(slot0, PathTool.getSelectBg(), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 1, true)

		slot0.select_bg:setContentSize(slot0.size)
		slot0.select_bg:setZOrder(1)
	end

	slot0.select_bg:setVisible(slot1)
end

function SkillItem.setTickSelected(slot0, slot1)
	if slot1 then
		if slot0.lay_select == nil then
			slot0.lay_select = ccui.Layout:create()

			slot0.lay_select:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.lay_select:setContentSize(slot0.size)
			slot0.lay_select:setPosition(slot0.size.width / 2, slot0.size.height / 2)
			slot0.lay_select:setTouchEnabled(false)
			showLayoutRect(slot0.lay_select, 150)
			createImage(slot0.lay_select, PathTool.getResFrame("common", "common_1043"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 0, false)
			slot0:addChild(slot0.lay_select, 1)
		else
			slot0.lay_select:setVisible(true)
		end
	elseif slot0.lay_select then
		slot0.lay_select:setVisible(false)
	end
end

function SkillItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function SkillItem.setTipsHideFlag(slot0, slot1)
	slot0.tips_hide_flag = slot1
end

function SkillItem.setSkillFirstCd(slot0, slot1)
	slot0.first_cd = slot1
end

function SkillItem.setHallowsAtkVal(slot0, slot1)
	slot0.hallows_atk_val = slot1
end

function SkillItem.registerEvent(slot0)
	if slot0.click == true then
		slot0:addTouchEventListener(function (slot0, slot1)
			customClickAction(uv0, slot1, uv0.scale)

			if uv0.clickScroll and slot1 == ccui.TouchEventType.began then
				uv0.touch_began = slot0:getTouchBeganPosition()
			end

			if slot1 == ccui.TouchEventType.ended then
				if uv0.clickScroll then
					slot3 = slot0:getTouchEndPosition()

					if uv0.touch_began and slot3 and (math.abs(slot3.x - slot2.x) > 20 or math.abs(slot3.y - slot2.y) > 20) then
						return
					end
				end

				playButtonSound2()

				if uv0.btn_fun and not uv0.data then
					uv0:btn_fun(uv0.add_btn_index)
				else
					if uv0.is_show_tips == true then
						if uv0.skill_config then
							TipsManager:getInstance():showSkillTips(uv0.skill_config, uv0.is_unabled or false, false, uv0.tips_hide_flag or false, uv0.first_cd or 0, uv0.hallows_atk_val or 0)
						elseif uv0.lock_tips then
							message(uv0.lock_tips)
						elseif uv0.none_tips then
							message(uv0.none_tips)
						end
					end

					if slot0.guide_call_back ~= nil then
						slot0:guide_call_back()
					end

					if uv0.callback then
						uv0:callback()
					end
				end
			end
		end)
	end
end

function SkillItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0:showRedPoint(false)

	if slot0.data == nil then
		slot0.skill_config = nil

		slot0.item_icon:setVisible(false)

		if slot0.num_label then
			slot0.num_label:setVisible(false)
		end

		slot0:showName(false)

		slot0.background_res_id = PathTool.getQualityBg(0)

		slot0.background:loadTexture(slot0.background_res_id, LOADTEXT_TYPE_PLIST)

		return
	else
		if not Config.SkillData.data_get_skill(slot1.skill_bid or slot1.skill_id or slot1.bid) then
			return
		end

		slot0.skill_config = slot3

		slot0.item_icon:setVisible(true)
		loadSpriteTexture(slot0.item_icon, PathTool.getSkillRes(slot3.icon, false), LOADTEXT_TYPE)

		slot5 = PathTool.getQualityBg(0)

		if slot3.type == "passive_skill" then
			-- Nothing
		end

		if slot0.background_res_id ~= slot5 then
			slot0.background_res_id = slot5

			slot0.background:loadTexture(slot0.background_res_id, LOADTEXT_TYPE_PLIST)
		end

		if slot0.show_lev and slot0.num_label then
			if slot3.client_lev and slot3.client_lev > 0 then
				slot0.num_label:setVisible(true)
				slot0.num_label:setString(slot3.client_lev)
			elseif slot3.level and slot3.level > 0 then
				slot0.num_label:setVisible(true)
				slot0.num_label:setString(slot3.level)
			else
				slot0.num_label:setVisible(false)
			end
		end

		if slot1 and slot1.is_show_name and slot1.is_show_name == true then
			slot0:showName(true, slot3.name)
		end

		slot0:showRecommondIcon(false)

		if slot1 and slot1.is_recommend and slot1.is_recommend == true then
			slot0:showRecommondIcon(true)
		end

		if slot1 and slot1.is_learn and slot1.is_learn == true then
			slot0:showRecommondIcon(true, 2)
		end

		if slot1 and slot0.can_reset_name == true then
			slot0:setName("guidesign_skillitem_" .. slot2)
		end

		if Config.PartnerSkillData.data_partner_awakening_skill and slot6[slot2] then
			slot0:showAwakeningSkillIcon(true, slot6[slot2])
		else
			slot0:showAwakeningSkillIcon(false)
		end
	end

	if slot1 and slot1.is_touch and slot1.is_touch == true then
		if slot0.callback then
			slot0:callback()
		end

		slot1.is_touch = false
	end

	if slot1 and slot1.scale_value and type(slot1.scale_value) == "number" then
		slot0.root_wnd:setScale(slot1.scale_value)
	end
end

function SkillItem.setGrayStatus(slot0, slot1)
	slot2 = 255

	if slot1 == true then
		slot2 = 160
	end

	slot0.item_icon:setOpacity(slot2)
end

function SkillItem.showUnEnabled(slot0, slot1)
	setChildUnEnabled(slot1, slot0.item_icon)
	setChildUnEnabled(slot1, slot0.background)

	if slot0.level_bg then
		setChildUnEnabled(slot1, slot0.level_bg)
	end

	slot0.is_unabled = slot1
end

function SkillItem.showLockIcon(slot0, slot1, slot2, slot3)
	if slot1 == false and not slot0.artifact_lock then
		return
	end

	if not slot0.artifact_lock then
		slot0.artifact_lock = createImage(slot0, PathTool.getResFrame("common", "common_90009"), 60, 60, cc.p(0.5, 0.5), true, 1, false)
		slot0.lock_label = createLabel(22, cc.c4b(217, 204, 187, 255), cc.c4b(86, 37, 18, 255), 57, 12, "", slot0, 1, cc.p(0.5, 0))
	end

	slot0.artifact_lock:setVisible(slot1)
	slot0.lock_label:setVisible(slot1)
	slot0.lock_label:setString(slot2 or "")

	slot0.lock_tips = slot3
end

function SkillItem.showRecommondIcon(slot0, slot1, slot2)
	if slot1 == false and not slot0.recommond_icon then
		return
	end

	if not slot0.recommond_icon then
		slot0.recommond_icon = createSprite(PathTool.getResFrame("common", "common_90015"), 34, 89, slot0, cc.p(0.5, 0.5), nil, 2)
		slot0.recommond_label = createLabel(18, Config.ColorData.data_color4[1], cc.c4b(149, 15, 0, 255), 29, 25, "", slot0.recommond_icon, 2, cc.p(0.5, 0))

		slot0.recommond_label:setRotation(-45)
	end

	if slot1 == true then
		slot0.recommond_icon:setVisible(true)

		slot4, slot5 = nil

		if (slot2 or 1) == 1 then
			slot4 = TI18N("推荐")
			slot5 = PathTool.getResFrame("common", "common_30016")

			slot0.recommond_icon:setPosition(31, 87)
			slot0.recommond_label:setPosition(31, 37)
			slot0.recommond_label:enableOutline(cc.c4b(92, 27, 119, 255), 2)
		elseif slot3 == 2 then
			slot4 = TI18N("已领悟")
			slot5 = PathTool.getResFrame("common", "common_30013")

			slot0.recommond_icon:setPosition(31, 87)
			slot0.recommond_label:setPosition(31, 37)
			slot0.recommond_label:enableOutline(cc.c4b(142, 43, 0, 255), 2)
		elseif slot3 == 3 then
			slot4 = TI18N("神技")
			slot5 = PathTool.getResFrame("common", "common_90015")

			slot0.recommond_icon:setPosition(34, 89)
			slot0.recommond_label:setPosition(29, 25)
			slot0.recommond_label:enableOutline(cc.c4b(149, 15, 0, 255), 2)
		elseif slot3 == 4 then
			slot4 = TI18N("觉")
			slot5 = PathTool.getResFrame("common", "common_90015")

			slot0.recommond_icon:setPosition(34, 89)
			slot0.recommond_label:setPosition(29, 25)
			slot0.recommond_label:enableOutline(cc.c4b(149, 15, 0, 255), 2)
		elseif slot3 == 5 then
			slot4 = TI18N("可领悟")
			slot5 = PathTool.getResFrame("common", "common_30015")

			slot0.recommond_icon:setPosition(31, 87)
			slot0.recommond_label:setPosition(31, 37)
			slot0.recommond_label:enableOutline(cc.c4b(0, 85, 116, 255), 2)
		else
			slot0.recommond_icon:setVisible(false)

			return
		end

		loadSpriteTexture(slot0.recommond_icon, slot5, LOADTEXT_TYPE_PLIST)
		slot0.recommond_label:setString(slot4)
	else
		slot0.recommond_icon:setVisible(false)
	end
end

function SkillItem.showUnusualIcon(slot0, slot1, slot2)
	if slot1 == false and not slot0.unusual_icon then
		return
	end

	if not slot0.unusual_icon then
		slot0.unusual_icon = createSprite(nil, -6, 123, slot0, cc.p(0, 1), nil, 2)
	end

	if slot1 == true then
		slot3 = PathTool.getResFrame("common", "txt_cn_common_unusual")

		if slot2 and slot2 == 2 then
			slot3 = PathTool.getResFrame("common", "txt_cn_common_unusual_2")
		end

		loadSpriteTexture(slot0.unusual_icon, slot3, LOADTEXT_TYPE_PLIST)
	end

	slot0.unusual_icon:setVisible(slot1)
end

function SkillItem.showAwakeningSkillIcon(slot0, slot1, slot2)
	if slot1 == false and not slot0.awakening_icon then
		return
	end

	if not slot0.awakening_icon then
		slot0.awakening_icon = createSprite(PathTool.getResFrame("common", "common_1108"), 60, 127, slot0, cc.p(0.5, 1), nil, 2)
	end

	slot0.awakening_icon:setVisible(slot1)

	if slot2 and slot1 then
		if slot0.skill_profession_icon == nil then
			slot0.skill_profession_icon = createSprite(nil, 102, 36, slot0, cc.p(0.5, 1), nil, 2)
			slot0.skill_profession_icon_item_load = loadSpriteTextureFromCDN(slot0.skill_profession_icon, PathTool.getPlistImgForDownLoad("bigbg/hero", "talent_profession"), ResourcesType.single, slot0.skill_profession_icon_item_load)
		end

		if slot0.skill_profession_label == nil then
			slot0.skill_profession_label = createLabel(20, cc.c3b(255, 246, 204), nil, 14.5, 17, "", slot0.skill_profession_icon, 1, cc.p(0.5, 0.5))
		end

		slot3 = slot2.limit_career or {}
		slot4 = nil

		slot0.skill_profession_label:setString(slot3 and next(slot3) ~= nil and (HeroConst.CareerName2[slot3[1][1]] or TI18N("物")) or TI18N("物"))
	end

	if slot0.skill_profession_icon then
		slot0.skill_profession_icon:setVisible(slot1)
	end
end

function SkillItem.showName(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot1 == false and not slot0.name then
		return
	end

	if not slot0.name then
		if slot5 and slot0.name_bg == nil then
			slot0.name_bg = createImage(slot0, slot7 or PathTool.getResFrame("common", "common_2028"), 60, -32, cc.p(0.5, 0), true, 0, true)

			slot0.name_bg:setContentSize(slot8 or cc.size(108, 30))
			slot0.name_bg:setCapInsets(cc.rect(10, 14, 1, 1))
		end

		slot0.name = createLabel(slot4 or 24, slot6 or Config.ColorData.data_color4[175], nil, 60, -30, "", slot0, 1, cc.p(0.5, 0))
	end

	slot0.name:setString(slot2 or "")
	slot0.name:setVisible(slot1)

	if slot0.name_bg then
		slot0.name_bg:setVisible(slot1)
	end

	if slot3 then
		slot0.name:setPosition(slot3)

		if slot0.name_bg then
			slot0.name_bg:setPosition(cc.p(slot3.x, slot3.y - 2))
		end
	end
end

function SkillItem.setNameColor(slot0, slot1, slot2, slot3)
	if slot0.name then
		if slot1 then
			slot0.name:setTextColor(slot1)
		end

		if slot2 and slot3 then
			slot0.name:enableOutline(slot2, slot3)
		end
	end
end

function SkillItem.showAddIcon(slot0, slot1, slot2)
	if slot1 == false and not slot0.add_btn then
		return
	end

	slot0.add_btn_index = slot2

	if not slot0.add_btn then
		slot0.add_btn = createSprite(PathTool.getResFrame("common", "common_90026"), 60, 60, slot0, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
	end

	slot0.add_btn:setVisible(slot1)
end

function SkillItem.showLevel(slot0, slot1)
	slot0.show_lev = slot1

	if slot1 == true then
		if not slot0.level_bg then
			slot0.level_bg = createImage(slot0, PathTool.getResFrame("common", "common_2018"), 10, 108, cc.p(0.5, 0.5), true, 1, false)
		end

		if not slot0.num_label then
			slot0.num_label = createLabel(20, cc.c4b(100, 50, 35, 255), nil, 8, 107, "00", slot0, 1, cc.p(0.5, 0.5))

			slot0.num_label:setZOrder(1)
		end

		slot0.level_bg:setVisible(true)
		slot0.num_label:setVisible(true)
	else
		if slot0.level_bg then
			slot0.level_bg:setVisible(false)
		end

		if slot0.num_label then
			slot0.num_label:setVisible(false)
		end
	end
end

function SkillItem.showNoneText(slot0, slot1, slot2)
	if slot1 == true then
		if not slot0.none_txt then
			slot0.none_txt = createLabel(32, cc.c4b(255, 236, 178, 255), nil, slot0.size.width / 2, slot0.size.height / 2, TI18N("无"), slot0, nil, cc.p(0.5, 0.5))
		end

		slot0.none_txt:setVisible(true)
	elseif slot0.none_txt then
		slot0.none_txt:setVisible(false)
	end

	slot0.none_tips = slot2
end

function SkillItem.showRedPoint(slot0, slot1)
	if slot0.skill_config and slot0.skill_config.next_id == 0 then
		slot1 = false
	end

	if slot1 == false and not slot0.red_point then
		return
	end

	if not slot0.red_point then
		slot0.red_point = createImage(slot0, PathTool.getResFrame("common", "common_1014"), 107, 107, cc.p(0.5, 0.5), true, 10, false)

		slot0.red_point:setScale(0.7)
	end

	slot0.red_point:setVisible(slot1)
end

function SkillItem.showArrowRedPoint(slot0, slot1)
	if slot1 == false and not slot0.arrow_red_point then
		return
	end

	if not slot0.arrow_red_point then
		slot0.arrow_red_point = createImage(slot0, PathTool.getResFrame("common", "common_1086"), 103, 100, cc.p(0.5, 0.5), true, 10, false)
	end

	slot0.arrow_red_point:setVisible(slot1)
end

function SkillItem.setAddBtnFun(slot0, slot1)
	slot0.btn_fun = slot1
end

function SkillItem.isHaveData(slot0)
	if not slot0.data or next(slot0.data) == nil then
		return false
	end

	return true
end

function SkillItem.getSkillConfig(slot0)
	return slot0.skill_config
end

function SkillItem.DeleteMe(slot0)
	if slot0.skill_profession_icon_item_load then
		slot0.skill_profession_icon_item_load:DeleteMe()

		slot0.skill_profession_icon_item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
