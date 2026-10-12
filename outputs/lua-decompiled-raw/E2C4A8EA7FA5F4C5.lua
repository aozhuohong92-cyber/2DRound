AdventureMainWindow = AdventureMainWindow or BaseClass(BaseView)
slot0 = AdventureController:getInstance()
slot1 = AdventureController:getInstance():getUiModel()
slot2 = string.format
slot3 = Config.AdventureData.data_adventure_event
slot4 = table.insert
slot5 = table.remove
slot6 = GameNet:getInstance()
slot7 = Config.AdventureData.data_floor_reward

function AdventureMainWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.view_tag = ViewMgrTag.WIN_TAG
	slot0.win_type = WinType.Full
	slot0.index = 2
	slot0.layout_name = "adventure/adventure_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("adventure", "adventurewindow"),
			type = ResourcesType.plist
		}
	}
	slot0.had_register = false
	slot0.have_show_over = false
	slot0.box_effect = nil
	slot0.cur_box_status = nil
	slot0.skill_list = {}
	slot0.hero_list = {}
	slot0.room_skill_list = {}
	slot0.collect_effect_list = {}
	slot0.fly_cache_item_list = {}
	slot0.fly_item_list = {}
end

function AdventureMainWindow.open_callback(slot0)
	slot0.cell_container = slot0.root_wnd:getChildByName("cell_container")
	slot7 = ScrollViewDir.vertical
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.cell_container, cc.p(0, 0), slot7, ScrollViewStartPos.bottom, slot0.cell_container:getContentSize(), {
		start_y = 118,
		once_num = 5,
		start_x = 10,
		item_width = 142,
		space_x = -1,
		row = 5,
		item_height = 126,
		space_y = -1,
		col = 5,
		item_class = AdventureCellItem
	})

	slot0.item_scrollview:setClickEnabled(false)

	slot0.top_container = slot0.root_wnd:getChildByName("top_container")
	slot0.top_back_ground = slot0.top_container:getChildByName("background")

	slot0.top_back_ground:setScale(display.getMaxScale())

	slot0.title_container = slot0.top_container:getChildByName("title_container")
	slot0.top_title = slot0.title_container:getChildByName("label")
	slot0.title_background = slot0.title_container:getChildByName("title")
	slot0.explain_btn = slot0.top_container:getChildByName("explain_btn")
	slot0.rank_btn = slot0.top_container:getChildByName("rank_btn")

	slot0.explain_btn:getChildByName("label"):setString(TI18N("玩法说明"))
	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行"))

	slot0.bottom_container = slot0.root_wnd:getChildByName("bottom_container")
	slot0.bottom_back_ground = slot0.bottom_container:getChildByName("background")

	slot0.bottom_back_ground:setScale(display.getMaxScale())

	slot0.return_btn = slot0.bottom_container:getChildByName("return_btn")
	slot0.list_conatiner = slot0.bottom_container:getChildByName("list_conatiner")

	for slot7 = 1, 3 do
		if slot0.bottom_container:getChildByName("buff_" .. slot7) then
			slot9 = {
				node = slot8,
				index = slot7,
				num = slot8:getChildByName("num")
			}

			slot9.num:setString(0)

			slot9.label = slot8:getChildByName("label")
			slot9.num_value = 0
			slot9.use_count = 0
			slot0.skill_list[slot7] = slot9

			if Config.AdventureData.data_skill_data[slot7] then
				slot9.config = slot10

				slot9.label:setString(slot10.name)
			end
		end
	end

	slot0.shop = slot0.bottom_container:getChildByName("shop")

	slot0.shop:getChildByName("label"):setString(TI18N("冒险商城"))

	slot0.btn_box = slot0.bottom_container:getChildByName("btn_box")
	slot0.btn_box_label = slot0.btn_box:getChildByName("Text_1")

	slot0.btn_box_label:setString("")
	slot0.btn_box_label:setLocalZOrder(10)

	slot0.buff_container = slot0.bottom_container:getChildByName("buff_container")
	slot0.holiday_buff = slot0.bottom_container:getChildByName("holiday_buff")

	slot0.holiday_buff:setVisible(false)
	slot0.bottom_container:getChildByName("end_time_title"):setString(TI18N("冒险重置"))

	slot0.end_time_value = slot0.bottom_container:getChildByName("end_time_value")
end

function AdventureMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.return_btn, function ()
		uv0:openAdventureMainWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.explain_btn, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.AdventureData.data_explain, TI18N("玩法规则"))
	end, true, 1)
	registerButtonEventListener(slot0.rank_btn, function ()
		RankController:getInstance():openRankView(true, RankConstant.RankType.adventure)
	end, true, 1)

	function slot4(slot0, slot1, slot2)
		slot4 = uv0:getHolidayBuffData()

		if (uv0:getBuffData() == nil or next(slot3) == nil) and (slot4 == nil or next(slot4) == nil) then
			message(TI18N("暂无属性加成"))
		else
			TipsManager:getInstance():showAdventureBuffTips(slot3, slot1:getTouchBeganPosition(), slot4)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.buff_container, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.skill_list) do
		if slot5.node then
			registerButtonEventListener(slot5.node, function (slot0)
				uv0:handleSkillChoose(slot0)
			end, true, 1, slot5.index)
		end
	end

	registerButtonEventListener(slot0.shop, function ()
		uv0:openAdventrueShopWindow(true)
	end, true, 1)
	slot0:addGlobalEvent(AdventureEvent.Update_Room_Info, function ()
		uv0:playEnterEffect(true)
		uv0:updateRoomData()
	end)
	slot0:addGlobalEvent(AdventureEvent.Update_Single_Room_Info, function (slot0)
		uv0:updateRoomData(true)
	end)
	slot0:addGlobalEvent(AdventureEvent.Update_Room_Base_Info, function ()
		uv0:updateBaseData()
	end)
	slot0:addGlobalEvent(AdventureEvent.Update_Buff_Info, function ()
		uv0:updateBuffData()
		uv0:updateHolidayBuffTips()
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateSkillInfo, function (slot0)
		uv0:updateSkillData(slot0)
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateAdventureForm, function ()
		uv0:updateHeroList()
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateAdventureSelectHero, function ()
		uv0:changeSelectHero()
	end)
	slot0:addGlobalEvent(AdventureEvent.GetSkillForEffectAction, function (slot0, slot1)
		uv0:playSkillEffectAction(slot0, slot1)
	end)
	slot0:addGlobalEvent(AdventureEvent.UpdateBoxTeskEvent, function (slot0)
		uv0:updateBoxTeskList(slot0)
	end)
	registerButtonEventListener(slot0.btn_box, function ()
		if uv0.box_tesk_data and uv0.box_tesk_data.kill_mon then
			if uv0.cur_box_status and uv0.cur_box_status == 1 then
				uv1:send20635(0)
			else
				uv1:openAdventureBoxRewardView(true, uv0.box_tesk_data.kill_mon)
			end
		end
	end, false, 1)
end

function AdventureMainWindow.updateMineBtnRedpoint(slot0)
end

function AdventureMainWindow.openRootWnd(slot0)
	uv0:send20602()
	uv0:send20609()
	uv0:send20634()
	slot0:updateBuffData()
	slot0:updateBaseData()
	slot0:updateHeroList()
	slot0:updateHolidayBuffTips()
	uv1:updateRedStatus(false)
	uv1:setAdventureFightReturnTag(true)
end

function AdventureMainWindow.getNextLevelNumber(slot0, slot1, slot2, slot3)
	if slot1[slot2] == nil then
		return 1
	end

	slot4 = 0

	if slot1[slot2].count <= slot3 then
		slot4 = slot1[slot2].id
	else
		for slot8, slot9 in pairs(slot1) do
			if slot2 <= slot9.id + 1 then
				slot10 = slot2
			end

			if slot9.count <= slot3 and slot3 <= slot1[slot10].count then
				slot4 = slot9.id

				break
			end
		end

		if slot2 <= slot4 + 1 then
			slot4 = slot2
		end
	end

	return slot4
end

function AdventureMainWindow.updateBoxTeskList(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = Config.AdventureData.data_round_reward_list
	slot3 = Config.AdventureData.data_round_reward_list_length
	slot0.box_tesk_data = slot1
	slot4 = slot0.box_tesk_data.kill_mon or 0
	slot5 = 0

	for slot9, slot10 in pairs(slot1.list) do
		if slot10.status == 1 then
			slot5 = 1

			break
		end
	end

	slot6 = false

	if slot5 == 0 then
		for slot10, slot11 in pairs(slot1.list) do
			if slot11.status == 0 then
				slot6 = true

				break
			end
		end

		if slot6 == false then
			slot5 = 2
		end
	end

	slot7 = slot0:getNextLevelNumber(slot2, slot3, slot4)

	if slot5 == 2 then
		slot0.btn_box_label:setString(TI18N("已领取"))
	else
		slot0.btn_box_label:setString(uv0(TI18N("%d/%d"), slot4, slot2[slot7].count))
	end

	if slot0.cur_box_status ~= slot5 then
		slot0.cur_box_status = slot5
		slot8 = PlayerAction.action_1

		if slot5 == 1 then
			slot8 = PlayerAction.action_2
		elseif slot5 == 2 then
			slot8 = PlayerAction.action_3
		end

		if slot0.box_effect then
			slot0.box_effect:clearTracks()
			slot0.box_effect:removeFromParent()

			slot0.box_effect = nil
		end

		if not tolua.isnull(slot0.btn_box) and slot0.box_effect == nil then
			slot0.box_effect = createEffectSpine(PathTool.getEffectRes(602), cc.p(slot0.btn_box:getContentSize().width * 0.5, slot0.btn_box:getContentSize().height * 0.5 - 20), cc.p(0, 0), true, slot8)

			slot0.btn_box:addChild(slot0.box_effect)
		end
	end
end

function AdventureMainWindow.updateHeroList(slot0)
	slot2 = uv0:getSelectPartnerID()

	for slot6, slot7 in ipairs(uv0:getFormList()) do
		if slot0.hero_list[slot6] == nil then
			slot0.hero_list[slot6] = HeroExhibitionItem.new(0.9, true, 0, false)

			slot0.hero_list[slot6]:setPosition(90 + (slot6 - 1) * 135, 260)
			slot0.hero_list[slot6]:addCallBack(function (slot0, slot1)
				uv0:selectHeroItem(slot0, slot1)
			end)
			slot0.bottom_container:addChild(slot0.hero_list[slot6])
		end

		slot0:updateHeroInfo(slot0.hero_list[slot6], slot7)

		if not slot0.select_cell and slot2 ~= 0 and slot7.partner_id == slot2 then
			slot0:selectHeroItem(slot9, slot7)
		end
	end
end

function AdventureMainWindow.changeSelectHero(slot0)
	if uv0:getSelectPartnerID() == 0 then
		return
	end

	slot2 = nil

	for slot6, slot7 in pairs(slot0.hero_list) do
		if slot7:getData() and slot8.partner_id == slot1 then
			slot2 = slot7

			break
		end
	end

	if slot2 then
		slot0:selectHeroItem(slot2, slot2:getData(), true)
	end
end

function AdventureMainWindow.selectHeroItem(slot0, slot1, slot2, slot3)
	if slot2.now_hp == 0 then
		message(TI18N("死亡英雄无法选择"))

		return
	end

	if slot0.select_cell == slot1 then
		return
	end

	if slot0.select_cell then
		slot0.select_cell:setSelected(false)

		slot0.select_cell = nil
	end

	slot0.select_cell = slot1

	slot0.select_cell:setSelected(true)

	if not slot3 then
		uv0:requestSelectPartner(slot2.partner_id)
	end
end

function AdventureMainWindow.updateHeroInfo(slot0, slot1, slot2)
	if slot1 == nil then
		return
	end

	slot1:setData(slot2)

	slot3 = slot2.now_hp / slot2.hp

	slot1:showProgressbar(slot3 * 100)

	if slot3 == 0 then
		slot1:showStrTips(true, TI18N("已阵亡"))
		slot1:setSelected(false)
	else
		slot1:showStrTips(false)
	end
end

function AdventureMainWindow.updateSkillData(slot0, slot1)
	if slot1 then
		for slot5, slot6 in ipairs(slot1) do
			if slot0.skill_list[slot6.bid] then
				slot7.num_value = slot6.num
				slot7.use_count = slot6.use_count

				slot7.num:setString(slot6.num)
			end
		end
	end
end

function AdventureMainWindow.updateBuffData(slot0)
end

function AdventureMainWindow.updateHolidayBuffTips(slot0)
	if not uv0:getHolidayBuffData() or next(slot1) == nil then
		slot0.holiday_buff:setVisible(false)
	else
		slot0.holiday_buff:setVisible(true)
	end
end

function AdventureMainWindow.updateBaseData(slot0)
	slot0.base_data = uv0:getAdventureBaseData()

	if slot0.base_data == nil then
		return
	end

	slot1 = slot0.base_data

	slot0:changeBackgroundResources(slot1.map_id)

	slot1.current_id = slot1.id

	if slot0.name_layer ~= slot1.id then
		slot0.name_layer = slot1.id

		if Config.AdventureData.data_floor_reward[slot1.id] then
			slot0.top_title:setString(slot2.name)
		end
	end

	slot0:updateEndTime()
end

function AdventureMainWindow.updateEndTime(slot0)
	if slot0.base_data == nil then
		return
	end

	if slot0.timeticket == nil then
		slot0:countDownEndTime()

		slot0.timeticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:countDownEndTime()
		end, 1)
	end
end

function AdventureMainWindow.countDownEndTime(slot0)
	if slot0.base_data == nil then
		slot0:clearEneTime()

		return
	end

	if slot0.base_data.end_time - uv0:getTime() <= 0 then
		slot1 = 0

		slot0:clearEneTime()
	end

	slot0.end_time_value:setString(TimeTool.GetTimeFormat(slot1))
end

function AdventureMainWindow.clearEneTime(slot0)
	if slot0.timeticket then
		GlobalTimeTicket:getInstance():remove(slot0.timeticket)

		slot0.timeticket = nil
	end
end

function AdventureMainWindow.changeBackgroundResources(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.layer == slot1 then
		return
	end

	slot0.layer = slot1

	if Config.AdventureData.data_map[slot1] then
		if slot0.background_path == "resource/adventure/background/" .. slot2.res_id then
			return
		end

		slot0.background_path = slot3
		slot4 = {}

		uv0(slot4, {
			path = slot0.background_path .. "/bottom.png",
			type = ResourcesType.single
		})
		uv0(slot4, {
			path = slot0.background_path .. "/title.png",
			type = ResourcesType.single
		})
		uv0(slot4, {
			path = slot0.background_path .. "/top.png",
			type = ResourcesType.single
		})

		if slot0.style_resources_load then
			slot0.style_resources_load:DeleteMe()

			slot0.style_resources_load = nil
		end

		slot0.style_resources_load = ResourcesLoad.New()

		slot0.style_resources_load:addAllList(slot4, function ()
			uv0:changeStyle()
		end)
	end
end

function AdventureMainWindow.changeStyle(slot0)
	if slot0.background_path == nil then
		return
	end

	loadSpriteTexture(slot0.top_back_ground, slot0.background_path .. "/top.png", LOADTEXT_TYPE)
	loadSpriteTexture(slot0.bottom_back_ground, slot0.background_path .. "/bottom.png", LOADTEXT_TYPE)
	loadSpriteTexture(slot0.title_background, slot0.background_path .. "/title.png", LOADTEXT_TYPE)
end

function AdventureMainWindow.playEnterEffect(slot0, slot1)
	if not slot1 then
		if slot0.enter_effect then
			slot0.enter_effect:removeFromParent()

			slot0.enter_effect = nil
		end
	else
		if slot0.enter_effect == nil then
			slot0.enter_effect = createEffectSpine(PathTool.getEffectRes(157), cc.p(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action_1)

			slot0.root_wnd:addChild(slot0.enter_effect, 1)
		end

		slot0.enter_effect:setVisible(true)
		slot0.enter_effect:setAnimation(0, PlayerAction.action_1, false)

		if slot0.had_register == false and slot0.enter_effect then
			slot0.had_register = true

			slot0.enter_effect:registerSpineEventHandler(function ()
				uv0.enter_effect:setVisible(false)

				if Config.AdventureData.data_buff[uv1:getLastAdventureNum()] then
					CommonAlert.show(Config.AdventureData.data_buff[slot0].desc, TI18N("确定"), nil, , , CommonAlert.type.rich)
				end

				uv1:setLastAdventureNum(99)
			end, sp.EventType.ANIMATION_COMPLETE)
		end
	end
end

function AdventureMainWindow.updateRoomData(slot0, slot1)
	slot0.item_scrollview:setData(uv0:getRoomList(), function (slot0)
		uv0:clickCellItem(slot0)
	end, nil, slot1 or false)
end

function AdventureMainWindow.touchTimeOverdue(slot0)
	if slot0.time_overdue_ticket == nil then
		slot0.time_overdue_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:clearOverdueTime()
			uv1:setAdventureFightReturnTag(true)
		end, 10)
	end
end

function AdventureMainWindow.clearOverdueTime(slot0)
	if slot0.time_overdue_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.time_overdue_ticket)

		slot0.time_overdue_ticket = nil
	end
end

function AdventureMainWindow.clickCellItem(slot0, slot1)
	if uv0:getAdventureFightReturnTag() == false then
		message(TI18N("战斗结算中，请稍后再试~~~~~"))

		return
	else
		slot0:clearOverdueTime()
	end

	slot0:touchTimeOverdue()

	if slot1 == nil or slot1.data == nil then
		return
	end

	if slot0.base_data == nil or slot0.base_data.id == nil then
		return
	end

	slot3 = slot1.data
	slot4 = slot3.config

	if slot3.status == AdventureConst.status.can_open then
		if slot4 and slot4.evt_type == AdventureEvent.EventType.mysterious then
			slot0:playSpecialEffect(slot1, "E23013", function (slot0)
				uv0:send20608(slot0)
			end)
		else
			uv1:send20608(slot3.id)
		end
	elseif slot3.status == AdventureConst.status.lock then
		message(TI18N("击败附近守卫后可探索该区域"))
	elseif slot4 then
		if slot3.status == AdventureConst.status.open then
			if slot4.evt_type == AdventureEvent.EventType.effect and next(slot4.handle_type) ~= nil then
				uv1:send20620(slot3.id, AdventureEvenHandleType.handle, {})
			elseif slot4.evt_type == AdventureEvent.EventType.buff then
				uv1:send20620(slot3.id, AdventureEvenHandleType.handle, {})
			elseif slot4.evt_type == AdventureEvent.EventType.skill then
				slot0.room_skill_list[slot3.id] = slot1

				uv1:send20620(slot3.id, AdventureEvenHandleType.handle, {})
			else
				uv1:openWindowByConfig(slot3)
			end
		elseif slot4.evt_type == AdventureEvent.EventType.shop then
			uv1:openWindowByConfig(slot3)
		elseif slot4.evt_type == AdventureEvent.EventType.next and slot3.status == AdventureConst.status.over and slot0.base_data then
			if slot1.is_last_floor == true then
				message(TI18N("已达冒险最顶层,请等待冒险重置"))

				return
			end

			slot0:gotoNextFloor(slot3.id)
		end
	end
end

function AdventureMainWindow.playSpecialEffect(slot0, slot1, slot2, slot3)
	if tolua.isnull(slot1) or slot1.data == nil then
		return
	end

	slot1:changeBossEffectStatus(slot3, PlayerAction.action_1)
end

function AdventureMainWindow.playCollectEffect(slot0, slot1, slot2)
	if tolua.isnull(slot1) then
		return
	end

	if slot1.data == nil or slot1.data.config == nil or slot1.data.config.handle_type == nil then
		return
	end

	if slot0.collect_effect_list[slot1.data.id] then
		return
	end

	slot3 = slot1.data

	if slot1.data.config.handle_type == nil or slot4[1] == nil or next(slot4[1]) == nil then
		slot2(slot3)

		return
	end

	slot9 = slot0.root_wnd:convertToNodeSpace(slot1:convertToWorldSpace(cc.p(0, 0)))
	slot10 = createEffectSpine(slot4[1][1], cc.p(slot9.x + 71, slot9.y + 45), cc.p(0.5, 0.5), false, PlayerAction.action, function ()
		if not tolua.isnull(uv0) then
			uv0:setOtherDesc(false)
		end

		if not tolua.isnull(uv1.root_wnd) and uv1.collect_effect_list[uv2.id] then
			slot0:runAction(cc.RemoveSelf:create(true))

			uv1.collect_effect_list[uv2.id] = nil
		end

		uv3(uv2)
	end)

	slot10:setTimeScale(1.3)
	slot0.root_wnd:addChild(slot10)

	slot0.collect_effect_list[slot3.id] = slot10

	if slot4[1][2] ~= "" then
		slot1:setOtherDesc(true, slot6)
	end
end

function AdventureMainWindow.handleSkillChoose(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.skill_list[slot1] == nil or slot2.config == nil then
		return
	end

	if slot1 == 1 then
		slot0:openChooseHP(slot2.config, slot2.num_value, slot2.use_count)
	elseif slot1 == 2 then
		slot0:openShotKill(slot2.config, slot2.num_value, slot2.use_count)
	elseif slot1 == 3 then
		uv0:send20607(slot1, 0)
	end
end

function AdventureMainWindow.openChooseHP(slot0, slot1, slot2, slot3)
	if uv0:allHeroIsDie() == true then
		message(TI18N("没有可使用英雄"))

		return
	end

	uv1:openAdventureUseHPWindow(true, {
		config = slot1,
		num = slot2,
		use_count = slot3
	})
end

function AdventureMainWindow.openShotKill(slot0, slot1, slot2, slot3)
	uv0:openAdventureShotKillWindow(true, {
		config = slot1,
		num = slot2,
		use_count = slot3
	})
end

function AdventureMainWindow.gotoNextFloor(slot0, slot1)
	if slot0.goto_next_alert then
		return
	end

	function slot2()
		uv0.goto_next_alert = nil
	end

	slot1 = slot1 or 0

	function slot3()
		uv0:send20620(uv1, AdventureEvenHandleType.handle, {})

		uv2.goto_next_alert = nil
	end

	slot4 = TI18N("进入下一层后，将无法返回该层，是否进入？")

	if uv1:getRoomList() then
		for slot9, slot10 in pairs(slot5) do
			if slot10.status == AdventureConst.status.can_open then
				slot4 = TI18N("本层还有未探索区域，此时进入下一层可能会错过事件奖励，是否继续？")

				break
			end
		end
	end

	slot0.goto_next_alert = CommonAlert.show(slot4, TI18N("确定"), slot3, TI18N("取消"), slot2)
end

function AdventureMainWindow.getAlert(slot0)
	if slot0.goto_next_alert then
		return slot0.goto_next_alert
	end
end

function AdventureMainWindow.playSkillEffectAction(slot0, slot1, slot2)
	if slot1 == nil or slot2 == nil then
		return
	end

	if slot0.room_skill_list[slot1] == nil then
		return
	end

	if slot3:getEvtImg() == nil then
		return
	end

	if slot0.skill_list[slot2] == nil or tolua.isnull(slot5.node) then
		return
	end

	slot6 = slot4:getContentSize()
	slot8 = slot0.root_wnd:convertToNodeSpace(slot4:convertToWorldSpace(cc.p(0, 0)))
	slot10 = slot0.root_wnd:convertToNodeSpace(slot5.node:convertToWorldSpace(cc.p(0, 0)))
	slot11 = "adventurewindow_6"

	if slot2 == 2 then
		slot11 = "adventurewindow_7"
	elseif slot2 == 3 then
		slot11 = "adventurewindow_8"
	end

	slot14 = slot5.node:getContentSize()
	slot15 = slot10.x + slot14.width * 0.5
	slot16 = slot10.y + slot14.height * 0.5
	slot17 = PathTool.getResFrame("adventure", slot11, false, "adventurewindow")
	slot18 = nil

	if ((#slot0.fly_cache_item_list ~= 0 or {
		item = createSprite(slot17, slot8.x + slot6.width * 0.5, slot8.y + slot6.height * 0.5, slot0.root_wnd, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST),
		res_id = slot17
	}) and uv0(slot0.fly_cache_item_list, 1)).item and slot18.res_id then
		slot18.id = slot1

		slot18.item:setScale(1.3)
		slot18.item:setVisible(true)
		slot18.item:setPosition(slot12, slot13)

		if slot18.res_id ~= slot17 then
			slot18.res_id = slot17

			loadSpriteTexture(slot18.item, slot17, LOADTEXT_TYPE_PLIST)
		end

		slot0.fly_item_list[slot1] = slot18

		slot0:flySkillItemToTarget(slot18, slot12, slot13, slot15, slot16)
	end
end

function AdventureMainWindow.flySkillItemToTarget(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot1 == nil or tolua.isnull(slot1.item) then
		return
	end

	slot6 = {}
	slot7 = cc.p(slot2, slot3)

	table.insert(slot6, slot7)

	slot8 = cc.p(slot4, slot5)

	table.insert(slot6, cc.p(cc.pMidpoint(slot7, slot8).x + -30, slot7.y - 10))
	table.insert(slot6, slot8)
	slot1.item:runAction(cc.Spawn:create(cc.ScaleTo:create(1, 0.5), cc.Sequence:create(cc.BezierTo:create(1, slot6), cc.CallFunc:create(function ()
		uv0.item:setVisible(false)

		uv1.fly_item_list[uv0.id] = nil

		uv2(uv1.fly_cache_item_list, uv0)
	end))))
end

function AdventureMainWindow.close_callback(slot0)
	slot0:clearOverdueTime()
	GlobalTimeTicket:getInstance():remove("AdventureMainWindow.play_effect_timeout")

	if slot0.fly_item_list then
		for slot4, slot5 in pairs(slot0.fly_item_list) do
			if slot5.item then
				doStopAllActions(slot5.item)
				slot5.item:removeFromParent()
			end
		end

		slot0.fly_item_list = nil
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	slot0:clearEneTime()

	for slot4, slot5 in ipairs(slot0.hero_list) do
		slot5:DeleteMe()
	end

	slot0.hero_list = nil

	if slot0.style_resources_load then
		slot0.style_resources_load:DeleteMe()
	end

	slot0.style_resources_load = nil

	slot0:playEnterEffect(false)
	uv0:openAdventureMainWindow(false)

	if slot0.is_wide_screen then
		MainuiController:getInstance():setMainChatBoxCurViewType(ChatConst.ViewType.Normal)
	end
end

AdventureCellItem = class("AdventureCellItem", function ()
	return ccui.Layout:create()
end)

function AdventureCellItem.ctor(slot0)
	slot0.cell_path = "resource/adventure/img/%s.png"
	slot0.evt_path = "resource/adventure/evt/%s.png"
	slot0.is_last_floor = false
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("adventure/adventure_cell_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.container = slot0.root_wnd:getChildByName("container")
	slot0.background = slot0.container:getChildByName("background")
	slot0.cell = slot0.container:getChildByName("cell")
	slot0.evt_container = slot0.container:getChildByName("evt_container")
	slot0.lock = slot0.container:getChildByName("lock")

	slot0:registerEvent()
end

function AdventureCellItem.registerEvent(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data and uv0.call_back then
				if uv0.data and uv0.data.config and uv0.data.status == AdventureConst.status.over and uv0.data.config.evt_type ~= AdventureEvent.EventType.next and uv0.data.config.evt_type ~= AdventureEvent.EventType.shop then
					return
				end

				uv0:call_back()
			end
		end
	end)
end

function AdventureCellItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function AdventureCellItem.setExtendData(slot0, slot1)
	slot0.is_update = slot1
end

function AdventureCellItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.is_last_floor = false

		if slot0.cell_key_str == getNorKey(slot1.lock, slot1.id, slot1.status, slot1.evt_id) then
			return
		end

		slot0.cell_key_str = slot2

		slot0:setOtherDesc(false)

		if slot0.cell_id ~= slot1.id then
			slot0.cell_id = slot1.id

			slot0:setLocalZOrder(25 - slot1.id)
			slot0.container:setName("guide_adventure_cell_" .. slot1.id)
		end

		if slot0.guide_evt_id ~= slot1.evt_id and slot1.evt_id ~= 0 then
			slot0.guide_evt_id = slot1.evt_id

			slot0.container:setTag(slot1.evt_id)
		end

		slot0:updateEvtInfo()

		if slot1.status == AdventureConst.status.open or slot1.status == AdventureConst.status.over then
			slot0.cell:setVisible(false)
		elseif slot0.data.config and slot0.data.config.evt_type == AdventureEvent.EventType.mysterious then
			slot0.cell:setVisible(false)
		else
			slot0:createCellSytle()
		end
	end
end

function AdventureCellItem.createCellSytle(slot0)
	if slot0.data == nil then
		return
	end

	slot0.cell:setVisible(true)

	if slot0.cell_res ~= uv0(slot0.cell_path, slot0.data.res_id) then
		slot0.cell_res = slot2
		slot0.cell_resources_load = createResourcesLoad(slot2, ResourcesType.single, function ()
			if not tolua.isnull(uv0.cell) then
				loadSpriteTexture(uv0.cell, uv1, LOADTEXT_TYPE)
				uv0:setCellStatus()
			end
		end, slot0.cell_resources_load)
	else
		slot0:setCellStatus()
	end
end

function AdventureCellItem.setCellStatus(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.cell_status == slot0.data.status then
		return
	end

	slot0.cell_status = slot0.data.status

	if slot0.data.status == AdventureConst.status.lock then
		setChildDarkShader(true, slot0.cell)
	elseif slot0.data.status == AdventureConst.status.can_open then
		setChildDarkShader(false, slot0.cell)
	end
end

function AdventureCellItem.clearEvtResources(slot0)
	if slot0.event_img then
		doStopAllActions(slot0.event_img)
	end

	if slot0.head then
		slot0.head:DeleteMe()
	end

	slot0.head = nil

	if slot0.event_model then
		slot0.event_model:removeFromParent()

		slot0.event_model = nil
	end

	slot0.event_model_res = ""
end

function AdventureCellItem.updateEvtInfo(slot0)
	if slot0.data == nil then
		return
	end

	slot1 = uv0(slot0.data.evt_id)
	slot0.data.config = slot1

	if slot1 == nil or slot1.res_id == nil or slot1.res_id[1] == nil then
		slot0:clearEvtResources()

		return
	end

	if slot1.evt_type == AdventureEvent.EventType.next then
		if uv1:getAdventureBaseData() == nil or slot2.id == nil then
			slot0:clearEvtResources()

			return
		end

		if uv2[slot2.id + 1] == nil and slot1.evt_type == AdventureEvent.EventType.next then
			slot0.is_last_floor = true
		end
	end

	if slot0.data.status ~= AdventureConst.status.over or slot1.evt_type == AdventureEvent.EventType.init or slot1.evt_type == AdventureEvent.EventType.next or slot1.evt_type == AdventureEvent.EventType.block or slot1.evt_type == AdventureEvent.EventType.shop then
		slot0:createEvtShowInfo(slot1)
	else
		slot0:clearEvtResources()
	end
end

function AdventureCellItem.setOtherDesc(slot0, slot1, slot2)
	if not slot1 then
		if slot0.other_desc then
			slot0.other_desc:setVisible(false)
		end
	else
		if slot0.other_desc == nil then
			slot0.other_desc = createLabel(24, 1, 2, 71, 60, slot2, slot0.container, nil, cc.p(0.5, 0))
		end

		slot0.other_desc:setString(slot2)
		slot0.other_desc:setVisible(true)
	end
end

function AdventureCellItem.createEvtShowInfo(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot2 = slot1.res_id[1]
	slot4 = slot2[2]
	slot5 = slot1.shadow == 1

	if slot2[1] == nil or slot4 == nil then
		return
	end

	if slot0.event_model_res == getNorKey(slot3, slot4) then
		return
	end

	slot0:clearEvtResources()

	slot0.event_model_res = getNorKey(slot3, slot4)

	if slot3 == 2 then
		slot0.event_model = createEffectSpine(slot4, cc.p(71, 68), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.evt_container:addChild(slot0.event_model)
	else
		if slot5 == true then
			slot0.event_model = createSprite(PathTool.getResFrame("adventure", "adventurewindow_3", false, "adventurewindow"), 71, 30, slot0.evt_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)

			if AdventureEvent.isMonster(slot1.evt_type) then
				if slot0.head == nil then
					slot0.head = PlayerHead.new(PlayerHead.type.other, nil, , uv0(slot0.evt_path, slot4), nil, false)

					slot0.head:setHeadBgScale(1)
					slot0.head:setPosition(35, 92)
					slot0.event_model:addChild(slot0.head)
				end

				breatheShineAction4(slot0.head)
				slot0.head:setHeadRes(slot1.face)
			else
				slot0.event_img = createSprite(nil, 35, 96, slot0.event_model, cc.p(0.5, 0.5))

				breatheShineAction4(slot0.event_img)

				slot0.event_resources_load = createResourcesLoad(slot6, ResourcesType.single, function ()
					if not tolua.isnull(uv0.event_img) then
						loadSpriteTexture(uv0.event_img, uv1, LOADTEXT_TYPE)
					end
				end, slot0.event_resources_load)
			end

			return
		end

		slot0.event_model = createSprite(nil, 71, 2, slot0.evt_container, cc.p(0.5, 0))
		slot0.event_resources_load = createResourcesLoad(uv0(slot0.evt_path, slot4), ResourcesType.single, function ()
			if not tolua.isnull(uv0.event_model) then
				loadSpriteTexture(uv0.event_model, uv1, LOADTEXT_TYPE)
			end
		end, slot0.event_resources_load)
	end
end

function AdventureCellItem.changeBossEffectStatus(slot0, slot1, slot2)
	if slot0.is_in_playing == true then
		return
	end

	if slot0.data == nil or slot0.data.config == nil then
		return
	end

	if tolua.isnull(slot0.event_model) then
		return
	end

	if slot0.data.config.evt_type == AdventureEvent.EventType.mysterious then
		slot0.is_in_playing = true

		slot0.event_model:setAnimation(0, slot2, false)
		delayRun(slot0.event_model, 1.5, function ()
			uv0.is_in_playing = false

			uv1(uv0.data.id)
		end)
	end
end

function AdventureCellItem.getEvtImg(slot0)
	return slot0.event_img
end

function AdventureCellItem.DeleteMe(slot0)
	if slot0.cell_resources_load then
		slot0.cell_resources_load:DeleteMe()
	end

	slot0.cell_resources_load = nil

	if slot0.event_resources_load then
		slot0.event_resources_load:DeleteMe()
	end

	slot0.event_resources_load = nil
end
