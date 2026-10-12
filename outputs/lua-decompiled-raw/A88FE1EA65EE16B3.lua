BattleHookRole = BattleHookRole or BaseClass()

function BattleHookRole.__init(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return
	end

	slot0.combat_type = slot2
	slot0.wait_act = 0
	slot0.type = slot1.object_type
	slot0.object_type = slot1.object_type
	slot0.res = ""
	slot0.group = slot1.group
	slot0.is_die = false
	slot0.model_scale = 1
	slot0.spine_scale = 1
	slot0.hp = slot1.hp
	slot0.lev = 0
	slot0.hp_max = slot1.hp_max
	slot0.bid = slot1.bid
	slot0.object_bid = slot1.bid
	slot0.icon = slot1.icon or 5
	slot0.is_next_offset = slot4
	slot0.time_scale = slot3
	slot0.is_boss = false
	slot0.camp_type = 0
	slot0.encircle_effect = ""
	slot0.fashion = slot1.fashion or 0

	slot0:initBattleRoleData(slot1)
	slot0:setGridPos(slot1)
	slot0:loadSpineRes()
end

function BattleHookRole.initBattleRoleData(slot0, slot1)
	slot2 = nil

	if slot1.object_type == BattleObjectType.Pet then
		if Config.PartnerData.data_partner_star(getNorKey(slot1.bid, slot1.star)) then
			slot0.res = slot2.res_id
			slot0.encircle_effect = slot2.fight_effect
		end

		if Config.PartnerData.data_partner_base[slot1.bid] then
			slot0.camp_type = slot3.camp_type or 0
		end
	elseif slot1.object_type == BattleObjectType.Unit and Config.UnitData.data_unit(slot1.bid) then
		slot0.res = slot2.body_id or slot0.res
		slot0.camp_type = slot2.camp_type or 0
		slot0.encircle_effect = slot2.fight_effect
		slot0.is_boss = slot2.sub_type or FALSE
		slot0.model_scale = slot2.model_size / 1000
	end

	if slot0.fashion ~= 0 and Config.PartnerSkinData.data_skin_info[slot0.fashion] then
		slot0.res = slot3.res_id

		if slot3.fight_effect ~= "" and slot0.encircle_effect ~= "" then
			slot0.encircle_effect = slot3.fight_effect
		end
	end

	if Config.BattleActData.data_get_model_scale then
		slot0.spine_scale = (Config.BattleActData.data_get_model_scale[slot0.res] or 1000) / 1000
	end
end

function BattleHookRole.getFashionId(slot0)
	return slot0.fashion
end

function BattleHookRole.loadSpineRes(slot0)
	if slot0.type ~= BattleObjectType.Role then
		slot1, slot2, slot3, slot4 = PathTool.getSpineByName(slot0.res, PlayerAction.run)

		if display.isPrefixExist(slot4) then
			slot0:addToLayer()
		else
			cc.Director:getInstance():getTextureCache():addImageAsync(slot3, function ()
				uv0:addToLayer()
			end, getPixelFormat(slot0.res))
		end
	else
		slot0:addToLayer()
	end
end

function BattleHookRole.setGridPos(slot0, slot1)
	slot0.pos = slot1.pos

	if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ROLE then
		slot0.obj_type = BattleTypeConf.TYPE_ROLE
		slot0.grid_pos = SkillAct.newPos2Gird(slot0.combat_type, slot1.pos, true, slot0.group)
	else
		slot0.obj_type = BattleTypeConf.TYPE_ENEMY
		slot0.grid_pos = SkillAct.newPos2Gird(slot0.combat_type, slot1.pos, false, slot0.group)
	end

	slot0.grid_pos_back = deepCopy(slot0.grid_pos)
end

function BattleHookRole.addToLayer(slot0)
	if BattleController:getInstance():getCtrlBattleScene() == nil then
		return
	end

	if BattleController:getInstance():getMapLayer() == nil then
		return
	end

	slot2 = gridPosToScreenPos(slot0.grid_pos) or cc.p(0, 0)
	slot3 = slot0.group
	slot4 = PlayerAction.run

	if MAKELIFEBETTER == true then
		slot4 = PlayerAction.battle_stand

		if slot0.group == 2 then
			slot4 = PlayerAction.run
		end
	end

	slot0.spine_renderer = SpineRenderer.New(slot2, slot0.res, slot0.model_scale, true, PlayerAction.run, slot0.career, slot3, slot0.type, slot0.is_boss, nil, slot0.spine_scale)
	slot0.spine_renderer.stand = slot4

	slot0.spine_renderer:addToLayer(slot1)

	slot0.spine_renderer.res = slot0.res
	slot0.spine_renderer.obj_type = slot0.obj_type
	slot0.spine_renderer.grid_pos = slot0.grid_pos
	slot0.spine_renderer.grid_pos_back = slot0.grid_pos_back
	slot0.spine_renderer.is_friend = slot0.group == BattleController:getInstance():getNormalModel():getGroup()
	slot0.spine_renderer.type = slot0.type
	slot0.spine_renderer.is_finish_action = false
	slot0.spine_renderer.is_first_enter = false
	slot0.spine_renderer.group = slot0.group
	slot0.spine_renderer.is_die = slot0.is_die

	slot0.spine_renderer:createEncircleEffect(slot0.encircle_effect)

	slot5 = 0
	slot6 = 0
	slot0.height = nil

	if Config.SkillData.data_get_model_data[slot0.res] or Config.SkillData.data_get_model_data["0"] then
		slot0.height = slot7.model_height
	end

	slot0.spine_renderer.model_x_fix = slot5
	slot0.spine_renderer.model_y_fix = slot6

	slot0.spine_renderer:reverse(slot0.obj_type)
	slot0.spine_renderer.root:setOpacity(0)

	slot8 = SCREEN_HEIGHT - gridPosToScreenPos(slot0.grid_pos).y
	slot8 = (slot0.group ~= 2 or BattleRoleZorder[slot0.group][slot0.pos - GIRD_POS_OFFSET]) and BattleRoleZorder[slot0.group][slot0.pos]
	slot0.spine_renderer.zorder = slot8

	slot0.spine_renderer.root:setLocalZOrder(slot8)

	slot0.width = 100
	slot0.touch_layer = ccui.Layout:create()

	slot0.touch_layer:setContentSize(slot0.width, slot0.height)
	slot0.spine_renderer.root:addChild(slot0.touch_layer)
	slot0.touch_layer:setAnchorPoint(cc.p(1, 0))
	slot0.touch_layer:setTouchEnabled(true)

	if slot0.group == 2 then
		-- Nothing
	end

	slot9 = "role_" .. slot0.pos

	if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ENEMY then
		slot9 = "enemy_" .. slot0.pos
	end

	slot0.touch_layer:setName(slot9)
	slot0:updateRole()

	if BattleController:getInstance():getIsNoramalBattle() then
		slot0:showEnterAction()
	end
end

function BattleHookRole.clearNextActTimer(slot0)
	if slot0.next_ack_mon_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.next_ack_mon_timer)

		slot0.next_ack_mon_timer = nil
	end
end

function BattleHookRole.clearNextCallTimer(slot0)
	if slot0.next_call_mon_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.next_call_mon_timer)

		slot0.next_call_mon_timer = nil
	end
end

function BattleHookRole.showEnterAction(slot0)
	if tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if not BattleController:getInstance():getIsNoramalBattle() then
		return
	end

	if slot0.group == 1 then
		slot0.spine_renderer.root:runAction(cc.FadeIn:create(0.5))
	else
		slot0:clearNextActTimer()
		slot0:clearNextCallTimer()

		slot2 = SCREEN_WIDTH * 1.1

		if slot0.is_next_offset == true then
			slot2 = SCREEN_WIDTH * 1.2
		end

		slot0.spine_renderer.root:setPositionX(slot2)
		slot0.spine_renderer.root:runAction(cc.Spawn:create(cc.MoveBy:create(BattleController:getInstance():getActTime("new_hook_move_time"), cc.p(gridPosToScreenPos(NormalPosGridRight[1]).x - slot2, 0)), slot1))

		if slot0.next_call_mon_timer == nil then
			slot0.next_call_mon_timer = GlobalTimeTicket:getInstance():add(function ()
				if BattleController:getInstance():getIsNoramalBattle() then
					BattleController:getInstance():getNormalModel():updateNextRoundData(BattleLoop2.next_target_type_pos)
				end

				uv0:clearNextCallTimer()
			end, BattleController:getInstance():getActTime("new_hook_next_mon_time") * 0.5, 0)
		end

		if slot0.next_ack_mon_timer == nil then
			slot0.next_ack_mon_timer = GlobalTimeTicket:getInstance():add(function ()
				if BattleController:getInstance():getIsNoramalBattle() and BattleLoop2.play(uv0.pos) then
					if next(BattleController:getInstance():getNormalModel():getSkillPlayData(slot0.actor) or {}) == nil then
						BattleController:getInstance():getNormalModel():handleSkillPlayData(slot0)
					end

					BattleController:getInstance():getNormalModel():updateActorPlaysList(slot0)
				end

				uv0:clearNextActTimer()
			end, BattleController:getInstance():getActTime("new_hook_act_mon_time") - BattleController:getInstance():getNormalModel():getFinalMoveTime(), 0)
		end
	end
end

function BattleHookRole.updateRole(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	BattleController:getInstance():getNormalModel():roleReady(slot0)
	slot0.spine_renderer:setupUI(slot0.group, slot0.lev, slot0.camp_type)

	if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ENEMY then
		slot0.spine_renderer:setHpPercent(math.min(math.max(100 * slot0.hp / slot0.hp_max, 0), 100))
	end
end

function BattleHookRole.setMoveTime(slot0, slot1)
	slot0.move_time = slot1
end

function BattleHookRole.doMove(slot0, slot1, slot2, slot3, slot4)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer:doMove(slot1, slot2, slot3, slot4)
end

function BattleHookRole.resetZOrder(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer.root:setLocalZOrder(slot0.spine_renderer.zorder or SCREEN_HEIGHT - gridPosToScreenPos(slot0.grid_pos).y)
end

function BattleHookRole.died(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer.is_die = true

	if slot0.is_die then
		return
	end

	slot0.is_die = true

	function slot1()
		if uv0.is_die == true then
			uv0.spine_renderer.root:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
				uv0:assetJumpTo()
			end), cc.DelayTime:create(BattleController:getInstance():getActTime("delay_die_act")), cc.Spawn:create(cc.Blink:create(0.5, 2), cc.FadeOut:create(0.25), cc.CallFunc:create(function ()
				if uv0.spine_renderer.is_die == true then
					uv0:showUI(false)
				end
			end)), cc.CallFunc:create(function ()
				uv0.spine_renderer.root:setVisible(false)
				BattleController:getInstance():getNormalModel():playEnd(uv0.pos)
			end), cc.CallFunc:create(function ()
				if BattleController:getInstance():getIsNoramalBattle() then
					BattleController:getInstance():getNormalModel():updateNextRoundData(BattleLoop2.next_target_type_kill)
				end
			end)))
		end
	end

	SkillAct.clearAllEffect(slot0.spine_renderer)
	function ()
		if not tolua.isnull(uv0.spine_renderer.root) then
			function ()
				if not tolua.isnull(uv0.spine_renderer.root) and uv0.is_die then
					uv1()
				end
			end()
		end
	end()
end

function BattleHookRole.reTryChangeSpine(slot0)
end

function BattleHookRole.assetJumpTo(slot0)
	if slot0.group ~= 2 then
		return
	end

	if slot0.spine_renderer == nil or slot0.spine_renderer.root == nil then
		return
	end

	slot1 = slot0.spine_renderer.root:convertToWorldSpace(cc.p(0, 0))

	BattleDramaController:getInstance():playResourceCollect(slot1.x, slot1.y + slot0.height * 0.5)
end

function BattleHookRole.showUI(slot0, slot1)
	if not tolua.isnull(slot0.spine_renderer.ui_hp) and not tolua.isnull(slot0.spine_renderer.ui_hp2) then
		if not tolua.isnull(slot0.spine_renderer.ui_hp:getParent()) then
			slot0.spine_renderer.ui_hp:getParent():runAction(cc.RemoveSelf:create())

			slot0.spine_renderer.ui_hp = nil
		end

		if not tolua.isnull(slot0.spine_renderer.ui_hp2:getParent()) then
			slot0.spine_renderer.ui_hp2:getParent():runAction(cc.RemoveSelf:create())

			slot0.spine_renderer.ui_hp2 = nil
		end
	end
end

function BattleHookRole.exitdeleteRole(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot0.is_boss == TRUE and not tolua.isnull(slot0.spine_renderer.hp_root) then
		slot0.spine_renderer.hp_root:removeAllChildren()
		slot0.spine_renderer.hp_root:removeFromParent()
	end

	doStopAllActions(slot0.spine_renderer.root)
	slot0:clearNextActTimer()
	slot0:clearNextCallTimer()
	slot0.spine_renderer:DeleteMe()
end
