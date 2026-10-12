HeroResonateTabResonatePanel = class("HeroResonateTabResonatePanel", function ()
	return ccui.Widget:create()
end)
slot1 = HeroController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort
slot5 = RoleController:getInstance():getRoleVo()
slot6 = math.floor

function HeroResonateTabResonatePanel.ctor(slot0, slot1)
	slot0.parent = slot1

	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function HeroResonateTabResonatePanel.config(slot0)
	slot0.item_max_count = 20

	if Config.ResonateData.data_const.cell_max then
		slot0.item_max_count = slot1.val
	end

	slot0.cystal_max_lev_limit = 400

	if Config.ResonateData.data_const.cystal_max_lev_limit then
		slot0.cystal_max_lev_limit = slot2.val
	end

	slot0.hero_param = 100
	slot0.time_desc_list = {}
	slot0.can_update_list = true
end

function HeroResonateTabResonatePanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("hero/hero_resonate_tab_resonate_panel"))

	slot0:addChild(slot0.root_wnd)

	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setContentSize(slot0.size)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.bottom_panel_x, slot0.bottom_panel_y = slot0.bottom_panel:getPosition()
	slot0.tips = slot0.bottom_panel:getChildByName("tips")

	slot0.tips:setString(TI18N("恶魔树等级决定槽位中英雄的等级"))

	slot0.level_up_panel = slot0.bottom_panel:getChildByName("level_up_panel")
	slot5 = false

	slot0.level_up_panel:setVisible(slot5)

	slot0.cost_bg_list = {}

	for slot5 = 1, 3 do
		slot6 = slot0.level_up_panel:getChildByName("cost_bg_" .. slot5)
		slot0.cost_bg_list[slot5] = {
			cost_bg = slot6,
			cost_icon = slot6:getChildByName("cost_icon"),
			cost_txt = slot6:getChildByName("cost_txt")
		}
	end

	slot0.level_up_btn = slot0.level_up_panel:getChildByName("level_up_btn")
	slot0.level_up_btn_label = slot0.level_up_btn:getChildByName("label")

	slot0.level_up_btn_label:setString(TI18N("升 级"))

	slot0.lay_scrollview = slot0.bottom_panel:getChildByName("lay_scrollview")
	slot2 = slot0.bottom_panel:getChildByName("item_buy_panel")
	slot0.add_btn = slot2:getChildByName("add_btn")
	slot0.count_label = slot2:getChildByName("label")
end

function HeroResonateTabResonatePanel.playEnterAnimatian(slot0)
	if not slot0.bottom_panel then
		return
	end

	commonOpenActionLeftMove(slot0.bottom_panel)
end

function HeroResonateTabResonatePanel.registerEvents(slot0)
	registerButtonEventListener(slot0.level_up_btn, function ()
		uv0:onClickLevelUpBtn()
	end, true, 2)
	registerButtonEventListener(slot0.add_btn, function ()
		uv0:onAddBtn(2)
	end, true, 2)

	if slot0.hero_resonate_info_event == nil then
		slot0.hero_resonate_info_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Crystal_Info_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:setScData(slot0)
			uv0:showChangePower()
		end)
	end

	if slot0.hero_resonate_crystal_can_list_event == nil then
		slot0.hero_resonate_crystal_can_list_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Crystal_Can_List_Event, function (slot0)
			uv0.can_update_list = slot0
		end)
	end

	if slot0.hero_resonate_crystal_put_in_event == nil then
		slot0.hero_resonate_crystal_put_in_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Crystal_Update_One_Event, function (slot0)
			uv0.can_update_list = true

			if slot0 and uv0.scroll_view then
				uv0.scroll_view:resetItemByIndex(slot0)
			end
		end)
	end

	if slot0.hero_resonate_power_event == nil then
		slot0.hero_resonate_power_event = GlobalEvent:getInstance():Bind(HeroEvent.Hero_Resonate_Crystal_Power_Event, function (slot0)
			if not slot0 then
				return
			end

			if uv0.show_left_power ~= nil then
				uv0.show_right_power = slot0.power
			end
		end)
	end

	if slot0.select_hero_event == nil then
		slot0.select_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Select_Hero_Event, function (slot0, slot1)
			if not uv0.select_pos then
				return
			end

			if slot1 and slot1 == HeroConst.SelectHeroType.eResonateCrystal then
				if slot0 == nil or next(slot0) == nil then
					return
				end

				for slot5, slot6 in pairs(slot0) do
					uv1:sender26426(slot6.partner_id, uv0.select_pos)

					break
				end

				uv0.select_pos = nil
			end
		end)
	end
end

function HeroResonateTabResonatePanel.showChangePower(slot0)
	if slot0.show_left_power and slot0.show_right_power then
		if slot0.show_right_power - slot0.show_left_power > 0 then
			GlobalMessageMgr:getInstance():showPowerMove(slot0.show_right_power - slot0.show_left_power, nil, slot0.show_left_power)
		end

		slot0.show_left_power = nil
		slot0.show_right_power = nil
	end
end

function HeroResonateTabResonatePanel.onClickLevelUpBtn(slot0)
	if slot0.parent and slot0.parent.is_move_effect then
		return
	end

	if not slot0.scdata then
		return
	end

	if not uv0:isResonateCystalMaxLev() then
		return
	end

	if slot0.scdata.is_break == 1 then
		slot1 = {
			left_lv = slot0.scdata.lev,
			right_lv = slot0.scdata.lev + 1
		}

		for slot6, slot7 in ipairs(slot0.show_list) do
			if slot7.id ~= 0 and uv0:getHeroById(slot7.id) then
				slot2 = 0 + slot8.power
			end
		end

		slot1.left_power = slot2
		slot0.show_left_power = slot2

		uv1:openHeroResonateComfirmLevPanel(true, slot1)
	else
		uv1:sender26432()
	end
end

function HeroResonateTabResonatePanel.onAddBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if not slot0.open_pos_count then
		return
	end

	slot2 = nil
	slot3 = 0
	slot4 = nil

	if slot1 == 2 then
		if (slot0.scdata.gold_count or 0) + 1 <= 0 then
			slot3 = 1
		end

		if not Config.ResonateData.data_cell_cost[slot3] then
			return
		end

		slot2 = slot5.loss2
	else
		if (slot0.scdata.item_count or 0) + 1 <= 0 then
			slot3 = 1
		end

		if not Config.ResonateData.data_cell_cost[slot3] then
			return
		end

		slot2 = slot5.loss1
	end

	if slot2 and next(slot2[1]) ~= nil then
		slot5 = slot2[1][1] or 0
		slot8 = BackpackController:getInstance():getModel():getItemNumByBid(slot5)

		if Config.ItemData.data_get_data(slot5) then
			CommonAlert.show(string.format(TI18N("确定花费 <img src='%s' scale=0.3 /> %s解锁一个槽位吗？"), PathTool.getItemRes(slot7.icon), slot2[1][2] or 0), TI18N("确定"), function ()
				if uv0 < uv1 and uv2 ~= Config.ItemData.data_assets_label2id.gold then
					BackpackController:getInstance():openTipsSource(true, uv3)

					return
				end

				if uv4.open_pos_count then
					uv5:sender26429(uv4.open_pos_count + 1, uv6)
				end
			end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24)
		end
	end
end

function HeroResonateTabResonatePanel.setData(slot0, slot1)
	slot0.parent = slot1
	slot0.is_init_hero = true

	if slot0.is_send_26400 then
		return
	end

	slot0.is_send_26400 = true

	uv0:sender26425()
end

function HeroResonateTabResonatePanel.setScData(slot0, slot1)
	slot0.scdata = slot1

	if slot0.parent and slot0.is_checkResonateCystal == nil then
		slot0.is_checkResonateCystal = true

		slot0.parent:checkResonateCystal()
	end

	if uv0:isResonateCystalMaxLev() then
		slot0.level_up_panel:setVisible(true)

		if slot0.break_tips then
			slot0.break_tips:setVisible(false)
		end

		if slot0.scdata.is_break == 1 then
			if slot0.cystal_max_lev_limit <= slot0.scdata.lev then
				slot0.level_up_btn:setTouchEnabled(false)

				slot5 = slot0.level_up_btn

				setChildUnEnabled(true, slot5)

				for slot5, slot6 in ipairs(slot0.cost_bg_list) do
					slot6.cost_bg:setVisible(false)
				end

				slot0.level_up_btn_label:enableOutline(Config.ColorData.data_color4[2], 2)

				if slot0.break_tips1 == nil then
					slot0.break_tips1 = createLabel(24, cc.c3b(75, 255, 232), nil, 360, 50, TI18N("水晶已达最高级"), slot0.level_up_panel, 2, cc.p(0.5, 0.5))
				end
			else
				slot5 = TI18N

				slot0.level_up_btn_label:setString(slot5("升 级"))

				for slot5, slot6 in ipairs(slot0.cost_bg_list) do
					slot6.cost_bg:setVisible(true)
				end

				slot0:updateCostInfo(slot0.scdata.lev)
			end
		else
			slot5 = TI18N

			slot0.level_up_btn_label:setString(slot5("突 破"))

			for slot5, slot6 in ipairs(slot0.cost_bg_list) do
				slot6.cost_bg:setVisible(false)
			end

			if slot0.break_tips == nil then
				slot0.break_tips = createLabel(24, cc.c3b(75, 255, 232), nil, 360, 50, TI18N("突破后可提升恶魔树等级, 解锁英雄等级上限"), slot0.level_up_panel, 2, cc.p(0.5, 0.5))
			else
				slot0.break_tips:setVisible(true)
			end
		end
	else
		slot0.level_up_panel:setVisible(false)
	end

	slot0.dic_hero_vo = {}

	for slot5, slot6 in ipairs(slot1.con_list) do
		if slot6.id ~= 0 and uv0:getHeroById(slot6.id) and next(slot7) ~= nil then
			uv1(slot0.dic_hero_vo, slot7)
		end
	end

	slot0.show_list = slot0.scdata.res_list

	uv2(slot0.show_list, function (slot0, slot1)
		return slot0.pos < slot1.pos
	end)

	slot0.open_pos_count = #slot0.show_list
	slot2 = nil

	if uv0:isResonateCystalMaxLev() then
		slot0.count_label:setString(uv3("%s/%s", slot0.open_pos_count, slot0.item_max_count + 5))
	else
		slot2 = slot0.item_max_count

		slot0.count_label:setString(uv3("%s/%s", slot0.open_pos_count, slot0.item_max_count))
	end

	if slot0.open_pos_count < slot2 then
		slot0.add_btn:setVisible(true)
	else
		slot0.add_btn:setVisible(false)
	end

	if slot0.can_update_list == true then
		slot0:updateScrollList()
	end
end

function HeroResonateTabResonatePanel.updateCostInfo(slot0, slot1)
	if Config.ResonateData.data_crystal_cost[slot1] and next(slot2.expend) ~= nil then
		for slot6 = 1, 3 do
			slot9 = slot0.cost_bg_list[slot6].cost_txt

			if slot2.expend[slot6] then
				slot11 = slot7[2]

				if Config.ItemData.data_get_data(slot7[1]) then
					slot0.cost_bg_list[slot6].cost_icon:loadTexture(PathTool.getItemRes(slot12.icon), LOADTEXT_TYPE)

					slot13 = BackpackController:getInstance():getModel():getItemNumByBid(slot10)

					slot9:setString(MoneyTool.GetMoneyString(slot13) .. "/" .. MoneyTool.GetMoneyString(slot11))

					if slot11 <= slot13 then
						slot9:setTextColor(cc.c3b(255, 246, 228))
					else
						slot9:setTextColor(cc.c3b(255, 139, 139))
					end
				end
			else
				slot9:setString("")
			end
		end
	end
end

function HeroResonateTabResonatePanel.startTimeTicket(slot0)
	if slot0.timeticket == nil then
		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function HeroResonateTabResonatePanel.countDownEndTime(slot0)
	if slot0.scroll_view then
		for slot4, slot5 in pairs(slot0.scroll_view.activeCellIdx) do
			if slot5 and slot0.time_desc_list[slot4] then
				slot0:updateTimeByIndex(slot4, slot0.time_desc_list[slot4])
			end
		end
	end
end

function HeroResonateTabResonatePanel.updateTimeByIndex(slot0, slot1, slot2)
	if slot0.show_list[slot1] and slot2 then
		if slot3.cool_time - GameNet:getInstance():getTime() < 0 then
			slot4 = 0
			slot3.cool_time = 0

			slot0.scroll_view:resetItemByIndex(slot1)

			slot0.time_desc_list[slot1] = nil

			return
		end

		slot2:setString(TimeTool.GetTimeFormat(slot4))
	end
end

function HeroResonateTabResonatePanel.updateScrollList(slot0)
	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewSingleLayout.new(slot0.lay_scrollview, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.lay_scrollview:getContentSize(), {
			start_y = 0,
			row = 1,
			start_x = 5,
			space_x = 0,
			item_width = 120,
			item_height = 120,
			space_y = 0,
			col = 5,
			need_dynamic = true
		}, cc.p(0, 0))

		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
		slot0.scroll_view:registerScriptHandlerSingle(handler(slot0, slot0.onCellTouched), ScrollViewFuncType.OnCellTouched)
	end

	if slot0.is_init_scroll_view == nil then
		slot0.is_init_scroll_view = true

		slot0.scroll_view:reloadData()
	elseif slot0.record_count ~= slot0:numberOfCells() then
		slot0.scroll_view:reloadData()
	else
		slot0.scroll_view:resetCurrentItems()
	end

	slot0.record_count = slot0:numberOfCells()
end

function HeroResonateTabResonatePanel.createNewCell(slot0, slot1, slot2)
	slot3 = HeroExhibitionItem.new(0.9, true, 0, true, true)

	slot3:addCallBack(function ()
		uv0:onCellTouched(uv1)
	end)

	return slot3
end

function HeroResonateTabResonatePanel.numberOfCells(slot0)
	if not slot0.show_list then
		return slot0.item_max_count
	end

	if uv0:isResonateCystalMaxLev() then
		if #slot0.show_list <= slot0.item_max_count + 5 then
			return slot0.item_max_count + 5
		else
			return slot1
		end
	elseif slot1 <= slot0.item_max_count then
		return slot0.item_max_count
	else
		return slot1
	end
end

function HeroResonateTabResonatePanel.updateCellByIndex(slot0, slot1, slot2)
	slot1.index = slot2

	slot1:showResonateCrystalTime(false)

	slot0.time_desc_list[slot2] = nil

	if slot0.show_list[slot2] and slot3.id ~= 0 then
		slot1:setData(uv0:getHeroById(slot3.id))
		slot1:showLockIcon(false)
		slot1:showAddIcon(false)
	else
		slot1:setData(nil)
		slot1:showAddIcon(false)

		if slot2 == slot0.open_pos_count + 1 then
			slot1:showLockIcon(true, "", {
				res = PathTool.getResFrame("heroresonate", "hero_resonate_9")
			})
		elseif slot2 > slot0.open_pos_count + 1 then
			slot1:showLockIcon(true, "", {
				is_unenabled_bg = true,
				res = PathTool.getResFrame("common", "common_90009")
			})
		else
			slot1:showLockIcon(false)

			if slot3 and slot3.cool_time and slot3.cool_time > 0 then
				if slot3.cool_time - GameNet:getInstance():getTime() > 0 then
					slot0.time_desc_list[slot2] = slot1:showResonateCrystalTime(true, TimeTool.GetTimeFormat(slot4))

					slot0:startTimeTicket()
				else
					slot1:showAddIcon(true)
				end
			else
				slot1:showAddIcon(true)
			end
		end
	end
end

function HeroResonateTabResonatePanel.onCellTouched(slot0, slot1)
	if not slot1.index then
		return
	end

	if slot0.show_list[slot1.index] and slot3.id ~= 0 then
		uv1:openHeroResonatePutDownPanel(true, {
			left_hero_vo = uv0:getHeroById(slot3.id),
			pos = slot2
		})
	elseif slot2 == slot0.open_pos_count + 1 then
		slot0:onAddBtn(1)
	elseif slot2 > slot0.open_pos_count + 1 then
		message(TI18N("需先解锁前面的槽位"))
	elseif slot3 and slot3.cool_time and slot3.cool_time ~= 0 then
		if slot3.cool_time - GameNet:getInstance():getTime() > 0 then
			slot0:refreshTime(slot2)
		else
			slot0:onClickHeroBtn(slot2)
		end
	else
		slot0:onClickHeroBtn(slot2)
	end
end

function HeroResonateTabResonatePanel.refreshTime(slot0, slot1)
	slot2 = {
		3,
		100
	}

	if Config.ResonateData.data_const.cell_flush_expend then
		slot2 = slot3.val
	end

	if slot2 and next(slot2) ~= nil then
		if Config.ItemData.data_get_data(slot2[1][1] or 0) then
			CommonAlert.show(string.format(TI18N("是否花费<img src='%s' scale=0.3 />%s立即刷新冷却时间？"), PathTool.getItemRes(slot6.icon), slot2[1][2] or 0), TI18N("确定"), function ()
				uv0:sender26428(uv1)
			end, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24)
		end
	end
end

function HeroResonateTabResonatePanel.onClickHeroBtn(slot0, slot1)
	slot0.select_pos = slot1
	slot2 = {
		select_condition = {}
	}
	slot2.select_condition.star_start = 0
	slot2.select_condition.camp_type = 0
	slot2.select_condition.bid = 0
	slot2.select_condition.max_lev = slot0.scdata.lev
	slot2.select_count = 1
	slot2.form_type = HeroConst.SelectHeroType.eResonateCrystal
	slot2.dic_selected = {}
	slot2.dic_filter_selected = {}

	if not uv0:isResonateCystalMaxLev() and slot0.dic_hero_vo then
		for slot6, slot7 in pairs(slot0.dic_hero_vo) do
			slot2.dic_filter_selected[slot7.id] = slot7
		end
	end

	if slot0.show_list then
		for slot6, slot7 in ipairs(slot0.show_list) do
			if slot7.id ~= 0 and uv0:getHeroById(slot7.id) then
				slot2.dic_filter_selected[slot7.id] = slot8
			end
		end
	end

	uv1:openHeroSelectHeroPanel(true, slot2)
end

function HeroResonateTabResonatePanel.checkResonateStoneRedpoint(slot0)
	if uv0.is_resonate_stone_redpoint then
		addRedPointToNodeByStatus(slot0.level_up_btn, true, 5, 5)
	else
		addRedPointToNodeByStatus(slot0.level_up_btn, false, 5, 5)
	end
end

function HeroResonateTabResonatePanel.runShowAction(slot0, slot1)
	if slot1 then
		if slot0.bottom_panel then
			slot0.bottom_panel:runAction(cc.Spawn:create(cc.MoveTo:create(0.8, cc.p(slot0.bottom_panel_x, -1000)), cc.FadeIn:create(0.8)))
		end
	else
		slot0.delayTime_param = slot0.parent.delayTime_param or 0.5

		if slot0.bottom_panel then
			slot0.bottom_panel:setPositionY(-1000)
			slot0.bottom_panel:runAction(cc.Sequence:create(cc.DelayTime:create(slot0.delayTime_param), cc.Spawn:create(cc.MoveTo:create(0.65, cc.p(slot0.bottom_panel_x, slot0.bottom_panel_y)), cc.FadeIn:create(0.65))))
		end
	end
end

function HeroResonateTabResonatePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function HeroResonateTabResonatePanel.DeleteMe(slot0)
	if slot0.hero_resonate_info_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_info_event)

		slot0.hero_resonate_info_event = nil
	end

	if slot0.hero_resonate_crystal_can_list_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_crystal_can_list_event)

		slot0.hero_resonate_crystal_can_list_event = nil
	end

	if slot0.hero_resonate_crystal_put_in_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_crystal_put_in_event)

		slot0.hero_resonate_crystal_put_in_event = nil
	end

	if slot0.hero_resonate_crystal_put_down_event then
		GlobalEvent:getInstance():UnBind(slot0.hero_resonate_crystal_put_down_event)

		slot0.hero_resonate_crystal_put_down_event = nil
	end

	if slot0.select_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.select_hero_event)

		slot0.select_hero_event = nil
	end

	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end

	if uv0 and slot0.role_lev_event then
		uv0:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	if slot0.item_lay_list then
		for slot4, slot5 in ipairs(slot0.item_lay_list) do
			if slot5.add_spine then
				slot5.add_spine:clearTracks()
				slot5.add_spine:removeFromParent()

				slot5.add_spine = nil
			end

			if slot5.btn and slot5.btn.spine then
				slot5.btn.spine:removeFromParent()

				slot5.btn.spine = nil
			end
		end
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	doStopAllActions(slot0.main_container)
	doStopAllActions(slot0.bottom_panel)
end
