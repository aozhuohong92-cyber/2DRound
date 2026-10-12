HomePetItemBagPanel = HomePetItemBagPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = table.insert
slot4 = table.sort
slot5 = string.format

function HomePetItemBagPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_travellingbag", "homepet_travellingbag"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "homepet/home_pet_item_bag_panel"
	slot0.show_type = HomepetConst.Item_bag_show_type.eBagItemType
end

function HomePetItemBagPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("物品"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("获取更多"))

	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot2 = {
		TI18N("食 物"),
		TI18N("道 具"),
		TI18N("珍 品")
	}
	slot0.tab_item_type = {
		BackPackConst.item_type.HOME_PET_FOOD,
		BackPackConst.item_type.HOME_PET_ITEM,
		BackPackConst.item_type.HOME_PET_TREASURE
	}
	slot0.tab_list = {}

	for slot6 = 1, 3 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot6) then
			slot8 = {
				select_bg = slot7:getChildByName("select_bg")
			}

			slot8.select_bg:setVisible(false)

			slot8.unselect_bg = slot7:getChildByName("unselect_bg")
			slot8.title = slot7:getChildByName("title")

			slot8.title:setTextColor(cc.c4b(215, 226, 227, 255))

			if slot2[slot6] then
				slot8.title:setString(slot2[slot6])
			end

			slot8.tab_btn = slot7
			slot8.index = slot6
			slot0.tab_list[slot6] = slot8
		end
	end

	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
end

function HomePetItemBagPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)

	function slot4()
		uv0:onComfirmBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.comfirm_btn, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if not uv0.item_scrollview then
			return
		end

		if slot0 == BackPackConst.Bag_Code.PETBACKPACK and uv0.tab_object then
			uv0:updateList(uv0.tab_object.index)
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if not uv0.item_scrollview then
			return
		end

		if slot0 == BackPackConst.Bag_Code.PETBACKPACK and uv0.tab_object then
			uv0:updateList(uv0.tab_object.index)
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if not uv0.item_scrollview then
			return
		end

		if slot0 == BackPackConst.Bag_Code.PETBACKPACK and uv0.tab_object then
			uv0:updateList(uv0.tab_object.index)
		end
	end)
end

function HomePetItemBagPanel.onClosedBtn(slot0)
	uv0:openHomePetItemBagPanel(false)
end

function HomePetItemBagPanel.onComfirmBtn(slot0)
	if not slot0.tab_object then
		return
	end

	slot1 = 1

	if slot0.tab_item_type[slot0.tab_object.index] == BackPackConst.item_type.HOME_PET_ITEM then
		slot1 = 2
	end

	HomeworldController:getInstance():openHomeworldShopWindow(true, {
		index = 2,
		sub_index = slot1
	})
end

function HomePetItemBagPanel.onClickItemIndex(slot0, slot1)
end

function HomePetItemBagPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_list[slot1] and slot0.tab_list[slot1].is_lock then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:setTextColor(cc.c4b(215, 226, 227, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:setTextColor(cc.c4b(255, 255, 255, 255))
	end

	slot0:updateList(slot1)

	if slot0.tab_item_type[slot1] == BackPackConst.item_type.HOME_PET_TREASURE then
		slot0.comfirm_btn:setVisible(false)
	else
		slot0.comfirm_btn:setVisible(true)
	end
end

function HomePetItemBagPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}
	slot0.show_type = slot2.show_type or HomepetConst.Item_bag_show_type.eBagItemType
	slot0.select_item_id = slot2.select_item_id
	slot0.other_item_id = slot2.other_item_id
	slot0.select_key = slot2.select_key

	slot0:checkTabUnlockInfo()
	slot0:changeSelectedTab(slot2.index or HomepetConst.Item_bag_tab_type.eFoodType)
end

function HomePetItemBagPanel.checkTabUnlockInfo(slot0)
	function slot1(slot0)
		if not slot0 then
			return
		end

		slot0.is_lock = true

		setChildUnEnabled(true, slot0.tab_btn)
	end

	if slot0.show_type == HomepetConst.Item_bag_show_type.eSelectFoodType then
		slot1(slot0.tab_list[2])
		slot1(slot0.tab_list[3])
	elseif slot0.show_type == HomepetConst.Item_bag_show_type.eSelectItemType then
		slot1(slot0.tab_list[1])
		slot1(slot0.tab_list[3])
	end
end

function HomePetItemBagPanel.updateList(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			space_x = 0,
			item_width = 618,
			item_height = 145,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.show_list = {}

	for slot7, slot8 in pairs(uv0:getBagItemList(BackPackConst.Bag_Code.PETBACKPACK)) do
		if slot8.config and slot8.config.type == (slot0.tab_item_type[slot1] or BackPackConst.item_type.HOME_PET_ITEM) then
			if not slot0.other_item_id or slot0.other_item_id ~= slot8.id or slot8.quantity ~= 1 then
				uv1(slot0.show_list, slot8)
			end
		end
	end

	uv2(slot0.show_list, SortTools.tableUpperSorter({
		"quality",
		"base_id"
	}))
	slot0.item_scrollview:reloadData()

	if #slot0.show_list == 0 then
		if slot0.tab_item_type[slot1] == BackPackConst.item_type.HOME_PET_ITEM then
			commonShowEmptyIcon(slot0.lay_srollview, true, {
				text = TI18N("一个道具都没有噢，快去商城获取吧~")
			})
		elseif slot0.tab_item_type[slot1] == BackPackConst.item_type.HOME_PET_FOOD then
			commonShowEmptyIcon(slot0.lay_srollview, true, {
				text = TI18N("一个食物都没有噢，快去商城获取吧~")
			})
		else
			commonShowEmptyIcon(slot0.lay_srollview, true, {
				text = TI18N("一个珍品都没有噢，快让宠物去旅行获取吧~")
			})
		end
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function HomePetItemBagPanel.createNewCell(slot0, slot1, slot2)
	return HomePetItemBagItem.new(slot1, slot2, slot0)
end

function HomePetItemBagPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function HomePetItemBagPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot4 = HomepetConst.Item_bag_tab_type.eFoodType

	if slot0.tab_object then
		slot4 = slot0.tab_object.index
	end

	slot1:setData(slot3, slot4, slot0.select_item_id and slot0.select_item_id == slot3.id, slot0.other_item_id and slot0.other_item_id == slot3.id)
end

function HomePetItemBagPanel.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	uv0:openHomePetItemBagPanel(false)
end

HomePetItemBagItem = class("HomePetItemBagItem", function ()
	return ccui.Widget:create()
end)

function HomePetItemBagItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function HomePetItemBagItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homepet/home_pet_item_bag_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.select_btn = slot0.main_container:getChildByName("select_btn")
	slot0.select_btn_label = slot0.select_btn:getChildByName("label")

	slot0.select_btn_label:setString(TI18N("选 择"))

	slot0.cancel_btn = slot0.main_container:getChildByName("cancel_btn")
	slot0.cancel_btn_label = slot0.cancel_btn:getChildByName("label")

	slot0.cancel_btn_label:setString(TI18N("取消选择"))

	slot0.item_node = slot0.main_container:getChildByName("item_node")
	slot0.item = BackPackItem.new(true, false, nil, 0.8)

	slot0.item_node:addChild(slot0.item)

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.name_desc_1 = slot0.main_container:getChildByName("name_desc_1")
	slot0.name_desc_2 = slot0.main_container:getChildByName("name_desc_2")
	slot0.name_desc_3 = createRichLabel(20, cc.c4b(142, 129, 119, 255), cc.p(0, 1), cc.p(142, 60), 6, nil, 280)

	slot0.main_container:addChild(slot0.name_desc_3)
end

function HomePetItemBagItem.register_event(slot0)
	registerButtonEventListener(slot0.select_btn, function ()
		uv0:onSelectBtn()
	end, true, 1)
	registerButtonEventListener(slot0.cancel_btn, function ()
		uv0:onCancelBtn()
	end, true, 1)
end

function HomePetItemBagItem.onSelectBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.tab_index and slot0.tab_index == HomepetConst.Item_bag_tab_type.eTreasureType then
		uv0:openHomePetItemSellPanel(true, {
			goods_vo = slot0.data,
			max_count = slot0.data.quantity
		})
	elseif slot0.parent.show_type ~= HomepetConst.Item_bag_show_type.eBagItemType then
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_SELECT_ITEM_CALLBACK_EVENT, slot0.parent.select_key, slot0.data.id)
		slot0.parent:onClosedBtn()
	end
end

function HomePetItemBagItem.onCancelBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.parent then
		return
	end

	if slot0.parent.show_type ~= HomepetConst.Item_bag_show_type.eBagItemType then
		GlobalEvent:getInstance():Fire(HomepetEvent.HOME_PET_SELECT_ITEM_CALLBACK_EVENT, slot0.parent.select_key)
		slot0.parent:onClosedBtn()
	end
end

function HomePetItemBagItem.setData(slot0, slot1, slot2, slot3, slot4)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot0.tab_index = slot2

	if slot1.config then
		if slot4 then
			slot0.item:setBaseData(slot5.id, slot1.quantity - 1)
		else
			slot0.item:setBaseData(slot5.id, slot1.quantity)
		end

		slot0.name:setString(slot5.name)
		slot0.name_desc_1:setString(slot5.type_desc)
		slot0.name_desc_2:setString(slot5.use_desc)
		slot0.name_desc_3:setString(slot5.desc)
	end

	if slot2 == HomepetConst.Item_bag_tab_type.eTreasureType then
		slot0:setSellBtn()
	else
		slot0:setBtnStatus(slot3)
	end
end

function HomePetItemBagItem.setBtnStatus(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot2 = slot1 or false

	if slot0.parent.show_type == HomepetConst.Item_bag_show_type.eSelectFoodType then
		slot0.cancel_btn:setVisible(slot2)
		slot0.select_btn:setVisible(not slot2)
	elseif slot0.parent.show_type == HomepetConst.Item_bag_show_type.eSelectItemType then
		slot0.cancel_btn:setVisible(slot2)
		slot0.select_btn:setVisible(not slot2)
	elseif slot0.parent.show_type == HomepetConst.Item_bag_show_type.eBagItemType then
		slot0.cancel_btn:setVisible(false)
		slot0.select_btn:setVisible(false)
	end
end

function HomePetItemBagItem.setSellBtn(slot0)
	slot0.cancel_btn:setVisible(false)
	slot0.select_btn:setVisible(true)
	slot0.select_btn_label:setString(TI18N("出售"))
end

function HomePetItemBagItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.honor_item:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
