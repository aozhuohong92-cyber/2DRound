ArenaEnterWindow = ArenaEnterWindow or BaseClass(BaseView)

function ArenaEnterWindow.__init(slot0)
	slot0.ctrl = ArenaController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.win_type = WinType.Full
	slot0.layout_name = "arena/arena_enter_window"
	slot0.label_list = {}
	slot0.cur_rank_type = 0
	slot0.panel_list = {}

	slot0:initConfig()

	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenaenter"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("arena", "arenaloop"),
			type = ResourcesType.plist
		},
		{
			path = slot0.background_path_1,
			type = ResourcesType.single
		},
		{
			path = slot0.background_path_2,
			type = ResourcesType.single
		}
	}
end

function ArenaEnterWindow.initConfig(slot0)
	slot0.background_path_1 = string.format("resource/bigbg/battle_bg/%s/b_bg.jpg", BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.Arena))
	slot0.background_path_2 = string.format("resource/bigbg/battle_bg/%s/b_bg.jpg", BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.Champion))
end

function ArenaEnterWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.tab_container = slot0.container:getChildByName("tab_container")
	slot0.loop_btn = slot0.tab_container:getChildByName("loop_btn")
	slot0.loop_select = slot0.loop_btn:getChildByName("select_bg")
	slot0.rank_btn = slot0.tab_container:getChildByName("rank_btn")
	slot0.rank_select = slot0.rank_btn:getChildByName("select_bg")
	slot0.panel_container = slot0.container:getChildByName("panel_container")
	slot0.set_btn = slot0.container:getChildByName("set_btn")

	slot0.set_btn:getChildByName("label"):setString(TI18N("形象设置"))
	slot0.set_btn:setAnchorPoint(cc.p(0, 1))
	slot0.set_btn:setPosition(cc.p(display.getLeft(slot0.main_container) + 20, display.getTop(slot0.main_container) - MainuiController:getInstance():getMainUi():getTopViewHeight() - 30))
end

function ArenaEnterWindow.register_event(slot0)
	registerButtonEventListener(slot0.loop_btn, function ()
		uv0:changeArenaType(ArenaConst.arena_type.loop)
	end, false, 1)
	registerButtonEventListener(slot0.rank_btn, function ()
		uv0:changeArenaType(ArenaConst.arena_type.rank)
	end, false, 1)
	registerButtonEventListener(slot0.set_btn, function ()
		RoleController:getInstance():openRoleDecorateView(true, 3)
	end, true, 1)
end

function ArenaEnterWindow.openRootWnd(slot0, slot1)
	slot0:changeArenaType(slot1)
end

function ArenaEnterWindow.changeArenaType(slot0, slot1)
	if slot0.cur_rank_type == slot1 then
		return
	end

	slot0.cur_rank_type = slot1

	slot0.loop_select:setVisible(slot1 == ArenaConst.arena_type.rank)
	slot0.rank_select:setVisible(slot1 == ArenaConst.arena_type.loop)

	if slot0.cur_panel ~= nil and slot0.cur_panel.addToParent then
		slot0.cur_panel:addToParent(false)
	end

	if slot0.panel_list[slot0.cur_rank_type] == nil then
		if slot0.cur_rank_type == ArenaConst.arena_type.loop then
			slot0.panel_list[slot0.cur_rank_type] = ArenaEnterLoopView.new()
		else
			slot0.panel_list[slot0.cur_rank_type] = ArenaEnterChampionView.new()
		end

		if slot0.panel_list[slot0.cur_rank_type] ~= nil then
			slot0.panel_container:addChild(slot0.panel_list[slot0.cur_rank_type])
		end
	end

	slot0.cur_panel = slot0.panel_list[slot0.cur_rank_type]

	if slot0.cur_panel and slot0.cur_panel.addToParent then
		slot0.cur_panel:addToParent(true)
	end

	if slot0.cur_rank_type == ArenaConst.arena_type.loop then
		slot0.background:loadTexture(slot0.background_path_1, LOADTEXT_TYPE)
	else
		slot0.background:loadTexture(slot0.background_path_2, LOADTEXT_TYPE)
	end
end

function ArenaEnterWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.panel_list = nil

	slot0.ctrl:openArenaEnterWindow(false)
end
