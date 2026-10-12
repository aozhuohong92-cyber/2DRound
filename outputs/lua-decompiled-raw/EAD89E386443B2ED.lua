RedBagLookWindow = RedBagLookWindow or BaseClass(BaseView)
slot0 = table.sort

function RedBagLookWindow.__init(slot0, slot1)
	slot0.ctrl = RedbagController:getInstance()
	slot0.is_full_screen = false
	slot0.layout_name = "redbag/redbag_look"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("redbag", "redbag"),
			type = ResourcesType.plist
		}
	}
	slot0.effect_cache_list = {}
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.data = slot1
	slot0.cache_list = {}
end

function RedBagLookWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.size = slot0.main_panel:getContentSize()
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.label_panel = slot0.main_panel:getChildByName("label_panel")
	slot0.title = slot0.label_panel:getChildByName("title")
	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0.main_panel:addChild(slot0.head_icon)
	slot0.head_icon:setPosition(cc.p(slot0.size.width / 2, 575))
	slot0.head_icon:setAnchorPoint(cc.p(0.5, 0))
	slot0.head_icon:setTouchEnabled(true)
	slot0.head_icon:addTouchEventListener(function (slot0, slot1)
		if ccui.TouchEventType.ended == slot1 and uv0.data then
			slot3 = cc.p(slot0:getTouchEndPosition().x + 320, slot0:getTouchEndPosition().y)

			if RoleController:getInstance():getRoleVo().rid == uv0.data.rid and slot2.srv_id == uv0.data.srv_id then
				return
			end

			ChatController:getInstance():openFriendInfo(uv0.data, slot3)
		end
	end)

	slot0.status_bg = slot0.main_panel:getChildByName("status_bg")

	slot0.status_bg:setVisible(false)

	slot0.desc_label = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0.5, 0), cc.p(slot0.size.width / 2, 680), nil, , 500)

	slot0.label_panel:addChild(slot0.desc_label)

	slot0.role_name = createRichLabel(20, cc.c4b(112, 0, 22, 255), cc.p(0.5, 0), cc.p(slot0.size.width / 2, 560), nil, , 500)

	slot0.label_panel:addChild(slot0.role_name)
	slot0.desc_label:setString(TI18N("我是描述描述描述"))
	slot0.role_name:setString(string.format(TI18N("<div fontcolor=#ffea96>我是名字啊哦</div>的红包")))

	slot0.less_num = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0, 0), cc.p(20, 30), nil, , 500)

	slot0.label_panel:addChild(slot0.less_num)

	slot0.less_time = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0.5, 0), cc.p(360, 30), nil, , 500)

	slot0.label_panel:addChild(slot0.less_time)
	slot0.less_time:setString(TI18N("剩余时间：00:00:00"))
end

function RedBagLookWindow.register_event(slot0)
	slot0.background:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openLookWindow(false)
		end
	end)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0.ctrl:openLookWindow(false)
		end
	end)

	if not slot0.get_list_event then
		slot0.get_list_event = GlobalEvent:getInstance():Bind(RedbagEvent.Get_List_Event, function (slot0)
			uv0:updateMessage(slot0)
			uv0:updateMemberList(slot0)
		end)
	end
end

function RedBagLookWindow.updateMessage(slot0, slot1)
	if not slot1 then
		return
	end

	if not slot0.data then
		return
	end

	slot0.status_bg:setVisible(false)

	slot0.list_data = slot1

	slot0.head_icon:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	if Config.AvatarData.data_avatar[slot1.avatar_bid] then
		slot0.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1), false, false), nil, false, slot2.offy)
	end

	if not Config.GuildData.data_guild_red_bag[slot0.data.type] then
		return
	end

	slot0.red_config = slot3

	slot0.title:setString(slot3.name)
	slot0.role_name:setString(string.format(TI18N("<div fontcolor=#ffea96>%s</div>的红包"), slot1.name or ""))

	if Config.GuildData.data_guild_red_bag[slot1.type] then
		slot0.desc_label:setString(slot5.msg)
	end

	if slot0.data.max_num <= slot0.data.num then
		slot0.status_bg:setVisible(true)
	end

	slot0.less_num:setString(string.format(TI18N("剩余个数：%s/%s"), slot0.data.max_num - slot0.data.num, slot0.data.max_num))

	if slot0.less_timer then
		GlobalTimeTicket:getInstance():remove(slot0.less_timer)

		slot0.less_timer = nil
	end

	if (slot0.data.time or 0) - GameNet:getInstance():getTime() <= 0 then
		slot0.less_time:setString(TI18N("剩余时间：已过期"))

		return
	end

	if not slot0.less_timer then
		slot0.less_timer = GlobalTimeTicket:getInstance():add(function ()
			uv0.less_time:setString(TI18N("剩余时间：") .. TimeTool.GetTimeFormatDay(uv1 - GameNet:getInstance():getTime()))

			uv1 = uv1 - 1
		end, 1)
	end
end

function RedBagLookWindow.updateMemberList(slot0, slot1)
	if not slot0.list_view then
		slot0.list_view = CommonScrollViewLayout.new(slot0.main_panel, cc.p(19, 66), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(450, 400), {
			start_y = 10,
			item_width = 455,
			start_x = 1,
			space_x = 2,
			row = 1,
			item_height = 93,
			space_y = 3,
			col = 1,
			item_class = RedBagLookItem
		})
	end

	slot2 = slot1.list or {}

	uv0(slot2, SortTools.tableUpperSorter({
		"val",
		"time"
	}))
	slot0.list_view:setData(slot2, function (slot0, slot1)
	end, nil, slot0.red_config)
end

function RedBagLookWindow.openRootWnd(slot0)
	if not slot0.data then
		return
	end

	slot0.ctrl:sender13540(slot0.data.id)
end

function RedBagLookWindow.setPanelData(slot0)
end

function RedBagLookWindow.close_callback(slot0)
	slot0.ctrl:openLookWindow(false)

	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	if slot0.get_list_event then
		GlobalEvent:getInstance():UnBind(slot0.get_list_event)

		slot0.get_list_event = nil
	end

	if slot0.less_timer then
		GlobalTimeTicket:getInstance():remove(slot0.less_timer)

		slot0.less_timer = nil
	end
end

RedBagLookItem = class("RedBagLookItem", function ()
	return ccui.Widget:create()
end)

function RedBagLookItem.ctor(slot0, slot1)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RedBagLookItem.config(slot0)
	slot0.ctrl = RedbagController:getInstance()
	slot0.size = cc.size(455, 93)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))
end

function RedBagLookItem.layoutUI(slot0)
	slot0.bg = createImage(slot0, PathTool.getResFrame("redbag", "redbag_7"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 0, true)

	slot0.bg:setContentSize(slot0.size)

	slot0.me_bg = createImage(slot0, PathTool.getResFrame("redbag", "redbag_6"), slot0.size.width / 2, slot0.size.height / 2, cc.p(0.5, 0.5), true, 0, true)

	slot0.me_bg:setContentSize(slot0.size)
	slot0.me_bg:setVisible(false)

	slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

	slot0:addChild(slot0.head_icon)
	slot0.head_icon:setPosition(cc.p(10, 44))
	slot0.head_icon:setAnchorPoint(cc.p(0, 0.5))
	slot0.head_icon:setTouchEnabled(true)
	slot0.head_icon:setScale(0.7)
	slot0.head_icon:addTouchEventListener(function (slot0, slot1)
		if ccui.TouchEventType.ended == slot1 and uv0.data then
			slot3 = cc.p(slot0:getTouchEndPosition().x + 320, slot0:getTouchEndPosition().y)

			if RoleController:getInstance():getRoleVo().rid == uv0.data.rid and slot2.srv_id == uv0.data.srv_id then
				return
			end

			ChatController:getInstance():openFriendInfo(uv0.data, slot3)
		end
	end)

	slot0.me_icon = createImage(slot0, PathTool.getResFrame("redbag", "txt_cn_redbag_5"), 0, 47, cc.p(0, 0), true, 1, false)

	slot0.me_icon:setVisible(false)

	slot0.role_name = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0, 0), cc.p(95, 47), nil, , 500)

	slot0:addChild(slot0.role_name)

	slot0.get_time = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0, 0), cc.p(95, 13), nil, , 500)

	slot0:addChild(slot0.get_time)

	slot0.money_label = createRichLabel(24, Config.ColorData.data_color4[1], cc.p(1, 0.5), cc.p(435, slot0.size.height / 2), nil, , 500)

	slot0:addChild(slot0.money_label)
	slot0.role_name:setString(TI18N("我是名字xx(成员)"))
	slot0.me_icon:setPositionX(slot0.role_name:getPositionX() + slot0.role_name:getContentSize().width + 10)
	slot0.get_time:setString("7-12 19:00:00")
	slot0.money_label:setString(string.format("8888888<img src='%s' scale=0.4 />", PathTool.getItemRes(2)))
end

function RedBagLookItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	if slot1 and slot1._index and slot1._index % 2 == 0 then
		slot0.bg:setVisible(true)
	else
		slot0.bg:setVisible(false)
	end

	slot0:showFirstIcon(false)

	if slot1._index and slot1._index == 1 then
		slot0:showFirstIcon(true)
	end

	slot0.head_icon:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)

	if Config.AvatarData.data_avatar[slot1.avatar_bid] then
		slot0.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot2.res_id or 1), false, false), nil, false, slot2.offy)
	end

	if Config.GuildData.data_position[slot1.post or 3] then
		slot0.role_name:setString(string.format("%s(%s)", slot1.name or "", slot5.name or ""))
		slot0.me_icon:setPositionX(slot0.role_name:getPositionX() + slot0.role_name:getContentSize().width + 10)
	end

	slot0.get_time:setString(TimeTool.getYMDHMS(slot1.time or 0))

	if not slot0.extend_data then
		return
	end

	if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot0.extend_data.assets] or "") then
		slot0.money_label:setString(string.format(TI18N("%s <img src='%s' scale=0.35 />"), slot1.val or 0, PathTool.getItemRes(slot10.icon)))
	end

	slot11 = RoleController:getInstance():getRoleVo()

	slot0.me_icon:setVisible(false)

	if slot0.me_bg then
		slot0.me_bg:setVisible(false)
	end

	if slot11.rid == slot1.rid and slot11.srv_id == slot1.srv_id then
		slot0.me_icon:setVisible(true)
		slot0.me_bg:setVisible(true)
	end
end

function RedBagLookItem.showFirstIcon(slot0, slot1)
	if slot1 == false and not slot0.first_icon then
		return
	end

	if not slot0.first_icon then
		slot0.first_icon = createImage(slot0, PathTool.getResFrame("redbag", "txt_cn_redbag_4"), 34, 70, cc.p(0.5, 0.5), true, 10, false)
	end

	slot0.first_icon:setVisible(slot1)
end

function RedBagLookItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data)
			end
		end
	end)
end

function RedBagLookItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function RedBagLookItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function RedBagLookItem.setExtendData(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.extend_data = slot1
end

function RedBagLookItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RedBagLookItem.getData(slot0)
	return slot0.data
end

function RedBagLookItem.DeleteMe(slot0)
	if slot0.head_icon then
		slot0.head_icon:DeleteMe()

		slot0.head_icon = nil
	end

	slot0:removeFromParent()
end
