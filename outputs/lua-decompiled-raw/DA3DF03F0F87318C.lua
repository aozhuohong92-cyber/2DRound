slot1 = PlanesafkController:getInstance():getModel()
slot2 = string.format
PlanesafkBoardWindow = PlanesafkBoardWindow or BaseClass(BaseView)

function PlanesafkBoardWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "planes/planes_board_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("planes", "planes_map"),
			type = ResourcesType.plist
		}
	}
	slot0.dic_other_hero = {}
end

function PlanesafkBoardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.win_title = slot1:getChildByName("win_title")
	slot0.btn_comfirm = slot1:getChildByName("btn_comfirm")
	slot0.btn_comfirm_label = slot0.btn_comfirm:getChildByName("label")
	slot0.board_sp = slot1:getChildByName("board_sp")
	slot0.title_txt = slot1:getChildByName("title_txt")
	slot0.main_con_size = slot1:getContentSize()
	slot0.scroll_container = slot1:getChildByName("scroll_container")
end

function PlanesafkBoardWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.btn_comfirm, handler(slot0, slot0.onClickComfirmBtn), true)
	slot0:addGlobalEvent(PlanesafkEvent.Get_Hero_Live_Event, function (slot0)
		uv1:setListData(uv0:getAllPlanesHeroData())
	end)
	slot0:addGlobalEvent(PlanesafkEvent.Look_Other_Hero_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.is_ther_send = false
		uv0.dic_other_hero[slot0.pos] = slot0
	end)
end

function PlanesafkBoardWindow.onClickCloseBtn(slot0)
	uv0:openPlanesafkBoardWindow(false)
end

function PlanesafkBoardWindow.onClickComfirmBtn(slot0)
	if not slot0.board_id or not slot0.data then
		return
	end

	if slot0.board_show_type == 2 then
		return
	end

	if slot0.board_id == PlanesafkConst.Recover_Id or slot0.board_id == PlanesafkConst.Revive_Id then
		if slot0.board_id == PlanesafkConst.Recover_Id and not uv0:checkIsHaveHpNotFullHero() then
			CommonAlert.show(TI18N("当前所有非阵亡英雄均满血，使用回复泉水将不会有效，是否继续？"), TI18N("确认"), function ()
				uv0:sender28600(uv1.data.line, uv1.data.index, 1, {})
			end, TI18N("取消"))
		elseif slot0.board_id == PlanesafkConst.Revive_Id and not uv0:checkIsHaveDieHero() then
			CommonAlert.show(TI18N("当前无阵亡英雄且存活的英雄均满血，使用复活十字架将不会有效，是否继续？"), TI18N("确认"), function ()
				uv0:sender28600(uv1.data.line, uv1.data.index, 1, {})
			end, TI18N("取消"))
		else
			uv1:sender28600(slot0.data.line, slot0.data.index, 1, {})
		end
	end

	uv1:openPlanesafkBoardWindow(false)
end

function PlanesafkBoardWindow.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.board_id = slot1
	slot0.data = slot2
	slot3 = slot3 or {}
	slot0.board_show_type = slot3.show_type or 1
	slot0.board_cfg = slot3.board_cfg

	slot0:setData(slot1)

	if uv0:getAllPlanesHeroData() == nil or next(slot4) == nil then
		uv1:sender28613()
	else
		slot0:setListData(slot4)
	end

	if uv1:getMapEvtData(slot0.data.line, slot0.data.index) and slot5.is_black then
		slot0.btn_comfirm:setVisible(false)
	end
end

function PlanesafkBoardWindow.setListData(slot0, slot1)
	slot0.hero_list = slot1 or {}

	table.sort(slot0.hero_list, SortTools.tableCommonSorter({
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

function PlanesafkBoardWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.board_cfg == nil then
		slot2 = Config.SecretDunData.data_board[slot1]
	end

	if not slot2 then
		return
	end

	if slot2.btn_str ~= "" then
		slot0.btn_comfirm:setVisible(true)
		slot0.btn_comfirm_label:setString(slot2.btn_str)
	else
		slot0.btn_comfirm:setVisible(false)
	end

	slot0.win_title:setString(slot2.title)

	if slot0.board_show_type == 2 then
		slot0.board_img_load = loadSpriteTextureFromCDN(slot0.board_sp, uv0("resource/planes/board_img/%s.png", slot2.res_id), ResourcesType.single, slot0.board_img_load)
	else
		slot0.board_img_load = loadSpriteTextureFromCDN(slot0.board_sp, uv0("resource/planes/board_img/%s.png", slot2.res_id), ResourcesType.single, slot0.board_img_load)
	end

	slot0.title_txt:setString(slot2.title)
	slot0.title_txt:setTextColor(cc.c4b(144, 93, 56, 255))

	if not slot0.desc_txt_1 then
		slot0.desc_txt_1 = createRichLabel(24, cc.c4b(144, 93, 56, 255), cc.p(0.5, 1), cc.p(slot0.main_con_size.width * 0.5, 567), 0, 0, slot0.main_con_size.width - 80)

		slot0.main_container:addChild(slot0.desc_txt_1)
	end

	slot0.desc_txt_1:setString(slot2.desc_1)
end

function PlanesafkBoardWindow.updateList(slot0)
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

function PlanesafkBoardWindow.createNewCell(slot0, slot1, slot2)
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

function PlanesafkBoardWindow.numberOfCells(slot0)
	if not slot0.hero_list then
		return 0
	end

	return #slot0.hero_list
end

function PlanesafkBoardWindow.updateCellByIndex(slot0, slot1, slot2)
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

function PlanesafkBoardWindow.onCellTouched(slot0, slot1)
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

function PlanesafkBoardWindow.close_callback(slot0)
	if slot0.board_img_load then
		slot0.board_img_load:DeleteMe()

		slot0.board_img_load = nil
	end

	uv0:openPlanesafkBoardWindow(false)
end
