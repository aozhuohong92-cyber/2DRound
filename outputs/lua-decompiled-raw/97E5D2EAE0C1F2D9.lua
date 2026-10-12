ActionWhiteDayPanel = class("ActionWhiteDayPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = table.sort

function ActionWhiteDayPanel.ctor(slot0, slot1)
	slot0.config = Config.HolidayValentineBossData
	slot0.holiday_bid = slot1
	slot0.camp_id = 50050

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.camp_id then
		slot0.camp_id = slot2.camp_id
	end

	slot0:loadResources()

	slot0.skill_item_list = {}
	slot0.reward_item_list = {}
end

function ActionWhiteDayPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildsecretarea", "guildsecretarea"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("actionwhitedaymonster", "actionwhitedaymonster"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.configUI then
			uv0:configUI()
		end

		if uv0.register_event then
			uv0:register_event()
		end
	end)
end

function ActionWhiteDayPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_white_day_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot0.hero_icon = slot0.main_container:getChildByName("hero_icon")

	slot0.hero_icon:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("活动时间："))

	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.fight_btn = slot0.main_container:getChildByName("fight_btn")
	slot0.btn_label = slot0.fight_btn:getChildByName("label")

	slot0.btn_label:setString(TI18N("前往挑战"))

	slot0.left_btn = slot0.main_container:getChildByName("left_btn")
	slot0.right_btn = slot0.main_container:getChildByName("right_btn")
	slot0.title = slot0.main_container:getChildByName("title")

	slot0.title:setString(TI18N("女神试炼"))

	slot0.buy_panel = slot0.main_container:getChildByName("buy_panel")

	slot0.buy_panel:getChildByName("key"):setString(TI18N("剩余次数:"))

	slot0.buy_count = slot0.buy_panel:getChildByName("label")
	slot0.buy_btn = slot0.buy_panel:getChildByName("add_btn")

	slot0.buy_btn:setVisible(false)

	slot0.buy_tips = createRichLabel(20, cc.c4b(255, 248, 191, 255), cc.p(0.5, 0.5), cc.p(0, -20), nil, , 600)

	slot0.buy_panel:addChild(slot0.buy_tips)

	slot0.skill_container = slot0.main_container:getChildByName("skill_container")
	slot0.skill_container_size = slot0.skill_container:getContentSize()

	slot0.skill_container:setScrollBarEnabled(false)

	slot0.item_container = slot0.main_container:getChildByName("item_container")

	slot0.item_container:setScrollBarEnabled(false)
	uv0:cs16603(slot0.holiday_bid)
	uv0:sender28800()
end

function ActionWhiteDayPanel.register_event(slot0)
	if not slot0.Init_White_Day_Event then
		slot0.Init_White_Day_Event = GlobalEvent:getInstance():Bind(ActionEvent.White_Day_Init_Event, function (slot0)
			uv0:setInitData(slot0)
		end)
	end

	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		if uv0:getActionSubTabVo(uv1.holiday_bid) and slot3.camp_id then
			uv1.camp_id = slot3.camp_id
		end

		slot4 = nil

		if uv1.config and uv1.config.data_boss_list and uv1.config.data_boss_list[uv1.camp_id] then
			slot4 = uv1.config.data_boss_list[uv1.camp_id][uv1.select_base_id]
		end

		if slot4 and slot4.rules then
			TipsManager:getInstance():showCommonTips(slot4.rules, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, true, 1, nil, 0.8)
	registerButtonEventListener(slot0.fight_btn, function ()
		uv0:clickFight()
	end, true, 1)
	registerButtonEventListener(slot0.buy_btn, function ()
		uv0:clickAdd()
	end, true, 1)
	registerButtonEventListener(slot0.left_btn, handler(slot0, slot0.onClickLeftBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.right_btn, handler(slot0, slot0.onClickRightBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
end

function ActionWhiteDayPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 then
		BattleConst.Fight_Type.WhiteDayWar = 41

		MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.WhiteDayWar)
	else
		BattleController:getInstance():openBattleView(false)
		MainuiController:getInstance():resetUIFightType()
	end
end

function ActionWhiteDayPanel.setInitData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0:setBossList()

	if next(slot0.boss_list) == nil then
		return
	end

	if #slot0.boss_list == 1 then
		slot0.left_btn:setVisible(false)
		slot0.right_btn:setVisible(false)
	end

	uv0(slot0.boss_list, SortTools.KeyLowerSorter("id"))

	slot0.can_challenge_times = slot1.time
	slot0.can_buy_time = slot1.buy_time

	if slot0.can_challenge_times then
		-- Nothing
	end

	slot0.buy_count:setString(tostring(slot0.can_challenge_times))

	if slot0.select_base_index == nil then
		if slot0.data.id == 0 then
			slot0.select_base_index = 1
		else
			for slot5, slot6 in ipairs(slot0.boss_list) do
				if slot0.data.id == slot6.id then
					slot0.select_base_index = slot5

					break
				end
			end
		end

		if slot0.select_base_index == nil then
			slot0.select_base_index = 1
		end
	end

	slot0:updateBossInfoByBossID(slot0.select_base_index)
end

function ActionWhiteDayPanel.setBossList(slot0)
	slot0.boss_list = {}

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot1.camp_id then
		slot0.camp_id = slot1.camp_id
	end

	if slot0.config and slot0.config.data_boss_list and slot0.config.data_boss_list[slot0.camp_id] then
		slot5 = slot0.camp_id

		for slot5, slot6 in pairs(slot0.config.data_boss_list[slot5]) do
			if slot0.data.id <= slot6.id then
				uv1(slot0.boss_list, slot6)
			end
		end
	end
end

function ActionWhiteDayPanel.clickFight(slot0)
	if slot0.data and slot0.data.time <= 0 then
		message(TI18N("挑战次数不足"))

		return
	end

	if not slot0.select_base_id then
		return
	end

	HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.WhiteDay, {
		select_base_id = slot0.select_base_id
	})
end

function ActionWhiteDayPanel.clickAdd(slot0)
	if not slot0.select_base_id then
		return
	end

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot1.camp_id then
		slot0.camp_id = slot1.camp_id
	end

	if slot0.config and slot0.config.data_boss_list and slot0.config.data_boss_list[slot0.camp_id] then
		if slot0.can_buy_time > 0 then
			slot4 = {}

			if slot0.config.data_boss_list[slot0.camp_id][slot0.select_base_id].buy_time - slot0.can_buy_time == 0 then
				slot4 = slot0.config.data_constant.holiday_valentine_boss_buy_loss1.val
			elseif slot3 < slot2 then
				slot4 = slot0.config.data_constant.holiday_valentine_boss_buy_loss2.val
			end

			if slot4 and slot4[1] then
				slot7 = CommonAlert.show(uv1(TI18N("是否消耗<img src='%s' scale=0.3 />%s购买次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot4[1][1] or 3).icon), slot4[1][2]), TI18N("确定"), function ()
					uv0:sender28803()
				end, TI18N("取消"), nil, CommonAlert.type.rich)
			end
		else
			uv0:sender28803()
		end
	end
end

function ActionWhiteDayPanel.onClickLeftBtn(slot0)
	if not slot0.boss_list then
		return
	end

	if not slot0.select_base_index then
		return
	end

	if #slot0.boss_list == 0 then
		return
	end

	slot0.select_base_index = slot0.select_base_index - 1

	if slot0.select_base_index <= 0 then
		slot0.select_base_index = #slot0.boss_list
	end

	slot0:updateBossInfoByBossID(slot0.select_base_index)
end

function ActionWhiteDayPanel.onClickRightBtn(slot0)
	if not slot0.boss_list then
		return
	end

	if not slot0.select_base_index then
		return
	end

	if #slot0.boss_list == 0 then
		return
	end

	slot0.select_base_index = slot0.select_base_index + 1

	if slot0.select_base_index > #slot0.boss_list then
		slot0.select_base_index = 1
	end

	slot0:updateBossInfoByBossID(slot0.select_base_index)
end

function ActionWhiteDayPanel.updateBossInfoByBossID(slot0, slot1)
	if not slot0.data then
		return
	end

	if not slot1 then
		return
	end

	if not slot0.boss_list[slot1] then
		return
	end

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.camp_id then
		slot0.camp_id = slot2.camp_id
	end

	slot0.select_base_id = slot0.boss_list[slot1].id

	if slot0.select_base_id == slot0.data.id then
		setChildUnEnabled(false, slot0.fight_btn, Config.ColorData.data_color4[1])
		slot0.btn_label:enableOutline(cc.c4b(101, 29, 0, 255), 2)
		slot0.fight_btn:setTouchEnabled(true)
	else
		setChildUnEnabled(true, slot0.fight_btn, Config.ColorData.data_color4[1])
		slot0.fight_btn:setTouchEnabled(false)
		slot0.btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	if slot0.config.data_boss_list[slot0.camp_id][slot0.select_base_id] and slot3.act_time then
		slot0.txt_time_value:setString(slot3.act_time)
	end

	slot0.boss_config = slot0.config.data_boss_list[slot0.camp_id][slot0.select_base_id]

	if not slot0.boss_config then
		return
	end

	if slot0.boss_config.buy_time > 0 then
		slot0.buy_btn:setVisible(true)
		slot0.buy_panel:setContentSize(cc.size(90, 34))
		slot0.buy_count:setPosition(45, 17)
	else
		slot0.buy_btn:setVisible(false)
		slot0.buy_panel:setContentSize(cc.size(120, 34))
		slot0.buy_count:setPosition(60, 17)
	end

	slot0:updateSkillInfo()

	if slot0.boss_config.title_name and slot0.boss_config.title_name ~= "" then
		slot0.title:setString(slot0.boss_config.title_name)
	end

	slot0.item_list = commonShowSingleRowItemList(slot0.item_container, slot0.item_list, slot0.boss_config.reward or {}, {
		scale = 0.9,
		max_count = 4,
		is_center = true
	})

	slot0:setBackgroundImg(slot0.boss_config.draw_id or 1)
end

function ActionWhiteDayPanel.updateSkillInfo(slot0)
	if not slot0.boss_config then
		return
	end

	slot0.skill_width = 100

	slot0.skill_container:setInnerContainerSize(cc.size(math.max(slot0.skill_container_size.width, (slot0.skill_width + 10) * #(slot0.boss_config.boss_skill_id or {})), slot0.skill_container_size.height))

	for slot8, slot9 in ipairs(slot0.skill_item_list) do
		slot9:setVisible(false)
	end

	slot5 = 0
	slot5 = slot0.skill_container_size.width < slot3 and 0 or (slot0.skill_container_size.width - slot3) * 0.5

	for slot9, slot10 in ipairs(slot1) do
		if Config.SkillData.data_get_skill(slot10) then
			if slot0.skill_item_list[slot9] == nil then
				slot0.skill_item_list[slot9] = {}
				slot0.skill_item_list[slot9] = SkillItem.new(true, true, true, 0.8, false)

				slot0.skill_container:addChild(slot0.skill_item_list[slot9])
			end

			slot0.skill_item_list[slot9]:setData(slot11)
			slot0.skill_item_list[slot9]:setVisible(true)
			slot0.skill_item_list[slot9]:setPosition(slot5 + slot2 * (slot9 - 1) + slot2 * 0.5, slot0.skill_width / 2 + 6)
		else
			print(uv0("技能表id: %s 没发现", tostring(slot10)))
		end
	end
end

function ActionWhiteDayPanel.setBackgroundImg(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.background_load then
		slot0.background_load = loadSpriteTextureFromCDN(slot0.image_bg, PathTool.getPlistImgForDownLoad("actionwhitedaymonster", "txt_cn_white_day_monster" .. slot1), ResourcesType.single, slot0.background_load)
	end
end

function ActionWhiteDayPanel.DeleteMe(slot0)
	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	if slot0.resources_load ~= nil then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.skill_item_list then
		for slot4, slot5 in pairs(slot0.skill_item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.Init_White_Day_Event then
		GlobalEvent:getInstance():UnBind(slot0.Init_White_Day_Event)

		slot0.Init_White_Day_Event = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end
end
