RolePersonalSpaceTabMessageBoardPanel = class("RolePersonalSpaceTabMessageBoardPanel", function ()
	return ccui.Widget:create()
end)
slot1 = RoleController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = math.floor

function RolePersonalSpaceTabMessageBoardPanel.ctor(slot0, slot1)
	slot0.record_count_param = 300
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:loadResources()
end

function RolePersonalSpaceTabMessageBoardPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("rolemessageboard", "rolemessageboard"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if tolua.isnull(uv0) or not uv0.layoutUI then
			return
		end

		uv0:layoutUI()
		uv0:registerEvents()

		uv0.is_load_completed = true

		if uv0.visible_status then
			uv0:setVisibleStatus(true)
		end
	end)
end

function RolePersonalSpaceTabMessageBoardPanel.setVisibleStatus(slot0, slot1)
	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 and slot0.is_load_completed then
		GlobalEvent:getInstance():Fire(RoleEvent.ROLE_PS_CHANGE_PANEL_EVENT)

		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			uv0:send25837(slot0.role_vo.rid, slot0.role_vo.srv_id, 0, slot0.record_count_param or 10)
		elseif slot0.parent.other_data then
			uv0:send25837(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id, 0, slot0.record_count_param or 10)
		end
	end
end

function RolePersonalSpaceTabMessageBoardPanel.config(slot0)
	slot0.is_autoscrollEnded = true
	slot1 = 48

	if Config.RoomGrowData.data_const.bbs_writing_number then
		slot1 = slot2.val
	end

	slot0.limit_sad_count = slot1
	slot0.default_content_msg = TI18N("发表留言")
	slot0.select_combox_type = 1

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.role_vo then
			slot0.select_combox_type = slot0.role_vo.room_bbs_set or 1
		end
	elseif slot0.parent.other_data then
		slot0.select_combox_type = slot0.parent.other_data.room_bbs_set or 1
	end

	slot0.combox_list = {
		{
			combox_type = 1,
			desc = TI18N("允许所有人留言")
		},
		{
			combox_type = 2,
			desc = TI18N("仅允许好友留言")
		}
	}
	slot0.dic_role_info = {}
end

function RolePersonalSpaceTabMessageBoardPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_personal_space_tab_message_board_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.combobox_btn = slot0.main_container:getChildByName("combobox_btn")
	slot0.combobox_btn_label = slot0.combobox_btn:getChildByName("label")
	slot0.arrow_img = slot0.combobox_btn:getChildByName("arrow_img")
	slot0.combobox_panel = slot0.main_container:getChildByName("combobox_panel")

	slot0.combobox_panel:setVisible(false)

	slot0.combobox_bg = slot0.combobox_panel:getChildByName("bg")
	slot0.combobox_bg_size = slot0.combobox_bg:getContentSize()
	slot0.combobox_max_size = cc.size(slot0.combobox_bg_size.width, 200)

	slot0:setComboboxName(slot0.select_combox_type)

	slot0.message_btn = slot0.main_container:getChildByName("message_btn")

	slot0.message_btn:getChildByName("label"):setString(TI18N("留 言"))

	slot0.face_btn = slot0.main_container:getChildByName("face_btn")

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		slot0.arrow_img:setVisible(true)
	else
		slot0.arrow_img:setVisible(false)
	end

	slot0.input_edit = createEditBox(slot0.main_container, PathTool.getResFrame("common", "common_1021"), cc.size(348, 48), Config.ColorData.data_color3[81], 20, nil, 20, slot0.default_content_msg, nil, slot0.limit_sad_count, LOADTEXT_TYPE_PLIST)

	slot0.input_edit:setAnchorPoint(cc.p(0, 1))
	slot0.input_edit:setPosition(62, 142)
	slot0:initScrollview()
end

function RolePersonalSpaceTabMessageBoardPanel.initScrollview(slot0)
	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot1 = slot0.lay_srollview:getContentSize()
	slot0.space_y = 10
	slot0.item_width = 600
	slot0.item_height = 160
	slot0.col = 1
	slot0.cacheMaxSize = math.ceil(slot1.height / (slot0.item_height + slot0.space_y)) + 1
	slot0.cellList = {}
	slot0.cacheList = {}
	slot0.activeCellIdx = {}
	slot0.scroll_view_size = cc.size(slot1.width, slot1.height)
	slot0.scroll_view = createScrollView(slot1.width, slot1.height, 0, 0, slot0.lay_srollview, ScrollViewDir.vertical)

	slot0.scroll_view:setSwallowTouches(true)

	slot0.scroll_view_container = slot0.scroll_view:getInnerContainer()
end

function RolePersonalSpaceTabMessageBoardPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.combobox_btn, function ()
		uv0:onComboboxBtn()
	end, false, 1)
	registerButtonEventListener(slot0.message_btn, function ()
		uv0:onMessageBtn()
	end, true, 1)
	registerButtonEventListener(slot0.face_btn, function (slot0, slot1)
		uv0:onFaceBtn(slot1)
	end, true, 1)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:showComboboxList(false)
	end, false, 0)

	if slot0.scroll_view then
		slot0.scroll_view:addEventListener(function (slot0, slot1)
			if slot1 == ccui.ScrollviewEventType.containerMoved then
				uv0:checkOverShowByVertical()
			elseif slot1 == ccui.ScrollviewEventType.autoscrollEnded then
				uv0.is_autoscrollEnded = true
			end
		end)
	end

	if slot0.message_board_get_info_event == nil then
		slot0.message_board_get_info_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_MESSAGE_BOARD_GET_INFO_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_init = true

			uv0:setData(slot0)
		end)
	end

	if slot0.message_board_new_info_event == nil then
		slot0.message_board_new_info_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_MESSAGE_BOARD_NEW_INFO_EVENT, function (slot0)
			uv0:initShowList()
			uv0.input_edit:setText("")

			if uv0.scroll_view then
				uv0:reloadData()
			end
		end)
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.message_board_delete_info_event == nil then
			slot0.message_board_delete_info_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_MESSAGE_BOARD_DELETE_INFO_EVENT, function (slot0)
				uv0:initShowList()

				if uv0.scroll_view then
					uv0.cur_container_x, uv0.cur_container_y = uv0.scroll_view_container:getPosition()

					uv0:reloadData(true)
				end
			end)
		end

		if slot0.message_board_limit_event == nil then
			slot0.message_board_limit_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_MESSAGE_BOARD_LIMMIT_EVENT, function (slot0)
				if not slot0 then
					return
				end

				uv0.select_combox_type = slot0.type

				uv0:setComboboxName(uv0.select_combox_type)
			end)
		end
	end

	if not slot0.add_face_evt then
		slot0.add_face_evt = GlobalEvent:getInstance():Bind(EventId.CHAT_SELECT_FACE, function (slot0, slot1)
			if not uv0.input_edit then
				return
			end

			if slot1 == ChatConst.ChatInputType.eMessageBoardpanel then
				slot2 = uv0.input_edit:getText()

				uv0.input_edit:setText(slot2 .. slot0)
				GlobalEvent:getInstance():Fire(ChatEvent.FACE_COUNT_EVENT, (WordCensor:getInstance():relapceFaceIconTag(slot2)[1] or 0) + 1)
			end
		end)
	end
end

function RolePersonalSpaceTabMessageBoardPanel.onFaceBtn(slot0)
	RefController:getInstance():openView(ChatConst.ChatInputType.eMessageBoardpanel, {
		world_pos = slot0.face_btn:convertToWorldSpace(cc.p(0, 0)),
		offset_y = 78
	}, ChatConst.Channel.Province)
end

function RolePersonalSpaceTabMessageBoardPanel.onComboboxBtn(slot0)
	if not slot0.parent then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.is_show_combobox_panel then
			slot0:showComboboxList(false)
		else
			slot0:showComboboxList(true)
		end
	end
end

function RolePersonalSpaceTabMessageBoardPanel.onMessageBtn(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if not slot0.input_edit then
		return
	end

	if not slot0.parent then
		return
	end

	if not slot0.role_vo then
		return
	end

	if slot0.input_edit:getText() == nil or slot1 == "" then
		message(TI18N("请输入留言内容"))

		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		uv0:send25835(slot0.role_vo.rid, slot0.role_vo.srv_id, slot1)
	elseif slot0.parent.other_data then
		uv0:send25835(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id, slot1)
	end
end

function RolePersonalSpaceTabMessageBoardPanel.setData(slot0)
	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	slot0.isLoadingData = false

	slot0:updateMessageBoardlist()
end

function RolePersonalSpaceTabMessageBoardPanel.checkOverShowByVertical(slot0)
	if not slot0.cellList then
		return
	end

	if not slot0.scroll_view_container_size then
		return
	end

	if not slot0.is_data_load_finish then
		return
	end

	slot5 = 1
	slot6 = 0

	for slot10 = 1, math.ceil(#slot0.cellList / slot0.col) do
		slot5 = slot10

		if slot12 and slot0.scroll_view_size.height + -slot0.scroll_view_container:getPositionY() >= slot12.y - (slot0.cellList[1 + (slot10 - 1) * slot0.col].item_height or slot0.item_height) then
			break
		end
	end

	slot7 = slot4

	if slot2 > 0 then
		for slot11 = slot5, slot4 do
			if slot0.cellList[1 + (slot11 - 1) * slot0.col] and slot13.y < slot2 then
				slot7 = slot11 - 1

				break
			end
		end
	end

	slot8 = slot0:numberOfCells()

	for slot12 = 1, slot4 do
		if slot5 <= slot12 and slot12 <= slot7 then
			for slot16 = 1, slot0.col do
				if not slot0.activeCellIdx[(slot12 - 1) * slot0.col + slot16] and slot17 <= slot8 then
					slot0:updateCellAtIndex(slot17)

					slot0.activeCellIdx[slot17] = true
				end
			end
		else
			for slot16 = 1, slot0.col do
				if slot8 >= (slot12 - 1) * slot0.col + slot16 then
					slot0.activeCellIdx[slot17] = false
				end
			end
		end
	end

	if slot0.is_autoscrollEnded and slot2 < -30 then
		slot0.is_autoscrollEnded = false

		slot0:checkLoadData()
	end
end

function RolePersonalSpaceTabMessageBoardPanel.reloadData(slot0, slot1, slot2)
	if not slot0.show_list then
		return
	end

	if slot0.test_content == nil then
		slot0.test_content = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(-10000, 48), 6, nil, 488)

		slot0.main_container:addChild(slot0.test_content)
	end

	slot0.is_data_load_finish = false
	slot0.cellList = {}
	slot0.activeCellIdx = {}
	slot3 = 0
	slot4 = 0

	if slot0.scroll_view_container_size then
		slot3 = slot0.scroll_view_container_size.width
		slot4 = slot0.scroll_view_container_size.height
	end

	for slot8, slot9 in ipairs(slot0.cacheList) do
		slot9:setPositionX(-10000)
	end

	if slot0:numberOfCells() == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("还没有留言信息哦")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end

	if slot5 == 0 then
		return
	end

	slot6 = slot0.item_width * 0.5
	slot7 = 24
	slot8 = 20
	slot9 = 0
	slot12 = (92 - 2) / 30
	slot13 = TimeTool.day2s()

	for slot17 = 1, slot5 do
		if not slot0.show_list[slot17] then
			return
		end

		slot19 = slot0:getCacheCellByIndex(slot17)

		slot0.test_content:setString(slot18.desc)

		if slot0.test_content:getContentSize().height - slot7 < 0 then
			slot21 = 0
		end

		slot22 = slot0.item_height + slot21

		uv0(slot0.cellList, {
			cell = slot19,
			x = slot6,
			_y = slot8,
			item_height = slot22,
			text_height = slot21
		})

		slot8 = slot8 + slot22 + slot0.space_y
	end

	slot18 = slot8 - slot0.space_y

	slot0:setInnerContainer(slot18)

	for slot18, slot19 in ipairs(slot0.cellList) do
		slot19.y = slot0.scroll_view_container_size.height - slot19._y
	end

	slot0.is_data_load_finish = true

	if slot1 then
		slot16 = slot0.cur_container_x or 0

		if (slot0.cur_container_y or 0) - (slot0.scroll_view_container_size.height - slot4) + (slot2 or 0) > 0 then
			slot17 = 0
		elseif slot17 < slot0.scroll_view_size.height - slot0.scroll_view_container_size.height then
			slot17 = slot0.scroll_view_size.height - slot0.scroll_view_container_size.height
		end

		slot0.scroll_view_container:setPositionY(slot17)
	else
		slot0.scroll_view_container:setPositionY(slot0.scroll_view_size.height - slot0.scroll_view_container_size.height)
	end

	if slot0.parent.bbs_id then
		for slot18, slot19 in ipairs(slot0.show_list) do
			if slot19.bbs_id == slot0.parent.bbs_id and slot0.cellList[slot18] then
				slot0.scroll_view_container:setPositionY(-(slot0.cellList[slot18].y - slot0.scroll_view_size.height))

				break
			end
		end

		slot0.parent.bbs_id = nil
	end

	slot0:checkOverShowByVertical()
end

function RolePersonalSpaceTabMessageBoardPanel.setInnerContainer(slot0, slot1)
	slot0.scroll_view_container_size = cc.size(slot0.scroll_view_size.width, math.max(slot1, slot0.scroll_view_size.height))

	slot0.scroll_view:setInnerContainerSize(slot0.scroll_view_container_size)
end

function RolePersonalSpaceTabMessageBoardPanel.getCacheCellByIndex(slot0, slot1)
	if not slot0.cacheList[(slot1 - 1) % slot0.cacheMaxSize + 1] then
		if slot0:createNewCell() then
			slot3:setAnchorPoint(cc.p(0.5, 1))
			slot3:setPositionX(-10000)

			slot0.cacheList[slot2] = slot3

			slot0.scroll_view:addChild(slot3)
		end

		return slot3
	else
		return slot0.cacheList[slot2]
	end
end

function RolePersonalSpaceTabMessageBoardPanel.updateCellAtIndex(slot0, slot1)
	if not slot0.scroll_view_container_size then
		return
	end

	if not slot0.cellList[slot1] then
		return
	end

	if slot0.cellList[slot1].cell == nil then
		slot2.cell = slot0:getCacheCellByIndex(slot1)
	end

	if slot0.isLoadingData then
		slot2.cell:setPosition(slot2.x, slot2.y + 50)
	else
		slot2.cell:setPosition(slot2.x, slot2.y)
	end

	slot0:updateCellByIndex(slot2.cell, slot1, slot2.text_height)
end

function RolePersonalSpaceTabMessageBoardPanel.resetCurrentPos(slot0)
	for slot4, slot5 in pairs(slot0.activeCellIdx) do
		if slot5 and slot0.cellList[slot4] then
			if slot0.cellList[slot4].cell == nil then
				slot6.cell = slot0:getCacheCellByIndex(slot4)
			end

			if slot0.isLoadingData then
				slot6.cell:setPosition(slot6.x, slot6.y + 50)
			else
				slot6.cell:setPosition(slot6.x, slot6.y)
			end
		end
	end
end

function RolePersonalSpaceTabMessageBoardPanel.checkLoadData(slot0)
end

function RolePersonalSpaceTabMessageBoardPanel.showLoadingUI(slot0, slot1)
	if not slot0.scroll_view_container_size then
		return
	end

	if slot1 then
		slot0:setInnerContainer(slot0.scroll_view_container_size.height + 50)

		if slot0.loadingLayout == nil then
			slot0.loadingLayout = ccui.Widget:create()

			slot0.loadingLayout:setContentSize(cc.size(slot0.item_width, 50))
			slot0.loadingLayout:setAnchorPoint(cc.p(0.5, 0))
			slot0.loadingLayout:setPosition(slot0.item_width * 0.5, 0)

			slot0.loading_label = createLabel(22, cc.c4b(100, 50, 35, 255), nil, slot0.item_width * 0.5, 25, TI18N("加载中"), slot0.loadingLayout, nil, cc.p(0.5, 0.5))

			slot0.scroll_view:addChild(slot0.loadingLayout)
		else
			slot0.loadingLayout:setPosition(slot0.item_width * 0.5, 0)
			slot0.loadingLayout:setVisible(true)
		end
	else
		if slot0.loadingLayout then
			slot0.loadingLayout:setVisible(false)
		end

		slot0:setInnerContainer(slot0.scroll_view_container_size.height - 50)
	end
end

function RolePersonalSpaceTabMessageBoardPanel.setLoadingTime(slot0)
	if tolua.isnull(slot0.loading_label) then
		return
	end

	slot0.loading_label:stopAllActions()

	slot0.time_step = 0

	slot0:setLoadingFormatString(1)
	slot0.loading_label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.5), cc.CallFunc:create(function ()
		uv0 = uv0 + 1

		if uv0 > 4 then
			uv0 = 1
		end

		uv1.time_step = uv1.time_step + 1

		uv1:setLoadingFormatString(uv0)
	end))))
end

function RolePersonalSpaceTabMessageBoardPanel.setLoadingFormatString(slot0, slot1)
	if slot1 == 1 then
		slot0.loading_label:setString(TI18N("加载中."))
	elseif slot1 == 2 then
		slot0.loading_label:setString(TI18N("加载中.."))
	elseif slot1 == 3 then
		slot0.loading_label:setString(TI18N("加载中..."))
	else
		slot0.loading_label:setString(TI18N("加载中"))
	end
end

function RolePersonalSpaceTabMessageBoardPanel.initShowList(slot0)
	if not slot0.role_vo then
		return
	end

	slot1 = nil

	if not ((slot0.parent.role_type ~= RoleConst.role_type.eMySelf or uv0:getMessageBoardData(slot0.role_vo.srv_id, slot0.role_vo.rid)) and uv0:getMessageBoardData(slot0.parent.other_data.srv_id, slot0.parent.other_data.rid)) then
		return
	end

	slot0.dic_role_info = {}
	slot0.show_list = {}

	for slot5, slot6 in pairs(slot1) do
		if slot6.desc == nil then
			if slot6.bbs_type == 2 then
				slot6.desc = uv1(TI18N("回复<div fontcolor=#e25a00>%s</div>：%s"), slot6.reply_name, WordCensor:getInstance():relapceFaceIconTag(slot6.msg or "")[2])
			else
				slot6.desc = slot7
			end
		end

		uv2(slot0.show_list, slot6)
	end

	function slot5(slot0, slot1)
		return slot1.bbs_id < slot0.bbs_id
	end

	uv3(slot0.show_list, slot5)

	for slot5, slot6 in ipairs(slot0.show_list) do
		if slot0.dic_role_info[uv0:getKeyBySrvidAndRid(slot6.srv_id, slot6.rid)] == nil then
			slot0.dic_role_info[slot7] = slot6
		end
	end
end

function RolePersonalSpaceTabMessageBoardPanel.addGrowthWayData(slot0)
	if slot0.loading_label then
		slot0.loading_label:stopAllActions()
	end

	slot0.cur_container_x, slot0.cur_container_y = slot0.scroll_view_container:getPosition()

	slot0:showLoadingUI(false)
	slot0:initShowList()
	slot0:reloadData(true, 50)

	slot0.isLoadingData = false
end

function RolePersonalSpaceTabMessageBoardPanel.updateMessageBoardlist(slot0)
	slot0:initShowList()
	slot0:reloadData()
end

function RolePersonalSpaceTabMessageBoardPanel.createNewCell(slot0)
	return RoleMessageBoardItem.new(slot0.item_width, slot0.item_height, slot0.parent, slot0.test_content)
end

function RolePersonalSpaceTabMessageBoardPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RolePersonalSpaceTabMessageBoardPanel.updateCellByIndex(slot0, slot1, slot2, slot3)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setZOrder(slot2)
	slot1:setData(slot4, slot3, slot0.dic_role_info)
end

function RolePersonalSpaceTabMessageBoardPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end
end

function RolePersonalSpaceTabMessageBoardPanel.setComboboxName(slot0, slot1)
	if not slot0.combox_list then
		return
	end

	if not slot1 then
		return
	end

	if slot0.combox_list[slot1] then
		slot0.combobox_btn_label:setString(slot0.combox_list[slot1].desc)
	end
end

function RolePersonalSpaceTabMessageBoardPanel.showComboboxList(slot0, slot1)
	if not slot0.combobox_panel then
		return
	end

	if not slot0.combox_list then
		return
	end

	if slot1 then
		slot0.is_show_combobox_panel = true

		slot0.combobox_panel:setVisible(true)

		if slot0.combox_item_list == nil then
			slot0.combox_item_list = {}
			slot10 = slot0.combobox_bg_size.width
			slot11 = #slot0.combox_list * 42 + 30

			slot0.combobox_bg:setContentSize(cc.size(slot10, slot11))

			for slot10, slot11 in ipairs(slot0.combox_list) do
				slot12 = slot10
				slot13 = slot0:createNewComboxItem(slot3, function ()
					for slot3, slot4 in ipairs(uv0.combox_list) do
						if slot4.combox_type == uv1 then
							if uv0.combox_item_list[slot3] then
								uv0.combox_item_list[slot3].select_bg:setVisible(true)
								uv0.combox_item_list[slot3].mark_img:setVisible(true)
							end
						elseif uv0.combox_item_list[slot3] then
							uv0.combox_item_list[slot3].select_bg:setVisible(false)
							uv0.combox_item_list[slot3].mark_img:setVisible(false)
						end
					end

					if uv1 ~= uv0.select_combox_type then
						uv2:send25839(uv1)
						uv0:showComboboxList(false)
					end
				end)

				slot13.label:setString(slot11.desc)
				slot13.layout:setPosition(slot0.combobox_bg_size.width * 0.5, 180 - slot3 * 0.5 - (slot10 - 1) * slot3)
				slot0.combobox_panel:addChild(slot13.layout)

				slot0.combox_item_list[slot10] = slot13
			end
		end

		for slot5, slot6 in ipairs(slot0.combox_list) do
			if slot6.combox_type == slot0.select_combox_type then
				if slot0.combox_item_list[slot5] then
					slot0.combox_item_list[slot5].select_bg:setVisible(true)
					slot0.combox_item_list[slot5].mark_img:setVisible(true)
				end
			elseif slot0.combox_item_list[slot5] then
				slot0.combox_item_list[slot5].select_bg:setVisible(false)
				slot0.combox_item_list[slot5].mark_img:setVisible(false)
			end
		end
	else
		slot0.is_show_combobox_panel = false

		slot0.combobox_panel:setVisible(false)
	end
end

function RolePersonalSpaceTabMessageBoardPanel.createNewComboxItem(slot0, slot1, slot2)
	slot3 = 280
	slot4 = slot1 or 42
	slot5 = {
		layout = slot6:create()
	}
	slot6 = ccui.Layout

	slot5.layout:setCascadeOpacityEnabled(true)
	slot5.layout:setAnchorPoint(0.5, 0.5)
	slot5.layout:setTouchEnabled(true)
	slot5.layout:setContentSize(cc.size(slot3, slot4))

	slot5.select_bg = createImage(slot5.layout, PathTool.getResFrame("common", "common_90058_1"), 0, 2, cc.p(0, 0), true, 0, true)

	slot5.select_bg:setContentSize(cc.size(slot3, slot4 - 2))
	slot5.select_bg:setCapInsets(cc.rect(8, 10, 2, 1))
	slot5.select_bg:setVisible(false)

	slot5.label = createLabel(20, cc.c4b(255, 249, 218, 255), nil, 10, slot4 * 0.5, "", slot5.layout, nil, cc.p(0, 0.5))
	slot5.mark_img = createSprite(PathTool.getResFrame("common", "common_1043"), slot3 - 10, slot4 * 0.5 + 2, slot5.layout, cc.p(1, 0.5), LOADTEXT_TYPE_PLIST)

	slot5.mark_img:setScale(0.8)
	slot5.layout:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0 then
				uv0()
			end
		end
	end)

	return slot5
end

function RolePersonalSpaceTabMessageBoardPanel.DeleteMe(slot0)
	if slot0.message_board_get_info_event then
		GlobalEvent:getInstance():UnBind(slot0.message_board_get_info_event)

		slot0.message_board_get_info_event = nil
	end

	if slot0.message_board_new_info_event then
		GlobalEvent:getInstance():UnBind(slot0.message_board_new_info_event)

		slot0.message_board_new_info_event = nil
	end

	if slot0.message_board_limit_event then
		GlobalEvent:getInstance():UnBind(slot0.message_board_limit_event)

		slot0.message_board_limit_event = nil
	end

	if slot0.message_board_delete_info_event then
		GlobalEvent:getInstance():UnBind(slot0.message_board_delete_info_event)

		slot0.message_board_delete_info_event = nil
	end

	if slot0.other_growth_way_event then
		GlobalEvent:getInstance():UnBind(slot0.other_growth_way_event)

		slot0.other_growth_way_event = nil
	end

	if slot0.add_face_evt then
		GlobalEvent:getInstance():UnBind(slot0.add_face_evt)

		slot0.add_face_evt = nil
	end

	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	if slot0.parent.role_type == RoleConst.role_type.eOther then
		if slot0.parent.other_data then
			uv0:removeMessageBoardData(slot0.parent.other_data.srv_id, slot0.parent.other_data.rid)
		end
	else
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.BBS_message)
		PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.BBS_message_reply_self)

		if slot0.role_vo then
			RoleController:getInstance():send25840(slot0.role_vo.rid, slot0.role_vo.srv_id, 0)
		end
	end

	slot0:showLoadingUI(false)
end

RoleMessageBoardItem = class("RoleMessageBoardItem", function ()
	return ccui.Widget:create()
end)

function RoleMessageBoardItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function RoleMessageBoardItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_message_board_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.box_bg_03 = slot0.main_container:getChildByName("box_bg_03")
	slot0.box_bg_03_size = slot0.box_bg_03:getContentSize()
	slot0.box_bg_04 = slot0.main_container:getChildByName("box_bg_04")
	slot0.box_bg_04_size = slot0.box_bg_04:getContentSize()
	slot0.time = slot0.main_container:getChildByName("time")
	slot0.name = slot0.main_container:getChildByName("name")
	slot0.chat_btn = slot0.main_container:getChildByName("chat_btn")
	slot0.remove_btn = slot0.main_container:getChildByName("remove_btn")

	if slot0.parent.role_type == RoleConst.role_type.eOther then
		slot0.remove_btn:setVisible(false)
	end

	slot0.desc = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0, 1), cc.p(36, 50), 6, nil, 510)

	slot0.main_container:addChild(slot0.desc)

	slot0.head = PlayerHead.new(PlayerHead.type.circle)

	slot0.head:setAnchorPoint(cc.p(0, 0))
	slot0.head:setPosition(cc.p(16, 77))
	slot0.head:setScale(0.7)
	slot0.main_container:addChild(slot0.head)
	slot0.head:addCallBack(function ()
		uv0:onHeadBtn()
	end)
end

function RoleMessageBoardItem.register_event(slot0)
	registerButtonEventListener(slot0.chat_btn, function ()
		uv0:onChatBtn()
	end, true, 1)
	registerButtonEventListener(slot0.remove_btn, function ()
		uv0:onRemoveBtn()
	end, true, 1)
end

function RoleMessageBoardItem.onChatBtn(slot0)
	if isQingmingShield and isQingmingShield() then
		return
	end

	if not slot0.data then
		return
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if RoleController:getInstance():getRoleVo() then
			-- Nothing
		end
	elseif slot0.parent.other_data then
		slot1.rid = slot0.parent.other_data.rid
		slot1.srv_id = slot0.parent.other_data.srv_id
	end

	uv0:openRoleMessageBoardReplyPanel(true, {
		name = slot0.data.name,
		rid = slot2.rid,
		srv_id = slot2.srv_id,
		bbs_id = slot0.data.bbs_id
	})
end

function RoleMessageBoardItem.onRemoveBtn(slot0)
	if not slot0.data then
		return
	end

	CommonAlert.show(TI18N("确定要删除这条留言吗？"), TI18N("确定"), function ()
		uv0:send25838(uv1.data.bbs_id)
	end, TI18N("取消"))
end

function RoleMessageBoardItem.onHeadBtn(slot0)
	if not slot0.data then
		return
	end

	if not RoleController:getInstance():getRoleVo() then
		return
	end

	if slot0.data.rid == slot1.rid and slot0.data.srv_id == slot1.srv_id then
		message(TI18N("连自己都不认识了吗"))
	else
		FriendController:getInstance():openFriendCheckPanel(true, slot0.data)
	end
end

function RoleMessageBoardItem.setData(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot4 = nil

	slot0.name:setString((not RoleController:getInstance():getRoleVo() or slot5.srv_id ~= slot1.srv_id or slot1.name) and uv0("[%s]%s", getServerName(slot1.srv_id) or "", slot1.name))
	slot0.desc:setString(slot1.desc)
	slot0.time:setString(TimeTool.getMessageBoardTime(slot1.time))
	slot0.box_bg_03:setContentSize(cc.size(slot0.box_bg_03_size.width, slot0.box_bg_03_size.height + slot2 - 2))
	slot0.box_bg_04:setContentSize(cc.size(slot0.box_bg_04_size.width, slot0.box_bg_04_size.height + slot2 - 2))

	if slot5 and slot5.srv_id == slot1.srv_id and slot5.rid == slot1.rid then
		slot0.head:setHeadRes(slot5.face_id, false, LOADTEXT_TYPE, slot5.face_file, slot5.face_update_time)

		if Config.AvatarData.data_avatar[slot5.avatar_base_id] then
			slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot6.res_id or 1), false, false), nil, false, slot6.offy)
		end

		slot0.head:setLev(slot5.lev)
		slot0.head:setSex(slot5.sex, cc.p(70, 4))
	else
		if slot3[uv1:getKeyBySrvidAndRid(slot1.srv_id, slot1.rid)] == nil then
			slot7 = slot1
		end

		slot0.head:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)

		if Config.AvatarData.data_avatar[slot7.avatar_id] then
			slot0.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot8.res_id or 1), false, false), nil, false, slot8.offy)
		end

		slot0.head:setLev(slot7.lev)
		slot0.head:setSex(slot7.sex, cc.p(70, 4))
	end
end

function RoleMessageBoardItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.honor_item:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
