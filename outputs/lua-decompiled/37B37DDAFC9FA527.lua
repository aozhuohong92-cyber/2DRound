RoleHeadPanel = class("RoleHeadPanel", function ()
	return ccui.Widget:create()
end)

function RoleHeadPanel.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RoleHeadPanel.config(slot0)
	slot0.ctrl = RoleController:getInstance()
	slot0.size = cc.size(627, 627)

	slot0:setContentSize(slot0.size)

	slot0.item_list = {}
	slot0.items = {}
	slot0.role_vo = slot0.ctrl:getRoleVo()
	slot0.is_select_custom = false
end

function RoleHeadPanel.layoutUI(slot0)
	slot0.main_panel = ccui.Widget:create()

	slot0.main_panel:setContentSize(slot0.size)
	slot0.main_panel:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_panel:setPosition(cc.p(slot0.size.width / 2, 325))
	slot0:addChild(slot0.main_panel)

	slot1 = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_90024"), slot0.size.width / 2, slot0.size.height / 2 + 20, cc.p(0.5, 0.5), true, -1)

	slot1:setScale9Enabled(true)
	slot1:setContentSize(slot0.size)

	slot0.photo_btn = createImage(slot0.main_panel, PathTool.getResFrame("face", "face_04"), slot0.size.width / 2, 580, cc.p(0.5, 0.5), true)

	slot0.photo_btn:setTouchEnabled(true)

	slot0.photo_label = createLabel(22, cc.c3b(255, 255, 255), nil, slot0.photo_btn:getContentSize().width / 2, 0, "", slot0.photo_btn, nil, cc.p(0.5, 1))

	slot0.photo_label:setString(TI18N("自定义头像"))

	slot0.custom_head = FaceHeadItem.new()

	slot0.custom_head:setPosition(cc.p(430, 582))
	slot0.main_panel:addChild(slot0.custom_head)
	createLabel(22, cc.c3b(149, 83, 34), nil, 64, 0, "", slot0.custom_head, nil, cc.p(0.5, 1)):setString(TI18N("自定义头像"))

	if slot0.role_vo and slot0.role_vo.face_file and slot0.role_vo.face_file == "" then
		slot0.custom_head:setVisible(false)
	elseif CAN_USE_CAMERA then
		slot0.photo_btn:setPositionX(217)
		slot0.photo_label:setString(TI18N("重新选择"))
		slot0.custom_head:setPositionX(376)
		slot0.custom_head:updateCustomHead(slot0.role_vo.face_id, slot0.role_vo.face_file, slot0.role_vo.face_update_time)
	else
		slot0.custom_head:setVisible(false)
	end

	slot3 = createImage(slot0.main_panel, PathTool.getResFrame("common", "common_1016"), slot0.size.width / 2, 485, cc.p(0.5, 0.5), true)

	slot3:setScale9Enabled(true)
	slot3:setContentSize(cc.size(590, 3))
	createLabel(22, cc.c3b(144, 93, 56), nil, slot0.size.width / 2, -75, "", slot0.main_panel, nil, cc.p(0.5, 0.5)):setString(TI18N("除了可选择精美的英雄头像，也可设置自定义个性头像哦！"))

	slot0.use_btn = createButton(slot0.main_panel, TI18N("更 换"), slot0.size.width / 2, -20, cc.size(161, 62), PathTool.getResFrame("common", "common_1017"), 26, Config.ColorData.data_color4[1])

	slot0.use_btn:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.use_btn:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.ctrl:requestRoleHeadList()
	slot0:setUserHead()
end

function RoleHeadPanel.setUserHeadStatus(slot0, slot1)
	if not CAN_USE_CAMERA then
		return
	end

	if slot0.check_is_had == slot1 then
		return
	end

	slot0.check_is_had = slot1

	if slot1 == true then
		slot0.photo_btn:setPositionX(217)
		slot0.photo_label:setString(TI18N("重新选择"))
		slot0.custom_head:setPositionX(376)
		slot0.custom_head:setVisible(true)
	else
		slot0.photo_btn:setPositionX(slot0.size.width / 2)
		slot0.photo_label:setString(TI18N("自定义头像"))
		slot0.custom_head:setVisible(false)
	end
end

function RoleHeadPanel.setUserHead(slot0)
	if slot0.role_vo == nil then
		return
	end

	if slot0.role_vo.face_file ~= "" then
		slot0:setUserHeadStatus(true)
		slot0.custom_head:updateCustomHead(slot0.role_vo.face_id, slot0.role_vo.face_file, slot0.role_vo.face_update_time)

		if slot0.role_vo.face_update_time ~= 0 then
			slot0.custom_head:showUseIcon(true)
			slot0:setCustomHeadSelected(true)
		else
			slot0.custom_head:showUseIcon(false)
			slot0:setCustomHeadSelected(false)
		end
	else
		slot0:setUserHeadStatus(false)
	end
end

function RoleHeadPanel.setData(slot0)
end

function RoleHeadPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.photo_btn, function ()
		if uv0.role_vo and uv0.role_vo.lev >= 50 then
			MainuiController:getInstance():openCustomHeadImgWin(true)
		else
			message(TI18N("50级开启自定义头像！"))
		end
	end, true)

	if slot0.use_btn then
		slot0.use_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if uv0.is_select_custom == true then
					RoleController:getInstance():resetCustomHeadImage()
				elseif uv0.select_item and uv0.select_item.vo and slot2.bid then
					uv0.ctrl:changeRoleHead(slot2.bid)
				end
			end
		end)
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "face_id" then
				uv0:updateList()
			elseif slot0 == "face_list" then
				uv0:updateList(slot1)
			elseif slot0 == "face_update_time" then
				uv0:setUserHead()

				if slot1 ~= 0 then
					uv0:updateList()
				end
			end
		end)
	end

	if slot0.custom_head then
		slot0.custom_head:addCallBack(function (slot0, slot1)
			uv0:setCustomHeadSelected(true)
		end)
	end
end

function RoleHeadPanel.setCustomHeadSelected(slot0, slot1)
	if slot0.is_select_custom == slot1 then
		return
	end

	slot0.is_select_custom = slot1

	if slot1 == true then
		if slot0.select_item then
			slot0.select_item:setSelected(false)

			slot0.select_item = nil
			slot0.select_bid = nil
		end

		slot0.custom_head:setSelected(true)
	else
		if slot0.select_item then
			slot0.select_item:setSelected(true)
		end

		slot0.custom_head:setSelected(false)
	end
end

function RoleHeadPanel.updateList(slot0, slot1)
	if slot0.list_view == nil then
		slot2 = cc.size(slot0.size.width - 12, slot0.size.height - 180)
		slot0.list_view = CommonScrollViewSingleLayout.new(slot0.main_panel, cc.p(6, 26), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2, {
			start_y = 0,
			row = 0,
			start_x = 0,
			space_x = 0,
			item_height = 120,
			space_y = 0,
			col = 4,
			need_dynamic = true,
			item_width = slot2.width / 4
		}, cc.p(0, 0))

		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.list_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	if slot1 ~= nil then
		slot0.dic_has_bid = {}

		for slot5, slot6 in pairs(slot1) do
			slot0.dic_has_bid[slot6.face_id] = true
		end
	end

	slot2 = table.insert
	slot3 = 1
	slot4 = slot0.role_vo.face_file and slot0.role_vo.face_file ~= "" and slot0.role_vo.face_update_time and slot0.role_vo.face_update_time ~= 0

	if slot0.show_list == nil then
		slot0.show_list = {}

		for slot9, slot10 in pairs(Config.LooksData.data_head_data or {}) do
			if slot0.dic_has_bid then
				if slot0.dic_has_bid[slot10.id] then
					-- Nothing
				else
					slot11.status = 1
				end
			else
				slot11.status = 1
			end

			if slot0.role_vo.face_id == slot10.id and not slot4 then
				slot11.use = 0
			else
				slot11.use = 1
			end

			slot2(slot0.show_list, {
				tips = slot10.tips,
				bid = slot10.id,
				status = 0
			})
		end
	else
		for slot8, slot9 in ipairs(slot0.show_list) do
			if slot0.dic_has_bid then
				if slot0.dic_has_bid[slot9.bid] then
					slot9.status = 0
				else
					slot9.status = 1
				end
			else
				slot9.status = 1
			end

			if slot0.role_vo.face_id == slot9.bid and not slot4 then
				slot9.use = 0
			else
				slot9.use = 1
			end
		end
	end

	table.sort(slot0.show_list, SortTools.tableLowerSorter({
		"use",
		"status",
		"bid"
	}))

	if not slot4 then
		slot0.list_view:reloadData(1)
	else
		slot0.list_view:reloadData()
	end
end

function RoleHeadPanel.createNewCell(slot0, slot1, slot2)
	slot3 = FaceHeadItem.new()

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function RoleHeadPanel.numberOfCells(slot0)
	return #slot0.show_list
end

function RoleHeadPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:setData(slot0.show_list[slot2])

	if slot0.select_bid then
		if not slot0.is_select_custom and slot0.select_bid == slot3.bid then
			slot1:setSelected(true)
		else
			slot1:setSelected(false)
		end
	elseif not slot0.is_select_custom and slot3.use == 0 then
		slot1:setSelected(true)
	else
		slot1:setSelected(false)
	end
end

function RoleHeadPanel.onCellTouched(slot0, slot1)
	if slot0.select_bid and slot0.select_bid == slot0.show_list[slot1.index].bid then
		return
	end

	if slot0.custom_head then
		slot0.custom_head:setSelected(false)

		slot0.is_select_custom = false
	end

	if slot3.status == 1 then
		message(slot3.tips)
	elseif slot3.status == 0 then
		if slot0.select_item ~= nil then
			slot0.select_item:setSelected(false)
		end

		slot0.select_bid = slot3.bid
		slot0.select_item = slot1

		slot0.select_item:setSelected(true)
	end
end

function RoleHeadPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RoleHeadPanel.DeleteMe(slot0)
	if slot0.custom_head then
		slot0.custom_head:DeleteMe()

		slot0.custom_head = nil
	end

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	slot0.select_item = nil

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end
end

FaceHeadItem = class("FaceHeadItem", function ()
	return ccui.Widget:create()
end)

function FaceHeadItem.ctor(slot0)
	slot0.width = 128
	slot0.height = 120
	slot0.is_select = false

	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(slot0.width, slot0.height))
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:configUI()
end

function FaceHeadItem.clickHandler(slot0, slot1, slot2)
	if slot0.call_fun then
		slot0.touchPos = slot1:getTouchBeganPosition()

		slot0:call_fun(slot1, slot2)
	end
end

function FaceHeadItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function FaceHeadItem.configUI(slot0)
	slot0.back = ccui.Widget:create()

	slot0.back:setCascadeOpacityEnabled(true)
	slot0.back:setContentSize(cc.size(slot0.width, slot0.height))
	slot0.back:setAnchorPoint(cc.p(0, 0))
	slot0.back:setTouchEnabled(true)
	slot0.back:setSwallowTouches(false)
	slot0:addChild(slot0.back)
	slot0.back:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0:clickHandler(slot0, slot1)
		end
	end)

	slot0.player_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.player_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.player_head:setPosition(cc.p(slot0.width / 2, 60))
	slot0:addChild(slot0.player_head)
end

function FaceHeadItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.vo = slot1

	slot0.player_head:setHeadRes(slot1.bid)
	slot0:setGrey(slot1.status == 1)
	slot0:showUseIcon(slot1.use == 0)
end

function FaceHeadItem.setSelected(slot0, slot1)
	if slot0.is_select == slot1 then
		return
	end

	slot0.is_select = slot1

	if slot1 then
		if slot0.select == nil then
			slot0.select = ccui.ImageView:create(PathTool.getResFrame("common", "common_1060"), LOADTEXT_TYPE_PLIST)

			slot0.select:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.select:setPosition(cc.p(slot0.player_head:getPositionX(), slot0.player_head:getPositionY()))
			slot0:addChild(slot0.select)
		end

		slot0.select:setVisible(slot1)
		slot0.select:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeIn:create(0.7), cc.FadeOut:create(0.7))))
	elseif slot0.select then
		doStopAllActions(slot0.select)
		slot0.select:setVisible(slot1)
	end
end

function FaceHeadItem.showUseIcon(slot0, slot1)
	slot0.is_use = slot1

	if not slot0.use_icon and slot1 == false then
		return
	end

	if not slot0.use_icon then
		slot0.use_icon = createImage(slot0, PathTool.getResFrame("face", "txt_cn_face_use"), 85, 30, cc.p(0.5, 0.5), true, 1, false)
	end

	slot0.use_icon:setVisible(slot1)
end

function FaceHeadItem.updateCustomHead(slot0, slot1, slot2, slot3)
	if slot0.player_head then
		slot0.player_head:setHeadRes(slot1, false, LOADTEXT_TYPE, slot2, slot3, true)
	end
end

function FaceHeadItem.setGrey(slot0, slot1)
	setChildUnEnabled(slot1, slot0, cc.c4b(105, 85, 85, 255))
end

function FaceHeadItem.DeleteMe(slot0)
	if slot0.player_head then
		slot0.player_head:DeleteMe()

		slot0.player_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()

	slot0.vo = nil
end
