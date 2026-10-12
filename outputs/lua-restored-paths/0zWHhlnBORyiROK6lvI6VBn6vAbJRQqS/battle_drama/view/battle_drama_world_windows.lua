BattleDramaWorldWindows = BattleDramaWorldWindows or BaseClass(BaseView)
slot0 = BattleDramaController:getInstance()
slot1 = BattleDramaController:getInstance():getModel()

function BattleDramaWorldWindows.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "battledrama/battle_drama_world_windows"
	slot0.tab_list = {}
	slot0.item_list = {}
	slot0.cur_tab = nil
end

function BattleDramaWorldWindows.open_callback(slot0)
	slot0.panel_bg = slot0.root_wnd:getChildByName("Panel_bg")
	slot0.background = slot0.panel_bg:getChildByName("background")

	slot0.panel_bg:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("root")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)
	slot0.main_panel:setScale(display.getMaxScale())

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot1, slot2, slot3 = nil

	for slot7 = 1, 1 do
		slot1 = slot0.main_container:getChildByName(string.format("tab_btn_%s", slot7))
		slot1.label = slot1:getTitleRenderer()

		slot1:setBright(false)
		slot1.label:setTextColor(cc.c4b(245, 224, 185, 255))

		slot2, slot9 = slot0:getTabType(slot7)
		slot1.type = slot2

		slot1.label:setString(slot9)

		slot0.tab_list[slot2] = slot1
	end
end

function BattleDramaWorldWindows.getTabType(slot0, slot1)
	if slot1 == 1 then
		return BattleDramaConst.Normal, TI18N("简单")
	elseif slot1 == 2 then
		return BattleDramaConst.Diffcult, TI18N("困难")
	end
end

function BattleDramaWorldWindows.openRootWnd(slot0, slot1)
	slot0:changeTabView(slot1 or BattleDramaConst.Normal)
end

function BattleDramaWorldWindows.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				uv0:openDramWorldView(false)
			end
		end)
	end

	for slot4, slot5 in pairs(slot0.tab_list) do
		slot5:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()

				if uv0.type ~= nil then
					if not uv1:getModeListByMode(uv0.type) then
						message("暂没开放")

						return
					else
						uv2:changeTabView(uv0.type)
					end
				end
			end
		end)
	end
end

function BattleDramaWorldWindows.changeTabView(slot0, slot1)
	if slot0.cur_type == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(Config.ColorData.data_color4[155])
		slot0.cur_tab:setBright(false)
	end

	slot0.cur_type = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_type]

	if Config.DungeonData.data_drama_world_info and Config.DungeonData.data_drama_world_info[slot1] then
		slot2 = Config.DungeonData.data_drama_world_info[slot1]
		slot3 = uv0:getModeListByMode(slot1)
		slot4 = uv0:getDramaData()
		slot6 = math.min(uv0:getHasPassChapterPassList(slot1) + 1, tableLen(slot2))

		if slot2 then
			slot7 = {}

			for slot12, slot13 in pairs(slot2) do
				table.insert(slot7, slot13)
			end

			table.sort(slot7, function (slot0, slot1)
				return slot0.chapter_id < slot1.chapter_id
			end)

			slot9 = nil

			if slot0.item_list and next(slot0.item_list or {}) ~= nil then
				for slot13, slot14 in pairs(slot0.item_list) do
					if slot14 then
						slot14:removeAllChildren()
						slot14:removeFromParent()
					end
				end

				slot0.item_list = {}
			end

			for slot13, slot14 in ipairs(slot7) do
				if not slot0.item_list[slot14.chapter_id] then
					slot9 = createImage(slot0.main_container, PathTool.getResFrame("common", "common_1019"), 0, 0, cc.p(0.5, 0.5), true, 1, true)

					slot9:setContentSize(158, 50)
					slot9:setTouchEnabled(true)

					slot15 = createLabel(24, 155, nil, slot9:getContentSize().width / 2, slot9:getContentSize().height / 2, "1212", slot9)

					slot15:setAnchorPoint(cc.p(0.5, 0.5))

					slot9.label = slot15
					slot16 = createLabel(24, 155, nil, slot9:getContentSize().width / 2, 65, "1212", slot9)

					slot16:setAnchorPoint(cc.p(0.5, 0.5))

					slot9.charpter_label = slot16
					slot17 = createLabel(24, 155, nil, slot9:getContentSize().width / 2, -15, "1212", slot9)

					slot17:setAnchorPoint(cc.p(0.5, 0.5))

					slot9.has_pass_label = slot17
					slot18 = createImage(slot9, PathTool.getResFrame("common", "common_1001"), 80, 90, cc.p(0.5, 0.5), true, 1, true)

					slot18:setScale(2)
					slot18:setVisible(false)

					if slot14.chapter_id == slot4.chapter_id then
						slot18:setVisible(true)
					end

					slot9:setPosition(175 + 180 * ((slot13 - 1) % 3), 600 - 120 * math.floor((slot13 - 1) / 3))

					slot14.mode_type = slot1
					slot9.data = slot14
					slot0.item_list[slot14.chapter_id] = slot9
				end

				if slot0.item_list[slot14.chapter_id] then
					if slot13 <= slot6 then
						slot9.data.is_open = true

						setChildDarkShader(false, slot9, Config.ColorData.data_color4[155])
					else
						slot9.data.is_open = false

						setChildDarkShader(true, slot9, Config.ColorData.data_color4[155])
					end

					slot9.label:setString(slot14.name)
					slot9.charpter_label:setString("第" .. StringUtil.numToChinese(slot14.chapter_id) .. "章")
					slot9.has_pass_label:setString(uv0:getHasCurChapterPassListNum(slot1, slot14.chapter_id) .. "/" .. tableLen(Config.DungeonData.data_drama_info[slot1][slot14.chapter_id]))
				end
			end
		end
	end

	for slot5, slot6 in pairs(slot0.item_list) do
		if slot6 then
			slot6:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					customClickAction(slot0, slot1)

					if uv0.data.is_open == true then
						slot3 = uv1:getHasPassChapterMaxDunId(uv0.data.mode_type, uv0.data.chapter_id)

						if uv1:getChapterListByID(uv0.data.mode_type, uv0.data.chapter_id) and slot3 ~= 0 then
							slot4 = uv1:getDramaData()
							slot4.mode = uv0.data.mode_type
							slot4.chapter_id = uv0.data.chapter_id
							slot4.dun_id = slot3

							BattleDramaController:getInstance():getModel():setDramaData(slot4)
						else
							BattleDramaController:getInstance():send13002()
						end

						uv2:openDramWorldView(false)
					else
						message("前面章节暂没通关")
					end
				end
			end)
		end
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(89, 52, 41, 255))
		slot0.cur_tab:setBright(true)
	end
end

function BattleDramaWorldWindows.close_callback(slot0)
	uv0:openDramWorldView(false)
end
