ActionRechargeRebatePanel = class("ActionRechargeRebatePanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = table.remove
slot3 = table.insert
slot4 = string.format

function ActionRechargeRebatePanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()
end

function ActionRechargeRebatePanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_recharge_rebate_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot1 = "txt_cn_action_recharge_rebate"

	if uv0:getActionSubTabVo(slot0.holiday_bid) and slot2.reward_title ~= "" and slot2.reward_title then
		slot1 = slot2.reward_title
	end

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getPlistImgForDownLoad("bigbg/action", slot1), ResourcesType.single, function ()
			if not tolua.isnull(uv0.image_bg) then
				uv0.image_bg:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("活动时间："))

	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.btn_charge = slot0.main_container:getChildByName("btn_charge")
	slot0.txt_charge = slot0.btn_charge:getChildByName("label")

	slot0.txt_charge:setString(TI18N("前往充值"))

	slot0.txt_charge_bg = slot0.main_container:getChildByName("txt_charge_bg")

	slot0.txt_charge_bg:setString(TI18N("剩余钻石："))

	slot0.image_perc = slot0.main_container:getChildByName("image_perc")
	slot0.image_txt_bg = slot0.main_container:getChildByName("image_txt_bg")

	slot0.image_txt_bg:loadTexture(PathTool.getResFrame("welfare", "txt_cn_welfare_8"), LOADTEXT_TYPE_PLIST)

	slot0.remaining = CommonNum.new(17, slot0.main_container, 1, -2, cc.p(0.5, 0.5))

	slot0.remaining:setPosition(355, 235)
	slot0:setStaticPanelData()
	uv0:sender28100()
	uv0:sender28103()
	uv0:cs16603(slot0.holiday_bid)
end

function ActionRechargeRebatePanel.register_event(slot0)
	if not slot0.update_recharge_rebate_event then
		slot0.update_recharge_rebate_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_RECHARGE_REBATE_EVENT, function (slot0)
			if not slot0 then
				return
			end

			uv0:setPanelData(slot0)
		end)
	end

	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		slot3 = nil

		if uv0.holiday_bid == ActionRankCommonType.recharge_rebate then
			slot3 = Config.HolidayClientData.data_constant.recharge_rebate_rules
		end

		if slot3 and slot3.desc then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, nil, 500)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_charge, function ()
		uv0:sender28101()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true, 1)
end

function ActionRechargeRebatePanel.setStaticPanelData(slot0)
	slot1 = Config.HolidayChargeRebateData.data_constant

	if slot0.image_perc and slot1 and slot1.rebate_pro_res and slot1.rebate_pro_res.val then
		slot0.image_perc:loadTexture(PathTool.getResFrame("welfare", slot1.rebate_pro_res.val or "txt_cn_welfare_9"), LOADTEXT_TYPE_PLIST)
	end

	if slot1 and slot1.rebate_effect and slot1.rebate_effect.val then
		if not slot0.cat_effect then
			slot0.cat_effect = createEffectSpine(PathTool.getEffectRes(slot1.rebate_effect.val[1] or 0), cc.p(slot1.rebate_effect.val[2] or 360, slot1.rebate_effect.val[3] or 350), cc.p(0.5, 0.5), true, PlayerAction.action)

			slot0.cat_effect:setScale(0.85)
			slot0.main_container:addChild(slot0.cat_effect)
		end
	end
end

function ActionRechargeRebatePanel.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1.start_time and slot1.end_time then
		slot0.txt_time_value:setString(TimeTool.getMD2(slot1.start_time) .. "-" .. TimeTool.getMD2(slot1.end_time))
	end

	slot0.txt_time_title:setPositionX(slot0.txt_time_value:getPositionX() - slot0.txt_time_value:getContentSize().width + 5)

	if slot1.rsidue_gold and slot1.rsidue_gold > 0 then
		slot0.remaining:setNum(slot1.rsidue_gold)
		slot0:updateBtnStatus(false)
	else
		slot0.remaining:setNum(0)
		slot0:updateBtnStatus(true)
	end
end

function ActionRechargeRebatePanel.updateBtnStatus(slot0, slot1)
	if slot1 then
		slot0.btn_charge:setTouchEnabled(false)
		setChildUnEnabled(true, slot0.btn_charge)
		slot0.txt_charge:enableOutline(Config.ColorData.data_color4[84], 2)
	else
		slot0.btn_charge:setTouchEnabled(true)
		setChildUnEnabled(false, slot0.btn_charge)
		slot0.txt_charge:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function ActionRechargeRebatePanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionRechargeRebatePanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.remaining then
		slot0.remaining:DeleteMe()

		slot0.remaining = nil
	end

	if slot0.cat_effect then
		slot0.cat_effect:clearTracks()
		slot0.cat_effect:removeFromParent()

		slot0.cat_effect = nil
	end

	doStopAllActions(slot0.txt_time_value)

	if slot0.update_recharge_rebate_event then
		GlobalEvent:getInstance():UnBind(slot0.update_recharge_rebate_event)

		slot0.update_recharge_rebate_event = nil
	end
end
