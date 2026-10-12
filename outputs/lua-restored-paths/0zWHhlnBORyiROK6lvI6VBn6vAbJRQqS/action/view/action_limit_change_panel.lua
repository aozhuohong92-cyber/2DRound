ActionLimitChangePanel = class("ActionLimitChangePanel", function ()
	return ccui.Widget:create()
end)
slot0 = Config.FunctionData.data_limit_change_const
slot1 = table.sort
slot2 = string.format
slot3 = ActionController:getInstance()

function ActionLimitChangePanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()

	slot0.action_item_id = 80101
end

function ActionLimitChangePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_change_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot1 = "txt_cn_action_limit_change_panel"

	if uv0[slot0.holiday_bid] then
		slot1 = slot2.bg_name
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, function ()
			if not tolua.isnull(uv0.title_img) then
				loadSpriteTexture(uv0.title_img, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()
	slot4 = slot0.main_container:getChildByName("dec_node")
	slot0.dec_val = createRichLabel(20, nil, cc.p(0, 1), cc.p(0, 0), 12, nil, 540)
	slot0.dec_title = slot0.main_container:getChildByName("dec_title")
	slot5 = slot0.main_container:getChildByName("item_dec_label")
	slot6 = "ffcf90ff"

	if slot2 then
		slot6 = slot2.title_color
	end

	slot7 = slot0:colorChangeData(slot6)

	slot0.dec_val:setColor(slot7)
	slot4:addChild(slot0.dec_val)
	slot0.dec_title:setColor(slot7)
	slot0.dec_title:setString(TI18N("活动规则"))

	slot8 = "ffcf90ff"

	if slot2 then
		slot8 = slot2.has_prop_color
	end

	slot5:setColor(slot0:colorChangeData(slot8))
	slot5:disableEffect(cc.LabelEffect.OUTLINE)
	slot5:setString(TI18N("当前拥有道具:"))

	slot0.item_icon = slot0.main_container:getChildByName("item_icon")
	slot0.item_count = slot0.main_container:getChildByName("item_count")
	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")

	slot0.comfirm_label:setString(TI18N("前往兑换"))

	slot10 = Config.ColorData.data_color4[1]

	if slot2 then
		slot10 = slot0:colorChangeData(slot2.time_color1)
	end

	slot0.time_val = createRichLabel(20, slot10, cc.p(0, 0.5), cc.p(33, 66), nil, nil, 540)

	slot0.main_container:addChild(slot0.time_val)
end

function ActionLimitChangePanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setData(slot0)
				uv0:setLessTime(slot0.remain_sec - 172800)
			end
		end)
	end

	if not slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:Bind(RoleEvent.UPDATE_ROLE_ACTION_ASSETS, function (slot0, slot1)
			if slot0 and slot0 == uv0.action_item_id and uv0.role_vo then
				uv0.item_count:setString(uv0.role_vo:getActionAssetsNumByBid(uv0.action_item_id))
			end
		end)
	end

	registerButtonEventListener(slot0.comfirm_btn, function ()
		uv0:onComfirmBtn()
	end, true, 2)
end

function ActionLimitChangePanel.colorChangeData(slot0, slot1)
	slot2 = "ff"
	slot3 = "ff"
	slot4 = "ff"
	slot5 = "ff"
	slot3 = string.sub(slot1, 3, 4)
	slot4 = string.sub(slot1, 5, 6)
	slot5 = string.sub(slot1, 7, 8)

	if string.sub(slot1, 1, 2) == "" then
		slot2 = "ff"
	end

	if slot3 == "" then
		slot3 = "ff"
	end

	if slot4 == "" then
		slot4 = "ff"
	end

	if slot5 == "" then
		slot5 = "ff"
	end

	return cc.c4b(tonumber("0x" .. slot2), tonumber("0x" .. slot3), tonumber("0x" .. slot4), tonumber("0x" .. slot5))
end

function ActionLimitChangePanel.onComfirmBtn(slot0)
	MallController:getInstance():openMallActionWindow(true, slot0.holiday_bid)
end

function ActionLimitChangePanel.setLessTime(slot0, slot1)
	if tolua.isnull(slot0.time_val) then
		return
	end

	slot0.time_val:stopAllActions()

	if (slot1 or 0) > 0 then
		slot0:setTimeFormatString(slot2)
		slot0.time_val:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function ()
			uv0 = uv0 - 1

			if uv0 < 0 then
				uv1.time_val:stopAllActions()

				slot0 = string.format(TI18N("结束时间: <div fontcolor=#00ff0c>活动已结束</div>"))

				if uv1.holiday_bid == ActionChangeCommonType.limit_yuanzhen or uv1.holiday_bid == ActionChangeCommonType.limit_yuanzhen1 then
					slot0 = string.format(TI18N("结束时间: <div fontcolor=#249003>活动已结束</div>"))
				end

				uv1.time_val:setString(slot0)
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function ActionLimitChangePanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		slot0.time_val:setString(string.format(TI18N("结束时间: <div fontcolor=#%s>%s</div>"), "249003", TimeTool.GetTimeFormatDayIIIIII(slot1)))
	else
		slot0.time_val:setString(string.format(TI18N("结束时间: <div fontcolor=#%s>活动已结束</div>"), slot2))
	end
end

function ActionLimitChangePanel.setData(slot0, slot1)
	slot0.dec_val:setString(string.gsub(string.gsub(slot1.client_reward, "（", "("), "）", ")"))

	slot3 = nil

	if slot1.aim_list[1] and slot1.aim_list[1].aim_args and (keyfind("aim_args_key", 4, slot1.aim_list[1].aim_args) or nil) then
		slot3 = slot4.aim_args_val
	end

	if slot3 then
		slot0.action_item_id = slot3

		if Config.ItemData.data_get_data(slot3) and slot0.item_icon then
			loadSpriteTexture(slot0.item_icon, PathTool.getItemRes(slot4.icon, false), LOADTEXT_TYPE)
			slot0.item_icon:setScale(0.4)
		end

		slot0.item_count:setString(slot0.role_vo:getActionAssetsNumByBid(slot3))
	end

	if slot0.item_list then
		return
	end

	slot6 = #slot1.item_effect_list

	slot0.item_scrollview:setInnerContainerSize(cc.size(math.max(slot0.item_scrollview_size.width, (BackPackItem.Width * 0.9 + 10) * slot6), slot0.item_scrollview_size.height))

	if slot6 <= 4 then
		slot0.item_scrollview:setTouchEnabled(false)
	end

	slot0.item_list = {}
	slot0.start_x = slot5 * 0.5
	slot10 = nil

	for slot14, slot15 in ipairs(slot1.item_effect_list) do
		delayRun(slot0.item_scrollview, slot14 / display.DEFAULT_FPS, function ()
			if not uv0.item_list[uv1] then
				uv2 = BackPackItem.new(true, true)

				uv2:setAnchorPoint(0, 0.5)
				uv2:setScale(uv3)
				uv2:setSwallowTouches(false)
				uv0.item_scrollview:addChild(uv2)

				uv0.item_list[uv1] = uv2

				uv2:setPosition(uv0.start_x + (uv1 - 1) * (uv4 + uv5) + 8, uv0.item_scrollview_size.height * 0.5)
				uv2:setBaseData(uv6.bid, 1, true)
				uv2:setDefaultTip()

				if uv6.effect_1 > 0 then
					if Config.ItemData.data_get_data(uv6.bid) and slot1.quality >= 4 then
						uv2:showItemEffect(true, 263, PlayerAction.action_1, true, 1.1)
					else
						uv2:showItemEffect(true, 263, PlayerAction.action_2, true, 1.1)
					end
				end
			end
		end)
	end
end

function ActionLimitChangePanel.setVisibleStatus(slot0, slot1)
	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		uv0:cs16603(slot0.holiday_bid)
	end
end

function ActionLimitChangePanel.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.update_action_even_event then
		GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)

		slot0.update_action_even_event = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_vo:UnBind(slot0.role_lev_event)

		slot0.role_lev_event = nil
	end

	doStopAllActions(slot0.time_val)
end
