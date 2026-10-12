ArenapeakchampionMymatchPanel = ArenapeakchampionMymatchPanel or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil
slot6 = math.floor

function ArenapeakchampionMymatchPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenapeakchampion", "arenapeak_guessing"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_guessing_centre", false),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_mymatch_panel"
	slot0.view_list = {}
	slot0.tab_list = {}
end

function ArenapeakchampionMymatchPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.container_node = slot0.container:getChildByName("container_node")
	slot2 = slot0.container:getChildByName("main_panel")
	slot0.title = slot2:getChildByName("win_title")

	slot0.title:setString(TI18N("我的赛程"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot3 = {
		TI18N("我的赛程"),
		TI18N("比赛记录")
	}
	slot0.tab_btn_obj = slot0.container:getChildByName("tab_btn")

	for slot7 = 1, 2 do
		slot8 = {
			btn = slot9,
			index = slot7,
			select_bg = slot9:getChildByName("select_img")
		}

		slot8.select_bg:setVisible(false)

		slot8.title = slot0.tab_btn_obj:getChildByName("tab_btn_" .. slot7):getChildByName("label")

		if slot3[slot7] then
			slot8.title:setString(slot3[slot7])
		end

		slot0.tab_list[slot7] = slot8
	end

	slot0.tips_label = slot0.container:getChildByName("tips_label")

	slot0.tips_label:setString(TI18N("向下滑动查看更多信息"))
end

function ArenapeakchampionMymatchPanel.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.container)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)
end

function ArenapeakchampionMymatchPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, REGISTER_BUTTON_SOUND_CLOSED_TYPY)

	slot4 = handler(slot0, slot0.onClickCloseBtn)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, REGISTER_BUTTON_SOUND_CLOSED_TYPY)

	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabType(uv1, true)
		end, false, 1)
	end
end

function ArenapeakchampionMymatchPanel.onClickCloseBtn(slot0)
	uv0:openArenapeakchampionMymatchPanel(false)
end

function ArenapeakchampionMymatchPanel.setTabBtnVisible(slot0, slot1)
	if slot0.tab_btn_obj then
		slot0.tab_btn_obj:setVisible(slot1)
		slot0.tips_label:setVisible(slot1)
	end
end

function ArenapeakchampionMymatchPanel.changeTabType(slot0, slot1, slot2)
	if slot2 and slot0.cur_tab_index == slot1 then
		return
	end

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_bg:setVisible(false)
	end

	slot0.cur_tab_index = slot1
	slot0.cur_tab = slot0.tab_list[slot0.cur_tab_index]

	if slot0.cur_tab ~= nil then
		slot0.cur_tab.select_bg:setVisible(true)
	end

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(false)
	end

	slot0.pre_panel = slot0:createSubPanel(slot0.cur_tab_index)

	if slot0.pre_panel ~= nil and slot0.pre_panel.setVisibleStatus then
		slot0.pre_panel:setVisibleStatus(true, slot0.cur_tab_index)
	end
end

function ArenapeakchampionMymatchPanel.createSubPanel(slot0, slot1)
	if slot0.view_list[slot1] == nil then
		if slot1 == 1 then
			slot2 = ArenapeakchampionMymatchTabForm.new(slot0)
		elseif slot1 == 2 then
			slot2 = ArenapeakchampionMymatchTabRecord.new(slot0)
		end

		if not slot2 then
			return
		end

		slot3 = slot0.container:getContentSize()

		slot2:setPosition(cc.p(slot3.width * 0.5, slot3.height * 0.5))
		slot0.container:addChild(slot2)

		slot0.view_list[slot1] = slot2
	end

	return slot2
end

function ArenapeakchampionMymatchPanel.openRootWnd(slot0, slot1)
	slot0:changeTabType((slot1 or {}).index or 1)
end

function ArenapeakchampionMymatchPanel.close_callback(slot0)
	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	uv0:openArenapeakchampionMymatchPanel(false)
end
