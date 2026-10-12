slot1 = CrossarenaController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
CrossarenaChallengePanel = CrossarenaChallengePanel or BaseClass()

function CrossarenaChallengePanel.__init(slot0, slot1)
	slot0.is_init = true
	slot0.parent = slot1
	slot0.ticket_bid = Config.ArenaClusterData.data_const.arena_ticket.val
	slot0.role_item_list = {}
	slot0.award_box_list = {}
	slot0.award_item_list = {}

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function CrossarenaChallengePanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("crossarena/crossarena_challenge_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot1 = slot0.container:getChildByName("bottom_panel")
	slot0.bottom_panel = slot1
	slot0.progress = slot1:getChildByName("progress_bg"):getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.progress_value = slot1:getChildByName("progress_value")
	slot0.add_item_btn = slot1:getChildByName("add_item_btn")
	slot0.btn_refresh = slot1:getChildByName("btn_refresh")
	slot0.btn_refresh_label = slot0.btn_refresh:getChildByName("label")

	slot0.btn_refresh_label:setString(TI18N("刷新"))

	if Config.ItemData.data_get_data(slot0.ticket_bid) then
		loadSpriteTexture(slot1:getChildByName("item_icon"), PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
	end

	slot0.item_num = slot1:getChildByName("item_num")

	slot1:getChildByName("title_my_rank"):setString(TI18N("我的排名:"))

	slot0.txt_my_rank = slot1:getChildByName("txt_my_rank")

	slot1:getChildByName("title_my_score"):setString(TI18N("我的积分:"))

	slot0.txt_my_score = slot1:getChildByName("txt_my_score")
	slot0.title_time = slot1:getChildByName("title_time")

	slot0.title_time:setString(TI18N("距本赛季结束:"))

	slot0.txt_time = slot1:getChildByName("txt_time")

	slot1:setPositionY(display.getBottom(main_container))
end

function CrossarenaChallengePanel.registerEvent(slot0)
	registerButtonEventListener(slot0.btn_refresh, function ()
		if uv0:checkCrossarenaIsOpen() then
			uv1:sender25609()
		end
	end, true)
	registerButtonEventListener(slot0.add_item_btn, function ()
		uv0:onClickAddItemBtn()
	end, true)

	if not slot0.update_my_info_event then
		slot0.update_my_info_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_MyBaseInfo_Event, function ()
			uv0:updateMyselfInfo()
		end)
	end

	if not slot0.update_open_status_event then
		slot0.update_open_status_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_Open_Status_Event, function ()
			uv0:updateMyselfInfo()
		end)
	end

	if not slot0.update_refresh_time_event then
		slot0.update_refresh_time_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_Refresh_Time_Event, function ()
			uv0:updateRefreshBtnStatus()
		end)
	end

	if not slot0.update_challenge_data_event then
		slot0.update_challenge_data_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_Challenge_Role_Event, function ()
			uv0:updateRoleItemList()
		end)
	end

	if not slot0.update_challenge_award_event then
		slot0.update_challenge_award_event = GlobalEvent:getInstance():Bind(CrossarenaEvent.Update_Challenge_Award_Event, function ()
			uv0:updateChallengeAwardInfo()
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateTicketNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateTicketNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateTicketNum(slot0, slot1)
		end)
	end
end

function CrossarenaChallengePanel.onClickAddItemBtn(slot0)
	ArenaController:getInstance():openArenaLoopChallengeBuy(true)
end

function CrossarenaChallengePanel.setVisibleStatus(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == true then
		slot0.is_init = false

		slot0:updateMyselfInfo()
		slot0:updateTicketNum()
		uv0:sender25610()
		uv0:sender25600()
		uv0:sender25601()
		uv0:sender25607()
	end
end

function CrossarenaChallengePanel.updateRoleItemList(slot0)
	for slot5, slot6 in ipairs(uv0:getChallengeRoleData()) do
		delayRun(slot0.container, slot5 / display.DEFAULT_FPS, function ()
			if not uv0.role_item_list[uv1] then
				uv0.role_item_list[uv1] = CrossareanRoleItem.New(uv0.container)
			end

			slot0:setData(uv2, uv1)
		end)
	end
end

function CrossarenaChallengePanel.updateMyselfInfo(slot0)
	if not uv0:getCrossarenaMyBaseInfo().rank or slot1.rank == 0 then
		slot0.txt_my_rank:setString(TI18N("暂无排名"))
	else
		slot0.txt_my_rank:setString(slot1.rank)
	end

	slot0.txt_my_score:setString(slot1.score or 0)

	slot2 = 0
	slot0.arena_open_status = uv0:getCrossarenaStatus()

	if slot0.arena_open_status == CrossarenaConst.Open_Status.Open then
		slot0.title_time:setString(TI18N("距本赛季结束:"))

		slot2 = (slot1.end_time or 0) - GameNet:getInstance():getTime()
	elseif (slot1.start_time or 0) - slot3 < 0 then
		slot0.title_time:setString(TI18N("距离玩法开始:"))

		slot2 = TimeTool.getOneDayLessTime()
	else
		slot0.title_time:setString(TI18N("距下赛季开始:"))
	end

	if slot2 <= 0 then
		slot0.txt_time:setString("00:00:00")
	else
		slot0:setLessTime(slot2)
	end

	slot0:updateRefreshBtnStatus()
end

function CrossarenaChallengePanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.txt_time) then
		return
	end

	slot0.txt_time:stopAllActions()

	if slot1 > 0 then
		slot0.txt_time:setString(TimeTool.GetTimeFormat(slot1))
		slot0.txt_time:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.txt_time:stopAllActions()
			else
				uv1.txt_time:setString(TimeTool.GetTimeFormat(uv0))
			end
		end))))
	else
		slot0.txt_time:stopAllActions()
		slot0.txt_time:setString(TimeTool.GetTimeFormat(slot1))
	end
end

function CrossarenaChallengePanel.updateRefreshBtnStatus(slot0)
	slot0.btn_refresh_label:stopAllActions()

	slot2 = GameNet:getInstance():getTime()

	if (uv0:getCrossarenaMyBaseInfo().ref_time or slot2) - slot2 <= 0 then
		setChildUnEnabled(false, slot0.btn_refresh)
		slot0.btn_refresh:setTouchEnabled(true)
		slot0.btn_refresh_label:setString(TI18N("刷新"))
		slot0.btn_refresh_label:enableOutline(Config.ColorData.data_color4[263], 2)
	else
		setChildUnEnabled(true, slot0.btn_refresh)
		slot0.btn_refresh:setTouchEnabled(false)
		slot0.btn_refresh_label:disableEffect(cc.LabelEffect.OUTLINE)
		slot0.btn_refresh_label:setString(uv1(TI18N("%d秒"), slot4))
		slot0.btn_refresh_label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				setChildUnEnabled(false, uv1.btn_refresh)
				uv1.btn_refresh:setTouchEnabled(true)
				uv1.btn_refresh_label:setString(TI18N("刷新"))
				uv1.btn_refresh_label:enableOutline(Config.ColorData.data_color4[263], 2)
			else
				uv1.btn_refresh_label:setString(uv2(TI18N("%d秒"), uv0))
			end
		end))))
	end
end

function CrossarenaChallengePanel.updateChallengeAwardInfo(slot0)
	if not uv0:getChallengeAwardData() then
		return
	end

	if not slot0.award_cfg then
		slot0.award_cfg = {}

		for slot5, slot6 in pairs(Config.ArenaClusterData.data_daily_award) do
			uv1(slot0.award_cfg, {
				num = slot5,
				award = slot6.items,
				effect_id = slot6.effect_id
			})
		end

		table.sort(slot0.award_cfg, SortTools.KeyLowerSorter("num"))
	end

	slot2 = slot0.award_cfg[#slot0.award_cfg].num
	slot7 = "/"

	slot0.progress_value:setString(slot1.had_combat_num .. slot7 .. slot2)

	slot6 = slot1.had_combat_num / slot2 * 100

	slot0.progress:setPercent(slot6)

	for slot6, slot7 in pairs(slot0.award_box_list) do
		slot7:setVisible(false)
	end

	for slot6, slot7 in ipairs(slot0.award_cfg) do
		if not slot0.award_box_list[slot6] then
			slot8 = CrossarenaAwardBoxItem.new(handler(slot0, slot0._onClickShowAwardTips))

			slot0.bottom_panel:addChild(slot8)

			slot0.award_box_list[slot6] = slot8
		end

		slot8:setPosition(cc.p(140 + slot7.num / slot2 * 279, 247))
		slot8:setData(slot7)
		slot8:setVisible(true)
	end
end

function CrossarenaChallengePanel._onClickShowAwardTips(slot0, slot1, slot2, slot3)
	if not slot0.tips_layer then
		slot0.tips_layer = ccui.Layout:create()

		slot0.tips_layer:setContentSize(cc.size(SCREEN_WIDTH, display.height))
		slot0.container:addChild(slot0.tips_layer)
		slot0.tips_layer:setTouchEnabled(true)
		slot0.tips_layer:setSwallowTouches(false)
		registerButtonEventListener(slot0.tips_layer, function ()
			uv0.tips_layer:setVisible(false)
		end, false, 1)
	end

	slot0.tips_layer:setVisible(true)

	if not slot0.tips_bg then
		slot0.tips_bg = createImage(slot0.tips_layer, PathTool.getResFrame("common", "common_1056"), 0, 0, cc.p(0, 0), true, 10, true)

		slot0.tips_bg:setTouchEnabled(true)
	end

	if slot0.tips_bg then
		slot4 = cc.size(BackPackItem.Width * 0.8 * #slot2 + 70 + (#slot2 - 1) * 15, BackPackItem.Height * 0.8 + 70)

		slot0.tips_bg:setContentSize(slot4)
		slot0.tips_bg:setAnchorPoint(cc.p(0.5, 0))

		if slot0.container:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(0, 0))).x - slot4.width / 2 < 0 then
			slot6.x = 10 + slot4.width / 2
		end

		slot6.y = slot6.y + 20

		slot0.tips_bg:setPosition(slot6)
	end

	for slot7, slot8 in pairs(slot0.award_item_list) do
		slot8:setVisible(false)
	end

	for slot7, slot8 in pairs(slot2) do
		if Config.ItemData.data_get_data(slot8[1]) then
			if not slot0.award_item_list[slot7] then
				slot9 = BackPackItem.new(nil, true, nil, 0.8)
				slot0.award_item_list[slot7] = slot9

				slot9:setAnchorPoint(cc.p(0, 0.5))
				slot0.tips_bg:addChild(slot9)
				slot9:setBaseData(slot8[1], slot8[2])
				slot9:setPosition(cc.p((BackPackItem.Width * 0.8 + 15) * (slot7 - 1) + 35, 95))
				slot9:setDefaultTip()
				slot9:setExtendDesc(true, slot10.name, 275)
			else
				slot9:setBaseData(slot8[1], slot8[2])
				slot9:setExtendDesc(true, slot10.name, 275)
				slot9:setPosition(cc.p((BackPackItem.Width * 0.8 + 15) * (slot7 - 1) + 35, 95))
				slot9:setVisible(true)
			end
		end
	end
end

function CrossarenaChallengePanel.updateTicketNum(slot0, slot1, slot2)
	if slot0.ticket_bid and slot1 and slot2 then
		if slot1 == BackPackConst.Bag_Code.BACKPACK then
			for slot6, slot7 in pairs(slot2) do
				if slot7 and slot7.base_id and slot0.ticket_bid == slot7.base_id then
					slot0.item_num:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.ticket_bid))

					break
				end
			end
		end
	elseif slot0.ticket_bid then
		slot0.item_num:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.ticket_bid))
	end
end

function CrossarenaChallengePanel.__delete(slot0)
	for slot4, slot5 in pairs(slot0.role_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.award_box_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.update_my_info_event then
		GlobalEvent:getInstance():UnBind(slot0.update_my_info_event)

		slot0.update_my_info_event = nil
	end

	if slot0.update_open_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_open_status_event)

		slot0.update_open_status_event = nil
	end

	if slot0.update_refresh_time_event then
		GlobalEvent:getInstance():UnBind(slot0.update_refresh_time_event)

		slot0.update_refresh_time_event = nil
	end

	if slot0.update_challenge_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_data_event)

		slot0.update_challenge_data_event = nil
	end

	if slot0.update_challenge_award_event then
		GlobalEvent:getInstance():UnBind(slot0.update_challenge_award_event)

		slot0.update_challenge_award_event = nil
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

CrossarenaAwardBoxItem = class("CrossarenaAwardBoxItem", function ()
	return ccui.Widget:create()
end)

function CrossarenaAwardBoxItem.ctor(slot0, slot1)
	slot0.call_back = slot1

	slot0:configUI()
	slot0:register_event()
end

function CrossarenaAwardBoxItem.configUI(slot0)
	slot0.size = cc.size(50, 50)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.container = ccui.Layout:create()

	slot0.container:setTouchEnabled(true)
	slot0.container:setContentSize(slot0.size)
	slot0.container:setAnchorPoint(0.5, 0.5)
	slot0.container:setPosition(cc.p(slot0.size.width / 2, slot0.size.height / 2))
	slot0:addChild(slot0.container)
end

function CrossarenaAwardBoxItem.register_event(slot0)
	registerButtonEventListener(slot0.container, function (slot0, slot1, slot2)
		if uv0.award_status == 2 then
			if uv0.data.num then
				uv1:sender25608(uv0.data.num)
			end
		elseif uv0.data and uv0.call_back then
			uv0:call_back(uv0.data.award, slot1:getTouchBeganPosition())
		end
	end)
end

function CrossarenaAwardBoxItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if not slot0.star_num_txt then
		slot0.star_num_txt = createLabel(22, cc.c3b(255, 248, 191), cc.c3b(0, 0, 0), slot0.size.width / 2, 5, "", slot0.container, 2, cc.p(0.5, 1))
	end

	slot0.star_num_txt:setString(slot1.num)
	slot0:updateEffectStatus()
end

function CrossarenaAwardBoxItem.updateEffectStatus(slot0)
	if not slot0.data then
		return
	end

	slot0.award_status = uv0:getChallengeAwardStatus(slot0.data.num)
	slot1 = PlayerAction.action_1

	if slot0.award_status == 2 then
		slot1 = PlayerAction.action_2
	elseif slot0.award_status == 3 then
		slot1 = PlayerAction.action_3
	end

	slot0:handleEffect(true, slot1)
end

function CrossarenaAwardBoxItem.handleEffect(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.container) and slot0.box_effect == nil and slot0.data then
			slot0.box_effect = createEffectSpine(Config.EffectData.data_effect_info[slot0.data.effect_id], cc.p(slot0.size.width / 2, 8), cc.p(0.5, 0.5), true, slot2)

			slot0.container:addChild(slot0.box_effect)
		elseif slot0.box_effect and (not slot0.cur_action_name or slot0.cur_action_name ~= slot2) then
			slot0.box_effect:setToSetupPose()
			slot0.box_effect:setAnimation(0, slot2, true)
		end

		slot0.cur_action_name = slot2
	elseif slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end
end

function CrossarenaAwardBoxItem.DeleteMe(slot0)
	slot0:handleEffect(false)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
