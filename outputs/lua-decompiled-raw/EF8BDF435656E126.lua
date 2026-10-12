AccChargePanel = class("AccChargePanel", function ()
	return ccui.Widget:create()
end)

function AccChargePanel.ctor(slot0)
	slot0:layoutUI()
	slot0:registerEvents()
end

function AccChargePanel.layoutUI(slot0)
	slot0.ctrl = VipController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.size = cc.size(660, 644)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 0))

	slot0.main_container = ccui.Widget:create()

	slot0.main_container:setAnchorPoint(cc.p(0, 0))
	slot0.main_container:setContentSize(slot0.size)
	slot0.main_container:setSwallowTouches(false)
	slot0:addChild(slot0.main_container)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.main_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.size, {
		start_y = 0,
		item_width = 652,
		start_x = 8,
		space_x = 0,
		row = 0,
		item_height = 172,
		space_y = 0,
		col = 1,
		item_class = AccChargeItem
	})
	slot0.arrow = createSprite(PathTool.getResFrame("common", "common_90034"), slot0.main_container:getContentSize().width / 2 - 50, -37, slot0.main_container, cc.p(0.5, 0), LOADTEXT_TYPE_PLIST)

	slot0.arrow:setRotation(90)
	slot0.ctrl:sender16712()
end

function AccChargePanel.registerEvents(slot0)
	if slot0.update_info == nil then
		slot0.update_info = GlobalEvent:getInstance():Bind(VipEvent.ACC_RECHARGE_INFO, function (slot0)
			slot1 = {}

			for slot5, slot6 in pairs(slot0.list) do
				if slot6.status == 1 then
					slot6.order = 1
				elseif slot6.status == 0 then
					slot6.order = 2
				elseif slot6.status == 2 then
					slot6.order = 3
				end

				table.insert(slot1, slot6)
			end

			table.sort(slot1, SortTools.tableLowerSorter({
				"order",
				"id"
			}))
			uv0.item_scrollview:setData(slot1)
		end)
	end
end

function AccChargePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function AccChargePanel.DeleteMe(slot0)
	if slot0.update_info then
		GlobalEvent:getInstance():UnBind(slot0.update_info)

		slot0.update_info = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end
end

AccChargeItem = class("AccChargeItem", function ()
	return ccui.Widget:create()
end)

function AccChargeItem.ctor(slot0)
	slot0.ctrl = VipController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function AccChargeItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("vip/acc_charge_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(652, 172))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.title = slot0.main_container:getChildByName("title")
	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("前往"))

	slot0.coin = slot0.main_container:getChildByName("coin")
	slot0.exp = slot0.main_container:getChildByName("exp")

	slot0.exp:setString("")

	slot0.title_label1 = slot0.main_container:getChildByName("title_label1")

	slot0.title_label1:setString(TI18N("累充"))

	slot0.title_label2 = slot0.main_container:getChildByName("title_label2")

	slot0.title_label2:setString(TI18N("钻石"))

	slot0.charge_num = CommonNum.new(21, slot0.main_container, 1, -2, cc.p(0, 0.5))

	slot0.charge_num:setScale(0.55)
	slot0.charge_num:setPosition(53, 160)

	slot0.get = slot0.main_container:getChildByName("get")

	slot0.get:setVisible(false)

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 0,
		start_x = 5,
		space_x = 5,
		row = 1,
		space_y = 4,
		col = 0,
		scale = 0.9,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.9,
		item_height = BackPackItem.Height * 0.9
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function AccChargeItem.register_event(slot0)
	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data.status == 0 then
				uv0.ctrl:changeMainWindowTab(VIPTABCONST.CHARGE)
			elseif uv0.data.status == 1 then
				uv0.ctrl:sender16713(uv0.data.id)
			else
				message(TI18N("已经领取啦"))
			end
		end
	end)
end

function AccChargeItem.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = deepCopy(Config.ChargeData.data_charge_reward_data[slot1.id])
	slot4 = slot2.spe_item_list

	function slot5(slot0)
		if uv0 and next(uv0 or {}) ~= nil then
			for slot4, slot5 in pairs(uv0) do
				if slot5 == slot0 then
					return true
				end
			end

			return false
		end
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot2.item_list) do
		slot12 = {}

		if deepCopy(Config.ItemData.data_get_data(slot11[1])) then
			slot12.quantity = slot11[2]

			table.insert(slot6, slot12)
		end
	end

	slot0.item_scrollview:setData(slot6)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5.data and slot5.data.id and uv1(slot5.data.id) then
				if slot5.data.quality >= 4 then
					slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
				else
					slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
				end
			else
				slot5:showItemEffect(false)
			end
		end
	end)
	slot0.charge_num:setNum(slot2.charge_sum)
	slot0.charge_num:setCallBack(function ()
		uv0.title_label2:setPositionX(uv0.charge_num:getPositionX() + uv0.charge_num:getContentSize().width / 2 + 10)
	end)

	if slot0.charge_num:getContentSize().width > 0 then
		slot0.title_label2:setPositionX(slot0.charge_num:getPositionX() + slot0.charge_num:getContentSize().width / 2 + 10)
	end

	if slot1.status then
		if slot1.status == 0 then
			slot0.get:setVisible(false)
			slot0.btn:setVisible(true)
			slot0.btn:setTitleText(TI18N("去充值"))

			slot7 = PathTool.getResFrame("common", "common_1018")

			slot0.btn:loadTextures(slot7, slot7, nil, LOADTEXT_TYPE_PLIST)

			slot0.btn.label = slot0.btn:getTitleRenderer()

			if slot0.btn.label ~= nil then
				slot0.btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
			end
		elseif slot1.status == 1 then
			slot0.get:setVisible(false)
			slot0.btn:setVisible(true)
			slot0.btn:setTitleText(TI18N("领取"))

			slot7 = PathTool.getResFrame("common", "common_1017")

			slot0.btn:loadTextures(slot7, slot7, nil, LOADTEXT_TYPE_PLIST)

			slot0.btn.label = slot0.btn:getTitleRenderer()

			if slot0.btn.label ~= nil then
				slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
			end
		elseif slot1.status == 2 then
			slot0.get:setVisible(true)
			slot0.btn:setVisible(false)
			slot0.btn:setTitleText(TI18N("已领取"))
		end
	end

	slot0.charge_sum = slot0.ctrl:getChargeSum()

	slot0.exp:setString(slot0.charge_sum .. "/" .. slot2.charge_sum)
	slot0.coin:setPositionX(slot0.exp:getPositionX() - slot0.exp:getContentSize().width)
end

function AccChargeItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function AccChargeItem.getData(slot0)
	return slot0.data
end

function AccChargeItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.charge_num then
		slot0.charge_num:DeleteMe()

		slot0.charge_num = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
