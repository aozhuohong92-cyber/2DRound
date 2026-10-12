ArenateamHallTapTeamPanel = class("ArenateamHallTapTeamPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ArenateamController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = math.floor
slot6 = RoleController:getInstance():getRoleVo()

function ArenateamHallTapTeamPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenateamHallTapTeamPanel.setVisibleStatus(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		slot0.dic_team_id = {}

		uv0:sender27200()
	end
end

function ArenateamHallTapTeamPanel.config(slot0)
	slot0.dic_team_id = {}
	slot0.dic_apply_team_id = {}
	slot0.default_msg = TI18N("请输入需要搜索的队伍名字")
	slot0.is_must_new = true
end

function ArenateamHallTapTeamPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_hall_tap_team_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.recommend_label = slot0.container:getChildByName("recommend_label")

	slot0.recommend_label:setString(TI18N("推荐队伍"))

	slot0.find_btn = slot0.container:getChildByName("find_btn")

	slot0.find_btn:getChildByName("label"):setString(TI18N("查 找"))

	slot0.require_btn = slot0.container:getChildByName("require_btn")

	slot0.require_btn:getChildByName("label"):setString(TI18N("一键申请"))

	slot0.create_btn = slot0.container:getChildByName("create_btn")

	slot0.create_btn:getChildByName("label"):setString(TI18N("创建队伍"))

	slot0.refresh_btn = slot0.container:getChildByName("refresh_btn")

	slot0.refresh_btn:getChildByName("label"):setString(TI18N("刷 新"))

	slot0.lay_srollview = slot0.container:getChildByName("lay_srollview")
	slot0.edit_box = createEditBox(slot0.container, PathTool.getResFrame("common", "common_1021"), cc.size(448, 52), nil, 24, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, , LOADTEXT_TYPE_PLIST, nil, )

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(cc.p(20, 820))
end

function ArenateamHallTapTeamPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.find_btn, function ()
		uv0:onFindBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.require_btn, function ()
		uv0:onRequireBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.create_btn, function ()
		uv0:onCreateBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.refresh_btn, function ()
		uv0:onRefreshBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, , 1)

	if slot0.arenateam_hall_mian_event == nil then
		slot0.arenateam_hall_mian_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_HALL_MAIN_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.is_refresh then
				message(TI18N("刷新成功"))

				uv0.is_must_new = true
				uv0.is_refresh = false
				uv0.dic_team_id = {}
			end

			uv0:setData(slot0)
		end)
	end

	if slot0.arenateam_search_team_event == nil then
		slot0.arenateam_search_team_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_SEARCH_TEAM_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setSearchBack(slot0)
		end)
	end

	if slot0.arenateam_key_apply_team_event == nil then
		slot0.arenateam_key_apply_team_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_KEY_APPLY_TEAM_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:keyApplyTeam(slot0)
		end)
	end

	if slot0.arenateam_apply_team_event == nil then
		slot0.arenateam_apply_team_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_APPLY_TEAM_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.dic_apply_team_id then
				return
			end

			uv0.dic_apply_team_id[slot0.srv_id .. "_" .. slot0.tid] = true

			uv0:updateShowlist(false)
		end)
	end
end

function ArenateamHallTapTeamPanel.onFindBtn(slot0)
	if (slot0.edit_box:getText() or "") == "" then
		message(TI18N("请输入正确的队伍名字"))

		return
	end

	uv0:sender27210(slot1)
end

function ArenateamHallTapTeamPanel.onRequireBtn(slot0)
	if not slot0.show_list then
		return
	end

	if uv0:isHaveTeam() then
		message(TI18N("已有队伍,不能申请"))

		return
	end

	if #slot0.show_list == 0 then
		message(TI18N("当前无可申请的队伍"))

		return
	end

	slot2 = {}

	for slot6, slot7 in ipairs(slot0.show_list) do
		if slot7.apply_order == 0 then
			uv1(slot2, {
				tid = slot7.tid,
				order = slot6,
				srv_id = slot7.srv_id
			})
		end
	end

	uv2:sender27216(slot2)
end

function ArenateamHallTapTeamPanel.onCreateBtn(slot0)
	uv0:openArenateamCreateTeamPanel(true)
end

function ArenateamHallTapTeamPanel.onRefreshBtn(slot0)
	slot0.is_refresh = true

	uv0:sender27200()
end

function ArenateamHallTapTeamPanel.setData(slot0, slot1, slot2)
	if not uv0 then
		return
	end

	slot0.scdata = slot1
	slot3 = slot2 or false

	for slot7, slot8 in ipairs(slot1.team_list) do
		if slot0.dic_team_id[slot8.srv_id .. "_" .. slot8.tid] then
			for slot13, slot14 in pairs(slot8) do
				slot0.dic_team_id[slot9][slot13] = slot14
			end
		else
			slot3 = true
			slot0.dic_team_id[slot9] = slot8
		end
	end

	if slot1.do_join_list then
		slot0.dic_apply_team_id = {}

		for slot7, slot8 in ipairs(slot1.do_join_list) do
			slot0.dic_apply_team_id[slot8.srv_id .. "_" .. slot8.tid] = true
		end
	end

	slot0:updateShowlist(slot3)
end

function ArenateamHallTapTeamPanel.keyApplyTeam(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if not slot0.dic_apply_team_id then
		return
	end

	for slot5, slot6 in ipairs(slot1.do_join_list) do
		slot0.dic_apply_team_id[slot6.srv_id .. "_" .. slot6.tid] = true
	end

	slot0:updateShowlist(false)
end

function ArenateamHallTapTeamPanel.updateShowlist(slot0, slot1)
	slot0.show_list = {}

	for slot6, slot7 in pairs(slot0.dic_team_id) do
		if #slot7.team_members > 0 then
			slot7.temp_power = math.abs(slot7.team_power / slot8 - uv0.power)
			slot7.must_count = 0

			if slot7.team_limit_lev <= uv0.lev then
				slot7.must_count = slot7.must_count + 1
			end

			if slot7.team_limit_power <= uv0.power then
				slot7.must_count = slot7.must_count + 1
			end

			if slot0.dic_apply_team_id[slot7.srv_id .. "_" .. slot7.tid] then
				slot7.apply_order = 1
			else
				slot7.apply_order = 0
			end

			if slot8 >= 3 then
				slot7.max_count = 3
			else
				slot7.max_count = 0
			end

			uv1(slot0.show_list, slot7)
		end
	end

	uv2(slot0.show_list, SortTools.tableCommonSorter({
		{
			"max_count",
			false
		},
		{
			"apply_order",
			false
		},
		{
			"must_count",
			true
		},
		{
			"temp_power",
			false
		},
		{
			"tid",
			false
		}
	}))
	slot0:updateTeamlist(slot1 or slot0.is_must_new)

	slot0.is_must_new = false
end

function ArenateamHallTapTeamPanel.setSearchBack(slot0, slot1)
	slot0.show_list = slot1.team_list

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.tid < slot1.tid
	end)

	slot0.is_must_new = true

	slot0:updateTeamlist(true)
end

function ArenateamHallTapTeamPanel.updateTeamlist(slot0, slot1)
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
			item_height = 153,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scrollview_list:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scrollview_list:reloadData()
	elseif slot1 then
		slot0.scrollview_list:reloadData()
	else
		slot0.scrollview_list:resetCurrentItems()
	end

	if #slot0.show_list == 0 then
		commonShowEmptyIcon(slot0.lay_srollview, true, {
			text = TI18N("暂无队伍信息")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function ArenateamHallTapTeamPanel.createNewCell(slot0, slot1, slot2)
	return ArenateamHallTapTeamItem.new(slot1, slot2, slot0)
end

function ArenateamHallTapTeamPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenateamHallTapTeamPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenateamHallTapTeamPanel.setCellTouched(slot0, slot1)
	if not slot0.show_list[slot1.index] then
		return
	end
end

function ArenateamHallTapTeamPanel.DeleteMe(slot0)
	if slot0.arenateam_hall_mian_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_hall_mian_event)

		slot0.arenateam_hall_mian_event = nil
	end

	if slot0.arenateam_search_team_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_search_team_event)

		slot0.arenateam_search_team_event = nil
	end

	if slot0.arenateam_key_apply_team_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_key_apply_team_event)

		slot0.arenateam_key_apply_team_event = nil
	end

	if slot0.arenateam_apply_team_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_apply_team_event)

		slot0.arenateam_apply_team_event = nil
	end

	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()

		slot0.scrollview_list = nil
	end
end

ArenateamHallTapTeamItem = class("ArenateamHallTapTeamItem", function ()
	return ccui.Widget:create()
end)

function ArenateamHallTapTeamItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenateamHallTapTeamItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_hall_tap_team_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))

	slot8 = slot2 * 0.5

	slot0.root_wnd:setPosition(slot1 * 0.5, slot8)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.team_name = slot0.main_container:getChildByName("team_name")
	slot0.power = slot0.main_container:getChildByName("power")
	slot0.head_list = {}

	for slot8 = 1, 3 do
		slot0.head_list[slot8] = PlayerHead.new(PlayerHead.type.circle)

		slot0.head_list[slot8]:setHeadLayerScale(0.8)
		slot0.head_list[slot8]:setPosition(58 + 95 * (slot8 - 1), 58)
		slot0.head_list[slot8]:setLev(99)
		slot0.main_container:addChild(slot0.head_list[slot8])
	end

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("申 请"))

	slot0.apply_tips = slot0.main_container:getChildByName("apply_tips")

	slot0.apply_tips:setString(TI18N("已申请"))
	slot0.apply_tips:setVisible(false)

	slot0.limit_level = slot0.main_container:getChildByName("limit_level")

	slot0.limit_level:setString(TI18N("等级: 无"))

	slot0.limit_power = slot0.main_container:getChildByName("limit_power")

	slot0.limit_power:setString(TI18N("战力: 无"))
end

function ArenateamHallTapTeamItem.register_event(slot0)
	function slot4()
		uv0:onComfirmBtn()
	end

	slot5 = true

	registerButtonEventListener(slot0.comfirm_btn, slot4, slot5, 2, nil, , 1)

	for slot4, slot5 in ipairs(slot0.head_list) do
		slot5:addCallBack(function ()
			uv0:onClickHead(uv1)
		end)
	end
end

function ArenateamHallTapTeamItem.onClickHead(slot0, slot1)
	if not (slot0.data.team_members or {})[slot1] then
		return
	end

	if slot0.head_list and slot0.head_list[slot1] then
		if RoleController:getInstance():getRoleVo() and slot3.rid == slot4.rid and slot3.sid == slot4.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot3.sid,
			rid = slot3.rid
		})
	end
end

function ArenateamHallTapTeamItem.onComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	if uv0:isHaveTeam() then
		message(TI18N("已有队伍,不能申请"))

		return
	end

	if slot0.data.apply_order == 1 then
		message(TI18N("已申请该队伍"))

		return
	end

	if not slot0.is_ok then
		message(TI18N("申请条件不满足"))

		return
	end

	uv1:sender27202(slot0.data.tid, slot0.data.srv_id)
end

function ArenateamHallTapTeamItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.team_name:setString(slot1.team_name)
	slot0.power:setString(slot1.team_power)

	slot2 = slot1.team_members or {}

	for slot6, slot7 in ipairs(slot2) do
		slot7.is_leader = 0

		for slot11, slot12 in ipairs(slot7.ext) do
			if slot12.extra_key == 1 then
				if slot12.extra_val == 1 then
					slot7.is_leader = 1
				else
					slot7.is_leader = -slot7.pos
				end
			end
		end
	end

	function slot6(slot0, slot1)
		return slot1.is_leader < slot0.is_leader
	end

	uv0(slot2, slot6)

	for slot6, slot7 in ipairs(slot0.head_list) do
		if slot2[slot6] then
			slot7:setHeadRes(slot8.face_id, false, LOADTEXT_TYPE, slot8.face_file, slot8.face_update_time)
			slot7:setLev(slot8.lev)
			slot7:addDesc(false)

			if slot8.is_leader == 1 then
				slot7:showLeader(true)
			else
				slot7:showLeader(false)
			end

			slot9 = slot8.avatar_bid

			if slot7.record_res_bid == nil or slot7.record_res_bid ~= slot9 then
				slot7.record_res_bid = slot9

				if Config.AvatarData.data_avatar[slot9] then
					slot7:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot10.res_id or 1), false, false), nil, false, slot10.offy)
				else
					slot7:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
				end
			end
		else
			slot7:clearHead()
			slot7:closeLev()
			slot7:addDesc(true, TI18N("待加入"))
			slot7:showLeader(false)
			slot7:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
		end
	end

	slot0.is_ok = true

	if #slot2 < 3 then
		if slot1.team_limit_lev == 0 then
			slot0.limit_level:setVisible(false)
		else
			slot0.limit_level:setVisible(true)
			slot0.limit_level:setString(uv1(TI18N("等级: %s级"), slot1.team_limit_lev))

			if uv2 and slot1.team_limit_lev <= uv2.lev then
				slot0.limit_level:setTextColor(cc.c3b(36, 144, 3))
			else
				slot0.limit_level:setTextColor(cc.c3b(217, 80, 20))

				slot0.is_ok = false
			end
		end

		if slot1.team_limit_power == 0 then
			slot0.limit_power:setVisible(false)
		else
			slot0.limit_power:setVisible(true)
			slot0.limit_power:setString(uv1(TI18N("战力: %s万"), uv3(slot1.team_limit_power / 10000)))

			if uv2 and slot1.team_limit_power <= uv2.power then
				slot0.limit_power:setTextColor(cc.c3b(36, 144, 3))
			else
				slot0.limit_power:setTextColor(cc.c3b(217, 80, 20))

				slot0.is_ok = false
			end
		end
	else
		slot0.limit_level:setVisible(false)
		slot0.limit_power:setVisible(false)
	end

	if uv4:isHaveTeam() then
		slot0.comfirm_btn:setVisible(false)
	else
		slot0.comfirm_btn:setVisible(true)

		if slot1.max_count == 3 then
			setChildUnEnabled(true, slot0.comfirm_btn)
			slot0.comfirm_btn:setTouchEnabled(false)
			slot0.comfirm_label:setString(TI18N("已满人"))
			slot0.comfirm_label:disableEffect(cc.LabelEffect.OUTLINE)
		elseif slot1.apply_order == 1 then
			setChildUnEnabled(true, slot0.comfirm_btn)
			slot0.comfirm_btn:setTouchEnabled(false)
			slot0.comfirm_label:setString(TI18N("已申请"))
			slot0.comfirm_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			slot0.comfirm_label:setString(TI18N("申 请"))
			slot0.comfirm_label:enableOutline(Config.ColorData.data_color4[263], 2)

			if slot0.is_ok then
				setChildUnEnabled(false, slot0.comfirm_btn)
				slot0.comfirm_btn:setTouchEnabled(true)
			else
				setChildUnEnabled(true, slot0.comfirm_btn)
				slot0.comfirm_btn:setTouchEnabled(false)
			end
		end
	end
end

function ArenateamHallTapTeamItem.DeleteMe(slot0)
	if slot0.head_list then
		for slot4, slot5 in ipairs(slot0.head_list) do
			slot5:DeleteMe()
		end

		slot0.head_list = {}
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
