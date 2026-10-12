StarTowerVideoWindow = StarTowerVideoWindow or BaseClass(BaseView)

function StarTowerVideoWindow.__init(slot0, slot1, slot2)
	slot0.ctrl = StartowerController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "startower/star_tower_video"
	slot0.res_list = {}
	slot0.win_type = WinType.Mini
	slot0.data = slot1
	slot0.click_tower = slot2
	slot0.first_id = 0
	slot0.next_id = 0
end

function StarTowerVideoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.title_con = slot0.main_panel:getChildByName("title_con")
	slot0.title = slot0.title_con:getChildByName("title_label")

	slot0.title:setString(TI18N("录像"))
	UITool.SetTitleColor(slot0.title)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.info_con = slot0.main_panel:getChildByName("info_con")
	slot0.first_btn = slot0.info_con:getChildByName("btn1")

	slot0.first_btn:setTitleText(TI18N("查看"))

	slot0.first_btn.label = slot0.first_btn:getTitleRenderer()

	if slot0.first_btn.label ~= nil then
		slot0.first_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.info_con:getChildByName("bg3"):setVisible(false)

	slot0.two_btn = slot0.info_con:getChildByName("btn2")

	slot0.two_btn:setTitleText(TI18N("查看"))

	slot0.two_btn.label = slot0.two_btn:getTitleRenderer()

	if slot0.two_btn.label ~= nil then
		slot0.two_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.my_look = slot0.info_con:getChildByName("btn4")

	slot0.my_look:setTitleText(TI18N("查看"))

	slot0.my_look.label = slot0.my_look:getTitleRenderer()

	if slot0.my_look.label ~= nil then
		slot0.my_look.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.share_btn = slot0.info_con:getChildByName("btn3")

	slot0.info_con:getChildByName("qian_title_1"):setString(TI18N("最快"))
	slot0.info_con:getChildByName("qian_title_2"):setString(TI18N("最低"))
	slot0:createDesc()
end

function StarTowerVideoWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openVideoWindow(false)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openVideoWindow(false)
		end
	end)
	slot0.first_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.first_id ~= 0 then
				BattleController:getInstance():csRecordBattle(uv0.first_id)
			end
		end
	end)
	slot0.two_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.next_id ~= 0 then
				BattleController:getInstance():csRecordBattle(uv0.next_id)
			end
		end
	end)
	slot0.my_look:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.data.m_replay_id and uv0.data.m_replay_id ~= 0 then
				BattleController:getInstance():csRecordBattle(uv0.data.m_replay_id)
			end
		end
	end)
	slot0.share_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			slot2 = true

			if uv0.share_panel then
				slot2 = not uv0.share_panel:isVisible()
			end

			uv0:showSharePanel(slot2)
		end
	end)
end

function StarTowerVideoWindow.showSharePanel(slot0, slot1)
	if slot1 == false and not slot0.share_panel then
		return
	end

	if not slot0.share_panel then
		slot2 = cc.size(200, 160)
		slot0.share_panel = ccui.Widget:create()

		slot0.share_panel:setContentSize(slot2)
		slot0.main_panel:addChild(slot0.share_panel)
		slot0.share_panel:setPosition(cc.p(290, 170))

		slot4 = createImage(slot0.share_panel, PathTool.getResFrame("common", "common_1056"), slot2.width / 2, slot2.height / 2, cc.p(0.5, 0.5), true, 0, true)

		slot4:setContentSize(slot2)
		slot4:setCapInsets(cc.rect(21, 21, 10, 10))

		slot5 = PathTool.getResFrame("common", "common_1017")
		slot6 = createButton(slot0.share_panel, TI18N("世界频道"), slot2.width / 2, 120, cc.size(160, 64), slot5, 26, Config.ColorData.data_color4[1])

		slot6:enableOutline(Config.ColorData.data_color4[264], 2)
		slot6:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.data then
					return
				end

				StartowerController:sender11333(uv0.data.m_replay_id, 1, uv0.click_tower)
				uv0:showSharePanel(false)
			end
		end)

		slot7 = createButton(slot0.share_panel, TI18N("公会频道"), slot2.width / 2, 45, cc.size(160, 64), slot5, 26, Config.ColorData.data_color4[1])

		slot7:enableOutline(Config.ColorData.data_color4[264], 2)
		slot7:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				if not uv0.data then
					return
				end

				StartowerController:sender11333(uv0.data.m_replay_id, 4, uv0.click_tower)
				uv0:showSharePanel(false)
			end
		end)
	end

	slot0.share_panel:setVisible(slot1)
end

function StarTowerVideoWindow.createDesc(slot0)
	slot0.top_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.top_head:setTouchEnabled(true)
	slot0.top_head:setPosition(cc.p(90, 295))
	slot0.top_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.info_con:addChild(slot0.top_head)

	slot0.bottom_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.bottom_head:setTouchEnabled(true)
	slot0.bottom_head:setPosition(cc.p(90, 175))
	slot0.bottom_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.info_con:addChild(slot0.bottom_head)

	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setTouchEnabled(true)
	slot0.my_head:setPosition(cc.p(90, 62))
	slot0.my_head:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.info_con:addChild(slot0.my_head)

	slot0.top_name = createLabel(24, Config.ColorData.data_color4[175], nil, 165, 300, "", slot0.info_con, 2, cc.p(0, 0))
	slot0.bottom_name = createLabel(24, Config.ColorData.data_color4[175], nil, 165, 183, "", slot0.info_con, 2, cc.p(0, 0))
	slot0.fast_desc = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 1), cc.p(165, 290), nil, nil, 300)

	slot0.info_con:addChild(slot0.fast_desc)

	slot0.power_desc = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 1), cc.p(165, 170), nil, nil, 300)

	slot0.info_con:addChild(slot0.power_desc)

	slot0.my_name = createLabel(24, Config.ColorData.data_color4[175], nil, 165, 60, "", slot0.info_con, 2, cc.p(0, 0))

	slot0.my_name:setString(TI18N("我的通关录像"))

	slot0.my_time = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 1), cc.p(165, 55), nil, nil, 300)

	slot0.info_con:addChild(slot0.my_time)
	slot0.my_time:setString(string.format(TI18N("时间：%s"), TimeTool.GetTimeFormat(slot0.data.my_time)))

	if not slot0.data then
		return
	end

	for slot6, slot7 in pairs(slot0.data.tower_replay_data or {}) do
		if slot7 and slot7.type == 1 then
			slot0.fast_desc:setString(string.format(TI18N("通关时间：%s"), TimeTool.GetTimeFormat(slot7.time)))
			slot0.top_name:setString(slot7.name)
			slot0.top_head:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)

			slot0.first_id = slot7.replay_id
		else
			slot0.power_desc:setString(string.format(TI18N("最低战力：%s"), slot7.power))
			slot0.bottom_name:setString(slot7.name)
			slot0.bottom_head:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)

			slot0.next_id = slot7.replay_id
		end
	end

	slot3 = RoleController:getInstance():getRoleVo()

	slot0.my_head:setHeadRes(slot3.face_id, false, LOADTEXT_TYPE, slot3.face_file, slot3.face_update_time)

	if slot0.data.m_replay_id and slot0.data.m_replay_id == 0 then
		slot0.my_look:setVisible(false)
		slot0.share_btn:setVisible(false)
		slot0.my_time:setString(TI18N("暂无"))
	end
end

function StarTowerVideoWindow.openRootWnd(slot0)
end

function StarTowerVideoWindow.setPanelData(slot0)
end

function StarTowerVideoWindow.close_callback(slot0)
	slot0.ctrl:openVideoWindow(false)

	if slot0.bottom_head then
		slot0.bottom_head:DeleteMe()

		slot0.bottom_head = nil
	end

	if slot0.my_head then
		slot0.my_head:DeleteMe()

		slot0.my_head = nil
	end

	if slot0.top_head then
		slot0.top_head:DeleteMe()

		slot0.top_head = nil
	end
end
