SandybeachBossFightMainWindow = SandybeachBossFightMainWindow or BaseClass(BaseView)
slot0 = ActionController:getInstance()
slot1 = table.sort
slot2 = string.format
slot3 = table.insert
slot4 = 7
slot5 = {
	{
		266,
		-235
	},
	{
		266,
		57
	},
	{
		145,
		153
	},
	{
		311,
		274
	},
	{
		257,
		394
	},
	{
		351,
		447
	},
	{
		330,
		518
	},
	{
		369,
		548
	}
}
slot6 = {
	1,
	1.05,
	1,
	0.59,
	0.42,
	0.3,
	0.22,
	0.12
}
slot7 = {}

function SandybeachBossFightMainWindow.__init(slot0)
	slot0.win_type = WinType.Full
	slot0.layout_name = "acitonsandybeachbossfight/sandybeach_boss_fight_main_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("actionsandybeachbossfight", "sandybeach_boss_fight"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_1"),
			type = ResourcesType.single
		}
	}
	slot0.reward_conifg_list = Config.HolidayBossData.data_reward_info

	if slot0.reward_conifg_list then
		uv0(slot0.reward_conifg_list, function (slot0, slot1)
			return slot0.id < slot1.id
		end)
	end

	slot0.buy_max_count = 1

	for slot5, slot6 in pairs(Config.HolidayBossData.data_buy_info) do
		if slot0.buy_max_count <= slot6.max then
			slot0.buy_max_count = slot6.max
		end
	end

	slot0.rank_config_list = Config.HolidayBossData.data_rank_info

	if slot0.rank_config_list then
		uv0(slot0.rank_config_list, function (slot0, slot1)
			return slot0.min < slot1.min
		end)
	end

	slot0.cur_master_id = nil
	slot0.first_init = nil
	slot0.cur_step_count = 0
	slot0.show_item_id = 80228
end

function SandybeachBossFightMainWindow.open_callback(slot0)
	slot0.bg_image = slot0.root_wnd:getChildByName("bg_image")
	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container)

	slot0.main_panel_size = slot0.main_container:getContentSize()
	slot0.top_panel = slot0.main_container:getChildByName("top_panel")

	slot0.top_panel:getChildByName("title_name"):setString(TI18N("星空试炼"))

	slot0.look_btn = slot0.top_panel:getChildByName("look_btn")
	slot0.item_icon = slot0.top_panel:getChildByName("item_icon")

	if Config.ItemData.data_get_data(slot0.show_item_id) and slot0.item_icon then
		loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
	end

	slot0.top_panel:getChildByName("summer_score_key"):setString(TI18N("试炼彩星"))

	slot0.summer_score_value = slot0.top_panel:getChildByName("summer_score_value")

	slot0.summer_score_value:setString("")
	slot0.top_panel:getChildByName("next_text"):setString(TI18N("下一阶段"))

	slot0.item_node = slot0.top_panel:getChildByName("item_node")
	slot0.score_item = BackPackItem.new(false, true, false, 0.7, false, true)

	slot0.score_item:addBtnCallBack(function ()
		uv0:onClickScoreItemBtn()
	end)
	slot0.item_node:addChild(slot0.score_item)

	slot0.progress = slot0.top_panel:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setCascadeOpacityEnabled(true)
	slot0.progress:setPercent(0)

	slot0.cur_score = slot0.top_panel:getChildByName("cur_score")

	slot0.cur_score:setString("")

	slot0.progress_container = slot0.main_container:getChildByName("progress_container")

	slot0.progress_container:setLocalZOrder(40)

	slot0.boss_hp_progress = slot0.progress_container:getChildByName("progress")

	slot0.boss_hp_progress:setScale9Enabled(true)
	slot0.boss_hp_progress:setPercent(0)

	slot0.boss_hp_value = slot0.progress_container:getChildByName("hp_value")

	slot0.boss_hp_value:setString("")

	slot0.boss_name = slot0.progress_container:getChildByName("boss_name")

	slot0.boss_name:setString("")

	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)
	slot2 = slot0.head_icon:getContentSize()

	slot0.head_icon:setTouchEnabled(false)
	slot0.head_icon:setScale(0.55)
	slot0.head_icon:closeLev()
	slot0.head_icon:setAnchorPoint(cc.p(0.5, 0.5))
	slot0.head_icon:setPosition(-20, 25)
	slot0.progress_container:addChild(slot0.head_icon)

	slot0.bottom_panel = slot0.main_container:getChildByName("bottom_panel")
	slot0.button_bg = slot0.bottom_panel:getChildByName("button_bg")

	slot0.bottom_panel:getChildByName("cur_rank_key"):setString(TI18N("当前排名:"))

	slot0.cur_rank_value = slot0.bottom_panel:getChildByName("cur_rank_value")

	slot0.cur_rank_value:setString("")
	slot0.bottom_panel:getChildByName("cur_rank_tips"):setString(TI18N("当前排名奖励"))

	slot0.dungeons_lable = slot0.bottom_panel:getChildByName("dungeons_lable")

	slot0.dungeons_lable:setString("")
	slot0.bottom_panel:getChildByName("boss_level_key"):setString(TI18N("怪物等级:"))

	slot0.boss_level_value = slot0.bottom_panel:getChildByName("boss_level_value")

	slot0.boss_level_value:setString("")
	slot0.bottom_panel:getChildByName("dungeons_key_0"):setString(TI18N("奖励积分:"))

	slot0.dungeons_key = slot0.bottom_panel:getChildByName("dungeons_key")

	slot0.dungeons_key:setString(TI18N("关卡效果:"))

	slot3, slot4 = slot0.dungeons_key:getPosition()
	slot0.dungeons_effect_label = {
		createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot3, slot4 - 38), nil, nil, 720),
		createRichLabel(22, cc.c4b(100, 50, 35, 255), cc.p(0, 0.5), cc.p(slot3, slot4 - 76), nil, nil, 720)
	}

	slot0.bottom_panel:addChild(slot0.dungeons_effect_label[1])
	slot0.bottom_panel:addChild(slot0.dungeons_effect_label[2])

	slot0.item_node_1 = slot0.bottom_panel:getChildByName("item_node_1")
	slot0.item_node_2 = slot0.bottom_panel:getChildByName("item_node_2")
	slot0.show_item_1 = BackPackItem.new(false, false, false, 0.7, false, false)

	slot0.item_node_1:addChild(slot0.show_item_1)
	slot0.show_item_1:setBaseData(slot0.show_item_id, 1)
	slot0.show_item_1:setGoodsName(TI18N("通关积分"), nil, 28)

	slot0.show_item_2 = BackPackItem.new(false, false, false, 0.7, false, false)

	slot0.item_node_2:addChild(slot0.show_item_2)
	slot0.show_item_2:setBaseData(slot0.show_item_id, 1)
	slot0.show_item_2:setGoodsName(TI18N("伤害积分"), nil, 28)

	slot0.item_scrollview = slot0.bottom_panel:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.match_btn = slot0.bottom_panel:getChildByName("match_btn")

	slot0.match_btn:getChildByName("label"):setString(TI18N("挑战"))

	slot0.close_btn = slot0.bottom_panel:getChildByName("close_btn")
	slot0.rank_btn = slot0.bottom_panel:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("排行榜"))

	slot5 = slot0.bottom_panel:getChildByName("buy_panel")

	slot5:getChildByName("key"):setString(TI18N("挑战次数:"))

	slot0.buy_count = slot5:getChildByName("label")

	slot0.buy_count:setString("")

	slot0.buy_btn = slot5:getChildByName("add_btn")

	slot0.bottom_panel:getChildByName("Text_1"):setString(TI18N("剩余今日可购买次数："))

	slot0.today_count = slot0.bottom_panel:getChildByName("today_count")

	slot0.today_count:setString("")

	slot0.action_panel = slot0.main_container:getChildByName("action_panel")
	slot0.boss_spine_node = cc.Node:create()

	slot0.action_panel:addChild(slot0.boss_spine_node, 20)
	slot0:loadBackground()
	slot0:loadRoleLevelStep()
	slot0:adaptationScreen()
end

function SandybeachBossFightMainWindow.loadBackground(slot0)
	if slot0.bg_image then
		loadSpriteTexture(slot0.bg_image, PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_1"), LOADTEXT_TYPE)
		slot0.bg_image:setScale(display.getMaxScale())
		slot0.bg_image:setPositionY(display.getBottom(slot0.main_container))
	end

	if not slot0.load_button_bg then
		slot0.load_button_bg = loadSpriteTextureFromCDN(slot0.button_bg, PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_2"), ResourcesType.single, slot0.load_button_bg)
	end
end

function SandybeachBossFightMainWindow.adaptationScreen(slot0)
	slot0.top_panel:setPositionY(display.getTop(slot0.main_container) - (slot0.main_panel_size.height - slot0.top_panel:getPositionY()))
	slot0.bottom_panel:setPositionY(display.getBottom(slot0.main_container) + slot0.bottom_panel:getPositionY())
end

function SandybeachBossFightMainWindow.loadRoleLevelStep(slot0)
	slot0.sprite_action = {}

	doStopAllActions(slot0.action_panel)

	for slot4 = 1, uv0 do
		delayRun(slot0.action_panel, slot4 * 5 / 60, function ()
			uv0.sprite_action[uv1] = createSprite(PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_3"), uv2[uv1 + 1][1], uv2[uv1 + 1][2], uv0.action_panel, cc.p(0.5, 0.5), LOADTEXT_TYPE, 10 - uv1)

			uv0.sprite_action[uv1]:setScale(uv3[uv1 + 1])

			if uv1 == uv4 - 1 then
				uv0.sprite_action[uv1]:setOpacity(180)
			elseif uv1 == uv4 then
				uv0.sprite_action[uv1]:setOpacity(0)
			end
		end)
	end
end

function SandybeachBossFightMainWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, handler(slot0, slot0.onClickBtnClose), true, 1)
	registerButtonEventListener(slot0.rank_btn, handler(slot0, slot0.onClickRankBtn), true, 1)
	registerButtonEventListener(slot0.buy_btn, handler(slot0, slot0.onClickBuyCountBtn), true, 1)
	registerButtonEventListener(slot0.match_btn, handler(slot0, slot0.onClickMatchBtn), true, 1)
	registerButtonEventListener(slot0.look_btn, function (slot0, slot1, slot2)
		if Config.HolidayBossData.data_const.game_rule1 then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1)
	slot0:addGlobalEvent(ActionEvent.Aandybeach_Boss_Fight_Main_Event, function (slot0)
		if not slot0 then
			return
		end

		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(ActionEvent.Aandybeach_Boss_Fight_Buy_Count_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.data then
			return
		end

		uv0.data.count = slot0.count
		uv0.data.buy_count = slot0.buy_count

		uv0:updateBuyCount()
	end)
	slot0:addGlobalEvent(ActionEvent.Aandybeach_Boss_Fight_Reward_Event, function (slot0)
		if not slot0 then
			return
		end

		if not uv0.data then
			return
		end

		uv0.data.award_info = slot0.award_info

		uv0:updateRewardUI()
	end)
	slot0:addGlobalEvent(ActionEvent.Aandybeach_Boss_Fight_Result_Close, function ()
		if uv0.IsStepSlide then
			uv0:onPassLevelAction()
		end
	end)
end

function SandybeachBossFightMainWindow.onClickBtnClose(slot0)
	uv0:openSandybeachBossFightMainWindow(false)
end

function SandybeachBossFightMainWindow.onClickRankBtn(slot0)
	RankController:getInstance():openSingleRankMainWindow(true, {
		rank_type = RankConstant.RankType.sandybeach_boss_fight,
		title_name = TI18N("排行榜"),
		background_path = PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_1"),
		show_tips = TI18N("奖励将在活动结束后通过邮件发放")
	})
end

function SandybeachBossFightMainWindow.onClickBuyCountBtn(slot0)
	if not slot0.data then
		return
	end

	slot1 = slot0.data.count or 0
	slot2 = 10

	if Config.HolidayBossData.data_const.fight_max_count then
		slot2 = slot3.val
	end

	if slot2 <= slot1 then
		message(TI18N("挑战次数已达上限"))

		return
	end

	if not Config.HolidayBossData.data_buy_info then
		return
	end

	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		uv0(slot5, slot10)
	end

	uv1(slot5, function (slot0, slot1)
		return slot0.min < slot1.min
	end)

	if #slot5 == 0 then
		return
	end

	slot6 = slot5[#slot5]

	if slot5[#slot5].max <= slot0.data.buy_count then
		message(TI18N("购买次数已达上限"))

		return
	end

	slot7 = nil

	for slot11, slot12 in ipairs(slot5) do
		if slot12.min <= slot0.data.buy_count and slot0.data.buy_count <= slot12.max then
			slot7 = slot12
		end
	end

	if slot7 and next(slot7.expend) ~= nil then
		CommonAlert.show(uv2(TI18N("是否花费<img src='%s' scale=0.3 />%s购买一次挑战次数？"), PathTool.getItemRes(Config.ItemData.data_get_data(slot7.expend[1][1]).icon), slot7.expend[1][2]), TI18N("确定"), function ()
			uv0:sender25402()
		end, TI18N("取消"), nil, CommonAlert.type.rich)
	end
end

function SandybeachBossFightMainWindow.moveTo(slot0, slot1, slot2, slot3, slot4)
	if slot2 then
		slot5 = cc.MoveTo:create(1, slot3)

		if slot1 == 1 then
			slot4 = 0.2
		end

		if slot1 == uv0 - 1 then
			slot2:runAction(cc.Spawn:create(slot5, cc.ScaleTo:create(1, slot4), cc.CallFunc:create(function ()
				uv0:setOpacity(255)
			end)))
		else
			slot2:runAction(cc.Spawn:create(slot5, slot6))
		end
	end
end

function SandybeachBossFightMainWindow.onPassLevelAction(slot0)
	if slot0.station_node then
		doStopAllActions(slot0.station_node)
	end

	slot0:resetStepPos()

	slot0.station_node = cc.Node:create()

	slot0:addChild(slot0.station_node)

	slot0.IsStepSlide = nil
	slot1 = {
		[slot6] = cc.CallFunc:create(function ()
			if not uv0[uv1] then
				uv0[uv1] = true

				uv2:moveTo(uv1, uv2.sprite_action[uv1], cc.p(uv3[uv1][1], uv3[uv1][2]), uv4[uv1])
			end
		end)
	}
	slot2 = {}

	for slot6 = 1, uv0 - 1 do
	end

	slot0.station_node:runAction(cc.Sequence:create(cc.Spawn:create(cc.CallFunc:create(function ()
		if math.abs(uv0.bg_image:getPositionY() - 10) >= uv0.bg_image:getContentSize().height - 1280 then
			slot0 = 0
		end

		if uv0.bg_image then
			uv0.bg_image:runAction(cc.EaseSineInOut:create(cc.MoveTo:create(1, cc.p(uv0.bg_image:getPositionX(), uv0.bg_image:getPositionY() - slot0))))
		end
	end), slot1[1], slot1[2], slot1[3], slot1[4], slot1[5], slot1[6], cc.CallFunc:create(function ()
		if uv0.sprite_action[uv1] then
			uv0.sprite_action[uv1]:setPosition(cc.p(uv2[uv1 + 1][1], uv2[uv1 + 1][2]))
			uv0.sprite_action[uv1]:setScale(0)
			uv0.sprite_action[uv1]:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
				uv0.sprite_action[uv1]:setOpacity(180)
			end), cc.Spawn:create(cc.FadeIn:create(1), cc.ScaleTo:create(1, uv3[uv1]), cc.MoveTo:create(1, cc.p(uv2[uv1][1], uv2[uv1][2])))))
		end
	end)), cc.DelayTime:create(1.5), cc.Spawn:create(cc.CallFunc:create(function ()
		if uv0.spine then
			uv0.spine:runAction(cc.FadeIn:create(1))
		end
	end), cc.CallFunc:create(function ()
		if uv0.load_rolespine_bg then
			uv0.load_rolespine_bg:runAction(cc.FadeIn:create(1))
		end
	end))))
end

function SandybeachBossFightMainWindow.resetStepPos(slot0)
	for slot4 = 1, uv0 - 1 do
		if slot0.sprite_action[slot4] then
			slot0.sprite_action[slot4]:setPosition(uv1[slot4 + 1][1], uv1[slot4 + 1][2])
			slot0.sprite_action[slot4]:setScale(uv2[slot4 + 1])
		end
	end

	slot0.cur_step_count = slot0.cur_step_count + 1
	slot1 = cc.p(uv1[uv0 - 2][1], uv1[uv0 - 2][2])

	if slot0.cur_step_count == 2 then
		slot0.cur_step_count = 0
		slot1 = cc.p(uv1[uv0 - 1][1], uv1[uv0 - 1][2])
	end

	if slot0.sprite_action[uv0] then
		slot0.sprite_action[uv0]:setPosition(slot1)
		slot0.sprite_action[uv0]:setOpacity(0)
	end
end

function SandybeachBossFightMainWindow.setShowBossData(slot0)
	if not slot0.select_boss_index then
		return
	end

	if slot0.config_id_list[slot0.select_boss_index] then
		slot1 = nil

		slot0:updateBossInfo((slot0.dic_boss_config[slot0.config_id_list[slot0.select_boss_index].order_id] ~= nil or Config.HolidayBossData.data_boss_info(slot0.config_id_list[slot0.select_boss_index].order_id)) and slot0.dic_boss_config[slot0.config_id_list[slot0.select_boss_index].order_id])
	end
end

function SandybeachBossFightMainWindow.onClickScoreItemBtn(slot0)
	if not slot0.data then
		return
	end

	slot1, slot2 = slot0:getCurrentRewardConfig()

	if slot1 then
		if not slot2 and slot1.num <= (slot0.data.score or 0) then
			uv0:sender25403()
		else
			slot4 = {
				title_name = TI18N("奖励详情"),
				tips = TI18N("达到指定积分,可领取对应奖励"),
				cur_txt = uv1(TI18N(slot9), slot8),
				cur_score = slot3,
				score_data_list = {}
			}
			slot9 = "当前夏日积分:%s"

			for slot3, slot9 in ipairs(slot0.reward_conifg_list) do
				uv2(slot4.score_data_list, {
					score = slot9.num,
					reward = slot9.items[1]
				})
			end

			uv0:openActionCommonRewardPanel(true, slot4)
		end
	end
end

function SandybeachBossFightMainWindow.onClickMatchBtn(slot0)
	if not slot0.select_boss_index then
		return
	end

	if not slot0.config_id_list then
		return
	end

	if slot0.data.order < slot0.config_id_list[slot0.select_boss_index].order_id then
		message(TI18N("请先通关前置关卡"))
	elseif slot1 < slot0.data.order then
		message(TI18N("该关卡已经通关"))
	else
		HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Sandybeach_boss)
	end
end

function SandybeachBossFightMainWindow.openRootWnd(slot0)
	uv0:sender25401()
end

function SandybeachBossFightMainWindow.setData(slot0, slot1)
	slot0.data = slot1 or {}

	if not Config.HolidayBossData.data_boss_info(slot1.order) then
		return
	end

	slot0.dic_boss_config = {
		[slot2.order_id] = slot2
	}
	slot0.config_id_list = Config.HolidayBossData.data_boss_group[slot2.group_id]

	if slot0.config_id_list == nil then
		return
	end

	function slot6(slot0, slot1)
		return slot0.order_id < slot1.order_id
	end

	uv0(slot0.config_id_list, slot6)

	for slot6, slot7 in pairs(slot0.config_id_list) do
		if slot2.order_id == slot7.order_id then
			slot0.select_boss_index = slot6
		end
	end

	slot0.summer_score_value:setString(slot0.data.score)
	slot0:updateRewardUI()
	slot0:setShowBossData()
	slot0:updateRankUI()
	slot0:updateBuyCount()
end

function SandybeachBossFightMainWindow.updateRewardUI(slot0)
	slot1, slot2 = slot0:getCurrentRewardConfig()

	if slot1 then
		if slot1.items and next(slot3) ~= nil then
			slot0.score_item:setBaseData(slot3[1][1], slot3[1][2], true)
		end

		if slot1.num <= (slot0.data.score or 0) then
			if slot2 then
				slot0.score_item:setReceivedIcon(true)
				slot0.score_item:showItemEffect(false)
			else
				slot0.score_item:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
			end

			slot4 = slot1.num
		else
			slot0.score_item:showItemEffect(false)
		end

		slot0.progress:setPercent(slot4 * 100 / slot1.num)
		slot0.cur_score:setString(uv0("%s/%s", slot4, slot1.num))
	end
end

function SandybeachBossFightMainWindow.getCurrentRewardConfig(slot0)
	if not slot0.data then
		return
	end

	if not slot0.reward_conifg_list then
		return
	end

	slot1 = nil
	slot2 = false

	if #slot0.data.award_info == 0 then
		slot1 = slot0.reward_conifg_list[1]
	else
		slot3 = {
			[slot8.award_id] = true
		}

		for slot7, slot8 in ipairs(slot0.data.award_info) do
			-- Nothing
		end

		for slot7, slot8 in ipairs(slot0.reward_conifg_list) do
			if not slot3[slot8.id] then
				slot1 = slot8

				break
			end
		end

		if slot1 == nil then
			slot1 = slot0.reward_conifg_list[#slot0.reward_conifg_list]
			slot2 = true
		end
	end

	return slot1, slot2
end

function SandybeachBossFightMainWindow.updateRankUI(slot0)
	if not slot0.data then
		return
	end

	if not slot0.rank_config_list then
		return
	end

	slot2 = nil

	if (slot0.data.rank or 0) == 0 then
		slot0.cur_rank_value:setString(TI18N("未上榜"))

		slot2 = slot0.rank_config_list[#slot0.rank_config_list]
	else
		slot6 = slot0.data.rank

		slot0.cur_rank_value:setString(slot6)

		for slot6, slot7 in ipairs(slot0.rank_config_list) do
			if slot7.min <= slot1 and slot1 <= slot7.max then
				slot2 = slot7
			end
		end
	end

	if slot2 == nil then
		slot2 = slot0.rank_config_list[#slot0.rank_config_list]
	end

	if slot2 then
		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2.items, {
			scale = 0.6,
			max_count = 3
		})
	end
end

function SandybeachBossFightMainWindow.updateBossInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = 0
	slot3 = 0

	if slot0.data.order < slot1.order_id then
		slot2 = 100
		slot3 = 100
	elseif slot1.order_id < slot0.data.order then
		slot2 = 0
		slot3 = 0
	else
		slot2 = math.floor(slot0.data.hp_per / 1000)
		slot3 = slot0.data.hp_per / 1000
	end

	slot0.boss_hp_value:setString(uv0("%s%%", slot2))
	slot0.boss_hp_progress:setPercent(slot3)
	slot0.boss_name:setString(slot1.name)

	if slot0.record_head_id == nil or slot0.record_head_id ~= slot1.head_id then
		slot0.record_head_id = slot1.head_id

		slot0.head_icon:setHeadRes(slot1.head_id)
	end

	slot0:updateSpine(slot1.unit_id)
	slot0.dungeons_lable:setString(uv0(TI18N("第%s关"), slot1.order_id))

	slot7 = slot1.level

	slot0.boss_level_value:setString(slot7)

	for slot7 = 1, 2 do
		if slot0.dungeons_effect_label[slot7] then
			if slot1.add_skill_decs[slot7] then
				slot0.dungeons_effect_label[slot7]:setString(slot1.add_skill_decs[slot7])
			else
				slot1.add_skill_decs[slot7]:setString("")
			end
		end
	end

	if slot0.show_item_1 then
		slot0.show_item_1:setNum(slot1.kill_score)
	end

	if slot0.show_item_2 then
		slot0.show_item_2:setNum(slot1.dps_score)
	end
end

function SandybeachBossFightMainWindow.updateSpine(slot0, slot1)
	if slot0.cur_master_id == slot1 then
		return
	end

	if not slot0.load_rolespine_bg then
		slot0.load_rolespine_bg = createSprite(PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_4"), uv0[3][1], uv0[3][2] + 61, slot0.boss_spine_node, cc.p(0.5, 0), LOADTEXT_TYPE)
	end

	slot0.IsStepSlide = true
	slot0.cur_master_id = slot1

	if slot0.spine then
		doStopAllActions(slot0.spine)
		slot0.spine:removeFromParent()

		slot0.spine = nil

		;(function ()
			if not uv0.spine then
				uv0.spine = BaseRole.new(BaseRole.type.unit, uv1, nil, {
					scale = 1
				})

				uv0.spine:setAnimation(0, PlayerAction.show, true)
				uv0.spine:setCascade(true)
				uv0.spine:setPosition(cc.p(uv2[3][1], uv2[3][2] + 256))
				uv0.spine:setAnchorPoint(cc.p(0.5, 0))
				uv0.boss_spine_node:addChild(uv0.spine)

				if uv0.first_init then
					uv0.spine:setOpacity(0)
					uv0.load_rolespine_bg:setOpacity(0)
				else
					uv0.spine:setOpacity(0)
					uv0.spine:runAction(cc.FadeIn:create(0.2))
				end
			end
		end)()
	else
		slot2()
	end

	slot0.first_init = true
end

function SandybeachBossFightMainWindow.updateBuyCount(slot0)
	if not slot0.data then
		return
	end

	slot1 = slot0.data.count or 0
	slot2 = 10

	if Config.HolidayBossData.data_const.fight_max_count then
		slot2 = slot3.val
	end

	slot0.buy_count:setString(uv0("%s/%s", slot1, slot2))

	if slot0.buy_max_count - slot0.data.buy_count <= 0 then
		slot5 = 0
	end

	slot0.today_count:setString(slot5 .. TI18N("次"))
end

function SandybeachBossFightMainWindow.close_callback(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)
	doStopAllActions(slot0.station_node)
	doStopAllActions(slot0.action_panel)

	if slot0.load_button_bg ~= nil then
		slot0.load_button_bg:DeleteMe()

		slot0.load_button_bg = nil
	end

	if slot0.head_icon ~= nil then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	if slot0.score_item ~= nil then
		slot0.score_item:DeleteMe()

		slot0.score_item = nil
	end

	if slot0.show_item_1 ~= nil then
		slot0.show_item_1:DeleteMe()

		slot0.show_item_1 = nil
	end

	if slot0.show_item_2 ~= nil then
		slot0.show_item_2:DeleteMe()

		slot0.show_item_2 = nil
	end

	if slot0.spine then
		slot0.spine:removeFromParent()

		slot0.spine = nil
	end

	uv0:openSandybeachBossFightMainWindow(false)
end
