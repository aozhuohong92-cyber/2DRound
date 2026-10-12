ShopPanel = class("ShopPanel", function ()
	return ccui.Widget:create()
end)
slot0 = Config.ExchangeData.data_shop_list
slot2 = WelfareController:getInstance():getModel()
slot3 = 50
slot4 = cc.c4b(230, 199, 150, 255)
slot5 = cc.c4b(255, 243, 224, 255)

function ShopPanel.ctor(slot0)
	slot0.cur_index = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.shop_type_data = {}
	slot0.shop_item_bid = 1
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("welfareshop", "welfareshop"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("varietystore", "varietystore"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_top"),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function ShopPanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:register_event()
end

function ShopPanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/shop_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -88)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.load_bg = loadSpriteTextureFromCDN(slot1:getChildByName("image_bg"), PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_bg"), ResourcesType.single)
	slot0.load_image_top = loadSpriteTextureFromCDN(slot1:getChildByName("image_top"), PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_top"), ResourcesType.single)

	slot1:getChildByName("Text_2"):setString(TI18N("欢迎光临^_^"))

	slot6 = slot1:getChildByName("icon")

	if Config.ItemData.data_get_data(35) then
		loadSpriteTexture(slot6, PathTool.getItemRes(slot7.icon), LOADTEXT_TYPE)
		slot6:setScale(0.35)
	end

	slot0.icon_count = slot1:getChildByName("icon_count")

	slot0.icon_count:setString(slot0.role_vo.feather_exchange or 0)

	slot0.btn_resoure = slot1:getChildByName("btn_resoure")
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.good_cons = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot0.good_cons:getContentSize().width, slot0.good_cons:getContentSize().height), {
		start_y = 20,
		row = 1,
		start_x = 80,
		space_x = 35,
		space_y = -5,
		col = 3,
		need_dynamic = true,
		item_width = ShopItem.width,
		item_height = ShopItem.height
	})

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

	slot0.role_effect = createEffectSpine(PathTool.getEffectRes(644), cc.p(0, 0), cc.p(0, 0), true, "action")

	slot0.role_effect:setScale(1)
	slot1:getChildByName("effect_node"):addChild(slot0.role_effect)

	slot0.tab_list = {}

	for slot15 = 1, 2 do
		slot16 = {
			btn = slot1:getChildByName("tab_view"):getChildByName("tab_" .. slot15)
		}
		slot16.select = slot16.btn:getChildByName("select")
		slot16.normal = slot16.btn:getChildByName("normal")

		slot16.normal:setVisible(false)

		slot16.name = slot16.btn:getChildByName("name")

		slot16.name:setTextColor(uv0)

		if uv1[uv2 + slot15] then
			slot16.name:setString(uv1[uv2 + slot15].name or "")
		end

		slot16.index = slot15
		slot0.tab_list[slot15] = slot16
	end

	slot0:setIsBlockTabView()
	slot0:tabChangeView(1)
end

function ShopPanel.isOpenTabView(slot0, slot1)
	if not slot0.role_vo then
		return
	end

	slot2 = false

	if uv0 and uv0[slot1] then
		slot2 = MainuiController:getInstance():checkIsOpenByActivate(uv0[slot1].limit)
	end

	return slot2
end

function ShopPanel.createNewCell(slot0)
	return ShopItem.new()
end

function ShopPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ShopPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot2 % 3 == 1 then
		slot1:createItemBgSprite(-slot2)
	end
end

function ShopPanel.tabChangeView(slot0, slot1)
	if slot0:isOpenTabView(uv0 + slot1) == false then
		message(string.format(TI18N("人物等级%s开启%s商城"), uv1[uv0 + slot1].limit[1][2], uv1[uv0 + slot1].name))

		return
	end

	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.name:setTextColor(uv2)
		slot0.cur_tab.select:setVisible(true)
		slot0.cur_tab.normal:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_list[slot1]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.name:setTextColor(uv3)
		slot0.cur_tab.select:setVisible(false)
		slot0.cur_tab.normal:setVisible(true)
	end

	slot0.show_list = uv4:getWelfareShopData(slot1)

	if slot0.show_list then
		slot0.item_scrollview:reloadData()
	else
		uv4:setWelfareShopData(slot1)

		slot0.show_list = uv4:getWelfareShopData(slot1)

		if slot0.show_list then
			slot0.item_scrollview:reloadData()
		end
	end
end

function ShopPanel.setIsBlockTabView(slot0)
	if uv0 and uv0[uv1] then
		slot4 = uv1

		for slot4, slot5 in pairs(uv0[slot4].subtype) do
			slot6 = slot5 - uv1

			if slot0.tab_list[slot6] then
				if slot0:isOpenTabView(uv1 + slot6) == true then
					setChildUnEnabled(false, slot0.tab_list[slot6].btn)
					slot0.tab_list[slot6].name:enableOutline(cc.c4b(2, 0, 25, 255), 2)
				else
					setChildUnEnabled(true, slot0.tab_list[slot6].btn)
					slot0.tab_list[slot6].name:disableEffect(cc.LabelEffect.OUTLINE)
				end
			end
		end
	end
end

function ShopPanel.register_event(slot0)
	function slot4(slot0, slot1, slot2)
		if Config.HolidayClientData.data_constant.welfare_shop_rules then
			TipsManager:getInstance():showCommonTips(slot3.welfare_shop_rules.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end

	slot5 = false

	registerButtonEventListener(slot0.btn_rule, slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:tabChangeView(uv1.index)
		end, false)
	end

	registerButtonEventListener(slot0.btn_resoure, function ()
		if Config.ItemData.data_get_data(35) then
			BackpackController:getInstance():openTipsSource(true, slot0)
		end
	end, false)

	if slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				uv0:setIsBlockTabView()
			elseif slot0 == "feather_exchange" and uv0.role_vo ~= nil then
				uv0.icon_count:setString(uv0.role_vo.feather_exchange or 0)
			end
		end)
	end
end

function ShopPanel.setVisibleStatus(slot0, slot1)
	bool = bool or false

	slot0:setVisible(slot1)
end

function ShopPanel.DeleteMe(slot0)
	if slot0.role_effect then
		slot0.role_effect:clearTracks()
		slot0.role_effect:removeFromParent()

		slot0.role_effect = nil
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.load_bg then
		slot0.load_bg:DeleteMe()

		slot0.load_bg = nil
	end

	if slot0.load_image_top then
		slot0.load_image_top:DeleteMe()

		slot0.load_image_top = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end

ShopItem = class("ShopItem", function ()
	return ccui.Widget:create()
end)

function ShopItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

ShopItem.width = 158
ShopItem.height = 214

function ShopItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mall/varietystore_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(ShopItem.width, ShopItem.height))

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:setPosition(79, -20)
	slot1:setTouchEnabled(false)
	slot1:getChildByName("image_zhe"):setVisible(false)

	slot0.btn_buy = slot1:getChildByName("btn_buy")

	slot0.btn_buy:setSwallowTouches(false)

	slot0.image_buy = slot1:getChildByName("image_buy")

	slot0.image_buy:setVisible(false)

	slot0.item_icon = BackPackItem.new(false, true, false, 0.9, nil, true)

	slot0.item_icon:setAnchorPoint(cc.p(0.5, 0))
	slot1:getChildByName("pos_node"):addChild(slot0.item_icon)

	slot0.price_label = createRichLabel(26, cc.c3b(71, 44, 30), cc.p(0.5, 0.5), cc.p(ShopItem.width * 0.5 - 9, 30))

	slot1:addChild(slot0.price_label)

	slot0.container = slot1
end

function ShopItem.setData(slot0, slot1)
	slot0.shop_data = slot1

	if slot0.item_icon then
		slot0.item_icon:setBaseData(slot1.item_bid, slot1.item_num)
		slot0.item_icon:setDefaultTip(true)
	end

	if Config.ItemData.data_assets_label2id[slot1.pay_type] and Config.ItemData.data_get_data(slot2) then
		slot0.price_label:setString(string.format("<img src='%s' scale=0.35 /> %s", PathTool.getItemRes(slot3.icon), MoneyTool.GetMoneyString(slot1.price)))
	end
end

function ShopItem.createItemBgSprite(slot0, slot1)
	if not slot0.item_bg then
		slot0.item_bg = createSprite(res, -43, 92, slot0.container, cc.p(0, 1), LOADTEXT_TYPE, slot1)
		slot0.load_item_bg = loadSpriteTextureFromCDN(slot0.item_bg, PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_grid"), ResourcesType.single)
	end
end

function ShopItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_buy, function ()
		uv0:btnBuyAward()
	end, false, nil, nil, nil, nil, true)
end

function ShopItem.btnBuyAward(slot0)
	if slot0.shop_data then
		if RoleController:getInstance():getRoleVo().feather_exchange < slot0.shop_data.price then
			MallController:getInstance():sender13402(slot0.shop_data.id, 1)

			return
		end

		CommonAlert.show(string.format(TI18N("是否购买<div fontColor=#289b14 fontsize= 26>%s</div>"), slot0.shop_data.item_name), TI18N("确定"), function ()
			MallController:getInstance():sender13402(uv0.shop_data.id, 1)
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 26)
	end
end

function ShopItem.DeleteMe(slot0)
	if slot0.load_item_bg then
		slot0.load_item_bg:DeleteMe()

		slot0.load_item_bg = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
