slot1 = ActionController:getInstance():getModel()
ActionCommonRewardPanel = ActionCommonRewardPanel or BaseClass(BaseView)

function ActionCommonRewardPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_common_reward_panel"
	slot0.res_list = {}
	slot0.award_item_list = {}
end

function ActionCommonRewardPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 2)

	slot0.win_title = slot1:getChildByName("win_title")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.summon_num_txt = slot1:getChildByName("title_txt_1")
	slot0.scrollview_container = slot1:getChildByName("scrollview_container")
	slot0.scrollview_container_size = slot0.scrollview_container:getContentSize()
	slot0.scroll_view = createScrollView(slot0.scrollview_container_size.width, slot0.scrollview_container_size.height, 0, 0, slot0.scrollview_container, ScrollViewDir.horizontal)
	slot0.scroll_container = slot0.scroll_view:getInnerContainer()
	slot0.time_label = slot1:getChildByName("time_label")
end

function ActionCommonRewardPanel.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openActionCommonRewardPanel(false)
	end, true, 2)
end

function ActionCommonRewardPanel.openRootWnd(slot0, slot1)
	slot2 = slot1 or {}

	slot0.win_title:setString(slot2.title_name or TI18N("奖励详情"))
	slot0.time_label:setString(slot2.tips or TI18N("达到指定积分,可领取对应奖励"))

	if slot2.cur_txt then
		slot0.summon_num_txt:setString(slot5)
	end

	slot0.max_score = slot2.max_score or 0
	slot0.cur_score = slot2.cur_score or 0
	slot0.score_data_list = slot2.score_data_list or {}
	slot0.send_callback = slot2.send_callback

	slot0:setData()
end

function ActionCommonRewardPanel.setData(slot0)
	if #slot0.score_data_list == 0 then
		return
	end

	table.sort(slot0.score_data_list, function (slot0, slot1)
		return slot0.score < slot1.score
	end)

	if slot0.max_score == 0 then
		slot0.max_score = slot0.score_data_list[#slot0.score_data_list].score
	end

	slot1 = 84
	slot3 = slot1 * 0.5
	slot5 = (slot1 + 15) * (#slot0.score_data_list - 1) + slot1
	slot7 = slot0:newProgressbar(0, slot5 - slot1 * 0.5 + 2)

	if slot5 <= slot0.scrollview_container_size.width then
		slot0.scroll_view:setTouchEnabled(true)
	end

	slot13 = cc.size(math.max(slot5, slot0.scrollview_container_size.width), slot0.scrollview_container_size.height)

	slot0.scroll_view:setInnerContainerSize(slot13)

	for slot13, slot14 in ipairs(slot0.score_data_list) do
		if slot0.award_item_list[slot13] == nil then
			slot15 = ActionRewardProgressItem.new(slot0.cur_score)

			slot0.scroll_container:addChild(slot15)

			slot0.award_item_list[slot13] = slot15
		end

		slot15:setVisible(true)
		slot15:setData(slot14)
		slot15:setPosition(cc.p(slot3 + (slot13 - 1) * (slot1 + slot2), 30))
	end

	slot10 = 0
	slot12 = 0

	for slot16, slot17 in ipairs(slot0.score_data_list) do
		if slot16 == 1 then
			if slot0.cur_score <= slot17.score then
				slot12 = slot0.cur_score / slot17.score * slot1 * 0.5

				break
			else
				slot12 = slot11
			end
		elseif slot0.cur_score <= slot17.score then
			slot12 = slot12 + (slot0.cur_score - slot10) / (slot17.score - slot10) * (slot1 + slot2)

			break
		else
			slot12 = slot12 + slot1 + slot2
		end

		slot10 = slot17.score
	end

	slot7:setPercent(slot12 * 100 / slot6)
end

function ActionCommonRewardPanel.newProgressbar(slot0, slot1, slot2)
	if not slot0.scroll_container then
		return
	end

	slot6, slot7 = createLoadingBar(PathTool.getResFrame("common", "common_90005"), PathTool.getResFrame("common", "common_90006"), cc.size(slot2, 19), slot0.scroll_container, cc.p(0, 0.5), slot1, 41, true, true)

	return slot7
end

function ActionCommonRewardPanel.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	uv0:openActionCommonRewardPanel(false)
end

ActionRewardProgressItem = class("ActionRewardProgressItem", function ()
	return ccui.Widget:create()
end)

function ActionRewardProgressItem.ctor(slot0, slot1)
	slot0.cur_score = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionRewardProgressItem.configUI(slot0)
	slot0.size = cc.size(84, 122)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.award_item = BackPackItem.new(true, true, false, 0.7)

	slot0.award_item:setDefaultTip(true)
	slot0.award_item:setAnchorPoint(cc.p(0.5, 1))
	slot0.award_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height))
	slot0.root_wnd:addChild(slot0.award_item)

	slot0.times_txt = createLabel(22, cc.c3b(100, 50, 35), nil, slot0.size.width / 2, -5, "", slot0.root_wnd, nil, cc.p(0.5, 1))
	slot1 = createSprite(PathTool.getResFrame("common", "common_2031"), slot0.size.width / 2, slot0.size.height - 86, slot0.root_wnd, cc.p(0.5, 1))
	slot2 = createSprite(PathTool.getResFrame("common", "common_2032"), slot0.size.width / 2, 0, slot0.root_wnd, cc.p(0.5, 0))
end

function ActionRewardProgressItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.reward then
		slot0.award_item:setBaseData(slot2[1], slot2[2])

		if slot1.score <= slot0.cur_score then
			slot0.award_item:setReceivedIcon(true)
		else
			slot0.award_item:setReceivedIcon(false)
		end
	end

	slot0.times_txt:setString(slot1.score)
end

function ActionRewardProgressItem.register_event(slot0)
end

function ActionRewardProgressItem.DeleteMe(slot0)
	if slot0.award_item then
		slot0.award_item:DeleteMe()

		slot0.award_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
