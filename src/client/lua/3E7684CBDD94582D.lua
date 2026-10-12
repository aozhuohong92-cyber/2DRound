NewPartnerSummonWindow = NewPartnerSummonWindow or BaseClass(BaseView)
slot0 = 240
slot1 = 490
slot2 = 360
slot3 = {
	360,
	640
}
slot4 = {
	0,
	360,
	720
}
slot5 = {
	100,
	300,
	200
}
slot6 = Config.RecruitData.data_partnersummon_data
slot8 = NewPartnersummonController:getInstance():getModel()

function NewPartnerSummonWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "newpartnersummon/newpartnersummon_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("newpartnersummon", "newpartnersummon"),
			type = ResourcesType.plist
		}
	}
	slot0.sprite_role_load = {}
	slot0.item_list_res = {}
	slot0.item_list_time = {}
	slot0.cur_index = 2
	slot0.cur_box_status = nil
	slot0.first_come = nil
	slot0.happening_touch = nil
	slot0.use_once_item = {}
	slot0.use_five_item = {}
	slot0.summon_timer = {}
	slot0.is_use_once_ext = false
	slot0.is_use_five_ext = false
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function NewPartnerSummonWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")
	slot2 = display.getBottom(slot0.root_wnd:getChildByName("main_container"))
	slot3 = 0

	if display.getMaxScale() > 1 then
		slot3 = 20
	end

	slot1:setPositionY(slot1:getPositionY() + slot2 + slot3)

	slot0.main_container = slot1
	slot0.sprite_role = slot1:getChildByName("sprite_role")
	slot0.summon_type_txt = slot1:getChildByName("summon_type_txt")
	slot0.score_btn = slot1:getChildByName("score_btn")
	slot0.advanced_bg = slot1:getChildByName("Sprite_2")

	slot0.advanced_bg:setVisible(false)

	slot0.btn_rule = slot1:getChildByName("btn_rule")
	slot0.touch_layer = slot1:getChildByName("touch_layer")

	slot0.touch_layer:setScale(display.getMaxScale())

	slot0.touch_rect = slot1:getChildByName("touch_rect")

	slot0.touch_rect:setTouchEnabled(false)

	slot0.btn_left = slot0.touch_rect:getChildByName("btn_left")
	slot7 = "btn_right"
	slot0.btn_right = slot0.touch_rect:getChildByName(slot7)
	slot0.redpoint = {}

	for slot7 = 1, 3 do
		slot8 = {
			item = slot0.touch_rect:getChildByName("item_" .. slot7)
		}

		slot8.item:setTouchEnabled(true)
		slot8.item:setSwallowTouches(false)
		slot8.item:setPositionX(uv0[slot7])

		slot0.item_list_time[slot7] = slot0.touch_rect:getChildByName("time_" .. slot7)
		slot0.item_list_time[slot7] = createRichLabel(20, 1, cc.p(1, 0.5), cc.p(slot8.item:getContentSize().width - 20, 20))

		slot8.item:addChild(slot0.item_list_time[slot7])

		slot8.kuang = createSprite(PathTool.getResFrame("newpartnersummon", "newpartnersummon_13"), slot8.item:getContentSize().width * 0.5, slot8.item:getContentSize().height * 0.5, slot8.item, cc.p(0.5, 0.5))

		slot8.kuang:setVisible(false)

		slot0.redpoint[slot7] = slot8.item:getChildByName("redpoint_" .. slot7)

		if slot0.redpoint[slot7] then
			slot0.redpoint[slot7]:setLocalZOrder(1)
			slot0.redpoint[slot7]:setVisible(false)
		end

		slot8.item:loadTexture(PathTool.getResFrame("newpartnersummon", "newpartnersummon_" .. slot7), LOADTEXT_TYPE_PLIST)

		slot8.index = slot7
		slot0.item_list_res[slot7] = slot8
	end

	slot0.item_pos_y = slot0.item_list_res[1].item:getPositionY()
	slot0.progress_bg = createSprite(PathTool.getResFrame("newpartnersummon", "newpartnersummon_9"), 657, 1100, slot1, cc.p(0.5, 0.5))
	slot0.score_progress = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("newpartnersummon", "newpartnersummon_8"), 0, 0, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.score_progress:setPosition(slot0.progress_bg:getContentSize().width * 0.5, slot0.progress_bg:getContentSize().height * 0.5)
	slot0.score_progress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
	slot0.progress_bg:addChild(slot0.score_progress)
	slot0.score_progress:setPercentage(0)
	slot1:getChildByName("item_bg"):setPositionX(65)

	slot5 = slot1:getChildByName("score_bg")

	slot5:setLocalZOrder(1)

	slot0.score_label = slot5:getChildByName("Text_2")

	slot0.score_label:setString("")

	slot0.btn_lineup = slot1:getChildByName("btn_lineup")

	slot0.btn_lineup:getChildByName("Text_3"):setString(TI18N("推荐阵容"))

	slot0.btn_summon_1 = slot1:getChildByName("btn_summon_1")

	slot0.btn_summon_1:setScale(0.95)
	slot0.btn_summon_1:setPositionY(slot0.btn_summon_1:getPositionY() - 5)
	slot0.btn_summon_1:getChildByName("Text_1"):setString(TI18N("招募1次"))
	UITool.SetTitleColor(slot0.btn_summon_1:getChildByName("Text_1"))

	slot0.summon_1_diammand = createRichLabel(20, 58, cc.p(0.5, 0.5), cc.p(slot0.btn_summon_1:getContentSize().width * 0.5, 28))

	slot0.btn_summon_1:addChild(slot0.summon_1_diammand)

	slot0.btn_summon_10 = slot1:getChildByName("btn_summon_10")

	slot0.btn_summon_10:setScale(0.95)
	slot0.btn_summon_10:setPositionY(slot0.btn_summon_10:getPositionY() - 5)
	slot0.btn_summon_10:getChildByName("Text_1"):setString(TI18N("招募10次"))
	UITool.SetTitleColor(slot0.btn_summon_10:getChildByName("Text_1"))

	slot0.summon_10_diammand = createRichLabel(20, 58, cc.p(0.5, 0.5), cc.p(slot0.btn_summon_10:getContentSize().width * 0.5, 28))

	slot0.btn_summon_10:addChild(slot0.summon_10_diammand)
	slot0:showArenaPeakEffect(slot0.btn_summon_1, true)

	slot9 = slot0.btn_summon_10

	slot0:showArenaPeakEffect(slot9, true)

	for slot9 = 1, 3 do
		slot0:itemData(slot9, uv1[slot9])
	end

	slot0.first_come = true

	if slot0:getDramaDunMaxID() <= 1 then
		slot0.cur_index = 1

		slot0:setMoveItenPos(360)
		slot0.btn_summon_1:setName("guildsign_summon_1_1")
	else
		slot0.btn_summon_1:setName("guildsign_summon_3_1")
	end

	slot0:tabChangeIndex(slot0.cur_index)

	slot7 = display.getTop(slot0.main_container)
	slot8 = slot1:getContentSize()

	slot0.btn_lineup:setPositionY(slot7 - (slot8.height - slot0.btn_lineup:getPositionY()))
	slot0.progress_bg:setPositionY(slot7 - (slot8.height - slot0.progress_bg:getPositionY()))
	slot5:setPositionY(slot7 - (slot8.height - (slot5:getPositionY() - 25)))
	slot0.score_btn:setPositionY(slot7 - (slot8.height - (slot0.score_btn:getPositionY() - 25)))
	slot0.btn_rule:setPositionY(slot7 - (slot8.height - (slot0.btn_rule:getPositionY() - 25)))

	slot0.res_check_3 = slot0.main_container:getChildByName("res_check_3"):setSelected(false):setPositionX(560)
	slot0.res_check_4 = slot0.main_container:getChildByName("res_check_4"):setSelected(false):setPositionX(560)
	slot0.btn_skip_ani = slot0.main_container:getChildByName("btn_skip_ani"):setSelected(false):setPositionX(560)
	slot0.res3_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "分解1~3星英雄", slot0.res_check_3, 1)
	slot0.res4_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "分解四星英雄", slot0.res_check_4, 1)
	slot0.skip_ani_label = createLabel(20, cc.c3b(255, 255, 255), cc.c3b(128, 0, 32), 40, 3, "跳过招募动画", slot0.btn_skip_ani, 1)
end

function NewPartnerSummonWindow.newHerolList(slot0, slot1, slot2)
	slot0.data_list = HeroSacrificePanel:getHeroListByCamp(0)

	if slot2 then
		slot0:resHero(slot0.data_list, slot1.partner_bids, slot2)
	elseif slot0.res_check_3:isSelected() == true and slot0.res_check_4:isSelected() == true then
		slot0:resHero(slot0.data_list, slot1.partner_bids, 0)
	elseif slot0.res_check_4:isSelected() == true then
		slot0:resHero(slot0.data_list, slot1.partner_bids, 4)
	elseif slot0.res_check_3:isSelected() == true then
		slot0:resHero(slot0.data_list, slot1.partner_bids, 3)
	end
end

function NewPartnerSummonWindow.IsInTable(slot0, slot1, slot2)
	if slot2 == nil then
		return false
	end

	for slot6, slot7 in pairs(slot2) do
		if slot7.partner_id == slot1 then
			return true
		end
	end

	return false
end

function NewPartnerSummonWindow.resHero(slot0, slot1, slot2, slot3)
	slot4 = {}
	slot5 = {}
	slot6 = 0
	slot7 = 0

	if slot3 == 4 then
		slot7 = 0

		for slot11, slot12 in pairs(slot2) do
			if slot12.init_star == 4 then
				slot6 = 0 + 1
			end
		end

		for slot11, slot12 in pairs(slot2) do
			for slot16 = 1, #slot1 do
				if slot12.init_star == 4 and slot12.partner_bid == slot1[slot16].bid and slot1[slot16].lev == 1 and not slot0:IsInTable(slot1[slot16].partner_id, slot4) and slot7 < slot6 then
					table.insert(slot5, {
						partner_id = slot1[slot16].partner_id
					})
					table.insert(slot4, {
						partner_id = slot1[slot16].partner_id
					})

					slot7 = slot7 + 1

					break
				end
			end
		end
	elseif slot3 == 3 then
		slot7 = 0

		for slot11, slot12 in pairs(slot2) do
			if slot12.init_star == 3 then
				slot6 = 0 + 1
			end
		end

		for slot11, slot12 in pairs(slot2) do
			for slot16 = 1, #slot1 do
				if slot12.init_star <= 3 and slot12.partner_bid == slot1[slot16].bid and slot1[slot16].lev == 1 and not slot0:IsInTable(slot1[slot16].partner_id, slot4) and slot7 < slot6 then
					table.insert(slot5, {
						partner_id = slot1[slot16].partner_id
					})
					table.insert(slot4, {
						partner_id = slot1[slot16].partner_id
					})

					slot7 = slot7 + 1

					break
				end
			end
		end
	elseif slot3 == 0 then
		slot7 = 0

		for slot11, slot12 in pairs(slot2) do
			if slot12.init_star <= 4 then
				slot6 = 0 + 1
			end
		end

		for slot11, slot12 in pairs(slot2) do
			for slot16 = 1, #slot1 do
				if slot12.init_star <= 4 and slot12.partner_bid == slot1[slot16].bid and slot1[slot16].lev == 1 and not slot0:IsInTable(slot1[slot16].partner_id, slot4) and slot7 < slot6 then
					table.insert(slot5, {
						partner_id = slot1[slot16].partner_id
					})
					table.insert(slot4, {
						partner_id = slot1[slot16].partner_id
					})

					slot7 = slot7 + 1

					break
				end
			end
		end
	end

	print("heroMutiPartner------------------")
	printLuaTable(slot5)
	HeroController:sender11076(slot5)
end

function NewPartnerSummonWindow.getDramaDunMaxID(slot0)
	slot1 = 1

	if BattleDramaController:getInstance():getModel():getDramaData() and slot3.max_dun_id and Config.DungeonData.data_drama_dungeon_info(slot3.max_dun_id) then
		slot1 = slot4.floor or 1
	end

	return slot1
end

function NewPartnerSummonWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn_rule, function ()
		MainuiController:getInstance():openCommonExplainView(true, Config.RecruitData.data_explain, TI18N("规则说明"), true)
	end)

	if slot0.role_vo ~= nil and slot0.role_assets_event == nil then
		slot0.role_assets_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function (slot0, slot1)
			if slot0 == "recruit_hero" then
				slot2 = slot1
				slot3 = PartnersummonController:getInstance():getModel():getScoreSummonNeedCount()

				uv0.score_progress:setPercentage(slot2 / slot3 * 100)
				uv0.score_label:setString(string.format("%d/%d", slot2, slot3))
				uv0:showScoreFullAction(slot3 <= slot2)
			elseif slot0 == "friend_point" and uv0.touch_index and uv1 then
				uv0.summon_assets:setString(string.format("<img src=%s visible=true scale=0.40 /><div fontcolor=#ffffff outline=2,#000000>  %s</div>", PathTool.getItemRes(Config.ItemData.data_get_data(uv1[uv2[uv0.touch_index]].item_once[1][1]).icon), slot1))
			end
		end)
	end

	registerButtonEventListener(slot0.score_btn, function ()
		PartnersummonController:getInstance():openPartnerSummonScoreWindow(true)
	end)
	registerButtonEventListener(slot0.btn_summon_1, function ()
		uv0:ChooseSummonType(1)
	end, true)

	function slot4()
		uv0:ChooseSummonType(10)
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_summon_10, slot4, slot5)

	for slot4, slot5 in pairs(slot0.item_list_res) do
		if slot5.item then
			registerButtonEventListener(slot5.item, function ()
				uv0.cur_index = uv1.index
			end)
		end
	end

	registerButtonEventListener(slot0.btn_lineup, function ()
		JumpController:getInstance():jumpViewByEvtData({
			16,
			3
		})
	end, true)
	slot0:addGlobalEvent(PartnersummonEvent.updateSummonItemEvent, function (slot0)
		if slot0 then
			uv0:newHerolList(slot0)

			slot1 = nil

			for slot5 = 1, #uv1 do
				if slot0.group_id == uv1[slot5] then
					slot1 = slot5

					break
				end
			end

			if slot1 == nil then
				return
			end

			uv0:itemData(slot1, slot0.group_id)
		end
	end)
	slot0:addGlobalEvent(PartnersummonEvent.updateSummonFiveStarEvent, function ()
		uv0:heightSummonFiveStar()
	end)
	slot0:addGlobalEvent(BackpackEvent.ADD_GOODS, function (slot0, slot1)
		uv0:refreshExchangeItemNum(slot0, slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
		uv0:refreshExchangeItemNum(slot0, slot1)
	end)
	slot0:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
		uv0:refreshExchangeItemNum(slot0, slot1)
	end)
	slot0.btn_skip_ani:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.skip_recruit_anim, true, true)
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()
			SysEnv:getInstance():set(SysEnv.keys.skip_recruit_anim, false, true)
		end
	end)
end

function NewPartnerSummonWindow.showArenaPeakEffect(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 == true then
		if slot1.arenapeak_effect == nil then
			slot3 = slot1:getContentSize()
			slot1.arenapeak_effect = createEffectSpine("E24756", cc.p(slot3.width * 0.5, slot3.height * 0.5), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot1:addChild(slot1.arenapeak_effect, 1)
		else
			slot1.arenapeak_effect:setAnimation(0, PlayerAction.action, true)
		end
	elseif slot1.arenapeak_effect then
		slot1.arenapeak_effect:setVisible(false)
		slot1.arenapeak_effect:removeFromParent()

		slot1.arenapeak_effect = nil
	end
end

function NewPartnerSummonWindow.refreshExchangeItemNum(slot0, slot1, slot2)
	if slot1 == BackPackConst.Bag_Code.BACKPACK and slot0.touch_index then
		for slot10, slot11 in pairs(slot2) do
			if slot11 and slot11.base_id and slot4 == slot11.base_id then
				slot0.summon_assets:setString(string.format("<img src=%s visible=true scale=0.40 /><div fontcolor=#ffffff outline=2,#000000>  %s</div>", PathTool.getItemRes(Config.ItemData.data_get_data(uv1[uv0[slot0.touch_index]].item_once[1][1]).icon), BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot4)))
			end
		end

		slot0:setOnceStatus(slot3)
		slot0:setTenStatus(slot3)
	end
end

function NewPartnerSummonWindow.openRootWnd(slot0)
	slot0:refreshProgressInfo()
	slot0:heightSummonFiveStar()
	slot0:registerEvent()
end

function NewPartnerSummonWindow.refreshProgressInfo(slot0)
	if slot0.role_vo then
		slot1 = slot0.role_vo.recruit_hero
		slot2 = PartnersummonController:getInstance():getModel():getScoreSummonNeedCount()

		slot0.score_progress:setPercentage(slot1 / slot2 * 100)
		slot0.score_label:setString(string.format("%d/%d", slot1, slot2))
		slot0:showScoreFullAction(slot2 <= slot1)
	end
end

function NewPartnerSummonWindow.showScoreFullAction(slot0, slot1)
	if slot0.cur_box_status == slot1 then
		return
	end

	slot0.cur_box_status = slot1
	slot2 = PlayerAction.action_1

	if slot1 then
		slot2 = PlayerAction.action_2
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(slot0.progress_bg:getContentSize().width * 0.5, 28), cc.p(0.5, 0), true, slot2)

	slot0.progress_bg:addChild(slot0.box_effect)
end

function NewPartnerSummonWindow.registerEvent(slot0)
	slot3 = cc.EventListenerTouchOneByOne:create()

	slot3:registerScriptHandler(function (slot0, slot1)
		if uv0.touch_ticket == nil then
			uv0.touch_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0.happening_touch = nil

				if uv0.touch_ticket ~= nil then
					GlobalTimeTicket:getInstance():remove(uv0.touch_ticket)

					uv0.touch_ticket = nil
				end
			end, 0.3)
		end

		if uv0.happening_touch then
			return false
		end

		uv0.happening_touch = true
		uv0.touch_began = slot0:getLocation()
		uv0.touch_point = nil

		doStopAllActions(uv0.item_list_res[1].item)
		doStopAllActions(uv0.item_list_res[2].item)
		doStopAllActions(uv0.item_list_res[3].item)

		return uv0:isTouchRect(uv0.touch_began.x, uv0.touch_began.y)
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot3:registerScriptHandler(function (slot0, slot1)
		uv0.touch_end = slot0:getLocation()
		slot2 = false

		if uv0.touch_began then
			slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) >= 30
		end

		uv0.cur_index = uv0.touch_index

		if slot2 then
			uv0:itemAction(slot2, uv0.touch_end.x - uv0.touch_began.x)
		elseif uv0:isTouchRectLeft(uv0.touch_began.x, uv0.touch_began.y) then
			uv0:itemAction(true, 1)
		elseif uv0:isTouchRectRight(uv0.touch_began.x, uv0.touch_began.y) then
			uv0:itemAction(true, -1)
		end

		uv0:tabChangeIndex(uv0.cur_index)
	end, cc.Handler.EVENT_TOUCH_ENDED)
	slot0.touch_rect:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot3, slot0.touch_rect)
end

function NewPartnerSummonWindow.isTouchRect(slot0, slot1, slot2)
	slot3 = false

	if slot0.touch_rect:getPositionY() <= slot2 and slot2 <= slot4 + slot0.touch_rect:getContentSize().height then
		slot3 = true
	end

	return slot3
end

function NewPartnerSummonWindow.isTouchRectLeft(slot0, slot1, slot2)
	slot3 = false
	slot5 = slot0.btn_left:getPositionY()
	slot6 = slot0.touch_rect:getPositionY()
	slot9 = 0

	if slot0.btn_left:getPositionX() <= slot1 and slot1 <= slot0.btn_left:getContentSize().width and slot2 >= slot5 - slot9 + slot6 and slot2 <= slot5 + slot6 + slot0.btn_left:getContentSize().height - slot9 then
		slot3 = true
	end

	return slot3
end

function NewPartnerSummonWindow.isTouchRectRight(slot0, slot1, slot2)
	slot3 = false
	slot5 = slot0.btn_right:getPositionY()
	slot6 = slot0.touch_rect:getPositionY()
	slot9 = 0

	if slot0.btn_right:getPositionX() <= slot1 and slot1 <= slot4 + slot0.btn_right:getContentSize().width and slot2 >= slot5 - slot9 + slot6 and slot2 <= slot5 + slot6 + slot0.btn_right:getContentSize().height - slot9 then
		slot3 = true
	end

	return slot3
end

function NewPartnerSummonWindow.setMoveItenPos(slot0, slot1)
	for slot5 = 1, 3 do
		if slot0.item_list_res[slot5].item then
			if slot0.item_list_res[slot5].item:getPositionX() + slot1 <= -uv0 / 2 then
				slot7 = slot7 + 720 + uv0
			end

			if slot7 > 720 + uv0 / 2 then
				slot7 = slot7 - (720 + uv0)
			end

			slot0.item_list_res[slot5].item:setPositionX(slot7)
		end
	end
end

slot9 = {
	{
		2,
		3,
		1
	},
	{
		1,
		2,
		3
	},
	{
		3,
		1,
		2
	}
}
slot10 = {
	{
		2,
		3,
		1
	},
	{
		1,
		2,
		3
	},
	{
		3,
		1,
		2
	}
}

function NewPartnerSummonWindow.itemAction(slot0, slot1, slot2)
	if slot1 == false then
		return
	end

	slot3 = 0.2

	if slot2 >= 0 then
		slot0.cur_index = slot0.cur_index - 1

		if slot0.cur_index <= 0 then
			slot0.cur_index = 3
		end

		for slot7 = 1, 3 do
			if uv0[slot0.cur_index][slot7] == 1 then
				slot0.item_list_res[slot7].item:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(0.05, cc.p(900, slot0.item_pos_y))), cc.Sequence:create(cc.FadeOut:create(0.01), cc.MoveTo:create(0.01, cc.p(-200, slot0.item_pos_y))), cc.Spawn:create(cc.FadeIn:create(0.01), cc.EaseSineOut:create(cc.MoveTo:create(0.1, cc.p(0, slot0.item_pos_y))))))
			else
				slot0.item_list_res[slot7].item:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(slot3, cc.p(uv1[uv0[slot0.cur_index][slot7]], slot0.item_pos_y)))))
			end
		end
	else
		slot0.cur_index = slot0.cur_index + 1

		if slot0.cur_index > 3 then
			slot0.cur_index = 1
		end

		for slot7 = 1, 3 do
			if uv2[slot0.cur_index][slot7] == 3 then
				slot0.item_list_res[slot7].item:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(0.05, cc.p(-200, slot0.item_pos_y))), cc.Sequence:create(cc.FadeOut:create(0.01), cc.MoveTo:create(0.01, cc.p(900, slot0.item_pos_y))), cc.Spawn:create(cc.FadeIn:create(0.01), cc.EaseSineOut:create(cc.MoveTo:create(0.1, cc.p(720, slot0.item_pos_y))))))
			else
				slot0.item_list_res[slot7].item:runAction(cc.Sequence:create(cc.EaseSineOut:create(cc.MoveTo:create(slot3, cc.p(uv1[uv2[slot0.cur_index][slot7]], slot0.item_pos_y)))))
			end
		end
	end
end

function NewPartnerSummonWindow.tabChangeIndex(slot0, slot1)
	if slot0.touch_index == slot1 then
		return
	end

	slot0.touch_index = slot1

	slot0:showArenaPeakEffect(slot0.btn_summon_1, true)
	slot0:showArenaPeakEffect(slot0.btn_summon_10, true)

	if slot0.select_visible ~= nil then
		slot0.select_visible:setVisible(false)
	end

	slot0.select_visible = slot0.item_list_res[slot0.touch_index].kuang

	if slot0.select_visible then
		slot0.select_visible:setVisible(true)
	end

	slot0:heightSummonFiveStar()

	if PartnersummonController:getInstance():getModel():getFiveStarHeroIsOut() ~= 0 and slot1 == 2 then
		slot0.advanced_bg:setVisible(true)
	else
		slot0.advanced_bg:setVisible(false)
	end

	slot0.background:loadTexture(PathTool.getPlistImgForDownLoad("newpartnersummon", "newpartnersummon_bg" .. slot1, true), LOADTEXT_TYPE)
	slot0.background:setScale(display.getMaxScale())
	slot0.background:setOpacity(0)
	slot0.background:runAction(cc.FadeIn:create(0.2))

	if not slot0.sprite_role_load[slot1] then
		slot0.sprite_role_load[slot1] = loadSpriteTextureFromCDN(slot0.sprite_role, PathTool.getPlistImgForDownLoad("newpartnersummon", "partnersummon_role" .. slot1), LOADTEXT_TYPE, slot0.sprite_role_load[slot1])
	end

	if slot0.sprite_role_load[slot1] then
		loadSpriteTexture(slot0.sprite_role, slot5, LOADTEXT_TYPE)
		slot0:setRoleDispose(slot0.sprite_role, slot1)
		slot0.sprite_role:setOpacity(0)
		slot0.sprite_role:runAction(cc.FadeIn:create(0.2))
	end

	loadSpriteTexture(slot0.summon_type_txt, PathTool.getResFrame("newpartnersummon", "txt_cn_newpartnersummon_" .. slot1), LOADTEXT_TYPE_PLIST)
	slot0:setTenStatus(uv0[slot1])

	if not slot0.summon_assets then
		slot0.summon_assets = createRichLabel(24, 1, cc.p(0, 0.5), cc.p(5, 622))

		slot0.main_container:addChild(slot0.summon_assets)
	end

	if slot0.summon_assets then
		slot7 = uv1[slot6].item_five[1][1]
		slot8 = BackpackController:getInstance():getModel():getBackPackItemNumByBid(uv1[slot6].item_five[1][1])

		if slot1 == NewPartnersummonConst.Partnersummon_Type.Friend then
			slot8 = slot0.role_vo.friend_point
		end

		slot0.summon_assets:setString(string.format("<img src=%s visible=true scale=0.40 /><div fontcolor=#ffffff outline=2,#000000>  %s</div>", PathTool.getItemRes(Config.ItemData.data_get_data(uv1[slot6].item_once[1][1]).icon), slot8))
	end

	if slot0.first_come then
		slot0:itemData(slot1, slot6)
	end
end

function NewPartnerSummonWindow.setRoleDispose(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if slot2 == 1 then
		slot1:setScale(1)
		slot1:setPosition(360, 291)
	elseif slot2 == 2 then
		slot1:setScale(1.04)
		slot1:setPosition(350, 301)
	elseif slot2 == 3 then
		slot1:setScale(1)
		slot1:setPosition(395, 301)
	end
end

function NewPartnerSummonWindow.itemData(slot0, slot1, slot2)
	if uv0:getSummonItemData(slot2) then
		if slot0.redpoint[slot1] then
			slot0.redpoint[slot1]:setVisible(slot3.free_num == 1)
		end

		slot0.left_time = slot3.time_num - GameNet:getInstance():getTime()

		if slot3.free_num == 0 then
			if slot2 ~= 200 then
				if slot0.left_time > 0 then
					if not slot0.summon_timer[slot1] then
						slot0.summon_timer[slot1] = GlobalTimeTicket:getInstance():add(function ()
							if uv0.time_num and uv0.time_num - GameNet:getInstance():getTime() > 0 then
								uv1.left_time = uv0.time_num - GameNet:getInstance():getTime()

								uv1.item_list_time[uv2]:setString(string.format(TI18N("<div  fontColor=#35ff14 outline=2,#000000 >%s</div><div fontColor=#ffffff outline=2,#000000>后免费</div>"), TimeTool.GetTimeFormat(uv1.left_time)))
							else
								uv1.item_list_time[uv2]:setString(string.format("<div fontColor=#ffffff outline=2,#000000>%s</div>", TI18N("免费抽取")))
								uv1.summon_1_diammand:setString(string.format("<div fontcolor=#ffffff outline=2,#000000> %s</div>", TI18N("免费召唤")))
								GlobalTimeTicket:getInstance():remove(uv1.summon_timer[uv2])

								uv1.summon_timer[uv2] = nil
							end
						end, 1)
					end
				else
					slot0.item_list_time[slot1]:setString(string.format("<div fontColor=#ffffff outline=2,#000000>%s</div>", TI18N("免费抽取")))
					slot0.summon_1_diammand:setString(string.format("<div fontcolor=#ffffff outline=2,#000000> %s</div>", TI18N("免费召唤")))

					if slot0.summon_timer[slot1] ~= nil then
						GlobalTimeTicket:getInstance():remove(slot0.summon_timer[slot1])

						slot0.summon_timer[slot1] = nil
					end
				end
			end

			slot0:setOnceStatus(slot2)
		else
			slot0.item_list_time[slot1]:setString(string.format("<div fontColor=#ffffff outline=2,#000000>%s</div>", TI18N("免费抽取")))
			slot0.summon_1_diammand:setString(string.format("<div fontcolor=#ffffff outline=2,#000000> %s</div>", TI18N("免费召唤")))
		end
	end
end

function NewPartnerSummonWindow.setOnceStatus(slot0, slot1)
	slot0.is_use_once_ext = false

	if slot1 == 400 then
		return
	end

	slot2 = nil

	if uv0[slot1].ext_item_once and uv0[slot1].ext_item_once[1] then
		slot2 = uv0[slot1].ext_item_once[1]
	end

	slot0.use_once_item = uv0[slot1].item_once[1]

	if slot2 and slot2[2] and slot2[2] <= (slot2 and slot2[1] and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot2[1]) or 0) then
		slot0.use_once_item = slot2
		slot0.is_use_once_ext = true
	end

	slot5 = PathTool.getItemRes(Config.ItemData.data_get_data(slot0.use_once_item[1]).icon)

	if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.use_once_item[1]) < slot0.use_once_item[2] and uv0[slot1].exchange_once[1] then
		slot5 = PathTool.getItemRes(Config.ItemData.data_get_data(slot8[1]).icon)
		slot6 = slot8[2]
	end

	slot0.summon_1_diammand:setString(string.format("<img src=%s visible=true scale=0.30 /><div fontcolor=#ffffff outline=2,#000000> %s</div>", slot5, slot6))
end

function NewPartnerSummonWindow.setTenStatus(slot0, slot1)
	slot0.is_use_five_ext = false

	if slot1 == 400 then
		return
	end

	slot2 = nil

	if uv0[slot1].ext_item_five and uv0[slot1].ext_item_five[1] then
		slot2 = uv0[slot1].ext_item_five[1]
	end

	slot0.use_five_item = uv0[slot1].item_five[1]

	if slot2 and slot2[2] and slot2[2] <= (slot2 and slot2[1] and BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot2[1]) or 0) then
		slot0.use_five_item = slot2
		slot0.is_use_five_ext = true
	end

	slot4 = slot0.use_five_item[1]
	slot8 = PathTool.getItemRes(Config.ItemData.data_get_data(slot4).icon)

	if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot4) < slot0.use_five_item[2] and uv0[slot1].exchange_five[1] then
		slot8 = PathTool.getItemRes(Config.ItemData.data_get_data(slot9[1]).icon)
		slot5 = slot9[2]
	end

	slot0.summon_10_diammand:setString(string.format("<img src=%s visible=true scale=0.30 /><div fontcolor=#ffffff outline=2,#000000> %s</div>", slot8, slot5))
end

function NewPartnerSummonWindow.ChooseSummonType(slot0, slot1)
	slot0.is_use_ext = false

	if slot0.touch_summon then
		return
	end

	if slot0.touch_summon_ticket == nil then
		slot0.touch_summon_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0.touch_summon = nil

			if uv0.touch_summon_ticket ~= nil then
				GlobalTimeTicket:getInstance():remove(uv0.touch_summon_ticket)

				uv0.touch_summon_ticket = nil
			end
		end, 2)
	end

	slot0.touch_summon = true
	slot2, slot3 = HeroController:getInstance():getModel():getHeroMaxCount()

	if slot2 <= slot3 then
		CommonAlert.show(TI18N("英雄列表已满，可通过提升VIP等级或购买增加英雄携带数量，是否前往购买？"), TI18N("前往"), function ()
			MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
			uv0:openNewPartnerSummonWindow(false)
		end, TI18N("取消"), nil, CommonAlert.type.common)

		return
	end

	if uv1[uv2[slot0.touch_index]] then
		slot5 = 4

		if slot0.touch_index == NewPartnersummonConst.Partnersummon_Type.Normal then
			if uv3:getSummonItemData(slot4.group_id) and slot6.free_num == 1 and slot1 == 1 then
				slot5 = 1
			end
		elseif slot0.touch_index == NewPartnersummonConst.Partnersummon_Type.Advanced then
			if uv3:getSummonItemData(slot4.group_id) and slot6.free_num == 1 and slot1 == 1 then
				slot5 = 1
			else
				slot7 = slot0.use_five_item[1]
				slot8 = slot0.use_five_item[2]
				slot0.is_use_ext = false

				if slot0.is_use_five_ext then
					slot0.is_use_ext = true
				end

				if slot1 == 1 then
					slot7 = slot0.use_once_item[1]
					slot8 = slot0.use_once_item[2]
					slot0.is_use_ext = false

					if slot0.is_use_once_ext then
						slot0.is_use_ext = true
					end
				end

				if BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot7) < slot8 then
					slot10 = slot0.role_vo.gold + slot0.role_vo.red_gold
					slot11 = uv1[slot4.group_id].exchange_once[1][2]
					slot12 = uv1[slot4.group_id].draw_list[1] or 1
					slot13 = uv1[slot4.group_id].exchange_once_gain[1][2]
					slot14 = Config.ItemData.data_get_data(uv1[slot4.group_id].exchange_five_gain[1][1]).name or ""

					if slot1 == 10 then
						slot11 = uv1[slot4.group_id].exchange_five[1][2]
						slot12 = uv1[slot4.group_id].draw_list[2] or 10
						slot13 = uv1[slot4.group_id].exchange_five_gain[1][2]
					end

					slot17 = string.format("%s<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>(%s:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>)\n</div>", TI18N("是否使用"), PathTool.getItemRes(3), slot11, TI18N("拥有"), slot10) .. string.format("<div fontColor=#020019>%s</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019></div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#020019>(%s</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#020019>%s)</div>", TI18N("购买"), slot13, slot14, TI18N("同时附赠"), slot12, TI18N("次招募"))

					;(function ()
						uv0:send23201(uv1.group_id, uv2, 3)
					end)()

					return
				end
			end
		elseif slot0.touch_index == NewPartnersummonConst.Partnersummon_Type.Friend then
			slot5 = 4
		end

		if slot0.is_use_ext then
			uv0:send23201(slot4.group_id, slot1, 5)
		else
			uv0:send23201(slot4.group_id, slot1, slot5)
		end
	end
end

function NewPartnerSummonWindow.heightSummonFiveStar(slot0)
	if slot0.touch_index ~= 2 then
		return
	end

	if PartnersummonController:getInstance():getModel():getFiveStarHeroIsOut() == 0 then
		if slot0.remain_star_num then
			slot0.remain_star_num:DeleteMe()

			slot0.remain_star_num = nil
		end

		if slot0.star_num then
			slot0.star_num:DeleteMe()

			slot0.star_num = nil
		end

		if slot0.five_star then
			slot0.five_star:setVisible(false)
		end

		slot0.advanced_bg:setVisible(false)
	else
		slot0.advanced_bg:setVisible(true)

		if not slot0.remain_star_num then
			slot0.remain_star_num = CommonNum.new(31, slot0.advanced_bg, 1, 5, cc.p(0.5, 0.5))

			slot0.remain_star_num:setPosition(43, 36)
		end

		slot0.remain_star_num:setNum(slot1)

		if not slot0.star_num then
			slot0.star_num = CommonNum.new(31, slot0.advanced_bg, 1, 5, cc.p(0.5, 0.5))

			slot0.star_num:setPosition(228, 36)
		end

		slot0.star_num:setNum(5)
	end
end

function NewPartnerSummonWindow.close_callback(slot0)
	CommonAlert.closeAllWin()

	if slot0.touch_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.touch_ticket)

		slot0.touch_ticket = nil
	end

	for slot4, slot5 in pairs(slot0.summon_timer) do
		if slot5 ~= nil then
			GlobalTimeTicket:getInstance():remove(slot5)

			slot5 = nil
		end
	end

	for slot4, slot5 in pairs(slot0.sprite_role_load) do
		if slot5 then
			slot5:DeleteMe()

			slot5 = nil
		end
	end

	if slot0.role_vo ~= nil and slot0.role_assets_event ~= nil then
		slot0.role_vo:UnBind(slot0.role_assets_event)

		slot0.role_assets_event = nil
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if slot0.remain_star_num then
		slot0.remain_star_num:DeleteMe()

		slot0.remain_star_num = nil
	end

	if slot0.star_num then
		slot0.star_num:DeleteMe()

		slot0.star_num = nil
	end

	if slot0.touch_summon_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.touch_summon_ticket)

		slot0.touch_summon_ticket = nil
	end

	slot0:showArenaPeakEffect(slot0.btn_summon_1, false)
	slot0:showArenaPeakEffect(slot0.btn_summon_10, false)
	doStopAllActions(slot0.item_list_res[1].item)
	doStopAllActions(slot0.item_list_res[2].item)
	doStopAllActions(slot0.item_list_res[3].item)
	uv0:openNewPartnerSummonWindow(false)
end
