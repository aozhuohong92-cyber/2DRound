EscortLogDefPanel = EscortLogDefPanel or BaseClass()
slot1 = EscortController:getInstance():getModel()
slot2 = Config.EscortData.data_baseinfo
slot3 = string.format
slot4 = RoleController:getInstance():getRoleVo()
slot5 = GameNet:getInstance()

function EscortLogDefPanel.__init(slot0, slot1)
	slot0.is_init = false
	slot0.parent = slot1

	slot0:createRoorWnd()
	slot0:registerEvent()
end

function EscortLogDefPanel.createRoorWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("escort/escort_log_def_panel"))

	if not tolua.isnull(slot0.parent) then
		slot0.parent:addChild(slot0.root_wnd)
	end

	slot0.root_wnd:getChildByName("desc_label"):setString(TI18N("选择求助后不得再复仇\n对每个掠夺者只有2次复仇"))
	slot0.root_wnd:getChildByName("atk_label"):setString(TI18N("今日复仇次数:"))
	slot0.root_wnd:getChildByName("help_label"):setString(TI18N("今日求助次数:"))

	slot0.atk_value = slot0.root_wnd:getChildByName("atk_value")
	slot0.atk_value = slot0.root_wnd:getChildByName("help_value")
	slot0.item = slot0.root_wnd:getChildByName("item")

	slot0.item:setVisible(false)

	slot0.empty_tips = slot0.root_wnd:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("胆敢掠夺船长大人的人，世界上不存在！"))

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0.root_wnd:getChildByName("atk_label"):setString(TI18N("今日复仇次数:"))
	slot0.root_wnd:getChildByName("help_label"):setString(TI18N("今日求助次数:"))

	slot0.atk_value = slot0.root_wnd:getChildByName("atk_value")
	slot0.help_value = slot0.root_wnd:getChildByName("help_value")
	slot0.desc_label = slot0.root_wnd:getChildByName("desc_label")

	slot0.desc_label:setString(TI18N("选择求助后不得再复仇\n对每个掠夺者只有2次复仇"))

	slot1 = TI18N("选择求助后不得再复仇\n对每个掠夺者只有2次复仇")
	slot2 = Config.EscortData.data_const.single_revenge_limit

	if config then
		slot1 = uv0(TI18N("选择求助后不得再复仇\n对每个掠夺者只有%s次复仇"), config.val)
	end
end

function EscortLogDefPanel.registerEvent(slot0)
	if slot0.update_my_info_event == nil then
		slot0.update_my_info_event = GlobalEvent:getInstance():Bind(EscortEvent.UpdateEscortMyInfoEvent, function ()
			uv0:updateMyInfo()
		end)
	end
end

function EscortLogDefPanel.updateMyInfo(slot0)
	slot4 = uv0:getMyMaxCount(EscortConst.times_type.atk_back) - uv0:getMyCount(EscortConst.times_type.atk_back)

	if uv0:getMyMaxCount(EscortConst.times_type.help) - uv0:getMyCount(EscortConst.times_type.help) < 0 then
		slot3 = 0
	end

	if slot4 < 0 then
		slot4 = 0
	end

	slot0.help_value:setString(slot3 .. "/" .. slot1)
	slot0.atk_value:setString(slot4 .. "/" .. slot2)
end

function EscortLogDefPanel.addToParent(slot0, slot1)
	if not tolua.isnull(slot0.root_wnd) then
		slot0.root_wnd:setVisible(slot1)
	end

	if slot1 == true and slot0.is_init == false then
		slot0.is_init = true

		slot0:updateMyInfo()
		uv0:requestLogByType(EscortConst.log_type.def)
	end
end

function EscortLogDefPanel.refreshData(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if slot0.scroll_view then
		slot0.scroll_view:resetAddPosition(slot1)
	end
end

function EscortLogDefPanel.setData(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(true)
		end
	else
		if slot0.scroll_view == nil then
			slot0.scroll_view = CommonScrollViewLayout.new(slot0.main_panel, nil, , , slot0.main_panel:getContentSize(), {
				start_y = 7,
				item_width = 600,
				start_x = 4,
				space_x = 0,
				row = 0,
				item_height = 156,
				space_y = 0,
				col = 1,
				need_dynamic = true,
				item_class = EscortLogDefItem
			})
		end

		slot0.scroll_view:setData(slot1, nil, , slot0.item)
		slot0.scroll_view:setVisible(true)

		if slot0.empty_tips then
			slot0.empty_tips:setVisible(false)
		end
	end
end

function EscortLogDefPanel.__delete(slot0)
	if slot0.update_my_info_event then
		GlobalEvent:getInstance():UnBind(slot0.update_my_info_event)

		slot0.update_my_info_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

EscortLogDefItem = class("EscortLogDefItem", function ()
	return ccui.Layout:create()
end)

function EscortLogDefItem.ctor(slot0)
	slot0.is_completed = false
end

function EscortLogDefItem.setExtendData(slot0, slot1)
	if not tolua.isnull(slot1) and slot0.root_wnd == nil then
		slot0.is_completed = true
		slot2 = slot1:getContentSize()

		slot0:setAnchorPoint(cc.p(0.5, 0.5))
		slot0:setContentSize(slot2)

		slot0.root_wnd = slot1:clone()

		slot0.root_wnd:setVisible(true)
		slot0.root_wnd:setAnchorPoint(0.5, 0.5)
		slot0.root_wnd:setPosition(slot2.width * 0.5, slot2.height * 0.5)
		slot0:addChild(slot0.root_wnd)
		slot0.root_wnd:getChildByName("item_title"):setString(TI18N("掠夺对象:"))
		slot0.root_wnd:getChildByName("guild_title"):setString(TI18N("公会:"))

		slot0.fight_container = slot0.root_wnd:getChildByName("fight_container")
		slot0.role_power = slot0.fight_container:getChildByName("role_power")
		slot0.role_name = slot0.root_wnd:getChildByName("role_name")
		slot0.item_name = slot0.root_wnd:getChildByName("item_name")
		slot0.time_label = slot0.root_wnd:getChildByName("time_label")
		slot0.guild_value = slot0.root_wnd:getChildByName("guild_value")
		slot0.btn_container = slot0.root_wnd:getChildByName("btn_container")
		slot0.atk_btn = slot0.btn_container:getChildByName("atk_btn")
		slot0.atk_btn_label = slot0.atk_btn:getChildByName("label")
		slot0.cool_time = slot0.root_wnd:getChildByName("cool_time")
		slot0.help_btn = slot0.btn_container:getChildByName("help_btn")
		slot0.help_btn_label = slot0.help_btn:getChildByName("label")
		slot0.vedio_btn = slot0.root_wnd:getChildByName("vedio_btn")
		slot0.role_head = PlayerHead.new(PlayerHead.type.circle)

		slot0.role_head:setPosition(72, 78)
		slot0.root_wnd:addChild(slot0.role_head)
		slot0.role_head:setLev(99)
		slot0:registerEvent()
	end
end

function EscortLogDefItem.registerEvent(slot0)
	slot0.vedio_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				BattleController:getInstance():csRecordBattle(uv0.data.replay_id)
			end
		end
	end)
	slot0.atk_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				uv1:requestPlunderInfo(uv2.rid, uv2.srv_id, uv0.data.id, EscortConst.challenge_type.revenge)
			end
		end
	end)
	slot0.help_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data then
				CommonAlert.show(TI18N("求助后将向全会发送公告,若会友击退了掠夺者,你和会友都会获得奖励,是否确定求助?(求助后不能进行复仇)"), TI18N("确定"), function ()
					uv0:requestGuildForHelp(uv1.data.id)
				end, TI18N("取消"))
			end
		end
	end)
end

function EscortLogDefItem.setData(slot0, slot1)
	slot0.data = slot1

	if slot1 then
		slot0.role_head:setHeadRes(slot1.face)
		slot0.role_head:setLev(slot1.lev)
		slot0.role_power:setString(slot1.power)
		slot0.time_label:setString(TimeTool.getYMDHMS(slot1.time))
		slot0.role_name:setString(transformNameByServ(slot1.name, slot1.srv_id))
		slot0.fight_container:setPositionX(slot0.role_name:getPositionX() + slot0.role_name:getContentSize().width + 10)

		if slot1.guild_name == "" then
			slot0.guild_value:setString(TI18N("暂无公会"))
		else
			slot0.guild_value:setString(slot1.guild_name)
		end

		if slot1.quality and uv0[slot1.quality] then
			if EscortConst.quality_color[slot1.quality] then
				slot0.item_name:setTextColor(slot3)
			end

			slot0.item_name:setString(slot2.title)
		end

		if slot1.atk_ret == 1 then
			slot0.cool_time:setVisible(true)
			slot0.btn_container:setVisible(false)
			slot0.cool_time:setString(TI18N("复仇成功"))
		elseif slot1.atk_ret == 2 then
			slot0.cool_time:setVisible(true)
			slot0.btn_container:setVisible(false)
			slot0.cool_time:setString(TI18N("复仇失败"))
		else
			if Config.EscortData.data_const.single_revenge_limit then
				if slot2.val - slot1.atk_count < 0 then
					slot3 = 0
				end

				slot0.atk_btn_label:setString(uv1(TI18N("复仇(%s/%s)"), slot3, slot2.val))
			end

			slot0:timeTicket()
		end
	end
end

function EscortLogDefItem.timeTicket(slot0)
	if slot0.data == nil then
		return
	end

	if slot0.data.help_time <= uv0:getTime() then
		slot0.btn_container:setVisible(true)
		slot0.cool_time:setVisible(false)
	else
		slot0.btn_container:setVisible(false)
		slot0.cool_time:setVisible(true)
		slot0:setCoolTime()

		if slot0.time_ticket == nil then
			slot0.time_ticket = GlobalTimeTicket:getInstance():add(function ()
				uv0:setCoolTime()
			end, 1)
		end
	end
end

function EscortLogDefItem.setCoolTime(slot0)
	if slot0.data == nil then
		slot0:clearTimeTicket()

		return
	end

	if slot0.data.help_time - uv0:getTime() < 0 then
		slot1 = 0

		slot0.btn_container:setVisible(true)
		slot0.cool_time:setVisible(false)
		slot0:clearTimeTicket()
	end

	slot0.cool_time:setString(uv1(TI18N("%s后\n可复仇或求助"), TimeTool.GetMinSecTime(slot1)))
end

function EscortLogDefItem.clearTimeTicket(slot0)
	if slot0.time_ticket then
		GlobalTimeTicket:getInstance():remove(slot0.time_ticket)

		slot0.time_ticket = nil
	end
end

function EscortLogDefItem.suspendAllActions(slot0)
	slot0:clearTimeTicket()
end

function EscortLogDefItem.DeleteMe(slot0)
	slot0:clearTimeTicket()

	if slot0.role_head then
		slot0.role_head:DeleteMe()

		slot0.role_head = nil
	end

	slot0:removeAllChildren()
	slot0:removeFromParent()
end
