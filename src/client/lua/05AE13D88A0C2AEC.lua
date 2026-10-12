slot1 = DialActionController:getInstance():getModel()
slot2 = table.insert
slot3 = table.sort
slot4 = string.format
DialActionMainPanel = class("DialActionMainPanel", function ()
	return ccui.Widget:create()
end)

function DialActionMainPanel.ctor(slot0, slot1)
	slot0.pos_node_list = {}
	slot0.pos_list = {}
	slot0.cur_pos_index = 1
	slot0.time_full_flag = false
	slot0.dial_item_list = {}
	slot0.ani_showing = false
	slot0.have_cost_num = 0
	slot0.dial_item_cfg = {}
	slot0.is_free = false
	slot0._init_flag = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actiondial", "actiondial"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_dial_bg", true),
			type = ResourcesType.single
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)

	if Config.HolidayDialData.data_dial_const.lottery_ticket then
		slot0.cost_item_bid = slot2.val
	end
end

function DialActionMainPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	ActionController:getInstance():cs16603(ActionRankCommonType.dial)
	uv0:sender16670()
	uv0:sender16674(2)

	slot0._init_flag = true
end

function DialActionMainPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_dial_main_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot1:getChildByName("image_bg"):loadTexture(PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_action_dial_bg", true), LOADTEXT_TYPE)

	slot0.add_item_btn = slot1:getChildByName("add_item_btn")
	slot0.award_btn = slot1:getChildByName("award_btn")

	slot0.award_btn:getChildByName("label"):setString(TI18N("积分奖励"))

	slot0.extract_btn_1 = slot1:getChildByName("extract_btn_1")

	slot0.extract_btn_1:getChildByName("label"):setString(TI18N("抽一次"))

	slot0.free_label = slot0.extract_btn_1:getChildByName("free_label")

	slot0.free_label:setString(TI18N("本次免费"))

	slot0.cost_icon_1 = slot0.extract_btn_1:getChildByName("cost_icon")
	slot0.cost_label_1 = slot0.extract_btn_1:getChildByName("cost_label")
	slot0.extract_btn_10 = slot1:getChildByName("extract_btn_10")

	slot0.extract_btn_10:getChildByName("label"):setString(TI18N("抽十次"))

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.no_ani_btn = slot1:getChildByName("no_ani_btn")

	slot0.no_ani_btn:getChildByName("label"):setString(TI18N("跳过动画"))

	slot0.no_ani_flag = uv0:getIsNoAniFlag()

	slot0.no_ani_btn:setSelected(slot0.no_ani_flag)

	slot0.item_num_txt = slot1:getChildByName("item_num_txt")

	slot1:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot0.refresh_time = slot1:getChildByName("refresh_time")
	slot6 = "item_panel"
	slot0.item_panel = slot1:getChildByName(slot6)

	for slot6 = 1, 12 do
		if slot0.item_panel:getChildByName("pos_node_" .. slot6) then
			uv1(slot0.pos_node_list, slot7)

			slot8, slot9 = slot7:getPosition()

			uv1(slot0.pos_list, cc.p(slot8, slot9))
		end
	end

	slot3 = slot1:getChildByName("record_list")
	slot0.record_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 340,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 30,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = DialRecordMainItem
	})

	slot0.record_scrollview:setSwallowTouches(false)

	if not slot0.check_more_txt then
		slot0.check_more_txt = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(slot1:getContentSize().width / 2, 476))

		slot1:addChild(slot0.check_more_txt)
		slot0.check_more_txt:setString(TI18N("<div fontcolor=5dff38 href=check_more>查看更多</div>"))
		slot0.check_more_txt:addTouchLinkListener(function (slot0, slot1)
			if slot0 == "href" and slot1 == "check_more" then
				uv0:openDialRecordWindow(true)
			end
		end, {
			"href"
		})
	end
end

function DialActionMainPanel.register_event(slot0)
	slot0.no_ani_btn:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			uv0.no_ani_flag = true

			uv1:setIsNoAniFlag(true)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			uv0.no_ani_flag = false

			uv1:setIsNoAniFlag(false)
		end
	end)
	registerButtonEventListener(slot0.add_item_btn, function ()
	end)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.HolidayDialData.data_dial_const.holiday_rule.desc, slot1:getTouchBeganPosition())
	end)
	registerButtonEventListener(slot0.award_btn, function ()
		uv0:openDialAwardWindow(true)
	end, true)
	registerButtonEventListener(slot0.extract_btn_1, function ()
		if not uv0.ani_showing then
			uv0:onExtractOnce()
		end
	end, true, nil, nil, nil, 0.5)
	registerButtonEventListener(slot0.extract_btn_10, function ()
		if not uv0.ani_showing then
			uv0:onExtractTen()
		end
	end, true, nil, nil, nil, 0.5)

	if not slot0.update_dial_result_event then
		slot0.update_dial_result_event = GlobalEvent:getInstance():Bind(DialActionEvent.Update_Dial_Result_Event, function (slot0)
			if slot0 then
				uv0.result_index = slot0

				uv0:showDialAnimate(true)
			end
		end)
	end

	if not slot0.update_dial_data_event then
		slot0.update_dial_data_event = GlobalEvent:getInstance():Bind(DialActionEvent.Update_Dial_Data_Event, function (slot0)
			if slot0 then
				uv0:initDialItemDataByLv(slot0.holiday_lev)
				uv0:setData(slot0)
			end
		end)
	end

	if not slot0.update_dial_record_event then
		slot0.update_dial_record_event = GlobalEvent:getInstance():Bind(DialActionEvent.Update_Dial_Record_Event, function (slot0)
			if slot0 == 2 then
				uv0:updateDialRecordData()
			end
		end)
	end

	if not slot0.update_dial_gold_event then
		slot0.update_dial_gold_event = GlobalEvent:getInstance():Bind(DialActionEvent.Update_Dial_Gold_Event, function ()
			uv0:updateGialGoldNum()
		end)
	end

	if not slot0.update_action_dial_event then
		slot0.update_action_dial_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == ActionRankCommonType.dial then
				uv0.dialLessTime = slot0.remain_sec

				uv0:setLessTime(uv0.dialLessTime)
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

function DialActionMainPanel.setLessTime(slot0, slot1)
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

function DialActionMainPanel.onExtractOnce(slot0)
	if slot0.is_free or slot0.have_cost_num >= 1 then
		if slot0.no_ani_flag then
			uv0:sender16671(1, 1)
		else
			uv0:sender16671(1, 0)
		end
	elseif uv1:getRemindFlag() and slot0.cost_item_bid then
		message(TI18N("道具不足"))
	elseif slot0.no_ani_flag then
		uv0:sender16671(1, 1)
	else
		uv0:sender16671(1, 0)
	end
end

function DialActionMainPanel.onExtractTen(slot0)
	if slot0.have_cost_num >= 10 then
		if slot0.no_ani_flag then
			uv0:sender16671(10, 1)
		else
			uv0:sender16671(10, 0)
		end
	elseif uv1:getRemindFlag() and slot0.cost_item_bid then
		message(TI18N("道具不足"))
	elseif slot0.no_ani_flag then
		uv0:sender16671(10, 1)
	else
		uv0:sender16671(10, 0)
	end
end

function DialActionMainPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0:updateGialGoldNum()
	slot0:updateItemNum()
	slot0:updateOnceBtnStatus()
	slot0:updateAwardRedStatus()
end

function DialActionMainPanel.updateGialGoldNum(slot0)
	slot1 = uv0:getDialGoldNum()

	if not slot0.gold_num then
		slot0.gold_num = CommonNum.new(1, slot0.main_container, 0, 1, cc.p(0, 0.5))

		slot0.gold_num:setPosition(cc.p(380, 414))
	end

	slot0.gold_num:setNum(slot1)
end

function DialActionMainPanel.updateOnceBtnStatus(slot0)
	if slot0.data then
		if slot0.data.is_free and slot0.data.is_free == 0 then
			slot0.cost_icon_1:setVisible(false)
			slot0.cost_label_1:setVisible(false)
			slot0.free_label:setVisible(true)

			slot0.is_free = true
		else
			slot0.cost_icon_1:setVisible(true)
			slot0.cost_label_1:setVisible(true)
			slot0.free_label:setVisible(false)

			slot0.is_free = false
		end
	end
end

function DialActionMainPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.cost_item_bid then
		if slot1 and slot2 then
			if slot1 == BackPackConst.Bag_Code.BACKPACK then
				for slot6, slot7 in pairs(slot2) do
					if slot7 and slot7.base_id and slot0.cost_item_bid == slot7.base_id then
						slot0.have_cost_num = BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid)

						slot0.item_num_txt:setString(slot0.have_cost_num)

						break
					end
				end
			end
		else
			slot0.have_cost_num = BackpackController:getInstance():getModel():getItemNumByBid(slot0.cost_item_bid)

			slot0.item_num_txt:setString(slot0.have_cost_num)
		end
	end
end

function DialActionMainPanel.updateDialRecordData(slot0)
	slot0.record_scrollview:setData(uv0:getAllDialRecordData())
end

function DialActionMainPanel.updateAwardRedStatus(slot0)
	addRedPointToNodeByStatus(slot0.award_btn, uv0:getDialAwardResStatus(), 10, 10)
end

function DialActionMainPanel.initDialItemDataByLv(slot0, slot1)
	if not slot1 then
		return
	end

	if slot0.dial_item_cfg and next(slot0.dial_item_cfg) ~= nil then
		return
	end

	slot0.dial_item_cfg = {}

	for slot5, slot6 in pairs(Config.HolidayDialData.data_dial_item) do
		for slot10, slot11 in pairs(slot6) do
			if slot11.limit_lev_min <= slot1 and slot1 <= slot11.limit_lev_max then
				uv0(slot0.dial_item_cfg, slot11)

				break
			end
		end
	end

	uv1(slot0.dial_item_cfg, SortTools.KeyLowerSorter("order"))
	slot0:showDialItemList()
end

function DialActionMainPanel.showDialItemList(slot0)
	for slot4 = 1, 12 do
		delayRun(slot0.main_container, slot4 / display.DEFAULT_FPS, function ()
			if not uv0.dial_item_list[uv1] and uv0.pos_node_list[uv1] then
				slot0 = DialGoodsItem.new()

				slot1:addChild(slot0)

				uv0.dial_item_list[uv1] = slot0
			end

			if uv0.dial_item_cfg[uv1] then
				slot0:setData(slot1)

				if uv1 == 1 or uv1 == 4 or uv1 == 7 or uv1 == 10 then
					slot0:setItemScale(0.9)
				else
					slot0:setItemScale(0.8)
				end
			end

			if uv1 == 12 then
				uv0:showDialAnimate()
			end
		end)
	end
end

function DialActionMainPanel.showDialAnimate(slot0, slot1)
	slot0:hideAllItemEffect(false)
	slot0:openDialAniTimer(false)

	slot0.time_full_flag = false

	if not slot1 then
		slot0:updateKuangAnimate(0.7)
	else
		slot0.ani_showing = true

		slot0:openDialAniTimer(true)
		slot0:updateKuangAnimate(0.04)
	end
end

function DialActionMainPanel.openDialAniTimer(slot0, slot1)
	if slot1 == true then
		if slot0.dial_timer == nil then
			slot0.total_time = 0
			slot0.temp_delay_time = 0
			slot0.dial_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.total_time = uv0.total_time + 0.1

				if uv0.total_time >= 1.5 and (uv0.temp_delay_time == 0 or uv0.temp_delay_time + 0.05 < uv0.total_time / 10) then
					uv0.temp_delay_time = uv0.total_time / 10

					uv0:updateKuangAnimate(uv0.temp_delay_time)

					if uv0.total_time > 2 then
						uv0.time_full_flag = true

						uv0:openDialAniTimer(false)
					end
				end
			end, 0.1)
		end
	elseif slot0.dial_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.dial_timer)

		slot0.dial_timer = nil
	end
end

function DialActionMainPanel.updateKuangAnimate(slot0, slot1)
	if not slot0.dial_item_list or next(slot0.dial_item_list) == nil then
		return
	end

	slot0.item_panel:stopAllActions()
	slot0.item_panel:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(slot1), cc.CallFunc:create(function ()
		uv0.cur_pos_index = uv0.cur_pos_index + 1

		if uv0.cur_pos_index > #uv0.dial_item_list then
			uv0.cur_pos_index = 1
		end

		if uv0.dial_item_list[uv0.cur_pos_index] then
			slot0:showDialEffect(true)
		end

		if uv0.time_full_flag and uv0.result_index and uv0.cur_pos_index == uv0.result_index then
			uv0:openDialAniTimer(false)

			uv0.result_index = nil
			uv0.time_full_flag = false

			slot0:showDialEffect(true, PlayerAction.action_2)
			uv0.item_panel:stopAllActions()
			delayRun(uv0.main_container, 0.8, function ()
				uv0:sender16672()
				uv1:showDialAnimate()

				uv1.ani_showing = false
			end)
		end
	end))))
end

function DialActionMainPanel.hideAllItemEffect(slot0)
	for slot4, slot5 in pairs(slot0.dial_item_list) do
		slot5:setEffectVisible(false)
	end
end

function DialActionMainPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		ActionController:getInstance():cs16603(ActionRankCommonType.dial)
		uv0:sender16670()
		uv0:sender16674(2)
	end
end

function DialActionMainPanel.DeleteMe(slot0)
	if slot0.ani_showing then
		uv0:sender16672()
	end

	slot0:openDialAniTimer(false)

	if slot0.item_panel then
		slot0.item_panel:stopAllActions()
	end

	if slot0.record_scrollview then
		slot0.record_scrollview:DeleteMe()

		slot0.record_scrollview = nil
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	for slot4, slot5 in pairs(slot0.dial_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.gold_num then
		slot0.gold_num:DeleteMe()

		slot0.gold_num = nil
	end

	if slot0.update_dial_result_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dial_result_event)

		slot0.update_dial_result_event = nil
	end

	if slot0.update_dial_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dial_data_event)

		slot0.update_dial_data_event = nil
	end

	if slot0.update_dial_record_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dial_record_event)

		slot0.update_dial_record_event = nil
	end

	if slot0.update_action_dial_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_dial_event)

		slot0.update_action_dial_event = nil
	end

	if slot0.update_dial_gold_event then
		GlobalEvent:getInstance():UnBind(slot0.update_dial_gold_event)

		slot0.update_dial_gold_event = nil
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
end

DialGoodsItem = class("DialGoodsItem", function ()
	return ccui.Widget:create()
end)

function DialGoodsItem.ctor(slot0)
	slot0:configUI()
end

function DialGoodsItem.configUI(slot0)
	slot0.size = cc.size(119, 119)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)
end

function DialGoodsItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.other_type == 1 or slot1.other_type == 2 or slot1.other_type == 9 then
		slot0:showSpecialEffect(true)
	else
		slot0:showSpecialEffect(false)
	end

	slot0.dial_item = BackPackItem.new(true, true, false, 1, nil, true)

	slot0.dial_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.dial_item)

	if slot0.percent_sp then
		slot0.percent_sp:setVisible(false)
	end

	if slot0.percent_num then
		slot0.percent_num:setVisible(false)
	end

	if slot1.percent and slot1.percent > 0 then
		if not slot0.percent_sp then
			slot0.percent_sp = createSprite(PathTool.getResFrame("actiondial", "actiondial_1002"), slot0.size.width - 12, 14, slot0, cc.p(1, 0))
		end

		slot0.percent_sp:setVisible(true)

		if not slot0.percent_num then
			slot0.percent_num = CommonNum.new(1, slot0, 0, -1, cc.p(1, 0))

			slot0.percent_num:setPosition(cc.p(slot0.size.width - 42, 27))
		end

		slot0.percent_num:setVisible(true)
		slot0.percent_num:setNum(slot1.percent / 10)
		slot0.dial_item:setBaseData(slot1.id)
	elseif slot1.num and slot1.num > 0 then
		slot0.dial_item:setBaseData(slot1.id, slot1.num)
	else
		slot0.dial_item:setBaseData(slot1.id)
	end

	if DialActionConst.Dial_Item_Res[slot1.other_type] then
		slot0.dial_item:showFlagByRes(true, PathTool.getResFrame("actiondial", slot2))
	else
		slot0.dial_item:showFlagByRes(false)
	end
end

function DialGoodsItem.showDialEffect(slot0, slot1, slot2)
	if slot1 == true then
		slot3 = false

		if (slot2 or PlayerAction.action_1) == PlayerAction.action_2 then
			slot3 = true
		end

		if not tolua.isnull(slot0) and slot0.dial_effect == nil then
			slot0.dial_effect = createEffectSpine(Config.EffectData.data_effect_info[531], cc.p(slot0.size.width / 2, slot0.size.height / 2), cc.p(0.5, 0.5), slot3, slot2)

			slot0:addChild(slot0.dial_effect)
		elseif slot0.dial_effect then
			slot0.dial_effect:setVisible(true)
			slot0.dial_effect:setToSetupPose()
			slot0.dial_effect:setAnimation(0, slot2, slot3)
		end
	elseif slot0.dial_effect then
		slot0.dial_effect:clearTracks()
		slot0.dial_effect:removeFromParent()

		slot0.dial_effect = nil
	end
end

function DialGoodsItem.setEffectVisible(slot0, slot1)
	if slot0.dial_effect then
		slot0.dial_effect:setVisible(slot1)
	end
end

function DialGoodsItem.showSpecialEffect(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0) and slot0.special_effect == nil then
			slot0.special_effect = createEffectSpine(Config.EffectData.data_effect_info[533], cc.p(slot0.size.width / 2, slot0.size.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0:addChild(slot0.special_effect)
		end
	elseif slot0.special_effect then
		slot0.special_effect:clearTracks()
		slot0.special_effect:removeFromParent()

		slot0.special_effect = nil
	end
end

function DialGoodsItem.setItemScale(slot0, slot1)
	slot0.dial_item:setScale(slot1)
end

function DialGoodsItem.DeleteMe(slot0)
	if slot0.dial_item then
		slot0.dial_item:DeleteMe()

		slot0.dial_item = nil
	end

	if slot0.percent_num then
		slot0.percent_num:DeleteMe()

		slot0.percent_num = nil
	end

	slot0:showSpecialEffect(false)
	slot0:showDialEffect(false)
end

DialRecordMainItem = class("DialRecordMainItem", function ()
	return ccui.Widget:create()
end)

function DialRecordMainItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function DialRecordMainItem.configUI(slot0)
	slot0.size = cc.size(340, 30)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)
end

function DialRecordMainItem.register_event(slot0)
end

function DialRecordMainItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.record_txt then
		slot0.record_txt = createRichLabel(20, cc.c3b(232, 219, 185), cc.p(0, 0.5), cc.p(7, slot0.size.height / 2), nil, nil, 320)

		slot0:addChild(slot0.record_txt)
	end

	if slot1.bid and Config.ItemData.data_get_data(slot1.bid) then
		slot0.record_txt:setString(uv0(TI18N("<div fontcolor=5dff38>%s </div>获得%sX%d"), slot1.role_name, slot2.name, slot1.num))
	end
end

function DialRecordMainItem.DeleteMe(slot0)
end
