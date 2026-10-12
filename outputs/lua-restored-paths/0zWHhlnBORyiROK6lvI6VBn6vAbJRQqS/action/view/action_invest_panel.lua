ActionInvestPanel = class("ActionInvestPanel", function ()
	return ccui.Widget:create()
end)

function ActionInvestPanel.ctor(slot0, slot1, slot2)
	slot0.holiday_bid = slot1
	slot0.type = slot2
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()
	slot0.can_get = 0
	slot0.item_list = {}

	slot0:configUI()
	slot0:register_event()
end

function ActionInvestPanel.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("action/action_invest_panel"))

	slot0.root_wnd:setPosition(-40, -120)
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setAnchorPoint(0, 0)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")
	slot0.bg = slot0.main_container:getChildByName("bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg/action", "txt_cn_action_invest_bg", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.bg) then
				uv0.bg:loadTexture(uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.btn = slot0.main_container:getChildByName("btn")

	slot0.btn:setTitleText(TI18N("￥88购买"))

	slot0.btn.label = slot0.btn:getTitleRenderer()

	if slot0.btn.label ~= nil then
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
	end

	slot0.login_label = slot0.main_container:getChildByName("login_label")
	slot0.return_label = createRichLabel(30, 1, cc.p(0, 0.5), cc.p(535, slot0.btn:getPositionY()))

	slot0.return_label:setString(TI18N("<div fontcolor=#e0d5ab>已返：</div><div fontcolor=#35ff14>50%</div>"))
	slot0.main_container:addChild(slot0.return_label)
	slot0.return_label:setVisible(false)

	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.main_container, cc.p(0, 180), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(720, 400), {
		start_y = 0,
		once_num = 1,
		start_x = 0,
		item_width = 720,
		space_x = 0,
		row = 1,
		item_height = 57,
		space_y = 4,
		col = 1,
		need_dynamic = true,
		item_class = ActionInvestItem
	})
end

function ActionInvestPanel.register_event(slot0)
	if not slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():Bind(ActionEvent.UPDATE_HOLIDAY_SIGNLE, function (slot0)
			if slot0.bid == uv0.holiday_bid then
				if slot0.finish == 0 then
					ActionController:getInstance():setHolidayStatus(uv0.holiday_bid, false)
				end

				uv0.data = slot0
				uv0.day = slot0.finish

				if slot0.finish == 0 then
					if slot0.aim_list and next(slot0.aim_list) ~= nil then
						uv0.btn:setTitleText(TI18N("￥88购买"))
						uv0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
						uv0:createList(slot0.aim_list)
						uv0.login_label:setString(TI18N("累计登录：") .. slot0.finish .. TI18N("天"))
					else
						uv0.login_label:setString(TI18N("累计登录：7天"))
						uv0.return_label:setString(string.format(TI18N("<div fontcolor=#e0d5ab>已返：</div><div fontcolor=#35ff14>%s</div>"), "800%"))
						uv0.btn:setTitleText(TI18N("已领取"))

						slot1 = PathTool.getResFrame("welfare", "welfare_btn2")

						uv0.btn:loadTextures(slot1, slot1, nil, LOADTEXT_TYPE_PLIST)
						uv0.btn.label:enableOutline(Config.ColorData.data_color4[177], 2)

						if uv0.item_list[7] then
							uv0.item_list[7].gou:setVisible(true)
						end
					end
				else
					uv0.return_label:setVisible(true)

					if slot0.aim_list and next(slot0.aim_list) ~= nil then
						uv0:createList(slot0.aim_list)

						slot1 = 0
						slot2 = nil

						for slot6, slot7 in pairs(slot0.aim_list) do
							if slot7.status == 1 then
								slot2 = slot7.aim

								break
							elseif slot7.status == 2 then
								slot1 = slot1 + 1
							end
						end

						uv0.can_get = slot2 or slot1

						uv0.login_label:setString(TI18N("累计登录：") .. slot0.finish .. TI18N("天"))

						slot3 = ""

						uv0.return_label:setString(string.format(TI18N("<div fontcolor=#e0d5ab>已返：</div><div fontcolor=#35ff14>%s</div>"), (not slot0.aim_list[slot1] or slot0.aim_list[slot1].aim_str) and "0%"))

						uv0.status = slot0.aim_list[uv0.can_get].status

						if uv0.status == 0 then
							-- Nothing
						elseif uv0.status == 1 then
							uv0.btn.label:enableOutline(Config.ColorData.data_color4[154], 2)
							uv0.btn:setTitleText(TI18N("可领取"))

							slot4 = PathTool.getResFrame("welfare", "welfare_btn")

							uv0.btn:loadTextures(slot4, slot4, nil, LOADTEXT_TYPE_PLIST)
						elseif uv0.status == 2 then
							if uv0.can_get + 1 < 7 then
								uv0.btn:setTitleText(TI18N("明天可领"))

								slot4 = PathTool.getResFrame("welfare", "welfare_btn2")

								uv0.btn:loadTextures(slot4, slot4, nil, LOADTEXT_TYPE_PLIST)
								uv0.btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
							else
								uv0.btn:setTitleText(TI18N("已领取"))

								slot4 = PathTool.getResFrame("welfare", "welfare_btn2")

								uv0.btn:loadTextures(slot4, slot4, nil, LOADTEXT_TYPE_PLIST)
								uv0.btn.label:enableOutline(Config.ColorData.data_color4[177], 2)
							end
						end
					end
				end
			end
		end)
	end

	slot0.btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.data.finish == 0 then
				slot2 = Config.ChargeData.data_charge_data[100]

				sdkOnPay(slot2.val, nil, slot2.id, slot2.name)

				return
			end

			if uv0.status and uv0.status == 1 then
				uv0.ctrl:cs16604(uv0.holiday_bid, uv0.can_get)
			end
		end
	end)
end

function ActionInvestPanel.createList(slot0, slot1)
	slot0.item_scrollview:setData(slot1)
end

function ActionInvestPanel.setVisibleStatus(slot0, slot1)
	WelfareController:getInstance():setWelfareStatus(ActionSpecialID.growfund, false)

	slot1 = slot1 or false

	slot0:setVisible(slot1)

	if slot1 == true then
		ActionController:getInstance():cs16603(slot0.holiday_bid)
	end
end

function ActionInvestPanel.DeleteMe(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()
	end

	slot0.item_scrollview = nil

	if slot0.update_action_even_event then
		slot0.update_action_even_event = GlobalEvent:getInstance():UnBind(slot0.update_action_even_event)
		slot0.update_action_even_event = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end
end

ActionInvestItem = class("ActionInvestItem", function ()
	return ccui.Widget:create()
end)

function ActionInvestItem.ctor(slot0)
	slot0.ctrl = ActionController:getInstance()
	slot0.role_vo = RoleController:getInstance():getRoleVo()

	slot0:configUI()
	slot0:register_event()
end

function ActionInvestItem.configUI(slot0)
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setContentSize(cc.size(720, 57))
	slot0.root_wnd:setAnchorPoint(0.5, 0.5)
	slot0:addChild(slot0.root_wnd)

	slot0.bg = createScale9Sprite(PathTool.getResFrame("welfare", "welfare_title3"), 0, 0, LOADTEXT_TYPE_PLIST, slot0.root_wnd)

	slot0.bg:setContentSize(slot0.root_wnd:getContentSize())
	slot0.bg:setAnchorPoint(0, 0)

	slot0.gold = createRichLabel(30, 175, cc.p(0, 0.5), cc.p(305, slot0.bg:getContentSize().height / 2))

	slot0.bg:addChild(slot0.gold)

	slot0.coin = createRichLabel(30, 175, cc.p(0, 0.5), cc.p(508, slot0.bg:getContentSize().height / 2))

	slot0.bg:addChild(slot0.coin)

	slot0.gou = createImage(slot0.bg, PathTool.getResFrame("common", "common_1043"), 25, slot0.bg:getContentSize().height / 2, cc.p(0.5, 0.5), true)

	slot0.gou:setVisible(false)

	slot0.title_bg = createImage(slot0.bg, PathTool.getResFrame("welfare", "welfare_btn3"), 140, slot0.bg:getContentSize().height / 2, cc.p(0.5, 0.5), true)

	slot0.title_bg:setVisible(false)

	slot0.day = createRichLabel(30, 175, cc.p(0, 0.5), cc.p(85, slot0.bg:getContentSize().height / 2))

	slot0.bg:addChild(slot0.day)
end

function ActionInvestItem.setData(slot0, slot1)
	slot2 = 175
	slot3 = PathTool.getResFrame("welfare", "welfare_title4")

	slot0.title_bg:setVisible(true)

	if slot1.aim % 2 == 0 then
		slot3 = PathTool.getResFrame("welfare", "welfare_title3")

		slot0.title_bg:setVisible(false)

		slot2 = 98
	end

	slot0.day:setString(string.format(TI18N("<div fontcolor=%s>登录%s天</div>"), tranformC3bTostr(slot2), slot1.aim))
	loadScale9SpriteTexture(slot0.bg, slot3, LOADTEXT_TYPE_PLIST)
	slot0.bg:setContentSize(slot0.root_wnd:getContentSize())
	slot0.gou:setVisible(slot1.status == 2)
	slot0.gold:setString(string.format(TI18N("<img src=%s scale=0.4 visible=true /><div fontcolor=#200b06>x%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1.item_list[1].bid).icon), slot1.item_list[1].num))

	if slot1.item_list[2] then
		slot0.coin:setString(string.format(TI18N("<img src=%s scale=0.4 visible=true /><div fontcolor=#200b06>x%s</div>"), PathTool.getItemRes(Config.ItemData.data_get_data(slot1.item_list[2].bid).icon), slot1.item_list[2].num))
	end
end

function ActionInvestItem.register_event(slot0)
end

function ActionInvestItem.DeleteMe(slot0)
end
