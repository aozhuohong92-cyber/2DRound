GuildvoyageOrderEscortWindow = GuildvoyageOrderEscortWindow or BaseClass(BaseView);
slot1 = GuildvoyageController:getInstance():getModel();
slot2 = BackpackController:getInstance():getModel();
slot3 = HeroController:getInstance():getModel();
slot4 = table.insert;
slot5 = table.sort;
slot6 = GameNet:getInstance();

function GuildvoyageOrderEscortWindow.__init(slot0, slot1)
	slot0.order_type = slot1;
	slot0.win_type = WinType.Big;
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG;
	slot0.is_full_screen = false;
	slot0.is_init = false;
	slot0.res_list = {};
	slot0.layout_name = "guildvoyage/guildvoyage_order_escort_window";
	slot0.item_list = {};
	slot0.partner_list = {};
	slot0.condition_list = {};
	slot0.treasure_list = {};
	slot0.auto_cool_time = 0;
	slot0.can_use_partner_list = {};
	slot0.in_temp_use_list = {};
end

function GuildvoyageOrderEscortWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background");

	slot0.background:setScale(display.getMaxScale());

	slot1 = slot0.root_wnd:getChildByName("container");

	slot1:getChildByName("escort_title"):setString(TI18N("护送宝物:"));
	slot1:getChildByName("dispatch_title"):setString(TI18N("派遣英雄:"));
	slot1:getChildByName("probability_title"):setString(TI18N("概率加成:"));
	slot1:getChildByName("reset_title_1"):setString(TI18N("固定奖励"));

	slot2 = slot1:getChildByName("reset_title_2");

	slot2:setString(TI18N("概率奖励"));

	slot0.probability_value = slot1:getChildByName("probability_value");

	slot0.probability_value:setPositionX(slot2:getPositionX() + slot2:getContentSize().width + 2);
	slot0.probability_value:setString(TI18N("(80%概率)"));

	if slot0.order_type == GuildvoyageConst.escort_type.prepare then
		slot1:getChildByName("win_title"):setString(TI18N("远航护送准备"));
	else
		slot3:setString(TI18N("远航护送"));
	end

	slot0.close_btn = slot1:getChildByName("close_btn");
	slot0.success_container = slot1:getChildByName("success_container");
	slot0.success_container.checkbox = slot0.success_container:getChildByName("checkbox");

	slot0.success_container:getChildByName("desc"):setString(TI18N("成功率100%"));

	if Config.GuildShippingData.data_const.success_cost ~= nil then
		slot0.success_container:getChildByName("value"):setString(slot5.val);
	end

	slot0.success_container:setVisible(false);

	slot0.item = slot1:getChildByName("item");

	slot0.item:setVisible(false);

	if slot0.order_type == GuildvoyageConst.escort_type.escort then
		slot0.success_container:setTouchEnabled(false);
		slot0.success_container.checkbox:setOpacity(153);
	end

	slot0.prepare_btn_container = slot1:getChildByName("prepare_btn_container");
	slot0.prepare_object = {
		escort_btn = slot0.prepare_btn_container:getChildByName("escort_btn")
	};
	slot0.prepare_object.time_label = slot0.prepare_object.escort_btn:getChildByName("time_label");
	slot0.prepare_object.dispatch_btn = slot0.prepare_btn_container:getChildByName("dispatch_btn");

	slot0.prepare_object.dispatch_btn:getChildByName("label"):setString(TI18N("一键派送"));
	slot0.prepare_object.escort_btn:getChildByName("label"):setString(TI18N("护送"));

	slot0.escort_btn_container = slot1:getChildByName("escort_btn_container");
	slot0.escort_object = {
		time_label = slot0.escort_btn_container:getChildByName("time_label"),
		finish_btn = slot0.escort_btn_container:getChildByName("finish_btn")
	};
	slot0.escort_object.cost_value = slot0.escort_object.finish_btn:getChildByName("value");

	slot0.escort_object.finish_btn:getChildByName("label"):setString(TI18N("立即完成"));
	slot0.prepare_btn_container:setVisible(slot0.order_type == GuildvoyageConst.escort_type.prepare);
	slot0.escort_btn_container:setVisible(slot0.order_type == GuildvoyageConst.escort_type.escort);

	slot0.center_x = slot1:getContentSize().width * 0.5;
	slot0.container = slot1;
end

function GuildvoyageOrderEscortWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound();
			uv0:openGuildvoyageOrderEscortWindow(false);
		end
	end);

	if slot0.background then
		slot0.background:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound();
				uv0:openGuildvoyageOrderEscortWindow(false);
			end
		end);
	end

	slot0.prepare_object.escort_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1);

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2();

			if uv0.order_info == nil or uv0.order_info.config == nil then
				return
			end

			for slot5, slot6 in pairs(uv0.treasure_list) do
				if slot6.status == FALSE then
					message(TI18N("当前宝物不足!!"));

					return
				end
			end

			if tableLen(uv0.in_temp_use_list) < uv0.order_info.config.partner_num then
				message(TI18N("当前英雄数量不足!!"));
			end

			slot2 = {};

			for slot6, slot7 in pairs(uv0.in_temp_use_list) do
				uv1(slot2, {
					partner_id = slot7.partner_id
				});
			end

			uv2:requestEscortOrder(uv0.order_info.order_id, slot2, 0);
		end
	end);
	slot0.prepare_object.dispatch_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1);

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2();
			uv0:autoDispatchPartner();
		end
	end);
	slot0.escort_object.finish_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1);

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2();

			if uv0.order_info then
				CommonAlert.show(string.format(TI18N("是否确认花费 <img src=%s visible=true scale=0.5 />%s 立即完成该订单？"), PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), uv0.escort_object.total_value or 0), TI18N("确定"), function ()
					uv0:requestFinishOrder(uv1.order_info.order_id);
				end, TI18N("取消"), nil, CommonAlert.type.rich);
			end
		end
	end);

	if slot0.order_type == GuildvoyageConst.escort_type.prepare and slot0.update_item_event == nil then
		slot0.update_item_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateTreasureList(slot1);
		end);
	end

	if slot0.order_type == GuildvoyageConst.escort_type.prepare and slot0.add_item_event == nil then
		slot0.add_item_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			if slot0 ~= BackPackConst.Bag_Code.BACKPACK then
				return
			end

			uv0:updateTreasureList(slot1);
		end);
	end

	if slot0.order_type == GuildvoyageConst.escort_type.prepare and slot0.add_to_order_event == nil then
		slot0.add_to_order_event = GlobalEvent:getInstance():Bind(GuildvoyageEvent.AddToOrderPartnerListEvent, function (slot0)
			uv0:fillPartnerToTempList(slot0);
		end);
	end
end

function GuildvoyageOrderEscortWindow.updateDoubleItemInfo(slot0, slot1)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot5, slot6 in pairs(slot0.item_list) do
			if slot6 and slot6.is_fixed == false then
				slot6:showDoubleTag(slot1, slot6.num);
			end
		end
	end
end

function GuildvoyageOrderEscortWindow.fillPartnerToTempList(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot3 = slot0.selected_item;

	if slot2 ~= nil then
		slot3 = slot2;
	end

	if slot3 == nil then
		return
	end

	if slot1.voyage_in_form == nil then
		slot1.voyage_in_form = true;
	end

	if slot1.voyage_in_form == true then
		uv0:openChoosePartnerWindow(false);

		if slot3.data ~= nil then
			slot0.in_temp_use_list[slot3.data.partner_id] = nil;
		end

		slot0.in_temp_use_list[slot1.partner_id] = slot1;

		slot3:setData(slot1);
		slot3:showAddIcon(false);
	else
		slot0.in_temp_use_list[slot1.partner_id] = nil;

		slot3:setData(nil);
		slot3:showAddIcon(true);
	end

	slot4 = 0;

	for slot8, slot9 in pairs(slot0.condition_list) do
		if slot9.config and slot9.config.condition then
			slot11 = slot9.config.condition[2];
			slot12 = slot9.config.condition[3];
			slot13 = {
				[slot9.config.condition[1]] = 0
			};

			for slot17, slot18 in pairs(slot0.in_temp_use_list) do
				if slot10 == "sum_partner_lev" then
					slot13[slot10] = slot13[slot10] + slot18.lev;
				elseif slot10 == "sum_partner_power" then
					slot13[slot10] = slot13[slot10] + slot18.power;
				elseif slot10 == "partner_star" then
					if slot11 <= slot18.star then
						slot13[slot10] = slot13[slot10] + 1;
					end
				elseif slot10 == "partner_quality" then
					if slot11 <= slot18.rare_type then
						slot13[slot10] = slot13[slot10] + 1;
					end
				elseif slot10 == "partner_career" and slot18.type == slot11 then
					slot13[slot10] = slot13[slot10] + 1;
				end
			end

			slot14 = false;

			if slot10 == "sum_partner_lev" or slot10 == "sum_partner_power" then
				if slot11 <= slot13[slot10] then
					slot14 = true;
				end
			elseif slot12 <= slot13[slot10] then
				slot14 = true;
			end

			slot9.is_success = slot14;

			if slot14 == true then
				slot4 = (slot9.rate or 0) + slot4;
			end

			if slot14 == true then
				slot9.sign:setVisible(true);
				slot9.desc:setTextColor(Config.ColorData.data_color4[178]);
				slot9.probability:setTextColor(Config.ColorData.data_color4[178]);
			else
				slot9.sign:setVisible(false);
				slot9.desc:setTextColor(Config.ColorData.data_color4[175]);
				slot9.probability:setTextColor(Config.ColorData.data_color4[175]);
			end
		end
	end

	if slot0.order_info and slot0.order_info.config and slot0.order_info.config.rate then
		slot0.original_rate = math.floor((slot0.order_info.config.rate + slot4) * 0.1);
	end

	if slot4 >= 100 then
		slot0.probability_value:setString("(" .. slot4 .. TI18N("%概率)"));
	elseif is_success == true then
		slot0.probability_value:setString(TI18N("100%概率)"));
	else
		slot0.probability_value:setString("(" .. slot4 .. TI18N("%概率)"));
	end
end

function GuildvoyageOrderEscortWindow.autoDispatchPartner(slot0)
	if os.time() - slot0.auto_cool_time < 2 then
		message(TI18N("操作太频繁了!!"));

		return
	end

	slot0.auto_cool_time = slot1;
	slot0.in_temp_use_list = {};

	if tableLen(slot0.can_use_partner_list) == 0 then
		message(TI18N("当前没有可上阵的伙伴"));

		return
	end

	for slot5, slot6 in ipairs(slot0.partner_list) do
		slot7 = {};

		for slot11, slot12 in pairs(slot0.can_use_partner_list) do
			if slot0.in_temp_use_list[slot11] == nil then
				slot12.voyage_recommend = 0;
				slot12.voyage_in_form = false;

				uv0(slot7, slot12);
			end
		end

		if next(slot7) then
			for slot11, slot12 in pairs(slot0.condition_list) do
				if slot12.is_success == false and slot12.config and slot12.config.condition then
					slot14 = slot12.config.condition[2];

					if slot0:needCheck(slot12.config.condition[1]) then
						for slot18, slot19 in ipairs(slot7) do
							if slot13 == "partner_star" then
								if slot14 <= slot19.star then
									slot19.voyage_recommend = 1;
								end
							elseif slot13 == "partner_quality" then
								if slot14 <= slot19.rare_type then
									slot19.voyage_recommend = 1;
								end
							elseif slot13 == "partner_career" and slot19.type == slot14 then
								slot19.voyage_recommend = 1;
							end
						end
					end
				end
			end

			uv1(slot7, SortTools.tableUpperSorter({
				"voyage_recommend",
				"power",
				"lev"
			}));
		end

		if slot7[1] ~= nil then
			slot8.voyage_in_form = true;

			slot0:fillPartnerToTempList(slot8, slot6);
		end
	end
end

function GuildvoyageOrderEscortWindow.openRootWnd(slot0, slot1)
	if slot0.is_init == true then
		return
	end

	slot0.order_info = uv0:getOrderById(slot1);

	if slot0.order_info and slot0.order_info.config then
		slot0:createRewardsList(slot0.order_info.config.rewards);
		slot0:createRandRewardsList(slot0.order_info.config.rand_rewards);
		slot0:createTreasureList(slot0.order_info.loss_id);
		slot0:createConditionList(slot0.order_info.config.cond_ids, slot0.order_info.cond_ids);

		if slot0.order_type == GuildvoyageConst.escort_type.prepare then
			slot0:createPartnerDemandList(slot0.order_info.config.partner_num);
			slot0.prepare_object.time_label:setString(TimeTool.GetTimeFormat(slot0.order_info.config.time));

			for slot8, slot9 in pairs(DeepCopy(uv1:getHeroList())) do
				if uv0:getBusyPartnerList()[slot9.partner_id] == nil then
					slot9.voyage_recommend = 0;
					slot9.voyage_in_form = false;
					slot0.can_use_partner_list[slot9.partner_id] = slot9;
				end
			end
		else
			if slot0.order_info.end_time - uv2:getTime() <= 0 then
				slot2 = 0;
			end

			slot0.escort_object.time_label:setString(TimeTool.GetTimeFormat(slot2));

			slot3 = uv0:getFinishCost(slot2);
			slot0.escort_object.total_value = slot3;

			slot0.escort_object.cost_value:setString(slot3);

			if slot2 > 0 and slot0.time_ticket == nil then
				slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0:escortTimeCount();
				end, 1);
			end

			slot0:createPartnerAssignList(slot0.order_info.assign_ids);
		end

		slot0.is_init = true;
	end
end

function GuildvoyageOrderEscortWindow.sortCurPartnerList(slot0)
	for slot4, slot5 in pairs(slot0.condition_list) do
		if slot5.is_success == false and slot5.config and slot5.config.condition then
			slot7 = slot5.config.condition[2];

			if slot0:needCheck(slot5.config.condition[1]) then
				for slot11, slot12 in ipairs(slot0.total_partner_list) do
					if slot6 == "partner_star" then
						if slot7 <= slot12.star then
							slot12.voyage_recommend = 1;
						end
					elseif slot6 == "partner_quality" then
						if slot7 <= slot12.rare_type then
							slot12.voyage_recommend = 1;
						end
					elseif slot6 == "partner_career" and slot12.type == slot7 then
						slot12.voyage_recommend = 1;
					end
				end
			end
		end
	end

	uv0(slot0.total_partner_list, SortTools.tableUpperSorter({
		"voyage_recommend",
		"power",
		"lev"
	}));
end

function GuildvoyageOrderEscortWindow.createConditionList(slot0, slot1, slot2)
	if tolua.isnull(slot0.item) then
		return
	end

	if slot1 == nil or slot2 == nil then
		return
	end

	slot4 = 467;
	slot5 = nil;
	slot6 = 1;
	slot7, slot8 = nil;

	for slot13, slot14 in ipairs(slot1) do
		if slot14[1] and slot14[2] and Config.GuildShippingData.data_condition[slot14[1]] then
			slot5 = slot0.item:clone();

			slot5:setVisible(true);
			slot5:setPosition(slot0.center_x, 467 - (slot6 - 1) * 41);
			slot0.container:addChild(slot5);
			({
				item = slot5,
				sign = slot5:getChildByName("sign"),
				desc = slot5:getChildByName("desc"),
				probability = slot5:getChildByName("probability"),
				config = slot8
			}).desc:setString(slot8.desc);

			slot7.rate = slot14[2] or 0;

			slot7.probability:setString("+" .. math.ceil(slot7.rate * 0.1) .. "%");

			if slot2[slot14[1]] ~= nil then
				slot7.is_success = true;

				slot7.sign:setVisible(true);
				slot7.desc:setTextColor(Config.ColorData.data_color4[178]);
				slot7.probability:setTextColor(Config.ColorData.data_color4[178]);

				slot9 = slot7.rate + 0;
			else
				slot7.is_success = false;

				slot7.sign:setVisible(false);
				slot7.desc:setTextColor(Config.ColorData.data_color4[175]);
				slot7.probability:setTextColor(Config.ColorData.data_color4[175]);
			end

			slot0.condition_list[slot14[1]] = slot7;
			slot6 = slot6 + 1;
		end
	end

	if slot0.order_info and slot0.order_info.config and slot0.order_info.config.rate then
		slot0.original_rate = math.floor((slot0.order_info.config.rate + slot9) * 0.1);
	end

	if slot0.order_type == GuildvoyageConst.escort_type.prepare then
		if slot9 >= 100 then
			slot0.probability_value:setString("(" .. slot9 .. TI18N("%概率)"));
		elseif is_success == true then
			slot0.probability_value:setString(TI18N("100%概率)"));
		else
			slot0.probability_value:setString("(" .. slot9 .. TI18N("%概率)"));
		end
	else
		slot0.probability_value:setString("(" .. slot9 .. TI18N("%概率)"));
	end
end

function GuildvoyageOrderEscortWindow.createPartnerDemandList(slot0, slot1)
	slot2 = 0.8;
	slot4 = 0;
	slot6 = nil;

	for slot11 = 1, slot1 do
		slot6 = HeroExhibitionItem.new(slot2, true, true);

		slot6:setPosition(171 + (slot11 - 1) * (BackPackItem.Width * slot2 + 28) + BackPackItem.Width * slot2 * 0.5, 610);
		slot0.container:addChild(slot6);
		slot6:addCallBack(function (slot0)
			uv0:setChoosePartnerList(slot0);
		end);
		slot6:showAddIcon(true);
		uv0(slot0.partner_list, slot6);
	end
end

function GuildvoyageOrderEscortWindow.setChoosePartnerList(slot0, slot1)
	if slot1 == nil then
		return
	end

	for slot6, slot7 in pairs(slot0.can_use_partner_list) do
		if slot0.in_temp_use_list[slot6] == nil then
			slot7.voyage_recommend = 0;
			slot7.voyage_in_form = false;

			uv0({}, slot7);
		end
	end

	for slot6, slot7 in pairs(slot0.condition_list) do
		if slot7.is_success == false and slot7.config and slot7.config.condition then
			slot9 = slot7.config.condition[2];

			if slot0:needCheck(slot7.config.condition[1]) then
				for slot13, slot14 in ipairs(slot2) do
					if slot8 == "partner_star" then
						if slot9 <= slot14.star then
							slot14.voyage_recommend = 1;
						end
					elseif slot8 == "partner_quality" then
						if slot9 <= slot14.rare_type then
							slot14.voyage_recommend = 1;
						end
					elseif slot8 == "partner_career" and slot14.type == slot9 then
						slot14.voyage_recommend = 1;
					end
				end
			end
		end
	end

	uv1(slot2, SortTools.tableUpperSorter({
		"voyage_recommend",
		"power",
		"lev"
	}));

	if slot1.data ~= nil then
		uv0(slot2, 1, slot1.data);
	end

	slot0.selected_item = slot1;

	uv2:openChoosePartnerWindow(true, slot2);
end

function GuildvoyageOrderEscortWindow.needCheck(slot0, slot1)
	return slot1 == "partner_star" or slot1 == "partner_quality" or slot1 == "partner_career"
end

function GuildvoyageOrderEscortWindow.createPartnerAssignList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = 0.8;
	slot4 = 0;
	slot6 = nil;

	for slot11, slot12 in ipairs(slot1) do
		if uv0:getHeroById(slot12.partner_id) then
			slot6 = HeroExhibitionItem.new(slot2, true, true);

			slot6:setPosition(171 + (slot11 - 1) * (BackPackItem.Width * slot2 + 28) + BackPackItem.Width * slot2 * 0.5, 610);
			slot6:setData(slot13);
			slot6:shwoExtendPower(true, slot13.power);
			slot0.container:addChild(slot6);
			uv1(slot0.partner_list, slot6);

			slot7 = 1 + 1;
		end
	end
end

function GuildvoyageOrderEscortWindow.createTreasureList(slot0, slot1)
	if Config.GuildShippingData.data_consume[slot1] == nil or next(slot2.loss) == nil then
		return
	end

	slot3 = nil;
	slot4 = 0.8;
	slot6 = 0;
	slot8, slot9, slot10 = nil;

	function slot11(slot0)
		if slot0.data ~= nil then
			slot1 = {};

			for slot5, slot6 in pairs(uv0.treasure_list) do
				if slot6.status == FALSE then
					uv1(slot1, {
						bid = slot5,
						need_num = slot6.need_num
					});
				end
			end

			BackpackController:getInstance():openTipsSource(true, slot0.data, {
				"evt_league_help",
				true
			}, slot1);
		end
	end

	for slot15, slot16 in ipairs(slot2.loss) do
		if slot16[1] and Config.ItemData.data_get_data(slot8) then
			slot3 = BackPackItem.new(false, true, false, slot4, true, true);

			slot3:setPosition(171 + (slot15 - 1) * (BackPackItem.Width * slot4 + 28) + BackPackItem.Width * slot4 * 0.5, 733);
			slot3:setBaseData(slot8);
			slot0.container:addChild(slot3);

			slot17 = 0;

			if slot0.order_type == GuildvoyageConst.escort_type.prepare then
				slot18 = uv1:getBackPackItemNumByBid(slot8);

				slot3:setSpecialNum(slot18 .. "/" .. slot16[2]);

				if slot18 < slot16[2] then
					slot17 = 0;
				else
					slot17 = 1;
				end
			else
				slot17 = 1;
			end

			if slot17 == FALSE then
				setChildUnEnabled(true, slot3);
				slot3:showAddIcon(true);
				slot3:setDefaultTip(false);
				slot3:addBtnCallBack(slot11);
			else
				setChildUnEnabled(false, slot3);
				slot3:showAddIcon(false);
				slot3:setDefaultTip(true);
				slot3:addBtnCallBack(nil);
			end

			slot0.treasure_list[slot8] = {
				item = slot3,
				need_num = slot16[2],
				status = slot17
			};
		end
	end
end

function GuildvoyageOrderEscortWindow.createRewardsList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = nil;
	slot3 = 0.8;
	slot5 = 0;

	for slot10, slot11 in ipairs(slot1) do
		if slot11[1] then
			slot2 = BackPackItem.new(false, true, false, slot3, false, true);

			slot2:setPosition(35 + (slot10 - 1) * (BackPackItem.Width * slot3 + 10) + BackPackItem.Width * slot3 * 0.5, 245);
			slot2:setBaseData(slot11[1], slot11[2]);

			slot2.is_fixed = true;
			slot2.num = slot11[2];

			slot0.container:addChild(slot2);

			slot0.item_list[slot11[1]] = slot2;
		end
	end
end

function GuildvoyageOrderEscortWindow.createRandRewardsList(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	slot2 = nil;
	slot3 = 0.8;
	slot5 = 0;

	for slot10, slot11 in ipairs(slot1) do
		if slot11[1] then
			slot2 = BackPackItem.new(false, true, false, slot3, false, true);

			slot2:setPosition(289 + (slot10 - 1) * (BackPackItem.Width * slot3 + 10) + BackPackItem.Width * slot3 * 0.5, 245);
			slot2:setDefaultTip(true, true);
			slot2:setBaseData(slot11[1], slot11[2]);
			slot0.container:addChild(slot2);

			slot2.is_fixed = false;
			slot2.num = slot11[2];
			slot0.item_list[slot11[1]] = slot2;
		end
	end
end

function GuildvoyageOrderEscortWindow.updateTreasureList(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot6.config and slot0.treasure_list[slot6.config.id] and slot7.item then
			slot7.item:setSpecialNum(slot6.quantity .. "/" .. slot7.need_num);

			slot8 = FALSE;

			if slot7.need_num <= slot6.quantity then
				slot8 = TRUE;
			end

			if slot7.status ~= slot8 then
				slot7.status = slot8;

				if slot8 == FALSE then
					setChildUnEnabled(true, slot7.item);
					slot7.item:showAddIcon(true);
					slot7.item:setDefaultTip(false);
				else
					setChildUnEnabled(false, slot7.item);
					slot7.item:showAddIcon(false);
					slot7.item:setDefaultTip(true);
					slot7.item:addBtnCallBack(nil);
				end
			end
		end
	end
end

function GuildvoyageOrderEscortWindow.clearTimeCount(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket);

		slot0.time_ticket = nil;
	end
end

function GuildvoyageOrderEscortWindow.escortTimeCount(slot0)
	if slot0.order_info == nil then
		slot0:clearTimeCount();

		return
	end

	if slot0.order_info.end_time - uv0:getTime() <= 0 then
		slot0:clearTimeCount();

		return
	end

	slot0.escort_object.time_label:setString(TimeTool.GetTimeFormat(slot1));

	if slot0.escort_object.total_value ~= uv1:getFinishCost(slot1) then
		slot0.escort_object.cost_value:setString(slot2);

		slot0.escort_object.total_value = slot2;
	end
end

function GuildvoyageOrderEscortWindow.close_callback(slot0)
	slot0:clearTimeCount();

	for slot4, slot5 in ipairs(slot0.partner_list) do
		slot5:DeleteMe();
	end

	slot0.partner_list = nil;

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe();
	end

	slot0.item_list = nil;

	for slot4, slot5 in pairs(slot0.treasure_list) do
		if slot5.item then
			slot5.item:DeleteMe();
		end
	end

	slot0.treasure_list = nil;

	if slot0.add_to_order_event then
		GlobalEvent:getInstance():UnBind(slot0.add_to_order_event);

		slot0.add_to_order_event = nil;
	end

	if slot0.add_item_event then
		GlobalEvent:getInstance():UnBind(slot0.add_item_event);

		slot0.add_item_event = nil;
	end

	if slot0.update_item_event then
		GlobalEvent:getInstance():UnBind(slot0.update_item_event);

		slot0.update_item_event = nil;
	end

	uv0:openGuildvoyageOrderEscortWindow(false);
end
