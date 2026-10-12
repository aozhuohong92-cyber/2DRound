ContactServicePanel = ContactServicePanel or ContactServicePanel(BaseView)

function ContactServicePanel.__init(slot0, slot1)
end

function ContactServicePanel.open_callback(slot0)
end

function ContactServicePanel.setMessage(slot0, slot1)
	if not tolua.isnull(slot0.web_view) then
		slot0.web_view:setVisible(false)
	end

	if slot1 then
		slot0:setWebViewUrl(slot1)
	else
		slot0.ok_btn:setVisible(true)

		slot0.notice_content = slot0.ctrl:getNoticeContent(99)

		if slot0.notice_content == nil then
			slot4 = 0

			if ((serverData or slot0.dengluMgr:getLoginData()).open_time or 0) ~= 0 and slot3 ~= nil then
				slot4 = math.ceil((os.time() - slot3) / TimeTool.day2s())
			end

			if get_notice_url(99, slot4, slot2) then
				function OnFileDownloadResult(slot0, slot1)
					if uv0.root_wnd == nil or tolua.isnull(uv0.root_wnd) then
						return
					end

					slot2:close()

					slot5 = nil

					if (loadstring("return " .. assert(io.open(string.format("%sassets/src/%s", cc.FileUtils:getInstance():getWritablePath(), slot1), "r")):read("*all")) ~= nil or {}) and slot4() and slot4.data and slot4.data[1] and slot4.data[1].content then
						slot5 = slot4.data[1].content or ""
					end

					if not slot5 then
						return
					end

					slot5 = WordCensor:getInstance():relapceFaceIconTag(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(slot5, "&lt;", "<"), "&gt;", ">"), "&#039;", "'"), "&quot;", "\""), "\t", "    "))[2]
					uv0.notice_content = slot5

					NoticeController:getInstance():setNoticeContent(99, slot5)
					uv0:addNoticeContent(Split(slot5, "|"))
				end

				cc.FmodexManager:getInstance():downloadOtherFile(slot5, "notice.txt")
			end
		else
			slot0:addNoticeContent(Split(slot0.notice_content, "|"))
		end
	end
end

function ContactServicePanel.setWebViewUrl(slot0, slot1)
	if not slot0.web_view then
		return
	end

	if not tolua.isnull(slot0.web_view) then
		slot0.web_view:setVisible(true)
	end

	slot0.web_view:loadURL(slot1)
	slot0.ok_btn:setVisible(false)
end

function ContactServicePanel.addNoticeContent(slot0, slot1)
	if slot1 == nil or #slot1 == 0 then
		return
	end

	slot0.notice_scroll:removeAllChildren()
	slot0.main_panel:stopAllActions()

	slot2 = #slot1
	slot3 = nil
	slot4 = 6
	slot5 = 1
	slot6 = {}

	slot0.txt_title:setString(table.remove(slot1, 1) or "")

	for slot11, slot12 in ipairs(slot1) do
		delayRun(slot0.main_panel, slot11 / 60, function ()
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

function ContactServicePanel.createSubContent(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = createRichLabel(22, Config.ColorData.data_color4[274], nil, cc.p(0, 1), slot5, nil, slot4)

	slot6:setString(slot3)
	slot6:setAnchorPoint(0, 1)
	slot0.notice_scroll:addChild(slot6)
	slot6:setPosition(slot1, slot2)

	return slot6
end
