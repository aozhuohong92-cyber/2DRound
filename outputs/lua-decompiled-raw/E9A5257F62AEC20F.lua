GIRD_POS_OFFSET = 9
Pos2GridLeft = {
	{
		x = 27,
		y = 15
	},
	{
		x = 28,
		y = 21
	},
	{
		x = 29,
		y = 27
	},
	{
		x = 17,
		y = 15
	},
	{
		x = 18,
		y = 21
	},
	{
		x = 19,
		y = 27
	},
	{
		x = 7,
		y = 15
	},
	{
		x = 8,
		y = 21
	},
	{
		x = 9,
		y = 27
	},
	{
		x = 15,
		y = 43
	},
	{
		x = 11,
		y = 39
	}
}
Pos2GridRight = {
	{
		x = 53,
		y = 15
	},
	{
		x = 52,
		y = 21
	},
	{
		x = 51,
		y = 27
	},
	{
		x = 63,
		y = 15
	},
	{
		x = 62,
		y = 21
	},
	{
		x = 61,
		y = 27
	},
	{
		x = 73,
		y = 15
	},
	{
		x = 72,
		y = 21
	},
	{
		x = 71,
		y = 27
	},
	{
		x = 65,
		y = 43
	},
	{
		x = 69,
		y = 39
	}
}
NormalPosGridRight = {
	{
		x = 42,
		y = 15
	},
	{
		x = 42,
		y = 21
	},
	{
		x = 42,
		y = 27
	},
	{
		x = 42,
		y = 15
	},
	{
		x = 42,
		y = 21
	},
	{
		x = 42,
		y = 27
	},
	{
		x = 42,
		y = 15
	},
	{
		x = 42,
		y = 21
	},
	{
		x = 42,
		y = 27
	},
	{
		x = 42,
		y = 43
	}
}
BattleRoleZorder = {
	{
		998,
		995,
		992,
		999,
		996,
		993,
		997,
		994,
		991,
		990,
		989
	},
	{
		998,
		995,
		992,
		999,
		996,
		993,
		997,
		994,
		991,
		990,
		989
	}
}
pos_to_col = {
	1,
	2,
	3,
	1,
	2,
	3,
	1,
	2,
	3
}
SkillAct = SkillAct or {}

function SkillAct.newPos2Gird(slot0, slot1, slot2, slot3)
	if slot1 == 0 then
		message(TI18N("位置不能为0"))
	end

	if slot2 then
		return Pos2GridLeft[math.max(1, (slot1 == 31 or slot1 == 32) and 10 or (slot1 == 41 or slot1 == 42) and 11 or slot3 == 2 and (11 - GIRD_POS_OFFSET or 1) or slot1 or 1)]
	elseif BattleController:getInstance():getIsNoramalBattle() then
		return NormalPosGridRight[slot1]
	else
		return Pos2GridRight[slot1]
	end
end

function gridSizeX()
	return SCREEN_WIDTH / 80
end

function gridSizeY()
	return SCREEN_HEIGHT / 80
end

function gridPosToScreenPos(slot0)
	return cc.p(slot0.x * gridSizeX(), slot0.y * gridSizeY())
end

function screenPosToGridPos(slot0)
	return cc.p(slot0.x / gridSizeX(), slot0.y / gridSizeY())
end

function SkillAct.normalFinish(slot0)
	return cc.CallFunc:create(function ()
		BattleController:getInstance():getModel():actFinish(uv0)
	end)
end

function SkillAct.normalStart(slot0)
	return cc.CallFunc:create(function ()
		BattleController:getInstance():getModel():actStart(uv0)
	end)
end

function SkillAct.addDelay(slot0, slot1, slot2, slot3)
	if slot1 == 0 or slot1 == nil then
		if slot3 == 0 or slot3 == nil then
			return cc.Sequence:create(SkillAct.normalStart(slot0), slot2, SkillAct.normalFinish(slot0))
		else
			return cc.Sequence:create(SkillAct.normalStart(slot0), slot2, cc.DelayTime:create(slot3 / 30), SkillAct.normalFinish(slot0))
		end
	elseif slot3 == 0 or slot3 == nil then
		return cc.Sequence:create(SkillAct.normalStart(slot0), cc.DelayTime:create(slot1 / 30), slot2, SkillAct.normalFinish(slot0))
	else
		return cc.Sequence:create(SkillAct.normalStart(slot0), cc.DelayTime:create(slot1 / 30), slot2, cc.DelayTime:create(slot3 / 30), SkillAct.normalFinish(slot0))
	end
end

function SkillAct.dt(slot0)
	return cc.DelayTime:create(slot0 / display.DEFAULT_FPS * 2)
end

function SkillAct.changeRotation(slot0, slot1)
	slot2 = cc.p(slot0:getPosition())
	slot3 = {
		x = slot2.x - slot1.x,
		y = slot2.y - slot1.y
	}

	slot0:setRotation(-(math.atan(slot3.y / slot3.x) * 180 / math.pi))
end

function SkillAct.move(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = cc.CallFunc:create(function ()
	end)
	slot10 = cc.CallFunc:create(function ()
	end)

	if not slot1.is_die and BattleController:getInstance():getModel():getBuffTag(slot0.pos) then
		doStopAllActions(slot1.root)
	end

	if slot7 then
		return cc.Sequence:create(slot9, cc.DelayTime:create(slot8 / display.DEFAULT_FPS), cc.EaseExponentialOut:create(cc.MoveTo:create(slot4 / display.DEFAULT_FPS, slot3)), slot10)
	else
		return cc.Sequence:create(slot9, cc.Spawn:create(slot12, slot9), slot10)
	end
end

function SkillAct.MoveTo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	return SkillAct.addDelay(slot0, slot5, SkillAct.move(slot0, slot1, slot2, slot4, slot6, slot3, slot7, slot8, slot9))
end

function SkillAct.moveBack(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	return SkillAct.addDelay(slot0, slot5, SkillAct.move(slot0, slot1, slot2, slot4, slot6, slot3, slot7, slot8, slot9))
end

function SkillAct.shakeScreen(slot0, slot1, slot2)
	return SkillAct.addDelay(slot0, slot1, cc.CallFunc:create(function ()
		BattleController:getInstance():getModel():getBattleScene():shakeScreen(uv0)
	end))
end

function SkillAct.attack(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = slot4 and cc.CallFunc:create(slot4) or nil

	BattleController:getInstance():getModel():actStart(slot0)

	slot0.spine_renderer.is_attack = slot2

	if slot0.shout_trick ~= nil and slot9 ~= "" and not BattleController:getInstance():getIsNoramalBattle() then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.BATTLE, slot9, false)
	end

	if slot8 == nil then
		return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(SkillAct.setAnimationWithEvent(slot0, slot2, slot3, slot0.spine_renderer, false, slot5, slot6, slot7)))
	else
		return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(slot8, SkillAct.setAnimationWithEvent(slot0, slot2, slot3, slot0.spine_renderer, false, slot5, slot6, slot7)))
	end
end

function SkillAct.noActAttack(slot0, slot1, slot2, slot3, slot4)
	BattleController:getInstance():getModel():actStart(slot0)

	slot0.spine_renderer.is_no_attack = TRUE

	if (slot3 and cc.CallFunc:create(slot3) or nil) == nil then
		return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(SkillAct.setNotAnimationWithEvent(slot0, slot2, slot0.spine_renderer)), slot4)
	else
		return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(slot5, SkillAct.setNotAnimationWithEvent(slot0, slot2, slot0.spine_renderer)), slot4)
	end
end

function SkillAct.setNotAnimationWithEvent(slot0, slot1, slot2)
	return cc.CallFunc:create(function ()
		if uv0 then
			uv0()

			uv1.is_no_attack = nil

			BattleController:getInstance():getModel():actFinish(uv2)
		end
	end)
end

function SkillAct.ready(slot0, slot1, slot2, slot3)
end

function SkillAct.aid_hurt(slot0, slot1, slot2, slot3)
	function slot4(slot0)
		uv0:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
			if not uv0.is_die then
				SkillAct.setAnimation(uv0, uv0.stand, true)
			end

			uv0.in_act = false

			uv0:reverse(uv0.obj_type)
			uv0:setPosByGrid(uv0.grid_pos_back)
			BattleController:getInstance():getModel():actFinish(uv1)
		end)))
	end

	slot1:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
		SkillAct.setAnimation(uv0, uv1, false, uv2)
	end)))
end

function SkillAct.blackScreen(slot0, slot1, slot2, slot3, slot4)
	return cc.Sequence:create(SkillAct.dt(slot1), cc.Sequence:create(cc.CallFunc:create(slot3), cc.DelayTime:create(slot2 / display.DEFAULT_FPS), cc.CallFunc:create(slot4)))
end

function SkillAct.shadow(slot0, slot1, slot2, slot3, slot4)
	return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(cc.CallFunc:create(slot3), cc.DelayTime:create(slot2 / display.DEFAULT_FPS), cc.CallFunc:create(slot4)))
end

function SkillAct.hide(slot0, slot1)
	return SkillAct.addDelay(slot0, slot1, cc.Hide:create())
end

function SkillAct.show(slot0, slot1)
	return SkillAct.addDelay(slot0, slot1, cc.Show:create())
end

function SkillAct.showUI(slot0, slot1)
	return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(cc.CallFunc:create(function ()
		uv0.spine_renderer:showHpRoot(true)
	end)))
end

function SkillAct.hideUI(slot0, slot1)
	return SkillAct.addDelay(slot0, slot1, cc.Sequence:create(cc.CallFunc:create(function ()
		uv0.spine_renderer:showHpRoot(false)
	end)))
end

function SkillAct.jump(slot0, slot1, slot2, slot3, slot4, slot5)
	return SkillAct.addDelay(slot0, slot1, cc.JumpTo:create(slot2 * 2 / display.DEFAULT_FPS, slot3, slot4, slot5))
end

function SkillAct.clearAllEffect(slot0)
	if slot0 then
		if not slot0.clear_count then
			slot0.clear_count = 0
		end

		if slot0.effect_list and (slot0.effect_list or {}) ~= nil then
			for slot4, slot5 in pairs(slot0.effect_list or {}) do
				if slot5 then
					slot0.clear_count = slot0.clear_count + 1

					for slot9, slot10 in pairs(slot5) do
						if slot10.object then
							slot10.object:release(true)
						end
					end
				end
			end

			if tableLen(slot0.effect_list or {}) <= slot0.clear_count then
				slot0.effect_list = nil
				slot0.clear_count = 0
			end
		end
	end
end

function SkillAct.clearEffect(slot0, slot1)
	slot3 = Config.SkillData.data_get_buff[slot1]

	if slot0.spine_renderer == nil or slot3 == nil then
		return
	end

	if Config.SkillData.data_get_effect_data[slot3.res] == nil then
		return
	end

	if slot0:getFashionId() ~= 0 and Config.PartnerSkinData.data_bufftospine[getNorKey(slot5, slot1)] and slot6.effect_bid and slot6.effect_bid ~= 0 then
		slot4 = Config.SkillData.data_get_effect_data[slot6.effect_bid]
	end

	if next(slot2.effect_list or {}) ~= nil and next(slot2.effect_list[slot4.res_up] or {}) ~= nil and slot2.effect_list[slot4.res_up] then
		slot6 = PlayerAction.action

		if slot2.effect_list[slot4.res_up][(slot4.up_action_name == "" or slot4.up_action_name) and PlayerAction.action] ~= nil then
			slot2.effect_list[slot4.res_up][slot6].num = slot2.effect_list[slot4.res_up][slot6].num - 1
			slot7 = true
			slot11 = slot4.res_up

			for slot11, slot12 in pairs(slot2.effect_list[slot11]) do
				if slot12.num ~= 0 then
					slot7 = false

					break
				end
			end

			if slot7 == true then
				slot11 = slot4.res_up

				for slot11, slot12 in pairs(slot2.effect_list[slot11]) do
					if slot12.object then
						slot12.object:release(true)
					end
				end

				slot2.effect_list[slot4.res_up] = nil
			end
		end
	end

	if next(slot2.effect_list or {}) ~= nil and next(slot2.effect_list[slot4.res_down] or {}) ~= nil and slot2.effect_list[slot4.res_down] then
		slot6 = PlayerAction.action

		if slot2.effect_list[slot4.res_down][(slot4.down_action_name == "" or slot4.down_action_name) and PlayerAction.action] ~= nil then
			slot2.effect_list[slot4.res_down][slot6].num = slot2.effect_list[slot4.res_down][slot6].num - 1
			slot7 = true
			slot11 = slot4.res_down

			for slot11, slot12 in pairs(slot2.effect_list[slot11]) do
				if slot12.num ~= 0 then
					slot7 = false

					break
				end
			end

			if slot7 == true then
				slot11 = slot4.res_down

				for slot11, slot12 in pairs(slot2.effect_list[slot11]) do
					if slot12.object then
						slot12.object:release(true)
					end
				end

				slot2.effect_list[slot4.res_down] = nil
			end
		end
	end
end

function SkillAct.effectHitUser(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)
	slot14 = {
		99,
		-99
	}
	slot15 = {}

	if not slot2.effect_list then
		slot2.effect_list = {}
	end

	slot16 = Config.SkillData.data_get_effect_data[slot12]

	for slot20, slot21 in ipairs(slot3) do
		if slot3[slot20] and slot3[slot20] ~= "" then
			if slot2.effect_list[slot3[slot20]] == nil then
				slot2.effect_list[slot3[slot20]] = {}
			end

			slot22 = PlayerAction.action

			if slot16 then
				if slot20 == 1 then
					if slot16.up_action_name ~= "" then
						slot22 = slot16.up_action_name
					end
				elseif slot20 == 2 and slot16.down_action_name ~= "" then
					slot22 = slot16.down_action_name
				end
			end

			if slot2.effect_list[slot3[slot20]][slot22] == nil then
				slot2.effect_list[slot3[slot20]][slot22] = {
					num = 1
				}
				slot23 = nil
				slot24 = slot2.bottom_effect_root

				if slot20 == 1 then
					slot23 = cc.p(slot7, slot6)
					slot24 = slot2.top_effect_root
				else
					slot23 = cc.p(slot7, 0)
				end

				slot25 = cc.CallFunc:create(function ()
					if uv0 then
						uv0()
					end
				end)

				if tolua.isnull(slot2.root) then
					return
				end

				if slot22 ~= "" then
					slot15[slot20] = SpineRenderer.New(slot23, slot3[slot20], slot8, false, slot22)

					slot15[slot20]:reverse(slot4)
					slot15[slot20].spine_root:setAnchorPoint(cc.p(1, 0))

					slot15[slot20].bid = slot12

					slot15[slot20]:addToLayer(slot24, 1)

					slot2.effect_list[slot3[slot20]][slot22].object = slot15[slot20]

					slot15[slot20]:runAction(cc.Sequence:create(cc.DelayTime:create(slot1 / display.DEFAULT_FPS * 2), slot25, SkillAct.setAnimaWithEventFinish(slot0, slot22, nil, function ()
						if uv0 == TRUE and next(uv1.effect_list or {}) ~= nil and uv1.effect_list[uv2[uv3]] and uv1.effect_list[uv2[uv3]][uv4] ~= nil then
							uv1.effect_list[uv2[uv3]][uv4].num = uv1.effect_list[uv2[uv3]][uv4].num - 1

							if uv1.effect_list[uv2[uv3]][uv4].num == 0 then
								uv1.effect_list[uv2[uv3]][uv4].object:release(true)

								uv1.effect_list[uv2[uv3]][uv4] = nil
							end
						end
					end, slot15[slot20], slot5 ~= TRUE)))
				end
			else
				slot2.effect_list[slot3[slot20]][slot22].num = slot2.effect_list[slot3[slot20]][slot22].num + 1
			end
		end
	end
end

function SkillAct.effectSpineUser(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13)
	slot14 = {
		99,
		-999
	}
	slot15 = {}
	slot16 = slot12

	if slot13 ~= nil and slot13 ~= 0 then
		slot16 = slot13
	end

	if not slot0 or not slot0.spine_renderer or not slot0.spine_renderer.root or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	if not slot2.effect_list then
		slot2.effect_list = {}
	end

	slot17 = false

	for slot21, slot22 in pairs(slot3) do
		if slot3[slot21] and slot3[slot21] ~= "" then
			if slot2.effect_list[slot3[slot21]] == nil then
				slot2.effect_list[slot3[slot21]] = {}
			end

			slot23 = PlayerAction.action

			if Config.SkillData.data_get_effect_data[slot16] then
				if slot21 == 1 then
					if slot24.up_action_name ~= "" then
						slot23 = slot24.up_action_name
					end
				elseif slot21 == 2 and slot24.down_action_name ~= "" then
					slot23 = slot24.down_action_name
				end
			end

			if slot2.effect_list[slot3[slot21]][slot23] == nil then
				slot2.effect_list[slot3[slot21]][slot23] = {
					num = 1
				}
				slot25 = nil
				slot26 = slot2.bottom_effect_root

				if slot21 == 1 then
					slot25 = cc.p(slot7, slot6)
					slot26 = slot2.top_effect_root
				else
					slot25 = cc.p(slot7, 0)
					slot17 = true
				end

				slot27 = cc.CallFunc:create(function ()
					if uv0 then
						uv0()
					end
				end)

				if tolua.isnull(slot2.root) then
					return
				end

				slot28 = slot8

				if slot0 and slot0.object_type ~= BattleObjectType.Elfin and slot0.spine_renderer and not tolua.isnull(slot0.spine_renderer.root) then
					slot29 = slot2.root:getLocalZOrder() + slot14[slot21]

					if slot24 and slot24.is_fornt == TRUE then
						slot29 = slot0.spine_renderer.root:getLocalZOrder() - 999
						slot17 = true
					end

					if slot17 == false then
						slot0.spine_renderer.root:setLocalZOrder(slot29)
					end
				end

				slot15[slot21] = SpineRenderer.New(slot25, slot3[slot21], slot28, false, slot23)

				slot15[slot21]:reverse(slot4)
				slot15[slot21].spine_root:setAnchorPoint(cc.p(1, 0))
				slot15[slot21]:addToLayer(slot26, 1)

				slot2.effect_list[slot3[slot21]][slot23].object = slot15[slot21]

				slot15[slot21]:runAction(cc.Sequence:create(cc.DelayTime:create(slot1 / display.DEFAULT_FPS * 2), slot27, SkillAct.setAnimaWithEventFinish(slot0, slot23, nil, function ()
					if uv0 == TRUE and next(uv1.effect_list or {}) ~= nil and uv1.effect_list[uv2[uv3]] ~= nil and uv1.effect_list[uv2[uv3]][uv4] ~= nil then
						uv1.effect_list[uv2[uv3]][uv4].num = uv1.effect_list[uv2[uv3]][uv4].num - 1

						if uv1.effect_list[uv2[uv3]][uv4].num == 0 then
							uv1.effect_list[uv2[uv3]][uv4].object:release(true)

							uv1.effect_list[uv2[uv3]][uv4] = nil
						end
					end
				end, slot15[slot21], slot5 ~= TRUE)))
			else
				slot2.effect_list[slot3[slot21]][slot23].num = slot2.effect_list[slot3[slot21]][slot23].num + 1
			end
		end
	end
end

function SkillAct.effectArea(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot7 == nil then
		slot7 = true
	end

	slot9 = {
		BattleController:getInstance():getCtrlBattleScene().effect_layer_1,
		BattleController:getInstance():getCtrlBattleScene().effect_layer_2
	}
	slot10 = {
		2,
		-2
	}
	slot11 = {}
	slot12 = {}
	slot13 = false
	slot14 = Config.SkillData.data_get_effect_data[slot6]

	for slot18, slot19 in ipairs(slot1) do
		if slot1[slot18] and slot1[slot18] ~= "" then
			slot20 = PlayerAction.action

			if slot14 then
				if slot18 == 1 then
					if slot14.up_action_name ~= "" then
						slot20 = slot14.up_action_name
					end
				elseif slot18 == 2 and slot14.down_action_name ~= "" then
					slot20 = slot14.down_action_name
				end
			end

			slot11[slot18] = SpineRenderer.New(slot4, slot1[slot18], 1, false, slot20)

			slot11[slot18]:reverse(slot2)
			slot11[slot18]:addToLayer(slot9[slot18], slot10[slot18])

			if slot3 == FALSE then
				BattleController:getInstance():getModel():addSceneBuffEffect(slot8 or slot0.group, slot6, slot1[slot18], slot11[slot18], slot20)
			end

			function slot21(slot0)
				if uv0 == TRUE then
					uv1[uv2]:release(true, uv3.play_stand)

					uv3.in_area_effect = nil
				end

				if uv4 == true then
					BattleController:getInstance():getModel():actFinish(uv3)
				end
			end

			if slot7 == true then
				BattleController:getInstance():getModel():actStart(slot0)
			end

			slot22 = nil

			slot11[slot18]:runAction(SkillAct.setAnimaWithEventFinish(slot0, slot20, (true or function ()
				if uv0 then
					uv0()
				end
			end) and nil, slot21, slot11[slot18], slot3 == FALSE))

			if slot7 == true then
				slot0.in_area_effect = true
			end
		end
	end
end

function SkillAct.miss(slot0, slot1, slot2)
	if slot1.in_act then
		return
	end

	BattleController:getInstance():getModel():actStart(slot0)

	slot1.in_act = true
	slot4 = 0.3
	slot5 = 0.3

	slot1:runAction(cc.Sequence:create(cc.Spawn:create(SkillAct.fadeOut(slot0, slot1, 0, slot4 * display.DEFAULT_FPS / 2), cc.MoveTo:create(slot4, slot2)), cc.DelayTime:create(0), cc.Spawn:create(SkillAct.fadeIn(slot0, slot1, 0, slot5 * display.DEFAULT_FPS / 2), cc.MoveTo:create(slot5, cc.p(slot1.root:getPosition()))), cc.CallFunc:create(function ()
		SkillAct.setAnimation(uv0, uv0.stand, true)

		uv0.in_act = false

		BattleController:getInstance():getModel():actFinish(uv1)
	end)))
end

function SkillAct.playBuffAbsorbHurt(slot0, slot1)
	if slot0 == nil or slot0.spine_renderer == nil or tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot2 = slot0.spine_renderer.role_height / 2

	createSprite(PathTool.getResFrame("battle_num", "txt_cn_battle_xishou"), 0, 0, ViewManager:getInstance():getLayerByTag(ViewMgrTag.EFFECT_TAG), cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 99):setCascadeOpacityEnabled(true)

	if slot0.absorb_hurt_delay == nil then
		slot0.absorb_hurt_delay = 0
	end

	slot0.absorb_hurt_delay = slot0.absorb_hurt_delay + 1
	slot7 = SkillAct.getBmpFont(slot1, 25)

	slot7:setAnchorPoint(cc.p(0, 0.5))
	slot7:setPosition(cc.p(88, 42))
	slot4:addChild(slot7)
	slot4:setOpacity(100)
	slot4:setVisible(false)

	slot9 = slot3:convertToNodeSpace(slot0.spine_renderer.root:convertToWorldSpace(cc.p(0, 0)))

	slot4:setPosition(slot9.x, slot9.y + slot2)
	slot4:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
		uv0:setVisible(true)
	end), cc.DelayTime:create(slot0.absorb_hurt_delay % 3 * 0.3), cc.Spawn:create(cc.MoveTo:create(0.4, cc.p(slot9.x, slot4:getPositionY() + 50)), cc.FadeIn:create(0.4)), cc.Spawn:create(cc.FadeTo:create(1.1, 100), cc.MoveTo:create(1.1, cc.p(slot9.x, slot4:getPositionY() + 75))), cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
		if uv0 then
			uv0:DeleteMe()

			uv0 = nil
		end
	end), cc.RemoveSelf:create()))
end

function SkillAct.playDmgMessage(slot0, slot1, slot2, slot3, slot4)
	if not slot0 or not slot0.spine_renderer then
		return
	end

	if slot0.hurt_delay == nil then
		slot0.hurt_delay = 0
	end

	slot7 = cc.DelayTime:create(slot0.hurt_delay % 3 == 0 and slot0.hurt_delay % 3 / 6 or 0)
	slot0.hurt_delay = slot0.hurt_delay + 1

	if slot1 == 0 or slot1 == nil then
		return
	end

	slot8, slot9 = nil

	function slot10()
		if uv0 ~= nil then
			if uv0.num ~= nil then
				uv0.num:setVisible(false)
				uv0.num:DeleteMe()
			end

			uv0:setVisible(false)
			uv0:removeAllChildren()
			uv0:removeFromParent()

			uv0 = nil
		end

		if uv1.last_msg == uv0 then
			uv1.last_msg = nil
		end
	end

	if tolua.isnull(slot0.spine_renderer.root) then
		return
	end

	slot11 = cc.p(slot0.spine_renderer.root:getPosition())
	slot12 = 1

	if slot2 == 2 then
		slot8 = ccui.Widget:create()
		slot13 = createSprite(PathTool.getResFrame("battle_num", "txt_cn_battle_baoji"), 85, 10, slot8, cc.p(1, 0.5))

		slot13:setPosition(60, 70)

		slot9 = SkillAct.getBmpFont(slot1, 7)

		slot9:setAnchorPoint(cc.p(0, 0))
		slot9:setPosition(cc.p(62, 75))
		slot8:addChild(slot9)

		slot8.num = slot9
		slot8.scale = 0.5
		slot8.width = slot13:getContentSize().width + slot9:getContentSize().width / 4

		if slot0.group == BattleGroupTypeConf.TYPE_GROUP_ROLE then
			slot8.x_fix = 30
		end

		slot12 = 1
	elseif slot1 < 0 and slot2 ~= 2 then
		slot8 = ccui.Widget:create()
		slot9 = (slot3 ~= true or SkillAct.getBmpFont(slot1, 24)) and (not slot4 or slot4 ~= 1 or SkillAct.getBmpFont(slot1, 27)) and SkillAct.getBmpFont(slot1, 4)

		slot9:setAnchorPoint(cc.p(0.5, 0))
		slot9:setPosition(cc.p(105, 45))
		slot8:addChild(slot9)

		slot8.num = slot9
	else
		slot8 = ccui.Widget:create()
		slot9 = SkillAct.getBmpFont(slot1, 2)

		slot9:setAnchorPoint(cc.p(0.5, 0))
		slot9:setPosition(cc.p(105, 45))
		slot8:addChild(slot9)

		slot8.num = slot9
	end

	if slot8 then
		slot8.x_fix = slot8.x_fix or 0
		slot15 = ViewManager:getInstance():getLayerByTag(ViewMgrTag.EFFECT_TAG):convertToNodeSpace(slot0.spine_renderer.root:convertToWorldSpace(cc.p(0, 0)))

		slot8:setPosition(slot15.x + slot8.x_fix - 90, slot15.y + slot0.spine_renderer.role_height + (slot0.dmg_index or 0) * 15 + (slot0.dmg_aid_y_offset or 0))
		slot13:addChild(slot8, 10)
		slot8:setVisible(false)

		slot18 = BattleController:getInstance()

		slot8:runAction(cc.Sequence:create(slot7, cc.Show:create(), cc.Sequence:create(cc.ScaleTo:create(slot18:getActTime("hurt_num_scale_time1") / display.DEFAULT_FPS, slot18:getActTime("hurt_num_bigger") * slot8.num.scale), cc.ScaleTo:create(slot18:getActTime("hurt_num_scale_time2") / display.DEFAULT_FPS, slot18:getActTime("hurt_num_bigger2")), cc.ScaleTo:create(slot18:getActTime("hurt_num_scale_time3") / display.DEFAULT_FPS, slot18:getActTime("hurt_num_smaller")), cc.ScaleTo:create(slot18:getActTime("hurt_num_scale_time4") / display.DEFAULT_FPS, slot18:getActTime("hurt_num_bigger3")), cc.DelayTime:create(slot18:getActTime("hurt_num_delay_time") / display.DEFAULT_FPS), cc.Spawn:create(cc.MoveBy:create(slot18:getActTime("hurt_num_move_time") / display.DEFAULT_FPS, cc.p(0, slot18:getActTime("hurt_num_move_distance"))), cc.FadeOut:create(slot18:getActTime("hurt_num_hide_time") / display.DEFAULT_FPS))), cc.CallFunc:create(slot10)))
	end
end

function SkillAct.fadeOut(slot0, slot1, slot2, slot3)
	slot3 = slot3 * 2 / display.DEFAULT_FPS

	return SkillAct.addDelay(slot0, slot2, cc.CallFunc:create(function ()
		uv0:runAction(cc.FadeOut:create(uv1))
	end))
end

function SkillAct.fadeIn(slot0, slot1, slot2, slot3)
	slot3 = slot3 * 2 / display.DEFAULT_FPS

	return SkillAct.addDelay(slot0, slot2, cc.CallFunc:create(function ()
		uv0:runAction(cc.FadeIn:create(uv1))
	end))
end

function SkillAct.leftRight(slot0, slot1, slot2)
	slot2 = slot2 or 10
	slot3 = (slot0 or 1) / (slot1 or 1)
	slot4 = {}

	for slot8 = 1, slot1 do
		table.insert(slot4, cc.Sequence:create(cc.MoveBy:create(slot3 / 2, cc.p(slot2 / 2, 0)), cc.MoveBy:create(slot3 / 2, cc.p(-slot2 / 2, 0))))
	end

	return cc.Sequence:create(unpack(slot4))
end

function SkillAct.hurt(slot0, slot1, slot2, slot3, slot4)
	if slot2 and slot2.play_hurt_ing == true then
		return
	end

	slot2.play_hurt_ing = true

	if slot4 == nil then
		slot4 = true
	end

	if not tolua.isnull(slot0.spine_renderer.root) and not tolua.isnull(slot1.root) then
		slot5 = 0.02
		slot6 = 0.05
		slot7 = 0.2
		slot8 = 18 * slot2.obj_type
		slot1.in_hurt_act = true

		if slot1.res then
			slot9 = slot1.res

			if slot1.is_change_status == true and slot1.buff_spine then
				slot9 = slot1.buff_spine
			end

			if not tolua.isnull(slot1.spine) then
				slot1.spine:runAction(cc.RemoveSelf:create(true))
			end

			slot10 = nil
			slot10 = createSpineByName(slot9, slot3)
			slot1.spine = slot10

			slot1:setActionName(slot3)
			slot1:reverse(slot1.obj_type)
			slot1:addChild(slot10)
		end

		if slot4 == true and (slot0.hit_sound or "") ~= "" and not BattleController:getInstance():getIsNoramalBattle() then
			AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.BATTLE, slot9, false)
		end

		slot1.spine:registerSpineEventHandler(function (slot0)
			if not BattleController:getInstance():getIsNoramalBattle() then
				SkillAct.setAnimation(uv0, uv0.stand, true, nil, , uv1)
			end

			uv0.in_hurt_act = false
		end, sp.EventType.ANIMATION_COMPLETE)
		slot1:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			if uv0.in_hurt_act == true and uv0.spine then
				uv0.spine:setAnimation(0, uv1, false)
				uv0.spine:setToSetupPose()
			end
		end), cc.MoveBy:create(slot5, cc.p(-slot8, 0)), cc.DelayTime:create(slot7), cc.MoveBy:create(slot6, cc.p(slot8, 0)), cc.CallFunc:create(function ()
			uv0.is_hurt_play = false
			uv0.play_hurt_ing = false
		end)))
	end
end

function SkillAct.setAnimationWithEvent(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	return cc.CallFunc:create(function ()
		function slot0(slot0)
			if (slot0.eventData.name == "hit" or slot0.eventData.name == "Hit" or slot0.eventData.name == "HIT") and uv0.hit_time < uv0.hit_num and uv1 ~= nil then
				uv1()

				uv0.hit_time = uv0.hit_time + 1
			elseif uv0.is_attack == uv2 and (slot0.eventData.name == "back" or slot0.eventData.name == "Back" or slot0.eventData.name == "BACK") then
				slot2 = uv3.anime_res

				if (uv3.is_move_map or 0) == FALSE then
					slot3 = uv3.spine_renderer.res

					if uv3.spine_renderer.buff_spine then
						slot3 = uv3.spine_renderer.buff_spine
					end

					if (Config.BattleActData.data_info[slot3] or Config.BattleActData.data_info[0]) and (slot4[slot2] or Config.BattleActData.data_info[0].action1) then
						if (slot5[uv3.spine_renderer.anima_name] or slot5.action1) == nil then
							slot6 = Config.BattleActData.data_info[0].action1.action1
						end

						if slot6 then
							BattleController:getInstance():getModel():moveBack(uv3, slot6.back_delay_time, slot6.back_move_time, slot6.back_model_x, nil, , , , slot6.is_move_map)
						end
					end
				end

				uv0.is_attack = nil
			elseif slot0.eventData.name == "attack" then
				if uv3.in_area_effect then
					uv0.is_area_attack = true
					uv0.hit_time = uv0.hit_time + 1

					if uv3.in_area_effect and uv0 ~= uv3.spine_renderer then
						uv3.area_hit_time = uv0.hit_time
					end

					BattleController:getInstance():getModel():areaHurt(uv3)
				elseif uv4 then
					uv4()
				end

				BattleController:getInstance():getModel():attackPoint(uv3, uv2)
			elseif slot0.eventData.name == "hit_none" then
				BattleController:getInstance():getModel():actHurt(uv3)
			elseif slot0.eventData.name == "hit_big" then
				BattleController:getInstance():getModel():actHurt(uv3, true)
			elseif slot0.eventData.name == "ready" then
				BattleController:getInstance():getModel():attackReady(uv3)
			elseif slot0.eventData.name == "shake_point" then
				if uv3.shake_id ~= 0 and uv3.shake_id ~= nil then
					BattleController:getInstance():getModel():playShakeScreen(uv3.shake_id)
				end
			elseif slot0.eventData.name == "move" then
				slot2 = uv3.anime_res

				if (uv3.is_move_map or FALSE) == FALSE then
					slot3 = uv3.spine_renderer.res

					if uv3.spine_renderer.buff_spine then
						slot3 = uv3.spine_renderer.buff_spine
					end

					if (Config.BattleActData.data_info[slot3] or Config.BattleActData.data_info[0]) and (slot4[slot2] or Config.BattleActData.data_info[0].action1) then
						if (slot5[uv3.spine_renderer.anima_name] or slot5.action1) == nil then
							slot6 = Config.BattleActData.data_info[0].action1.action1
						end

						if slot6 then
							if slot6.shadow_time ~= 0 and slot6.shadow_time ~= nil then
								BattleController:getInstance():getModel():shadow2(uv3, slot6.shadow_time, slot2, uv3.spine_renderer.anima_name)
							end

							if slot6.is_move_area == TRUE then
								BattleController:getInstance():getModel():moveToArea(uv3, slot6.move_delay_time, slot6.move_time, slot6.move_model_x, slot6.move_model_y, nil, , , slot6.is_move_map, slot6.is_reverse)
							else
								BattleController:getInstance():getModel():moveTo(uv3, slot6.move_delay_time, slot6.move_time, slot6.move_model_x, slot6.move_model_y, nil, , , , slot6.is_move_map, slot6.is_reverse, slot6.is_col_act)
							end
						end
					end
				end
			elseif string.find(slot0.eventData.name, "hit_num") and tonumber(string.sub(slot0.eventData.name, 8)) and slot1 > 1 then
				uv0.hit_num = slot1

				if uv3.in_area_effect and uv0 ~= uv3.spine_renderer then
					uv3.area_hit_num = slot1
				end

				BattleController:getInstance():getModel():calcMagicHurt(uv3)
			end
		end

		function slot1(slot0)
			if slot0.animation == uv0 then
				if uv1.hit_time < uv1.hit_num and uv2 ~= nil then
					uv2()

					uv1.hit_time = uv1.hit_time + 1

					if uv3.in_area_effect and uv1 ~= uv3.spine_renderer then
						uv3.area_hit_time = uv1.hit_time
					end
				end

				if uv3.play_stand == 1 then
					SkillAct.setAnimation(uv1, uv1.stand, true)
				end

				uv1.is_area_attack = nil

				delayOnce(function ()
					BattleController:getInstance():getModel():actFinish(uv0)
				end, 0.1)
				uv3.spine_renderer:showHallowsState(true)

				uv1.in_animation = false

				uv3:reTryChangeSpine()
			end
		end

		SkillAct.setAnimation(uv0, uv2, uv6, function (slot0)
			uv0.hit_time = 0
			uv0.hit_num = math.max(1, uv1.split_hurt or 1)
			uv0.split_hurt = math.max(1, uv1.split_hurt or 1)
			uv0.current_anime = uv2
			uv0.in_animation = true

			if uv3 then
				uv0:reverse(-uv0.obj_type)
			end

			slot0:registerSpineEventHandler(uv4, sp.EventType.ANIMATION_EVENT)
			slot0:registerSpineEventHandler(uv5, sp.EventType.ANIMATION_COMPLETE)
		end, uv7, uv3)
	end)
end

function SkillAct.setAnimation(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot0:getActionName()

	if slot1 and string.find(slot1, "E") == nil and slot0:getActionRes() ~= slot4 and slot0.res and slot0.res ~= "" then
		slot8 = slot0.res

		if slot0.is_change_status and slot0.buff_spine then
			slot8 = slot0.buff_spine
		end

		slot9 = nil
		slot9 = createArmature(slot8, slot4 or slot1)

		if not tolua.isnull(slot0.spine) then
			slot0.spine:runAction(cc.RemoveSelf:create(true))
		end

		slot0.spine = slot9

		slot0:setActionName(slot1, slot4)
		slot0:reverse(slot0.obj_type)

		if not tolua.isnull(slot9) ~= nil and slot9 then
			if slot0.spine_type == BattleObjectType.Hallows then
				slot0.spinex_root:addChild(slot9)
			else
				slot0:addChild(slot9)
			end
		end
	end

	slot0.anima_name = slot1

	if slot0.spine then
		slot0.spine:setAnimation(0, slot1, slot2)
		slot0.spine:setToSetupPose()
	end

	if slot3 then
		slot3(slot0.spine)
	end
end

function SkillAct.flyEffect(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	return cc.Sequence:create(SkillAct.dt(slot6 / display.DEFAULT_FPS), cc.CallFunc:create(function ()
		BattleController:getInstance():getModel():actStart(uv0)

		slot0 = PlayerAction.action

		if Config.SkillData.data_get_effect_data[uv1] and slot1.up_action_name ~= "" then
			slot0 = slot1.up_action_name
		end

		slot2 = SpineRenderer.New(cc.p(0, 0), uv2, nil, false, slot0)

		slot2:reverse(uv0.obj_type)
		slot2:addToLayer(uv3.root:getParent(), uv3.root:getLocalZOrder())

		slot5 = FALSE
		slot2.shadow_data = {
			num = 4,
			speed = 0.07,
			shadow_opacity = 40,
			shadow_offset = 40
		}

		SkillAct.setAnimation(slot2, slot0, true)
		slot2:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			slot0 = cc.p(uv0.root:getPosition())
			slot0.y = slot0.y + uv1
			slot0.x = slot0.x

			uv2.root:setPosition(slot0)

			if uv3 == TRUE then
				SkillAct.createItemShadow(uv2, uv4, uv5, uv6)
			end
		end), cc.Sequence:create(cc.CallFunc:create(function ()
			uv0.root:setLocalZOrder(SCREEN_HEIGHT + uv1.y + 999)
		end), cc.MoveTo:create(uv5 / display.DEFAULT_FPS, uv6)), cc.CallFunc:create(function ()
			uv0:release()
			BattleController:getInstance():getModel():actFinish(uv1)
		end)))
	end))
end

function SkillAct.flyItem(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16)
	return cc.Sequence:create(SkillAct.dt(slot4.delay_time / display.DEFAULT_FPS), cc.CallFunc:create(function ()
		BattleController:getInstance():getModel():actStart(uv0)

		if uv1 ~= "" then
			slot0 = PlayerAction.action

			if Config.SkillData.data_get_effect_data[uv2] and slot1.up_action_name ~= "" then
				slot0 = slot1.up_action_name
			end

			slot2 = SpineRenderer.New(cc.p(0, 0), uv1, uv3, false, slot0)

			slot2:reverse(uv4)
			slot2:addToLayer(uv5.root:getParent(), uv5.root:getLocalZOrder())

			if uv6 then
				slot5 = uv7 or FALSE
				slot2.shadow_data = {
					num = uv6.shadow_num or 4,
					speed = uv6.speed_cut or 0.07,
					shadow_opacity = uv6.opacity or 40,
					shadow_offset = uv6.shadow_offset or 40
				}
			end

			slot5 = cc.CallFunc:create(function ()
				slot0 = cc.p(uv0.root:getPosition())
				slot0.y = slot0.y + uv1
				slot0.x = slot0.x

				uv2.root:setPosition(slot0)

				uv3.in_area_effect = true

				if uv4 == TRUE then
					SkillAct.createItemShadow(uv2, uv5, uv6, uv7, uv8)
				end
			end)
			slot7 = cc.CallFunc:create(function ()
				uv0:release()
				BattleController:getInstance():getModel():actFinish(uv1)

				uv1.in_area_effect = nil
			end)

			SkillAct.setAnimation(slot2, slot0, true)

			slot8, slot9 = nil
			slot10 = {}
			slot11 = uv10 or 0

			for slot16, slot17 in pairs(uv12) do
				slot18 = cc.p(uv5.root:getPosition())
				slot18.y = slot18.y + (uv11 or 0)

				table.insert(slot10, cc.Sequence:create(cc.CallFunc:create(function ()
					uv0.root:setLocalZOrder(SCREEN_HEIGHT + uv1.y + 999)
					SkillAct.changeRotation(uv0.root, uv2, uv3)
				end), cc.MoveTo:create(uv13.time_all * uv13.time_list[slot16 + 1] / uv13.time_list[1] / display.DEFAULT_FPS, cc.p(slot17.x + slot11, slot17.y - (slot17.y - slot18.y) * math.abs(slot11) / (slot17.x - slot18.x) * uv0.obj_type)), uv9 and cc.CallFunc:create(uv9) or nil))
			end

			if #slot10 ~= 0 then
				slot8 = cc.Sequence:create(unpack(slot10))
			end

			slot13 = nil

			if uv14 == TRUE then
				slot14 = cc.p(uv5.root:getPosition())
				slot14.y = slot14.y + uv8
				slot13 = cc.MoveTo:create(uv13.time_all * uv13.time_list[#uv12 + 2] / uv13.time_list[1] / display.DEFAULT_FPS, slot14)
			end

			slot2:runAction(cc.Sequence:create(slot5, slot8, slot13, slot7))
		end
	end))
end

function SkillAct.createItemShadow(slot0, slot1, slot2, slot3, slot4)
	if not slot0.shadow_data then
		return
	end

	if slot0.shadow_list == nil then
		slot0.shadow_list = {}

		for slot8 = 1, slot0.shadow_data.num do
			slot9 = ccui.Widget:create()

			slot9:setContentSize(cc.size(200, 100))
			slot9:setAnchorPoint(cc.p(0, 0))

			slot10 = createSpineByName(slot1)

			slot10:setTimeScale(1 - slot8 * slot0.shadow_data.speed)
			slot10:setAnchorPoint(cc.p(0, 0.5))
			slot10:setScaleX(slot4)
			slot10:setOpacity(255 - slot8 * slot0.shadow_data.shadow_opacity)
			slot10:setAnimation(0, slot2, true)
			slot10:setToSetupPose()
			slot9:addChild(slot10)
			slot9:setScale(1 - (slot8 - 1) * 0.1)
			slot9:setPositionX(-(slot8 - 1) * slot0.shadow_data.shadow_offset * slot4)
			slot0:addChild(slot9, slot3 - slot8)
			table.insert(slot0.shadow_list, slot10)
		end
	else
		for slot8, slot9 in pairs(slot0.shadow_list) do
			slot9:setVisible(true)
			slot9:setAnimation(0, slot2, true)
			slot9:setToSetupPose()
		end
	end
end

function SkillAct.createShadow(slot0, slot1, slot2)
	if not slot0.role_shadow_data then
		return
	end

	if slot0.role_shadow_list == nil then
		slot0.role_shadow_list = {}

		for slot6 = 1, slot0.role_shadow_data.num do
			slot7 = ccui.Widget:create()

			slot7:setContentSize(cc.size(200, 100))
			slot7:setAnchorPoint(cc.p(0, 0))

			slot8 = createSpineByName(slot0.res, slot1)

			setChildUnEnabled(true, slot8, Config.ColorData.data_color4[1])
			slot8:setAnchorPoint(cc.p(0, 0.5))
			slot8:setScaleX(slot0.obj_type)

			slot9 = 0

			slot8:setOpacity((type(slot0.role_shadow_data.alpha) ~= "table" or slot0.role_shadow_data.alpha[slot6]) and 255 - slot6 * slot0.role_shadow_data.alpha)
			slot8:setAnimation(0, slot2, true)
			slot8:setToSetupPose()
			slot7:addChild(slot8)

			if slot0.role_shadow_data.is_stand == TRUE then
				slot7:setPosition(slot0.root:getPosition())
			else
				slot10 = 0

				slot7:setPositionX(-((type(slot0.role_shadow_data.is_fix) ~= "table" or slot0.role_shadow_data.is_fix[slot6]) and slot0.role_shadow_data.is_fix) * slot0.obj_type)
			end

			slot0.root:addChild(slot7, slot0.root:getLocalZOrder() - 999)
			table.insert(slot0.role_shadow_list, slot8)
		end
	else
		for slot6, slot7 in pairs(slot0.role_shadow_list) do
			slot7:setVisible(true)
			slot7:setAnimation(0, slot2, true)
			slot7:setToSetupPose()
		end
	end
end

function SkillAct.setAnimaWithEventFinish(slot0, slot1, slot2, slot3, slot4, slot5)
	return cc.CallFunc:create(function ()
		uv0.spine:registerSpineEventHandler(function (slot0)
			if uv0.hit_time < uv0.hit_num and uv1 ~= nil then
				uv1()

				uv0.hit_time = uv0.hit_time + 1

				if uv2.in_area_effect and uv0 ~= uv2.spine_renderer then
					uv2.area_hit_time = uv0.hit_time
				end
			end

			if slot0.animation == uv3 and uv4 ~= nil then
				uv4(uv0)
			end
		end, sp.EventType.ANIMATION_COMPLETE)

		if uv1 then
			uv0.spine:registerSpineEventHandler(function (slot0)
				if (slot0.eventData.name == "hit" or slot0.eventData.name == "Hit" or slot0.eventData.name == "HIT") and uv0.hit_time < uv0.hit_num and uv1 ~= nil then
					uv1()

					uv0.hit_time = uv0.hit_time + 1

					if uv2.in_area_effect and uv0 ~= uv2.spine_renderer then
						uv2.area_hit_time = uv0.hit_time
					end
				elseif string.find(slot0.eventData.name, "hit_num") then
					if tonumber(string.sub(slot0.eventData.name, 8)) and slot1 > 1 then
						uv0.hit_num = slot1

						if uv2.in_area_effect and uv0 ~= uv2.spine_renderer then
							uv2.area_hit_num = slot1
						end

						BattleController:getInstance():getModel():calcMagicHurt(uv2)
					end
				elseif slot0.eventData.name == "hit_none" then
					BattleController:getInstance():getModel():actHurt(uv2)
				elseif slot0.eventData.name == "hit_big" then
					BattleController:getInstance():getModel():actHurt(uv2, true)
				end
			end, sp.EventType.ANIMATION_EVENT)
		end

		uv0.hit_time = 0
		uv0.hit_num = 1

		uv0.spine:setAnimation(0, uv3, uv5)
	end)
end

function SkillAct.getBmpFont(slot0, slot1, slot2)
	slot1 = slot1 or 1
	slot3 = 0.5

	if slot1 ~= 7 and not slot2 then
		if slot0 < 0 then
			CommonNum.new(slot1, nil, 0, 1, cc.p(0, 0)):setNum(math.abs(slot0), false)
		else
			slot5:setNum(slot4, true)
		end
	else
		slot5:setNum(slot4)
	end

	slot5.scale = slot3

	return slot5
end

function SkillAct.addSpine(slot0, slot1)
	if type(slot0) == "string" and slot0 ~= "" then
		slot3, slot4, slot5, slot6 = PathTool.getSpineByName(slot0, slot1)
		slot7 = BattleController:getInstance():getModel():resLoadStart(slot5)

		if display.isPrefixExist(slot6) then
			slot2:setRes(slot5)
		elseif slot7 then
			QueueManager:getInstance():add(slot0, "SkillAct", function ()
				cc.Director:getInstance():getTextureCache():addImageAsync(uv1, function ()
					uv0:resLoadFinish(uv1)
				end, getPixelFormat(uv0))
			end)
		end

		return
	end

	if type(slot0) == "table" then
		for slot5, slot6 in pairs(slot0) do
			SkillAct.addSpine(slot6)
		end
	end
end

function SkillAct.clearSpine()
	QueueManager:getInstance():remove("SkillAct")
end
