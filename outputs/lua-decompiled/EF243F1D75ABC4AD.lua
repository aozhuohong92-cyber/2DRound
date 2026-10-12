slot0 = EliteSummonController:getInstance();
slot1 = Config.RecruitHolidayEliteData.data_award;
slot2 = Config.RecruitHolidayEliteData.data_const;
slot3 = Config.RecruitHolidayEliteData.data_summon;
slot4 = Config.RecruitHolidayEliteData.data_action;
EliteSummonPanel = class("EliteSummonPanel", function ()
	return ccui.Widget:create()
end);

function EliteSummonPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1;
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitesummon", "elitesummon"),
			type = ResourcesType.plist
		}
	};
	slot0.resources_load = ResourcesLoad.New(true);

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted();
		end
	end);

	slot0.touch_recruit_10 = true;
	slot0.is_can_award = false;
	slot0.recruit_type_1 = nil;
	slot0.recruit_type_10 = nil;
	slot0.awwrd_count = nil;
end

function EliteSummonPanel.loadResListCompleted(slot0)
	slot0:configUI();
	slot0:register_event();
end

function EliteSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("elitesummon/elitesummon_panel"));

	slot0.root_wnd:setPosition(-40, -82);
	slot0:addChild(slot0.root_wnd);
	slot0:setCascadeOpacityEnabled(true);
	slot0:setAnchorPoint(0, 0);

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("image_bg");
	slot3 = "txt_cn_elitesummon_1";

	if ActionController:getInstance():getActionSubTabVo(slot0.holiday_bid) and slot4.aim_title ~= "" and slot4.aim_title then
		slot3 = slot4.aim_title;
	end

	slot0.bg_load = loadSpriteTextureFromCDN(slot2, PathTool.getPlistImgForDownLoad("bigbg/timesummon", slot3), ResourcesType.single, slot0.bg_load);
	slot0.btn_summon_1 = slot1:getChildByName("btn_summon_1");

	slot0.btn_summon_1:getChildByName("Text_8"):setString(TI18N("赐福1次"));

	slot0.remain_time = createRichLabel(18, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(120.5, 23));

	slot0.btn_summon_1:addChild(slot0.remain_time);

	slot0.btn_summon_10 = slot1:getChildByName("btn_summon_10");

	slot0.btn_summon_10:getChildByName("Text_8"):setString(TI18N("赐福10次"));

	slot0.icon_10 = slot0.btn_summon_10:getChildByName("Sprite_7");
	slot0.count_10 = slot0.btn_summon_10:getChildByName("count");

	slot0.count_10:setString("");

	slot0.btn_reward = slot1:getChildByName("btn_reward");

	slot0.btn_reward:getChildByName("Text_9"):setString(TI18N("奖励预览"));

	slot0.btn_rule = slot1:getChildByName("btn_rule");
	slot0.icon = slot1:getChildByName("icon");
	slot0.icon_count = slot1:getChildByName("icon_count");

	slot0.icon_count:setString("");

	if Config.ItemData.data_get_data(uv0.common_s.val) then
		loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE);
		slot0.icon:setScale(0.45);
	end

	slot0.summon_item_bid = uv0.common_s.val;

	slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid));

	slot0.holiday_time = slot1:getChildByName("time");

	slot1:getChildByName("next_level_text"):setString(TI18N("下一阶段"));

	slot0.next_text = slot1:getChildByName("next_text");

	slot0.next_text:setString("");

	slot0.bar = slot1:getChildByName("bar");

	slot0.bar:setScale9Enabled(true);
	slot0.bar:setPercent(0);

	slot0.remain_up = createRichLabel(20, cc.c4b(255, 255, 255, 255), cc.p(1, 0.5), cc.p(659, 787));

	slot1:addChild(slot0.remain_up);

	slot0.award_item = BackPackItem.new(true, true, false, 0.6);

	slot0.award_item:setPosition(cc.p(60, 718));
	slot0.award_item:addCallBack(handler(slot0, slot0.onClickAwardItem));
	slot1:addChild(slot0.award_item);
	uv1:send23220();
end

function EliteSummonPanel.onClickAwardItem(slot0)
	if slot0.data then
		if slot0.is_can_award then
			uv0:send23222();
		else
			TimesummonController:getInstance():openTimeSummonProgressView(true, slot0.data.times, slot0.data.camp_id);
		end
	end
end

function EliteSummonPanel.setCountDownTime(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	doStopAllActions(slot1);

	if slot2 - GameNet:getInstance():getTime() > 0 then
		(function (slot0)
			if tolua.isnull(uv0) then
				return
			end

			if slot0 > 0 then
				uv0:setString(string.format(TI18N("<div fontcolor=#35FF14>%s</div>%s"), TimeTool.GetTimeFormat(slot0), "后免费"));
			else
				doStopAllActions(uv0);
				uv0:setString(TI18N("免费召唤"));
			end
		end)(slot2);
		slot1:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1;

			if uv0 < 0 then
				doStopAllActions(uv1);
				uv1:setString(TI18N("免费召唤"));
			else
				uv2(uv0);
			end
		end))));
	else
		slot3(slot2);
	end
end

function EliteSummonPanel.register_event(slot0)
	if not slot0.message_event then
		slot0.message_event = GlobalEvent:getInstance():Bind(EliteSummonEvent.EliteSummon_Message, function (slot0)
			if not slot0 then
				return
			end

			if uv0:getModel():isHolidayHasID(slot0.camp_id) then
				uv1:setData(slot0);
			end
		end);
	end

	registerButtonEventListener(slot0.btn_reward, function ()
		if uv0.data and uv0.data.camp_id and uv1[uv0.data.camp_id] then
			slot1 = Config.RecruitHolidayEliteData.data_probability[slot0.group_id];

			TimesummonController:getInstance():openTimeSummonAwardView(true, slot0.group_id, uv0.data, TimesummonConst.ActonInfoType.EliteType);
		end
	end, true);
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if uv0.data and uv0.data.camp_id and uv1[uv0.data.camp_id] then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500);
		end
	end, true, nil, nil, 0.8);
	registerButtonEventListener(slot0.btn_summon_1, function ()
		if uv0.recruit_type_1 then
			if uv0.recruit_type_1 == 3 then
				if uv0.data and uv0.data.camp_id then
					uv0:RecruitDaimond(1);
				end
			else
				uv1:send23221(1, uv0.recruit_type_1);
			end
		end
	end, true);
	registerButtonEventListener(slot0.btn_summon_10, function ()
		if not uv0.touch_recruit_10 then
			message(TI18N("点击过快~~~"));

			return
		else
			message(TI18N(""));
		end

		if uv0.recruit_10_ticket == nil then
			uv0.recruit_10_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.touch_recruit_10 = true;

				if uv0.recruit_10_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.recruit_10_ticket);

					uv0.recruit_10_ticket = nil;
				end
			end, 2);
		end

		uv0.touch_recruit_10 = nil;

		if uv0.recruit_type_10 then
			if uv0.recruit_type_10 == 3 then
				uv0:RecruitDaimond(10);
			else
				uv1:send23221(10, uv0.recruit_type_10);
			end
		end
	end, true);

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1);
		end);
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1);
		end);
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1);
		end);
	end
end

function EliteSummonPanel.RecruitDaimond(slot0, slot1)
	if slot0.data and slot0.data.camp_id and uv0[slot0.data.camp_id] then
		slot3 = RoleController:getInstance():getRoleVo();

		if uv1 and uv1[slot2.group_id] then
			slot4 = uv1[slot2.group_id];
			slot5 = nil;

			if not ((slot1 ~= 1 or slot4.loss_gold_once[1][2]) and slot4.loss_gold_ten[1][2]) then
				return
			end

			if slot3.gold < slot5 then
				message(TI18N("钻石不足~~~"));

				return
			end

			slot7 = string.format(TI18N("是否使用 <img src=%s visible=true scale=0.35 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(3), slot5, slot6);
			slot8 = 0;

			if slot1 == 1 then
				slot8 = slot4.gain_once[1][2];
			elseif slot1 == 10 then
				slot8 = slot4.gain_ten[1][2];
			end

			CommonAlert.show(slot7 .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019></div><div fontColor=#d95014 fontsize= 26>英雄经验</div><div fontColor=#020019>(同时附赠</div><div fontColor=#289b14 fontsize= 26>%d</div><div fontColor=#020019>次赐福)</div>"), slot8, slot1), TI18N("确定"), function ()
				uv0:send23221(uv1, 3);
			end, TI18N("取消"), nil, CommonAlert.type.rich);
		end
	end
end

function EliteSummonPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.summon_item_bid and slot1 and slot2 and slot1 == BackPackConst.Bag_Code.BACKPACK then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.base_id and slot0.summon_item_bid == slot7.base_id then
				if slot0.icon_count then
					slot0.icon_count:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid));
				end

				slot0:recruitBtnStatus(1);
				slot0:recruitBtnStatus(10);

				break
			end
		end
	end
end

function EliteSummonPanel.setData(slot0, slot1)
	slot0.data = slot1;

	slot0:recruitBtnStatus(1);
	slot0:recruitBtnStatus(10);
	slot0:setCountDownTime(slot0.remain_time, slot1.free_time);
	slot0.holiday_time:setString(string.format("%s-%s", TimeTool.getMD2(slot1.start_time), TimeTool.getMD2(slot1.end_time)));
	slot0.remain_up:setString(string.format(TI18N("<div outline=2,#000000>剩余</div><div fontcolor=#5fde46 fontsize=20 outline=2,#000000>%d</div><div outline=2,#000000>次赐福内必出UP道具</div>"), slot1.must_count));
	slot0:nextRewardLevel();
end

function EliteSummonPanel.nextRewardLevel(slot0)
	slot1 = slot0:nextCount(slot0.data.times);

	if uv0[slot0.data.camp_id] and uv0[slot0.data.camp_id][slot1] then
		slot2 = uv0[slot0.data.camp_id];

		if slot0.award_item then
			slot0.award_item:setBaseData(slot2[slot1].reward[1][1], slot2[slot1].reward[1][2]);

			slot0.is_can_award, can_id = slot0:getBaoDIStatus();

			if slot0.is_can_award == true then
				if can_id then
					slot0.award_item:setBaseData(slot2[can_id].reward[1][1], slot2[can_id].reward[1][2]);
				end

				slot0.award_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1);
			else
				slot0.award_item:showItemEffect(false);
			end

			if slot0.is_can_award == false and slot2[#slot2].times <= slot0.data.times then
				setChildUnEnabled(true, slot0.award_item);
				slot0.award_item:setReceivedIcon(true);
			end
		end

		slot3 = slot2[slot1].times;

		slot0.next_text:setString(slot0.data.times .. "/" .. slot3);

		slot4 = 0;
		slot5 = slot3;

		if slot1 == 1 then
			slot4 = slot0.data.times;
		else
			slot4 = slot0.data.times - slot2[slot1 - 1].times;
			slot5 = slot3 - slot2[slot1 - 1].times;
		end

		slot6 = slot4 / slot5 * 100;

		if slot2[#slot2].times <= slot0.data.times then
			slot6 = 100;
		end

		slot0.bar:setPercent(slot6);
	end
end

function EliteSummonPanel.nextCount(slot0, slot1)
	slot2 = 1;
	slot3 = uv0[slot0.data.camp_id];

	if uv0 and slot3 then
		if slot3[#slot3].times <= slot1 then
			return slot3[#slot3].id
		end

		for slot7 = 1, #slot3 do
			if slot7 + 1 >= #slot3 then
				slot8 = #slot3;
			end

			if slot1 < slot3[slot7].times and slot1 <= slot3[slot8].times then
				slot2 = slot3[slot7].id;

				break
			end
		end
	end

	return slot2
end

function EliteSummonPanel.getBaoDIStatus(slot0)
	slot1 = false;
	slot2 = nil;

	if slot0.data and uv0[slot0.data.camp_id] then
		slot6 = slot0.data.camp_id;

		for slot6, slot7 in ipairs(uv0[slot6]) do
			slot8 = false;
			slot9 = nil;

			if slot7.times <= slot0.data.times then
				slot8 = true;
				slot9 = slot7.id;
			end

			slot10 = true;

			if slot8 == true then
				for slot14, slot15 in pairs(slot0.data.reward_list) do
					if slot15.id == slot9 then
						slot10 = false;

						break
					end
				end
			end

			if slot9 and slot10 == true then
				slot1 = true;
				slot2 = slot9;
			end
		end
	end

	return slot1, slot2
end

function EliteSummonPanel.recruitBtnStatus(slot0, slot1)
	if slot0.data and slot0.data.camp_id and uv0[slot0.data.camp_id] and uv1 and uv1[slot2.group_id] then
		if slot1 <= BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid) then
			slot5 = nil;

			if slot1 == 1 then
				slot0.recruit_type_1 = 4;
				slot5 = Config.ItemData.data_get_data(uv1[slot2.group_id].loss_item_once[1][1]);
			elseif slot1 == 10 then
				slot0.recruit_type_10 = 4;
				slot5 = Config.ItemData.data_get_data(slot3.loss_item_ten[1][1]);
			end

			if slot5 then
				loadSpriteTexture(slot0.icon_10, PathTool.getItemRes(slot5.icon), LOADTEXT_TYPE);
				slot0.icon_10:setScale(0.3);

				if slot1 == 1 then
					slot0.count_10:setString(slot3.loss_item_once[1][2]);
				elseif slot1 == 10 then
					slot0.count_10:setString(slot3.loss_item_ten[1][2]);
				end
			end
		end

		if slot0.data.free_time <= 0 then
			slot0.recruit_type_1 = 1;
		end
	end
end

function EliteSummonPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false);
end

function EliteSummonPanel.DeleteMe(slot0)
	doStopAllActions(slot0.remain_time);

	if slot0.resources_load then
		slot0.resources_load:DeleteMe();

		slot0.resources_load = nil;
	end

	if slot0.award_item then
		slot0.award_item:DeleteMe();

		slot0.award_item = nil;
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe();

		slot0.bg_load = nil;
	end

	if slot0.message_event then
		GlobalEvent:getInstance():UnBind(slot0.message_event);

		slot0.message_event = nil;
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event);

		slot0.update_add_good_event = nil;
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event);

		slot0.update_delete_good_event = nil;
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event);

		slot0.update_modify_good_event = nil;
	end

	if slot0.recruit_10_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.recruit_10_ticket);

		slot0.recruit_10_ticket = nil;
	end
end
