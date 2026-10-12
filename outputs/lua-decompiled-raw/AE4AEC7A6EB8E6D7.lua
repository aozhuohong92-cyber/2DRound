SubscriptionPrivilegePanel = class("SubscriptionPrivilegePanel", function ()
	return ccui.Widget:create()
end)
slot1 = WelfareController:getInstance():getModel()
slot2 = string.format
slot3 = Config.SubscriberData

function SubscriptionPrivilegePanel.ctor(slot0)
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("subscribe", "subscribe"),
			type = ResourcesType.plist
		}
	}
	slot0.is_ios_subscribe = IOS_SUBSCRIBE and IS_IOS_PLATFORM
	slot0.resources_load = ResourcesLoad.New(true)

	slot0.resources_load:addAllList(slot0.res_list, function ()
		if uv0.loadResListCompleted then
			uv0:loadResListCompleted()
		end
	end)
end

function SubscriptionPrivilegePanel.loadResListCompleted(slot0)
	slot0:createRootWnd()
	slot0:register_event()
	uv0:sender10989()
end

function SubscriptionPrivilegePanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/subscription_privilege_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -88)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.load_bg = loadSpriteTextureFromCDN(slot0.main_container:getChildByName("image_bg"), PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_subscription_privilege"), ResourcesType.single)
	slot0.role_effect = createEffectSpine(PathTool.getEffectRes(160), cc.p(0, 0), cc.p(0, 0), true, "action")

	slot0.role_effect:setScale(0.7)
	slot0.main_container:getChildByName("effect_node"):addChild(slot0.role_effect)

	slot0.subscribe_group = slot0.main_container:getChildByName("subscribe_group")

	slot0.subscribe_group:setVisible(false)

	slot0.btn_quarter = slot0.subscribe_group:getChildByName("btn_quarter")
	slot0.btn_month = slot0.subscribe_group:getChildByName("btn_month")
	slot0.privileged_info = slot0.main_container:getChildByName("privileged_info")

	slot0.privileged_info:setVisible(false)

	slot0.is_activated = slot0.privileged_info:getChildByName("is_activated")

	slot0.is_activated:setString(TI18N("特权已激活"))

	slot0.expires_time = slot0.privileged_info:getChildByName("expires_time")
	slot0.avatar_tips = slot0.main_container:getChildByName("avatar_tips")
	slot0.recuit_tips = slot0.main_container:getChildByName("recuit_tips")
	slot0.stone_tips = slot0.main_container:getChildByName("stone_tips")
	slot0.and_show_bg = slot0.main_container:getChildByName("and_show_bg")
	slot0.ios_show_bg = slot0.main_container:getChildByName("ios_show_bg")
	slot0.ios_rule_scroll = slot0.main_container:getChildByName("ios_rule_scroll")
	slot0.ios_rule_scroll_size = slot0.ios_rule_scroll:getContentSize()
	slot0.scroll_view = createScrollView(slot0.ios_rule_scroll_size.width, slot0.ios_rule_scroll_size.height, 0, 0, slot0.ios_rule_scroll, ScrollViewDir.vertical)
	slot0.scroll_container = slot0.scroll_view:getInnerContainer()
	slot5 = nil

	if uv0.data_constant.circle_id.val then
		slot5 = Config.AvatarData.data_avatar[slot4]
	end

	if Config.AvatarData.data_avatar_effect[slot5.res_id or 1] ~= nil and slot8.effect_id ~= "" then
		slot0:showCircleBgEffect(true, slot8.effect_id, 0.811965811965812)
	end

	slot0:setBtnInfo()
	slot0:differentiatedPlatform()
end

function SubscriptionPrivilegePanel.differentiatedPlatform(slot0)
	if slot0.is_ios_subscribe then
		slot0.and_show_bg:setVisible(false)
		slot0.ios_show_bg:setVisible(true)
		slot0.ios_show_bg:setVisible(true)

		slot0.ios_rule_label = createRichLabel(16, cc.c3b(64, 32, 23), cc.p(0, 1), cc.p(0, 0), 10)

		slot0.ios_rule_label:setMaxWidth(380)
		slot0.scroll_container:addChild(slot0.ios_rule_label)

		if uv0.data_constant.agreement_ios and slot1.desc then
			slot0.ios_rule_label:setString(slot1.desc)
		end

		slot0.rule_label_size = slot0.ios_rule_label:getSize()

		slot0.ios_rule_label:setPosition(cc.p(0, slot0.rule_label_size.height))
		slot0.scroll_container:setContentSize(cc.size(slot0.ios_rule_scroll_size.width, slot0.rule_label_size.height))
		slot0.scroll_container:setPosition(cc.p(0, slot0.ios_rule_scroll_size.height - slot0.rule_label_size.height))
		slot0.avatar_tips:setPosition(cc.p(239, 508))
		slot0.recuit_tips:setPosition(cc.p(393, 440))
		slot0.stone_tips:setPosition(cc.p(451, 375))
	else
		slot0.and_show_bg:setVisible(true)
		slot0.ios_show_bg:setVisible(false)
		slot0.ios_show_bg:setVisible(false)
		slot0.avatar_tips:setPosition(cc.p(230, 464))
		slot0.recuit_tips:setPosition(cc.p(406, 385))
		slot0.stone_tips:setPosition(cc.p(480, 302))
		slot0:addRichLabel()
	end
end

function SubscriptionPrivilegePanel.addRichLabel(slot0)
	slot0.agreement_label = createRichLabel(24, cc.c3b(95, 55, 32), cc.p(0.5, 0.5), cc.p(0, 0))

	slot0.agreement_label:setString(uv0("<div href=xxx>%s</div>", TI18N("查看特权规则")))
	slot0.agreement_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		if uv0.data_constant.agreement2_and and slot4.desc then
			TipsManager:getInstance():showCommonTips(slot4.desc, slot3, nil, , 500)
		end
	end, {
		"click",
		"href"
	})
	slot0.main_container:addChild(slot0.agreement_label)
	slot0.agreement_label:setPosition(slot0.main_container:getContentSize().width / 2, 240)
end

function SubscriptionPrivilegePanel.setBtnInfo(slot0)
	slot1 = uv0.data_id_info[SubscribeId.quarter].charge_id
	slot3 = slot0.btn_quarter:getChildByName("quarter_money")

	if Config.ChargeData.data_charge_data and slot2[slot1] then
		slot3:setString("￥" .. slot2[slot1].val)
	end

	slot0.btn_quarter:getChildByName("Text_8"):setString(TI18N("季度订阅"))
	UITool.SetTitleColor(slot3)
	UITool.SetTitleColor(slot0.btn_quarter:getChildByName("Text_8"))

	slot1 = uv0.data_id_info[SubscribeId.month].charge_id
	slot4 = slot0.btn_month:getChildByName("month_money")

	if Config.ChargeData.data_charge_data and slot2[slot1] then
		slot4:setString("￥" .. slot2[slot1].val)
	end

	slot0.btn_month:getChildByName("Text_9"):setString(TI18N("月订阅"))
	UITool.SetTitleColor(slot4)
	UITool.SetTitleColor(slot0.btn_month:getChildByName("Text_9"))
end

function SubscriptionPrivilegePanel.register_event(slot0)
	registerButtonEventListener(slot0.btn_quarter, function ()
		slot1 = Config.ChargeData.data_charge_data

		if uv0.data_id_info[SubscribeId.quarter].charge_id and slot1[slot0] then
			uv1.cur_charge_id = slot1[slot0].id

			ActionController:getInstance():sender21016(uv1.cur_charge_id)
		end
	end, false)
	registerButtonEventListener(slot0.btn_month, function ()
		slot1 = Config.ChargeData.data_charge_data

		if uv0.data_id_info[SubscribeId.month].charge_id and slot1[slot0] then
			uv1.cur_charge_id = slot1[slot0].id

			ActionController:getInstance():sender21016(uv1.cur_charge_id)
		end
	end, false)
	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		if uv0.data_constant.agreement2_and and slot3.desc then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, false)
	registerButtonEventListener(slot0.avatar_tips, function (slot0, slot1, slot2)
		uv0:clickItemTips(1)
	end, false)
	registerButtonEventListener(slot0.recuit_tips, function (slot0, slot1, slot2)
		uv0:clickItemTips(2)
	end, false)
	registerButtonEventListener(slot0.stone_tips, function (slot0, slot1, slot2)
		uv0:clickItemTips(3)
	end, false)

	if not slot0.update_info_event then
		slot0.update_info_event = GlobalEvent:getInstance():Bind(WelfareEvent.Update_Subscribe_data, function (slot0)
			uv0:updateInfo(slot0)
		end)
	end

	if not slot0.subscribe_charge_data then
		slot0.subscribe_charge_data = GlobalEvent:getInstance():Bind(ActionEvent.Is_Charge_Event, function (slot0)
			if uv0.cur_charge_id and slot0 and uv0.cur_charge_id == slot0.charge_id and slot0.status == 1 then
				slot1 = Config.ChargeData.data_charge_data

				if uv0.cur_charge_id and slot1[uv0.cur_charge_id] then
					sdkOnPay(slot1[uv0.cur_charge_id].val, 1, slot1[uv0.cur_charge_id].id, slot1[uv0.cur_charge_id].name)
				end
			end
		end)
	end
end

function SubscriptionPrivilegePanel.clickItemTips(slot0, slot1)
	slot3 = nil

	if uv0.data_constant then
		if slot1 == 1 then
			slot3 = Config.ItemData.data_get_data(slot2.item_avatar.val)
		elseif slot1 == 2 then
			slot3 = Config.ItemData.data_get_data(slot2.item_recuit.val)
		elseif slot1 == 3 then
			slot3 = Config.ItemData.data_get_data(slot2.item_stone.val)
		end

		if slot3 then
			TipsManager:getInstance():showGoodsTips(slot3)
		end
	end
end

function SubscriptionPrivilegePanel.updateInfo(slot0, slot1)
	if slot1 == nil or slot1.id == nil or slot1.start_unixtime == nil then
		return
	end

	slot0.privileged_info:setVisible(slot1.id ~= 0)
	slot0.subscribe_group:setVisible(slot1.id == 0)
	slot0.expires_time:setString(uv0(TI18N("%s-%s"), TimeTool.getMD2(slot1.start_unixtime), TimeTool.getMD2(slot1.start_unixtime + ((SubscribeAddDay[slot1.id] or 1) - 1) * 24 * 60 * 60)))
end

function SubscriptionPrivilegePanel.showCircleBgEffect(slot0, slot1, slot2, slot3)
	if slot1 == false then
		if slot0.bg_effect then
			slot0.bg_effect:clearTracks()
			slot0.bg_effect:removeFromParent()

			slot0.bg_effect = nil
		end
	elseif slot0.bg_effect == nil then
		slot0.bg_effect = createEffectSpine(slot2, cc.p(105, 270), cc.p(0.5, 0.5), true, PlayerAction.action)

		slot0.bg_effect:setScale(slot3 or 1)
		slot0.main_container:addChild(slot0.bg_effect, 1)
	else
		slot0.bg_effect:setVisible(true)
	end
end

function SubscriptionPrivilegePanel.setVisibleStatus(slot0, slot1)
	bool = bool or false

	slot0:setVisible(slot1)
end

function SubscriptionPrivilegePanel.DeleteMe(slot0)
	if slot0.role_effect then
		slot0.role_effect:clearTracks()
		slot0.role_effect:removeFromParent()

		slot0.role_effect = nil
	end

	if slot0.resources_load then
		slot0.resources_load:DeleteMe()

		slot0.resources_load = nil
	end

	if slot0.load_bg then
		slot0.load_bg:DeleteMe()

		slot0.load_bg = nil
	end

	if slot0.update_info_event then
		slot0.update_info_event = GlobalEvent:getInstance():UnBind(slot0.update_info_event)
		slot0.update_info_event = nil
	end

	if slot0.subscribe_charge_data then
		slot0.subscribe_charge_data = GlobalEvent:getInstance():UnBind(slot0.subscribe_charge_data)
		slot0.subscribe_charge_data = nil
	end

	if slot0.circle_load then
		slot0.circle_load:DeleteMe()

		slot0.circle_load = nil
	end

	slot0:showCircleBgEffect(false)
end
