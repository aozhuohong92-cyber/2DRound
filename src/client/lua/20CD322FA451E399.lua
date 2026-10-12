GuildmarketplaceRecordInfoPanel = GuildmarketplaceRecordInfoPanel or BaseClass(BaseView)
slot1 = GuildmarketplaceController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert

function GuildmarketplaceRecordInfoPanel.__init(slot0)
	slot0.win_type = WinType.Mini
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.res_list = {}
	slot0.layout_name = "guildmarketplace/guildmarketplace_record_info_panel"
	slot0.record_item_list = {}
end

function GuildmarketplaceRecordInfoPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	if slot0.background ~= nil then
		slot0.background:setScale(display.getMaxScale())
	end

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot0.main_container, 2)

	slot1 = slot0.main_container:getChildByName("main_panel")
	slot0.title = slot1:getChildByName("win_title")

	slot0.title:setString(TI18N("交易记录"))

	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0.bg = slot0.main_container:getChildByName("bg")
	slot0.img_day_bg = slot0.main_container:getChildByName("img_day_bg")
	slot0.txt_cur_day = slot0.main_container:getChildByName("txt_cur_day")

	slot0.txt_cur_day:setString("")

	slot2 = slot0.bg:getContentSize()
	slot0.scroll_view_size = cc.size(slot2.width, slot2.height - 10)
	slot0.scroll_view_height = slot0.scroll_view_size.height
	slot0.scroll_view = createScrollView(slot0.scroll_view_size.width, slot0.scroll_view_size.height, 0, 5, slot0.bg, ccui.ScrollViewDir.vertical)
	slot0.scroll_container = slot0.scroll_view:getInnerContainer()
end

function GuildmarketplaceRecordInfoPanel.register_event(slot0)
	registerButtonEventListener(slot0.background, function ()
		uv0:openGuildmarketplaceRecordInfoPanel(false)
	end, false, 2)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openGuildmarketplaceRecordInfoPanel(false)
	end, true, 2)
	slot0:addGlobalEvent(GuildmarketplaceEvent.GUILD_MARKET_PLACE_MESSAGE_EVENT, function (slot0)
		if not slot0 then
			return
		end

		uv0.message_data = slot0

		uv0:updateNoticeList()
	end)
end

function GuildmarketplaceRecordInfoPanel.openRootWnd(slot0, slot1)
	slot0.message_data = (slot1 or {}).message_data

	if not slot0.message_data then
		return
	end

	slot0:updateNoticeList()
end

function GuildmarketplaceRecordInfoPanel.initData(slot0)
	slot0.day_message_list = {}
	slot1 = {}

	table.sort(slot0.message_data.board_list, function (slot0, slot1)
		return slot1.unixtime < slot0.unixtime
	end)

	slot2, slot3 = nil

	for slot7, slot8 in ipairs(slot0.message_data.board_list) do
		slot8.key_time = TimeTool.getMD3(slot8.unixtime)

		if slot2 == nil or slot2 ~= slot8.key_time then
			if slot3 then
				uv0(slot0.day_message_list, slot3)
			end

			slot2 = slot8.key_time
			slot3 = {}
		end

		if slot8.type == GuildmarketplaceConst.RewardRecordType.ePlay or slot8.type == GuildmarketplaceConst.RewardRecordType.eSystem then
			slot8.reward_list = nil

			for slot13, slot14 in ipairs(slot8.reward_list) do
				slot15 = DeepCopy(slot8)
				slot15.reward_list = {
					slot14
				}

				uv0(slot3, slot15)
			end

			slot8.reward_list = slot9
		else
			uv0(slot3, slot8)
		end
	end

	uv0(slot0.day_message_list, slot3)
end

function GuildmarketplaceRecordInfoPanel.updateNoticeList(slot0, slot1)
	if not slot0.message_data then
		return
	end

	slot0:initData()

	if not slot0.day_message_list then
		return
	end

	if next(slot0.day_message_list) == nil then
		commonShowEmptyIcon(slot0.bg, true, {
			text = TI18N("暂无记录信息")
		})
		slot0.txt_cur_day:setString(TimeTool.getMD3(os.time()))

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		commonShowEmptyIcon(slot0.bg, false)
		slot0.img_day_bg:setVisible(false)
		slot0.txt_cur_day:setString("")

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(true)
		end
	end

	if slot0.record_item_list and next(slot0.record_item_list) ~= nil then
		for slot5, slot6 in pairs(slot0.record_item_list) do
			slot6:setVisible(false)
		end

		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.scroll_view_size.width, slot0.scroll_view_size.height))
		slot0.scroll_view:jumpToTop()
	end

	slot2 = 0
	slot3 = 0
	slot4 = 1

	for slot8, slot9 in ipairs(slot0.day_message_list) do
		delayRun(slot0.scroll_view, slot4 / display.DEFAULT_FPS, function ()
			if uv0.record_item_list[uv1] == nil then
				slot0 = GuildRecordItem.new()

				uv0.scroll_container:addChild(slot0)

				uv0.record_item_list[uv1] = slot0
			end

			slot0:setVisible(true)
			slot0:setData(uv2)
			slot0:setPosition(cc.p(5, uv0.scroll_view_height - uv3))
			slot0:addEndCallback(function ()
				uv0 = uv0 + uv1.total_height
				uv2 = uv2 + uv1.total_height

				if uv3.scroll_view_size.height < uv2 then
					uv3:adjustScrollViewSize(uv2)
				end
			end)
		end)

		slot4 = slot4 + #slot9 + 2
	end
end

function GuildmarketplaceRecordInfoPanel.adjustScrollViewSize(slot0, slot1)
	slot3 = cc.size(slot0.scroll_view_size.width, math.max(slot1, slot0.scroll_view_size.height))
	slot0.scroll_view_height = slot3.height

	slot0.scroll_view:setInnerContainerSize(slot3)

	if slot0.scroll_view_size.height <= slot1 then
		slot0.scroll_view:setTouchEnabled(true)
	end

	slot4 = 0

	for slot8, slot9 in ipairs(slot0.record_item_list) do
		slot9:setPosition(cc.p(5, slot0.scroll_view_height - slot4))

		slot4 = slot4 + slot9.total_height
	end
end

function GuildmarketplaceRecordInfoPanel.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.record_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	slot0.scroll_view:stopAllActions()
	uv0:openGuildmarketplaceRecordInfoPanel(false)
end

GuildRecordItem = class("GuildRecordItem", function ()
	return ccui.Layout:create()
end)

function GuildRecordItem.ctor(slot0)
	slot0.size = cc.size(610, 200)

	slot0:setContentSize(slot0.size)
	slot0:setAnchorPoint(cc.p(0, 1))

	slot0.total_height = slot0.size.height

	slot0:layoutUI()

	slot0.is_init = true
	slot0.label_list = {}
end

function GuildRecordItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot0.img_time_bg = createImage(slot0.container, PathTool.getResFrame("common", "common_90025"), 0, slot0.size.height, cc.p(0, 1), true, 1, true)

	slot0.img_time_bg:setContentSize(cc.size(slot0.size.width, 44))

	slot0.day_label = createRichLabel(24, cc.c4b(255, 242, 199, 255), cc.p(0, 0.5), cc.p(11, 22))

	slot0.day_label:setString("")
	slot0.img_time_bg:addChild(slot0.day_label)
end

function GuildRecordItem.addEndCallback(slot0, slot1)
	slot0.callback = slot1
end

function GuildRecordItem.setData(slot0, slot1)
	slot0.message_list = slot1

	for slot5, slot6 in pairs(slot0.label_list) do
		if slot6.item then
			slot6.item:setVisible(false)
		end
	end

	if slot1 and next(slot1) ~= nil then
		slot0.total_height = 50
		slot2 = 6

		slot0.day_label:setString(slot1[1].key_time)

		slot3 = 0

		for slot7, slot8 in ipairs(slot1) do
			delayRun(slot0.container, slot7 / display.DEFAULT_FPS, function ()
				if not uv0.label_list[uv1] then
					uv0.label_list[uv1] = uv0:createOneNotice()
				end

				if slot0.item then
					slot1, slot2 = uv0:getMessageStrByData(uv2)

					slot0.item:setVisible(true)
					slot0.time_label:setString(slot1)
					slot0.content_label:setString(slot2)

					slot0.height = slot0.content_label:getContentSize().height

					slot0.item:setPosition(cc.p(10, 150 - uv3))

					uv3 = uv3 + slot0.height + uv4
					uv0.total_height = uv0.total_height + slot0.height + uv4

					if uv1 == #uv5 and uv0.callback then
						uv0.callback()
					end
				end
			end)
		end
	end
end

function GuildRecordItem.getMessageStrByData(slot0, slot1)
	slot2 = ""

	if slot1.type == GuildmarketplaceConst.RewardRecordType.ePlay then
		for slot6, slot7 in ipairs(slot1.reward_list) do
			if Config.ItemData.data_get_data(slot7.base_id) then
				if slot1.operation == 1 then
					slot2 = uv0(TI18N(" <div fontcolor=#289B14>%s</div>放入<div fontcolor=%s>%sx%s</div>"), slot1.name, BackPackConst.getWhiteQualityColorStr(slot8.quality), slot8.name, slot7.num)
				elseif slot1.operation == 2 then
					slot2 = uv0(TI18N(" <div fontcolor=#289B14>%s</div>兑换<div fontcolor=%s>%sx%s</div>"), slot1.name, slot9, slot8.name, slot7.num)
				end
			end
		end
	elseif slot1.type == GuildmarketplaceConst.RewardRecordType.eSystem then
		for slot6, slot7 in ipairs(slot1.reward_list) do
			if Config.ItemData.data_get_data(slot7.base_id) then
				if slot1.operation == 3 then
					slot2 = uv0(TI18N(" <div fontcolor=%s>%sx%s</div>已过期下架"), BackPackConst.getWhiteQualityColorStr(slot8.quality), slot8.name, slot7.num)
				end
			end
		end
	elseif slot1.operation == 1 then
		slot6 = slot1.type
		slot7 = slot1.name

		for slot6, slot7 in ipairs(slot1.reward_list) do
			if Config.ItemData.data_get_data(slot7.base_id) then
				slot2 = uv1:getStrByType(slot6, slot7) .. uv0("\n <div fontcolor=%s>%sx%s</div>", BackPackConst.getWhiteQualityColorStr(slot8.quality), slot8.name, slot7.num)
			end
		end
	end

	return TimeTool.getHM(slot1.unixtime), slot2
end

function GuildRecordItem.createOneNotice(slot0)
	slot1 = ccui.Layout:create()
	slot2 = cc.size(560, 30)

	slot1:setAnchorPoint(cc.p(0, 1))
	slot1:setContentSize(slot2)
	slot0.container:addChild(slot1)

	slot3 = createRichLabel(24, cc.c4b(255, 255, 255, 255), cc.p(0, 1), cc.p(10, slot2.height))

	slot1:addChild(slot3)

	slot4 = createRichLabel(24, cc.c4b(255, 255, 255, 255), cc.p(0, 1), cc.p(80, slot2.height), 5, 0, 500)

	slot1:addChild(slot4)

	return {
		item = slot1,
		time_label = slot3,
		content_label = slot4,
		height = slot2.height
	}
end

function GuildRecordItem.DeleteMe(slot0)
	slot0.container:stopAllActions()
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
