FruitTreasureMainView = FruitTreasureMainView or BaseClass(BaseView)
slot0 = FruitTreasureController:getInstance()
slot1 = FruitTreasureController:getInstance():getModel()
slot2 = string.format

function FruitTreasureMainView.ctor(slot0, slot1)
	slot0:configUI()
	slot0:_CreateComponent()
	slot0:register_event()
end

function FruitTreasureMainView.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "fruit_treasure/fruit_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("yanfubaoshu", "yanfubaoshu"),
			type = ResourcesType.plist
		}
	}
	slot0.col = 1
	slot0.item_width = 220
	slot0.item_height = 225
	slot0.cacheList = {}
	slot0.cacheMaxSize = 0
	slot0.base_list = {}
	slot0.ismoving = false
	slot0.isopen = true
end

function FruitTreasureMainView.open_callback(slot0)
	uv0:send29607()
	uv0:sender29620()

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.mainContainer = slot0.root_wnd:getChildByName("n_ui")
	slot1 = slot0.mainContainer:getChildByName("n_top")
	slot2 = slot0.mainContainer:getChildByName("n_bottom")
	slot4 = slot1:getChildByName("n_tag"):getChildByName("list_tag")
	slot0.type_btn_list = {
		[FruitTreasureConst.Type.Tian] = slot4:getChildByName("b_1"),
		[FruitTreasureConst.Type.Di] = slot4:getChildByName("b_2"),
		[FruitTreasureConst.Type.Xuan] = slot4:getChildByName("b_3"),
		[FruitTreasureConst.Type.Huang] = slot4:getChildByName("b_4")
	}
	slot0.close_btn = slot2:getChildByName("b_close")
	slot0.node_prop = slot2:getChildByName("n_prop")
	slot0.btn_show_on = slot0.node_prop:getChildByName("b_prop")
	slot0.btnRule = slot1:getChildByName("btnRule")
	slot0.btn_chips_bag = slot1:getChildByName("b_chips")
	slot0.btn_pass = slot1:getChildByName("b_pass")
	slot0.btn_pass_red = slot0.btn_pass:getChildByName("tips")
	slot0.txt_power = CommonNum.new(20, slot0.node_prop:getChildByName("n_prop_0"):getChildByName("list_exist"):getChildByName("power_click"), 1, -2, cc.p(0.5, 0.5))

	slot0.txt_power:setPosition(cc.p(108, 26))
	slot0.node_prop:setPositionX(940)
	slot0.btn_show_on:setVisible(true)

	slot0.lay_scrollview = slot0.mainContainer:getChildByName("lay_scrollview")
	slot0.scroll_height = display.getTop(slot0.mainContainer) - display.getBottom(slot0.mainContainer)

	slot1:setPositionY(display.getTop(slot0.mainContainer))
	slot0:updateTowerList(true)
	slot0:clickTopBtn(FruitTreasureConst.Type.Tian)
	uv1:checkFruitTreasureRedStatus()
end

function FruitTreasureMainView.configUI(slot0)
end

function FruitTreasureMainView._CreateComponent(slot0)
end

function FruitTreasureMainView.register_event(slot0)
	for slot4, slot5 in pairs(slot0.type_btn_list) do
		registerButtonEventListener(slot5, function ()
			uv0:clickTopBtn(uv1)
		end, true, 2)
	end

	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 1)
	registerButtonEventListener(slot0.btn_show_on, handler(slot0, slot0.onClickAllprop), true, 1)
	registerButtonEventListener(slot0.btn_chips_bag, function ()
		uv0:openFruitTreasureChipBagView(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_pass, function ()
		uv0:OpenFruitTreasurePassView(true)
	end, true, 1)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureAttrs, function (slot0)
		uv0:UpdateViewInfo(slot0)
	end)
	registerButtonEventListener(slot0.btnRule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.BlastiaData.data_get_rules[1].content, slot1:getTouchBeganPosition())
	end, true, 1)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureAll, function (slot0)
		uv0:onSetItemInfo(slot0)
	end)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasureRed, function (slot0, slot1)
		uv0:onSetItemRed(slot0, slot1)
	end)
	slot0:addGlobalEvent(FruitTreasureEvent.UpdateFruitTreasurePassRed, function (slot0)
		uv0.btn_pass_red:setVisible(slot0)
	end)
end

function FruitTreasureMainView.clickTopBtn(slot0, slot1)
	for slot5 in pairs(slot0.type_btn_list) do
		slot0.type_btn_list[slot5]:getChildByName("n_select"):setVisible(false)
	end

	slot0.type_btn_list[slot1]:getChildByName("n_select"):setVisible(true)
	slot0:turnToView(slot1)
end

function FruitTreasureMainView.turnToView(slot0, slot1)
	slot2 = 0

	for slot6 = #uv0.alllist, 1, -1 do
		if uv0.alllist[slot6].type == slot1 + 1 then
			slot0.list_view:jumpToMoveByY(slot6 * slot0.list_view.item_height, 0.1)

			return
		end
	end
end

function FruitTreasureMainView.UpdateViewInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot0.node_prop:getChildByName("list_exist")
	slot3 = slot0.node_prop:getChildByName("list_prop2")

	slot0.txt_power:setNum(slot1.power * 5)

	for slot8, slot9 in pairs(slot1.attrs) do
		if slot9.attr_id == 104 then
			slot4[1] = slot9 or 0
		elseif slot9.attr_id == 101 then
			slot4[2] = slot9 or 0
		elseif slot9.attr_id == 107 then
			slot4[3] = slot9 or 0
		elseif slot9.attr_id == 106 then
			slot4[4] = slot9 or 0
		end
	end

	slot5 = 4
	slot6 = 1

	if {
		0,
		0,
		0,
		0
	} then
		for slot10, slot11 in ipairs(slot4) do
			if slot11 ~= 0 then
				if slot5 < slot6 then
					break
				end

				slot14 = slot11.attr_val

				if Config.AttrData.data_key_to_name[Config.AttrData.data_id_to_key[slot11.attr_id]] then
					if not slot0.base_list[slot6] then
						slot0.base_list[slot6] = createRichLabel(20, cc.c4b(193, 183, 171, 255), cc.p(0, 0.5), cc.p(20, 0), nil, nil, 380)

						slot3:addChild(slot0.base_list[slot6])
					end

					slot0.base_list[slot6]:setPositionY(200 - slot6 * 40 - 10)

					slot18 = PathTool.getAttrIconByStr(slot13)

					if PartnerCalculate.isShowPerByStr(slot13) == true then
						slot14 = slot14 / 10 .. "%"
					end

					slot16:setString(uv0("<img src='%s' scale=1 /> <div fontcolor=#c1b7ab> %s：</div><div fontcolor=#ffeedd>%s</div>", PathTool.getResFrame("common", slot18), slot15, slot14))

					slot6 = slot6 + 1
				end
			end
		end
	end
end

function FruitTreasureMainView.onClickAllprop(slot0)
	if slot0.ismoving then
		return
	end

	slot1 = nil
	slot2 = 1

	if slot0.isopen then
		slot1 = cc.MoveTo:create(0.6, cc.p(715, 355))
		slot2 = -1
	else
		slot1 = cc.MoveTo:create(0.6, cc.p(940, 355))
		slot2 = 1
	end

	slot0.ismoving = true

	slot0.node_prop:runAction(cc.Sequence:create(cc.Spawn:create(cc.EaseBackOut:create(slot1)), cc.CallFunc:create(function ()
		uv0.ismoving = false
		uv0.isopen = not uv0.isopen

		uv0.btn_show_on:setScaleX(uv1)
	end)))
end

function FruitTreasureMainView.updateTowerList(slot0, slot1)
	slot0.max_count = #uv0.alllist

	if not slot0.list_view then
		slot0.list_view = FruitTreasureTreeList.new(slot0.lay_scrollview, cc.p(SCREEN_WIDTH / 2, display.getBottom(slot0.mainContainer)), cc.size(SCREEN_WIDTH, slot0.scroll_height))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
		slot0.list_view:setInnerContainer()

		if GuideController:getInstance():isInGuide() then
			slot0.list_view:setClickEnabled(false)
		end
	end

	if slot1 and not slot0.is_init_list then
		slot0.is_init_list = true

		slot0.list_view:reloadData(1)
	end
end

function FruitTreasureMainView.createNewCell(slot0)
	slot1 = FruitTreasureMapItem.new()

	slot1:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot1
end

function FruitTreasureMainView.numberOfCells(slot0)
	return slot0.max_count or 0
end

function FruitTreasureMainView.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot2)
end

function FruitTreasureMainView.onCellTouched(slot0, slot1)
end

function FruitTreasureMainView.clickFun(slot0, slot1)
	if not slot1 then
		return
	end

	uv0:openStarTowerMainView(true, slot1)
end

function FruitTreasureMainView._LoadSummonBg(slot0, slot1)
end

function FruitTreasureMainView._UpdateSummonPropCnt(slot0)
end

function FruitTreasureMainView._SetBtnClickedCD(slot0, slot1)
end

function FruitTreasureMainView.setVisibleStatus(slot0, slot1)
end

function FruitTreasureMainView.onSetItemInfo(slot0, slot1)
	for slot5, slot6 in pairs(slot0.list_view.cellList) do
		for slot10, slot11 in pairs(slot6.cell.itemList) do
			if slot11.data and slot11.data.id == slot1.id then
				slot11:setData(uv0:getItemInfo(slot1.id))
			end
		end
	end
end

function FruitTreasureMainView.onSetItemRed(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.list_view.cellList) do
		for slot11, slot12 in pairs(slot7.cell.itemList) do
			if slot12.data and slot12.data.id == slot1 then
				slot12:setRedStatus(slot2)
			end
		end
	end
end

function FruitTreasureMainView.onClickCloseBtn(slot0)
	uv0:openMainView(false)
end

function FruitTreasureMainView.DeleteMe(slot0)
end

function FruitTreasureMainView.close_callback(slot0)
	uv0:openMainView(false)

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end
end
