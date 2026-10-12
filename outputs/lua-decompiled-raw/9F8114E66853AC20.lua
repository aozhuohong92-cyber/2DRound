slot0 = string.format
ArtifactComposePanel = class("ArtifactComposePanel", function ()
	return ccui.Widget:create()
end)

function ArtifactComposePanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArtifactComposePanel.config(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.size = cc.size(644, 800)

	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(false)

	slot0.select_item = 0
	slot0.arrow_list = {}
	slot0.left_attr_labels = {}
	slot0.left_skill_labels = {}
	slot0.right_attr_labels = {}
	slot0.right_skill_labels = {}
	slot0.middle_attr_labels = {}
	slot0.middle_skill_labels = {}
	slot0.chose_item_list = {}
end

function ArtifactComposePanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/artifact_compose_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.label_panel = ccui.Widget:create()

	slot0.label_panel:setContentSize(slot0.size)
	slot0.label_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.label_panel:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.root_wnd:addChild(slot0.label_panel)

	slot0.max_panel = slot0.main_panel:getChildByName("max_panel")

	slot0.max_panel:setVisible(false)

	slot0.bg_panel = slot0.main_panel:getChildByName("bg_panel")
	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn_label = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0.5, 0.5), cc.p(84, 32))

	slot0.ok_btn:addChild(slot0.ok_btn_label)

	slot0.explain_btn = slot0.main_panel:getChildByName("explain_btn")
	slot0.tips_label = slot0.max_panel:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("已达最大星级"))

	slot2 = slot0.main_panel:getChildByName("attr_panel")
	slot0.attr_panel = slot2

	slot2:getChildByName("atttr_label"):setString(TI18N("升星效果"))

	slot7 = "score_label"
	slot0.score_label = slot0.max_panel:getChildByName(slot7)

	for slot7 = 1, 5 do
		if slot2:getChildByName("arrow_" .. slot7) then
			slot0.arrow_list[slot7] = slot8
		end
	end
end

function ArtifactComposePanel.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1 or {}
	slot0.item_config = slot1.config
	slot0.partner_id = slot2 or 0

	if not slot0.item_config then
		return
	end

	slot3 = slot0.data.enchant

	if not Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id] or not slot4[slot3] then
		return
	end

	slot0.artifact_config = slot4
	slot6 = slot3 >= tableLen(slot4) - 1
	slot0.is_max = slot6

	slot0.max_panel:setVisible(slot6)
	slot0.bg_panel:setVisible(not slot6)
	slot0.ok_btn:setVisible(not slot6)

	for slot10, slot11 in pairs(slot0.arrow_list) do
		slot11:setVisible(not slot6)
	end

	slot7 = slot0.main_panel:getContentSize()

	if slot6 then
		if not slot0.max_item then
			slot0.max_item = BackPackItem.new(true, true, nil, 0.9)

			slot0.max_item:setPosition(cc.p(slot7.width / 2, 630))
			slot0.main_panel:addChild(slot0.max_item)

			slot0.max_item.artifact_name = createLabel(26, cc.c4b(104, 69, 42, 255), nil, 322, 690, "", slot0.label_panel, 1, cc.p(0.5, 0))
			slot0.max_item.skill_list = {}
			slot0.max_item.offx = slot7.width / 2
			slot0.max_item.offy = 630
		end

		slot0.max_item:setData(slot0.data)
		slot0.max_item.artifact_name:setString(slot0.item_config.name or "")
	else
		slot8 = slot4[slot3].star_expend[1] or {}
		slot11 = slot8[1] or 1
		slot10 = slot8[2] or 0
		slot11 = MoneyTool.GetMoneyString(slot10)

		slot0.ok_btn_label:setString(uv0(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#ffffff outline=2,#C45A14>%s 升星</div>"), PathTool.getItemRes(slot11), MoneyTool.GetMoneyString(slot10, false)))

		if not slot0.left_item then
			slot0.left_item = BackPackItem.new(true, true, nil, 0.9)

			slot0.left_item:setPosition(cc.p(slot7.width / 2 - 190, 630))
			slot0.main_panel:addChild(slot0.left_item)

			slot0.left_item.artifact_name = createLabel(26, cc.c4b(104, 69, 42, 255), nil, 132, 690, "", slot0.label_panel, 1, cc.p(0.5, 0))
			slot0.left_item.skill_list = {}
			slot0.left_item.offx = slot7.width / 2 - 190
			slot0.left_item.offy = 630
		end

		slot0.left_item:setData(slot0.data)
		slot0.left_item.artifact_name:setString(slot0.item_config.name or "")

		if not slot0.right_item then
			slot0.right_item = BackPackItem.new(true, true, nil, 0.9)

			slot0.right_item:setPosition(cc.p(slot7.width / 2 + 190, 630))

			slot0.right_item.artifact_name = createLabel(26, cc.c4b(104, 69, 42, 255), nil, 512, 690, "", slot0.label_panel, 1, cc.p(0.5, 0))
			slot0.right_item.skill_list = {}
			slot0.right_item.offx = slot7.width / 2 + 190
			slot0.right_item.offy = 630

			slot0.main_panel:addChild(slot0.right_item)
		end

		slot12 = deepCopy(slot0.data)
		slot12.enchant = slot12.enchant + 1

		slot0.right_item:setData(slot12)
		slot0.right_item.artifact_name:setString(slot0.item_config.name or "")

		if not slot0.end_item then
			slot0.end_item = BackPackItem.new(true, true, nil, 0.9)

			slot0.end_item:setPosition(cc.p(slot7.width / 2, 145))

			slot0.end_item.skill_list = {}
			slot0.end_item.offx = slot7.width / 2
			slot0.end_item.offy = 145

			slot0.end_item:showAddIcon(true)

			slot0.end_item.artifact_name = createLabel(26, cc.c4b(104, 69, 42, 255), nil, 322, 200, TI18N("放入战技"), slot0.label_panel, 1, cc.p(0.5, 0))

			slot0.main_panel:addChild(slot0.end_item)
			slot0.end_item:showAddIcon(true, 2)
			slot0.end_item:addBtnCallBack(function ()
				uv0.ctrl:openArtifactChoseWindow(true, {
					id = uv0.data.id,
					bid = uv0.item_config.id,
					max_num = uv0.artifact_config[uv0.data.enchant].star_num,
					chose_list = uv0.chose_item_list or {}
				}, handler(uv0, uv0._onChoseCallBack))
			end)
		end

		slot0.end_item:setData(slot0.data)
		slot0.end_item:setEquipJie(false)

		slot0.need_num = slot0.artifact_config[slot3].star_num

		slot0.end_item:setNeedNum(slot0.need_num, 0)
		slot0.end_item:setItemIconUnEnabled(true)
	end

	if slot0.max_item then
		slot0.max_item:setVisible(slot6)
		slot0.max_item.artifact_name:setVisible(slot6)
	end

	if slot0.left_item then
		slot0.left_item:setVisible(not slot6)
		slot0.left_item.artifact_name:setVisible(not slot6)
	end

	if slot0.right_item then
		slot0.right_item:setVisible(not slot6)
		slot0.right_item.artifact_name:setVisible(not slot6)
	end

	if slot0.end_item then
		slot0.end_item:setVisible(not slot6)
		slot0.end_item.artifact_name:setVisible(not slot6)
	end

	for slot11, slot12 in pairs(slot0.left_attr_labels) do
		slot12:setVisible(false)
	end

	for slot11, slot12 in pairs(slot0.left_skill_labels) do
		slot12:setVisible(false)
	end

	for slot11, slot12 in pairs(slot0.right_attr_labels) do
		slot12:setVisible(false)
	end

	for slot11, slot12 in pairs(slot0.right_skill_labels) do
		slot12:setVisible(false)
	end

	for slot11, slot12 in pairs(slot0.middle_attr_labels) do
		slot12:setVisible(false)
	end

	for slot11, slot12 in pairs(slot0.middle_skill_labels) do
		slot12:setVisible(false)
	end

	slot0.chose_item_list = {}
	slot0.middle_index = 1
	slot0.arrow_num = 0

	slot0:setBaseAttrInfo(slot6)
	slot0:setSkillInfo(slot6)

	if not slot6 then
		for slot11, slot12 in pairs(slot0.arrow_list) do
			slot12:setVisible(slot11 <= slot0.arrow_num)
		end
	end
end

function ArtifactComposePanel._onChoseCallBack(slot0, slot1)
	slot0.chose_item_list = slot1

	slot0.end_item:setNeedNum(slot0.need_num, #slot1)

	if slot0.need_num <= #slot1 then
		slot0.end_item:setItemIconUnEnabled(false)
	else
		slot0.end_item:setItemIconUnEnabled(true)
	end
end

function ArtifactComposePanel.setBaseAttrInfo(slot0, slot1)
	if not slot0.data or not slot0.data.attr or not slot0.item_config then
		return
	end

	slot2 = 2

	if Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id][slot0.data.enchant or 0] then
		slot2 = math.min(slot3[slot4].attr_num, 2)
	end

	if slot1 then
		slot5 = 1

		for slot9, slot10 in ipairs(slot0.data.attr) do
			if slot9 <= slot2 then
				slot13 = slot10.attr_val / 1000

				if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot10.attr_id]] then
					if not slot0.middle_attr_labels[slot9] then
						slot0.middle_attr_labels[slot9] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

						slot0.attr_panel:addChild(slot0.middle_attr_labels[slot9])
					end

					slot15 = slot0.middle_attr_labels[slot9]

					slot15:setVisible(true)
					slot15:setPosition(cc.p(311.5, 224 - (slot9 - 1) * 50))

					slot18 = PathTool.getAttrIconByStr(slot12)

					if PartnerCalculate.isShowPerByStr(slot12) == true then
						slot13 = slot13 / 10 .. "%"
					end

					slot15:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot18), slot14, slot13))

					slot5 = slot5 + 1
				end
			end
		end

		slot0.middle_index = slot5
	else
		for slot8, slot9 in ipairs(slot0.data.attr) do
			if slot8 <= slot2 then
				slot12 = slot9.attr_val / 1000

				if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot9.attr_id]] then
					if not slot0.left_attr_labels[slot8] then
						slot0.left_attr_labels[slot8] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

						slot0.attr_panel:addChild(slot0.left_attr_labels[slot8])
					end

					slot14 = slot0.left_attr_labels[slot8]

					slot14:setVisible(true)
					slot14:setPosition(cc.p(156, 224 - (slot8 - 1) * 50))

					slot17 = PathTool.getAttrIconByStr(slot11)

					if PartnerCalculate.isShowPerByStr(slot11) == true then
						slot12 = slot12 / 10 .. "%"
					end

					slot14:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot17), slot13, slot12))
				end
			end
		end

		slot5 = slot0.data.enchant

		if Config.PartnerArtifactData.data_artifact_attr[slot0.item_config.id] and slot6[slot5 + 1] then
			slot7 = slot6[slot5 + 1]
			slot8 = 1

			for slot12, slot13 in ipairs(slot0.data.attr) do
				if slot12 <= slot2 then
					slot16 = 0
					slot17 = Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot13.attr_id]]

					for slot21, slot22 in pairs(slot7) do
						if slot21 == slot15 then
							slot16 = slot22

							break
						end
					end

					if slot17 then
						if not slot0.right_attr_labels[slot12] then
							slot0.right_attr_labels[slot12] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

							slot0.attr_panel:addChild(slot0.right_attr_labels[slot12])
						end

						slot18 = slot0.right_attr_labels[slot12]

						slot18:setVisible(true)
						slot18:setPosition(cc.p(467, 224 - (slot12 - 1) * 50))

						slot21 = PathTool.getAttrIconByStr(slot15)

						if PartnerCalculate.isShowPerByStr(slot15) == true then
							slot16 = slot16 / 10 .. "%"
						end

						slot18:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot21), slot17, slot16))

						slot8 = slot8 + 1
						slot0.arrow_num = slot0.arrow_num + 1
					end
				end
			end

			slot0.right_atte_index = slot8
		end

		if slot0.artifact_config[slot5 + 1].attr_num - #slot0.data.attr > 0 then
			slot8 = slot0.right_atte_index

			for slot12 = 1, slot7 do
				if not slot0.right_attr_labels[slot8] then
					slot0.right_attr_labels[slot8] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

					slot0.attr_panel:addChild(slot0.right_attr_labels[slot8])
				end

				slot13 = slot0.right_attr_labels[slot8]

				slot13:setVisible(true)
				slot13:setPosition(cc.p(467, 224 - (#slot0.data.attr + slot12 - 1) * 50))
				slot13:setString(uv0(TI18N("<div fontcolor=#249003 href=xxx>解锁第%s属性</div>"), StringUtil.numToChinese(#slot0.data.attr + slot12)))

				slot8 = slot8 + 1
				slot0.arrow_num = slot0.arrow_num + 1
			end
		end

		slot0.attr_num = #slot0.data.attr + slot7
	end
end

function ArtifactComposePanel.setSkillInfo(slot0, slot1)
	if slot1 then
		if slot0.data == nil or slot0.data.extra == nil then
			return
		end

		slot2 = slot0.middle_index
		slot3 = 0
		slot4 = Config.PartnerArtifactData.data_artifact_const

		for slot8, slot9 in ipairs(slot0.data.extra) do
			if slot9 and slot9.extra_k and (slot9.extra_k == 1 or slot9.extra_k == 2 or slot9.extra_k == 8) and Config.SkillData.data_get_skill(slot9.extra_v) then
				if not slot0.middle_skill_labels[slot8] then
					slot0.middle_skill_labels[slot8] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

					slot0.attr_panel:addChild(slot0.middle_skill_labels[slot8])
				end

				slot11 = slot0.middle_skill_labels[slot8]

				slot11:setVisible(true)
				slot11:setPosition(cc.p(311.5, 224 - (slot2 - 1) * 50))
				slot11:setString(uv0("<div fontcolor=#249003 href=%d>【%s】</div>", slot10.bid, slot10.name))
				slot11:addTouchLinkListener(handler(slot0, slot0._onClickSkillLabel), {
					"href"
				})

				if slot4["skill_score_" .. (slot10.level or 1)] and slot4["skill_score_" .. slot15].val then
					slot3 = slot3 + slot4["skill_score_" .. slot15].val
				end

				slot2 = slot2 + 1
			end
		end

		slot0.score_label:setString(uv0(TI18N("评分:%d"), slot3))
	else
		slot0.attr_num = slot0.attr_num or 0

		if slot0.data ~= nil and slot0.data.extra ~= nil then
			slot2 = 1

			for slot6, slot7 in ipairs(slot0.data.extra) do
				if slot7 and slot7.extra_k and (slot7.extra_k == 1 or slot7.extra_k == 2 or slot7.extra_k == 8) and Config.SkillData.data_get_skill(slot7.extra_v) then
					if not slot0.left_skill_labels[slot2] then
						slot0.left_skill_labels[slot2] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

						slot0.attr_panel:addChild(slot0.left_skill_labels[slot2])
					end

					slot9 = slot0.left_skill_labels[slot2]

					slot9:setVisible(true)
					slot9:setPosition(cc.p(156, 224 - (slot0.attr_num + slot2 - 1) * 50))
					slot9:setString(uv0("<div fontcolor=#249003 href=%d>【%s】</div>", slot8.bid, slot8.name))
					slot9:addTouchLinkListener(handler(slot0, slot0._onClickSkillLabel), {
						"href"
					})

					slot2 = slot2 + 1
				end
			end
		end

		slot2 = 0

		if slot0.data ~= nil and slot0.data.extra ~= nil then
			slot3 = 1

			for slot7, slot8 in ipairs(slot0.data.extra) do
				if slot8 and slot8.extra_k and (slot8.extra_k == 1 or slot8.extra_k == 2 or slot8.extra_k == 8) and Config.SkillData.data_get_skill(slot8.extra_v) then
					if not slot0.right_skill_labels[slot3] then
						slot0.right_skill_labels[slot3] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

						slot0.attr_panel:addChild(slot0.right_skill_labels[slot3])
					end

					slot10 = slot0.right_skill_labels[slot3]

					slot10:setVisible(true)
					slot10:setPosition(cc.p(467, 224 - (slot0.attr_num + slot3 - 1) * 50))
					slot10:setString(uv0("<div fontcolor=#249003 href=%d>【%s】</div>", slot9.bid, slot9.name))
					slot10:addTouchLinkListener(handler(slot0, slot0._onClickSkillLabel), {
						"href"
					})

					slot3 = slot3 + 1
					slot2 = slot2 + 1
					slot0.arrow_num = slot0.arrow_num + 1
				end
			end

			slot0.right_skill_index = slot3
		end

		if slot0.artifact_config[slot0.data.enchant + 1].skill_num - slot2 > 0 then
			slot5 = slot0.right_skill_index

			for slot9 = 1, slot4 do
				if not slot0.right_skill_labels[slot5] then
					slot0.right_skill_labels[slot5] = createRichLabel(24, cc.c4b(193, 183, 171, 255), cc.p(0.5, 0.5), cc.p(20, 28), nil, , 380)

					slot0.attr_panel:addChild(slot0.right_skill_labels[slot5])
				end

				slot10 = slot0.right_skill_labels[slot5]

				slot10:setVisible(true)
				slot10:setPosition(cc.p(467, 224 - (slot0.attr_num + slot2 + slot9 - 1) * 50))
				slot10:setString(uv0(TI18N("<div fontcolor=#249003 href=xxx>解锁第%s被动技能</div>"), StringUtil.numToChinese(slot2 + slot9)))

				slot5 = slot5 + 1
				slot0.arrow_num = slot0.arrow_num + 1
			end
		end
	end
end

function ArtifactComposePanel._onClickSkillLabel(slot0, slot1, slot2)
	if slot1 == "href" and Config.SkillData.data_get_skill(slot2) then
		TipsManager:getInstance():showSkillTips(slot4)
	end
end

function ArtifactComposePanel.registerEvents(slot0)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				slot2 = uv0.data.id
				slot3 = {}

				for slot7, slot8 in pairs(uv0.chose_item_list) do
					table.insert(slot3, {
						artifact_id = slot8
					})
				end

				if #slot3 < uv0.need_num then
					message(TI18N("材料不足"))
				else
					uv0.ctrl:sender11032(uv0.partner_id, slot2, slot3)
				end
			end
		end
	end)
	slot0.explain_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if Config.PartnerArtifactData.data_artifact_const.artifact_rule then
				TipsManager:getInstance():showCommonTips(slot2.desc, slot0:getTouchBeganPosition())
			end
		end
	end)

	if not slot0.compose_success_event then
		slot0.compose_success_event = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_UpStar_Event, function ()
			if not uv0.data or not uv0.data.id then
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
	end
end

function ArtifactComposePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArtifactComposePanel.DeleteMe(slot0)
	if slot0.left_item then
		slot0.left_item:DeleteMe()

		slot0.left_item = nil
	end

	if slot0.right_item then
		slot0.right_item:DeleteMe()

		slot0.right_item = nil
	end

	if slot0.end_item then
		slot0.end_item:DeleteMe()

		slot0.end_item = nil
	end

	if slot0.compose_success_event then
		GlobalEvent:getInstance():UnBind(slot0.compose_success_event)

		slot0.compose_success_event = nil
	end
end
