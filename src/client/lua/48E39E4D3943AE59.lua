slot1 = CrossarenaController:getInstance():getModel()
slot2 = table.insert
CrossarenaHonourPanel = CrossarenaHonourPanel or BaseClass()

function CrossarenaHonourPanel.__init(slot0, slot1)
	slot0.is_init = true
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()

	slot0.role_item_list = {}
end

function CrossarenaHonourPanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("crossarena/crossarena_honour_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot1 = slot0.container:getChildByName("bottom_panel")

	slot1:getChildByName("like_tips"):setString(TI18N("每日点赞可获点赞奖励"))
	slot1:getChildByName("title_my_rank"):setString(TI18N("当前排名:"))

	slot0.txt_my_rank = slot1:getChildByName("txt_my_rank")

	slot1:getChildByName("title_max_rank"):setString(TI18N("历史最高排名:"))

	slot0.txt_max_rank = slot1:getChildByName("txt_max_rank")

	slot1:getChildByName("title_award"):setString(TI18N("当前排名可获得以下赛季结算奖励:"))

	if not slot0.check_award_txt then
		slot0.check_award_txt = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(558, 328))

		slot0.check_award_txt:setString(string.format(TI18N("<img src='%s' scale=1 /><div href=xxx fontcolor=#fff8bf outline=2,#000000 >奖励预览</div>"), PathTool.getResFrame("common", "common_1093")))
		slot1:addChild(slot0.check_award_txt)
		slot0.check_award_txt:addTouchLinkListener(function (slot0, slot1)
			if slot0 == "href" then
				uv0:openCrossarenaAwardWindow(true)
			end
		end, {
			"href"
		})
	end

	slot2 = slot1:getChildByName("award_list")
	slot4 = 0.8
	slot0.good_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * slot4,
		item_height = BackPackItem.Height * slot4,
		scale = slot4
	})

	slot0.good_scrollview:setSwallowTouches(false)
	slot1:setPositionY(display.getBottom(main_container))
end

function CrossarenaHonourPanel.registerEvent(slot0)
	if not slot0.update_my_info_event then
		slot0.update_my_info_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_MyBaseInfo_Event, function ()
			uv0:updateMyselfInfo()
		end)
	end

	if not slot0.update_honour_data_event then
		slot0.update_honour_data_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_Honour_Data_Event, function ()
			uv0:updateRoleItemList()
		end)
	end
end

function CrossarenaHonourPanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		slot0:updateMyselfInfo()
		uv0:sender25614()
	end
end

function CrossarenaHonourPanel.updateRoleItemList(slot0)
	slot1 = uv0:getHonourRoleData()

	function slot2(slot0)
		for slot4, slot5 in pairs(uv0) do
			if slot0 == 1 and slot5.rank == 2 or slot0 == 2 and slot5.rank == 1 or slot0 == 3 and slot5.rank == 3 then
				return slot5
			end
		end
	end

	for slot6 = 1, 3 do
		delayRun(slot0.container, slot6 / display.DEFAULT_FPS, function ()
			slot0 = uv0(uv1)

			if not uv2.role_item_list[uv1] then
				uv2.role_item_list[uv1] = CrossareanHonourItem.New(uv2.container)
			end

			slot1:setData(slot0, uv1)
		end)
	end
end

function CrossarenaHonourPanel.updateMyselfInfo(slot0)
	if not uv0:getCrossarenaMyBaseInfo().rank or slot1.rank == 0 then
		slot0.txt_my_rank:setString(TI18N("暂无排名"))
	else
		slot0.txt_my_rank:setString(slot1.rank)
	end

	if not slot1.max_rank or slot1.max_rank == 0 then
		slot0.txt_max_rank:setString(TI18N("暂无排名"))
	else
		slot0.txt_max_rank:setString(slot1.max_rank)
	end

	slot2 = uv0
	slot4 = slot2
	slot3 = {}

	for slot7, slot8 in ipairs(slot2.getCrossarenaRankAward(slot4, slot1.rank or 0) or {}) do
		slot11 = deepCopy(Config.ItemData.data_get_data(slot8[1]))
		slot11.quantity = slot8[2]

		uv1(slot3, slot11)
	end

	slot0.good_scrollview:setData(slot3)
	slot0.good_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.good_scrollview:getItemList()) do
			slot5:setDefaultTip()
		end
	end)
end

function CrossarenaHonourPanel.__delete(slot0)
	for slot4, slot5 in pairs(slot0.role_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.update_my_info_event then
		GlobalEvent:getInstance():UnBind(slot0.update_my_info_event)

		slot0.update_my_info_event = nil
	end

	if slot0.update_honour_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_honour_data_event)

		slot0.update_honour_data_event = nil
	end

	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end
end
