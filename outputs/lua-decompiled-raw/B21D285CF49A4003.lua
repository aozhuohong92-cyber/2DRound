NoticeWindow = NoticeWindow or BaseClass(BaseView)

function NoticeWindow.__init(slot0, slot1)
	slot0.url = slot1
	slot0.view_tag = ViewMgrTag.DEBUG_TAG
	slot0.ctrl = NoticeController:getInstance()
	slot0.layout_name = "notice/notice_window"
	slot0.win_type = WinType.Mini
	slot0.dengluMgr = LoginController:getInstance():getModel()
	slot0.title_height = 0
	slot0.title = ""
end

function NoticeWindow.open_callback(slot0)
	slot0.root_wnd:getChildByName("background"):setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")

	slot0:playEnterAnimatianByObj(slot0.main_panel, 2)

	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")

	slot0.main_panel:getChildByName("win_title"):setString(TI18N("公告"))

	slot0.ok_btn = slot0.main_panel:getChildByName("ok_btn")
	slot0.ok_btn_label = slot0.ok_btn:getChildByName("label")

	slot0.ok_btn_label:setString(TI18N("确定"))
	slot0.ok_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	slot0.ok_btn:setVisible(false)

	slot0.container = slot0.main_panel:getChildByName("container")
	slot0.txt_container = slot0.container:getChildByName("txt_container")
	slot0.txt_title = slot0.txt_container:getChildByName("txt_title")
	slot0.notice_scroll = slot0.txt_container:getChildByName("notice_scroll")
	slot6 = false

	slot0.notice_scroll:setScrollBarEnabled(slot6)

	slot0.container_size = slot0.notice_scroll:getContentSize()
	slot0.tab_list = {}
	slot0.select_tab = 1

	for slot6 = 1, 2 do
		slot7 = slot0.main_panel:getChildByName("tab" .. slot6)
		slot0.tab_list[slot6] = {
			tab = slot7,
			select_bg = slot7:getChildByName("select_bg"),
			unselect_bg = slot7:getChildByName("unselect_bg"),
			title = slot7:getChildByName("title")
		}

		registerButtonEventListener(slot7, function (slot0, slot1, slot2)
			if uv0.select_tab == uv1 then
				return
			end

			uv0.tab_list[uv0.select_tab].select_bg:setVisible(false)
			slot1:getChildByName("select_bg"):setVisible(true)

			uv0.select_tab = uv1

			uv0:setMessage()
		end, false, 2, nil, , , true)
	end

	slot0.tab_list[1].select_bg:setVisible(true)
	slot0.tab_list[1].title:setString(TI18N("游戏公告"))
	slot0.tab_list[2].select_bg:setVisible(false)
	slot0.tab_list[2].title:setString(TI18N("更新公告"))

	slot0.select_tab = 1

	slot0:layoutWebView()
	slot0:setMessage(slot0.url)
end

function NoticeWindow.layoutWebView(slot0)
	if slot0.url and slot0.url ~= "" and ccexp.WebView then
		slot0.main_panel:getChildByName("win_title"):setString("vip")

		slot0.web_view = ccexp.WebView:create()

		slot0.web_view:setAnchorPoint(0.5, 0.5)
		slot0.web_view:setPosition(slot0.container_size.width * 0.5 + 10, slot0.container_size.height * 0.5)
		slot0.web_view:setContentSize(slot0.container_size.width + 20, 740)
		slot0.web_view:setScalesPageToFit(true)
		slot0.web_view:setVisible(false)
		slot0.container:addChild(slot0.web_view, 99)
		slot0.txt_container:setVisible(false)
	end
end

function NoticeWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:closeNoticeView()
		end
	end)
	slot0.ok_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:closeNoticeView()
		end
	end)
end

function NoticeWindow.setMessage(slot0, slot1)
	if not tolua.isnull(slot0.web_view) then
		slot0.web_view:setVisible(false)
	end

	if slot1 then
		slot0:setWebViewUrl(slot1)
	else
		slot0.notice_content = slot0.ctrl:getNoticeContent(slot0.select_tab)

		if slot0.notice_content == nil then
			slot4 = 0

			if ((serverData or slot0.dengluMgr:getLoginData()).open_time or 0) ~= 0 and slot3 ~= nil then
				slot4 = math.ceil((os.time() - slot3) / TimeTool.day2s())
			end

			if get_notice_url(slot0.select_tab, slot4, slot2) then
				slot6 = cc.XMLHttpRequest:new()
				slot6.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON

				slot6:open("GET", slot5)
				slot6:registerScriptHandler(function ()
					if uv0.readyState == 4 and uv0.status >= 200 and uv0.status < 207 then
						if not json.decode(uv0.response).content then
							return
						end

						slot2 = WordCensor:getInstance():relapceFaceIconTag(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(slot2, "&lt;", "<"), "&gt;", ">"), "&#039;", "'"), "&quot;", "\""), "\t", "    "))[2]
						uv1.notice_content = slot2

						NoticeController:getInstance():setNoticeContent(uv1.select_tab, slot2)
						uv1:addNoticeContent(Split(slot2, "|"))
					end
				end)
				slot6:send()
			end
		else
			slot0:addNoticeContent(Split(slot0.notice_content, "|"))
		end
	end
end

function NoticeWindow.setWebViewUrl(slot0, slot1)
	if not slot0.web_view then
		return
	end

	if not tolua.isnull(slot0.web_view) then
		slot0.web_view:setVisible(true)
	end

	slot0.web_view:loadURL(slot1)
	slot0.ok_btn:setVisible(false)
end

function NoticeWindow.addNoticeContent(slot0, slot1)
	if slot1 == nil or #slot1 == 0 then
		return
	end

	slot0.notice_scroll:removeAllChildren()
	slot0.notice_scroll:stopAllActions()

	slot2 = #slot1
	slot3 = nil
	slot4 = 6
	slot5 = 1
	slot6 = {}

	slot0.txt_title:setString(table.remove(slot1, 1) or "")

	for slot11, slot12 in ipairs(slot1) do
		delayRun(slot0.notice_scroll, slot11 / 60, function ()
			slot7 = 6
			slot0 = uv0:createSubContent(2, 0, uv1, uv0.container_size.width - 4, slot7)
			uv2 = uv2 + slot0:getContentSize().height + 3

			table.insert(uv3, slot0)

			slot6 = cc.size(uv0.container_size.width, math.max(uv2, uv0.container_size.height))

			uv0.notice_scroll:setInnerContainerSize(slot6)

			for slot6, slot7 in ipairs(uv3) do
				slot7:setPositionY(slot1 - 10)

				slot1 = slot1 - (slot7:getContentSize().height + 3)
			end
		end)
	end
end

function NoticeWindow.createSubContent(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = createRichLabel(22, Config.ColorData.data_color4[274], nil, cc.p(0, 1), slot5, nil, slot4)

	slot6:setString(slot3)
	slot6:setAnchorPoint(0, 1)
	slot0.notice_scroll:addChild(slot6)
	slot6:setPosition(slot1, slot2)

	return slot6
end

function NoticeWindow.close_callback(slot0)
	doStopAllActions(slot0.notice_scroll)

	slot0.url = nil

	slot0.ctrl:closeNoticeView()
end

function NoticeWindow.getNoticeStr(slot0)
	return [[
|<div fontcolor=#FF0000 fontsize=22>官方唯一公众号：【航海王集结地】</div>|<div fontcolor=#FF0000 fontsize=22>官方唯一客服QQ：【1942215187】</div>|
官方公告：请认准 <div fontcolor=#FF0000 fontsize=22>官方唯一</div>公众号和客服QQ信息，切勿相信任何私下交易，谨防上当受骗！


【活动一：开服狂欢 八天登录】
  活动详情：橙套武器五星卡，钻石十连免费拿
【活动二：七日目标 解锁拿奖】
  活动详情：轻松完成任务，海量福利相助！
【活动三：限时活动 新人专享】
  活动详情：超值礼包，快速提升，一飞超天！
【活动四：每日签到 成长好礼】
  活动详情：钻石不停，红武照拿，升级有礼
【活动五：超值首充 远征启航】
  活动详情：小充一笔，爽拿三天，弹射起步！
【活动六：超值基金 20倍返利】
 活动详情：投资无风险，收益看得见
【活动七：放置挂机 躺着升级】
 活动详情：轻松放置，快速养成
【活动八：成长自选 积天豪礼】
 活动详情：一直充一直爽，成长礼包你来选！
【活动九：神秘礼包 买到赚到】
 活动详情：走过路过，不要错过，巨划算！
【活动十：超值月卡 特权福利】
 活动详情：低氪必备，每日福利多多]]
end
