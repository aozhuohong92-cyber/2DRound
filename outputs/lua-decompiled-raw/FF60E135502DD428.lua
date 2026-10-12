QingMingPanel = class("QingMingPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()
slot1 = string.format

function QingMingPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:loadResources()
end

function QingMingPanel.loadResources(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("festivalaction", "festivalaction"),
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

function QingMingPanel.loadResListCompleted(slot0)
	slot0:configUI()
	slot0:register_event()
end

function QingMingPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("festivalaction/qingming_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot2 = slot0.root_wnd:getChildByName("main_container"):getChildByName("title_img")

	if not slot0.festival_bg_load then
		slot0.festival_bg_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/festivalaction", "txt_cn_festival_qingming_panel"), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, uv1, LOADTEXT_TYPE)
			end
		end, slot0.festival_bg_load)
	end

	slot0.btn_tesk = slot1:getChildByName("btn_tesk")

	slot0.btn_tesk:getChildByName("label"):setString(TI18N("收集活跃值"))

	slot0.btn_buy = slot1:getChildByName("btn_buy")

	slot0.btn_buy:getChildByName("label"):setString(TI18N("购买活跃值"))

	slot0.time = slot1:getChildByName("time")
	slot8 = TI18N

	slot1:getChildByName("desc_text"):setString(slot8("期间完成任务获得等量活跃值，累积达到指定数量，可获得奖励"))

	slot0.day_layer = {}

	for slot8 = 1, 7 do
		slot9 = {
			layer_bg = slot1:getChildByName("day_" .. slot8),
			item = BackPackItem.new(nil, true, nil, 0.8, nil, true)
		}

		slot9.layer_bg:addChild(slot9.item)
		slot9.item:setPosition(cc.p(92, 91))
		slot9.item:setIsShowBackground(false)

		slot9.item_num = slot9.layer_bg:getChildByName("item_num")

		slot9.item_num:setString("")
		slot9.item_num:setLocalZOrder(10)

		slot9.num = slot9.layer_bg:getChildByName("num")
		slot9.get_spr = slot9.layer_bg:getChildByName("get_spr")

		slot9.get_spr:setLocalZOrder(11)
		slot9.get_spr:setVisible(false)

		slot9.btn_get = slot9.layer_bg:getChildByName("btn_get")
		slot0.day_layer[slot8] = slot9
	end

	slot0.active_degree_text = slot1:getChildByName("active_degree_text")

	uv0:cs16603(ActionRankCommonType.qingming)
end

function QingMingPanel.register_event(slot0)
	if not slot0.update_qingming_event then
		slot0.update_qingming_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				if slot0 and slot0.finish then
					uv0.active_degree_text:setString(slot0.finish)
				end

				uv0:setFixedData(slot0)
				uv0:setTeskInfo(slot0)

				uv0.qingming_data = slot0
			end
		end)
	end

	registerButtonEventListener(slot0.btn_tesk, function ()
		StrongerController:getInstance():clickCallBack(129)
	end, true, 1)

	function slot4()
		if uv0.qingming_data then
			uv0:setBuyData(uv0.qingming_data)
		end
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_buy, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.day_layer) do
		registerButtonEventListener(slot5.btn_get, function ()
			if uv0.qingming_data and uv0.holiday_bid then
				uv1:cs16604(uv0.holiday_bid, uv0.qingming_data.aim_list[uv2].aim)
			end
		end, false, 1)
	end
end

function QingMingPanel.setFixedData(slot0, slot1)
	if slot0.qingming_data then
		return
	end

	if slot1 and slot1.args and slot1.aim_list then
		slot2, slot3 = nil

		if keyfind("args_key", 1, slot1.args) or nil then
			slot2 = slot4.args_val
		end

		if keyfind("args_key", 2, slot1.args) or nil then
			slot3 = slot5.args_val
		end

		if slot2 and slot3 then
			slot0.time:setString(uv0(TI18N("活动时间：%s 至 %s"), TimeTool.getYMD2(slot2), TimeTool.getYMD2(slot3)))
		end

		for slot9, slot10 in pairs(slot1.aim_list) do
			if Config.ItemData.data_get_data(slot10.item_list[1].bid) and slot0.day_layer[slot10.aim] and slot0.day_layer[slot10.aim].item then
				slot12 = PathTool.getItemRes(slot11.icon)

				if slot11.icon == 3 then
					slot0.day_layer[slot10.aim].item:setScale(0.6)
				else
					slot0.day_layer[slot10.aim].item:setScale(0.75)
				end

				slot0.day_layer[slot10.aim].item:setBaseData(slot10.item_list[1].bid)

				if slot10.item_list[1].num == 1 then
					slot0.day_layer[slot10.aim].item_num:setString("")
				else
					slot0.day_layer[slot10.aim].item_num:setString(slot10.item_list[1].num)
				end
			end

			slot12 = nil

			if keyfind("aim_args_key", 2, slot10.aim_args) or nil then
				slot12 = slot13.aim_args_val
			end

			if slot12 and slot0.day_layer[slot10.aim] and slot0.day_layer[slot10.aim].num then
				slot0.day_layer[slot10.aim].num:setString(slot12)
			end
		end
	end
end

function QingMingPanel.setTeskInfo(slot0, slot1)
	if slot1.aim_list then
		slot0:stopRoundAction()

		for slot5, slot6 in pairs(slot1.aim_list) do
			if slot6.status == 0 then
				slot0.day_layer[slot6.aim].item:setDefaultTip(true)
			elseif slot6.status == 1 then
				slot0.day_layer[slot6.aim].item:setDefaultTip(false)
				slot0.day_layer[slot6.aim].item:addCallBack(function ()
					if uv0.holiday_bid then
						uv1:cs16604(uv0.holiday_bid, uv2.aim_list[uv3].aim)
					end
				end)

				slot8 = cc.RotateTo:create(0.5, 3)
				slot9 = cc.RotateTo:create(0.5, -3)

				slot0.day_layer[slot6.aim].layer_bg:runAction(cc.RepeatForever:create(cc.Sequence:create(slot8, slot9, slot8, slot9, cc.RotateTo:create(0.25, 0), cc.DelayTime:create(0.5))))
			elseif slot6.status == 2 then
				slot0.day_layer[slot6.aim].item:setDefaultTip(false)
				slot0.day_layer[slot6.aim].get_spr:setVisible(true)
				slot0.day_layer[slot6.aim].layer_bg:runAction(cc.Sequence:create(cc.RotateTo:create(0.01, 0)))
			end
		end
	end
end

function QingMingPanel.stopRoundAction(slot0)
	for slot4, slot5 in pairs(slot0.day_layer) do
		if slot5.layer_bg then
			doStopAllActions(slot5.layer_bg)
		end
	end
end

function QingMingPanel.setBuyData(slot0, slot1)
	slot2 = {
		bid = slot1.bid,
		aim = 0,
		item_bid = 80221,
		pay_type = 3,
		name = "活跃值",
		shop_type = MallConst.MallType.FestivalAction,
		is_show_limit_label = true
	}
	slot3 = 0
	slot4 = 0
	slot5 = 0
	slot6 = 0

	if keyfind("args_key", 3, slot1.args) or nil then
		slot4 = slot7.args_val
	end

	slot2.limit_num = slot4

	if keyfind("args_key", 4, slot1.args) or nil then
		slot5 = slot8.args_val
	end

	slot2.has_buy = slot5

	if keyfind("args_key", 5, slot1.args) or nil then
		slot3 = slot9.args_val
	end

	slot2.price = slot3

	if keyfind("args_key", 6, slot1.args) or nil then
		slot6 = slot10.args_val
	end

	slot2.quantity = slot6

	if slot2.limit_num - slot2.has_buy > 0 then
		MallController:getInstance():openMallBuyWindow(true, slot2)
	else
		message(TI18N("今日已购完"))
	end
end

function QingMingPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function QingMingPanel.DeleteMe(slot0)
	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.festival_bg_load then
		slot0.festival_bg_load:DeleteMe()

		slot0.festival_bg_load = nil
	end

	slot0:stopRoundAction()

	if slot0.update_qingming_event then
		GlobalEvent:getInstance():UnBind(slot0.update_qingming_event)

		slot0.update_qingming_event = nil
	end
end
