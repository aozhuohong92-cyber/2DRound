slot0 = Area_sceneController:getInstance()
slot1 = string.format
slot2 = table.insert
slot3 = table.remove
AreaSceneWindow = AreaSceneWindow or BaseClass(BaseView)

function AreaSceneWindow.__init(slot0, slot1)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.is_show_func_icon = 1
	slot0.layout_name = "areascene/area_scene_window"
	slot0.res_list = {}
	slot0.config = slot1
	slot0.size = cc.size(slot0.config.width, slot0.config.height)
	slot0.layer_num = slot1.layer_sum or 3
	slot0.map_data = {}
	slot0.speed_list = {
		0,
		-0.15,
		-0.25
	}
	slot0.map_resources_list = {}
	slot0.build_item_list = {}
	slot0.effect_list = {}
end

function AreaSceneWindow.open_callback(slot0)
	slot0.touch_layer = slot0.root_wnd:getChildByName("touch_layer")
	slot0.map_layer = slot0.root_wnd:getChildByName("map_layer")
	slot0.ui_container = slot0.root_wnd:getChildByName("ui_container")

	slot0.touch_layer:setScale(display.getMaxScale())

	slot4 = "close_btn"
	slot0.close_btn = slot0.ui_container:getChildByName(slot4)

	for slot4 = 1, slot0.layer_num do
		slot0["map_layer" .. slot4] = ccui.Widget:create()

		slot0["map_layer" .. slot4]:setAnchorPoint(cc.p(0, 0))
		slot0["map_layer" .. slot4]:setContentSize(slot0.size)
		slot0.map_layer:addChild(slot0["map_layer" .. slot4], slot0.layer_num + 1 - slot4)

		slot0["map_layer" .. slot4].speed = slot0.speed_list[slot4]
	end

	slot1 = display.getBottom(slot0.map_layer)

	slot0.map_layer:setPositionY(slot1)
	slot0.ui_container:setPositionY(slot1)

	slot0.init_x = (SCREEN_WIDTH - slot0.size.width) * 0.5
	slot0.init_y = slot1

	slot0:updateMainScene(slot0.init_x, slot0.init_y)
end

function AreaSceneWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)

	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:setSwallowTouches(true)
	slot4:registerScriptHandler(function (slot0, slot1)
		if uv0.screenSize == nil then
			slot2 = uv0.touch_layer:convertToWorldSpace(cc.p(0, 0))
			uv0.screenSize = cc.rect(slot2.x, slot2.y + 100, SCREEN_WIDTH, SCREEN_HEIGHT - 100)
		end

		if not cc.rectContainsPoint(uv0.screenSize, cc.p(slot0:getLocation().x, slot0:getLocation().y)) then
			return false
		end

		uv0.last_point = nil

		for slot6 = 1, uv0.layer_num do
			doStopAllActions(uv0["map_layer" .. slot6])
		end

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

		slot4 = uv0:scaleCheckPoint(uv0.map_layer:getPositionX() + uv0.last_point.x * 3)

		for slot8 = 1, uv0.layer_num do
			if uv0["map_layer" .. slot8] then
				uv0["map_layer" .. slot8]:runAction(cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p((slot4 - uv0.init_x) * uv0["map_layer" .. slot8].speed, 0))))
			end
		end

		uv0.map_layer:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p(slot4, uv0.init_y)))))
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.touch_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.touch_layer)
end

function AreaSceneWindow.openRootWnd(slot0)
	slot0:playCloudEffect(true)
	slot0:setMapAndBuild()
end

function AreaSceneWindow.setVisible(slot0, slot1)
	slot0.is_visible = slot1

	if slot0.root_wnd == nil or tolua.isnull(slot0.root_wnd) then
		return
	end

	slot0.root_wnd:setVisible(slot1)
	MainuiController:getInstance():showFuncIconList(slot1)
end

function AreaSceneWindow.setMapAndBuild(slot0)
	slot0:initMapCacheData()
	slot0:createMap()
	slot0:createBuildList()
end

function AreaSceneWindow.initMapCacheData(slot0)
	slot0.map_data = {}

	for slot5 = 1, slot0.layer_num do
		uv1(slot0.map_data, {
			res = uv0("%s/%s.png", uv0("resource/area_scene/map/%s", slot0.config.res_id), slot5),
			layer = slot5,
			pos_y = Area_sceneConst.Map_Pos_Y[slot5] or 0
		})
	end
end

function AreaSceneWindow.createMap(slot0)
	if not slot0.map_data or next(slot0.map_data) == nil then
		return
	end

	for slot4, slot5 in ipairs(slot0.map_data) do
		delayRun(slot0.root_wnd, slot4 / display.DEFAULT_FPS, function ()
			cc.Director:getInstance():getTextureCache():addImageAsync(uv0.res, function ()
				if uv0["map_layer" .. uv1.layer] then
					if uv0.map_resources_list[uv1.layer] == nil then
						uv0.map_resources_list[uv1.layer] = createSprite(uv1.res, 0, uv1.pos_y, uv0["map_layer" .. uv1.layer], cc.p(0, 0), LOADTEXT_TYPE, -1)

						if uv1.layer == 3 then
							slot1:setScale((display.height - uv1.pos_y) / slot1:getContentSize().height)
						end
					else
						loadSpriteTexture(slot0, uv1.res, LOADTEXT_TYPE)
					end
				end
			end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
		end)
	end
end

function AreaSceneWindow.createBuildList(slot0)
	if not slot0.config.building_list or next(slot0.config.building_list) == nil then
		return
	end

	for slot4, slot5 in pairs(slot0.config.building_list) do
		delayRun(slot0.root_wnd, slot4 / display.DEFAULT_FPS, function ()
			if uv0.build_item_list[uv1] == nil then
				slot0 = AreaBuildItem.New(uv2, uv0.config.id)

				slot0:setParentWnd(uv0["map_layer" .. uv2.layer])

				uv0.build_item_list[uv1] = slot0

				if uv2.bid == Area_sceneConst.Shop_Type.gift then
					slot0:setRedStatus(MallController:getInstance():getModel():getChargeShopRedData())
				elseif uv2.bid == Area_sceneConst.Shop_Type.sprite then
					slot0:setRedStatus({
						{
							bid = MallConst.Red_Index.Variety,
							status = MallController:getInstance():getModel():getMallRedStateByBid(MallConst.Red_Index.Variety)
						}
					})
				end
			end
		end)
	end
end

function AreaSceneWindow.onClickCloseBtn(slot0)
	uv0:openAreaScene(false)
end

function AreaSceneWindow.moveMainScene(slot0, slot1)
	slot0:updateMainScene(slot0:scaleCheckPoint(slot0.map_layer:getPositionX() + slot1))
end

function AreaSceneWindow.scaleCheckPoint(slot0, slot1)
	if slot1 > 0 then
		slot1 = 0
	elseif slot1 < SCREEN_WIDTH - slot0.size.width then
		slot1 = SCREEN_WIDTH - slot0.size.width
	end

	return slot1
end

function AreaSceneWindow.updateMainScene(slot0, slot1, slot2)
	slot2 = slot2 or slot0.init_y

	for slot6 = 1, slot0.layer_num do
		if slot0["map_layer" .. slot6] then
			slot0["map_layer" .. slot6]:setPosition((slot1 - slot0.init_x) * slot0["map_layer" .. slot6].speed, slot2 - slot0.init_y)
		end
	end

	slot0.map_layer:setPosition(slot1, slot2)
end

function AreaSceneWindow.playCloudEffect(slot0, slot1)
	if slot1 == true then
		if slot0.cloud_effect == nil then
			slot0.cloud_effect = createEffectSpine(Config.EffectData.data_effect_info[157], cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.cloud_effect:setScale(display.getMaxScale())
			ViewManager:getInstance():addToLayerByTag(slot0.cloud_effect, ViewMgrTag.TOP_TAG)
		elseif slot0.cloud_effect then
			slot0.cloud_effect:setToSetupPose()
			slot0.cloud_effect:setAnimation(0, PlayerAction.action_1, false)
		end
	elseif slot0.cloud_effect then
		slot0.cloud_effect:clearTracks()
		slot0.cloud_effect:removeFromParent()

		slot0.cloud_effect = nil
	end
end

function AreaSceneWindow.setBuildRedStatus(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.build_item_list) do
		if slot7:getData() and slot8.bid == slot1 then
			slot7:setRedStatus(slot2)

			break
		end
	end
end

function AreaSceneWindow.close_callback(slot0)
	slot4 = false

	slot0:playCloudEffect(slot4)

	for slot4, slot5 in pairs(slot0.build_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0.build_item_list = {}

	uv0:openAreaScene(false)
end
