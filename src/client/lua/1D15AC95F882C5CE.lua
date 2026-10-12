StarTowerTipsWindow = StarTowerTipsWindow or BaseClass(BaseView)

function StarTowerTipsWindow.__init(slot0, slot1)
	slot0.ctrl = StartowerController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "startower/star_tower_tips_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("startower", "startower_bg_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("startower", "startower_bg_2"),
			type = ResourcesType.single
		}
	}
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.tower = slot1 or 0
end

function StarTowerTipsWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:setVisible(true)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container")

	ActionHelp.itemOpacityAction(slot0.main_panel, 0, 0.75)
	slot0.main_panel:setTouchEnabled(false)

	slot0.bg_img = slot0.main_panel:getChildByName("bg_img")
	slot0.bg_img_load = loadSpriteTextureFromCDN(slot0.bg_img, PathTool.getPlistImgForDownLoad("startower", "startower_bg_2"), ResourcesType.single, slot0.bg_img_load)
	slot0.bg_img_2 = slot0.main_panel:getChildByName("bg_img_2")

	slot0.bg_img_2:setOpacity(0)

	slot0.bg_img_load_2 = loadSpriteTextureFromCDN(slot0.bg_img_2, PathTool.getPlistImgForDownLoad("startower", "startower_bg_1"), ResourcesType.single, slot0.bg_img_load_2)
	slot0.tips_lab = slot0.main_panel:getChildByName("tips_lab")

	slot0.tips_lab:setOpacity(0)
	slot0.tips_lab:setString(TI18N("免战通关，起飞~"))
	delayOnce(function ()
		if uv0.tips_lab and not tolua.isnull(uv0.tips_lab) and uv0.bg_img_2 and not tolua.isnull(uv0.bg_img_2) then
			ActionHelp.itemOpacityAction(uv0.tips_lab, 0, 0.25)
			ActionHelp.itemOpacityAction(uv0.bg_img_2, 0, 0.25)
		end
	end, 0.5)

	slot0.time_label = createRichLabel(22, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(360, 200), nil, nil, 500)

	slot0.main_panel:addChild(slot0.time_label)
	slot0.time_label:setString(TI18N("5秒后关闭"))
end

function StarTowerTipsWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:checkCloseBtn()
	end, false, 2)
end

function StarTowerTipsWindow.updateTimer(slot0)
	slot1 = 5

	GlobalTimeTicket:getInstance():add(function ()
		uv0 = uv0 - 1

		if uv1.time_label and not tolua.isnull(uv1.time_label) then
			uv1.time_label:setString(math.ceil(uv0) .. TI18N("秒后关闭"))
		end

		if slot0 <= 0 then
			uv1:checkCloseBtn()
			GlobalTimeTicket:getInstance():remove("close_starTower_tips_view")
		end
	end, 1, 0, "close_starTower_tips_view")
end

function StarTowerTipsWindow.openRootWnd(slot0, slot1)
	slot0.battle_data = slot1

	slot0:updateTimer()
end

function StarTowerTipsWindow.checkCloseBtn(slot0)
	slot0.ctrl:openTipsWindow(false)
	BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.StarTower, slot0.battle_data)
end

function StarTowerTipsWindow.close_callback(slot0)
	GlobalTimeTicket:getInstance():remove("close_starTower_tips_view")

	if slot0.bg_img_load then
		slot0.bg_img_load:DeleteMe()

		slot0.bg_img_load = nil
	end

	if slot0.bg_img_load_2 then
		slot0.bg_img_load_2:DeleteMe()

		slot0.bg_img_load_2 = nil
	end

	slot0.ctrl:openTipsWindow(false)
end
