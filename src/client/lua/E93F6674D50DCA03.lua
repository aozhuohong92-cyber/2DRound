RoleSceneObj = RoleSceneObj or BaseClass()

function RoleSceneObj.__init(slot0)
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
	slot0.mechine_speed = 2.96
	slot0.main_container = ccui.Widget:create()

	slot0.main_container:setAnchorPoint(0.5, 0)
	slot0.main_container:setCascadeOpacityEnabled(true)
	slot0.node:addChild(slot0.main_container)

	slot0.effect_container = ccui.Widget:create()

	slot0.effect_container:setAnchorPoint(0.5, 0)
	slot0.effect_container:setCascadeOpacityEnabled(true)
	slot0.node:addChild(slot0.effect_container, -1)

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
	slot0.node:addChild(slot0.bottom, 2)

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

function RoleSceneObj.createNameContainer(slot0)
	if slot0.vo == nil then
		return
	end

	if slot0.vo.type == RoleSceneVo.unittype.role then
		if slot0.name_ttf == nil then
			slot0.name_ttf = createWithSystemFont("", DEFAULT_FONT, 20)

			slot0.name_ttf:setColor(Config.ColorData.data_color3[1])
			slot0.name_ttf:enableOutline(Config.ColorData.data_color3[2], 1)
			slot0.name_ttf:setAnchorPoint(0.5, 1)
			slot0.bottom:addChild(slot0.name_ttf)
		end
	elseif slot0.name_container == nil then
		slot0.name_container = createImage(slot0.bottom, PathTool.getActionRes("action_name_label"), 0, 0, cc.p(0.5, 1), false, 1, true)
		slot0.name_ttf = createWithSystemFont("", DEFAULT_FONT, 20)

		slot0.name_ttf:setColor(Config.ColorData.data_color3[1])
		slot0.name_ttf:enableOutline(Config.ColorData.data_color3[2], 1)
		slot0.name_ttf:setAnchorPoint(0.5, 0.5)
		slot0.name_ttf:setPositionY(21)
		slot0.name_container:addChild(slot0.name_ttf)
	end
end

function RoleSceneObj.setVisible(slot0, slot1)
	if not tolua.isnull(slot0.node) then
		slot0.node:setVisible(slot1)

		slot0.visible_status = slot1
	end
end

function RoleSceneObj.isVisible(slot0)
	return slot0.visible_status
end

function RoleSceneObj.initSpine(slot0)
	if slot0.is_init == true then
		return
	end

	slot0.is_init = true

	if slot0.vo and slot0.vo.sub_type ~= RoleSceneVo.sub_unittype.ele then
		slot0.shadow = createSprite(PathTool.getResFrame("common2", "common_shadow"), 0, 0, slot0.spineContainer, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, -99)
	end

	if slot0.vo ~= nil and slot0.vo.body_res ~= nil then
		if slot0.vo.type == RoleSceneVo.unittype.role then
			slot0:playActionOnce(PlayerAction.battle_stand, slot0.vo.body_res)
		elseif slot0.vo.type == RoleSceneVo.unittype.unit then
			if slot0.vo.sub_type == RoleSceneVo.sub_unittype.ele then
				slot0:playActionOnce(PlayerAction.action, slot0.vo.body_res)
			else
				slot0:playActionOnce(PlayerAction.battle_stand, slot0.vo.body_res)
			end
		end
	end

	if slot0.vo ~= nil then
		if slot0.vo.dir == 6 or slot0.vo.dir == 7 or slot0.vo.dir == 8 then
			slot0.spineContainer:setScaleX(-1)
		else
			slot0.spineContainer:setScaleX(1)
		end

		if RolesceneController:getInstance():getIsInChiefWar() and slot0.vo.type == RoleSceneVo.unittype.unit then
			if math.ceil(math.random(0, 1)) == 1 then
				slot0.spineContainer:setScaleX(1)
			else
				slot0.spineContainer:setScaleX(-1)
			end
		end
	end
end

function RoleSceneObj.setParentWnd(slot0, slot1)
	if tolua.isnull(slot1) then
		return
	end

	slot0.parent_wnd = slot1

	slot0.parent_wnd:addChild(slot0.node)
end

function RoleSceneObj.setAlpha(slot0, slot1, slot2)
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

function RoleSceneObj.setVo(slot0, slot1)
	slot0.vo = slot1
	slot0.dir = slot0.vo.dir

	if RolesceneController:getInstance():getIsInChiefWar() and slot0.vo.type == RoleSceneVo.unittype.role then
		if RoleController:getInstance():getRoleVo().rid == slot1.rid and slot2.srv_id == slot1.srv_id then
			slot0:createNameContainer()
		end
	elseif not RolesceneController:getInstance():getIsInChiefWar() then
		slot0:createNameContainer()
	end

	if slot0.name_ttf then
		slot0.name_ttf:setString(slot0.vo.name)

		if slot0.name_container ~= nil then
			slot2 = slot0.name_ttf:getContentSize()

			slot0.name_container:setContentSize(cc.size(slot2.width + 40, 36))
			slot0.name_ttf:setPositionX((slot2.width + 40) * 0.5)
		end
	end

	if (slot0.vo.name == nil or slot0.vo.name == "") and slot0.name_container ~= nil then
		slot0.name_container:setVisible(false)
	end

	if slot1.status and slot1.status == 1 then
		if RolesceneController:getInstance():getIsInChiefWar() then
			slot0:showBattleEffect(true)
		end
	else
		slot0:showBattleEffect(false)
	end

	slot0:setWorldPos(cc.p(slot0.vo.x, slot0.vo.y))
end

function RoleSceneObj.getVo(slot0)
	return slot0.vo
end

function RoleSceneObj.setZOrder(slot0, slot1)
	slot0.node:setLocalZOrder(slot1)
end

function RoleSceneObj.getZOrder(slot0)
	return slot0.node:getLocalZOrder()
end

function RoleSceneObj.setWorldPos(slot0, slot1)
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

	slot0:setZOrder(720 - slot1.y)
end

function RoleSceneObj.getWorldPos(slot0)
	return slot0.world_pos
end

function RoleSceneObj.setLogicPos(slot0, slot1)
	if slot0.logic_pos and slot0.logic_pos.x == slot1.x and slot0.logic_pos.y == slot1.y then
		return
	end

	slot0.logic_pos = slot1

	slot0:setWorldPos(TileUtil.changeToPixsPoint(slot1))
end

function RoleSceneObj.getLogicPos(slot0)
	return slot0.logic_pos
end

function RoleSceneObj.showBattleEffect(slot0, slot1)
	if not slot0.battle_effect and slot1 == false then
		return
	end

	if slot0.battle_effect then
		slot0.battle_effect:runAction(cc.RemoveSelf:create(true))

		slot0.battle_effect = nil
	end

	if slot1 == true and not slot0.battle_effect then
		slot0.battle_effect = createEffectSpine(Config.EffectData.data_effect_info[196] or "", cc.p(0, 0), cc.p(0.5, 0.5), true, "action")

		slot0.topContainer:addChild(slot0.battle_effect, 10)
	end
end

function RoleSceneObj.stopAllActions(slot0)
	slot0.node:stopAllActions()
end

function RoleSceneObj.registEvent(slot0)
end

function RoleSceneObj.update(slot0, slot1)
end

function RoleSceneObj.setDir(slot0, slot1, slot2)
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
		if RolesceneController:getInstance():getIsInChiefWar() and slot0.vo and slot0.vo.type == RoleSceneVo.unittype.role then
			slot3 = GameMath.GetRealActionName(slot0.body_action_name, slot0.vo.dir)
		end

		if not tolua.isnull(slot0.body) then
			slot0.body:setAnimation(0, slot3, true)
			slot0.body:setToSetupPose()
		end

		if slot1 == 6 or slot1 == 7 or slot1 == 8 then
			slot0.spineContainer:setScaleX(-1)
		else
			slot0.spineContainer:setScaleX(1)
		end
	end
end

function RoleSceneObj.freeMove(slot0, slot1)
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

function RoleSceneObj.doRun(slot0)
	if slot0.is_init == false then
		return
	end

	if slot0.isRun and slot0.last_dir == slot0.dir then
		return
	end

	slot0.isRun = true

	slot0:playActionOnce(PlayerAction.run)
end

function RoleSceneObj.doStand(slot0)
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

function RoleSceneObj.reload(slot0)
	slot0:playActionOnce(slot0.base_action_name, slot0.vo.body_res)
end

function RoleSceneObj.playActionOnce(slot0, slot1, slot2)
	if slot0.vo == nil or slot0.is_init == false then
		return
	end

	slot1 = slot1 or PlayerAction.battle_stand
	slot0.base_action_name = slot1

	slot0:_createSpineByName(slot1, slot2 or slot0.body_spine_name)
end

function RoleSceneObj.playActionOnceTime(slot0, slot1, slot2)
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

function RoleSceneObj._createSpineByName(slot0, slot1, slot2)
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

function RoleSceneObj.createBody(slot0, slot1, slot2)
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

	if RolesceneController:getInstance():getIsInChiefWar() and slot0.vo and slot0.vo.type == RoleSceneVo.unittype.role then
		slot3 = GameMath.GetRealActionName(slot0.body_action_name, slot0.dir_number)
	end

	if not tolua.isnull(slot0.body) then
		slot0.body:setAnimation(0, slot3, true)
		slot0.body:setToSetupPose()
	end
end

function RoleSceneObj.removeBody(slot0)
	if slot0.body ~= nil then
		slot0.body:setVisible(false)
		slot0.body:runAction(cc.RemoveSelf:create(true))
		slot0.body:clearTracks()
	end

	slot0.body = nil
	slot0.body_action_name = nil
	slot0.body_spine_name = nil
end

function RoleSceneObj.createArmature(slot0, slot1, slot2)
	slot3 = createSpineByName(slot1, slot2)

	slot3:setAnchorPoint(cc.p(0.5, 0))

	return slot3
end

function RoleSceneObj.updateNamePos(slot0)
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

		if slot0.vo and slot0.vo.type == RoleSceneVo.unittype.unit then
			if slot0.vo.sub_type == RoleSceneVo.sub_unittype.npc then
				slot0.bottom:setPosition(math.ceil(slot0.boxWidth / 2), math.ceil(slot0.boxHeight + slot0.topOffY + 10))
			else
				slot0.bottom:setPosition(math.ceil(slot0.boxWidth / 2), 0)
			end
		else
			slot0.bottom:setPosition(math.ceil(slot0.boxWidth / 2), 0)
		end

		slot0.topContainer:setPosition(math.ceil(slot0.boxWidth / 2), math.ceil(slot0.boxHeight + slot0.topOffY + 10))
		slot0.container:setContentSize(cc.size(slot0.boxWidth, slot0.boxHeight))
		slot0.container:setPosition(math.ceil(slot0.boxWidth / 2), 0)

		slot0.changeBodyRes = false
	end
end

function RoleSceneObj.setModelScale(slot0, slot1)
	if slot0.main_container and not tolua.isnull(slot0.main_container) then
		slot0.main_container:setScale(slot1)
	end
end

function RoleSceneObj.updateEffectPos(slot0, ...)
	if slot0.topContainer then
		slot1 = 0

		if slot0.buffEffect and slot0.buffEffect:getParent() then
			slot0.buffEffect:setPosition(0, slot1)

			slot1 = slot1 + slot0.buffEffect:getBoundingBox().height
		end

		if slot0.fightEffect and slot0.fightEffect:getParent() then
			slot0.fightEffect:setPosition(0, slot1)

			slot1 = slot1 + slot0.fightEffect:getBoundingBox().height
		end

		if slot0.own_mark_effect and slot0.own_mark_effect:getParent() then
			slot0.own_mark_effect:setPosition(0, slot1 + 20)

			slot1 = slot1 + slot0.own_mark_effect:getBoundingBox().height
		end
	end
end

function RoleSceneObj.createSomeEffect(slot0, slot1, slot2, slot3, slot4)
	if slot1 == false then
		if slot2 ~= nil and slot2:getParent() ~= nil then
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

function RoleSceneObj.__delete(slot0)
	slot0:removeBody()
	slot0:showBattleEffect(false)

	if slot0.node:getParent() then
		slot0.node:removeAllChildren()
		slot0.node:getParent():removeChild(slot0.node)
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
