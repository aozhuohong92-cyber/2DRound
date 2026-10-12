DownloadPanel = DownloadPanel or BaseClass(BaseView)

function DownloadPanel.__init(slot0)
	slot0.ctrl = MainuiController:getInstance()
	slot0.layout_name = "download/download_panel"
	slot0.win_type = WinType.Big
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.item_list = {}
end

function DownloadPanel.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot0.main_panel = slot0.root_wnd:getChildByName("main_panel")
	slot0.close_btn = slot0.main_panel:getChildByName("close_btn")
	slot0.size = slot0.main_panel:getContentSize()
	slot0.girl_bg = slot0.main_panel:getChildByName("girl_bg")

	if not slot0.item_load then
		slot0.item_load = createResourcesLoad(PathTool.getTargetRes("bigbg", "txt_cn_bigbg_20", false, false), ResourcesType.single, function ()
			if not tolua.isnull(uv0.girl_bg) then
				loadSpriteTexture(uv0.girl_bg, uv1, LOADTEXT_TYPE)
			end
		end, slot0.item_load)
	end

	slot0.top_panel = slot0.main_panel:getChildByName("top_panel")
	slot0.title_label = slot0.top_panel:getChildByName("title_label")

	slot0.title_label:setString(TI18N("下载赢好礼"))

	slot0.begin_btn = slot0.main_panel:getChildByName("begin_btn")
	slot0.begin_btn_label = slot0.begin_btn:getChildByName("label")

	slot0.begin_btn_label:setString(TI18N("开始"))

	slot0.award_btn = slot0.main_panel:getChildByName("award_btn")
	slot0.award_btn_label = slot0.award_btn:getChildByName("label")

	slot0.award_btn_label:setString(TI18N("领取奖励"))
	slot0.award_btn:setTouchEnabled(false)

	slot0.desc_label = createRichLabel(26, Config.ColorData.data_color4[175], cc.p(0, 0), cc.p(40, 260), 0, 0, 550)

	slot0.main_panel:addChild(slot0.desc_label)
	slot0.desc_label:setString(string.format(TI18N("下载完成可以领取以下奖励，正在下载 <div fontcolor=#249003>%s</div>"), 0) .. "%")

	slot0.progress_container = slot0.main_panel:getChildByName("progress_container")
	slot0.progress = slot0.progress_container:getChildByName("progress")

	slot0.progress:setScale9Enabled(true)
	slot0.progress:setPercent(100)

	slot0.goods_con = slot0.main_panel:getChildByName("goods_con")
end

function DownloadPanel.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0.ctrl:openDownloadView(false)
		end
	end)
	slot0.begin_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			AUTO_DOWN_RES = not AUTO_DOWN_RES

			if AUTO_DOWN_RES == true then
				uv0.begin_btn_label:setString(TI18N("暂停"))
				ResourcesLoadMgr:getInstance():downloadNext()
			else
				uv0.begin_btn_label:setString(TI18N("开始"))
			end
		end
	end)
	slot0.award_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()

			if uv0.ctrl:getDownLoadStatus() == TRUE then
				message(TI18N("你已领取过奖励!"))
				uv0.ctrl:removeFunctionIconById(MainuiConst.icon.download)
				uv0.ctrl:openDownloadView(false)
			else
				uv0.ctrl:requestGetDownLoadAwards()
			end
		end
	end)

	if slot0.download_event == nil then
		slot0.download_event = GlobalEvent:getInstance():Bind(EventId.ON_SPINE_DOWNLOADED, function ()
			uv0:updateProgress()
		end)
	end
end

function DownloadPanel.openRootWnd(slot0)
	MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.download, false)

	if AUTO_DOWN_RES == true then
		slot0.begin_btn_label:setString(TI18N("暂停"))
	else
		slot0.begin_btn_label:setString(TI18N("开始"))
	end

	slot0:createItemList()
	slot0:updateProgress()
end

function DownloadPanel.updateProgress(slot0)
	slot2 = ResourcesLoadMgr:getInstance():getPercentage()

	slot0.desc_label:setString(string.format(TI18N("下载完成可以领取以下奖励，正在下载 <div fontcolor=#249003>%s</div>"), string.sub(tostring(slot2), 1, 5)) .. "%")

	if slot2 >= 2 then
		slot0.progress:setPercent(slot2)
	end

	slot0.award_btn:setTouchEnabled(slot2 >= 100)

	if slot2 < 100 then
		setChildUnEnabled(true, slot0.award_btn)
		slot0.award_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
	else
		setChildUnEnabled(false, slot0.award_btn)
		slot0.award_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
	end
end

function DownloadPanel.createItemList(slot0)
	if slot0.ctrl:getDownLoadItems() == nil or next(slot1) == nil then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		slot7 = BackPackItem.new(false, false, false, 0.9, false)

		slot7:setPosition(cc.p((slot5 - 1) * 130 + 95, 75))
		slot7:setBaseData(slot6.bid, slot6.num)
		slot0.goods_con:addChild(slot7)
		table.insert(slot0.item_list, slot7)
	end
end

function DownloadPanel.close_callback(slot0)
	slot4 = false

	slot0.ctrl:openDownloadView(slot4)

	for slot4, slot5 in ipairs(slot0.item_list) do
		if slot5.DeleteMe then
			slot5:DeleteMe()
		end
	end

	slot0.item_list = nil

	if slot0.download_event then
		GlobalEvent:getInstance():UnBind(slot0.download_event)

		slot0.download_event = nil
	end

	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end
end
