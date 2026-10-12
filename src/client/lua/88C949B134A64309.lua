EmoguoshiTipsView = EmoguoshiTipsView or BaseClass(BaseView)
slot0 = EmoguoshiController:getInstance()

function EmoguoshiTipsView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Mini
	slot0.layout_name = "emoguoshitujian/emoguoshi_tips"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("emoguoshi", "emoguoshi"),
			type = ResourcesType.plist
		}
	}
	slot0.att_bg_list = {}
	slot0.use_list = {}
	slot0.select_partner_tbl = {}
end

function EmoguoshiTipsView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot1 = slot0.main_panel:getChildByName("container")
	slot0.container_bg = slot1
	slot0.btn_close = slot1:getChildByName("close_btn")
	slot0.label_tips = slot1:getChildByName("tips")

	slot0.label_tips:setVisible(false)

	slot0.tab_panel = slot1:getChildByName("tab_panel")
	slot0.btn_up = slot0.tab_panel:getChildByName("tab_btn_1")
	slot0.base_bg = slot1:getChildByName("base_panel")
	slot0.label_name = slot0.base_bg:getChildByName("name")
	slot0.label_type_name = slot0.base_bg:getChildByName("equip_type")

	slot0.label_type_name:setString(TI18N(slot0.label_type_name:getString()))

	slot5 = "baseattr_panel"
	slot0.base_att_bg = slot1:getChildByName(slot5)

	for slot5 = 1, 2 do
		slot0.att_bg_list[slot5] = {
			slot0.base_att_bg:getChildByName("Image_" .. slot5),
			slot0.base_att_bg:getChildByName("attr_label_" .. slot5),
			slot0.base_att_bg:getChildByName("attr_num_" .. slot5)
		}
	end

	slot0.btn_level = slot0.tab_panel:getChildByName("tab_btn_1")
	slot0.btn_star = slot0.tab_panel:getChildByName("tab_btn_2")
	slot0.btn_source = slot0.tab_panel:getChildByName("tab_btn_3")

	slot0.btn_level:setVisible(false)
	slot0.btn_star:setVisible(false)
	slot0.btn_source:setVisible(false)

	slot0.level_desc_bg = slot1:getChildByName("desc_panel_1")
	slot0.star_desc_bg = slot1:getChildByName("desc_panel_2")
	slot0.juexing_desc_bg = slot1:getChildByName("desc_panel_3")
	slot0.tip_div = slot0.tab_panel:getPositionY() - slot0.label_tips:getPositionY()
	slot0.att_div = slot0.base_att_bg:getPositionY() - slot0.level_desc_bg:getPositionY()
	slot0.base_div = slot0.base_bg:getPositionY() - slot0.level_desc_bg:getPositionY()
	slot0.close_div = slot0.btn_close:getPositionY() - slot0.level_desc_bg:getPositionY()
	slot0.container_size = slot0.container_bg:getContentSize()
	slot0.top_div = slot0.container_size.height - slot0.level_desc_bg:getPositionY()
	slot2, slot3 = slot0.container_bg:getPosition()
	slot0.container_bg_pos = cc.p(slot2, slot3)
end

function EmoguoshiTipsView.getSpecialAtt(slot0, slot1)
	slot3 = slot1.effect_cond
	slot4 = slot1.effect_param

	if slot1.effect == "add_att" and slot3[1] and slot3[2] and slot3[3] then
		slot7 = 0
		slot9 = {}

		for slot13, slot14 in ipairs(slot4) do
			table.insert(slot9, {
				slot14[1],
				slot14[2] * math.floor((slot0.show_info and slot3[3] or uv0:getEffectValue(slot3[1])) / slot3[2])
			})
		end

		slot10, slot11, slot12 = commonGetAttrInfoByKeyValue(slot9[1][1], slot9[1][2])

		return string.format(TI18N(" \n生效数量:%d/%d\n累计加成:%s"), slot7, slot6, TI18N(slot11) .. "+" .. slot12)
	end

	return ""
end

function EmoguoshiTipsView.updateAllInfo(slot0, ...)
	changeAchPoint(slot0.container_bg, cc.p(0.5, 0))

	slot2 = uv0:getGuoShiStar(slot0.id)
	slot3 = uv0:isHadJueXing(slot0.id)

	slot0.btn_source:setVisible(uv0:getGuoShiLevel(slot0.id) <= 0)
	slot0.btn_level:setVisible(slot1 > 0)
	slot0.btn_star:setVisible(slot1 > 0)
	loadSpriteTexture(slot0.base_bg, "tips_" .. uv0:getGuoShiQuality(slot0.id) .. ".png", LOADTEXT_TYPE_PLIST)

	if slot0.show_info then
		slot0.btn_source:setVisible(false)
		slot0.btn_level:setVisible(false)
		slot0.btn_star:setVisible(false)

		slot1 = slot0.show_info.level
		slot2 = slot0.show_info.star
		slot3 = slot0.show_info.juexing
	end

	if not uv0:getPropLevel(slot0.id, uv0:getGuoShiLevel(slot0.id)) then
		slot5 = uv0:getPropLevel(slot0.id, slot1) or uv0:getPropLevel(slot0.id, 1)

		slot0.label_tips:setVisible(true)

		slot7 = 0
		slot8 = 0

		for slot12, slot13 in pairs(slot6.need_items) do
			slot8 = slot13[1]
			slot7 = slot13[2]

			break
		end

		slot9 = BackpackController:getInstance():getModel():getItemNumByBid(slot8)

		slot0.label_tips:setString(string.format(TI18N("集齐%d个碎片可激活此果实(当前：(%d/%d))"), slot7, slot9, slot7))
		slot0.btn_source:setVisible(true)

		if slot7 <= slot9 then
			slot0.label_tips:setTextColor(cc.c3b(54, 239, 128))

			slot0.can_jihuo = true

			slot0.btn_source:getChildByName("label"):setString(TI18N("激活"))
		end
	elseif slot0.show_info then
		slot0.btn_source:setVisible(true)
		slot0.label_tips:setTextColor(cc.c3b(54, 239, 128))
		slot0.label_tips:setString(TI18N("已激活"))
		slot0.label_tips:setVisible(true)

		slot0.go_look = true

		slot0.btn_source:getChildByName("label"):setString(TI18N("前往查看"))
	end

	if not slot0.head then
		slot0.head = BackPackItem.new(true, true, nil, nil, false, false)

		slot0.head:setBaseData(uv0:getGuoShiItemId(slot0.id), 1)
		slot0.head:isChipSprite({})
		slot0.base_bg:getChildByName("item_panel"):getChildByName("Node_1"):addChild(slot0.head)
		slot0.base_bg:getChildByName("item_panel"):getChildByName("Image_bg"):loadTexture(PathTool.getQualityBg(slot4), LOADTEXT_TYPE_PLIST)
		slot0.base_bg:getChildByName("item_panel"):getChildByName("Panel_star_1"):setVisible(false)
		slot0.base_bg:getChildByName("item_panel"):getChildByName("Panel_star_2"):setVisible(false)
		slot0.base_bg:getChildByName("item_panel"):getChildByName("Image_juexing"):setVisible(slot3)

		slot12 = nil

		(uv0:getMaxStar(slot0.id) > 5 and slot9 or slot10):setVisible(not slot3)

		for slot16 = 1, 10 do
			if slot12:getChildByName("star_" .. slot16) then
				slot17:setVisible(slot16 <= slot2)
				slot12:getChildByName("star_gray_" .. slot16):setVisible(slot2 < slot16)
			else
				break
			end
		end
	end

	slot10 = "  "

	slot0.label_name:setString(TI18N(slot5.name) .. slot10 .. "Lv." .. slot1)

	slot9 = uv0
	slot9 = slot9.getGuoShiColor

	slot0.label_name:setTextColor(slot9(slot9, slot0.id))

	for slot9, slot10 in pairs(slot0.att_bg_list) do
		for slot14, slot15 in pairs(slot10) do
			slot15:setVisible(false)
		end
	end

	slot6 = {}
	slot8 = mergeAtt({}, slot5.atts)

	if uv0:getPropStar(slot0.id, slot2) then
		mergeAtt(slot7, slot9.atts)
	end

	if slot3 then
		mergeAtt(slot7, uv0:getPropJueXing(slot0.id).atts)
	end

	for slot13, slot14 in pairs(slot7) do
		if slot13 < 4 then
			slot15 = PathTool.getAttrIconByStr(slot14[1])
			slot16 = Config.AttrData.data_key_to_name[slot14[1]] or ""
			slot17, slot18, slot19 = commonGetAttrInfoByKeyValue(slot14[1], slot14[2])

			if slot0.att_bg_list[slot13] then
				for slot24, slot25 in pairs(slot20) do
					slot25:setVisible(true)
				end

				slot20[1]:loadTexture(slot17, LOADTEXT_TYPE_PLIST)
				slot20[2]:setString(TI18N(slot18))
				slot20[3]:setString(slot19)
			end
		end
	end

	slot10 = {}

	for slot15 = 1, uv0:getMaxLevel(slot0.id) do
		if uv0:getPropLevel(slot0.id, slot15) and slot16.desc ~= "" then
			table.insert(slot10, slot16)
		end
	end

	table.sort(slot10, function (slot0, slot1)
		return slot0.level < slot1.level
	end)

	for slot17, slot18 in ipairs(slot10) do
		slot19 = nil
		slot13 = "" .. ((slot1 >= slot18.level or string.format("<img src=%s visible=true scale=1 /> <div fontColor=#b8b8b8>%s</div>", "emoguoshi_07.png", TI18N(slot18.desc))) and string.format("<img src=%s visible=true scale=1 /> <div fontColor=#36ef80>%s</div>", "emoguoshi_08.png", TI18N(slot18.desc))) .. "\n"
	end

	slot14 = createRichLabel(18, cc.c4b(255, 255, 255, 255), cc.p(0, 1), cc.p(20, 50), 5, nil, 370)

	slot0.level_desc_bg:addChild(slot14)
	slot14:setString(slot13)

	if uv0:getPropStar(slot0.id, slot2) and slot16.desc ~= "" then
		table.insert({}, slot16)
	else
		table.insert(slot15, uv0:getPropStar(slot0.id, 1))
	end

	table.sort(slot15, function (slot0, slot1)
		return slot0.star < slot1.star
	end)

	slot17 = slot2

	if slot1 <= 0 then
		slot17 = 0
	end

	for slot22, slot23 in ipairs(slot15) do
		slot24 = nil
		slot18 = "" .. ((slot17 >= slot23.star or string.format("<img src=%s visible=true scale=1 /> <div fontColor=#b8b8b8>%s</div>", "emoguoshi_07.png", TI18N(slot23.desc))) and string.format("<img src=%s visible=true scale=1 /> <div fontColor=#36ef80>%s</div>", "emoguoshi_08.png", TI18N(slot23.desc))) .. "\n"
	end

	if not slot3 and slot0:getSpecialAtt(slot15[1]) ~= "" then
		slot18 = slot17 <= 0 and slot18 .. string.format("<div fontColor=#b8b8b8>%s</div>", slot19) .. "\n" or slot18 .. string.format("<div fontColor=#36ef80>%s</div>", slot19) .. "\n"
	end

	slot19 = createRichLabel(18, cc.c4b(255, 255, 255, 255), cc.p(0, 1), cc.p(20, 50), 0, nil, 370)

	slot0.star_desc_bg:addChild(slot19)
	slot19:setString(slot18)

	slot20 = ""
	slot21 = nil

	if not slot3 then
		slot21 = string.format("<img src=%s visible=true scale=1 /> <div fontColor=#b8b8b8>%s</div>", "emoguoshi_07.png", TI18N(uv0:getPropJueXing(slot0.id).desc))
	elseif slot0:getSpecialAtt(slot22) ~= "" then
		slot21 = string.format("<img src=%s visible=true scale=1 /> <div fontColor=#36ef80>%s</div>", "emoguoshi_08.png", TI18N(slot22.desc)) .. string.format("\n<div fontColor=#36ef80>%s</div>", slot24) .. "\n"
	end

	slot23 = createRichLabel(18, cc.c4b(255, 255, 255, 255), cc.p(0, 1), cc.p(20, 50), 0, nil, 370)

	slot0.juexing_desc_bg:addChild(slot23)
	slot23:setString(slot20 .. slot21 .. "\n \n")
	slot0.juexing_desc_bg:setPositionY(slot0.tab_panel:getPositionY() + slot23:getContentSize().height + 80)
	slot0.star_desc_bg:setPositionY(slot0.juexing_desc_bg:getPositionY() + slot19:getContentSize().height + 60)
	slot0.level_desc_bg:setPositionY(slot0.star_desc_bg:getPositionY() + slot14:getContentSize().height + 60)
	slot0.base_att_bg:setPositionY(slot0.level_desc_bg:getPositionY() + slot0.att_div)
	slot0.base_bg:setPositionY(slot0.level_desc_bg:getPositionY() + slot0.base_div)
	slot0.btn_close:setPositionY(slot0.level_desc_bg:getPositionY() + slot0.close_div)
	slot0.container_bg:setContentSize(cc.size(slot0.container_size.width, slot0.level_desc_bg:getPositionY() + slot0.top_div))
	changeAchPoint(slot0.container_bg, cc.p(0.5, 0.5))
	slot0.container_bg:setPosition(slot0.container_bg_pos)
end

function EmoguoshiTipsView.register_event(slot0)
	slot0.background:setTouchEnabled(true)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEmoguoTipsView(false)
		end
	end)
	slot0.btn_close:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openEmoguoTipsView(false)
	end, true)
	slot0.btn_level:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_level, function ()
		uv0:openEmoguoTipsView(false)
		uv0:openUpView(true, uv1.id, EmoguoshiConst.upView.level)
	end, true)
	slot0.btn_star:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_star, function ()
		uv0:openEmoguoTipsView(false)
		uv0:openUpView(true, uv1.id, EmoguoshiConst.upView.star)
	end, true)
	slot0.btn_source:setTouchEnabled(true)
	registerButtonEventListener(slot0.btn_source, function ()
		if uv0.can_jihuo then
			uv1:openEmoguoTipsView(false)
			uv1:openUpView(true, uv0.id, EmoguoshiConst.upView.level)

			return
		end

		if uv0.go_look then
			uv1:openEmoguoTipsView(false)
			uv1:openEmoguoTuJianView(false)
			uv1:openEmoguoMainView(true, EmoguoshiConst.mainView.guoshi, uv0.id)

			return
		end

		BackpackController:getInstance():openTipsSource(true, Config.ItemData.data_get_data(uv1:getGuoShiItemId(uv0.id)))
		uv1:openEmoguoTipsView(false)
	end, true)
end

function EmoguoshiTipsView.updateTips(slot0, ...)
	if not slot0.id then
		return
	end

	slot1 = uv0:isCanLevelUp(slot0.id)

	slot0.btn_level:getChildByName("red_point"):setVisible(slot1)
	slot0.btn_star:getChildByName("red_point"):setVisible(uv0:isCanStarUp(slot0.id))
	slot0.btn_source:getChildByName("red_point"):setVisible(slot1 or slot2 or uv0:isCanJueXing(slot0.id))
end

function EmoguoshiTipsView.openRootWnd(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.show_info = slot2

	if slot2 then
		slot0.id = slot2.id
	end

	slot0:updateAllInfo()
	slot0:updateTips()
end

function EmoguoshiTipsView.close_callback(slot0)
	uv0:openEmoguoTipsView(false)
end
