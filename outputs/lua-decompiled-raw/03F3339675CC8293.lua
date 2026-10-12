SevenGoalAdventureLevRewardWindow = SevenGoalAdventureLevRewardWindow or BaseClass(BaseView)
slot0 = SevenGoalController:getInstance()
slot1 = Config.DayGoalsNewData.data_make_lev_list
slot2 = table.insert
slot3 = table.sort

function SevenGoalAdventureLevRewardWindow.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "seven_goal/seven_goal_adventure_lev_reward"
end

function SevenGoalAdventureLevRewardWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("Text_1"):setString(TI18N("等级奖励"))

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 0,
		item_width = 608,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 167,
		space_y = 10,
		col = 1,
		need_dynamic = true,
		item_class = SevenGoalAdventureLevRewardItem
	})

	slot0.item_scrollview:setSwallowTouches(false)

	slot0.btn_close = slot1:getChildByName("btn_close")
end

function SevenGoalAdventureLevRewardWindow.openRootWnd(slot0)
	uv0:sender13607()
end

function SevenGoalAdventureLevRewardWindow.sortItemList(slot0, slot1)
	uv0(slot1, function (slot0, slot1)
		if slot0.status == 1 and slot1.status == 0 then
			return false
		elseif slot0.status == 0 and slot1.status == 1 then
			return true
		else
			return slot0.lev < slot1.lev
		end
	end)
end

function SevenGoalAdventureLevRewardWindow.register_event(slot0)
	slot0:addGlobalEvent(SevenGoalEvent.Reward_Lev, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		if uv0.item_scrollview then
			slot1 = {}

			if uv2[uv1:getModel():getSevenGoalPeriod()] then
				for slot6, slot7 in pairs(uv2[slot2]) do
					if uv1:getModel():getSevenGoalLevData(slot7.lev) == true then
						slot7.status = 1
					else
						slot7.status = 0
					end

					uv3(slot1, slot7)
				end

				uv4(slot1, function (slot0, slot1)
					return slot0.lev < slot1.lev
				end)
				uv0:sortItemList(slot1)
				uv0.item_scrollview:setData(slot1, nil, , {
					make_lev = slot0.lev
				})
			end
		end
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openSevenGoalAdventureLevRewardView(false)
	end, true, 1)
end

function SevenGoalAdventureLevRewardWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	uv0:openSevenGoalAdventureLevRewardView(false)
end

SevenGoalAdventureLevRewardItem = class("SevenGoalAdventureLevRewardItem", function ()
	return ccui.Widget:create()
end)

function SevenGoalAdventureLevRewardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SevenGoalAdventureLevRewardItem.configUI(slot0)
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

	slot2 = slot1:getChildByName("good_cons")
	slot0.item_scrollview = CommonScrollViewLayout.new(slot2, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot2:getContentSize(), {
		start_y = 5,
		start_x = 0,
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

function SevenGoalAdventureLevRewardItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data then
			uv1:sender13608(uv0.data.lev)
		end
	end, true, 1)
end

function SevenGoalAdventureLevRewardItem.setExtendData(slot0, slot1)
	slot0.make_lev = slot1.make_lev or 0
end

function SevenGoalAdventureLevRewardItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.title_name:setString(slot1.title_name)
	slot0.btn_get:setVisible(slot1.status == 0)
	slot0.has_spr:setVisible(slot1.status == 1)

	if slot1.lev <= slot0.make_lev then
		setChildUnEnabled(false, slot0.btn_get)
		slot0.btn_get_label:enableOutline(Config.ColorData.data_color4[264], 2)
	else
		setChildUnEnabled(true, slot0.btn_get)
		slot0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
	end

	slot2 = {}

	if uv1[uv0:getModel():getSevenGoalPeriod()] then
		slot7 = slot1.lev

		for slot7, slot8 in pairs(uv1[slot3][slot7].reward) do
			if deepCopy(Config.ItemData.data_get_data(slot8[1])) then
				slot9.quantity = slot8[2]

				table.insert(slot2, slot9)
			end
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

function SevenGoalAdventureLevRewardItem.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
