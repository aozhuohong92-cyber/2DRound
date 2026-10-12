ArtifactTipsWindow = ArtifactTipsWindow or BaseClass(BaseView)
slot0 = string.format
slot1 = HeroController:getInstance()

function ArtifactTipsWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.title_str = ""
	slot0.layout_name = "hero/artifact_tips"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("tips", "tips"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("artifact", "artifact"),
			type = ResourcesType.plist
		}
	}
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.base_list = {}
	slot0.skill_list = {}
	slot0.tab_list = {}
end

function ArtifactTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.container_init_size = slot0.container:getContentSize()
	slot0.base_panel = slot0.container:getChildByName("base_panel")

	slot0.base_panel:getChildByName("score_title"):setString(TI18N("评分："))

	slot0.equip_item = BackPackItem.new(true, true, nil, 1, false)

	slot0.equip_item:setPosition(cc.p(72, 68))
	slot0.base_panel:addChild(slot0.equip_item)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.equip_type = slot0.base_panel:getChildByName("equip_type")
	slot5 = 1
	slot0.power_label = CommonNum.new(1, slot0.base_panel, slot5, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(230, 32))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.8)

	slot0.baseattr_panel = slot0.container:getChildByName("baseattr_panel")

	slot0.baseattr_panel:getChildByName("label"):setString(TI18N("基础属性"))

	slot0.baseattr_panel_height = slot0.baseattr_panel:getContentSize().height
	slot0.skill_panel_1 = slot0.container:getChildByName("skill_panel_1")

	slot0.skill_panel_1:getChildByName("label"):setString(TI18N("战技技能"))

	slot0.skill_pre_btn = slot0.skill_panel_1:getChildByName("skill_pre_btn")

	slot0.skill_pre_btn:getChildByName("label"):setString(TI18N("战技预览"))

	slot0.skill_panel_2 = slot0.container:getChildByName("skill_panel_2")
	slot0.skill_panel_height = slot0.skill_panel_2:getContentSize().height
	slot0.skill_panel_3 = slot0.container:getChildByName("skill_panel_3")
	slot0.tab_panel = slot0.container:getChildByName("tab_panel")
	slot0.tab_panel_height = slot0.tab_panel:getContentSize().height

	for slot5 = 1, 4 do
		if slot0.tab_panel:getChildByName("tab_btn_" .. slot5) then
			slot0.tab_list[slot5] = slot6

			slot6:setTitleText(({
				TI18N("合成"),
				TI18N("重铸"),
				TI18N("分解"),
				TI18N("穿戴")
			})[slot5])

			slot6.index = slot5
		end
	end

	slot0.close_btn = slot0.container:getChildByName("close_btn")
end

function ArtifactTipsWindow.register_event(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:clickBtn(slot0.index)
			end
		end)
	end

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openArtifactTipsWindow(false)
			end
		end)
	end

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openArtifactTipsWindow(false)
			end
		end)
	end

	registerButtonEventListener(slot0.skill_pre_btn, function ()
		HeroController:getInstance():openArtifactSkillWindow(true)
	end, true)
end

function ArtifactTipsWindow.clickBtn(slot0, slot1)
	if (slot1 or 1) == PartnerConst.Artifact_Type.Source then
		if slot0.data and slot0.data.config then
			BackpackController:getInstance():openTipsSource(true, slot0.data.config)
		end
	elseif slot1 == PartnerConst.Artifact_Type.Cloth then
		MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
	elseif slot1 == PartnerConst.Artifact_Type.Compose then
		if slot0.open_type == PartnerConst.ArtifactTips.sell then
			GuildmarketplaceController:getInstance():sender26901(slot0.data.id, 1, BackPackConst.Bag_Code.BACKPACK)
		else
			if Config.CityData.data_base[CenterSceneBuild.mall] == nil then
				return
			end

			if MainuiController:getInstance():checkIsOpenByActivate(slot2.activate) then
				ForgeHouseController:getInstance():openForgeHouseView(true, ForgeHouseConst.Tab_Index.Artifact)
			end
		end
	elseif slot1 == PartnerConst.Artifact_Type.Recast then
		uv0:openArtifactRecastWindow(true, slot0.data, slot0.partner_id)
	elseif slot1 == PartnerConst.Artifact_Type.Getoff then
		if slot0.is_off_tips then
			CommonAlert.show(TI18N("卸下该战技后，该战技栏将在7星开启，是否确定？"), TI18N("确定"), function ()
				if uv0.data and uv0.data.id then
					uv1:sender11030(uv0.partner_id, uv0.artifact_pos, uv0.data.id, 0)
				end
			end, TI18N("取消"), nil, , , {
				title = TI18N("卸下提示")
			})
		elseif slot0.data and slot0.data.id then
			uv0:sender11030(slot0.partner_id, slot0.artifact_pos, slot0.data.id, 0)
		end
	elseif slot1 == PartnerConst.Artifact_Type.Replace then
		uv0:openArtifactListWindow(true, slot0.artifact_pos, slot0.partner_id)
	elseif slot1 == PartnerConst.Artifact_Type.Upstar then
		-- Nothing
	elseif slot1 == PartnerConst.Artifact_Type.Resolve and slot0.data and slot0.data.config and slot0.data.config.id and slot0.data.enchant then
		if Config.PartnerArtifactData.data_artifact_resolve[slot0.data.config.id] and slot2[1] then
			CommonAlert.show(string.format(TI18N("分解此战技可以获得<img src=%s visible=true scale=0.35 />%d，是否继续？"), PathTool.getItemRes(slot2[1][1]), slot2[1][2]), TI18N("确定"), function ()
				uv0:sender11035(uv1.data.id)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			message(TI18N("无该战技配置数据"))
		end
	end

	uv0:openArtifactTipsWindow(false)
end

function ArtifactTipsWindow.openRootWnd(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.open_type = slot2 or PartnerConst.ArtifactTips.backpack
	slot0.data = slot1 or {}
	slot0.item_config = slot1.config
	slot0.partner_id = slot3 or 0
	slot0.artifact_pos = slot4 or 1
	slot0.is_off_tips = slot5 or false
	slot0.setting = slot6 or {}
	slot7 = slot0.container_init_size.height
	slot8 = 0

	if slot0.data and slot0.data.extra then
		for slot13, slot14 in ipairs(slot0.data.extra) do
			if slot14.extra_k == 1 or slot14.extra_k == 2 or slot14.extra_k == 8 then
				slot9 = 0 + 1
			end
		end

		slot8 = slot9
	end

	slot9 = false

	if slot0.data.limit_day then
		slot9 = true
		slot7 = slot7 + 30
	end

	if slot8 < 1 then
		slot0.skill_panel_1:setVisible(false)

		slot7 = slot7 - slot0.skill_panel_height
	end

	if slot8 < 2 then
		slot0.skill_panel_2:setVisible(false)

		slot7 = slot7 - slot0.skill_panel_height
	end

	if slot8 < 3 then
		slot0.skill_panel_3:setVisible(false)

		slot7 = slot7 - slot0.skill_panel_height
	end

	if slot0.open_type == PartnerConst.ArtifactTips.partner then
		slot0.tab_list[3]:setTitleText(TI18N("卸下"))

		slot0.tab_list[3].index = PartnerConst.Artifact_Type.Getoff

		slot0.tab_list[4]:setTitleText(TI18N("替换"))

		slot0.tab_list[4].index = PartnerConst.Artifact_Type.Replace
	elseif slot0.open_type == PartnerConst.ArtifactTips.normal then
		slot7 = slot7 - slot0.tab_panel_height

		slot0.tab_panel:setVisible(false)
	elseif slot0.open_type == PartnerConst.ArtifactTips.buy then
		slot7 = slot7 + (slot0:addMarketplaceTime() or 0) + 10 - slot0.tab_panel_height

		slot0.tab_panel:setVisible(false)
	elseif slot0.open_type == PartnerConst.ArtifactTips.sell then
		slot0.tab_list[1]:setTitleText(TI18N("放入"))
		slot0.tab_list[1]:setPositionX(211)
		slot0.tab_list[2]:setVisible(false)
		slot0.tab_list[3]:setVisible(false)
		slot0.tab_list[4]:setVisible(false)

		slot7 = slot7 - slot0.tab_panel_height / 2 + 10
	end

	if slot7 ~= slot0.container_init_size.height then
		slot0.container:setContentSize(cc.size(slot0.container_init_size.width, slot7))
		slot0.close_btn:setPositionY(slot7 - 25)
		slot0.base_panel:setPositionY(slot7 - 4)

		slot10 = slot7 - 4 - slot0.base_panel:getContentSize().height

		if slot9 then
			slot0.show_limit_y = slot10 - 20
			slot10 = slot10 - 30
		end

		slot0.baseattr_panel:setPositionY(slot10)

		slot10 = slot10 - slot0.baseattr_panel:getContentSize().height
		slot11 = 1

		if slot8 == 0 then
			slot0.tab_panel:setPositionY(slot10)

			slot10 = slot10 - 15
		elseif slot8 == 1 then
			slot0.skill_panel_1:setPositionY(slot10)
			slot0.tab_panel:setPositionY(slot0.skill_panel_1:getPositionY() - slot0.skill_panel_1:getContentSize().height)
		elseif slot8 == 2 then
			slot0.skill_panel_1:setPositionY(slot10)
			slot0.skill_panel_2:setPositionY(slot0.skill_panel_1:getPositionY() - slot0.skill_panel_1:getContentSize().height)
			slot0.tab_panel:setPositionY(slot0.skill_panel_2:getPositionY() - slot0.skill_panel_height)
		elseif slot8 == 3 then
			slot0.skill_panel_1:setPositionY(slot10)
			slot0.skill_panel_2:setPositionY(slot0.skill_panel_1:getPositionY() - slot0.skill_panel_1:getContentSize().height)
			slot0.skill_panel_3:setPositionY(slot0.skill_panel_2:getPositionY() - slot0.skill_panel_height)
			slot0.tab_panel:setPositionY(slot0.skill_panel_3:getPositionY() - slot0.skill_panel_height)
		end

		if slot0.setting and slot0.setting.is_market_place and slot0.data.end_time and next(slot0.data.end_time) ~= nil then
			slot0.market_time_label:setPositionY(slot10)
		end
	end

	slot0.score_val = 0

	slot0:setBaseInfo()
	slot0:setBaseAttrInfo()
	slot0:setSkillInfo()
	slot0.power_label:setNum(slot0.score_val)
	slot0:initLimitBuyInfo()
end

function ArtifactTipsWindow.initLimitBuyInfo(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.limit_day then
		if slot0:getLimitBuytLabel() then
			slot2:setString(uv0(TI18N("每日限购<div fontcolor=#249003>%s/%s</div>个"), slot0.data.limit_day, slot0.data.limit_total_num or 0))
		end
	end
end

function ArtifactTipsWindow.getLimitBuytLabel(slot0)
	if slot0.limit_buy_label == nil then
		slot0.limit_buy_label = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 0.5), cc.p(13, slot0.show_limit_y or 0), nil, , 1000)

		slot0.container:addChild(slot0.limit_buy_label)
	end

	return slot0.limit_buy_label
end

function ArtifactTipsWindow.addMarketplaceTime(slot0)
	if slot0.setting and slot0.setting.is_market_place and slot0.data.end_time and next(slot0.data.end_time) ~= nil then
		slot0.market_time_label = createRichLabel(24, cc.c4b(255, 155, 30, 255), cc.p(0, 1), cc.p(17, -10000), 8, nil, 1000)

		slot0.container:addChild(slot0.market_time_label)

		slot2 = slot0.data.end_time[1].end_num or 1
		slot3 = nil

		if (slot0.data.end_time[1].end_unixtime or 0) - GameNet:getInstance():getTime() < 0 then
			slot4 = 0
		end

		slot0.market_time_label:setString((slot4 > 0 or string.format(TI18N("该物品已过期"))) and string.format(TI18N("该物品于<div fontcolor=#249003>%s</div>后过期"), TimeTool.GetTimeFormatDayIIIIII(slot4)))

		return slot0.market_time_label:getContentSize().height
	end
end

function ArtifactTipsWindow.setBaseInfo(slot0)
	if slot0.data == nil or slot0.item_config == nil then
		return
	end

	slot0.equip_item:setData(slot0.data)

	slot2 = 0

	if slot0.item_config.quality >= 0 and slot0.item_config.quality <= 5 then
		slot2 = slot0.item_config.quality
	end

	loadSpriteTexture(slot0.base_panel, PathTool.getResFrame("tips", "tips_" .. slot2), LOADTEXT_TYPE_PLIST)
	slot0.name:setTextColor(BackPackConst.getEquipTipsColor(slot2))
	slot0.name:setString(slot0.item_config.name)
	slot0.equip_type:setString(TI18N("类型：") .. slot0.item_config.type_desc)
end

function ArtifactTipsWindow.setBaseAttrInfo(slot0)
	if not slot0.data or not slot0.data.attr or not slot0.item_config then
		return
	end

	slot2 = 2

	if Config.PartnerArtifactData.data_artifact_data[slot0.item_config.id] then
		slot2 = slot1.attr_num
	end

	slot3 = Config.PartnerArtifactData.data_artifact_attr_score[slot0.item_config.id]

	for slot8, slot9 in ipairs(slot0.data.attr) do
		if slot2 < 1 then
			break
		end

		slot12 = slot9.attr_val / 1000

		if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot9.attr_id]] then
			if not slot0.base_list[slot4] then
				slot0.base_list[slot4] = createRichLabel(22, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(20, 28), nil, , 380)

				slot0.baseattr_panel:addChild(slot0.base_list[slot4])
			end

			slot0.base_list[slot4]:setPositionX(30 + (slot8 - 1) * 200)

			slot16 = PathTool.getAttrIconByStr(slot11)

			if PartnerCalculate.isShowPerByStr(slot11) == true then
				slot12 = slot12 / 10 .. "%"
			end

			slot14:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#c1b7ab> %s：</div><div fontcolor=#ffeedd>%s</div>", PathTool.getResFrame("common", slot16), slot13, slot12))

			slot4 = slot4 + 1
		end

		if slot3 then
			slot0.score_val = slot0.score_val + slot3[slot11] or 0
		end
	end
end

function ArtifactTipsWindow.setSkillInfo(slot0)
	if slot0.data == nil or slot0.data.extra == nil then
		return
	end

	slot1 = 1
	slot2 = Config.PartnerArtifactData.data_artifact_const

	for slot6, slot7 in ipairs(slot0.data.extra) do
		if slot7 and slot7.extra_k and (slot7.extra_k == 1 or slot7.extra_k == 2 or slot7.extra_k == 8) and Config.SkillData.data_get_skill(slot7.extra_v) then
			if not slot0.skill_list[slot1] then
				slot0.skill_list[slot1] = slot0:createSkillItem(slot6, slot0["skill_panel_" .. slot1])
			end

			slot9 = slot0.skill_list[slot1]

			slot9.skill:showLockIcon(false)
			slot9.skill:setData(slot8)
			slot9.name:setString(slot8.name)
			slot9.desc:setString(transformTextToShort(slot8.des, 34))
			slot9.desc:setPositionY(90)

			if slot2["skill_score_" .. (slot8.level or 1)] and slot2["skill_score_" .. slot10].val then
				slot0.score_val = slot0.score_val + slot2["skill_score_" .. slot10].val
			end

			slot1 = slot1 + 1
		end
	end
end

function ArtifactTipsWindow.createSkillItem(slot0, slot1, slot2)
	slot4 = SkillItem.new(true, true, true, 0.8)

	slot2:addChild(slot4)
	slot4:setPosition(70, 62)

	slot6 = createRichLabel(22, cc.c4b(255, 238, 221, 255), cc.p(0, 1), cc.p(140, 88), 4, nil, 260)

	slot2:addChild(slot6)

	return {
		skill = slot4,
		name = createLabel(24, cc.c4b(254, 238, 186, 255), nil, 140, 96, "", slot2, 1, cc.p(0, 0)),
		desc = slot6
	}
end

function ArtifactTipsWindow.close_callback(slot0)
	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.equip_item then
		slot0.equip_item:DeleteMe()

		slot0.equip_item = nil
	end

	for slot4, slot5 in pairs(slot0.skill_list) do
		if slot5.skill then
			slot5.skill:DeleteMe()
		end
	end

	uv0:openArtifactTipsWindow(false)
end
