ActionSkinLotteryPanel = class("ActionSkinLotteryPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = Config.HolidaySkinDrawData.data_lottery_msg
slot2 = Config.HolidaySkinDrawData.data_consum_count
slot3 = {
	{
		235,
		567
	},
	{
		180,
		443
	},
	{
		289,
		443
	},
	{
		124,
		335
	},
	{
		233,
		335
	},
	{
		338,
		335
	},
	{
		71,
		220
	},
	{
		179,
		220
	},
	{
		285,
		220
	},
	{
		390,
		220
	}
}
slot4 = {
	1,
	0.8,
	0.8,
	0.8,
	0.8,
	0.8,
	0.8,
	0.8,
	0.8,
	0.8
}
slot5 = {
	1.2,
	1.1,
	1.1,
	1,
	1,
	1,
	1,
	1,
	1,
	1
}

function ActionSkinLotteryPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1
	slot0.item_list = {}
	slot0.cur_count = nil
	slot0.is_lottery_start = nil
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("elitesummon", "elitesummon"),
			type = ResourcesType.plist
		}
	}
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function ActionSkinLotteryPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function ActionSkinLotteryPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_skin_lottery_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot1 = slot0.main_container:getChildByName("image_bg")
	slot2 = "txt_cn_hero_skin_lottery"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot3.aim_title ~= "" and slot3.aim_title then
		slot2 = slot3.aim_title
	end

	if not slot0.bg_load then
		slot0.bg_load = loadSpriteTextureFromCDN(slot1, PathTool.getPlistImgForDownLoad("bigbg/action", slot2), ResourcesType.single, slot0.bg_load)
	end

	slot0.icon = slot0.main_container:getChildByName("icon")
	slot0.icon_text = slot0.main_container:getChildByName("icon_text")

	slot0.icon_text:setString("")

	slot0.btn_rule = slot0.main_container:getChildByName("btn_rule")
	slot0.btn_video = slot0.main_container:getChildByName("btn_video")

	slot0.btn_video:setScale(1)

	slot5 = slot0.btn_video:getChildByName("Text_1")

	slot5:setString(TI18N("皮肤预览"))
	slot5:setFontSize(20)
	UITool.SetTitleColor(slot5)
	slot0.btn_video:setVisible(false)

	slot0.btn_lottery = slot0.main_container:getChildByName("btn_lottery")
	slot0.btn_lottery_label = slot0.btn_lottery:getChildByName("Text_2")

	slot0.btn_lottery_label:setString(TI18N("征兵1次"))
	UITool.SetTitleColor(slot0.btn_lottery_label)

	slot0.btn_lottery_item = createRichLabel(18, cc.c4b(255, 255, 255, 255), cc.p(0.5, 0.5), cc.p(118, 21), nil, , 180)

	slot0.btn_lottery:addChild(slot0.btn_lottery_item)
	slot0.main_container:getChildByName("Text_3"):setString(TI18N("剩余时间："))

	slot0.time_text = slot0.main_container:getChildByName("time_text")

	slot0.time_text:setString("")
	uv0:sender26601()
end

function ActionSkinLotteryPanel.setData(slot0)
	if not slot0.lottery_id then
		return
	end

	if uv0 and uv0[slot0.lottery_id] then
		slot0.lottery_iten_id = uv0[slot0.lottery_id].lottery_item

		if Config.ItemData.data_get_data(slot0.lottery_iten_id) then
			loadSpriteTexture(slot0.icon, PathTool.getItemRes(slot1.icon), LOADTEXT_TYPE)
			slot0.icon:setScale(0.4)
		end

		slot0.icon_text:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.lottery_iten_id))
	end

	if Config.HolidaySkinDrawData.data_lottery_stock and slot1[slot0.lottery_id] then
		slot2 = {}

		for slot6, slot7 in pairs(slot1[slot0.lottery_id]) do
			table.insert(slot2, slot7)
		end

		table.sort(slot2, function (slot0, slot1)
			return slot0.sort < slot1.sort
		end)

		slot3 = uv1:getModel()

		for slot7 = 1, 10 do
			if not slot0.item_list[slot7] then
				delayRun(slot0.main_container, slot7 * 2 / display.DEFAULT_FPS, function ()
					if not uv0.item_list[uv1] then
						slot0 = BackPackItem.new(nil, true)

						slot0:setAnchorPoint(0.5, 0.5)
						uv0.main_container:addChild(slot0)

						uv0.item_list[uv1] = slot0
					end

					if uv0.item_list[uv1] then
						uv0.item_list[uv1]:setPosition(uv2[uv1][1], uv2[uv1][2])
						uv0.item_list[uv1]:setBaseData(uv3[uv1].reward_id, uv3[uv1].num)
						uv0.item_list[uv1]:setScale(uv4[uv1])
						uv0.item_list[uv1]:setDefaultTip()
						uv0.item_list[uv1]:setSelfBackground(0)
						uv0.item_list[uv1]:setBackgroundOpacity(128)

						if uv5:getLotteryItemData(uv3[uv1].sort) == 1 then
							uv0.item_list[uv1]:IsGetStatus(true, 128)
						else
							uv0.item_list[uv1]:IsGetStatus(false)
						end
					end
				end)
			end
		end

		slot0.item_effect = createSprite(PathTool.getResFrame("elitesummon", "elitesummon_6"), uv2[1][1], uv2[1][2], slot0.main_container, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 10)

		slot0.item_effect:setScale(uv4[1])
		slot0.item_effect:setOpacity(200)

		slot0.is_lottery_start = true
	end
end

function ActionSkinLotteryPanel.register_event(slot0)
	if not slot0.lottery_skin_msg then
		slot0.lottery_skin_msg = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_SKIN_LOTTERY_MSG, function (slot0)
			if not slot0 then
				return
			end

			uv0.lottery_id = slot0.lottery_id

			uv0:btnLotteryCount(slot0.time)

			if uv1[uv0.lottery_id] and slot0.time >= #uv1[uv0.lottery_id] then
				slot0.time = #uv1[uv0.lottery_id]
			end

			uv0.cur_count = slot0.time

			uv0:setData()
			FestivalActionConst.CountDownTime(uv0.time_text, {
				time_model = 2,
				less_time = slot0.last_time
			})
		end)
	end

	if not slot0.lottery_skin_get then
		slot0.lottery_skin_get = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_SKIN_LOTTERY_GET, function (slot0)
			if not slot0 then
				return
			end

			uv0.cur_count = slot0.time

			uv0:clearRunLotteryTicker()
			uv0:runItemEffectAction(slot0.sort)
		end)
	end

	if not slot0.lottery_skin_rewawrd then
		slot0.lottery_skin_rewawrd = GlobalEvent:getInstance():Bind(ActionEvent.ACTION_SKIN_LOTTERY_REWARD, function ()
			uv0:btnLotteryCount(uv0.cur_count)
			uv0:changeLotteryItem()

			uv0.is_lottery_start = true

			uv0:clearIsStartTicker()
		end)
	end

	registerButtonEventListener(slot0.btn_lottery, function ()
		if not uv0.is_lottery_start then
			message(TI18N("点击过快~~~~"))
		end

		if uv0.is_lottery_start then
			uv0.is_lottery_start = nil

			if uv0.is_start_ticket == nil then
				uv0.is_start_ticket = GlobalTimeTicket:getInstance():add(function ()
					uv0.is_lottery_start = true

					uv0:clearIsStartTicker()
				end, 6)
			end

			uv0:btnLotterySendProtocal()
		end
	end, true)
	registerButtonEventListener(slot0.btn_rule, function (slot0, slot1, slot2)
		if uv0.lottery_id and uv1 and uv1[uv0.lottery_id] then
			TipsManager:getInstance():showCommonTips(uv1[uv0.lottery_id].desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, true)
	registerButtonEventListener(slot0.btn_video, function ()
		TimesummonController:getInstance():send23219(uv0.holiday_bid)
	end, true, nil, , 0.9)

	if not slot0.grade_count_add_event then
		slot0.grade_count_add_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:changeLotteryCount(slot1)
		end)
	end

	if not slot0.grade_count_delete_event then
		slot0.grade_count_delete_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:changeLotteryCount(slot1)
		end)
	end

	if not slot0.grade_count_modify_event then
		slot0.grade_count_modify_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:changeLotteryCount(slot1)
		end)
	end
end

function ActionSkinLotteryPanel.changeLotteryCount(slot0, slot1)
	if not slot0.lottery_iten_id then
		return
	end

	for slot5, slot6 in pairs(slot1) do
		if slot6.base_id == slot0.lottery_iten_id then
			slot0.icon_text:setString(BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.lottery_iten_id))
		end
	end
end

function ActionSkinLotteryPanel.runItemEffectAction(slot0, slot1)
	slot0.pos = 0
	slot0.runProcess = 0
	slot0.process = 0
	slot0.speed = 1
	slot0.addSpeed = 0
	slot0.targetPos = slot1 - 1
	slot0.step = 0

	if slot0.lottery_ticket == nil then
		slot0.lottery_ticket = GlobalTimeTicket:getInstance():add(function ()
			uv0:runHandler()
		end, 0.05)
	end
end

slot6 = 10

function ActionSkinLotteryPanel.runHandler(slot0)
	if slot0.step == 0 then
		slot0.process = slot0.process + 0.33

		if slot0.process >= 5 then
			slot0.step = 1
		end
	elseif slot0.step == 1 then
		slot0.process = slot0.process + slot0.speed

		if slot0.process > uv0 * 5 and slot0.targetPos > -1 then
			slot0.startPos = slot0.pos
			slot0.process = 0
			slot0.speed = 0.4
			slot0.runProcess = slot0.targetPos - slot0.pos
			slot0.addSpeed = -slot0.speed * slot0.speed * 0.5 / slot0.runProcess
			slot0.step = 2
		end
	elseif slot0.step == 2 then
		slot0.speed = slot0.speed + slot0.addSpeed
		slot0.process = (slot0.speed + slot0.speed) * 0.5 + slot0.process

		if slot0.runProcess <= slot0.process or slot0.speed < 0.01 then
			slot0.speed = 0
			slot0.process = slot0.runProcess

			slot0:clearRunLotteryTicker()
			slot0:DelayTimeSendProtocal()

			if slot0.delaytime_send_protocal == nil then
				slot0.delaytime_send_protocal = GlobalTimeTicket:getInstance():add(function ()
					uv0:sender26602()
					uv1:DelayTimeSendProtocal()
				end, 0.5)
			end
		end
	end

	slot1, slot2 = math.modf(slot0.process, uv0)

	slot0:setPos(slot1)
end

slot7 = {
	[0] = 1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	1
}

function ActionSkinLotteryPanel.DelayTimeSendProtocal(slot0)
	if slot0.delaytime_send_protocal ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.delaytime_send_protocal)

		slot0.delaytime_send_protocal = nil
	end
end

function ActionSkinLotteryPanel.clearRunLotteryTicker(slot0)
	if slot0.lottery_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.lottery_ticket)

		slot0.lottery_ticket = nil
	end
end

function ActionSkinLotteryPanel.clearIsStartTicker(slot0)
	if slot0.is_start_ticket ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.is_start_ticket)

		slot0.is_start_ticket = nil
	end
end

function ActionSkinLotteryPanel.setPos(slot0, slot1)
	if slot1 < 0 then
		slot1 = slot1 + uv0
	elseif uv0 <= slot1 then
		slot1 = slot1 % uv0
	end

	if slot0.item_effect then
		slot0.item_effect:setScale(uv1[uv2[slot1]])
		slot0.item_effect:setPosition(cc.p(uv3[uv2[slot1]][1], uv3[uv2[slot1]][2]))
	end
end

function ActionSkinLotteryPanel.btnLotteryCount(slot0, slot1)
	if not slot0.lottery_id then
		return
	end

	if not slot1 then
		return
	end

	slot2 = slot1

	if uv0 and uv0[slot0.lottery_id] then
		if slot1 > #uv0[slot0.lottery_id] then
			slot2 = #uv0[slot0.lottery_id]
		end

		if uv0[slot0.lottery_id][slot2] then
			slot0.btn_lottery_item:setString(string.format(TI18N("<img src=%s visible=true scale=0.30 />x %d"), PathTool.getItemRes(Config.ItemData.data_get_data(slot3.loss_id).icon), slot3.num))

			if slot1 > #uv0[slot0.lottery_id] then
				setChildUnEnabled(true, slot0.btn_lottery)
				slot0.btn_lottery:setTouchEnabled(false)
				slot0.btn_lottery_label:disableEffect(cc.LabelEffect.OUTLINE)
			end
		end
	end
end

function ActionSkinLotteryPanel.changeLotteryItem(slot0)
	if slot0.item_list then
		for slot5, slot6 in pairs(slot0.item_list) do
			if slot0.item_list[slot5] then
				if uv0:getModel():getLotteryItemData(slot5) == 1 then
					slot0.item_list[slot5]:IsGetStatus(true, 128)
				else
					slot0.item_list[slot5]:IsGetStatus(false)
				end
			end
		end
	end
end

function ActionSkinLotteryPanel.btnLotterySendProtocal(slot0)
	if not slot0.lottery_iten_id then
		return
	end

	if not slot0.lottery_id then
		return
	end

	if uv0 and uv0[slot0.lottery_id] and uv0[slot0.lottery_id][slot0.cur_count] then
		if slot1.num <= BackpackController:getInstance():getModel():getBackPackItemNumByBid(slot0.lottery_iten_id) then
			uv1:sender26600()
		else
			slot3 = slot1.num - slot2
			slot4 = nil

			if uv2 and uv2[slot0.lottery_id] then
				slot4 = string.format(TI18N("祈愿还差<img src=%s visible=true scale=0.35 /> *%d个，是否消耗 <img src=%s visible=true scale=0.35 /><div fontColor=#289b14 fontsize=26> *%d</div> 补足并进行祈愿"), PathTool.getItemRes(Config.ItemData.data_get_data(slot0.lottery_iten_id).icon), slot3, PathTool.getItemRes(3), slot3 * uv2[slot0.lottery_id].star_diammond[1][2])
			end

			if slot4 then
				CommonAlert.show(slot4, TI18N("确定"), function ()
					uv0:sender26600()
				end, TI18N("取消"), function ()
					uv0.is_lottery_start = true

					uv0:clearIsStartTicker()
				end, CommonAlert.type.rich)
			end
		end
	end
end

function ActionSkinLotteryPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionSkinLotteryPanel.DeleteMe(slot0)
	if slot0.bg_load then
		slot0.bg_load:DeleteMe()

		slot0.bg_load = nil
	end

	slot0:clearIsStartTicker()
	slot0:clearRunLotteryTicker()
	slot0:DelayTimeSendProtocal()
	doStopAllActions(slot0.time_text)
	doStopAllActions(slot0.main_container)

	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5 and slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.lottery_skin_msg then
		GlobalEvent:getInstance():UnBind(slot0.lottery_skin_msg)

		slot0.lottery_skin_msg = nil
	end

	if slot0.lottery_skin_get then
		GlobalEvent:getInstance():UnBind(slot0.lottery_skin_get)

		slot0.lottery_skin_get = nil
	end

	if slot0.lottery_skin_rewawrd then
		GlobalEvent:getInstance():UnBind(slot0.lottery_skin_rewawrd)

		slot0.lottery_skin_rewawrd = nil
	end

	if slot0.grade_count_add_event then
		GlobalEvent:getInstance():UnBind(slot0.grade_count_add_event)

		slot0.grade_count_add_event = nil
	end

	if slot0.grade_count_delete_event then
		GlobalEvent:getInstance():UnBind(slot0.grade_count_delete_event)

		slot0.grade_count_delete_event = nil
	end

	if slot0.grade_count_modify_event then
		GlobalEvent:getInstance():UnBind(slot0.grade_count_modify_event)

		slot0.grade_count_modify_event = nil
	end
end
