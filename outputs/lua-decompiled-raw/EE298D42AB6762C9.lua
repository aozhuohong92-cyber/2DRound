slot1 = HomeworldController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.remove
HomeWorldScene = HomeWorldScene or BaseClass(BaseView)

function HomeWorldScene.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "homeworld/homeworld_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_4"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		}
	}
	slot0.is_homeWorldScene = false

	slot0:initConfig()
end

function HomeWorldScene.initConfig(slot0)
	slot0.cur_scale_val = 1
	slot0.cur_hide_status = false
	slot0.cur_edit_status = false
	slot0.cur_home_type = HomeworldConst.Type.Myself
	slot0.pet_btn_status = false
	slot0.is_need_update_role = true
	slot0.can_click_next_btn = false
	slot0.cur_player_list_index = 1
	slot0.cur_storey_index = 1
	slot0.visitors_list = {}
	slot0.visitors_pool_list = {}
	slot0.unit_list = {}
	slot0.unit_pools = {}
	slot0.tile_w = HomeworldConst.Tile_Width
	slot0.tile_h = HomeworldConst.Tile_Height

	HomeTile.init(slot0.tile_w * 0.5, slot0.tile_h * 0.5, HomeworldConst.Map_Width, HomeworldConst.Map_Height)

	slot0.homepet_vo = HomepetController:getInstance():getModel():getHomePetVo()
end

function HomeWorldScene.open_callback(slot0)
	slot0.bg_slayer = slot0.root_wnd:getChildByName("bg_slayer")

	slot0.bg_slayer:setScale(display.getMaxScale())

	slot0.touch_slayer = slot0.root_wnd:getChildByName("touch_slayer")

	slot0.touch_slayer:setScale(display.getMaxScale())

	slot0.build_container = slot0.root_wnd:getChildByName("build_container")

	slot0.build_container:setContentSize(cc.size(HomeworldConst.Build_Width, HomeworldConst.Build_Height))

	slot0.build_slayer = slot0.build_container:getChildByName("build_slayer")
	slot0.floor_slayer = slot0.build_container:getChildByName("floor_slayer")
	slot0.wall_slayer = slot0.build_container:getChildByName("wall_slayer")
	slot0.unit_slayer = slot0.build_container:getChildByName("unit_slayer")
	slot0.unit_slayer.pos_node = cc.Node:create()

	slot0.unit_slayer.pos_node:setVisible(false)
	slot0.unit_slayer:addChild(slot0.unit_slayer.pos_node)

	slot0.ui_container = slot0.root_wnd:getChildByName("ui_container")
	slot0.slider_panel = slot0.ui_container:getChildByName("slider_panel")
	slot0.slider = slot0.slider_panel:getChildByName("slider")

	slot0.slider:setBarPercent(2, 98)
	slot0.slider:setScale9Enabled(true)

	slot0.edit_btn = slot0.ui_container:getChildByName("edit_btn")

	if slot0.edit_btn then
		slot0.edit_btn_label = slot0.edit_btn:getChildByName("label")

		slot0.edit_btn_label:setString(TI18N("编辑模式"))
	end

	slot0.figure_btn = slot0.ui_container:getChildByName("figure_btn")

	slot0.figure_btn:getChildByName("label"):setString(TI18N("形象设置"))

	slot0.storey_btn = slot0.ui_container:getChildByName("storey_btn")
	slot0.storey_btn_label = slot0.storey_btn:getChildByName("label")

	slot0.storey_btn_label:setString(TI18N("换层"))

	slot0.shop_btn = slot0.ui_container:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("宅室商城"))

	slot0.my_visit_btn = slot0.ui_container:getChildByName("my_visit_btn")

	slot0.my_visit_btn:getChildByName("label"):setString(TI18N("我的拜访"))

	slot0.add_friend_btn = slot0.ui_container:getChildByName("add_friend_btn")

	slot0.add_friend_btn:getChildByName("label"):setString(TI18N("留言板"))

	slot0.close_btn = slot0.ui_container:getChildByName("close_btn")
	slot0.close_btn_label = slot0.close_btn:getChildByName("label")

	slot0.close_btn_label:setString(TI18N("退出"))

	slot0.back_my_btn = slot0.ui_container:getChildByName("back_my_btn")

	slot0.back_my_btn:getChildByName("label"):setString(TI18N("返回我的"))

	slot0.hide_btn = slot0.ui_container:getChildByName("hide_btn")
	slot0.btn_rule = slot0.ui_container:getChildByName("btn_rule")

	slot0.shop_btn:setName("guide_shop_btn")

	if slot0.edit_btn then
		slot0.edit_btn:setName("guide_edit_btn")
	end

	slot0.pet_panel = slot0.ui_container:getChildByName("pet_panel")
	slot0.pet_btn = slot0.pet_panel:getChildByName("pet_btn")
	slot0.pet_btn_label = slot0.pet_btn:getChildByName("label")

	slot0.pet_btn_label:setString(TI18N("萌兽"))

	slot0.pet_bag = slot0.pet_panel:getChildByName("pet_bag")

	slot0.pet_bag:setVisible(false)
	slot0.pet_bag:setPositionY(50)
	slot0.pet_bag:setOpacity(0)

	slot0.pet_bag_label = slot0.pet_bag:getChildByName("label")

	slot0.pet_bag_label:setString(TI18N("行囊"))

	slot0.pet_bag_tips = slot0.pet_bag:getChildByName("tips_icon")
	slot0.pet_item = slot0.pet_panel:getChildByName("pet_item")

	slot0.pet_item:setVisible(false)
	slot0.pet_item:setPositionY(50)
	slot0.pet_item:setOpacity(0)
	slot0.pet_item:getChildByName("label"):setString(TI18N("物品"))

	slot0.pet_collect = slot0.pet_panel:getChildByName("pet_collect")

	slot0.pet_collect:setVisible(false)
	slot0.pet_collect:setPositionY(50)
	slot0.pet_collect:setOpacity(0)
	slot0.pet_collect:getChildByName("label"):setString(TI18N("收藏"))

	slot0.my_output_panel = slot0.ui_container:getChildByName("my_output_panel")

	slot0.my_output_panel:setContentSize(cc.size(306, 164))

	slot0.comfort_sp = slot0.my_output_panel:getChildByName("sp_icon_1")
	slot0.comfort_label = slot0.my_output_panel:getChildByName("comfort_label")
	slot0.like_sp = slot0.my_output_panel:getChildByName("sp_icon_3")
	slot0.like_label = slot0.my_output_panel:getChildByName("like_label")
	slot0.coin_sp = slot0.my_output_panel:getChildByName("sp_icon_2")
	slot0.coin_label = slot0.my_output_panel:getChildByName("coin_label")
	slot0.storey_sp = slot0.my_output_panel:getChildByName("sp_icon_4")
	slot0.storey_label = slot0.my_output_panel:getChildByName("storey_label")
	slot0.main_storey_label = slot0.my_output_panel:getChildByName("main_storey_label")

	slot0.main_storey_label:setString(TI18N("主楼层"))

	slot0.main_storey_btn = slot0.my_output_panel:getChildByName("mian_storey_btn")

	slot0.main_storey_btn:getChildByName("label"):setString(TI18N("设为主楼层"))

	slot0.detial_btn = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(254, 101))

	slot0.my_output_panel:addChild(slot0.detial_btn)
	slot0.detial_btn:setString(TI18N("<div fontcolor=53de28 href=detial>查看详情</div>"))
	slot0.detial_btn:addTouchLinkListener(function (slot0, slot1)
		if slot0 == "href" and slot1 == "detial" then
			uv0:_onClickDetialBtn()
		end
	end, {
		"href"
	})

	slot0.other_like_panel = slot0.ui_container:getChildByName("other_like_panel")
	slot0.like_btn = slot0.other_like_panel:getChildByName("like_btn")
	slot0.next_btn = slot0.other_like_panel:getChildByName("next_btn")

	slot0.next_btn:getChildByName("label"):setString(TI18N("访问下位"))

	slot0.can_like_tips = createRichLabel(18, cc.c4b(141, 133, 131, 255), cc.p(0.5, 0.5), cc.p(105, 20))

	slot0.other_like_panel:addChild(slot0.can_like_tips)

	slot0.title_panel = slot0.ui_container:getChildByName("title_panel")
	slot0.home_name = slot0.title_panel:getChildByName("home_name")
	slot0.edit_name_btn = slot0.title_panel:getChildByName("edit_name_btn")
	slot2 = display.getBottom(slot0.root_wnd)
	slot0.root_off = slot2

	slot0.root_wnd:setPositionY(slot0.root_wnd:getPositionY() + slot2)

	slot3 = display.getBottom(slot0.ui_container)
	slot4 = display.getTop(slot0.ui_container)
	slot0.top_off = slot4

	slot0.title_panel:setPositionY(slot4 - slot2 - 56)
	slot0.slider_panel:setPositionY(slot4 - slot2 - 680)

	if slot0.edit_btn then
		slot0.edit_btn:setPositionY(slot4 - slot2 - 435)
	end

	slot0.figure_btn:setPositionY(slot4 - slot2 - 545)
	slot0.storey_btn:setPositionY(slot4 - slot2 - 655)
	slot0.shop_btn:setPositionY(slot4 - slot2 - 325)
	slot0.btn_rule:setPositionY(slot4 - slot2 - 145)
	slot0.my_visit_btn:setPositionY(slot4 - slot2 - 215)
	slot0.add_friend_btn:setPositionY(slot4 - slot2 - 330)
	slot0.close_btn:setPositionY(slot4 - slot2 - 215)
	slot0.hide_btn:setPositionY(slot4 - slot2 - 310)
	slot0.back_my_btn:setPositionY(slot3 - slot2 + 200)
	slot0.pet_panel:setPositionY(slot3 - slot2 + 205)
	slot0.my_output_panel:setPositionY(slot3 - slot2 + 145)
	slot0.other_like_panel:setPositionY(slot3 - slot2 + 160)
	slot0:updateBuildMinMaxPos()

	slot0._init_end_flag = true
end

function HomeWorldScene.register_event(slot0)
	slot0.slider:addEventListener(function (slot0, slot1)
		if slot1 == ccui.SliderEventType.percentChanged then
			uv0:onSliderScaleBuild(uv0.slider:getPercent())
		end
	end)
	slot0.touch_slayer:addTouchEventListener(function (slot0, slot1)
		if uv0.cur_hide_status then
			return
		end

		if slot1 == ccui.TouchEventType.began then
			slot5 = slot0
			uv0.last_pos = slot0.getTouchBeganPosition(slot5)

			for slot5, slot6 in pairs(uv0.unit_list) do
				slot6:updateEditStatus(false)
			end

			uv0:showUnitTouchMask(false)
		elseif slot1 == ccui.TouchEventType.moved then
			slot2 = slot0:getTouchMovePosition()

			if uv0.last_pos then
				uv0.last_pos = slot2

				uv0:onTouchMoveBuild(slot2.x - uv0.last_pos.x, slot2.y - uv0.last_pos.y)
			end
		end
	end)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClickCloseBtn()
	end, true, 2)
	registerButtonEventListener(slot0.edit_name_btn, function ()
		uv0:_onClickChangeName()
	end, true)
	registerButtonEventListener(slot0.edit_btn, function ()
		uv0:changeEditStatus(not uv0.cur_edit_status)
	end, true)
	registerButtonEventListener(slot0.figure_btn, function ()
		uv0:openHomeworldFigureWindow(true)
	end, true)
	registerButtonEventListener(slot0.storey_btn, function ()
		uv0:_onClickStoreyBtn()
	end, true, 1, nil, , 0.5)
	registerButtonEventListener(slot0.hide_btn, function ()
		uv0:changeHideStatus(true)
	end, true, nil, , , 0.3)
	registerButtonEventListener(slot0.shop_btn, function (slot0, slot1, slot2)
		uv0:_onClickShopBtn()
	end, true)
	registerButtonEventListener(slot0.my_visit_btn, function ()
		uv0:_onClickVisitBtn()
	end, true)
	registerButtonEventListener(slot0.add_friend_btn, function ()
		uv0:_onClickAddFriendBtn()
	end, true)
	registerButtonEventListener(slot0.back_my_btn, function ()
		uv0:_onClickBackMyHomeBtn()
	end, true)
	registerButtonEventListener(slot0.like_btn, function ()
		uv0:_onClickLikeBtn()
	end, true)
	registerButtonEventListener(slot0.main_storey_btn, function ()
		uv0:_onClickMainStoreyBtn()
	end, true)
	registerButtonEventListener(slot0.next_btn, function ()
		uv0:_onClickNextBtn()
	end, true, nil, , , 0.5)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.HomeData.data_const.home_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true)
	registerButtonEventListener(slot0.pet_btn, function ()
		uv0:_onClickPetBtn()
	end, true, 1, nil, , 0.5)
	registerButtonEventListener(slot0.pet_bag, function ()
		uv0:_onClickPetBag()
	end, true)
	registerButtonEventListener(slot0.pet_item, function ()
		uv0:_onClickPetItem()
	end, true)
	registerButtonEventListener(slot0.pet_collect, function ()
		uv0:_onClickPetCollect()
	end, true)
	slot0:addGlobalEvent(HomeworldEvent.Get_My_Home_Data_Event, function ()
		if uv0.cur_home_type == HomeworldConst.Type.Myself then
			uv0.is_need_update_role = true

			uv0:updateMyHome()
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Add_One_Furniture_Event, function (slot0)
		if not Config.HomeData.data_home_unit(slot0) then
			return
		end

		if slot1.type == HomeworldConst.Unit_Type.Floor then
			uv0:updateHomeFloorById(slot0)
		elseif slot1.type == HomeworldConst.Unit_Type.Wall then
			uv0:updateHomeWallById(slot0)
		else
			uv0:createOneUnit(slot0, true)
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Clear_All_Furniture_Event, function ()
		if uv0.cur_home_type == HomeworldConst.Type.Myself then
			uv0:deleteAllUnit()
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Save_My_Home_Data_Event, function ()
		uv0:onSaveCurHomeData()
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_My_Home_Name_Event, function (slot0)
		if uv0.cur_home_type == HomeworldConst.Type.Myself then
			uv0:updateHomeName(slot0)
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_My_Home_Figure_Event, function ()
		if uv0.cur_home_type == HomeworldConst.Type.Myself then
			uv0:updateHomeRole(uv1:getMyCurHomeFigureId())
		end
	end)

	if slot0.homepet_vo and slot0.home_pet_vo_attt_event == nil then
		slot0.home_pet_vo_attt_event = slot0.homepet_vo:Bind(HomepetEvent.HOME_PET_VO_ATTR_EVENT, function (slot0, slot1)
			if slot0 == "state" then
				uv0:setHomepetStateInfo()
			elseif slot0 == "set_item" then
				uv0:updateHomepetRedPointInfo()
			end
		end)
	end

	slot0:addGlobalEvent(HomepetEvent.HOME_PET_TALK_EVENT, function (slot0)
		uv0:updateHomePetTalk(slot0)
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Some_Data_Event, function ()
		uv0:updateMyHomeOutputInfo()
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Left_Worship_Num, function ()
		if uv0.cur_home_type == HomeworldConst.Type.Other then
			uv0:updateWorshipInfo()
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Acc_Hook_Time_Data, function ()
		if uv0.cur_home_type == HomeworldConst.Type.Myself then
			uv0:updateHookTimeInfo()
		end
	end)
	slot0:addGlobalEvent(RoleEvent.WorshipOtherRole, function (slot0, slot1, slot2, slot3)
		if WorshipType.home == slot3 and uv0.other_rid and uv0.other_srv_id and uv0.other_rid == slot0 and uv0.other_srv_id == slot1 then
			uv0.other_worship = uv0.other_worship + 1

			uv0:updateWorshipInfo()
			uv1:addPlayerToWorshipData(slot0, slot1)
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Get_Today_Worship_Data, function ()
		uv0.can_click_next_btn = true
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Main_Storey_Event, function ()
		uv0:updateMyHomeOutputInfo()
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_Red_Status_Data, function (slot0, slot1)
		uv0:updateRedBtnStatus(slot0, slot1)
	end)
end

function HomeWorldScene.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.cur_home_type = HomeworldConst.Type.Other

		slot0:goToOtherPlayerHome(slot1)
	else
		slot0.cur_home_type = HomeworldConst.Type.Myself

		slot0:playEnterEffect(true)
		ChatController:getInstance():closeChatUseAction()
		uv0:sender26001()
		HomepetController:getInstance():sender26100()
	end

	slot0:updateHomeBgByTime(tonumber(os.date("%H")))
	slot0:changeFuncUiShow()

	if uv1:getIsFirstTimeOpenHome() then
		slot0:showHomeSceneScaleAni(true)
	else
		slot0.slider:setPercent(50)
		slot0:onSliderScaleBuild(50)
	end

	if uv1:getRedStatusById(HomeworldConst.Red_Index.Hook) then
		slot0.build_container:setPosition(cc.p(SCREEN_WIDTH / 2 + 150, slot0.build_min_pos_y))
	else
		slot0.build_container:setPosition(cc.p(SCREEN_WIDTH / 2, slot0.build_min_pos_y))
	end

	slot0:setHomepetStateInfo()
	delayRun(slot0.root_wnd, 1.2, function ()
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_CHECK_TRIGGER_EVENT)
	end)
	slot0:updateRedBtnStatus()
end

function HomeWorldScene.showHomeSceneScaleAni(slot0, slot1)
	if slot1 == true then
		if slot0.build_ani_timer == nil then
			slot2 = 100

			slot0.slider:setPercent(slot2)
			slot0:onSliderScaleBuild(slot2)

			if not slot0.build_ani_mask then
				slot0.build_ani_mask = ccui.Layout:create()

				slot0.build_ani_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
				slot0.build_ani_mask:setScale(display.getMaxScale())
				slot0.build_ani_mask:setPositionY(display.getBottom(slot0.ui_container) - display.getBottom(slot0.root_wnd))
				slot0.build_ani_mask:setTouchEnabled(true)
				slot0.ui_container:addChild(slot0.build_ani_mask, 99)
				slot0.build_ani_mask:setSwallowTouches(false)
				slot0.build_ani_mask:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						uv0.build_ani_mask:setVisible(false)
					end
				end)
			end

			slot0.build_ani_mask:setVisible(true)

			slot0.build_ani_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0 = uv0 - 0.6

				if uv0 <= 50 then
					uv0 = 50

					GlobalTimeTicket:getInstance():remove(uv1.build_ani_timer)

					uv1.build_ani_timer = nil

					uv1.build_ani_mask:setVisible(false)
				end

				uv1.slider:setPercent(uv0)
				uv1:onSliderScaleBuild(uv0)
			end, 0.01)
		end
	elseif slot0.build_ani_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.build_ani_timer)

		slot0.build_ani_timer = nil
	end
end

function HomeWorldScene.setHomepetStateInfo(slot0)
	if not slot0.homepet_vo then
		return
	end

	if slot0.homepet_vo:getPetState() == HomepetConst.state_type.eNotActive or slot1 == HomepetConst.state_type.eOnWay then
		slot0.pet_bag:loadTexture(PathTool.getResFrame("homeworld", "homeworld_1056"), LOADTEXT_TYPE_PLIST)
		slot0.pet_bag_label:setString(TI18N("旅行中"))
		slot0.pet_btn:loadTexture(PathTool.getResFrame("homeworld", "homeworld_1058"), LOADTEXT_TYPE_PLIST)
		slot0.pet_btn_label:setString(TI18N("正在出行"))
	elseif slot1 == HomepetConst.state_type.eHome then
		slot0.pet_bag:loadTexture(PathTool.getResFrame("homeworld", "homeworld_1049"), LOADTEXT_TYPE_PLIST)
		slot0.pet_bag_label:setString(TI18N("行囊"))
		slot0.pet_btn:loadTexture(PathTool.getResFrame("homeworld", "homeworld_1010"), LOADTEXT_TYPE_PLIST)
		slot0.pet_btn_label:setString(TI18N("萌宠"))
	end

	slot0:checkoutPetStatus()
	slot0:updateHomepetRedPointInfo()
end

function HomeWorldScene.updateHomepetRedPointInfo(slot0)
	slot1 = slot0.homepet_vo:getSetItemInfo()

	if slot0.homepet_vo:getPetState() == HomepetConst.state_type.eNotActive or slot2 == HomepetConst.state_type.eOnWay then
		slot0.pet_bag_tips:setVisible(false)
	elseif slot1[1] == nil and slot1[3] == nil then
		slot0.pet_bag_tips:setVisible(true)
	else
		slot0.pet_bag_tips:setVisible(false)
	end
end

function HomeWorldScene.goToOtherPlayerHome(slot0, slot1)
	if slot0._change_storey_flag then
		slot0._change_storey_flag = true

		slot0:playCloudEffect(true)
	else
		slot0:playEnterEffect(true)
	end

	ChatController:getInstance():closeChatUseAction()

	if not uv0:checkIsHaveTodayWorshipData() then
		uv1:sender26009()
		uv1:sender26019()
	else
		slot0.can_click_next_btn = true
	end

	slot0.is_need_update_role = true
	slot2 = slot1.look_id
	slot3 = slot1.wall_bid
	slot4 = slot1.land_bid
	slot5 = {}

	for slot9, slot10 in pairs(slot1.list) do
		slot11 = FurnitureVo.New()

		slot11:updateData(slot10)
		uv2(slot5, slot11)
	end

	slot0.other_rid = slot1.rid
	slot0.other_srv_id = slot1.srv_id
	slot0.other_worship = slot1.worship
	slot0.owner_name = slot1.tar_name or TI18N("房主")
	slot0.cur_storey_index = slot1.floor or 1
	slot0.cur_home_type = HomeworldConst.Type.Other

	slot0:changeFuncUiShow()
	slot0.slider:setPercent(50)
	slot0:onSliderScaleBuild(50)
	slot0.build_container:setPosition(cc.p(SCREEN_WIDTH / 2, slot0.build_min_pos_y))
	slot0:changeEditStatus(false, true)
	slot0:setData(slot2, slot3, slot4, slot5, slot1.visitors, slot1.name)
end

function HomeWorldScene.getOtherHomeRidAndSrvId(slot0)
	return slot0.other_rid, slot0.other_srv_id
end

function HomeWorldScene.backToMyHomeworld(slot0)
	slot0.is_need_update_role = true

	uv0:sender26001()
	slot0:playEnterEffect(true)
	ChatController:getInstance():closeChatUseAction()

	slot0.cur_home_type = HomeworldConst.Type.Myself

	slot0:changeFuncUiShow()
	slot0.slider:setPercent(50)
	slot0:onSliderScaleBuild(50)
	slot0.build_container:setPosition(cc.p(SCREEN_WIDTH / 2, slot0.build_min_pos_y))
	slot0:changeEditStatus(false, true)
	delayRun(slot0.root_wnd, 1.2, function ()
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_CHECK_TRIGGER_EVENT)
	end)
end

function HomeWorldScene.updateMyHome(slot0, slot1, slot2, slot3)
	if slot0._change_storey_flag then
		slot0._change_storey_flag = false

		slot0:playCloudEffect(true)
	end

	slot0.other_rid = nil
	slot0.other_srv_id = nil
	slot0.other_worship = 0
	slot0.can_click_next_btn = false
	slot0.cur_player_list_index = 1
	slot0.next_player_list = nil

	slot0:setData(uv0:getMyCurHomeFigureId(), slot1 or uv0:getMyHomeWallId(), slot2 or uv0:getMyHomeFloorId(), slot3 or uv0:getMyHomeFurnitureData(), uv0:getMyHomeVisitorsData(), uv0:getMyHomeName())
end

function HomeWorldScene.enterPreviewState(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cur_home_type = HomeworldConst.Type.Preview
	slot5 = true

	slot0:playEnterEffect(slot5)
	ChatController:getInstance():closeChatUseAction()

	slot0.preview_unit_data = {
		wall_bid = slot0.cur_wall_id,
		land_bid = slot0.cur_floor_id,
		unit_list = {}
	}

	for slot5, slot6 in pairs(slot0.unit_list) do
		uv0(slot0.preview_unit_data.unit_list, slot6:getData())
	end

	slot2 = slot1.wall_bid
	slot3 = slot1.land_bid
	slot4 = {}

	for slot8, slot9 in pairs(slot1.unit_list) do
		slot10 = FurnitureVo.New()

		slot10:updateData(slot9)
		uv0(slot4, slot10)
	end

	slot0:changeFuncUiShow()
	slot0.slider:setPercent(50)
	slot0:onSliderScaleBuild(50)
	slot0.build_container:setPosition(cc.p(SCREEN_WIDTH / 2, slot0.build_min_pos_y))
	slot0:changeEditStatus(false, true)
	slot0:setData(nil, slot2, slot3, slot4, nil, slot1.homename or uv1:getMyHomeName())
end

function HomeWorldScene.setData(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not slot0._init_end_flag then
		return
	end

	if slot6 then
		slot0:updateHomeName(slot6)
	end

	if slot2 then
		slot0:updateHomeWallById(slot2)
	end

	if slot3 then
		slot0:updateHomeFloorById(slot3)
	end

	if slot4 then
		slot0:updateHomeFurniture(slot4)
	end

	if slot0.is_need_update_role then
		for slot10 = #slot0.visitors_list, 1, -1 do
			slot11 = uv0(slot0.visitors_list, slot10)

			slot11:setVisible(false)
			uv1(slot0.visitors_pool_list, slot11)
		end

		delayRun(slot0.root_wnd, #slot4 * 2 / display.DEFAULT_FPS, function ()
			uv0:showPetUnit(true, {})

			if uv1 then
				uv0:updateHomeRole(uv1)
			elseif uv0.home_role then
				uv0.home_role:setVisible(false)
			end

			if uv2 and next(uv2) ~= nil then
				uv0:updateVisitorsList(uv2)
			else
				uv0:updateAllFurnitureZOrder()
			end

			uv0.is_need_update_role = false
		end)
	else
		slot0:updateAllFurnitureZOrder()
	end

	slot0:updateMyHomeOutputInfo()
	slot0:updateHomeBgByTime()
	slot0:updateWorshipInfo()
	slot0:updateHookTimeInfo()
end

function HomeWorldScene.updateHomeName(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.home_name:setString(slot1)
end

function HomeWorldScene.updateMyHomeOutputInfo(slot0)
	if slot0.cur_home_type == HomeworldConst.Type.Myself then
		slot0.cur_storey_index, slot0.max_soft_storey = uv0:getMyHomeCurStoreyIndex()

		slot0.storey_label:setString(slot0.cur_storey_index .. TI18N("楼"))

		if Config.HomeData.data_const.comfort_limit then
			slot0.comfort_label:setString(uv0:getHomeComfortValue() .. "/" .. slot2.val)
		else
			slot0.comfort_label:setString(slot1)
		end

		if slot0.cur_storey_index == 1 then
			slot3 = uv0:getMaxAllSoftValue()
			slot0.two_storey_open = false

			if Config.HomeData.data_home_storey[2].limit then
				slot0.two_storey_open = true

				for slot8, slot9 in pairs(slot4.limit) do
					if slot9[1] == "lev" then
						slot0.two_storey_open = slot9[2] <= RoleController:getInstance():getRoleVo().lev
					elseif slot9[1] == "soft" then
						slot0.two_storey_open = slot9[2] <= slot3
					end

					if slot0.two_storey_open == false then
						break
					end
				end
			end

			setChildUnEnabled(not slot0.two_storey_open, slot0.storey_btn)
		else
			setChildUnEnabled(false, slot0.storey_btn)
		end

		slot0.like_label:setString(uv0:getHomeWorship())

		if slot0.cur_storey_index == slot0.max_soft_storey then
			slot0.coin_label:setString(uv1(TI18N("%d/时"), uv0:getHomeCoinOutput()))
		else
			slot0.coin_label:setString(uv1(TI18N("%d/时(当前为%d层收入)"), slot4, slot0.max_soft_storey))
		end

		slot0:updateMyHomeOutputUI()
	end
end

function HomeWorldScene.updateMyHomeOutputUI(slot0)
	slot1 = slot0.cur_storey_index == uv0:getMyhomeMainStoreyIndex()

	slot0.main_storey_label:setVisible(slot1)
	slot0.main_storey_btn:setVisible(not slot1)
end

function HomeWorldScene.updateWorshipInfo(slot0)
	if slot0.cur_home_type ~= HomeworldConst.Type.Other then
		return
	end

	if not slot0.other_worship_num then
		slot0.other_worship_num = createRichLabel(20, cc.c4b(213, 174, 143, 255), cc.p(0.5, 0.5), cc.p(105, 50))

		slot0.other_like_panel:addChild(slot0.other_worship_num)
	end

	slot0.other_worship_num:setString(uv0(TI18N("已被点赞<div fontcolor=84c152>%d</div>次"), slot0.other_worship or 0))
	slot0.can_like_tips:setString(uv0(TI18N("今日还可点赞<div fontcolor=c1c1c1>%d</div>次"), uv1:getLeftWorshipNum()))
end

function HomeWorldScene.updateHookTimeInfo(slot0)
	if slot0.cur_home_type ~= HomeworldConst.Type.Myself then
		return
	end

	if not slot0.hook_time_award then
		slot0.hook_time_award = HomeworldHookTimeAward.New(slot0.build_slayer)
	end

	slot0.hook_time_award:setData()
end

function HomeWorldScene.onClickCloseBtn(slot0)
	if slot0.cur_home_type == HomeworldConst.Type.Preview then
		uv0:showHomeworldSuitWindow(true)

		slot0.cur_home_type = HomeworldConst.Type.Myself

		slot0:changeFuncUiShow()
		slot0.slider:setPercent(50)
		slot0:onSliderScaleBuild(50)
		slot0.build_container:setPosition(cc.p(SCREEN_WIDTH / 2, slot0.build_min_pos_y))

		if slot0.preview_unit_data then
			slot0:updateMyHome(slot0.preview_unit_data.wall_bid, slot0.preview_unit_data.land_bid, slot0.preview_unit_data.unit_list)
			slot0:changeEditStatus(true)
		end
	else
		uv0:openHomeworldScene(false)
	end
end

function HomeWorldScene._onClickChangeName(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if slot0.cur_home_type ~= HomeworldConst.Type.Myself then
		return
	end

	if slot0.set_name_alert then
		slot0.set_name_alert:close()

		slot0.set_name_alert = nil
	end

	slot0.set_name_alert = CommonAlert.showInputApply("", TI18N("请输入名字(限制9字)"), TI18N("确 定"), function (slot0)
		if slot0 == nil or slot0 == "" then
			message(TI18N("名字不合法"))

			return
		end

		uv0:sender26011(slot0)

		if uv1.set_name_alert then
			uv1.set_name_alert:close()

			uv1.set_name_alert = nil
		end
	end, TI18N("取 消"), nil, true, nil, 20, CommonAlert.type.rich, FALSE, cc.size(270, 50), 9, {
		off_y = -15
	})
end

function HomeWorldScene._onClickStoreyBtn(slot0)
	if not slot0.cur_storey_index then
		return
	end

	if slot0.cur_home_type == HomeworldConst.Type.Myself and slot0.cur_storey_index == 1 and not slot0.two_storey_open then
		slot2 = 0

		if Config.HomeData.data_home_storey[2] then
			for slot6, slot7 in pairs(slot1.limit) do
				if slot7[1] == "soft" then
					slot2 = slot7[2] or 0

					break
				end
			end
		end

		message(uv1(TI18N("总舒适度达到%d解锁（当前:%d）"), slot2, uv0:getMaxAllSoftValue()))

		return
	end

	if Config.HomeData.data_home_storey_length < slot0.cur_storey_index + 1 then
		slot1 = 1
	end

	slot0._change_storey_flag = true

	if slot0.cur_home_type == HomeworldConst.Type.Myself then
		uv2:sender26001(slot1)
	else
		uv2:sender26003(slot0.other_rid, slot0.other_srv_id, slot1)
	end
end

function HomeWorldScene._onClickShopBtn(slot0)
	uv0:openHomeworldShopWindow(true)
end

function HomeWorldScene._onClickVisitBtn(slot0)
	uv0:openHomeworldVisitWindow(true)
end

function HomeWorldScene._onClickAddFriendBtn(slot0)
	if slot0.cur_home_type == HomeworldConst.Type.Other and slot0.other_rid and slot0.other_srv_id then
		RoleController:getInstance():requestRoleInfo(slot0.other_rid, slot0.other_srv_id, {
			form_type = RoleConst.Other_Form_Type.eMessageBoardInfo
		})
	end
end

function HomeWorldScene._onClickBackMyHomeBtn(slot0)
	uv0:requestOpenMyHomeworld(true)
end

function HomeWorldScene._onClickLikeBtn(slot0)
	if slot0.cur_home_type ~= HomeworldConst.Type.Other then
		return
	end

	if slot0.other_rid and slot0.other_srv_id then
		RoleController:getInstance():requestWorshipRole(slot0.other_rid, slot0.other_srv_id, 1, WorshipType.home)
	end
end

function HomeWorldScene._onClickMainStoreyBtn(slot0)
	if slot0.cur_home_type ~= HomeworldConst.Type.Myself then
		return
	end

	uv0:sender26021(slot0.cur_storey_index)
end

function HomeWorldScene._onClickNextBtn(slot0)
	if slot0.cur_home_type ~= HomeworldConst.Type.Other or not slot0.can_click_next_btn then
		return
	end

	if not slot0.next_player_list then
		slot0.next_player_list = uv0:getNextPlayerList(slot0.other_rid, slot0.other_srv_id)
	end

	slot0.cur_player_list_index = slot0.cur_player_list_index + 1

	if slot0.cur_player_list_index > #slot0.next_player_list then
		slot0.cur_player_list_index = 1
	end

	if slot0.next_player_list[slot0.cur_player_list_index] then
		uv1:sender26003(slot1.rid, slot1.srv_id)
	else
		message(TI18N("暂无下一位数据"))
	end
end

function HomeWorldScene._onClickDetialBtn(slot0)
	if slot0.cur_home_type ~= HomeworldConst.Type.Myself then
		return
	end

	uv0:openHomeInfoWindow(true)
end

function HomeWorldScene._onClickPetBtn(slot0)
	slot0.pet_btn_status = not slot0.pet_btn_status

	if slot0.pet_btn_status then
		slot0.pet_bag:setVisible(true)
		slot0.pet_item:setVisible(true)
		slot0.pet_collect:setVisible(true)
		slot0.pet_btn:setTouchEnabled(false)
		slot0.pet_bag:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(45, 350)), cc.FadeIn:create(0.2)), cc.CallFunc:create(function ()
			uv0.pet_btn:setTouchEnabled(true)
			uv0.pet_bag:setTouchEnabled(true)
			uv0.pet_item:setTouchEnabled(true)
			uv0.pet_collect:setTouchEnabled(true)
		end)))
		slot0.pet_item:runAction(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(45, 250)), cc.FadeIn:create(0.2)))
		slot0.pet_collect:runAction(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(45, 150)), cc.FadeIn:create(0.2)))
	else
		slot0.pet_bag:setTouchEnabled(false)
		slot0.pet_item:setTouchEnabled(false)
		slot0.pet_collect:setTouchEnabled(false)
		slot0.pet_btn:setTouchEnabled(false)
		slot0.pet_bag:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(45, 50)), cc.FadeOut:create(0.2)), cc.CallFunc:create(function ()
			uv0.pet_bag:setVisible(false)
			uv0.pet_btn:setTouchEnabled(true)
		end)))
		slot0.pet_item:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(45, 50)), cc.FadeOut:create(0.2)), cc.CallFunc:create(function ()
			uv0.pet_item:setVisible(false)
		end)))
		slot0.pet_collect:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.2, cc.p(45, 50)), cc.FadeOut:create(0.2)), cc.CallFunc:create(function ()
			uv0.pet_collect:setVisible(false)
		end)))
	end
end

function HomeWorldScene._onClickPetBag(slot0)
	if not slot0.homepet_vo then
		return
	end

	if slot0.homepet_vo:getPetState() == HomepetConst.state_type.eNotActive then
		HomepetController:getInstance():openHomePetGooutProgressPanel(true)
	elseif slot1 == HomepetConst.state_type.eHome then
		HomepetController:getInstance():openHomePetTravellingBagPanel(true)
	elseif slot1 == HomepetConst.state_type.eOnWay then
		HomepetController:getInstance():openHomePetGooutProgressPanel(true)
	end
end

function HomeWorldScene._onClickPetItem(slot0)
	HomepetController:getInstance():openHomePetItemBagPanel(true, {
		show_type = HomepetConst.Item_bag_show_type.eBagItemType
	})
end

function HomeWorldScene._onClickPetCollect(slot0)
	HomepetController:getInstance():openHomePetCollectionPanel(true)
end

function HomeWorldScene.changeFuncUiShow(slot0)
	if not slot0._init_end_flag then
		return
	end

	slot0.shop_btn:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)

	if slot0.edit_btn then
		slot0.edit_btn:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	end

	slot0.figure_btn:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	slot0.my_output_panel:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	slot0.pet_panel:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	slot0.slider_panel:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	slot0.edit_name_btn:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	slot0.add_friend_btn:setVisible(slot0.cur_home_type == HomeworldConst.Type.Other)
	slot0.back_my_btn:setVisible(slot0.cur_home_type == HomeworldConst.Type.Other)
	slot0.other_like_panel:setVisible(slot0.cur_home_type == HomeworldConst.Type.Other)
	slot0.my_visit_btn:setVisible(slot0.cur_home_type ~= HomeworldConst.Type.Preview)
	slot0.btn_rule:setVisible(slot0.cur_home_type ~= HomeworldConst.Type.Preview)

	if slot0.cur_home_type ~= HomeworldConst.Type.Preview then
		slot0.close_btn_label:setString(TI18N("退出"))
		slot0.storey_btn:setVisible(true)

		if slot0.cur_home_type == HomeworldConst.Type.Myself then
			slot0.storey_btn:setPositionY(slot0.top_off - slot0.root_off - 655)
		else
			slot0.storey_btn:setPositionY(slot0.top_off - slot0.root_off - 435)
			setChildUnEnabled(false, slot0.storey_btn)
			slot0.storey_btn_label:enableOutline(cc.c4b(76, 38, 26, 255), 2)
		end
	else
		slot0.close_btn_label:setString(TI18N("返回"))
		slot0.storey_btn:setVisible(false)
	end

	if slot0.hook_time_award then
		slot0.hook_time_award:setVisible(slot0.cur_home_type == HomeworldConst.Type.Myself)
	end

	if slot0.home_role then
		slot0.home_role:setCanMoveRoleStatus(slot0.cur_home_type == HomeworldConst.Type.Myself)
	end

	if slot0.pet_unit then
		slot0.pet_unit:setCanMoveRoleStatus(slot0.cur_home_type == HomeworldConst.Type.Myself)
	end
end

function HomeWorldScene.changeHideStatus(slot0, slot1)
	slot0.cur_hide_status = slot1

	if slot1 then
		slot0.btn_rule:setTouchEnabled(false)
		slot0.btn_rule:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		slot0.my_visit_btn:setTouchEnabled(false)
		slot0.my_visit_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		slot0.add_friend_btn:setTouchEnabled(false)
		slot0.add_friend_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		slot0.shop_btn:setTouchEnabled(false)
		slot0.shop_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))

		if slot0.edit_btn then
			slot0.edit_btn:setTouchEnabled(false)
			slot0.edit_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		end

		slot0.figure_btn:setTouchEnabled(false)
		slot0.figure_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		slot0.storey_btn:setTouchEnabled(false)
		slot0.storey_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		slot0.back_my_btn:setTouchEnabled(false)
		slot0.back_my_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeOut:create(0.2)))
		slot0.my_output_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, -300)), cc.FadeOut:create(0.2)))
		slot0.close_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeOut:create(0.2)))
		slot0.pet_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeOut:create(0.2)))
		slot0.other_like_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, -200)), cc.FadeOut:create(0.2)))
		slot0.title_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, 200)), cc.FadeOut:create(0.2)))
		slot0.slider_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeOut:create(0.2)))
		slot0.hide_btn:setVisible(false)
		MainuiController:getInstance():setMainUIChatBubbleStatus(false)

		if slot0.cur_edit_status and slot0.my_unit_ui then
			slot0.my_unit_ui:setVisible(false)
		end

		MainuiController:getInstance():setMainUIShowStatus(false)

		if slot0.pet_unit then
			slot0.pet_unit:showPetArrow(false)
		end

		delayRun(slot0.ui_container, 0.3, function ()
			if not uv0.hide_mask then
				uv0.hide_mask = ccui.Layout:create()

				uv0.hide_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
				uv0.hide_mask:setScale(display.getMaxScale())
				uv0.hide_mask:setPositionY(display.getBottom(uv0.ui_container) - display.getBottom(uv0.root_wnd))
				uv0.hide_mask:setTouchEnabled(true)
				uv0.ui_container:addChild(uv0.hide_mask, 99)
				uv0.hide_mask:setSwallowTouches(false)
				uv0.hide_mask:addTouchEventListener(function (slot0, slot1)
					if slot1 == ccui.TouchEventType.ended then
						uv0:changeHideStatus(false)
					end
				end)
			end

			uv0.hide_mask:setVisible(true)
		end)
	else
		slot0.btn_rule:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		slot0.my_visit_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		slot0.add_friend_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		slot0.shop_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))

		if slot0.edit_btn then
			slot0.edit_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		end

		slot0.figure_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		slot0.storey_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		slot0.back_my_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(100, 0)), cc.FadeIn:create(0.2)))
		slot0.my_output_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, 300)), cc.FadeIn:create(0.2)))
		slot0.close_btn:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeIn:create(0.2)))
		slot0.pet_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeIn:create(0.2)))
		slot0.other_like_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, 200)), cc.FadeIn:create(0.2)))
		slot0.title_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(0, -200)), cc.FadeIn:create(0.2)))
		slot0.slider_panel:runAction(cc.Spawn:create(cc.MoveBy:create(0.2, cc.p(-100, 0)), cc.FadeIn:create(0.2)))
		slot0.hide_btn:setVisible(true)
		MainuiController:getInstance():setMainUIChatBubbleStatus(true)

		if slot0.cur_edit_status and slot0.my_unit_ui then
			slot0.my_unit_ui:setVisible(true)
		end

		MainuiController:getInstance():setMainUIShowStatus(true)

		if slot0.pet_unit then
			slot0.pet_unit:showPetArrow(true)
		end

		delayRun(slot0.ui_container, 0.3, function ()
			uv0.btn_rule:setTouchEnabled(true)
			uv0.my_visit_btn:setTouchEnabled(true)
			uv0.add_friend_btn:setTouchEnabled(true)
			uv0.shop_btn:setTouchEnabled(true)

			if uv0.edit_btn then
				uv0.edit_btn:setTouchEnabled(true)
			end

			uv0.figure_btn:setTouchEnabled(true)
			uv0.storey_btn:setTouchEnabled(true)
			uv0.back_my_btn:setTouchEnabled(true)
		end)

		if slot0.hide_mask then
			slot0.hide_mask:setVisible(false)
		end
	end
end

function HomeWorldScene.changeEditStatus(slot0, slot1, slot2)
	slot0.cur_edit_status = slot1

	if slot1 then
		slot0:changeUIByEditStatus(true)
	elseif slot2 then
		slot6 = false

		slot0:changeUIByEditStatus(slot6)
		slot0:updateAllFurnitureZOrder()

		for slot6, slot7 in pairs(slot0.unit_list) do
			slot7:setTranslucenceState(false)
		end
	else
		slot0.save_alert = CommonAlert.show(TI18N("是否保存本次家园编辑？"), TI18N("确定"), function ()
			uv0:changeUIByEditStatus(uv1)
			uv0:onSaveCurHomeData()
			uv0:updateAllFurnitureZOrder()
		end, TI18N("取消"), function ()
			uv0:changeUIByEditStatus(uv1)
			uv0:updateMyHome()
		end, CommonAlert.type.rich)
	end
end

function HomeWorldScene.getHomeEditStatus(slot0)
	return slot0.cur_edit_status
end

function HomeWorldScene.changeUIByEditStatus(slot0, slot1)
	slot0.slider_panel:setVisible(not slot1)
	slot0:showMyUnitUi(slot1)

	if slot1 == true then
		if slot0.edit_btn then
			slot0.edit_btn_label:setString(TI18N("退出编辑"))
			addRedPointToNodeByStatus(slot0.edit_btn, false)
		end
	elseif slot0.edit_btn then
		slot0.edit_btn_label:setString(TI18N("编辑模式"))
		addRedPointToNodeByStatus(slot0.edit_btn, uv0:getRedStatusById(HomeworldConst.Red_Index.Suit))
	end

	if slot0.figure_btn then
		if slot0.cur_home_type == HomeworldConst.Type.Myself then
			slot0.figure_btn:setVisible(not slot1)
		else
			slot0.figure_btn:setVisible(false)
		end
	end

	if slot0.storey_btn then
		if slot0.cur_home_type == HomeworldConst.Type.Preview then
			slot0.storey_btn:setVisible(false)
		else
			slot0.storey_btn:setVisible(not slot1)
		end
	end

	if slot0.my_output_panel then
		if slot0.cur_home_type == HomeworldConst.Type.Myself then
			slot0.my_output_panel:setVisible(not slot1)
		else
			slot0.my_output_panel:setVisible(false)
		end
	end

	for slot5, slot6 in pairs(slot0.unit_list) do
		slot6:changeCanEditStatus(slot1)
	end

	for slot5, slot6 in pairs(slot0.visitors_list) do
		slot6:setVisible(not slot1)
	end

	if slot0.home_role then
		if slot0.cur_home_type == HomeworldConst.Type.Preview then
			slot0.home_role:setVisible(false)
		else
			slot0.home_role:setVisible(not slot1)
		end
	end

	if slot0.pet_unit then
		if slot1 or slot0.cur_home_type == HomeworldConst.Type.Preview then
			slot0.pet_unit:setVisible(false)
		else
			slot0:checkoutPetStatus()
		end
	end
end

function HomeWorldScene.onSaveCurHomeData(slot0)
	if slot0.cur_home_type == HomeworldConst.Type.Myself then
		slot1 = slot0.cur_wall_id
		slot2 = slot0.cur_floor_id
		slot3 = {}

		for slot7, slot8 in pairs(slot0.unit_list) do
			uv0(slot3, slot8:getFurnitureBaseData())
		end

		uv1:sender26002(slot1, slot2, slot3, slot0.cur_storey_index)
	end

	slot0:changeEditStatus(false, true)
end

function HomeWorldScene.playEnterEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.root_wnd) and slot0.enter_effect == nil then
			slot0.enter_effect = createEffectSpine(Config.EffectData.data_effect_info[902], cc.p(SCREEN_WIDTH * 0.5, 0), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.enter_effect:setScale(display.getMaxScale())
			slot0.root_wnd:addChild(slot0.enter_effect, 99)
		elseif slot0.enter_effect then
			slot0.enter_effect:setToSetupPose()
			slot0.enter_effect:setAnimation(0, PlayerAction.action, false)
		end
	elseif slot0.enter_effect then
		slot0.enter_effect:clearTracks()
		slot0.enter_effect:removeFromParent()

		slot0.enter_effect = nil
	end
end

function HomeWorldScene.playCloudEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.root_wnd) and slot0.cloud_effect == nil then
			slot0.cloud_effect = createEffectSpine(Config.EffectData.data_effect_info[157], cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.cloud_effect:setScale(display.getMaxScale())
			slot0.root_wnd:addChild(slot0.cloud_effect, 99)
		elseif slot0.cloud_effect then
			slot0.cloud_effect:setToSetupPose()
			slot0.cloud_effect:setAnimation(0, PlayerAction.action_1, false)
		end
	elseif slot0.cloud_effect then
		slot0.cloud_effect:clearTracks()
		slot0.cloud_effect:removeFromParent()

		slot0.cloud_effect = nil
	end
end

function HomeWorldScene.onTouchMoveBuild(slot0, slot1, slot2)
	if not slot0.build_container then
		return
	end

	slot3, slot4 = slot0.build_container:getPosition()
	slot6 = slot4 + slot2

	if slot0.build_max_pos_x < slot3 + slot1 then
		slot5 = slot0.build_max_pos_x
	elseif slot5 < slot0.build_min_pos_x then
		slot5 = slot0.build_min_pos_x
	end

	if slot0.build_max_pos_y < slot6 then
		slot6 = slot0.build_max_pos_y
	elseif slot6 < slot0.build_min_pos_y then
		slot6 = slot0.build_min_pos_y
	end

	slot0.build_container:setPosition(cc.p(slot5, slot6))
end

function HomeWorldScene.onSliderScaleBuild(slot0, slot1)
	slot0.cur_scale_val = 1 - slot1 / 100 * SCREEN_WIDTH / HomeworldConst.Build_Width

	slot0.build_container:setScale(slot0.cur_scale_val)
	slot0:updateBuildMinMaxPos()
	slot0:adjustBuildPos()
end

function HomeWorldScene.adjustBuildPos(slot0)
	slot0:onTouchMoveBuild(0, 0)
end

function HomeWorldScene.updateBuildMinMaxPos(slot0)
	slot0.build_min_pos_x = SCREEN_WIDTH - HomeworldConst.Build_Width * slot0.cur_scale_val * 0.5
	slot0.build_max_pos_x = HomeworldConst.Build_Width * slot0.cur_scale_val * 0.5

	if display.height > HomeworldConst.Build_Height * slot0.cur_scale_val then
		slot0.build_min_pos_y = HomeworldConst.Build_Height * slot0.cur_scale_val * 0.5 - 500 * slot0.cur_scale_val
		slot0.build_max_pos_y = HomeworldConst.Build_Height * slot0.cur_scale_val * 0.5
	else
		slot0.build_min_pos_y = display.height - HomeworldConst.Build_Height * slot0.cur_scale_val * 0.5 - 500 * slot0.cur_scale_val
		slot0.build_max_pos_y = HomeworldConst.Build_Height * slot0.cur_scale_val * 0.5
	end
end

function HomeWorldScene.updateHomeBgByTime(slot0, slot1)
	if slot1 then
		if slot1 >= 6 and slot1 < 18 then
			slot0.cur_time_type = 1
		else
			slot0.cur_time_type = 2
		end
	end

	if not slot0.cur_time_type or not slot0.cur_storey_index then
		return
	end

	slot2 = uv0("resource/homeworld/background/%d/sky.jpg", slot0.cur_time_type)

	if not slot0.cur_sky_res or slot0.cur_sky_res ~= slot2 then
		slot0.cur_sky_res = slot2

		if not slot0.sky_bg then
			slot0.sky_bg = createSprite(nil, 0, 0, slot0.bg_slayer, cc.p(0, 0), LOADTEXT_TYPE)
		end

		slot0.sky_load = loadSpriteTextureFromCDN(slot0.sky_bg, slot2, ResourcesType.single, slot0.sky_load)
	end

	if not Config.HomeData.data_home_storey[slot0.cur_storey_index] then
		return
	end

	slot4 = PathTool.getHomeBuildRes(slot0.cur_time_type, slot3.res_id)

	if not slot0.cur_build_res or slot0.cur_build_res ~= slot4 then
		slot0.cur_build_res = slot4

		if not slot0.build_bg then
			slot0.build_bg = createSprite(nil, 0, 0, slot0.build_slayer, cc.p(0, 0), LOADTEXT_TYPE)
		end

		slot0.build_load = loadSpriteTextureFromCDN(slot0.build_bg, slot4, ResourcesType.single, slot0.build_load)
	end
end

function HomeWorldScene.updateHomeFloorById(slot0, slot1)
	if slot0.cur_floor_id and slot0.cur_floor_id == slot1 then
		return
	end

	if not Config.HomeData.data_home_unit(slot1) then
		return
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Discharge_Furniture_Event, slot0.cur_floor_id)

	slot0.cur_floor_id = slot1
	slot5 = {}

	uv1(slot5, {
		path = uv0("resource/homeworld/floor/%s_1.png", slot2.res),
		type = ResourcesType.single
	})
	uv1(slot5, {
		path = uv0("resource/homeworld/floor/%s_2.png", slot2.res),
		type = ResourcesType.single
	})

	if not slot0.left_floor_pic then
		slot0.left_floor_pic = createSprite(nil, HomeworldConst.Build_Width / 2 + 16, 1094, slot0.floor_slayer, cc.p(1, 0), LOADTEXT_TYPE)
	end

	if not slot0.right_floor_pic then
		slot0.right_floor_pic = createSprite(nil, HomeworldConst.Build_Width / 2 + 16, 1094, slot0.floor_slayer, cc.p(0, 0), LOADTEXT_TYPE)
	end

	if slot0.floor_load then
		slot0.floor_load:DeleteMe()

		slot0.floor_load = nil
	end

	slot0.floor_load = ResourcesLoad.New()

	slot0.floor_load:addAllList(slot5, function ()
		loadSpriteTexture(uv0.left_floor_pic, uv1, LOADTEXT_TYPE)
		loadSpriteTexture(uv0.right_floor_pic, uv2, LOADTEXT_TYPE)
	end)
	GlobalEvent:getInstance():Fire(HomeworldEvent.Add_Furniture_Event, slot1)
end

function HomeWorldScene.updateHomeWallById(slot0, slot1)
	if slot0.cur_wall_id and slot0.cur_wall_id == slot1 then
		return
	end

	if not Config.HomeData.data_home_unit(slot1) then
		return
	end

	GlobalEvent:getInstance():Fire(HomeworldEvent.Discharge_Furniture_Event, slot0.cur_wall_id)

	slot0.cur_wall_id = slot1
	slot5 = {}

	uv1(slot5, {
		path = uv0("resource/homeworld/wall/%s_1.png", slot2.res),
		type = ResourcesType.single
	})
	uv1(slot5, {
		path = uv0("resource/homeworld/wall/%s_2.png", slot2.res),
		type = ResourcesType.single
	})

	if not slot0.left_wall_pic then
		slot0.left_wall_pic = createSprite(nil, HomeworldConst.Build_Width / 2 + 15, 1412, slot0.wall_slayer, cc.p(1, 0), LOADTEXT_TYPE)
	end

	if not slot0.right_wall_pic then
		slot0.right_wall_pic = createSprite(nil, HomeworldConst.Build_Width / 2 + 15, 1412, slot0.wall_slayer, cc.p(0, 0), LOADTEXT_TYPE)
	end

	if slot0.wall_load then
		slot0.wall_load:DeleteMe()

		slot0.wall_load = nil
	end

	slot0.wall_load = ResourcesLoad.New()

	slot0.wall_load:addAllList(slot5, function ()
		loadSpriteTexture(uv0.left_wall_pic, uv1, LOADTEXT_TYPE)
		loadSpriteTexture(uv0.right_wall_pic, uv2, LOADTEXT_TYPE)
	end)
	GlobalEvent:getInstance():Fire(HomeworldEvent.Add_Furniture_Event, slot1)
end

function HomeWorldScene.updateHomeFurniture(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:deleteAllUnit()

	for slot5, slot6 in ipairs(slot1) do
		delayRun(slot0.unit_slayer, slot5 / display.DEFAULT_FPS, function ()
			uv0:createOneUnit(uv1)
		end)
	end
end

function HomeWorldScene.createOneUnit(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot3 = nil

	if type(slot1) == "number" then
		slot5 = Config.HomeData.data_home_unit(slot1)
		slot6, slot7, slot8 = slot0:getRandomPosByRange(slot5.type, slot5.dir, slot5.tile_list_1, slot5.tile_list_2)

		if slot6 and slot7 then
			slot3 = FurnitureVo.New()
			slot3.bid = slot4
			slot3.index = HomeTile.tileIndex(slot6, slot7)

			if slot8 then
				if slot5.dir == 1 then
					slot3.dir = 2
				else
					slot3.dir = 1
				end
			else
				slot3.dir = slot5.dir
			end

			slot3.config = slot5
			slot3.id = slot4 * 1000 + slot3.index
		end
	else
		slot3 = deepCopy(slot1)
	end

	if slot3 then
		slot4 = uv0(slot0.unit_pools, 1) or HomeworldFurniture.New(slot0.unit_slayer, handler(slot0, slot0._onFurnitureCallback), slot0.cur_edit_status)

		slot4:setVisible(true)
		slot4:setData(slot3, slot0.cur_edit_status, slot0.cur_scale_val)
		uv1(slot0.unit_list, slot4)
		slot0:updateAllFurnitureZOrder()

		if slot2 then
			for slot8, slot9 in pairs(slot0.unit_list) do
				slot9:updateEditStatus(false)
			end

			slot0:showUnitTouchMask(false)
			slot4:onClickFurniture()
		end

		GlobalEvent:getInstance():Fire(HomeworldEvent.Add_Furniture_Event, slot3.bid)
	end
end

function HomeWorldScene.deleteOneUnitById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.unit_list) do
		if slot6:getFurnitureId() == slot1 then
			slot6:setVisible(false)
			slot6:suspendAllActions()
			uv0(slot0.unit_pools, slot6)
			uv1(slot0.unit_list, slot5)

			break
		end
	end
end

function HomeWorldScene.deleteAllUnit(slot0)
	for slot5 = #slot0.unit_list, 1, -1 do
		if slot0.unit_list[slot5] then
			slot6:setVisible(false)
			slot6:suspendAllActions()
			uv0(slot0.unit_pools, slot6)
			uv1(slot0.unit_list, slot5)
		end
	end
end

function HomeWorldScene._onFurnitureCallback(slot0, slot1, slot2)
	if slot1 == 1 then
		for slot6, slot7 in pairs(slot0.unit_list) do
			slot7:updateEditStatus(false)
		end

		slot0:showUnitTouchMask(false)
	elseif slot1 == 2 then
		slot0:updateAllFurnitureZOrder()
	elseif slot1 == 3 and slot2 then
		slot0:deleteOneUnitById(slot2)
	elseif slot1 == 4 then
		slot0:showUnitTouchMask(slot2)
	end
end

function HomeWorldScene.showUnitTouchMask(slot0, slot1)
	if slot1 == true then
		if not slot0.unit_touch_mask then
			slot0.unit_touch_mask = ccui.Layout:create()

			slot0.unit_touch_mask:setAnchorPoint(cc.p(0, 0))
			slot0.unit_touch_mask:setSwallowTouches(true)
			slot0.unit_touch_mask:setPosition(cc.p(0, 0))
			slot0.unit_touch_mask:setContentSize(SCREEN_WIDTH * 2, SCREEN_HEIGHT)
			slot0.unit_touch_mask:setTouchEnabled(true)
			slot0.unit_slayer:addChild(slot0.unit_touch_mask, 98)
			slot0.unit_touch_mask:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					for slot5, slot6 in pairs(uv0.unit_list) do
						slot6:updateEditStatus(false)
					end

					uv0:showUnitTouchMask(false)
				end
			end)
		end

		slot5 = true

		slot0.unit_touch_mask:setVisible(slot5)

		for slot5, slot6 in pairs(slot0.unit_list) do
			slot6:setTranslucenceState(true)
		end
	elseif slot0.unit_touch_mask then
		slot5 = false

		slot0.unit_touch_mask:setVisible(slot5)

		for slot5, slot6 in pairs(slot0.unit_list) do
			slot6:setTranslucenceState(false)
		end
	end
end

function HomeWorldScene.checkCurHomeIsHaveUnitByBid(slot0, slot1)
	slot2 = false

	for slot6, slot7 in pairs(slot0.unit_list) do
		if slot7:getFurnitureBid() == slot1 then
			slot2 = true

			break
		end
	end

	if not slot2 and (slot1 == slot0.cur_wall_id or slot1 == slot0.cur_floor_id) then
		slot2 = true
	end

	return slot2
end

function HomeWorldScene.getCurHomeSoftVal(slot0)
	slot1 = 0
	slot3 = {}

	if Config.HomeData.data_home_unit(slot0.cur_wall_id) then
		uv0({}, {
			bid = slot5.bid,
			num = 1,
			cfg = slot5
		})
		function (slot0)
			if slot0.set_id and slot0.set_id > 0 then
				slot1 = false

				for slot5, slot6 in pairs(uv0) do
					if slot0.set_id == slot6.set_id then
						slot1 = true
						slot7 = true

						for slot11, slot12 in pairs(slot6.item_list) do
							if slot0.bid == slot12 then
								slot7 = false

								break
							end
						end

						if slot7 then
							slot6.num = slot6.num + 1

							uv1(slot6.item_list, slot0.bid)
						end

						break
					end
				end

				if not slot1 then
					slot2 = {
						set_id = slot0.set_id,
						num = 1,
						cfg = Config.HomeData.data_suit_soft[slot0.set_id],
						item_list = {}
					}

					uv1(slot2.item_list, slot0.bid)
					uv1(uv0, slot2)
				end
			end
		end(slot5)
	end

	if Config.HomeData.data_home_unit(slot0.cur_floor_id) then
		uv0(slot2, {
			bid = slot6.bid,
			num = 1,
			cfg = slot6
		})
		slot4(slot6)
	end

	for slot10, slot11 in pairs(slot0.unit_list) do
		if Config.HomeData.data_home_unit(slot11:getFurnitureBid()) then
			slot14 = false

			for slot18, slot19 in pairs(slot2) do
				if slot19.bid == slot13.bid then
					slot14 = true
					slot19.num = slot19.num + 1

					break
				end
			end

			if not slot14 then
				uv0(slot2, {
					bid = slot13.bid,
					num = 1,
					cfg = slot13
				})
			end

			slot4(slot13)
		end
	end

	for slot10, slot11 in pairs(slot2) do
		slot11.cal_soft = slot11.cfg.soft * math.min(slot11.cfg.effect_count, slot11.num)
		slot1 = slot1 + slot11.cal_soft
	end

	for slot10, slot11 in pairs(slot3) do
		slot12, slot13 = nil

		for slot17, slot18 in pairs(slot11.cfg) do
			if slot17 <= slot11.num and (not slot12 or slot12 > slot11.num - slot17) then
				slot12 = slot11.num - slot17
				slot13 = slot17
			end
		end

		if slot13 then
			slot11.cfg = slot11.cfg[slot13]
			slot1 = slot1 + slot11.cfg.all_soft
		end
	end

	return slot1
end

function HomeWorldScene.getCurOccupyGridNum(slot0)
	for slot5, slot6 in pairs(slot0.unit_list) do
		if slot6:getFurnitureType() ~= HomeworldConst.Unit_Type.WallAcc and slot6:getFurnitureType() ~= HomeworldConst.Unit_Type.Carpet then
			slot1 = 0 + slot6:getOccupyGridNum()
		end
	end

	return slot1
end

function HomeWorldScene.updateAllFurnitureZOrder(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.unit_list) do
		uv0(slot1, slot6)
	end

	slot5 = slot0.home_role

	uv0(slot1, slot5)

	for slot5, slot6 in pairs(slot0.visitors_list) do
		uv0(slot1, slot6)
	end

	uv0(slot1, slot0.pet_unit)
	table.sort(slot1, function (slot0, slot1)
		slot2, slot3 = slot0:getCurGridPos()
		slot4, slot5 = slot1:getCurGridPos()

		if slot3 == slot5 then
			return slot2 < slot4
		else
			return slot5 < slot3
		end
	end)

	for slot7, slot8 in ipairs(slot1) do
		slot8:setLocalZOrder(1 + 1)
	end
end

function HomeWorldScene.getRandomPosByRange(slot0, slot1, slot2, slot3, slot4)
	if slot1 == HomeworldConst.Unit_Type.Carpet then
		uv0:updateOccupyGridList(nil, 2)
	else
		uv0:updateOccupyGridList(nil, 1)
	end

	slot5, slot6 = nil
	slot7 = false
	slot8 = false

	if slot1 == HomeworldConst.Unit_Type.Furniture or slot1 == HomeworldConst.Unit_Type.Carpet then
		if slot0:checkOccGridIsFull(slot1, #slot3) then
			message(TI18N("地面格子数将超过可使用上限，无法新增家具"))

			return
		end

		slot5, slot6, slot11 = slot0:checkLandUnitGrid(11, 41, slot3)

		if not slot11 then
			slot5, slot6, slot7 = slot0:checkLandUnitGrid(11, 41, slot4)
			slot8 = true
		end
	elseif slot1 == HomeworldConst.Unit_Type.WallAcc then
		slot5 = 1
		slot6 = 57
		slot9 = HOME_TILE_TYPE_L_WALL

		if slot2 == 2 then
			slot9 = HOME_TILE_TYPE_R_WALL
		end

		slot5, slot6, slot12 = slot0:checkWallUnitGrid(slot5, slot6, slot3, slot9)

		if not slot12 then
			slot5, slot6, slot7 = slot0:checkWallUnitGrid(11, 57, slot4, (slot9 ~= HOME_TILE_TYPE_L_WALL or HOME_TILE_TYPE_R_WALL) and HOME_TILE_TYPE_L_WALL)
			slot8 = true
		end
	end

	if not slot7 then
		message(TI18N("找不到合适的位置"))

		return
	end

	return slot5, slot6, slot8
end

function HomeWorldScene.checkLandUnitGrid(slot0, slot1, slot2, slot3)
	slot4 = false

	for slot8 = 1, 21 do
		for slot12 = 1, 40 do
			if uv0:checkGridWalkType(slot1, slot2) == HOME_TILE_TYPE_LAND then
				slot13 = HomeTile.tilesOffset(slot1, slot2, slot3)

				if slot0:checkRandomGridCanUse(slot1, slot2, slot3, HOME_TILE_TYPE_LAND) == false then
					slot2 = slot2 - 1
				else
					slot4 = true

					break
				end
			else
				slot2 = slot2 - 1
			end
		end

		if slot4 == false then
			if slot1 - 1 < 1 then
				slot1 = 21
			end

			slot2 = 41
		else
			break
		end
	end

	return slot1, slot2, slot4
end

function HomeWorldScene.checkWallUnitGrid(slot0, slot1, slot2, slot3, slot4)
	slot5 = false

	for slot9 = 1, 11 do
		for slot13 = 1, 35 do
			if uv0:checkGridWalkType(slot1, slot2) == slot4 then
				slot14 = HomeTile.tilesOffset(slot1, slot2, slot3)

				if slot0:checkRandomGridCanUse(slot1, slot2, slot3, slot4) == false then
					slot2 = slot2 - 1
				else
					slot5 = true

					break
				end
			else
				slot2 = slot2 - 1
			end
		end

		if slot5 == false then
			slot1 = slot1 + 1
			slot2 = 57
		else
			break
		end
	end

	return slot1, slot2, slot5
end

function HomeWorldScene.checkOccGridIsFull(slot0, slot1, slot2)
	slot3 = false
	slot2 = slot2 or 0

	for slot8, slot9 in pairs(slot0.unit_list) do
		if slot9:getFurnitureType() ~= HomeworldConst.Unit_Type.WallAcc and (slot1 == HomeworldConst.Unit_Type.Carpet and slot9:checkIsCarpet() or slot1 ~= HomeworldConst.Unit_Type.Carpet and not slot9:checkIsCarpet()) then
			slot4 = 0 + slot9:getOccupyGridNum()
		end
	end

	if Config.HomeData.data_const.floor_effective_area_limit and slot5.val < slot4 + slot2 then
		slot3 = true
	end

	return slot3
end

function HomeWorldScene.checkRandomGridCanUse(slot0, slot1, slot2, slot3, slot4)
	slot6 = true

	for slot10, slot11 in pairs(HomeTile.tilesOffset(slot1, slot2, slot3)) do
		if not uv0:checkGridIsCanWalk(slot11[1], slot11[2], slot4) then
			slot6 = false
		end

		if slot6 == false then
			break
		end
	end

	return slot6
end

function HomeWorldScene.updateHomeRole(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.home_role then
		slot0.home_role = HomeworldRole.New(slot0.unit_slayer)
	end

	if slot0.cur_home_type == HomeworldConst.Type.Myself then
		slot3 = RoleController:getInstance():getRoleVo()
	else
		slot2.rid = slot0.other_rid
		slot2.srv_id = slot0.other_srv_id
		slot2.name = slot0.owner_name
	end

	slot0.home_role:setVisible(true)
	slot0.home_role:setData({
		look_id = slot1,
		rid = slot3.rid,
		srv_id = slot3.srv_id,
		name = ""
	}, slot0.cur_home_type == HomeworldConst.Type.Myself, true)
end

function HomeWorldScene.updateVisitorsList(slot0, slot1)
	for slot5 = #slot0.visitors_list, 1, -1 do
		slot6 = uv0(slot0.visitors_list, slot5)

		slot6:setVisible(false)
		uv1(slot0.visitors_pool_list, slot6)
	end

	slot2 = slot0.cur_home_type == HomeworldConst.Type.Myself

	for slot6, slot7 in ipairs(slot1) do
		delayRun(slot0.unit_slayer, slot6 * 2 / display.DEFAULT_FPS, function ()
			if not uv0(uv1.visitors_pool_list, 1) then
				HomeworldRole.New(uv1.unit_slayer):setCanMoveRoleStatus(uv2)
			end

			uv3(uv1.visitors_list, slot0)
			slot0:setData(uv4, uv2)
			slot0:setVisible(true)

			if uv5 == #uv6 then
				uv1:updateAllFurnitureZOrder()
			end
		end)
	end
end

function HomeWorldScene.showPetUnit(slot0, slot1, slot2)
	if slot1 == true and slot2 then
		if not slot0.pet_unit then
			slot0.pet_unit = HomeworldPet.New(slot0.unit_slayer)
		end

		slot0.pet_unit:setData(slot2)
		slot0:checkoutPetStatus()
	elseif slot0.pet_unit then
		slot0.pet_unit:setVisible(false)
	end
end

function HomeWorldScene.checkoutPetStatus(slot0)
	if not slot0.pet_unit then
		return
	end

	if slot0.cur_home_type == HomeworldConst.Type.Myself then
		if slot0.homepet_vo then
			if slot0.homepet_vo:getPetState() == HomepetConst.state_type.eNotActive or slot1 == HomepetConst.state_type.eOnWay then
				slot0.pet_unit:setVisible(false)
			elseif slot1 == HomepetConst.state_type.eHome then
				slot0.pet_unit:setVisible(true)
			end
		else
			slot0.pet_unit:setVisible(true)
		end
	else
		slot0.pet_unit:setVisible(false)
	end
end

function HomeWorldScene.updateHomePetTalk(slot0, slot1)
	if not slot1 then
		return
	end

	if Config.HomePetData.data_interaction_info[slot1.id] and slot2.type == 1 and slot0.pet_unit then
		slot0.pet_unit:setPetTalkInfo(slot2.desc)
	end
end

function HomeWorldScene.showMyUnitUi(slot0, slot1)
	if slot1 == true then
		if not slot0.my_unit_ui then
			slot0.my_unit_ui = HomeworldMyUnit.New(slot0.ui_container)
		end

		slot0.my_unit_ui:setVisible(true)
		slot0.my_unit_ui:open()
	elseif slot0.my_unit_ui then
		slot0.my_unit_ui:setVisible(false)
	end
end

function HomeWorldScene.getOccupyGridList(slot0, slot1, slot2)
	slot3 = {}
	slot4 = true
	slot5 = true
	slot6 = true

	for slot10, slot11 in pairs(slot1 or {}) do
		if slot11[1] == HomeworldConst.Scene_Unit_Type.Furniture and slot11[2] == nil then
			slot4 = false
		elseif slot11[1] == HomeworldConst.Scene_Unit_Type.Role and slot11[2] == nil then
			slot5 = false
		elseif slot11[1] == HomeworldConst.Scene_Unit_Type.Pet and slot11[2] == nil then
			slot6 = false
		end
	end

	function slot7(slot0, slot1)
		slot2 = true

		for slot6, slot7 in pairs(uv0) do
			if slot7[1] == slot0 and slot7[2] == slot1 then
				slot2 = false

				break
			end
		end

		return slot2
	end

	if slot4 then
		for slot11, slot12 in pairs(slot0.unit_list) do
			if (not slot2 or slot2 == 1 and not slot12:checkIsCarpet() or slot2 == 2 and slot12:checkIsCarpet()) and slot7(HomeworldConst.Scene_Unit_Type.Furniture, slot12:getFurnitureId()) then
				for slot17, slot18 in pairs(slot12:getOccupyGridList()) do
					uv0(slot3, slot18)
				end
			end
		end
	end

	if slot5 then
		if slot0.home_role and slot7(HomeworldConst.Scene_Unit_Type.Role, slot0.home_role:getSoleId()) then
			for slot12, slot13 in pairs(slot0.home_role:getOccupyGridList()) do
				uv0(slot3, slot13)
			end
		end

		if slot0.pet_unit then
			for slot12, slot13 in pairs(slot0.pet_unit:getOccupyGridList()) do
				uv0(slot3, slot13)
			end
		end

		for slot11, slot12 in pairs(slot0.visitors_list) do
			if slot12:isVisible() and slot7(HomeworldConst.Scene_Unit_Type.Role, slot12:getSoleId()) then
				for slot17, slot18 in pairs(slot12:getOccupyGridList()) do
					uv0(slot3, slot18)
				end
			end
		end
	end

	return slot3
end

function HomeWorldScene.getAllRoleCurGridData(slot0)
	slot2, slot3 = slot0.home_role:getCurGridPos()
	slot7 = {
		slot2,
		slot3
	}

	uv0({}, slot7)

	for slot7, slot8 in pairs(slot0.visitors_list) do
		if slot8:isVisible() then
			slot9, slot10 = slot8:getCurGridPos()

			uv0(slot1, {
				slot9,
				slot10
			})
		end
	end

	return slot1
end

function HomeWorldScene.updateRedBtnStatus(slot0, slot1, slot2)
	if slot1 == HomeworldConst.Red_Index.Visit then
		addRedPointToNodeByStatus(slot0.my_visit_btn, uv0:getRedStatusById(HomeworldConst.Red_Index.Visit))
	elseif slot1 == HomeworldConst.Red_Index.Suit then
		if slot0.edit_btn then
			addRedPointToNodeByStatus(slot0.edit_btn, uv0:getRedStatusById(HomeworldConst.Red_Index.Suit))
		end
	elseif slot1 == HomeworldConst.Red_Index.Hook then
		if slot0.hook_time_award then
			slot0.hook_time_award:setRedStatus(uv0:getRedStatusById(HomeworldConst.Red_Index.Hook))
		end
	else
		addRedPointToNodeByStatus(slot0.my_visit_btn, uv0:getRedStatusById(HomeworldConst.Red_Index.Visit))

		if slot0.edit_btn then
			addRedPointToNodeByStatus(slot0.edit_btn, uv0:getRedStatusById(HomeworldConst.Red_Index.Suit))
		end

		if slot0.hook_time_award then
			slot0.hook_time_award:setRedStatus(uv0:getRedStatusById(HomeworldConst.Red_Index.Hook))
		end
	end
end

function HomeWorldScene.close_callback(slot0)
	slot0:showHomeSceneScaleAni(false)
	slot0:playEnterEffect(false)
	slot0:playCloudEffect(false)
	slot0.root_wnd:stopAllActions()

	if slot0.homepet_vo then
		if slot0.home_pet_vo_attt_event ~= nil then
			slot0.homepet_vo:UnBind(slot0.home_pet_vo_attt_event)

			slot0.home_pet_vo_attt_event = nil
		end

		slot0.homepet_vo = nil
	end

	if slot0.set_name_alert then
		slot0.set_name_alert:close()

		slot0.set_name_alert = nil
	end

	if slot0.sky_load then
		slot0.sky_load:DeleteMe()

		slot0.sky_load = nil
	end

	if slot0.build_load then
		slot0.build_load:DeleteMe()

		slot0.build_load = nil
	end

	if slot0.wall_load then
		slot0.wall_load:DeleteMe()

		slot0.wall_load = nil
	end

	if slot0.floor_load then
		slot0.floor_load:DeleteMe()

		slot0.floor_load = nil
	end

	for slot4, slot5 in pairs(slot0.visitors_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.visitors_pool_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.pet_unit then
		slot0.pet_unit:DeleteMe()

		slot0.pet_unit = nil
	end

	if slot0.home_role then
		slot0.home_role:DeleteMe()

		slot0.home_role = nil
	end

	for slot4, slot5 in pairs(slot0.unit_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.unit_pools) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.save_alert then
		slot0.save_alert:DeleteMe()

		slot0.save_alert = nil
	end

	if slot0.my_unit_ui then
		slot0.my_unit_ui:DeleteMe()

		slot0.my_unit_ui = nil
	end

	AudioManager:getInstance():playMusic(AudioManager.AUDIO_TYPE.SCENE, "s_002", true)
	MainuiController:getInstance():setMainUIShowStatus(true)
	uv0:clearHomeCacheData()
	uv1:openHomeworldScene(false)
	uv1:openHomeworldSuitWindow(false)
	HomepetController:getInstance():getModel():checkHomeWorldRedpoint()
end
