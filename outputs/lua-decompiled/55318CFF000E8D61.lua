ChatMsg = class("ChatMsg", function ()
	return ccui.Widget:create()
end)

function ChatMsg.ctor(slot0, slot1, slot2)
	slot0:setCascadeOpacityEnabled(true)

	slot0.view_width = slot1 or 410
	slot0.view_height = slot2 or 130
	slot0.root_wnd = ccui.Layout:create()

	slot0.root_wnd:setCascadeOpacityEnabled(true)
	slot0.root_wnd:setContentSize(cc.size(slot0.view_width, slot0.view_height))
	slot0.root_wnd:setAnchorPoint(cc.p(0, 0))
	slot0:addChild(slot0.root_wnd)
	slot0:initLayout()

	slot0.dataObj = nil
	slot0.channel = nil
	slot0.gap = 30
	slot0.is_myself = false
end

function ChatMsg.initLayout(slot0)
	slot0.head_root = ccui.Widget:create()

	slot0.head_root:setCascadeOpacityEnabled(true)
	slot0.head_root:setAnchorPoint(cc.p(0, 0))
	slot0.head_root:setPosition(cc.p(-28, 0))
	slot0.root_wnd:addChild(slot0.head_root)

	slot0.channel_bg = ccui.ImageView:create()

	slot0.channel_bg:setCascadeOpacityEnabled(true)
	slot0.channel_bg:setAnchorPoint(cc.p(0, 0))
	slot0.root_wnd:addChild(slot0.channel_bg, 1)
end

function ChatMsg.setTiemVisible(slot0, slot1)
	if slot0.talk_time then
		slot0.talk_time:setVisible(slot1)
	end
end

function ChatMsg.showHead(slot0, slot1)
	if slot0.notice_content then
		slot0.notice_content:setVisible(false)
	end

	slot0.head_root:setVisible(true)

	slot2 = RoleController:getInstance():getRoleVo()
	slot3 = slot1.bubble_bid

	if slot0.notice_bg then
		slot0.notice_bg:setVisible(false)
	end

	if tolua.isnull(slot0.head_icon) then
		slot0.head_icon = PlayerHead.new(PlayerHead.type.circle)

		slot0.head_icon:setTouchEnabled(true)
		slot0.head_icon:setHeadLayerScale(0.8)
		slot0.head_icon:setAnchorPoint(cc.p(0.5, 0.5))
		slot0.head_root:addChild(slot0.head_icon)

		slot4 = RoleController:getInstance():getRoleVo()

		slot0.head_icon:addCallBack(function ()
			if uv0.dataObj then
				if uv0.dataObj.channel == ChatConst.Channel.Province then
					if uv0.is_myself then
						message(TI18N("这是你自己哦"))
					else
						ChatController:getInstance():openChatReportWindow(true, uv0.dataObj)
					end

					return
				end

				if not uv0.dataObj.flag then
					if uv1.rid == uv0.dataObj.rid and uv1.srv_id == uv0.dataObj.srv_id then
						return
					end

					ChatController:getInstance():openFriendInfo({
						flag = "chat_msg",
						srv_id = uv0.dataObj.srv_id,
						rid = uv0.dataObj.rid,
						channel = uv0.dataObj.channel
					})
				end
			end
		end, true)
		slot0.head_icon:setHeadData({
			srv_id = slot1.srv_id,
			rid = slot1.rid,
			name = slot1.name
		})

		if Config.AvatarData.data_avatar[slot1.head_bid] then
			slot0.head_icon:showBg(PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. (slot5.res_id or 1), false, false), nil, false, slot5.offy)
		end

		slot0.head_icon:longCliCallback(function (slot0)
			if slot0.rid == uv0.rid and slot0.srv_id == uv0.srv_id then
				message(TI18N("这是你自己~"))

				return
			end

			if ChatController:getInstance():getChatInput() then
				slot3 = 30
				slot4 = ""

				if Config.SayData.data_const and slot2.at_condition then
					slot3 = slot2.at_condition.val
					slot4 = slot2.at_condition.desc
				end

				if slot3 <= uv0.lev then
					slot1:setInputText("@" .. slot0.name .. " ")
				else
					message(slot4)
				end
			end
		end)

		slot0.sex_icon = ccui.ImageView:create()

		slot0.sex_icon:setAnchorPoint(cc.p(0, 0))
		slot0.sex_icon:setScale(0.6)
		slot0.sex_icon:setPosition(cc.p(65, 10))
		slot0.head_icon:addChild(slot0.sex_icon, 10)
		slot0.sex_icon:setVisible(false)

		slot0.capacity = createLabel(17, Config.ColorData.data_color4[1], nil, 94, 59, "", slot0.head_root)

		slot0.capacity:setAnchorPoint(cc.p(0, 0.5))

		slot0.talk_time = createLabel(22, Config.ColorData.data_color4[147], nil, 262, 103, "", slot0.head_root)

		slot0.talk_time:setVisible(false)
		slot0.talk_time:setAnchorPoint(cc.p(0.5, 1))
		slot0.talk_time:setPosition(365, 90)

		if TimeTool.getDayDifference(slot1.talk_time) > 1 then
			slot0.talk_time:setString(TimeTool.getMDHMS(slot1.talk_time))
		else
			slot0.talk_time:setString(TimeTool.getHMS(slot1.talk_time))
		end

		slot0.player_name = createLabel(20, Config.ColorData.data_color4[271], nil, 109, 94, "", slot0.head_root)

		slot0.player_name:setAnchorPoint(cc.p(0, 0.5))

		slot0.chat_pic = ccui.Widget:create()

		slot0.chat_pic:setPositionX(112)
		slot0.chat_pic:setAnchorPoint(cc.p(0, 1))
		slot0.chat_pic:setTouchEnabled(true)
		slot0.head_root:addChild(slot0.chat_pic)

		slot0.chat_bg = ccui.ImageView:create()

		slot0.chat_bg:setAnchorPoint(cc.p(0, 1))
		slot0.chat_bg:setPositionX(125)
		slot0.chat_bg:setTouchEnabled(true)
		slot0.chat_bg:setSwallowTouches(false)
		slot0.chat_bg:setPropagateTouchEvents(true)
		slot0.head_root:addChild(slot0.chat_bg, -1)

		slot0.content = createRichLabel(22, Config.ColorData.data_color4[175], cc.p(0, 0.5), cc.p(20, 64), 5, -1, slot0.view_width)

		slot0.chat_pic:addChild(slot0.content)
		slot0.content:addTouchLinkListener(function (slot0, slot1, slot2)
			ChatHelp.OnChatTouched(slot0, slot1, slot2, uv0.dataObj)
		end, {
			"click",
			"href"
		})
		slot0.content:setMaxWidth(420, false)
	end

	if tolua.isnull(slot0.chat_pic) then
		return
	end

	slot5 = nil

	if slot1.rid == RoleController:getInstance():getRoleVo().rid and slot1.srv_id == slot4.srv_id or slot1.flag == 1 or slot1.flag == 11 then
		slot5 = true
	end

	slot6 = {
		color = 25,
		bid = 1,
		ornament = 0
	}
	slot8 = 175

	slot0.chat_bg:loadTexture(PathTool.getResFrame("mainui", "mainui_chat_bg_0"), LOADTEXT_TYPE_PLIST)
	slot0.chat_bg:setScale9Enabled(true)
	slot0.chat_bg:setCapInsets(cc.rect(20, 30, 1, 1))
	slot0:removeComps()
	slot0:showVoiceTishi(false)

	slot9 = ""
	slot10 = nil
	slot11 = 0

	if slot1.len == 1 then
		slot10, slot11 = VoiceMgr:getInstance():splitVoice(slot1.msg)
		slot12, slot13 = VoiceMgr:getInstance():getMsg(slot1.msg)

		if not slot12 then
			slot0:setVoiceListener(true)
		end

		slot0:setVoicePlayListener(true)

		if string.len(slot13) >= 45 then
			slot13 = string.sub(slot13, 1, 39) .. "...."
		end

		slot9 = slot9 .. string.format(" <img src='%s'/>", PathTool.getResFrame("mainui", "mainui_record_3")) .. string.format("<div fontcolor=%s> %s%s  </div>", tranformC3bTostr(175), slot11, "\" " .. slot13)

		slot0.content._clickNode:setTouchEnabled(false)
	elseif slot1.len == 2 then
		slot0.content._clickNode:setTouchEnabled(false)

		slot9 = slot1.msg
	else
		slot9 = slot1.msg
	end

	slot0.content:setString(string.format("<div fontsize=%s fontcolor=%s>%s</div>", 22, tranformC3bTostr(slot8), slot9))

	if slot1.len == 0 then
		slot0.content._clickNode:setTouchEnabled(true)
	end

	slot0.content._clickNode:setSwallowTouches(false)
	slot0.content._clickNode:setPropagateTouchEvents(true)
	slot0.chat_pic:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.began then
			uv0:popUpBegin(uv1.msg)
		elseif slot1 == ccui.TouchEventType.ended then
			if uv1.len == 1 then
				uv0:playVoice()
			elseif uv1.len == 2 then
				if uv0.content:getDivArgs({
					"click"
				}) then
					ChatHelp.OnChatTouched("click", slot2, slot0, uv0.dataObj)
				end
			elseif uv1.len == 3 then
				if uv0.content:getDivArgs({
					"click"
				}) then
					ChatHelp.OnChatTouched("click", slot2, slot0, uv0.dataObj)
				end
			else
				uv0:popUpEnd()
			end
		end
	end)

	if slot0.content:getSize().height + 10 < 64 then
		slot14 = 64
	end

	slot15 = math.max(33 + slot0.content:getContentSize().width, 64)
	slot16 = 0
	slot17 = 0

	slot0.chat_pic:setContentSize(cc.size(slot15, slot14))
	slot0.chat_bg:setContentSize(cc.size(slot15, slot14))

	slot18 = 0

	if slot1.sex == 1 then
		slot18 = 1
	end

	if slot1.face_id == 0 or slot1.face_id == 1 then
		if (slot0.data.face_file or "") ~= "" then
			slot0.head_icon:setHeadRes(face_id, false, LOADTEXT_TYPE, slot19, slot0.data.face_update_time or 0)
		end
	else
		slot0.head_icon:setHeadRes(slot1.face_id, false, LOADTEXT_TYPE, slot1.face_file, slot1.face_update_time)
	end

	if slot1.sex ~= 2 then
		slot0.sex_icon:setVisible(true)
		slot0.sex_icon:loadTexture(PathTool.getResFrame("common", "common_sex" .. slot18), LOADTEXT_TYPE_PLIST)
	else
		slot0.sex_icon:setVisible(false)
	end

	if slot1.channel == ChatConst.Channel.Cross then
		slot0.player_name:setString("【" .. getServerName(slot1.srv_id) .. "】" .. slot1.name)
	else
		slot0.player_name:setString(slot1.name)
	end

	if slot1.channel ~= ChatConst.Channel.Province and not slot0.vip_image and slot1.is_show_vip and slot1.is_show_vip == 0 and slot1.vip_lev and slot1.vip_lev > 0 then
		slot0.vip_image = createSprite(PathTool.getResFrame("common", "common_1038"), 66, 92)

		slot0.vip_image:setAnchorPoint(cc.p(0, 0.5))
		slot0.head_root:addChild(slot0.vip_image)
	end

	if slot1.channel == ChatConst.Channel.Province then
		if not slot0.site_txt then
			slot0.site_txt = createLabel(20, Config.ColorData.data_color4[271], nil, 109, 94, "", slot0.head_root)
		end

		if slot1.city then
			slot0.site_txt:setString(slot1.city)
		end
	end

	slot20 = slot0.head_icon:getContentSize()
	slot21 = slot0.chat_pic:getContentSize().height + 30 + slot0.gap + 2

	slot0.root_wnd:setContentSize(slot0.view_width, slot21)
	slot0:setContentSize(cc.size(slot0.view_width, slot21))
	slot0:setAnchorPoint(cc.p(0, 1))
	slot0.head_icon:setPosition(80, slot21 - 50)

	if not slot0.is_whole then
		slot0.channel_bg:setVisible(false)
	else
		slot0.channel_bg:setVisible(true)
	end

	slot23 = 0
	slot25 = 0

	slot0.player_name:setPosition(cc.p(125 + 0 + 3, slot0.head_icon:getPositionY() + 20))

	slot26 = 0

	if slot0.vip_image then
		slot0.vip_image:setPosition(slot0.player_name:getPositionX() + slot0.player_name:getContentSize().width + 4, slot0.player_name:getPositionY())

		slot26 = 15
	end

	if slot0.site_txt then
		slot0.site_txt:setAnchorPoint(cc.p(0, 0.5))
		slot0.site_txt:setPosition(cc.p(slot0.player_name:getPositionX() + slot0.player_name:getContentSize().width + 4 + 40, slot0.head_icon:getPositionY() + 20))
	end

	slot0.channel_bg:setPosition(97, slot21 - slot0.channel_bg:getContentSize().height + 4)
	slot0.chat_pic:setPositionY(slot0.head_icon:getPositionY() + slot17 - 2)
	slot0.chat_bg:setPositionY(slot0.head_icon:getPositionY() + slot17 - 2)
	slot0.talk_time:setPositionY(slot0.head_icon:getPositionY() + 53)

	slot27 = 0

	slot0.content:setAnchorPoint(cc.p(0, 0.5))
	slot0.content:setPosition(35, slot0.chat_pic:getContentSize().height / 2)

	if slot0.voice_red_icon then
		slot0.voice_red_icon:setPosition(59, slot0.chat_pic:getContentSize().height - 9)
	end

	if slot1.len == 3 and slot0.join_btn then
		slot0.join_btn:setPosition(slot0.chat_pic:getPositionX() + slot0.chat_pic:getContentSize().width - 8, slot0.chat_pic:getPositionY() - slot0.chat_pic:getContentSize().height + 7)
	end

	if slot1.len == 1 then
		slot0:onVoicePlay()
	end
end

function ChatMsg.createNotice(slot0)
	slot0.notice_content = createRichLabel(22, 175, cc.p(0, 1), cc.p(70, 25), 5, 0, slot0.view_width)

	slot0.notice_content:setLocalZOrder(1)
	slot0.root_wnd:addChild(slot0.notice_content)
	slot0.notice_content:addTouchLinkListener(function (slot0, slot1, slot2)
		ChatHelp.OnChatTouched(slot0, slot1, slot2, uv0.dataObj)
	end, {
		"click",
		"href"
	})
end

function ChatMsg.setMyNotice(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.head_root:setPosition(cc.p(slot0.view_width - 126, 0))

	slot3 = false

	slot0.chat_bg:setFlippedX(true)
	slot0.chat_pic:setPositionY(slot0.head_icon:getPositionY() - 2)
	slot0.chat_bg:setPosition(cc.p(35, slot0.head_icon:getPositionY() - 2))
	slot0.content:setAnchorPoint(cc.p(1, 0.5))
	slot0.content:setPosition(cc.p(512, slot0.chat_pic:getContentSize().height / 2))
	slot0.chat_pic:setPosition(cc.p(-500, slot0.chat_bg:getPositionY()))

	slot4 = -5
	slot5 = 0
	slot6 = 0
	slot7 = 0

	slot0.player_name:setAnchorPoint(1, 0.5)
	slot0.player_name:setPosition(cc.p(20, slot0.head_icon:getPositionY() + 20))

	slot8 = 0

	if slot0.vip_image then
		slot0.vip_image:setAnchorPoint(cc.p(1, 0.5))

		slot8 = 15

		slot0.vip_image:setPosition(cc.p(slot0.player_name:getPositionX() - slot0.player_name:getContentSize().width + 2, slot0.player_name:getPositionY()))
	end

	if slot0.site_txt then
		slot0.site_txt:setAnchorPoint(cc.p(1, 0.5))
		slot0.site_txt:setPosition(cc.p(slot0.player_name:getPositionX() - slot0.player_name:getContentSize().width + 2 - 20, slot0.head_icon:getPositionY() + 20))
	end
end

function ChatMsg.showNotice(slot0, slot1)
	if not slot0.notice_bg then
		slot0.notice_bg = ccui.ImageView:create()

		slot0.notice_bg:setAnchorPoint(cc.p(0, 1))
		slot0.root_wnd:addChild(slot0.notice_bg, 0)
		slot0.notice_bg:setScale9Enabled(true)
		slot0.notice_bg:loadTexture(PathTool.getResFrame("mainui", "mainui_chat_notice_bg"), LOADTEXT_TYPE_PLIST)
		slot0.notice_bg:setCapInsets(cc.rect(40, 30, 1, 1))
	end

	slot0.notice_bg:setVisible(false)

	if not slot0.notice_content then
		slot0:createNotice()
	end

	slot0.head_root:removeAllChildren()

	slot0.head_bg = nil

	slot0.notice_content:setMaxWidth(slot0.view_width - 145, false)

	slot2 = ""
	slot3 = nil

	if slot1.channel == ChatConst.Channel.System then
		slot2 = "<div fontColor=#023656>" .. slot1.msg .. "</div>"
	elseif slot1.channel == ChatConst.Channel.Notice then
		slot2 = "<div fontColor=" .. c3bToStr(Config.ColorData.data_color3[175]) .. ">" .. slot1.msg .. "</div>"
	elseif slot1.channel == ChatConst.Channel.Gang_Sys then
		slot2 = "<div>" .. slot1.msg .. "</div>"
	elseif slot1.channel == ChatConst.Channel.Team or ChatConst.Channel.Team_Sys then
		slot2 = "<div>" .. slot1.msg .. "</div>"
	end

	slot0.notice_content:setString(slot2)
	slot0.notice_content._clickNode:setTouchEnabled(true)
	slot0.notice_content._clickNode:setSwallowTouches(false)

	slot4 = slot0.notice_content:getSize().height + slot0.gap

	slot0.root_wnd:setContentSize(slot0.view_width - 90, slot4 + 7)
	slot0:setContentSize(cc.size(slot0.view_width - 90, slot4))
	slot0.notice_bg:setContentSize(cc.size(slot0.view_width - 10, slot4 - 4))
	slot0:setAnchorPoint(cc.p(0, 1))
	slot0.channel_bg:setPosition(30, slot4 - slot0.channel_bg:getContentSize().height - 10)
	slot0.notice_content:setPosition(110, slot4 - 12)
	slot0.notice_bg:setPosition(3, slot4 + 3)
	slot0.notice_content:setVisible(true)
end

function ChatMsg.showCustomTips(slot0, slot1)
	if not slot0.notice_content then
		slot0:createNotice()
	end

	slot0.head_root:removeAllChildren()

	slot0.head_bg = nil

	slot0.notice_content:setMaxWidth(slot0.view_width, false)
	slot0.notice_content:setString("<div>" .. slot1.msg .. "</div>")
	slot0.notice_content._clickNode:setTouchEnabled(true)
	slot0.notice_content._clickNode:setSwallowTouches(false)

	slot2 = slot0.notice_content:getSize().height + 8

	slot0.root_wnd:setContentSize(slot0.view_width, slot2)
	slot0:setContentSize(cc.size(slot0.view_width, slot2))
	slot0:setAnchorPoint(cc.p(0, 1))
	slot0.notice_content:setPosition(0, slot2 - 1)
	slot0.channel_bg:setVisible(false)
end

function ChatMsg.showTipsMsg(slot0, slot1)
	if not slot0.notice_content then
		slot0:createNotice()
	end

	slot0.head_root:removeAllChildren()

	slot0.head_bg = nil

	slot0.notice_content:setMaxWidth(slot0.view_width - 65, false)

	slot2 = ""
	slot3 = nil

	if slot1.channel == ChatConst.Channel.Gang then
		slot2 = slot1.msg
	elseif slot1.channel == ChatConst.Channel.Team then
		slot2 = slot1.msg
	end

	slot0.notice_content:setString(slot2)
	slot0.notice_content._clickNode:setTouchEnabled(true)
	slot0.notice_content._clickNode:setSwallowTouches(false)

	slot4 = slot0.notice_content:getSize().height + slot0.gap

	slot0.root_wnd:setContentSize(slot0.view_width, slot4)
	slot0.channel_bg:setPosition(0, slot4 - slot0.channel_bg:getContentSize().height - 3)
	slot0.notice_content:setPosition(62, slot4 - 1)
	slot0.channel_bg:setVisible(true)
	slot0.root_wnd:setTouchEnabled(true)
	slot0.root_wnd:setSwallowTouches(false)
	slot0.root_wnd:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			if uv0.flag == "openTeam" then
				-- Nothing
			elseif uv0.flag == "openGang" and RoleController:getInstance():getRoleVo().lev < 17 and not slot2:isHasGuild() then
				message(TI18N("公会17级开启"))
			end
		end
	end)
end

function ChatMsg.setData(slot0, slot1, slot2)
	slot0.is_whole = slot2
	slot0.dataObj = slot1

	slot0:setVoicePlayListener(false)
	slot0:setVoiceListener(false)

	if ChatMgr:getInstance():analyseTeamHelp(slot1) then
		slot0.dataObj = slot3

		slot0:showHead(slot3)

		return
	end

	if slot1.flag == "openTeam" then
		slot0:setChannel(slot1.channel)
		slot0:showTipsMsg(slot1)
	elseif slot1.channel == ChatConst.Channel.System or slot1.channel == ChatConst.Channel.Notice or slot1.channel == ChatConst.Channel.Gang_Sys then
		slot0:setChannel(slot1.channel)
		slot0:showNotice(slot1)
	elseif slot1.channel == -1 then
		slot0:showCustomTips(slot1)
	elseif (slot1.channel == ChatConst.Channel.Team or slot1.channel == ChatConst.Channel.Team_Sys) and slot1.rid == 0 then
		slot0:setChannel(slot1.channel)
		slot0:showNotice(slot1)
	else
		slot0:showHead(slot1)
	end

	if slot1.rid and slot1.rid ~= 0 and slot1.srv_id and RoleController:getInstance():getRoleVo().rid == slot1.rid and slot4.srv_id == slot1.srv_id then
		slot0:setMyNotice(slot1)

		slot0.is_myself = true
	end
end

function ChatMsg.setChannel(slot0, slot1)
	if slot0.channel ~= (slot1 or ChatConst.Channel.World) then
		slot0.channel_bg:loadTexture(PathTool.getResFrame("mainui", "txt_cn_chat_icon_" .. ChatConst.ChannelRes[slot1]), LOADTEXT_TYPE_PLIST)
	end
end

function ChatMsg.setId(slot0, slot1)
	slot0.id = slot1
end

function ChatMsg.getId(slot0)
	return slot0.id
end

function ChatMsg.removeComps(slot0)
	if slot0.join_btn then
		slot0.join_btn:DeleteMe()

		slot0.join_btn = nil
	end
end

function ChatMsg.setVoiceListener(slot0, slot1)
	if slot1 then
		if not slot0.voice_evt then
			slot0.voice_evt = GlobalEvent:getInstance():Bind(VoiceMgr.NewMsg, function (slot0, slot1)
				if uv0.onTranslateEnd then
					uv0:onTranslateEnd(slot0, slot1)
				end
			end)
		end
	elseif slot0.voice_evt then
		GlobalEvent:getInstance():UnBind(slot0.voice_evt)

		slot0.voice_evt = nil
	end
end

function ChatMsg.setVoicePlayListener(slot0, slot1)
	if slot1 then
		if not slot0.play_evt then
			slot0.play_evt = GlobalEvent:getInstance():Bind(VoiceMgr.Played, function (slot0)
				if uv0.onVoicePlay then
					uv0:onVoicePlay()
				end
			end)
		end
	elseif slot0.play_evt then
		GlobalEvent:getInstance():UnBind(slot0.play_evt)

		slot0.play_evt = nil
	end
end

function ChatMsg.onTranslateEnd(slot0, slot1, slot2)
	if slot0.dataObj and slot0.dataObj.len == 1 and slot0.dataObj.msg == slot1 then
		slot0:setData(slot0.dataObj)
		GlobalEvent:getInstance():Fire(ChatConst.Voice_Translate_Panel)
	end
end

function ChatMsg.onVoicePlay(slot0)
	if slot0.dataObj and slot0.dataObj.len == 1 and slot0.content.getElementWithIndex then
		if slot0.content:getElementWithIndex(1) then
			VoiceMgr:getInstance():showVoiceEffect(slot1, VoiceMgr:getInstance():isPlaying(slot0.dataObj.msg), 13)
		end

		slot0:showVoiceTishi(not VoiceMgr:getInstance():isPlayed(slot0.dataObj.msg))
	end
end

function ChatMsg.playVoice(slot0)
	if slot0.dataObj and slot0.dataObj.len == 1 then
		VoiceMgr:getInstance():playVoice(slot0.dataObj.msg)
	end
end

function ChatMsg.showVoiceTishi(slot0, slot1)
end

function ChatMsg.popUpBegin(slot0, slot1)
	if slot1 == nil then
		return
	end

	if string.find(slot1, "</div>") then
		if not require("UUn2rw1Xe79sI0UaGlea5iQRvaDeuUng.richlabel.labelparser").parse(slot1) then
			return
		end

		for slot6 = 1, #slot2 do
			slot1 = "" .. (slot2[slot6].content or "")
		end
	end

	slot0.copyStr = slot1
	slot0.touching = true

	delayRun(slot0.root_wnd, 2, function ()
		if uv0.touching then
			ChatMgr:getInstance():showReportUI(true, uv0.copyStr, uv0.root_wnd, uv0.chat_pic:getPositionX() + math.min(230, math.max(50, uv0.chat_pic:getContentSize().width - 80)), uv0.chat_pic:getPositionY() + 8)
		end
	end)
end

function ChatMsg.popUpEnd(slot0)
	slot0.touching = nil
end

function ChatMsg.reset(slot0)
	slot0.root_wnd:setVisible(false)
end

function ChatMsg.getItemRealSize(slot0)
	return slot0.root_wnd:getContentSize()
end

function ChatMsg.DeleteMe(slot0)
	if slot0.item_load then
		slot0.item_load:DeleteMe()

		slot0.item_load = nil
	end

	slot0:setVoiceListener(false)
	slot0:setVoicePlayListener(false)

	if slot0.head_icon then
		slot0.head_icon:DeleteMe()
	end

	doRemoveFromParent(slot0.root_wnd)

	slot0.root_wnd = nil
	slot0.channel = nil
end
