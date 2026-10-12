GuildActionGoalWindow = GuildActionGoalWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = string.format
slot2 = Config.GuildQuestData.data_task_data
slot3 = Config.GuildQuestData.data_lev_data_length
slot4 = Config.GuildQuestData.data_lev_data
slot5 = table.insert

function GuildActionGoalWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.layout_name = "guild/guild_action_goal"
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_scrollview = nil
	slot0.reward_list = {}
	slot0.receve_list = {}
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guild", "guild"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("guildactive", "guildactive"),
			type = ResourcesType.plist
		}
	}
	slot0.my_guild_info = GuildController:getInstance():getModel():getMyGuildInfo()
end

function GuildActionGoalWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")
	slot0.close_btn = slot2:getChildByName("close_btn")

	slot2:getChildByName("win_title"):setString(TI18N("公会活跃"))
	slot2:getChildByName("Text_48_3"):setString(TI18N("升级奖励"))

	slot0.textLv = slot2:getChildByName("textLv")
	slot0.progress = slot2:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.progress_num = slot2:getChildByName("progress_num")
	slot0.goods = slot2:getChildByName("goods")

	slot0.goods:setScrollBarEnabled(false)

	slot0.cur_active = slot2:getChildByName("Image_4"):getChildByName("cur_active")

	if slot0.my_guild_info then
		slot0.cur_active:setString(slot0.my_guild_info.vitality)
	else
		slot0.cur_active:setString(0)
	end

	slot2:getChildByName("Image_3_0"):getChildByName("Text_5"):setString(TI18N("(公会成员每获得一点活跃值便增加一点公会活跃)"))

	slot0.rewardLayer = slot2:getChildByName("rewardLayer")

	slot0.rewardLayer:getChildByName("Text_54"):setString(TI18N("奖励预览"))

	slot0.btn_reward = slot2:getChildByName("btn_reward")

	slot0.btn_reward:getChildByName("Text_54_0"):setString(TI18N("升级并领取"))

	slot0.btn_reward_redpoint = slot0.btn_reward:getChildByName("redpoint")

	slot0.btn_reward_redpoint:setVisible(false)

	slot0.textAllGetReward = slot2:getChildByName("textAllGetReward")
	slot9 = false

	slot0.textAllGetReward:setVisible(slot9)

	slot0.skill_full = {}

	for slot9 = 1, 3 do
		slot0.skill_full[slot9] = slot2:getChildByName("skill_full_" .. slot9)

		slot0.skill_full[slot9]:setVisible(false)
	end

	slot0.goods_list = slot2:getChildByName("goods_list")
	slot6 = slot0.goods_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_list, cc.p(0, 5), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot6.width, slot6.height), {
		start_y = 0,
		item_width = 599,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 74,
		space_y = 0,
		col = 1,
		item_class = GuildActionGoalItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot13 = cc.p(1, 0.5)
	slot0.desc_label = createRichLabel(22, cc.c4b(71, 44, 30, 255), slot13, cc.p(635, 40), nil, nil, 1000)

	slot2:addChild(slot0.desc_label)

	slot0.current_att = {}

	for slot13 = 1, 3 do
		slot0.current_att[slot13] = createRichLabel(22, cc.c4b(71, 44, 30, 255), cc.p(0, 0.5), cc.p(235, ({
			639,
			600,
			561
		})[slot13]), nil, nil, 200)

		slot2:addChild(slot0.current_att[slot13])
	end

	slot0.arrow_list = {}

	for slot13 = 1, 3 do
		slot14 = slot2:getChildByName("arrow_" .. slot13)

		slot14:setVisible(false)

		slot0.arrow_list[slot13] = slot14
	end

	slot0.next_att = {}

	for slot13 = 1, 3 do
		slot0.next_att[slot13] = createRichLabel(22, cc.c4b(36, 144, 3, 255), cc.p(0, 0.5), cc.p(540, slot9[slot13]), nil, nil, 200)

		slot2:addChild(slot0.next_att[slot13])
	end

	slot0.active_icon_btn = slot2:getChildByName("active_icon_btn")
	slot0.active_icon_sp = slot0.active_icon_btn:getChildByName("icon_sp")
end

function GuildActionGoalWindow.reverseTable(slot0, slot1)
	for slot6 = 1, #slot1 do
		slot7 = #slot1
	end

	return {
		[slot6] = table.remove(slot1)
	}
end

function GuildActionGoalWindow.register_event(slot0)
	if slot0.update_goal_basic == nil then
		slot0.update_goal_basic = GlobalEvent:getInstance():Bind(GuildEvent.UpdataGuildGoalBasicData, function (slot0)
			if uv0[slot0.lev].exp <= slot0.exp then
				uv1.btn_reward_redpoint:setVisible(true)
			else
				uv1.btn_reward_redpoint:setVisible(false)
			end

			uv1.textLv:setString("Lv." .. slot0.lev)
			uv1.desc_label:setString(uv2(TI18N("今日已获活跃：<div fontcolor=#249003>%d</div> 本周已获活跃：<div fontcolor=#249003>%d</div>"), slot0.day_exp, slot0.week_exp))

			if uv3 <= slot0.lev + 1 then
				uv1.progress_num:setString(TI18N("已满级"))
				uv1.progress:setPercent(100)
				uv1.textAllGetReward:setVisible(true)
				uv1.textAllGetReward:setString(TI18N("所有奖励已领完"))
				uv1.textAllGetReward:setTextColor(cc.c4b(71, 44, 30, 255))
				uv1.btn_reward:setVisible(false)
				uv1:upGradeReward(uv0[slot0.lev].items)

				slot6 = uv0[slot0.lev].attr

				uv1:upGradeAttr(slot6)

				for slot6 = 1, 3 do
					uv1.skill_full[slot6]:setVisible(true)
					uv1.next_att[slot6]:setVisible(false)
				end
			else
				uv1.progress_num:setString(uv2("%d/%d", slot0.exp, uv0[slot0.lev].exp))
				uv1.progress:setPercent(math.floor(slot0.exp / uv0[slot0.lev].exp * 100))

				if uv0[slot0.lev].exp <= slot0.exp then
					uv1.btn_reward:setVisible(true)
					uv1.textAllGetReward:setVisible(false)
				else
					uv1.btn_reward:setVisible(false)
					uv1.textAllGetReward:setVisible(true)
					uv1.textAllGetReward:setTextColor(Config.ColorData.data_color4[183])
					uv1.textAllGetReward:setString(uv2(TI18N("活跃等级%d级可领"), slot2))
				end

				uv1:upGradeAttr(uv0[slot0.lev].attr, uv0[slot2].attr)
				uv1:upGradeReward(uv0[slot2].items)
			end
		end)
	end

	if slot0.update_task == nil then
		slot0.update_task = GlobalEvent:getInstance():Bind(GuildEvent.UpdataGuildGoalTaskData, function (slot0)
			uv0.receve_list = {}
			slot1 = {}
			slot5 = slot0.list
			slot0.list = uv0:reverseTable(slot5)

			for slot5, slot6 in ipairs(slot0.list) do
				for slot10, slot11 in pairs(uv1) do
					if slot6.id == slot11.id then
						uv2(slot1, slot11)
					end
				end
			end

			uv0.receve_list = slot0.list

			if uv0.item_scrollview then
				uv0.item_scrollview:setData(slot1, nil, nil, slot0.list)
			end
		end)
	end

	if slot0.update_single_task == nil then
		slot0.update_single_task = GlobalEvent:getInstance():Bind(GuildEvent.UpdataGuildGoalSingleTaskData, function (slot0)
			GuildsecretareaController:getInstance():sender26810()

			slot2 = 1

			for slot6, slot7 in pairs(uv0.receve_list) do
				if slot7.id == slot0.list[1].id then
					slot2 = slot6

					break
				end
			end

			if uv0.item_scrollview and uv0.item_scrollview:getItemList() then
				for slot7, slot8 in pairs(slot3) do
					if slot7 == slot2 then
						uv0.receve_list[slot2].finish = slot0.list[1].finish
						uv0.receve_list[slot2].target_val = slot0.list[1].target_val
						uv0.receve_list[slot2].value = slot0.list[1].value

						slot8:changeItemStatus(slot2)
					end
				end
			end
		end)
	end

	slot0:addGlobalEvent(GuildEvent.UpdateActiveIconEvent, function (slot0)
		uv0:updateActiveIconById(slot0)
	end)

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openGuildActionGoalWindow(false)
			end
		end)
	end

	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildActionGoalWindow(false)
		end
	end)

	if slot0.rewardLayer then
		slot0.rewardLayer:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:openGuildRewardWindow(true)
			end
		end)
	end

	if slot0.btn_reward then
		slot0.btn_reward:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:send16904()
			end
		end)
	end

	if slot0.my_guild_info ~= nil and slot0.my_guild_info ~= nil and slot0.update_guild_event == nil then
		slot0.update_guild_event = slot0.my_guild_info:Bind(GuildEvent.UpdateMyInfoEvent, function (slot0, slot1)
			if slot0 == "vitality" and uv0.cur_active then
				uv0.cur_active:setString(slot1)
			end
		end)
	end

	registerButtonEventListener(slot0.active_icon_btn, function ()
		uv0:openGuildActiveIconWindow(true)
	end, true)
end

function GuildActionGoalWindow.openRootWnd(slot0)
	uv0:send16900()
	uv0:send16901()
	GuildsecretareaController:getInstance():sender26810()
	slot0:updateActiveIconById(SysEnv:getInstance():loadGuildActiveIconId())
end

function GuildActionGoalWindow.upGradeReward(slot0, slot1)
	slot7 = cc.size

	slot0.goods:setInnerContainerSize(slot7(math.max(slot0.goods:getContentSize().width, BackPackItem.Width * #slot1 * 0.75 + #slot1 * 10), slot0.goods:getContentSize().height))

	for slot7, slot8 in pairs(slot0.reward_list) do
		slot8:setVisible(false)
	end

	for slot7 = 1, #slot1 do
		if not slot0.reward_list[slot7] then
			slot8 = BackPackItem.new(true, true, nil, 0.75)

			slot8:setAnchorPoint(0, 0.5)
			slot0.goods:addChild(slot8)

			slot0.reward_list[slot7] = slot8
		end

		item = slot0.reward_list[slot7]

		if item then
			item:setVisible(true)
			item:setPosition((slot7 - 1) * (BackPackItem.Width * 0.75 + 10), 45)
			item:setBaseData(slot1[slot7][1], slot1[slot7][2])
			item:setDefaultTip()
		end
	end
end

function GuildActionGoalWindow.upGradeAttr(slot0, slot1, slot2)
	if slot1 then
		for slot6, slot7 in pairs(slot1) do
			slot0.current_att[slot6]:setString(string.format(TI18N("<img src=%s visible=true scale=1 /> %s： %d"), PathTool.getResFrame("common", PathTool.getAttrIconByStr(slot7[1])), Config.AttrData.data_key_to_name[slot7[1]] or "", slot7[2]))
			slot0.arrow_list[slot6]:setVisible(true)
		end
	end

	if slot2 then
		for slot6, slot7 in pairs(slot2) do
			slot0.next_att[slot6]:setString(slot7[2])
		end
	end
end

function GuildActionGoalWindow.updateActiveIconById(slot0, slot1)
	if not slot1 or not slot0.active_icon_sp then
		return
	end

	loadSpriteTexture(slot0.active_icon_sp, PathTool.getResFrame("guildactive", "guildactive_icon_" .. slot1), LOADTEXT_TYPE_PLIST)
end

function GuildActionGoalWindow.close_callback(slot0)
	if slot0.my_guild_info ~= nil then
		if slot0.update_guild_event ~= nil then
			slot0.my_guild_info:UnBind(slot0.update_guild_event)

			slot0.update_guild_event = nil
		end

		slot0.my_guild_info = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.update_goal_basic ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_goal_basic)

		slot0.update_goal_basic = nil
	end

	if slot0.update_task ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_task)

		slot0.update_task = nil
	end

	if slot0.update_single_task ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_single_task)

		slot0.update_single_task = nil
	end

	uv0:openGuildActionGoalWindow(false)
end

GuildActionGoalItem = class("GuildActionGoalItem", function ()
	return ccui.Widget:create()
end)

function GuildActionGoalItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function GuildActionGoalItem.configUI(slot0)
	slot0.size = cc.size(599, 74)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guild/guild_action_goal_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.title_1 = slot0.container:getChildByName("title_1")

	slot0.title_1:getChildByName("Text_5_0"):setString(TI18N("日常"))
	slot0.title_1:setVisible(false)

	slot0.title_2 = slot0.container:getChildByName("title_2")

	slot0.title_2:getChildByName("Text_5"):setString(TI18N("周常"))
	slot0.title_2:setVisible(false)

	slot0.btn_goto = slot0.container:getChildByName("btn_goto")
	slot0.sprite_has = slot0.container:getChildByName("sprite_has")

	slot0.sprite_has:setVisible(false)

	slot0.btn_commit = slot0.container:getChildByName("btn_commit")
	slot5 = false

	slot0.btn_commit:setVisible(slot5)

	slot0.item_desc = {}

	for slot5 = 1, 3 do
		slot0.item_desc[slot5] = slot0.container:getChildByName("desc_" .. slot5)
	end
end

function GuildActionGoalItem.register_event(slot0)
	if slot0.btn_goto then
		slot0.btn_goto:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0.data.show_jump then
					BackpackController:getInstance():gotoItemSources(uv0.data.show_jump, {})
				else
					message(TI18N("该活动未开启"))
				end
			end
		end)
	end

	if slot0.btn_commit then
		slot0.btn_commit:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				GuildController:getInstance():send16903(uv0.data.id)
			end
		end)
	end
end

function GuildActionGoalItem.setExtendData(slot0, slot1)
	slot0.task_data = slot1
end

function GuildActionGoalItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1.desc then
		slot0.item_desc[1]:setString(slot1.desc)
	end

	slot0.title_1:setVisible(slot1.type == 1)
	slot0.title_2:setVisible(slot1.type == 2)

	if slot1.exp then
		slot0.item_desc[3]:setString(slot1.exp)
	end

	slot0:changeItemStatus(slot0.data._index)
end

function GuildActionGoalItem.changeItemStatus(slot0, slot1)
	slot0.btn_goto:setVisible(slot0.task_data[slot1].finish == 0)
	slot0.btn_commit:setVisible(slot0.task_data[slot1].finish == 1)
	slot0.sprite_has:setVisible(slot0.task_data[slot1].finish == 2)
	slot0.item_desc[2]:setString(uv0("(%d/%d)", slot0.task_data[slot1].value, slot0.task_data[slot1].target_val))
end

function GuildActionGoalItem.DeleteMe(slot0)
	slot0:removeAllChildren()
end
