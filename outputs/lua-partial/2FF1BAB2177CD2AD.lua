slot1 = MonopolyController:getInstance():getModel();
slot2 = string.format;
slot3 = table.insert;
slot4 = table.remove;
slot5 = table.sort;
slot6 = MonopolyMainScene or BaseClass(BaseView);
MonopolyMainScene = slot6;

function MonopolyMainScene.__init(slot0)
	slot0.is_full_screen = true;
	slot0.win_type = WinType.Full;
	slot0.layout_name = "monopoly/monopoly_main_window";
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopolyboard"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "dim_bg", true),
			type = ResourcesType.single
		}
	};

	slot0:initConfig();
end

function MonopolyMainScene.initConfig(slot0)
	slot0.is_proceed_evt = false;
	slot0.is_role_moving = false;
	slot0.cur_role_grid_x = 0;
	slot0.cur_role_grid_y = 0;
	slot0.role_cur_board_index = 1;
	slot0.role_move_grid_cache = {};
	slot0.all_grid_item_list = {};
	slot0.board_grid_data = {};
	slot0.progress_boss_list = {};
	slot0.route_effect_list = {};
	slot0.buff_icon_list = {};
	slot0.board_min_pos_x = SCREEN_WIDTH - MonopolyConst.Board_Width;
	slot0.board_max_pos_x = 0;
	slot0.board_min_pos_y = display.height - MonopolyConst.Board_Height;
	slot0.board_max_pos_y = 0;
	slot0.dice_item_bid = 0;
	slot0.dice_item_name = "";

	if Config.MonopolyMapsData.data_const.monopoly_dice_id then
		slot0.dice_item_bid = slot1.val;
	end

	if Config.ItemData.data_get_data(slot0.dice_item_bid) then
		slot0.dice_item_name = slot2.name;
	end

	slot0.secret_item_bid = 0;
	slot0.secret_item_name = 0;

	if Config.MonopolyMapsData.data_const.monopoly_secret_id then
		slot0.secret_item_bid = slot3.val;
	end

	if Config.ItemData.data_get_data(slot0.secret_item_bid) then
		slot0.secret_item_name = slot4.name;
	end

	slot0.role_vo = RoleController:getInstance():getRoleVo();

	MonopolyTile.init(MonopolyConst.Tile_Width * 0.5, MonopolyConst.Tile_Height * 0.5, MonopolyConst.Board_Width, MonopolyConst.Board_Height);
end

function MonopolyMainScene.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background");

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("monopoly", "dim_bg", true), LOADTEXT_TYPE);
	slot0.background:setScale(display.getMaxScale());

	slot0.touch_slayer = slot0.root_wnd:getChildByName("touch_slayer");

	slot0.touch_slayer:setScale(display.getMaxScale());

	slot0.board_container = slot0.root_wnd:getChildByName("board_container");
	slot0.board_slayer = slot0.board_container:getChildByName("board_slayer");
	slot0.role_slayer = slot0.board_container:getChildByName("role_slayer");
	slot0.ui_container = slot0.root_wnd:getChildByName("ui_container");
	slot1 = slot0.ui_container:getChildByName("top_panel");
	slot0.top_panel = slot1;

	slot1:getChildByName("probe_title"):setString(TI18N("探索值"));

	slot0.btn_rule = slot1:getChildByName("btn_rule");
	slot0.probe_progress = slot1:getChildByName("progress");

	slot0.probe_progress:setScale9Enabled(true);
	slot0.probe_progress:setPercent(0);

	slot0.probe_txt = slot1:getChildByName("probe_txt");
	slot0.atk_txt = slot1:getChildByName("atk_txt");
	slot0.hp_txt = slot1:getChildByName("hp_txt");
	slot0.candy_txt = slot1:getChildByName("candy_txt");
	slot0.map_name_txt = slot1:getChildByName("map_name_txt");
	slot0.candy_sp = slot1:getChildByName("candy_sp");

	slot0.candy_sp:setScale(0.5);

	slot0.buff_panel = slot0.ui_container:getChildByName("buff_panel");
	slot0.gold_item_bid = 0;
	slot0.gold_item_name = "";

	if Config.MonopolyMapsData.data_const.monopoly_gold_id then
		slot0.gold_item_bid = slot2.val;
	end

	if Config.ItemData.data_get_data(slot0.gold_item_bid) then
		slot0.gold_item_name = slot3.name;

		loadSpriteTexture(slot0.candy_sp, PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE);
	end

	slot4 = slot0.ui_container:getChildByName("bottom_panel");
	slot0.close_btn = slot4:getChildByName("close_btn");
	slot0.pumpkin_btn = slot4:getChildByName("pumpkin_btn");
	slot0.pumpkin_btn_label = slot0.pumpkin_btn:getChildByName("label");

	slot0.pumpkin_btn_label:setString(slot0.dice_item_name);

	slot0.book_btn = slot4:getChildByName("book_btn");
	slot0.book_btn_label = slot0.book_btn:getChildByName("label");

	slot0.book_btn_label:setString(slot0.secret_item_name);

	slot5 = slot0.book_btn:getContentSize();
	slot0.pumpkin_num = CommonNum.new(18, slot0.pumpkin_btn, 0, -3);

	slot0.pumpkin_num:setPosition(slot5.width - 15, slot5.height);

	slot0.secret_num = CommonNum.new(18, slot0.book_btn, 0, -3);

	slot0.secret_num:setPosition(slot5.width - 15, slot5.height);
	slot0:updateItemNum();

	slot6 = display.getTop(main_container);

	slot1:setPositionY(slot6 - 158);
	slot0.buff_panel:setPositionY(slot6 - 215);
	slot4:setPositionY(display.getBottom(main_container));
end

function MonopolyMainScene.openRootWnd(slot0, slot1)
	slot0.cur_monopoly_id = slot1;

	uv0:setCurMonopolyMapId(slot1);
	uv1:sender27401(slot1);
	uv1:sender27504();
	uv1:sender27500(slot1);
	uv1:sender27408(slot1);
end

function MonopolyMainScene.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2);
	registerButtonEventListener(slot0.pumpkin_btn, handler(slot0, slot0.onClickPumpkinBtn), true, nil, nil, nil, 0.5);
	registerButtonEventListener(slot0.book_btn, handler(slot0, slot0.onClickBookBtn), true, nil, nil, nil, 0.5);
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true);

	slot1 = slot0.touch_slayer;

	slot1:addTouchEventListener(function (slot0, slot1)
		if uv0.is_role_moving then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			uv0.last_pos = slot0:getTouchBeganPosition();
		elseif slot1 == ccui.TouchEventType.moved then
			slot2 = slot0:getTouchMovePosition();

			if uv0.last_pos then
				uv0.last_pos = slot2;

				uv0:onTouchMoveBoard(slot2.x - uv0.last_pos.x, slot2.y - uv0.last_pos.y);
			end
		end
	end);
	slot0:addGlobalEvent(MonopolyEvent.Update_Monopoly_Map_Data_Event, function ()
		uv0:setData();
	end);
	slot0:addGlobalEvent(MonopolyEvent.Get_Dice_Result_Event, function (slot0, slot1)
		if uv0.cur_monopoly_id then
			uv0.map_data = uv1:getMonopolyMapDataById(uv0.cur_monopoly_id);
		end

		if slot1 and slot0 and slot0 > 0 then
			uv0:MoveRoleByNum(slot0);
		end
	end);
	slot0:addGlobalEvent(MonopolyEvent.Update_Now_Evt_Type_Event, function (slot0)
		if uv0.cur_monopoly_id and uv0.cur_monopoly_id == slot0 then
			uv0.map_data = uv1:getMonopolyMapDataById(uv0.cur_monopoly_id);
			uv0.is_proceed_evt = false;
		end
	end);
	slot0:addGlobalEvent(MonopolyEvent.Get_Role_Move_Event, function (slot0)
		uv0:MoveRoleByNum(slot0);
	end);

	if not slot0.role_assets_event and slot0.role_vo then
		slot1 = slot0.role_vo;
		slot0.role_assets_event = slot1:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 and (slot0 == uv0.dice_item_bid or slot0 == uv0.secret_item_bid) and uv0.role_vo then
				uv0:updateItemNum();
			elseif slot0 and slot0 == uv0.gold_item_bid and uv0.role_vo then
				uv0:updateBuffData();
			end
		end);
	end

	slot0:addGlobalEvent(MonopolyEvent.Update_Buff_Data_Event, function ()
		uv0:updateBuffData();
	end);
	slot0:addGlobalEvent(MonopolyEvent.Get_Boss_Data_Event, function (slot0)
		if slot0 and slot0.id == uv0.cur_monopoly_id then
			uv0:updateBossIconList(slot0.boss_list);
		end
	end);
	slot0:addGlobalEvent(MonopolyEvent.Update_Guild_Dev_Val_Event, function ()
		uv0:updateBossProgress();
	end);
	slot0:addGlobalEvent(MonopolyEvent.Update_Monopoly_Buff_Event, function (slot0)
		if slot0.id == uv0.cur_monopoly_id then
			uv0:updateMonopolyBuffs(slot0.buffs);
		end
	end);
	slot0:addGlobalEvent(MonopolyEvent.Get_Show_Tips_Event, function ()
		uv0:checkShowTips();
	end);
end

function MonopolyMainScene.onClickRuleBtn(slot0)
	uv0:openMonopolyItemShowWindow(true);
end

function MonopolyMainScene.updateItemNum(slot0)
	slot0.pumpkin_num:setNum(slot0.role_vo:getActionAssetsNumByBid(slot0.dice_item_bid));
	slot0.secret_num:setNum(slot0.role_vo:getActionAssetsNumByBid(slot0.secret_item_bid));
end

function MonopolyMainScene.updateBuffData(slot0)
	slot2 = 0;
	slot3 = 0;

	for slot7, slot8 in pairs(uv0:getMonopolyBuffData()) do
		if slot8.buff_id == 1 then
			slot2 = slot8.val;
		elseif slot8.buff_id == 2 then
			slot3 = slot8.val;
		end
	end

	slot0.atk_txt:setString(uv1(TI18N("攻击+%d"), slot2));
	slot0.hp_txt:setString(uv1(TI18N("血量+%d"), slot3));
	slot0.candy_txt:setString(uv1(TI18N("%s:%d"), slot0.gold_item_name, slot0.role_vo:getActionAssetsNumByBid(slot0.gold_item_bid)));
end

function MonopolyMainScene.onClickPumpkinBtn(slot0)
	if slot0.is_proceed_evt then
		message(TI18N("当前有未完成的事件"));

		return
	end

	if slot0.is_role_moving then
		message(TI18N("角色正在行走中"));

		return
	end

	if not slot0.role_vo then
		return
	end

	if slot0.role_vo:getActionAssetsNumByBid(slot0.dice_item_bid) <= 0 then
		message(uv0(TI18N("没有%s啦，请去活动中获取更多~"), slot0.dice_item_name));
	else
		uv1:openMonopolyPumpkinWindow(true);
	end
end

function MonopolyMainScene.onClickBookBtn(slot0)
	if slot0.is_proceed_evt then
		message(TI18N("当前有未完成的事件"));

		return
	end

	if slot0.is_role_moving then
		message(TI18N("角色正在行走中"));

		return
	end

	if not slot0.role_vo then
		return
	end

	if slot0.role_vo:getActionAssetsNumByBid(slot0.secret_item_bid) <= 0 then
		message(uv0(TI18N("没有%s啦，请去活动中获取更多~"), slot0.secret_item_name));
	else
		uv1:openMonopolyChoseStepWindow(true);
	end
end

function MonopolyMainScene.onClickCloseBtn(slot0)
	uv0:openMonopolyMianScene(false);
end

function MonopolyMainScene.updateBoardGridList(slot0)
	for slot4, slot5 in pairs(slot0.all_grid_item_list) do
		slot5:setVisible(false);
	end

	slot1 = #slot0.board_grid_data;

	for slot5, slot6 in pairs(slot0.board_grid_data) do
		delayRun(slot0.board_slayer, 1 / display.DEFAULT_FPS, function ()
			if not uv0.all_grid_item_list[uv1] then
				slot0 = MonopolyGridItem.new();

				uv0.board_slayer:addChild(slot0);

				uv0.all_grid_item_list[uv1] = slot0;
			end

			slot0:setVisible(true);
			slot0:setData(uv2);

			if uv1 == uv3 then
				uv0:updateGridListZorder();
			end
		end);
	end
end

function MonopolyMainScene.onTouchMoveBoard(slot0, slot1, slot2)
	if not slot0.board_container then
		return
	end

	slot3, slot4 = slot0.board_container:getPosition();
	slot7, slot8 = slot0:checkBoardPos(slot3 + slot1, slot4 + slot2);

	slot0.board_container:setPosition(cc.p(slot7, slot8));
end

function MonopolyMainScene.checkBoardPos(slot0, slot1, slot2)
	if slot0.board_max_pos_x < slot1 then
		slot1 = slot0.board_max_pos_x;
	elseif slot1 < slot0.board_min_pos_x then
		slot1 = slot0.board_min_pos_x;
	end

	if slot0.board_max_pos_y < slot2 then
		slot2 = slot0.board_max_pos_y;
	elseif slot2 < slot0.board_min_pos_y then
		slot2 = slot0.board_min_pos_y;
	end

	return slot1, slot2
end

function MonopolyMainScene.updateBoardBgById(slot0, slot1)
	if not slot0.cur_board_bg_id or slot0.cur_board_bg_id ~= slot1 then
		slot0.cur_board_bg_id = slot1;

		if not slot0.board_bg_1 then
			slot0.board_bg_1 = createSprite(nil, 932, MonopolyConst.Board_Height, slot0.board_slayer, cc.p(0, 1), LOADTEXT_TYPE);
		end

		if not slot0.board_bg_2 then
			slot0.board_bg_2 = createSprite(nil, 0, MonopolyConst.Board_Height * 0.5 - 28, slot0.board_slayer, cc.p(0, 0.5), LOADTEXT_TYPE);
		end

		if not slot0.board_bg_3 then
			slot0.board_bg_3 = createSprite(nil, 911, 0, slot0.board_slayer, cc.p(0, 0), LOADTEXT_TYPE);
		end

		if not slot0.board_bg_4 then
			slot0.board_bg_4 = createSprite(nil, MonopolyConst.Board_Width, MonopolyConst.Board_Height * 0.5 - 20, slot0.board_slayer, cc.p(1, 0.5), LOADTEXT_TYPE);
		end

		slot2 = {};

		for slot6 = 1, 4 do
			uv1(slot2, {
				path = PathTool.getPlistImgForDownLoad(uv0("monopoly/background/%d", slot0.cur_board_bg_id), slot6),
				type = ResourcesType.single
			});
		end

		if slot0.board_bg_load then
			slot0.board_bg_load:DeleteMe();

			slot0.board_bg_load = nil;
		end

		slot0.board_bg_load = ResourcesLoad.New(true);
		slot3 = slot0.board_bg_load;

		slot3:addAllList(slot2, function ()
			loadSpriteTexture(uv0.board_bg_1, uv1("resource/monopoly/background/%d/%d.png", uv0.cur_board_bg_id, 1), LOADTEXT_TYPE);
			loadSpriteTexture(uv0.board_bg_2, uv1("resource/monopoly/background/%d/%d.png", uv0.cur_board_bg_id, 2), LOADTEXT_TYPE);
			loadSpriteTexture(uv0.board_bg_3, uv1("resource/monopoly/background/%d/%d.png", uv0.cur_board_bg_id, 3), LOADTEXT_TYPE);
			loadSpriteTexture(uv0.board_bg_4, uv1("resource/monopoly/background/%d/%d.png", uv0.cur_board_bg_id, 4), LOADTEXT_TYPE);
		end);
	end
end

function MonopolyMainScene.removeBoardRole(slot0)
	if slot0.board_role then
		slot0.board_role:clearTracks();
		slot0.board_role:removeFromParent();

		slot0.board_role = nil;
	end
end

function MonopolyMainScene.showMoveRoute(slot0, slot1)
	if slot0.board_grid_data[slot0.role_cur_board_index + slot1] and slot3.grid_index then
		slot4, slot5 = MonopolyTile.indexPixel(slot3.grid_index);

		slot0:handlerTargetEffect(true, slot4, slot5 + 6);
	end

	slot4 = {};

	for slot8 = 1, slot1 - 1 do
		if slot0.role_cur_board_index + slot8 <= #slot0.board_grid_data and slot0.board_grid_data[slot9] and slot10.grid_index then
			slot11 = {
				dir = 1
			};
			slot12, slot13 = MonopolyTile.indexPixel(slot10.grid_index);

			if slot0.board_grid_data[slot9 + 1] then
				slot15, slot16 = MonopolyTile.indexPixel(slot14.grid_index);

				if slot12 < slot15 and slot13 < slot16 then
					slot11.dir = 1;
				elseif slot12 < slot15 and slot16 < slot13 then
					slot11.dir = 2;
				elseif slot15 < slot12 and slot16 < slot13 then
					slot11.dir = 3;
				elseif slot15 < slot12 and slot13 < slot16 then
					slot11.dir = 4;
				end
			end

			slot11.pos_x = slot12 + 4;
			slot11.pos_y = slot13 + 10;
			slot11.grid_index = slot10.grid_index;

			uv0(slot4, slot11);
		end
	end

	for slot8, slot9 in pairs(slot0.route_effect_list) do
		if slot9.effect then
			slot9.effect:setVisible(false);
		end
	end

	for slot8, slot9 in ipairs(slot4) do
		if not slot0.route_effect_list[slot8] or next(slot10) == nil then
			slot10 = {
				effect = createEffectSpine(Config.EffectData.data_effect_info[1505], cc.p(slot9.pos_x, slot9.pos_y), cc.p(0.5, 0.5), true, PlayerAction.action)
			};

			slot0.board_slayer:addChild(slot10.effect, 99);

			slot0.route_effect_list[slot8] = slot10;
		else
			slot10.effect:setToSetupPose();
			slot10.effect:setPosition(slot9.pos_x, slot9.pos_y);
			slot10.effect:setAnimation(0, PlayerAction.action, true);
		end

		slot10.effect:setVisible(true);
		slot10.effect:setScale(1);

		if slot9.dir == 1 then
			slot10.effect:setScale(-1);
		elseif slot9.dir == 2 then
			slot10.effect:setScaleX(-1);
		elseif slot9.dir == 3 then
			slot10.effect:setScale(1);
		elseif slot9.dir == 4 then
			slot10.effect:setScaleY(-1);
		end

		slot10.grid_index = slot9.grid_index;
	end
end

function MonopolyMainScene.handlerTargetEffect(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not tolua.isnull(slot0.board_slayer) and slot0.target_effect == nil then
			slot0.target_effect = createEffectSpine(Config.EffectData.data_effect_info[1504], cc.p(slot2, slot3), cc.p(0.5, 0.5), true, PlayerAction.action_2);

			slot0.board_slayer:addChild(slot0.target_effect, 99);
		elseif slot0.target_effect then
			slot0.target_effect:setToSetupPose();
			slot0.target_effect:setPosition(slot2, slot3);
			slot0.target_effect:setAnimation(0, PlayerAction.action_2, true);
		end
	elseif slot0.target_effect then
		slot0.target_effect:clearTracks();
		slot0.target_effect:removeFromParent();

		slot0.target_effect = nil;
	end
end

function MonopolyMainScene.MoveRoleByNum(slot0, slot1)
	if slot0.is_role_moving then
		return
	end

	slot0:showMoveRoute(slot1);

	function slot2()
		uv0.is_role_moving = false;
		slot3 = false;

		uv0.move_tips_bg:setVisible(slot3);

		for slot3 = 1, uv1 do
			if uv0.role_cur_board_index + slot3 <= #uv0.board_grid_data and uv0.board_grid_data[slot4] and slot5.grid_index then
				slot6, slot7 = MonopolyTile.indexTile(slot5.grid_index);

				uv0:moveRoleByGrid(slot6, slot7);
			end
		end

		if uv0.role_cur_board_index + uv1 > #uv0.board_grid_data then
			uv0.role_cur_board_index = #uv0.board_grid_data;
		else
			uv0.role_cur_board_index = uv0.role_cur_board_index + uv1;
		end
	end

	if not slot0.move_tips_bg then
		slot3 = slot0.ui_container:getContentSize();
		slot0.move_tips_bg = createImage(slot0.ui_container, PathTool.getResFrame("monopoly", "monopolyboard_1017", false, "monopolyboard"), slot3.width * 0.5, slot3.height * 0.5 + 100, cc.p(0.5, 0.5), true, 99, true);

		slot0.move_tips_bg:setContentSize(cc.size(720, 108));
	end

	if not slot0.move_num then
		slot0.move_num = CommonNum.new(32, slot0.move_tips_bg, 0);

		slot0.move_num:setPosition(360, 82);
	end

	slot0.move_num:setNum("g" .. slot1 .. "s");
	slot0.move_tips_bg:setVisible(true);

	slot0.is_role_moving = true;

	if slot0.move_tips_sound ~= nil then
		AudioManager:getInstance():removeEffectByData(slot0.move_tips_sound);
	end

	slot0.move_tips_sound = AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_arenasettlement", false);

	slot0.move_tips_bg:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(slot2)));
end

function MonopolyMainScene.moveRoleByGrid(slot0, slot1, slot2, slot3)
	if not slot0.board_role then
		return
	end

	if slot1 and slot2 then
		uv0(slot0.role_move_grid_cache, {
			slot1,
			slot2
		});
	end

	if slot0.is_role_moving == true and not slot3 then
		return
	end

	if not uv1(slot0.role_move_grid_cache, 1) or next(slot4) == nil then
		slot0:doRoleStopMove();

		return
	end

	slot5 = slot4[1];
	slot6 = slot4[2];

	slot0:openBoardMoveTimer(false);

	if slot1 and slot2 then
		slot0:moveBoardToRoleCenter();
	end

	slot0.is_role_moving = true;
	slot0.cur_role_grid_y = slot6;
	slot0.cur_role_grid_x = slot5;
	slot7, slot8 = slot0.board_role:getPosition();
	slot9, slot0.move_target_pos_y = MonopolyTile.toPixel(slot5, slot6);
	slot0.move_target_pos_x = slot9;

	if slot7 < slot9 then
		slot0.board_role:setScaleX(0.65);
	else
		slot0.board_role:setScaleX(-0.65);
	end

	slot12 = math.sqrt(math.pow(slot9 - slot7, 2) + math.pow(slot10 - slot8, 2)) / MonopolyConst.Move_Speed;

	if not slot0.cur_role_action or slot0.cur_role_action ~= PlayerAction.move then
		slot0.cur_role_action = PlayerAction.move;

		slot0.board_role:setToSetupPose();
		slot0.board_role:setAnimation(0, PlayerAction.move, true);
	end

	slot0.board_role:setTimeScale(1.4);
	slot0.board_role:runAction(cc.Sequence:create(cc.MoveTo:create(slot12, cc.p(slot9, slot10)), cc.CallFunc:create(function ()
		if next(uv0.role_move_grid_cache) == nil then
			uv0:doRoleStopMove();
		else
			slot0 = MonopolyTile.tileIndex(uv0.cur_role_grid_x, uv0.cur_role_grid_y);

			for slot4, slot5 in pairs(uv0.route_effect_list) do
				if slot5.grid_index == slot0 then
					if slot5.effect then
						slot5.effect:setVisible(false);
					end

					break
				end
			end

			uv0:moveRoleByGrid(nil, nil, true);
		end
	end)));

	slot13, slot14 = slot0.board_container:getPosition();
	slot15 = slot13 - (slot9 - slot7);
	slot16 = slot14 - (slot10 - slot8);
	slot0.board_move_state = slot0:checkBoardIsCanMove();

	if slot0.board_move_state ~= 0 then
		slot15, slot16 = slot0:checkBoardPos(slot15, slot16);

		if slot0.board_move_state == 1 then
			slot16 = slot14;

			slot0:openBoardMoveTimer(true);
		elseif slot0.board_move_state == 2 then
			slot15 = slot13;

			slot0:openBoardMoveTimer(true);
		end

		slot0.board_container:runAction(cc.MoveTo:create(math.sqrt(math.pow(slot15 - slot13, 2) + math.pow(slot16 - slot14, 2)) / MonopolyConst.Move_Speed, cc.p(slot15, slot16)));
	end

	if slot0.board_move_state ~= 3 then
		slot0:openBoardMoveTimer(true);
	end
end

function MonopolyMainScene.doRoleStopMove(slot0)
	slot4 = false;

	slot0:handlerTargetEffect(slot4);

	for slot4, slot5 in pairs(slot0.route_effect_list) do
		if slot5.effect then
			slot5.effect:setVisible(false);
		end
	end

	slot0.board_role:setToSetupPose();
	slot0.board_role:setAnimation(0, PlayerAction.idle, true);

	slot0.cur_role_action = PlayerAction.idle;
	slot0.move_target_pos_x = nil;
	slot0.move_target_pos_y = nil;

	slot0.board_role:stopAllActions();
	slot0.board_container:stopAllActions();
	slot0:openBoardMoveTimer(false);

	slot0.is_role_moving = false;

	slot0:checkProceedGridEvt();
end

function MonopolyMainScene.checkBoardIsCanMove(slot0)
	slot1 = 0;

	if not slot0.board_role then
		return slot1
	end

	slot2, slot3 = slot0.board_role:getPosition();

	if slot2 >= SCREEN_WIDTH * 0.5 and slot2 <= MonopolyConst.Board_Width - SCREEN_WIDTH * 0.5 then
		slot1 = 1;
	end

	if slot3 >= display.height * 0.5 and slot3 <= MonopolyConst.Board_Height - display.height * 0.5 then
		if slot1 > 0 then
			slot1 = 3;
		else
			slot1 = 2;
		end
	end

	return slot1
end

function MonopolyMainScene.openBoardMoveTimer(slot0, slot1)
	if slot1 == true then
		if not slot0.board_move_timer then
			slot2 = GlobalTimeTicket;
			slot2 = slot2:getInstance();
			slot0.board_move_timer = slot2:add(function ()
				if uv0:checkBoardIsCanMove() ~= uv0.board_move_state then
					uv0.board_move_state = slot0;

					if uv0.move_target_pos_x and uv0.move_target_pos_y then
						slot1, slot2 = uv0.board_role:getPosition();
						slot3, slot4 = uv0.board_container:getPosition();
						slot5, slot6 = uv0:checkBoardPos(slot3 - (uv0.move_target_pos_x - slot1), slot4 - (uv0.move_target_pos_y - slot2));

						if slot0 == 1 then
							slot6 = slot4;
						elseif slot0 == 2 then
							slot5 = slot3;
						end

						uv0.board_container:runAction(cc.MoveTo:create(math.sqrt(math.pow(slot5 - slot3, 2) + math.pow(slot6 - slot4, 2)) / MonopolyConst.Move_Speed, cc.p(slot5, slot6)));
					end
				end
			end, 0.1);
		end
	elseif slot0.board_move_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.board_move_timer);

		slot0.board_move_timer = nil;
	end
end

function MonopolyMainScene.setData(slot0)
	if not slot0.cur_monopoly_id then
		return
	end

	slot0.map_data = uv0:getMonopolyMapDataById(slot0.cur_monopoly_id);

	if not slot0.map_data then
		return
	end

	slot0.map_cfg_data = Config.MonopolyMapsData.data_map_info[slot0.map_data.map_id];

	if not slot0.map_cfg_data then
		return
	end

	slot0:playCloudEffect(true);

	slot0.board_grid_data = {};
	slot1 = ipairs;

	if not slot0.map_cfg_data.grid_pos_list then
		slot3 = {};
	end

	for slot4, slot5 in slot1(slot3) do
		slot6 = MonopolyGridVo.New();

		slot6:updateData({
			index = slot4,
			grid_index = slot5,
			step_id = slot0.map_data.id,
			map_id = slot0.map_data.map_id,
			evt_type = slot0:getGridEventTypeByIndex(slot4)
		});
		uv1(slot0.board_grid_data, slot6);
	end

	if Config.MonopolyMapsData.data_customs[slot0.cur_monopoly_id] then
		slot0.map_name_txt:setString(slot1.name);
	end

	slot0:updateBoardBgById(slot0.map_cfg_data.res_id);
	slot0:updateBoardGridList();
	slot0:updateBossProgress();

	if not slot0.board_role then
		slot4 = "H60001";

		if Config.HomeData.data_figure[uv0:getHomeLookId()] then
			slot4 = slot3.look_id;
		end

		slot0.board_role = createEffectSpine(slot4, cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.idle);

		slot0.board_role:setScale(1);
		slot0.role_slayer:addChild(slot0.board_role);
	end

	if not slot0.map_data.pos then
		slot2 = 1;
	end

	slot0.role_cur_board_index = slot2;

	if slot0.board_grid_data[slot0.role_cur_board_index] then
		slot0.cur_role_grid_x, slot0.cur_role_grid_y = MonopolyTile.indexTile(slot2.grid_index);
		slot3, slot4 = MonopolyTile.indexPixel(slot2.grid_index);

		slot0.board_role:setPosition(slot3, slot4);

		if slot0.board_grid_data[slot0.role_cur_board_index + 1] then
			slot6, slot7 = MonopolyTile.indexPixel(slot5.grid_index);

			if slot6 < slot3 then
				slot0.board_role:setScaleX(-0.65);
			else
				slot0.board_role:setScaleX(0.65);
			end
		end
	end

	slot0:moveBoardToRoleCenter(0.01);
	slot0:checkProceedGridEvt();
end

function MonopolyMainScene.checkProceedGridEvt(slot0)
	if slot0.map_data.now_type and slot0.map_data.now_type ~= 0 then
		slot0.is_proceed_evt = true;

		uv0:triggerGridEvtByType(slot0.map_data.now_type, slot0.cur_monopoly_id);
	end
end

function MonopolyMainScene.getGridEventTypeByIndex(slot0, slot1)
	slot2 = MonopolyConst.Event_Type.Normal;

	if not slot0.map_data then
		return slot2
	end

	slot3 = pairs;

	if not slot0.map_data.events then
		slot5 = {};
	end

	for slot6, slot7 in slot3(slot5) do
		if slot7.pos == slot1 then
			slot2 = slot7.type;

			break
		end
	end

	return slot2
end

function MonopolyMainScene.moveBoardToRoleCenter(slot0, slot1)
	if not slot1 then
		slot1 = 0.3;
	end

	slot2, slot3 = slot0:getBoardPosOfRoleCenter();

	slot0.board_container:runAction(cc.MoveTo:create(slot1, cc.p(slot2, slot3)));
end

function MonopolyMainScene.getBoardPosOfRoleCenter(slot0)
	slot1 = 0;
	slot2 = 0;

	if slot0.board_role then
		slot3, slot4 = slot0.board_role:getPosition();

		if slot3 <= SCREEN_WIDTH * 0.5 then
			slot1 = 0;
		else
			slot1 = SCREEN_WIDTH * 0.5 - slot3;
		end

		if slot4 <= display.height * 0.5 then
			slot2 = 0;
		else
			slot2 = display.height * 0.5 - slot4;
		end
	end

	return slot0:checkBoardPos(slot1, slot2)
end

function MonopolyMainScene.updateGridListZorder(slot0)
	uv0(slot0.all_grid_item_list, function (slot0, slot1)
		slot2, slot3 = slot0:getCurGridPos();
		slot4, slot5 = slot1:getCurGridPos();

		if slot3 == slot5 then
			if slot2 >= slot4 then
				slot6 = false;
			else
				slot6 = true;
			end

			return slot6
		else
			if slot5 >= slot3 then
				slot6 = false;
			else
				slot6 = true;
			end

			return slot6
		end
	end);

	slot2 = 1;

	for slot6, slot7 in ipairs(slot0.all_grid_item_list) do
		slot7:setItemLocalZOrder(slot2 + 1);
	end
end

function MonopolyMainScene.updateBossProgress(slot0)
	if not slot0.cur_monopoly_id then
		return
	end

	if not uv0:getGuildDevelopValById(slot0.cur_monopoly_id) then
		slot1 = 0;
	end

	if Config.MonopolyMapsData.data_customs[slot0.cur_monopoly_id] then
		if not slot2.max_develop then
			slot3 = 1;
		end

		slot0.probe_txt:setString(slot1 .. "/" .. slot3);
		slot0.probe_progress:setPercent(slot1 / slot3 * 100);
	end
end

function MonopolyMainScene.updateBossIconList(slot0, slot1)
	if not slot1 then
		slot1 = {};
	end

	function slot2(slot0)
		for slot4, slot5 in pairs(uv0) do
			if slot5.boss_id == slot0 then
				return slot5
			end
		end
	end

	if Config.MonopolyDungeonsData.data_boss_info[slot0.cur_monopoly_id] then
		slot4 = 390;

		for slot8, slot9 in ipairs(slot3) do
			if not slot0.progress_boss_list[slot8] then
				slot10 = PlayerHead.new(PlayerHead.type.circle);

				slot10:addCallBack(function ()
					MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyBoss, uv0.cur_monopoly_id);
				end);
				slot10:setScale(0.6);
				slot0.top_panel:addChild(slot10);

				slot10.num_txt = createLabel(20, cc.c4b(255, 248, 191), 2, 50, 5, slot9.develop, slot10, 2, cc.p(0.5, 1));

				slot10.num_txt:setScale(1.67);
				slot10:setHeadRes(slot9.head_id);
				slot10:setPosition(slot4 + (slot8 - 1) * 97, 22);

				slot10.status = 0;
				slot0.progress_boss_list[slot8] = slot10;
			end

			slot11 = slot2(slot9.boss_id);

			if not slot10.pass_sp then
				slot10.pass_sp = createSprite(PathTool.getResFrame("common", "common_1000"), 54, 54, slot10, cc.p(0.5, 0.5));

				slot10.pass_sp:setVisible(false);
			end

			if slot11 and slot10.status ~= slot11.status then
				slot10.status = slot11.status;

				if slot11.status == 1 then
					slot10.pass_sp:setVisible(false);
					setChildUnEnabled(true, slot10);
				elseif slot11.status == 2 then
					slot10.pass_sp:setVisible(false);
					setChildUnEnabled(false, slot10);
				else
					slot10.pass_sp:setVisible(true);
					setChildUnEnabled(true, slot10);
				end
			elseif not slot11 then
				slot10.pass_sp:setVisible(false);
				setChildUnEnabled(true, slot10);
			end
		end
	end
end

function MonopolyMainScene.updateMonopolyBuffs(slot0, slot1)
	if not slot1 then
		slot2 = {};
	end

	slot0.monopoly_buff_data = slot2;

	for slot5, slot6 in pairs(slot0.buff_icon_list) do
		slot6:setVisible(false);
	end

	slot5 = SortTools.KeyLowerSorter;

	table.sort(slot0.monopoly_buff_data, slot5("type"));

	for slot5, slot6 in ipairs(slot0.monopoly_buff_data) do
		if not slot0.buff_icon_list[slot5] then
			slot7 = slot0:createBuffIcon();

			registerButtonEventListener(slot7, function ()
				uv0:onClickBuffIcon(uv1);
			end, true);

			slot0.buff_icon_list[slot5] = slot7;
		end

		if MonopolyConst.Buff_Info[slot6.type] then
			slot7:loadTexture(PathTool.getResFrame("monopoly", slot8[1], false, "monopolyboard"), LOADTEXT_TYPE_PLIST);

			if not slot6.num then
				slot9 = 0;
			end

			slot7.num_txt:setString("X" .. slot9);
		end

		slot7:setVisible(true);
		slot7:setPositionY(183 - (slot5 - 1) * 94);
	end
end

function MonopolyMainScene.onClickBuffIcon(slot0, slot1)
	if not slot0.monopoly_buff_data then
		return
	end

	if not slot0.monopoly_buff_data[slot1] then
		return
	end

	if not MonopolyConst.Buff_Info[slot2.type] then
		return
	end

	if not slot0.buff_desc_bg then
		slot0.buff_desc_bg = createImage(slot0.buff_panel, PathTool.getResFrame("monopoly", "monopolyboard_1019", false, "monopolyboard"), 105, 0, cc.p(0, 0.5), true, nil, true);

		slot0.buff_desc_bg:setCapInsets(cc.rect(28, 30, 1, 1));

		slot0.buff_desc_txt = createRichLabel(20, cc.c4b(142, 129, 119, 255), cc.p(0.5, 0.5), cc.p(0, 0), nil, nil, 500);

		slot0.buff_desc_bg:addChild(slot0.buff_desc_txt);
	end

	if Config.MonopolyMapsData.data_item_show[slot3[2]] then
		slot0.buff_desc_txt:setString(slot4.desc);

		slot5 = slot0.buff_desc_txt:getContentSize();

		slot0.buff_desc_bg:setContentSize(cc.size(slot5.width + 45, slot5.height + 20));
		slot0.buff_desc_txt:setPosition((slot5.width + 50) * 0.5 + 15, (slot5.height + 20) * 0.5);
		slot0.buff_desc_bg:setVisible(true);

		if slot0.buff_icon_list[slot1] then
			slot0.buff_desc_bg:setPositionY(slot6:getPositionY());
		end

		if not slot0.buff_mask then
			slot7 = ccui.Layout;
			slot0.buff_mask = slot7:create();
			slot7 = slot0.buff_mask;

			slot7:setContentSize(SCREEN_WIDTH, display.height);

			slot7 = slot0.buff_mask;

			slot7:setPositionY(display.getBottom(slot0.ui_container));

			slot7 = slot0.buff_mask;

			slot7:setTouchEnabled(true);

			slot7 = slot0.ui_container;

			slot7:addChild(slot0.buff_mask);

			slot7 = slot0.buff_mask;

			slot7:setSwallowTouches(false);

			slot7 = slot0.buff_mask;

			slot7:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0.buff_desc_bg:setVisible(false);
					uv0.buff_mask:setVisible(false);
				end
			end);
		else
			slot0.buff_mask:setVisible(true);
		end
	end
end

function MonopolyMainScene.createBuffIcon(slot0)
	slot1 = createImage(slot0.buff_panel, nil, 60, 0, cc.p(0.5, 0.5), true);

	slot1:setTouchEnabled(true);

	slot2 = createSprite(PathTool.getResFrame("monopoly", "monopolyboard_1018", false, "monopolyboard"), 37, 0, slot1, cc.p(0.5, 0.5));
	slot1.num_txt = createLabel(20, cc.c4b(255, 248, 191, 255), cc.c4b(22, 5, 0, 255), 37, 0, "", slot1, 2, cc.p(0.5, 0.5));

	return slot1
end

function MonopolyMainScene.playCloudEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.root_wnd) and slot0.cloud_effect == nil then
			slot0.cloud_effect = createEffectSpine(Config.EffectData.data_effect_info[157], cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1);

			slot0.cloud_effect:setScale(display.getMaxScale());
			slot0.root_wnd:addChild(slot0.cloud_effect, 99);
		elseif slot0.cloud_effect then
			slot0.cloud_effect:setToSetupPose();
			slot0.cloud_effect:setAnimation(0, PlayerAction.action_1, false);
		end
	elseif slot0.cloud_effect then
		slot0.cloud_effect:clearTracks();
		slot0.cloud_effect:removeFromParent();

		slot0.cloud_effect = nil;
	end
end

function MonopolyMainScene.checkShowTips(slot0)
	if uv0:getWaitShowTipsData() and slot1[1] then
		if not slot0.wait_tips_bg then
			slot2 = slot0.ui_container:getContentSize();
			slot0.wait_tips_bg = createImage(slot0.ui_container, PathTool.getResFrame("monopoly", "monopolyboard_1017", false, "monopolyboard"), slot2.width * 0.5, slot2.height * 0.5 + 100, cc.p(0.5, 0.5), true, 99, true);

			slot0.wait_tips_bg:setContentSize(cc.size(720, 108));

			slot0.wait_tips_txt = createLabel(40, cc.c4b(255, 253, 217, 255), cc.c4b(167, 80, 3, 255), 360, 54, "", slot0.wait_tips_bg, 2, cc.p(0.5, 0.5), "fonts/title.ttf");
		end

		if Config.MonopolyMapsData.data_buff_tips[slot1[1].type] then
			slot0.wait_tips_bg:setVisible(true);
			slot0.wait_tips_txt:setString(slot2.desc);
			slot0.wait_tips_bg:runAction(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
				uv0.wait_tips_bg:setVisible(false);
				uv1:checkShowWaitAward();
			end)));
			uv0:clearWaitShowTipsData();
		else
			uv1:checkShowWaitAward();
		end
	else
		uv1:checkShowWaitAward();
	end
end

function MonopolyMainScene.close_callback(slot0)
	slot0:playCloudEffect(false);

	slot4 = false;

	slot0:handlerTargetEffect(slot4);

	for slot4, slot5 in pairs(slot0.route_effect_list) do
		if slot5.effect then
			slot5.effect:clearTracks();
			slot5.effect:removeFromParent();

			slot5.effect = nil;
		end
	end

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event);

		slot0.role_assets_event = nil;
	end

	slot0:openBoardMoveTimer(false);

	if slot0.board_bg_load then
		slot0.board_bg_load:DeleteMe();

		slot0.board_bg_load = nil;
	end

	slot0:removeBoardRole();

	for slot4, slot5 in pairs(slot0.all_grid_item_list) do
		slot5:DeleteMe();

		slot5 = nil;
	end

	if slot0.pumpkin_num then
		slot0.pumpkin_num:DeleteMe();

		slot0.pumpkin_num = nil;
	end

	if slot0.secret_num then
		slot0.secret_num:DeleteMe();

		slot0.secret_num = nil;
	end

	for slot4, slot5 in pairs(slot0.progress_boss_list) do
		slot5:DeleteMe();

		slot5 = nil;
	end

	uv0:setCurMonopolyMapId(0);
	uv1:openMonopolyMianScene(false);
end
