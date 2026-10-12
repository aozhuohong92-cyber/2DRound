EscortEmployWindow = EscortEmployWindow or BaseClass(BaseView)
slot1 = EscortController:getInstance():getModel()
slot2 = table.insert
slot3 = RoleController:getInstance():getRoleVo()
slot4 = string.format

function EscortEmployWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.win_type = WinType.Big
	slot0.layout_name = "escort/escort_employ_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("escort", "escort"),
			type = ResourcesType.plist
		}
	}
	slot0.item_list = {}
end

function EscortEmployWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")

	slot2:getChildByName("win_title"):setString(TI18N("雇佣信息"))
	slot2:getChildByName("employ_times_title"):setString(TI18N("今日雇佣次数:"))
	slot2:getChildByName("notice_label"):setString(TI18N("刷新不会降低雇佣兽品质"))

	slot0.close_btn = slot2:getChildByName("close_btn")
	slot0.list_view = slot2:getChildByName("list_view")
	slot0.employ_times_value = slot2:getChildByName("employ_times_value")
	slot0.refresh_btn = slot2:getChildByName("refresh_btn")
	slot0.auto_refresh_btn = slot2:getChildByName("auto_refresh_btn")
	slot0.refresh_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(88, 33))

	slot0.refresh_btn:addChild(slot0.refresh_btn_label)

	slot7 = cc.p(0.5, 0.5)
	slot0.auto_refresh_btn_label = createRichLabel(24, 1, slot7, cc.p(88, 33))

	slot0.auto_refresh_btn:addChild(slot0.auto_refresh_btn_label)

	slot0.confirm_btn = slot2:getChildByName("confirm_btn")

	slot0.confirm_btn:getChildByName("label"):setString(TI18N("我要雇佣"))

	for slot7 = 1, 5 do
		if slot1:getChildByName("item_" .. slot7) then
			slot8:getChildByName("awards_title"):setString(TI18N("奖励:"))

			slot14 = slot7 - 1
			slot15 = Config.EscortData.data_baseinfo[slot14]
			slot0.item_list[slot7] = {
				item = slot8,
				normal = slot8:getChildByName("normal"),
				select = slot8:getChildByName("select"),
				item_name = slot8:getChildByName("item_name"),
				quality = slot14,
				config = slot15,
				item_status = slot8:getChildByName("item_status")
			}

			if slot15 then
				slot11:setString(slot15.title)
			end
		end
	end
end

function EscortEmployWindow.register_event(slot0)
	if slot0.close_btn then
		slot0.close_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				playCloseSound()
				uv0:openEscortEmployWindow(false)
			end
		end)
	end

	if slot0.confirm_btn then
		slot0.confirm_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()

				if uv0:isDoubleTimes() == false then
					slot4 = ""

					if Config.EscortData.data_const.double_time then
						slot4 = "(" .. slot3.desc .. ")"
					end

					CommonAlert.show(TI18N("当前为非双倍奖励时间，继续护送只能获得单倍奖励，是否继续？"), TI18N("确定"), function ()
						uv0:requestEscort()
					end, TI18N("取消"), nil, , , {
						extend_offy = -75,
						extend_str = slot4,
						extend_aligment = cc.TEXT_ALIGNMENT_CENTER
					})
				else
					uv1:requestEscort()
				end
			end
		end)
	end

	if slot0.refresh_btn then
		slot0.refresh_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:requestRefreshEscort(1)
			end
		end)
	end

	if slot0.auto_refresh_btn then
		slot0.auto_refresh_btn:addTouchEventListener(function (slot0, slot1)
			customClickAction(slot0, slot1)

			if slot1 == ccui.TouchEventType.ended then
				playButtonSound2()
				uv0:requestRefreshEscort(2)
			end
		end)
	end

	if slot0.update_myinfo_event == nil then
		slot0.update_myinfo_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortMyInfoEvent, function ()
			if uv0:getMyInfo() then
				uv1:changeQuailty(slot0.quality)
			end

			uv1:updateMyRefreshTimes()
		end)
	end
end

function EscortEmployWindow.updateMyRefreshTimes(slot0)
	if uv0:getMyCount(EscortConst.times_type.refresh) < uv0:getMyMaxCount(EscortConst.times_type.refresh) then
		slot0.refresh_btn_label:setString(string.format("<div fontColor=#ffffff fontsize=24 outline=1,#478425>%s(%s/%s)</div>", TI18N("本次免费"), slot2 - slot1, slot2))
	elseif Config.EscortData.data_const.refresh_cost and slot3.val and type(slot3.val) == "table" and slot3.val[1] and #slot4 >= 2 then
		if Config.ItemData.data_get_data(slot4[1]) then
			slot0.refresh_btn_label:setString(string.format("<img src=%s visible=true scale=0.35 />,<div fontColor=#ffffff fontsize=24 outline=1,#478425>%s %s</div>", PathTool.getItemRes(slot7.icon), slot4[2], TI18N("刷新")))
		end
	end
end

function EscortEmployWindow.openRootWnd(slot0)
	slot0:updateMyRefreshTimes()

	if Config.EscortData.data_const.steprefresh_cost and slot1.val and type(slot1.val) == "table" and slot1.val[1] and #slot2 >= 2 then
		if Config.ItemData.data_get_data(slot2[1]) then
			slot0.auto_refresh_btn_label:setString(string.format("<img src=%s visible=true scale=0.35 />,<div fontColor=#ffffff fontsize=24 outline=1,#478425>%s %s</div>", PathTool.getItemRes(slot5.icon), slot2[2], TI18N("一键刷橙")))
		end
	end

	slot0:initConfig()

	slot3 = 0

	if uv0:getMyInfo() then
		slot3 = slot2.quality or 0

		if uv0:getMyMaxCount(EscortConst.times_type.escort) - uv0:getMyCount(EscortConst.times_type.escort) < 0 then
			slot5 = 0
		end

		slot0.employ_times_value:setString(slot5 .. "/" .. slot4)
	end

	slot0:changeQuailty(slot3)
end

function EscortEmployWindow.initConfig(slot0)
	for slot4, slot5 in ipairs(slot0.item_list) do
		delayRun(slot0.background, slot4 * 4 / display.DEFAULT_FPS, function ()
			if uv0.config then
				uv1:createBaseInfo(uv0)
			end
		end)
	end
end

function EscortEmployWindow.createBaseInfo(slot0, slot1)
	if slot1 == nil or slot1.config == nil or tolua.isnull(slot1.item) then
		return
	end

	if slot1.player == nil then
		slot1.player = createEffectSpine(slot1.config.res, cc.p(100, 15), cc.p(0.5, 0.5), true, PlayerAction.action_1)

		slot1.player:setScale(0.9)
		slot1.item:addChild(slot1.player)
	end

	if slot1.item_list == nil and slot1.config.quality and Config.EscortData.data_rewards(getNorKey(slot1.config.quality, uv0.lev)) then
		slot1.item_list = {}
		slot5 = 1

		if (uv1:isDoubleTimes() or false) == true then
			slot5 = 2
		end

		for slot9, slot10 in ipairs(slot3.award) do
			slot11 = BackPackItem.new(false, true, false, 0.7, false, true)

			slot11:setPosition(217 + (BackPackItem.Width * 0.7 + 10) * (slot9 - 1) + BackPackItem.Width * 0.7 * 0.5, 58)
			slot11:setBaseData(slot10[1], slot10[2] * slot5)
			slot11:setDoubleIcon(slot4)
			slot1.item:addChild(slot11)
			uv2(slot1.item_list, slot11)
		end
	end
end

function EscortEmployWindow.changeQuailty(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.select_object then
		slot0.select_object.select:setVisible(false)
		slot0.select_object.normal:setVisible(true)
		slot0.select_object.item_status:setVisible(false)

		slot0.select_object = nil
	end

	for slot5, slot6 in ipairs(slot0.item_list) do
		if slot6 and slot6.quality == slot1 then
			slot0.select_object = slot6

			slot0.select_object.select:setVisible(true)
			slot0.select_object.item_status:setVisible(true)
			slot0.select_object.normal:setVisible(false)
		end
	end
end

function EscortEmployWindow.close_callback(slot0)
	if slot0.update_myinfo_event then
		GlobalEvent:getInstance():UnBind(slot0.update_myinfo_event)

		slot0.update_myinfo_event = nil
	end

	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot5.item_list then
			for slot9, slot10 in ipairs(slot5.item_list) do
				slot10:DeleteMe()
			end
		end

		if slot5.player then
			slot5.player:removeFromParent()
		end
	end

	slot0.item_list = nil

	uv0:openEscortEmployWindow(false)
end
