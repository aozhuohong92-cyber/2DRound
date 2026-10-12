slot1 = MallController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
ChargeDiamondPanel = ChargeDiamondPanel or BaseClass()

function ChargeDiamondPanel.__init(slot0, slot1, slot2)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.offset_y = slot2 or 0
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vip", "vip"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)
end

function ChargeDiamondPanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:registerEvent()
	slot0:updateVipRedStatus()
	VipController:getInstance():sender16700()
end

function ChargeDiamondPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/charge_normal_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.titleCon = slot0.main_container:getChildByName("titleCon")
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

	slot0.vip_btn = slot0.titleCon:getChildByName("vip_btn")

	slot0.vip_btn:getChildByName("label"):setString(TI18N("查看特权"))

	slot0.yuan = slot0.titleCon:getChildByName("yuan")
	slot0.Sprite_6 = slot0.titleCon:getChildByName("Sprite_6")
	slot0.Sprite_6_0 = slot0.titleCon:getChildByName("Sprite_6_0")

	slot0:updateBar()
	slot0:resetTitlePos()

	slot0.item_list = slot0.main_container:getChildByName("item_list")

	if MAKELIFEBETTER == true then
		slot0.titleCon:setVisible(false)
		slot0.item_list:setContentSize(cc.size(slot0.item_list:getContentSize().width, 1000))
		slot0.item_list:setAnchorPoint(cc.p(0.5, 1))
		slot0.item_list:setPositionY(display.getTop() - 300)
	end

	slot1 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, -slot0.offset_y), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot1.width, slot1.height + slot0.offset_y), {
		start_y = 10,
		row = 1,
		start_x = 0,
		space_x = 10,
		item_width = 211,
		item_height = 230,
		space_y = 15,
		col = 3,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function ChargeDiamondPanel.createNewCell(slot0)
	return ChargeDiamondItem.new()
end

function ChargeDiamondPanel.numberOfCells(slot0)
	if not slot0.charge_data then
		return 0
	end

	return #slot0.charge_data
end

function ChargeDiamondPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.charge_data then
		return
	end

	slot1.index = slot2

	if not slot0.charge_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ChargeDiamondPanel.registerEvent(slot0)
	registerButtonEventListener(slot0.vip_btn, function ()
		VipController:getInstance():openVipMainWindow(true)
	end, true)

	if slot0.role_vo and slot0.role_update_event == nil then
		slot0.role_update_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "vip_lev" or slot0 == "vip_exp" then
				uv0:updateBar()
			end
		end)
	end

	if slot0.update_event == nil then
		slot0.update_event = GlobalEvent:getInstance():Bind(VipEvent.UPDATE_CHARGE_LIST, function (slot0)
			for slot4, slot5 in pairs(slot0) do
				if Config.ChargeData.data_charge_data[slot5.id] then
					slot5.sort = Config.ChargeData.data_charge_data[slot5.id].sort
				end
			end

			uv0(slot0, SortTools.KeyLowerSorter("sort"))
			uv1:createItemList(slot0)
		end)
	end

	if slot0.update_vip_red_evetn == nil then
		slot0.update_vip_red_evetn = GlobalEvent:getInstance():Bind(VipEvent.Update_Gift_Red_state, function ()
			uv0:updateVipRedStatus()
		end)
	end
end

function ChargeDiamondPanel.updateVipRedStatus(slot0)
	addRedPointToNodeByStatus(slot0.vip_btn, VipController:getInstance():getVipRedStatus(), 5, 10)
end

function ChargeDiamondPanel.createItemList(slot0, slot1)
	slot0.charge_data = slot1 or {}

	slot0.item_scrollview:reloadData(nil, , true)
end

function ChargeDiamondPanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false
	end
end

function ChargeDiamondPanel.updateBar(slot0)
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

	if MAKELIFEBETTER == true then
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

function ChargeDiamondPanel.resetTitlePos(slot0)
	slot0.yuan:setPositionX(slot0.charge_num:getPositionX() + slot0.charge_num:getContentSize().width + 10)
	slot0.Sprite_6:setPositionX(slot0.yuan:getPositionX() + slot0.yuan:getContentSize().width + 5)
	slot0.Sprite_6_0:setPositionX(slot0.Sprite_6:getPositionX() + slot0.Sprite_6:getContentSize().width + 10)
	slot0.next_vip:setPositionX(slot0.Sprite_6_0:getPositionX() + slot0.Sprite_6_0:getContentSize().width + 5)
end

function ChargeDiamondPanel.addChild(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) and not tolua.isnull(slot1) then
		slot0.root_wnd:addChild(slot1)
	end
end

function ChargeDiamondPanel.setPosition(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setPosition(slot1)
	end
end

function ChargeDiamondPanel.__delete(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.role_vo then
		if slot0.role_update_event ~= nil then
			slot0.role_vo:UnBind(slot0.role_update_event)

			slot0.role_update_event = nil
		end

		slot0.role_vo = nil
	end

	if slot0.update_event then
		GlobalEvent:getInstance():UnBind(slot0.update_event)

		slot0.update_event = nil
	end

	if slot0.update_vip_red_evetn then
		GlobalEvent:getInstance():UnBind(slot0.update_vip_red_evetn)

		slot0.update_vip_red_evetn = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end

ChargeDiamondItem = class("ChargeDiamondItem", function ()
	return ccui.Widget:create()
end)

function ChargeDiamondItem.ctor(slot0)
	slot0:configUI()
end

function ChargeDiamondItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/charge_item"))

	slot0:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(211, 230))
	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.price_container = slot0.main_container:getChildByName("price_container")
	slot0.coin = slot0.price_container:getChildByName("coin")
	slot0.price = slot0.price_container:getChildByName("price")
	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.tag_icon = slot0.main_container:getChildByName("tag_icon")
	slot0.charge_price = slot0.main_container:getChildByName("charge_price")

	slot0.charge_price:setPositionY(slot0.tag_icon:getPositionY())

	slot0.extra_bg = slot0.main_container:getChildByName("extra_bg")

	slot0.extra_bg:setVisible(false)

	slot0.extra_desc = slot0.extra_bg:getChildByName("give")

	slot0.extra_desc:setString(TI18N("赠"))

	slot0.extra_label = createRichLabel(24, 193, cc.p(0.5, 0.5), cc.p(165, 82))

	slot0.main_container:addChild(slot0.extra_label)

	slot0.confirm_bg = slot0.main_container:getChildByName("confirm_bg")

	slot0.confirm_bg:setVisible(false)

	slot0.confirm_tips = slot0.main_container:getChildByName("confirm_tips")

	slot0.confirm_tips:setLocalZOrder(20)
	slot0.confirm_tips:setVisible(false)

	slot0.day_tips = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(105, 30))

	slot0.day_tips:setVisible(false)
	slot0.main_container:addChild(slot0.day_tips)

	slot0.first_bg = slot0.main_container:getChildByName("first_bg")

	slot0.first_bg:setVisible(false)

	slot0.first_label = slot0.first_bg:getChildByName("first_label")

	slot0.first_label:setString(TI18N("首次充值"))
	slot0:registerEvent()
end

function ChargeDiamondItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.charge_price:setString(slot1.need_rmb / 100)
	slot0.price:setString(slot1.get_gold)

	if slot1.is_first == TRUE then
		slot0.first_bg:setVisible(true)
	else
		slot0.first_bg:setVisible(false)
	end

	slot0.extra_bg:setVisible(false)
	slot0.extra_label:setVisible(false)

	if slot1.add_gold > 0 then
		slot0.extra_bg:setVisible(true)
		slot0.extra_desc:setString("赠")
		slot0.extra_label:setString(string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#5b2c06>%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(4).icon), slot1.add_gold))
		slot0.extra_label:setVisible(true)
	elseif slot1.id == 1 or slot1.id == 2 then
		slot0.coin:setVisible(false)
		slot0.price:setString(slot1.name)
		slot0.extra_bg:setVisible(true)
		slot0.extra_desc:setString("即得")
		slot0.extra_label:setString(string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#5b2c06>%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold).icon), slot1.get_gold))
		slot0.extra_label:setVisible(true)
		slot0.icon:setScale(0.8)
		slot0:updateYuekaInfoData(slot1)
	end

	loadSpriteTexture(slot0.icon, PathTool.getResFrame("common", "vip_icon" .. slot1.pic), LOADTEXT_TYPE_PLIST)

	if MAKELIFEBETTER == true and slot1.get_gold == 0 then
		slot0.price_container:setVisible(false)
	end
end

function ChargeDiamondItem.updateYuekaInfoData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = nil

	if slot1.id == 1 then
		slot2 = Config.ChargeData.data_constant.month_card1_items
	elseif slot1.id == 2 then
		slot2 = Config.ChargeData.data_constant.month_card2_items
	end

	if slot2 then
		if slot0.get_desc_label == nil then
			slot0.get_desc_label = createRichLabel(18, cc.c4b(68, 18, 2, 255), cc.p(0.5, 0.5), cc.p(106, 172))

			slot0.main_container:addChild(slot0.get_desc_label)
		end

		slot3 = ""

		for slot7, slot8 in ipairs(slot2.val) do
			slot10 = slot8[2]

			if slot8[1] and slot10 and Config.ItemData.data_get_data(slot9) then
				if slot3 ~= "" then
					slot3 = slot3 .. TI18N("和")
				end

				slot3 = slot3 .. string.format("%s<img src=%s scale=0.25 visible=true />", slot10, PathTool.getItemRes(slot11.icon))
			end

			slot0.get_desc_label:setString(string.format(TI18N("每日领") .. slot3))
		end
	end
end

function ChargeDiamondItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ChargeDiamondItem.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

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

				sdkOnPay(uv0.data.need_rmb / 100, nil, uv0.data.id, uv0.data.name)
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

function ChargeDiamondItem.getData(slot0)
	return slot0.data
end

function ChargeDiamondItem.setSeclet(slot0, slot1)
	slot0.confirm_tips:setVisible(slot1)
	slot0.confirm_bg:setVisible(slot1)
end

function ChargeDiamondItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
