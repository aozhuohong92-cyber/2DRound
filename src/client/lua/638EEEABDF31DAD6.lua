ActionLuckyDogPanel = class("ActionLuckyDogPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
slot5 = {
	Luckly = 4,
	Copper = 3,
	Silver = 2,
	Glod = 1,
	NoPrize = 0
}

function ActionLuckyDogPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.cur_select_period = 1

	slot0:loadResources()
end

function ActionLuckyDogPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("luckydog", "luckydog"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:send28400()
	end)
end

function ActionLuckyDogPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_lucky_dog_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot1 = "action_lucky_dog"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.reward_title ~= "" and slot2.reward_title then
		slot1 = slot2.reward_title
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, function ()
			if not tolua.isnull(uv0.image_bg) then
				uv0.image_bg:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.img_progress_bg = slot0.main_container:getChildByName("img_progress_bg")
	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.txt_open_time = slot0.main_container:getChildByName("txt_open_time")

	slot0.txt_open_time:setString(TI18N("开奖时间："))

	slot0.txt_open_time_value = slot0.main_container:getChildByName("txt_open_time_value")

	slot0.txt_open_time_value:setString("")

	slot0.btn_get_reward = slot0.main_container:getChildByName("btn_get_reward")

	slot0.btn_get_reward:getChildByName("label"):setString(TI18N("一键领取"))

	slot0.btn_previous = slot0.main_container:getChildByName("btn_previous")
	slot0.btn_next = slot0.main_container:getChildByName("btn_next")
	slot0.txt_period = slot0.main_container:getChildByName("txt_period")
	slot7 = "reward_list"
	slot0.reward_list = slot0.main_container:getChildByName(slot7)

	for slot7 = 1, 4 do
		slot0.reward_list["reward_item" .. slot7] = slot0.reward_list:getChildByName("reward_item" .. slot7)
		slot0.reward_list["reward_item" .. slot7].goods_con = slot0.reward_list["reward_item" .. slot7]:getChildByName("goods_con")
		slot0.reward_list["reward_item" .. slot7].title = slot0.reward_list["reward_item" .. slot7]:getChildByName("title")
		slot0.reward_list["reward_item" .. slot7].ticket = slot0.reward_list["reward_item" .. slot7]:getChildByName("ticket")
		slot0.reward_list["reward_item" .. slot7].ticket.ticket_num = slot0.reward_list["reward_item" .. slot7].ticket:getChildByName("ticket_num")
		slot10 = CommonScrollViewLayout.new(slot0.reward_list["reward_item" .. slot7].goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.reward_list["reward_item" .. slot7].goods_con:getContentSize(), {
			start_y = 11,
			start_x = 10,
			space_x = 10,
			row = 1,
			space_y = 4,
			col = 0,
			scale = 0.6,
			item_class = BackPackItem,
			item_width = BackPackItem.Width * 0.6,
			item_height = BackPackItem.Height * 0.6
		})

		slot10:setClickEnabled(false)

		slot0["item_scrollview" .. slot7] = slot10
	end

	slot4 = slot0.main_container:getChildByName("task_list")
	slot0.task_scrollview = CommonScrollViewLayout.new(slot4, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.bottom, slot4:getContentSize(), {
		start_y = 0,
		item_width = 200,
		start_x = 10,
		space_x = 39,
		row = 1,
		item_height = 155,
		space_y = 0,
		col = 3,
		need_dynamic = true,
		item_class = ActionLuckyDogTaskItem
	})

	slot0.task_scrollview:setSwallowTouches(false)
	slot0.task_scrollview:setClickEnabled(false)
	slot0.task_scrollview:setSwallowTouches(false)
	uv0:send28403()
end

function ActionLuckyDogPanel.register_event(slot0)
	if not slot0.update_holiday_common_event then
		slot0.update_holiday_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setPanelData(slot0)
			end
		end)
	end

	if not slot0.update_dog_base_event then
		slot0.update_dog_base_event = GlobalEvent:getInstance():Bind(ActionEvent.LUCKY_DOG_BASE_EVENT, function ()
			uv0:cs16603(uv1.holiday_bid)
		end)
	end

	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		config = Config.HolidayLuckyDogData.data_constant

		if config and config.rules then
			TipsManager:getInstance():showCommonTips(config.rules.desc or "", slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1, nil, 0.8)
	registerButtonEventListener(slot0.btn_get_reward, function ()
		if uv0.cur_select_period and uv0.cur_select_period ~= 0 then
			uv1:send28401(uv0.cur_select_period)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_previous, function ()
		uv0:setPageCut(0)
	end, true, 1)
	registerButtonEventListener(slot0.btn_next, function ()
		uv0:setPageCut(1)
	end, true, 1)
end

function ActionLuckyDogPanel.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.cur_select_period = uv0:getLuckyDogPeriod()

	slot0:setPeriodData()
end

function ActionLuckyDogPanel.setPeriodData(slot0)
	slot0.cur_select_data = uv0:getLuckyDogBaseData(slot0.cur_select_period)

	if not slot0.cur_select_data then
		return
	end

	if Config.HolidayLuckyDogData.data_quest_award and slot1[slot0.cur_select_period] then
		for slot5 = 1, 4 do
			slot6 = {}

			for slot10, slot11 in ipairs(slot1[slot0.cur_select_period][slot5].award) do
				if deepCopy(Config.ItemData.data_get_data(slot11[1])) then
					slot12.quantity = slot11[2]

					uv1(slot6, slot12)
				end
			end

			slot7 = slot0["item_scrollview" .. slot5]

			slot7:setData(slot6)
			slot7:setData(slot6)
			slot7:addEndCallBack(function ()
				for slot4, slot5 in pairs(uv0:getItemList()) do
					slot5:setDefaultTip()
					slot5:setSwallowTouches(false)
				end
			end)

			slot8 = TI18N("未开奖")

			if slot0.cur_select_data.state == 1 then
				if slot1[slot0.cur_select_period][slot5].limit_number <= 0 then
					slot8 = TI18N("其他号码")
				elseif slot1[slot0.cur_select_period][slot5].limit_number < 10 then
					slot8 = "XXXXXXX" .. slot1[slot0.cur_select_period][slot5].limit_number
				elseif slot1[slot0.cur_select_period][slot5].limit_number < 100 then
					slot8 = "XXXXXX" .. slot1[slot0.cur_select_period][slot5].limit_number
				elseif slot1[slot0.cur_select_period][slot5].limit_number < 1000 then
					slot8 = "XXXXX" .. slot1[slot0.cur_select_period][slot5].limit_number
				elseif slot1[slot0.cur_select_period][slot5].limit_number < 10000 then
					slot8 = "XXXX" .. slot1[slot0.cur_select_period][slot5].limit_number
				elseif slot1[slot0.cur_select_period][slot5].limit_number < 100000 then
					slot8 = "XXX" .. slot1[slot0.cur_select_period][slot5].limit_number
				end
			end

			if slot0.reward_list["reward_item" .. slot5].ticket.ticket_num then
				slot0.reward_list["reward_item" .. slot5].ticket.ticket_num:setString(slot8)
			end
		end
	end

	slot0.txt_period:setString(uv2(TI18N("第%s期"), StringUtil.numToChinese(slot0.cur_select_period)))

	slot3 = uv0:getLuckyDogTaskData(slot0.cur_select_period)

	uv3(slot3, function (slot0, slot1)
		return slot0.quest_id < slot1.quest_id
	end)
	slot0.task_scrollview:setData(slot3)

	if uv0:getLuckyDogPeriodRed(slot0.cur_select_period) then
		setChildUnEnabled(false, slot0.btn_get_reward)
		slot0.btn_get_reward:getChildByName("label"):setString(TI18N("一键领取"))
		slot0.btn_get_reward:getChildByName("label"):enableOutline(cc.c4b(117, 74, 25, 255), 2)
		addRedPointToNodeByStatus(slot0.btn_get_reward, true)
		slot0.btn_get_reward:setEnabled(true)
	else
		setChildUnEnabled(true, slot0.btn_get_reward)

		if slot0.cur_select_data.state == 0 then
			slot0.btn_get_reward:getChildByName("label"):setString(TI18N("暂未开奖"))
		elseif slot0.cur_select_data.state == 1 then
			if uv0:getLuckyDogParticipateIn(slot0.cur_select_period) then
				slot0.btn_get_reward:getChildByName("label"):setString(TI18N("已领取"))
			else
				slot0.btn_get_reward:getChildByName("label"):setString(TI18N("未完成"))
			end
		end

		slot0.btn_get_reward:getChildByName("label"):disableEffect(cc.LabelEffect.OUTLINE)
		addRedPointToNodeByStatus(slot0.btn_get_reward, false)
		slot0.btn_get_reward:setEnabled(false)
	end

	if Config.HolidayLuckyDogData.data_period and slot4[slot0.cur_select_period] and slot4[slot0.cur_select_period].open_time then
		slot0.txt_open_time_value:setString(slot4[slot0.cur_select_period].open_time)
	end

	if uv0:getLuckyDogData() and slot5.start_time and slot5.end_time then
		slot0.txt_time_value:setString(TimeTool.getMD2(slot5.start_time) .. "-" .. TimeTool.getMD2(slot5.end_time))
	end

	slot0:checkPageBtn()
end

function ActionLuckyDogPanel.setPageCut(slot0, slot1)
	if slot1 == 0 then
		slot0.cur_select_period = slot0.cur_select_period - 1
	elseif slot1 == 1 then
		slot0.cur_select_period = slot0.cur_select_period + 1
	end

	slot0:checkPageBtn()
	slot0:setPeriodData()
end

function ActionLuckyDogPanel.checkPageBtn(slot0)
	slot0.open_period = uv0:getLuckyDogPeriod()

	if not slot0.open_period then
		return
	end

	if slot0.cur_select_period <= 1 then
		slot0.cur_select_period = 1

		slot0.btn_previous:setVisible(false)
		slot0.btn_next:setVisible(slot0.open_period ~= 1)
		slot0.btn_next:getChildByName("redpoint"):setVisible(uv0:getLuckyDogPeriodRed(slot0.cur_select_period + 1))
	elseif slot0.open_period <= slot0.cur_select_period then
		slot0.cur_select_period = slot0.open_period

		slot0.btn_previous:setVisible(true)
		slot0.btn_next:setVisible(false)
		slot0.btn_previous:getChildByName("redpoint"):setVisible(uv0:getLuckyDogPeriodRed(slot0.cur_select_period - 1))
	else
		slot0.btn_previous:setVisible(true)
		slot0.btn_next:setVisible(true)
		slot0.btn_next:getChildByName("redpoint"):setVisible(uv0:getLuckyDogPeriodRed(slot0.cur_select_period + 1))
		slot0.btn_previous:getChildByName("redpoint"):setVisible(uv0:getLuckyDogPeriodRed(slot0.cur_select_period - 1))
	end
end

function ActionLuckyDogPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	doStopAllActions(slot0.txt_time_value)

	if slot0.task_scrollview then
		slot0.task_scrollview:DeleteMe()
	end

	slot0.task_scrollview = nil

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end

	for slot4 = 1, 4 do
		if slot0["item_scrollview" .. slot4] then
			slot0["item_scrollview" .. slot4]:DeleteMe()

			slot0["item_scrollview" .. slot4] = nil
		end
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.update_dog_base_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dog_base_event)

		slot0.update_dog_base_event = nil
	end
end

ActionLuckyDogTaskItem = class("ActionLuckyDogTaskItem", function ()
	return ccui.Widget:create()
end)

function ActionLuckyDogTaskItem.ctor(slot0)
	slot0:configUI()
	slot0:registerEvent()
end

function ActionLuckyDogTaskItem.registerEvent(slot0)
	registerButtonEventListener(slot0.goto_btn, function ()
		if uv0.jump_data and next(uv0.jump_data) then
			JumpController:getInstance():jumpViewByEvtData(uv0.jump_data)
		end
	end, true, 1)
end

function ActionLuckyDogTaskItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_lucky_dog_task_item"))
	slot0.size = cc.size(200, 150)

	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.stamp_bg = slot0.root_wnd:getChildByName("stamp_bg")
	slot0.stamp = slot0.stamp_bg:getChildByName("stamp")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot0.ticket = slot0.main_container:getChildByName("ticket")
	slot0.txt_ticket = slot0.ticket:getChildByName("txt_ticket")
	slot0.goto_btn = slot0.main_container:getChildByName("goto_btn")
	slot0.goto_btn_label = slot0.goto_btn:getChildByName("label")

	slot0.goto_btn_label:setString(TI18N("前往"))

	slot0.task_value = slot0.main_container:getChildByName("task_value")
	slot0.task_desc = slot0.main_container:getChildByName("task_desc")
	slot0.reward_scroll = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.bottom, slot0.goods_con:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.5,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.5,
		item_height = BackPackItem.Height * 0.5
	})

	slot0.reward_scroll:setClickEnabled(false)
	slot0.reward_scroll:setSwallowTouches(false)
end

function ActionLuckyDogTaskItem.setData(slot0, slot1)
	slot0.data = slot1
	slot0.award_config = Config.HolidayLuckyDogData.data_quest_award
	slot0.task_config = Config.HolidayLuckyDogData.data_quest

	if not slot0.data or not slot0.award_config or not slot0.task_config then
		return
	end

	slot0.reward_scroll:setData(list)
	slot0.reward_scroll:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.reward_scroll:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)

	if slot1.num == 0 then
		slot0.goods_con:setVisible(false)
		slot0.stamp_bg:setVisible(false)
		slot0.ticket:setVisible(false)
		slot0.task_desc:setVisible(true)
		slot0.task_value:setVisible(true)
		slot0.goto_btn:setVisible(true)
		slot0:setTaskBtn()
		slot0:setTaskTxt()

		slot0.jump_data = {}

		if slot0.task_config and slot0.task_config[slot0.data.quest_id] then
			uv0(slot0.jump_data, slot0.task_config[slot0.data.quest_id].jump_id)

			if slot0.task_config[slot0.data.quest_id].condition[4] and next(slot0.task_config[slot0.data.quest_id].condition[4]) then
				slot5 = slot0.data.quest_id

				for slot5, slot6 in pairs(slot0.task_config[slot5].condition[4]) do
					uv0(slot0.jump_data, slot6)
				end
			end
		end
	else
		slot0.goods_con:setVisible(true)
		slot0.stamp_bg:setVisible(true)
		slot0.ticket:setVisible(true)
		slot0.task_desc:setVisible(false)
		slot0.task_value:setVisible(false)
		slot0.goto_btn:setVisible(false)
		slot0:setTicketNum()

		if slot1.state == 0 or slot1.lucky_type == 0 then
			slot0.stamp_bg:setVisible(false)
			slot0.goods_con:setVisible(false)
			slot0.task_desc:setVisible(true)
			slot0.task_value:setVisible(true)
			slot0:setTaskTxt()
		else
			slot0:setStamp()
			slot0:setRewardData()
		end
	end
end

function ActionLuckyDogTaskItem.setStamp(slot0)
	if slot0.data.lucky_type == 4 then
		slot0.stamp:setContentSize(cc.size(80, 24))
	else
		slot0.stamp:setContentSize(cc.size(106, 24))
	end

	slot0.stamp:loadTexture(PathTool.getResFrame("luckydog", "luckydog_stamp_" .. slot0.data.lucky_type), LOADTEXT_TYPE_PLIST)
end

function ActionLuckyDogTaskItem.setTaskTxt(slot0)
	if slot0.task_config and slot0.task_config[slot0.data.quest_id] then
		slot0.task_desc:setString(slot0.task_config[slot0.data.quest_id].desc or "")

		if slot0.task_config[slot0.data.quest_id].condition and slot0.task_config[slot0.data.quest_id].condition[3] then
			slot0.task_value:setString((slot0.data.val or 0) .. "/" .. slot0.task_config[slot0.data.quest_id].condition[3])
		end
	end
end

function ActionLuckyDogTaskItem.setRewardData(slot0)
	if slot0.award_config and slot0.award_config[slot0.data.period] and slot0.award_config[slot0.data.period][slot0.data.lucky_type] then
		slot1 = {}
		slot5 = slot0.data.lucky_type

		for slot5, slot6 in ipairs(slot0.award_config[slot0.data.period][slot5].award) do
			if deepCopy(Config.ItemData.data_get_data(slot6[1])) then
				slot7.quantity = slot6[2]

				uv0(slot1, slot7)
			end
		end

		slot0.reward_scroll:setData(slot1)
	end
end

function ActionLuckyDogTaskItem.setTaskBtn(slot0)
	if slot0.data.num == 0 then
		if slot0.data.state == 0 then
			setChildUnEnabled(false, slot0.goto_btn)
			slot0.goto_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
			slot0.goto_btn_label:setString(TI18N("前往"))
			slot0.goto_btn:setEnabled(true)
		else
			setChildUnEnabled(true, slot0.goto_btn)
			slot0.goto_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
			slot0.goto_btn_label:setString(TI18N("未完成"))
			slot0.goto_btn:setEnabled(false)
		end
	end
end

function ActionLuckyDogTaskItem.setTicketNum(slot0)
	slot0.txt_ticket:setString(tostring(slot0.data.num))
end

function ActionLuckyDogTaskItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
