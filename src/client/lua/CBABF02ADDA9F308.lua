RoleScene = RoleScene or BaseClass()
RoleScene.layer = {
	role = 1,
	back = 2
}

function RoleScene.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.model = slot0.ctrl:getModel()

	slot0:config()
	slot0:configUI()
	slot0:registerEvent()
end

function RoleScene.setVisible(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setVisible(slot1)
	end
end

function RoleScene.playBackgroundMusic(slot0)
	slot1 = RoleController:getInstance():getModel().city_music_name or "s_002"

	if slot0.scene_info ~= nil and slot0.scene_info.misc_music and slot0.scene_info.misc_music ~= "" then
		slot1 = slot0.scene_info.misc_music
	end
end

function RoleScene.config(slot0)
	slot0.step = 1
	slot0.role_list = {}
	slot0.unit_list = {}
	slot0.click_delay = GameNet:getInstance():getTimeFloat()
	slot0.one_scene_max = 15
	slot0.topOffY = 15
	slot0.cur_visible_player = 0
	slot0.scene_x = 0
	slot0.scene_y = 0
	slot0.render_effect_list = {}
	slot0.effect_list = {}
	slot0.mapResAsyncList = {}
	slot0.mapResCache = {}
	slot0.mapResCacheOrder = {}
	slot0.mapPicCache = {}
	slot0.mapTileList = {}
	slot0.autoLoaderNumX = 1 + math.ceil(SCREEN_WIDTH / 2 / 256)
	slot0.autoLoaderNumY = 1 + math.ceil(SCREEN_HEIGHT / 2 / 256)
	slot0.finishRender = false
	slot0.loading_pic = false
	slot0.bLayer_sp = -0.2
	slot0.renderObjList = {}
	slot0.renderEffectObjList = {}
end

function RoleScene.configUI(slot0)
	slot1 = ViewManager:getInstance():getBaseLayout()
	slot0.root = ccui.Layout:create()

	slot0.root:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root:setContentSize(cc.size(display.getRight(slot1) - display.getLeft(slot1), display.getTop(slot1) - display.getBottom(slot1)))
	slot0.root:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

	slot0.root_wnd = ccui.Widget:create()

	slot0.root:addChild(slot0.root_wnd)

	slot0.pic_layer = ccui.Widget:create()
	slot0.map_bLayer = ccui.Widget:create()
	slot0.map_sLayer = ccui.Widget:create()
	slot0.role_layer = ccui.Widget:create()

	slot0.root_wnd:addChild(slot0.pic_layer, 0)
	slot0.root_wnd:addChild(slot0.map_bLayer, 1)
	slot0.root_wnd:addChild(slot0.map_sLayer, 2)
	slot0.root_wnd:addChild(slot0.role_layer, 4)
	slot0.role_layer:setAnchorPoint(cc.p(0, 1))
	slot0.map_bLayer:setAnchorPoint(cc.p(0, 0))
	slot0.map_sLayer:setAnchorPoint(cc.p(0, 0))
	ViewManager:getInstance():addToLayerByTag(slot0.root, ViewMgrTag.Scene_LAYER_TAG)
end

function RoleScene.registerEvent(slot0)
	slot0.touch_listener = cc.EventListenerTouchOneByOne:create()

	slot0.touch_listener:registerScriptHandler(function (slot0, slot1)
		if uv0.hero == nil then
			return false
		end

		if math.abs(GameNet:getInstance():getTimeFloat() - uv0.click_delay) < 0.1 then
			return false
		else
			uv0.click_delay = GameNet:getInstance():getTimeFloat()
		end

		return true
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot0.touch_listener:registerScriptHandler(function (slot0, slot1)
		if uv0.hero == nil then
			return
		end
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot0.touch_listener:registerScriptHandler(function (slot0, slot1)
		if uv0.hero == nil then
			return
		end

		GlobalEvent:getInstance():Fire(NpcEvent.CloseNpcTalkViewEvent)

		if uv0.model then
			uv0.model:clearFindVo()
		end

		uv0.model:handleSceneHead(false)

		slot2 = uv0.map_sLayer:convertToNodeSpace(cc.p(slot0:getLocation()))
		slot3 = TileUtil.changeToTilePoint(slot2)
		slot4 = uv0.hero:getLogicPos()

		if uv0:getNearEndPos(slot2, uv0.hero:getWorldPos()) and slot3.x == slot4.x and slot3.y == slot4.y then
			slot3 = TileUtil.changeToTilePoint(slot2)

			if math.abs(slot3.y - slot4.y) <= math.abs(slot3.x - slot4.x) then
				slot3.y = slot4.y
				slot2 = TileUtil.changeToPixsPoint(slot3)
			else
				slot3.x = slot4.x
				slot2 = TileUtil.changeToPixsPoint(slot3)
			end
		end

		if uv0:getNearEndPos(slot2, uv0.hero:getWorldPos()) ~= nil then
			uv0:startWalk(slot4, slot3)
		end
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.root_wnd:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot0.touch_listener, slot0.root_wnd)

	if slot0.update_red_info == nil then
		slot0.update_red_info = GlobalEvent:getInstance():Bind(RolesceneEvent.UPDATE_RED_INFO, function (slot0, slot1)
			if type(slot0) == "table" or slot1 == nil then
				return
			end

			uv0:updateNpcRedStatusByType(slot1)
		end)
	end
end

function RoleScene.getNearEndPos(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return nil
	end

	slot3 = nil
	slot4 = TileUtil.changeToTilePoint(slot1)

	if Astar:getInstance():isBlock(slot4.x, slot4.y) then
		slot8 = nil
		slot8 = cc.pSub(slot1, cc.pMul(cc.pNormalize(cc.pSub(slot1, slot2)), TileUtil.tileWidth))
		slot9, slot10 = nil

		if slot1.x == cc.p((slot1.x >= slot2.x or cc.clampf(slot8.x, slot1.x, slot2.x)) and cc.clampf(slot8.x, slot2.x, slot1.x), (slot1.y >= slot2.y or cc.clampf(slot8.y, slot1.y, slot2.y)) and cc.clampf(slot8.y, slot2.y, slot1.y)).x and slot1.y == slot8.y then
			return nil
		end

		return slot0:getNearEndPos(slot8, slot2)
	end

	return slot3 or slot4
end

function RoleScene.startWalk(slot0, slot1, slot2)
	if slot0.hero == nil then
		return
	end

	slot3 = slot0.hero:getWorldPos()

	if slot2 == nil and slot0.findVo == nil then
		return
	end

	slot4 = nil

	if slot0.findVo and slot0.findVo.sceneId == slot0.model:getSceneId() and MapUtil.isOnRange(slot3, (slot2 ~= nil or TileUtil.changeToPixsPoint(slot0.findVo.pos)) and TileUtil.changeToPixsPoint(slot2), slot0.model.unitRange) then
		GlobalEvent:getInstance():Fire(RolesceneEvent.SCENE_WALKEND, slot0.findVo)

		return
	end

	slot0.model:findPath(slot1, slot2)
	slot0:walkNext(slot3)
end

function RoleScene.walkNext(slot0, slot1)
	if slot0.findVo ~= nil and slot0.findVo.sceneId == slot0.model:getSceneId() and MapUtil.isOnRange(slot1, slot0.findVo.pos, slot0.model.unitRange) then
		GlobalEvent:getInstance():Fire(RolesceneEvent.SCENE_WALKEND, slot0.findVo)
		slot0:cancelWalk()

		return
	end

	if slot0.model.path == nil or #slot0.model.path == 0 then
		if slot0.findVo == nil then
			slot0.model.findVoTarget = nil

			slot0:cancelWalk()
		end

		return
	end

	slot0.hero:doMove(slot1, TileUtil.changeToPixsPoint(table.remove(slot0.model.path, #slot0.model.path)))
end

function RoleScene.cancelWalk(slot0, slot1)
	if slot0.hero == nil or slot0.hero:getVo() == nil then
		return
	end

	slot0.hero:stopMove()

	if slot0.findVo and slot0.findVo.callback then
		slot0.findVo.callback()
	end

	slot0.findVo = nil
	slot0.model.path = nil
end

function RoleScene.gotoTarget(slot0, slot1, slot2)
	if slot0.hero == nil then
		return
	end

	slot0.findVo = slot1

	if slot0.findVo == nil then
		return
	end

	if slot0.findVo.sub_type ~= RoleSceneVo.sub_unittype.ele and slot0.model:getSceneId() == slot0.findVo.sceneId then
		slot0.findVo.pos = (function (slot0)
			slot1, slot2, slot3, slot4 = nil
			slot5 = true
			slot6 = 0
			slot0 = TileUtil.changeToTilePoint(slot0)

			while slot6 < 20 do
				slot3 = math.floor(slot0.x + 2 * math.cos(math.random(0, 180)))
				slot4 = math.floor(slot0.y - 2 * math.sin(math.random(90, 270)))
				slot1 = TileUtil.changeToPixsPoint(cc.p(slot3, slot4))

				if Astar:getInstance():isBlock(slot3, slot4) == false then
					break
				end

				if slot6 + 1 >= 20 then
					slot1 = slot0
				end
			end

			return slot1
		end)(slot1.pos)
	end

	slot0:startWalk(slot0.hero:getLogicPos(), slot0:getNearEndPos(slot0.findVo.pos, slot0.hero:getWorldPos()))
end

function RoleScene.createScene(slot0, slot1, slot2)
	slot0.scene_info = slot0.model:getSceneInfo()
	slot0.scene_data = slot0.model:getSceneData()

	if slot0.scene_info == nil or slot0.scene_data == nil then
		slot0.ctrl:exitRoleScene(true)
	else
		slot0:playBackgroundMusic()

		slot0.loading_pic = false

		slot0:clearLayer()
		slot0:layoutScene()
		slot0:renderScene()

		slot3, slot4, slot5, slot10 = slot0:getScenePicByPos(slot0.scene_info.s_img_w, slot0.scene_info.s_img_h, slot0.scene_data.x, slot0.scene_data.y)
		slot0.nowPicTile = cc.p(slot5, slot10)

		for slot10, slot11 in pairs(slot0.mapResCache) do
			slot11[4] = slot11[4] + math.max(math.abs(slot5 - slot11[2]), math.abs(slot6 - slot11[3]))

			table.insert(slot0.mapResCacheOrder, slot11)
		end

		table.sort(slot0.mapResCacheOrder, SortTools.KeyLowerSorter(4))
		slot0:quequeAddFun()
		slot0:setScheduleUpdate(true)
	end
end

function RoleScene.layoutScene(slot0)
	if slot0.scene_info == nil then
		return
	end

	slot0.loadkey = {}

	slot0.map_bLayer:setContentSize(cc.size(slot0.scene_info.width, slot0.scene_info.height))
	slot0.map_sLayer:setContentSize(cc.size(slot0.scene_info.width, slot0.scene_info.height))
end

function RoleScene.renderScene(slot0)
	if slot0.finishRender or slot0.scene_info == nil then
		return
	end

	if slot0.scene_info.fill_type ~= 1 then
		slot0:renderNormal(slot0.scene_info.width, slot0.scene_info.height)
	end
end

function RoleScene.renderNormal(slot0, slot1, slot2)
	slot0:renderSmallPic()
	slot0:renderLayer(MapUtil.s, slot0.scene_info.s_img_w, slot0.scene_info.s_img_h)
	slot0:renderLayer(MapUtil.b, slot0.scene_info.b_img_w, slot0.scene_info.b_img_h)

	slot0.finishRender = true
end

function RoleScene.renderSmallPic(slot0)
	slot2 = display.newSprite("scene/preview/" .. slot0.scene_info.sourceId .. ".jpg")

	slot0.pic_layer:addChild(slot2)
	slot2:setAnchorPoint(cc.p(0, 0))

	slot3 = slot2:getBoundingBox()

	slot2:setScale(slot0.scene_info.s_img_w / slot3.width, slot0.scene_info.s_img_h / slot3.height)
end

function RoleScene.renderLayer(slot0, slot1, slot2, slot3)
	slot4 = 0
	slot5 = 0

	while slot3 > slot5 do
		slot4 = 0

		while slot2 > slot4 do
			slot0:renderLayerTile(slot1, slot4, slot5)

			slot4 = slot4 + MapUtil.c_w
		end

		slot5 = slot5 + MapUtil.c_h
	end
end

function RoleScene.renderLayerTile(slot0, slot1, slot2, slot3)
	if slot1 == MapUtil.s then
		slot0:addFloorSprite(slot1, slot2, slot3, cc.p(0, 0))
	elseif slot1 == MapUtil.b then
		slot0:addFloorSprite(slot1, slot2, slot3, cc.p(0, 1))
	end
end

function RoleScene.addFloorSprite(slot0, slot1, slot2, slot3, slot4)
	slot6 = slot0.scene_info[slot1 .. "_img_h"]

	if slot0.scene_info[slot1 .. "_img_w"] == 0 or slot6 == 0 then
		return
	end

	slot7, slot8, slot9, slot10 = slot0:getScenePicByPos(slot5, slot6, slot2, slot3)

	if slot0.mapPicCache[slot1 .. "_" .. slot2 .. "_" .. slot3] ~= nil then
		return slot0.mapPicCache[slot11]
	end

	if not slot0.loadkey[slot11] then
		slot0.loadkey[slot11] = true

		slot0:createFloorSprite(slot1, slot0:getPicRes(slot1, slot9, slot10), slot2, slot3, anchorPoint, true, true)
	end
end

function RoleScene.getScenePicByPos(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = math.modf(slot3 / slot1)
	slot7, slot8 = math.modf(slot4 / slot2)

	return slot5, slot7, math.floor(math.ceil(slot6 * slot1) / MapUtil.c_w), math.floor(math.ceil(slot8 * slot2) / MapUtil.c_h)
end

function RoleScene.getPicRes(slot0, slot1, slot2, slot3)
	if slot0.mapResCache[slot1 .. "_" .. slot2 .. "_" .. slot3] ~= nil then
		return slot0.mapResCache[slot1 .. "_" .. slot2 .. "_" .. slot3][1]
	end

	slot4, slot5 = nil

	if slot1 == MapUtil.b then
		slot5 = "jpg"

		if not PathTool.isFileExist("scene/map/" .. slot0.scene_info.backId .. "/" .. slot1 .. "layer/" .. slot2 .. "_" .. slot3 .. ".jpg") then
			slot4 = "scene/map/" .. slot0.scene_info.backId .. "/" .. slot1 .. "layer/" .. slot2 .. "_" .. slot3 .. ".png"
			slot5 = "png"
		end
	elseif slot1 == MapUtil.s then
		slot5 = "png"

		if not PathTool.isFileExist("scene/map/" .. slot0.scene_info.sourceId .. "/" .. slot1 .. "layer/" .. slot2 .. "_" .. slot3 .. ".png") then
			slot4 = "scene/map/" .. slot0.scene_info.sourceId .. "/" .. slot1 .. "layer/" .. slot2 .. "_" .. slot3 .. ".jpg"
			slot5 = "jpg"
		end
	end

	slot0.mapResCache[slot1 .. "_" .. slot2 .. "_" .. slot3] = {
		slot4,
		slot2,
		slot3,
		slot1 == MapUtil.s and 0 or 9999999999.0,
		slot5
	}

	return slot4
end

function RoleScene.createFloorSprite(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot1 == MapUtil.b then
		slot4 = slot0.scene_info.height - slot4
	end

	table.insert(slot0.mapResAsyncList, {
		slot1,
		slot2,
		slot3,
		slot4,
		slot5,
		slot6,
		slot7
	})
end

function RoleScene.createFloorSpriteAct(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if MapUtil then
		slot8 = slot1 .. "_" .. slot3 .. "_" .. slot4
		slot9 = math.floor(slot3 / slot0.scene_info[slot1 .. "_img_w"])
		slot10 = slot0.scene_info[slot1 .. "_img_y"] or 0
		slot11 = slot0["map_" .. slot1 .. "Layer"]
		slot12 = nil

		if ((slot1 ~= MapUtil.b or MapTile.New(cc.p(slot3 - slot9, slot4), slot2, slot1, slot6, slot7, slot11, true)) and MapTile.New(cc.p(slot3 - slot9, slot4), slot2, slot1, slot6, slot7, slot11, false)) == nil or slot12.isDeleted then
			return
		end

		slot0.mapPicCache[slot8] = slot12

		table.insert(slot0.mapTileList, slot12)
		slot0.mapPicCache[slot8]:retain()

		slot0.isAddedAll = false
	end
end

function RoleScene.addMapTile(slot0)
	if slot0.isAddedAll then
		return
	end

	slot0.isAddedAll = true

	for slot4, slot5 in ipairs(slot0.mapTileList) do
		if not slot5:isAdded() then
			slot5:addChildOnParent()
		end
	end
end

function RoleScene.quequeAddFun(slot0)
	if slot0.loading_pic then
		return
	end

	for slot4, slot5 in pairs(slot0.mapResCacheOrder) do
		if slot5[4] > 100000 or math.abs(slot5[2] - slot0.nowPicTile.x) < slot0.autoLoaderNumX and math.abs(slot5[3] - slot0.nowPicTile.y) < slot0.autoLoaderNumY then
			slot0.mapResCacheOrder[slot4] = nil
			slot0.loading_pic = true

			cc.Director:getInstance():getTextureCache():addImageAsync(slot5[1], function ()
				for slot3, slot4 in pairs(uv0.mapResAsyncList) do
					if slot4[2] == uv1 then
						uv0:createFloorSpriteAct(unpack(slot4))

						uv0.mapResAsyncList[slot3] = nil
					end
				end

				uv0.loading_pic = nil

				uv0:quequeAddFun()
			end, slot5[5] == "jpg" and cc.TEXTURE2_D_PIXEL_FORMAT_RG_B565 or cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)

			return
		end
	end
end

function RoleScene.setScheduleUpdate(slot0, slot1)
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

function RoleScene.update(slot0)
	if slot0.hero and slot0.hero:getVo() and slot0.hero.isNeedRun then
		slot0.model:updateCamera(slot0.hero:getWorldPos())
	end

	for slot5, slot6 in pairs(slot0.role_list) do
		if slot6.vo ~= nil then
			slot6:update()

			if slot0.step % 31 == 0 then
				slot6:setAlpha(Astar:getInstance():isAlpha(slot6:getLogicPos().x, slot6:getLogicPos().y))
			end
		end
	end

	for slot5, slot6 in pairs(slot0.unit_list) do
		if slot6.vo ~= nil then
			slot6:update()
		end
	end

	slot0:addMapTile()

	slot0.step = slot0.step + 1

	if slot0.step % (ADD_OBJ_RATE or 1) == 0 then
		slot0:quequeAddObj()
	end

	if slot0.step % 16 == 0 then
		slot0:quequeAddEffect()
	end
end

function RoleScene.quequeAddObj(slot0)
	if BattleController:getInstance():isInFight() == true then
		return
	end

	if slot0.renderObjList and next(slot0.renderObjList) ~= nil then
		slot2 = nil
		slot3 = -slot0.scene_x + SCREEN_WIDTH / 2
		slot4 = -slot0.scene_y + SCREEN_HEIGHT / 2

		for slot8, slot9 in ipairs(slot0.renderObjList) do
			if slot0:checkCreateUnit(slot9) == true then
				if slot0.hero == nil then
					slot2 = table.remove(slot0.renderObjList, slot8)

					break
				elseif math.abs(slot9.x - slot3) < SCREEN_WIDTH / 2 + 300 and math.abs(slot9.y - slot4) < SCREEN_HEIGHT / 2 + 300 then
					slot2 = table.remove(slot0.renderObjList, slot8)

					break
				end
			end
		end

		if slot2 ~= nil then
			slot0:isExistOnQueque(slot2)
		end
	end
end

function RoleScene.checkCreateUnit(slot0, slot1)
	if slot1 == nil then
		return false
	end

	if slot1.type ~= RoleSceneVo.unittype.role then
		return true
	end

	return true
end

function RoleScene.isExistOnQueque(slot0, slot1)
	if slot1 == nil or slot1.body_res == nil then
		return
	end

	if slot1.type == RoleSceneVo.unittype.role then
		if slot0.model:getRole(slot1.srv_id, slot1.rid) and not slot0.model:isMainRoleVo(getNorKey(slot1.srv_id, slot1.rid)) then
			slot0:asyncLoad(slot1, function ()
				if uv0.model and uv0.model:getRole(uv1.srv_id, uv1.rid) and not uv0.model:isMainRoleVo(getNorKey(uv1.srv_id, uv1.rid)) then
					uv0:createPlayer(uv1, false, true)
				end
			end)
		end
	elseif slot1.type == RoleSceneVo.unittype.unit and slot0.model:getUnit(slot1.id, slot1.battle_id) ~= nil then
		slot0:asyncLoad(slot1, function ()
			if uv0.model and uv0.model:getUnit(uv1.id, uv1.battle_id) then
				uv0:createNpc(uv1)
			end
		end)
	end
end

function RoleScene.quequeAddEffect(slot0)
	if slot0.render_effect_list and next(slot0.render_effect_list) ~= nil then
		if table.remove(slot0.render_effect_list) ~= nil then
			if slot0.effect_list[getNorKey(slot1.base_id, slot1.x, slot1.y)] ~= nil then
				return
			end

			if Config.UnitData.data_unit(slot1.base_id) ~= nil and slot3.body_id ~= "" then
				slot4, slot5, slot6, slot7 = PathTool.getSpineByName(slot3.body_id)

				cc.Director:getInstance():getTextureCache():addImageAsync(slot6, function ()
					slot0 = createEffectSpine(uv0.body_id, cc.p(uv1.x, uv1.y), cc.p(0.5, 0))
					slot1 = uv2.role_layer

					if uv1.layer == RoleScene.layer.back then
						slot1 = uv2.map_bLayer
					end

					if slot1 and not tolua.isnull(slot1) then
						slot1:addChild(slot0)
					end

					uv2.effect_list[uv3] = slot0
				end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)
			end
		end
	end
end

function RoleScene.asyncLoad(slot0, slot1, slot2)
	if slot1 == nil and slot2 ~= nil then
		slot2()

		return
	end

	slot3 = nil

	if slot1.type == RoleSceneVo.unittype.role or slot1.sub_type == RoleSceneVo.sub_unittype.npc then
		slot3 = PlayerAction.battle_stand
	end

	slot4, slot5, slot6, slot7 = PathTool.getSpineByName(slot1.body_res, slot3)

	if display.isPrefixExist(slot7) then
		slot2()
	else
		slot0.loading_spine = true

		cc.Director:getInstance():getTextureCache():addImageAsync(slot6, function ()
			uv0.loading_spine = false

			uv1()
		end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)
	end
end

function RoleScene.updateHeroPos(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.role_list[getNorKey(slot1.srv_id, slot1.rid)] ~= nil and slot3.vo ~= nil then
		slot4, slot5 = slot3.vo:getNowPos()

		slot3:setWorldPos(cc.p(slot4, slot5))
		slot0.model:updateCamera(slot3:getWorldPos())
	end
end

function RoleScene.addRole(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.role_list[getNorKey(slot1.srv_id, slot1.rid)] ~= nil and slot3.vo ~= nil then
		slot3:doMove(nil, TileUtil.changeToPixsPoint(cc.p(slot1.x, slot1.y)))
	else
		table.insert(slot0.renderObjList, slot1)

		if RoleController:getInstance():getRoleVo() ~= nil and getNorKey(slot4.srv_id, slot4.rid) == slot2 then
			slot0:createPlayer(slot1, true, true)
		end
	end
end

function RoleScene.removeRole(slot0, slot1, slot2)
	if slot0.role_list[getNorKey(slot1, slot2)] ~= nil then
		slot0.role_list[slot3]:DeleteMe()

		slot0.role_list[slot3] = nil
	end

	slot0:removeObjInList(slot1, slot2)
end

function RoleScene.createPlayer(slot0, slot1, slot2, slot3)
	if slot0.scene_info == nil or slot0.model == nil then
		return
	end

	if slot0.role_list == nil then
		slot0.role_list = {}
	end

	slot4 = getNorKey(slot1.srv_id, slot1.rid)
	slot5 = RoleScenePlayer.New(slot2)

	slot5:setParentWnd(slot0.role_layer)
	slot5:setVo(slot1)

	if slot2 == true then
		slot0.hero = slot5
	end

	slot0.role_list[slot4] = slot5
	slot0.cur_visible_player = slot0.cur_visible_player + 1
end

function RoleScene.createNpc(slot0, slot1)
	if slot0.scene_info == nil or slot0.model == nil then
		return
	end

	if slot0.unit_list == nil then
		slot0.unit_list = {}
	end

	if slot0.unit_list[getNorKey(slot1.battle_id, slot1.id)] ~= nil then
		return
	end

	if slot1.layer == RoleScene.layer.back then
		RoleSceneNpc.New():setParentWnd(slot0.map_bLayer)
	else
		slot3:setParentWnd(slot0.role_layer)
	end

	slot3:setVo(slot1)

	slot0.unit_list[slot2] = slot3

	if slot0.unit_list_base == nil then
		slot0.unit_list_base = {}
	end

	slot0.unit_list_base[slot1.base_id] = slot3

	slot0:updateNpcRedStatus(slot3)
end

function RoleScene.removeObjInList(slot0, slot1, slot2)
	if slot0.renderObjList == nil or next(slot0.renderObjList) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot0.renderObjList) do
		if slot7.type == RoleSceneVo.unittype.role then
			if slot7.srv_id == slot1 and slot7.rid == slot2 then
				table.remove(slot0.renderObjList, slot6)

				break
			end
		elseif slot7.type == RoleSceneVo.unittype.unit and slot7.battle_id == slot1 and slot7.id == slot2 then
			table.remove(slot0.renderObjList, slot6)

			break
		end
	end
end

function RoleScene.syncRole(slot0, slot1, slot2, slot3)
	if slot0.role_list[getNorKey(slot1, slot2)] and slot5.vo then
		slot5:doMove(nil, slot3)
	end
end

function RoleScene.addEffect(slot0, slot1)
	if slot0.effect_list[getNorKey(slot1.base_id, slot1.x, slot1.y)] == nil then
		table.insert(slot0.render_effect_list, slot1)
	end
end

function RoleScene.addUnit(slot0, slot1)
	if slot0.unit_list[getNorKey(slot1.battle_id, slot1.id)] ~= nil then
		slot0.unit_list[slot2]:doMove(nil, TileUtil.changeToPixsPoint(cc.p(slot1.x, slot1.y)))
	else
		table.insert(slot0.renderObjList, slot1)
	end
end

function RoleScene.removeUnit(slot0, slot1, slot2)
	if slot0.unit_list[getNorKey(slot2, slot1)] then
		slot0.unit_list[slot3]:DeleteMe()

		slot0.unit_list[slot3] = nil
	end

	slot0:removeObjInList(slot2, slot1)
end

function RoleScene.removeEffect(slot0, slot1, slot2, slot3)
	if slot0.effect_list[getNorKey(slot1, slot2, slot3)] ~= nil then
		slot5:setVisible(false)
		slot5:runAction(cc.RemoveSelf:create(true))
		slot5:clearTracks()

		slot0.effect_list[slot4] = nil
	end

	for slot9, slot10 in ipairs(slot0.render_effect_list) do
		if slot10.base_id == slot1 and slot10.x == slot2 and slot10.y == slot3 then
			table.remove(slot0.render_effect_list, slot9)

			break
		end
	end
end

function RoleScene.setPos(slot0, slot1, slot2, slot3, slot4)
	if slot4 == true and slot0.init_x == nil then
		slot0.init_x = slot1
	end

	if slot0.init_x == nil then
		slot0.init_x = 0
	end

	if slot0.scene_x == slot1 and slot0.scene_y == slot2 then
		return
	end

	slot0.scene_x = slot1
	slot0.scene_y = slot2

	slot0.root_wnd:setPosition(cc.p(slot1, slot2))
	slot0.root_wnd:setPositionX(slot1)
	slot0.map_bLayer:setPositionX((slot1 - slot0.init_x) * slot0.bLayer_sp)
	slot0:updatePicTile(slot3)
end

function RoleScene.updatePicTile(slot0, slot1)
	if not slot0:isPicTileChange(slot1) then
		return
	end

	slot0:quequeAddFun()
end

function RoleScene.isPicTileChange(slot0, slot1)
	slot3 = math.floor(slot1.y / MapUtil.c_h)

	if math.floor(slot1.x / MapUtil.c_w) == slot0.nowPicTile.x and slot3 == slot0.nowPicTile.y then
		return false
	end

	slot0.nowPicTile = cc.p(slot2, slot3)

	return true
end

function RoleScene.getHero(slot0)
	return slot0.hero
end

function RoleScene.__delete(slot0)
	slot0:setScheduleUpdate(false)
	slot0:clearLayer()

	if slot0.update_red_info ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_red_info)

		slot0.update_red_info = nil
	end

	if slot0.root_wnd:getParent() then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end
end

function RoleScene.clearLayer(slot0, slot1)
	slot0.loadkey = {}
	slot0.isAddedAll = false
	slot0.finishRender = false
	slot0.step = 1
	slot2 = {
		[slot7.tex] = 1
	}

	for slot6, slot7 in pairs(slot0.mapPicCache) do
		if slot7.DeleteMe then
			slot7:DeleteMe()
		end
	end

	slot0.mapPicCache = {}
	slot0.mapResAsyncList = {}
	slot0.mapResCache = {}
	slot0.mapResCacheOrder = {}
	slot0.mapPicCache = {}
	slot0.mapTileList = {}

	slot0.pic_layer:removeAllChildren()
	slot0.map_bLayer:removeAllChildren()
	slot0.map_sLayer:removeAllChildren()
	slot0.role_layer:removeAllChildren()

	if slot2 and next(slot2) ~= nil then
		for slot6, slot7 in pairs(slot2) do
			cc.Director:getInstance():getTextureCache():removeTextureForKey(slot6)
		end
	end
end

function RoleScene.updateNpcRedStatus(slot0, slot1)
	if slot1 == nil or slot1.vo == nil then
		return
	end

	slot2 = false
	slot3 = MainSceneController:getInstance()

	if slot1.vo.base_id == 10114 then
		if slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_tech_gift) == false then
			slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_donate)
		end
	elseif slot1.vo.base_id == 10113 then
		slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_join)
	elseif slot1.vo.base_id == 10112 then
		slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_wish)
	elseif slot1.vo.base_id == 10111 then
		slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_war)
	elseif slot1.vo.base_id == 10110 then
		slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_boss)
	elseif slot1.vo.base_id == 10101 then
		if slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_member_red) == false then
			slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_lev_gift)
		end

		if slot2 == false then
			slot2 = slot3:getRedPointStatusByType(MainSceneCity.guild, RedPointType.guild_daily)
		end
	end

	if slot1.showRedPoint then
		slot1:showRedPoint(slot2)
	end
end

function RoleScene.updateNpcRedStatusByType(slot0, slot1)
	if slot1 == nil or slot0.unit_list_base == nil then
		return
	end

	slot2 = nil

	if slot1 == RedPointType.guild_tech_gift or slot1 == RedPointType.guild_donate then
		slot2 = slot0.unit_list_base[10114]
	elseif slot1 == RedPointType.guild_join then
		slot2 = slot0.unit_list_base[10113]
	elseif slot1 == RedPointType.guild_wish then
		slot2 = slot0.unit_list_base[10112]
	elseif slot1 == RedPointType.guild_war then
		slot2 = slot0.unit_list_base[10111]
	elseif slot1 == RedPointType.guild_boss then
		slot2 = slot0.unit_list_base[10110]
	elseif slot1 == RedPointType.guild_member_red or slot1 == RedPointType.guild_lev_gift or slot1 == RedPointType.guild_daily then
		slot2 = slot0.unit_list_base[10101]
	end

	if slot2 ~= nil then
		slot0:updateNpcRedStatus(slot2)
	end
end
