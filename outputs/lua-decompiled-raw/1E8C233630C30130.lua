EndlessTrailPanel = class("EndlessTrailPanel", function ()
	return ccui.Widget:create()
end)
slot1 = Endless_trailController:getInstance():getModel()
slot2 = string.format

function EndlessTrailPanel.ctor(slot0)
	slot0.ack_status = 0
	slot0.rank_list = {}
	slot0.is_first_open = true

	slot0:configUI()
	slot0:register_event()
end

function EndlessTrailPanel.addToParent(slot0, slot1)
	slot0:setVisible(slot1 or false)

	if slot0.is_first_open == true then
		slot0.is_first_open = false

		uv0:send23903(Endless_trailEvent.endless_type.old)
		slot0:setRankShow()
		slot0:updateBaseInfo()
	end

	if slot1 == true then
		slot0:updateFirendRedPoint()
		slot0:updateGetBtnRedPoint()
		slot0:updateAckBtnRedPoint()
	end
end

function EndlessTrailPanel.configUI(slot0, ...)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_window"))

	slot0.root_wnd:setPosition(0, 0)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.mainContainer = slot0.root_wnd:getChildByName("main_container")
	slot0.top_panel = slot0.mainContainer:getChildByName("top_panel")
	slot0.bottom_panel = slot0.mainContainer:getChildByName("bottom_panel")
	slot0.friend_btn = slot0.bottom_panel:getChildByName("friend_btn")
	slot0.firend_red_point = slot0.friend_btn:getChildByName("red_point")

	slot0.firend_red_point:setVisible(false)

	slot1 = slot0.friend_btn:getChildByName("label")

	slot1:setString(TI18N("好友助阵"))
	UITool.SetTitleColor(slot1)

	slot0.ack_btn = slot0.bottom_panel:getChildByName("ack_btn")
	slot0.ack_btn_label = slot0.ack_btn:getChildByName("label")

	slot0.ack_btn_label:setString(TI18N("开始挑战"))

	slot0.ack_btn_red_point = slot0.ack_btn:getChildByName("red_point")
	slot0.tips_button = slot0.top_panel:getChildByName("tips_button")
	slot0.rank_container = slot0.top_panel:getChildByName("rank_container")
	slot2 = slot0.rank_container:getChildByName("rank_desc_label")

	slot2:setString(TI18N("闯关排行榜"))
	UITool.SetTitleColor(slot2)

	slot0.rank_info_btn = slot0.rank_container:getChildByName("rank_info_btn")
	slot0.first_container = slot0.bottom_panel:getChildByName("first_container")
	slot0.get_btn = slot0.first_container:getChildByName("get_btn")

	slot0.get_btn:setVisible(false)

	slot3 = slot0.get_btn:getChildByName("label")

	slot3:setString(TI18N("领取"))
	UITool.SetTitleColor(slot3)

	slot0.first_label = createRichLabel(22, cc.c4b(3, 53, 85, 255), cc.p(0, 1), cc.p(5, slot0.first_container:getContentSize().height - 5), nil, , 300)

	slot0.first_container:addChild(slot0.first_label)

	slot0.limit_label = createRichLabel(22, cc.c4b(3, 53, 85, 255), cc.p(1, 0.5), cc.p(slot0.first_container:getContentSize().width - 20, 43), nil, , 250)

	slot0.limit_label:setVisible(false)
	slot0.first_container:addChild(slot0.limit_label)

	slot0.info_touch = slot0.first_container:getChildByName("info_touch")
	slot0.info_lab = createRichLabel(22, cc.c4b(36, 144, 3, 255), cc.p(0.5, 0.5), cc.p(slot0.info_touch:getContentSize().width * 0.5, slot0.info_touch:getContentSize().height * 0.5), 10, nil, 100)

	slot0.info_touch:addChild(slot0.info_lab)
	slot0.info_lab:setString(TI18N("<div  href=detial>奖励详情</div>"))

	slot0.rank_reward_container = slot0.bottom_panel:getChildByName("rank_reward_container")

	slot0.rank_reward_container:getChildByName("my_title"):setString(TI18N("我的排名:"))

	slot0.my_rank_value = slot0.rank_reward_container:getChildByName("my_rank")
	slot0.rank_notice = slot0.rank_reward_container:getChildByName("rank_notice")

	slot0.rank_notice:setString(TI18N("暂无排行奖励"))
	UITool.SetDarkColor(slot0.rank_reward_container:getChildByName("my_title"))
	UITool.SetDarkColor(slot0.my_rank_value)
	UITool.SetDarkColor(slot0.rank_notice)

	slot0.my_round_container = slot0.bottom_panel:getChildByName("my_round_container")

	slot0.my_round_container:getChildByName("round_desc_label"):setString(TI18N("个人记录"))
	UITool.SetLightColor(slot3)

	slot0.floor_round = CommonNum.new(23, nil, 0, 1, cc.p(0.5, 0))

	slot0.my_round_container:addChild(slot0.floor_round)
	slot0.floor_round:setPosition(150, 34.5)
	slot0.floor_round:setScale(0.9)

	slot0.friend_container = slot0.bottom_panel:getChildByName("friend_container")

	slot0.friend_container:getChildByName("label_1"):setString(TI18N("已选择:"))

	slot0.friend_power = slot0.friend_container:getChildByName("power")
	slot0.friend_head = PlayerHead.new(PlayerHead.type.circle)

	slot0.friend_head:setScale(0.4)
	slot0.friend_head:setPosition(100, 24)
	slot0.friend_container:addChild(slot0.friend_head)

	slot0.friend_label = createRichLabel(22, cc.c4b(3, 53, 85, 255), cc.p(0.5, 0.5), cc.p(590, -21))

	slot0.bottom_panel:addChild(slot0.friend_label)

	slot0.from_label = createRichLabel(22, cc.c4b(14, 50, 149, 255), cc.p(0.5, 0.5), cc.p(358, 115))

	slot0.bottom_panel:addChild(slot0.from_label)

	slot0.has_label = createRichLabel(22, cc.c4b(215, 226, 227, 255), cc.p(0.5, 0.5), cc.p(358, -30))

	slot0.bottom_panel:addChild(slot0.has_label)

	slot0.can_reward_label = slot0.bottom_panel:getChildByName("can_reward_label")

	slot0.can_reward_label:setString(TI18N("（已获所有日常结算奖励）"))
	UITool.SetDarkColor(slot0.can_reward_label)
	slot0.top_panel:setPositionY(display.getTop(slot0.mainContainer) - 237)
	slot0.bottom_panel:setPositionY(display.getBottom(slot0.mainContainer) + 180)
end

function EndlessTrailPanel.register_event(slot0, ...)
	registerButtonEventListener(slot0.get_btn, function ()
		if uv0.first_data then
			uv1:send23904(uv0.first_data.id, Endless_trailEvent.endless_type.old)
		end
	end, true, 1)
	registerButtonEventListener(slot0.info_touch, function ()
		uv0:openEndlessRewardWindow(true, Endless_trailEvent.endless_type.old)
	end, true, 1)
	registerButtonEventListener(slot0.rank_info_btn, function ()
		uv0:openEndlessRankView(true, Endless_trailEvent.type.rank, Endless_trailEvent.endless_type.old)
	end, true, 1)
	registerButtonEventListener(slot0.tips_button, function ()
		if Config.EndlessData.data_explain and Config.EndlessData.data_explain[1] then
			MainuiController:getInstance():openCommonExplainView(true, Config.EndlessData.data_explain[1], TI18N("玩法规则"))
		end
	end, true, 1)
	registerButtonEventListener(slot0.ack_btn, function ()
		if uv0.base_data and uv0.base_data.type ~= 0 and uv0.base_data.type ~= Endless_trailEvent.endless_type.old then
			message(TI18N("当日无法挑战"))

			return
		end

		slot1 = (uv1:getHasHirePartnerData() or {}).list or {}

		if uv0.ack_status == 2 then
			CommonAlert.show(TI18N("本日已不可获得通关累计奖励，但依然可以继续挑战<div fontcolor=#289b14>首通奖励</div>和<div fontcolor=#289b14>排行榜排名</div>，是否确认继续挑战？"), TI18N("确定"), function ()
				HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.EndLess, {
					has_hire_list = uv0
				})
			end, TI18N("取消"), nil, CommonAlert.type.rich)
		else
			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.EndLess, {
				has_hire_list = slot1
			})
		end
	end, true, 1)
	registerButtonEventListener(slot0.friend_btn, function ()
		uv0:openEndlessFriendHelpView(true)
	end, true, 1)

	if not slot0.update_base_event then
		slot0.update_base_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_BASE_DATA, function ()
			uv0:updateBaseInfo()
		end)
	end

	if not slot0.update_first_event then
		slot0.update_first_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_FIRST_DATA, function ()
			uv0:updateFirstItem()
		end)
	end

	if not slot0.send_partner_red_point_event then
		slot0.send_partner_red_point_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_SENDPARTNER_DATA, function ()
			uv0:updateFirendRedPoint()
		end)
	end

	if not slot0.update_red_first_event then
		slot0.update_red_first_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_FIRST_DATA, function ()
			uv0:updateGetBtnRedPoint()
		end)
	end

	if not slot0.update_red_reward_event then
		slot0.update_red_reward_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_REWARD_DATA, function ()
			uv0:updateAckBtnRedPoint()
		end)
	end

	if not slot0.update_rank_event then
		slot0.update_rank_event = GlobalEvent:getInstance():Bind(Endless_trailEvent.UPDATA_RANK_DATA, function ()
			uv0:updateRankData()
			uv0:updateRankItem()
		end)
	end
end

function EndlessTrailPanel.updateAckBtnRedPoint(slot0)
	if slot0.ack_btn_red_point then
		if uv0:getIsGetAllReward() == nil then
			slot1 = false
		end

		slot0.ack_btn_red_point:setVisible(slot1)
	end
end

function EndlessTrailPanel.updateGetBtnRedPoint(slot0)
	if slot0.get_btn then
		if uv0:getFirstGet(Endless_trailEvent.endless_type.old) == nil then
			slot1 = false
		end

		addRedPointToNodeByStatus(slot0.get_btn, slot1, 5, 5)
	end
end

function EndlessTrailPanel.updateFirendRedPoint(slot0)
	if slot0.firend_red_point and not tolua.isnull(slot0.firend_red_point) then
		if uv0:getIsSendPartner() == nil then
			slot1 = false
		end

		slot0.firend_red_point:setVisible(slot1)
	end
end

function EndlessTrailPanel.setRankShow(slot0)
	if RankController:getInstance():checkRankIsShow() then
		slot0.rank_container:setVisible(true)
	else
		slot0.rank_container:setVisible(false)
	end
end

function EndlessTrailPanel.updateBaseInfo(slot0)
	slot0.base_data = uv0:getEndlessData()

	if slot0.base_data then
		slot0.floor_round:setNum(slot1.max_round)
		slot0.from_label:setString(string.format(TI18N("从%s关开始"), slot1.current_round))
		slot0.has_label:setString(string.format(TI18N("今天已通关%s关"), slot1.day_pass_round))

		if slot1.day_pass_round == 0 then
			slot0.ack_btn_label:setString(TI18N("开始挑战"))
		else
			slot0.ack_btn_label:setString(TI18N("重新开始"))
		end

		if slot1.day_pass_round ~= 0 and slot1.is_reward == TRUE then
			slot0.ack_status = 2
		else
			slot0.ack_status = 1
		end

		if slot1.is_employ == FALSE and next(slot1.list or {}) == nil then
			slot0.friend_label:setString(TI18N("选择一位好友的英雄帮助"))
			slot0.friend_container:setVisible(false)
			slot0.friend_label:setVisible(true)
		elseif slot1.list and slot1.list[1] then
			slot2 = slot1.list[1]

			slot0.friend_label:setVisible(false)
			slot0.friend_container:setVisible(true)
			slot0.friend_head:setHeadRes(slot2.bid)
			slot0.friend_power:setString(slot2.power)
		end

		if slot1.is_reward == TRUE and slot0.base_data.type == Endless_trailEvent.endless_type.old then
			slot0.can_reward_label:setVisible(true)
		else
			slot0.can_reward_label:setVisible(false)
		end

		slot0:updateRankData()
		slot0:updateRankItem()
		slot0:updateFirstItem()

		if slot0.base_data.type ~= 0 and slot0.base_data.type ~= Endless_trailEvent.endless_type.old then
			setChildUnEnabled(true, slot0.ack_btn)
			slot0.ack_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			setChildUnEnabled(false, slot0.ack_btn)
			slot0.ack_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	end
end

function EndlessTrailPanel.updateFirstItem(slot0)
	slot1 = nil

	if slot0.base_data then
		slot1 = uv0:getFirstData(Endless_trailEvent.endless_type.old)
	end

	if slot1 and Config.EndlessData.data_first_data and Config.EndlessData.data_first_data[Endless_trailEvent.endless_type.old] and slot0.base_data then
		slot0.first_data = slot1
		slot2 = Config.EndlessData.data_first_data[Endless_trailEvent.endless_type.old][slot0.first_data.id]

		if slot0.first_data.id == 0 then
			slot0.limit_label:setString(TI18N("【已领完所有首通奖励！ヾ(*・ω・)ノ゜】"))
			slot0.limit_label:setVisible(true)

			if slot0.item_scrollview then
				slot0.item_scrollview:setVisible(false)
			end

			slot0.get_btn:setVisible(false)
		elseif slot2 then
			if not slot0.item_scrollview then
				slot0.item_scrollview = CommonScrollViewLayout.new(slot0.first_container, cc.p(10, 5), ScrollViewDir.horizontal, ScrollViewStartPos.bottom, cc.size(195, 85), {
					start_y = 0,
					start_x = 0,
					space_x = 10,
					row = 1,
					space_y = 0,
					col = 0,
					scale = 0.7,
					item_class = BackPackItem,
					item_width = BackPackItem.Width * 0.7,
					item_height = BackPackItem.Height * 0.7
				})
			end

			slot0.first_label:setString(string.format(TI18N("首通奖励(第%s关)"), slot2.limit_id))

			if slot0.first_data.status == 1 then
				slot0.get_btn:setVisible(true)
				slot0.limit_label:setVisible(false)
			else
				slot0.limit_label:setString(string.format(TI18N("<div fontcolor=#249003>%s</div>关后可领"), slot2.limit_id - slot0.base_data.max_round))
				slot0.limit_label:setVisible(true)
				slot0.get_btn:setVisible(false)
			end

			slot4 = {}

			for slot8, slot9 in ipairs(slot2.items) do
				if deepCopy(Config.ItemData.data_get_data(slot9[1])) then
					slot10.quantity = slot9[2]

					table.insert(slot4, slot10)
				end
			end

			slot0.item_scrollview:setData(slot4, nil, , {
				is_show_tips = true
			})
			slot0.item_scrollview:setVisible(true)
		end
	end
end

function EndlessTrailPanel.updateRankItem(slot0)
	if slot0.base_data == nil then
		return
	end

	if slot0.base_data.my_idx == nil then
		return
	end

	slot1 = nil

	if Config.EndlessData.data_rank_reward_data and Config.EndlessData.data_rank_reward_data[Endless_trailEvent.endless_type.old] then
		slot5 = Endless_trailEvent.endless_type.old

		for slot5, slot6 in ipairs(Config.EndlessData.data_rank_reward_data[slot5]) do
			if slot6.min <= slot0.base_data.my_idx and slot0.base_data.my_idx <= slot6.max then
				slot1 = slot6

				break
			end
		end
	end

	if slot1 == nil then
		slot0.rank_notice:setVisible(true)

		if slot0.rank_item_scrollview then
			slot0.rank_item_scrollview:setVisible(false)
		end

		slot0.my_rank_value:setString(TI18N("暂未上榜"))
	else
		slot0.rank_notice:setVisible(false)
		slot0.my_rank_value:setString(slot0.base_data.my_idx)

		for slot6, slot7 in ipairs(slot1.items) do
			if deepCopy(Config.ItemData.data_get_data(slot7[1])) then
				slot8.quantity = slot7[2]

				table.insert({}, slot8)
			end
		end

		if not slot0.rank_item_scrollview then
			slot0.rank_item_scrollview = CommonScrollViewLayout.new(slot0.rank_reward_container, cc.p(10, 10), ScrollViewDir.horizontal, ScrollViewStartPos.bottom, cc.size(195, 85), {
				start_y = 0,
				start_x = 0,
				space_x = 10,
				row = 1,
				space_y = 0,
				col = 0,
				scale = 0.7,
				item_class = BackPackItem,
				item_width = BackPackItem.Width * 0.7,
				item_height = BackPackItem.Height * 0.7
			})
		end

		slot0.rank_item_scrollview:setData(slot2, nil, , {
			is_show_tips = true
		})
		slot0.rank_item_scrollview:setVisible(true)
	end
end

function EndlessTrailPanel.updateRankData(slot0, ...)
	if uv0:getRaknRoleTopThreeList(Endless_trailEvent.endless_type.old) and next(slot1 or {}) ~= nil then
		for slot5, slot6 in ipairs(slot1) do
			if not slot0.rank_list[slot5] then
				slot7 = slot0:createSingleRankItem(slot5, slot6)

				slot0.rank_container:addChild(slot7)

				slot0.rank_list[slot5] = slot7
			end

			if slot0.rank_list[slot5] then
				slot7:setPosition(15, 188 - (slot5 - 1) * slot7:getContentSize().height)
				slot7.label:setString(slot6.name)
				slot7.value:setString((slot6.val or 0) .. TI18N("关"))
			end
		end
	end
end

function EndlessTrailPanel.createSingleRankItem(slot0, slot1, slot2)
	slot3 = ccui.Layout:create()

	slot3:setAnchorPoint(cc.p(0, 1))
	slot3:setContentSize(cc.size(180, 50))

	slot4 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 30, 20, slot3)

	slot4:setScale(0.7)

	slot3.sp = slot4
	slot5 = createLabel(20, 1, nil, 70, 20, "", slot3)

	slot5:setAnchorPoint(cc.p(0, 0.5))

	slot6 = createLabel(20, cc.c4b(255, 155, 30, 255), nil, 190, 20, "", slot3)

	slot6:setAnchorPoint(cc.p(0, 0.5))

	slot3.label = slot5
	slot3.value = slot6

	return slot3
end

function EndlessTrailPanel.DeleteMe(slot0, ...)
	if slot0.floor_round then
		slot0.floor_round:DeleteMe()

		slot0.floor_round = nil
	end

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	if slot0.rank_item_scrollview then
		slot0.rank_item_scrollview:DeleteMe()

		slot0.rank_item_scrollview = nil
	end

	if slot0.update_first_event then
		GlobalEvent:getInstance():UnBind(slot0.update_first_event)

		slot0.update_first_event = nil
	end

	if slot0.update_base_event then
		GlobalEvent:getInstance():UnBind(slot0.update_base_event)

		slot0.update_base_event = nil
	end

	if slot0.send_partner_red_point_event then
		GlobalEvent:getInstance():UnBind(slot0.send_partner_red_point_event)

		slot0.send_partner_red_point_event = nil
	end

	if slot0.update_red_first_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_first_event)

		slot0.update_red_first_event = nil
	end

	if slot0.update_red_reward_event then
		GlobalEvent:getInstance():UnBind(slot0.update_red_reward_event)

		slot0.update_red_reward_event = nil
	end

	if slot0.update_rank_event then
		GlobalEvent:getInstance():UnBind(slot0.update_rank_event)

		slot0.update_rank_event = nil
	end
end
