RedBagItem = class("RedBagItem", function ()
	return ccui.Widget:create()
end)

function RedBagItem.ctor(slot0)
	slot0:config()
	slot0:layoutUI()
	slot0:registerEvents()
end

function RedBagItem.config(slot0)
	slot0.size = cc.size(262, 327)

	slot0:setTouchEnabled(true)
	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0.5, 0.5))

	slot0.is_show_point = false
	slot0.open_type = 0
	slot0.star_list = {}
	slot0.is_can_get = true
end

function RedBagItem.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("redbag/redbag_item"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.label_panel = slot0.main_panel:getChildByName("label_panel")
	slot0.title = slot0.main_panel:getChildByName("title")

	slot0.title:setString(TI18N("我是红包标题"))

	slot0.coin_icon = slot0.main_panel:getChildByName("coin_icon")

	loadSpriteTexture(slot0.coin_icon, PathTool.getResFrame("redbag", "redbag_4"), LOADTEXT_TYPE_PLIST)

	slot0.black_bg = slot0.main_panel:getChildByName("black_bg")

	slot0.black_bg:setVisible(false)

	slot0.finish_icon = slot0.main_panel:getChildByName("finish_icon")

	slot0.finish_icon:setVisible(false)

	slot0.status_icon = slot0.main_panel:getChildByName("status_icon")

	slot0.status_icon:setVisible(false)

	slot0.get_status = slot0.main_panel:getChildByName("get_status")

	slot0.get_status:setVisible(true)

	slot0.desc_label = createRichLabel(20, Config.ColorData.data_color4[1], cc.p(0.5, 1), cc.p(slot0.size.width / 2, 288), nil, , 600)

	slot0.label_panel:addChild(slot0.desc_label)
	slot0.desc_label:setString(TI18N("我是描述描述描述"))

	slot0.role_name = createRichLabel(20, cc.c4b(112, 0, 22, 255), cc.p(0.5, 0), cc.p(slot0.size.width / 2, 20), nil, , 500)

	slot0.label_panel:addChild(slot0.role_name)
	slot0.role_name:setString(string.format(TI18N("来自<div fontcolor=#ffea96>我是名字哦</div>(成员)")))

	slot0.other_label = createRichLabel(22, Config.ColorData.data_color4[1], cc.p(0.5, 0), cc.p(slot0.size.width / 2, 20), nil, , 500)

	slot0.label_panel:addChild(slot0.other_label)
	slot0.other_label:setVisible(false)
	slot0.other_label:setString(TI18N("向公会发送大量贝里"))
end

function RedBagItem.setData(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = slot1

	if slot1.open_type and slot1.open_type == 1 then
		slot2 = slot1.data
	end

	slot0.open_type = slot1.open_type or 0
	slot0.data = slot2
	slot3 = PathTool.getResFrame("redbag", "redbag_4")

	if slot0.open_type == 1 then
		slot0.title:setString(slot2.name or "")
		slot0.role_name:setString("")
		slot0.desc_label:setString("")
		slot0.get_status:setVisible(false)
		slot0.other_label:setVisible(true)
		slot0.other_label:setString(slot2.desc or "")

		slot3 = PathTool.getResFrame("redbag", slot2.res_name)
	else
		if Config.GuildData.data_position[slot2.post or 3] then
			slot0.role_name:setString(string.format(TI18N("来自<div fontcolor=#ffea96>%s</div>(%s)"), slot2.name or "", slot6.name or ""))
		end

		if Config.GuildData.data_guild_red_bag[slot2.type] then
			slot0.title:setString(slot7.name or "")

			slot3 = PathTool.getResFrame("redbag", slot7.res_name)

			slot0.desc_label:setString(slot7.desc)
		end

		slot0:updateStatus(slot2)
	end

	loadSpriteTexture(slot0.coin_icon, slot3, LOADTEXT_TYPE_PLIST)
end

function RedBagItem.updateStatus(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.is_can_get = true
	slot0.is_finish = false

	if slot1.max_num <= slot1.num then
		slot0.is_finish = true
	end

	slot0.is_out_time = false

	if slot1.time - GameNet:getInstance():getTime() <= 0 then
		slot0.is_out_time = true
	end

	slot0.my_status = slot1.flag

	doStopAllActions(slot0.get_status)

	if slot0.my_status == 1 then
		slot0.finish_icon:setVisible(true)

		slot0.is_can_get = false
	else
		slot0.finish_icon:setVisible(false)
	end

	slot5 = nil

	if slot0.is_finish == true then
		slot5 = PathTool.getResFrame("redbag", "txt_cn_redbag_3")
		slot0.is_can_get = false
	elseif slot0.is_out_time == true then
		slot5 = PathTool.getResFrame("redbag", "txt_cn_redbag_1")
		slot0.is_can_get = false
	end

	if slot5 then
		slot0.status_icon:loadTexture(slot5, LOADTEXT_TYPE_PLIST)
	end

	slot0.status_icon:setVisible(slot0.is_finish or slot0.is_out_time)
	slot0.black_bg:setVisible(slot0.is_finish or slot0.is_out_time or slot0.my_status == 1)
	breatheShineAction(slot0.get_status, 0.8, 0.8)
	slot0.get_status:setVisible(slot0.is_can_get)
end

function RedBagItem.registerEvents(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.call_fun then
				uv0:call_fun(uv0.data)
			end
		end
	end)
end

function RedBagItem.getIsCanGet(slot0)
	return slot0.is_can_get
end

function RedBagItem.clickHandler(slot0)
	if slot0.call_fun then
		slot0:call_fun(slot0.data)
	end
end

function RedBagItem.addCallBack(slot0, slot1)
	slot0.call_fun = slot1
end

function RedBagItem.showBlackBg(slot0, slot1)
	slot0.black_bg:setVisible(slot1 or false)
end

function RedBagItem.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RedBagItem.getData(slot0)
	return slot0.data
end

function RedBagItem.DeleteMe(slot0)
end
