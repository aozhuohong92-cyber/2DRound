BattleRole = BattleRole or BaseClass()
slot0 = BattleController:getInstance():getModel()

function BattleRole.__init(slot0, slot1, slot2, slot3, slot4)
	if slot1 == nil then
		return
	end

	slot0.combat_type = slot1.fight_type
	slot0.pos = slot1.pos
	slot0.owner_id = slot1.owner_id
	slot0.owner_srv_id = slot1.owner_srv_id
	slot0.object_type = slot1.object_type
	slot0.object_id = slot1.object_id
	slot0.object_name = slot1.object_name
	slot0.object_bid = slot1.object_bid
	slot0.star = slot1.star
	slot0.sex = slot1.sex
	slot0.hp = slot1.hp
	slot0.lev = slot1.lev
	slot0.hp_max = slot1.hp_max
	slot0.init_hp_max = slot1.hp_max
	slot0.face_id = slot1.face_id
	slot0.round = slot1.round
	slot0.skills = slot1.skills
	slot0.group = slot1.group
	slot0.sex = slot1.sex
	slot0.is_awake = slot1.is_awake
	slot0.career = slot1.career
	slot0.special_born = slot1.special_born
	slot0.extra_data = slot1.extra_data
	slot0.type = slot1.object_type
	slot0.wait_act = 0
	slot0.res = ""
	slot0.buff_list = {}
	slot0.buff_icon = {}
	slot0.is_die = false
	slot0.countTime = 0
	slot0.temp_pos = 0
	slot0.is_needNeed = true
	slot0.is_leader = nil
	slot0.fight_round = slot3
	slot0.total_round = slot4
	slot0.is_change_status = false
	slot0.is_hallows = false
	slot0.is_boss = FALSE
	slot0.model_scale = 1
	slot0.spine_scale = 1
	slot0.is_diablerelive = false
	slot0.fashion = slot0:getBattleRoleExtendData(slot1.extra_data, BattleRoleExtendType.FASHION)
	slot0.resonate = slot0:getBattleRoleExtendData(slot1.extra_data, BattleRoleExtendType.RESONATE)
	slot0.crystal = slot0:getBattleRoleExtendData(slot1.extra_data, BattleRoleExtendType.CRYSTAL)
	slot0.camp_type = 0
	slot0.encircle_effect = ""
	slot0.height = 0
	slot0.width = 0
	slot0.hallows_val = slot1.hallows_val
	slot0.hallows_max = slot1.hallows_max
	slot0.tips_list = {}
	slot0.sprites = slot1.sprites or {}

	slot0:initBattleRoleData(slot1)
	slot0:setGridPos(slot1)
	slot0:loadSpineRes()
end

function BattleRole.initBattleRoleData(slot0, slot1)
	slot2 = nil

	if slot1.object_type == BattleObjectType.Pet then
		if Config.PartnerData.data_partner_star(getNorKey(slot1.object_bid, slot1.star)) then
			slot0.res = slot2.res_id
			slot0.encircle_effect = slot2.fight_effect
		end

		if Config.PartnerData.data_partner_base[slot1.object_bid] then
			slot0.camp_type = slot3.camp_type or 0
		end
	elseif slot1.object_type == BattleObjectType.Unit then
		if Config.UnitData.data_unit(slot1.object_bid) then
			slot0.res = slot2.body_id or slot0.res
			slot0.is_boss = slot2.sub_type or FALSE
			slot0.unit_is_boss = slot2.unit_is_boss or FALSE
			slot0.model_scale = slot2.model_size / 1000
			slot0.camp_type = slot2.camp_type or 0
			slot0.encircle_effect = slot2.fight_effect

			if slot0.is_boss == TRUE then
				GlobalEvent:getInstance():Fire(BattleEvent.Battle_Boss_Hp_Event, {
					show_type = 1,
					head_icon = slot2.head_icon
				})
			end
		end
	elseif slot1.object_type == BattleObjectType.Hallows then
		if (not slot1.star or not Config.HallowsData.data_magic[slot1.star] or Config.HallowsData.data_magic[slot1.star]) and Config.HallowsData.data_base[slot1.object_bid] then
			slot0.res = slot2.c_res_id or slot0.res
			slot0.camp_type = slot2.camp_type or 0
		end

		slot0.is_hallows = true
	elseif slot1.object_type == BattleObjectType.Elfin then
		slot0.res = "H70000"
	end

	if slot0.fashion ~= 0 and Config.PartnerSkinData.data_skin_info[slot0.fashion] then
		slot0.res = slot3.res_id

		if slot3.fight_effect ~= "" and slot0.encircle_effect ~= "" then
			slot0.encircle_effect = slot3.fight_effect
		end
	end

	if slot2 then
		slot0.height = slot2.height or 0
		slot0.width = slot2.width or 0
	end

	if Config.BattleActData.data_get_model_scale then
		slot0.spine_scale = (Config.BattleActData.data_get_model_scale[slot0.res] or 1000) / 1000
	end
end

function BattleRole.getFashionId(slot0)
	return slot0.fashion
end

function BattleRole.loadSpineRes(slot0)
	if slot0.type ~= BattleObjectType.Role then
		slot1, slot2, slot3, slot4 = PathTool.getSpineByName(slot0.res, PlayerAction.battle_stand)

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

function BattleRole.addToLayer(slot0)
	if uv0 == nil or uv0:getBattleScene() == nil then
		return
	end

	if tolua.isnull(BattleController:getInstance():getMapLayer()) then
		return
	end

	slot2 = BattleController:getInstance():getModel():getReconnectStatus()
	slot5 = PlayerAction.battle_stand
	slot0.spine_renderer = SpineRenderer.New(gridPosToScreenPos(slot0.grid_pos) or cc.p(0, 0), slot0.res, slot0.model_scale, true, PlayerAction.battle_stand, slot0.career, BattleController:getInstance():getModel():checkGroup(slot0.group), slot0.type, slot0.is_boss, slot0.unit_is_boss, slot0.spine_scale)

	slot0.spine_renderer:addToLayer(slot1)

	if slot0.is_hallows then
		slot0.spine_renderer:setHallowsScale()
	end

	slot0.spine_renderer.stand = slot5
	slot0.spine_renderer.res = slot0.res
	slot0.spine_renderer.obj_type = slot0.obj_type
	slot0.spine_renderer.grid_pos = slot0.grid_pos
	slot0.spine_renderer.grid_pos_back = slot0.grid_pos_back
	slot0.spine_renderer.is_friend = slot0.group == BattleController:getInstance():getModel():getGroup()
	slot0.spine_renderer.type = slot0.type
	slot0.spine_renderer.bid = slot0.owner_srv_id
	slot0.spine_renderer.career = slot0.career
	slot0.spine_renderer.group = BattleController:getInstance():getModel():checkGroup(slot0.group)
	slot0.spine_renderer.sex = slot0.sex
	slot0.spine_renderer.is_die = slot0.is_die
	slot0.spine_renderer.is_change_status = slot0.is_change_status
	slot0.spine_renderer.is_finish_action = false
	slot0.screen_pos = slot3

	if slot0.spine_renderer.createEncircleEffect then
		slot0.spine_renderer:createEncircleEffect(slot0.encircle_effect)
	end

	slot6 = 0
	slot7 = 0
	slot0.height = 0

	if Config.SkillData.data_get_model_data[slot0.res] or Config.SkillData.data_get_model_data["0"] then
		slot0.height = slot8.model_height
	end

	slot0.spine_renderer.model_x_fix = slot6
	slot0.spine_renderer.model_y_fix = slot7

	slot0.spine_renderer:reverse(slot0.obj_type)

	slot9 = SCREEN_HEIGHT - slot3.y
	slot10 = math.max(1, (slot0.pos == 31 or slot0.pos == 32) and 10 or (slot0.pos == 41 or slot0.pos == 42) and 11 or slot0.group == 2 and (slot0.pos - GIRD_POS_OFFSET or 1) or 1 or 1)

	if slot0.group == 2 and BattleRoleZorder[slot0.group] and BattleRoleZorder[slot0.group][slot10] then
		slot9 = BattleRoleZorder[slot0.group][slot10]
	elseif BattleRoleZorder[slot0.group] and BattleRoleZorder[slot0.group][slot10] then
		slot9 = BattleRoleZorder[slot0.group][slot10]
	end

	slot0.zorder = slot9
	slot0.spine_renderer.zorder = slot9

	slot0.spine_renderer.root:setLocalZOrder(slot9)

	slot0.width = 100

	slot0:updateRole(true)
	slot0.spine_renderer:showSpineModel(false)

	if slot0.type == BattleObjectType.Hallows then
		slot0.spine_renderer:setHallowsRound(slot0.hallows_val, slot0.hallows_max)
	elseif slot0.type == BattleObjectType.Elfin then
		slot0.spine_renderer:showElfinSkillIcon(slot0.sprites, slot0.skills)
	end

	if slot0.hp <= 0 then
		slot0:died(true)
	elseif slot0.special_born == true then
		slot0.spine_renderer:showSpineModel(true)
		slot0.spine_renderer:showEffect(true)
	end

	if not slot0.special_born and BattleConst.canDoBattle(slot0.combat_type) then
		if slot2 then
			if slot0.hp > 0 then
				slot0:showRecEnterAction()
			end
		elseif BattleController:getInstance():getActTime("is_diff_enter") == TRUE then
			if BattleController:getInstance():getModel():changeGroup(slot0.group) == 1 and slot0.hp > 0 then
				slot0:showEnterAction()
			end
		elseif slot0.hp > 0 then
			slot0:showEnterAction()
		end
	end
end

function BattleRole.updataNextBattleRole(slot0, slot1, slot2)
	slot0.hp = slot1.hp
	slot0.hp_max = slot1.hp_max
	slot0.owner_id = slot1.owner_id
	slot0.owner_srv_id = slot1.owner_srv_id
	slot0.object_type = slot1.object_type
	slot0.object_id = slot1.object_id
	slot0.object_name = slot1.object_name
	slot0.object_bid = slot1.object_bid
	slot0.sex = slot1.sex
	slot0.lev = slot1.lev
	slot0.round = slot1.round
	slot0.type = slot1.object_type or 1

	if slot0.spine_renderer then
		slot0.spine_renderer:cleanAllBuffIcon(slot0.buff_list)
	end

	SkillAct.clearAllEffect(slot0.spine_renderer)

	slot0.buff_list = {}
	slot0.buff_icon = {}
	slot0.pos = slot1.pos
	slot0.group = slot1.group
	slot0.career = slot1.career

	slot0.spine_renderer:setVisible(true)

	if slot2 then
		slot0.combat_type = slot2.combat_type
		slot0.fight_round = slot2.current_wave or BattleController:getInstance():getModel():getFightRound()
		slot0.total_round = slot2.total_wave
	end

	if slot0.hp <= 0 then
		slot0:died()
	end

	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer:reConnectUpdate(slot0.hp, slot0.hp_max)

	if slot0.is_boss == TRUE then
		GlobalEvent:getInstance():Fire(BattleEvent.Battle_Boss_Hp_Event, {
			show_type = 2,
			battle_role = slot0
		})
	end

	if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ROLE then
		BattleController:getInstance():getModel():getBattleScene():MapMovescheduleUpdate()
	end
end

function BattleRole.setGridPos(slot0, slot1)
	slot0.pos = slot1.pos

	if BattleController:getInstance():getModel():changeGroup(slot1.group) == BattleGroupTypeConf.TYPE_GROUP_ROLE then
		slot0.obj_type = BattleTypeConf.TYPE_ROLE
		slot0.grid_pos = SkillAct.newPos2Gird(slot0.combat_type, slot1.pos, true, slot0.group)
	else
		slot0.obj_type = BattleTypeConf.TYPE_ENEMY
		slot0.grid_pos = SkillAct.newPos2Gird(slot0.combat_type, slot1.pos, false, slot0.group)
	end

	slot0.grid_pos_back = deepCopy(slot0.grid_pos)
end

function BattleRole.getBattleRoleExtendData(slot0, slot1, slot2)
	slot3 = 0

	if next(slot1 or {}) ~= nil then
		for slot7, slot8 in pairs(slot1) do
			if slot2 == slot8.extra_key then
				slot3 = slot8.extra_value

				break
			end
		end
	end

	return slot3
end

function BattleRole.showRecEnterAction(slot0)
	if not tolua.isnull(slot0.spine_renderer.root) then
		slot0.spine_renderer:showSpineModel(false)

		if slot0.hp > 0 then
			slot0.spine_renderer:showSpineModel(true)
			BattleController:getInstance():getModel():addReConnectReadySum(slot0.object_type)
		end
	end
end

function BattleRole.showEnterAction(slot0)
	slot0.spine_renderer:showSpineModel(true)

	if slot0.type == BattleObjectType.Hallows or slot0.type == BattleObjectType.Elfin then
		return
	end

	if slot0.hp <= 0 then
		slot0.spine_renderer:showSpineModel(false)
	end

	if not tolua.isnull(slot0.spine_renderer.root) and not BattleController:getInstance():getModel():getReconnectStatus() and not slot0.spine_renderer.is_finish_action and BattleConst.canDoBattle(slot0.combat_type) then
		slot2 = BattleController:getInstance():getActTime("real_battle_enter_time")
		slot0.spine_renderer.is_finish_action = true

		BattleController:getInstance():getCtrlBattleScene():setMoveMapStatus(false)

		slot3 = cc.p(slot0.screen_pos.x, slot0.screen_pos.y)

		slot0.spine_renderer:doRun()

		if BattleController:getInstance():getModel():changeGroup(slot0.group) == 2 then
			slot3.x = slot3.x + SCREEN_WIDTH / 4

			slot0.spine_renderer:reverse(slot0.obj_type)
		else
			slot3.x = slot3.x - slot1
		end

		if not tolua.isnull(slot0.spine_renderer.root) then
			slot0.spine_renderer.root:setPosition(slot3)
		end

		slot4 = cc.MoveBy:create(slot2, cc.p(slot1, 0))

		if BattleController:getInstance():getModel():changeGroup(slot0.group) == 2 then
			slot4 = cc.MoveBy:create(slot2, cc.p(-slot1, 0))
		end

		slot0.spine_renderer:runAction(cc.Sequence:create(slot4, cc.CallFunc:create(function ()
			uv0.spine_renderer:doStand()
			uv0.spine_renderer:reverse(uv0.obj_type)

			if not tolua.isnull(uv0.spine_renderer.root) then
				uv0.spine_renderer.root:setPosition(uv0.screen_pos.x, uv0.screen_pos.y)
				uv0.spine_renderer:showEffect(false)
			end
		end)))
	end
end

function BattleRole.updateRole(slot0, slot1)
	if not BattleController:getInstance():getModel():isFinish() then
		if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
			return
		end

		slot2 = cc.size(0, 0)

		if slot0.spine_renderer.spine and not tolua.isnull(slot0.spine_renderer.spine) then
			slot0.spine_renderer.spine:update(0)

			slot2 = slot0.spine_renderer.spine:getBoundingBox()
		end

		slot0.width = slot0.width or math.max(slot2.width, 50)
		slot0.height = slot0.height or math.max(slot2.height, 100)
		slot0.spine_renderer.role_height = slot0.height
		slot0.spine_renderer.role_width = slot0.width

		if not slot0.is_die then
			slot0.spine_renderer:setupUI(slot0.group, slot0.lev, slot0.camp_type, {
				crystal = slot0.crystal
			})
		end

		slot0.spine_renderer:updateResonate(slot0.resonate)
		slot0.spine_renderer:setHpPercent(math.min(math.max(100 * slot0.hp / slot0.hp_max, 0), 100), slot1)

		if slot0.is_boss == TRUE then
			GlobalEvent:getInstance():Fire(BattleEvent.Battle_Boss_Hp_Event, {
				show_type = 2,
				battle_role = slot0
			})
		end

		BattleController:getInstance():getModel():roleReady(slot0)
	end
end

function BattleRole.doMove(slot0, slot1, slot2, slot3, slot4)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer:doMove(slot1, slot2, slot3, slot4)
end

function BattleRole.resetZOrder(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot0.init_zorder == nil then
		slot1 = SCREEN_HEIGHT - gridPosToScreenPos(slot0.grid_pos).y
		slot0.init_zorder = (slot0.pos ~= 31 and slot0.pos ~= 32 or BattleRoleZorder[slot0.group][10]) and (slot0.pos ~= 41 and slot0.pos ~= 42 or BattleRoleZorder[slot0.group][11]) and (slot0.group ~= 2 or BattleRoleZorder[slot0.group][slot0.pos - GIRD_POS_OFFSET]) and BattleRoleZorder[slot0.group][slot0.pos]
	end

	slot0.spine_renderer.root:setLocalZOrder(slot0.init_zorder)
end

function BattleRole.died(slot0, slot1)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot0.is_die then
		return
	end

	slot0.spine_renderer.is_die = true
	slot0.is_die = true

	if not slot1 then
		slot0.spine_renderer:runAction(cc.Sequence:create(cc.DelayTime:create(BattleController:getInstance():getActTime("delay_die_act")), cc.Blink:create(0.2, 2), cc.CallFunc:create(function ()
			if uv0.spine_renderer.is_die == true then
				uv0.spine_renderer:showSpineModel(false)
			else
				uv0:relive()
			end
		end)))
	else
		slot0.spine_renderer:showSpineModel(false)
	end

	slot0:removeRoleEffect()
end

function BattleRole.changeToGuiHun(slot0, slot1)
	if slot1 == true then
		slot0.is_in_ghost = true

		slot0.spine_renderer:handleGuiHunStatus(true)
	else
		slot0.is_in_ghost = false

		slot0.spine_renderer:handleGuiHunStatus(false)
	end
end

function BattleRole.relive(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0:changeToGuiHun(false)

	slot0.is_die = false
	slot0.spine_renderer.is_die = false
	slot0.spine_renderer.grid_pos = slot0.grid_pos

	slot0.spine_renderer:setPosByGrid(slot0.grid_pos)

	if slot0.spine_renderer.hp_root == nil then
		slot0.spine_renderer:setupUI(slot0.group, slot0.lev, slot0.camp_type, {
			crystal = slot0.crystal
		})
	end

	slot0.spine_renderer:setHpPercent(math.min(math.max(100 * slot0.hp / slot0.hp_max, 0), 100))
	slot0.spine_renderer:showSpineModel(true)

	if slot0.is_boss == TRUE then
		GlobalEvent:getInstance():Fire(BattleEvent.Battle_Boss_Hp_Event, {
			show_type = 2,
			battle_role = slot0
		})
	end

	SkillAct.setAnimation(slot0.spine_renderer, slot0.spine_renderer.stand, true, nil, nil)
end

function BattleRole.removeRoleEffect(slot0)
	SkillAct.clearAllEffect(slot0.spine_renderer)

	for slot4, slot5 in pairs(slot0.buff_list) do
		slot0.spine_renderer:removeBuffIcon(slot5.id)

		if Config.SkillData.data_get_buff[slot5.bid] and slot6.group == 3211 then
			slot0.is_diablerelive = true
		end
	end

	slot0.buff_list = {}
	slot0.buff_icon = {}
end

function BattleRole.doDied(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot0.is_die then
		return
	end

	slot0.spine_renderer.is_die = true
	slot0.is_die = true

	slot0:removeRoleEffect()
	slot0.spine_renderer:showSpineModel(false)
end

function BattleRole.showUI(slot0, slot1)
end

function BattleRole.isDisableReLieve(slot0)
end

function BattleRole.setBlack(slot0, slot1)
	if slot0.is_die then
		return
	end

	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer:setBlack(slot1)
end

function BattleRole.setBlack2(slot0, slot1)
	if slot0.is_die then
		return
	end

	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot0.spine_renderer:setBlack2(slot1, 0)
end

function BattleRole.changeSpine(slot0, slot1, slot2, slot3)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot1 and slot0.spine_renderer.in_animation == true then
		slot0.change_spine_res = slot2
		slot0.change_spine_action = slot3

		return
	end

	if slot1 then
		slot0.spine_renderer.is_change_status = true
		slot0.spine_renderer.buff_spine = slot2
	else
		slot0.spine_renderer.is_change_status = false
		slot0.spine_renderer.buff_spine = nil
	end

	slot3 = slot3 or PlayerAction.battle_stand

	if (slot2 or slot0.res) ~= "" and slot2 ~= nil then
		if not tolua.isnull(slot0.spine_renderer.spine) then
			slot0.spine_renderer.spine:runAction(cc.RemoveSelf:create(true))
		end

		slot4 = nil
		slot4 = createSpineByName(slot2, slot3)
		slot0.spine_renderer.spine = slot4

		slot0.spine_renderer:setActionName(slot3)
		slot0.spine_renderer:reverse(slot0.spine_renderer.obj_type)
		slot0.spine_renderer:addChild(slot4)

		if slot0.spine_renderer.spine then
			slot0.spine_renderer.spine:setAnimation(0, slot3, true)
			slot0.spine_renderer.spine:setToSetupPose()
		end

		slot0.spine_renderer.spine:registerSpineEventHandler(function (slot0)
			if uv0.spine_renderer:getActionName() ~= PlayerAction.battle_stand then
				uv0:changeSpine(true, uv1, PlayerAction.battle_stand)
			end
		end, sp.EventType.ANIMATION_COMPLETE)
	end
end

function BattleRole.reTryChangeSpine(slot0)
	if slot0.change_spine_res and slot0.change_spine_action then
		slot0:changeSpine(true, slot0.change_spine_res, slot0.change_spine_action)

		slot0.change_spine_action = nil
		slot0.change_spine_res = nil
	end
end

function BattleRole.exitdeleteRole(slot0)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot0.is_boss == TRUE and not tolua.isnull(slot0.spine_renderer.hp_root) then
		slot0.spine_renderer.hp_root:removeAllChildren()
		slot0.spine_renderer.hp_root:removeFromParent()
	end

	slot0.spine_renderer:DeleteMe()
end

function BattleRole.setOpacity(slot0, slot1, slot2)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if slot1 then
		slot0.spine_renderer:setOpacity(slot2)
	else
		slot0.spine_renderer:setOpacity(255)
	end
end

function BattleRole.setHaloEffectZOrder(slot0, slot1)
	if not slot0.spine_renderer or tolua.isnull(slot0.spine_renderer.halo_effect) then
		return
	end

	if slot1 == true then
		slot0.spine_renderer.halo_effect:setOpacity(50)
	else
		slot0.spine_renderer.halo_effect:setOpacity(255)
	end
end

function BattleRole.removeBuffTipsList(slot0)
	if slot0.tips_list == nil then
		return
	end

	for slot5, slot6 in pairs(slot0.tips_list) do
		if not tolua.isnull(slot6.sp) then
			doStopAllActions(slot6.sp)
			slot6.sp:removeFromParent()
		end
	end

	slot0.tips_list = {}
end
