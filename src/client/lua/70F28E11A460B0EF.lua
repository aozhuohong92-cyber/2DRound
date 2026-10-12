MergeserverLookWindow = MergeserverLookWindow or BaseClass(BaseView)
slot1 = MergeserverController:getInstance():getModel()
slot2 = string.format
slot3 = RoleController:getInstance():getRoleVo()

function MergeserverLookWindow.__init(slot0)
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "mergeserverinfo/merge_server_look_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mergeserver", "mergeserver"),
			type = ResourcesType.plist
		}
	}
	slot1 = Config.MergeVotingData.data_const
	slot0.rule = slot1.merge_rule_text.desc
	slot0.reward_label = slot1.merge_welfare_text.desc
	slot0.reward_data = slot1.merge_reward.val
	slot0.merge_welfare_title = slot1.merge_welfare_title.desc
	slot0.merge_reward_title = slot1.merge_reward_title.desc
	slot0.merge_introductions_text = slot1.merge_introductions_text.desc
	slot0.lev_limit = slot1.level_limit.val
	slot0.openday_limit = slot1.role_time_limit.val
	slot0.can_touch = true
end

function MergeserverLookWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:handleEffect(true)
	slot0:playEnterAnimatianByObj(slot0.main_container, 1)

	slot0.tips = slot0.main_container:getChildByName("tips")
	slot0.reward_panel = slot0.main_container:getChildByName("reward_panel")
	slot0.bottom_panel_1 = slot0.main_container:getChildByName("bottom_panel_1")
	slot0.check_panel = slot0.bottom_panel_1:getChildByName("check_panel")
	slot0.checkbox_agree = slot0.check_panel:getChildByName("checkbox_agree")
	slot0.txt_agree = slot0.checkbox_agree:getChildByName("txt_agree")

	slot0.txt_agree:setString(TI18N("我支持尽快合服"))

	slot0.checkbox_disagree = slot0.check_panel:getChildByName("checkbox_disagree")
	slot0.txt_disagree = slot0.checkbox_disagree:getChildByName("txt_disagree")

	slot0.txt_disagree:setString(TI18N("暂不支持这么快合服"))
	slot0.checkbox_agree:setSelected(true)
	slot0.checkbox_disagree:setSelected(false)

	slot0.btn_vote = slot0.bottom_panel_1:getChildByName("btn_vote")
	slot0.txt_vote = slot0.btn_vote:getChildByName("txt_vote")

	slot0.txt_vote:setString(TI18N("我要投票"))

	slot0.txt_already_vote = slot0.bottom_panel_1:getChildByName("txt_already_vote")
	slot0.txt_sur = slot0.bottom_panel_1:getChildByName("text_sur")

	slot0.txt_sur:setString(TI18N("本次投票仅有1次投票机会，距投票结束还有"))

	slot0.time_label = slot0.bottom_panel_1:getChildByName("time_label")

	slot0.time_label:setAnchorPoint(0, 0.5)
	slot0.time_label:setString("00:00:00")
	slot0.time_label:setPositionX(495)
	slot0:setBtnVisible(true)

	slot0.bottom_panel_2 = slot0.main_container:getChildByName("bottom_panel_2")

	slot0.bottom_panel_1:setVisible(false)
	slot0.bottom_panel_2:setVisible(false)

	slot0.Image_1 = slot0.bottom_panel_2:getChildByName("Image_1")
	slot0.win_title_2 = slot0.Image_1:getChildByName("win_title_2")

	slot0.win_title_2:setString(TI18N("投票结果"))

	slot0.txt_agree_title = slot0.bottom_panel_2:getChildByName("txt_agree_title")

	slot0.txt_agree_title:setString(TI18N("支持合服    "))

	slot0.rate_agree = slot0.bottom_panel_2:getChildByName("rate_agree")
	slot0.txt_agree_num = slot0.bottom_panel_2:getChildByName("txt_agree_num")
	slot0.txt_disagree_title = slot0.bottom_panel_2:getChildByName("txt_disagree_title")

	slot0.txt_disagree_title:setString(TI18N("暂不支持合服"))

	slot0.rate_disagree = slot0.bottom_panel_2:getChildByName("rate_disagree")
	slot0.txt_disagree_num = slot0.bottom_panel_2:getChildByName("txt_disagree_num")
	slot0.txt_result = slot0.bottom_panel_2:getChildByName("txt_result")

	slot0.txt_result:setString(TI18N("本次合服投票本服意愿度为"))

	slot0.rate = slot0.bottom_panel_2:getChildByName("rate")

	slot0.rate:setString("00%，")

	slot0.txt_result_0 = slot0.bottom_panel_2:getChildByName("txt_result_0")

	slot0.txt_result_0:setString(TI18N("感谢您的参与"))

	slot0.my_vote = slot0.bottom_panel_2:getChildByName("my_vote")

	slot0.my_vote:setString(TI18N("我的投选"))

	slot0.my_vote_agree_item = slot0.my_vote:getChildByName("my_vote_agree_item")
	slot0.my_rate_agree = slot0.my_vote_agree_item:getChildByName("my_rate_agree")
	slot0.txt_agree_title_1 = slot0.my_vote_agree_item:getChildByName("txt_agree_title_1")

	slot0.txt_agree_title_1:setString(TI18N("支持合服"))

	slot0.my_vote_disagree_item = slot0.my_vote:getChildByName("my_vote_disagree_item")
	slot0.my_rate_disagree = slot0.my_vote_disagree_item:getChildByName("my_rate_disagree")
	slot0.txt_disagree_title_1 = slot0.my_vote_disagree_item:getChildByName("txt_disagree_title_1")

	slot0.txt_disagree_title_1:setString(TI18N("暂不支持合服"))
	slot0.my_vote_disagree_item:setVisible(false)

	slot0.miss_vote = slot0.bottom_panel_2:getChildByName("txt_didnt_vote")

	slot0.miss_vote:setString(TI18N("您未参与本次投票"))
	slot0.miss_vote:setVisible(false)

	slot0.reward_bg_1 = slot0.main_container:getChildByName("reward_bg_1")
	slot0.txt_reward_1 = slot0.reward_bg_1:getChildByName("txt_reward_1")

	slot0.txt_reward_1:setString(slot0.merge_reward_title)

	slot0.reward_bg_2 = slot0.main_container:getChildByName("reward_bg_2")
	slot0.txt_reward_2 = slot0.reward_bg_2:getChildByName("txt_reward_2")

	slot0.txt_reward_2:setString(slot0.merge_welfare_title)

	slot0.win_title = slot0.main_container:getChildByName("win_title")

	slot0.win_title:setString(TI18N("合服意向调查"))

	slot0.close_btn = slot0.main_container:getChildByName("close_btn")
	slot0.title_content_scroll = slot0.main_container:getChildByName("txt_title_content")
	slot0.title_content_scroll_1 = slot0.main_container:getChildByName("txt_title_content_1")

	slot0.title_content_scroll_1:setVisible(false)
	slot0.title_content_scroll:setScrollBarEnabled(false)

	slot0.title_content_scroll_size = slot0.title_content_scroll:getContentSize()
	slot0.desc_label = createRichLabel(20, cc.c4b(54, 114, 151, 255), cc.p(0, 1), cc.p(0, 90), 8, nil, 550)

	slot0.desc_label:setString(slot0.merge_introductions_text)
	slot0.title_content_scroll:addChild(slot0.desc_label)
	slot0.title_content_scroll:setInnerContainerSize(cc.size(slot0.title_content_scroll_size.width, 90))

	slot0.reward_scroll = slot0.main_container:getChildByName("reward_scroll")
	slot1 = slot0.reward_scroll:getContentSize()
	slot2 = {
		scale = 0.7,
		space_x = 15,
		is_center = false,
		max_count = 4
	}
	slot3 = {}

	if slot0.reward_data then
		for slot7, slot8 in pairs(slot0.reward_data) do
			table.insert(slot3, {
				slot8[1],
				slot8[2]
			})
		end
	end

	slot0.reward_scrollview = createScrollView(slot1.width, slot1.height, 0, 0, slot0.reward_scroll, ScrollViewDir.horizontal)
	slot0.scroll_list = commonShowSingleRowItemList(slot0.reward_scrollview, slot0.scroll_list, slot3, slot2)
	slot0.reward_content_scroll_1 = slot0.main_container:getChildByName("reward_content_1")

	slot0.reward_content_scroll_1:setVisible(false)

	slot0.reward_content_scroll = slot0.main_container:getChildByName("reward_content")

	slot0.reward_content_scroll:setScrollBarEnabled(false)

	slot0.scroll_size = slot0.reward_content_scroll:getContentSize()

	slot0.reward_content_scroll:setInnerContainerSize(cc.size(slot0.scroll_size.width, 170))

	slot0.reward_label_2 = createRichLabel(20, cc.c4b(54, 114, 151, 255), cc.p(0, 1), cc.p(40, 170), 8, nil, 380)

	slot0.reward_label_2:setString(slot0.reward_label)
	slot0.reward_content_scroll:addChild(slot0.reward_label_2)
end

function MergeserverLookWindow.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openMergeWindow(false)
	end, true, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openMergeWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.tips, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(uv0.rule, slot1:getTouchBeganPosition())
	end, true, 2)
	registerButtonEventListener(slot0.btn_vote, function ()
		uv0.can_touch = false

		if uv0.checkbox_agree:isSelected() == true then
			uv0.CheckboxStatus = 1

			uv0:setCheckboxGray(true)
		else
			uv0.CheckboxStatus = 0

			uv0:setCheckboxGray(false)
		end

		uv1:sender10993(uv0.CheckboxStatus)
		uv0:setBtnVisible(false)
	end, true, 2)
	slot0.checkbox_agree:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			if uv0.checkbox_disagree:isSelected() == true then
				uv0.checkbox_disagree:setSelected(false)
			end

			if uv0.can_touch == false then
				uv0.checkbox_agree:setSelected(false)
				uv0.checkbox_disagree:setSelected(true)
			end
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0.can_touch == false then
				uv0.checkbox_agree:setSelected(true)
				uv0.checkbox_disagree:setSelected(false)
			end
		end
	end)
	slot0.checkbox_disagree:addEventListener(function (slot0, slot1)
		if slot1 == ccui.CheckBoxEventType.selected then
			playButtonSound2()

			if uv0.checkbox_agree:isSelected() == true then
				uv0.checkbox_agree:setSelected(false)
			end

			if uv0.can_touch == false then
				uv0.checkbox_disagree:setSelected(false)
				uv0.checkbox_agree:setSelected(true)
			end
		elseif slot1 == ccui.CheckBoxEventType.unselected then
			playButtonSound2()

			if uv0.can_touch == false then
				uv0.checkbox_disagree:setSelected(true)
				uv0.checkbox_agree:setSelected(false)
			end
		end
	end)
	slot0:addGlobalEvent(MergeserverEvent.Update_Main_Mergeserver_Event, function (slot0)
		if slot0 and next(slot0) ~= nil then
			if slot0.status == 2 then
				uv0:sender10992()
			end

			uv1:setData(slot0)
		end
	end)
	slot0:addGlobalEvent(MergeserverEvent.Update_Merge_MsgResult_Event, function (slot0)
		if slot0 and next(slot0) ~= nil then
			uv0:setResultData(slot0)
		end
	end)
end

function MergeserverLookWindow.setBtnVisible(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.btn_vote:setVisible(slot1)
	slot0.txt_already_vote:setVisible(not slot1)
end

function MergeserverLookWindow.handleEffect(slot0, slot1)
	if slot1 == false then
		if slot0.play_effect and slot0.play_effect_1 then
			slot0.play_effect:clearTracks()
			slot0.play_effect:removeFromParent()

			slot0.play_effect = nil

			slot0.play_effect_1:clearTracks()
			slot0.play_effect_1:removeFromParent()

			slot0.play_effect_1 = nil
		end
	elseif not tolua.isnull(slot0.main_container) and slot0.play_effect == nil and slot0.play_effect_1 == nil then
		slot0.play_effect = createEffectSpine(PathTool.getEffectRes(207), cc.p(-50, -70), cc.p(0.5, 0.5), false, PlayerAction.action_1)
		slot0.play_effect_1 = createEffectSpine(PathTool.getEffectRes(206), cc.p(-50, -70), cc.p(0.5, 0.5), false, PlayerAction.action_1)

		slot0.main_container:addChild(slot0.play_effect, -1)
		slot0.main_container:addChild(slot0.play_effect_1, 1)
	end
end

function MergeserverLookWindow.openRootWnd(slot0)
	uv0:sender10991()
	slot0:setCheckboxGray(uv1:getVotingStatus())

	slot0.is_success = uv1:getVotingStatus()

	if slot0.is_success == 1 then
		slot0:setBtnVisible(false)
	else
		slot0:setBtnVisible(true)
	end
end

function MergeserverLookWindow.setResultData(slot0, slot1)
	slot0.result_data = slot1

	slot0.bottom_panel_2:setVisible(true)
	slot0.bottom_panel_1:setVisible(false)

	slot2 = (slot1.agreepoints - slot1.disagreepoints) / (slot1.agreepoints + slot1.disagreepoints)
	slot2 = slot2 * 1000 - math.floor(slot2 * 1000) + 0.5 >= 1 and math.ceil(slot2 * 1000) / 1000 or math.floor(slot2 * 1000) / 1000

	slot0.txt_agree_num:setString(uv0("%s%%", slot2 * 100))
	slot0.txt_disagree_num:setString(uv0("%s%%", (1 - slot2) * 100))
	slot0.rate_agree:setContentSize(cc.size(slot2 * 220, 17))
	slot0.rate_disagree:setContentSize(cc.size((1 - slot2) * 220, 17))
	slot0.rate:setString(uv0("%s%%%s", slot2 * 100, "，"))

	if slot1.flag == 0 then
		slot0.bottom_panel_1:setVisible(false)
		slot0.bottom_panel_2:setVisible(false)
	end

	if slot1.agreepoints == 0 and slot1.disagreepoints == 0 then
		slot0.rate_agree:setVisible(false)
		slot0.rate_disagree:setVisible(false)
		slot0.rate:setString("0 %")
	end

	if slot1.agreepoints - slot1.disagreepoints < 0 then
		slot0.txt_agree_num:setString("0 %")
		slot0.txt_disagree_num:setString("100%")
		slot0.rate_agree:setContentSize(cc.size(0, 17))
		slot0.rate_disagree:setContentSize(cc.size(220, 17))
		slot0.rate:setString("0 %")
	end
end

function MergeserverLookWindow.setData(slot0, slot1)
	slot0.data = slot1

	if slot0.data.status == 1 then
		slot0.bottom_panel_1:setVisible(true)
		slot0.bottom_panel_2:setVisible(false)
		slot0.time_label:setAnchorPoint(0, 0.5)
		slot0.time_label:setPositionX(450)
		commonCountDownTime(slot0.time_label, slot0.data.last_time)

		if slot0.data.is_vote == 1 then
			slot0.can_touch = false
			slot2 = true

			slot0:setCheckboxGray(slot0.data.flag == 1 and true or false)
			slot0:setBtnVisible(false)
		else
			slot0:setBtnVisible(true)
		end
	elseif slot0.data.status == 2 then
		slot0.bottom_panel_1:setVisible(false)
		slot0.bottom_panel_2:setVisible(true)
		uv0:setMainuiAction(false)

		if slot0.data.is_vote == 1 then
			if slot0.data.flag == 1 then
				slot0.my_vote_agree_item:setVisible(true)
				slot0.my_vote_disagree_item:setVisible(false)
				slot0.miss_vote:setVisible(false)
			else
				slot0.my_vote_agree_item:setVisible(false)
				slot0.my_vote_disagree_item:setVisible(true)
				slot0.miss_vote:setVisible(false)
			end
		else
			slot0.my_vote:setVisible(false)
			slot0.miss_vote:setVisible(true)
		end
	end
end

function MergeserverLookWindow.setCheckboxGray(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.checkbox_agree:setSelected(slot1)
	slot0.checkbox_disagree:setSelected(not slot1)
	slot0.checkbox_agree:setOpacity(178)
	slot0.checkbox_disagree:setOpacity(178)
end

function MergeserverLookWindow.close_callback(slot0)
	slot0:handleEffect(false)
	uv0:openMergeWindow(false)
end
