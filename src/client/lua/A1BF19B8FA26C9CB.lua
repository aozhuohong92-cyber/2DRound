GuildwarAwardBoxWindow = GuildwarAwardBoxWindow or BaseClass(BaseView)
slot1 = GuildwarController:getInstance():getModel()

function GuildwarAwardBoxWindow.__init(slot0)
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.layout_name = "guildwar/guildwar_award_box_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("guildwar", "guildwar"),
			type = ResourcesType.plist
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_3"),
			type = ResourcesType.single
		},
		{
			path = PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_4"),
			type = ResourcesType.single
		}
	}
end

function GuildwarAwardBoxWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background then
		slot0.background:setScale(display.getMaxScale())
	end

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("公会战奖励"))

	slot0.time_tips = slot1:getChildByName("time_tips")
	slot0.tips_txt = slot1:getChildByName("tips_txt")

	slot0.tips_txt:setString(TI18N("宝箱在公会战结束后产生，成员每人可开启1次，试试你的手气吧！"))

	slot0.title_label = slot1:getChildByName("title_label")
	slot0.line_1 = slot1:getChildByName("line_1")
	slot0.line_2 = slot1:getChildByName("line_2")
	slot0.explain_btn = slot1:getChildByName("explain_btn")
	slot0.preview_btn = slot1:getChildByName("preview_btn")

	slot0.preview_btn:getChildByName("label"):setString(TI18N("奖励预览"))
	slot0.preview_btn:setVisible(false)

	slot0.no_box_image = slot1:getChildByName("no_box_image")

	slot0.no_box_image:getChildByName("label"):setString(TI18N("公会战尚未结算，暂无奖励内容"))

	slot3 = slot1:getChildByName("box_list")
	slot0.box_scrollview = CommonScrollViewLayout.new(slot3, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot3:getContentSize(), {
		start_y = 0,
		item_width = 206,
		start_x = 0,
		space_x = 6,
		row = 0,
		item_height = 218,
		space_y = 6,
		col = 3,
		need_dynamic = true,
		item_class = GuildwarAwardBoxItem
	})

	slot0.box_scrollview:setSwallowTouches(false)
end

function GuildwarAwardBoxWindow.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openAwardBoxWindow(false)
	end, false, 2)
	registerButtonEventListener(slot0.explain_btn, function (slot0, slot1)
		if Config.GuildWarData.data_const.box_rule then
			TipsManager:getInstance():showCommonTips(slot2.desc, slot1:getTouchBeganPosition())
		end
	end)
	registerButtonEventListener(slot0.preview_btn, function ()
		uv0:openAwardBoxPreview(true)
	end, true)
	slot0:addGlobalEvent(GuildwarEvent.UpdateGuildWarBoxDataEvent, function (slot0)
		uv0:setData(slot0)
	end)
	slot0:addGlobalEvent(GuildwarEvent.UpdateMyAwardBoxEvent, function ()
		uv0:refreshTimeTips()
	end)
end

function GuildwarAwardBoxWindow.openRootWnd(slot0)
	uv0:requestAwardBoxData()
end

function GuildwarAwardBoxWindow.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.data = slot1

	if slot0.data.end_time <= GameNet:getInstance():getTime() or next(uv0:getGuildWarBoxData()) == nil then
		slot0.no_box_image:setVisible(true)
		slot0.title_label:setVisible(false)
		slot0.time_tips:setVisible(false)
		slot0.line_1:setVisible(false)
		slot0.line_2:setVisible(false)
		slot0.box_scrollview:setVisible(false)
		slot0.box_scrollview:setData({})
	else
		slot0.no_box_image:setVisible(false)
		slot0.title_label:setVisible(true)
		slot0.time_tips:setVisible(true)
		slot0.line_1:setVisible(true)
		slot0.line_2:setVisible(true)
		slot0.box_scrollview:setVisible(true)
		slot0:refreshTimeTips()

		if slot0.data.result == GuildwarConst.box_type.gold then
			slot0.title_label:setString(TI18N("公会战荣耀黄金宝箱"))
		else
			slot0.title_label:setString(TI18N("公会战激励青铜宝箱"))
		end

		slot0.box_scrollview:setData(slot2)
	end
end

function GuildwarAwardBoxWindow.refreshTimeTips(slot0)
	if slot0.data and slot0.time_tips then
		if slot0.data.status == 0 then
			slot0.time_tips:setString(string.format(TI18N("您此前处于不活跃状态，不可开启宝箱")))
			slot0.time_tips:setTextColor(cc.c3b(217, 80, 20))
			slot0:openBoxAwardTimer(false)
		elseif uv0:checkIsGetBoxAward() then
			slot0.time_tips:setString(string.format(TI18N("您已开启过宝箱")))
			slot0.time_tips:setTextColor(cc.c3b(36, 144, 3))
			slot0:openBoxAwardTimer(false)
		else
			if slot0.data.end_time - GameNet:getInstance():getTime() < 0 then
				slot2 = 0
			end

			slot0.time_tips:setString(string.format(TI18N("请在%s内领取宝箱"), TimeTool.GetTimeFormat(slot2)))
			slot0.time_tips:setTextColor(cc.c3b(36, 144, 3))
			slot0:openBoxAwardTimer(true)
		end
	end
end

function GuildwarAwardBoxWindow.openBoxAwardTimer(slot0, slot1)
	if slot1 == true then
		if not slot0.box_award_timer then
			slot0.box_award_timer = GlobalTimeTicket:getInstance():add(function ()
				if uv0.data then
					if uv0.data.end_time - GameNet:getInstance():getTime() < 0 then
						slot1 = 0

						GlobalTimeTicket:getInstance():remove(uv0.box_award_timer)

						uv0.box_award_timer = nil
					end

					uv0.time_tips:setString(string.format(TI18N("请在%s内领取宝箱"), TimeTool.GetTimeFormat(slot1)))
				else
					GlobalTimeTicket:getInstance():remove(uv0.box_award_timer)

					uv0.box_award_timer = nil
				end
			end, 1)
		end
	elseif slot0.box_award_timer ~= nil then
		GlobalTimeTicket:getInstance():remove(slot0.box_award_timer)

		slot0.box_award_timer = nil
	end
end

function GuildwarAwardBoxWindow.close_callback(slot0)
	if slot0.box_scrollview then
		slot0.box_scrollview:DeleteMe()

		slot0.box_scrollview = nil
	end

	slot0:openBoxAwardTimer(false)
	uv0:openAwardBoxWindow(false)
end

GuildwarAwardBoxItem = class("GuildwarAwardBoxItem", function ()
	return ccui.Widget:create()
end)

function GuildwarAwardBoxItem.ctor(slot0)
	slot0:configUI()
	slot0:register_event()
end

function GuildwarAwardBoxItem.configUI(slot0)
	slot0.size = cc.size(206, 218)

	slot0:setTouchEnabled(false)
	slot0:setContentSize(slot0.size)

	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("guildwar/guildwar_award_box_item"))

	slot0:addChild(slot0.root_wnd)

	slot2 = slot0.root_wnd:getChildByName("container")
	slot0.container = slot2
	slot0.image_box = slot2:getChildByName("image_box")
	slot0.name_txt = slot2:getChildByName("name_txt")

	slot0.name_txt:setVisible(false)
	slot0.container:setSwallowTouches(false)

	slot0.load_image_flag = false
end

function GuildwarAwardBoxItem.setData(slot0, slot1)
	if slot0.data ~= nil and slot0.update_self_event ~= nil then
		slot0.data:UnBind(slot0.update_self_event)

		slot0.update_self_event = nil
	end

	if slot1 ~= nil then
		slot0.data = slot1

		if slot0.update_self_event == nil then
			slot0.update_self_event = slot0.data:Bind(GuildwarEvent.UpdateSingleBoxDataEvent, function ()
				uv0:refreshBoxItem()
			end)
		end

		slot0:refreshBoxItem()
	end
end

function GuildwarAwardBoxItem.refreshBoxItem(slot0)
	if not slot0.data then
		return
	end

	if slot0.data.rid == 0 then
		slot0.container:setTouchEnabled(true)
		slot0.image_box:setVisible(true)
		slot0.name_txt:setVisible(false)

		if slot0.item_node then
			slot0.item_node:setVisible(false)
		end

		if not slot0.load_image_flag then
			slot0.load_image_flag = true

			if slot0.data.status == GuildwarConst.box_type.gold then
				slot0.image_box:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_3"), LOADTEXT_TYPE)
			elseif slot0.data.status == GuildwarConst.box_type.copper then
				slot0.image_box:loadTexture(PathTool.getPlistImgForDownLoad("bigbg/guildwar", "guildwar_4"), LOADTEXT_TYPE)
			end
		end
	else
		slot0.container:setTouchEnabled(false)
		slot0.image_box:setVisible(false)
		slot0.name_txt:setVisible(true)

		if not slot0.item_node then
			slot0.item_node = BackPackItem.new(false, true, false)

			slot0.item_node:setDefaultTip(true)
			slot0.item_node:setPosition(cc.p(slot0.size.width / 2, 130))
			slot0.container:addChild(slot0.item_node)
		end

		slot0.item_node:setVisible(true)
		slot0.item_node:setBaseData(slot0.data.item_id, slot0.data.item_num)
		slot0.name_txt:setString(slot0.data.name)

		if slot0.data.rid == RoleController:getInstance():getRoleVo().rid and slot0.data.sid == slot1.srv_id then
			slot0.name_txt:setTextColor(cc.c3b(36, 144, 3))
		else
			slot0.name_txt:setTextColor(cc.c3b(100, 50, 35))
		end
	end
end

function GuildwarAwardBoxItem.register_event(slot0)
	slot0.container:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 then
				playButtonSound2()

				if uv0.data then
					uv1:requestGetBoxAward(uv0.data.order)
				end
			end
		end
	end)
end

function GuildwarAwardBoxItem.suspendAllActions(slot0)
	if slot0.data ~= nil then
		if slot0.update_self_event ~= nil then
			slot0.data:UnBind(slot0.update_self_event)

			slot0.update_self_event = nil
		end

		slot0.data = nil
	end
end

function GuildwarAwardBoxItem.DeleteMe(slot0)
	slot0:suspendAllActions()

	if slot0.item_node then
		slot0.item_node:DeleteMe()

		slot0.item_node = nil
	end
end
