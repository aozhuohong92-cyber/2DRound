OnlineGiftWindow = OnlineGiftWindow or BaseClass(BaseView)
slot0 = OnlineGiftController:getInstance()
slot1 = Config.MiscData.data_get_time_items
slot2 = Config.MiscData.data_get_time_items_length

function OnlineGiftWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.layout_name = "onlinegift/onlinegift_windows"
	slot0.win_type = WinType.Tips
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_online_gift"),
			type = ResourcesType.single
		}
	}
	slot0.item_list = {}
end

function OnlineGiftWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", "txt_cn_online_gift"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot0.textTime = slot0.main_container:getChildByName("textTime")

	slot0.main_container:getChildByName("Text_1"):setString(TI18N("下档奖励: "))
	UITool.SetLightColor(slot0.main_container:getChildByName("Text_1"))

	slot0.goods_con = slot0.main_container:getChildByName("goods_con")

	slot0.goods_con:setScrollBarEnabled(false)
	slot0:getOnlineItems()
end

function OnlineGiftWindow.getOnlineItems(slot0)
	slot0.goods_con:setInnerContainerSize(cc.size(511, 107.10000000000001 * math.floor(uv0 / 4) + 30))

	slot1 = slot0.goods_con:getInnerContainerSize().height - 60

	for slot5 = 1, uv0 do
		if not slot0.item_list[slot5] then
			slot0.item_list[slot5] = BackPackItem.new(true, true, nil, 0.9)

			slot0.item_list[slot5]:setAnchorPoint(0, 0.5)
			slot0.goods_con:addChild(slot0.item_list[slot5])
		end

		if slot0.item_list[slot5] and uv1[slot5] then
			slot6 = (slot5 - 1) % 4

			slot0.item_list[slot5]:setPosition(cc.p(19 + BackPackItem.Width * slot6 + slot6 * 15, slot1 - BackPackItem.Height * math.floor((slot5 - 1) / 4)))
			slot0.item_list[slot5]:setBaseData(uv1[slot5].items[1][1], uv1[slot5].items[1][2])
			slot0.item_list[slot5]:addCallBack(function ()
				uv0:sender10927(uv1[uv2].index)
			end)
		end
	end
end

function OnlineGiftWindow.setLessTime(slot0, slot1)
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
				uv1.textTime:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function OnlineGiftWindow.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.textTime:setString(TimeTool.GetTimeFormat(slot1))
	else
		slot0.textTime:setString("00:00:00")
	end
end

function OnlineGiftWindow.register_event(slot0)
	slot0:addGlobalEvent(OnlineGiftEvent.Get_Data, function (slot0)
		uv0:updataGetItem(slot0)
	end)
	slot0:addGlobalEvent(OnlineGiftEvent.Updata_Data, function (slot0)
		slot1 = 1

		for slot5, slot6 in pairs(uv0) do
			if slot6.time == slot0 then
				slot1 = slot5
			end
		end

		uv1.item_list[slot1]:showExtendTag(true, TI18N("已领取"))
		setChildUnEnabled(true, uv1.item_list[slot1])
		uv1.item_list[slot1]:showItemEffect(false, 263, PlayerAction.action_1, true, 1.1)
		uv1.item_list[slot1]:setDefaultTip(false)
		uv1.item_list[slot1]:showStrTips(false)
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openOnlineGiftView(false)
	end, false, 2)
	registerButtonEventListener(slot0.main_container, function ()
		uv0:openOnlineGiftView(false)
	end, false, 2)
end

function OnlineGiftWindow.updataGetItem(slot0, slot1)
	slot0.data = slot1
	slot0.dic_time = {}

	for slot5, slot6 in ipairs(slot1.list) do
		slot0.dic_time[slot6.time] = true
	end

	slot2 = false
	slot3 = 0

	for slot7, slot8 in ipairs(uv0) do
		if slot8.time <= slot1.time then
			slot3 = slot7
		end

		if slot0.item_list[slot7] then
			if slot0.dic_time[slot8.time] then
				slot0.item_list[slot7]:showExtendTag(true, TI18N("已领取"), true)
				setChildUnEnabled(true, slot0.item_list[slot7])
				slot0.item_list[slot7]:setDefaultTip(false)
			elseif slot7 <= slot3 then
				slot0.item_list[slot7]:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)

				if not slot2 then
					slot2 = true

					slot0.item_list[slot7]:showStrTips(true, TI18N("可领取"))
				end

				slot0.item_list[slot7]:setDefaultTip(false)
			else
				slot0.item_list[slot7]:setDefaultTip(true)
			end
		end
	end

	if uv0[uv1].time <= slot1.time then
		slot0:setLessTime(0)
	else
		slot0:setLessTime(uv0[slot3 + 1].time - slot1.time)
	end
end

function OnlineGiftWindow.openRootWnd(slot0)
	uv0:sender10926()
end

function OnlineGiftWindow.close_callback(slot0)
	if slot0.item_list and next(slot0.item_list or {}) ~= nil then
		for slot4, slot5 in ipairs(slot0.item_list) do
			if slot5.DeleteMe then
				slot5:DeleteMe()
			end
		end
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()
	end

	slot0.item_load = nil

	doStopAllActions(slot0.textTime)
	uv0:openOnlineGiftView(false)
end
