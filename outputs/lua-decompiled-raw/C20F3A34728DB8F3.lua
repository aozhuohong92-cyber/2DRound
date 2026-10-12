slot1 = MallController:getInstance():getModel()
slot2 = table.sort
slot3 = table.insert
ScoreShopWindow = ScoreShopWindow or BaseClass(BaseView)

function ScoreShopWindow.__init(slot0)
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "mall/score_shop_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mall_score", "mall_score"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "score_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/mall", "skin_bg_3"),
			type = ResourcesType.single
		}
	}
	slot0.tab_array = {}
	slot0.tab_list = {}
	slot0.cur_tab = nil
	slot0.cur_index = nil
	slot0.cur_shop_type = nil
	slot0.data_list = {}
	slot0.dicShopTypeIndex = {}
	slot0.dicSecondMenuIndex = {}

	slot0:initShopData()
end

function ScoreShopWindow.initShopData(slot0)
	if Config.ExchangeData.data_shop_list then
		for slot5, slot6 in pairs(slot1) do
			if slot6.score_sort > 0 then
				slot8, slot9 = slot0:checkBtnIsOpen(slot6.id, slot6.limit)

				if not ({
					config = slot6,
					shop_type = slot6.id,
					index = slot6.score_sort,
					status = true,
					subtype = slot6.subtype,
					notice = slot9,
					can_touch = slot8
				}).notice or slot7.notice == "" then
					slot7.notice = TI18N("暂未解锁")
				end

				uv0(slot0.tab_array, slot7)
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
end

function ScoreShopWindow.checkBtnIsOpen(slot0, slot1, slot2)
	slot3 = true
	slot4 = ""

	if slot1 == MallConst.MallType.UnionShop then
		if slot0.role_vo and slot0.role_vo.gid ~= 0 then
			slot3 = true
		else
			slot3 = false
			slot4 = TI18N("尚未加入公会")
		end
	elseif slot2 and next(slot2) ~= nil then
		slot3, slot4 = MainuiController:getInstance():checkIsOpenByActivate(slot2)
	end

	return slot3, slot4
end

function ScoreShopWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.mainContainer, 1)

	slot0.container_size = slot0.mainContainer:getContentSize()
	slot0.top_panel = slot0.mainContainer:getChildByName("top_panel")
	slot0.tableContainer = slot0.top_panel:getChildByName("btn_list")
	slot0.titleImage = slot0.top_panel:getChildByName("titleImage")
	slot0.btn = slot0.top_panel:getChildByName("reset_btn")

	slot0.btn:setVisible(false)

	slot0.add_btn = slot0.top_panel:getChildByName("add_btn")

	slot0.add_btn:setVisible(true)

	slot0.btn_label = createRichLabel(24, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(slot0.btn:getContentSize().width / 2, slot0.btn:getContentSize().height / 2))

	slot0.btn_label:setString(TI18N("刷新"))
	slot0.btn_label:setVisible(false)
	slot0.btn:addChild(slot0.btn_label)

	slot0.coin = slot0.top_panel:getChildByName("item_sp")
	slot0.count = slot0.top_panel:getChildByName("count_txt")
	slot0.time_bg = slot0.top_panel:getChildByName("Image_4")

	slot0.time_bg:setVisible(false)

	slot0.tips_btn = slot0.top_panel:getChildByName("tips_btn")

	slot0.tips_btn:setVisible(false)

	slot0.time = createRichLabel(18, cc.c4b(156, 214, 122, 255), cc.p(0, 0.5), cc.p(450, 981))

	slot0.top_panel:addChild(slot0.time)
	slot0.time:setVisible(false)

	slot0.time_down_text = createRichLabel(18, cc.c4b(255, 237, 218, 255), cc.p(1, 0.5), cc.p(710, 981))

	slot0.top_panel:addChild(slot0.time_down_text)
	slot0.time_down_text:setVisible(false)

	slot0.scrollCon = slot0.top_panel:getChildByName("Image_1")
	slot0.l_bg = slot0.top_panel:getChildByName("l_bg")
	slot0.r_bg = slot0.top_panel:getChildByName("r_bg")
	slot0.good_cons = slot0.top_panel:getChildByName("item_list")
	slot0.bottom_bg = slot0.mainContainer:getChildByName("bottom_bg")
	slot0.bottom_bg2 = slot0.mainContainer:getChildByName("bottom_bg2")
	slot0.close_btn = slot0.mainContainer:getChildByName("close_btn")

	slot0:createTitleEffect()
	slot0:adaptationScreen()
end

function ScoreShopWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.mainContainer)
	slot2 = display.getBottom(slot0.mainContainer)
	slot3 = display.getLeft(slot0.mainContainer)
	slot4 = display.getRight(slot0.mainContainer)

	slot0.top_panel:setPositionY(slot1 - (slot0.container_size.height - slot0.top_panel:getPositionY()))

	slot6 = slot0.top_panel:getPositionY() - slot0.container_size.height

	slot0.close_btn:setPositionY(slot0.close_btn:getPositionY() + slot2)
	slot0.bottom_bg:setPositionY(slot0.bottom_bg:getPositionY() + slot2)
	slot0.bottom_bg2:setPositionY(slot0.bottom_bg2:getPositionY() + slot2)

	slot10 = slot0.scrollCon:getContentSize()
	slot11 = slot1 - slot0.container_size.height - slot2

	slot0.scrollCon:setContentSize(cc.size(slot10.width, slot10.height + slot11))

	slot12 = slot0.good_cons:getContentSize()

	slot0.good_cons:setContentSize(cc.size(slot12.width, slot12.height + slot11))

	slot13 = slot0.r_bg:getContentSize()

	slot0.r_bg:setContentSize(cc.size(slot13.width, slot13.height + slot11))

	slot14 = slot0.l_bg:getContentSize()

	slot0.l_bg:setContentSize(cc.size(slot14.width, slot14.height + slot11))
end

function ScoreShopWindow.createTitleEffect(slot0)
	if MAKELIFEBETTER == true then
		return
	end

	if slot0.title_effect then
		return
	end

	slot0.title_effect = createEffectSpine("E24129", cc.p(0, 0), cc.p(0.5, 0), true)

	slot0.titleImage:addChild(slot0.title_effect)
end

function ScoreShopWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.add_btn, function ()
		BackpackController:getInstance():openTipsSource(true, Config.ItemData.data_get_data(Config.ExchangeData.data_shop_list[uv0.cur_shop_type].item_bid))
	end, true, 1)
	registerButtonEventListener(slot0.btn, function ()
		uv0:onClickRefreshBtn()
	end, true, 1)
	slot0:addGlobalEvent(MallEvent.Open_View_Event, function (slot0)
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
	slot0:addGlobalEvent(MallEvent.Get_Buy_list, function (slot0)
		if not slot0 then
			return
		end

		uv0.data_list[slot0.type] = slot0

		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.shop_type = slot0.type
		end

		if slot0.type == uv0.cur_shop_type then
			uv0:setResetCount(slot0)

			if uv0.cur_shop_type == MallConst.MallType.SkillShop or uv0.cur_shop_type == MallConst.MallType.CrossarenaShop or uv0.cur_shop_type == MallConst.MallType.GuessShop then
				uv0:setLessTime(uv0.data_list[uv0.cur_shop_type].refresh_time - GameNet:getInstance():getTime())
			end

			uv0:updateDataList()
		end
	end)

	if slot0.role_vo and slot0.role_update_lev_event == nil then
		slot0.role_update_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "lev" then
				for slot5, slot6 in ipairs(uv0.tab_array) do
					slot6.can_touch, slot6.notice = uv0:checkBtnIsOpen(slot6.config.id, slot6.config.limit)

					if not slot6.notice or slot6.notice == "" then
						slot6.notice = TI18N("暂未解锁")
					end
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

function ScoreShopWindow.onClickRefreshBtn(slot0)
	if slot0.cur_shop_type == MallConst.MallType.Recovery then
		slot2, slot3 = nil

		if Config.ExchangeData.data_shop_exchage_cost.soul_reset_cost then
			slot2 = slot1.val[1][1]
			slot3 = slot1.val[1][2]
		end

		if slot2 and slot3 then
			CommonAlert.show(string.format(TI18N("是否消耗<img src=%s scale=0.3 visible=true /><div>%s</div>进行重置？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot2).icon), slot3), TI18N("确认"), function ()
				uv0:sender13405(uv1.cur_shop_type)
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		end
	elseif slot0.cur_shop_type == MallConst.MallType.SkillShop then
		uv0:sender13405(MallConst.MallType.SkillShop)
	elseif slot0.cur_shop_type == MallConst.MallType.CrossarenaShop then
		uv0:sender13405(MallConst.MallType.CrossarenaShop)
	elseif slot0.cur_shop_type == MallConst.MallType.GuessShop then
		if Config.ExchangeData.data_shop_list[MallConst.MallType.GuessShop].cost_list[1][2] <= slot0.role_vo.star_point then
			uv0:sender13405(MallConst.MallType.GuessShop)
		else
			message(TI18N("探宝积分不足"))
			BackpackController:getInstance():openTipsSource(true, 18)
		end
	end
end

function ScoreShopWindow.onClickTips(slot0, slot1)
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

function ScoreShopWindow.updateTabBtnList(slot0, slot1)
	if not slot0.tab_array then
		return
	end

	if not slot0.tab_btn_list_view then
		slot2 = slot0.tableContainer:getContentSize()
		slot4 = 135
		slot6 = nil

		if slot0:numberOfCellsTabBtn() <= 4 then
			slot6 = {
				[slot12] = cc.p(5 + slot4 * 0.5 + (slot12 - 1) * slot4, 66 * 0.5)
			}

			for slot12 = 1, slot3 do
			end
		end

		slot0.tab_btn_list_view = CommonScrollViewSingleLayout.new(slot0.tableContainer, cc.p(slot2.width * 0.5, slot2.height * 0.5), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2, {
			start_y = 0,
			start_x = 5,
			space_y = 0,
			space_x = 0,
			need_dynamic = true,
			item_width = slot4,
			item_height = slot5,
			position_data_list = slot6
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

function ScoreShopWindow.createNewCellTabBtn(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot3.root_wnd = createCSBNote(PathTool.getTargetCSB("mall/score_shop_btn"))

	slot3:addChild(slot3.root_wnd)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(cc.p(0.5, 0.5))
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.tab_btn = slot3.root_wnd:getChildByName("tab_btn")
	slot3.normal_img = slot3.tab_btn:getChildByName("unselect_bg")
	slot3.select_img = slot3.tab_btn:getChildByName("select_bg")

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
	end, false, 2, nil, , , true)

	return slot3
end

function ScoreShopWindow.numberOfCellsTabBtn(slot0)
	if not slot0.tab_array then
		return 0
	end

	return #slot0.tab_array
end

function ScoreShopWindow.updateCellByIndexTabBtn(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.tab_array[slot2] then
		slot1.label:setString(slot3.config.name)

		if slot0.cur_index == slot2 then
			slot1.select_img:setVisible(true)
			slot1.label:setTextColor(cc.c4b(255, 255, 255, 255))
		else
			slot1.select_img:setVisible(false)
			slot1.label:setTextColor(cc.c4b(248, 194, 60, 255))
		end

		if slot3.can_touch then
			slot1.label:enableOutline(cc.c4b(2, 0, 25, 255), 2)
			setChildUnEnabled(false, slot1.tab_btn)
		else
			slot1.label:disableEffect(cc.LabelEffect.OUTLINE)
			setChildUnEnabled(true, slot1.tab_btn)
		end
	end
end

function ScoreShopWindow.onCellTouchedTabBtn(slot0, slot1)
	if slot0.tab_array[slot1.index] then
		if slot3.can_touch then
			slot0:changeTabView(slot2, true)
		else
			message(TI18N(slot3.notice))
		end
	end
end

function ScoreShopWindow.changeTabView(slot0, slot1, slot2)
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
		if slot0.cur_tab.label and slot0.cur_tab.index and slot0.tab_array[slot0.cur_tab.index].can_touch then
			slot0.cur_tab.label:setTextColor(cc.c4b(248, 194, 60, 255))
		end

		slot0.cur_tab.select_img:setVisible(false)
	end

	slot0.cur_index = slot1
	slot0.cur_shop_type = slot3.shop_type
	slot0.cur_tab = slot0.tab_btn_list_view:getCellByIndex(slot0.cur_index)

	if slot0.cur_tab ~= nil then
		if slot0.cur_tab.label then
			slot0.cur_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		end

		slot0.cur_tab.select_img:setVisible(true)
	end

	slot0.tips_btn:setVisible(false)
	slot0.time:setVisible(false)
	slot0.time_down_text:setVisible(false)

	if #slot3.config.subtype > 0 then
		slot4 = slot3.config.subtype

		if not slot0.son_panel then
			slot0.son_panel = MallSonPanel.new()

			slot0.mainContainer:addChild(slot0.son_panel)
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
		slot0.btn_label:setVisible(false)
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
			slot0.btn_label:setVisible(true)
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
			slot0.btn_label:setVisible(true)
		elseif slot0.cur_shop_type == MallConst.MallType.GuessShop then
			if not slot0.data_list[slot0.cur_shop_type] then
				uv0:sender13403(slot0.cur_shop_type)
			else
				if slot0.data_list[slot0.cur_shop_type].refresh_time - GameNet:getInstance():getTime() > 0 then
					slot0:setLessTime(slot4)
				else
					slot0:setTimeFormatString(0)
					uv0:sender13403(MallConst.MallType.GuessShop)
				end

				slot0:setResetCount(slot0.data_list[slot0.cur_shop_type])
			end

			slot0.btn:setVisible(true)
			slot0.btn_label:setVisible(true)
		elseif slot0.cur_shop_type == MallConst.MallType.CrossarenaShop then
			if not slot0.data_list[slot0.cur_shop_type] then
				uv0:sender13403(slot0.cur_shop_type)
			else
				if slot0.data_list[slot0.cur_shop_type].refresh_time - GameNet:getInstance():getTime() > 0 then
					slot0:setLessTime(slot4)
				else
					slot0:setTimeFormatString(0)
					uv0:sender13403(MallConst.MallType.CrossarenaShop)
				end

				slot0:setResetCount(slot0.data_list[slot0.cur_shop_type])
			end

			slot0.btn:setVisible(true)
			slot0.btn_label:setVisible(true)
		else
			if not slot0.data_list[slot0.cur_shop_type] then
				uv0:sender13401(slot0.cur_shop_type)
			end

			slot0.btn:setVisible(false)
			slot0.btn_label:setVisible(false)
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

	slot0:updateTimeBg()
end

function ScoreShopWindow.openRootWnd(slot0, slot1)
	uv0:setFirstLogin(false)

	if slot0.dicShopTypeIndex[slot1 or MallConst.MallType.GodShop] == nil then
		if slot0.dicSecondMenuIndex[slot2] == nil then
			slot3 = 1
		else
			slot0.init_shop_type = slot2
		end
	end

	slot0:updateTabBtnList(slot3)
end

function ScoreShopWindow.updateDataList(slot0)
	if not slot0.cur_shop_type then
		return
	end

	if not slot0.data_list[slot0.cur_shop_type] then
		return
	end

	if not slot0.item_scrollview then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 15,
			item_height = 236,
			start_x = 30,
			space_y = 40,
			col = 3,
			space_x = 20,
			need_dynamic = true,
			item_width = 195
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

function ScoreShopWindow.createNewCell(slot0, slot1, slot2)
	slot3 = ScoreShopItem.new()

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function ScoreShopWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ScoreShopWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])

	if slot2 % 3 == 1 then
		slot1:createItemBgSprite()
	end
end

function ScoreShopWindow.onCellTouched(slot0, slot1)
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

function ScoreShopWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time) then
		return
	end

	slot0.time:setVisible(true)
	slot0:updateTimeBg()
	slot0.time:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time:stopAllActions()

				if uv1.cur_shop_type == MallConst.MallType.SkillShop then
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

function ScoreShopWindow.setTimeFormatString(slot0, slot1)
	slot0.rest_time = slot1

	if slot1 > 0 then
		slot0.time:setString(string.format(TI18N("免费刷新: %s"), TimeTool.GetTimeFormat(slot1)))
	else
		slot0.time:setString(TI18N("免费刷新: 00:00:00"))
	end
end

function ScoreShopWindow.updateIconInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.count:setString(MoneyTool.GetMoneyString(BackpackController:getInstance():getModel():getItemNumByBid(slot1)))
end

function ScoreShopWindow.setResetCount(slot0, slot1)
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

		slot0.time_down_text:setString(string.format("(%s：%s/%s)", TI18N("次数"), slot1.count or 0, slot5))
	elseif slot0.cur_shop_type == MallConst.MallType.GuessShop then
		if slot2 <= 0 and Config.ExchangeData.data_shop_list[MallConst.MallType.GuessShop] and slot4.cost_list then
			slot3 = string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#020019>%s刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot4.cost_list[1][1]).icon), slot4.cost_list[1][2])
		end
	elseif slot0.cur_shop_type == MallConst.MallType.CrossarenaShop then
		if slot2 <= 0 then
			if Config.ExchangeData.data_shop_list[MallConst.MallType.CrossarenaShop] then
				slot5 = slot4.cost_list
				slot3 = string.format(TI18N("<img src=%s scale=0.3 visible=true /><div outline=2,#020019>%s刷新</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot5[1][1]).icon), slot5[1][2])
			end
		elseif Config.ExchangeData.data_shop_exchage_cost.cluster_refresh_free then
			slot3 = string.format("<div outline=2,#020019>%s(%s/%s)</div>", TI18N("免费刷新"), slot2, slot4.val)
		end

		slot0.time_down_text:setVisible(true)

		slot5 = 0

		if Config.ExchangeData.data_shop_exchage_cost.cluster_refresh_number then
			slot5 = slot4.val
		end

		slot0.time_down_text:setString(string.format("(%s：%s/%s)", TI18N("次数"), slot1.count or 0, slot5))
	end

	slot0.btn_label:setString(slot3)
	slot0:updateTimeBg()
end

function ScoreShopWindow.updateTimeBg(slot0)
	slot1 = false
	slot2 = false

	if slot0.time_down_text and slot0.time_down_text:isVisible() then
		slot1 = true
	end

	if slot0.time and slot0.time:isVisible() then
		slot2 = true
	end

	if slot1 or slot2 then
		slot3 = 284
		slot4 = 450

		if slot1 and slot2 then
			slot3 = 284
		elseif slot1 then
			slot3 = 114
		elseif slot2 then
			slot3 = 180
			slot4 = 550
		end

		slot0.time:setPositionX(slot4)
		slot0.time_bg:setContentSize(cc.size(slot3, 26))
		slot0.time_bg:setVisible(true)
	else
		slot0.time_bg:setVisible(false)
	end
end

function ScoreShopWindow.initGodShopData(slot0, slot1, slot2)
	slot3 = nil

	if slot1 == MallConst.MallType.GodShop then
		slot3 = Config.ExchangeData.data_shop_exchage_gold
	elseif slot1 == MallConst.MallType.UnionShop then
		slot3 = Config.ExchangeData.data_shop_exchage_guild
	elseif slot1 == MallConst.MallType.ArenaShop then
		slot3 = Config.ExchangeData.data_shop_exchage_arena
	elseif slot1 == MallConst.MallType.FriendShop then
		slot3 = Config.ExchangeData.data_shop_exchage_expediton
	elseif slot1 == MallConst.MallType.EliteShop then
		slot3 = Config.ExchangeData.data_shop_exchage_elite
	elseif slot1 == MallConst.MallType.Ladder then
		slot3 = Config.ExchangeData.data_shop_exchage_ladder
	elseif slot1 == MallConst.MallType.CrosschampionShop then
		slot3 = Config.ExchangeData.data_shop_exchage_crosschampion
	elseif slot1 == MallConst.MallType.PeakchampionShop then
		slot3 = Config.ExchangeData.data_shop_exchage_peakchampion
	else
		return
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

		uv1(slot4, function (slot0, slot1)
			return slot0.order < slot1.order
		end)
	end

	return slot4
end

function ScoreShopWindow.onClickCloseBtn(slot0)
	uv0:openScoreShopWindow(false)
end

function ScoreShopWindow.onClickShopBtn(slot0)
end

function ScoreShopWindow.close_callback(slot0)
	if slot0.title_effect then
		slot0.title_effect:clearTracks()
		slot0.title_effect:removeFromParent()

		slot0.title_effect = nil
	end

	if slot0.tab_btn_list_view then
		slot0.tab_btn_list_view:DeleteMe()

		slot0.tab_btn_list_view = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.son_panel then
		slot0.son_panel:DeleteMe()
	end

	if slot0.role_vo then
		if slot0.role_update_lev_event then
			slot0.role_vo:UnBind(slot0.role_update_lev_event)

			slot0.role_update_lev_event = nil
		end

		slot0.role_vo = nil
	end

	uv0:openScoreShopWindow(false)
end
