EncounterLibraryWindow = EncounterLibraryWindow or BaseClass(BaseView)
slot1 = EncounterController:getInstance():getModel()
slot2 = table.insert

function EncounterLibraryWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = true
	slot0.layout_name = "encounter/encounter_library_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("encounter", "encounter"),
			type = ResourcesType.plist
		}
	}
	slot0.cur_index = nil
end

function EncounterLibraryWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.main_view = slot0.main_panel:getChildByName("container")
	slot0.info_panel = slot0.main_view:getChildByName("info_panel")
	slot0.lib_container = slot0.info_panel:getChildByName("lib_container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.win_title = slot0.main_panel:getChildByName("win_title")
	slot0.Image_2 = slot0.main_panel:getChildByName("Image_2")

	slot0.win_title:setString(TI18N("物语图鉴"))

	slot0.tab_container = slot0.info_panel:getChildByName("tab_container")
	slot1 = {
		{
			title = TI18N("1-3星"),
			index = EncounterConst.Star_Type.ThreeStar
		},
		{
			title = TI18N("4星"),
			index = EncounterConst.Star_Type.FourStar
		},
		{
			title = TI18N("5星"),
			index = EncounterConst.Star_Type.FiveStar
		},
		{
			title = TI18N("6星"),
			index = EncounterConst.Star_Type.sixStar
		}
	}
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.lib_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lib_container:getContentSize(), {
		start_y = 5,
		item_height = 334,
		start_x = 24,
		space_y = 2,
		col = 3,
		space_x = 20,
		item_width = 175
	}, cc.p(0, 0))

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	if not slot0.sub_tab_list then
		slot4 = slot0.tab_container:getContentSize()
		slot0.sub_tab_list = CommonSubBtnList.new(slot0.tab_container, cc.p(0.5, 0.5), cc.p(slot4.width * 0.5, slot4.height * 0.5), cc.size(145, 50), handler(slot0, slot0._onClickSubTabBtn))
	end

	slot0.sub_tab_list:setData(slot1, EncounterConst.Star_Type.ThreeStar)
end

function EncounterLibraryWindow._onClickSubTabBtn(slot0, slot1)
	if slot1 == slot0.cur_index then
		return
	end

	slot0.cur_index = slot1

	slot0:updateListInfo()
end

function EncounterLibraryWindow.createNewCell(slot0)
	return EncounterLibraryMainItem.new()
end

function EncounterLibraryWindow.numberOfCells(slot0)
	if not slot0.encounterDataArr then
		return 0
	end

	return #slot0.encounterDataArr
end

function EncounterLibraryWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.encounterDataArr then
		return
	end

	slot1.index = slot2

	slot1:setData(slot0.encounterDataArr[slot2])
end

function EncounterLibraryWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openEncounterLibraryWindow(false)
	end, nil, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openEncounterLibraryWindow(false)
	end, true, 2)
	slot0:addGlobalEvent(EncounterEvent.CHECK_SHOW_LIBRARY_ENCOUNTER, function (slot0)
		if #slot0 > 0 then
			uv0:updateListInfo()
		end
	end)
end

function EncounterLibraryWindow.updateListInfo(slot0)
	if slot0.cur_index == nil or slot0.root_wnd == nil then
		return
	end

	if EncounterConst.Star_Type_Num[slot0.cur_index] == nil then
		return
	end

	slot2 = slot0:getEncounterInfoList(slot1)

	table.sort(slot2, SortTools.tableLowerSorter({
		"camp",
		"partner_bid",
		"star",
		"isFinish"
	}))

	slot0.encounterDataArr = slot2

	slot0.item_scrollview:reloadData()
end

function EncounterLibraryWindow.getEncounterInfoList(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(Config.EncounterData.data_encounter_info) do
		if slot7.camp == nil and Config.PartnerData.data_partner_base[slot7.partner_bid] then
			slot7.camp = slot8.camp_type
		end

		if slot7.isFinish == nil then
			if uv0:isFinishByid(slot7.id) == true then
				slot7.isFinish = 1
			else
				slot7.isFinish = 2
			end
		end

		if slot1 == 3 then
			if slot7.star <= slot1 then
				uv1(slot2, slot7)
			end
		elseif slot7.star == slot1 then
			uv1(slot2, slot7)
		end
	end

	return slot2
end

function EncounterLibraryWindow.openRootWnd(slot0)
end

function EncounterLibraryWindow.close_callback(slot0)
	uv0:openEncounterLibraryWindow(false)

	if slot0.sub_tab_list then
		slot0.sub_tab_list:DeleteMe()

		slot0.sub_tab_list = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end

EncounterLibraryMainItem = class("EncounterLibraryMainItem", function ()
	return ccui.Layout:create()
end)

function EncounterLibraryMainItem.ctor(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("encounter/encounter_library_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setPosition(0, 0)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.icon_panel = slot0.main_panel:getChildByName("icon_panel")
	slot0.name = slot0.main_panel:getChildByName("name")
	slot0.tips_lab = slot0.main_panel:getChildByName("tips_lab")
	slot0.black_bg = slot0.main_panel:getChildByName("black_bg")

	slot0.black_bg:setVisible(false)

	slot0.hero_name_bg = slot0.main_panel:getChildByName("hero_name_bg")
	slot0.hero_name = slot0.main_panel:getChildByName("hero_name")
	slot1 = slot0.icon_panel:getContentSize()
	slot0.map_cli_node = cc.ClippingNode:create(createSprite(PathTool.getResFrame("encounter", "encounter_1011"), slot1.width / 2, slot1.height / 2, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.map_cli_node:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.map_cli_node:setContentSize(slot1)
	slot0.map_cli_node:setCascadeOpacityEnabled(true)
	slot0.map_cli_node:setPosition(slot1.width / 2, slot1.height / 2)
	slot0.map_cli_node:setAlphaThreshold(0)
	slot0.icon_panel:addChild(slot0.map_cli_node)
	slot0:registerEvent()
end

function EncounterLibraryMainItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0:isFinishByid(uv1.config.id) == false then
				message(TI18N("暂未获得该物语"))

				return
			end

			EncounterController:getInstance():openEncounterWindow(true, uv1.config.id)
		end
	end)
end

function EncounterLibraryMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.config = slot1

	if not slot0.hero_icon then
		slot0.hero_icon = createSprite(nil, 0, 0, slot0.map_cli_node, cc.p(0, 0), LOADTEXT_TYPE)

		slot0.hero_icon:setScale(0.5)
	end

	slot2 = PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot0.config.partner_bid)

	if slot0.record_res_id == nil or slot0.record_res_id ~= slot2 then
		if slot0.item_load then
			slot0.item_load:DeleteMe()

			slot0.item_load = nil
		end

		slot0.record_res_id = slot2
		slot0.item_load = loadSpriteTextureFromCDN(slot0.hero_icon, slot2, ResourcesType.single, slot0.item_load, 60)
	end

	slot0.name:setString(slot0.config.name)

	slot4 = ""

	if Config.PartnerData.data_partner_base[slot0.config.partner_bid] then
		if uv0:isFinishByid(slot0.config.id) == false then
			slot4 = string.format(TI18N("获得%d星%s有几率解锁"), slot0.config.star, slot5.name)
		else
			slot0.hero_name:setString(slot5.name)
		end
	end

	slot0.black_bg:setVisible(slot3 == false)
	slot0.hero_name_bg:setVisible(slot3)
	slot0.hero_name:setVisible(slot3)
	slot0.tips_lab:setString(slot4)
end

function EncounterLibraryMainItem.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
