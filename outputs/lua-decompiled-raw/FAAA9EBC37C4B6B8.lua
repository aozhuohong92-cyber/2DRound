ActionHeroUpstarRechargePanel = class("ActionHeroUpstarRechargePanel", function ()
	return ccui.Widget:create()
end)
slot0 = {
	cc.c4b(128, 247, 49, 255),
	cc.c4b(90, 58, 38, 255)
}
slot1 = ActionController:getInstance()

function ActionHeroUpstarRechargePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.left_items = {}
	slot0.cell_data_list = {}
end

function ActionHeroUpstarRechargePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_hero_upstar_recharge"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.item_node = slot0.title_con:getChildByName("item_node")
	slot0.time_label = slot0.title_con:getChildByName("label_time_key")

	slot0.time_label:setString(TI18N("剩余时间："))

	slot0.time_text = slot0.title_con:getChildByName("label_time")

	slot0.time_text:setTextColor(uv0[1])
	slot0.time_text:setAnchorPoint(cc.p(0, 0.5))

	slot0.btn_rule = slot0.title_con:getChildByName("btn_rule")

	slot0:loadBannerImage()

	slot0.good_cons = slot0.main_container:getChildByName("charge_con")

	slot0:updateScrollviewList()
	uv1:cs16603(slot0.holiday_bid)
end

function ActionHeroUpstarRechargePanel.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 40,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 688,
			item_height = 140,
			space_y = 6,
			col = 1
		}, cc.p(0, 0))

		slot0.child_scrollview:setLocalZOrder(0)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

		if slot0.left_container == nil then
			slot0.left_container = createImage(slot0.child_scrollview.scroll_view, PathTool.getResFrame("common", "common_1039"), 0, slot1.height, cc.p(0, 1), true, 99, true)

			slot0.left_container:setContentSize(cc.size(140, 200))
		end
	end

	slot0.good_cons:getChildByName("img1"):setLocalZOrder(999)
	slot0.good_cons:getChildByName("img2"):setLocalZOrder(999)
	slot0.child_scrollview:setSwallowTouches(false)
	slot0.child_scrollview:reloadData()
end

function ActionHeroUpstarRechargePanel.createNewCell(slot0, slot1, slot2)
	return ActionHeroUpstarRechargeItem.new()
end

function ActionHeroUpstarRechargePanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionHeroUpstarRechargePanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list then
		return
	end

	slot1.index = slot2

	if slot0.tab ~= nil and slot1.setExtendData ~= nil then
		slot1:setExtendData(slot0.tab)
	end

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionHeroUpstarRechargePanel.loadBannerImage(slot0)
	slot1 = slot0.title_con:getChildByName("title_img")
	slot2 = "hero_upstar_recharge_bg"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot3.reward_title ~= "" and slot3.reward_title then
		slot2 = slot3.reward_title
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(string.format("resource/bigbg/action/%s.png", slot2), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end
end

function ActionHeroUpstarRechargePanel.register_event(slot0)
	if not slot0.update_holiday_common_event then
		slot0.update_holiday_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setPanelData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HolidayClientData.data_constant.upstar_rules.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, true, 1)
end

function ActionHeroUpstarRechargePanel.setPanelData(slot0, slot1)
	slot3 = slot1.remain_sec or 0

	if slot0.child_scrollview then
		slot0.cell_data_list = slot1.aim_list
		slot0.tab = {
			bid = slot0.holiday_bid,
			time_end = false,
			finish = slot1.finish
		}

		slot0.child_scrollview:reloadData()
		slot0.left_container:setContentSize(cc.size(140, #slot0.cell_data_list * 146 + 40))
		slot0.left_container:setPositionY(#slot0.cell_data_list * 146 + 80)
	end

	slot0:createLeftCell()

	if slot0.hero_id and Config.PartnerData.data_partner_star(getNorKey(slot4.bid, Config.PartnerData.data_partner_base[slot0.hero_id].star or slot4.init_star or 1)) then
		slot8 = PathTool.getHeadIcon(slot7.head_id)

		if not slot0.head_icon then
			slot0.head_icon = createImage(slot0.item_node, nil, 103, 102)
		end

		slot0.head_icon:loadTexture(slot8, LOADTEXT_TYPE)
	end

	if slot0.holiday_bid == ActionRankCommonType.acc_luxury then
		slot0.time_text:setVisible(false)
		slot0.time_label:setVisible(false)
	else
		slot0.time_text:setVisible(true)
		slot0.time_label:setVisible(true)
		uv0:getModel():setCountDownTime(slot0.time_text, slot3, slot2)
	end
end

function ActionHeroUpstarRechargePanel.createLeftCell(slot0)
	for slot5 = 1, #slot0.cell_data_list do
		if not slot0.left_items[slot5] then
			slot6 = ActionHeroUpstarLeftCell.new()
			slot0.left_items[slot5] = slot6

			slot6:setPosition(cc.p(70, #slot0.cell_data_list * 146 + 40 - 40 - 146 * (slot5 - 1)))
			slot0.left_container:addChild(slot6)
		end

		slot8 = keyfind("aim_args_key", 18, slot0.cell_data_list[slot5].aim_args) and slot7.aim_args_val or 0

		if not slot0.hero_id then
			slot0.hero_id = slot8
		end

		slot0.left_items[slot5]:setData(slot8, keyfind("aim_args_key", 42, slot6.aim_args) and slot7.aim_args_val or 0)
	end
end

function ActionHeroUpstarRechargePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionHeroUpstarRechargePanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	for slot4, slot5 in pairs(slot0.left_items) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.left_items = {}

	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()
	end

	slot0.child_scrollview = nil

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end
end

ActionHeroUpstarLeftCell = class("ActionHeroUpstarRechargeItem", function ()
	return ccui.Widget:create()
end)

function ActionHeroUpstarLeftCell.ctor(slot0)
	slot0:configUI()
end

function ActionHeroUpstarLeftCell.configUI(slot0)
	slot0:setContentSize(cc.size(140, 140))

	slot0.label_star = createLabel(20, cc.c3b(68, 43, 13), nil, 38, 14, "")

	slot0.label_star:setAnchorPoint(cc.p(0.5, 0.5))
	createImage(slot0, PathTool.getResFrame("welfare", "welfare_44"), 70, 64, cc.p(0.5, 0.5), true):addChild(slot0.label_star)

	slot0.hero_item = HeroExhibitionItem.new(0.8, false)

	slot0:addChild(slot0.hero_item)
	slot0.hero_item:setPosition(cc.p(70, 0))
end

function ActionHeroUpstarLeftCell.setData(slot0, slot1, slot2)
	slot0.label_star:setString(string.format(TI18N("%s星"), StringUtil.numToChinese(slot2)))

	if Config.PartnerData.data_partner_base[slot1] then
		slot4 = clone(slot3)
		slot4.init_star = slot2
		slot4.star = slot2

		slot0.hero_item:setData(slot4)
	end
end

function ActionHeroUpstarLeftCell.DeleteMe(slot0)
	if slot0.hero_item then
		slot0.hero_item:DeleteMe()
	end

	slot0.hero_item = nil
end

ActionHeroUpstarRechargeItem = class("ActionHeroUpstarRechargeItem", function ()
	return ccui.Widget:create()
end)

function ActionHeroUpstarRechargeItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.good_list_data = {}
end

function ActionHeroUpstarRechargeItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_hero_upstar_recharge_item"))

	slot0:setContentSize(cc.size(680, 140))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_recharge = slot1:getChildByName("btn_charge")
	slot0.btn_recharge_label = slot0.btn_recharge:getChildByName("label")

	slot0.btn_recharge_label:setString("")

	slot0.limit_txt = slot1:getChildByName("limit_txt")

	slot0.limit_txt:setString("")

	slot0.item_node = slot1:getChildByName("item_node")
	slot0.item_reward = BackPackItem.new(false, true, false, 0.8)

	slot0.item_reward:setDefaultTip()
	slot0.item_reward:setSwallowTouches(false)
	slot0.item_node:addChild(slot0.item_reward)
	slot0.item_reward:setPosition(cc.p(65, 68))
	slot0.item_reward:setVisible(false)

	slot0.item_goods = slot1:getChildByName("good_cons")

	slot0:updateScrollviewList()

	slot0.limit_desc = createRichLabel(22, cc.c3b(104, 69, 42), cc.p(0.5, 0.5), cc.p(594, 98), nil, , 200)

	slot1:addChild(slot0.limit_desc)
end

function ActionHeroUpstarRechargeItem.updateScrollviewList(slot0)
	if slot0.good_scrollview == nil then
		slot0.good_scrollview = CommonScrollViewSingleLayout.new(slot0.item_goods, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.item_goods:getContentSize(), {
			start_y = 4,
			once_num = 1,
			start_x = 3,
			row = 1,
			delay = 4,
			space_x = 5,
			space_y = 4,
			col = 0,
			item_width = BackPackItem.Width * 0.8,
			item_height = BackPackItem.Height * 0.8
		}, cc.p(0, 0))

		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.good_scrollview:setSwallowTouches(false)
end

function ActionHeroUpstarRechargeItem.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new()

	slot3:setDefaultTip()
	slot3:setSwallowTouches(false)
	slot3:setScale(0.8)

	return slot3
end

function ActionHeroUpstarRechargeItem.numberOfCells(slot0)
	if not slot0.good_list_data then
		return 0
	end

	return #slot0.good_list_data
end

function ActionHeroUpstarRechargeItem.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.good_list_data then
		return
	end

	slot1.index = slot2

	if not slot0.good_list_data[slot2] then
		return
	end

	slot1:setData(slot3)
	slot1:setItemIconUnEnabled(slot0.is_finish)
end

function ActionHeroUpstarRechargeItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_recharge, function ()
		if Config.ChargeData.data_charge_data[uv0.charge_id] and uv0.can_charge then
			sdkOnPay(slot0.val, 1, slot0.id, slot0.name, slot0.name)
		end
	end, true, 1)
end

function ActionHeroUpstarRechargeItem.setExtendData(slot0, slot1)
	slot0.holiday_item_bid = slot1.bid
	slot0.is_activity_end = slot1.time_end
	slot0.finish = slot1.finish
end

function ActionHeroUpstarRechargeItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0:getButtonTeskProgress(slot1)

	if slot0.is_activity_end == true and slot1.status == 0 then
		slot0.btn_recharge_label:setString(TI18N("已结束"))
		slot0.btn_recharge_label:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.btn_recharge)
		slot0.btn_recharge:setTouchEnabled(false)
	end

	for slot7, slot8 in pairs(slot1.item_list) do
		if slot7 ~= 1 then
			table.insert({}, {
				bid = slot8.bid,
				quantity = slot8.num
			})
		else
			slot0.good_reward = slot9
		end
	end

	if slot0.good_reward then
		slot0.item_reward:setVisible(true)
		slot0.item_reward:setData(slot0.good_reward)

		if slot0.data.status == 0 then
			slot0.item_reward:addBtnCallBack(nil)
			slot0.item_reward:showArtifactLock(true)
		elseif slot0.data.status == 1 then
			slot0.item_reward:showArtifactLock(false)
			slot0.item_reward:addBtnCallBack(function ()
				if uv0.data.status == 1 then
					uv1:cs16604(uv0.holiday_item_bid, uv0.data.aim)
				end
			end)
		elseif slot0.data.status == 2 then
			slot0.item_reward:addBtnCallBack(nil)
			slot0.item_reward:showArtifactLock(false)
		end

		slot0.item_reward:setItemIconUnEnabled(slot0.data.status == 2)
	end

	if #slot3 > 2 then
		slot0.good_scrollview:setClickEnabled(true)
	else
		slot0.good_scrollview:setClickEnabled(false)
	end

	slot0.good_list_data = slot3

	slot0.good_scrollview:reloadData()
end

function ActionHeroUpstarRechargeItem.getButtonTeskProgress(slot0, slot1)
	slot3 = keyfind("aim_args_key", 4, slot1.aim_args) and slot2.aim_args_val or 0
	slot4 = keyfind("aim_args_key", 6, slot1.aim_args) and slot2.aim_args_val or 0
	slot5 = keyfind("aim_args_key", 18, slot1.aim_args) and slot2.aim_args_val or 0
	slot0.charge_id = keyfind("aim_args_key", 33, slot1.aim_args) and slot2.aim_args_val or 0
	slot6 = keyfind("aim_args_key", 2, slot1.aim_args) and slot2.aim_args_val or 0
	slot7 = keyfind("aim_args_key", 32, slot1.aim_args) and slot2.aim_args_val or 0

	if Config.ChargeData.data_charge_data[slot0.charge_id] then
		slot0.btn_recharge_label:setString(string.format(TI18N("%s元"), slot8.val))
	else
		slot0.btn_recharge_label:setString(TI18N("购买"))
	end

	slot0.can_charge = false

	if slot0.data.status == 0 then
		setChildUnEnabled(true, slot0.btn_recharge)

		slot0.can_charge = false
		slot0.is_finish = false
	else
		slot0.can_charge = slot7 < slot6
		slot0.is_finish = slot6 <= slot7

		setChildUnEnabled(slot6 <= slot7, slot0.btn_recharge)
	end

	slot0.limit_desc:setString(string.format("限购:(<div fontColor=#2c7d08>%d</div>/%d)", slot7, slot6))
end

function ActionHeroUpstarRechargeItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	if slot0.item_reward then
		slot0.item_reward:DeleteMe()

		slot0.item_reward = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
