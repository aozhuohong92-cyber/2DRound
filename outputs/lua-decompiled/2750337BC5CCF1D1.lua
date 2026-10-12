slot1 = TimesummonController:getInstance():getModel()
slot2 = table.insert
ActionTimeSummonPanel = class("ActionTimeSummonPanel", function ()
	return ccui.Widget:create()
end)

function ActionTimeSummonPanel.ctor(slot0, slot1)
	slot0._can_get_award = false
	slot0._award_is_over = false
	slot0._cur_award_data = {}
	slot0._summon_type_1 = 1
	slot0._summon_type_10 = 3
	slot0._init_flag = false

	if Config.RecruitHolidayData.data_const.common_s then
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

function ActionTimeSummonPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	uv0:requestTimeSummonData()

	slot0._init_flag = true
end

function ActionTimeSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_time_summon_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot1:getChildByName("image_bg")
	slot0.progress_txt = slot1:getChildByName("progress_txt")

	slot0.progress_txt:setTextColor(Config.ColorData.data_color4[1])
	slot0.progress_txt:enableOutline(Config.ColorData.data_color4[2], 2)

	slot0.item_num_txt = slot1:getChildByName("item_num_txt")

	slot0.item_num_txt:setTextColor(Config.ColorData.data_color4[1])
	slot0.item_num_txt:enableOutline(Config.ColorData.data_color4[2], 2)

	slot0.progress = slot1:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(0)

	slot0.baodi_bg = slot1:getChildByName("baodi_bg")
	slot0.award_btn = slot1:getChildByName("award_btn")

	slot0.award_btn:getChildByName("label"):setString(TI18N("奖励预览"))

	slot0.preview_btn = slot1:getChildByName("preview_btn")

	slot0.preview_btn:getChildByName("label"):setString(TI18N("英雄预览"))

	slot0.summon_btn_1 = slot1:getChildByName("summon_btn_1")

	slot0.summon_btn_1:getChildByName("label"):setString(TI18N("招募1次"))

	slot0.summon_btn_10 = slot1:getChildByName("summon_btn_10")

	slot0.summon_btn_10:getChildByName("label"):setString(TI18N("招募10次"))

	slot0.time_txt = slot1:getChildByName("time_txt")
	slot0.award_item = BackPackItem.new(true, true, false, 0.6)

	slot0.award_item:setPosition(cc.p(60, 728))
	slot0.award_item:addCallBack(handler(slot0, slot0._onClickAwardItem))
	slot1:addChild(slot0.award_item)

	slot0.res_check_3 = slot1:getChildByName("res_check_3"):setSelected(SysEnv:getInstance():getBool(SysEnv.keys.res_check_3, false)):setPositionX(560)
	slot0.res_check_4 = slot1:getChildByName("res_check_4"):setSelected(SysEnv:getInstance():getBool(SysEnv.keys.res_check_4, false)):setPositionX(560)
	slot0.btn_skip_ani = slot1:getChildByName("btn_skip_ani"):setSelected(SysEnv:getInstance():getBool(SysEnv.keys.skip_recruit_anim, false)):setPositionX(560)
	slot0.res3_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "分解1~3星英雄", slot0.res_check_3, 1)
	slot0.res4_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "分解四星英雄", slot0.res_check_4, 1)
	slot0.skip_ani_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "跳过招募动画", slot0.btn_skip_ani, 1)
end

function ActionTimeSummonPanel._onClickAwardItem(slot0)
	if slot0._can_get_award then
		uv0:requestSummonGetAward()
	elseif slot0.data then
		uv0:openTimeSummonProgressView(true, slot0.data.times, slot0.data.camp_id)
	end
end

function ActionTimeSummonPanel.updateBaodiCount(slot0)
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
		slot0.baodi_item:setPosition(cc.p(20, 22.5))
		slot0.baodi_bg:addChild(slot0.baodi_item)
	end

	if not slot0.cur_show_bid or slot0.cur_show_bid ~= slot0.data.item_id then
		slot0.baodi_item:setBaseData(slot0.data.item_id, slot0.data.item_num)

		slot0.cur_show_bid = slot0.data.item_id
	end

	slot1 = slot0.data.must_count or 0

	if not slot0.baodi_text then
		slot0.baodi_text = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(158, 22.5))

		slot0.baodi_bg:addChild(slot0.baodi_text)
	end

	slot0.baodi_text:setString(string.format(TI18N("<div fontcolor=#ffffff outline=2,#000000>剩余</div><div fontcolor=#5fde46 outline=2,#000000>%d</div><div fontcolor=#ffffff outline=2,#000000>次招募内必出</div>"), slot1))
end

function ActionTimeSummonPanel.updateImageBg(slot0)
	if slot0.config and slot0.config.res_id and (not slot0.cur_res_id or slot0.cur_res_id ~= slot0.config.res_id) then
		slot0.bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg/timesummon", string.format("txt_cn_timesummon_bigbg_%d", slot0.config.res_id), true), ResourcesType.single, slot0.bg_load)
		slot0.cur_res_id = slot0.config.res_id
	end
end

function ActionTimeSummonPanel.updateSummonBtnStatus(slot0)
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

function ActionTimeSummonPanel.openSummonFreeTimer(slot0, slot1)
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

function ActionTimeSummonPanel.updateProgress(slot0)
	if slot0.data and slot0._cur_award_data and next(slot0._cur_award_data) ~= nil then
		slot1 = slot0._cur_award_data.reward[1]

		slot0.award_item:setBaseData(slot1[1], slot1[2])
		slot0.progress:setPercent(slot0.data.times / slot0._cur_award_data.times * 100)

		if slot0._award_is_over then
			slot0.progress_txt:setString(TI18N("招募次数 ") .. slot0.data.times .. "/" .. slot0._cur_award_data.times)
			slot0.award_item:setReceivedIcon(true)
		else
			slot0.progress_txt:setString(TI18N("下一阶段 ") .. slot0.data.times .. "/" .. slot0._cur_award_data.times)
			slot0.award_item:setReceivedIcon(false)
		end

		if slot0._can_get_award == true then
			slot0.award_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
		else
			slot0.award_item:showItemEffect(false)
		end
	end
end

function ActionTimeSummonPanel.updateItemNum(slot0, slot1, slot2)
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

function ActionTimeSummonPanel.register_event(slot0)
	registerButtonEventListener(slot0.award_btn, function ()
		if uv0.config and uv0.data then
			uv1:openTimeSummonAwardView(true, uv0.config.group_id, uv0.data)
		end
	end, true)
	registerButtonEventListener(slot0.preview_btn, function ()
		uv0:send23219(ActionRankCommonType.time_summon)
	end, true)
	registerButtonEventListener(slot0.summon_btn_1, function ()
		slot0, slot1 = HeroController:getInstance():getModel():getHeroMaxCount()

		if uv0:checkHeroBagIsFull() then
			return
		end

		if uv0._summon_type_1 == 3 and uv0.config then
			uv0:showAlert(uv0.config.loss_gold_once[1][2], Config.ItemData.data_get_data(uv0.config.loss_gold_once[1][1]).icon, Config.ItemData.data_get_data(uv0.config.gain_once[1][1]).name or "", uv0.config.gain_once[1][2], 1, function ()
				uv0:requestTimeSummon(1, uv1._summon_type_1)
			end)
		else
			uv1:requestTimeSummon(1, uv0._summon_type_1)
		end
	end, true)
	registerButtonEventListener(slot0.summon_btn_10, function ()
		if uv0:checkHeroBagIsFull() then
			return
		end

		if uv0._summon_type_10 == 3 and uv0.config then
			uv0:showAlert(uv0.config.loss_gold_ten[1][2], Config.ItemData.data_get_data(uv0.config.loss_gold_ten[1][1]).icon, Config.ItemData.data_get_data(uv0.config.gain_ten[1][1]).name or "", uv0.config.gain_ten[1][2], 10, function ()
				uv0:requestTimeSummon(10, uv1._summon_type_10)
			end)
		else
			uv1:requestTimeSummon(10, uv0._summon_type_10)
		end
	end, true)

	if not slot0.update_summon_data_event then
		slot0.update_summon_data_event = GlobalEvent:getInstance():Bind(TimesummonEvent.Update_Summon_Data_Event, function (slot0)
			uv0:setData(slot0)
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

function ActionTimeSummonPanel.checkHeroBagIsFull(slot0)
	slot1, slot2 = HeroController:getInstance():getModel():getHeroMaxCount()

	if slot1 <= slot2 then
		CommonAlert.show(TI18N("英雄列表已满，可通过提升VIP等级或购买增加英雄携带数量，是否前往购买？"), TI18N("前往"), function ()
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
			ActionController:getInstance():openActionMainPanel(false)
		end, TI18N("取消"), nil, CommonAlert.type.common)

		return true
	end

	return false
end

function ActionTimeSummonPanel.showAlert(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
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

	slot10 = string.format(TI18N("是否使用<img src=%s visible=true scale=0.5 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(拥有:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>"), PathTool.getItemRes(slot2), slot1, RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold) .. string.format(TI18N("<div fontColor=#020019>购买</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019></div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#020019>(同时附赠</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>次招募)</div>"), slot4, slot3, slot5)

	if not slot0.alert then
		slot6()
	end
end

function ActionTimeSummonPanel.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if Config.RecruitHolidayData.data_action[slot0.data.camp_id] and slot2.group_id then
		slot0.config = Config.RecruitHolidayData.data_summon[slot2.group_id]
	end

	slot0._can_get_award = false
	slot0._award_is_over = false
	slot0._cur_award_data = {}

	if Config.RecruitHolidayData.data_award[slot0.data.camp_id] then
		slot4 = {}

		for slot8, slot9 in ipairs(slot3) do
			if slot9.times and slot9.times <= slot0.data.times then
				uv0(slot4, slot9)
			end
		end

		slot0.data.reward_list = slot0.data.reward_list or {}

		if #slot4 > #slot0.data.reward_list then
			slot0._can_get_award = true

			for slot8, slot9 in ipairs(slot4) do
				slot0._cur_award_data = slot4[#slot4]
			end
		elseif next(slot4) == nil then
			slot0._cur_award_data = slot3[1]
		elseif slot3[slot4[#slot4].id + 1] then
			slot0._cur_award_data = slot3[slot6]
		else
			slot0._award_is_over = true
			slot0._cur_award_data = slot3[slot5.id]
		end
	end

	slot0.time_txt:setString(TimeTool.getMD2(slot0.data.start_time) .. "~" .. TimeTool.getMD2(slot0.data.end_time))
	slot0:updateImageBg()
	slot0:updateSummonBtnStatus()
	slot0:updateProgress()
	slot0:updateItemNum()
	slot0:updateBaodiCount()
end

function ActionTimeSummonPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:requestTimeSummonData()
	end
end

function ActionTimeSummonPanel.DeleteMe(slot0)
	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.award_item then
		slot0.award_item:DeleteMe()

		slot0.award_item = nil
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
