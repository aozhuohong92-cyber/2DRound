GuildDonateWindow = GuildDonateWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format

function GuildDonateWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.title_str = TI18N("捐献")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guild", "guild"),
			type = ResourcesType.plist
		}
	}
	slot0.awards_list = {}
end

function GuildDonateWindow.open_callback(slot0)
	slot0.main_view = createCSBNote(PathTool.getTargetCSB("guild/guild_donate_window"))

	slot0.container:addChild(slot0.main_view)

	slot1 = slot0.main_view

	slot1:getChildByName("day_exp"):setString(TI18N("今日统计："))
	slot1:getChildByName("next_lev_title"):setString(TI18N("下一等级："))
	slot1:getChildByName("notice"):setString(TI18N("每天只能捐献1次，每天0点重置"))

	slot0.progress_bar = slot1:getChildByName("progress_bar")

	slot0.progress_bar:setScale9Enabled(true)

	slot0.lev_title = slot1:getChildByName("lev_title")
	slot0.exp_value = slot1:getChildByName("exp_value")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.total_width = slot0.progress_bar:getContentSize().width
	slot0.start_x = slot0.progress_bar:getPositionX()
	slot0.awards = slot1:getChildByName("awards")

	slot0.awards:setVisible(false)

	if Config.GuildData.data_const.day_exp_max then
		for slot6, slot7 in ipairs(Config.GuildData.data_donate_box) do
			slot8 = slot0.awards:clone()

			slot8:setVisible(true)

			slot10 = slot8:getChildByName("value")

			slot10:setString(slot7.box_val)
			UITool.SetLightColor(slot10)
			slot1:addChild(slot8)
			slot8:setPosition(slot0.start_x + slot0.total_width * slot7.box_val / slot2.val, 56)

			slot0.awards_list[slot6] = {
				item = slot8,
				container = slot8:getChildByName("container"),
				status = GuildConst.status.normal,
				id = slot6,
				config = slot7,
				is_show_tips = true
			}
		end
	end

	slot0.desc = createRichLabel(24, 175, cc.p(0, 0.5), cc.p(142, 732), nil, nil, 500)

	slot1:addChild(slot0.desc)

	slot0.donate_container = slot1:getChildByName("donate_container")
	slot0.scroll_view = CommonScrollViewLayout.new(slot0.donate_container, nil, nil, nil, slot0.donate_container:getContentSize(), {
		start_y = 4,
		item_width = 614,
		start_x = 4,
		space_x = 4,
		row = 0,
		item_height = 187,
		space_y = 0,
		col = 1,
		item_class = GuildDonateItem
	})
end

function GuildDonateWindow.register_event(slot0)
	function slot4(slot0, slot1, slot2)
		TipsManager:getInstance():showCommonTips(Config.GuildData.data_const.game_rule1.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
	end

	slot5 = true

	registerButtonEventListener(slot0.explain_btn, slot4, slot5, 1)

	for slot4, slot5 in pairs(slot0.awards_list) do
		slot5.item:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended and uv0.config then
				if uv0.is_show_tips == true then
					CommonAlert.showItemApply(TI18N("当前捐献活跃度奖励"), uv0.config.rewards, nil, TI18N("确定"), nil, nil, TI18N("奖励"), nil, nil, true)
				else
					uv1:requestDonateBoxRewards(uv0.id)
				end
			end
		end)
	end

	if slot0.my_guild_info == nil then
		slot0.my_guild_info = uv1:getMyGuildInfo()

		if slot0.my_guild_info ~= nil and slot0.update_guild_event == nil then
			slot0.update_guild_event = slot0.my_guild_info:Bind(GuildEvent.UpdateMyInfoEvent, function (slot0, slot1)
				if slot0 == "lev" then
					uv0:updateMyGuildLev()
				end
			end)
		end
	end

	if slot0.update_donate_event == nil then
		slot0.update_donate_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateDonateInfo, function ()
			uv0:updateDonateListStatus()
		end)
	end

	if slot0.update_donate_box_status_event == nil then
		slot0.update_donate_box_status_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateDonateBoxStatus, function (slot0)
			if slot0 ~= nil then
				if uv0.awards_list[slot0] then
					slot1.is_show_tips = true
					slot1.status = GuildConst.status.finish

					if not tolua.isnull(slot1.box_effect) then
						slot1.box_effect:clearTracks()
						slot1.box_effect:setToSetupPose()
						slot1.box_effect:setAnimation(0, PlayerAction.action_3, true)
					end
				end
			else
				uv0:updateDonateBoxList()
			end
		end)
	end
end

function GuildDonateWindow.openRootWnd(slot0)
	slot0.scroll_view:setData(Config.GuildData.data_donate)
	slot0:updateDonateBoxList()
	slot0:updateMyGuildLev()
end

function GuildDonateWindow.updateDonateBoxList(slot0)
	slot0.exp_value:setString(uv0:getDonateActivityValue())

	if Config.GuildData.data_const.day_exp_max == nil then
		return
	end

	slot7 = slot2.val
	slot6 = 100 * slot1 / slot7

	slot0.progress_bar:setPercent(slot6)

	for slot6, slot7 in ipairs(slot0.awards_list) do
		slot8 = slot7.config
		slot10 = GuildConst.status.normal
		slot11 = PlayerAction.action_1

		if ((uv0:getDonateBoxStatus(slot7.id) ~= true or GuildConst.status.finish) and (slot7.config.box_val > slot1 or GuildConst.status.activity) and GuildConst.status.un_activity) == GuildConst.status.finish then
			slot11 = PlayerAction.action_3
		elseif slot10 == GuildConst.status.activity then
			slot11 = PlayerAction.action_2
		end

		if slot10 == GuildConst.status.activity then
			slot7.is_show_tips = false
		else
			slot7.is_show_tips = true
		end

		if not tolua.isnull(slot7.box_effect) then
			if slot10 ~= slot7.status then
				slot7.status = slot10

				slot7.box_effect:clearTracks()
				slot7.box_effect:setToSetupPose()
				slot7.box_effect:setAnimation(0, slot11, true)
			end
		else
			slot7.status = slot10

			delayRun(slot0.main_view, 2 * slot6 / display.DEFAULT_FPS, function ()
				slot0 = createEffectSpine(PathTool.getEffectRes(uv0.config.effect_id), cc.p(uv0.container:getContentSize().width * 0.5, 8), cc.p(0.5, 0), true, uv1)

				uv0.container:addChild(slot0)

				uv0.box_effect = slot0
			end)
		end
	end
end

function GuildDonateWindow.updateMyGuildLev(slot0)
	if slot0.my_guild_info == nil then
		return
	end

	slot0.lev_title:setString(string.format(TI18N("公会等级：%s级"), slot0.my_guild_info.lev))

	if Config.GuildData.data_guild_lev[slot0.my_guild_info.lev + 1] == nil then
		slot0.desc:setString(TI18N("当前已达最大值！"))
	else
		slot0.desc:setString(slot2.desc)
	end
end

function GuildDonateWindow.updateDonateListStatus(slot0)
	if slot0.scroll_view:getItemList() ~= nil then
		for slot5, slot6 in pairs(slot1) do
			if slot6.updateDonateStatus then
				slot6:updateDonateStatus()
			end
		end
	end
end

function GuildDonateWindow.close_callback(slot0)
	slot0.main_view:stopAllActions()

	for slot4, slot5 in ipairs(slot0.awards_list) do
		if slot5.box_effect then
			slot5.box_effect:setVisible(false)
			slot5.box_effect:removeFromParent()
		end
	end

	slot0.awards_list = nil

	uv0:openGuildDonateWindow(false)

	if slot0.my_guild_info ~= nil then
		if slot0.update_guild_event ~= nil then
			slot0.my_guild_info:UnBind(slot0.update_guild_event)

			slot0.update_guild_event = nil
		end

		slot0.my_guild_info = nil
	end

	if slot0.update_donate_event then
		GlobalEvent:getInstance():UnBind(slot0.update_donate_event)

		slot0.update_donate_event = nil
	end

	if slot0.update_donate_box_status_event then
		GlobalEvent:getInstance():UnBind(slot0.update_donate_box_status_event)

		slot0.update_donate_box_status_event = nil
	end

	if slot0.scroll_view then
		slot0.scroll_view:DeleteMe()

		slot0.scroll_view = nil
	end
end

GuildDonateItem = class("GuildDonateItem", function ()
	return ccui.Layout:create()
end)

function GuildDonateItem.ctor(slot0)
	slot0.awards_list = {}
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("guild/guild_donate_item"))
	slot0.size = slot0.root_wnd:getContentSize()

	slot0:setAnchorPoint(cc.p(0.5, 0.5))
	slot0:setContentSize(slot0.size)
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0.root_wnd:setPosition(slot0.size.width * 0.5, slot0.size.height * 0.5)
	slot0:addChild(slot0.root_wnd)

	slot1 = slot0.root_wnd:getChildByName("container")
	slot0.donate_btn = slot1:getChildByName("donate_btn")
	slot0.donate_btn_label = slot0.donate_btn:getChildByName("label")

	slot0.donate_btn_label:setString(TI18N("捐献"))

	slot0.pass_donate = slot1:getChildByName("pass_donate")
	slot0.img = slot1:getChildByName("img")
	slot0.title_desc = slot1:getChildByName("title_desc")
	slot0.item_img = slot1:getChildByName("item_img")
	slot0.donate_value = slot1:getChildByName("donate_value")
	slot0.container = slot1

	slot0:registerEvent()
end

function GuildDonateItem.registerEvent(slot0)
	slot0.donate_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data ~= nil then
				uv1:requestGuildDonate(uv0.data.id)
			end
		end
	end)
end

function GuildDonateItem.addCallBack(slot0, slot1)
	slot0.call_back = slot1
end

function GuildDonateItem.setData(slot0, slot1)
	slot0.data = slot1

	slot0:updateDonateStatus()

	if slot1 ~= nil then
		slot0.title_desc:setString(slot1.desc)

		if slot0.data.loss ~= nil and slot0.data.loss[1] ~= nil and Config.ItemData.data_get_data(slot2[1]) ~= nil then
			loadSpriteTexture(slot0.item_img, PathTool.getItemRes(slot3.icon), LOADTEXT_TYPE)
			slot0.donate_value:setString(slot2[2])
		end

		if slot0.data.gain ~= nil then
			slot2 = 0

			for slot6, slot7 in ipairs(slot0.data.gain) do
				if slot0.awards_list[slot6] == nil and Config.ItemData.data_get_data(slot7[1]) ~= nil then
					slot0.awards_list[slot6] = createRichLabel(26, 178, cc.p(0, 0.5), cc.p(266, 96 - (slot6 - 1) * 50), nil, nil, 250)

					slot0.root_wnd:addChild(slot0.awards_list[slot6])
					slot0.awards_list[slot6]:setString(string.format("<img src=%s visible=true scale=0.4 /> %s", PathTool.getItemRes(slot8.icon), slot7[2]))
				end
			end
		end

		if slot0.res_id ~= PathTool.getResFrame("guild", string.format("txt_cn_guild_100%s", slot0.data.id)) then
			slot0.res_id = slot2

			loadSpriteTexture(slot0.img, slot2, LOADTEXT_TYPE_PLIST)
		end
	end
end

function GuildDonateItem.updateDonateStatus(slot0)
	if slot0.data == nil then
		return
	end

	slot1, slot2 = uv0:checkDonateStatus(slot0.data.id)

	if slot1 == true then
		if slot2 == true then
			slot0.pass_donate:setVisible(true)
			slot0.donate_btn:setVisible(false)
			slot0.donate_btn_label:setString(TI18N("已捐献"))
		else
			setChildUnEnabled(true, slot0.donate_btn)
			slot0.donate_btn:setTouchEnabled(false)
			slot0.donate_btn_label:disableEffect()
			slot0.donate_btn_label:setString(TI18N("不可捐献"))
			slot0.donate_btn:setVisible(true)
			slot0.pass_donate:setVisible(false)
		end
	else
		setChildUnEnabled(false, slot0.donate_btn)
		slot0.donate_btn:setTouchEnabled(true)
		slot0.donate_btn_label:enableOutline(Config.ColorData.data_color4[263], 2)
		slot0.donate_btn_label:setString(TI18N("捐献"))
		slot0.donate_btn:setVisible(true)
		slot0.pass_donate:setVisible(false)
	end
end

function GuildDonateItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
