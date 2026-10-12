ActionActivityNoticePanel = class("ActionActivityNoticePanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = ActionController:getInstance():getModel()
slot2 = string.format

function ActionActivityNoticePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.sur_time = 0
end

function ActionActivityNoticePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_activity_notice_panel"))

	slot0.root_wnd:setPosition(-40, -80)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.background = slot0.root_wnd:getChildByName("bg")

	if not slot0.background_load then
		slot0.background_load = loadSpriteTextureFromCDN(slot0.background, PathTool.getPlistImgForDownLoad("bigbg/activitynotice", "txt_cn_activity_notice_bg"), ResourcesType.single, slot0.background_load)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.reward_btn = slot0.main_container:getChildByName("reward")

	slot0:upDate_reward_btn(0)

	slot0.list = {
		{
			val = 1,
			is_up = true
		},
		{
			val = 2,
			is_up = false
		},
		{
			val = 3,
			is_up = true
		},
		{
			val = 4,
			is_up = false
		},
		{
			val = 5,
			is_up = true
		},
		{
			val = 6,
			is_up = false
		}
	}

	if not slot0.scrollview then
		slot0.scrollview = CommonScrollViewLayout.new(slot0.main_container, cc.p(0, -160), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.main_container:getContentSize(), {
			start_y = 0,
			start_x = 15,
			space_x = 15,
			row = 1,
			space_y = 0,
			col = 1,
			scale = 1,
			item_class = ActionActivityNoticeItem,
			item_width = ActionActivityNoticeItem.Width,
			item_height = ActionActivityNoticeItem.Height + 80
		})
	end
end

function ActionActivityNoticePanel.showMove(slot0)
	slot0.sur_time = os.time({
		hour = 23,
		month = 10,
		year = 2019,
		min = 59,
		sec = 59,
		day = 9
	}) - GameNet:getInstance():getTime()

	if slot0.sur_time <= 259200 and slot0.sur_time > 0 then
		slot0.scrollview:jumpToMove(cc.p(-360, 0), 0.6)
	elseif slot0.sur_time <= 518400 then
		slot0.scrollview:jumpToMove(cc.p(-180, 0), 0.3)
	end
end

function ActionActivityNoticePanel.upDate_reward_btn(slot0, slot1)
	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if slot1 == 0 then
		if not tolua.isnull(slot0.reward_btn) and slot0.box_effect == nil then
			slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(40, 22), cc.p(0, 0), true, PlayerAction.action_2)

			slot0.reward_btn:addChild(slot0.box_effect)
		end
	elseif not tolua.isnull(slot0.reward_btn) and slot0.box_effect == nil then
		slot0.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(40, 22), cc.p(0, 0), true, PlayerAction.action_3)

		slot0.reward_btn:addChild(slot0.box_effect)
	end
end

function ActionActivityNoticePanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
		slot0.scrollview:setData(slot0.list)
		slot0:showMove()
	end
end

function ActionActivityNoticePanel.register_event(slot0)
	registerButtonEventListener(slot0.reward_btn, function ()
		uv0:cs16604(uv1.holiday_bid, 0)
	end, false, 1)

	if not slot0.update_action_activitynotice_event then
		slot0.update_action_activitynotice_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid and slot0.aim_list[1].status == 2 then
				uv0:upDate_reward_btn(1)
			end
		end)
	end
end

function ActionActivityNoticePanel.DeleteMe(slot0)
	if slot0.background_load then
		slot0.background_load:DeleteMe()

		slot0.background_load = nil
	end

	if slot0.box_effect then
		slot0.box_effect:clearTracks()
		slot0.box_effect:removeFromParent()

		slot0.box_effect = nil
	end

	if slot0.scrollview then
		slot0.scrollview:DeleteMe()

		slot0.scrollview = nil
	end

	if slot0.update_action_activitynotice_event then
		slot0.update_action_activitynotice_event = GlobalEvent:getInstance():UnBind(slot0.update_action_activitynotice_event)
		slot0.update_action_activitynotice_event = nil
	end
end

ActionActivityNoticeItem = class("ActionActivityNoticeItem", function ()
	return ccui.Widget:create()
end)
ActionActivityNoticeItem.Width = 165
ActionActivityNoticeItem.Height = 542

function ActionActivityNoticeItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function ActionActivityNoticeItem.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_activity_notice_item"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)
	slot0:setContentSize(cc.size(ActionActivityNoticeItem.Width, ActionActivityNoticeItem.Height))

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.sprite = slot0.main_container:getChildByName("Sprite")
end

function ActionActivityNoticeItem.setData(slot0, slot1)
	slot0.data = slot1

	if not slot0.load_sprite then
		slot0.load_sprite = loadSpriteTextureFromCDN(slot0.sprite, PathTool.getPlistImgForDownLoad("bigbg/activitynotice", "txt_cn_activity_notice_" .. slot0.data.val, false), ResourcesType.single, slot0.load_sprite)
	end

	if slot0.data.is_up == true then
		slot0:setPositionY(slot0:getPositionY() + 60)
	end
end

function ActionActivityNoticeItem.register_event(slot0)
end

function ActionActivityNoticeItem.DeleteMe(slot0)
	if slot0.load_sprite then
		slot0.load_sprite:DeleteMe()

		slot0.load_sprite = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
