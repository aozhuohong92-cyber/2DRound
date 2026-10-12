SuitShopMainWindow = SuitShopMainWindow or BaseClass(BaseView)
slot0 = SuitShopController:getInstance()
slot1 = HeroController:getInstance()
slot2 = HeavenController:getInstance():getModel()
slot3 = MallController:getInstance()
slot4 = Config.ExchangeData.data_shop_exchage_suit
slot5 = table.sort
slot6 = table.insert
SuitShopMainWindow.buy_item_id = 10030

function SuitShopMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "suitshop/suitshop_window"
	slot0.cur_index = nil
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.dic_buy_info = {}
	slot0.tab_suit_perfix = {}
	slot2 = Config.PartnerHolyEqmData.data_const.shop_unlock_condition

	for slot6, slot7 in pairs(Config.PartnerHolyEqmData.data_suit_res_prefix) do
		if slot2 and slot2.val then
			for slot11, slot12 in pairs(slot2.val) do
				if slot7.id == slot12[1] then
					if HeavenController:getInstance():getModel():checkIsOpenByScore(slot12[2]) == true then
						uv0(slot0.tab_suit_perfix, slot7)
					end

					break
				end
			end
		end
	end

	uv1(slot0.tab_suit_perfix, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function SuitShopMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("神装商城"))
	slot0.main_container:getChildByName("Text_2"):setString(TI18N("购买后随机获得随机品阶的同名神装"))

	slot0.totle_diam = slot0.main_container:getChildByName("totle_diam")

	slot0.totle_diam:setString(MoneyTool.GetMoneyString(slot0.role_vo.holy_eqm_coin))

	slot0.sprite = slot0.main_container:getChildByName("Sprite_1")

	UITool.SetTitleColor(slot0.main_container:getChildByName("title_con"):getChildByName("title_label"))

	if Config.ExchangeData.data_shop_list[MallConst.MallType.SuitShop] and Config.ItemData.data_get_data(slot1.item_bid) then
		loadSpriteTexture(slot0.sprite, PathTool.getItemRes(slot2.icon, false), LOADTEXT_TYPE)
	end
end

function SuitShopMainWindow.register_event(slot0)
	if slot0.role_vo and slot0.updata_suit_event == nil then
		slot0.updata_suit_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "holy_eqm_coin" then
				uv0.totle_diam:setString(MoneyTool.GetMoneyString(uv0.role_vo.holy_eqm_coin))
			end
		end)
	end

	slot0:addGlobalEvent(MallEvent.Open_View_Event, function (slot0)
		if not slot0 then
			return
		end

		for slot4, slot5 in ipairs(slot0.item_list) do
			for slot9, slot10 in pairs(slot5.ext) do
				if slot10.key == 1 then
					uv0.dic_buy_info[slot5.item_id] = slot10.val
				end
			end
		end

		uv0:createTabList()
	end)
	slot0:addGlobalEvent(MallEvent.Buy_Success_Event, function (slot0)
		if not slot0 then
			return
		end

		for slot4, slot5 in pairs(slot0.ext) do
			if slot5.key == 1 then
				uv0.dic_buy_info[slot0.eid] = slot5.val
			end
		end

		if uv0.item_scrollview then
			uv0.item_scrollview:resetCurrentItems()
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openSuitShopMainView(false)
	end, false, 2)
end

function SuitShopMainWindow.openRootWnd(slot0)
	MallController:getInstance():sender13401(MallConst.MallType.SuitShop)
end

function SuitShopMainWindow.createTabList(slot0)
	if slot0.tab_view_list == nil then
		slot0.tab_view_list = {}

		slot0.main_container:getChildByName("tab_view"):setScrollBarEnabled(false)

		if (slot0.main_container:getContentSize().width - SuitShopTab.Width * #slot0.tab_suit_perfix + 10) / 2 < 39 then
			slot3 = 39
		else
			slot1:setContentSize(cc.size(SuitShopTab.Width * slot2 + 10, 63))
		end

		slot1:setPositionX(slot3)
		slot1:getChildByName("tab_bg"):setContentSize(cc.size(SuitShopTab.Width * slot2 + 10, 54))

		slot8 = cc.size

		slot1:setInnerContainerSize(slot8(SuitShopTab.Width * slot2 + 10, 63))

		for slot8 = 1, slot2 do
			slot0.tab_view_list[slot8] = SuitShopTab.new()

			slot0.tab_view_list[slot8]:setPosition((slot8 - 1) * SuitShopTab.Width + 55, 31)
			slot1:addChild(slot0.tab_view_list[slot8])
			slot0.tab_view_list[slot8]:setData(slot8, slot2, slot0.tab_suit_perfix[slot8])
			slot0.tab_view_list[slot8]:addCallBack(function ()
				uv0:tabChangeView(uv1)
			end)
		end
	end

	slot0:tabChangeView(1)
end

function SuitShopMainWindow.tabChangeView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if not slot0.tab_view_list[slot2] then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setNormal(false)
		slot0.cur_tab:setSelect(true)
		slot0.cur_tab:setName(cc.c4b(207, 181, 147, 255))
	end

	slot0.cur_index = slot2
	slot0.cur_tab = slot0.tab_view_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setNormal(true)
		slot0.cur_tab:setSelect(false)
		slot0.cur_tab:setName(cc.c4b(255, 237, 214, 255))
	end

	slot0:updateList(slot2)
end

function SuitShopMainWindow.updateList(slot0, slot1)
	if slot0.item_scrollview == nil then
		slot2 = slot0.main_container:getChildByName("goods")
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
			start_y = 5,
			row = 1,
			start_x = 5,
			space_x = 5,
			item_width = 312,
			item_height = 147,
			space_y = 0,
			col = 2,
			need_dynamic = true
		})

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if slot0.tab_suit_perfix and slot0.tab_suit_perfix[slot1] and slot0.tab_suit_perfix[slot1].id and uv0[slot0.tab_suit_perfix[slot1].id] then
		slot0.show_list = {}
		slot5 = slot0.tab_suit_perfix[slot1].id

		for slot5, slot6 in pairs(uv0[slot5]) do
			if uv1:checkIsOpenByScore(slot6.show_condit) == true then
				uv2(slot0.show_list, slot6)
			end
		end

		uv3(slot0.show_list, function (slot0, slot1)
			return slot1.order < slot0.order
		end)
		slot0.item_scrollview:reloadData()
	end
end

function SuitShopMainWindow.createNewCell(slot0, slot1, slot2)
	slot3 = SuitShopItem.new()

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function SuitShopMainWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function SuitShopMainWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot4 = slot3.config

	slot1:setData(slot3)

	if slot3.id == SuitShopMainWindow.buy_item_id then
		slot1:showLimitCount(true, slot0.dic_buy_info[slot3.id] or 0, slot3.limit_day)
	else
		slot1:showLimitCount(false)
	end
end

function SuitShopMainWindow.onCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if not slot0.show_list[slot1.index] then
		return
	end

	if slot2.id == SuitShopMainWindow.buy_item_id then
		uv0:openMallBuyWindow(true, {
			id = slot2.id,
			item_bid = slot2.item_bid,
			limit_num = slot2.limit_day,
			has_buy = slot0.dic_buy_info[slot2.id] or 0,
			price = slot2.price,
			pay_type = Config.ItemData.data_assets_label2id.holy_eqm_coin,
			shop_type = MallConst.MallType.SuitShop,
			is_show_limit_label = true
		})
	else
		CommonAlert.show(string.format("是否消耗 <img src='%s' scale=0.3 />%s 购买商品?", PathTool.getItemRes(Config.ItemData.data_get_data(slot3).icon), slot2.price), TI18N("确定"), function ()
			MallController:getInstance():sender13402(uv0.id, 1)
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function SuitShopMainWindow.close_callback(slot0)
	if slot0.tab_view_list then
		for slot4, slot5 in pairs(slot0.tab_view_list) do
			slot5:DeleteMe()
		end

		slot0.tab_view_list = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.role_vo then
		if slot0.updata_suit_event then
			slot0.role_vo:UnBind(slot0.updata_suit_event)

			slot0.updata_suit_event = nil
		end

		slot0.role_vo = nil
	end

	uv0:openSuitShopMainView(false)
end

SuitShopTab = class("SuitShopTab", function ()
	return ccui.Widget:create()
end)
SuitShopTab.Width = 100
SuitShopTab.Height = 50

function SuitShopTab.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SuitShopTab.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_clothes_lustrat_tab"))

	slot0:addChild(slot0.root_wnd)
	slot0:setTouchEnabled(true)
	slot0:setContentSize(cc.size(SuitShopTab.Width, SuitShopTab.Height))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.select = slot1:getChildByName("select")
	slot0.normal = slot1:getChildByName("normal")

	slot0.normal:setVisible(false)

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")
end

function SuitShopTab.setSelect(slot0, slot1)
	if slot0.select then
		slot0.select:setVisible(slot1)
	end
end

function SuitShopTab.setNormal(slot0, slot1)
	if slot0.normal then
		slot0.normal:setVisible(slot1)
	end
end

function SuitShopTab.setName(slot0, slot1)
	if slot0.name then
		slot0.name:setTextColor(slot1)
	end
end

function SuitShopTab.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function SuitShopTab.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playTabButtonSound()

				if uv0.callback and uv0.data_index then
					uv0.callback(uv0.data_index)
				end
			end
		end
	end)
end

function SuitShopTab.setData(slot0, slot1, slot2, slot3)
	slot0.data_index = slot1

	slot0.select:setFlippedX(false)
	slot0.normal:setFlippedX(false)

	if slot1 == 1 then
		slot0.select:loadTexture(PathTool.getResFrame("common", "common_2023"), LOADTEXT_TYPE_PLIST)
		slot0.select:setFlippedX(true)
		slot0.normal:loadTexture(PathTool.getResFrame("common", "common_2021"), LOADTEXT_TYPE_PLIST)
		slot0.normal:setFlippedX(true)
	elseif slot1 == slot2 then
		slot0.select:loadTexture(PathTool.getResFrame("common", "common_2023"), LOADTEXT_TYPE_PLIST)
		slot0.normal:loadTexture(PathTool.getResFrame("common", "common_2021"), LOADTEXT_TYPE_PLIST)
	end

	if slot3 and slot3.name then
		slot0.name:setString(string.sub(slot3.name, 1, 6))
	end
end

function SuitShopTab.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

SuitShopItem = class("SuitShopItem", function ()
	return ccui.Widget:create()
end)

function SuitShopItem.ctor(slot0)
	slot0.goods_item = nil

	slot0:configUI()
	slot0:register_event()
end

function SuitShopItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("suitshop/suitshop_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(312, 147))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.sprite = slot0.main_container:getChildByName("Sprite_1")

	if Config.ExchangeData.data_shop_list[MallConst.MallType.SuitShop] and Config.ItemData.data_get_data(slot1.item_bid) then
		loadSpriteTexture(slot0.sprite, PathTool.getItemRes(slot2.icon, false), LOADTEXT_TYPE)
	end

	slot0.name = slot0.main_container:getChildByName("name")

	slot0.name:setString("")

	slot0.diam_count = slot0.main_container:getChildByName("diam_count")

	slot0.diam_count:setString("")

	slot0.item_mask = slot0.main_container:getChildByName("item_mask")

	slot0.item_mask:setVisible(false)

	slot0.condit = slot0.main_container:getChildByName("condit")

	slot0.condit:setVisible(false)

	if not slot0.goods_item then
		slot0.goods_item = BackPackItem.new(nil, true)

		slot0.goods_item:setSwallowTouches(true)
		slot0.main_container:getChildByName("item_node"):addChild(slot0.goods_item)
		slot0.goods_item:setDefaultTip()
	end
end

function SuitShopItem.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playButtonSound2()

				if uv0.callback then
					uv0.callback()
				end
			end
		end
	end)
end

function SuitShopItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function SuitShopItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.suit_shop_data = slot1

	if uv0:checkIsOpenByScore(slot1.buy_condit) == false then
		slot0.item_mask:setVisible(true)
		slot0.condit:setVisible(true)
		slot0:setTouchEnabled(false)
		slot0.condit:setString(slot1.pass_name)
		slot0.goods_item:setDefaultTip(false)
	else
		slot0.item_mask:setVisible(false)
		slot0.condit:setVisible(false)
		slot0:setTouchEnabled(true)
		slot0.goods_item:setDefaultTip(true)
	end

	if slot0.goods_item then
		slot0.goods_item:setBaseData(slot1.id)

		if slot1.id ~= SuitShopMainWindow.buy_item_id then
			slot0.goods_item:setSuitShopStar(true, slot1.show_star)
		else
			slot0.goods_item:setSuitShopStar(false)
		end
	end

	slot0.condit:setString(slot1.pass_name)
	slot0.name:setString(slot1.item_name)
	slot0.diam_count:setString(slot1.price)
end

function SuitShopItem.showLimitCount(slot0, slot1, slot2, slot3)
	if slot1 then
		if slot0.limit_tips == nil then
			slot0.limit_tips = createRichLabel(20, 175, cc.p(0, 0.5), cc.p(136, 35))

			slot0.main_container:addChild(slot0.limit_tips)
		else
			slot0.limit_tips:setVisible(true)
		end

		slot0.limit_tips:setString(string.format(TI18N("每日限购<div fontcolor=#249003>%s/%s</div>个"), slot2, slot3))
	elseif slot0.limit_tips then
		slot0.limit_tips:setVisible(false)
	end
end

function SuitShopItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
