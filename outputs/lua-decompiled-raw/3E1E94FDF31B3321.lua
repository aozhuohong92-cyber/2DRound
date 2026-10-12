RedBagSendPanel = class("RedBagSendPanel", function ()
	return ccui.Widget:create()
end)
slot0 = table.insert

function RedBagSendPanel.ctor(slot0, slot1)
	slot0:config(slot1)
	slot0:layoutUI()
	slot0:registerEvents()
	slot0:requireProto()
end

function RedBagSendPanel.config(slot0, slot1)
	slot0.ctrl = RedbagController:getInstance()
	slot0.size = cc.size(644, 740)

	slot0:setContentSize(slot0.size)
	slot0:setTouchEnabled(false)

	slot0.is_can_save = false
	slot0.item_list = {}
	slot0.need_list = {}
	slot0.default_msg = TI18N("身为土豪，有钱任性")
	slot0.is_send_proto = false
	slot0.use_assert = 0
	slot0.msg_list = {}
	slot0.extend_id = slot1 or slot0.ctrl:getModel():getHaveItemID() or 1
	slot0.select_msg = nil
end

function RedBagSendPanel.layoutUI(slot0)
	slot0.root_wnd = cc.CSLoader:createNode(PathTool.getTargetCSB("redbag/redbag_send"))

	slot0:addChild(slot0.root_wnd)

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.bottom_panel = slot0.main_panel:getChildByName("bottom_panel")
	slot0.num_panel = slot0.bottom_panel:getChildByName("num_panel")
	slot0.send_btn = slot0.bottom_panel:getChildByName("send_btn")
	slot0.send_btn_red_point = slot0.send_btn:getChildByName("red_point")

	slot0.send_btn_red_point:setVisible(false)

	slot2 = slot0.send_btn:getContentSize()
	slot0.send_btn_label = createRichLabel(26, 1, cc.p(0.5, 0.5), cc.p(slot2.width / 2, slot2.height / 2))

	slot0.send_btn:addChild(slot0.send_btn_label)

	slot0.send_tips = slot0.bottom_panel:getChildByName("send_tips")

	slot0.send_tips:setVisible(false)

	slot0.left_btn = slot0.top_panel:getChildByName("left_btn")
	slot0.right_btn = slot0.top_panel:getChildByName("right_btn")
	slot0.right_btn_red_point = slot0.right_btn:getChildByName("red_point")

	slot0.right_btn_red_point:setVisible(false)

	slot0.left_btn_red_point = slot0.left_btn:getChildByName("red_point")

	slot0.left_btn_red_point:setVisible(false)

	slot0.item_container = slot0.bottom_panel:getChildByName("item_container")

	slot0.bottom_panel:getChildByName("num_desc"):setString(TI18N("个数:"))

	slot0.num_label = slot0.bottom_panel:getChildByName("num_label")

	slot0.bottom_panel:getChildByName("send_msg"):setString(TI18N("红包寄语:"))
	slot0.bottom_panel:getChildByName("title_label"):setString(TI18N("红包信息"))
	slot0.bottom_panel:getChildByName("send_value"):setString(TI18N("红包金额:"))
	slot0.bottom_panel:getChildByName("num_desc"):setTextColor(cc.c4b(144, 82, 56, 255))
	slot0.bottom_panel:getChildByName("send_msg"):setTextColor(cc.c4b(144, 82, 56, 255))
	slot0.bottom_panel:getChildByName("title_label"):setTextColor(cc.c4b(144, 82, 56, 255))
	slot0.bottom_panel:getChildByName("send_value"):setTextColor(cc.c4b(144, 82, 56, 255))
	slot0.bottom_panel:getChildByName("num_desc"):disableEffect(cc.LabelEffect.OUTLINE)
	slot0.bottom_panel:getChildByName("send_msg"):disableEffect(cc.LabelEffect.OUTLINE)
	slot0.bottom_panel:getChildByName("title_label"):disableEffect(cc.LabelEffect.OUTLINE)
	slot0.bottom_panel:getChildByName("send_value"):disableEffect(cc.LabelEffect.OUTLINE)

	slot0.send_content = slot0.bottom_panel:getChildByName("send_content")

	slot0:createDesc()
end

function RedBagSendPanel.createDesc(slot0)
	slot0.send_notice = createRichLabel(22, cc.c4b(2, 54, 86, 255), cc.p(0.5, 0.5), cc.p(slot0.top_panel:getContentSize().width * 0.5, 32))

	slot0.top_panel:addChild(slot0.send_notice)
	slot0.send_notice:setString(string.format(TI18N("(今日还可发<div fontcolor=#249003>%s</div>)"), 100))

	slot0.red_coin = createRichLabel(24, Config.ColorData.data_color4[175], cc.p(0, 0.5), cc.p(162, 226), nil, , 500)

	slot0.bottom_panel:addChild(slot0.red_coin)
	slot0:updateBagList()
end

function RedBagSendPanel.requireProto(slot0)
	RedbagController:getInstance():send13546()
end

function RedBagSendPanel.setData(slot0, slot1)
end

function RedBagSendPanel.registerEvents(slot0)
	slot0.send_btn:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.red_send_info == nil or uv0.select_vo == nil then
				return
			end

			if uv0.cost_item_bid and uv0.cost_item_bid ~= 0 then
				uv0.ctrl:sender13535(uv0.select_vo.id, 1)
			elseif Config.ChargeData.data_charge_data[uv0.select_vo.charge_id] then
				sdkOnPay(slot2.val, nil, slot2.id, slot2.name, slot2.name)
			end
		end
	end)
	slot0.left_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.list_view and not tolua.isnull(uv0.list_view) then
				uv0.list_view:runLeftPostion()
			end
		end
	end)
	slot0.right_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.list_view and not tolua.isnull(uv0.list_view) then
				uv0.list_view:runRightPostion()
			end
		end
	end)

	if not slot0.send_success_event then
		slot0.send_success_event = GlobalEvent:getInstance():Bind(RedbagEvent.Update_Red_Bag_Event, function (slot0)
			uv0:updateRedInfo(slot0)
		end)
	end

	if not slot0.update_add_good_event then
		slot0.update_add_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.ADD_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_delete_good_event then
		slot0.update_delete_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.DELETE_GOODS, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end

	if not slot0.update_modify_good_event then
		slot0.update_modify_good_event = GlobalEvent:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM, function (slot0, slot1)
			uv0:updateItemNum(slot0, slot1)
		end)
	end
end

function RedBagSendPanel.updateBagList(slot0)
	if not slot0.list_view then
		slot0.list_view = RedBagListPanel.new(slot0.top_panel, cc.p(33, 20), ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(580, 370), {
			start_y = 5,
			item_width = 262,
			start_x = 10,
			space_x = 30,
			row = 1,
			item_height = 327,
			space_y = 10,
			col = 1,
			item_class = RedBagItem
		})
	end

	slot3 = 1

	for slot7, slot8 in pairs(Config.GuildData.data_guild_red_bag) do
		slot3 = slot3 + 1
	end

	for slot7, slot8 in ipairs({
		[slot3] = {
			open_type = 1,
			data = slot8
		}
	}) do
		slot8.sort_index = 1

		if slot8.data.id == slot0.extend_id then
			slot8.sort_index = 0
		end
	end

	table.sort(slot2, SortTools.tableLowerSorter({
		"sort_index",
		"id"
	}))
	slot0.list_view:setData(slot2)
	slot0.list_view:addEndCallBack(function ()
		uv0:updateMessage()
	end)
end

function RedBagSendPanel.updateMessage(slot0)
	slot2 = nil

	if slot0.list_view:getSelectItem() then
		slot2 = slot1:getData()
	end

	if slot0.select_vo and slot0.select_vo == slot2 then
		return
	end

	slot0.select_vo = slot2

	if not slot0.select_vo then
		return
	end

	if Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id[slot0.select_vo.assets]) then
		slot0.red_coin:setString(string.format(TI18N("<img src='%s' scale=0.35 />%s"), PathTool.getItemRes(slot6.icon), slot3.val))
	end

	slot0.send_content:setString(slot0.select_vo.msg)
	slot0.num_label:setString(slot0.select_vo.num)
	slot0:fileRewardsItem(slot0.select_vo.reward)
	slot0:showRedSendNum()
end

function RedBagSendPanel.fileRewardsItem(slot0, slot1)
	if slot1 == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in pairs(slot0.item_list) do
		slot6:setVisible(false)
	end

	slot2 = 0.7

	for slot7, slot8 in ipairs(slot1) do
		slot9 = slot8[1]
		slot10 = slot8[2]

		if slot0.item_list[slot7] == nil then
			slot0.item_list[slot7] = BackPackItem.new(false, true, false, slot2, false, true)

			slot0.item_container:addChild(slot0.item_list[slot7])
			slot0.item_list[slot7]:setPosition(10 + (120 * slot2 + 10) * (slot7 - 1) + 120 * slot2 * 0.5, 50)
		end

		slot11 = slot0.item_list[slot7]

		slot11:setBaseData(slot9, slot10)
		slot11:setVisible(true)
	end
end

function RedBagSendPanel.updateRedInfo(slot0, slot1)
	slot0.red_send_info = slot1

	slot0:showRedSendNum()
end

function RedBagSendPanel.updateItemNum(slot0, slot1, slot2)
	if slot0.cost_item_bid and slot1 and slot2 and slot1 == BackPackConst.Bag_Code.BACKPACK then
		for slot6, slot7 in pairs(slot2) do
			if slot7 and slot7.base_id and slot0.cost_item_bid == slot7.base_id then
				slot0:showRedSendNum()

				break
			end
		end
	end
end

function RedBagSendPanel.showRedSendNum(slot0)
	if slot0.red_send_info == nil or slot0.select_vo == nil then
		return
	end

	if not Config.GuildData.data_guild_red_bag[slot0.select_vo.id] then
		return
	end

	slot0.cost_item_bid = 0

	slot0.send_tips:setVisible(false)
	addRedPointToNodeByStatus(slot0.send_btn, false)

	slot2 = 0

	for slot6, slot7 in ipairs(slot0.red_send_info) do
		if slot7.id == slot0.select_vo.id then
			slot2 = slot7.num

			break
		end
	end

	if slot0.select_vo.limit - slot2 < 0 then
		slot2 = 0
	end

	slot0.send_notice:setString(string.format(TI18N("(今日还可发<div fontcolor=#249003>%s</div>)"), slot2))

	if slot2 == 0 then
		slot0.send_btn_label:setString(TI18N("次数已达上限"))
	else
		slot3 = Config.ChargeData.data_charge_data[slot0.select_vo.charge_id]

		if slot0:checkLossItemIsEnough(slot1.loss_item) then
			slot5 = slot1.loss_item[1][2]

			if Config.ItemData.data_get_data(slot1.loss_item[1][1]) then
				slot0.cost_item_bid = slot4

				slot0.send_btn_label:setString(string.format(TI18N("<img src=%s scale=0.5 /><div outline=2,#020019>%d 发红包</div>"), PathTool.getItemRes(slot6.icon), slot5))
				slot0.send_tips:setString(string.format(TI18N("当前拥有红包令，消耗%d个可发放1次该红包"), slot5))
				slot0.send_tips:setVisible(true)
				addRedPointToNodeByStatus(slot0.send_btn, true, 7, 7)
			end
		elseif slot3 then
			slot0.send_btn_label:setString(string.format(TI18N("<div outline=2,#020019>%s元 发红包</div>"), slot3.val))
		end
	end

	if slot0.cur_send_num ~= slot2 then
		slot0.cur_send_num = slot2

		if slot2 == 0 then
			setChildUnEnabled(true, slot0.send_btn)
			slot0.send_btn:setTouchEnabled(false)
		else
			setChildUnEnabled(false, slot0.send_btn)
			slot0.send_btn:setTouchEnabled(true)
		end
	end
end

function RedBagSendPanel.checkLossItemIsEnough(slot0, slot1)
	slot2 = false

	if slot1 and slot1[1] and slot1[1][2] <= BackpackController:getInstance():getModel():getItemNumByBid(slot1[1][1]) then
		slot2 = true
	end

	return slot2
end

function RedBagSendPanel.setVisibleStatus(slot0, slot1)
	slot0:setVisible(slot1)
end

function RedBagSendPanel.DeleteMe(slot0)
	if slot0.list_view then
		slot0.list_view:DeleteMe()

		slot0.list_view = nil
	end

	if slot0.item_list then
		for slot4, slot5 in pairs(slot0.item_list) do
			slot5:DeleteMe()
		end

		slot0.item_list = nil
	end

	if slot0.send_success_event then
		GlobalEvent:getInstance():UnBind(slot0.send_success_event)

		slot0.send_success_event = nil
	end

	if slot0.update_add_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_add_good_event)

		slot0.update_add_good_event = nil
	end

	if slot0.update_delete_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_delete_good_event)

		slot0.update_delete_good_event = nil
	end

	if slot0.update_modify_good_event then
		GlobalEvent:getInstance():UnBind(slot0.update_modify_good_event)

		slot0.update_modify_good_event = nil
	end
end
