slot1 = PetardActionController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
PetardRedbagWindow = PetardRedbagWindow or BaseClass(BaseView)

function PetardRedbagWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "petard/petard_redbag_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionpetard", "actionpetard"),
			type = ResourcesType.plist
		}
	}
end

function PetardRedbagWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("庆典红包"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.my_redbag_panel = slot1:getChildByName("my_redbag_panel")
	slot0.num_txt = slot0.my_redbag_panel:getChildByName("num_txt")
	slot0.redbag_msg_panel = slot1:getChildByName("redbag_msg_panel")
	slot3 = slot1:getChildByName("btn_panel"):getContentSize()
	slot0.sub_tab_array = {
		{
			index = 1,
			title = TI18N("抢红包")
		},
		{
			index = 2,
			title = TI18N("红包传闻")
		}
	}

	if not slot0.sub_tab_scrollview then
		slot4 = slot2:getContentSize()
		slot0.sub_tab_scrollview = CommonSubBtnList.new(slot2, cc.p(0.5, 0.5), cc.p(slot4.width * 0.5, slot4.height * 0.5), cc.size(142, 50), handler(slot0, slot0._onClickSubTabBtn))
	end

	slot0.sub_tab_scrollview:setData(slot0.sub_tab_array, 1)
end

function PetardRedbagWindow._onClickSubTabBtn(slot0, slot1)
	if slot0.cur_tab_index and slot0.cur_tab_index == slot1 then
		return
	end

	slot0.cur_tab_index = slot1

	if slot1 == PetardActionConst.Redbag_Tab.Redbag then
		if not slot0.my_redbag_scrollview then
			uv0:sender27002()
			slot0:createMyRedbagScrollview()
		end
	elseif slot1 == PetardActionConst.Redbag_Tab.Redmsg and not slot0.redbag_msg_scrollview then
		uv0:sender27006()
		slot0:createRedbagMsgScrollview()
	end

	if slot0.my_redbag_panel then
		slot0.my_redbag_panel:setVisible(slot1 == PetardActionConst.Redbag_Tab.Redbag)
	end

	if slot0.redbag_msg_panel then
		slot0.redbag_msg_panel:setVisible(slot1 == PetardActionConst.Redbag_Tab.Redmsg)
	end
end

function PetardRedbagWindow.createMyRedbagScrollview(slot0)
	if slot0.my_redbag_scrollview then
		return
	end

	slot1 = slot0.my_redbag_panel:getChildByName("list_panel")
	slot0.my_redbag_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		row = 0,
		start_x = 15,
		space_x = 30,
		item_width = 239,
		item_height = 328,
		space_y = 15,
		col = 2,
		need_dynamic = true
	})

	slot0.my_redbag_scrollview:setSwallowTouches(false)
	slot0.my_redbag_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.my_redbag_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.my_redbag_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function PetardRedbagWindow._createNewCell(slot0)
	slot1 = PetardRedbagItem.new()

	slot1:addClickCallBack(handler(slot0, slot0.onClickItemCallBack))

	return slot1
end

function PetardRedbagWindow._numberOfCells(slot0)
	if not slot0.my_redbag_data then
		return 0
	end

	return #slot0.my_redbag_data
end

function PetardRedbagWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.my_redbag_data then
		return
	end

	slot1.index = slot2

	if not slot0.my_redbag_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function PetardRedbagWindow.onClickItemCallBack(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 == 1 then
		slot0.cur_red_packet_id = slot1

		slot0:handleRedEffect(true)
	else
		uv0:sender27003(slot1)
	end
end

function PetardRedbagWindow.handleRedEffect(slot0, slot1)
	if slot1 == false then
		if slot0.red_effect then
			slot0.red_effect:clearTracks()
			slot0.red_effect:removeFromParent()

			slot0.red_effect = nil
		end

		if slot0.mask_layer then
			slot0.mask_layer:removeFromParent()

			slot0.mask_layer = nil
		end
	else
		if not tolua.isnull(slot0.main_container) and slot0.red_effect == nil then
			slot2 = slot0.main_container:getContentSize()
			slot0.red_effect = createEffectSpine(Config.EffectData.data_effect_info[332], cc.p(slot2.width * 0.5, slot2.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0._onRedAniCallBack))

			slot0.main_container:addChild(slot0.red_effect, 2)
		elseif slot0.red_effect then
			slot0.red_effect:setToSetupPose()
			slot0.red_effect:setAnimation(0, PlayerAction.action, false)
		end

		if not slot0.mask_layer then
			slot2 = slot0.main_container:getContentSize()
			slot0.mask_layer = ccui.Layout:create()

			slot0.mask_layer:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
			slot0.mask_layer:setScale(display.getMaxScale())
			slot0.mask_layer:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.mask_layer:setPosition(cc.p(slot2.width * 0.5, slot2.height * 0.5))
			slot0.mask_layer:setTouchEnabled(true)
			slot0.mask_layer:setSwallowTouches(true)
			showLayoutRect(slot0.mask_layer, 200)
			slot0.main_container:addChild(slot0.mask_layer, 1)
		else
			showLayoutRect(slot0.mask_layer, 200)
			slot0.mask_layer:setVisible(true)
		end
	end
end

function PetardRedbagWindow._onRedAniCallBack(slot0)
	if slot0.cur_red_packet_id then
		uv0:sender27003(slot0.cur_red_packet_id)

		slot0.cur_red_packet_id = nil
	end

	if slot0.mask_layer then
		showLayoutRect(slot0.mask_layer, 0)
		delayRun(slot0.mask_layer, 1, function ()
			uv0.mask_layer:setVisible(false)
		end)
	end
end

function PetardRedbagWindow.createRedbagMsgScrollview(slot0)
	if slot0.redbag_msg_scrollview then
		return
	end

	slot1 = slot0.redbag_msg_panel:getChildByName("list_panel")
	slot0.redbag_msg_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot1:getContentSize(), {
		start_y = 0,
		item_width = 596,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 123,
		space_y = 5,
		col = 1,
		need_dynamic = true,
		item_class = PetardRedbagMsgItem
	})
end

function PetardRedbagWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickChoseBtn), true, 2)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickChoseBtn), false, 2)
	slot0:addGlobalEvent(PetardActionEvent.Get_Redbag_Data_Event, function ()
		uv0:updateMyRedbagList()
	end)
	slot0:addGlobalEvent(PetardActionEvent.Get_Redbag_Msg_Data_Event, function (slot0)
		uv0:updateRedbagMsgList(slot0)
	end)
end

function PetardRedbagWindow.updateMyRedbagList(slot0)
	if not uv0:getPetardRedbagData() then
		return
	end

	slot0.my_redbag_data = slot1.red_packet_list or {}

	if next(slot0.my_redbag_data) == nil then
		commonShowEmptyIcon(slot0.my_redbag_scrollview, true, {
			text = TI18N("还没有人发放红包")
		})
	else
		commonShowEmptyIcon(slot0.my_redbag_scrollview, false)
		uv1(slot0.my_redbag_data, function (slot0, slot1)
			if slot0.status == 1 and slot1.status ~= 1 then
				return true
			elseif slot0.status ~= 1 and slot1.status == 1 then
				return false
			else
				return slot1.red_packet_id < slot0.red_packet_id
			end
		end)
	end

	slot0.my_redbag_scrollview:reloadData(nil, , true)
	slot0.num_txt:setString(uv2(TI18N("今日已领取红包:%d/%d"), slot1.get_num or 0, slot1.max_num or 0))
end

function PetardRedbagWindow.updateRedbagMsgList(slot0, slot1)
	if next(slot1 or {}) == nil then
		commonShowEmptyIcon(slot0.redbag_msg_scrollview, true, {
			text = TI18N("还没有人领取过红包")
		})
	else
		commonShowEmptyIcon(slot0.redbag_msg_scrollview, false)
	end

	slot0.redbag_msg_scrollview:setData(slot1)
end

function PetardRedbagWindow.onClickChoseBtn(slot0)
	uv0:openRedbagWindow(false)
end

function PetardRedbagWindow.openRootWnd(slot0)
end

function PetardRedbagWindow.close_callback(slot0)
	slot0:handleRedEffect(false)

	if slot0.sub_tab_scrollview then
		slot0.sub_tab_scrollview:DeleteMe()

		slot0.sub_tab_scrollview = nil
	end

	if slot0.my_redbag_scrollview then
		slot0.my_redbag_scrollview:DeleteMe()

		slot0.my_redbag_scrollview = nil
	end

	if slot0.redbag_msg_scrollview then
		slot0.redbag_msg_scrollview:DeleteMe()

		slot0.redbag_msg_scrollview = nil
	end

	uv0:openRedbagWindow(false)
end
