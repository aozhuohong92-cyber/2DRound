GodBattleRewardsPanel = GodBattleRewardsPanel or BaseClass()

function GodBattleRewardsPanel.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function GodBattleRewardsPanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("godbattle/godbattle_rewards_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.root_wnd:getChildByName("kill_num_label"):setString(TI18N("今日击败玩家:"))
	slot0.root_wnd:getChildByName("challenge_num_label"):setString(TI18N("今日挑战次数:"))

	slot0.list_view = slot0.root_wnd:getChildByName("list_view")
	slot0.kill_num = slot0.root_wnd:getChildByName("kill_num")
	slot0.challenge_num = slot0.root_wnd:getChildByName("challenge_num")
	slot0.item = slot0.root_wnd:getChildByName("item")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.list_view, nil, , , slot0.list_view:getContentSize(), {
		start_y = 3,
		item_width = 616,
		start_x = 3,
		space_x = 0,
		row = 0,
		item_height = 134,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = GodBattleRewardsItem
	})
end

function GodBattleRewardsPanel.registerEvent(slot0)
	if slot0.update_reward_event == nil then
		slot0.update_reward_event = GlobalEvent:getInstance():Bind(GodbattleEvent.UpdateCombatAwards, function (slot0, slot1)
			if uv0.list == nil then
				return
			end

			for slot5, slot6 in pairs(uv0.list) do
				if slot6.type == slot0 and slot6.num == slot1 then
					slot6.status = 3
				end
			end

			uv0.scroll_view:resetAddPosition(uv0.list, SortTools.tableLowerSorter({
				"status",
				"num"
			}))
		end)
	end
end

function GodBattleRewardsPanel.addToParent(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	slot2 = GodbattleController:getInstance():getModel()
	slot3 = slot2:getSelfInfo()

	if slot1 == true and slot3 and slot2:getRewardInfo() then
		slot0.kill_num:setString(slot3.win)
		slot0.challenge_num:setString(slot3.cnum)

		slot5 = {}
		slot9 = slot3.group

		for slot9, slot10 in pairs(Config.ZsWarData.data_num_rewards[slot9]) do
			slot11 = deepCopy(slot10)
			slot11.status = 2

			if slot11.type == 1 then
				if slot4.win_list[slot11.num] then
					slot11.status = 3
				elseif slot11.num <= slot3.win then
					slot11.status = 1
				end
			elseif slot4.cnum_list[slot11.num] then
				slot11.status = 3
			elseif slot11.num <= slot3.cnum then
				slot11.status = 1
			end

			table.insert(slot5, slot11)
		end

		table.sort(slot5, SortTools.tableLowerSorter({
			"status",
			"num"
		}))
		slot0.scroll_view:setData(slot5, nil, , slot0.item)

		slot0.list = slot5
	end
end

function GodBattleRewardsPanel.__delete(slot0)
	if slot0.update_reward_event then
		GlobalEvent:getInstance():UnBind(slot0.update_reward_event)

		slot0.update_reward_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()
	end

	slot0.scroll_view = nil
end

GodBattleRewardsItem = class("GodBattleRewardsItem", function ()
	return ccui.Layout:create()
end)

function GodBattleRewardsItem.ctor(slot0)
end

function GodBattleRewardsItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)

		slot0.finish_img = slot0.root_wnd:getChildByName("finish_img")
		slot0.get_btn = slot0.root_wnd:getChildByName("get_btn")
		slot0.get_btn_label = slot0.get_btn:getChildByName("label")

		slot0.get_btn_label:setString(TI18N("未达成"))
		slot0.get_btn:setTouchEnabled(false)

		slot0.item = BackPackItem.new(false, true, false, 0.9, false, true)

		slot0.item:setPosition(64, 68)
		slot0.root_wnd:addChild(slot0.item)

		slot0.desc = createRichLabel(24, 175, cc.p(0, 0.5), cc.p(124, 64))

		slot0.root_wnd:addChild(slot0.desc)
		slot0.desc:setString(TI18N("今日挑战3次"))
		slot0:registerEvent()
	end
end

function GodBattleRewardsItem.registerEvent(slot0)
	slot0.get_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				GodbattleController:getInstance():requestGetCombatReward(uv0.data.type, uv0.data.num)
			end
		end
	end)
end

function GodBattleRewardsItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.item:setBaseData(slot1.items[1][1], slot1.items[1][2])

		if slot1.status == 3 then
			slot0.get_btn_label:setString(TI18N("已领取"))
			slot0.get_btn:setTouchEnabled(false)
			slot0.get_btn_label:disableEffect()
			setChildUnEnabled(true, slot0.get_btn)
		elseif slot1.status == 1 then
			slot0.get_btn:setTouchEnabled(true)
			setChildUnEnabled(false, slot0.get_btn)
			slot0.get_btn_label:setString(TI18N("领取"))
		else
			slot0.get_btn_label:setString(TI18N("未达成"))
			slot0.get_btn_label:disableEffect()
			slot0.get_btn:setTouchEnabled(false)
			setChildUnEnabled(true, slot0.get_btn)
		end

		if slot1.type == 1 then
			slot0.desc:setString(string.format(TI18N("今日胜利%s次"), slot1.num))
		else
			slot0.desc:setString(string.format(TI18N("今日挑战%s次"), slot1.num))
		end
	end
end

function GodBattleRewardsItem.suspendAllActions(slot0)
end

function GodBattleRewardsItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
