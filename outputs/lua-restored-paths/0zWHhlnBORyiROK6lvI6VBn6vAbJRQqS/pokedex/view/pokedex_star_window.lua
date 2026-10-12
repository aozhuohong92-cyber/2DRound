PokedexStarWindow = PokedexStarWindow or BaseClass(BaseView)

function PokedexStarWindow.__init(slot0, slot1)
	slot0.ctrl = PokedexController:getInstance()
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/partner_star_up_window"
	slot0.title = TI18N("星数提升") or ""
	slot0.view_tag = ViewMgrTag.MSG_TAG
	slot0.attr_list = {}
	slot0.effect_cache_list = {}
	slot0.res_list = {}
	slot0.data = slot1
end

function PokedexStarWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.back_panel = slot0.main_container:getChildByName("back_panel")

	slot0.back_panel:setScale(display.getMaxScale())

	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_width = slot0.title_container:getContentSize().width
	slot0.title_height = slot0.title_container:getContentSize().height

	createImage(slot0.main_container, PathTool.getResFrame("common", "common_90011"), 245, 350, cc.p(0.5, 0), true, 0, false):setScale(0.7)
	createImage(slot0.main_container, PathTool.getResFrame("common", "common_90011"), 430, 350, cc.p(0.5, 0), true, 0, false):setScale(0.7)

	slot0.old_star_label = createLabel(26, Config.ColorData.data_color4[1], nil, 275, 355, "", slot0.main_container, 2, cc.p(0.5, 0))
	slot0.new_star_label = createLabel(26, Config.ColorData.data_color4[1], nil, 455, 355, "", slot0.main_container, 2, cc.p(0, 0))
	slot6 = createImage(slot0.main_container, PathTool.getResFrame("common", "common_30014"), 310, 343, cc.p(0, 0), true, 0, false)

	slot0.main_container:getChildByName("notice_label"):setString(TI18N("点击任意处关闭"))
	slot0:updateAttrList()
end

function PokedexStarWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.ctrl:openStarUpWindow(false)
		end
	end)
end

function PokedexStarWindow.openRootWnd(slot0)
	slot0:handleEffect(true)
end

function PokedexStarWindow.onEnterAnim(slot0)
end

function PokedexStarWindow.updateAttrList(slot0)
	if not slot0.data then
		return
	end

	slot1 = slot0.data.old_star or 0
	slot2 = slot0.data.new_star or 0
	slot6 = Config.PartnerData.data_pokedex_attr[math.min(slot0.data.cur_lev, tableLen(Config.PartnerData.data_pokedex_attr))]
	slot7 = Config.PartnerData.data_pokedex_attr
	slot8 = 0

	if Config.PartnerData.data_pokedex_attr[math.max(0, slot0.data.old_lev)] then
		slot8 = slot4.star
	end

	slot0.old_star_label:setString(slot8)
	slot0.new_star_label:setString(slot6.star)

	if not slot4 and not slot6 then
		slot4 = {}
	end

	if not slot6 then
		return
	end

	slot9 = {}

	if slot4 then
		slot9 = slot4.attr or {}
	end

	slot10 = slot6.attr or {}
	slot11 = {
		TI18N("生命："),
		TI18N("攻击："),
		TI18N("防御：")
	}
	slot12 = {
		"hp_max",
		"atk",
		"def"
	}
	slot13 = {}

	if slot9 then
		for slot17, slot18 in pairs(slot9) do
			if slot18 and slot18[1] and slot18[2] then
				slot13[slot18[1]] = slot18[2]
			end
		end
	end

	slot14 = {}

	if slot10 then
		for slot18, slot19 in pairs(slot10) do
			if slot19 and slot19[1] and slot19[2] then
				slot14[slot19[1]] = slot19[2]
			end
		end
	end

	for slot18 = 1, 3 do
		if not slot0.attr_list[slot18] then
			slot0.attr_list[slot18] = {}

			createImage(slot0.main_container, PathTool.getResFrame("common", "common_90044"), 20, 230 - (slot18 - 1) * 50, cc.p(0, 0), true, 0, true):setContentSize(cc.size(675, 43))

			if slot18 ~= 1 then
				slot20:setOpacity(160)
			end

			slot21 = createRichLabel(22, cc.c4b(255, 238, 172, 255), cc.p(0, 0), cc.p(195, 290 - slot18 * 50), 0, 0, 400)

			slot0.main_container:addChild(slot21)

			slot22 = createRichLabel(22, cc.c4b(53, 255, 20, 255), cc.p(0, 0), cc.p(430, 290 - slot18 * 50), 0, 0, 400)

			slot0.main_container:addChild(slot22)

			slot0.attr_list[slot18].now_label = slot21
			slot0.attr_list[slot18].next_label = slot22
			slot0.attr_list[slot18].arrow = createImage(slot0.main_container, PathTool.getResFrame("common", "common_90017"), 330, 240 - (slot18 - 1) * 50, cc.p(0, 0), true, 0, false)
		end

		slot19 = slot11[slot18] or ""
		slot20 = 0

		if slot12[slot18] and slot13[slot21] then
			slot20 = slot13[slot21] or 0
		end

		slot0.attr_list[slot18].now_label:setString(slot19 .. slot20)

		slot23 = 0

		if slot12[slot18] and slot14[slot24] then
			slot23 = slot14[slot24] or 0
		end

		slot0.attr_list[slot18].next_label:setString(slot23)
		slot0.attr_list[slot18].next_label:setVisible(true)
		slot0.attr_list[slot18].arrow:setVisible(true)
	end
end

function PokedexStarWindow.handleEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.title_container) and slot0.play_effect == nil then
		slot0.play_effect = createEffectSpine(Config.EffectData.data_effect_info[103], cc.p(slot0.title_width * 0.5, slot0.title_height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_7)

		slot0.title_container:addChild(slot0.play_effect)
	end
end

function PokedexStarWindow.close_callback(slot0)
	slot0.ctrl:openStarUpWindow(false)
	slot0:handleEffect(false)
end
