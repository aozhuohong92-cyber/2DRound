HomePetGooutProgressPanel = HomePetGooutProgressPanel or BaseClass(BaseView)
slot1 = HomepetController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format

function HomePetGooutProgressPanel.__init(slot0, slot1)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("homepet_travelling", "homepet_travelling"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_travelling_bg"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "homepet/home_pet_goout_progress_panel"
	slot0.item_list = {}
	slot0.line_list = {}
	slot0.start_x = 10
	slot0.offset_y = 40
	slot0.homepet_vo = uv0:getHomePetVo()
	slot0.show_type = slot1 or 1
end

function HomePetGooutProgressPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("旅行中"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.time_val = slot0.main_container:getChildByName("time_val")
	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)
	slot0.item_scrollview:setSwallowTouches(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot0.item_scrollview_container = slot0.item_scrollview:getInnerContainer()
	slot2 = slot0.item_scrollview_container:getPositionY()

	slot0.item_scrollview_container:setPositionY(0)

	slot0.mask_layout = slot0.main_container:getChildByName("mask_layout")
	slot0.mask_layout_size = slot0.mask_layout:getContentSize()
	slot0.bg_node = slot0.mask_layout:getChildByName("bg_node")
	slot0.pet_node = slot0.mask_layout:getChildByName("pet_node")
	slot0.btn_goto = slot0.main_container:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("label"):setString(TI18N("行囊"))
end

function HomePetGooutProgressPanel.playEnterAnimatian(slot0)
	if not slot0.main_container then
		return
	end

	if slot0.show_type and slot0.show_type == 1 then
		commonOpenActionCentreScale(slot0.main_container)
	else
		commonOpenActionLeftMove(slot0.main_container)
	end
end

function HomePetGooutProgressPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:onClosedBtn()
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:onClosedBtn()
	end, true, 2)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:onGotoBtn()
	end, true, 1)
	slot0.item_scrollview:addEventListener(function (slot0, slot1)
		if slot1 == ccui.ScrollviewEventType.containerMoved then
			uv0:checkOverShowByVertical()
		end
	end)
	slot0:addGlobalEvent(HomepetEvent.HOME_PET_THIS_TIME_ALL_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:initShowList(slot0, true)

		uv0.is_init_data = true
	end)
	slot0:addGlobalEvent(HomepetEvent.HOME_PET_GO_OUT_NEW_EVENT, function (slot0)
		if not slot0 then
			return
		end

		for slot4, slot5 in ipairs(slot0.evt_list) do
			if slot5.evt_sid == 2 then
				uv0:onClosedBtn()

				return
			end
		end
	end)
end

function HomePetGooutProgressPanel.onClosedBtn(slot0)
	uv0:openHomePetGooutProgressPanel(false)
end

function HomePetGooutProgressPanel.onGotoBtn(slot0)
	slot0:onClosedBtn()
	uv0:openHomePetTravellingBagPanel(true, {
		is_goto = true,
		show_type = 2
	})
end

function HomePetGooutProgressPanel.checkOverShowByVertical(slot0)
	if not slot0.item_list then
		return
	end

	slot2 = slot0.offset_y * 0.5

	for slot8, slot9 in pairs(slot0.item_list) do
		if slot0.show_list[slot8] and slot10.size then
			if slot0.item_scrollview_size.height + -slot0.item_scrollview_container:getPositionY() < slot9:getPositionY() - slot10.size.height then
				slot9:setVisible(false)
			elseif slot3 > slot11 + slot2 then
				slot9:setVisible(false)
			else
				slot9:setVisible(true)
			end
		end
	end
end

function HomePetGooutProgressPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	doStopAllActions(slot0.time_val)
	slot0:setTimeFormatString(slot1)
	slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
		uv0 = uv0 + 1

		uv1:checkShowList(uv0)
		uv1:setTimeFormatString(uv0)
	end))))
end

function HomePetGooutProgressPanel.setTimeFormatString(slot0, slot1)
	slot0.time_val:setString(TimeTool.GetTimeForFunction(slot1))
end

function HomePetGooutProgressPanel.openRootWnd(slot0, slot1)
	if not slot0.homepet_vo then
		return
	end

	slot2 = slot1 or {}

	slot0:runPetTimer()
	slot0:playPetSpine()
	uv0:sender26109()
end

function HomePetGooutProgressPanel.initShowList(slot0, slot1, slot2)
	if not slot0.homepet_vo then
		return
	end

	slot0.start_time = slot1.start_time

	if slot0.start_time == 0 then
		slot0.start_time = GameNet:getInstance():getTime()
	end

	slot0.dic_show_data = {}
	slot4 = slot0.homepet_vo:getPetName() or ""

	for slot8, slot9 in ipairs(slot1.evt_list) do
		if slot0.dic_show_data[slot9.evt_id] == nil then
			if slot9.evt_sid == 2 then
				slot0.dic_show_data[slot9.evt_id] = {
					evt_id = slot9.evt_id,
					show_time = slot9.time - slot0.start_time,
					evt_sid = slot9.evt_sid
				}
			elseif slot9.evt_sid ~= 1 and Config.HomePetData.data_event_info[slot9.evt_sid] then
				slot0.dic_show_data[slot9.evt_id] = {
					text = uv0("<div fontcolor=#249003>[%s]</div> %s", TimeTool.getHMS(slot9.time), uv0(slot10.desc, slot4, slot4)),
					evt_id = slot9.evt_id,
					show_time = slot9.time - slot0.start_time,
					evt_sid = slot9.evt_sid
				}
			end
		end
	end

	slot0.show_list = {}
	slot0.total_list = {}
	slot0.dic_evt_id = {}

	for slot8, slot9 in pairs(slot0.dic_show_data) do
		uv1(slot0.total_list, slot9)
	end

	uv2(slot0.total_list, function (slot0, slot1)
		return slot0.evt_id < slot1.evt_id
	end)

	if slot1.start_time == 0 then
		slot0:setLessTime(0)
		slot0:checkShowList(0, true)
	else
		slot5 = slot3 - slot1.start_time

		slot0:setLessTime(slot5)
		slot0:checkShowList(slot5, true)
	end
end

function HomePetGooutProgressPanel.checkShowList(slot0, slot1, slot2)
	if slot0.is_init_scroll_view then
		return
	end

	slot3 = false

	for slot7, slot8 in ipairs(slot0.total_list) do
		if slot0.dic_evt_id[slot8.evt_id] == nil and slot8.show_time <= slot1 then
			slot0.dic_evt_id[slot8.evt_id] = true

			if slot8.evt_sid ~= 2 then
				uv0(slot0.show_list, slot8)

				slot3 = true
			end
		end
	end

	if slot2 then
		slot0:initScrollViewList()
	elseif slot3 then
		slot0:updateList()
	end
end

function HomePetGooutProgressPanel.runPetTimer(slot0)
	slot0.run_img = {}
	slot6 = 0
	slot0.run_img[1] = createSprite(PathTool.getPlistImgForDownLoad("bigbg/homepet", "home_pet_travelling_bg", false), slot6, 0, slot0.bg_node, cc.p(0, 0), LOADTEXT_TYPE)
	slot0.run_img_size = slot0.run_img[1]:getContentSize()

	for slot6 = 2, math.ceil(slot0.mask_layout_size.width / slot0.run_img_size.width) + 1 + 1 do
		slot0.run_img[slot6] = createSprite(slot1, (slot6 - 1) * slot0.run_img_size.width, 0, slot0.bg_node, cc.p(0, 0), LOADTEXT_TYPE)
	end

	slot0.bg_node:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(4, cc.p(-(slot2 * slot0.run_img_size.width - slot0.run_img_size.width), 0)), cc.CallFunc:create(function ()
		uv0.bg_node:setPosition(0, 0)
	end))))
end

function HomePetGooutProgressPanel.playPetSpine(slot0, slot1)
	if slot1 == false then
		if slot0.pet_spine then
			slot0.pet_spine:clearTracks()
			slot0.pet_spine:removeFromParent()

			slot0.pet_spine = nil
		end
	elseif slot0.pet_spine == nil then
		slot0.pet_spine = createEffectSpine("H65005", cc.p(0, 0), cc.p(0.5, 0.5), true, PlayerAction.idle)

		slot0.pet_node:addChild(slot0.pet_spine, 1)
	end
end

function HomePetGooutProgressPanel.runPetAction(slot0)
end

function HomePetGooutProgressPanel.updateList(slot0)
	if not slot0.show_list then
		return
	end

	if tolua.isnull(slot0.item_scrollview) then
		return
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.item_scrollview, true, {
			text = TI18N("暂无出行信息")
		})
	else
		commonShowEmptyIcon(slot0.item_scrollview, false)
	end

	slot2 = slot0.start_x or 10
	slot3 = 0
	slot4 = slot0.offset_y or 40

	for slot8 = 1, slot1 do
		slot9 = slot0.show_list[slot8]

		if slot0.item_list[slot8] == nil then
			slot0.item_list[slot8] = slot0:createItemLabel()
		else
			slot0.item_list[slot8]:setVisible(true)
		end

		if slot9.size == nil then
			slot0.item_list[slot8]:setString(slot9.text)

			slot10 = slot0.item_list[slot8]:getContentSize()

			slot0.item_list[slot8].line:setPositionY(slot10.height + slot4 * 0.5)

			slot9.size = slot10
		end

		slot9.y = slot3
		slot3 = slot3 + slot9.size.height + slot4
	end

	slot10 = cc.size

	slot0.item_scrollview:setInnerContainerSize(slot10(slot0.item_scrollview_size.width, math.max(slot0.item_scrollview_size.height, slot3 - slot4)))

	for slot10 = 1, slot1 do
		slot0.item_list[slot10]:setPosition(slot2, slot6 - (slot0.show_list[slot10].y or 0))
	end

	if slot6 == slot0.item_scrollview_size.height then
		slot0.item_scrollview:setTouchEnabled(false)
	else
		slot0.item_scrollview:setTouchEnabled(true)
	end

	slot0.item_scrollview_container:setPositionY(0)
	slot0:checkOverShowByVertical()
end

function HomePetGooutProgressPanel.initScrollViewList(slot0)
	if not slot0.show_list then
		return
	end

	if tolua.isnull(slot0.item_scrollview) then
		return
	end

	slot0.is_init_scroll_view = true

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.item_scrollview, true, {
			text = TI18N("暂无出行信息")
		})

		slot0.is_init_scroll_view = false

		return
	else
		commonShowEmptyIcon(slot0.item_scrollview, false)
	end

	slot2 = slot0.start_x or 10
	slot3 = 0
	slot4 = slot0.offset_y or 40

	for slot9 = slot1, slot1 - 8 + 1, -1 do
		if not slot0.show_list[slot9] then
			break
		end

		if slot0.item_list[slot9] == nil then
			slot0.item_list[slot9] = slot0:createItemLabel()
		else
			slot0.item_list[slot9]:setVisible(true)
		end

		if slot10.size == nil then
			slot0.item_list[slot9]:setString(slot10.text)

			slot11 = slot0.item_list[slot9]:getContentSize()

			slot0.item_list[slot9].line:setPositionY(slot11.height + slot4 * 0.5)

			slot10.size = slot11
		end

		slot10.top_y = slot3
		slot3 = slot3 + slot10.size.height
		slot10.y = slot3
		slot3 = slot3 + slot4
	end

	slot6 = slot3

	if slot1 <= slot5 then
		slot6 = slot3 - slot4
	end

	slot8 = slot0.item_scrollview_container:getPositionY()

	slot0.item_scrollview:setInnerContainerSize(cc.size(slot0.item_scrollview_size.width, math.max(slot0.item_scrollview_size.height, slot6)))

	slot9 = false

	if slot6 < slot0.item_scrollview_size.height then
		for slot13 = 1, slot1 do
			slot0.item_list[slot13]:setPosition(slot2, slot7 - slot6 + slot0.show_list[slot13].y)
		end

		slot0.is_init_scroll_view = false
	else
		for slot13 = slot1, slot1 - slot5 + 1, -1 do
			if not slot0.show_list[slot13] then
				break
			end

			slot0.item_list[slot13]:setPosition(slot2, slot14.y or 0)
		end

		if slot5 < slot1 then
			slot9 = true
		else
			slot0.is_init_scroll_view = false
		end
	end

	if slot7 == slot0.item_scrollview_size.height then
		slot0.item_scrollview:setTouchEnabled(false)
	else
		slot0.item_scrollview:setTouchEnabled(true)
	end

	slot0.item_scrollview_container:setPositionY(0)
	slot0:checkOverShowByVertical()

	if slot9 then
		slot10 = slot1 - slot5
		slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:initFrameData(uv1)

			uv1 = uv1 - 1

			if uv1 <= 0 then
				uv0.is_init_scroll_view = false

				if uv0.time_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.time_ticket)

					uv0.time_ticket = nil
				end
			end
		end, 1 / display.DEFAULT_FPS)
	end
end

function HomePetGooutProgressPanel.createItemLabel(slot0)
	slot1 = createRichLabel(24, cc.c4b(100, 50, 35, 255), cc.p(0, 1), cc.p(-10000, 0), 8, nil, 580)
	slot3 = createImage(slot1, PathTool.getResFrame("common", "common_1016"), 290, 0, cc.p(0.5, 0.5), true, 0, true)

	slot3:setContentSize(cc.size(560, 2))
	slot3:setCapInsets(cc.rect(13, 1, 1, 1))

	slot1.line = slot3

	slot0.item_scrollview:addChild(slot1)

	return slot1
end

function HomePetGooutProgressPanel.initFrameData(slot0, slot1)
	if not slot0.show_list then
		return
	end

	if tolua.isnull(slot0.item_scrollview) then
		return
	end

	if not slot0.show_list[slot1] then
		return
	end

	if slot0.item_list[slot2] == nil then
		slot0.item_list[slot2] = slot0:createItemLabel()
	else
		slot0.item_list[slot2]:setVisible(true)
	end

	if slot3.size == nil then
		slot0.item_list[slot2]:setString(slot3.text)

		slot5 = slot0.item_list[slot2]:getContentSize()

		slot0.item_list[slot2].line:setPositionY(slot5.height + (slot0.offset_y or 40) * 0.5)

		slot3.size = slot5
	end

	slot0.item_list[slot2]:setPosition(slot0.start_x or 10, slot0.item_scrollview:getInnerContainerSize().height + slot3.size.height)

	if slot1 == 1 then
		slot5 = slot5 + slot3.size.height

		slot0.item_list[slot2].line:setVisible(false)
	else
		slot5 = slot5 + slot3.size.height + slot4
	end

	slot0.item_scrollview:setInnerContainerSize(cc.size(slot0.item_scrollview_size.width, slot5))
	slot0.item_scrollview_container:setPositionY(slot0.item_scrollview_container:getPositionY())
	slot0:checkOverShowByVertical()
end

function HomePetGooutProgressPanel.close_callback(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end

	slot0:playPetSpine(false)
	doStopAllActions(slot0.time_val)
	uv0:openHomePetGooutProgressPanel(false)
end
