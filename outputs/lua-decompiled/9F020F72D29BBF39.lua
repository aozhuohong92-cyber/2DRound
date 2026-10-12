ActionSuperValueWeeklyCardPanel = class("ActionSuperValueWeeklyCardPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()
slot2 = string.format

function ActionSuperValueWeeklyCardPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:loadResources()

	slot0.good_list_data = {}
end

function ActionSuperValueWeeklyCardPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("superweekcard", "superweekcard_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("superweekcard", "superweekcard_time_bg"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.configUI then
			uv0:configUI()
		end

		if uv0.register_event then
			uv0:register_event()
		end
	end)
end

function ActionSuperValueWeeklyCardPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_super_value_weekly_card_panel"))

	slot0.root_wnd:setPosition(-40, -80)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("终身限时购买："))

	slot0.txt_time_val = slot0.main_container:getChildByName("txt_time_val")
	slot0.btn_charge = slot0.main_container:getChildByName("btn_charge")
	slot0.txt_charge = slot0.btn_charge:getChildByName("txt_charge")
	slot0.award_group = slot0.main_container:getChildByName("award_group")
	slot0.img_bg = slot0.main_container:getChildByName("img_bg")
	slot0.time_bg = slot0.main_container:getChildByName("time_bg")
	slot1 = "superweekcard_bg"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.reward_title ~= "" and slot2.reward_title then
		slot1 = slot2.reward_title
	end

	if not slot0.background_load then
		slot0.background_load = loadSpriteTextureFromCDN(slot0.img_bg, PathTool.getPlistImgForDownLoad("superweekcard", slot1), ResourcesType.single, slot0.background_load)
	end

	slot0:createAwardItem()
	uv0:sender16653()
end

function ActionSuperValueWeeklyCardPanel.register_event(slot0)
	registerButtonEventListener(slot0.btn_charge, function ()
		uv0:onClickCharge()
	end, true, 1)

	if slot0.update_event == nil then
		slot0.update_event = GlobalEvent:getInstance():Bind(ActionEvent.SuperValueWeeklyCard_Init_Event, function (slot0)
			uv0:setData(slot0)
		end)
	end

	if slot0.charge_event == nil then
		slot0.charge_event = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if uv0.cur_charge_id and slot0 and uv0.cur_charge_id == slot0.charge_id and slot0.status == 1 then
				slot1 = Config.ChargeData.data_charge_data

				if uv0.cur_charge_id and slot1[uv0.cur_charge_id] then
					sdkOnPay(slot1[uv0.cur_charge_id].val, 1, slot1[uv0.cur_charge_id].id, slot1[uv0.cur_charge_id].name)
				end
			end
		end)
	end
end

function ActionSuperValueWeeklyCardPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.data.is_buy and slot0.data.is_buy == 1 then
		slot0.time_bg:setVisible(false)
		slot0.txt_time_title:setVisible(false)
		slot0.txt_time_val:setVisible(false)
		slot0.btn_charge:setVisible(false)
	else
		slot0.time_bg:setVisible(true)
		slot0.txt_time_title:setVisible(true)
		slot0.txt_time_val:setVisible(true)
		slot0.btn_charge:setVisible(true)
		uv0:setCountDownTime(slot0.txt_time_val, slot0.data.end_time - GameNet:getInstance():getTime())

		slot0.cur_charge_id = slot0.data.charge_id

		if slot0.cur_charge_id then
			slot3 = Config.ChargeData.data_charge_data

			if slot0.cur_charge_id and slot3 and slot3[slot0.cur_charge_id] then
				slot0.txt_charge:setString(slot3[slot0.cur_charge_id].val .. TI18N("元"))
			end
		end
	end

	slot0:awardListData()
end

function ActionSuperValueWeeklyCardPanel.awardListData(slot0)
	if uv0:getSuperWeekAward() and next(slot1) then
		for slot5 = 1, 7 do
			if slot0.award_item_list and slot0.award_item_list[slot5] and slot1[slot5] then
				slot0.award_item_list[slot5]:setData(slot1[slot5])
			end
		end
	end
end

function ActionSuperValueWeeklyCardPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionSuperValueWeeklyCardPanel.onClickCharge(slot0)
	if slot0.cur_charge_id ~= nil then
		ActionController:getInstance():sender21016(slot0.cur_charge_id)
	end
end

function ActionSuperValueWeeklyCardPanel.createAwardItem(slot0)
	if slot0.award_item_list == nil then
		slot0.award_item_list = {}
	end

	for slot4 = 1, 7 do
		slot5 = slot0.award_item_list[slot4] or ActionSuperValueWeeklyCardItem.new()

		if slot0.award_group:getChildByName("award_item_" .. slot4) then
			slot6:addChild(slot5)

			slot0.award_item_list[slot4] = slot5
		end
	end
end

function ActionSuperValueWeeklyCardPanel.DeleteMe(slot0)
	doStopAllActions(slot0.txt_time_val)

	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.charge_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.charge_event)

		slot0.charge_event = nil
	end

	if slot0.update_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_event)

		slot0.update_event = nil
	end

	for slot4, slot5 in pairs(slot0.award_item_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	slot0.award_item_list = nil
end

ActionSuperValueWeeklyCardItem = class("ActionSuperValueWeeklyCardItem", function ()
	return ccui.Widget:create()
end)

function ActionSuperValueWeeklyCardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionSuperValueWeeklyCardItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_super_value_weekly_card_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(115, 150))
	slot0:setAnchorPoint(0, 0)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.name_txt = slot0.container:getChildByName("name_txt")
	slot0.time_txt = slot0.container:getChildByName("time_txt")
end

function ActionSuperValueWeeklyCardItem.register_event(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.id and uv0.data.finish == 1 then
				uv1:sender16654(uv0.data.id)
			end
		end
	end)
end

function ActionSuperValueWeeklyCardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.data.award_time - GameNet:getInstance():getTime() <= 86400 and slot2 > 0 then
		slot0.time_txt:setTextColor(cc.c4b(149, 83, 34, 255))
		commonCountDownTime(slot0.time_txt, slot2)
	else
		slot0.time_txt:setTextColor(cc.c4b(165, 108, 76, 255))
		slot0.time_txt:setString(uv0(TI18N("第%s天"), slot0.data.id))
	end

	if slot0.data.award and slot0.data.award[1] then
		if not slot0.item_node then
			slot0.item_node = BackPackItem.new(false, true, false, 0.9, false, true)

			slot0.item_node:setDefaultTip(true, false)
			slot0.item_node:setPosition(cc.p(slot0.container:getContentSize().width / 2, 90))
			slot0.container:addChild(slot0.item_node)
		end

		slot0.item_node:setBaseData(slot0.data.award[1].bid, slot0.data.award[1].num)
	end

	if slot0.item_effect == nil then
		if slot0.data.acv_id and slot0.data.acv_id ~= 0 and slot0.data.finish ~= 2 then
			slot3 = slot0.item_node:getContentSize().width / 2
			slot4 = slot0.item_node:getContentSize().height / 2
			slot5 = "action"
			slot6 = 1

			if slot0.data.acv_id == 263 then
				slot5 = "action1"
				slot6 = 1.1
			end

			slot0.item_effect = createEffectSpine(PathTool.getEffectRes(slot0.data.acv_id), cc.p(slot3, slot4), cc.p(0.5, 0.5), true, slot5)

			slot0.item_effect:setScale(slot6)
			slot0.item_node:addChild(slot0.item_effect)
		end
	elseif slot0.data and (slot0.data.acv_id == nil or slot0.data.acv_id == 0 or slot0.data.finish == 2) then
		slot0.item_effect:setVisible(false)
	else
		slot0.item_effect:setVisible(true)
	end

	slot0.item_node:setTouchEnabled(true)

	if slot0.data.finish == 0 then
		if slot0.item_node:getData().name then
			slot0.name_txt:setString(slot3)
		end

		slot0.item_node:setReceivedIcon(false)
	elseif slot0.data.finish == 1 then
		slot0.item_node:setTouchEnabled(false)
		slot0.name_txt:setTextColor(cc.c4b(194, 90, 21, 255))
		slot0.name_txt:setString(TI18N("可领取"))
		slot0.item_node:setReceivedIcon(false)
	elseif slot0.data.finish == 2 then
		if slot0.item_node:getData().name then
			slot0.name_txt:setTextColor(cc.c4b(100, 50, 35, 255))
			slot0.name_txt:setString(slot3)
		end

		slot0.item_node:setReceivedIcon(true)
	end
end

function ActionSuperValueWeeklyCardItem.DeleteMe(slot0)
	doStopAllActions(slot0.time_txt)

	if slot0.item_effect then
		slot0.item_effect:clearTracks()
		slot0.item_effect:removeFromParent()

		slot0.item_effect = nil
	end

	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
