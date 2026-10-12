slot1 = ReturnActionController:getInstance():getModel()
slot2 = table.insert
ReturnActionSummonPanel = class("ReturnActionSummonPanel", function ()
	return ccui.Widget:create()
end)

function ReturnActionSummonPanel.ctor(slot0, slot1)
	slot0._summon_type_1 = 1
	slot0._summon_type_10 = 3
	slot0._init_flag = false
	slot0.item_list = {}

	if Config.HolidayReturnNewData.data_constant.draw_item_cost then
		slot0.summon_item_bid = slot2.val[1][1]
		slot0.summon_item_num = slot2.val[1][2]
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

function ReturnActionSummonPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
	uv0:initActionSummonItem()
	uv1:sender27903()

	slot0._init_flag = true
end

function ReturnActionSummonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("returnaction/returnaction_summon_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot1:getChildByName("image_bg")
	slot0.item_num_txt = slot1:getChildByName("item_num_txt")
	slot0.item_icon = slot1:getChildByName("item_icon")

	loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot0.summon_item_bid), LOADTEXT_TYPE)

	slot0.baodi_bg = slot1:getChildByName("baodi_bg")
	slot0.award_btn = slot1:getChildByName("award_btn")

	slot0.award_btn:getChildByName("label"):setString(TI18N("奖励预览"))

	slot0.preview_btn = slot1:getChildByName("preview_btn")

	slot0.preview_btn:getChildByName("label"):setString(TI18N("英雄预览"))

	slot0.summon_btn_1 = slot1:getChildByName("summon_btn_1")

	slot0.summon_btn_1:getChildByName("label"):setString(TI18N("祈愿1次"))

	slot0.summon_btn_10 = slot1:getChildByName("summon_btn_10")

	slot0.summon_btn_10:getChildByName("label"):setString(TI18N("祈愿10次"))

	slot0.time_txt = slot1:getChildByName("time_txt")

	slot0.time_txt:setString(TI18N("剩余时间："))

	slot0.time_num = slot1:getChildByName("time_num")
	slot0.cur_num_txt = slot1:getChildByName("cur_num_txt")

	slot0.cur_num_txt:setString(TI18N("剩余抽数:"))

	slot0.cur_num = slot1:getChildByName("cur_num")
	slot0.award_panel = slot1:getChildByName("award_panel")
end

function ReturnActionSummonPanel.updateAward(slot0)
	if not slot0.data then
		return
	end

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			if slot5 and not tolua.isnull(slot5) then
				if slot5.cur_num_lab == nil then
					slot5.cur_num_lab = createLabel(24, 1, nil, slot5:getContentSize().width / 2, 0, "", slot5:getRoot(), 0, cc.p(0.5, 1))
				end

				if slot5:getData() then
					slot7, slot8 = uv0:getActionSummonItemNumById(slot6.id)

					if slot7 and slot8 then
						if slot8 - slot7 <= 0 then
							if slot5.setReceivedIcon then
								slot5:setReceivedIcon(true)
							end

							if slot5.showItemEffect then
								slot5:showItemEffect(false)
							end
						else
							if slot5.setReceivedIcon then
								slot5:setReceivedIcon(false)
							end

							if slot5.showItemEffect then
								slot5:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
							end
						end

						slot5.cur_num_lab:setString(string.format("%d/%d", slot8 - slot7, slot8))
					end
				end
			end
		end
	elseif Config.HolidayReturnNewData.data_summon[uv0:getActionPeriod()] then
		slot3 = {}

		for slot7, slot8 in pairs(slot2) do
			if slot8.show == 1 and slot3[slot8.type_id] == nil then
				slot3[slot8.type_id] = {
					slot8.rewards[1][1],
					slot8.rewards[1][2],
					slot8.sort
				}
			end
		end

		slot4 = {}

		for slot8, slot9 in pairs(slot3) do
			uv1(slot4, {
				slot9[1],
				slot9[2],
				sort = slot9[3]
			})
		end

		table.sort(slot4, SortTools.KeyLowerSorter("sort"))

		slot0.item_list = commonShowSingleRowItemList(slot0.award_panel, slot0.item_list, slot4, {
			scale = 0.8,
			max_count = 4,
			is_center = true,
			space_x = 20
		})

		delayRun(slot0.award_panel, 0.1, function ()
			for slot3, slot4 in pairs(uv0.item_list) do
				if slot4 and not tolua.isnull(slot4) then
					if slot4.cur_num_lab == nil then
						slot4.cur_num_lab = createLabel(24, 1, 2, slot4:getRoot():getContentSize().width / 2, 0, "", slot4:getRoot(), 2, cc.p(0.5, 1))
					end

					if slot4:getData() then
						slot6, slot7 = uv1:getActionSummonItemNumById(slot5.id)

						if slot6 and slot7 then
							if slot7 - slot6 <= 0 then
								if slot4.setReceivedIcon then
									slot4:setReceivedIcon(true)
								end

								if slot4.showItemEffect then
									slot4:showItemEffect(false)
								end
							else
								if slot4.setReceivedIcon then
									slot4:setReceivedIcon(false)
								end

								if slot4.showItemEffect then
									slot4:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
								end
							end

							slot4.cur_num_lab:setString(string.format("%d/%d", slot7 - slot6, slot7))
						end
					end
				end
			end
		end)
	end
end

function ReturnActionSummonPanel.updateBaodiCount(slot0)
	if not slot0.data then
		return
	end

	slot2 = slot0.data.limit_draw_time or 0

	slot0.cur_num:setString(string.format("%d/%d", slot2 - (slot0.data.draw_time or 0), slot2))
end

function ReturnActionSummonPanel.updateImageBg(slot0)
	if uv0:getActionPeriod() and (not slot0.cur_res_id or slot0.cur_res_id ~= slot1) then
		slot0.bg_load = loadImageTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("bigbg/returnaction", string.format("txt_cn_return_summon_%d", slot1)), ResourcesType.single, slot0.bg_load)
		slot0.cur_res_id = slot1
	end
end

function ReturnActionSummonPanel.updateSummonBtnStatus(slot0)
	if slot0.data and slot0.summon_item_bid then
		slot1 = BackpackController:getInstance():getModel():getItemNumByBid(slot0.summon_item_bid)

		if not slot0.summon_txt_1 then
			slot0.summon_txt_1 = createRichLabel(18, nil, cc.p(0.5, 0.5), cc.p(120.5, 22))

			slot0.summon_btn_1:addChild(slot0.summon_txt_1)
		end

		slot2 = GameNet:getInstance():getTime()
		slot3 = ""

		if slot0.data.free_time and slot0.data.free_time == 1 then
			slot3 = TI18N("<div fontcolor=#ffffff>免费</div>")
			slot0._summon_type_1 = 1
		elseif slot0.summon_item_num <= slot1 then
			if Config.ItemData.data_get_data(slot0.summon_item_bid) then
				slot3 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot4.icon), slot0.summon_item_num)
			end

			slot0._summon_type_1 = 4
		else
			if Config.ItemData.data_get_data(slot0.summon_item_bid) then
				slot3 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot4.icon), slot0.summon_item_num)
			end

			slot0._summon_type_1 = 3
		end

		slot0.summon_txt_1:setString(slot3)

		if not slot0.summon_txt_10 then
			slot0.summon_txt_10 = createRichLabel(18, nil, cc.p(0.5, 0.5), cc.p(120.5, 22))

			slot0.summon_btn_10:addChild(slot0.summon_txt_10)
		end

		slot4 = ""

		if Config.ItemData.data_get_data(slot0.summon_item_bid) then
			slot4 = string.format(TI18N("<img src='%s' scale=0.4 /><div fontcolor=#ffffff>%d</div>"), PathTool.getItemRes(slot5.icon), 10 * slot0.summon_item_num)
		end

		if slot1 >= 10 * slot0.summon_item_num then
			slot0._summon_type_10 = 4
		else
			slot0._summon_type_10 = 3
		end

		slot0.summon_txt_10:setString(slot4)
	end
end

function ReturnActionSummonPanel.updateItemNum(slot0, slot1, slot2)
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

function ReturnActionSummonPanel.register_event(slot0)
	registerButtonEventListener(slot0.award_btn, function ()
		if uv0:getActionPeriod() and uv1.data then
			uv2:openReturnActionSummonAwardView(true, slot0, uv1.data)
		end
	end, true)
	registerButtonEventListener(slot0.preview_btn, function ()
		TimesummonController:getInstance():send23219(BattlePreviewParm.ReturnActionSummon)
	end, true)
	registerButtonEventListener(slot0.summon_btn_1, function ()
		slot0, slot1 = HeroController:getInstance():getModel():getHeroMaxCount()
		slot2 = Config.HolidayReturnNewData.data_constant.draw_item_value

		if uv0._summon_type_1 == 3 and slot2 then
			slot3 = BackpackController:getInstance():getModel():getItemNumByBid(uv0.summon_item_bid)
			slot7 = uv0.summon_item_num

			uv0:showAlert(Config.ItemData.data_get_data(uv0.summon_item_bid).icon, Config.ItemData.data_get_data(slot2.val[1][1]).icon, slot7, slot7 * slot2.val[1][2], function ()
				uv0:sender27904(2)
			end)
		else
			slot3 = 1

			if uv0._summon_type_1 == 4 then
				slot3 = 2
			end

			uv1:sender27904(slot3)
		end
	end, true)
	registerButtonEventListener(slot0.summon_btn_10, function ()
		slot0 = Config.HolidayReturnNewData.data_constant.draw_item_value

		if uv0._summon_type_10 == 3 and slot0 then
			slot5 = 10 * uv0.summon_item_num - BackpackController:getInstance():getModel():getItemNumByBid(uv0.summon_item_bid)

			uv0:showAlert(Config.ItemData.data_get_data(uv0.summon_item_bid).icon, Config.ItemData.data_get_data(slot0.val[1][1]).icon, slot5, slot5 * slot0.val[1][2], function ()
				uv0:sender27904(3)
			end)
		else
			uv1:sender27904(3)
		end
	end, true)

	if not slot0.update_summon_data_event then
		slot0.update_summon_data_event = GlobalEvent:getInstance():Bind(ReturnActionEvent.Summon_Data_Event, function ()
			uv0:setData()
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

function ReturnActionSummonPanel.showAlert(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.alert then
		slot0.alert:close()

		slot0.alert = nil
	end

	slot6 = RoleController:getInstance():getRoleVo().gold + RoleController:getInstance():getRoleVo().red_gold

	if not slot0.alert then
		slot0.alert = CommonAlert.show(string.format(TI18N("祈愿还差<img src=%s visible=true scale=0.35 /> *%d个，是否消耗 <img src=%s visible=true scale=0.35 /><div fontColor=#289b14 fontsize=26> *%d</div> 补足并进行祈愿"), PathTool.getItemRes(slot1), slot3, PathTool.getItemRes(slot2), slot4), TI18N("确定"), slot5, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ReturnActionSummonPanel.setData(slot0)
	if not uv0:getActionSummonData() then
		return
	end

	slot0.data = slot1

	setCountDownTime(slot0.time_num, slot0.data.endtime - GameNet:getInstance():getTime())
	slot0:updateImageBg()
	slot0:updateSummonBtnStatus()
	slot0:updateItemNum()
	slot0:updateBaodiCount()
	slot0:updateAward()
end

function ReturnActionSummonPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true and slot0._init_flag == true then
		uv0:sender27903()
	end
end

function ReturnActionSummonPanel.DeleteMe(slot0)
	doStopAllActions(slot0.award_panel)
	doStopAllActions(slot0.time_num)

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.item_list ~= nil then
		for slot4, slot5 in pairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0.item_list = nil

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
end
