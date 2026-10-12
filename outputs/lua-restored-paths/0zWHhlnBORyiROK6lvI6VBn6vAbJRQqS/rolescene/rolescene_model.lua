RolesceneModel = RolesceneModel or BaseClass()

function RolesceneModel.__init(slot0, slot1)
	slot0.ctrl = slot1

	slot0:config()
	slot0:registerEvent()
end

function RolesceneModel.config(slot0)
	slot0.unitRange = 100
	slot0.pointRange = 40
	slot0.role_list = {}
	slot0.unit_list = {}
	slot0.effect_list = {}
	slot0.astar = Astar:getInstance()
	slot0.scene_info = nil
	slot0.path = nil
	slot0.isWalking = false
	slot0.curPos = nil
	slot0.startPoint = nil
	slot0.endPoint = nil
	slot0.hide_scene_role = false
end

function RolesceneModel.registerEvent(slot0)
	if slot0.move_next_event == nil then
		slot0.move_next_event = GlobalEvent:getInstance():Bind(SceneEvent.SCENE_WALKNEXT, function (slot0)
			if uv0.scene then
				uv0.scene:walkNext(slot0)
			end
		end)
	end

	if slot0.role_walk_end_event == nil then
		slot0.role_walk_end_event = GlobalEvent:getInstance():Bind(SceneEvent.SCENE_WALKEND, function (slot0)
			if uv0.scene then
				uv0.astar:reset()
			end

			if uv0.find_vo ~= nil then
				uv0:clickSceneUnit(uv0.find_vo)

				uv0.find_vo = nil
			end
		end)
	end

	if slot0.walk_to_target_end == nil then
		slot0.walk_to_target_end = GlobalEvent:getInstance():Bind(RolesceneEvent.SCENE_WALKEND, function (slot0)
			if uv0.scene then
				uv0.astar:reset()
			end

			if slot0 == nil then
				return
			end

			if slot0.type == RoleSceneVo.unittype.role then
				uv0:clickSceneRole(uv0.find_vo)
			elseif slot0.type == RoleSceneVo.unittype.unit then
				uv0:clickSceneUnit(uv0.find_vo)
			end

			if uv0.find_vo ~= nil then
				uv0.find_vo = nil
			end
		end)
	end

	if slot0.player_click_event == nil then
		slot0.player_click_event = GlobalEvent:getInstance():Bind(SceneEvent.SCENE_PLAYER_CLICK, function (slot0)
			if uv0.scene == nil then
				return
			end

			if slot0 == nil then
				return
			end

			uv0.scene:cancelWalk()

			slot1 = {
				type = RoleSceneVo.unittype.role,
				srv_id = slot0.srv_id,
				rid = slot0.rid,
				name = slot0.name,
				sceneId = uv0.scene_info.bid,
				pos = cc.p(slot0.x, slot0.y)
			}
			uv0.find_vo = slot1

			uv0.scene:gotoTarget(slot1, true)
		end)
	end

	if slot0.unit_click_event == nil then
		slot0.unit_click_event = GlobalEvent:getInstance():Bind(SceneEvent.SCENE_UNIT_CLICK, function (slot0)
			if uv0.scene == nil then
				return
			end

			if slot0 == nil then
				return
			end

			uv0.scene:cancelWalk()

			slot1 = {
				type = RoleSceneVo.unittype.unit,
				battle_id = slot0.battle_id,
				id = slot0.id,
				base_id = slot0.base_id,
				sceneId = uv0.scene_info.bid,
				sub_type = slot0.sub_type,
				pos = cc.p(slot0.x, slot0.y)
			}
			uv0.find_vo = slot1

			uv0.scene:gotoTarget(slot1, true)
		end)
	end
end

function RolesceneModel.clearFindVo(slot0)
	slot0.find_vo = nil
end

function RolesceneModel.handleSceneHead(slot0, slot1)
	if slot0.sceneHead ~= nil then
		slot0.sceneHead:setVisible(slot1)
	end
end

function RolesceneModel.setVisibleHideRole(slot0, slot1)
	if slot0.scene == nil then
		return
	end

	if slot0.hide_container and not tolua.isnull(slot0.hide_container) then
		slot0.hide_container:setVisible(slot1)
	end
end

function RolesceneModel.createHideRole(slot0)
	slot2 = ViewManager:getInstance():getBaseLayout()

	if slot0.hide_container == nil then
		slot0.hide_container = createCSBNote(PathTool.getTargetCSB("mainui/rolescene_hide"))

		slot0.hide_container:setAnchorPoint(cc.p(1, 0.5))
		slot0.hide_container:setPosition(display.getRight(slot2), display.getBottom(slot2) + 140)
		ViewManager:getInstance():getLayerByTag(ViewMgrTag.UI_TAG):addChild(slot0.hide_container)

		slot0.hide_container.backpack = slot0.hide_container:getChildByName("backpack")

		slot0.hide_container.backpack:addClickEventListener(function (slot0)
			slot1 = uv0.hide_container.check_box:isSelected()

			uv0.hide_container.check_box:setSelected(not slot1)
			uv0:handleHideOtherRole(not slot1)
		end)

		slot0.hide_container.check_box = slot0.hide_container:getChildByName("check_box")

		slot0.hide_container.check_box:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:handleHideOtherRole(slot0:isSelected())
			end
		end)
		slot0.hide_container:getChildByName("check_label"):setString(slot0.ctrl:getString("rolescene_hide_label"))
	end
end

function RolesceneModel.handleHideOtherRole(slot0, slot1)
	slot0.hide_scene_role = slot1

	if slot0.scene ~= nil and slot0.role_list then
		for slot5, slot6 in pairs(slot0.role_list) do
			if slot6.setRoleAttribute then
				slot6:setRoleAttribute("hide_self", slot1)
			end
		end
	end
end

function RolesceneModel.createSceneHead(slot0)
	if slot0.sceneHead == nil then
		slot0.sceneHead = PlayerHead.new(PlayerHead.type.circle)

		ViewManager:getInstance():getLayerByTag(ViewMgrTag.UI_TAG):addChild(slot0.sceneHead)
		slot0.sceneHead:setPosition(cc.p(SCREEN_WIDTH - 290 - slot0.sceneHead:getContentSize().width / 2, 510))
		slot0.sceneHead:addCallBack(function ()
			if uv0.sceneHead.scene_vo ~= nil then
				uv0:handleSceneHead(false)
				FriendController:getInstance():openFriendCheckPanel(true, 1, uv0.sceneHead.scene_vo, "world", uv0.sceneHead.scene_vo.status)
			end
		end)
	end
end

function RolesceneModel.clickSceneUnit(slot0, slot1)
	if slot1 == nil then
		return
	end

	if Config.UnitData.data_unit(slot1.base_id) ~= nil and slot0.unit_list[getNorKey(slot1.battle_id, slot1.id)] ~= nil then
		GlobalEvent:getInstance():Fire(SceneEvent.SCENE_NEAR_NPC, {
			slot1.id,
			slot1.battle_id,
			slot1.base_id
		})
	end
end

function RolesceneModel.clickSceneRole(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.ctrl:getIsInChiefWar() then
		ChiefwarController:getInstance():sender22306(slot1.rid or 0, slot1.srv_id or "")
	end
end

function RolesceneModel.__delete(slot0)
	slot0:clear()

	if slot0.scene then
		slot0.scene:DeleteMe()

		slot0.scene = nil
	end

	if slot0.sceneHead ~= nil then
		slot0.sceneHead:DeleteMe()

		slot0.sceneHead = nil
	end

	if slot0.hide_container then
		slot0.hide_container:removeFromParent()

		slot0.hide_container = nil
	end

	slot0.scene_data = nil
	slot0.scene_info = nil

	GlobalEvent:getInstance():Fire(NpcEvent.CloseNpcTalkViewEvent)
	GlobalEvent:getInstance():Fire(RolesceneEvent.SCENE_CHANGE)
	ChiefwarController:getInstance():openChiefView(false)
	DiamondwarController:getInstance():openDiamondWarReadyView(false)
end

function RolesceneModel.clearRole(slot0)
	if slot0.scene == nil then
		return
	end

	if slot0.role_list then
		for slot4, slot5 in pairs(slot0.role_list) do
			slot0.scene:removeRole(slot5.srv_id, slot5.rid)
			slot5:DeleteMe()
		end
	end

	slot0.role_list = {}
end

function RolesceneModel.clearEffect(slot0)
	if slot0.scene == nil then
		return
	end

	if slot0.effect_list then
		for slot4, slot5 in pairs(slot0.effect_list) do
			slot0.scene:removeEffect(slot5.base_id, slot5.x, slot5.y)
		end
	end

	slot0.effect_list = {}
end

function RolesceneModel.clearUnit(slot0)
	type = type or 0

	if slot0.scene == nil then
		return
	end

	if slot0.unit_list ~= nil then
		for slot4, slot5 in pairs(slot0.unit_list) do
			slot0.scene:removeUnit(slot5.id, slot5.battle_id)
			slot5:DeleteMe()
		end
	end

	slot0.unit_list = {}
end

function RolesceneModel.clear(slot0)
	if slot0.scene then
		if slot0.role_list ~= nil then
			for slot4, slot5 in pairs(slot0.role_list) do
				slot0.scene:removeRole(slot5.srv_id, slot5.rid)
				slot5:DeleteMe()
			end
		end

		if slot0.unit_list ~= nil then
			for slot4, slot5 in pairs(slot0.unit_list) do
				slot0.scene:removeUnit(slot5.id, slot5.battle_id)
				slot5:DeleteMe()
			end
		end

		if slot0.effect_list ~= nil then
			for slot4, slot5 in pairs(slot0.effect_list) do
				slot0.scene:removeEffect(slot5.base_id, slot5.x, slot5.y)
			end
		end
	end

	slot0.effect_list = {}
	slot0.role_list = {}
	slot0.unit_list = {}
end

function RolesceneModel.getSceneId(slot0)
	if slot0.scene_info ~= nil then
		return slot0.scene_info.bid
	end

	return 0
end

function RolesceneModel.changeScene(slot0, slot1)
	slot0:clearRole()

	if slot0.scene_data ~= nil and slot0.scene_data.bid == slot1.bid and slot0.scene ~= nil then
		return
	end

	slot0:clearEffect()
	slot0:clearUnit()

	slot0.scene_data = slot1

	slot0:sceneStart()
	GlobalEvent:getInstance():Fire(RolesceneEvent.SCENE_CHANGE, slot0.scene_data)
end

function RolesceneModel.sceneStart(slot0)
	if slot0.scene_data == nil then
		slot0.ctrl:exitRoleScene(true)
	else
		slot0.scene_info = Config.Map[slot0.scene_data.bid]

		if slot0.scene_info == nil then
			print("enter role scene error by id", slot0.scene_data.bid)
			slot0.ctrl:exitRoleScene(true)

			return
		end

		TileUtil.tileWidth = slot0.scene_info.tile_w or TileUtil.tileWidth
		TileUtil.tileHeight = slot0.scene_info.tile_h or TileUtil.tileHeight

		if slot0.scene == nil then
			slot0.scene = RoleScene.New(slot0.ctrl)
		end

		slot0.scene:createScene(slot0.scene_data.x, slot0.scene_data.y)

		slot0.map_block = Config.MapBlock.get(slot0.scene_data.bid)

		slot0.astar:clear()
		slot0.astar:setBlock(slot0.map_block)
		slot0:createCliUnit()
		slot0:handleScene(not BattleController:getInstance():isInFight())
	end
end

function RolesceneModel.getSceneInfo(slot0)
	return slot0.scene_info
end

function RolesceneModel.getSceneData(slot0)
	return slot0.scene_data
end

function RolesceneModel.createCliUnit(slot0)
	if slot0.scene_info == nil or next(slot0.scene_info.unit_list) == nil then
		return
	end

	for slot4, slot5 in pairs(slot0.scene_info.unit_list) do
		if Config.UnitData.data_unit(slot5[1]).cli_create == 1 then
			slot0:addUnit({
				battle_id = 1,
				id = slot5[4],
				base_id = slot5[1],
				name = slot6.name,
				x = slot5[2],
				y = slot5[3],
				layer = slot5[5],
				looks = {}
			})
		end
	end

	for slot4, slot5 in pairs(slot0.scene_info.eff_list) do
		if Config.UnitData.data_unit(slot5[1]).cli_create == 1 then
			slot0:addEffect({
				base_id = slot5[1],
				x = slot5[2],
				y = slot5[3],
				layer = slot5[4]
			})
		end
	end
end

function RolesceneModel.updateRoleLooks(slot0, slot1)
	if slot0.scene == nil then
		return
	end

	if slot0.role_list[getNorKey(slot1.srv_id, slot1.rid)] == nil then
		return
	end

	slot3:setLooks(slot1.looks, type == 0)
end

function RolesceneModel.addRole(slot0, slot1)
	if not slot0.scene then
		return
	end

	if slot0.role_list[getNorKey(slot1.srv_id, slot1.rid)] ~= nil then
		slot3:initAttributeData(slot1)

		return
	end

	slot3 = RoleSceneVo.New()
	slot3.type = RoleSceneVo.unittype.role

	slot3:initAttributeData(slot1)

	slot3.name = transformNameByServ(slot1.name, slot1.srv_id)
	slot3.body_res = slot3:getBodyRes()

	if slot0.ctrl:getIsInChiefWar() == true and Config.ChiefWarData.data_chief_const.born_look and slot4.val then
		slot3.body_res = slot4.val or ""
	end

	slot3.hide_self = slot0.hide_scene_role
	slot0.role_list[slot2] = slot3

	slot0.scene:addRole(slot3)

	if RoleController:getInstance():getRoleVo() ~= nil and getNorKey(slot4.srv_id, slot4.rid) == slot2 then
		slot0:updateCamera(cc.p(slot1.x, slot1.y), true)
	end
end

function RolesceneModel.removeRole(slot0, slot1, slot2)
	if slot0.role_list[getNorKey(slot1, slot2)] == nil or slot0.scene == nil then
		return
	end

	slot0.scene:removeRole(slot1, slot2)

	slot0.role_list[slot3] = nil
end

function RolesceneModel.updateHeroPos(slot0, slot1)
	if not slot0.scene then
		return
	end

	if slot0.role_list[getNorKey(slot1.srv_id, slot1.rid)] ~= nil then
		slot3:initAttributeData({
			x = slot1.dx,
			y = slot1.dy
		})
	end

	slot0.scene:updateHeroPos(slot1)
end

function RolesceneModel.addEffect(slot0, slot1)
	if slot0.scene == nil or slot1 == nil then
		return
	end

	if Config.UnitData.data_unit(slot1.base_id) == nil then
		return
	end

	if slot0.effect_list[getNorKey(slot1.base_id, slot1.x, slot1.y)] == nil then
		slot4 = slot1

		slot0.scene:addEffect(slot4)

		slot0.effect_list[slot3] = slot4
	end
end

function RolesceneModel.addUnit(slot0, slot1)
	if slot0.scene == nil or slot1 == nil then
		return
	end

	if Config.UnitData.data_unit(slot1.base_id) == nil then
		return
	end

	if slot0.unit_list[getNorKey(slot1.battle_id, slot1.id)] ~= nil then
		slot4:initAttributeData(slot1)
	else
		slot4 = RoleSceneVo.New()
		slot4.type = RoleSceneVo.unittype.unit
		slot4.scene_id = slot0:getSceneId()

		slot4:initAttributeData(slot1)

		slot4.sub_type = slot2.sub_type or RoleSceneVo.sub_unittype.npc
		slot4.body_res = slot4:getBodyRes()
		slot4.unit_type = slot2.type or 0
		slot0.unit_list[slot3] = slot4

		slot0.scene:addUnit(slot4)
	end
end

function RolesceneModel.removeUnit(slot0, slot1, slot2)
	if not slot0.scene then
		return
	end

	if slot0.unit_list[getNorKey(slot2 or 1, slot1)] ~= nil and slot0:getSceneId() == slot4.scene_id then
		slot0.scene:removeUnit(slot1, slot2)
	end

	slot0.unit_list[slot3] = nil
end

function RolesceneModel.getRole(slot0, slot1, slot2)
	return slot0.role_list[getNorKey(slot1, slot2)]
end

function RolesceneModel.getUnit(slot0, slot1, slot2)
	return slot0.unit_list[getNorKey(slot2 or 1, slot1)]
end

function RolesceneModel.isMainRoleVo(slot0, slot1)
	if RoleController:getInstance():getRoleVo() ~= nil and getNorKey(slot2.srv_id, slot2.rid) == slot1 then
		return true
	end

	return false
end

function RolesceneModel.syncRoles(slot0, slot1)
	if not slot0.scene then
		return
	end

	if slot0.role_list[getNorKey(slot1.srv_id, slot1.rid)] == nil then
		return
	end

	if RoleController:getInstance():getRoleVo() == nil then
		return
	end

	if slot2 == getNorKey(slot4.srv_id, slot4.rid) then
		return
	end

	slot0.scene:syncRole(slot3.srv_id, slot3.rid, cc.p(slot1.dx, slot1.dy))
end

function RolesceneModel.findPath(slot0, slot1, slot2)
	if slot0.map_block == nil or #slot0.map_block == 0 then
		print("没有地图网络数据")

		return
	end

	if slot0.astar:find(slot1 or slot0.startPoint, slot2 or slot0.endPoint) then
		slot0:setStartPoint(slot1)
		slot0:setEndPoint(slot2)

		slot0.path = slot0.astar:floyd()

		table.remove(slot0.path)

		slot0.isWalking = true
	end

	return nil
end

function RolesceneModel.setStartPoint(slot0, slot1)
	slot0.startPoint = slot1
end

function RolesceneModel.setEndPoint(slot0, slot1)
	slot0.endPoint = slot1
end

function RolesceneModel.moveCamera(slot0)
	if slot0.scene == nil then
		return
	end
end

function RolesceneModel.updateCamera(slot0, slot1, slot2)
	if slot0.scene == nil then
		return
	end

	slot3, slot4, slot5 = slot0:getCameraPos(slot1)

	slot0.scene:setPos(slot3, slot4, slot5, slot2)
end

function RolesceneModel.getCameraPos(slot0, slot1)
	if slot0.scene == nil or slot0.scene_info == nil then
		return
	end

	slot2 = ViewManager:getInstance():getBaseLayout()
	slot5 = (display.getRight(slot2) - display.getLeft(slot2)) * 0.5
	slot6 = (display.getTop(slot2) - display.getBottom(slot2)) * 0.5

	if slot1 == nil and slot0.scene:getHero() then
		slot1 = slot0.scene:getHero():getWorldPos()
	end

	slot7 = 0
	slot8 = 0

	return slot1.x <= slot5 and 0 or slot1.x >= slot0.scene_info.width - slot5 and slot3 - slot0.scene_info.width or slot5 - slot1.x, slot1.y <= slot6 and 0 or slot1.y >= slot0.scene_info.height - slot6 and slot4 - slot0.scene_info.height or slot6 - slot1.y, slot1
end

function RolesceneModel.getScene(slot0)
	return slot0.scene
end

function RolesceneModel.handleScene(slot0, slot1)
	if slot0.scene then
		slot0.scene:setVisible(slot1)
		slot0:setVisibleHideRole(slot1)
		slot0:handleSceneHead(slot1)
	end
end
