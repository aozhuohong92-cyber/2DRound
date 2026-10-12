HeavenMainWindow = HeavenMainWindow or BaseClass(BaseView)
slot1 = HeavenController:getInstance():getModel()

function HeavenMainWindow.__init(slot0, slot1)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.cur_index = slot1 or HeavenConst.Tab_Index.Dungeon
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_85", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_86", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "heaven/heaven_main_window"
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.cur_tab_index = HeavenConst.Tab_Index.Dungeon
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function HeavenMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot0.close_btn = slot1:getChildByName("close_btn")

	slot0.close_btn:setName("guide_close_btn")

	slot2 = slot1:getChildByName("tab_container")

	for slot7 = 1, 2 do
		if slot2:getChildByName("tab_btn_" .. slot7) then
			slot9 = {
				unselect_bg = slot8:getChildByName("unselect_bg")
			}

			slot9.unselect_bg:setVisible(true)

			slot9.select_bg = slot8:getChildByName("select_bg")

			slot9.select_bg:setVisible(false)

			slot9.lable = slot8:getChildByName("title")
			slot9.tips = slot8:getChildByName("tips")

			slot9.lable:setString(({
				TI18N("传奇挑战"),
				TI18N("战船维护")
			})[slot7])

			slot9.tab_btn = slot8
			slot9.index = slot7
			slot0.tab_list[slot7] = slot9
		end
	end

	slot0.container = slot1:getChildByName("container")

	slot2:setPositionY(display.getTop(slot1) - 143)
	slot0.close_btn:setPositionY(display.getBottom(slot1) + 147)
end

function HeavenMainWindow.register_event(slot0)
	slot4 = handler(slot0, slot0._onClickCloseBtn)
	slot5 = nil

	registerButtonEventListener(slot0.close_btn, slot4, slot5, 2)

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

	if not slot0.update_heaven_red_status then
		slot0.update_heaven_red_status = GlobalEvent:getInstance():Bind(HeavenEvent.Update_Heaven_Red_Status, function (slot0)
			if slot0 == HeavenConst.Red_Index.Dial then
				uv0:updateTabBtnRedStatus()
			end
		end)
	end
end

function HeavenMainWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(false)

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.select_bg:setVisible(true)
	end

	slot0.cur_tab_index = slot1

	if slot1 == HeavenConst.Tab_Index.Dungeon then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_85", true), LOADTEXT_TYPE)
	elseif slot1 == HeavenConst.Tab_Index.DialRecord then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_86", true), LOADTEXT_TYPE)
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == HeavenConst.Tab_Index.Dungeon then
			slot0.select_panel = HeavenDungeonPanel.new()
		elseif slot1 == HeavenConst.Tab_Index.DialRecord then
			slot0.select_panel = HeavenDialWindow.new(slot0.dial_group_id)
		end

		if slot0.select_panel then
			slot0.container:addChild(slot0.select_panel)

			slot0.panel_list[slot1] = slot0.select_panel
		end
	end

	if slot1 == HeavenConst.Tab_Index.Dungeon then
		if BattleController:getInstance():getCurFightType() ~= BattleConst.Fight_Type.HeavenWar then
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.HeavenWar)
		end
	elseif slot1 == HeavenConst.Tab_Index.DialRecord then
		BattleController:getInstance():openBattleView(false)
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(true)
	end

	slot0:updateTabBtnRedStatus()
end

function HeavenMainWindow.updateTabBtnRedStatus(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot6 = false

		if slot5.index == HeavenConst.Tab_Index.Dungeon and slot0.cur_tab_index ~= slot5.index then
			if uv0:getHeavenRedStatusByBid(HeavenConst.Red_Index.Count) or uv0:getHeavenRedStatusByBid(HeavenConst.Red_Index.Award) then
				slot6 = true
			end
		elseif slot5.index == HeavenConst.Tab_Index.DialRecord and slot0.cur_tab_index ~= slot5.index and (uv0:getHeavenRedStatusByBid(HeavenConst.Red_Index.Dial) or uv0:getHeavenRedStatusByBid(HeavenConst.Red_Index.DialAward)) then
			slot6 = true
		end

		if slot5.tips then
			slot5.tips:setVisible(slot6)
		end
	end
end

function HeavenMainWindow.openRootWnd(slot0, slot1)
	if slot1 then
		slot0.dial_group_id = slot1.group_id
		slot0.cur_index = slot1.index or HeavenConst.Tab_Index.Dungeon

		slot0:changeSelectedTab(slot0.cur_index)
		GlobalEvent:getInstance():Fire(MainuiEvent.HEAD_UPDATE_WEALTH_EVENT, 2, Config.ItemData.data_assets_label2id.gold)

		if slot1.is_open_chapter == true then
			chapter_id = slot1.chapter_id or uv0:getHeavenLastShowChapterId()

			if chapter_id then
				uv1:openHeavenChapterWindow(true, chapter_id)
			end
		end
	end
end

function HeavenMainWindow._onClickCloseBtn(slot0)
	uv0:openHeavenMainWindow(false)
end

function HeavenMainWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	if slot0.update_heaven_red_status then
		GlobalEvent:getInstance():UnBind(slot0.update_heaven_red_status)

		slot0.update_heaven_red_status = nil
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	uv0:openHeavenMainWindow(false)

	if HeroController:getInstance():getHeroMainInfoWindow() then
		GlobalEvent:getInstance():Fire(MainuiEvent.HEAD_UPDATE_WEALTH_EVENT, 2, Config.ItemData.data_assets_label2id.hero_exp)
	end
end
