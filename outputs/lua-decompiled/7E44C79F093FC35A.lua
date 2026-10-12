GuildNoticeWindow = GuildNoticeWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()
slot1 = GuildController:getInstance():getModel()
slot2 = string.format
slot3 = table.insert
slot4 = cc.c4b(100, 50, 35, 255)

function GuildNoticeWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.title_str = TI18N("公告列表")
	slot0.is_init = true
	slot0.cb_btn_list = {}
	slot0.notice_item_list = {}
end

function GuildNoticeWindow.open_callback(slot0)
	slot5 = "guild/guild_notice_window"
	slot0.main_view = createCSBNote(PathTool.getTargetCSB(slot5))

	slot0.main_view:setPositionY(slot0.main_view:getPositionY() + 10)
	slot0.container:addChild(slot0.main_view)

	slot0.background = slot0.main_view:getChildByName("background")
	slot0.img_day_bg = slot0.main_view:getChildByName("img_day_bg")
	slot0.txt_cur_day = slot0.main_view:getChildByName("txt_cur_day")

	slot0.txt_cur_day:setString("")

	slot0.btn_check_detail = slot0.main_view:getChildByName("btn_check_detail")

	slot0.btn_check_detail:getChildByName("name"):setString(TI18N("查看详情"))

	slot0.empty_tips = slot0.main_view:getChildByName("empty_tips")

	slot0.empty_tips:getChildByName("desc"):setString(TI18N("暂无新的消息"))

	for slot5 = 1, 3 do
		slot6 = slot0.main_view:getChildByName("btn_guild_" .. slot5)

		slot6:getChildByName("name"):setString(({
			TI18N("公会战情况"),
			TI18N("公会捐献情况"),
			TI18N("公会副本情况")
		})[slot5])

		slot6.index = slot5
		slot0.cb_btn_list[slot5] = slot6
	end

	slot2 = slot0.background:getContentSize()
	slot0.list_size = cc.size(slot2.width, slot2.height - 10)
	slot0.scroll_view = createScrollView(slot0.list_size.width, slot0.list_size.height, 0, 5, slot0.background, ccui.ScrollViewDir.vertical)
	slot0.scroll_container = slot0.scroll_view:getInnerContainer()
end

function GuildNoticeWindow.register_event(slot0)
	if slot0.update_notice_event == nil then
		slot0.update_notice_event = GlobalEvent:getInstance():Bind(GuildEvent.UpdateGuildNoticeList, function ()
			uv0:updateNoticeList()
		end)
	end

	function slot4()
		uv0:openGuildMemberWindow(true, uv1.cur_index)
	end

	slot5 = true

	registerButtonEventListener(slot0.btn_check_detail, slot4, slot5, 1, {}, 0.8)

	for slot4, slot5 in ipairs(slot0.cb_btn_list) do
		slot5:addEventListener(function (slot0, slot1)
			slot2 = true

			if slot1 == ccui.CheckBoxEventType.selected then
				uv0:setSelected(true)
				uv1:updateNoticeList(uv0.index)
			elseif slot1 == ccui.CheckBoxEventType.unselected then
				playButtonSound2()

				slot2 = false

				uv0:setSelected(false)
				uv1:updateNoticeList()
			end

			uv1:updateBtnStatus(uv0.index, slot2)
		end)
	end
end

function GuildNoticeWindow.openRootWnd(slot0)
	uv0:send13577()
	slot0:updateBtnStatus()

	if uv1:getRedStatus(GuildConst.red_index.notice) then
		uv1:updateGuildRedStatus(GuildConst.red_index.notice, false)
	end
end

function GuildNoticeWindow.updateBtnStatus(slot0, slot1, slot2)
	slot3 = false

	for slot7, slot8 in ipairs(slot0.cb_btn_list) do
		if not slot1 then
			slot8:setSelected(false)
		elseif slot8.index == slot1 then
			slot3 = true

			slot8:setSelected(slot2)
		else
			slot8:setSelected(false)
		end
	end

	if slot0.cur_index == GuildConst.show_type.all or not slot2 then
		slot0.btn_check_detail:setVisible(false)
	else
		slot0.btn_check_detail:setVisible(slot3)
	end
end

function GuildNoticeWindow.updateNoticeList(slot0, slot1)
	slot0.cur_index = slot1 or GuildConst.show_type.all
	slot3 = false

	if next(uv0:getGuildNoticeList(slot0.cur_index)) == nil then
		slot3 = true

		slot0.txt_cur_day:setString(TimeTool.getMD3(tonumber(os.date())))

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(false)
		end
	else
		slot0.txt_cur_day:setString("")

		if slot0.scroll_view then
			slot0.scroll_view:setVisible(true)
		end
	end

	slot0.img_day_bg:setVisible(slot3)
	slot0.empty_tips:setVisible(slot3)

	if slot0.notice_item_list and next(slot0.notice_item_list) ~= nil then
		for slot7, slot8 in pairs(slot0.notice_item_list) do
			if slot8 then
				slot8:setVisible(false)
			end
		end

		slot0.scroll_view:setInnerContainerSize(cc.size(slot0.list_size.width, slot0.list_size.height))
		slot0.scroll_view:jumpToTop()
	end

	slot4 = 0
	slot5 = nil

	for slot9, slot10 in ipairs(slot2) do
		delayRun(slot0.main_view, 0.02 * slot9, function ()
			if uv0.notice_item_list[uv1] == nil then
				slot0 = GuildNoticeItem.new()

				uv0.scroll_container:addChild(slot0)

				uv0.notice_item_list[uv1] = slot0
			end

			slot0:setVisible(true)
			slot0:setData(uv2)

			uv3 = uv3 + slot0:getContentSize().height

			if not uv4 then
				uv4 = math.max(uv3, uv0.list_size.height)
			end

			uv4 = uv4 - slot0:getContentSize().height

			slot0:setPosition(cc.p(0, uv4))

			if uv0.list_size.height < uv3 then
				uv0:adjustScrollViewSize(uv3)
			end
		end)
	end
end

function GuildNoticeWindow.adjustScrollViewSize(slot0, slot1)
	slot0.scroll_view:setInnerContainerSize(cc.size(slot0.list_size.width, math.max(slot1, slot0.list_size.height)))

	if slot0.list_size.height <= slot1 then
		slot0.scroll_view:setTouchEnabled(true)
	end

	for slot8, slot9 in pairs(slot0.notice_item_list) do
		if slot9 then
			slot9:setPosition(cc.p(0, slot2 - slot9:getContentSize().height))
		end
	end
end

function GuildNoticeWindow.close_callback(slot0)
	for slot4, slot5 in pairs(slot0.notice_item_list) do
		slot5:DeleteMe()

		slot5 = nil
	end

	if slot0.update_notice_event ~= nil then
		GlobalEvent:getInstance():UnBind(slot0.update_notice_event)

		slot0.update_notice_event = nil
	end

	uv0:openGuildNoticeWindow(false)
end

GuildNoticeItem = class("GuildNoticeItem", function ()
	return ccui.Layout:create()
end)

function GuildNoticeItem.ctor(slot0)
	slot0.size = cc.size(610, 200)

	slot0:setContentSize(slot0.size)
	slot0:layoutUI()

	slot0.is_init = true
	slot0.label_list = {}
end

function GuildNoticeItem.layoutUI(slot0)
	slot0.container = ccui.Layout:create()

	slot0.container:setContentSize(slot0.size)
	slot0:addChild(slot0.container)

	slot0.img_time_bg = createImage(slot0.container, PathTool.getResFrame("common", "common_90025"), 0, slot0.size.height, cc.p(0, 1), true, 1, true)

	slot0.img_time_bg:setContentSize(cc.size(slot0.size.width - 3, 44))

	slot0.day_label = createRichLabel(24, cc.c4b(255, 242, 199, 255), cc.p(0, 0.5), cc.p(11, 22))

	slot0.day_label:setString("")
	slot0.img_time_bg:addChild(slot0.day_label)
end

function GuildNoticeItem.setData(slot0, slot1)
	slot0.data = slot1

	for slot5, slot6 in pairs(slot0.label_list) do
		if slot6.item then
			slot6.item:setVisible(false)
		end
	end

	if slot1 and next(slot1) ~= nil then
		slot2 = 50
		slot3 = 6

		for slot7, slot8 in ipairs(slot1) do
			if slot0.is_init then
				slot0.is_init = false

				slot0.day_label:setString(TimeTool.getMD3(slot8.time))
			end

			if not slot0.label_list[slot7] then
				slot0.label_list[slot7] = slot0:createOneNotice(slot8.time, slot8.role_name, slot8.msg)
			end

			if slot9.item then
				slot9.item:setVisible(true)
				slot9.time_label:setString(TimeTool.getHM(slot8.time))
				slot9.content_label:setString(uv0("<div fontcolor=#955322>%s</div> %s", slot8.role_name, slot8.msg))

				slot9.size = slot9.content_label:getContentSize().height
				slot2 = slot2 + slot9.size + slot3
			end
		end

		slot0.size = cc.size(610, slot2)

		slot0:setContentSize(slot0.size)
		slot0.container:setContentSize(slot0.size)
		slot0.container:setPosition(cc.p(3, 0))

		slot9 = 0

		slot0.img_time_bg:setPosition(cc.p(slot9, slot0.size.height))

		for slot8, slot9 in pairs(slot0.label_list) do
			if slot9.item and slot9.size then
				if slot8 > 1 then
					slot4 = 0 + slot0.label_list[slot8 - 1].size + slot3
				end

				slot9.item:setPosition(cc.p(10, slot0.size.height - 50 - slot4))
			end
		end
	end
end

function GuildNoticeItem.createOneNotice(slot0, slot1, slot2, slot3)
	slot4 = ccui.Layout:create()
	slot5 = cc.size(560, 30)

	slot4:setAnchorPoint(cc.p(0, 1))
	slot4:setContentSize(slot5)
	slot0.container:addChild(slot4)

	slot6 = createRichLabel(24, uv0, cc.p(0, 1), cc.p(10, slot5.height))

	slot6:setString(TimeTool.getHM(slot1))
	slot4:addChild(slot6)

	slot7 = createRichLabel(24, uv0, cc.p(0, 1), cc.p(15 + slot6:getContentSize().width, slot5.height), 5, 0, 500)

	slot7:setString(uv1("<div fontcolor=#955322>%s</div> %s", slot2, slot3))
	slot4:addChild(slot7)

	return {
		item = slot4,
		time_label = slot6,
		content_label = slot7,
		size = slot7:getContentSize().height
	}
end

function GuildNoticeItem.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
