HomePetTravellingBagPanel = HomePetTravellingBagPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()
slot2 = BackpackController:getInstance():getModel()
slot3 = table.insert

function HomePetTravellingBagPanel.__init(slot0, slot1)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_travellingbag", "homepet_travellingbag"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "homepet/home_pet_travelling_bag_panel"
	slot0.homepet_vo = uv0:getHomePetVo()
	slot0.show_type = slot1 or 1
end

function HomePetTravellingBagPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("行囊"))

	slot0.look_btn = slot1:getChildByName("look_btn")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")

	slot0.comfirm_btn:getChildByName("label"):setString(TI18N("确 定"))
	slot0.main_container:getChildByName("label_1"):setString(TI18N("本次出行"))
	slot0.main_container:getChildByName("label_2"):setString(TI18N("下次出行"))
	slot0.main_container:getChildByName("label_3"):setString(TI18N("食物"))
	slot0.main_container:getChildByName("label_4"):setString(TI18N("食物"))
	slot0.main_container:getChildByName("label_5"):setString(TI18N("道具"))
	slot0.main_container:getChildByName("label_6"):setString(TI18N("道具"))

	slot0.tips = slot0.main_container:getChildByName("tips")
	slot5 = TI18N

	slot0.tips:setString(slot5("请携带食物，否则萌宠不会出行噢~"))

	slot0.item_type_list = {
		BackPackConst.item_tab_type.HOMEPET_FOOD,
		BackPackConst.item_tab_type.HOMEPET_ITEM,
		BackPackConst.item_tab_type.HOMEPET_FOOD,
		BackPackConst.item_tab_type.HOMEPET_ITEM
	}
	slot0.item_list = {}

	for slot5 = 1, 4 do
		slot0.item_list[slot5] = BackPackItem.new(true, true, nil, 1)

		slot0.item_list[slot5]:addCallBack(function ()
			uv0:onClickItemIndex(uv1)
		end)
		slot0.main_container:getChildByName("item_node_" .. slot5):addChild(slot0.item_list[slot5])
	end

	slot0.btn_goto = slot0.main_container:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("label"):setString(TI18N("旅行中"))
end

function HomePetTravellingBagPanel.playEnterAnimatian(slot0)
	if not slot0.main_container then
		return
	end

	commonOpenActionLeftMove(slot0.main_container)

	if slot0.show_type and slot0.show_type == 1 then
		commonOpenActionCentreScale(slot0.main_container)
	else
		commonOpenActionRightMove(slot0.main_container)
	end
end

function HomePetTravellingBagPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:onGotoBtn()
	end, true, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.HomePetData.data_const.travelling_bag_tips then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1)
	slot0:addGlobalEvent(HomepetEvent.HOME_PET_TRAVELLING_BAG_UPDATE_EVENT, function ()
		uv0:onClosedBtn()
	end)
	slot0:addGlobalEvent(HomepetEvent.HOME_PET_SELECT_ITEM_CALLBACK_EVENT, function (slot0, slot1)
		if not slot0 then
			return
		end

		if not uv0.homepet_vo then
			return
		end

		uv0.dic_set_item_id[slot0] = slot1

		uv0:updateItemList()
	end)
end

function HomePetTravellingBagPanel.onClosedBtn(slot0)
	uv0:openHomePetTravellingBagPanel(false)
end

function HomePetTravellingBagPanel.onGotoBtn(slot0)
	if slot0.is_goto then
		slot0:onClosedBtn()
		uv0:openHomePetGooutProgressPanel(true, {
			show_type = 2
		})
	end
end

function HomePetTravellingBagPanel.onComfirmBtn(slot0)
	if not slot0.homepet_vo then
		return
	end

	if not slot0.dic_set_item_id then
		return
	end

	slot1 = {}

	for slot5, slot6 in pairs(slot0.dic_set_item_id) do
		uv0(slot1, {
			key = slot5,
			id = slot6
		})
	end

	uv1:sender26107(slot1)
end

function HomePetTravellingBagPanel.onClickItemIndex(slot0, slot1)
	if not slot0.item_type_list then
		return
	end

	if not slot0.homepet_vo then
		return
	end

	if (slot1 == 1 or slot1 == 2) and slot0.homepet_vo:getPetState() ~= HomepetConst.state_type.eHome then
		message(TI18N("萌宠已出行"))

		return
	end

	slot2 = {
		select_key = slot1
	}
	slot3 = 0

	for slot7, slot8 in ipairs(slot0.item_type_list) do
		if slot8 == slot0.item_type_list[slot1] and slot7 ~= slot1 then
			slot3 = slot7
		end
	end

	slot2.select_item_id = slot0.dic_set_item_id[slot1]
	slot2.other_item_id = slot0.dic_set_item_id[slot3]

	if slot0.item_type_list[slot1] == BackPackConst.item_tab_type.HOMEPET_FOOD then
		slot2.index = HomepetConst.Item_bag_tab_type.eFoodType
		slot2.show_type = HomepetConst.Item_bag_show_type.eSelectFoodType
	else
		slot2.index = HomepetConst.Item_bag_tab_type.eItemType
		slot2.show_type = HomepetConst.Item_bag_show_type.eSelectItemType
	end

	uv0:openHomePetItemBagPanel(true, slot2)
end

function HomePetTravellingBagPanel.openRootWnd(slot0, slot1)
	slot0.is_goto = (slot1 or {}).is_goto or false

	if slot0.btn_goto then
		slot0.btn_goto:setVisible(slot0.is_goto)
	end

	slot0.dic_set_item_id = deepCopy(uv0:getHomePetVo():getSetItemInfo())

	if slot0.dic_set_item_id[1] ~= nil or slot0.dic_set_item_id[3] ~= nil then
		slot0.tips:setVisible(false)
	end

	slot0:updateItemList()

	if slot0.is_goto and slot0.item_list then
		setChildUnEnabled(true, slot0.item_list[1])
		setChildUnEnabled(true, slot0.item_list[2])
	end
end

function HomePetTravellingBagPanel.updateItemList(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.item_list) do
		if slot0.dic_set_item_id[slot5] then
			if uv0:getHomePetItemById(slot7) then
				slot6:setBaseData(slot8.base_id, 1)
				slot6:showAddIcon(false)
			else
				slot6:setBaseData(nil)
				slot6:showAddIcon(true)
			end
		else
			slot6:setBaseData(nil)
			slot6:showAddIcon(true)
		end
	end
end

function HomePetTravellingBagPanel.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = {}

	uv0:openHomePetTravellingBagPanel(false)
end
