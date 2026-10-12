slot1 = MallController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = {
	HeroConst.CampType.eNone,
	HeroConst.CampType.eWater,
	HeroConst.CampType.eFire,
	HeroConst.CampType.eWind,
	HeroConst.CampType.eLight,
	HeroConst.CampType.eDark
}
SkinShopWindow = SkinShopWindow or BaseClass(BaseView)

function SkinShopWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/skin_shop_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall_skin", "mall_skin"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "txt_cn_skin_banner"),
			type = ResourcesType.single
		}
	}
	slot0.cur_index = 1

	slot0:initAllShopData()
end

function SkinShopWindow.open_callback(slot0)
	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot6 = 1

	slot0:playEnterAnimatianByObj(slot0.main_container, slot6)

	slot0.container_size = slot0.main_container:getContentSize()
	slot0.bottom_sp = slot1:getChildByName("bottom_sp")
	slot0.bottom_image = slot1:getChildByName("bottom_image")
	slot0.bottom_shadow = slot1:getChildByName("bottom_shadow")
	slot0.top_panel = slot1:getChildByName("top_panel")
	slot0.scrollCon = slot0.top_panel:getChildByName("image_bg")
	slot0.camp_panel = slot0.top_panel:getChildByName("camp_panel")
	slot0.camp_btn_list = {}

	for slot6 = 1, 6 do
		slot7 = {
			camp_bg_sp = slot2:getChildByName("camp_bg_sp_" .. slot6),
			camp_btn = slot2:getChildByName("camp_btn_" .. slot6)
		}
		slot7.pos_x = slot7.camp_btn:getPositionX()

		uv0(slot0.camp_btn_list, slot7)
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.l_bg = slot0.top_panel:getChildByName("image_pillar_1")
	slot0.r_bg = slot0.top_panel:getChildByName("image_pillar_2")
	slot0.item_list = slot0.top_panel:getChildByName("item_list")

	slot0:adaptationScreen()

	slot0.skin_scrollview = CommonScrollViewSingleLayout.new(slot0.item_list, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.item_list:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 13,
		space_x = 20,
		item_width = 206,
		item_height = 325,
		space_y = 50,
		col = 3,
		need_dynamic = true
	})

	slot0.skin_scrollview:setSwallowTouches(false)
	slot0.skin_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.skin_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.skin_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function SkinShopWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.main_container)
	slot2 = display.getBottom(slot0.main_container)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))
	slot0.close_btn:setPositionY(slot0.close_btn:getPositionY() + slot2)
	slot0.bottom_sp:setPositionY(slot0.bottom_sp:getPositionY() + slot2)
	slot0.bottom_image:setPositionY(slot0.bottom_image:getPositionY() + slot2)
	slot0.bottom_shadow:setPositionY(slot0.bottom_shadow:getPositionY() + slot2)

	slot8 = slot0.scrollCon:getContentSize()
	slot9 = slot1 - slot0.container_size.height - slot2

	slot0.scrollCon:setContentSize(cc.size(slot8.width, slot8.height + slot9))

	slot10 = slot0.item_list:getContentSize()

	slot0.item_list:setContentSize(cc.size(slot10.width, slot10.height + slot9))

	slot11 = slot0.r_bg:getContentSize()

	slot0.r_bg:setContentSize(cc.size(slot11.width, slot11.height + slot9))

	slot12 = slot0.l_bg:getContentSize()

	slot0.l_bg:setContentSize(cc.size(slot12.width, slot12.height + slot9))
end

function SkinShopWindow.createNewCell(slot0)
	return SkinShopItem.new()
end

function SkinShopWindow.numberOfCells(slot0)
	if not slot0.skin_data then
		return 0
	end

	return #slot0.skin_data
end

function SkinShopWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.skin_data then
		return
	end

	slot1.index = slot2

	if not slot0.skin_data[slot2] then
		return
	end

	slot1:setData(slot3)

	if slot2 % 3 == 1 then
		slot1:createItemBgSprite()
	end
end

function SkinShopWindow.register_event(slot0)
	slot4 = handler(slot0, slot0.onClickCloseBtn)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

	for slot4, slot5 in ipairs(slot0.camp_btn_list) do
		registerButtonEventListener(slot5.camp_btn, function ()
			uv0:onClickCampBtn(uv1)
		end, true)
	end

	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if uv0.skin_scrollview then
			uv0.skin_scrollview:resetCurrentItems()
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if uv0.skin_scrollview then
			uv0.skin_scrollview:resetCurrentItems()
		end
	end)
end

function SkinShopWindow.initAllShopData(slot0)
	slot0.all_shop_data = {}
	slot0.all_camp_data = {}

	for slot4, slot5 in pairs(Config.ChargeMallData.data_skin_mall) do
		if Config.PartnerSkinData.data_skin_info[slot5.skin_id] and Config.PartnerData.data_partner_base[slot6.bid] then
			if not slot0.all_shop_data[slot7.camp_type] then
				slot0.all_shop_data[slot7.camp_type] = {}
			end

			slot8 = {
				mall_cfg = slot5,
				skin_cfg = slot6,
				camp_type = slot7.camp_type
			}

			uv0(slot0.all_shop_data[slot7.camp_type], slot8)
			uv0(slot0.all_camp_data, slot8)
		end
	end

	function slot1(slot0, slot1)
		if slot0.camp_type == slot1.camp_type then
			return slot0.mall_cfg.sort < slot1.mall_cfg.sort
		else
			return slot0.camp_type < slot1.camp_type
		end
	end

	for slot5, slot6 in pairs(slot0.all_shop_data) do
		uv1(slot6, slot1)
	end

	uv1(slot0.all_camp_data, slot1)
end

function SkinShopWindow.openRootWnd(slot0)
	slot0:showLightEffect(true)
	slot0:onClickCampBtn(1, true)
end

function SkinShopWindow.onClickCampBtn(slot0, slot1, slot2)
	if not slot2 and slot0.cur_index == slot1 then
		return
	end

	if not slot0.camp_btn_list or not slot0.all_shop_data then
		return
	end

	if not slot0.camp_btn_list[slot1] then
		return
	end

	if slot0.camp_btn_list[slot0.cur_index] then
		slot0.camp_btn_list[slot0.cur_index].camp_bg_sp:setPositionY(50)
		slot0.camp_btn_list[slot0.cur_index].camp_btn:setPositionY(51)
	end

	slot0:showCampEffect(true, slot3.pos_x)
	slot3.camp_bg_sp:setPositionY(60)
	slot3.camp_btn:setPositionY(61)

	slot0.cur_index = slot1

	if uv0[slot1] == HeroConst.CampType.eNone then
		slot0.skin_data = slot0.all_camp_data or {}
	else
		slot0.skin_data = slot0.all_shop_data[slot4] or {}
	end

	slot0.skin_scrollview:reloadData()

	if #slot0.skin_data > 0 then
		commonShowEmptyIcon(slot0.skin_scrollview, false)
	else
		commonShowEmptyIcon(slot0.skin_scrollview, true, {
			text = TI18N("暂无可购买的皮肤")
		})
	end
end

function SkinShopWindow.showCampEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.camp_panel) and slot0.camp_effect == nil then
			slot0.camp_effect = createEffectSpine(Config.EffectData.data_effect_info[1602], cc.p(slot2, 61), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.camp_panel:addChild(slot0.camp_effect)
		end

		if slot0.camp_effect and slot2 then
			slot0.camp_effect:setPositionX(slot2)
		end
	elseif slot0.camp_effect then
		slot0.camp_effect:clearTracks()
		slot0.camp_effect:removeFromParent()

		slot0.camp_effect = nil
	end
end

function SkinShopWindow.showLightEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.main_container) and slot0.light_effect_1 == nil then
			slot0.light_effect_1 = createEffectSpine(Config.EffectData.data_effect_info[1601], cc.p(21, 882), cc.p(0, 0.5), true, PlayerAction.action)

			slot0.main_container:addChild(slot0.light_effect_1)
		end

		if not tolua.isnull(slot0.main_container) and slot0.light_effect_2 == nil then
			slot0.light_effect_2 = createEffectSpine(Config.EffectData.data_effect_info[1601], cc.p(702, 882), cc.p(1, 0.5), true, PlayerAction.action)

			slot0.light_effect_2:setScaleX(-1)
			slot0.main_container:addChild(slot0.light_effect_2)
		end
	else
		if slot0.light_effect_1 then
			slot0.light_effect_1:clearTracks()
			slot0.light_effect_1:removeFromParent()

			slot0.light_effect_1 = nil
		end

		if slot0.light_effect_2 then
			slot0.light_effect_2:clearTracks()
			slot0.light_effect_2:removeFromParent()

			slot0.light_effect_2 = nil
		end
	end
end

function SkinShopWindow.onClickCloseBtn(slot0)
	uv0:openSkinShopWindow(false)
end

function SkinShopWindow.close_callback(slot0)
	slot0:showLightEffect(false)
	slot0:showCampEffect(false)

	if slot0.skin_scrollview then
		slot0.skin_scrollview:DeleteMe()

		slot0.skin_scrollview = nil
	end

	uv0:openSkinShopWindow(false)
end

SkinShopItem = class("SkinShopItem", function ()
	return ccui.Layout:create()
end)

function SkinShopItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()

	slot0.item_list = {}
end

function SkinShopItem.configUI(slot0)
	slot0.size = cc.size(206, 325)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("mall/skin_shop_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")

	slot2:setSwallowTouches(false)

	slot0.container = slot2
	slot0.card_sp = slot2:getChildByName("card_sp")

	slot0.card_sp:setScale(0.6)

	slot0.camp_sp = slot2:getChildByName("camp_sp")
	slot0.name_txt = slot2:getChildByName("name_txt")
	slot0.buy_btn = slot2:getChildByName("buy_btn")
	slot0.price_txt = slot0.buy_btn:getChildByName("label")
end

function SkinShopItem.registerEvent(slot0)
	registerButtonEventListener(slot0.container, handler(slot0, slot0.onClickItem), true, nil, nil, nil, nil, true)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickBuyBtn), true)
end

function SkinShopItem.onClickItem(slot0)
	if slot0.skin_cfg then
		if not slot0.skin_cfg.item_id_list[1] then
			return
		end

		if Config.ItemData.data_get_data(slot1) then
			HeroController:getInstance():openHeroSkinTipsPanel(true, slot2)
		end
	end
end

function SkinShopItem.onClickBuyBtn(slot0)
	if not slot0.mall_cfg then
		return
	end

	if slot0.is_have == false then
		if Config.ChargeData.data_charge_data[slot0.mall_cfg.charge_id or 0] then
			sdkOnPay(slot2.val, nil, slot2.id, slot2.name, slot2.name)
		end
	else
		message(TI18N("已经拥有该皮肤"))
	end
end

function SkinShopItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.mall_cfg = slot1.mall_cfg
	slot0.skin_cfg = slot1.skin_cfg
	slot0.camp_type = slot1.camp_type

	if slot0.item_grid_bg then
		slot0.item_grid_bg:setVisible(false)
	end

	if not slot0.mall_cfg or not slot0.skin_cfg or not slot0.camp_type then
		return
	end

	slot0.name_txt:setString(slot0.skin_cfg.skin_name)
	slot0.price_txt:setString(uv0("￥%s", slot0.mall_cfg.price))
	loadSpriteTexture(slot0.camp_sp, PathTool.getHeroCampTypeIcon(slot0.camp_type), LOADTEXT_TYPE_PLIST)

	if slot0.recrod_res ~= PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. slot0.skin_cfg.head_card_id) then
		slot0.recrod_res = slot3
		slot0.card_load = loadSpriteTextureFromCDN(slot0.card_sp, slot3, ResourcesType.single, slot0.card_load)
	end

	for slot7, slot8 in pairs(slot0.item_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in ipairs(slot0.mall_cfg.award or {}) do
		slot10 = slot8[2]

		if Config.ItemData.data_get_data(slot8[1]) then
			if not slot0.item_list[slot7] then
				slot12 = BackPackItem.new(true, true, false, 0.5, true, true)

				slot0.container:addChild(slot12)

				slot0.item_list[slot7] = slot12
			end

			slot12:setVisible(true)
			slot12:setPosition(68 + (slot7 - 1) * 70, 86)
			slot12:setBaseData(slot9, slot10)
		end
	end

	if HeroController:getModel():isUnlockHeroSkin(slot0.skin_cfg.skin_id, true) or BackpackController:getInstance():getModel():getItemNumByBid(slot0.mall_cfg.skin_bid) > 0 then
		slot0.is_have = true

		slot0.price_txt:setString(TI18N("已拥有"))
	else
		slot0.is_have = false
	end

	setChildUnEnabled(slot0.is_have, slot0.buy_btn)
end

function SkinShopItem.createItemBgSprite(slot0)
	if not slot0.item_grid_bg then
		slot0.item_grid_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_3"), -14, 20, slot0, cc.p(0, 1), LOADTEXT_TYPE, -1)
	end

	slot0.item_grid_bg:setVisible(true)
end

function SkinShopItem.DeleteMe(slot0)
	if slot0.card_load then
		slot0.card_load:DeleteMe()

		slot0.card_load = nil
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
