ActionSandybeachBossFightPanel = class("ActionSandybeachBossFightPanel", function ()
	return ccui.Widget:create()
end)
slot0 = Config.HolidayBossData.data_const

function ActionSandybeachBossFightPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionSandybeachBossFightPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("acitonsandybeachbossfight/action_sandybeach_boss_fight_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.title_img = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_img")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "txt_cn_sandybeach_1"), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.item_scrollview = slot1:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	if uv0.action_pre_reward and not slot0.item_list then
		slot0.item_list = commonShowSingleRowItemList(slot0.item_scrollview, slot0.item_list, slot2.val, {
			scale = 0.9,
			max_count = 5,
			is_center = true,
			show_effect_id = 263
		})
	end

	slot0.time_title = slot1:getChildByName("time_title")

	slot0.time_title:setString(TI18N("活动时间:"))

	slot0.time_val = slot1:getChildByName("time_val")

	slot0.time_val:setString("")

	if uv0.action_time then
		slot0.time_val:setString(slot3.desc)
	end

	slot1:getChildByName("Text_1"):setString(TI18N("试炼彩星:"))
	slot1:getChildByName("Text_2"):setString(TI18N("全服排名:"))
	slot1:getChildByName("Text_3"):setString(TI18N("通关层数:"))
	slot1:getChildByName("item_count_0"):setString(TI18N("剩余次数："))

	slot0.fight_score_1 = slot1:getChildByName("fight_score_1")
	slot0.fight_score_2 = slot1:getChildByName("fight_score_2")
	slot0.fight_score_3 = slot1:getChildByName("fight_score_3")
	slot0.item_count = slot1:getChildByName("item_count")

	slot0.item_count:setString("")

	slot0.comfirm_btn = slot1:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("前往挑战"))

	slot0.reward_btn = slot1:getChildByName("reward_btn")
	slot0.reward_label = slot0.reward_btn:getChildByName("label")

	slot0.reward_label:setString(TI18N("奖励详情"))
	ActionController:getInstance():sender25400()
end

function ActionSandybeachBossFightPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.Aandybeach_Boss_Fight_Action_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:setData(slot0)
		end)
	end

	if not slot0.updata_buy_count_event then
		slot0.updata_buy_count_event = GlobalEvent:getInstance():Bind(ActionEvent.Aandybeach_Boss_Fight_Buy_Count_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:setRemainCount(slot0.count)
		end)
	end

	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2)
	registerButtonEventListener(slot0.reward_btn, function ()
		uv0:onRewardBtn()
	end, true, 2)
end

function ActionSandybeachBossFightPanel.onComfirmBtn(slot0)
	MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.SandybeachBossFight)
end

function ActionSandybeachBossFightPanel.onRewardBtn(slot0)
	RankController:getInstance():openSingleRankMainWindow(true, {
		rank_type = RankConstant.RankType.sandybeach_boss_fight,
		title_name = TI18N("排行榜"),
		background_path = PathTool.getPlistImgForDownLoad("bigbg/sandybeachbossfight", "sandybeach_1"),
		show_tips = TI18N("奖励将在活动结束后通过邮件发放")
	}, RankConstant.Rank_Type.Award)
end

function ActionSandybeachBossFightPanel.setData(slot0, slot1)
	slot0.fight_score_1:setString(slot1.score)
	slot0.fight_score_2:setString(slot1.rank)
	slot0.fight_score_3:setString(slot1.order)
	slot0:setRemainCount(slot1.count)
end

function ActionSandybeachBossFightPanel.setRemainCount(slot0, slot1)
	if slot0.item_count then
		slot2 = 10

		if uv0.fight_max_count then
			slot2 = slot3.val
		end

		slot0.item_count:setString(string.format(TI18N("%s/%s"), slot1, slot2))
	end
end

function ActionSandybeachBossFightPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionSandybeachBossFightPanel.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.update_action_even_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)

		slot0.update_action_even_event = nil
	end

	if slot0.updata_buy_count_event then
		GlobalEvent:getInstance():UnBind(slot0.updata_buy_count_event)

		slot0.updata_buy_count_event = nil
	end
end
