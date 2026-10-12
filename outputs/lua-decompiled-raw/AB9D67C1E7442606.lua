slot1 = MallController:getInstance():getModel()
slot2 = WelfareController:getInstance():getModel()
slot3 = table.insert
slot4 = string.format
slot5 = cc.c4b(230, 199, 150, 255)
slot6 = cc.c4b(255, 243, 224, 255)
slot7 = Config.ExchangeData.data_shop_list
PlumeShopWindow = PlumeShopWindow or BaseClass(BaseView)

function PlumeShopWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/plume_shop_window"
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
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_top"),
			type = ResourcesType.single
		}
	}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.shop_data = {}
end

function PlumeShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_bg", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot5 = 1

	slot0:playEnterAnimatianByObj(slot0.mainContainer, slot5)

	slot0.container_size = slot0.main_container:getContentSize()
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")

	slot0.top_panel:getChildByName("tips_txt"):setString(TI18N("欢迎光临^_^"))

	slot0.tab_objects = {}

	for slot5 = 1, 2 do
		if slot0.top_panel:getChildByName("tab_view"):getChildByName("tab_" .. slot5) then
			slot7 = {
				tab_btn = slot6,
				select = slot6:getChildByName("select"),
				normal = slot6:getChildByName("normal")
			}

			slot7.normal:setVisible(false)

			slot7.name = slot6:getChildByName("name")

			slot7.name:setTextColor(uv0)

			slot8 = uv1[MallConst.MallType.WelfareHeroShop]

			if slot5 == 2 then
				slot8 = uv1[MallConst.MallType.WelfareClothShop]
			end

			if slot8 then
				slot7.sub_shop_cfg = slot8

				slot7.name:setString(slot8.name or "")

				slot7.open_status = MainuiController:getInstance():checkIsOpenByActivate(slot8.limit)

				if slot7.open_status == true then
					setChildUnEnabled(false, slot7.tab_btn)
					slot7.name:enableOutline(cc.c4b(51, 35, 27, 255), 2)
				else
					setChildUnEnabled(true, slot7.tab_btn)
					slot7.name:disableEffect(cc.LabelEffect.OUTLINE)
				end

				if slot8.limit[1] then
					slot7.close_tips = uv2(TI18N("人物等级%s开启%s商城"), slot8.limit[1][2] or 0, slot8.name or "")
				end
			end

			uv3(slot0.tab_objects, slot7)
		end
	end

	loadSpriteTexture(slot0.top_panel:getChildByName("top_sp"), PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_shop_top"), LOADTEXT_TYPE)

	slot0.cost_item_bid = 35

	slot0.top_panel:getChildByName("item_sp"):setScale(0.35)

	if Config.ItemData.data_get_data(slot0.cost_item_bid) then
		loadSpriteTexture(slot3, PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
	end

	slot0.add_btn = slot0.top_panel:getChildByName("add_btn")
	slot0.effect_node = slot0.top_panel:getChildByName("effect_node")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_rule = slot0.top_panel:getChildByName("btn_rule")
	slot0.count_txt = slot0.top_panel:getChildByName("count_txt")

	slot0.count_txt:setString(slot0.role_vo.feather_exchange or 0)
	slot0:handleEffect(true)

	slot0.bg_img = slot0.top_panel:getChildByName("image_1")
	slot0.item_list = slot0.top_panel:getChildByName("item_list")

	slot0:adaptationScreen()

	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.item_list:getContentSize(), {
		start_y = 0,
		row = 1,
		start_x = 55,
		space_x = 40,
		item_width = 158,
		item_height = 214,
		space_y = 30,
		col = 3,
		need_dynamic = true
	})

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function PlumeShopWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.close_btn:setPositionY(slot0.close_btn:getPositionY() + slot2)

	slot5 = slot0.bg_img:getContentSize()
	slot6 = slot1 - slot0.container_size.height - slot2

	slot0.bg_img:setContentSize(cc.size(slot5.width, slot5.height + slot6))

	slot7 = slot0.item_list:getContentSize()

	slot0.item_list:setContentSize(cc.size(slot7.width, slot7.height + slot6))
end

function PlumeShopWindow.createNewCell(slot0)
	return PlumeShopItem.new()
end

function PlumeShopWindow.numberOfCells(slot0)
	if not slot0.shop_data then
		return 0
	end

	return #slot0.shop_data
end

function PlumeShopWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.shop_data[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot2 % 3 == 1 then
		slot1:createItemBgSprite()
	end
end

function PlumeShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.add_btn, handler(slot0, slot0.onClickAddBtn), true)

	function slot4(slot0, slot1, slot2)
		if Config.HolidayClientData.data_constant.welfare_shop_rules then
			TipsManager:getInstance():showCommonTips(slot3.welfare_shop_rules.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_rule, slot4, slot5)

	for slot4, slot5 in ipairs(slot0.tab_objects) do
		registerButtonEventListener(slot5.tab_btn, function ()
			uv0:onClickTabBtn(uv1)
		end, true)
	end

	if slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				uv0:updateTabBtnStatus()
			elseif slot0 == "feather_exchange" then
				uv0.count_txt:setString(uv0.role_vo.feather_exchange or 0)
			end
		end)
	end
end

function PlumeShopWindow.openRootWnd(slot0)
	slot0:onClickTabBtn(1)
end

function PlumeShopWindow.onClickAddBtn(slot0)
	if slot0.cost_item_bid then
		BackpackController:getInstance():openTipsSource(true, slot0.cost_item_bid)
	end
end

function PlumeShopWindow.onClickTabBtn(slot0, slot1)
	if not slot0.tab_objects[slot1].open_status then
		message(slot2.close_tips)

		return
	end

	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.name:setTextColor(uv0)
		slot0.cur_tab.select:setVisible(true)
		slot0.cur_tab.normal:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_objects[slot1]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.name:setTextColor(uv1)
		slot0.cur_tab.select:setVisible(false)
		slot0.cur_tab.normal:setVisible(true)
	end

	slot0.shop_data = uv2:getWelfareShopData(slot1)

	if slot0.shop_data then
		slot0.item_scrollview:reloadData()
	else
		uv2:setWelfareShopData(slot1)

		slot0.shop_data = uv2:getWelfareShopData(slot1)

		if slot0.shop_data then
			slot0.item_scrollview:reloadData()
		end
	end
end

function PlumeShopWindow.updateTabBtnStatus(slot0)
	for slot4, slot5 in pairs(slot0.tab_objects) do
		if slot5.sub_shop_cfg then
			slot5.open_status = MainuiController:getInstance():checkIsOpenByActivate(slot6.limit)

			if slot5.open_status == true then
				setChildUnEnabled(false, slot5.tab_btn)
				slot5.name:enableOutline(cc.c4b(51, 35, 27, 255), 2)
			else
				setChildUnEnabled(true, slot5.tab_btn)
				slot5.name:disableEffect(cc.LabelEffect.OUTLINE)
			end
		end
	end
end

function PlumeShopWindow.onClickCloseBtn(slot0)
	uv0:openPlumeShopWindow(false)
end

function PlumeShopWindow.handleEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.effect_node) and slot0.role_effect == nil then
			slot0.role_effect = createEffectSpine(PathTool.getEffectRes(644), cc.p(0, 0), cc.p(0, 0), true, PlayerAction.action)

			slot0.role_effect:setScale(1)
			slot0.effect_node:addChild(slot0.role_effect)
		end
	elseif slot0.role_effect then
		slot0.role_effect:clearTracks()
		slot0.role_effect:removeFromParent()

		slot0.role_effect = nil
	end
end

function PlumeShopWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_assets_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	slot0:handleEffect(false)
	uv0:openPlumeShopWindow(false)
end

PlumeShopItem = class("PlumeShopItem", function ()
	return ccui.Widget:create()
end)

function PlumeShopItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function PlumeShopItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mall/varietystore_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = cc.size(158, 214)

	slot0:setContentSize(slot0.size)

	slot1 = slot0.root_wnd:getChildByName("container")

	slot1:setTouchEnabled(false)

	slot2 = slot1:getChildByName("image_bg")

	slot2:loadTexture(PathTool.getResFrame("varietystore", "varietystore_1005"), LOADTEXT_TYPE_PLIST)
	slot2:setPositionY(15)
	slot1:getChildByName("image_zhe"):setVisible(false)

	slot0.btn_buy = slot1:getChildByName("btn_buy")

	slot0.btn_buy:setSwallowTouches(false)

	slot0.image_buy = slot1:getChildByName("image_buy")

	slot0.image_buy:setVisible(false)

	slot0.item_icon = BackPackItem.new(false, true, false, 0.9, nil, true, false)

	slot0.item_icon:setAnchorPoint(cc.p(0.5, 0))
	slot1:getChildByName("pos_node"):addChild(slot0.item_icon)

	slot0.price_label = createRichLabel(26, cc.c3b(71, 44, 30), cc.p(0.5, 0.5), cc.p(slot0.size.width * 0.5, 59))

	slot1:addChild(slot0.price_label)

	slot0.container = slot1
end

function PlumeShopItem.setData(slot0, slot1)
	slot0.shop_data = slot1

	if slot0.item_grid_bg then
		slot0.item_grid_bg:setVisible(false)
	end

	if slot0.item_icon then
		slot0.item_icon:setBaseData(slot1.item_bid, slot1.item_num)
		slot0.item_icon:setDefaultTip(true)
	end

	if Config.ItemData.data_assets_label2id[slot1.pay_type] and Config.ItemData.data_get_data(slot2) then
		slot0.price_label:setString(string.format("<img src='%s' scale=0.35 /> %s", PathTool.getItemRes(slot3.icon), MoneyTool.GetMoneyString(slot1.price)))
	end
end

function PlumeShopItem.createItemBgSprite(slot0)
	if not slot0.item_grid_bg then
		slot0.item_grid_bg = createImage(slot0.container, PathTool.getResFrame("varietystore", "varietystore_1006"), -68, 30, cc.p(0, 1), true, -1, true)

		slot0.item_grid_bg:setContentSize(cc.size(680, 67))
	end

	slot0.item_grid_bg:setVisible(true)
end

function PlumeShopItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_buy, function ()
		uv0:btnBuyAward()
	end, true, nil, , , , true)
end

function PlumeShopItem.btnBuyAward(slot0)
	if slot0.shop_data then
		if RoleController:getInstance():getRoleVo().feather_exchange < slot0.shop_data.price then
			MallController:getInstance():sender13402(slot0.shop_data.id, 1)

			return
		end

		slot2 = nil

		if Config.ItemData.data_assets_label2id[slot0.shop_data.pay_type] then
			slot2 = uv0(TI18N("是否花费 <img src='%s' scale=0.35 />%s 来购买 <div fontColor=#289b14 fontsize= 26> %sX%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot3).icon), slot0.shop_data.price, slot0.shop_data.item_name, slot0.shop_data.item_num)
		end

		if slot2 then
			CommonAlert.show(slot2, TI18N("确定"), function ()
				MallController:getInstance():sender13402(uv0.shop_data.id, 1)
			end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 26)
		end
	end
end

function PlumeShopItem.DeleteMe(slot0)
	if slot0.item_icon then
		slot0.item_icon:DeleteMe()

		slot0.item_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
