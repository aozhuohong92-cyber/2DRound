ActionCarnivalReportPanel = class("ActionCarnivalReportPanel", function ()
	return ccui.Widget:create()
end)
slot1 = ActionController:getInstance():getModel()
slot2 = string.format

function ActionCarnivalReportPanel.ctor(slot0, slot1)
	slot0.holiday_bid = slot1

	slot0:configUI()
	slot0:register_event()

	slot0.reward_item_list = {}
end

function ActionCarnivalReportPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_carnival_report_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.image_bg = slot0.main_container:getChildByName("image_bg")
	slot1 = "txt_cn_action_carnival_report"

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

	slot0.txt_time_title = slot0.main_container:getChildByName("txt_time_title")

	slot0.txt_time_title:setString(TI18N("剩余时间："))

	slot0.txt_time_value = slot0.main_container:getChildByName("txt_time_value")

	slot0.txt_time_value:setString("")

	slot0.btn_get_reward = slot0.main_container:getChildByName("btn_get_reward")

	if slot0.btn_get_reward:getTitleRenderer() ~= nil then
		slot4:enableOutline(Config.ColorData.data_color4[277], 2)
	end

	slot0.btn_tips = slot0.main_container:getChildByName("btn_tips")
	slot0.reward_con = slot0.main_container:getChildByName("reward_con")
	slot0.goto_report_label = createRichLabel(24, cc.c3b(77, 24, 114), cc.p(0, 0.5), cc.p(0, 0))

	slot0.goto_report_label:setString(uv1("<div href=xxx>%s</div>", TI18N("点击查看")))
	slot0.goto_report_label:addTouchLinkListener(function (slot0, slot1, slot2, slot3)
		uv0:getHttpPath()
	end, {
		"click",
		"href"
	})
	slot0.main_container:addChild(slot0.goto_report_label)
	slot0.goto_report_label:setPosition(193, 180)

	slot0.key_editbox = createEditBox(slot0.open_button, PathTool.getResFrame("common", "common_1021"), cc.size(350, 45), cc.c4b(127, 127, 127, 255), 24, cc.c4b(127, 127, 127, 255), 24, "输入我的礼包码", nil, , LOADTEXT_TYPE_PLIST)

	slot0.main_container:addChild(slot0.key_editbox)
	slot0.key_editbox:setPosition(245, 110)
	slot0.key_editbox:registerScriptEditBoxHandler(function (slot0, slot1)
		if slot0 == "return" or slot0 == "ended" then
			uv0.input_text = ""

			if slot1:getText() ~= "" and slot2 ~= uv0.input_text then
				uv0.input_text = slot2
			end
		end
	end)
	uv0:cs16603(slot0.holiday_bid)
	uv0:sender16666(slot0.holiday_bid)
end

function ActionCarnivalReportPanel.register_event(slot0)
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

		if uv0.holiday_bid == ActionRankCommonType.carnival_report then
			slot3 = Config.HolidayClientData.data_constant.carnival_report_rules
		end

		if slot3 and slot3.desc then
			TipsManager:getInstance():showCommonTips(slot3.desc, slot1:getTouchBeganPosition(), nil, , 500)
		end
	end, true, 1)
	registerButtonEventListener(slot0.btn_get_reward, function ()
		if uv0.input_text ~= nil and uv0.input_text ~= "" then
			uv1:sender16695(uv0.input_text)
		end
	end, true, 1)
end

function ActionCarnivalReportPanel.setPanelData(slot0, slot1)
	if not slot1 then
		return
	end

	commonCountDownTime(slot0.txt_time_value, slot1.remain_sec or 0)
	slot0.txt_time_title:setPositionX(slot0.txt_time_value:getPositionX() - slot0.txt_time_value:getContentSize().width + 5)
	slot0:updateRewardItem(slot1)
end

function ActionCarnivalReportPanel.updateRewardItem(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	if slot0.reward_item_list == nil or next(slot0.reward_item_list) == nil then
		slot0.reward_item_list = slot0.reward_item_list or {}

		for slot5 = 1, 5 do
			slot6 = slot0.reward_con:getChildByName("item_par" .. slot5)
			slot7 = BackPackItem.new(true, true, false, 1, true, true)
			slot8 = slot6:getContentSize()

			slot6:addChild(slot7)
			slot7:setAnchorPoint(cc.p(0.5, 0.5))
			slot7:setPosition(cc.p(slot8.width / 2, slot8.height / 2))
			slot7:setScale(0.8)

			slot0.reward_item_list[slot5] = slot7
		end
	end

	if slot1.aim_list == nil or next(slot2) == nil then
		return
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot0.reward_item_list[slot6] ~= nil then
			if slot7.item_list and slot7.item_list[1].bid and slot7.item_list[1].num then
				slot0.reward_item_list[slot6]:setBaseData(slot7.item_list[1].bid, slot7.item_list[1].num, true)
			end

			slot0.reward_item_list[slot6]:setReceivedIcon1(slot7.status == 2)
		end
	end
end

function ActionCarnivalReportPanel.getHttpPath(slot0)
	slot1 = "https://sszg.shiyue.com/m/carnival.html"

	if PLATFORM_NAME == "demo" or PLATFORM_NAME == "release" or PLATFORM_NAME == "release2" then
		slot1 = "http://test-cms-sszg.shiyue.com/m/carnival.html"
	end

	slot3 = RoleController:getInstance():getRoleVo()
	slot4, slot5 = unpack(Split(slot3.srv_id, "_"))
	slot7 = string.format("partner=0,0,0&name=%s", slot3.name)

	if RoleController:getInstance():getModel():getGrowthWayCarnivalData() ~= nil and slot6.id ~= 0 and slot6.name ~= "" then
		slot8 = Config.RoomGrowData.data_carnival[slot6.id]

		if Config.PartnerData.data_partner_name2bid[slot6.name] and slot8 then
			slot7 = slot2("partner=%s,%s,%s&name=%s", slot9, slot8, slot6.name, slot3.name)
		end
	end

	if IS_IOS_PLATFORM == true then
		sdkCallFunc("openSyW", slot2("%s?%s", slot1, encodeBase64(slot2("role_id=%s&platform=%s&zone_id=%s&ctime=%s&flag=%s&%s", slot3.rid, PLATFORM_NAME, slot5, GameNet:getInstance():getTime(), cc.CCGameLib:getInstance():md5str(slot2("%s%s%s%s%s", slot3.rid, PLATFORM_NAME, slot5, GameNet:getInstance():getTime(), "He952ae2a6ea8cdG7410j6T42d7ce32")), slot7))))
	else
		sdkCallFunc("openUrl", slot8)
	end
end

function ActionCarnivalReportPanel.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	doStopAllActions(slot0.txt_time_value)

	if slot0.update_holiday_common_event then
		GlobalEvent:getInstance():UnBind(slot0.update_holiday_common_event)

		slot0.update_holiday_common_event = nil
	end

	if slot0.reward_item_list then
		for slot4, slot5 in pairs(slot0.reward_item_list) do
			slot5:DeleteMe()
		end

		slot0.reward_item_list = nil
	end

	doStopAllActions(slot0.cur_reward_scrollview)
end
