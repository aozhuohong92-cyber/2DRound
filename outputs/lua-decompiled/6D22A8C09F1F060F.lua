ActionyearmonsterChallengePanel = ActionyearmonsterChallengePanel or BaseClass(BaseView)
slot1 = ActionyearmonsterController:getInstance():getModel()
slot2 = string.format
slot3 = table.sort
slot4 = table.insert

function ActionyearmonsterChallengePanel.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.is_full_screen = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionyearmonster", "actionyearmonster_ch"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/actionyearmonster", "actionyearmonster_challenge_bg"),
			type = ResourcesType.single
		}
	}
	slot0.layout_name = "actionyearmonster/actionyearmonster_challenge_panel"
	slot0.skill_item_list = {}
	slot0.rank_list = {}
end

function ActionyearmonsterChallengePanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale() or 1)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.main_panel = slot0.main_container:getChildByName("main_panel")
	slot0.panel_bg = slot0.main_panel:getChildByName("panel_bg")

	loadSpriteTexture(slot0.panel_bg, PathTool.getPlistImgForDownLoad("bigbg/actionyearmonster", "actionyearmonster_challenge_bg"), LOADTEXT_TYPE)

	slot0.title_img = slot0.main_panel:getChildByName("title_img")
	slot0.title = slot0.main_panel:getChildByName("win_title")

	slot0.title:setString(TI18N("凶狠的年兽"))
	slot0.title:setZOrder(2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.rule_btn = slot0.main_panel:getChildByName("rule_btn")
	slot0.rank_container = slot0.main_container:getChildByName("rank_container")
	slot0.rank_info_btn = createRichLabel(22, cc.c4b(131, 231, 115, 255), cc.p(0.5, 0.5), cc.p(104, 16))

	slot0.rank_info_btn:setString(uv0("<div outline=2,#220101 href=xxx>%s</div>", TI18N("查看详情")))
	slot0.rank_info_btn:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:onClickRankBtn()
	end, {
		"click",
		"href"
	})
	slot0.rank_container:addChild(slot0.rank_info_btn)
	slot0.rank_container:getChildByName("rank_desc_label"):setString(TI18N("伤害排行前三"))

	slot0.look_btn = slot0.main_container:getChildByName("look_btn")

	slot0.look_btn:setVisible(false)

	slot0.challenge_btn = slot0.main_container:getChildByName("challenge_btn")

	slot0.challenge_btn:getChildByName("label"):setString(TI18N("挑 战"))

	slot0.skill_container = slot0.main_container:getChildByName("skill_container")
	slot0.skill_container_size = slot0.skill_container:getContentSize()

	slot0.skill_container:setScrollBarEnabled(false)

	slot0.item_container = slot0.main_container:getChildByName("item_container")

	slot0.item_container:setScrollBarEnabled(false)

	slot0.checkbox = slot0.main_container:getChildByName("checkbox")

	slot0.checkbox:getChildByName("name"):setString(TI18N("跳过战斗"))
	slot0.checkbox:setSelected(false)

	slot3 = slot0.main_container:getChildByName("buy_panel")

	slot3:getChildByName("key"):setString(TI18N("挑战次数:"))

	slot0.buy_count = slot3:getChildByName("label")
	slot0.buy_btn = slot3:getChildByName("add_btn")
	slot0.reward_title = slot0.main_container:getChildByName("reward_title")

	slot0.reward_title:setString(TI18N("挑战奖励"))

	slot0.time_key = slot0.main_container:getChildByName("time_key")

	slot0.time_key:setString(TI18N("限时:"))

	slot0.time_val = slot0.main_container:getChildByName("time_val")

	slot0.time_val:setString("")

	slot0.buy_tips = slot0.main_container:getChildByName("lese_count")

	slot0.buy_tips:setString("")
end

function ActionyearmonsterChallengePanel.register_event(slot0)
	registerButtonEventListener(slot0.background, handler(slot0, slot0.onClickCloseBtn), false, 2)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickCloseBtn), true, 2)
	registerButtonEventListener(slot0.look_btn, handler(slot0, slot0.onClickLookBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.rule_btn, handler(slot0, slot0.onClickRuleBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.challenge_btn, handler(slot0, slot0.onClickChallengeBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickBuyCountBtn), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY)
	slot0.checkbox:addEventListener(function (slot0, slot1)
		playButtonSound2()

		if not uv0.scdata then
			return
		end

		slot2 = uv0.checkbox:isSelected()
	end)
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Rank_Info_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:updateRankInfo(slot0)
	end)
	slot0:addGlobalEvent(ActionyearmonsterEvent.Year_Buy_count_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.scdata then
			return
		end

		uv0.scdata.combat_time = uv0.scdata.combat_time + 1
		uv0.scdata.buy_time = uv0.scdata.buy_time - 1

		if uv0.scdata.buy_time < 0 then
			uv0.scdata.buy_time = 0
		end

		uv0:updateBuyCount()

		if uv0.is_send_matching then
			uv0.is_send_matching = false

			uv0:onClickChallengeBtn(true)
		end
	end)
end

function ActionyearmonsterChallengePanel.onClickCloseBtn(slot0)
	uv0:openActionyearmonsterChallengePanel(false)
end

function ActionyearmonsterChallengePanel.onClickRuleBtn(slot0, slot1, slot2, slot3)
	if Config.HolidayNianData.data_const.holiday_nian_fight_desc then
		TipsManager:getInstance():showCommonTips(slot4.desc, slot2:getTouchBeganPosition())
	end
end

function ActionyearmonsterChallengePanel.onClickLookBtn(slot0)
end

function ActionyearmonsterChallengePanel.onClickRankBtn(slot0)
	if not slot0.boss_config then
		return
	end

	if not slot0.scdata then
		return
	end

	if slot0.scdata.type == ActionyearmonsterConstants.Evt_Type.YearMonster then
		-- Nothing
	else
		slot1.type = 2
	end

	RankController:getInstance():openSingleRankMainWindow(true, {
		rank_type = RankConstant.RankType.year_monster,
		title_name = TI18N("排行榜"),
		background_path = PathTool.getPlistImgForDownLoad("planes/map_bg", "map_bg_100001", true),
		type = 1,
		only_show_rank = true
	})
end

function ActionyearmonsterChallengePanel.onClickBuyCountBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.buy_time <= 0 then
		if slot1 then
			message(TI18N("已达到本次讨伐挑战次数上限"))
		else
			message(TI18N("购买次数已达上限"))
		end

		return
	end

	slot2 = nil
	slot3 = 0

	if slot0.scdata.type == ActionyearmonsterConstants.Evt_Type.YearMonster then
		slot2 = Config.HolidayNianData.data_const.holiday_nian_timer_monster_buy_price
		slot3 = 1
	else
		slot2 = Config.HolidayNianData.data_const.holiday_nian_gold_monster_buy_price
		slot3 = 2
	end

	if slot2 and next(slot2.val) then
		slot5 = slot2.val[1][2]
		slot6 = PathTool.getItemRes(Config.ItemData.data_get_data(slot2.val[1][1]).icon)
		slot7 = nil

		CommonAlert.show((not slot1 or uv0(TI18N("挑战次数不足, 是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), slot6, slot5)) and uv0(TI18N("是否花费 <img src='%s' scale=0.3 /> %s购买一次挑战次数？"), slot6, slot5), TI18N("确定"), function ()
			if uv0.scdata.bid ~= 0 then
				uv0.is_send_matching = uv1

				uv2:sender28212(uv3)
			end
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function ActionyearmonsterChallengePanel.onClickChallengeBtn(slot0, slot1)
	if not slot0.scdata then
		return
	end

	if slot0.scdata.combat_time <= 0 then
		slot0:onClickBuyCountBtn(true)

		return
	end

	if slot0.checkbox:isSelected() then
		slot3 = {}

		uv0(slot3, {
			val2 = 1,
			val1 = 1,
			type = ActionyearmonsterConstants.Proto_28203._4
		})
		uv1:sender28203(slot0.scdata.index, 1, slot3)
	else
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.YearMonster, {
			grid_index = slot0.scdata.index
		})
	end
end

function ActionyearmonsterChallengePanel.showEffect(slot0, slot1, slot2, slot3)
	if slot1 == true then
		if slot0.play_effect == nil then
			slot0.play_effect = createEffectSpine(slot2 or "E28002", cc.p(400, 543), cc.p(0.5, 0.5), true, slot3 or PlayerAction.stand)

			slot0.main_panel:addChild(slot0.play_effect, 1)
		end
	elseif slot0.play_effect then
		slot0.play_effect:setVisible(false)
		slot0.play_effect:removeFromParent()

		slot0.play_effect = nil
	end
end

function ActionyearmonsterChallengePanel.openRootWnd(slot0, slot1)
	if not (slot1 or {}).data then
		return
	end

	slot0:setScData(slot3)
end

function ActionyearmonsterChallengePanel.updateData(slot0, slot1)
	slot0.scdata = slot1

	slot0:updateBuyCount()

	if slot0.scdata.type == ActionyearmonsterConstants.Evt_Type.YearMonster then
		uv0:sender28213(1, 0)
	else
		uv0:sender28213(2, 0)
	end
end

function ActionyearmonsterChallengePanel.setScData(slot0, slot1)
	slot0.scdata = slot1
	slot2 = nil

	if slot0.scdata.type == ActionyearmonsterConstants.Evt_Type.YearMonster then
		slot2 = ActionyearmonsterConstants.evt_limit_monster_hit

		uv0:sender28213(1, 0)
		slot0:showEffect(true, "E28002")
	else
		slot2 = ActionyearmonsterConstants.evt_gold_monster_hit

		uv0:sender28213(2, 0)
		slot0:showEffect(true, "E28003")

		if slot0.title_img then
			loadSpriteTexture(slot0.title_img, PathTool.getResFrame("actionyearmonster_ch", "txt_cn_actionyearmonster_ch_7"), LOADTEXT_TYPE_PLIST)
		end
	end

	slot0.boss_config = Config.HolidayNianData.data_evt_info[slot2]

	if not slot0.boss_config then
		return
	end

	slot0:updateBossInfoByBossID()
	slot0:updateBuyCount()
end

function ActionyearmonsterChallengePanel.updateBuyCount(slot0)
	if not slot0.scdata then
		return
	end

	if not slot0.buy_count then
		return
	end

	slot2 = nil

	if (slot0.scdata.type ~= ActionyearmonsterConstants.Evt_Type.YearMonster or Config.HolidayNianData.data_const.holiday_nian_timer_monster_free_time) and Config.HolidayNianData.data_const.holiday_nian_gold_monster_free_time then
		slot0.buy_count:setString(uv0("%s/%s", slot0.scdata.combat_time or 1, slot2.val))
	end

	slot0.buy_tips:setString(string.format("%s%s", TI18N("剩余购买次数:"), slot0.scdata.buy_time or 0))
end

function ActionyearmonsterChallengePanel.updateBossInfoByBossID(slot0)
	if not slot0.scdata then
		return
	end

	slot0:updateSkillInfo()

	slot0.item_list = commonShowSingleRowItemList(slot0.item_container, slot0.item_list, slot0.boss_config.reward or {}, {
		scale = 0.9,
		max_count = 4,
		is_center = true
	})

	slot0.title:setString(slot0.boss_config.name)
	commonCountDownTime(slot0.time_val, slot0.scdata.last_time or 0, {
		callback = function (slot0)
			uv0:setTimeFormatString(slot0)
		end
	})
end

function ActionyearmonsterChallengePanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIII(slot1))
	else
		slot0.time_val:setString("00:00")
	end
end

function ActionyearmonsterChallengePanel.updateSkillInfo(slot0)
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
				slot0.skill_item_list[slot9] = SkillItem.new(true, true, true, 0.8, true)

				slot0.skill_container:addChild(slot0.skill_item_list[slot9])
			end

			slot0.skill_item_list[slot9]:setData(slot11)
			slot0.skill_item_list[slot9]:setVisible(true)
			slot0.skill_item_list[slot9]:setPosition(slot5 + slot2 * (slot9 - 1) + slot2 * 0.5, slot0.skill_width / 2 - 2)
		else
			print(uv0("技能表id: %s 没发现", tostring(slot10)))
		end
	end
end

function ActionyearmonsterChallengePanel.updateRankInfo(slot0, slot1)
	if not slot0.boss_config then
		return
	end

	if not slot1 then
		return
	end

	uv0(slot1.dps_list, SortTools.KeyLowerSorter("rank"))

	slot2 = {}

	for slot6 = 1, 3 do
		if slot1.dps_list[slot6] then
			uv1(slot2, {
				name = slot7.name,
				all_dps = slot7.dps
			})
		else
			uv1(slot2, {
				name = TI18N("虚位以待")
			})
		end
	end

	if slot2 and next(slot2 or {}) ~= nil then
		for slot6, slot7 in ipairs(slot2) do
			if not slot0.rank_list[slot6] then
				slot8 = slot0:createSingleRankItem(slot6, slot7)

				slot0.rank_container:addChild(slot8)

				slot0.rank_list[slot6] = slot8
			end

			if slot8 then
				slot8:setPosition(0, 238 - (slot6 - 1) * slot8:getContentSize().height)
				slot8.label:setString(slot7.name)

				if slot7.all_dps then
					slot8.value:setString("[" .. MoneyTool.GetMoneyString(slot7.all_dps, false) .. TI18N("伤害") .. "]")
					slot8.label:setPositionY(40)
				else
					slot8.value:setString("")
					slot8.label:setPositionY(24)
				end
			end
		end
	end
end

function ActionyearmonsterChallengePanel.createSingleRankItem(slot0, slot1, slot2)
	slot3 = cc.size(208, 63)
	slot4 = ccui.Layout:create()

	slot4:setAnchorPoint(cc.p(0, 1))
	slot4:setContentSize(slot3)

	slot5 = createSprite(PathTool.getResFrame("common", "common_300" .. slot1), 10, slot3.height * 0.5, slot4)

	slot5:setAnchorPoint(cc.p(0, 0.5))
	slot5:setScale(0.6)

	slot4.sp = slot5
	slot4.label = createLabel(22, cc.c4b(236, 221, 204, 255), cc.c4b(34, 1, 1, 255), 67, 40, "", slot4, 2, cc.p(0, 0.5))
	slot4.value = createLabel(18, cc.c4b(200, 173, 131, 255), cc.c4b(34, 1, 1, 255), 67, 16, "", slot4, 2, cc.p(0, 0.5))

	return slot4
end

function ActionyearmonsterChallengePanel.close_callback(slot0)
	slot0:showEffect(false)

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_container)
	uv0:openActionyearmonsterChallengePanel(false)
end
