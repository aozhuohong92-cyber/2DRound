ActionHeroClothesPanel = class("ActionHeroClothesPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()

function ActionHeroClothesPanel.ctor(slot0, slot1)
	slot0.holiday_id = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionHeroClothesPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -64)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_con")
	slot0.btn_rule = slot2:getChildByName("btn_rule")

	slot0.btn_rule:setVisible(false)

	slot3 = slot2:getChildByName("sprite_title")
	slot4 = nil

	if uv0:getActionSubTabVo(slot0.holiday_id) and slot5.reward_title ~= "" and slot5.reward_title then
		slot4 = slot5.reward_title
	end

	if slot4 then
		if not slot0.banner_load then
			slot0.banner_load = createResourcesLoad(PathTool.getWelfareBannerRes(slot4), ResourcesType.single, function ()
				if not tolua.isnull(uv0) then
					loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
				end
			end, slot0.banner_load)
		end
	end

	slot6 = slot2:getChildByName("time_panel")

	slot6:getChildByName("Text_1"):setString(TI18N("剩余时间: "))

	slot0.remain_time = slot6:getChildByName("remain_time")

	slot0.remain_time:setString("")

	slot7 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot7, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot7:getContentSize(), {
		start_y = 0,
		item_width = 688,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 136,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = ActionHeroClothesItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	uv0:sender25500()
end

function ActionHeroClothesPanel.setConfigData(slot0, slot1)
	slot2 = nil

	if uv0:getModel():getHeroClothesShopData() then
		slot2 = slot3
	else
		uv0:getModel():setHeroClothesShopData(slot1)

		if uv0:getModel():getHeroClothesShopData() then
			slot2 = slot4
		end
	end

	return slot2
end

function ActionHeroClothesPanel.setDataItem(slot0, slot1)
	if slot0:setConfigData(slot1) and slot0.item_scrollview then
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			slot8.sort = 0
			slot8.count = 0

			if uv0:getModel():getLimitTypeData(slot8.id) then
				if 0 <= 0 then
					slot10 = 0
					slot8.sort = 1
				end

				slot8.count = slot10
			end

			if slot8.limit_type ~= 4 or slot8.count ~= 0 then
				table.insert(slot3, slot8)
			end
		end

		table.sort(slot3, SortTools.tableCommonSorter({
			{
				"sort",
				false
			},
			{
				"id",
				false
			}
		}))
		slot0.item_scrollview:setData(slot3)
	end
end

function ActionHeroClothesPanel.register_event(slot0)
	if slot0.update_clothes_data == nil then
		slot0.update_clothes_data = GlobalEvent:getInstance():Bind(ActionEvent.Updata_Hero_Clothes_Shop_Data, function (slot0)
			if not slot0 then
				return
			end

			if slot0.week_time then
				commonCountDownTime(uv0.remain_time, slot0.week_time - GameNet:getInstance():getTime())
			end

			if slot0.period then
				uv0:setDataItem(slot0.period)
			end
		end)
	end
end

function ActionHeroClothesPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionHeroClothesPanel.DeleteMe(slot0)
	doStopAllActions(slot0.remain_time)

	if slot0.banner_load then
		slot0.banner_load:DeleteMe()
	end

	slot0.banner_load = nil

	uv0:getModel():setColthesDataInit()

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_clothes_data ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_clothes_data)

		slot0.update_clothes_data = nil
	end
end

ActionHeroClothesItem = class("ActionHeroClothesItem", function ()
	return ccui.Widget:create()
end)

function ActionHeroClothesItem.ctor(slot0)
	slot0.buy_clothes_item = true

	slot0:configUI()
	slot0:register_event()
end

function ActionHeroClothesItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/week_month_panel_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(688, 136))
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.has_get = slot1:getChildByName("has_get")

	slot0.has_get:setVisible(false)

	slot0.btn_charge = slot1:getChildByName("btn_charge")
	slot0.charge_price = slot0.btn_charge:getChildByName("Text_4_0")

	slot0.charge_price:setString("")

	slot0.text_remian = slot1:getChildByName("Text_4")

	slot0.text_remian:setString("")

	slot2 = slot1:getChildByName("good_cons")
	slot0.good_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 12,
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

	slot0.good_scrollview:setSwallowTouches(false)
end

function ActionHeroClothesItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_charge, function ()
		uv0:btnBuyCommodity()
	end, true, 1)
end

function ActionHeroClothesItem.btnBuyCommodity(slot0)
	if not slot0.buy_clothes_item then
		return
	end

	if slot0.buy_hero_clothes_ticket == nil then
		slot0.buy_hero_clothes_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.buy_clothes_item = true

			if uv0.buy_hero_clothes_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.buy_hero_clothes_ticket)

				uv0.buy_hero_clothes_ticket = nil
			end
		end, 2)
	end

	slot0.buy_clothes_item = nil

	if slot0.data and slot0.data.charge_id and Config.ChargeData.data_charge_data[slot0.data.charge_id] then
		sdkOnPay(slot1.val, 1, slot1.id, slot1.name)
	end
end

slot1 = {
	TI18N("每日限购: "),
	TI18N("每周限购: "),
	TI18N("每月限购: "),
	TI18N("永久限购: ")
}

function ActionHeroClothesItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.charge_price:setString(slot1.price .. TI18N("元"))

	if slot1.count <= 0 then
		setChildUnEnabled(true, slot0.btn_charge)
		slot0.btn_charge:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.btn_charge)
		slot0.btn_charge:setTouchEnabled(true)
	end

	slot6 = slot1.count

	slot0.text_remian:setString(uv0[slot1.limit_type] .. slot6)

	slot2 = {}

	for slot6, slot7 in pairs(slot1.award) do
		table.insert(slot2, {
			bid = slot7[1],
			quantity = slot7[2]
		})
	end

	if #slot2 > 4 then
		slot0.good_scrollview:setClickEnabled(true)
	else
		slot0.good_scrollview:setClickEnabled(false)
	end

	slot0.good_scrollview:setData(slot2)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function ActionHeroClothesItem.DeleteMe(slot0)
	if slot0.buy_hero_clothes_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.buy_hero_clothes_ticket)

		slot0.buy_hero_clothes_ticket = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
