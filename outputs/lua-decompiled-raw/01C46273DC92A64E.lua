PlanesafkItemUsePanel = PlanesafkItemUsePanel or BaseClass(BaseView)
slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = math.ceil

function PlanesafkItemUsePanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "planesafk/planesafk_item_use_panel"
	slot0.res_list = {}
	slot0.dic_other_hero = {}
	slot0.item_id = 10034

	if Config.PlanesData.data_const.planes_forever_rock_itemid then
		slot0.item_id = slot1.val
	end
end

function PlanesafkItemUsePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("生命金卡"))

	slot0.scroll_container = slot0.main_container:getChildByName("scroll_container")

	slot0.main_container:getChildByName("bg_tips"):setString("")

	slot2 = 1300

	if Config.PlanesData.data_const.planes_spar_atk_radio then
		slot2 = slot3.val
	end

	slot4 = (slot2 - 1000) / 10
	slot0.per = slot4
	slot0.bg_tips = createRichLabel(22, cc.c3b(90, 58, 38), cc.p(0, 1), cc.p(105, 555), 5, nil, 540)

	slot0.main_container:addChild(slot0.bg_tips)
	slot0.bg_tips:setString(uv0(TI18N("消耗一颗生命金卡,恢复下列英雄全部生命和复活所有已经阵亡的英雄,且下一场战斗所有英雄攻击力增加%s%%"), slot4))

	slot0.bg_tips2 = createRichLabel(22, cc.c3b(36, 144, 3), cc.p(0.5, 1), cc.p(339, -10), 5, nil, 600)

	slot0.main_container:addChild(slot0.bg_tips2)
	slot0.bg_tips2:setString(TI18N("攻击力增加效果仅在下一场战斗生效一次"))

	slot5 = slot0.main_container:getChildByName("buy_panel")
	slot0.key = slot5:getChildByName("key")

	slot0.key:setString(TI18N("拥有:"))

	slot0.icon = slot5:getChildByName("icon")
	slot0.label = slot5:getChildByName("label")

	if Config.ItemData.data_get_data(slot0.item_id) then
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE)
	end

	slot0:updateCount()

	slot0.plus_btn = slot0.main_container:getChildByName("plus_btn")
	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")
	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("取 消"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("确 定"))

	slot7 = createImage(slot0.main_container, nil, 0, 0, cc.p(0, 0.5), false, 1)

	slot7:setCapInsets(cc.rect(24, 24, 107, 89))
	slot7:setAnchorPoint(0.5, 0)
	slot7:setScaleX(0.94)
	slot7:setPosition(cc.p(slot0.main_container:getContentSize().width / 2, -50))

	slot0.line_load = loadImageTextureFromCDN(slot7, PathTool.getPlistImgForDownLoad("bigbg/pattern", "pattern_3"), ResourcesType.single, slot0.line_load)
end

function PlanesafkItemUsePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if Config.PlanesData.data_const.planes_forever_dock_desc then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, false, 1)
	registerButtonEventListener(slot0.plus_btn, function (slot0, slot1, slot2)
		if uv0.item_id then
			BackpackController:getInstance():openTipsSource(true, uv0.item_id)
		end
	end, false, 1)
	slot0:addGlobalEvent(PlanesafkEvent.Get_All_Hero_Event, function ()
		uv1:setData(uv0:getAllPlanesHeroData())
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Look_Other_Hero_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.is_ther_send = false
		uv0.dic_other_hero[slot0.pos] = slot0
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Get_Hero_Live_Event, function (slot0)
		uv1:setData(uv0:getAllPlanesHeroData())
	end)
	slot0:addGlobalEvent(BackpackEvent.BACKPACK_USE_ITEM_EVENT, function (slot0)
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0)
		if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
			uv0:updateCount()
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0)
		if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
			uv0:updateCount()
		end
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0)
		if slot0 ~= BackPackConst.Bag_Code.EQUIPS then
			uv0:updateCount()
		end
	end)
end

function PlanesafkItemUsePanel.updateCount(slot0)
	if not slot0.item_id then
		return
	end

	if not slot0.label then
		return
	end

	slot0.label:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_id))
end

function PlanesafkItemUsePanel.onClickBtnClose(slot0)
	uv0:openPlanesafkItemUsePanel(false)
end

function PlanesafkItemUsePanel.onClickBtnRight(slot0)
	if not slot0.hero_list then
		return
	end

	slot1 = true

	for slot5, slot6 in ipairs(slot0.hero_list) do
		if slot6.hp_per < 100 then
			slot1 = false
		end
	end

	if slot1 then
		message("暂无受伤英雄数据")

		return
	end

	slot2 = Config.ItemData.data_get_data(slot0.item_id)

	if BackpackController:getInstance():getModel():getItemNumByBid(slot0.item_id) <= 0 then
		BackpackController:getInstance():openTipsSource(true, slot2)

		return
	end

	if slot2 then
		CommonAlert.show(uv0(TI18N("是否花费一个 <img src='%s' scale=0.4 /> 恢复所有英雄生命和复活所有已阵亡的英雄,且下一场战斗所有英雄攻击力增加%s%%"), PathTool.getItemRes(slot2.icon), slot0.per or 30), TI18N("确定"), function ()
			BackpackController:getInstance():sender10515(BackpackController:getInstance():getModel():getBackPackItemIDByBid(uv0.item_id), 1)
		end, TI18N("取消"), nil, CommonAlert.type.rich, nil, , 24)
	end
end

function PlanesafkItemUsePanel.openRootWnd(slot0, slot1)
	if uv0:getAllPlanesHeroData() == nil or next(slot2) == nil then
		uv1:sender28613()
	else
		slot0:setData(slot2)
	end
end

function PlanesafkItemUsePanel.setData(slot0, slot1)
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

function PlanesafkItemUsePanel.updateList(slot0)
	if slot0.item_scrollview == nil then
		slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.scroll_container, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.scroll_container:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 2,
			row = 1,
			space_x = 0,
			item_width = 140,
			item_height = 150,
			space_y = 0,
			col = 4
		}, cc.p(0, 0))

		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	if #slot0.hero_list == 0 then
		commonShowEmptyIcon(slot0.scroll_container, true, {
			text = TI18N("暂无英雄数据")
		})
	else
		commonShowEmptyIcon(slot0.scroll_container, false)
	end

	slot0.item_scrollview:reloadData(nil, , true)
end

function PlanesafkItemUsePanel.createNewCell(slot0, slot1, slot2)
	slot3 = ccui.Widget:create()
	slot4 = HeroExhibitionItem.new(1, true)

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

function PlanesafkItemUsePanel.numberOfCells(slot0)
	if not slot0.hero_list then
		return 0
	end

	return #slot0.hero_list
end

function PlanesafkItemUsePanel.updateCellByIndex(slot0, slot1, slot2)
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

function PlanesafkItemUsePanel.onCellTouched(slot0, slot1)
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

			uv0:sender28623(slot2.partner_id)
		end
	end
end

function PlanesafkItemUsePanel.close_callback(slot0)
	if slot0.line_load then
		slot0.line_load:DeleteMe()
	end

	slot0.line_load = nil

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openPlanesafkItemUsePanel(false)
end
