HeroResetOfferPanel = HeroResetOfferPanel or BaseClass(BaseView)
slot0 = table.insert
slot2 = HeroController:getInstance():getModel()

function HeroResetOfferPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "hero/hero_reset_offer_panel"
end

function HeroResetOfferPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot0.win_title = slot1:getChildByName("win_title")
	slot0.dec_val = createRichLabel(24, cc.c4b(71, 44, 30, 255), cc.p(0, 1), cc.p(50, 491), 12, nil, 580)

	slot1:addChild(slot0.dec_val)

	slot0.cancel_btn = slot1:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("取 消"))
	slot0.cancel_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)

	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

	slot0.confirm_btn_label:setString(TI18N("献 祭"))
	slot0.confirm_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.list_view = slot1:getChildByName("list_view")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.list_view, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.list_view:getContentSize(), {
		start_y = 6,
		once_num = 4,
		start_x = 16,
		item_width = 119,
		space_x = 32,
		row = 4,
		item_height = 119,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = BackPackItem
	})
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.container = slot1
end

function HeroResetOfferPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHeroResetOfferPanel(false)
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:openHeroResetOfferPanel(false)
	end, true, 2)
	registerButtonEventListener(slot0.confirm_btn, function ()
		uv0:onConfirmButton()
	end, true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Reset_Look_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0.list)
	end)
	slot0:addGlobalEvent(HeroEvent.Hero_Sell_Holy_Equipment_Res_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0.list)
	end)
end

function HeroResetOfferPanel.onConfirmButton(slot0)
	uv0:openHeroResetOfferPanel(false)

	if slot0.reset_type == HeroConst.ResetType.eHeroReset then
		slot0:onHeroComfirm()
	elseif slot0.reset_type == HeroConst.ResetType.eChipReset then
		slot0:onChipComfirm()
	elseif slot0.reset_type == HeroConst.ResetType.eHolyEquipSell then
		slot0:onHolyEquipComfirm()
	elseif slot0.reset_type == HeroConst.ResetType.eTenStarChang then
		slot0:onTenStarChangeComfirm()
	elseif slot0.reset_type == HeroConst.ResetType.eActionHeroReset or slot0.reset_type == HeroConst.ResetType.eHeroReturn or slot0.reset_type == HeroConst.ResetType.eSpriteReturn then
		if slot0.callback then
			slot0.callback()
		end
	elseif slot0.reset_type == HeroConst.ResetType.eFunriture then
		slot0:onFurnitureComfirm()
	end
end

function HeroResetOfferPanel.onTenStarChangeComfirm(slot0)
	if slot0.callback then
		slot0.callback()
	end
end

function HeroResetOfferPanel.onHeroComfirm(slot0)
	if slot0.is_show_tips then
		CommonAlert.show(TI18N("本次献祭含有5星或以上英雄，是否确认献祭？"), TI18N("确定"), function ()
			if uv0.callback then
				uv0.callback()
			end
		end, TI18N("取消"), nil, nil, nil, {
			timer = 10,
			timer_for = true,
			off_y = 10,
			title = TI18N("英雄献祭"),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER
		})
	elseif slot0.callback then
		slot0.callback()
	end
end

function HeroResetOfferPanel.onChipComfirm(slot0)
	if slot0.is_show_tips then
		if CommonAlert.show(TI18N("本次献祭的碎片满足召唤英雄要求，献祭后可能会失去召唤的机会，是否继续？"), TI18N("确定"), function ()
			if uv0.callback then
				uv0.callback()
			end
		end, TI18N("取消"), nil, CommonAlert.type.common, nil, {
			timer = 5,
			timer_for = true,
			off_y = 10,
			title = TI18N("碎片献祭"),
			extend_aligment = cc.TEXT_ALIGNMENT_CENTER,
			extend_size = 22,
			extend_offy = -58,
			extend_type = CommonAlert.type.rich
		}).extend_txt then
			slot3.extend_txt:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
				BackpackController:getInstance():openMainView(true, BackPackConst.item_tab_type.HERO)
				uv0:close()
			end, {
				"click",
				"href"
			})
		end

		return
	end

	if slot0.callback then
		slot0.callback()
	end
end

function HeroResetOfferPanel.onHolyEquipComfirm(slot0)
	if slot0.callback then
		slot0.callback()
	end
end

function HeroResetOfferPanel.onFurnitureComfirm(slot0)
	if slot0.callback then
		slot0.callback()
	end
end

function HeroResetOfferPanel.openRootWnd(slot0, slot1)
	slot3 = slot1.is_show_tips
	slot4 = slot1.callback
	slot5 = slot1.reset_type
	slot6 = slot1.dec

	if not slot1.hero_list then
		return
	end

	slot0.is_show_tips = slot3
	slot0.reset_type = slot5 or HeroConst.ResetType.eHeroReset

	if slot5 == HeroConst.ResetType.eHeroReset then
		slot0.dec_val:setString(TI18N("献祭英雄可获得材料，若英雄有进行升级、进阶、升星培养，也会100%返还所消耗的突破卡、贝里和英雄经验。本次献祭所得如下："))
		slot0.win_title:setString(TI18N("英雄献祭"))
		uv0:sender11075(slot2)
	elseif slot5 == HeroConst.ResetType.eTenStarChang then
		slot0.dec_val:setString(TI18N("参与置换的5星英雄，若有进行升级培养，会100%返还培养材料（贝里、英雄经验、突破卡）及身上装备与战技。本次置换返还所得如下："))
		slot0.win_title:setString(TI18N("英雄置换"))
		slot0.confirm_btn_label:setString(TI18N("置 换"))
		slot0:setData(slot2)
	elseif slot5 == HeroConst.ResetType.eActionHeroReset then
		slot7 = TI18N("英雄重生可获得材料，若有进行升级培养，会100%返还培养材料（贝里、英雄经验、突破卡）及身上装备与战技。本次置换返还所得如下：")

		if Config.PartnerData.data_partner_const.reborn_desc3 then
			slot7 = slot8.desc
		end

		slot0.dec_val:setString(slot7)
		slot0.win_title:setString(TI18N("英雄重生"))
		slot0.confirm_btn_label:setString(TI18N("重 生"))
		slot0:setData(slot2)
	elseif slot5 == HeroConst.ResetType.eChipReset then
		slot0.dec_val:setString(slot6)
		slot0:setData(slot2)
		slot0.win_title:setString(TI18N("碎片献祭"))
	elseif slot5 == HeroConst.ResetType.eHolyEquipSell then
		slot0.dec_val:setString(slot6)
		uv0:sender11088(slot2)
		slot0.win_title:setString(TI18N("神装出售"))
		slot0.confirm_btn_label:setString(TI18N("出 售"))
	elseif slot5 == HeroConst.ResetType.eFunriture then
		slot0.dec_val:setString(slot6)
		slot0.win_title:setString(TI18N("家具出售"))
		slot0.confirm_btn_label:setString(TI18N("出 售"))
		slot0:setData(slot2)
	elseif slot5 == HeroConst.ResetType.eHeroReturn then
		slot7 = TI18N("英雄回退可获得材料，若有进行升级培养，会100%返还培养材料（贝里、英雄经验、突破卡）及身上装备与战技。本次置换返还所得如下：")

		if Config.PartnerData.data_partner_const.return_desc3 then
			slot7 = slot8.desc
		end

		slot0.dec_val:setString(slot7)
		slot0.dec_val:setPositionY(528)
		slot0.win_title:setString(TI18N("英雄回退"))

		slot14 = "回 退"

		slot0.confirm_btn_label:setString(TI18N(slot14))

		slot9 = {}

		for slot13, slot14 in ipairs(slot2) do
			if slot14.is_partner == 1 then
				uv1(slot9, {
					bid = slot14.id,
					star = slot14.star,
					lev = slot14.lev,
					show_type = MainuiConst.item_exhibition_type.partner_type
				})
			else
				uv1(slot9, {
					slot14.id,
					slot14.num
				})
			end
		end

		slot0:setHeroReturnData(slot9)
	elseif slot5 == HeroConst.ResetType.eSpriteReturn then
		slot0.dec_val:setString(TI18N("幽灵重生会返还全部训练果实与等同于所消耗本体数量的英雄之魂，同时保留1个1级本体"))
		slot0.win_title:setString(TI18N("幽灵重生"))

		slot13 = "重 生"

		slot0.confirm_btn_label:setString(TI18N(slot13))

		slot8 = {}

		for slot12, slot13 in ipairs(slot2) do
			uv1(slot8, {
				id = slot13[1],
				num = slot13[2]
			})
		end

		slot0:setData(slot8)
	end

	slot0.callback = slot4
end

function HeroResetOfferPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		uv0(slot2, {
			id = slot7.id,
			quantity = slot7.num
		})
	end

	if #slot2 == 0 then
		commonShowEmptyIcon(slot0.list_view, true, {
			font_size = 22,
			scale = 1,
			text = TI18N("无返还资源")
		})

		return
	end

	table.sort(slot2, SortTools.tableUpperSorter({
		"id"
	}))
	slot0.item_scrollview:setData(slot2, nil, nil, {
		is_show_tips = true,
		is_other = false
	})
end

function HeroResetOfferPanel.setHeroReturnData(slot0, slot1)
	if not slot1 then
		return
	end

	if #slot1 == 0 then
		commonShowEmptyIcon(slot0.list_view, true, {
			font_size = 22,
			scale = 1,
			text = TI18N("无返还资源")
		})

		return
	end

	slot0.item_scrollview:setData(slot1, nil, {
		start_y = 6,
		once_num = 4,
		start_x = 16,
		item_width = 119,
		space_x = 32,
		row = 4,
		item_height = 119,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = HeroReturnIconItem
	})
end

function HeroResetOfferPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openHeroResetOfferPanel(false)
end

HeroReturnIconItem = class("HeroReturnIconItem", function ()
	return ccui.Widget:create()
end)

function HeroReturnIconItem.ctor(slot0)
	slot0.size = cc.size(119, 119)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)
	slot0:registerEvent()
end

function HeroReturnIconItem.registerEvent(slot0)
end

function HeroReturnIconItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot2 = nil

	if slot1.show_type ~= nil and slot1.show_type == MainuiConst.item_exhibition_type.partner_type then
		slot2 = HeroExhibitionItem.new(1, true)

		slot2:addCallBack(function ()
		end)
		slot2:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot2:setData(slot1)
		slot0.root_wnd:addChild(slot2)
	else
		slot2 = BackPackItem.new(false, true)

		slot2:setPosition(slot0.size.width / 2, slot0.size.height / 2)
		slot2:setSwallowTouches(false)
		slot2:setDefaultTip()
		slot2:setBaseData(slot1[1], slot1[2], true)
		slot0.root_wnd:addChild(slot2)
	end

	slot0.item = slot2
end

function HeroReturnIconItem.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
