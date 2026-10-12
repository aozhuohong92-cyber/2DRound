ChargePanel = class("ChargePanel", function ()
	return ccui.Widget:create()
end)

function ChargePanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ChargePanel.config(slot0)
	slot0.ctrl = VipController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.size = cc.size(660, 644)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/charge_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)

	slot0.item_list = {}
	slot0.select_item = nil
end

function ChargePanel.layoutUI(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.scrollView = createScrollView(slot0.scrollCon:getContentSize().width, slot0.scrollCon:getContentSize().height, 0, 0, slot0.scrollCon, ccui.ScrollViewDir.vertical)

	slot0.ctrl:sender16700()
	slot0.ctrl:sender21005()
	WelfareController:getInstance():sender16705()
end

function ChargePanel.registerEvents(slot0)
	if slot0.update_event == nil then
		slot0.update_event = GlobalEvent:getInstance():Bind(VipEvent.UPDATE_CHARGE_LIST, function (slot0)
			for slot4, slot5 in pairs(slot0) do
				if Config.ChargeData.data_charge_data[slot5.id] then
					slot5.sort = Config.ChargeData.data_charge_data[slot5.id].sort
				end
			end

			table.sort(slot0, SortTools.KeyLowerSorter("sort"))
			uv0:createItemList(slot0)
		end)
	end

	if slot0.tips_btn then
		slot0.tips_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				TipsManager:getInstance():showCommonTips(Config.ChargeData.data_constant.triple_charge_rule.desc, slot0:getTouchBeganPosition())
			end
		end)
	end
end

function ChargePanel.createItemList(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot7 = cc.size

	slot0.scrollView:setInnerContainerSize(slot7(slot0.scrollView:getContentSize().width, math.max(slot0.scrollView:getContentSize().height, #slot1 * 159)))
	doStopAllActions(slot0.scrollView)

	for slot7, slot8 in ipairs(slot1) do
		delayRun(slot0.scrollView, 0.05 * slot7, function ()
			if uv0.item_list[uv1] == nil then
				slot0 = ChargeItem.new(uv0.ctrl)

				slot0:setPosition(cc.p(2, uv2 - (uv1 - 1) * uv3))
				slot0:addCallBack(function (slot0)
					if uv0.select_item ~= nil and uv0.select_item:getData().id ~= slot0:getData().id then
						uv0.select_item:setSeclet(false)
					end

					uv0.select_item = slot0
				end)
				uv0.scrollView:addChild(slot0)

				uv0.item_list[uv1] = slot0
			end

			uv0.item_list[uv1]:setData(uv4)
		end)
	end
end

function ChargePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function ChargePanel.DeleteMe(slot0)
	doStopAllActions(slot0.scrollView)

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end

		slot0.item_list = nil
	end

	if slot0.update_event then
		GlobalEvent:getInstance():UnBind(slot0.update_event)

		slot0.update_event = nil
	end

	if slot0.update_three then
		GlobalEvent:getInstance():UnBind(slot0.update_three)

		slot0.update_three = nil
	end
end

ChargeItem = class("ChargeItem", function ()
	return ccui.Widget:create()
end)

function ChargeItem.ctor(slot0, slot1)
	slot0.ctrl = slot1

	slot0:configUI()
end

function ChargeItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/charge_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(674, 159))
	slot0:setTouchEnabled(true)
	slot0:setSwallowTouches(false)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.price_container = slot0.main_container:getChildByName("price_container")
	slot0.coin = slot0.price_container:getChildByName("coin")
	slot0.price = slot0.price_container:getChildByName("price")
	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.charge_btn = slot0.main_container:getChildByName("charge_btn")
	slot0.charge_price = slot0.charge_btn:getChildByName("label")
	slot0.extra_bg = slot0.main_container:getChildByName("extra_bg")
	slot0.extra_desc = slot0.extra_bg:getChildByName("give")

	slot0.extra_desc:setString(TI18N("再赠!"))

	slot0.extra_label = createRichLabel(30, 193, cc.p(0.5, 0.5), cc.p(0, 0))

	slot0.extra_bg:addChild(slot0.extra_label)

	slot0.first_bg = slot0.main_container:getChildByName("first")

	slot0.first_bg:setVisible(false)

	slot0.first_label = slot0.first_bg:getChildByName("first_label")

	slot0.first_label:setString(TI18N("首次"))
	slot0:registerEvent()
end

function ChargeItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.charge_price:setString(slot1.need_rmb / 100 .. TI18N("元"))
	slot0.price:setString(slot1.get_gold)
	slot0.extra_bg:setVisible(false)

	if slot1.is_first == TRUE then
		slot0.first_bg:setVisible(true)
	else
		slot0.first_bg:setVisible(false)
	end

	if slot1.add_gold > 0 then
		slot0.extra_bg:setVisible(true)
		slot0.extra_label:setString(string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#975324>%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), slot1.add_gold))
	else
		slot0.price_container:setPositionY(80)
	end

	loadSpriteTexture(slot0.icon, PathTool.getResFrame("vip", "vip_icon" .. slot1.pic), LOADTEXT_TYPE_PLIST)

	if MAKELIFEBETTER == true and slot1.get_gold == 0 then
		slot0.price_container:setVisible(false)
	end
end

function ChargeItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ChargeItem.changeDayTips(slot0, slot1, slot2, slot3)
end

function ChargeItem.registerEvent(slot0)
	slot0.charge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.callback then
				uv0:callback()
			end

			sdkOnPay(uv0.data.need_rmb / 100, nil, uv0.data.id, uv0.data.name)
		end
	end)
end

function ChargeItem.getData(slot0)
	return slot0.data
end

function ChargeItem.setSeclet(slot0, slot1)
end

function ChargeItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
