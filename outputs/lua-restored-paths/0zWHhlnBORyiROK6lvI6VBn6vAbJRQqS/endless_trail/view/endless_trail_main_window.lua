EndlessTrailMainWindow = EndlessTrailMainWindow or BaseClass(BaseView)
slot1 = Endless_trailController:getInstance():getModel()

function EndlessTrailMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("endless", "endless"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_51", true),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "endlesstrail/endlesstrail_main_window"
	slot0.panel_list = {}
	slot0.tab_list = {}
	slot0.cur_tab_index = Endless_trailEvent.Tab_Index.endless
end

function EndlessTrailMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_51", true), LOADTEXT_TYPE)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot6 = 1

	slot0:playEnterAnimatianByObj(slot1, slot6)

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.tab_container = slot1:getChildByName("tab_container")

	slot0.tab_container:setVisible(false)

	for slot6 = 1, 2 do
		if slot0.tab_container:getChildByName("tab_btn_" .. slot6) then
			slot8 = {
				unselect_bg = slot7:getChildByName("unselect_bg")
			}

			slot8.unselect_bg:setVisible(true)

			slot8.select_bg = slot7:getChildByName("select_bg")

			slot8.select_bg:setVisible(false)

			slot8.lable = slot7:getChildByName("title")

			slot8.lable:setString(({
				TI18N("综合试炼"),
				TI18N("系试炼")
			})[slot6])
			UITool.SetTitleColor(slot8.lable)

			slot8.tab_btn = slot7
			slot8.tips = slot7:getChildByName("tips")
			slot8.index = slot6
			slot0.tab_list[slot6] = slot8
		end
	end

	slot0.container = slot1:getChildByName("container")
	slot0.top_panel = slot1:getChildByName("top_panel")
	slot0.rank_bg_1 = slot0.top_panel:getChildByName("Image_8")
	slot0.rank_bg_2 = slot0.top_panel:getChildByName("Image_9")
	slot0.bottom_panel = slot1:getChildByName("bottom_panel")
	slot3 = display.getTop(slot1)

	slot0.tab_container:setPositionY(slot3 - 128)
	slot0.top_panel:setPositionY(slot3 - 152)

	slot4 = display.getBottom(slot1)

	slot0.close_btn:setPositionY(slot4 + 135)
	slot0.bottom_panel:setPositionY(slot4 + 114)
end

function EndlessTrailMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickCloseBtn), nil, 2)

	if not slot0.update_base_event then
		slot0.update_base_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_BASE_DATA, function ()
			uv0:updateTab()
			uv0:updateTabShowStatus()
			uv0:updateTabBtnRedStatus()
		end)
	end

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
end

function EndlessTrailMainWindow.updateTab(slot0)
	if uv0:getEndlessData() then
		slot2 = TI18N("系试炼")

		if slot1.select_type == Endless_trailEvent.endless_type.water then
			slot2 = TI18N("海贼新星试炼")
		elseif slot1.select_type == Endless_trailEvent.endless_type.fire then
			slot2 = TI18N("草帽团试炼")
		elseif slot1.select_type == Endless_trailEvent.endless_type.wind then
			slot2 = TI18N("强者试炼")
		elseif slot1.select_type == Endless_trailEvent.endless_type.light_dark then
			slot2 = TI18N("海军皇团试炼")
		end

		if slot0.tab_list and slot0.tab_list[2] and slot0.tab_list[2].lable then
			slot0.tab_list[2].lable:setString(slot2)
		end
	end
end

function EndlessTrailMainWindow.updateTabShowStatus(slot0)
	if uv0:checkNewEndLessIsShow() == false then
		slot0.tab_container:setVisible(false)
	else
		slot0.tab_container:setVisible(true)
	end
end

function EndlessTrailMainWindow.setRankShow(slot0)
	if RankController:getInstance():checkRankIsShow() then
		slot0.rank_bg_1:setVisible(true)
		slot0.rank_bg_2:setVisible(true)
	else
		slot0.rank_bg_1:setVisible(false)
		slot0.rank_bg_2:setVisible(false)
	end
end

function EndlessTrailMainWindow.updateTabBtnRedStatus(slot0)
	for slot4, slot5 in ipairs(slot0.tab_list) do
		slot6 = false

		if slot5.index == Endless_trailEvent.Tab_Index.endless and slot0.cur_tab_index ~= slot5.index then
			if uv0:getIsGetAllReward() or uv0:getFirstGet(Endless_trailEvent.endless_type.old) or uv0:getIsSendPartner() then
				slot6 = true
			end
		elseif slot5.index == Endless_trailEvent.Tab_Index.campEndless and slot0.cur_tab_index ~= slot5.index and uv1:checkNewEndLessIsOpen() == true and uv0:getEndlessData() and (uv0:getFirstGet(slot7.select_type) or uv0:getIsGetAllRewardNew()) then
			slot6 = true
		end

		if slot5.tips then
			slot5.tips:setVisible(slot6)
		end
	end
end

function EndlessTrailMainWindow.changeSelectedTab(slot0, slot1)
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

	if slot0.select_panel then
		slot0.select_panel:addToParent(false)

		slot0.select_panel = nil
	end

	slot0.select_panel = slot0.panel_list[slot1]

	if slot0.select_panel == nil then
		if slot1 == Endless_trailEvent.Tab_Index.endless then
			slot0.select_panel = EndlessTrailPanel.new()
		elseif slot1 == Endless_trailEvent.Tab_Index.campEndless then
			slot0.select_panel = EndlessTrailCampPanel.new()
		end

		if slot0.select_panel then
			slot0.container:addChild(slot0.select_panel)

			slot0.panel_list[slot1] = slot0.select_panel
		end
	end

	if slot0.select_panel then
		slot0.select_panel:addToParent(true)
	end

	slot0:updateTabBtnRedStatus()
end

function EndlessTrailMainWindow.openRootWnd(slot0)
	slot1 = Endless_trailEvent.Tab_Index.endless

	if uv0:getEndlessData() and slot2.type ~= 0 and slot2.type ~= Endless_trailEvent.endless_type.old then
		slot1 = Endless_trailEvent.Tab_Index.campEndless
	end

	slot0:changeSelectedTab(slot1)
	slot0:setRankShow()
	uv1:send23900()
end

function EndlessTrailMainWindow._onClickCloseBtn(slot0)
	uv0:openEndlessMainWindow(false)
end

function EndlessTrailMainWindow.close_callback(slot0)
	if slot0.update_base_event then
		GlobalEvent:getInstance():UnBind(slot0.update_base_event)

		slot0.update_base_event = nil
	end

	for slot4, slot5 in pairs(slot0.panel_list) do
		slot5:DeleteMe()
	end

	slot0.panel_list = nil

	uv0:openEndlessMainWindow(false)
end
