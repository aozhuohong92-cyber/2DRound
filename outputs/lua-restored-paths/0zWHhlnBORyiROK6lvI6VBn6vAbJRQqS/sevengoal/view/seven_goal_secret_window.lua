slot0 = {
	cc.c4b(255, 89, 57, 255)
}
SevenGoalSecretWindow = SevenGoalSecretWindow or BaseClass(BaseView)
slot1 = SevenGoalController:getInstance()
slot2 = Config.DayGoalsNewData.data_make_lev_list
slot3 = Config.DayGoalsNewData.data_circle_exp_item
slot4 = Config.DayGoalsNewData.data_charge_list
slot5 = Config.DayGoalsNewData.data_group_list
slot6 = table.insert
slot7 = string.format

function SevenGoalSecretWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "seven_goal/seven_goal_secret_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("seven_goals", "seven_gold"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("seven_goals/banner", "seven_goals_banner_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("seven_goals/banner", "seven_goals_banner_4"),
			type = ResourcesType.single
		}
	}
	slot0.tesk_list = {}
	slot0.totleChargeData = {}
	slot0.role_vo = RoleController:getInstance():getRoleVo()
end

function SevenGoalSecretWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot2 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot2, 1)

	slot0.time_text = slot2:getChildByName("time_text")

	slot0.time_text:setString("")

	slot3 = slot2:getChildByName("role_spr")
	slot0.item_load_charge = loadSpriteTextureFromCDN(slot2:getChildByName("charge_spr"), PathTool.getPlistImgForDownLoad("seven_goals/banner", "seven_goals_banner_3"), ResourcesType.single, slot0.item_load_charge)
	slot6 = slot2:getChildByName("charge_image")
	slot0.btn_more_charge = slot6:getChildByName("btn_more_charge")
	slot0.btn_goto = slot6:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_17"):setString(TI18N("前往"))

	slot0.btn_get = slot6:getChildByName("btn_get")

	slot0.btn_get:setVisible(false)
	slot0.btn_get:getChildByName("Text_17"):setString(TI18N("领取"))

	slot0.has_spr = slot6:getChildByName("has_spr")

	slot0.has_spr:setVisible(false)

	slot0.charge_tesk = createRichLabel(22, uv0[1], cc.p(0, 0.5), cc.p(19, 118), nil, nil, nil)

	slot6:addChild(slot0.charge_tesk)

	slot7 = slot6:getChildByName("good_cons")
	slot0.charge_scrollview = CommonScrollViewLayout.new(slot7, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot7:getContentSize(), {
		start_y = 5,
		start_x = 0,
		need_dynamic = true,
		space_x = 15,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.7,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.7,
		item_height = BackPackItem.Height * 0.7
	})

	slot0.charge_scrollview:setSwallowTouches(false)

	slot10 = slot2:getChildByName("tesk_finish_image")
	slot0.btn_more = slot10:getChildByName("btn_more")
	slot0.red_point = slot0.btn_more:getChildByName("red_point")

	slot0.red_point:setVisible(false)
	slot0.btn_more:getChildByName("Text_18"):setString(TI18N("查看魔盒秘密"))

	slot0.bar = slot10:getChildByName("bar")

	slot0.bar:setScale9Enabled(true)
	slot0.bar:setPercent(0)

	slot0.bar_num = slot10:getChildByName("bar_num")

	slot0.bar_num:setString("")

	slot0.icon_sprite = slot10:getChildByName("icon_sprite")
	slot0.icon_num = slot10:getChildByName("icon_num")

	slot0.icon_num:setString("")

	slot0.btn_tips = slot10:getChildByName("btn_tips")

	slot10:getChildByName("Text_19"):setString(TI18N("已积攒希望印记"))
	slot10:getChildByName("Text_19_0"):setString(TI18N("今日进度"))
	slot10:getChildByName("Text_19_1"):setString(TI18N("每日0点刷新任务"))

	slot0.tesk_panel = slot2:getChildByName("tesk_panel")

	slot0.tesk_panel:setScrollBarEnabled(false)

	slot0.btn_close = slot2:getChildByName("btn_close")
end

function SevenGoalSecretWindow.setChangeLev(slot0, slot1, slot2)
	if uv1[uv0:getModel():getSevenGoalPeriod()] == nil then
		return
	end

	slot4 = 0
	slot2 = slot2 or 1
	slot1 = (slot1 or 1) + 1

	if uv1[slot3] ~= nil then
		slot4 = #uv1[slot3]
	end

	if slot4 <= slot1 then
		slot1 = slot5
	end

	slot0.bar_num:setString(slot2 .. "/" .. uv1[slot3][slot1].exp)
	slot0.bar:setPercent(slot2 / uv1[slot3][slot1].exp * 100)

	if Config.ItemData.data_get_data(uv2[slot3].item_id) then
		loadSpriteTexture(slot0.icon_sprite, PathTool.getItemRes(slot6.icon), LOADTEXT_TYPE)
	end

	slot0.icon_num:setString(slot0.role_vo:getActionAssetsNumByBid(uv2[slot3].item_id) or 0)
end

function SevenGoalSecretWindow.setChangeTotleData(slot0, slot1)
	if slot0:getTotalChargeData() and next(slot2) and slot2[1] and uv0[slot1] then
		slot0.charge_tesk:setString(uv1("%s (%d/%d)", uv0[slot1][slot2[1].id].desc or "", slot2[1].value or 0, slot2[1].target_val or 0))
		slot0.btn_goto:setVisible(slot2[1].finish == 0)
		slot0.btn_get:setVisible(slot2[1].finish == 1)
		slot0.has_spr:setVisible(slot2[1].finish == 2)

		if slot0.charge_scrollview then
			slot7 = {}
			slot11 = slot2[1].id

			for slot11, slot12 in pairs(uv0[slot1][slot11].award) do
				table.insert(slot7, {
					bid = slot12[1],
					quantity = slot12[2]
				})
			end

			if #slot7 > 4 then
				slot0.charge_scrollview:setClickEnabled(true)
			else
				slot0.charge_scrollview:setClickEnabled(false)
			end

			slot0.charge_scrollview:setData(slot7)
			slot0.charge_scrollview:addEndCallBack(function ()
				for slot4, slot5 in pairs(uv0.charge_scrollview:getItemList()) do
					slot5:setDefaultTip()
				end
			end)
		end
	end
end

function SevenGoalSecretWindow.setMoreResPoint(slot0)
	slot1 = false

	if slot0.red_point then
		slot0.red_point:setVisible(uv0:getModel():setMoreResPoint())
	end

	uv0:getModel():checkMainRedPoint()
end

function SevenGoalSecretWindow.register_event(slot0)
	if not slot0.role_secret_event and slot0.role_vo then
		slot0.role_secret_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			slot3 = uv1[uv0:getModel():getSevenGoalPeriod()].item_id or 0

			if slot0 and slot3 and slot0 == slot3 and uv2.role_vo then
				uv2.icon_num:setString(uv2.role_vo:getActionAssetsNumByBid(slot3))
			end
		end)
	end

	slot0:addGlobalEvent(SevenGoalEvent.BaseMessage, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:setChangeLev(slot0.lev, slot0.exp)
		uv0:setLessTime(slot0.end_time - GameNet:getInstance():getTime() or 0)
		uv0:setMoreResPoint()

		slot4 = {}
		uv0.totleChargeData = {}

		if uv1:getModel():getInitSevenGoalData() and uv2[slot0.period or 0] then
			for slot8, slot9 in pairs(slot3) do
				slot10 = false

				for slot14, slot15 in pairs(uv2[slot2]) do
					if slot9.id == slot15.goal_id then
						slot10 = true

						break
					end
				end

				if slot10 == true then
					uv3(uv0.totleChargeData, slot9)
				else
					uv3(slot4, slot9)
				end
			end
		end

		uv0.tesk_panel:setInnerContainerSize(cc.size(624, 543))

		slot5 = uv0.tesk_panel:getInnerContainerSize().height - 118

		for slot9 = 1, 6 do
			delayRun(uv0.tesk_panel, slot9 * 2 / 60, function ()
				if not uv0.tesk_list[uv1] then
					uv0.tesk_list[uv1] = SevenGoalSecretItem.new()

					uv0.tesk_panel:addChild(uv0.tesk_list[uv1])
				end

				if uv0.tesk_list[uv1] then
					uv0.tesk_list[uv1]:setExtendData(uv2)
					uv0.tesk_list[uv1]:setData(uv3[uv1] or {})
					uv0.tesk_list[uv1]:setPosition(103 + 210 * ((uv1 - 1) % 3), uv4 - 282 * math.floor(uv1 / 4))
				end
			end)
		end

		uv0:setChangeTotleData(slot2)
	end)
	slot0:addGlobalEvent(SevenGoalEvent.Tesk_Updata, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		slot3 = {}
		uv1.totleChargeData = {}

		if uv0:getModel():getInitSevenGoalData() and uv2[uv0:getModel():getSevenGoalPeriod()] then
			for slot7, slot8 in pairs(slot1) do
				slot9 = false

				for slot13, slot14 in pairs(uv2[slot2]) do
					if slot8.id == slot14.goal_id then
						slot9 = true

						break
					end
				end

				if slot9 == true then
					uv3(uv1.totleChargeData, slot8)
				else
					uv3(slot3, slot8)
				end
			end
		end

		for slot7 = 1, 6 do
			if uv1.tesk_list[slot7] then
				uv1.tesk_list[slot7]:setExtendData(slot2)
				uv1.tesk_list[slot7]:setData(slot3[slot7])
			end
		end

		uv1:setChangeTotleData(slot2)
	end)
	slot0:addGlobalEvent(SevenGoalEvent.Reward_Lev, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:setMoreResPoint()
	end)
	slot0:addGlobalEvent(SevenGoalEvent.Updata_Lev, function (slot0)
		if not slot0 or next(slot0) == nil then
			return
		end

		uv0:getModel():setSevenGoalLev(slot0.lev)
		uv1:setMoreResPoint()
		uv1:setChangeLev(slot0.lev, slot0.exp)
	end)
	registerButtonEventListener(slot0.btn_close, function ()
		uv0:openSevenGoalSecretView(false)
	end, true, 2)
	registerButtonEventListener(slot0.btn_more_charge, function ()
		uv0:openSevenGoalTotleChargeView(true)
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		StrongerController:getInstance():clickCallBack(131)
	end, true, 1)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0:getTotalChargeData()[1].id then
			uv1:sender13606(slot1)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.DayGoalsNewData.data_constant.tips_1.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end, true, 1, nil, 0.8)
	registerButtonEventListener(slot0.btn_more, function ()
		uv0:openSevenGoalAdventureLevRewardView(true)
	end, true, 1)
end

function SevenGoalSecretWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_text) then
		return
	end

	doStopAllActions(slot0.time_text)

	if (slot1 or 0) > 0 then
		slot0:setTimeFormatString(slot2)
		slot0.time_text:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_text)
				uv1.time_text:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function SevenGoalSecretWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_text:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot1))
	else
		slot0.time_text:setString("00:00:00")
	end
end

function SevenGoalSecretWindow.getTotalChargeData(slot0)
	return slot0.totleChargeData or {}
end

function SevenGoalSecretWindow.openRootWnd(slot0)
	uv0:sender13604()
end

function SevenGoalSecretWindow.close_callback(slot0)
	doStopAllActions(slot0.tesk_panel)

	if slot0.item_load_role then
		slot0.item_load_role:DeleteMe()

		slot0.item_load_role = nil
	end

	if slot0.item_load_charge then
		slot0.item_load_charge:DeleteMe()

		slot0.item_load_charge = nil
	end

	if slot0.charge_scrollview then
		slot0.charge_scrollview:DeleteMe()
	end

	slot0.charge_scrollview = nil

	if slot0.tesk_list then
		for slot4, slot5 in pairs(slot0.tesk_list) do
			slot5:DeleteMe()
		end

		slot0.tesk_list = nil
	end

	if slot0.role_secret_event then
		slot0.role_vo:UnBind(slot0.role_secret_event)

		slot0.role_secret_event = nil
	end

	uv0:openSevenGoalSecretView(false)
end

SevenGoalSecretItem = class("SevenGoalSecretItem", function ()
	return ccui.Widget:create()
end)

function SevenGoalSecretItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function SevenGoalSecretItem.configUI(slot0)
	slot0.rootWnd = createCSBNote(PathTool.getTargetCSB("seven_goal/seven_goal_secret_item"))

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:addChild(slot0.rootWnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(212, 260))

	slot1 = slot0.rootWnd:getChildByName("main_container")
	slot0.finish_spr = slot1:getChildByName("finish_spr")

	slot0.finish_spr:setVisible(false)
	slot0.finish_spr:setLocalZOrder(10)

	slot0.name = slot1:getChildByName("name")

	slot0.name:setString("")

	slot0.tesk_num = slot1:getChildByName("tesk_num")

	slot0.tesk_num:setString("")

	slot0.btn_goto = slot1:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_2"):setString(TI18N("前往"))

	slot0.btn_get = slot1:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_2"):setString(TI18N("领取"))

	slot0.reward_item = BackPackItem.new(nil, true, nil, 0.8)

	slot1:addChild(slot0.reward_item)
	slot0.reward_item:setPosition(cc.p(slot1:getContentSize().width / 2, 131))
	slot0.reward_item:setDefaultTip()
end

function SevenGoalSecretItem.setExtendData(slot0, slot1)
	slot0.cur_secret_period = slot1
end

function SevenGoalSecretItem.setData(slot0, slot1)
	if not slot1 or next(slot1) == nil then
		return
	end

	slot0.data = slot1

	slot0.tesk_num:setString(uv0("(%d/%d)", slot1.value, slot1.target_val))

	if not uv1[slot0.cur_secret_period] then
		return
	end

	slot3 = ""

	if uv1[slot0.cur_secret_period][slot1.id] then
		slot3 = uv1[slot0.cur_secret_period][slot1.id].desc
	end

	slot0.name:setString(slot3)

	if uv1[slot0.cur_secret_period][slot1.id] then
		slot0.reward_item:setBaseData(uv1[slot0.cur_secret_period][slot1.id].award[1][1], uv1[slot0.cur_secret_period][slot1.id].award[1][2])
	end

	slot0.btn_goto:setVisible(slot1.finish == 0)
	slot0.btn_get:setVisible(slot1.finish == 1)
	slot0.finish_spr:setVisible(slot1.finish == 2)
end

function SevenGoalSecretItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.data and uv0.data.id then
			uv1:sender13606(uv0.data.id)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		if uv0.cur_secret_period and uv0.data and uv0.data.id then
			slot0 = nil

			if uv1[uv0.cur_secret_period][uv0.data.id] and uv1[uv0.cur_secret_period][uv0.data.id].show_icon then
				StrongerController:getInstance():clickCallBack(slot0)
			end
		end
	end, true, 1)
end

function SevenGoalSecretItem.DeleteMe(slot0)
	if slot0.reward_item then
		slot0.reward_item:DeleteMe()

		slot0.reward_item = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
