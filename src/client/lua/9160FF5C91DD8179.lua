ArenapeakchampionGuessingWindow = ArenapeakchampionGuessingWindow or BaseClass(BaseView)
slot1 = ArenapeakchampionController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert
slot5 = math.ceil
slot6 = math.floor

function ArenapeakchampionGuessingWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.is_full_screen = true
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("arenapeakchampion", "arenapeak_guessing"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_guessing_bg", true),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_92", false),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "arenapeakchampion/arenapeakchampion_guessing_window"
	slot0.view_list = {}
	slot0.tab_list = {}
end

function ArenapeakchampionGuessingWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)
	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "arenapeakchampion_guessing_bg", true), LOADTEXT_TYPE)

	slot0.container = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot0.container, 1)

	slot0.container_size = slot0.container:getContentSize()
	slot0.top_img = slot0.container:getChildByName("top_img")
	slot0.item_load = loadSpriteTextureFromCDN(slot0.top_img, PathTool.getPlistImgForDownLoad("bigbg/arenapeakchampion", "txt_cn_arenapeakchampion_guessing_title", false), ResourcesType.single, slot0.item_load)
	slot0.container_node = slot0.container:getChildByName("container_node")
	slot0.close_btn = slot0.container:getChildByName("close_btn")
	slot3 = {
		TI18N("竞猜"),
		TI18N("晋级赛"),
		TI18N("冠军赛")
	}

	for slot8 = 1, 3 do
		slot9 = {
			btn = slot10,
			index = slot8,
			select_bg = slot10:getChildByName("select_img")
		}

		slot9.select_bg:setVisible(false)

		slot9.title = slot0.container:getChildByName("tab_btn"):getChildByName("tab_btn_" .. slot8):getChildByName("label")

		if slot3[slot8] then
			slot9.title:setString(slot3[slot8])
		end

		slot0.tab_list[slot8] = slot9
	end
end

function ArenapeakchampionGuessingWindow.adaptationScreen(slot0)
	slot1 = display.getTop(slot0.container)
	slot2 = display.getBottom(slot0.container)
	slot3 = display.getLeft(slot0.container)
	slot4 = display.getRight(slot0.container)
end

function ArenapeakchampionGuessingWindow.register_event(slot0)
	slot4 = handler(slot0, slot0.onClickCloseBtn)
	slot5 = true

	registerButtonEventListener(slot0.close_btn, slot4, slot5, REGISTER_BUTTON_SOUND_CLOSED_TYPY)

	for slot4, slot5 in pairs(slot0.tab_list) do
		registerButtonEventListener(slot5.btn, function ()
			uv0:changeTabType(uv1, true)
		end, false, 1)
	end

	slot0:addGlobalEvent(ArenapeakchampionEvent.ARENAPEAKCHAMPION_ALL_RED_POINT_EVENT, function ()
		uv0:updateRedPoint()
	end)
end

function ArenapeakchampionGuessingWindow.updateRedPoint(slot0)
	if not slot0.tab_list then
		return
	end

	if slot0.tab_list[1] and slot0.tab_list[1].btn and slot0.cur_tab_index ~= ArenapeakchampionConstants.guessing_tab.eGuessing then
		addRedPointToNodeByStatus(slot0.tab_list[1].btn, uv0:getGuessRedPoint(), 5, 5)
	else
		addRedPointToNodeByStatus(slot0.tab_list[1].btn, false)
	end

	if slot0.tab_list[2] and slot0.tab_list[3] and uv0:getMainData() and slot1.step ~= 0 and slot1.step_status ~= 2 then
		if uv0.match_stage_redpoint then
			if slot1.step == 256 then
				addRedPointToNodeByStatus(slot0.tab_list[2].btn, true, 5, 5)
				addRedPointToNodeByStatus(slot0.tab_list[3].btn, false, 5, 5)
			elseif slot1.step == 64 or slot1.step == 8 then
				addRedPointToNodeByStatus(slot0.tab_list[2].btn, false, 5, 5)
				addRedPointToNodeByStatus(slot0.tab_list[3].btn, true, 5, 5)
			end
		else
			addRedPointToNodeByStatus(slot0.tab_list[2].btn, false, 5, 5)
			addRedPointToNodeByStatus(slot0.tab_list[3].btn, false, 5, 5)
		end
	end
end

function ArenapeakchampionGuessingWindow.onClickCloseBtn(slot0)
	uv0:openArenapeakchampionGuessingWindow(false)
end

function ArenapeakchampionGuessingWindow.changeTabType(slot0, slot1, slot2)
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

	if slot1 == ArenapeakchampionConstants.guessing_tab.eGuessing then
		BarrageController:getInstance():showWirteBtn(true)
	else
		BarrageController:getInstance():showWirteBtn(false)

		if uv0.match_stage_redpoint and uv0:getMainData() and slot3.step ~= 0 and slot3.step_status ~= 2 and (slot3.step == 256 and slot1 == ArenapeakchampionConstants.guessing_tab.ePromotion or (slot3.step == 64 or slot3.step == 8) and slot1 == ArenapeakchampionConstants.guessing_tab.eChampion) then
			uv1:sender27731(2)
			uv0:setMatchStageRedPoint(false)
		end
	end

	slot0:updateRedPoint()
end

function ArenapeakchampionGuessingWindow.createSubPanel(slot0, slot1)
	if slot1 == ArenapeakchampionConstants.guessing_tab.eChampion then
		slot1 = ArenapeakchampionConstants.guessing_tab.ePromotion
	end

	if slot0.view_list[slot1] == nil then
		if slot1 == ArenapeakchampionConstants.guessing_tab.eGuessing then
			slot2 = ArenapeakchampionGuessingTabGuessing.new(slot0)
		elseif slot1 == ArenapeakchampionConstants.guessing_tab.ePromotion then
			slot2 = ArenapeakchampionGuessingTabPromotion.new(slot0)
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

function ArenapeakchampionGuessingWindow.openRootWnd(slot0, slot1)
	slot0:changeTabType((slot1 or {}).index or ArenapeakchampionConstants.guessing_tab.eGuessing)
	GlobalEvent:getInstance():Fire(BarrageEvent.HandleBarrageType, true, BarrageConst.type.arenapeakchampion)
end

function ArenapeakchampionGuessingWindow.close_callback(slot0)
	if slot0.view_list then
		for slot4, slot5 in pairs(slot0.view_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.view_list = nil

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	GlobalEvent:getInstance():Fire(BarrageEvent.HandleBarrageType, false, BarrageConst.type.arenapeakchampion)
	uv0:openArenapeakchampionGuessingWindow(false)
end
