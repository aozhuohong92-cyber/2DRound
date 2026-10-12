GuildBossBoxRewardWindow = GuildBossBoxRewardWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()

function GuildBossBoxRewardWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Mini
	slot0.is_full_screen = false
	slot0.layout_name = "guildboss/guildboss_box_reward_window"
	slot0.is_wait_close = false
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildboss", "guildboss"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg", "guildboss/guildboss_1"),
			type = ResourcesType.single
		}
	}
end

function GuildBossBoxRewardWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot2, 2)
	slot2:getChildByName("win_title"):setString(TI18N("击杀宝箱"))
	slot2:getChildByName("reward_notice"):setString(TI18N("宝箱随机开出以下奖励中的一种"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.chapter_name = slot2:getChildByName("chapter_name")
	slot0.box_sum = slot2:getChildByName("box_sum")

	slot0.box_sum:setString(string.format(TI18N("拥有宝箱：%s"), 0))

	slot0.model = slot2:getChildByName("model")
	slot0.scroll_view = slot2:getChildByName("scroll_view")
	slot0.item_scroll = CommonScrollViewLayout.new(slot0.scroll_view, nil, ScrollViewDir.horizontal, nil, slot0.scroll_view:getContentSize(), {
		start_y = -4,
		item_width = 119,
		start_x = -10,
		space_x = -16,
		row = 1,
		item_height = 119,
		space_y = 0,
		col = 1,
		item_class = BackPackItem
	})
	slot0.box_tips = slot2:getChildByName("box_tips")

	slot0.box_tips:setString(TI18N("点击宝箱打开获得奖励"))

	slot0.no_box_tips = slot2:getChildByName("no_box_tips")

	slot0.no_box_tips:setString(TI18N("抱歉，当前无任何宝箱\n快去击杀BOSS，获得宝箱吧"))
end

function GuildBossBoxRewardWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildBossBoxRewardWindow(false)
		end
	end)

	if slot0.update_box_status_event == nil then
		slot0.update_box_status_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateBoxRewardsStatus, function (slot0)
			uv0:updateBoxStatus()
		end)
	end

	slot0.model:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.is_wait_close and not tolua.isnull(uv0.box_effect) and uv0.show_fid then
				uv0.is_wait_close = true

				uv0.box_effect:setAnimation(0, PlayerAction.action_3, false)
			end
		end
	end)

	if slot0.close_item_extend_window == nil then
		slot0.close_item_extend_window = GlobalEvent:getInstance():Bind(EventId.CAN_OPEN_LEVUPGRADE, function ()
			if uv0.is_wait_close == true then
				uv0.is_wait_close = false

				uv0:changeBoxStatus(uv0.wait_change_sum)

				uv0.wait_change_sum = nil
			end
		end)
	end
end

function GuildBossBoxRewardWindow.openRootWnd(slot0)
	slot0:updateBoxStatus()
end

function GuildBossBoxRewardWindow.updateBoxStatus(slot0)
	slot3 = 0

	for slot7, slot8 in ipairs(uv0:getBoxRewardList()) do
		if slot8 and slot8 > 0 then
			if 0 == 0 then
				slot2 = slot7
			end

			slot3 = slot3 + slot8
		end
	end

	slot0.box_sum:setString(string.format(TI18N("拥有宝箱：%s"), slot3))
	slot0.no_box_tips:setVisible(slot2 == 0)
	slot0.box_tips:setVisible(slot2 ~= 0)

	if slot2 == 0 and uv0:getBaseInfo() ~= nil then
		slot2 = slot4.fid
	end

	if slot2 == 0 then
		return
	end

	if slot2 ~= slot0.show_fid then
		slot0.show_fid = slot2

		if Config.GuildDunData.data_chapter_reward[slot2] then
			slot0.chapter_name:setString(slot4.chapter_name .. " " .. slot4.chapter_desc)
		end

		if Config.GuildDunData.data_chapter_box[slot2] then
			for slot10, slot11 in ipairs(slot5.cli_award_list) do
				-- Nothing
			end

			slot0.item_scroll:setData({
				[slot10] = {
					bid = slot11[1],
					quantity = slot11[2]
				}
			}, nil, , {
				scale = 0.8
			})
		end
	end

	if not slot0.is_wait_close then
		slot0:changeBoxStatus(slot3)
	else
		slot0.wait_change_sum = slot3
	end
end

function GuildBossBoxRewardWindow.changeBoxStatus(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot1 == 0 then
		slot0.model:setTouchEnabled(false)
		slot0:handleEffect(true, PlayerAction.action_1)
	else
		slot0.model:setTouchEnabled(true)
		slot0:handleEffect(true, PlayerAction.action_2)
	end
end

function GuildBossBoxRewardWindow.handleEffect(slot0, slot1, slot2)
	if slot1 == false then
		if slot0.box_effect then
			slot0.box_effect:removeFromParent()

			slot0.box_effect = nil
		end
	elseif slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(PathTool.getEffectRes(144), cc.p(120, 40), cc.p(0, 0), true, slot2)

		slot0.model:addChild(slot0.box_effect, 1)
		slot0.box_effect:registerSpineEventHandler(function (slot0)
			if slot0.animation == PlayerAction.action_3 and uv0.show_fid then
				uv1:requestGetChapterBox(uv0.show_fid)
			end
		end, sp.EventType.ANIMATION_COMPLETE)
	else
		slot0.box_effect:setAnimation(0, slot2, true)
	end
end

function GuildBossBoxRewardWindow.close_callback(slot0)
	if slot0.close_item_extend_window then
		GlobalEvent:getInstance():UnBind(slot0.close_item_extend_window)

		slot0.close_item_extend_window = nil
	end

	slot0:handleEffect(false)

	if slot0.update_box_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_box_status_event)

		slot0.update_box_status_event = nil
	end

	if slot0.item_scroll then
		slot0.item_scroll:DeleteMe()

		slot0.item_scroll = nil
	end

	uv0:openGuildBossBoxRewardWindow(false)
end
