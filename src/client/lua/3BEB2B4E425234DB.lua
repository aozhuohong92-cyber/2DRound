PlanesafkEvtShopPanel = PlanesafkEvtShopPanel or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function PlanesafkEvtShopPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "planesafk/planesafk_evt_shop_panel"
	slot0.res_list = {}
	slot0.dic_other_hero = {}
end

function PlanesafkEvtShopPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("旅行商人"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.bg_tips = slot0.main_container:getChildByName("bg_tips")

	slot0.bg_tips:setString(TI18N("看来你的运气不错,这里能买到不少好东西"))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")
	slot0.left_btn_label = slot0.left_btn:getChildByName("label")

	slot0.left_btn_label:setString(TI18N("前 往"))

	slot0.shop_icon = slot0.main_container:getChildByName("shop_icon")
	slot0.shop_load = loadSpriteTextureFromCDN(slot0.shop_icon, PathTool.getPlistImgForDownLoad("planes", "shop_icon"), ResourcesType.single, slot0.shop_load)
	slot2 = createImage(slot0.main_container, nil, 0, 0, cc.p(0, 0.5), false, 1)

	slot2:setCapInsets(cc.rect(24, 24, 107, 89))
	slot2:setAnchorPoint(0.5, 0)
	slot2:setScaleX(0.94)
	slot2:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, 6))

	slot0.line_load = loadImageTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/pattern", "pattern_3"), ResourcesType.single, slot0.line_load)
end

function PlanesafkEvtShopPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
	slot0:addGlobalEvent(PlanesafkEvent.Evt_Shop_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.data = slot0

		uv0:updateData()
		uv0:updateListInfo()
	end)
end

function PlanesafkEvtShopPanel.onClickBtnClose(slot0)
	uv0:openPlanesafkEvtShopPanel(false)
end

function PlanesafkEvtShopPanel.onClickBtnRight(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.is_select == 1 then
		uv0:sender28600(slot0.data.line, slot0.data.index, 1, {
			{
				val2 = 0,
				val1 = 0,
				type = PlanesafkConst.Proto_28600._8
			}
		})
		slot0:onClickBtnClose()
	else
		uv0:sender28600(slot0.data.line, slot0.data.index, 1, {
			{
				val2 = 0,
				val1 = 0,
				type = PlanesafkConst.Proto_28600._6
			}
		})
	end
end

function PlanesafkEvtShopPanel.openRootWnd(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if uv0:getMapEvtData(slot0.data.line, slot0.data.index) and slot2.is_black then
		slot0.left_btn:setVisible(false)
	end

	slot0:setData()
	slot0:updateData()
end

function PlanesafkEvtShopPanel.updateData(slot0)
	if not slot0.data then
		return
	end

	if uv0:getMapEvtData(slot0.data.line, slot0.data.index) and slot1.is_black then
		slot0.left_btn:setVisible(false)
	else
		slot0.left_btn:setVisible(true)

		if slot0.data.is_select == 1 then
			if not slot0.is_common_1017 then
				slot0.is_common_1017 = true

				slot0.left_btn:loadTexture(PathTool.getResFrame("common", "common_1017"), LOADTEXT_TYPE_PLIST)
				slot0.left_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
			end

			slot0.left_btn_label:setString(TI18N("放 弃"))
		else
			slot0.left_btn_label:setString(TI18N("前 往"))
		end
	end
end

function PlanesafkEvtShopPanel.setData(slot0)
	if not slot0.data then
		return
	end

	slot0.show_list = slot0.data.item_list

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)
	slot0:updateList()
end

function PlanesafkEvtShopPanel.updateListInfo(slot0)
	slot0.show_list = slot0.data.item_list

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)

	if slot0.item_scrollview then
		slot0.item_scrollview:resetCurrentItems()
	end
end

function PlanesafkEvtShopPanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot1 = nil
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			space_x = 0,
			item_height = 200,
			space_y = 0,
			col = 1,
			item_width = #slot0.show_list <= 4 and 150 or 135
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)

		if #slot0.show_list <= 4 then
			slot0.item_scrollview:setClickEnabled(false)
		end
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无商城数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData()
end

function PlanesafkEvtShopPanel.createNewCell(slot0, slot1, slot2)
	return PlanesafkEvtShopItem.new(slot1, slot2, slot0)
end

function PlanesafkEvtShopPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function PlanesafkEvtShopPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])
end

function PlanesafkEvtShopPanel.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.shop_load then
		slot0.shop_load:DeleteMe()
	end

	slot0.shop_load = nil

	if slot0.line_load then
		slot0.line_load:DeleteMe()
	end

	slot0.line_load = nil

	uv0:openPlanesafkEvtShopPanel(false)
end

PlanesafkEvtShopItem = class("PlanesafkEvtShopItem", function ()
	return ccui.Widget:create()
end)

function PlanesafkEvtShopItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function PlanesafkEvtShopItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("planesafk/planesafk_evt_shop_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.item_node = slot0.main_container:getChildByName("item_node")
	slot0.item = BackPackItem.new(true, true)

	slot0.item:setDefaultTip()
	slot0.item_node:addChild(slot0.item)

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot4 = slot0.comfirm_btn:getContentSize()
	slot0.price_label = createRichLabel(24, cc.c3b(255, 255, 255), cc.p(0.5, 0.5), cc.p(slot4.width / 2, slot4.height / 2))

	slot0.comfirm_btn:addChild(slot0.price_label)

	slot0.discount = slot0.main_container:getChildByName("discount")
	slot0.discount_num = slot0.discount:getChildByName("discount_num")
end

function PlanesafkEvtShopItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, handler(slot0, slot0.showAlert), true, 2)
end

function PlanesafkEvtShopItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not Config.PlanesData.data_shop_info[slot0.data.id] then
		return
	end

	slot0.shop_config = slot3

	if slot0.item then
		slot0.item:setBaseData(slot3.base_id, slot3.num)
	end

	if slot3.discount > 0 then
		slot0.discount_num:setString(slot3.discount .. TI18N("折"))
		slot0.discount:setVisible(true)
	else
		slot0.discount:setVisible(false)
	end

	if slot0.parent and slot0.parent.data and slot0.parent.data.is_select == 1 then
		if slot0.data.is_flag == 1 then
			setChildUnEnabled(true, slot0.comfirm_btn)
			slot0.comfirm_btn:setTouchEnabled(false)
			slot0.price_label:setString(TI18N("已售完"))
		else
			slot0.comfirm_btn:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.comfirm_btn)

			if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot3.type]) then
				slot0.price_label:setString(string.format("<img src='%s' scale=0.3 /><div fontcolor=#FFFFFF outline=2,#020019> %s</div>", PathTool.getItemRes(slot5.icon), MoneyTool.GetMoneyString(slot3.price)))
			end
		end
	else
		if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot3.type]) then
			slot0.price_label:setString(string.format("<img src='%s' scale=0.3 /><div fontcolor=#FFFFFF> %s</div>", PathTool.getItemRes(slot5.icon), MoneyTool.GetMoneyString(slot3.price)))
		end

		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(false)
	end
end

function PlanesafkEvtShopItem.showAlert(slot0)
	if slot0.parent and slot0.parent.data and slot0.parent.data.is_select == 1 then
		if slot0.data.is_flag == 1 then
			message(TI18N("已售完"))

			return
		end

		slot0:onBuyItem()
	end
end

function PlanesafkEvtShopItem.onBuyItem(slot0)
	if not slot0.shop_config then
		return
	end

	slot1 = slot0.shop_config.price

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot1 <= BackpackController:getInstance():getModel():getItemNumByBid(Config.ItemData.data_assets_label2id[slot0.shop_config.type]) then
		slot6 = BackPackConst.Bag_Code.BACKPACK

		if Config.ItemData.data_get_data(slot0.shop_config.base_id).sub_type == 1 then
			slot6 = BackPackConst.Bag_Code.EQUIPS
		end

		CommonAlert.show(string.format(TI18N("是否购买<div fontColor=#289b14 fontsize= 26>%s</div>(拥有:<div fontColor=#289b14 fontsize= 26>%d</div>)？"), slot5.name, BackpackController:getInstance():getModel():getItemNumByBid(slot0.shop_config.base_id, slot6)), TI18N("确定"), function ()
			if uv0.parent and uv0.parent.data and uv0.data then
				uv1:sender28600(uv0.parent.data.line, uv0.parent.data.index, 1, {
					{
						val2 = 0,
						type = PlanesafkConst.Proto_28600._7,
						val1 = uv0.data.pos
					}
				})
			end
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	else
		slot5 = nil

		if (type(slot0.shop_config.type) ~= "number" or Config.ItemData.data_get_data(slot0.shop_config.type)) and Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot0.shop_config.type]) then
			if slot5.id == Config.ItemData.data_assets_label2id.gold then
				if FILTER_CHARGE then
					message(TI18N("钻石不足"))
				else
					CommonAlert.show(string.format(TI18N("%s不足，是否前往充值？"), slot5.name), TI18N("确定"), function ()
						VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
					end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, nil, true)
				end
			else
				BackpackController:getInstance():openTipsSource(true, slot5)
			end
		end
	end
end

function PlanesafkEvtShopItem.setSelectImg(slot0)
end

function PlanesafkEvtShopItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
