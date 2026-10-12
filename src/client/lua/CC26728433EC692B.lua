MallWindow = MallWindow or BaseClass(BaseView)
slot0 = MallController:getInstance()
slot1 = table.insert
slot2 = table.sort

function MallWindow.__init(slot0)
	slot1 = RoleController:getInstance()
	slot0.role_vo = slot1:getRoleVo()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/mall_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall_prop", "mall_prop"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "mall_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "mall_bg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "mall_bg_3"),
			type = ResourcesType.single
		}
	}
	slot0.open_key_list = {
		[MallConst.MallType.GodShop] = "open_gold_lev",
		[MallConst.MallType.Recovery] = "open_hero_soul_lev",
		[MallConst.MallType.ScoreShop] = "open_point_lev",
		[MallConst.MallType.SkillShop] = "open_skill_lev"
	}
	slot0.tab_array = {}
	slot0.dicShopTypeIndex = {}
	slot0.dicSecondMenuIndex = {}

	if Config.ExchangeData.data_shop_list then
		for slot5, slot6 in pairs(slot1) do
			if slot6.sort > 0 then
				slot7 = true

				if slot6.id == MallConst.MallType.HeroSkin then
					for slot11, slot12 in ipairs(slot6.limit) do
						if slot12[1] == "lev" and RoleController:getInstance():getRoleVo() and slot13.lev < slot12[2] then
							slot7 = false
						end
					end
				end

				if slot7 then
					slot8 = {
						config = slot6,
						shop_type = slot6.id,
						index = slot6.sort,
						status = true,
						subtype = slot6.subtype
					}
					slot8.can_touch = slot0:checkBtnIsOpen(slot8.shop_type)

					if Config.ExchangeData.data_shop_exchage_cost[slot0.open_key_list[slot8.shop_type]] then
						slot8.notice = string.format(TI18N("%s级开启"), slot9.val)
					else
						slot8.notice = TI18N("暂未解锁")
					end

					uv0(slot0.tab_array, slot8)
				end
			end
		end

		uv1(slot0.tab_array, function (slot0, slot1)
			return slot0.index < slot1.index
		end)
	end

	for slot5, slot6 in ipairs(slot0.tab_array) do
		if #slot6.subtype > 0 then
			for slot10, slot11 in ipairs(slot6.subtype) do
				slot0.dicSecondMenuIndex[slot11] = slot5
			end
		end

		slot0.dicShopTypeIndex[slot6.shop_type] = slot5
	end

	slot0.tab_list = {}
	slot0.cur_tab = nil
	slot0.cur_index = nil
	slot0.cur_shop_type = nil
	slot0.data_list = {}
end

function MallWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.mainContainer, 1)

	slot0.container_size = slot0.mainContainer:getContentSize()
	slot0.top_panel = slot0.mainContainer:getChildByName("top_panel")
	slot0.tableContainer = slot0.top_panel:getChildByName("tab_container")
	slot0.top_bg = slot0.top_panel:getChildByName("Image_1")
	slot0.bottom_bg = slot0.top_panel:getChildByName("Image_14")
	slot0.titleImage = slot0.top_panel:getChildByName("titleImage")
	slot0.container = slot0.top_panel:getChildByName("container")
	slot0.scrollCon = slot0.container:getChildByName("scrollCon")
	slot0.bottom_panel = slot0.container:getChildByName("bottom_panel")
	slot0.time_bg = slot0.bottom_panel:getChildByName("time_bg")

	slot0.time_bg:setVisible(false)

	slot0.btn = slot0.bottom_panel:getChildByName("btn")
	slot0.btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot0.btn:getContentSize().width / 2, slot0.btn:getContentSize().height / 2))

	slot0.btn_label:setString(TI18N("刷新"))
	slot0.btn:addChild(slot0.btn_label)
	slot0.btn:setVisible(false)

	slot0.coin = slot0.bottom_panel:getChildByName("coin")
	slot0.count = slot0.bottom_panel:getChildByName("count")
	slot0.add_btn = slot0.bottom_panel:getChildByName("add_btn")

	slot0.add_btn:setVisible(false)

	slot0.tips_btn = slot0.top_panel:getChildByName("tips_btn")

	slot0.tips_btn:setVisible(false)

	slot0.time = createRichLabel(20, cc.c4b(156, 214, 122, 255), cc.p(0, 0.5), cc.p(260, slot0.count:getPositionY() + 24))

	slot0.bottom_panel:addChild(slot0.time)
	slot0.time:setVisible(false)

	slot0.time_down_text = createRichLabel(20, cc.c4b(255, 237, 218, 255), cc.p(0, 0.5), cc.p(260, slot0.count:getPositionY() - 5))

	slot0.bottom_panel:addChild(slot0.time_down_text)
	slot0.time_down_text:setVisible(false)

	slot0.good_cons = slot0.container:getChildByName("good_cons")
	slot0.close_btn = slot0.top_panel:getChildByName("close_btn")

	MainuiController:getInstance():setIsShowMainUIBottom(false)
	slot0:createTitleEffect()
	slot0:adaptationScreen()
end

function MallWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.mainContainer)
	slot2 = display.getBottom(slot0.mainContainer)
	slot3 = display.getLeft(slot0.mainContainer)
	slot4 = display.getRight(slot0.mainContainer)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))

	slot6 = slot0.top_panel:getPositionY() - slot0.container_size.height

	slot0.close_btn:setPositionY(slot0.close_btn:getPositionY() + slot2 - slot6)
	slot0.tableContainer:setPositionY(slot0.tableContainer:getPositionY() + slot2 - slot6)
	slot0.bottom_panel:setPositionY(slot0.bottom_panel:getPositionY() + slot2 - slot6)
	slot0.bottom_bg:setPositionY(slot0.bottom_bg:getPositionY() + slot2 - slot6)

	slot11 = slot0.scrollCon:getContentSize()
	slot12 = slot1 - slot0.container_size.height - slot2

	slot0.scrollCon:setContentSize(cc.size(slot11.width, slot11.height + slot12))

	slot13 = slot0.good_cons:getContentSize()

	slot0.good_cons:setContentSize(cc.size(slot13.width, slot13.height + slot12))
end

function MallWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openMallPanel(false)
	end, true, 2)

	if slot0.add_btn then
		slot0.add_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				BackpackController:getInstance():openTipsSource(true, Config.ItemData.data_get_data(Config.ExchangeData.data_shop_list[uv0.cur_shop_type].item_bid))
			end
		end)
	end

	registerButtonEventListener(slot0.btn, function ()
		if uv0.cur_shop_type == MallConst.MallType.Recovery then
			slot1, slot2 = nil

			if Config.ExchangeData.data_shop_exchage_cost.soul_reset_cost then
				slot1 = slot0.val[1][1]
				slot2 = slot0.val[1][2]
			end

			if slot1 and slot2 then
				CommonAlert.show(string.format(TI18N("是否消耗<img src=%s scale=0.3 visible=true /><div>%s</div>进行重置？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1).icon), slot2), TI18N("确认"), function ()
					uv0:sender13405(uv1.cur_shop_type)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		elseif uv0.cur_shop_type == MallConst.MallType.SkillShop then
			uv1:sender13405(MallConst.MallType.SkillShop)
		end
	end, true, 1)

	if not slot0.update_have_count then
		slot0.update_have_count = GlobalEvent:getInstance():Bind(MallEvent.Open_View_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0:initGodShopData(slot0.type, slot0) ~= nil then
				slot0.item_list = slot1
				uv0.data_list[slot0.type] = slot0

				if uv0.cur_shop_type == slot0.type then
					uv0:updateDataList()
				end
			end
		end)
	end

	if not slot0.update_list then
		slot0.update_list = GlobalEvent:getInstance():Bind(MallEvent.Get_Buy_list, function (slot0)
			if not slot0 then
				return
			end

			uv0.data_list[slot0.type] = slot0

			for slot4, slot5 in ipairs(slot0.item_list) do
				slot5.shop_type = slot0.type
			end

			if slot0.type == uv0.cur_shop_type then
				uv0:setResetCount(slot0)

				if uv0.cur_shop_type == MallConst.MallType.SkillShop then
					uv0:setLessTime(uv0.data_list[uv0.cur_shop_type].refresh_time - GameNet:getInstance():getTime())
				end

				uv0:updateDataList()
			end
		end)
	end

	if slot0.role_vo and slot0.role_update_lev_event == nil then
		slot0.role_update_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				for slot5, slot6 in ipairs(uv0.tab_array) do
					slot6.can_touch = uv0:checkBtnIsOpen(slot6.id)
				end

				if uv0.tab_btn_list_view then
					uv0.tab_btn_list_view:resetCurrentItems()
				end
			elseif Config.ExchangeData.data_shop_list[uv0.cur_shop_type] and Config.ItemData.data_assets_id2label[slot2.item_bid] == slot0 then
				uv0.count:setString(MoneyTool.GetMoneyString(uv0.role_vo[Config.ItemData.data_assets_id2label[slot3]]))
			end
		end)
	end

	registerButtonEventListener(slot0.tips_btn, function ()
		uv0:onClickTips(uv0.tips_btn)
	end, true, 2)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.EQUIPS and uv0.cur_shop_type == MallConst.MallType.SkillShop then
			slot2 = Config.ExchangeData.data_shop_list[MallConst.MallType.SkillShop].item_bid

			for slot6, slot7 in pairs(slot1) do
				if slot7.base_id == slot2 then
					uv0:updateIconInfo(slot2)

					break
				end
			end
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.EQUIPS and uv0.cur_shop_type == MallConst.MallType.SkillShop then
			slot2 = Config.ExchangeData.data_shop_list[MallConst.MallType.SkillShop].item_bid

			for slot6, slot7 in pairs(slot1) do
				if slot7.base_id == slot2 then
					uv0:updateIconInfo(slot2)

					break
				end
			end
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		if slot0 ~= BackPackConst.Bag_Code.EQUIPS and uv0.cur_shop_type == MallConst.MallType.SkillShop then
			slot2 = Config.ExchangeData.data_shop_list[MallConst.MallType.SkillShop].item_bid

			for slot6, slot7 in pairs(slot1) do
				if slot7.base_id == slot2 then
					uv0:updateIconInfo(slot2)

					break
				end
			end
		end
	end)
end

function MallWindow.onClickTips(slot0, slot1)
	slot2 = ""

	if slot0.cur_shop_type == MallConst.MallType.Recovery then
		if Config.ExchangeData.data_shop_exchage_cost.hero_soul_instruction and Config.ExchangeData.data_shop_exchage_cost.hero_soul_instruction.desc then
			slot2 = Config.ExchangeData.data_shop_exchage_cost.hero_soul_instruction.desc
		end
	elseif slot0.cur_shop_type == MallConst.MallType.SkillShop and Config.ExchangeData.data_shop_exchage_cost.secret_instruction and Config.ExchangeData.data_shop_exchage_cost.secret_instruction.desc then
		slot2 = Config.ExchangeData.data_shop_exchage_cost.secret_instruction.desc
	end

	TipsManager:getInstance():showCommonTips(slot2, slot1:getTouchBeganPosition())
end

function MallWindow.createTitleEffect(slot0)
	if MAKELIFEBETTER == true then
		return
	end

	if slot0.title_effect then
		return
	end

	slot0.title_effect = createEffectSpine("E24128", cc.p(50, -25), cc.p(0.5, 0), true)

	slot0.titleImage:addChild(slot0.title_effect)
end

function MallWindow.updateTabBtnList(slot0, slot1)
	if not slot0.tab_array then
		return
	end

	if not slot0.tab_btn_list_view then
		slot2 = slot0.tableContainer:getContentSize()
		slot4 = 119
		slot6 = nil

		if slot0:numberOfCellsTabBtn() <= 4 then
			slot6 = {
				[slot12] = cc.p(5 + slot4 * 0.5 + (slot12 - 1) * slot4, 110 * 0.5)
			}

			for slot12 = 1, slot3 do
			end
		end

		slot0.tab_btn_list_view = CommonScrollViewSingleLayout.new(slot0.tableContainer, cc.p(slot2.width * 0.5, slot2.height * 0.5), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2, {
			start_y = 0,
			start_x = 0,
			space_y = 0,
			space_x = 11,
			need_dynamic = true,
			row = 1,
			item_width = slot4,
			item_height = slot5
		}, cc.p(0.5, 0.5))

		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCellTabBtn), ScrollViewFuncType.CreateNewCell)
		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellsTabBtn), ScrollViewFuncType.NumberOfCells)
		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndexTabBtn), ScrollViewFuncType.UpdateCellByIndex)
		slot0.tab_btn_list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouchedTabBtn), ScrollViewFuncType.OnCellTouched)

		if slot3 <= 4 then
			slot0.tab_btn_list_view:setClickEnabled(false)
		end
	end

	slot0.tab_btn_list_view:reloadData(slot1 or 1)
end

function MallWindow.createNewCellTabBtn(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/mall_tab_btn"))

	slot3:addChild(slot3.root_wnd)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(cc.p(0.5, 0.5))
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.tab_btn = slot3.root_wnd:getChildByName("tab_btn")
	slot3.normal_bg_img = slot3.tab_btn:getChildByName("unselect_bg")
	slot3.select_bg_img = slot3.tab_btn:getChildByName("select_bg")
	slot3.normal_img = slot3.tab_btn:getChildByName("unselect_img")
	slot3.select_img = slot3.tab_btn:getChildByName("select_img")

	slot3.select_bg_img:setVisible(false)
	slot3.select_img:setVisible(false)
	slot3.tab_btn:setSwallowTouches(false)

	slot3.label = slot3.tab_btn:getChildByName("title")

	slot3.label:setTextColor(cc.c4b(248, 194, 60, 255))

	slot3.red_point = slot3.tab_btn:getChildByName("tab_tips")
	slot3.red_num = slot3.tab_btn:getChildByName("red_num")

	slot3.red_point:setVisible(false)
	slot3.red_num:setVisible(false)
	registerButtonEventListener(slot3.tab_btn, function ()
		uv0:onCellTouchedTabBtn(uv1)
	end, false, 2, nil, nil, nil, true)

	return slot3
end

function MallWindow.numberOfCellsTabBtn(slot0)
	if not slot0.tab_array then
		return 0
	end

	return #slot0.tab_array
end

function MallWindow.updateCellByIndexTabBtn(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.tab_array[slot2] then
		slot1.label:setString(slot3.config.name)
		slot1.normal_img:loadTexture(PathTool.getResFrame("mall_prop", string.format("shop_type_%d_a", slot3.shop_type)), LOADTEXT_TYPE_PLIST)
		slot1.select_img:loadTexture(PathTool.getResFrame("mall_prop", string.format("shop_type_%d_b", slot3.shop_type)), LOADTEXT_TYPE_PLIST)

		if slot0.cur_index == slot2 then
			slot1.select_bg_img:setVisible(true)
			slot1.select_img:setVisible(true)
		else
			slot1.select_bg_img:setVisible(false)
			slot1.select_img:setVisible(false)
		end
	end
end

function MallWindow.onCellTouchedTabBtn(slot0, slot1)
	if slot0.tab_array[slot1.index] then
		if slot3.can_touch then
			slot0:changeTabView(slot2, true)
		else
			message(TI18N(slot3.notice))
		end
	end
end

function MallWindow.changeTabView(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 and slot0.cur_index == slot1 then
		return
	end

	if not slot0.tab_array[slot1] then
		return
	end

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(248, 194, 60, 255))
		end

		slot0.cur_tab.select_bg_img:setVisible(false)
		slot0.cur_tab.select_img:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_shop_type = slot3.shop_type
	slot0.cur_tab = slot0.tab_btn_list_view:getCellByIndex(slot0.cur_index)

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		end

		slot0.cur_tab.select_bg_img:setVisible(true)
		slot0.cur_tab.select_img:setVisible(true)
	end

	slot0.tips_btn:setVisible(false)
	slot0.time:setVisible(false)
	slot0.time_down_text:setVisible(false)

	if slot0.cur_shop_type == MallConst.MallType.GodShop then
		slot0.add_btn:setVisible(false)
	else
		slot0.add_btn:setVisible(true)
	end

	if #slot3.config.subtype > 0 then
		slot4 = slot3.config.subtype

		if not slot0.son_panel then
			slot0.son_panel = MallSonPanel.new()

			slot0.container:addChild(slot0.son_panel)
		else
			slot0.son_panel:setVisibleStatus(true)
		end

		slot0.son_panel:setList(slot4)

		if slot0.init_shop_type then
			slot0.son_panel:openById(slot0.init_shop_type)

			slot0.init_shop_type = nil
		else
			slot0.son_panel:openById(slot4[1])
		end

		slot0.good_cons:setVisible(false)
		slot0.btn:setVisible(false)
		slot0.time_bg:setVisible(false)
		slot0.coin:setVisible(false)
		slot0.count:setVisible(false)
	else
		slot0.good_cons:setVisible(true)
		slot0.coin:setVisible(true)
		slot0.count:setVisible(true)

		if slot0.cur_shop_type == MallConst.MallType.Recovery then
			if not slot0.data_list[slot0.cur_shop_type] then
				uv0:sender13403(slot0.cur_shop_type)
			else
				slot0:setResetCount(slot0.data_list[slot0.cur_shop_type])
			end

			slot0.btn:setVisible(true)
			slot0.time_bg:setVisible(true)
			slot0.tips_btn:setVisible(true)
		elseif slot0.cur_shop_type == MallConst.MallType.SkillShop then
			if not slot0.data_list[slot0.cur_shop_type] then
				uv0:sender13403(slot0.cur_shop_type)
			else
				if slot0.data_list[slot0.cur_shop_type].refresh_time - GameNet:getInstance():getTime() > 0 then
					slot0:setLessTime(slot4)
				else
					slot0:setTimeFormatString(0)
					uv0:sender13403(MallConst.MallType.SkillShop)
				end

				slot0:setResetCount(slot0.data_list[slot0.cur_shop_type])
			end

			slot0.btn:setVisible(true)
			slot0.time_bg:setVisible(true)
		else
			if not slot0.data_list[slot0.cur_shop_type] then
				uv0:sender13401(slot0.cur_shop_type)
			end

			slot0.btn:setVisible(false)
			slot0.time_bg:setVisible(false)
		end

		if slot0.data_list[slot0.cur_shop_type] then
			slot0:updateDataList()
		end

		slot4 = slot3.config.item_bid

		if slot0.record_item_bid == nil or slot0.record_item_bid ~= slot4 then
			slot0.record_item_bid = slot4

			loadSpriteTexture(slot0.coin, PathTool.getItemRes(Config.ItemData.data_get_data(slot4).icon), LOADTEXT_TYPE)
		end

		slot0:updateIconInfo(slot4)

		if slot0.son_panel then
			slot0.son_panel:setVisibleStatus(false)
		end
	end
end

function MallWindow.openRootWnd(slot0, slot1, slot2)
	uv0:setFirstLogin(false)

	if slot0.dicShopTypeIndex[slot1 or MallConst.MallType.GodShop] == nil then
		if slot0.dicSecondMenuIndex[slot3] == nil then
			slot4 = 1
		else
			slot0.init_shop_type = slot3
		end
	end

	slot0:updateTabBtnList(slot4)
end

function MallWindow.updateDataList(slot0)
	if not slot0.cur_shop_type then
		return
	end

	if not slot0.data_list[slot0.cur_shop_type] then
		return
	end

	if not slot0.item_scrollview then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 14,
			item_height = 150,
			start_x = -7,
			space_y = 0,
			col = 2,
			space_x = 3,
			need_dynamic = true,
			item_width = 346
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.show_list = slot0.data_list[slot0.cur_shop_type].item_list

	slot0.item_scrollview:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.good_cons, true, {
			font_size = 22,
			scale = 1
		})
	else
		commonShowEmptyIcon(slot0.good_cons, false)
	end
end

function MallWindow.createNewCell(slot0, slot1, slot2)
	slot3 = MallItem2.new()

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function MallWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function MallWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])
end

function MallWindow.onCellTouched(slot0, slot1)
	if slot0.show_list[slot1.index] then
		if slot3.has_buy == nil then
			if slot3.ext and slot3.ext[1] then
				slot3.has_buy = slot3.ext[1].val
			else
				slot3.has_buy = 0
			end
		end

		slot3.shop_type = slot0.cur_shop_type

		uv0:openMallBuyWindow(true, slot3)
	end
end

function MallWindow.checkBtnIsOpen(slot0, slot1)
	if not slot0.role_vo then
		return false
	end

	if Config.ExchangeData.data_shop_exchage_cost[slot0.open_key_list[slot1]] then
		if slot2.val <= slot0.role_vo.lev then
			return true
		end
	else
		return true
	end

	return false
end

function MallWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time) then
		return
	end

	slot0.time:setVisible(true)
	slot0.time:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time:stopAllActions()

				if uv1.cur_index == 4 then
					uv2:sender13403(MallConst.MallType.SkillShop)
				end
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function MallWindow.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time:setString(string.format(TI18N("<div outline=1,#000000>免费刷新: %s</div>"), TimeTool.GetTimeFormat(slot1)))
	else
		slot0.time:setString("<div outline=1,#000000>免费刷新: 00:00:00</div>")
	end
end

function MallWindow.updateIconInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.count:setString(MoneyTool.GetMoneyString(BackpackController:getInstance():getModel():getItemNumByBid(slot1)))
end

function MallWindow.setResetCount(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = TI18N("免费刷新")

	if slot0.cur_shop_type == MallConst.MallType.Recovery then
		if (slot1.free_count or 0) <= 0 and Config.ExchangeData.data_shop_exchage_cost.soul_reset_cost then
			slot3 = string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#020019>%s重置</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot4.val[1][1]).icon), slot4.val[1][2])
		end
	elseif slot0.cur_shop_type == MallConst.MallType.SkillShop then
		if slot2 <= 0 then
			if Config.ExchangeData.data_shop_list[MallConst.MallType.SkillShop] then
				slot5 = slot4.cost_list
				slot3 = string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#020019>%s刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot5[1][1]).icon), slot5[1][2])
			end
		elseif Config.ExchangeData.data_shop_exchage_cost.skill_refresh_free then
			slot3 = string.format("<div outline=2,#020019>%s(%s/%s)</div>", TI18N("免费刷新"), slot2, slot4.val)
		end

		slot0.time_down_text:setVisible(true)

		slot5 = 0

		if Config.ExchangeData.data_shop_exchage_cost.skill_refresh_number then
			slot5 = slot4.val
		end

		slot0.time_down_text:setString(string.format("<div outline=1,#000000>%s:%s/%s</div>", TI18N("刷新次数"), slot1.count or 0, slot5))
	end

	slot0.btn_label:setString(slot3)
end

function MallWindow.initGodShopData(slot0, slot1, slot2)
	slot3 = nil

	if slot1 == MallConst.MallType.GodShop then
		slot3 = Config.ExchangeData.data_shop_exchage_gold
	elseif slot1 == MallConst.MallType.HeroSkin then
		slot3 = Config.ExchangeData.data_shop_exchage_skin
	else
		return nil
	end

	slot4 = {}
	slot5 = {
		[slot10.item_id] = slot10.ext[1].val
	}

	for slot9, slot10 in ipairs(slot2.item_list) do
		if slot10.ext and slot10.ext[1] and slot10.ext[1].val then
			-- Nothing
		else
			slot5[slot10.item_id] = 0
		end
	end

	if slot3 then
		for slot9, slot10 in pairs(slot3) do
			if slot5[slot10.id] then
				deepCopy(slot10).has_buy = slot5[slot10.id]
			else
				slot11.has_buy = 0
			end

			uv0(slot4, slot11)
		end

		table.sort(slot4, function (slot0, slot1)
			return slot0.order < slot1.order
		end)
	end

	return slot4
end

function MallWindow.close_callback(slot0)
	if slot0.title_effect then
		slot0.title_effect:clearTracks()
		slot0.title_effect:removeFromParent()

		slot0.title_effect = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.son_panel then
		slot0.son_panel:DeleteMe()
	end

	if slot0.update_have_count then
		GlobalEvent:getInstance():UnBind(slot0.update_have_count)

		slot0.update_have_count = nil
	end

	if slot0.update_list then
		GlobalEvent:getInstance():UnBind(slot0.update_list)

		slot0.update_list = nil
	end

	if slot0.role_vo then
		if slot0.role_update_lev_event then
			slot0.role_vo:UnBind(slot0.role_update_lev_event)

			slot0.role_update_lev_event = nil
		end

		slot0.role_vo = nil
	end

	if slot0.refresh_event then
		GlobalEvent:getInstance():UnBind(slot0.refresh_event)

		slot0.refresh_event = nil
	end

	if slot0.buy_success_event then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_event)

		slot0.buy_success_event = nil
	end

	if slot0.buy_success_shenmi then
		GlobalEvent:getInstance():UnBind(slot0.buy_success_shenmi)

		slot0.buy_success_shenmi = nil
	end

	MainuiController:getInstance():setIsShowMainUIBottom(true)
	uv0:openMallPanel(false)
end
