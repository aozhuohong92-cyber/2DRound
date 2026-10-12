GuildwarBattleLogWindow = GuildwarBattleLogWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarBattleLogWindow.__init(slot0)
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
	slot0.layout_name = "guildwar/guildwar_battle_log_window"
	slot0.tab_list = {}
end

function GuildwarBattleLogWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot8 = "战场日志"

	slot1:getChildByName("win_title"):setString(TI18N(slot8))
	slot1:getChildByName("tips_label"):setString(TI18N("本次公会战战况"))

	for slot8 = 1, 2 do
		slot9 = {}

		if slot1:getChildByName("tab_container"):getChildByName("tab_btn_" .. slot8) then
			if slot8 == 1 then
				slot10:getChildByName("title"):setString(TI18N("战场日志"))
			elseif slot8 == 2 then
				slot11:setString(TI18N("我的日志"))
			end

			slot11:setTextColor(cc.c4b(245, 224, 185, 255))

			slot9.tab_btn = slot10
			slot9.label = slot11
			slot9.index = slot8
			slot9.tips = slot10:getChildByName("tips")
			slot0.tab_list[slot8] = slot9
		end
	end

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.confirm_btn = slot1:getChildByName("confirm_btn")
	slot0.log_panel = slot1:getChildByName("log_panel")
	slot0.no_log_label = slot1:getChildByName("no_log_label")
	slot0.no_log_image = slot1:getChildByName("no_log_image")
	slot5 = slot0.log_panel:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.log_panel, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot5.width, slot5.height - 8), {
		start_y = 0,
		item_width = 612,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 163,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GuildwarBattleLogItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function GuildwarBattleLogWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBattleLogWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBattleLogWindow(false)
		end
	end)

	function slot4(slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openBattleLogWindow(false)
		end
	end

	slot0.confirm_btn:addTouchEventListener(slot4)

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
end

function GuildwarBattleLogWindow.changeSelectedTab(slot0, slot1)
	if slot0.tab_object ~= nil and slot0.tab_object.index == slot1 then
		return
	end

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_2023"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c4b(245, 224, 185, 255))

		slot0.tab_object = nil
	end

	slot0.tab_object = slot0.tab_list[slot1]

	if slot0.tab_object then
		slot0.tab_object.tab_btn:loadTextures(PathTool.getResFrame("common", "common_2021"), "", "", LOADTEXT_TYPE_PLIST)
		slot0.tab_object.label:setTextColor(cc.c4b(105, 55, 5, 255))
	end

	if slot0.data and next(slot0.data) ~= nil then
		slot0:refreshLogList()
	end
end

function GuildwarBattleLogWindow.refreshLogList(slot0)
	if slot0.tab_object and slot0.tab_object.index then
		if slot0.data and next(slot0.data) ~= nil then
			slot0.no_log_label:setVisible(false)
			slot0.no_log_image:setVisible(false)
		else
			slot0.no_log_label:setVisible(true)
			slot0.no_log_image:setVisible(true)
		end

		if slot0.tab_object.index == 1 then
			if slot0.all_log_data and next(slot0.all_log_data) ~= nil then
				slot0.item_scrollview:setData(slot0.all_log_data)
			else
				for slot4, slot5 in ipairs(slot0.data) do
					slot6 = false

					for slot10, slot11 in pairs(slot5.int_args) do
						if slot11.key == 5 then
							slot6 = slot11.val == 1

							break
						end
					end

					if slot6 then
						table.insert(slot0.all_log_data, slot5)
					end
				end

				slot0.item_scrollview:setData(slot0.all_log_data)
			end
		elseif slot0.my_log_data and next(slot0.my_log_data) ~= nil then
			slot0.item_scrollview:setData(slot0.my_log_data)
		else
			slot1 = RoleController:getInstance():getRoleVo()

			for slot5, slot6 in ipairs(slot0.data) do
				if slot1.rid == slot6.rid1 and slot1.srv_id == slot6.srv_id1 then
					table.insert(slot0.my_log_data, slot6)
				end
			end

			slot0.item_scrollview:setData(slot0.my_log_data)
		end
	end
end

function GuildwarBattleLogWindow.setData(slot0, slot1)
	slot0.data = slot1
	slot0.all_log_data = {}
	slot0.my_log_data = {}

	slot0:refreshLogList()
end

function GuildwarBattleLogWindow.openRootWnd(slot0, slot1)
	slot0:changeSelectedTab(slot1 or 1)
	uv0:requestBattleLogData()
end

function GuildwarBattleLogWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openBattleLogWindow(false)
end

GuildwarBattleLogItem = class("GuildwarBattleLogItem", function ()
	return ccui.Widget:create()
end)

function GuildwarBattleLogItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function GuildwarBattleLogItem.configUI(slot0)
	slot0.size = cc.size(616, 163)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildwar/guildwar_battle_log_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.top_image = slot2:getChildByName("top_image")
	slot0.flag_image = slot2:getChildByName("flag_image")
	slot0.time_label = slot2:getChildByName("time_label")

	slot0.time_label:setTextColor(cc.c3b(169, 95, 15))
end

function GuildwarBattleLogItem.register_event(slot0)
end

function GuildwarBattleLogItem.setData(slot0, slot1)
	if slot1.flag1 == 1 then
		slot0.top_image:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1025"), LOADTEXT_TYPE_PLIST)
	elseif slot1.flag1 == 0 then
		slot0.top_image:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1026"), LOADTEXT_TYPE_PLIST)
	end

	slot0.flag_image:loadTexture(PathTool.getResFrame("guildwar", "guildwar_1027"), LOADTEXT_TYPE_PLIST)
	slot0.time_label:setString(TimeTool.getYMDHMS(slot1.time))

	slot3 = slot0:getLogSrvName(RoleController:getInstance():getRoleVo().gsrv_id)
	slot4 = slot0:getLogSrvName(slot1.srv_id1)
	slot5 = slot1.name1 or ""
	slot6 = slot2.gname or ""
	slot7 = slot0:getLogSrvName(slot1.srv_id)
	slot8 = slot0:getLogSrvName(slot1.srv_id2)
	slot9 = slot1.name2 or ""
	slot10 = slot1.gname or ""
	slot11 = 0
	slot12 = 0
	slot13 = 0
	slot14 = 0
	slot15 = false
	slot16 = 0

	for slot20, slot21 in pairs(slot1.int_args) do
		if slot21.key == 1 then
			slot11 = slot21.val
		elseif slot21.key == 2 then
			slot12 = slot21.val
		elseif slot21.key == 3 then
			slot13 = slot21.val
		elseif slot21.key == 4 then
			slot14 = slot21.val
		elseif slot21.key == 5 then
			slot15 = slot21.val == 1
		elseif slot21.key == 6 then
			slot16 = slot21.val
		end
	end

	slot17 = PathTool.getResFrame("guildwar", "guildwar_1007")
	slot18 = ""

	if slot11 > 0 then
		for slot22 = 1, slot11 do
			slot18 = slot18 .. string.format("<img src='%s' scale=1 />", slot17)
		end
	end

	slot19 = ""

	if slot1.flag1 == 1 and slot1.flag2 == 2 then
		if slot2.rid == slot1.rid1 and slot2.srv_id == slot1.srv_id1 then
			if slot15 then
				slot19 = string.format(TI18N("      <div fontcolor=#3a78c4>%s</div>挑战<div fontcolor=#d95014>%s%s</div>废墟成功，将公会Buff等级提升至<div fontcolor=#a838bc>%d级</div>。"), slot5, slot8, slot9, slot14)
			else
				slot19 = string.format(TI18N("      很遗憾，<div fontcolor=#3a78c4>%s</div>挑战<div fontcolor=#d95014>%s%s</div>废墟失败，下次将卷土重来！"), slot5, slot8, slot9)
			end
		else
			slot19 = string.format(TI18N("      公会成员<div fontcolor=#3a78c4>%s</div>挑战<div fontcolor=#d95014>%s%s</div>废墟成功，将公会Buff等级提升至<div fontcolor=#a838bc>%d级</div>。"), slot5, slot8, slot9, slot14)
		end
	elseif slot1.flag1 == 1 and slot1.flag2 == 1 then
		if slot2.rid == slot1.rid1 and slot2.srv_id == slot1.srv_id1 then
			if slot15 then
				slot19 = string.format(TI18N("      <div fontcolor=#3a78c4>%s</div>挑战<div fontcolor=#d95014>%s%s</div>据点成功，获得[%s]和<div fontcolor=#249003>战绩%s点</div>，己方公会<div fontcolor=#249003>%s%s</div>当前星数为<img src='%s' scale=1 /><div fontcolor=#a838bc>%d</div>。"), slot5, slot8, slot9, slot18, slot12, slot3, slot6, slot17, slot16)
			else
				slot19 = string.format(TI18N("      很遗憾，<div fontcolor=#3a78c4>%s</div>挑战<div fontcolor=#d95014>%s%s</div>据点失败，下次将卷土重来！"), slot5, slot8, slot9)
			end
		else
			slot19 = string.format(TI18N("      公会成员<div fontcolor=#3a78c4>%s</div>挑战<div fontcolor=#d95014>%s%s</div>据点成功，获得[%s]和<div fontcolor=#249003>战绩%s点</div>，己方公会<div fontcolor=#249003>%s%s</div>当前星数为<img src='%s' scale=1 /><div fontcolor=#a838bc>%d</div>。"), slot5, slot8, slot9, slot18, slot12, slot3, slot6, slot17, slot16)
		end
	elseif slot1.flag1 == 0 and slot1.flag2 == 2 then
		if slot2.rid == slot1.rid1 and slot2.srv_id == slot1.srv_id1 and not slot15 then
			slot19 = string.format(TI18N("      <div fontcolor=#3a78c4>%s</div>的废墟抵挡住了敌方公会成员<div fontcolor=#d95014>%s%s</div>的挑战，固若金汤！"), slot5, slot8, slot9)
		else
			slot19 = string.format(TI18N("      敌方公会成员<div fontcolor=#d95014>%s%s</div>挑战<div fontcolor=#3a78c4>%s%s</div>废墟成功，将公会Buff等级提升至<div fontcolor=#a838bc>%d级</div>。"), slot8, slot9, slot4, slot5, slot14)
		end
	elseif slot1.flag1 == 0 and slot1.flag2 == 1 then
		slot19 = (slot2.rid ~= slot1.rid1 or slot2.srv_id ~= slot1.srv_id1 or slot15 or string.format(TI18N("      <div fontcolor=#3a78c4>%s</div>的据点抵挡住了敌方公会成员<div fontcolor=#d95014>%s%s</div>的挑战，固若金汤！"), slot5, slot8, slot9)) and string.format(TI18N("      敌方公会成员<div fontcolor=#d95014>%s%s</div>挑战<div fontcolor=#3a78c4>%s%s</div>据点成功，获得[%s]和<div fontcolor=#249003>战绩%s点</div>，敌方公会<div fontcolor=#d95014>%s%s</div>当前星数为<img src='%s' scale=1 /><div fontcolor=#a838bc>%d</div>。"), slot8, slot9, slot4, slot5, slot18, slot12, slot7, slot10, slot17, slot13)
	end

	if not slot0.log_text then
		slot0.log_text = createRichLabel(22, cc.c3b(104, 69, 42), cc.p(0, 0.5), cc.p(20, 63), 8, nil, 576)

		slot0.container:addChild(slot0.log_text)
	end

	slot0.log_text:setString(slot19)
end

function GuildwarBattleLogItem.getLogSrvName(slot0, slot1)
	if not slot1 then
		return ""
	end

	slot3 = 1

	if string.find(slot1, "_") then
		slot3 = string.sub(slot1, slot2 + 1)
	end

	return "[s" .. slot3 .. "]"
end

function GuildwarBattleLogItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
