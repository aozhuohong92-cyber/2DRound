slot1 = ActionyearmonsterController:getInstance():getModel();
slot2 = string.format;
slot3 = table.insert;
slot4 = table.remove;
slot5 = table.sort;
slot6 = math.abs;
slot7 = ActionyearmonsterMainWindow or BaseClass(BaseView);
ActionyearmonsterMainWindow = slot7;

function ActionyearmonsterMainWindow.__init(slot0)
	slot0.is_full_screen = true;
	slot0.win_type = WinType.Full;
	slot0.view_tag = ViewMgrTag.WIN_TAG;
	slot0.layout_name = "actionyearmonster/actionyearmonster_main_window";
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster"),
			type = ResourcesType.plist
		}
	};

	slot0:initConfig();
end

function ActionyearmonsterMainWindow.initConfig(slot0)
	slot0.cur_role_grid_index = 0;
	slot0.is_role_moving = false;
	slot0.grid_object_list = {};
	slot0.par_grid_object_list = {};
	slot0.evt_item_list = {};
	slot0.role_move_grid_cache = {};
	slot0.is_hide_top = false;
	slot0.route_effect_list = {};
	slot0.break_effect_list = {};
	slot0.touchFive = false;
	slot0.other_role_data = {};
	slot0.other_role_list = {};
	slot0.cur_map_width = PlanesConst.Map_Width;
	slot0.cur_map_height = PlanesConst.Map_Height;
	slot0.role_vo = RoleController:getInstance():getRoleVo();
	slot0.holiday_nian_tribute_id = 80351;

	if Config.HolidayNianData.data_const.holiday_nian_tribute_id then
		slot0.holiday_nian_tribute_id = slot1.val;
	end
end

function ActionyearmonsterMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background");

	slot0.background:setScale(display.getMaxScale());

	slot0.touch_slayer = slot0.root_wnd:getChildByName("touch_slayer");

	slot0.touch_slayer:setScale(display.getMaxScale());
	slot0.touch_slayer:setSwallowTouches(false);

	slot0.map_container = slot0.root_wnd:getChildByName("map_container");
	slot0.grid_slayer = slot0.map_container:getChildByName("grid_slayer");
	slot0.evt_slayer = slot0.map_container:getChildByName("evt_slayer");
	slot0.ui_container = slot0.root_wnd:getChildByName("ui_container");
	slot0.close_btn = slot0.ui_container:getChildByName("close_btn");
	slot0.figure_btn = slot0.ui_container:getChildByName("figure_btn");

	slot0.figure_btn:getChildByName("label"):setString(TI18N("更换形象"));

	slot0.face_btn = slot0.ui_container:getChildByName("face_btn");

	slot0.face_btn:getChildByName("label"):setString(TI18N("表情设置"));

	slot0.five_btn = slot0.ui_container:getChildByName("five_btn");
	slot0.five_btn_num = slot0.five_btn:getChildByName("num");

	slot0.five_btn:getChildByName("label"):setString(TI18N("点击燃放"));

	slot0.redbag_btn = slot0.ui_container:getChildByName("redbag_btn");
	slot0.redbag_btn_num = slot0.redbag_btn:getChildByName("num");

	slot0.redbag_btn:getChildByName("label"):setString(TI18N("点击前往"));

	slot0.btn_rule = slot0.ui_container:getChildByName("btn_rule");
	slot0.btn_hide = slot0.ui_container:getChildByName("btn_hide");
	slot0.bottom_panel = slot0.ui_container:getChildByName("bottom_panel");
	slot0.bag_btn = slot0.bottom_panel:getChildByName("bag_btn");
	slot0.hero_btn = slot0.bottom_panel:getChildByName("hero_btn");
	slot0.buff_btn = slot0.bottom_panel:getChildByName("buff_btn");
	slot1 = slot0.ui_container:getChildByName("shadow_bg_1");
	slot2 = slot0.ui_container:getChildByName("shadow_bg_2");
	slot0.top_title_bg = slot0.ui_container:getChildByName("top_title_bg");
	slot0.act_time = slot0.top_title_bg:getChildByName("act_time");
	slot0.floor_txt = slot0.top_title_bg:getChildByName("floor_txt");

	slot0.floor_txt:setString(TI18N("新年瑞兽"));

	if Config.HolidayNianData.data_const.start_time then
		slot0.act_time:setString(TI18N("活动时间:") .. slot3.desc);
	else
		slot0.act_time:setVisible(false);
	end

	slot0.progress_container = slot0.ui_container:getChildByName("progress_container");
	slot0.progress = slot0.progress_container:getChildByName("progress");
	slot0.progress_size = slot0.progress:getContentSize();
	slot0.hp_value = slot0.progress_container:getChildByName("hp_value");
	slot0.tips = slot0.progress_container:getChildByName("tips");
	slot0.status_tips = slot0.progress_container:getChildByName("status_tips");
	slot0.progress_icon = slot0.progress_container:getChildByName("icon");

	if Config.HolidayNianData.data_redbag_progress and next(slot4) ~= nil then
		slot0.box_list = {};
		slot5 = slot4[#slot4];
		slot0.max_num = slot5;
		slot6 = slot0.progress_size.width / slot5;

		for slot10, slot11 in ipairs(slot4) do
			if slot10 >= #slot4 then
				break
			end

			slot13 = slot6 * slot11 + 80;
			slot0.box_list[slot10] = {
				sprite = createSprite(PathTool.getResFrame("actionyearmonster", "actionyearmonster_20"), slot13, 24, slot0.progress_container, cc.p(0.5, 0.5)),
				lable = createLabel(22, cc.c4b(255, 255, 255, 255), cc.c4b(159, 48, 27, 255), slot13, 52, slot11, slot0.progress_container, 2, cc.p(0.5, 0.5)),
				per = slot11 * 100 / slot5,
				is_show_redbag = false
			};
		end
	end

	slot0.buoy_1 = slot0.ui_container:getChildByName("buoy_1");

	slot0.buoy_1:setVisible(false);

	slot0.buoy_1_img = slot0.buoy_1:getChildByName("img");
	slot0.buoy_2 = slot0.ui_container:getChildByName("buoy_2");

	slot0.buoy_2:setVisible(false);

	slot0.buoy_2_img = slot0.buoy_2:getChildByName("img");
	slot0.five_effect_container = slot0.ui_container:getChildByName("five_effect_container");

	slot0.five_effect_container:setVisible(false);

	slot5 = slot0.ui_container:getContentSize();
	slot6 = display.getTop(slot0.ui_container);
	slot7 = display.getBottom(slot0.ui_container);

	function slot8(slot0)
		if tolua.isnull(slot0) then
			return
		end

		slot0:setPositionY(uv0 - (uv1.height - slot0:getPositionY()));
	end

	function slot9(slot0)
		if tolua.isnull(slot0) then
			return
		end

		slot0:setPositionY(uv0 + slot0:getPositionY());
	end

	slot8(slot2);
	slot8(slot0.top_title_bg);
	slot8(slot0.five_btn);
	slot8(slot0.redbag_btn);

	slot0.left_btn_pos_y = {
		slot0.five_btn:getPositionY(),
		slot0.redbag_btn:getPositionY()
	};

	slot8(slot0.btn_rule);
	slot8(slot0.btn_hide);
	slot8(slot0.progress_container);
	slot9(slot1);
	slot9(slot0.bottom_panel);
	slot9(slot0.figure_btn);
	slot9(slot0.face_btn);
	slot9(slot0.close_btn);

	slot0.buoy_line = {};
	slot0.center_pos_x = 360;
	slot0.center_pos_y = 640;
	slot0.center_r = 50;
	slot10 = 0 + slot0.center_r;
	slot11 = 720 - slot0.center_r;
	slot12 = slot0.bottom_panel:getPositionY() + 212 + slot0.center_r;
	slot13 = slot0.progress_container:getPositionY() - 67 - slot0.center_r;
	slot0.y2 = slot13;
	slot0.x1 = slot10;
	slot0.box_x1 = slot10 - slot0.center_r;
	slot0.box_x2 = slot11 + slot0.center_r;
	slot0.box_y1 = slot12 - slot0.center_r;
	slot0.box_y2 = slot13 + slot0.center_r;

	uv0(slot0.buoy_line, {
		pos_1 = cc.p(slot10, slot12),
		pos_2 = cc.p(slot11 - 110, slot12)
	});
	uv0(slot0.buoy_line, {
		pos_1 = cc.p(slot10, slot12),
		pos_2 = cc.p(slot10, slot13)
	});
	uv0(slot0.buoy_line, {
		pos_1 = cc.p(slot10, slot13),
		pos_2 = cc.p(slot11, slot13)
	});
	uv0(slot0.buoy_line, {
		pos_1 = cc.p(slot11, slot12 + 130),
		pos_2 = cc.p(slot11, slot13)
	});
	uv0(slot0.buoy_line, {
		pos_1 = cc.p(slot11 - 110, slot12),
		pos_2 = cc.p(slot11 - 110, slot12 + 130)
	});
	uv0(slot0.buoy_line, {
		pos_1 = cc.p(slot11 - 110, slot12 + 130),
		pos_2 = cc.p(slot11, slot12 + 130)
	});
	slot0:checkBuoyMoveTimer(true);
	MainuiController:getInstance():setIsShowMainUIBottom(false);
end

function ActionyearmonsterMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2);
	registerButtonEventListener(slot0.bag_btn, handler(slot0, slot0.onClickBagBtn), true);
	registerButtonEventListener(slot0.hero_btn, handler(slot0, slot0.onClickHeroBtn), true);
	registerButtonEventListener(slot0.buff_btn, handler(slot0, slot0.onClickBuffBtn), true);
	registerButtonEventListener(slot0.btn_hide, handler(slot0, slot0.onClickHideBtn), true);
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true);
	registerButtonEventListener(slot0.figure_btn, handler(slot0, slot0.onClickFigureBtn), true);
	registerButtonEventListener(slot0.face_btn, handler(slot0, slot0.onClickFaceBtn), true);
	registerButtonEventListener(slot0.five_btn, handler(slot0, slot0.onClickFiveBtn), true);
	registerButtonEventListener(slot0.redbag_btn, handler(slot0, slot0.onClickRedbagBtn), true);

	slot1 = slot0.touch_slayer;

	slot1:addTouchEventListener(function (slot0, slot1)
		if not uv0.init_tile_end then
			return
		end

		if uv0.is_role_moving then
			uv0.stop_center_flag = true;
		end

		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began_pos = slot0:getTouchBeganPosition();
			uv0.last_pos = uv0.touch_began_pos;
		elseif slot1 == ccui.TouchEventType.moved then
			slot2 = slot0:getTouchMovePosition();

			if uv0.last_pos then
				uv0.last_pos = slot2;

				uv0:onTouchMoveMap(slot2.x - uv0.last_pos.x, slot2.y - uv0.last_pos.y);
			end
		elseif slot1 == ccui.TouchEventType.ended then
			slot2 = slot0:getTouchEndPosition();

			if uv0.touch_began_pos and slot2 and uv1(slot2.x - uv0.touch_began_pos.x) <= 20 and uv1(slot2.y - uv0.touch_began_pos.y) <= 20 then
				if uv0.is_role_moving then
					uv0.target_grid_index = nil;
					uv0.role_move_grid_cache = {};
				else
					slot3 = uv0.grid_slayer:convertToNodeSpace(slot2);
					slot4, slot5 = PlanesTile.toTile(slot3.x, slot3.y);

					uv0:onClickGridIconByIndex(PlanesTile.tileIndex(slot4, slot5));
				end
			end
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.YEAR_MONSTER_BASE_INFO, function (slot0)
		uv0:setBaseData(slot0);
		uv0:updateRedBagCount();

		if uv1:getCellData() ~= nil and not uv0.init_cell_data then
			uv0.init_cell_data = true;

			uv0:setData(slot1);
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.YEAR_MONSTER_CEIL_INFO, function (slot0)
		if uv0:getBaseData() ~= nil and not uv1.init_cell_data then
			uv1.init_cell_data = true;

			uv1:setBaseData(slot1);
			uv1:updateRedBagCount();
			uv1:setData(slot0);
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.YEAR_UPDATE_GRID_EVENT, function (slot0)
		if slot0 then
			uv0:updateSomeGridData(slot0);
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.YEAR_Add_Evt_Data_Event, function (slot0)
		if uv0.init_evt_end and slot0 then
			uv0:addEvtItemList(slot0);
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Update_Role_Grid_Event, function (slot0)
		if slot0 and slot0.code == 0 then
			uv0:doRoleStopMove();
		end
	end);
	slot0:addGlobalEvent(HomeworldEvent.Update_My_Home_Figure_Event, function ()
		uv0:createRole(HomeworldController:getInstance():getModel():getMyCurHomeFigureId());
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Five_Effect_Event, function (slot0)
		if slot0 and slot0.code == 1 then
			uv0:showFiveEffect(true, slot0);
			uv0:setOtherRoleFace();
		else
			uv0.touchFive = false;
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Send_Face_Event, function (slot0)
		if uv0.map_role then
			uv0:updateRoleFace(uv0.map_role, slot0);
			uv0:setOtherRoleFace(uv0.cur_role_grid_index);
		end
	end);
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Other_Role_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.other_role_data = slot0.player;

		uv0:createOtherTimer();
	end);
	slot0:addGlobalEvent(RoleEvent.GetTitleList, function (slot0)
		if not slot0 then
			return
		end

		uv0.use_title_id = slot0.base_id;

		if uv0.map_role then
			uv0:updateHonorInfo(uv0.map_role, uv0.use_title_id);
		end
	end);

	if slot0.role_assets_event == nil and slot0.role_vo then
		slot1 = slot0.role_vo;
		slot0.role_assets_event = slot1:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			uv0:checkLeftShowInfo();
			uv0:updateSubmitRedInfo();
		end);
	end
end

function ActionyearmonsterMainWindow.onTouchMoveMap(slot0, slot1, slot2)
	if not slot0.map_container then
		return
	end

	slot3, slot4 = slot0.map_container:getPosition();
	slot7, slot8 = slot0:checkMapSafePos(slot3 + slot1, slot4 + slot2);

	slot0.map_container:setPosition(cc.p(slot7, slot8));
end

function ActionyearmonsterMainWindow.checkMapSafePos(slot0, slot1, slot2)
	if slot0.map_max_pos_x < slot1 then
		slot1 = slot0.map_max_pos_x;
	elseif slot1 < slot0.map_min_pos_x then
		slot1 = slot0.map_min_pos_x;
	end

	if slot0.map_max_pos_y < slot2 then
		slot2 = slot0.map_max_pos_y;
	elseif slot2 < slot0.map_min_pos_y then
		slot2 = slot0.map_min_pos_y;
	end

	return slot1, slot2
end

function ActionyearmonsterMainWindow.onClickCloseBtn(slot0)
	uv0:openActionyearmonsterMainWindow(false);
end

function ActionyearmonsterMainWindow.onClickBagBtn(slot0)
	uv0:openActionyearmonsterBagPanel(true);
end

function ActionyearmonsterMainWindow.onClickHeroBtn(slot0)
	uv0:openActionyearmonsterExchangeWindow(true);
end

function ActionyearmonsterMainWindow.onClickBuffBtn(slot0)
	if not slot0.base_data then
		return
	end

	uv0:openActionyearmonsterSubmitPanel(true, {
		base_data = slot0.base_data
	});
end

function ActionyearmonsterMainWindow.onClickFaceBtn(slot0)
	ElitematchController:getInstance():openElitematchDeclarationPanel(true, ElitematchConst.MsgType.eYearMonster);
end

function ActionyearmonsterMainWindow.onClickFiveBtn(slot0)
	if slot0.touchFive == true then
		message(TI18N("烟花燃放中..."));

		return
	end

	slot0.touchFive = true;

	uv0:sender28221();
end

function ActionyearmonsterMainWindow.onClickRedbagBtn(slot0)
	if slot0.redbag_list and next(slot0.redbag_list) ~= nil then
		slot1 = {};

		for slot5, slot6 in ipairs(slot0.redbag_list) do
			slot7, slot8 = PlanesTile.indexTile(slot0.cur_role_grid_index);
			slot10, slot11 = PlanesTile.indexTile(slot6.index);

			if PlanesTile.astar(cc.p(slot7, slot8), cc.p(slot10, slot11), slot0.cur_block_cfg) then
				uv0(slot1, slot6.index);
			end
		end

		if next(slot1) ~= nil then
			if slot1[math.random(1, #slot1)] then
				slot0:onClickGridIconByIndex(slot1[slot3]);
			end
		else
			message(TI18N("前往路径上有障碍噢~"));
		end
	end
end

function ActionyearmonsterMainWindow.onClickHideBtn(slot0)
	slot0.is_hide_top = not slot0.is_hide_top;

	MainuiController:getInstance():setMainUIShowStatus(not slot0.is_hide_top);
	MainuiController:getInstance():setIsShowMainUIBottom(false);
	slot0.top_title_bg:setVisible(not slot0.is_hide_top);
	slot0.btn_rule:setVisible(not slot0.is_hide_top);
	slot0.btn_hide:setVisible(not slot0.is_hide_top);
	slot0.close_btn:setVisible(not slot0.is_hide_top);
	slot0.bottom_panel:setVisible(not slot0.is_hide_top);
	slot0.progress_container:setVisible(not slot0.is_hide_top);
	slot0.five_btn:setVisible(not slot0.is_hide_top);
	slot0.redbag_btn:setVisible(not slot0.is_hide_top);
	slot0.figure_btn:setVisible(not slot0.is_hide_top);
	slot0.face_btn:setVisible(not slot0.is_hide_top);

	if not slot0.is_hide_top then
		slot0:checkLeftShowInfo();
	end

	if slot0.is_hide_top then
		if not slot0.hide_mask then
			slot1 = ccui.Layout;
			slot0.hide_mask = slot1:create();
			slot1 = slot0.hide_mask;

			slot1:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT);

			slot1 = slot0.hide_mask;

			slot1:setScale(display.getMaxScale());

			slot1 = slot0.hide_mask;

			slot1:setAnchorPoint(cc.p(0.5, 0.5));

			slot1 = slot0.hide_mask;

			slot1:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);

			slot1 = slot0.hide_mask;

			slot1:setTouchEnabled(true);

			slot1 = slot0.ui_container;

			slot1:addChild(slot0.hide_mask, 99);

			slot1 = slot0.hide_mask;

			slot1:setSwallowTouches(false);

			slot1 = slot0.hide_mask;

			slot1:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:onClickHideBtn();
				end
			end);
		end

		slot0.hide_mask:setVisible(true);
	elseif slot0.hide_mask then
		slot0.hide_mask:setVisible(false);
	end
end

function ActionyearmonsterMainWindow.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.HolidayNianData.data_const.holiday_nian_desc then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition());
	end
end

function ActionyearmonsterMainWindow.onClickFigureBtn(slot0)
	if slot0.is_role_moving then
		message("角色移动中, 无法更换形象");

		return
	end

	if not uv0:getPlanesRoleLookId() or slot1 == 0 then
		slot3 = 70;

		if Config.HomeData.data_const.open_lev and not slot2.val then
			slot3 = 70;
		end

		message(uv1(TI18N("%s级开启家园系统，开启后才可更换Q版冒险形象哦~"), slot3));
	else
		HomeworldController:getInstance():openHomeworldFigureWindow(true);
	end
end

function ActionyearmonsterMainWindow.updateSubmitRedInfo(slot0)
	if not slot0.base_data then
		return
	end

	if not slot0.role_vo then
		return
	end

	slot1 = slot0.role_vo:getActionAssetsNumByBid(slot0.holiday_nian_tribute_id);

	if slot0.base_data.val < slot0.base_data.max_val and slot1 > 0 then
		addRedPointToNodeByStatus(slot0.buff_btn, true, 0, -15);
	else
		addRedPointToNodeByStatus(slot0.buff_btn, false, 0, -20);
	end
end

function ActionyearmonsterMainWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		slot1 = {};
	end

	slot0.cur_dun_id = 1;
	slot0.cur_floor = 1;

	uv0:sender28200();
	uv0:sender28222();
	RoleController:getInstance():sender23300();
end

function ActionyearmonsterMainWindow.checkLeftShowInfo(slot0)
	if not slot0.role_vo then
		return
	end

	slot2 = 1;

	if slot0.role_vo:getActionAssetsNumByBid(80352) > 0 then
		slot0.five_btn:setVisible(true);
		slot0.five_btn_num:setString("x" .. slot1);

		slot2 = slot2 + 1;
	else
		slot0.five_btn:setVisible(false);
	end

	if slot0.redbag_list and next(slot0.redbag_list) ~= nil then
		slot0.redbag_btn:setPositionY(slot0.left_btn_pos_y[slot2]);
		slot0.redbag_btn:setVisible(true);
		slot0.redbag_btn_num:setString("x" .. #slot0.redbag_list);

		slot2 = slot2 + 1;
	else
		slot0.redbag_btn:setVisible(false);
	end

	if slot2 == 1 then
		slot0.buoy_line[7] = nil;
		slot0.buoy_line[8] = nil;

		if slot0.buoy_line[2] then
			slot0.buoy_line[2].pos_2.y = slot0.y2;
		end

		if slot0.buoy_line[3] then
			slot0.buoy_line[3].pos_1.x = slot0.x1;
		end
	elseif slot2 == 2 then
		slot3 = 100;
		slot4 = 120;

		if slot0.buoy_line[2] then
			slot0.buoy_line[2].pos_2.y = slot0.y2 - slot4;
		end

		if slot0.buoy_line[3] then
			slot0.buoy_line[3].pos_1.x = slot0.x1 + slot3;
		end

		slot0.buoy_line[7] = {
			pos_1 = cc.p(slot0.x1, slot0.y2 - slot4),
			pos_2 = cc.p(slot0.x1 + slot3, slot0.y2 - slot4)
		};
		slot0.buoy_line[8] = {
			pos_1 = cc.p(slot0.x1 + slot3, slot0.y2 - slot4),
			pos_2 = cc.p(slot0.x1 + slot3, slot0.y2)
		};
	else
		slot3 = 100;
		slot4 = 220;

		if slot0.buoy_line[2] then
			slot0.buoy_line[2].pos_2.y = slot0.y2 - slot4;
		end

		if slot0.buoy_line[3] then
			slot0.buoy_line[3].pos_1.x = slot0.x1 + slot3;
		end

		slot0.buoy_line[7] = {
			pos_1 = cc.p(slot0.x1, slot0.y2 - slot4),
			pos_2 = cc.p(slot0.x1 + slot3, slot0.y2 - slot4)
		};
		slot0.buoy_line[8] = {
			pos_1 = cc.p(slot0.x1 + slot3, slot0.y2 - slot4),
			pos_2 = cc.p(slot0.x1 + slot3, slot0.y2)
		};
	end
end

function ActionyearmonsterMainWindow.setVisible(slot0, slot1)
	slot0.is_visible = slot1;

	if slot0.root_wnd == nil or tolua.isnull(slot0.root_wnd) then
		return
	end

	slot0.root_wnd:setVisible(slot1);

	if slot1 == true then
		MainuiController:getInstance():setIsShowMainUIBottom(false);
	else
		MainuiController:getInstance():setIsShowMainUIBottom(true);
	end
end

function ActionyearmonsterMainWindow.updateRedBagCount(slot0)
	if not slot0.base_data then
		return
	end

	for slot4, slot5 in pairs(slot0.evt_item_list) do
		if slot5.evt_cfg and slot5.evt_cfg.id == ActionyearmonsterConstants.evt_redbag then
			slot5:updateRedbagCount();
		end
	end
end

function ActionyearmonsterMainWindow.setBaseData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.progress then
		return
	end

	slot0.base_data = slot1;

	slot0.progress:setPercent(slot1.val * 100 / slot1.max_val);

	if slot0.is_init_per == nil then
		slot0.is_init_per = true;

		for slot6, slot7 in ipairs(slot0.box_list) do
			slot7.lable:setString(math.floor(slot1.max_val * slot7.per / 100));

			if slot7.per <= slot2 then
				slot7.is_show_redbag = true;
			else
				slot7.lable:disableEffect(cc.LabelEffect.OUTLINE);
				setChildUnEnabled(true, slot7.lable);
				setChildUnEnabled(true, slot7.sprite);
			end
		end
	else
		for slot6, slot7 in ipairs(slot0.box_list) do
			slot7.lable:setString(math.floor(slot1.max_val * slot7.per / 100));

			if slot7.per <= slot2 and not slot7.is_show_redbag then
				slot0:showRedBagEffect();

				slot7.is_show_redbag = true;

				slot7.lable:disableEffect(cc.LabelEffect.OUTLINE);
				slot7.lable:enableOutline(cc.c4b(159, 48, 27, 255), 2);
				setChildUnEnabled(false, slot7.lable);
				setChildUnEnabled(false, slot7.sprite);
			end
		end
	end

	if slot0.record_val == nil then
		slot0.record_val = slot0.base_data.val;
	else
		if slot0.base_data.val - slot0.record_val > 0 then
			slot0:crateLabelEffect(slot3);
		end

		slot0.record_val = slot0.base_data.val;
	end

	slot0.hp_value:setString(uv0("%s/%s", slot1.val, slot1.max_val));

	if slot1.flag == 1 then
		slot0.tips:setString(TI18N("限时年兽已苏醒，前往挑战获取丰厚奖励！"));
		slot0.tips:setTextColor(cc.c4b(255, 239, 237, 255));
		slot0.tips:enableOutline(cc.c4b(79, 1, 1, 255), 2);

		if slot1.end_time - GameNet:getInstance():getTime() < 0 then
			slot3 = 0;
		end

		setChildUnEnabled(false, slot0.progress_icon);

		slot4 = slot0.status_tips;

		slot4:setPositionY(-26);

		slot4 = slot0.status_tips;

		slot4:setTextColor(cc.c4b(255, 72, 48, 255));
		commonCountDownTime(slot0.status_tips, slot3, {
			callback = function (slot0)
				uv0:setTimeFormatString(slot0);
			end
		});
	else
		slot0.tips:setString(TI18N("全服收集祭品, 召唤限时年兽和红包雨"));
		slot0.tips:setTextColor(cc.c4b(255, 242, 199, 255));
		slot0.tips:enableOutline(cc.c4b(0, 0, 0, 255), 2);
		slot0.status_tips:setString(TI18N("未召唤"));
		slot0.status_tips:setPosition(584, 28);
		slot0.status_tips:setTextColor(cc.c4b(255, 242, 199, 255));
		doStopAllActions(slot0.status_tips);
		setChildUnEnabled(true, slot0.progress_icon);
	end

	slot0:updateSubmitRedInfo();
end

function ActionyearmonsterMainWindow.crateLabelEffect(slot0, slot1)
	if slot0.label_list == nil then
		slot0.label_list = {};
	end

	slot2 = nil;

	if #slot0.label_list > 0 then
		slot2 = uv0(slot0.label_list);

		slot2:setVisible(true);
		slot2:setString("+" .. slot1);
	else
		slot2 = createLabel(50, cc.c4b(255, 207, 60, 255), cc.c4b(176, 53, 10, 255), 0, 0, "+" .. slot1, slot0.progress_container, 2, cc.p(0.5, 0.5), "fonts/title.ttf");
	end

	if slot2 then
		slot2:setPosition(450, 0);
		slot2:setOpacity(0);

		slot3 = cc.FadeIn;
		slot4 = cc.DelayTime;
		slot5 = cc.FadeOut;
		slot6 = cc.Sequence;
		slot12 = cc.CallFunc;
		slot7 = cc.EaseSineOut;
		slot10 = cc.MoveTo;
		slot8 = cc.Spawn;

		slot2:runAction(slot8:create(slot7:create(slot10:create(0.8, cc.p(450, 40))), slot6:create(slot3:create(0.2), slot4:create(0.5), slot5:create(0.5), slot12:create(function ()
			uv0:setVisible(false);
			uv1(uv2.label_list, uv0);
		end))));
	end
end

function ActionyearmonsterMainWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.status_tips:setString(uv0(TI18N("%s后消失"), TimeTool.GetTimeForFunction(slot1)));
	else
		slot0.status_tips:setString(TI18N("即将消失"));
	end
end

function ActionyearmonsterMainWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:playCloudEffect(true);
	slot0:initMapTileConfig(slot1.map_id);

	slot0.cur_role_grid_index = slot1.index;
	slot0.cur_grid_data = {};
	slot0.redbag_list = {};
	slot3 = pairs;

	if not slot1.tile_list then
		slot5 = {};
	end

	for slot6, slot7 in slot3(slot5) do
		slot0.cur_grid_data[slot7.index] = slot7;

		if slot7.evtid == ActionyearmonsterConstants.evt_redbag then
			uv0(slot0.redbag_list, slot7);
		end
	end

	slot0:updateMapBg();

	slot0.init_grid_end = false;

	slot0:updateGridList(slot0.cur_grid_data, true);

	slot0.init_evt_end = false;

	slot0:updateEvtList(uv1:getYearEvtVoList());
	slot0:createRole();
	slot0:moveMapToRoleCenter();
	slot0:playBackgroundMusic();
	slot0:checkLeftShowInfo();
end

function ActionyearmonsterMainWindow.playBackgroundMusic(slot0)
	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, "s_002", true);
end

function ActionyearmonsterMainWindow.initMapTileConfig(slot0, slot1)
	if not slot1 then
		return
	end

	if not Config.MapBlock.data(slot1) then
		slot2 = {};
	end

	slot0.cur_block_cfg = slot2;

	if Config.Map[slot1] then
		slot0.cur_map_width = slot2.width;
		slot0.cur_map_height = slot2.height;
	end

	slot0.map_min_pos_x = SCREEN_WIDTH - slot0.cur_map_width;
	slot0.map_max_pos_x = 0;
	slot0.map_min_pos_y = display.height - slot0.cur_map_height;
	slot0.map_max_pos_y = 0;

	PlanesTile.init(PlanesConst.Grid_Width * 0.5, PlanesConst.Grid_Height * 0.5, slot0.cur_map_width, slot0.cur_map_height, PlanesTile.year_monster_type);

	slot0.init_tile_end = true;
end

function ActionyearmonsterMainWindow.updateMapBg(slot0)
	if slot0.cur_map_res_id == true then
		return
	end

	slot0.cur_map_res_id = true;
	slot0.bg_img_load = loadImageTextureFromCDN(slot0.background, "resource/planes/map_bg/map_bg_100001.jpg", ResourcesType.single, slot0.bg_img_load);
end

function ActionyearmonsterMainWindow.updateGridList(slot0, slot1, slot2)
	if not slot1 or next(slot1) == nil then
		return
	end

	if slot0.grid_icon_load then
		slot0.grid_icon_load:DeleteMe();

		slot0.grid_icon_load = nil;
	end

	slot3 = {};
	slot4 = {};

	for slot8, slot9 in pairs(slot1) do
		if not slot4[slot9.res_id] and slot9.res_id ~= 0 then
			uv0(slot3, {
				path = slot0:getGridPathByResId(slot9.res_id),
				type = ResourcesType.single
			});

			slot4[slot9.res_id] = true;
		end
	end

	slot0.grid_icon_load = ResourcesLoad.New();
	slot5 = slot0.grid_icon_load;

	slot5:addAllList(slot3, function ()
		if uv0 then
			for slot3, slot4 in pairs(uv1.grid_object_list) do
				if slot4.grid_icon then
					slot4.grid_icon:setVisible(false);

					if slot4.grid_data then
						slot4.grid_data.is_hide = 0;
					end
				end
			end

			slot0 = 0;
			slot1 = 0;

			for slot5, slot6 in pairs(uv2) do
				delayRun(uv1.grid_slayer, (slot0 + 1) / 5 / display.DEFAULT_FPS, function ()
					uv0:createOneGridObject(uv1);

					uv2 = uv2 + 1;

					if uv2 == tableLen(uv3) then
						uv0.init_grid_end = true;
					end
				end);
			end

			return
		end

		for slot3, slot4 in pairs(uv2) do
			uv1:createOneGridObject(slot4);
		end
	end);
end

function ActionyearmonsterMainWindow.createOneGridObject(slot0, slot1, slot2)
	if not slot0.grid_object_list[slot1.index] then
		slot4 = {};
	end

	if not slot4.grid_icon then
		slot5 = createImage(slot0.grid_slayer, nil, 0, 0, cc.p(0.5, 0.5), false);

		slot5:ignoreContentAdaptWithSize(true);

		slot4.grid_icon = slot5;
		slot0.grid_object_list[slot3] = slot4;

		uv0(slot0.par_grid_object_list, slot4);
	end

	if slot5 then
		if slot1.is_hide == 1 then
			slot5:setVisible(false);
		else
			slot6 = slot0:getGridPathByResId(slot1.res_id);

			if not slot4.grid_data or slot5.grid_res ~= slot6 then
				slot5.grid_res = slot6;

				slot5:loadTexture(slot6, LOADTEXT_TYPE);
				slot5:setAnchorPoint(cc.p(0.5, 1 - PlanesConst.Grid_Height * 0.5 / slot5:getContentSize().height));
			end

			slot5:setVisible(not slot2);

			slot7, slot8 = PlanesTile.indexPixel(slot1.index);
			slot4.pos_x = slot7;
			slot4.pos_y = slot8;

			slot5:setPosition(slot7, slot8);

			slot9, slot10 = PlanesTile.indexTile(slot3);

			slot5:setLocalZOrder((100 - slot10) * 100 + slot9);
		end
	end

	slot0.cur_grid_data[slot3] = slot1;
	slot4.grid_data = slot1;
end

function ActionyearmonsterMainWindow.showGridEnterAniByIndex(slot0, slot1)
	slot2, slot3 = PlanesTile.indexTile(slot0.cur_role_grid_index);

	for slot7, slot8 in pairs(slot1) do
		if slot0.grid_object_list[slot8] and slot9.grid_icon and slot9.grid_data then
			slot9.grid_icon:setVisible(true);
			slot9.grid_icon:setOpacity(0);

			slot10, slot11 = PlanesTile.indexTile(slot8);
			slot12, slot13 = PlanesTile.indexPixel(slot8);

			slot9.grid_icon:setPositionY(slot13 - 200);
			slot9.grid_icon:runAction(cc.Sequence:create(cc.DelayTime:create(PlanesTile.tileDistance(slot10, slot11, slot2, slot3) / 4 * math.random(5, 10) / 10), cc.Spawn:create(cc.FadeIn:create(0.4), cc.EaseBackOut:create(cc.MoveTo:create(0.4, cc.p(slot12, slot13))))));

			if slot9.grid_data and slot9.grid_data.evtid > 0 and slot0.evt_item_list[slot8] then
				slot20:showEvtEnterAni(slot18);
			end
		end
	end
end

function ActionyearmonsterMainWindow.updateSomeGridData(slot0, slot1)
	if slot1 and next(slot1) ~= nil and slot0.init_grid_end then
		for slot5, slot6 in pairs(slot1) do
			slot0.cur_grid_data[slot6.index] = slot6;
		end

		slot5 = slot1;

		slot0:updateGridList(slot5);

		slot0.redbag_list = {};

		for slot5, slot6 in pairs(slot0.cur_grid_data) do
			if slot6.evtid == ActionyearmonsterConstants.evt_redbag then
				uv0(slot0.redbag_list, slot6);
			end
		end

		slot0:checkLeftShowInfo();
	end
end

function ActionyearmonsterMainWindow.checkShowRoundGrid(slot0, slot1)
	if not slot1 then
		return
	end

	slot2, slot3 = PlanesTile.indexTile(slot1);
	slot9 = PlanesConst.Grid_Round;
	slot5 = {};

	for slot9, slot10 in pairs(PlanesTile.tileRange(slot2, slot3, PlanesConst.Grid_Round, slot9)) do
		if slot10[1] and slot10[2] then
			slot11 = PlanesTile.tileIndex(slot10[1], slot10[2]);
			slot13 = slot0.grid_object_list[slot11];

			if slot0.cur_grid_data[slot11] and slot12.is_hide == 0 and (not slot13 or slot13.grid_data and slot13.grid_data.is_hide == 1) then
				slot0:createOneGridObject(slot12, true);
				uv0(slot5, slot11);
				slot0:createOneEvtItem(PlanesController:getInstance():getModel():getPlanesEvtVoByGridIndex(slot11), true);
			end
		end
	end

	if next(slot5) ~= nil then
		slot0:showGridEnterAniByIndex(slot5);
	end
end

function ActionyearmonsterMainWindow.getGridPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" and slot1 ~= 0 then
		return uv0("resource/planes/grid_icon/%s.png", slot1)
	end
end

function ActionyearmonsterMainWindow.updateEvtList(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if slot0.evt_icon_load then
		slot0.evt_icon_load:DeleteMe();

		slot0.evt_icon_load = nil;
	end

	slot0.evt_icon_load = ResourcesLoad.New();
	slot3 = slot0.evt_icon_load;

	slot3:addAllList(slot0:getEvtResPathListByData(slot1), function ()
		for slot3, slot4 in pairs(uv0.evt_item_list) do
			slot4:setVisible(false);
		end

		slot0 = 0;
		slot1 = 0;

		for slot5, slot6 in pairs(uv1) do
			delayRun(uv0.evt_slayer, (slot0 + 1) / 5 / display.DEFAULT_FPS, function ()
				uv0:createOneEvtItem(uv1);

				uv2 = uv2 + 1;

				if uv2 == tableLen(uv3) then
					uv0.init_evt_end = true;
				end
			end);
		end
	end);
end

function ActionyearmonsterMainWindow.createOneEvtItem(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot0.evt_item_list[slot1.index] then
		slot0.evt_item_list[slot3] = ActionyearmonsterEvtItem.New(slot0.evt_slayer);
	end

	slot4:setData(slot1, slot2);

	slot5, slot6 = PlanesTile.indexPixel(slot3);

	slot4:setPosition(slot5, slot6);

	slot7, slot8 = PlanesTile.indexTile(slot3);

	slot4:setLocalZOrder((100 - slot8) * 100 + slot7);
end

function ActionyearmonsterMainWindow.getEvtResPathListByData(slot0, slot1)
	slot2 = {};
	slot3 = {};

	for slot7, slot8 in pairs(slot1) do
		slot9 = nil;

		if slot8.config.res_1 and slot9[1] and slot9[1] == 1 and not slot3[slot9[2]] then
			uv0(slot2, {
				path = slot0:getEvtPathByResId(slot9[2]),
				type = ResourcesType.single
			});

			slot3[slot9[2]] = true;
		end
	end

	return slot2
end

function ActionyearmonsterMainWindow.addEvtItemList(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if slot0.evt_icon_load then
		slot0.evt_icon_load:DeleteMe();

		slot0.evt_icon_load = nil;
	end

	slot0.evt_icon_load = ResourcesLoad.New();
	slot3 = slot0.evt_icon_load;

	slot3:addAllList(slot0:getEvtResPathListByData(slot1), function ()
		for slot3, slot4 in pairs(uv0) do
			if not uv1.evt_item_list[slot4.index] then
				uv1.evt_item_list[slot4.index] = ActionyearmonsterEvtItem.New(uv1.evt_slayer);
			end

			slot5:setData(slot4);

			slot6, slot7 = PlanesTile.indexPixel(slot4.index);

			slot5:setPosition(slot6, slot7);

			slot8, slot9 = PlanesTile.indexTile(slot4.index);

			slot5:setLocalZOrder((100 - slot9) * 100 + slot8);
		end
	end);
end

function ActionyearmonsterMainWindow.getEvtPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return uv0("resource/planes/evt_icon/%s.png", slot1)
	end
end

function ActionyearmonsterMainWindow.createRole(slot0, slot1)
	if not slot1 then
		slot1 = uv0:getPlanesRoleLookId();
	end

	if not slot0.cur_look_id or slot0.cur_look_id ~= slot1 then
		slot0.cur_look_id = slot1;

		slot0:removeMapRole();

		slot0.map_role = slot0:createRoleById(slot1, nil, slot0.use_title_id, slot0.role_vo.name, true);
	end

	slot2, slot3 = PlanesTile.indexPixel(slot0.cur_role_grid_index);

	slot0.map_role:setPosition(slot2, slot3);
	slot0:updateRoleZOrder();
end

function ActionyearmonsterMainWindow.createOtherTimer(slot0)
	if slot0.other_timer == nil then
		slot1 = GlobalTimeTicket;
		slot1 = slot1:getInstance();
		slot0.other_timer = slot1:add(function ()
			slot0 = 0;

			for slot4, slot5 in pairs(uv0.other_role_list) do
				slot0 = slot0 + 1;
			end

			if slot0 < #uv0.other_role_data then
				uv0:refreshOtherData();
			end
		end, 5);
	end
end

function ActionyearmonsterMainWindow.setOtherRoleFace(slot0, slot1)
	if slot1 then
		slot2, slot8 = PlanesTile.indexTile(slot1);
		slot4 = slot0:getSudokuIndex(slot2, slot8);

		for slot8, slot9 in pairs(slot0.other_role_list) do
			if slot9.data and slot0:isSudokuIndex(slot9.index, slot4) then
				for slot13, slot14 in ipairs(slot9.data.face) do
					if slot14.order == 2 then
						slot0:updateRoleFace(slot9, slot14.face_id);
					end
				end
			end
		end
	else
		for slot5, slot6 in pairs(slot0.other_role_list) do
			if slot6.data then
				for slot10, slot11 in ipairs(slot6.data.face) do
					if slot11.order == 3 then
						slot0:updateRoleFace(slot6, slot11.face_id);
					end
				end
			end
		end
	end
end

function ActionyearmonsterMainWindow.checkOtherLookInfo(slot0)
	if not slot0.cur_role_grid_index then
		return
	end

	if slot0.is_role_moving then
		return
	end

	slot1, slot2 = PlanesTile.indexTile(slot0.cur_role_grid_index);
	slot3 = slot0:getSudokuIndex(slot1, slot2);
	slot4 = {};

	for slot8, slot9 in pairs(slot0.other_role_list) do
		if slot9.data and slot0:isSudokuIndex(slot9.index, slot3) then
			slot4[slot9.key] = true;

			slot0:updateRoleLook(slot9, true);
		end
	end

	for slot8, slot9 in pairs(slot0.other_role_list) do
		if not slot4[slot9.key] then
			slot0:updateRoleLook(slot9, false);
		end
	end
end

function ActionyearmonsterMainWindow.isSudokuIndex(slot0, slot1, slot2)
	if not slot2 then
		return true
	end

	slot3, slot4 = PlanesTile.indexTile(slot1);

	for slot8, slot9 in ipairs(slot2) do
		if slot9.x == slot3 and slot9.y == slot4 then
			return true
		end
	end

	return false
end

function ActionyearmonsterMainWindow.getSudokuIndex(slot0, slot1, slot2, slot3)
	slot4 = {
		{
			x = slot1,
			y = slot2 - 2
		},
		{
			x = slot1 + slot2 % 2,
			y = slot2 - 1
		},
		{
			x = slot1 + 1,
			y = slot2
		},
		{
			x = slot1 - 1 + slot2 % 2,
			y = slot2 - 1
		},
		{
			x = slot1 + slot2 % 2,
			y = slot2 + 1
		},
		{
			x = slot1 - 1,
			y = slot2
		},
		{
			x = slot1 - 1 + slot2 % 2,
			y = slot2 + 1
		},
		{
			x = slot1,
			y = slot2 + 2
		}
	};

	if slot3 then
		return slot4
	end

	slot4[9] = {
		x = slot1,
		y = slot2 - 4
	};
	slot4[10] = {
		x = slot1 + slot2 % 2,
		y = slot2 - 3
	};
	slot4[11] = {
		x = slot1 + 1,
		y = slot2 - 2
	};
	slot4[12] = {
		x = slot1 + 1 + slot2 % 2,
		y = slot2 - 1
	};
	slot4[13] = {
		x = slot1 + 2,
		y = slot2
	};
	slot4[14] = {
		x = slot1 + 1 + slot2 % 2,
		y = slot2 + 1
	};
	slot4[15] = {
		x = slot1 + 1,
		y = slot2 + 2
	};
	slot4[16] = {
		x = slot1 + slot2 % 2,
		y = slot2 + 3
	};
	slot4[17] = {
		x = slot1,
		y = slot2 + 4
	};
	slot4[18] = {
		x = slot1 - 1 + slot2 % 2,
		y = slot2 + 3
	};
	slot4[19] = {
		x = slot1 - 1,
		y = slot2 + 2
	};
	slot4[20] = {
		x = slot1 - 2 + slot2 % 2,
		y = slot2 + 1
	};
	slot4[21] = {
		x = slot1 - 2,
		y = slot2
	};
	slot4[22] = {
		x = slot1 - 2 + slot2 % 2,
		y = slot2 - 1
	};
	slot4[23] = {
		x = slot1 - 1,
		y = slot2 - 2
	};
	slot4[24] = {
		x = slot1 - 1 + slot2 % 2,
		y = slot2 - 3
	};

	return slot4
end

function ActionyearmonsterMainWindow.refreshOtherData(slot0)
	if not slot0.init_grid_end then
		return
	end

	if not slot0.other_role_data then
		return
	end

	if slot0.dic_pos_idnex == nil then
		slot0.dic_pos_idnex = {};
	end

	slot1 = 0;
	slot2 = false;

	for slot6, slot7 in ipairs(slot0.other_role_data) do
		if slot0:checkGridCanWalk(slot0.cur_role_grid_index + (math.random(1, 6) - 3) * 1000 + math.random(1, 6) - 3) and slot0.other_role_list[uv0("%s_%s", slot7.srv_id, slot7.rid)] == nil and slot0.dic_pos_idnex[slot10] == nil then
			slot0.other_role_list[slot11] = slot0:createRoleById(slot7.look_id, slot10, slot7.honor_id, slot7.name);
			slot0.other_role_list[slot11].key = slot11;
			slot0.other_role_list[slot11].data = slot7;
			slot0.other_role_list[slot11].index = slot10;
			slot0.dic_pos_idnex[slot10] = true;
			slot12, slot13 = PlanesTile.indexTile(slot10);

			slot0.other_role_list[slot11]:setLocalZOrder((100 - slot13) * 100 + slot12 + 1);

			slot2 = true;

			if slot1 + 1 > 3 then
				return
			end
		end
	end

	if slot2 then
		slot0:checkOtherLookInfo();
	end
end

function ActionyearmonsterMainWindow.checkGridCanWalk(slot0, slot1)
	if not slot0.init_grid_end then
		return false
	end

	if not slot0.grid_object_list[slot1] then
		return false
	end

	if not uv0:checkIsHaveEvtByGridIndex(slot1) and slot2.grid_data.is_walk == 0 then
		return false
	end

	if not uv0:checkEvtCanWalkByGridIndex(slot1, true) then
		return false
	end

	if uv0:checkIsHaveEvtByGridIndex(slot1) then
		return false
	end

	if uv0:checkYearmonsterGrid(slot1) then
		return false
	end

	return true
end

function ActionyearmonsterMainWindow.createRoleById(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = "H60001";

	if Config.HomeData.data_figure[slot1] then
		slot7 = slot6.look_id;
	end

	slot8 = ccui.Widget:create();
	slot8.role = createEffectSpine(slot7, cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.idle);

	slot8:addChild(slot8.role);
	slot8.role:setScale(1);
	slot8.role:setTimeScale(2);
	slot0.evt_slayer:addChild(slot8);

	if slot2 then
		slot9, slot10 = PlanesTile.indexPixel(slot2);

		slot8:setPosition(slot9, slot10);
	end

	if slot3 then
		slot0:updateHonorInfo(slot8, slot3);
	end

	if slot4 then
		createSprite(PathTool.getResFrame("common", "common_90056"), 0, -19, slot8, cc.p(0.5, 0.5)):setScale(0.5);

		slot8.name = createLabel(18, 1, nil, 0, -28, slot4, slot8, nil, cc.p(0.5, 0));

		if slot5 then
			slot8.name:setTextColor(cc.c4b(255, 219, 76, 255));

			slot12 = createSprite(PathTool.getResFrame("common", "common_1099"), 0, 130, slot8, cc.p(0.5, 0.5));

			slot12:setScaleY(-1.5);
			slot12:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(1, cc.p(0, 150)), cc.MoveTo:create(0.8, cc.p(0, 130)))));
		end
	end

	return slot8
end

function ActionyearmonsterMainWindow.updateHonorInfo(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if Config.HonorData.data_title[slot2] and slot3.res_id and (slot1.record_honor_img == nil or slot1.record_honor_img ~= slot3.res_id) then
		slot1.record_honor_img = slot3.res_id;
		slot4 = PathTool.getPlistImgForDownLoad("honor", "txt_cn_honor_" .. slot3.res_id, false, false);

		if slot1.honor_img == nil then
			slot1.honor_img = createSprite(nil, 0, 112, slot1, cc.p(0.5, 0.5));

			slot1.honor_img:setScale(0.8);
		end

		slot1.item_load_title = loadSpriteTextureFromCDN(slot1.honor_img, slot4, ResourcesType.single, slot1.item_load_title);
	end
end

function ActionyearmonsterMainWindow.updateRoleFace(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if Config.ArenaEliteData.data_face[slot2] and slot1.face_bg == nil then
		slot1.face_bg = createImage(slot1, PathTool.getResFrame("actionyearmonster", "txt_cn_actionyearmonster_23"), 0, 120, cc.p(0.5, 0.5), true, nil, true);

		slot1.face_bg:setCapInsets(cc.rect(17, 18, 1, 4));
		slot1.face_bg:setContentSize(cc.size(143, 65));
		slot1.face_bg:setCascadeOpacityEnabled(true);

		slot1.face_spine = createEffectSpine(slot3.msg, cc.p(29, 39), cc.p(0.5, 0.5), false, PlayerAction.action);

		slot1.face_spine:setScale(0.5);
		slot1.face_bg:addChild(slot1.face_spine);

		if not slot3.text then
			slot5 = TI18N("恭喜发财");
		end

		slot1.face_text = createLabel(20, cc.c4b(100, 50, 35, 255), nil, 90, 37, slot5, slot1.face_bg, nil, cc.p(0.5, 0.5));

		if slot1.honor_img ~= nil then
			slot1.honor_img:runAction(cc.FadeOut:create(0.3));
		end

		if slot1.look_img ~= nil and slot1.look_img:isVisible() then
			slot1.look_img:runAction(cc.FadeOut:create(0.3));
		end

		slot6 = slot1.face_bg;

		slot6:setOpacity(0);

		slot6 = cc.FadeIn;
		slot7 = cc.DelayTime;
		slot8 = cc.FadeOut;
		slot9 = slot1.face_bg;
		slot12 = cc.Sequence;
		slot18 = cc.CallFunc;

		slot9:runAction(slot12:create(slot6:create(0.5), slot7:create(2), slot8:create(0.7), slot18:create(function ()
			uv0.face_spine:clearTracks();
			uv0.face_spine:removeFromParent();

			uv0.face_spine = nil;

			uv0.face_bg:stopAllActions();
			uv0.face_bg:removeFromParent();

			uv0.face_bg = nil;

			if uv0.honor_img ~= nil then
				uv0.honor_img:runAction(cc.FadeIn:create(0.3));
			end

			if uv0.look_img ~= nil and uv0.look_img:isVisible() then
				uv0.look_img:runAction(cc.FadeIn:create(0.3));
			end
		end)));
	end
end

function ActionyearmonsterMainWindow.updateRoleLook(slot0, slot1, slot2)
	if slot2 then
		if slot1.look_img == nil then
			slot1.look_img = createSprite(PathTool.getResFrame("actionyearmonster", "actionyearmonster_17"), 0, 152, slot1, cc.p(0.5, 0.5));
			slot4 = slot1.look_img;

			slot4:setCascadeOpacityEnabled(true);

			slot4 = ccui.Layout;
			slot1.look_btn = slot4:create();
			slot4 = slot1.look_btn;

			slot4:setCascadeOpacityEnabled(true);

			slot4 = cc.size(50, 50);
			slot5 = slot1.look_btn;

			slot5:setContentSize(slot4);

			slot5 = slot1.look_btn;

			slot5:setTouchEnabled(true);

			slot5 = slot1.look_btn;

			slot5:setSwallowTouches(true);

			slot5 = slot1.look_btn;

			slot5:setPosition(4, 12);

			slot5 = slot1.look_img;

			slot5:addChild(slot1.look_btn);

			slot5 = createSprite(PathTool.getResFrame("common", "common_1093"), slot4.width * 0.5, slot4.height * 0.5, slot1.look_btn, cc.p(0.5, 0.5));

			registerButtonEventListener(slot1.look_btn, function ()
				uv0:onLookPlayerInfo(uv1);
			end, true, 2);
		else
			if slot1.look_img:isVisible() then
				return
			end

			slot1.look_img:setVisible(true);
		end

		slot1.look_img:setOpacity(0);
		slot1.look_img:runAction(cc.FadeIn:create(0.3));
	elseif slot1.look_img then
		if not slot1.look_img:isVisible() then
			return
		end

		slot3 = slot1.look_img;
		slot6 = cc.Sequence;
		slot9 = cc.FadeOut;
		slot10 = cc.CallFunc;

		slot3:runAction(slot6:create(slot9:create(0.3), slot10:create(function ()
			uv0.look_img:setVisible(false);
		end)));
	end
end

function ActionyearmonsterMainWindow.onLookPlayerInfo(slot0, slot1)
	if slot1.data and slot1.data.rid and slot1.data.srv_id and slot1.data.srv_id ~= "" and slot1.data.rid ~= "" then
		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot1.data.srv_id,
			rid = slot1.data.rid
		});
	end
end

function ActionyearmonsterMainWindow.updateRoleZOrder(slot0)
	if not slot0.cur_role_grid_index then
		return
	end

	slot1, slot2 = PlanesTile.indexTile(slot0.cur_role_grid_index);

	slot0.map_role:setLocalZOrder((100 - slot2) * 100 + slot1 + 1);
end

function ActionyearmonsterMainWindow.removeMapRole(slot0)
	if slot0.map_role then
		slot0.map_role.role:clearTracks();

		if slot0.map_role.face_spine then
			slot0.map_role.face_spine:clearTracks();
			slot0.map_role.face_spine:removeFromParent();

			slot0.map_role.face_spine = nil;
		end

		if slot0.map_role.item_load_title then
			slot0.map_role.item_load_title:DeleteMe();

			slot0.map_role.item_load_title = nil;
		end

		slot0.map_role.role:removeFromParent();
		slot0.map_role:removeFromParent();

		slot0.map_role = nil;
	end
end

function ActionyearmonsterMainWindow.getYearMosterBestIndex(slot0, slot1)
	slot2, slot3 = PlanesTile.indexTile(slot0.cur_role_grid_index);
	slot4 = cc.p(slot2, slot3);
	slot5, slot6 = PlanesTile.indexTile(slot1);
	slot12 = true;
	slot8 = false;

	for slot12, slot13 in ipairs(slot0:getSudokuIndex(slot5, slot6, slot12)) do
		if PlanesTile.astar(slot4, slot13, slot0.cur_block_cfg) ~= nil and slot14 ~= false then
			if not slot8 then
				slot8 = slot14;
			elseif slot14.n < slot8.n then
				slot8 = slot14;
			end
		end
	end

	return slot8
end

function ActionyearmonsterMainWindow.onClickGridIconByIndex(slot0, slot1)
	if not slot0.grid_object_list[slot1] then
		return
	end

	if slot2.grid_icon then
		if slot1 ~= 9020 and slot1 ~= 8019 and slot1 ~= 9018 and slot1 ~= 9019 and slot1 ~= 14012 and slot1 ~= 13011 and slot1 ~= 14010 and slot1 ~= 14011 then
			if not slot2.pos_x then
				slot3 = 0;
			end

			if not slot2.pos_y then
				slot4 = 0;
			end

			slot2.grid_icon:stopAllActions();
			slot2.grid_icon:setPosition(slot3, slot4);
			slot2.grid_icon:runAction(cc.Sequence:create(cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(0.1, cc.p(slot3, slot4 + 20))), cc.ScaleTo:create(0.1, 1.2)), cc.Spawn:create(cc.EaseBackOut:create(cc.MoveTo:create(0.1, cc.p(slot3, slot4))), cc.ScaleTo:create(0.1, 0.9)), cc.ScaleTo:create(0.05, 1)));

			if slot0.evt_item_list[slot1] then
				slot9:showClickAni();
			end
		end

		playButtonSound2();
	end

	if not slot0.init_grid_end then
		return
	end

	if slot0.cur_role_grid_index == slot1 then
		return
	end

	if not slot2.grid_data or slot2.grid_data.is_hide == 1 then
		return
	end

	if not uv0:checkIsHaveEvtByGridIndex(slot1) and slot2.grid_data.is_walk == 0 then
		message(TI18N("目标点为不可行走区域，请选择其他目标点"));

		return
	end

	slot3 = nil;

	if not slot0.is_role_moving then
		slot4 = uv0:getYearMonsterList();

		if uv0:checkLimitYearmonsterGrid(slot1) and slot4[1] then
			slot3 = slot0:getYearMosterBestIndex(slot4[1].index);

			if slot0.evt_item_list[slot4[1].index] then
				slot5:showClickAni();
			end
		elseif uv0:checkGoldYearmonsterGrid(slot1) and slot4[2] then
			slot3 = slot0:getYearMosterBestIndex(slot4[2].index);

			if slot0.evt_item_list[slot4[2].index] then
				slot5:showClickAni();
			end
		end
	end

	if not uv0:checkEvtCanWalkByGridIndex(slot1, true) then
		message(TI18N("目标点为不可行走区域，请选择其他目标点"));

		return
	end

	if slot0.is_role_moving then
		slot0.target_grid_index = nil;
		slot0.role_move_grid_cache = {};

		return
	end

	if slot3 == nil then
		slot4, slot5 = PlanesTile.indexTile(slot0.cur_role_grid_index);
		slot7, slot8 = PlanesTile.indexTile(slot1);
		slot3 = PlanesTile.astar(cc.p(slot4, slot5), cc.p(slot7, slot8), slot0.cur_block_cfg);
	end

	if not slot3 then
		message(TI18N("前往路径上有障碍噢~"));

		return
	end

	slot0.role_move_grid_cache = {};

	while slot3 do
		if PlanesTile.tileIndex(slot3.x, slot3.y) ~= slot0.cur_role_grid_index then
			uv1(slot0.role_move_grid_cache, 1, slot6);
		end

		slot3 = slot3.parent;
	end

	if uv0:checkIsNeedStopPreGrid(slot1) then
		slot0.target_grid_index = uv2(slot0.role_move_grid_cache, #slot0.role_move_grid_cache);
	end

	if next(slot0.role_move_grid_cache) ~= nil and slot0.role_move_grid_cache[#slot0.role_move_grid_cache] then
		slot5, slot6 = PlanesTile.indexPixel(slot4);

		slot0:handlerTargetEffect(true, slot5, slot6);
	end

	slot0.stop_center_flag = false;

	slot0:showMoveRoute();
	slot0:doNextRoleMove();
end

function ActionyearmonsterMainWindow.showMoveRoute(slot0)
	if not slot0.role_move_grid_cache or next(slot0.role_move_grid_cache) == nil then
		return
	end

	slot1 = {};

	for slot5, slot6 in ipairs(slot0.role_move_grid_cache) do
		slot7 = {
			dir = 1
		};
		slot8, slot9 = PlanesTile.indexPixel(slot6);

		if slot0.role_move_grid_cache[slot5 + 1] then
			slot11, slot12 = PlanesTile.indexPixel(slot10);

			if slot8 < slot11 and slot9 < slot12 then
				slot7.dir = 1;
			elseif slot8 < slot11 and slot12 < slot9 then
				slot7.dir = 2;
			elseif slot11 < slot8 and slot12 < slot9 then
				slot7.dir = 3;
			elseif slot11 < slot8 and slot9 < slot12 then
				slot7.dir = 4;
			end

			slot7.pos_x = slot8;
			slot7.pos_y = slot9;
			slot7.grid_index = slot6;

			uv0(slot1, slot7);
		end
	end

	for slot5, slot6 in pairs(slot0.route_effect_list) do
		if slot6.effect then
			slot6.effect:setVisible(false);
		end
	end

	for slot5, slot6 in ipairs(slot1) do
		if not slot0.route_effect_list[slot5] or next(slot7) == nil then
			slot7 = {
				effect = createEffectSpine(Config.EffectData.data_effect_info[1505], cc.p(slot6.pos_x, slot6.pos_y), cc.p(0.5, 0.5), true, PlayerAction.action)
			};

			slot0.evt_slayer:addChild(slot7.effect, 999);

			slot0.route_effect_list[slot5] = slot7;
		else
			slot7.effect:setToSetupPose();
			slot7.effect:setPosition(slot6.pos_x, slot6.pos_y);
			slot7.effect:setAnimation(0, PlayerAction.action, true);
		end

		slot7.effect:setVisible(true);
		slot7.effect:setScale(1);

		if slot6.dir == 1 then
			slot7.effect:setScale(-1);
		elseif slot6.dir == 2 then
			slot7.effect:setScaleX(-1);
		elseif slot6.dir == 3 then
			slot7.effect:setScale(1);
		elseif slot6.dir == 4 then
			slot7.effect:setScaleY(-1);
		end

		slot7.grid_index = slot6.grid_index;
	end
end

function ActionyearmonsterMainWindow.handlerTargetEffect(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if not tolua.isnull(slot0.evt_slayer) and slot0.target_effect == nil then
			slot0.target_effect = createEffectSpine(Config.EffectData.data_effect_info[1504], cc.p(slot2, slot3), cc.p(0.5, 0.5), true, PlayerAction.action_2);

			slot0.evt_slayer:addChild(slot0.target_effect, 99999);
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

function ActionyearmonsterMainWindow.showBreakEffect(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot0.evt_item_list[slot6] then
			slot7:setVisible(false);
		end

		if slot0.grid_object_list[slot6] and slot8.grid_icon then
			slot8.grid_icon:setVisible(false);
		end

		if not slot0.break_effect_list[slot5] then
			slot9 = createEffectSpine(Config.EffectData.data_effect_info[1705], cc.p(0, 0), cc.p(0.5, 0.75), false, PlayerAction.action, handler(slot0, slot0.onBreakAniEnd));

			slot0.grid_slayer:addChild(slot9);

			slot0.break_effect_list[slot5] = slot9;
		else
			slot9:setVisible(true);
			slot9:setToSetupPose();
			slot9:setAnimation(0, PlayerAction.action, false);
		end

		slot10, slot11 = PlanesTile.indexPixel(slot6);

		slot9:setPosition(slot10, slot11);

		slot12, slot13 = PlanesTile.indexTile(slot6);

		slot9:setLocalZOrder((100 - slot13) * 100 + slot12);
	end
end

function ActionyearmonsterMainWindow.onBreakAniEnd(slot0)
	for slot4, slot5 in pairs(slot0.break_effect_list) do
		slot5:setVisible(false);
	end
end

function ActionyearmonsterMainWindow.isLockPlanesMapScreen(slot0, slot1)
	if slot1 == true then
		if not slot0.lock_mask then
			slot2 = slot0.ui_container:getContentSize();
			slot0.lock_mask = ccui.Layout:create();

			slot0.lock_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT);
			slot0.lock_mask:setAnchorPoint(cc.p(0.5, 0.5));
			slot0.lock_mask:setScale(display.getMaxScale());
			slot0.lock_mask:setPosition(slot2.width * 0.5, slot2.height * 0.5);
			slot0.lock_mask:setTouchEnabled(true);
			slot0.lock_mask:setSwallowTouches(true);
			slot0.ui_container:addChild(slot0.lock_mask, 10);
		end

		slot0.lock_mask:setVisible(true);
	elseif slot0.lock_mask then
		slot0.lock_mask:setVisible(false);
	end
end

function ActionyearmonsterMainWindow.doNextRoleMove(slot0)
	if not uv0(slot0.role_move_grid_cache, 1) then
		slot0:doRoleStopMove();

		return
	end

	if not slot0.stop_center_flag then
		slot0:moveMapToRoleCenter();
	end

	uv1:sender28202(slot1);
	slot0:moveRoleByGrid(slot1);
end

function ActionyearmonsterMainWindow.moveRoleByGrid(slot0, slot1)
	if not slot0.map_role then
		return
	end

	slot2, slot3 = PlanesTile.indexTile(slot1);
	slot0.cur_role_grid_index = slot1;
	slot0.is_role_moving = true;

	slot0:openMapMoveTimer(false);

	slot4, slot5 = slot0.map_role:getPosition();
	slot6, slot0.move_target_pos_y = PlanesTile.indexPixel(slot1);
	slot0.move_target_pos_x = slot6;

	if slot4 < slot6 then
		slot0.map_role.role:setScaleX(0.4);
	else
		slot0.map_role.role:setScaleX(-0.4);
	end

	for slot11, slot12 in pairs(slot0.route_effect_list) do
		if slot12.grid_index == slot1 then
			if slot12.effect then
				slot13 = slot12.effect;
				slot16 = cc.Sequence;
				slot19 = cc.DelayTime;
				slot20 = cc.CallFunc;

				slot13:runAction(slot16:create(slot19:create(0.5), slot20:create(function ()
					uv0.effect:setVisible(false);
				end)));
			end

			break
		end
	end

	slot9 = math.sqrt(math.pow(slot6 - slot4, 2) + math.pow(slot7 - slot5, 2)) / ActionyearmonsterConstants.Move_Speed;

	if not slot0.cur_role_action or slot0.cur_role_action ~= PlayerAction.move then
		slot0.cur_role_action = PlayerAction.move;

		slot0.map_role.role:setToSetupPose();
		slot0.map_role.role:setAnimation(0, PlayerAction.move, true);
	end

	slot0.map_role:runAction(cc.Sequence:create(cc.MoveTo:create(slot9, cc.p(slot6, slot7)), cc.CallFunc:create(function ()
		uv0:doNextRoleMove();
	end)));
	slot0:updateRoleZOrder();

	if not slot0.stop_center_flag then
		slot10, slot11 = slot0.map_container:getPosition();
		slot12 = slot10 - (slot6 - slot4);
		slot13 = slot11 - (slot7 - slot5);
		slot0.map_move_state = slot0:checkMapIsCanMove();

		if slot0.map_move_state ~= 0 then
			slot12, slot13 = slot0:checkMapSafePos(slot12, slot13);

			if slot0.map_move_state == 1 then
				slot13 = slot11;

				slot0:openMapMoveTimer(true);
			elseif slot0.map_move_state == 2 then
				slot12 = slot10;

				slot0:openMapMoveTimer(true);
			end

			slot0.map_container:runAction(cc.MoveTo:create(math.sqrt(math.pow(slot12 - slot10, 2) + math.pow(slot13 - slot11, 2)) / ActionyearmonsterConstants.Move_Speed, cc.p(slot12, slot13)));
		end

		if slot0.map_move_state ~= 3 then
			slot0:openMapMoveTimer(true);
		end
	end
end

function ActionyearmonsterMainWindow.moveMapToRoleCenter(slot0)
	slot1, slot2 = slot0:getMapPosOfRoleCenter();

	slot0.map_container:runAction(cc.MoveTo:create(0.3, cc.p(slot1, slot2)));
end

function ActionyearmonsterMainWindow.getMapPosOfRoleCenter(slot0)
	slot1 = 0;
	slot2 = 0;

	if slot0.map_role then
		slot3, slot4 = slot0.map_role:getPosition();

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

	return slot0:checkMapSafePos(slot1, slot2)
end

function ActionyearmonsterMainWindow.checkMapIsCanMove(slot0)
	slot1 = 0;

	if not slot0.map_role then
		return slot1
	end

	slot2, slot3 = slot0.map_role:getPosition();

	if slot2 >= SCREEN_WIDTH * 0.5 and slot2 <= slot0.cur_map_width - SCREEN_WIDTH * 0.5 then
		slot1 = 1;
	end

	if slot3 >= display.height * 0.5 and slot3 <= slot0.cur_map_height - display.height * 0.5 then
		if slot1 > 0 then
			slot1 = 3;
		else
			slot1 = 2;
		end
	end

	return slot1
end

function ActionyearmonsterMainWindow.openMapMoveTimer(slot0, slot1)
	if slot1 == true then
		if not slot0.map_move_timer then
			slot2 = GlobalTimeTicket;
			slot2 = slot2:getInstance();
			slot0.map_move_timer = slot2:add(function ()
				if uv0:checkMapIsCanMove() ~= uv0.map_move_state then
					uv0.map_move_state = slot0;

					if uv0.move_target_pos_x and uv0.move_target_pos_y then
						slot1, slot2 = uv0.map_role:getPosition();
						slot3, slot4 = uv0.map_container:getPosition();
						slot5, slot6 = uv0:checkMapSafePos(slot3 - (uv0.move_target_pos_x - slot1), slot4 - (uv0.move_target_pos_y - slot2));

						if slot0 == 1 then
							slot6 = slot4;
						elseif slot0 == 2 then
							slot5 = slot3;
						end

						uv0.map_container:runAction(cc.MoveTo:create(math.sqrt(math.pow(slot5 - slot3, 2) + math.pow(slot6 - slot4, 2)) / ActionyearmonsterConstants.Move_Speed, cc.p(slot5, slot6)));
					end
				end
			end, 0.1);
		end
	elseif slot0.map_move_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.map_move_timer);

		slot0.map_move_timer = nil;
	end
end

function ActionyearmonsterMainWindow.checkBuoyMoveTimer(slot0, slot1)
	if slot1 then
		slot0.buoy_map_x, slot0.buoy_map_y = slot0.map_container:getPosition();

		if uv0:getYearMonsterList()[1] then
			slot0.buoy_1:setVisible(true);
		end

		if slot2[2] then
			slot0.buoy_2:setVisible(true);
		end

		if not slot0.buoy_move_timer then
			slot3 = GlobalTimeTicket;
			slot3 = slot3:getInstance();
			slot0.buoy_move_timer = slot3:add(function ()
				if not tolua.isnull(uv0.map_container) then
					slot0, slot1 = uv0.map_container:getPosition();

					if uv1(uv0.buoy_map_x - slot0) > 2 or uv1(uv0.buoy_map_y - slot1) > 2 then
						uv0.buoy_map_x = slot0;
						uv0.buoy_map_y = slot1;

						if uv2:getYearMonsterList()[1] then
							uv0:updateBuoyByIndex(slot2[1].index, uv0.buoy_1, uv0.buoy_1_img);
						end

						if slot2[2] then
							uv0:updateBuoyByIndex(slot2[2].index, uv0.buoy_2, uv0.buoy_2_img);
						end
					end
				end
			end, 0.02);
		end
	elseif slot0.buoy_move_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buoy_move_timer);

		slot0.buoy_move_timer = nil;
	end
end

function ActionyearmonsterMainWindow.updateBuoyByIndex(slot0, slot1, slot2, slot3)
	if not slot2 then
		return
	end

	slot4, slot5 = PlanesTile.indexPixel(slot1);

	if slot0:checkBoxPos(slot4 + slot0.buoy_map_x, slot5 + slot0.buoy_map_y) then
		slot2:setVisible(false);
	else
		slot11 = true;

		slot2:setVisible(slot11);

		for slot11, slot12 in ipairs(slot0.buoy_line) do
			slot13, slot14 = slot0:getPosByPos12(slot12.pos_1.x, slot12.pos_1.y, slot12.pos_2.x, slot12.pos_2.y, slot0.center_pos_x, slot0.center_pos_y, slot6, slot7);

			if slot13 and slot14 then
				slot15 = -math.deg(math.atan((slot7 - slot0.center_pos_y) / (slot6 - slot0.center_pos_x)));

				slot2:setPosition(slot13, slot14);

				if slot0.center_pos_x < slot6 then
					slot2:setRotation(slot15);
					slot3:setRotation(-slot15);

					break
				end

				slot2:setRotation(slot15 + 180);
				slot3:setRotation(-(slot15 + 180));

				break
			end
		end
	end
end

function ActionyearmonsterMainWindow.getPosByPos12(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot9 = (slot4 - slot2) * slot1 + (slot1 - slot3) * slot2;
	slot10 = (slot8 - slot6) * slot5 + (slot5 - slot7) * slot6;
	slot11 = (slot3 - slot1) * (slot8 - slot6) - (slot7 - slot5) * (slot4 - slot2);
	slot14 = (slot10 * (slot3 - slot1) - slot9 * (slot7 - slot5)) / slot11;
	slot15 = (slot10 * (slot4 - slot2) - slot9 * (slot8 - slot6)) / slot11;

	if slot3 < slot1 then
		slot1 = slot3;
		slot3 = slot1;
	end

	if slot4 < slot2 then
		slot2 = slot4;
		slot4 = slot2;
	end

	if slot1 <= slot14 and slot14 <= slot3 and slot2 <= slot15 and slot15 <= slot4 then
		if slot1 == slot3 then
			if slot8 < slot6 and slot15 < slot6 then
				return slot14, slot15
			elseif slot6 < slot8 and slot6 < slot15 then
				return slot14, slot15
			end
		elseif slot2 == slot4 then
			if slot7 < slot5 and slot14 < slot5 then
				return slot14, slot15
			elseif slot5 < slot7 and slot5 < slot14 then
				return slot14, slot15
			end
		end
	end
end

function ActionyearmonsterMainWindow.checkBoxPos(slot0, slot1, slot2)
	if slot0.box_x1 <= slot1 and slot1 <= slot0.box_x2 and slot0.box_y1 <= slot2 and slot2 <= slot0.box_y2 then
		return true
	end

	return false
end

function ActionyearmonsterMainWindow.doRoleStopMove(slot0)
	slot0:openMapMoveTimer(false);
	slot0:handlerTargetEffect(false);
	slot0.map_role:stopAllActions();
	slot0.map_role.role:setToSetupPose();

	slot4 = 0;
	slot5 = PlayerAction.idle;

	slot0.map_role.role:setAnimation(slot4, slot5, true);

	slot0.cur_role_action = PlayerAction.idle;
	slot0.is_role_moving = false;
	slot0.role_move_grid_cache = {};

	for slot4, slot5 in pairs(slot0.route_effect_list) do
		if slot5.effect then
			slot5.effect:stopAllActions();
			slot5.effect:setVisible(false);
		end
	end

	slot0:checkProceedGridEvt();
	slot0:checkOtherLookInfo();
end

function ActionyearmonsterMainWindow.checkProceedGridEvt(slot0)
	if slot0.target_grid_index then
		if uv0:getYearEvtVoByGridIndex(slot0.target_grid_index) and slot1.config then
			uv1:onHandleYearEvtById(slot1.config.type, slot1.index);
		end

		slot0.target_grid_index = nil;
	end
end

function ActionyearmonsterMainWindow.playCloudEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.ui_container) and slot0.cloud_effect == nil then
			slot0.cloud_effect = createEffectSpine(Config.EffectData.data_effect_info[157], cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1);

			slot0.cloud_effect:setScale(display.getMaxScale());
			slot0.ui_container:addChild(slot0.cloud_effect, 99);
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

function ActionyearmonsterMainWindow.showBuffItemMoveAni(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if not Config.SecretDunData.data_buff[slot1] then
		return
	end

	if slot0.move_buff_item then
		slot0.move_buff_item:DeleteMe();

		slot0.move_buff_item = nil;
	end

	slot0.move_buff_item = PlanesBuffItem.new();
	slot4 = slot0.move_buff_item;

	slot4:setAnchorPoint(cc.p(0.5, 0.5));

	slot4 = slot0.move_buff_item;

	slot4:setData(slot3);

	slot4 = slot0.ui_container;
	slot4 = slot4:convertToNodeSpace(slot2);
	slot5 = slot0.move_buff_item;
	slot5 = slot5:getContentSize();
	slot6 = slot0.move_buff_item;

	slot6:setPosition(cc.p(slot4.x + slot5.width * 0.5, slot4.y + slot5.height * 0.5));

	slot6 = slot0.ui_container;

	slot6:addChild(slot0.move_buff_item);

	slot6 = slot0.buff_btn;
	slot6, slot7 = slot6:getPosition();
	slot8 = cc.MoveTo;
	slot9 = cc.RotateTo;
	slot10 = cc.ScaleTo;
	slot12 = slot0.move_buff_item;
	slot15 = cc.Sequence;
	slot18 = cc.Spawn;
	slot19 = cc.CallFunc;

	slot12:runAction(slot15:create(slot18:create(slot8:create(0.7, cc.p(slot6, slot7)), slot9:create(0.4, -30), slot10:create(0.7, 0.2)), slot19:create(function ()
		uv0.move_buff_item:DeleteMe();

		uv0.move_buff_item = nil;
	end)));
end

function ActionyearmonsterMainWindow.showFiveEffect(slot0, slot1, slot2)
	slot0.five_effect_container:setVisible(slot1);

	if slot1 then
		playOtherSound("c_petard");
		playEffectOnce(PathTool.getEffectRes(1752), 0, 0, slot0.five_effect_container, function ()
			uv0.touchFive = false;

			if uv1 then
				slot0 = {};

				for slot4, slot5 in pairs(uv1.reward) do
					uv2(slot0, {
						bid = slot5.base_id,
						num = slot5.num
					});
				end

				MainuiController:getInstance():openGetItemView(true, slot0, nil, {
					is_backpack = true
				});
			end
		end, nil, nil, nil, PlayerAction.action, 1);
	end
end

function ActionyearmonsterMainWindow.showRedBagEffect(slot0)
	playEffectOnce("E27701", 0, 0, slot0.ui_container, nil, nil, nil, nil, PlayerAction.action, 1);
end

function ActionyearmonsterMainWindow.close_callback(slot0)
	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event);

		slot0.role_assets_event = nil;
	end

	for slot4, slot5 in pairs(slot0.route_effect_list) do
		if slot5.effect then
			slot5.effect:stopAllActions();
			slot5.effect:clearTracks();
			slot5.effect:removeFromParent();

			slot5.effect = nil;
		end
	end

	for slot4, slot5 in pairs(slot0.break_effect_list) do
		slot5:clearTracks();
		slot5:removeFromParent();

		slot5 = nil;
	end

	slot0:openMapMoveTimer(false);
	slot0:checkBuoyMoveTimer(false);
	slot0:playCloudEffect(false);
	slot0:handlerTargetEffect(false);
	slot0:showFiveEffect(false);

	if slot0.move_buff_item then
		slot0.move_buff_item:DeleteMe();

		slot0.move_buff_item = nil;
	end

	if slot0.grid_icon_load then
		slot0.grid_icon_load:DeleteMe();

		slot0.grid_icon_load = nil;
	end

	if slot0.evt_icon_load then
		slot0.evt_icon_load:DeleteMe();

		slot0.evt_icon_load = nil;
	end

	if slot0.bg_img_load then
		slot0.bg_img_load:DeleteMe();

		slot0.bg_img_load = nil;
	end

	for slot4, slot5 in pairs(slot0.evt_item_list) do
		slot5:DeleteMe();

		slot5 = nil;
	end

	if slot0.other_role_list then
		for slot4, slot5 in pairs(slot0.other_role_list) do
			slot5.role:clearTracks();

			if slot5.face_spine then
				slot5.face_spine:clearTracks();
				slot5.face_spine:removeFromParent();

				slot5.face_spine = nil;
			end

			if slot5.item_load_title then
				slot5.item_load_title:DeleteMe();

				slot5.item_load_title = nil;
			end

			slot5.role:removeFromParent();
			slot5:removeFromParent();
		end

		slot0.other_role_list = {};
	end

	if slot0.other_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.other_timer);

		slot0.other_timer = nil;
	end

	slot0:removeMapRole();
	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, "s_002", true);
	MainuiController:getInstance():setIsShowMainUIBottom(true);
	uv0:openActionyearmonsterMainWindow(false);
end
