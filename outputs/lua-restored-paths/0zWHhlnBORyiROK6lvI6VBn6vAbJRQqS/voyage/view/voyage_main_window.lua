VoyageMainWindow = VoyageMainWindow or BaseClass(BaseView)
slot1 = VoyageController:getInstance():getModel()
slot2 = table.sort

function VoyageMainWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "voyage/voyage_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("voyage", "voyage"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "txt_cn_bigbg_22"),
			type = ResourcesType.single
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.order_data = {}
end

function VoyageMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("远航商人"))

	slot0.refresh_btn = slot1:getChildByName("refresh_btn")
	slot3 = slot0.refresh_btn:getContentSize()
	slot0.refresh_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot3.width / 2, slot3.height / 2))

	slot0.refresh_btn:addChild(slot0.refresh_btn_label)

	slot0.special_btn = slot1:getChildByName("special_btn")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.receive_btn = slot1:getChildByName("receive_btn")

	slot0.receive_btn:getChildByName("label"):setString(TI18N("一键领取"))

	slot0.progress = slot1:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot1:getChildByName("progress_value")
	slot0.no_order_image = slot1:getChildByName("no_order_image")

	slot0.no_order_image:getChildByName("label"):setString(TI18N("刷新获取新的订单"))

	slot4 = Config.ShippingData.data_const.refresh_cost
	slot0.cost_item_bid = slot4.val[1][1]
	slot0.cost_item_num = slot4.val[1][2]
	slot0.item_count = slot1:getChildByName("item_count")

	loadSpriteTexture(slot1:getChildByName("item_icon"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.cost_item_bid).icon), LOADTEXT_TYPE)

	slot7 = slot1:getChildByName("order_list")
	slot8 = slot7:getContentSize()
	slot0.order_scrollview = CommonScrollViewSingleLayout.new(slot7, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot8.width - 10, slot8.height - 10), {
		start_y = 0,
		row = 0,
		start_x = 10,
		space_x = 0,
		item_width = 631,
		item_height = 171,
		space_y = 8,
		col = 1,
		need_dynamic = true
	})

	slot0.order_scrollview:setSwallowTouches(false)
	slot0.order_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.order_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.order_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function VoyageMainWindow._createNewCell(slot0)
	return VoyageOrderItem.new()
end

function VoyageMainWindow._numberOfCells(slot0)
	if not slot0.order_data then
		return 0
	end

	return #slot0.order_data
end

function VoyageMainWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.order_data then
		return
	end

	slot1.index = slot2

	if not slot0.order_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function VoyageMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.explain_btn, handler(slot0, slot0._onClickExplainBtn))
	registerButtonEventListener(slot0.special_btn, handler(slot0, slot0._onClickSpecialBtn), true)
	registerButtonEventListener(slot0.refresh_btn, handler(slot0, slot0._onClickRefreshBtn), true)
	registerButtonEventListener(slot0.receive_btn, handler(slot0, slot0._onClickReceiveBtn), true)
	slot0:addGlobalEvent(VoyageEvent.UpdateVoyageDataEvent, function ()
		uv0:refreshOrderList()
		uv0:refreshBtnStatus()
	end)
	slot0:addGlobalEvent(VoyageEvent.DeleteOrderDataEvent, function ()
		uv0:refreshOrderList(true)
	end)

	if slot0.role_assets_event == nil then
		if slot0.role_vo == nil then
			slot0.role_vo = RoleController:getInstance():getRoleVo()
		end

		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "energy" then
				uv0:refreshProgressInfo()
			elseif slot0 == "vip_lev" then
				uv0:refreshBtnStatus()
			end
		end)
	end

	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
			return
		end

		uv0:checkNeedUpdateItemNum(slot1)
	end)
end

function VoyageMainWindow.openRootWnd(slot0)
	if uv0:checkIsHaveOrderData() then
		slot0:refreshOrderList()
		slot0:refreshBtnStatus()
	else
		uv1:requestVoyageInfo()
	end

	slot0:refreshProgressInfo()
	slot0:refreshItemNum()
	slot0:updateSpecialEffectStatus()
end

function VoyageMainWindow.refreshOrderList(slot0, slot1)
	slot0.order_data = uv0:getAllOrderList() or {}

	if next(slot0.order_data) == nil then
		slot0.no_order_image:setVisible(true)
		slot0.order_scrollview:reloadData()
	else
		slot2 = {
			[VoyageConst.Order_Status.Finish] = 1,
			[VoyageConst.Order_Status.Unget] = 2,
			[VoyageConst.Order_Status.Underway] = 3
		}

		function slot7(slot0, slot1)
			slot2 = uv0[slot0.status]
			slot3 = uv0[slot1.status]

			if slot0.order_id == 1 and slot0.status == VoyageConst.Order_Status.Unget and slot1.order_id ~= 1 then
				return true
			elseif slot0.order_id ~= 1 and slot1.order_id == 1 and slot1.status == VoyageConst.Order_Status.Unget then
				return false
			elseif slot2 == slot3 then
				if slot0.status == VoyageConst.Order_Status.Unget then
					return slot1.config.quality < slot0.config.quality
				else
					return slot0.end_time < slot1.end_time
				end
			else
				return slot2 < slot3
			end
		end

		uv1(slot0.order_data, slot7)

		for slot7, slot8 in ipairs(slot0.order_data) do
			slot8.index = slot7
		end

		slot0.order_scrollview:reloadData(nil, nil, slot1)
		slot0.no_order_image:setVisible(false)
	end
end

function VoyageMainWindow.refreshBtnStatus(slot0)
	if not Config.ShippingData.data_refresh[slot0.role_vo.vip_lev] then
		return
	end

	if uv0:getFreeTimes() < slot1.free_times then
		slot0.refresh_btn_label:setString(TI18N("<div fontcolor=#ffffff outline=2,#020019>免费刷新</div>"))
		setChildUnEnabled(false, slot0.refresh_btn)

		return
	end

	if slot0.cost_item_num <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid) then
		slot0.refresh_btn_label:setString(string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff outline=2,#020019>%d 刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.cost_item_bid).icon), slot0.cost_item_num))
		setChildUnEnabled(false, slot0.refresh_btn)

		return
	end

	if uv0:getCoinTimes() < slot1.all_times then
		slot0.refresh_btn_label:setString(string.format(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#ffffff outline=2,#020019>%d 刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1.expend[1][1]).icon), slot1.expend[1][2]))
		setChildUnEnabled(false, slot0.refresh_btn)

		return
	end

	slot0.refresh_btn_label:setString(TI18N("<div fontcolor=#ffffff>刷新</div>"))
	setChildUnEnabled(true, slot0.refresh_btn)
end

function VoyageMainWindow.refreshProgressInfo(slot0)
	if slot0.role_vo then
		slot1 = slot0.role_vo.energy
		slot2 = slot0.role_vo.energy_max

		slot0.progress_value:setString(slot1 .. "/" .. slot2)
		slot0.progress:setPercent(slot1 / slot2 * 100)
	end
end

function VoyageMainWindow.refreshItemNum(slot0)
	slot0.item_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid))
end

function VoyageMainWindow.checkNeedUpdateItemNum(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6.config then
			if slot0.cost_item_bid and slot6.config.id == slot0.cost_item_bid then
				slot0:refreshItemNum()
				slot0:refreshBtnStatus()

				break
			end
		end
	end
end

function VoyageMainWindow.updateSpecialEffectStatus(slot0)
	if RoleController:getInstance():getModel():checkPrivilegeStatus(2) or RoleController:getInstance():getModel():checkPrivilegeStatus(3) then
		slot0:handleEffect(true)
	else
		slot0:handleEffect(false)
	end
end

function VoyageMainWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil
		end
	elseif not tolua.isnull(slot0.special_btn) and slot0.play_effect == nil then
		slot2 = slot0.special_btn:getContentSize()
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(628), cc.p(slot2.width * 0.5, slot2.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.special_btn:addChild(slot0.play_effect)
	end
end

function VoyageMainWindow._onClickCloseBtn(slot0)
	uv0:openVoyageMainWindow(false)
end

function VoyageMainWindow._onClickExplainBtn(slot0, slot1, slot2)
	if Config.ShippingData.data_explain[1] then
		TipsManager:getInstance():showCommonTips(slot3.desc, slot2:getTouchBeganPosition())
	end
end

function VoyageMainWindow._onClickSpecialBtn(slot0, slot1, slot2)
	slot6 = ""

	for slot10 = 1, 2 do
		if Config.ShippingData.data_explain[slot10 + 1] then
			slot13 = slot11.desc or ""
			slot13 = ({
				RoleController:getInstance():getModel():checkPrivilegeStatus(2),
				RoleController:getInstance():getModel():checkPrivilegeStatus(3)
			})[slot10] and slot13 .. TI18N("<div fontcolor=249003>（已激活）</div>") or slot13 .. TI18N("<div fontcolor=CF7A41>（未激活）                        </div>") .. string.format("<div href=xxx fontcolor=249003>%s</div>", TI18N("前往激活"))
			slot6 = slot10 == 1 and slot13 or slot13 .. [[
<div>


</div>]] .. slot13
		end
	end

	slot7 = slot2:getTouchBeganPosition()
	slot0.common_tips = TipsManager:getInstance():showCommonTips(slot6, cc.p(slot7.x, slot7.y - 80))

	slot0.common_tips.tips_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3, slot4)
		if slot1 == "xxx" then
			TipsManager:getInstance():hideTips()
			uv0:_onClickGoToActivate()
		end
	end, {
		"click",
		"href"
	})
end

function VoyageMainWindow._onClickRefreshBtn(slot0)
	if not uv0:checkRefreshReqIsBack() then
		message(TI18N("刷新过快"))

		return
	end

	if uv1:checkIsHaveHigherEpicOrder() then
		CommonAlert.show(string.format(TI18N("有紫色以上的远航任务未接取，是否继续？")), TI18N("确定"), function ()
			uv0:requestRefreshOrder()
		end, TI18N("取消"), nil, CommonAlert.type.common)
	else
		uv0:requestRefreshOrder()
	end
end

function VoyageMainWindow._onClickReceiveBtn(slot0)
	uv0:requestQuickReceiveOrder()
end

function VoyageMainWindow._onClickGoToActivate(slot0)
	VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
end

function VoyageMainWindow.close_callback(slot0)
	if slot0.order_scrollview then
		slot0.order_scrollview:DeleteMe()

		slot0.order_scrollview = nil
	end

	if slot0.role_assets_event then
		if slot0.role_vo then
			slot0.role_vo:UnBind(slot0.role_assets_event)
		end

		slot0.role_assets_event = nil
		slot0.role_vo = nil
	end

	slot0:handleEffect(false)
	uv0:openVoyageMainWindow(false)
end
