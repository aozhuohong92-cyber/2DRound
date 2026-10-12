slot1 = SmasheggController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = table.sort
ActionSmasheggPanel = class("ActionSmasheggPanel", function ()
	return ccui.Widget:create()
end)

function ActionSmasheggPanel.ctor(slot0, slot1)
	slot0.pos_node_list = {}
	slot0.egg_list = {}
	slot0._init_flag = false
	slot0._is_refresh = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionsmashegg", "actionsmashegg"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_smash_egg", true),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)

	slot0.cost_item_bid = Config.BreakEggData.data_const.item_bid.val
end

function ActionSmasheggPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	uv0:sender16680()
	uv0:sender16685(2)
	slot0:updateGreatAwardList()

	slot0._init_flag = true
end

function ActionSmasheggPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_smash_egg_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot1:getChildByName("image_bg"):loadTexture(PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_smash_egg", true), LOADTEXT_TYPE)

	slot0.add_item_btn = slot1:getChildByName("add_item_btn")
	slot0.item_num_txt = slot1:getChildByName("item_num_txt")
	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.refresh_time = slot1:getChildByName("refresh_time")

	slot1:getChildByName("title_award"):setString(TI18N("极品奖励展示:"))
	slot1:getChildByName("title_luck"):setString(TI18N("幸运值:"))
	slot1:getChildByName("title_record"):setString(TI18N("全服记录"))
	slot1:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot4 = slot1:getChildByName("progress_bg")
	slot0.progress = slot4:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot4:getChildByName("progress_value")

	slot0.progress_value:setString(0)

	slot0.refresh_btn = slot1:getChildByName("refresh_btn")

	slot0.refresh_btn:getChildByName("label"):setString(TI18N("刷新"))

	slot0.smash_all_btn = slot1:getChildByName("smash_all_btn")

	slot0.smash_all_btn:getChildByName("label"):setString(TI18N("全部砸开"))

	slot0.record_more = slot1:getChildByName("record_more")

	if not slot0.cost_tips then
		slot0.cost_tips = createRichLabel(20, cc.c4b(254, 255, 213, 255), cc.p(0.5, 0.5), cc.p(slot1:getContentSize().width / 2, 245))

		slot1:addChild(slot0.cost_tips)

		if Config.ItemData.data_get_data(slot0.cost_item_bid) then
			slot0.cost_tips:setString(uv0(TI18N("每次砸蛋消耗 <img src='%s' scale=0.3 />X1"), PathTool.getItemRes(slot5.icon)))
		end
	end

	if not slot0.refresh_cost_txt then
		slot0.refresh_cost_txt = createRichLabel(20, cc.c4b(254, 255, 213, 255), cc.p(0.5, 0.5), cc.p(163, 146))

		slot1:addChild(slot0.refresh_cost_txt)
	end

	if not slot0.smash_cost_txt then
		slot0.smash_cost_txt = createRichLabel(20, cc.c4b(254, 255, 213, 255), cc.p(0.5, 0.5), cc.p(564, 146))

		slot1:addChild(slot0.smash_cost_txt)
	end

	for slot8 = 1, 6 do
		if slot1:getChildByName("pos_node_" .. slot8) then
			uv1(slot0.pos_node_list, slot9)
		end
	end

	slot5 = slot1:getChildByName("award_list")
	slot6 = slot5:getContentSize()
	slot8 = 0.7
	slot0.award_scrollview = CommonScrollViewLayout.new(slot5, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(slot6.width, slot6.height), {
		start_y = 0,
		start_x = 0,
		space_x = 7,
		row = 1,
		space_y = 0,
		col = 0,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * slot8,
		item_height = BackPackItem.Height * slot8,
		scale = slot8
	})
	slot10 = slot1:getChildByName("record_list")
	slot0.record_scrollview = CommonScrollViewLayout.new(slot10, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot10:getContentSize(), {
		start_y = 0,
		item_width = 400,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 22,
		space_y = 1,
		col = 1,
		need_dynamic = true,
		item_class = SmasheggMainRecordItem
	})

	slot0.record_scrollview:setSwallowTouches(false)
end

function ActionSmasheggPanel.register_event(slot0)
	registerButtonEventListener(slot0.add_item_btn, function ()
		uv0:onClickAddItemBtn()
	end, false)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		uv0:onClickRuleBtn(slot0, slot1, slot2)
	end, false)
	registerButtonEventListener(slot0.refresh_btn, function ()
		uv0:onClickRefreshBtn()
	end, true, nil, , , 0.5)
	registerButtonEventListener(slot0.smash_all_btn, function ()
		uv0:onClickSmashAllBtn()
	end, true, nil, , , 0.5)
	slot0.record_more:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()
				uv1:openSmasheggRecordWindow(true)
			end
		end
	end)

	if not slot0.update_smashegg_data_event then
		slot0.update_smashegg_data_event = GlobalEvent:getInstance():Bind(SmasheggEvent.Update_Smashegg_Data_Event, function (slot0)
			if slot0 then
				uv0:setData(slot0)
			end
		end)
	end

	if not slot0.update_smashegg_record_event then
		slot0.update_smashegg_record_event = GlobalEvent:getInstance():Bind(SmasheggEvent.Update_Smashegg_Record_Event, function (slot0)
			if slot0 and slot0.type == 2 then
				uv0:updateRecordList(slot0.log_list)
			end
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end
end

function ActionSmasheggPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.cost_item_bid then
		if slot1 and slot2 then
			if slot1 == BackPackConst.Bag_Code.BACKPACK then
				for slot6, slot7 in pairs(slot2) do
					if slot7 and slot7.base_id and slot0.cost_item_bid == slot7.base_id then
						slot0.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid))

						break
					end
				end
			end
		else
			have_num = BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid)

			slot0.item_num_txt:setString(have_num)
		end
	end
end

function ActionSmasheggPanel.onClickAddItemBtn(slot0)
	if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.action_wolf) and slot2.action_operate then
		slot2.action_operate:handleSelectedTab(slot2.action_operate.tab_list[slot1])
	end
end

function ActionSmasheggPanel.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.BreakEggData.data_const.holiday_rule then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition())
	end
end

function ActionSmasheggPanel.onClickRefreshBtn(slot0)
	if not uv0:checkRefreshReqIsBack() then
		message(TI18N("刷新过快"))

		return
	end

	if slot0.data then
		if slot0:checkIsHaveGreatEgg() then
			CommonAlert.show(uv1(TI18N("当前还有极品蛋未砸开哦，您是否要刷新？")), TI18N("确定"), function ()
				uv0._is_refresh = true

				uv1:sender16681()
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			slot0._is_refresh = true

			uv0:sender16681()
		end
	end
end

function ActionSmasheggPanel.onClickSmashAllBtn(slot0)
	if not slot0.cost_item_bid then
		return
	end

	if slot0:getNotSmashEggNum() <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid) then
		uv0:sender16683()
	elseif Config.ItemData.data_get_data(slot0.cost_item_bid) then
		message(uv1(TI18N("%s数量不足"), slot3.name))
	end
end

function ActionSmasheggPanel.checkIsHaveGreatEgg(slot0)
	slot1 = false

	if slot0.data and slot0.data.egg_status then
		for slot5, slot6 in pairs(slot0.data.egg_status) do
			if slot6.type == 2 and slot6.status == 0 then
				slot1 = true

				break
			end
		end
	end

	return slot1
end

function ActionSmasheggPanel.getNotSmashEggNum(slot0)
	slot1 = 0

	if slot0.data and slot0.data.egg_status then
		for slot5, slot6 in pairs(slot0.data.egg_status) do
			if slot6.status == 0 then
				slot1 = slot1 + 1
			end
		end
	end

	return slot1
end

function ActionSmasheggPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = slot1.egg_status or {}

	uv0(slot2, SortTools.KeyLowerSorter("pos"))
	slot0:updateLuckInfo()
	slot0:updateLessTime()
	slot0:updateFreeTimes()
	slot0:updateItemNum()
	slot0:updateEggsList(slot2)
end

function ActionSmasheggPanel.updateGreatAwardList(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(Config.BreakEggData.data_award) do
		slot8 = deepCopy(Config.ItemData.data_get_data(slot6.bid))
		slot8.quantity = slot6.num
		slot8.show_effect = slot6.show_effect

		uv0(slot1, slot8)
	end

	slot0.award_scrollview:setData(slot1)
	slot0.award_scrollview:setClickEnabled(#slot1 > 4)
	slot0.award_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.award_scrollview:getItemList()) do
			slot5:setDefaultTip()

			if slot5:getData() and slot6.show_effect == 1 then
				slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
			end
		end
	end)
end

function ActionSmasheggPanel.updateLuckInfo(slot0)
	if not slot0.data then
		return
	end

	slot1 = slot0.data.lucky or 0
	slot2 = 0

	if Config.BreakEggData.data_const.lucky_max then
		slot2 = slot3.val or 0
	end

	slot0.progress:setPercent(slot1 / slot2 * 100)
	slot0.progress_value:setString(slot1 .. "/" .. slot2)
end

function ActionSmasheggPanel.updateRecordList(slot0, slot1)
	slot0.record_scrollview:setData(slot1)
end

function ActionSmasheggPanel.updateEggsList(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	if slot0._is_refresh then
		for slot5, slot6 in pairs(slot0.egg_list) do
			slot6:setVisible(false)
		end
	end

	for slot5 = 1, 6 do
		slot6 = 0

		if slot0._is_refresh then
			slot6 = 2 * slot5 / display.DEFAULT_FPS
		end

		delayRun(slot0.main_container, slot6, function ()
			if uv0.egg_list[uv1] == nil then
				slot0 = SmasheggItem.new()

				uv0.pos_node_list[uv1]:addChild(slot0)

				uv0.egg_list[uv1] = slot0
			end

			if uv2[uv1] then
				slot0:setData(slot1)
				slot0:setVisible(true)
			end
		end)
	end

	slot0._is_refresh = false
end

function ActionSmasheggPanel.updateFreeTimes(slot0)
	if not slot0.data or not slot0.refresh_cost_txt then
		return
	end

	if (slot0.data.free_num or 0) > 0 then
		slot3 = 0

		if Config.BreakEggData.data_const.free_time then
			slot3 = slot2.val or 0
		end

		slot0.refresh_cost_txt:setString(uv0(TI18N("免费次数:%d/%d"), slot1, slot3))
	elseif Config.BreakEggData.data_const.refresh_gold then
		slot0.refresh_cost_txt:setString(uv0(TI18N("消耗 <img src='%s' scale=0.25 /> %d"), PathTool.getItemRes(3), slot2.val or 0))
	end

	if slot0.smash_cost_txt then
		if Config.ItemData.data_get_data(slot0.cost_item_bid) then
			slot0.smash_cost_txt:setString(uv0(TI18N("消耗 <img src='%s' scale=0.3 />%d"), PathTool.getItemRes(slot2.icon), slot0:getNotSmashEggNum() or 6))
		end
	end
end

function ActionSmasheggPanel.updateLessTime(slot0)
	if not slot0.data then
		return
	end

	slot0:setLessTime(slot0.data.endtime - GameNet:getInstance():getTime())
end

function ActionSmasheggPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.refresh_time) then
		return
	end

	slot0.refresh_time:stopAllActions()

	if slot1 > 0 then
		slot0.refresh_time:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
		slot0.refresh_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.refresh_time:stopAllActions()
			else
				uv1.refresh_time:setString(TimeTool.GetTimeFormatDayIIIIII(uv0))
			end
		end))))
	else
		slot0.refresh_time:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	end
end

function ActionSmasheggPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:sender16680()
	end
end

function ActionSmasheggPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	if slot0.record_scrollview then
		slot0.record_scrollview:DeleteMe()

		slot0.record_scrollview = nil
	end

	for slot4, slot5 in pairs(slot0.egg_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.update_smashegg_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_smashegg_data_event)

		slot0.update_smashegg_data_event = nil
	end

	if slot0.update_smashegg_record_event then
		GlobalEvent:getInstance():UnBind(slot0.update_smashegg_record_event)

		slot0.update_smashegg_record_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end

	uv0:setSmasheggAniPlaying(false)
end

SmasheggItem = class("SmasheggItem", function ()
	return ccui.Widget:create()
end)

function SmasheggItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.is_ani_playing = false
	slot0.cost_item_bid = Config.BreakEggData.data_const.item_bid.val
end

function SmasheggItem.configUI(slot0)
	slot0.size = cc.size(124, 150)

	slot0:setTouchEnabled(true)
	slot0:setAnchorPoint(cc.p(0.5, 0))
	slot0:setPosition(cc.p(slot0.size.width / 2, -7))
	slot0:setContentSize(slot0.size)

	slot0.egg_icon = createImage(slot0, nil, 0, 0, cc.p(0.5, 0), true)

	slot0.egg_icon:setTouchEnabled(true)
end

function SmasheggItem.register_event(slot0)
	registerButtonEventListener(slot0.egg_icon, function ()
		uv0:onClickEggIcon()
	end, false)
end

function SmasheggItem.onClickEggIcon(slot0)
	if uv0:getSmasheggAniPlaying() then
		return
	end

	if not slot0.data or slot0.data.status == 1 then
		return
	end

	if slot0.data and slot0.cost_item_bid then
		if BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid) >= 1 then
			uv0:setSmasheggAniPlaying(true)
			slot0:handleEffect(true)
		elseif Config.ItemData.data_get_data(slot0.cost_item_bid) then
			message(uv1(TI18N("%s数量不足"), slot2.name))
		end
	end
end

function SmasheggItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = false
	slot3 = PathTool.getResFrame("actionsmashegg", "actionsmashegg_1001")

	if slot1.type == 1 and slot1.status == 0 then
		slot3 = PathTool.getResFrame("actionsmashegg", "actionsmashegg_1001")
	elseif slot1.type == 1 and slot1.status == 1 then
		slot3 = PathTool.getResFrame("actionsmashegg", "actionsmashegg_1003")
	elseif slot1.type == 2 and slot1.status == 0 then
		slot2 = true
		slot3 = PathTool.getResFrame("actionsmashegg", "actionsmashegg_1002")
	elseif slot1.type == 2 and slot1.status == 1 then
		slot3 = PathTool.getResFrame("actionsmashegg", "actionsmashegg_1004")
	end

	if not slot0.cur_egg_res or slot0.cur_egg_res ~= slot3 then
		slot0.egg_icon:loadTexture(slot3, LOADTEXT_TYPE_PLIST)
	end

	slot0.egg_icon:setVisible(true)

	if slot1.status == 1 and slot1.show_reward and slot1.show_reward[1] then
		slot4 = slot1.show_reward[1].item_id
		slot5 = slot1.show_reward[1].num

		if not slot0.reward_item then
			slot0.reward_item = BackPackItem.new(true, true, nil, 0.7)

			slot0.reward_item:setDefaultTip()
			slot0.reward_item:setAnchorPoint(cc.p(0.5, 0.5))
			slot0.reward_item:setPosition(cc.p(0, 100))
			slot0:addChild(slot0.reward_item)
		end

		slot0.reward_item:setVisible(true)
		slot0.reward_item:setBaseData(slot4, slot5)
	elseif slot0.reward_item then
		slot0.reward_item:setVisible(false)
	end

	if slot2 then
		if not slot0.ani_showing then
			slot0.egg_icon:setRotation(0)
			slot0.egg_icon:stopAllActions()

			slot7 = cc.DelayTime:create(0.7)
			slot8 = {}

			for slot12 = 1, 5 do
				uv0(slot8, cc.RotateBy:create(0.05, -5))
				uv0(slot8, cc.RotateBy:create(0.1, 10))
				uv0(slot8, cc.RotateBy:create(0.05, -5))
			end

			uv0(slot8, slot7)
			slot0.egg_icon:runAction(cc.RepeatForever:create(cc.Sequence:create(unpack(slot8))))

			slot0.ani_showing = true
		end
	else
		slot0.egg_icon:setRotation(0)
		slot0.egg_icon:stopAllActions()

		slot0.ani_showing = false
	end
end

function SmasheggItem.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.egg_effect then
			slot0.egg_effect:clearTracks()
			slot0.egg_effect:removeFromParent()

			slot0.egg_effect = nil
		end
	else
		slot0.is_ani_playing = true

		if not tolua.isnull(slot0) and slot0.egg_effect == nil then
			slot0.egg_effect = createEffectSpine(Config.EffectData.data_effect_info[532], cc.p(5, 65), cc.p(0.5, 0.5), false, PlayerAction.action, handler(slot0, slot0._onEggAniCallBack))

			slot0:addChild(slot0.egg_effect)
			slot0.egg_effect:registerSpineEventHandler(function (slot0)
				if slot0.eventData.name == "appear" then
					uv0.egg_icon:setVisible(false)
				end
			end, sp.EventType.ANIMATION_EVENT)
		elseif slot0.egg_effect then
			slot0.egg_effect:setToSetupPose()
			slot0.egg_effect:setAnimation(0, PlayerAction.action, false)
		end
	end
end

function SmasheggItem._onEggAniCallBack(slot0)
	if slot0.data and slot0.data.pos then
		uv0:sender16682(slot0.data.pos)
	end
end

function SmasheggItem.DeleteMe(slot0)
	if slot0.reward_item then
		slot0.reward_item:DeleteMe()

		slot0.reward_item = nil
	end

	if slot0.alert_tips then
		slot0.alert_tips:close()

		slot0.alert_tips = nil
	end

	slot0:handleEffect(false)
	slot0.egg_icon:stopAllActions()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end

SmasheggMainRecordItem = class("SmasheggMainRecordItem", function ()
	return ccui.Widget:create()
end)

function SmasheggMainRecordItem.ctor(slot0)
	slot0:configUI()
end

function SmasheggMainRecordItem.configUI(slot0)
	slot0.size = cc.size(400, 22)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)
end

function SmasheggMainRecordItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.record_txt then
		slot0.record_txt = createRichLabel(20, cc.c3b(232, 219, 185), cc.p(0.5, 0.5), cc.p(slot0.size.width / 2, slot0.size.height / 2), nil, , 400)

		slot0:addChild(slot0.record_txt)
	end

	if slot1.bid and Config.ItemData.data_get_data(slot1.bid) then
		slot0.record_txt:setString(uv0(TI18N("恭喜 <div fontcolor=5dff38>%s </div>获得 %sX%d"), slot1.role_name, slot2.name, slot1.num))
	end
end

function SmasheggMainRecordItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
