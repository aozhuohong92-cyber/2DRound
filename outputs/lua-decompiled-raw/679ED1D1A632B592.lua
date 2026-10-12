slot1 = HomeworldController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
HomeworldFigureWindow = HomeworldFigureWindow or BaseClass(BaseView)

function HomeworldFigureWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "homeworld/homeworld_figure_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_3"),
			type = ResourcesType.single
		}
	}
end

function HomeworldFigureWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_container:getChildByName("win_title"):setString(TI18N("更换家园形象"))

	slot0.name_txt = slot0.main_container:getChildByName("name_txt")
	slot0.lock_con_txt = slot0.main_container:getChildByName("lock_con_txt")
	slot0.soft_val_txt = slot0.main_container:getChildByName("soft_val_txt")
	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.btn_unlock = slot0.main_container:getChildByName("btn_unlock")
	slot1 = slot0.btn_unlock:getContentSize()
	slot0.btn_unlock_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(slot1.width * 0.5, slot1.height * 0.5))

	slot0.btn_unlock:addChild(slot0.btn_unlock_label)

	slot0.btn_chose = slot0.main_container:getChildByName("btn_chose")
	slot0.btn_chose_lab = slot0.btn_chose:getChildByName("label")

	slot0.btn_chose_lab:setString(TI18N("确认更换"))

	slot2 = slot0.main_container:getChildByName("list_panel")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 10,
		row = 0,
		start_x = 26,
		space_x = 15,
		item_width = 119,
		item_height = 119,
		space_y = 10,
		col = 2,
		need_dynamic = true
	})

	slot0.item_scrollview:setSwallowTouches(false)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._onCellTouched), ScrollViewFuncType.OnCellTouched)
end

function HomeworldFigureWindow._createNewCell(slot0)
	slot1 = HomeworldFigureItem.new()

	slot1:addCallBack(handler(slot0, slot0._onClickItemCallBack))

	return slot1
end

function HomeworldFigureWindow._numberOfCells(slot0)
	if not slot0.figure_data then
		return 0
	end

	return #slot0.figure_data
end

function HomeworldFigureWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.figure_data then
		return
	end

	slot1.index = slot2

	if not slot0.figure_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function HomeworldFigureWindow._onCellTouched(slot0, slot1)
	if slot0.figure_data[slot1.index] then
		slot0:_onClickItemCallBack(slot1, slot2)
	end
end

function HomeworldFigureWindow._onClickItemCallBack(slot0, slot1, slot2)
	if slot0.cur_item then
		slot0.cur_item:setIsSelect(false)
	end

	slot1:setIsSelect(true)

	slot0.cur_item = slot1

	slot0:updateFigureInfo(slot2)
end

function HomeworldFigureWindow.updateFigureInfo(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.status == HomeworldConst.Figure_State.Unlock then
		slot0:showCucoloris(false)
		slot0:showFigureModel(true, slot1.look_id)
		slot0.name_txt:setString(slot1.name)
		slot0.name_txt:setVisible(true)
		slot0.lock_con_txt:setVisible(false)
		slot0.soft_val_txt:setVisible(false)
		slot0.btn_unlock:setVisible(false)

		if slot1.id == uv0:getMyCurHomeFigureId() then
			setChildUnEnabled(true, slot0.btn_chose)
			slot0.btn_chose:setTouchEnabled(false)
			slot0.btn_chose_lab:disableEffect(cc.LabelEffect.OUTLINE)
		else
			setChildUnEnabled(false, slot0.btn_chose)
			slot0.btn_chose:setTouchEnabled(true)
			slot0.btn_chose_lab:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	elseif slot1.status == HomeworldConst.Figure_State.CanUnlock then
		slot0:showCucoloris(true)
		slot0:showFigureModel(false)
		setChildUnEnabled(true, slot0.btn_chose)
		slot0.btn_chose:setTouchEnabled(false)
		slot0.btn_chose_lab:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_unlock:setVisible(true)
		addRedPointToNodeByStatus(slot0.btn_unlock, true, 7, 7)

		if slot1.loss[1] then
			if Config.ItemData.data_get_data(slot1.loss[1][1]) then
				slot0.btn_unlock_label:setString(uv1(TI18N("<img src='%s' scale=0.35 /><div outline=2,#020019>%d解锁</div>"), PathTool.getItemRes(slot4.icon), slot1.loss[1][2]))
			end
		end

		slot0.name_txt:setVisible(false)
		slot0.lock_con_txt:setVisible(false)
		slot0.soft_val_txt:setVisible(false)
	elseif slot1.status == HomeworldConst.Figure_State.Lock then
		slot0:showCucoloris(true)
		slot0:showFigureModel(false)
		setChildUnEnabled(true, slot0.btn_chose)
		slot0.btn_chose:setTouchEnabled(false)
		slot0.btn_chose_lab:disableEffect(cc.LabelEffect.OUTLINE)

		if slot1.tips ~= nil and slot1.tips ~= "" then
			slot0.name_txt:setString(slot1.tips)
			slot0.lock_con_txt:setVisible(false)
			slot0.soft_val_txt:setVisible(false)
			slot0.name_txt:setVisible(true)
		else
			slot0.lock_con_txt:setString(uv1(TI18N("家园舒适度达到%d"), slot1.open_soft))
			slot0.soft_val_txt:setString(uv1("%d/%d", uv0:getMaxComfortValue(), slot1.open_soft))
			slot0.lock_con_txt:setVisible(true)
			slot0.soft_val_txt:setVisible(true)
			slot0.name_txt:setVisible(false)
		end

		slot0.btn_unlock:setVisible(false)
	end
end

function HomeworldFigureWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openHomeworldFigureWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openHomeworldFigureWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_unlock, handler(slot0, slot0._onClickUnlockBtn), true)
	registerButtonEventListener(slot0.btn_chose, handler(slot0, slot0._onClickChoseBtn), true)
	slot0:addGlobalEvent(HomeworldEvent.Update_My_Figure_Data_Event, function (slot0)
		uv0:updateFigureList(slot0)
	end)
end

function HomeworldFigureWindow._onClickUnlockBtn(slot0)
	if not slot0.cur_item then
		return
	end

	if not slot0.cur_item:getData() then
		return
	end

	uv0:sender26006(slot1.id)
end

function HomeworldFigureWindow._onClickChoseBtn(slot0)
	if not slot0.cur_item then
		return
	end

	if not slot0.cur_item:getData() then
		return
	end

	if slot1.status == HomeworldConst.Figure_State.Unlock then
		if slot1.id == uv0:getMyCurHomeFigureId() then
			message(TI18N("与当前形象相同"))
		else
			uv1:sender26005(slot1.id)
			uv1:openHomeworldFigureWindow(false)
		end
	elseif slot1.status == HomeworldConst.Figure_State.CanUnlock then
		message(TI18N("请先激活该形象"))
	elseif slot1.status == HomeworldConst.Figure_State.Unlock then
		message(TI18N("该形象尚未解锁"))
	end
end

function HomeworldFigureWindow.openRootWnd(slot0)
	slot0:updateFigureList()
end

function HomeworldFigureWindow.updateFigureList(slot0, slot1)
	slot0.figure_data = {}

	for slot5, slot6 in pairs(Config.HomeData.data_figure) do
		slot7 = deepCopy(slot6)
		slot7.status = uv0:getFigureActiveStatus(slot7.id)

		uv1(slot0.figure_data, slot7)
	end

	table.sort(slot0.figure_data, SortTools.KeyUpperSorter("status"))

	slot2 = 1

	if slot1 then
		for slot6, slot7 in ipairs(slot0.figure_data) do
			if slot1 == slot7.id then
				slot2 = slot6

				break
			end
		end
	end

	slot0.item_scrollview:reloadData(slot2)
end

function HomeworldFigureWindow.showCucoloris(slot0, slot1)
	if slot1 == true then
		if not slot0.image_cucoloris then
			slot0.image_cucoloris = createImage(slot0.main_container, nil, 175, 322, cc.p(0.5, 0.5), false)
			slot0.image_load = loadImageTextureFromCDN(slot0.image_cucoloris, PathTool.getPlistImgForDownLoad("homeworld", "homeworld_big_bg_3"), ResourcesType.single, slot0.image_load)
		end

		slot0.image_cucoloris:setVisible(true)
	elseif slot0.image_cucoloris then
		slot0.image_cucoloris:setVisible(false)
	end
end

function HomeworldFigureWindow.showFigureModel(slot0, slot1, slot2)
	if slot1 and slot2 then
		if not slot0.cur_effect_id or slot0.cur_effect_id ~= slot2 then
			slot0.cur_effect_id = slot2

			slot0:removeRoleSpine()

			slot0.role_spine = createEffectSpine(slot2, cc.p(175, 210), cc.p(0.5, 0), true, PlayerAction.idle)

			slot0.main_container:addChild(slot0.role_spine)
		elseif slot0.role_spine then
			slot0.role_spine:setVisible(true)
		end
	elseif slot0.role_spine then
		slot0.role_spine:setVisible(false)
	end
end

function HomeworldFigureWindow.removeRoleSpine(slot0)
	if slot0.role_spine then
		slot0.role_spine:clearTracks()
		slot0.role_spine:removeFromParent()

		slot0.role_spine = nil
	end
end

function HomeworldFigureWindow.close_callback(slot0)
	slot0:removeRoleSpine()

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.image_load then
		slot0.image_load:DeleteMe()

		slot0.image_load = nil
	end

	uv0:openHomeworldFigureWindow(false)
end

HomeworldFigureItem = class("HomeworldFigureItem", function ()
	return ccui.Widget:create()
end)

function HomeworldFigureItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function HomeworldFigureItem.configUI(slot0)
	slot0.size = cc.size(119, 119)

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setPosition(cc.p(slot0.size.width * 0.5, slot0.size.height * 0.5))
	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.image_bg = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_1005"), slot0.size.width * 0.5, slot0.size.height * 0.5, cc.p(0.5, 0.5), true)
end

function HomeworldFigureItem.register_event(slot0)
	registerButtonEventListener(slot0.root_wnd, function ()
		if uv0.callback then
			uv0:callback(uv0.data)
		end
	end, true, 1, nil, , , true)

	if not slot0.update_red_status_event then
		slot0.update_red_status_event = GlobalEvent:getInstance():Bind(HomeworldEvent.Update_Red_Status_Data, function (slot0, slot1)
			if slot0 == HomeworldConst.Red_Index.Figure then
				uv0:updateFigureRedStatus()
			end
		end)
	end
end

function HomeworldFigureItem.updateFigureRedStatus(slot0)
	slot1 = false

	if slot0.data and uv0:getFigureActiveStatus(slot0.data.id) == HomeworldConst.Figure_State.CanUnlock then
		slot1 = true
	end

	addRedPointToNodeByStatus(slot0.root_wnd, slot1, 7, 7, 99)
end

function HomeworldFigureItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot0.figure_icon then
		slot0.figure_icon = createSprite(nil, slot0.size.width * 0.5, slot0.size.height * 0.5, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE)
	end

	if not slot0.cur_icon_id or slot0.cur_icon_id ~= slot1.ico_id then
		slot0.cur_icon_id = slot1.ico_id
		slot0.icon_load = loadSpriteTextureFromCDN(slot0.figure_icon, PathTool.getFigureIconRes(slot1.ico_id), ResourcesType.single, slot0.icon_load, nil, handler(slot0, slot0._onLoadIconCallback))
	else
		slot0:_onLoadIconCallback()
	end

	if slot1.id == uv0:getMyCurHomeFigureId() then
		if not slot0.use_icon then
			slot0.use_icon = createSprite(PathTool.getResFrame("common", "txt_cn_common_30015"), 33, 89, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 11)

			slot0.use_icon:setRotation(270)
		end

		slot0.use_icon:setVisible(true)
	elseif slot0.use_icon then
		slot0.use_icon:setVisible(false)
	end

	slot0:updateFigureRedStatus()
end

function HomeworldFigureItem._onLoadIconCallback(slot0)
	if slot0.data.status == HomeworldConst.Figure_State.Unlock then
		setChildUnEnabled(false, slot0.figure_icon)
	else
		setChildUnEnabled(true, slot0.figure_icon)
	end
end

function HomeworldFigureItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function HomeworldFigureItem.setIsSelect(slot0, slot1)
	if slot1 == true then
		if not slot0.select_icon then
			slot0.select_icon = createImage(slot0.root_wnd, PathTool.getResFrame("common", "common_90019"), slot0.size.width * 0.5, slot0.size.height * 0.5, cc.p(0.5, 0.5), true, 10, true)

			slot0.select_icon:setContentSize(slot0.size)
		end

		slot0.select_icon:setVisible(true)
	elseif slot0.select_icon then
		slot0.select_icon:setVisible(false)
	end
end

function HomeworldFigureItem.getFigureId(slot0)
	if slot0.data then
		return slot0.data.id
	end

	return 0
end

function HomeworldFigureItem.getData(slot0)
	return slot0.data
end

function HomeworldFigureItem.DeleteMe(slot0)
	if slot0.icon_load then
		slot0.icon_load:DeleteMe()

		slot0.icon_load = nil
	end

	if slot0.update_red_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_status_event)

		slot0.update_red_status_event = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
