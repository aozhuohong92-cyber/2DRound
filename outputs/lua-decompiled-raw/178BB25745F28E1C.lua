slot1 = TimesummonController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
ActionTimeElfinSummonPanel = class("ActionTimeElfinSummonPanel", function ()
	return ccui.Widget:create()
end)

function ActionTimeElfinSummonPanel.ctor(slot0, slot1)
	slot0._summon_type_1 = 1
	slot0._summon_type_10 = 3
	slot0._summon_type = 1
	slot0._init_flag = false
	slot0._init_status = false
	slot0.award_item_list = {}
	slot0.arriveLuckly_label = {}
	slot0.win_item_list = {}
	slot0.rewards_info = nil
	slot0.cur_ani_time = 0

	if Config.HolidaySpriteLotteryData.data_const.common_s then
		slot0.summon_item_bid = slot2.val
	end

	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("timesummon", "timesummon"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New()

	slot0.resources_load:addAllList(slot0.res_list, function ()
		uv0:loadResListCompleted()
	end)
end

function ActionTimeElfinSummonPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	uv0:send26521()

	slot0._init_flag = true
end

function ActionTimeElfinSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_time_elfin_summon_panel"))

	slot0.root_wnd:setPosition(-40, -84)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.effect_panel = slot1:getChildByName("effect_panel")
	slot0.win_award_panel = slot1:getChildByName("win_award_panel")
	slot0.image_bg = slot1:getChildByName("image_bg")
	slot0.title_img = slot1:getChildByName("title_img")
	slot0.item_num_txt = slot1:getChildByName("item_num_txt")

	slot0.item_num_txt:setTextColor(Config.ColorData.data_color4[1])
	slot0.item_num_txt:enableOutline(Config.ColorData.data_color4[2], 2)

	slot0.item_icon = slot1:getChildByName("item_icon")

	loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(Config.HolidaySpriteLotteryData.data_const.common_s.val), LOADTEXT_TYPE)

	slot0.baodi_bg = slot1:getChildByName("baodi_bg")
	slot0.award_btn = slot1:getChildByName("award_btn")

	slot0.award_btn:getChildByName("label"):setString(TI18N("奖励预览"))

	slot0.preview_btn = slot1:getChildByName("preview_btn")

	slot0.preview_btn:getChildByName("label"):setString(TI18N("幽灵预览"))

	slot0.summon_btn_1 = slot1:getChildByName("summon_btn_1")

	slot0.summon_btn_1:getChildByName("label"):setString(TI18N("召唤1次"))

	slot0.summon_btn_10 = slot1:getChildByName("summon_btn_10")

	slot0.summon_btn_10:getChildByName("label"):setString(TI18N("召唤10次"))

	slot0.time_txt = slot1:getChildByName("time_txt")

	slot1:getChildByName("time_txt_0"):setString(TI18N("剩余时间："))

	slot0.progress_panel = slot1:getChildByName("progress_panel")
	slot0.progress = slot0.progress_panel:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)

	slot0.btnRule = slot1:getChildByName("btnRule")

	slot0:showEffect1(true, PlayerAction.action_1)
end

function ActionTimeElfinSummonPanel.showEffect1(slot0, slot1, slot2, slot3)
	if slot1 == true then
		slot0.cur_action_name = slot2 or PlayerAction.action_1

		if not tolua.isnull(slot0.effect_panel) and slot0.draw_effect == nil then
			slot0.draw_effect = createEffectSpine("E27201", cc.p(0, -154), cc.p(0.5, 0.5), slot3 or false, slot2, handler(slot0, slot0.onEffectCallBack))

			slot0.effect_panel:addChild(slot0.draw_effect)
		elseif slot0.draw_effect then
			if PlayerAction.action_1 == slot2 then
				slot0.draw_effect:setToSetupPose()
			end

			slot0.draw_effect:setAnimation(0, slot2, slot3)
		end
	elseif slot0.draw_effect then
		slot0.draw_effect:clearTracks()
		slot0.draw_effect:removeFromParent()

		slot0.draw_effect = nil
	end
end

function ActionTimeElfinSummonPanel.showEffect2(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.win_award_panel) and slot0.draw_effect_2 == nil then
			slot0.draw_effect_2 = createEffectSpine("E27203", cc.p(slot0.win_award_panel:getContentSize().width / 2, slot0.win_award_panel:getContentSize().height / 2 - 3), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.win_award_panel:addChild(slot0.draw_effect_2)
		end
	elseif slot0.draw_effect_2 then
		slot0.draw_effect_2:clearTracks()
		slot0.draw_effect_2:removeFromParent()

		slot0.draw_effect_2 = nil
	end
end

function ActionTimeElfinSummonPanel.showEffect4(slot0, slot1)
	if slot1 == true then
		if not tolua.isnull(slot0.win_award_panel) and slot0.draw_effect_4 == nil then
			slot0.draw_effect_4 = createEffectSpine("E27204", cc.p(slot0.win_award_panel:getContentSize().width / 2, slot0.win_award_panel:getContentSize().height / 2 - 3), cc.p(0.5, 0.5), false, PlayerAction.action)

			slot0.win_award_panel:addChild(slot0.draw_effect_4)
		end
	elseif slot0.draw_effect_4 then
		slot0.draw_effect_4:clearTracks()
		slot0.draw_effect_4:removeFromParent()

		slot0.draw_effect_4 = nil
	end
end

function ActionTimeElfinSummonPanel.showEffect3(slot0, slot1, slot2)
	if slot1 == true then
		if not tolua.isnull(slot0.effect_panel) and slot0.draw_effect_3 == nil then
			slot0.draw_effect_3 = createEffectSpine("E27202", cc.p(slot0.effect_panel:getContentSize().width / 2, slot0.effect_panel:getContentSize().height / 2 - 224), cc.p(0.5, 0.5), false, slot2 or PlayerAction.action_1, handler(slot0, slot0.onEffectCallBack2))

			slot0.effect_panel:addChild(slot0.draw_effect_3)
		end
	elseif slot0.draw_effect_3 then
		slot0.draw_effect_3:clearTracks()
		slot0.draw_effect_3:removeFromParent()

		slot0.draw_effect_3 = nil
	end
end

function ActionTimeElfinSummonPanel.onEffectCallBack(slot0)
	if slot0.cur_action_name == PlayerAction.action_2 then
		slot0:showEffect1(true, PlayerAction.action_3, true)
		slot0:openEndTimer(true)
	end
end

function ActionTimeElfinSummonPanel.onEffectCallBack2(slot0)
	uv0:openActionTimeElfinSummonGainWindow(true, slot0.rewards_info, TRUE)
end

function ActionTimeElfinSummonPanel.updateBaodiCount(slot0)
	if not slot0.baodi_bg or not slot0.data then
		return
	end

	if not slot0.data.item_id or slot0.data.item_id == 0 then
		slot0.baodi_bg:setVisible(false)

		return
	end

	slot0.baodi_bg:setVisible(true)

	if not slot0.baodi_item then
		slot0.baodi_item = BackPackItem.new(true, true, false, 0.35)

		slot0.baodi_item:setDefaultTip()
		slot0.baodi_item:setPosition(cc.p(30, 22.5))
		slot0.baodi_bg:addChild(slot0.baodi_item)
	end

	if not slot0.cur_show_bid or slot0.cur_show_bid ~= slot0.data.item_id then
		slot0.baodi_item:setBaseData(slot0.data.item_id, slot0.data.item_num)

		slot0.cur_show_bid = slot0.data.item_id
	end

	slot1 = slot0.data.must_count or 0

	if not slot0.baodi_text then
		slot0.baodi_text = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(152, 22.5))

		slot0.baodi_bg:addChild(slot0.baodi_text)
	end

	slot0.baodi_text:setString(string.format("<div fontcolor=#ffffff outline=2,#000000>剩余</div><div fontcolor=#5fde46 outline=2,#000000>%d</div><div fontcolor=#ffffff outline=2,#000000>次召唤内必出</div>", slot1))
end

function ActionTimeElfinSummonPanel.updateImageBg(slot0)
	if slot0.config and slot0.config.res_id and (not slot0.cur_res_id or slot0.cur_res_id ~= slot0.config.res_id) and slot0.config.call_bg then
		slot0.bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg/timesummon", string.format("txt_cn_elfinsummon_bigbg_%d", slot0.config.call_bg), true), ResourcesType.single, slot0.bg_load)
		slot0.title_load = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getPlistImgForDownLoad("bigbg/timesummon", string.format("txt_cn_elfinsummon_%d", slot0.config.res_id), false), ResourcesType.single, slot0.title_load)
		slot0.cur_res_id = slot0.config.res_id
	end
end

function ActionTimeElfinSummonPanel.updateSummonBtnStatus(slot0)
	if slot0.data and slot0.config and slot0.summon_item_bid then
		slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid)

		if not slot0.summon_txt_1 then
			slot0.summon_txt_1 = createRichLabel(18, nil, cc.p(0.5, 0.5), cc.p(120.5, 22))

			slot0.summon_btn_1:addChild(slot0.summon_txt_1)
		end

		slot3 = ""

		if slot0.data.free_time and slot0.data.free_time <= GameNet:getInstance():getTime() then
			slot3 = TI18N("<div fontcolor=#ffffff>免费召唤</div>")

			slot0:openSummonFreeTimer(false)

			slot0._summon_type_1 = 1
		elseif slot1 >= 1 then
			if Config.ItemData.data_get_data(slot0.summon_item_bid) then
				slot3 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot4.icon), slot1)
			end

			slot0:openSummonFreeTimer(false)

			slot0._summon_type_1 = 4
		elseif slot0.data.free_time then
			slot0.left_time = slot0.data.free_time - slot2
			slot3 = string.format(TI18N("<div fontcolor=#35ff14>%s</div><div fontcolor=#ffffff>后免费</div>"), TimeTool.GetTimeFormat(slot0.left_time))

			slot0:openSummonFreeTimer(true)

			slot0._summon_type_1 = 3
		end

		slot0.summon_txt_1:setString(slot3)

		if not slot0.summon_txt_10 then
			slot0.summon_txt_10 = createRichLabel(18, nil, cc.p(0.5, 0.5), cc.p(120.5, 22))

			slot0.summon_btn_10:addChild(slot0.summon_txt_10)
		end

		slot4 = ""

		if slot1 >= 10 then
			if Config.ItemData.data_get_data(slot0.summon_item_bid) then
				slot4 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot5.icon), slot1)
			end

			slot0._summon_type_10 = 4
		else
			slot4 = string.format(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot0.config.loss_gold_ten[1][1]), slot0.config.loss_gold_ten[1][2])
			slot0._summon_type_10 = 3
		end

		slot0.summon_txt_10:setString(slot4)
	end
end

function ActionTimeElfinSummonPanel.openSummonFreeTimer(slot0, slot1)
	if slot1 == true then
		if slot0.left_time > 0 and slot0.summon_txt_1 then
			if not slot0.summon_timer then
				slot0.summon_timer = GlobalTimeTicket:getInstance():add(function ()
					if uv0.data and uv0.data.free_time - GameNet:getInstance():getTime() > 0 then
						uv0.left_time = uv0.data.free_time - GameNet:getInstance():getTime()

						uv0.summon_txt_1:setString(string.format(TI18N("<div fontcolor=#35ff14>%s</div><div fontcolor=#ffffff>后免费</div>"), TimeTool.GetTimeFormat(uv0.left_time)))

						uv0._summon_type_1 = 3
					else
						uv0.summon_txt_1:setString(TI18N("<div fontcolor=#ffffff>免费召唤</div>"))

						uv0._summon_type_1 = 1

						GlobalTimeTicket:getInstance():remove(uv0.summon_timer)

						uv0.summon_timer = nil
					end
				end, 1)
			end
		elseif slot0.summon_timer ~= nil then
			GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

			slot0.summon_timer = nil
		end
	elseif slot0.summon_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.summon_timer)

		slot0.summon_timer = nil
	end
end

function ActionTimeElfinSummonPanel.updateProgress(slot0)
	slot2 = 80

	if Config.HolidaySpriteLotteryData.data_award[slot0.data.camp_id] then
		for slot8, slot9 in ipairs(slot1) do
			if slot0.award_item_list[slot8] == nil then
				slot10 = RoundItem.new(true, 0.55, 0.6)

				slot0.progress_panel:addChild(slot10)

				slot0.award_item_list[slot8] = slot10

				slot10:setPosition(cc.p(16.5, slot2 + (slot8 - 1) * (527 - slot2 + 0) / (#slot1 - 1)))
				slot10:setBaseData(slot9.reward[1][1], slot9.reward[1][2])
				slot10:setVisibleRedPoint(false)
				slot10:setVisibleRoundBG(false)
				slot10:addCallBack(function ()
					uv0:send26523(uv1.id)
				end)
			end

			if not slot0.arriveLuckly_label[slot8] and slot0.award_item_list[slot8] then
				slot0.arriveLuckly_label[slot8] = createLabel(22, cc.c3b(244, 238, 211), cc.c3b(0, 0, 0), 45, slot11, "", slot0.progress_panel, 2, cc.p(0, 0.5))
			end

			if slot0.arriveLuckly_label[slot8] then
				slot0.arriveLuckly_label[slot8]:setString(slot9.times)
			end
		end

		slot5 = 0
		slot6 = 527
		slot8 = 0

		for slot12, slot13 in ipairs(slot1) do
			if slot12 == 1 then
				if slot0.data.times <= slot13.times then
					slot8 = slot0.data.times / slot13.times * (slot2 - 0)

					break
				else
					slot8 = slot7
				end
			elseif slot0.data.times <= slot13.times then
				slot8 = slot8 + (slot0.data.times - slot5) / (slot13.times - slot5) * slot4

				break
			else
				slot8 = slot8 + slot4
			end

			slot5 = slot13.times
		end

		slot0.progress:setPercent(slot8 / slot6 * 100)

		if not slot0.num_label then
			slot0.num_label = createLabel(22, cc.c3b(244, 238, 211), cc.c3b(0, 0, 0), -20, -20, "", slot0.progress_panel, 2, cc.p(0, 0.5))
		end

		slot0.num_label:setString(uv1(TI18N("已抽:%d"), slot0.data.times))
	end

	slot0:updateAwardStatus()
end

function ActionTimeElfinSummonPanel.updateAwardStatus(slot0)
	if Config.HolidaySpriteLotteryData.data_award[slot0.data.camp_id] then
		for slot5, slot6 in pairs(slot1) do
			slot7 = false
			slot8 = false

			for slot12, slot13 in pairs(slot0.data.reward_list) do
				if slot6.id == slot13.id then
					slot8 = true

					break
				end
			end

			for slot12, slot13 in ipairs(slot0.data.award_list) do
				if slot6.id == slot13.id then
					slot7 = true

					break
				end
			end

			setChildUnEnabled(false, slot0.award_item_list[slot5])

			if slot0.award_item_list[slot5] then
				slot0.award_item_list[slot5]:setDefaultTip(not slot7)
				slot0.award_item_list[slot5]:setVisibleRedPoint(slot7)

				if slot8 == true then
					setChildUnEnabled(true, slot0.award_item_list[slot5])
				end
			end
		end
	end
end

function ActionTimeElfinSummonPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.summon_item_bid then
		if slot1 and slot2 then
			if slot1 == BackPackConst.Bag_Code.BACKPACK then
				for slot6, slot7 in pairs(slot2) do
					if slot7 and slot7.base_id and slot0.summon_item_bid == slot7.base_id then
						slot0.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))
						slot0:updateSummonBtnStatus()

						break
					end
				end
			end
		else
			slot0.item_num_txt:setString(BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid))
		end
	end
end

function ActionTimeElfinSummonPanel.register_event(slot0)
	registerButtonEventListener(slot0.award_btn, function ()
		if uv0.config and uv0.data then
			uv1:openTimeSummonAwardView(true, uv0.config.group_id, uv0.data, TimesummonConst.ActonInfoType.ElfinType)
		end
	end, true)
	registerButtonEventListener(slot0.preview_btn, function ()
		uv0:send23219(ActionRankCommonType.time_elfin_summon)
	end, true)
	registerButtonEventListener(slot0.summon_btn_1, function ()
		slot0, slot1 = HeroController:getInstance():getModel():getHeroMaxCount()

		if uv0._summon_type_1 == 3 and uv0.config then
			uv0:showAlert(uv0.config.loss_gold_once[1][2], Config.ItemData.data_get_data(uv0.config.loss_gold_once[1][1]).icon, Config.ItemData.data_get_data(uv0.config.gain_once[1][1]).name or "", uv0.config.gain_once[1][2], 1, function ()
				uv0._summon_type = 1

				uv1:send26522(1, uv0._summon_type_1, false)
			end)
		else
			uv0._summon_type = 1

			uv1:send26522(1, uv0._summon_type_1, false)
		end
	end, true)
	registerButtonEventListener(slot0.summon_btn_10, function ()
		if uv0._summon_type_10 == 3 and uv0.config then
			uv0:showAlert(uv0.config.loss_gold_ten[1][2], Config.ItemData.data_get_data(uv0.config.loss_gold_ten[1][1]).icon, Config.ItemData.data_get_data(uv0.config.gain_ten[1][1]).name or "", uv0.config.gain_ten[1][2], 10, function ()
				uv0._summon_type = 2

				uv1:send26522(10, uv0._summon_type_10, false)
			end)
		else
			uv0._summon_type = 2

			uv1:send26522(10, uv0._summon_type_10, false)
		end
	end, true)

	if not slot0.update_summon_data_event then
		slot0.update_summon_data_event = GlobalEvent:getInstance():Bind(TimesummonEvent.Update_Elfin_Summon_Data_Event, function (slot0)
			uv0:setData(slot0)
		end)
	end

	if not slot0.update_summon_rewards_data_event then
		slot0.update_summon_rewards_data_event = GlobalEvent:getInstance():Bind(TimesummonEvent.Update_Elfin_Summon_Rewards_Data_Event, function (slot0)
			uv0.rewards_info = slot0

			uv0:startEffectAwardShow()
		end)
	end

	if not slot0.update_elfin_item_event then
		slot0.update_elfin_item_event = GlobalEvent:getInstance():Bind(TimesummonEvent.Update_Elfin_Item_Event, function (slot0)
			uv0.rewards_info = slot0

			uv0:updateAwardItmes(false)
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

function ActionTimeElfinSummonPanel.startEffectAwardShow(slot0)
	slot0:showEffect2(false)
	slot0:showEffect3(false)
	slot0:showEffect4(false)

	if slot0.win_item_list and next(slot0.win_item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.win_item_list) do
			if slot5 and slot5.setVisible then
				slot5:setVisible(false)
				slot5:suspendAllActions()
			end
		end
	end

	if not slot0.touchUi then
		slot0.touchUi = ccui.Layout:create()

		slot0.touchUi:setTouchEnabled(true)
		slot0.touchUi:setSwallowTouches(true)
		slot0.touchUi:setContentSize(SCREEN_WIDTH, SCREEN_HEIGHT)
		ViewManager:getInstance():getLayerByTag(ViewMgrTag.DIALOGUE_TAG):addChild(slot0.touchUi)
		handleTouchEnded(slot0.touchUi, function (...)
			uv0:openActionTimeElfinSummonGainWindow(true, uv1.rewards_info, TRUE)

			if uv1.touchUi and not tolua.isnull(uv1.touchUi) then
				uv1.touchUi:removeFromParent()
			end

			uv1.touchUi = nil

			uv1:openEndTimer(false)
			uv1:showEffect1(true, PlayerAction.action_1)
			uv1:showEffect2(false)
			uv1:showEffect4(false)
			uv1:updateAwardItmes(false)
			uv1:showEffect3(false)
		end)
	end

	slot0:showEffect1(true, PlayerAction.action_2)
end

function ActionTimeElfinSummonPanel.endEffectAwardShow(slot0)
	if slot0.touchUi and not tolua.isnull(slot0.touchUi) then
		slot0.touchUi:removeFromParent()
	end

	slot0.touchUi = nil

	for slot5, slot6 in ipairs(slot0.rewards_info.sprite_bids) do
		if slot6.quality >= 4 then
			slot1 = 0 + 1
		end
	end

	slot0:openEndTimer(false)
	slot0:showEffect1(true, PlayerAction.action_1)

	if slot1 > 0 then
		slot0:showEffect2(true)
	else
		slot0:showEffect4(true)
	end

	slot0:updateAwardItmes(false)

	slot2 = PlayerAction.action_1

	if slot0._summon_type == 1 then
		if slot1 > 0 then
			slot2 = PlayerAction.action_2
		end
	else
		slot2 = "action" .. 3 + slot1
	end

	slot0:showEffect3(true, slot2)
end

function ActionTimeElfinSummonPanel.openEndTimer(slot0, slot1)
	if slot1 == true then
		if slot0.roll_timer == nil then
			slot0.roll_timer = GlobalTimeTicket:getInstance():add(function ()
				uv0.cur_ani_time = uv0.cur_ani_time + 1

				if uv0.cur_ani_time >= 2 then
					GlobalTimeTicket:getInstance():remove(uv0.roll_timer)

					uv0.roll_timer = nil
					uv0.cur_ani_time = 0

					uv0:endEffectAwardShow()
				end
			end, 1)
		end
	elseif slot0.roll_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.roll_timer)

		slot0.roll_timer = nil
	end
end

function ActionTimeElfinSummonPanel.showAlert(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	function slot7()
		if uv0.alert then
			uv0.alert:close()

			uv0.alert = nil
		end
	end

	if not slot0.alert then
		slot0.alert = CommonAlert.show(string.format(TI18N("是否使用<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(slot2), slot1, RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019></div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#020019>(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次召唤)</div>"), slot4, slot3, slot5), TI18N("确定"), slot6, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ActionTimeElfinSummonPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if Config.HolidaySpriteLotteryData.data_action[slot0.data.camp_id] and slot2.group_id then
		slot0.config = Config.HolidaySpriteLotteryData.data_summon[slot2.group_id]
	end

	if slot0._init_status == false then
		slot0._init_status = true

		slot0:updateAwardItmes(true)
	end

	setCountDownTime(slot0.time_txt, slot0.data.end_time - GameNet:getInstance():getTime())
	slot0:updateImageBg()
	slot0:updateSummonBtnStatus()
	slot0:updateProgress()
	slot0:updateItemNum()
	slot0:updateBaodiCount()
end

function ActionTimeElfinSummonPanel.updateAwardItmes(slot0, slot1)
	slot2 = nil
	slot3 = 1

	if slot1 == true then
		if slot0.data then
			slot2 = slot0.data.item_id
		end
	elseif slot0.rewards_info then
		if #slot0.rewards_info.sprite_bids > 0 then
			slot8 = SortTools.tableUpperSorter({
				"quality",
				"jie"
			})

			table.sort(slot0.rewards_info.sprite_bids, slot8)

			slot2 = slot0.rewards_info.sprite_bids[1].sprite_bid

			for slot8, slot9 in ipairs(slot0.rewards_info.sprite_bids) do
				if slot9.sprite_bid == slot0.data.item_id then
					slot2 = slot9.sprite_bid

					break
				end
			end
		elseif #slot0.rewards_info.rewards > 0 then
			slot2 = slot0.rewards_info.rewards[1].base_id
			slot3 = slot0.rewards_info.rewards[1].num
		end
	end

	if slot2 then
		for slot7 = 1, 3 do
			if not slot0.win_item_list[slot7] then
				slot8 = BackPackItem.new(true, true, false, 1)

				slot8:setBackgroundOpacity(0)
				slot8:setDefaultTip()
				slot8:setPosition(cc.p(54 + 89 * (slot7 - 1), 59))
				slot0.win_award_panel:addChild(slot8)

				slot0.win_item_list[slot7] = slot8
			end

			slot8:setVisible(true)
			slot8:setBaseData(slot2, slot3)

			slot9 = 0.8

			if Config.ItemData.data_get_data(slot2) and slot10.type and BackPackConst.checkIsElfin(slot10.type) then
				res_id = PathTool.getPlistImgForDownLoad("bigbg/elfin", "elfin_" .. slot2)

				slot8:setItemIcon(res_id)

				slot9 = 1
			end

			slot8:setScale(slot9)
			slot8:setElfinStep(false)
			slot8:setShowNumBg(false)
		end
	end
end

function ActionTimeElfinSummonPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:send26521()
	end

	if slot1 == false then
		if slot0.touchUi and not tolua.isnull(slot0.touchUi) then
			slot0.touchUi:removeFromParent()
		end

		slot0.touchUi = nil
	end
end

function ActionTimeElfinSummonPanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_txt)
	slot0:showEffect1(false)
	slot0:showEffect2(false)
	slot0:showEffect4(false)
	slot0:showEffect3(false)
	slot0:openEndTimer(false)

	if slot0.touchUi and not tolua.isnull(slot0.touchUi) then
		slot0.touchUi:removeFromParent()
	end

	slot0.touchUi = nil

	if slot0.award_item_list and next(slot0.award_item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.award_item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.win_item_list and next(slot0.win_item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.win_item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.title_load then
		slot0.title_load:DeleteMe()

		slot0.title_load = nil
	end

	if slot0.baodi_item then
		slot0.baodi_item:DeleteMe()

		slot0.baodi_item = nil
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	if slot0.update_summon_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_data_event)

		slot0.update_summon_data_event = nil
	end

	if slot0.update_summon_rewards_data_event then
		GlobalEvent:getInstance():UnBind(slot0.update_summon_rewards_data_event)

		slot0.update_summon_rewards_data_event = nil
	end

	if slot0.update_elfin_item_event then
		GlobalEvent:getInstance():UnBind(slot0.update_elfin_item_event)

		slot0.update_elfin_item_event = nil
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

	slot0:openSummonFreeTimer(false)
end
