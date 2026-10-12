SceneObj = SceneObj or BaseClass()

function SceneObj.__init(slot0)
	slot0.parent_wnd = nil
	slot0.is_init = false
	slot0.visible_status = true
	slot0.node = ccui.Widget:create()

	slot0.node:setAnchorPoint(0.5, 0)
	slot0.node:setCascadeOpacityEnabled(true)

	if GM_UI_DEBUG then
		slot0.node.vo = slot0
	end

	slot0.boxHeight = 170
	slot0.boxWidth = 64
	slot0.topOffY = 0
	slot0.mechine_speed = 1.5
	slot0.main_container = ccui.Widget:create()

	slot0.main_container:setAnchorPoint(0.5, 0)
	slot0.main_container:setCascadeOpacityEnabled(true)
	slot0.node:addChild(slot0.main_container)

	slot0.spineContainer = ccui.Widget:create()

	slot0.spineContainer:setAnchorPoint(0.5, 0)
	slot0.spineContainer:setCascadeOpacityEnabled(true)
	slot0.main_container:addChild(slot0.spineContainer)

	slot0.container = ccui.Layout:create()

	slot0.container:setAnchorPoint(0.5, 0)
	slot0.container:setCascadeOpacityEnabled(true)
	slot0.main_container:addChild(slot0.container)

	slot0.topContainer = ccui.Layout:create()

	slot0.topContainer:setAnchorPoint(cc.p(0.5, 0))
	slot0.topContainer:setPosition(0, slot0.boxHeight)
	slot0.main_container:addChild(slot0.topContainer)

	slot0.bottom = ccui.Widget:create()

	slot0.bottom:setAnchorPoint(0.5, 1)
	slot0.bottom:setPosition(cc.p(0, -10))
	slot0.bottom:setCascadeOpacityEnabled(true)
	slot0.node:addChild(slot0.bottom, -2)

	slot0.name_ttf = createWithSystemFont("", DEFAULT_FONT, 20)

	slot0.name_ttf:setColor(Config.ColorData.data_color3[1])
	slot0.name_ttf:enableOutline(Config.ColorData.data_color3[2], 1)
	slot0.name_ttf:setAnchorPoint(0.5, 1)
	slot0.topContainer:addChild(slot0.name_ttf)

	slot0.isRun = false
	slot0.alphaState = false
	slot0.vo = nil
	slot0.dir = 5
	slot0.last_dir = 0
	slot0.is_funing = false
	slot0.base_action_name = nil
	slot0.body = nil
	slot0.body_action_name = nil
	slot0.body_spine_name = nil
	slot0.weapon_extend = nil
	slot0.weapon = nil
	slot0.weapon_action_name = nil
	slot0.weapon_spine_name = nil
	slot0.ride_extend = nil
	slot0.ride = nil
	slot0.ride_action_name = nil
	slot0.ride_spine_name = nil
end

function SceneObj.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.node) then
		slot0.node:setVisible(slot1)

		slot0.visible_status = slot1
	end
end

function SceneObj.isVisible(slot0)
	return slot0.visible_status
end

function SceneObj.initSpine(slot0)
	if slot0.is_init == true then
		return
	end

	slot0.is_init = true

	if slot0.vo and slot0.vo.id ~= 10009 then
		slot0.shadow = createSprite(PathTool.getResFrame("common", "common_30009"), 0, 0, slot0.spineContainer, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, -99)
	end

	if slot0.vo ~= nil and slot0.vo.body_res ~= nil then
		slot0:playActionOnce(PlayerAction.battle_stand, slot0.vo.body_res)
	end

	if slot0.vo ~= nil then
		if slot0.vo.dir == 6 or slot0.vo.dir == 7 or slot0.vo.dir == 8 then
			slot0.spineContainer:setScaleX(-1)
		else
			slot0.spineContainer:setScaleX(1)
		end
	end
end

function SceneObj.setParentWnd(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	slot0.parent_wnd = slot1

	slot0.parent_wnd:addChild(slot0.node)
end

function SceneObj.setAlpha(slot0, slot1, slot2)
	if slot0.is_init == false then
		return
	end

	if slot2 then
		if slot1 then
			slot0.spineContainer:setOpacity(128)
		else
			slot0.spineContainer:setOpacity(255)
		end

		return
	end

	if slot0.alphaState == slot1 then
		return
	end

	slot0.alphaState = slot1

	if slot1 then
		slot0.spineContainer:setOpacity(128)
	else
		slot0.spineContainer:setOpacity(255)
	end
end

function SceneObj.setVo(slot0, slot1)
	slot0.vo = slot1
	slot0.dir = slot0.vo.dir

	if slot0.name_ttf then
		slot2 = slot0.vo.name

		if slot1.camp then
			slot2 = GodbattleController:getInstance():convertName(slot1)
		elseif slot1.srv_id then
			slot2 = transformNameByServ(slot0.vo.name, slot1.srv_id)
		end

		slot0.name_ttf:setString(slot2)

		if slot1.name_color then
			slot0.name_ttf:setColor(slot1.name_color)
		end

		if slot1.name_bg and slot0.name_bg == nil then
			slot0.name_bg = createSprite(slot1.name_bg, 0, 0, slot0.topContainer, cc.p(0.5, 1), LOADTEXT_TYPE_PLIST, -1)
		end
	end

	slot0:setWorldPos(cc.p(slot0.vo.x, slot0.vo.y))
end

function SceneObj.getVo(slot0)
	return slot0.vo
end

function SceneObj.setZOrder(slot0, slot1)
	slot0.node:setLocalZOrder(slot1)
end

function SceneObj.getZOrder(slot0)
	return slot0.node:getLocalZOrder()
end

function SceneObj.setWorldPos(slot0, slot1)
	if slot0.world_pos and slot0.world_pos.x == slot1.x and slot0.world_pos.y == slot1.y then
		return
	end

	slot0.world_pos = cc.p(slot1.x, slot1.y)

	slot0.node:setPosition(slot0.world_pos)

	slot0.logic_pos = TileUtil.changeToTilePoint(slot0.world_pos)

	if slot0.vo ~= nil then
		slot0.vo.x = slot1.x
		slot0.vo.y = slot1.y
	end

	if slot0.is_hero then
		slot0:setZOrder(720 - slot1.y + 10)
	else
		slot0:setZOrder(720 - slot1.y)
	end
end

function SceneObj.getWorldPos(slot0)
	return slot0.world_pos
end

function SceneObj.setLogicPos(slot0, slot1)
	if slot0.logic_pos and slot0.logic_pos.x == slot1.x and slot0.logic_pos.y == slot1.y then
		return
	end

	slot0.logic_pos = slot1

	slot0:setWorldPos(TileUtil.changeToPixsPoint(slot1))
end

function SceneObj.getLogicPos(slot0)
	return slot0.logic_pos
end

function SceneObj.stopAllActions(slot0)
	doStopAllActions(slot0.node)
end

function SceneObj.registEvent(slot0)
end

function SceneObj.update(slot0, slot1)
end

function SceneObj.setDir(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot0.last_dir = slot0.dir

	if slot2 == nil and slot0.dir == slot1 then
		return
	end

	slot0.dir = slot1

	if slot0.vo ~= nil then
		slot0.vo.dir = slot1
	end

	if slot0.is_init == true then
		if slot1 == 6 or slot1 == 7 or slot1 == 8 then
			slot0.spineContainer:setScaleX(-1)
		else
			slot0.spineContainer:setScaleX(1)
		end
	end
end

function SceneObj.freeMove(slot0, slot1)
	if slot0.world_pos.x == slot1.x and slot2.y == slot1.y then
		return
	end

	slot0.move_speed = slot0.move_speed / FPS_RATE
	slot0.move_pass_distance = 0
	slot0.move_total_distance = 0
	slot0.move_start_pos = slot2
	slot0.move_end_pos = slot1
	slot0.dir_number, slot0.move_total_distance, slot0.move_dir = slot0:computeMoveInfo(slot1)
	slot0.isNeedRun = true

	if slot0.dir_number ~= slot0.dir then
		slot0:setDir(slot0.dir_number)
	end

	slot0:doRun()
end

function SceneObj.doRun(slot0)
	if slot0.is_init == false then
		return
	end

	if slot0.isRun and slot0.last_dir == slot0.dir then
		return
	end

	slot0.isRun = true

	slot0:playActionOnce(PlayerAction.run)
end

function SceneObj.doStand(slot0)
	if slot0.is_init == false then
		return
	end

	if slot0.vo == nil then
		return
	end

	if not slot0.isRun then
		return
	end

	slot0.isRun = false

	slot0:playActionOnce(PlayerAction.battle_stand)
end

function SceneObj.reload(slot0)
	slot0:playActionOnce(slot0.base_action_name, slot0.vo.body_res)
end

function SceneObj.playActionOnce(slot0, slot1, slot2)
	if slot0.vo == nil or slot0.is_init == false then
		return
	end

	slot1 = slot1 or PlayerAction.battle_stand
	slot0.base_action_name = slot1

	slot0:_createSpineByName(slot1, slot2 or slot0.body_spine_name)
end

function SceneObj.playActionOnceTime(slot0, slot1, slot2)
	slot3 = slot0.base_action_name

	slot0:playActionOnce(slot1)

	if slot2 == false then
		if slot0.body ~= nil then
			slot0.body:registerSpineEventHandler(function (slot0)
				if slot0.animation == uv0 then
					uv1:playActionOnce(uv2)
				end
			end, sp.EventType.ANIMATION_COMPLETE)
		end
	end
end

function SceneObj._createSpineByName(slot0, slot1, slot2)
	slot3 = nil

	if slot0.body_spine_name == nil or slot0.body_spine_name ~= slot2 then
		slot3 = true
	elseif slot0.body_action_name == nil or slot0.body_action_name ~= slot1 then
		slot3 = true
	end

	if slot3 then
		slot0:createBody(slot2, slot1)
	end
end

function SceneObj.createBody(slot0, slot1, slot2)
	slot0:removeBody()

	slot0.body_spine_name = slot1
	slot0.body_action_name = slot2
	slot0.body = slot0:createArmature(slot0.body_spine_name, slot0.body_action_name)

	if not tolua.isnull(slot0.body) then
		slot0.spineContainer:addChild(slot0.body)
	end

	if not slot0.changeBodyRes then
		slot0.changeBodyRes = true
	end

	if not tolua.isnull(slot0.body) then
		slot0.body:setAnimation(0, slot0.body_action_name, true)
		slot0.body:setToSetupPose()
	end
end

function SceneObj.removeBody(slot0)
	if slot0.body ~= nil then
		slot0.body:setVisible(false)
		slot0.body:clearTracks()
		slot0.body:removeFromParent()
	end

	slot0.body = nil
	slot0.body_action_name = nil
	slot0.body_spine_name = nil
end

function SceneObj.createArmature(slot0, slot1, slot2)
	slot3 = createSpineByName(slot1, slot2)

	slot3:setAnchorPoint(cc.p(0.5, 0))

	return slot3
end

function SceneObj.updateNamePos(slot0)
	if slot0.changeBodyRes == true then
		if not tolua.isnull(slot0.body) then
			slot0.body:update(0)

			slot0.boxWidth = slot0.body:getBoundingBox().width < 0 and 64 or slot0.body:getBoundingBox().width
			slot0.boxHeight = slot0.body:getBoundingBox().height < 0 and 170 or slot0.body:getBoundingBox().height
		end

		slot0.node:setContentSize(slot0.boxWidth, slot0.boxHeight)
		slot0.main_container:setContentSize(slot0.boxWidth, slot0.boxHeight)
		slot0.main_container:setPosition(math.ceil(slot0.boxWidth / 2), 0)
		slot0.spineContainer:setPosition(math.ceil(slot0.boxWidth / 2), 0)
		slot0.bottom:setPositionX(math.ceil(slot0.boxWidth / 2))
		slot0.topContainer:setPosition(math.ceil(slot0.boxWidth / 2), math.ceil(slot0.boxHeight + slot0.topOffY + 10))
		slot0.container:setContentSize(cc.size(slot0.boxWidth, slot0.boxHeight))
		slot0.container:setPosition(math.ceil(slot0.boxWidth / 2), 0)

		slot0.changeBodyRes = false
	end
end

function SceneObj.setModelScale(slot0, slot1)
	if slot0.main_container and not tolua.isnull(slot0.main_container) then
		slot0.main_container:setScale(slot1)
	end
end

function SceneObj.updateEffectPos(slot0, ...)
	if slot0.topContainer then
		slot1 = 30

		if not tolua.isnull(slot0.buffEffect) then
			slot0.buffEffect:setPosition(0, slot1)

			slot1 = slot1 + slot0.buffEffect:getBoundingBox().height
		end

		if not tolua.isnull(slot0.fightEffect) then
			slot0.fightEffect:setPosition(0, slot1)

			slot1 = slot1 + slot0.fightEffect:getBoundingBox().height
		end

		if not tolua.isnull(slot0.own_mark_effect) then
			slot0.own_mark_effect:setPosition(0, slot1 + 20)

			slot1 = slot1 + slot0.own_mark_effect:getBoundingBox().height
		end
	end
end

function SceneObj.createSomeEffect(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if not tolua.isnull(slot2) then
			slot2:removeFromParent()

			slot2 = nil

			return nil, true
		end
	elseif slot3 and slot2 == nil then
		slot2 = createSpineByName(slot4)

		slot2:setAnimation(0, PlayerAction.action, true)
		slot3:addChild(slot2)

		return slot2, true
	end

	return slot2, false
end

function SceneObj.__delete(slot0)
	slot0:removeBody()

	if not tolua.isnull(slot0.node) then
		slot0.node:removeAllChildren()
		slot0.node:removeFromParent()
	end

	slot0.is_init = false
	slot0.node = nil
	slot0.vo = nil
	slot0.isRun = false
	slot0.world_pos = nil
	slot0.move_speed = nil
	slot0.mechine_speed = nil
	slot0.move_pass_distance = nil
	slot0.move_total_distance = nil
	slot0.move_start_pos = nil
	slot0.move_end_pos = nil
	slot0.dir = nil
	slot0.move_dir = nil
	slot0.isNeedRun = nil
	slot0.boxHeight = nil
	slot0.container = nil
	slot0.boxWidth = nil
	slot0.isRuning = nil
	slot0.had_ride = nil
	slot0.base_action_name = nil
end
