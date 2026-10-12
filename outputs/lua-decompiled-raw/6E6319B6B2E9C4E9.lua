ArenateamFightListPanel = ArenateamFightListPanel or BaseClass(BaseView)
slot1 = ArenateamController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ArenateamFightListPanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "arenateam/arenateam_fight_list_panel"
	slot0.res_list = {}
	slot0.refresh_cd = 10

	if Config.ArenaTeamData.data_const.refresh_cd then
		slot0.refresh_cd = slot1.val
	end
end

function ArenateamFightListPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("挑 战"))

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.lay_srollview = slot0.main_container:getChildByName("lay_srollview")
	slot0.left_btn = slot0.main_container:getChildByName("left_btn")

	slot0.left_btn:getChildByName("label"):setString(TI18N("布阵调整"))

	slot0.right_btn = slot0.main_container:getChildByName("right_btn")

	slot0.right_btn:getChildByName("label"):setString(TI18N("刷 新"))

	slot0.right_btn_label = slot0.right_btn:getChildByName("label")
end

function ArenateamFightListPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickBtnClose), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 2)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickBtnLeft), true, 1)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_MATCH_OTHER_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ArenateamEvent.ARENATEAM_TIMER_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0:setTimeFormatString(slot0)
	end)

	if uv0:getTimeStep() > 0 then
		slot0:startTimer()
		slot0:setTimeFormatString(slot1)
	end

	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickBtnRight), true, 1)
end

function ArenateamFightListPanel.onClickHeroItemByIndex(slot0, slot1)
	if not slot0.hero_data then
		return
	end

	LookController:getInstance():sender11061(slot0.hero_data.rid, slot0.hero_data.srv_id, slot0.hero_data.id)
end

function ArenateamFightListPanel.onClickBtnLeft(slot0)
	if uv0:isLeader() then
		uv1:openArenateamFormPanel(true)
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamFightListPanel.onClickBtnRight(slot0)
	if slot0.is_start_timer then
		return
	end

	if uv0:isLeader() then
		uv1:sender27250()
		slot0:startTimer(true)
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamFightListPanel.onClickBtnClose(slot0)
	uv0:openArenateamFightListPanel(false)
end

function ArenateamFightListPanel.startTimer(slot0, slot1)
	if slot0.is_start_timer then
		return
	end

	slot0.is_start_timer = true

	slot0.right_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	setChildUnEnabled(true, slot0.right_btn)
	slot0.right_btn:setTouchEnabled(false)

	if slot1 then
		slot0:setTimeFormatString(slot0.refresh_cd)
		uv0:startTimeTicket()
	end
end

function ArenateamFightListPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.right_btn_label:setString(uv0(TI18N("刷新(%s)"), slot1))
	else
		slot0.right_btn_label:setString(TI18N("刷 新"))
		setChildUnEnabled(false, slot0.right_btn)
		slot0.right_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)

		slot0.is_start_timer = false

		slot0.right_btn:setTouchEnabled(true)
	end
end

function ArenateamFightListPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}

	uv0:sender27251()
end

function ArenateamFightListPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.show_list = slot1.rival_list or {}

	slot0:updateItemlist()
end

function ArenateamFightListPanel.updateItemlist(slot0)
	if not slot0.show_list then
		return
	end

	if slot0.scrollview_list == nil then
		slot0.scrollview_list = CommonScrollViewSingleLayout.new(slot0.lay_srollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_srollview:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 1,
			space_x = 0,
			item_width = 606,
			item_height = 130,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scrollview_list:setClickEnabled(false)
	end

	slot0.scrollview_list:reloadData()

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true)
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function ArenateamFightListPanel.createNewCell(slot0, slot1, slot2)
	return ArenateamFightListItem.new(slot1, slot2, slot0)
end

function ArenateamFightListPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamFightListPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if slot0.show_list[slot2] then
		slot1:setData(slot3, slot2)

		if uv0:isLeader() then
			slot1:setBtnUnEnabled(false)
		else
			slot1:setBtnUnEnabled(true)
		end
	end
end

function ArenateamFightListPanel.close_callback(slot0)
	uv0:openArenateamFightListPanel(false)
end

ArenateamFightListItem = class("ArenateamFightListItem", function ()
	return ccui.Widget:create()
end)

function ArenateamFightListItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenateamFightListItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_fight_list_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot7 = "head_node"
	slot0.head_node = slot0.main_container:getChildByName(slot7)
	slot0.head_list = {}

	for slot7 = 1, 3 do
		slot0.head_list[slot7] = PlayerHead.new(PlayerHead.type.circle)

		slot0.head_list[slot7]:setHeadLayerScale(0.8)
		slot0.head_list[slot7]:setPosition(90 * (slot7 - 1), 0)
		slot0.head_list[slot7]:setLev(99)
		slot0.head_node:addChild(slot0.head_list[slot7])
	end

	slot0.team_name = slot0.main_container:getChildByName("team_name")
	slot0.team_score = slot0.main_container:getChildByName("team_score")
	slot0.power = slot0.main_container:getChildByName("power")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("挑 战"))
end

function ArenateamFightListItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2, nil, , 1)
end

function ArenateamFightListItem.onClickHead(slot0, slot1)
	if slot0.head_list and slot0.head_list[slot1] and slot0.data then
		-- Nothing
	end
end

function ArenateamFightListItem.setBtnUnEnabled(slot0, slot1)
	if slot1 then
		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(false)
	else
		setChildUnEnabled(false, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(true)
	end
end

function ArenateamFightListItem.onComfirmBtn(slot0, slot1)
	if not slot0.data then
		return
	end

	if uv0:isLeader() then
		uv1:openArenateamFightTips(true, {
			data = slot0.data
		})
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamFightListItem.setData(slot0, slot1, slot2)
	slot0.data = slot1
	slot3 = slot0.data.team_members or {}

	for slot7, slot8 in ipairs(slot3) do
		slot8.is_leader = 0

		for slot12, slot13 in ipairs(slot8.ext) do
			if slot13.extra_key == 1 then
				if slot13.extra_val == 1 then
					slot8.is_leader = 1
				else
					slot8.is_leader = -slot8.pos
				end
			end
		end
	end

	function slot7(slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end

	uv0(slot3, slot7)

	for slot7, slot8 in ipairs(slot0.head_list) do
		if slot3[slot7] then
			slot8:setHeadRes(slot9.face_id, false, LOADTEXT_TYPE, slot9.face_file, slot9.face_update_time)
			slot8:setLev(slot9.lev)
			slot8:showLeader(false)

			if slot9.is_leader == 1 then
				slot8:showLeader(true, 80, 80)
			else
				slot8:showLeader(false)
			end

			slot10 = slot9.avatar_bid

			if slot8.record_res_bid == nil or slot8.record_res_bid ~= slot10 then
				slot8.record_res_bid = slot10

				if Config.AvatarData.data_avatar[slot10] then
					slot8:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot11.res_id or 1), false, false), nil, false, slot11.offy)
				else
					slot8:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		else
			slot8:clearHead()
			slot8:closeLev()
			slot8:showLeader(false)
			slot8:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end

	slot0.team_name:setString(slot0.data.team_name)
	slot0.team_score:setString(uv1(TI18N("积分: %s"), slot0.data.team_score))
	slot0.power:setString(slot0.data.team_power)
end

function ArenateamFightListItem.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in ipairs(slot0.item_list) do
			slot5.item:DeleteMe()
		end

		slot0.item_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
