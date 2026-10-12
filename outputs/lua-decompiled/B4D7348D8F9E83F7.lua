HomePetCollectionPanel = HomePetCollectionPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function HomePetCollectionPanel.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_collection", "homepet_collection"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("homepet_eventinfo", "homepet_eventinfo"),
			type = ResourcesType.plist
		}
	}
	slot0.layout_name = "homepet/home_pet_collection_panel"
	slot0.cur_page = 1
	slot0.max_page = {}
	slot0.select_index = HomepetConst.collection_tab_type.eTreasureType
	slot0.dic_have_treasure_id = {}
	slot0.select_data = {}
end

function HomePetCollectionPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title = slot0.main_container:getChildByName("win_title")

	slot0.title:setString(TI18N("收\n藏"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.per_btn = slot0.main_container:getChildByName("per_btn")
	slot0.per_btn_lab = slot0.per_btn:getChildByName("label")

	slot0.per_btn_lab:setString(TI18N("上一页"))

	slot0.next_btn = slot0.main_container:getChildByName("next_btn")
	slot0.next_btn_lab = slot0.next_btn:getChildByName("label")

	slot0.next_btn_lab:setString(TI18N("下一页"))

	slot0.remove_btn = slot0.main_container:getChildByName("remove_btn")
	slot0.save_btn = slot0.main_container:getChildByName("save_btn")

	slot0.save_btn:setVisible(false)

	slot0.page_label = slot0.main_container:getChildByName("page_label")
	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot0.tab_type_list = {
		HomepetConst.collection_tab_type.eTreasureType,
		HomepetConst.collection_tab_type.ePhotoType,
		HomepetConst.collection_tab_type.eLetterType
	}
	slot1 = {
		[slot0.tab_type_list[1]] = TI18N("珍 品"),
		[slot0.tab_type_list[2]] = TI18N("相 册"),
		[slot0.tab_type_list[3]] = TI18N("书 信")
	}
	slot0.lay_scrollview_list = {
		[slot0.tab_type_list[1]] = slot0.main_container:getChildByName("lay_scrollview_1"),
		[slot0.tab_type_list[2]] = slot0.main_container:getChildByName("lay_scrollview_2"),
		[slot0.tab_type_list[3]] = slot0.main_container:getChildByName("lay_scrollview_3")
	}
	slot0.lay_scrollview_size = slot0.lay_scrollview_list[slot0.tab_type_list[1]]:getContentSize()
	slot0.item_params_list = {
		[slot0.tab_type_list[1]] = {
			row = 5,
			col = 4,
			size = cc.size(136, 124)
		},
		[slot0.tab_type_list[2]] = {
			row = 3,
			col = 2,
			size = cc.size(268, 189)
		}
	}
	slot5 = cc.size(158, 206)
	slot0.item_params_list[slot0.tab_type_list[3]] = {
		row = 3,
		col = 3,
		size = slot5
	}
	slot0.item_list = {}
	slot0.tab_list = {}

	for slot5 = 1, 3 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot5) then
			slot7 = {
				select_bg = slot6:getChildByName("select_img")
			}

			slot7.select_bg:setVisible(false)

			slot7.unselect_bg = slot6:getChildByName("normal_img")
			slot7.title = slot6:getChildByName("label")

			slot7.title:enableOutline(cc.c4b(140, 78, 28, 255), 2)

			slot7.index = slot0.tab_type_list[slot5] or HomepetConst.collection_tab_type.eTreasureType

			if slot1[slot7.index] then
				slot7.title:setString(slot1[slot7.index])
			end

			slot7.tab_btn = slot6
			slot0.item_list[slot7.index] = {}
			slot0.tab_list[slot7.index] = slot7
		end
	end
end

function HomePetCollectionPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.per_btn, function ()
		uv0:onPerBtn()
	end, true, 1)
	registerButtonEventListener(slot0.next_btn, function ()
		uv0:onNextBtn()
	end, true, 1)
	registerButtonEventListener(slot0.remove_btn, function ()
		uv0:onRemoveBtn()
	end, true, 1)

	function slot4()
		uv0:onSaveBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.save_btn, slot4, slot5, 1)

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

	slot0:addGlobalEvent(HomepetEvent.HOME_PET_DELETE_PHOTO_EVENT, function (slot0)
		uv0:setDataByType(HomepetConst.collection_tab_type.ePhotoType)
		uv0:checkBtnStatus()

		if uv0.max_page[uv0.select_index] < uv0.cur_page then
			uv0.cur_page = uv0.max_page[uv0.select_index]
		end

		if uv0.tab_type_list[uv0.select_index] == HomepetConst.collection_tab_type.ePhotoType then
			uv0:cleanSelectImg()

			if #uv0:updateList(uv0.select_index, uv0.cur_page) > 0 then
				uv0.select_data[uv0.select_index] = slot1[1]

				if uv0.item_list[uv0.select_index][1] and slot2.setSelectImgVisible then
					slot2:setSelectImgVisible(true)
				end
			end
		end
	end)
	slot0:addGlobalEvent(HomepetEvent.HOME_PET_DELETE_LETTER_EVENT, function (slot0)
		uv0:setDataByType(HomepetConst.collection_tab_type.eLetterType)
		uv0:checkBtnStatus()

		if uv0.max_page[uv0.select_index] < uv0.cur_page then
			uv0.cur_page = uv0.max_page[uv0.select_index]
		end

		if uv0.tab_type_list[uv0.select_index] == HomepetConst.collection_tab_type.eLetterType then
			uv0:cleanSelectImg()

			if #uv0:updateList(uv0.select_index, uv0.cur_page) > 0 then
				uv0.select_data[uv0.select_index] = slot1[1]

				if uv0.item_list[uv0.select_index][1] and slot2.setSelectImgVisible then
					slot2:setSelectImgVisible(true)
				end
			end
		end
	end)
end

function HomePetCollectionPanel.onClosedBtn(slot0)
	uv0:openHomePetCollectionPanel(false)
end

function HomePetCollectionPanel.cleanSelectImg(slot0)
	if slot0.item_list and slot0.item_list[slot0.select_index] then
		slot4 = slot0.select_index

		for slot4, slot5 in ipairs(slot0.item_list[slot4]) do
			slot5:setSelectImgVisible(false)
		end

		slot0.select_data[slot0.select_index] = nil
	end
end

function HomePetCollectionPanel.onPerBtn(slot0)
	if not slot0.item_data_list then
		return
	end

	slot1 = slot0.cur_page
	slot0.cur_page = slot0.cur_page - 1

	if slot0.cur_page < 1 then
		slot0.cur_page = 1
	end

	if slot1 ~= slot0.cur_page then
		slot0:cleanSelectImg()
	end

	slot0:checkBtnStatus()
	slot0:updateList(slot0.select_index, slot0.cur_page)
end

function HomePetCollectionPanel.onNextBtn(slot0)
	if not slot0.item_data_list then
		return
	end

	if not slot0.max_page[slot0.select_index] then
		return
	end

	slot1 = slot0.cur_page
	slot0.cur_page = slot0.cur_page + 1

	if slot0.max_page[slot0.select_index] < slot0.cur_page then
		slot0.cur_page = slot0.max_page[slot0.select_index]
	end

	if slot1 ~= slot0.cur_page then
		slot0:cleanSelectImg()
	end

	slot0:checkBtnStatus()
	slot0:updateList(slot0.select_index, slot0.cur_page)
end

function HomePetCollectionPanel.checkBtnStatus(slot0)
	if slot0.max_page[slot0.select_index] == 1 then
		slot0:setUnEnabledBtn(true, slot0.per_btn, slot0.per_btn_lab)
		slot0:setUnEnabledBtn(true, slot0.next_btn, slot0.next_btn_lab)
	elseif slot0.cur_page == 1 then
		slot0:setUnEnabledBtn(true, slot0.per_btn, slot0.per_btn_lab)
		slot0:setUnEnabledBtn(false, slot0.next_btn, slot0.next_btn_lab)
	elseif slot0.cur_page == slot0.max_page[slot0.select_index] then
		slot0:setUnEnabledBtn(false, slot0.per_btn, slot0.per_btn_lab)
		slot0:setUnEnabledBtn(true, slot0.next_btn, slot0.next_btn_lab)
	else
		slot0:setUnEnabledBtn(false, slot0.per_btn, slot0.per_btn_lab)
		slot0:setUnEnabledBtn(false, slot0.next_btn, slot0.next_btn_lab)
	end

	if slot0.page_label then
		slot0.page_label:setString(uv0(TI18N("%s/%s页"), slot0.cur_page, slot0.max_page[slot0.select_index]))
	end
end

function HomePetCollectionPanel.setUnEnabledBtn(slot0, slot1, slot2, slot3)
	setChildUnEnabled(slot1, slot2)
	slot2:setTouchEnabled(not slot1)

	if slot3 then
		if slot1 == true then
			slot3:disableEffect(cc.LabelEffect.OUTLINE)
		else
			slot3:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	end
end

function HomePetCollectionPanel.onRemoveBtn(slot0)
	if slot0.select_data and slot0.select_data[slot0.select_index] then
		CommonAlert.show(TI18N("确定要删除吗？"), TI18N("删除"), function ()
			if uv0.tab_type_list[uv0.select_index] == HomepetConst.collection_tab_type.ePhotoType then
				uv1:sender26113(BackPackConst.item_type.HOME_PET_PHOTO, uv0.select_data[uv0.select_index].id)
			elseif uv0.tab_type_list[uv0.select_index] == HomepetConst.collection_tab_type.eLetterType then
				uv1:sender26113(BackPackConst.item_type.HOME_PET_LITTER, uv0.select_data[uv0.select_index].id)
			end
		end, TI18N("取消"))
	elseif slot0.tab_type_list[slot0.select_index] == HomepetConst.collection_tab_type.ePhotoType then
		message(TI18N("没有选中明信片"))
	else
		message(TI18N("没有选中信件"))
	end
end

function HomePetCollectionPanel.onSaveBtn(slot0)
end

function HomePetCollectionPanel.changeSelectedTab(slot0, slot1)
	if slot0.tab_object and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
		slot0.tab_object.title:enableOutline(cc.c4b(140, 78, 28, 255), 2)

		slot0.tab_object = nil
	end

	slot0.select_index = slot1
	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
		slot0.tab_object.title:enableOutline(cc.c4b(151, 111, 15, 255), 2)
	end

	slot0.cur_page = 1

	slot0:checkBtnStatus()
	slot0:updateList(slot1, slot0.cur_page)

	if slot1 == HomepetConst.collection_tab_type.eTreasureType then
		slot0.remove_btn:setVisible(false)
		slot0.save_btn:setVisible(false)
	else
		slot0.remove_btn:setVisible(true)
		slot0.save_btn:setVisible(false)
	end
end

function HomePetCollectionPanel.openRootWnd(slot0, slot1)
	slot0.select_index = (slot1 or {}).index or HomepetConst.collection_tab_type.eTreasureType

	slot0:initData()
	slot0:changeSelectedTab(slot0.select_index)
end

function HomePetCollectionPanel.initData(slot0)
	if not slot0.tab_type_list then
		return
	end

	slot0.dic_have_treasure_id = uv0.dic_have_treasure_id or {}
	slot0.item_data_list = {}

	for slot4, slot5 in ipairs(slot0.tab_type_list) do
		slot0:setDataByType(slot5)
	end
end

function HomePetCollectionPanel.setDataByType(slot0, slot1)
	if slot0.item_params_list[slot1] then
		slot0.item_data_list[slot1] = {}

		if slot1 == HomepetConst.collection_tab_type.eTreasureType then
			for slot7, slot8 in pairs(Config.ItemData.data_treasure_info) do
				if Config.ItemData8.data_unit(slot7) then
					uv0(slot0.item_data_list[slot1], slot9)
				end
			end
		elseif slot1 == HomepetConst.collection_tab_type.ePhotoType then
			for slot7, slot8 in pairs(uv1.dic_photo_data or {}) do
				uv0(slot0.item_data_list[slot1], slot8)
			end
		elseif slot1 == HomepetConst.collection_tab_type.eLetterType then
			for slot7, slot8 in pairs(uv1.dic_letter_data or {}) do
				uv0(slot0.item_data_list[slot1], slot8)
			end
		end

		slot0.max_page[slot1] = math.ceil(#slot0.item_data_list[slot1] / (slot2.row * slot2.col))

		if slot0.max_page[slot1] == 0 then
			slot0.max_page[slot1] = 1
		end

		if slot1 == HomepetConst.collection_tab_type.eTreasureType then
			uv2(slot0.item_data_list[slot1], function (slot0, slot1)
				return slot1.id < slot0.id
			end)
		else
			uv2(slot0.item_data_list[slot1], function (slot0, slot1)
				return slot1.base_id < slot0.base_id
			end)
		end
	end
end

function HomePetCollectionPanel.updateList(slot0, slot1)
	if not slot0.item_data_list then
		return
	end

	if not slot0.item_data_list[slot1] then
		return
	end

	if not slot0.cur_page then
		return
	end

	for slot5, slot6 in pairs(slot0.lay_scrollview_list) do
		doStopAllActions(slot6)
		slot6:setVisible(false)
	end

	if not slot0.item_params_list[slot1] then
		return
	end

	slot3 = slot2.row * slot2.col
	slot4 = (slot0.cur_page - 1) * slot3
	slot5 = {}

	for slot9 = 1, slot3 do
		if slot0.item_data_list[slot1][slot9 + slot4] then
			uv0(slot5, slot0.item_data_list[slot1][slot9 + slot4])
		else
			break
		end
	end

	slot0:updateItemList(slot1, slot5)

	return slot5
end

function HomePetCollectionPanel.updateItemList(slot0, slot1, slot2)
	if not slot0.item_list[slot1] then
		return
	end

	if not slot0.lay_scrollview_list[slot1] then
		return
	end

	slot4 = slot0.item_params_list[slot1]
	slot8 = true

	slot3:setVisible(slot8)

	for slot8, slot9 in ipairs(slot0.item_list[slot1]) do
		slot9:setVisible(false)
	end

	if #slot2 == 0 then
		if slot0.tab_type_list[slot1] == HomepetConst.collection_tab_type.ePhotoType then
			commonShowEmptyIcon(slot3, true, {
				text = TI18N("一个明信片都没有噢，快让宠物去旅行获取吧~")
			})
		elseif slot0.tab_type_list[slot1] == HomepetConst.collection_tab_type.eLetterType then
			commonShowEmptyIcon(slot3, true, {
				text = TI18N("一个日记都没有噢，快让宠物去旅行获取吧~")
			})
		end

		return
	else
		commonShowEmptyIcon(slot3, false)
	end

	slot5 = math.floor
	slot6 = slot0.lay_scrollview_size.width / slot4.col
	slot7 = slot0.lay_scrollview_size.height / slot4.row

	for slot12, slot13 in ipairs(slot2) do
		if slot0.item_list[slot1][slot12] == nil then
			delayRun(slot3, (0 + 1) / display.DEFAULT_FPS, function ()
				uv0 = uv1:getNewItemByIndex(uv2)
				uv1.item_list[uv2][uv3] = uv0

				uv0:setPosition((uv3 - 1) % uv5.col * uv6 + uv6 * 0.5, uv1.lay_scrollview_size.height - (uv4((uv3 - 1) / uv5.col) * uv7 + uv7 * 0.5))
				uv0:setData(uv8)
				uv0:addCallback(function ()
					uv0:onClickItemIndex(uv1, uv2)
				end)
				uv9:addChild(uv0)
			end)
		else
			slot14:setVisible(true)
			slot14:setData(slot13)
		end
	end
end

function HomePetCollectionPanel.getNewItemByIndex(slot0, slot1)
	if slot1 == HomepetConst.collection_tab_type.eTreasureType then
		return HomePetCollectionTreasureItem.new(slot0)
	elseif slot1 == HomepetConst.collection_tab_type.ePhotoType then
		return HomePetCollectionPhotoItem.new()
	else
		return HomePetCollectionLetterItem.new()
	end
end

function HomePetCollectionPanel.onClickItemIndex(slot0, slot1, slot2)
	if not slot0.cur_page then
		return
	end

	if not slot0.item_params_list[slot1] then
		return
	end

	slot6 = slot0.item_list[slot1][slot2]

	if not slot0.item_data_list[slot1][slot2 + (slot0.cur_page - 1) * slot3.row * slot3.col] then
		return
	end

	if slot1 == HomepetConst.collection_tab_type.eTreasureType then
		if slot0.dic_have_treasure_id and slot0.dic_have_treasure_id[slot7.id] then
			uv0:openHomePetTreasureInfoPanel(true, {
				item_config = slot7
			})
		end
	elseif slot0.select_data[slot1] == nil or slot0.select_data[slot1].id ~= slot7.id then
		slot0:cleanSelectImg()

		slot0.select_data[slot1] = slot7

		slot6:setSelectImgVisible(true)
	elseif slot7.config then
		uv0:openHomePetEventInfoPanel(true, {
			item_id = slot7.config.id,
			id = slot7.id
		})
	end
end

function HomePetCollectionPanel.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			for slot9, slot10 in ipairs(slot5) do
				if slot10.DeleteMe then
					slot10:DeleteMe()
				end
			end
		end
	end

	slot0.item_list = nil

	uv0:openHomePetCollectionPanel(false)
end

HomePetCollectionTreasureItem = class("HomePetCollectionTreasureItem", function ()
	return ccui.Widget:create()
end)

function HomePetCollectionTreasureItem.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:configUI()
	slot0:register_event()
end

function HomePetCollectionTreasureItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homepet/home_pet_collection_treasure_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.select_img = slot0.main_container:getChildByName("select_img")

	slot0:setSelectImgVisible(false)
end

function HomePetCollectionTreasureItem.register_event(slot0)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:onSelectBtn()
	end, false, 1)
end

function HomePetCollectionTreasureItem.onSelectBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0.callback()
	end
end

function HomePetCollectionTreasureItem.addCallback(slot0, slot1)
	slot0.callback = slot1
end

function HomePetCollectionTreasureItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = nil
	slot2 = (not slot0.parent or not slot0.parent.dic_have_treasure_id or not slot0.parent.dic_have_treasure_id[slot1.id] or PathTool.getItemRes(slot0.data.icon, false)) and PathTool.getTargetRes("homepet_item", slot0.data.icon, false, false)

	if slot0.record_head_icon == nil or slot0.record_head_icon ~= slot2 then
		slot0.record_head_icon = slot2

		loadSpriteTexture(slot0.icon, slot2, LOADTEXT_TYPE)
	end
end

function HomePetCollectionTreasureItem.setSelectImgVisible(slot0, slot1)
	slot0.select_img:setVisible(slot1)
end

function HomePetCollectionTreasureItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HomePetCollectionPhotoItem = class("HomePetCollectionPhotoItem", function ()
	return ccui.Widget:create()
end)

function HomePetCollectionPhotoItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomePetCollectionPhotoItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homepet/home_pet_collection_photo_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(0, 0)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:addChild(slot0.root_wnd)
	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.ssr_img = slot0.main_container:getChildByName("ssr_img")
	slot0.select_img = slot0.main_container:getChildByName("select_img")

	slot0:setSelectImgVisible(false)
end

function HomePetCollectionPhotoItem.setSelectImgVisible(slot0, slot1)
	slot0.select_img:setVisible(slot1)
end

function HomePetCollectionPhotoItem.register_event(slot0)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:onSelectBtn()
	end, false, 1)
end

function HomePetCollectionPhotoItem.onSelectBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0.callback()
	end
end

function HomePetCollectionPhotoItem.addCallback(slot0, slot1)
	slot0.callback = slot1
end

function HomePetCollectionPhotoItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot1.config then
		return
	end

	slot3 = PathTool.getPlistImgForDownLoad("homepet_item", slot2.icon, true)

	if slot0.record_proto_img_res == nil or slot0.record_proto_img_res ~= slot3 then
		slot0.record_proto_img_res = slot3
		slot0.item_load_proto_img_res = loadSpriteTextureFromCDN(slot0.icon, slot3, ResourcesType.single, slot0.item_load_proto_img_res)
	end

	slot5 = PathTool.getResFrame("homepet_eventinfo", "homepet_eventinfo_" .. uv0:getHomepetResNameByQuality(slot2.quality))

	if slot0.record_ssr_res == nil or slot0.record_ssr_res ~= slot5 then
		slot0.record_ssr_res = slot5

		loadSpriteTexture(slot0.ssr_img, slot5, LOADTEXT_TYPE_PLIST)
	end
end

function HomePetCollectionPhotoItem.DeleteMe(slot0)
	if slot0.item_load_proto_img_res then
		slot0.item_load_proto_img_res:DeleteMe()

		item_load_proto_img_res = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HomePetCollectionLetterItem = class("HomePetCollectionLetterItem", function ()
	return ccui.Widget:create()
end)

function HomePetCollectionLetterItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomePetCollectionLetterItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("homepet/home_pet_collection_letter_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:setPosition(0, 0)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:addChild(slot0.root_wnd)
	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.label = slot0.main_container:getChildByName("label")
	slot0.select_img = slot0.main_container:getChildByName("select_img")

	slot0:setSelectImgVisible(false)
end

function HomePetCollectionLetterItem.setSelectImgVisible(slot0, slot1)
	slot0.select_img:setVisible(slot1)
end

function HomePetCollectionLetterItem.register_event(slot0)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:onSelectBtn()
	end, false, 1)
end

function HomePetCollectionLetterItem.onSelectBtn(slot0)
	if not slot0.data then
		return
	end

	if slot0.callback then
		slot0.callback()
	end
end

function HomePetCollectionLetterItem.addCallback(slot0, slot1)
	slot0.callback = slot1
end

function HomePetCollectionLetterItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot1.config then
		slot0.label:setString(slot1.config.use_desc)
	end
end

function HomePetCollectionLetterItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
