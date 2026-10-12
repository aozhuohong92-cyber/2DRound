slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ActionSweetPanel = class("ActionSweetPanel", function ()
	return ccui.Widget:create()
end)

function ActionSweetPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1 or ActionRankCommonType.sweet
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionsweet", "actionsweet"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionsweet", "txt_cn_actionsweet_bg", true),
			type = ResourcesType.single
		}
	}
	slot0._init_flag = false
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)
end

function ActionSweetPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:registerEvent()
	uv0:sender28500()
	RankController:getInstance():send_12900(RankConstant.RankType.sweet, 1, 3)

	slot0._init_flag = true

	slot0:updateItemNum()
end

function ActionSweetPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("actionsweet/action_sweet_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1

	slot1:getChildByName("image_bg"):loadTexture(PathTool.getPlistImgForDownLoad("actionsweet", "txt_cn_actionsweet_bg", true), LOADTEXT_TYPE)

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.btn_shop = slot1:getChildByName("btn_shop")

	slot0.btn_shop:getChildByName("label"):setString(TI18N("积分币商城"))

	slot0.btn_task = slot1:getChildByName("btn_task")

	slot0.btn_task:getChildByName("label"):setString(TI18N("国庆节节任务"))

	slot0.btn_award = slot1:getChildByName("btn_award")
	slot0.check_rank_txt = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(613, 621))

	slot0.check_rank_txt:setString(uv0("<div fontcolor=#c44144 href=xxx>%s</div>", TI18N("点击查看更多")))
	slot0.check_rank_txt:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:onClickRankBtn()
	end, {
		"click",
		"href"
	})
	slot1:addChild(slot0.check_rank_txt)

	slot0.time_txt = slot1:getChildByName("time_txt")
	slot0.lev_txt = slot1:getChildByName("lev_txt")
	slot0.my_score_txt = slot1:getChildByName("my_score_txt")
	slot6 = TI18N

	slot1:getChildByName("rank_title"):setString(slot6("积分榜"))

	slot0.rank_object_list = {}

	for slot6 = 1, 3 do
		slot7 = {
			rank_name_txt = slot1:getChildByName("rank_name_" .. slot6)
		}

		slot7.rank_name_txt:setString(TI18N("虚位以待"))

		slot7.rank_score_txt = slot1:getChildByName("rank_score_" .. slot6)

		slot7.rank_score_txt:setString(0)
		uv1(slot0.rank_object_list, slot7)
	end

	slot0.progress = slot1:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot6 = "progress_val"
	slot0.progress_val = slot1:getChildByName(slot6)
	slot0.item_object_list = {}

	for slot6 = 1, 3 do
		if slot1:getChildByName("item_icon_" .. slot6) then
			slot8 = {
				item_btn = slot7,
				item_num_txt = slot7:getChildByName("num_txt"),
				item_name_txt = slot7:getChildByName("name_txt"),
				item_use_txt = slot7:getChildByName("use_txt"),
				add_item_btn = slot7:getChildByName("add_item_btn")
			}
			slot9 = nil
			slot10 = 0

			if slot6 == 1 and Config.HolidayValentinesData.data_const.holiday_item1 then
				slot9 = Config.HolidayValentinesData.data_const.holiday_item1.val
				slot10 = Config.HolidayValentinesData.data_const.holiday_score1.val
			elseif slot6 == 2 and Config.HolidayValentinesData.data_const.holiday_item2 then
				slot9 = Config.HolidayValentinesData.data_const.holiday_item2.val
				slot10 = Config.HolidayValentinesData.data_const.holiday_score2.val
			elseif Config.HolidayValentinesData.data_const.holiday_item3 then
				slot9 = Config.HolidayValentinesData.data_const.holiday_item3.val
				slot10 = Config.HolidayValentinesData.data_const.holiday_score3.val
			end

			slot8.item_use_txt:setString("+" .. slot10)
			slot8.item_use_txt:setVisible(true)

			if Config.ItemData.data_get_data(slot9) then
				slot8.item_bid = slot9

				slot7:loadTexture(PathTool.getItemRes(slot11.icon), LOADTEXT_TYPE)
				slot8.item_name_txt:setString(slot11.name)
			end

			uv1(slot0.item_object_list, slot8)
		end
	end

	slot1:getChildByName("tips_txt"):setString(TI18N("长按可连续捐赠"))
end

function ActionSweetPanel.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_shop, handler(slot0, slot0.onClickShopBtn), true)
	registerButtonEventListener(slot0.btn_task, handler(slot0, slot0.onClickTaskBtn), true)
	registerButtonEventListener(slot0.btn_rule, handler(slot0, slot0.onClickRuleBtn), true)

	slot4 = handler(slot0, slot0.onClickAwardBtn)
	slot5 = true

	registerButtonEventListener(slot0.btn_award, slot4, slot5)

	for slot4, slot5 in ipairs(slot0.item_object_list) do
		if slot5.add_item_btn then
			registerButtonEventListener(slot5.add_item_btn, function ()
				uv0:onClickAddItemBtn(uv1)
			end, true)
		end

		if slot5.item_btn then
			slot5.item_btn:addTouchEventListener(function (slot0, slot1)
				TipsManager:getInstance():showCompChooseTips(true, uv0.item_object_list[uv1].item_bid, 3)
			end)
		end
	end

	if not slot0.get_sweet_data_event then
		slot0.get_sweet_data_event = GlobalEvent:getInstance():Bind(ActionEvent.Update_Sweet_Data_Event, function ()
			uv0:setData()
		end)
	end

	if not slot0.get_rank_data_event then
		slot0.get_rank_data_event = GlobalEvent:getInstance():Bind(RankEvent.RankEvent_Get_Rank_data, function (slot0)
			uv0:setRankData(slot0)
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateItemNum(slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateItemNum(slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateItemNum(slot1)
		end)
	end
end

function ActionSweetPanel.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.HolidayValentinesData.data_const.holiday_rule then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition())
	end
end

function ActionSweetPanel.onClickRankBtn(slot0)
	RankController:getInstance():openSingleRankMainWindow(true, {
		rank_type = RankConstant.RankType.sweet,
		title_name = TI18N("排行榜"),
		show_tips = TI18N("奖励将在活动结束后通过邮件发放")
	}, RankConstant.Rank_Type.Rank)
end

function ActionSweetPanel.onClickShopBtn(slot0)
	MallController:getInstance():openMallActionWindow(true, slot0.holiday_bid)
end

function ActionSweetPanel.onClickTaskBtn(slot0)
	if Config.HolidayValentinesData.data_const.holiday_quester then
		if ActionController:getInstance():getActionSubTabVo(Config.HolidayValentinesData.data_const.holiday_quester.val) and slot2.action_operate and slot2.action_operate.tab_list[slot3.bid] then
			slot2.action_operate:handleSelectedTab(slot2.action_operate.tab_list[slot3.bid])
		else
			message(TI18N("前往的活动已结束哦"))
		end
	end
end

function ActionSweetPanel.onClickAwardBtn(slot0)
	uv0:openActionSweetAwardWindow(true)
end

function ActionSweetPanel.onClickAddItemBtn(slot0)
	if Config.HolidayValentinesData.data_const.item_gain then
		if ActionController:getInstance():getActionSubTabVo(Config.HolidayValentinesData.data_const.item_gain.val) and slot2.action_operate and slot2.action_operate.tab_list[slot3.bid] then
			slot2.action_operate:handleSelectedTab(slot2.action_operate.tab_list[slot3.bid])
		else
			message(TI18N("前往的砸蛋商城购买"))
		end
	end
end

function ActionSweetPanel.onClickPutItemBtn(slot0, slot1)
	if slot0.last_click_time and os.clock() - slot0.last_click_time < 0.3 then
		return
	end

	if not slot0.item_object_list[slot1] then
		return
	end

	uv0:sender28502(slot3.item_bid, 1)

	slot0.last_click_time = slot2
end

function ActionSweetPanel.updateItemNum(slot0, slot1)
	if slot1 then
		for slot5, slot6 in pairs(slot1) do
			for slot10, slot11 in pairs(slot0.item_object_list) do
				if slot6.base_id and slot11.item_bid and slot6.base_id == slot11.item_bid and slot11.item_num_txt then
					slot11.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot11.item_bid))

					break
				end
			end
		end
	else
		for slot5, slot6 in pairs(slot0.item_object_list) do
			if slot6.item_bid and slot6.item_num_txt then
				slot6.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot6.item_bid))
			end
		end
	end
end

function ActionSweetPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:sender28500()
	end
end

function ActionSweetPanel.setData(slot0)
	if not uv0:getSweetData() then
		return
	end

	commonCountDownTime(slot0.time_txt, slot1.end_time or 0, {
		time_title = TI18N("剩余时间:")
	})
	slot0.lev_txt:setString((slot1.lev or 0) .. TI18N("级"))
	slot0.progress:setPercent(slot1.score / slot1.max_score * 100)
	slot0.progress_val:setString(slot1.score .. "/" .. slot1.max_score)
	slot0.my_score_txt:setString(TI18N("我的积分:") .. (slot1.my_score or 0))

	if not tolua.isnull(slot0.btn_award) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(20, 18), cc.p(0, 0), true, PlayerAction.action_1)

		slot0.btn_award:addChild(slot0.box_effect)
	end

	if slot0.box_effect then
		slot6 = nil
		slot6 = (not uv0:getSweetAwardStatus() or PlayerAction.action_2) and PlayerAction.action_1

		if not slot0.cur_act_name or slot0.cur_act_name ~= slot6 then
			slot0.cur_act_name = slot6

			slot0.box_effect:setToSetupPose()
			slot0.box_effect:setAnimation(0, slot6, true)
		end
	end
end

function ActionSweetPanel.setRankData(slot0, slot1)
	if not slot1 or not slot1.rank_list then
		return
	end

	for slot6 = 1, 3 do
		slot7 = slot0.rank_object_list[slot6]

		if (function (slot0)
			for slot4, slot5 in pairs(uv0.rank_list) do
				if slot5.idx == slot0 then
					return slot5
				end
			end
		end)(slot6) then
			slot7.rank_name_txt:setString(slot8.name)
			slot7.rank_score_txt:setString(slot8.val1)
		else
			slot7.rank_name_txt:setString(TI18N("虚位以待"))
			slot7.rank_score_txt:setString(0)
		end
	end
end

function ActionSweetPanel.DeleteMe(slot0)
	if slot0.get_sweet_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_sweet_data_event)

		slot0.get_sweet_data_event = nil
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

	if slot0.get_rank_data_event then
		GlobalEvent:getInstance():UnBind(slot0.get_rank_data_event)

		slot0.get_rank_data_event = nil
	end

	if slot0.clickTimer then
		GlobalTimeTicket:getInstance():remove(slot0.clickTimer)

		slot0.clickTimer = nil
	end

	for slot4, slot5 in pairs(slot0.item_object_list) do
		if slot5.item_use_txt then
			slot5.item_use_txt:stopAllActions()
		end
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end
end
