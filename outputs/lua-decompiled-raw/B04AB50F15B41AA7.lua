slot1 = ElfinController:getInstance():getModel()
ElfinInfoWindow = ElfinInfoWindow or BaseClass(BaseView)

function ElfinInfoWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "elfin/elfin_info_window"
	slot0.elfin_step_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("elfin", "elfin_info_bg"),
			type = ResourcesType.single
		}
	}
end

function ElfinInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.con_size = slot1:getContentSize()
	slot0.container = slot1
	slot0.con_size = slot1:getContentSize()

	slot1:getChildByName("skill_title"):setString(TI18N("携带技能"))

	slot0.name_txt = slot1:getChildByName("name_txt")
	slot0.type_img = slot1:getChildByName("type_img")

	slot0.type_img:setZOrder(97)

	slot0.type_bg = slot1:getChildByName("type_bg")

	slot0.type_bg:setZOrder(98)

	slot0.type_name = slot1:getChildByName("type_name")

	slot0.type_name:setZOrder(99)

	slot0.stage_node = slot1:getChildByName("stage_node")
	slot0.skill_name_txt = slot1:getChildByName("skill_name_txt")
	slot0.skill_type_txt = slot1:getChildByName("skill_type_txt")
	slot0.close_btn = slot1:getChildByName("close_btn")

	slot1:getChildByName("score_title"):setString(TI18N("评分："))

	slot0.power_label = CommonNum.new(1, slot1, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(290, 402))
	slot0.power_label:setNum(0)
	slot0.power_label:setScale(0.8)

	slot0.skill_desc_scroll = createScrollView(340, 200, 172, 250, slot1, ccui.ScrollViewDir.vertical)

	slot0.skill_desc_scroll:setAnchorPoint(cc.p(0, 1))
end

function ElfinInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openElfinInfoWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openElfinInfoWindow(false)
	end, true, 1)
end

function ElfinInfoWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function ElfinInfoWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.SpriteData.data_elfin_data(slot1.id) then
		return
	end

	slot0.name_txt:setString(slot1.name or "")
	slot0.power_label:setNum(slot2.power)

	if Config.ItemData.data_get_data(slot1.id) then
		slot0:showElfinStep(slot3.eqm_jie)
		slot0:showBottomEffect(true, slot3.quality)

		slot4 = PathTool.getResFrame("elfin", "elfin_1054")
		slot5 = PathTool.getResFrame("elfin", "txt_cn_elfin_type_1")
		slot6 = cc.c4b(132, 222, 252, 255)
		slot7 = cc.c4b(28, 45, 95, 255)

		if BackPackConst.quality.orange <= slot3.quality then
			slot4 = PathTool.getResFrame("elfin", "elfin_1056")
			slot5 = PathTool.getResFrame("elfin", "txt_cn_elfin_type_3")
			slot6 = cc.c4b(255, 239, 178, 255)
			slot7 = cc.c4b(132, 62, 35, 255)
		elseif slot3.quality == BackPackConst.quality.purple then
			slot4 = PathTool.getResFrame("elfin", "elfin_1055")
			slot5 = PathTool.getResFrame("elfin", "txt_cn_elfin_type_2")
			slot6 = cc.c4b(226, 205, 255, 255)
			slot7 = cc.c4b(81, 53, 127, 255)
		end

		loadSpriteTexture(slot0.type_bg, slot4, LOADTEXT_TYPE_PLIST)
		loadSpriteTexture(slot0.type_img, slot5, LOADTEXT_TYPE_PLIST)
		slot0.type_name:setTextColor(slot6)
		slot0.type_name:enableOutline(slot7, 2)
		slot0.type_name:setString(slot3.use_desc)
	end

	if not slot0.elfin_spine then
		slot0.elfin_spine = createEffectSpine(slot2.effect_id or "E70001", cc.p(slot0.con_size.width * 0.5, 470 + (tonumber(slot2.offset_y) or 0)), cc.p(0, 0), true, PlayerAction.stand)

		slot0.container:addChild(slot0.elfin_spine)
	end

	if slot2.scale_val and slot2.scale_val > 0 then
		slot0.elfin_spine:setScale(slot2.scale_val)
	end

	if not slot0.skill_item then
		slot0.skill_item = SkillItem.new(true, true, true, 0.8, true)

		slot0.skill_item:setPosition(cc.p(110, 255))
		slot0.container:addChild(slot0.skill_item)
	end

	if slot2.skill and Config.SkillData.data_get_skill(slot2.skill) then
		slot0.skill_item:setData(slot5)
		slot0.skill_name_txt:setString(slot5.name .. "Lv." .. slot5.level)

		if slot5.type == "active_skill" then
			slot0.skill_type_txt:setString(TI18N("类型：主动"))
		else
			slot0.skill_type_txt:setString(TI18N("类型：被动"))
		end

		if not slot0.desc_txt then
			slot0.desc_txt = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(0, 0), 5, nil, 340)

			slot0.skill_desc_scroll:addChild(slot0.desc_txt)
		end

		slot0.desc_txt:setString(slot5.des)

		slot6 = slot0.desc_txt:getSize()
		slot7 = math.max(slot6.height, 200)

		slot0.desc_txt:setPositionY(slot7)
		slot0.skill_desc_scroll:setInnerContainerSize(cc.size(slot0.skill_desc_scroll:getContentSize().width, slot7))
		slot0.skill_desc_scroll:setTouchEnabled(slot6.height > 100)
	end
end

function ElfinInfoWindow.showElfinStep(slot0, slot1)
	slot2 = 25
	slot3 = slot0.con_size.width * 0.5 - slot1 * slot2 * 0.5 + slot2 * 0.5

	for slot7 = 1, slot1 do
		if not slot0.elfin_step_list[slot7] then
			slot0.elfin_step_list[slot7] = createImage(slot0.container, PathTool.getResFrame("common", "common_90032"), 0, 0, cc.p(0.5, 0.5), true, 0, false)
		end

		slot0.elfin_step_list[slot7]:setVisible(true)
		slot0.elfin_step_list[slot7]:setPosition(slot3 + (slot7 - 1) * slot2, 785)
	end
end

function ElfinInfoWindow.showBottomEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.bottom_effect then
			slot0.bottom_effect:clearTracks()
			slot0.bottom_effect:removeFromParent()

			slot0.bottom_effect = nil
		end
	else
		slot3 = PlayerAction.action_1

		if BackPackConst.quality.orange <= (slot2 or 0) then
			slot3 = PlayerAction.action_3
		elseif slot2 == BackPackConst.quality.purple then
			slot3 = PlayerAction.action_2
		end

		if not tolua.isnull(slot0.stage_node) and slot0.bottom_effect == nil then
			slot0.bottom_effect = createEffectSpine(Config.EffectData.data_effect_info[1354], cc.p(0, -40), cc.p(0.5, 0), true, slot3)

			slot0.stage_node:addChild(slot0.bottom_effect)
		end
	end
end

function ElfinInfoWindow.close_callback(slot0)
	slot0:showBottomEffect(false)

	if slot0.power_label then
		slot0.power_label:DeleteMe()

		slot0.power_label = nil
	end

	if slot0.skill_item then
		slot0.skill_item:DeleteMe()

		slot0.skill_item = nil
	end

	if slot0.elfin_spine then
		slot0.elfin_spine:clearTracks()
		slot0.elfin_spine:removeFromParent()

		slot0.elfin_spine = nil
	end

	uv0:openElfinInfoWindow(false)
end
