StrongerMainWindow = StrongerMainWindow or BaseClass(BaseView)

function StrongerMainWindow.__init(slot0, slot1)
	slot0.ctrl = StrongerController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.title_str = TI18N("我要变强")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("stronger", "stronger"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_info_list = {
		{
			index = 1,
			status = true,
			label = TI18N("我要变强")
		},
		{
			index = 2,
			status = true,
			label = TI18N("获取资源")
		},
		{
			index = 3,
			status = true,
			label = TI18N("推荐阵容")
		},
		{
			index = 4,
			status = true,
			label = TI18N("常见问题")
		}
	}
	slot0.partner_id = slot1
	slot0.cur_index = nil
	slot0.pre_panel = nil
	slot0.view_list = {}
end

function StrongerMainWindow.open_callback(slot0)
	for slot5, slot6 in pairs(HeroController:getModel():getMyPosList()) do
		slot0.ctrl:sender11070(HeroController:getModel():getHeroById(slot6.id).partner_id)
	end
end

function StrongerMainWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or 1, true)
	slot0.ctrl:setIsFirst(false)
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.stronger, false)
end

function StrongerMainWindow.selectedTabCallBack(slot0, slot1)
	slot0.cur_index = slot1

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_index)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true)
	end
end

function StrongerMainWindow.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			slot2 = StrongerPanel.new(slot0.partner_id)
		elseif slot1 == 2 then
			slot2 = ResourcePanel.new()
		elseif slot1 == 3 then
			slot2 = RecommandPanel.new()
		elseif slot1 == 4 then
			slot2 = ProblemPanel.new()
		end

		slot2:setPosition(cc.p(10, 15))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function StrongerMainWindow.register_event(slot0)
end

function StrongerMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.view_list) do
		slot5:DeleteMe()
	end

	slot0.ctrl:openMainWin(false)
end
