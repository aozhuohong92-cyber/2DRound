slot0 = RenderMgr:getInstance();
slot1 = BattleController:getInstance();
slot2 = BattleController:getInstance():getModel();
slot3 = string.format;
slot4 = BattleDramaController:getInstance();
slot5 = BattleDramaController:getInstance():getModel();
slot6 = MainuiController:getInstance();
slot7 = table.remove;
slot8 = table.insert;
slot9 = tolua.isnull;
BATTLE_VIEW_BACK_LAYER_Z = 0;
BATTLE_VIEW_BLACK_LAYER_Z0 = 3;
BATTLE_VIEW_UI_LAYER_Z = 40;
BATTLE_VIEW_UI_LAYER_TAG = 40;
BATTLE_VIEW_ROLE_LAYER_Z = 25;
BATTLE_VIEW_ROLE_LAYER_TAG = 20;
BATTLE_VIEW_TOP = 999;
BATTLE_VIEW_EFFECT_LAYER_Z0 = 20;
BATTLE_VIEW_EFFECT_LAYER_Z2 = 15;
SKILL_MAX_NUM = 3;
BattleSceneNewView = class("BattleSceneNewView", function ()
	do return ccui.Widget:create() end
end);

function BattleSceneNewView.ctor(slot0)
end

function BattleSceneNewView.init(slot0, slot1)
	slot0.battle_type = slot1 or BattleConst.Fight_Type.Default;
	slot0.fight_round = 1;
	slot0.total_round = 0;
	slot0.charpter_id = 0;

	slot0:config();
	slot0:configUI();
	slot0:regitsterEvent();
end

function BattleSceneNewView.config(slot0)
	if slot0.battle_type == BattleConst.Fight_Type.TrialTower then
		slot0.move_camera_total_distance = uv0:getActTime("trial_lround_distance");
		slot0.move_speed = uv0:getActTime("trial_base_speed");
	else
		slot0.move_camera_total_distance = uv0:getActTime("round_distance");
		slot0.move_speed = uv0:getActTime("base_speed");
	end

	slot0.move_camera_pass_distance = 0;
	slot0.isStartUpdate = false;
	slot0.call_mon_distance = 0;
	slot0.is_run = false;
	slot0.effect_id = "";
	slot0.map_effect_id = "";
	slot0.mid_effect_id = "";
	slot0.b_effect_id = "";
	slot0.is_need_move_map = false;
	slot0.is_single_bg = FALSE;
	slot0.is_init_normal_battle = false;
	slot0.right_btn_list = {};
	slot0.fly_item_sum = 0;
	slot0.map_init_y = 300;
	slot0.slayer_init_y = 40;
	slot0.flayer_init_y = 736;

	if MAKELIFEBETTER == true and ios_log_report then
		ios_log_report("battle_scene_view");
	end
end

function BattleSceneNewView.setbattleModel(slot0, slot1)
	uv0 = slot1 or uv1:getModel();
end

function BattleSceneNewView.regitsterEvent(slot0)
	if slot0.update_buff_event == nil then
		slot0.update_buff_event = GlobalEvent:getInstance():Bind(Battle_dramaEvent.BattleDrama_Drama_Buff_View, function (slot0)
			uv0:createBuffIcon(slot0);
		end);
	end

	if slot0.chat_ui_size_change == nil then
		slot0.chat_ui_size_change = GlobalEvent:getInstance():Bind(EventId.CHAT_HEIGHT_CHANGE, function ()
			uv0:changeSomeLayoutPosition();
		end);
	end
end

function BattleSceneNewView.configUI(slot0)
	slot0.main_size = cc.size(SCREEN_WIDTH, display.height);

	slot0:setContentSize(slot0.main_size);
	slot0:setAnchorPoint(cc.p(0.5, 0.5));
	slot0:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);

	if not slot0.main_layer then
		slot0.main_layer = ccui.Layout:create();

		slot0.main_layer:setContentSize(slot0.main_size);
		slot0.main_layer:setVisible(false);
		slot0.main_layer:setAnchorPoint(cc.p(0.5, 0.5));
		slot0.main_layer:setCascadeOpacityEnabled(true);
		slot0.main_layer:setPosition(slot0.main_size.width * 0.5, slot0.main_size.height * 0.5);
		slot0:addChild(slot0.main_layer);
		slot0:setSwallowTouches(false);

		slot0.map_fLayer = ccui.Widget:create();

		slot0.map_fLayer:setCascadeOpacityEnabled(true);
		slot0.map_fLayer:setSwallowTouches(false);
		slot0.map_fLayer:setAnchorPoint(cc.p(0, 0));
		slot0.map_fLayer:setPositionY(slot0.flayer_init_y);
		slot0.main_layer:addChild(slot0.map_fLayer, BATTLE_VIEW_BLACK_LAYER_Z0);

		slot0.map_sLayer = ccui.Widget:create();

		slot0.map_sLayer:setAnchorPoint(cc.p(0, 0));
		slot0.map_sLayer:setCascadeOpacityEnabled(true);
		slot0.map_sLayer:setSwallowTouches(false);
		slot0.map_sLayer:setName("map_sLayer");
		slot0.main_layer:addChild(slot0.map_sLayer, BATTLE_VIEW_BLACK_LAYER_Z0 + 1);

		slot0.effect_layer_1 = ccui.Widget:create();

		slot0.effect_layer_1:setPositionY(slot0.map_init_y);
		slot0.map_sLayer:addChild(slot0.effect_layer_1, BATTLE_VIEW_ROLE_LAYER_Z + 1);

		slot0.effect_layer_2 = ccui.Widget:create();

		slot0.effect_layer_2:setPositionY(slot0.map_init_y);
		slot0.map_sLayer:addChild(slot0.effect_layer_2, BATTLE_VIEW_BLACK_LAYER_Z0);

		slot0.role_layer = BattleRoleView.create();

		slot0.role_layer:setAnchorPoint(cc.p(0, 1));
		slot0.role_layer:setOpacity(255);
		slot0.role_layer:setScale(1);
		slot0.role_layer:setSwallowTouches(false);
		slot0.role_layer:setPositionY(slot0.map_init_y);
		slot0.map_sLayer:addChild(slot0.role_layer, BATTLE_VIEW_ROLE_LAYER_Z, BATTLE_VIEW_ROLE_LAYER_TAG);
	end

	if slot0.ui_main_layer == nil then
		slot0.ui_main_layer = ccui.Layout:create();

		slot0.ui_main_layer:setContentSize(slot0.main_size);
		slot0.ui_main_layer:setAnchorPoint(cc.p(0.5, 0.5));
		slot0.ui_main_layer:setPosition(slot0.main_size.width * 0.5, slot0.main_size.height * 0.5);
		slot0:addChild(slot0.ui_main_layer, 1);
	end

	slot0:createMap();
	slot0:handleLayerShowHide(true);
	slot0:MapMovescheduleUpdate();
end

function BattleSceneNewView.createMap(slot0)
	slot0.battle_res_id = uv0:curBattleResId(slot0.battle_type) or 10001;
	slot0.is_pvp = BattleConst.isPvP(slot0.battle_type);
	slot0.music_info = AudioManager:getInstance():getMusicInfo();

	slot0:playMusic();
	slot0:createHorizontalMap(slot0.battle_res_id);
end

function BattleSceneNewView.playMusic(slot0)
	slot1 = nil;

	if slot0.battle_type == BattleConst.Fight_Type.Darma then
		if Config.BattleBgData.data_info2 and slot2[slot0.battle_type] then
			slot1 = slot2[slot0.battle_type][slot0.battle_res_id];
		end
	elseif Config.BattleBgData.data_info and slot2[slot0.battle_type] then
		slot1 = slot2[slot0.battle_type];
	end

	if slot1 ~= nil then
		slot0.is_single_bg = slot1.is_single_bg;

		if slot1.bg_music ~= "" then
			AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.BATTLE, slot1.bg_music, true);
		end
	end
end

function BattleSceneNewView.createHorizontalMap(slot0, slot1)
	if slot0.is_single_bg == FALSE then
		if slot0.map_bg_res_id ~= PathTool.getBattleSceneRes(uv0("%s/map_bg", slot0.battle_res_id), false) then
			slot0.map_bg_res_id = slot2;
			slot0.load_res_map_bg = createResourcesLoad(slot2, ResourcesType.single, function ()
				if not uv0(uv1.map_sLayer) then
					if not uv1.map_bg then
						uv1.map_bg = createSprite(uv2, 0, uv1.slayer_init_y, uv1.map_sLayer, cc.p(0, 0), LOADTEXT_TYPE, BATTLE_VIEW_BACK_LAYER_Z);
					end

					uv1:updateNormalBattle();
					uv1:createNewBg(uv1.map_bg_res_id);
				end
			end, slot0.load_res_map_bg, true);
		end

		if slot0.f_bg_res_id ~= PathTool.getBattleSceneRes(uv0("%s/m_bg", slot0.battle_res_id), true) then
			slot0.f_bg_res_id = slot3;
			slot0.load_res_f_bg = createResourcesLoad(slot3, ResourcesType.single, function ()
				if not uv0(uv1.map_sLayer) then
					if not uv1.f_bg then
						uv1.f_bg = createSprite(uv2, 0, 0, uv1.map_fLayer, cc.p(0, 0), LOADTEXT_TYPE, BATTLE_VIEW_BACK_LAYER_Z);

						uv1.f_bg:setScale(uv1:getFarLayerScale());
					end

					uv1:createNewFbg(uv1.f_bg_res_id);
					MainSceneController:getInstance():handleSceneStatus(false);
				end
			end, slot0.load_res_f_bg, true);
		end

		if slot0.battle_type == BattleConst.Fight_Type.Darma then
			if slot0.battle_buff_object and not uv1(slot0.battle_buff_object.container) then
				slot0.battle_buff_object.container:setVisible(true);
			end

			uv2:openBattleDramaUI(true, slot0.battle_res_id, slot0.battle_type);
		end
	elseif slot0.single_bg_res_id ~= PathTool.getBattleSceneRes(uv0("%s/b_bg", slot0.battle_res_id), true) then
		slot0.single_bg_res_id = slot2;
		slot0.load_res_f_bg = createResourcesLoad(slot2, ResourcesType.single, function ()
			if not uv0.single_bg and not uv1(uv0.main_layer) then
				uv0.single_bg = createSprite(uv2, uv0.main_size.width * 0.5, display.getBottom(uv0), uv0.map_sLayer, cc.p(0.5, 0), LOADTEXT_TYPE, -1);

				uv0.single_bg:setScale(uv3);
			end

			MainSceneController:getInstance():handleSceneStatus(false);
		end, slot0.load_res_f_bg, true);

		if display.getMaxScale() ~= 1 then
			slot4 = slot0.map_init_y * slot3;
			slot4 = slot4 + slot4 - slot0.map_init_y;

			slot0.effect_layer_1:setPositionY(slot4);
			slot0.effect_layer_2:setPositionY(slot4);
			slot0.role_layer:setPositionY(slot4);
		end
	end

	if (uv3:getBuffData() or uv4:checkIsInDramaUIFight()) and not BattleConst.isBuffAdd(slot0.battle_type) then
		slot0:createBuffIcon(slot2);
	end

	slot0:createAutoCombatIcon();
	slot0:showMainAction();
end

function BattleSceneNewView.updateMapEffect(slot0, slot1)
end

function BattleSceneNewView.showMainAction(slot0)
	slot0.main_layer:setVisible(true);
end

function BattleSceneNewView.checkFinishLoadMap(slot0, slot1)
end

function BattleSceneNewView.updateNormalBattle(slot0, slot1)
	if (slot1 or uv0:getCircleData()) and not slot0.is_init_normal_battle then
		uv0:openNormalBattle(BattleLoop2.init(slot2));

		slot0.is_init_normal_battle = true;
	end
end

function BattleSceneNewView.removeTimer(slot0)
end

function BattleSceneNewView.MapMovescheduleUpdate(slot0)
	if slot0.isStartUpdate then
		do return end
	end

	slot0.isStartUpdate = true;

	if slot0.main_layer and not uv0(slot0.main_layer) then
		slot0.main_layer:scheduleUpdateWithPriorityLua(function (slot0)
			uv0:mapUpdate(slot0);
		end, 0);
	end
end

function BattleSceneNewView.unMapMovescheduleUpdate(slot0)
	if not slot0.isStartUpdate then
		do return end
	end

	slot0.isStartUpdate = false;
	slot0.move_camera_pass_distance = 0;

	if slot0.main_layer and not uv0(slot0.main_layer) then
		slot0.main_layer:unscheduleUpdate();
	end
end

function BattleSceneNewView.setMoveMapStatus(slot0, slot1)
	slot0.is_need_move_map = slot1;
	slot0.is_run = slot1;

	if slot1 == false then
		slot0.move_camera_pass_distance = 0;
	end
end

function BattleSceneNewView.mapUpdate(slot0, slot1)
	if uv0:getTimeScale() ~= uv1:getActTime("base_speed_scale") then
		slot0.move_camera_total_distance = uv1:getActTime("round_distance");
		slot0.move_speed = uv1:getActTime("double_base_speed");
	else
		slot0.move_camera_total_distance = uv1:getActTime("round_distance");
		slot0.move_speed = uv1:getActTime("base_speed");
	end

	if slot0.is_need_move_map == true then
		if not uv1:getIsNoramalBattle() then
			if not uv2(slot0.main_layer) then
				slot0:updateRun();
			end
		else
			slot0.move_speed = uv1:getActTime("new_hook_base_speed");

			if not uv2(slot0.f_bg) and not uv2(slot0.map_bg) then
				slot0:move(slot0.map_bg, slot0.f_bg, slot0.move_speed);
			end
		end
	end
end

function BattleSceneNewView.updateRun(slot0)
	slot0.move_camera_pass_distance = math.min(slot0.move_camera_pass_distance + slot0.move_speed, slot0.move_camera_total_distance);
	slot1 = uv0:getActTime("normal_battle_per_distance") <= math.abs(slot0.move_camera_pass_distance / slot0.move_camera_total_distance);

	if slot0.move_camera_total_distance <= slot0.move_camera_pass_distance then
		slot0.is_run = false;

		uv1:updateStop();
	else
		uv1:updateRun(slot1);
		slot0:move(slot0.map_bg, slot0.f_bg, slot0.move_speed);
	end
end

function BattleSceneNewView.move(slot0, slot1, slot2, slot3, slot4)
	slot5 = 0;

	if slot1 then
		slot0:mapMove(slot1, slot3);
	end

	if slot2 then
		slot2:setPositionX(slot2:getPositionX() - slot3 * uv0:getActTime("first_speed"));

		if slot0.f_bg_2 then
			slot0.f_bg_2:setPositionX(slot0.f_bg_2:getPositionX() - slot6);
		end

		if not slot4 then
			slot0:changeBg(slot2, slot0.f_bg_2, true);
		end
	end
end

function BattleSceneNewView.setActionName(slot0, slot1)
	slot0.action_name = slot1;
end

function BattleSceneNewView.changeBg(slot0, slot1, slot2, slot3)
	slot4 = 1;

	if slot3 then
		slot4 = slot0:getFarLayerScale();
	end

	if slot1 and slot1:getPositionX() + slot1:getContentSize().width * slot4 <= 0 and slot2 then
		slot1:setPositionX(slot2:getPositionX() + slot2:getContentSize().width * slot4);
	end

	if slot2 and slot2:getPositionX() + slot2:getContentSize().width * slot4 <= 0 then
		slot2:setPositionX(slot1:getPositionX() + slot1:getContentSize().width * slot4);
	end
end

function BattleSceneNewView.mapMove(slot0, slot1, slot2)
	if not slot0.is_pvp and slot1 then
		slot1:setPositionX(slot1:getPositionX() - slot2);

		slot3 = slot1:getContentSize().width + slot1:getPositionX();

		if slot0.map_bg_2 then
			slot0.map_bg_2:setPositionX(slot0.map_bg_2:getPositionX() - slot2);
		end

		slot0:changeBg(slot1, slot0.map_bg_2);
	end
end

function BattleSceneNewView.createNewBg(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		do return end
	end

	if not slot0.map_bg_2 and not uv0(slot0.map_sLayer) and not uv0(slot0.map_bg) and not uv0(slot0.map_sLayer) and not uv0(slot0.map_bg) then
		slot0.map_bg_2 = createSprite(slot1, slot0.map_bg:getContentSize().width, slot0.slayer_init_y, slot0.map_sLayer, cc.p(0, 0), LOADTEXT_TYPE, BATTLE_VIEW_BACK_LAYER_Z);
	end
end

function BattleSceneNewView.createNewFbg(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		do return end
	end

	if not slot0.f_bg_2 and not uv0(slot0.f_bg) and not uv0(slot0.map_fLayer) and not uv0(slot0.map_fLayer) and not uv0(slot0.f_bg) then
		slot0.f_bg_2 = createSprite(slot1, slot0.f_bg:getContentSize().width * slot0:getFarLayerScale(), 0, slot0.map_fLayer, cc.p(0, 0), LOADTEXT_TYPE, BATTLE_VIEW_BACK_LAYER_Z);

		slot0.f_bg_2:setScale(slot0:getFarLayerScale());
	end
end

function BattleSceneNewView.createUiLayer(slot0, slot1, slot2, slot3)
	slot0.is_main_fight_round = false;
	slot0.initData = slot1;
	slot0.main_vo = slot2;
	slot0.is_max_skill = false;
	slot0.fight_round = slot1.current_wave;
	slot0.total_round = slot1.total_wave;
	slot0.dunge_data = slot1.extra_args;
	slot0.dunge_str_data = slot1.string_ext_args;
	slot0.battle_type = slot3;
	slot0.role_vo = RoleController:getInstance():getRoleVo();
	slot0.stand_wait_timer = 0;
	slot0.stand_button_time = 0.2;
	slot0.ui_layer = ccui.Layout:create();

	slot0.ui_layer:setAnchorPoint(cc.p(0, 0));
	slot0.ui_layer:setPosition(0, 0);

	if slot0.ui_main_layer and not uv0(slot0.ui_main_layer) then
		slot0.ui_main_layer:addChild(slot0.ui_layer, BATTLE_VIEW_UI_LAYER_Z, BATTLE_VIEW_UI_LAYER_TAG);
	end

	if not uv1:getIsNoramalBattle() then
		if not slot0.double_speed_btn then
			slot0.double_speed_btn = createImage(slot0.ui_layer, PathTool.getResFrame("battle", "battle_10028"), 620, 580, cc.p(1, 0.5), true, nil, true);

			slot0.double_speed_btn:setTouchEnabled(true);

			slot0.double_speed_Label = createLabel(24, cc.c3b(255, 255, 255), nil, 39, 24, TI18N("X1"), slot0.double_speed_btn, 2, cc.p(0.5, 0.5));

			slot0.double_speed_btn:setContentSize(cc.size(78, 49));
			slot0.double_speed_btn:setCapInsets(cc.rect(20, 24, 1, 2));
			slot0.double_speed_btn:setPosition(slot0.main_size.width + 8, slot0.main_size.height / 2 + 230);
			slot0.double_speed_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1);

				if slot1 == ccui.TouchEventType.ended and uv0:checkIsCanChangeBattleSpeed(uv1.battle_type, true) then
					uv0:changeSpeed();
				end
			end);
		end

		slot4 = false;

		if Config.CombatTypeData.data_fight_list[slot0.battle_type] and slot5.is_skip == "true" then
			if slot0.battle_type == BattleConst.Fight_Type.Arena then
				if Config.ArenaData.data_const.arena_skip_count and not uv1:getWatchReplayStatus() and ArenaController:getInstance():getModel():getHadCombatNum() >= (slot7.val or 30) then
					slot4 = true;
				end
			elseif slot0.battle_type == BattleConst.Fight_Type.ExpeditFight then
				slot6 = HeroExpeditController:getInstance():getModel():getDifferentChoose();

				if Config.ExpeditionData.data_sign_reward and slot7[slot6] and slot7[slot6].is_jump == 1 then
					slot4 = true;
				end
			elseif slot0.battle_type == BattleConst.Fight_Type.PlanesWar then
				slot6 = Config.PlanesData.data_const.planes_skip_battle_lev;

				if RoleController:getInstance():getRoleVo() and slot6 and slot6.val <= slot7.lev then
					slot4 = true;
				end
			else
				slot4 = true;
			end
		end

		if not BattleController:getInstance():getWatchReplayStatus() and slot5 and slot5.is_skip == "true" and not slot0.skip_btn then
			slot0.skip_btn = createImage(slot0.ui_layer, PathTool.getResFrame("battle", "battle_10028"), 620, 580, cc.p(1, 0.5), true, nil, true);
			slot0.skip_btn_label = createLabel(24, cc.c3b(255, 255, 255), nil, 39, 24, TI18N("跳过"), slot0.skip_btn, 2, cc.p(0.5, 0.5));

			slot0.skip_btn:setTouchEnabled(true);
			slot0.skip_btn:setContentSize(cc.size(78, 49));
			slot0.skip_btn:setCapInsets(cc.rect(20, 24, 1, 2));
			slot0.skip_btn:setPosition(slot0.main_size.width + 8, slot0.main_size.height / 2 + 175);
			slot0.skip_btn:addTouchEventListener(function (slot0, slot1)
				customClickAction(slot0, slot1);

				if slot1 == ccui.TouchEventType.ended then
					if uv0.battle_type == BattleConst.Fight_Type.Arean_Team then
						slot2 = GameNet:getInstance():getTimeFloat();

						if uv1.skip_last_time and slot2 - uv1.skip_last_time < 1.5 then
							do return end
						end

						uv1.skip_last_time = slot2;
					end

					if uv2 then
						uv3:send20062();
					elseif uv0.battle_type == BattleConst.Fight_Type.Arena then
						message(uv4(TI18N("本赛季挑战%s次之后可跳过"), (Config.ArenaData.data_const.arena_skip_count or {}).val or 30));
					elseif uv0.battle_type == BattleConst.Fight_Type.PlanesWar and Config.PlanesData.data_const.planes_skip_battle_lev then
						message(slot2.desc);
					end
				end
			end);

			slot0.skip_btn.index = 1;
			slot0.right_btn_list[1] = slot0.skip_btn;
		end

		if slot1.formation ~= nil then
			if slot0.battle_type == BattleConst.Fight_Type.Darma then
				uv4:updataZhenfaInfo(true, slot1);
			else
				slot0:updataZhenfaInfo(slot1);
			end

			slot6 = 0;

			if slot1.action_count then
				slot6 = slot1.action_count;
			end

			slot0:updateRound(slot6);
		end
	end

	if not uv1:getWatchReplayStatus() then
		if slot0.battle_type == BattleConst.Fight_Type.GuildDun then
			slot0:addGuildBossUI(BattleConst.Fight_Type.GuildDun, 0);
		elseif slot0.battle_type == BattleConst.Fight_Type.MonopolyBoss then
			slot0:addGuildBossUI(BattleConst.Fight_Type.MonopolyBoss, 0);
		elseif slot0.battle_type == BattleConst.Fight_Type.EliteMatchWar then
			slot0:addEliteDeclarationUI(slot0.battle_type);
		elseif slot0.battle_type == BattleConst.Fight_Type.EliteKingMatchWar then
			slot0:addEliteMatchUI(slot0.battle_type);
			slot0:addEliteDeclarationUI(slot0.battle_type);
		elseif slot0.battle_type == BattleConst.Fight_Type.PK or slot0.battle_type == BattleConst.Fight_Type.HeroTestWar then
			slot0:addExitBtnUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.SandybeachBossFight then
			slot0:addSandybeachBossFightUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.LimitExercise then
			slot0:addLimitExerciseBossFightUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.HeavenWar then
			slot0:addHeavenStarUI();
			slot0:updateSkipTeamBtnStatus();
		elseif slot0.battle_type == BattleConst.Fight_Type.CrossArenaWar then
			slot0:addSessionStatusUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.AreanManyPeople then
			slot0:addSessionStatusUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.GuildSecretArea then
			slot0:addGuildSecretAreaUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.YearMonsterWar then
			slot0:addYearMonsterUI();
		elseif slot0.battle_type == BattleConst.Fight_Type.WhiteDayWar then
			slot0:addYearMonsterUI(true);
		elseif slot0.battle_type == BattleConst.Fight_Type.PractiseTower then
			slot0:addBoosHpUI();
		end
	else
		slot0:addExitBtnUI();
	end

	if slot0.battle_type == BattleConst.Fight_Type.ElementWar then
		slot0:checkShowElementMsg();
	end

	if slot0.battle_buff_object and not uv0(slot0.battle_buff_object.container) then
		slot0.battle_buff_object.container:setVisible(false);
	end
end

function BattleSceneNewView.updataZhenfaInfo(slot0, slot1)
	if slot1.formation == nil then
		do return end
	end

	slot2 = {
		[slot7.group] = {
			slot7.formation_type or 1,
			slot7.formation_lev or 0
		}
	};

	for slot6, slot7 in pairs(slot1.formation) do
		-- Nothing
	end

	if slot2[1] == nil or slot2[2] == nil or slot2[1][1] == nil or slot2[1][2] == nil or slot2[2][1] == nil or slot2[2][2] == nil then
		do return end
	end

	if slot0.ui_layer and not uv0(slot0.ui_layer) then
		if uv0(slot0.form_view) then
			slot0.form_view = createCSBNote(PathTool.getTargetCSB("battle/battle_form_view"));

			slot0.form_view:setAnchorPoint(cc.p(0.5, 0));
			slot0.ui_layer:addChild(slot0.form_view);
			slot0.form_view:setPosition(slot0.main_size.width / 2, display.getBottom(slot0) + uv1:getBottomHeight() + 140);

			slot0.left_btn = slot0.form_view:getChildByName("left_btn");
			slot0.left_form_icon = slot0.left_btn:getChildByName("icon");
			slot0.right_btn = slot0.form_view:getChildByName("right_btn");
			slot0.right_form_icon = slot0.right_btn:getChildByName("icon");
			slot0.buff_btn = slot0.form_view:getChildByName("buff_btn");

			slot0.buff_btn:setOpacity(0);
			slot0.buff_btn:runAction(cc.FadeIn:create(0.7));
			registerButtonEventListener(slot0.buff_btn, function ()
				slot0 = uv0.actor_role_name;
				slot1 = uv0.target_role_name;

				if uv1:getModel():getGroup() == BattleGroupTypeConf.TYPE_GROUP_ENEMY and not uv1:getWatchReplayStatus() then
					slot0 = uv0.target_role_name;
					slot1 = uv0.actor_role_name;
				end

				uv1:openBattleBuffInfoView(true, slot0, slot1);
			end, true);

			slot0.skip_team_btn = slot0.form_view:getChildByName("skip_team_btn");

			slot0.skip_team_btn:setVisible(false);
			registerButtonEventListener(slot0.skip_team_btn, function ()
				uv0:csSkipFirstTeam();
			end, true);

			slot0.round_label = slot0.form_view:getChildByName("image_2"):getChildByName("round_label");
			slot0.left_name_panel = slot0.form_view:getChildByName("left_name_panel");
			slot0.right_name_panel = slot0.form_view:getChildByName("right_name_panel");
			slot0.left_name_label = slot0.left_name_panel:getChildByName("left_name_label");
			slot0.right_name_label = slot0.right_name_panel:getChildByName("right_name_label");
			slot0.left_camp_btn = slot0.form_view:getChildByName("left_camp_btn");
			slot0.right_camp_btn = slot0.form_view:getChildByName("right_camp_btn");
		end

		if not uv0(slot0.form_view) then
			loadSpriteTexture(slot0.left_form_icon, PathTool.getResFrame("battle", "battle_form_icon_" .. slot2[1][1]), LOADTEXT_TYPE_PLIST);
			loadSpriteTexture(slot0.right_form_icon, PathTool.getResFrame("battle", "battle_form_icon_" .. slot2[2][1]), LOADTEXT_TYPE_PLIST);
		end

		slot4, slot5 = nil;

		for slot9, slot10 in pairs(slot1.halo_list or {}) do
			if slot10.group == 1 then
				slot4 = slot10.type;
			elseif slot10.group == 2 then
				slot5 = slot10.type;
			end
		end

		slot6 = {};
		slot7 = {};

		if slot4 < 100 then
			slot6 = BattleConst.Old_Halo_Id_Change[slot4] or {};
		else
			slot9 = math.floor(slot4 % 10000 / 100);
			slot10 = slot4 % 100;

			if math.floor(slot4 / 10000) > 0 then
				uv3(slot6, slot8);
			end

			if slot9 > 0 then
				uv3(slot6, slot9);
			end

			if slot10 > 0 then
				uv3(slot6, slot10);
			end
		end

		if slot5 < 100 then
			slot7 = BattleConst.Old_Halo_Id_Change[slot5] or {};
		else
			slot9 = math.floor(slot5 % 10000 / 100);
			slot10 = slot5 % 100;

			if math.floor(slot5 / 10000) > 0 then
				uv3(slot7, slot8);
			end

			if slot9 > 0 then
				uv3(slot7, slot9);
			end

			if slot10 > 0 then
				uv3(slot7, slot10);
			end
		end

		if not uv0(slot0.left_camp_btn) then
			slot8 = PathTool.getCampGroupIcon(1000);

			if BattleController:getInstance():getModel():getCampIconConfigByIds(slot6) and slot9.icon then
				slot8 = PathTool.getCampGroupIcon(slot9.icon);

				if not slot0.left_camp_effect then
					slot10 = slot0.left_camp_btn:getContentSize();
					slot0.left_camp_effect = createImage(slot0.left_camp_btn, PathTool.getResFrame("common", "common_1101"), slot10.width / 2, slot10.height / 2, cc.p(0.5, 0.5), true);

					slot0.left_camp_effect:setScale(0.8);
				end

				slot0:updateCampEffect(true, slot0.left_camp_effect);
				addCountForCampIcon(slot0.left_camp_btn, slot9.nums);
			else
				slot0:updateCampEffect(false, slot0.left_camp_effect);
				addCountForCampIcon(slot0.left_camp_btn);
			end

			slot0.left_halo_load = loadImageTextureFromCDN(slot0.left_camp_btn, slot8, ResourcesType.single, slot0.left_halo_load);

			registerButtonEventListener(slot0.left_camp_btn, function ()
				uv0:openBattleCampView(true, uv1);
			end, true, nil, nil, 0.85);
		end

		if not uv0(slot0.right_camp_btn) then
			slot8 = PathTool.getCampGroupIcon(1000);

			if BattleController:getInstance():getModel():getCampIconConfigByIds(slot7) and slot9.icon then
				slot8 = PathTool.getCampGroupIcon(slot9.icon);

				if not slot0.right_camp_effect then
					slot10 = slot0.right_camp_btn:getContentSize();
					slot0.right_camp_effect = createImage(slot0.right_camp_btn, PathTool.getResFrame("common", "common_1101"), slot10.width / 2, slot10.height / 2, cc.p(0.5, 0.5), true);

					slot0.right_camp_effect:setScale(0.8);
				end

				slot0:updateCampEffect(true, slot0.right_camp_effect);
				addCountForCampIcon(slot0.right_camp_btn, slot9.nums);
			else
				slot0:updateCampEffect(false, slot0.right_camp_effect);
				addCountForCampIcon(slot0.right_camp_btn);
			end

			slot0.right_halo_load = loadImageTextureFromCDN(slot0.right_camp_btn, slot8, ResourcesType.single, slot0.right_halo_load);

			registerButtonEventListener(slot0.right_camp_btn, function ()
				uv0:openBattleCampView(true, uv1);
			end, true, nil, nil, 0.85);
		end

		slot8 = slot1.actor_role_name;
		slot9 = slot1.target_role_name;

		if uv2:getModel():getGroup() == BattleGroupTypeConf.TYPE_GROUP_ENEMY and not uv2:getWatchReplayStatus() then
			slot8 = slot1.target_role_name;
			slot9 = slot1.actor_role_name;
		end

		if slot8 then
			slot0.left_name_label:setString(slot8);
		end

		if slot9 then
			slot0.right_name_label:setString(slot9);
		end

		slot0:setPlayerNameClickStatus(slot1.objects);
	end
end

function BattleSceneNewView.setPlayerNameClickStatus(slot0, slot1)
	if not slot1 then
		do return end
	end

	slot2 = {};
	slot3 = {};

	for slot7, slot8 in pairs(slot1) do
		if slot8.object_type ~= BattleObjectType.Hallows and slot8.object_type ~= BattleObjectType.Elfin then
			if slot8.group == 1 then
				uv0(slot2, slot8);
			elseif slot8.group == 2 then
				uv0(slot3, slot8);
			end
		end
	end

	slot4 = RoleController:getInstance():getRoleVo();
	slot5 = 0;
	slot6 = 0;
	slot7 = false;
	slot8 = false;

	for slot12, slot13 in pairs(slot2) do
		if not slot13.owner_id or slot13.owner_id == 0 or not slot13.owner_srv_id then
			slot7 = true;
		elseif slot13.owner_id and slot13.owner_id == slot4.rid and slot13.owner_srv_id and slot13.owner_srv_id == slot4.srv_id then
			slot8 = true;
		end

		if slot7 or slot8 then
			slot5 = 0;
			slot6 = 0;

			break
		else
			slot5 = slot13.owner_id;
			slot6 = slot13.owner_srv_id;
		end
	end

	if slot5 ~= 0 and slot6 ~= "" then
		registerButtonEventListener(slot0.left_name_panel, function ()
			FriendController:getInstance():openFriendCheckPanel(true, {
				rid = uv0,
				srv_id = uv1
			});
		end, true);
	end

	slot9 = 0;
	slot10 = 0;
	slot7 = false;
	slot8 = false;

	for slot14, slot15 in pairs(slot3) do
		if not slot15.owner_id or slot15.owner_id == 0 or not slot15.owner_srv_id then
			slot7 = true;
		elseif slot15.owner_id and slot15.owner_id == slot4.rid and slot15.owner_srv_id and slot15.owner_srv_id == slot4.srv_id then
			slot8 = true;
		end

		if slot7 or slot8 then
			slot9 = 0;
			slot10 = 0;

			break
		else
			slot9 = slot15.owner_id;
			slot10 = slot15.owner_srv_id;
		end
	end

	if slot9 ~= 0 and slot10 ~= "" then
		registerButtonEventListener(slot0.right_name_panel, function ()
			FriendController:getInstance():openFriendCheckPanel(true, {
				rid = uv0,
				srv_id = uv1
			});
		end, true);
	end
end

function BattleSceneNewView.updateCampEffect(slot0, slot1, slot2)
	if not slot2 or uv0(slot2) then
		do return end
	end

	if slot1 == true then
		slot2:setVisible(true);
		slot2:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.6), cc.FadeOut:create(0.6))));
	else
		doStopAllActions(slot2);
		slot2:setVisible(false);
	end
end

function BattleSceneNewView.getStarPanelUI(slot0)
	if not slot0.dunge_data or next(slot0.dunge_data) == nil then
		do return end
	end

	if slot0.ui_layer and not uv0(slot0.ui_layer) and uv0(slot0.star_panel) then
		slot0.star_panel = createCSBNote(PathTool.getTargetCSB("battle/battle_star_panel"));
		slot6 = 0.5;

		slot0.star_panel:setAnchorPoint(cc.p(slot6, 0));
		slot0.ui_layer:addChild(slot0.star_panel);
		slot0.star_panel:setPosition(200, display.getTop(slot0) - 215);

		slot2 = {};

		for slot6 = 1, 3 do
			if slot0.star_panel:getChildByName("star_" .. slot6) then
				slot7:setVisible(false);
			end

			if slot0.star_panel:getChildByName("star_desc_" .. slot6) then
				slot8:setString("");
				uv1(slot2, slot8);
			end
		end

		do return slot2, {
			[slot6] = slot7
		} end
	end
end

function BattleSceneNewView.addBoosHpUI(slot0)
	slot0.resources_hp_load = ResourcesLoad.New(false);

	slot0.resources_hp_load:addAllList({
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster_result"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionwhitedaymonster", "actionwhitedaymonster"),
			type = ResourcesType.plist
		}
	}, function ()
		if uv0.battle_boss_hp_progress == nil then
			uv0.battle_boss_hp_progress = createCSBNote(PathTool.getTargetCSB("battle/battle_boss_hp_progress"));

			uv0.battle_boss_hp_progress:setAnchorPoint(cc.p(0.5, 0));
			uv0.battle_boss_hp_progress:setPosition(360, display.getTop(uv0) - 215);
			uv0.ui_layer:addChild(uv0.battle_boss_hp_progress);
		end

		uv0.battle_boss_hp_progress:setVisible(false);

		slot0 = uv0.battle_boss_hp_progress:getChildByName("progress_container");
		uv0.hp_title = slot0:getChildByName("hp_title");

		uv0.hp_title:setString(TI18N("剩余血量:"));

		uv0.boss_progress_o = slot0:getChildByName("progress_o");

		uv0.boss_progress_o:setPercent(0);

		uv0.boss_progress = slot0:getChildByName("progress");
		uv0.boss_progress_size = uv0.boss_progress:getContentSize();
		uv0.boss_progress_light_img = createImage(uv0.boss_progress, PathTool.getResFrame("actionwhitedaymonster", "actionwhitedaymonster_2"), 0, uv0.boss_progress_size.height / 2, cc.p(0.5, 0.5), true, 1, true);

		uv0.boss_progress:setPercent(100);

		uv0.boss_hp_count = slot0:getChildByName("hp_count");

		uv0.boss_hp_count:setString("");

		uv0.hero_node = slot0:getChildByName("head_panel"):getChildByName("hero_node");
		slot2 = cc.size(72, 72);
		uv0.boss_icon_clipNode = cc.ClippingNode:create(createSprite(PathTool.getResFrame("common", "common_1032"), slot2.width / 2, slot2.height / 2, nil, cc.p(0.5, 0.5)));

		uv0.boss_icon_clipNode:setScale(0.94);
		uv0.boss_icon_clipNode:setAnchorPoint(cc.p(0.5, 0.5));
		uv0.boss_icon_clipNode:setContentSize(slot2);
		uv0.boss_icon_clipNode:setCascadeOpacityEnabled(true);
		uv0.boss_icon_clipNode:setAlphaThreshold(0);
		uv0.hero_node:addChild(uv0.boss_icon_clipNode, 2);

		uv0.boss_icon = ccui.ImageView:create();

		uv0.boss_icon:setScale(0.8);
		uv0.boss_icon:setCascadeOpacityEnabled(true);
		uv0.boss_icon:setAnchorPoint(0.5, 0.5);
		uv0.boss_icon:setPosition(slot2.width / 2, slot2.height / 2);
		uv0.boss_icon_clipNode:addChild(uv0.boss_icon, 3);

		uv0.boss_hp_max = 0;

		if uv0.boss_hp_updaet_event == nil then
			uv0.boss_hp_updaet_event = GlobalEvent:getInstance():Bind(BattleEvent.Battle_Boss_Hp_Event, function (slot0)
				if not uv0.battle_boss_hp_progress then
					do return end
				end

				uv0:updateBossUIInfo(slot0);
			end);
		end
	end);
end

function BattleSceneNewView.updateBossUIInfo(slot0, slot1)
	if not slot1 then
		do return end
	end

	if slot1.show_type == 1 then
		slot3 = slot1.head_icon;

		if slot0.boss_icon and slot3 then
			slot0.boss_icon:loadTexture(PathTool.getHeadIcon(slot3), LOADTEXT_TYPE);
		end
	elseif slot2 == 2 then
		slot0.battle_boss_hp_progress:setVisible(true);

		if slot1.battle_role then
			slot0.boss_hp_max = slot3.hp_max or 0;

			if slot0.boss_progress and slot5 ~= 0 then
				slot0.boss_progress:setPercent((slot3.hp or 0) * 100 / slot5);
			end

			if slot0.boss_hp_count then
				slot0.boss_hp_count:setString(slot4 .. "/" .. slot5);
			end
		end
	elseif slot2 == 3 then
		if slot0.boss_hp_max == 0 then
			do return end
		end

		if slot1.percent then
			if slot0.boss_progress then
				slot0.boss_progress:setPercent(slot3);
			end

			if slot0.boss_hp_count then
				slot0.boss_hp_count:setString(math.floor(slot0.boss_hp_max * slot3 / 100) .. "/" .. slot0.boss_hp_max);
			end
		end
	end
end

function BattleSceneNewView.addYearMonsterUI(slot0, slot1)
	if slot0.dunge_data[1] and slot0.dunge_data[1].param ~= ActionyearmonsterConstants.Evt_Type.Monster or slot1 then
		slot0.resources_load = ResourcesLoad.New(false);

		slot0.resources_load:addAllList({
			{
				path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster_result"),
				type = ResourcesType.plist
			},
			{
				path = PathTool.getPlistImgForDownLoad("actionwhitedaymonster", "actionwhitedaymonster"),
				type = ResourcesType.plist
			}
		}, function ()
			if uv0.actionyearmonster_hp_progress == nil then
				uv0.actionyearmonster_hp_progress = createCSBNote(PathTool.getTargetCSB("actionyearmonster/actionyearmonster_hp_progress"));

				uv0.actionyearmonster_hp_progress:setAnchorPoint(cc.p(0.5, 0));
				uv0.actionyearmonster_hp_progress:setPosition(360, display.getTop(uv0) - 215);
				uv0.ui_layer:addChild(uv0.actionyearmonster_hp_progress);
			end

			slot0 = uv0.actionyearmonster_hp_progress:getChildByName("progress_container");
			uv0.year_progress_o = slot0:getChildByName("progress_o");

			uv0.year_progress_o:setPercent(0);

			uv0.year_progress = slot0:getChildByName("progress");
			uv0.year_progress_size = uv0.year_progress:getContentSize();
			uv0.progress_light_img = createImage(uv0.year_progress, PathTool.getResFrame("actionwhitedaymonster", "actionwhitedaymonster_2"), 0, uv0.year_progress_size.height / 2, cc.p(0.5, 0.5), true, 1, true);

			uv0.year_progress:setPercent(0);

			uv0.year_hp_count = slot0:getChildByName("hp_count");

			uv0.year_hp_count:setString("0/0");

			uv0.year_box_lev = slot0:getChildByName("box_lev");

			uv0.year_box_lev:setString("0");

			uv0.record_box_count = 0;
			uv0.per_max = 0;
			uv0.cur_per = 0;
			uv0.year_box_effect = {};

			if uv0.year_progress_timer == nil then
				uv0.year_progress_timer = GlobalTimeTicket:getInstance():add(function ()
					uv0:updateYearProgress();
				end, 0.02);
			end

			if uv1 then
				slot1 = slot0:getChildByName("head_panel");

				slot1:getChildByName("head_bg_0"):setLocalZOrder(99);
				uv0:setMonsterYearHead(slot1, ActionController:getInstance():getModel():getWhiteDayHeadId());
			else
				uv0.year_monster_type = uv0.dunge_data[1].param;
			end
		end);
	end
end

function BattleSceneNewView.setMonsterYearHead(slot0, slot1, slot2)
	slot3 = slot1:getContentSize();
	slot1.mask_res = PathTool.getResFrame("common", "common_1032");

	if slot1.mask_res ~= nil then
		slot1.mark_bg = createSprite(slot1.mask_res, slot3.width / 2, slot3.height / 2, slot1, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 1);
		slot1.mask = createSprite(slot1.mask_res, slot3.width / 2, slot3.height / 2, nil, cc.p(0.5, 0.5));
		slot1.clipNode = cc.ClippingNode:create(slot1.mask);

		slot1.clipNode:setAnchorPoint(cc.p(0.5, 0.5));
		slot1.clipNode:setContentSize(slot3);
		slot1.clipNode:setCascadeOpacityEnabled(true);
		slot1.clipNode:setPosition(slot3.width / 2, slot3.height / 2);
		slot1.clipNode:setAlphaThreshold(0);
		slot1:addChild(slot1.clipNode, 2);

		slot1.icon = ccui.ImageView:create();

		slot1.icon:setCascadeOpacityEnabled(true);
		slot1.icon:setAnchorPoint(0.5, 0.5);
		slot1.icon:setPosition(slot3.width / 2, slot3.height / 2 + 2);
		slot1.clipNode:addChild(slot1.icon, 3);
	end

	slot1.clipNode:setScale(0.9);

	res = PathTool.getHeadIcon(slot2);

	slot1.icon:loadTexture(res, LOADTEXT_TYPE);
end

function BattleSceneNewView.updateYearUIInfo(slot0, slot1)
	if not slot0.record_box_count then
		do return end
	end

	if not slot0.actionyearmonster_hp_progress then
		do return end
	end

	slot2, slot3, slot4 = nil;

	if slot0.battle_type == BattleConst.Fight_Type.WhiteDayWar then
		slot2, slot3, slot4 = ActionController:getInstance():getModel():getHarmRewardInfo(slot1);
	else
		if not slot0.year_monster_type then
			do return end
		end

		slot2, slot3, slot4 = ActionyearmonsterController:getInstance():getModel():getHarmRewardInfo(slot1, slot0.year_monster_type);
	end

	if slot2 > 0 and slot3 then
		slot6 = slot3.dps_low or slot3.min;
		slot9 = (slot1 - slot6) * 100 / ((slot3.dps_low or slot3.max) - slot6);

		slot0.year_progress_o:setPercent(slot9);
		slot0:updateYearProgress(slot9);

		if slot0.battle_type == BattleConst.Fight_Type.WhiteDayWar and slot0.year_progress_size and slot0.progress_light_img then
			if slot7 > 0 then
				slot0.progress_light_img:setVisible(true);
				slot0.progress_light_img:setPositionX(slot0.year_progress_size.width * slot7 / slot8);
			else
				slot0.progress_light_img:setVisible(false);
			end
		end

		slot0.year_hp_count:setString(uv0("%s/%s", slot1, slot5));

		slot10 = slot2 - 1;

		slot0.year_box_lev:setString(slot10);

		if slot10 - slot0.record_box_count > 0 then
			for slot16 = 1, slot11 do
				slot0:updateYearBoxEffect(slot0.record_box_count + slot16);
			end
		end
	end
end

function BattleSceneNewView.updateYearProgress(slot0, slot1)
	if slot1 ~= nil then
		slot0.per_max = slot1;

		if slot0.per_max < slot0.cur_per then
			slot0.cur_per = 0;
		end
	end

	if slot0.cur_per < slot0.per_max then
		if (slot0.per_max - slot0.cur_per) * 0.05 < 0.2 then
			slot2 = 0.2;
		end

		slot0.cur_per = slot0.cur_per + slot2;

		if slot0.per_max < slot0.cur_per then
			slot0.cur_per = slot0.per_max;
		end

		if slot0.year_progress then
			slot0.year_progress:setPercent(slot0.cur_per);
		end
	end
end

function BattleSceneNewView.updateYearBoxEffect(slot0, slot1)
	if not slot0.year_box_effect then
		do return end
	end

	if slot0.is_show_action8 then
		do return end
	end

	slot0.record_box_count = slot1;

	if slot1 > 0 then
		slot2 = (slot1 - 1) % 7 + 1;

		if slot0.year_box_effect[slot2] == nil then
			if slot2 == 7 then
				slot0.year_box_effect[slot2] = createEffectSpine("E27704", cc.p(0, display.getBottom(slot0)), cc.p(0.5, 0.5), false, "action" .. slot2, function ()
					uv0:endYearEffect();
				end);
			else
				slot0.year_box_effect[slot2] = createEffectSpine("E27704", cc.p(0, display.getBottom(slot0)), cc.p(0.5, 0.5), false, slot3);
			end

			slot0.ui_layer:addChild(slot0.year_box_effect[slot2]);
		elseif not slot0.year_box_effect[slot2]:isVisible() then
			slot0.year_box_effect[slot2]:setVisible(true);
			slot0.year_box_effect[slot2]:setAnimation(0, slot3, false);
		end
	end
end

function BattleSceneNewView.endYearEffect(slot0)
	if not slot0.year_box_effect then
		do return end
	end

	if slot0.is_show_action8 then
		for slot4, slot5 in pairs(slot0.year_box_effect) do
			slot5:setVisible(false);
		end

		slot0.is_show_action8 = false;
	else
		for slot4, slot5 in pairs(slot0.year_box_effect) do
			if slot4 == 7 then
				slot0.is_show_action8 = true;

				slot5:setAnimation(0, "action8", false);
			else
				slot5:setVisible(false);
			end
		end
	end
end

function BattleSceneNewView.addSandybeachBossFightUI(slot0)
	slot1, slot2 = slot0:getStarPanelUI();

	if slot1 and slot2 then
		for slot6 = 1, 3 do
			if slot0.star_panel:getChildByName("gary_star_" .. slot6) then
				slot7:setVisible(false);
			end
		end

		if not slot0.dunge_data[1] then
			do return end
		end

		if Config.HolidayBossData.data_boss_info(slot0.dunge_data[1].param or 1) then
			for slot8 = 1, 3 do
				if slot1[slot8] then
					slot1[slot8]:setPositionX(12);

					if slot8 == 1 then
						slot1[slot8]:setString(TI18N("关卡效果:"));
					elseif slot4.add_skill_decs[slot8 - 1] then
						slot1[slot8]:setString(slot4.add_skill_decs[slot8 - 1]);
					end
				end
			end
		end
	end
end

function BattleSceneNewView.addLimitExerciseBossFightUI(slot0)
	slot1, slot2 = slot0:getStarPanelUI();

	if slot1 and slot2 then
		for slot6 = 1, 3 do
			if slot0.star_panel:getChildByName("gary_star_" .. slot6) then
				slot7:setVisible(false);
			end
		end

		if slot0.dunge_data[1] and slot0.dunge_data[2] and slot0.dunge_data[3] and slot0.dunge_data[4] then
			slot4 = slot0.dunge_data[2].param or 1;
			slot5 = slot0.dunge_data[3].param or 1;
			slot6 = slot0.dunge_data[4].param or 1;

			if Config.HolidayBossNewData.data_change_boss_list[slot0.dunge_data[1].param or 1] and slot7[slot3][slot4] and slot7[slot3][slot4][slot5] and slot7[slot3][slot4][slot5][slot6] and slot7[slot3][slot4][slot5][slot6] then
				for slot12 = 1, 3 do
					if slot1[slot12] then
						slot1[slot12]:setPositionX(12);

						if slot12 == 1 then
							slot1[slot12]:setString(TI18N("关卡效果:"));
						elseif slot8.add_skill_decs[slot12 - 1] then
							slot1[slot12]:setString(slot8.add_skill_decs[slot12 - 1]);
						end
					end
				end
			end
		end
	end
end

function BattleSceneNewView.addHeavenStarUI(slot0)
	slot1 = false;

	for slot5, slot6 in ipairs(slot0.dunge_data) do
		if slot5 == 1 then
			slot0.heaven_chapter_id = slot6.param;
		elseif slot5 == 2 then
			slot0.heaven_customs_id = slot6.param;
		elseif slot5 == 6 and slot6.param ~= 1 then
			slot1 = true;
		end
	end

	if slot1 then
		slot0:addExitBtnUI();
	end
end

function BattleSceneNewView.updateHeavenStarInfo(slot0, slot1)
	if not slot0.heaven_chapter_id or not slot0.heaven_customs_id then
		do return end
	end

	if slot0.battle_type ~= BattleConst.Fight_Type.HeavenWar then
		do return end
	end

	slot0.star_status_list = slot1 or {};
	slot3 = (Config.DungeonHeavenData.data_customs[slot0.heaven_chapter_id] or {})[slot0.heaven_customs_id];

	if not slot0.desc_txt_list or not slot0.star_node_list then
		slot0.desc_txt_list, slot0.star_node_list = slot0:getStarPanelUI();
	end

	if slot3 and slot0.desc_txt_list and slot0.star_node_list then
		for slot7, slot8 in ipairs(slot3.cond_info) do
			slot9 = slot8[1];
			slot12 = Config.DungeonHeavenData.data_star_cond[slot8[2]];

			if slot0.desc_txt_list[slot7] and slot12 then
				slot11:setString(slot12.type);
			end

			if slot0.star_node_list[slot7] then
				slot13:setVisible(slot0:checkHeavenStarIsOpen(slot9));
			end
		end
	end
end

function BattleSceneNewView.checkHeavenStarIsOpen(slot0, slot1)
	slot2 = false;

	for slot6, slot7 in pairs(slot0.star_status_list) do
		if slot7.id == slot1 then
			slot2 = slot7.val == 1;

			break
		end
	end

	do return slot2 end
end

function BattleSceneNewView.updateSkipTeamBtnStatus(slot0)
	if not slot0.skip_team_btn then
		do return end
	end

	if slot0.battle_type == BattleConst.Fight_Type.HeavenWar then
		slot1 = false;

		for slot5, slot6 in pairs(slot0.dunge_data) do
			if slot5 == 9 and slot6.param == 1 then
				slot1 = true;
			end
		end

		slot0.skip_team_btn:setVisible(slot1);
	end
end

function BattleSceneNewView.addSessionStatusUI(slot0)
	if slot0.ui_layer and not uv0(slot0.ui_layer) then
		if uv0(slot0.session_panel) then
			slot0.session_panel = createCSBNote(PathTool.getTargetCSB("battle/battle_team_status_panel"));

			slot0.session_panel:setAnchorPoint(cc.p(0.5, 0));
			slot0.ui_layer:addChild(slot0.session_panel);

			slot4 = slot0.main_size.width * 0.5;

			slot0.session_panel:setPosition(slot4, display.getTop(slot0) - 155);

			slot0.session_list = {};

			for slot4 = 1, 3 do
				uv1(slot0.session_list, {
					sp_icon = slot0.session_panel:getChildByName("sp_icon_" .. slot4),
					sp_status = slot0.session_panel:getChildByName("sp_status_" .. slot4)
				});
			end

			slot0.session_txt = slot0.session_panel:getChildByName("txt_session");
		end

		slot1 = 1;
		slot2 = {};

		for slot6, slot7 in ipairs(slot0.dunge_data) do
			if slot6 == 1 then
				slot1 = slot7.param;
			elseif slot6 == 2 then
				uv1(slot2, slot7.param);
			elseif slot6 == 3 then
				uv1(slot2, slot7.param);
			elseif slot6 == 4 then
				uv1(slot2, slot7.param);
			end
		end

		slot0.session_txt:setString(uv2(TI18N("当前:第%d局"), slot1));

		if slot0.session_list then
			for slot6, slot7 in ipairs(slot0.session_list) do
				if slot2[slot6] then
					if slot7.sp_icon then
						setChildUnEnabled(slot8 ~= 1, slot7.sp_icon);
					end

					if slot8 ~= 0 and slot6 < slot1 then
						slot9 = nil;

						if slot8 == 1 then
							slot9 = PathTool.getResFrame("battle", "txt_cn_battle_win");
						elseif slot8 == 2 then
							slot9 = PathTool.getResFrame("battle", "txt_cn_battle_lose");
						elseif slot8 == 3 then
							slot9 = PathTool.getResFrame("battle", "txt_cn_battle_dogfall");
						end

						if slot9 and slot7.sp_status then
							loadSpriteTexture(slot7.sp_status, slot9, LOADTEXT_TYPE_PLIST);
							slot7.sp_status:setVisible(true);
						end

						slot7.sp_icon:setVisible(true);
					elseif slot7.sp_status then
						slot7.sp_status:setVisible(false);
						slot7.sp_icon:setVisible(false);
					end
				end
			end
		end
	end
end

function BattleSceneNewView.createLevTips(slot0, slot1)
end

function BattleSceneNewView.createLookupTarget(slot0)
end

function BattleSceneNewView.createAutoCombatIcon(slot0)
	do return end

	if not uv0:checkIsInDramaUIFight() then
		do return end
	end

	if slot0.auto_combat_btn == nil then
		slot0.auto_combat_btn = createButton(slot0.ui_main_layer, TI18N("自动"), slot0.main_size.width - 44, uv0:getBottomHeight() + 192, cc.size(79, 79), PathTool.getResFrame("battle", "battle_btn_7"), 20, Config.ColorData.data_color4[1]);

		slot0.auto_combat_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.auto_combat_btn.status == 3 then
					uv1:send13003(1);
				elseif uv0.auto_combat_btn.status == 4 then
					CommonAlert.show(TI18N("开启“自动推图”后队伍将不断挑战下一关卡（离线不会中断），直到战斗失败或背包满格，是否确定自动战斗？"), TI18N("确认"), function ()
						uv0:send13003(1);
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true);
				elseif uv0.auto_combat_btn.status == 2 then
					message(string.format(TI18N("通关%s开启"), Config.DungeonData.data_drama_dungeon_info(Config.DungeonData.data_drama_const.auto_combat_dun_id.val).name));
				else
					message(string.format(TI18N("船长达%s级后开启"), Config.DungeonData.data_drama_const.auto_combat_lev.val));
				end
			end
		end, true);
	end

	if uv2:getQuickData().is_auto_combat == 1 then
		slot0.auto_combat_btn.status = 3;

		slot0.auto_combat_btn:setBtnLabel(TI18N("取消\n自动"));
		slot0.auto_combat_btn:getButton():runAction(cc.RepeatForever:create(cc.RotateBy:create(4, 360)));
	else
		slot0.auto_combat_btn.status = 4;

		slot0.auto_combat_btn:setBtnLabel(TI18N("自动\n推图"));
		slot0.auto_combat_btn:getButton():stopAllActions();
	end

	slot3 = uv2:getDramaData();

	if RoleController:getInstance():getRoleVo() and slot2.lev < Config.DungeonData.data_drama_const.auto_combat_lev.val then
		slot0.auto_combat_btn:setRichText(string.format(TI18N("<div fontcolor=#ffffff outline=2,#000000>%s级开启</div>"), Config.DungeonData.data_drama_const.auto_combat_lev.val), 18, 1, 100);
		slot0.auto_combat_btn.rich_label:setPosition(-1, 18);
		slot0.auto_combat_btn.btn_label:setVisible(true);

		slot0.auto_combat_btn.status = 1;

		slot0.auto_combat_btn:setGrayAndUnClick(true, 0);
		slot0.auto_combat_btn:enableOutline(cc.c4b(90, 90, 90, 255), 2);
	elseif slot3 and slot3.max_dun_id < Config.DungeonData.data_drama_const.auto_combat_dun_id.val then
		slot4 = Config.DungeonData.data_drama_dungeon_info(Config.DungeonData.data_drama_const.auto_combat_dun_id.val);

		slot0.auto_combat_btn:setRichText(TI18N("<div fontcolor=#ffffff outline=2,#000000>未开启</div>"), 18, 1, 300);
		slot0.auto_combat_btn.rich_label:setPositionY(6);
		slot0.auto_combat_btn.btn_label:setVisible(true);

		slot0.auto_combat_btn.status = 2;

		slot0.auto_combat_btn:setGrayAndUnClick(true, 0);
		slot0.auto_combat_btn:enableOutline(cc.c4b(90, 90, 90, 255), 2);
	else
		slot0.auto_combat_btn:setGrayAndUnClick(false);
		slot0.auto_combat_btn:enableOutline(cc.c4b(90, 44, 0, 255), 2);
	end
end

function BattleSceneNewView.clearBuffIcon(slot0, ...)
	if slot0.battle_buff_object then
		if not uv0(slot0.battle_buff_object.container) then
			slot0:clearDieTimer();
			slot0.battle_buff_object.container:removeFromParent();
		end

		slot0.battle_buff_object = nil;
	end
end

function BattleSceneNewView.createBuffIcon(slot0, slot1)
	if not slot1 then
		do return end
	end

	if next(slot1.buff_list or {}) == nil then
		slot0:clearBuffIcon();

		do return end
	end

	slot0.room_buff_data = slot1.buff_list;

	if slot0.room_buff_data[1] and Config.BuffData.data_get_buff_data[slot2.bid] then
		if slot0.battle_buff_object == nil then
			slot0.battle_buff_object = {};
			slot3 = createCSBNote(PathTool.getTargetCSB("battle/battle_buff_icon"));

			slot3:setAnchorPoint(0, 0);
			slot3:setPosition(slot0.main_size.width - 118, slot0.main_size.height / 2 + 190);
			slot0.ui_main_layer:addChild(slot3);

			slot0.battle_buff_object.container = slot3;
			slot0.battle_buff_object.buff_icon = slot3:getChildByName("icon");
			slot0.battle_buff_object.buff_time = slot3:getChildByName("num_label");
			slot0.battle_buff_object.buff_desc = slot3:getChildByName("desc_label");
		end

		if Config.BuffData.data_get_buff_data[slot2.bid] then
			if PathTool.getBuffRes(slot3.icon) ~= slot0.battle_buff_object.buff_res then
				slot0.battle_buff_object.buff_res = slot4;

				loadSpriteTexture(slot0.battle_buff_object.buff_icon, slot4, LOADTEXT_TYPE);
			end

			slot0.battle_buff_object.time = slot2.end_time - GameNet:getInstance():getTime();

			slot0.battle_buff_object.buff_desc:setString(slot3.des);
		end

		slot0:clearDieTimer();

		if slot0.die_timer == nil then
			slot0.die_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0:handleDieTimer();
			end, 1);
		end
	end
end

function BattleSceneNewView.handleDieTimer(slot0)
	if slot0.battle_buff_object and slot0.battle_buff_object.time and not uv0(slot0.battle_buff_object.buff_time) then
		slot0.battle_buff_object.time = slot0.battle_buff_object.time - 1;

		slot0:updateBuffTimer(slot0.battle_buff_object.buff_time, slot0.battle_buff_object.time);
	end
end

function BattleSceneNewView.updateBuffTimer(slot0, slot1, slot2)
	if slot2 and slot1 then
		if slot3 > 0 then
			slot1:setString(TimeTool.GetTimeMS(slot2));
		else
			slot1:setString("00:00");
		end
	end
end

function BattleSceneNewView.floorTips(slot0, slot1, slot2)
	if Config.CombatTypeData.data_fight_list[slot0.battle_type] then
		slot0.call_back = slot1;

		if BattleConst.isNeedSpecStart(slot0.battle_type) then
			if slot0.battle_type == BattleConst.Fight_Type.CrossArenaWar then
				slot4 = 1;

				for slot8, slot9 in pairs(slot0.dunge_data or {}) do
					if slot8 == 1 then
						slot4 = slot9.param;

						break
					end
				end

				if slot4 == 1 then
					slot0:showSpecStart(slot0.call_back, slot2);
				else
					slot0.call_back();
				end
			else
				slot0:showSpecStart(slot0.call_back, slot2);
			end
		else
			slot4 = slot3.start_effect;

			if slot0.battle_type == BattleConst.Fight_Type.Darma and uv0:getDramaData() and slot5.dun_id and (Config.DungeonData.data_drama_dungeon_info(slot5.dun_id) or {}).is_big ~= 1 then
				slot4 = "E51147";
			end

			playEffectOnce(slot4, slot0.main_size.width * 0.5, 770, slot0.ui_layer, function ()
				if uv0.call_back then
					uv0.call_back();
				end
			end, nil, nil, nil, PlayerAction.action, 1, true);
		end
	elseif slot0.call_back then
		slot0.call_back();
	end
end

function BattleSceneNewView.showSpecStart(slot0, slot1, slot2)
	if slot0.spec_tips then
		slot0.spec_tips:stopAllActions();
		slot0.spec_tips:removeAllChildren();

		slot0.spec_tips = nil;
	end

	if not slot2 then
		do return end
	end

	slot3 = {};

	if slot2 then
		for slot7, slot8 in pairs(slot2.formation) do
			slot3[slot8.group] = {
				slot8.formation_type or 1,
				slot8.formation_lev or 0
			};
		end
	end

	if not slot0.spec_tips then
		slot0.spec_tips = ccui.Layout:create();

		slot0.spec_tips:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT));
		slot0.spec_tips:setAnchorPoint(cc.p(0.5, 0.5));
		slot0.spec_tips:setPosition(slot0.main_size.width / 2, slot0.main_size.height / 2);
		slot0.spec_tips:setScale(display.getMaxScale());
		showLayoutRect(slot0.spec_tips, 155);
		slot0.ui_layer:addChild(slot0.spec_tips);
	end

	if slot0.spec_tips then
		slot5 = SCREEN_HEIGHT * 0.5 - 100;
		slot0.left_bg = ccui.Layout:create();

		slot0.left_bg:setContentSize(399, 56);
		slot0.left_bg:setAnchorPoint(cc.p(1, 0.5));
		slot0.left_bg:setPosition(0, SCREEN_HEIGHT * 0.5 + 100);
		slot0.spec_tips:addChild(slot0.left_bg);
		createSprite(PathTool.getResFrame("battle", "battle_star_bg"), 0, 28, slot0.left_bg, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST):setScale(4);

		slot7 = createSprite(PathTool.getResFrame("battle", "battle_zhenfa_quan"), 120, 27, slot0.left_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST);

		if slot3 then
			slot8 = slot3[1] and slot3[1][1] and createSprite(PathTool.getResFrame("battle", "battle_form_icon_" .. slot3[1][1]), 120, 27, slot0.left_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST);
		end

		slot0.left_name = createLabel(26, cc.c4b(255, 245, 212, 255), nil, 150, slot0.left_bg:getContentSize().height / 2, slot2.actor_role_name, slot0.left_bg, 2, cc.p(0, 0.5));
		slot0.right_bg = ccui.Layout:create();

		slot0.right_bg:setContentSize(399, 56);
		slot0.right_bg:setAnchorPoint(cc.p(0, 0.5));
		slot0.right_bg:setPosition(slot0.main_size.width, slot5);
		slot0.spec_tips:addChild(slot0.right_bg);
		createSprite(PathTool.getResFrame("battle", "battle_star_bg"), 0, 28, slot0.right_bg, cc.p(0, 0.5), LOADTEXT_TYPE_PLIST):setScale(4);

		slot9 = createSprite(PathTool.getResFrame("battle", "battle_zhenfa_quan"), 120, 27, slot0.right_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST);

		if slot3 then
			slot10 = slot3[2] and slot3[2][1] and createSprite(PathTool.getResFrame("battle", "battle_form_icon_" .. slot3[2][1]), 120, 27, slot0.right_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST);
		end

		slot0.right_name = createLabel(26, cc.c4b(255, 245, 212, 255), nil, 150, slot0.right_bg:getContentSize().height / 2, slot2.target_role_name, slot0.right_bg, 2, cc.p(0, 0.5));

		slot0.left_bg:runAction(cc.Sequence:create(cc.MoveTo:create(0.4, cc.p(520, slot4)), cc.CallFunc:create(function (...)
			uv0:showEffect(uv1);
		end), cc.DelayTime:create(2), cc.CallFunc:create(function ()
			uv0:clearSpeEffect();

			if uv0.spec_tips and not uv1(uv0.spec_tips) then
				uv0.spec_tips:stopAllActions();
				uv0.spec_tips:removeAllChildren();
				uv0.spec_tips:removeFromParent();

				uv0.spec_tips = nil;
			end

			if uv2 then
				uv2();
			end
		end)));
		slot0.right_bg:runAction(cc.Sequence:create(cc.MoveTo:create(0.4, cc.p(200, slot5)), cc.DelayTime:create(0.5), cc.CallFunc:create(function (...)
			uv0:showRightEffect(uv1);
		end)));
	end
end

function BattleSceneNewView.showEffect(slot0, slot1)
	slot0:clearSpeEffect();

	if not slot0.left_effect then
		slot0.left_effect = createEffectSpine(PathTool.getEffectRes(321), cc.p(slot0.left_bg:getContentSize().width / 2, slot0.left_bg:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action_1);

		slot0.left_effect:setScale(-1);
		slot0.left_bg:addChild(slot0.left_effect);
	end

	if not slot0.spec_effect_2 then
		slot0.spec_effect_2 = createEffectSpine(PathTool.getEffectRes(321), cc.p(slot0.spec_tips:getContentSize().width / 2, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_2);

		slot0.spec_tips:addChild(slot0.spec_effect_2);
	end
end

function BattleSceneNewView.showRightEffect(slot0, slot1)
	if not slot0.right_effect then
		slot0.right_effect = createEffectSpine(PathTool.getEffectRes(321), cc.p(slot0.right_bg:getContentSize().width / 2, slot0.right_bg:getContentSize().height / 2), cc.p(0.5, 0.5), false, PlayerAction.action_1);

		slot0.right_effect:setScale(-1);
		slot0.right_bg:addChild(slot0.right_effect);
	end
end

function BattleSceneNewView.clearSpeEffect(slot0)
	if slot0.left_effect then
		slot0.left_effect:runAction(cc.RemoveSelf:create(true));

		slot0.left_effect = nil;
	end

	if slot0.spec_effect_2 then
		slot0.spec_effect_2:runAction(cc.RemoveSelf:create(true));

		slot0.spec_effect_2 = nil;
	end

	if slot0.right_effect then
		slot0.right_effect:runAction(cc.RemoveSelf:create(true));

		slot0.right_effect = nil;
	end
end

function BattleSceneNewView.setWait(slot0, slot1)
	if slot0.round_time_widget and not uv0(slot0.round_time_widget) then
		if slot1 == true then
			slot0.round_time_widget:setVisible(true);
		else
			slot0.round_time_widget:setVisible(false);
		end
	end
end

function BattleSceneNewView.addExitBtnUI(slot0)
	if slot0.leave_btn == nil then
		slot1 = PathTool.getResFrame("battle", "battle_exit");

		if slot0.battle_type == BattleConst.Fight_Type.HeavenWar then
			slot1 = PathTool.getResFrame("battle", "txt_cn_exit_battle_2");
		end

		slot0.leave_btn = createButton(slot0.ui_layer, "", 0, 0, nil, slot1, 24);
		slot2 = MainuiController:getInstance():getMainUi():getTopViewHeight();

		if slot0.battle_type == BattleConst.Fight_Type.Darma then
			slot0.leave_btn:setPosition(slot0.main_size.width - 120, slot0.main_size.height / 2 + 240);
		else
			slot0.leave_btn:setPosition(slot0.main_size.width - 60, slot0.main_size.height - slot2 - 40);
		end

		slot0.leave_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.battle_type == BattleConst.Fight_Type.HeavenWar then
					CommonAlert.show(TI18N("若退出本场战斗则无法获得奖励，确定要退出吗？\n                          （本场不消耗挑战次数）"), TI18N("我要退出"), function ()
						uv0:csFightExit();
					end, TI18N("继续挑战"), nil, CommonAlert.type.rich);
				else
					uv1:csFightExit();
				end
			end
		end);
	end
end

function BattleSceneNewView.addGuildBossUI(slot0, slot1, slot2)
	if slot1 == BattleConst.Fight_Type.GuildDun or slot1 == BattleConst.Fight_Type.MonopolyBoss then
		if not slot0.guild_boss_view then
			slot0.guild_boss_view_size = cc.size(SCREEN_WIDTH, 100);
			slot0.guild_boss_view = ccui.Widget:create();

			slot0.guild_boss_view:setContentSize(slot0.guild_boss_view_size);
			slot0.guild_boss_view:setAnchorPoint(cc.p(0, 1));
			slot0.guild_boss_view:setPosition(display.getLeft(slot0), slot0.main_size.height / 2 + 340);
			slot0.guild_boss_view:setCascadeOpacityEnabled(true);
			slot0.ui_main_layer:addChild(slot0.guild_boss_view);

			slot3 = 50;
			slot0.total_hurt = createSprite(PathTool.getResFrame("battle", "txt_cn_battle_total_hurt"), slot0.guild_boss_view_size.width / 2, slot3, slot0.guild_boss_view, cc.p(1, 1));

			slot0.total_hurt:setVisible(true);

			slot0.get_label = createRichLabel(28, 1, cc.p(0, 1), cc.p(slot0.total_hurt:getPositionX() + 5, slot3), nil, nil, 200);

			slot0.guild_boss_view:addChild(slot0.get_label);
		end

		if slot2 ~= nil then
			slot0.get_label:setString(uv0("<div fontcolor=#ffffff outline=2,#401f0e>%s</div>", slot2));
		end
	end
end

function BattleSceneNewView.addGuildSecretAreaUI(slot0)
	if slot0.ui_main_layer then
		slot1 = SCREEN_WIDTH * 0.5;
		slot2 = slot0.main_size.height / 2 + 420;

		createImage(slot0.ui_main_layer, PathTool.getResFrame("common", "common_90056"), slot1, slot2, cc.p(0.5, 0.5), true, nil, true):setContentSize(cc.size(500, 74));

		slot6 = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(2, 0, 25, 255), slot1, slot2 + 13, TI18N("秘境Boss免疫【封印】且每回合攻击递增"), slot0.ui_main_layer, 2, cc.p(0.5, 0.5));
		slot7 = createLabel(20, cc.c4b(255, 255, 255, 255), cc.c4b(2, 0, 25, 255), slot1, slot2 - 13, TI18N("在第10回合进入爆发状态并将造成大量伤害"), slot0.ui_main_layer, 2, cc.p(0.5, 0.5));
	end
end

function BattleSceneNewView.addEliteMatchUI(slot0, slot1)
	if slot1 == BattleConst.Fight_Type.EliteKingMatchWar and slot0.dunge_data then
		slot0.elitematch_bg = createScale9Sprite(PathTool.getResFrame("common", "common_90056"));

		slot0.elitematch_bg:setScale9Enabled(true);
		slot0.elitematch_bg:setContentSize(cc.size(315, 80));
		slot0.elitematch_bg:setPosition(SCREEN_WIDTH * 0.5, slot0.main_size.height / 2 + 280);
		slot0.ui_main_layer:addChild(slot0.elitematch_bg);

		slot3, slot4 = nil;
		slot0.elitematch_label1 = createLabel(26, cc.c4b(255, 242, 199, 255), nil, slot2.width * 0.5, slot2.height * 0.7, (not slot0.dunge_data[1] or uv0(TI18N("第%s场"), slot0.dunge_data[1].param)) and TI18N("第1场"), slot0.elitematch_bg, nil, cc.p(0.5, 0.5));
		slot0.elitematch_label2 = createLabel(22, cc.c4b(255, 242, 199, 255), nil, slot2.width * 0.5, slot2.height * 0.3, (not slot0.dunge_data[2] or not slot0.dunge_data[3] or uv0(TI18N("%s:%s"), slot0.dunge_data[2].param, slot0.dunge_data[3].param)) and "0:0", slot0.elitematch_bg, nil, cc.p(0.5, 0.5));
	end
end

function BattleSceneNewView.addEliteDeclarationUI(slot0, slot1, slot2, slot3)
	if not slot0.dunge_data then
		do return end
	end

	if not slot0.form_view then
		do return end
	end

	if slot1 == BattleConst.Fight_Type.EliteMatchWar or slot1 == BattleConst.Fight_Type.EliteKingMatchWar then
		slot5, slot6 = nil;

		function slot7(slot0)
			if uv0.dunge_data[slot0] then
				do return uv0.dunge_data[slot0].param end
			end

			do return 0 end
		end

		if (slot2 or 1) == 1 then
			slot5 = slot7(4);
			slot6 = slot7(5);
		elseif slot3 then
			if slot3.result == 1 then
				slot5 = slot7(6);
				slot6 = slot7(9);
			else
				slot5 = slot7(8);
				slot6 = slot7(7);
			end
		end

		function slot8(slot0, slot1, slot2)
			if not slot0 then
				do return end
			end

			slot0:setOpacity(0);
			slot0:runAction(cc.Sequence:create(cc.FadeIn:create(0.5), cc.DelayTime:create(3), cc.FadeOut:create(0.5), cc.CallFunc:create(function ()
				uv0:setVisible(false);
				uv1:removeDeclarationSpine(uv2, uv3);
			end)));
		end

		function slot9(slot0, slot1)
			if Config.ArenaEliteData.data_face[slot0] then
				slot3 = createEffectSpine(slot2.msg, nil, cc.p(0.5, 0.5), false, PlayerAction.action);

				if slot1 then
					slot3:setScaleX(-1);
					slot3:setPosition(230, 102);
				else
					slot3:setPosition(488, 102);
				end

				uv0.form_view:addChild(slot3);

				do return slot3 end
			end
		end

		if slot5 ~= nil and slot5 ~= 0 then
			if slot0.declaration_spine_left_list == nil then
				slot0.declaration_spine_left_list = {};
			end

			slot0.declaration_spine_left_list[slot4] = slot9(slot5, true);

			slot8(slot0.declaration_spine_left_list[slot4], slot4, true);
		end

		if slot6 ~= nil and slot6 ~= 0 then
			if slot0.declaration_spine_right_list == nil then
				slot0.declaration_spine_right_list = {};
			end

			slot0.declaration_spine_right_list[slot4] = slot9(slot6);

			slot8(slot0.declaration_spine_right_list[slot4], slot4);
		end
	end
end

function BattleSceneNewView.removeDeclarationSpine(slot0, slot1, slot2)
	if not slot1 then
		do return end
	end

	if slot2 then
		if slot0.declaration_spine_left_list and slot0.declaration_spine_left_list[slot1] then
			slot0.declaration_spine_left_list[slot1]:clearTracks();
			slot0.declaration_spine_left_list[slot1]:removeFromParent();

			slot0.declaration_spine_left_list[slot1] = nil;
		end
	elseif slot0.declaration_spine_right_list and slot0.declaration_spine_right_list[slot1] then
		slot0.declaration_spine_right_list[slot1]:clearTracks();
		slot0.declaration_spine_right_list[slot1]:removeFromParent();

		slot0.declaration_spine_right_list[slot1] = nil;
	end
end

function BattleSceneNewView.clearDieTimer(slot0)
	if slot0.die_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.die_timer);

		slot0.die_timer = nil;
	end
end

function BattleSceneNewView.updateBtnLayerStatus(slot0, slot1)
	uv0:updateBtnLayerStatus(slot1);
end

function BattleSceneNewView.updateBg(slot0, slot1, slot2, slot3)
	if slot0.map_bg_res_id ~= slot1 then
		slot0.map_bg_res_id = slot1;

		if slot0.map_bg and not uv0(slot0.map_bg) then
			loadSpriteTexture(slot0.map_bg, slot1, LOADTEXT_TYPE);
		end

		if slot0.map_bg_2 and not uv0(slot0.map_bg_2) then
			loadSpriteTexture(slot0.map_bg_2, slot1, LOADTEXT_TYPE);
		end
	end

	if slot0.f_bg_res_id ~= slot2 then
		slot0.f_bg_res_id = slot2;

		if slot0.f_bg and not uv0(slot0.f_bg) then
			loadSpriteTexture(slot0.f_bg, slot2, LOADTEXT_TYPE);
		end

		if slot0.f_bg_2 and not uv0(slot0.f_bg_2) then
			loadSpriteTexture(slot0.f_bg_2, slot2, LOADTEXT_TYPE);
		end
	end
end

function BattleSceneNewView.updateRound(slot0, slot1)
	GlobalEvent:getInstance():Fire(BattleEvent.UPDATE_ROUND_NUM);
	slot0:checkShowBalaceMsg(slot1);

	if slot0.battle_type == BattleConst.Fight_Type.Darma then
		uv0:updateRound(slot1);

		do return end
	end

	if Config.CombatTypeData.data_fight_list == nil or slot2[slot0.battle_type] == nil then
		do return end
	end

	if not uv1(slot0.round_label) then
		slot0.round_label:setString(string.format(TI18N("第%d/%d回合"), slot1, slot2[slot0.battle_type].max_action_count or 0));
	end
end

function BattleSceneNewView.checkShowBalaceMsg(slot0, slot1)
	if slot0.cur_round and slot0.cur_round == slot1 then
		do return end
	end

	if Config.CombatTypeData.data_fight_list[slot0.battle_type] and slot2.is_use_balance_mode > 0 and Config.CombatTypeData.data_blance_fight_mode[slot2.is_use_balance_mode] and slot3[slot1] and slot3[slot1][1] then
		slot0.cur_round = slot1;

		GlobalMessageMgr:getInstance():showPermanentMsg(true, slot3[slot1][1].desc);

		do return end
	end
end

function BattleSceneNewView.checkShowElementMsg(slot0)
	if slot0.dunge_data and next(slot0.dunge_data) ~= nil and slot0.dunge_data[1] and Config.ElementTempleData.data_monster[slot0.dunge_data[1].param] then
		GlobalMessageMgr:getInstance():showPermanentMsg(true, slot2.combat_desc or "");

		do return end
	end
end

function BattleSceneNewView.setSpeed(slot0, slot1, slot2)
	if slot0.double_speed_Label and not uv0(slot0.double_speed_Label) then
		slot0.double_speed_Label:setString("X" .. slot2);

		if slot2 == 3 then
			uv2:setBattleTimeScale(uv1:getActTime("speed_scale_2"));
		elseif slot2 == 2 then
			uv2:setBattleTimeScale(uv1:getActTime("speed_scale"));
		else
			uv2:setBattleTimeScale(1);
		end
	end
end

function BattleSceneNewView.setBlack(slot0, slot1, slot2, slot3)
	slot4 = slot2 or 255;

	if not slot1 then
		if not uv0(slot0.black_layer) then
			slot0.black_layer:setVisible(false);

			slot0.black_on_show = false;
		end
	else
		if slot0.black_on_show == true then
			do return end
		end

		slot0.black_on_show = true;

		if slot0.black_layer then
			slot0.black_layer:setVisible(true);
		elseif not uv0(slot0.map_sLayer) then
			slot0.black_layer = ccui.Layout:create();

			slot0.black_layer:setContentSize(slot0.main_size.width + 200, slot0.main_size.height + 200);
			slot0.black_layer:setPosition(-100, -100);
			slot0.map_sLayer:addChild(slot0.black_layer, 1);
			showLayoutRect(slot0.black_layer, slot4);
		end

		slot0.black_layer:setOpacity(0);
		slot0.black_layer:runAction(cc.FadeIn:create(0.2));
	end
end

function BattleSceneNewView.setBlack2(slot0, slot1, slot2)
end

function BattleSceneNewView.powerAction(slot0, slot1)
end

function BattleSceneNewView.showUiViewAction(slot0)
	if not uv0(slot0.ui_layer) and slot0.ui_layer then
		slot0.ui_layer:setVisible(true);
	end
end

function BattleSceneNewView.showSkillName(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1.skill_data == nil or slot1.spine_renderer == nil then
		if slot2 then
			slot2();
		end

		do return end
	end

	if not slot3 and slot1.temp_skill_bid ~= slot1.attacker_info.skill_bid then
		slot1.temp_skill_bid = slot1.attacker_info.skill_bid;
		slot5 = PlayerAction.action_1;

		if uv0:isLeft(slot1.group) == true then
			slot5 = PlayerAction.action_2;
		end

		if slot0.skill_container == nil then
			slot0.skill_container = ccui.Layout:create();

			slot0.skill_container:setContentSize(cc.size(470, 190));
			slot0.skill_container:setAnchorPoint(cc.p(0.5, 0.5));
			slot0.skill_container:setPosition(slot0.main_size.width * 0.5, 550);
			slot0.effect_layer_1:addChild(slot0.skill_container);

			slot0.player_head = createSprite(nil, 173, 102, slot0.skill_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 2);

			slot0.player_head:setScale(0.4);

			slot0.skill_name_label = createLabel(30, 193, nil, 267, 102, "", slot0.skill_container, nil, cc.p(0.5, 0.5));

			slot0.skill_name_label:setZOrder(2);
		end

		slot7 = slot1.object_bid;
		slot8 = 0;

		if slot1.object_type == BattleObjectType.Elfin then
			if slot0.elfin_skill_effect_1 == nil then
				slot0.elfin_skill_effect_1 = createEffectSpine("E31330", cc.p(235, 100), cc.p(0.5, 0.5), false, slot5);

				slot0.skill_container:addChild(slot0.elfin_skill_effect_1, 1);
			else
				slot0.elfin_skill_effect_1:setVisible(true);
			end

			if slot0.skill_effect then
				slot0.skill_effect:setVisible(false);
			end

			slot0.elfin_skill_effect_1:setAnimation(0, slot5, false);
			slot0.skill_name_label:setString(uv1("%s Lv.%s", slot1.skill_data.name, slot1.skill_data.level));

			slot8 = 294;
		else
			if slot0.skill_effect == nil then
				slot0.skill_effect = createEffectSpine(PathTool.getEffectRes(276), cc.p(235, 100), cc.p(0.5, 0.5), false, slot5);

				slot0.skill_container:addChild(slot0.skill_effect, 1);
			else
				slot0.skill_effect:setVisible(true);
			end

			if slot0.elfin_skill_effect_1 then
				slot0.elfin_skill_effect_1:setVisible(false);
			end

			slot0.skill_effect:setAnimation(0, slot5, false);
			slot0.skill_name_label:setString(slot1.skill_data.name);

			slot8 = 267;
		end

		if slot6 == nil then
			if slot2 then
				slot2();
			end
		else
			slot9 = 0;

			if slot6 == 2 then
				slot9 = slot7;
			elseif slot6 == 3 then
				if Config.UnitData.data_unit(slot7) then
					slot9 = slot10.head_icon;
				end
			elseif slot6 == BattleObjectType.Elfin then
				slot9 = Config.SpriteData.data_elfin_skill_icon[slot1.attacker_info.skill_bid];
			end

			if slot9 == nil or slot9 == 0 or slot9 == "" then
				if slot2 then
					slot2();
				end
			else
				if slot1.fashion ~= 0 and Config.PartnerSkinData.data_skin_info[slot1.fashion] then
					slot9 = slot10.head_id;
				end

				slot10 = nil;

				loadSpriteTexture(slot0.player_head, (slot6 ~= BattleObjectType.Elfin or PathTool.getElfinHeadIcon(slot9)) and PathTool.getHeadIcon(slot9), LOADTEXT_TYPE);
				doStopAllActions(slot0.player_head);
				doStopAllActions(slot0.skill_name_label);
				slot0.skill_container:setVisible(true);
				slot0.player_head:setPosition(114, 102);
				slot0.skill_name_label:setPosition(425, 102);
				slot0.player_head:setOpacity(0);
				slot0.skill_name_label:setOpacity(0);
				slot0.player_head:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(uv2:getActTime("skill_bg_move_time"), cc.p(173, 102)), cc.FadeIn:create(uv2:getActTime("skill_bg_fadeIn"))), cc.DelayTime:create(uv2:getActTime("skill_name_delay_time")), cc.CallFunc:create(slot2), cc.DelayTime:create(uv2:getActTime("skill_name_delay_time2")), cc.CallFunc:create(function ()
					uv0.skill_container:setVisible(false);
				end)));
				slot0.skill_name_label:runAction(cc.Spawn:create(cc.MoveTo:create(uv2:getActTime("skill_bg_move_time"), cc.p(slot8, 102)), cc.FadeIn:create(uv2:getActTime("skill_bg_fadeIn"))));
			end
		end
	elseif slot2 then
		slot2();
	end
end

function BattleSceneNewView.showPassiveSkillName(slot0, slot1, slot2)
	if slot1.skill_data == nil or not slot1.spine_renderer then
		do return end
	end

	slot1.spine_renderer:playPassiveSkillName(slot1.skill_data.name, slot2);
end

function BattleSceneNewView.showElfinSkillAni(slot0, slot1, slot2, slot3)
	if slot1 == nil or slot1.skill_data == nil or slot1.spine_renderer == nil then
		if slot2 then
			slot2();
		end

		do return end
	end

	if not slot3 and slot1.temp_skill_bid ~= slot1.attacker_info.skill_bid then
		slot1.temp_skill_bid = slot1.attacker_info.skill_bid;
		slot5, slot6 = nil;

		if uv0:isLeft(slot1.group) == true then
			slot6 = cc.c3b(216, 255, 241);
			slot5 = PlayerAction.action_2;
		else
			slot6 = cc.c3b(255, 233, 198);
			slot5 = PlayerAction.action_1;
		end

		slot8 = slot1.object_bid;

		if slot1.object_type ~= BattleObjectType.Elfin then
			do return end
		end

		if slot0.elfin_skill_container == nil then
			slot0.elfin_skill_container = ccui.Layout:create();

			slot0.elfin_skill_container:setContentSize(cc.size(470, 190));
			slot0.elfin_skill_container:setAnchorPoint(cc.p(0.5, 0.5));
			slot0.elfin_skill_container:setPosition(slot0.main_size.width * 0.5, 550);
			slot0.effect_layer_1:addChild(slot0.elfin_skill_container);
		end

		if slot0.elfin_head == nil then
			slot0.elfin_head = createSprite(nil, 140, 148, slot0.elfin_skill_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 2);

			slot0.elfin_head:setScale(1);
		end

		if slot0.elfin_skill_name_label == nil then
			slot0.elfin_skill_name_label = createLabel(30, slot6, 2, 303, 110, "", slot0.elfin_skill_container, 2, cc.p(0.5, 0.5));

			slot0.elfin_skill_name_label:setZOrder(2);
		end

		if slot0.elfin_skill_effect_1 == nil then
			slot0.elfin_skill_effect_1 = createEffectSpine("E31330", cc.p(235, 100), cc.p(0.5, 0.5), false, slot5);

			slot0.elfin_skill_container:addChild(slot0.elfin_skill_effect_1, 1);
		else
			slot0.elfin_skill_effect_1:setVisible(true);
		end

		slot0.elfin_skill_effect_1:setAnimation(0, slot5, true);
		slot0.elfin_skill_name_label:setString(uv1("%s Lv.%s", slot1.skill_data.name, slot1.skill_data.level));

		if slot7 == nil then
			if slot2 then
				slot2();
			end
		else
			slot9 = 0;

			if slot7 == BattleObjectType.Elfin then
				slot9 = Config.SpriteData.data_elfin_skill_icon[slot1.attacker_info.skill_bid];
			end

			if slot9 == nil or slot9 == 0 or slot9 == "" then
				if slot2 then
					slot2();
				end
			else
				if slot1.fashion ~= 0 and Config.PartnerSkinData.data_skin_info[slot1.fashion] then
					slot9 = slot10.head_id;
				end

				loadSpriteTexture(slot0.elfin_head, PathTool.getElfinHeadIcon(slot9), LOADTEXT_TYPE);
				doStopAllActions(slot0.elfin_head);
				doStopAllActions(slot0.elfin_skill_name_label);
				slot0.elfin_skill_container:setVisible(true);
				slot0.elfin_head:setPosition(80, 148);
				slot0.elfin_skill_name_label:setPosition(440, 110);
				slot0.elfin_skill_name_label:setTextColor(slot6);
				slot0.elfin_head:setOpacity(0);
				slot0.elfin_skill_name_label:setOpacity(0);
				slot0.elfin_head:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(uv2:getActTime("skill_bg_move_time"), cc.p(140, 148)), cc.FadeIn:create(uv2:getActTime("skill_bg_fadeIn"))), cc.DelayTime:create(uv2:getActTime("skill_name_delay_time")), cc.CallFunc:create(slot2), cc.DelayTime:create(uv2:getActTime("skill_name_delay_time2")), cc.CallFunc:create(function ()
					uv0.elfin_skill_container:setVisible(false);
				end)));
				slot0.elfin_skill_name_label:runAction(cc.Spawn:create(cc.MoveTo:create(uv2:getActTime("skill_bg_move_time"), cc.p(303, 110)), cc.FadeIn:create(uv2:getActTime("skill_bg_fadeIn"))));
			end
		end
	elseif slot2 then
		slot2();
	end
end

function BattleSceneNewView.setButtonHide(slot0, slot1)
	if slot0.auto then
		slot0.auto:setVisible(slot1);
	end

	if slot0.pasue_btn then
		slot0.pasue_btn:setVisible(slot1);
	end
end

function BattleSceneNewView.resetMap(slot0)
	slot0.map_sLayer:setPositionX(0);

	if slot0.f_bg and not uv0(slot0.f_bg) then
		slot0.f_bg:setPosition(display.left + uv1:getActTime("first_offset_distance"), display.bottom);
	end

	if slot0.f_bg_2 and not uv0(slot0.f_bg_2) then
		slot0.f_bg_2:setPosition(slot0.f_bg:getBoundingBox().width * slot0:getFarLayerScale() + slot0.main_size.width - slot0.f_bg:getBoundingBox().width * slot0:getFarLayerScale() + uv1:getActTime("first_offset_distance") * 2, display.bottom);
	end
end

function BattleSceneNewView.addExternView(slot0, slot1, slot2, slot3)
	slot0:addChild(slot1, 2);
	slot1:setPosition(slot2 or 0, slot3 or 0);
end

function BattleSceneNewView.handleLayerShowHide(slot0, slot1)
	if slot0.effect_layer_1 and not uv0(slot0.effect_layer_1) then
		slot0.effect_layer_1:setVisible(slot1);
	end

	if slot0.effect_layer_2 and not uv0(slot0.effect_layer_2) then
		slot0.effect_layer_2:setVisible(slot1);
	end

	if slot0.role_layer and not uv0(slot0.role_layer) then
		slot0.role_layer:setVisible(slot1);
	end
end

function BattleSceneNewView.shakeScreen(slot0, slot1)
	if slot0.is_shake then
		do return end
	end

	if not Config.SkillData.data_get_shake_data[slot1] then
		do return end
	end

	if slot0.main_layer.action then
		slot3:stopAllActions();

		slot3.action = nil;
	end

	slot0.camera_shake_pos = cc.p(slot0.main_layer:getPosition());
	slot0.is_shake = true;

	function slot4()
		uv0.is_shake = false;

		uv1:setPosition(uv0.camera_shake_pos);
	end

	slot5 = {
		1,
		4,
		7,
		8,
		9,
		6,
		3,
		2
	};
	slot6 = slot2.shake_strength or 30;
	slot7 = 3;
	slot8 = slot2.shake_rate / 1000 or 0.015;
	slot9 = 0.25;
	slot10 = 0.25;
	slot12 = {
		{
			-0.7,
			0.7
		},
		{
			0,
			1
		},
		{
			0.7,
			0.7
		},
		{
			-1,
			0
		},
		{
			0,
			0
		},
		{
			1,
			0
		},
		{
			-0.7,
			-0.7
		},
		{
			0,
			-1
		},
		{
			0.7,
			-0.7
		}
	};

	function slot13(slot0)
		slot1, slot2 = nil;

		uv6:setPosition(cc.p(uv5.camera_shake_pos.x + uv0 * uv1 * uv2[uv3[slot0]][1], uv5.camera_shake_pos.y + -uv0 * uv4 * uv2[uv3[slot0]][2]));
	end

	slot14 = nil;

	for slot18 = 1, slot2.shake_time or 3 do
		for slot22 = 1, #slot5 do
			slot14 = cc.Sequence:create(slot14, cc.CallFunc:create(function ()
				uv0(uv1);
			end), cc.DelayTime:create(slot8));
		end

		slot6 = slot6 - slot7;
	end

	slot14 = cc.Sequence:create(slot14, cc.CallFunc:create(slot4));
	slot3.action = slot14;

	slot3:runAction(slot14);
end

function BattleSceneNewView.getEffectLayer(slot0, slot1)
	if slot1 == 1 then
		do return slot0.effect_layer_1 end
	else
		do return slot0.effect_layer_2 end
	end
end

function BattleSceneNewView.getMapLayer(slot0)
	if not uv0(slot0.role_layer) then
		do return slot0.role_layer end
	end
end

function BattleSceneNewView.getBattleLayer(slot0)
	if not uv0(slot0.ui_layer) then
		do return slot0.ui_layer end
	end
end

function BattleSceneNewView.getBattleReadyLayer(slot0)
	do return slot0.ui_redyLayer end
end

function BattleSceneNewView.getSmapLayer(slot0)
	do return slot0.map_sLayer end
end

function BattleSceneNewView.getSmapLayerPositionX(slot0)
	do return slot0.map_sLayer:getPositionX() end
end

function BattleSceneNewView.getFmapLayer(slot0)
	do return slot0.map_fLayer end
end

function BattleSceneNewView.getFmapLayerPositionX(slot0)
	do return slot0.map_fLayer:getPositionX() end
end

function BattleSceneNewView.getMapBg(slot0)
	do return slot0.map_bg end
end

function BattleSceneNewView.getIsRun(slot0)
	do return slot0.is_run end
end

function BattleSceneNewView.getOrderPos(slot0)
	do return slot0.order_pos end
end

function BattleSceneNewView.handleBattleSceneStatus(slot0, slot1)
	if slot1 == true and slot0.battle_type == BattleConst.Fight_Type.Darma then
		uv0:openBattleDramaUI(true, slot0.battle_res_id, slot0.battle_type, true);
	else
		uv0:openBattleDramaUI(false, slot0.battle_res_id, slot0.battle_type, true);
	end

	if slot0.main_layer and not uv1(slot0.main_layer) then
		slot0.main_layer:setVisible(slot1);
	end

	if slot0.ui_layer and not uv1(slot0.ui_layer) then
		slot0.ui_layer:setVisible(slot1);
	end
end

function BattleSceneNewView.getMainRound(slot0)
	do return slot0.is_main_fight_round end
end

function BattleSceneNewView.changeSomeLayoutPosition(slot0)
	if not tolua.isnull(slot0.form_view) then
		slot0.form_view:setPositionY(uv0:getBottomHeight() + 60);
	end

	if not slot1(slot0.tips_lev_bg) then
		slot0.tips_lev_bg:setPositionY(slot2 + 26);
	end

	if not slot1(slot0.lookup_target_btn) then
		slot0.lookup_target_btn:setPositionY(slot2 + 26);
	end
end

function BattleSceneNewView.cleanFightView(slot0)
	slot0.call_back = nil;

	if slot0.skill_effect then
		slot0.skill_effect:clearTracks();
		slot0.skill_effect:removeFromParent();

		slot0.skill_effect = nil;
	end

	if slot0.elfin_skill_effect_1 then
		slot0.elfin_skill_effect_1:clearTracks();
		slot0.elfin_skill_effect_1:removeFromParent();

		slot0.elfin_skill_effect_1 = nil;
	end

	if not uv0(slot0.skill_container) then
		slot0.skill_container:removeAllChildren();

		slot0.skill_container = nil;
	end

	if not uv0(slot0.elfin_skill_container) then
		slot0.elfin_skill_container:removeAllChildren();

		slot0.elfin_skill_container = nil;
	end

	if not uv0(slot0.black_layer) then
		doStopAllActions(slot0.black_layer);
		slot0.black_layer:removeFromParent();
	end

	slot0:unMapMovescheduleUpdate();
	slot0:clearRoleLayer();
	slot0:clearUiLayer();

	if not uv0(slot0.map_sLayer) then
		slot0.map_sLayer:removeAllChildren();

		slot0.map_sLayer = nil;
	end

	if not uv0(slot0.map_fLayer) then
		slot0.map_fLayer:removeAllChildren();

		slot0.map_fLayer = nil;
	end

	if slot0.load_res_f_bg then
		slot0.load_res_f_bg:DeleteMe();

		slot0.load_res_f_bg = nil;
	end

	if slot0.load_res_map_bg then
		slot0.load_res_map_bg:DeleteMe();

		slot0.load_res_map_bg = nil;
	end

	if not uv0(slot0.single_bg) then
		slot0.single_bg:removeAllChildren();

		slot0.single_bg = nil;
	end

	if slot0.update_buff_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_buff_event);

		slot0.update_buff_event = nil;
	end

	if slot0.chat_ui_size_change then
		GlobalEvent:getInstance():UnBind(slot0.chat_ui_size_change);

		slot0.chat_ui_size_change = nil;
	end

	slot0.map_bg = nil;
	slot0.map_bg_2 = nil;
	slot0.f_bg_2 = nil;
	slot0.f_bg = nil;

	if not uv0(slot0.effect_layer_1) then
		slot0.effect_layer_1:removeAllChildren();

		slot0.effect_layer_1 = nil;
	end

	if not uv0(slot0.effect_layer_2) then
		slot0.effect_layer_2:removeAllChildren();

		slot0.effect_layer_2 = nil;
	end

	slot1 = uv1:getExtendFightType() ~= BattleConst.Fight_Type.Darma or uv1:getCurFightType() == 0;

	uv2:openBattleDramaUI(false);

	if not uv0(slot0.main_layer) then
		slot0.main_layer:removeAllChildren();
		slot0.main_layer:removeFromParent();
	end

	slot0.main_layer = nil;

	RenderMgr:getInstance():doNextFrame(function ()
		display.removeUnusedTextures();
	end);
end

function BattleSceneNewView.clearRoleLayer(slot0)
	if slot0.role_layer and not uv0(slot0.role_layer) then
		slot0.role_layer:removeAllChildren();
	end
end

function BattleSceneNewView.clearUiLayer(slot0, slot1)
	slot0.call_back = nil;

	slot0:removeDeclarationSpine(1, true);
	slot0:removeDeclarationSpine(1);
	slot0:removeDeclarationSpine(2, true);
	slot0:removeDeclarationSpine(2);

	if slot0.elfin_skill_effect then
		slot0.elfin_skill_effect:clearTracks();
		slot0.elfin_skill_effect:removeFromParent();

		slot0.elfin_skill_effect = nil;
	end

	if slot0.elfin_enter_effect then
		slot0.elfin_enter_effect:clearTracks();
		slot0.elfin_enter_effect:removeFromParent();

		slot0.elfin_enter_effect = nil;
	end

	slot0:clearDieTimer();
	GlobalTimeTicket:getInstance():remove("drance_wait_timer");

	slot0.is_init_normal_battle = false;
	slot0.skill_cooldown_info = {};

	if not uv0(slot0.passive_skill) then
		slot0.passive_skill:runAction(cc.RemoveSelf:create());

		slot0.passive_skill = nil;
	end

	if slot0.floor_round and not uv0(slot0.floor_round) then
		slot0.floor_round:DeleteMe();

		slot0.floor_round = nil;
	end

	GlobalMessageMgr:getInstance():showPermanentMsg(false);
	slot0:updateCampEffect(false, slot0.left_camp_effect);
	slot0:updateCampEffect(false, slot0.right_camp_effect);

	if slot0.left_halo_load then
		slot0.left_halo_load:DeleteMe();

		slot0.left_halo_load = nil;
	end

	if slot0.right_halo_load then
		slot0.right_halo_load:DeleteMe();

		slot0.right_halo_load = nil;
	end

	if slot0.star_panel and not uv0(slot0.star_panel) then
		slot0.star_panel:removeAllChildren();
		slot0.star_panel:removeFromParent();

		slot0.star_panel = nil;
	end

	if slot0.form_view and not uv0(slot0.form_view) then
		slot0.form_view:removeAllChildren();
		slot0.form_view:removeFromParent();

		slot0.form_view = nil;
		slot0.left_camp_effect = nil;
		slot0.right_camp_effect = nil;
	end

	uv1:updataZhenfaInfo(false);

	if slot0.tips_lev_bg and not uv0(slot0.tips_lev_bg) then
		slot0.tips_lev_bg:removeAllChildren();
		slot0.tips_lev_bg:removeFromParent();

		slot0.tips_lev_bg = nil;
	end

	if slot0.lookup_target_btn and not uv0(slot0.lookup_target_btn) then
		slot0.lookup_target_btn:removeAllChildren();
		slot0.lookup_target_btn:removeFromParent();

		slot0.lookup_target_btn = nil;
	end

	slot0:clearBuffIcon();

	if slot0.double_speed_btn and not uv0(slot0.double_speed_btn) then
		slot0.double_speed_btn:removeAllChildren();
		slot0.double_speed_btn:removeFromParent();

		slot0.double_speed_btn = nil;
	end

	if not uv0(slot0.guild_boss_view) then
		slot0.guild_boss_view:stopAllActions();
		slot0.guild_boss_view:removeAllChildren();

		slot0.guild_boss_view = nil;
	end

	if slot0.skip_btn and not uv0(slot0.skip_btn) then
		slot0.skip_btn:removeAllChildren();
		slot0.skip_btn:removeFromParent();

		slot0.skip_btn = nil;
	end

	if slot0.leave_btn then
		slot0.leave_btn:removeFromParent();

		slot0.leave_btn = nil;
	end

	if not uv0(slot0.floor_begin_tips) then
		slot0.floor_begin_tips:removeAllChildren();

		slot0.floor_begin_tips = nil;
	end

	if not uv0(slot0.danrace_con) then
		slot0.danrace_con:removeAllChildren();

		slot0.danrace_con = nil;
	end

	if not uv0(slot0.map_name_bg) then
		slot0.map_name_bg:removeAllChildren();

		slot0.map_name_bg = nil;
	end

	if not uv0(slot0.time_num) then
		slot0.time_num:DeleteMe();
	end

	if not uv0(slot0.round_time_widget) then
		slot0.round_time_widget:removeAllChildren();

		slot0.round_time_widget = nil;
	end

	if slot0.year_box_effect then
		for slot5, slot6 in pairs(slot0.year_box_effect) do
			slot6:clearTracks();
			slot6:removeFromParent();
		end

		slot0.year_box_effect = nil;
	end

	if slot0.battle_boss_hp_progress then
		slot0.battle_boss_hp_progress:removeFromParent();

		slot0.battle_boss_hp_progress = nil;
	end

	if slot0.actionyearmonster_hp_progress then
		slot0.actionyearmonster_hp_progress:removeFromParent();

		slot0.actionyearmonster_hp_progress = nil;
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe();

		slot0.resources_load = nil;
	end

	if slot0.resources_hp_load ~= nil then
		slot0.resources_hp_load:DeleteMe();

		slot0.resources_hp_load = nil;
	end

	if slot0.boss_hp_updaet_event then
		GlobalEvent:getInstance():UnBind(slot0.boss_hp_updaet_event);

		slot0.boss_hp_updaet_event = nil;
	end

	if not uv0(slot0.ui_layer) then
		slot0.ui_layer:removeAllChildren();

		slot0.ui_layer = nil;
	end

	if slot0.year_progress_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.year_progress_timer);

		slot0.year_progress_timer = nil;
	end

	if not slot1 then
		if not uv2:checkIsInDramaUIFight() then
			if slot0.music_info then
				AudioManager:getInstance():playMusic(slot0.music_info.type, slot0.music_info.name, slot0.music_info.is_loop);
			end
		else
			slot0:playMusic();
		end
	end
end

function BattleSceneNewView.clearSelectSkill(slot0)
	if slot0.sprite_sel and not uv0(slot0.sprite_sel) then
		slot0.sprite_sel:setVisible(false);
	end
end

BattleRoleView = class("BattleRoleView");

function BattleRoleView.create()
	BattleRoleView.__index = BattleRoleView;

	if not tolua.getpeer(ccui.Layout:create()) then
		tolua.setpeer(slot0, {});
	end

	setmetatable(slot1, BattleRoleView);

	do return slot0 end
end

function BattleSceneNewView.addUnit(slot0, slot1)
	if slot0.story_unit_list == nil then
		slot0.story_unit_list = {};
	end

	if slot0.story_unit_list[slot1.id] then
		do return end
	end

	slot2 = Npc.New();

	slot2:setParentWnd(slot0.role_layer);
	slot2:setVo(slot1);
	slot2:initSpine();

	slot0.story_unit_list[slot1.id] = slot2;

	GlobalEvent:getInstance():Fire(SceneEvent.SCENE_ADDNPC, slot1);
end

function BattleSceneNewView.removeUnit(slot0, slot1)
	if slot0.story_unit_list == nil or slot0.story_unit_list[slot1] == nil then
		do return end
	end

	slot0.story_unit_list[slot1]:DeleteMe();

	slot0.story_unit_list[slot1] = nil;
end

function BattleSceneNewView.getUnitById(slot0, slot1)
	if slot0.story_unit_list ~= nil and next(slot0.story_unit_list or {}) ~= nil then
		do return slot0.story_unit_list[slot1] end
	end
end

function BattleSceneNewView.syncUnit(slot0, slot1, slot2, slot3)
	if slot0.story_unit_list == nil then
		do return end
	end

	if slot0.story_unit_list[slot1] == nil then
		do return end
	end

	slot4:doMove(nil, cc.p(slot2, slot3));
end

function BattleSceneNewView.getFarLayerScale(slot0)
	if slot0._f_scale then
		do return slot0._f_scale end
	end

	slot0._f_scale = 1;

	if slot0.f_bg and slot0.map_fLayer:getPositionY() + slot0.f_bg:getContentSize().height < display.height then
		slot0._f_scale = display.height / (slot2 + slot1.height);
	end

	do return slot0._f_scale end
end
