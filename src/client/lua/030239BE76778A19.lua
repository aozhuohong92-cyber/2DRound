StarTowerMainWindow = StarTowerMainWindow or BaseClass(BaseView)
slot0 = table.insert

function StarTowerMainWindow.__init(slot0, slot1)
	slot0.ctrl = StartowerController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "startower/star_tower_main"
	slot0.cur_type = 0
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("startower", "startower"),
			type = ResourcesType.plist
		}
	}
	slot0.data = slot1
	slot0.title_str = slot1.name or ""
	slot0.item_list = {}
	slot0.win_type = WinType.Big
end

function StarTowerMainWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 1)

	slot0._dianmond = slot0.main_panel:getChildByName("dianmond")

	slot0._dianmond:setVisible(false)

	slot0.title = slot0.main_panel:getChildByName("title")

	slot0.title:setString(slot0.title_str)
	UITool.SetTitleColor(slot0.title)

	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.award_panel = slot0.main_panel:getChildByName("award_panel")
	slot0.fight_btn = slot0.main_panel:getChildByName("btn1")

	slot0.fight_btn:setTitleText(TI18N("挑战"))
	slot0.fight_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[264], 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.clean_btn = slot0.main_panel:getChildByName("btn2")

	slot0.clean_btn:getTitleRenderer():enableOutline(Config.ColorData.data_color4[263], 2)
	slot0.clean_btn:setTitleText("")

	slot3 = slot0.clean_btn:getContentSize()
	slot0.clean_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot3.width * 0.5, slot3.height * 0.5))

	slot0.clean_btn:addChild(slot0.clean_label)
	slot0:changeClearTitleText()

	slot0.video_btn = slot0.top_panel:getChildByName("video_btn")
	slot4 = slot0.video_btn:getChildByName("label")

	slot4:setString(TI18N("通关录像"))
	UITool.SetTitleColor(slot4)
	slot0.award_panel:getChildByName("label"):setString(TI18N("挑战奖励"))

	slot0.no_label = createLabel(24, Config.ColorData.data_color4[175], nil, 435, 55, "", slot0.main_panel, nil, cc.p(0, 0))

	slot0.no_label:setString(TI18N("挑战成功可进行扫荡"))
	slot0.no_label:setVisible(false)
	slot0.main_panel:runAction(cc.Sequence:create(cc.DelayTime:create(0.2), cc.CallFunc:create(function ()
		if uv0 and uv0.updateModel then
			uv0:updateModel(uv0.data)
		end
	end)))

	if slot0.data then
		slot0.ctrl:sender11325(slot0.data.lev)
	end

	slot0:updateDesc()
	slot0:updateGoodsList()
end

function StarTowerMainWindow.changeClearTitleText(slot0)
	slot1 = slot0.ctrl:getModel():getBuyCount() or 0
	slot3 = slot0.ctrl:getModel():getNowTowerId() or 0

	if slot0.ctrl:getModel():getTowerLessCount() > 0 then
		slot0.clean_label:setString(TI18N("<div outline=2,#2B610D>扫荡</div>"))
	elseif Config.StarTowerData.data_tower_buy[slot1 + 1] then
		slot0.clean_label:setString(string.format(TI18N("<img src=%s scale=0.45 visible=true /><div outline=2,#2B610D>%s%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot4.expend[1][1]).icon), slot4.expend[1][2], TI18N("扫荡")))
	else
		slot0.clean_label:setString(TI18N("<div outline=2,#2B610D>扫荡</div>"))
	end
end

function StarTowerMainWindow.updateModel(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.partner_model then
		slot0.partner_model = BaseRole.new(BaseRole.type.unit, slot1.unit_id, nil, {
			scale = 0.7
		})

		slot0.partner_model:setAnimation(0, PlayerAction.show, true)
		slot0.partner_model:setScale(0.7)
		slot0.top_panel:addChild(slot0.partner_model)
		slot0.partner_model:setPosition(cc.p(313, 235))
	end
end

function StarTowerMainWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openStarTowerMainView(false)
		end
	end)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openStarTowerMainView(false)
		end
	end)
	slot0.fight_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.data then
				return
			end

			HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Startower, {
				tower_lev = uv0.data.lev or 0
			})
		end
	end)
	slot0.clean_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.data then
				return
			end

			if (uv0.ctrl:getModel():getTowerLessCount() or 0) <= 0 then
				uv0:openBuyCountPanel()

				return
			end

			uv0.ctrl:sender11324(uv0.data.lev or 0)
		end
	end)
	slot0.video_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if not uv0.video_data then
				return
			end

			if not uv0.video_data.tower_replay_data or next(uv0.video_data.tower_replay_data) == nil then
				message(TI18N("暂时没有玩家通过此关，努力成为第一名吧！"))

				return
			end

			uv0.ctrl:openVideoWindow(true, uv0.video_data, uv0.data.lev)
		end
	end)

	if not slot0.video_data_event then
		slot0.video_data_event = GlobalEvent:getInstance():Bind(StartowerEvent.Video_Data_Event, function (slot0)
			uv0.video_data = slot0

			uv0:updateVideoData(slot0)
		end)
	end

	if not slot0.fight_success_event then
		slot0.fight_success_event = GlobalEvent:getInstance():Bind(StartowerEvent.Fight_Success_Event, function ()
			if uv0.data then
				uv0.ctrl:sender11325(uv0.data.lev)
			end

			uv0:updateGoodsList()
		end)
	end

	if not slot0.clear_title_change_event then
		slot0.clear_title_change_event = GlobalEvent:getInstance():Bind(StartowerEvent.Count_Change_Event, function ()
			uv0:changeClearTitleText()
		end)
	end
end

function StarTowerMainWindow.openBuyCountPanel(slot0)
	slot1 = Config.StarTowerData.data_tower_const.free_times.val

	function slot5()
		uv0.ctrl:sender11324(uv0.data.lev or 0)
	end

	if Config.StarTowerData.data_tower_vip[RoleController:getInstance():getRoleVo().vip_lev] and slot4.buy_count then
		if slot4.buy_count <= (slot0.ctrl:getModel():getBuyCount() or 0) then
			message(TI18N("本日扫荡次数已达上限"))
		elseif Config.StarTowerData.data_tower_buy[slot2 + 1] and slot6.expend and slot6.expend[1] and slot6.expend[1][1] then
			if Config.ItemData.data_get_data(slot6.expend[1][1]) and slot9.icon then
				CommonAlert.show(string.format(TI18N("是否花费<img src='%s' scale=0.3 />%s购买一次挑战次数？"), PathTool.getItemRes(slot9.icon), slot6.expend[1][2] or 0), TI18N("确定"), slot5, TI18N("取消"), nil, CommonAlert.type.rich, nil, nil, 24)
			end
		end
	end
end

function StarTowerMainWindow.updateVideoData(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.fast_desc then
		slot0.fast_desc = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 1), cc.p(20, -12), nil, nil, 300)

		slot0.top_panel:addChild(slot0.fast_desc)
	end

	if not slot0.power_desc then
		slot0.power_desc = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 1), cc.p(20, -52), nil, nil, 300)

		slot0.top_panel:addChild(slot0.power_desc)
	end

	slot0.fast_desc:setString(TI18N("最快通关：暂无"))
	slot0.power_desc:setString(TI18N("最低战力：暂无"))

	for slot6, slot7 in pairs(slot1.tower_replay_data or {}) do
		if slot7 and slot7.type == 1 then
			slot0.fast_desc:setString(string.format(TI18N("最快通关：%s"), slot7.name))
		else
			slot0.power_desc:setString(string.format(TI18N("最低战力：%s"), slot7.name))
		end
	end
end

function StarTowerMainWindow.updateDesc(slot0)
	if not slot0.data then
		return
	end

	slot0.boss_power = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 0), cc.p(20, 45), nil, nil, 620)

	slot0.top_panel:addChild(slot0.boss_power)

	slot1 = slot0.data.desc or ""

	slot0.boss_power:setString(string.format(TI18N("推荐战力：<div fontcolor=#289b14>%s</div>"), slot0.data.recommend or 0))
end

function StarTowerMainWindow.openRootWnd(slot0)
end

function StarTowerMainWindow.updateGoodsList(slot0)
	if not slot0.data then
		return
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:setVisible(false)
	end

	slot1 = {}

	if (slot0.ctrl:getModel():getNowTowerId() or 0) < slot0.data.lev then
		slot3 = 0
		slot4 = 0

		if slot0.data.first_show[1] and slot0.data.first_show[1][1] and slot0.data.first_show[1][2] then
			slot3 = slot0.data.first_show[1][1]
			slot4 = slot0.data.first_show[1][2]
		end

		uv0(slot1, {
			slot3,
			slot4,
			[3.0] = true
		})
	end

	for slot6, slot7 in pairs(slot0.data.award) do
		uv0(slot1, slot7)
	end

	slot3 = 1
	slot4 = slot0.award_panel:getContentSize()

	for slot8, slot9 in pairs(slot1) do
		if not slot0.item_list[slot3] then
			slot10 = BackPackItem.new(true, true, nil, 0.9)

			slot10:setDefaultTip()
			slot0.award_panel:addChild(slot10)

			slot0.item_list[slot3] = slot10
		end

		slot0.item_list[slot3]:setPosition(cc.p(90 + 150 * (slot3 - 1), 70))

		if Config.ItemData.data_get_data(slot9[1]) then
			slot0.item_list[slot3]:setData(slot10)
			slot0.item_list[slot3]:setVisible(true)
			slot0.item_list[slot3]:setNum(slot9[2])
		end

		slot0.item_list[slot3]:showBiaoQian(false)

		if slot9 and slot9[3] and slot9[3] == true then
			slot0.item_list[slot3]:showBiaoQian(true, TI18N("首通"))
		end

		slot3 = slot3 + 1
	end

	if (slot0.ctrl:getModel():getNowTowerId() or 0) < slot0.data.lev then
		slot0.clean_btn:setVisible(false)
		slot0.fight_btn:setPosition(cc.p(338, 78))
		slot0.no_label:setVisible(true)
	else
		slot0.clean_btn:setVisible(true)
		slot0.no_label:setVisible(false)
		slot0.fight_btn:setPosition(cc.p(178, 78))
	end
end

function StarTowerMainWindow.setPanelData(slot0)
end

function StarTowerMainWindow.close_callback(slot0)
	slot0.ctrl:openStarTowerMainView(false)

	if slot0.partner_model then
		slot0.partner_model:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
			doStopAllActions(uv0.partner_model)
			uv0.partner_model:removeFromParent()

			uv0.partner_model = nil
		end)))
	end

	for slot4, slot5 in pairs(slot0.item_list) do
		slot5:DeleteMe()
	end

	slot0.item_list = nil

	if slot0.video_data_event then
		GlobalEvent:getInstance():UnBind(slot0.video_data_event)

		slot0.video_data_event = nil
	end

	if slot0.fight_success_event then
		GlobalEvent:getInstance():UnBind(slot0.fight_success_event)

		slot0.fight_success_event = nil
	end

	if slot0.count_change_event then
		GlobalEvent:getInstance():UnBind(slot0.count_change_event)

		slot0.count_change_event = nil
	end

	if slot0.clear_title_change_event then
		GlobalEvent:getInstance():UnBind(slot0.clear_title_change_event)

		slot0.clear_title_change_event = nil
	end
end
