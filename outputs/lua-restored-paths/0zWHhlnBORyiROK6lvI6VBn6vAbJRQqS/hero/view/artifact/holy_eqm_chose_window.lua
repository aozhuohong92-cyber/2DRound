HolyEqmChoseWindow = HolyEqmChoseWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()
slot1 = Config.ItemData.data_holy_eqm_list
slot2 = Config.PartnerHolyEqmData.data_const.handbook_unlock_condition
slot3 = table.sort
slot4 = table.insert

function HolyEqmChoseWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/holy_eqm_chose_window"
	slot0.res_list = {}
	slot0.choose_num = 0
	slot0.cur_compound_id = 0
	slot0.tab_view_list = {}
	slot0.cur_index = nil
	slot0.tab_suit_perfix = {}

	for slot5, slot6 in pairs(Config.PartnerHolyEqmData.data_suit_res_prefix) do
		uv0(slot0.tab_suit_perfix, slot6)
	end

	uv1(slot0.tab_suit_perfix, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
end

function HolyEqmChoseWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot1:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("饰品选择")):setTextColor(cc.c3b(176, 65, 52))

	slot0.chose_label = slot1:getChildByName("chose_label")

	slot0.chose_label:setString(string.format(TI18N("(已选择:%d)"), slot0.choose_num))

	slot0.ok_btn = slot1:getChildByName("ok_btn")

	slot0.ok_btn:getChildByName("label"):setString(TI18N("确定"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.empty_image = slot1:getChildByName("empty_image")
	slot0.goods_con = slot1:getChildByName("goods_con")
	slot5 = slot0.goods_con:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height - 10), {
		start_y = 0,
		start_x = 15,
		space_x = 20,
		row = 0,
		space_y = 10,
		col = 4,
		need_dynamic = true,
		item_class = BackPackItem,
		item_width = BackPackItem.Width,
		item_height = BackPackItem.Height
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0:createTabList()
end

function HolyEqmChoseWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.ok_btn, handler(slot0, slot0._onClickBtnOk))
end

function HolyEqmChoseWindow._onClickBtnClose(slot0)
	uv0:openHolyEqmChoseWindow(false)
end

function HolyEqmChoseWindow._onClickBtnOk(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.item_data) do
		if slot6.showSellStatus ~= nil and slot6.showSellStatus.select == true then
			table.insert(slot1, slot6.id)
		end
	end

	GlobalEvent:getInstance():Fire(HeroEvent.SHEN_JIANG_FANG_HOLY_EQUIP_COMPOSE_SELECT_LIST, slot1)
	uv0:openHolyEqmChoseWindow(false)
end

function HolyEqmChoseWindow.openRootWnd(slot0, slot1)
	slot0.max_num = slot1.max_num or 0
	slot0.choose_list = slot1.choose_list or {}
	slot2 = 1

	if #slot0.choose_list == 0 then
		slot0.cur_compound_id = 0
	else
		slot3 = slot0.choose_list[1]
		slot2 = math.floor(slot3.eqm_set / 100)

		if Config.PartnerHolyEqmData.data_artifact_data[slot3.base_id] and slot4.com_artifact then
			slot0.cur_compound_id = slot4.com_artifact
		end
	end

	slot0:tabChangeView(slot2)
end

function HolyEqmChoseWindow.createTabList(slot0)
	slot1 = slot0.main_container:getChildByName("tab_view")

	slot1:setScrollBarEnabled(false)

	slot2 = #slot0.tab_suit_perfix
	slot6 = cc.size

	slot1:setInnerContainerSize(slot6(HolyEqmAtlasTab.Width * slot2 + 10, 63))

	for slot6 = 1, slot2 do
		slot0.tab_view_list[slot6] = HolyEqmAtlasTab.new()

		slot0.tab_view_list[slot6]:setPosition((slot6 - 1) * HolyEqmAtlasTab.Width + 55, 31)
		slot1:addChild(slot0.tab_view_list[slot6])
		slot0.tab_view_list[slot6]:setData(slot6, slot2, slot0.tab_suit_perfix[slot6])
		slot0.tab_view_list[slot6]:addCallBack(function (slot0)
			uv0.cur_compound_id = 0
			uv0.choose_list = {}

			uv0:tabChangeView(slot0)
		end)
	end
end

function HolyEqmChoseWindow.tabChangeView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if not slot0.tab_view_list[slot1] then
		return
	end

	slot0.choose_num = #slot0.choose_list

	slot0.chose_label:setString(string.format(TI18N("(已选择:%d/%d)"), slot0.choose_num, slot0.max_num))

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setNormal(false)
		slot0.cur_tab:setSelect(true)
		slot0.cur_tab:setName(cc.c4b(207, 181, 147, 255))
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_view_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setNormal(true)
		slot0.cur_tab:setSelect(false)
		slot0.cur_tab:setName(cc.c4b(255, 237, 214, 255))
	end

	if slot0.tab_suit_perfix and slot0.tab_suit_perfix[slot1] and slot0.tab_suit_perfix[slot1].id then
		slot2 = {}
		slot5 = 1

		for slot9, slot10 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.HOLYEQUIPMENT)) do
			if math.floor(slot10.eqm_set / 100) == slot0.tab_suit_perfix[slot1].id then
				slot11 = false

				for slot15, slot16 in pairs(slot0.choose_list) do
					if slot16 == slot10.id then
						slot11 = true

						break
					end
				end

				slot10:setGoodsAttr("showSellStatus", {
					status = true,
					select = slot11
				})

				slot2[slot5] = slot10
				slot5 = slot5 + 1
			end
		end

		uv0(slot2, SortTools.tableCommonSorter({
			{
				"eqm_star",
				true
			},
			{
				"eqm_jie",
				true
			},
			{
				"eqm_set",
				false
			},
			{
				"sort",
				true
			},
			{
				"base_id",
				true
			}
		}))
		slot0.item_scrollview:setData(slot2, nil, nil, {
			showCheckBox = true,
			checkBoxClickCallBack = handler(slot0, slot0._onCheckBoxCallBack),
			adjustCheckBoxPos = cc.p(BackPackItem.Width - 25, 25)
		})

		slot0.item_data = slot2

		if next(slot2) ~= nil then
			slot0.item_scrollview:addEndCallBack(function ()
				for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
					slot5:addCallBack(function ()
						uv1:openEquipTips(true, uv0:getData(), PartnerConst.EqmTips.other)
					end)

					if slot5:getData().showSellStatus.select == true then
						uv0.cur_item_node = slot5
					end
				end
			end)
		end
	end
end

function HolyEqmChoseWindow._onCheckBoxCallBack(slot0, slot1, slot2)
	slot3 = slot2:getData()

	if slot1 == true then
		if not slot0:checkItemIsCanChose(slot3.base_id) then
			slot3:setGoodsAttr("showSellStatus", {
				select = false,
				status = true
			})
			slot2:setData(slot3)
			message(TI18N("请选择同部位、同星级、同阶数的饰品"))

			return
		elseif slot0.max_num <= slot0.choose_num then
			slot3:setGoodsAttr("showSellStatus", {
				select = false,
				status = true
			})
			slot2:setData(slot3)
			message(TI18N("已达最大选择数量"))

			return
		end
	end

	if slot1 == true then
		slot0.choose_num = slot0.choose_num + 1
	else
		slot0.choose_num = slot0.choose_num - 1

		if slot0.choose_num <= 0 then
			slot0.cur_compound_id = 0
		end
	end

	slot0.chose_label:setString(string.format(TI18N("(已选择:%d/%d)"), slot0.choose_num, slot0.max_num))
end

function HolyEqmChoseWindow.checkItemIsCanChose(slot0, slot1)
	slot2 = false

	if Config.PartnerHolyEqmData.data_artifact_data[slot1] and slot3.com_artifact then
		if slot0.cur_compound_id == 0 then
			slot0.cur_compound_id = slot3.com_artifact
			slot2 = true
		elseif slot0.cur_compound_id == slot4 then
			slot2 = true
		else
			slot2 = false
		end
	else
		slot2 = false
	end

	return slot2
end

function HolyEqmChoseWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	for slot5, slot6 in pairs(BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.HOLYEQUIPMENT)) do
		slot6:setGoodsAttr("showSellStatus", {
			select = false,
			status = false
		})
	end

	if slot0.item_data and next(slot0.item_data) ~= nil then
		for slot5, slot6 in pairs(slot0.item_data) do
			slot6:setGoodsAttr("showSellStatus", {
				select = false,
				status = false
			})
		end
	end

	uv0:openHolyEqmChoseWindow(false)
end
