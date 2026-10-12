slot1 = HeroController:getInstance():getModel()
slot2 = string.format
HorcruxActivateWindow = HorcruxActivateWindow or BaseClass(BaseView)

function HorcruxActivateWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "hero/horcrux_activate_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("hero", "hero"),
			type = ResourcesType.plist
		}
	}
	slot0.no_activate_lev = 1
	slot0.horcrux_attr_config = nil
	slot0.partner_horcrux_config = nil
	slot0.attr_data_list = {}
	slot0.cost_item_list = {}
	slot0.strengthen_item_list = {}
end

function HorcruxActivateWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.title_bg = slot0.container:getChildByName("image_1")
	slot0.win_title = slot0.container:getChildByName("win_title")

	slot0.win_title:setString(TI18N("魂器觉醒"))

	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot0.base_panel = slot0.container:getChildByName("base_panel")
	slot0.exclusive_hero = slot0.base_panel:getChildByName("exclusive_hero")
	slot0.score_title = slot0.base_panel:getChildByName("score_title")

	slot0.score_title:setString(TI18N("评分："))

	slot0.power_label = CommonNum.new(1, slot0.base_panel, 1, -2, cc.p(0, 0))

	slot0.power_label:setPosition(cc.p(318, 30))
	slot0.power_label:setNum(0)

	slot0.name = slot0.base_panel:getChildByName("name")
	slot0.look_btn = slot0.base_panel:getChildByName("look_btn")
	slot0.horcrux_node = slot0.base_panel:getChildByName("horcrux_node")
	slot0.horcrux_item = HorcruxItem.new(false, 0.95, false, false)

	slot0.horcrux_node:addChild(slot0.horcrux_item)

	slot0.attr_panel = slot0.container:getChildByName("attr_panel")
	slot0.base_attr_title = slot0.attr_panel:getChildByName("label")

	slot0.base_attr_title:setString(TI18N("基础属性(未激活)"))

	slot0.attr_scroll = slot0.attr_panel:getChildByName("attr_scroll")
	slot0.strengthen_effect_panel = slot0.container:getChildByName("strengthen_effect_panel")
	slot0.strengthen_effect_title = slot0.strengthen_effect_panel:getChildByName("label")

	slot0.strengthen_effect_title:setString(TI18N("强化属性(未激活)"))

	slot0.strengthen_effect_scroll = slot0.strengthen_effect_panel:getChildByName("strengthen_effect_scroll")

	slot0.strengthen_effect_scroll:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.strengthen_effect_scroll:getContentSize()
	slot0.activate_panel = slot0.container:getChildByName("activate_panel")
	slot0.consume_txt = slot0.activate_panel:getChildByName("consume_txt")

	slot0.consume_txt:setString(TI18N("消\n耗"))

	slot0.activate_condition = slot0.activate_panel:getChildByName("activate_condition")

	slot0.activate_condition:setVisible(false)

	slot0.activate_btn = slot0.activate_panel:getChildByName("activate_btn")
	slot0.activate_btn_label = slot0.activate_btn:getChildByName("label")

	slot0.activate_btn_label:setString(TI18N("觉醒"))
	slot0.activate_btn:setEnabled(false)

	slot0.cost_node = slot0.activate_panel:getChildByName("cost_node")

	slot0:updateScrollviewList()
end

function HorcruxActivateWindow.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.attr_scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.attr_scroll:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 5,
			row = 0,
			delay = 4,
			space_x = 0,
			item_width = 590,
			item_height = 35,
			space_y = 15,
			col = 1
		}, cc.p(0, 0))

		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.child_scrollview:setSwallowTouches(false)
end

function HorcruxActivateWindow.createNewCell(slot0, slot1, slot2)
	return HorcruxAttrItem1.new()
end

function HorcruxActivateWindow.numberOfCells(slot0)
	if not slot0.attr_data_list then
		return 0
	end

	return #slot0.attr_data_list
end

function HorcruxActivateWindow.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.attr_data_list then
		return
	end

	slot1.index = slot2

	if not slot0.attr_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HorcruxActivateWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHorcruxActivatePanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHorcruxActivatePanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.activate_btn, function ()
		if uv0.horcrux_data and uv0.horcrux_data.partner_id then
			uv1:sender11402(uv0.horcrux_data.partner_id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.HorcruxData.data_constant.horcrux_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true, 2)
	slot0:addGlobalEvent(HeroEvent.Hero_Data_Update, function (slot0)
		if not slot0 or not uv0.horcrux_data then
			return
		end

		if slot0.partner_id == uv0.horcrux_data.partner_id then
			uv0.horcrux_data = {
				bid = slot0.bid,
				horcrux_status = slot0.horcrux_status,
				horcrux_lev = slot0.horcrux_lev,
				partner_id = slot0.partner_id,
				star = slot0.star
			}

			if slot0.horcrux_status >= 1 then
				uv1:openHorcruxActivatePanel(false)
			end
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:updateItemList(slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		uv0:updateItemList(slot1)
	end)
	slot0:addGlobalEvent(HeroEvent.HORCRUX_CAN_ACTIVATE, function (slot0)
		uv0:setData(slot0)
	end)
end

function HorcruxActivateWindow.openRootWnd(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.horcrux_data = slot1
	slot0.horcrux_attr_config = uv0:getHorcruxAttrConfig(slot0.no_activate_lev)
	slot0.partner_horcrux_config = uv0:getPartnerHorcruxConfig(slot0.horcrux_data.bid)
end

function HorcruxActivateWindow.setData(slot0, slot1)
	slot0.can_activate = false

	if slot1 and slot1.result == 1 then
		slot0.can_activate = true
	end

	slot0.msg = slot1.msg

	if slot0.horcrux_data == nil or slot0.horcrux_attr_config == nil or slot0.partner_horcrux_config == nil then
		return
	end

	slot0:setBaseInfo()
	slot0:setAttrInfo()
	slot0:setStrengthenEffectInfo()
	slot0:setActivateInfo()
end

function HorcruxActivateWindow.setBaseInfo(slot0)
	slot0.horcrux_item:setData(slot0.horcrux_data)
	slot0.name:setString(slot0.partner_horcrux_config.horcrux_name)

	slot2 = ""

	if Config.PartnerData.data_partner_base[slot0.horcrux_data.bid] and slot1.name then
		slot2 = uv0(TI18N("%s专属"), slot1.name)
	end

	slot0.exclusive_hero:setString(slot2)
	slot0.power_label:setNum(slot0.horcrux_attr_config.score or 0)
end

function HorcruxActivateWindow.setAttrInfo(slot0)
	slot0.attr_data_list = uv0:getHorcruxAttrList(slot0.horcrux_data.bid, slot0.no_activate_lev)

	slot0.child_scrollview:setClickEnabled(#slot0.attr_data_list > 3)
	slot0.child_scrollview:reloadData()
end

function HorcruxActivateWindow.setStrengthenEffectInfo(slot0)
	slot0.strengthen_item_list = {}

	if uv0:getStrengthenDesc(slot0.horcrux_data.bid, slot0.no_activate_lev) then
		for slot6, slot7 in ipairs(slot1) do
			slot8, slot9 = slot0:createStrengthenItem(slot7)
			slot0.strengthen_item_list[slot6] = {
				slot8,
				slot9
			}
			slot2 = 0 + slot9
		end

		slot3 = math.max(slot2, slot0.scroll_size.height)

		slot0.strengthen_effect_scroll:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot3))
		slot0.strengthen_effect_scroll:setTouchEnabled(slot0.scroll_size.height < slot3)

		slot4 = 0

		for slot8, slot9 in ipairs(slot0.strengthen_item_list) do
			slot0.strengthen_effect_scroll:addChild(slot9[1])
			slot9[1]:setPosition(20, slot3 - (slot4 + slot9[2] / 2))

			slot4 = slot4 + slot9[2]
		end
	end
end

function HorcruxActivateWindow.setActivateInfo(slot0)
	slot1 = Config.HorcruxData.data_constant.partner_awaken_loss

	for slot5, slot6 in pairs(slot0.cost_item_list) do
		slot6:setVisible(false)
	end

	slot2 = 0

	if slot1 and slot1.val then
		for slot6, slot7 in ipairs(slot1.val) do
			slot8 = slot7[1]
			slot9 = slot7[2]

			if not slot0.cost_item_list[slot6] then
				slot10 = BackPackItem.new(false, true, false, 0.9)

				slot0.cost_node:addChild(slot10)

				slot0.cost_item_list[slot6] = slot10
			end

			slot10:setPosition((slot6 - 1) * (BackPackItem.Width * 0.9 + 10), 0)

			slot11 = BackpackController:getInstance():getModel():getItemNumByBid(slot8)

			slot10:setBaseData(slot8)
			slot10:setNeedNum(slot9, slot11, 1, true, 2)

			if slot11 < slot9 then
				slot10:setDefaultTip(true, true)
			else
				slot10:setDefaultTip()
			end

			slot10:setVisible(true)
		end

		slot2 = #slot1.val
	end

	slot4 = ""

	if Config.HorcruxData.data_constant.partner_awaken_limit and slot3.desc then
		slot4 = slot3.desc
	end

	slot0.activate_condition:setString(slot4)

	if slot0.can_activate then
		slot0.activate_btn:setEnabled(true)
		setChildUnEnabled(false, slot0.activate_btn)
		slot0.activate_btn_label:enableOutline(Config.ColorData.data_color3[277], 2)
		slot0.activate_condition:setVisible(false)
	else
		slot0.activate_condition:setString(slot0.msg or slot4)
		slot0.activate_btn:setEnabled(true)
		setChildUnEnabled(false, slot0.activate_btn)
		slot0.activate_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.activate_condition:setVisible(true)
	end
end

function HorcruxActivateWindow.updateItemList(slot0, slot1)
	slot2 = {
		[slot7.base_id] = true
	}

	for slot6, slot7 in pairs(slot1) do
		if slot7.base_id then
			-- Nothing
		end
	end

	for slot6, slot7 in ipairs(slot0.cost_item_list) do
		if Config.HorcruxData.data_constant.partner_awaken_loss and slot8.val and slot7:getData().id and slot2[slot7:getData().id] then
			for slot12, slot13 in pairs(slot8.val) do
				if slot7:getData().id == slot13[1] then
					slot7:setNeedNum(slot13[2], BackpackController:getInstance():getModel():getItemNumByBid(slot7:getData().id))
				end
			end
		end
	end
end

function HorcruxActivateWindow.createStrengthenItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = cc.size(550, 50)

	ccui.Widget:create():setAnchorPoint(0, 0.5)

	slot4 = PathTool.getResFrame("hero", "hero_info_65")
	slot5 = cc.c4b(124, 79, 61, 255)

	if slot1.is_achieve then
		slot4 = PathTool.getResFrame("hero", "hero_info_64")
		slot5 = cc.c4b(101, 223, 116, 255)
	end

	slot6 = createRichLabel(22, slot5, cc.p(0, 0.5), cc.p(50, 0), 8, nil, 500)

	slot6:setString(slot1.desc_str)

	slot2.height = math.max(slot2.height, slot6:getContentSize().height + 10)

	slot3:setContentSize(cc.size(slot2.width, slot2.height))
	slot3:addChild(slot6)
	slot6:setPositionY(slot2.height / 2)

	slot7 = createImage(slot3, slot4, 15, slot2.height / 2 + slot6:getContentSize().height / 2 + 3, cc.p(0.5, 1), true)

	return slot3, slot2.height
end

function HorcruxActivateWindow.close_callback(slot0)
	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()

		slot0.child_scrollview = nil
	end

	if slot0.cost_item_list and next(slot0.cost_item_list) ~= nil then
		for slot4, slot5 in pairs(slot0.cost_item_list) do
			if slot5.item then
				slot5.item:DeleteMe()
			end
		end

		slot0.cost_item_list = {}
	end

	if slot0.horcrux_item then
		slot0.horcrux_item:DeleteMe()

		slot0.horcrux_item = nil
	end

	slot0.strengthen_item_list = nil

	uv0:openHorcruxActivatePanel(false)
end

HorcruxAttrItem1 = class("HorcruxAttrItem1", function ()
	return ccui.Widget:create()
end)

function HorcruxAttrItem1.ctor(slot0)
	slot0:configUI()
end

function HorcruxAttrItem1.configUI(slot0)
	slot0.size = cc.size(599, 35)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/horcrux_attr_item1"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.attr_icon = slot0.container:getChildByName("attr_icon")
	slot0.attr_name = slot0.container:getChildByName("attr_name")
	slot0.attr_val = slot0.container:getChildByName("attr_val")
end

function HorcruxAttrItem1.setData(slot0, slot1)
	slot0.data = slot1
	slot2 = slot1[1][1]
	slot4 = Config.AttrData.data_key_to_name[slot2]
	slot5 = PathTool.getAttrIconByStr(slot2)

	if PartnerCalculate.isShowPerByStr(slot2) == true then
		slot3 = slot1[1][2] * 0.1 .. "%"
	end

	loadSpriteTexture(slot0.attr_icon, PathTool.getResFrame("common", slot5), LOADTEXT_TYPE_PLIST)
	slot0.attr_name:setString(slot4)
	slot0.attr_val:setString("+" .. slot3)
end

function HorcruxAttrItem1.DeleteMe(slot0)
	slot0:removeAllChildren()
end
