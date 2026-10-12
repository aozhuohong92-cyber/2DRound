PlanesafkMainWindow = PlanesafkMainWindow or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil
slot6 = math.floor

function PlanesafkMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.layout_name = "planesafk/planesafk_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_map"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.dic_map_list = {}
	slot0.max_floor = 3

	if Config.PlanesData.data_const.max_floor then
		slot0.max_floor = slot1.val
	end

	slot0.difficult_limit_lev = 30

	if Config.PlanesData.data_const.planes_difficult_limit_lev then
		slot0.difficult_limit_lev = slot2.val
	end

	slot0.planes_difficult_max_power = 300000

	if Config.PlanesData.data_const.planes_difficult_max_power then
		slot0.planes_difficult_max_power = slot3.val
	end

	slot0.planes_first_time_tips = {}

	if Config.PlanesData.data_const.planes_first_time_tips then
		slot0.planes_first_time_tips = slot4.val

		if type(slot0.planes_first_time_tips) == "number" then
			slot0.planes_first_time_tips = {}
		end
	end

	slot0.door_item_list = {}
	slot0.door_item_load = {}
	slot0.door_res_id = {
		"E27531",
		"E27532"
	}
	slot0.show_item_id = {
		[Config.ItemData.data_assets_label2id.expedition_medal] = true,
		[Config.ItemData.data_assets_label2id.coin] = true
	}
end

function PlanesafkMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("planes", "planes_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.map_container = slot0.root_wnd:getChildByName("map_container")
	slot0.ui_container = slot0.root_wnd:getChildByName("ui_container")
	slot0.container_size = slot0.ui_container:getContentSize()
	slot0.close_btn = slot0.ui_container:getChildByName("close_btn")

	slot0.close_btn:getChildByName("label"):setString(TI18N("返回"))

	slot0.dun_btn = slot0.ui_container:getChildByName("dun_btn")

	slot0.dun_btn:getChildByName("label"):setString(TI18N("副本信息"))

	slot0.fight_btn = slot0.ui_container:getChildByName("fight_btn")

	slot0.fight_btn:getChildByName("label"):setString(TI18N("征战之证"))

	slot0.figure_btn = slot0.ui_container:getChildByName("figure_btn")

	slot0.figure_btn:getChildByName("label"):setString(TI18N("更换形象"))
	slot0.figure_btn:setVisible(false)

	slot0.active_btn = slot0.ui_container:getChildByName("active_btn")

	if slot0.active_btn then
		slot0.active_btn:getChildByName("label"):setString(TI18N("长环岛迷踪"))
		slot0.active_btn:setVisible(false)

		slot0.active_time_val = slot0.active_btn:getChildByName("time_val_0")
	end

	slot0.btn_rule = slot0.ui_container:getChildByName("btn_rule")
	slot0.btn_hide = slot0.ui_container:getChildByName("btn_hide")
	slot0.bottom_panel = slot0.ui_container:getChildByName("bottom_panel")
	slot0.bag_btn = slot0.bottom_panel:getChildByName("bag_btn")
	slot0.hero_btn = slot0.bottom_panel:getChildByName("hero_btn")
	slot0.buff_btn = slot0.bottom_panel:getChildByName("buff_btn")
	slot0.shop_btn = slot0.bottom_panel:getChildByName("shop_btn")
	slot0.tip_btn = slot0.bottom_panel:getChildByName("tip_btn")
	slot0.tip_key_0 = slot0.bottom_panel:getChildByName("tip_key_0")
	slot0.Image_21 = slot0.bottom_panel:getChildByName("Image_21")

	slot0.tip_key_0:setString(TI18N("首次通关"))

	slot0.shadow_bg_1 = slot0.ui_container:getChildByName("shadow_bg_1")
	slot0.shadow_bg_2 = slot0.ui_container:getChildByName("shadow_bg_2")
	slot0.box_2017 = slot0.ui_container:getChildByName("box_2017")
	slot0.tip_key = slot0.box_2017:getChildByName("tip_key")

	slot0.tip_key:setString(TI18N("本轮已获:"))

	slot0.reward_list = {
		createRichLabel(24, cc.c4b(111, 242, 129, 255), cc.p(0, 0.5), cc.p(10, 70), nil, , 600)
	}
	slot5 = cc.c4b(111, 242, 129, 255)
	slot6 = cc.p(0, 0.5)
	slot0.reward_list[2] = createRichLabel(24, slot5, slot6, cc.p(10, 30), nil, , 600)

	slot0.box_2017:addChild(slot0.reward_list[1])
	slot0.box_2017:addChild(slot0.reward_list[2])

	for slot5, slot6 in ipairs({
		{
			num = 0,
			base_id = Config.ItemData.data_assets_label2id.expedition_medal
		},
		{
			num = 0,
			base_id = Config.ItemData.data_assets_label2id.coin
		}
	}) do
		if Config.ItemData.data_get_data(slot6.base_id) and slot0.reward_list[slot5] then
			slot0.reward_list[slot5]:setString(uv0("<img src='%s' scale=0.3 />  %s", PathTool.getItemRes(slot7.icon), MoneyTool.GetMoneyString(slot6.num)))
		end
	end

	slot0.top_title_bg = slot0.ui_container:getChildByName("top_title_bg")
	slot0.floor_txt = slot0.top_title_bg:getChildByName("floor_txt")
	slot0.time_val = slot0.top_title_bg:getChildByName("time_val")

	MainuiController:getInstance():setIsShowMainUIBottom(false)
	slot0:adaptationScreen()
end

function PlanesafkMainWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.ui_container)

	slot0.shadow_bg_1:setPositionY(display.getBottom(slot0.ui_container))
	slot0.shadow_bg_2:setPositionY(slot1)
	slot0.top_title_bg:setPositionY(slot1 - (slot0.container_size.height - slot0.top_title_bg:getPositionY()))
	slot0.close_btn:setPositionY(slot1 - (slot0.container_size.height - slot0.close_btn:getPositionY()))
	slot0.dun_btn:setPositionY(slot1 - (slot0.container_size.height - slot0.dun_btn:getPositionY()))
	slot0.figure_btn:setPositionY(slot1 - (slot0.container_size.height - slot0.figure_btn:getPositionY()))
	slot0.btn_rule:setPositionY(slot1 - (slot0.container_size.height - slot0.btn_rule:getPositionY()))
	slot0.btn_hide:setPositionY(slot1 - (slot0.container_size.height - slot0.btn_hide:getPositionY()))
	slot0.box_2017:setPositionY(slot1 - (slot0.container_size.height - slot0.box_2017:getPositionY()))
	slot0.fight_btn:setPositionY(slot1 - (slot0.container_size.height - slot0.fight_btn:getPositionY()))

	if slot0.active_btn then
		slot0.active_btn:setPositionY(slot1 - (slot0.container_size.height - slot0.active_btn:getPositionY()))
	end

	slot0.bottom_panel:setPositionY(slot2 + slot0.bottom_panel:getPositionY())

	slot0.ext_height = slot1 - slot0.container_size.height - slot2
end

function PlanesafkMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.dun_btn, handler(slot0, slot0.onClickDunBtn), true)
	registerButtonEventListener(slot0.btn_hide, handler(slot0, slot0.onClickHideBtn), true)
	registerButtonEventListener(slot0.bag_btn, handler(slot0, slot0.onClickBagBtn), true)
	registerButtonEventListener(slot0.hero_btn, handler(slot0, slot0.onClickHeroBtn), true)
	registerButtonEventListener(slot0.buff_btn, handler(slot0, slot0.onClickBuffBtn), true)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true)
	registerButtonEventListener(slot0.figure_btn, handler(slot0, slot0.onClickFigureBtn), true)
	registerButtonEventListener(slot0.fight_btn, handler(slot0, slot0.onClickFightBtn), true)
	registerButtonEventListener(slot0.active_btn, handler(slot0, slot0.onActiveBtn), true)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.PlanesData.data_const.planes_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, false, 1)
	registerButtonEventListener(slot0.tip_btn, function (slot0, slot1, slot2)
		if Config.PlanesData.data_const.planes_first_time_tips then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, false, 1)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Main_Base_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.base_data = slot0

		uv0:setData()
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Main_Map_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.map_data = slot0

		uv0:initMapData(slot0)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Update_Map_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:initMapData(slot0, is_update)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Chose_Buff_Event, function (slot0, slot1)
		uv0:showBuffItemMoveAni(slot0, slot1)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Pass_Reward_Info_Event, function (slot0)
		if uv0.map_data then
			uv0.map_data.is_reward = 1

			uv0:updateBoxInfo()
		end
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Last_Reward_Info_Event, function (slot0)
		if uv0.map_data then
			uv0.map_data.is_can_reward = slot0.is_can_reward
			uv0.map_data.is_reward = slot0.is_reward

			uv0:updateBoxInfo()
		end
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Next_Map_Info_Event, function (slot0)
		uv0:sender28603()
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Update_Get_Reward_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateRewardInfo(slot0)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_Create_Role_Event, function (slot0)
		if uv0.map_role == nil then
			uv0:showRoleInfo()
		end
	end)
	slot0:addGlobalEvent(HomeworldEvent.Update_My_Home_Figure_Event, function ()
		slot0 = HomeworldController:getInstance():getModel():getMyCurHomeFigureId()

		uv0:setPlanesRoleLookId(slot0)
		uv1:showRoleInfo(slot0)
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_OrderAction_Init_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateOrderactionRed()
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Planesafk_OrderAction_First_Red_Event, function ()
		uv0:updateOrderactionRed()
	end)
	slot0:addGlobalEvent(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
		if not slot0 then
			return
		end

		if slot0.bid == ActionRankCommonType.planes_rank then
			uv0:setPanelData(slot0)
		end
	end)
end

function PlanesafkMainWindow.setPanelData(slot0, slot1)
	if slot0.active_btn then
		slot0.active_btn:setVisible(true)

		if (slot1.remain_sec or 0) - 86400 <= 0 then
			slot2 = 0
		end

		commonCountDownTime(slot0.active_time_val, slot2, {
			callback = function (slot0)
				uv0:setTimeFormatString(slot0)
			end
		})
	end
end

function PlanesafkMainWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.active_time_val:setString(TimeTool.GetTimeForFunction(slot1))
	else
		slot0.active_time_val:setString(TI18N("已结束"))
	end
end

function PlanesafkMainWindow.onActiveBtn(slot0)
	MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.planes_rank)
end

function PlanesafkMainWindow.onClickFightBtn(slot0)
	uv0:openPlanesafkOrderactionWindow(true)
end

function PlanesafkMainWindow.onClickHideBtn(slot0)
	slot0.is_hide_top = not slot0.is_hide_top

	MainuiController:getInstance():setMainUIShowStatus(not slot0.is_hide_top)
	MainuiController:getInstance():setIsShowMainUIBottom(false)
	slot0.top_title_bg:setVisible(not slot0.is_hide_top)
	slot0.btn_rule:setVisible(not slot0.is_hide_top)
	slot0.btn_hide:setVisible(not slot0.is_hide_top)
	slot0.close_btn:setVisible(not slot0.is_hide_top)
	slot0.box_2017:setVisible(not slot0.is_hide_top)
	slot0.bottom_panel:setVisible(not slot0.is_hide_top)
	slot0.figure_btn:setVisible(not slot0.is_hide_top)

	if uv0:isHolidayOpen() and slot0.active_btn then
		slot0.active_btn:setVisible(not slot0.is_hide_top)
	end

	if slot0.is_hide_top == false then
		slot0.fight_btn:setVisible(uv0.getOrderIsShow())
	else
		slot0.fight_btn:setVisible(not slot0.is_hide_top)
	end

	if slot0.is_hide_top then
		if not slot0.hide_mask then
			slot0.hide_mask = ccui.Layout:create()

			slot0.hide_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
			slot0.hide_mask:setScale(display.getMaxScale())
			slot0.hide_mask:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.hide_mask:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
			slot0.hide_mask:setTouchEnabled(true)
			slot0.ui_container:addChild(slot0.hide_mask, 99)
			slot0.hide_mask:setSwallowTouches(false)
			slot0.hide_mask:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					uv0:onClickHideBtn()
				end
			end)
		end

		slot0.hide_mask:setVisible(true)
	elseif slot0.hide_mask then
		slot0.hide_mask:setVisible(false)
	end
end

function PlanesafkMainWindow.onClickCloseBtn(slot0)
	uv0:openPlanesafkMainWindow(false)
end

function PlanesafkMainWindow.onClickBagBtn(slot0)
	uv0:openPlanesafkItemUsePanel(true)
end

function PlanesafkMainWindow.onClickHeroBtn(slot0)
	uv0:openPlanesafkHeroListPanel(true)
end

function PlanesafkMainWindow.onClickBuffBtn(slot0)
	uv0:openPlanesafkBuffListPanel(true)
end

function PlanesafkMainWindow.onClickShopBtn(slot0)
	MallController:getInstance():openMallPanel(true, MallConst.MallType.FriendShop)
end

function PlanesafkMainWindow.onClickFigureBtn(slot0)
	if not slot0.base_data then
		return
	end

	if not uv0:getPlanesRoleLookId() or slot1 == 0 then
		slot3 = 70

		if Config.HomeData.data_const.open_lev then
			slot3 = slot2.val or 70
		end

		message(uv1(TI18N("%s级开启家园系统，开启后才可更换Q版冒险形象哦~"), slot3))
	else
		HomeworldController:getInstance():openHomeworldFigureWindow(true)
	end
end

function PlanesafkMainWindow.onClickBoxBtn(slot0)
	if not slot0.map_data then
		return
	end

	if slot0.map_data.is_can_reward == 1 then
		uv0:sender28605(slot0.map_data.floor)

		if slot0.box_effect then
			slot0.box_effect:setAnimation(0, PlayerAction.action_3, false)
		end
	end
end

function PlanesafkMainWindow.onClickHardBtn(slot0, slot1)
	if not slot0.map_data then
		return
	end

	slot3 = RoleController:getInstance():getRoleVo()

	if slot0.map_data.floor and slot0.map_data.floor > 1 and slot3 and slot0.planes_difficult_max_power <= slot3.power and slot0.difficult_limit_lev <= StartowerController:getInstance():getModel():getNowTowerId() then
		uv0:openPlanesafkChooseDifficultyPanel(true, {
			floor = slot0.map_data.floor + 1
		})
	else
		uv0:sender28604(slot0.map_data.floor + 1, 1)
	end
end

function PlanesafkMainWindow.updateRewardInfo(slot0, slot1)
	if not slot0.show_item_id then
		return
	end

	if slot1.item_list and next(slot1.item_list) ~= nil then
		slot2 = {}

		for slot6, slot7 in ipairs(slot1.item_list) do
			if slot0.show_item_id[slot7.base_id] then
				uv0(slot2, slot7)
			end
		end

		function slot6(slot0, slot1)
			return slot1.base_id < slot0.base_id
		end

		uv1(slot2, slot6)

		for slot6, slot7 in ipairs(slot2) do
			if Config.ItemData.data_get_data(slot7.base_id) and slot0.reward_list[slot6] then
				slot0.reward_list[slot6]:setString(uv2("<img src='%s' scale=0.3 />  %s", PathTool.getItemRes(slot8.icon), MoneyTool.GetMoneyString(slot7.num)))
			end
		end
	end
end

function PlanesafkMainWindow.isLockPlanesMapScreen(slot0, slot1)
	if slot1 == true then
		if not slot0.lock_mask then
			slot2 = slot0.ui_container:getContentSize()
			slot0.lock_mask = ccui.Layout:create()

			slot0.lock_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
			slot0.lock_mask:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.lock_mask:setScale(display.getMaxScale())
			slot0.lock_mask:setPosition(slot2.width * 0.5, slot2.height * 0.5)
			slot0.lock_mask:setTouchEnabled(true)
			slot0.lock_mask:setSwallowTouches(true)
			slot0.ui_container:addChild(slot0.lock_mask, 10)
		end

		slot0.lock_mask:setVisible(true)
	elseif slot0.lock_mask then
		slot0.lock_mask:setVisible(false)
	end
end

function PlanesafkMainWindow.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}

	uv0:sender28602()
	uv0:sender28603()
	uv0:sender28613()
	uv0:sender28625()
	uv1:setPlanesafkLoginRedpointFalse()
end

function PlanesafkMainWindow.setVisible(slot0, slot1)
	slot0.is_visible = slot1

	if slot0.root_wnd == nil or tolua.isnull(slot0.root_wnd) then
		return
	end

	slot0.root_wnd:setVisible(slot1)

	if slot1 == true then
		MainuiController:getInstance():setIsShowMainUIBottom(false)
	else
		MainuiController:getInstance():setIsShowMainUIBottom(true)
	end
end

function PlanesafkMainWindow.setData(slot0)
	if not uv0:getPlanesRoleLookId() or slot1 == 0 then
		setChildUnEnabled(true, slot0.figure_btn)
	else
		setChildUnEnabled(false, slot0.figure_btn)
	end

	commonCountDownTime(slot0.time_val, slot0.base_data.update_time - GameNet:getInstance():getTime(), {
		end_title = TI18N("后重置")
	})
	slot0.fight_btn:setVisible(uv0.getOrderIsShow())
	slot0:updateOrderactionRed()

	if uv0:isHolidayOpen() then
		ActionController:getInstance():cs16603(ActionRankCommonType.planes_rank)

		if not uv0.getOrderIsShow() and slot0.active_btn then
			slot0.active_btn:setPositionY(slot0.fight_btn:getPositionY())
		end
	end
end

function PlanesafkMainWindow.getMapEvtData(slot0, slot1, slot2)
	if slot1 and slot2 and slot0.dic_map_list and slot0.dic_map_list[slot1] and slot0.dic_map_list[slot1].list then
		return slot0.dic_map_list[slot1].list[slot2]
	end
end

function PlanesafkMainWindow.initMapData(slot0, slot1, slot2)
	if slot1.map_id then
		slot0.map_data = slot1

		if Config.PlanesData.data_customs[slot0.map_data.map_id] then
			slot4 = nil

			if slot0.floor_txt then
				slot0.floor_txt:setString(uv0(TI18N("第%s层长环岛冒险(%s)"), slot0.map_data.floor, (slot3.difficulty ~= 2 or TI18N("困难")) and TI18N("普通")))
			end
		end

		slot4 = false

		for slot8, slot9 in ipairs(slot0.planes_first_time_tips) do
			if slot9 == slot0.map_data.map_id then
				slot4 = true

				break
			end
		end

		slot0.tip_btn:setVisible(slot4)
		slot0.tip_key_0:setVisible(slot4)
		slot0.Image_21:setVisible(slot4)
	end

	if not slot0.map_data then
		return
	end

	slot3 = {
		[slot8.line] = true
	}

	for slot7, slot8 in ipairs(slot1.tile_list) do
		if slot0.dic_map_list[slot8.line] == nil then
			slot0.dic_map_list[slot8.line] = {
				line = slot8.line,
				list = {}
			}
		end

		if slot0.dic_map_list[slot8.line].list[slot8.index] == nil then
			if slot8.evt_id ~= 0 then
				slot8.evt_config = Config.PlanesData.data_evt_info[slot8.evt_id]
			end

			slot0.dic_map_list[slot8.line].list[slot8.index] = slot8
		else
			for slot13, slot14 in pairs(slot8) do
				slot0.dic_map_list[slot8.line].list[slot8.index][slot13] = slot14
			end

			if slot8.evt_id ~= 0 then
				slot9.evt_config = Config.PlanesData.data_evt_info[slot8.evt_id]
			else
				slot9.evt_config = nil
			end
		end
	end

	slot0.show_list = {}
	slot4, slot5 = uv1:getRolePos()

	for slot9, slot10 in pairs(slot0.dic_map_list) do
		if slot10.line <= slot4 then
			for slot14, slot15 in pairs(slot10.list) do
				slot15.is_black = false
			end
		elseif slot10.line == slot4 + 1 then
			for slot14, slot15 in pairs(slot10.list) do
				if slot15.index == slot5 - 1 or slot15.index == slot5 + 1 then
					slot15.is_black = false
				else
					slot15.is_black = true
				end
			end
		else
			for slot14, slot15 in pairs(slot10.list) do
				slot15.is_black = true
			end
		end

		uv2(slot0.show_list, slot10)
	end

	uv3(slot0.show_list, SortTools.tableLowerSorter({
		"line"
	}))

	if slot0.map_role ~= nil and slot0.cur_line < slot4 then
		slot7, slot8 = slot0.map_role:getPosition()
		slot0.cur_line = slot4

		slot0.map_role:runAction(cc.FadeOut:create(0.2))
		slot0:showRoleShowEffect(true, PlayerAction.action_1, slot7, slot8)

		if slot0.scrollview_list then
			slot0.scrollview_list:resetItemByIndex(slot4)
		end
	else
		slot0.cur_line = slot4

		slot0:updateItemlist(slot4)

		if slot0.map_role then
			slot7, slot8 = slot0:getRolePosition()

			slot0.map_role:setPosition(slot7, slot8)
		end
	end

	if slot1.map_id then
		slot0:updateBoxInfo()
	end
end

function PlanesafkMainWindow.updateScrollviewByIndex(slot0, slot1, slot2)
	if not slot0.scrollview_list then
		return
	end

	if not slot0.show_list then
		return
	end

	for slot6, slot7 in ipairs(slot0.show_list) do
		if slot7.line == slot1 then
			slot8 = false

			for slot12, slot13 in pairs(slot7.list) do
				if slot12 ~= slot2 then
					slot13.is_hide = 1
					slot8 = true
				end
			end

			slot0.scrollview_list:resetItemByIndex(slot1)

			return slot8
		end
	end
end

function PlanesafkMainWindow.getBoxStatus(slot0)
	if not slot0.map_data then
		return
	end

	slot1 = 0

	return slot0.map_data.is_can_reward == 1 and (slot0.map_data.is_reward == 1 and (slot0.map_data.floor < slot0.max_floor and 0 or 3) or 2) or 1
end

function PlanesafkMainWindow.updateBoxInfo(slot0)
	if not slot0.scrollview_list then
		return
	end

	if slot0:getBoxStatus() == nil then
		return
	end

	slot0.is_show_box_staus = slot1

	if slot0.box_bg == nil then
		slot0.box_bg = ccui.Widget:create()

		slot0.box_bg:setContentSize(cc.size(PlanesafkConst.Grid_Width, PlanesafkConst.Grid_Height))
		slot0.box_bg:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.box_bg:setTouchEnabled(true)
		slot0.box_bg:setSwallowTouches(false)
		registerButtonEventListener(slot0.box_bg, handler(slot0, slot0.onClickBoxBtn))
		slot0.box_bg:setName("box_bg")
		slot0.scrollview_list.container:addChild(slot0.box_bg)

		slot3, slot4 = slot0.scrollview_list:getCellXYByIndex(#slot0.show_list + 2)

		slot0.box_bg:setPosition(slot3, slot4)
	end

	if slot1 ~= 0 and slot1 ~= 3 and slot0.box_effect == nil then
		slot2 = PathTool.getEffectRes(110)
		slot0.box_effect = createEffectSpine("E27534", cc.p(PlanesafkConst.Grid_Width / 2, PlanesafkConst.Grid_Height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1, function ()
			if uv0.is_show_box_staus == 3 or uv0.is_show_box_staus == 0 then
				uv0.box_effect:setVisible(false)
				uv0.box_bg:setTouchEnabled(false)
			end
		end)

		slot0.box_bg:addChild(slot0.box_effect)
	end

	if slot0.box_effect then
		if slot1 == 0 or slot1 == 3 then
			slot0.box_effect:setVisible(false)
		else
			slot0.box_effect:setVisible(true)
		end

		if slot1 == 1 then
			slot0.box_effect:setAnimation(0, PlayerAction.action_1, true)
		elseif slot1 == 2 then
			slot0.box_effect:setAnimation(0, PlayerAction.action_2, true)
		elseif slot1 == 3 then
			-- Nothing
		end
	end

	if slot1 == 0 then
		slot0.box_bg:setTouchEnabled(false)

		slot2 = nil
		slot4 = RoleController:getInstance():getRoleVo()
		slot2 = slot0.map_data.floor and slot0.map_data.floor > 1 and slot4 and slot0.planes_difficult_max_power <= slot4.power and slot0.difficult_limit_lev <= StartowerController:getInstance():getModel():getNowTowerId() and 2 or 1
		slot5 = cc.size(PlanesafkConst.Grid_Width, PlanesafkConst.Grid_Height)
		slot6 = PlanesafkConst.Grid_Width * 0.5
		slot7 = PlanesafkConst.Grid_Height * 0.5

		for slot11, slot12 in pairs(slot0.door_item_list) do
			slot12:setVisible(false)
		end

		slot8 = slot6 - (slot5.width / 2 - PlanesafkConst.Grid_Width / 2)
		slot9 = 1

		if slot0.door_item_list[(slot2 == 1 or slot2 == 2 and slot0.map_data.floor == 1) and 1 or 2] == nil then
			slot0.door_item_list[slot9] = slot0:createDooritem(slot9, slot5)
		else
			slot0.door_item_list[slot9]:setVisible(true)
		end

		slot0.door_item_list[slot9]:setPosition(slot8, slot7)
	else
		for slot5, slot6 in pairs(slot0.door_item_list) do
			slot6:setVisible(false)
		end

		slot0.box_bg:setTouchEnabled(true)
	end

	if slot0.is_reward ~= nil and slot0.is_reward ~= slot0.map_data.is_reward and slot1 == 3 then
		uv0:setIsShowSearchFinish(true)
	end

	slot0.is_reward = slot0.map_data.is_reward
end

function PlanesafkMainWindow.createDooritem(slot0, slot1, slot2)
	slot4 = ccui.Widget:create()

	slot4:setContentSize(slot2)
	slot4:setAnchorPoint(cc.p(0.5, 0.5))
	slot4:setTouchEnabled(true)
	slot4:setSwallowTouches(false)
	registerButtonEventListener(slot4, function ()
		uv0:onClickHardBtn(uv1)
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, , , true)
	slot0.box_bg:addChild(slot4)

	slot0.door_item_load[slot1] = createEffectSpine(slot0.door_res_id[slot1] or "E27531", cc.p(slot2.width * 0.5, slot2.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1, function ()
		if uv0 and uv0.door_item_load[uv1] and not uv0.door_item_load[uv1].is_update_ani then
			uv0.door_item_load[uv1].is_update_ani = true

			uv0.door_item_load[uv1]:setAnimation(0, PlayerAction.action_2, true)
		end
	end)

	slot4:addChild(slot0.door_item_load[slot1])

	return slot4
end

function PlanesafkMainWindow.showRoleInfo(slot0)
	if not slot0.scrollview_list then
		return
	end

	slot0:removeRoleInfo()

	slot1, slot2 = slot0:getRolePosition()
	slot5 = "H60001"

	if Config.HomeData.data_figure[uv0:getPlanesRoleLookId()] then
		slot5 = slot4.look_id
	end

	slot0.map_role = createEffectSpine(slot5, cc.p(0, 0), cc.p(0.5, 0), true, PlayerAction.idle)

	slot0.map_role:setScale(1)
	slot0.scrollview_list.container:addChild(slot0.map_role, 1000)
	slot0.map_role:setName("map_role")
	slot0.map_role:setPosition(slot1, slot2)
end

function PlanesafkMainWindow.showRoleShowEffect(slot0, slot1, slot2, slot3, slot4)
	if slot1 then
		slot0.role_show_action = slot2 or PlayerAction.action_1

		if slot0.role_show_effect == nil then
			slot0.role_show_effect = createEffectSpine("E27533", cc.p(slot3 or 0, slot4 or 0), cc.p(0.5, 0.5), true, slot0.role_show_action, function ()
				if uv0 and uv0.scrollview_list ~= nil then
					if uv0.role_show_action == PlayerAction.action_1 then
						slot0, slot1 = uv0:getRolePosition()

						uv0.map_role:runAction(cc.FadeIn:create(0.2))
						uv0.map_role:setPosition(slot0, slot1)

						uv0.must_delay = true

						uv0:showRoleShowEffect(true, PlayerAction.action_2, slot0, slot1)
						uv0:updateItemlist(uv0.cur_line)

						uv0.must_delay = false
					else
						uv0.role_show_effect:setVisible(false)
					end
				end
			end)

			slot0.scrollview_list.container:addChild(slot0.role_show_effect, 1000)
		else
			slot0.role_show_effect:setPosition(slot6, slot5)
			slot0.role_show_effect:setVisible(true)
			slot0.role_show_effect:setAnimation(0, slot0.role_show_action, false)
		end
	elseif slot0.role_show_effect then
		slot0.role_show_effect:clearTracks()
		slot0.role_show_effect:removeFromParent()

		slot0.role_show_effect = nil
	end
end

function PlanesafkMainWindow.getRolePosition(slot0)
	slot1, slot2 = uv0:getRolePos()
	slot3, slot6 = slot0.scrollview_list:getCellXYByIndex(slot1)

	if slot0.scrollview_list:getActiveCellByIndex(slot1) and slot7.item_list and slot7.item_list[slot2] then
		slot8, slot9 = slot7.item_list[slot2].root_wnd:getPosition()
		slot5 = slot3 - slot0.scrollview_list.item_width * 0.5 + slot8
		slot6 = slot6 + slot9
	end

	return slot5, slot6
end

function PlanesafkMainWindow.removeRoleInfo(slot0, slot1)
	if slot0.map_role then
		slot0.map_role:clearTracks()
		slot0.map_role:removeFromParent()

		slot0.map_role = nil
		slot0.cur_look_id = nil

		if not slot1 then
			-- Nothing
		end
	end
end

function PlanesafkMainWindow.updateItemlist(slot0, slot1)
	if not slot0.show_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.map_container, cc.p(0, display.getBottom(slot0.ui_container) + 70), ScrollViewDir.vertical, ScrollViewStartPos.bottom, cc.size(720, 1080 + (slot0.ext_height or 0)), {
			start_y = 50,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 720,
			item_height = 140,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))
		slot0.scrollview_list.delay = 2

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if slot1 == 1 then
		slot0.scrollview_list:reloadData()
	else
		slot0.scrollview_list:reloadData(nil, , true)
		slot0.scrollview_list:jumpToMoveByIndex(slot1)
	end
end

function PlanesafkMainWindow.createNewCell(slot0, slot1, slot2)
	return PlanesafkMainItem.new(slot1, slot2, slot0)
end

function PlanesafkMainWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list + 3
end

function PlanesafkMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		if slot0.must_delay and slot2 == slot0.cur_line + 1 then
			delayRun(slot1, 0.2, function ()
				uv0:setData(uv1, uv2)
			end)
		else
			slot1:setData(slot3, slot2)
		end

		slot1:setVisible(true)
	else
		slot1:setVisible(false)
	end
end

function PlanesafkMainWindow.showBuffItemMoveAni(slot0, slot1, slot2)
	if not slot1 or not slot2 then
		return
	end

	if not Config.PlanesData.data_buff[slot1] then
		return
	end

	if slot0.move_buff_item then
		slot0.move_buff_item:DeleteMe()

		slot0.move_buff_item = nil
	end

	slot0.move_buff_item = PlanesBuffItem.new()

	slot0.move_buff_item:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.move_buff_item:setData(slot3)

	slot4 = slot0.ui_container:convertToNodeSpace(slot2)
	slot5 = slot0.move_buff_item:getContentSize()

	slot0.move_buff_item:setPosition(cc.p(slot4.x + slot5.width * 0.5, slot4.y + slot5.height * 0.5))
	slot0.ui_container:addChild(slot0.move_buff_item)

	slot6, slot7 = slot0.buff_btn:getPosition()

	slot0.move_buff_item:runAction(cc.Sequence:create(cc.Spawn:create(cc.MoveTo:create(0.7, cc.p(slot6, slot7)), cc.RotateTo:create(0.4, -30), cc.ScaleTo:create(0.7, 0.2)), cc.CallFunc:create(function ()
		uv0.move_buff_item:DeleteMe()

		uv0.move_buff_item = nil
	end)))
end

function PlanesafkMainWindow.updateOrderactionRed(slot0)
	if tolua.isnull(slot0.fight_btn) then
		return
	end

	if uv0:getOrderactionRedpoint() == true then
		addRedPointToNodeByStatus(slot0.fight_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.fight_btn, false, 5, 5)
	end
end

function PlanesafkMainWindow.close_callback(slot0)
	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if slot0.door_item_load then
		for slot4, slot5 in pairs(slot0.door_item_load) do
			slot5:clearTracks()
			slot5:removeFromParent()
		end

		slot0.door_item_load = nil
	end

	slot0:removeRoleInfo()

	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()
	end

	slot0.scrollview_list = nil

	MainuiController:getInstance():setIsShowMainUIBottom(true)
	LookController:getInstance():clearAttrData()
	uv0:sender28626()
	uv1:setIsShowSearchFinish(false)
	uv0:openPlanesafkMainWindow(false)
end

PlanesafkMainItem = class("PlanesafkMainItem", function ()
	return ccui.Widget:create()
end)

function PlanesafkMainItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3
	slot0.item_list = {}

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function PlanesafkMainItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setContentSize(slot0.size)
end

function PlanesafkMainItem.register_event(slot0)
end

function PlanesafkMainItem.setData(slot0, slot1, slot2)
	slot0.data = slot1

	for slot6, slot7 in pairs(slot0.item_list) do
		slot7:setVisible(false)
	end

	slot3 = slot0.size.width * 0.5 - PlanesafkConst.Grid_Width
	slot4 = (slot0.size.height - PlanesafkConst.Grid_Height) * 0.5

	if slot0.data.list then
		for slot8, slot9 in pairs(slot0.data.list) do
			if slot0.item_list[slot9.index] == nil then
				slot0.item_list[slot10] = PlanesafkEvtItem.New(slot0)
			else
				slot0.item_list[slot10]:setVisible(true)
			end

			slot0.item_list[slot10].root_wnd:setPosition(slot3 + (slot10 - 1) * PlanesafkConst.Grid_Width * 0.5, slot4)
			slot0.item_list[slot10]:setData(slot9)
		end
	end

	slot0:setZOrder(1000 - slot2)
end

function PlanesafkMainItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
