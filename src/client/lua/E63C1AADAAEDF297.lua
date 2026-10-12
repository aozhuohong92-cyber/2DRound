HeroClothesLustratWindow = HeroClothesLustratWindow or BaseClass(BaseView)
slot0 = HeroController:getInstance()
slot1 = Config.ItemData.data_holy_eqm_list
slot2 = Config.PartnerHolyEqmData.data_const.handbook_unlock_condition
slot3 = table.sort
slot4 = table.insert

function HeroClothesLustratWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "hero/hero_clothes_lustrat_window"
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

function HeroClothesLustratWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)
	slot0.main_container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("神装图鉴"))

	slot1 = slot0.main_container:getChildByName("goods")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 5,
		item_width = 312,
		start_x = 5,
		space_x = 5,
		row = 1,
		item_height = 147,
		space_y = 0,
		col = 2,
		need_dynamic = true,
		item_class = HeroClothesLustratItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0:createTabList()
end

function HeroClothesLustratWindow.createTabList(slot0)
	slot1 = slot0.main_container:getChildByName("tab_view")

	slot1:setScrollBarEnabled(false)

	slot2 = #slot0.tab_suit_perfix

	slot1:getChildByName("tab_bg"):setContentSize(cc.size(HeroClothesLustratTab.Width * slot2 + 10, 54))

	slot7 = cc.size

	slot1:setInnerContainerSize(slot7(HeroClothesLustratTab.Width * slot2 + 10, 63))

	for slot7 = 1, slot2 do
		slot0.tab_view_list[slot7] = HeroClothesLustratTab.new()

		slot0.tab_view_list[slot7]:setPosition((slot7 - 1) * HeroClothesLustratTab.Width + 55, 31)
		slot0.tab_view_list[slot7]:setName(cc.c4b(207, 181, 147, 255))
		slot0.tab_view_list[slot7]:setlineName(cc.c4b(0, 0, 0, 255), 1)
		slot1:addChild(slot0.tab_view_list[slot7])
		slot0.tab_view_list[slot7]:setData(slot7, slot2, slot0.tab_suit_perfix[slot7])
		slot0.tab_view_list[slot7]:addCallBack(function (slot0)
			uv0:tabChangeView(slot0)
		end)
	end

	slot0:tabChangeView(1)
end

function HeroClothesLustratWindow.tabChangeView(slot0, slot1)
	if slot0.cur_index == (slot1 or 1) then
		return
	end

	if not slot0.tab_view_list[slot1] then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setNormal(false)
		slot0.cur_tab:setSelect(true)
		slot0.cur_tab:setName(cc.c4b(207, 181, 147, 255))
		slot0.cur_tab:setlineName(cc.c4b(0, 0, 0, 255), 1)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_view_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab:setNormal(true)
		slot0.cur_tab:setSelect(false)
		slot0.cur_tab:setName(cc.c4b(255, 237, 214, 255))
		slot0.cur_tab:setlineName(cc.c4b(0, 0, 0, 255), 1)
	end

	if slot0.tab_suit_perfix and slot0.tab_suit_perfix[slot1] and slot0.tab_suit_perfix[slot1].id then
		slot2 = {}
		slot3 = {}

		for slot7, slot8 in pairs(uv0) do
			if math.floor(slot7 / 100) == slot0.tab_suit_perfix[slot1].id then
				for slot12, slot13 in pairs(slot8) do
					if Config.PartnerHolyEqmData.data_base_info(slot13.id) and slot14.is_show == 1 and uv1 and uv1.val then
						for slot18, slot19 in pairs(uv1.val) do
							if Config.ItemData.data_get_data(slot13.id) and slot19[1] == slot20.eqm_star then
								if HeavenController:getInstance():getModel():checkIsOpenByScore(slot19[2]) == true then
									slot21 = GoodsVo.New(slot20.id)
									slot21.lustr_status = true
									slot21.sort = slot20.eqm_star

									uv2(slot3, slot21)
								end

								break
							end
						end
					end
				end
			end
		end

		uv3(slot3, SortTools.tableUpperSorter({
			"sort",
			"base_id"
		}))
		slot0.item_scrollview:setData(slot3)
	end
end

function HeroClothesLustratWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHeroClothesLustratWindow(false)
	end, false, 2)
end

function HeroClothesLustratWindow.openRootWnd(slot0)
end

function HeroClothesLustratWindow.close_callback(slot0)
	if slot0.tab_view_list then
		for slot4, slot5 in pairs(slot0.tab_view_list) do
			slot5:DeleteMe()
		end

		slot0.tab_view_list = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openHeroClothesLustratWindow(false)
end

HeroClothesLustratTab = class("HeroClothesLustratTab", function ()
	return ccui.Widget:create()
end)
HeroClothesLustratTab.Width = 100
HeroClothesLustratTab.Height = 50

function HeroClothesLustratTab.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HeroClothesLustratTab.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_clothes_lustrat_tab"))

	slot0.root_wnd:setContentSize(cc.size(HeroClothesLustratTab.Width, HeroClothesLustratTab.Height))
	slot0:addChild(slot0.root_wnd)
	slot0:setTouchEnabled(true)
	slot0:setContentSize(cc.size(HeroClothesLustratTab.Width, HeroClothesLustratTab.Height))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.select = slot1:getChildByName("select")
	slot0.normal = slot1:getChildByName("normal")

	slot0.normal:setVisible(false)

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")
end

function HeroClothesLustratTab.setSelect(slot0, slot1)
	if slot0.select then
		slot0.select:setVisible(slot1)
	end
end

function HeroClothesLustratTab.setNormal(slot0, slot1)
	if slot0.normal then
		slot0.normal:setVisible(slot1)
	end
end

function HeroClothesLustratTab.setName(slot0, slot1)
	if slot0.name then
		slot0.name:setTextColor(slot1)
	end
end

function HeroClothesLustratTab.setlineName(slot0, slot1, slot2)
	if slot0.name then
		slot0.name:enableOutline(slot1, slot2)
	end
end

function HeroClothesLustratTab.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function HeroClothesLustratTab.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playTabButtonSound()

				if uv0.callback and uv0.data_index then
					uv0.callback(uv0.data_index)
				end
			end
		end
	end)
end

function HeroClothesLustratTab.setData(slot0, slot1, slot2, slot3)
	slot0.data_index = slot1

	slot0.select:setFlippedX(false)
	slot0.normal:setFlippedX(false)

	if slot1 == 1 then
		slot0.select:loadTexture(PathTool.getResFrame("common", "common_2023"), LOADTEXT_TYPE_PLIST)
		slot0.select:setFlippedX(true)
		slot0.normal:loadTexture(PathTool.getResFrame("common", "common_2021"), LOADTEXT_TYPE_PLIST)
		slot0.normal:setFlippedX(true)
	elseif slot1 == slot2 then
		slot0.select:loadTexture(PathTool.getResFrame("common", "common_2023"), LOADTEXT_TYPE_PLIST)
		slot0.normal:loadTexture(PathTool.getResFrame("common", "common_2021"), LOADTEXT_TYPE_PLIST)
	end

	if slot3 and slot3.name then
		slot0.name:setString(string.sub(slot3.name, 1, 6))
	end
end

function HeroClothesLustratTab.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

HeroClothesLustratItem = class("HeroClothesLustratItem", function ()
	return ccui.Widget:create()
end)

function HeroClothesLustratItem.ctor(slot0)
	slot0.goods_item = nil

	slot0:configUI()
	slot0:register_event()
end

function HeroClothesLustratItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_clothes_lustrat_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(312, 147))

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.eqm_name = slot1:getChildByName("eqm_name")

	slot0.eqm_name:setString("")

	slot0.eqm_spr = slot1:getChildByName("eqm_spr")
	slot0.eqm_suit = slot1:getChildByName("eqm_suit")

	slot0.eqm_suit:setString("")

	if not slot0.goods_item then
		slot0.goods_item = BackPackItem.new(nil, true)

		slot1:addChild(slot0.goods_item)
		slot0.goods_item:setPosition(cc.p(73, 75))
		slot0.goods_item:addCallBack(function ()
			if uv0.data then
				uv1:openEquipTips(true, uv0.data, PartnerConst.EqmTips.other)
			end
		end)
	end
end

function HeroClothesLustratItem.register_event(slot0)
end

function HeroClothesLustratItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.goods_item and slot1.base_id then
		slot0.goods_item:setBaseData(slot1.base_id)

		if Config.ItemData.data_get_data(slot1.base_id) then
			slot0.eqm_name:setString(slot2.name)

			if Config.PartnerHolyEqmData.data_suit_res_prefix[math.floor(slot2.eqm_set / 100)] then
				slot0.eqm_suit:setString(slot5.name or "")
				loadSpriteTexture(slot0.eqm_spr, PathTool.getSuitRes(slot5.prefix), LOADTEXT_TYPE)
			end
		end
	end
end

function HeroClothesLustratItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()

		slot0.goods_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
