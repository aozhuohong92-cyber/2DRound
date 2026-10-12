ActionCommonPanel = class("ActionCommonPanel", function ()
	return ccui.Widget:create()
end)
slot0 = {
	cc.c4b(128, 247, 49, 255),
	cc.c4b(90, 58, 38, 255)
}
slot1 = ActionController:getInstance()

function ActionCommonPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.cell_data_list = {}
end

function ActionCommonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_hero_expedit_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -66)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_con = slot0.main_container:getChildByName("title_con")
	slot0.time_label = slot0.title_con:getChildByName("label_time_key")

	slot0.time_label:setString(TI18N("剩余时间："))

	slot0.time_text = slot0.title_con:getChildByName("label_time")

	slot0.time_text:setTextColor(uv0[1])
	slot0.time_text:setAnchorPoint(cc.p(0, 0.5))

	slot0.rank_btn = slot0.title_con:getChildByName("rank_btn")

	slot0.rank_btn:getChildByName("label"):setString(TI18N("详细排行"))
	slot0.rank_btn:getChildByName("label"):enableOutline(CommonButton_Color[3], 2)

	slot0.reward_btn = slot0.title_con:getChildByName("reward_btn")

	slot0.reward_btn:getChildByName("label"):setString(TI18N("奖励预览"))
	slot0.reward_btn:getChildByName("label"):enableOutline(CommonButton_Color[3], 2)

	slot0.btn_rule = slot0.title_con:getChildByName("btn_rule")

	slot0.btn_rule:setVisible(false)
	slot0:loadBannerImage()

	slot0.good_cons = slot0.main_container:getChildByName("charge_con")

	slot0:updateScrollviewList()
	uv1:cs16603(slot0.holiday_bid)
end

function ActionCommonPanel.updateScrollviewList(slot0)
	if slot0.child_scrollview == nil then
		slot0.child_scrollview = CommonScrollViewSingleLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
			start_y = 0,
			once_num = 1,
			start_x = 0,
			row = 1,
			delay = 4,
			space_x = 0,
			item_width = 688,
			item_height = 150,
			space_y = 0,
			col = 1
		}, cc.p(0, 0))

		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.child_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.child_scrollview:setSwallowTouches(false)
	slot0.child_scrollview:reloadData()
end

function ActionCommonPanel.createNewCell(slot0, slot1, slot2)
	return ActionCommonItem.new()
end

function ActionCommonPanel.numberOfCells(slot0)
	if not slot0.cell_data_list then
		return 0
	end

	return #slot0.cell_data_list
end

function ActionCommonPanel.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.cell_data_list then
		return
	end

	slot1.index = slot2

	if slot0.tab ~= nil and slot1.setExtendData ~= nil then
		slot1:setExtendData(slot0.tab)
	end

	if not slot0.cell_data_list[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionCommonPanel.loadBannerImage(slot0)
	if slot0.holiday_bid == ActionRankCommonType.hero_expedit or slot0.holiday_bid == ActionRankCommonType.adventure then
		slot0.btn_rule:setVisible(true)
	elseif slot0.holiday_bid == ActionRankCommonType.longin_gift or slot0.holiday_bid == ActionRankCommonType.luckly_egg or slot0.holiday_bid == ActionRankCommonType.summon_luxury or slot0.holiday_bid == ActionRankCommonType.hero_awake or slot0.holiday_bid == ActionRankCommonType.recruit_luxury then
		slot0.reward_btn:setVisible(false)
		slot0.rank_btn:setVisible(false)
	elseif slot0.holiday_bid == ActionRankCommonType.acc_luxury or slot0.holiday_bid == ActionRankCommonType.totle_charge or slot0.holiday_bid == ActionRankCommonType.totle_consume or slot0.holiday_bid == ActionRankCommonType.fusion_blessing or slot0.holiday_bid == ActionRankCommonType.updata_star or slot0.holiday_bid == ActionRankCommonType.limit_charge or slot0.holiday_bid == ActionRankCommonType.limit_charge_1 or slot0.holiday_bid == ActionRankCommonType.new_totle_charge or slot0.holiday_bid == ActionRankCommonType.new_totle_charge1 then
		if slot0.holiday_bid == ActionRankCommonType.acc_luxury then
			slot0.btn_rule:setVisible(true)
		end

		slot0.btn_rule:setPositionX(670)
		slot0.time_label:setPosition(cc.p(493, 19))
		slot0.time_text:setAnchorPoint(cc.p(0, 0.5))
		slot0.time_text:setPosition(cc.p(586, 19))
		slot0.reward_btn:setVisible(false)
		slot0.rank_btn:setVisible(false)
	end

	slot1 = slot0.title_con:getChildByName("title_img")
	slot2 = "txt_cn_welfare_banner11"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot3.reward_title ~= "" and slot3.reward_title then
		slot2 = slot3.reward_title
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes(slot2), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end
end

function ActionCommonPanel.register_event(slot0)
	if not slot0.update_holiday_common_event then
		slot0.update_holiday_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setPanelData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.rank_btn, function ()
		uv0:jumpRankView()
	end, true, 1)
	registerButtonEventListener(slot0.reward_btn, function ()
		RankController:getInstance():openRankRewardPanel(true, uv0.holiday_bid)
	end, true, 1)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		slot3 = Config.HolidayClientData.data_constant.expedit_rules

		if uv0.holiday_bid == ActionRankCommonType.adventure then
			slot3 = Config.HolidayClientData.data_constant.adventure_rules
		elseif uv0.holiday_bid == ActionRankCommonType.acc_luxury then
			slot3 = Config.HolidayClientData.data_constant.luxury_rules
		end

		TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1)
end

function ActionCommonPanel.setPanelData(slot0, slot1)
	slot2 = false

	if (slot0.holiday_bid == ActionRankCommonType.epoint_gold or slot0.holiday_bid == ActionRankCommonType.speed_fight or slot0.holiday_bid == ActionRankCommonType.voyage or slot0.holiday_bid == ActionRankCommonType.hero_expedit or slot0.holiday_bid == ActionRankCommonType.adventure or slot0.holiday_bid == ActionRankCommonType.planes_rank) and (slot1.remain_sec or 0) - 86400 <= 0 then
		slot3 = 0
		slot2 = true
	end

	if slot0.child_scrollview then
		uv0:getModel():sortItemList(slot1.aim_list)

		slot0.cell_data_list = slot1.aim_list
		slot0.tab = {
			bid = slot0.holiday_bid,
			time_end = slot2,
			finish = slot1.finish
		}

		slot0.child_scrollview:reloadData()
	end

	if slot0.holiday_bid == ActionRankCommonType.acc_luxury then
		slot0.time_text:setVisible(false)
		slot0.time_label:setVisible(false)
	else
		slot0.time_text:setVisible(true)
		slot0.time_label:setVisible(true)
		uv0:getModel():setCountDownTime(slot0.time_text, slot3, slot2)
	end
end

function ActionCommonPanel.jumpRankView(slot0)
	slot1 = RankConstant.RankType.hero_expedit

	if slot0.holiday_bid == ActionRankCommonType.speed_fight then
		slot1 = RankConstant.RankType.speed_fight
	elseif slot0.holiday_bid == ActionRankCommonType.voyage then
		slot1 = RankConstant.RankType.voyage
	elseif slot0.holiday_bid == ActionRankCommonType.epoint_gold then
		slot1 = RankConstant.RankType.pointglod
	elseif slot0.holiday_bid == ActionRankCommonType.adventure then
		slot1 = RankConstant.RankType.adventure_muster
	elseif slot0.holiday_bid == ActionRankCommonType.planes_rank then
		slot1 = RankConstant.RankType.planes_rank
	end

	RankController:getInstance():openRankView(true, slot1)
end

function ActionCommonPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionCommonPanel.DeleteMe(slot0)
	doStopAllActions(slot0.time_text)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.child_scrollview then
		slot0.child_scrollview:DeleteMe()
	end

	slot0.child_scrollview = nil

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end
end

ActionCommonItem = class("ActionCommonItem", function ()
	return ccui.Widget:create()
end)

function ActionCommonItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()

	slot0.good_list_data = {}
end

function ActionCommonItem.configUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("welfare/luxury_item"))

	slot0:setContentSize(cc.size(688, 150))
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_goto = slot1:getChildByName("btn_goto")
	slot0.btn_goto_label = slot0.btn_goto:getChildByName("Text_7_0")

	slot0.btn_goto_label:setString(TI18N("前往"))
	slot0.btn_goto_label:enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.btn_goto:setVisible(false)

	slot0.btn_get = slot1:getChildByName("btn_get")
	slot0.btn_get_label = slot0.btn_get:getChildByName("Text_7")

	slot0.btn_get_label:setString(TI18N("领取"))
	slot0.btn_get_label:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.btn_get:setVisible(false)

	slot0.has_get = slot1:getChildByName("has_get")

	slot0.has_get:setVisible(false)

	slot0.text_tesk = slot1:getChildByName("text_tesk")

	slot0.text_tesk:setString("")

	slot0.item_goods = slot1:getChildByName("good_cons")

	slot0:updateScrollviewList()

	slot0.title_desc = createRichLabel(24, uv0[2], cc.p(0, 0.5), cc.p(14, 127), nil, nil, 500)

	slot1:addChild(slot0.title_desc)
end

function ActionCommonItem.updateScrollviewList(slot0)
	if slot0.good_scrollview == nil then
		slot0.good_scrollview = CommonScrollViewSingleLayout.new(slot0.item_goods, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.item_goods:getContentSize(), {
			start_y = 4,
			once_num = 1,
			start_x = 3,
			row = 1,
			delay = 4,
			space_x = 5,
			space_y = 4,
			col = 0,
			item_width = BackPackItem.Width * 0.8,
			item_height = BackPackItem.Height * 0.8
		}, cc.p(0, 0))

		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.createNewCell), ScrollViewFuncType.CreateNewCell)
		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.numberOfCells), ScrollViewFuncType.NumberOfCells)
		slot0.good_scrollview:registerScriptHandlerSingle(handler(slot0, slot0.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex)
	end

	slot0.good_scrollview:setSwallowTouches(false)
end

function ActionCommonItem.createNewCell(slot0, slot1, slot2)
	slot3 = BackPackItem.new()

	slot3:setDefaultTip()
	slot3:setSwallowTouches(false)
	slot3:setScale(0.8)

	return slot3
end

function ActionCommonItem.numberOfCells(slot0)
	if not slot0.good_list_data then
		return 0
	end

	return #slot0.good_list_data
end

function ActionCommonItem.updateCellByIndex(slot0, slot1, slot2)
	if not slot0.good_list_data then
		return
	end

	slot1.index = slot2

	if not slot0.good_list_data[slot2] then
		return
	end

	slot1:setData(slot3)
end

function ActionCommonItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.holiday_item_bid and uv0.data then
			uv1:cs16604(uv0.holiday_item_bid, uv0.data.aim)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		uv0:gotoSpecificView()
	end, true, 1)
end

function ActionCommonItem.gotoSpecificView(slot0)
	if slot0.holiday_item_bid and (slot0.holiday_item_bid == ActionRankCommonType.acc_luxury or slot0.holiday_item_bid == ActionRankCommonType.totle_charge or slot0.holiday_item_bid == ActionRankCommonType.limit_charge or slot0.holiday_item_bid == ActionRankCommonType.limit_charge_1 or slot0.holiday_item_bid == ActionRankCommonType.new_totle_charge or slot0.holiday_item_bid == ActionRankCommonType.new_totle_charge1) then
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	elseif slot0.holiday_item_bid and slot0.holiday_item_bid == ActionRankCommonType.luckly_egg then
		if uv0:getActionSubTabVo(ActionRankCommonType.smashegg) and uv0.action_operate then
			uv0.action_operate:handleSelectedTab(uv0.action_operate.tab_list[slot1])
		end
	elseif slot0.holiday_item_bid and slot0.holiday_item_bid == ActionRankCommonType.hero_awake then
		slot2 = HeroController:getInstance():getModel():getAllHeroArray()

		if not HeroController:getInstance():getModel():getTopLevHeroInfoByBid(slot0.cur_bid) or not slot2 or slot2.size == 0 then
			StrongerController:getInstance():clickCallBack(411)
		else
			HeroController:getInstance():openHeroMainInfoWindow(true, slot1, slot2.items, {
				show_model_type = HeroConst.BagTab.eBagHero
			})
		end
	else
		slot1 = nil

		if slot0.holiday_item_bid == ActionRankCommonType.speed_fight then
			slot1 = 132
		elseif slot0.holiday_item_bid == ActionRankCommonType.voyage then
			slot1 = 126
		elseif slot0.holiday_item_bid == ActionRankCommonType.hero_expedit then
			slot1 = 151
		elseif slot0.holiday_item_bid == ActionRankCommonType.epoint_gold then
			slot1 = 123
		elseif slot0.holiday_item_bid == ActionRankCommonType.adventure then
			slot1 = 407
		elseif slot0.holiday_item_bid == ActionRankCommonType.updata_star then
			slot1 = 404
		elseif slot0.holiday_item_bid == ActionRankCommonType.fusion_blessing then
			slot1 = 155
		elseif slot0.holiday_item_bid == ActionRankCommonType.summon_luxury then
			slot1 = 120
		elseif slot0.holiday_item_bid == ActionRankCommonType.recruit_luxury then
			slot1 = 204
		elseif slot0.holiday_item_bid == ActionRankCommonType.planes_rank then
			slot1 = 151
		end

		if slot1 then
			StrongerController:getInstance():clickCallBack(slot1)
		end
	end
end

function ActionCommonItem.setExtendData(slot0, slot1)
	slot0.holiday_item_bid = slot1.bid
	slot0.is_activity_end = slot1.time_end
	slot0.finish = slot1.finish
end

function ActionCommonItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0:getButtonTeskProgress(slot1)
	slot0.title_desc:setString(slot1.aim_str)

	if slot0.holiday_item_bid ~= ActionRankCommonType.longin_gift then
		slot0.btn_goto:setVisible(slot1.status == 0)
	elseif slot1.status == 0 then
		slot0.btn_get:setVisible(true)
		setChildUnEnabled(true, slot0.btn_get)
		slot0.btn_get_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.btn_get)
		slot0.btn_get_label:setColor(Config.ColorData.data_color4[1])
		slot0.btn_get_label:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	if slot0.is_activity_end == true and slot1.status == 0 then
		slot0.btn_goto_label:setString(TI18N("已结束"))
		slot0.btn_goto_label:disableEffect(cc.LabelEffect.OUTLINE)
		setChildUnEnabled(true, slot0.btn_goto)
		slot0.btn_goto:setTouchEnabled(false)
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1.item_list) do
		table.insert(slot3, {
			bid = slot8.bid,
			quantity = slot8.num
		})
	end

	if #slot3 > 4 then
		slot0.good_scrollview:setClickEnabled(true)
	else
		slot0.good_scrollview:setClickEnabled(false)
	end

	slot0.good_list_data = slot3

	slot0.good_scrollview:reloadData()
end

function ActionCommonItem.getButtonTeskProgress(slot0, slot1)
	slot2 = ""

	if slot0.holiday_item_bid ~= ActionRankCommonType.longin_gift then
		slot3, slot4 = nil

		if keyfind("aim_args_key", 4, slot1.aim_args) or nil then
			slot3 = slot5.aim_args_val or 0
		end

		if keyfind("aim_args_key", 5, slot1.aim_args) or nil then
			slot4 = slot6.aim_args_val or 0
		end

		if slot3 and slot4 then
			slot2 = string.format("(%d/%d)", slot4, slot3)
		end

		slot7 = nil

		if keyfind("aim_args_key", 6, slot1.aim_args) or nil then
			slot7 = slot8.aim_args_val or 0
		end

		if slot7 and slot3 then
			slot2 = string.format("(%d/%d)", slot7, slot3)

			if slot3 <= slot7 and slot1.status == 0 then
				slot1.status = 2
			end
		end

		if keyfind("aim_args_key", 18, slot1.aim_args) or nil then
			slot0.cur_bid = slot9.aim_args_val or 0
		end

		if slot0.holiday_item_bid == ActionRankCommonType.acc_luxury then
			if slot1.status == 0 then
				slot2 = "(0/1)"
			else
				slot2 = "(1/1)"
			end
		elseif slot0.holiday_item_bid == ActionRankCommonType.totle_charge or slot0.holiday_item_bid == ActionRankCommonType.totle_consume or slot0.holiday_item_bid == ActionRankCommonType.limit_charge or slot0.holiday_item_bid == ActionRankCommonType.limit_charge_1 or slot0.holiday_item_bid == ActionRankCommonType.summon_luxury or slot0.holiday_item_bid == ActionRankCommonType.recruit_luxury or slot0.holiday_item_bid == ActionRankCommonType.new_totle_charge or slot0.holiday_item_bid == ActionRankCommonType.new_totle_charge1 then
			slot2 = string.format("(%d/%d)", slot0.finish, slot1.aim)
		end
	else
		slot2 = string.format("(%d/%d)", slot0.finish, slot1.aim)
	end

	slot0.text_tesk:setString(slot2)
	slot0.btn_get:setVisible(slot1.status == 1)
	slot0.has_get:setVisible(slot1.status == 2)
end

function ActionCommonItem.DeleteMe(slot0)
	if slot0.good_scrollview then
		slot0.good_scrollview:DeleteMe()

		slot0.good_scrollview = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
