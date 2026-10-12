ActionPerferPrizeWindow = ActionPerferPrizeWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot1 = table.sort

function ActionPerferPrizeWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "action/action_perfer_prize_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/preferprize", "txt_cn_preferprize_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/preferprize", "preferprize_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/preferprize", "preferprize_bg_2"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("preferprize", "preferprize"),
			type = ResourcesType.plist
		}
	}
end

function ActionPerferPrizeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("image_top")

	if uv0:getModel():getPerferDownLoadPng() then
		download_perfer_png(slot3, function (slot0, slot1)
			if not tolua.isnull(uv0) then
				if slot0 == 0 then
					loadSpriteTexture(uv0, slot1, LOADTEXT_TYPE)
				end

				slot2 = uv0:getContentSize()

				uv0:setScale(631 / slot2.width, 246 / slot2.height)
			end
		end)
	elseif not slot0.image_top_load then
		slot0.image_top_load = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/preferprize", "txt_cn_preferprize_1"), ResourcesType.single, slot0.image_top_load)
	end

	slot0.text_loading = slot1:getChildByName("text_loading")

	slot0.text_loading:setString(TI18N("数据加载中......"))

	slot0.touch_url = slot1:getChildByName("touch_url")

	if not slot0.image_button_load then
		slot0.image_button_load = loadSpriteTextureFromCDN(slot1:getChildByName("image_button"), PathTool.getPlistImgForDownLoad("bigbg/preferprize", "preferprize_bg_1"), ResourcesType.single, slot0.image_button_load)
	end

	slot0.btn_close = slot1:getChildByName("btn_close")
	slot0.item_scroll = slot1:getChildByName("item_scroll")
	slot0.item_scrollview = CommonScrollViewSingleLayout.new(slot0.item_scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.item_scroll:getContentSize(), {
		start_y = 0,
		row = 1,
		start_x = 0,
		space_x = 0,
		item_width = 583,
		item_height = 148,
		space_y = 0,
		col = 1,
		need_dynamic = true
	})

	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.item_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	sdkPerfer_prize()
end

function ActionPerferPrizeWindow.createNewCell(slot0)
	return ActionPerferPeizeItem.new()
end

function ActionPerferPrizeWindow.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ActionPerferPrizeWindow.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionPerferPrizeWindow.openRootWnd(slot0)
end

function ActionPerferPrizeWindow.sortItem(slot0)
	for slot4, slot5 in pairs(slot0.show_list) do
		if slot5.is_use == "1" then
			slot5.status = 2
		elseif slot5.rec_ts == "" then
			slot5.status = 1
		elseif slot5.rec_ts ~= "" then
			slot5.status = 0
		end
	end

	uv0(slot0.show_list, SortTools.tableLowerSorter({
		"status"
	}))
	uv0(slot0.show_list, function (slot0, slot1)
		if slot0.status == slot1.status then
			if tonumber(slot1.reduce) < tonumber(slot0.reduce) then
				return false
			else
				return true
			end
		else
			return slot0.status < slot1.status
		end
	end)
end

function ActionPerferPrizeWindow.setPerferData(slot0)
	slot0.show_list = uv0:getModel():getSavePerferData()

	slot0.text_loading:setVisible(false)

	if next(slot0.show_list) ~= nil then
		slot0:sortItem()
		commonShowEmptyIcon(slot0.item_scroll, false)

		if slot0.item_scrollview then
			slot0.item_scrollview:reloadData()
		end
	else
		commonShowEmptyIcon(slot0.item_scroll, true, {
			text = TI18N("暂无可用优惠券")
		})
	end
end

function ActionPerferPrizeWindow.register_event(slot0)
	slot0:addGlobalEvent(ActionEvent.ACTION_PERFER_GET_DATA_EVENT, function ()
		uv0:setPerferData()
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openActionPerferPrizeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openActionPerferPrizeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.touch_url, function ()
		uv0:jumpActionDescUrl()
	end, false)
end

function ActionPerferPrizeWindow.jumpActionDescUrl(slot0)
	if uv0:getModel():getPerferJumpurl() and not IS_IOS_PLATFORM then
		sdkCallFunc("openUrl", slot1)
	end
end

function ActionPerferPrizeWindow.close_callback(slot0)
	if slot0.image_top_load then
		slot0.image_top_load:DeleteMe()

		slot0.image_top_load = nil
	end

	if slot0.image_button_load then
		slot0.image_button_load:DeleteMe()

		slot0.image_button_load = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openActionPerferPrizeWindow(false)
end

ActionPerferPeizeItem = class("ActionPerferPeizeItem", function ()
	return ccui.Widget:create()
end)

function ActionPerferPeizeItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionPerferPeizeItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_perfer_prize_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(583, 148))

	if not slot0.image_item_load then
		slot0.image_item_load = loadSpriteTextureFromCDN(slot0.root_wnd:getChildByName("main_container"):getChildByName("image_item"), PathTool.getPlistImgForDownLoad("bigbg/preferprize", "preferprize_bg_2"), ResourcesType.single, slot0.image_item_load)
	end

	slot0.new_tag = slot1:getChildByName("new_tag")

	slot0.new_tag:setVisible(false)

	slot0.sprite_get = slot1:getChildByName("sprite_get")

	slot0.sprite_get:setVisible(false)

	slot0.btn_goto = slot1:getChildByName("btn_goto")
	slot0.btn_goto_label = slot0.btn_goto:getChildByName("Text_6")

	slot0.btn_goto_label:setString("")

	slot0.price = slot1:getChildByName("price")

	slot0.price:setString("")

	slot0.txt_action_1 = slot1:getChildByName("txt_action_1")

	slot0.txt_action_1:setString("")

	slot0.txt_action_2 = slot1:getChildByName("txt_action_2")

	slot0.txt_action_2:setString("")

	slot0.desc = slot1:getChildByName("desc")

	slot0.desc:setString("")

	slot0.time = slot1:getChildByName("time")

	slot0.time:setString("")
end

function ActionPerferPeizeItem.setData(slot0, slot1)
	if slot1.is_use == "1" then
		slot0.btn_goto_label:setString(TI18N("已使用"))
		setChildUnEnabled(true, slot0.btn_goto)
		slot0.btn_goto:setTouchEnabled(false)
	elseif slot1.rec_ts == "" then
		slot0.btn_goto_label:setString(TI18N("未达成"))
		setChildUnEnabled(true, slot0.btn_goto)
		slot0.btn_goto:setTouchEnabled(false)
	else
		slot0.btn_goto_label:setString(TI18N("去使用"))
		setChildUnEnabled(false, slot0.btn_goto)
		slot0.btn_goto:setTouchEnabled(true)
	end

	slot0.price:setString("￥" .. (slot1.reduce or 0))
	slot0.txt_action_1:setString(slot1.name)
	slot0.txt_action_2:setString(slot1.name)
	slot0.desc:setString(slot1.rec_condition)
	slot0.time:setString(TimeTool.getYMD(slot1.start_ts) .. " - " .. TimeTool.getYMD(slot1.end_ts))
	slot0.time:setColor(cc.c3b(211, 211, 211))
end

function ActionPerferPeizeItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_goto, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true)
end

function ActionPerferPeizeItem.DeleteMe(slot0)
	if slot0.image_item_load then
		slot0.image_item_load:DeleteMe()

		slot0.image_item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
