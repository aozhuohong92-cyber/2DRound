GuildBossPassRewardWindow = GuildBossPassRewardWindow or BaseClass(BaseView)
slot0 = GuildbossController:getInstance()
slot1 = GuildbossController:getInstance():getModel()

function GuildBossPassRewardWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.title_str = TI18N("首通奖励")
	slot0.is_full_screen = false
end

function GuildBossPassRewardWindow.open_callback(slot0)
	slot0.main_view = createImage(slot0.container, PathTool.getResFrame("common", "common_1034"), 18, 15, cc.p(0, 0), true, 1, true)

	slot0.main_view:setContentSize(cc.size(608, 775))
end

function GuildBossPassRewardWindow.register_event(slot0)
	if slot0.update_first_pass_event == nil then
		slot0.update_first_pass_event = GlobalEvent:getInstance():Bind(GuildbossEvent.UpdateFirstPassReward, function ()
			if uv1.scroll_view then
				uv1.scroll_view:setData(uv0:getFirstPassRewardList())
			end
		end)
	end
end

function GuildBossPassRewardWindow.openRootWnd(slot0)
	if slot0.scroll_view == nil then
		slot0.scroll_view = CommonScrollViewLayout.new(slot0.main_view, nil, nil, nil, slot0.main_view:getContentSize(), {
			start_y = 4,
			item_width = 600,
			start_x = 4,
			space_x = 4,
			row = 0,
			item_height = 135,
			space_y = -3,
			col = 1,
			need_dynamic = true,
			item_class = GuildBossPassRewardItem
		})

		if slot0.scroll_view then
			slot0.scroll_view:setData(uv0:getFirstPassRewardList())
		end
	end
end

function GuildBossPassRewardWindow.close_callback(slot0)
	if slot0.update_first_pass_event then
		GlobalEvent:getInstance():UnBind(slot0.update_first_pass_event)

		slot0.update_first_pass_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end

	uv0:openGuildBossPassRewardWindow(false)
end

GuildBossPassRewardItem = class("GuildBossPassRewardItem", function ()
	return ccui.Layout:create()
end)

function GuildBossPassRewardItem.ctor(slot0)
	slot0.item_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guildboss/guildboss_pass_reward_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.chatpter_value = slot1:getChildByName("chatpter_value")
	slot0.chatpter_desc = slot1:getChildByName("chatpter_desc")
	slot0.btn_container = slot1:getChildByName("btn_container")
	slot0._redPoint = slot0.btn_container:getChildByName("redPoint")
	slot0.reward_btn = slot0.btn_container:getChildByName("reward_btn")
	slot0.reward_btn_label = slot0.reward_btn:getChildByName("label")

	slot0.reward_btn_label:setString(TI18N("领取"))

	slot0.pass_reward = slot1:getChildByName("pass_reward")
	slot0.container = slot1

	slot0:registerEvent()
end

function GuildBossPassRewardItem.registerEvent(slot0)
	slot0.reward_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:send21321(uv1.data.fid)
		end
	end)
end

function GuildBossPassRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	slot0:firstReward()
end

slot2 = Config.GuildDunData.data_chapter_reward

function GuildBossPassRewardItem.firstReward(slot0)
	slot1 = 0.8

	if #uv0[slot0.data.fid].reward_list >= 3 then
		slot2 = 3
	end

	for slot6 = 1, slot2 do
		if not slot0.item_list[slot6] then
			slot7 = BackPackItem.new(false, true, false, slot1, false)

			slot7:setAnchorPoint(0, 0.5)
			slot7:setSwallowTouches(false)
			slot0.container:addChild(slot7)

			slot0.item_list[slot6] = slot7
		end

		item = slot0.item_list[slot6]

		if item then
			item:setPosition(140 + (slot6 - 1) * (BackPackItem.Width * slot1 + 5), 67)
			item:setBaseData(uv0[slot0.data.fid].reward_list[slot6][1], uv0[slot0.data.fid].reward_list[slot6][2])
			item:setDefaultTip()
		end
	end

	if slot0.data.status == 0 then
		slot0.reward_btn_label:setString(TI18N("未达成"))
		setChildUnEnabled(true, slot0.reward_btn)
		slot0.reward_btn:setVisible(true)
		slot0.reward_btn:setTouchEnabled(false)
		slot0._redPoint:setVisible(false)
		slot0.pass_reward:setVisible(false)
		slot0.reward_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	elseif slot0.data.status == 1 then
		slot0.reward_btn_label:setString(TI18N("领取"))
		setChildUnEnabled(false, slot0.reward_btn)
		slot0.reward_btn:setVisible(true)
		slot0.reward_btn:setTouchEnabled(true)
		slot0._redPoint:setVisible(true)
		slot0.pass_reward:setVisible(false)
	elseif slot0.data.status == 2 then
		slot0.reward_btn:setVisible(false)
		slot0._redPoint:setVisible(false)
		slot0.pass_reward:setVisible(true)
	end

	slot0.chatpter_value:setString(uv0[slot0.data.fid].chapter_name)
	slot0.chatpter_desc:setString(uv0[slot0.data.fid].chapter_desc)
end

function GuildBossPassRewardItem.DeleteMe(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	slot0:removeAllChildren()
end
