BattleHookModel = BattleHookModel or BaseClass();

function BattleHookModel.__init(slot0)
	slot0.act_playing = false;
	slot0.is_init = false;
	slot0.actor_plays_list = {};
	slot0.is_set_battle_type = false;
	slot0.all_object = {};
end

function BattleHookModel.initConfig(slot0)
	slot0.ctrl = BattleController:getInstance();
	slot0.battle_model = BattleController:getInstance():getModel();
end

function BattleHookModel.battleNormalStart(slot0, slot1)
	slot0.all_object = {};
	slot0.group = 0;
	slot0.act_playing = false;
	slot0.one = nil;
	slot0.round_data = {};
	slot0.round_data_temp = {};
	slot0.sum = 0;
	slot0.actor_sum = 0;
	slot0.actor_play_sum = 0;
	slot0.our_num = 0;
	slot0.is_real_battle_ready = false;
	slot0.res_num = 0;
	slot0.res_list = {};

	if slot1 then
		slot0:createBattleRole(slot1);
	end
end

function BattleHookModel.playEnd(slot0, slot1)
	if slot0.all_object and next(slot0.all_object or {}) ~= nil then
		BattleLoop2.playEnd(slot1);

		if slot0.all_object[slot1] ~= nil then
			slot0.all_object[slot1]:exitdeleteRole();
		end

		slot0.all_object[slot1] = nil;

		for slot5, slot6 in pairs(slot0.all_object) do
			if slot0.actor_plays_list[slot6.pos] and next(slot0.actor_plays_list[slot6.pos]) ~= nil then
				table.remove(slot0.actor_plays_list[slot6.pos], 1);

				if slot0.actor_plays_list[slot6.pos][1] then
					slot0:handleSkillPlayData(slot7);
				end
			end
		end
	end
end

function BattleHookModel.round(slot0)
	slot0.round_data_temp = {};
	slot0.second_data = nil;
	slot0.actor_sum = 0;
	slot0.actor_play_sum = 0;

	if tableLen(slot0.order_list or {}) == 0 then
		slot0.battle_model:cancleBlackScreen();

		if not slot0.is_real_battle_ready then
			slot0.act_playing = false;
		end
	else
		if not slot0.is_set_battle_type and BattleController:getInstance():getIsNoramalBattle() then
			slot0.ctrl:setExtendFightType(slot0.ctrl:getCurFightType());

			slot0.is_set_battle_type = true;
		end

		slot0.one = table.remove(slot0.order_list, 1);
		slot1 = slot0.round_data[slot0.one.order];

		if next(slot0.order_list or {}) ~= nil then
			slot0.second_data = slot0.round_data[slot0.order_list[1].order];
		end

		for slot5, slot6 in pairs(slot1 or {}) do
			for slot10, slot11 in pairs(slot6 or {}) do
				if #slot11.target_list > 0 then
					slot12 = nil;

					if next(slot0.all_object or {}) ~= nil and slot0.all_object[slot11.actor] then
						slot0.one.actor = slot11.actor;
						slot0.actor_sum = slot0.actor_sum + 1;

						if slot0.all_object[slot11.actor] and slot12.spine_renderer then
							slot0:initOrder(slot12, slot11);
						else
							slot0:round();
						end
					end
				else
					slot0:round();
				end
			end
		end
	end
end

function BattleHookModel.openNormalBattle(slot0, slot1, slot2)
	slot0.battle_model:clearAllObject();
	slot0:clearRole();

	slot0.is_set_battle_type = false;

	if next(slot0.all_object or {}) == nil then
		slot0:startBattle(slot1, slot2);
	else
		slot0.battle_model:clearAllObject();
		slot0:clearAllObject(false, slot1);
	end
end

function BattleHookModel.startBattle(slot0, slot1, slot2)
	slot0.res_num = 0;

	if slot1 and slot0.battle_scene and not tolua.isnull(slot0.battle_scene) then
		slot0.ctrl:setIsNormaBattle(true);

		if not slot2 then
			GlobalEvent:getInstance():Fire(SceneEvent.ENTER_FIGHT, BattleConst.Fight_Type.Nil, BattleController:getInstance():getIsNoramalBattle());
		end

		slot0.battle_scene:setbattleModel(slot0.ctrl:getNormalModel());
		slot0.battle_scene:setMoveMapStatus(true);
		slot0.ctrl:getCtrlBattleScene():MapMovescheduleUpdate();
		slot0.ctrl:setBattleStartStatus(true);
		slot0.ctrl:getCtrlBattleScene():handleLayerShowHide(true);
		slot0:battleNormalStart(slot1);

		slot0.is_init = true;
	end
end

function BattleHookModel.handleSkillPlayData(slot0, slot1)
	slot0.round_data = {};
	slot0.skill_plays_order_list = {};
	slot0.order_list = {};
	slot0.act_playing = false;

	if slot1 then
		slot0:playSkillPlayData(slot1);
	end
end

function BattleHookModel.getSkillPlayData(slot0, slot1)
	if slot0.actor_plays_list[slot1] then
		return slot0.actor_plays_list[slot1]
	end
end

function BattleHookModel.updateActorPlaysList(slot0, slot1)
	if slot1 then
		if not slot0.actor_plays_list[slot1.actor] then
			slot0.actor_plays_list[slot1.actor] = {};
		end

		table.insert(slot0.actor_plays_list[slot1.actor], slot1);
	end
end

function BattleHookModel.playSkillPlayData(slot0, slot1)
	if slot1 and (slot1.skill_plays or {}) ~= nil then
		for slot5, slot6 in ipairs(slot1.skill_plays) do
			if next(slot6.effect_play or {}) ~= nil then
				for slot10, slot11 in ipairs(slot6.effect_play) do
					if slot0.round_data_temp and slot0.round_data_temp[slot6.order] == nil then
						slot0.round_data_temp[slot6.order] = {};

						table.insert(slot0.skill_plays_order_list, {
							skill_order = slot6.order
						});
					end

					slot11.skill_bid = slot6.skill_bid;
					slot11.index = slot10;
					slot11.skill_order = slot6.order;
					slot11.talk_content = slot6.talk_content;
					slot11.talk_pos = slot6.talk_pos;

					if slot0.round_data_temp then
						table.insert(slot0.round_data_temp[slot6.order], slot11);
					end
				end
			end
		end

		table.sort(slot0.skill_plays_order_list, function (slot0, slot1)
			return slot0.skill_order < slot1.skill_order
		end);
	end

	if next(slot0.round_data_temp or {}) ~= nil and next(slot0.skill_plays_order_list) ~= nil then
		for slot5, slot6 in pairs(slot0.skill_plays_order_list) do
			if slot0.round_data_temp[slot6.skill_order] then
				for slot11, slot12 in pairs(slot7) do
					if slot0.round_data[slot12.order] == nil then
						slot0.round_data[slot12.order] = {};

						table.insert(slot0.order_list, {
							order = slot12.order,
							target = slot12.target
						});
					end

					if slot0.round_data[slot12.order][slot12.actor] == nil then
						slot0.round_data[slot12.order][slot12.actor] = {};
					end

					slot13 = {};

					if slot0.round_data[slot12.order][slot12.actor][1] == nil then
						table.insert(slot0.round_data[slot12.order][slot12.actor], {
							actor = slot12.actor,
							order = slot12.order,
							target = slot12.target,
							skill_bid = slot12.skill_bid,
							index = slot12.index,
							talk_content = slot12.talk_content,
							talk_pos = slot12.talk_pos
						});
					end

					if slot13.target_list == nil then
						slot13.target_list = {};
					end

					table.insert(slot13.target_list, slot12);
				end
			end
		end

		table.sort(slot0.order_list, function (slot0, slot1)
			return slot0.order < slot1.order
		end);

		slot0.round_data_temp = {};
	end

	if slot0.round_data then
		slot0:round();
	end
end

function BattleHookModel.createBattleScence(slot0, slot1)
	if not slot0.start then
		slot0.battle_scene = slot0.ctrl:getCtrlBattleScene();

		if not slot0.battle_scene then
			slot0.ctrl:createMap(slot1, BattleConst.Fight_Type.Darma);
		end

		if slot0.battle_scene then
			slot0:openNormalBattle(slot1);
			slot0.battle_scene:updateBtnLayerStatus(true);
		end
	end
end

function BattleHookModel.createBattleRole(slot0, slot1)
	if slot0.battle_scene and not tolua.isnull(slot0.battle_scene) then
		if not slot1 then
			return
		end

		slot0.sum = 0;
		slot0.our_num = tableLen(slot1.objects or {});

		for slot5, slot6 in pairs(slot1.objects or {}) do
			slot0.group = slot6.group;

			slot0:addBattleRole(slot6, slot1.comabt_type);
		end

		for slot5, slot6 in pairs(slot1.target_list or {}) do
			slot0:addBattleRole(slot6, slot1.combat_type);
		end
	end
end

function BattleHookModel.addBattleRole(slot0, slot1, slot2, slot3)
	if not BattleController:getInstance():getIsNoramalBattle() then
		return
	end

	slot5 = BattleHookRole.New(slot1, slot2, slot0:getTimeScale(), slot3);

	if next(slot0.all_object or {}) ~= nil and slot0.all_object then
		slot0.all_object[slot5.pos] = slot5;
	end
end

function BattleHookModel.getGroup(slot0)
	return slot0.group
end

function BattleHookModel.roleReady(slot0, slot1)
	if slot0.all_object == nil then
		return
	end

	if not slot0.all_object[slot1.pos] then
		slot0.all_object[slot1.pos] = slot1;
	end
end

function BattleHookModel.initOrder(slot0, slot1, slot2)
	if (not slot1.spine_renderer or slot1.spine_renderer.in_act) and slot0.battle_scene then
		slot1.error_time = (slot1.error_time or 0) + 1;

		if slot1.error_time < 5 then
			delayRun(slot0.battle_scene, 0.5, function ()
				uv0:initOrder(uv1, uv2);
			end);
		else
			slot1.in_act = false;
		end
	end

	table.sort(slot2.target_list, function (slot0, slot1)
		return slot0.index < slot1.index
	end);

	slot3 = deepCopy(slot2.target_list);

	table.sort(slot3, function (slot0, slot1)
		return slot0.target < slot1.target
	end);

	if slot3[1].target > 9 then
		slot4 = slot4 - GIRD_POS_OFFSET;
	end

	slot1.col = pos_to_col[slot4];
	slot1.error_time = 0;
	slot1.is_round = false;
	slot1.attacker_info = slot2;
	slot1.skill_data = Config.SkillData.data_get_skill(slot2.skill_bid);
	slot1.target_pos = {
		x = slot1.grid_pos.x,
		y = slot1.grid_pos.y
	};

	slot0.battle_model:calcTargetPos(slot1, slot0.all_object);

	for slot9, slot10 in pairs(slot0.all_object or {}) do
		slot10.dmg_index = nil;

		if slot10.dmg_aid_y_offset then
			slot10.dmg_aid_y_offset = 0;
		end

		slot10.is_hurt_play = false;
		slot10.is_big_play = false;

		if slot10.tips_list then
			slot10.tips_list = {};
		end
	end

	slot6 = slot2.target_list[1].effect_bid;

	if slot1:getFashionId() and slot7 ~= 0 and slot6 ~= 0 and Config.PartnerSkinData.data_skilltoeffect[getNorKey(slot7, slot6)] then
		slot6 = slot8;
	end

	slot1.play_order_index = slot6;

	if slot1.play_order_index == nil or slot1.play_order_index == 0 then
		slot0:round();

		return
	end

	if Config.SkillData.data_get_effect(slot1.play_order_index) then
		slot1.play_order = deepCopy(slot8.action_list);
		slot1.shake_id = slot8.shake_id or 0;
		slot1.effect_type = slot8.effect_type or 1;
		slot1.act_hurt_type = slot8.act_hurt_type or 0;
		slot1.play_stand = slot8.play_stand or 1;
		slot1.attack_sound = slot8.attack_sound or "";
		slot1.ready_sound = slot8.ready_sound or "";
		slot1.anime_res = slot8.anime_res or "";
		slot1.split_hurt = slot8.split_hurt or 1;
		slot1.hit_action = slot8.hit_action or "";
		slot1.effect_desc = slot8.effect_desc or "";
		slot1.is_must_die = slot8.is_must_die or 0;
		slot1.shout_trick = slot8.shout_trick or "";
		slot1.hit_sound = slot8.hit_sound or "";
		slot1.is_move_map = slot8.is_move_map or 0;
		slot1.anime_user_atk = slot8.anime_user_atk or "";
		slot1.hit_effect_list = deepCopy(slot0.battle_model:getCurEffectList(slot8.hit_effect_list));
		slot1.area_effect_list = deepCopy(slot0.battle_model:getCurEffectList(slot8.area_effect_list));
		slot1.act_effect_list = deepCopy(slot0.battle_model:getCurEffectList(slot8.act_effect_list));
		slot1.bact_effect_list = deepCopy(slot0.battle_model:getCurEffectList(slot8.bact_effect_list));
		slot1.trc_effect_list = deepCopy(slot0.battle_model:getCurEffectList(slot8.trc_effect_list));
	end

	if next(slot1.area_effect_list or {}) ~= nil then
		slot1.attacker_info.is_calc = false;
		slot1.in_area_effect = true;
		slot1.area_hit_num = 1;
		slot1.area_hit_time = 0;
	else
		slot1.in_area_effect = false;
	end

	function slot10()
		if uv0.skill_data then
			uv1();
		end
	end

	if slot2.skill_bid == 0 then
		slot0:talk(slot1, function ()
			uv0:playOrder(uv1);
		end);
	else
		slot0:talk(slot1, slot10);
	end

	slot0.act_playing = true;
end

function BattleHookModel.playOrder(slot0, slot1)
	slot1.wait_act = 0;

	if slot0.is_real_battle_ready == true or slot0.is_init == false then
		return
	end

	if slot1.play_order_index == nil or slot1.play_order_index == 0 then
		return
	end

	slot2 = nil;

	if slot1 and (slot1.play_order == nil or #slot1.play_order == 0) or not slot1.spine_renderer then
		slot0.actor_play_sum = slot0.actor_play_sum + 1;

		if slot1.play_order_index == 0 then
			slot1.play_order_index = nil;

			slot0:hurt(slot1, slot0.all_object);
		end

		if not slot1.is_die then
			slot1:resetZOrder();

			if slot0.second_data then
				-- Nothing
			else
				slot0.end_round_black = true;

				if slot1.spine_renderer:getActionName() ~= PlayerAction.run then
					SkillAct.setAnimation(slot1.spine_renderer, PlayerAction.run, true);
				end
			end
		end

		if not slot1.is_round and slot0.actor_sum <= slot0.actor_play_sum then
			slot0:round();
		end
	else
		table.remove(slot1.play_order, 1);

		if not tolua.isnull(slot1.spine_renderer.root) then
			slot1.spine_renderer:runAction(slot0.battle_model:singleAct(slot1.play_order[1], slot1, true));
		end
	end
end

function BattleHookModel.playMagic(slot0, slot1, slot2, slot3)
	if slot0.battle_scene == nil or tolua.isnull(slot0.battle_scene) then
		return
	end

	slot4 = 1;
	slot5 = false;

	if next(slot0.all_object or {}) ~= nil and slot0.all_object then
		if slot0.all_object == nil or slot2.target == nil then
			return
		end

		if slot0.all_object and slot2.target ~= nil and slot0.all_object[slot2.target] then
			if slot0.all_object[slot2.target] and slot6.spine_renderer and not tolua.isnull(slot6.spine_renderer.root) then
				slot8 = math.floor(slot2.hurt or 0);
				slot9 = 0;

				if slot2.hp <= 0 then
					slot9 = 1;
				end

				slot0.battle_model:updateTargetHp(slot1, slot6, slot8, slot9, slot4, slot2);

				if slot1 then
					(function ()
						if not uv0.is_hurt_play then
							uv0.is_hurt_play = true;

							if not uv0.is_big_play then
								uv1.battle_model:playHurtEffect(uv2, uv0);
							end

							if uv2.pos ~= uv0.pos and uv3 <= 0 and uv2.group ~= uv0.group and uv2.hit_action ~= "no-hurt" then
								SkillAct.hurt(uv2, uv0.spine_renderer, uv0, slot0);
							end
						end
					end)();
				end
			end
		end
	end
end

function BattleHookModel.talk(slot0, slot1, slot2)
	slot4 = slot1.attacker_info.talk_pos;

	if (slot1.attacker_info.talk_content or "") == "" or slot0.act_playing == true then
		if slot2 then
			slot2();
		end

		return
	end

	StoryController:getInstance():getView():showBubble(2, slot4, WordCensor:getInstance():relapceFaceIconTag(string.gsub(slot3, "#name#", ""))[2], 0, nil, 1);

	if slot2 then
		slot2();
	end
end

function BattleHookModel.updateNextRoundData(slot0, slot1)
	if BattleController:getInstance():getIsNoramalBattle() then
		slot2 = {};

		if BattleLoop2.nextTarget(slot1) then
			slot4 = slot0:getMoveTime(slot3.actor, slot3.effect_bid);

			table.insert(slot2, slot3);

			if slot0.all_object == nil or slot2 == nil then
				return
			end

			if slot0.battle_scene and not tolua.isnull(slot0.battle_scene) then
				for slot8, slot9 in pairs(slot2 or {}) do
					if slot9.group == 2 then
						slot0:addBattleRole(slot9, BattleConst.Fight_Type.Nil, slot0:checkColObjet(pos_to_col[slot9.pos - GIRD_POS_OFFSET]));
					end
				end
			end
		end
	end
end

function BattleHookModel.setAckMoveTime(slot0, slot1)
	slot0.move_time = slot1;
end

function BattleHookModel.getFinalMoveTime(slot0)
	return slot0.move_time or 12 / display.DEFAULT_FPS
end

function BattleHookModel.getMoveTime(slot0, slot1, slot2)
	slot3 = 12;

	if Config.SkillData.data_get_effect(slot2) then
		slot5 = Config.SkillData.data_get_effect(slot2).is_move_map or FALSE;
		slot6 = slot4.anime_res;
		slot7 = 0;

		if slot0.all_object and next(slot0.all_object or {}) ~= nil then
			slot0.cur_role = slot0.all_object[slot1];

			if slot0.cur_role then
				slot7 = slot0.cur_role.res;
			end
		end

		if slot5 == FALSE and (Config.BattleActData.data_info[slot7] or Config.BattleActData.data_info[0]) and (slot8[slot6] or Config.BattleActData.data_info[0].action1) then
			if (slot9[slot4.anime_user_atk] or slot9.action1) == nil then
				slot10 = Config.BattleActData.data_info[0].action1.action1;
			end

			if slot10 then
				slot3 = slot10.move_delay_time + slot10.move_time;
			end
		end
	end

	slot0:setAckMoveTime(slot3 / display.DEFAULT_FPS);
end

function BattleHookModel.checkColObjet(slot0, slot1)
	if slot0.all_object then
		slot2 = false;

		for slot6, slot7 in pairs(slot0.all_object or {}) do
			if slot7 ~= nil and slot7.group == 2 and pos_to_col[slot7.pos - GIRD_POS_OFFSET] == slot1 then
				slot2 = true;
			end
		end

		return slot2
	end
end

function BattleHookModel.updateStop(slot0)
	if slot0.all_object then
		for slot4, slot5 in pairs(slot0.all_object or {}) do
			if slot5 ~= nil and slot5.spine_renderer ~= nil and slot5.spine_renderer.is_die == false then
				slot5.spine_renderer:doStand(true);

				if slot5.group == 2 then
					slot5.spine_renderer:reverse();
				end
			end
		end
	end
end

function BattleHookModel.chanegBattle(slot0, slot1)
	if slot1 then
		slot0.is_real_battle_ready = true;

		slot0:handleChangeBattle(slot1);
	end
end

function BattleHookModel.handleChangeBattle(slot0, slot1)
	if not BattleController:getInstance():getModel():getReconnectStatus() then
		if slot0.battle_scene and not tolua.isnull(slot0.battle_scene) then
			slot0.battle_scene:setMoveMapStatus(false);
		end

		if slot0.ctrl:getCtrlBattleScene() and not tolua.isnull(slot0.ctrl:getCtrlBattleScene()) then
			slot0.ctrl:getCtrlBattleScene():unMapMovescheduleUpdate();
			slot0.ctrl:getCtrlBattleScene():handleLayerShowHide(false);
		end

		slot0:clearAllObject(true, slot1);
	else
		slot0.ctrl:openBattleScene(slot1);
	end
end

function BattleHookModel.setRes(slot0, slot1)
	if not slot0.res_list then
		slot0.res_list = {};
	end

	slot0.res_list[slot1] = true;
end

function BattleHookModel.resLoadStart(slot0, slot1)
	if not slot0.res_list then
		slot0.res_list = {};
	end

	if slot0.res_list[slot1] then
		return false
	end

	slot0.res_num = slot0.res_num + 1;
	slot0.res_list[slot1] = true;

	return true
end

function BattleHookModel.clearAllObject(slot0, slot1, slot2)
	slot3 = 0;

	if next(slot0.all_object or {}) == nil then
		if slot1 then
			slot0:clearRole();
			slot0.ctrl:openBattleScene(slot2);
		end
	else
		slot4 = tableLen(slot0.all_object or {});

		for slot8, slot9 in pairs(slot0.all_object or {}) do
			SkillAct.clearAllEffect(slot9.spine_renderer);

			if slot9.spine_renderer and slot9.spine_renderer.root and not tolua.isnull(slot9.spine_renderer.root) then
				slot9.spine_renderer:setVisible(false);
				slot9.spine_renderer:realrelease(true);

				slot0.all_object[slot9.pos] = nil;
			end
		end

		slot0:clearRole();

		if not slot1 then
			slot0.battle_scene:setMoveMapStatus(false);
			slot0:startBattle(slot2);
		else
			slot0.ctrl:openBattleScene(slot2);
		end
	end
end

function BattleHookModel.getInitNormalStatus(slot0)
	return slot0.is_init
end

function BattleHookModel.isInFight(slot0)
	return BattleController:getInstance():getBattleStatus()
end

function BattleHookModel.getAllObject(slot0)
	return slot0.all_object
end

function BattleHookModel.clearRole(slot0)
	for slot4, slot5 in pairs(slot0.all_object or {}) do
		if slot5.spine_renderer and not tolua.isnull(slot5.spine_renderer.root) then
			slot5.spine_renderer.root:stopAllActions();
			slot5.spine_renderer:setVisible(false);
			slot5.spine_renderer:realrelease(true);

			slot0.all_object[slot5.pos] = nil;
		end
	end

	slot0.all_object = {};
	slot0.actor_plays_list = {};
	slot0.actor_target_list = {};
	slot0.sum = 0;
	slot0.is_init = false;

	if BattleController:getInstance():getCtrlBattleScene() then
		BattleController:getInstance():getCtrlBattleScene():unMapMovescheduleUpdate();
	end
end

function BattleHookModel.battleclear(slot0)
	slot0.act_playing = false;
	slot0.start = false;
	slot0.skill_plays_order_list = {};
	slot0.round_data = {};

	if next(slot0.all_object or {}) ~= nil and slot0.all_object then
		for slot4, slot5 in pairs(slot0.all_object or {}) do
			slot5:exitdeleteRole();
		end
	end

	slot0.ctrl:setBattleStartStatus(false);
	slot0.ctrl:setIsNormaBattle(false);
	slot0:clearRole();

	slot0.is_init = false;

	GlobalEvent:getInstance():Fire(SceneEvent.EXIT_FIGHT, BattleConst.Fight_Type.Nil);

	if BattleController:getInstance():getCtrlBattleScene() then
		BattleController:getInstance():getCtrlBattleScene():unMapMovescheduleUpdate();
	end
end

function BattleHookModel.getTimeScale(slot0)
	if slot0.time_scale == nil then
		slot0.time_scale = BattleController:getInstance():getActTime("base_speed_scale");
	end

	return slot0.time_scale or 1.1
end
