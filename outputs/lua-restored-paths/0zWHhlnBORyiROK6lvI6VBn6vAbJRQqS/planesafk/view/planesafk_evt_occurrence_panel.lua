PlanesafkEvtOccurrencePanel = PlanesafkEvtOccurrencePanel or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function PlanesafkEvtOccurrencePanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "planesafk/planesafk_evt_occurrence_panel"
	slot0.res_list = {}
	slot0.dic_other_hero = {}
end

function PlanesafkEvtOccurrencePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("矿点"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")
	slot0.bg_tips = slot0.main_container:getChildByName("bg_tips")

	if Config.SecretDunData.data_const.filter_condition then
		slot0.bg_tips:setString(slot1.desc)
	else
		slot0.bg_tips:setString("")
	end

	slot0.bg_tips_0 = slot0.main_container:getChildByName("bg_tips_0")

	slot0.bg_tips_0:setString(TI18N("奖励"))

	slot0.item_scrollview = slot0.bottom_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
end

function PlanesafkEvtOccurrencePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	slot0:addGlobalEvent(PlanesEvent.Get_All_Hero_Event, function ()
		uv1:setData(uv0:getAllPlanesHeroData())
	end)
	slot0:addGlobalEvent(PlanesEvent.Look_Other_Hero_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.is_ther_send = false
		uv0.dic_other_hero[slot0.pos] = slot0
	end)
end

function PlanesafkEvtOccurrencePanel.onClickBtnClose(slot0)
	uv0:openPlanesafkEvtOccurrencePanel(false)
end

function PlanesafkEvtOccurrencePanel.openRootWnd(slot0, slot1)
	slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, {
		{
			1,
			2
		},
		{
			3,
			4
		}
	}, {
		scale = 0.6,
		max_count = 3
	})

	slot0:setData()
end

function PlanesafkEvtOccurrencePanel.setData(slot0, slot1)
	slot0.hero_list = slot1 or {}

	uv0(slot0.hero_list, SortTools.tableCommonSorter({
		{
			"star",
			true
		},
		{
			"power",
			true
		},
		{
			"partner_id",
			false
		}
	}))
	slot0:updateList()
end

function PlanesafkEvtOccurrencePanel.updateList(slot0)
	if slot0.list_scrollview == nil then
		slot0.list_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			space_x = 0,
			item_width = 119,
			item_height = 142,
			space_y = 0,
			col = 5
		}, cc.p(0, 0))

		slot0.list_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.hero_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无英雄数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.list_scrollview:reloadData()
end

function PlanesafkEvtOccurrencePanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot4 = HeroExhibitionItem.new(0.9, true)

	slot4:setPosition(slot1 * 0.5, slot2 * 0.5 + 15)
	slot3:addChild(slot4)
	slot3:setCascadeOpacityEnabled(true)
	slot3:setAnchorPoint(0, 0)
	slot3:setContentSize(cc.size(slot1, slot2))

	slot3.hero_item = slot4

	slot3.hero_item:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function PlanesafkEvtOccurrencePanel.numberOfCells(slot0)
	if not slot0.hero_list then
		return 0
	end

	return #slot0.hero_list
end

function PlanesafkEvtOccurrencePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.hero_list[slot2] then
		slot1.hero_item:setData(slot3)
		slot1.hero_item:showProgressbarStatus(true, slot3.hp_per, "", {
			y = -15
		})

		if slot3.hp_per == 0 then
			slot1.hero_item:showStrTips(true, TI18N("已阵亡"))
		else
			slot1.hero_item:showStrTips(false)
		end

		if slot3.flag == 0 then
			slot1.hero_item:showHelpImg(false)
		else
			slot1.hero_item:showHelpImg(true)
		end
	end
end

function PlanesafkEvtOccurrencePanel.onCellTouched(slot0, slot1)
	index = slot1.index

	if slot0.hero_list[index] then
		if slot2.flag == 0 then
			if HeroController:getInstance():getModel():getHeroById(slot2.partner_id) and next(slot3) ~= nil then
				HeroController:getInstance():openHeroTipsPanel(true, slot3)
			else
				message(TI18N("该英雄来自异域，无法查看"))
			end
		elseif slot0.dic_other_hero[slot2.partner_id] then
			HeroController:getInstance():openHeroTipsPanel(true, slot0.dic_other_hero[slot2.partner_id])
		else
			if slot0.is_ther_send then
				return
			end

			slot0.is_ther_send = true

			PlanesafkController:getInstance():sender28623(slot2.partner_id)
		end
	end
end

function PlanesafkEvtOccurrencePanel.close_callback(slot0)
	if slot0.list_scrollview then
		slot0.list_scrollview:DeleteMe()
	end

	slot0.list_scrollview = nil

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	uv0:openPlanesafkEvtOccurrencePanel(false)
end
