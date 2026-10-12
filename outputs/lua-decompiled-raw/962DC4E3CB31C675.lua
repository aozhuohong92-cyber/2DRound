slot0 = EliteSummonController:getInstance()
slot1 = Config.RecruitHolidayLuckyData.data_award
slot2 = Config.RecruitHolidayLuckyData.data_const
slot3 = Config.RecruitHolidayLuckyData.data_summon
slot4 = Config.RecruitHolidayLuckyData.data_action
slot5 = Config.RecruitHolidayLuckyData.data_wish
slot6 = table.insert
slot7 = table.remove
SelectEliteSummonPanel = class("SelectEliteSummonPanel", function ()
	return ccui.Widget:create()
end)

function SelectEliteSummonPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitesummon", "elitesummon"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("selectelitesummon", "selectelitesummon"),
			type = ResourcesType.plist
		}
	}
	slot0.touch_recruit_10 = true
	slot0.is_can_award = false
	slot0.recruit_type_1 = nil
	slot0.recruit_type_10 = nil
	slot0.box_list = {}
	slot0.up_hero_list = {}
	slot0.up_hero_id = 0
	slot0.box_pos = {
		[2] = cc.p(113, 434),
		[3] = cc.p(168, 600),
		[4] = cc.p(360, 672),
		[5] = cc.p(546, 600),
		[6] = cc.p(601, 434)
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function SelectEliteSummonPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SelectEliteSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elitesummon/select_elitesummon_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container = slot1
	slot0.bg_load = loadSpriteTextureFromCDN(slot1:getChildByName("image_bg"), PathTool.getPlistImgForDownLoad("selectelitesummon", "selectelitesummon_bg"), ResourcesType.single, slot0.bg_load)
	slot0.btn_summon_1 = slot1:getChildByName("btn_summon_1")

	slot0.btn_summon_1:getChildByName("Text_8"):setString(TI18N("招募1次"))

	slot0.remain_time = createRichLabel(18, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(120.5, 23))

	slot0.btn_summon_1:addChild(slot0.remain_time)

	slot0.btn_summon_10 = slot1:getChildByName("btn_summon_10")

	slot0.btn_summon_10:getChildByName("Text_8"):setString(TI18N("招募10次"))

	slot0.icon_10 = slot0.btn_summon_10:getChildByName("Sprite_7")
	slot0.count_10 = slot0.btn_summon_10:getChildByName("count")

	slot0.count_10:setString("")

	slot0.btn_reward = slot1:getChildByName("btn_reward")

	slot0.btn_reward:getChildByName("Text_9"):setString(TI18N("点击选择up英雄"))

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.add_btn = slot1:getChildByName("add_btn")
	slot0.icon = slot1:getChildByName("icon")
	slot0.icon_count = slot1:getChildByName("icon_count")

	slot0.icon_count:setString("")

	if Config.ItemData.data_get_data(uv0.common_s.val) then
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot4.icon), LOADTEXT_TYPE)
		slot0.icon:setScale(0.45)
	end

	slot0.summon_item_bid = uv0.common_s.val

	slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))

	slot0.holiday_time = slot1:getChildByName("time")

	slot1:getChildByName("next_level_text"):setString(TI18N("下一阶段"))

	slot0.next_text = slot1:getChildByName("next_text")

	slot0.next_text:setString("")

	slot0.bar = slot1:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)
	slot0.bar:setPercent(0)

	slot0.remain_up = createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(1, 0.5), cc.p(659, 803))
	slot9 = slot0.remain_up

	slot1:addChild(slot9)

	for slot9 = 1, 6 do
		slot10 = slot1:getChildByName("box_" .. slot9)
		slot10.icon = slot10:getChildByName("icon")
		slot0.box_list[slot9] = slot10

		if slot9 == 1 then
			slot0.up_img = slot10:getChildByName("up_img")

			slot0.up_img:setVisible(false)
		elseif slot9 == 6 then
			slot10:setVisible(false)
		end
	end

	slot0.award_item = BackPackItem.new(true, true, false, 0.6)

	slot0.award_item:setPosition(cc.p(40, 728))
	slot0.award_item:addCallBack(handler(slot0, slot0.onClickAwardItem))
	slot1:addChild(slot0.award_item)
	uv1:send23230()
	slot0:showItemAction(true)

	slot0.res_check_3 = slot0.main_container:getChildByName("res_check_3"):setSelected(SysEnv:getInstance():getBool(SysEnv.keys.res_check_3, false))
	slot0.res_check_4 = slot0.main_container:getChildByName("res_check_4"):setSelected(SysEnv:getInstance():getBool(SysEnv.keys.res_check_4, false))
	slot0.btn_skip_ani = slot0.main_container:getChildByName("btn_skip_ani"):setSelected(SysEnv:getInstance():getBool(SysEnv.keys.skip_recruit_anim, false))

	print("SelectEliteSummonPanel.setVisibleStatus------------------", slot0.setVisibleStatus)

	slot0.res3_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "分解1~3星英雄", slot0.res_check_3, 1)
	slot0.res4_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "分解四星英雄", slot0.res_check_4, 1)
	slot0.skip_ani_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "跳过招募动画", slot0.btn_skip_ani, 1)
end

function SelectEliteSummonPanel.onClickAwardItem(slot0)
	if slot0.data then
		if slot0.is_can_award then
			slot1 = false

			for slot5, slot6 in pairs(slot0.data.reward_list) do
				if slot6.id == 5 then
					slot1 = true

					break
				end
			end

			if uv0[slot0.data.camp_id][5].self_reward[1] and slot1 == false and slot0.data.times >= 300 then
				slot2 = uv0[slot0.data.camp_id][5]
				slot2.status = true

				TimesummonController:getInstance():openHeroSelectView(true, slot2, slot0.data.times)
			else
				if slot0:nextCount(slot0.data.times) < #uv0[slot0.data.camp_id] then
					slot2 = slot2 - 1
				end

				if uv0[slot0.data.camp_id] and uv0[slot0.data.camp_id][slot2] then
					slot3, slot4 = slot0:getBaoDIStatus()

					if uv0[slot0.data.camp_id][slot2].reward[1] then
						uv1:send23232(uv0[slot0.data.camp_id][slot4].id, 0)
					elseif slot0:getIndex() and slot0.can_id then
						uv1:send23232(slot0.can_id, 0)
					else
						TimesummonController:getInstance():openTimeSummonProgressView(true, slot0.data.times, slot0.data.camp_id, slot0.up_hero_id, slot0.data.reward_list)
					end
				end
			end
		else
			TimesummonController:getInstance():openTimeSummonProgressView(true, slot0.data.times, slot0.data.camp_id, slot0.up_hero_id, slot0.data.reward_list)
		end
	end
end

function SelectEliteSummonPanel.getIndex(slot0)
	slot4 = slot0.data.camp_id

	for slot4, slot5 in pairs(uv0[slot4]) do
		if slot5.reward[1] then
			slot6 = false
			slot7 = nil

			for slot11, slot12 in pairs(slot0.data.reward_list) do
				if slot12.id == slot5.id then
					slot6 = true

					break
				end
			end

			if slot6 == false then
				return slot5.id
			end
		end
	end

	return nil
end

function SelectEliteSummonPanel.setCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1)

	if slot2 - GameNet:getInstance():getTime() > 0 then
		function (slot0)
			if tolua.isnull(uv0) then
				return
			end

			if slot0 > 0 then
				uv0:setString(string.format(TI18N("<div fontcolor=#35FF14>%s</div>%s"), TimeTool.GetTimeFormat(slot0), "后免费"))
			else
				doStopAllActions(uv0)
				uv0:setString(TI18N("免费召唤"))
			end
		end(slot2)
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1)
				uv1:setString(TI18N("免费召唤"))
			else
				uv2(uv0)
			end
		end))))
	else
		slot3(slot2)
	end
end

function SelectEliteSummonPanel.register_event(slot0)
	if slot0.box_list then
		for slot4, slot5 in pairs(slot0.box_list) do
			registerButtonEventListener(slot5, function ()
				if uv0.up_hero_list[uv1] and Config.ItemData.data_get_data(uv0.up_hero_list[uv1]) then
					TipsManager:getInstance():showGoodsTips(Config.ItemData.data_get_data(uv0.up_hero_list[uv1]))
				end
			end, false)
		end
	end

	if not slot0.message_event then
		slot0.message_event = GlobalEvent:getInstance():Bind(EliteSummonEvent.SelectEliteSummon_Message, function (slot0)
			if not slot0 then
				return
			end

			if uv0:getModel():isHolidayLuckyHasID(slot0.camp_id) then
				uv1:setData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.add_btn, function ()
		if ActionController:getInstance():getActionSubTabVo(ActionRankCommonType.trause_grade_shop) and slot0.action_operate and slot0.action_operate.tab_list[slot1.bid] then
			slot0.action_operate:handleSelectedTab(slot0.action_operate.tab_list[slot1.bid])
		else
			message(TI18N("该活动已结束或未到开启时间段"))
		end
	end, true)
	registerButtonEventListener(slot0.btn_reward, function ()
		uv0:openSummonSelectWindow(true)
	end, true)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if uv0.data and uv0.data.camp_id and uv1[uv0.data.camp_id] then
			slot4 = Config.RecruitHolidayLuckyData.data_probability[slot3.group_id]

			TimesummonController:getInstance():openTimeSummonAwardView(true, slot3.group_id, uv0.data, TimesummonConst.ActonInfoType.EliteType2)
		end
	end, true, nil, , 0.8)
	registerButtonEventListener(slot0.btn_summon_1, function ()
		if not uv0.up_hero_id or uv0.up_hero_id <= 0 then
			message(TI18N("请选择up英雄后开启召唤"))

			return
		end

		if uv0.recruit_type_1 then
			if uv0.recruit_type_1 == 3 then
				if uv0.data and uv0.data.camp_id then
					uv0:RecruitDaimond(1)
				end
			else
				uv1:send23231(1, uv0.recruit_type_1)
			end
		end
	end, true)
	registerButtonEventListener(slot0.btn_summon_10, function ()
		if not uv0.up_hero_id or uv0.up_hero_id <= 0 then
			message(TI18N("请选择up英雄后开启召唤"))

			return
		end

		if not uv0.touch_recruit_10 then
			message(TI18N("点击过快~~~"))

			return
		end

		if uv0.recruit_10_ticket == nil then
			uv0.recruit_10_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.touch_recruit_10 = true

				if uv0.recruit_10_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.recruit_10_ticket)

					uv0.recruit_10_ticket = nil
				end
			end, 2)
		end

		uv0.touch_recruit_10 = nil

		if uv0.recruit_type_10 then
			if uv0.recruit_type_10 == 3 then
				uv0:RecruitDaimond(10)
			else
				uv1:send23231(10, uv0.recruit_type_10)
			end
		end
	end, true)

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

	if not slot0.update_hero then
		slot0.update_hero = GlobalEvent:getInstance():Bind(PartnersummonEvent.updateSummonItemEvent, function (slot0)
			if slot0 then
				if SysEnv:getInstance():getBool(SysEnv.keys.res_check_3, false) and SysEnv:getInstance():getBool(SysEnv.keys.res_check_4, false) then
					NewPartnerSummonWindow:newHerolList(slot0, 0)
				elseif slot2 then
					NewPartnerSummonWindow:newHerolList(slot0, 4)
				elseif slot1 then
					NewPartnerSummonWindow:newHerolList(slot0, 3)
				end
			end
		end)
	end

	slot0.btn_skip_ani:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.skip_recruit_anim, true, true)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.skip_recruit_anim, false, true)
		end
	end)
	slot0.res_check_3:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.res_check_3, true, true)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.res_check_3, false, true)
		end
	end)
	slot0.res_check_4:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.res_check_4, true, true)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.res_check_4, false, true)
		end
	end)
end

function SelectEliteSummonPanel.RecruitDaimond(slot0, slot1)
	message(TI18N("道具不足"))
end

function SelectEliteSummonPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.summon_item_bid and slot1 and slot2 and slot1 == BackPackConst.Bag_Code.BACKPACK then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.base_id and slot0.summon_item_bid == slot7.base_id then
				if slot0.icon_count then
					slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))
				end

				slot0:recruitBtnStatus(1)
				slot0:recruitBtnStatus(10)

				break
			end
		end
	end
end

function SelectEliteSummonPanel.setData(slot0, slot1)
	slot0.data = slot1

	slot0:recruitBtnStatus(1)
	slot0:recruitBtnStatus(10)
	slot0:setCountDownTime(slot0.remain_time, slot1.free_time)
	slot0.holiday_time:setString(string.format("%s-%s", TimeTool.getMD2(slot1.start_time), TimeTool.getMD2(slot1.end_time)))
	slot0:updateUpHeroInfo()
	slot0:nextRewardLevel()
end

function SelectEliteSummonPanel.updateUpHeroInfo(slot0)
	slot1 = {}

	if uv0[slot0.data.camp_id] then
		for slot6, slot7 in pairs(slot2) do
			if slot7.sort_2 ~= 0 then
				uv1(slot1, {
					id = slot6,
					sort = slot7.sort_2
				})
			else
				uv1(slot1, {
					id = slot6,
					sort = slot7.sort
				})
			end
		end

		table.sort(slot1, function (slot0, slot1)
			return slot0.sort < slot1.sort
		end)
	end

	slot0.up_hero_id = slot0.data.lucky_bid

	if slot0.up_hero_id and slot0.up_hero_id > 0 then
		for slot6, slot7 in pairs(slot1) do
			if slot7.id and slot7.id == slot0.up_hero_id then
				slot1[slot6].id = slot1[1].id
				slot1[1].id = slot1[slot6].id

				break
			end
		end

		slot0:showGuideEffect(false)

		if slot0.up_img then
			slot0.up_img:setVisible(true)
		end
	else
		slot0:showGuideEffect(true)

		if slot0.up_img then
			slot0.up_img:setVisible(false)
		end
	end

	slot3 = #slot1
	slot0.up_hero_list = slot1

	if slot0.box_list then
		for slot7, slot8 in ipairs(slot0.box_list) do
			if slot8.icon and type(slot1[slot7]) == "table" and slot1[slot7] and slot1[slot7].id and Config.ItemData.data_get_data(slot1[slot7].id) then
				loadSpriteTexture(slot8.icon, PathTool.getItemRes(slot9.icon), LOADTEXT_TYPE)
			end

			if slot3 == 6 and slot7 >= 2 and slot0.box_pos[slot7] then
				slot8:setPosition(slot0.box_pos[slot7])

				if slot7 == 6 then
					slot8:setVisible(true)
				end
			end
		end
	end

	slot4 = TI18N("<div outline=2,#000000>累计一定招募次数必出up英雄</div>")

	if slot0.up_hero_id and slot0.up_hero_id > 0 then
		if not slot0.baodi_item then
			slot0.baodi_item = BackPackItem.new(true, true, false, 0.35)

			slot0.baodi_item:setDefaultTip()
			slot0.baodi_item:setPosition(cc.p(378, 803))
			slot0.main_container:addChild(slot0.baodi_item)
		end

		slot0.baodi_item:setBaseData(slot0.up_hero_id, 1)
		slot0.baodi_item:setVisible(true)

		if slot0.data then
			slot4 = string.format(TI18N("<div outline=2,#000000>剩余</div><div fontcolor=#5fde46 fontsize=20 outline=2,#000000>%d</div><div outline=2,#000000>次招募内必出UP英雄</div>"), slot0.data.must_count)
		end
	elseif slot0.baodi_item then
		slot0.baodi_item:setVisible(false)
	end

	slot0.remain_up:setString(slot4)
end

function SelectEliteSummonPanel.nextRewardLevel(slot0)
	slot1 = slot0:nextCount(slot0.data.times)

	if uv0[slot0.data.camp_id] and uv0[slot0.data.camp_id][slot1] then
		slot2 = uv0[slot0.data.camp_id]

		if slot0.award_item and slot2[slot1].reward then
			slot3, slot4 = nil

			if slot2[slot1].reward[1] then
				slot3 = slot2[slot1].reward[1][1]
				slot4 = slot2[slot1].reward[1][2]
			else
				slot3 = 39093
				slot4 = 0
			end

			slot0.award_item:setBaseData(slot3, slot4)

			slot0.is_can_award, can_id = slot0:getBaoDIStatus()

			if slot0.is_can_award == true then
				if can_id then
					slot5, slot6 = nil

					if slot2[can_id].reward[1] then
						slot5 = slot2[can_id].reward[1][1]
						slot6 = slot2[can_id].reward[1][2]
					else
						slot5 = 39093
						slot6 = 0
					end

					slot0.can_id = can_id

					slot0.award_item:setBaseData(slot5, slot6)
				end

				slot0.award_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
			else
				slot0.award_item:showItemEffect(false)
			end

			if slot0.is_can_award == false and slot2[#slot2].times <= slot0.data.times then
				setChildUnEnabled(true, slot0.award_item)
				slot0.award_item:setReceivedIcon(true)
			end
		end

		slot3 = slot2[slot1].times

		slot0.next_text:setString(slot0.data.times .. "/" .. slot3)

		slot4 = 0
		slot5 = slot3

		if slot1 == 1 then
			slot4 = slot0.data.times
		else
			slot4 = slot0.data.times - slot2[slot1 - 1].times
			slot5 = slot3 - slot2[slot1 - 1].times
		end

		slot6 = slot4 / slot5 * 100

		if slot2[#slot2].times <= slot0.data.times then
			slot6 = 100
		end

		slot0.bar:setPercent(slot6)
	end
end

function SelectEliteSummonPanel.nextCount(slot0, slot1)
	slot2 = 1
	slot3 = uv0[slot0.data.camp_id]

	if uv0 and slot3 then
		if slot3[#slot3].times <= slot1 then
			return slot3[#slot3].id
		end

		for slot7 = 1, #slot3 do
			if slot7 + 1 >= #slot3 then
				slot8 = #slot3
			end

			if slot1 < slot3[slot7].times and slot1 <= slot3[slot8].times then
				slot2 = slot3[slot7].id

				break
			end
		end
	end

	return slot2
end

function SelectEliteSummonPanel.getBaoDIStatus(slot0)
	slot1 = false
	slot2 = nil

	if slot0.data and uv0[slot0.data.camp_id] then
		slot6 = slot0.data.camp_id

		for slot6, slot7 in ipairs(uv0[slot6]) do
			slot8 = false
			slot9 = nil

			if slot7.times <= slot0.data.times then
				slot8 = true
				slot9 = slot7.id
			end

			slot10 = true

			if slot8 == true then
				for slot14, slot15 in pairs(slot0.data.reward_list) do
					if slot15.id == slot9 then
						slot10 = false

						break
					end
				end
			end

			if slot9 and slot10 == true then
				slot1 = true
				slot2 = slot9
			end
		end
	end

	return slot1, slot2
end

function SelectEliteSummonPanel.recruitBtnStatus(slot0, slot1)
	if slot0.data and slot0.data.camp_id and uv0[slot0.data.camp_id] and uv1 and uv1[slot2.group_id] then
		if slot1 <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid) then
			slot5 = nil

			if slot1 == 1 then
				slot0.recruit_type_1 = 4
				slot5 = Config.ItemData.data_get_data(uv1[slot2.group_id].loss_item_once[1][1])
			elseif slot1 == 10 then
				slot0.recruit_type_10 = 4
				slot5 = Config.ItemData.data_get_data(slot3.loss_item_ten[1][1])
			end

			if slot5 then
				loadSpriteTexture(slot0.icon_10, PathTool.getItemRes(slot5.icon), LOADTEXT_TYPE)
				slot0.icon_10:setScale(0.3)

				if slot1 == 1 then
					slot0.count_10:setString(slot3.loss_item_once[1][2])
				elseif slot1 == 10 then
					slot0.count_10:setString(slot3.loss_item_ten[1][2])
				end
			end
		else
			slot5 = nil

			if slot1 == 1 then
				slot0.recruit_type_1 = 3
				slot5 = Config.ItemData.data_get_data(slot3.loss_gold_once[1][1])
			elseif slot1 == 10 then
				slot0.recruit_type_10 = 3
				slot5 = Config.ItemData.data_get_data(slot3.loss_gold_ten[1][1])
			end

			slot0.count_10:setString("道具不足")
		end

		if slot0.data.free_time <= 0 then
			slot0.recruit_type_1 = 1
		end
	end
end

function SelectEliteSummonPanel.showItemAction(slot0, slot1)
	if slot1 == true then
		if slot0.box_list then
			for slot5, slot6 in pairs(slot0.box_list) do
				slot6:stopAllActions()
				delayRun(slot6, math.random(1, 10) / 10, function ()
					slot0 = 5
					slot3 = math.random(1, 10)
					slot4 = cc.Sequence:create(cc.MoveBy:create(2, cc.p(0, -slot0)), cc.MoveBy:create(2, cc.p(0, slot0)))

					if math.random(1, 2) == 2 then
						slot4 = cc.Sequence:create(slot2, slot1)
					end

					uv0:runAction(cc.RepeatForever:create(cc.Spawn:create(slot4, cc.Sequence:create(cc.FadeTo:create(1, 170), cc.FadeTo:create(1, 255)))))
				end)
			end
		end
	elseif slot0.box_list then
		for slot5, slot6 in pairs(slot0.box_list) do
			slot6:stopAllActions()
		end
	end
end

function SelectEliteSummonPanel.showGuideEffect(slot0, slot1)
	if slot1 == true then
		if not slot0.guide_effect_2 then
			if slot0.btn_reward then
				slot0.guide_effect_2 = createEffectSpine(PathTool.getEffectRes(240), cc.p(slot0.btn_reward:getContentSize().width / 2 + 60, slot0.btn_reward:getContentSize().height / 2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

				slot0.btn_reward:addChild(slot0.guide_effect_2)
			end
		else
			slot0.guide_effect_2:setAnimation(0, PlayerAction.action_1, true)
		end
	elseif slot0.guide_effect_2 then
		slot0.guide_effect_2:removeFromParent()

		slot0.guide_effect_2 = nil
	end
end

function SelectEliteSummonPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function SelectEliteSummonPanel.DeleteMe(slot0)
	slot0:showItemAction(false)
	slot0:showGuideEffect(false)
	doStopAllActions(slot0.remain_time)

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.award_item then
		slot0.award_item:DeleteMe()

		slot0.award_item = nil
	end

	if slot0.baodi_item then
		slot0.baodi_item:DeleteMe()

		slot0.baodi_item = nil
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.message_event then
		GlobalEvent:getInstance():UnBind(slot0.message_event)

		slot0.message_event = nil
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

	if slot0.recruit_10_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.recruit_10_ticket)

		slot0.recruit_10_ticket = nil
	end
end
