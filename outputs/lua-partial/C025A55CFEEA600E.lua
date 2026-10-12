slot1 = PlanesController:getInstance():getModel();
slot2 = string.format;
slot3 = table.insert;
slot4 = table.remove;
slot5 = table.sort;
slot6 = PlanesMapWindow or BaseClass(BaseView);
PlanesMapWindow = slot6;

function PlanesMapWindow.__init(slot0)
	slot0.is_full_screen = true;
	slot0.win_type = WinType.Full;
	slot0.view_tag = ViewMgrTag.WIN_TAG;
	slot0.layout_name = "planes/planes_map_window";
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_map"),
			type = ResourcesType.plist
		}
	};

	slot0:initConfig();
end

function PlanesMapWindow.initConfig(slot0)
	slot0.cur_role_grid_index = 0;
	slot0.is_role_moving = false;
	slot0.grid_object_list = {};
	slot0.par_grid_object_list = {};
	slot0.evt_item_list = {};
	slot0.role_move_grid_cache = {};
	slot0.is_hide_top = false;
	slot0.route_effect_list = {};
	slot0.break_effect_list = {};
	slot0.cur_map_width = PlanesConst.Map_Width;
	slot0.cur_map_height = PlanesConst.Map_Height;
end

function PlanesMapWindow.open_callback(slot0)
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

	slot0.close_btn:getChildByName("label"):setString(TI18N("返回"));

	slot0.dun_btn = slot0.ui_container:getChildByName("dun_btn");

	slot0.dun_btn:getChildByName("label"):setString(TI18N("副本信息"));

	slot0.figure_btn = slot0.ui_container:getChildByName("figure_btn");

	slot0.figure_btn:getChildByName("label"):setString(TI18N("更换形象"));
	slot0.figure_btn:setVisible(false);

	if not uv0:getPlanesRoleLookId() or slot1 == 0 then
		setChildUnEnabled(true, slot0.figure_btn);
	else
		setChildUnEnabled(false, slot0.figure_btn);
	end

	slot0.btn_rule = slot0.ui_container:getChildByName("btn_rule");
	slot0.btn_hide = slot0.ui_container:getChildByName("btn_hide");
	slot0.bottom_panel = slot0.ui_container:getChildByName("bottom_panel");
	slot0.bag_btn = slot0.bottom_panel:getChildByName("bag_btn");
	slot0.hero_btn = slot0.bottom_panel:getChildByName("hero_btn");
	slot0.buff_btn = slot0.bottom_panel:getChildByName("buff_btn");
	slot0.chapter_panel = slot0.ui_container:getChildByName("chapter_panel");

	slot0.chapter_panel:setVisible(false);

	slot0.chapter_name_txt = slot0.chapter_panel:getChildByName("chapter_name_txt");
	slot0.chapter_desc_txt = slot0.chapter_panel:getChildByName("chapter_desc_txt");
	slot0.top_title_bg = slot0.ui_container:getChildByName("top_title_bg");
	slot0.floor_txt = slot0.top_title_bg:getChildByName("floor_txt");
	slot4 = display.getTop();
	slot5 = display.getBottom();

	slot0.bottom_panel:setPositionY(slot5 + 79);
	slot0.close_btn:setPositionY(slot4 - 140);
	slot0.dun_btn:setPositionY(slot4 - 245);
	slot0.figure_btn:setPositionY(slot4 - 350);
	slot0.btn_rule:setPositionY(slot4 - 160);
	slot0.btn_hide:setPositionY(slot4 - 230);
	slot0.ui_container:getChildByName("shadow_bg_1"):setPositionY(slot5);
	slot0.ui_container:getChildByName("shadow_bg_2"):setPositionY(slot4);
	slot0.top_title_bg:setPositionY(slot4);
	MainuiController:getInstance():setIsShowMainUIBottom(false);
end

function PlanesMapWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2);
	registerButtonEventListener(slot0.dun_btn, handler(slot0, slot0.onClickDunBtn), true);
	registerButtonEventListener(slot0.btn_hide, handler(slot0, slot0.onClickHideBtn), true);
	registerButtonEventListener(slot0.bag_btn, handler(slot0, slot0.onClickBagBtn), true);
	registerButtonEventListener(slot0.hero_btn, handler(slot0, slot0.onClickHeroBtn), true);
	registerButtonEventListener(slot0.buff_btn, handler(slot0, slot0.onClickBuffBtn), true);
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true);
	registerButtonEventListener(slot0.figure_btn, handler(slot0, slot0.onClickFigureBtn), true);

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

			if uv0.touch_began_pos and slot2 and math.abs(slot2.x - uv0.touch_began_pos.x) <= 20 and math.abs(slot2.y - uv0.touch_began_pos.y) <= 20 then
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
	slot0:addGlobalEvent(PlanesEvent.Update_Map_Data_Event, function (slot0)
		uv0:setData(slot0);
	end);
	slot0:addGlobalEvent(PlanesEvent.Update_Grid_Event, function (slot0)
		if slot0 then
			uv0:updateSomeGridData(slot0);
		end
	end);
	slot0:addGlobalEvent(PlanesEvent.Add_Evt_Data_Event, function (slot0)
		if uv0.init_evt_end and slot0 then
			uv0:addEvtItemList(slot0);
		end
	end);
	slot0:addGlobalEvent(PlanesEvent.Update_Role_Grid_Event, function (slot0)
		if slot0 and slot0.code == 0 then
			uv0:doRoleStopMove();
		end
	end);
	slot0:addGlobalEvent(PlanesEvent.Chose_Buff_Event, function (slot0, slot1)
		uv0:showBuffItemMoveAni(slot0, slot1);
	end);
	slot0:addGlobalEvent(PlanesEvent.Show_Break_Effect_Event, function (slot0)
		uv0:showBreakEffect(slot0);
	end);
	slot0:addGlobalEvent(HomeworldEvent.Update_My_Home_Figure_Event, function ()
		uv0:createRole(HomeworldController:getInstance():getModel():getMyCurHomeFigureId());
	end);
end

function PlanesMapWindow.onTouchMoveMap(slot0, slot1, slot2)
	if not slot0.map_container then
		return
	end

	slot3, slot4 = slot0.map_container:getPosition();
	slot7, slot8 = slot0:checkMapSafePos(slot3 + slot1, slot4 + slot2);

	slot0.map_container:setPosition(cc.p(slot7, slot8));
end

function PlanesMapWindow.checkMapSafePos(slot0, slot1, slot2)
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

function PlanesMapWindow.onClickCloseBtn(slot0)
	uv0:openPlanesMapWindow(false);
end

function PlanesMapWindow.onClickBagBtn(slot0)
	uv0:openPlanesBagPanel(true);
end

function PlanesMapWindow.onClickHeroBtn(slot0)
	uv0:openPlanesHeroListPanel(true);
end

function PlanesMapWindow.onClickDunBtn(slot0)
	if slot0.cur_dun_id then
		uv0:openPlanesDunInfoWindow(true, slot0.cur_dun_id);
	end
end

function PlanesMapWindow.onClickHideBtn(slot0)
	slot0.is_hide_top = not slot0.is_hide_top;

	MainuiController:getInstance():setMainUIShowStatus(not slot0.is_hide_top);
	MainuiController:getInstance():setIsShowMainUIBottom(false);
	slot0.top_title_bg:setVisible(not slot0.is_hide_top);
	slot0.btn_rule:setVisible(not slot0.is_hide_top);
	slot0.btn_hide:setVisible(not slot0.is_hide_top);
	slot0.close_btn:setVisible(not slot0.is_hide_top);
	slot0.dun_btn:setVisible(not slot0.is_hide_top);
	slot0.bottom_panel:setVisible(not slot0.is_hide_top);

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

function PlanesMapWindow.onClickBuffBtn(slot0)
	uv0:openPlanesBuffListWindow(true);
end

function PlanesMapWindow.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.SecretDunData.data_const.planes_rule then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition());
	end
end

function PlanesMapWindow.onClickFigureBtn(slot0)
	if slot0.is_role_moving then
		message(TI18N("角色移动中，无法更换形象"));

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

function PlanesMapWindow.openRootWnd(slot0, slot1)
	if not slot1 then
		slot1 = {};
	end

	if not slot1.dun_id then
		slot2 = uv0:getCurDunId();
	end

	slot0.cur_dun_id = slot2;

	if not slot1.floor then
		slot2 = uv0:getCurPlanesFloor();
	end

	slot0.cur_floor = slot2;

	if slot0.cur_dun_id == 0 or slot0.cur_floor == 0 then
		uv1:openPlanesMapWindow(false);

		return
	end

	uv1:sender23106(slot0.cur_floor);
	uv1:sender23115();

	if Config.SecretDunData.data_drama[uv0:getPlanesDramIdCache()] then
		delayOnce(function ()
			MonopolyController:getInstance():openMonopolyDialogWindow(true, 89, 0, uv0);
		end, 0.5);
		uv0:setPlanesDramIdCache(0);
	end
end

function PlanesMapWindow.setVisible(slot0, slot1)
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

function PlanesMapWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:playCloudEffect(true);
	slot0:initMapTileConfig(slot1.map_id);

	slot0.data = slot1;
	slot0.cur_floor = slot1.floor;
	slot0.cur_role_grid_index = slot1.index;
	slot0.cur_grid_data = {};
	slot2 = pairs;

	if not slot1.tile_list then
		slot4 = {};
	end

	for slot5, slot6 in slot2(slot4) do
		slot0.cur_grid_data[slot6.index] = slot6;
	end

	slot2 = uv0:getPlanesEvtVoList();
	slot3 = {};
	slot4 = {};

	if slot1.walk_tile and next(slot1.walk_tile) ~= nil then
		slot5 = {};

		for slot9, slot10 in pairs(slot1.walk_tile) do
			slot11, slot12 = PlanesTile.indexTile(slot10.pos);
			slot17 = PlanesConst.Grid_Round;
			slot18 = PlanesConst.Grid_Round;

			for slot17, slot18 in pairs(PlanesTile.tileRange(slot11, slot12, slot17, slot18)) do
				if slot18[1] and slot18[2] and not slot5[PlanesTile.tileIndex(slot18[1], slot18[2])] and slot0.cur_grid_data[slot19] then
					slot5[slot19] = true;

					uv1(slot3, slot0.cur_grid_data[slot19]);
					uv1(slot4, slot2[slot19]);
				end
			end
		end
	end

	slot6 = Config.SecretDunData.data_max_dun_num[slot0.cur_floor];

	if Config.SecretDunData.data_dun_info[uv0:getCurDunId()] and slot6 then
		slot0.floor_txt:setString(TI18N(uv2("%s 第%d/%d层", slot7.name, slot0.cur_floor, slot6)));
	end

	slot0:updateMapBg();

	slot0.init_grid_end = false;

	slot0:updateGridList(slot3, true);

	slot0.init_evt_end = false;

	slot0:updateEvtList(slot4);
	slot0:createRole();
	slot0:moveMapToRoleCenter();
	slot0:playBackgroundMusic();
end

function PlanesMapWindow.playBackgroundMusic(slot0)
	if not Config.SecretDunData.data_customs[uv0:getCurDunId()] then
		return
	end

	if not slot0.cur_music or slot0.cur_music ~= slot2.music then
		slot0.cur_music = slot2.music;

		if slot2.music ~= "" then
			AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, slot2.music, true);
		end
	end
end

function PlanesMapWindow.initMapTileConfig(slot0, slot1)
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

	PlanesTile.init(PlanesConst.Grid_Width * 0.5, PlanesConst.Grid_Height * 0.5, slot0.cur_map_width, slot0.cur_map_height);

	slot0.init_tile_end = true;
end

function PlanesMapWindow.updateMapBg(slot0)
	if not slot0.cur_dun_id or not slot0.cur_floor then
		return
	end

	if not Config.SecretDunData.data_dun_map[slot0.cur_dun_id] or not slot1[slot0.cur_floor] then
		return
	end

	if not slot1[slot0.cur_floor].map_res_id then
		slot2 = 1;
	end

	if not slot0.cur_map_res_id or slot0.cur_map_res_id ~= slot2 then
		slot0.cur_map_res_id = slot2;
		slot0.bg_img_load = loadImageTextureFromCDN(slot0.background, uv0("resource/planes/map_bg/map_bg_%s.jpg", slot2), ResourcesType.single, slot0.bg_img_load);
	end
end

function PlanesMapWindow.updateGridList(slot0, slot1, slot2)
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
		if not slot4[slot9.res_id] then
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
						slot4.grid_data.is_hide = 1;
					end
				end
			end

			slot0 = 0;
			slot1 = 0;

			for slot5, slot6 in ipairs(uv2) do
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

function PlanesMapWindow.createOneGridObject(slot0, slot1, slot2)
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

function PlanesMapWindow.showGridEnterAniByIndex(slot0, slot1)
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

function PlanesMapWindow.updateSomeGridData(slot0, slot1)
	if slot1 and next(slot1) ~= nil and slot0.init_grid_end then
		slot0:updateGridList(slot1);
	end
end

function PlanesMapWindow.checkShowRoundGrid(slot0, slot1)
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
				slot0:createOneEvtItem(uv1:getPlanesEvtVoByGridIndex(slot11), true);
			end
		end
	end

	if next(slot5) ~= nil then
		slot0:showGridEnterAniByIndex(slot5);
	end
end

function PlanesMapWindow.getGridPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return uv0("resource/planes/grid_icon/%s.png", slot1)
	end
end

function PlanesMapWindow.updateEvtList(slot0, slot1)
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

function PlanesMapWindow.createOneEvtItem(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot0.evt_item_list[slot1.index] then
		slot0.evt_item_list[slot3] = PlanesEvtItem.New(slot0.evt_slayer);
	end

	slot4:setData(slot1, slot2);

	slot5, slot6 = PlanesTile.indexPixel(slot3);

	slot4:setPosition(slot5, slot6);

	slot7, slot8 = PlanesTile.indexTile(slot3);

	slot4:setLocalZOrder((100 - slot8) * 100 + slot7);
end

function PlanesMapWindow.getEvtResPathListByData(slot0, slot1)
	slot2 = {};
	slot3 = {};

	for slot7, slot8 in pairs(slot1) do
		slot9 = nil;

		if slot8.status == PlanesConst.Evt_State.Doing then
			slot9 = slot8.config.res_1;
		else
			slot9 = slot8.config.res_2;
		end

		if slot9 and slot9[1] and slot9[1] == 1 and not slot3[slot9[2]] then
			uv0(slot2, {
				path = slot0:getEvtPathByResId(slot9[2]),
				type = ResourcesType.single
			});

			slot3[slot9[2]] = true;
		end
	end

	return slot2
end

function PlanesMapWindow.addEvtItemList(slot0, slot1)
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
				uv1.evt_item_list[slot4.index] = PlanesEvtItem.New(uv1.evt_slayer);
			end

			slot5:setData(slot4);

			slot6, slot7 = PlanesTile.indexPixel(slot4.index);

			slot5:setPosition(slot6, slot7);

			slot8, slot9 = PlanesTile.indexTile(slot4.index);

			slot5:setLocalZOrder((100 - slot9) * 100 + slot8);
		end
	end);
end

function PlanesMapWindow.getEvtPathByResId(slot0, slot1)
	if slot1 and slot1 ~= "" then
		return uv0("resource/planes/evt_icon/%s.png", slot1)
	end
end

function PlanesMapWindow.createRole(slot0, slot1)
	if not slot1 then
		slot1 = uv0:getPlanesRoleLookId();
	end

	if not slot0.cur_look_id or slot0.cur_look_id ~= slot1 then
		slot0.cur_look_id = slot1;

		slot0:removeMapRole();

		slot3 = "H60001";

		if Config.HomeData.data_figure[slot1] then
			slot3 = slot2.look_id;
		end

		slot0.map_role = createEffectSpine(slot3, cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.idle);

		slot0.map_role:setScale(1);
		slot0.map_role:setTimeScale(1.6);
		slot0.evt_slayer:addChild(slot0.map_role);
	end

	slot2, slot3 = PlanesTile.indexPixel(slot0.cur_role_grid_index);

	slot0.map_role:setPosition(slot2, slot3);
	slot0:updateRoleZOrder();
end

function PlanesMapWindow.updateRoleZOrder(slot0)
	if not slot0.cur_role_grid_index then
		return
	end

	slot1, slot2 = PlanesTile.indexTile(slot0.cur_role_grid_index);

	slot0.map_role:setLocalZOrder((100 - slot2) * 100 + slot1 + 1);
end

function PlanesMapWindow.removeMapRole(slot0)
	if slot0.map_role then
		slot0.map_role:clearTracks();
		slot0.map_role:removeFromParent();

		slot0.map_role = nil;
	end
end

function PlanesMapWindow.onClickGridIconByIndex(slot0, slot1)
	if not slot0.grid_object_list[slot1] then
		return
	end

	if slot2.grid_icon then
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

	if not uv0:checkEvtCanWalkByGridIndex(slot1, true) then
		message(TI18N("目标点为不可行走区域，请选择其他目标点"));

		return
	end

	if slot0.is_role_moving then
		slot0.target_grid_index = nil;
		slot0.role_move_grid_cache = {};

		return
	end

	slot3, slot4 = PlanesTile.indexTile(slot0.cur_role_grid_index);
	slot6, slot7 = PlanesTile.indexTile(slot1);
	slot9 = PlanesTile.astar(cc.p(slot3, slot4), cc.p(slot6, slot7), slot0.cur_block_cfg);
	slot0.role_move_grid_cache = {};

	while slot9 do
		if PlanesTile.tileIndex(slot9.x, slot9.y) ~= slot0.cur_role_grid_index then
			uv1(slot0.role_move_grid_cache, 1, slot12);
		end

		slot9 = slot9.parent;
	end

	if uv0:checkIsNeedStopPreGrid(slot1) then
		slot0.target_grid_index = uv2(slot0.role_move_grid_cache, #slot0.role_move_grid_cache);
	end

	if next(slot0.role_move_grid_cache) ~= nil and slot0.role_move_grid_cache[#slot0.role_move_grid_cache] then
		slot11, slot12 = PlanesTile.indexPixel(slot10);

		slot0:handlerTargetEffect(true, slot11, slot12);
	end

	slot0.stop_center_flag = false;

	slot0:showMoveRoute();
	slot0:doNextRoleMove();
end

function PlanesMapWindow.showMoveRoute(slot0)
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

function PlanesMapWindow.handlerTargetEffect(slot0, slot1, slot2, slot3)
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

function PlanesMapWindow.showBreakEffect(slot0, slot1)
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

function PlanesMapWindow.onBreakAniEnd(slot0)
	for slot4, slot5 in pairs(slot0.break_effect_list) do
		slot5:setVisible(false);
	end
end

function PlanesMapWindow.isLockPlanesMapScreen(slot0, slot1)
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

function PlanesMapWindow.doNextRoleMove(slot0)
	if not uv0(slot0.role_move_grid_cache, 1) then
		slot0:doRoleStopMove();

		return
	end

	if not slot0.stop_center_flag then
		slot0:moveMapToRoleCenter();
	end

	uv1:sender23103(slot1);
	slot0:moveRoleByGrid(slot1);
end

function PlanesMapWindow.moveRoleByGrid(slot0, slot1)
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
		slot0.map_role:setScaleX(0.4);
	else
		slot0.map_role:setScaleX(-0.4);
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

	slot9 = math.sqrt(math.pow(slot6 - slot4, 2) + math.pow(slot7 - slot5, 2)) / PlanesConst.Move_Speed;

	if not slot0.cur_role_action or slot0.cur_role_action ~= PlayerAction.move then
		slot0.cur_role_action = PlayerAction.move;

		slot0.map_role:setToSetupPose();
		slot0.map_role:setAnimation(0, PlayerAction.move, true);
	end

	slot0.map_role:runAction(cc.Sequence:create(cc.MoveTo:create(slot9, cc.p(slot6, slot7)), cc.CallFunc:create(function ()
		uv0:doNextRoleMove();
		uv0:checkShowRoundGrid(uv0.cur_role_grid_index);
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

			slot0.map_container:runAction(cc.MoveTo:create(math.sqrt(math.pow(slot12 - slot10, 2) + math.pow(slot13 - slot11, 2)) / PlanesConst.Move_Speed, cc.p(slot12, slot13)));
		end

		if slot0.map_move_state ~= 3 then
			slot0:openMapMoveTimer(true);
		end
	end
end

function PlanesMapWindow.moveMapToRoleCenter(slot0)
	slot1, slot2 = slot0:getMapPosOfRoleCenter();

	slot0.map_container:runAction(cc.MoveTo:create(0.3, cc.p(slot1, slot2)));
end

function PlanesMapWindow.getMapPosOfRoleCenter(slot0)
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

function PlanesMapWindow.checkMapIsCanMove(slot0)
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

function PlanesMapWindow.openMapMoveTimer(slot0, slot1)
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

						uv0.map_container:runAction(cc.MoveTo:create(math.sqrt(math.pow(slot5 - slot3, 2) + math.pow(slot6 - slot4, 2)) / PlanesConst.Move_Speed, cc.p(slot5, slot6)));
					end
				end
			end, 0.1);
		end
	elseif slot0.map_move_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.map_move_timer);

		slot0.map_move_timer = nil;
	end
end

function PlanesMapWindow.doRoleStopMove(slot0)
	slot0:openMapMoveTimer(false);
	slot0:handlerTargetEffect(false);
	slot0.map_role:stopAllActions();
	slot0.map_role:setToSetupPose();

	slot4 = 0;
	slot5 = PlayerAction.idle;

	slot0.map_role:setAnimation(slot4, slot5, true);

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
end

function PlanesMapWindow.checkProceedGridEvt(slot0)
	if slot0.target_grid_index then
		if uv0:getPlanesEvtVoByGridIndex(slot0.target_grid_index) and slot1.config and slot1.status == PlanesConst.Evt_State.Doing then
			uv1:onHandlePlanesEvtById(slot1.config.type, slot1.index);
		end

		slot0.target_grid_index = nil;
	end
end

function PlanesMapWindow.playCloudEffect(slot0, slot1)
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

function PlanesMapWindow.showBuffItemMoveAni(slot0, slot1, slot2)
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

function PlanesMapWindow.close_callback(slot0)
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
	slot0:playCloudEffect(false);
	slot0:handlerTargetEffect(false);

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

	slot0:removeMapRole();

	if not RoleController:getInstance():getModel().city_music_name then
		slot1 = "s_002";
	end

	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, slot1, true);
	MainuiController:getInstance():setIsShowMainUIBottom(true);
	uv0:openPlanesMapWindow(false);
end
