MailInfoWindow = MailInfoWindow or BaseClass(BaseView)
slot0 = MailController:getInstance()

function MailInfoWindow.__init(slot0)
	slot0.is_full_screen = false
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.layout_name = "mail/mail_info_window"
	slot0.res_list = {
		{
			path = PathTool.getPlistImgForDownLoad("mail", "mail"),
			type = ResourcesType.plist
		}
	}
	slot0.goods_list = {}
	slot0.is_costome = nil
	slot0.touch_reple_start = nil
	slot0.scrollView_half_height = 330
	slot0.scrollView_half_y = 194
	slot0.scroview_notice_y = 0
	slot0.init_pos_y = 50
end

function MailInfoWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("main_container")

	slot0:playEnterAnimatianByObj(slot1, 1)

	slot2 = slot1:getChildByName("main_panel")
	slot0.win_title = slot2:getChildByName("win_title")

	slot0.win_title:setString(TI18N("邮件"))

	slot0.title_container = slot2:getChildByName("title_container")
	slot0.title = slot0.title_container:getChildByName("title")
	slot0.time = slot0.title_container:getChildByName("time")
	slot0.icon = slot0.title_container:getChildByName("icon")
	slot3 = slot2:getChildByName("info_container")
	slot4 = slot3:getContentSize()
	slot0.info_container_size = cc.size(slot4.width, slot4.height - 8)
	slot5 = slot0.info_container_size.width
	slot0.scrollView = createScrollView(slot5, slot0.scrollView_half_height, 0, slot0.scrollView_half_y, slot3, ccui.ScrollViewDir.vertical)
	slot6 = slot0.scrollView:getContentSize().height
	slot0.content = createRichLabel(24, 1, cc.p(0, 1), cc.p(20, slot6 - 50), 5, 0, 525)

	slot0.scrollView:addChild(slot0.content)
	slot3:getChildByName("youxiao"):setVisible(false)

	slot0.youxiao = createLabel(20, Config.ColorData.data_color4[178], nil, slot5 - 20, slot6 - 25, TI18N("有效期"), slot0.scrollView, nil, cc.p(1, 0.5))
	slot0.goods_container = slot3:getChildByName("goods_container")
	slot0.goods_scroll = createScrollView(slot3:getContentSize().width - 10, 120, 5, 35, slot0.goods_container, ccui.ScrollViewDir.horizontal)
	slot0.goods_scroll_size = slot0.goods_scroll:getContentSize()

	slot0.goods_container:getChildByName("goods_title"):setString(TI18N("领取奖励"))

	slot0.take_label = slot0.goods_container:getChildByName("take_label")

	slot0.take_label:setVisible(false)

	slot0.goods_reple = slot2:getChildByName("goods_reple")

	slot0.goods_reple:setVisible(false)

	slot0.costome_score = slot0.goods_reple:getChildByName("goods_title")
	slot11 = ""

	slot0.costome_score:setString(slot11)

	slot0.touch_start = {}

	for slot11 = 1, 5 do
		slot12 = slot0.goods_reple:getChildByName("start_" .. slot11)
		slot12.start_select = slot12:getChildByName("start_select")

		slot12.start_select:setVisible(false)

		slot12.index = slot11
		slot0.touch_start[slot11] = slot12
	end

	slot0.btn_del = slot0.goods_reple:getChildByName("btn_del")

	slot0.btn_del:getChildByName("Text_3"):setString(TI18N("删除"))

	slot0.btn_submit = slot0.goods_reple:getChildByName("btn_submit")

	slot0.btn_submit:getChildByName("Text_3"):setString(TI18N("提交评分"))

	slot0.btn = slot2:getChildByName("btn")
	slot0.btn.label = slot0.btn:getTitleRenderer()
	slot0.close_btn = slot2:getChildByName("close_btn")
end

function MailInfoWindow.register_event(slot0)
	registerButtonEventListener(slot0.btn, function ()
		if uv0.data and uv0.data.status and uv0.data.assets and uv0.data.items then
			if #uv0.data.assets > 0 or #uv0.data.items > 0 and uv0.data.type == 1 then
				uv1:getGoods(uv0.data.id, uv0.data.srv_id)
			elseif #uv0.data.assets <= 0 or #uv0.data.items <= 0 and uv0.data.type == 1 then
				uv1:deletMailSend({
					{
						id = uv0.data.id,
						srv_id = uv0.data.srv_id
					}
				})
				uv1:openMailInfo(false)
			end
		end
	end, true, 1)
	registerButtonEventListener(slot0.close_btn, function ()
		uv0:openMailInfo(false)
	end, false, 2)
	registerButtonEventListener(slot0.background, function ()
		uv0:openMailInfo(false)
	end, false, 2)
	slot0:addGlobalEvent(MailEvent.GET_ITEM_ASSETS, function (slot0)
		if uv0.data and slot0 == getNorKey(uv0.data.id or 0, uv0.data.srv_id or "") then
			uv0:removeAsset(slot0)
		end
	end)
end

function MailInfoWindow.playRepleTabView(slot0, slot1)
	if slot0.touch_reple_start == (slot1 or 0) then
		return
	end

	slot0.touch_reple_start = slot1

	for slot5 = 1, 5 do
		if slot5 <= slot0.touch_reple_start then
			if slot0.touch_start[slot5] and slot0.touch_start[slot5].start_select then
				slot0.touch_start[slot5].start_select:setVisible(true)
			end
		elseif slot0.touch_start[slot5] and slot0.touch_start[slot5].start_select then
			slot0.touch_start[slot5].start_select:setVisible(false)
		end
	end
end

function MailInfoWindow.setData(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0.data = slot1

	if slot0.content then
		slot0.content:setString(WordCensor:getInstance():relapceAssetsTag(string.gsub(string.gsub(string.gsub(string.gsub(slot1.content, "&lt;", "<"), "&gt;", ">"), "&#039;", "'"), "&quot;", "\"")))
	end

	if slot1.status then
		slot0.title:setString(slot1.subject)
		slot0.time:setVisible(true)
		slot0.youxiao:setVisible(true)

		if slot1.assets and slot1.items then
			if slot1.type == 3 then
				slot0.btn:setVisible(false)
				slot0.goods_container:setVisible(false)
			else
				slot0.goods_reple:setVisible(false)

				if #slot1.assets > 0 or #slot1.items > 0 and slot1.type == 1 then
					slot0.btn:setVisible(true)
					slot0:changeButtonStatus(true)
					slot0.goods_container:setVisible(true)
					slot0:createGoodsList()
					slot0:setScrollViewSize(true)
				elseif #slot1.assets <= 0 or #slot1.items <= 0 and slot1.type == 1 then
					slot0.btn:setVisible(true)
					slot0:changeButtonStatus(false)
					slot0.goods_container:setVisible(false)
					slot0:setScrollViewSize(false)
				else
					slot0.btn:setVisible(false)
					slot0.goods_container:setVisible(false)
					slot0:setScrollViewSize(false)
				end
			end
		end

		if TimeTool.getDayOrHour(GameNet:getInstance():getTime() - slot1.send_time) then
			slot0.time:setString(slot3 .. TI18N("前"))
		else
			slot0.time:setString("")
		end

		if TimeTool.getDayOrHour(slot1.time_out - GameNet:getInstance():getTime()) then
			slot0.youxiao:setString(TI18N("有效期：") .. slot4)
		else
			slot0.youxiao:setString("")
		end

		slot0:changeIcon(slot1.status)
		uv0:read(slot1.id, slot1.srv_id)
	elseif slot1.flag then
		slot0.scrollView_half_height = 470
		slot0.scroview_notice_y = 140
		slot0.init_pos_y = 5

		slot0.win_title:setString(TI18N("公告"))
		slot0.title:setString(slot1.title)
		slot0.btn:setVisible(false)
		slot0.goods_container:setVisible(false)
		slot0.time:setVisible(false)
		slot0.youxiao:setVisible(false)
		slot0:setScrollViewSize(false)
		slot0:changeIcon(slot1.flag)
	end

	if slot0.content then
		slot0.content:addTouchLinkListener(function (slot0, slot1, slot2)
			if slot0 == "href" then
				if slot1 == "charge" then
					VipController:getInstance():openVipMainWindow(true)
				elseif slot1 == "mail" then
					if not RoleController:getInstance():getRoleVo():isHasGuild() then
						message(TI18N("您没有加入公会，不能进行次操作~~~~"))

						return
					end

					GuildController:getInstance():openGuildMemberWindow(true)
				elseif slot1 == "weekly" then
					slot4 = ""

					if RoleController:getInstance():getRoleVo() then
						slot6 = GameNet:getInstance():getTime()

						if (StringUtil.splitByFormat(slot3.srv_id, "_") or {}) ~= nil and next(slot5) ~= nil and cc.CCGameLib:getInstance():md5str(table.concat({
							slot3.rid,
							slot5[1],
							slot5[2],
							slot6,
							"He952ae2a6ea8cdG7410j6T42d7ce32"
						}, ".") or "") ~= nil then
							if IS_IOS_PLATFORM == true then
								sdkCallFunc("openSyW", string.format("https://sszg.shiyue.com/m/weekly.html#/?role_id=%s&platform=%s&zone_id=%s&is_self=1&ctime=%s&flag=%s", slot3.rid, slot5[1], slot5[2], slot6, slot8))
							else
								sdkCallFunc("openUrl", slot4)
							end
						end
					end
				elseif IS_IOS_PLATFORM == true then
					sdkCallFunc("openSyW", slot1)
				else
					sdkCallFunc("openUrl", slot1)
				end
			end
		end, {
			"click",
			"href"
		})
	end
end

function MailInfoWindow.setScrollViewSize(slot0, slot1)
	slot2 = nil

	if slot1 then
		slot0.scrollView:setContentSize(cc.size(slot0.info_container_size.width, slot0.scrollView_half_height))
		slot0.scrollView:setPositionY(slot0.scrollView_half_y)

		slot2 = slot0.scrollView_half_height
	elseif false == true then
		slot4 = 50

		slot0.scrollView:setContentSize(cc.size(slot0.info_container_size.width, slot0.scrollView_half_height + slot4))
		slot0.scrollView:setPositionY(slot0.scrollView_half_y - slot0.scroview_notice_y - slot4)

		slot2 = slot0.scrollView_half_height + slot4
	else
		slot0.scrollView:setContentSize(slot0.info_container_size)
		slot0.scrollView:setPositionY(4)

		slot2 = slot0.info_container_size.height
	end

	slot4 = math.max(slot2, slot0.content:getContentSize().height + 50)

	slot0.scrollView:setInnerContainerSize(cc.size(slot0.scrollView:getContentSize().width, slot4))
	slot0.content:setPositionY(slot4 - slot0.init_pos_y)
	slot0.youxiao:setPositionY(slot4 - 25)
end

function MailInfoWindow.createGoodsList(slot0)
	if slot0.data.status == 2 then
		return
	end

	for slot5, slot6 in pairs(slot0.data.assets) do
		table.insert({}, slot6)
	end

	for slot5, slot6 in pairs(slot0.data.items) do
		table.insert(slot1, slot6)
	end

	if #slot0.data.items > 0 then
		slot0.take_label:setString(TI18N("占用背包空间：") .. #slot0.data.items)
		slot0.take_label:setVisible(true)
	end

	slot7 = cc.size

	slot0.goods_scroll:setInnerContainerSize(slot7(math.max((BackPackItem.Width + 10) * #slot1, slot0.goods_scroll_size.width), slot0.goods_scroll_size.height))

	for slot7, slot8 in ipairs(slot1) do
		slot10 = deepCopy(Config.ItemData.data_get_data(slot8.label or slot8.base_id))
		slot10.quantity = slot8.val or slot8.quantity

		BackPackItem.new():setData(slot10)

		if #slot1 % 2 == 0 then
			if slot7 % 2 ~= 0 then
				slot9:setPosition(slot0.goods_scroll:getPositionX() + slot3 / 2 - (slot9:getContentSize().width / 2 + 8) * slot7, slot0.goods_scroll_size.height / 2)
			else
				slot9:setPosition(slot0.goods_scroll:getPositionX() + slot11 + (slot9:getContentSize().width / 2 + 8) * (slot7 - 1), slot12)
			end
		elseif slot7 == 1 then
			slot9:setPosition(slot11, slot12)
		elseif slot0.goods_list[1] then
			if slot7 % 2 == 0 then
				slot9:setPosition(slot0.goods_list[1]:getPositionX() - slot9:getContentSize().width / 2 - 8 - (slot9:getContentSize().width / 2 + 8) * (slot7 - 1), slot12)
			else
				slot9:setPosition(slot0.goods_list[1]:getPositionX() + slot9:getContentSize().width / 2 + 8 + (slot9:getContentSize().width / 2 + 8) * (slot7 - 2), slot12)
			end
		end

		slot0.goods_scroll:addChild(slot9)

		slot0.goods_list[slot7] = slot9
	end
end

function MailInfoWindow.openRootWnd(slot0, slot1)
	slot0:setData(slot1)
end

function MailInfoWindow.removeAsset(slot0, slot1)
	if slot0.goods_list then
		for slot5, slot6 in pairs(slot0.goods_list) do
			if slot6 then
				slot6:DeleteMe()
			end
		end

		slot0.goods_list = {}
	end

	slot0.goods_container:setVisible(false)

	slot0.data.assets = {}
	slot0.data.items = {}
	slot0.data.status = 2

	slot0:changeIcon(slot0.data.status)
	slot0:changeButtonStatus(false)
	slot0:setScrollViewSize(false)
end

function MailInfoWindow.changeButtonStatus(slot0, slot1)
	if slot1 then
		slot2 = PathTool.getResFrame("common", "common_1017")

		slot0.btn:loadTextures(slot2, slot2, "", LOADTEXT_TYPE_PLIST)
		slot0.btn:setTitleText(TI18N("领取"))
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[264], 2)
	else
		slot2 = PathTool.getResFrame("common", "common_1018")

		slot0.btn:loadTextures(slot2, slot2, "", LOADTEXT_TYPE_PLIST)
		slot0.btn:setTitleText(TI18N("删除"))
		slot0.btn.label:enableOutline(Config.ColorData.data_color4[263], 2)
	end
end

function MailInfoWindow.changeIcon(slot0, slot1)
	if slot1 then
		if slot1 == 1 then
			if slot0.data.assets and slot0.data.items and (#slot0.data.assets > 0 or #slot0.data.items > 0) then
				loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon4"), LOADTEXT_TYPE_PLIST)
			else
				loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon3"), LOADTEXT_TYPE_PLIST)
			end
		elseif slot1 == 2 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon3"), LOADTEXT_TYPE_PLIST)
		elseif slot1 == 0 then
			if slot0.data.assets and slot0.data.items and (#slot0.data.assets > 0 or #slot0.data.items > 0) then
				loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon2"), LOADTEXT_TYPE_PLIST)
			else
				loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon1"), LOADTEXT_TYPE_PLIST)
			end
		end
	end
end

function MailInfoWindow.close_callback(slot0)
	if slot0.goods_list then
		for slot4, slot5 in pairs(slot0.goods_list) do
			if slot5 then
				slot5:DeleteMe()
			end
		end

		slot0.goods_list = nil
	end

	uv0:openMailInfo(false)
end
