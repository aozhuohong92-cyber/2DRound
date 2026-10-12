slot1 = HeavenController:getInstance():getModel()
slot2 = table.insert
HeavenDungeonPanel = class("HeavenDungeonPanel", function ()
	return ccui.Widget:create()
end)

function HeavenDungeonPanel.ctor(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("heaven", "heaven"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_85", true),
			type = ResourcesType.single
		}
	}
	slot0.chapter_show_data = {}
	slot0.move_speed = 4
	slot0.is_first_open = true
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
	slot0:configUI()
	slot0:register_event()
end

function HeavenDungeonPanel.loadResListCompleted(slot0)
end

function HeavenDungeonPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1 or false)

	if slot0.is_first_open then
		if not uv0:checkIsHaveChapterCache() then
			uv1:sender25200()
		else
			slot0:refreshLeftCount()
			slot0:updateLeftBuyCount()
		end

		slot0.is_first_open = false
	end
end

function HeavenDungeonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("heaven/heaven_dungeon_panel"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot2 = slot1:getChildByName("top_panel")
	slot0.btn_rule = slot2:getChildByName("btn_rule")
	slot0.map_layer = slot0.root_wnd:getChildByName("map_layer")
	slot0.chapter_list = slot0.main_container:getChildByName("chapter_list")
	slot3 = slot1:getChildByName("bottom_panel")
	slot0.bottom_panel = slot3

	slot3:getChildByName("count_title"):setString(TI18N("挑战次数:"))

	slot0.count_label = slot3:getChildByName("count_label")
	slot0.add_btn = slot3:getChildByName("add_btn")
	slot0.btn_rank = slot3:getChildByName("btn_rank")

	slot0.btn_rank:getChildByName("label"):setString(TI18N("排行榜"))

	slot0.btn_shop = slot3:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("label"):setString(TI18N("神装商城"))

	slot0.btn_book = slot3:getChildByName("btn_book")

	slot0.btn_book:getChildByName("label"):setString(TI18N("神装图鉴"))

	slot5 = display.getBottom(slot1)

	slot2:setPositionY(display.getTop(slot1) - 158)
	slot3:setPositionY(slot5 + 110)
	slot0.map_layer:setPositionY(slot5)
	slot0.map_layer:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0.chapter_list:setPositionY(slot5)
	slot0.chapter_list:setContentSize(cc.size(SCREEN_WIDTH, display.height))
	slot0:createCapterList()
	slot0:updateChapterShowData(true)
	slot0:createMapBgList()
end

function HeavenDungeonPanel.updateChapterShowData(slot0, slot1)
	slot0.chapter_show_data = {}
	slot0.last_chapter_id = 1
	slot3 = 0

	for slot7, slot8 in ipairs(Config.DungeonHeavenData.data_chapter) do
		if slot8.limit_id <= uv0:getMaxPassChapterId() then
			if #slot0.chapter_show_data == 0 then
				slot9 = 1
			end

			if not slot0.chapter_show_data[slot9] then
				slot0.chapter_show_data[slot9] = {
					chapter_datas = {},
					index = slot9
				}
				slot0.last_chapter_id = slot8.id
				slot3 = slot3 + 1

				uv1(slot0.chapter_show_data[slot9].chapter_datas, slot8)
			elseif #slot0.chapter_show_data[slot9].chapter_datas >= 6 then
				slot0.chapter_show_data[slot9 + 1] = {}
				slot0.chapter_show_data[slot9 + 1].chapter_datas = {}
				slot0.chapter_show_data[slot9 + 1].index = slot9 + 1
				slot0.last_chapter_id = slot8.id
				slot3 = slot3 + 1

				uv1(slot0.chapter_show_data[slot9 + 1].chapter_datas, slot8)
			else
				slot0.last_chapter_id = slot8.id
				slot3 = slot3 + 1

				uv1(slot0.chapter_show_data[slot9].chapter_datas, slot8)
			end
		end
	end

	if slot0.chapter_scrollview then
		slot4 = #slot0.chapter_show_data
		slot5 = slot4 * HeavenConst.Chapter_List_Height + HeavenConst.Chapter_List_Bottom + 20

		if slot0.chapter_show_data[slot4] and #slot0.chapter_show_data[slot4].chapter_datas < 5 then
			slot5 = #slot0.chapter_show_data[slot4].chapter_datas < 3 and slot5 - HeavenConst.Chapter_List_Height * 2 / 3 or slot5 - HeavenConst.Chapter_List_Height / 3
		end

		if slot1 then
			slot0.chapter_scrollview:reloadData(nil, {
				container_height = slot5
			}, false)

			slot6 = 100

			if slot2 > 3 then
				slot6 = 100 - math.ceil(slot2 / 2) / math.ceil(slot3 / 2) * 100 > 20 and slot6 + (HeavenConst.Chapter_List_Bottom + 150) / slot5 * 100 or 0
			end

			slot0.chapter_scrollview:scrollToPercentVertical(slot6, 0.1)
		else
			slot0.chapter_scrollview:reloadData(nil, {
				container_height = slot5
			}, true)
		end
	end
end

function HeavenDungeonPanel.createMapBgList(slot0)
	if slot0.map_bg_scrollview then
		return
	end

	slot0.map_bg_scrollview = CommonScrollViewSingleLayout.new(slot0.map_layer, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.bottom, slot0.map_layer:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 720,
		item_height = 1280,
		space_y = 0,
		col = 1,
		need_dynamic = true
	}, cc.p(0, 0))

	slot0.map_bg_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createCellMapBg), ScrollViewFuncType.CreateNewCell)
	slot0.map_bg_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCellMapBg), ScrollViewFuncType.NumberOfCells)
	slot0.map_bg_scrollview:setBounceEnabled(false)
	slot0.map_bg_scrollview:reloadData()
end

function HeavenDungeonPanel.createCellMapBg(slot0)
	return createImage(nil, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_85", true), nil, nil, cc.p(0.5, 0.5), false, 0, false)
end

function HeavenDungeonPanel.numberOfCellMapBg(slot0)
	slot1 = 0

	if slot0.chapter_innercontainer then
		slot1 = math.ceil(slot0.chapter_innercontainer:getContentSize().height / slot0.move_speed / 1280) + 1
	end

	return slot1
end

function HeavenDungeonPanel.createCapterList(slot0)
	if slot0.chapter_scrollview then
		return
	end

	slot1 = slot0.chapter_list:getContentSize()
	slot0.chapter_scrollview = CommonScrollViewSingleLayout.new(slot0.chapter_list, cc.p(0, 280), ScrollViewDir.vertical, ScrollViewStartPos.bottom, cc.size(slot1.width, slot1.height - 450), {
		start_y = 20,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 720,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_height = HeavenConst.Chapter_List_Height,
		checkovercallback = handler(slot0, slot0.checkOverShowByVertical)
	})

	slot0.chapter_scrollview:setSwallowTouches(true)
	slot0.chapter_scrollview:setBounceEnabled(false)

	slot0.chapter_innercontainer = slot0.chapter_scrollview:getContainer()

	slot0.chapter_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createChapterCell), ScrollViewFuncType.CreateNewCell)
	slot0.chapter_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfChapterCells), ScrollViewFuncType.NumberOfCells)
	slot0.chapter_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateChapterCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function HeavenDungeonPanel.createChapterCell(slot0)
	return HeavenMainChapter.new()
end

function HeavenDungeonPanel.numberOfChapterCells(slot0)
	if not slot0.chapter_show_data then
		return 0
	end

	return #slot0.chapter_show_data
end

function HeavenDungeonPanel.updateChapterCellByIndex(slot0, slot1, slot2)
	if not slot0.chapter_show_data then
		return
	end

	if not slot0.chapter_show_data[slot2] then
		return
	end

	slot1:setExtendData(slot0.last_chapter_id)
	slot1:setData(slot3)
end

function HeavenDungeonPanel.checkOverShowByVertical(slot0)
	if slot0.map_bg_scrollview and slot0.map_bg_scrollview:getContainer() then
		slot2:setPositionY(slot0.chapter_innercontainer:getPositionY() / slot0.move_speed)
		slot0.map_bg_scrollview:checkOverShowByVerticalBottom()
	end
end

function HeavenDungeonPanel.refreshLeftCount(slot0)
	if Config.DungeonHeavenData.data_const.refresh_number then
		slot0.count_label:setString(uv0:getLeftChallengeCount() .. "/" .. slot1.val)
	end
end

function HeavenDungeonPanel.register_event(slot0)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.DungeonHeavenData.data_const.dunheaven_rule then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition())
		end
	end, true)
	registerButtonEventListener(slot0.btn_rank, function ()
		uv0:openHeavenRankWindow(true)
	end, true)
	registerButtonEventListener(slot0.btn_shop, function ()
		SuitShopController:getInstance():openSuitShopMainView(true)
	end, true)
	registerButtonEventListener(slot0.btn_book, function ()
		HeroController:getInstance():openHeroClothesLustratWindow(true)
	end, true)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:_onClickAddCountBtn()
	end, true)

	if not slot0.get_chapter_data_event then
		slot0.get_chapter_data_event = GlobalEvent:getInstance():Bind(HeavenEvent.Get_Chapter_Data_Event, function ()
			uv0:updateChapterShowData()
			uv0:refreshLeftCount()
			uv0:updateLeftBuyCount()
		end)
	end

	if not slot0.update_chapter_count_event then
		slot0.update_chapter_count_event = GlobalEvent:getInstance():Bind(HeavenEvent.Update_Chapter_Count_Event, function ()
			uv0:refreshLeftCount()
			uv0:updateLeftBuyCount()
		end)
	end

	if not slot0.add_chapter_data_event then
		slot0.add_chapter_data_event = GlobalEvent:getInstance():Bind(HeavenEvent.Add_Chapter_Data_Event, function ()
			uv0:updateChapterShowData()
		end)
	end
end

function HeavenDungeonPanel._onClickAddCountBtn(slot0)
	if not Config.DungeonHeavenData.data_const.refresh_number then
		return
	end

	if slot1.val <= uv0:getLeftChallengeCount() then
		message(TI18N("当前挑战次数已满"))

		return
	end

	if Config.DungeonHeavenData.data_count_buy[uv0:getTodayBuyCount() + 1] then
		if slot4.limit_vip <= RoleController:getInstance():getRoleVo().vip_lev then
			CommonAlert.show(string.format(TI18N("是否消耗<img src=%s visible=true scale=0.3 />%d购买一次挑战次数？"), PathTool.getItemRes(3), slot4.cost), TI18N("确定"), function ()
				uv0:sender25207()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			message(TI18N("提升VIP等级可增加购买次数"))
		end
	else
		message(TI18N("今日购买次数已用完"))
	end
end

function HeavenDungeonPanel.updateLeftBuyCount(slot0)
	if not slot0.left_buy_count then
		slot0.left_buy_count = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(590, 6))

		slot0.bottom_panel:addChild(slot0.left_buy_count)
	end

	slot0.left_buy_count:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>(剩余购买次数:</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>)</div>"), uv0:getTodayLeftBuyCount()))
end

function HeavenDungeonPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.get_chapter_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_chapter_data_event)

		slot0.get_chapter_data_event = nil
	end

	if slot0.update_chapter_count_event then
		GlobalEvent:getInstance():UnBind(slot0.update_chapter_count_event)

		slot0.update_chapter_count_event = nil
	end

	if slot0.add_chapter_data_event then
		GlobalEvent:getInstance():UnBind(slot0.add_chapter_data_event)

		slot0.add_chapter_data_event = nil
	end

	if slot0.map_bg_scrollview then
		slot0.map_bg_scrollview:DeleteMe()

		slot0.map_bg_scrollview = nil
	end

	if slot0.chapter_scrollview then
		slot0.chapter_scrollview:DeleteMe()

		slot0.chapter_scrollview = nil
	end
end
