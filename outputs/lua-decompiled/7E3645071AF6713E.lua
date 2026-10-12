VipMainWindow = VipMainWindow or BaseClass(BaseView)

function VipMainWindow.__init(slot0)
	slot0.ctrl = VipController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "vip/vip_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_24"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_23", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("vip", "vip"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_23"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_24"),
			type = ResourcesType.single
		}
	}
	slot0.tab_array = {
		{
			notice = "",
			status = true,
			label = TI18N("礼包展示"),
			index = VIPTABCONST.KLB
		},
		{
			notice = "",
			status = true,
			label = TI18N("充值"),
			index = VIPTABCONST.CHARGE
		},
		{
			notice = "",
			status = true,
			label = TI18N("VIP"),
			index = VIPTABCONST.VIP
		},
		{
			notice = "",
			status = true,
			label = TI18N("每日礼包"),
			index = VIPTABCONST.DAILY_GIFT
		},
		{
			notice = "",
			status = true,
			label = TI18N("特权商城"),
			index = VIPTABCONST.PRIVILEGE
		}
	}
	slot0.tab_btn_list = {}
	slot0.view_list = {}
	slot0.pre_panel = nil
	slot0.cur_index = nil
	slot0.cur_tab = nil
	slot0.init_vip_lev = slot0.role_vo.vip_lev
end

function VipMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_23", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.mainContainer, 1)

	slot0.main_panel = slot0.mainContainer:getChildByName("main_panel")
	slot0.tableContainer = slot0.mainContainer:getChildByName("tab_container")
	slot1 = slot0.tableContainer:getContentSize()
	slot0.tab_scrollView = createScrollView(slot1.width, slot1.height, 0, 0, slot0.tableContainer, ccui.ScrollViewDir.horizontal)
	slot6 = cc.size

	slot0.tab_scrollView:setInnerContainerSize(slot6(math.max(slot1.width, #slot0.tab_array * 155), slot1.height))

	for slot6 = 1, #slot0.tab_array do
		if slot0.tab_btn_list[slot0.tab_array[slot6].index] == nil then
			slot8 = VipMainTabBtn.new(handler(slot0, slot0.changeTabView))

			slot0.tab_scrollView:addChild(slot8)

			slot0.tab_btn_list[slot7.index] = slot8

			if MAKELIFEBETTER == true or IS_APPLE_RMUI == true then
				slot8:setVisible(false)
			end
		end

		slot8:setPosition(cc.p(98 + (slot6 - 1) * 160, 89))
		slot8:setData(slot7)
	end

	for slot7, slot8 in ipairs(Config.VipData.data_get_reward) do
		if VipController:getInstance():getPrivilegeRedpoint(slot8.lev) == nil and slot8.lev <= slot0.role_vo.vip_lev then
			VipController:getInstance():setPrivilegeRedpoint(slot8.lev, true)
		end
	end

	slot0.titleCon = slot0.mainContainer:getChildByName("titleCon")
	slot0.loadingbar = slot0.titleCon:getChildByName("loadingbar")

	slot0.loadingbar:setScale9Enabled(true)
	slot0.loadingbar:setPercent(0)

	slot0.exp = slot0.titleCon:getChildByName("exp")

	slot0.exp:setString("0/0")

	slot0.now_vip = CommonNum.new(22, slot0.titleCon, 1, -2, cc.p(0.5, 0.5))

	slot0.now_vip:setPosition(36, 130)

	slot0.next_vip = CommonNum.new(22, slot0.titleCon, 1, -2, cc.p(0, 0.5))

	slot0.next_vip:setPosition(480, 194)

	slot0.charge_num = CommonNum.new(21, slot0.titleCon, 1, -2, cc.p(0, 0.5))

	slot0.charge_num:setPosition(95, 192)

	slot0.yuan = slot0.titleCon:getChildByName("yuan")
	slot0.Sprite_6 = slot0.titleCon:getChildByName("Sprite_6")
	slot0.Sprite_6_0 = slot0.titleCon:getChildByName("Sprite_6_0")
	slot0.banner_image = slot0.mainContainer:getChildByName("banner_image")

	slot0.banner_image:ignoreContentAdaptWithSize(true)

	slot0.container_1 = slot0.main_panel:getChildByName("container_1")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.tabLayer = slot0.container:getChildByName("tabLayer")
	slot4 = slot0.tabLayer:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot0.tabLayer, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height), {
		start_y = 0,
		item_width = 153,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 79,
		space_y = 5,
		col = 1,
		item_class = VipPanelItem
	})

	slot0.tab_scrollview:setSwallowTouches(false)
	slot0.tab_scrollview:addEndCallBack(function ()
		if uv0.role_vo.vip_lev >= 5 then
			uv0.tab_scrollview:jumpToMove(cc.p(0, 183 * (slot0 - 4) + (slot0 - 4) * 2), 0.2)
		end
	end)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0:updateBar()
	slot0:setVisibleVIPTabRedPoint()
	slot0:resetTitlePos()
	slot0:setTabRedStatus(slot0.model:getIsGetAcc(), VIPTABCONST.ACC_CHARGE)
	slot0:updateDailyAwardRed()
	slot0:updatePrivilegeTabRedPoint()

	if MAKELIFEBETTER == true or IS_APPLE_RMUI == true then
		for slot11, slot12 in pairs(slot0.titleCon:getChildren()) do
			slot12:setVisible(false)
		end

		slot0.banner_image:setVisible(false)
	end
end

function VipMainWindow.updateBar(slot0)
	slot2 = Config.VipData.data_get_reward_length - 1
	slot3 = Config.VipData.data_get_reward[slot0.role_vo.vip_lev + 1]

	if Config.VipData.data_get_reward[slot0.role_vo.vip_lev] then
		if slot3 then
			slot0.loadingbar:setPercent(slot0.role_vo.vip_exp / slot3.gold * 100)
			slot0.exp:setString(slot0.role_vo.vip_exp .. "/" .. slot3.gold)
			slot0.next_vip:setNum(slot0.role_vo.vip_lev + 1)
			slot0.charge_num:setNum(slot3.gold - slot0.role_vo.vip_exp)
		else
			slot0.loadingbar:setPercent(100)
			slot0.exp:setString(slot1.gold .. "/" .. slot1.gold)
			slot0.next_vip:setNum(slot0.role_vo.vip_lev)
			slot0.charge_num:setNum(0)
		end
	else
		slot0.loadingbar:setPercent(100)
		slot0.exp:setString(Config.VipData.data_get_reward[slot2].gold .. "/" .. Config.VipData.data_get_reward[slot2].gold)
		slot0.charge_num:setNum(0)
		slot0.next_vip:setNum(slot0.role_vo.vip_lev)
	end

	slot0.charge_num:setCallBack(function ()
		uv0:resetTitlePos()
	end)

	if slot0.charge_num:getContentSize().width > 0 then
		slot0.yuan:setPositionX(slot0.charge_num:getPositionX() + slot0.charge_num:getContentSize().width + 10)
	end

	slot0.now_vip:setNum(slot0.role_vo.vip_lev)

	slot4 = 1
	slot4 = slot2 <= slot0.role_vo.vip_lev + 1 and slot2 or slot0.role_vo.vip_lev + 1

	if MAKELIFEBETTER == true or IS_APPLE_RMUI == true then
		return
	end

	if not slot0.next_vip_desc then
		slot0.next_vip_desc = createSprite(nil, 295, 123, slot0.titleCon, cc.p(0.5, 0.5))
	end

	if slot0.next_res ~= PathTool.getPlistImgForDownLoad("bigbg/vip", string.format("txt_cn_vip_lev_%d", slot4)) then
		slot0.next_res = slot5

		if not slot0.vip_desc_load then
			slot0.vip_desc_load = createResourcesLoad(slot5, ResourcesType.single, function ()
				if uv0.next_vip_desc then
					loadSpriteTexture(uv0.next_vip_desc, uv1, LOADTEXT_TYPE)
				end
			end, slot0.vip_desc_load)
		elseif slot0.next_vip_desc then
			loadSpriteTexture(slot0.next_vip_desc, PathTool.getPlistImgForDownLoad("bigbg/vip", string.format("txt_cn_vip_lev_%d", slot4)), LOADTEXT_TYPE)
		end
	end
end

function VipMainWindow.resetTitlePos(slot0)
	slot0.yuan:setPositionX(slot0.charge_num:getPositionX() + slot0.charge_num:getContentSize().width + 10)
	slot0.Sprite_6:setPositionX(slot0.yuan:getPositionX() + slot0.yuan:getContentSize().width + 5)
	slot0.Sprite_6_0:setPositionX(slot0.Sprite_6:getPositionX() + slot0.Sprite_6:getContentSize().width + 10)
	slot0.next_vip:setPositionX(slot0.Sprite_6_0:getPositionX() + slot0.Sprite_6_0:getContentSize().width + 5)
end

function VipMainWindow.openRootWnd(slot0, slot1, slot2)
	slot1 = slot1 or 1
	slot0.sub_type = slot2

	if MAKELIFEBETTER == true or IS_APPLE_RMUI == true then
		slot1 = 1
	end

	slot0:changeTabView(slot1)
end

function VipMainWindow.changeTabView(slot0, slot1)
	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setSelect(false)
	end

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_btn_list[slot1]

	if slot0.cur_tab == nil then
		return
	end

	slot0.cur_tab:setSelect(true)

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_tab.tab_type)

	if slot0.pre_panel ~= nil then
		if slot0.pre_panel.setVisibleStatus then
			slot0.pre_panel:setVisibleStatus(true)
		end

		if slot1 == VIPTABCONST.VIP then
			callFunc("enter_store")
		end
	end

	if slot1 == VIPTABCONST.PRIVILEGE and slot0.cur_tab:getRedTipsStatus() then
		slot0:updatePrivilegeTabRedPoint()
		slot0.ctrl:setTipsVIPStstus(VIPREDPOINT.PRIVILEGE, false)
		slot0.ctrl:setTipsGiftStatus(VIPREDPOINT.PRIVILEGE, false)
	end
end

function VipMainWindow.createSubPanel(slot0, slot1)
	slot2 = slot0.view_list[slot1]

	slot0.container_1:setVisible(slot1 == VIPTABCONST.ACC_CHARGE or slot1 == VIPTABCONST.CHARGE or slot1 == VIPTABCONST.DAILY_GIFT or slot1 == VIPTABCONST.PRIVILEGE or slot1 == VIPTABCONST.KLB)
	slot0.container:setVisible(slot1 == VIPTABCONST.VIP)
	slot0.banner_image:setVisible(not MAKELIFEBETTER and not IS_APPLE_RMUI and (slot1 == VIPTABCONST.DAILY_GIFT or slot1 == VIPTABCONST.PRIVILEGE))
	slot0.titleCon:setVisible(slot1 == VIPTABCONST.VIP or slot1 == VIPTABCONST.ACC_CHARGE or slot1 == VIPTABCONST.CHARGE)

	slot3 = nil

	if slot1 == VIPTABCONST.DAILY_GIFT then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_24", false)
	elseif slot1 == VIPTABCONST.PRIVILEGE then
		slot3 = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_23", false)
	end

	if slot3 then
		slot0.banner_image:loadTexture(slot3, LOADTEXT_TYPE)
	end

	if slot2 == nil then
		if slot1 == VIPTABCONST.VIP then
			slot2 = VipPanel.new()

			slot2:setData(slot0.sub_type)
			slot0.container:addChild(slot2)

			if slot0.tab_scrollview then
				slot6 = 0

				for slot10 = 0, slot0.role_vo.vip_lev <= 9 and 10 or slot0.role_vo.vip_lev == 10 and 12 or slot0.role_vo.vip_lev == 11 and 13 or #Config.VipData.data_get_reward do
				end

				slot0.tab_scrollview:setData({
					[slot10 + 1] = slot4[slot10]
				}, function (slot0)
					if uv0.tab_scrollview:getItemList() then
						for slot5, slot6 in pairs(slot1) do
							if slot0:getData().lev + 1 == slot5 then
								VipController:getInstance():setPrivilegeRedpoint(slot5, false)

								slot7 = VipController:getInstance():getPrivilegeRedpoint(slot5)

								slot6:setVisibleRedStatus(false)
								slot6:setSelect(true)
								slot6:setNormal(false)
								slot6:setTextColor(cc.c4b(255, 255, 255, 255), cc.c4b(166, 66, 28, 255))
								uv1:setData(slot0:getData().lev)
							else
								slot6:setSelect(false)
								slot6:setNormal(true)
								slot6:setTextColor(cc.c4b(255, 230, 201, 255), cc.c4b(255, 230, 201, 255))
							end
						end
					end
				end, nil, nil)
			end
		elseif slot1 == VIPTABCONST.ACC_CHARGE then
			slot0.container_1:addChild(AccChargePanel.new())
		elseif slot1 == VIPTABCONST.CHARGE then
			slot0.container_1:addChild(ChargePanel.new())
		elseif slot1 == VIPTABCONST.DAILY_GIFT then
			slot0.container_1:addChild(DailyGiftPanel.new())
		elseif slot1 == VIPTABCONST.PRIVILEGE then
			slot0.container_1:addChild(PrivilegePanel.new())
		elseif slot1 == VIPTABCONST.KLB then
			slot0.container_1:addChild(KlbPanel.new())
		end

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function VipMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0.ctrl:openVipMainWindow(false)
	end, true, 2)

	if slot0.update_buy == nil then
		slot0.update_buy = GlobalEvent:getInstance():Bind(VipEvent.UPDATE_GET_LIST, function ()
		end)
	end

	if slot0.role_vo and slot0.role_update_event == nil then
		slot0.role_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "vip_lev" then
				uv0:updateBar()
			elseif slot0 == "vip_exp" then
				uv0:updateBar()
			end
		end)
	end

	if slot0.update_acc == nil then
		slot0.update_acc = GlobalEvent:getInstance():Bind(VipEvent.ACC_RECHARGE_INFO, function ()
			uv0:setTabRedStatus(uv0.model:getIsGetAcc(), VIPTABCONST.ACC_CHARGE)
		end)
	end

	if slot0.updata_vip_item_redpont == nil then
		slot0.updata_vip_item_redpont = GlobalEvent:getInstance():Bind(VipEvent.UPDATA_ITEM_REDPOINT, function ()
		end)
	end

	if slot0.updata_vip_tab_redpoint == nil then
		slot0.updata_vip_tab_redpoint = GlobalEvent:getInstance():Bind(VipEvent.SUPRE_CARD_GET, function (slot0)
			uv0:setVisibleVIPTabRedPoint()
		end)
	end

	slot0:addGlobalEvent(WelfareEvent.Update_Daily_Awawd_Data, function ()
		uv0:updateDailyAwardRed()
	end)
	slot0:addGlobalEvent(WelfareEvent.Update_Daily_Gift_Red_Data, function ()
		uv0:updateDailyAwardRed()
	end)
	slot0:addGlobalEvent(VipEvent.PRIVILEGE_INFO, function ()
		uv0:updatePrivilegeTabRedPoint()
	end)
end

function VipMainWindow.setVisibleVIPTabRedPoint(slot0)
	slot0:setTabRedStatus(slot0.model:getMonthCard() or slot0.model:getGetGiftList()[slot0.role_vo.vip_lev] == nil and slot0.ctrl:getIsFirst(), VIPTABCONST.VIP)
end

function VipMainWindow.updatePrivilegeTabRedPoint(slot0)
	slot0:setTabRedStatus(slot0.model:getPrivilegeRedStatus(), VIPTABCONST.PRIVILEGE)
end

function VipMainWindow.updateDailyAwardRed(slot0)
	slot0:setTabRedStatus(WelfareController:getInstance():getModel():getDailyGiftRedStatus(), VIPTABCONST.DAILY_GIFT)
end

function VipMainWindow.setTabRedStatus(slot0, slot1, slot2, slot3)
	if slot0.tab_btn_list[slot2] then
		slot4:showRedTips(slot1, slot3)
	end
end

function VipMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.view_list = nil

	for slot4, slot5 in pairs(slot0.tab_btn_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.now_vip then
		slot0.now_vip:DeleteMe()

		slot0.now_vip = nil
	end

	if slot0.next_vip then
		slot0.next_vip:DeleteMe()

		slot0.next_vip = nil
	end

	if slot0.charge_num then
		slot0.charge_num:DeleteMe()

		slot0.charge_num = nil
	end

	if slot0.vip_desc_load then
		slot0.vip_desc_load:DeleteMe()

		slot0.vip_desc_load = nil
	end

	if slot0.update_buy then
		GlobalEvent:getInstance():UnBind(slot0.update_buy)

		slot0.update_buy = nil
	end

	if slot0.update_acc then
		GlobalEvent:getInstance():UnBind(slot0.update_acc)

		slot0.update_acc = nil
	end

	if slot0.updata_vip_item_redpont then
		GlobalEvent:getInstance():UnBind(slot0.updata_vip_item_redpont)

		slot0.updata_vip_item_redpont = nil
	end

	if slot0.updata_vip_tab_redpoint then
		GlobalEvent:getInstance():UnBind(slot0.updata_vip_tab_redpoint)

		slot0.updata_vip_tab_redpoint = nil
	end

	if slot0.role_vo then
		if slot0.role_update_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_update_event)

			slot0.role_update_event = nil
		end

		slot0.role_vo = nil
	end

	slot0.ctrl:openVipMainWindow(false)
end

VipPanelItem = class("VipPanelItem", function ()
	return ccui.Widget:create()
end)

function VipPanelItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function VipPanelItem.configUI(slot0)
	slot0.size = cc.size(153, 79)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.role_vip = RoleController:getInstance():getRoleVo()
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("vip/vip_panel_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.text_vip = slot0.container:getChildByName("VIP")
	slot0.text_reward = slot0.container:getChildByName("text_reward")
	slot0.normal = slot0.container:getChildByName("normal")
	slot0.select = slot0.container:getChildByName("select")

	slot0.select:setVisible(false)
end

function VipPanelItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function VipPanelItem.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function VipPanelItem.getData(slot0)
	return slot0.data
end

function VipPanelItem.setVisibleRedStatus(slot0, slot1)
	addRedPointToNodeByStatus(slot0.container, slot1, -2, 5)
end

function VipPanelItem.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = VipController:getInstance():getPrivilegeRedpoint(slot1.lev + 1) == true and true or false

	if slot1.lev == slot0.role_vip.vip_lev or VipController:getInstance():getModel():checkGiftList(slot1.lev) == true then
		slot2 = false
	end

	slot0:setVisibleRedStatus(slot2)

	if slot0.role_vip.vip_lev == slot1.lev then
		slot0:setSelect(true)
		slot0:setNormal(false)
		slot0:setTextColor(cc.c4b(255, 255, 255, 255), cc.c4b(166, 66, 28, 255))
	else
		slot0:setTextColor(cc.c4b(255, 230, 201, 255), cc.c4b(255, 230, 201, 255))
	end

	slot0.text_vip:setString(TI18N("VIP") .. slot1.lev)

	if slot1.desc then
		slot0.text_reward:setString(slot1.desc)
	end
end

function VipPanelItem.setNormal(slot0, slot1)
	slot0.normal:setVisible(slot1)
end

function VipPanelItem.setSelect(slot0, slot1)
	slot0.select:setVisible(slot1)
end

function VipPanelItem.setTextColor(slot0, slot1, slot2)
	slot0.text_vip:setTextColor(slot1)
	slot0.text_reward:setTextColor(slot2)
end

function VipPanelItem.DeleteMe(slot0)
	slot0:removeAllChildren()
end
