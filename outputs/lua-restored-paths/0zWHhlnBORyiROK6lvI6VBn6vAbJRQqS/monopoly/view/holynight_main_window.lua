slot1 = MonopolyController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
HolynightMainWindow = HolynightMainWindow or BaseClass(BaseView)

function HolynightMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.WIN_TAG
	slot0.win_type = WinType.Full
	slot0.layout_name = "monopoly/holynight_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopolyenter"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_enter_bg_1", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly", "monopoly_enter_bg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly/build", "build_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly/build", "build_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly/build", "build_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("monopoly/build", "build_4"),
			type = ResourcesType.single
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.monopoly_item_list = {}
end

function HolynightMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("monopoly", "monopoly_enter_bg_1", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	loadSpriteTexture(slot0.main_container:getChildByName("build_bg"), PathTool.getPlistImgForDownLoad("monopoly", "monopoly_enter_bg_2"), LOADTEXT_TYPE)

	slot2 = slot0.main_container:getChildByName("top_panel")
	slot0.btn_rule = slot2:getChildByName("btn_rule")
	slot0.atk_txt = slot2:getChildByName("atk_txt")
	slot0.hp_txt = slot2:getChildByName("hp_txt")
	slot0.candy_txt = slot2:getChildByName("candy_txt")
	slot0.time_txt = slot2:getChildByName("time_txt")
	slot0.candy_sp = slot2:getChildByName("candy_sp")

	slot0.candy_sp:setScale(0.5)

	slot0.gold_item_bid = 0
	slot0.gold_item_name = ""

	if Config.MonopolyMapsData.data_const.monopoly_gold_id then
		slot0.gold_item_bid = slot3.val

		if Config.ItemData.data_get_data(slot0.gold_item_bid) then
			slot0.gold_item_name = slot4.name

			loadSpriteTexture(slot0.candy_sp, PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
		end
	end

	slot0.shop_btn = slot0.main_container:getChildByName("shop_btn")

	slot0.shop_btn:getChildByName("label"):setString(TI18N("圣夜商城"))

	slot4 = slot0.main_container:getChildByName("bottom_panel")

	slot4:getChildByName("award_title"):setString(TI18N("奖励预览"))

	slot0.close_btn = slot4:getChildByName("close_btn")
	slot0.image_boss = slot4:getChildByName("image_boss")
	slot0.boss_txt = slot0.image_boss:getChildByName("boss_txt")
	slot5 = slot4:getChildByName("award_list")
	slot0.award_scrollview = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot5:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.award_scrollview:setSwallowTouches(false)
	slot2:setPositionY(display.getTop(slot0.main_container) - 158)
	slot4:setPositionY(display.getBottom(slot0.main_container))
end

function HolynightMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.MonopolyMapsData.data_const.monopoly_rule_1 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 1, nil, 0.8)
	registerButtonEventListener(slot0.image_boss, handler(slot0, slot0.onClickBossBtn), true)
	registerButtonEventListener(slot0.shop_btn, handler(slot0, slot0.onClickShopBtn), true)
	slot0:addGlobalEvent(MonopolyEvent.Update_Monopoly_Base_Data_Event, function ()
		uv0:setData()
	end)
	slot0:addGlobalEvent(MonopolyEvent.Update_Buff_Data_Event, function ()
		uv0:updateBuffData()
	end)
	slot0:addGlobalEvent(MonopolyEvent.Update_Boss_Num_Event, function ()
		uv0:updateBossNumData()
	end)

	if not slot0.role_assets_event and slot0.role_vo then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 and slot0 == uv0.gold_item_bid and uv0.role_vo then
				uv0:updateBuffData()
			end
		end)
	end
end

function HolynightMainWindow.onClickCloseBtn(slot0)
	uv0:openHolynightMainWindow(false)
end

function HolynightMainWindow.onClickBossBtn(slot0)
	MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyBoss)
end

function HolynightMainWindow.onClickShopBtn(slot0)
	MallController:getInstance():openMallActionWindow(true, 993040)
end

function HolynightMainWindow.openRootWnd(slot0, slot1)
	slot0.open_sub_type = slot1

	uv0:sender27400()
	uv0:sender27504()
	uv0:sender27505()
	slot0:updateAwardList()
end

function HolynightMainWindow.updateAwardList(slot0)
	if Config.MonopolyMapsData.data_const.monopoly_gift then
		slot2 = {}

		for slot6, slot7 in pairs(slot1.val) do
			if deepCopy(Config.ItemData.data_get_data(slot7[1])) then
				slot10.quantity = slot7[2]

				uv0(slot2, slot10)
			end
		end

		slot0.award_scrollview:setData(slot2)
		slot0.award_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.award_scrollview:getItemList()) do
				slot5:setDefaultTip(true)
			end
		end)
	end
end

function HolynightMainWindow.updateBuffData(slot0)
	slot2 = 0
	slot3 = 0

	for slot7, slot8 in pairs(uv0:getMonopolyBuffData()) do
		if slot8.buff_id == 1 then
			slot2 = slot8.val
		elseif slot8.buff_id == 2 then
			slot3 = slot8.val
		end
	end

	slot0.atk_txt:setString(uv1(TI18N("攻击+%d"), slot2))
	slot0.hp_txt:setString(uv1(TI18N("血量+%d"), slot3))
	slot0.candy_txt:setString(uv1(TI18N("%s:%d"), slot0.gold_item_name, slot0.role_vo:getActionAssetsNumByBid(slot0.gold_item_bid)))
end

function HolynightMainWindow.updateBossNumData(slot0)
	if not slot0.boss_txt then
		return
	end

	slot0.boss_txt:setString(uv1(TI18N("奇境BOSS:%d/%d"), uv0:getMonopolyBossNumData().kill_num or 0, slot1.all_num or 0))
end

function HolynightMainWindow.setData(slot0)
	slot0:updateHolyEndTime()

	slot0.customs_data = uv0:getMonopolyBaseInfo()
	slot4 = SortTools.KeyLowerSorter

	table.sort(slot0.customs_data, slot4("id"))

	for slot4, slot5 in pairs(slot0.monopoly_item_list) do
		slot5:setVisible(false)
	end

	for slot4 = 1, 4 do
		delayRun(slot0.main_container, slot4 / display.DEFAULT_FPS, function ()
			if not uv0.monopoly_item_list[uv1] then
				slot0 = HolynightMainItem.new()

				uv0.main_container:getChildByName("pos_node_" .. uv1):addChild(slot0)

				uv0.monopoly_item_list[uv1] = slot0
			end

			slot0:setVisible(true)
			slot0:setData(uv0.customs_data[uv1])

			if uv1 == 4 then
				uv0:loadMonopolyItemEnd()
			end
		end)
	end
end

function HolynightMainWindow.loadMonopolyItemEnd(slot0)
	if slot0.open_sub_type then
		if slot0.open_sub_type == MonopolyConst.Sub_Type.Boss then
			slot0:onClickBossBtn()
		elseif slot0.monopoly_item_list[slot0.open_sub_type] then
			slot1:onClickItem()
		end

		slot0.open_sub_type = nil
	end
end

function HolynightMainWindow.updateHolyEndTime(slot0)
	slot0:setLessTime(uv0:getMonopolyEndTime() - GameNet:getInstance():getTime())
end

function HolynightMainWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_txt) then
		return
	end

	slot0.time_txt:stopAllActions()

	if (slot1 or 0) > 0 then
		slot0:setTimeFormatString(slot2)
		slot0.time_txt:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_txt:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function HolynightMainWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		str = string.format(TI18N("活动结束: %s"), TimeTool.GetTimeFormatDay(slot1))

		slot0.time_txt:setString(str)
	else
		slot0.time_txt:setString("")
	end
end

function HolynightMainWindow.close_callback(slot0)
	slot0.time_txt:stopAllActions()

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	for slot4, slot5 in pairs(slot0.monopoly_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	uv0:openHolynightMainWindow(false)
end

HolynightMainItem = class("HolynightMainItem", function ()
	return ccui.Layout:create()
end)

function HolynightMainItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.is_lock = false
end

function HolynightMainItem.configUI(slot0)
	slot0.size = cc.size(150, 150)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("monopoly/holynight_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.image_bg = slot0.container:getChildByName("image_bg")

	slot0.image_bg:ignoreContentAdaptWithSize(true)

	slot0.name_bg = slot0.container:getChildByName("name_bg")
	slot0.lock_sp = slot0.container:getChildByName("lock_sp")
	slot0.name_txt = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, 0))

	slot0.container:addChild(slot0.name_txt)
end

function HolynightMainItem.registerEvent(slot0)
	registerButtonEventListener(slot0.image_bg, handler(slot0, slot0.onClickItem), true)
end

function HolynightMainItem.onClickItem(slot0)
	if not slot0.data then
		return
	end

	if slot0.is_lock then
		uv0:openMonopolyTips(true, slot0.data)
	elseif slot0.data.id == 1 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_1, slot0.data.id)
	elseif slot0.data.id == 2 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_2, slot0.data.id)
	elseif slot0.data.id == 3 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_3, slot0.data.id)
	elseif slot0.data.id == 4 then
		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.MonopolyWar_4, slot0.data.id)
	end
end

function HolynightMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cfg_data = Config.MonopolyMapsData.data_customs[slot1.id]

	if not slot0.cfg_data then
		return
	end

	slot0.data = slot1
	slot0.is_lock = slot1.lock == 1

	if slot0.cfg_data.res_id and slot0.cfg_data.res_id ~= "" then
		slot0.image_bg:loadTexture(PathTool.getPlistImgForDownLoad("monopoly/build", slot0.cfg_data.res_id), LOADTEXT_TYPE)
	end

	slot2 = 75
	slot3 = 0

	if slot1.id == 1 then
		slot3 = 95
		slot2 = 85
	elseif slot1.id == 2 then
		slot3 = 5
		slot2 = 70
	elseif slot1.id == 3 then
		slot3 = 15
		slot2 = 75
	elseif slot1.id == 4 then
		slot3 = 55
		slot2 = 75
	end

	slot0.name_txt:setPosition(slot2, slot3)
	slot0.lock_sp:setPosition(slot2 - 75, slot3)
	slot0.name_bg:setPosition(slot2, slot3)

	slot4 = 0

	if slot0.cfg_data.max_develop > 0 then
		slot4 = (slot1.guild_develop or 0) / slot0.cfg_data.max_develop * 100
	end

	if slot4 > 100 then
		slot4 = 100
	end

	if slot0.is_lock then
		slot0.name_txt:setString(TI18N(uv0("<div fontcolor=#fffced outline=2,#330b03>%s</div>", slot0.cfg_data.name)))
	else
		slot0.name_txt:setString(TI18N(uv0("<div fontcolor=#fffced outline=2,#330b03>%s</div><div fontcolor=#72ff5f outline=2,#330b03> %d%%</div>", slot0.cfg_data.name, slot4)))
	end

	slot0:updateLockState()
end

function HolynightMainItem.updateLockState(slot0)
	slot0.lock_sp:setVisible(slot0.is_lock == true)
	setChildUnEnabled(slot0.is_lock, slot0.image_bg)
	setChildUnEnabled(slot0.is_lock, slot0.name_bg)
end

function HolynightMainItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
