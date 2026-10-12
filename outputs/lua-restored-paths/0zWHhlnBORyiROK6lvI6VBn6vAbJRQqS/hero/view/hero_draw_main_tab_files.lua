HeroDrawMainTabFiles = class("HeroDrawMainTabFiles", function ()
	return ccui.Widget:create()
end)
slot0 = string.format
slot2 = HeroController:getInstance():getModel()
slot3 = table.insert

function HeroDrawMainTabFiles.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroDrawMainTabFiles.config(slot0)
end

function HeroDrawMainTabFiles.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_draw_main_tab_files"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.hero_draw_icon = slot0.top_panel:getChildByName("hero_draw_icon")
	slot0.move_bg = slot0.top_panel:getChildByName("move_bg")
	slot0.hero_name = slot0.top_panel:getChildByName("hero_name")
	slot0.hero_dec = slot0.top_panel:getChildByName("hero_dec")
	slot0.hero_zhuanji = slot0.top_panel:getChildByName("hero_zhuanji")

	slot0.hero_zhuanji:setString(TI18N("英雄传记"))

	slot0.common_1001 = slot0.top_panel:getChildByName("common_1001")
	slot0.content_scrollview = slot0.top_panel:getChildByName("content_scrollview")

	slot0.content_scrollview:setScrollBarEnabled(false)
	slot0:adaptationScreen()
end

function HeroDrawMainTabFiles.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)

	slot0.top_panel:setPositionY(slot1 - (slot0.main_container_size.height - slot0.top_panel:getPositionY()))

	slot4 = slot1 - slot0.main_container_size.height - display.getBottom(slot0.main_container)
	slot5 = slot0.move_bg:getContentSize()

	slot0.move_bg:setContentSize(cc.size(slot5.width, slot5.height + slot4))
	slot0.common_1001:setPositionY(slot0.common_1001:getPositionY() - slot4)

	slot7 = slot0.content_scrollview:getContentSize()

	slot0.content_scrollview:setContentSize(cc.size(slot7.width, slot7.height + slot4))

	slot0.content_scrollview_size = slot0.content_scrollview:getContentSize()
end

function HeroDrawMainTabFiles.registerEvents(slot0)
	registerButtonEventListener(slot0.look_btn, function ()
		uv0:onClickLookBtn()
	end, true, 2, nil, 0.8)

	if slot0.check_show_library_encounter == nil then
		slot0.check_show_library_encounter = GlobalEvent:getInstance():Bind(EncounterEvent.CHECK_SHOW_LIBRARY_ENCOUNTER, function (slot0)
			if uv0.scroll_view then
				uv0.scroll_view:resetCurrentItems()
			end
		end)
	end
end

function HeroDrawMainTabFiles.initData(slot0)
	if not slot0.parent then
		return
	end

	if not slot0.parent.hero_vo then
		return
	end

	slot0.hero_vo = slot0.parent.hero_vo
	slot1, slot2 = nil

	if slot0.hero_vo.is_pokedex then
		if Config.PartnerData.data_partner_base[slot0.hero_vo.bid] then
			slot1 = slot3.bustid
			slot2 = slot3.hero_pos
		end
	else
		slot1 = slot0.hero_vo.bustid
		slot2 = slot0.hero_vo.hero_pos
	end

	slot0.item_load = loadSpriteTextureFromCDN(slot0.hero_draw_icon, PathTool.getPartnerBustRes(slot1), ResourcesType.single, slot0.item_load)
	slot0.library_config = Config.PartnerData.data_partner_library(slot0.hero_vo.bid)

	if not slot0.library_config then
		return
	end

	slot0.hero_name:setString(slot0.hero_vo.name)
	slot0.hero_dec:setString(uv0("%s%s\n%s", tostring(HeroConst.CampAttrName[slot0.hero_vo.camp_type]), tostring(HeroConst.CareerName[slot0.hero_vo.type]), slot2))

	if slot0.library_config.story == nil or slot0.library_config.story == "" then
		commonShowEmptyIcon(slot0.content_scrollview, true, {
			text = TI18N("暂无英雄传记数据")
		})
		slot0.content_scrollview:setTouchEnabled(false)
	else
		if slot0.conten_label == nil then
			slot0.conten_label = createRichLabel(22, cc.c4b(85, 85, 85, 255), cc.p(0, 1), cc.p(0, 0), 12, nil, slot0.content_scrollview_size.width)

			slot0.content_scrollview:addChild(slot0.conten_label)
		end

		slot0.conten_label:setString(slot0.library_config.story)

		if slot0.conten_label:getContentSize().height < slot0.content_scrollview_size.height then
			slot0.content_scrollview:setTouchEnabled(false)
		end

		slot6 = math.max(slot0.content_scrollview_size.height, slot5.height)

		slot0.content_scrollview:setInnerContainerSize(cc.size(slot0.content_scrollview_size.width, slot6))
		slot0.conten_label:setPositionY(slot6)
	end
end

function HeroDrawMainTabFiles.updateList(slot0)
	if slot0.scroll_view == nil then
		slot1 = slot0.lay_scrollview_1:getContentSize()
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview_1, cc.p(slot1.width * 0.5, slot1.height * 0.5), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1, {
			start_y = 0,
			row = 1,
			start_x = 0,
			space_x = 0,
			item_width = 303,
			item_height = 62,
			space_y = 0,
			col = 2,
			need_dynamic = true
		}, cc.p(0.5, 0.5))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_scrollview_1, true, {
			text = TI18N("暂无英雄物语数据")
		})
	else
		commonShowEmptyIcon(slot0.lay_scrollview_1, false)
	end

	slot0.scroll_view:reloadData()
end

function HeroDrawMainTabFiles.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0.5, 0.5)
	slot3:setTouchEnabled(true)
	slot3:setPosition(slot1 * 0.5, slot2 * 0.5)

	slot1 = 290
	slot2 = 53
	slot4 = cc.size(slot1, slot2)

	slot3:setContentSize(slot4)

	slot3.bg = createImage(slot3, PathTool.getResFrame("herodraw", "hero_draw_22"), slot1 * 0.5, slot2 * 0.5, cc.p(0.5, 0.5), true, nil, true)

	slot3.bg:setContentSize(slot4)

	slot3.name = createLabel(22, cc.c4b(100, 50, 35, 255), nil, slot1 * 0.5, slot2 * 0.5, TI18N("名字"), slot3, nil, cc.p(0.5, 0.5))

	registerButtonEventListener(slot3, function ()
		uv0:onCellTouched(uv1)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	function slot3.DeleteMe()
	end

	return slot3
end

function HeroDrawMainTabFiles.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function HeroDrawMainTabFiles.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1.name:setString(slot3.name)

	if EncounterController:getInstance():getModel():isFinishByid(slot3.id) then
		setChildUnEnabled(false, slot1.bg)
	else
		setChildUnEnabled(true, slot1.bg)
	end
end

function HeroDrawMainTabFiles.onCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.show_list[slot1.index] then
		return
	end

	if not EncounterController:getInstance():getModel():isFinishByid(slot3.id) then
		message(TI18N("暂未获得该物语"))

		return
	end

	EncounterController:getInstance():openEncounterWindow(true, slot3.id)
end

function HeroDrawMainTabFiles.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 and not slot0.is_init then
		slot0.is_init = true

		slot0:initData()
	end
end

function HeroDrawMainTabFiles.DeleteMe(slot0)
	if slot0.check_show_library_encounter then
		GlobalEvent:getInstance():UnBind(slot0.check_show_library_encounter)

		slot0.check_show_library_encounter = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end
