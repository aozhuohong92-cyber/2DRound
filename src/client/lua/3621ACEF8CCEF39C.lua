slot1 = PlanesController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
PlanesMainWindow = PlanesMainWindow or BaseClass(BaseView)

function PlanesMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.layout_name = "planes/planes_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_main"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("planes", "big_bg_1", true),
			type = ResourcesType.single
		}
	}
	slot0.planes_item_list = {}
end

function PlanesMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("planes", "big_bg_1", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot0.win_title = slot1:getChildByName("win_title")

	slot0.win_title:setString(TI18N("长环岛冒险"))

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.btn_shop = slot1:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("label"):setString(TI18N("商城"))

	slot0.btn_award = slot1:getChildByName("btn_award")

	slot0.btn_award:getChildByName("label"):setString(TI18N("奖励加成"))

	slot0.btn_first_award = slot1:getChildByName("btn_first_award")

	slot0.btn_first_award:getChildByName("label"):setString(TI18N("首通奖励"))

	slot0.bottom_panel = slot1:getChildByName("bottom_panel")
	slot0.close_btn = slot0.bottom_panel:getChildByName("close_btn")
	slot0.cur_dun_txt = slot0.bottom_panel:getChildByName("cur_dun_txt")

	slot0.cur_dun_txt:setString("")

	slot0.time_txt = slot0.bottom_panel:getChildByName("time_txt")

	slot0.bottom_panel:getChildByName("tips_txt"):setString(TI18N("选择副本后本轮征战不可更换其他副本"))
	slot0.bottom_panel:getChildByName("tips_txt_1"):setString(TI18N("每个副本可获不同阵营的英雄碎片，其余奖励相同"))

	slot0.lock_tips_bg = slot1:getChildByName("lock_tips_bg")

	slot0.lock_tips_bg:getChildByName("tips_txt"):setString(TI18N("开启条件:"))
	slot0.lock_tips_bg:setVisible(false)

	slot0.lock_tips_txt_1 = slot0.lock_tips_bg:getChildByName("tips_txt_1")
	slot0.lock_tips_txt_2 = slot0.lock_tips_bg:getChildByName("tips_txt_2")
	slot5 = "tips_txt_3"
	slot0.lock_tips_txt_3 = slot0.lock_tips_bg:getChildByName(slot5)
	slot0.pos_node_list = {}

	for slot5 = 1, 5 do
		if slot1:getChildByName("pos_node_" .. slot5) then
			uv0(slot0.pos_node_list, slot6)
		end
	end

	slot2 = display.getTop(slot1)
	slot3 = display.getBottom(slot1)
	slot4 = slot2 - slot3 - SCREEN_HEIGHT

	slot1:getChildByName("image_title"):setPositionY(slot2 - 55)
	slot0.win_title:setPositionY(slot2 - 119)
	slot0.btn_rule:setPositionY(slot2 - 160)
	slot0.btn_shop:setPositionY(slot2 - 160)
	slot0.btn_award:setPositionY(slot2 - 255)
	slot0.btn_first_award:setPositionY(slot2 - 350)
	slot0.bottom_panel:setPositionY(slot3)
end

function PlanesMainWindow.onLockScreenCallBack(slot0, slot1)
	if slot1 == true then
		if not slot0.lock_mask then
			slot2 = slot0.main_container:getContentSize()
			slot0.lock_mask = ccui.Layout:create()

			slot0.lock_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
			slot0.lock_mask:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.lock_mask:setScale(display.getMaxScale())
			slot0.lock_mask:setPosition(slot2.width * 0.5, slot2.height * 0.5)
			slot0.lock_mask:setTouchEnabled(true)
			slot0.lock_mask:setSwallowTouches(true)
			slot0.main_container:addChild(slot0.lock_mask, 10)
		end

		slot0.lock_mask:setVisible(true)
	elseif slot0.lock_mask then
		slot0.lock_mask:setVisible(false)
	end
end

function PlanesMainWindow.onShowLockContent(slot0, slot1, slot2, slot3)
	if not slot0.touch_mask then
		slot4 = slot0.main_container:getContentSize()
		slot0.touch_mask = ccui.Layout:create()

		slot0.touch_mask:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
		slot0.touch_mask:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.touch_mask:setScale(display.getMaxScale())
		slot0.touch_mask:setPosition(slot4.width * 0.5, slot4.height * 0.5)
		slot0.touch_mask:setTouchEnabled(true)
		slot0.main_container:addChild(slot0.touch_mask, 10)
		slot0.touch_mask:setSwallowTouches(false)
		slot0.touch_mask:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0.touch_mask:setVisible(false)
				uv0.lock_tips_bg:setVisible(false)
			end
		end)
	end

	slot0.touch_mask:setVisible(true)
	slot0.lock_tips_bg:setVisible(true)

	slot4 = slot0.main_container:convertToNodeSpace(slot1)

	if slot2 % 2 == 0 then
		slot0.lock_tips_bg:setPosition(slot4.x + 260, slot4.y - 70)
	else
		slot0.lock_tips_bg:setPosition(slot4.x - 260, slot4.y - 70)
	end

	if Config.SecretDunData.data_customs[slot3] then
		slot6 = {}
		slot7 = false

		if slot5.id_limit and slot5.id_limit[1] then
			if uv0:checkDunIsPassByDunId(slot5.id_limit[1]) then
				slot7 = true
			end

			if slot7 then
				slot0.lock_tips_txt_1:setTextColor(cc.c4b(87, 202, 69, 255))
				slot0.lock_tips_txt_1:setString(TI18N(uv1("[%s]进度达100%%[已达成]", Config.SecretDunData.data_dun_info[slot5.id_limit[1]].name or "")))
			else
				slot0.lock_tips_txt_1:setTextColor(cc.c4b(224, 191, 152, 255))
				slot0.lock_tips_txt_1:setString(TI18N(uv1("[%s]进度达100%%", slot8.name or "")))
			end
		end

		if RoleController:getInstance():getRoleVo().lev < slot5.lev_limit then
			slot0.lock_tips_txt_2:setTextColor(cc.c4b(224, 191, 152, 255))
			slot0.lock_tips_txt_2:setString(TI18N(uv1("角色等级达%d级", slot5.lev_limit)))
		else
			slot0.lock_tips_txt_2:setTextColor(cc.c4b(87, 202, 69, 255))
			slot0.lock_tips_txt_2:setString(TI18N(uv1("角色等级达%d级[已达成]", slot5.lev_limit)))
		end

		if slot8.power < slot5.power_limit then
			slot0.lock_tips_txt_3:setTextColor(cc.c4b(224, 191, 152, 255))
			slot0.lock_tips_txt_3:setString(TI18N(uv1("角色战力达到%d", slot5.power_limit)))
		else
			slot0.lock_tips_txt_3:setTextColor(cc.c4b(87, 202, 69, 255))
			slot0.lock_tips_txt_3:setString(TI18N(uv1("角色战力达到%d[已达成]", slot5.power_limit)))
		end
	end
end

function PlanesMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true)
	registerButtonEventListener(slot0.btn_shop, handler(slot0, slot0.onClickShopBtn), true)
	registerButtonEventListener(slot0.btn_award, handler(slot0, slot0.onClickAwardBtn), true)
	registerButtonEventListener(slot0.btn_first_award, handler(slot0, slot0.onClickFirstAwardBtn), true)
	slot0:addGlobalEvent(PlanesEvent.Update_Dun_Base_Event, function ()
		uv0:setData()
	end)
	slot0:addGlobalEvent(PlanesEvent.Update_Planes_Red_Event, function (slot0, slot1)
		uv0:updateRedStatus(slot0)
	end)
end

function PlanesMainWindow.onClickCloseBtn(slot0)
	uv0:openPlanesMainWindow(false)
end

function PlanesMainWindow.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.SecretDunData.data_const.planes_rule then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition())
	end
end

function PlanesMainWindow.onClickShopBtn(slot0)
	MallController:getInstance():openMallPanel(true, MallConst.MallType.FriendShop)
end

function PlanesMainWindow.onClickAwardBtn(slot0)
	uv0:openPlanesAwardInfoWindow(true)
end

function PlanesMainWindow.onClickFirstAwardBtn(slot0)
	uv0:openPlanesFirstAwardWindow(true)
end

function PlanesMainWindow.openRootWnd(slot0)
	uv0:sender23123(0)
	uv0:sender23100()
	uv1:updatePlanesRedStatus(PlanesConst.Red_Index.Login, false)
	slot0:updateRedStatus()
end

function PlanesMainWindow.setData(slot0)
	slot0.cur_dun_id = uv0:getCurDunId()

	if uv0:getResetLessTime() > 0 then
		slot0.time_txt:setVisible(true)
		commonCountDownTime(slot0.time_txt, slot1, {
			label_type = CommonAlert.type.rich,
			end_title = TI18N("后重置")
		})
	else
		slot0.time_txt:setVisible(false)
	end

	if Config.SecretDunData.data_dun_info[slot0.cur_dun_id] then
		slot0.cur_dun_txt:setString(TI18N(uv1("当前位于: %s", slot2.name)))
	else
		slot0.cur_dun_txt:setString("")
	end

	slot3 = 0

	if slot0.planes_data then
		slot3 = #slot0.planes_data
	end

	slot0.planes_data = {}

	for slot7, slot8 in pairs(Config.SecretDunData.data_dun_info) do
		uv2(slot0.planes_data, {
			id = slot7,
			name = slot8.name,
			dun_res_id = slot8.dun_res_id,
			dun_status = uv0:getPlanesDunStatusById(slot7)
		})
	end

	slot7 = SortTools.KeyLowerSorter

	uv3(slot0.planes_data, slot7("id"))

	for slot7, slot8 in ipairs(slot0.planes_data) do
		slot10 = slot0.pos_node_list[slot7]

		if not slot0.planes_item_list[slot7] and slot10 then
			slot9 = PlanesMainItem.new()

			slot9:addCallBack(handler(slot0, slot0.onShowLockContent))
			slot9:addLockScreenCallBack(handler(slot0, slot0.onLockScreenCallBack))
			slot10:addChild(slot9)

			slot0.planes_item_list[slot7] = slot9
		end

		if slot9 then
			slot9:setData(slot8, slot7)
		end
	end
end

function PlanesMainWindow.updateRedStatus(slot0, slot1)
	if slot1 == PlanesConst.Red_Index.Award then
		for slot5, slot6 in pairs(slot0.planes_item_list or {}) do
			slot6:updateRedStatus()
		end

		addRedPointToNodeByStatus(slot0.btn_first_award, uv0:getPlanesRedStatusByBid(PlanesConst.Red_Index.Award))
	else
		addRedPointToNodeByStatus(slot0.btn_first_award, uv0:getPlanesRedStatusByBid(PlanesConst.Red_Index.Award))
	end
end

function PlanesMainWindow.close_callback(slot0)
	if slot0.planes_item_list then
		for slot4, slot5 in pairs(slot0.planes_item_list) do
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	uv0:openPlanesMainWindow(false)
end
