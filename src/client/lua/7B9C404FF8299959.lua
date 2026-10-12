HeroLibraryMainWindow = HeroLibraryMainWindow or BaseClass(BaseView)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function HeroLibraryMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "hero/hero_library_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("herolibrary", "herolibrary"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.hero_library_list = {}
	slot0.select_camp = 0
	slot0.col = 3
	slot0.item_width = 220
	slot0.item_height = 335
	slot0.cacheList = {}
	slot0.cacheMaxSize = 0
	slot0.time_show_index = 0
	slot0.first_title_height = 50
	slot0.title_height = 80
	slot0.career_info_list = {}
end

function HeroLibraryMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/hero", "hero_bag_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.lay_scrollview = slot0.main_container:getChildByName("lay_scrollview")
	slot0.centre_box_1 = slot0.main_container:getChildByName("centre_box_1")
	slot0.border_left_box_2 = slot0.main_container:getChildByName("border_left_box_2")
	slot0.border_right_box_2 = slot0.main_container:getChildByName("border_right_box_2")
	slot0.top_box_4 = slot0.main_container:getChildByName("top_box_4")
	slot0.bottom_box_5 = slot0.main_container:getChildByName("bottom_box_5")
	slot1 = slot0.bottom_box_5:getChildByName("camp_node")
	slot0.camp_btn_list = {
		[0] = slot1:getChildByName("camp_btn0"),
		slot1:getChildByName("camp_btn1"),
		slot1:getChildByName("camp_btn2"),
		slot1:getChildByName("camp_btn3"),
		slot1:getChildByName("camp_btn4"),
		slot1:getChildByName("camp_btn5")
	}
	slot0.img_select = slot1:getChildByName("img_select")
	slot2, slot3 = slot0.camp_btn_list[0]:getPosition()

	slot0.img_select:setPosition(slot2 - 0.5, slot3 + 1)

	slot0.close_btn = slot0.bottom_box_5:getChildByName("close_btn")

	slot0:adaptationScreen()
end

function HeroLibraryMainWindow.adaptationScreen(slot0)
	slot5 = slot0.main_container:getContentSize()
	slot6, slot7 = slot0.bottom_box_5:getPosition()
	slot8 = slot7 + display.getBottom(slot0.main_container)
	slot9, slot10 = slot0.top_box_4:getPosition()
	slot11 = display.getTop(slot0.main_container) - (slot5.height - slot10)
	slot13 = slot0.border_left_box_2:getPositionX() + display.getLeft(slot0.main_container)
	slot15 = display.getRight(slot0.main_container) - (slot5.width - slot0.border_right_box_2:getPositionX())
	slot16 = slot15 - slot13
	slot17 = slot11 - slot8

	slot0.top_box_4:setPositionY(slot11)
	slot0.bottom_box_5:setPositionY(slot8)
	slot0.border_left_box_2:setPosition(slot13, slot8 + slot17 * 0.5)
	slot0.border_right_box_2:setPosition(slot15, slot8 + slot17 * 0.5)
	slot0.top_box_4:setContentSize(cc.size(slot16, 94))
	slot0.bottom_box_5:setContentSize(cc.size(slot16, 101))
	slot0.border_left_box_2:setContentSize(cc.size(35, slot17))
	slot0.border_right_box_2:setContentSize(cc.size(35, slot17))
	slot0.centre_box_1:setPosition(slot13, slot8)
	slot0.centre_box_1:setContentSize(slot16, slot17)

	slot18 = 30

	slot0.lay_scrollview:setPosition(slot13, slot8 + slot18)
	slot0.lay_scrollview:setContentSize(slot16, slot17 - slot18 * 2)
end

function HeroLibraryMainWindow.register_event(slot0)
	function slot4()
		uv0:onClickBtnClose(false)
	end

	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:onClickBtnShowByIndex(uv1)
		end, true, 2)
	end
end

function HeroLibraryMainWindow.onClickBtnClose(slot0)
	uv0:openHeroLibraryMainWindow(false)
end

function HeroLibraryMainWindow.onClickBtnShowByIndex(slot0, slot1, slot2)
	if slot0.img_select and slot0.camp_btn_list[slot1] then
		slot3, slot4 = slot0.camp_btn_list[slot1]:getPosition()

		slot0.img_select:setPosition(slot3 - 0.5, slot4 + 1)
	end

	slot0:updateHeroList(slot1, slot2)
end

function HeroLibraryMainWindow.openRootWnd(slot0, slot1)
	slot0:onClickBtnShowByIndex(0, true)
end

function HeroLibraryMainWindow.updateCareerUI(slot0, slot1, slot2, slot3)
	for slot7, slot8 in ipairs(slot0.career_info_list) do
		if slot8.desk then
			slot8.desk:setVisible(false)
		end

		slot8.bg:setVisible(false)
	end

	slot4 = slot3 or 0

	for slot8, slot9 in ipairs(slot1) do
		slot11 = slot9.pos_y or 0
		slot12 = HeroConst.CareerName[slot9.career_type or HeroConst.CareerName.eMagician]
		slot14 = nil
		slot14 = slot8 == 1 and slot2 - slot11 or slot2 - (slot11 + 25)

		if slot0.career_info_list[slot8] == nil then
			slot15 = {
				desk = createImage(slot0.list_view, PathTool.getResFrame("herolibrary", "hero_library_box_5"), slot0.scrollview_size.width / 2, slot2 - slot11, cc.p(0.5, 0.5), true, 0, true)
			}

			if slot8 ~= 1 then
				slot15.desk:setContentSize(cc.size(slot0.scrollview_size.width, 103))
				slot15.desk:setCapInsets(cc.rect(41, 0, 40, 0))
			end

			slot17 = 48
			slot15.bg = createImage(slot0.list_view, PathTool.getResFrame("herolibrary", "hero_library_18"), slot4, slot14, cc.p(0, 1), true, 0, true)

			slot15.bg:setContentSize(cc.size(232, slot17))
			slot15.bg:setCapInsets(cc.rect(42, 0, 2, 48))

			slot15.career_icon = createSprite(PathTool.getPartnerTypeIcon(slot10), 50, slot17 * 0.5 - 3, slot15.bg, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST)
			slot15.label = createLabel(24, cc.c4b(12, 77, 175, 255), nil, 88, slot17 * 0.5 - 3, slot12, slot15.bg, nil, cc.p(0, 0.5))
			slot0.career_info_list[slot8] = slot15
		else
			if slot0.career_info_list[slot8].desk then
				slot15.desk:setVisible(true)
				slot15.desk:setPositionY(slot13)
			end

			slot15.bg:setVisible(true)
			slot15.bg:setPositionY(slot14)
			loadSpriteTexture(slot15.career_icon, PathTool.getPartnerTypeIcon(slot10), LOADTEXT_TYPE_PLIST)
			slot15.label:setString(slot12)
		end
	end
end

function HeroLibraryMainWindow.updateHeroList(slot0, slot1, slot2)
	if not slot2 and (slot1 or 1) == slot0.select_camp then
		return
	end

	if not slot0.list_view then
		slot4 = slot0.lay_scrollview:getContentSize()

		slot0:createLibraryScrollView(slot4, slot4.width * 0.5, slot4.height * 0.5)
	end

	slot0.select_camp = slot3
	slot5 = {}

	for slot9, slot10 in pairs(Config.PartnerData.data_partner_base or {}) do
		if slot3 == 0 or slot3 == slot10.camp_type then
			uv0(slot5, slot10)
		end
	end

	uv1(slot5, SortTools.tableCommonSorter({
		{
			"type",
			false
		},
		{
			"init_star",
			true
		},
		{
			"camp_type",
			false
		},
		{
			"sort_order",
			false
		}
	}))

	slot7 = 0
	slot8 = (slot0.scrollview_size.width - slot0.item_width * slot0.col) * 0.5

	function slot9(slot0)
		if slot0 % uv0.col == 0 then
			uv1 = uv1 + uv0.item_height
		end

		return uv2 + uv0.item_width * slot1 + uv0.item_width * 0.5, uv1 + uv0.item_height * 0.5
	end

	slot10 = {}
	slot11 = nil
	slot0.hero_library_list = {}

	for slot15, slot16 in ipairs(slot5) do
		if slot11 == nil then
			slot7 = slot0.first_title_height - slot0.item_height

			uv0(slot10, {
				pos_y = 0,
				career_type = slot16.type
			})
		end

		if slot11 ~= slot16.type then
			if slot0.col - #slot0.hero_library_list % slot0.col < slot0.col and slot17 ~= 0 then
				for slot21 = 1, slot17 do
					slot22, slot23 = slot9(#slot0.hero_library_list)

					uv0(slot0.hero_library_list, {
						x = slot22,
						y = slot23
					})
				end
			end

			uv0(slot10, {
				career_type = slot16.type,
				pos_y = slot7 + slot0.item_height
			})

			slot7 = slot7 + slot0.title_height
		end

		slot17, slot18 = slot9(#slot0.hero_library_list)

		uv0(slot0.hero_library_list, {
			config = slot16,
			x = slot17,
			y = slot18
		})
	end

	slot12 = nil
	slot12 = #slot0.hero_library_list > 0 and slot7 + slot0.item_height or 0

	slot0:updateCareerUI(slot10, slot12, slot8)
	slot0:reloadData(slot12)
end

function HeroLibraryMainWindow.numberOfCells(slot0)
	return #slot0.hero_library_list
end

function HeroLibraryMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.hero_library_list[slot2].config then
		slot1:setVisible(true)
		slot1:setData(slot3.config)
	else
		slot1:setVisible(false)
	end
end

function HeroLibraryMainWindow.onCellTouched(slot0, slot1)
	if slot0.hero_library_list[slot1.index] and slot3.config then
		if slot3.config.draw_res and Config.PartnerData.data_partner_library(slot3.config.bid) and slot4 ~= "" then
			uv0:openHeroLibraryInfoWindow(true, slot3.config.bid)
		else
			message(TI18N("画师正快马加鞭地制作该立绘中哟~"))

			if Config.PartnerData.data_partner_pokedex[slot3.config.bid] and slot6[1] then
				uv0:openHeroInfoWindowByBidStar(slot3.config.bid, slot6[1].star or 1)
			end
		end
	end
end

function HeroLibraryMainWindow.createLibraryScrollView(slot0, slot1, slot2, slot3)
	slot0.scrollview_size = slot1
	slot0.list_view = createScrollView(slot1.width, slot1.height, slot2, slot3, slot0.lay_scrollview, ScrollViewDir.vertical)

	slot0.list_view:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.scrollview_container = slot0.list_view:getInnerContainer()
	slot0.cacheMaxSize = (math.ceil(slot1.height / slot0.item_height) + 1) * slot0.col

	slot0.list_view:addEventListener(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.containerMoved then
			uv0:checkOverShowByVertical()
		end
	end)
end

function HeroLibraryMainWindow.checkOverShowByVertical(slot0)
	if not slot0.cellList then
		return
	end

	slot5 = 1

	for slot9 = 1, math.ceil(#slot0.cellList / slot0.col) do
		slot5 = slot9

		if slot0.cellList[1 + (slot9 - 1) * slot0.col] and slot0.scrollview_size.height + -slot0.scrollview_container:getPositionY() >= slot11.y - slot0.item_height * 0.5 then
			break
		end
	end

	slot6 = slot4

	if slot2 > 0 then
		for slot10 = slot5, slot4 do
			if slot0.cellList[1 + (slot10 - 1) * slot0.col] and slot2 > slot12.y + slot0.item_height * 0.5 then
				slot6 = slot10 - 1

				break
			end
		end
	end

	slot7 = slot0:numberOfCells()

	for slot11 = 1, slot4 do
		if slot5 <= slot11 and slot11 <= slot6 then
			for slot15 = 1, slot0.col do
				if not slot0.activeCellIdx[(slot11 - 1) * slot0.col + slot15] and slot16 <= slot7 then
					slot0:updateCellAtIndex(slot16)

					slot0.activeCellIdx[slot16] = true
				end
			end
		else
			for slot15 = 1, slot0.col do
				if slot7 >= (slot11 - 1) * slot0.col + slot15 then
					slot0.activeCellIdx[slot16] = false
				end
			end
		end
	end
end

function HeroLibraryMainWindow.reloadData(slot0, slot1)
	slot0.cellList = {}
	slot0.activeCellIdx = {}

	for slot5, slot6 in ipairs(slot0.cacheList) do
		slot6:setPositionX(-10000)
	end

	slot0.container_size = cc.size(slot0.scrollview_size.width, math.max(slot1, slot0.scrollview_size.height))

	slot0.list_view:setInnerContainerSize(slot0.container_size)
	slot0.list_view:jumpToTop()

	if slot0:numberOfCells() == 0 then
		return
	end

	for slot7 = 1, slot3 do
		if slot0.hero_library_list[slot7] ~= nil then
			slot9 = nil

			if slot7 <= slot0.time_show_index then
				slot9 = slot0:getCacheCellByIndex(slot7)
			end

			slot10 = #slot0.cellList

			uv0(slot0.cellList, {
				cell = slot9,
				x = slot8.x,
				y = slot2 - slot8.y
			})
		end
	end

	for slot9 = 1, slot3 < slot0.cacheMaxSize - slot0.col and slot3 or slot4 do
		delayRun(slot0.list_view, slot9 / display.DEFAULT_FPS, function ()
			if uv0.time_show_index < uv1 then
				uv0.time_show_index = uv1
			end

			uv0:updateCellAtIndex(uv1)

			if uv0.time_show_index == uv2 then
				uv0.time_show_index = 9999
			end
		end)

		slot0.activeCellIdx[slot9] = true
	end
end

function HeroLibraryMainWindow.getCacheCellByIndex(slot0, slot1)
	if not slot0.cacheList[(slot1 - 1) % slot0.cacheMaxSize + 1] then
		slot3 = HeroLibraryMainItem.new()

		slot3:addCallBack(function ()
			uv0:onCellTouched(uv1)
		end)
		slot3:setAnchorPoint(cc.p(0.5, 0.5))
		slot3:setPositionX(-10000)

		slot0.cacheList[slot2] = slot3

		slot0.list_view:addChild(slot3, 2)

		return slot3
	else
		return slot0.cacheList[slot2]
	end
end

function HeroLibraryMainWindow.updateCellAtIndex(slot0, slot1)
	if slot0.time_show_index < slot1 then
		return
	end

	if not slot0.cellList[slot1] then
		return
	end

	if slot0.cellList[slot1].cell == nil then
		slot2.cell = slot0:getCacheCellByIndex(slot1)
	end

	slot2.cell:setPosition(slot2.x, slot2.y)
	slot0:updateCellByIndex(slot2.cell, slot1)
end

function HeroLibraryMainWindow.close_callback(slot0)
	doStopAllActions(slot0.list_view)

	for slot4, slot5 in ipairs(slot0.cacheList) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	uv0:openHeroLibraryMainWindow(false)
end

HeroLibraryMainItem = class("HeroLibraryMainItem", function ()
	return ccui.Layout:create()
end)

function HeroLibraryMainItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_library_main_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setPosition(0, 0)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.hero_icon = slot0.main_panel:getChildByName("hero_icon")
	slot0.camp_icon = slot0.main_panel:getChildByName("camp_icon")
	slot0.profession_icon = slot0.main_panel:getChildByName("profession_icon")
	slot0.name = slot0.main_panel:getChildByName("name")

	slot0:registerEvent()
end

function HeroLibraryMainItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:clickFun()
		end
	end)
end

function HeroLibraryMainItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function HeroLibraryMainItem.clickFun(slot0)
	if slot0.callback then
		slot0:callback()
	end
end

function HeroLibraryMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.config = slot1
	slot2 = PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot0.config.bid)

	if slot0.record_res_id == nil or slot0.record_res_id ~= slot2 then
		slot0.record_res_id = slot2
		slot0.item_load = loadSpriteTextureFromCDN(slot0.hero_icon, slot2, ResourcesType.single, slot0.item_load, 60)
	end

	slot3 = PathTool.getHeroCampTypeIcon(slot0.config.camp_type)

	if slot0.record_camp_res == nil or slot0.record_camp_res ~= slot3 then
		slot0.record_camp_res = slot3

		loadSpriteTexture(slot0.camp_icon, slot3, LOADTEXT_TYPE_PLIST)
	end

	slot5 = PathTool.getPartnerTypeIcon(slot0.config.type or 4)

	if slot0.record_type_res == nil or slot0.record_type_res ~= slot5 then
		slot0.record_type_res = slot5

		loadSpriteTexture(slot0.profession_icon, slot5, LOADTEXT_TYPE_PLIST)
	end

	slot0.name:setString(slot0.config.name)

	slot6 = slot0.profession_icon:getContentSize()
	slot7 = slot0.name:getContentSize()
	slot8 = 5
	total_width = slot6.width + slot8 + slot7.width
	slot9 = (slot0.size.width - total_width) * 0.5

	slot0.profession_icon:setPositionX(slot9 + slot6.width * 0.5)
	slot0.name:setPositionX(slot9 + slot6.width + slot8 + slot7.width * 0.5)
end

function HeroLibraryMainItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
