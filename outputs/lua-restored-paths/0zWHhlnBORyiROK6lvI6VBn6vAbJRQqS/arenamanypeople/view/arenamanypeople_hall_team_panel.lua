ArenaManyPeopleHallTeamPanel = class("ArenaManyPeopleHallTeamPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ArenaManyPeopleController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = RoleController:getInstance():getRoleVo()

function ArenaManyPeopleHallTeamPanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function ArenaManyPeopleHallTeamPanel.setVisibleStatus(slot0, slot1)
	if not slot0.parent then
		return
	end

	slot0.visible_status = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		slot0.dic_team_id = {}
		slot0.dic_apply_team_id = {}

		uv0:sender29010()
		uv0:sender29008()
	end
end

function ArenaManyPeopleHallTeamPanel.config(slot0)
	slot0.dic_team_id = {}
	slot0.dic_apply_team_id = {}
	slot0.default_msg = TI18N("请输入需要搜索的玩家名")
	slot0.is_must_new = true
end

function ArenaManyPeopleHallTeamPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_hall_team_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.recommend_label = slot0.container:getChildByName("recommend_label")

	slot0.recommend_label:setString(TI18N("推荐玩家"))

	slot0.find_btn = slot0.container:getChildByName("find_btn")

	slot0.find_btn:getChildByName("label"):setString(TI18N("查 找"))

	slot0.require_btn = slot0.container:getChildByName("require_btn")

	slot0.require_btn:getChildByName("label"):setString(TI18N("查看好友"))

	slot0.refresh_btn = slot0.container:getChildByName("refresh_btn")

	slot0.refresh_btn:getChildByName("label"):setString(TI18N("刷 新"))

	slot0.lay_srollview = slot0.container:getChildByName("lay_srollview")
	slot0.edit_box = createEditBox(slot0.container, PathTool.getResFrame("common", "common_1021"), cc.size(448, 52), nil, 24, Config.ColorData.data_color3[151], 20, slot0.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil)

	slot0.edit_box:setAnchorPoint(cc.p(0, 0))
	slot0.edit_box:setPlaceholderFontColor(Config.ColorData.data_color4[151])
	slot0.edit_box:setFontColor(Config.ColorData.data_color4[66])
	slot0.edit_box:setPosition(cc.p(20, 677))
end

function ArenaManyPeopleHallTeamPanel.registerEvents(slot0)
	registerButtonEventListener(slot0.find_btn, function ()
		uv0:onFindBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.require_btn, function ()
		uv0:onRequireBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.refresh_btn, function ()
		uv0:onRefreshBtn()
	end, true, REGISTER_BUTTON_SOUND_BUTTON_TYPY, nil, nil, 1)

	if slot0.arenateam_hall_mian_event == nil then
		slot0.arenateam_hall_mian_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_GET_RECOMMEND_INFO_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.is_refresh then
				uv0.is_must_new = true
				uv0.is_refresh = false
				uv0.dic_team_id = {}
			end

			uv0:setData(slot0)
		end)
	end

	if slot0.search_team_event == nil then
		slot0.search_team_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_SEARCH_TEAM_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setSearchBack(slot0)
		end)
	end

	if slot0.arenateam_apply_team_event == nil then
		slot0.arenateam_apply_team_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_INVITATION_PLAYER_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if not uv0.dic_apply_team_id then
				return
			end

			uv0.dic_apply_team_id[slot0.srv_id .. "_" .. slot0.rid] = true

			uv0:updateShowlist(false)
		end)
	end

	if slot0.arenateam_update_manber_event == nil then
		slot0.arenateam_update_manber_event = GlobalEvent:getInstance():Bind(ArenaManyPeopleEvent.ARENAMANYPOEPLE_UPDATE_MENBER_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if slot0.invite_list then
				uv0.dic_apply_team_id = {}

				for slot4, slot5 in ipairs(slot0.invite_list) do
					uv0.dic_apply_team_id[slot5.sid .. "_" .. slot5.rid] = true
				end
			end
		end)
	end
end

function ArenaManyPeopleHallTeamPanel.onFindBtn(slot0)
	if (slot0.edit_box:getText() or "") == "" then
		message(TI18N("请输入正确玩家名"))

		return
	end

	uv0:sender29001(slot1)
end

function ArenaManyPeopleHallTeamPanel.onRequireBtn(slot0)
	slot0.is_refresh = true

	uv0:sender29009()
end

function ArenaManyPeopleHallTeamPanel.onRefreshBtn(slot0)
	slot0.is_refresh = true

	uv0:sender29008()
end

function ArenaManyPeopleHallTeamPanel.setData(slot0, slot1, slot2)
	if not uv0 then
		return
	end

	slot0.scdata = slot1
	slot3 = slot2 or false

	for slot7, slot8 in ipairs(slot1.team_members) do
		if slot0.dic_team_id[slot8.sid .. "_" .. slot8.rid] then
			for slot13, slot14 in pairs(slot8) do
				slot0.dic_team_id[slot9][slot13] = slot14
			end
		else
			slot3 = true
			slot0.dic_team_id[slot9] = slot8
		end
	end

	slot0:updateShowlist(slot3)
end

function ArenaManyPeopleHallTeamPanel.updateShowlist(slot0, slot1)
	slot0.show_list = {}

	for slot5, slot6 in pairs(slot0.dic_team_id) do
		if slot0.dic_apply_team_id[slot6.sid .. "_" .. slot6.rid] then
			slot6.apply_order = 1
		else
			slot6.apply_order = 0
		end

		uv0(slot0.show_list, slot6)
	end

	uv1(slot0.show_list, SortTools.tableCommonSorter({
		{
			"apply_order",
			false
		},
		{
			"power",
			true
		},
		{
			"rid",
			false
		}
	}))
	slot0:updateTeamlist(slot1 or slot0.is_must_new)

	slot0.is_must_new = false
end

function ArenaManyPeopleHallTeamPanel.setSearchBack(slot0, slot1)
	slot0.show_list = slot1.team_members

	uv0(slot0.show_list, function (slot0, slot1)
		return slot0.power < slot1.power
	end)

	slot0.is_must_new = true

	slot0:updateTeamlist(true)
end

function ArenaManyPeopleHallTeamPanel.updateTeamlist(slot0, slot1)
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
			item_width = 600,
			item_height = 135,
			space_y = 5,
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
			text = TI18N("暂无玩家信息")
		})
	else
		commonShowEmptyIcon(slot0.lay_srollview, false)
	end
end

function ArenaManyPeopleHallTeamPanel.createNewCell(slot0, slot1, slot2)
	return ArenaManyPeopleHallTeamItem.new(slot1, slot2, slot0)
end

function ArenaManyPeopleHallTeamPanel.numberOfCells(slot0)
	if not slot0.show_list then
		return 0
	end

	return #slot0.show_list
end

function ArenaManyPeopleHallTeamPanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	if not slot0.show_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ArenaManyPeopleHallTeamPanel.DeleteMe(slot0)
	if slot0.arenateam_hall_mian_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_hall_mian_event)

		slot0.arenateam_hall_mian_event = nil
	end

	if slot0.search_team_event then
		GlobalEvent:getInstance():UnBind(slot0.search_team_event)

		slot0.search_team_event = nil
	end

	if slot0.arenateam_apply_team_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_apply_team_event)

		slot0.arenateam_apply_team_event = nil
	end

	if slot0.arenateam_update_manber_event then
		GlobalEvent:getInstance():UnBind(slot0.arenateam_update_manber_event)

		slot0.arenateam_update_manber_event = nil
	end

	if slot0.scrollview_list then
		slot0.scrollview_list:DeleteMe()

		slot0.scrollview_list = nil
	end
end

ArenaManyPeopleHallTeamItem = class("ArenaManyPeopleHallTeamItem", function ()
	return ccui.Widget:create()
end)

function ArenaManyPeopleHallTeamItem.ctor(slot0, slot1, slot2, slot3)
	slot0.parent = slot3

	slot0:configUI(slot1, slot2)
	slot0:register_event()
end

function ArenaManyPeopleHallTeamItem.configUI(slot0, slot1, slot2)
	slot0.size = cc.size(slot1, slot2)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("arenamanypeople/amp_hall_team_item"))

	slot0.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.root_wnd:setPosition(slot1 * 0.5, slot2 * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.role_name = slot0.main_container:getChildByName("role_name")
	slot0.power = slot0.main_container:getChildByName("power")
	slot0.power_bg = slot0.main_container:getChildByName("Image_1")
	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.head_icon:setHeadLayerScale(0.9)
	slot0.head_icon:setPosition(170, 67.5)
	slot0.main_container:addChild(slot0.head_icon)
	slot0.head_icon:addCallBack(function ()
		uv0:onClickHead()
	end)

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("邀 请"))

	slot0.limit_level_title = slot0.main_container:getChildByName("limit_level_title")

	slot0.limit_level_title:setString(TI18N("排名"))

	slot0.limit_rank = slot0.main_container:getChildByName("limit_level")

	slot0.limit_rank:setString(TI18N("无"))

	slot0.limit_score = slot0.main_container:getChildByName("limit_power")

	slot0.limit_score:setString(TI18N("无"))
end

function ArenaManyPeopleHallTeamItem.register_event(slot0)
	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2, nil, nil, 1)
end

function ArenaManyPeopleHallTeamItem.onClickHead(slot0)
	if not slot0.data then
		return
	end

	if RoleController:getInstance():getRoleVo() and slot0.data.rid == slot1.rid and slot0.data.sid == slot1.srv_id then
		message(TI18N("这是你自己~"))

		return
	end

	FriendController:getInstance():openFriendCheckPanel(true, {
		srv_id = slot0.data.sid,
		rid = slot0.data.rid
	})
end

function ArenaManyPeopleHallTeamItem.onComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	uv0:sender29002(slot0.data.rid, slot0.data.sid)
end

function ArenaManyPeopleHallTeamItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0.role_name:setString(slot1.name)
	slot0.power:setString(tostring(slot1.power))
	slot0.power_bg:setContentSize(cc.size(slot0.power:getContentSize().width + 75, slot0.power_bg:getContentSize().height))
	slot0.limit_score:setString(uv0(TI18N("积分：%s"), slot1.score))

	if slot1.rank > 0 then
		slot0.limit_rank:setString(tostring(slot1.rank))
	else
		slot0.limit_rank:setString(TI18N("未上榜"))
	end

	if slot0.head_icon then
		slot0.head_icon:setHeadRes(slot0.data.face_id, false, LOADTEXT_TYPE, slot0.data.face_file, slot0.data.face_update_time)
		slot0.head_icon:setLev(slot0.data.lev)
		slot0.head_icon:addDesc(false)

		slot4 = slot0.data.avatar_bid

		if slot0.head_icon.record_res_bid == nil or slot0.head_icon.record_res_bid ~= slot4 then
			slot0.head_icon.record_res_bid = slot4

			if Config.AvatarData.data_avatar[slot4] then
				slot0.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), nil, false, slot5.offy)
			else
				slot0.head_icon:showBg(PathTool.getResFrame("common", "common_1031"), nil, true)
			end
		end
	end

	if slot1.apply_order == 1 then
		setChildUnEnabled(true, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(false)
		slot0.comfirm_label:setString(TI18N("已邀请"))
		slot0.comfirm_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		slot0.comfirm_label:setString(TI18N("邀 请"))
		slot0.comfirm_label:enableOutline(Config.ColorData.data_color4[264], 2)
		setChildUnEnabled(false, slot0.comfirm_btn)
		slot0.comfirm_btn:setTouchEnabled(true)
	end
end

function ArenaManyPeopleHallTeamItem.DeleteMe(slot0)
	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
