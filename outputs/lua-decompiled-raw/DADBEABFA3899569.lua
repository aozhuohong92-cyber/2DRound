VedioMainWindow = VedioMainWindow or BaseClass(BaseView)
slot1 = VedioController:getInstance():getModel()
slot2 = table.insert

function VedioMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "vedio/vedio_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("vedio", "vedio"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true),
			type = ResourcesType.single
		}
	}
	slot0.filt_is_show = false
	slot0.filt_btn_list = {}
	slot0.filt_index_list = {}
	slot0.vedio_data = {}
	slot0.vedio_show_data = {}
	slot0.cur_tab = nil
	slot0.cur_index = nil
	slot0.req_flag = false
	slot0.scroll_to_top = true
	slot0.elite_vedio_data = {}
end

function VedioMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_2", true), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.mainContainer, 1)

	slot0.share_panel = slot0.mainContainer:getChildByName("share_panel")

	slot0.share_panel:setVisible(false)
	slot0.share_panel:setSwallowTouches(false)

	slot0.share_bg = slot0.share_panel:getChildByName("share_bg")
	slot0.btn_guild = slot0.share_bg:getChildByName("btn_guild")
	slot0.btn_world = slot0.share_bg:getChildByName("btn_world")
	slot0.btn_cross = slot0.share_bg:getChildByName("btn_cross")

	slot0.share_bg:getChildByName("guild_label"):setString(TI18N("分享到公会频道"))
	slot0.share_bg:getChildByName("world_label"):setString(TI18N("分享到世界频道"))
	slot0.share_bg:getChildByName("cross_label"):setString(TI18N("分享到跨服频道"))

	slot0.main_panel = slot0.mainContainer:getChildByName("main_panel")

	slot0.main_panel:getChildByName("win_title"):setString(TI18N("录像馆"))

	slot0.like_limit_num = slot0.main_panel:getChildByName("like_limit_num")

	slot0.like_limit_num:setString("")

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.collect_btn = slot0.main_panel:getChildByName("collect_btn")

	slot0.collect_btn:getChildByName("label"):setString(TI18N("个人收藏"))

	slot0.myself_btn = slot0.main_panel:getChildByName("myself_btn")

	slot0.myself_btn:getChildByName("label"):setString(TI18N("个人记录"))

	slot0.no_vedio_image = slot0.main_panel:getChildByName("no_vedio_image")
	slot0.arrow = slot0.main_panel:getChildByName("arrow")
	slot1 = slot0.main_panel:getChildByName("filt_bg")
	slot0.filt_label = slot1:getChildByName("filt_label")
	slot0.filt_btn = slot1:getChildByName("filt_btn")
	slot0.filt_lv_btn = slot0.main_panel:getChildByName("filt_lv_btn")

	slot0.filt_lv_btn:getChildByName("name"):setString(TI18N("筛选临近等级"))
	slot0.filt_lv_btn:setSelected(uv0:getFiltLevelFlag())

	slot3 = slot0.main_panel:getChildByName("scrollCon")
	slot4 = slot3:getContentSize()
	slot0.vedio_scrollview = CommonScrollViewSingleLayout.new(slot3, cc.p(9, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width - 10, slot4.height - 10), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 620,
		item_height = 452,
		space_y = 3,
		col = 1,
		need_dynamic = true
	})

	slot0.vedio_scrollview:setSwallowTouches(false)
	slot0.vedio_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._createNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.vedio_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._numberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.vedio_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	slot0:createTabBtnList()
end

function VedioMainWindow._createNewCell(slot0)
	slot1 = VedioMainItem.new()

	slot1:addCallBack(handler(slot0, slot0._onClickShareBtn))

	return slot1
end

function VedioMainWindow._numberOfCells(slot0)
	if not slot0.vedio_show_data then
		return 0
	end

	return #slot0.vedio_show_data
end

function VedioMainWindow._updateCellByIndex(slot0, slot1, slot2)
	if not slot0.vedio_show_data then
		return
	end

	slot1.index = slot2

	if not slot0.vedio_show_data[slot2] then
		return
	end

	if slot0.cur_index then
		if slot0.cur_index == VedioConst.Tab_Index.Hot then
			slot1:setExtendData({
				is_hot = true,
				default_index = slot0.default_index
			})
		elseif slot0.cur_index == VedioConst.Tab_Index.Newhero then
			slot1:setExtendData({
				is_newhero = true,
				default_index = slot0.default_index
			})
		else
			slot1:setExtendData({})
		end
	end

	slot1:setData(slot3)
end

function VedioMainWindow.createTabBtnList(slot0)
	slot0.tabArray = {}

	for slot4, slot5 in pairs(Config.VideoData.data_vedio) do
		if slot5.is_show == 1 then
			slot0.filt_index_list[slot5.id] = slot0:getDefaultFiltIndex(index)

			uv0(slot0.tabArray, {
				title = slot5.name,
				index = slot5.id,
				sort_id = slot5.sort_id
			})
		end
	end

	table.sort(slot0.tabArray, SortTools.KeyLowerSorter("sort_id"))

	slot1 = slot0.main_panel:getChildByName("tab_container")
	slot2 = slot1:getContentSize()
	slot0.tab_scrollview = CommonScrollViewLayout.new(slot1, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot2.width, slot2.height), {
		start_y = 0,
		item_width = 155,
		start_x = -3,
		space_x = 0,
		row = 1,
		item_height = 64,
		space_y = 0,
		col = 0,
		item_class = CommonTabBtn
	})
end

function VedioMainWindow.getDefaultFiltIndex(slot0, slot1)
	return 1
end

function VedioMainWindow._onClickTabBtn(slot0, slot1)
	if not slot1 or slot1.index == slot0.cur_index then
		return
	end

	if slot0.cur_tab then
		slot0.cur_tab:setBtnSelectStatus(false)
	end

	slot0.cur_index = slot1.index
	slot0.cur_tab = slot1

	slot0.cur_tab:setBtnSelectStatus(true)
	slot0.filt_lv_btn:setVisible(slot0.cur_index == VedioConst.Tab_Index.Arena)

	if Config.VideoData.data_vedio[slot0.cur_index] then
		slot0.filt_label:setString(slot0:getFiltBtnNameByEvt(slot2.evt[slot0.filt_index_list[slot0.cur_index]]))
	end

	slot0.vedio_data = {}
	slot0.scroll_to_top = true

	if slot0.cur_index == VedioConst.Tab_Index.Elite then
		slot0.vedio_scrollview:setVisible(false)

		if not slot0.elite_scrollview then
			slot0:createEliteScrollview()
		end

		slot0.elite_scrollview:setVisible(true)

		if not slot0.req_elite_flag then
			slot0.req_elite_flag = true

			ElitematchController:getInstance():sender24930(3)
		else
			slot0:updateEliteVedioData()
		end
	else
		if slot0.elite_scrollview then
			slot0.elite_scrollview:setVisible(false)
		end

		if not uv0:checkIsReqVedioDataByType(slot0.cur_index, slot3 - 1) then
			uv1:requestPublicVedioData(slot0.cur_index, slot3 - 1, 1, VedioConst.ReqVedioDataNum)
		else
			slot0:setData()
		end
	end
end

function VedioMainWindow.openRootWnd(slot0, slot1)
	if slot1 then
		slot2 = false

		for slot6, slot7 in pairs(slot0.tabArray or {}) do
			if slot7.index == slot1 then
				slot2 = true

				break
			end
		end

		if not slot2 then
			slot1 = VedioConst.Tab_Index.Hot
		end
	else
		slot1 = VedioConst.Tab_Index.Hot
	end

	slot0.default_index = slot1

	slot0.tab_scrollview:setData(slot0.tabArray, handler(slot0, slot0._onClickTabBtn), nil, {
		default_index = slot1,
		tab_size = cc.size(160, 64),
		title_offset = cc.p(0, -5)
	})
	slot0:refreshTodayLikeNum()

	slot0.first_open_flag = SysEnv:getInstance():getBool(SysEnv.keys.video_first_open, true)

	if slot0.first_open_flag == true then
		SysEnv:getInstance():set(SysEnv.keys.video_first_open, false)
	end

	uv0:setIsOpenView(true)
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.vedio, false)
end

function VedioMainWindow.refreshTodayLikeNum(slot0)
	slot1 = uv0:getTodayLikeNum()
	slot2 = 0

	if Config.VideoData.data_const.likes_limit then
		slot2 = slot3.val
	end

	if slot2 - slot1 < 0 then
		slot4 = 0
	end

	slot0.like_limit_num:setString(string.format(TI18N("点赞数:%d/%d"), slot4, slot2))
end

function VedioMainWindow._onBounceBottomCallBack(slot0)
end

function VedioMainWindow.setData(slot0)
	if not slot0.cur_index then
		return
	end

	if not slot0.filt_index_list[slot0.cur_index] then
		return
	end

	slot0.vedio_data = uv0:getPublicVedioData(slot0.cur_index, slot1 - 1) or {}
	slot0.vedio_show_data = {}

	if slot0.cur_index == VedioConst.Tab_Index.Arena and uv0:getFiltLevelFlag() then
		slot3 = Config.VideoData.data_const.lev_interval_lowlimit
		slot4 = 5

		if Config.VideoData.data_const.lev_interval_uplimit then
			slot4 = slot2.val or 5
		end

		slot5 = 5

		if slot3 then
			slot5 = slot3.val or 5
		end

		slot6 = RoleController:getInstance():getRoleVo()

		for slot10, slot11 in ipairs(slot0.vedio_data.vedio_data or {}) do
			if slot11.a_lev - slot5 <= slot6.lev and slot6.lev <= slot11.a_lev + slot4 or slot11.b_lev - slot5 <= slot6.lev and slot6.lev <= slot11.b_lev + slot4 then
				uv1(slot0.vedio_show_data, slot11)
			end
		end
	else
		slot0.vedio_show_data = slot0.vedio_data.vedio_data or {}
	end

	if next(slot0.vedio_show_data) ~= nil then
		if slot0.scroll_to_top == true then
			slot0.vedio_scrollview:reloadData()
		else
			slot0.vedio_scrollview:resetCurrentItems()
		end

		slot0.vedio_scrollview:setVisible(true)
		slot0.no_vedio_image:setVisible(false)

		slot0.scroll_to_top = false
	else
		slot0.vedio_scrollview:setVisible(false)
		slot0.vedio_scrollview:reloadData()
		slot0.no_vedio_image:setVisible(true)
	end
end

function VedioMainWindow._onClickShareBtn(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.replay_id = slot2
	slot0.share_num = slot3
	slot0.srv_id = slot4
	slot0.combat_type = slot5

	if slot0.share_panel:convertToNodeSpace(slot1) then
		slot0.share_bg:setPosition(cc.p(slot6.x - 38, slot6.y + 70))
		slot0.share_panel:setVisible(true)
	end
end

function VedioMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openVedioMainWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.collect_btn, function ()
		uv0:openVedioCollectWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.myself_btn, function ()
		uv0:openVedioMyselfWindow(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_guild, function ()
		if RoleController:getInstance():getRoleVo():isHasGuild() == false then
			message(TI18N("您暂未加入公会"))

			return
		end

		if uv0.replay_id then
			uv1:requestShareVedio(uv0.replay_id, ChatConst.Channel.Gang, uv0.srv_id, uv0.combat_type)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv2:updateVedioData(uv0.cur_index, uv0.replay_id, "share", uv0.share_num))
		end

		uv0.replay_id = nil
		uv0.srv_id = nil
		uv0.combat_type = nil

		uv0.share_panel:setVisible(false)
	end, false, 1)
	registerButtonEventListener(slot0.btn_world, function ()
		if uv0.replay_id then
			uv1:requestShareVedio(uv0.replay_id, ChatConst.Channel.World, uv0.srv_id, uv0.combat_type)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv2:updateVedioData(uv0.cur_index, uv0.replay_id, "share", uv0.share_num))
		end

		uv0.replay_id = nil
		uv0.srv_id = nil
		uv0.combat_type = nil

		uv0.share_panel:setVisible(false)
	end, false, 1)
	registerButtonEventListener(slot0.btn_cross, function ()
		if RoleController:getInstance():getRoleVo().lev < Config.MiscData.data_const.cross_level.val then
			message(string.format(TI18N("%d级开启跨服频道"), slot0.val))

			return
		end

		if uv0.replay_id then
			uv1:requestShareVedio(uv0.replay_id, ChatConst.Channel.Cross, uv0.srv_id, uv0.combat_type)
			GlobalEvent:getInstance():Fire(VedioEvent.UpdateVedioDataEvent, uv2:updateVedioData(uv0.cur_index, uv0.replay_id, "share", uv0.share_num))
		end

		uv0.replay_id = nil
		uv0.srv_id = nil
		uv0.combat_type = nil

		uv0.share_panel:setVisible(false)
	end, false, 1)
	slot0.share_panel:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.share_panel:setVisible(false)
		end
	end)
	registerButtonEventListener(slot0.filt_btn, function ()
		uv0:_onClickFiltBtn()
	end, true, 1)
	slot0.filt_lv_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			uv0:setFiltLevelFlag(true)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			uv0:setFiltLevelFlag(false)
		end

		uv1.scroll_to_top = true

		uv1:setData()
	end)
	slot0:addGlobalEvent(VedioEvent.UpdatePublicVedioEvent, function (slot0)
		if uv0.cur_index and slot0 and uv0.cur_index == slot0 then
			uv0:setData()

			uv0.req_flag = false
		end
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_Challenge_Record_Event, function (slot0)
		if uv0.cur_index and uv0.cur_index == VedioConst.Tab_Index.Elite and slot0 and slot0.type == 3 then
			uv0.elite_vedio_data = slot0.arena_elite_log or {}

			uv0:updateEliteVedioData()
		end
	end)
	slot0:addGlobalEvent(VedioEvent.UpdateTodayLikeNum, function ()
		uv0:refreshTodayLikeNum()
	end)
	slot0:addGlobalEvent(VedioEvent.OpenCollectViewEvent, function (slot0)
		if not uv0.mainContainer then
			return
		end

		if slot0 == true then
			uv0.mainContainer:setVisible(false)
		else
			uv0.mainContainer:setVisible(true)
		end
	end)
end

function VedioMainWindow._onClickFiltBtn(slot0)
	if slot0.cur_index then
		if not Config.VideoData.data_vedio[slot0.cur_index] then
			return
		end

		if not slot0.filt_layout then
			slot0.filt_layout = ccui.Layout:create()

			slot0.filt_layout:setTouchEnabled(true)
			slot0.filt_layout:setContentSize(cc.size(676, 918))
			slot0.filt_layout:setAnchorPoint(0.5, 0.5)
			slot0.filt_layout:setPosition(360, 485)
			slot0.mainContainer:addChild(slot0.filt_layout)
			slot0.filt_layout:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.began then
					uv0:_onClickFiltBtn()
				end
			end)

			slot0.filt_bg = createImage(slot0.filt_layout, PathTool.getResFrame("common", "common_1092"), 0, 0, cc.p(1, 1), true, 1, true)

			slot0.filt_bg:setTouchEnabled(true)
			slot0.filt_bg:setAnchorPoint(cc.p(1, 1))

			slot3 = slot0.filt_layout:convertToNodeSpace(slot0.filt_btn:convertToWorldSpace(cc.p(0, 0)))

			slot0.filt_bg:setPosition(cc.p(slot3.x + 45, slot3.y))
		end

		slot2 = slot1.evt or {}

		for slot6, slot7 in pairs(slot0.filt_btn_list) do
			slot7:setVisible(false)
		end

		slot3 = 0
		slot11 = cc.size(156, 50).height + slot3
		slot10 = cc.size(166, 10 * 2 + #slot2 * slot11 - slot3)

		slot0.filt_bg:setContentSize(slot10)

		for slot10, slot11 in ipairs(slot2) do
			if slot0.filt_btn_list[slot10] == nil then
				slot12 = createButton(slot0.filt_bg, "", 0, 0, slot5, PathTool.getResFrame("common", "common_1046"), 22, Config.ColorData.data_color4[1])

				slot12:setAnchorPoint(cc.p(0.5, 1))
				slot12:addTouchEventListener(function (slot0, slot1)
					customClickAction(slot0, slot1)

					if slot1 == ccui.TouchEventType.ended then
						uv0:_onClickFiltItem(uv1)
					end
				end)
				uv0(slot0.filt_btn_list, slot12)
			end

			slot12:setVisible(true)
			slot12:setPosition(cc.p(83, slot6.height - slot4 - (slot10 - 1) * (slot5.height + slot3)))
			slot12:setBtnLabel(slot0:getFiltBtnNameByEvt(slot11))
			slot12:enableOutline(Config.ColorData.data_color4[264], 2)
		end

		slot0.filt_is_show = not slot0.filt_is_show

		slot0.filt_layout:setVisible(slot0.filt_is_show)
	end
end

function VedioMainWindow._onClickFiltItem(slot0, slot1)
	if not slot0.cur_index then
		return
	end

	if Config.VideoData.data_vedio[slot0.cur_index] then
		slot0.filt_index_list[slot0.cur_index] = slot1

		slot0.filt_label:setString(slot0:getFiltBtnNameByEvt(slot2.evt[slot1]))
		slot0:_onClickFiltBtn()

		if slot0.cur_index ~= VedioConst.Tab_Index.Elite then
			slot0.vedio_data = {}
			slot0.scroll_to_top = true

			if not uv0:checkIsReqVedioDataByType(slot0.cur_index, slot1 - 1) then
				uv1:requestPublicVedioData(slot0.cur_index, slot1 - 1, 1, VedioConst.ReqVedioDataNum)
			else
				slot0:setData()
			end
		end
	end
end

function VedioMainWindow.getFiltBtnNameByEvt(slot0, slot1)
	if not slot1 then
		return ""
	end

	slot3 = ""

	if slot1[1] == "all" then
		slot3 = TI18N("全部")
	elseif slot2 == "rank" then
		slot5 = slot1[3]

		if slot1[2] and slot5 then
			slot3 = string.format(TI18N("%d-%d名"), slot4, slot5)
		elseif not slot5 then
			slot3 = string.format(TI18N("%d名以后"), slot4)
		end
	elseif slot2 == "cham" then
		slot3 = VedioConst.Cham_Name[slot1[2]]
	elseif slot2 == "lev" then
		slot5 = slot1[3]

		if slot1[2] and slot5 then
			slot3 = string.format(TI18N("%d-%d级"), slot4, slot5)
		elseif not slot5 then
			slot3 = string.format(TI18N("%d级以上"), slot4)
		end
	end

	return slot3 or ""
end

function VedioMainWindow.createEliteScrollview(slot0)
	slot1 = slot0.main_panel:getChildByName("scrollCon")
	slot2 = slot1:getContentSize()
	slot0.elite_scrollview = CommonScrollViewSingleLayout.new(slot1, cc.p(6, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot2.width - 2, slot2.height - 10), {
		start_y = 0,
		row = 0,
		start_x = 0,
		space_x = 0,
		item_width = 628,
		item_height = 244,
		space_y = 3,
		col = 1,
		need_dynamic = true
	})

	slot0.elite_scrollview:setSwallowTouches(false)
	slot0.elite_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._eliteCreateNewCell), ScrollViewFuncType.CreateNewCell)
	slot0.elite_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._eliteNumberOfCells), ScrollViewFuncType.NumberOfCells)
	slot0.elite_scrollview:registerScriptHandlerSingle(handler(slot0, slot0._eliteUpdateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
end

function VedioMainWindow._eliteCreateNewCell(slot0)
	return ElitematchFightRecordItem.new()
end

function VedioMainWindow._eliteNumberOfCells(slot0)
	if not slot0.elite_vedio_data then
		return 0
	end

	return #slot0.elite_vedio_data
end

function VedioMainWindow._eliteUpdateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.elite_vedio_data[slot2] then
		return
	end

	slot1:setData(slot3, 3)
end

function VedioMainWindow.updateEliteVedioData(slot0)
	slot0.elite_scrollview:reloadData()

	if next(slot0.elite_vedio_data) ~= nil then
		slot0.no_vedio_image:setVisible(false)
	else
		slot0.no_vedio_image:setVisible(true)
	end
end

function VedioMainWindow.close_callback(slot0)
	if slot0.tab_scrollview then
		slot0.tab_scrollview:DeleteMe()

		slot0.tab_scrollview = nil
	end

	if slot0.vedio_scrollview then
		slot0.vedio_scrollview:DeleteMe()

		slot0.vedio_scrollview = nil
	end

	if slot0.elite_scrollview then
		slot0.elite_scrollview:DeleteMe()

		slot0.elite_scrollview = nil
	end

	uv0:clearVedioData()
	uv1:openVedioMainWindow(false)
end
