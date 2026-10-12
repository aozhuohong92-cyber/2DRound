CommonAlert = CommonAlert or BaseClass(BaseView)
CommonAlert.type = {
	common = 1,
	rich = 2
}
CommonAlert.WIDTH = 572
CommonAlert.HEIGHT = 350
CommonAlert.map_list = {}

function CommonAlert.__init(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.type = slot1 or CommonAlert.type.common
	slot0.offset_height = 95
	slot0.title = slot2
	slot0.timer = 0
	slot0.timer_for = true
	slot0.pk_status = FALSE
	slot0.auto_close = slot3 or TRUE
	slot0.is_show_title = slot4 or TRUE
	slot0.view_tag = slot5 or ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "common/common_alert"
	slot0.win_type = slot6 or WinType.Tips
end

function CommonAlert.initParam(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.confirm_label = slot1 or TI18N("确定")
	slot0.confirm_callback = slot2
	slot0.cancel_label = slot3
	slot0.cancel_callback = slot4
	slot0.external_close_callback = slot5
end

function CommonAlert.open(slot0)
	BaseView.open(slot0)
	slot0:openCallBack()
end

function CommonAlert.closeAllWin()
	for slot3, slot4 in ipairs(CommonAlert.map_list) do
		slot4:close()
	end

	CommonAlert.map_list = {}
end

function CommonAlert.close(slot0)
	for slot4, slot5 in ipairs(CommonAlert.map_list) do
		if slot5 == slot0 then
			table.remove(CommonAlert.map_list, slot4)
		end
	end

	BaseView.close(slot0)
end

function CommonAlert.close_callback(slot0)
	if _is_game_restart then
		return
	end

	if slot0.timer_id then
		GlobalTimeTicket:getInstance():remove(slot0.timer_id)
	end

	if slot0.item_list and next(slot0.item_list) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = {}
	end
end

function CommonAlert.setTimerBtn(slot0, slot1, slot2, slot3)
	if slot2 == nil or slot2 == "" then
		return
	end

	if slot1.label == nil then
		return
	end

	if slot0.timer_type == nil or slot0.timer_type == 0 then
		slot1.label:setString(string.format("%s(%s)", slot2, slot0.timer))
	else
		slot1.label:setString(string.format("%s", TimeTool.GetTimeMS(slot0.timer)))
	end

	if slot0.timer > 0 and slot0.pk_status == FALSE then
		setChildUnEnabled(true, slot1)
		slot1:setTouchEnabled(false)

		if slot1.label then
			slot1.label:enableOutline(Config.ColorData.data_color4[84], 2)
		end
	end

	slot0.timer_id = GlobalTimeTicket:getInstance():add(function ()
		if tolua.isnull(uv0.alert_panel) then
			return
		end

		if uv0.timer > 1 then
			uv0.timer = uv0.timer - 1

			if uv0.timer_type == nil or uv0.timer_type == 0 then
				uv1.label:setString(string.format("%s(%s)", uv2, uv0.timer))
			else
				uv1.label:setString(string.format("%s", TimeTool.GetTimeMS(uv0.timer)))
			end
		else
			setChildUnEnabled(false, uv1)
			uv1:setTouchEnabled(true)

			if uv1.label then
				uv1.label:enableOutline(Config.ColorData.data_color4[264], 2)
			end

			uv1.label:setString(string.format("%s", uv2))

			if uv0.timer_auto_close == TRUE then
				if uv3 ~= nil then
					uv3()
				end

				uv0:close()
			end
		end
	end, 1, slot0.timer)
end

function CommonAlert.open_callback(slot0)
	slot0.background_panel = slot0.root_wnd:getChildByName("background_panel")

	slot0.background_panel:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.alert_panel = slot0.main_panel:getChildByName("main_container")

	slot0.alert_panel:setTouchEnabled(true)

	slot0.WIDTH = slot0.alert_panel:getContentSize().width
	slot0.title_contaier = slot0.main_panel:getChildByName("title_container")

	slot0.title_contaier:setVisible(TRUE == slot0.is_show_title)

	slot0.title_label = slot0.title_contaier:getChildByName("title_label")

	slot0.title_label:setString(slot0.title or TI18N("提示"))
	UITool.SetTitleColor(slot0.title_label)

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn.label = slot0.ok_btn:getChildByName("label")
	slot0.ok_btn.x = slot0.ok_btn:getPositionX()
	slot0.cancel_btn = slot0.main_panel:getChildByName("cancel_btn")
	slot0.cancel_btn.label = slot0.cancel_btn:getChildByName("label")
	slot0.cancel_btn.x = slot0.cancel_btn:getPositionX()
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.close_btn:setVisible(slot0.external_close_callback ~= nil)
end

function CommonAlert.openCallBack(slot0)
	slot0.ok_btn.label:setString(slot0.confirm_label)
	slot0.ok_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)

	if slot0.cancel_label then
		slot0.cancel_btn.label:setString(slot0.cancel_label)
		slot0.cancel_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	if slot0.timer and slot0.timer > 0 then
		if slot0.timer_for == true then
			slot0:setTimerBtn(slot0.ok_btn, slot0.confirm_label, slot0.confirm_callback)
		else
			slot0:setTimerBtn(slot0.cancel_btn, slot0.cancel_label, slot0.cancel_callback)
		end
	end

	slot0.line = slot0.main_panel:getChildByName("line")

	slot0.line:setVisible(false)

	if slot0.cancel_label then
		slot0.cancel_btn:setVisible(true)
		slot0.cancel_btn:setTouchEnabled(true)
	else
		slot0.cancel_btn:setVisible(false)
		slot0.cancel_btn:setTouchEnabled(false)
	end

	if slot0.cancel_label and slot0.is_lock == true and slot0.cancel_btn and slot0.cancel_btn then
		slot0.cancel_btn.label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.cancel_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.cancel_btn)
	end

	if slot0.cancel_label then
		slot0.ok_btn:setPositionX(slot0.ok_btn.x)
		slot0.cancel_btn:setPositionX(slot0.cancel_btn.x)
	else
		slot0.ok_btn:setPositionX(slot0.WIDTH * 0.5 + 16)
	end
end

function CommonAlert.setTextString(slot0, slot1, slot2, slot3)
	slot3 = slot3 or 0

	if slot0.alert_txt then
		if slot0.alert_txt:getParent() then
			slot0.alert_txt:removeFromParent()
		end

		slot0.alert_txt = nil
	end

	if slot0.type == CommonAlert.type.common then
		slot0.alert_txt = slot0:recoutTextFieldSize(slot1, 560, slot2 or 24, 175)
	else
		slot0.alert_txt = slot0:recoutRichTextField(slot1, 560, slot2, 175)

		slot0.alert_txt:addTouchLinkListener(function (slot0, slot1)
			if slot0 == "href" and slot1 == "privilege" then
				VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)

				if uv0.cancel_callback then
					uv0:cancel_callback()
				end

				uv0.cancel_callback = nil

				uv0:close()
			end
		end, {
			"href"
		})
	end

	slot0.alert_txt:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.alert_panel:addChild(slot0.alert_txt)
	slot0.alert_txt:setPosition(cc.p(slot0.alert_panel:getContentSize().width / 2, slot0.alert_panel:getContentSize().height / 2 + slot3))
end

function CommonAlert.setExtendTextString(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot2 or 22
	slot8 = slot3 or 0
	slot9 = slot4 or CommonAlert.type.common
	slot10 = slot6 or 1

	if slot0.extend_txt_list == nil then
		slot0.extend_txt_list = {}
	end

	if slot0.extend_txt_list[slot10] then
		if slot0.extend_txt_list[slot10]:getParent() then
			slot0.extend_txt_list[slot10]:removeFromParent()
		end

		slot0.extend_txt_list[slot10] = nil
	end

	if slot9 == CommonAlert.type.common then
		slot0.extend_txt_list[slot10] = slot0:recoutTextFieldSize(slot1, 560, slot7, 188, slot5 or cc.TEXT_ALIGNMENT_LEFT)
	else
		slot0.extend_txt_list[slot10] = slot0:recoutRichTextField(slot1, 560, slot7, 188)
	end

	slot0.alert_panel:addChild(slot0.extend_txt_list[slot10])

	if slot5 == cc.TEXT_ALIGNMENT_LEFT then
		slot0.extend_txt_list[slot10]:setAnchorPoint(cc.p(0, 0.5))
		slot0.extend_txt_list[slot10]:setPosition(cc.p(20, slot0.alert_panel:getContentSize().height / 2 + slot8))
	elseif slot5 == cc.TEXT_ALIGNMENT_CENTER then
		slot0.extend_txt_list[slot10]:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.extend_txt_list[slot10]:setPosition(cc.p(slot0.alert_panel:getContentSize().width / 2, slot0.alert_panel:getContentSize().height / 2 + slot8))
	end
end

function CommonAlert.recoutTextFieldSize(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = createWithSystemFont(slot1, DEFAULT_FONT, slot3)

	slot6:setTextColor(Config.ColorData.data_color4[slot4 or 175])
	slot6:setAlignment(slot5 or cc.TEXT_ALIGNMENT_CENTER, cc.TEXT_ALIGNMENT_CENTER)
	slot6:setAnchorPoint(cc.p(0, 1))

	if slot2 ~= nil then
		if slot2 < slot6:getContentSize().width then
			slot6:setContentSize(cc.size(slot2, slot6:getContentSize().height * math.ceil(slot7 / slot2)))
			slot6:setWidth(slot2)
		end
	end

	return slot6
end

function CommonAlert.recoutRichTextField(slot0, slot1, slot2, slot3, slot4)
	slot6 = require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.richlabel.RichLabel").new({
		lineSpace = 5,
		charSpace = 0,
		fontName = DEFAULT_FONT,
		fontSize = slot3,
		fontColor = Config.ColorData.data_color3[slot4 or 175],
		maxWidth = slot2 or 350
	})

	slot6:setString(slot1)
	slot6:setPosition(cc.p(100, 0))
	slot6:setAnchorPoint(0, 1)

	return slot6
end

function CommonAlert.register_event(slot0)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.confirm_callback then
				if uv0.input_edit ~= nil then
					uv0.confirm_callback(uv0.input_edit:getText())
				else
					uv0:confirm_callback()
				end
			end

			if uv0.auto_close == TRUE then
				uv0.confirm_callback = nil

				uv0:close()
			end
		end
	end)

	if slot0.cancel_btn then
		slot0.cancel_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.cancel_callback then
					uv0:cancel_callback()
				end

				uv0.cancel_callback = nil

				uv0:close()
			end
		end)
	end

	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()

			if uv0.external_close_callback ~= nil then
				uv0:external_close_callback()
			end

			uv0.external_close_callback = nil

			uv0:close()
		end
	end)
end

function CommonAlert.show(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot7 = slot7 or {}
	CommonAlert.New(slot5, slot7.title, nil, , slot7.view_tag or ViewMgrTag.DIALOGUE_TAG, slot7.win_type or WinType.Tips).timer = slot7.timer
	slot12.timer_auto_close = slot7.timer_auto_close or FALSE
	slot12.pk_status = slot7.pk_status or FALSE
	slot12.timer_for = slot7.timer_for == nil and true or slot7.timer_for
	slot12.is_lock = slot7.is_lock or false

	slot12:initParam(slot1, slot2, slot3, slot4, slot6)
	slot12:open()

	if slot12 and slot12.root_wnd and not tolua.isnull(slot12.root_wnd) then
		slot12:setCommonUIZOrder(slot12.root_wnd)
	end

	if slot9 == true then
		slot12.close_btn:setVisible(true)
	end

	slot12:setTextString(slot0, slot8 or 24, slot7.off_y or 0)

	slot12.resetTitle = slot7.title

	if slot7.extend_str ~= nil and slot7.extend_str ~= "" then
		slot12:setExtendTextString(slot7.extend_str, slot7.extend_size, slot7.extend_offy, slot7.extend_type, slot7.extend_aligment)
	elseif slot7.extend_list then
		for slot17, slot18 in ipairs(slot7.extend_list) do
			slot12:setExtendTextString(slot18.extend_str, slot18.extend_size, slot18.extend_offy, slot18.extend_type, slot18.extend_aligment, slot17)
		end
	end

	table.insert(CommonAlert.map_list, slot12)

	return slot12
end

function CommonAlert.showInputApply(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	slot13 = slot13 or {}
	CommonAlert.New(slot9, title_str, slot10).timer = slot13.timer
	slot15.timer_type = slot13.timer_type or 0
	slot15.timer_auto_close = slot13.timer_auto_close or TRUE
	slot15.timer_for = slot13.timer_for == nil and true or slot13.timer_for

	slot15:initParam(slot2, slot3, slot4, slot5, slot7)
	slot15:open()
	slot15:createInputContainer(slot1, slot11, slot12, slot13.desc, slot13.off_y, nil, slot13.off_x, slot14)
	slot15:setCommonUIZOrder(slot15.root_wnd)

	if slot0 ~= nil and slot0 ~= "" then
		slot15:setTextString(slot0, slot8 or 18, slot16)
	end

	if slot15.input_edit ~= nil and slot15.alert_txt ~= nil and slot16 == nil then
		slot15.alert_txt:setPositionY(slot15.input_edit:getPositionY() - slot15.input_edit:getContentSize().height / 2 - 22)
	end

	table.insert(CommonAlert.map_list, slot15)

	return slot15
end

function CommonAlert.isSelected(slot0)
	if slot0.check_box then
		return slot0.check_box:isSelected()
	end
end

CommonAlert.SaveLocalTime = {}

function CommonAlert.showCheckBox(slot0, slot1)
	slot2, slot3 = PathTool.getCheckBoxRes()
	slot0.check_box = RadioButton.new(slot0.alert_panel, slot2, slot3, _T("今日不再提示"), 0, RadioButtonDir.RIGHT, 20)

	slot0.check_box:setAnchorPoint(cc.p(0.5, 0))
	slot0.check_box:setTitleColor(Config.ColorData.data_color4[64])
	slot0.check_box:setPosition(cc.p(slot0.WIDTH / 2 - 104, 12))
	slot0.check_box:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.check_box:setSelected(not uv0.check_box:isSelected())

			if uv0.check_box:isSelected() then
				CommonAlert.SaveLocalTime[uv1] = GameNet:getInstance():getTime()
			else
				CommonAlert.SaveLocalTime[uv1] = 0
			end
		end
	end)
end

function CommonAlert.ActionshowCheckBox(slot0, slot1)
	slot0.check_box = RadioButton.new(slot0.alert_panel, PathTool.getCommonRes("gouxuan1"), PathTool.getCommonRes("gouxuan"), _T("活动期间不再提示"), 0, RadioButtonDir.RIGHT, 20)

	slot0.check_box:setAnchorPoint(cc.p(0.5, 0))
	slot0.check_box:setTitleColor(Config.ColorData.data_color4[25])
	slot0.check_box:setPosition(cc.p(slot0.WIDTH / 2, 12))
	slot0.check_box:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.check_box:setSelected(not uv0.check_box:isSelected())

			if uv0.check_box:isSelected() then
				CommonAlert.SaveLocalTime[uv1] = GameNet:getInstance():getTime()
			else
				CommonAlert.SaveLocalTime[uv1] = 0
			end
		end
	end)
end

function CommonAlert.showItemApply(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	slot8 = slot8 or CommonAlert.type.common
	slot15 = false

	if (slot12 or {}).show_need then
		slot15 = slot12.show_need
	end

	slot17 = CommonAlert.New(slot8, slot6, nil, , slot13, slot12.win_type)
	slot17.timer = slot12.timer or 0

	slot17:initParam(slot3, slot2, slot5, slot4, slot10)
	slot17:open()
	slot17:showItemList(slot1, slot15, slot14)
	slot17:setCommonUIZOrder(slot17.root_wnd)

	slot7 = slot7 or 24
	slot11 = slot11 or ""

	if slot9 == true then
		slot17.close_btn:setVisible(true)
	end

	if slot11 ~= "" then
		slot18 = 190

		if slot12 ~= nil then
			slot18 = slot12.y
		end

		slot19 = createLabel(24, 86, nil, slot17.alert_panel:getContentSize().width / 2, slot18, slot11, slot17.alert_panel, nil, cc.p(0.5, 1))
	end

	if slot0 ~= nil and slot0 ~= "" then
		slot17:setTextString(slot0, slot7, slot12.off_y or 78)
	end

	return slot17
end

function CommonAlert.showItemList(slot0, slot1, slot2, slot3)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot0.item_list = {}
	slot0.item_name_list = {}
	slot4 = 60
	slot5 = nil
	slot8 = 0
	slot9 = 98
	slot10 = #slot1
	slot11 = nil
	slot13 = BackpackController:getInstance():getModel()
	slot14 = RoleController:getInstance():getRoleVo()
	slot15 = Config.ItemData.data_assets_id2label
	slot16 = slot0.alert_panel:getContentSize()
	slot18 = 2

	if math.max(slot10 * BackPackItem.Width * 0.9 + (slot10 - 1) * (slot3 or 40), slot16.width) <= slot16.width then
		slot18 = (slot16.width - slot12) / 2
	else
		slot17 = slot17 + slot18
	end

	if slot0.item_scroll_view == nil then
		slot0.item_scroll_view = createScrollView(slot16.width, slot16.height + slot4, 0, slot16.height, slot0.alert_panel, ccui.ScrollViewDir.horizontal)

		slot0.item_scroll_view:setAnchorPoint(cc.p(0, 1))
		slot0.item_scroll_view:setInnerContainerSize(cc.size(slot17, slot16.height + slot4))

		if slot10 > 4 then
			slot0.item_scroll_view:setTouchEnabled(true)
		else
			slot0.item_scroll_view:setTouchEnabled(false)
		end
	end

	for slot22, slot23 in ipairs(slot1) do
		if slot23[1] and slot23[2] then
			slot25 = slot23[2]

			if Config.ItemData.data_get_data(slot23[1]) then
				slot5 = BackPackItem.new(false, true, false, slot6, false, true)
				slot8 = slot18 + (BackPackItem.Width * slot6 + slot7) * (slot22 - 1) + BackPackItem.Width * slot6 * 0.5

				slot5:setBaseData(slot24, slot25)
				slot5:setDefaultTip(true, true)

				if slot2 == true then
					slot9 = 60 + slot4

					if slot15[slot24] == nil then
						slot5:setNeedNum(slot25, slot13:getBackPackItemNumByBid(slot24))
					end

					slot5:setExtendDesc(true, slot11.name, BackPackConst.quality_color_id[slot11.quality])
				end

				slot5:setPosition(slot8, slot9)
				slot0.item_scroll_view:addChild(slot5)
				table.insert(slot0.item_list, slot5)
			end
		end
	end
end

function CommonAlert.countIsToday(slot0)
	if CommonAlert.SaveLocalTime[slot0] ~= nil and os.date("%x", slot1) == os.date("%x", GameNet:getInstance():getTime()) then
		return true
	end

	return false
end

function CommonAlert.createInputContainer(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot0.input_edit == nil then
		if slot8 == true then
			slot0.input_edit = createEditBox(slot0.alert_panel, PathTool.getResFrame("common", "common_1021"), slot2 or cc.size(300, 60), Config.ColorData.data_color3[81], 22, nil, 25, slot1, nil, slot3, LOADTEXT_TYPE_PLIST)
		else
			slot0.input_edit = createEditBox(slot0.alert_panel, PathTool.getResFrame("common", "common_1021"), slot2 or cc.size(300, 60), Config.ColorData.data_color3[81], 25, nil, 25, slot1, nil, slot3, LOADTEXT_TYPE_PLIST)
		end
	end

	slot0.input_edit:setAnchorPoint(cc.p(0.5, 0.5))

	slot5 = slot5 or 0
	slot7 = slot7 or 0

	if slot4 ~= nil then
		slot0.input_edit:setText(slot4)
	end

	slot0.input_edit:setPosition(slot0.alert_panel:getContentSize().width / 2 + slot7, 105 + slot5)
end
