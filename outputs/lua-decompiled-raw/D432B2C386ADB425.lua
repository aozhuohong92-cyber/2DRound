GuildwarBattleListWindow = GuildwarBattleListWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarBattleListWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildwar", "guildwar"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "bigbg_3"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "guildwar/guildwar_against_list_panel"
end

function GuildwarBattleListWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)
	slot1:getChildByName("win_title"):setString(TI18N("战斗列表"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.explain_btn = slot1:getChildByName("explain_btn")

	slot1:getChildByName("title_label_1"):setString(TI18N("本会对阵"))
	slot1:getChildByName("title_label_2"):setString(TI18N("其他对阵"))

	slot0.time_label = slot1:getChildByName("time_label")
	slot0.item_list = slot1:getChildByName("item_list")
	slot0.my_item_bg = slot1:getChildByName("image_3")
	slot0.no_log_image = slot1:getChildByName("no_log_image")
	slot0.no_log_label = slot1:getChildByName("no_log_label")

	slot0.no_log_label:setString(TI18N("暂无其他对阵"))

	slot0.tips_label = slot1:getChildByName("tips_label")

	slot0.time_label:setString(Config.GuildWarData.data_const.time_desc.desc or "")

	slot6 = slot0.item_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.item_list, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot6.width, slot6.height - 8), {
		start_y = 0,
		item_width = 616,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 124,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GuildwarBattleListItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function GuildwarBattleListWindow.setData(slot0, slot1)
	slot1.match_info = slot1.match_info or {}
	slot3 = {}
	slot4 = false

	if GuildController:getInstance():getModel():getMyGuildInfo() then
		for slot8, slot9 in pairs(slot1.match_info) do
			if slot9.g_id1 == slot2.gid and slot9.g_sid1 == slot2.gsrv_id then
				if slot9.g_id2 ~= 0 then
					slot3 = table.remove(slot1.match_info, slot8)
				end

				slot4 = true

				break
			elseif slot9.g_id2 == slot2.gid and slot9.g_sid2 == slot2.gsrv_id then
				if slot9.g_id1 ~= 0 then
					slot3 = table.remove(slot1.match_info, slot8)
				end

				slot4 = true

				break
			end
		end
	end

	slot0.data = {}

	for slot8, slot9 in ipairs(slot1.match_info) do
		if slot9.g_id1 ~= 0 and slot9.g_id2 ~= 0 then
			table.insert(slot0.data, slot9)
		end
	end

	table.sort(slot0.data, function (slot0, slot1)
		if slot0.rank1 == 0 and slot1.rank1 == 0 then
			return false
		elseif slot0.rank1 ~= 0 and slot1.rank1 == 0 then
			return true
		elseif slot0.rank1 == 0 and slot1.rank1 ~= 0 then
			return false
		else
			return slot0.rank1 < slot1.rank1
		end
	end)

	if slot3 and next(slot3) ~= nil then
		slot0.tips_label:setVisible(false)

		if not slot0.my_guildwar_battle_item then
			slot0.my_guildwar_battle_item = GuildwarBattleListItem.new()

			slot0.my_item_bg:addChild(slot0.my_guildwar_battle_item)

			slot6 = slot0.my_item_bg:getContentSize()

			slot0.my_guildwar_battle_item:setPosition(cc.p(slot6.width / 2, slot6.height / 2))
			slot0.my_guildwar_battle_item:setData(slot3)
		end
	else
		slot0.tips_label:setVisible(true)

		if slot4 then
			slot0.tips_label:setString(TI18N("本次公会战轮空"))
		else
			slot0.tips_label:setString(TI18N("由于公会内活跃人数不足，无法参与本次公会战"))
		end
	end

	if slot0.data and next(slot0.data) ~= nil then
		slot0.item_scrollview:setData(slot0.data)
		slot0.no_log_image:setVisible(false)
		slot0.no_log_label:setVisible(false)
	else
		slot0.no_log_image:setVisible(true)
		slot0.no_log_label:setVisible(true)
	end
end

function GuildwarBattleListWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBattleListWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBattleListWindow(false)
		end
	end)
	slot0.explain_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			MainuiController:getInstance():openCommonExplainView(true, Config.GuildWarData.data_explain)
		end
	end)
end

function GuildwarBattleListWindow.openRootWnd(slot0)
	uv0:requestGuildWarBattleList()
end

function GuildwarBattleListWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openBattleListWindow(false)
end

GuildwarBattleListItem = class("GuildwarBattleListItem", function ()
	return ccui.Widget:create()
end)

function GuildwarBattleListItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function GuildwarBattleListItem.configUI(slot0)
	slot0.size = cc.size(616, 124)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildwar/guildwar_against_list_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.state_label = slot2:getChildByName("state_label")
	slot0.gname_label_1 = slot2:getChildByName("gname_label_1")
	slot0.srvname_label_1 = slot2:getChildByName("srvname_label_1")
	slot0.rank_label_1 = slot2:getChildByName("rank_label_1")
	slot0.win_image_1 = slot2:getChildByName("win_image_1")
	slot0.gname_label_2 = slot2:getChildByName("gname_label_2")
	slot0.srvname_label_2 = slot2:getChildByName("srvname_label_2")
	slot0.rank_label_2 = slot2:getChildByName("rank_label_2")
	slot0.win_image_2 = slot2:getChildByName("win_image_2")
end

function GuildwarBattleListItem.register_event(slot0)
end

function GuildwarBattleListItem.setData(slot0, slot1)
	slot1 = slot1 or {}

	slot0.gname_label_1:setString(slot1.guild_name1)

	slot3 = 1

	if string.find(slot1.g_sid1, "_") then
		slot3 = string.sub(slot1.g_sid1, slot2 + 1)
	end

	slot0.srvname_label_1:setString(string.format(TI18N("[S%s] %s"), tostring(slot3), slot1.srv_name1))

	slot5 = ""

	slot0.rank_label_1:setString(string.format(TI18N("服务器排名：%s"), (slot1.rank1 > 0 or TI18N("未上榜")) and tostring(slot1.rank1)))
	slot0.gname_label_2:setString(slot1.guild_name2)

	slot7 = 1

	if string.find(slot1.g_sid2, "_") then
		slot7 = string.sub(slot1.g_sid2, slot6 + 1)
	end

	slot0.srvname_label_2:setString(string.format(TI18N("[S%s] %s"), tostring(slot7), slot1.srv_name2))

	slot9 = ""

	slot0.rank_label_2:setString(string.format(TI18N("服务器排名：%s"), (slot1.rank2 > 0 or TI18N("未上榜")) and tostring(slot1.rank2)))
	slot0.win_image_1:setVisible(false)
	slot0.win_image_2:setVisible(false)

	slot10 = uv0:getGuildWarStatus()

	if slot1.status == TRUE then
		slot0.state_label:setVisible(true)

		if slot1.g_id == 0 then
			slot0.state_label:setString(TI18N("平局"))
			slot0.state_label:setTextColor(GuildwarConst.against_color[3])
		else
			slot0.state_label:setString(TI18N("已结束"))
			slot0.state_label:setTextColor(GuildwarConst.against_color[1])

			if slot1.g_id and slot1.g_id == slot1.g_id1 and slot1.g_sid == slot1.g_sid1 then
				slot0.win_image_1:setVisible(true)
			else
				slot0.win_image_2:setVisible(true)
			end
		end
	elseif slot10 == GuildwarConst.status.processing then
		slot0.state_label:setVisible(true)
		slot0.state_label:setString(TI18N("进行中"))
		slot0.state_label:setTextColor(GuildwarConst.against_color[2])
	else
		slot0.state_label:setVisible(false)
	end
end

function GuildwarBattleListItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
