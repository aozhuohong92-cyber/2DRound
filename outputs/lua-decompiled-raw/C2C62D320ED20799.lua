GuildInitWindow = GuildInitWindow or BaseClass(BaseView)

function GuildInitWindow.__init(slot0)
	slot0.ctrl = GuildController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guild", "guild"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_info_list = {
		{
			status = true,
			label = TI18N("公会列表"),
			notice = TI18N(""),
			index = GuildConst.init_type.list
		},
		{
			status = true,
			label = TI18N("创建公会"),
			notice = TI18N(""),
			index = GuildConst.init_type.create
		},
		{
			status = true,
			label = TI18N("查找公会"),
			notice = TI18N(""),
			index = GuildConst.init_type.serach
		}
	}
	slot0.show_close_btn = false
	slot0.panel_list = {}
	slot0.cur_panel = nil
end

function GuildInitWindow.open_callback(slot0)
end

function GuildInitWindow.register_event(slot0)
end

function GuildInitWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or GuildConst.init_type.list, true)
end

function GuildInitWindow.selectedTabCallBack(slot0, slot1)
	if slot1 == GuildConst.init_type.create then
		slot0:changeTitleName(TI18N("创建公会"))
	elseif slot1 == GuildConst.init_type.list then
		slot0:changeTitleName(TI18N("公会列表"))
	elseif slot1 == GuildConst.init_type.serach then
		slot0:changeTitleName(TI18N("查找公会"))
	end

	slot0:changePanel(slot1)
end

function GuildInitWindow.changePanel(slot0, slot1)
	if slot0.cur_panel ~= nil then
		slot0.cur_panel:addToParent(false)

		slot0.cur_panel = nil
	end

	if slot0.panel_list[slot1] == nil then
		if slot1 == GuildConst.init_type.create then
			slot2 = GuildCreatePanel.new()
		elseif slot1 == GuildConst.init_type.list then
			slot2 = GuildListPanel.new()
		elseif slot1 == GuildConst.init_type.serach then
			slot2 = GuildSearchPanel.new()
		end

		slot0.panel_list[slot1] = slot2

		if slot2 ~= nil then
			slot0.container:addChild(slot2)
		end
	end

	if slot2 ~= nil then
		slot2:addToParent(true)

		slot0.cur_panel = slot2
		slot0.cur_index = slot1
	end
end

function GuildInitWindow.close_callback(slot0)
	slot4 = false

	slot0.ctrl:openGuildInitWindow(slot4)

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil
end
