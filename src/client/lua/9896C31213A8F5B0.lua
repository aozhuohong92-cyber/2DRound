Player = Player or BaseClass(SceneObj)

function Player.__init(slot0, slot1)
	slot0.is_hero = slot1 or false
	slot0.isRuning = false
	slot0.isNeedRun = false
	slot0.move_start_pos = cc.p(0, 0)
	slot0.move_end_pos = cc.p(0, 0)
	slot0.move_total_distance = 0
	slot0.move_pass_distance = 0
	slot0.move_dir = cc.p(0, 0)
	slot0.move_speed = 0
	slot0.dir_number = 0
end

function Player.setVo(slot0, slot1)
	SceneObj.setVo(slot0, slot1)

	slot0.dir_number = slot0.vo.dir

	slot0:setBattleStatus(slot0.vo.status)
	slot0:setEffectStatus(slot0.vo.effect)
	slot0:setSkillStatus(slot0.vo.skill_effect)

	if slot0.update_self_event == nil and slot0.vo ~= nil then
		slot0.update_self_event = slot0.vo:Bind(SceneEvent.UPDATE_UNIT_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "status" then
				uv0:setBattleStatus(uv0.vo.status)
			elseif slot0 == "effect" then
				uv0:setEffectStatus(uv0.vo.effect)
			elseif slot0 == "skill_effect" then
				uv0:setSkillStatus(uv0.vo.skill_effect)
			end
		end)
	end
end

function Player.doMove(slot0, slot1, slot2)
	if slot1 == nil then
		slot1 = slot0.world_pos
	end

	if slot1.x == slot2.x and slot1.y == slot2.y then
		return
	end

	slot0:setWorldPos(slot1)

	if slot0.vo then
		slot0.move_speed = math.min(20, slot0.mechine_speed + slot3.speed / (1 - (1 - FPS_RATE) * 0.5))
	end

	slot0.move_pass_distance = 0
	slot0.move_total_distance = 0
	slot0.move_start_pos = slot1
	slot0.move_end_pos = slot2
	slot0.dir_number, slot0.move_total_distance, slot0.move_dir = slot0:computeMoveInfo(slot2)
	slot0.isNeedRun = true

	slot0:doRun()
end

function Player.stopMove(slot0)
	if not slot0.isRuning then
		return
	end

	slot0.isRuning = false
	slot0.isNeedRun = false

	slot0:doStand()
end

function Player.computeMoveInfo(slot0, slot1)
	slot4 = cc.pSub(slot1, cc.p(slot0.world_pos.x, slot0.world_pos.y))
	slot4 = cc.pNormalize(slot4)

	return GameMath.GetDirectionNumberHV(slot4), cc.pGetLength(slot4), slot4
end

function Player.update(slot0, slot1, slot2)
	if slot0.isNeedRun then
		slot0:step(slot1)
	end

	SceneObj.update(slot0, slot1)
	slot0:updateNamePos()
end

function Player.step(slot0, slot1)
	slot2 = slot0.vo

	if slot0.move_total_distance <= slot0.move_pass_distance then
		slot0.move_pass_distance = 0
		slot3 = cc.p(slot0.move_end_pos.x, slot0.move_end_pos.y)
		slot0.isRuning = false
		slot0.isNeedRun = false

		if slot0.vo.is_speed_up == false then
			slot0:doStand()
		end
	else
		slot0.move_pass_distance = math.min(slot0.move_pass_distance + slot0.move_speed, slot0.move_total_distance)
		slot4 = cc.pAdd(cc.p(slot0.move_start_pos.x, slot0.move_start_pos.y), cc.pMul(slot0.move_dir, slot0.move_pass_distance))
		slot4.x = slot4.x
		slot4.y = slot4.y

		slot0:setWorldPos(slot4)

		slot0.isRuning = true

		if slot0.vo then
			slot0.move_speed = math.min(20, slot0.mechine_speed + slot5.speed / (1 - (1 - FPS_RATE) * 0.5))
		end
	end
end

function Player.setBattleStatus(slot0, slot1)
	if slot1 == GodBattleConstants.role_status.fight then
		if slot0.fightEffect == nil then
			slot0.fightEffect = createEffectSpine(PathTool.getEffectRes(186), cc.p(0, 0), cc.p(0.5, 0), true)

			slot0.topContainer:addChild(slot0.fightEffect)
			slot0.fightEffect:update(0)
		end
	elseif slot0.fightEffect ~= nil then
		slot0.fightEffect:runAction(cc.RemoveSelf:create())

		slot0.fightEffect = nil
	end

	slot0:updateEffectPos()
end

function Player.setBattleBuff(slot0, slot1)
	if slot1 == GodBattleConstants.buff.normal then
		if slot0.buffEffect ~= nil then
			slot0.buffEffect:runAction(cc.RemoveSelf:create())

			slot0.buffEffect = nil
		end
	else
		slot2 = nil

		if slot0.vo and slot0.vo.camp == GodBattleConstants.camp.god then
			if slot1 == GodBattleConstants.buff.legendary then
				slot2 = Config.ZsWarData.data_const.god_legendary
			end
		elseif slot0.vo and slot0.vo.camp == GodBattleConstants.camp.devil and slot1 == GodBattleConstants.buff.legendary then
			slot2 = Config.ZsWarData.data_const.imp_legendary
		end

		if slot2 ~= nil then
			if slot0.buffEffect ~= nil and slot0.buffEffect.name ~= slot2.val and slot0.buffEffect ~= nil then
				slot0.buffEffect:runAction(cc.RemoveSelf:create())

				slot0.buffEffect = nil
			end

			if slot0.buffEffect == nil then
				slot0.buffEffect = createEffectSpine(slot2.val, cc.p(0, 0), cc.p(0.5, 0), true)

				slot0.topContainer:addChild(slot0.buffEffect)
				slot0.buffEffect:update(0)
			end
		end
	end

	slot0:setBattleContLoseBuff(slot1)
	slot0:updateEffectPos()
end

function Player.setBattleContLoseBuff(slot0, slot1)
	if slot1 == GodBattleConstants.buff.cont_lose then
		if slot0.contLoseBuffEffect ~= nil then
			return
		end

		slot2 = nil

		if slot0.vo and slot0.vo.camp == GodBattleConstants.camp.god then
			if slot1 == GodBattleConstants.buff.cont_lose then
				slot2 = Config.ZsWarData.data_const.god_defeat
			end
		elseif slot0.vo and slot0.vo.camp == GodBattleConstants.camp.devil and slot1 == GodBattleConstants.buff.cont_lose then
			slot2 = Config.ZsWarData.data_const.imp_defeat
		end

		if slot2 ~= nil then
			slot0.contLoseBuffEffect = createEffectSpine(slot2.val, cc.p(0, 10), cc.p(0.5, 1), true)

			slot0.bottom:addChild(slot0.contLoseBuffEffect, -99)
		end
	elseif slot0.contLoseBuffEffect ~= nil then
		slot0.contLoseBuffEffect:runAction(cc.RemoveSelf:create())

		slot0.contLoseBuffEffect = nil
	end
end

function Player.setEffectStatus(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if (slot1 or GodBattleConstants.buff.normal) == GodBattleConstants.buff.normal then
		slot0:setBattleBuff(slot1)
		slot0:changePlayerBody(slot1)
	elseif slot1 == GodBattleConstants.buff.cont_win then
		slot0:setBattleBuff(GodBattleConstants.buff.normal)
		slot0:changePlayerBody(slot1)
	elseif slot1 == GodBattleConstants.buff.camp_change then
		slot0:setBattleBuff(GodBattleConstants.buff.normal)
		slot0:changePlayerBody(slot1)
	else
		slot0:setBattleBuff(slot1)
		slot0:changePlayerBody(GodBattleConstants.buff.normal)
	end
end

function Player.changePlayerBody(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()
	slot3 = nil

	if slot0.vo and slot0.vo.camp then
		if slot0.vo.camp == GodBattleConstants.camp.god then
			if slot1 == GodBattleConstants.buff.normal then
				slot3 = Config.ZsWarData.data_const.god_born
			elseif slot1 == GodBattleConstants.buff.cont_win then
				slot3 = Config.ZsWarData.data_const.god_change
			elseif slot1 == GodBattleConstants.buff.camp_change then
				slot3 = Config.ZsWarData.data_const.god_god
			end
		elseif slot0.vo.camp == GodBattleConstants.camp.devil then
			if slot1 == GodBattleConstants.buff.normal then
				slot3 = Config.ZsWarData.data_const.imp_born
			elseif slot1 == GodBattleConstants.buff.cont_win then
				slot3 = Config.ZsWarData.data_const.imp_change
			elseif slot1 == GodBattleConstants.buff.camp_change then
				slot3 = Config.ZsWarData.data_const.imp_god
			end
		end
	end

	if slot3 ~= nil and slot3 ~= nil and slot0.vo.body_res ~= slot3.val then
		slot0.vo.body_res = slot3.val

		if slot0.isNeedRun == true then
			slot0:playActionOnce(PlayerAction.run, slot0.vo.body_res)
		else
			slot0:playActionOnce(PlayerAction.battle_stand, slot0.vo.body_res)
		end
	end
end

function Player.setSelfEffectStatus(slot0, slot1)
	if slot0.vo == nil or slot1 == false then
		if slot0.own_mark_effect ~= nil then
			slot0.own_mark_effect:runAction(cc.RemoveSelf:create())

			slot0.own_mark_effect = nil
		end
	elseif slot0.own_mark_effect == nil then
		if slot0.own_mark_effect == nil then
			slot0.own_mark_effect = createEffectSpine(PathTool.getEffectRes(122), cc.p(0, 0), cc.p(0.5, 0), true)

			slot0.topContainer:addChild(slot0.own_mark_effect)
			slot0.own_mark_effect:update(0)
		end
	end

	slot0:updateEffectPos()
end

function Player.setSkillStatus(slot0, slot1)
	slot2 = false
	slot3 = false
	slot4 = false

	for slot8, slot9 in pairs(slot1) do
		if slot9.id == 1 then
			slot2 = true
		elseif slot9.id == 2 then
			slot3 = 2
		elseif slot9.id == 3 then
			slot4 = 3
		end
	end

	slot0:setSpeedUpStatus(slot2)
	slot0:setImmuneStatus(slot3)
	slot0:setDizzyStatus(slot4)
end

function Player.setSpeedUpStatus(slot0, slot1)
	if slot0.vo == nil then
		return
	end

	if slot1 == false then
		slot0.vo.speed = 1
		slot0.vo.is_speed_up = false

		if slot0.speed_up_effect ~= nil then
			slot0.speed_up_effect:runAction(cc.RemoveSelf:create())

			slot0.speed_up_effect = nil
		end
	else
		slot0.vo.speed = 1.2
		slot0.vo.is_speed_up = true
		slot2 = Config.ZsWarData.data_const.speed_up

		if slot0.speed_up_effect == nil and slot2 ~= nil then
			slot0.speed_up_effect = createEffectSpine(slot2.val, cc.p(0, 30), cc.p(0.5, 0), true)

			slot0.spineContainer:addChild(slot0.speed_up_effect, 2)
		end
	end
end

function Player.setImmuneStatus(slot0, slot1)
	if slot0.vo == nil then
		return
	end

	if slot1 == false then
		if slot0.immune_effect ~= nil then
			slot0.immune_effect:runAction(cc.RemoveSelf:create())

			slot0.immune_effect = nil
		end
	else
		slot2 = Config.ZsWarData.data_const.shield

		if slot0.immune_effect == nil and slot2 ~= nil then
			slot0.immune_effect = createEffectSpine(slot2.val, cc.p(0, 0), cc.p(0.5, 0), true)

			slot0.spineContainer:addChild(slot0.immune_effect, 3)
		end
	end
end

function Player.setDizzyStatus(slot0, slot1)
	if slot0.vo == nil then
		return
	end

	if slot1 == false then
		if slot0.dizzy_effect ~= nil then
			slot0.dizzy_effect:runAction(cc.RemoveSelf:create())

			slot0.dizzy_effect = nil
		end
	else
		slot2 = Config.ZsWarData.data_const.attack_effect

		if slot0.dizzy_effect == nil and slot2 ~= nil then
			slot0.dizzy_effect = createEffectSpine(slot2.val, cc.p(0, 0), cc.p(0.5, 0), true)

			slot0.topContainer:addChild(slot0.dizzy_effect, 0)
		end
	end
end

function Player.registEvent(slot0)
end

function Player.clickHandler(slot0)
end

function Player.__delete(slot0)
	slot0.dir_number = 0

	if slot0.vo ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.vo:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.vo = nil
	end
end
