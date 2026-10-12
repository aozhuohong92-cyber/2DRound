ExchangeWindow = ExchangeWindow or BaseClass(BaseView)
slot0 = table.sort
slot1 = string.format
slot2 = GameNet:getInstance()
slot3 = ExchangeController:getInstance()

function ExchangeWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "exchange/exchange_main_win"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("exchange", "exchange"),
			type = ResourcesType.plist
		}
	}
end

function ExchangeWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)

	slot2 = slot1:getChildByName("bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg", "bigbg_65"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.btn_tips = slot1:getChildByName("btn_tips")
	slot0.object = {}

	for slot8 = 1, 3 do
		slot9 = {
			btn = slot1:getChildByName("btn_" .. slot8),
			get = slot1:getChildByName("get_" .. slot8)
		}

		slot9.get:setVisible(false)

		slot9.remain = slot1:getChildByName("remain_text_" .. slot8)
		slot9.price = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(slot9.btn:getContentSize().width / 2, slot9.btn:getContentSize().height / 2), nil, , )

		slot9.btn:addChild(slot9.price)

		slot9.gold = createRichLabel(22, Config.ColorData.data_color4[1], cc.p(0.5, 0.5), cc.p(({
			95,
			315,
			532
		})[slot8], 294), nil, , )

		slot1:addChild(slot9.gold)

		slot9.tips = createRichLabel(20, cc.c4b(0, 68, 170, 255), cc.p(0.5, 0.5), cc.p(70, 75), 5, nil, )

		slot1:getChildByName("tips_bg_" .. slot8):addChild(slot9.tips)

		slot0.object[slot8] = slot9
	end

	slot0.textTime = slot1:getChildByName("textTime")

	slot1:getChildByName("Text_1"):setString(TI18N("刷新时间:"))
end

function ExchangeWindow.openRootWnd(slot0)
	uv0:send23606()
end

function ExchangeWindow.register_event(slot0)
	function slot4()
		uv0:openExchangeMainView(false)
	end

	slot5 = false

	registerButtonEventListener(slot0.background, slot4, slot5, 2)

	for slot4, slot5 in pairs(slot0.object) do
		registerButtonEventListener(slot5.btn, function ()
			if uv0.exchange_data then
				uv1:send23607(uv0.exchange_data[uv2].id)
			end
		end, true, 1)
	end

	slot0:addGlobalEvent(ExchangeEvent.Extra_Reward, function (slot0)
		uv0:getUpdataRewardItem(slot0)
	end)
	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.MiscData.data_const.touch_gold_tips.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, false, 1)
end

function ExchangeWindow.getUpdataRewardItem(slot0, slot1)
	if not slot1 then
		return
	end

	slot0:setLessTime(slot1.ref_time - uv0:getTime())

	if not slot1.list then
		return
	end

	uv1(slot1.list, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	slot0.exchange_data = slot1.list
	slot3 = Config.ConvertData.data_exchange[slot1.camp_type]

	for slot7, slot8 in pairs(slot1.list) do
		if slot8.max - slot8.num < 0 then
			slot9 = 0
		end

		slot0.object[slot7].remain:setString(TI18N("剩余:  ") .. slot9)
		slot0.object[slot7].gold:setString(uv2("<img src=%s visible=true scale=0.30 /> <div> %d</div>", PathTool.getItemRes(Config.ItemData.data_get_data(2).icon), slot8.gain))

		if slot3 and slot3[slot8.id] then
			slot0.object[slot7].tips:setString(uv2(TI18N("    <img src=%s visible=true scale=0.7 />挂机\n<div fontcolor=#249003>%.1f</div>小时收益"), PathTool.getResFrame("common", "common_2034"), slot3[slot8.id].time / 60))
		end

		if slot9 <= 0 then
			slot0.object[slot7].btn:setVisible(false)
			slot0.object[slot7].get:setVisible(true)
		else
			slot0.object[slot7].btn:setVisible(true)
			slot0.object[slot7].get:setVisible(false)

			slot13 = ""

			slot0.object[slot7].price:setString((slot8.price ~= 0 or uv2(TI18N("<div outline=2,#020019>免费获取</div>"))) and uv2(TI18N("<img src=%s visible=true scale=0.30 />   <div outline=2,#020019>%d 获取</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(3).icon), slot8.price))
		end
	end
end

function ExchangeWindow.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.textTime) then
		return
	end

	slot0.textTime:stopAllActions()

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.textTime:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.textTime:stopAllActions()
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ExchangeWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.textTime:setString(TimeTool.GetTimeFormat(slot1))
	else
		slot0.textTime:setString("00:00:00")
	end
end

function ExchangeWindow.close_callback(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	doStopAllActions(slot0.textTime)
	uv0:openExchangeMainView(false)
end
