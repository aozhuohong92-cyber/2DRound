RolePersonalSpaceTabGrowthWayPanel = class("RolePersonalSpaceTabGrowthWayPanel", function ()
	return ccui.Widget:create()
end)
slot1 = RoleController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = math.floor

function RolePersonalSpaceTabGrowthWayPanel.ctor(slot0, slot1)
	slot0.record_count_param = 10
	slot0.parent = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:config()
	slot0:loadResources()
end

function RolePersonalSpaceTabGrowthWayPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("rolegrowthway", "rolegrowthway"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if tolua.isnull(uv0) then
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

function RolePersonalSpaceTabGrowthWayPanel.setVisibleStatus(slot0, slot1)
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
			uv0:send25830(0, slot0.record_count_param or 10)
		elseif slot0.parent.other_data then
			uv0:send25832(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id, 0, slot0.record_count_param or 10)
		end
	end
end

function RolePersonalSpaceTabGrowthWayPanel.config(slot0)
end

function RolePersonalSpaceTabGrowthWayPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_personal_space_tab_growth_way_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot2 = PathTool.getPlistImgForDownLoad("bigbg/rolepersonalspace", "role_growth_way_bg", false)

	if slot0.record_title_img_res == nil or slot0.record_title_img_res ~= slot2 then
		slot0.record_title_img_res = slot2
		slot0.item_load_title_img_res = loadSpriteTextureFromCDN(slot0.title_img, slot2, ResourcesType.single, slot0.item_load_title_img_res)
	end

	slot0.share_btn = slot0.main_container:getChildByName("share_btn")

	slot0.share_btn:getChildByName("label"):setString(TI18N("分享"))

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		slot0.share_btn:setVisible(true)
	else
		slot0.share_btn:setVisible(false)
	end

	slot0.player_name = slot0.main_container:getChildByName("player_name")

	slot0:initScrollview()
end

function RolePersonalSpaceTabGrowthWayPanel.initScrollview(slot0)
	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot1 = slot0.lay_srollview:getContentSize()
	slot0.space_y = 10
	slot0.item_width = 620
	slot0.item_height = 101
	slot0.col = 1
	slot0.cacheMaxSize = math.ceil(slot1.height / (slot0.item_height + slot0.space_y)) + 1
	slot0.cellList = {}
	slot0.cacheList = {}
	slot0.activeCellIdx = {}
	slot0.scroll_view_size = cc.size(slot1.width, slot1.height)
	slot0.scroll_view = createScrollView(slot1.width, slot1.height, 0, 0, slot0.lay_srollview, ScrollViewDir.vertical)
	slot0.scroll_view_container = slot0.scroll_view:getInnerContainer()
end

function RolePersonalSpaceTabGrowthWayPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.share_btn, function (slot0, slot1)
		uv0:onShareBtn(slot1)
	end, true, 1)
	registerButtonEventListener(slot0.show_set_btn, function ()
		uv0:onShowSetBtn()
	end, true, 1)
	registerButtonEventListener(slot0.honor_btn, function ()
		uv0:onHonorBtn()
	end, true, 1)

	if slot0.scroll_view then
		slot0.scroll_view:addEventListener(function (slot0, slot1)
			if slot1 == ccui.ScrollviewEventType.containerMoved then
				uv0:checkOverShowByVertical()
			end
		end)
	end

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		if slot0.myself_growth_way_event == nil then
			slot0.myself_growth_way_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_MYSELF_GROWTH_WAY_EVENT, function (slot0)
				if not slot0 then
					return
				end

				uv0.is_init = true

				if slot0.start ~= 0 then
					uv0:addGrowthWayData()
				else
					uv0:setData(slot0)
				end
			end)
		end
	elseif slot0.other_growth_way_event == nil then
		slot0.other_growth_way_event = GlobalEvent:getInstance():Bind(RoleEvent.ROLE_OHTER_GROWTH_WAY_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0.is_init = true

			if slot0.start ~= 0 then
				uv0:addGrowthWayData()
			else
				uv0:setData(slot0)
			end
		end)
	end
end

function RolePersonalSpaceTabGrowthWayPanel.onShareBtn(slot0, slot1)
	TaskController:getInstance():openTaskSharePanel(true, {
		world_pos = slot1:convertToWorldSpace(cc.p(0.5, 0.5)),
		callback = function (slot0)
			if uv0 and uv0.root_wnd and not tolua.isnull(uv0.root_wnd) then
				uv0:shareCallback(slot0)
			end
		end,
		y = -20
	})
end

function RolePersonalSpaceTabGrowthWayPanel.shareCallback(slot0, slot1)
	if slot1 == VedioConst.Share_Btn_Type.eWorldBtn then
		uv0:send25831(ChatConst.Channel.World)
	elseif slot1 == VedioConst.Share_Btn_Type.eGuildBtn then
		uv0:send25831(ChatConst.Channel.Gang)
	elseif slot1 == VedioConst.Share_Btn_Type.eCrossBtn then
		uv0:send25831(ChatConst.Channel.Cross)
	end
end

function RolePersonalSpaceTabGrowthWayPanel.setData(slot0)
	if not slot0.role_vo then
		return
	end

	if not slot0.parent then
		return
	end

	slot0.isLoadingData = false

	slot0:updateGrowthWaylist()

	slot1 = ""

	if slot0.parent.role_type == RoleConst.role_type.eMySelf then
		slot1 = uv0("%s - %s", getServerName(slot0.role_vo.srv_id) or TI18N("异域"), slot0.role_vo.name)
	elseif slot0.parent.other_data then
		slot1 = uv0("%s - %s", getServerName(slot0.parent.other_data.srv_id) or TI18N("异域"), slot0.parent.other_data.name)
	end

	slot0.player_name:setString(slot1)
end

function RolePersonalSpaceTabGrowthWayPanel.checkOverShowByVertical(slot0)
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

	if slot0.scroll_view_container_size.height <= slot3 then
		slot0:checkLoadData()
	end
end

function RolePersonalSpaceTabGrowthWayPanel.reloadData(slot0, slot1)
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
	slot2 = 0
	slot3 = 0

	if slot0.scroll_view_container_size then
		slot2 = slot0.scroll_view_container_size.width
		slot3 = slot0.scroll_view_container_size.height
	end

	for slot7, slot8 in ipairs(slot0.cacheList) do
		slot8:setPositionX(-10000)
	end

	if slot0:numberOfCells() == 0 then
		return
	end

	slot5 = slot0.item_width * 0.5 + 3
	slot6 = 24
	slot7 = 0
	slot8 = 0
	slot11 = (92 - 2) / 30
	slot12 = TimeTool.day2s()

	for slot16 = 1, slot4 do
		if not slot0.show_list[slot16] then
			return
		end

		slot18 = slot0:getCacheCellByIndex(slot16)

		slot0.test_content:setString(slot17.desc)

		if slot0.test_content:getContentSize().height - slot6 < 0 then
			slot20 = 0
		end

		slot21 = slot0.item_height + slot20
		slot22 = 0

		if slot8 == 0 then
			slot8 = slot17.time
			slot22 = 0
		else
			if slot17.time - slot8 < 0 then
				slot23 = 0
			end

			if slot10 < slot9 + uv0(slot23 / slot12) * slot11 then
				slot22 = slot10
			end

			slot8 = slot17.time
		end

		slot7 = slot7 + slot22

		uv1(slot0.cellList, {
			cell = slot18,
			x = slot5,
			_y = slot7,
			item_height = slot21
		})

		slot7 = slot7 + slot21 + slot0.space_y
	end

	slot17 = slot7 - slot0.space_y

	slot0:setInnerContainer(slot17)

	for slot17, slot18 in ipairs(slot0.cellList) do
		slot18.y = slot0.scroll_view_container_size.height - slot18._y
	end

	slot0.is_data_load_finish = true

	if slot1 then
		slot14 = slot0.cur_container_x or 0

		if (slot0.cur_container_y or 0) > 0 then
			slot15 = 0
		elseif slot15 < slot0.scroll_view_size.height - slot0.scroll_view_container_size.height then
			slot15 = slot0.scroll_view_size.height - slot0.scroll_view_container_size.height
		end

		slot0.scroll_view_container:setPositionY(slot15)
	else
		slot0.scroll_view_container:setPositionY(0)
	end

	slot0:checkOverShowByVertical()
end

function RolePersonalSpaceTabGrowthWayPanel.setInnerContainer(slot0, slot1)
	slot0.scroll_view_container_size = cc.size(slot0.scroll_view_size.width, math.max(slot1, slot0.scroll_view_size.height))

	slot0.scroll_view:setInnerContainerSize(slot0.scroll_view_container_size)
end

function RolePersonalSpaceTabGrowthWayPanel.getCacheCellByIndex(slot0, slot1)
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

function RolePersonalSpaceTabGrowthWayPanel.updateCellAtIndex(slot0, slot1)
	if not slot0.scroll_view_container_size then
		return
	end

	if not slot0.cellList[slot1] then
		return
	end

	if slot0.cellList[slot1].cell == nil then
		slot2.cell = slot0:getCacheCellByIndex(slot1)
	end

	slot2.cell:setPosition(slot2.x, slot2.y)
	slot0:updateCellByIndex(slot2.cell, slot1, slot2.item_height)
end

function RolePersonalSpaceTabGrowthWayPanel.checkLoadData(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.show_list[1] and slot0.show_list[1].order ~= 1 then
		if slot0.isLoadingData then
			return
		end

		slot0.isLoadingData = true

		if slot0.show_list[1].order - slot0.record_count_param <= 0 then
			slot1 = 1
		end

		if slot0.parent.role_type == RoleConst.role_type.eMySelf then
			uv0:send25830(slot1, slot0.show_list[1].order - slot1)
		elseif slot0.parent.other_data then
			uv0:send25832(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id, slot1, slot2)
		else
			return
		end

		slot0:showLoadingUI(true)
		slot0:setLoadingTime()
	end
end

function RolePersonalSpaceTabGrowthWayPanel.showLoadingUI(slot0, slot1)
	if not slot0.scroll_view_container_size then
		return
	end

	if slot1 then
		slot0:setInnerContainer(slot0.scroll_view_container_size.height + 50)

		if slot0.loadingLayout == nil then
			slot0.loadingLayout = ccui.Widget:create()

			slot0.loadingLayout:setContentSize(cc.size(slot0.item_width, 50))
			slot0.loadingLayout:setAnchorPoint(cc.p(0.5, 1))
			slot0.loadingLayout:setPosition(slot0.item_width * 0.5, slot2)

			slot0.loading_label = createLabel(22, cc.c4b(100, 50, 35, 255), nil, slot0.item_width * 0.5, 25, TI18N("加载中"), slot0.loadingLayout, nil, cc.p(0.5, 0.5))

			slot0.scroll_view:addChild(slot0.loadingLayout)
		else
			slot0.loadingLayout:setPosition(slot0.item_width * 0.5, slot2)
			slot0.loadingLayout:setVisible(true)
		end
	else
		if slot0.loadingLayout then
			slot0.loadingLayout:setVisible(false)
		end

		slot0:setInnerContainer(slot0.scroll_view_container_size.height - 50)
	end
end

function RolePersonalSpaceTabGrowthWayPanel.setLoadingTime(slot0)
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

function RolePersonalSpaceTabGrowthWayPanel.setLoadingFormatString(slot0, slot1)
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

function RolePersonalSpaceTabGrowthWayPanel.initShowList(slot0)
	slot1 = nil

	if not ((slot0.parent.role_type ~= RoleConst.role_type.eMySelf or uv0:getGrowthWayData()) and uv0:getOtherGrowthWayData(slot0.parent.other_data.rid, slot0.parent.other_data.srv_id)) then
		return
	end

	slot0.show_list = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7.desc == nil then
			if Config.RoomGrowData.data_growth_way_desc(slot7.id) then
				uv1(slot7.arge, function (slot0, slot1)
					return slot0.pos < slot1.pos
				end)

				slot9 = {}

				for slot13 = 1, 4 do
					if slot7.arge[slot13] == nil then
						uv2(slot9, TI18N("<div fontcolor=#e25a00>未知</div>"))
					else
						uv2(slot9, uv3("<div fontcolor=#e25a00>%s</div>", slot14.val))
					end
				end

				slot7.desc = uv3(slot8.desc, unpack(slot9))
			else
				slot7.desc = TI18N("无记录:" .. tostring(slot7.id))
			end
		end

		uv2(slot0.show_list, slot7)
	end

	if #slot0.show_list > 0 then
		uv2(slot0.show_list, {
			is_last = true,
			order = 999999,
			time = slot0.show_list[#slot0.show_list].time,
			desc = TI18N("继续记录你的冒险之旅")
		})
	end

	uv1(slot0.show_list, function (slot0, slot1)
		return slot0.order < slot1.order
	end)
end

function RolePersonalSpaceTabGrowthWayPanel.addGrowthWayData(slot0)
	if not slot0.loading_label then
		return
	end

	slot0.loading_label:stopAllActions()

	slot0.cur_container_x, slot0.cur_container_y = slot0.scroll_view_container:getPosition()
	slot0.isLoadingData = false

	slot0:showLoadingUI(false)
	slot0:initShowList()
	slot0:reloadData(true)
end

function RolePersonalSpaceTabGrowthWayPanel.updateGrowthWaylist(slot0)
	slot0:initShowList()
	slot0:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true)
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function RolePersonalSpaceTabGrowthWayPanel.createNewCell(slot0)
	return RoleGrowtnWayItem.new(slot0.item_width, slot0.item_height, slot0.parent, slot0.test_content)
end

function RolePersonalSpaceTabGrowthWayPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function RolePersonalSpaceTabGrowthWayPanel.updateCellByIndex(slot0, slot1, slot2, slot3)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot4, slot3)
end

function RolePersonalSpaceTabGrowthWayPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end
end

function RolePersonalSpaceTabGrowthWayPanel.DeleteMe(slot0)
	if slot0.myself_growth_way_event then
		GlobalEvent:getInstance():UnBind(slot0.myself_growth_way_event)

		slot0.myself_growth_way_event = nil
	end

	if slot0.other_growth_way_event then
		GlobalEvent:getInstance():UnBind(slot0.other_growth_way_event)

		slot0.other_growth_way_event = nil
	end

	if slot0.item_load_title_img_res then
		slot0.item_load_title_img_res:DeleteMe()

		item_load_title_img_res = nil
	end

	slot0:showLoadingUI(false)
end

RoleGrowtnWayItem = class("RoleGrowtnWayItem", function ()
	return ccui.Widget:create()
end)

function RoleGrowtnWayItem.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.parent = slot3
	slot0.test_content = slot4

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function RoleGrowtnWayItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("roleinfo/role_growtn_way_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.line_1 = slot0.main_container:getChildByName("line_1")
	slot0.time = slot0.main_container:getChildByName("time")
	slot0.box_bg = slot0.main_container:getChildByName("box_bg")
	slot0.box_bg_size = slot0.box_bg:getContentSize()
	slot0.desc = createRichLabel(22, cc.c4b(24, 138, 214, 255), cc.p(0, 1), cc.p(85, 48), 6, nil, 488)

	slot0.main_container:addChild(slot0.desc)
end

function RoleGrowtnWayItem.register_event(slot0)
end

function RoleGrowtnWayItem.setData(slot0, slot1, slot2)
	slot0.data = slot1

	if slot1.is_last then
		slot0.line_1:setVisible(false)
		slot0.time:setVisible(false)
		slot0.desc:setString(uv0("%s<img src=%s scale=1 />", slot1.desc, PathTool.getResFrame("rolegrowthway", "role_growth_way_06")))
		slot0.desc:setPositionY(70)
	else
		slot0.line_1:setVisible(true)
		slot0.time:setVisible(true)
		slot0.desc:setString(slot1.desc)
		slot0.desc:setPositionY(48)
		slot0.time:setString(TimeTool.getYMD3(slot1.time))
	end

	slot0.box_bg:setContentSize(cc.size(slot0.box_bg_size.width, slot2 - 2))
end

function RoleGrowtnWayItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.honor_item:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
