BindPhonePanel = class("BindPhonePanel", function ()
	return ccui.Widget:create()
end)

function BindPhonePanel.ctor(slot0)
	slot0.item_list = {}
	slot0.bind_phone_status = 0

	slot0:createRootWnd()
	slot0:registerEvent()
end

function BindPhonePanel.createRootWnd(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("welfare/bind_phone_panel"))

	slot0:addChild(slot0.root_wnd)
	slot0:setPosition(-40, -80)
	slot0:setAnchorPoint(0, 0)

	slot1 = slot0.root_wnd:getChildByName("main_container")
	slot0.bg = slot1:getChildByName("bg")

	slot1:getChildByName("txt1"):setString(TI18N("活动规则"))

	slot3 = slot1:getChildByName("txt2")

	slot3:setString(TI18N("绑定手机即可领取超值礼包\n每个账号仅能领取一次绑定奖励\n同一手机号仅能绑定一个账号"))

	if slot3:getVirtualRenderer() then
		slot4:setLineSpacing(6)
	end

	slot0.item_container = slot1:getChildByName("item_container")
	slot0.ok_btn = slot1:getChildByName("ok_btn")
	slot0.ok_btn_label = slot0.ok_btn:getChildByName("label")

	slot0:loadBackground()
	slot0:setItemList()
	slot0:updateBindPhoneStatus()
	slot0:checkRedStatus()
end

function BindPhonePanel.registerEvent(slot0)
	registerButtonEventListener(slot0.ok_btn, function ()
		if uv0.bind_phone_status == 0 then
			if PLATFORM_NAME == "icebird" then
				if ICEBIRD_APPID and ICEBIRD_ACCESSTOKEN then
					WelfareController:getInstance():requestBindPhone(tostring(ICEBIRD_APPID), tostring(ICEBIRD_ACCESSTOKEN))
				end
			elseif PLATFORM_NAME == "9377" or PLATFORM_NAME == "9377ios" then
				WelfareController:getInstance():requestBindPhone(tostring(0), tostring(0))
			else
				WelfareController:getInstance():openCertifyBindPhoneWindow(true)
			end
		elseif uv0.bind_phone_status == 1 then
			message(TI18N("奖励已发送"))
		end
	end, true, 1)

	if slot0.bind_phone_event == nil then
		slot0.bind_phone_event = GlobalEvent:getInstance():Bind(WelfareEvent.UpdateBindPhoneStatus, function ()
			uv0:updateBindPhoneStatus()
		end)
	end
end

function BindPhonePanel.checkRedStatus(slot0)
	WelfareController:getInstance():setWelfareStatus(WelfareIcon.bindphone, false)
end

function BindPhonePanel.setItemList(slot0)
	if WelfareController:getInstance():getBindPhoneData() == nil or slot1.items == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1.items) do
		if slot0.item_list[slot5] == nil then
			slot0.item_list[slot5] = BackPackItem.new(false, true, false, 1, false, true)

			slot0.item_container:addChild(slot0.item_list[slot5])
			slot0.item_list[slot5]:setPosition(60 + (slot5 - 1) * 134, 66)
		end

		slot0.item_list[slot5]:setBaseData(slot6.bid, slot6.num)
	end
end

function BindPhonePanel.updateBindPhoneStatus(slot0)
	if WelfareController:getInstance():getBindPhoneData() == nil then
		return
	end

	if slot0.bind_phone_status ~= slot1.code then
		slot0.bind_phone_status = slot1.code

		if slot1.code == 0 then
			slot0.ok_btn_label:setString(TI18N("前往绑定"))
		elseif slot1.code == 1 then
			slot0.ok_btn_label:setString(TI18N("已发送"))
		end
	end
end

function BindPhonePanel.setVisibleStatus(slot0, slot1)
	bool = bool or false

	slot0:setVisible(slot1)
end

function BindPhonePanel.loadBackground(slot0)
	slot0.loader = loadSpriteTextureFromCDN(slot0.bg, PathTool.getPlistImgForDownLoad("bigbg/welfare", "txt_cn_bind_phone"), ResourcesType.single)
end

function BindPhonePanel.DeleteMe(slot0)
	if slot0.loader then
		slot0.loader:DeleteMe()
	end

	slot0.loader = nil

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.bind_phone_event then
		GlobalEvent:getInstance():UnBind(slot0.bind_phone_event)

		slot0.bind_phone_event = nil
	end
end
