slot1 = TimesummonController:getInstance():getModel()
TimeSummonProgressView = TimeSummonProgressView or BaseClass(BaseView)

function TimeSummonProgressView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_time_summon_progress"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("timesummon", "timesummon"),
			type = ResourcesType.plist
		}
	}
	slot0.award_item_list = {}
end

function TimeSummonProgressView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot0.container, 2)
	slot1:getChildByName("win_title"):setString(TI18N("查看奖励"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.summon_num_txt = slot1:getChildByName("title_txt_1")
	slot0.progress = slot1:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot1:getChildByName("time_label"):setString(TI18N("限定召唤期间达到指定招募次数可获对应奖励"))
end

function TimeSummonProgressView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openTimeSummonProgressView(false)
	end, false, 2)
end

function TimeSummonProgressView.openRootWnd(slot0, slot1, slot2, slot3, slot4)
	slot0.cur_times = slot1
	slot0.camp_id = slot2
	slot0.item_up_hero_id = slot3
	slot0.reward_list = slot4

	slot0:setData()
end

function TimeSummonProgressView.setData(slot0)
	if not slot0.cur_times or not slot0.camp_id then
		return
	end

	slot0.summon_num_txt:setString(string.format(TI18N("当前已招募次数：%d"), slot0.cur_times))

	slot1 = Config.RecruitHolidayData.data_award[slot0.camp_id]

	if EliteSummonController:getInstance():getModel():isHolidayHasID(slot0.camp_id) then
		slot1 = Config.RecruitHolidayEliteData.data_award[slot0.camp_id]
	end

	if EliteSummonController:getInstance():getModel():isHolidayLuckyHasID(slot0.camp_id) then
		slot1 = Config.RecruitHolidayLuckyData.data_award[slot0.camp_id]
	end

	slot4 = 100

	if slot1 then
		slot6 = slot1[#slot1].times
		slot7 = (523 - slot4 + 60.5) / (#slot1 - 1)

		for slot11, slot12 in ipairs(slot1) do
			slot12.status = false

			if slot0.reward_list then
				for slot16, slot17 in pairs(slot0.reward_list) do
					if slot12.id == slot17.id then
						slot12.status = true

						break
					end
				end
			end

			if slot0.award_item_list[slot11] == nil then
				slot13 = TimeSummonProgressItem.new(slot0.cur_times, slot0.item_up_hero_id)

				slot0.container:addChild(slot13)

				slot0.award_item_list[slot11] = slot13
			end

			slot13:setVisible(true)
			slot13:setData(slot12)
			slot13:setPosition(cc.p(slot4 + (slot11 - 1) * slot7, 150.5))
		end

		slot8 = 0
		slot9 = 523
		slot11 = 0
		slot12 = 0

		for slot16, slot17 in ipairs(slot1) do
			if slot16 == 1 then
				if slot0.cur_times <= slot17.times then
					slot12 = slot0.cur_times / slot17.times * (slot4 - 60.5)

					break
				else
					slot12 = slot10
				end
			elseif slot0.cur_times <= slot17.times then
				slot12 = slot12 + (slot0.cur_times - slot8) / (slot17.times - slot8) * slot7

				break
			else
				slot12 = slot12 + slot7
			end

			slot8 = slot17.times
		end

		slot0.progress:setPercent(slot12 / slot9 * 100)
	end
end

function TimeSummonProgressView.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.award_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	TipsManager:getInstance():hideTips()
	uv0:openTimeSummonProgressView(false)
end

TimeSummonProgressItem = class("TimeSummonProgressItem", function ()
	return ccui.Widget:create()
end)

function TimeSummonProgressItem.ctor(slot0, slot1, slot2)
	slot0.cur_times = slot1
	slot0.cur_item_up_hero_id = slot2

	slot0:configUI()
	slot0:register_event()
end

function TimeSummonProgressItem.configUI(slot0)
	slot0.size = cc.size(84, 122)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 0))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.award_item = BackPackItem.new(true, true, false, 0.7)

	slot0.award_item:setDefaultTip(true, nil, function (slot0)
		if slot0 and slot0:getData() and uv0.item_data and uv0.item_data.id == 5 and Config.RecruitHolidayLuckyData.data_award[uv0.item_data.camp_id] and slot1[uv0.item_data.camp_id][uv0.item_data.id].self_reward and slot1[uv0.item_data.camp_id][uv0.item_data.id].self_reward[1] then
			if uv0.item_data.status then
				TipsManager:getInstance():hideTips()
				message(TI18N("你已领取过该奖励"))
			else
				TipsManager:getInstance():hideTips()
				TimesummonController:getInstance():openHeroSelectView(true, uv0.item_data, uv0.cur_times)
				TimesummonController:getInstance():openTimeSummonProgressView(false)
			end
		end
	end)
	slot0.award_item:setAnchorPoint(cc.p(0.5, 1))
	slot0.award_item:setPosition(cc.p(slot0.size.width / 2, slot0.size.height))
	slot0.root_wnd:addChild(slot0.award_item)

	slot0.times_txt = createLabel(22, cc.c3b(100, 50, 35), nil, slot0.size.width / 2, -5, "", slot0.root_wnd, nil, cc.p(0.5, 1))
	slot2 = createSprite(PathTool.getResFrame("timesummon", "timesummon_1004"), slot0.size.width / 2, slot0.size.height - 86, slot0.root_wnd, cc.p(0.5, 1))
	slot3 = createSprite(PathTool.getResFrame("timesummon", "timesummon_1005"), slot0.size.width / 2, 0, slot0.root_wnd, cc.p(0.5, 0))
end

function TimeSummonProgressItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.item_data = slot1

	if slot1.reward then
		slot3, slot4 = nil

		if slot1.id == 5 then
			if slot2[1] then
				slot3 = slot2[1][1]
				slot4 = slot2[1][2]
			elseif slot1.self_reward[1] then
				slot3 = 39093
				slot4 = 0
			end
		else
			slot3 = slot2[1][1]
			slot4 = slot2[1][2]
		end

		slot0.award_item:setBaseData(slot3, slot4)

		if slot1.status then
			slot0.award_item:setReceivedIcon(true)
		else
			slot0.award_item:setReceivedIcon(false)
		end
	end

	slot0.times_txt:setString(slot1.times)
end

function TimeSummonProgressItem.register_event(slot0)
end

function TimeSummonProgressItem.DeleteMe(slot0)
	if slot0.award_item then
		slot0.award_item:DeleteMe()

		slot0.award_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
