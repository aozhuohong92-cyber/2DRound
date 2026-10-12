ActionSevenRankWindow = ActionSevenRankWindow or BaseClass(BaseView)
slot0 = string.format
slot1 = ActionController:getInstance()
slot2 = ActionController:getInstance():getModel()
slot3 = string.find

function ActionSevenRankWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "action/action_seven_rank_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_bg"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfare", "welfare"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfare_rank", "welfare_rank"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("welfaretab", "welfaretab"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_list = {}
	slot0.cur_select = nil
	slot0.cur_index = nil
	slot0.rank_list = {}
	slot0.top_3_list = {}
end

function ActionSevenRankWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/welfare", "welfare_bg"), LOADTEXT_TYPE)
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.tab_container = slot0.main_container:getChildByName("tab_container")
	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot4 = "top_3_view"
	slot0.top_3_view = slot0.container:getChildByName(slot4)
	slot0.top_3_y = slot0.top_3_view:getPositionY()

	for slot4 = 1, 3 do
		if slot0.top_3_view:getChildByName(uv0("no%s_con", slot4)) then
			slot7 = slot5:getChildByName("srcoll_con")

			slot5:getChildByName("name"):setTextColor(cc.c4b(250, 246, 255, 255))
			slot5:getChildByName("rank_icon_0"):setVisible(false)

			slot9, slot10 = nil

			if slot4 == 1 then
				slot9 = createImage(slot5, nil, slot5:getContentSize().width / 2 + 40, 130, cc.p(0.5, 0.5), false, 1, false)

				slot9:setScale(0.9)
				slot9:setTouchEnabled(true)

				slot10 = slot5:getChildByName("crown")

				slot10:setPositionY(105)
				slot10:setLocalZOrder(20)
				slot10:setVisible(false)
				slot5:getChildByName("title_img"):setVisible(false)
				slot7:setPositionY(slot7:getPositionY())
			end

			slot13 = CommonScrollViewLayout.new(slot7, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot7:getContentSize(), {
				start_y = 14,
				start_x = 10,
				space_x = 16,
				row = 1,
				space_y = 0,
				col = 1,
				scale = 0.7,
				item_class = BackPackItem,
				item_width = BackPackItem.Width * 0.7,
				item_height = BackPackItem.Height * 0.7
			})
			slot14 = PlayerHead.new(PlayerHead.type.circle)

			slot14:setAnchorPoint(0.5, 0.5)
			slot14:setScale(0.8)

			if slot4 == 1 then
				slot14:setPosition(595, 65)
			else
				slot14:setPosition(595, 69)
			end

			slot5:addChild(slot14)

			slot15 = {
				name = slot6,
				honor = slot9,
				crown = slot10,
				item_scroll = slot13,
				head = slot14,
				data = {}
			}

			slot15.head:setVisible(false)
			slot15.name:setVisible(false)

			slot0.top_3_list[slot4] = slot15
		end
	end

	slot0.desc_con = slot0.container:getChildByName("desc_con")
	slot0.goto_btn = slot0.desc_con:getChildByName("goto_btn")

	slot0.goto_btn:setTitleText(TI18N("前往"))

	slot0.goto_btn.label = slot0.goto_btn:getTitleRenderer()

	if slot0.goto_btn.label ~= nil then
		slot0.goto_btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
	end

	slot0.uplev_btn = slot0.desc_con:getChildByName("uplev_btn")
	slot0.rank_name = slot0.desc_con:getChildByName("rank_name")
	slot0.desc = createRichLabel(22, 1, cc.p(0, 1), cc.p(15, 550), 0, 0, 180)

	slot0.desc_con:addChild(slot0.desc)

	slot0.tips_button = slot0.desc_con:getChildByName("tips_button")

	slot0.container:getChildByName("rank_title"):setString(TI18N("排名"))
	slot0.container:getChildByName("reward_title"):setString(TI18N("奖励"))
	slot0.container:getChildByName("name_title"):setString(TI18N("玩家姓名"))
	slot0.desc_con:getChildByName("my_rank_title"):setString(TI18N("我的排名："))

	slot0.my_rank = slot0.desc_con:getChildByName("my_rank")
	slot0.rank_time_title = slot0.desc_con:getChildByName("rank_time_title")

	slot0.rank_time_title:setString(TI18N("结算时间："))
	slot0.rank_time_title:setVisible(false)

	slot0.rank_time = slot0.desc_con:getChildByName("rank_time")
	slot0.detail_btn = slot0.container:getChildByName("detail_btn")

	slot0.detail_btn:setTitleText(TI18N("详细排行"))

	slot0.detail_btn.label = slot0.detail_btn:getTitleRenderer()

	if slot0.detail_btn.label ~= nil then
		slot0.detail_btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.scroll_con = slot0.container:getChildByName("scroll_con")
	slot5 = slot0.scroll_con:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.scroll_con, cc.p(0, slot5.height), ScrollViewDir.vertical, ScrollViewStartPos.top, slot5, {
		start_y = 0,
		start_x = 0,
		space_x = 2,
		row = 0,
		space_y = 0,
		col = 1,
		item_class = ActionSevenRankItem,
		item_width = ActionSevenRankItem.Width,
		item_height = ActionSevenRankItem.Height
	}, cc.p(0, 1))
	slot0.tab_scroll = createScrollView(slot0.tab_container:getContentSize().width, slot0.tab_container:getContentSize().height, 0, 0, slot0.tab_container, ccui.ScrollViewDir.horizontal)
end

function ActionSevenRankWindow.openRootWnd(slot0, slot1)
	uv0:sender22700(0)

	slot0.index = slot1 or 1
end

function ActionSevenRankWindow.createTabBtn(slot0, slot1)
	slot7 = (ActionSevenRankTab.Width + 10) * 12
	slot8 = slot0.tab_scroll:getContentSize().height

	slot0.tab_scroll:setInnerContainerSize(cc.size(slot7, slot8))

	slot2 = {}

	for slot7, slot8 in pairs(uv0:getModel():getCrossServerRankListData(0)) do
		slot8[1].status = 1

		for slot12, slot13 in pairs(slot1) do
			if slot13.id == slot8[1].id then
				slot8[1].end_time = slot13.end_time

				if slot13.end_time - GameNet:getInstance():getTime() > 0 then
					slot8[1].status = 0
				elseif slot14 <= 0 then
					slot8[1].status = 2
				end
			end
		end

		if slot8[1].status ~= 2 then
			table.insert(slot2, slot8[1])
		end
	end

	table.sort(slot2, SortTools.tableLowerSorter({
		"status",
		"id"
	}))

	slot9 = (ActionSevenRankTab.Width + 10) * #slot2

	slot0.tab_scroll:setInnerContainerSize(cc.size(slot9, slot0.tab_scroll:getContentSize().height))

	slot0.index = slot2[1].id
	slot4 = slot2[1].status

	for slot8, slot9 in pairs(slot2) do
		if slot0.tab_list[slot9.id] == nil then
			slot10 = ActionSevenRankTab.new()

			slot10:setPosition(10 + (ActionSevenRankTab.Width + 10) * (slot8 - 1), 2)
			slot0.tab_scroll:addChild(slot10)

			slot0.tab_list[slot9.id] = slot10

			slot0.tab_list[slot9.id]:addCallBack(function (slot0)
				uv0:selectByTab(slot0:getIndex(), slot0.status)
			end)
		end

		if slot0.index ~= slot9.id then
			slot0.tab_list[slot9.id]:setRedPointStatus(slot0:checkHaveFinishTask(slot9.id))
		end

		slot0.tab_list[slot9.id]:setData(slot9)
		slot0.tab_list[slot9.id]:setIsTouch(slot9.status ~= 1)
	end

	slot0:selectByTab(slot0.index, slot4)
end

function ActionSevenRankWindow.selectByTab(slot0, slot1, slot2)
	if slot0.cur_index == slot1 then
		return
	end

	slot0.cur_index = slot1

	if slot0.cur_select ~= nil then
		slot0.cur_select:setSelect(false)
	end

	slot0.cur_select = slot0.tab_list[slot1]

	slot0.cur_select:setSelect(true)
	slot0.desc:setString(Config.DaysRankData.data_rank_list[slot1][1].tips_rule)
	slot0.rank_name:setString(Config.DaysRankData.data_rank_list[slot1][1].name)
	slot0.tips_button:setPositionX(slot0.rank_name:getPositionX() + slot0.rank_name:getContentSize().width + 10)
	slot0:setLessTime(0)

	if slot2 == 1 then
		slot0.rank_time:setString(TI18N("暂未开启"))
	end

	slot0.my_rank:setString(TI18N(""))
	slot0:setTop3BaseInfo()
	slot0:fileSevenRankInfo()
	uv0:sender22701(slot0.cur_index)
end

function ActionSevenRankWindow.fileSevenRankInfo(slot0)
	if slot0.cur_index == nil then
		return
	end

	slot1 = {}
	slot2 = false

	if deepCopy(Config.DaysRankData.data_rank_quest[slot0.cur_index]) then
		for slot7, slot8 in ipairs(slot3) do
			if uv0:getSevenQuestByID(slot8.id) and slot9.finish ~= TaskConst.task_status.completed then
				slot8.is_quest = true

				table.insert(slot1, slot8)

				if slot9.finish == TaskConst.task_status.finish then
					slot2 = true
				end
			end
		end
	end

	if slot0.tab_list[slot0.cur_index] then
		slot0.tab_list[slot0.cur_index]:setRedPointStatus(slot2)
	end

	for slot8, slot9 in pairs(deepCopy(Config.DaysRankData.data_rank_data[slot0.cur_index])) do
		if slot9.high > 3 then
			slot9.is_quest = false

			table.insert(slot1, slot9)
		end
	end

	slot0.item_scrollview:setData(slot1)
end

function ActionSevenRankWindow.checkHaveFinishTask(slot0, slot1)
	if Config.DaysRankData.data_rank_quest[slot1] then
		for slot6, slot7 in ipairs(slot2) do
			if uv0:getSevenQuestByID(slot7.id) and slot8.finish == TaskConst.task_status.finish then
				return true
			end
		end
	end

	return false
end

function ActionSevenRankWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openSevenRankWin(false)
			end
		end)
	end

	slot0.uplev_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
		end
	end)
	slot0.detail_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.rank_list[uv0.cur_index] and next(uv0.rank_list[uv0.cur_index]) ~= nil then
				RankController:getInstance():openRankView(true, Config.DaysRankData.data_rank_list[uv0.cur_index][1].jump)
			else
				message(TI18N("该排行榜暂无数据"))
			end
		end
	end)

	if slot0.tips_button then
		slot0.tips_button:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if Config.DaysRankData.data_rank_list[uv0.cur_index] then
					TipsManager:getInstance():showCommonTips(Config.DaysRankData.data_rank_list[uv0.cur_index][1].tips_str, slot0:getTouchBeganPosition())
				end
			end
		end)
	end

	function slot4(slot0, slot1)
		if slot1 == ccui.TouchEventType.ended and Config.DaysRankData.data_rank_list[uv0.cur_index] and slot2[1] then
			BackpackController:getInstance():gotoItemSources(slot2[1].evt_type, slot2[1].extend)
		end
	end

	slot0.goto_btn:addTouchEventListener(slot4)

	for slot4, slot5 in pairs(slot0.top_3_list) do
		if slot5.honor then
			slot5.honor:addTouchEventListener(function (slot0, slot1)
				if slot1 == ccui.TouchEventType.ended then
					playButtonSound2()

					if uv0.cur_index then
						TipsManager:getInstance():showFaceTips(3, Config.HonorData.data_title[Config.DaysRankData.data_rank_data_const["rank_title" .. uv0.cur_index].val], cc.p(465, 788))
					end
				end
			end)
		end

		if slot5.head then
			slot5.head:addCallBack(function ()
				if uv0.data then
					FriendController:getInstance():openFriendCheckPanel(true, uv0.data)
				end
			end)
		end
	end

	if not slot0.update_tab then
		slot0.update_tab = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_RANK_LIST, function (slot0)
			uv0:createTabBtn(slot0.rank_list)
		end)
	end

	if not slot0.update_single_rank then
		slot0.update_single_rank = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVEN_RANK_DATA, function (slot0)
			uv0.rank_list[uv0.cur_index] = slot0.rank_list

			if slot0.rank ~= 0 then
				uv0.my_rank:setString(slot0.rank)
			else
				uv0.my_rank:setString(TI18N("未上榜"))
			end

			uv0.rank_time:setString(string.format(TI18N("%s"), TimeTool.GetTimeFormat(slot0.end_time - GameNet:getInstance():getTime())))
			uv0:setLessTime(slot0.end_time - GameNet:getInstance():getTime())
			uv0:updateTop3Info(slot0.rank_list)
		end)
	end

	if not slot0.update_quest_event then
		slot0.update_quest_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_SEVENT_QUEST, function ()
			uv0:fileSevenRankInfo()
		end)
	end
end

function ActionSevenRankWindow.updateTop3Info(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot5, slot6 in ipairs(slot0.top_3_list) do
		slot7 = slot1[slot5]
		slot6.data = slot7

		if slot7 then
			slot6.name:setString(slot7.name)

			if slot5 == 1 then
				slot6.name:setPositionY(15)
				slot6.name:setPositionX(590)
			else
				slot6.name:setPositionY(20)
				slot6.name:setPositionX(590)
			end

			slot6.head:setVisible(true)
			slot6.head:setHeadRes(slot7.face_id, false, LOADTEXT_TYPE, slot7.face_file, slot7.face_update_time)

			if slot6.crown then
				slot6.crown:setVisible(true)
			end
		else
			slot6.head:setVisible(false)

			if slot6.crown then
				slot6.crown:setVisible(false)
			end

			slot6.name:setString(TI18N("虚位以待"))
			slot6.name:setPositionY(55)
			slot6.name:setPositionX(590)
		end
	end
end

function ActionSevenRankWindow.setTop3BaseInfo(slot0)
	for slot4, slot5 in ipairs(slot0.top_3_list) do
		if slot5.head then
			slot5.head:setVisible(false)
		end

		if slot5.crown then
			slot5.crown:setVisible(false)
		end

		if slot5.honor then
			slot5.honor:setVisible(false)
		end

		if slot5.name then
			slot5.name:setVisible(true)
			slot5.name:setString(TI18N("虚位以待"))
			slot5.name:setPositionY(55)
			slot5.name:setPositionX(590)
		end
	end

	if slot0.res_id ~= PathTool.getTargetRes("honor", "txt_cn_honor_" .. Config.HonorData.data_title[Config.DaysRankData.data_rank_data_const["rank_title" .. slot0.cur_index].val].res_id, false, false) then
		slot0.res_id = slot3
		slot0.item_load = createResourcesLoad(slot3, ResourcesType.single, function ()
			if not tolua.isnull(uv0.top_3_list[1].honor) then
				slot0.honor:loadTexture(uv1, LOADTEXT_TYPE)
				slot0.honor:setVisible(false)
			end
		end, slot0.item_load)
	end

	for slot7, slot8 in ipairs(slot0.top_3_list) do
		if Config.DaysRankData.data_rank_data[slot0.cur_index] then
			slot11 = {}
			slot12 = {}

			if slot9[slot7] then
				if slot10.effect_list then
					for slot16, slot17 in ipairs(slot10.effect_list) do
						if not slot12[slot17] then
							slot12[slot17] = {
								effect_id = slot17
							}
						end
					end
				end

				for slot16, slot17 in pairs(slot10.rewards) do
					slot18 = deepCopy(Config.ItemData.data_get_data(slot17[1]))
					slot18.show_effect = slot12[slot17[1]]
					slot18.quantity = slot17[2]

					table.insert(slot11, slot18)
				end

				if slot8.item_scroll then
					slot8.item_scroll:setData(slot11)
					slot8.item_scroll:addEndCallBack(function ()
						for slot4, slot5 in pairs(uv0.item_scroll:getItemList()) do
							slot5:showItemEffect(false)
							slot5:setDefaultTip()

							if slot5.data.show_effect then
								if slot5.data.quality >= 4 then
									slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 0.8)
								else
									slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 0.8)
								end
							else
								slot5:showItemEffect(false)
							end
						end
					end)
				end
			end
		end
	end
end

function ActionSevenRankWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.rank_time) then
		return
	end

	slot0.rank_time:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.rank_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.rank_time:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionSevenRankWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.rank_time:setString(string.format(TI18N("%s"), TimeTool.GetTimeFormat(slot1)))
		slot0.rank_time_title:setVisible(true)
	else
		slot0.rank_time:setString("")
		slot0.rank_time_title:setVisible(false)
	end
end

function ActionSevenRankWindow.close_callback(slot0)
	if slot0.update_tab ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_tab)

		slot0.update_tab = nil
	end

	if slot0.update_single_rank ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_single_rank)

		slot0.update_single_rank = nil
	end

	if slot0.update_quest_event then
		GlobalEvent:getInstance():UnBind(slot0.update_quest_event)

		slot0.update_quest_event = nil
	end

	for slot4, slot5 in pairs(slot0.top_3_list) do
		if slot5.head then
			slot5.head:DeleteMe()
		end

		if slot5.item_scroll then
			slot5.item_scroll:DeleteMe()
		end
	end

	slot0.top_3_list = nil

	if slot0.tab_list ~= nil then
		for slot4, slot5 in pairs(slot0.tab_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.goods_scrollview then
		slot0.goods_scrollview:DeleteMe()

		slot0.goods_scrollview = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	uv0:openSevenRankWin(false)
end

ActionSevenRankTab = class("ActionSevenRankTab", function ()
	return ccui.Widget:create()
end)
ActionSevenRankTab.Width = 123
ActionSevenRankTab.Height = 130

function ActionSevenRankTab.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionSevenRankTab.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_seven_rank_tab"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(ActionSevenRankTab.Width, ActionSevenRankTab.Height))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setScale(0.9)
	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.icon = slot0.main_container:getChildByName("icon")

	slot0.icon:setScale(0.8)

	slot0.name = slot0.main_container:getChildByName("name")
	slot0.stage = slot0.main_container:getChildByName("stage")
	slot0.status_bg = slot0.main_container:getChildByName("status_bg")
	slot0.select = slot0.main_container:getChildByName("select")

	slot0.select:setPositionY(slot0.select:getPositionY() - 10)

	slot0.arrow = slot0.root_wnd:getChildByName("arrow")

	slot0.arrow:setVisible(false)

	slot0.day = slot0.main_container:getChildByName("day")
end

function ActionSevenRankTab.register_event(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function ActionSevenRankTab.setData(slot0, slot1)
	slot0.index = slot1.id

	if slot1.id >= 15 then
		slot2 = slot2 - 7
	end

	slot0.day:setString(TI18N("第") .. slot2 .. TI18N("天"))
	slot0.name:setString(slot1.name)

	slot0.status = slot1.status
	slot3 = PathTool.getResFrame("welfare_rank", "txt_cn_welfare_rank_bg2")

	if slot1.status == 1 then
		slot3 = PathTool.getResFrame("welfare_rank", "txt_cn_welfare_rank_bg3")
	elseif slot1.status == 0 then
		slot3 = PathTool.getResFrame("welfare_rank", "txt_cn_welfare_rank_bg2")
	elseif slot1.status == 2 then
		slot3 = PathTool.getResFrame("welfare_rank", "txt_cn_welfare_rank_bg8")
	end

	slot0.status_bg:loadTexture(slot3, LOADTEXT_TYPE_PLIST)
	slot0.select:setVisible(false)

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("welfare/action_icon", "welfare_icon_" .. (slot1.ico or 1), false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.icon) then
				loadSpriteTexture(uv0.icon, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end
end

function ActionSevenRankTab.setSelect(slot0, slot1)
	if slot1 then
		slot0.select:setVisible(true)
		loadSpriteTexture(slot0.select, PathTool.getResFrame("welfaretab", "welfaretab_1"), LOADTEXT_TYPE_PLIST)
	else
		slot0.select:setVisible(false)
	end
end

function ActionSevenRankTab.getIndex(slot0)
	return slot0.index
end

function ActionSevenRankTab.setIsTouch(slot0, slot1)
	slot0.is_touch = slot1
end

function ActionSevenRankTab.setRedPointStatus(slot0, slot1)
	addRedPointToNodeByStatus(slot0, slot1)
end

function ActionSevenRankTab.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function ActionSevenRankTab.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end

ActionSevenRankItem = class("ActionSevenRankItem", function ()
	return ccui.Widget:create()
end)
ActionSevenRankItem.Width = 686
ActionSevenRankItem.Height = 124

function ActionSevenRankItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionSevenRankItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_seven_rank_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(ActionSevenRankItem.Width, ActionSevenRankItem.Height))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.rank_num = slot0.main_container:getChildByName("rank_num")
	slot0.rank_icon = slot0.main_container:getChildByName("rank_icon")

	slot0.main_container:getChildByName("rank_icon_0"):setVisible(false)

	slot0.quest_icon = slot0.main_container:getChildByName("quest_icon")
	slot0.desc_value = slot0.main_container:getChildByName("desc_value")
	slot0.get_btn = slot0.main_container:getChildByName("get_btn")
	slot0.get_btn_label = slot0.get_btn:getChildByName("label")

	slot0.get_btn_label:setString(TI18N("领取"))

	slot0.srcoll_con = slot0.main_container:getChildByName("srcoll_con")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.srcoll_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.srcoll_con:getContentSize(), {
		start_y = 9,
		start_x = 10,
		space_x = 16,
		row = 1,
		space_y = 0,
		col = 1,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionSevenRankItem.register_event(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
	slot0.get_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended and uv0.data then
			uv1:requestSubmitTask(uv0.data.id)
		end
	end)
end

function ActionSevenRankItem.setData(slot0, slot1)
	if slot1 then
		slot0.data = slot1

		if not slot1.is_quest then
			slot0.rank_num:setString(TI18N("第") .. slot1.low .. "~" .. slot1.high .. TI18N("名"))
			slot0.rank_num:setPositionY(62)
			slot0.rank_num:setPositionX(70)
			slot0.desc_value:setVisible(false)
			slot0.get_btn:setVisible(false)
			slot0.quest_icon:setVisible(false)
		else
			slot0.rank_num:setString(slot1.desc)
			slot0.rank_num:setPositionY(82)
			slot0.rank_num:setPositionX(70)
			slot0.desc_value:setVisible(true)
			slot0.get_btn:setVisible(true)
			slot0.quest_icon:setVisible(true)

			if uv0:getSevenQuestByID(slot1.id) then
				if slot2.finish == TaskConst.task_status.un_finish then
					setChildUnEnabled(true, slot0.get_btn)
					slot0.get_btn_label:disableEffect()
					slot0.get_btn:setTouchEnabled(false)
					slot0.get_btn_label:setString(TI18N("未达成"))
				elseif slot2.finish == TaskConst.task_status.finish then
					setChildUnEnabled(false, slot0.get_btn)
					slot0.get_btn_label:enableOutline(Config.ColorData.data_color4[177])
					slot0.get_btn:setTouchEnabled(true)
					slot0.get_btn_label:setString(TI18N("领取"))
				end

				if slot2.progress and slot3[1] then
					slot0.desc_value:setString(uv1(slot1.target_desc, slot4.value))
				end
			end
		end

		slot2 = {}

		if slot1.effect_list then
			for slot6, slot7 in ipairs(slot1.effect_list) do
				if not slot2[slot7] then
					slot2[slot7] = {
						effect_id = slot7
					}
				end
			end
		end

		slot3 = {}

		for slot7, slot8 in pairs(slot1.rewards) do
			table.insert(slot3, deepCopy(Config.ItemData.data_get_data(slot8[1])))
		end

		slot0.item_scrollview:setData(slot3)
		slot0.item_scrollview:addEndCallBack(function ()
			for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
				slot5:setDefaultTip()
				slot5:showItemEffect(false)

				if slot5.data and slot5.data.show_effect then
					if slot5.data.quality >= 4 then
						slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 0.8)
					else
						slot5:showItemEffect(true, 263, PlayerAction.action_2, true, 0.8)
					end
				else
					slot5:showItemEffect(false)
				end
			end
		end)
	end
end

function ActionSevenRankItem.suspendAllActions(slot0)
end

function ActionSevenRankItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
