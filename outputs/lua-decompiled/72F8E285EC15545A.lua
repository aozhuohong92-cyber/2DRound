ArtifactRecastWindow = ArtifactRecastWindow or BaseClass(BaseView)
slot0 = string.format
slot1 = table.insert

function ArtifactRecastWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hero/artifact_recast_panel"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		}
	}
	slot0.ctrl = HeroController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_can_save = false
	slot0.is_luck_recast = false
	slot0.need_list = {}
	slot0.base_list_left = {}
	slot0.base_list_right = {}
	slot0.skill_list_left = {}
	slot0.skill_list_right = {}
	slot0.select_luck_type = nil
	slot0.need_num = nil
	slot0.need_num_2 = nil
end

function ArtifactRecastWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot1:getChildByName("win_title"):setString(TI18N("战技重铸"))

	slot2 = slot1:getChildByName("container")
	slot3 = slot2:getChildByName("cost_panel")
	slot0.cost_panel = slot3

	slot2:getChildByName("title_1"):setString(TI18N("重铸前"))
	slot2:getChildByName("title_2"):setString(TI18N("重铸后"))
	slot2:getChildByName("base_title_1"):setString(TI18N("基础属性"))
	slot2:getChildByName("base_title_2"):setString(TI18N("基础属性"))
	slot2:getChildByName("base_title_3"):setString(TI18N("战技技能"))
	slot2:getChildByName("base_title_4"):setString(TI18N("战技技能"))

	slot0.progress_bg = slot1:getChildByName("progress_bg")
	slot0.progress = slot0.progress_bg:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot0.progress_bg:getChildByName("progress_label")

	slot0.progress_value:setString(0)

	slot0.left_bg = slot2:getChildByName("Image_7")
	slot0.right_bg = slot2:getChildByName("Image_9")
	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.pos_item = slot2:getChildByName("pos_item")
	slot10 = slot3:getChildByName("cost_bg_1")

	slot10:setPositionX(207)

	slot11 = slot3:getChildByName("cost_bg_2")

	slot11:setPositionX(467)

	slot12 = slot3:getChildByName("cost_bg_3")

	slot12:setVisible(false)

	slot0.cost_bg = {
		slot10,
		slot11,
		slot12
	}
	slot0.cost_icon = {
		slot10:getChildByName("cost_icon_1"),
		slot11:getChildByName("cost_icon_2"),
		slot12:getChildByName("cost_icon_3")
	}
	slot16 = slot10:getChildByName("cost_txt_1")
	slot17 = slot11:getChildByName("cost_txt_2")
	slot18 = slot12:getChildByName("cost_txt_3")

	slot16:setString("")
	slot17:setString("")
	slot18:setString("")

	slot0.cost_txt = {
		slot16,
		slot17,
		slot18
	}
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.save_btn = slot1:getChildByName("save_btn")

	slot0.save_btn:getChildByName("label"):setString(TI18N("保存"))

	slot0.reset_btn = slot1:getChildByName("reset_btn")
	slot0.reset_btn_label = slot0.reset_btn:getChildByName("label")

	slot0.reset_btn_label:setString(TI18N("重铸"))

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("重铸"))

	slot0.check_panel = slot1:getChildByName("check_panel")

	slot0.check_panel:setVisible(false)

	slot0.checkbox = slot0.check_panel:getChildByName("checkbox")

	slot0.check_panel:getChildByName("box_lab"):setString(TI18N("幸运重铸"))

	slot0.tips_btn = slot0.check_panel:getChildByName("tips_btn")
	slot0.item_node = BackPackItem.new(false, false, false)

	slot0.item_node:setPositionY(15)
	slot0.pos_item:addChild(slot0.item_node)
end

function ArtifactRecastWindow.adjustNodePos(slot0)
	if not slot0.item_config then
		return
	end

	if BackPackConst.quality.orange <= slot0.item_config.quality then
		if not slot0.tips_text then
			slot0.tips_text = createRichLabel(22, nil, cc.p(0.5, 0.5), cc.p(340, 230), nil, nil, 660)

			slot0.main_container:addChild(slot0.tips_text)
			slot0.tips_text:addTouchLinkListener(function (slot0, slot1)
				if slot0 == "href" then
					uv0.ctrl:openArtifactSkillWindow(true, 1, 3)
				end
			end, {
				"href"
			})
		end

		slot0.cost_panel:setPositionY(162)
		slot0.progress_bg:setVisible(true)
		slot0.tips_text:setVisible(true)
	else
		slot0.cost_panel:setPositionY(124)
		slot0.progress_bg:setVisible(false)

		if slot0.tips_text then
			slot0.tips_text:setVisible(false)
		end
	end
end

function ArtifactRecastWindow.updateProgressBar(slot0)
	if slot0.item_config and BackPackConst.quality.orange <= slot0.item_config.quality then
		slot1, slot2 = slot0.model:getArtifactRecastCountByQuality(slot0.item_config.quality)

		slot0.progress:setPercent(slot1 / slot2 * 100)
		slot0.progress_value:setString(uv0("%d/%d", slot1, slot2))

		if slot0.tips_text then
			if slot2 - slot1 <= 0 and slot1 > 0 then
				slot0.reset_btn_label:setString(TI18N("必出稀有"))
				slot0.cancel_btn_label:setString(TI18N("必出稀有"))
				slot0.tips_text:setString(TI18N("<div fontcolor=955322>本次重铸必定出现稀有高级技能 </div><div href=xxx fontcolor=249003>查看技能</div>"))
				slot0:handleBtnEffect(true)

				if slot0.checkbox:isSelected() == true then
					slot0.checkbox:setSelected(false)
					slot0:checkLucType()
				end
			else
				if slot0.checkbox:isSelected() == false then
					slot0:handleBtnEffect(false)
				end

				slot0.reset_btn_label:setString(TI18N("重铸"))
				slot0.cancel_btn_label:setString(TI18N("重铸"))

				slot5 = uv0(TI18N("<div fontcolor=955322>再重铸%d次必定出现稀有技能 </div><div href=xxx fontcolor=249003>查看技能</div>"), slot4)

				if slot0.checkbox:isSelected() == true then
					slot5 = (not slot0.select_luck_type or slot0.select_luck_type ~= 2 or uv0(TI18N("<div fontcolor=955322>本次必出双高级技能,再重铸%d次必出稀有技能 </div><div href=xxx fontcolor=249003>查看技能</div>"), slot4)) and uv0(TI18N("<div fontcolor=955322>强力和稀有技能概率up,再重铸%d次必出稀有技能 </div><div href=xxx fontcolor=249003>查看技能</div>"), slot4)
				end

				slot0.tips_text:setString(slot5)
			end
		end
	end
end

function ArtifactRecastWindow.handleEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.main_container) and slot0.re_effect == nil then
			slot0.re_effect = createEffectSpine(Config.EffectData.data_effect_info[661], slot2, cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.main_container:addChild(slot0.re_effect)
		elseif slot0.re_effect then
			slot0.re_effect:setToSetupPose()
			slot0.re_effect:setPosition(slot2)
			slot0.re_effect:setAnimation(0, PlayerAction.action, false)
		end
	elseif slot0.re_effect then
		slot0.re_effect:clearTracks()
		slot0.re_effect:removeFromParent()

		slot0.re_effect = nil
	end
end

function ArtifactRecastWindow.handleBtnEffect(slot0, slot1)
	if slot1 == true then
		slot2 = slot0.reset_btn:convertToWorldSpace(cc.p(0, 0))

		if slot0.is_can_save then
			slot2 = slot0.cancel_btn:convertToWorldSpace(cc.p(0, 0))
		end

		slot3 = slot0.main_container:convertToNodeSpace(slot2)

		if not tolua.isnull(slot0.main_container) and slot0.btn_effect == nil then
			slot0.btn_effect = createEffectSpine(Config.EffectData.data_effect_info[1308], cc.p(slot3.x + 85, slot3.y + 25), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.main_container:addChild(slot0.btn_effect)
		elseif slot0.btn_effect then
			slot0.btn_effect:setToSetupPose()
			slot0.btn_effect:setPosition(slot4)
			slot0.btn_effect:setAnimation(0, PlayerAction.action, true)
		end
	elseif slot0.btn_effect then
		slot0.btn_effect:clearTracks()
		slot0.btn_effect:removeFromParent()

		slot0.btn_effect = nil
	end
end

function ArtifactRecastWindow.setData(slot0, slot1, slot2)
	slot0.data = slot1 or {}
	slot0.item_config = slot1.config
	slot0.partner_id = slot2 or 0

	slot0:adjustNodePos()
	slot0.item_node:setData(slot1)
	slot0.name_txt:setString(slot0.item_config.name)

	slot0.is_can_save = false

	if slot0.data.extra_attr and next(slot0.data.extra_attr) ~= nil then
		slot0.is_can_save = true
	end

	if not slot0.need_num and not slot0.need_num_2 then
		slot0.need_num = 0
		slot0.need_num_2 = 0

		if Config.PartnerArtifactData.data_artifact_const.lucky_artifact_ids and slot3.val then
			for slot7, slot8 in pairs(slot3.val) do
				if slot8[1] == slot0.item_config.id then
					slot0.need_num = slot8[2]

					break
				end
			end
		end

		if Config.PartnerArtifactData.data_artifact_const.lucky_artifact_ids2 and slot4.val then
			for slot8, slot9 in pairs(slot4.val) do
				if slot9[1] == slot0.item_config.id then
					slot0.need_num_2 = slot9[2]

					break
				end
			end
		end
	end

	slot0:setBaseAttrInfo()
	slot0:setSkillInfo()
	slot0:updateBtnShow()
	slot0:checkLucType()
	slot0:updateProgressBar()
end

function ArtifactRecastWindow.setBaseAttrInfo(slot0)
	if not slot0.data or not slot0.data.attr or not slot0.item_config then
		return
	end

	slot1 = 2

	if Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id] then
		slot1 = slot2.attr_num
	end

	for slot6, slot7 in ipairs(slot0.data.attr) do
		if slot1 < slot6 then
			break
		end

		slot10 = slot7.attr_val / 1000

		if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot7.attr_id]] then
			if not slot0.base_list_left[slot6] then
				slot0.base_list_left[slot6] = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

				slot0.left_bg:addChild(slot0.base_list_left[slot6])
			end

			slot0.base_list_left[slot6]:setPosition(cc.p(30, 375 - (slot6 - 1) * 35))

			slot15 = PathTool.getAttrIconByStr(slot9)

			if PartnerCalculate.isShowPerByStr(slot9) == true then
				slot10 = slot10 / 10 .. "%"
			end

			slot12:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot15), slot11, slot10))
		end
	end

	if slot0.is_can_save then
		for slot6, slot7 in ipairs(slot0.data.extra_attr) do
			if slot1 < slot6 then
				break
			end

			slot10 = slot7.attr_val / 1000

			if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot7.attr_id]] then
				if not slot0.base_list_right[slot6] then
					slot0.base_list_right[slot6] = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

					slot0.right_bg:addChild(slot0.base_list_right[slot6])
				end

				slot0.base_list_right[slot6]:setPosition(cc.p(30, 375 - (slot6 - 1) * 35))

				slot15 = PathTool.getAttrIconByStr(slot9)

				if PartnerCalculate.isShowPerByStr(slot9) == true then
					slot10 = slot10 / 10 .. "%"
				end

				slot12:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot15), slot11, slot10))
			end
		end
	else
		for slot6, slot7 in ipairs(slot0.data.attr) do
			if slot1 < slot6 then
				break
			end

			if not slot0.base_list_right[slot6] then
				slot0.base_list_right[slot6] = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

				slot0.right_bg:addChild(slot0.base_list_right[slot6])
			end

			slot8 = slot0.base_list_right[slot6]

			slot8:setPosition(cc.p(100, 375 - (slot6 - 1) * 35))
			slot8:setString(TI18N("随机属性"))
		end
	end
end

function ArtifactRecastWindow.setSkillInfo(slot0)
	if slot0.data == nil or slot0.data.extra == nil then
		return
	end

	slot1 = 0

	if Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id] then
		slot1 = slot2.skill_num
	end

	slot3 = 1
	slot4 = {}
	slot9 = SortTools.KeyLowerSorter("extra_k")

	table.sort(slot0.data.extra, slot9)

	for slot9, slot10 in pairs(slot0.skill_list_left) do
		slot0:setSkillItemVisible(false, slot10)
	end

	for slot9, slot10 in ipairs(slot0.data.extra) do
		if slot10 and slot10.extra_k and (slot10.extra_k == 1 or slot10.extra_k == 2 or slot10.extra_k == 8) and slot1 >= #slot4 then
			table.insert(slot4, slot10.extra_v)

			if Config.SkillData.data_get_skill(slot10.extra_v) then
				if not slot0.skill_list_left[slot3] then
					slot0.skill_list_left[slot3] = slot0:createSkillItem(slot0.left_bg, slot3)
				end

				slot12 = slot0.skill_list_left[slot3]

				slot0:setSkillItemVisible(true, slot12)
				slot12.skill:setData(slot11)
				slot12.name:setString(slot11.name)
				slot12.desc:setString(transformTextToShort(slot11.des, 36))
				slot12.random_icon:setVisible(false)
				slot12.random_des:setVisible(false)

				slot13 = slot11.level

				if slot11.client_lev and slot11.client_lev > 0 then
					slot13 = slot11.client_lev
				end

				slot12.name:setTextColor(PartnerConst.SkillColor[slot13] or cc.c3b(104, 69, 42))

				slot3 = slot3 + 1
			end
		end
	end

	slot0.cur_skills = slot4
	slot6 = {}

	for slot10, slot11 in ipairs(slot0.data.extra) do
		if slot11 and slot11.extra_k and (slot11.extra_k == 3 or slot11.extra_k == 4 or slot11.extra_k == 9) then
			table.insert(slot6, slot11.extra_v)
		end
	end

	slot0.recast_skills = slot6
	slot7 = slot1

	if next(slot6) ~= nil then
		slot7 = #slot6
	end

	if slot1 < slot7 then
		slot7 = slot1
	end

	for slot11, slot12 in pairs(slot0.skill_list_right) do
		slot0:setSkillItemVisible(false, slot12)
	end

	for slot11 = 1, slot7 do
		if not slot0.skill_list_right[slot11] then
			slot0.skill_list_right[slot11] = slot0:createSkillItem(slot0.right_bg, slot11)
		end

		slot13 = slot0.skill_list_right[slot11]

		slot0:setSkillItemVisible(true, slot13)
		slot13.name:setVisible(true)
		slot13.desc:setVisible(true)
		slot13.random_icon:setVisible(false)
		slot13.random_des:setVisible(false)

		if Config.SkillData.data_get_skill(slot6[slot11]) then
			slot13.skill:setTouchEnabled(true)
			slot13.skill:setData(slot14)
			slot13.name:setString(slot14.name)
			slot13.desc:setString(transformTextToShort(slot14.des, 36))

			slot15 = slot14.level

			if slot14.client_lev and slot14.client_lev > 0 then
				slot15 = slot14.client_lev
			end

			slot13.name:setTextColor(PartnerConst.SkillColor[slot15] or cc.c3b(104, 69, 42))

			if slot0.is_luck_recast and slot0.model:checkIsUnusualSkillById(slot12) then
				slot18 = slot0.main_container:convertToNodeSpace(slot13.skill:convertToWorldSpace(cc.p(0, 0)))

				slot0:handleEffect(true, cc.p(slot18.x + SkillItem.Width * 0.8 * 0.5, slot18.y + SkillItem.Height * 0.8 * 0.5))

				slot0.is_luck_recast = false
			end
		else
			slot13.skill:setData()
			slot13.skill:setTouchEnabled(false)
			slot13.name:setVisible(false)
			slot13.desc:setVisible(false)
			slot13.random_icon:setVisible(true)
			slot13.random_des:setVisible(true)
		end
	end
end

function ArtifactRecastWindow.createSkillItem(slot0, slot1, slot2)
	slot4 = SkillItem.new(true, true, true, 0.8)

	slot1:addChild(slot4)

	slot5 = 207 - (slot2 - 1) * 130

	slot4:setPosition(60, slot5)

	slot7 = createRichLabel(20, cc.c4b(104, 69, 42, 255), cc.p(0, 1), cc.p(110, slot5 + 20), 0, nil, 180)

	slot1:addChild(slot7)

	return {
		skill = slot4,
		name = createLabel(22, cc.c4b(104, 69, 42, 255), nil, 110, slot5 + 25, "", slot1, 1, cc.p(0, 0)),
		desc = slot7,
		random_icon = createSprite(PathTool.getResFrame("artifact", "artifact_1003"), 60, slot5, slot1, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST),
		random_des = createLabel(24, cc.c4b(104, 69, 42, 255), nil, 110, slot5, TI18N("随机技能"), slot1, 1, cc.p(0, 0.5))
	}
end

function ArtifactRecastWindow.setSkillItemVisible(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot2 or {}) do
		slot7:setVisible(slot1)
	end
end

function ArtifactRecastWindow.register_event(slot0)
	registerButtonEventListener(slot0.reset_btn, function ()
		if uv0.data and uv0.data.id and uv0.item_config then
			slot0 = {}
			slot1 = 0

			if uv0.checkbox:isSelected() then
				if uv0.select_luck_type and uv0.select_luck_type == 1 then
					if Config.PartnerArtifactData.data_artifact_const.lucky_item_id and slot2.val then
						if uv0.need_num and BackpackController:getInstance():getModel():getItemNumByBid(slot2.val) < uv0.need_num then
							BackpackController:getInstance():openTipsSource(true, slot2.val)

							return
						end
					end

					slot1 = 1
				elseif uv0.select_luck_type and uv0.select_luck_type == 2 then
					if Config.PartnerArtifactData.data_artifact_const.lucky_item_id2 and slot2.val then
						if uv0.need_num_2 and BackpackController:getInstance():getModel():getItemNumByBid(slot2.val) < uv0.need_num_2 then
							BackpackController:getInstance():openTipsSource(true, slot2.val)

							return
						end
					end

					slot1 = 2
				end
			end

			slot2, slot3 = uv0.model:getArtifactRecastCountByQuality(uv0.item_config.quality)

			if slot3 <= slot2 and slot2 > 0 then
				uv0.is_luck_recast = true
			end

			uv0.ctrl:sender11033(uv0.partner_id, uv0.data.id, slot0, slot1)
		end
	end)
	registerButtonEventListener(slot0.save_btn, function ()
		if uv0.data and uv0.data.id then
			uv0.ctrl:sender11034(uv0.partner_id, uv0.data.id, 1)
		end
	end)
	registerButtonEventListener(slot0.checkbox, function ()
		if uv0.item_config and BackPackConst.quality.orange <= uv0.item_config.quality then
			slot0, slot1 = uv0.model:getArtifactRecastCountByQuality(uv0.item_config.quality)

			if slot1 - slot0 <= 0 and slot0 > 0 then
				uv0.checkbox:setSelected(false)
				message(TI18N("必出稀有,无需勾选"))

				return
			end
		end

		uv0:checkLucType()
		uv0:updateProgressBar()

		if uv0.checkbox:isSelected() == true then
			uv0:handleBtnEffect(true)
		else
			uv0:handleBtnEffect(false)
		end
	end)
	registerButtonEventListener(slot0.cancel_btn, function ()
		if uv0.data and uv0.data.id and uv0.item_config then
			slot0 = 0

			if uv0.checkbox:isSelected() then
				if uv0.select_luck_type and uv0.select_luck_type == 1 then
					if Config.PartnerArtifactData.data_artifact_const.lucky_item_id and slot1.val then
						if uv0.need_num and BackpackController:getInstance():getModel():getItemNumByBid(slot1.val) < uv0.need_num then
							BackpackController:getInstance():openTipsSource(true, slot1.val)

							return
						end
					end

					slot0 = 1
				elseif uv0.select_luck_type and uv0.select_luck_type == 2 then
					if Config.PartnerArtifactData.data_artifact_const.lucky_item_id2 and slot1.val then
						if uv0.need_num_2 and BackpackController:getInstance():getModel():getItemNumByBid(slot1.val) < uv0.need_num_2 then
							BackpackController:getInstance():openTipsSource(true, slot1.val)

							return
						end
					end

					slot0 = 2
				end
			end

			slot1, slot2 = uv0.model:getArtifactRecastCountByQuality(uv0.item_config.quality)

			if slot2 <= slot1 and slot1 > 0 then
				uv0.is_luck_recast = true
			end

			uv0.ctrl:sender11033(uv0.partner_id, uv0.data.id, {}, slot0)
		end
	end)
	registerButtonEventListener(slot0.tips_btn, function (slot0, slot1)
		if Config.PartnerArtifactData.data_artifact_const.lucky_artifact_desc then
			TipsManager:getInstance():showCommonTips(slot2.desc, slot1:getTouchBeganPosition())
		end
	end)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1)
		if Config.PartnerArtifactData.data_artifact_const.recast_rule then
			TipsManager:getInstance():showCommonTips(slot2.desc, slot1:getTouchBeganPosition())
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0.ctrl:openArtifactRecastWindow(false)
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0.ctrl:openArtifactRecastWindow(false)
	end)
	slot0:addGlobalEvent(HeroEvent.Artifact_Recast_Event, function ()
		if not uv0.data or uv0.data.id == 0 then
			return
		end

		if uv0.partner_id and uv0.partner_id ~= 0 then
			for slot4, slot5 in pairs(uv0.model:getPartnerArtifactList(uv0.partner_id)) do
				if slot5.id == uv0.data.id then
					uv0:setData(slot5, uv0.partner_id)

					break
				end
			end
		else
			uv0:setData(BackpackController:getModel():getBackPackItemById(uv0.data.id), uv0.partner_id)
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Artifact_Save_Event, function ()
		if uv0.partner_id and uv0.partner_id ~= 0 then
			for slot4, slot5 in pairs(uv0.model:getPartnerArtifactList(uv0.partner_id)) do
				if slot5.id == uv0.data.id then
					uv0:setData(slot5, uv0.partner_id)

					break
				end
			end
		else
			uv0:setData(BackpackController:getModel():getBackPackItemById(uv0.data.id), uv0.partner_id)
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Artifact_Recast_Count_Event, function ()
		uv0:updateProgressBar()
	end)
	slot0:addGlobalEvent(HeroEvent.Del_Hero_Event, function (slot0)
		if uv0.partner_id then
			for slot4, slot5 in ipairs(slot0) do
				if uv0.partner_id == slot5.partner_id then
					uv0.ctrl:openArtifactRecastWindow(false)
				end
			end
		end
	end)
	slot0:addGlobalEvent(HeroEvent.Artifact_Cost_Select_Event, function (slot0)
		if slot0 then
			uv0.select_luck_type = slot0

			uv0.checkbox:setSelected(true)
		else
			uv0.select_luck_type = nil

			uv0.checkbox:setSelected(false)
		end

		uv0:updateCostInfo()
		uv0:updateProgressBar()
	end)
end

function ArtifactRecastWindow.updateBtnShow(slot0)
	slot0.reset_btn:setVisible(not slot0.is_can_save)
	slot0.save_btn:setVisible(slot0.is_can_save)
	slot0.cancel_btn:setVisible(slot0.is_can_save)

	if slot0.checkbox:isSelected() == true then
		slot0:handleBtnEffect(false)
		slot0:handleBtnEffect(true)
	end
end

function ArtifactRecastWindow.checkLucType(slot0)
	if slot0.checkbox:isSelected() == true then
		if slot0.select_luck_type == nil then
			slot2 = Config.PartnerArtifactData.data_artifact_const.lucky_item_id2
			slot3 = 0
			slot4 = 0

			if Config.PartnerArtifactData.data_artifact_const.lucky_item_id and slot2 then
				slot3 = BackpackController:getInstance():getModel():getItemNumByBid(slot1.val)
				slot4 = BackpackController:getInstance():getModel():getItemNumByBid(slot2.val)
			end

			if slot0.need_num and slot0.need_num > 0 and slot0.need_num_2 and slot0.need_num_2 > 0 then
				if slot0.need_num <= slot3 and slot0.need_num_2 <= slot4 then
					slot0.checkbox:setSelected(false)
					slot0.ctrl:openArtifactRecastCostPanel(true)

					return
				elseif slot0.need_num_2 <= slot4 then
					slot0.select_luck_type = 2
				else
					slot0.select_luck_type = 1
				end
			elseif slot0.need_num_2 and slot0.need_num_2 > 0 and slot0.need_num_2 <= slot4 then
				slot0.select_luck_type = 2
			else
				slot0.select_luck_type = 1
			end
		end
	else
		slot0.select_luck_type = nil
	end

	slot0:updateCostInfo()
end

function ArtifactRecastWindow.updateCostInfo(slot0)
	if not slot0.data or not slot0.data.attr or not slot0.item_config then
		return
	end

	slot1 = false

	if slot0.need_num and slot0.need_num > 0 or slot0.need_num_2 and slot0.need_num_2 > 0 then
		slot0.check_panel:setVisible(true)

		if slot0.checkbox:isSelected() == true then
			if slot0.cost_icon[3] and slot0.cost_txt[3] then
				slot4 = Config.PartnerArtifactData.data_artifact_const.lucky_item_id

				if slot0.select_luck_type and slot0.select_luck_type == 2 then
					slot4 = Config.PartnerArtifactData.data_artifact_const.lucky_item_id2
				end

				if slot4 and slot4.val then
					if Config.ItemData.data_get_data(slot4.val) then
						slot2:loadTexture(PathTool.getItemRes(slot5.icon), LOADTEXT_TYPE)
					end

					slot6 = BackpackController:getInstance():getModel():getItemNumByBid(slot4.val)

					slot3:setString(MoneyTool.GetMoneyString(slot6) .. "/" .. slot0.need_num)

					if slot0.need_num <= slot6 then
						slot3:setTextColor(cc.c3b(255, 246, 228))
					else
						slot3:setTextColor(cc.c3b(253, 71, 71))
					end
				end
			end

			slot1 = true
		end
	else
		slot0.check_panel:setVisible(false)
	end

	if slot0.cost_bg[3] then
		slot2:setVisible(slot1)
	end

	if Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id] and slot3.ref_expend then
		slot4 = {
			207,
			467
		}
		slot5 = {
			133,
			365
		}

		for slot9 = 1, 2 do
			slot11 = slot0.cost_txt[slot9]

			if slot3.ref_expend[slot9] then
				slot14 = slot12[2]

				if Config.ItemData.data_get_data(slot12[1]) then
					slot0.cost_icon[slot9]:loadTexture(PathTool.getItemRes(slot13), LOADTEXT_TYPE)

					slot16 = BackpackController:getInstance():getModel():getItemNumByBid(slot13)

					slot11:setString(MoneyTool.GetMoneyString(slot16) .. "/" .. MoneyTool.GetMoneyString(slot14))

					if slot14 <= slot16 then
						slot11:setTextColor(cc.c3b(255, 246, 228))
					else
						slot11:setTextColor(cc.c3b(253, 71, 71))
					end
				end
			else
				slot11:setString("")
			end

			if slot0.checkbox:isSelected() == true then
				slot0.cost_bg[slot9]:setPositionX(slot5[slot9])
			else
				slot13:setPositionX(slot4[slot9])
			end
		end
	end
end

function ArtifactRecastWindow.openRootWnd(slot0, slot1, slot2)
	if slot1 and slot1.config and BackPackConst.quality.orange <= slot1.config.quality then
		slot0.ctrl:sender11048()
	end

	slot0:setData(slot1, slot2)
end

function ArtifactRecastWindow.close_callback(slot0)
	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	slot0:handleEffect(false)
	slot0:handleBtnEffect(false)
	slot0.ctrl:openArtifactRecastWindow(false)
end
