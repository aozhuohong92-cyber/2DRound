ActionChargeReturnPanel = class("ActionChargeReturnPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format

function ActionChargeReturnPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.is_init = true
end

function ActionChargeReturnPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_charge_return_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot1 = ""

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
	slot0.txt_desc = slot0.main_container:getChildByName("txt_desc")
	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("活动时间："))

	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.txt_buff_title = slot0.main_container:getChildByName("txt_buff_title")

	slot0.txt_buff_title:setString(TI18N("圣洁之力剩余BUFF："))

	slot0.txt_buff_value = slot0.main_container:getChildByName("txt_buff_value")

	slot0.txt_buff_value:setString("")

	slot0.btn_charge = slot0.main_container:getChildByName("btn_charge")
	slot0.txt_charge = slot0.btn_charge:getChildByName("label")

	slot0.txt_charge:setString(TI18N("前往充值"))

	slot0.progress_panel = slot0.main_container:getChildByName("progress_panel")
	slot0.qingbao_progress = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("battledrama", "battledrama_1021"), 40, 40, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))

	slot0.qingbao_progress:setPosition(40, 40)
	slot0.qingbao_progress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
	slot0.progress_panel:addChild(slot0.qingbao_progress)
	uv0:cs16603(slot0.holiday_bid)
end

function ActionChargeReturnPanel.register_event(slot0)
	if not slot0.update_holiday_common_event then
		slot0.update_holiday_common_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if not slot0 then
				return
			end

			if slot0.bid == uv0.holiday_bid then
				uv0:setPanelData(slot0)
			end
		end)
	end

	registerButtonEventListener(slot0.btn_tips, function (slot0, slot1, slot2)
		slot3 = nil

		if uv0.holiday_bid == ActionRankCommonType.seven_charge then
			slot3 = Config.HolidayClientData.data_constant.seven_charge_rules
		end

		TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
	end, true, 1)
	registerButtonEventListener(slot0.btn_charge, function ()
		VipController:getInstance():openVipMainWindow(true, VIPTABCONST.CHARGE)
	end, true, 1)
end

function ActionChargeReturnPanel.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.txt_time_value:setString(uv0(TI18N("%s-%s"), TimeTool.getMD2(slot1.start_time), TimeTool.getMD2(slot1.end_time)))
	slot0.txt_buff_value:setString(uv0("%d/%d", 5000, 8000))
end

function ActionChargeReturnPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionChargeReturnPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end
end
