RoleScenePlayer = RoleScenePlayer or BaseClass(RoleSceneObj)

function RoleScenePlayer.__init(slot0, slot1)
	slot0.is_hero = slot1 or false
	slot0.isRuning = false
	slot0.isNeedRun = false
	slot0.model_scale = 0.8
	slot0.move_start_pos = cc.p(0, 0)
	slot0.move_end_pos = cc.p(0, 0)
	slot0.move_total_distance = 0
	slot0.move_pass_distance = 0
	slot0.move_dir = cc.p(0, 0)
	slot0.move_speed = 0
	slot0.dir_number = 0
	slot0.stepPost = 0
end

function RoleScenePlayer.setVo(slot0, slot1)
	RoleSceneObj.setVo(slot0, slot1)

	slot0.dir_number = slot0.vo.dir

	slot0:setModelScale(slot0.model_scale)
	slot0:initSpine()

	if not slot0.is_hero then
		slot0:registEvent()
		slot0:setVisible(not slot0.vo.hide_self)
	end

	if RolesceneController:getInstance():getIsInChiefWar() then
		slot0:changeBuffLooks()
		slot0:showHeroArrow()
	end

	slot2 = RolesceneController:getInstance():getSceneID()

	if slot0.vo ~= nil and slot0.role_attr_change == nil then
		slot0.role_attr_change = slot0.vo:Bind(RolesceneEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "looks" then
				if RolesceneController:getInstance():getIsInChiefWar() then
					uv0:changeLooks()
					uv0:changeBuffLooks()
				end
			elseif slot0 == "hide_self" then
				if not uv0.is_hero then
					uv0:setVisible(not slot1)
				end
			elseif slot0 == "status" then
				print("===============key=====value====", slot0, slot1)

				if RolesceneController:getInstance():getIsInChiefWar() then
					uv0:showBattleEffect(slot1 == 1 or false)
				end
			end
		end)
	end
end

function RoleScenePlayer.changeLooks(slot0)
	if slot0.vo == nil then
		return
	end

	if slot0.vo:getLooksByType(RoleSceneVo.lookstype.body) == nil then
		return
	end

	if slot1.looks_val == nil or slot2 == 0 then
		return
	end

	slot3 = nil

	if slot1.looks_mode == 1 then
		if not Config.ClothesData.data_fashion_to_partner[slot2] then
			return
		end

		if slot4 and slot4[1] and slot4[1].partner_bid and Config.ClothesData.data_clothes_data[slot4[1].partner_bid] and slot6[slot2] then
			slot3 = slot6[slot2].model or ""
		end
	else
		if Config.PartnerData.data_partner[slot2] == nil then
			return
		end

		slot3 = slot4.res_id or ""
	end

	if not slot3 then
		return
	end

	if slot0.body_spine_name ~= nil and slot0.body_spine_name == slot3 then
		return
	end

	slot0:playActionOnce(slot0.base_action_name, slot3)
end

function RoleScenePlayer.changeBuffLooks(slot0)
	if slot0.vo == nil then
		return
	end

	slot2 = RoleController:getInstance():getRoleVo()

	if slot0.vo:getLooksByType(RoleSceneVo.lookstype.buff) == nil or next(slot1) == nil then
		if slot0.buff_effect then
			slot0.buff_effect:runAction(cc.RemoveSelf:create(true))

			slot0.buff_effect = nil
		end

		slot0:showHeroArrow()

		return
	end

	if not slot0.buff_effect and Config.ChiefWarData.data_chief_const and Config.ChiefWarData.data_chief_const.chief_mark and Config.ChiefWarData.data_chief_const.chief_mark.val then
		slot0.buff_effect = createEffectSpine(Config.EffectData.data_effect_info[Config.ChiefWarData.data_chief_const.chief_mark.val] or "", cc.p(0, 7), cc.p(0.5, 0.5), true, "action")

		slot0.topContainer:addChild(slot0.buff_effect, 10)
	end

	slot0:showHeroArrow()
end

function RoleScenePlayer.doMove(slot0, slot1, slot2)
	if slot0.vo == nil then
		return
	end

	if (slot1 or slot0.world_pos).x == slot2.x and slot1.y == slot2.y then
		return
	end

	slot3 = TileUtil.changeToTilePoint(slot2)

	if Astar:getInstance():isBlock(slot3.x, slot3.y) then
		return
	end

	slot0:setWorldPos(slot1)

	slot0.move_speed = math.min(20, (slot0.mechine_speed + slot0.vo:getSpeed()) / (1 - (1 - FPS_RATE) * 0.5))
	slot0.move_pass_distance = 0
	slot0.move_total_distance = 0
	slot0.move_start_pos = slot1
	slot0.move_end_pos = slot2
	slot0.dir_number, slot0.move_total_distance, slot0.move_dir = slot0:computeMoveInfo(slot2)
	slot0.isNeedRun = true

	if slot0.dir_number ~= slot0.dir then
		slot0:setDir(slot0.dir_number)
	end

	slot0:doRun()
end

function RoleScenePlayer.stopMove(slot0)
	if not slot0.isRuning then
		return
	end

	slot0.isRuning = false
	slot0.isNeedRun = false

	slot0:doStand()

	if slot0.is_hero then
		if slot0:getWorldPos() == nil then
			return
		end

		RolesceneController:getInstance():move(slot1, slot0.dir)
	end
end

function RoleScenePlayer.computeMoveInfo(slot0, slot1)
	slot4 = cc.pSub(slot1, cc.p(slot0.world_pos.x, slot0.world_pos.y))
	slot5 = cc.pGetLength(slot4)
	slot6 = GameMath.GetDirectionNumberHV(cc.pNormalize(slot4))

	if RolesceneController:getInstance():getIsInChiefWar() == true then
		slot6 = GameMath.GetDirectionNumberHVII(slot4)
	end

	return slot6, slot5, slot4
end

function RoleScenePlayer.update(slot0, slot1, slot2)
	if slot0.isNeedRun then
		slot0:step(slot1)
	end

	SceneObj.update(slot0, slot1)
	slot0:updateNamePos()
end

function RoleScenePlayer.step(slot0, slot1)
	if slot0.vo == nil then
		return
	end

	if slot0.move_total_distance <= slot0.move_pass_distance then
		slot0.move_pass_distance = 0
		slot0.isRuning = false
		slot0.isNeedRun = false

		slot0:doStand()

		if slot0.is_hero then
			RolesceneController:getInstance():move(slot0.move_end_pos, slot0.dir)
			GlobalEvent:getInstance():Fire(SceneEvent.SCENE_WALKEND, cc.p(slot0.move_end_pos.x, slot0.move_end_pos.y))

			slot0.stepPost = 0
		end
	else
		slot0.move_pass_distance = math.min(slot0.move_pass_distance + slot0.move_speed, slot0.move_total_distance)
		slot3 = cc.pAdd(cc.p(slot0.move_start_pos.x, slot0.move_start_pos.y), cc.pMul(slot0.move_dir, slot0.move_pass_distance))
		slot3.x = slot3.x
		slot3.y = slot3.y

		slot0:setWorldPos(slot3)

		slot0.isRuning = true

		if slot0.is_hero then
			slot0.stepPost = slot0.stepPost + 1

			if MapUtil.isOnRange(slot0.move_end_pos, slot3, slot0.move_speed) then
				GlobalEvent:getInstance():Fire(SceneEvent.SCENE_WALKNEXT, slot3)
				RolesceneController:getInstance():move(slot0.world_pos, slot0.dir)
			else
				if (math.floor(slot0.move_pass_distance) + slot0.move_speed) % 51 < slot0.move_speed then
					RolesceneController:getInstance():move(slot0.world_pos, slot0.dir)
				end

				if slot4 % 100 < slot0.move_speed then
					-- Nothing
				end
			end
		end

		slot0.move_speed = math.min(20, (slot0.mechine_speed + slot0.vo:getSpeed()) / (1 - (1 - FPS_RATE) * 0.5))
	end
end

function RoleScenePlayer.showHeroArrow(slot0)
	if RoleController:getInstance():getRoleVo().rid == slot0.vo.rid and slot1.srv_id == slot0.vo.srv_id and not slot0.arrow_effect then
		slot0.arrow_effect = createEffectSpine(Config.EffectData.data_effect_info[122] or "", cc.p(0, 65), cc.p(0.5, 0.5), true, "action")

		slot0.topContainer:addChild(slot0.arrow_effect, 10)
	end

	if slot0.buff_effect and not tolua.isnull(slot0.buff_effect) then
		if slot0.arrow_effect and not tolua.isnull(slot0.arrow_effect) then
			slot0.arrow_effect:setPosition(cc.p(0, 65))
		end
	elseif slot0.arrow_effect and not tolua.isnull(slot0.arrow_effect) then
		slot0.arrow_effect:setPosition(cc.p(0, 27))
	end
end

function RoleScenePlayer.registEvent(slot0)
	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:clickHandler()
		end
	end)
end

function RoleScenePlayer.clickHandler(slot0)
	if slot0.is_hero then
		return
	end

	GlobalEvent:getInstance():Fire(SceneEvent.SCENE_PLAYER_CLICK, slot0.vo)
end

function RoleScenePlayer.__delete(slot0)
	slot0.dir_number = 0

	if slot0.vo ~= nil and slot0.role_attr_change ~= nil then
		slot0.vo:UnBind(slot0.role_attr_change)

		slot0.role_attr_change = nil
	end
end
