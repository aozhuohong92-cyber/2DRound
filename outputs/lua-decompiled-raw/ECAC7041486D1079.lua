ActionLimitBossPanel = class("ActionLimitBossPanel", function ()
	return ccui.Widget:create()
end)
slot0 = string.format

function ActionLimitBossPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.can_get = 0
	slot0.item_list = {}
	slot0.chapter_list = {}
	slot0.page_num = 5
	slot0.page_max = 2
	slot0.max_id = 10

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitBossPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_boss_panel"))

	slot0.root_wnd:setPosition(-40, -120)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot1:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot0.power_title = slot1:getChildByName("power_title")

	slot0.power_title:setString(TI18N("最低通关战力:"))
	slot1:getChildByName("get_title"):setString(TI18N([[
通
关
奖
励]]))

	slot0.recommend_power_title = slot1:getChildByName("recommend_power_title")

	slot0.recommend_power_title:setString(TI18N("通关推荐战力:"))

	slot0.background = slot1:getChildByName("background")
	slot0.resources_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_48", true), ResourcesType.single, function ()
		loadSpriteTexture(uv0.background, PathTool.getPlistImgForDownLoad("bigbg", "bigbg_48", true), LOADTEXT_TYPE)
	end, nil, true)
	slot0.vedio_btn = slot1:getChildByName("vedio_btn")

	slot0.vedio_btn:getChildByName("label"):setString(TI18N("通关录像"))

	slot0.time_val = slot1:getChildByName("time_val")
	slot0.power_value = slot1:getChildByName("power_value")
	slot0.recommend_power_value = slot1:getChildByName("recommend_power_value")
	slot0.chapter = slot1:getChildByName("chapter")
	slot0.challenge_btn = slot1:getChildByName("challenge_btn")
	slot0.challenge_btn_label = slot0.challenge_btn:getChildByName("label")

	slot0.challenge_btn_label:setString(TI18N("挑战"))

	slot0.pass_icon = slot1:getChildByName("pass_icon")

	slot0.pass_icon:setLocalZOrder(10)

	slot0.bubble_container = slot1:getChildByName("bubble_container")

	slot0.bubble_container:setLocalZOrder(10)

	slot0.bubble_desc = createRichLabel(18, 175, cc.p(0, 1), cc.p(7, 75), nil, , 188)

	slot0.bubble_container:addChild(slot0.bubble_desc)

	slot0.progress = slot1:getChildByName("progress_container"):getChildByName("progress")
	slot6 = true

	slot0.progress:setScale9Enabled(slot6)

	for slot6 = 1, 5 do
		if slot1:getChildByName("chapter_" .. slot6) then
			slot11 = BackPackItem.new(false, true, false, 0.8, false, false)

			slot11:setPosition(slot7:getPositionX(), 848)
			slot11:addBtnCallBack(function (slot0)
				uv0:selectedChapterItem(uv1)
			end)
			slot1:addChild(slot11)

			slot0.chapter_list[slot6] = {
				label = slot7:getChildByName("label"),
				normal = slot7:getChildByName("normal"),
				select = slot7:getChildByName("select"),
				item = slot11,
				chapter_index = slot6,
				chapter_id = slot6
			}
		end
	end

	slot0.left_btn = slot1:getChildByName("left_btn")
	slot0.right_btn = slot1:getChildByName("right_btn")
	slot0.main_container = slot1
end

function ActionLimitBossPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
			end
		end)
	end

	slot0.challenge_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.selected_object == nil then
				return
			end

			uv0.ctrl:cs16604(uv0.holiday_bid, uv0.selected_object.chapter_id, 0)
		end
	end)
	slot0.vedio_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			if uv0.replay_id == nil or uv0.replay_id == 0 then
				message(TI18N("还没人能通过本关哦，会是你吗"))
			else
				playButtonSound2()
				BattleController:getInstance():csRecordBattle(uv0.replay_id or 0)
			end
		end
	end)
	slot0.left_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.cur_page and uv0.cur_page <= 1 then
				return
			end

			uv0:changeCurPage(uv0.cur_page - 1)
		end
	end)
	slot0.right_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.cur_page and uv0.page_max <= uv0.cur_page then
				return
			end

			uv0:changeCurPage(uv0.cur_page + 1)
		end
	end)
end

function ActionLimitBossPanel.changeCurPage(slot0, slot1, slot2)
	if slot0.cur_page and slot0.cur_page == slot1 and slot2 == nil then
		return
	end

	slot0.cur_page = slot1

	setChildUnEnabled(slot1 == 1, slot0.left_btn)
	setChildUnEnabled(slot1 == slot0.page_max, slot0.right_btn)
	slot0.left_btn:setTouchEnabled(slot1 ~= 1)
	slot0.right_btn:setTouchEnabled(slot1 ~= slot0.page_max)
	slot0:updatePageChapterTab()

	slot0.chapter_id = nil

	slot0:selectedChapterItem(slot2 or 1)
end

function ActionLimitBossPanel.updatePageChapterTab(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = (slot0.cur_page - 1) * slot0.page_num + 1
	slot6 = math.min(slot0.data.finish - slot1 + 1) * 100 / slot0.page_num

	slot0.progress:setPercent(slot6)

	for slot6 = slot1, math.min(slot0.cur_page * slot0.page_num, slot0.max_id) do
		if slot0.chapter_list[(slot6 - 1) % slot0.page_num + 1] then
			slot8.chapter_id = slot6

			if slot8.label then
				slot8.label:setString(uv0(TI18N("第%s关"), slot6))
			end

			slot9 = slot0.data.aim_list[slot6]

			if slot8.item and slot9 then
				slot8.item:setBaseData((keyfind("aim_args_key", ActionExtType.BossIcon, slot9.aim_args) or {}).aim_args_val or 0)
				slot8.item:setExtendDesc(true, nil, 1, 2)
			end
		end
	end
end

function ActionLimitBossPanel.selectedChapterItem(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.chapter_list[slot1] == nil or slot2.item == nil then
		return
	end

	if slot0.selected_object and slot0.chapter_id == slot2.chapter_id then
		return
	end

	if slot0.selected_object then
		if slot0.selected_object.item then
			slot0.selected_object.item:setSelected(false)
		end

		slot0.selected_object.label:setTextColor(Config.ColorData.data_color4[175])
		slot0.selected_object.normal:setVisible(true)
		slot0.selected_object.select:setVisible(false)
	end

	slot0.chapter_id = slot3
	slot0.selected_object = slot2

	if slot0.selected_object.item then
		slot0.selected_object.item:setSelected(true)
	end

	slot0.selected_object.label:setTextColor(cc.c4b(7, 71, 121, 255))
	slot0.selected_object.normal:setVisible(false)
	slot0.selected_object.select:setVisible(true)
	slot0.chapter:setString(uv0(TI18N("第%s关"), slot3))

	if slot0.data == nil then
		return
	end

	if slot0.data.aim_list[slot3] == nil then
		return
	end

	slot7 = keyfind("aim_args_key", ActionExtType.BossRecommendPower, slot4.aim_args) or {}
	slot8 = keyfind("aim_args_key", ActionExtType.BossReplayId, slot4.aim_args) or {}

	slot0:createMonsterModel((keyfind("aim_args_key", ActionExtType.BossId, slot4.aim_args) or {}).aim_args_val)
	slot0:createItemList(slot4.item_list)

	if (keyfind("aim_args_key", ActionExtType.BossMinPower, slot4.aim_args) or {}).aim_args_val == 0 then
		slot0.power_value:setString(TI18N("暂无"))
	else
		slot0.power_value:setString(slot6.aim_args_val)
	end

	slot0.recommend_power_value:setString(slot7.aim_args_val)

	slot0.replay_id = slot8.aim_args_val

	slot0.bubble_desc:setString(slot4.aim_str)

	if slot4.status == 2 then
		slot0.pass_icon:setVisible(true)
		slot0.challenge_btn_label:disableEffect()
		slot0.challenge_btn:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.challenge_btn)
	else
		slot0.pass_icon:setVisible(false)
		slot0.challenge_btn_label:enableOutline(Config.ColorData.data_color4[183])
		setChildUnEnabled(false, slot0.challenge_btn)
		slot0.challenge_btn:setTouchEnabled(true)
	end
end

function ActionLimitBossPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)

	if slot1 == true and slot0.data == nil then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
		slot0:changeCurPage(1)

		slot0.last_ui_fight_type = MainuiController:getInstance():getUIFightType()

		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.LimitBoss)
	end
end

function ActionLimitBossPanel.setData(slot0, slot1)
	if slot0.data == nil then
		slot0.max_id = #slot1.aim_list
		slot0.page_max = math.ceil(slot0.max_id / slot0.page_num)
	end

	slot0.data = slot1

	slot0.time_val:setString(TimeTool.GetTimeFormatDayII(slot1.remain_sec or 0))

	slot2 = math.min(slot1.finish + 1, slot0.max_id)

	slot0:changeCurPage(math.ceil(slot2 / slot0.page_num), (slot2 - 1) % slot0.page_num + 1)
end

function ActionLimitBossPanel.createMonsterModel(slot0, slot1)
	if slot0.monster_model_id == slot1 then
		return
	end

	slot0.monster_model_id = slot1

	if slot0.monster then
		slot0.monster:DeleteMe()

		slot0.monster = nil
	end

	slot0.monster = BaseRole.new(BaseRole.type.unit, slot1)

	slot0.monster:setAnimation(0, PlayerAction.show, true)
	slot0.monster:setCascade(true)
	slot0.monster:setPosition(360, 474)
	slot0.monster:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.main_container:addChild(slot0.monster)
	slot0.bubble_container:setVisible(true)
end

function ActionLimitBossPanel.createItemList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot0.item_list) do
		slot6:suspendAllActions()
		slot6:setVisible(false)
	end

	slot2 = nil
	slot5 = 0
	slot6 = 152
	slot7 = #slot1
	slot8 = nil
	slot9 = slot7 * BackPackItem.Width * 0.9 + (slot7 - 1) * 16
	slot10 = 150
	slot11 = 1

	for slot15, slot16 in ipairs(slot1) do
		if slot16.bid and slot16.num then
			slot18 = slot16.num

			if Config.ItemData.data_get_data(slot16.bid) then
				if slot0.item_list[slot11] == nil then
					slot2 = BackPackItem.new(false, true, false, slot3, false, true)

					table.insert(slot0.item_list, slot2)
					slot0.main_container:addChild(slot2)
				end

				slot2:setBaseData(slot17, slot18)
				slot2:setDefaultTip(true, false)
				slot2:setPosition(slot10 + (BackPackItem.Width * slot3 + slot4) * (slot11 - 1) + BackPackItem.Width * slot3 * 0.5, slot6)
				slot2:setVisible(true)

				slot11 = slot11 + 1
			end
		end
	end
end

function ActionLimitBossPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	for slot4, slot5 in ipairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.monster then
		slot0.monster:DeleteMe()

		slot0.monster = nil
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.last_ui_fight_type then
		MainuiController:getInstance():setUIFightType(slot0.last_ui_fight_type)
	end
end
