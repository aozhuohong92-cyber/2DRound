ElitematchHistoryRecordWindow = ElitematchHistoryRecordWindow or BaseClass(BaseView)
slot0 = ElitematchController:getInstance()
slot1 = table.sort
slot2 = string.format

function ElitematchHistoryRecordWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "elitematch/elitematch_history_record_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitematch_history", "elitematch_history"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_history_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.station_list = {}
	slot0.history_data_list = {}
	slot0.is_send_list = {}

	if Config.ArenaEliteData.data_elite_const.honor_shows then
		slot0.honor_shows = slot1.val
	else
		slot0.honor_shows = {}
	end
end

function ElitematchHistoryRecordWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/elitematch", "elitematch_history_bg", true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.main_panel_size = slot0.main_panel:getContentSize()
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.left_btn = slot0.top_panel:getChildByName("left_btn")
	slot0.right_btn = slot0.top_panel:getChildByName("right_btn")
	slot0.title_name = slot0.top_panel:getChildByName("title_name")

	slot0.title_name:setString(TI18N("历史赛季"))

	slot0.choose_btn = slot0.main_panel:getChildByName("choose_btn")

	slot0.choose_btn:getChildByName("label"):setString(TI18N("查看赛区"))
	slot0.choose_btn:setVisible(false)

	slot4 = "close_btn"
	slot0.close_btn = slot0.main_panel:getChildByName(slot4)

	for slot4 = 1, 6 do
		slot5 = slot0.main_panel:getChildByName("station_lay_" .. slot4)
		slot6 = slot0.main_panel:getChildByName("point_good_btn_" .. slot4)
		slot7 = {
			station_lay = slot5,
			mode_node = slot5:getChildByName("mode_node"),
			name = slot5:getChildByName("name"),
			title_img = slot5:getChildByName("title_img"),
			power_click = slot8,
			fight_label = CommonNum.new(20, slot8, 0, -2, cc.p(0, 0.5))
		}
		slot8 = slot5:getChildByName("power_click")

		slot7.fight_label:setPosition(63, 30)

		slot0.station_list[slot4] = slot7
	end

	slot0:adaptationScreen()
end

function ElitematchHistoryRecordWindow.adaptationScreen(slot0)
	slot0.top_panel:setPositionY(display.getTop(slot0.main_container) - (slot0.main_panel_size.height - slot0.top_panel:getPositionY()))
	slot0.close_btn:setPositionY(display.getBottom(slot0.main_container) + slot0.close_btn:getPositionY())
end

function ElitematchHistoryRecordWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 2)

	slot5 = true

	registerButtonEventListener(slot0.choose_btn, handler(slot0, slot0.onClickChooseBtn), slot5, 2)

	function slot4(slot0, slot1)
		customClickActionByXY(slot0, slot1, -1, 1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:onClickBtnRight()
		end
	end

	slot0.right_btn:addTouchEventListener(slot4)

	for slot4, slot5 in ipairs(slot0.station_list) do
		if slot5.point_good_btn then
			registerButtonEventListener(slot5.point_good_btn, function ()
				uv0.onPointGoodByIndex(uv1)
			end, true, 2)
		end
	end

	slot0:addGlobalEvent(ElitematchEvent.Elite_History_Zone_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0.dic_max_zone_id = {}

		for slot4 = 1, uv0.max_period do
			uv0.dic_max_zone_id[slot4] = 1
		end

		for slot4, slot5 in ipairs(slot0.zone_info) do
			uv0.dic_max_zone_id[slot5.period] = slot5.max_zone_id
		end

		uv0:initHeadInfo()
	end)
	slot0:addGlobalEvent(ElitematchEvent.Elite_History_Record_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0(slot0.arena_elite_rank, function (slot0, slot1)
			return slot0.rank < slot1.rank
		end)

		if uv1.history_data_list[slot0.period] == nil then
			uv1.history_data_list[slot0.period] = {}
		end

		uv1.history_data_list[slot0.period][slot0.zone_id] = slot0

		if uv1.select_period == slot0.period then
			uv1:initData(slot0)
		end
	end)
end

function ElitematchHistoryRecordWindow.onClickBtnClose(slot0)
	uv0:openElitematchHistoryRecordWindow(false)
end

function ElitematchHistoryRecordWindow.onClickBtnRank(slot0)
	uv0:getModel():setElitePeriod(slot0.select_period or 1)
	RankController:getInstance():openRankView(true, RankConstant.RankType.elite)
end

function ElitematchHistoryRecordWindow.onClickChooseBtn(slot0)
	if slot0.dic_max_zone_id and slot0.dic_max_zone_id[slot0.select_period] then
		uv0:openElitematchZoneListPanel(true, slot0.dic_max_zone_id[slot0.select_period], function (slot0)
			if not slot0 then
				return
			end

			if uv0.station_list then
				uv0.cur_zone_id = slot0

				uv0:setBtnShowStatus()
				uv0:updateData()
			end
		end)
	end
end

function ElitematchHistoryRecordWindow.onClickBtnLeft(slot0)
	if not slot0.select_period then
		return
	end

	slot0.select_period = slot0.select_period - 1

	if slot0.select_period <= 1 then
		slot0.select_period = 1
	end

	slot0:setBtnShowStatus()
	slot0:updateData()
end

function ElitematchHistoryRecordWindow.onClickBtnRight(slot0)
	if not slot0.select_period then
		return
	end

	slot0.select_period = slot0.select_period + 1

	if slot0.max_period <= slot0.select_period then
		slot0.select_period = slot0.max_period
	end

	slot0:setBtnShowStatus()
	slot0:updateData()
end

function ElitematchHistoryRecordWindow.updateData(slot0)
	if not slot0.dic_max_zone_id then
		return
	end

	if not slot0.cur_zone_id then
		return
	end

	if not slot0.dic_max_zone_id[slot0.select_period] then
		return
	end

	if slot0.dic_max_zone_id[slot0.select_period] < slot0.cur_zone_id then
		slot1 = slot0.dic_max_zone_id[slot0.select_period]
	end

	if slot0.history_data_list[slot0.select_period] and slot0.history_data_list[slot0.select_period][slot1] then
		slot0:initData(slot0.history_data_list[slot0.select_period][slot1])

		return
	end

	if slot0.is_send_list[slot0.select_period] and slot0.is_send_list[slot0.select_period][slot1] then
		return
	end

	if slot0.is_send_list[slot0.select_period] == nil then
		slot0.is_send_list[slot0.select_period] = {}
	end

	slot0.is_send_list[slot0.select_period][slot1] = true

	uv0:sender24911(slot0.select_period, 1, 6, slot1)
end

function ElitematchHistoryRecordWindow.setBtnShowStatus(slot0)
	if not slot0.select_period then
		return
	end

	if not slot0.max_period then
		return
	end

	if not slot0.dic_max_zone_id then
		return
	end

	if slot0.max_period == 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(false)

		return
	end

	if slot0.select_period == 1 then
		slot0.left_btn:setVisible(false)

		if slot0.dic_max_zone_id[slot0.select_period + 1] and slot0.dic_max_zone_id[slot1] < slot0.cur_zone_id then
			slot0.right_btn:setVisible(false)
		else
			slot0.right_btn:setVisible(true)
		end
	elseif slot0.select_period == slot0.max_period then
		if slot0.dic_max_zone_id[slot0.select_period - 1] and slot0.dic_max_zone_id[slot1] < slot0.cur_zone_id then
			slot0.left_btn:setVisible(false)
		else
			slot0.left_btn:setVisible(true)
		end

		slot0.right_btn:setVisible(false)
	else
		if slot0.dic_max_zone_id[slot0.select_period - 1] and slot0.dic_max_zone_id[slot1] < slot0.cur_zone_id then
			slot0.left_btn:setVisible(false)
		else
			slot0.left_btn:setVisible(true)
		end

		if slot0.dic_max_zone_id[slot0.select_period + 1] and slot0.dic_max_zone_id[slot2] < slot0.cur_zone_id then
			slot0.right_btn:setVisible(false)
		else
			slot0.right_btn:setVisible(true)
		end
	end
end

function ElitematchHistoryRecordWindow.onPointGoodByIndex(slot0, slot1)
end

function ElitematchHistoryRecordWindow.openRootWnd(slot0, slot1, slot2, slot3)
	if not slot1 then
		return
	end

	slot0.max_period = slot2 or slot1
	slot0.select_period = slot1
	slot0.cur_zone_id = slot3 or 1

	uv0:sender24910()
end

function ElitematchHistoryRecordWindow.initHeadInfo(slot0)
	if not slot0.dic_max_zone_id then
		return
	end

	if not slot0.dic_max_zone_id[slot0.select_period] then
		return
	end

	if slot0.dic_max_zone_id[slot0.select_period] < slot0.cur_zone_id then
		if slot0.dic_max_zone_id[slot0.max_period] and slot0.dic_max_zone_id[slot0.max_period] < slot0.cur_zone_id then
			slot0.cur_zone_id = slot0.dic_max_zone_id[slot0.max_period]
		end

		slot0.select_period = slot0.max_period
	end

	slot0:setTitle(slot0.select_period, slot0.cur_zone_id)
	slot0:setBtnShowStatus()
	slot0:updateData()
end

function ElitematchHistoryRecordWindow.setTitle(slot0, slot1, slot2)
	slot3 = slot1 or 1
	slot6 = nil

	slot0.title_name:setString((not Config.ArenaEliteData.data_zone[slot2 or 1] or uv0(TI18N("S%s赛季(%s赛区)"), slot3, slot5.name)) and uv0(TI18N("S%s赛季"), slot3))
end

function ElitematchHistoryRecordWindow.initData(slot0, slot1)
	for slot5 = 1, 6 do
		slot6 = nil

		if slot1.arena_elite_rank then
			slot6 = slot1.arena_elite_rank[slot5]
		end

		if slot0.max_period == slot0.select_period then
			slot6 = nil
		end

		slot0:updateStationInfoByPos(slot5, slot6)
	end

	slot0:setTitle(slot0.select_period, slot1.zone_id)
end

function ElitematchHistoryRecordWindow.updateStationInfoByPos(slot0, slot1, slot2)
	if not slot0.station_list[slot1] then
		return
	end

	if slot2 == nil then
		if slot3.spine then
			slot3.spine:setVisible(false)
		end

		slot3.fight_label:setNum(0)
		slot3.power_click:setVisible(false)
		slot3.title_img:setVisible(false)
		slot3.name:setString(TI18N("虚以待位"))
	else
		slot3.name:setString(uv0("[%s]%s", getServerName(slot2.srv_id) or "", slot2.name))
		slot3.power_click:setVisible(true)
		slot3.title_img:setVisible(true)
		slot3.fight_label:setNum(slot2.power)

		if Config.HonorData.data_title[slot0.honor_shows[slot1]] and slot3.title_img and slot3.item_load == nil then
			slot3.item_load = loadSpriteTextureFromCDN(slot3.title_img, PathTool.getPlistImgForDownLoad("honor", "txt_cn_honor_" .. slot6.res_id, false), ResourcesType.single, slot3.item_load)
		end

		slot0:updateSpine(slot2.look_id, slot1)
	end
end

function ElitematchHistoryRecordWindow.updateSpine(slot0, slot1, slot2)
	if not slot0.station_list[slot2] then
		return
	end

	if slot3.record_look_id ~= nil and slot3.record_look_id == slot1 then
		if slot3.spine then
			slot3.spine:setVisible(true)
		end

		return
	end

	slot3.record_look_id = slot1

	function slot4()
		if not uv0.spine then
			uv0.spine = BaseRole.new(BaseRole.type.role, uv1)

			uv0.spine:setAnimation(0, PlayerAction.show, true)
			uv0.spine:setCascade(true)
			uv0.spine:setPosition(cc.p(0, -20))
			uv0.spine:setAnchorPoint(cc.p(0.5, 0.5))
			uv0.mode_node:addChild(uv0.spine)
			uv0.spine:setCascade(true)
			uv0.spine:setOpacity(0)
			uv0.spine:setScale(0.35)
			uv0.spine:runAction(cc.FadeIn:create(0.2))
		end
	end

	if slot3.spine then
		slot3.spine:setCascade(true)
		slot3.spine:runAction(cc.Sequence:create(cc.FadeOut:create(0.2), cc.CallFunc:create(function ()
			doStopAllActions(uv0.spine)
			uv0.spine:removeFromParent()

			uv0.spine = nil

			uv1()
		end)))
	else
		slot4()
	end
end

function ElitematchHistoryRecordWindow.close_callback(slot0)
	if slot0.station_list then
		for slot4, slot5 in pairs(slot0.station_list) do
			if slot5.spine then
				slot5.spine:DeleteMe()

				slot5.spine = nil
			end

			if slot5.item_load then
				slot5.item_load:DeleteMe()

				slot5.item_load = nil
			end

			if slot5.fight_label then
				slot5.fight_label:DeleteMe()

				slot5.fight_label = nil
			end
		end

		slot0.station_list = nil
	end

	uv0:openElitematchHistoryRecordWindow(false)
end
