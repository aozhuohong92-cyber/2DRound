ActionFreeSummonWindow = ActionFreeSummonWindow or BaseClass(BaseView)
slot0 = Config.PartnerData.data_partner_base
slot2 = HeroController:getInstance():getModel()

function ActionFreeSummonWindow.__init(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.model = slot0.ctrl:getModel()
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.layout_name = "action/action_free_summon_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "action_free_summon_1"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_free_summon"),
			type = ResourcesType.single
		}
	}
	slot0.hero_item_data_list = {}
end

function ActionFreeSummonWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	loadSpriteTexture(slot0.background, PathTool.getPlistImgForDownLoad("bigbg/action", "action_free_summon_1"), LOADTEXT_TYPE)

	slot0.background2 = slot0.root_wnd:getChildByName("background2")
	slot0.background3 = slot0.root_wnd:getChildByName("background3")

	slot0.background2:setPositionY(display.getBottom() + 90)
	slot0.background3:setPositionY(display.getBottom() + 90)
	slot0.background2:setVisible(false)
	slot0.background3:setVisible(false)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_container"):getChildByName("main_panel")
	slot0.tips_sp = slot0.main_panel:getChildByName("tips_sp")

	loadSpriteTexture(slot0.tips_sp, PathTool.getPlistImgForDownLoad("bigbg/action", "txt_free_summon"), LOADTEXT_TYPE)

	slot2 = slot0.main_panel:getContentSize()
	slot0.spine = createEffectSpine("E80183", cc.p(slot2.width / 2, slot2.height / 4 - 480), cc.p(0.5, 0.5), true, PlayerAction.action)

	slot0.spine:setLocalZOrder(-1)

	slot6 = slot0.spine

	slot0.main_panel:addChild(slot6)

	slot0.pos_list = {}

	for slot6 = 1, 7 do
		slot7 = slot0.main_panel:getChildByName("node" .. slot6)
		slot0.pos_list[slot6] = cc.p(slot7:getPositionX(), slot7:getPositionY())
	end

	slot0.btn_close = slot0.main_panel:getChildByName("close_btn")
	slot0.btn_get = slot0.main_panel:getChildByName("btn_get")
	slot0.btn_tip = slot0.main_panel:getChildByName("btn_tip")
	slot0.btn_goto = slot0.main_panel:getChildByName("btn_goto")

	slot0.btn_goto:setTitleText(TI18N("进阶索隆"))
	slot0.btn_get:setVisible(true)
	slot0.btn_goto:setVisible(false)

	slot0.red_point = slot0.btn_get:getChildByName("red_point")

	slot0.red_point:setVisible(false)

	slot0.btn_preview = slot0.main_panel:getChildByName("btn_preview")

	slot0.btn_preview:setVisible(false)
	slot0.btn_preview:getChildByName("label"):setString(TI18N("战斗预览"))

	slot0.leftTime = slot0.main_panel:getChildByName("left_time")

	slot0.leftTime:setString("剩余时间：00:00:00")

	slot0.item_node = slot0.main_panel:getChildByName("item_node")
	slot0.requireData = Config.HolidayFreedomSummonData.data_const_fun("loss_item").val
	slot0.awardData = Config.HolidayFreedomSummonData.data_const_fun("award_item").val
	slot0.preview_hero = Config.HolidayFreedomSummonData.data_const_fun("preview_hero").val

	slot0.btn_preview:setVisible(slot0.preview_hero and true or false)

	slot0.hero_item_data_list = {}
	slot0.item_list = {}

	for slot6 = 1, 7 do
		if slot0.requireData[slot6] then
			slot8 = nil

			if slot0.requireData[slot6][1] == 1 then
				slot8 = HeroExhibitionItem.new(1, true)
				slot8.type = 1

				slot8:addCallBack(function ()
					uv0:_onClickHeroItem(uv1)
				end)
			else
				slot8 = BackPackItem.new(false, true, false, 1, false, true)
				slot8.type = 2

				slot8:setBaseData(slot0.requireData[slot6][2], 0)
				slot8.num_label:setString("0/" .. slot0.requireData[slot6][3])
				slot8.num_label:setPosition(110, 94)
				slot8.num_label:enableOutline(cc.c3b(0, 0, 0), 2)
				slot8.num_label:setVisible(true)
				slot8:setItemIconUnEnabled(true)
			end

			slot8:setPosition(slot0.pos_list[slot6])
			slot0.main_panel:addChild(slot8)

			slot0.item_list[slot6] = slot8
		end
	end

	slot0.target_item = BackPackItem.new(false, true, false, 1, false, true)

	slot0.item_node:addChild(slot0.target_item)
	slot0.target_item:setPosition(cc.p(0, 0))

	if slot0.awardData and slot0.awardData[1] then
		slot0.target_item:setBaseData(slot0.awardData[1][1], slot0.awardData[1][2])
	else
		slot0.target_item:setVisible(false)
	end

	slot0:setData()
end

function ActionFreeSummonWindow.setData(slot0)
	if slot0.ctrl:requestFreeSummonTime() then
		slot0:setLessTime(slot1.remain_sec)
	end

	slot0:initHeroItemDataByConfig(slot0.requireData)

	slot2 = true

	for slot6, slot7 in ipairs(slot0.requireData) do
		if slot0.item_list[slot6].type == 2 then
			slot8:setItemIconUnEnabled(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot7[2]) < slot7[3])
			slot8:showItemEffect(slot7[3] <= slot9, 156, PlayerAction.action_1, true)
			slot8.num_label:setString(slot9 .. "/" .. slot0.requireData[slot6][3])

			if slot9 < slot7[3] then
				slot2 = false
			end
		elseif slot8.type == 1 then
			slot9 = slot0.hero_item_data_list[slot6]

			slot8:setData(slot9)

			slot10 = slot9.dic_select_list
			slot9.lev = string.format("%s/%s", tableLen(slot10), slot9.count)

			slot8.num_label:setString(slot9.lev)

			if slot9.count <= tableLen(slot10) then
				slot8:setHeadUnEnabled(false)
			else
				slot2 = false

				slot8:setHeadUnEnabled(true)
			end
		end
	end

	slot0.target_item:showItemEffect(slot2, 263, PlayerAction.action_1, true, 1.1)
	slot0.red_point:setVisible(slot2)
end

function ActionFreeSummonWindow.initHeroItemDataByConfig(slot0, slot1)
	slot2 = {
		[slot3] = {}
	}
	slot3 = 1

	for slot7, slot8 in pairs(slot1) do
		if slot8[1] == 1 then
			slot0.hero_item_data_list[slot7] = slot0:getHeroData(slot8[2], slot8[4], slot8[3])
			slot2[slot3][slot8[2]] = {
				[slot8[4]] = slot8[3]
			}
			slot3 = slot3 + 1
		end
	end

	slot0:initHeroListByMatchInfo(slot2)
	slot0:updateHeroItemRedPoint()
end

function ActionFreeSummonWindow.getHeroData(slot0, slot1, slot2, slot3)
	if Config.PartnerData.data_partner_base[slot1] then
		-- Nothing
	end

	return {
		star = slot2 or 0,
		count = slot3 or 0,
		lev = string.format("%s/%s", 0, slot3),
		bid = slot1,
		camp_type = slot5.camp_type,
		dic_select_list = {}
	}
end

function ActionFreeSummonWindow._onClickHeroItem(slot0, slot1)
	if not slot0.hero_item_data_list[slot1] then
		return
	end

	slot0.hero_item_data_list[slot1].is_select = true
	slot2 = {
		select_condition = {},
		dic_selected = slot0.hero_item_data_list[slot1].dic_select_list
	}
	slot2.select_condition.bid = slot0.hero_item_data_list[slot1].bid
	slot2.select_condition.star = slot0.hero_item_data_list[slot1].star
	slot2.select_count = slot0.hero_item_data_list[slot1].count
	slot2.form_type = HeroConst.SelectHeroType.eFreeSummon

	uv0:openHeroSelectHeroPanel(true, slot2)
end

function ActionFreeSummonWindow.initHeroListByMatchInfo(slot0, slot1)
	slot0.conditions_hero_list = {}

	for slot6, slot7 in pairs(uv0:getHeroList()) do
		for slot11, slot12 in ipairs(slot1) do
			if slot0.conditions_hero_list[slot11] == nil then
				slot0.conditions_hero_list[slot11] = {}
			end

			if slot12[slot7.bid] and slot12[slot7.bid][slot7.star] and not slot7:isLock() and not slot7:isInForm() then
				table.insert(slot0.conditions_hero_list[slot11], slot7)
			end
		end
	end

	slot0.dic_other_selected = {}

	for slot6, slot7 in ipairs(slot0.hero_item_data_list) do
		if slot0.conditions_hero_list[slot6] and #slot0.conditions_hero_list[slot6] > 0 then
			table.sort(slot0.conditions_hero_list[slot6], SortTools.tableCommonSorter({
				{
					"lev",
					true
				},
				{
					"id",
					true
				}
			}))
		end

		for slot12, slot13 in ipairs(slot0.conditions_hero_list[slot6]) do
			if slot0.dic_other_selected[slot13.id] == nil then
				slot7.dic_select_list[slot13.id] = slot13

				if slot7.count <= 0 + 1 then
					break
				end
			end
		end

		for slot12, slot13 in pairs(slot7.dic_select_list) do
			slot0.dic_other_selected[slot12] = slot13
		end

		slot7.lev = string.format("%s/%s", slot8, slot7.count)

		if slot0.item_list[slot6] then
			slot0.item_list[slot6].num_label:setString(slot7.lev)

			if slot8 > 0 then
				slot0.item_list[slot6]:setHeadUnEnabled(false)
			else
				slot0.item_list[slot6]:setHeadUnEnabled(true)
			end
		end
	end
end

function ActionFreeSummonWindow.updateHeroItemRedPoint(slot0)
	if not slot0.conditions_hero_list then
		return
	end

	if not slot0.dic_other_selected then
		return
	end

	slot1 = true

	for slot5, slot6 in pairs(slot0.item_list) do
		if slot6.type == 1 then
			slot8 = slot0.conditions_hero_list[slot5] or {}

			if slot0.hero_item_data_list[slot5] then
				for slot13, slot14 in pairs(slot7.dic_select_list) do
					slot9 = 0 + 1
				end

				if slot9 < slot7.count then
					slot10 = slot7.count

					for slot14, slot15 in ipairs(slot8) do
						if (slot7.dic_select_list[slot15.partner_id] or slot0.dic_other_selected[slot15.partner_id] == nil) and slot10 - 1 == 0 then
							break
						end
					end

					slot6:showRedPoint(slot10 <= 0, 8, 8)

					slot1 = false
				else
					slot6:showRedPoint(false)
				end
			end
		end
	end
end

function ActionFreeSummonWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.leftTime) then
		return
	end

	doStopAllActions(slot0.leftTime)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.leftTime:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.leftTime)
				uv1.leftTime:setString("剩余时间：00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionFreeSummonWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.leftTime:setString("剩余时间：" .. TimeTool.GetTimeForFunction(slot1))
	else
		doStopAllActions(slot0.leftTime)
		slot0.leftTime:setString("剩余时间：00:00:00")
	end
end

function ActionFreeSummonWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0.ctrl:openFreeSummonWin(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_preview, function ()
		TimesummonController:getInstance():send23219(ActionExtendId.free_summon)
	end, true, 2)
	registerButtonEventListener(slot0.btn_get, function ()
		if not uv0:isItemEnough() then
			message(TI18N("材料不足"))

			return
		end

		slot0 = {}

		for slot4, slot5 in pairs(uv0.hero_item_data_list) do
			slot6 = {
				partner_bid = slot5.bid,
				expend1 = {}
			}

			for slot10, slot11 in pairs(slot5.dic_select_list) do
				table.insert(slot6.expend1, {
					partner_id = slot10
				})
			end

			table.insert(slot0, slot6)
		end

		uv0.ctrl:sender16658(slot0)
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true, 1)
	registerButtonEventListener(slot0.btn_tip, function ()
		TipsManager:getInstance():showCommonTips("1.使用对应所需的英雄和道具来兑换索隆(和之国)的碎片\n2.兑换过程中，所使用的英雄升级和升星材料不会返还.", uv0.btn_tip:getTouchBeganPosition())
	end, true, 1)

	if not slot0.ball_get_event then
		slot0.ball_get_event = GlobalEvent:getInstance():Bind(ActionEvent.Free_Summon_Event, function (slot0)
			if not slot0 then
				return
			end

			if slot0.code == 1 then
				uv0:setData()
				MainuiController:getInstance():openGetItemView(true, {
					is_bind = 1,
					bid = uv0.awardData[1][1],
					num = uv0.awardData[1][2]
				})
			else
				message(slot0.msg)
			end
		end)
	end

	if slot0.select_hero_event == nil then
		slot0.select_hero_event = GlobalEvent:getInstance():Bind(HeroEvent.Select_Hero_Event, function (slot0, slot1)
			if slot1 and slot1 == HeroConst.SelectHeroType.eFreeSummon then
				uv0:updateHeroItemInfo(slot0)
			end
		end)
	end

	if slot0.free_summon_change_event == nil then
		slot0.free_summon_change_event = GlobalEvent:getInstance():Bind(ActionEvent.Free_Summon_Change_Event, function ()
			uv0:setData()
		end)
	end
end

function ActionFreeSummonWindow.isItemEnough(slot0)
	slot1 = true

	for slot5, slot6 in ipairs(slot0.requireData) do
		if slot0.item_list[slot5].type == 2 then
			slot7:setItemIconUnEnabled(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot6[2]) < slot6[3])
			slot7:showItemEffect(slot6[3] <= slot8, 156, PlayerAction.action_1, true)

			if slot8 < slot6[3] then
				slot1 = false

				break
			end
		elseif slot7.type == 1 then
			slot8 = slot0.hero_item_data_list[slot5]

			slot7:setData(slot8)

			slot9 = slot8.dic_select_list
			slot8.lev = string.format("%s/%s", tableLen(slot9), slot8.count)

			if tableLen(slot9) < slot8.count then
				slot1 = false

				break
			end
		end
	end

	return slot1
end

function ActionFreeSummonWindow.updateHeroItemInfo(slot0, slot1)
	slot0.dic_other_selected = {}

	for slot5, slot6 in ipairs(slot0.hero_item_data_list) do
		if slot6.is_select then
			slot6.is_select = false
			slot6.dic_select_list = slot1

			for slot11, slot12 in pairs(slot6.dic_select_list) do
				slot7 = 0 + 1
				slot0.dic_other_selected[slot11] = slot12
			end

			slot6.lev = string.format("%s/%s", slot7, slot6.count)

			if slot0.item_list[slot5] then
				slot0.item_list[slot5].num_label:setString(slot6.lev)

				if slot7 > 0 then
					slot0.item_list[slot5]:setHeadUnEnabled(false)
				else
					slot0.item_list[slot5]:setHeadUnEnabled(true)
				end
			end
		else
			for slot10, slot11 in pairs(slot6.dic_select_list) do
				slot0.dic_other_selected[slot10] = slot11
			end
		end
	end

	slot0:updateHeroItemRedPoint()
end

function ActionFreeSummonWindow.close_callback(slot0)
	CommonAlert.closeAllWin()

	if slot0.ball_get_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.ball_get_event)

		slot0.ball_get_event = nil
	end

	if slot0.select_hero_event then
		GlobalEvent:getInstance():UnBind(slot0.select_hero_event)

		slot0.select_hero_event = nil
	end

	if slot0.free_summon_change_event then
		GlobalEvent:getInstance():UnBind(slot0.free_summon_change_event)

		slot0.free_summon_change_event = nil
	end

	if slot0.spine then
		slot0.spine:setVisible(false)
		slot0.spine:removeFromParent()

		slot0.spine = nil
	end

	slot0.ctrl:openFreeSummonWin(false)
end
