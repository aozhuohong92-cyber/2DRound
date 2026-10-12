PokedexWindow = PokedexWindow or BaseClass(BaseView)
slot0 = table.sort
slot1 = table.insert

function PokedexWindow.__init(slot0)
	slot0.ctrl = PokedexController:getInstance()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "pokedex/pokedex_window"
	slot0.title_str = TI18N("图书馆")
	slot0.is_init = true
	slot0.cur_type = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("pokedex", "pokedex"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_35", true),
			type = ResourcesType.single
		}
	}
	slot0.hall_list = {}
	slot0.tab_list = {}
	slot0.item_list = {}
	slot0.rend_list = {}
	slot0.group_list = {}
	slot0.group_title = {}
	slot0.have_list = {}
	slot0.item_list_pool = {}
	slot0.have_list = {}
	slot0.now_attr = {}
	slot0.next_attr = {}
	slot0.select_type = 1
	slot0.scroll_width = 0
	slot0.scroll_height = 0
	slot0.max_height = 0
end

function PokedexWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_35", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.pokedex_panel = slot0.main_container:getChildByName("pokedex_panel")
	slot0.drama_panel = slot0.main_container:getChildByName("drama_panel")
	slot0.tab_panel = slot0.pokedex_panel:getChildByName("tab_panel")
	slot0.scroll_panel = slot0.pokedex_panel:getChildByName("scroll_panel")
	slot0.bottom_panel = slot0.pokedex_panel:getChildByName("bottom_panel")
	slot0.next_panel = slot0.bottom_panel:getChildByName("next_panel")
	slot6 = 455
	slot0.full_icon = createImage(slot0.bottom_panel, PathTool.getResFrame("pokedex", "txt_cn_pokedex_5"), slot6, 20, cc.p(0, 0), true, 0, false)

	slot0.full_icon:setVisible(false)

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")

	slot0:initTabButton()

	for slot6 = 1, 5 do
		if slot0.tab_panel:getChildByName("tab_btn_" .. slot6) then
			slot8 = {
				btn = slot7,
				select_bg = slot7:getChildByName("select_bg")
			}

			slot8.select_bg:setVisible(false)

			slot8.title = slot7:getChildByName("title")

			slot8.title:setString(({
				TI18N("全部"),
				TI18N("物攻"),
				TI18N("法攻"),
				TI18N("肉盾"),
				TI18N("辅助")
			})[slot6])
			slot8.title:setTextColor(cc.c4b(215, 226, 227, 255))

			slot8.index = slot6
			slot0.tab_list[slot6] = slot8
		end
	end

	slot0.scroll_width = 720
	slot0.scroll_height = 660
	slot0.scroll_view = createScrollView(slot0.scroll_width, slot0.scroll_height, 0, 0, slot0.scroll_panel, ccui.ScrollViewDir.vertical)

	slot0:createBaseMessage()
end

function PokedexWindow.changeTabBarIndex(slot0, slot1, slot2)
	if slot1 == 1 then
		if not slot0.initPokedex then
			slot0.initPokedex = true

			slot0.ctrl:sender11040()
		end
	elseif slot1 == 2 then
		if not slot0.initDrama then
			slot0.initDrama = true
			slot0.drama_view = PokedexDramaLookPanel.new(handler(slot0, slot0._onDramaPanelCallBack))

			slot0.drama_panel:addChild(slot0.drama_view)
		end

		if slot2 then
			slot0.drama_view:showPlayingDunDrama(slot2)
		else
			slot0.drama_view:changeViewTypeShow(1)

			slot0.drama_close_flag = false
		end
	end

	slot0.pokedex_panel:setVisible(slot1 == 1)
	slot0.drama_panel:setVisible(slot1 == 2)

	slot0.select_tab_index = slot1
end

function PokedexWindow._onDramaPanelCallBack(slot0, slot1)
	slot0.drama_close_flag = slot1
end

function PokedexWindow.initTabButton(slot0)
	slot0.tabBar = TabSelectBar.New(slot0.main_container, TabSelectBarDirection.horizontal, 5, nil, nil, nil, 0, nil, false)

	slot0.tabBar:setTitleSize(22)
	slot0.tabBar:setAnchorPoint(0, 1)
	slot0.tabBar:setPosition(0, 1008)
	slot0:openTabLev()
	slot0.tabBar:setChangeItemByIndex(function (slot0)
		uv0:changeTabBarIndex(slot0)
	end)
end

function PokedexWindow.openTabLev(slot0)
	slot4 = {}
	slot6 = ""

	for slot10 = 1, 2 do
		table.insert(slot4, {
			height = 65,
			width = 165,
			select_color = Config.ColorData.data_color4[179],
			unselect_color = Config.ColorData.data_color4[141],
			select_path = PathTool.getResFrame("common", "common_1011"),
			unselect_path = PathTool.getResFrame("common", "common_1012"),
			label = ({
				TI18N("英雄图鉴"),
				TI18N("剧情回顾")
			})[slot10],
			name = slot10,
			arrow_path = PathTool.getResFrame("common", "common_1040"),
			extend_name = "guidesing_boss_" .. slot10
		})
	end

	slot0.tabBar.per_select_index = nil

	slot0.tabBar:setTabArray(slot4)
end

function PokedexWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot2 = slot2 or 1
	slot0.select_type = 1

	if slot1 then
		slot0.click_group = slot1
	end

	if slot0.tabBar then
		slot0.tabBar:setSelectByIndex(slot2)
		slot0:changeTabBarIndex(slot2, slot3)
	end
end

function PokedexWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.select_tab_index == 2 and uv0.drama_close_flag == true then
				uv0.drama_close_flag = false

				if uv0.drama_view then
					uv0.drama_view:changeViewTypeShow(1)
				end
			else
				uv0.ctrl:openPokedexWindow(false)
			end
		end
	end)

	if slot0.up_btn then
		slot0.up_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0.ctrl:send11047()
			end
		end)
	end

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5.btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:changeTabIndex(uv1.index)
			end
		end)
	end

	if not slot0.get_all_event then
		slot0.get_all_event = GlobalEvent:getInstance():Bind(PokedexEvent.Get_All_Event, function (slot0)
			if not slot0 then
				return
			end

			for slot5, slot6 in pairs(slot0.partners) do
				-- Nothing
			end

			uv0.have_list = {
				[slot6.partner_id] = slot6
			} or {}

			uv0:changeTabIndex(uv0.select_type)

			if uv0.is_call == true then
				uv0:updateHeroList()

				uv0.is_call = false
			end

			uv0:updateAttrList(slot0.all_star, slot0.lev)
		end)
	end

	if not slot0.up_end_event then
		slot0.up_end_event = GlobalEvent:getInstance():Bind(PokedexEvent.Up_End_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:updateAttrList(slot0.old_star, slot0.cur_lev)
		end)
	end

	if not slot0.call_event then
		slot0.call_event = GlobalEvent:getInstance():Bind(PartnerEvent.Partner_Call_Event, function ()
			uv0.is_call = true

			uv0.ctrl:sender11040()
		end)
	end
end

function PokedexWindow.createBaseMessage(slot0)
	slot1 = slot0.bottom_panel:getContentSize()

	createLabel(26, Config.ColorData.data_color4[175], nil, slot1.width / 2, 165, "", slot0.bottom_panel, 0, cc.p(0.5, 0)):setString(TI18N("累计升星奖励"))
	createLabel(22, Config.ColorData.data_color4[175], nil, slot1.width / 2 - 200, 134, "", slot0.bottom_panel, 0, cc.p(0.5, 0)):setString(TI18N("当前"))

	slot0.next_label = createLabel(22, Config.ColorData.data_color4[175], nil, slot1.width / 2 + 200, 134, "", slot0.next_panel, 0, cc.p(0.5, 0))

	slot0.next_label:setString(TI18N("下一级"))
	slot0.pokedex_panel:getChildByName("all_label"):setString(TI18N("累计升星数："))

	slot0.all_star_label = createRichLabel(24, Config.ColorData.data_color4[190], cc.p(0, 0), cc.p(410, -23), 0, 0, 500)

	slot0.pokedex_panel:addChild(slot0.all_star_label)

	slot0.up_btn = createButton(slot0.pokedex_panel, TI18N(""), 590, -12, cc.size(161, 62), PathTool.getResFrame("common", "common_1018"), 24)

	slot0.up_btn:setVisible(true)
	slot0.up_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#478425>提升</div>"))
end

function PokedexWindow.updateAttrList(slot0, slot1, slot2)
	slot1 = slot1 or 0
	slot4 = 0
	slot5 = 0
	slot6 = -1
	slot9 = Config.PartnerData.data_pokedex_attr[math.min(slot2 + 1, tableLen(Config.PartnerData.data_pokedex_attr))]
	slot10 = {}

	if Config.PartnerData.data_pokedex_attr[slot2] and slot8.attr then
		for slot14, slot15 in pairs(slot8.attr) do
			if slot15 and slot15[1] and slot15[2] then
				slot10[slot15[1]] = slot15[2]
			end
		end
	end

	for slot15 = 1, 3 do
		slot17 = slot10[({
			"hp_max",
			"atk",
			"def"
		})[slot15]] or 0

		if not slot0.now_attr[slot15] then
			slot0.now_attr[slot15] = slot0:createOneAttr(cc.p(65, 120 - 33 * slot15), PathTool.getAttrIconByStr(slot16), Config.AttrData.data_key_to_name[slot16] or "", slot17, slot0.bottom_panel)
		end

		slot0.now_attr[slot15].value_label:setString("+" .. slot17)
	end

	slot12 = false
	slot13 = 0

	if slot9 then
		slot13 = slot9.star or 0
	end

	slot14 = ""
	slot14 = slot13 ~= 0 and slot1 .. "/" .. slot13 or slot1

	if slot9.next_star == 0 then
		slot12 = true
	end

	slot0.full_icon:setVisible(slot12)
	slot0.next_panel:setVisible(true)

	if slot13 <= slot1 and not slot12 then
		slot0.up_btn:setRichText(TI18N("<div fontColor=#ffffff fontsize=24 outline=2,#478425>提升</div>"))
		slot0.up_btn:setGrayAndUnClick(false)
		slot0.up_btn:showRedPoint(true)
	else
		if slot12 == true then
			slot0.up_btn:setRichText(TI18N("<div fontColor=#ffffff >已满级</div>"))
		else
			slot0.up_btn:setRichText(TI18N("<div fontColor=#ffffff >提升</div>"))
		end

		slot0.up_btn:setGrayAndUnClick(true)
		slot0.up_btn:showRedPoint(false)
	end

	slot0.all_star_label:setString(slot14)

	if slot12 == true then
		slot0.next_panel:setVisible(false)

		return
	end

	if not slot9 then
		return
	end

	slot15 = {
		[slot20[1]] = slot20[2]
	}

	for slot19, slot20 in pairs(slot9.attr) do
		if slot20 and slot20[1] and slot20[2] then
			-- Nothing
		end
	end

	for slot20 = 1, 3 do
		slot22 = slot15[slot11[slot20]] or 0

		if not slot0.next_attr[slot20] then
			slot0.next_attr[slot20] = slot0:createOneAttr(cc.p(480, 120 - 33 * slot20), PathTool.getAttrIconByStr(slot21), Config.AttrData.data_key_to_name[slot21] or "", slot22, slot0.next_panel)
			slot28 = createImage(slot0.next_panel, PathTool.getResFrame("common", "common_90017"), slot0.next_panel:getContentSize().width / 2, 120 - 33 * slot20, cc.p(0.5, 0), true, 0, false)
		end

		slot0.next_attr[slot20].value_label:setString("+" .. slot22)
		slot0.next_attr[slot20].value_label:setTextColor(Config.ColorData.data_color4[178])
	end
end

function PokedexWindow.createOneAttr(slot0, slot1, slot2, slot3, slot4, slot5)
	slot8 = createLabel(24, Config.ColorData.data_color4[175], nil, 0, 0, slot3, slot5, 2, cc.p(0, 0))

	slot8:setPosition(cc.p(slot1.x + 30, slot1.y))

	slot9 = createLabel(24, Config.ColorData.data_color4[175], nil, 0, 0, "+" .. slot4, slot5, 2, cc.p(0, 0))

	slot9:setPosition(cc.p(slot1.x + 90, slot1.y))

	return {
		name_label = slot8,
		value_label = slot9,
		icon = createImage(slot5, PathTool.getResFrame("common", slot2), slot1.x - 5, slot1.y, cc.p(0, 0), true, 0, false)
	}
end

function PokedexWindow.setPanelData(slot0)
end

function PokedexWindow.changeTabIndex(slot0, slot1)
	if slot0.select_btn and slot0.select_btn.index == slot1 then
		return
	end

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(false)
		slot0.select_btn.title:setTextColor(cc.c4b(215, 226, 227, 255))
	end

	slot0.select_btn = slot0.tab_list[slot1]

	if slot0.select_btn then
		slot0.select_btn.select_bg:setVisible(true)
		slot0.select_btn.title:setTextColor(cc.c4b(255, 255, 255, 255))
	end

	slot0.select_type = slot1

	slot0:updateHeroList()
end

function PokedexWindow.updateHeroList(slot0)
	slot0:clearList()

	slot2 = {}
	slot3 = 1
	slot0.group_list = {}
	slot5 = 0
	slot6 = BackpackController:getInstance():getModel()

	for slot10, slot11 in pairs(Config.PartnerData.data_pokedex) do
		if Config.PartnerData.data_partner_base[slot11.bid] and (slot0.select_type == 1 or ({
			1,
			3,
			2,
			4,
			5,
			0
		})[slot0.select_type] == slot12.type) then
			slot13 = false
			slot12.is_have = 1

			if slot0.have_list and slot0.have_list[slot11.bid] then
				slot13 = true
				slot12.is_have = 2
			elseif (slot6:getBackPackItemNumByBid(slot12.chips_id or 0) or 0) >= (slot12.chips_num or 0) then
				slot12.is_have = 3
			end

			slot2[slot3] = {
				data = slot12,
				pokedex_data = slot11,
				is_have = slot13
			}
			slot3 = slot3 + 1

			if not slot0.group_list[slot11.group_id] then
				slot0.group_list[slot11.group_id] = {}
				slot5 = slot5 + 1
			end

			uv0(slot0.group_list[slot11.group_id], slot12)
		end
	end

	slot0.row_list = {}

	for slot12, slot13 in pairs(slot0.group_list) do
		uv1(slot13, SortTools.tableUpperSorter({
			"is_have",
			"rare_type"
		}))

		slot14 = math.ceil(#slot13 / 3)
		slot0.row_list[slot12] = slot14
		slot7 = 0 + slot14
	end

	slot0.all_row_num = slot7

	function slot9(slot0, slot1)
		if slot1 and next(slot1) ~= nil then
			uv0.ctrl:openCheckHeroWindow(true, slot1)
		end
	end

	slot0.rend_list = slot2
	slot0.max_height = math.max(slot7 * 400 + 40, slot0.scroll_height)
	slot13 = cc.size

	slot0.scroll_view:setInnerContainerSize(slot13(slot0.scroll_width, slot0.max_height))

	for slot13 = 1, slot7 do
		if not slot0.hall_list[slot13] then
			slot15 = createImage(slot0.scroll_view, PathTool.getResFrame("pokedex", "pokedex_16"), 0, 0, cc.p(0.5, 0), true, 0, true)

			slot15:setContentSize(cc.size(720, 440))

			slot0.hall_list[slot13] = slot15
		end

		slot0.hall_list[slot13]:setVisible(true)
		slot0.hall_list[slot13]:setPosition(cc.p(slot0.scroll_width / 2, slot0.max_height - 400 * slot13 - 40))
	end

	slot0:createHeroList(true)
end

function PokedexWindow.clearList(slot0)
	for slot4, slot5 in pairs(slot0.item_list) do
		if not tolua.isnull(slot5) then
			slot5:setVisible(false)
		end

		table.insert(slot0.item_list_pool, slot5)
	end

	slot0.item_list = {}

	for slot4, slot5 in pairs(slot0.hall_list) do
		slot5:setVisible(false)
	end

	for slot4, slot5 in pairs(slot0.group_title) do
		if slot5 and slot5.title_bg then
			slot5.title_bg:setVisible(false)
		end
	end
end

function PokedexWindow.createHeroList(slot0, slot1)
	if slot0.timer then
		GlobalTimeTicket:getInstance():remove(slot0.timer)

		slot0.timer = nil
	end

	if slot1 == true then
		slot2 = 1
		slot3 = 1
		slot4 = 1
		slot5 = #slot0.rend_list
		slot6 = 0

		if not slot0.timer then
			slot0.timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0.group_list[uv1] then
					if not uv0.group_list[uv1][uv2] then
						uv2 = 1
						uv3 = uv3 + (uv0.row_list[uv1] or 0)
						uv1 = uv1 + 1
					else
						if not uv0.group_title[uv1] then
							slot3 = createImage(uv0.scroll_view, PathTool.getResFrame("pokedex", "pokedex_14"), 0, 0, cc.p(0.5, 0), true, 0, false)
							uv0.group_title[uv1] = {
								title_bg = slot3,
								title_str = createLabel(22, Config.ColorData.data_color4[1], nil, 14, 9, "", slot3, 0, cc.p(0, 0))
							}
						end

						if Config.PartnerData.data_pokedex[slot0.bid] then
							if uv0.group_title[uv1] and uv0.group_title[uv1].title_str and uv0.group_title[uv1].title_bg then
								uv0.group_title[uv1].title_str:setString(slot1.group_name or "")
								uv0.group_title[uv1].title_bg:setVisible(true)
								uv0.group_title[uv1].title_bg:setPosition(cc.p(100, uv0.max_height - uv3 * 400 - 82))
							end
						end

						uv0:createItem(slot0, uv4, uv3, uv2)

						uv4 = uv4 + 1
						uv2 = uv2 + 1
					end
				else
					uv1 = uv1 + 1
				end

				if uv5 < uv4 and uv0.timer then
					GlobalTimeTicket:getInstance():remove(uv0.timer)

					uv0.timer = nil
				end
			end, 1 / display.DEFAULT_FPS)
		end
	end
end

function PokedexWindow.createItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = nil

	if next(slot0.item_list_pool) then
		table.remove(slot0.item_list_pool, 1):setVisible(true)
	else
		slot0.scroll_view:addChild(PokedexItem.new())
	end

	slot5:changeHaveStatus(false)

	if slot0.have_list and slot0.have_list[slot1.bid] then
		slot5:changeHaveStatus(true)
	end

	slot5:addCallBack(function (slot0, slot1)
		if slot1 and next(slot1) ~= nil then
			uv0.ctrl:openCheckHeroWindow(true, slot1)
		end
	end)
	slot5:addLoadCallBack(function (slot0)
		if uv0.is_init == true then
			if uv0.click_group and Config.PartnerData.data_pokedex[uv1.bid] and next(slot1) ~= nil and slot1.group_id == uv0.click_group then
				uv0.scroll_view:scrollToPercentVertical(math.ceil(110 * uv2 / uv0.all_row_num), 1, true)

				uv0.is_init = false

				return
			end

			if slot0:getIsCall() == true then
				uv0.is_init = false

				uv0.scroll_view:scrollToPercentVertical(math.ceil(110 * uv2 / uv0.all_row_num), 1, true)
			end
		end
	end)
	slot5:setData(slot1)
	slot5:setPosition(cc.p((slot4 - 1) % 3 * 220 + 140, slot0.max_height - slot3 * 400 - math.ceil(slot4 / 3) * 400 + 160))

	slot0.item_list[slot2] = slot5
end

function PokedexWindow.onEnterAnim(slot0)
end

function PokedexWindow.close_callback(slot0)
	slot0.ctrl:openPokedexWindow(false)

	slot4 = false

	slot0:createHeroList(slot4)
	slot0:clearList()

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	for slot4, slot5 in ipairs(slot0.item_list_pool) do
		slot5:DeleteMe()
	end

	slot0.item_list_pool = nil

	if slot0.drama_view then
		slot0.drama_view:DeleteMe()
	end

	if slot0.get_all_event then
		GlobalEvent:getInstance():UnBind(slot0.get_all_event)

		slot0.get_all_event = nil
	end

	if slot0.up_end_event then
		GlobalEvent:getInstance():UnBind(slot0.up_end_event)

		slot0.up_end_event = nil
	end

	if slot0.call_event then
		GlobalEvent:getInstance():UnBind(slot0.call_event)

		slot0.call_event = nil
	end
end
