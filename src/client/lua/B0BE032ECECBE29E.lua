slot0 = string.format
ArtifactRecastPanel = class("ArtifactRecastPanel", function ()
	return ccui.Widget:create()
end)
slot1 = table.insert

function ArtifactRecastPanel.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArtifactRecastPanel.config(slot0)
	slot0.ctrl = HeroController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.size = cc.size(644, 800)

	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(false)

	slot0.is_can_save = false
	slot0.need_list = {}
	slot0.is_send_proto = false
	slot0.base_list_left = {}
	slot0.base_list_right = {}
	slot0.skill_list_left = {}
	slot0.skill_list_right = {}
end

function ArtifactRecastPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/artifact_recast_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.label_panel = ccui.Widget:create()

	slot0.label_panel:setContentSize(slot0.size)
	slot0.label_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.label_panel:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0.root_wnd:addChild(slot0.label_panel)

	slot2 = slot0.main_panel:getChildByName("bg_panel")

	slot2:getChildByName("title_1"):setString(TI18N("重铸前"))
	slot2:getChildByName("title_2"):setString(TI18N("重铸后"))
	slot2:getChildByName("cost_title"):setString(TI18N("消耗"))
	slot2:getChildByName("base_title_1"):setString(TI18N("基础属性"))
	slot2:getChildByName("base_title_2"):setString(TI18N("基础属性"))
	slot2:getChildByName("base_title_3"):setString(TI18N("战技技能"))
	slot2:getChildByName("base_title_4"):setString(TI18N("战技技能"))

	slot0.left_bg = slot2:getChildByName("Image_7")
	slot0.right_bg = slot2:getChildByName("Image_9")
	slot0.explain_btn = slot0.main_panel:getChildByName("explain_btn")
	slot12 = slot0.main_panel:getContentSize()
	slot0.left_item = BackPackItem.new(true, true, nil)

	slot0.left_item:setPosition(cc.p(166, 692))

	slot0.left_item.artifact_name = createLabel(26, cc.c4b(104, 69, 42, 255), nil, 123, 635, "", slot0.label_panel, 1, cc.p(0.5, 0))
	slot0.left_item.skill_list = {}
	slot0.left_item.offx = 166
	slot0.left_item.offy = 692

	slot0.main_panel:addChild(slot0.left_item)

	slot0.right_item = BackPackItem.new(true, true, nil)

	slot0.right_item:setPosition(cc.p(480, 692))

	slot0.right_item.artifact_name = createLabel(26, cc.c4b(104, 69, 42, 255), nil, 546, 635, "", slot0.label_panel, 1, cc.p(0.5, 0))
	slot0.right_item.skill_list = {}
	slot0.right_item.offx = 480
	slot0.right_item.offy = 692

	slot0.main_panel:addChild(slot0.right_item)

	slot0.cost_item = BackPackItem.new(true, true, nil, 0.8)

	slot0.cost_item:setPosition(cc.p(125, 65))
	slot0.main_panel:addChild(slot0.cost_item)

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot13 = slot0.ok_btn:getContentSize()
	slot0.ok_btn_label = createRichLabel(26, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot13.width / 2, slot13.height / 2))

	slot0.ok_btn:addChild(slot0.ok_btn_label)
	slot0.ok_btn_label:setString(TI18N("<div outline=2,#C45A14>重铸</div>"))

	slot0.save_btn = slot0.main_panel:getChildByName("save_btn")

	slot0.save_btn:setTitleText(TI18N("保存"))
	slot0.save_btn:getTitleRenderer():enableOutline(cc.c4b(71, 132, 37, 255), 2)
	slot0.save_btn:setVisible(false)
end

function ArtifactRecastPanel.setData(slot0, slot1, slot2)
	slot0.data = slot1 or {}
	slot0.item_config = slot1.config
	slot0.partner_id = slot2 or 0

	slot0.left_item:setData(slot1)
	slot0.right_item:setData(slot1)

	slot0.lock_data = SysEnv:getInstance():loadArtifactLockStatus() or {}
	slot0.is_can_save = false

	if slot0.data.extra_attr and next(slot0.data.extra_attr) ~= nil then
		slot0.is_can_save = true
		slot0.artifact_lock_data = slot0.lock_data[slot0.data.id] or {
			false,
			false,
			false
		}
	else
		slot0.artifact_lock_data = {
			false,
			false,
			false
		}
	end

	slot0:refreshOkBtnLabel()
	slot0:setBaseAttrInfo()
	slot0:setSkillInfo()
	slot0:updateBtn()
	slot0:updateGoodsList()
end

function ArtifactRecastPanel.setBaseAttrInfo(slot0)
	if not slot0.data or not slot0.data.attr or not slot0.item_config then
		return
	end

	slot1 = 2

	if Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id][slot0.data.enchant or 0] then
		slot1 = math.min(slot2[slot3].attr_num, 2)
	end

	for slot7, slot8 in ipairs(slot0.data.attr) do
		if slot1 < slot7 then
			break
		end

		slot11 = slot8.attr_val / 1000

		if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot8.attr_id]] then
			if not slot0.base_list_left[slot7] then
				slot0.base_list_left[slot7] = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

				slot0.left_bg:addChild(slot0.base_list_left[slot7])
			end

			slot0.base_list_left[slot7]:setPosition(cc.p(30, 410 - (slot7 - 1) * 35))

			slot16 = PathTool.getAttrIconByStr(slot10)

			if PartnerCalculate.isShowPerByStr(slot10) == true then
				slot11 = slot11 / 10 .. "%"
			end

			slot13:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot16), slot12, slot11))
		end
	end

	if slot0.is_can_save then
		for slot7, slot8 in ipairs(slot0.data.extra_attr) do
			if slot1 < slot7 then
				break
			end

			slot11 = slot8.attr_val / 1000

			if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot8.attr_id]] then
				if not slot0.base_list_right[slot7] then
					slot0.base_list_right[slot7] = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

					slot0.right_bg:addChild(slot0.base_list_right[slot7])
				end

				slot0.base_list_right[slot7]:setPosition(cc.p(30, 410 - (slot7 - 1) * 35))

				slot16 = PathTool.getAttrIconByStr(slot10)

				if PartnerCalculate.isShowPerByStr(slot10) == true then
					slot11 = slot11 / 10 .. "%"
				end

				slot13:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#68452a> %s：</div><div fontcolor=#68452a>%s</div>", PathTool.getResFrame("common", slot16), slot12, slot11))
			end
		end
	else
		for slot7, slot8 in ipairs(slot0.data.attr) do
			if slot1 < slot7 then
				break
			end

			if not slot0.base_list_right[slot7] then
				slot0.base_list_right[slot7] = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0, 0.5), cc.p(20, 28), nil, nil, 380)

				slot0.right_bg:addChild(slot0.base_list_right[slot7])
			end

			slot9 = slot0.base_list_right[slot7]

			slot9:setPosition(cc.p(100, 410 - (slot7 - 1) * 35))
			slot9:setString(TI18N("随机属性"))
		end
	end
end

function ArtifactRecastPanel.setSkillInfo(slot0)
	if slot0.data == nil or slot0.data.extra == nil then
		return
	end

	slot1 = 1
	slot2 = {}
	slot7 = SortTools.KeyLowerSorter("extra_k")

	table.sort(slot0.data.extra, slot7)

	for slot7, slot8 in ipairs(slot0.data.extra) do
		if slot8 and slot8.extra_k and (slot8.extra_k == 1 or slot8.extra_k == 2 or slot8.extra_k == 8) then
			table.insert(slot2, slot8.extra_v)

			if Config.SkillData.data_get_skill(slot8.extra_v) then
				if not slot0.skill_list_left[slot1] then
					slot0.skill_list_left[slot1] = slot0:createSkillItem(slot0.left_bg, slot1)
				end

				slot10 = slot0.skill_list_left[slot1]

				slot10.skill:setData(slot9)
				slot10.name:setString(slot9.name)
				slot10.desc:setString(slot9.des)
				slot10.random_icon:setVisible(false)
				slot10.random_des:setVisible(false)
				slot10.name:setTextColor(PartnerConst.SkillColor[slot9.level] or cc.c3b(104, 69, 42))

				if slot0.artifact_lock_data[slot1] or false then
					slot10.lock_btn:loadTextures(PathTool.getResFrame("artifact", "artifact_1002"))
				else
					slot10.lock_btn:loadTextures(PathTool.getResFrame("artifact", "artifact_1001"))
				end

				slot1 = slot1 + 1
			end
		end
	end

	slot0.cur_skills = slot2
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.data.extra) do
		if slot9 and slot9.extra_k and (slot9.extra_k == 3 or slot9.extra_k == 4 or slot9.extra_k == 9) then
			table.insert(slot4, slot9.extra_v)
		end
	end

	slot0.recast_skills = slot4

	for slot8 = 1, slot1 - 1 do
		if not slot0.skill_list_right[slot8] then
			slot0.skill_list_right[slot8] = slot0:createSkillItem(slot0.right_bg, slot8)
		end

		slot10 = slot0.skill_list_right[slot8]

		if not (slot0.artifact_lock_data[slot1] or false) and slot4[slot8] or slot9 then
			slot11 = slot4[slot8]

			if slot9 then
				slot11 = slot2[slot8]
			end

			slot10.name:setVisible(true)
			slot10.desc:setVisible(true)
			slot10.lock_btn:setVisible(false)
			slot10.random_icon:setVisible(false)
			slot10.random_des:setVisible(false)

			if Config.SkillData.data_get_skill(slot11) then
				slot10.skill:setData(slot12)
				slot10.name:setString(slot12.name)
				slot10.desc:setString(slot12.des)
				slot10.name:setTextColor(PartnerConst.SkillColor[slot12.level] or cc.c3b(104, 69, 42))
			end
		else
			slot10.skill:setData()
			slot10.name:setVisible(false)
			slot10.desc:setVisible(false)
			slot10.lock_btn:setVisible(false)
			slot10.random_icon:setVisible(true)
			slot10.random_des:setVisible(true)
		end
	end
end

function ArtifactRecastPanel.refreshRightSkillItem(slot0, slot1)
	if slot0.skill_list_right[slot1] then
		if not (slot0.artifact_lock_data[slot1] or false) then
			slot2.skill:setData()
			slot2.name:setVisible(false)
			slot2.desc:setVisible(false)
			slot2.lock_btn:setVisible(false)
			slot2.random_icon:setVisible(true)
			slot2.random_des:setVisible(true)
		else
			slot2.name:setVisible(true)
			slot2.desc:setVisible(true)
			slot2.lock_btn:setVisible(false)
			slot2.random_icon:setVisible(false)
			slot2.random_des:setVisible(false)

			if Config.SkillData.data_get_skill(slot0.cur_skills[slot1]) then
				slot2.skill:setData(slot5)
				slot2.name:setString(slot5.name)
				slot2.desc:setString(slot5.des)
				slot2.name:setTextColor(PartnerConst.SkillColor[slot5.level] or cc.c3b(104, 69, 42))
			end
		end
	end

	slot0:refreshOkBtnLabel()
end

function ArtifactRecastPanel.refreshOkBtnLabel(slot0)
	for slot5, slot6 in pairs(slot0.artifact_lock_data) do
		if slot6 == true then
			slot1 = 0 + 1
		end
	end

	if Config.PartnerArtifactData.data_artifact_recast[slot1] and slot2.expend then
		slot0.ok_btn_label:setString(string.format(TI18N("<img src='%s' scale=0.3 /><div outline=2,#C45A14>%d 重铸</div>"), PathTool.getItemRes(slot2.expend[1][1]), slot2.expend[1][2]))
	else
		slot0.ok_btn_label:setString(TI18N("<div outline=2,#C45A14>重铸</div>"))
	end
end

function ArtifactRecastPanel.createSkillItem(slot0, slot1, slot2)
	slot4 = SkillItem.new(true, true, true, 0.8)

	slot1:addChild(slot4)

	slot5 = 262 - (slot2 - 1) * 105

	slot4:setPosition(60, slot5)

	slot7 = createRichLabel(20, cc.c4b(104, 69, 42, 255), cc.p(0, 1), cc.p(110, slot5 + 20), 0, nil, 190)

	slot1:addChild(slot7)

	slot9 = createButton(slot1, "", 25, slot5 + 38, nil, PathTool.getResFrame("artifact", "artifact_1001"))

	slot9:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.artifact_lock_data[uv1] and not uv0:checkSkillIsCanLock() then
				return
			end

			if uv0.artifact_lock_data[uv1] == true then
				uv0.artifact_lock_data[uv1] = false

				uv2:loadTextures(PathTool.getResFrame("artifact", "artifact_1001"))
			else
				uv0.artifact_lock_data[uv1] = true

				uv2:loadTextures(PathTool.getResFrame("artifact", "artifact_1002"))
			end

			uv0:refreshOkBtnLabel()

			if not uv0.is_can_save then
				uv0:refreshRightSkillItem(uv1)
			end
		end
	end)

	return {
		skill = slot4,
		name = createLabel(22, cc.c4b(104, 69, 42, 255), nil, 110, slot5 + 25, "", slot1, 1, cc.p(0, 0)),
		desc = slot7,
		lock_status = false,
		lock_btn = slot9,
		random_icon = createSprite(PathTool.getResFrame("artifact", "artifact_1003"), 60, slot5, slot1, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST),
		random_des = createLabel(24, cc.c4b(104, 69, 42, 255), nil, 110, slot5, TI18N("随机技能"), slot1, 1, cc.p(0, 0.5))
	}
end

function ArtifactRecastPanel.checkSkillIsCanLock(slot0)
	slot1 = #slot0.cur_skills

	for slot6, slot7 in pairs(slot0.artifact_lock_data) do
		if slot7 == true then
			slot2 = 0 + 1
		end
	end

	if slot2 >= slot1 - 1 then
		message(TI18N("无法锁定全部技能"))

		return false
	end

	return true
end

function ArtifactRecastPanel.registerEvents(slot0)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.id then
				slot2 = {}

				for slot6, slot7 in pairs(uv0.cur_skills) do
					if uv0.artifact_lock_data[slot6] == true then
						table.insert(slot2, {
							skill_id = slot7
						})
					end
				end

				uv0.ctrl:sender11033(uv0.partner_id, uv0.data.id, slot2)
			end
		end
	end)
	slot0.save_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.id then
				uv0.ctrl:sender11034(uv0.partner_id, uv0.data.id)
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

	if not slot0.recast_success_event then
		slot0.recast_success_event = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Recast_Event, function ()
			if not uv0.data or uv0.data.id == 0 then
				return
			end

			uv0.lock_data = uv0.lock_data or {}
			uv0.artifact_lock_data = uv0.artifact_lock_data or {
				false,
				false,
				false
			}
			uv0.lock_data[uv0.data.id] = uv0.artifact_lock_data

			SysEnv:getInstance():saveArtifactLockStatus(uv0.lock_data)

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

	if not slot0.recast_save_event then
		slot0.recast_save_event = GlobalEvent:getInstance():Bind(HeroEvent.Artifact_Save_Event, function ()
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

function ArtifactRecastPanel.updateBtn(slot0)
	slot0.save_btn:setVisible(slot0.is_can_save)
end

function ArtifactRecastPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ArtifactRecastPanel.updateGoodsList(slot0)
	if slot0.cost_item and Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id][slot0.data.enchant or 0] and slot1[slot2].ref_expend and next(slot1[slot2].ref_expend) ~= nil then
		slot3 = slot1[slot2].ref_expend[1][1]

		slot0.cost_item:setData(Config.ItemData.data_get_data(slot3))
		slot0.cost_item:setDefaultTip()
		slot0.cost_item:setNeedNum(slot1[slot2].ref_expend[1][2], BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot3))
	end
end

function ArtifactRecastPanel.DeleteMe(slot0)
	if slot0.recast_success_event then
		GlobalEvent:getInstance():UnBind(slot0.recast_success_event)

		slot0.recast_success_event = nil
	end

	if slot0.recast_save_event then
		GlobalEvent:getInstance():UnBind(slot0.recast_save_event)

		slot0.recast_save_event = nil
	end

	if slot0.left_item then
		slot0.left_item:DeleteMe()

		slot0.left_item = nil
	end

	if slot0.right_item then
		slot0.right_item:DeleteMe()

		slot0.right_item = nil
	end

	if slot0.cost_item then
		slot0.cost_item:DeleteMe()

		slot0.cost_item = nil
	end

	slot0.is_send_proto = false
end
