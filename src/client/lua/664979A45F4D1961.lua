LadderLogWindow = LadderLogWindow or BaseClass(BaseView)
slot1 = LadderController:getInstance():getModel()

function LadderLogWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "ladder/ladder_log_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.tab_list = {}
end

function LadderLogWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("战 报"))

	slot0.title_bg = slot1:getChildByName("title_nd")

	slot0.title_bg:getChildByName("enemy_title"):setString(TI18N("对手"))
	slot0.title_bg:getChildByName("more_title"):setString(TI18N("详细"))

	slot0.share_panel = slot0.root_wnd:getChildByName("share_panel")

	slot0.share_panel:setVisible(false)

	slot5 = slot0.share_panel:getChildByName("share_bg")
	slot0.share_bg = slot5
	slot0.btn_guild = slot5:getChildByName("btn_guild")
	slot0.btn_world = slot5:getChildByName("btn_world")
	slot0.btn_cross = slot5:getChildByName("btn_cross")

	slot5:getChildByName("guild_label"):setString(TI18N("公会频道"))

	slot13 = "世界频道"

	slot5:getChildByName("world_label"):setString(TI18N(slot13))
	slot5:getChildByName("cross_label"):setString(TI18N("跨服频道"))

	for slot13 = 1, 2 do
		slot14 = {}

		if slot1:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot13) then
			if slot13 == 1 then
				slot15:getChildByName("title"):setString(TI18N("我的记录"))
			elseif slot13 == 2 then
				slot16:setString(TI18N("大神风采"))
			end

			slot16:setTextColor(cc.c4b(215, 226, 227, 255))

			slot14.tab_btn = slot15
			slot14.label = slot16
			slot14.index = slot13
			slot14.tips = slot15:getChildByName("tips")
			slot0.tab_list[slot13] = slot14
		end
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.no_log_label = slot1:getChildByName("no_log_label")
	slot0.no_log_image = slot1:getChildByName("no_log_image")
	slot0.my_log_panel = slot1:getChildByName("my_log_panel")
	slot0.god_log_panel = slot1:getChildByName("god_log_panel")

	slot0.no_log_label:setString(TI18N("暂无战报"))

	slot10 = slot0.my_log_panel:getContentSize()
	slot0.my_log_scrollview = CommonScrollViewLayout.new(slot0.my_log_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot10.width, slot10.height - 8), {
		start_y = -5,
		item_width = 612,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 135,
		space_y = -5,
		col = 1,
		need_dynamic = true,
		item_class = LadderMyLogItem
	})

	slot0.my_log_scrollview:setSwallowTouches(false)

	slot13 = slot0.god_log_panel:getContentSize()
	slot0.god_log_scrollview = CommonScrollViewLayout.new(slot0.god_log_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot13.width, slot13.height - 8), {
		start_y = 0,
		item_width = 612,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 153,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = LadderGodLogItem
	})

	slot0.god_log_scrollview:setSwallowTouches(false)
end

function LadderLogWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or 1)
end

function LadderLogWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0._onClickBtnClose), false, 2)

	slot5 = false

	registerButtonEventListener(slot0.background, handler(slot0, slot0._onClickBtnClose), slot5, 2)
	registerButtonEventListener(slot0.share_panel, handler(slot0, slot0._onClickSharePanel))
	registerButtonEventListener(slot0.btn_world, handler(slot0, slot0._onClickBtnShareWorld))
	registerButtonEventListener(slot0.btn_guild, handler(slot0, slot0._onClickBtnShareGuild))

	slot4 = handler

	registerButtonEventListener(slot0.btn_cross, slot4(slot0, slot0._onClickBtnShareCross))

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

	if slot0.ladder_mylog_event == nil then
		slot0.ladder_mylog_event = GlobalEvent:getInstance():Bind(LadderEvent.UpdateLadderMyLogData, function (slot0)
			uv0.my_log_replay_srv_id = slot0.replay_srv_id

			if slot0.log_list then
				uv0:setMyLogData(slot0.log_list)
			end
		end)
	end

	if slot0.ladder_godlog_event == nil then
		slot0.ladder_godlog_event = GlobalEvent:getInstance():Bind(LadderEvent.UpdateLadderGodLogData, function (slot0)
			uv0.god_log_replay_srv_id = slot0.replay_srv_id

			if slot0.log_list then
				uv0:setGodLogData(slot0.log_list)
			end
		end)
	end
end

function LadderLogWindow._onClickSharePanel(slot0)
	slot0.share_panel:setVisible(false)
end

function LadderLogWindow._onShowSharePanel(slot0, slot1, slot2, slot3, slot4)
	slot0.replay_id = slot2
	slot0.def_name = slot3
	slot0.share_srv_id = slot4

	if slot0.share_panel:convertToNodeSpace(slot1) then
		slot0.share_bg:setPosition(cc.p(slot5.x - 32, slot5.y + 70))
		slot0.share_panel:setVisible(true)
	end
end

function LadderLogWindow._onClickBtnShareWorld(slot0)
	if slot0.replay_id and slot0.def_name and slot0.share_srv_id then
		uv0:requestShareVideo(slot0.replay_id, slot0.share_srv_id, ChatConst.Channel.World, slot0.def_name)
	end

	slot0.share_panel:setVisible(false)
end

function LadderLogWindow._onClickBtnShareGuild(slot0)
	if RoleController:getInstance():getRoleVo() and slot1.gid ~= 0 and slot1.gsrv_id ~= "" then
		if slot0.replay_id and slot0.def_name and slot0.share_srv_id then
			uv0:requestShareVideo(slot0.replay_id, slot0.share_srv_id, ChatConst.Channel.Gang, slot0.def_name)
		end
	else
		message(TI18N("暂无公会"))
	end

	slot0.share_panel:setVisible(false)
end

function LadderLogWindow._onClickBtnShareCross(slot0)
	if slot0.replay_id and slot0.def_name and slot0.share_srv_id then
		uv0:requestShareVideo(slot0.replay_id, slot0.share_srv_id, ChatConst.Channel.Cross, slot0.def_name)
	end

	slot0.share_panel:setVisible(false)
end

function LadderLogWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_2023"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c4b(215, 226, 227, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_2021"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c4b(255, 255, 255, 255))
	end

	slot0.title_bg:setVisible(slot1 == 1)
	slot0.my_log_scrollview:setVisible(slot1 == 1)
	slot0.god_log_scrollview:setVisible(slot1 == 2)

	if slot1 == 1 and slot0.myLogData and next(slot0.myLogData) ~= nil or slot1 == 2 and slot0.godLogData and next(slot0.godLogData) ~= nil then
		slot0.no_log_image:setVisible(false)
		slot0.no_log_label:setVisible(false)
	else
		slot0.no_log_image:setVisible(true)
		slot0.no_log_label:setVisible(true)
	end

	if slot1 == 1 and not slot0.init_my_log then
		uv0:requestMyLogData()

		slot0.init_my_log = true
	elseif slot1 == 2 and not slot0.init_god_log then
		uv0:requestGodLogData()

		slot0.init_god_log = true
	end
end

function LadderLogWindow.setMyLogData(slot0, slot1)
	if slot0.tab_object == nil or slot0.tab_object.index ~= 1 then
		return
	end

	slot0.myLogData = slot1

	if slot1 and next(slot1) ~= nil then
		slot0.my_log_scrollview:setVisible(true)
		slot0.no_log_image:setVisible(false)
		slot0.no_log_label:setVisible(false)
		slot0.my_log_scrollview:setData(slot1, nil, nil, {
			callback = handler(slot0, slot0._onShowSharePanel),
			replay_srv_id = slot0.my_log_replay_srv_id
		})
	else
		slot0.my_log_scrollview:setVisible(false)
		slot0.no_log_image:setVisible(true)
		slot0.no_log_label:setVisible(true)
	end
end

function LadderLogWindow.setGodLogData(slot0, slot1)
	if slot0.tab_object == nil or slot0.tab_object.index ~= 2 then
		return
	end

	slot0.godLogData = slot1

	if slot1 and next(slot1) ~= nil then
		slot0.god_log_scrollview:setVisible(true)
		slot0.no_log_image:setVisible(false)
		slot0.no_log_label:setVisible(false)
		slot0.god_log_scrollview:setData(slot1, nil, nil, slot0.god_log_replay_srv_id)
	else
		slot0.god_log_scrollview:setVisible(false)
		slot0.no_log_image:setVisible(true)
		slot0.no_log_label:setVisible(true)
	end
end

function LadderLogWindow._onClickBtnClose(slot0)
	uv0:openLadderLogWindow(false)
end

function LadderLogWindow.close_callback(slot0)
	uv0:updateLadderRedStatus(LadderConst.RedType.BattleLog, false)
	uv1:openLadderLogWindow(false)

	if slot0.ladder_mylog_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ladder_mylog_event)

		slot0.ladder_mylog_event = nil
	end

	if slot0.ladder_godlog_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ladder_godlog_event)

		slot0.ladder_godlog_event = nil
	end

	if slot0.my_log_scrollview then
		slot0.my_log_scrollview:DeleteMe()
	end

	slot0.my_log_scrollview = nil

	if slot0.god_log_scrollview then
		slot0.god_log_scrollview:DeleteMe()
	end

	slot0.god_log_scrollview = nil
end

LadderMyLogItem = class("LadderMyLogItem", function ()
	return ccui.Widget:create()
end)

function LadderMyLogItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function LadderMyLogItem.configUI(slot0)
	slot0.size = cc.size(612, 135)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("ladder/ladder_my_log_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.attk_label = slot2:getChildByName("attk_label")
	slot0.name_label = slot2:getChildByName("name_label")
	slot0.defend_label = slot2:getChildByName("defend_label")
	slot0.time_label = slot2:getChildByName("time_label")
	slot0.btn_share = slot2:getChildByName("btn_share")
	slot0.btn_watch = slot2:getChildByName("btn_watch")
	slot0.rank_label = createRichLabel(22, cc.c3b(169, 95, 15), cc.p(0, 0.5), cc.p(275, 30))

	slot2:addChild(slot0.rank_label)

	slot0.my_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.my_head:setHeadLayerScale(0.7)
	slot0.my_head:setPosition(60, 85)
	slot2:addChild(slot0.my_head)
	slot0.my_head:addCallBack(function ()
		if uv0.data then
			if uv0.data.srv_id == "robot" then
				message(TI18N("神秘人太高冷，不给查看"))
			else
				ChatController:getInstance():openFriendInfo({
					rid = uv0.data.rid,
					srv_id = uv0.data.srv_id
				}, cc.p(0, 0))
			end
		end
	end)
end

function LadderMyLogItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_share, handler(slot0, slot0._onClickBtnShare))
	registerButtonEventListener(slot0.btn_watch, handler(slot0, slot0._onClickBtnWatch))
end

function LadderMyLogItem._onClickBtnShare(slot0, slot1, slot2, slot3)
	slot4 = slot2:convertToWorldSpace(cc.p(0, 0))

	if slot0._onShareCallBack and slot0.data then
		slot5 = slot0.data.srv_id

		if slot0.data.type == 1 then
			slot5 = RoleController:getInstance():getRoleVo().srv_id
		end

		slot0._onShareCallBack(slot4, slot0.data.replay_id, slot0.data.name, slot5)
	end
end

function LadderMyLogItem._onClickBtnWatch(slot0)
	if slot0.data and slot0.replay_srv_id then
		slot1 = slot0.replay_srv_id

		if slot0.data.type == 2 then
			slot1 = slot0.data.srv_id
		end

		BattleController:getInstance():csRecordBattle(slot0.data.replay_id, slot1)
	end
end

function LadderMyLogItem.setExtendData(slot0, slot1)
	slot0._onShareCallBack = slot1.callback
	slot0.replay_srv_id = slot1.replay_srv_id
end

function LadderMyLogItem.setData(slot0, slot1)
	slot1 = slot1 or {}
	slot0.data = slot1

	slot0.my_head:setHeadRes(slot1.face, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	slot0.attk_label:setString(slot1.power or 0)
	slot0.name_label:setString(transformNameByServ(slot1.name, slot1.srv_id))
	slot0.time_label:setString(string.sub(TimeTool.getYMDHMS(slot1.time), 3, -1))

	if slot1.type == 1 and slot1.ret == 1 then
		slot0.defend_label:setTextColor(cc.c3b(36, 144, 3))
		slot0.defend_label:setString(TI18N("进攻成功"))
	elseif slot1.type == 1 and slot1.ret == 2 then
		slot0.defend_label:setTextColor(cc.c3b(217, 80, 20))
		slot0.defend_label:setString(TI18N("进攻失败"))
	elseif slot1.type == 2 and slot1.ret == 1 then
		slot0.defend_label:setTextColor(cc.c3b(36, 144, 3))
		slot0.defend_label:setString(TI18N("防守成功"))
	elseif slot1.type == 2 and slot1.ret == 2 then
		slot0.defend_label:setTextColor(cc.c3b(217, 80, 20))
		slot0.defend_label:setString(TI18N("防守失败"))
	end

	if slot1.rank_type == 0 then
		slot0.rank_label:setString(TI18N("排名保持不变"))
	elseif slot1.rank_type == 1 then
		slot0.rank_label:setString(string.format(TI18N("排名升至<div fontcolor=#249003>%d</div>名"), slot1.rank or 0))
	elseif slot1.rank_type == 2 then
		if not slot1.rank or slot1.rank <= 0 then
			slot0.rank_label:setString(TI18N("排名降至<div fontcolor=#D95014>1000名外</div>"))
		else
			slot0.rank_label:setString(string.format(TI18N("排名降至<div fontcolor=#D95014>%d</div>名"), slot1.rank or 0))
		end
	end
end

function LadderMyLogItem.DeleteMe(slot0)
	if slot0.my_head then
		slot0.my_head:DeleteMe()

		slot0.my_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

LadderGodLogItem = class("LadderGodLogItem", function ()
	return ccui.Widget:create()
end)

function LadderGodLogItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function LadderGodLogItem.configUI(slot0)
	slot0.size = cc.size(612, 153)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("ladder/ladder_god_log_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.time_label = slot2:getChildByName("time_label")
	slot0.rank_label_1 = slot2:getChildByName("rank_label_1")
	slot0.name_label_1 = slot2:getChildByName("name_label_1")
	slot0.rank_label_2 = slot2:getChildByName("rank_label_2")
	slot0.name_label_2 = slot2:getChildByName("name_label_2")
	slot0.btn_watch = slot2:getChildByName("btn_watch")
	slot0.role_head_1 = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head_1:setHeadLayerScale(0.8)
	slot0.role_head_1:setPosition(60, 88)
	slot2:addChild(slot0.role_head_1)

	slot0.role_head_2 = PlayerHead.new(PlayerHead.type.circle)

	slot0.role_head_2:setHeadLayerScale(0.8)
	slot0.role_head_2:setPosition(480, 88)
	slot2:addChild(slot0.role_head_2)
	slot0.role_head_1:addCallBack(function ()
		uv0:_onClickRoleHead(1)
	end)
	slot0.role_head_2:addCallBack(function ()
		uv0:_onClickRoleHead(2)
	end)
end

function LadderGodLogItem._onClickRoleHead(slot0, slot1)
	slot2 = RoleController:getInstance():getRoleVo()

	if slot0.data then
		slot3, slot4 = nil

		if slot1 == 1 then
			slot3 = slot0.data.atk_rid
			slot4 = slot0.data.atk_srv_id
		elseif slot1 == 2 then
			slot3 = slot0.data.def_rid
			slot4 = slot0.data.def_srv_id
		end

		if slot3 and slot4 then
			if slot4 == "robot" then
				message(TI18N("神秘人太高冷，不给查看"))
			elseif slot2.rid == slot3 and slot2.srv_id == slot4 then
				message(TI18N("你不认识你自己了么？"))
			else
				ChatController:getInstance():openFriendInfo({
					rid = slot3,
					srv_id = slot4
				}, cc.p(0, 0))
			end
		end
	end
end

function LadderGodLogItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_watch, handler(slot0, slot0._onClickBtnWatch))
end

function LadderGodLogItem._onClickBtnWatch(slot0)
	if slot0.data and slot0.data.replay_id and slot0.data.atk_srv_id then
		BattleController:getInstance():csRecordBattle(slot0.data.replay_id, slot0.data.atk_srv_id)
	end
end

function LadderGodLogItem.setExtendData(slot0, slot1)
	slot0.replay_srv_id = slot1
end

function LadderGodLogItem.setData(slot0, slot1)
	slot1 = slot1 or {}
	slot0.data = slot1

	slot0.time_label:setString(TimeTool.getYMDHMS(slot1.time or 0))
	slot0.role_head_1:setHeadRes(slot1.atk_face, false, LOADTEXT_TYPE, slot1.atk_face_file, slot1.atk_face_update_time)
	slot0.rank_label_1:setString(string.format(TI18N("排名：%d"), slot1.atk_rank or 0))
	slot0.name_label_1:setString(transformNameByServ(slot1.atk_name, slot1.atk_srv_id))
	slot0.role_head_2:setHeadRes(slot1.def_face, false, LOADTEXT_TYPE, slot1.def_face_file, slot1.def_face_update_time)
	slot0.rank_label_2:setString(string.format(TI18N("排名：%d"), slot1.def_rank or 0))
	slot0.name_label_2:setString(transformNameByServ(slot1.def_name, slot1.def_srv_id))

	if slot1.ret == 1 then
		slot0.role_head_1:showBattleResultIcon(1)
		slot0.role_head_2:showBattleResultIcon(0)
	else
		slot0.role_head_1:showBattleResultIcon(0)
		slot0.role_head_2:showBattleResultIcon(1)
	end
end

function LadderGodLogItem.DeleteMe(slot0)
	if slot0.role_head_1 then
		slot0.role_head_1:DeleteMe()

		slot0.role_head_1 = nil
	end

	if slot0.role_head_2 then
		slot0.role_head_2:DeleteMe()

		slot0.role_head_2 = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
