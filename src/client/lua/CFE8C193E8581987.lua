ArenateamHallTapMyTeamPanel = class("ArenateamHallTapMyTeamPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ArenateamController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = math.floor
slot6 = RoleController:getInstance():getRoleVo()

function ArenateamHallTapMyTeamPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenateamHallTapMyTeamPanel.setVisibleStatus(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 then
		uv0:sender27221()
	end
end

function ArenateamHallTapMyTeamPanel.config(slot0)
	slot0.default_msg = TI18N("请输入需要搜索的队伍名字")
end

function ArenateamHallTapMyTeamPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenateam/arenateam_hall_tap_my_team_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.team_name = slot0.container:getChildByName("team_name")

	slot0.team_name:setString("")

	slot0.level_value = slot0.container:getChildByName("level_value")

	slot0.level_value:setString(TI18N("不限"))

	slot0.power_value = slot0.container:getChildByName("power_value")

	slot0.power_value:setString(TI18N("不限"))

	slot0.power = slot0.container:getChildByName("power")

	slot0.power:setString(0)
	slot0.container:getChildByName("level_key"):setString(TI18N("申请条件:"))

	slot0.chang_btn = slot0.container:getChildByName("chang_btn")
	slot0.set_btn = slot0.container:getChildByName("set_btn")

	slot0.set_btn:getChildByName("label"):setString(TI18N("调整"))

	slot0.exit_btn = slot0.container:getChildByName("exit_btn")

	slot0.exit_btn:getChildByName("label"):setString(TI18N("退出队伍"))

	slot0.join_btn = slot0.container:getChildByName("join_btn")
	slot0.join_btn_lable = slot0.join_btn:getChildByName("label")

	slot0.join_btn_lable:setString(TI18N("报名参赛"))
	slot0.chang_btn:setVisible(false)
	slot0.set_btn:setVisible(false)
	slot0.exit_btn:setVisible(false)

	slot5 = false

	slot0.join_btn:setVisible(slot5)

	slot0.team_item_list = {}

	for slot5 = 1, 3 do
		if slot0.container:getChildByName("team_item_" .. slot5) then
			slot0.team_item_list[slot5] = {}
			slot8 = slot6:getChildByName("team_info")
			slot0.team_item_list[slot5].team_item = slot6
			slot0.team_item_list[slot5].team_info = slot8
			slot0.team_item_list[slot5].team_add = slot6:getChildByName("team_add")
			slot16 = cc.p(132, 177)
			slot0.team_item_list[slot5].player_name = createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), slot16, nil, nil, 800)

			slot8:addChild(slot0.team_item_list[slot5].player_name)

			slot0.team_item_list[slot5].power = slot8:getChildByName("power")

			slot0.team_item_list[slot5].power:setString(0)

			slot0.team_item_list[slot5].head = PlayerHead.new(PlayerHead.type.circle)

			slot0.team_item_list[slot5].head:setHeadLayerScale(0.8)
			slot0.team_item_list[slot5].head:setPosition(56, 160)
			slot0.team_item_list[slot5].head:setLev(0)
			slot8:addChild(slot0.team_item_list[slot5].head)
			slot0.team_item_list[slot5].head:addCallBack(function ()
				uv0:onClickHead(uv1)
			end)

			slot0.team_item_list[slot5].hero_item_list = {}
			slot10 = HeroExhibitionItem.Width * 0.8 + 10

			for slot16 = 1, 5 do
				slot0.team_item_list[slot5].hero_item_list[slot16] = HeroExhibitionItem.new(0.8, true)

				slot0.team_item_list[slot5].hero_item_list[slot16]:setSwallowTouches(false)
				slot0.team_item_list[slot5].hero_item_list[slot16]:setPosition(slot6:getContentSize().width * 0.5 - slot10 * 5 * 0.5 + slot10 * 0.5 + (slot16 - 1) * slot10, 58)
				slot0.team_item_list[slot5].hero_item_list[slot16]:addCallBack(function ()
					uv0:onClickHeroItemByIndex(uv1, uv2)
				end)
				slot8:addChild(slot0.team_item_list[slot5].hero_item_list[slot16])
			end

			slot0.team_item_list[slot5].del_btn = slot8:getChildByName("del_btn")

			slot0.team_item_list[slot5].del_btn:getChildByName("label"):setString(TI18N("踢出队伍"))

			slot0.team_item_list[slot5].team_btn = slot8:getChildByName("team_btn")

			slot0.team_item_list[slot5].team_btn:getChildByName("label"):setString(TI18N("移交队长"))

			slot0.team_item_list[slot5].add_btn = slot9:getChildByName("add_btn")

			slot0.team_item_list[slot5].add_btn:setPositionY(118)
			slot9:getChildByName("tips"):setString(TI18N("点击可查看申请列表或邀请玩家加入队伍"))
			slot6:setVisible(false)
		end
	end
end

function ArenateamHallTapMyTeamPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.chang_btn, function ()
		uv0:onChangBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.set_btn, function ()
		uv0:onSetBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.exit_btn, function ()
		uv0:onExitBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.join_btn, function ()
		uv0:onJoinBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)

	if slot0.team_item_list then
		for slot4, slot5 in ipairs(slot0.team_item_list) do
			registerButtonEventListener(slot5.del_btn, function ()
				uv0:onDelBtnByIndex(uv1)
			end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
			registerButtonEventListener(slot5.team_btn, function ()
				uv0:onTeamBtnByIndex(uv1)
			end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
			registerButtonEventListener(slot5.add_btn, function ()
				uv0:onAddBtnByIndex(uv1)
			end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
		end
	end

	if slot0.arenateam_my_team_info_event == nil then
		slot0.arenateam_my_team_info_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_MY_TEAM_INFO_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setData(slot0)
		end)
	end

	if slot0.arenateam_join_name_event == nil then
		slot0.arenateam_join_name_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_JOIN_GAME_EVENT, function ()
			if uv0.scdata then
				uv0.scdata.is_sign = 1

				uv0:updateJoinInfo()
			end
		end)
	end

	if slot0.arenateam_leave_name_event == nil then
		slot0.arenateam_leave_name_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_LEAVE_GAME_EVENT, function ()
			if uv0.scdata then
				uv0.scdata.is_sign = 0

				uv0:updateJoinInfo()
			end
		end)
	end

	if slot0.arenateam_change_name_callback == nil then
		slot0.arenateam_change_name_callback = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_CHANGE_NAME_CALLBACK, function (slot0)
			uv0.record_name = slot0
		end)
	end

	if slot0.arenateam_team_set_callback == nil then
		slot0.arenateam_team_set_callback = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_TEAM_SET_CALLBACK, function (slot0, slot1)
			uv0.record_limit_lev = slot0 or 0
			uv0.record_limit_power = slot1 or 0
		end)
	end

	if slot0.arenateam_change_name_event == nil then
		slot0.arenateam_change_name_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_CHANGE_NAME_EVENT, function ()
			if uv0.record_name and uv0.scdata then
				uv0.scdata.team_name = uv0.record_name

				uv0.team_name:setString(uv0.scdata.team_name)

				uv0.record_name = nil
			end
		end)
	end

	if slot0.arenateam_team_set_event == nil then
		slot0.arenateam_team_set_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_TEAM_SET_EVENT, function ()
			if uv0.scdata then
				if uv0.record_limit_lev then
					uv0.scdata.team_limit_lev = uv0.record_limit_lev
					uv0.record_limit_lev = nil
				end

				if uv0.record_limit_power then
					uv0.scdata.team_limit_power = uv0.record_limit_power
					uv0.record_limit_power = nil
				end

				uv0:updateSetInfo()
			end
		end)
	end

	if slot0.arenateam_apply_redpoint_event == nil then
		slot0.arenateam_apply_redpoint_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_APPLY_RED_POINT_EVENT, function ()
			if uv0.scdata then
				uv0:updateRedPoint()
			end
		end)
	end

	if slot0.arenateam_all_redpoint_event == nil then
		slot0.arenateam_all_redpoint_event = GlobalEvent:getInstance():Bind(ArenateamEvent.ARENATEAM_ALL_RED_POINT_EVENT, function ()
			if uv0.scdata then
				uv0:updateRedPoint()
			end
		end)
	end
end

function ArenateamHallTapMyTeamPanel.updateRedPoint(slot0)
	if slot0.scdata.tid ~= 0 and slot0.team_member then
		for slot4, slot5 in ipairs(slot0.team_item_list) do
			if slot0.team_member[slot4] == nil then
				if uv0.is_apply_red then
					addRedPointToNodeByStatus(slot5.add_btn, true, -20, -20)
				else
					addRedPointToNodeByStatus(slot5.add_btn, false, 5, 5)
				end
			end
		end
	end
end

function ArenateamHallTapMyTeamPanel.onClickHead(slot0, slot1)
	if slot0.team_member and slot0.team_member[slot1] then
		slot2 = slot0.team_member[slot1]

		if uv0 and slot2.rid == uv0.rid and slot2.sid == uv0.srv_id then
			message(TI18N("这是你自己~"))

			return
		end

		FriendController:getInstance():openFriendCheckPanel(true, {
			srv_id = slot2.sid,
			rid = slot2.rid
		})
	end
end

function ArenateamHallTapMyTeamPanel.onChangBtn(slot0)
	if not slot0.scdata then
		return
	end

	if uv0 and uv0.rid == slot0.scdata.rid and uv0.srv_id == slot0.scdata.sid then
		uv1:openArenateamChangTeamNamePanel(true)
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamHallTapMyTeamPanel.onSetBtn(slot0)
	if not slot0.scdata then
		return
	end

	if uv0 and uv0.rid == slot0.scdata.rid and uv0.srv_id == slot0.scdata.sid then
		if not slot0.scdata then
			return
		end

		uv1:openArenateamTeamSetPanel(true, {
			team_limit_power = slot0.scdata.team_limit_power,
			team_limit_lev = slot0.scdata.team_limit_lev,
			team_is_check = slot0.scdata.team_is_check
		})
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamHallTapMyTeamPanel.onExitBtn(slot0)
	CommonAlert.show(TI18N("请确认是否退出队伍，队长退队会将队长职位移交给队内战力最高的玩家"), TI18N("确定"), function ()
		uv0:sender27211()
	end, TI18N("取消"), nil, CommonAlert.type.rich, nil, other_args)
end

function ArenateamHallTapMyTeamPanel.onJoinBtn(slot0)
	if not slot0.scdata then
		return
	end

	if uv0 and uv0.rid == slot0.scdata.rid and uv0.srv_id == slot0.scdata.sid then
		if not slot0.team_member then
			return
		end

		if #slot0.team_member < 3 then
			message(TI18N("队伍人数不足"))

			return
		end

		if slot0.scdata.is_sign == 1 then
			uv1:sender27241()
		else
			uv1:sender27240()
		end
	else
		message(TI18N("只有队长可进行该操作"))
	end
end

function ArenateamHallTapMyTeamPanel.onDelBtnByIndex(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.team_member and slot0.team_member[slot1] then
		uv0:openArenateamDeletePlayerPanel(true, {
			member_data = slot0.team_member[slot1]
		})
	end
end

function ArenateamHallTapMyTeamPanel.onTeamBtnByIndex(slot0, slot1)
	if not slot0.team_member then
		return
	end

	if not slot0.team_member[slot1] then
		return
	end

	CommonAlert.show(uv0(TI18N("请确定将队长移交给玩家:<div fontcolor='#289b14'>%s</div>吗?"), slot0.team_member[slot1].name), TI18N("确定"), function ()
		uv0:sender27213(uv1.rid, uv1.sid)
	end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {
		timer = 5,
		timer_for = true,
		title = TI18N("移交队长")
	})
end

function ArenateamHallTapMyTeamPanel.onAddBtnByIndex(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.tid == 0 then
		message(TI18N("请先加入队伍"))

		return
	end

	slot2 = false
	slot3 = nil

	uv2:openArenateamAddPlayerPanel(true, {
		is_team_leader = uv0 and uv0.rid == slot0.scdata.rid and uv0.srv_id == slot0.scdata.sid and true or false,
		index = (not uv1.is_apply_red or ArenateamConst.AddPlayerTabType.eApplyList) and ArenateamConst.AddPlayerTabType.eInvitation
	})
end

function ArenateamHallTapMyTeamPanel.onClickHeroItemByIndex(slot0, slot1, slot2)
end

function ArenateamHallTapMyTeamPanel.setData(slot0, slot1)
	slot0.scdata = slot1

	if slot0.scdata.tid == 0 then
		slot0.chang_btn:setVisible(false)
		slot0.set_btn:setVisible(false)
		slot0.exit_btn:setVisible(false)
		slot0.join_btn:setVisible(false)
		slot0.team_name:setString(TI18N("未加入队伍"))
		slot0.level_value:setString(TI18N("不限"))
		slot0.power_value:setString(TI18N("不限"))

		slot5 = 0

		slot0.power:setString(slot5)

		for slot5, slot6 in ipairs(slot0.team_item_list) do
			slot6.team_item:setVisible(false)
		end

		commonShowEmptyIcon(slot0.container, true, {
			text = TI18N("暂无队伍信息")
		})

		return
	else
		slot0.chang_btn:setVisible(true)
		slot0.set_btn:setVisible(true)
		slot0.exit_btn:setVisible(true)
		slot0.join_btn:setVisible(true)
		commonShowEmptyIcon(slot0.container, false)
	end

	slot0:updateJoinInfo()
	slot0.team_name:setString(slot0.scdata.team_name)
	slot0:updateSetInfo()
	slot0.power:setString(slot0.scdata.team_power)

	slot3 = nil
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.scdata.arena_team_member or {}) do
		if slot9.rid == slot0.scdata.rid and slot9.sid == slot0.scdata.sid then
			slot3 = slot9
		else
			uv0(slot4, slot9)
		end
	end

	uv1(slot4, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)

	slot8 = 1
	slot9 = slot3

	uv0(slot4, slot8, slot9)

	slot0.team_member = slot4

	for slot8, slot9 in ipairs(slot0.team_item_list) do
		slot9.team_item:setVisible(true)

		if slot4[slot8] then
			slot9.team_info:setVisible(true)
			slot9.team_add:setVisible(false)
			slot0:updateTeamItem(slot9, slot10)
		else
			slot9.team_info:setVisible(false)
			slot9.team_add:setVisible(true)
		end
	end

	slot0:updateRedPoint()
end

function ArenateamHallTapMyTeamPanel.updateJoinInfo(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.is_sign == 1 then
		slot0.join_btn_lable:setString(TI18N("取消报名"))
	else
		slot0.join_btn_lable:setString(TI18N("报名参赛"))
	end
end

function ArenateamHallTapMyTeamPanel.updateSetInfo(slot0)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.team_limit_lev == 0 then
		slot0.level_value:setString(TI18N("不限"))
	else
		slot0.level_value:setString(uv0(TI18N("等级: %s"), slot0.scdata.team_limit_lev))
	end

	if slot0.scdata.team_limit_power == 0 then
		slot0.power_value:setString(TI18N("不限"))
	else
		slot0.power_value:setString(uv0(TI18N("战力: %sw"), uv1(slot0.scdata.team_limit_power / 10000)))
	end
end

function ArenateamHallTapMyTeamPanel.updateTeamItem(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot2 then
		return
	end

	if not slot0.scdata then
		return
	end

	if slot0.scdata.rid == slot2.rid and slot0.scdata.sid == slot2.sid then
		slot1.player_name:setString(uv0(TI18N("<div fontcolor=#643223>%s</div><div fontcolor=#955322>(队长)</div>"), slot2.name))
		slot1.del_btn:setVisible(false)
		slot1.team_btn:setVisible(false)
	else
		slot1.player_name:setString(slot2.name)

		if uv1 and uv1.rid == slot0.scdata.rid and uv1.srv_id == slot0.scdata.sid then
			slot1.del_btn:setVisible(true)
			slot1.team_btn:setVisible(true)
		else
			slot1.del_btn:setVisible(false)
			slot1.team_btn:setVisible(false)
		end
	end

	slot1.power:setString(slot2.power)
	slot1.head:setHeadRes(slot2.face_id, false, LOADTEXT_TYPE, slot2.face_file, slot2.face_update_time)
	slot1.head:setLev(slot2.lev)

	slot3 = slot2.avatar_bid

	if slot1.record_res_bid == nil or slot1.record_res_bid ~= slot3 then
		slot1.record_res_bid = slot3

		if Config.AvatarData.data_avatar[slot3] then
			slot1.head:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot4.res_id or 1), false, false), nil, false, slot4.offy)
		end
	end

	function slot7(slot0, slot1)
		return slot0.pos < slot1.pos
	end

	uv2(slot2.team_partner, slot7)

	for slot7, slot8 in ipairs(slot1.hero_item_list) do
		slot8:setData(slot2.team_partner[slot7])
	end
end

function ArenateamHallTapMyTeamPanel.DeleteMe(slot0)
	if slot0.arenateam_my_team_info_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_my_team_info_event)

		slot0.arenateam_my_team_info_event = nil
	end

	if slot0.arenateam_join_name_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_join_name_event)

		slot0.arenateam_join_name_event = nil
	end

	if slot0.arenateam_leave_name_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_leave_name_event)

		slot0.arenateam_leave_name_event = nil
	end

	if slot0.arenateam_change_name_callback then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_change_name_callback)

		slot0.arenateam_change_name_callback = nil
	end

	if slot0.arenateam_team_set_callback then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_team_set_callback)

		slot0.arenateam_team_set_callback = nil
	end

	if slot0.arenateam_change_name_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_change_name_event)

		slot0.arenateam_change_name_event = nil
	end

	if slot0.arenateam_team_set_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_team_set_event)

		slot0.arenateam_team_set_event = nil
	end

	if slot0.arenateam_apply_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_apply_redpoint_event)

		slot0.arenateam_apply_redpoint_event = nil
	end

	if slot0.arenateam_all_redpoint_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_all_redpoint_event)

		slot0.arenateam_all_redpoint_event = nil
	end
end
