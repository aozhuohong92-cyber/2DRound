CenterCityScene = CenterCityScene or BaseClass()
slot0 = MainSceneController:getInstance()
slot1 = table.insert
slot2 = table.remove

function CenterCityScene.__init(slot0, slot1)
	slot0.config = slot1
	slot0.size = cc.size(slot0.config.width, slot0.config.height)
	slot0.layer_num = slot0.config.layer_sum
	slot0.speed_list = {
		0.2,
		0,
		-0.15,
		-0.25
	}
	slot0.step = 0
	slot0.add_build_interval = 2
	slot0.rem_spine_interval = 3600
	slot0.build_list = {}
	slot0.effect_list = {}
	slot0.isStartUpdate = false
	slot0.map_create_end = false
	slot0.map_cache = {}
	slot0.layer_img_list = {
		"1.png",
		"2.png",
		"3.png",
		"4.jpg"
	}
	slot0.cur_time_type = 1
	slot0.target_time_type = 1
	slot0.root_visible = true
	slot0.map_resources_list = {}
	slot0.is_save_logindata = false

	slot0:createRootWnd()
	slot0:registerEvent()
	slot0:createScene()
end

function CenterCityScene.setTimeType(slot0, slot1)
	slot2 = 0

	if slot1 == 6 then
		slot2 = 1
	elseif slot1 == 18 then
		slot2 = 2
	end

	if slot0.target_time_type ~= slot2 then
		slot0.target_time_type = slot2

		if slot0.root_visible == false and slot0.target_time_type ~= slot0.cur_time_type and slot0.map_create_end == true then
			slot0.cur_time_type = slot0.target_time_type

			slot0:changeMainSceneMap()
			slot0:changeSceneEffect()
			slot0:beforeUpdateBuild()
		end
	end
end

function CenterCityScene.setVisible(slot0, slot1)
	slot0.root_visible = slot1

	if slot0.root then
		slot0.root:setVisible(slot1)
	end

	if slot1 == false then
		if slot0.target_time_type ~= slot0.cur_time_type and slot0.map_create_end == true then
			slot0.cur_time_type = slot0.target_time_type

			slot0:changeMainSceneMap()
			slot0:changeSceneEffect()
			slot0:beforeUpdateBuild()
		end

		slot0:showSceneEffectById(false)
	end

	if slot1 == true and MAKELIFEBETTER == true and ios_log_report then
		ios_log_report("center_city_scene")
	end
end

function CenterCityScene.playBackgroundMusic(slot0)
	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, RoleController:getInstance():getModel().city_music_name or "s_002", true)
end

function CenterCityScene.createRootWnd(slot0)
	slot0.root = ccui.Layout:create()

	slot0.root:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
	slot0.root:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
	slot0.root:setScale(display.getMaxScale())

	if is_city_thumbnail then
		slot0.root:setScale(0.3)
	end

	slot0.difference_width = (SCREEN_WIDTH * display.getMaxScale() - (display.getRight(slot0.root, true) - display.getLeft(slot0.root, true))) * 0.5 / display.getMaxScale()
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setContentSize(slot0.size)
	print("主城宽度：" .. slot0.size.width)

	slot4 = slot0.root_wnd

	slot0.root:addChild(slot4)

	for slot4 = 1, slot0.layer_num do
		slot0["map_layer" .. slot4] = ccui.Widget:create()

		slot0["map_layer" .. slot4]:setAnchorPoint(cc.p(0, 0))
		slot0["map_layer" .. slot4]:setContentSize(slot0.size)
		slot0.root_wnd:addChild(slot0["map_layer" .. slot4], slot0.layer_num + 1 - slot4)

		slot0["map_layer" .. slot4].speed = slot0.speed_list[slot4]
	end

	if USESCENEMAKELIFEBETTER then
		slot0.verifyios_bg = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.root_wnd, cc.p(0.5, 0.5), nil, -1)
	end

	slot0.effect_layer = ccui.Layout:create()

	slot0.effect_layer:setContentSize(slot0.size)
	slot0.root_wnd:addChild(slot0.effect_layer, 99)

	slot0.init_x = (SCREEN_WIDTH - slot0.size.width) * 0.5
	slot0.init_y = (SCREEN_HEIGHT - slot0.size.height) * 0.5
	slot1 = 0

	if Config.CityData.data_const then
		slot2 = Config.CityData.data_const.camera_default_x_pos

		if USESCENEMAKELIFEBETTER then
			slot2.val = 0
		end

		if slot2 then
			slot1 = slot2.val - slot0.init_x
		end
	end

	slot0:updateMainScene(slot0.init_x + slot1, slot0.init_y)

	if NEEDCHANGEENTERSTATUS and MAKELIFEBETTER == true then
		slot0:setVisible(false)
	end

	ViewManager:getInstance():addToLayerByTag(slot0.root, ViewMgrTag.Scene_LAYER_TAG)
end

function CenterCityScene.updateMainScene(slot0, slot1, slot2)
	slot2 = slot2 or slot0.init_y

	for slot6 = 1, slot0.layer_num do
		if slot0["map_layer" .. slot6] then
			slot0["map_layer" .. slot6]:setPosition((slot1 - slot0.init_x) * slot0["map_layer" .. slot6].speed, slot2 - slot0.init_y)
		end
	end

	slot0.root_wnd:setPosition(slot1, slot2)
end

function CenterCityScene.moveMainScene(slot0, slot1)
	slot0:updateMainScene(slot0:scaleCheckPoint(slot0.root_wnd:getPositionX() + slot1))
end

function CenterCityScene.scaleCheckPoint(slot0, slot1)
	if slot0.difference_width < slot1 then
		slot1 = slot0.difference_width
	elseif slot1 < SCREEN_WIDTH - slot0.size.width - slot0.difference_width then
		slot1 = SCREEN_WIDTH - slot0.size.width - slot0.difference_width
	end

	return slot1
end

function CenterCityScene.createScene(slot0)
	slot0.map_create_end = false

	if tonumber(os.date("%H")) >= 6 and slot1 < 18 then
		slot0.cur_time_type = 1
		slot0.target_time_type = 1
	else
		slot0.cur_time_type = 2
		slot0.target_time_type = 2
	end

	slot0:changeSceneEffect()

	if USESCENEMAKELIFEBETTER == true then
		slot0:renderMapPicByVerify(slot0.config.width, slot0.config.height)
	else
		slot0:renderMapPic()
		slot0:renderSmallPic()
	end

	if uv0:getBuildList() == nil or next(slot2) == nil then
		if slot0.wait_create_build_event == nil then
			slot0.wait_create_build_event = GlobalEvent:getInstance():Bind(SceneEvent.CreateBuildVoOver, function ()
				GlobalEvent:getInstance():UnBind(uv0.wait_create_build_event)

				uv0.wait_create_build_event = nil

				uv0:beforeCreateBuild()
			end)
		end
	else
		slot0:beforeCreateBuild()
	end
end

function CenterCityScene.beforeCreateBuild(slot0)
	slot0.scene_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("centerscene", "centerscene"), ResourcesType.plist, function ()
		for slot4, slot5 in pairs(uv0:getBuildList()) do
			delayRun(uv1.root, 2 / display.DEFAULT_FPS, function ()
				uv0:createBuildItem(uv1)
			end)
		end

		uv1:setScheduleUpdate(true)
	end, slot0.scene_load)
end

function CenterCityScene.beforeUpdateBuild(slot0)
	slot0.scene_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("centerscene", "centerscene"), ResourcesType.plist, function ()
		if uv0.build_list then
			for slot3, slot4 in pairs(uv0.build_list) do
				delayRun(uv0.root, 2 / display.DEFAULT_FPS, function ()
					if uv0.updateBuildBg then
						uv0:updateBuildBg()
					end
				end)
			end
		end
	end, slot0.scene_load)
end

function CenterCityScene.renderMapPic(slot0)
	slot2, slot3 = nil
	slot4 = cc.p(0, 0)
	slot5 = cc.p(0, 0)

	for slot9, slot10 in ipairs(slot0.layer_img_list) do
		slot3 = string.format("%s/%s", string.format("resource/centerscene/%s/%s", slot0.config.res_id, slot0.cur_time_type), slot10)

		if slot9 == 1 then
			slot4 = cc.p(0, 0)
		elseif slot9 == 2 then
			slot4 = cc.p(0, 60)
		elseif slot9 == 3 then
			slot4 = cc.p(0, 502)
		elseif slot9 == 4 then
			slot5 = cc.p(0, 1)
			slot4 = cc.p(0, slot0.size.height)
		end

		table.insert(slot0.map_cache, {
			res = slot3,
			layer = slot9,
			pos = slot4,
			ap = slot5
		})
	end
end

function CenterCityScene.renderSmallPic(slot0)
	slot0.smallPic = createSprite(string.format("resource/centerscene/preview/%s_%s.jpg", slot0.config.res_id, slot0.cur_time_type), slot0.size.width * 0.5 - 3, slot0.size.height * 0.5 + 12, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE, -1)
	slot2 = slot0.smallPic:getContentSize()

	slot0.smallPic:setScale(slot0.size.width / slot2.width, slot0.size.height / slot2.height)
end

function CenterCityScene.__delete(slot0)
	slot0:setScheduleUpdate(false)

	slot4 = false

	slot0:showSceneEffectById(slot4)

	for slot4 = 1, slot0.layer_num do
		doStopAllActions(slot0["map_layer" .. slot4])
	end

	doStopAllActions(slot0.root_wnd)

	if slot0.scene_load then
		slot0.scene_load:DeleteMe()

		slot0.scene_load = nil
	end

	if slot0.wait_create_build_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.wait_create_build_event)

		slot0.wait_create_build_event = nil
	end

	for slot4, slot5 in pairs(slot0.build_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.build_list = {}

	if not tolua.isnull(slot0.root) then
		slot0.root:removeAllChildren()
		slot0.root:removeFromParent()
	end
end

function CenterCityScene.setScheduleUpdate(slot0, slot1)
	if slot1 == true then
		if slot0.queue_timer == nil then
			slot0.queue_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0:update()
			end, 1 / display.DEFAULT_FPS)
		end
	elseif slot0.queue_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.queue_timer)

		slot0.queue_timer = nil
	end
end

function CenterCityScene.update(slot0, slot1)
	slot0.step = slot0.step + 1

	if slot0.step % 3 == 0 then
		slot0:quequeAddMap()
	end

	if slot0.step > 10 then
		slot0:quequeCreateEffect()
	end

	if slot0.step % slot0.rem_spine_interval == 0 then
		if BattleController:getInstance():isInFight() == false then
			display.removeUnusedTextures()

			slot0.step = 1
		end

		if slot0.is_save_logindata == false then
			slot0.is_save_logindata = true

			LoginController:getInstance():getModel():saveLoginDataToLocal()
		end
	end
end

function CenterCityScene.createBuildItem(slot0, slot1)
	if is_city_thumbnail then
		return
	end

	if slot1 == nil or slot1.config == nil then
		return
	end

	if slot0.build_list[slot1.config.bid] ~= nil then
		return
	end

	if MAKELIFEBETTER == true and slot1.is_verifyios == 0 then
		return
	end

	slot2 = BuildItem.New(slot1, slot1.config.type)

	slot2:setParentWnd(slot0["map_layer" .. slot1.config.layer])

	slot0.build_list[slot1.config.bid] = slot2
end

function CenterCityScene.getBuildById(slot0, slot1)
	return slot0.build_list[slot1]
end

function CenterCityScene.quequeAddMap(slot0)
	if slot0.map_cache == nil or next(slot0.map_cache) == nil then
		return
	end

	if slot0.is_in_load == true then
		return
	end

	slot0.is_in_load = true

	if table.remove(slot0.map_cache, 1) ~= nil then
		slot2 = cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444

		if slot1.layer == 2 or slot1.layer == 3 or EQUIPMENT_QUALITY == 3 then
			slot2 = cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888
		end

		cc.Director:getInstance():getTextureCache():addImageAsync(slot1.res, function ()
			if uv0["map_layer" .. uv1.layer] then
				uv0.map_resources_list[uv1.layer] = createSprite(uv1.res, uv1.pos.x, uv1.pos.y, uv0["map_layer" .. uv1.layer], uv1.ap, LOADTEXT_TYPE, -1)

				if uv1.layer == 1 then
					slot0:setVisible(false)
				end

				if uv1.layer == 4 then
					if uv0.cur_time_type == 1 then
						slot0:setScale(1)
					else
						slot0:setScale(1)
					end
				end

				uv0.is_in_load = false

				if uv0.map_cache == nil or next(uv0.map_cache) == nil then
					uv0:createMainMapOver()
				end
			end
		end, slot2)
	end
end

function CenterCityScene.createMainMapOver(slot0)
	if slot0.smallPic then
		slot0.smallPic:setVisible(false)
		slot0.smallPic:removeFromParent()

		slot0.smallPic = nil
	end

	slot0.map_create_end = true
end

function CenterCityScene.changeMainSceneMap(slot0)
	if USESCENEMAKELIFEBETTER == true then
		return
	end

	slot5 = slot0.cur_time_type

	for slot5, slot6 in pairs(slot0.map_resources_list) do
		if slot0.map_resources_list[slot5] then
			cc.Director:getInstance():getTextureCache():addImageAsync(string.format("%s/%s", string.format("resource/centerscene/%s/%s", slot0.config.res_id, slot5), slot0.layer_img_list[slot5]), function ()
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)

				if uv2 == 4 then
					if uv3.cur_time_type == 1 then
						uv0:setScale(1)
					else
						uv0:setScale(1)
					end
				end
			end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)
		end
	end
end

function CenterCityScene.movoToBuildPos(slot0, slot1, slot2, slot3)
	if slot0.build_list[slot1] == nil then
		return
	end

	if tolua.isnull(slot4:getNode()) then
		return
	end

	if slot0.is_moving_scene == true then
		return
	end

	slot0.is_moving_scene = true

	if slot2 == nil then
		slot2 = true
	end

	slot3 = slot3 or 1
	slot8 = 0

	if ((slot5:convertToWorldSpace(cc.p(0, 0)).x >= SCREEN_WIDTH - slot4:getContentSize().width - 250 or slot6.x <= slot7.width + slot9 or slot0.root_wnd:getPositionX()) and SCREEN_WIDTH - slot6.x - slot7.width - slot9 + slot0.root_wnd:getPositionX()) == slot0.root_wnd:getPositionX() then
		slot0.is_moving_scene = false

		slot0:showFingerTips(slot4, slot2)

		return
	end

	if slot0:scaleCheckPoint(slot8) == slot0.root_wnd:getPositionX() then
		slot0.is_moving_scene = false

		slot0:showFingerTips(slot4, slot2)

		return
	end

	slot11 = cc.MoveTo:create(slot3, cc.p(slot10, slot0.init_y))
	slot12 = cc.CallFunc:create(function ()
		uv0.is_moving_scene = false

		uv0:showFingerTips(uv1, uv2)
	end)

	for slot16 = 1, slot0.layer_num do
		if slot0["map_layer" .. slot16] then
			slot0["map_layer" .. slot16]:runAction(cc.EaseSineOut:create(cc.MoveTo:create(slot3, cc.p((slot10 - slot0.init_x) * slot0["map_layer" .. slot16].speed, 0))))
		end
	end

	slot0.root_wnd:runAction(cc.Sequence:create(cc.EaseSineOut:create(slot11), slot12))
end

function CenterCityScene.showFingerTips(slot0, slot1, slot2)
	if slot2 == false then
		return
	end

	if slot1 == nil then
		return
	end

	slot1:showFingerTips()
end

function CenterCityScene.renderMapPicByVerify(slot0, slot1, slot2)
	if slot0.verifyios_bg then
		loadSpriteTexture(slot0.verifyios_bg, string.format("resource/centerscene/%s.jpg", slot0.config.res_id), LOADTEXT_TYPE)
	end
end

function CenterCityScene.changeSceneEffect(slot0)
	if USESCENEMAKELIFEBETTER == true then
		return
	end

	slot0.effect_render_list = {}

	for slot4, slot5 in pairs(slot0.effect_list) do
		if slot5.data and slot5.data.dun_id and slot5.data.dun_id ~= 0 then
			slot5:DeleteMe()

			slot0.effect_list[slot4] = nil
		end
	end

	slot0:analysisEffect()
end

function CenterCityScene.analysisEffect(slot0)
	slot0.effect_render_list = {}

	if slot0.config ~= nil and slot0.config.building_list ~= nil then
		for slot4, slot5 in ipairs(slot0.config.building_list) do
			if (slot5.dun_id == 0 or slot0.cur_time_type == slot5.dun_id) and slot5.type ~= BuildItemType.build and slot0.effect_list[slot5.bid] == nil then
				uv0(slot0.effect_render_list, slot5)
			end
		end
	end

	if #slot0.effect_render_list then
		table.sort(slot0.effect_render_list, SortTools.tableLowerSorter({
			"layer",
			"bid"
		}))
	end
end

function CenterCityScene.quequeCreateEffect(slot0)
	if USESCENEMAKELIFEBETTER == true then
		return
	end

	if is_city_thumbnail then
		return
	end

	if slot0.effect_render_list == nil or next(slot0.effect_render_list) == nil then
		return
	end

	if slot0.map_create_end == true then
		if uv0(slot0.effect_render_list, 1) ~= nil then
			if slot0.effect_list[slot1.bid] ~= nil then
				return
			end

			slot2, slot3, slot4 = PathTool.getSpineByName(slot1.res)

			cc.Director:getInstance():getTextureCache():addImageAsync(slot4, function ()
				slot0 = BuildItem.New(uv0, uv0.type)

				slot0:setParentWnd(uv1["map_layer" .. uv0.layer])

				uv1.effect_list[uv0.bid] = slot0
			end, getPixelFormat(slot1.res))
		end
	end
end

function CenterCityScene.getCurTimeType(slot0)
	return slot0.cur_time_type
end

function CenterCityScene.registerEvent(slot0)
	slot4 = cc.EventListenerTouchOneByOne:create()

	slot4:registerScriptHandler(function (slot0, slot1)
		if GuideController:getInstance():isInGuide() == true then
			return false
		end

		if USESCENEMAKELIFEBETTER == true then
			return false
		end

		if uv0.screenSize == nil then
			slot2 = uv0.root:convertToWorldSpace(cc.p(0, 0))
			uv0.screenSize = cc.rect(slot2.x, slot2.y + 100, SCREEN_WIDTH, SCREEN_HEIGHT - 100)
		end

		if not cc.rectContainsPoint(uv0.screenSize, cc.p(slot0:getLocation().x, slot0:getLocation().y)) then
			return false
		end

		uv0.last_point = nil

		for slot6 = 1, uv0.layer_num do
			doStopAllActions(uv0["map_layer" .. slot6])
		end

		uv0.is_moving_scene = false

		doStopAllActions(uv0.root_wnd)

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

		slot4 = uv0:scaleCheckPoint(uv0.root_wnd:getPositionX() + uv0.last_point.x * 3)

		for slot8 = 1, uv0.layer_num do
			if uv0["map_layer" .. slot8] then
				uv0["map_layer" .. slot8]:runAction(cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p((slot4 - uv0.init_x) * uv0["map_layer" .. slot8].speed, 0))))
			end
		end

		uv0.root_wnd:runAction(cc.Sequence:create(cc.EaseBackOut:create(cc.MoveTo:create(1, cc.p(slot4, uv0.init_y)))))
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.root:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot4, slot0.root)
end

function CenterCityScene.showSceneEffectById(slot0, slot1, slot2, slot3, slot4)
	if slot4 then
		slot0.petard_self_num = slot4
	else
		slot0.petard_self_num = slot0.petard_self_num or 0
	end

	if slot0.is_show_effect then
		return
	end

	if slot1 == true and slot2 and Config.EffectData.data_effect_info[slot2] then
		slot0.is_show_effect = true

		playOtherSound("c_petard")

		if slot0.scene_effect and slot0.cur_effect_id and slot0.cur_effect_id ~= slot2 then
			slot0.scene_effect:clearTracks()
			slot0.scene_effect:removeFromParent()

			slot0.scene_effect = nil
		end

		slot3 = slot3 or PlayerAction.action

		if not tolua.isnull(slot0.effect_layer) and slot0.scene_effect == nil then
			slot0.scene_effect = createEffectSpine(Config.EffectData.data_effect_info[slot2], cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0.onPetardEffectEnd))

			slot0.effect_layer:addChild(slot0.scene_effect)
		elseif slot0.scene_effect then
			slot0.scene_effect:setToSetupPose()
			slot0.scene_effect:setAnimation(0, slot3, false)
		end

		slot0.cur_effect_id = slot2
	else
		slot0.is_show_effect = false

		if slot0.scene_effect then
			slot0.scene_effect:clearTracks()
			slot0.scene_effect:removeFromParent()

			slot0.scene_effect = nil
		end
	end
end

function CenterCityScene.onPetardEffectEnd(slot0)
	slot1 = 0

	if Config.HolidayPetardData.data_const.firework_cd then
		slot1 = slot2.val
	end

	delayRun(slot0.effect_layer, slot1, function ()
		uv0.is_show_effect = false
	end)

	slot3 = Config.HolidayPetardData.data_const.firework_bid

	if slot0.petard_self_num and slot0.petard_self_num > 0 and slot3 then
		PetardActionController:getInstance():sender27001(slot3.val, slot0.petard_self_num)

		slot0.petard_self_num = 0
	end
end

function CenterCityScene.moveToCenterPos(slot0)
	slot0:updateMainScene((SCREEN_WIDTH - slot0.size.width) * 0.5, (SCREEN_HEIGHT - slot0.size.height) * 0.5)
end
