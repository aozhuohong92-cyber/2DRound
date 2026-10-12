slot1 = CrossarenaController:getInstance():getModel()
CrossareanMainWindow = CrossareanMainWindow or BaseClass(BaseView)

function CrossareanMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.layout_name = "crossarena/crossarena_main_window"
	slot0.win_type = WinType.Full
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("crossarena", "crossarena"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_87", true),
			type = ResourcesType.single
		}
	}
	slot0.tab_list = {}
	slot0.panel_list = {}
end

function CrossareanMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot7 = "bigbg_87"

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", slot7, true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.view_panel = slot1:getChildByName("view_panel")
	slot2 = slot1:getChildByName("top_panel")
	slot0.btn_rule = slot2:getChildByName("btn_rule")
	slot0.btn_rank = slot2:getChildByName("btn_rank")

	slot0.btn_rank:getChildByName("label"):setString(TI18N("排行榜"))

	slot0.btn_shop = slot2:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("label"):setString(TI18N("勇者商城"))

	slot0.btn_award = slot2:getChildByName("btn_award")

	slot0.btn_award:getChildByName("label"):setString(TI18N("排名奖励"))

	slot0.btn_record = slot2:getChildByName("btn_record")

	slot0.btn_record:getChildByName("label"):setString(TI18N("挑战记录"))

	slot0.btn_defend = slot2:getChildByName("btn_defend")

	slot0.btn_defend:getChildByName("label"):setString(TI18N("防守阵容"))

	slot0.close_btn = slot1:getChildByName("close_btn")

	for slot7 = 1, 2 do
		if slot2:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot7) then
			slot9 = {
				select_bg = slot8:getChildByName("select_bg")
			}

			slot9.select_bg:setVisible(true)

			slot9.unselect_bg = slot8:getChildByName("unselect_bg")
			slot9.tab_btn = slot8
			slot9.index = slot7
			slot0.tab_list[slot7] = slot9
		end
	end

	slot2:setPositionY(display.getTop(slot1))
	slot0.close_btn:setPositionY(display.getBottom(slot1) + 147)
end

function CrossareanMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openCrossarenaMainWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_rule, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.ArenaClusterData.data_explain)
	end, true)
	registerButtonEventListener(slot0.btn_rank, function ()
		uv0:openCrossarenaRankWindow(true)
	end, true)
	registerButtonEventListener(slot0.btn_shop, function ()
		uv0:openCrossarenaShopWindow(true)
	end, true)
	registerButtonEventListener(slot0.btn_award, function ()
		uv0:openCrossarenaAwardWindow(true)
	end, true)
	registerButtonEventListener(slot0.btn_record, function ()
		uv0:openCrossarenaVideoWindow(true)
	end, true)

	function slot4()
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.CrossArenaDef, {}, HeroConst.FormShowType.eFormSave)
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_defend, slot4, slot5)

	for slot4, slot5 in pairs(slot0.tab_list) do
		if slot5.tab_btn then
			slot5.tab_btn:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playTabButtonSound()
					uv0:changeSelectedTab(uv1.index)
				end
			end)
		end
	end

	slot0:addGlobalEvent(CrossarenaEvent.Update_Red_Status_Event, function ()
		uv0:updateRedStatusShow()
	end)
end

function CrossareanMainWindow.updateRedStatusShow(slot0)
	if slot0.tab_list[2] and slot0.tab_list[2].tab_btn then
		addRedPointToNodeByStatus(slot0.tab_list[2].tab_btn, uv0:getCrossarenaRedStatus(CrossarenaConst.Red_Index.Like))
	end

	if slot0.btn_record then
		addRedPointToNodeByStatus(slot0.btn_record, uv0:getCrossarenaRedStatus(CrossarenaConst.Red_Index.Record))
	end
end

function CrossareanMainWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)
	end

	if slot0.select_panel then
		slot0.select_panel:setVisibleStatus(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == CrossarenaConst.Sub_Type.Challenge then
			slot0.select_panel = CrossarenaChallengePanel.New(slot0.view_panel)
		elseif slot1 == CrossarenaConst.Sub_Type.Honour then
			slot0.select_panel = CrossarenaHonourPanel.New(slot0.view_panel)
		end

		if slot0.select_panel then
			slot0.panel_list[slot1] = slot0.select_panel
		end
	end

	if slot0.select_panel then
		slot0.select_panel:setVisibleStatus(true)
	end

	slot0.btn_defend:setVisible(slot1 == CrossarenaConst.Sub_Type.Challenge)
	slot0.btn_record:setVisible(slot1 == CrossarenaConst.Sub_Type.Challenge)
end

function CrossareanMainWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or slot0:getDefaultSubType())
	slot0:updateRedStatusShow()
	uv0:updateCrossarenaRedStatus(CrossarenaConst.Red_Index.Open, false)
end

function CrossareanMainWindow.getDefaultSubType(slot0)
	if uv0:getCrossarenaStatus() == CrossarenaConst.Open_Status.Open then
		return CrossarenaConst.Sub_Type.Challenge
	else
		return CrossarenaConst.Sub_Type.Honour
	end
end

function CrossareanMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openCrossarenaMainWindow(false)
end
