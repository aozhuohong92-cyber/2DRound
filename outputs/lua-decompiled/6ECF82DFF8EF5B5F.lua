GuildImpeachPostWindow = GuildImpeachPostWindow or BaseClass(BaseView)
slot0 = GuildController:getInstance()

function GuildImpeachPostWindow.__init(slot0)
	slot0.view_tag = ViewMgrTag.DIALOGUE_TAG
	slot0.is_full_screen = false
	slot0.win_type = WinType.Mini
	slot0.set_index = 1
	slot0.condition_index = 1
	slot0.layout_name = "guild/guild_impeach_post_window"
end

function GuildImpeachPostWindow.open_callback(slot0)
	slot0.background = slot0.root_wnd:getChildByName("background")

	slot0.background:setScale(display.getMaxScale())

	slot1 = slot0.root_wnd:getChildByName("container")

	slot0:playEnterAnimatianByObj(slot1, 2)
	slot1:getChildByName("win_title"):setString(TI18N("管理设置"))

	slot0._notice = slot1:getChildByName("notice")
	slot0.close_btn = slot1:getChildByName("close_btn")
	slot0._btnImpeach = slot1:getChildByName("impeach_btn")

	slot0._btnImpeach:getChildByName("label"):setString(TI18N("弹劾会长"))

	slot0._spriteDiamond = slot0._btnImpeach:getChildByName("spriteDiamond")
	slot0._textDiamond = slot0._btnImpeach:getChildByName("textDiamond")

	slot0._textDiamond:setString(50)
end

function GuildImpeachPostWindow.register_event(slot0)
	slot0.close_btn:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended then
			playCloseSound()
			uv0:openGuildImpeachPostWindow(false)
		end
	end)
	registerButtonEventListener(slot0.background, function ()
		uv0:openGuildImpeachPostWindow(false)
	end, false, 2)
	slot0._btnImpeach:addTouchEventListener(function (slot0, slot1)
		customClickAction(slot0, slot1)

		if slot1 == ccui.TouchEventType.ended then
			playButtonSound2()
			uv0:send13565()
			uv0:openGuildImpeachPostWindow(false)
		end
	end)
end

function GuildImpeachPostWindow.openRootWnd(slot0)
	if slot0._notice then
		slot0._notice:setString(TI18N("该会长决心归隐田园，现急需有志之士担当公会重任。弹劾会长后，您将成为新的会长。"))
	end

	createSprite(string.format("resource/item/%d.png", Config.GuildData.data_const.impeach_gold.val[1][1]), 28, 33, slot0._btnImpeach, cc.p(0.5, 0.5), LOADTEXT_TYPE):setScale(0.3)
	slot0._textDiamond:setString(Config.GuildData.data_const.impeach_gold.val[1][2])
end

function GuildImpeachPostWindow.close_callback(slot0)
	uv0:openGuildImpeachPostWindow(false)
end
