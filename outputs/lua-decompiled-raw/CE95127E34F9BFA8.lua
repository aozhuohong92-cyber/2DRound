ActionLimitCommonPanel = class("ActionLimitCommonPanel", function ()
	return ccui.Widget:create()
end)
slot0 = ActionController:getInstance()

function ActionLimitCommonPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitCommonPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_common_panel"))

	slot0.root_wnd:setPosition(-40, -105)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.main_container_size = slot0.main_container:getContentSize()
	slot1 = slot0.main_container:getChildByName("title_con")

	slot1:getChildByName("time_title"):setString(TI18N("剩余时间:"))

	slot0.time_val = slot1:getChildByName("time_val")
	slot0.goods_con = slot0.main_container:getChildByName("goods_con")
	slot2 = slot1:getChildByName("title_img")
	slot3 = "txt_cn_welfare_banner15"

	if slot0.holiday_bid == ActionRankCommonType.updata_star then
		slot3 = "txt_cn_welfare_banner16"
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getWelfareBannerRes(slot3), ResourcesType.single, function ()
			if not tolua.isnull(uv0) then
				loadSpriteTexture(uv0, PathTool.getWelfareBannerRes(uv1), LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot4 = slot0.goods_con:getContentSize()
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(slot4.width, slot4.height), {
		start_y = 0,
		item_width = 688,
		start_x = 0,
		space_x = 0,
		row = 0,
		item_height = 152,
		space_y = 0,
		col = 1,
		need_dynamic = true,
		item_class = ActionLimitCommonItem
	})

	slot0.item_scrollview:setSwallowTouches(false)
end

function ActionLimitCommonPanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	doStopAllActions(slot0.time_val)

	if slot1 > 0 then
		slot0:setTimeFormatString(slot1)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				doStopAllActions(uv1.time_val)
				uv1.time_val:setString("00:00:00")
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot1)
	end
end

function ActionLimitCommonPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(TimeTool.GetTimeFormatDayIIIIIIII(slot1))
	else
		slot0.time_val:setString("00:00:00")
	end
end

function ActionLimitCommonPanel.register_event(slot0)
	if not slot0.limin_common_event then
		slot0.limin_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				uv1:getModel():sortItemList(slot0.aim_list)
				uv0.item_scrollview:setData(slot0.aim_list, nil, , {
					bid = slot0.bid
				})

				if slot0.remain_sec <= 0 then
					slot2 = 0
				end

				uv0:setLessTime(slot2)
			end
		end)
	end
end

function ActionLimitCommonPanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		uv0:cs16603(slot0.holiday_bid)
	end
end

function ActionLimitCommonPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.limin_common_event then
		GlobalEvent:getInstance():UnBind(slot0.limin_common_event)

		slot0.limin_common_event = nil
	end

	doStopAllActions(slot0.time_val)

	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil
end

ActionLimitCommonItem = class("ActionLimitCommonItem", function ()
	return ccui.Widget:create()
end)

function ActionLimitCommonItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitCommonItem.configUI(slot0)
	slot0.size = cc.size(688, 152)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("action/action_limit_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("main_container")
	slot0.btn_goto = slot2:getChildByName("btn_goto")

	slot0.btn_goto:getChildByName("Text_6"):setString(TI18N("前往"))
	slot0.btn_goto:setVisible(false)

	slot0.btn_get = slot2:getChildByName("btn_get")

	slot0.btn_get:getChildByName("Text_5"):setString(TI18N("领取"))
	slot0.btn_get:setVisible(false)

	slot0.btn_has = slot2:getChildByName("btn_has")

	slot0.btn_has:setVisible(false)

	slot0.goods_con = slot2:getChildByName("good_cons")
	slot0.item_scrollview_son = CommonScrollViewLayout.new(slot0.goods_con, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.top, slot0.goods_con:getContentSize(), {
		start_y = 0,
		start_x = 0,
		space_x = 0,
		row = 1,
		space_y = 0,
		col = 0,
		scale = 0.8,
		item_class = BackPackItem,
		item_width = BackPackItem.Width * 0.8,
		item_height = BackPackItem.Height * 0.8
	})

	slot0.item_scrollview_son:setSwallowTouches(false)

	slot0.title_desc = createRichLabel(24, cc.c4b(90, 58, 38, 255), cc.p(0, 0.5), cc.p(14, 129), nil, , 400)

	slot2:addChild(slot0.title_desc)

	slot0.goal_desc = createRichLabel(24, cc.c4b(104, 69, 42, 255), cc.p(0.5, 0.5), cc.p(596, 127), nil, , 400)

	slot2:addChild(slot0.goal_desc)
end

function ActionLimitCommonItem.register_event(slot0)
	registerButtonEventListener(slot0.btn_get, function ()
		if uv0.holiday_item_bid and uv0.data then
			uv0.ctrl:cs16604(uv0.holiday_item_bid, uv0.data.aim)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_goto, function ()
		slot0 = nil

		if uv0.holiday_item_bid == ActionRankCommonType.updata_star then
			slot0 = 404
		elseif uv0.holiday_item_bid == ActionRankCommonType.fusion_blessing then
			slot0 = 155
		end

		StrongerController:getInstance():clickCallBack(slot0)
	end, true, 1)
end

function ActionLimitCommonItem.setExtendData(slot0, slot1)
	slot0.holiday_item_bid = slot1.bid
end

function ActionLimitCommonItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0.title_desc:setString(slot1.aim_str)

	slot2 = keyfind("aim_args_key", 6, slot1.aim_args) or 0
	slot3 = keyfind("aim_args_key", 4, slot1.aim_args) or 0

	slot0.goal_desc:setString(string.format("(<div fontColor=#2c7d08>%d</div>/%d)", slot2.aim_args_val, slot3.aim_args_val))

	if slot3.aim_args_val <= slot2.aim_args_val and slot1.status == 0 then
		slot1.status = 2
	end

	slot0.btn_goto:setVisible(slot1.status == 0)
	slot0.btn_get:setVisible(slot1.status == 1)
	slot0.btn_has:setVisible(slot1.status == 2)

	slot6 = {}

	for slot10, slot11 in pairs(slot1.item_list) do
		if deepCopy(Config.ItemData.data_get_data(slot11.bid)) then
			slot12.quantity = slot11.num

			table.insert(slot6, slot12)
		end
	end

	slot0.item_scrollview_son:setData(slot6)
	slot0.item_scrollview_son:addEndCallBack(function ()
		for slot4, slot5 in pairs(uv0.item_scrollview_son:getItemList()) do
			slot5:setDefaultTip()
			slot5:setSwallowTouches(false)
		end
	end)
end

function ActionLimitCommonItem.DeleteMe(slot0)
	if slot0.item_scrollview_son then
		slot0.item_scrollview_son:DeleteMe()

		slot0.item_scrollview_son = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
