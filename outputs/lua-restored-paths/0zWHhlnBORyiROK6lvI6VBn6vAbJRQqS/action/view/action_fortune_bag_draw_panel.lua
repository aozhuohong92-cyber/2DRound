ActionFortuneBagDrawPanel = class("ActionFortuneBagDrawPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = 30
slot5 = 30
slot6 = 35

function ActionFortuneBagDrawPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:loadResources()

	slot0.camp_id = uv0:getFortuneBagCampId()
	slot0.bag_item_list = {}
end

function ActionFortuneBagDrawPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("fortunebag", "fortunebag"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:configUI()
		uv0:register_event()
	end)
end

function ActionFortuneBagDrawPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_fortune_bag_draw_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot0.can_flip = false
	slot1 = "action_fortune_bag_draw"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.reward_title ~= "" and slot2.reward_title then
		slot1 = slot2.reward_title
	end

	if not slot0.background_load then
		slot0.background_load = loadSpriteTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, slot0.background_load)
	end

	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("活动时间："))

	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.btn_next = slot0.main_container:getChildByName("btn_next")

	slot0.btn_next:getChildByName("txt_next"):setString(TI18N("下一轮"))

	slot0.txt_click_tips = slot0.main_container:getChildByName("txt_click_tips")

	slot0.txt_click_tips:setString(TI18N("点击格子翻牌"))

	slot0.txt_wheels = slot0.main_container:getChildByName("txt_wheels")

	slot0.txt_wheels:setString(TI18N("第一轮"))

	slot0.icon_num = slot0.main_container:getChildByName("icon_num")
	slot0.icon_sprite = slot0.main_container:getChildByName("icon_sprite")
	slot0.addtimes_btn = slot0.main_container:getChildByName("addtimes_btn")
	slot0.battle_preview_btn = slot0.main_container:getChildByName("battle_preview_btn")

	slot0.battle_preview_btn:setVisible(false)

	slot0.preview_btn_label = slot0.battle_preview_btn:getChildByName("preview_btn_label")

	slot0.preview_btn_label:setString(TI18N("皮肤预览"))

	slot0.item_ultimate_reward = slot0.main_container:getChildByName("item_ultimate_reward")
	slot0.item_ultimate_reward.lock_icon = slot0.item_ultimate_reward:getChildByName("lock_icon")
	slot0.item_ultimate_reward.replace = slot0.item_ultimate_reward:getChildByName("replace")
	slot0.item_ultimate_reward.icon = BackPackItem.new(true, true)

	slot0.item_ultimate_reward.icon:setAnchorPoint(0.5, 0.5)
	slot0.item_ultimate_reward.icon:setPosition(slot0.item_ultimate_reward:getContentSize().width / 2, slot0.item_ultimate_reward:getContentSize().height / 2)
	slot0.item_ultimate_reward.icon:setTouchEnabled(false)
	slot0.item_ultimate_reward.icon:setSwallowTouches(false)
	slot0.item_ultimate_reward:addChild(slot0.item_ultimate_reward.icon)

	slot0.effect_mask = slot0.main_container:getChildByName("effect_mask")
	slot0.fortune_bag_list = slot0.main_container:getChildByName("fortune_bag_list")
	slot0.scroll_view_size = slot0.fortune_bag_list:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.fortune_bag_list, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.scroll_view_size, {
		start_y = 0,
		item_width = 85,
		start_x = 1,
		space_x = 12,
		row = 5,
		item_height = 85,
		space_y = 12,
		col = 7,
		item_class = FortuneBagItem
	})

	slot0.item_scrollview:setClickEnabled(false)
	uv0:sender28307()
	uv0:sender28300()
end

function ActionFortuneBagDrawPanel.register_event(slot0)
	if not slot0.update_fortune_bag_draw_event then
		slot0.update_fortune_bag_draw_event = GlobalEvent:getInstance():Bind(ActionEvent.FORTUNE_BAG_DRAW_BASE_EVENT, function (slot0)
			if not slot0 then
				return
			end

			if uv0.can_flip then
				uv0.data = slot0

				uv0:setRewardData(slot0)
				uv0:beginBagFlip()
			else
				uv0:setPanelData(slot0)
			end

			uv0:setGuideEffect()
			uv0:setUltimateReward(slot0)
		end)
	end

	registerButtonEventListener(slot0.addtimes_btn, function ()
		if ActionController:getInstance():getActionSubTabVo(991048) then
			slot0.action_operate:handleSelectedTab(slot0.action_operate.tab_list[slot1.bid])
		else
			message(TI18N("该活动已结束"))
		end
	end, true, 1, nil, 0.8)
	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		if uv0.data then
			uv1:openFortuneBagRuleWindow(true, {
				start_time = uv0.data.start_time,
				end_time = uv0.data.end_time,
				round = uv0.data.round,
				optional_id = uv0.data.optional_id or 0
			})
		end
	end, true, 1)

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updataItem(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updataItem(slot0, slot1)
		end)
	end

	registerButtonEventListener(slot0.btn_next, function (slot0, slot1, slot2)
		uv0:sender28308()
	end, true, 1)
	registerButtonEventListener(slot0.item_ultimate_reward, function (slot0, slot1, slot2)
		uv0:clickSelectUltimate()
	end, false, 1)
	registerButtonEventListener(slot0.item_ultimate_reward.replace, function (slot0, slot1, slot2)
		uv0:clickSelectUltimate()
	end, false, 1)
	registerButtonEventListener(slot0.battle_preview_btn, function ()
		TimesummonController:getInstance():send23219(uv0.holiday_bid)
	end, true, 1)
end

function ActionFortuneBagDrawPanel.updataItem(slot0, slot1, slot2)
	if slot0.draw_consume then
		slot3 = false

		if slot2 ~= nil then
			for slot7, slot8 in pairs(slot2) do
				if slot8.base_id == slot0.draw_consume[1] then
					slot3 = true

					break
				end
			end
		end

		if slot3 then
			slot4 = Config.ItemData.data_get_data(slot0.draw_consume[1])

			slot0.icon_num:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.draw_consume[1]) or 0)
		end
	end
end

function ActionFortuneBagDrawPanel.clickSelectUltimate(slot0)
	if not slot0.data then
		return
	end

	slot1 = false

	for slot5, slot6 in pairs(slot0.data.award_list) do
		if slot6.id >= 10000 then
			slot1 = true

			break
		end
	end

	if slot1 then
		if Config.HolidayOptionalLotteryData.data_constant and slot2.max_round and slot2.max_round.val == slot0.data.round then
			message(TI18N("已经达到最大轮次了"))
		else
			message(TI18N("您已获得本轮终极大奖"))
		end
	elseif not slot0.opening then
		uv0:openFortuneBagSelectWindow(true, {
			cur_round = slot0.data.round,
			select_type_id = slot0.data.optional_id
		})
	end
end

function ActionFortuneBagDrawPanel.beginOpenBagFlip(slot0, slot1)
	if slot0.opening ~= nil and slot0.opening then
		return
	end

	slot0.flip_num = -uv0
	slot0.opening = true
	cell_data = slot1:getData()

	slot0:clearTimeTicket()

	slot0.time_open_ticket = GlobalTimeTicket:getInstance():add(function ()
		if uv0 then
			uv0:setOpenItemFlip(uv1.flip_num)

			uv1.flip_num = uv1.flip_num + 3
		end

		if uv1.flip_num >= 0 and uv1.flip_num < 3 then
			uv2:sender28302(cell_data.pos)
		end

		if uv3 <= uv1.flip_num then
			uv1:clearTimeTicket()

			if uv0.resetItemFlip then
				uv0:resetItemFlip()
			end

			uv1:setRewardData()
		end
	end, 1 / (uv0 * 2))
	slot0.opening_ticket = GlobalTimeTicket:getInstance():add(function ()
		uv0.opening = false

		if uv0.opening_ticket ~= nil then
			GlobalTimeTicket:getInstance():remove(uv0.opening_ticket)

			uv0.opening_ticket = nil
		end
	end, 1.2, 1)
end

function ActionFortuneBagDrawPanel.beginBagFlip(slot0)
	slot0.bag_item_list = slot0.item_scrollview:getItemList()
	slot0.flip_num = -uv0

	slot0:clearTimeTicket()

	slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
		if uv0.bag_item_list then
			for slot3, slot4 in pairs(uv0.bag_item_list) do
				if slot4.setItemFlip then
					slot4:setItemFlip(uv0.flip_num)
				end
			end

			uv0.flip_num = uv0.flip_num + 1
		end

		if uv1 <= uv0.flip_num then
			uv0.fortune_bag_list:setVisible(false)
			uv0:clearTimeTicket()

			if uv0.main_container and uv0.bag_effect == nil then
				uv0.bag_effect = createEffectSpine(PathTool.getEffectRes(352), cc.p(uv0.scroll_view_size.width / 2, uv0.scroll_view_size.height - 29), cc.p(0.5, 0.5), false, PlayerAction.action, handler(uv0, uv0.endBagFlip))

				uv0.effect_mask:addChild(uv0.bag_effect)
			elseif uv0.bag_effect then
				uv0.bag_effect:setVisible(true)
				uv0.bag_effect:setToSetupPose()
				uv0.bag_effect:setAnimation(0, PlayerAction.action, false)
			end
		end
	end, 1 / (uv0 * 2))
end

function ActionFortuneBagDrawPanel.endBagFlip(slot0)
	slot0.fortune_bag_list:setVisible(true)
	slot0.bag_effect:setVisible(false)

	slot0.can_flip = false
	slot0.bag_item_list = slot0.item_scrollview:getItemList()

	if slot0.bag_item_list then
		for slot4, slot5 in pairs(slot0.bag_item_list) do
			if slot5.resetItemFlip then
				slot5:resetItemFlip()
			end
		end

		slot0.flip_num = slot0.flip_num + 1
	end

	if slot0.data then
		slot0:setPanelData(slot0.data)
	end
end

function ActionFortuneBagDrawPanel.clearTimeTicket(slot0)
	if slot0.time_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end

	if slot0.time_open_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_open_ticket)

		slot0.time_open_ticket = nil
	end
end

function ActionFortuneBagDrawPanel.setRewardData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = {}
	slot4 = Config.HolidayOptionalLotteryData.data_optional_award[slot0.camp_id]
	slot5 = 1
	slot6 = {}

	if Config.HolidayOptionalLotteryData.data_normal_award[slot0.camp_id] and slot3[slot1.round] then
		for slot10, slot11 in pairs(slot3[slot1.round]) do
			uv0(slot6, slot11)
		end

		table.sort(slot6, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	for slot10 = 1, uv1 do
		slot11 = {
			is_ultimate = false,
			is_open = false,
			pos = slot10,
			gold_time = slot1.gold_time,
			original_gold_time = slot1.original_gold_time
		}

		if slot0.is_select_ultimate then
			for slot15, slot16 in pairs(slot1.award_list) do
				if slot16.pos == slot10 then
					slot11.is_open = true

					if slot16.id < 10000 and slot6 then
						for slot20, slot21 in pairs(slot6) do
							if slot21.id == slot16.id then
								slot11.rewards = slot21.rewards

								break
							end
						end

						break
					end

					if slot4 and slot4[slot16.id] then
						slot11.rewards = slot4[slot16.id].rewards
					end

					break
				end
			end
		else
			slot11.is_open = true

			if slot10 ~= math.ceil(#slot6 / 2) + 1 then
				if slot6 and slot6[slot5] then
					slot11.rewards = slot6[slot5].rewards
				end

				slot5 = slot5 + 1
			else
				slot11.is_ultimate = true
				slot11.round = slot1.round

				if slot4 and slot4[slot1.optional_id] then
					slot11.rewards = slot4[slot1.optional_id].rewards
				end
			end
		end

		slot2[slot10] = deepCopy(slot11)
	end

	slot0.item_scrollview:setData(slot2, function (slot0)
		slot1 = slot0:getData()
		slot3 = nil
		slot4 = 0

		if Config.HolidayOptionalLotteryData.data_constant and slot2.draw_expend and slot2.draw_expend.val then
			slot3 = slot2.draw_expend.val[1]
		end

		if slot3 then
			slot4 = BackpackController:getInstance():getModel():getItemNumByBid(slot3[1])
		end

		if not slot1.is_open then
			if slot3[2] <= slot4 then
				uv0:beginOpenBagFlip(slot0)
			elseif slot1.gold_time > 0 then
				slot5 = {}

				if slot2 and slot2.draw_expend_value and slot2.draw_expend_value.val then
					slot5 = slot2.draw_expend_value.val[1]
				end

				slot6 = {}

				if slot2 and slot2.draw_original_price and slot2.draw_original_price.val then
					slot6 = slot2.draw_original_price.val[1]
				end

				slot11 = slot5[1] or 3
				slot11 = createImage(title_bg, PathTool.getResFrame("welfare", "welfare_40"), 243, 103, cc.p(0.5, 0.5), true, 1, true)

				slot11:setScaleX(0.9)
				CommonAlert.show(uv1(TI18N("是否消耗(原价<img src='%s' scale=0.3 />%s)<img src='%s' scale=0.3 />%s进行翻牌？\n今日剩余钻石折扣兑换次数<div fontcolor=#289b14>%s</div>次！"), PathTool.getItemRes(Config.ItemData.data_get_data(slot6[1] or 3).icon), slot6[2], PathTool.getItemRes(Config.ItemData.data_get_data(slot11).icon), slot5[2], slot1.gold_time), TI18N("确定"), function ()
					uv0:beginOpenBagFlip(uv1)
				end, TI18N("取消"), nil, CommonAlert.type.rich).alert_panel:addChild(slot11)
			elseif slot1.original_gold_time > 0 then
				if slot2 and slot2.draw_original_price and slot2.draw_original_price.val then
					original_consume = slot2.draw_original_price.val[1]
				end

				slot7 = CommonAlert.show(uv1(TI18N("是否消耗<img src='%s' scale=0.3 />%s进行翻牌？\n今日剩余钻石兑换次数<div fontcolor=#289b14>%s</div>次！"), PathTool.getItemRes(Config.ItemData.data_get_data(original_consume[1] or 3).icon), original_consume[2], slot1.original_gold_time), TI18N("确定"), function ()
					uv0:beginOpenBagFlip(uv1)
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			else
				CommonAlert.show(TI18N("今日钻石兑换次数已达上限！"), TI18N("获取更多"), function ()
					if ActionController:getInstance():getActionSubTabVo(991048) then
						slot0:openActionMainPanel(false)
						slot0:openActionMainPanel(true, nil, slot1.bid)
					else
						message(TI18N("该活动已结束"))
					end
				end, TI18N("取消"))
			end
		elseif slot1.is_ultimate and slot1.round then
			uv2:openFortuneBagSelectWindow(true, {
				select_type_id = 0,
				cur_round = slot1.round
			})
		end
	end)
end

function ActionFortuneBagDrawPanel.setGuideEffect(slot0)
	if not slot0.data then
		return
	end

	slot0.is_select_ultimate = slot0.data.optional_id ~= nil and slot0.data.optional_id ~= 0

	if slot0.data.round == 1 and not slot0.is_select_ultimate then
		if slot0.guide_effect == nil then
			slot1, slot2 = slot0.item_ultimate_reward:getPosition()
			slot0.guide_effect = createEffectSpine(PathTool.getEffectRes(240), cc.p(slot1, slot2), cc.p(0.5, 0.5), true, PlayerAction.action_1)

			slot0:addChild(slot0.guide_effect)
		else
			slot0.guide_effect:setVisible(true)
		end
	elseif slot0.guide_effect then
		slot0.guide_effect:setVisible(false)
	end
end

function ActionFortuneBagDrawPanel.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1
	slot2 = Config.HolidayOptionalLotteryData.data_constant
	slot0.is_select_ultimate = slot1.optional_id ~= nil and slot1.optional_id ~= 0
	slot0.can_flip = not slot0.is_select_ultimate

	if slot1.start_time and slot1.end_time then
		slot0.txt_time_value:setString(TimeTool.getMD2(slot1.start_time) .. "-" .. TimeTool.getMD2(slot1.end_time))
	end

	if slot1.next_round then
		slot0.btn_next:setVisible(slot1.next_round == 1)
	end

	if slot1.award_list and uv0 <= #slot1.award_list then
		message(TI18N("你已获得全部奖励"))
	end

	if slot2 and slot2.draw_expend and slot2.draw_expend.val then
		slot0.draw_consume = slot2.draw_expend.val[1]
	end

	if slot0.draw_consume then
		if Config.ItemData.data_get_data(slot0.draw_consume[1]) then
			loadSpriteTexture(slot0.icon_sprite, PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
		end

		count = BackpackController:getInstance():getModel():getItemNumByBid(slot0.draw_consume[1])

		slot0.icon_num:setString(count or 0)
	end

	if slot1.round ~= nil then
		slot0.txt_wheels:setString(uv1(TI18N("第%s轮"), StringUtil.numToChinese(slot1.round)))
	end

	slot0:setRewardData(slot1)
end

function ActionFortuneBagDrawPanel.setUltimateReward(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.is_select_ultimate = slot1.optional_id ~= nil and slot1.optional_id ~= 0
	slot2 = Config.HolidayOptionalLotteryData.data_optional_award[slot0.camp_id]

	slot0.item_ultimate_reward.lock_icon:setVisible(not slot0.is_select_ultimate)
	slot0.item_ultimate_reward.replace:setVisible(slot0.is_select_ultimate)
	slot0.item_ultimate_reward.icon:setVisible(slot0.is_select_ultimate)

	if slot0.is_select_ultimate and slot2[slot1.optional_id] then
		slot0.item_ultimate_reward.icon:setData()

		slot3 = {}
		slot3 = deepCopy(Config.ItemData.data_get_data(slot2[slot1.optional_id].rewards[1][1]))
		slot3.quantity = slot2[slot1.optional_id].rewards[1][2]

		slot0.item_ultimate_reward.icon:setData(slot3)
	end

	if not slot0.ultimaet_add_effect then
		slot3 = slot0.item_ultimate_reward.lock_icon:getContentSize()
		slot0.ultimaet_add_effect = createEffectSpine(PathTool.getEffectRes(353), cc.p(slot3.width / 2, slot3.height / 2), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.item_ultimate_reward.lock_icon:addChild(slot0.ultimaet_add_effect)
	end
end

function ActionFortuneBagDrawPanel.DeleteMe(slot0)
	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	doStopAllActions(slot0.txt_time_value)

	if slot0.update_fortune_bag_draw_event then
		GlobalEvent:getInstance():UnBind(slot0.update_fortune_bag_draw_event)

		slot0.update_fortune_bag_draw_event = nil
	end

	if slot0.reward_item_list then
		for slot4, slot5 in pairs(slot0.reward_item_list) do
			slot5:DeleteMe()
		end

		slot0.reward_item_list = nil
	end

	doStopAllActions(slot0.cur_reward_scrollview)

	if slot0.opening_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.opening_ticket)

		slot0.opening_ticket = nil
	end

	if slot0.bag_effect then
		slot0.bag_effect:clearTracks()
		slot0.bag_effect:removeFromParent()

		slot0.bag_effect = nil
	end

	if slot0.ultimaet_add_effect then
		slot0.ultimaet_add_effect:clearTracks()
		slot0.ultimaet_add_effect:removeFromParent()

		slot0.ultimaet_add_effect = nil
	end

	if slot0.guide_effect then
		slot0.guide_effect:clearTracks()
		slot0.guide_effect:removeFromParent()

		slot0.guide_effect = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end

	slot0:clearTimeTicket()
end

FortuneBagItem = class("FortuneBagItem", function ()
	return ccui.Widget:create()
end)

function FortuneBagItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function FortuneBagItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_fortune_bag_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setContentSize(cc.size(60, 60))
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setSwallowTouches(false)

	slot0.bag_bg = slot0.main_container:getChildByName("bag_bg")
	slot0.bag_fg = slot0.main_container:getChildByName("bag_fg")

	slot0.bag_fg:setLocalZOrder(20)
	slot0.bag_fg:setVisible(false)

	slot0.goods_item = BackPackItem.new(true, true)

	slot0.goods_item:setScale(0.7)
	slot0.goods_item:setAnchorPoint(0.5, 0.5)
	slot0.goods_item:setPosition(slot0.bag_bg:getContentSize().width / 2, slot0.bag_bg:getContentSize().height / 2)
	slot0.goods_item:setTouchEnabled(false)
	slot0.goods_item:setSwallowTouches(false)
	slot0.bag_bg:addChild(slot0.goods_item)
	slot0.goods_item:setVisible(false)
end

function FortuneBagItem.register_event(slot0)
	slot0.main_container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function FortuneBagItem.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	slot0:resetItemFlip()

	if slot1.rewards and next(slot1.rewards) ~= nil then
		slot2 = {}
		slot2 = deepCopy(Config.ItemData.data_get_data(slot1.rewards[1][1]))
		slot2.quantity = slot1.rewards[1][2]

		slot0.goods_item:setData(slot2)
	elseif slot1.is_open then
		slot0.goods_item:setData({})
	end

	if slot1.is_open then
		slot0.bag_bg:setVisible(true)
		slot0.goods_item:setVisible(true)
		slot0.bag_fg:setVisible(false)
	else
		slot0.bag_bg:setVisible(false)
		slot0.goods_item:setVisible(false)
		slot0.bag_fg:setVisible(true)
	end
end

function FortuneBagItem.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function FortuneBagItem.getData(slot0)
	return slot0.data
end

function FortuneBagItem.getItemPosition(slot0)
	if slot0 then
		return cc.p(slot0:getPosition())
	end
end

function FortuneBagItem.setItemFlip(slot0, slot1)
	if slot1 <= 0 then
		slot0.bag_bg:setVisible(true)
		slot0.bag_fg:setVisible(false)
		slot0.bag_bg:setScaleX(math.abs(slot1) / uv0)
	else
		slot0.bag_fg:setVisible(true)
		slot0.bag_bg:setVisible(false)
		slot0.bag_fg:setScaleX(slot1 / uv0)
	end
end

function FortuneBagItem.resetItemFlip(slot0)
	slot0.bag_bg:setScaleX(1)
	slot0.bag_fg:setScaleX(1)

	if slot0.data.is_open then
		slot0.bag_bg:setVisible(true)
		slot0.goods_item:setVisible(true)
		slot0.bag_fg:setVisible(false)
	else
		slot0.bag_bg:setVisible(false)
		slot0.goods_item:setVisible(false)
		slot0.bag_fg:setVisible(true)
	end
end

function FortuneBagItem.setOpenItemFlip(slot0, slot1)
	if slot1 <= 0 then
		slot0.bag_fg:setVisible(true)
		slot0.bag_bg:setVisible(false)
		slot0.bag_fg:setScaleX(math.abs(slot1) / uv0)
	else
		slot0.bag_bg:setVisible(true)
		slot0.bag_fg:setVisible(false)
		slot0.bag_bg:setScaleX(slot1 / uv0)
	end
end

function FortuneBagItem.DeleteMe(slot0)
	if slot0.goods_item then
		slot0.goods_item:DeleteMe()
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
