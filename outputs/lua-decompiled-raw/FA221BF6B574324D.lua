KlbPanel = class("KlbPanel", function ()
	return ccui.Widget:create()
end)

function KlbPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function KlbPanel.config(slot0)
	slot0.ctrl = VipController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.size = cc.size(660, 644)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/klb_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)

	slot0.item_list = {}
	slot0.select_item = nil
end

function KlbPanel.layoutUI(slot0)
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.scrollView = createScrollView(slot0.scrollCon:getContentSize().width, slot0.scrollCon:getContentSize().height, 0, 0, slot0.scrollCon, ccui.ScrollViewDir.vertical)
	slot0.item_num = 20

	slot0:createItemList()
end

function KlbPanel.registerEvents(slot0)
	if slot0.tips_btn then
		slot0.tips_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				TipsManager:getInstance():showCommonTips(Config.ChargeData.data_constant.triple_charge_rule.desc, slot0:getTouchBeganPosition())
			end
		end)
	end
end

function KlbPanel.createItemList(slot0)
	slot1 = {
		[slot5] = {
			add_gold = 0,
			is_first = 0,
			pic = 20,
			sort = slot6.sort,
			get_gold = slot6.val,
			need_rmb = slot6.gold,
			name = slot6.name,
			id = slot6.id,
			award = slot6.items
		}
	}

	for slot5 = 1, slot0.item_num do
		slot6 = Config.ChargeData.data_charge_data[30000 + slot5]
	end

	table.sort(slot1, SortTools.KeyLowerSorter("sort"))

	slot7 = cc.size

	slot0.scrollView:setInnerContainerSize(slot7(slot0.scrollView:getContentSize().width, math.max(slot0.scrollView:getContentSize().height, #slot1 * 159)))
	doStopAllActions(slot0.scrollView)

	for slot7, slot8 in ipairs(slot1) do
		delayRun(slot0.scrollView, 0.05 * slot7, function ()
			if uv0.item_list[uv1] == nil then
				slot0 = KlbItem.new(uv0.ctrl)

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

function KlbPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function KlbPanel.DeleteMe(slot0)
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

KlbItem = class("KlbItem", function ()
	return ccui.Widget:create()
end)

function KlbItem.ctor(slot0, slot1)
	slot0.ctrl = slot1

	slot0:configUI()

	slot0.item_list = {}
end

function KlbItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/klb_item"))

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

function KlbItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.charge_price:setString(slot1.need_rmb .. TI18N("元"))
	slot0.price:setString(slot1.name):setScale(0.7)
	slot0.extra_bg:setVisible(false)

	if slot1.is_first == TRUE then
		slot0.first_bg:setVisible(true)
	else
		slot0.first_bg:setVisible(false)
	end

	if slot1.add_gold > 0 then
		slot0.extra_bg:setVisible(true)
	else
		slot0.price_container:setPositionY(80)
	end

	slot2 = slot1.award or {}
	slot3 = nil
	slot4 = 1
	slot5 = nil
	slot6 = 0.8

	for slot14 = 1, #slot2 do
		if Config.ItemData.data_get_data(slot2[slot14][1]) then
			if slot0.item_list[slot4] == nil then
				slot5 = BackPackItem.new(false, true, false, slot6, false, true)

				slot5:setPosition(-95 + 20 + BackPackItem.Width * slot6, 25)
				slot0.icon:addChild(slot5)

				slot0.item_list[slot4] = slot5
			end

			slot5 = slot0.item_list[slot4]

			slot5:setBaseData(slot15[1], slot15[2])
			slot5:setVisible(true)

			slot4 = slot4 + 1
		end
	end

	if MAKELIFEBETTER == true and slot1.get_gold == 0 then
		slot0.price_container:setVisible(false)
	end
end

function KlbItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function KlbItem.changeDayTips(slot0, slot1, slot2, slot3)
end

function KlbItem.registerEvent(slot0)
	slot0.charge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.callback then
				uv0:callback()
			end

			uv0:sdkOnPay(uv0.data.need_rmb, nil, uv0.data.id, uv0.data.name, 9999)
		end
	end)
end

function KlbItem.getData(slot0)
	return slot0.data
end

function KlbItem.setSeclet(slot0, slot1)
end

function KlbItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

function KlbItem.sdkOnPay(slot0, slot1, slot2, slot3, slot4, slot5)
	if 1 > 2 then
		callFunc("touristMode", "10")
	else
		slot6 = LoginController:getInstance():getModel():getLoginData()

		if not RoleController:getInstance():getRoleVo() then
			return
		end

		slot8 = string.format("%s", slot3)

		if PAY_ID_FUNC then
			slot8 = PAY_ID_FUNC(slot3, slot1)
		elseif PAY_ID_NORMAL then
			slot8 = slot3
		end

		slot9 = Config.ChargeData.data_charge_data[slot3]

		printLuaTable(Config.ChargeData.data_charge_data[slot3])

		slot4 = slot4 or slot1 * 10 .. TI18N("快乐币")
		slot11 = slot6
		slot14 = slot7.skin_debris
		slot15, slot16 = unpack(Split(slot7.srv_id, "_"))
		slot18 = slot7.rid
		slot27 = table.concat({
			slot8,
			slot4,
			slot5 or slot4,
			slot1 * 100,
			slot2 or 1,
			slot7.gold,
			slot16,
			slot11.host,
			slot18,
			slot7.name,
			slot7.lev,
			"vip" .. slot7.vip_lev,
			slot7.rid .. "$$" .. slot15 .. "$$" .. slot16 .. "$$" .. LoginPlatForm:getInstance():getChannel() .. "$$" .. slot3 .. "$$" .. slot4,
			slot11.host,
			slot7.srv_id,
			slot11.usrName
		}, "#")
		slot28 = PAY_URI .. "?UserID=" .. slot6.usrName .. "&Money=" .. slot1 .. "&qu=" .. slot16 .. "&rid=" .. slot18 .. "&mid=" .. string.sub(slot7.main_srv_id, string.find(slot7.main_srv_id, "_") + 1)

		if IS_IOS_PLATFORM or PLATFORM == cc.PLATFORM_OS_IPHONE then
			CommonAlert.show(TI18N("请联系你的小助理！"), TI18N("确定"), function ()
				sdkCallFunc("openUrl", uv0)
			end, TI18N("取消"))
		elseif PLATFORM == cc.PLATFORM_OS_ANDROID then
			CommonAlert.show(TI18N("请联系你的小助理！"), TI18N("确定"), function ()
				sdkCallFunc("openUrl", uv0)
			end, TI18N("取消"))
		else
			CommonAlert.show(TI18N("请联系你的小助理！"), TI18N("确定"), function ()
				print("url--------------", uv0)
				print("PAY_URI----------------", PAY_URI)
			end, TI18N("取消"))
		end
	end
end
