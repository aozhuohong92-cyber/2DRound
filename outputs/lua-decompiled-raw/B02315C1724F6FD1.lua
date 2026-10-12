EquipmakeSourcesWindow = EquipmakeSourcesWindow or BaseClass(BaseView)
slot0 = table.insert
slot1 = table.remove
slot2 = EquipmakeController:getInstance()
slot3 = BackpackController:getInstance():getModel()

function EquipmakeSourcesWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "equipmake/equipmake_source_window"
	slot0.cur_type = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("equipmake", "equipmake"),
			type = ResourcesType.plist
		}
	}
end

function EquipmakeSourcesWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale(slot0.root_wnd))

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("获取途径"))
	slot1:getChildByName("title_1"):setString(TI18N("熔炼橙装"))
	slot1:getChildByName("title_2"):setString(TI18N("获取途径"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.list_view_1 = slot1:getChildByName("list_view_1")
	slot0.list_view_2 = slot1:getChildByName("list_view_2")
	slot0.list_item_1 = slot1:getChildByName("list_item_1")
	slot0.list_item_2 = slot1:getChildByName("list_item_2")
	slot0.empty_tips = slot1:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无橙装可熔炼"))

	slot0.container = slot1
end

function EquipmakeSourcesWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEquipmakeSourcesWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openEquipmakeSourcesWindow(false)
		end
	end)

	if slot0.sell_goods_event == nil then
		slot0.sell_goods_event = GlobalEvent:getInstance():Bind(BackpackEvent.Sell_Goods_Success, function ()
			uv0:createEquipListSources()
		end)
	end
end

function EquipmakeSourcesWindow.openRootWnd(slot0)
	slot0:createEquipListSources()
	slot0:createItemListSources()
end

function EquipmakeSourcesWindow.createEquipListSources(slot0)
	if uv0:getBagGoldEquipList() == nil or next(slot1) == nil then
		slot0.empty_tips:setVisible(true)

		if slot0.equip_list_sources then
			slot0.equip_list_sources:setVisible(false)
		end
	else
		if slot0.equip_list_sources == nil then
			slot2 = slot0.list_view_1:getContentSize()
			slot0.equip_list_sources = CommonScrollViewLayout.new(slot0.list_view_1, cc.p(0, 0), nil, , cc.size(slot2.width, slot2.height), {
				start_y = 0,
				item_width = 554,
				start_x = 4,
				space_x = 4,
				row = 0,
				item_height = 116,
				space_y = -3,
				col = 1,
				need_dynamic = true,
				item_class = EquipmakeSourcesEquipList
			})
		end

		slot0.empty_tips:setVisible(false)
		slot0.equip_list_sources:setVisible(true)
		slot0.equip_list_sources:setData(slot1, nil, , slot0.list_item_1)
	end
end

function EquipmakeSourcesWindow.createItemListSources(slot0)
	if Config.PartnerEqmData.data_partner_const.boss_point == nil then
		return
	end

	if Config.ItemData.data_get_data(slot1.val) == nil or slot2.source == nil or next(slot2.source) == nil then
		return
	end

	for slot7, slot8 in ipairs(slot2.source) do
		if slot8[1] and slot8[2] then
			table.insert({}, {
				id = slot8[1],
				notice = slot8[2] == TRUE
			})
		end
	end

	if slot0.item_list_sources == nil then
		slot4 = slot0.list_view_2:getContentSize()
		slot0.item_list_sources = CommonScrollViewLayout.new(slot0.list_view_2, cc.p(0, 0), nil, , cc.size(slot4.width, slot4.height), {
			start_y = 0,
			item_width = 554,
			start_x = 4,
			space_x = 4,
			row = 0,
			item_height = 80,
			space_y = -3,
			col = 1,
			need_dynamic = true,
			item_class = EquipmakeSourcesItemList
		})
	end

	slot0.item_list_sources:setData(slot3, nil, , slot0.list_item_2)
end

function EquipmakeSourcesWindow.close_callback(slot0)
	if slot0.equip_list_sources then
		slot0.equip_list_sources:DeleteMe()

		slot0.equip_list_sources = nil
	end

	if slot0.item_list_sources then
		slot0.item_list_sources:DeleteMe()

		slot0.item_list_sources = nil
	end

	if slot0.sell_goods_event then
		GlobalEvent:getInstance():UnBind(slot0.sell_goods_event)

		slot0.sell_goods_event = nil
	end

	uv0:openEquipmakeSourcesWindow(true)
end

EquipmakeSourcesEquipList = class("EquipmakeSourcesEquipList ", function ()
	return ccui.Layout:create()
end)

function EquipmakeSourcesEquipList.ctor(slot0)
end

function EquipmakeSourcesEquipList.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.item_name = slot0.root_wnd:getChildByName("item_name")
		slot0.item_lev = slot0.root_wnd:getChildByName("item_lev")
		slot0.item_get_result = slot0.root_wnd:getChildByName("item_get_result")
		slot0.confirm_btn = slot0.root_wnd:getChildByName("confirm_btn")
		slot0.confirm_btn_label = slot0.confirm_btn:getChildByName("label")

		slot0.confirm_btn_label:setString(TI18N("熔炼"))

		slot0.item = BackPackItem.new(false, true, false, 0.75, false, true)

		slot0.item:setPosition(54, 58)
		slot0.root_wnd:addChild(slot0.item)
		slot0:registerEvent()
	end
end

function EquipmakeSourcesEquipList.registerEvent(slot0)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				uv0:checkToSellItems()
			end
		end
	end)
end

function EquipmakeSourcesEquipList.checkToSellItems(slot0)
	BackpackController:getInstance():openSellWindow(true, BackPackConst.Bag_Code.EQUIPS, {
		slot0.data
	})
end

function EquipmakeSourcesEquipList.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		slot0.item:setData(slot1)

		if slot0.data.config then
			slot0.item_name:setTextColor(BackPackConst.quality_color[slot0.data.config.quality] or Config.ColorData.data_color4[175])
			slot0.item_name:setString(slot0.data.config.name)
			slot0.item_lev:setString(string.format(TI18N("%s级"), slot0.data.config.lev))
			slot0:setSellShowInfo()
		end
	end
end

function EquipmakeSourcesEquipList.setSellShowInfo(slot0)
	if slot0.data == nil or slot0.data.config == nil then
		return
	end

	if Config.PartnerEqmData.data_partner_const.boss_point == nil then
		return
	end

	if Config.ItemData.data_get_data(slot1.val) == nil then
		return
	end

	for slot7, slot8 in ipairs(slot0.data.config.value) do
		if slot8[1] == slot1.val then
			slot3 = 0 + slot8[2]
		end
	end

	if slot0.data.enchant and slot0.data.enchant ~= 0 and Config.PartnerEqmData.data_partner_eqm(getNorKey(slot0.data.config.type, slot0.data.enchant)) ~= nil and slot4.sell ~= nil and next(slot4.sell) ~= nil then
		for slot8, slot9 in ipairs(slot4.sell) do
			if slot9[1] == slot1.val then
				slot3 = slot3 + slot9[2] * slot0.data.quantity
			end
		end
	end

	slot0.item_get_result:setString(string.format("熔炼获得:%s%s", slot2.name, slot3))
end

function EquipmakeSourcesEquipList.DeleteMe(slot0)
	if slot0.item then
		slot0.item:DeleteMe()

		slot0.item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

EquipmakeSourcesItemList = class("EquipmakeSourcesItemList ", function ()
	return ccui.Layout:create()
end)

function EquipmakeSourcesItemList.ctor(slot0)
end

function EquipmakeSourcesItemList.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.item_name = slot0.root_wnd:getChildByName("item_name")
		slot0.notice_img = slot0.root_wnd:getChildByName("notice_img")
		slot0.confirm_btn = slot0.root_wnd:getChildByName("confirm_btn")

		slot0:registerEvent()
	end
end

function EquipmakeSourcesItemList.registerEvent(slot0)
	slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				BackpackController:getInstance():gotoItemSources(uv0.data.evt_type, uv0.data.extend)
			end
		end
	end)
end

function EquipmakeSourcesItemList.setData(slot0, slot1)
	if slot1 and slot1.id then
		slot0.data = Config.SourceData.data_source_data[slot1.id]

		if slot0.data then
			slot0.item_name:setString(slot0.data.name)
		end

		slot0.notice_img:setVisible(slot1.notice == true)
	end
end

function EquipmakeSourcesItemList.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
