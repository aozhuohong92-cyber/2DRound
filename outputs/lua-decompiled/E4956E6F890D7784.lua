slot1 = MonopolyController:getInstance():getModel()
MonopolyMasterInfoWindow = MonopolyMasterInfoWindow or BaseClass(BaseView)

function MonopolyMasterInfoWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "monopoly/monopoly_master_info_window"
	slot0.text_name_list = {
		{
			"win_title",
			"万圣大挑战"
		},
		{
			"reward_title",
			"随机获得以下奖励"
		},
		{
			"enemy_title",
			"敌方阵容"
		},
		{
			"tips_txt",
			"战斗失败也能获取少量奖励"
		}
	}
end

function MonopolyMasterInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.btn_fight = slot0.main_container:getChildByName("btn_fight")

	slot0.btn_fight:getChildByName("label"):setString(TI18N("开战"))

	slot0.name_txt = slot0.main_container:getChildByName("name_txt")
	slot0.atk_txt = slot0.main_container:getChildByName("atk_txt")
	slot0.reward_panel = slot0.main_container:getChildByName("reward_panel")
	slot0.enemy_panel = slot0.main_container:getChildByName("enemy_panel")
	slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head:setPosition(175, 545)
	slot0.main_container:addChild(slot0.role_head)

	slot0.award_item_list = {}
	slot0.enemy_scrollview = CommonScrollViewLayout.new(slot0.enemy_panel, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.enemy_panel:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 18,
		row = 1,
		space_y = 0,
		col = 1,
		scale = 0.85,
		item_class = HeroExhibitionItem,
		item_width = HeroExhibitionItem.Width * 0.85,
		item_height = HeroExhibitionItem.Height * 0.85
	})

	slot0.enemy_scrollview:setClickEnabled(false)
end

function MonopolyMasterInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_fight, handler(slot0, slot0.onClickFightBtn), true)
	slot0:addGlobalEvent(MonopolyEvent.Get_Master_Data_Event, function (slot0)
		uv0:setData(slot0)
	end)
end

function MonopolyMasterInfoWindow.onClickFightBtn(slot0)
	if slot0.evt_type == MonopolyConst.Event_Type.Trap then
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Monopoly_Evt)
	elseif slot0.evt_type == MonopolyConst.Event_Type.Boss then
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Monopoly_Evt)
	end

	uv0:openMonopolyMasterInfoWindow(false)
end

function MonopolyMasterInfoWindow.openRootWnd(slot0, slot1, slot2)
	slot0.evt_type = slot1 or MonopolyConst.Event_Type.Trap
	slot0.step_id = slot2 or 1

	uv0:sender27410(slot0.step_id)
	slot0:setAwardList()
end

function MonopolyMasterInfoWindow.setAwardList(slot0)
	if next(slot0.award_item_list) ~= nil then
		return
	end

	slot1 = {}

	if slot0.evt_type == MonopolyConst.Event_Type.Trap then
		slot1 = Config.MonopolyMapsData.data_const.monopoly_event_trap_rewardshow
	elseif slot0.evt_type == MonopolyConst.Event_Type.Boss then
		slot1 = Config.MonopolyMapsData.data_const.monopoly_event_boss_rewardshow
	end

	if slot1 and slot1.val then
		for slot8, slot9 in ipairs(slot1.val or {}) do
			slot10 = BackPackItem.new(true, true, nil, 0.9, nil, true)

			slot10:setBaseData(slot9)
			slot10:setPosition(slot0.reward_panel:getContentSize().width * 0.5 - (#slot1.val - 1) * (20 + BackPackItem.Width * 0.9) * 0.5 + (slot8 - 1) * (slot3 + BackPackItem.Width * 0.9), slot2.height * 0.5)
			slot0.reward_panel:addChild(slot10)

			slot0.award_item_list[slot8] = slot10
		end
	end
end

function MonopolyMasterInfoWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.role_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.role_head:setLev(slot1.lev)
	slot0.name_txt:setString(slot1.name or "")
	slot0.atk_txt:setString(slot1.power or 0)
	slot0.enemy_scrollview:setData(slot1.guards or {}, nil, nil, {
		scale = 0.85,
		can_click = false
	})
end

function MonopolyMasterInfoWindow.close_callback(slot0)
	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.enemy_scrollview then
		slot0.enemy_scrollview:DeleteMe()

		slot0.enemy_scrollview = nil
	end

	uv0:openMonopolyMasterInfoWindow(false)
end
