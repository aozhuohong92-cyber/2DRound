RoleDecorateWindow = RoleDecorateWindow or BaseClass(BaseView)

function RoleDecorateWindow.__init(slot0, slot1)
	slot0.ctrl = slot1
	slot0.role_vo = slot0.ctrl:getRoleVo()
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.layout_name = "roleinfo/role_decorate_window"
	slot0.cur_index = nil
	slot0.cur_tab = nil
	slot0.pre_panel = nil
	slot0.view_list = {}
	slot0.tab_btn_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("face", "face"),
			type = ResourcesType.plist
		}
	}
end

function RoleDecorateWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.title_container = slot0.main_container:getChildByName("title_container")
	slot0.title_label = slot0.title_container:getChildByName("title_label")

	slot0.title_label:setString(TI18N("更换装饰"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.tab_container = slot0.main_container:getChildByName("tab_container")

	slot0:creataBtnList()
end

function RoleDecorateWindow.creataBtnList(slot0)
	slot5 = "空间背景"
	slot0.tab_list = {
		{
			index = 1,
			status = true,
			label = TI18N("头像")
		},
		{
			index = 2,
			status = true,
			label = TI18N("头像框")
		},
		{
			index = 3,
			status = true,
			label = TI18N("冒险形象")
		},
		{
			index = 4,
			status = true,
			label = TI18N("称号")
		},
		{
			index = 5,
			status = true,
			label = TI18N(slot5)
		}
	}

	for slot5 = 1, #slot0.tab_list do
		tab = slot0.tab_container:getChildByName("tab_btn_" .. slot5)

		if tab ~= nil then
			tab_btn = tab

			tab_btn:setName("tab_btn_" .. slot5)

			if tab_btn ~= nil then
				info = slot0.tab_list[slot5]

				if info ~= nil then
					tab_btn.notice = info.notice or ""
					tab_btn.label = tab_btn:getChildByName("title")

					tab_btn.label:setString(info.label)

					tab_btn.index = info.index

					tab_btn.label:setTextColor(cc.c4b(215, 226, 227, 255))
					tab_btn:setTouchEnabled(info.status)
					tab_btn:setBright(false)
					tab_btn:addTouchEventListener(function (slot0, slot1)
						if slot1 == ccui.TouchEventType.ended then
							uv0:changeTabView(slot0.index)
						end
					end)

					slot0.tab_btn_list[info.index] = tab_btn
				else
					tab_btn:setVisible(false)
				end
			end
		end
	end
end

function RoleDecorateWindow.openRootWnd(slot0, slot1, slot2)
	slot0:changeTabView(slot1 or 1, slot2)
end

function RoleDecorateWindow.changeTabView(slot0, slot1, slot2)
	if slot0.cur_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(215, 226, 227, 255))
		slot0.cur_tab:setBright(false)
	end

	slot0.cur_index = slot1
	slot0.cur_tab = slot0.tab_btn_list[slot0.cur_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.label:setTextColor(cc.c4b(255, 255, 255, 255))
		slot0.cur_tab:setBright(true)
	end

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_tab.index, slot2)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end
end

function RoleDecorateWindow.createSubPanel(slot0, slot1, slot2)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			slot3 = RoleHeadPanel.new()
		elseif slot1 == 2 then
			slot3 = RoleFacePanel.new(slot2)
		elseif slot1 == 3 then
			slot3 = RoleDecorateTabBodyPanel.new(slot2)
		elseif slot1 == 4 then
			slot3 = RoleTitlePanel.new()
		elseif slot1 == 5 then
			slot3 = RoleBackgroundPanel.new(slot2)
		end

		slot4 = slot0.scrollCon:getContentSize()

		slot3:setPosition(cc.p(slot4.width * 0.5, slot4.height * 0.5))
		slot0.scrollCon:addChild(slot3)

		slot0.view_list[slot1] = slot3
	end

	return slot3
end

function RoleDecorateWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openRoleDecorateView(false)
		end
	end)

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0.ctrl:openRoleDecorateView(false)
			end
		end)
	end
end

function RoleDecorateWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.ctrl:openRoleDecorateView(false)
end
