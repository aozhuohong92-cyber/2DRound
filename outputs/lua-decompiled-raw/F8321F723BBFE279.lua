ActionLimitGiftMainPanel = class("ActionLimitGiftMainPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.sort
slot1 = string.format

function ActionLimitGiftMainPanel.ctor(slot0, slot1)
	slot0.data = slot1 or {}
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function ActionLimitGiftMainPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_limit_gift_main_panel"))

	slot0.root_wnd:setPosition(-40, -82)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.title_img = slot0.main_container:getChildByName("title_img")
	slot0.is_level_gift = false

	if slot0.data and slot0.data.config then
		if not slot0.item_load1 then
			slot0.item_load1 = loadSpriteTextureFromCDN(slot0.title_img, PathTool.getPlistImgForDownLoad("bigbg/limit_gift", slot0.data.config.res_1 or "txt_cn_action_limit_gift_level", true), ResourcesType.single, slot0.item_load1)
		end

		if slot0.data.config.codition and slot0.data.config.codition[1] ~= nil then
			slot0.level_img = slot0.main_container:getChildByName("level_img")

			if slot0.data.config.gift_type == 2 then
				slot0.is_level_gift = true
				slot3 = nil

				if not slot0.item_load then
					slot0.item_load = loadSpriteTextureFromCDN(slot0.level_img, PathTool.getPlistImgForDownLoad("bigbg/limit_gift", (slot0.data.config.res_2 == nil or slot0.data.config.res_2 == "") and "action_limit_gift_level_18" or slot0.data.config.res_2, false), ResourcesType.single, slot0.item_load)
				end
			end
		end
	end

	slot0.item_scrollview = slot0.main_container:getChildByName("item_scrollview")

	slot0.item_scrollview:setScrollBarEnabled(false)

	slot0.comfirm_btn = slot0.main_container:getChildByName("comfirm_btn")
	slot0.comfirm_label = slot0.comfirm_btn:getChildByName("label")
	slot0.time_val = slot0.main_container:getChildByName("time_val")

	slot0:setLessTime(slot0.data.end_time)

	slot0.value = slot0.main_container:getChildByName("value")

	if slot0.is_level_gift then
		slot0.time_val:setPosition(24, 380)
		slot0.item_scrollview:setPositionY(334)
		slot0.item_scrollview:setContentSize(cc.size(469, 240))
	end

	slot0.item_scrollview_size = slot0.item_scrollview:getContentSize()

	if slot0.data.config.gift_type == 3 then
		slot2 = 84

		slot0.value:setPositionY(slot0.value:getPositionY() - slot2)
		slot0.time_val:setPositionY(slot0.time_val:getPositionY() - slot2)
		slot0.item_scrollview:setPositionY(slot0.item_scrollview:getPositionY() - slot2)
		slot0.comfirm_btn:setPositionY(slot0.comfirm_btn:getPositionY() - slot2 + 3)
		slot0.comfirm_btn:setContentSize(cc.size(140, 64))
		slot0.comfirm_label:setPositionX(70)
	end

	slot0:setData()
end

function ActionLimitGiftMainPanel.register_event(slot0)
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

function ActionLimitGiftMainPanel.onComfirmBtn(slot0)
	if not slot0.data then
		return
	end

	if not slot0.data.config then
		return
	end

	if Config.ChargeData.data_charge_data[slot0.data.config.package_id or 0] then
		sdkOnPay(slot2.val, nil, slot2.id, slot2.name, slot2.name)
	end
end

function ActionLimitGiftMainPanel.setLessTime(slot0, slot1)
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
			else
				uv1:setTimeFormatString(uv0)
			end
		end))))
	else
		slot0:setTimeFormatString(slot2)
	end
end

function ActionLimitGiftMainPanel.setTimeFormatString(slot0, slot1)
	if slot1 > 0 then
		str = string.format(TI18N("剩余时间: %s"), TimeTool.GetTimeFormatDayIIIIII(slot1))

		slot0.time_val:setString(str)
	else
		slot0.time_val:setString("")
	end
end

function ActionLimitGiftMainPanel.setData(slot0, slot1)
	if not slot0.data then
		return
	end

	if not slot0.data.config then
		return
	end

	slot0.value:setString(uv0(TI18N("剩余: %s"), slot0.data.num or 0))

	if Config.ChargeData.data_charge_data[slot0.data.config.package_id] then
		slot0.comfirm_label:setString(slot3.val .. TI18N("元"))
	end

	slot7 = #(slot0.data.config.reward or {})

	slot0.item_scrollview:setInnerContainerSize(cc.size(math.max(slot0.item_scrollview_size.width, (BackPackItem.Width * 0.9 + 8) * slot7), slot0.item_scrollview_size.height))

	if slot7 <= 4 or slot0.is_level_gift then
		slot0.item_scrollview:setTouchEnabled(false)
	end

	slot0.item_list = {}
	slot0.start_x = slot6 * 0.5
	slot11 = 0
	slot11 = slot0.is_level_gift and slot0.item_scrollview_size.height * 0.75 or slot0.item_scrollview_size.height * 0.5
	slot12 = nil

	for slot16, slot17 in ipairs(slot4) do
		delayRun(slot0.item_scrollview, slot16 / display.DEFAULT_FPS, function ()
			if not uv0.item_list[uv1] then
				uv2 = BackPackItem.new(true, true)

				uv2:setAnchorPoint(0, 0.5)
				uv2:setScale(uv3)
				uv2:setSwallowTouches(false)
				uv0.item_scrollview:addChild(uv2)

				uv0.item_list[uv1] = uv2
				slot0 = 0

				if uv1 > 4 and uv0.is_level_gift then
					slot0 = uv0.start_x + (uv1 - 4 - 1) * (uv4 + uv5) + 4
					uv6 = uv0.item_scrollview_size.height * 0.25
				else
					slot0 = uv0.start_x + (uv1 - 1) * (uv4 + uv5) + 4
				end

				uv2:setPosition(slot0, uv6)
				uv2:setBaseData(uv7[1], uv7[2], true)
				uv2:setDefaultTip()
			end
		end)
	end
end

function ActionLimitGiftMainPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1 or false)
end

function ActionLimitGiftMainPanel.DeleteMe(slot0)
	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	doStopAllActions(slot0.item_scrollview)

	if slot0.item_load1 then
		slot0.item_load1:DeleteMe()

		slot0.item_load1 = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.role_lev_event and slot0.role_vo then
		slot0.role_lev_event = slot0.role_vo:UnBind(slot0.role_lev_event)
		slot0.role_lev_event = nil
	end

	doStopAllActions(slot0.time_val)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
