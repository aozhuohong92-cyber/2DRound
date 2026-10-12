slot1 = ActionController:getInstance():getModel()
slot2 = table.insert
slot3 = string.format
slot4 = Config.HolidayMergeGoalData.data_const.base_max_score.val / 1000
MergeAimRewardPanel = MergeAimRewardPanel or BaseClass(BaseView)

function MergeAimRewardPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "seven_goal/seven_goal_adventure_lev_reward"
end

function MergeAimRewardPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Text_1"):setString(TI18N("活动奖励"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.award_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 10,
		col = 1,
		need_dynamic = true,
		item_class = MergeAimRewardItem
	})

	slot0.award_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function MergeAimRewardPanel.register_event(slot0)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openMergeAimRewardPanel(false)
	end, true)

	if not slot0.merge_info_event then
		slot0.merge_info_event = GlobalEvent:getInstance():Bind(ActionEvent.Merge_Aim_Event, function (slot0)
			if not slot0 then
				return
			end

			uv0.data = slot0

			uv0:setData(slot0)
		end)
	end
end

function MergeAimRewardPanel.openRootWnd(slot0)
	ActionController:getInstance():sender27300()
end

function MergeAimRewardPanel.setData(slot0, slot1)
	for slot6, slot7 in ipairs(Config.HolidayMergeGoalData.data_score_award) do
		uv0({}, {
			sys_config = slot7,
			reward_config = slot1
		})
	end

	if slot0.award_scrollview then
		slot0.award_scrollview:setData(slot2)
	end
end

function MergeAimRewardPanel.close_callback(slot0)
	if slot0.award_scrollview then
		slot0.award_scrollview:DeleteMe()

		slot0.award_scrollview = nil
	end

	uv0:openMergeAimRewardPanel(false)
end

MergeAimRewardItem = class("MergeAimRewardItem", function ()
	return ccui.Widget:create()
end)

function MergeAimRewardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function MergeAimRewardItem.configUI(slot0)
	slot0.size = cc.size(608, 167)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("seven_goal/seven_goal_adventure_lev_reward_item"))

	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.title_name = slot1:getChildByName("title_name")
	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_1")

	slot0.btn_get_label:setString(TI18N("领取"))

	slot0.has_spr = slot1:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.num_txt = slot1:getChildByName("num_txt")
	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
		need_dynamic = true,
		space_x = 10,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function MergeAimRewardItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1.sys_config
	slot3 = {}

	if slot1.reward_config == nil then
		return
	end

	slot3 = slot1.reward_config
	slot0.award_id = slot2.id

	slot0:setCount(slot2, slot3)
	slot0:setReward_icon(slot2)

	slot0.status = true
	slot0.isGray = false

	if slot3.lev < slot0.award_id then
		slot0.status = true
		slot0.isGray = true
	elseif slot0.award_id == slot3.lev then
		if slot3.score < slot3.max_score then
			slot0.status = true
			slot0.isGray = true
		elseif slot3.max_score <= slot3.score then
			slot3.score = slot3.max_score

			for slot7, slot8 in pairs(slot3.reward) do
				if slot8.id == slot0.award_id then
					slot0.status = false
				end
			end
		end
	elseif slot0.award_id < slot3.lev then
		if #slot3.reward == 0 then
			slot0.status = true
			slot0.isGray = false
		else
			for slot7, slot8 in pairs(slot3.reward) do
				if slot8.id == slot0.award_id then
					slot0.status = false
				end
			end
		end
	end

	slot0:setStatus()
end

function MergeAimRewardItem.setStatus(slot0)
	slot0.btn_get:setVisible(slot0.status == true)
	slot0.has_spr:setVisible(slot0.status == false)
	slot0:setGray(slot0.isGray)
end

function MergeAimRewardItem.setGray(slot0, slot1)
	if slot0.btn_get:isVisible() == true then
		setChildUnEnabled(slot1, slot0.btn_get)
		slot0.btn_get:setTouchEnabled(not slot1)

		if slot1 == true then
			slot0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
		else
			slot0.btn_get_label:enableOutline(Config.ColorData.data_color4[264], 2)
		end
	end
end

function MergeAimRewardItem.setCount(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	slot3 = slot1.count
	slot4 = 0
	slot5 = 0
	slot4 = (slot0.award_id ~= 1 or slot1.count) and Config.HolidayMergeGoalData.data_score_award[slot0.award_id - 1].count * 100
	slot5 = slot2.lev <= 1 and 0 or Config.HolidayMergeGoalData.data_score_award[slot2.lev - 1].count * 100

	if slot0.award_id < slot2.lev then
		slot0.num_txt:setString(uv0("(%d/%d)", slot1.count * tonumber(uv1), slot1.count * tonumber(uv1)))
	elseif slot0.award_id == slot2.lev then
		slot0.num_txt:setString(uv0("(%d/%d)", slot2.score + slot5, slot1.count * tonumber(uv1)))
	else
		slot0.num_txt:setString(uv0("(%d/%d)", slot2.score + slot5, slot1.count * tonumber(uv1)))
	end

	slot0.title_name:setString(uv0(TI18N("积分累计达到%d"), slot1.count * tonumber(uv1)))
	slot0.num_txt:setVisible(true)
end

function MergeAimRewardItem.setReward_icon(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot1.award) do
		if deepCopy(Config.ItemData.data_get_data(slot7[1])) then
			slot8.quantity = slot7[2]

			uv0(slot2, slot8)
		end
	end

	if #slot2 > 4 then
		slot0.item_scrollview:setClickEnabled(true)
	else
		slot0.item_scrollview:setClickEnabled(false)
	end

	slot0.item_scrollview:setData(slot2)
	slot0.item_scrollview:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function MergeAimRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, handler(slot0, slot0.onClickGetBtn), true)

	if not slot0.merge_item_event then
		slot0.event = GlobalEvent:getInstance():Bind(ActionEvent.Merge_Box_Status_Event, function (slot0)
			if not slot0 then
				return
			end

			if slot0.flag == 1 then
				uv0.status = false
			end
		end)
	end
end

function MergeAimRewardItem.onClickGetBtn(slot0)
	if slot0.award_id then
		slot2 = {}

		table.insert(slot2, {
			id = slot0.award_id
		})
		uv0:sender27301(slot2)
	end
end

function MergeAimRewardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	if slot0.merge_item_event then
		GlobalEvent:getInstance():UnBind(slot0.merge_item_event)

		slot0.merge_item_event = nil
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
