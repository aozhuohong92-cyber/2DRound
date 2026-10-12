WorldMapMainWindow = WorldMapMainWindow or BaseClass(BaseView)

function WorldMapMainWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Full
	slot0.is_use_csb = false
	slot0.config = slot1
	slot0.size = cc.size(slot0.config.width, slot0.config.height)
	slot0.land_list = {}
	slot0.map_res = PathTool.getPlistImgForDownLoad("worldmap", "blayer", true)
	slot0.res_list = {
		{
			path = slot0.map_res,
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("worldmap", "worldmap"),
			type = ResourcesType.plist
		}
	}
end

function WorldMapMainWindow.createRootWnd(slot0)
	slot1 = display.getMaxScale()
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

	slot0.difference_width = (SCREEN_WIDTH * slot1 - (display.getRight(slot0.root) - display.getLeft(slot0.root))) * 0.5 / slot1
	slot0.map_wnd = ccui.Layout:create()

	slot0.map_wnd:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.map_wnd:setScale(slot1)
	slot0.map_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.map_wnd:setPosition(SCREEN_WIDTH * 0.5, display.height * 0.5)
	slot0.root_wnd:addChild(slot0.map_wnd)

	slot0.map_layer = createSprite(slot0.map_res, 0, 0, slot0.map_wnd, cc.p(0, 0), LOADTEXT_TYPE)
	slot0.top_info_container = ccui.Layout:create()

	slot0.top_info_container:setContentSize(SCREEN_WIDTH, 255)
	slot0.top_info_container:setAnchorPoint(cc.p(0, 1))
	slot0.top_info_container:setScale(display.getScale())
	slot0.top_info_container:setPosition(display.getLeft(slot0.root_wnd), display.getTop(slot0.root_wnd))

	if not tolua.isnull(slot0.top_info_container) then
		slot0.root_wnd:addChild(slot0.top_info_container)
	end

	slot0.return_btn = createImage(slot0.top_info_container, PathTool.getResFrame("worldmap", "txt_cn_worldmap_1009"), 1110, 155, cc.p(0.5, 0.5), true, 10)

	slot0.return_btn:setPosition(display.getRight(slot0.top_info_container) - slot0.return_btn:getContentSize().width / 2, slot0.return_btn:getContentSize().height / 2)
	slot0.return_btn:setTouchEnabled(true)
end

function WorldMapMainWindow.open_callback(slot0)
end

function WorldMapMainWindow.register_event(slot0)
	slot0.return_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			WorldmapController:getInstance():openWorldMapMainWindow(false, uv0.data)
		end
	end)

	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:setSwallowTouches(true)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.last_point = nil

		doStopAllActions(uv0.map_layer)

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot4:registerScriptHandler(function (slot0, slot1)
		uv0.last_point = slot0:getDelta()

		uv0:moveMainScene(uv0.last_point.x)
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot4:registerScriptHandler(function (slot0, slot1)
		if uv0.last_point == nil then
			return
		end

		uv0.map_layer:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(1, cc.p(uv0:scaleCheckPoint(uv0.map_layer:getPositionX() + uv0.last_point.x * 3), 0))), cc.CallFunc:create(function ()
		end)))
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.map_wnd:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.map_wnd)
end

function WorldMapMainWindow.moveMainScene(slot0, slot1)
	slot0:updateMainScene(slot0:scaleCheckPoint(slot0.map_layer:getPositionX() + slot1))
end

function WorldMapMainWindow.scaleCheckPoint(slot0, slot1)
	if slot0.difference_width < slot1 then
		slot1 = slot0.difference_width
	elseif slot1 < SCREEN_WIDTH - slot0.size.width - slot0.difference_width then
		slot1 = SCREEN_WIDTH - slot0.size.width - slot0.difference_width
	end

	return slot1
end

function WorldMapMainWindow.updateMainScene(slot0, slot1, slot2)
	slot0.map_layer:setPosition(slot1, slot2 or 0)
end

function WorldMapMainWindow.openRootWnd(slot0, slot1)
	slot0.data = slot1

	if slot0.data then
		WorldmapController:getInstance():addLockContainer(true)
		BattleController:getInstance():setUnlockChapterStatus(true)
	end

	if BattleDramaController:getInstance():getModel():getDramaData() ~= nil then
		slot3 = slot2.dun_id

		if slot0.data then
			slot3 = slot0.data.dun_id
		end

		if Config.DungeonData.data_drama_dungeon_info(slot3) ~= nil then
			slot0.dungeon_config = slot4

			slot0:createWorldLand()
			slot0:updateScenePos()
		end
	end

	delayRun(slot0.map_wnd, 0.2, function ()
		uv0.spine = createEffectSpine(PathTool.getEffectRes(199), cc.p(0, 0), cc.p(0, 0), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)

		uv0.map_layer:addChild(uv0.spine, 10)
	end)
end

function WorldMapMainWindow.createWorldLand(slot0)
	if slot0.config ~= nil and slot0.config.building_list ~= nil then
		function slot1(slot0)
			uv0:selectedMainLandItem(slot0)
		end

		slot5 = BattleDramaController:getInstance():getModel()
		slot7 = slot5
		slot2 = BattleDramaController:getInstance():getModel():getCurMaxChapterId(slot5.getDramaData(slot7).mode)
		slot3 = 0

		for slot7, slot8 in ipairs(slot0.config.building_list) do
			delayRun(slot0.root_wnd, 1 * slot7 / display.DEFAULT_FPS, function ()
				if uv0.land_list[uv1.bid] == nil then
					uv2 = uv2 + 1
					uv0.land_list[uv1.bid] = WorldMapLand.new(uv1, uv3, uv4, uv0.data)

					uv0.land_list[uv1.bid]:addToParent(uv0.map_layer)

					uv0.land_list[uv1.bid].info_data = uv1

					if uv1.bid == uv0.dungeon_config.land_id then
						uv0:selectedMainLandItem(uv0.land_list[uv1.bid])
					end
				end
			end)
		end
	end
end

function WorldMapMainWindow.updateScenePos(slot0)
	slot1 = nil

	if BattleDramaController:getInstance():getModel():getDramaData() then
		slot1 = BattleDramaController:getInstance():getModel():getDramaData().max_dun_id
	end

	if slot0.data then
		slot1 = slot0.data.dun_id
	end

	if slot1 and Config.DungeonData.data_drama_dungeon_info(slot1) then
		if Config.DungeonData.data_drama_dungeon_info(slot1).next_id == 0 then
			slot2 = slot1
		end

		if Config.DungeonData.data_drama_dungeon_info(slot2) then
			slot0.target_config = Config.DungeonData.data_drama_dungeon_info(slot2)
		end

		slot3 = nil

		if slot0.target_config ~= nil then
			for slot7, slot8 in pairs(slot0.land_list) do
				if slot8.info_data.bid == slot0.target_config.land_id then
					slot3 = slot8.info_data

					break
				end
			end
		end

		slot0.init_x = 0
		slot0.init_y = (SCREEN_HEIGHT - slot0.size.height) * 0.5

		if slot3 then
			if slot3 == nil then
				slot0.init_x = (SCREEN_WIDTH - slot0.size.width) * 0.5
			else
				slot4 = nil
				slot0.init_x = slot3.x < SCREEN_WIDTH / 2 and 0 or slot3.x > slot0.size.width - SCREEN_WIDTH / 2 and SCREEN_WIDTH - slot0.size.width or SCREEN_WIDTH / 2 - slot3.x
			end
		end

		slot0:updateMainScene(slot0.init_x, slot0.init_y)
	end
end

function WorldMapMainWindow.selectedMainLandItem(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	if slot0.cur_main_land ~= nil and slot0.cur_main_land == slot1 then
		return
	end

	if slot0.cur_main_land ~= nil then
		slot0.cur_main_land:setSelectedLand(false)

		slot0.cur_main_land = nil
	end

	slot0.cur_main_land = slot1

	slot0.cur_main_land:setSelectedLand(true)
end

function WorldMapMainWindow.close_callback(slot0)
	doStopAllActions(slot0.map_layer)
	doStopAllActions(slot0.map_wnd)

	if slot0.spine then
		slot0.spine:setVisible(false)
		slot0.spine:clearTracks()
		slot0.spine:runAction(cc.RemoveSelf:create(true))

		slot0.spine = nil
	end

	WorldmapController:getInstance():addLockContainer(false)

	slot4 = false

	BattleController:getInstance():setUnlockChapterStatus(slot4)

	for slot4, slot5 in pairs(slot0.land_list) do
		slot5:DeleteMe()
	end

	slot0.land_list = nil

	WorldmapController:getInstance():openWorldMapMainWindow(false, slot0.data)
end
