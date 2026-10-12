slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = {
	Rigth_Down = 4,
	Left_Top = 1,
	Left_Down = 2,
	Rigth_Top = 3
}
HomeworldRole = HomeworldRole or BaseClass()

function HomeworldRole.__init(slot0, slot1)
	slot0.parent = slot1
	slot0.cur_role_grid_x = 10
	slot0.cur_role_grid_y = 10
	slot0.can_move_role = true
	slot0.is_visible = true
	slot0.role_action_id = 0
	slot0.role_action_cfg = {}
	slot0.action_step = 1
	slot0.move_action_data = {}
	slot0.is_show_action = false

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function HomeworldRole.createRoorWnd(slot0)
	slot0.root_wnd = ccui.Layout:create()
	slot0.size = cc.size(120, 160)

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0))
	slot0.root_wnd:setContentSize(slot0.size)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setSwallowTouches(true)
	slot0.parent:addChild(slot0.root_wnd, 99)
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_home_character01")
	AudioManager:getInstance():preLoadEffect(AudioManager.AUDIO_TYPE.COMMON, "c_home_character02")
end

function HomeworldRole.registerEvent(slot0)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if not uv0.can_move_role then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			uv0:showRoleMoveAction(false)

			uv0.touch_began = slot0:getTouchBeganPosition()
			uv0.move_begin_grid_x = uv0.cur_role_grid_x
			uv0.move_begin_grid_y = uv0.cur_role_grid_y
		elseif slot1 == ccui.TouchEventType.moved then
			if not uv0._is_update_occ and uv0.sole_id then
				uv0._is_update_occ = true

				uv1:updateOccupyGridList({
					{
						HomeworldConst.Scene_Unit_Type.Role,
						uv0.sole_id
					}
				}, 1)
				uv0:updateGridStatus(true, uv0.cur_role_grid_x, uv0.cur_role_grid_y)
				uv0:setLocalZOrder(99)
			end

			slot2 = slot0:getTouchMovePosition()

			if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
				uv0:moveRoleByPos(uv0.parent:convertToNodeSpace(slot2))
			end
		elseif slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
			uv0.show_move_action = false
			uv0._is_update_occ = false
			slot2 = slot0:getTouchEndPosition()
			slot3 = false

			if uv0.touch_began and slot2 and (math.abs(slot2.x - uv0.touch_began.x) > 10 or math.abs(slot2.y - uv0.touch_began.y) > 10) then
				slot3 = true
			end

			if slot3 == false then
				playButtonSound2()
				uv0:onClickRole()
			else
				if not uv0.last_grid_can_use then
					uv0.cur_role_grid_x = uv0.move_begin_grid_x
					uv0.cur_role_grid_y = uv0.move_begin_grid_y

					uv0:adjustPosition(uv0.cur_role_grid_x, uv0.cur_role_grid_y)
				end

				uv0:playRoleAction(PlayerAction.caught_3)
			end

			uv0:updateGridStatus(false)
			uv1:updateAllUnitZorder()
		end
	end)
end

function HomeworldRole.onClickRole(slot0)
	slot0:showRoleMoveAction(false)
	slot0:playRoleAction(PlayerAction.interaction)
end

function HomeworldRole.moveRoleByPos(slot0, slot1)
	slot2, slot3 = HomeTile.toTile(nil, slot1.x, slot1.y - 80)

	if slot0.cur_role_grid_x ~= slot2 or slot0.cur_role_grid_y ~= slot3 then
		slot0:adjustPosition(slot2, slot3)
		slot0:updateGridStatus(true, slot2, slot3)

		slot0.cur_role_grid_x = slot2
		slot0.cur_role_grid_y = slot3

		if uv0:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND) then
			slot0.last_grid_can_use = true
		else
			slot0.last_grid_can_use = false
		end
	end

	if not slot0.show_move_action then
		slot0.show_move_action = true

		slot0:playRoleAction(PlayerAction.caught_1)
	end
end

function HomeworldRole.updateGridStatus(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not slot0.grid_node then
			slot0.grid_node = createSprite(PathTool.getResFrame("homeworld", "homeworld_1024"), nil, , slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
			slot4, slot5 = HomeTile.toPixel(nil, slot2, slot3)

			if slot0.parent.pos_node then
				slot0.parent.pos_node:setPosition(cc.p(slot4, slot5))
				slot0.grid_node:setPosition(slot0.root_wnd:convertToNodeSpace(slot0.parent.pos_node:convertToWorldSpace(cc.p(0, 0))))
			end
		end

		slot4 = PathTool.getResFrame("homeworld", "homeworld_1024")

		if not uv0:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND) then
			slot4 = PathTool.getResFrame("homeworld", "homeworld_1023")
		end

		if not slot0.cur_grid_res or slot0.cur_grid_res ~= slot4 then
			slot0.cur_grid_res = slot4

			loadSpriteTexture(slot0.grid_node, slot4, LOADTEXT_TYPE_PLIST)
		end

		slot0.grid_node:setVisible(true)
	elseif slot0.grid_node then
		slot0.grid_node:setVisible(false)
	end
end

function HomeworldRole.adjustPosition(slot0, slot1, slot2)
	slot3, slot4 = HomeTile.toPixel(nil, slot1 or slot0.cur_role_grid_x, slot2 or slot0.cur_role_grid_y)

	slot0.root_wnd:setPosition(cc.p(slot3, slot4))
end

function HomeworldRole.setData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.figure_id = slot1.look_id
	slot0.role_name = slot1.name
	slot0.role_rid = slot1.rid
	slot0.role_srv_id = slot1.srv_id
	slot0.sole_id = getNorKey(slot1.rid, slot1.srv_id)
	slot0.can_move_role = slot2
	slot0.is_owner = slot3 or false

	if slot0:getRandomGridPos() then
		if not Config.HomeData.data_figure[slot0.figure_id] then
			return
		end

		slot0:removeRoleSpine()

		slot0.role_spine = createEffectSpine(slot4.look_id or "H60001", cc.p(60, 0), cc.p(0.5, 0), true, PlayerAction.idle, handler(slot0, slot0._onRoleActionEndCallback))

		slot0.role_spine:setScale(1)
		slot0.root_wnd:addChild(slot0.role_spine)

		slot0.cur_role_action = PlayerAction.idle

		if slot0.owner_icon then
			slot0.owner_icon:setVisible(false)
		end

		if slot0.role_name and slot0.role_name ~= "" then
			if not slot0.name_bg then
				slot0.name_bg = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_90056"), slot0.size.width * 0.5, -20, cc.p(0.5, 0.5), true, 1)

				slot0.name_bg:setScale(0.5)
			end

			if not slot0.name_txt then
				slot0.name_txt = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, -20))

				slot0.root_wnd:addChild(slot0.name_txt)
				slot0.name_txt:setLocalZOrder(2)
			end

			slot6 = RoleController:getInstance():getRoleVo()

			if not slot2 then
				if slot6.rid == slot0.role_rid and slot6.srv_id == slot0.role_srv_id then
					slot0.name_txt:setString(uv0("<div fontcolor=#FFDB4C>%s</div>", slot0.role_name))
				elseif slot0.is_owner then
					if not slot0.owner_icon then
						slot0.owner_icon = createSprite(PathTool.getResFrame("homeworld", "homeworld_1060"), -5, -20, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1)
					end

					slot0.owner_icon:setVisible(true)
					slot0.name_txt:setString(uv0("<div fontcolor=#DBC39D>%s</div>", slot0.role_name))
				else
					slot0.name_txt:setString(uv0("<div fontcolor=#ffffff>%s</div>", slot0.role_name))
				end
			else
				slot0.name_txt:setString(uv0("<div fontcolor=#ffffff>%s</div>", slot0.role_name))
			end

			slot0.name_bg:setVisible(true)
			slot0.name_txt:setVisible(true)
		elseif slot0.name_bg then
			slot0.name_bg:setVisible(false)
			slot0.name_txt:setVisible(false)
		end

		slot0:adjustPosition(slot0.cur_role_grid_x, slot0.cur_role_grid_y)
		slot0:showRoleMoveAction(true)
	end
end

function HomeworldRole.getRandomGridPos(slot0)
	uv0:updateOccupyGridList(nil, 1)

	slot1 = {}
	slot2 = 11
	slot3 = 41

	for slot7 = 1, 18 do
		for slot11 = 1, 39 do
			if uv1:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND) == true then
				table.insert(slot1, {
					slot2,
					slot3
				})
			end

			slot3 = slot3 - 1
		end

		if slot2 - 1 < 1 then
			slot2 = 21
		end

		slot3 = 41
	end

	if #slot1 > 0 then
		slot4 = math.random(1, #slot1)
		slot0.cur_role_grid_x = slot1[slot4][1]
		slot0.cur_role_grid_y = slot1[slot4][2]

		return true
	else
		return false
	end
end

function HomeworldRole._onRoleActionEndCallback(slot0)
	if slot0.cur_role_action == PlayerAction.interaction then
		slot0:playRoleAction(PlayerAction.idle)
		slot0:showRoleMoveAction(true)
	elseif slot0.cur_role_action == PlayerAction.caught_1 then
		slot0:playRoleAction(PlayerAction.caught_2)
	elseif slot0.cur_role_action == PlayerAction.caught_3 then
		slot0:playRoleAction(PlayerAction.idle)
		slot0:showRoleMoveAction(true)
	end
end

function HomeworldRole.playRoleAction(slot0, slot1)
	if not slot0.role_spine or slot0.cur_role_action and slot0.cur_role_action == slot1 then
		return
	end

	if slot1 == PlayerAction.caught_1 then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_home_character01")
	elseif slot1 == PlayerAction.caught_3 then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_home_character02")
	end

	slot2 = true

	if slot1 == PlayerAction.interaction or slot1 == PlayerAction.caught_1 or slot1 == PlayerAction.caught_3 then
		slot2 = false
	end

	slot0.role_spine:setToSetupPose()
	slot0.role_spine:setAnimation(0, slot1, slot2)

	slot0.cur_role_action = slot1
end

function HomeworldRole.showRoleMoveAction(slot0, slot1)
	slot0.root_wnd:stopAllActions()
	slot0:openMoveActionGridTimer(false)

	slot0.role_action_id = 0
	slot0.role_action_cfg = {}
	slot0.action_step = 0
	slot0.move_action_data = {}

	slot0:playRoleAction(PlayerAction.idle)

	if slot1 == true then
		if not uv0:getHomeEditStatus() then
			uv0:updateAllUnitZorder()
		end

		slot0.is_show_action = true
		slot0.role_action_id = math.random(1, Config.HomeData.data_role_action_length)
		slot0.role_action_cfg = Config.HomeData.data_role_action[slot0.role_action_id]

		slot0:playNextAction()
	else
		slot0:playRoleAction(PlayerAction.idle)

		slot0.is_show_action = false
	end
end

function HomeworldRole.playNextAction(slot0)
	if not slot0.role_action_cfg then
		return
	end

	slot0.action_step = slot0.action_step + 1

	if slot0.role_action_cfg.action[slot0.action_step] then
		if slot1[1] == "idle" then
			slot0:playRoleAction(PlayerAction.idle)
			delayRun(slot0.root_wnd, slot1[2] or 1, function ()
				uv0:playNextAction()
			end)
		elseif slot2 == "move" then
			slot4, slot5 = slot0.root_wnd:getPosition()
			slot0.cur_role_grid_x, slot0.cur_role_grid_y = HomeTile.toTile(HOME_TILE_TYPE_LAND, slot4, slot5)
			slot6, slot7 = slot0:getMoveDirAndGridNumByNum(slot3)

			if slot6 and next(slot6) ~= nil then
				slot0:playRoleAction(PlayerAction.move)

				slot0.move_action_data = slot6
				slot8, slot9 = HomeTile.toPixel(HOME_TILE_TYPE_LAND, slot6[1], slot6[2])

				if slot6[3] == uv0.Left_Top or slot6[3] == uv0.Left_Down then
					slot0.role_spine:setScaleX(-0.65)
				else
					slot0.role_spine:setScaleX(0.65)
				end

				slot0.root_wnd:runAction(cc.Sequence:create(cc.MoveTo:create(slot7 * 2, cc.p(slot8, slot9)), cc.CallFunc:create(function ()
					uv0.root_wnd:stopAllActions()
					uv0:openMoveActionGridTimer(false)
					uv0:playNextAction()
				end)))
				slot0:openMoveActionGridTimer(true)
			else
				slot0:showRoleMoveAction(true)
			end
		else
			slot0:showRoleMoveAction(true)
		end
	elseif slot0.is_visible == true then
		slot0:showRoleMoveAction(true)
	end
end

function HomeworldRole.getMoveDirAndGridNumByNum(slot0, slot1)
	slot2 = {}

	while next(slot2) == nil and slot1 > 0 do
		for slot6 = 1, 4 do
			slot7, slot8, slot9 = slot0:checkDirGridIsCanWalk(slot6, slot1)

			if slot7 and slot0.cur_role_grid_x ~= slot8 and slot0.cur_role_grid_y ~= slot9 then
				uv0(slot2, {
					slot8,
					slot9,
					slot6
				})
			end
		end

		slot1 = slot1 - 1
	end

	if next(slot2) ~= nil then
		return slot2[math.random(1, #slot2)], slot1 + 1
	else
		return
	end
end

function HomeworldRole.checkDirGridIsCanWalk(slot0, slot1, slot2)
	slot3 = true
	slot4 = slot0.cur_role_grid_x
	slot5 = slot0.cur_role_grid_y
	slot10 = 1
	slot6 = uv0:getOccupyGridList({
		{
			HomeworldConst.Scene_Unit_Type.Role,
			slot0.sole_id
		}
	}, slot10)

	for slot10 = 1, slot2 do
		if slot1 == uv1.Left_Top then
			slot4, slot5 = HomeTile.tileOffset(slot0.cur_role_grid_x, slot0.cur_role_grid_y, 0, slot10)
		elseif slot1 == uv1.Left_Down then
			slot4, slot5 = HomeTile.tileOffset(slot0.cur_role_grid_x, slot0.cur_role_grid_y, -slot10, 0)
		elseif slot1 == uv1.Rigth_Top then
			slot4, slot5 = HomeTile.tileOffset(slot0.cur_role_grid_x, slot0.cur_role_grid_y, slot10, 0)
		elseif slot1 == uv1.Rigth_Down then
			slot4, slot5 = HomeTile.tileOffset(slot0.cur_role_grid_x, slot0.cur_role_grid_y, 0, -slot10)
		end

		if uv2:checkGridIsCanWalk(slot4, slot5, HOME_TILE_TYPE_LAND, slot6) == false then
			break
		end
	end

	return slot3, slot4, slot5
end

function HomeworldRole.openMoveActionGridTimer(slot0, slot1)
	if slot1 == true then
		if slot0.move_act_timer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.move_act_timer)

			slot0.move_act_timer = nil
		end

		slot0.move_act_timer = GlobalTimeTicket:getInstance():add(function ()
			slot0, slot1 = uv0.root_wnd:getPosition()
			slot2, slot3 = HomeTile.toTile(HOME_TILE_TYPE_LAND, slot0, slot1)

			if not uv2:checkGridIsCanWalk(slot2, slot3, HOME_TILE_TYPE_LAND, uv1:getOccupyGridList({
				{
					HomeworldConst.Scene_Unit_Type.Role,
					uv0.sole_id
				}
			}, 1)) then
				uv0:showRoleMoveAction(true)
			elseif uv0.cur_role_grid_x ~= slot2 or uv0.cur_role_grid_y ~= slot3 then
				uv0.cur_role_grid_x = slot2
				uv0.cur_role_grid_y = slot3

				if not uv1:getHomeEditStatus() then
					uv1:updateAllUnitZorder()
				end
			end
		end, 0.1)
	elseif slot0.move_act_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.move_act_timer)

		slot0.move_act_timer = nil
	end
end

function HomeworldRole.setVisible(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setVisible(slot1)

		slot0.is_visible = slot1

		slot0:playRoleAction(PlayerAction.idle)

		if slot1 == true then
			uv0:updateOccupyGridList({
				{
					HomeworldConst.Scene_Unit_Type.Role,
					slot0.sole_id
				}
			}, 1)

			if not uv1:checkGridIsCanWalk(slot0.cur_role_grid_x, slot0.cur_role_grid_y, HOME_TILE_TYPE_LAND) then
				if slot0:getRandomGridPos() then
					slot0:adjustPosition()
					slot0:showRoleMoveAction(true)
				end
			else
				slot0:showRoleMoveAction(true)
			end
		else
			slot0:showRoleMoveAction(false)
		end
	end
end

function HomeworldRole.isVisible(slot0)
	return slot0.is_visible
end

function HomeworldRole.removeRoleSpine(slot0)
	if slot0.role_spine then
		slot0.role_spine:clearTracks()
		slot0.role_spine:removeFromParent()

		slot0.role_spine = nil
	end
end

function HomeworldRole.setCanMoveRoleStatus(slot0, slot1)
	slot0.can_move_role = slot1
end

function HomeworldRole.getSoleId(slot0)
	return slot0.sole_id
end

function HomeworldRole.getUnitType(slot0)
	return HomeworldConst.Scene_Unit_Type.Role
end

function HomeworldRole.getOccupyGridList(slot0)
	return {
		{
			slot0.cur_role_grid_x,
			slot0.cur_role_grid_y
		}
	}
end

function HomeworldRole.setLocalZOrder(slot0, slot1)
	if slot0.root_wnd then
		slot0.root_wnd:setLocalZOrder(slot1 or 1)
	end
end

function HomeworldRole.getCurGridPos(slot0)
	return slot0.cur_role_grid_x, slot0.cur_role_grid_y
end

function HomeworldRole.getBottomGridPos(slot0)
	return slot0.cur_role_grid_x, slot0.cur_role_grid_y
end

function HomeworldRole.__delete(slot0)
	slot0:showRoleMoveAction(false)
	slot0:openMoveActionGridTimer(false)
	slot0:removeRoleSpine()

	if slot0.root_wnd then
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end
end
