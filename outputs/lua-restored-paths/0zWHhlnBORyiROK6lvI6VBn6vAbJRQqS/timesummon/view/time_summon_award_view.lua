slot1 = TimesummonController:getInstance():getModel()
slot2 = table.insert
TimeSummonAwardView = TimeSummonAwardView or BaseClass(BaseView)

function TimeSummonAwardView.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "action/action_time_summon_award"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("timesummon", "timesummon"),
			type = ResourcesType.plist
		}
	}
	slot0.up_item_list = {}
	slot0.probability_list = {}
	slot0.view_num = 10
end

function TimeSummonAwardView.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot1

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("奖励详情"))

	slot0.time_label = slot1:getChildByName("time_label")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot3 = slot1:getChildByName("list_panel")
	slot0.scroll_size = slot3:getContentSize()
	slot0.desc_scrollview = createScrollView(slot0.scroll_size.width, slot0.scroll_size.height, 0, 0, slot3)
end

function TimeSummonAwardView.register_event(slot0)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openTimeSummonAwardView(false)
	end, false, 2)
end

function TimeSummonAwardView.openRootWnd(slot0, slot1, slot2, slot3)
	slot0.text_elite = slot3 or nil
	slot0.group_id = slot1
	slot0.data = slot2

	slot0:setData()
end

function TimeSummonAwardView.setData(slot0)
	if not slot0.group_id then
		return
	end

	slot1 = 0
	slot2 = Config.RecruitHolidayData.data_probability[slot0.group_id]

	if slot0.text_elite == TimesummonConst.ActonInfoType.EliteType then
		slot2 = Config.RecruitHolidayEliteData.data_probability[slot0.group_id]
	elseif slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType or slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType2 then
		slot2 = Config.HolidaySpriteLotteryData.data_probability[slot0.group_id]
	elseif slot0.text_elite == TimesummonConst.ActonInfoType.EliteType2 then
		slot2 = Config.RecruitHolidayLuckyData.data_probability[slot0.group_id]
	end

	slot3 = 0

	if slot0.text_elite ~= TimesummonConst.ActonInfoType.EliteType2 and slot2 then
		slot4 = {}

		if slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType2 then
			if ElfinController:getInstance():getModel():getElfinSummonData() and slot5.lucky_ids ~= nil and next(slot5.lucky_ids) ~= nil then
				for slot9, slot10 in pairs(slot0.data.lucky_ids) do
					uv0(slot4, {
						num = 1,
						id = slot10.lucky_sprites_bid
					})

					break
				end
			end
		else
			for slot8, slot9 in ipairs(slot2) do
				if slot9.is_up == 1 then
					uv0(slot4, slot9)
				end
			end
		end

		if not slot0.title_bg_1 then
			slot0.title_bg_1 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90025"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

			slot0.title_bg_1:setContentSize(cc.size(610, 44))

			slot5 = TI18N("本期UP内容")

			if slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType then
				slot5 = TI18N("本期直升内容")
			elseif slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType2 then
				slot5 = TI18N("当前许愿幽灵")
			end

			slot6 = createLabel(24, 116, nil, 10, 22, slot5, slot0.title_bg_1, nil, cc.p(0, 0.5))
		end

		slot5 = 20
		slot7 = slot0.scroll_size.width * 0.5 - #slot4 * (BackPackItem.Width * 0.5 + slot5 * 0.5) + BackPackItem.Width * 0.5 + slot5 * 0.5

		for slot11, slot12 in ipairs(slot4) do
			if slot0.up_item_list[slot11] == nil then
				slot13 = BackPackItem.new(true, true)

				slot13:setDefaultTip(true)
				slot0.desc_scrollview:addChild(slot13)

				slot0.up_item_list[slot11] = slot13
			end

			slot13:setBaseData(slot12.id, slot12.num)
			slot13:setPosition(cc.p(slot7 + (slot11 - 1) * (BackPackItem.Width + slot5), 561))
		end

		if slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType2 and slot6 <= 0 then
			slot8 = createLabel(24, cc.c3b(100, 50, 35), nil, slot0.title_bg_1:getContentSize().width * 0.5, -70, TI18N("请先将幽灵加入许愿池"), slot0.title_bg_1, nil, cc.p(0.5, 0.5))
		end

		slot1 = 54 + BackPackItem.Height + 16
	end

	slot4 = 0

	if slot0.data then
		slot5 = Config.RecruitHolidayData.data_action[slot0.data.camp_id]

		if slot0.text_elite == TimesummonConst.ActonInfoType.EliteType then
			slot5 = Config.RecruitHolidayEliteData.data_action[slot0.data.camp_id]
		elseif slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType or slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType2 then
			slot5 = Config.HolidaySpriteLotteryData.data_action[slot0.data.camp_id]
		elseif slot0.text_elite == TimesummonConst.ActonInfoType.EliteType2 then
			slot5 = Config.RecruitHolidayLuckyData.data_action[slot0.data.camp_id]
		end

		if slot5 then
			if not slot0.title_bg_2 then
				slot0.title_bg_2 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90025"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

				slot0.title_bg_2:setContentSize(cc.size(610, 44))

				slot6 = createLabel(24, 116, nil, 10, 22, TI18N("内容详情"), slot0.title_bg_2, nil, cc.p(0, 0.5))
			end

			if not slot0.award_desc then
				slot0.award_desc = createRichLabel(24, cc.c3b(100, 50, 35), cc.p(0.5, 1), cc.p(slot0.scroll_size.width * 0.5, 430), 10, nil, 580)

				slot0.desc_scrollview:addChild(slot0.award_desc)
			end

			slot0.award_desc:setString(slot5.desc or "")

			slot1 = slot1 + slot0.award_desc:getContentSize().height + 54 + 10
		end
	end

	slot6 = math.max(slot0.scroll_size.height, slot1) + (slot0.view_num + 1) * 41 - slot3 - slot4 - 54
	slot7 = 0

	if slot2 then
		if not slot0.title_bg_3 then
			slot0.title_bg_3 = createImage(slot0.desc_scrollview, PathTool.getResFrame("common", "common_90025"), slot0.scroll_size.width * 0.5, 0, cc.p(0.5, 1), true, nil, true)

			slot0.title_bg_3:setContentSize(cc.size(610, 44))
		end

		slot8 = createLabel(24, 116, nil, 10, 22, TI18N("概率公示"), slot0.title_bg_3, nil, cc.p(0, 0.5))

		if slot0.text_elite ~= TimesummonConst.ActonInfoType.EliteType2 then
			slot10 = createRichLabel(22, 116, cc.p(0, 0.5), cc.p(37, 22))

			slot10:setString(string.format("<div href=xxx>%s</div>", TI18N("查看详情")))
			createImage(slot0.title_bg_3, PathTool.getResFrame("common", "common_1093"), 498, 22, cc.p(0.5, 0.5), true, nil, true):addChild(slot10)
			slot10:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
				uv0:openTimeSummonpreviewWindow(true, uv1.group_id, uv1.text_elite)
			end, {
				"click",
				"href"
			})
		end

		slot7 = 54
		slot1 = slot1 + 54

		for slot12, slot13 in ipairs(slot2) do
			if slot12 < slot0.view_num + 1 then
				delayRun(slot0.desc_scrollview, slot12 * 2 / 60, function ()
					if not uv0.probability_list[uv1] then
						slot0 = TimeSummonAwardItem.new()

						uv0.desc_scrollview:addChild(slot0)

						uv0.probability_list[uv1] = slot0
					end

					slot0:setData(uv2, uv0.text_elite)

					uv3 = uv3 + 30 + 10
					uv4 = uv4 + 30 + 10

					uv0.probability_list[uv1]:setPosition(cc.p(uv0.scroll_size.width * 0.5, uv5 - (uv1 - 1) * 40))
				end)
			end
		end
	end

	slot0.desc_scrollview:setInnerContainerSize(cc.size(slot0.scroll_size.width, slot5))

	if slot0.title_bg_1 then
		slot0.title_bg_1:setPositionY(slot5)
	end

	for slot12, slot13 in pairs(slot0.up_item_list) do
		slot13:setPositionY(slot5 - 54 - BackPackItem.Height * 0.5 - 4)
	end

	if slot0.title_bg_2 then
		slot0.title_bg_2:setPositionY(slot5 - slot3)
	end

	if slot0.award_desc then
		slot0.award_desc:setPositionY(slot5 - slot3 - 54)
	end

	if slot0.title_bg_3 then
		slot0.title_bg_3:setPositionY(slot5 - slot3 - slot4)
	end

	if slot0.data then
		if slot0.text_elite == TimesummonConst.ActonInfoType.ElfinType2 then
			slot0.time_label:setString("")
		else
			slot0.time_label:setString(string.format(TI18N("概率有效期：%s~%s"), TimeTool.getYMD(slot0.data.start_time), TimeTool.getYMD(slot0.data.end_time)))
		end
	end
end

function TimeSummonAwardView.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.up_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	for slot4, slot5 in pairs(slot0.probability_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	doStopAllActions(slot0.desc_scrollview)
	uv0:openTimeSummonAwardView(false)
end

TimeSummonAwardItem = class("TimeSummonAwardItem", function ()
	return ccui.Widget:create()
end)

function TimeSummonAwardItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function TimeSummonAwardItem.configUI(slot0)
	slot0.size = cc.size(584, 30)

	slot0:setTouchEnabled(false)
	slot0:setAnchorPoint(cc.p(0.5, 1))
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(slot0.size)
	slot0:addChild(slot0.root_wnd)

	slot0.star_text = createLabel(24, 1, nil, 0, slot0.size.height / 2, "", slot0.root_wnd, nil, cc.p(0, 0.5))
	slot0.name_text = createLabel(24, 1, nil, 160, slot0.size.height / 2, "", slot0.root_wnd, nil, cc.p(0, 0.5))
	slot0.type_text = createLabel(24, 1, nil, 320, slot0.size.height / 2, "", slot0.root_wnd, nil, cc.p(0, 0.5))
	slot0.num_text = createLabel(24, 1, nil, slot0.size.width, slot0.size.height / 2, "", slot0.root_wnd, nil, cc.p(1, 0.5))
end

function TimeSummonAwardItem.register_event(slot0)
end

function TimeSummonAwardItem.setData(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	slot0.name_text:setString(slot1.name)
	slot0.num_text:setString(slot1.probability .. "%")

	if slot1.is_up == 1 then
		slot0.star_text:setString(slot1.star .. " UP!")
		slot0.star_text:setTextColor(TimesummonConst.Up_Text_Color)
		slot0.name_text:setTextColor(TimesummonConst.Up_Text_Color)
		slot0.type_text:setTextColor(TimesummonConst.Up_Text_Color)
		slot0.num_text:setTextColor(TimesummonConst.Up_Text_Color)
	else
		slot0.star_text:setString(slot1.star)
		slot0.star_text:setTextColor(TimesummonConst.Not_Up_Text_Color)
		slot0.name_text:setTextColor(TimesummonConst.Not_Up_Text_Color)
		slot0.type_text:setTextColor(TimesummonConst.Not_Up_Text_Color)
		slot0.num_text:setTextColor(TimesummonConst.Not_Up_Text_Color)
	end

	if slot1.is_chip == 1 then
		slot0.type_text:setString(TI18N("碎片"))
	elseif slot2 and (slot2 == TimesummonConst.ActonInfoType.ElfinType or slot2 == TimesummonConst.ActonInfoType.ElfinType2) then
		slot0.star_text:setString(slot1.name)
		slot0.name_text:setString(slot1.probability .. "%")
		slot0.num_text:setString("")
	elseif slot2 == TimesummonConst.ActonInfoType.EliteType2 then
		slot0.type_text:setString("")
	else
		slot0.type_text:setString(TI18N("英雄"))
	end
end

function TimeSummonAwardItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
