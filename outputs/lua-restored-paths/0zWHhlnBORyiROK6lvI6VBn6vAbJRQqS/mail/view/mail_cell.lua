MailCell = class("MailCell", function ()
	return ccui.Widget:create()
end)

function MailCell.ctor(slot0)
	slot0.ctrl = MailController:getInstance()

	slot0:configUI()
	slot0:registerEvent()
end

function MailCell.configUI(slot0)
	slot0.root_wnd = createCSBNote(PathTool.getTargetCSB("mail/mail_item"))

	slot0:setAnchorPoint(cc.p(0, 1))
	slot0:addChild(slot0.root_wnd)
	slot0:setCascadeOpacityEnabled(true)
	slot0:setContentSize(cc.size(616, 124))
	slot0:setTouchEnabled(true)

	slot0.main_container = slot0.root_wnd:getChildByName("main_container")

	slot0.main_container:setTouchEnabled(true)
	slot0.main_container:setSwallowTouches(false)

	slot0.mail_con = slot0.main_container:getChildByName("mail_con")
	slot0.icon = slot0.mail_con:getChildByName("icon")
	slot0.mail_title = slot0.mail_con:getChildByName("title")
	slot0.time = slot0.mail_con:getChildByName("time")
	slot0.unread = slot0.mail_con:getChildByName("unread")

	slot0.unread:setString(TI18N("未读"))

	slot0.notice_con = slot0.main_container:getChildByName("notice_con")
	slot0.notice_title = slot0.notice_con:getChildByName("title")
	slot0.notice_content = slot0.notice_con:getChildByName("content")
end

function MailCell.setData(slot0, slot1)
	slot0.data = slot1

	if slot1.status then
		slot0.mail_con:setVisible(true)
		slot0.notice_con:setVisible(false)

		if TimeTool.getDayOrHour(GameNet:getInstance():getTime() - slot1.send_time) then
			slot0.time:setString(slot2 .. TI18N("前"))
		else
			slot0.time:setString("")
		end

		slot0:changeIcon(slot0.data.status)
		slot0.mail_title:setString(slot1.subject)
	elseif slot1.flag then
		slot0.mail_con:setVisible(false)
		slot0.notice_con:setVisible(true)
		slot0.notice_title:setString(slot1.title)
		slot0.notice_content:setString(slot1.summary)
		slot0:setGray(slot1.flag == 1)
	end
end

function MailCell.getData(slot0)
	return slot0.data
end

function MailCell.addCallBack(slot0, slot1)
	slot0.callback = slot1
end

function MailCell.registerEvent(slot0)
	slot0:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			uv0.touch_end = slot0:getTouchEndPosition()
			slot2 = true

			if uv0.touch_began ~= nil then
				slot2 = math.abs(uv0.touch_end.x - uv0.touch_began.x) <= 20 and math.abs(uv0.touch_end.y - uv0.touch_began.y) <= 20
			end

			if slot2 == true then
				playButtonSound2()

				if uv0.callback then
					uv0:callback()
				end
			end
		elseif slot1 == ccui.TouchEventType.moved then
			-- Nothing
		elseif slot1 == ccui.TouchEventType.began then
			uv0.touch_began = slot0:getTouchBeganPosition()
		elseif slot1 == ccui.TouchEventType.canceled then
			-- Nothing
		end
	end)
end

function MailCell.updateIconStatus(slot0)
	if slot0.data == nil then
		return
	end

	slot0:changeIcon(slot0.data.status)
end

function MailCell.changeIcon(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0.cell_status == slot1 then
		return
	end

	slot0.cell_status = slot1

	if slot1 == 1 then
		slot0:setGray(true)

		if #slot0.data.assets > 0 or #slot0.data.items > 0 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon4"), LOADTEXT_TYPE_PLIST)
		elseif #slot0.data.assets == 0 or #slot0.data.items == 0 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon3"), LOADTEXT_TYPE_PLIST)
		end
	elseif slot1 == 2 then
		slot0:setGray(true)
		loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon3"), LOADTEXT_TYPE_PLIST)
	elseif slot1 == 0 then
		if #slot0.data.assets > 0 or #slot0.data.items > 0 then
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon2"), LOADTEXT_TYPE_PLIST)
		else
			loadSpriteTexture(slot0.icon, PathTool.getResFrame("mail", "mail_icon1"), LOADTEXT_TYPE_PLIST)
		end

		slot0:setGray(false)
	end
end

function MailCell.setGray(slot0, slot1)
	if slot1 then
		slot0:setOpacity(178)
		slot0.unread:setVisible(false)
	else
		slot0:setOpacity(255)
		slot0.unread:setVisible(true)
	end
end

function MailCell.setGet(slot0, slot1)
end

function MailCell.DeleteMe(slot0)
	slot0:removeAllChildren()
	slot0:removeFromParent()
end
