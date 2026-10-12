BaseView = BaseView or BaseClass(CommonUI)
WinType = {
	Tips = 1,
	Full = 4,
	Mini = 2,
	Big = 3
}
CommonButton_Color = {
	cc.c4b(248, 194, 60, 255),
	cc.c4b(255, 255, 255, 255),
	cc.c4b(2, 0, 25, 255),
	cc.c4b(2, 0, 25, 255)
}
BaseView.winMap = {}
BaseView.winTipsMap = {}
slot0 = "ui_start"
slot1 = "ui_end"
slot2 = "start_frame"
slot3 = "end_frame"

function BaseView.__init(slot0)
	slot0.view_tag = ViewMgrTag.WIN_TAG
	slot0.layout_name = nil
	slot0.is_full_screen = true
	slot0.is_use_csb = true
	slot0.anim_vo_list = {}
	slot0.is_exist_ui_end = false
	slot0.load_callback = nil
	slot0.root_wnd = nil
	slot0.parent_wnd = nil
	slot0.is_csb_action = nil
	slot0.is_before_battle = false
	slot0.background_path = nil
	slot0.show_close_btn = true
	slot0.is_load_finish = false
	slot0.is_loading = false
	slot0.is_opening = false
	slot0.is_visible = false
	slot0.title_str = ""
	slot0.tab_info_list = {}
	slot0.tab_max = 4
	slot0.open_callback = nil
	slot0.close_callback = nil
	slot0.action_callback = nil
	slot0.win_type = WinType.Full
	slot0.res_list = {}
	slot0.is_start_to_load = false
	slot0.open_params = nil
	slot0.base_view_event_list = {}
	slot0.base_repoint_event_list = {}
	slot0.is_show_func_icon = 0
end

function BaseView.open(slot0, ...)
	if not tolua.isnull(slot0.root_wnd) then
		slot0:setCommonUIZOrder(slot0.root_wnd)

		if slot0:getVisible() == false then
			slot0:setVisible(true)
		end
	elseif slot0.is_start_to_load == false then
		slot0.is_start_to_load = true
		slot0.open_params = {
			...
		}

		if slot0.layout_name then
			-- Nothing
		end

		if slot0.layout_name == nil and slot0.is_use_csb == true and slot0.is_full_screen == true then
			if slot0.background_path == nil then
				slot0.background_path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true)
			end

			table.insert(slot0.res_list, {
				path = slot0.background_path,
				type = ResourcesType.single
			})
		end

		if next(slot0.res_list) == nil then
			slot0:loadResListCompleted()
		else
			if slot0.resources_load == nil then
				slot0.resources_load = ResourcesLoad.New(true)
			end

			slot0.resources_load:addAllList(slot0.res_list, function ()
				uv0:loadResListCompleted()
			end)
		end
	end
end

function BaseView.loadResListCompleted(slot0)
	slot0:constructBaseView()
	slot0:playEnterAnimatian()
	slot0:openCacheView()

	if MAKELIFEBETTER == true and ios_log_report then
		ios_log_report(slot0.layout_name)
	end
end

function BaseView.constructBaseView(slot0)
	slot0.is_opening = true
	slot0.is_visible = true

	if slot0:__getRootWnd() then
		if slot0.open_callback then
			safeCallFunc(function ()
				uv0:open_callback()
			end)
		end

		if not slot0:__getRootWnd():getParent() then
			slot0:attachParent()
		end

		slot0:setRootWndVisible(true)
		slot0:setCommonUIZOrder(slot0.root_wnd)
	else
		slot0:openOnlyReal()
	end
end

function BaseView.openOnlyReal(slot0)
	if slot0.is_loading then
		return
	end

	slot0.is_loading = true

	slot0:loadFiles()
end

function BaseView.loadFiles(slot0)
	if slot0.layout_name then
		slot0:initLayoutFile(slot0.layout_name)
	elseif slot0.createRootWnd then
		slot0:createRootWnd()
	elseif slot0.tab_info_list and next(slot0.tab_info_list) ~= nil then
		slot0:initLayoutFile("common/common_window_tab", true)
	elseif slot0.tab_info_list2 and next(slot0.tab_info_list2) ~= nil then
		slot0:initLayoutFile("common/common_window_tab2", true)
	elseif slot0.is_full_screen == true then
		slot0:initLayoutFile("common/common_window", true)
	else
		slot0:initLayoutFile("common/common_window_2", true)
	end

	if not slot0:__getRootWnd() then
		return
	end

	slot0:registerNodeScriptHandler()
	slot0:attachParent()
	slot0:__getRootWnd():setVisible(slot0.is_visible)
	slot0:__getRootWnd():setAnchorPoint(cc.p(0.5, 0.5))
	slot0:__getRootWnd():setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

	slot0.is_load_finish = true

	slot0:setCommonUIZOrder(slot0.root_wnd)

	if slot0.load_callback then
		slot0:load_callback()
	end

	if slot0.is_opening then
		if slot0.open_callback then
			safeCallFunc(function ()
				uv0:open_callback()
			end)
		end

		setTextContentList(slot0.root_wnd, slot0.text_name_list)

		if slot0.register_event then
			slot0:register_event()
		end

		if slot0.openRootWnd then
			if slot0.open_params ~= nil and next(slot0.open_params) ~= nil then
				slot0:openRootWnd(unpack(slot0.open_params))
			else
				slot0:openRootWnd()
			end

			if slot0.insertFunc then
				slot0:insertFunc()
			end

			slot0.is_start_to_load = false
		end
	end

	slot0.is_loading = false
end

function BaseView.close(slot0, slot1)
	if slot0.is_closeing then
		return
	end

	slot0.is_closeing = true

	if slot1 ~= nil and type(slot1) == "boolean" then
		slot0.close_by_other = slot1
	end

	slot0:closeCacheView()

	if slot0.is_exist_ui_end then
		slot0:playExitAnimation()
	else
		slot0:closeInternal()
	end
end

function BaseView.closeInternal(slot0)
	if slot0.root_wnd and not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:stopAllActions()
		slot0:setRootWndVisible(false)
	end

	slot0:__close()
	GlobalEvent:getInstance():Fire(EventId.CLOSE_BASE_VIEW, slot0)
end

function BaseView.__close(slot0)
	if slot0.is_opening and slot0.close_callback then
		slot0:close_callback()
	end

	slot0:closeDestroy()

	slot0.is_opening = false
	slot0.is_closeing = false
end

function BaseView.openCacheView(slot0)
	if slot0.win_type ~= WinType.Tips then
		if #BaseView.winMap >= 12 and table.remove(BaseView.winMap, 1) ~= nil then
			slot1:close()

			if slot1.next_win ~= nil then
				slot1.next_win.top_win = nil
			end
		end

		table.insert(BaseView.winMap, slot0)

		if #BaseView.winMap > 1 then
			if BaseView.winMap[#BaseView.winMap - 1] ~= nil and slot1.win_type == WinType.Mini and slot0.win_type ~= WinType.Mini and table.remove(BaseView.winMap, #BaseView.winMap - 1) ~= nil then
				if slot1.top_win then
					slot1.top_win.next_win = slot0
				end

				if slot1.close then
					slot1:close()
				end
			end

			if #BaseView.winMap > 0 and BaseView.winMap[#BaseView.winMap - 1] and not tolua.isnull(slot2.root_wnd) and slot2.win_type ~= WinType.Tips and slot2:getVisible() == true then
				slot0.top_win = slot2
				slot0.top_win.next_win = slot0

				if slot0.win_type ~= WinType.Mini and slot2.win_type <= slot0.win_type then
					slot0.top_win:setVisible(false)
				end
			end
		end

		slot0:needHideMainScene()
	else
		table.insert(BaseView.winTipsMap, slot0)
	end
end

function BaseView.needHideMainScene(slot0)
	if slot0.win_type == WinType.Full then
		delayOnce(function ()
			if uv0.is_visible == true then
				if BattleController:getInstance():isInFight() == true then
					BattleController:getInstance():handleBattleSceneStatus(false)
				end

				MainSceneController:getInstance():handleSceneStatus(false)

				if uv0.is_show_func_icon == 1 then
					uv0:setVisible(true)
				end
			end
		end, 1 / display.DEFAULT_FPS)
	end
end

function BaseView.closeCacheView(slot0)
	if slot0.win_type ~= WinType.Tips then
		for slot4, slot5 in ipairs(BaseView.winMap) do
			if slot5 == slot0 then
				table.remove(BaseView.winMap, slot4)

				if slot0.top_win and not tolua.isnull(slot0.top_win.root_wnd) then
					if slot0.next_win == nil or slot0.next_win.win_type ~= WinType.Full then
						if not slot0.close_by_other then
							if not slot0.top_win.is_before_battle then
								slot0.top_win:setVisible(true)
							else
								slot0.top_win.enter_battle_status = true
							end
						end

						slot0.top_win.next_win = nil
					end
				end

				if slot0.next_win and slot0.top_win then
					slot0.top_win.next_win = slot0.next_win
					slot0.next_win.top_win = slot0.top_win
				end

				break
			end
		end

		if #BaseView.winMap == 0 or not slot0:isFullWinExist() then
			if not BattleController:getInstance():isInFight() and not MainuiController:getInstance():checkIsInDramaUIFight() then
				MainSceneController:getInstance():handleSceneStatus(true)
			elseif BattleController:getInstance():isInFight() then
				BattleController:getInstance():handleBattleSceneStatus(true)
			end
		end
	else
		for slot4, slot5 in ipairs(BaseView.winTipsMap) do
			if slot5 == slot0 then
				table.remove(BaseView.winTipsMap, slot4)

				break
			end
		end
	end
end

function BaseView.isFullWinExist(slot0)
	for slot4, slot5 in ipairs(BaseView.winMap) do
		if slot5.win_type == WinType.Full and slot5.is_before_battle == false then
			return true
		end
	end

	return false
end

function BaseView.isBigWinExist(slot0)
	for slot4, slot5 in ipairs(BaseView.winMap) do
		if slot5.win_type == WinType.Big then
			return true
		end
	end

	return false
end

function BaseView.closeDestroy(slot0)
	slot0:release()
end

function BaseView.__delete(slot0)
	slot0:release()
end

function BaseView.deleteMe(slot0)
end

function BaseView.releaseMem(slot0)
end

function BaseView.setRootWndVisible(slot0, slot1)
	slot0:setVisible(slot1)
end

function BaseView.registerNodeScriptHandler(slot0)
	slot0:__getRootWnd():registerScriptHandler(function (slot0)
		if slot0 == "enter" then
			if uv0.onEnter then
				uv0:onEnter()
			end
		elseif slot0 == "exit" and uv0.onExit then
			uv0:onExit()
		end
	end)
end

function BaseView.release(slot0)
	slot0:deleteMe()

	slot0.is_visible = false
	slot0.is_load_finish = false
	slot0.is_loading = false

	if slot0.root_wnd and not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:stopAllActions()
		slot0.root_wnd:removeAllChildren()
		slot0.root_wnd:removeFromParent()
	end

	for slot4, slot5 in pairs(slot0.anim_vo_list) do
		slot7 = slot5[2]

		if slot5[1] then
			slot6:release()
		end

		if slot7 then
			slot7:clearFrameEventCallFunc()
			slot7:release()
		end
	end

	slot0.anim_vo_list = {}

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	slot0:removeGlobalEvent()
	slot0:releaseMem()

	slot0.root_wnd = nil
end

function BaseView.__setParent(slot0, slot1)
	slot0.parent_wnd = slot1
end

function BaseView.__getRootParent(slot0)
	if not slot0.parent_wnd then
		slot0.parent_wnd = ViewManager:getInstance():getLayerByTag(slot0.view_tag)
	end

	return slot0.parent_wnd
end

function BaseView.__getRootWnd(slot0)
	return slot0.root_wnd
end

function BaseView.isOpen(slot0)
	if not slot0:isLayout() then
		return false
	end

	return slot0.is_visible
end

function BaseView.isLayout(slot0)
	return slot0.is_load_finish
end

function BaseView.setVisible(slot0, slot1)
	slot0.is_visible = slot1

	if slot0.root_wnd == nil or tolua.isnull(slot0.root_wnd) then
		return
	end

	slot0.root_wnd:setVisible(slot1)
end

function BaseView.getVisible(slot0)
	return slot0.is_visible
end

function BaseView.openAction(slot0, slot1)
	if slot1 and slot0.action_callback then
		slot0.action_callback()
	end
end

function BaseView.addChild(slot0, slot1)
	slot0.root_wnd:addChild(slot1)
end

function BaseView.removeChild(slot0, slot1)
	slot0.root_wnd:removeChild(slot1)
end

function BaseView.removeAllChildren(slot0)
	slot0.root_wnd:removeAllChildren()
end

function BaseView.setPosition(slot0, slot1)
	slot0.root_wnd:setPosition(slot1)
end

function BaseView.getPosition(slot0)
	slot0.root_wnd:getPosition()
end

function BaseView.initLayoutFile(slot0, slot1, slot2)
	slot0:preLoadLayoutFile()
	slot0:loadLayoutFile(slot1, slot2)
	slot0:loadComplete()

	if slot0.BIND_TOUCH_EVENTS then
		slot0:createResoueceBinding(slot0.BIND_TOUCH_EVENTS)
	end
end

function BaseView.createResoueceBinding(slot0, slot1)
	slot5 = "root_wnd should not be null"

	assert(slot0.root_wnd, slot5)

	for slot5, slot6 in pairs(slot1) do
		if slot0:getChildByName(slot6.widget) then
			for slot11, slot12 in pairs(slot6.events) do
				if slot12.event == "click" then
					slot0:onClicked(slot7, handler(slot0, slot0[slot12.hander]))
				end
			end
		end
	end
end

function BaseView.onClicked(slot0, slot1, slot2, slot3, slot4)
	slot1:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0:setScale(1.1)

			if uv1 then
				uv1({
					target = slot0,
					name = "began"
				})
			end
		elseif slot1 == ccui.TouchEventType.moved then
			slot2.name = "moved"
		elseif slot1 == ccui.TouchEventType.ended then
			uv2:playButtonSound2()

			slot2.name = "ended"

			uv0:setScale(1)
			uv3(slot2)
		else
			slot2.name = "cancelled"

			uv0:setScale(1)

			if uv4 then
				uv4(slot2)
			end
		end
	end)
end

function BaseView.getChildByName(slot0, slot1)
	slot2 = Split(slot1, "/")
	slot3 = slot0.root_wnd

	if slot0.layout_name == nil and slot0.container then
		slot3 = slot0.container:getChildByName("container")
	end

	for slot7, slot8 in ipairs(slot2) do
		if not slot3 then
			print("node: " .. nodepath)
		end

		slot3 = slot3:getChildByName(slot8)
	end

	return slot3
end

function BaseView.attachParent(slot0)
	slot0:__getRootParent():addChild(slot0:__getRootWnd())
end

function BaseView.preLoadLayoutFile(slot0)
end

function BaseView.loadLayoutFile(slot0, slot1, slot2)
	slot1 = PathTool.getTargetCSB(slot1)

	print("csbPath-------------:", slot1)

	slot0.root_wnd = cc.CSLoader:createNode(slot1)

	slot0.root_wnd:retain()

	if slot2 == true then
		slot0:getObjFromCSB()
	end

	if slot0.is_csb_action then
		slot3 = cc.CSLoader:createTimeline(slot1)

		slot3:retain()

		slot0.is_exist_ui_end = slot3:IsAnimationInfoExists(uv0)

		table.insert(slot0.anim_vo_list, {
			slot0.root_wnd,
			slot3
		})
		slot3:setFrameEventCallFunc(function (slot0)
			if slot0 == nil then
				return
			end

			if slot0:getEvent() == uv0 then
				uv1:onEnterAnim()
			elseif slot1 == uv2 then
				uv1:onExitAnim()
				uv1:setVisible(false)
				delayOnce(function ()
					uv0:closeInternal()
				end, 1 / display.DEFAULT_FPS)
			end
		end)

		if not tolua.isnull(slot0.root_wnd) then
			slot0.root_wnd:runAction(slot3)
		end
	end
end

function BaseView.playEnterAnimatianByObj(slot0, slot1, slot2)
	if not tolua.isnull(slot1) then
		if slot2 == 2 then
			ActionHelp.itemScaleAction(slot1)
		else
			ActionHelp.itemUpAction(slot1)
		end
	end
end

function BaseView.getObjFromCSB(slot0)
	if slot0.root_wnd == nil then
		return
	end

	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale(slot0.root_wnd))

	if slot0.background_path ~= nil then
		slot0.background:loadTexture(slot0.background_path, LOADTEXT_TYPE)
	elseif slot0.is_full_screen == true then
		slot0.background:setVisible(false)
	end

	if slot0.root_wnd:getChildByName("image_panel") ~= nil then
		slot1:setPositionY(display.getBottom(slot0.root_wnd))
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	if slot1 ~= nil then
		slot0.main_container:setPositionY(slot1:getPositionY() + 85)
	end

	ActionHelp.itemUpAction(slot0.main_container, 400, 0, 0.2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")

	if slot0.is_full_screen == false and slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:close()
			end
		end)
	end

	slot2 = slot0.main_panel:getChildByName("win_title")

	slot2:setString(slot0.title_str)

	slot0.title_label = slot2
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.close_btn:setVisible(slot0.show_close_btn)

	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()

				if uv0.beforeClose then
					uv0:beforeClose()
				end

				uv0:close()
			end
		end)
	end

	slot0:createTabList2()

	if slot0.tab_info_list and next(slot0.tab_info_list) ~= nil then
		slot3 = slot0.main_panel:getChildByName("tab_container")

		if slot0.tab_btn_list == nil then
			slot0.tab_btn_list = {}
		end

		slot4, slot5, slot6, slot7 = nil

		for slot11 = 1, slot0.tab_max do
			if slot3:getChildByName("tab_btn_" .. slot11) ~= nil then
				slot5 = slot4

				slot5:setName("tab_btn_" .. slot11)

				tab_red_num = slot4:getChildByName("red_num")
				select_bg = slot4:getChildByName("select_bg")
				unselect_bg = slot4:getChildByName("unselect_bg")

				if slot5 ~= nil then
					slot5.tips = slot4:getChildByName("tab_tips")
					slot5.red_num = tab_red_num
					slot5.select_bg = select_bg
					slot5.unselect_bg = unselect_bg

					if slot0.tab_info_list[slot11] ~= nil then
						slot5.notice = slot7.notice or ""
						slot5.label = slot4:getChildByName("title")

						slot5.label:setString(slot7.label)

						slot5.index = slot7.index

						slot5.label:setTextColor(CommonButton_Color[1])
						slot5.label:enableOutline(CommonButton_Color[3], 2)
						slot5.select_bg:setVisible(false)
						slot5.tips:setVisible(false)
						slot5.red_num:setVisible(false)

						slot5.can_touch = slot7.status

						if slot7.status == false then
							setChildUnEnabled(true, slot5, Config.ColorData.data_color4[1])
						end

						slot5:addTouchEventListener(function (slot0, slot1)
							if slot1 == ccui.TouchEventType.ended then
								playTabButtonSound()

								if slot0.can_touch == false then
									message(slot0.notice)
								else
									uv0:setSelecteTab(slot0.index)
								end
							end
						end)

						slot0.tab_btn_list[slot7.index] = slot5
					else
						slot5:setVisible(false)
					end
				end
			end
		end
	end
end

function BaseView.createTabList2(slot0)
	if slot0.tab_info_list2 == nil then
		return
	end

	if slot0.tab_btn_list == nil then
		slot0.tab_btn_list = {}
	end

	slot2 = slot0.main_panel:getChildByName("tab_container"):getChildByName("tab_btn_1")
	slot0.tab_btn_list[1] = slot2
	slot6, slot7 = nil
	slot8, slot9 = slot2:getPosition()
	slot10 = 5

	for slot14 = 1, #slot0.tab_info_list2 do
		slot7 = slot0.tab_info_list2[slot14]

		if slot0.tab_btn_list[slot14] == nil then
			slot6 = slot2:clone()

			slot1:addChild(slot6)
			slot6:setPosition(slot8, slot9)

			slot4 = slot2:getContentSize().width + slot3 + slot10
			slot0.tab_btn_list[slot14] = slot6
		end

		slot6.tips = slot6:getChildByName("tab_tips")
		slot6.red_num = slot6:getChildByName("red_num")
		slot6.select_bg = slot6:getChildByName("select_bg")
		slot6.unselect_bg = slot6:getChildByName("unselect_bg")
		slot6.notice = slot7.notice or ""
		slot6.label = slot6:getChildByName("title")

		slot6.label:setString(slot7.label)

		slot6.index = slot7.index
		slot6.status = slot7.status

		tab_btn.label:setTextColor(CommonButton_Color[1])
		tab_btn.label:enableOutline(CommonButton_Color[3], 2)
		slot6.select_bg:setVisible(false)
		slot6.tips:setVisible(false)
		slot6.red_num:setVisible(false)
		slot6:setTouchEnabled(slot7.status)

		if slot7.status == false then
			setChildUnEnabled(true, slot6, Config.ColorData.data_color4[1])
			slot6:setTouchEnabled(true)
		end

		slot6:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playTabButtonSound()

				if slot0.status == false then
					message(slot0.notice)
				else
					uv0:setSelecteTab(slot0.index)
				end
			end
		end)

		slot8 = slot8 + slot3 + slot10
	end

	slot1:setScrollBarEnabled(false)
	slot1:setSwallowTouches(false)
	slot1:setInnerContainerSize(cc.size(math.max(slot4, slot1:getContentSize().width), slot1:getContentSize().height))
end

function BaseView.setTabTips(slot0, slot1, slot2)
	if not tolua.isnull(slot0.root_wnd) and slot0.tab_btn_list and slot0.tab_btn_list[slot2] and slot3.tips then
		slot3.tips:setVisible(slot1)
	end
end

function BaseView.setTabTipsII(slot0, slot1, slot2)
	slot3 = true

	if slot1 <= 0 then
		slot3 = false
	end

	if slot0.tab_btn_list[slot2] and slot4.tips then
		slot4.tips:setVisible(slot3)
		slot4.red_num:setVisible(slot3)
	end

	if slot1 >= 0 then
		slot4.red_num:setString(slot1)
	end
end

function BaseView.changeTitleName(slot0, slot1)
	if slot0.title_label and slot1 ~= nil then
		slot0.title_label:setString(slot1)
	end
end

function BaseView.setTabBtnTouchStatus(slot0, slot1, slot2)
	if slot0.tab_btn_list[slot2] then
		setChildUnEnabled(not slot1, slot3, Config.ColorData.data_color4[1])

		slot3.can_touch = slot1
	end
end

function BaseView.setSelecteTab(slot0, slot1, slot2)
	if slot0.cur_selected and slot0.cur_selected.index == slot1 then
		return
	end

	if slot0.cur_selected ~= nil then
		if slot0.cur_selected.label then
			slot0.cur_selected.label:setTextColor(CommonButton_Color[1])
			slot0.cur_selected.label:enableOutline(CommonButton_Color[3], 2)
		end

		slot0.cur_selected.select_bg:setVisible(false)
	end

	slot0.cur_selected = slot0.tab_btn_list[slot1]

	if slot0.cur_selected ~= nil then
		if slot0.cur_selected.label then
			slot0.cur_selected.label:setTextColor(CommonButton_Color[2])
			slot0.cur_selected.label:enableOutline(CommonButton_Color[4], 2)
		end

		slot0.cur_selected.select_bg:setVisible(true)
	end

	if slot0.selectedTabCallBack and slot0.cur_selected ~= nil then
		slot0:selectedTabCallBack(slot0.cur_selected.index)
	end
end

function BaseView.loadComplete(slot0)
end

function BaseView.playEnterAnimatian(slot0)
	if slot0.is_csb_action then
		for slot4, slot5 in pairs(slot0.anim_vo_list) do
			slot7 = slot5[2]

			if slot5[1] and slot7 and slot7:IsAnimationInfoExists(uv0) then
				slot7:play(uv0, false)
			end
		end
	end
end

function BaseView.playExitAnimation(slot0)
	if slot0.is_csb_action then
		for slot4, slot5 in pairs(slot0.anim_vo_list) do
			slot7 = slot5[2]

			if slot5[1] and slot7 and slot7:IsAnimationInfoExists(uv0) then
				slot7:play(uv0, false)
			end
		end
	end
end

function BaseView.onEnterAnim(slot0)
end

function BaseView.onExitAnim(slot0)
end

function BaseView.playButtonSound(slot0)
	if AudioManager then
		AudioManager:getInstance():playEffect(AudioManager.AUDIO_TYPE.COMMON, "c_002")
	end
end

function BaseView.checkWinExist()
	for slot3, slot4 in ipairs(BaseView.winMap) do
		if slot4.win_type == WinType.Full then
			return true
		end
	end

	return false
end

function BaseView.closeAllView()
	slot0 = {}

	if BaseView.winMap ~= nil and next(BaseView.winMap) ~= nil then
		for slot4, slot5 in ipairs(BaseView.winMap) do
			table.insert(slot0, slot5)
		end
	end

	if slot0 ~= nil and next(slot0) ~= nil then
		for slot4, slot5 in ipairs(slot0) do
			if slot5.close then
				slot5:close(true)
			end
		end
	end

	BaseView.winMap = {}
end

function BaseView.closeAllTipsview()
	slot0 = {}

	if BaseView.winTipsMap ~= nil and next(BaseView.winTipsMap) ~= nil then
		for slot4, slot5 in ipairs(BaseView.winTipsMap) do
			table.insert(slot0, slot5)
		end
	end

	if slot0 ~= nil and next(slot0) ~= nil then
		for slot4, slot5 in ipairs(slot0) do
			if slot5.close then
				slot5:close(true)
			end
		end
	end

	BaseView.winTipsMap = {}
end

function BaseView.printWinLog()
	slot3 = #BaseView.winMap

	print("当前窗口数量: " .. slot3)

	for slot3, slot4 in ipairs(BaseView.winMap) do
		if slot4.layout_name then
			print(string.format("第%s个窗口名字: %s", slot3, slot4.layout_name))
		end

		if slot4.check_class_name then
			print(string.format("第%s个窗口名字: %s", slot3, slot4.check_class_name))
		end
	end

	slot3 = #BaseView.winTipsMap

	print("当前tips窗口数量: " .. slot3)

	for slot3, slot4 in ipairs(BaseView.winTipsMap) do
		if slot4.layout_name then
			print(string.format("第%s个tips窗口名字: %s", slot3, slot4.layout_name))
		end
	end
end

function BaseView.closeViewAndTips()
	BaseView.closeAllView()
	BaseView.closeAllTipsview()
end

function BaseView.closeSomeWin()
	CommonAlert.closeAllWin()
	TipsManager:getInstance():hideTips()
	TipsManager:getInstance():showBackPackCompTips(false)
	ChatController:getInstance():closeChatUseAction()
	ArenaController:getInstance():openArenaChampionTop3Window()
	BattleController:getInstance():closeBattleResultWindow()
	HeroController:getInstance():openEquipTips(false)
	BattleDramaController:getInstance():openDramHookRewardView(false)
	LevupgradeController:getInstance():openMainWindow(false)
	ActionController:getInstance():openFirstChargeView(false)
	ActionController:getInstance():openActionMainPanel(false)
	VipController:getInstance():openVipMainWindow(false)
	WelfareController:getInstance():openMainWindow(false)
	HallowsController:getInstance():openHallowsTips(false)
	FriendController:getInstance():openFriendFindWindow(false)
	FriendController:getInstance():openFriendWindow(false)
	OnlineGiftController:getInstance():openOnlineGiftView(false)
	FriendController:getInstance():openFriendCheckPanel(false)
	Endless_trailController:getInstance():openEndlessBuffView(false, nil, true)
	PartnersummonController:getInstance():openSummonGainWindow(false)
	PartnersummonController:getInstance():openSummonGainShowWindow(false)
end

function BaseView.addGlobalEvent(slot0, slot1, slot2)
	if slot0.base_view_event_list == nil then
		return
	end

	if slot0.base_view_event_list[slot1] == nil then
		slot0.base_view_event_list[slot1] = GlobalEvent:getInstance():Bind(slot1, function (...)
			if uv0 and not tolua.isnull(uv1.root_wnd) then
				uv0(unpack({
					...
				}))
			end
		end)
	end
end

function BaseView.removeGlobalEvent(slot0)
	if slot0.base_view_event_list then
		for slot4, slot5 in pairs(slot0.base_view_event_list) do
			GlobalEvent:getInstance():UnBind(slot0.base_view_event_list[slot4])

			slot0.base_view_event_list[slot4] = nil
		end
	end

	slot0.base_view_event_list = nil
end

function BaseView.bindRedPoint(slot0, slot1, slot2, slot3, slot4, slot5)
	table.insert(slot0.base_repoint_event_list, RedpointController:getInstance():bindRedPointNode(slot1, slot2, slot3, slot4, slot5))
end

function BaseView.bindRedPointCb(slot0, slot1, slot2)
	table.insert(slot0.base_repoint_event_list, RedpointController:getInstance():bindRedPointCb(slot1, slot2))
end

function BaseView.removeRedPointBind(slot0, ...)
	for slot4, slot5 in pairs(slot0.base_repoint_event_list) do
		RedpointController:getInstance():unBindRedPoint(slot5)
	end

	slot0.base_repoint_event_list = {}
end
