slot1 = WorldmapController:getInstance():getModel()
WorldMapTipsWindow = WorldMapTipsWindow or BaseClass(BaseView)

function WorldMapTipsWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "worldmap/worldmap_tips_view"
	slot0.cache_list = {}
	slot0.open_type = WorldmapEvent.open_type.open_type_3
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("worldmap", "tips_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("worldmap", "worldmap"),
			type = ResourcesType.plist
		}
	}
end

function WorldMapTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.tips_img = slot0.container:getChildByName("tips_img")
	slot0.tips_lab_bg = slot0.container:getChildByName("tips_lab_bg")
	slot0.tips_lab = slot0.container:getChildByName("tips_lab")
	slot0.go_btn = slot0.container:getChildByName("go_btn")

	slot0.go_btn:getChildByName("label"):setString(TI18N("前 往"))
	UITool.SetTitleColor(slot0.go_btn:getChildByName("label"))

	slot0.scroll_view = slot0.container:getChildByName("scroll_view")

	slot0.scroll_view:setScrollBarEnabled(false)

	slot0.scroll_width = slot0.scroll_view:getContentSize().width
	slot0.scroll_height = slot0.scroll_view:getContentSize().height
	slot0.win_title = slot0.container:getChildByName("win_title")

	UITool.SetTitleColor(slot0.win_title)
end

function WorldMapTipsWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openWorldMapTipsWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.go_btn, function ()
		BattleDramaController:getInstance():openBattleDramaMapWindows(false)
		WorldmapController:getInstance():openWorldMapMainWindow(false)
		uv0:openWorldMapTipsWindow(false)
	end, false, 2)
end

function WorldMapTipsWindow.openRootWnd(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if not BattleDramaController:getInstance():getModel():getDramaData() or not slot3.mode then
		return
	end

	slot0.open_type = slot2

	if Config.DungeonData.data_drama_world_info[slot3.mode] and slot4[slot1] then
		slot5 = slot4[slot1]

		slot0.win_title:setString(slot5.name)

		slot0.max_height = 0

		slot0:setDataList(slot5.map_tips)

		if not slot0.item_load then
			slot0.item_load = loadSpriteTextureFromCDN(slot0.tips_img, PathTool.getTargetRes("worldmap/tips_img", slot5.tips_img, false, false), ResourcesType.single, slot0.item_load)
		end
	end

	slot0.tips_lab_bg:setVisible(false)
	slot0.go_btn:setVisible(false)
	slot0.tips_lab:setVisible(false)

	if slot0.open_type == WorldmapEvent.open_type.open_type_1 then
		slot0.go_btn:setVisible(true)
	elseif slot0.open_type == WorldmapEvent.open_type.open_type_2 then
		slot0.tips_lab_bg:setVisible(true)
		slot0.tips_lab:setVisible(true)
		slot0.tips_lab:setString(TI18N("已通关"))
		slot0.tips_lab:setTextColor(cc.c4b(40, 222, 40, 255))
	elseif slot0.open_type == WorldmapEvent.open_type.open_type_3 then
		slot0.tips_lab:setVisible(true)
		slot0.tips_lab:setString(TI18N("未到达"))
		slot0.tips_lab:setTextColor(cc.c4b(83, 83, 83, 255))
	end
end

function WorldMapTipsWindow.setDataList(slot0, slot1)
	slot0.render_list = {
		slot1
	}

	for slot6, slot7 in ipairs(slot0.render_list) do
		delayRun(slot0.container, slot6 / display.DEFAULT_FPS, function ()
			uv0:createList(uv1)
		end)
	end
end

function WorldMapTipsWindow.createList(slot0, slot1)
	slot2, slot3 = slot0:createTitleContent(slot1)

	slot0.scroll_view:addChild(slot2)
	table.insert(slot0.cache_list, slot2)

	slot0.max_height = slot0.max_height + slot3 + 30
	slot10 = slot0.scroll_width

	slot0.scroll_view:setInnerContainerSize(cc.size(slot10, math.max(slot0.max_height, slot0.scroll_height)))

	slot5 = 0

	for slot9, slot10 in ipairs(slot0.cache_list) do
		slot10:setPosition(8, slot4 - slot5)

		slot5 = slot5 + slot10:getContentSize().height + 30
	end
end

function WorldMapTipsWindow.createTitleContent(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = ccui.Widget:create()

	slot2:setAnchorPoint(cc.p(0, 1))
	slot2:setCascadeOpacityEnabled(true)

	slot3 = 0
	slot4 = createRichLabel(24, cc.c4b(71, 44, 30, 255), cc.p(0.5, 1), cc.p(273.5, 0), 15, nil, 547)

	slot4:setString(slot1)
	slot2:addChild(slot4)

	slot3 = slot4:getContentSize().height

	slot2:setContentSize(cc.size(slot0.scroll_width - 8, slot3))
	slot4:setPositionY(slot3 - 8)

	return slot2, slot3
end

function WorldMapTipsWindow.close_callback(slot0)
	GlobalEvent:getInstance():Fire(WorldmapEvent.World_Map_Unlock_item)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0.container:stopAllActions()
	uv0:openWorldMapTipsWindow(false)
end
