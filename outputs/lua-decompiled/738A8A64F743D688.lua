MergeAimPanel = class("MergeAimPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()

function MergeAimPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.touch_buy_skin = true
	slot0.attr_list = {}

	slot0:configUI()
	slot0:register_event()

	slot0.charge_status = 0
	slot0.config = Config.HolidayMergeGoalData
	slot0._base_val = Config.HolidayMergeGoalData.data_const.base_max_score.val
end

function MergeAimPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/merge_aim_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.holiday_bg = slot0.main_container:getChildByName("bg")

	slot0:setHolidayBG()

	slot0.time_text_0 = slot0.main_container:getChildByName("time_text_0")

	slot0.time_text_0:setString(TI18N("剩余时间："))

	slot0.Image_1 = slot0.main_container:getChildByName("Image_1")
	slot0.process = slot0.main_container:getChildByName("process")

	slot0.process:setContentSize(cc.size(225, 17))

	slot0.text_process = slot0.main_container:getChildByName("text_process")

	slot0.text_process:setString("0/0")

	slot0.btn_reward = slot0.main_container:getChildByName("btn_reward")
	slot0.Text_9 = slot0.btn_reward:getChildByName("Text_9")

	slot0.Text_9:setString(TI18N("查看奖励"))

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")
	slot0.sprite_1 = slot0.main_container:getChildByName("sprite_1")
	slot0.Text_32 = slot0.main_container:getChildByName("Text_32")

	slot0.Text_32:setString(TI18N("合服活动期间，完成一项合服任务\n即可贡献10点合服积分，宝箱达到\n目标即可领取七档豪华奖励！"))

	slot0.Text_lev = slot0.main_container:getChildByName("Text_lev")

	slot0.Text_lev:setString(TI18N("0级"))

	slot0.box_btn = slot0.main_container:getChildByName("reward")

	slot0.main_container:getChildByName("Text_2"):setVisible(false)

	slot0.btn_buy = slot0.main_container:getChildByName("btn_buy")
	slot0.btn_buy_text = slot0.btn_buy:getChildByName("Text_4")

	slot0.btn_buy_text:setString(TI18N("使用礼包"))
	slot0.btn_buy:setVisible(false)

	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString("")
end

function MergeAimPanel.setHolidayBG(slot0)
	slot1 = "action_merge_goal"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.aim_title ~= "" and slot2.aim_title then
		slot1 = slot2.aim_title
	end

	if not slot0.bg_load then
		slot0.bg_load = loadSpriteTextureFromCDN(slot0.holiday_bg, PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, slot0.bg_load)
	end
end

function MergeAimPanel.setBaseData(slot0, slot1)
	if slot1 ~= nil then
		slot0.data = slot1

		commonCountDownTime(slot0.time_text, slot1.end_time)
		slot0:setData(slot1)
	end
end

function MergeAimPanel.getBoxNum(slot0)
	slot1 = 0

	return slot0.data.score < slot0.data.max_score and slot0.data.lev - 1 or slot0.data.lev
end

function MergeAimPanel.setBoxStatus(slot0)
	slot3 = {}
	slot4 = {}

	table.sort(deepCopy(slot0.data.reward), function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	for slot9 = 1, slot0:getBoxNum() do
		table.insert({}, {
			id = Config.HolidayMergeGoalData.data_score_award[slot9].id
		})
	end

	if #slot1 == 0 then
		for slot9 = 1, #slot2 do
			table.insert(slot3, {
				id = slot2[slot9].id
			})
		end
	else
		for slot9 = 1, #slot1 do
			for slot13 = 1, #slot2 do
				if slot1[slot9].id == slot2[slot13].id then
					table.insert(slot4, slot2[slot13])
				end
			end
		end
	end

	if #slot4 > 0 then
		for slot9, slot10 in ipairs(slot2) do
			for slot14, slot15 in ipairs(slot4) do
				if slot2[slot9].id == slot4[slot14].id then
					table.remove(slot2, slot9)
				end
			end
		end

		for slot9, slot10 in ipairs(slot2) do
			table.insert(slot3, slot10)
		end
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	if #slot3 == 0 then
		ActionController:getInstance():openMergeAimRewardPanel(true)
	else
		ActionController:getInstance():sender27301(slot3)
	end
end

function MergeAimPanel.register_event(slot0)
	if not slot0.merge_info_event then
		slot0.merge_info_event = GlobalEvent:getInstance():Bind(ActionEvent.Merge_Aim_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0:setBaseData(slot0)
		end)
	end

	if not slot0.merge_gain_box_event then
		slot0.merge_gain_box_event = GlobalEvent:getInstance():Bind(ActionEvent.Merge_Box_Status_Event, function (slot0)
			if not slot0 then
				return
			end

			message(slot0.msg)
		end)
	end

	registerButtonEventListener(slot0.btn_buy, function ()
		uv0:gift_Use()
	end, true, 2)
	registerButtonEventListener(slot0.btn_reward, function ()
		ActionController:getInstance():openMergeAimRewardPanel(true)
	end, true, 2)
	registerButtonEventListener(slot0.box_btn, function ()
		uv0:setBoxStatus()
	end, true, 2)

	if slot0.btn_rule then
		slot0.btn_rule:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				TipsManager:getInstance():showCommonTips(Config.HolidayMergeGoalData.data_const.game_rule.desc, slot0:getTouchBeganPosition())
			end
		end)
	end
end

function MergeAimPanel.gift_Use(slot0)
	if BackpackController:getInstance():getModel():getBackPackItemByBid(80240) then
		BackpackController:getInstance():openBatchUseItemView(true, slot1, ItemConsumeType.use)
	else
		message(TI18N("暂无可打开的礼包"))
	end
end

function MergeAimPanel.setData(slot0, slot1)
	slot0.text_process:setString(string.format("%s%s%s", slot1.score, "/", slot1.max_score))
	slot0.process:setContentSize(cc.size(450 * slot1.score / slot1.max_score, 17))
	slot0.Text_lev:setString(slot1.lev .. TI18N("级"))

	slot0.box_status = false

	if slot1.reward ~= nil and next(slot1.reward) ~= nil then
		if slot1.score / slot1.max_score < 1 then
			if slot1.lev == 1 then
				slot0.box_status = false
			elseif #slot1.reward == slot1.lev - 1 then
				slot0.box_status = false
			else
				slot0.box_status = true
			end
		elseif #slot1.reward == slot1.lev then
			slot0.box_status = false
		else
			slot0.box_status = true
		end
	elseif Config.HolidayMergeGoalData.data_score_award[1].id < slot1.lev then
		slot0.box_status = true
	elseif slot1.score / slot1.max_score < 1 then
		slot0.box_status = false
	else
		slot0.box_status = true
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if slot0.box_status == true then
		if not tolua.isnull(slot0.box_btn) and slot0.box_effect == nil then
			slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(20, 22), cc.p(0, 0), true, PlayerAction.action_2)

			slot0.box_btn:addChild(slot0.box_effect)
		end
	elseif not tolua.isnull(slot0.box_btn) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(20, 22), cc.p(0, 0), true, PlayerAction.action_1)

		slot0.box_btn:addChild(slot0.box_effect)
	end
end

function MergeAimPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():sender27300()
	end
end

function MergeAimPanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	if slot0.merge_info_event then
		GlobalEvent:getInstance():UnBind(slot0.merge_info_event)

		slot0.merge_info_event = nil
	end

	if slot0.merge_gain_box_event then
		GlobalEvent:getInstance():UnBind(slot0.merge_gain_box_event)

		slot0.merge_gain_box_event = nil
	end
end
