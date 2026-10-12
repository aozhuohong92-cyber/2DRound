MailWindow = MailWindow or BaseClass(BaseView)
slot0 = MailController:getInstance()
slot1 = MailController:getInstance():getModel()

function MailWindow.__init(slot0)
	slot0.is_full_screen = true
	slot0.win_type = WinType.Full
	slot0.title_str = TI18N("邮箱")
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mail", "mail"),
			type = ResourcesType.plist
		}
	}
	slot0.tab_info_list = {
		{
			index = 1,
			status = true,
			label = TI18N("邮件")
		},
		{
			index = 2,
			status = true,
			label = TI18N("公告")
		}
	}
	slot0.cur_index = nil
end

function MailWindow.open_callback(slot0)
	slot0.mail_root = createCSBNote(PathTool.getTargetCSB("mail/mail_window"))

	slot0.mail_root:setPosition(10, 30)
	slot0.container:addChild(slot0.mail_root)

	slot0.main_container = slot0.mail_root:getChildByName("main_container")
	slot0.del_btn = slot0.main_container:getChildByName("del_btn")

	slot0.del_btn:setTitleText(TI18N("删除已读"))

	slot0.del_btn.label = slot0.del_btn:getTitleRenderer()

	if slot0.del_btn.label ~= nil then
		slot0.del_btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end

	slot0.get_btn = slot0.main_container:getChildByName("get_btn")

	slot0.get_btn:setTitleText(TI18N("一键领取"))

	slot0.get_btn.label = slot0.get_btn:getTitleRenderer()

	if slot0.get_btn.label ~= nil then
		slot0.get_btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	end

	slot0.scrollCon = slot0.main_container:getChildByName("scrollCon")
	slot0.good_cons = slot0.main_container:getChildByName("good_cons")
	slot0.emptyTips = createImage(slot0.main_container, PathTool.getEmptyMark(), slot0.scrollCon:getContentSize().width / 2, 505, cc.p(0.5, 1))

	slot0.emptyTips:setVisible(false)

	slot0.empty_label = createLabel(26, Config.ColorData.data_color4[274], nil, slot0.emptyTips:getContentSize().width / 2, -35, TI18N("暂时没有邮件"), slot0.emptyTips, 0, cc.p(0.5, 0))
	slot0.item_scrollview = CommonScrollViewLayout.new(slot0.good_cons, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, slot0.good_cons:getContentSize(), {
		start_y = 0,
		item_width = 616,
		start_x = 0,
		space_x = 6,
		row = 0,
		item_height = 124,
		space_y = 0,
		col = 1,
		item_class = MailCell
	})
end

function MailWindow.register_event(slot0)
	if slot0.get_btn then
		slot0.get_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv0:getAllGoods()
			end
		end)
	end

	if slot0.del_btn then
		slot0.del_btn:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.ended then
				uv1:deletMailSend(uv0:getHasReadNonRewardList())
			end
		end)
	end

	slot0:addGlobalEvent(MailEvent.UPDATE_ITEM, function ()
		if uv0.cur_index == 1 then
			uv0:selectedTabCallBack(uv0.cur_index)
		end
	end)
	slot0:addGlobalEvent(MailEvent.UPDATEREDSTATUS, function (slot0, slot1)
		uv0:updateRedStatus(slot0, slot1)
	end)
	slot0:addGlobalEvent(MailEvent.READ_MAIL_INFO, function (slot0)
		if uv0.select_cellitem and uv0.select_cellitem:getData() and getNorKey(slot1.id or 0, slot1.srv_id or "") == slot0 then
			uv0.select_cellitem:updateIconStatus()
		end
	end)
	slot0:addGlobalEvent(MailEvent.READ_INFO_NOTICE, function (slot0)
		if uv0:getNoticeMessage(slot0) then
			uv1:openMailInfo(true, slot1)
		end
	end)
	slot0:addGlobalEvent(MailEvent.UPDATE_NOTICE, function ()
		if uv0.cur_index == 2 then
			uv0:selectedTabCallBack(uv0.cur_index)
		end
	end)
end

function MailWindow.openRootWnd(slot0, slot1)
	slot0:setSelecteTab(slot1 or 1, true)
	slot0:updateRedStatus()
end

function MailWindow.updateRedStatus(slot0, slot1, slot2)
	if slot1 == nil then
		for slot6 = 1, 2 do
			if uv0:getRedSum(slot6) == nil then
				slot7 = 0
			end

			slot0:setTabTipsII(slot7, slot6)
		end
	else
		slot0:setTabTipsII(slot2 or 0, slot1 or 1)
	end
end

function MailWindow.selectedTabCallBack(slot0, slot1)
	slot0.cur_index = slot1
	slot2 = {}

	if slot1 == 1 then
		slot2 = MailController:getData():getAllMailArray()

		slot0.get_btn:setVisible(true)
		slot0.del_btn:setVisible(true)
		slot0.scrollCon:setContentSize(cc.size(622, 711))
		slot0.good_cons:setContentSize(cc.size(615, 696))
		slot0.item_scrollview:resetSize(slot0.good_cons:getContentSize())
		slot0.empty_label:setString(TI18N("暂时没有邮件"))
	elseif slot1 == 2 then
		slot2 = uv0:getNoticeArray()

		slot0.get_btn:setVisible(false)
		slot0.del_btn:setVisible(false)
		slot0.scrollCon:setContentSize(cc.size(622, 775))
		slot0.good_cons:setContentSize(cc.size(615, 761))
		slot0.item_scrollview:resetSize(slot0.good_cons:getContentSize())
		slot0.empty_label:setString(TI18N("暂时没有公告"))
	end

	slot0.emptyTips:setVisible(#slot2 == 0)

	if #slot2 > 0 then
		if slot0.item_scrollview then
			slot0.item_scrollview:setVisible(true)
		end

		slot0.item_scrollview:setData(slot2, function (slot0)
			if uv0 == 1 then
				uv1:selectMailItem(slot0)
			elseif uv0 == 2 then
				uv1:selectNoticeItem(slot0)
			end
		end)
	elseif slot0.item_scrollview then
		slot0.item_scrollview:setVisible(false)
	end
end

function MailWindow.selectMailItem(slot0, slot1)
	slot0.select_cellitem = slot1

	if slot1:getData() then
		uv0:requireMailItem(slot2.id, slot2.srv_id)
	end
end

function MailWindow.selectNoticeItem(slot0, slot1)
	slot0.select_cellitem = slot1

	if slot1:getData() then
		uv0:readNotice(slot2.id)
	end
end

function MailWindow.close_callback(slot0)
	if slot0.item_scrollview then
		slot0.item_scrollview:DeleteMe()

		slot0.item_scrollview = nil
	end

	uv0:openMailPanel(false)
end
